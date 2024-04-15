; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127718 () Bool)

(assert start!127718)

(declare-fun b!1501152 () Bool)

(declare-fun res!1022420 () Bool)

(declare-fun e!839737 () Bool)

(assert (=> b!1501152 (=> (not res!1022420) (not e!839737))))

(declare-datatypes ((array!100093 0))(
  ( (array!100094 (arr!48307 (Array (_ BitVec 32) (_ BitVec 64))) (size!48859 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100093)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501152 (= res!1022420 (validKeyInArray!0 (select (arr!48307 a!2850) j!87)))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun e!839739 () Bool)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun b!1501153 () Bool)

(assert (=> b!1501153 (= e!839739 (not (or (bvslt mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvslt vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661)))))))

(declare-datatypes ((SeekEntryResult!12538 0))(
  ( (MissingZero!12538 (index!52544 (_ BitVec 32))) (Found!12538 (index!52545 (_ BitVec 32))) (Intermediate!12538 (undefined!13350 Bool) (index!52546 (_ BitVec 32)) (x!134215 (_ BitVec 32))) (Undefined!12538) (MissingVacant!12538 (index!52547 (_ BitVec 32))) )
))
(declare-fun lt!652903 () SeekEntryResult!12538)

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!652902 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100093 (_ BitVec 32)) SeekEntryResult!12538)

(assert (=> b!1501153 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652902 vacantAfter!10 (select (store (arr!48307 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100094 (store (arr!48307 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48859 a!2850)) mask!2661) lt!652903)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((Unit!50071 0))(
  ( (Unit!50072) )
))
(declare-fun lt!652901 () Unit!50071)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50071)

(assert (=> b!1501153 (= lt!652901 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!652902 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501154 () Bool)

(declare-fun e!839738 () Bool)

(assert (=> b!1501154 (= e!839737 e!839738)))

(declare-fun res!1022416 () Bool)

(assert (=> b!1501154 (=> (not res!1022416) (not e!839738))))

(assert (=> b!1501154 (= res!1022416 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48307 a!2850) j!87) a!2850 mask!2661) lt!652903))))

(assert (=> b!1501154 (= lt!652903 (Found!12538 j!87))))

(declare-fun res!1022426 () Bool)

