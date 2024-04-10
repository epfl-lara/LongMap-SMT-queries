; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128166 () Bool)

(assert start!128166)

(declare-fun res!1025334 () Bool)

(declare-fun e!841105 () Bool)

(assert (=> start!128166 (=> (not res!1025334) (not e!841105))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128166 (= res!1025334 (validMask!0 mask!2661))))

(assert (=> start!128166 e!841105))

(assert (=> start!128166 true))

(declare-datatypes ((array!100364 0))(
  ( (array!100365 (arr!48434 (Array (_ BitVec 32) (_ BitVec 64))) (size!48984 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100364)

(declare-fun array_inv!37462 (array!100364) Bool)

(assert (=> start!128166 (array_inv!37462 a!2850)))

(declare-fun b!1504744 () Bool)

(declare-fun res!1025339 () Bool)

(assert (=> b!1504744 (=> (not res!1025339) (not e!841105))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504744 (= res!1025339 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48984 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48984 a!2850)) (= (select (arr!48434 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48434 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48984 a!2850))))))

(declare-fun b!1504745 () Bool)

(declare-fun res!1025338 () Bool)

(declare-fun e!841107 () Bool)

(assert (=> b!1504745 (=> (not res!1025338) (not e!841107))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1504745 (= res!1025338 (not (= (select (arr!48434 a!2850) index!625) (select (arr!48434 a!2850) j!87))))))

(declare-fun b!1504746 () Bool)

(declare-fun e!841106 () Bool)

(assert (=> b!1504746 (= e!841106 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!647)) (bvsub #b01111111111111111111111111111110 x!647)))))

(declare-fun b!1504747 () Bool)

(assert (=> b!1504747 (= e!841105 e!841107)))

(declare-fun res!1025343 () Bool)

(assert (=> b!1504747 (=> (not res!1025343) (not e!841107))))

(declare-datatypes ((SeekEntryResult!12632 0))(
  ( (MissingZero!12632 (index!52920 (_ BitVec 32))) (Found!12632 (index!52921 (_ BitVec 32))) (Intermediate!12632 (undefined!13444 Bool) (index!52922 (_ BitVec 32)) (x!134610 (_ BitVec 32))) (Undefined!12632) (MissingVacant!12632 (index!52923 (_ BitVec 32))) )
))
(declare-fun lt!653802 () SeekEntryResult!12632)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100364 (_ BitVec 32)) SeekEntryResult!12632)

(assert (=> b!1504747 (= res!1025343 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48434 a!2850) j!87) a!2850 mask!2661) lt!653802))))

(assert (=> b!1504747 (= lt!653802 (Found!12632 j!87))))

(declare-fun b!1504748 () Bool)

(declare-fun res!1025341 () Bool)

