; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127636 () Bool)

(assert start!127636)

(declare-fun b!1499501 () Bool)

(declare-fun res!1020585 () Bool)

(declare-fun e!839314 () Bool)

(assert (=> b!1499501 (=> (not res!1020585) (not e!839314))))

(declare-datatypes ((array!100017 0))(
  ( (array!100018 (arr!48268 (Array (_ BitVec 32) (_ BitVec 64))) (size!48818 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100017)

(declare-datatypes ((List!34760 0))(
  ( (Nil!34757) (Cons!34756 (h!36153 (_ BitVec 64)) (t!49454 List!34760)) )
))
(declare-fun arrayNoDuplicates!0 (array!100017 (_ BitVec 32) List!34760) Bool)

(assert (=> b!1499501 (= res!1020585 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34757))))

(declare-fun b!1499502 () Bool)

(declare-fun res!1020581 () Bool)

(assert (=> b!1499502 (=> (not res!1020581) (not e!839314))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100017 (_ BitVec 32)) Bool)

(assert (=> b!1499502 (= res!1020581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499503 () Bool)

(declare-fun res!1020579 () Bool)

(assert (=> b!1499503 (=> (not res!1020579) (not e!839314))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499503 (= res!1020579 (not (= (select (arr!48268 a!2850) index!625) (select (arr!48268 a!2850) j!87))))))

(declare-fun b!1499505 () Bool)

(declare-fun res!1020586 () Bool)

(assert (=> b!1499505 (=> (not res!1020586) (not e!839314))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12478 0))(
  ( (MissingZero!12478 (index!52304 (_ BitVec 32))) (Found!12478 (index!52305 (_ BitVec 32))) (Intermediate!12478 (undefined!13290 Bool) (index!52306 (_ BitVec 32)) (x!133984 (_ BitVec 32))) (Undefined!12478) (MissingVacant!12478 (index!52307 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100017 (_ BitVec 32)) SeekEntryResult!12478)

(assert (=> b!1499505 (= res!1020586 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48268 a!2850) j!87) a!2850 mask!2661) (Found!12478 j!87)))))

(declare-fun b!1499506 () Bool)

(declare-fun res!1020583 () Bool)

(assert (=> b!1499506 (=> (not res!1020583) (not e!839314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499506 (= res!1020583 (validKeyInArray!0 (select (arr!48268 a!2850) j!87)))))

(declare-fun b!1499507 () Bool)

(declare-fun res!1020580 () Bool)

(assert (=> b!1499507 (=> (not res!1020580) (not e!839314))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1499507 (= res!1020580 (validKeyInArray!0 (select (arr!48268 a!2850) i!996)))))

(declare-fun b!1499508 () Bool)

(declare-fun e!839313 () Bool)

(assert (=> b!1499508 (= e!839314 e!839313)))

(declare-fun res!1020577 () Bool)

(assert (=> b!1499508 (=> (not res!1020577) (not e!839313))))

(declare-fun lt!652750 () (_ BitVec 32))

(assert (=> b!1499508 (= res!1020577 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652750 #b00000000000000000000000000000000) (bvslt lt!652750 (size!48818 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499508 (= lt!652750 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1020578 () Bool)

(assert (=> start!127636 (=> (not res!1020578) (not e!839314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127636 (= res!1020578 (validMask!0 mask!2661))))

(assert (=> start!127636 e!839314))

(assert (=> start!127636 true))

(declare-fun array_inv!37296 (array!100017) Bool)

(assert (=> start!127636 (array_inv!37296 a!2850)))

(declare-fun b!1499504 () Bool)

(assert (=> b!1499504 (= e!839313 false)))

(declare-fun lt!652749 () SeekEntryResult!12478)

(assert (=> b!1499504 (= lt!652749 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652750 vacantBefore!10 (select (arr!48268 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499509 () Bool)

(declare-fun res!1020582 () Bool)

(assert (=> b!1499509 (=> (not res!1020582) (not e!839314))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499509 (= res!1020582 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48818 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48818 a!2850)) (= (select (arr!48268 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48268 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48818 a!2850))))))

(declare-fun b!1499510 () Bool)

(declare-fun res!1020584 () Bool)

(assert (=> b!1499510 (=> (not res!1020584) (not e!839314))))

(assert (=> b!1499510 (= res!1020584 (and (= (size!48818 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48818 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48818 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127636 res!1020578) b!1499510))

(assert (= (and b!1499510 res!1020584) b!1499507))

(assert (= (and b!1499507 res!1020580) b!1499506))

(assert (= (and b!1499506 res!1020583) b!1499502))

(assert (= (and b!1499502 res!1020581) b!1499501))

(assert (= (and b!1499501 res!1020585) b!1499509))

(assert (= (and b!1499509 res!1020582) b!1499505))

(assert (= (and b!1499505 res!1020586) b!1499503))

(assert (= (and b!1499503 res!1020579) b!1499508))

(assert (= (and b!1499508 res!1020577) b!1499504))

(declare-fun m!1382695 () Bool)

(assert (=> b!1499504 m!1382695))

(assert (=> b!1499504 m!1382695))

(declare-fun m!1382697 () Bool)

(assert (=> b!1499504 m!1382697))

(declare-fun m!1382699 () Bool)

(assert (=> b!1499508 m!1382699))

(declare-fun m!1382701 () Bool)

(assert (=> b!1499501 m!1382701))

(declare-fun m!1382703 () Bool)

(assert (=> b!1499509 m!1382703))

(declare-fun m!1382705 () Bool)

(assert (=> b!1499509 m!1382705))

(declare-fun m!1382707 () Bool)

(assert (=> b!1499509 m!1382707))

(declare-fun m!1382709 () Bool)

(assert (=> b!1499503 m!1382709))

(assert (=> b!1499503 m!1382695))

(assert (=> b!1499506 m!1382695))

(assert (=> b!1499506 m!1382695))

(declare-fun m!1382711 () Bool)

(assert (=> b!1499506 m!1382711))

(assert (=> b!1499505 m!1382695))

(assert (=> b!1499505 m!1382695))

(declare-fun m!1382713 () Bool)

(assert (=> b!1499505 m!1382713))

(declare-fun m!1382715 () Bool)

(assert (=> b!1499507 m!1382715))

(assert (=> b!1499507 m!1382715))

(declare-fun m!1382717 () Bool)

(assert (=> b!1499507 m!1382717))

(declare-fun m!1382719 () Bool)

(assert (=> start!127636 m!1382719))

(declare-fun m!1382721 () Bool)

(assert (=> start!127636 m!1382721))

(declare-fun m!1382723 () Bool)

(assert (=> b!1499502 m!1382723))

(push 1)

(assert (not b!1499506))

(assert (not b!1499502))

(assert (not b!1499507))

(assert (not b!1499504))

(assert (not start!127636))

(assert (not b!1499505))

(assert (not b!1499501))

(assert (not b!1499508))

(check-sat)

(pop 1)