(assert (=> start!127718 (=> (not res!1022426) (not e!839737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127718 (= res!1022426 (validMask!0 mask!2661))))

(assert (=> start!127718 e!839737))

(assert (=> start!127718 true))

(declare-fun array_inv!37540 (array!100093) Bool)

(assert (=> start!127718 (array_inv!37540 a!2850)))

(declare-fun b!1501155 () Bool)

(assert (=> b!1501155 (= e!839738 e!839739)))

(declare-fun res!1022421 () Bool)

(assert (=> b!1501155 (=> (not res!1022421) (not e!839739))))

(assert (=> b!1501155 (= res!1022421 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652902 #b00000000000000000000000000000000) (bvslt lt!652902 (size!48859 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501155 (= lt!652902 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501156 () Bool)

(declare-fun res!1022423 () Bool)

(assert (=> b!1501156 (=> (not res!1022423) (not e!839738))))

(assert (=> b!1501156 (= res!1022423 (not (= (select (arr!48307 a!2850) index!625) (select (arr!48307 a!2850) j!87))))))

(declare-fun b!1501157 () Bool)

(declare-fun res!1022418 () Bool)

(assert (=> b!1501157 (=> (not res!1022418) (not e!839737))))

(assert (=> b!1501157 (= res!1022418 (validKeyInArray!0 (select (arr!48307 a!2850) i!996)))))

(declare-fun b!1501158 () Bool)

(declare-fun res!1022422 () Bool)

(assert (=> b!1501158 (=> (not res!1022422) (not e!839737))))

(declare-datatypes ((List!34877 0))(
  ( (Nil!34874) (Cons!34873 (h!36271 (_ BitVec 64)) (t!49563 List!34877)) )
))
(declare-fun arrayNoDuplicates!0 (array!100093 (_ BitVec 32) List!34877) Bool)

(assert (=> b!1501158 (= res!1022422 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34874))))

(declare-fun b!1501159 () Bool)

(declare-fun res!1022417 () Bool)

(assert (=> b!1501159 (=> (not res!1022417) (not e!839737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100093 (_ BitVec 32)) Bool)

(assert (=> b!1501159 (= res!1022417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501160 () Bool)

(declare-fun res!1022425 () Bool)

(assert (=> b!1501160 (=> (not res!1022425) (not e!839737))))

(assert (=> b!1501160 (= res!1022425 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48859 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48859 a!2850)) (= (select (arr!48307 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48307 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48859 a!2850))))))

(declare-fun b!1501161 () Bool)

(declare-fun res!1022424 () Bool)

(assert (=> b!1501161 (=> (not res!1022424) (not e!839737))))

(assert (=> b!1501161 (= res!1022424 (and (= (size!48859 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48859 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48859 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501162 () Bool)

(declare-fun res!1022419 () Bool)

(assert (=> b!1501162 (=> (not res!1022419) (not e!839739))))

(assert (=> b!1501162 (= res!1022419 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652902 vacantBefore!10 (select (arr!48307 a!2850) j!87) a!2850 mask!2661) lt!652903))))

(assert (= (and start!127718 res!1022426) b!1501161))

(assert (= (and b!1501161 res!1022424) b!1501157))

(assert (= (and b!1501157 res!1022418) b!1501152))

(assert (= (and b!1501152 res!1022420) b!1501159))

(assert (= (and b!1501159 res!1022417) b!1501158))

(assert (= (and b!1501158 res!1022422) b!1501160))

(assert (= (and b!1501160 res!1022425) b!1501154))

(assert (= (and b!1501154 res!1022416) b!1501156))

(assert (= (and b!1501156 res!1022423) b!1501155))

(assert (= (and b!1501155 res!1022421) b!1501162))

(assert (= (and b!1501162 res!1022419) b!1501153))

(declare-fun m!1383835 () Bool)

(assert (=> start!127718 m!1383835))

(declare-fun m!1383837 () Bool)

(assert (=> start!127718 m!1383837))

(declare-fun m!1383839 () Bool)

(assert (=> b!1501158 m!1383839))

(declare-fun m!1383841 () Bool)

(assert (=> b!1501154 m!1383841))

(assert (=> b!1501154 m!1383841))

(declare-fun m!1383843 () Bool)

(assert (=> b!1501154 m!1383843))

(declare-fun m!1383845 () Bool)

(assert (=> b!1501157 m!1383845))

(assert (=> b!1501157 m!1383845))

(declare-fun m!1383847 () Bool)

(assert (=> b!1501157 m!1383847))

(declare-fun m!1383849 () Bool)

(assert (=> b!1501160 m!1383849))

(declare-fun m!1383851 () Bool)

(assert (=> b!1501160 m!1383851))

(declare-fun m!1383853 () Bool)

(assert (=> b!1501160 m!1383853))

(declare-fun m!1383855 () Bool)

(assert (=> b!1501155 m!1383855))

(assert (=> b!1501153 m!1383851))

(declare-fun m!1383857 () Bool)

(assert (=> b!1501153 m!1383857))

(assert (=> b!1501153 m!1383857))

(declare-fun m!1383859 () Bool)

(assert (=> b!1501153 m!1383859))

(declare-fun m!1383861 () Bool)

(assert (=> b!1501153 m!1383861))

(declare-fun m!1383863 () Bool)

(assert (=> b!1501156 m!1383863))

(assert (=> b!1501156 m!1383841))

(declare-fun m!1383865 () Bool)

(assert (=> b!1501159 m!1383865))

(assert (=> b!1501152 m!1383841))

(assert (=> b!1501152 m!1383841))

(declare-fun m!1383867 () Bool)

(assert (=> b!1501152 m!1383867))

(assert (=> b!1501162 m!1383841))

(assert (=> b!1501162 m!1383841))

(declare-fun m!1383869 () Bool)

(assert (=> b!1501162 m!1383869))

(check-sat (not b!1501158) (not b!1501154) (not b!1501162) (not start!127718) (not b!1501155) (not b!1501157) (not b!1501153) (not b!1501159) (not b!1501152))
(check-sat)
