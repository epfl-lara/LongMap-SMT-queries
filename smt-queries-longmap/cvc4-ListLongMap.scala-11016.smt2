; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128932 () Bool)

(assert start!128932)

(declare-fun b!1511368 () Bool)

(declare-fun res!1031279 () Bool)

(declare-fun e!843796 () Bool)

(assert (=> b!1511368 (=> (not res!1031279) (not e!843796))))

(declare-datatypes ((SeekEntryResult!12802 0))(
  ( (MissingZero!12802 (index!53603 (_ BitVec 32))) (Found!12802 (index!53604 (_ BitVec 32))) (Intermediate!12802 (undefined!13614 Bool) (index!53605 (_ BitVec 32)) (x!135336 (_ BitVec 32))) (Undefined!12802) (MissingVacant!12802 (index!53606 (_ BitVec 32))) )
))
(declare-fun lt!655421 () SeekEntryResult!12802)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100788 0))(
  ( (array!100789 (arr!48631 (Array (_ BitVec 32) (_ BitVec 64))) (size!49181 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100788)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100788 (_ BitVec 32)) SeekEntryResult!12802)

(assert (=> b!1511368 (= res!1031279 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48631 a!2804) j!70) a!2804 mask!2512) lt!655421))))

(declare-fun b!1511369 () Bool)

(assert (=> b!1511369 (= e!843796 (not true))))

(declare-fun e!843798 () Bool)

(assert (=> b!1511369 e!843798))

(declare-fun res!1031276 () Bool)

