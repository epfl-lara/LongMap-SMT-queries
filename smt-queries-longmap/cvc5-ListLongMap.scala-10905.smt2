; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127692 () Bool)

(assert start!127692)

(declare-fun b!1500341 () Bool)

(declare-fun res!1021426 () Bool)

(declare-fun e!839566 () Bool)

(assert (=> b!1500341 (=> (not res!1021426) (not e!839566))))

(declare-datatypes ((array!100073 0))(
  ( (array!100074 (arr!48296 (Array (_ BitVec 32) (_ BitVec 64))) (size!48846 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100073)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100073 (_ BitVec 32)) Bool)

(assert (=> b!1500341 (= res!1021426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500342 () Bool)

(declare-fun res!1021424 () Bool)

(assert (=> b!1500342 (=> (not res!1021424) (not e!839566))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500342 (= res!1021424 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48846 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48846 a!2850)) (= (select (arr!48296 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48296 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48846 a!2850))))))

(declare-fun b!1500343 () Bool)

(declare-fun e!839565 () Bool)

(assert (=> b!1500343 (= e!839566 e!839565)))

(declare-fun res!1021419 () Bool)

(assert (=> b!1500343 (=> (not res!1021419) (not e!839565))))

(declare-fun lt!652917 () (_ BitVec 32))

(assert (=> b!1500343 (= res!1021419 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652917 #b00000000000000000000000000000000) (bvslt lt!652917 (size!48846 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500343 (= lt!652917 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500345 () Bool)

(declare-fun res!1021418 () Bool)

(assert (=> b!1500345 (=> (not res!1021418) (not e!839566))))

(declare-datatypes ((List!34788 0))(
  ( (Nil!34785) (Cons!34784 (h!36181 (_ BitVec 64)) (t!49482 List!34788)) )
))
(declare-fun arrayNoDuplicates!0 (array!100073 (_ BitVec 32) List!34788) Bool)

(assert (=> b!1500345 (= res!1021418 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34785))))

(declare-fun b!1500346 () Bool)

(declare-fun res!1021417 () Bool)

(assert (=> b!1500346 (=> (not res!1021417) (not e!839566))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500346 (= res!1021417 (validKeyInArray!0 (select (arr!48296 a!2850) j!87)))))

(declare-fun b!1500347 () Bool)

(assert (=> b!1500347 (= e!839565 false)))

(declare-datatypes ((SeekEntryResult!12506 0))(
  ( (MissingZero!12506 (index!52416 (_ BitVec 32))) (Found!12506 (index!52417 (_ BitVec 32))) (Intermediate!12506 (undefined!13318 Bool) (index!52418 (_ BitVec 32)) (x!134092 (_ BitVec 32))) (Undefined!12506) (MissingVacant!12506 (index!52419 (_ BitVec 32))) )
))
(declare-fun lt!652918 () SeekEntryResult!12506)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100073 (_ BitVec 32)) SeekEntryResult!12506)

(assert (=> b!1500347 (= lt!652918 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652917 vacantBefore!10 (select (arr!48296 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500348 () Bool)

(declare-fun res!1021423 () Bool)

(assert (=> b!1500348 (=> (not res!1021423) (not e!839566))))

(assert (=> b!1500348 (= res!1021423 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48296 a!2850) j!87) a!2850 mask!2661) (Found!12506 j!87)))))

(declare-fun res!1021422 () Bool)

(assert (=> start!127692 (=> (not res!1021422) (not e!839566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127692 (= res!1021422 (validMask!0 mask!2661))))

(assert (=> start!127692 e!839566))

(assert (=> start!127692 true))

(declare-fun array_inv!37324 (array!100073) Bool)

(assert (=> start!127692 (array_inv!37324 a!2850)))

(declare-fun b!1500344 () Bool)

(declare-fun res!1021420 () Bool)

(assert (=> b!1500344 (=> (not res!1021420) (not e!839566))))

(assert (=> b!1500344 (= res!1021420 (and (= (size!48846 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48846 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48846 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500349 () Bool)

(declare-fun res!1021425 () Bool)

(assert (=> b!1500349 (=> (not res!1021425) (not e!839566))))

(assert (=> b!1500349 (= res!1021425 (not (= (select (arr!48296 a!2850) index!625) (select (arr!48296 a!2850) j!87))))))

(declare-fun b!1500350 () Bool)

(declare-fun res!1021421 () Bool)

(assert (=> b!1500350 (=> (not res!1021421) (not e!839566))))

(assert (=> b!1500350 (= res!1021421 (validKeyInArray!0 (select (arr!48296 a!2850) i!996)))))

(assert (= (and start!127692 res!1021422) b!1500344))

(assert (= (and b!1500344 res!1021420) b!1500350))

(assert (= (and b!1500350 res!1021421) b!1500346))

(assert (= (and b!1500346 res!1021417) b!1500341))

(assert (= (and b!1500341 res!1021426) b!1500345))

(assert (= (and b!1500345 res!1021418) b!1500342))

(assert (= (and b!1500342 res!1021424) b!1500348))

(assert (= (and b!1500348 res!1021423) b!1500349))

(assert (= (and b!1500349 res!1021425) b!1500343))

(assert (= (and b!1500343 res!1021419) b!1500347))

(declare-fun m!1383535 () Bool)

(assert (=> b!1500342 m!1383535))

(declare-fun m!1383537 () Bool)

(assert (=> b!1500342 m!1383537))

(declare-fun m!1383539 () Bool)

(assert (=> b!1500342 m!1383539))

(declare-fun m!1383541 () Bool)

(assert (=> b!1500343 m!1383541))

(declare-fun m!1383543 () Bool)

(assert (=> start!127692 m!1383543))

(declare-fun m!1383545 () Bool)

(assert (=> start!127692 m!1383545))

(declare-fun m!1383547 () Bool)

(assert (=> b!1500345 m!1383547))

(declare-fun m!1383549 () Bool)

(assert (=> b!1500346 m!1383549))

(assert (=> b!1500346 m!1383549))

(declare-fun m!1383551 () Bool)

(assert (=> b!1500346 m!1383551))

(declare-fun m!1383553 () Bool)

(assert (=> b!1500350 m!1383553))

(assert (=> b!1500350 m!1383553))

(declare-fun m!1383555 () Bool)

(assert (=> b!1500350 m!1383555))

(assert (=> b!1500348 m!1383549))

(assert (=> b!1500348 m!1383549))

(declare-fun m!1383557 () Bool)

(assert (=> b!1500348 m!1383557))

(declare-fun m!1383559 () Bool)

(assert (=> b!1500349 m!1383559))

(assert (=> b!1500349 m!1383549))

(assert (=> b!1500347 m!1383549))

(assert (=> b!1500347 m!1383549))

(declare-fun m!1383561 () Bool)

(assert (=> b!1500347 m!1383561))

(declare-fun m!1383563 () Bool)

(assert (=> b!1500341 m!1383563))

(push 1)

