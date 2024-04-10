; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119198 () Bool)

(assert start!119198)

(declare-fun b!1390455 () Bool)

(declare-fun res!930619 () Bool)

(declare-fun e!787425 () Bool)

(assert (=> b!1390455 (=> (not res!930619) (not e!787425))))

(declare-datatypes ((array!95135 0))(
  ( (array!95136 (arr!45933 (Array (_ BitVec 32) (_ BitVec 64))) (size!46483 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95135)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390455 (= res!930619 (validKeyInArray!0 (select (arr!45933 a!2901) i!1037)))))

(declare-fun b!1390456 () Bool)

(assert (=> b!1390456 (= e!787425 (not true))))

(declare-fun e!787427 () Bool)

(assert (=> b!1390456 e!787427))

(declare-fun res!930618 () Bool)

(assert (=> b!1390456 (=> (not res!930618) (not e!787427))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95135 (_ BitVec 32)) Bool)

(assert (=> b!1390456 (= res!930618 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46504 0))(
  ( (Unit!46505) )
))
(declare-fun lt!610829 () Unit!46504)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95135 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46504)

(assert (=> b!1390456 (= lt!610829 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10250 0))(
  ( (MissingZero!10250 (index!43371 (_ BitVec 32))) (Found!10250 (index!43372 (_ BitVec 32))) (Intermediate!10250 (undefined!11062 Bool) (index!43373 (_ BitVec 32)) (x!125048 (_ BitVec 32))) (Undefined!10250) (MissingVacant!10250 (index!43374 (_ BitVec 32))) )
))
(declare-fun lt!610830 () SeekEntryResult!10250)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95135 (_ BitVec 32)) SeekEntryResult!10250)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390456 (= lt!610830 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45933 a!2901) j!112) mask!2840) (select (arr!45933 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390457 () Bool)

(declare-fun res!930620 () Bool)

(assert (=> b!1390457 (=> (not res!930620) (not e!787425))))

(declare-datatypes ((List!32452 0))(
  ( (Nil!32449) (Cons!32448 (h!33666 (_ BitVec 64)) (t!47146 List!32452)) )
))
(declare-fun arrayNoDuplicates!0 (array!95135 (_ BitVec 32) List!32452) Bool)

(assert (=> b!1390457 (= res!930620 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32449))))

(declare-fun b!1390458 () Bool)

(declare-fun res!930616 () Bool)

(assert (=> b!1390458 (=> (not res!930616) (not e!787425))))

(assert (=> b!1390458 (= res!930616 (validKeyInArray!0 (select (arr!45933 a!2901) j!112)))))

(declare-fun b!1390459 () Bool)

(declare-fun res!930617 () Bool)

(assert (=> b!1390459 (=> (not res!930617) (not e!787425))))

(assert (=> b!1390459 (= res!930617 (and (= (size!46483 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46483 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46483 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!930621 () Bool)

(assert (=> start!119198 (=> (not res!930621) (not e!787425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119198 (= res!930621 (validMask!0 mask!2840))))

(assert (=> start!119198 e!787425))

(assert (=> start!119198 true))

(declare-fun array_inv!34961 (array!95135) Bool)

(assert (=> start!119198 (array_inv!34961 a!2901)))

(declare-fun b!1390460 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95135 (_ BitVec 32)) SeekEntryResult!10250)

(assert (=> b!1390460 (= e!787427 (= (seekEntryOrOpen!0 (select (arr!45933 a!2901) j!112) a!2901 mask!2840) (Found!10250 j!112)))))

(declare-fun b!1390461 () Bool)

(declare-fun res!930622 () Bool)

(assert (=> b!1390461 (=> (not res!930622) (not e!787425))))

(assert (=> b!1390461 (= res!930622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119198 res!930621) b!1390459))

(assert (= (and b!1390459 res!930617) b!1390455))

(assert (= (and b!1390455 res!930619) b!1390458))

(assert (= (and b!1390458 res!930616) b!1390461))

(assert (= (and b!1390461 res!930622) b!1390457))

(assert (= (and b!1390457 res!930620) b!1390456))

(assert (= (and b!1390456 res!930618) b!1390460))

(declare-fun m!1276307 () Bool)

(assert (=> b!1390455 m!1276307))

(assert (=> b!1390455 m!1276307))

(declare-fun m!1276309 () Bool)

(assert (=> b!1390455 m!1276309))

(declare-fun m!1276311 () Bool)

(assert (=> start!119198 m!1276311))

(declare-fun m!1276313 () Bool)

(assert (=> start!119198 m!1276313))

(declare-fun m!1276315 () Bool)

(assert (=> b!1390458 m!1276315))

(assert (=> b!1390458 m!1276315))

(declare-fun m!1276317 () Bool)

(assert (=> b!1390458 m!1276317))

(declare-fun m!1276319 () Bool)

(assert (=> b!1390461 m!1276319))

(declare-fun m!1276321 () Bool)

(assert (=> b!1390457 m!1276321))

(assert (=> b!1390456 m!1276315))

(declare-fun m!1276323 () Bool)

(assert (=> b!1390456 m!1276323))

(assert (=> b!1390456 m!1276315))

(declare-fun m!1276325 () Bool)

(assert (=> b!1390456 m!1276325))

(assert (=> b!1390456 m!1276323))

(assert (=> b!1390456 m!1276315))

(declare-fun m!1276327 () Bool)

(assert (=> b!1390456 m!1276327))

(declare-fun m!1276329 () Bool)

(assert (=> b!1390456 m!1276329))

(assert (=> b!1390460 m!1276315))

(assert (=> b!1390460 m!1276315))

(declare-fun m!1276331 () Bool)

(assert (=> b!1390460 m!1276331))

(check-sat (not start!119198) (not b!1390461) (not b!1390457) (not b!1390456) (not b!1390458) (not b!1390460) (not b!1390455))