(assert (=> b!1511369 (=> (not res!1031276) (not e!843798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100788 (_ BitVec 32)) Bool)

(assert (=> b!1511369 (= res!1031276 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50472 0))(
  ( (Unit!50473) )
))
(declare-fun lt!655423 () Unit!50472)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50472)

(assert (=> b!1511369 (= lt!655423 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1031272 () Bool)

(declare-fun e!843797 () Bool)

(assert (=> start!128932 (=> (not res!1031272) (not e!843797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128932 (= res!1031272 (validMask!0 mask!2512))))

(assert (=> start!128932 e!843797))

(assert (=> start!128932 true))

(declare-fun array_inv!37659 (array!100788) Bool)

(assert (=> start!128932 (array_inv!37659 a!2804)))

(declare-fun b!1511370 () Bool)

(declare-fun res!1031275 () Bool)

(assert (=> b!1511370 (=> (not res!1031275) (not e!843797))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1511370 (= res!1031275 (and (= (size!49181 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49181 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49181 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511371 () Bool)

(declare-fun res!1031277 () Bool)

(assert (=> b!1511371 (=> (not res!1031277) (not e!843797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511371 (= res!1031277 (validKeyInArray!0 (select (arr!48631 a!2804) i!961)))))

(declare-fun b!1511372 () Bool)

(declare-fun res!1031278 () Bool)

(assert (=> b!1511372 (=> (not res!1031278) (not e!843797))))

(assert (=> b!1511372 (= res!1031278 (validKeyInArray!0 (select (arr!48631 a!2804) j!70)))))

(declare-fun b!1511373 () Bool)

(declare-fun res!1031271 () Bool)

(assert (=> b!1511373 (=> (not res!1031271) (not e!843797))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511373 (= res!1031271 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49181 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49181 a!2804))))))

(declare-fun b!1511374 () Bool)

(declare-fun res!1031281 () Bool)

(assert (=> b!1511374 (=> (not res!1031281) (not e!843797))))

(declare-datatypes ((List!35114 0))(
  ( (Nil!35111) (Cons!35110 (h!36522 (_ BitVec 64)) (t!49808 List!35114)) )
))
(declare-fun arrayNoDuplicates!0 (array!100788 (_ BitVec 32) List!35114) Bool)

(assert (=> b!1511374 (= res!1031281 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35111))))

(declare-fun b!1511375 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100788 (_ BitVec 32)) SeekEntryResult!12802)

(assert (=> b!1511375 (= e!843798 (= (seekEntry!0 (select (arr!48631 a!2804) j!70) a!2804 mask!2512) (Found!12802 j!70)))))

(declare-fun b!1511376 () Bool)

(assert (=> b!1511376 (= e!843797 e!843796)))

(declare-fun res!1031274 () Bool)

(assert (=> b!1511376 (=> (not res!1031274) (not e!843796))))

(declare-fun lt!655422 () SeekEntryResult!12802)

(assert (=> b!1511376 (= res!1031274 (= lt!655422 lt!655421))))

(assert (=> b!1511376 (= lt!655421 (Intermediate!12802 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511376 (= lt!655422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48631 a!2804) j!70) mask!2512) (select (arr!48631 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511377 () Bool)

(declare-fun res!1031280 () Bool)

(assert (=> b!1511377 (=> (not res!1031280) (not e!843797))))

(assert (=> b!1511377 (= res!1031280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511378 () Bool)

(declare-fun res!1031273 () Bool)

(assert (=> b!1511378 (=> (not res!1031273) (not e!843796))))

(assert (=> b!1511378 (= res!1031273 (= lt!655422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48631 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48631 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100789 (store (arr!48631 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49181 a!2804)) mask!2512)))))

(assert (= (and start!128932 res!1031272) b!1511370))

(assert (= (and b!1511370 res!1031275) b!1511371))

(assert (= (and b!1511371 res!1031277) b!1511372))

(assert (= (and b!1511372 res!1031278) b!1511377))

(assert (= (and b!1511377 res!1031280) b!1511374))

(assert (= (and b!1511374 res!1031281) b!1511373))

(assert (= (and b!1511373 res!1031271) b!1511376))

(assert (= (and b!1511376 res!1031274) b!1511368))

(assert (= (and b!1511368 res!1031279) b!1511378))

(assert (= (and b!1511378 res!1031273) b!1511369))

(assert (= (and b!1511369 res!1031276) b!1511375))

(declare-fun m!1394059 () Bool)

(assert (=> b!1511377 m!1394059))

(declare-fun m!1394061 () Bool)

(assert (=> b!1511374 m!1394061))

(declare-fun m!1394063 () Bool)

(assert (=> b!1511371 m!1394063))

(assert (=> b!1511371 m!1394063))

(declare-fun m!1394065 () Bool)

(assert (=> b!1511371 m!1394065))

(declare-fun m!1394067 () Bool)

(assert (=> b!1511372 m!1394067))

(assert (=> b!1511372 m!1394067))

(declare-fun m!1394069 () Bool)

(assert (=> b!1511372 m!1394069))

(declare-fun m!1394071 () Bool)

(assert (=> b!1511369 m!1394071))

(declare-fun m!1394073 () Bool)

(assert (=> b!1511369 m!1394073))

(declare-fun m!1394075 () Bool)

(assert (=> start!128932 m!1394075))

(declare-fun m!1394077 () Bool)

(assert (=> start!128932 m!1394077))

(declare-fun m!1394079 () Bool)

(assert (=> b!1511378 m!1394079))

(declare-fun m!1394081 () Bool)

(assert (=> b!1511378 m!1394081))

(assert (=> b!1511378 m!1394081))

(declare-fun m!1394083 () Bool)

(assert (=> b!1511378 m!1394083))

(assert (=> b!1511378 m!1394083))

(assert (=> b!1511378 m!1394081))

(declare-fun m!1394085 () Bool)

(assert (=> b!1511378 m!1394085))

(assert (=> b!1511375 m!1394067))

(assert (=> b!1511375 m!1394067))

(declare-fun m!1394087 () Bool)

(assert (=> b!1511375 m!1394087))

(assert (=> b!1511376 m!1394067))

(assert (=> b!1511376 m!1394067))

(declare-fun m!1394089 () Bool)

(assert (=> b!1511376 m!1394089))

(assert (=> b!1511376 m!1394089))

(assert (=> b!1511376 m!1394067))

(declare-fun m!1394091 () Bool)

(assert (=> b!1511376 m!1394091))

(assert (=> b!1511368 m!1394067))

(assert (=> b!1511368 m!1394067))

(declare-fun m!1394093 () Bool)

(assert (=> b!1511368 m!1394093))

(push 1)

(assert (not b!1511376))

(assert (not b!1511377))

