; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119546 () Bool)

(assert start!119546)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95303 0))(
  ( (array!95304 (arr!46012 (Array (_ BitVec 32) (_ BitVec 64))) (size!46563 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95303)

(declare-fun e!788687 () Bool)

(declare-fun b!1392597 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10232 0))(
  ( (MissingZero!10232 (index!43299 (_ BitVec 32))) (Found!10232 (index!43300 (_ BitVec 32))) (Intermediate!10232 (undefined!11044 Bool) (index!43301 (_ BitVec 32)) (x!125133 (_ BitVec 32))) (Undefined!10232) (MissingVacant!10232 (index!43302 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95303 (_ BitVec 32)) SeekEntryResult!10232)

(assert (=> b!1392597 (= e!788687 (= (seekEntryOrOpen!0 (select (arr!46012 a!2901) j!112) a!2901 mask!2840) (Found!10232 j!112)))))

(declare-fun b!1392598 () Bool)

(declare-fun res!931781 () Bool)

(declare-fun e!788686 () Bool)

(assert (=> b!1392598 (=> (not res!931781) (not e!788686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392598 (= res!931781 (validKeyInArray!0 (select (arr!46012 a!2901) j!112)))))

(declare-fun b!1392599 () Bool)

(declare-fun res!931784 () Bool)

(assert (=> b!1392599 (=> (not res!931784) (not e!788686))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1392599 (= res!931784 (validKeyInArray!0 (select (arr!46012 a!2901) i!1037)))))

(declare-fun b!1392600 () Bool)

(declare-fun lt!611608 () SeekEntryResult!10232)

(get-info :version)

(assert (=> b!1392600 (= e!788686 (not (or (not ((_ is Intermediate!10232) lt!611608)) (undefined!11044 lt!611608) (bvsge mask!2840 #b00000000000000000000000000000000))))))

(assert (=> b!1392600 e!788687))

(declare-fun res!931783 () Bool)

(assert (=> b!1392600 (=> (not res!931783) (not e!788687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95303 (_ BitVec 32)) Bool)

(assert (=> b!1392600 (= res!931783 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46495 0))(
  ( (Unit!46496) )
))
(declare-fun lt!611609 () Unit!46495)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46495)

(assert (=> b!1392600 (= lt!611609 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95303 (_ BitVec 32)) SeekEntryResult!10232)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392600 (= lt!611608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46012 a!2901) j!112) mask!2840) (select (arr!46012 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392601 () Bool)

(declare-fun res!931786 () Bool)

(assert (=> b!1392601 (=> (not res!931786) (not e!788686))))

(assert (=> b!1392601 (= res!931786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392602 () Bool)

(declare-fun res!931780 () Bool)

(assert (=> b!1392602 (=> (not res!931780) (not e!788686))))

(declare-datatypes ((List!32518 0))(
  ( (Nil!32515) (Cons!32514 (h!33746 (_ BitVec 64)) (t!47204 List!32518)) )
))
(declare-fun arrayNoDuplicates!0 (array!95303 (_ BitVec 32) List!32518) Bool)

(assert (=> b!1392602 (= res!931780 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32515))))

(declare-fun res!931782 () Bool)

(assert (=> start!119546 (=> (not res!931782) (not e!788686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119546 (= res!931782 (validMask!0 mask!2840))))

(assert (=> start!119546 e!788686))

(assert (=> start!119546 true))

(declare-fun array_inv!35293 (array!95303) Bool)

(assert (=> start!119546 (array_inv!35293 a!2901)))

(declare-fun b!1392603 () Bool)

(declare-fun res!931785 () Bool)

(assert (=> b!1392603 (=> (not res!931785) (not e!788686))))

(assert (=> b!1392603 (= res!931785 (and (= (size!46563 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46563 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46563 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119546 res!931782) b!1392603))

(assert (= (and b!1392603 res!931785) b!1392599))

(assert (= (and b!1392599 res!931784) b!1392598))

(assert (= (and b!1392598 res!931781) b!1392601))

(assert (= (and b!1392601 res!931786) b!1392602))

(assert (= (and b!1392602 res!931780) b!1392600))

(assert (= (and b!1392600 res!931783) b!1392597))

(declare-fun m!1278613 () Bool)

(assert (=> b!1392598 m!1278613))

(assert (=> b!1392598 m!1278613))

(declare-fun m!1278615 () Bool)

(assert (=> b!1392598 m!1278615))

(assert (=> b!1392600 m!1278613))

(declare-fun m!1278617 () Bool)

(assert (=> b!1392600 m!1278617))

(assert (=> b!1392600 m!1278613))

(declare-fun m!1278619 () Bool)

(assert (=> b!1392600 m!1278619))

(assert (=> b!1392600 m!1278617))

(assert (=> b!1392600 m!1278613))

(declare-fun m!1278621 () Bool)

(assert (=> b!1392600 m!1278621))

(declare-fun m!1278623 () Bool)

(assert (=> b!1392600 m!1278623))

(assert (=> b!1392597 m!1278613))

(assert (=> b!1392597 m!1278613))

(declare-fun m!1278625 () Bool)

(assert (=> b!1392597 m!1278625))

(declare-fun m!1278627 () Bool)

(assert (=> b!1392601 m!1278627))

(declare-fun m!1278629 () Bool)

(assert (=> b!1392599 m!1278629))

(assert (=> b!1392599 m!1278629))

(declare-fun m!1278631 () Bool)

(assert (=> b!1392599 m!1278631))

(declare-fun m!1278633 () Bool)

(assert (=> start!119546 m!1278633))

(declare-fun m!1278635 () Bool)

(assert (=> start!119546 m!1278635))

(declare-fun m!1278637 () Bool)

(assert (=> b!1392602 m!1278637))

(check-sat (not start!119546) (not b!1392597) (not b!1392602) (not b!1392600) (not b!1392599) (not b!1392601) (not b!1392598))
(check-sat)
