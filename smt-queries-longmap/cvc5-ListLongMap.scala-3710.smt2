; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51056 () Bool)

(assert start!51056)

(declare-fun b!557792 () Bool)

(declare-fun res!349655 () Bool)

(declare-fun e!321354 () Bool)

(assert (=> b!557792 (=> (not res!349655) (not e!321354))))

(declare-datatypes ((array!35110 0))(
  ( (array!35111 (arr!16860 (Array (_ BitVec 32) (_ BitVec 64))) (size!17224 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35110)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35110 (_ BitVec 32)) Bool)

(assert (=> b!557792 (= res!349655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!349659 () Bool)

(declare-fun e!321353 () Bool)

(assert (=> start!51056 (=> (not res!349659) (not e!321353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51056 (= res!349659 (validMask!0 mask!3119))))

(assert (=> start!51056 e!321353))

(assert (=> start!51056 true))

(declare-fun array_inv!12656 (array!35110) Bool)

(assert (=> start!51056 (array_inv!12656 a!3118)))

(declare-fun b!557793 () Bool)

(declare-fun res!349658 () Bool)

(assert (=> b!557793 (=> (not res!349658) (not e!321354))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5309 0))(
  ( (MissingZero!5309 (index!23463 (_ BitVec 32))) (Found!5309 (index!23464 (_ BitVec 32))) (Intermediate!5309 (undefined!6121 Bool) (index!23465 (_ BitVec 32)) (x!52369 (_ BitVec 32))) (Undefined!5309) (MissingVacant!5309 (index!23466 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35110 (_ BitVec 32)) SeekEntryResult!5309)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557793 (= res!349658 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16860 a!3118) j!142) mask!3119) (select (arr!16860 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16860 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16860 a!3118) i!1132 k!1914) j!142) (array!35111 (store (arr!16860 a!3118) i!1132 k!1914) (size!17224 a!3118)) mask!3119)))))

(declare-fun e!321352 () Bool)

(declare-fun b!557794 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35110 (_ BitVec 32)) SeekEntryResult!5309)

(assert (=> b!557794 (= e!321352 (= (seekEntryOrOpen!0 (select (arr!16860 a!3118) j!142) a!3118 mask!3119) (Found!5309 j!142)))))

(declare-fun b!557795 () Bool)

(assert (=> b!557795 (= e!321354 (not true))))

(assert (=> b!557795 e!321352))

(declare-fun res!349661 () Bool)

(assert (=> b!557795 (=> (not res!349661) (not e!321352))))

(assert (=> b!557795 (= res!349661 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17392 0))(
  ( (Unit!17393) )
))
(declare-fun lt!253452 () Unit!17392)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17392)

(assert (=> b!557795 (= lt!253452 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557796 () Bool)

(declare-fun res!349662 () Bool)

(assert (=> b!557796 (=> (not res!349662) (not e!321353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557796 (= res!349662 (validKeyInArray!0 k!1914))))

(declare-fun b!557797 () Bool)

(declare-fun res!349656 () Bool)

(assert (=> b!557797 (=> (not res!349656) (not e!321354))))

(declare-datatypes ((List!10940 0))(
  ( (Nil!10937) (Cons!10936 (h!11930 (_ BitVec 64)) (t!17168 List!10940)) )
))
(declare-fun arrayNoDuplicates!0 (array!35110 (_ BitVec 32) List!10940) Bool)

(assert (=> b!557797 (= res!349656 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10937))))

(declare-fun b!557798 () Bool)

(declare-fun res!349664 () Bool)

(assert (=> b!557798 (=> (not res!349664) (not e!321353))))

(declare-fun arrayContainsKey!0 (array!35110 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557798 (= res!349664 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557799 () Bool)

(declare-fun res!349660 () Bool)

(assert (=> b!557799 (=> (not res!349660) (not e!321353))))

(assert (=> b!557799 (= res!349660 (and (= (size!17224 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17224 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17224 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557800 () Bool)

(declare-fun res!349663 () Bool)

(assert (=> b!557800 (=> (not res!349663) (not e!321353))))

(assert (=> b!557800 (= res!349663 (validKeyInArray!0 (select (arr!16860 a!3118) j!142)))))

(declare-fun b!557801 () Bool)

(assert (=> b!557801 (= e!321353 e!321354)))

(declare-fun res!349657 () Bool)

(assert (=> b!557801 (=> (not res!349657) (not e!321354))))

(declare-fun lt!253453 () SeekEntryResult!5309)

(assert (=> b!557801 (= res!349657 (or (= lt!253453 (MissingZero!5309 i!1132)) (= lt!253453 (MissingVacant!5309 i!1132))))))

(assert (=> b!557801 (= lt!253453 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!51056 res!349659) b!557799))

(assert (= (and b!557799 res!349660) b!557800))

(assert (= (and b!557800 res!349663) b!557796))

(assert (= (and b!557796 res!349662) b!557798))

(assert (= (and b!557798 res!349664) b!557801))

(assert (= (and b!557801 res!349657) b!557792))

(assert (= (and b!557792 res!349655) b!557797))

(assert (= (and b!557797 res!349656) b!557793))

(assert (= (and b!557793 res!349658) b!557795))

(assert (= (and b!557795 res!349661) b!557794))

(declare-fun m!535641 () Bool)

(assert (=> start!51056 m!535641))

(declare-fun m!535643 () Bool)

(assert (=> start!51056 m!535643))

(declare-fun m!535645 () Bool)

(assert (=> b!557801 m!535645))

(declare-fun m!535647 () Bool)

(assert (=> b!557793 m!535647))

(declare-fun m!535649 () Bool)

(assert (=> b!557793 m!535649))

(assert (=> b!557793 m!535647))

(declare-fun m!535651 () Bool)

(assert (=> b!557793 m!535651))

(declare-fun m!535653 () Bool)

(assert (=> b!557793 m!535653))

(assert (=> b!557793 m!535651))

(declare-fun m!535655 () Bool)

(assert (=> b!557793 m!535655))

(assert (=> b!557793 m!535649))

(assert (=> b!557793 m!535647))

(declare-fun m!535657 () Bool)

(assert (=> b!557793 m!535657))

(declare-fun m!535659 () Bool)

(assert (=> b!557793 m!535659))

(assert (=> b!557793 m!535651))

(assert (=> b!557793 m!535653))

(declare-fun m!535661 () Bool)

(assert (=> b!557795 m!535661))

(declare-fun m!535663 () Bool)

(assert (=> b!557795 m!535663))

(declare-fun m!535665 () Bool)

(assert (=> b!557797 m!535665))

(declare-fun m!535667 () Bool)

(assert (=> b!557798 m!535667))

(declare-fun m!535669 () Bool)

(assert (=> b!557796 m!535669))

(assert (=> b!557794 m!535647))

(assert (=> b!557794 m!535647))

(declare-fun m!535671 () Bool)

(assert (=> b!557794 m!535671))

(declare-fun m!535673 () Bool)

(assert (=> b!557792 m!535673))

(assert (=> b!557800 m!535647))

(assert (=> b!557800 m!535647))

(declare-fun m!535675 () Bool)

(assert (=> b!557800 m!535675))

(push 1)

