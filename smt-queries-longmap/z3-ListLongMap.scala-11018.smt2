; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128942 () Bool)

(assert start!128942)

(declare-fun b!1511534 () Bool)

(declare-fun res!1031439 () Bool)

(declare-fun e!843858 () Bool)

(assert (=> b!1511534 (=> (not res!1031439) (not e!843858))))

(declare-datatypes ((array!100798 0))(
  ( (array!100799 (arr!48636 (Array (_ BitVec 32) (_ BitVec 64))) (size!49186 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100798)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100798 (_ BitVec 32)) Bool)

(assert (=> b!1511534 (= res!1031439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511535 () Bool)

(declare-fun e!843856 () Bool)

(assert (=> b!1511535 (= e!843856 (not true))))

(declare-fun e!843857 () Bool)

(assert (=> b!1511535 e!843857))

(declare-fun res!1031438 () Bool)

(assert (=> b!1511535 (=> (not res!1031438) (not e!843857))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1511535 (= res!1031438 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50482 0))(
  ( (Unit!50483) )
))
(declare-fun lt!655466 () Unit!50482)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100798 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50482)

(assert (=> b!1511535 (= lt!655466 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511536 () Bool)

(declare-fun res!1031444 () Bool)

(assert (=> b!1511536 (=> (not res!1031444) (not e!843858))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511536 (= res!1031444 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49186 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49186 a!2804))))))

(declare-fun b!1511537 () Bool)

(declare-fun res!1031446 () Bool)

(assert (=> b!1511537 (=> (not res!1031446) (not e!843858))))

(declare-datatypes ((List!35119 0))(
  ( (Nil!35116) (Cons!35115 (h!36527 (_ BitVec 64)) (t!49813 List!35119)) )
))
(declare-fun arrayNoDuplicates!0 (array!100798 (_ BitVec 32) List!35119) Bool)

(assert (=> b!1511537 (= res!1031446 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35116))))

(declare-fun b!1511538 () Bool)

(declare-fun res!1031445 () Bool)

(assert (=> b!1511538 (=> (not res!1031445) (not e!843858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511538 (= res!1031445 (validKeyInArray!0 (select (arr!48636 a!2804) j!70)))))

(declare-fun b!1511539 () Bool)

(declare-datatypes ((SeekEntryResult!12807 0))(
  ( (MissingZero!12807 (index!53623 (_ BitVec 32))) (Found!12807 (index!53624 (_ BitVec 32))) (Intermediate!12807 (undefined!13619 Bool) (index!53625 (_ BitVec 32)) (x!135357 (_ BitVec 32))) (Undefined!12807) (MissingVacant!12807 (index!53626 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100798 (_ BitVec 32)) SeekEntryResult!12807)

(assert (=> b!1511539 (= e!843857 (= (seekEntry!0 (select (arr!48636 a!2804) j!70) a!2804 mask!2512) (Found!12807 j!70)))))

(declare-fun b!1511540 () Bool)

(declare-fun res!1031437 () Bool)

(assert (=> b!1511540 (=> (not res!1031437) (not e!843856))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!655468 () SeekEntryResult!12807)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100798 (_ BitVec 32)) SeekEntryResult!12807)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511540 (= res!1031437 (= lt!655468 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48636 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48636 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100799 (store (arr!48636 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49186 a!2804)) mask!2512)))))

(declare-fun b!1511541 () Bool)

(declare-fun res!1031440 () Bool)

(assert (=> b!1511541 (=> (not res!1031440) (not e!843856))))

(declare-fun lt!655467 () SeekEntryResult!12807)

(assert (=> b!1511541 (= res!1031440 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48636 a!2804) j!70) a!2804 mask!2512) lt!655467))))

(declare-fun res!1031442 () Bool)

