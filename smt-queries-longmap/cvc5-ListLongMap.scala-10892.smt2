; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127614 () Bool)

(assert start!127614)

(declare-fun b!1499192 () Bool)

(declare-fun res!1020273 () Bool)

(declare-fun e!839221 () Bool)

(assert (=> b!1499192 (=> (not res!1020273) (not e!839221))))

(declare-datatypes ((array!99995 0))(
  ( (array!99996 (arr!48257 (Array (_ BitVec 32) (_ BitVec 64))) (size!48807 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99995)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499192 (= res!1020273 (validKeyInArray!0 (select (arr!48257 a!2850) j!87)))))

(declare-fun b!1499193 () Bool)

(assert (=> b!1499193 (= e!839221 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12467 0))(
  ( (MissingZero!12467 (index!52260 (_ BitVec 32))) (Found!12467 (index!52261 (_ BitVec 32))) (Intermediate!12467 (undefined!13279 Bool) (index!52262 (_ BitVec 32)) (x!133949 (_ BitVec 32))) (Undefined!12467) (MissingVacant!12467 (index!52263 (_ BitVec 32))) )
))
(declare-fun lt!652690 () SeekEntryResult!12467)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99995 (_ BitVec 32)) SeekEntryResult!12467)

(assert (=> b!1499193 (= lt!652690 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48257 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1020274 () Bool)

(assert (=> start!127614 (=> (not res!1020274) (not e!839221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127614 (= res!1020274 (validMask!0 mask!2661))))

(assert (=> start!127614 e!839221))

(assert (=> start!127614 true))

(declare-fun array_inv!37285 (array!99995) Bool)

(assert (=> start!127614 (array_inv!37285 a!2850)))

(declare-fun b!1499194 () Bool)

(declare-fun res!1020269 () Bool)

(assert (=> b!1499194 (=> (not res!1020269) (not e!839221))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499194 (= res!1020269 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48807 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48807 a!2850)) (= (select (arr!48257 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48257 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48807 a!2850))))))

(declare-fun b!1499195 () Bool)

(declare-fun res!1020268 () Bool)

(assert (=> b!1499195 (=> (not res!1020268) (not e!839221))))

(declare-datatypes ((List!34749 0))(
  ( (Nil!34746) (Cons!34745 (h!36142 (_ BitVec 64)) (t!49443 List!34749)) )
))
(declare-fun arrayNoDuplicates!0 (array!99995 (_ BitVec 32) List!34749) Bool)

(assert (=> b!1499195 (= res!1020268 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34746))))

(declare-fun b!1499196 () Bool)

(declare-fun res!1020272 () Bool)

(assert (=> b!1499196 (=> (not res!1020272) (not e!839221))))

(assert (=> b!1499196 (= res!1020272 (validKeyInArray!0 (select (arr!48257 a!2850) i!996)))))

(declare-fun b!1499197 () Bool)

(declare-fun res!1020270 () Bool)

(assert (=> b!1499197 (=> (not res!1020270) (not e!839221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99995 (_ BitVec 32)) Bool)

(assert (=> b!1499197 (= res!1020270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499198 () Bool)

(declare-fun res!1020271 () Bool)

(assert (=> b!1499198 (=> (not res!1020271) (not e!839221))))

(assert (=> b!1499198 (= res!1020271 (and (= (size!48807 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48807 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48807 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127614 res!1020274) b!1499198))

(assert (= (and b!1499198 res!1020271) b!1499196))

(assert (= (and b!1499196 res!1020272) b!1499192))

(assert (= (and b!1499192 res!1020273) b!1499197))

(assert (= (and b!1499197 res!1020270) b!1499195))

(assert (= (and b!1499195 res!1020268) b!1499194))

(assert (= (and b!1499194 res!1020269) b!1499193))

(declare-fun m!1382383 () Bool)

(assert (=> start!127614 m!1382383))

(declare-fun m!1382385 () Bool)

(assert (=> start!127614 m!1382385))

(declare-fun m!1382387 () Bool)

(assert (=> b!1499194 m!1382387))

(declare-fun m!1382389 () Bool)

(assert (=> b!1499194 m!1382389))

(declare-fun m!1382391 () Bool)

(assert (=> b!1499194 m!1382391))

(declare-fun m!1382393 () Bool)

(assert (=> b!1499195 m!1382393))

(declare-fun m!1382395 () Bool)

(assert (=> b!1499193 m!1382395))

(assert (=> b!1499193 m!1382395))

(declare-fun m!1382397 () Bool)

(assert (=> b!1499193 m!1382397))

(declare-fun m!1382399 () Bool)

(assert (=> b!1499197 m!1382399))

(assert (=> b!1499192 m!1382395))

(assert (=> b!1499192 m!1382395))

(declare-fun m!1382401 () Bool)

(assert (=> b!1499192 m!1382401))

(declare-fun m!1382403 () Bool)

(assert (=> b!1499196 m!1382403))

(assert (=> b!1499196 m!1382403))

(declare-fun m!1382405 () Bool)

(assert (=> b!1499196 m!1382405))

(push 1)

(assert (not b!1499192))

(assert (not start!127614))

(assert (not b!1499193))

(assert (not b!1499197))

(assert (not b!1499196))

(assert (not b!1499195))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

