; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52506 () Bool)

(assert start!52506)

(declare-fun b!573134 () Bool)

(declare-fun res!362543 () Bool)

(declare-fun e!329715 () Bool)

(assert (=> b!573134 (=> (not res!362543) (not e!329715))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35850 0))(
  ( (array!35851 (arr!17212 (Array (_ BitVec 32) (_ BitVec 64))) (size!17576 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35850)

(assert (=> b!573134 (= res!362543 (and (= (size!17576 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17576 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17576 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!573135 () Bool)

(declare-fun res!362542 () Bool)

(declare-fun e!329712 () Bool)

(assert (=> b!573135 (=> (not res!362542) (not e!329712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35850 (_ BitVec 32)) Bool)

(assert (=> b!573135 (= res!362542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!573136 () Bool)

(declare-fun e!329708 () Bool)

(assert (=> b!573136 (= e!329708 (not true))))

(declare-fun e!329709 () Bool)

(assert (=> b!573136 e!329709))

(declare-fun res!362544 () Bool)

(assert (=> b!573136 (=> (not res!362544) (not e!329709))))

(declare-datatypes ((SeekEntryResult!5617 0))(
  ( (MissingZero!5617 (index!24695 (_ BitVec 32))) (Found!5617 (index!24696 (_ BitVec 32))) (Intermediate!5617 (undefined!6429 Bool) (index!24697 (_ BitVec 32)) (x!53713 (_ BitVec 32))) (Undefined!5617) (MissingVacant!5617 (index!24698 (_ BitVec 32))) )
))
(declare-fun lt!261691 () SeekEntryResult!5617)

(assert (=> b!573136 (= res!362544 (= lt!261691 (Found!5617 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35850 (_ BitVec 32)) SeekEntryResult!5617)

(assert (=> b!573136 (= lt!261691 (seekEntryOrOpen!0 (select (arr!17212 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!573136 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18007 0))(
  ( (Unit!18008) )
))
(declare-fun lt!261689 () Unit!18007)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18007)

(assert (=> b!573136 (= lt!261689 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!573137 () Bool)

(declare-fun e!329711 () Bool)

(assert (=> b!573137 (= e!329709 e!329711)))

(declare-fun res!362540 () Bool)

(assert (=> b!573137 (=> res!362540 e!329711)))

(declare-fun lt!261690 () SeekEntryResult!5617)

(get-info :version)

(assert (=> b!573137 (= res!362540 (or (undefined!6429 lt!261690) (not ((_ is Intermediate!5617) lt!261690))))))

(declare-fun b!573138 () Bool)

(declare-fun e!329714 () Bool)

(assert (=> b!573138 (= e!329711 e!329714)))

(declare-fun res!362538 () Bool)

(assert (=> b!573138 (=> res!362538 e!329714)))

(declare-fun lt!261692 () (_ BitVec 64))

(assert (=> b!573138 (= res!362538 (or (= lt!261692 (select (arr!17212 a!3118) j!142)) (= lt!261692 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!573138 (= lt!261692 (select (arr!17212 a!3118) (index!24697 lt!261690)))))

(declare-fun b!573139 () Bool)

(declare-fun res!362547 () Bool)

(assert (=> b!573139 (=> (not res!362547) (not e!329712))))

(declare-datatypes ((List!11199 0))(
  ( (Nil!11196) (Cons!11195 (h!12225 (_ BitVec 64)) (t!17419 List!11199)) )
))
(declare-fun arrayNoDuplicates!0 (array!35850 (_ BitVec 32) List!11199) Bool)

(assert (=> b!573139 (= res!362547 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11196))))

(declare-fun b!573140 () Bool)

(declare-fun res!362548 () Bool)

(assert (=> b!573140 (=> (not res!362548) (not e!329715))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35850 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!573140 (= res!362548 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!573141 () Bool)

(declare-fun res!362537 () Bool)

(assert (=> b!573141 (=> (not res!362537) (not e!329715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!573141 (= res!362537 (validKeyInArray!0 (select (arr!17212 a!3118) j!142)))))

(declare-fun b!573133 () Bool)

(assert (=> b!573133 (= e!329715 e!329712)))

(declare-fun res!362541 () Bool)

(assert (=> b!573133 (=> (not res!362541) (not e!329712))))

(declare-fun lt!261695 () SeekEntryResult!5617)

(assert (=> b!573133 (= res!362541 (or (= lt!261695 (MissingZero!5617 i!1132)) (= lt!261695 (MissingVacant!5617 i!1132))))))

(assert (=> b!573133 (= lt!261695 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!362546 () Bool)

(assert (=> start!52506 (=> (not res!362546) (not e!329715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52506 (= res!362546 (validMask!0 mask!3119))))

(assert (=> start!52506 e!329715))

(assert (=> start!52506 true))

(declare-fun array_inv!13071 (array!35850) Bool)

(assert (=> start!52506 (array_inv!13071 a!3118)))

(declare-fun lt!261697 () array!35850)

(declare-fun lt!261693 () (_ BitVec 64))

(declare-fun b!573142 () Bool)

(declare-fun e!329713 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35850 (_ BitVec 32)) SeekEntryResult!5617)

(assert (=> b!573142 (= e!329713 (= (seekEntryOrOpen!0 lt!261693 lt!261697 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53713 lt!261690) (index!24697 lt!261690) (index!24697 lt!261690) lt!261693 lt!261697 mask!3119)))))

(declare-fun b!573143 () Bool)

(assert (=> b!573143 (= e!329714 e!329713)))

(declare-fun res!362539 () Bool)

(assert (=> b!573143 (=> (not res!362539) (not e!329713))))

(assert (=> b!573143 (= res!362539 (= lt!261691 (seekKeyOrZeroReturnVacant!0 (x!53713 lt!261690) (index!24697 lt!261690) (index!24697 lt!261690) (select (arr!17212 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!573144 () Bool)

(declare-fun res!362536 () Bool)

(assert (=> b!573144 (=> (not res!362536) (not e!329715))))

(assert (=> b!573144 (= res!362536 (validKeyInArray!0 k0!1914))))

(declare-fun b!573145 () Bool)

(assert (=> b!573145 (= e!329712 e!329708)))

(declare-fun res!362545 () Bool)

(assert (=> b!573145 (=> (not res!362545) (not e!329708))))

(declare-fun lt!261694 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35850 (_ BitVec 32)) SeekEntryResult!5617)

(assert (=> b!573145 (= res!362545 (= lt!261690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261694 lt!261693 lt!261697 mask!3119)))))

(declare-fun lt!261696 () (_ BitVec 32))

(assert (=> b!573145 (= lt!261690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261696 (select (arr!17212 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573145 (= lt!261694 (toIndex!0 lt!261693 mask!3119))))

(assert (=> b!573145 (= lt!261693 (select (store (arr!17212 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!573145 (= lt!261696 (toIndex!0 (select (arr!17212 a!3118) j!142) mask!3119))))

(assert (=> b!573145 (= lt!261697 (array!35851 (store (arr!17212 a!3118) i!1132 k0!1914) (size!17576 a!3118)))))

(assert (= (and start!52506 res!362546) b!573134))

(assert (= (and b!573134 res!362543) b!573141))

(assert (= (and b!573141 res!362537) b!573144))

(assert (= (and b!573144 res!362536) b!573140))

(assert (= (and b!573140 res!362548) b!573133))

(assert (= (and b!573133 res!362541) b!573135))

(assert (= (and b!573135 res!362542) b!573139))

(assert (= (and b!573139 res!362547) b!573145))

(assert (= (and b!573145 res!362545) b!573136))

(assert (= (and b!573136 res!362544) b!573137))

(assert (= (and b!573137 (not res!362540)) b!573138))

(assert (= (and b!573138 (not res!362538)) b!573143))

(assert (= (and b!573143 res!362539) b!573142))

(declare-fun m!552311 () Bool)

(assert (=> b!573136 m!552311))

(assert (=> b!573136 m!552311))

(declare-fun m!552313 () Bool)

(assert (=> b!573136 m!552313))

(declare-fun m!552315 () Bool)

(assert (=> b!573136 m!552315))

(declare-fun m!552317 () Bool)

(assert (=> b!573136 m!552317))

(declare-fun m!552319 () Bool)

(assert (=> b!573135 m!552319))

(assert (=> b!573145 m!552311))

(declare-fun m!552321 () Bool)

(assert (=> b!573145 m!552321))

(assert (=> b!573145 m!552311))

(declare-fun m!552323 () Bool)

(assert (=> b!573145 m!552323))

(assert (=> b!573145 m!552311))

(declare-fun m!552325 () Bool)

(assert (=> b!573145 m!552325))

(declare-fun m!552327 () Bool)

(assert (=> b!573145 m!552327))

(declare-fun m!552329 () Bool)

(assert (=> b!573145 m!552329))

(declare-fun m!552331 () Bool)

(assert (=> b!573145 m!552331))

(assert (=> b!573138 m!552311))

(declare-fun m!552333 () Bool)

(assert (=> b!573138 m!552333))

(assert (=> b!573141 m!552311))

(assert (=> b!573141 m!552311))

(declare-fun m!552335 () Bool)

(assert (=> b!573141 m!552335))

(declare-fun m!552337 () Bool)

(assert (=> b!573142 m!552337))

(declare-fun m!552339 () Bool)

(assert (=> b!573142 m!552339))

(declare-fun m!552341 () Bool)

(assert (=> start!52506 m!552341))

(declare-fun m!552343 () Bool)

(assert (=> start!52506 m!552343))

(assert (=> b!573143 m!552311))

(assert (=> b!573143 m!552311))

(declare-fun m!552345 () Bool)

(assert (=> b!573143 m!552345))

(declare-fun m!552347 () Bool)

(assert (=> b!573144 m!552347))

(declare-fun m!552349 () Bool)

(assert (=> b!573133 m!552349))

(declare-fun m!552351 () Bool)

(assert (=> b!573140 m!552351))

(declare-fun m!552353 () Bool)

(assert (=> b!573139 m!552353))

(check-sat (not b!573136) (not b!573145) (not b!573143) (not b!573140) (not b!573135) (not b!573144) (not b!573139) (not b!573133) (not b!573141) (not b!573142) (not start!52506))
(check-sat)