(assert (=> start!128942 (=> (not res!1031442) (not e!843858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128942 (= res!1031442 (validMask!0 mask!2512))))

(assert (=> start!128942 e!843858))

(assert (=> start!128942 true))

(declare-fun array_inv!37664 (array!100798) Bool)

(assert (=> start!128942 (array_inv!37664 a!2804)))

(declare-fun b!1511533 () Bool)

(assert (=> b!1511533 (= e!843858 e!843856)))

(declare-fun res!1031436 () Bool)

(assert (=> b!1511533 (=> (not res!1031436) (not e!843856))))

(assert (=> b!1511533 (= res!1031436 (= lt!655468 lt!655467))))

(assert (=> b!1511533 (= lt!655467 (Intermediate!12807 false resIndex!21 resX!21))))

(assert (=> b!1511533 (= lt!655468 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48636 a!2804) j!70) mask!2512) (select (arr!48636 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511542 () Bool)

(declare-fun res!1031443 () Bool)

(assert (=> b!1511542 (=> (not res!1031443) (not e!843858))))

(assert (=> b!1511542 (= res!1031443 (and (= (size!49186 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49186 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49186 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511543 () Bool)

(declare-fun res!1031441 () Bool)

(assert (=> b!1511543 (=> (not res!1031441) (not e!843858))))

(assert (=> b!1511543 (= res!1031441 (validKeyInArray!0 (select (arr!48636 a!2804) i!961)))))

(assert (= (and start!128942 res!1031442) b!1511542))

(assert (= (and b!1511542 res!1031443) b!1511543))

(assert (= (and b!1511543 res!1031441) b!1511538))

(assert (= (and b!1511538 res!1031445) b!1511534))

(assert (= (and b!1511534 res!1031439) b!1511537))

(assert (= (and b!1511537 res!1031446) b!1511536))

(assert (= (and b!1511536 res!1031444) b!1511533))

(assert (= (and b!1511533 res!1031436) b!1511541))

(assert (= (and b!1511541 res!1031440) b!1511540))

(assert (= (and b!1511540 res!1031437) b!1511535))

(assert (= (and b!1511535 res!1031438) b!1511539))

(declare-fun m!1394239 () Bool)

(assert (=> b!1511535 m!1394239))

(declare-fun m!1394241 () Bool)

(assert (=> b!1511535 m!1394241))

(declare-fun m!1394243 () Bool)

(assert (=> b!1511538 m!1394243))

(assert (=> b!1511538 m!1394243))

(declare-fun m!1394245 () Bool)

(assert (=> b!1511538 m!1394245))

(declare-fun m!1394247 () Bool)

(assert (=> b!1511534 m!1394247))

(declare-fun m!1394249 () Bool)

(assert (=> b!1511537 m!1394249))

(declare-fun m!1394251 () Bool)

(assert (=> b!1511543 m!1394251))

(assert (=> b!1511543 m!1394251))

(declare-fun m!1394253 () Bool)

(assert (=> b!1511543 m!1394253))

(declare-fun m!1394255 () Bool)

(assert (=> b!1511540 m!1394255))

(declare-fun m!1394257 () Bool)

(assert (=> b!1511540 m!1394257))

(assert (=> b!1511540 m!1394257))

(declare-fun m!1394259 () Bool)

(assert (=> b!1511540 m!1394259))

(assert (=> b!1511540 m!1394259))

(assert (=> b!1511540 m!1394257))

(declare-fun m!1394261 () Bool)

(assert (=> b!1511540 m!1394261))

(assert (=> b!1511539 m!1394243))

(assert (=> b!1511539 m!1394243))

(declare-fun m!1394263 () Bool)

(assert (=> b!1511539 m!1394263))

(assert (=> b!1511533 m!1394243))

(assert (=> b!1511533 m!1394243))

(declare-fun m!1394265 () Bool)

(assert (=> b!1511533 m!1394265))

(assert (=> b!1511533 m!1394265))

(assert (=> b!1511533 m!1394243))

(declare-fun m!1394267 () Bool)

(assert (=> b!1511533 m!1394267))

(assert (=> b!1511541 m!1394243))

(assert (=> b!1511541 m!1394243))

(declare-fun m!1394269 () Bool)

(assert (=> b!1511541 m!1394269))

(declare-fun m!1394271 () Bool)

(assert (=> start!128942 m!1394271))

(declare-fun m!1394273 () Bool)

(assert (=> start!128942 m!1394273))

(check-sat (not b!1511541) (not b!1511538) (not b!1511540) (not start!128942) (not b!1511537) (not b!1511534) (not b!1511533) (not b!1511543) (not b!1511535) (not b!1511539))
(check-sat)
