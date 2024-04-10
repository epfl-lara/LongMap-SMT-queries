; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128478 () Bool)

(assert start!128478)

(declare-fun b!1506506 () Bool)

(declare-fun res!1026832 () Bool)

(declare-fun e!841927 () Bool)

(assert (=> b!1506506 (=> (not res!1026832) (not e!841927))))

(declare-datatypes ((array!100490 0))(
  ( (array!100491 (arr!48488 (Array (_ BitVec 32) (_ BitVec 64))) (size!49038 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100490)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506506 (= res!1026832 (validKeyInArray!0 (select (arr!48488 a!2804) j!70)))))

(declare-fun b!1506507 () Bool)

(declare-fun res!1026835 () Bool)

(assert (=> b!1506507 (=> (not res!1026835) (not e!841927))))

(declare-datatypes ((List!34971 0))(
  ( (Nil!34968) (Cons!34967 (h!36367 (_ BitVec 64)) (t!49665 List!34971)) )
))
(declare-fun arrayNoDuplicates!0 (array!100490 (_ BitVec 32) List!34971) Bool)

(assert (=> b!1506507 (= res!1026835 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34968))))

(declare-fun b!1506509 () Bool)

(assert (=> b!1506509 (= e!841927 false)))

(declare-datatypes ((SeekEntryResult!12659 0))(
  ( (MissingZero!12659 (index!53031 (_ BitVec 32))) (Found!12659 (index!53032 (_ BitVec 32))) (Intermediate!12659 (undefined!13471 Bool) (index!53033 (_ BitVec 32)) (x!134793 (_ BitVec 32))) (Undefined!12659) (MissingVacant!12659 (index!53034 (_ BitVec 32))) )
))
(declare-fun lt!654244 () SeekEntryResult!12659)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100490 (_ BitVec 32)) SeekEntryResult!12659)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506509 (= lt!654244 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48488 a!2804) j!70) mask!2512) (select (arr!48488 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506510 () Bool)

(declare-fun res!1026833 () Bool)

(assert (=> b!1506510 (=> (not res!1026833) (not e!841927))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506510 (= res!1026833 (and (= (size!49038 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49038 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49038 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506511 () Bool)

(declare-fun res!1026831 () Bool)

(assert (=> b!1506511 (=> (not res!1026831) (not e!841927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100490 (_ BitVec 32)) Bool)

(assert (=> b!1506511 (= res!1026831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506512 () Bool)

(declare-fun res!1026829 () Bool)

(assert (=> b!1506512 (=> (not res!1026829) (not e!841927))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1506512 (= res!1026829 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49038 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49038 a!2804))))))

(declare-fun res!1026830 () Bool)

(assert (=> start!128478 (=> (not res!1026830) (not e!841927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128478 (= res!1026830 (validMask!0 mask!2512))))

(assert (=> start!128478 e!841927))

(assert (=> start!128478 true))

(declare-fun array_inv!37516 (array!100490) Bool)

(assert (=> start!128478 (array_inv!37516 a!2804)))

(declare-fun b!1506508 () Bool)

(declare-fun res!1026834 () Bool)

(assert (=> b!1506508 (=> (not res!1026834) (not e!841927))))

(assert (=> b!1506508 (= res!1026834 (validKeyInArray!0 (select (arr!48488 a!2804) i!961)))))

(assert (= (and start!128478 res!1026830) b!1506510))

(assert (= (and b!1506510 res!1026833) b!1506508))

(assert (= (and b!1506508 res!1026834) b!1506506))

(assert (= (and b!1506506 res!1026832) b!1506511))

(assert (= (and b!1506511 res!1026831) b!1506507))

(assert (= (and b!1506507 res!1026835) b!1506512))

(assert (= (and b!1506512 res!1026829) b!1506509))

(declare-fun m!1389439 () Bool)

(assert (=> b!1506511 m!1389439))

(declare-fun m!1389441 () Bool)

(assert (=> b!1506507 m!1389441))

(declare-fun m!1389443 () Bool)

(assert (=> start!128478 m!1389443))

(declare-fun m!1389445 () Bool)

(assert (=> start!128478 m!1389445))

(declare-fun m!1389447 () Bool)

(assert (=> b!1506508 m!1389447))

(assert (=> b!1506508 m!1389447))

(declare-fun m!1389449 () Bool)

(assert (=> b!1506508 m!1389449))

(declare-fun m!1389451 () Bool)

(assert (=> b!1506506 m!1389451))

(assert (=> b!1506506 m!1389451))

(declare-fun m!1389453 () Bool)

(assert (=> b!1506506 m!1389453))

(assert (=> b!1506509 m!1389451))

(assert (=> b!1506509 m!1389451))

(declare-fun m!1389455 () Bool)

(assert (=> b!1506509 m!1389455))

(assert (=> b!1506509 m!1389455))

(assert (=> b!1506509 m!1389451))

(declare-fun m!1389457 () Bool)

(assert (=> b!1506509 m!1389457))

(push 1)

(assert (not b!1506509))

(assert (not start!128478))

(assert (not b!1506508))

(assert (not b!1506507))

(assert (not b!1506506))

(assert (not b!1506511))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

