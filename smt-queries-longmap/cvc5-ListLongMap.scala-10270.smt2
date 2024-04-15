; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120780 () Bool)

(assert start!120780)

(declare-fun b!1405308 () Bool)

(declare-fun res!943578 () Bool)

(declare-fun e!795495 () Bool)

(assert (=> b!1405308 (=> (not res!943578) (not e!795495))))

(declare-datatypes ((array!96040 0))(
  ( (array!96041 (arr!46368 (Array (_ BitVec 32) (_ BitVec 64))) (size!46920 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96040)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96040 (_ BitVec 32)) Bool)

(assert (=> b!1405308 (= res!943578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!795496 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1405309 () Bool)

(declare-datatypes ((SeekEntryResult!10705 0))(
  ( (MissingZero!10705 (index!45197 (_ BitVec 32))) (Found!10705 (index!45198 (_ BitVec 32))) (Intermediate!10705 (undefined!11517 Bool) (index!45199 (_ BitVec 32)) (x!126805 (_ BitVec 32))) (Undefined!10705) (MissingVacant!10705 (index!45200 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96040 (_ BitVec 32)) SeekEntryResult!10705)

(assert (=> b!1405309 (= e!795496 (= (seekEntryOrOpen!0 (select (arr!46368 a!2901) j!112) a!2901 mask!2840) (Found!10705 j!112)))))

(declare-fun b!1405310 () Bool)

(assert (=> b!1405310 (= e!795495 (not true))))

(assert (=> b!1405310 e!795496))

(declare-fun res!943581 () Bool)

(assert (=> b!1405310 (=> (not res!943581) (not e!795496))))

(assert (=> b!1405310 (= res!943581 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47227 0))(
  ( (Unit!47228) )
))
(declare-fun lt!618823 () Unit!47227)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96040 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47227)

(assert (=> b!1405310 (= lt!618823 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618824 () SeekEntryResult!10705)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96040 (_ BitVec 32)) SeekEntryResult!10705)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405310 (= lt!618824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46368 a!2901) j!112) mask!2840) (select (arr!46368 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405311 () Bool)

(declare-fun res!943582 () Bool)

(assert (=> b!1405311 (=> (not res!943582) (not e!795495))))

(declare-datatypes ((List!32965 0))(
  ( (Nil!32962) (Cons!32961 (h!34215 (_ BitVec 64)) (t!47651 List!32965)) )
))
(declare-fun arrayNoDuplicates!0 (array!96040 (_ BitVec 32) List!32965) Bool)

(assert (=> b!1405311 (= res!943582 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32962))))

(declare-fun b!1405312 () Bool)

(declare-fun res!943576 () Bool)

(assert (=> b!1405312 (=> (not res!943576) (not e!795495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405312 (= res!943576 (validKeyInArray!0 (select (arr!46368 a!2901) j!112)))))

(declare-fun b!1405313 () Bool)

(declare-fun res!943579 () Bool)

(assert (=> b!1405313 (=> (not res!943579) (not e!795495))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405313 (= res!943579 (validKeyInArray!0 (select (arr!46368 a!2901) i!1037)))))

(declare-fun b!1405314 () Bool)

(declare-fun res!943577 () Bool)

(assert (=> b!1405314 (=> (not res!943577) (not e!795495))))

(assert (=> b!1405314 (= res!943577 (and (= (size!46920 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46920 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46920 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!943580 () Bool)

(assert (=> start!120780 (=> (not res!943580) (not e!795495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120780 (= res!943580 (validMask!0 mask!2840))))

(assert (=> start!120780 e!795495))

(assert (=> start!120780 true))

(declare-fun array_inv!35601 (array!96040) Bool)

(assert (=> start!120780 (array_inv!35601 a!2901)))

(assert (= (and start!120780 res!943580) b!1405314))

(assert (= (and b!1405314 res!943577) b!1405313))

(assert (= (and b!1405313 res!943579) b!1405312))

(assert (= (and b!1405312 res!943576) b!1405308))

(assert (= (and b!1405308 res!943578) b!1405311))

(assert (= (and b!1405311 res!943582) b!1405310))

(assert (= (and b!1405310 res!943581) b!1405309))

(declare-fun m!1293623 () Bool)

(assert (=> b!1405308 m!1293623))

(declare-fun m!1293625 () Bool)

(assert (=> b!1405309 m!1293625))

(assert (=> b!1405309 m!1293625))

(declare-fun m!1293627 () Bool)

(assert (=> b!1405309 m!1293627))

(declare-fun m!1293629 () Bool)

(assert (=> b!1405311 m!1293629))

(assert (=> b!1405312 m!1293625))

(assert (=> b!1405312 m!1293625))

(declare-fun m!1293631 () Bool)

(assert (=> b!1405312 m!1293631))

(assert (=> b!1405310 m!1293625))

(declare-fun m!1293633 () Bool)

(assert (=> b!1405310 m!1293633))

(assert (=> b!1405310 m!1293625))

(declare-fun m!1293635 () Bool)

(assert (=> b!1405310 m!1293635))

(assert (=> b!1405310 m!1293633))

(assert (=> b!1405310 m!1293625))

(declare-fun m!1293637 () Bool)

(assert (=> b!1405310 m!1293637))

(declare-fun m!1293639 () Bool)

(assert (=> b!1405310 m!1293639))

(declare-fun m!1293641 () Bool)

(assert (=> start!120780 m!1293641))

(declare-fun m!1293643 () Bool)

(assert (=> start!120780 m!1293643))

(declare-fun m!1293645 () Bool)

(assert (=> b!1405313 m!1293645))

(assert (=> b!1405313 m!1293645))

(declare-fun m!1293647 () Bool)

(assert (=> b!1405313 m!1293647))

(push 1)

(assert (not b!1405308))

(assert (not b!1405310))

(assert (not b!1405311))

(assert (not b!1405312))

(assert (not start!120780))

(assert (not b!1405313))

(assert (not b!1405309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

