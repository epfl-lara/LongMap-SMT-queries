; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128786 () Bool)

(assert start!128786)

(declare-fun res!1029584 () Bool)

(declare-fun e!843012 () Bool)

(assert (=> start!128786 (=> (not res!1029584) (not e!843012))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128786 (= res!1029584 (validMask!0 mask!2512))))

(assert (=> start!128786 e!843012))

(assert (=> start!128786 true))

(declare-datatypes ((array!100642 0))(
  ( (array!100643 (arr!48559 (Array (_ BitVec 32) (_ BitVec 64))) (size!49111 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100642)

(declare-fun array_inv!37792 (array!100642) Bool)

(assert (=> start!128786 (array_inv!37792 a!2804)))

(declare-fun b!1509468 () Bool)

(declare-fun res!1029586 () Bool)

(declare-fun e!843009 () Bool)

(assert (=> b!1509468 (=> (not res!1029586) (not e!843009))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12753 0))(
  ( (MissingZero!12753 (index!53407 (_ BitVec 32))) (Found!12753 (index!53408 (_ BitVec 32))) (Intermediate!12753 (undefined!13565 Bool) (index!53409 (_ BitVec 32)) (x!135161 (_ BitVec 32))) (Undefined!12753) (MissingVacant!12753 (index!53410 (_ BitVec 32))) )
))
(declare-fun lt!654703 () SeekEntryResult!12753)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100642 (_ BitVec 32)) SeekEntryResult!12753)

(assert (=> b!1509468 (= res!1029586 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48559 a!2804) j!70) a!2804 mask!2512) lt!654703))))

(declare-fun b!1509469 () Bool)

(declare-fun res!1029585 () Bool)

(assert (=> b!1509469 (=> (not res!1029585) (not e!843012))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509469 (= res!1029585 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49111 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49111 a!2804))))))

(declare-fun b!1509470 () Bool)

(declare-fun res!1029577 () Bool)

(assert (=> b!1509470 (=> (not res!1029577) (not e!843012))))

(declare-datatypes ((List!35120 0))(
  ( (Nil!35117) (Cons!35116 (h!36529 (_ BitVec 64)) (t!49806 List!35120)) )
))
(declare-fun arrayNoDuplicates!0 (array!100642 (_ BitVec 32) List!35120) Bool)

(assert (=> b!1509470 (= res!1029577 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35117))))

(declare-fun b!1509471 () Bool)

(declare-fun res!1029579 () Bool)

