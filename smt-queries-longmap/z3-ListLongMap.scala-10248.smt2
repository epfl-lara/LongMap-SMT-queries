; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120542 () Bool)

(assert start!120542)

(declare-fun b!1403616 () Bool)

(declare-fun res!942129 () Bool)

(declare-fun e!794726 () Bool)

(assert (=> b!1403616 (=> (not res!942129) (not e!794726))))

(declare-datatypes ((array!95951 0))(
  ( (array!95952 (arr!46326 (Array (_ BitVec 32) (_ BitVec 64))) (size!46876 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95951)

(declare-datatypes ((List!32845 0))(
  ( (Nil!32842) (Cons!32841 (h!34089 (_ BitVec 64)) (t!47539 List!32845)) )
))
(declare-fun arrayNoDuplicates!0 (array!95951 (_ BitVec 32) List!32845) Bool)

(assert (=> b!1403616 (= res!942129 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32842))))

(declare-fun b!1403617 () Bool)

(assert (=> b!1403617 (= e!794726 (not true))))

(declare-fun e!794724 () Bool)

(assert (=> b!1403617 e!794724))

(declare-fun res!942131 () Bool)

(assert (=> b!1403617 (=> (not res!942131) (not e!794724))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95951 (_ BitVec 32)) Bool)

(assert (=> b!1403617 (= res!942131 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47290 0))(
  ( (Unit!47291) )
))
(declare-fun lt!618458 () Unit!47290)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47290)

(assert (=> b!1403617 (= lt!618458 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10643 0))(
  ( (MissingZero!10643 (index!44949 (_ BitVec 32))) (Found!10643 (index!44950 (_ BitVec 32))) (Intermediate!10643 (undefined!11455 Bool) (index!44951 (_ BitVec 32)) (x!126558 (_ BitVec 32))) (Undefined!10643) (MissingVacant!10643 (index!44952 (_ BitVec 32))) )
))
(declare-fun lt!618459 () SeekEntryResult!10643)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95951 (_ BitVec 32)) SeekEntryResult!10643)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403617 (= lt!618459 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46326 a!2901) j!112) mask!2840) (select (arr!46326 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403618 () Bool)

(declare-fun res!942127 () Bool)

(assert (=> b!1403618 (=> (not res!942127) (not e!794726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403618 (= res!942127 (validKeyInArray!0 (select (arr!46326 a!2901) j!112)))))

(declare-fun b!1403619 () Bool)

(declare-fun res!942130 () Bool)

(assert (=> b!1403619 (=> (not res!942130) (not e!794726))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403619 (= res!942130 (validKeyInArray!0 (select (arr!46326 a!2901) i!1037)))))

(declare-fun b!1403620 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95951 (_ BitVec 32)) SeekEntryResult!10643)

(assert (=> b!1403620 (= e!794724 (= (seekEntryOrOpen!0 (select (arr!46326 a!2901) j!112) a!2901 mask!2840) (Found!10643 j!112)))))

(declare-fun b!1403621 () Bool)

(declare-fun res!942132 () Bool)

(assert (=> b!1403621 (=> (not res!942132) (not e!794726))))

(assert (=> b!1403621 (= res!942132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403622 () Bool)

(declare-fun res!942128 () Bool)

(assert (=> b!1403622 (=> (not res!942128) (not e!794726))))

(assert (=> b!1403622 (= res!942128 (and (= (size!46876 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46876 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46876 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!942133 () Bool)

(assert (=> start!120542 (=> (not res!942133) (not e!794726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120542 (= res!942133 (validMask!0 mask!2840))))

(assert (=> start!120542 e!794726))

(assert (=> start!120542 true))

(declare-fun array_inv!35354 (array!95951) Bool)

(assert (=> start!120542 (array_inv!35354 a!2901)))

(assert (= (and start!120542 res!942133) b!1403622))

(assert (= (and b!1403622 res!942128) b!1403619))

(assert (= (and b!1403619 res!942130) b!1403618))

(assert (= (and b!1403618 res!942127) b!1403621))

(assert (= (and b!1403621 res!942132) b!1403616))

(assert (= (and b!1403616 res!942129) b!1403617))

(assert (= (and b!1403617 res!942131) b!1403620))

(declare-fun m!1292315 () Bool)

(assert (=> b!1403619 m!1292315))

(assert (=> b!1403619 m!1292315))

(declare-fun m!1292317 () Bool)

(assert (=> b!1403619 m!1292317))

(declare-fun m!1292319 () Bool)

(assert (=> b!1403621 m!1292319))

(declare-fun m!1292321 () Bool)

(assert (=> b!1403618 m!1292321))

(assert (=> b!1403618 m!1292321))

(declare-fun m!1292323 () Bool)

(assert (=> b!1403618 m!1292323))

(assert (=> b!1403620 m!1292321))

(assert (=> b!1403620 m!1292321))

(declare-fun m!1292325 () Bool)

(assert (=> b!1403620 m!1292325))

(declare-fun m!1292327 () Bool)

(assert (=> b!1403616 m!1292327))

(declare-fun m!1292329 () Bool)

(assert (=> start!120542 m!1292329))

(declare-fun m!1292331 () Bool)

(assert (=> start!120542 m!1292331))

(assert (=> b!1403617 m!1292321))

(declare-fun m!1292333 () Bool)

(assert (=> b!1403617 m!1292333))

(assert (=> b!1403617 m!1292321))

(declare-fun m!1292335 () Bool)

(assert (=> b!1403617 m!1292335))

(assert (=> b!1403617 m!1292333))

(assert (=> b!1403617 m!1292321))

(declare-fun m!1292337 () Bool)

(assert (=> b!1403617 m!1292337))

(declare-fun m!1292339 () Bool)

(assert (=> b!1403617 m!1292339))

(check-sat (not b!1403620) (not b!1403621) (not b!1403619) (not b!1403618) (not start!120542) (not b!1403617) (not b!1403616))
