; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127612 () Bool)

(assert start!127612)

(declare-fun b!1499170 () Bool)

(declare-fun res!1020249 () Bool)

(declare-fun e!839214 () Bool)

(assert (=> b!1499170 (=> (not res!1020249) (not e!839214))))

(declare-datatypes ((array!99993 0))(
  ( (array!99994 (arr!48256 (Array (_ BitVec 32) (_ BitVec 64))) (size!48806 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99993)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499170 (= res!1020249 (validKeyInArray!0 (select (arr!48256 a!2850) j!87)))))

(declare-fun b!1499171 () Bool)

(declare-fun res!1020253 () Bool)

(assert (=> b!1499171 (=> (not res!1020253) (not e!839214))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99993 (_ BitVec 32)) Bool)

(assert (=> b!1499171 (= res!1020253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499173 () Bool)

(declare-fun res!1020252 () Bool)

(assert (=> b!1499173 (=> (not res!1020252) (not e!839214))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12466 0))(
  ( (MissingZero!12466 (index!52256 (_ BitVec 32))) (Found!12466 (index!52257 (_ BitVec 32))) (Intermediate!12466 (undefined!13278 Bool) (index!52258 (_ BitVec 32)) (x!133940 (_ BitVec 32))) (Undefined!12466) (MissingVacant!12466 (index!52259 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99993 (_ BitVec 32)) SeekEntryResult!12466)

(assert (=> b!1499173 (= res!1020252 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48256 a!2850) j!87) a!2850 mask!2661) (Found!12466 j!87)))))

(declare-fun b!1499174 () Bool)

(declare-fun res!1020247 () Bool)

(assert (=> b!1499174 (=> (not res!1020247) (not e!839214))))

(declare-datatypes ((List!34748 0))(
  ( (Nil!34745) (Cons!34744 (h!36141 (_ BitVec 64)) (t!49442 List!34748)) )
))
(declare-fun arrayNoDuplicates!0 (array!99993 (_ BitVec 32) List!34748) Bool)

(assert (=> b!1499174 (= res!1020247 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34745))))

(declare-fun b!1499175 () Bool)

(declare-fun res!1020251 () Bool)

(assert (=> b!1499175 (=> (not res!1020251) (not e!839214))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499175 (= res!1020251 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48806 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48806 a!2850)) (= (select (arr!48256 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48256 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48806 a!2850))))))

(declare-fun b!1499176 () Bool)

(declare-fun res!1020248 () Bool)

(assert (=> b!1499176 (=> (not res!1020248) (not e!839214))))

(assert (=> b!1499176 (= res!1020248 (and (= (size!48806 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48806 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48806 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499177 () Bool)

(assert (=> b!1499177 (= e!839214 (and (not (= (select (arr!48256 a!2850) index!625) (select (arr!48256 a!2850) j!87))) (bvsge mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun res!1020250 () Bool)

(assert (=> start!127612 (=> (not res!1020250) (not e!839214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127612 (= res!1020250 (validMask!0 mask!2661))))

(assert (=> start!127612 e!839214))

(assert (=> start!127612 true))

(declare-fun array_inv!37284 (array!99993) Bool)

(assert (=> start!127612 (array_inv!37284 a!2850)))

(declare-fun b!1499172 () Bool)

(declare-fun res!1020246 () Bool)

(assert (=> b!1499172 (=> (not res!1020246) (not e!839214))))

(assert (=> b!1499172 (= res!1020246 (validKeyInArray!0 (select (arr!48256 a!2850) i!996)))))

(assert (= (and start!127612 res!1020250) b!1499176))

(assert (= (and b!1499176 res!1020248) b!1499172))

(assert (= (and b!1499172 res!1020246) b!1499170))

(assert (= (and b!1499170 res!1020249) b!1499171))

(assert (= (and b!1499171 res!1020253) b!1499174))

(assert (= (and b!1499174 res!1020247) b!1499175))

(assert (= (and b!1499175 res!1020251) b!1499173))

(assert (= (and b!1499173 res!1020252) b!1499177))

(declare-fun m!1382357 () Bool)

(assert (=> b!1499170 m!1382357))

(assert (=> b!1499170 m!1382357))

(declare-fun m!1382359 () Bool)

(assert (=> b!1499170 m!1382359))

(assert (=> b!1499173 m!1382357))

(assert (=> b!1499173 m!1382357))

(declare-fun m!1382361 () Bool)

(assert (=> b!1499173 m!1382361))

(declare-fun m!1382363 () Bool)

(assert (=> b!1499172 m!1382363))

(assert (=> b!1499172 m!1382363))

(declare-fun m!1382365 () Bool)

(assert (=> b!1499172 m!1382365))

(declare-fun m!1382367 () Bool)

(assert (=> b!1499174 m!1382367))

(declare-fun m!1382369 () Bool)

(assert (=> start!127612 m!1382369))

(declare-fun m!1382371 () Bool)

(assert (=> start!127612 m!1382371))

(declare-fun m!1382373 () Bool)

(assert (=> b!1499175 m!1382373))

(declare-fun m!1382375 () Bool)

(assert (=> b!1499175 m!1382375))

(declare-fun m!1382377 () Bool)

(assert (=> b!1499175 m!1382377))

(declare-fun m!1382379 () Bool)

(assert (=> b!1499177 m!1382379))

(assert (=> b!1499177 m!1382357))

(declare-fun m!1382381 () Bool)

(assert (=> b!1499171 m!1382381))

(push 1)

(assert (not b!1499172))

(assert (not b!1499171))

(assert (not b!1499170))

(assert (not b!1499174))

(assert (not start!127612))

(assert (not b!1499173))

(check-sat)

(pop 1)

(push 1)

(check-sat)

