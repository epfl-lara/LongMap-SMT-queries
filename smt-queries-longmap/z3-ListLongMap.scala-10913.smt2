; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127694 () Bool)

(assert start!127694)

(declare-fun b!1500756 () Bool)

(declare-fun res!1022023 () Bool)

(declare-fun e!839595 () Bool)

(assert (=> b!1500756 (=> (not res!1022023) (not e!839595))))

(declare-datatypes ((array!100069 0))(
  ( (array!100070 (arr!48295 (Array (_ BitVec 32) (_ BitVec 64))) (size!48847 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100069)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500756 (= res!1022023 (validKeyInArray!0 (select (arr!48295 a!2850) i!996)))))

(declare-fun res!1022030 () Bool)

(assert (=> start!127694 (=> (not res!1022030) (not e!839595))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127694 (= res!1022030 (validMask!0 mask!2661))))

(assert (=> start!127694 e!839595))

(assert (=> start!127694 true))

(declare-fun array_inv!37528 (array!100069) Bool)

(assert (=> start!127694 (array_inv!37528 a!2850)))

(declare-fun b!1500757 () Bool)

(declare-fun e!839592 () Bool)

(assert (=> b!1500757 (= e!839595 e!839592)))

(declare-fun res!1022020 () Bool)

(assert (=> b!1500757 (=> (not res!1022020) (not e!839592))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12526 0))(
  ( (MissingZero!12526 (index!52496 (_ BitVec 32))) (Found!12526 (index!52497 (_ BitVec 32))) (Intermediate!12526 (undefined!13338 Bool) (index!52498 (_ BitVec 32)) (x!134171 (_ BitVec 32))) (Undefined!12526) (MissingVacant!12526 (index!52499 (_ BitVec 32))) )
))
(declare-fun lt!652793 () SeekEntryResult!12526)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100069 (_ BitVec 32)) SeekEntryResult!12526)

(assert (=> b!1500757 (= res!1022020 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48295 a!2850) j!87) a!2850 mask!2661) lt!652793))))

(assert (=> b!1500757 (= lt!652793 (Found!12526 j!87))))

(declare-fun b!1500758 () Bool)

(declare-fun res!1022029 () Bool)

(declare-fun e!839594 () Bool)

(assert (=> b!1500758 (=> (not res!1022029) (not e!839594))))

(declare-fun lt!652794 () (_ BitVec 32))

(assert (=> b!1500758 (= res!1022029 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652794 vacantBefore!10 (select (arr!48295 a!2850) j!87) a!2850 mask!2661) lt!652793))))

(declare-fun b!1500759 () Bool)

(declare-fun res!1022028 () Bool)

