; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129514 () Bool)

(assert start!129514)

(declare-fun b!1520674 () Bool)

(declare-fun res!1040103 () Bool)

(declare-fun e!848204 () Bool)

(assert (=> b!1520674 (=> (not res!1040103) (not e!848204))))

(declare-datatypes ((array!101189 0))(
  ( (array!101190 (arr!48828 (Array (_ BitVec 32) (_ BitVec 64))) (size!49380 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101189)

(declare-datatypes ((List!35389 0))(
  ( (Nil!35386) (Cons!35385 (h!36807 (_ BitVec 64)) (t!50075 List!35389)) )
))
(declare-fun arrayNoDuplicates!0 (array!101189 (_ BitVec 32) List!35389) Bool)

(assert (=> b!1520674 (= res!1040103 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35386))))

(declare-fun res!1040102 () Bool)

(assert (=> start!129514 (=> (not res!1040102) (not e!848204))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129514 (= res!1040102 (validMask!0 mask!2512))))

(assert (=> start!129514 e!848204))

(assert (=> start!129514 true))

(declare-fun array_inv!38061 (array!101189) Bool)

(assert (=> start!129514 (array_inv!38061 a!2804)))

(declare-fun b!1520675 () Bool)

(declare-fun res!1040105 () Bool)

(assert (=> b!1520675 (=> (not res!1040105) (not e!848204))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520675 (= res!1040105 (validKeyInArray!0 (select (arr!48828 a!2804) i!961)))))

(declare-fun b!1520676 () Bool)

(declare-fun res!1040107 () Bool)

(assert (=> b!1520676 (=> (not res!1040107) (not e!848204))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1520676 (= res!1040107 (and (= (size!49380 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49380 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49380 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520677 () Bool)

(declare-fun res!1040108 () Bool)

(assert (=> b!1520677 (=> (not res!1040108) (not e!848204))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520677 (= res!1040108 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49380 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49380 a!2804))))))

(declare-fun b!1520678 () Bool)

(declare-fun res!1040106 () Bool)

(assert (=> b!1520678 (=> (not res!1040106) (not e!848204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101189 (_ BitVec 32)) Bool)

(assert (=> b!1520678 (= res!1040106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520679 () Bool)

(assert (=> b!1520679 (= e!848204 false)))

(declare-fun lt!659001 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520679 (= lt!659001 (toIndex!0 (select (arr!48828 a!2804) j!70) mask!2512))))

(declare-fun b!1520680 () Bool)

(declare-fun res!1040104 () Bool)

(assert (=> b!1520680 (=> (not res!1040104) (not e!848204))))

(assert (=> b!1520680 (= res!1040104 (validKeyInArray!0 (select (arr!48828 a!2804) j!70)))))

(assert (= (and start!129514 res!1040102) b!1520676))

(assert (= (and b!1520676 res!1040107) b!1520675))

(assert (= (and b!1520675 res!1040105) b!1520680))

(assert (= (and b!1520680 res!1040104) b!1520678))

(assert (= (and b!1520678 res!1040106) b!1520674))

(assert (= (and b!1520674 res!1040103) b!1520677))

(assert (= (and b!1520677 res!1040108) b!1520679))

(declare-fun m!1403235 () Bool)

(assert (=> b!1520675 m!1403235))

(assert (=> b!1520675 m!1403235))

(declare-fun m!1403237 () Bool)

(assert (=> b!1520675 m!1403237))

(declare-fun m!1403239 () Bool)

(assert (=> b!1520674 m!1403239))

(declare-fun m!1403241 () Bool)

(assert (=> b!1520680 m!1403241))

(assert (=> b!1520680 m!1403241))

(declare-fun m!1403243 () Bool)

(assert (=> b!1520680 m!1403243))

(assert (=> b!1520679 m!1403241))

(assert (=> b!1520679 m!1403241))

(declare-fun m!1403245 () Bool)

(assert (=> b!1520679 m!1403245))

(declare-fun m!1403247 () Bool)

(assert (=> b!1520678 m!1403247))

(declare-fun m!1403249 () Bool)

(assert (=> start!129514 m!1403249))

(declare-fun m!1403251 () Bool)

(assert (=> start!129514 m!1403251))

(push 1)

(assert (not b!1520680))

(assert (not start!129514))

(assert (not b!1520675))

(assert (not b!1520679))

(assert (not b!1520674))

(assert (not b!1520678))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

