; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119986 () Bool)

(assert start!119986)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95515 0))(
  ( (array!95516 (arr!46111 (Array (_ BitVec 32) (_ BitVec 64))) (size!46661 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95515)

(declare-fun e!790761 () Bool)

(declare-fun b!1396771 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10428 0))(
  ( (MissingZero!10428 (index!44083 (_ BitVec 32))) (Found!10428 (index!44084 (_ BitVec 32))) (Intermediate!10428 (undefined!11240 Bool) (index!44085 (_ BitVec 32)) (x!125746 (_ BitVec 32))) (Undefined!10428) (MissingVacant!10428 (index!44086 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95515 (_ BitVec 32)) SeekEntryResult!10428)

(assert (=> b!1396771 (= e!790761 (= (seekEntryOrOpen!0 (select (arr!46111 a!2901) j!112) a!2901 mask!2840) (Found!10428 j!112)))))

(declare-fun b!1396772 () Bool)

(declare-fun res!935687 () Bool)

(declare-fun e!790759 () Bool)

(assert (=> b!1396772 (=> (not res!935687) (not e!790759))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396772 (= res!935687 (and (= (size!46661 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46661 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46661 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396773 () Bool)

(declare-fun res!935692 () Bool)

(assert (=> b!1396773 (=> (not res!935692) (not e!790759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396773 (= res!935692 (validKeyInArray!0 (select (arr!46111 a!2901) j!112)))))

(declare-fun b!1396774 () Bool)

(declare-fun res!935685 () Bool)

(assert (=> b!1396774 (=> (not res!935685) (not e!790759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95515 (_ BitVec 32)) Bool)

(assert (=> b!1396774 (= res!935685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396775 () Bool)

(declare-fun res!935691 () Bool)

(assert (=> b!1396775 (=> (not res!935691) (not e!790759))))

(assert (=> b!1396775 (= res!935691 (validKeyInArray!0 (select (arr!46111 a!2901) i!1037)))))

(declare-fun b!1396776 () Bool)

(declare-fun e!790763 () Bool)

(assert (=> b!1396776 (= e!790759 (not e!790763))))

(declare-fun res!935689 () Bool)

(assert (=> b!1396776 (=> res!935689 e!790763)))

(declare-fun lt!613686 () SeekEntryResult!10428)

(assert (=> b!1396776 (= res!935689 (or (not (is-Intermediate!10428 lt!613686)) (undefined!11240 lt!613686)))))

(assert (=> b!1396776 e!790761))

(declare-fun res!935688 () Bool)

(assert (=> b!1396776 (=> (not res!935688) (not e!790761))))

(assert (=> b!1396776 (= res!935688 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46860 0))(
  ( (Unit!46861) )
))
(declare-fun lt!613687 () Unit!46860)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46860)

(assert (=> b!1396776 (= lt!613687 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613688 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95515 (_ BitVec 32)) SeekEntryResult!10428)

(assert (=> b!1396776 (= lt!613686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613688 (select (arr!46111 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396776 (= lt!613688 (toIndex!0 (select (arr!46111 a!2901) j!112) mask!2840))))

(declare-fun b!1396777 () Bool)

(declare-fun e!790762 () Bool)

(assert (=> b!1396777 (= e!790763 e!790762)))

(declare-fun res!935690 () Bool)

(assert (=> b!1396777 (=> res!935690 e!790762)))

(declare-fun lt!613685 () SeekEntryResult!10428)

(assert (=> b!1396777 (= res!935690 (or (= lt!613686 lt!613685) (not (is-Intermediate!10428 lt!613685)) (bvslt (x!125746 lt!613686) #b00000000000000000000000000000000) (bvsgt (x!125746 lt!613686) #b01111111111111111111111111111110) (bvslt lt!613688 #b00000000000000000000000000000000) (bvsge lt!613688 (size!46661 a!2901)) (bvslt (index!44085 lt!613686) #b00000000000000000000000000000000) (bvsge (index!44085 lt!613686) (size!46661 a!2901)) (not (= lt!613686 (Intermediate!10428 false (index!44085 lt!613686) (x!125746 lt!613686)))) (not (= lt!613685 (Intermediate!10428 (undefined!11240 lt!613685) (index!44085 lt!613685) (x!125746 lt!613685))))))))

(declare-fun lt!613689 () array!95515)

(declare-fun lt!613683 () (_ BitVec 64))

(assert (=> b!1396777 (= lt!613685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613683 mask!2840) lt!613683 lt!613689 mask!2840))))

(assert (=> b!1396777 (= lt!613683 (select (store (arr!46111 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396777 (= lt!613689 (array!95516 (store (arr!46111 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46661 a!2901)))))

(declare-fun res!935684 () Bool)

(assert (=> start!119986 (=> (not res!935684) (not e!790759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119986 (= res!935684 (validMask!0 mask!2840))))

(assert (=> start!119986 e!790759))

(assert (=> start!119986 true))

(declare-fun array_inv!35139 (array!95515) Bool)

(assert (=> start!119986 (array_inv!35139 a!2901)))

(declare-fun b!1396778 () Bool)

(declare-fun res!935686 () Bool)

(assert (=> b!1396778 (=> (not res!935686) (not e!790759))))

(declare-datatypes ((List!32630 0))(
  ( (Nil!32627) (Cons!32626 (h!33868 (_ BitVec 64)) (t!47324 List!32630)) )
))
(declare-fun arrayNoDuplicates!0 (array!95515 (_ BitVec 32) List!32630) Bool)

(assert (=> b!1396778 (= res!935686 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32627))))

(declare-fun b!1396779 () Bool)

(assert (=> b!1396779 (= e!790762 true)))

(declare-fun lt!613684 () SeekEntryResult!10428)

(assert (=> b!1396779 (= lt!613684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613688 lt!613683 lt!613689 mask!2840))))

(assert (= (and start!119986 res!935684) b!1396772))

(assert (= (and b!1396772 res!935687) b!1396775))

(assert (= (and b!1396775 res!935691) b!1396773))

(assert (= (and b!1396773 res!935692) b!1396774))

(assert (= (and b!1396774 res!935685) b!1396778))

(assert (= (and b!1396778 res!935686) b!1396776))

(assert (= (and b!1396776 res!935688) b!1396771))

(assert (= (and b!1396776 (not res!935689)) b!1396777))

(assert (= (and b!1396777 (not res!935690)) b!1396779))

(declare-fun m!1283319 () Bool)

(assert (=> b!1396778 m!1283319))

(declare-fun m!1283321 () Bool)

(assert (=> b!1396771 m!1283321))

(assert (=> b!1396771 m!1283321))

(declare-fun m!1283323 () Bool)

(assert (=> b!1396771 m!1283323))

(declare-fun m!1283325 () Bool)

(assert (=> b!1396775 m!1283325))

(assert (=> b!1396775 m!1283325))

(declare-fun m!1283327 () Bool)

(assert (=> b!1396775 m!1283327))

(assert (=> b!1396776 m!1283321))

(declare-fun m!1283329 () Bool)

(assert (=> b!1396776 m!1283329))

(assert (=> b!1396776 m!1283321))

(assert (=> b!1396776 m!1283321))

(declare-fun m!1283331 () Bool)

(assert (=> b!1396776 m!1283331))

(declare-fun m!1283333 () Bool)

(assert (=> b!1396776 m!1283333))

(declare-fun m!1283335 () Bool)

(assert (=> b!1396776 m!1283335))

(assert (=> b!1396773 m!1283321))

(assert (=> b!1396773 m!1283321))

(declare-fun m!1283337 () Bool)

(assert (=> b!1396773 m!1283337))

(declare-fun m!1283339 () Bool)

(assert (=> b!1396779 m!1283339))

(declare-fun m!1283341 () Bool)

(assert (=> b!1396774 m!1283341))

(declare-fun m!1283343 () Bool)

(assert (=> b!1396777 m!1283343))

(assert (=> b!1396777 m!1283343))

(declare-fun m!1283345 () Bool)

(assert (=> b!1396777 m!1283345))

(declare-fun m!1283347 () Bool)

(assert (=> b!1396777 m!1283347))

(declare-fun m!1283349 () Bool)

(assert (=> b!1396777 m!1283349))

(declare-fun m!1283351 () Bool)

(assert (=> start!119986 m!1283351))

(declare-fun m!1283353 () Bool)

(assert (=> start!119986 m!1283353))

(push 1)

