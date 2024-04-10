; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50420 () Bool)

(assert start!50420)

(declare-fun b!551423 () Bool)

(declare-fun res!344208 () Bool)

(declare-fun e!318254 () Bool)

(assert (=> b!551423 (=> (not res!344208) (not e!318254))))

(declare-datatypes ((array!34759 0))(
  ( (array!34760 (arr!16692 (Array (_ BitVec 32) (_ BitVec 64))) (size!17056 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34759)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551423 (= res!344208 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551424 () Bool)

(declare-fun e!318252 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!551424 (= e!318252 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!318253 () Bool)

(assert (=> b!551424 e!318253))

(declare-fun res!344206 () Bool)

(assert (=> b!551424 (=> (not res!344206) (not e!318253))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34759 (_ BitVec 32)) Bool)

(assert (=> b!551424 (= res!344206 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17056 0))(
  ( (Unit!17057) )
))
(declare-fun lt!250827 () Unit!17056)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17056)

(assert (=> b!551424 (= lt!250827 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551425 () Bool)

(declare-fun res!344209 () Bool)

(assert (=> b!551425 (=> (not res!344209) (not e!318252))))

(assert (=> b!551425 (= res!344209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551426 () Bool)

(declare-datatypes ((SeekEntryResult!5141 0))(
  ( (MissingZero!5141 (index!22791 (_ BitVec 32))) (Found!5141 (index!22792 (_ BitVec 32))) (Intermediate!5141 (undefined!5953 Bool) (index!22793 (_ BitVec 32)) (x!51723 (_ BitVec 32))) (Undefined!5141) (MissingVacant!5141 (index!22794 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34759 (_ BitVec 32)) SeekEntryResult!5141)

(assert (=> b!551426 (= e!318253 (= (seekEntryOrOpen!0 (select (arr!16692 a!3118) j!142) a!3118 mask!3119) (Found!5141 j!142)))))

(declare-fun b!551427 () Bool)

(declare-fun res!344210 () Bool)

(assert (=> b!551427 (=> (not res!344210) (not e!318254))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551427 (= res!344210 (and (= (size!17056 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17056 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17056 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551428 () Bool)

(declare-fun res!344204 () Bool)

(assert (=> b!551428 (=> (not res!344204) (not e!318254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551428 (= res!344204 (validKeyInArray!0 k!1914))))

(declare-fun b!551429 () Bool)

(declare-fun res!344207 () Bool)

(assert (=> b!551429 (=> (not res!344207) (not e!318254))))

(assert (=> b!551429 (= res!344207 (validKeyInArray!0 (select (arr!16692 a!3118) j!142)))))

(declare-fun res!344202 () Bool)

(assert (=> start!50420 (=> (not res!344202) (not e!318254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50420 (= res!344202 (validMask!0 mask!3119))))

(assert (=> start!50420 e!318254))

(assert (=> start!50420 true))

(declare-fun array_inv!12488 (array!34759) Bool)

(assert (=> start!50420 (array_inv!12488 a!3118)))

(declare-fun b!551430 () Bool)

(assert (=> b!551430 (= e!318254 e!318252)))

(declare-fun res!344203 () Bool)

(assert (=> b!551430 (=> (not res!344203) (not e!318252))))

(declare-fun lt!250828 () SeekEntryResult!5141)

(assert (=> b!551430 (= res!344203 (or (= lt!250828 (MissingZero!5141 i!1132)) (= lt!250828 (MissingVacant!5141 i!1132))))))

(assert (=> b!551430 (= lt!250828 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!551431 () Bool)

(declare-fun res!344201 () Bool)

(assert (=> b!551431 (=> (not res!344201) (not e!318252))))

(declare-datatypes ((List!10772 0))(
  ( (Nil!10769) (Cons!10768 (h!11747 (_ BitVec 64)) (t!17000 List!10772)) )
))
(declare-fun arrayNoDuplicates!0 (array!34759 (_ BitVec 32) List!10772) Bool)

(assert (=> b!551431 (= res!344201 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10769))))

(declare-fun b!551432 () Bool)

(declare-fun res!344205 () Bool)

(assert (=> b!551432 (=> (not res!344205) (not e!318252))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34759 (_ BitVec 32)) SeekEntryResult!5141)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551432 (= res!344205 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16692 a!3118) j!142) mask!3119) (select (arr!16692 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16692 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16692 a!3118) i!1132 k!1914) j!142) (array!34760 (store (arr!16692 a!3118) i!1132 k!1914) (size!17056 a!3118)) mask!3119)))))

(assert (= (and start!50420 res!344202) b!551427))

(assert (= (and b!551427 res!344210) b!551429))

(assert (= (and b!551429 res!344207) b!551428))

(assert (= (and b!551428 res!344204) b!551423))

(assert (= (and b!551423 res!344208) b!551430))

(assert (= (and b!551430 res!344203) b!551425))

(assert (= (and b!551425 res!344209) b!551431))

(assert (= (and b!551431 res!344201) b!551432))

(assert (= (and b!551432 res!344205) b!551424))

(assert (= (and b!551424 res!344206) b!551426))

(declare-fun m!528405 () Bool)

(assert (=> b!551426 m!528405))

(assert (=> b!551426 m!528405))

(declare-fun m!528407 () Bool)

(assert (=> b!551426 m!528407))

(declare-fun m!528409 () Bool)

(assert (=> start!50420 m!528409))

(declare-fun m!528411 () Bool)

(assert (=> start!50420 m!528411))

(declare-fun m!528413 () Bool)

(assert (=> b!551430 m!528413))

(assert (=> b!551432 m!528405))

(declare-fun m!528415 () Bool)

(assert (=> b!551432 m!528415))

(assert (=> b!551432 m!528405))

(declare-fun m!528417 () Bool)

(assert (=> b!551432 m!528417))

(declare-fun m!528419 () Bool)

(assert (=> b!551432 m!528419))

(assert (=> b!551432 m!528417))

(declare-fun m!528421 () Bool)

(assert (=> b!551432 m!528421))

(assert (=> b!551432 m!528415))

(assert (=> b!551432 m!528405))

(declare-fun m!528423 () Bool)

(assert (=> b!551432 m!528423))

(declare-fun m!528425 () Bool)

(assert (=> b!551432 m!528425))

(assert (=> b!551432 m!528417))

(assert (=> b!551432 m!528419))

(assert (=> b!551429 m!528405))

(assert (=> b!551429 m!528405))

(declare-fun m!528427 () Bool)

(assert (=> b!551429 m!528427))

(declare-fun m!528429 () Bool)

(assert (=> b!551431 m!528429))

(declare-fun m!528431 () Bool)

(assert (=> b!551428 m!528431))

(declare-fun m!528433 () Bool)

(assert (=> b!551423 m!528433))

(declare-fun m!528435 () Bool)

(assert (=> b!551425 m!528435))

(declare-fun m!528437 () Bool)

(assert (=> b!551424 m!528437))

(declare-fun m!528439 () Bool)

(assert (=> b!551424 m!528439))

(push 1)

