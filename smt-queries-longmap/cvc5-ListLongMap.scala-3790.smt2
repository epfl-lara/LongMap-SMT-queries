; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51914 () Bool)

(assert start!51914)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!326546 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!567503 () Bool)

(declare-datatypes ((array!35608 0))(
  ( (array!35609 (arr!17100 (Array (_ BitVec 32) (_ BitVec 64))) (size!17464 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35608)

(declare-datatypes ((SeekEntryResult!5549 0))(
  ( (MissingZero!5549 (index!24423 (_ BitVec 32))) (Found!5549 (index!24424 (_ BitVec 32))) (Intermediate!5549 (undefined!6361 Bool) (index!24425 (_ BitVec 32)) (x!53294 (_ BitVec 32))) (Undefined!5549) (MissingVacant!5549 (index!24426 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35608 (_ BitVec 32)) SeekEntryResult!5549)

(assert (=> b!567503 (= e!326546 (= (seekEntryOrOpen!0 (select (arr!17100 a!3118) j!142) a!3118 mask!3119) (Found!5549 j!142)))))

(declare-fun b!567504 () Bool)

(declare-fun res!358094 () Bool)

(declare-fun e!326545 () Bool)

(assert (=> b!567504 (=> (not res!358094) (not e!326545))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35608 (_ BitVec 32)) SeekEntryResult!5549)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567504 (= res!358094 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17100 a!3118) j!142) mask!3119) (select (arr!17100 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17100 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17100 a!3118) i!1132 k!1914) j!142) (array!35609 (store (arr!17100 a!3118) i!1132 k!1914) (size!17464 a!3118)) mask!3119)))))

(declare-fun res!358097 () Bool)

(declare-fun e!326544 () Bool)

(assert (=> start!51914 (=> (not res!358097) (not e!326544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51914 (= res!358097 (validMask!0 mask!3119))))

(assert (=> start!51914 e!326544))

(assert (=> start!51914 true))

(declare-fun array_inv!12896 (array!35608) Bool)

(assert (=> start!51914 (array_inv!12896 a!3118)))

(declare-fun b!567505 () Bool)

(declare-fun res!358093 () Bool)

(assert (=> b!567505 (=> (not res!358093) (not e!326545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35608 (_ BitVec 32)) Bool)

(assert (=> b!567505 (= res!358093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567506 () Bool)

(declare-fun res!358091 () Bool)

(assert (=> b!567506 (=> (not res!358091) (not e!326544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567506 (= res!358091 (validKeyInArray!0 (select (arr!17100 a!3118) j!142)))))

(declare-fun b!567507 () Bool)

(declare-fun res!358096 () Bool)

(assert (=> b!567507 (=> (not res!358096) (not e!326544))))

(assert (=> b!567507 (= res!358096 (and (= (size!17464 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17464 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17464 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567508 () Bool)

(declare-fun res!358089 () Bool)

(assert (=> b!567508 (=> (not res!358089) (not e!326545))))

(declare-datatypes ((List!11180 0))(
  ( (Nil!11177) (Cons!11176 (h!12188 (_ BitVec 64)) (t!17408 List!11180)) )
))
(declare-fun arrayNoDuplicates!0 (array!35608 (_ BitVec 32) List!11180) Bool)

(assert (=> b!567508 (= res!358089 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11177))))

(declare-fun b!567509 () Bool)

(assert (=> b!567509 (= e!326544 e!326545)))

(declare-fun res!358095 () Bool)

(assert (=> b!567509 (=> (not res!358095) (not e!326545))))

(declare-fun lt!258528 () SeekEntryResult!5549)

(assert (=> b!567509 (= res!358095 (or (= lt!258528 (MissingZero!5549 i!1132)) (= lt!258528 (MissingVacant!5549 i!1132))))))

(assert (=> b!567509 (= lt!258528 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!567510 () Bool)

(declare-fun res!358088 () Bool)

(assert (=> b!567510 (=> (not res!358088) (not e!326544))))

(assert (=> b!567510 (= res!358088 (validKeyInArray!0 k!1914))))

(declare-fun b!567511 () Bool)

(declare-fun res!358092 () Bool)

(assert (=> b!567511 (=> (not res!358092) (not e!326544))))

(declare-fun arrayContainsKey!0 (array!35608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567511 (= res!358092 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567512 () Bool)

(assert (=> b!567512 (= e!326545 (not true))))

(assert (=> b!567512 e!326546))

(declare-fun res!358090 () Bool)

(assert (=> b!567512 (=> (not res!358090) (not e!326546))))

(assert (=> b!567512 (= res!358090 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17800 0))(
  ( (Unit!17801) )
))
(declare-fun lt!258529 () Unit!17800)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35608 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17800)

(assert (=> b!567512 (= lt!258529 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51914 res!358097) b!567507))

(assert (= (and b!567507 res!358096) b!567506))

(assert (= (and b!567506 res!358091) b!567510))

(assert (= (and b!567510 res!358088) b!567511))

(assert (= (and b!567511 res!358092) b!567509))

(assert (= (and b!567509 res!358095) b!567505))

(assert (= (and b!567505 res!358093) b!567508))

(assert (= (and b!567508 res!358089) b!567504))

(assert (= (and b!567504 res!358094) b!567512))

(assert (= (and b!567512 res!358090) b!567503))

(declare-fun m!546105 () Bool)

(assert (=> start!51914 m!546105))

(declare-fun m!546107 () Bool)

(assert (=> start!51914 m!546107))

(declare-fun m!546109 () Bool)

(assert (=> b!567512 m!546109))

(declare-fun m!546111 () Bool)

(assert (=> b!567512 m!546111))

(declare-fun m!546113 () Bool)

(assert (=> b!567510 m!546113))

(declare-fun m!546115 () Bool)

(assert (=> b!567509 m!546115))

(declare-fun m!546117 () Bool)

(assert (=> b!567504 m!546117))

(declare-fun m!546119 () Bool)

(assert (=> b!567504 m!546119))

(assert (=> b!567504 m!546117))

(declare-fun m!546121 () Bool)

(assert (=> b!567504 m!546121))

(declare-fun m!546123 () Bool)

(assert (=> b!567504 m!546123))

(assert (=> b!567504 m!546121))

(declare-fun m!546125 () Bool)

(assert (=> b!567504 m!546125))

(assert (=> b!567504 m!546119))

(assert (=> b!567504 m!546117))

(declare-fun m!546127 () Bool)

(assert (=> b!567504 m!546127))

(declare-fun m!546129 () Bool)

(assert (=> b!567504 m!546129))

(assert (=> b!567504 m!546121))

(assert (=> b!567504 m!546123))

(declare-fun m!546131 () Bool)

(assert (=> b!567511 m!546131))

(declare-fun m!546133 () Bool)

(assert (=> b!567505 m!546133))

(assert (=> b!567503 m!546117))

(assert (=> b!567503 m!546117))

(declare-fun m!546135 () Bool)

(assert (=> b!567503 m!546135))

(assert (=> b!567506 m!546117))

(assert (=> b!567506 m!546117))

(declare-fun m!546137 () Bool)

(assert (=> b!567506 m!546137))

(declare-fun m!546139 () Bool)

(assert (=> b!567508 m!546139))

(push 1)

