; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127872 () Bool)

(assert start!127872)

(declare-fun b!1502405 () Bool)

(declare-fun res!1023396 () Bool)

(declare-fun e!840300 () Bool)

(assert (=> b!1502405 (=> (not res!1023396) (not e!840300))))

(declare-datatypes ((array!100220 0))(
  ( (array!100221 (arr!48368 (Array (_ BitVec 32) (_ BitVec 64))) (size!48918 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100220)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100220 (_ BitVec 32)) Bool)

(assert (=> b!1502405 (= res!1023396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502406 () Bool)

(declare-fun res!1023391 () Bool)

(assert (=> b!1502406 (=> (not res!1023391) (not e!840300))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502406 (= res!1023391 (validKeyInArray!0 (select (arr!48368 a!2850) j!87)))))

(declare-fun res!1023394 () Bool)

(assert (=> start!127872 (=> (not res!1023394) (not e!840300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127872 (= res!1023394 (validMask!0 mask!2661))))

(assert (=> start!127872 e!840300))

(assert (=> start!127872 true))

(declare-fun array_inv!37396 (array!100220) Bool)

(assert (=> start!127872 (array_inv!37396 a!2850)))

(declare-fun b!1502407 () Bool)

(assert (=> b!1502407 (= e!840300 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12566 0))(
  ( (MissingZero!12566 (index!52656 (_ BitVec 32))) (Found!12566 (index!52657 (_ BitVec 32))) (Intermediate!12566 (undefined!13378 Bool) (index!52658 (_ BitVec 32)) (x!134347 (_ BitVec 32))) (Undefined!12566) (MissingVacant!12566 (index!52659 (_ BitVec 32))) )
))
(declare-fun lt!653374 () SeekEntryResult!12566)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100220 (_ BitVec 32)) SeekEntryResult!12566)

(assert (=> b!1502407 (= lt!653374 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48368 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502408 () Bool)

(declare-fun res!1023395 () Bool)

(assert (=> b!1502408 (=> (not res!1023395) (not e!840300))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502408 (= res!1023395 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48918 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48918 a!2850)) (= (select (arr!48368 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48368 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48918 a!2850))))))

(declare-fun b!1502409 () Bool)

(declare-fun res!1023392 () Bool)

(assert (=> b!1502409 (=> (not res!1023392) (not e!840300))))

(declare-datatypes ((List!34860 0))(
  ( (Nil!34857) (Cons!34856 (h!36253 (_ BitVec 64)) (t!49554 List!34860)) )
))
(declare-fun arrayNoDuplicates!0 (array!100220 (_ BitVec 32) List!34860) Bool)

(assert (=> b!1502409 (= res!1023392 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34857))))

(declare-fun b!1502410 () Bool)

(declare-fun res!1023393 () Bool)

(assert (=> b!1502410 (=> (not res!1023393) (not e!840300))))

(assert (=> b!1502410 (= res!1023393 (validKeyInArray!0 (select (arr!48368 a!2850) i!996)))))

(declare-fun b!1502411 () Bool)

(declare-fun res!1023397 () Bool)

(assert (=> b!1502411 (=> (not res!1023397) (not e!840300))))

(assert (=> b!1502411 (= res!1023397 (and (= (size!48918 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48918 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48918 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127872 res!1023394) b!1502411))

(assert (= (and b!1502411 res!1023397) b!1502410))

(assert (= (and b!1502410 res!1023393) b!1502406))

(assert (= (and b!1502406 res!1023391) b!1502405))

(assert (= (and b!1502405 res!1023396) b!1502409))

(assert (= (and b!1502409 res!1023392) b!1502408))

(assert (= (and b!1502408 res!1023395) b!1502407))

(declare-fun m!1385665 () Bool)

(assert (=> b!1502405 m!1385665))

(declare-fun m!1385667 () Bool)

(assert (=> b!1502409 m!1385667))

(declare-fun m!1385669 () Bool)

(assert (=> b!1502406 m!1385669))

(assert (=> b!1502406 m!1385669))

(declare-fun m!1385671 () Bool)

(assert (=> b!1502406 m!1385671))

(declare-fun m!1385673 () Bool)

(assert (=> b!1502408 m!1385673))

(declare-fun m!1385675 () Bool)

(assert (=> b!1502408 m!1385675))

(declare-fun m!1385677 () Bool)

(assert (=> b!1502408 m!1385677))

(declare-fun m!1385679 () Bool)

(assert (=> start!127872 m!1385679))

(declare-fun m!1385681 () Bool)

(assert (=> start!127872 m!1385681))

(declare-fun m!1385683 () Bool)

(assert (=> b!1502410 m!1385683))

(assert (=> b!1502410 m!1385683))

(declare-fun m!1385685 () Bool)

(assert (=> b!1502410 m!1385685))

(assert (=> b!1502407 m!1385669))

(assert (=> b!1502407 m!1385669))

(declare-fun m!1385687 () Bool)

(assert (=> b!1502407 m!1385687))

(push 1)

(assert (not b!1502409))

(assert (not b!1502410))

(assert (not b!1502406))

(assert (not b!1502405))

(assert (not b!1502407))

(assert (not start!127872))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

