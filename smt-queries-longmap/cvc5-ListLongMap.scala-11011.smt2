; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128898 () Bool)

(assert start!128898)

(declare-fun res!1030710 () Bool)

(declare-fun e!843594 () Bool)

(assert (=> start!128898 (=> (not res!1030710) (not e!843594))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128898 (= res!1030710 (validMask!0 mask!2512))))

(assert (=> start!128898 e!843594))

(assert (=> start!128898 true))

(declare-datatypes ((array!100754 0))(
  ( (array!100755 (arr!48614 (Array (_ BitVec 32) (_ BitVec 64))) (size!49164 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100754)

(declare-fun array_inv!37642 (array!100754) Bool)

(assert (=> start!128898 (array_inv!37642 a!2804)))

(declare-fun b!1510807 () Bool)

(declare-fun res!1030716 () Bool)

(declare-fun e!843593 () Bool)

(assert (=> b!1510807 (=> (not res!1030716) (not e!843593))))

(declare-datatypes ((SeekEntryResult!12785 0))(
  ( (MissingZero!12785 (index!53535 (_ BitVec 32))) (Found!12785 (index!53536 (_ BitVec 32))) (Intermediate!12785 (undefined!13597 Bool) (index!53537 (_ BitVec 32)) (x!135279 (_ BitVec 32))) (Undefined!12785) (MissingVacant!12785 (index!53538 (_ BitVec 32))) )
))
(declare-fun lt!655269 () SeekEntryResult!12785)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100754 (_ BitVec 32)) SeekEntryResult!12785)

(assert (=> b!1510807 (= res!1030716 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48614 a!2804) j!70) a!2804 mask!2512) lt!655269))))

(declare-fun b!1510808 () Bool)

(assert (=> b!1510808 (= e!843594 e!843593)))

(declare-fun res!1030719 () Bool)

(assert (=> b!1510808 (=> (not res!1030719) (not e!843593))))

(declare-fun lt!655270 () SeekEntryResult!12785)

(assert (=> b!1510808 (= res!1030719 (= lt!655270 lt!655269))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510808 (= lt!655269 (Intermediate!12785 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510808 (= lt!655270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48614 a!2804) j!70) mask!2512) (select (arr!48614 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510809 () Bool)

(declare-fun e!843592 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100754 (_ BitVec 32)) SeekEntryResult!12785)

(assert (=> b!1510809 (= e!843592 (= (seekEntry!0 (select (arr!48614 a!2804) j!70) a!2804 mask!2512) (Found!12785 j!70)))))

(declare-fun b!1510810 () Bool)

(declare-fun res!1030715 () Bool)

(assert (=> b!1510810 (=> (not res!1030715) (not e!843594))))

(assert (=> b!1510810 (= res!1030715 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49164 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49164 a!2804))))))

(declare-fun b!1510811 () Bool)

(declare-fun res!1030718 () Bool)

