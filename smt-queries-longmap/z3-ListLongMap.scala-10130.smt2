; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119438 () Bool)

(assert start!119438)

(declare-fun b!1391982 () Bool)

(declare-fun e!788233 () Bool)

(declare-fun e!788234 () Bool)

(assert (=> b!1391982 (= e!788233 (not e!788234))))

(declare-fun res!931704 () Bool)

(assert (=> b!1391982 (=> res!931704 e!788234)))

(declare-datatypes ((SeekEntryResult!10289 0))(
  ( (MissingZero!10289 (index!43527 (_ BitVec 32))) (Found!10289 (index!43528 (_ BitVec 32))) (Intermediate!10289 (undefined!11101 Bool) (index!43529 (_ BitVec 32)) (x!125209 (_ BitVec 32))) (Undefined!10289) (MissingVacant!10289 (index!43530 (_ BitVec 32))) )
))
(declare-fun lt!611421 () SeekEntryResult!10289)

(get-info :version)

(assert (=> b!1391982 (= res!931704 (or (not ((_ is Intermediate!10289) lt!611421)) (undefined!11101 lt!611421)))))

(declare-fun e!788231 () Bool)

(assert (=> b!1391982 e!788231))

(declare-fun res!931703 () Bool)

(assert (=> b!1391982 (=> (not res!931703) (not e!788231))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95222 0))(
  ( (array!95223 (arr!45972 (Array (_ BitVec 32) (_ BitVec 64))) (size!46522 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95222)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95222 (_ BitVec 32)) Bool)

(assert (=> b!1391982 (= res!931703 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46582 0))(
  ( (Unit!46583) )
))
(declare-fun lt!611419 () Unit!46582)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46582)

(assert (=> b!1391982 (= lt!611419 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95222 (_ BitVec 32)) SeekEntryResult!10289)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391982 (= lt!611421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45972 a!2901) j!112) mask!2840) (select (arr!45972 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391983 () Bool)

(declare-fun res!931708 () Bool)

(assert (=> b!1391983 (=> (not res!931708) (not e!788233))))

(declare-datatypes ((List!32491 0))(
  ( (Nil!32488) (Cons!32487 (h!33714 (_ BitVec 64)) (t!47185 List!32491)) )
))
(declare-fun arrayNoDuplicates!0 (array!95222 (_ BitVec 32) List!32491) Bool)

(assert (=> b!1391983 (= res!931708 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32488))))

(declare-fun b!1391984 () Bool)

(declare-fun res!931706 () Bool)

(assert (=> b!1391984 (=> (not res!931706) (not e!788233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391984 (= res!931706 (validKeyInArray!0 (select (arr!45972 a!2901) j!112)))))

(declare-fun b!1391985 () Bool)

(declare-fun res!931707 () Bool)

(assert (=> b!1391985 (=> (not res!931707) (not e!788233))))

(assert (=> b!1391985 (= res!931707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391986 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95222 (_ BitVec 32)) SeekEntryResult!10289)

(assert (=> b!1391986 (= e!788231 (= (seekEntryOrOpen!0 (select (arr!45972 a!2901) j!112) a!2901 mask!2840) (Found!10289 j!112)))))

(declare-fun b!1391987 () Bool)

(assert (=> b!1391987 (= e!788234 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!611420 () (_ BitVec 32))

(assert (=> b!1391987 (= lt!611420 (toIndex!0 (select (store (arr!45972 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1391988 () Bool)

(declare-fun res!931701 () Bool)

(assert (=> b!1391988 (=> (not res!931701) (not e!788233))))

(assert (=> b!1391988 (= res!931701 (and (= (size!46522 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46522 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46522 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!931702 () Bool)

(assert (=> start!119438 (=> (not res!931702) (not e!788233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119438 (= res!931702 (validMask!0 mask!2840))))

(assert (=> start!119438 e!788233))

(assert (=> start!119438 true))

(declare-fun array_inv!35000 (array!95222) Bool)

(assert (=> start!119438 (array_inv!35000 a!2901)))

(declare-fun b!1391981 () Bool)

(declare-fun res!931705 () Bool)

(assert (=> b!1391981 (=> (not res!931705) (not e!788233))))

(assert (=> b!1391981 (= res!931705 (validKeyInArray!0 (select (arr!45972 a!2901) i!1037)))))

(assert (= (and start!119438 res!931702) b!1391988))

(assert (= (and b!1391988 res!931701) b!1391981))

(assert (= (and b!1391981 res!931705) b!1391984))

(assert (= (and b!1391984 res!931706) b!1391985))

(assert (= (and b!1391985 res!931707) b!1391983))

(assert (= (and b!1391983 res!931708) b!1391982))

(assert (= (and b!1391982 res!931703) b!1391986))

(assert (= (and b!1391982 (not res!931704)) b!1391987))

(declare-fun m!1277747 () Bool)

(assert (=> b!1391985 m!1277747))

(declare-fun m!1277749 () Bool)

(assert (=> b!1391983 m!1277749))

(declare-fun m!1277751 () Bool)

(assert (=> b!1391981 m!1277751))

(assert (=> b!1391981 m!1277751))

(declare-fun m!1277753 () Bool)

(assert (=> b!1391981 m!1277753))

(declare-fun m!1277755 () Bool)

(assert (=> b!1391982 m!1277755))

(declare-fun m!1277757 () Bool)

(assert (=> b!1391982 m!1277757))

(assert (=> b!1391982 m!1277755))

(declare-fun m!1277759 () Bool)

(assert (=> b!1391982 m!1277759))

(assert (=> b!1391982 m!1277757))

(assert (=> b!1391982 m!1277755))

(declare-fun m!1277761 () Bool)

(assert (=> b!1391982 m!1277761))

(declare-fun m!1277763 () Bool)

(assert (=> b!1391982 m!1277763))

(assert (=> b!1391986 m!1277755))

(assert (=> b!1391986 m!1277755))

(declare-fun m!1277765 () Bool)

(assert (=> b!1391986 m!1277765))

(declare-fun m!1277767 () Bool)

(assert (=> b!1391987 m!1277767))

(declare-fun m!1277769 () Bool)

(assert (=> b!1391987 m!1277769))

(assert (=> b!1391987 m!1277769))

(declare-fun m!1277771 () Bool)

(assert (=> b!1391987 m!1277771))

(declare-fun m!1277773 () Bool)

(assert (=> start!119438 m!1277773))

(declare-fun m!1277775 () Bool)

(assert (=> start!119438 m!1277775))

(assert (=> b!1391984 m!1277755))

(assert (=> b!1391984 m!1277755))

(declare-fun m!1277777 () Bool)

(assert (=> b!1391984 m!1277777))

(check-sat (not b!1391987) (not start!119438) (not b!1391983) (not b!1391984) (not b!1391982) (not b!1391985) (not b!1391986) (not b!1391981))