(assert (=> b!1509471 (=> (not res!1029579) (not e!843012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100642 (_ BitVec 32)) Bool)

(assert (=> b!1509471 (= res!1029579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509472 () Bool)

(declare-fun res!1029587 () Bool)

(assert (=> b!1509472 (=> (not res!1029587) (not e!843012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509472 (= res!1029587 (validKeyInArray!0 (select (arr!48559 a!2804) j!70)))))

(declare-fun b!1509473 () Bool)

(assert (=> b!1509473 (= e!843012 e!843009)))

(declare-fun res!1029583 () Bool)

(assert (=> b!1509473 (=> (not res!1029583) (not e!843009))))

(declare-fun lt!654705 () SeekEntryResult!12753)

(assert (=> b!1509473 (= res!1029583 (= lt!654705 lt!654703))))

(assert (=> b!1509473 (= lt!654703 (Intermediate!12753 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509473 (= lt!654705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48559 a!2804) j!70) mask!2512) (select (arr!48559 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509474 () Bool)

(declare-fun res!1029581 () Bool)

(assert (=> b!1509474 (=> (not res!1029581) (not e!843012))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509474 (= res!1029581 (validKeyInArray!0 (select (arr!48559 a!2804) i!961)))))

(declare-fun b!1509475 () Bool)

(declare-fun res!1029580 () Bool)

(assert (=> b!1509475 (=> (not res!1029580) (not e!843012))))

(assert (=> b!1509475 (= res!1029580 (and (= (size!49111 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49111 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49111 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509476 () Bool)

(assert (=> b!1509476 (= e!843009 (not true))))

(declare-fun e!843010 () Bool)

(assert (=> b!1509476 e!843010))

(declare-fun res!1029582 () Bool)

(assert (=> b!1509476 (=> (not res!1029582) (not e!843010))))

(assert (=> b!1509476 (= res!1029582 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50213 0))(
  ( (Unit!50214) )
))
(declare-fun lt!654704 () Unit!50213)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50213)

(assert (=> b!1509476 (= lt!654704 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509477 () Bool)

(declare-fun res!1029578 () Bool)

(assert (=> b!1509477 (=> (not res!1029578) (not e!843009))))

(assert (=> b!1509477 (= res!1029578 (= lt!654705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48559 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48559 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100643 (store (arr!48559 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49111 a!2804)) mask!2512)))))

(declare-fun b!1509478 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100642 (_ BitVec 32)) SeekEntryResult!12753)

(assert (=> b!1509478 (= e!843010 (= (seekEntry!0 (select (arr!48559 a!2804) j!70) a!2804 mask!2512) (Found!12753 j!70)))))

(assert (= (and start!128786 res!1029584) b!1509475))

(assert (= (and b!1509475 res!1029580) b!1509474))

(assert (= (and b!1509474 res!1029581) b!1509472))

(assert (= (and b!1509472 res!1029587) b!1509471))

(assert (= (and b!1509471 res!1029579) b!1509470))

(assert (= (and b!1509470 res!1029577) b!1509469))

(assert (= (and b!1509469 res!1029585) b!1509473))

(assert (= (and b!1509473 res!1029583) b!1509468))

(assert (= (and b!1509468 res!1029586) b!1509477))

(assert (= (and b!1509477 res!1029578) b!1509476))

(assert (= (and b!1509476 res!1029582) b!1509478))

(declare-fun m!1391423 () Bool)

(assert (=> start!128786 m!1391423))

(declare-fun m!1391425 () Bool)

(assert (=> start!128786 m!1391425))

(declare-fun m!1391427 () Bool)

(assert (=> b!1509476 m!1391427))

(declare-fun m!1391429 () Bool)

(assert (=> b!1509476 m!1391429))

(declare-fun m!1391431 () Bool)

(assert (=> b!1509478 m!1391431))

(assert (=> b!1509478 m!1391431))

(declare-fun m!1391433 () Bool)

(assert (=> b!1509478 m!1391433))

(assert (=> b!1509473 m!1391431))

(assert (=> b!1509473 m!1391431))

(declare-fun m!1391435 () Bool)

(assert (=> b!1509473 m!1391435))

(assert (=> b!1509473 m!1391435))

(assert (=> b!1509473 m!1391431))

(declare-fun m!1391437 () Bool)

(assert (=> b!1509473 m!1391437))

(declare-fun m!1391439 () Bool)

(assert (=> b!1509474 m!1391439))

(assert (=> b!1509474 m!1391439))

(declare-fun m!1391441 () Bool)

(assert (=> b!1509474 m!1391441))

(declare-fun m!1391443 () Bool)

(assert (=> b!1509470 m!1391443))

(declare-fun m!1391445 () Bool)

(assert (=> b!1509471 m!1391445))

(declare-fun m!1391447 () Bool)

(assert (=> b!1509477 m!1391447))

(declare-fun m!1391449 () Bool)

(assert (=> b!1509477 m!1391449))

(assert (=> b!1509477 m!1391449))

(declare-fun m!1391451 () Bool)

(assert (=> b!1509477 m!1391451))

(assert (=> b!1509477 m!1391451))

(assert (=> b!1509477 m!1391449))

(declare-fun m!1391453 () Bool)

(assert (=> b!1509477 m!1391453))

(assert (=> b!1509468 m!1391431))

(assert (=> b!1509468 m!1391431))

(declare-fun m!1391455 () Bool)

(assert (=> b!1509468 m!1391455))

(assert (=> b!1509472 m!1391431))

(assert (=> b!1509472 m!1391431))

(declare-fun m!1391457 () Bool)

(assert (=> b!1509472 m!1391457))

(check-sat (not b!1509477) (not b!1509474) (not b!1509472) (not b!1509478) (not start!128786) (not b!1509473) (not b!1509468) (not b!1509471) (not b!1509470) (not b!1509476))
(check-sat)
