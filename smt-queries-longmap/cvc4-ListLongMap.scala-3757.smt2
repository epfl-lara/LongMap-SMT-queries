; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51540 () Bool)

(assert start!51540)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!324923 () Bool)

(declare-fun b!563953 () Bool)

(declare-datatypes ((array!35405 0))(
  ( (array!35406 (arr!17003 (Array (_ BitVec 32) (_ BitVec 64))) (size!17367 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35405)

(declare-datatypes ((SeekEntryResult!5452 0))(
  ( (MissingZero!5452 (index!24035 (_ BitVec 32))) (Found!5452 (index!24036 (_ BitVec 32))) (Intermediate!5452 (undefined!6264 Bool) (index!24037 (_ BitVec 32)) (x!52915 (_ BitVec 32))) (Undefined!5452) (MissingVacant!5452 (index!24038 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35405 (_ BitVec 32)) SeekEntryResult!5452)

(assert (=> b!563953 (= e!324923 (= (seekEntryOrOpen!0 (select (arr!17003 a!3118) j!142) a!3118 mask!3119) (Found!5452 j!142)))))

(declare-fun res!355105 () Bool)

(declare-fun e!324920 () Bool)

(assert (=> start!51540 (=> (not res!355105) (not e!324920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51540 (= res!355105 (validMask!0 mask!3119))))

(assert (=> start!51540 e!324920))

(assert (=> start!51540 true))

(declare-fun array_inv!12799 (array!35405) Bool)

(assert (=> start!51540 (array_inv!12799 a!3118)))

(declare-fun b!563954 () Bool)

(declare-fun res!355108 () Bool)

(assert (=> b!563954 (=> (not res!355108) (not e!324920))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563954 (= res!355108 (validKeyInArray!0 k!1914))))

(declare-fun b!563955 () Bool)

(declare-fun res!355115 () Bool)

(assert (=> b!563955 (=> (not res!355115) (not e!324920))))

(declare-fun arrayContainsKey!0 (array!35405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563955 (= res!355115 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563956 () Bool)

(declare-fun e!324924 () Bool)

(declare-fun e!324919 () Bool)

(assert (=> b!563956 (= e!324924 (not e!324919))))

(declare-fun res!355112 () Bool)

(assert (=> b!563956 (=> res!355112 e!324919)))

(declare-fun lt!257407 () SeekEntryResult!5452)

(declare-fun lt!257406 () Bool)

(assert (=> b!563956 (= res!355112 (or (and (not lt!257406) (undefined!6264 lt!257407)) (and (not lt!257406) (not (undefined!6264 lt!257407))) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!563956 (= lt!257406 (not (is-Intermediate!5452 lt!257407)))))

(assert (=> b!563956 e!324923))

(declare-fun res!355107 () Bool)

(assert (=> b!563956 (=> (not res!355107) (not e!324923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35405 (_ BitVec 32)) Bool)

(assert (=> b!563956 (= res!355107 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17678 0))(
  ( (Unit!17679) )
))
(declare-fun lt!257403 () Unit!17678)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35405 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17678)

(assert (=> b!563956 (= lt!257403 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563957 () Bool)

(declare-fun res!355111 () Bool)

(declare-fun e!324921 () Bool)

(assert (=> b!563957 (=> (not res!355111) (not e!324921))))

(declare-datatypes ((List!11083 0))(
  ( (Nil!11080) (Cons!11079 (h!12082 (_ BitVec 64)) (t!17311 List!11083)) )
))
(declare-fun arrayNoDuplicates!0 (array!35405 (_ BitVec 32) List!11083) Bool)

(assert (=> b!563957 (= res!355111 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11080))))

(declare-fun b!563958 () Bool)

(declare-fun res!355114 () Bool)

(assert (=> b!563958 (=> (not res!355114) (not e!324921))))

(assert (=> b!563958 (= res!355114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563959 () Bool)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563959 (= e!324919 (validKeyInArray!0 (select (store (arr!17003 a!3118) i!1132 k!1914) j!142)))))

(declare-fun b!563960 () Bool)

(assert (=> b!563960 (= e!324920 e!324921)))

(declare-fun res!355109 () Bool)

(assert (=> b!563960 (=> (not res!355109) (not e!324921))))

(declare-fun lt!257402 () SeekEntryResult!5452)

(assert (=> b!563960 (= res!355109 (or (= lt!257402 (MissingZero!5452 i!1132)) (= lt!257402 (MissingVacant!5452 i!1132))))))

(assert (=> b!563960 (= lt!257402 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563961 () Bool)

(assert (=> b!563961 (= e!324921 e!324924)))

(declare-fun res!355113 () Bool)

(assert (=> b!563961 (=> (not res!355113) (not e!324924))))

(declare-fun lt!257405 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35405 (_ BitVec 32)) SeekEntryResult!5452)

(assert (=> b!563961 (= res!355113 (= lt!257407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257405 (select (store (arr!17003 a!3118) i!1132 k!1914) j!142) (array!35406 (store (arr!17003 a!3118) i!1132 k!1914) (size!17367 a!3118)) mask!3119)))))

(declare-fun lt!257404 () (_ BitVec 32))

(assert (=> b!563961 (= lt!257407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257404 (select (arr!17003 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563961 (= lt!257405 (toIndex!0 (select (store (arr!17003 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!563961 (= lt!257404 (toIndex!0 (select (arr!17003 a!3118) j!142) mask!3119))))

(declare-fun b!563962 () Bool)

(declare-fun res!355110 () Bool)

(assert (=> b!563962 (=> (not res!355110) (not e!324920))))

(assert (=> b!563962 (= res!355110 (and (= (size!17367 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17367 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17367 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563963 () Bool)

(declare-fun res!355106 () Bool)

(assert (=> b!563963 (=> (not res!355106) (not e!324920))))

(assert (=> b!563963 (= res!355106 (validKeyInArray!0 (select (arr!17003 a!3118) j!142)))))

(assert (= (and start!51540 res!355105) b!563962))

(assert (= (and b!563962 res!355110) b!563963))

(assert (= (and b!563963 res!355106) b!563954))

(assert (= (and b!563954 res!355108) b!563955))

(assert (= (and b!563955 res!355115) b!563960))

(assert (= (and b!563960 res!355109) b!563958))

(assert (= (and b!563958 res!355114) b!563957))

(assert (= (and b!563957 res!355111) b!563961))

(assert (= (and b!563961 res!355113) b!563956))

(assert (= (and b!563956 res!355107) b!563953))

(assert (= (and b!563956 (not res!355112)) b!563959))

(declare-fun m!542395 () Bool)

(assert (=> b!563960 m!542395))

(declare-fun m!542397 () Bool)

(assert (=> b!563963 m!542397))

(assert (=> b!563963 m!542397))

(declare-fun m!542399 () Bool)

(assert (=> b!563963 m!542399))

(assert (=> b!563961 m!542397))

(declare-fun m!542401 () Bool)

(assert (=> b!563961 m!542401))

(assert (=> b!563961 m!542397))

(declare-fun m!542403 () Bool)

(assert (=> b!563961 m!542403))

(assert (=> b!563961 m!542403))

(declare-fun m!542405 () Bool)

(assert (=> b!563961 m!542405))

(assert (=> b!563961 m!542397))

(declare-fun m!542407 () Bool)

(assert (=> b!563961 m!542407))

(declare-fun m!542409 () Bool)

(assert (=> b!563961 m!542409))

(assert (=> b!563961 m!542403))

(declare-fun m!542411 () Bool)

(assert (=> b!563961 m!542411))

(declare-fun m!542413 () Bool)

(assert (=> b!563955 m!542413))

(assert (=> b!563959 m!542409))

(assert (=> b!563959 m!542403))

(assert (=> b!563959 m!542403))

(declare-fun m!542415 () Bool)

(assert (=> b!563959 m!542415))

(declare-fun m!542417 () Bool)

(assert (=> start!51540 m!542417))

(declare-fun m!542419 () Bool)

(assert (=> start!51540 m!542419))

(declare-fun m!542421 () Bool)

(assert (=> b!563958 m!542421))

(declare-fun m!542423 () Bool)

(assert (=> b!563957 m!542423))

(declare-fun m!542425 () Bool)

(assert (=> b!563956 m!542425))

(declare-fun m!542427 () Bool)

(assert (=> b!563956 m!542427))

(assert (=> b!563953 m!542397))

(assert (=> b!563953 m!542397))

(declare-fun m!542429 () Bool)

(assert (=> b!563953 m!542429))

(declare-fun m!542431 () Bool)

(assert (=> b!563954 m!542431))

(push 1)

(assert (not b!563956))

(assert (not start!51540))

(assert (not b!563960))

(assert (not b!563958))

(assert (not b!563955))

(assert (not b!563963))

(assert (not b!563953))

(assert (not b!563961))

(assert (not b!563954))

(assert (not b!563957))

(assert (not b!563959))

(check-sat)

(pop 1)

(push 1)

(check-sat)

