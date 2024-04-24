; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128036 () Bool)

(assert start!128036)

(declare-fun b!1502811 () Bool)

(declare-fun res!1022714 () Bool)

(declare-fun e!840896 () Bool)

(assert (=> b!1502811 (=> (not res!1022714) (not e!840896))))

(declare-datatypes ((array!100231 0))(
  ( (array!100232 (arr!48370 (Array (_ BitVec 32) (_ BitVec 64))) (size!48921 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100231)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1502811 (= res!1022714 (and (= (size!48921 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48921 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48921 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502812 () Bool)

(declare-fun res!1022713 () Bool)

(assert (=> b!1502812 (=> (not res!1022713) (not e!840896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100231 (_ BitVec 32)) Bool)

(assert (=> b!1502812 (= res!1022713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502813 () Bool)

(declare-fun res!1022704 () Bool)

(declare-fun e!840895 () Bool)

(assert (=> b!1502813 (=> (not res!1022704) (not e!840895))))

(declare-datatypes ((SeekEntryResult!12473 0))(
  ( (MissingZero!12473 (index!52284 (_ BitVec 32))) (Found!12473 (index!52285 (_ BitVec 32))) (Intermediate!12473 (undefined!13285 Bool) (index!52286 (_ BitVec 32)) (x!134152 (_ BitVec 32))) (Undefined!12473) (MissingVacant!12473 (index!52287 (_ BitVec 32))) )
))
(declare-fun lt!653711 () SeekEntryResult!12473)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653712 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100231 (_ BitVec 32)) SeekEntryResult!12473)

(assert (=> b!1502813 (= res!1022704 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653712 vacantBefore!10 (select (arr!48370 a!2850) j!87) a!2850 mask!2661) lt!653711))))

(declare-fun b!1502815 () Bool)

(assert (=> b!1502815 (= e!840895 (not true))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502815 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653712 vacantAfter!10 (select (store (arr!48370 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100232 (store (arr!48370 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48921 a!2850)) mask!2661) lt!653711)))

(declare-datatypes ((Unit!50137 0))(
  ( (Unit!50138) )
))
(declare-fun lt!653710 () Unit!50137)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100231 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50137)

(assert (=> b!1502815 (= lt!653710 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653712 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1502816 () Bool)

(declare-fun res!1022707 () Bool)

(declare-fun e!840897 () Bool)

(assert (=> b!1502816 (=> (not res!1022707) (not e!840897))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1502816 (= res!1022707 (not (= (select (arr!48370 a!2850) index!625) (select (arr!48370 a!2850) j!87))))))

(declare-fun b!1502817 () Bool)

(assert (=> b!1502817 (= e!840896 e!840897)))

(declare-fun res!1022708 () Bool)

(assert (=> b!1502817 (=> (not res!1022708) (not e!840897))))

(assert (=> b!1502817 (= res!1022708 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48370 a!2850) j!87) a!2850 mask!2661) lt!653711))))

(assert (=> b!1502817 (= lt!653711 (Found!12473 j!87))))

(declare-fun b!1502818 () Bool)

(declare-fun res!1022709 () Bool)

(assert (=> b!1502818 (=> (not res!1022709) (not e!840896))))

(declare-datatypes ((List!34849 0))(
  ( (Nil!34846) (Cons!34845 (h!36257 (_ BitVec 64)) (t!49535 List!34849)) )
))
(declare-fun arrayNoDuplicates!0 (array!100231 (_ BitVec 32) List!34849) Bool)

(assert (=> b!1502818 (= res!1022709 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34846))))

(declare-fun b!1502819 () Bool)

(declare-fun res!1022706 () Bool)

(assert (=> b!1502819 (=> (not res!1022706) (not e!840896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502819 (= res!1022706 (validKeyInArray!0 (select (arr!48370 a!2850) j!87)))))

(declare-fun res!1022711 () Bool)

(assert (=> start!128036 (=> (not res!1022711) (not e!840896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128036 (= res!1022711 (validMask!0 mask!2661))))

(assert (=> start!128036 e!840896))

(assert (=> start!128036 true))

(declare-fun array_inv!37651 (array!100231) Bool)

(assert (=> start!128036 (array_inv!37651 a!2850)))

(declare-fun b!1502814 () Bool)

(declare-fun res!1022712 () Bool)

(assert (=> b!1502814 (=> (not res!1022712) (not e!840896))))

(assert (=> b!1502814 (= res!1022712 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48921 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48921 a!2850)) (= (select (arr!48370 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48370 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48921 a!2850))))))

(declare-fun b!1502820 () Bool)

(assert (=> b!1502820 (= e!840897 e!840895)))

(declare-fun res!1022705 () Bool)

(assert (=> b!1502820 (=> (not res!1022705) (not e!840895))))

(assert (=> b!1502820 (= res!1022705 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653712 #b00000000000000000000000000000000) (bvslt lt!653712 (size!48921 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502820 (= lt!653712 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1502821 () Bool)

(declare-fun res!1022710 () Bool)

(assert (=> b!1502821 (=> (not res!1022710) (not e!840896))))

(assert (=> b!1502821 (= res!1022710 (validKeyInArray!0 (select (arr!48370 a!2850) i!996)))))

(assert (= (and start!128036 res!1022711) b!1502811))

(assert (= (and b!1502811 res!1022714) b!1502821))

(assert (= (and b!1502821 res!1022710) b!1502819))

(assert (= (and b!1502819 res!1022706) b!1502812))

(assert (= (and b!1502812 res!1022713) b!1502818))

(assert (= (and b!1502818 res!1022709) b!1502814))

(assert (= (and b!1502814 res!1022712) b!1502817))

(assert (= (and b!1502817 res!1022708) b!1502816))

(assert (= (and b!1502816 res!1022707) b!1502820))

(assert (= (and b!1502820 res!1022705) b!1502813))

(assert (= (and b!1502813 res!1022704) b!1502815))

(declare-fun m!1385953 () Bool)

(assert (=> b!1502821 m!1385953))

(assert (=> b!1502821 m!1385953))

(declare-fun m!1385955 () Bool)

(assert (=> b!1502821 m!1385955))

(declare-fun m!1385957 () Bool)

(assert (=> b!1502816 m!1385957))

(declare-fun m!1385959 () Bool)

(assert (=> b!1502816 m!1385959))

(declare-fun m!1385961 () Bool)

(assert (=> b!1502812 m!1385961))

(declare-fun m!1385963 () Bool)

(assert (=> b!1502818 m!1385963))

(declare-fun m!1385965 () Bool)

(assert (=> b!1502820 m!1385965))

(declare-fun m!1385967 () Bool)

(assert (=> b!1502815 m!1385967))

(declare-fun m!1385969 () Bool)

(assert (=> b!1502815 m!1385969))

(assert (=> b!1502815 m!1385969))

(declare-fun m!1385971 () Bool)

(assert (=> b!1502815 m!1385971))

(declare-fun m!1385973 () Bool)

(assert (=> b!1502815 m!1385973))

(assert (=> b!1502819 m!1385959))

(assert (=> b!1502819 m!1385959))

(declare-fun m!1385975 () Bool)

(assert (=> b!1502819 m!1385975))

(declare-fun m!1385977 () Bool)

(assert (=> start!128036 m!1385977))

(declare-fun m!1385979 () Bool)

(assert (=> start!128036 m!1385979))

(assert (=> b!1502813 m!1385959))

(assert (=> b!1502813 m!1385959))

(declare-fun m!1385981 () Bool)

(assert (=> b!1502813 m!1385981))

(assert (=> b!1502817 m!1385959))

(assert (=> b!1502817 m!1385959))

(declare-fun m!1385983 () Bool)

(assert (=> b!1502817 m!1385983))

(declare-fun m!1385985 () Bool)

(assert (=> b!1502814 m!1385985))

(assert (=> b!1502814 m!1385967))

(declare-fun m!1385987 () Bool)

(assert (=> b!1502814 m!1385987))

(check-sat (not b!1502813) (not b!1502817) (not b!1502819) (not start!128036) (not b!1502812) (not b!1502820) (not b!1502818) (not b!1502821) (not b!1502815))
(check-sat)