(assert (=> b!1500759 (=> (not res!1022028) (not e!839595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100069 (_ BitVec 32)) Bool)

(assert (=> b!1500759 (= res!1022028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500760 () Bool)

(declare-fun res!1022027 () Bool)

(assert (=> b!1500760 (=> (not res!1022027) (not e!839595))))

(assert (=> b!1500760 (= res!1022027 (validKeyInArray!0 (select (arr!48295 a!2850) j!87)))))

(declare-fun b!1500761 () Bool)

(declare-fun res!1022021 () Bool)

(assert (=> b!1500761 (=> (not res!1022021) (not e!839592))))

(assert (=> b!1500761 (= res!1022021 (not (= (select (arr!48295 a!2850) index!625) (select (arr!48295 a!2850) j!87))))))

(declare-fun b!1500762 () Bool)

(declare-fun res!1022025 () Bool)

(assert (=> b!1500762 (=> (not res!1022025) (not e!839595))))

(assert (=> b!1500762 (= res!1022025 (and (= (size!48847 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48847 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48847 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500763 () Bool)

(declare-fun res!1022026 () Bool)

(assert (=> b!1500763 (=> (not res!1022026) (not e!839595))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500763 (= res!1022026 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48847 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48847 a!2850)) (= (select (arr!48295 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48295 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48847 a!2850))))))

(declare-fun b!1500764 () Bool)

(declare-fun res!1022022 () Bool)

(assert (=> b!1500764 (=> (not res!1022022) (not e!839595))))

(declare-datatypes ((List!34865 0))(
  ( (Nil!34862) (Cons!34861 (h!36259 (_ BitVec 64)) (t!49551 List!34865)) )
))
(declare-fun arrayNoDuplicates!0 (array!100069 (_ BitVec 32) List!34865) Bool)

(assert (=> b!1500764 (= res!1022022 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34862))))

(declare-fun b!1500765 () Bool)

(assert (=> b!1500765 (= e!839592 e!839594)))

(declare-fun res!1022024 () Bool)

(assert (=> b!1500765 (=> (not res!1022024) (not e!839594))))

(assert (=> b!1500765 (= res!1022024 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652794 #b00000000000000000000000000000000) (bvslt lt!652794 (size!48847 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500765 (= lt!652794 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500766 () Bool)

(assert (=> b!1500766 (= e!839594 (not (bvsge mask!2661 #b00000000000000000000000000000000)))))

(assert (=> b!1500766 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652794 vacantAfter!10 (select (store (arr!48295 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100070 (store (arr!48295 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48847 a!2850)) mask!2661) lt!652793)))

(declare-datatypes ((Unit!50047 0))(
  ( (Unit!50048) )
))
(declare-fun lt!652795 () Unit!50047)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100069 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50047)

(assert (=> b!1500766 (= lt!652795 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!652794 vacantBefore!10 vacantAfter!10 mask!2661))))

(assert (= (and start!127694 res!1022030) b!1500762))

(assert (= (and b!1500762 res!1022025) b!1500756))

(assert (= (and b!1500756 res!1022023) b!1500760))

(assert (= (and b!1500760 res!1022027) b!1500759))

(assert (= (and b!1500759 res!1022028) b!1500764))

(assert (= (and b!1500764 res!1022022) b!1500763))

(assert (= (and b!1500763 res!1022026) b!1500757))

(assert (= (and b!1500757 res!1022020) b!1500761))

(assert (= (and b!1500761 res!1022021) b!1500765))

(assert (= (and b!1500765 res!1022024) b!1500758))

(assert (= (and b!1500758 res!1022029) b!1500766))

(declare-fun m!1383403 () Bool)

(assert (=> b!1500759 m!1383403))

(declare-fun m!1383405 () Bool)

(assert (=> b!1500756 m!1383405))

(assert (=> b!1500756 m!1383405))

(declare-fun m!1383407 () Bool)

(assert (=> b!1500756 m!1383407))

(declare-fun m!1383409 () Bool)

(assert (=> b!1500761 m!1383409))

(declare-fun m!1383411 () Bool)

(assert (=> b!1500761 m!1383411))

(assert (=> b!1500760 m!1383411))

(assert (=> b!1500760 m!1383411))

(declare-fun m!1383413 () Bool)

(assert (=> b!1500760 m!1383413))

(declare-fun m!1383415 () Bool)

(assert (=> b!1500764 m!1383415))

(declare-fun m!1383417 () Bool)

(assert (=> b!1500763 m!1383417))

(declare-fun m!1383419 () Bool)

(assert (=> b!1500763 m!1383419))

(declare-fun m!1383421 () Bool)

(assert (=> b!1500763 m!1383421))

(declare-fun m!1383423 () Bool)

(assert (=> start!127694 m!1383423))

(declare-fun m!1383425 () Bool)

(assert (=> start!127694 m!1383425))

(declare-fun m!1383427 () Bool)

(assert (=> b!1500765 m!1383427))

(assert (=> b!1500757 m!1383411))

(assert (=> b!1500757 m!1383411))

(declare-fun m!1383429 () Bool)

(assert (=> b!1500757 m!1383429))

(assert (=> b!1500766 m!1383419))

(declare-fun m!1383431 () Bool)

(assert (=> b!1500766 m!1383431))

(assert (=> b!1500766 m!1383431))

(declare-fun m!1383433 () Bool)

(assert (=> b!1500766 m!1383433))

(declare-fun m!1383435 () Bool)

(assert (=> b!1500766 m!1383435))

(assert (=> b!1500758 m!1383411))

(assert (=> b!1500758 m!1383411))

(declare-fun m!1383437 () Bool)

(assert (=> b!1500758 m!1383437))

(check-sat (not b!1500765) (not b!1500760) (not start!127694) (not b!1500759) (not b!1500756) (not b!1500758) (not b!1500764) (not b!1500766) (not b!1500757))
(check-sat)
