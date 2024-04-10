; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120406 () Bool)

(assert start!120406)

(declare-fun b!1401707 () Bool)

(declare-fun res!940227 () Bool)

(declare-fun e!793704 () Bool)

(assert (=> b!1401707 (=> (not res!940227) (not e!793704))))

(declare-datatypes ((array!95815 0))(
  ( (array!95816 (arr!46258 (Array (_ BitVec 32) (_ BitVec 64))) (size!46808 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95815)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95815 (_ BitVec 32)) Bool)

(assert (=> b!1401707 (= res!940227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401708 () Bool)

(declare-fun res!940219 () Bool)

(assert (=> b!1401708 (=> (not res!940219) (not e!793704))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401708 (= res!940219 (validKeyInArray!0 (select (arr!46258 a!2901) i!1037)))))

(declare-fun b!1401709 () Bool)

(declare-fun res!940228 () Bool)

(assert (=> b!1401709 (=> (not res!940228) (not e!793704))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1401709 (= res!940228 (validKeyInArray!0 (select (arr!46258 a!2901) j!112)))))

(declare-fun b!1401710 () Bool)

(declare-fun e!793705 () Bool)

(declare-fun e!793707 () Bool)

(assert (=> b!1401710 (= e!793705 e!793707)))

(declare-fun res!940220 () Bool)

(assert (=> b!1401710 (=> res!940220 e!793707)))

(declare-fun lt!617128 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10575 0))(
  ( (MissingZero!10575 (index!44677 (_ BitVec 32))) (Found!10575 (index!44678 (_ BitVec 32))) (Intermediate!10575 (undefined!11387 Bool) (index!44679 (_ BitVec 32)) (x!126306 (_ BitVec 32))) (Undefined!10575) (MissingVacant!10575 (index!44680 (_ BitVec 32))) )
))
(declare-fun lt!617126 () SeekEntryResult!10575)

(declare-fun lt!617133 () SeekEntryResult!10575)

(assert (=> b!1401710 (= res!940220 (or (bvslt (x!126306 lt!617133) #b00000000000000000000000000000000) (bvsgt (x!126306 lt!617133) #b01111111111111111111111111111110) (bvslt (x!126306 lt!617126) #b00000000000000000000000000000000) (bvsgt (x!126306 lt!617126) #b01111111111111111111111111111110) (bvslt lt!617128 #b00000000000000000000000000000000) (bvsge lt!617128 (size!46808 a!2901)) (bvslt (index!44679 lt!617133) #b00000000000000000000000000000000) (bvsge (index!44679 lt!617133) (size!46808 a!2901)) (bvslt (index!44679 lt!617126) #b00000000000000000000000000000000) (bvsge (index!44679 lt!617126) (size!46808 a!2901)) (not (= lt!617133 (Intermediate!10575 false (index!44679 lt!617133) (x!126306 lt!617133)))) (not (= lt!617126 (Intermediate!10575 false (index!44679 lt!617126) (x!126306 lt!617126))))))))

(declare-fun e!793703 () Bool)

(assert (=> b!1401710 e!793703))

(declare-fun res!940223 () Bool)

(assert (=> b!1401710 (=> (not res!940223) (not e!793703))))

(assert (=> b!1401710 (= res!940223 (and (not (undefined!11387 lt!617126)) (= (index!44679 lt!617126) i!1037) (bvslt (x!126306 lt!617126) (x!126306 lt!617133)) (= (select (store (arr!46258 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44679 lt!617126)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47154 0))(
  ( (Unit!47155) )
))
(declare-fun lt!617127 () Unit!47154)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47154)

(assert (=> b!1401710 (= lt!617127 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617128 (x!126306 lt!617133) (index!44679 lt!617133) (x!126306 lt!617126) (index!44679 lt!617126) (undefined!11387 lt!617126) mask!2840))))

(declare-fun b!1401711 () Bool)

(declare-fun e!793706 () Bool)

(assert (=> b!1401711 (= e!793706 e!793705)))

(declare-fun res!940221 () Bool)

(assert (=> b!1401711 (=> res!940221 e!793705)))

(assert (=> b!1401711 (= res!940221 (or (= lt!617133 lt!617126) (not (is-Intermediate!10575 lt!617126))))))

(declare-fun lt!617129 () array!95815)

(declare-fun lt!617132 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95815 (_ BitVec 32)) SeekEntryResult!10575)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401711 (= lt!617126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617132 mask!2840) lt!617132 lt!617129 mask!2840))))

(assert (=> b!1401711 (= lt!617132 (select (store (arr!46258 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401711 (= lt!617129 (array!95816 (store (arr!46258 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46808 a!2901)))))

(declare-fun b!1401712 () Bool)

(assert (=> b!1401712 (= e!793704 (not e!793706))))

(declare-fun res!940218 () Bool)

(assert (=> b!1401712 (=> res!940218 e!793706)))

(assert (=> b!1401712 (= res!940218 (or (not (is-Intermediate!10575 lt!617133)) (undefined!11387 lt!617133)))))

(declare-fun e!793709 () Bool)

(assert (=> b!1401712 e!793709))

(declare-fun res!940224 () Bool)

(assert (=> b!1401712 (=> (not res!940224) (not e!793709))))

(assert (=> b!1401712 (= res!940224 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617131 () Unit!47154)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47154)

(assert (=> b!1401712 (= lt!617131 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401712 (= lt!617133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617128 (select (arr!46258 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401712 (= lt!617128 (toIndex!0 (select (arr!46258 a!2901) j!112) mask!2840))))

(declare-fun b!1401713 () Bool)

(declare-fun res!940225 () Bool)

(assert (=> b!1401713 (=> (not res!940225) (not e!793704))))

(declare-datatypes ((List!32777 0))(
  ( (Nil!32774) (Cons!32773 (h!34021 (_ BitVec 64)) (t!47471 List!32777)) )
))
(declare-fun arrayNoDuplicates!0 (array!95815 (_ BitVec 32) List!32777) Bool)

(assert (=> b!1401713 (= res!940225 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32774))))

(declare-fun b!1401714 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95815 (_ BitVec 32)) SeekEntryResult!10575)

(assert (=> b!1401714 (= e!793709 (= (seekEntryOrOpen!0 (select (arr!46258 a!2901) j!112) a!2901 mask!2840) (Found!10575 j!112)))))

(declare-fun b!1401716 () Bool)

(declare-fun res!940222 () Bool)

(assert (=> b!1401716 (=> (not res!940222) (not e!793704))))

(assert (=> b!1401716 (= res!940222 (and (= (size!46808 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46808 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46808 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401717 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95815 (_ BitVec 32)) SeekEntryResult!10575)

(assert (=> b!1401717 (= e!793703 (= (seekEntryOrOpen!0 lt!617132 lt!617129 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126306 lt!617126) (index!44679 lt!617126) (index!44679 lt!617126) (select (arr!46258 a!2901) j!112) lt!617129 mask!2840)))))

(declare-fun res!940226 () Bool)

(assert (=> start!120406 (=> (not res!940226) (not e!793704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120406 (= res!940226 (validMask!0 mask!2840))))

(assert (=> start!120406 e!793704))

(assert (=> start!120406 true))

(declare-fun array_inv!35286 (array!95815) Bool)

(assert (=> start!120406 (array_inv!35286 a!2901)))

(declare-fun b!1401715 () Bool)

(assert (=> b!1401715 (= e!793707 true)))

(declare-fun lt!617130 () SeekEntryResult!10575)

(assert (=> b!1401715 (= lt!617130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617128 lt!617132 lt!617129 mask!2840))))

(assert (= (and start!120406 res!940226) b!1401716))

(assert (= (and b!1401716 res!940222) b!1401708))

(assert (= (and b!1401708 res!940219) b!1401709))

(assert (= (and b!1401709 res!940228) b!1401707))

(assert (= (and b!1401707 res!940227) b!1401713))

(assert (= (and b!1401713 res!940225) b!1401712))

(assert (= (and b!1401712 res!940224) b!1401714))

(assert (= (and b!1401712 (not res!940218)) b!1401711))

(assert (= (and b!1401711 (not res!940221)) b!1401710))

(assert (= (and b!1401710 res!940223) b!1401717))

(assert (= (and b!1401710 (not res!940220)) b!1401715))

(declare-fun m!1289581 () Bool)

(assert (=> b!1401708 m!1289581))

(assert (=> b!1401708 m!1289581))

(declare-fun m!1289583 () Bool)

(assert (=> b!1401708 m!1289583))

(declare-fun m!1289585 () Bool)

(assert (=> b!1401713 m!1289585))

(declare-fun m!1289587 () Bool)

(assert (=> b!1401715 m!1289587))

(declare-fun m!1289589 () Bool)

(assert (=> start!120406 m!1289589))

(declare-fun m!1289591 () Bool)

(assert (=> start!120406 m!1289591))

(declare-fun m!1289593 () Bool)

(assert (=> b!1401712 m!1289593))

(declare-fun m!1289595 () Bool)

(assert (=> b!1401712 m!1289595))

(assert (=> b!1401712 m!1289593))

(declare-fun m!1289597 () Bool)

(assert (=> b!1401712 m!1289597))

(assert (=> b!1401712 m!1289593))

(declare-fun m!1289599 () Bool)

(assert (=> b!1401712 m!1289599))

(declare-fun m!1289601 () Bool)

(assert (=> b!1401712 m!1289601))

(declare-fun m!1289603 () Bool)

(assert (=> b!1401710 m!1289603))

(declare-fun m!1289605 () Bool)

(assert (=> b!1401710 m!1289605))

(declare-fun m!1289607 () Bool)

(assert (=> b!1401710 m!1289607))

(assert (=> b!1401714 m!1289593))

(assert (=> b!1401714 m!1289593))

(declare-fun m!1289609 () Bool)

(assert (=> b!1401714 m!1289609))

(declare-fun m!1289611 () Bool)

(assert (=> b!1401707 m!1289611))

(declare-fun m!1289613 () Bool)

(assert (=> b!1401711 m!1289613))

(assert (=> b!1401711 m!1289613))

(declare-fun m!1289615 () Bool)

(assert (=> b!1401711 m!1289615))

(assert (=> b!1401711 m!1289603))

(declare-fun m!1289617 () Bool)

(assert (=> b!1401711 m!1289617))

(assert (=> b!1401709 m!1289593))

(assert (=> b!1401709 m!1289593))

(declare-fun m!1289619 () Bool)

(assert (=> b!1401709 m!1289619))

(declare-fun m!1289621 () Bool)

(assert (=> b!1401717 m!1289621))

(assert (=> b!1401717 m!1289593))

(assert (=> b!1401717 m!1289593))

(declare-fun m!1289623 () Bool)

(assert (=> b!1401717 m!1289623))

(push 1)

