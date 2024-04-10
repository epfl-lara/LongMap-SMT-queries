; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127724 () Bool)

(assert start!127724)

(declare-fun b!1500821 () Bool)

(declare-fun res!1021898 () Bool)

(declare-fun e!839708 () Bool)

(assert (=> b!1500821 (=> (not res!1021898) (not e!839708))))

(declare-datatypes ((array!100105 0))(
  ( (array!100106 (arr!48312 (Array (_ BitVec 32) (_ BitVec 64))) (size!48862 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100105)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500821 (= res!1021898 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48862 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48862 a!2850)) (= (select (arr!48312 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48312 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48862 a!2850))))))

(declare-fun b!1500822 () Bool)

(declare-fun res!1021903 () Bool)

(assert (=> b!1500822 (=> (not res!1021903) (not e!839708))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12522 0))(
  ( (MissingZero!12522 (index!52480 (_ BitVec 32))) (Found!12522 (index!52481 (_ BitVec 32))) (Intermediate!12522 (undefined!13334 Bool) (index!52482 (_ BitVec 32)) (x!134148 (_ BitVec 32))) (Undefined!12522) (MissingVacant!12522 (index!52483 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100105 (_ BitVec 32)) SeekEntryResult!12522)

(assert (=> b!1500822 (= res!1021903 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48312 a!2850) j!87) a!2850 mask!2661) (Found!12522 j!87)))))

(declare-fun b!1500823 () Bool)

(declare-fun res!1021904 () Bool)

(assert (=> b!1500823 (=> (not res!1021904) (not e!839708))))

(assert (=> b!1500823 (= res!1021904 (not (= (select (arr!48312 a!2850) index!625) (select (arr!48312 a!2850) j!87))))))

(declare-fun b!1500824 () Bool)

(declare-fun res!1021897 () Bool)

(assert (=> b!1500824 (=> (not res!1021897) (not e!839708))))

(declare-datatypes ((List!34804 0))(
  ( (Nil!34801) (Cons!34800 (h!36197 (_ BitVec 64)) (t!49498 List!34804)) )
))
(declare-fun arrayNoDuplicates!0 (array!100105 (_ BitVec 32) List!34804) Bool)

(assert (=> b!1500824 (= res!1021897 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34801))))

(declare-fun b!1500825 () Bool)

(declare-fun res!1021905 () Bool)

(assert (=> b!1500825 (=> (not res!1021905) (not e!839708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100105 (_ BitVec 32)) Bool)

(assert (=> b!1500825 (= res!1021905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1021906 () Bool)

(assert (=> start!127724 (=> (not res!1021906) (not e!839708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127724 (= res!1021906 (validMask!0 mask!2661))))

(assert (=> start!127724 e!839708))

(assert (=> start!127724 true))

(declare-fun array_inv!37340 (array!100105) Bool)

(assert (=> start!127724 (array_inv!37340 a!2850)))

(declare-fun b!1500826 () Bool)

(declare-fun res!1021902 () Bool)

(assert (=> b!1500826 (=> (not res!1021902) (not e!839708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500826 (= res!1021902 (validKeyInArray!0 (select (arr!48312 a!2850) i!996)))))

(declare-fun b!1500827 () Bool)

(declare-fun res!1021899 () Bool)

(assert (=> b!1500827 (=> (not res!1021899) (not e!839708))))

(assert (=> b!1500827 (= res!1021899 (and (= (size!48862 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48862 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48862 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500828 () Bool)

(declare-fun e!839710 () Bool)

(assert (=> b!1500828 (= e!839708 e!839710)))

(declare-fun res!1021900 () Bool)

(assert (=> b!1500828 (=> (not res!1021900) (not e!839710))))

(declare-fun lt!653013 () (_ BitVec 32))

(assert (=> b!1500828 (= res!1021900 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653013 #b00000000000000000000000000000000) (bvslt lt!653013 (size!48862 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500828 (= lt!653013 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500829 () Bool)

(declare-fun res!1021901 () Bool)

(assert (=> b!1500829 (=> (not res!1021901) (not e!839708))))

(assert (=> b!1500829 (= res!1021901 (validKeyInArray!0 (select (arr!48312 a!2850) j!87)))))

(declare-fun b!1500830 () Bool)

(assert (=> b!1500830 (= e!839710 false)))

(declare-fun lt!653014 () SeekEntryResult!12522)

(assert (=> b!1500830 (= lt!653014 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653013 vacantBefore!10 (select (arr!48312 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127724 res!1021906) b!1500827))

(assert (= (and b!1500827 res!1021899) b!1500826))

(assert (= (and b!1500826 res!1021902) b!1500829))

(assert (= (and b!1500829 res!1021901) b!1500825))

(assert (= (and b!1500825 res!1021905) b!1500824))

(assert (= (and b!1500824 res!1021897) b!1500821))

(assert (= (and b!1500821 res!1021898) b!1500822))

(assert (= (and b!1500822 res!1021903) b!1500823))

(assert (= (and b!1500823 res!1021904) b!1500828))

(assert (= (and b!1500828 res!1021900) b!1500830))

(declare-fun m!1384015 () Bool)

(assert (=> b!1500828 m!1384015))

(declare-fun m!1384017 () Bool)

(assert (=> b!1500822 m!1384017))

(assert (=> b!1500822 m!1384017))

(declare-fun m!1384019 () Bool)

(assert (=> b!1500822 m!1384019))

(declare-fun m!1384021 () Bool)

(assert (=> start!127724 m!1384021))

(declare-fun m!1384023 () Bool)

(assert (=> start!127724 m!1384023))

(declare-fun m!1384025 () Bool)

(assert (=> b!1500824 m!1384025))

(assert (=> b!1500829 m!1384017))

(assert (=> b!1500829 m!1384017))

(declare-fun m!1384027 () Bool)

(assert (=> b!1500829 m!1384027))

(declare-fun m!1384029 () Bool)

(assert (=> b!1500821 m!1384029))

(declare-fun m!1384031 () Bool)

(assert (=> b!1500821 m!1384031))

(declare-fun m!1384033 () Bool)

(assert (=> b!1500821 m!1384033))

(assert (=> b!1500830 m!1384017))

(assert (=> b!1500830 m!1384017))

(declare-fun m!1384035 () Bool)

(assert (=> b!1500830 m!1384035))

(declare-fun m!1384037 () Bool)

(assert (=> b!1500825 m!1384037))

(declare-fun m!1384039 () Bool)

(assert (=> b!1500826 m!1384039))

(assert (=> b!1500826 m!1384039))

(declare-fun m!1384041 () Bool)

(assert (=> b!1500826 m!1384041))

(declare-fun m!1384043 () Bool)

(assert (=> b!1500823 m!1384043))

(assert (=> b!1500823 m!1384017))

(check-sat (not b!1500828) (not b!1500829) (not start!127724) (not b!1500826) (not b!1500825) (not b!1500830) (not b!1500824) (not b!1500822))
(check-sat)
