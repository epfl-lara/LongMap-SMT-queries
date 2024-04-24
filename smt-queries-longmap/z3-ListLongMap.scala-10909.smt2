; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128018 () Bool)

(assert start!128018)

(declare-fun b!1502539 () Bool)

(declare-fun e!840811 () Bool)

(declare-fun e!840813 () Bool)

(assert (=> b!1502539 (= e!840811 e!840813)))

(declare-fun res!1022439 () Bool)

(assert (=> b!1502539 (=> (not res!1022439) (not e!840813))))

(declare-fun lt!653654 () (_ BitVec 32))

(declare-datatypes ((array!100213 0))(
  ( (array!100214 (arr!48361 (Array (_ BitVec 32) (_ BitVec 64))) (size!48912 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100213)

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1502539 (= res!1022439 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653654 #b00000000000000000000000000000000) (bvslt lt!653654 (size!48912 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502539 (= lt!653654 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1502540 () Bool)

(assert (=> b!1502540 (= e!840813 false)))

(declare-datatypes ((SeekEntryResult!12464 0))(
  ( (MissingZero!12464 (index!52248 (_ BitVec 32))) (Found!12464 (index!52249 (_ BitVec 32))) (Intermediate!12464 (undefined!13276 Bool) (index!52250 (_ BitVec 32)) (x!134119 (_ BitVec 32))) (Undefined!12464) (MissingVacant!12464 (index!52251 (_ BitVec 32))) )
))
(declare-fun lt!653655 () SeekEntryResult!12464)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100213 (_ BitVec 32)) SeekEntryResult!12464)

(assert (=> b!1502540 (= lt!653655 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653654 vacantBefore!10 (select (arr!48361 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502541 () Bool)

(declare-fun res!1022441 () Bool)

(assert (=> b!1502541 (=> (not res!1022441) (not e!840811))))

(assert (=> b!1502541 (= res!1022441 (not (= (select (arr!48361 a!2850) index!625) (select (arr!48361 a!2850) j!87))))))

(declare-fun b!1502542 () Bool)

(declare-fun res!1022434 () Bool)

(assert (=> b!1502542 (=> (not res!1022434) (not e!840811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100213 (_ BitVec 32)) Bool)

(assert (=> b!1502542 (= res!1022434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502543 () Bool)

(declare-fun res!1022433 () Bool)

(assert (=> b!1502543 (=> (not res!1022433) (not e!840811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502543 (= res!1022433 (validKeyInArray!0 (select (arr!48361 a!2850) j!87)))))

(declare-fun b!1502544 () Bool)

(declare-fun res!1022440 () Bool)

(assert (=> b!1502544 (=> (not res!1022440) (not e!840811))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502544 (= res!1022440 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48912 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48912 a!2850)) (= (select (arr!48361 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48361 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48912 a!2850))))))

(declare-fun b!1502545 () Bool)

(declare-fun res!1022438 () Bool)

(assert (=> b!1502545 (=> (not res!1022438) (not e!840811))))

(assert (=> b!1502545 (= res!1022438 (and (= (size!48912 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48912 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48912 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1022437 () Bool)

(assert (=> start!128018 (=> (not res!1022437) (not e!840811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128018 (= res!1022437 (validMask!0 mask!2661))))

(assert (=> start!128018 e!840811))

(assert (=> start!128018 true))

(declare-fun array_inv!37642 (array!100213) Bool)

(assert (=> start!128018 (array_inv!37642 a!2850)))

(declare-fun b!1502546 () Bool)

(declare-fun res!1022432 () Bool)

(assert (=> b!1502546 (=> (not res!1022432) (not e!840811))))

(assert (=> b!1502546 (= res!1022432 (validKeyInArray!0 (select (arr!48361 a!2850) i!996)))))

(declare-fun b!1502547 () Bool)

(declare-fun res!1022435 () Bool)

(assert (=> b!1502547 (=> (not res!1022435) (not e!840811))))

(declare-datatypes ((List!34840 0))(
  ( (Nil!34837) (Cons!34836 (h!36248 (_ BitVec 64)) (t!49526 List!34840)) )
))
(declare-fun arrayNoDuplicates!0 (array!100213 (_ BitVec 32) List!34840) Bool)

(assert (=> b!1502547 (= res!1022435 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34837))))

(declare-fun b!1502548 () Bool)

(declare-fun res!1022436 () Bool)

(assert (=> b!1502548 (=> (not res!1022436) (not e!840811))))

(assert (=> b!1502548 (= res!1022436 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48361 a!2850) j!87) a!2850 mask!2661) (Found!12464 j!87)))))

(assert (= (and start!128018 res!1022437) b!1502545))

(assert (= (and b!1502545 res!1022438) b!1502546))

(assert (= (and b!1502546 res!1022432) b!1502543))

(assert (= (and b!1502543 res!1022433) b!1502542))

(assert (= (and b!1502542 res!1022434) b!1502547))

(assert (= (and b!1502547 res!1022435) b!1502544))

(assert (= (and b!1502544 res!1022440) b!1502548))

(assert (= (and b!1502548 res!1022436) b!1502541))

(assert (= (and b!1502541 res!1022441) b!1502539))

(assert (= (and b!1502539 res!1022439) b!1502540))

(declare-fun m!1385683 () Bool)

(assert (=> b!1502548 m!1385683))

(assert (=> b!1502548 m!1385683))

(declare-fun m!1385685 () Bool)

(assert (=> b!1502548 m!1385685))

(declare-fun m!1385687 () Bool)

(assert (=> b!1502547 m!1385687))

(assert (=> b!1502540 m!1385683))

(assert (=> b!1502540 m!1385683))

(declare-fun m!1385689 () Bool)

(assert (=> b!1502540 m!1385689))

(declare-fun m!1385691 () Bool)

(assert (=> b!1502546 m!1385691))

(assert (=> b!1502546 m!1385691))

(declare-fun m!1385693 () Bool)

(assert (=> b!1502546 m!1385693))

(declare-fun m!1385695 () Bool)

(assert (=> b!1502542 m!1385695))

(assert (=> b!1502543 m!1385683))

(assert (=> b!1502543 m!1385683))

(declare-fun m!1385697 () Bool)

(assert (=> b!1502543 m!1385697))

(declare-fun m!1385699 () Bool)

(assert (=> b!1502541 m!1385699))

(assert (=> b!1502541 m!1385683))

(declare-fun m!1385701 () Bool)

(assert (=> b!1502544 m!1385701))

(declare-fun m!1385703 () Bool)

(assert (=> b!1502544 m!1385703))

(declare-fun m!1385705 () Bool)

(assert (=> b!1502544 m!1385705))

(declare-fun m!1385707 () Bool)

(assert (=> start!128018 m!1385707))

(declare-fun m!1385709 () Bool)

(assert (=> start!128018 m!1385709))

(declare-fun m!1385711 () Bool)

(assert (=> b!1502539 m!1385711))

(check-sat (not b!1502546) (not b!1502542) (not b!1502540) (not b!1502539) (not b!1502547) (not b!1502543) (not b!1502548) (not start!128018))
(check-sat)
