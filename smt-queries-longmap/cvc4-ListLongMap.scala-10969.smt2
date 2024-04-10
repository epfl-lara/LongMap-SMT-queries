; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128482 () Bool)

(assert start!128482)

(declare-fun b!1506548 () Bool)

(declare-fun res!1026877 () Bool)

(declare-fun e!841939 () Bool)

(assert (=> b!1506548 (=> (not res!1026877) (not e!841939))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100494 0))(
  ( (array!100495 (arr!48490 (Array (_ BitVec 32) (_ BitVec 64))) (size!49040 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100494)

(assert (=> b!1506548 (= res!1026877 (and (= (size!49040 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49040 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49040 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1026873 () Bool)

(assert (=> start!128482 (=> (not res!1026873) (not e!841939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128482 (= res!1026873 (validMask!0 mask!2512))))

(assert (=> start!128482 e!841939))

(assert (=> start!128482 true))

(declare-fun array_inv!37518 (array!100494) Bool)

(assert (=> start!128482 (array_inv!37518 a!2804)))

(declare-fun b!1506549 () Bool)

(declare-fun res!1026872 () Bool)

(assert (=> b!1506549 (=> (not res!1026872) (not e!841939))))

(declare-datatypes ((List!34973 0))(
  ( (Nil!34970) (Cons!34969 (h!36369 (_ BitVec 64)) (t!49667 List!34973)) )
))
(declare-fun arrayNoDuplicates!0 (array!100494 (_ BitVec 32) List!34973) Bool)

(assert (=> b!1506549 (= res!1026872 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34970))))

(declare-fun b!1506550 () Bool)

(assert (=> b!1506550 (= e!841939 false)))

(declare-datatypes ((SeekEntryResult!12661 0))(
  ( (MissingZero!12661 (index!53039 (_ BitVec 32))) (Found!12661 (index!53040 (_ BitVec 32))) (Intermediate!12661 (undefined!13473 Bool) (index!53041 (_ BitVec 32)) (x!134795 (_ BitVec 32))) (Undefined!12661) (MissingVacant!12661 (index!53042 (_ BitVec 32))) )
))
(declare-fun lt!654250 () SeekEntryResult!12661)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100494 (_ BitVec 32)) SeekEntryResult!12661)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506550 (= lt!654250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48490 a!2804) j!70) mask!2512) (select (arr!48490 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506551 () Bool)

(declare-fun res!1026874 () Bool)

(assert (=> b!1506551 (=> (not res!1026874) (not e!841939))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506551 (= res!1026874 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49040 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49040 a!2804))))))

(declare-fun b!1506552 () Bool)

(declare-fun res!1026876 () Bool)

(assert (=> b!1506552 (=> (not res!1026876) (not e!841939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506552 (= res!1026876 (validKeyInArray!0 (select (arr!48490 a!2804) j!70)))))

(declare-fun b!1506553 () Bool)

(declare-fun res!1026875 () Bool)

(assert (=> b!1506553 (=> (not res!1026875) (not e!841939))))

(assert (=> b!1506553 (= res!1026875 (validKeyInArray!0 (select (arr!48490 a!2804) i!961)))))

(declare-fun b!1506554 () Bool)

(declare-fun res!1026871 () Bool)

(assert (=> b!1506554 (=> (not res!1026871) (not e!841939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100494 (_ BitVec 32)) Bool)

(assert (=> b!1506554 (= res!1026871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128482 res!1026873) b!1506548))

(assert (= (and b!1506548 res!1026877) b!1506553))

(assert (= (and b!1506553 res!1026875) b!1506552))

(assert (= (and b!1506552 res!1026876) b!1506554))

(assert (= (and b!1506554 res!1026871) b!1506549))

(assert (= (and b!1506549 res!1026872) b!1506551))

(assert (= (and b!1506551 res!1026874) b!1506550))

(declare-fun m!1389479 () Bool)

(assert (=> b!1506553 m!1389479))

(assert (=> b!1506553 m!1389479))

(declare-fun m!1389481 () Bool)

(assert (=> b!1506553 m!1389481))

(declare-fun m!1389483 () Bool)

(assert (=> b!1506554 m!1389483))

(declare-fun m!1389485 () Bool)

(assert (=> start!128482 m!1389485))

(declare-fun m!1389487 () Bool)

(assert (=> start!128482 m!1389487))

(declare-fun m!1389489 () Bool)

(assert (=> b!1506550 m!1389489))

(assert (=> b!1506550 m!1389489))

(declare-fun m!1389491 () Bool)

(assert (=> b!1506550 m!1389491))

(assert (=> b!1506550 m!1389491))

(assert (=> b!1506550 m!1389489))

(declare-fun m!1389493 () Bool)

(assert (=> b!1506550 m!1389493))

(assert (=> b!1506552 m!1389489))

(assert (=> b!1506552 m!1389489))

(declare-fun m!1389495 () Bool)

(assert (=> b!1506552 m!1389495))

(declare-fun m!1389497 () Bool)

(assert (=> b!1506549 m!1389497))

(push 1)

(assert (not b!1506554))

(assert (not b!1506553))

(assert (not start!128482))

