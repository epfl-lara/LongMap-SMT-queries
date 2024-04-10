; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127658 () Bool)

(assert start!127658)

(declare-fun b!1499831 () Bool)

(declare-fun res!1020915 () Bool)

(declare-fun e!839411 () Bool)

(assert (=> b!1499831 (=> (not res!1020915) (not e!839411))))

(declare-datatypes ((array!100039 0))(
  ( (array!100040 (arr!48279 (Array (_ BitVec 32) (_ BitVec 64))) (size!48829 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100039)

(declare-datatypes ((List!34771 0))(
  ( (Nil!34768) (Cons!34767 (h!36164 (_ BitVec 64)) (t!49465 List!34771)) )
))
(declare-fun arrayNoDuplicates!0 (array!100039 (_ BitVec 32) List!34771) Bool)

(assert (=> b!1499831 (= res!1020915 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34768))))

(declare-fun b!1499832 () Bool)

(declare-fun res!1020911 () Bool)

(assert (=> b!1499832 (=> (not res!1020911) (not e!839411))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100039 (_ BitVec 32)) Bool)

(assert (=> b!1499832 (= res!1020911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499833 () Bool)

(declare-fun res!1020908 () Bool)

(assert (=> b!1499833 (=> (not res!1020908) (not e!839411))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12489 0))(
  ( (MissingZero!12489 (index!52348 (_ BitVec 32))) (Found!12489 (index!52349 (_ BitVec 32))) (Intermediate!12489 (undefined!13301 Bool) (index!52350 (_ BitVec 32)) (x!134027 (_ BitVec 32))) (Undefined!12489) (MissingVacant!12489 (index!52351 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100039 (_ BitVec 32)) SeekEntryResult!12489)

(assert (=> b!1499833 (= res!1020908 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48279 a!2850) j!87) a!2850 mask!2661) (Found!12489 j!87)))))

(declare-fun b!1499834 () Bool)

(declare-fun res!1020907 () Bool)

(assert (=> b!1499834 (=> (not res!1020907) (not e!839411))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1499834 (= res!1020907 (and (= (size!48829 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48829 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48829 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499835 () Bool)

(declare-fun res!1020910 () Bool)

(assert (=> b!1499835 (=> (not res!1020910) (not e!839411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499835 (= res!1020910 (validKeyInArray!0 (select (arr!48279 a!2850) i!996)))))

(declare-fun b!1499836 () Bool)

(declare-fun e!839412 () Bool)

(assert (=> b!1499836 (= e!839412 false)))

(declare-fun lt!652816 () (_ BitVec 32))

(declare-fun lt!652815 () SeekEntryResult!12489)

(assert (=> b!1499836 (= lt!652815 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652816 vacantBefore!10 (select (arr!48279 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499837 () Bool)

(assert (=> b!1499837 (= e!839411 e!839412)))

(declare-fun res!1020909 () Bool)

(assert (=> b!1499837 (=> (not res!1020909) (not e!839412))))

(assert (=> b!1499837 (= res!1020909 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652816 #b00000000000000000000000000000000) (bvslt lt!652816 (size!48829 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499837 (= lt!652816 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499838 () Bool)

(declare-fun res!1020913 () Bool)

(assert (=> b!1499838 (=> (not res!1020913) (not e!839411))))

(assert (=> b!1499838 (= res!1020913 (not (= (select (arr!48279 a!2850) index!625) (select (arr!48279 a!2850) j!87))))))

(declare-fun b!1499839 () Bool)

(declare-fun res!1020914 () Bool)

(assert (=> b!1499839 (=> (not res!1020914) (not e!839411))))

(assert (=> b!1499839 (= res!1020914 (validKeyInArray!0 (select (arr!48279 a!2850) j!87)))))

(declare-fun b!1499840 () Bool)

(declare-fun res!1020916 () Bool)

(assert (=> b!1499840 (=> (not res!1020916) (not e!839411))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499840 (= res!1020916 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48829 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48829 a!2850)) (= (select (arr!48279 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48279 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48829 a!2850))))))

(declare-fun res!1020912 () Bool)

(assert (=> start!127658 (=> (not res!1020912) (not e!839411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127658 (= res!1020912 (validMask!0 mask!2661))))

(assert (=> start!127658 e!839411))

(assert (=> start!127658 true))

(declare-fun array_inv!37307 (array!100039) Bool)

(assert (=> start!127658 (array_inv!37307 a!2850)))

(assert (= (and start!127658 res!1020912) b!1499834))

(assert (= (and b!1499834 res!1020907) b!1499835))

(assert (= (and b!1499835 res!1020910) b!1499839))

(assert (= (and b!1499839 res!1020914) b!1499832))

(assert (= (and b!1499832 res!1020911) b!1499831))

(assert (= (and b!1499831 res!1020915) b!1499840))

(assert (= (and b!1499840 res!1020916) b!1499833))

(assert (= (and b!1499833 res!1020908) b!1499838))

(assert (= (and b!1499838 res!1020913) b!1499837))

(assert (= (and b!1499837 res!1020909) b!1499836))

(declare-fun m!1383025 () Bool)

(assert (=> b!1499831 m!1383025))

(declare-fun m!1383027 () Bool)

(assert (=> b!1499835 m!1383027))

(assert (=> b!1499835 m!1383027))

(declare-fun m!1383029 () Bool)

(assert (=> b!1499835 m!1383029))

(declare-fun m!1383031 () Bool)

(assert (=> b!1499839 m!1383031))

(assert (=> b!1499839 m!1383031))

(declare-fun m!1383033 () Bool)

(assert (=> b!1499839 m!1383033))

(assert (=> b!1499833 m!1383031))

(assert (=> b!1499833 m!1383031))

(declare-fun m!1383035 () Bool)

(assert (=> b!1499833 m!1383035))

(declare-fun m!1383037 () Bool)

(assert (=> b!1499838 m!1383037))

(assert (=> b!1499838 m!1383031))

(assert (=> b!1499836 m!1383031))

(assert (=> b!1499836 m!1383031))

(declare-fun m!1383039 () Bool)

(assert (=> b!1499836 m!1383039))

(declare-fun m!1383041 () Bool)

(assert (=> start!127658 m!1383041))

(declare-fun m!1383043 () Bool)

(assert (=> start!127658 m!1383043))

(declare-fun m!1383045 () Bool)

(assert (=> b!1499832 m!1383045))

(declare-fun m!1383047 () Bool)

(assert (=> b!1499837 m!1383047))

(declare-fun m!1383049 () Bool)

(assert (=> b!1499840 m!1383049))

(declare-fun m!1383051 () Bool)

(assert (=> b!1499840 m!1383051))

(declare-fun m!1383053 () Bool)

(assert (=> b!1499840 m!1383053))

(check-sat (not b!1499835) (not b!1499839) (not b!1499832) (not b!1499837) (not b!1499831) (not b!1499836) (not b!1499833) (not start!127658))
(check-sat)