(assert (=> b!1510811 (=> (not res!1030718) (not e!843594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100754 (_ BitVec 32)) Bool)

(assert (=> b!1510811 (= res!1030718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510812 () Bool)

(declare-fun res!1030717 () Bool)

(assert (=> b!1510812 (=> (not res!1030717) (not e!843594))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1510812 (= res!1030717 (and (= (size!49164 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49164 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49164 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510813 () Bool)

(assert (=> b!1510813 (= e!843593 (not true))))

(assert (=> b!1510813 e!843592))

(declare-fun res!1030714 () Bool)

(assert (=> b!1510813 (=> (not res!1030714) (not e!843592))))

(assert (=> b!1510813 (= res!1030714 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50438 0))(
  ( (Unit!50439) )
))
(declare-fun lt!655268 () Unit!50438)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100754 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50438)

(assert (=> b!1510813 (= lt!655268 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510814 () Bool)

(declare-fun res!1030712 () Bool)

(assert (=> b!1510814 (=> (not res!1030712) (not e!843594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510814 (= res!1030712 (validKeyInArray!0 (select (arr!48614 a!2804) j!70)))))

(declare-fun b!1510815 () Bool)

(declare-fun res!1030713 () Bool)

(assert (=> b!1510815 (=> (not res!1030713) (not e!843593))))

(assert (=> b!1510815 (= res!1030713 (= lt!655270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48614 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48614 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100755 (store (arr!48614 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49164 a!2804)) mask!2512)))))

(declare-fun b!1510816 () Bool)

(declare-fun res!1030711 () Bool)

(assert (=> b!1510816 (=> (not res!1030711) (not e!843594))))

(declare-datatypes ((List!35097 0))(
  ( (Nil!35094) (Cons!35093 (h!36505 (_ BitVec 64)) (t!49791 List!35097)) )
))
(declare-fun arrayNoDuplicates!0 (array!100754 (_ BitVec 32) List!35097) Bool)

(assert (=> b!1510816 (= res!1030711 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35094))))

(declare-fun b!1510817 () Bool)

(declare-fun res!1030720 () Bool)

(assert (=> b!1510817 (=> (not res!1030720) (not e!843594))))

(assert (=> b!1510817 (= res!1030720 (validKeyInArray!0 (select (arr!48614 a!2804) i!961)))))

(assert (= (and start!128898 res!1030710) b!1510812))

(assert (= (and b!1510812 res!1030717) b!1510817))

(assert (= (and b!1510817 res!1030720) b!1510814))

(assert (= (and b!1510814 res!1030712) b!1510811))

(assert (= (and b!1510811 res!1030718) b!1510816))

(assert (= (and b!1510816 res!1030711) b!1510810))

(assert (= (and b!1510810 res!1030715) b!1510808))

(assert (= (and b!1510808 res!1030719) b!1510807))

(assert (= (and b!1510807 res!1030716) b!1510815))

(assert (= (and b!1510815 res!1030713) b!1510813))

(assert (= (and b!1510813 res!1030714) b!1510809))

(declare-fun m!1393435 () Bool)

(assert (=> b!1510816 m!1393435))

(declare-fun m!1393437 () Bool)

(assert (=> b!1510808 m!1393437))

(assert (=> b!1510808 m!1393437))

(declare-fun m!1393439 () Bool)

(assert (=> b!1510808 m!1393439))

(assert (=> b!1510808 m!1393439))

(assert (=> b!1510808 m!1393437))

(declare-fun m!1393441 () Bool)

(assert (=> b!1510808 m!1393441))

(declare-fun m!1393443 () Bool)

(assert (=> b!1510817 m!1393443))

(assert (=> b!1510817 m!1393443))

(declare-fun m!1393445 () Bool)

(assert (=> b!1510817 m!1393445))

(assert (=> b!1510807 m!1393437))

(assert (=> b!1510807 m!1393437))

(declare-fun m!1393447 () Bool)

(assert (=> b!1510807 m!1393447))

(declare-fun m!1393449 () Bool)

(assert (=> b!1510813 m!1393449))

(declare-fun m!1393451 () Bool)

(assert (=> b!1510813 m!1393451))

(assert (=> b!1510814 m!1393437))

(assert (=> b!1510814 m!1393437))

(declare-fun m!1393453 () Bool)

(assert (=> b!1510814 m!1393453))

(assert (=> b!1510809 m!1393437))

(assert (=> b!1510809 m!1393437))

(declare-fun m!1393455 () Bool)

(assert (=> b!1510809 m!1393455))

(declare-fun m!1393457 () Bool)

(assert (=> b!1510815 m!1393457))

(declare-fun m!1393459 () Bool)

(assert (=> b!1510815 m!1393459))

(assert (=> b!1510815 m!1393459))

(declare-fun m!1393461 () Bool)

(assert (=> b!1510815 m!1393461))

(assert (=> b!1510815 m!1393461))

(assert (=> b!1510815 m!1393459))

(declare-fun m!1393463 () Bool)

(assert (=> b!1510815 m!1393463))

(declare-fun m!1393465 () Bool)

(assert (=> start!128898 m!1393465))

(declare-fun m!1393467 () Bool)

(assert (=> start!128898 m!1393467))

(declare-fun m!1393469 () Bool)

(assert (=> b!1510811 m!1393469))

(push 1)

