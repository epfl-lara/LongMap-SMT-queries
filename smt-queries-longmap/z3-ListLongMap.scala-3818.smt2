; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52382 () Bool)

(assert start!52382)

(declare-fun b!571375 () Bool)

(declare-fun res!361031 () Bool)

(declare-fun e!328620 () Bool)

(assert (=> b!571375 (=> (not res!361031) (not e!328620))))

(declare-datatypes ((array!35788 0))(
  ( (array!35789 (arr!17183 (Array (_ BitVec 32) (_ BitVec 64))) (size!17548 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35788)

(declare-datatypes ((List!11302 0))(
  ( (Nil!11299) (Cons!11298 (h!12325 (_ BitVec 64)) (t!17521 List!11302)) )
))
(declare-fun arrayNoDuplicates!0 (array!35788 (_ BitVec 32) List!11302) Bool)

(assert (=> b!571375 (= res!361031 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11299))))

(declare-fun b!571376 () Bool)

(declare-fun e!328617 () Bool)

(assert (=> b!571376 (= e!328620 e!328617)))

(declare-fun res!361032 () Bool)

(assert (=> b!571376 (=> (not res!361032) (not e!328617))))

(declare-fun lt!260461 () array!35788)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!260453 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5629 0))(
  ( (MissingZero!5629 (index!24743 (_ BitVec 32))) (Found!5629 (index!24744 (_ BitVec 32))) (Intermediate!5629 (undefined!6441 Bool) (index!24745 (_ BitVec 32)) (x!53629 (_ BitVec 32))) (Undefined!5629) (MissingVacant!5629 (index!24746 (_ BitVec 32))) )
))
(declare-fun lt!260456 () SeekEntryResult!5629)

(declare-fun lt!260458 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35788 (_ BitVec 32)) SeekEntryResult!5629)

