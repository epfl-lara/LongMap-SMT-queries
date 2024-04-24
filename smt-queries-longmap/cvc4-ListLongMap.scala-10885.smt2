; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127842 () Bool)

(assert start!127842)

(declare-fun b!1500433 () Bool)

(declare-fun res!1020411 () Bool)

(declare-fun e!840159 () Bool)

(assert (=> b!1500433 (=> (not res!1020411) (not e!840159))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100068 0))(
  ( (array!100069 (arr!48290 (Array (_ BitVec 32) (_ BitVec 64))) (size!48841 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100068)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500433 (= res!1020411 (and (= (size!48841 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48841 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48841 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1020412 () Bool)

(assert (=> start!127842 (=> (not res!1020412) (not e!840159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127842 (= res!1020412 (validMask!0 mask!2661))))

(assert (=> start!127842 e!840159))

(assert (=> start!127842 true))

(declare-fun array_inv!37571 (array!100068) Bool)

(assert (=> start!127842 (array_inv!37571 a!2850)))

(declare-fun b!1500434 () Bool)

(declare-fun res!1020410 () Bool)

(assert (=> b!1500434 (=> (not res!1020410) (not e!840159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500434 (= res!1020410 (validKeyInArray!0 (select (arr!48290 a!2850) i!996)))))

(declare-fun b!1500435 () Bool)

(declare-fun res!1020414 () Bool)

(assert (=> b!1500435 (=> (not res!1020414) (not e!840159))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500435 (= res!1020414 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48841 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48841 a!2850)) (= (select (arr!48290 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48290 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48841 a!2850))))))

(declare-fun b!1500436 () Bool)

(assert (=> b!1500436 (= e!840159 false)))

(declare-datatypes ((SeekEntryResult!12393 0))(
  ( (MissingZero!12393 (index!51964 (_ BitVec 32))) (Found!12393 (index!51965 (_ BitVec 32))) (Intermediate!12393 (undefined!13205 Bool) (index!51966 (_ BitVec 32)) (x!133853 (_ BitVec 32))) (Undefined!12393) (MissingVacant!12393 (index!51967 (_ BitVec 32))) )
))
(declare-fun lt!653304 () SeekEntryResult!12393)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100068 (_ BitVec 32)) SeekEntryResult!12393)

(assert (=> b!1500436 (= lt!653304 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48290 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500437 () Bool)

(declare-fun res!1020413 () Bool)

(assert (=> b!1500437 (=> (not res!1020413) (not e!840159))))

(assert (=> b!1500437 (= res!1020413 (validKeyInArray!0 (select (arr!48290 a!2850) j!87)))))

(declare-fun b!1500438 () Bool)

(declare-fun res!1020416 () Bool)

(assert (=> b!1500438 (=> (not res!1020416) (not e!840159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100068 (_ BitVec 32)) Bool)

(assert (=> b!1500438 (= res!1020416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500439 () Bool)

(declare-fun res!1020415 () Bool)

(assert (=> b!1500439 (=> (not res!1020415) (not e!840159))))

(declare-datatypes ((List!34769 0))(
  ( (Nil!34766) (Cons!34765 (h!36177 (_ BitVec 64)) (t!49455 List!34769)) )
))
(declare-fun arrayNoDuplicates!0 (array!100068 (_ BitVec 32) List!34769) Bool)

(assert (=> b!1500439 (= res!1020415 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34766))))

(assert (= (and start!127842 res!1020412) b!1500433))

(assert (= (and b!1500433 res!1020411) b!1500434))

(assert (= (and b!1500434 res!1020410) b!1500437))

(assert (= (and b!1500437 res!1020413) b!1500438))

(assert (= (and b!1500438 res!1020416) b!1500439))

(assert (= (and b!1500439 res!1020415) b!1500435))

(assert (= (and b!1500435 res!1020414) b!1500436))

(declare-fun m!1383593 () Bool)

(assert (=> b!1500439 m!1383593))

(declare-fun m!1383595 () Bool)

(assert (=> b!1500437 m!1383595))

(assert (=> b!1500437 m!1383595))

(declare-fun m!1383597 () Bool)

(assert (=> b!1500437 m!1383597))

(declare-fun m!1383599 () Bool)

(assert (=> b!1500438 m!1383599))

(declare-fun m!1383601 () Bool)

(assert (=> b!1500435 m!1383601))

(declare-fun m!1383603 () Bool)

(assert (=> b!1500435 m!1383603))

(declare-fun m!1383605 () Bool)

(assert (=> b!1500435 m!1383605))

(declare-fun m!1383607 () Bool)

(assert (=> b!1500434 m!1383607))

(assert (=> b!1500434 m!1383607))

(declare-fun m!1383609 () Bool)

(assert (=> b!1500434 m!1383609))

(declare-fun m!1383611 () Bool)

(assert (=> start!127842 m!1383611))

(declare-fun m!1383613 () Bool)

(assert (=> start!127842 m!1383613))

(assert (=> b!1500436 m!1383595))

(assert (=> b!1500436 m!1383595))

(declare-fun m!1383615 () Bool)

(assert (=> b!1500436 m!1383615))

(push 1)

(assert (not b!1500434))

(assert (not start!127842))

(assert (not b!1500436))

(assert (not b!1500437))

(assert (not b!1500439))

(assert (not b!1500438))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

