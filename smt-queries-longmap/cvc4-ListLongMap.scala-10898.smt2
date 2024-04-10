; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127654 () Bool)

(assert start!127654)

(declare-fun b!1499771 () Bool)

(declare-fun res!1020851 () Bool)

(declare-fun e!839393 () Bool)

(assert (=> b!1499771 (=> (not res!1020851) (not e!839393))))

(declare-datatypes ((array!100035 0))(
  ( (array!100036 (arr!48277 (Array (_ BitVec 32) (_ BitVec 64))) (size!48827 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100035)

(declare-datatypes ((List!34769 0))(
  ( (Nil!34766) (Cons!34765 (h!36162 (_ BitVec 64)) (t!49463 List!34769)) )
))
(declare-fun arrayNoDuplicates!0 (array!100035 (_ BitVec 32) List!34769) Bool)

(assert (=> b!1499771 (= res!1020851 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34766))))

(declare-fun b!1499772 () Bool)

(declare-fun res!1020856 () Bool)

(assert (=> b!1499772 (=> (not res!1020856) (not e!839393))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499772 (= res!1020856 (validKeyInArray!0 (select (arr!48277 a!2850) i!996)))))

(declare-fun b!1499773 () Bool)

(declare-fun res!1020850 () Bool)

(assert (=> b!1499773 (=> (not res!1020850) (not e!839393))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499773 (= res!1020850 (not (= (select (arr!48277 a!2850) index!625) (select (arr!48277 a!2850) j!87))))))

(declare-fun b!1499774 () Bool)

(declare-fun e!839395 () Bool)

(assert (=> b!1499774 (= e!839393 e!839395)))

(declare-fun res!1020855 () Bool)

(assert (=> b!1499774 (=> (not res!1020855) (not e!839395))))

(declare-fun lt!652804 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1499774 (= res!1020855 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652804 #b00000000000000000000000000000000) (bvslt lt!652804 (size!48827 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499774 (= lt!652804 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499775 () Bool)

(declare-fun res!1020848 () Bool)

(assert (=> b!1499775 (=> (not res!1020848) (not e!839393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100035 (_ BitVec 32)) Bool)

(assert (=> b!1499775 (= res!1020848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499776 () Bool)

(declare-fun res!1020852 () Bool)

(assert (=> b!1499776 (=> (not res!1020852) (not e!839393))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12487 0))(
  ( (MissingZero!12487 (index!52340 (_ BitVec 32))) (Found!12487 (index!52341 (_ BitVec 32))) (Intermediate!12487 (undefined!13299 Bool) (index!52342 (_ BitVec 32)) (x!134017 (_ BitVec 32))) (Undefined!12487) (MissingVacant!12487 (index!52343 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100035 (_ BitVec 32)) SeekEntryResult!12487)

(assert (=> b!1499776 (= res!1020852 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48277 a!2850) j!87) a!2850 mask!2661) (Found!12487 j!87)))))

(declare-fun b!1499777 () Bool)

(declare-fun res!1020854 () Bool)

(assert (=> b!1499777 (=> (not res!1020854) (not e!839393))))

(assert (=> b!1499777 (= res!1020854 (validKeyInArray!0 (select (arr!48277 a!2850) j!87)))))

(declare-fun b!1499779 () Bool)

(declare-fun res!1020853 () Bool)

(assert (=> b!1499779 (=> (not res!1020853) (not e!839393))))

(assert (=> b!1499779 (= res!1020853 (and (= (size!48827 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48827 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48827 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499780 () Bool)

(assert (=> b!1499780 (= e!839395 false)))

(declare-fun lt!652803 () SeekEntryResult!12487)

(assert (=> b!1499780 (= lt!652803 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652804 vacantBefore!10 (select (arr!48277 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499778 () Bool)

(declare-fun res!1020847 () Bool)

(assert (=> b!1499778 (=> (not res!1020847) (not e!839393))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499778 (= res!1020847 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48827 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48827 a!2850)) (= (select (arr!48277 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48277 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48827 a!2850))))))

(declare-fun res!1020849 () Bool)

(assert (=> start!127654 (=> (not res!1020849) (not e!839393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127654 (= res!1020849 (validMask!0 mask!2661))))

(assert (=> start!127654 e!839393))

(assert (=> start!127654 true))

(declare-fun array_inv!37305 (array!100035) Bool)

(assert (=> start!127654 (array_inv!37305 a!2850)))

(assert (= (and start!127654 res!1020849) b!1499779))

(assert (= (and b!1499779 res!1020853) b!1499772))

(assert (= (and b!1499772 res!1020856) b!1499777))

(assert (= (and b!1499777 res!1020854) b!1499775))

(assert (= (and b!1499775 res!1020848) b!1499771))

(assert (= (and b!1499771 res!1020851) b!1499778))

(assert (= (and b!1499778 res!1020847) b!1499776))

(assert (= (and b!1499776 res!1020852) b!1499773))

(assert (= (and b!1499773 res!1020850) b!1499774))

(assert (= (and b!1499774 res!1020855) b!1499780))

(declare-fun m!1382965 () Bool)

(assert (=> b!1499778 m!1382965))

(declare-fun m!1382967 () Bool)

(assert (=> b!1499778 m!1382967))

(declare-fun m!1382969 () Bool)

(assert (=> b!1499778 m!1382969))

(declare-fun m!1382971 () Bool)

(assert (=> b!1499780 m!1382971))

(assert (=> b!1499780 m!1382971))

(declare-fun m!1382973 () Bool)

(assert (=> b!1499780 m!1382973))

(assert (=> b!1499777 m!1382971))

(assert (=> b!1499777 m!1382971))

(declare-fun m!1382975 () Bool)

(assert (=> b!1499777 m!1382975))

(declare-fun m!1382977 () Bool)

(assert (=> b!1499774 m!1382977))

(declare-fun m!1382979 () Bool)

(assert (=> b!1499772 m!1382979))

(assert (=> b!1499772 m!1382979))

(declare-fun m!1382981 () Bool)

(assert (=> b!1499772 m!1382981))

(declare-fun m!1382983 () Bool)

(assert (=> b!1499771 m!1382983))

(declare-fun m!1382985 () Bool)

(assert (=> b!1499773 m!1382985))

(assert (=> b!1499773 m!1382971))

(assert (=> b!1499776 m!1382971))

(assert (=> b!1499776 m!1382971))

(declare-fun m!1382987 () Bool)

(assert (=> b!1499776 m!1382987))

(declare-fun m!1382989 () Bool)

(assert (=> b!1499775 m!1382989))

(declare-fun m!1382991 () Bool)

(assert (=> start!127654 m!1382991))

(declare-fun m!1382993 () Bool)

(assert (=> start!127654 m!1382993))

(push 1)

(assert (not b!1499774))

(assert (not b!1499780))

(assert (not b!1499777))

(assert (not start!127654))

(assert (not b!1499776))

(assert (not b!1499772))

(assert (not b!1499771))

(assert (not b!1499775))

(check-sat)

(pop 1)

