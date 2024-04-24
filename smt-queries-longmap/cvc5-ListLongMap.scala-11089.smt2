; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129930 () Bool)

(assert start!129930)

(declare-fun res!1040963 () Bool)

(declare-fun e!849771 () Bool)

(assert (=> start!129930 (=> (not res!1040963) (not e!849771))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129930 (= res!1040963 (validMask!0 mask!2512))))

(assert (=> start!129930 e!849771))

(assert (=> start!129930 true))

(declare-datatypes ((array!101354 0))(
  ( (array!101355 (arr!48903 (Array (_ BitVec 32) (_ BitVec 64))) (size!49454 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101354)

(declare-fun array_inv!38184 (array!101354) Bool)

(assert (=> start!129930 (array_inv!38184 a!2804)))

(declare-fun b!1523163 () Bool)

(assert (=> b!1523163 (= e!849771 false)))

(declare-fun lt!660127 () Bool)

(declare-datatypes ((List!35373 0))(
  ( (Nil!35370) (Cons!35369 (h!36808 (_ BitVec 64)) (t!50059 List!35373)) )
))
(declare-fun arrayNoDuplicates!0 (array!101354 (_ BitVec 32) List!35373) Bool)

(assert (=> b!1523163 (= lt!660127 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35370))))

(declare-fun b!1523164 () Bool)

(declare-fun res!1040959 () Bool)

(assert (=> b!1523164 (=> (not res!1040959) (not e!849771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101354 (_ BitVec 32)) Bool)

(assert (=> b!1523164 (= res!1040959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523165 () Bool)

(declare-fun res!1040962 () Bool)

(assert (=> b!1523165 (=> (not res!1040962) (not e!849771))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523165 (= res!1040962 (validKeyInArray!0 (select (arr!48903 a!2804) j!70)))))

(declare-fun b!1523166 () Bool)

(declare-fun res!1040961 () Bool)

(assert (=> b!1523166 (=> (not res!1040961) (not e!849771))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523166 (= res!1040961 (validKeyInArray!0 (select (arr!48903 a!2804) i!961)))))

(declare-fun b!1523167 () Bool)

(declare-fun res!1040960 () Bool)

(assert (=> b!1523167 (=> (not res!1040960) (not e!849771))))

(assert (=> b!1523167 (= res!1040960 (and (= (size!49454 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49454 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49454 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129930 res!1040963) b!1523167))

(assert (= (and b!1523167 res!1040960) b!1523166))

(assert (= (and b!1523166 res!1040961) b!1523165))

(assert (= (and b!1523165 res!1040962) b!1523164))

(assert (= (and b!1523164 res!1040959) b!1523163))

(declare-fun m!1406159 () Bool)

(assert (=> b!1523164 m!1406159))

(declare-fun m!1406161 () Bool)

(assert (=> b!1523165 m!1406161))

(assert (=> b!1523165 m!1406161))

(declare-fun m!1406163 () Bool)

(assert (=> b!1523165 m!1406163))

(declare-fun m!1406165 () Bool)

(assert (=> b!1523163 m!1406165))

(declare-fun m!1406167 () Bool)

(assert (=> b!1523166 m!1406167))

(assert (=> b!1523166 m!1406167))

(declare-fun m!1406169 () Bool)

(assert (=> b!1523166 m!1406169))

(declare-fun m!1406171 () Bool)

(assert (=> start!129930 m!1406171))

(declare-fun m!1406173 () Bool)

(assert (=> start!129930 m!1406173))

(push 1)

(assert (not b!1523165))

(assert (not b!1523164))

(assert (not b!1523166))

(assert (not b!1523163))

(assert (not start!129930))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

