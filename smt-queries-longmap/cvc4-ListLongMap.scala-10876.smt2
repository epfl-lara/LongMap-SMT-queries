; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127522 () Bool)

(assert start!127522)

(declare-fun b!1498227 () Bool)

(declare-fun res!1019305 () Bool)

(declare-fun e!838944 () Bool)

(assert (=> b!1498227 (=> (not res!1019305) (not e!838944))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99903 0))(
  ( (array!99904 (arr!48211 (Array (_ BitVec 32) (_ BitVec 64))) (size!48761 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99903)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498227 (= res!1019305 (and (= (size!48761 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48761 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48761 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498228 () Bool)

(declare-fun res!1019303 () Bool)

(assert (=> b!1498228 (=> (not res!1019303) (not e!838944))))

(declare-datatypes ((List!34703 0))(
  ( (Nil!34700) (Cons!34699 (h!36096 (_ BitVec 64)) (t!49397 List!34703)) )
))
(declare-fun arrayNoDuplicates!0 (array!99903 (_ BitVec 32) List!34703) Bool)

(assert (=> b!1498228 (= res!1019303 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34700))))

(declare-fun b!1498229 () Bool)

(declare-fun res!1019308 () Bool)

(assert (=> b!1498229 (=> (not res!1019308) (not e!838944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498229 (= res!1019308 (validKeyInArray!0 (select (arr!48211 a!2850) i!996)))))

(declare-fun b!1498230 () Bool)

(declare-fun res!1019304 () Bool)

(assert (=> b!1498230 (=> (not res!1019304) (not e!838944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99903 (_ BitVec 32)) Bool)

(assert (=> b!1498230 (= res!1019304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1019306 () Bool)

(assert (=> start!127522 (=> (not res!1019306) (not e!838944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127522 (= res!1019306 (validMask!0 mask!2661))))

(assert (=> start!127522 e!838944))

(assert (=> start!127522 true))

(declare-fun array_inv!37239 (array!99903) Bool)

(assert (=> start!127522 (array_inv!37239 a!2850)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun b!1498231 () Bool)

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1498231 (= e!838944 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48761 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48761 a!2850)) (= (select (arr!48211 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48211 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48761 a!2850)) (bvsge mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1498232 () Bool)

(declare-fun res!1019307 () Bool)

(assert (=> b!1498232 (=> (not res!1019307) (not e!838944))))

(assert (=> b!1498232 (= res!1019307 (validKeyInArray!0 (select (arr!48211 a!2850) j!87)))))

(assert (= (and start!127522 res!1019306) b!1498227))

(assert (= (and b!1498227 res!1019305) b!1498229))

(assert (= (and b!1498229 res!1019308) b!1498232))

(assert (= (and b!1498232 res!1019307) b!1498230))

(assert (= (and b!1498230 res!1019304) b!1498228))

(assert (= (and b!1498228 res!1019303) b!1498231))

(declare-fun m!1381311 () Bool)

(assert (=> b!1498229 m!1381311))

(assert (=> b!1498229 m!1381311))

(declare-fun m!1381313 () Bool)

(assert (=> b!1498229 m!1381313))

(declare-fun m!1381315 () Bool)

(assert (=> b!1498230 m!1381315))

(declare-fun m!1381317 () Bool)

(assert (=> b!1498232 m!1381317))

(assert (=> b!1498232 m!1381317))

(declare-fun m!1381319 () Bool)

(assert (=> b!1498232 m!1381319))

(declare-fun m!1381321 () Bool)

(assert (=> start!127522 m!1381321))

(declare-fun m!1381323 () Bool)

(assert (=> start!127522 m!1381323))

(declare-fun m!1381325 () Bool)

(assert (=> b!1498231 m!1381325))

(declare-fun m!1381327 () Bool)

(assert (=> b!1498231 m!1381327))

(declare-fun m!1381329 () Bool)

(assert (=> b!1498231 m!1381329))

(declare-fun m!1381331 () Bool)

(assert (=> b!1498228 m!1381331))

(push 1)

(assert (not b!1498228))

(assert (not b!1498230))

(assert (not b!1498232))

(assert (not b!1498229))

(assert (not start!127522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

