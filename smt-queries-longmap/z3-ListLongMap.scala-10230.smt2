; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120620 () Bool)

(assert start!120620)

(declare-fun res!941113 () Bool)

(declare-fun e!794717 () Bool)

(assert (=> start!120620 (=> (not res!941113) (not e!794717))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120620 (= res!941113 (validMask!0 mask!2840))))

(assert (=> start!120620 e!794717))

(assert (=> start!120620 true))

(declare-datatypes ((array!95951 0))(
  ( (array!95952 (arr!46324 (Array (_ BitVec 32) (_ BitVec 64))) (size!46875 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95951)

(declare-fun array_inv!35605 (array!95951) Bool)

(assert (=> start!120620 (array_inv!35605 a!2901)))

(declare-fun b!1403276 () Bool)

(declare-fun lt!617842 () (_ BitVec 64))

(declare-fun lt!617837 () array!95951)

(declare-datatypes ((SeekEntryResult!10544 0))(
  ( (MissingZero!10544 (index!44553 (_ BitVec 32))) (Found!10544 (index!44554 (_ BitVec 32))) (Intermediate!10544 (undefined!11356 Bool) (index!44555 (_ BitVec 32)) (x!126334 (_ BitVec 32))) (Undefined!10544) (MissingVacant!10544 (index!44556 (_ BitVec 32))) )
))
(declare-fun lt!617839 () SeekEntryResult!10544)

(declare-fun e!794718 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95951 (_ BitVec 32)) SeekEntryResult!10544)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95951 (_ BitVec 32)) SeekEntryResult!10544)

(assert (=> b!1403276 (= e!794718 (= (seekEntryOrOpen!0 lt!617842 lt!617837 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126334 lt!617839) (index!44555 lt!617839) (index!44555 lt!617839) (select (arr!46324 a!2901) j!112) lt!617837 mask!2840)))))

(declare-fun b!1403277 () Bool)

(declare-fun res!941104 () Bool)

