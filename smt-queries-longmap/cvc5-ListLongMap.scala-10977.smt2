; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128568 () Bool)

(assert start!128568)

(declare-fun b!1507255 () Bool)

(declare-fun e!842212 () Bool)

(assert (=> b!1507255 (= e!842212 false)))

(declare-datatypes ((SeekEntryResult!12683 0))(
  ( (MissingZero!12683 (index!53127 (_ BitVec 32))) (Found!12683 (index!53128 (_ BitVec 32))) (Intermediate!12683 (undefined!13495 Bool) (index!53129 (_ BitVec 32)) (x!134887 (_ BitVec 32))) (Undefined!12683) (MissingVacant!12683 (index!53130 (_ BitVec 32))) )
))
(declare-fun lt!654367 () SeekEntryResult!12683)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100541 0))(
  ( (array!100542 (arr!48512 (Array (_ BitVec 32) (_ BitVec 64))) (size!49062 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100541)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100541 (_ BitVec 32)) SeekEntryResult!12683)

(assert (=> b!1507255 (= lt!654367 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48512 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1027475 () Bool)

(assert (=> start!128568 (=> (not res!1027475) (not e!842212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128568 (= res!1027475 (validMask!0 mask!2512))))

(assert (=> start!128568 e!842212))

(assert (=> start!128568 true))

(declare-fun array_inv!37540 (array!100541) Bool)

(assert (=> start!128568 (array_inv!37540 a!2804)))

(declare-fun b!1507256 () Bool)

(declare-fun res!1027477 () Bool)

(assert (=> b!1507256 (=> (not res!1027477) (not e!842212))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1507256 (= res!1027477 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49062 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49062 a!2804))))))

(declare-fun b!1507257 () Bool)

(declare-fun res!1027479 () Bool)

(assert (=> b!1507257 (=> (not res!1027479) (not e!842212))))

(declare-datatypes ((List!34995 0))(
  ( (Nil!34992) (Cons!34991 (h!36394 (_ BitVec 64)) (t!49689 List!34995)) )
))
(declare-fun arrayNoDuplicates!0 (array!100541 (_ BitVec 32) List!34995) Bool)

(assert (=> b!1507257 (= res!1027479 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34992))))

(declare-fun b!1507258 () Bool)

(declare-fun res!1027473 () Bool)

(assert (=> b!1507258 (=> (not res!1027473) (not e!842212))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1507258 (= res!1027473 (and (= (size!49062 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49062 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49062 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507259 () Bool)

(declare-fun res!1027478 () Bool)

(assert (=> b!1507259 (=> (not res!1027478) (not e!842212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100541 (_ BitVec 32)) Bool)

(assert (=> b!1507259 (= res!1027478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507260 () Bool)

(declare-fun res!1027474 () Bool)

(assert (=> b!1507260 (=> (not res!1027474) (not e!842212))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507260 (= res!1027474 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48512 a!2804) j!70) mask!2512) (select (arr!48512 a!2804) j!70) a!2804 mask!2512) (Intermediate!12683 false resIndex!21 resX!21)))))

(declare-fun b!1507261 () Bool)

(declare-fun res!1027480 () Bool)

(assert (=> b!1507261 (=> (not res!1027480) (not e!842212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507261 (= res!1027480 (validKeyInArray!0 (select (arr!48512 a!2804) i!961)))))

(declare-fun b!1507262 () Bool)

(declare-fun res!1027476 () Bool)

(assert (=> b!1507262 (=> (not res!1027476) (not e!842212))))

(assert (=> b!1507262 (= res!1027476 (validKeyInArray!0 (select (arr!48512 a!2804) j!70)))))

(assert (= (and start!128568 res!1027475) b!1507258))

(assert (= (and b!1507258 res!1027473) b!1507261))

(assert (= (and b!1507261 res!1027480) b!1507262))

(assert (= (and b!1507262 res!1027476) b!1507259))

(assert (= (and b!1507259 res!1027478) b!1507257))

(assert (= (and b!1507257 res!1027479) b!1507256))

(assert (= (and b!1507256 res!1027477) b!1507260))

(assert (= (and b!1507260 res!1027474) b!1507255))

(declare-fun m!1390027 () Bool)

(assert (=> start!128568 m!1390027))

(declare-fun m!1390029 () Bool)

(assert (=> start!128568 m!1390029))

(declare-fun m!1390031 () Bool)

(assert (=> b!1507257 m!1390031))

(declare-fun m!1390033 () Bool)

(assert (=> b!1507255 m!1390033))

(assert (=> b!1507255 m!1390033))

(declare-fun m!1390035 () Bool)

(assert (=> b!1507255 m!1390035))

(assert (=> b!1507260 m!1390033))

(assert (=> b!1507260 m!1390033))

(declare-fun m!1390037 () Bool)

(assert (=> b!1507260 m!1390037))

(assert (=> b!1507260 m!1390037))

(assert (=> b!1507260 m!1390033))

(declare-fun m!1390039 () Bool)

(assert (=> b!1507260 m!1390039))

(declare-fun m!1390041 () Bool)

(assert (=> b!1507261 m!1390041))

(assert (=> b!1507261 m!1390041))

(declare-fun m!1390043 () Bool)

(assert (=> b!1507261 m!1390043))

(assert (=> b!1507262 m!1390033))

(assert (=> b!1507262 m!1390033))

(declare-fun m!1390045 () Bool)

(assert (=> b!1507262 m!1390045))

(declare-fun m!1390047 () Bool)

(assert (=> b!1507259 m!1390047))

(push 1)

(assert (not b!1507262))

(assert (not b!1507257))

(assert (not b!1507260))

(assert (not b!1507259))

(assert (not b!1507261))

(assert (not b!1507255))

(assert (not start!128568))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

