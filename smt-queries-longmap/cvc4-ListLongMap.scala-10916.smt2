; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127762 () Bool)

(assert start!127762)

(declare-fun b!1501435 () Bool)

(declare-fun res!1022520 () Bool)

(declare-fun e!839924 () Bool)

(assert (=> b!1501435 (=> (not res!1022520) (not e!839924))))

(declare-datatypes ((array!100143 0))(
  ( (array!100144 (arr!48331 (Array (_ BitVec 32) (_ BitVec 64))) (size!48881 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100143)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501435 (= res!1022520 (not (= (select (arr!48331 a!2850) index!625) (select (arr!48331 a!2850) j!87))))))

(declare-fun b!1501436 () Bool)

(declare-fun res!1022516 () Bool)

(declare-fun e!839923 () Bool)

(assert (=> b!1501436 (=> (not res!1022516) (not e!839923))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100143 (_ BitVec 32)) Bool)

(assert (=> b!1501436 (= res!1022516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501437 () Bool)

(declare-fun res!1022511 () Bool)

(assert (=> b!1501437 (=> (not res!1022511) (not e!839923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501437 (= res!1022511 (validKeyInArray!0 (select (arr!48331 a!2850) j!87)))))

(declare-fun b!1501438 () Bool)

(declare-fun res!1022513 () Bool)

(assert (=> b!1501438 (=> (not res!1022513) (not e!839923))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501438 (= res!1022513 (and (= (size!48881 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48881 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48881 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501439 () Bool)

(declare-fun res!1022521 () Bool)

(declare-fun e!839926 () Bool)

(assert (=> b!1501439 (=> (not res!1022521) (not e!839926))))

(declare-datatypes ((SeekEntryResult!12541 0))(
  ( (MissingZero!12541 (index!52556 (_ BitVec 32))) (Found!12541 (index!52557 (_ BitVec 32))) (Intermediate!12541 (undefined!13353 Bool) (index!52558 (_ BitVec 32)) (x!134215 (_ BitVec 32))) (Undefined!12541) (MissingVacant!12541 (index!52559 (_ BitVec 32))) )
))
(declare-fun lt!653172 () SeekEntryResult!12541)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653173 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100143 (_ BitVec 32)) SeekEntryResult!12541)

(assert (=> b!1501439 (= res!1022521 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653173 vacantBefore!10 (select (arr!48331 a!2850) j!87) a!2850 mask!2661) lt!653172))))

(declare-fun b!1501440 () Bool)

(assert (=> b!1501440 (= e!839923 e!839924)))

(declare-fun res!1022515 () Bool)

(assert (=> b!1501440 (=> (not res!1022515) (not e!839924))))

(assert (=> b!1501440 (= res!1022515 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48331 a!2850) j!87) a!2850 mask!2661) lt!653172))))

(assert (=> b!1501440 (= lt!653172 (Found!12541 j!87))))

(declare-fun b!1501441 () Bool)

(assert (=> b!1501441 (= e!839924 e!839926)))

(declare-fun res!1022514 () Bool)

(assert (=> b!1501441 (=> (not res!1022514) (not e!839926))))

(assert (=> b!1501441 (= res!1022514 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653173 #b00000000000000000000000000000000) (bvslt lt!653173 (size!48881 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501441 (= lt!653173 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501442 () Bool)

(assert (=> b!1501442 (= e!839926 (not true))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501442 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653173 vacantAfter!10 (select (store (arr!48331 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100144 (store (arr!48331 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48881 a!2850)) mask!2661) lt!653172)))

(declare-datatypes ((Unit!50236 0))(
  ( (Unit!50237) )
))
(declare-fun lt!653171 () Unit!50236)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50236)

(assert (=> b!1501442 (= lt!653171 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653173 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501443 () Bool)

(declare-fun res!1022519 () Bool)

(assert (=> b!1501443 (=> (not res!1022519) (not e!839923))))

(assert (=> b!1501443 (= res!1022519 (validKeyInArray!0 (select (arr!48331 a!2850) i!996)))))

(declare-fun b!1501444 () Bool)

(declare-fun res!1022517 () Bool)

(assert (=> b!1501444 (=> (not res!1022517) (not e!839923))))

(assert (=> b!1501444 (= res!1022517 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48881 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48881 a!2850)) (= (select (arr!48331 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48331 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48881 a!2850))))))

(declare-fun b!1501445 () Bool)

(declare-fun res!1022518 () Bool)

(assert (=> b!1501445 (=> (not res!1022518) (not e!839923))))

(declare-datatypes ((List!34823 0))(
  ( (Nil!34820) (Cons!34819 (h!36216 (_ BitVec 64)) (t!49517 List!34823)) )
))
(declare-fun arrayNoDuplicates!0 (array!100143 (_ BitVec 32) List!34823) Bool)

(assert (=> b!1501445 (= res!1022518 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34820))))

(declare-fun res!1022512 () Bool)

(assert (=> start!127762 (=> (not res!1022512) (not e!839923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127762 (= res!1022512 (validMask!0 mask!2661))))

(assert (=> start!127762 e!839923))

(assert (=> start!127762 true))

(declare-fun array_inv!37359 (array!100143) Bool)

(assert (=> start!127762 (array_inv!37359 a!2850)))

(assert (= (and start!127762 res!1022512) b!1501438))

(assert (= (and b!1501438 res!1022513) b!1501443))

(assert (= (and b!1501443 res!1022519) b!1501437))

(assert (= (and b!1501437 res!1022511) b!1501436))

(assert (= (and b!1501436 res!1022516) b!1501445))

(assert (= (and b!1501445 res!1022518) b!1501444))

(assert (= (and b!1501444 res!1022517) b!1501440))

(assert (= (and b!1501440 res!1022515) b!1501435))

(assert (= (and b!1501435 res!1022520) b!1501441))

(assert (= (and b!1501441 res!1022514) b!1501439))

(assert (= (and b!1501439 res!1022521) b!1501442))

(declare-fun m!1384669 () Bool)

(assert (=> b!1501444 m!1384669))

(declare-fun m!1384671 () Bool)

(assert (=> b!1501444 m!1384671))

(declare-fun m!1384673 () Bool)

(assert (=> b!1501444 m!1384673))

(assert (=> b!1501442 m!1384671))

(declare-fun m!1384675 () Bool)

(assert (=> b!1501442 m!1384675))

(assert (=> b!1501442 m!1384675))

(declare-fun m!1384677 () Bool)

(assert (=> b!1501442 m!1384677))

(declare-fun m!1384679 () Bool)

(assert (=> b!1501442 m!1384679))

(declare-fun m!1384681 () Bool)

(assert (=> b!1501445 m!1384681))

(declare-fun m!1384683 () Bool)

(assert (=> b!1501436 m!1384683))

(declare-fun m!1384685 () Bool)

(assert (=> start!127762 m!1384685))

(declare-fun m!1384687 () Bool)

(assert (=> start!127762 m!1384687))

(declare-fun m!1384689 () Bool)

(assert (=> b!1501439 m!1384689))

(assert (=> b!1501439 m!1384689))

(declare-fun m!1384691 () Bool)

(assert (=> b!1501439 m!1384691))

(declare-fun m!1384693 () Bool)

(assert (=> b!1501443 m!1384693))

(assert (=> b!1501443 m!1384693))

(declare-fun m!1384695 () Bool)

(assert (=> b!1501443 m!1384695))

(assert (=> b!1501437 m!1384689))

(assert (=> b!1501437 m!1384689))

(declare-fun m!1384697 () Bool)

(assert (=> b!1501437 m!1384697))

(assert (=> b!1501440 m!1384689))

(assert (=> b!1501440 m!1384689))

(declare-fun m!1384699 () Bool)

(assert (=> b!1501440 m!1384699))

(declare-fun m!1384701 () Bool)

(assert (=> b!1501441 m!1384701))

(declare-fun m!1384703 () Bool)

(assert (=> b!1501435 m!1384703))

(assert (=> b!1501435 m!1384689))

(push 1)

(assert (not b!1501441))

(assert (not b!1501439))

(assert (not b!1501442))

(assert (not start!127762))

