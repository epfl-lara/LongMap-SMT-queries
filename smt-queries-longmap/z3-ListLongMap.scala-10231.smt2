; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120440 () Bool)

(assert start!120440)

(declare-fun b!1402263 () Bool)

(declare-fun res!940780 () Bool)

(declare-fun e!794053 () Bool)

(assert (=> b!1402263 (=> (not res!940780) (not e!794053))))

(declare-datatypes ((array!95849 0))(
  ( (array!95850 (arr!46275 (Array (_ BitVec 32) (_ BitVec 64))) (size!46825 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95849)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95849 (_ BitVec 32)) Bool)

(assert (=> b!1402263 (= res!940780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402264 () Bool)

(declare-fun res!940775 () Bool)

(declare-fun e!794054 () Bool)

(assert (=> b!1402264 (=> res!940775 e!794054)))

(declare-datatypes ((SeekEntryResult!10592 0))(
  ( (MissingZero!10592 (index!44745 (_ BitVec 32))) (Found!10592 (index!44746 (_ BitVec 32))) (Intermediate!10592 (undefined!11404 Bool) (index!44747 (_ BitVec 32)) (x!126371 (_ BitVec 32))) (Undefined!10592) (MissingVacant!10592 (index!44748 (_ BitVec 32))) )
))
(declare-fun lt!617545 () SeekEntryResult!10592)

(declare-fun lt!617547 () array!95849)

(declare-fun lt!617551 () (_ BitVec 64))

(declare-fun lt!617553 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95849 (_ BitVec 32)) SeekEntryResult!10592)

(assert (=> b!1402264 (= res!940775 (not (= lt!617545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617553 lt!617551 lt!617547 mask!2840))))))

(declare-fun b!1402265 () Bool)

(declare-fun res!940782 () Bool)

(assert (=> b!1402265 (=> (not res!940782) (not e!794053))))

(declare-datatypes ((List!32794 0))(
  ( (Nil!32791) (Cons!32790 (h!34038 (_ BitVec 64)) (t!47488 List!32794)) )
))
(declare-fun arrayNoDuplicates!0 (array!95849 (_ BitVec 32) List!32794) Bool)

(assert (=> b!1402265 (= res!940782 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32791))))

(declare-fun b!1402266 () Bool)

(declare-fun e!794052 () Bool)

(assert (=> b!1402266 (= e!794053 (not e!794052))))

(declare-fun res!940777 () Bool)

(assert (=> b!1402266 (=> res!940777 e!794052)))

(declare-fun lt!617549 () SeekEntryResult!10592)

(get-info :version)

(assert (=> b!1402266 (= res!940777 (or (not ((_ is Intermediate!10592) lt!617549)) (undefined!11404 lt!617549)))))

(declare-fun lt!617548 () SeekEntryResult!10592)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402266 (= lt!617548 (Found!10592 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95849 (_ BitVec 32)) SeekEntryResult!10592)

(assert (=> b!1402266 (= lt!617548 (seekEntryOrOpen!0 (select (arr!46275 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402266 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47188 0))(
  ( (Unit!47189) )
))
(declare-fun lt!617546 () Unit!47188)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47188)

(assert (=> b!1402266 (= lt!617546 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402266 (= lt!617549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617553 (select (arr!46275 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402266 (= lt!617553 (toIndex!0 (select (arr!46275 a!2901) j!112) mask!2840))))

(declare-fun b!1402267 () Bool)

(declare-fun e!794050 () Bool)

(assert (=> b!1402267 (= e!794050 e!794054)))

(declare-fun res!940783 () Bool)

(assert (=> b!1402267 (=> res!940783 e!794054)))

(assert (=> b!1402267 (= res!940783 (or (bvslt (x!126371 lt!617549) #b00000000000000000000000000000000) (bvsgt (x!126371 lt!617549) #b01111111111111111111111111111110) (bvslt (x!126371 lt!617545) #b00000000000000000000000000000000) (bvsgt (x!126371 lt!617545) #b01111111111111111111111111111110) (bvslt lt!617553 #b00000000000000000000000000000000) (bvsge lt!617553 (size!46825 a!2901)) (bvslt (index!44747 lt!617549) #b00000000000000000000000000000000) (bvsge (index!44747 lt!617549) (size!46825 a!2901)) (bvslt (index!44747 lt!617545) #b00000000000000000000000000000000) (bvsge (index!44747 lt!617545) (size!46825 a!2901)) (not (= lt!617549 (Intermediate!10592 false (index!44747 lt!617549) (x!126371 lt!617549)))) (not (= lt!617545 (Intermediate!10592 false (index!44747 lt!617545) (x!126371 lt!617545))))))))

(declare-fun lt!617552 () SeekEntryResult!10592)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95849 (_ BitVec 32)) SeekEntryResult!10592)

(assert (=> b!1402267 (= lt!617552 (seekKeyOrZeroReturnVacant!0 (x!126371 lt!617545) (index!44747 lt!617545) (index!44747 lt!617545) (select (arr!46275 a!2901) j!112) lt!617547 mask!2840))))

(assert (=> b!1402267 (= lt!617552 (seekEntryOrOpen!0 lt!617551 lt!617547 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402267 (and (not (undefined!11404 lt!617545)) (= (index!44747 lt!617545) i!1037) (bvslt (x!126371 lt!617545) (x!126371 lt!617549)) (= (select (store (arr!46275 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44747 lt!617545)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!617550 () Unit!47188)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47188)

(assert (=> b!1402267 (= lt!617550 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617553 (x!126371 lt!617549) (index!44747 lt!617549) (x!126371 lt!617545) (index!44747 lt!617545) (undefined!11404 lt!617545) mask!2840))))

(declare-fun b!1402268 () Bool)

(declare-fun res!940779 () Bool)

(assert (=> b!1402268 (=> (not res!940779) (not e!794053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402268 (= res!940779 (validKeyInArray!0 (select (arr!46275 a!2901) j!112)))))

(declare-fun b!1402270 () Bool)

(assert (=> b!1402270 (= e!794054 true)))

(assert (=> b!1402270 (= lt!617548 lt!617552)))

(declare-fun lt!617544 () Unit!47188)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47188)

(assert (=> b!1402270 (= lt!617544 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617553 (x!126371 lt!617549) (index!44747 lt!617549) (x!126371 lt!617545) (index!44747 lt!617545) mask!2840))))

(declare-fun b!1402271 () Bool)

(declare-fun res!940776 () Bool)

(assert (=> b!1402271 (=> (not res!940776) (not e!794053))))

(assert (=> b!1402271 (= res!940776 (validKeyInArray!0 (select (arr!46275 a!2901) i!1037)))))

(declare-fun b!1402272 () Bool)

(assert (=> b!1402272 (= e!794052 e!794050)))

(declare-fun res!940778 () Bool)

(assert (=> b!1402272 (=> res!940778 e!794050)))

(assert (=> b!1402272 (= res!940778 (or (= lt!617549 lt!617545) (not ((_ is Intermediate!10592) lt!617545))))))

(assert (=> b!1402272 (= lt!617545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617551 mask!2840) lt!617551 lt!617547 mask!2840))))

(assert (=> b!1402272 (= lt!617551 (select (store (arr!46275 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402272 (= lt!617547 (array!95850 (store (arr!46275 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46825 a!2901)))))

(declare-fun res!940781 () Bool)

(assert (=> start!120440 (=> (not res!940781) (not e!794053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120440 (= res!940781 (validMask!0 mask!2840))))

(assert (=> start!120440 e!794053))

(assert (=> start!120440 true))

(declare-fun array_inv!35303 (array!95849) Bool)

(assert (=> start!120440 (array_inv!35303 a!2901)))

(declare-fun b!1402269 () Bool)

(declare-fun res!940774 () Bool)

(assert (=> b!1402269 (=> (not res!940774) (not e!794053))))

(assert (=> b!1402269 (= res!940774 (and (= (size!46825 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46825 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46825 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120440 res!940781) b!1402269))

(assert (= (and b!1402269 res!940774) b!1402271))

(assert (= (and b!1402271 res!940776) b!1402268))

(assert (= (and b!1402268 res!940779) b!1402263))

(assert (= (and b!1402263 res!940780) b!1402265))

(assert (= (and b!1402265 res!940782) b!1402266))

(assert (= (and b!1402266 (not res!940777)) b!1402272))

(assert (= (and b!1402272 (not res!940778)) b!1402267))

(assert (= (and b!1402267 (not res!940783)) b!1402264))

(assert (= (and b!1402264 (not res!940775)) b!1402270))

(declare-fun m!1290331 () Bool)

(assert (=> b!1402271 m!1290331))

(assert (=> b!1402271 m!1290331))

(declare-fun m!1290333 () Bool)

(assert (=> b!1402271 m!1290333))

(declare-fun m!1290335 () Bool)

(assert (=> b!1402270 m!1290335))

(declare-fun m!1290337 () Bool)

(assert (=> b!1402267 m!1290337))

(declare-fun m!1290339 () Bool)

(assert (=> b!1402267 m!1290339))

(assert (=> b!1402267 m!1290339))

(declare-fun m!1290341 () Bool)

(assert (=> b!1402267 m!1290341))

(declare-fun m!1290343 () Bool)

(assert (=> b!1402267 m!1290343))

(declare-fun m!1290345 () Bool)

(assert (=> b!1402267 m!1290345))

(declare-fun m!1290347 () Bool)

(assert (=> b!1402267 m!1290347))

(assert (=> b!1402268 m!1290339))

(assert (=> b!1402268 m!1290339))

(declare-fun m!1290349 () Bool)

(assert (=> b!1402268 m!1290349))

(declare-fun m!1290351 () Bool)

(assert (=> start!120440 m!1290351))

(declare-fun m!1290353 () Bool)

(assert (=> start!120440 m!1290353))

(declare-fun m!1290355 () Bool)

(assert (=> b!1402263 m!1290355))

(declare-fun m!1290357 () Bool)

(assert (=> b!1402265 m!1290357))

(declare-fun m!1290359 () Bool)

(assert (=> b!1402264 m!1290359))

(declare-fun m!1290361 () Bool)

(assert (=> b!1402272 m!1290361))

(assert (=> b!1402272 m!1290361))

(declare-fun m!1290363 () Bool)

(assert (=> b!1402272 m!1290363))

(assert (=> b!1402272 m!1290347))

(declare-fun m!1290365 () Bool)

(assert (=> b!1402272 m!1290365))

(assert (=> b!1402266 m!1290339))

(declare-fun m!1290367 () Bool)

(assert (=> b!1402266 m!1290367))

(assert (=> b!1402266 m!1290339))

(declare-fun m!1290369 () Bool)

(assert (=> b!1402266 m!1290369))

(assert (=> b!1402266 m!1290339))

(declare-fun m!1290371 () Bool)

(assert (=> b!1402266 m!1290371))

(assert (=> b!1402266 m!1290339))

(declare-fun m!1290373 () Bool)

(assert (=> b!1402266 m!1290373))

(declare-fun m!1290375 () Bool)

(assert (=> b!1402266 m!1290375))

(check-sat (not b!1402264) (not b!1402267) (not start!120440) (not b!1402268) (not b!1402271) (not b!1402265) (not b!1402272) (not b!1402263) (not b!1402266) (not b!1402270))
(check-sat)
