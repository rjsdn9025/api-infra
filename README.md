# api-infra

## 인프라 구성
![제목 없는 다이어그램 (1)](https://github.com/user-attachments/assets/6fad8d48-6883-4544-b93b-27c073d32c0f)

#### 목표
1. Api-server 구현 및 DB CRUD 구현 
   - Nodejs로 API-SERVER 구현 및 도커 이미지 만들기
2. minikube로 쿠버네티스 환경구성 후 테라폼으로 먼저 배포 
   - Mysql:8.0 도커 이미지로 DB 생성
   - pv, pvc 서비스 추가로 DB 데이터 보존
3. Api-server helm chart로 배포 
   - api-server 버전 관리
4. Prometheus monitoring 환경 구축
5. DB pasaword 하드코딩한 부분 보안 문제 해결


### 인프라 구축 결과
#### Api-server 구현 및 DB CRUD 구현 (Api-server github링크 참고)
github 링크 : [Api-server nodejs](https://github.com/rjsdn9025/api-server)

#### health Check
<img width="592" alt="스크린샷 2024-07-28 오후 8 11 19" src="https://github.com/user-attachments/assets/39c68081-eb7d-4e25-99d2-b699f20a3f91">


#### Insert
<img width="1507" alt="스크린샷 2024-07-28 오후 8 10 13" src="https://github.com/user-attachments/assets/846b07d6-6638-43f1-bfbc-2203428368ca">

##### Insert 확인
<img width="1510" alt="스크린샷 2024-07-28 오후 8 10 59" src="https://github.com/user-attachments/assets/a9a1c38d-4746-4b80-89bd-57a49a7afa48">

#### Update
<img width="1510" alt="스크린샷 2024-07-28 오후 8 12 45" src="https://github.com/user-attachments/assets/5a58c968-24d9-4fcc-a392-9048fa428b1e">

#### Update 확인
<img width="1503" alt="스크린샷 2024-07-28 오후 8 13 18" src="https://github.com/user-attachments/assets/f70ba871-c00c-4cd0-b148-2d7e0686089c">

#### Delete 
<img width="749" alt="스크린샷 2024-07-28 오후 8 14 21" src="https://github.com/user-attachments/assets/a957aaee-0fef-4c0e-be94-287f67830d48">

#### Delete 확인
<img width="1500" alt="스크린샷 2024-07-28 오후 8 14 30" src="https://github.com/user-attachments/assets/6f3c5967-d85c-4cde-95be-fae38baf37c7">



#### minikube로 쿠버네티스 환경구성 후 테라폼으로 먼저 배포
![kubeService](https://github.com/user-attachments/assets/d1c4fd33-d5eb-4061-bf60-0abd3fc56e87)
##### pv,pvc 서비스 추가
![pv,pvc](https://github.com/user-attachments/assets/d9f3fe33-629d-4165-9eec-eeb00f22b0cb)


#### Api-server helm chart로 배포
github 링크 : [Api-server helm chart](https://github.com/rjsdn9025/api-infra/tree/master/api-server)

#### Api-server helm 파일 수정 후 재배포
<img width="1033" alt="스크린샷 2024-07-28 오후 11 25 54" src="https://github.com/user-attachments/assets/3f676d2a-24a3-4a10-acf0-afd26aca7f08">


#### Prometheus monitoring 환경 구축 - 실패
<img width="1033" alt="스크린샷 2024-07-28 오후 11 25 54" src="https://github.com/user-attachments/assets/72c2fc2c-222a-4711-bffd-45c61890aa44">
-> 프로메테우스 모니터링 환경을 구축하여 api-server모니터링서비스 생성

<img width="717" alt="스크린샷 2024-07-28 오후 11 36 35" src="https://github.com/user-attachments/assets/ffb8c9aa-b2e1-4c85-bff6-a97231748dff">
-> 타겟을 찾지 못함 - 실패!!!!!!!!

#### DB password 보안 문제 해결 - 실패
<img width="698" alt="스크린샷 2024-07-28 오후 11 40 01" src="https://github.com/user-attachments/assets/8cb47d24-2d0c-4778-813e-603382561022">
terraform secret service로 DB_Deployment 리소스에 secret 참조하여 테스트 해봤지만 계속 실패;;
