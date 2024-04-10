; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51622 () Bool)

(assert start!51622)

(declare-fun b!564945 () Bool)

(declare-fun res!356103 () Bool)

(declare-fun e!325302 () Bool)

(assert (=> b!564945 (=> (not res!356103) (not e!325302))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35487 0))(
  ( (array!35488 (arr!17044 (Array (_ BitVec 32) (_ BitVec 64))) (size!17408 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35487)

(declare-datatypes ((SeekEntryResult!5493 0))(
  ( (MissingZero!5493 (index!24199 (_ BitVec 32))) (Found!5493 (index!24200 (_ BitVec 32))) (Intermediate!5493 (undefined!6305 Bool) (index!24201 (_ BitVec 32)) (x!53068 (_ BitVec 32))) (Undefined!5493) (MissingVacant!5493 (index!24202 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35487 (_ BitVec 32)) SeekEntryResult!5493)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564945 (= res!356103 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17044 a!3118) j!142) mask!3119) (select (arr!17044 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17044 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17044 a!3118) i!1132 k0!1914) j!142) (array!35488 (store (arr!17044 a!3118) i!1132 k0!1914) (size!17408 a!3118)) mask!3119)))))

(declare-fun b!564946 () Bool)

(declare-fun res!356104 () Bool)

(declare-fun e!325300 () Bool)

(assert (=> b!564946 (=> (not res!356104) (not e!325300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564946 (= res!356104 (validKeyInArray!0 (select (arr!17044 a!3118) j!142)))))

(declare-fun b!564947 () Bool)

(declare-fun res!356105 () Bool)

(assert (=> b!564947 (=> (not res!356105) (not e!325302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35487 (_ BitVec 32)) Bool)

(assert (=> b!564947 (= res!356105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564948 () Bool)

(declare-fun res!356097 () Bool)

(assert (=> b!564948 (=> (not res!356097) (not e!325302))))

(declare-datatypes ((List!11124 0))(
  ( (Nil!11121) (Cons!11120 (h!12123 (_ BitVec 64)) (t!17352 List!11124)) )
))
(declare-fun arrayNoDuplicates!0 (array!35487 (_ BitVec 32) List!11124) Bool)

(assert (=> b!564948 (= res!356097 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11121))))

(declare-fun b!564950 () Bool)

(declare-fun res!356098 () Bool)

(assert (=> b!564950 (=> (not res!356098) (not e!325300))))

(declare-fun arrayContainsKey!0 (array!35487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564950 (= res!356098 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564951 () Bool)

(assert (=> b!564951 (= e!325302 (not true))))

(assert (=> b!564951 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17688 0))(
  ( (Unit!17689) )
))
(declare-fun lt!257715 () Unit!17688)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17688)

(assert (=> b!564951 (= lt!257715 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!564952 () Bool)

(assert (=> b!564952 (= e!325300 e!325302)))

(declare-fun res!356102 () Bool)

(assert (=> b!564952 (=> (not res!356102) (not e!325302))))

(declare-fun lt!257716 () SeekEntryResult!5493)

(assert (=> b!564952 (= res!356102 (or (= lt!257716 (MissingZero!5493 i!1132)) (= lt!257716 (MissingVacant!5493 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35487 (_ BitVec 32)) SeekEntryResult!5493)

(assert (=> b!564952 (= lt!257716 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564953 () Bool)

(declare-fun res!356099 () Bool)

(assert (=> b!564953 (=> (not res!356099) (not e!325300))))

(assert (=> b!564953 (= res!356099 (and (= (size!17408 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17408 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17408 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564949 () Bool)

(declare-fun res!356101 () Bool)

(assert (=> b!564949 (=> (not res!356101) (not e!325300))))

(assert (=> b!564949 (= res!356101 (validKeyInArray!0 k0!1914))))

(declare-fun res!356100 () Bool)

(assert (=> start!51622 (=> (not res!356100) (not e!325300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51622 (= res!356100 (validMask!0 mask!3119))))

(assert (=> start!51622 e!325300))

(assert (=> start!51622 true))

(declare-fun array_inv!12840 (array!35487) Bool)

(assert (=> start!51622 (array_inv!12840 a!3118)))

(assert (= (and start!51622 res!356100) b!564953))

(assert (= (and b!564953 res!356099) b!564946))

(assert (= (and b!564946 res!356104) b!564949))

(assert (= (and b!564949 res!356101) b!564950))

(assert (= (and b!564950 res!356098) b!564952))

(assert (= (and b!564952 res!356102) b!564947))

(assert (= (and b!564947 res!356105) b!564948))

(assert (= (and b!564948 res!356097) b!564945))

(assert (= (and b!564945 res!356103) b!564951))

(declare-fun m!543445 () Bool)

(assert (=> b!564952 m!543445))

(declare-fun m!543447 () Bool)

(assert (=> start!51622 m!543447))

(declare-fun m!543449 () Bool)

(assert (=> start!51622 m!543449))

(declare-fun m!543451 () Bool)

(assert (=> b!564946 m!543451))

(assert (=> b!564946 m!543451))

(declare-fun m!543453 () Bool)

(assert (=> b!564946 m!543453))

(declare-fun m!543455 () Bool)

(assert (=> b!564949 m!543455))

(declare-fun m!543457 () Bool)

(assert (=> b!564948 m!543457))

(declare-fun m!543459 () Bool)

(assert (=> b!564947 m!543459))

(declare-fun m!543461 () Bool)

(assert (=> b!564950 m!543461))

(declare-fun m!543463 () Bool)

(assert (=> b!564951 m!543463))

(declare-fun m!543465 () Bool)

(assert (=> b!564951 m!543465))

(assert (=> b!564945 m!543451))

(declare-fun m!543467 () Bool)

(assert (=> b!564945 m!543467))

(assert (=> b!564945 m!543451))

(declare-fun m!543469 () Bool)

(assert (=> b!564945 m!543469))

(declare-fun m!543471 () Bool)

(assert (=> b!564945 m!543471))

(assert (=> b!564945 m!543469))

(declare-fun m!543473 () Bool)

(assert (=> b!564945 m!543473))

(assert (=> b!564945 m!543467))

(assert (=> b!564945 m!543451))

(declare-fun m!543475 () Bool)

(assert (=> b!564945 m!543475))

(declare-fun m!543477 () Bool)

(assert (=> b!564945 m!543477))

(assert (=> b!564945 m!543469))

(assert (=> b!564945 m!543471))

(check-sat (not b!564949) (not b!564947) (not start!51622) (not b!564945) (not b!564952) (not b!564946) (not b!564951) (not b!564948) (not b!564950))
(check-sat)
