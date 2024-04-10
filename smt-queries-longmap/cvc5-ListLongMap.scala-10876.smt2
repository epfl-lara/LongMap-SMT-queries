; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127518 () Bool)

(assert start!127518)

(declare-fun b!1498191 () Bool)

(declare-fun res!1019270 () Bool)

(declare-fun e!838932 () Bool)

(assert (=> b!1498191 (=> (not res!1019270) (not e!838932))))

(declare-datatypes ((array!99899 0))(
  ( (array!99900 (arr!48209 (Array (_ BitVec 32) (_ BitVec 64))) (size!48759 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99899)

(declare-datatypes ((List!34701 0))(
  ( (Nil!34698) (Cons!34697 (h!36094 (_ BitVec 64)) (t!49395 List!34701)) )
))
(declare-fun arrayNoDuplicates!0 (array!99899 (_ BitVec 32) List!34701) Bool)

(assert (=> b!1498191 (= res!1019270 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34698))))

(declare-fun b!1498192 () Bool)

(declare-fun res!1019269 () Bool)

(assert (=> b!1498192 (=> (not res!1019269) (not e!838932))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498192 (= res!1019269 (validKeyInArray!0 (select (arr!48209 a!2850) i!996)))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun b!1498193 () Bool)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498193 (= e!838932 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48759 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48759 a!2850)) (= (select (arr!48209 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48209 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48759 a!2850)) (bvsge mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1498194 () Bool)

(declare-fun res!1019271 () Bool)

(assert (=> b!1498194 (=> (not res!1019271) (not e!838932))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498194 (= res!1019271 (validKeyInArray!0 (select (arr!48209 a!2850) j!87)))))

(declare-fun res!1019272 () Bool)

(assert (=> start!127518 (=> (not res!1019272) (not e!838932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127518 (= res!1019272 (validMask!0 mask!2661))))

(assert (=> start!127518 e!838932))

(assert (=> start!127518 true))

(declare-fun array_inv!37237 (array!99899) Bool)

(assert (=> start!127518 (array_inv!37237 a!2850)))

(declare-fun b!1498195 () Bool)

(declare-fun res!1019267 () Bool)

(assert (=> b!1498195 (=> (not res!1019267) (not e!838932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99899 (_ BitVec 32)) Bool)

(assert (=> b!1498195 (= res!1019267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498196 () Bool)

(declare-fun res!1019268 () Bool)

(assert (=> b!1498196 (=> (not res!1019268) (not e!838932))))

(assert (=> b!1498196 (= res!1019268 (and (= (size!48759 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48759 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48759 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127518 res!1019272) b!1498196))

(assert (= (and b!1498196 res!1019268) b!1498192))

(assert (= (and b!1498192 res!1019269) b!1498194))

(assert (= (and b!1498194 res!1019271) b!1498195))

(assert (= (and b!1498195 res!1019267) b!1498191))

(assert (= (and b!1498191 res!1019270) b!1498193))

(declare-fun m!1381267 () Bool)

(assert (=> b!1498195 m!1381267))

(declare-fun m!1381269 () Bool)

(assert (=> b!1498192 m!1381269))

(assert (=> b!1498192 m!1381269))

(declare-fun m!1381271 () Bool)

(assert (=> b!1498192 m!1381271))

(declare-fun m!1381273 () Bool)

(assert (=> b!1498191 m!1381273))

(declare-fun m!1381275 () Bool)

(assert (=> start!127518 m!1381275))

(declare-fun m!1381277 () Bool)

(assert (=> start!127518 m!1381277))

(declare-fun m!1381279 () Bool)

(assert (=> b!1498194 m!1381279))

(assert (=> b!1498194 m!1381279))

(declare-fun m!1381281 () Bool)

(assert (=> b!1498194 m!1381281))

(declare-fun m!1381283 () Bool)

(assert (=> b!1498193 m!1381283))

(declare-fun m!1381285 () Bool)

(assert (=> b!1498193 m!1381285))

(declare-fun m!1381287 () Bool)

(assert (=> b!1498193 m!1381287))

(push 1)

(assert (not start!127518))

(assert (not b!1498194))

(assert (not b!1498192))

(assert (not b!1498191))

(assert (not b!1498195))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

