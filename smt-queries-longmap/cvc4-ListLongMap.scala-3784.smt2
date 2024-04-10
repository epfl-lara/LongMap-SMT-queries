; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51762 () Bool)

(assert start!51762)

(declare-fun b!566423 () Bool)

(declare-fun res!357396 () Bool)

(declare-fun e!325962 () Bool)

(assert (=> b!566423 (=> (not res!357396) (not e!325962))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566423 (= res!357396 (validKeyInArray!0 k!1914))))

(declare-fun b!566424 () Bool)

(declare-fun res!357394 () Bool)

(declare-fun e!325963 () Bool)

(assert (=> b!566424 (=> (not res!357394) (not e!325963))))

(declare-datatypes ((array!35570 0))(
  ( (array!35571 (arr!17084 (Array (_ BitVec 32) (_ BitVec 64))) (size!17448 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35570)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35570 (_ BitVec 32)) Bool)

(assert (=> b!566424 (= res!357394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566425 () Bool)

(declare-fun res!357393 () Bool)

(assert (=> b!566425 (=> (not res!357393) (not e!325962))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!566425 (= res!357393 (and (= (size!17448 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17448 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17448 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566426 () Bool)

(declare-fun e!325965 () Bool)

(assert (=> b!566426 (= e!325963 e!325965)))

(declare-fun res!357398 () Bool)

(assert (=> b!566426 (=> (not res!357398) (not e!325965))))

(declare-fun lt!258139 () (_ BitVec 32))

(declare-fun lt!258137 () array!35570)

(declare-datatypes ((SeekEntryResult!5533 0))(
  ( (MissingZero!5533 (index!24359 (_ BitVec 32))) (Found!5533 (index!24360 (_ BitVec 32))) (Intermediate!5533 (undefined!6345 Bool) (index!24361 (_ BitVec 32)) (x!53218 (_ BitVec 32))) (Undefined!5533) (MissingVacant!5533 (index!24362 (_ BitVec 32))) )
))
(declare-fun lt!258136 () SeekEntryResult!5533)

(declare-fun lt!258132 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35570 (_ BitVec 32)) SeekEntryResult!5533)

(assert (=> b!566426 (= res!357398 (= lt!258136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258139 lt!258132 lt!258137 mask!3119)))))

(declare-fun lt!258134 () (_ BitVec 32))

(assert (=> b!566426 (= lt!258136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258134 (select (arr!17084 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566426 (= lt!258139 (toIndex!0 lt!258132 mask!3119))))

(assert (=> b!566426 (= lt!258132 (select (store (arr!17084 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!566426 (= lt!258134 (toIndex!0 (select (arr!17084 a!3118) j!142) mask!3119))))

(assert (=> b!566426 (= lt!258137 (array!35571 (store (arr!17084 a!3118) i!1132 k!1914) (size!17448 a!3118)))))

(declare-fun b!566427 () Bool)

(declare-fun res!357400 () Bool)

(assert (=> b!566427 (=> (not res!357400) (not e!325962))))

(declare-fun arrayContainsKey!0 (array!35570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566427 (= res!357400 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun e!325964 () Bool)

(declare-fun b!566428 () Bool)

(declare-fun lt!258138 () SeekEntryResult!5533)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35570 (_ BitVec 32)) SeekEntryResult!5533)

(assert (=> b!566428 (= e!325964 (= lt!258138 (seekEntryOrOpen!0 lt!258132 lt!258137 mask!3119)))))

(declare-fun b!566429 () Bool)

(assert (=> b!566429 (= e!325965 (not e!325964))))

(declare-fun res!357401 () Bool)

(assert (=> b!566429 (=> res!357401 e!325964)))

(assert (=> b!566429 (= res!357401 (or (not (is-Intermediate!5533 lt!258136)) (not (undefined!6345 lt!258136))))))

(assert (=> b!566429 (= lt!258138 (Found!5533 j!142))))

(assert (=> b!566429 (= lt!258138 (seekEntryOrOpen!0 (select (arr!17084 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!566429 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17768 0))(
  ( (Unit!17769) )
))
(declare-fun lt!258133 () Unit!17768)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17768)

(assert (=> b!566429 (= lt!258133 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566430 () Bool)

(declare-fun res!357399 () Bool)

(assert (=> b!566430 (=> (not res!357399) (not e!325962))))

(assert (=> b!566430 (= res!357399 (validKeyInArray!0 (select (arr!17084 a!3118) j!142)))))

(declare-fun res!357392 () Bool)

(assert (=> start!51762 (=> (not res!357392) (not e!325962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51762 (= res!357392 (validMask!0 mask!3119))))

(assert (=> start!51762 e!325962))

(assert (=> start!51762 true))

(declare-fun array_inv!12880 (array!35570) Bool)

(assert (=> start!51762 (array_inv!12880 a!3118)))

(declare-fun b!566431 () Bool)

(declare-fun res!357397 () Bool)

(assert (=> b!566431 (=> (not res!357397) (not e!325963))))

(declare-datatypes ((List!11164 0))(
  ( (Nil!11161) (Cons!11160 (h!12166 (_ BitVec 64)) (t!17392 List!11164)) )
))
(declare-fun arrayNoDuplicates!0 (array!35570 (_ BitVec 32) List!11164) Bool)

(assert (=> b!566431 (= res!357397 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11161))))

(declare-fun b!566432 () Bool)

(assert (=> b!566432 (= e!325962 e!325963)))

(declare-fun res!357395 () Bool)

(assert (=> b!566432 (=> (not res!357395) (not e!325963))))

(declare-fun lt!258135 () SeekEntryResult!5533)

(assert (=> b!566432 (= res!357395 (or (= lt!258135 (MissingZero!5533 i!1132)) (= lt!258135 (MissingVacant!5533 i!1132))))))

(assert (=> b!566432 (= lt!258135 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!51762 res!357392) b!566425))

(assert (= (and b!566425 res!357393) b!566430))

(assert (= (and b!566430 res!357399) b!566423))

(assert (= (and b!566423 res!357396) b!566427))

(assert (= (and b!566427 res!357400) b!566432))

(assert (= (and b!566432 res!357395) b!566424))

(assert (= (and b!566424 res!357394) b!566431))

(assert (= (and b!566431 res!357397) b!566426))

(assert (= (and b!566426 res!357398) b!566429))

(assert (= (and b!566429 (not res!357401)) b!566428))

(declare-fun m!545083 () Bool)

(assert (=> b!566429 m!545083))

(assert (=> b!566429 m!545083))

(declare-fun m!545085 () Bool)

(assert (=> b!566429 m!545085))

(declare-fun m!545087 () Bool)

(assert (=> b!566429 m!545087))

(declare-fun m!545089 () Bool)

(assert (=> b!566429 m!545089))

(declare-fun m!545091 () Bool)

(assert (=> b!566424 m!545091))

(declare-fun m!545093 () Bool)

(assert (=> b!566423 m!545093))

(declare-fun m!545095 () Bool)

(assert (=> start!51762 m!545095))

(declare-fun m!545097 () Bool)

(assert (=> start!51762 m!545097))

(declare-fun m!545099 () Bool)

(assert (=> b!566428 m!545099))

(declare-fun m!545101 () Bool)

(assert (=> b!566432 m!545101))

(declare-fun m!545103 () Bool)

(assert (=> b!566431 m!545103))

(assert (=> b!566430 m!545083))

(assert (=> b!566430 m!545083))

(declare-fun m!545105 () Bool)

(assert (=> b!566430 m!545105))

(declare-fun m!545107 () Bool)

(assert (=> b!566427 m!545107))

(assert (=> b!566426 m!545083))

(declare-fun m!545109 () Bool)

(assert (=> b!566426 m!545109))

(assert (=> b!566426 m!545083))

(declare-fun m!545111 () Bool)

(assert (=> b!566426 m!545111))

(assert (=> b!566426 m!545083))

(declare-fun m!545113 () Bool)

(assert (=> b!566426 m!545113))

(declare-fun m!545115 () Bool)

(assert (=> b!566426 m!545115))

(declare-fun m!545117 () Bool)

(assert (=> b!566426 m!545117))

(declare-fun m!545119 () Bool)

(assert (=> b!566426 m!545119))

(push 1)

(assert (not b!566431))

(assert (not b!566424))

(assert (not b!566432))

(assert (not b!566429))

(assert (not b!566427))

(assert (not b!566430))

(assert (not b!566426))

(assert (not b!566428))

(assert (not start!51762))

(assert (not b!566423))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!566491 () Bool)

(declare-fun e!326004 () SeekEntryResult!5533)

(declare-fun e!326003 () SeekEntryResult!5533)

(assert (=> b!566491 (= e!326004 e!326003)))

(declare-fun lt!258178 () (_ BitVec 64))

(declare-fun lt!258177 () SeekEntryResult!5533)

(assert (=> b!566491 (= lt!258178 (select (arr!17084 lt!258137) (index!24361 lt!258177)))))

(declare-fun c!64885 () Bool)

(assert (=> b!566491 (= c!64885 (= lt!258178 lt!258132))))

(declare-fun b!566492 () Bool)

(assert (=> b!566492 (= e!326004 Undefined!5533)))

(declare-fun b!566493 () Bool)

(assert (=> b!566493 (= e!326003 (Found!5533 (index!24361 lt!258177)))))

(declare-fun b!566494 () Bool)

(declare-fun c!64887 () Bool)

(assert (=> b!566494 (= c!64887 (= lt!258178 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326002 () SeekEntryResult!5533)

(assert (=> b!566494 (= e!326003 e!326002)))

(declare-fun b!566495 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35570 (_ BitVec 32)) SeekEntryResult!5533)

(assert (=> b!566495 (= e!326002 (seekKeyOrZeroReturnVacant!0 (x!53218 lt!258177) (index!24361 lt!258177) (index!24361 lt!258177) lt!258132 lt!258137 mask!3119))))

(declare-fun d!84095 () Bool)

(declare-fun lt!258176 () SeekEntryResult!5533)

(assert (=> d!84095 (and (or (is-Undefined!5533 lt!258176) (not (is-Found!5533 lt!258176)) (and (bvsge (index!24360 lt!258176) #b00000000000000000000000000000000) (bvslt (index!24360 lt!258176) (size!17448 lt!258137)))) (or (is-Undefined!5533 lt!258176) (is-Found!5533 lt!258176) (not (is-MissingZero!5533 lt!258176)) (and (bvsge (index!24359 lt!258176) #b00000000000000000000000000000000) (bvslt (index!24359 lt!258176) (size!17448 lt!258137)))) (or (is-Undefined!5533 lt!258176) (is-Found!5533 lt!258176) (is-MissingZero!5533 lt!258176) (not (is-MissingVacant!5533 lt!258176)) (and (bvsge (index!24362 lt!258176) #b00000000000000000000000000000000) (bvslt (index!24362 lt!258176) (size!17448 lt!258137)))) (or (is-Undefined!5533 lt!258176) (ite (is-Found!5533 lt!258176) (= (select (arr!17084 lt!258137) (index!24360 lt!258176)) lt!258132) (ite (is-MissingZero!5533 lt!258176) (= (select (arr!17084 lt!258137) (index!24359 lt!258176)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5533 lt!258176) (= (select (arr!17084 lt!258137) (index!24362 lt!258176)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84095 (= lt!258176 e!326004)))

(declare-fun c!64886 () Bool)

(assert (=> d!84095 (= c!64886 (and (is-Intermediate!5533 lt!258177) (undefined!6345 lt!258177)))))

(assert (=> d!84095 (= lt!258177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!258132 mask!3119) lt!258132 lt!258137 mask!3119))))

(assert (=> d!84095 (validMask!0 mask!3119)))

(assert (=> d!84095 (= (seekEntryOrOpen!0 lt!258132 lt!258137 mask!3119) lt!258176)))

(declare-fun b!566496 () Bool)

(assert (=> b!566496 (= e!326002 (MissingZero!5533 (index!24361 lt!258177)))))

(assert (= (and d!84095 c!64886) b!566492))

(assert (= (and d!84095 (not c!64886)) b!566491))

(assert (= (and b!566491 c!64885) b!566493))

(assert (= (and b!566491 (not c!64885)) b!566494))

(assert (= (and b!566494 c!64887) b!566496))

(assert (= (and b!566494 (not c!64887)) b!566495))

(declare-fun m!545163 () Bool)

(assert (=> b!566491 m!545163))

(declare-fun m!545165 () Bool)

(assert (=> b!566495 m!545165))

(declare-fun m!545167 () Bool)

(assert (=> d!84095 m!545167))

(assert (=> d!84095 m!545095))

(assert (=> d!84095 m!545119))

(assert (=> d!84095 m!545119))

(declare-fun m!545169 () Bool)

(assert (=> d!84095 m!545169))

(declare-fun m!545171 () Bool)

(assert (=> d!84095 m!545171))

(declare-fun m!545173 () Bool)

(assert (=> d!84095 m!545173))

(assert (=> b!566428 d!84095))

(declare-fun d!84105 () Bool)

(declare-fun res!357420 () Bool)

(declare-fun e!326012 () Bool)

(assert (=> d!84105 (=> res!357420 e!326012)))

(assert (=> d!84105 (= res!357420 (= (select (arr!17084 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84105 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!326012)))

(declare-fun b!566507 () Bool)

(declare-fun e!326013 () Bool)

(assert (=> b!566507 (= e!326012 e!326013)))

(declare-fun res!357421 () Bool)

(assert (=> b!566507 (=> (not res!357421) (not e!326013))))

(assert (=> b!566507 (= res!357421 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17448 a!3118)))))

(declare-fun b!566508 () Bool)

(assert (=> b!566508 (= e!326013 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84105 (not res!357420)) b!566507))

(assert (= (and b!566507 res!357421) b!566508))

(declare-fun m!545191 () Bool)

(assert (=> d!84105 m!545191))

(declare-fun m!545193 () Bool)

(assert (=> b!566508 m!545193))

(assert (=> b!566427 d!84105))

(declare-fun b!566515 () Bool)

(declare-fun e!326019 () SeekEntryResult!5533)

(declare-fun e!326018 () SeekEntryResult!5533)

(assert (=> b!566515 (= e!326019 e!326018)))

(declare-fun lt!258190 () (_ BitVec 64))

(declare-fun lt!258189 () SeekEntryResult!5533)

(assert (=> b!566515 (= lt!258190 (select (arr!17084 a!3118) (index!24361 lt!258189)))))

(declare-fun c!64894 () Bool)

(assert (=> b!566515 (= c!64894 (= lt!258190 (select (arr!17084 a!3118) j!142)))))

(declare-fun b!566516 () Bool)

(assert (=> b!566516 (= e!326019 Undefined!5533)))

(declare-fun b!566517 () Bool)

(assert (=> b!566517 (= e!326018 (Found!5533 (index!24361 lt!258189)))))

(declare-fun b!566518 () Bool)

(declare-fun c!64896 () Bool)

(assert (=> b!566518 (= c!64896 (= lt!258190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326017 () SeekEntryResult!5533)

(assert (=> b!566518 (= e!326018 e!326017)))

(declare-fun b!566519 () Bool)

(assert (=> b!566519 (= e!326017 (seekKeyOrZeroReturnVacant!0 (x!53218 lt!258189) (index!24361 lt!258189) (index!24361 lt!258189) (select (arr!17084 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!84111 () Bool)

(declare-fun lt!258188 () SeekEntryResult!5533)

(assert (=> d!84111 (and (or (is-Undefined!5533 lt!258188) (not (is-Found!5533 lt!258188)) (and (bvsge (index!24360 lt!258188) #b00000000000000000000000000000000) (bvslt (index!24360 lt!258188) (size!17448 a!3118)))) (or (is-Undefined!5533 lt!258188) (is-Found!5533 lt!258188) (not (is-MissingZero!5533 lt!258188)) (and (bvsge (index!24359 lt!258188) #b00000000000000000000000000000000) (bvslt (index!24359 lt!258188) (size!17448 a!3118)))) (or (is-Undefined!5533 lt!258188) (is-Found!5533 lt!258188) (is-MissingZero!5533 lt!258188) (not (is-MissingVacant!5533 lt!258188)) (and (bvsge (index!24362 lt!258188) #b00000000000000000000000000000000) (bvslt (index!24362 lt!258188) (size!17448 a!3118)))) (or (is-Undefined!5533 lt!258188) (ite (is-Found!5533 lt!258188) (= (select (arr!17084 a!3118) (index!24360 lt!258188)) (select (arr!17084 a!3118) j!142)) (ite (is-MissingZero!5533 lt!258188) (= (select (arr!17084 a!3118) (index!24359 lt!258188)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5533 lt!258188) (= (select (arr!17084 a!3118) (index!24362 lt!258188)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84111 (= lt!258188 e!326019)))

(declare-fun c!64895 () Bool)

(assert (=> d!84111 (= c!64895 (and (is-Intermediate!5533 lt!258189) (undefined!6345 lt!258189)))))

(assert (=> d!84111 (= lt!258189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17084 a!3118) j!142) mask!3119) (select (arr!17084 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84111 (validMask!0 mask!3119)))

(assert (=> d!84111 (= (seekEntryOrOpen!0 (select (arr!17084 a!3118) j!142) a!3118 mask!3119) lt!258188)))

(declare-fun b!566520 () Bool)

(assert (=> b!566520 (= e!326017 (MissingZero!5533 (index!24361 lt!258189)))))

(assert (= (and d!84111 c!64895) b!566516))

(assert (= (and d!84111 (not c!64895)) b!566515))

(assert (= (and b!566515 c!64894) b!566517))

(assert (= (and b!566515 (not c!64894)) b!566518))

(assert (= (and b!566518 c!64896) b!566520))

(assert (= (and b!566518 (not c!64896)) b!566519))

(declare-fun m!545207 () Bool)

(assert (=> b!566515 m!545207))

(assert (=> b!566519 m!545083))

(declare-fun m!545209 () Bool)

(assert (=> b!566519 m!545209))

(declare-fun m!545211 () Bool)

(assert (=> d!84111 m!545211))

(assert (=> d!84111 m!545095))

(assert (=> d!84111 m!545083))

(assert (=> d!84111 m!545111))

(assert (=> d!84111 m!545111))

(assert (=> d!84111 m!545083))

(declare-fun m!545213 () Bool)

(assert (=> d!84111 m!545213))

(declare-fun m!545215 () Bool)

(assert (=> d!84111 m!545215))

(declare-fun m!545217 () Bool)

(assert (=> d!84111 m!545217))

(assert (=> b!566429 d!84111))

(declare-fun b!566537 () Bool)

(declare-fun e!326032 () Bool)

(declare-fun e!326031 () Bool)

(assert (=> b!566537 (= e!326032 e!326031)))

(declare-fun c!64903 () Bool)

(assert (=> b!566537 (= c!64903 (validKeyInArray!0 (select (arr!17084 a!3118) j!142)))))

(declare-fun b!566538 () Bool)

(declare-fun e!326030 () Bool)

(assert (=> b!566538 (= e!326031 e!326030)))

(declare-fun lt!258203 () (_ BitVec 64))

(assert (=> b!566538 (= lt!258203 (select (arr!17084 a!3118) j!142))))

(declare-fun lt!258201 () Unit!17768)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35570 (_ BitVec 64) (_ BitVec 32)) Unit!17768)

(assert (=> b!566538 (= lt!258201 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258203 j!142))))

(assert (=> b!566538 (arrayContainsKey!0 a!3118 lt!258203 #b00000000000000000000000000000000)))

(declare-fun lt!258202 () Unit!17768)

(assert (=> b!566538 (= lt!258202 lt!258201)))

(declare-fun res!357427 () Bool)

(assert (=> b!566538 (= res!357427 (= (seekEntryOrOpen!0 (select (arr!17084 a!3118) j!142) a!3118 mask!3119) (Found!5533 j!142)))))

(assert (=> b!566538 (=> (not res!357427) (not e!326030))))

(declare-fun d!84115 () Bool)

(declare-fun res!357426 () Bool)

(assert (=> d!84115 (=> res!357426 e!326032)))

(assert (=> d!84115 (= res!357426 (bvsge j!142 (size!17448 a!3118)))))

(assert (=> d!84115 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326032)))

(declare-fun b!566539 () Bool)

(declare-fun call!32487 () Bool)

(assert (=> b!566539 (= e!326030 call!32487)))

(declare-fun bm!32484 () Bool)

(assert (=> bm!32484 (= call!32487 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!566540 () Bool)

(assert (=> b!566540 (= e!326031 call!32487)))

(assert (= (and d!84115 (not res!357426)) b!566537))

(assert (= (and b!566537 c!64903) b!566538))

(assert (= (and b!566537 (not c!64903)) b!566540))

(assert (= (and b!566538 res!357427) b!566539))

(assert (= (or b!566539 b!566540) bm!32484))

(assert (=> b!566537 m!545083))

(assert (=> b!566537 m!545083))

(assert (=> b!566537 m!545105))

(assert (=> b!566538 m!545083))

(declare-fun m!545219 () Bool)

(assert (=> b!566538 m!545219))

(declare-fun m!545221 () Bool)

(assert (=> b!566538 m!545221))

(assert (=> b!566538 m!545083))

(assert (=> b!566538 m!545085))

(declare-fun m!545223 () Bool)

(assert (=> bm!32484 m!545223))

(assert (=> b!566429 d!84115))

(declare-fun d!84119 () Bool)

(assert (=> d!84119 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258208 () Unit!17768)

(declare-fun choose!38 (array!35570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17768)

(assert (=> d!84119 (= lt!258208 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84119 (validMask!0 mask!3119)))

(assert (=> d!84119 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258208)))

(declare-fun bs!17597 () Bool)

(assert (= bs!17597 d!84119))

(assert (=> bs!17597 m!545087))

(declare-fun m!545225 () Bool)

(assert (=> bs!17597 m!545225))

(assert (=> bs!17597 m!545095))

(assert (=> b!566429 d!84119))

(declare-fun d!84121 () Bool)

(assert (=> d!84121 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51762 d!84121))

(declare-fun d!84135 () Bool)

(assert (=> d!84135 (= (array_inv!12880 a!3118) (bvsge (size!17448 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51762 d!84135))

(declare-fun b!566605 () Bool)

(declare-fun e!326071 () Bool)

(declare-fun e!326070 () Bool)

(assert (=> b!566605 (= e!326071 e!326070)))

(declare-fun c!64924 () Bool)

(assert (=> b!566605 (= c!64924 (validKeyInArray!0 (select (arr!17084 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566606 () Bool)

(declare-fun e!326069 () Bool)

(assert (=> b!566606 (= e!326070 e!326069)))

(declare-fun lt!258229 () (_ BitVec 64))

(assert (=> b!566606 (= lt!258229 (select (arr!17084 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258227 () Unit!17768)

(assert (=> b!566606 (= lt!258227 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258229 #b00000000000000000000000000000000))))

(assert (=> b!566606 (arrayContainsKey!0 a!3118 lt!258229 #b00000000000000000000000000000000)))

(declare-fun lt!258228 () Unit!17768)

(assert (=> b!566606 (= lt!258228 lt!258227)))

(declare-fun res!357455 () Bool)

(assert (=> b!566606 (= res!357455 (= (seekEntryOrOpen!0 (select (arr!17084 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5533 #b00000000000000000000000000000000)))))

(assert (=> b!566606 (=> (not res!357455) (not e!326069))))

(declare-fun d!84137 () Bool)

(declare-fun res!357454 () Bool)

(assert (=> d!84137 (=> res!357454 e!326071)))

(assert (=> d!84137 (= res!357454 (bvsge #b00000000000000000000000000000000 (size!17448 a!3118)))))

(assert (=> d!84137 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!326071)))

(declare-fun b!566607 () Bool)

(declare-fun call!32488 () Bool)

(assert (=> b!566607 (= e!326069 call!32488)))

(declare-fun bm!32485 () Bool)

(assert (=> bm!32485 (= call!32488 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!566608 () Bool)

(assert (=> b!566608 (= e!326070 call!32488)))

(assert (= (and d!84137 (not res!357454)) b!566605))

(assert (= (and b!566605 c!64924) b!566606))

(assert (= (and b!566605 (not c!64924)) b!566608))

(assert (= (and b!566606 res!357455) b!566607))

(assert (= (or b!566607 b!566608) bm!32485))

(assert (=> b!566605 m!545191))

(assert (=> b!566605 m!545191))

(declare-fun m!545259 () Bool)

(assert (=> b!566605 m!545259))

(assert (=> b!566606 m!545191))

(declare-fun m!545261 () Bool)

(assert (=> b!566606 m!545261))

(declare-fun m!545263 () Bool)

(assert (=> b!566606 m!545263))

(assert (=> b!566606 m!545191))

(declare-fun m!545265 () Bool)

(assert (=> b!566606 m!545265))

(declare-fun m!545267 () Bool)

(assert (=> bm!32485 m!545267))

(assert (=> b!566424 d!84137))

(declare-fun d!84139 () Bool)

(assert (=> d!84139 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566423 d!84139))

(declare-fun d!84141 () Bool)

(assert (=> d!84141 (= (validKeyInArray!0 (select (arr!17084 a!3118) j!142)) (and (not (= (select (arr!17084 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17084 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566430 d!84141))

(declare-fun b!566609 () Bool)

(declare-fun e!326074 () SeekEntryResult!5533)

(declare-fun e!326073 () SeekEntryResult!5533)

(assert (=> b!566609 (= e!326074 e!326073)))

(declare-fun lt!258232 () (_ BitVec 64))

(declare-fun lt!258231 () SeekEntryResult!5533)

(assert (=> b!566609 (= lt!258232 (select (arr!17084 a!3118) (index!24361 lt!258231)))))

(declare-fun c!64925 () Bool)

(assert (=> b!566609 (= c!64925 (= lt!258232 k!1914))))

(declare-fun b!566610 () Bool)

(assert (=> b!566610 (= e!326074 Undefined!5533)))

(declare-fun b!566611 () Bool)

(assert (=> b!566611 (= e!326073 (Found!5533 (index!24361 lt!258231)))))

(declare-fun b!566612 () Bool)

(declare-fun c!64927 () Bool)

(assert (=> b!566612 (= c!64927 (= lt!258232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326072 () SeekEntryResult!5533)

(assert (=> b!566612 (= e!326073 e!326072)))

(declare-fun b!566613 () Bool)

(assert (=> b!566613 (= e!326072 (seekKeyOrZeroReturnVacant!0 (x!53218 lt!258231) (index!24361 lt!258231) (index!24361 lt!258231) k!1914 a!3118 mask!3119))))

(declare-fun d!84143 () Bool)

(declare-fun lt!258230 () SeekEntryResult!5533)

(assert (=> d!84143 (and (or (is-Undefined!5533 lt!258230) (not (is-Found!5533 lt!258230)) (and (bvsge (index!24360 lt!258230) #b00000000000000000000000000000000) (bvslt (index!24360 lt!258230) (size!17448 a!3118)))) (or (is-Undefined!5533 lt!258230) (is-Found!5533 lt!258230) (not (is-MissingZero!5533 lt!258230)) (and (bvsge (index!24359 lt!258230) #b00000000000000000000000000000000) (bvslt (index!24359 lt!258230) (size!17448 a!3118)))) (or (is-Undefined!5533 lt!258230) (is-Found!5533 lt!258230) (is-MissingZero!5533 lt!258230) (not (is-MissingVacant!5533 lt!258230)) (and (bvsge (index!24362 lt!258230) #b00000000000000000000000000000000) (bvslt (index!24362 lt!258230) (size!17448 a!3118)))) (or (is-Undefined!5533 lt!258230) (ite (is-Found!5533 lt!258230) (= (select (arr!17084 a!3118) (index!24360 lt!258230)) k!1914) (ite (is-MissingZero!5533 lt!258230) (= (select (arr!17084 a!3118) (index!24359 lt!258230)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5533 lt!258230) (= (select (arr!17084 a!3118) (index!24362 lt!258230)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84143 (= lt!258230 e!326074)))

(declare-fun c!64926 () Bool)

(assert (=> d!84143 (= c!64926 (and (is-Intermediate!5533 lt!258231) (undefined!6345 lt!258231)))))

(assert (=> d!84143 (= lt!258231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!84143 (validMask!0 mask!3119)))

(assert (=> d!84143 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!258230)))

(declare-fun b!566614 () Bool)

(assert (=> b!566614 (= e!326072 (MissingZero!5533 (index!24361 lt!258231)))))

(assert (= (and d!84143 c!64926) b!566610))

(assert (= (and d!84143 (not c!64926)) b!566609))

(assert (= (and b!566609 c!64925) b!566611))

(assert (= (and b!566609 (not c!64925)) b!566612))

(assert (= (and b!566612 c!64927) b!566614))

(assert (= (and b!566612 (not c!64927)) b!566613))

(declare-fun m!545269 () Bool)

(assert (=> b!566609 m!545269))

(declare-fun m!545271 () Bool)

(assert (=> b!566613 m!545271))

(declare-fun m!545273 () Bool)

(assert (=> d!84143 m!545273))

(assert (=> d!84143 m!545095))

(declare-fun m!545275 () Bool)

(assert (=> d!84143 m!545275))

(assert (=> d!84143 m!545275))

(declare-fun m!545277 () Bool)

(assert (=> d!84143 m!545277))

(declare-fun m!545279 () Bool)

(assert (=> d!84143 m!545279))

(declare-fun m!545281 () Bool)

(assert (=> d!84143 m!545281))

(assert (=> b!566432 d!84143))

(declare-fun bm!32488 () Bool)

(declare-fun call!32491 () Bool)

(declare-fun c!64930 () Bool)

(assert (=> bm!32488 (= call!32491 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64930 (Cons!11160 (select (arr!17084 a!3118) #b00000000000000000000000000000000) Nil!11161) Nil!11161)))))

(declare-fun b!566631 () Bool)

(declare-fun e!326091 () Bool)

(assert (=> b!566631 (= e!326091 call!32491)))

(declare-fun b!566632 () Bool)

(declare-fun e!326090 () Bool)

(assert (=> b!566632 (= e!326090 e!326091)))

(assert (=> b!566632 (= c!64930 (validKeyInArray!0 (select (arr!17084 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566633 () Bool)

(declare-fun e!326089 () Bool)

(assert (=> b!566633 (= e!326089 e!326090)))

(declare-fun res!357469 () Bool)

(assert (=> b!566633 (=> (not res!357469) (not e!326090))))

(declare-fun e!326092 () Bool)

(assert (=> b!566633 (= res!357469 (not e!326092))))

(declare-fun res!357470 () Bool)

(assert (=> b!566633 (=> (not res!357470) (not e!326092))))

(assert (=> b!566633 (= res!357470 (validKeyInArray!0 (select (arr!17084 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84145 () Bool)

(declare-fun res!357468 () Bool)

(assert (=> d!84145 (=> res!357468 e!326089)))

(assert (=> d!84145 (= res!357468 (bvsge #b00000000000000000000000000000000 (size!17448 a!3118)))))

(assert (=> d!84145 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11161) e!326089)))

(declare-fun b!566634 () Bool)

(assert (=> b!566634 (= e!326091 call!32491)))

(declare-fun b!566635 () Bool)

(declare-fun contains!2867 (List!11164 (_ BitVec 64)) Bool)

(assert (=> b!566635 (= e!326092 (contains!2867 Nil!11161 (select (arr!17084 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84145 (not res!357468)) b!566633))

(assert (= (and b!566633 res!357470) b!566635))

(assert (= (and b!566633 res!357469) b!566632))

(assert (= (and b!566632 c!64930) b!566631))

(assert (= (and b!566632 (not c!64930)) b!566634))

(assert (= (or b!566631 b!566634) bm!32488))

(assert (=> bm!32488 m!545191))

(declare-fun m!545285 () Bool)

(assert (=> bm!32488 m!545285))

(assert (=> b!566632 m!545191))

(assert (=> b!566632 m!545191))

(assert (=> b!566632 m!545259))

(assert (=> b!566633 m!545191))

(assert (=> b!566633 m!545191))

(assert (=> b!566633 m!545259))

(assert (=> b!566635 m!545191))

(assert (=> b!566635 m!545191))

(declare-fun m!545287 () Bool)

(assert (=> b!566635 m!545287))

(assert (=> b!566431 d!84145))

(declare-fun b!566702 () Bool)

(declare-fun lt!258254 () SeekEntryResult!5533)

(assert (=> b!566702 (and (bvsge (index!24361 lt!258254) #b00000000000000000000000000000000) (bvslt (index!24361 lt!258254) (size!17448 lt!258137)))))

(declare-fun res!357497 () Bool)

(assert (=> b!566702 (= res!357497 (= (select (arr!17084 lt!258137) (index!24361 lt!258254)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326136 () Bool)

(assert (=> b!566702 (=> res!357497 e!326136)))

(declare-fun b!566703 () Bool)

(declare-fun e!326138 () SeekEntryResult!5533)

(assert (=> b!566703 (= e!326138 (Intermediate!5533 false lt!258139 #b00000000000000000000000000000000))))

(declare-fun b!566704 () Bool)

(assert (=> b!566704 (and (bvsge (index!24361 lt!258254) #b00000000000000000000000000000000) (bvslt (index!24361 lt!258254) (size!17448 lt!258137)))))

(assert (=> b!566704 (= e!326136 (= (select (arr!17084 lt!258137) (index!24361 lt!258254)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!566705 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566705 (= e!326138 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258139 #b00000000000000000000000000000000 mask!3119) lt!258132 lt!258137 mask!3119))))

(declare-fun b!566706 () Bool)

(assert (=> b!566706 (and (bvsge (index!24361 lt!258254) #b00000000000000000000000000000000) (bvslt (index!24361 lt!258254) (size!17448 lt!258137)))))

(declare-fun res!357495 () Bool)

(assert (=> b!566706 (= res!357495 (= (select (arr!17084 lt!258137) (index!24361 lt!258254)) lt!258132))))

(assert (=> b!566706 (=> res!357495 e!326136)))

(declare-fun e!326137 () Bool)

(assert (=> b!566706 (= e!326137 e!326136)))

(declare-fun b!566707 () Bool)

(declare-fun e!326139 () SeekEntryResult!5533)

(assert (=> b!566707 (= e!326139 (Intermediate!5533 true lt!258139 #b00000000000000000000000000000000))))

(declare-fun b!566708 () Bool)

(declare-fun e!326140 () Bool)

(assert (=> b!566708 (= e!326140 (bvsge (x!53218 lt!258254) #b01111111111111111111111111111110))))

(declare-fun b!566709 () Bool)

(assert (=> b!566709 (= e!326140 e!326137)))

(declare-fun res!357496 () Bool)

(assert (=> b!566709 (= res!357496 (and (is-Intermediate!5533 lt!258254) (not (undefined!6345 lt!258254)) (bvslt (x!53218 lt!258254) #b01111111111111111111111111111110) (bvsge (x!53218 lt!258254) #b00000000000000000000000000000000) (bvsge (x!53218 lt!258254) #b00000000000000000000000000000000)))))

(assert (=> b!566709 (=> (not res!357496) (not e!326137))))

(declare-fun b!566710 () Bool)

(assert (=> b!566710 (= e!326139 e!326138)))

(declare-fun c!64954 () Bool)

(declare-fun lt!258255 () (_ BitVec 64))

(assert (=> b!566710 (= c!64954 (or (= lt!258255 lt!258132) (= (bvadd lt!258255 lt!258255) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84155 () Bool)

(assert (=> d!84155 e!326140))

(declare-fun c!64953 () Bool)

(assert (=> d!84155 (= c!64953 (and (is-Intermediate!5533 lt!258254) (undefined!6345 lt!258254)))))

(assert (=> d!84155 (= lt!258254 e!326139)))

(declare-fun c!64952 () Bool)

(assert (=> d!84155 (= c!64952 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84155 (= lt!258255 (select (arr!17084 lt!258137) lt!258139))))

(assert (=> d!84155 (validMask!0 mask!3119)))

(assert (=> d!84155 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258139 lt!258132 lt!258137 mask!3119) lt!258254)))

(assert (= (and d!84155 c!64952) b!566707))

(assert (= (and d!84155 (not c!64952)) b!566710))

(assert (= (and b!566710 c!64954) b!566703))

(assert (= (and b!566710 (not c!64954)) b!566705))

(assert (= (and d!84155 c!64953) b!566708))

(assert (= (and d!84155 (not c!64953)) b!566709))

(assert (= (and b!566709 res!357496) b!566706))

(assert (= (and b!566706 (not res!357495)) b!566702))

(assert (= (and b!566702 (not res!357497)) b!566704))

(declare-fun m!545309 () Bool)

(assert (=> b!566704 m!545309))

(assert (=> b!566702 m!545309))

(assert (=> b!566706 m!545309))

(declare-fun m!545311 () Bool)

(assert (=> d!84155 m!545311))

(assert (=> d!84155 m!545095))

(declare-fun m!545313 () Bool)

(assert (=> b!566705 m!545313))

(assert (=> b!566705 m!545313))

(declare-fun m!545315 () Bool)

(assert (=> b!566705 m!545315))

(assert (=> b!566426 d!84155))

(declare-fun b!566711 () Bool)

(declare-fun lt!258256 () SeekEntryResult!5533)

(assert (=> b!566711 (and (bvsge (index!24361 lt!258256) #b00000000000000000000000000000000) (bvslt (index!24361 lt!258256) (size!17448 a!3118)))))

(declare-fun res!357500 () Bool)

(assert (=> b!566711 (= res!357500 (= (select (arr!17084 a!3118) (index!24361 lt!258256)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326141 () Bool)

(assert (=> b!566711 (=> res!357500 e!326141)))

(declare-fun b!566712 () Bool)

(declare-fun e!326143 () SeekEntryResult!5533)

(assert (=> b!566712 (= e!326143 (Intermediate!5533 false lt!258134 #b00000000000000000000000000000000))))

(declare-fun b!566713 () Bool)

(assert (=> b!566713 (and (bvsge (index!24361 lt!258256) #b00000000000000000000000000000000) (bvslt (index!24361 lt!258256) (size!17448 a!3118)))))

(assert (=> b!566713 (= e!326141 (= (select (arr!17084 a!3118) (index!24361 lt!258256)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!566714 () Bool)

(assert (=> b!566714 (= e!326143 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258134 #b00000000000000000000000000000000 mask!3119) (select (arr!17084 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!566715 () Bool)

(assert (=> b!566715 (and (bvsge (index!24361 lt!258256) #b00000000000000000000000000000000) (bvslt (index!24361 lt!258256) (size!17448 a!3118)))))

(declare-fun res!357498 () Bool)

(assert (=> b!566715 (= res!357498 (= (select (arr!17084 a!3118) (index!24361 lt!258256)) (select (arr!17084 a!3118) j!142)))))

(assert (=> b!566715 (=> res!357498 e!326141)))

(declare-fun e!326142 () Bool)

(assert (=> b!566715 (= e!326142 e!326141)))

(declare-fun b!566716 () Bool)

(declare-fun e!326144 () SeekEntryResult!5533)

(assert (=> b!566716 (= e!326144 (Intermediate!5533 true lt!258134 #b00000000000000000000000000000000))))

(declare-fun b!566717 () Bool)

(declare-fun e!326145 () Bool)

(assert (=> b!566717 (= e!326145 (bvsge (x!53218 lt!258256) #b01111111111111111111111111111110))))

(declare-fun b!566718 () Bool)

(assert (=> b!566718 (= e!326145 e!326142)))

(declare-fun res!357499 () Bool)

(assert (=> b!566718 (= res!357499 (and (is-Intermediate!5533 lt!258256) (not (undefined!6345 lt!258256)) (bvslt (x!53218 lt!258256) #b01111111111111111111111111111110) (bvsge (x!53218 lt!258256) #b00000000000000000000000000000000) (bvsge (x!53218 lt!258256) #b00000000000000000000000000000000)))))

(assert (=> b!566718 (=> (not res!357499) (not e!326142))))

(declare-fun b!566719 () Bool)

(assert (=> b!566719 (= e!326144 e!326143)))

(declare-fun c!64957 () Bool)

(declare-fun lt!258257 () (_ BitVec 64))

(assert (=> b!566719 (= c!64957 (or (= lt!258257 (select (arr!17084 a!3118) j!142)) (= (bvadd lt!258257 lt!258257) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84165 () Bool)

(assert (=> d!84165 e!326145))

(declare-fun c!64956 () Bool)

(assert (=> d!84165 (= c!64956 (and (is-Intermediate!5533 lt!258256) (undefined!6345 lt!258256)))))

(assert (=> d!84165 (= lt!258256 e!326144)))

(declare-fun c!64955 () Bool)

(assert (=> d!84165 (= c!64955 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84165 (= lt!258257 (select (arr!17084 a!3118) lt!258134))))

(assert (=> d!84165 (validMask!0 mask!3119)))

(assert (=> d!84165 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258134 (select (arr!17084 a!3118) j!142) a!3118 mask!3119) lt!258256)))

(assert (= (and d!84165 c!64955) b!566716))

(assert (= (and d!84165 (not c!64955)) b!566719))

(assert (= (and b!566719 c!64957) b!566712))

(assert (= (and b!566719 (not c!64957)) b!566714))

(assert (= (and d!84165 c!64956) b!566717))

(assert (= (and d!84165 (not c!64956)) b!566718))

(assert (= (and b!566718 res!357499) b!566715))

(assert (= (and b!566715 (not res!357498)) b!566711))

(assert (= (and b!566711 (not res!357500)) b!566713))

(declare-fun m!545317 () Bool)

(assert (=> b!566713 m!545317))

(assert (=> b!566711 m!545317))

(assert (=> b!566715 m!545317))

(declare-fun m!545319 () Bool)

(assert (=> d!84165 m!545319))

(assert (=> d!84165 m!545095))

(declare-fun m!545321 () Bool)

(assert (=> b!566714 m!545321))

(assert (=> b!566714 m!545321))

(assert (=> b!566714 m!545083))

(declare-fun m!545323 () Bool)

(assert (=> b!566714 m!545323))

(assert (=> b!566426 d!84165))

(declare-fun d!84167 () Bool)

(declare-fun lt!258263 () (_ BitVec 32))

(declare-fun lt!258262 () (_ BitVec 32))

(assert (=> d!84167 (= lt!258263 (bvmul (bvxor lt!258262 (bvlshr lt!258262 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84167 (= lt!258262 ((_ extract 31 0) (bvand (bvxor lt!258132 (bvlshr lt!258132 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84167 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357501 (let ((h!12169 ((_ extract 31 0) (bvand (bvxor lt!258132 (bvlshr lt!258132 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53224 (bvmul (bvxor h!12169 (bvlshr h!12169 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53224 (bvlshr x!53224 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357501 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357501 #b00000000000000000000000000000000))))))

(assert (=> d!84167 (= (toIndex!0 lt!258132 mask!3119) (bvand (bvxor lt!258263 (bvlshr lt!258263 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566426 d!84167))

(declare-fun d!84175 () Bool)

(declare-fun lt!258265 () (_ BitVec 32))

(declare-fun lt!258264 () (_ BitVec 32))

(assert (=> d!84175 (= lt!258265 (bvmul (bvxor lt!258264 (bvlshr lt!258264 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84175 (= lt!258264 ((_ extract 31 0) (bvand (bvxor (select (arr!17084 a!3118) j!142) (bvlshr (select (arr!17084 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84175 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357501 (let ((h!12169 ((_ extract 31 0) (bvand (bvxor (select (arr!17084 a!3118) j!142) (bvlshr (select (arr!17084 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53224 (bvmul (bvxor h!12169 (bvlshr h!12169 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53224 (bvlshr x!53224 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357501 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357501 #b00000000000000000000000000000000))))))

(assert (=> d!84175 (= (toIndex!0 (select (arr!17084 a!3118) j!142) mask!3119) (bvand (bvxor lt!258265 (bvlshr lt!258265 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566426 d!84175))

(push 1)

