; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128484 () Bool)

(assert start!128484)

(declare-fun res!1026897 () Bool)

(declare-fun e!841944 () Bool)

(assert (=> start!128484 (=> (not res!1026897) (not e!841944))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128484 (= res!1026897 (validMask!0 mask!2512))))

(assert (=> start!128484 e!841944))

(assert (=> start!128484 true))

(declare-datatypes ((array!100496 0))(
  ( (array!100497 (arr!48491 (Array (_ BitVec 32) (_ BitVec 64))) (size!49041 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100496)

(declare-fun array_inv!37519 (array!100496) Bool)

(assert (=> start!128484 (array_inv!37519 a!2804)))

(declare-fun b!1506571 () Bool)

(declare-fun res!1026900 () Bool)

(assert (=> b!1506571 (=> (not res!1026900) (not e!841944))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1506571 (= res!1026900 (and (= (size!49041 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49041 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49041 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506572 () Bool)

(declare-fun res!1026899 () Bool)

(assert (=> b!1506572 (=> (not res!1026899) (not e!841944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100496 (_ BitVec 32)) Bool)

(assert (=> b!1506572 (= res!1026899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506573 () Bool)

(declare-fun res!1026898 () Bool)

(assert (=> b!1506573 (=> (not res!1026898) (not e!841944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506573 (= res!1026898 (validKeyInArray!0 (select (arr!48491 a!2804) i!961)))))

(declare-fun b!1506574 () Bool)

(declare-fun res!1026894 () Bool)

(assert (=> b!1506574 (=> (not res!1026894) (not e!841944))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12662 0))(
  ( (MissingZero!12662 (index!53043 (_ BitVec 32))) (Found!12662 (index!53044 (_ BitVec 32))) (Intermediate!12662 (undefined!13474 Bool) (index!53045 (_ BitVec 32)) (x!134804 (_ BitVec 32))) (Undefined!12662) (MissingVacant!12662 (index!53046 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100496 (_ BitVec 32)) SeekEntryResult!12662)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506574 (= res!1026894 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48491 a!2804) j!70) mask!2512) (select (arr!48491 a!2804) j!70) a!2804 mask!2512) (Intermediate!12662 false resIndex!21 resX!21)))))

(declare-fun b!1506575 () Bool)

(declare-fun res!1026901 () Bool)

(assert (=> b!1506575 (=> (not res!1026901) (not e!841944))))

(declare-datatypes ((List!34974 0))(
  ( (Nil!34971) (Cons!34970 (h!36370 (_ BitVec 64)) (t!49668 List!34974)) )
))
(declare-fun arrayNoDuplicates!0 (array!100496 (_ BitVec 32) List!34974) Bool)

(assert (=> b!1506575 (= res!1026901 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34971))))

(declare-fun b!1506576 () Bool)

(assert (=> b!1506576 (= e!841944 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1506577 () Bool)

(declare-fun res!1026895 () Bool)

(assert (=> b!1506577 (=> (not res!1026895) (not e!841944))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1506577 (= res!1026895 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49041 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49041 a!2804))))))

(declare-fun b!1506578 () Bool)

(declare-fun res!1026896 () Bool)

(assert (=> b!1506578 (=> (not res!1026896) (not e!841944))))

(assert (=> b!1506578 (= res!1026896 (validKeyInArray!0 (select (arr!48491 a!2804) j!70)))))

(assert (= (and start!128484 res!1026897) b!1506571))

(assert (= (and b!1506571 res!1026900) b!1506573))

(assert (= (and b!1506573 res!1026898) b!1506578))

(assert (= (and b!1506578 res!1026896) b!1506572))

(assert (= (and b!1506572 res!1026899) b!1506575))

(assert (= (and b!1506575 res!1026901) b!1506577))

(assert (= (and b!1506577 res!1026895) b!1506574))

(assert (= (and b!1506574 res!1026894) b!1506576))

(declare-fun m!1389499 () Bool)

(assert (=> b!1506575 m!1389499))

(declare-fun m!1389501 () Bool)

(assert (=> b!1506572 m!1389501))

(declare-fun m!1389503 () Bool)

(assert (=> b!1506574 m!1389503))

(assert (=> b!1506574 m!1389503))

(declare-fun m!1389505 () Bool)

(assert (=> b!1506574 m!1389505))

(assert (=> b!1506574 m!1389505))

(assert (=> b!1506574 m!1389503))

(declare-fun m!1389507 () Bool)

(assert (=> b!1506574 m!1389507))

(declare-fun m!1389509 () Bool)

(assert (=> start!128484 m!1389509))

(declare-fun m!1389511 () Bool)

(assert (=> start!128484 m!1389511))

(assert (=> b!1506578 m!1389503))

(assert (=> b!1506578 m!1389503))

(declare-fun m!1389513 () Bool)

(assert (=> b!1506578 m!1389513))

(declare-fun m!1389515 () Bool)

(assert (=> b!1506573 m!1389515))

(assert (=> b!1506573 m!1389515))

(declare-fun m!1389517 () Bool)

(assert (=> b!1506573 m!1389517))

(push 1)

(assert (not b!1506578))

(assert (not b!1506573))

