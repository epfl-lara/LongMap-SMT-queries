; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128878 () Bool)

(assert start!128878)

(declare-fun b!1510477 () Bool)

(declare-fun res!1030390 () Bool)

(declare-fun e!843472 () Bool)

(assert (=> b!1510477 (=> (not res!1030390) (not e!843472))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100734 0))(
  ( (array!100735 (arr!48604 (Array (_ BitVec 32) (_ BitVec 64))) (size!49154 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100734)

(assert (=> b!1510477 (= res!1030390 (and (= (size!49154 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49154 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49154 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1030381 () Bool)

(assert (=> start!128878 (=> (not res!1030381) (not e!843472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128878 (= res!1030381 (validMask!0 mask!2512))))

(assert (=> start!128878 e!843472))

(assert (=> start!128878 true))

(declare-fun array_inv!37632 (array!100734) Bool)

(assert (=> start!128878 (array_inv!37632 a!2804)))

(declare-fun b!1510478 () Bool)

(declare-fun res!1030388 () Bool)

(assert (=> b!1510478 (=> (not res!1030388) (not e!843472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510478 (= res!1030388 (validKeyInArray!0 (select (arr!48604 a!2804) i!961)))))

(declare-fun b!1510479 () Bool)

(declare-fun res!1030386 () Bool)

(assert (=> b!1510479 (=> (not res!1030386) (not e!843472))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1510479 (= res!1030386 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49154 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49154 a!2804))))))

(declare-fun b!1510480 () Bool)

(declare-fun res!1030383 () Bool)

(assert (=> b!1510480 (=> (not res!1030383) (not e!843472))))

(declare-datatypes ((List!35087 0))(
  ( (Nil!35084) (Cons!35083 (h!36495 (_ BitVec 64)) (t!49781 List!35087)) )
))
(declare-fun arrayNoDuplicates!0 (array!100734 (_ BitVec 32) List!35087) Bool)

(assert (=> b!1510480 (= res!1030383 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35084))))

(declare-fun b!1510481 () Bool)

(declare-fun res!1030380 () Bool)

(assert (=> b!1510481 (=> (not res!1030380) (not e!843472))))

(assert (=> b!1510481 (= res!1030380 (validKeyInArray!0 (select (arr!48604 a!2804) j!70)))))

(declare-fun b!1510482 () Bool)

(declare-fun e!843473 () Bool)

(declare-datatypes ((SeekEntryResult!12775 0))(
  ( (MissingZero!12775 (index!53495 (_ BitVec 32))) (Found!12775 (index!53496 (_ BitVec 32))) (Intermediate!12775 (undefined!13587 Bool) (index!53497 (_ BitVec 32)) (x!135237 (_ BitVec 32))) (Undefined!12775) (MissingVacant!12775 (index!53498 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100734 (_ BitVec 32)) SeekEntryResult!12775)

(assert (=> b!1510482 (= e!843473 (= (seekEntry!0 (select (arr!48604 a!2804) j!70) a!2804 mask!2512) (Found!12775 j!70)))))

(declare-fun b!1510483 () Bool)

(declare-fun e!843475 () Bool)

(assert (=> b!1510483 (= e!843472 e!843475)))

(declare-fun res!1030382 () Bool)

(assert (=> b!1510483 (=> (not res!1030382) (not e!843475))))

(declare-fun lt!655178 () SeekEntryResult!12775)

(declare-fun lt!655179 () SeekEntryResult!12775)

(assert (=> b!1510483 (= res!1030382 (= lt!655178 lt!655179))))

(assert (=> b!1510483 (= lt!655179 (Intermediate!12775 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100734 (_ BitVec 32)) SeekEntryResult!12775)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510483 (= lt!655178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48604 a!2804) j!70) mask!2512) (select (arr!48604 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510484 () Bool)

(assert (=> b!1510484 (= e!843475 (not true))))

(assert (=> b!1510484 e!843473))

(declare-fun res!1030387 () Bool)

(assert (=> b!1510484 (=> (not res!1030387) (not e!843473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100734 (_ BitVec 32)) Bool)

(assert (=> b!1510484 (= res!1030387 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50418 0))(
  ( (Unit!50419) )
))
(declare-fun lt!655180 () Unit!50418)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100734 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50418)

(assert (=> b!1510484 (= lt!655180 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510485 () Bool)

(declare-fun res!1030385 () Bool)

(assert (=> b!1510485 (=> (not res!1030385) (not e!843472))))

(assert (=> b!1510485 (= res!1030385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510486 () Bool)

(declare-fun res!1030389 () Bool)

(assert (=> b!1510486 (=> (not res!1030389) (not e!843475))))

(assert (=> b!1510486 (= res!1030389 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48604 a!2804) j!70) a!2804 mask!2512) lt!655179))))

(declare-fun b!1510487 () Bool)

(declare-fun res!1030384 () Bool)

(assert (=> b!1510487 (=> (not res!1030384) (not e!843475))))

(assert (=> b!1510487 (= res!1030384 (= lt!655178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48604 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48604 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100735 (store (arr!48604 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49154 a!2804)) mask!2512)))))

(assert (= (and start!128878 res!1030381) b!1510477))

(assert (= (and b!1510477 res!1030390) b!1510478))

(assert (= (and b!1510478 res!1030388) b!1510481))

(assert (= (and b!1510481 res!1030380) b!1510485))

(assert (= (and b!1510485 res!1030385) b!1510480))

(assert (= (and b!1510480 res!1030383) b!1510479))

(assert (= (and b!1510479 res!1030386) b!1510483))

(assert (= (and b!1510483 res!1030382) b!1510486))

(assert (= (and b!1510486 res!1030389) b!1510487))

(assert (= (and b!1510487 res!1030384) b!1510484))

(assert (= (and b!1510484 res!1030387) b!1510482))

(declare-fun m!1393069 () Bool)

(assert (=> b!1510480 m!1393069))

(declare-fun m!1393071 () Bool)

(assert (=> b!1510478 m!1393071))

(assert (=> b!1510478 m!1393071))

(declare-fun m!1393073 () Bool)

(assert (=> b!1510478 m!1393073))

(declare-fun m!1393075 () Bool)

(assert (=> b!1510486 m!1393075))

(assert (=> b!1510486 m!1393075))

(declare-fun m!1393077 () Bool)

(assert (=> b!1510486 m!1393077))

(declare-fun m!1393079 () Bool)

(assert (=> b!1510485 m!1393079))

(assert (=> b!1510481 m!1393075))

(assert (=> b!1510481 m!1393075))

(declare-fun m!1393081 () Bool)

(assert (=> b!1510481 m!1393081))

(assert (=> b!1510483 m!1393075))

(assert (=> b!1510483 m!1393075))

(declare-fun m!1393083 () Bool)

(assert (=> b!1510483 m!1393083))

(assert (=> b!1510483 m!1393083))

(assert (=> b!1510483 m!1393075))

(declare-fun m!1393085 () Bool)

(assert (=> b!1510483 m!1393085))

(assert (=> b!1510482 m!1393075))

(assert (=> b!1510482 m!1393075))

(declare-fun m!1393087 () Bool)

(assert (=> b!1510482 m!1393087))

(declare-fun m!1393089 () Bool)

(assert (=> b!1510487 m!1393089))

(declare-fun m!1393091 () Bool)

(assert (=> b!1510487 m!1393091))

(assert (=> b!1510487 m!1393091))

(declare-fun m!1393093 () Bool)

(assert (=> b!1510487 m!1393093))

(assert (=> b!1510487 m!1393093))

(assert (=> b!1510487 m!1393091))

(declare-fun m!1393095 () Bool)

(assert (=> b!1510487 m!1393095))

(declare-fun m!1393097 () Bool)

(assert (=> b!1510484 m!1393097))

(declare-fun m!1393099 () Bool)

(assert (=> b!1510484 m!1393099))

(declare-fun m!1393101 () Bool)

(assert (=> start!128878 m!1393101))

(declare-fun m!1393103 () Bool)

(assert (=> start!128878 m!1393103))

(push 1)

(assert (not b!1510486))

(assert (not b!1510482))

(assert (not b!1510480))

