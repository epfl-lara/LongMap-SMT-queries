; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128042 () Bool)

(assert start!128042)

(declare-fun b!1502910 () Bool)

(declare-fun e!840933 () Bool)

(declare-fun e!840932 () Bool)

(assert (=> b!1502910 (= e!840933 e!840932)))

(declare-fun res!1022811 () Bool)

(assert (=> b!1502910 (=> (not res!1022811) (not e!840932))))

(declare-datatypes ((array!100237 0))(
  ( (array!100238 (arr!48373 (Array (_ BitVec 32) (_ BitVec 64))) (size!48924 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100237)

(declare-fun lt!653737 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1502910 (= res!1022811 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653737 #b00000000000000000000000000000000) (bvslt lt!653737 (size!48924 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502910 (= lt!653737 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1502911 () Bool)

(declare-fun res!1022810 () Bool)

(declare-fun e!840931 () Bool)

(assert (=> b!1502911 (=> (not res!1022810) (not e!840931))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502911 (= res!1022810 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48924 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48924 a!2850)) (= (select (arr!48373 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48373 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48924 a!2850))))))

(declare-fun res!1022813 () Bool)

(assert (=> start!128042 (=> (not res!1022813) (not e!840931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128042 (= res!1022813 (validMask!0 mask!2661))))

(assert (=> start!128042 e!840931))

(assert (=> start!128042 true))

(declare-fun array_inv!37654 (array!100237) Bool)

(assert (=> start!128042 (array_inv!37654 a!2850)))

(declare-fun b!1502912 () Bool)

(declare-fun res!1022812 () Bool)

(assert (=> b!1502912 (=> (not res!1022812) (not e!840933))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502912 (= res!1022812 (not (= (select (arr!48373 a!2850) index!625) (select (arr!48373 a!2850) j!87))))))

(declare-fun b!1502913 () Bool)

(assert (=> b!1502913 (= e!840931 e!840933)))

(declare-fun res!1022807 () Bool)

(assert (=> b!1502913 (=> (not res!1022807) (not e!840933))))

(declare-datatypes ((SeekEntryResult!12476 0))(
  ( (MissingZero!12476 (index!52296 (_ BitVec 32))) (Found!12476 (index!52297 (_ BitVec 32))) (Intermediate!12476 (undefined!13288 Bool) (index!52298 (_ BitVec 32)) (x!134163 (_ BitVec 32))) (Undefined!12476) (MissingVacant!12476 (index!52299 (_ BitVec 32))) )
))
(declare-fun lt!653738 () SeekEntryResult!12476)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100237 (_ BitVec 32)) SeekEntryResult!12476)

(assert (=> b!1502913 (= res!1022807 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48373 a!2850) j!87) a!2850 mask!2661) lt!653738))))

(assert (=> b!1502913 (= lt!653738 (Found!12476 j!87))))

(declare-fun b!1502914 () Bool)

