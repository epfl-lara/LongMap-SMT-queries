; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129562 () Bool)

(assert start!129562)

(declare-fun res!1040200 () Bool)

(declare-fun e!848407 () Bool)

(assert (=> start!129562 (=> (not res!1040200) (not e!848407))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129562 (= res!1040200 (validMask!0 mask!2512))))

(assert (=> start!129562 e!848407))

(assert (=> start!129562 true))

(declare-datatypes ((array!101237 0))(
  ( (array!101238 (arr!48851 (Array (_ BitVec 32) (_ BitVec 64))) (size!49401 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101237)

(declare-fun array_inv!37879 (array!101237) Bool)

(assert (=> start!129562 (array_inv!37879 a!2804)))

(declare-fun b!1520972 () Bool)

(declare-fun res!1040197 () Bool)

(assert (=> b!1520972 (=> (not res!1040197) (not e!848407))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520972 (= res!1040197 (validKeyInArray!0 (select (arr!48851 a!2804) j!70)))))

(declare-fun b!1520973 () Bool)

(declare-fun res!1040194 () Bool)

(assert (=> b!1520973 (=> (not res!1040194) (not e!848407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101237 (_ BitVec 32)) Bool)

(assert (=> b!1520973 (= res!1040194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520974 () Bool)

(declare-fun res!1040198 () Bool)

(assert (=> b!1520974 (=> (not res!1040198) (not e!848407))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1520974 (= res!1040198 (validKeyInArray!0 (select (arr!48851 a!2804) i!961)))))

(declare-fun b!1520975 () Bool)

(declare-fun res!1040199 () Bool)

(assert (=> b!1520975 (=> (not res!1040199) (not e!848407))))

(declare-datatypes ((List!35334 0))(
  ( (Nil!35331) (Cons!35330 (h!36751 (_ BitVec 64)) (t!50028 List!35334)) )
))
(declare-fun arrayNoDuplicates!0 (array!101237 (_ BitVec 32) List!35334) Bool)

(assert (=> b!1520975 (= res!1040199 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35331))))

(declare-fun b!1520976 () Bool)

(assert (=> b!1520976 (= e!848407 false)))

(declare-fun lt!659290 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520976 (= lt!659290 (toIndex!0 (select (arr!48851 a!2804) j!70) mask!2512))))

(declare-fun b!1520977 () Bool)

(declare-fun res!1040195 () Bool)

(assert (=> b!1520977 (=> (not res!1040195) (not e!848407))))

(assert (=> b!1520977 (= res!1040195 (and (= (size!49401 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49401 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49401 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520978 () Bool)

(declare-fun res!1040196 () Bool)

(assert (=> b!1520978 (=> (not res!1040196) (not e!848407))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520978 (= res!1040196 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49401 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49401 a!2804))))))

(assert (= (and start!129562 res!1040200) b!1520977))

(assert (= (and b!1520977 res!1040195) b!1520974))

(assert (= (and b!1520974 res!1040198) b!1520972))

(assert (= (and b!1520972 res!1040197) b!1520973))

(assert (= (and b!1520973 res!1040194) b!1520975))

(assert (= (and b!1520975 res!1040199) b!1520978))

(assert (= (and b!1520978 res!1040196) b!1520976))

(declare-fun m!1404107 () Bool)

(assert (=> start!129562 m!1404107))

(declare-fun m!1404109 () Bool)

(assert (=> start!129562 m!1404109))

(declare-fun m!1404111 () Bool)

(assert (=> b!1520974 m!1404111))

(assert (=> b!1520974 m!1404111))

(declare-fun m!1404113 () Bool)

(assert (=> b!1520974 m!1404113))

(declare-fun m!1404115 () Bool)

(assert (=> b!1520976 m!1404115))

(assert (=> b!1520976 m!1404115))

(declare-fun m!1404117 () Bool)

(assert (=> b!1520976 m!1404117))

(declare-fun m!1404119 () Bool)

(assert (=> b!1520975 m!1404119))

(declare-fun m!1404121 () Bool)

(assert (=> b!1520973 m!1404121))

(assert (=> b!1520972 m!1404115))

(assert (=> b!1520972 m!1404115))

(declare-fun m!1404123 () Bool)

(assert (=> b!1520972 m!1404123))

(push 1)

(assert (not b!1520974))

(assert (not start!129562))

(assert (not b!1520973))

(assert (not b!1520976))

(assert (not b!1520975))

(assert (not b!1520972))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

