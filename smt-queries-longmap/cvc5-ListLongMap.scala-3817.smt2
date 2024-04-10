; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52388 () Bool)

(assert start!52388)

(declare-fun b!571529 () Bool)

(declare-fun e!328715 () Bool)

(declare-fun e!328716 () Bool)

(assert (=> b!571529 (= e!328715 e!328716)))

(declare-fun res!361038 () Bool)

(assert (=> b!571529 (=> (not res!361038) (not e!328716))))

(declare-fun lt!260608 () (_ BitVec 64))

(declare-fun lt!260609 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5630 0))(
  ( (MissingZero!5630 (index!24747 (_ BitVec 32))) (Found!5630 (index!24748 (_ BitVec 32))) (Intermediate!5630 (undefined!6442 Bool) (index!24749 (_ BitVec 32)) (x!53627 (_ BitVec 32))) (Undefined!5630) (MissingVacant!5630 (index!24750 (_ BitVec 32))) )
))
(declare-fun lt!260611 () SeekEntryResult!5630)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35785 0))(
  ( (array!35786 (arr!17181 (Array (_ BitVec 32) (_ BitVec 64))) (size!17545 (_ BitVec 32))) )
))
(declare-fun lt!260606 () array!35785)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35785 (_ BitVec 32)) SeekEntryResult!5630)