(assert (=> b!571376 (= res!361032 (= lt!260456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260453 lt!260458 lt!260461 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!260459 () (_ BitVec 32))

(assert (=> b!571376 (= lt!260456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260459 (select (arr!17183 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571376 (= lt!260453 (toIndex!0 lt!260458 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571376 (= lt!260458 (select (store (arr!17183 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!571376 (= lt!260459 (toIndex!0 (select (arr!17183 a!3118) j!142) mask!3119))))

(assert (=> b!571376 (= lt!260461 (array!35789 (store (arr!17183 a!3118) i!1132 k0!1914) (size!17548 a!3118)))))

(declare-fun b!571377 () Bool)

(declare-fun e!328614 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35788 (_ BitVec 32)) SeekEntryResult!5629)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35788 (_ BitVec 32)) SeekEntryResult!5629)

(assert (=> b!571377 (= e!328614 (= (seekEntryOrOpen!0 lt!260458 lt!260461 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53629 lt!260456) (index!24745 lt!260456) (index!24745 lt!260456) lt!260458 lt!260461 mask!3119)))))

(declare-fun b!571378 () Bool)

(declare-fun e!328619 () Bool)

(assert (=> b!571378 (= e!328619 e!328614)))

(declare-fun res!361036 () Bool)

(assert (=> b!571378 (=> (not res!361036) (not e!328614))))

(declare-fun lt!260454 () SeekEntryResult!5629)

(assert (=> b!571378 (= res!361036 (= lt!260454 (seekKeyOrZeroReturnVacant!0 (x!53629 lt!260456) (index!24745 lt!260456) (index!24745 lt!260456) (select (arr!17183 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571379 () Bool)

(declare-fun res!361037 () Bool)

(assert (=> b!571379 (=> (not res!361037) (not e!328620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35788 (_ BitVec 32)) Bool)

(assert (=> b!571379 (= res!361037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571380 () Bool)

(declare-fun e!328613 () Bool)

(assert (=> b!571380 (= e!328613 e!328619)))

(declare-fun res!361030 () Bool)

(assert (=> b!571380 (=> res!361030 e!328619)))

(declare-fun lt!260455 () (_ BitVec 64))

(assert (=> b!571380 (= res!361030 (or (= lt!260455 (select (arr!17183 a!3118) j!142)) (= lt!260455 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571380 (= lt!260455 (select (arr!17183 a!3118) (index!24745 lt!260456)))))

(declare-fun b!571381 () Bool)

(assert (=> b!571381 (= e!328617 (not true))))

(declare-fun e!328618 () Bool)

(assert (=> b!571381 e!328618))

(declare-fun res!361028 () Bool)

(assert (=> b!571381 (=> (not res!361028) (not e!328618))))

(assert (=> b!571381 (= res!361028 (= lt!260454 (Found!5629 j!142)))))

(assert (=> b!571381 (= lt!260454 (seekEntryOrOpen!0 (select (arr!17183 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!571381 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17946 0))(
  ( (Unit!17947) )
))
(declare-fun lt!260457 () Unit!17946)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17946)

(assert (=> b!571381 (= lt!260457 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!361035 () Bool)

(declare-fun e!328615 () Bool)

(assert (=> start!52382 (=> (not res!361035) (not e!328615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52382 (= res!361035 (validMask!0 mask!3119))))

(assert (=> start!52382 e!328615))

(assert (=> start!52382 true))

(declare-fun array_inv!13066 (array!35788) Bool)

(assert (=> start!52382 (array_inv!13066 a!3118)))

(declare-fun b!571382 () Bool)

(declare-fun res!361029 () Bool)

(assert (=> b!571382 (=> (not res!361029) (not e!328615))))

(assert (=> b!571382 (= res!361029 (and (= (size!17548 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17548 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17548 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571383 () Bool)

(declare-fun res!361034 () Bool)

(assert (=> b!571383 (=> (not res!361034) (not e!328615))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571383 (= res!361034 (validKeyInArray!0 k0!1914))))

(declare-fun b!571384 () Bool)

(declare-fun res!361026 () Bool)

(assert (=> b!571384 (=> (not res!361026) (not e!328615))))

(assert (=> b!571384 (= res!361026 (validKeyInArray!0 (select (arr!17183 a!3118) j!142)))))

(declare-fun b!571385 () Bool)

(assert (=> b!571385 (= e!328618 e!328613)))

(declare-fun res!361033 () Bool)

(assert (=> b!571385 (=> res!361033 e!328613)))

(get-info :version)

(assert (=> b!571385 (= res!361033 (or (undefined!6441 lt!260456) (not ((_ is Intermediate!5629) lt!260456))))))

(declare-fun b!571386 () Bool)

(declare-fun res!361027 () Bool)

(assert (=> b!571386 (=> (not res!361027) (not e!328615))))

(declare-fun arrayContainsKey!0 (array!35788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571386 (= res!361027 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571387 () Bool)

(assert (=> b!571387 (= e!328615 e!328620)))

(declare-fun res!361025 () Bool)

(assert (=> b!571387 (=> (not res!361025) (not e!328620))))

(declare-fun lt!260460 () SeekEntryResult!5629)

(assert (=> b!571387 (= res!361025 (or (= lt!260460 (MissingZero!5629 i!1132)) (= lt!260460 (MissingVacant!5629 i!1132))))))

(assert (=> b!571387 (= lt!260460 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52382 res!361035) b!571382))

(assert (= (and b!571382 res!361029) b!571384))

(assert (= (and b!571384 res!361026) b!571383))

(assert (= (and b!571383 res!361034) b!571386))

(assert (= (and b!571386 res!361027) b!571387))

(assert (= (and b!571387 res!361025) b!571379))

(assert (= (and b!571379 res!361037) b!571375))

(assert (= (and b!571375 res!361031) b!571376))

(assert (= (and b!571376 res!361032) b!571381))

(assert (= (and b!571381 res!361028) b!571385))

(assert (= (and b!571385 (not res!361033)) b!571380))

(assert (= (and b!571380 (not res!361030)) b!571378))

(assert (= (and b!571378 res!361036) b!571377))

(declare-fun m!549749 () Bool)

(assert (=> b!571377 m!549749))

(declare-fun m!549751 () Bool)

(assert (=> b!571377 m!549751))

(declare-fun m!549753 () Bool)

(assert (=> b!571381 m!549753))

(assert (=> b!571381 m!549753))

(declare-fun m!549755 () Bool)

(assert (=> b!571381 m!549755))

(declare-fun m!549757 () Bool)

(assert (=> b!571381 m!549757))

(declare-fun m!549759 () Bool)

(assert (=> b!571381 m!549759))

(declare-fun m!549761 () Bool)

(assert (=> b!571383 m!549761))

(declare-fun m!549763 () Bool)

(assert (=> b!571386 m!549763))

(declare-fun m!549765 () Bool)

(assert (=> b!571379 m!549765))

(assert (=> b!571378 m!549753))

(assert (=> b!571378 m!549753))

(declare-fun m!549767 () Bool)

(assert (=> b!571378 m!549767))

(assert (=> b!571376 m!549753))

(declare-fun m!549769 () Bool)

(assert (=> b!571376 m!549769))

(assert (=> b!571376 m!549753))

(declare-fun m!549771 () Bool)

(assert (=> b!571376 m!549771))

(assert (=> b!571376 m!549753))

(declare-fun m!549773 () Bool)

(assert (=> b!571376 m!549773))

(declare-fun m!549775 () Bool)

(assert (=> b!571376 m!549775))

(declare-fun m!549777 () Bool)

(assert (=> b!571376 m!549777))

(declare-fun m!549779 () Bool)

(assert (=> b!571376 m!549779))

(assert (=> b!571384 m!549753))

(assert (=> b!571384 m!549753))

(declare-fun m!549781 () Bool)

(assert (=> b!571384 m!549781))

(assert (=> b!571380 m!549753))

(declare-fun m!549783 () Bool)

(assert (=> b!571380 m!549783))

(declare-fun m!549785 () Bool)

(assert (=> start!52382 m!549785))

(declare-fun m!549787 () Bool)

(assert (=> start!52382 m!549787))

(declare-fun m!549789 () Bool)

(assert (=> b!571375 m!549789))

(declare-fun m!549791 () Bool)

(assert (=> b!571387 m!549791))

(check-sat (not start!52382) (not b!571378) (not b!571386) (not b!571384) (not b!571387) (not b!571377) (not b!571381) (not b!571379) (not b!571383) (not b!571375) (not b!571376))
(check-sat)
