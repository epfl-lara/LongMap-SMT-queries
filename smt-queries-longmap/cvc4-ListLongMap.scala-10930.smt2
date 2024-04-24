; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128182 () Bool)

(assert start!128182)

(declare-fun b!1504327 () Bool)

(declare-fun res!1024130 () Bool)

(declare-fun e!841464 () Bool)

(assert (=> b!1504327 (=> (not res!1024130) (not e!841464))))

(declare-datatypes ((array!100344 0))(
  ( (array!100345 (arr!48425 (Array (_ BitVec 32) (_ BitVec 64))) (size!48976 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100344)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504327 (= res!1024130 (validKeyInArray!0 (select (arr!48425 a!2850) i!996)))))

(declare-fun b!1504328 () Bool)

(declare-fun res!1024133 () Bool)

(assert (=> b!1504328 (=> (not res!1024133) (not e!841464))))

(declare-datatypes ((List!34904 0))(
  ( (Nil!34901) (Cons!34900 (h!36312 (_ BitVec 64)) (t!49590 List!34904)) )
))
(declare-fun arrayNoDuplicates!0 (array!100344 (_ BitVec 32) List!34904) Bool)

(assert (=> b!1504328 (= res!1024133 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34901))))

(declare-fun b!1504329 () Bool)

(assert (=> b!1504329 (= e!841464 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12516 0))(
  ( (MissingZero!12516 (index!52456 (_ BitVec 32))) (Found!12516 (index!52457 (_ BitVec 32))) (Intermediate!12516 (undefined!13328 Bool) (index!52458 (_ BitVec 32)) (x!134342 (_ BitVec 32))) (Undefined!12516) (MissingVacant!12516 (index!52459 (_ BitVec 32))) )
))
(declare-fun lt!654051 () SeekEntryResult!12516)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100344 (_ BitVec 32)) SeekEntryResult!12516)

(assert (=> b!1504329 (= lt!654051 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48425 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504331 () Bool)

(declare-fun res!1024136 () Bool)

(assert (=> b!1504331 (=> (not res!1024136) (not e!841464))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504331 (= res!1024136 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48976 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48976 a!2850)) (= (select (arr!48425 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48425 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48976 a!2850))))))

(declare-fun b!1504332 () Bool)

(declare-fun res!1024131 () Bool)

(assert (=> b!1504332 (=> (not res!1024131) (not e!841464))))

(assert (=> b!1504332 (= res!1024131 (and (= (size!48976 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48976 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48976 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504333 () Bool)

(declare-fun res!1024134 () Bool)

(assert (=> b!1504333 (=> (not res!1024134) (not e!841464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100344 (_ BitVec 32)) Bool)

(assert (=> b!1504333 (= res!1024134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1024132 () Bool)

(assert (=> start!128182 (=> (not res!1024132) (not e!841464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128182 (= res!1024132 (validMask!0 mask!2661))))

(assert (=> start!128182 e!841464))

(assert (=> start!128182 true))

(declare-fun array_inv!37706 (array!100344) Bool)

(assert (=> start!128182 (array_inv!37706 a!2850)))

(declare-fun b!1504330 () Bool)

(declare-fun res!1024135 () Bool)

(assert (=> b!1504330 (=> (not res!1024135) (not e!841464))))

(assert (=> b!1504330 (= res!1024135 (validKeyInArray!0 (select (arr!48425 a!2850) j!87)))))

(assert (= (and start!128182 res!1024132) b!1504332))

(assert (= (and b!1504332 res!1024131) b!1504327))

(assert (= (and b!1504327 res!1024130) b!1504330))

(assert (= (and b!1504330 res!1024135) b!1504333))

(assert (= (and b!1504333 res!1024134) b!1504328))

(assert (= (and b!1504328 res!1024133) b!1504331))

(assert (= (and b!1504331 res!1024136) b!1504329))

(declare-fun m!1387545 () Bool)

(assert (=> b!1504331 m!1387545))

(declare-fun m!1387547 () Bool)

(assert (=> b!1504331 m!1387547))

(declare-fun m!1387549 () Bool)

(assert (=> b!1504331 m!1387549))

(declare-fun m!1387551 () Bool)

(assert (=> b!1504333 m!1387551))

(declare-fun m!1387553 () Bool)

(assert (=> b!1504327 m!1387553))

(assert (=> b!1504327 m!1387553))

(declare-fun m!1387555 () Bool)

(assert (=> b!1504327 m!1387555))

(declare-fun m!1387557 () Bool)

(assert (=> start!128182 m!1387557))

(declare-fun m!1387559 () Bool)

(assert (=> start!128182 m!1387559))

(declare-fun m!1387561 () Bool)

(assert (=> b!1504329 m!1387561))

(assert (=> b!1504329 m!1387561))

(declare-fun m!1387563 () Bool)

(assert (=> b!1504329 m!1387563))

(declare-fun m!1387565 () Bool)

(assert (=> b!1504328 m!1387565))

(assert (=> b!1504330 m!1387561))

(assert (=> b!1504330 m!1387561))

(declare-fun m!1387567 () Bool)

(assert (=> b!1504330 m!1387567))

(push 1)

(assert (not start!128182))

(assert (not b!1504333))

(assert (not b!1504327))

(assert (not b!1504329))

(assert (not b!1504328))

(assert (not b!1504330))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