(assert (=> b!571529 (= res!361038 (= lt!260611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260609 lt!260608 lt!260606 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!260614 () (_ BitVec 32))

(declare-fun a!3118 () array!35785)

(assert (=> b!571529 (= lt!260611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260614 (select (arr!17181 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571529 (= lt!260609 (toIndex!0 lt!260608 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571529 (= lt!260608 (select (store (arr!17181 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!571529 (= lt!260614 (toIndex!0 (select (arr!17181 a!3118) j!142) mask!3119))))

(assert (=> b!571529 (= lt!260606 (array!35786 (store (arr!17181 a!3118) i!1132 k!1914) (size!17545 a!3118)))))

(declare-fun b!571530 () Bool)

(declare-fun res!361039 () Bool)

(assert (=> b!571530 (=> (not res!361039) (not e!328715))))

(declare-datatypes ((List!11261 0))(
  ( (Nil!11258) (Cons!11257 (h!12284 (_ BitVec 64)) (t!17489 List!11261)) )
))
(declare-fun arrayNoDuplicates!0 (array!35785 (_ BitVec 32) List!11261) Bool)

(assert (=> b!571530 (= res!361039 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11258))))

(declare-fun e!328722 () Bool)

(declare-fun b!571531 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35785 (_ BitVec 32)) SeekEntryResult!5630)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35785 (_ BitVec 32)) SeekEntryResult!5630)

(assert (=> b!571531 (= e!328722 (= (seekEntryOrOpen!0 lt!260608 lt!260606 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53627 lt!260611) (index!24749 lt!260611) (index!24749 lt!260611) lt!260608 lt!260606 mask!3119)))))

(declare-fun b!571532 () Bool)

(declare-fun e!328720 () Bool)

(declare-fun e!328721 () Bool)

(assert (=> b!571532 (= e!328720 e!328721)))

(declare-fun res!361048 () Bool)

(assert (=> b!571532 (=> res!361048 e!328721)))

(declare-fun lt!260607 () (_ BitVec 64))

(assert (=> b!571532 (= res!361048 (or (= lt!260607 (select (arr!17181 a!3118) j!142)) (= lt!260607 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571532 (= lt!260607 (select (arr!17181 a!3118) (index!24749 lt!260611)))))

(declare-fun b!571533 () Bool)

(declare-fun res!361041 () Bool)

(declare-fun e!328718 () Bool)

(assert (=> b!571533 (=> (not res!361041) (not e!328718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571533 (= res!361041 (validKeyInArray!0 (select (arr!17181 a!3118) j!142)))))

(declare-fun b!571534 () Bool)

(declare-fun res!361045 () Bool)

(assert (=> b!571534 (=> (not res!361045) (not e!328718))))

(assert (=> b!571534 (= res!361045 (and (= (size!17545 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17545 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17545 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571535 () Bool)

(declare-fun res!361044 () Bool)

(assert (=> b!571535 (=> (not res!361044) (not e!328718))))

(declare-fun arrayContainsKey!0 (array!35785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571535 (= res!361044 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571536 () Bool)

(assert (=> b!571536 (= e!328721 e!328722)))

(declare-fun res!361042 () Bool)

(assert (=> b!571536 (=> (not res!361042) (not e!328722))))

(declare-fun lt!260613 () SeekEntryResult!5630)

(assert (=> b!571536 (= res!361042 (= lt!260613 (seekKeyOrZeroReturnVacant!0 (x!53627 lt!260611) (index!24749 lt!260611) (index!24749 lt!260611) (select (arr!17181 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571537 () Bool)

(assert (=> b!571537 (= e!328716 (not true))))

(declare-fun e!328719 () Bool)

(assert (=> b!571537 e!328719))

(declare-fun res!361049 () Bool)

(assert (=> b!571537 (=> (not res!361049) (not e!328719))))

(assert (=> b!571537 (= res!361049 (= lt!260613 (Found!5630 j!142)))))

(assert (=> b!571537 (= lt!260613 (seekEntryOrOpen!0 (select (arr!17181 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35785 (_ BitVec 32)) Bool)

(assert (=> b!571537 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17962 0))(
  ( (Unit!17963) )
))
(declare-fun lt!260612 () Unit!17962)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35785 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17962)

(assert (=> b!571537 (= lt!260612 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571538 () Bool)

(declare-fun res!361047 () Bool)

(assert (=> b!571538 (=> (not res!361047) (not e!328715))))

(assert (=> b!571538 (= res!361047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571540 () Bool)

(declare-fun res!361046 () Bool)

(assert (=> b!571540 (=> (not res!361046) (not e!328718))))

(assert (=> b!571540 (= res!361046 (validKeyInArray!0 k!1914))))

(declare-fun b!571541 () Bool)

(assert (=> b!571541 (= e!328718 e!328715)))

(declare-fun res!361040 () Bool)

(assert (=> b!571541 (=> (not res!361040) (not e!328715))))

(declare-fun lt!260610 () SeekEntryResult!5630)

(assert (=> b!571541 (= res!361040 (or (= lt!260610 (MissingZero!5630 i!1132)) (= lt!260610 (MissingVacant!5630 i!1132))))))

(assert (=> b!571541 (= lt!260610 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!361043 () Bool)

(assert (=> start!52388 (=> (not res!361043) (not e!328718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52388 (= res!361043 (validMask!0 mask!3119))))

(assert (=> start!52388 e!328718))

(assert (=> start!52388 true))

(declare-fun array_inv!12977 (array!35785) Bool)

(assert (=> start!52388 (array_inv!12977 a!3118)))

(declare-fun b!571539 () Bool)

(assert (=> b!571539 (= e!328719 e!328720)))

(declare-fun res!361037 () Bool)

(assert (=> b!571539 (=> res!361037 e!328720)))

(assert (=> b!571539 (= res!361037 (or (undefined!6442 lt!260611) (not (is-Intermediate!5630 lt!260611))))))

(assert (= (and start!52388 res!361043) b!571534))

(assert (= (and b!571534 res!361045) b!571533))

(assert (= (and b!571533 res!361041) b!571540))

(assert (= (and b!571540 res!361046) b!571535))

(assert (= (and b!571535 res!361044) b!571541))

(assert (= (and b!571541 res!361040) b!571538))

(assert (= (and b!571538 res!361047) b!571530))

(assert (= (and b!571530 res!361039) b!571529))

(assert (= (and b!571529 res!361038) b!571537))

(assert (= (and b!571537 res!361049) b!571539))

(assert (= (and b!571539 (not res!361037)) b!571532))

(assert (= (and b!571532 (not res!361048)) b!571536))

(assert (= (and b!571536 res!361042) b!571531))

(declare-fun m!550389 () Bool)

(assert (=> b!571533 m!550389))

(assert (=> b!571533 m!550389))

(declare-fun m!550391 () Bool)

(assert (=> b!571533 m!550391))

(declare-fun m!550393 () Bool)

(assert (=> start!52388 m!550393))

(declare-fun m!550395 () Bool)

(assert (=> start!52388 m!550395))

(assert (=> b!571529 m!550389))

(declare-fun m!550397 () Bool)

(assert (=> b!571529 m!550397))

(assert (=> b!571529 m!550389))

(declare-fun m!550399 () Bool)

(assert (=> b!571529 m!550399))

(assert (=> b!571529 m!550389))

(declare-fun m!550401 () Bool)

(assert (=> b!571529 m!550401))

(declare-fun m!550403 () Bool)

(assert (=> b!571529 m!550403))

(declare-fun m!550405 () Bool)

(assert (=> b!571529 m!550405))

(declare-fun m!550407 () Bool)

(assert (=> b!571529 m!550407))

(declare-fun m!550409 () Bool)

(assert (=> b!571535 m!550409))

(declare-fun m!550411 () Bool)

(assert (=> b!571530 m!550411))

(assert (=> b!571532 m!550389))

(declare-fun m!550413 () Bool)

(assert (=> b!571532 m!550413))

(assert (=> b!571536 m!550389))

(assert (=> b!571536 m!550389))

(declare-fun m!550415 () Bool)

(assert (=> b!571536 m!550415))

(assert (=> b!571537 m!550389))

(assert (=> b!571537 m!550389))

(declare-fun m!550417 () Bool)

(assert (=> b!571537 m!550417))

(declare-fun m!550419 () Bool)

(assert (=> b!571537 m!550419))

(declare-fun m!550421 () Bool)

(assert (=> b!571537 m!550421))

(declare-fun m!550423 () Bool)

(assert (=> b!571540 m!550423))

(declare-fun m!550425 () Bool)

(assert (=> b!571531 m!550425))

(declare-fun m!550427 () Bool)

(assert (=> b!571531 m!550427))

(declare-fun m!550429 () Bool)

(assert (=> b!571541 m!550429))

(declare-fun m!550431 () Bool)

(assert (=> b!571538 m!550431))

(push 1)

