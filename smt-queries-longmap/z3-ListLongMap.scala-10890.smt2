; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127870 () Bool)

(assert start!127870)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100096 0))(
  ( (array!100097 (arr!48304 (Array (_ BitVec 32) (_ BitVec 64))) (size!48855 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100096)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun e!840243 () Bool)

(declare-fun b!1500756 () Bool)

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500756 (= e!840243 (and (not (= (select (arr!48304 a!2850) index!625) (select (arr!48304 a!2850) j!87))) (bvslt mask!2661 #b00000000000000000000000000000000)))))

(declare-fun b!1500757 () Bool)

(declare-fun res!1020736 () Bool)

(assert (=> b!1500757 (=> (not res!1020736) (not e!840243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100096 (_ BitVec 32)) Bool)

(assert (=> b!1500757 (= res!1020736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500758 () Bool)

(declare-fun res!1020740 () Bool)

(assert (=> b!1500758 (=> (not res!1020740) (not e!840243))))

(declare-datatypes ((List!34783 0))(
  ( (Nil!34780) (Cons!34779 (h!36191 (_ BitVec 64)) (t!49469 List!34783)) )
))
(declare-fun arrayNoDuplicates!0 (array!100096 (_ BitVec 32) List!34783) Bool)

(assert (=> b!1500758 (= res!1020740 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34780))))

(declare-fun b!1500759 () Bool)

(declare-fun res!1020733 () Bool)

(assert (=> b!1500759 (=> (not res!1020733) (not e!840243))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12407 0))(
  ( (MissingZero!12407 (index!52020 (_ BitVec 32))) (Found!12407 (index!52021 (_ BitVec 32))) (Intermediate!12407 (undefined!13219 Bool) (index!52022 (_ BitVec 32)) (x!133907 (_ BitVec 32))) (Undefined!12407) (MissingVacant!12407 (index!52023 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100096 (_ BitVec 32)) SeekEntryResult!12407)

(assert (=> b!1500759 (= res!1020733 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48304 a!2850) j!87) a!2850 mask!2661) (Found!12407 j!87)))))

(declare-fun res!1020737 () Bool)

(assert (=> start!127870 (=> (not res!1020737) (not e!840243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127870 (= res!1020737 (validMask!0 mask!2661))))

(assert (=> start!127870 e!840243))

(assert (=> start!127870 true))

(declare-fun array_inv!37585 (array!100096) Bool)

(assert (=> start!127870 (array_inv!37585 a!2850)))

(declare-fun b!1500760 () Bool)

(declare-fun res!1020735 () Bool)

(assert (=> b!1500760 (=> (not res!1020735) (not e!840243))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1500760 (= res!1020735 (and (= (size!48855 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48855 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48855 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500761 () Bool)

(declare-fun res!1020734 () Bool)

(assert (=> b!1500761 (=> (not res!1020734) (not e!840243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500761 (= res!1020734 (validKeyInArray!0 (select (arr!48304 a!2850) j!87)))))

(declare-fun b!1500762 () Bool)

(declare-fun res!1020739 () Bool)

(assert (=> b!1500762 (=> (not res!1020739) (not e!840243))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500762 (= res!1020739 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48855 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48855 a!2850)) (= (select (arr!48304 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48304 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48855 a!2850))))))

(declare-fun b!1500763 () Bool)

(declare-fun res!1020738 () Bool)

(assert (=> b!1500763 (=> (not res!1020738) (not e!840243))))

(assert (=> b!1500763 (= res!1020738 (validKeyInArray!0 (select (arr!48304 a!2850) i!996)))))

(assert (= (and start!127870 res!1020737) b!1500760))

(assert (= (and b!1500760 res!1020735) b!1500763))

(assert (= (and b!1500763 res!1020738) b!1500761))

(assert (= (and b!1500761 res!1020734) b!1500757))

(assert (= (and b!1500757 res!1020736) b!1500758))

(assert (= (and b!1500758 res!1020740) b!1500762))

(assert (= (and b!1500762 res!1020739) b!1500759))

(assert (= (and b!1500759 res!1020733) b!1500756))

(declare-fun m!1383953 () Bool)

(assert (=> b!1500757 m!1383953))

(declare-fun m!1383955 () Bool)

(assert (=> start!127870 m!1383955))

(declare-fun m!1383957 () Bool)

(assert (=> start!127870 m!1383957))

(declare-fun m!1383959 () Bool)

(assert (=> b!1500756 m!1383959))

(declare-fun m!1383961 () Bool)

(assert (=> b!1500756 m!1383961))

(declare-fun m!1383963 () Bool)

(assert (=> b!1500763 m!1383963))

(assert (=> b!1500763 m!1383963))

(declare-fun m!1383965 () Bool)

(assert (=> b!1500763 m!1383965))

(declare-fun m!1383967 () Bool)

(assert (=> b!1500758 m!1383967))

(assert (=> b!1500759 m!1383961))

(assert (=> b!1500759 m!1383961))

(declare-fun m!1383969 () Bool)

(assert (=> b!1500759 m!1383969))

(assert (=> b!1500761 m!1383961))

(assert (=> b!1500761 m!1383961))

(declare-fun m!1383971 () Bool)

(assert (=> b!1500761 m!1383971))

(declare-fun m!1383973 () Bool)

(assert (=> b!1500762 m!1383973))

(declare-fun m!1383975 () Bool)

(assert (=> b!1500762 m!1383975))

(declare-fun m!1383977 () Bool)

(assert (=> b!1500762 m!1383977))

(check-sat (not start!127870) (not b!1500757) (not b!1500761) (not b!1500758) (not b!1500763) (not b!1500759))
(check-sat)
