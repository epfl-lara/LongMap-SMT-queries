; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52298 () Bool)

(assert start!52298)

(declare-fun b!570721 () Bool)

(declare-fun e!328242 () Bool)

(declare-fun e!328237 () Bool)

(assert (=> b!570721 (= e!328242 e!328237)))

(declare-fun res!360508 () Bool)

(assert (=> b!570721 (=> (not res!360508) (not e!328237))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!260186 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35758 0))(
  ( (array!35759 (arr!17169 (Array (_ BitVec 32) (_ BitVec 64))) (size!17533 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35758)

(declare-datatypes ((SeekEntryResult!5618 0))(
  ( (MissingZero!5618 (index!24699 (_ BitVec 32))) (Found!5618 (index!24700 (_ BitVec 32))) (Intermediate!5618 (undefined!6430 Bool) (index!24701 (_ BitVec 32)) (x!53574 (_ BitVec 32))) (Undefined!5618) (MissingVacant!5618 (index!24702 (_ BitVec 32))) )
))
(declare-fun lt!260190 () SeekEntryResult!5618)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35758 (_ BitVec 32)) SeekEntryResult!5618)

(assert (=> b!570721 (= res!360508 (= lt!260190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260186 (select (store (arr!17169 a!3118) i!1132 k!1914) j!142) (array!35759 (store (arr!17169 a!3118) i!1132 k!1914) (size!17533 a!3118)) mask!3119)))))

(declare-fun lt!260191 () (_ BitVec 32))

