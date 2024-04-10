; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127646 () Bool)

(assert start!127646)

(declare-fun b!1499651 () Bool)

(declare-fun res!1020727 () Bool)

(declare-fun e!839359 () Bool)

(assert (=> b!1499651 (=> (not res!1020727) (not e!839359))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100027 0))(
  ( (array!100028 (arr!48273 (Array (_ BitVec 32) (_ BitVec 64))) (size!48823 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100027)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12483 0))(
  ( (MissingZero!12483 (index!52324 (_ BitVec 32))) (Found!12483 (index!52325 (_ BitVec 32))) (Intermediate!12483 (undefined!13295 Bool) (index!52326 (_ BitVec 32)) (x!134005 (_ BitVec 32))) (Undefined!12483) (MissingVacant!12483 (index!52327 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100027 (_ BitVec 32)) SeekEntryResult!12483)

(assert (=> b!1499651 (= res!1020727 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48273 a!2850) j!87) a!2850 mask!2661) (Found!12483 j!87)))))

(declare-fun b!1499652 () Bool)

(declare-fun res!1020736 () Bool)

(assert (=> b!1499652 (=> (not res!1020736) (not e!839359))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499652 (= res!1020736 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48823 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48823 a!2850)) (= (select (arr!48273 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48273 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48823 a!2850))))))

(declare-fun b!1499653 () Bool)

(declare-fun e!839357 () Bool)

(assert (=> b!1499653 (= e!839359 e!839357)))

(declare-fun res!1020729 () Bool)

(assert (=> b!1499653 (=> (not res!1020729) (not e!839357))))

(declare-fun lt!652780 () (_ BitVec 32))

(assert (=> b!1499653 (= res!1020729 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652780 #b00000000000000000000000000000000) (bvslt lt!652780 (size!48823 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499653 (= lt!652780 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499654 () Bool)

(declare-fun res!1020730 () Bool)

(assert (=> b!1499654 (=> (not res!1020730) (not e!839359))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499654 (= res!1020730 (validKeyInArray!0 (select (arr!48273 a!2850) i!996)))))

(declare-fun res!1020731 () Bool)

(assert (=> start!127646 (=> (not res!1020731) (not e!839359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127646 (= res!1020731 (validMask!0 mask!2661))))

(assert (=> start!127646 e!839359))

(assert (=> start!127646 true))

(declare-fun array_inv!37301 (array!100027) Bool)

(assert (=> start!127646 (array_inv!37301 a!2850)))

(declare-fun b!1499655 () Bool)

(declare-fun res!1020735 () Bool)

(assert (=> b!1499655 (=> (not res!1020735) (not e!839359))))

(assert (=> b!1499655 (= res!1020735 (and (= (size!48823 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48823 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48823 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499656 () Bool)

(declare-fun res!1020732 () Bool)

(assert (=> b!1499656 (=> (not res!1020732) (not e!839359))))

(declare-datatypes ((List!34765 0))(
  ( (Nil!34762) (Cons!34761 (h!36158 (_ BitVec 64)) (t!49459 List!34765)) )
))
(declare-fun arrayNoDuplicates!0 (array!100027 (_ BitVec 32) List!34765) Bool)

(assert (=> b!1499656 (= res!1020732 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34762))))

(declare-fun b!1499657 () Bool)

(declare-fun res!1020734 () Bool)

(assert (=> b!1499657 (=> (not res!1020734) (not e!839359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100027 (_ BitVec 32)) Bool)

(assert (=> b!1499657 (= res!1020734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499658 () Bool)

(declare-fun res!1020728 () Bool)

(assert (=> b!1499658 (=> (not res!1020728) (not e!839359))))

(assert (=> b!1499658 (= res!1020728 (not (= (select (arr!48273 a!2850) index!625) (select (arr!48273 a!2850) j!87))))))

(declare-fun b!1499659 () Bool)

(assert (=> b!1499659 (= e!839357 false)))

(declare-fun lt!652779 () SeekEntryResult!12483)

(assert (=> b!1499659 (= lt!652779 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652780 vacantBefore!10 (select (arr!48273 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499660 () Bool)

(declare-fun res!1020733 () Bool)

(assert (=> b!1499660 (=> (not res!1020733) (not e!839359))))

(assert (=> b!1499660 (= res!1020733 (validKeyInArray!0 (select (arr!48273 a!2850) j!87)))))

(assert (= (and start!127646 res!1020731) b!1499655))

(assert (= (and b!1499655 res!1020735) b!1499654))

(assert (= (and b!1499654 res!1020730) b!1499660))

(assert (= (and b!1499660 res!1020733) b!1499657))

(assert (= (and b!1499657 res!1020734) b!1499656))

(assert (= (and b!1499656 res!1020732) b!1499652))

(assert (= (and b!1499652 res!1020736) b!1499651))

(assert (= (and b!1499651 res!1020727) b!1499658))

(assert (= (and b!1499658 res!1020728) b!1499653))

(assert (= (and b!1499653 res!1020729) b!1499659))

(declare-fun m!1382845 () Bool)

(assert (=> b!1499651 m!1382845))

(assert (=> b!1499651 m!1382845))

(declare-fun m!1382847 () Bool)

(assert (=> b!1499651 m!1382847))

(declare-fun m!1382849 () Bool)

(assert (=> start!127646 m!1382849))

(declare-fun m!1382851 () Bool)

(assert (=> start!127646 m!1382851))

(declare-fun m!1382853 () Bool)

(assert (=> b!1499658 m!1382853))

(assert (=> b!1499658 m!1382845))

(declare-fun m!1382855 () Bool)

(assert (=> b!1499653 m!1382855))

(declare-fun m!1382857 () Bool)

(assert (=> b!1499652 m!1382857))

(declare-fun m!1382859 () Bool)

(assert (=> b!1499652 m!1382859))

(declare-fun m!1382861 () Bool)

(assert (=> b!1499652 m!1382861))

(declare-fun m!1382863 () Bool)

(assert (=> b!1499657 m!1382863))

(assert (=> b!1499659 m!1382845))

(assert (=> b!1499659 m!1382845))

(declare-fun m!1382865 () Bool)

(assert (=> b!1499659 m!1382865))

(assert (=> b!1499660 m!1382845))

(assert (=> b!1499660 m!1382845))

(declare-fun m!1382867 () Bool)

(assert (=> b!1499660 m!1382867))

(declare-fun m!1382869 () Bool)

(assert (=> b!1499656 m!1382869))

(declare-fun m!1382871 () Bool)

(assert (=> b!1499654 m!1382871))

(assert (=> b!1499654 m!1382871))

(declare-fun m!1382873 () Bool)

(assert (=> b!1499654 m!1382873))

(check-sat (not start!127646) (not b!1499653) (not b!1499660) (not b!1499654) (not b!1499656) (not b!1499657) (not b!1499659) (not b!1499651))
(check-sat)