(assert (=> b!1502914 (= e!840932 (not (bvsge mask!2661 #b00000000000000000000000000000000)))))

(assert (=> b!1502914 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653737 vacantAfter!10 (select (store (arr!48373 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100238 (store (arr!48373 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48924 a!2850)) mask!2661) lt!653738)))

(declare-datatypes ((Unit!50143 0))(
  ( (Unit!50144) )
))
(declare-fun lt!653739 () Unit!50143)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100237 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50143)

(assert (=> b!1502914 (= lt!653739 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653737 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1502915 () Bool)

(declare-fun res!1022805 () Bool)

(assert (=> b!1502915 (=> (not res!1022805) (not e!840931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502915 (= res!1022805 (validKeyInArray!0 (select (arr!48373 a!2850) i!996)))))

(declare-fun b!1502916 () Bool)

(declare-fun res!1022808 () Bool)

(assert (=> b!1502916 (=> (not res!1022808) (not e!840931))))

(declare-datatypes ((List!34852 0))(
  ( (Nil!34849) (Cons!34848 (h!36260 (_ BitVec 64)) (t!49538 List!34852)) )
))
(declare-fun arrayNoDuplicates!0 (array!100237 (_ BitVec 32) List!34852) Bool)

(assert (=> b!1502916 (= res!1022808 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34849))))

(declare-fun b!1502917 () Bool)

(declare-fun res!1022809 () Bool)

(assert (=> b!1502917 (=> (not res!1022809) (not e!840932))))

(assert (=> b!1502917 (= res!1022809 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653737 vacantBefore!10 (select (arr!48373 a!2850) j!87) a!2850 mask!2661) lt!653738))))

(declare-fun b!1502918 () Bool)

(declare-fun res!1022804 () Bool)

(assert (=> b!1502918 (=> (not res!1022804) (not e!840931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100237 (_ BitVec 32)) Bool)

(assert (=> b!1502918 (= res!1022804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502919 () Bool)

(declare-fun res!1022806 () Bool)

(assert (=> b!1502919 (=> (not res!1022806) (not e!840931))))

(assert (=> b!1502919 (= res!1022806 (and (= (size!48924 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48924 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48924 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502920 () Bool)

(declare-fun res!1022803 () Bool)

(assert (=> b!1502920 (=> (not res!1022803) (not e!840931))))

(assert (=> b!1502920 (= res!1022803 (validKeyInArray!0 (select (arr!48373 a!2850) j!87)))))

(assert (= (and start!128042 res!1022813) b!1502919))

(assert (= (and b!1502919 res!1022806) b!1502915))

(assert (= (and b!1502915 res!1022805) b!1502920))

(assert (= (and b!1502920 res!1022803) b!1502918))

(assert (= (and b!1502918 res!1022804) b!1502916))

(assert (= (and b!1502916 res!1022808) b!1502911))

(assert (= (and b!1502911 res!1022810) b!1502913))

(assert (= (and b!1502913 res!1022807) b!1502912))

(assert (= (and b!1502912 res!1022812) b!1502910))

(assert (= (and b!1502910 res!1022811) b!1502917))

(assert (= (and b!1502917 res!1022809) b!1502914))

(declare-fun m!1386061 () Bool)

(assert (=> b!1502912 m!1386061))

(declare-fun m!1386063 () Bool)

(assert (=> b!1502912 m!1386063))

(declare-fun m!1386065 () Bool)

(assert (=> b!1502911 m!1386065))

(declare-fun m!1386067 () Bool)

(assert (=> b!1502911 m!1386067))

(declare-fun m!1386069 () Bool)

(assert (=> b!1502911 m!1386069))

(assert (=> b!1502920 m!1386063))

(assert (=> b!1502920 m!1386063))

(declare-fun m!1386071 () Bool)

(assert (=> b!1502920 m!1386071))

(declare-fun m!1386073 () Bool)

(assert (=> b!1502915 m!1386073))

(assert (=> b!1502915 m!1386073))

(declare-fun m!1386075 () Bool)

(assert (=> b!1502915 m!1386075))

(assert (=> b!1502917 m!1386063))

(assert (=> b!1502917 m!1386063))

(declare-fun m!1386077 () Bool)

(assert (=> b!1502917 m!1386077))

(declare-fun m!1386079 () Bool)

(assert (=> b!1502916 m!1386079))

(declare-fun m!1386081 () Bool)

(assert (=> b!1502910 m!1386081))

(assert (=> b!1502914 m!1386067))

(declare-fun m!1386083 () Bool)

(assert (=> b!1502914 m!1386083))

(assert (=> b!1502914 m!1386083))

(declare-fun m!1386085 () Bool)

(assert (=> b!1502914 m!1386085))

(declare-fun m!1386087 () Bool)

(assert (=> b!1502914 m!1386087))

(declare-fun m!1386089 () Bool)

(assert (=> start!128042 m!1386089))

(declare-fun m!1386091 () Bool)

(assert (=> start!128042 m!1386091))

(assert (=> b!1502913 m!1386063))

(assert (=> b!1502913 m!1386063))

(declare-fun m!1386093 () Bool)

(assert (=> b!1502913 m!1386093))

(declare-fun m!1386095 () Bool)

(assert (=> b!1502918 m!1386095))

(check-sat (not b!1502913) (not b!1502917) (not b!1502914) (not b!1502916) (not b!1502920) (not b!1502918) (not start!128042) (not b!1502910) (not b!1502915))
(check-sat)