(assert (=> b!570721 (= lt!260190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260191 (select (arr!17169 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570721 (= lt!260186 (toIndex!0 (select (store (arr!17169 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!570721 (= lt!260191 (toIndex!0 (select (arr!17169 a!3118) j!142) mask!3119))))

(declare-fun b!570722 () Bool)

(declare-fun res!360504 () Bool)

(declare-fun e!328238 () Bool)

(assert (=> b!570722 (=> (not res!360504) (not e!328238))))

(assert (=> b!570722 (= res!360504 (and (= (size!17533 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17533 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17533 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!360502 () Bool)

(assert (=> start!52298 (=> (not res!360502) (not e!328238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52298 (= res!360502 (validMask!0 mask!3119))))

(assert (=> start!52298 e!328238))

(assert (=> start!52298 true))

(declare-fun array_inv!12965 (array!35758) Bool)

(assert (=> start!52298 (array_inv!12965 a!3118)))

(declare-fun b!570723 () Bool)

(assert (=> b!570723 (= e!328238 e!328242)))

(declare-fun res!360507 () Bool)

(assert (=> b!570723 (=> (not res!360507) (not e!328242))))

(declare-fun lt!260187 () SeekEntryResult!5618)

(assert (=> b!570723 (= res!360507 (or (= lt!260187 (MissingZero!5618 i!1132)) (= lt!260187 (MissingVacant!5618 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35758 (_ BitVec 32)) SeekEntryResult!5618)

(assert (=> b!570723 (= lt!260187 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!570724 () Bool)

(assert (=> b!570724 (= e!328237 (not true))))

(declare-fun e!328241 () Bool)

(assert (=> b!570724 e!328241))

(declare-fun res!360509 () Bool)

(assert (=> b!570724 (=> (not res!360509) (not e!328241))))

(declare-fun lt!260188 () SeekEntryResult!5618)

(assert (=> b!570724 (= res!360509 (= lt!260188 (Found!5618 j!142)))))

(assert (=> b!570724 (= lt!260188 (seekEntryOrOpen!0 (select (arr!17169 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35758 (_ BitVec 32)) Bool)

(assert (=> b!570724 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17938 0))(
  ( (Unit!17939) )
))
(declare-fun lt!260189 () Unit!17938)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17938)

(assert (=> b!570724 (= lt!260189 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570725 () Bool)

(declare-fun res!360512 () Bool)

(assert (=> b!570725 (=> (not res!360512) (not e!328242))))

(assert (=> b!570725 (= res!360512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570726 () Bool)

(declare-fun res!360511 () Bool)

(assert (=> b!570726 (=> (not res!360511) (not e!328238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570726 (= res!360511 (validKeyInArray!0 k!1914))))

(declare-fun b!570727 () Bool)

(declare-fun res!360510 () Bool)

(assert (=> b!570727 (=> (not res!360510) (not e!328238))))

(assert (=> b!570727 (= res!360510 (validKeyInArray!0 (select (arr!17169 a!3118) j!142)))))

(declare-fun b!570728 () Bool)

(declare-fun res!360506 () Bool)

(assert (=> b!570728 (=> (not res!360506) (not e!328242))))

(declare-datatypes ((List!11249 0))(
  ( (Nil!11246) (Cons!11245 (h!12269 (_ BitVec 64)) (t!17477 List!11249)) )
))
(declare-fun arrayNoDuplicates!0 (array!35758 (_ BitVec 32) List!11249) Bool)

(assert (=> b!570728 (= res!360506 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11246))))

(declare-fun b!570729 () Bool)

(declare-fun e!328239 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35758 (_ BitVec 32)) SeekEntryResult!5618)

(assert (=> b!570729 (= e!328239 (= lt!260188 (seekKeyOrZeroReturnVacant!0 (x!53574 lt!260190) (index!24701 lt!260190) (index!24701 lt!260190) (select (arr!17169 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570730 () Bool)

(assert (=> b!570730 (= e!328241 e!328239)))

(declare-fun res!360503 () Bool)

(assert (=> b!570730 (=> res!360503 e!328239)))

(assert (=> b!570730 (= res!360503 (or (undefined!6430 lt!260190) (not (is-Intermediate!5618 lt!260190)) (= (select (arr!17169 a!3118) (index!24701 lt!260190)) (select (arr!17169 a!3118) j!142)) (= (select (arr!17169 a!3118) (index!24701 lt!260190)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570731 () Bool)

(declare-fun res!360505 () Bool)

(assert (=> b!570731 (=> (not res!360505) (not e!328238))))

(declare-fun arrayContainsKey!0 (array!35758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570731 (= res!360505 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!52298 res!360502) b!570722))

(assert (= (and b!570722 res!360504) b!570727))

(assert (= (and b!570727 res!360510) b!570726))

(assert (= (and b!570726 res!360511) b!570731))

(assert (= (and b!570731 res!360505) b!570723))

(assert (= (and b!570723 res!360507) b!570725))

(assert (= (and b!570725 res!360512) b!570728))

(assert (= (and b!570728 res!360506) b!570721))

(assert (= (and b!570721 res!360508) b!570724))

(assert (= (and b!570724 res!360509) b!570730))

(assert (= (and b!570730 (not res!360503)) b!570729))

(declare-fun m!549609 () Bool)

(assert (=> b!570725 m!549609))

(declare-fun m!549611 () Bool)

(assert (=> b!570731 m!549611))

(declare-fun m!549613 () Bool)

(assert (=> b!570724 m!549613))

(assert (=> b!570724 m!549613))

(declare-fun m!549615 () Bool)

(assert (=> b!570724 m!549615))

(declare-fun m!549617 () Bool)

(assert (=> b!570724 m!549617))

(declare-fun m!549619 () Bool)

(assert (=> b!570724 m!549619))

(declare-fun m!549621 () Bool)

(assert (=> b!570728 m!549621))

(declare-fun m!549623 () Bool)

(assert (=> b!570723 m!549623))

(assert (=> b!570727 m!549613))

(assert (=> b!570727 m!549613))

(declare-fun m!549625 () Bool)

(assert (=> b!570727 m!549625))

(assert (=> b!570729 m!549613))

(assert (=> b!570729 m!549613))

(declare-fun m!549627 () Bool)

(assert (=> b!570729 m!549627))

(declare-fun m!549629 () Bool)

(assert (=> start!52298 m!549629))

(declare-fun m!549631 () Bool)

(assert (=> start!52298 m!549631))

(declare-fun m!549633 () Bool)

(assert (=> b!570726 m!549633))

(assert (=> b!570721 m!549613))

(declare-fun m!549635 () Bool)

(assert (=> b!570721 m!549635))

(declare-fun m!549637 () Bool)

(assert (=> b!570721 m!549637))

(assert (=> b!570721 m!549637))

(declare-fun m!549639 () Bool)

(assert (=> b!570721 m!549639))

(declare-fun m!549641 () Bool)

(assert (=> b!570721 m!549641))

(assert (=> b!570721 m!549637))

(declare-fun m!549643 () Bool)

(assert (=> b!570721 m!549643))

(assert (=> b!570721 m!549613))

(declare-fun m!549645 () Bool)

(assert (=> b!570721 m!549645))

(assert (=> b!570721 m!549613))

(declare-fun m!549647 () Bool)

(assert (=> b!570730 m!549647))

(assert (=> b!570730 m!549613))

(push 1)

