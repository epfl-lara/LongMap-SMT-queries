; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127676 () Bool)

(assert start!127676)

(declare-fun b!1500476 () Bool)

(declare-fun res!1021739 () Bool)

(declare-fun e!839500 () Bool)

(assert (=> b!1500476 (=> (not res!1021739) (not e!839500))))

(declare-datatypes ((array!100051 0))(
  ( (array!100052 (arr!48286 (Array (_ BitVec 32) (_ BitVec 64))) (size!48838 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100051)

(declare-datatypes ((List!34856 0))(
  ( (Nil!34853) (Cons!34852 (h!36250 (_ BitVec 64)) (t!49542 List!34856)) )
))
(declare-fun arrayNoDuplicates!0 (array!100051 (_ BitVec 32) List!34856) Bool)

(assert (=> b!1500476 (= res!1021739 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34853))))

(declare-fun b!1500477 () Bool)

(declare-fun e!839501 () Bool)

(assert (=> b!1500477 (= e!839500 e!839501)))

(declare-fun res!1021740 () Bool)

(assert (=> b!1500477 (=> (not res!1021740) (not e!839501))))

(declare-fun lt!652729 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1500477 (= res!1021740 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652729 #b00000000000000000000000000000000) (bvslt lt!652729 (size!48838 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500477 (= lt!652729 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500478 () Bool)

(declare-fun res!1021748 () Bool)

(assert (=> b!1500478 (=> (not res!1021748) (not e!839500))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500478 (= res!1021748 (not (= (select (arr!48286 a!2850) index!625) (select (arr!48286 a!2850) j!87))))))

(declare-fun b!1500479 () Bool)

(declare-fun res!1021745 () Bool)

(assert (=> b!1500479 (=> (not res!1021745) (not e!839500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100051 (_ BitVec 32)) Bool)

(assert (=> b!1500479 (= res!1021745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500480 () Bool)

(declare-fun res!1021746 () Bool)

(assert (=> b!1500480 (=> (not res!1021746) (not e!839500))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500480 (= res!1021746 (validKeyInArray!0 (select (arr!48286 a!2850) i!996)))))

(declare-fun b!1500481 () Bool)

(declare-fun res!1021742 () Bool)

(assert (=> b!1500481 (=> (not res!1021742) (not e!839500))))

(assert (=> b!1500481 (= res!1021742 (and (= (size!48838 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48838 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48838 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500482 () Bool)

(declare-fun res!1021747 () Bool)

(assert (=> b!1500482 (=> (not res!1021747) (not e!839500))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12517 0))(
  ( (MissingZero!12517 (index!52460 (_ BitVec 32))) (Found!12517 (index!52461 (_ BitVec 32))) (Intermediate!12517 (undefined!13329 Bool) (index!52462 (_ BitVec 32)) (x!134138 (_ BitVec 32))) (Undefined!12517) (MissingVacant!12517 (index!52463 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100051 (_ BitVec 32)) SeekEntryResult!12517)

(assert (=> b!1500482 (= res!1021747 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48286 a!2850) j!87) a!2850 mask!2661) (Found!12517 j!87)))))

(declare-fun b!1500483 () Bool)

(declare-fun res!1021743 () Bool)

(assert (=> b!1500483 (=> (not res!1021743) (not e!839500))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500483 (= res!1021743 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48838 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48838 a!2850)) (= (select (arr!48286 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48286 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48838 a!2850))))))

(declare-fun b!1500484 () Bool)

(assert (=> b!1500484 (= e!839501 false)))

(declare-fun lt!652728 () SeekEntryResult!12517)

(assert (=> b!1500484 (= lt!652728 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652729 vacantBefore!10 (select (arr!48286 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500475 () Bool)

(declare-fun res!1021744 () Bool)

(assert (=> b!1500475 (=> (not res!1021744) (not e!839500))))

(assert (=> b!1500475 (= res!1021744 (validKeyInArray!0 (select (arr!48286 a!2850) j!87)))))

(declare-fun res!1021741 () Bool)

(assert (=> start!127676 (=> (not res!1021741) (not e!839500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127676 (= res!1021741 (validMask!0 mask!2661))))

(assert (=> start!127676 e!839500))

(assert (=> start!127676 true))

(declare-fun array_inv!37519 (array!100051) Bool)

(assert (=> start!127676 (array_inv!37519 a!2850)))

(assert (= (and start!127676 res!1021741) b!1500481))

(assert (= (and b!1500481 res!1021742) b!1500480))

(assert (= (and b!1500480 res!1021746) b!1500475))

(assert (= (and b!1500475 res!1021744) b!1500479))

(assert (= (and b!1500479 res!1021745) b!1500476))

(assert (= (and b!1500476 res!1021739) b!1500483))

(assert (= (and b!1500483 res!1021743) b!1500482))

(assert (= (and b!1500482 res!1021747) b!1500478))

(assert (= (and b!1500478 res!1021748) b!1500477))

(assert (= (and b!1500477 res!1021740) b!1500484))

(declare-fun m!1383115 () Bool)

(assert (=> b!1500476 m!1383115))

(declare-fun m!1383117 () Bool)

(assert (=> b!1500477 m!1383117))

(declare-fun m!1383119 () Bool)

(assert (=> b!1500479 m!1383119))

(declare-fun m!1383121 () Bool)

(assert (=> b!1500484 m!1383121))

(assert (=> b!1500484 m!1383121))

(declare-fun m!1383123 () Bool)

(assert (=> b!1500484 m!1383123))

(assert (=> b!1500482 m!1383121))

(assert (=> b!1500482 m!1383121))

(declare-fun m!1383125 () Bool)

(assert (=> b!1500482 m!1383125))

(assert (=> b!1500475 m!1383121))

(assert (=> b!1500475 m!1383121))

(declare-fun m!1383127 () Bool)

(assert (=> b!1500475 m!1383127))

(declare-fun m!1383129 () Bool)

(assert (=> start!127676 m!1383129))

(declare-fun m!1383131 () Bool)

(assert (=> start!127676 m!1383131))

(declare-fun m!1383133 () Bool)

(assert (=> b!1500480 m!1383133))

(assert (=> b!1500480 m!1383133))

(declare-fun m!1383135 () Bool)

(assert (=> b!1500480 m!1383135))

(declare-fun m!1383137 () Bool)

(assert (=> b!1500483 m!1383137))

(declare-fun m!1383139 () Bool)

(assert (=> b!1500483 m!1383139))

(declare-fun m!1383141 () Bool)

(assert (=> b!1500483 m!1383141))

(declare-fun m!1383143 () Bool)

(assert (=> b!1500478 m!1383143))

(assert (=> b!1500478 m!1383121))

(check-sat (not b!1500475) (not b!1500484) (not b!1500480) (not start!127676) (not b!1500482) (not b!1500477) (not b!1500476) (not b!1500479))
(check-sat)
