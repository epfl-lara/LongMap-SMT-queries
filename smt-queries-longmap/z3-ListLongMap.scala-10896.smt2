; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127640 () Bool)

(assert start!127640)

(declare-fun b!1499561 () Bool)

(declare-fun res!1020646 () Bool)

(declare-fun e!839332 () Bool)

(assert (=> b!1499561 (=> (not res!1020646) (not e!839332))))

(declare-datatypes ((array!100021 0))(
  ( (array!100022 (arr!48270 (Array (_ BitVec 32) (_ BitVec 64))) (size!48820 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100021)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499561 (= res!1020646 (not (= (select (arr!48270 a!2850) index!625) (select (arr!48270 a!2850) j!87))))))

(declare-fun b!1499562 () Bool)

(declare-fun res!1020637 () Bool)

(assert (=> b!1499562 (=> (not res!1020637) (not e!839332))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1499562 (= res!1020637 (and (= (size!48820 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48820 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48820 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499563 () Bool)

(declare-fun e!839330 () Bool)

(assert (=> b!1499563 (= e!839330 false)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!652762 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12480 0))(
  ( (MissingZero!12480 (index!52312 (_ BitVec 32))) (Found!12480 (index!52313 (_ BitVec 32))) (Intermediate!12480 (undefined!13292 Bool) (index!52314 (_ BitVec 32)) (x!133994 (_ BitVec 32))) (Undefined!12480) (MissingVacant!12480 (index!52315 (_ BitVec 32))) )
))
(declare-fun lt!652761 () SeekEntryResult!12480)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100021 (_ BitVec 32)) SeekEntryResult!12480)

(assert (=> b!1499563 (= lt!652761 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652762 vacantBefore!10 (select (arr!48270 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499564 () Bool)

(assert (=> b!1499564 (= e!839332 e!839330)))

(declare-fun res!1020642 () Bool)

(assert (=> b!1499564 (=> (not res!1020642) (not e!839330))))

(assert (=> b!1499564 (= res!1020642 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652762 #b00000000000000000000000000000000) (bvslt lt!652762 (size!48820 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499564 (= lt!652762 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499566 () Bool)

(declare-fun res!1020645 () Bool)

(assert (=> b!1499566 (=> (not res!1020645) (not e!839332))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499566 (= res!1020645 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48820 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48820 a!2850)) (= (select (arr!48270 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48270 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48820 a!2850))))))

(declare-fun b!1499567 () Bool)

(declare-fun res!1020640 () Bool)

(assert (=> b!1499567 (=> (not res!1020640) (not e!839332))))

(assert (=> b!1499567 (= res!1020640 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48270 a!2850) j!87) a!2850 mask!2661) (Found!12480 j!87)))))

(declare-fun b!1499568 () Bool)

(declare-fun res!1020639 () Bool)

(assert (=> b!1499568 (=> (not res!1020639) (not e!839332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100021 (_ BitVec 32)) Bool)

(assert (=> b!1499568 (= res!1020639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499569 () Bool)

(declare-fun res!1020641 () Bool)

(assert (=> b!1499569 (=> (not res!1020641) (not e!839332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499569 (= res!1020641 (validKeyInArray!0 (select (arr!48270 a!2850) i!996)))))

(declare-fun b!1499570 () Bool)

(declare-fun res!1020644 () Bool)

(assert (=> b!1499570 (=> (not res!1020644) (not e!839332))))

(declare-datatypes ((List!34762 0))(
  ( (Nil!34759) (Cons!34758 (h!36155 (_ BitVec 64)) (t!49456 List!34762)) )
))
(declare-fun arrayNoDuplicates!0 (array!100021 (_ BitVec 32) List!34762) Bool)

(assert (=> b!1499570 (= res!1020644 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34759))))

(declare-fun res!1020638 () Bool)

(assert (=> start!127640 (=> (not res!1020638) (not e!839332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127640 (= res!1020638 (validMask!0 mask!2661))))

(assert (=> start!127640 e!839332))

(assert (=> start!127640 true))

(declare-fun array_inv!37298 (array!100021) Bool)

(assert (=> start!127640 (array_inv!37298 a!2850)))

(declare-fun b!1499565 () Bool)

(declare-fun res!1020643 () Bool)

(assert (=> b!1499565 (=> (not res!1020643) (not e!839332))))

(assert (=> b!1499565 (= res!1020643 (validKeyInArray!0 (select (arr!48270 a!2850) j!87)))))

(assert (= (and start!127640 res!1020638) b!1499562))

(assert (= (and b!1499562 res!1020637) b!1499569))

(assert (= (and b!1499569 res!1020641) b!1499565))

(assert (= (and b!1499565 res!1020643) b!1499568))

(assert (= (and b!1499568 res!1020639) b!1499570))

(assert (= (and b!1499570 res!1020644) b!1499566))

(assert (= (and b!1499566 res!1020645) b!1499567))

(assert (= (and b!1499567 res!1020640) b!1499561))

(assert (= (and b!1499561 res!1020646) b!1499564))

(assert (= (and b!1499564 res!1020642) b!1499563))

(declare-fun m!1382755 () Bool)

(assert (=> b!1499566 m!1382755))

(declare-fun m!1382757 () Bool)

(assert (=> b!1499566 m!1382757))

(declare-fun m!1382759 () Bool)

(assert (=> b!1499566 m!1382759))

(declare-fun m!1382761 () Bool)

(assert (=> b!1499569 m!1382761))

(assert (=> b!1499569 m!1382761))

(declare-fun m!1382763 () Bool)

(assert (=> b!1499569 m!1382763))

(declare-fun m!1382765 () Bool)

(assert (=> b!1499565 m!1382765))

(assert (=> b!1499565 m!1382765))

(declare-fun m!1382767 () Bool)

(assert (=> b!1499565 m!1382767))

(declare-fun m!1382769 () Bool)

(assert (=> b!1499570 m!1382769))

(assert (=> b!1499563 m!1382765))

(assert (=> b!1499563 m!1382765))

(declare-fun m!1382771 () Bool)

(assert (=> b!1499563 m!1382771))

(declare-fun m!1382773 () Bool)

(assert (=> b!1499561 m!1382773))

(assert (=> b!1499561 m!1382765))

(declare-fun m!1382775 () Bool)

(assert (=> start!127640 m!1382775))

(declare-fun m!1382777 () Bool)

(assert (=> start!127640 m!1382777))

(declare-fun m!1382779 () Bool)

(assert (=> b!1499564 m!1382779))

(assert (=> b!1499567 m!1382765))

(assert (=> b!1499567 m!1382765))

(declare-fun m!1382781 () Bool)

(assert (=> b!1499567 m!1382781))

(declare-fun m!1382783 () Bool)

(assert (=> b!1499568 m!1382783))

(check-sat (not b!1499567) (not b!1499569) (not b!1499564) (not b!1499563) (not b!1499565) (not b!1499570) (not start!127640) (not b!1499568))
(check-sat)