(assert (=> b!1403277 (=> (not res!941104) (not e!794717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403277 (= res!941104 (validKeyInArray!0 (select (arr!46324 a!2901) j!112)))))

(declare-fun b!1403278 () Bool)

(declare-fun res!941107 () Bool)

(assert (=> b!1403278 (=> (not res!941107) (not e!794717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95951 (_ BitVec 32)) Bool)

(assert (=> b!1403278 (= res!941107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403279 () Bool)

(declare-fun res!941103 () Bool)

(assert (=> b!1403279 (=> (not res!941103) (not e!794717))))

(declare-datatypes ((List!32830 0))(
  ( (Nil!32827) (Cons!32826 (h!34082 (_ BitVec 64)) (t!47516 List!32830)) )
))
(declare-fun arrayNoDuplicates!0 (array!95951 (_ BitVec 32) List!32830) Bool)

(assert (=> b!1403279 (= res!941103 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32827))))

(declare-fun e!794715 () Bool)

(declare-fun b!1403280 () Bool)

(assert (=> b!1403280 (= e!794715 (= (seekEntryOrOpen!0 (select (arr!46324 a!2901) j!112) a!2901 mask!2840) (Found!10544 j!112)))))

(declare-fun b!1403281 () Bool)

(declare-fun e!794716 () Bool)

(declare-fun e!794720 () Bool)

(assert (=> b!1403281 (= e!794716 e!794720)))

(declare-fun res!941110 () Bool)

(assert (=> b!1403281 (=> res!941110 e!794720)))

(declare-fun lt!617838 () (_ BitVec 32))

(declare-fun lt!617840 () SeekEntryResult!10544)

(assert (=> b!1403281 (= res!941110 (or (bvslt (x!126334 lt!617840) #b00000000000000000000000000000000) (bvsgt (x!126334 lt!617840) #b01111111111111111111111111111110) (bvslt (x!126334 lt!617839) #b00000000000000000000000000000000) (bvsgt (x!126334 lt!617839) #b01111111111111111111111111111110) (bvslt lt!617838 #b00000000000000000000000000000000) (bvsge lt!617838 (size!46875 a!2901)) (bvslt (index!44555 lt!617840) #b00000000000000000000000000000000) (bvsge (index!44555 lt!617840) (size!46875 a!2901)) (bvslt (index!44555 lt!617839) #b00000000000000000000000000000000) (bvsge (index!44555 lt!617839) (size!46875 a!2901)) (not (= lt!617840 (Intermediate!10544 false (index!44555 lt!617840) (x!126334 lt!617840)))) (not (= lt!617839 (Intermediate!10544 false (index!44555 lt!617839) (x!126334 lt!617839))))))))

(assert (=> b!1403281 e!794718))

(declare-fun res!941108 () Bool)

(assert (=> b!1403281 (=> (not res!941108) (not e!794718))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403281 (= res!941108 (and (not (undefined!11356 lt!617839)) (= (index!44555 lt!617839) i!1037) (bvslt (x!126334 lt!617839) (x!126334 lt!617840)) (= (select (store (arr!46324 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44555 lt!617839)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47119 0))(
  ( (Unit!47120) )
))
(declare-fun lt!617843 () Unit!47119)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47119)

(assert (=> b!1403281 (= lt!617843 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617838 (x!126334 lt!617840) (index!44555 lt!617840) (x!126334 lt!617839) (index!44555 lt!617839) (undefined!11356 lt!617839) mask!2840))))

(declare-fun b!1403282 () Bool)

(assert (=> b!1403282 (= e!794720 true)))

(declare-fun lt!617841 () SeekEntryResult!10544)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95951 (_ BitVec 32)) SeekEntryResult!10544)

(assert (=> b!1403282 (= lt!617841 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617838 lt!617842 lt!617837 mask!2840))))

(declare-fun b!1403283 () Bool)

(declare-fun res!941105 () Bool)

(assert (=> b!1403283 (=> (not res!941105) (not e!794717))))

(assert (=> b!1403283 (= res!941105 (validKeyInArray!0 (select (arr!46324 a!2901) i!1037)))))

(declare-fun b!1403284 () Bool)

(declare-fun e!794714 () Bool)

(assert (=> b!1403284 (= e!794714 e!794716)))

(declare-fun res!941111 () Bool)

(assert (=> b!1403284 (=> res!941111 e!794716)))

(get-info :version)

(assert (=> b!1403284 (= res!941111 (or (= lt!617840 lt!617839) (not ((_ is Intermediate!10544) lt!617839))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403284 (= lt!617839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617842 mask!2840) lt!617842 lt!617837 mask!2840))))

(assert (=> b!1403284 (= lt!617842 (select (store (arr!46324 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1403284 (= lt!617837 (array!95952 (store (arr!46324 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46875 a!2901)))))

(declare-fun b!1403285 () Bool)

(declare-fun res!941106 () Bool)

(assert (=> b!1403285 (=> (not res!941106) (not e!794717))))

(assert (=> b!1403285 (= res!941106 (and (= (size!46875 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46875 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46875 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403286 () Bool)

(assert (=> b!1403286 (= e!794717 (not e!794714))))

(declare-fun res!941112 () Bool)

(assert (=> b!1403286 (=> res!941112 e!794714)))

(assert (=> b!1403286 (= res!941112 (or (not ((_ is Intermediate!10544) lt!617840)) (undefined!11356 lt!617840)))))

(assert (=> b!1403286 e!794715))

(declare-fun res!941109 () Bool)

(assert (=> b!1403286 (=> (not res!941109) (not e!794715))))

(assert (=> b!1403286 (= res!941109 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617836 () Unit!47119)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47119)

(assert (=> b!1403286 (= lt!617836 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403286 (= lt!617840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617838 (select (arr!46324 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1403286 (= lt!617838 (toIndex!0 (select (arr!46324 a!2901) j!112) mask!2840))))

(assert (= (and start!120620 res!941113) b!1403285))

(assert (= (and b!1403285 res!941106) b!1403283))

(assert (= (and b!1403283 res!941105) b!1403277))

(assert (= (and b!1403277 res!941104) b!1403278))

(assert (= (and b!1403278 res!941107) b!1403279))

(assert (= (and b!1403279 res!941103) b!1403286))

(assert (= (and b!1403286 res!941109) b!1403280))

(assert (= (and b!1403286 (not res!941112)) b!1403284))

(assert (= (and b!1403284 (not res!941111)) b!1403281))

(assert (= (and b!1403281 res!941108) b!1403276))

(assert (= (and b!1403281 (not res!941110)) b!1403282))

(declare-fun m!1291525 () Bool)

(assert (=> b!1403282 m!1291525))

(declare-fun m!1291527 () Bool)

(assert (=> start!120620 m!1291527))

(declare-fun m!1291529 () Bool)

(assert (=> start!120620 m!1291529))

(declare-fun m!1291531 () Bool)

(assert (=> b!1403281 m!1291531))

(declare-fun m!1291533 () Bool)

(assert (=> b!1403281 m!1291533))

(declare-fun m!1291535 () Bool)

(assert (=> b!1403281 m!1291535))

(declare-fun m!1291537 () Bool)

(assert (=> b!1403276 m!1291537))

(declare-fun m!1291539 () Bool)

(assert (=> b!1403276 m!1291539))

(assert (=> b!1403276 m!1291539))

(declare-fun m!1291541 () Bool)

(assert (=> b!1403276 m!1291541))

(declare-fun m!1291543 () Bool)

(assert (=> b!1403284 m!1291543))

(assert (=> b!1403284 m!1291543))

(declare-fun m!1291545 () Bool)

(assert (=> b!1403284 m!1291545))

(assert (=> b!1403284 m!1291531))

(declare-fun m!1291547 () Bool)

(assert (=> b!1403284 m!1291547))

(assert (=> b!1403280 m!1291539))

(assert (=> b!1403280 m!1291539))

(declare-fun m!1291549 () Bool)

(assert (=> b!1403280 m!1291549))

(assert (=> b!1403277 m!1291539))

(assert (=> b!1403277 m!1291539))

(declare-fun m!1291551 () Bool)

(assert (=> b!1403277 m!1291551))

(declare-fun m!1291553 () Bool)

(assert (=> b!1403283 m!1291553))

(assert (=> b!1403283 m!1291553))

(declare-fun m!1291555 () Bool)

(assert (=> b!1403283 m!1291555))

(assert (=> b!1403286 m!1291539))

(declare-fun m!1291557 () Bool)

(assert (=> b!1403286 m!1291557))

(assert (=> b!1403286 m!1291539))

(assert (=> b!1403286 m!1291539))

(declare-fun m!1291559 () Bool)

(assert (=> b!1403286 m!1291559))

(declare-fun m!1291561 () Bool)

(assert (=> b!1403286 m!1291561))

(declare-fun m!1291563 () Bool)

(assert (=> b!1403286 m!1291563))

(declare-fun m!1291565 () Bool)

(assert (=> b!1403279 m!1291565))

(declare-fun m!1291567 () Bool)

(assert (=> b!1403278 m!1291567))

(check-sat (not b!1403280) (not b!1403284) (not b!1403282) (not b!1403278) (not b!1403286) (not start!120620) (not b!1403279) (not b!1403277) (not b!1403283) (not b!1403276) (not b!1403281))
(check-sat)
