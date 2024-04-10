; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127674 () Bool)

(assert start!127674)

(declare-fun b!1500071 () Bool)

(declare-fun res!1021148 () Bool)

(declare-fun e!839484 () Bool)

(assert (=> b!1500071 (=> (not res!1021148) (not e!839484))))

(declare-datatypes ((array!100055 0))(
  ( (array!100056 (arr!48287 (Array (_ BitVec 32) (_ BitVec 64))) (size!48837 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100055)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500071 (= res!1021148 (not (= (select (arr!48287 a!2850) index!625) (select (arr!48287 a!2850) j!87))))))

(declare-fun res!1021152 () Bool)

(assert (=> start!127674 (=> (not res!1021152) (not e!839484))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127674 (= res!1021152 (validMask!0 mask!2661))))

(assert (=> start!127674 e!839484))

(assert (=> start!127674 true))

(declare-fun array_inv!37315 (array!100055) Bool)

(assert (=> start!127674 (array_inv!37315 a!2850)))

(declare-fun b!1500072 () Bool)

(declare-fun res!1021156 () Bool)

(assert (=> b!1500072 (=> (not res!1021156) (not e!839484))))

(declare-datatypes ((List!34779 0))(
  ( (Nil!34776) (Cons!34775 (h!36172 (_ BitVec 64)) (t!49473 List!34779)) )
))
(declare-fun arrayNoDuplicates!0 (array!100055 (_ BitVec 32) List!34779) Bool)

(assert (=> b!1500072 (= res!1021156 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34776))))

(declare-fun b!1500073 () Bool)

(declare-fun res!1021153 () Bool)

(assert (=> b!1500073 (=> (not res!1021153) (not e!839484))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500073 (= res!1021153 (validKeyInArray!0 (select (arr!48287 a!2850) i!996)))))

(declare-fun b!1500074 () Bool)

(declare-fun res!1021149 () Bool)

(assert (=> b!1500074 (=> (not res!1021149) (not e!839484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100055 (_ BitVec 32)) Bool)

(assert (=> b!1500074 (= res!1021149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500075 () Bool)

(declare-fun e!839485 () Bool)

(assert (=> b!1500075 (= e!839485 false)))

(declare-fun lt!652864 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12497 0))(
  ( (MissingZero!12497 (index!52380 (_ BitVec 32))) (Found!12497 (index!52381 (_ BitVec 32))) (Intermediate!12497 (undefined!13309 Bool) (index!52382 (_ BitVec 32)) (x!134059 (_ BitVec 32))) (Undefined!12497) (MissingVacant!12497 (index!52383 (_ BitVec 32))) )
))
(declare-fun lt!652863 () SeekEntryResult!12497)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100055 (_ BitVec 32)) SeekEntryResult!12497)

(assert (=> b!1500075 (= lt!652863 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652864 vacantBefore!10 (select (arr!48287 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500076 () Bool)

(declare-fun res!1021154 () Bool)

(assert (=> b!1500076 (=> (not res!1021154) (not e!839484))))

(assert (=> b!1500076 (= res!1021154 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48287 a!2850) j!87) a!2850 mask!2661) (Found!12497 j!87)))))

(declare-fun b!1500077 () Bool)

(assert (=> b!1500077 (= e!839484 e!839485)))

(declare-fun res!1021150 () Bool)

(assert (=> b!1500077 (=> (not res!1021150) (not e!839485))))

(assert (=> b!1500077 (= res!1021150 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652864 #b00000000000000000000000000000000) (bvslt lt!652864 (size!48837 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500077 (= lt!652864 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500078 () Bool)

(declare-fun res!1021155 () Bool)

(assert (=> b!1500078 (=> (not res!1021155) (not e!839484))))

(assert (=> b!1500078 (= res!1021155 (and (= (size!48837 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48837 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48837 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500079 () Bool)

(declare-fun res!1021151 () Bool)

(assert (=> b!1500079 (=> (not res!1021151) (not e!839484))))

(assert (=> b!1500079 (= res!1021151 (validKeyInArray!0 (select (arr!48287 a!2850) j!87)))))

(declare-fun b!1500080 () Bool)

(declare-fun res!1021147 () Bool)

(assert (=> b!1500080 (=> (not res!1021147) (not e!839484))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500080 (= res!1021147 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48837 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48837 a!2850)) (= (select (arr!48287 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48287 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48837 a!2850))))))

(assert (= (and start!127674 res!1021152) b!1500078))

(assert (= (and b!1500078 res!1021155) b!1500073))

(assert (= (and b!1500073 res!1021153) b!1500079))

(assert (= (and b!1500079 res!1021151) b!1500074))

(assert (= (and b!1500074 res!1021149) b!1500072))

(assert (= (and b!1500072 res!1021156) b!1500080))

(assert (= (and b!1500080 res!1021147) b!1500076))

(assert (= (and b!1500076 res!1021154) b!1500071))

(assert (= (and b!1500071 res!1021148) b!1500077))

(assert (= (and b!1500077 res!1021150) b!1500075))

(declare-fun m!1383265 () Bool)

(assert (=> start!127674 m!1383265))

(declare-fun m!1383267 () Bool)

(assert (=> start!127674 m!1383267))

(declare-fun m!1383269 () Bool)

(assert (=> b!1500071 m!1383269))

(declare-fun m!1383271 () Bool)

(assert (=> b!1500071 m!1383271))

(declare-fun m!1383273 () Bool)

(assert (=> b!1500077 m!1383273))

(declare-fun m!1383275 () Bool)

(assert (=> b!1500072 m!1383275))

(assert (=> b!1500079 m!1383271))

(assert (=> b!1500079 m!1383271))

(declare-fun m!1383277 () Bool)

(assert (=> b!1500079 m!1383277))

(declare-fun m!1383279 () Bool)

(assert (=> b!1500074 m!1383279))

(declare-fun m!1383281 () Bool)

(assert (=> b!1500080 m!1383281))

(declare-fun m!1383283 () Bool)

(assert (=> b!1500080 m!1383283))

(declare-fun m!1383285 () Bool)

(assert (=> b!1500080 m!1383285))

(declare-fun m!1383287 () Bool)

(assert (=> b!1500073 m!1383287))

(assert (=> b!1500073 m!1383287))

(declare-fun m!1383289 () Bool)

(assert (=> b!1500073 m!1383289))

(assert (=> b!1500076 m!1383271))

(assert (=> b!1500076 m!1383271))

(declare-fun m!1383291 () Bool)

(assert (=> b!1500076 m!1383291))

(assert (=> b!1500075 m!1383271))

(assert (=> b!1500075 m!1383271))

(declare-fun m!1383293 () Bool)

(assert (=> b!1500075 m!1383293))

(push 1)

