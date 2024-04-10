; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127982 () Bool)

(assert start!127982)

(declare-fun b!1503525 () Bool)

(declare-fun res!1024403 () Bool)

(declare-fun e!840630 () Bool)

(assert (=> b!1503525 (=> (not res!1024403) (not e!840630))))

(declare-datatypes ((array!100297 0))(
  ( (array!100298 (arr!48405 (Array (_ BitVec 32) (_ BitVec 64))) (size!48955 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100297)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503525 (= res!1024403 (validKeyInArray!0 (select (arr!48405 a!2850) i!996)))))

(declare-fun b!1503526 () Bool)

(declare-fun res!1024406 () Bool)

(assert (=> b!1503526 (=> (not res!1024406) (not e!840630))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503526 (= res!1024406 (not (= (select (arr!48405 a!2850) index!625) (select (arr!48405 a!2850) j!87))))))

(declare-fun b!1503527 () Bool)

(declare-fun res!1024404 () Bool)

(assert (=> b!1503527 (=> (not res!1024404) (not e!840630))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100297 (_ BitVec 32)) Bool)

(assert (=> b!1503527 (= res!1024404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503529 () Bool)

(assert (=> b!1503529 (= e!840630 false)))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653536 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503529 (= lt!653536 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1024410 () Bool)

(assert (=> start!127982 (=> (not res!1024410) (not e!840630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127982 (= res!1024410 (validMask!0 mask!2661))))

(assert (=> start!127982 e!840630))

(assert (=> start!127982 true))

(declare-fun array_inv!37433 (array!100297) Bool)

(assert (=> start!127982 (array_inv!37433 a!2850)))

(declare-fun b!1503528 () Bool)

(declare-fun res!1024409 () Bool)

(assert (=> b!1503528 (=> (not res!1024409) (not e!840630))))

(declare-datatypes ((List!34897 0))(
  ( (Nil!34894) (Cons!34893 (h!36290 (_ BitVec 64)) (t!49591 List!34897)) )
))
(declare-fun arrayNoDuplicates!0 (array!100297 (_ BitVec 32) List!34897) Bool)

(assert (=> b!1503528 (= res!1024409 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34894))))

(declare-fun b!1503530 () Bool)

(declare-fun res!1024405 () Bool)

(assert (=> b!1503530 (=> (not res!1024405) (not e!840630))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503530 (= res!1024405 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48955 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48955 a!2850)) (= (select (arr!48405 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48405 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48955 a!2850))))))

(declare-fun b!1503531 () Bool)

(declare-fun res!1024407 () Bool)

(assert (=> b!1503531 (=> (not res!1024407) (not e!840630))))

(assert (=> b!1503531 (= res!1024407 (and (= (size!48955 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48955 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48955 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503532 () Bool)

(declare-fun res!1024411 () Bool)

(assert (=> b!1503532 (=> (not res!1024411) (not e!840630))))

(assert (=> b!1503532 (= res!1024411 (validKeyInArray!0 (select (arr!48405 a!2850) j!87)))))

(declare-fun b!1503533 () Bool)

(declare-fun res!1024408 () Bool)

(assert (=> b!1503533 (=> (not res!1024408) (not e!840630))))

(declare-datatypes ((SeekEntryResult!12603 0))(
  ( (MissingZero!12603 (index!52804 (_ BitVec 32))) (Found!12603 (index!52805 (_ BitVec 32))) (Intermediate!12603 (undefined!13415 Bool) (index!52806 (_ BitVec 32)) (x!134483 (_ BitVec 32))) (Undefined!12603) (MissingVacant!12603 (index!52807 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100297 (_ BitVec 32)) SeekEntryResult!12603)

(assert (=> b!1503533 (= res!1024408 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48405 a!2850) j!87) a!2850 mask!2661) (Found!12603 j!87)))))

(assert (= (and start!127982 res!1024410) b!1503531))

(assert (= (and b!1503531 res!1024407) b!1503525))

(assert (= (and b!1503525 res!1024403) b!1503532))

(assert (= (and b!1503532 res!1024411) b!1503527))

(assert (= (and b!1503527 res!1024404) b!1503528))

(assert (= (and b!1503528 res!1024409) b!1503530))

(assert (= (and b!1503530 res!1024405) b!1503533))

(assert (= (and b!1503533 res!1024408) b!1503526))

(assert (= (and b!1503526 res!1024406) b!1503529))

(declare-fun m!1386779 () Bool)

(assert (=> b!1503525 m!1386779))

(assert (=> b!1503525 m!1386779))

(declare-fun m!1386781 () Bool)

(assert (=> b!1503525 m!1386781))

(declare-fun m!1386783 () Bool)

(assert (=> b!1503526 m!1386783))

(declare-fun m!1386785 () Bool)

(assert (=> b!1503526 m!1386785))

(declare-fun m!1386787 () Bool)

(assert (=> b!1503528 m!1386787))

(declare-fun m!1386789 () Bool)

(assert (=> b!1503530 m!1386789))

(declare-fun m!1386791 () Bool)

(assert (=> b!1503530 m!1386791))

(declare-fun m!1386793 () Bool)

(assert (=> b!1503530 m!1386793))

(declare-fun m!1386795 () Bool)

(assert (=> b!1503529 m!1386795))

(declare-fun m!1386797 () Bool)

(assert (=> start!127982 m!1386797))

(declare-fun m!1386799 () Bool)

(assert (=> start!127982 m!1386799))

(assert (=> b!1503533 m!1386785))

(assert (=> b!1503533 m!1386785))

(declare-fun m!1386801 () Bool)

(assert (=> b!1503533 m!1386801))

(assert (=> b!1503532 m!1386785))

(assert (=> b!1503532 m!1386785))

(declare-fun m!1386803 () Bool)

(assert (=> b!1503532 m!1386803))

(declare-fun m!1386805 () Bool)

(assert (=> b!1503527 m!1386805))

(check-sat (not b!1503528) (not b!1503533) (not b!1503525) (not b!1503527) (not b!1503532) (not b!1503529) (not start!127982))
