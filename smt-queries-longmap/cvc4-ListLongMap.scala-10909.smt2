; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127720 () Bool)

(assert start!127720)

(declare-fun b!1500761 () Bool)

(declare-fun e!839690 () Bool)

(declare-fun e!839691 () Bool)

(assert (=> b!1500761 (= e!839690 e!839691)))

(declare-fun res!1021839 () Bool)

(assert (=> b!1500761 (=> (not res!1021839) (not e!839691))))

(declare-fun lt!653002 () (_ BitVec 32))

(declare-datatypes ((array!100101 0))(
  ( (array!100102 (arr!48310 (Array (_ BitVec 32) (_ BitVec 64))) (size!48860 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100101)

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1500761 (= res!1021839 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653002 #b00000000000000000000000000000000) (bvslt lt!653002 (size!48860 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500761 (= lt!653002 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500763 () Bool)

(declare-fun res!1021837 () Bool)

(assert (=> b!1500763 (=> (not res!1021837) (not e!839690))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500763 (= res!1021837 (and (= (size!48860 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48860 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48860 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500764 () Bool)

(declare-fun res!1021845 () Bool)

(assert (=> b!1500764 (=> (not res!1021845) (not e!839690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100101 (_ BitVec 32)) Bool)

(assert (=> b!1500764 (= res!1021845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500765 () Bool)

(declare-fun res!1021846 () Bool)

(assert (=> b!1500765 (=> (not res!1021846) (not e!839690))))

(declare-datatypes ((List!34802 0))(
  ( (Nil!34799) (Cons!34798 (h!36195 (_ BitVec 64)) (t!49496 List!34802)) )
))
(declare-fun arrayNoDuplicates!0 (array!100101 (_ BitVec 32) List!34802) Bool)

(assert (=> b!1500765 (= res!1021846 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34799))))

(declare-fun b!1500766 () Bool)

(declare-fun res!1021840 () Bool)

(assert (=> b!1500766 (=> (not res!1021840) (not e!839690))))

(assert (=> b!1500766 (= res!1021840 (not (= (select (arr!48310 a!2850) index!625) (select (arr!48310 a!2850) j!87))))))

(declare-fun b!1500767 () Bool)

(declare-fun res!1021844 () Bool)

(assert (=> b!1500767 (=> (not res!1021844) (not e!839690))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500767 (= res!1021844 (validKeyInArray!0 (select (arr!48310 a!2850) j!87)))))

(declare-fun b!1500768 () Bool)

(declare-fun res!1021838 () Bool)

(assert (=> b!1500768 (=> (not res!1021838) (not e!839690))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12520 0))(
  ( (MissingZero!12520 (index!52472 (_ BitVec 32))) (Found!12520 (index!52473 (_ BitVec 32))) (Intermediate!12520 (undefined!13332 Bool) (index!52474 (_ BitVec 32)) (x!134138 (_ BitVec 32))) (Undefined!12520) (MissingVacant!12520 (index!52475 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100101 (_ BitVec 32)) SeekEntryResult!12520)

(assert (=> b!1500768 (= res!1021838 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48310 a!2850) j!87) a!2850 mask!2661) (Found!12520 j!87)))))

(declare-fun res!1021842 () Bool)

(assert (=> start!127720 (=> (not res!1021842) (not e!839690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127720 (= res!1021842 (validMask!0 mask!2661))))

(assert (=> start!127720 e!839690))

(assert (=> start!127720 true))

(declare-fun array_inv!37338 (array!100101) Bool)

(assert (=> start!127720 (array_inv!37338 a!2850)))

(declare-fun b!1500762 () Bool)

(declare-fun res!1021843 () Bool)

(assert (=> b!1500762 (=> (not res!1021843) (not e!839690))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500762 (= res!1021843 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48860 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48860 a!2850)) (= (select (arr!48310 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48310 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48860 a!2850))))))

(declare-fun b!1500769 () Bool)

(declare-fun res!1021841 () Bool)

(assert (=> b!1500769 (=> (not res!1021841) (not e!839690))))

(assert (=> b!1500769 (= res!1021841 (validKeyInArray!0 (select (arr!48310 a!2850) i!996)))))

(declare-fun b!1500770 () Bool)

(assert (=> b!1500770 (= e!839691 false)))

(declare-fun lt!653001 () SeekEntryResult!12520)

(assert (=> b!1500770 (= lt!653001 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653002 vacantBefore!10 (select (arr!48310 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127720 res!1021842) b!1500763))

(assert (= (and b!1500763 res!1021837) b!1500769))

(assert (= (and b!1500769 res!1021841) b!1500767))

(assert (= (and b!1500767 res!1021844) b!1500764))

(assert (= (and b!1500764 res!1021845) b!1500765))

(assert (= (and b!1500765 res!1021846) b!1500762))

(assert (= (and b!1500762 res!1021843) b!1500768))

(assert (= (and b!1500768 res!1021838) b!1500766))

(assert (= (and b!1500766 res!1021840) b!1500761))

(assert (= (and b!1500761 res!1021839) b!1500770))

(declare-fun m!1383955 () Bool)

(assert (=> b!1500769 m!1383955))

(assert (=> b!1500769 m!1383955))

(declare-fun m!1383957 () Bool)

(assert (=> b!1500769 m!1383957))

(declare-fun m!1383959 () Bool)

(assert (=> start!127720 m!1383959))

(declare-fun m!1383961 () Bool)

(assert (=> start!127720 m!1383961))

(declare-fun m!1383963 () Bool)

(assert (=> b!1500765 m!1383963))

(declare-fun m!1383965 () Bool)

(assert (=> b!1500767 m!1383965))

(assert (=> b!1500767 m!1383965))

(declare-fun m!1383967 () Bool)

(assert (=> b!1500767 m!1383967))

(assert (=> b!1500768 m!1383965))

(assert (=> b!1500768 m!1383965))

(declare-fun m!1383969 () Bool)

(assert (=> b!1500768 m!1383969))

(declare-fun m!1383971 () Bool)

(assert (=> b!1500766 m!1383971))

(assert (=> b!1500766 m!1383965))

(assert (=> b!1500770 m!1383965))

(assert (=> b!1500770 m!1383965))

(declare-fun m!1383973 () Bool)

(assert (=> b!1500770 m!1383973))

(declare-fun m!1383975 () Bool)

(assert (=> b!1500761 m!1383975))

(declare-fun m!1383977 () Bool)

(assert (=> b!1500762 m!1383977))

(declare-fun m!1383979 () Bool)

(assert (=> b!1500762 m!1383979))

(declare-fun m!1383981 () Bool)

(assert (=> b!1500762 m!1383981))

(declare-fun m!1383983 () Bool)

(assert (=> b!1500764 m!1383983))

(push 1)

(assert (not b!1500770))

(assert (not b!1500767))

(assert (not b!1500769))

(assert (not b!1500761))

(assert (not b!1500768))

(assert (not b!1500765))

(assert (not start!127720))

(assert (not b!1500764))

(check-sat)

