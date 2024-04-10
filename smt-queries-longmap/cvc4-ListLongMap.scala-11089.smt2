; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129560 () Bool)

(assert start!129560)

(declare-fun b!1520953 () Bool)

(declare-fun res!1040179 () Bool)

(declare-fun e!848400 () Bool)

(assert (=> b!1520953 (=> (not res!1040179) (not e!848400))))

(declare-datatypes ((array!101235 0))(
  ( (array!101236 (arr!48850 (Array (_ BitVec 32) (_ BitVec 64))) (size!49400 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101235)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101235 (_ BitVec 32)) Bool)

(assert (=> b!1520953 (= res!1040179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520954 () Bool)

(declare-fun res!1040177 () Bool)

(assert (=> b!1520954 (=> (not res!1040177) (not e!848400))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520954 (= res!1040177 (validKeyInArray!0 (select (arr!48850 a!2804) j!70)))))

(declare-fun b!1520955 () Bool)

(declare-fun res!1040176 () Bool)

(assert (=> b!1520955 (=> (not res!1040176) (not e!848400))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1520955 (= res!1040176 (validKeyInArray!0 (select (arr!48850 a!2804) i!961)))))

(declare-fun b!1520956 () Bool)

(assert (=> b!1520956 (= e!848400 false)))

(declare-fun lt!659287 () Bool)

(declare-datatypes ((List!35333 0))(
  ( (Nil!35330) (Cons!35329 (h!36750 (_ BitVec 64)) (t!50027 List!35333)) )
))
(declare-fun arrayNoDuplicates!0 (array!101235 (_ BitVec 32) List!35333) Bool)

(assert (=> b!1520956 (= lt!659287 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35330))))

(declare-fun b!1520957 () Bool)

(declare-fun res!1040178 () Bool)

(assert (=> b!1520957 (=> (not res!1040178) (not e!848400))))

(assert (=> b!1520957 (= res!1040178 (and (= (size!49400 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49400 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49400 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1040175 () Bool)

(assert (=> start!129560 (=> (not res!1040175) (not e!848400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129560 (= res!1040175 (validMask!0 mask!2512))))

(assert (=> start!129560 e!848400))

(assert (=> start!129560 true))

(declare-fun array_inv!37878 (array!101235) Bool)

(assert (=> start!129560 (array_inv!37878 a!2804)))

(assert (= (and start!129560 res!1040175) b!1520957))

(assert (= (and b!1520957 res!1040178) b!1520955))

(assert (= (and b!1520955 res!1040176) b!1520954))

(assert (= (and b!1520954 res!1040177) b!1520953))

(assert (= (and b!1520953 res!1040179) b!1520956))

(declare-fun m!1404091 () Bool)

(assert (=> start!129560 m!1404091))

(declare-fun m!1404093 () Bool)

(assert (=> start!129560 m!1404093))

(declare-fun m!1404095 () Bool)

(assert (=> b!1520954 m!1404095))

(assert (=> b!1520954 m!1404095))

(declare-fun m!1404097 () Bool)

(assert (=> b!1520954 m!1404097))

(declare-fun m!1404099 () Bool)

(assert (=> b!1520956 m!1404099))

(declare-fun m!1404101 () Bool)

(assert (=> b!1520953 m!1404101))

(declare-fun m!1404103 () Bool)

(assert (=> b!1520955 m!1404103))

(assert (=> b!1520955 m!1404103))

(declare-fun m!1404105 () Bool)

(assert (=> b!1520955 m!1404105))

(push 1)

(assert (not start!129560))

(assert (not b!1520955))

(assert (not b!1520953))

(assert (not b!1520956))

(assert (not b!1520954))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