(assert (=> b!1504748 (=> (not res!1025341) (not e!841105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504748 (= res!1025341 (validKeyInArray!0 (select (arr!48434 a!2850) j!87)))))

(declare-fun b!1504749 () Bool)

(declare-fun res!1025335 () Bool)

(assert (=> b!1504749 (=> (not res!1025335) (not e!841105))))

(declare-datatypes ((List!34926 0))(
  ( (Nil!34923) (Cons!34922 (h!36319 (_ BitVec 64)) (t!49620 List!34926)) )
))
(declare-fun arrayNoDuplicates!0 (array!100364 (_ BitVec 32) List!34926) Bool)

(assert (=> b!1504749 (= res!1025335 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34923))))

(declare-fun b!1504750 () Bool)

(declare-fun res!1025336 () Bool)

(assert (=> b!1504750 (=> (not res!1025336) (not e!841105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100364 (_ BitVec 32)) Bool)

(assert (=> b!1504750 (= res!1025336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504751 () Bool)

(declare-fun res!1025344 () Bool)

(assert (=> b!1504751 (=> (not res!1025344) (not e!841105))))

(assert (=> b!1504751 (= res!1025344 (and (= (size!48984 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48984 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48984 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504752 () Bool)

(declare-fun res!1025340 () Bool)

(assert (=> b!1504752 (=> (not res!1025340) (not e!841106))))

(declare-fun lt!653803 () (_ BitVec 32))

(assert (=> b!1504752 (= res!1025340 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653803 vacantBefore!10 (select (arr!48434 a!2850) j!87) a!2850 mask!2661) lt!653802))))

(declare-fun b!1504753 () Bool)

(assert (=> b!1504753 (= e!841107 e!841106)))

(declare-fun res!1025342 () Bool)

(assert (=> b!1504753 (=> (not res!1025342) (not e!841106))))

(assert (=> b!1504753 (= res!1025342 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653803 #b00000000000000000000000000000000) (bvslt lt!653803 (size!48984 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504753 (= lt!653803 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504754 () Bool)

(declare-fun res!1025337 () Bool)

(assert (=> b!1504754 (=> (not res!1025337) (not e!841105))))

(assert (=> b!1504754 (= res!1025337 (validKeyInArray!0 (select (arr!48434 a!2850) i!996)))))

(assert (= (and start!128166 res!1025334) b!1504751))

(assert (= (and b!1504751 res!1025344) b!1504754))

(assert (= (and b!1504754 res!1025337) b!1504748))

(assert (= (and b!1504748 res!1025341) b!1504750))

(assert (= (and b!1504750 res!1025336) b!1504749))

(assert (= (and b!1504749 res!1025335) b!1504744))

(assert (= (and b!1504744 res!1025339) b!1504747))

(assert (= (and b!1504747 res!1025343) b!1504745))

(assert (= (and b!1504745 res!1025338) b!1504753))

(assert (= (and b!1504753 res!1025342) b!1504752))

(assert (= (and b!1504752 res!1025340) b!1504746))

(declare-fun m!1387843 () Bool)

(assert (=> start!128166 m!1387843))

(declare-fun m!1387845 () Bool)

(assert (=> start!128166 m!1387845))

(declare-fun m!1387847 () Bool)

(assert (=> b!1504745 m!1387847))

(declare-fun m!1387849 () Bool)

(assert (=> b!1504745 m!1387849))

(assert (=> b!1504748 m!1387849))

(assert (=> b!1504748 m!1387849))

(declare-fun m!1387851 () Bool)

(assert (=> b!1504748 m!1387851))

(declare-fun m!1387853 () Bool)

(assert (=> b!1504754 m!1387853))

(assert (=> b!1504754 m!1387853))

(declare-fun m!1387855 () Bool)

(assert (=> b!1504754 m!1387855))

(assert (=> b!1504752 m!1387849))

(assert (=> b!1504752 m!1387849))

(declare-fun m!1387857 () Bool)

(assert (=> b!1504752 m!1387857))

(declare-fun m!1387859 () Bool)

(assert (=> b!1504750 m!1387859))

(assert (=> b!1504747 m!1387849))

(assert (=> b!1504747 m!1387849))

(declare-fun m!1387861 () Bool)

(assert (=> b!1504747 m!1387861))

(declare-fun m!1387863 () Bool)

(assert (=> b!1504749 m!1387863))

(declare-fun m!1387865 () Bool)

(assert (=> b!1504753 m!1387865))

(declare-fun m!1387867 () Bool)

(assert (=> b!1504744 m!1387867))

(declare-fun m!1387869 () Bool)

(assert (=> b!1504744 m!1387869))

(declare-fun m!1387871 () Bool)

(assert (=> b!1504744 m!1387871))

(push 1)

(assert (not b!1504747))

(assert (not start!128166))

(assert (not b!1504752))

(assert (not b!1504748))

(assert (not b!1504754))

(assert (not b!1504750))

(assert (not b!1504753))

(assert (not b!1504749))

(check-sat)

(pop 1)

(push 1)

(check-sat)

