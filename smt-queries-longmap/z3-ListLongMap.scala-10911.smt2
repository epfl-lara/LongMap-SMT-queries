; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127730 () Bool)

(assert start!127730)

(declare-fun b!1500911 () Bool)

(declare-fun res!1021990 () Bool)

(declare-fun e!839736 () Bool)

(assert (=> b!1500911 (=> (not res!1021990) (not e!839736))))

(declare-datatypes ((array!100111 0))(
  ( (array!100112 (arr!48315 (Array (_ BitVec 32) (_ BitVec 64))) (size!48865 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100111)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100111 (_ BitVec 32)) Bool)

(assert (=> b!1500911 (= res!1021990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500912 () Bool)

(declare-fun res!1021991 () Bool)

(assert (=> b!1500912 (=> (not res!1021991) (not e!839736))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12525 0))(
  ( (MissingZero!12525 (index!52492 (_ BitVec 32))) (Found!12525 (index!52493 (_ BitVec 32))) (Intermediate!12525 (undefined!13337 Bool) (index!52494 (_ BitVec 32)) (x!134159 (_ BitVec 32))) (Undefined!12525) (MissingVacant!12525 (index!52495 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100111 (_ BitVec 32)) SeekEntryResult!12525)

(assert (=> b!1500912 (= res!1021991 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48315 a!2850) j!87) a!2850 mask!2661) (Found!12525 j!87)))))

(declare-fun b!1500913 () Bool)

(declare-fun res!1021988 () Bool)

(assert (=> b!1500913 (=> (not res!1021988) (not e!839736))))

(declare-datatypes ((List!34807 0))(
  ( (Nil!34804) (Cons!34803 (h!36200 (_ BitVec 64)) (t!49501 List!34807)) )
))
(declare-fun arrayNoDuplicates!0 (array!100111 (_ BitVec 32) List!34807) Bool)

(assert (=> b!1500913 (= res!1021988 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34804))))

(declare-fun b!1500914 () Bool)

(declare-fun e!839735 () Bool)

(assert (=> b!1500914 (= e!839735 false)))

(declare-fun lt!653032 () SeekEntryResult!12525)

(declare-fun lt!653031 () (_ BitVec 32))

(assert (=> b!1500914 (= lt!653032 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653031 vacantBefore!10 (select (arr!48315 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500915 () Bool)

(declare-fun res!1021989 () Bool)

(assert (=> b!1500915 (=> (not res!1021989) (not e!839736))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500915 (= res!1021989 (validKeyInArray!0 (select (arr!48315 a!2850) i!996)))))

(declare-fun b!1500916 () Bool)

(declare-fun res!1021992 () Bool)

(assert (=> b!1500916 (=> (not res!1021992) (not e!839736))))

(assert (=> b!1500916 (= res!1021992 (and (= (size!48865 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48865 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48865 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500917 () Bool)

(declare-fun res!1021996 () Bool)

(assert (=> b!1500917 (=> (not res!1021996) (not e!839736))))

(assert (=> b!1500917 (= res!1021996 (not (= (select (arr!48315 a!2850) index!625) (select (arr!48315 a!2850) j!87))))))

(declare-fun b!1500918 () Bool)

(assert (=> b!1500918 (= e!839736 e!839735)))

(declare-fun res!1021987 () Bool)

(assert (=> b!1500918 (=> (not res!1021987) (not e!839735))))

(assert (=> b!1500918 (= res!1021987 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653031 #b00000000000000000000000000000000) (bvslt lt!653031 (size!48865 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500918 (= lt!653031 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500919 () Bool)

(declare-fun res!1021994 () Bool)

(assert (=> b!1500919 (=> (not res!1021994) (not e!839736))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500919 (= res!1021994 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48865 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48865 a!2850)) (= (select (arr!48315 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48315 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48865 a!2850))))))

(declare-fun res!1021993 () Bool)

(assert (=> start!127730 (=> (not res!1021993) (not e!839736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127730 (= res!1021993 (validMask!0 mask!2661))))

(assert (=> start!127730 e!839736))

(assert (=> start!127730 true))

(declare-fun array_inv!37343 (array!100111) Bool)

(assert (=> start!127730 (array_inv!37343 a!2850)))

(declare-fun b!1500920 () Bool)

(declare-fun res!1021995 () Bool)

(assert (=> b!1500920 (=> (not res!1021995) (not e!839736))))

(assert (=> b!1500920 (= res!1021995 (validKeyInArray!0 (select (arr!48315 a!2850) j!87)))))

(assert (= (and start!127730 res!1021993) b!1500916))

(assert (= (and b!1500916 res!1021992) b!1500915))

(assert (= (and b!1500915 res!1021989) b!1500920))

(assert (= (and b!1500920 res!1021995) b!1500911))

(assert (= (and b!1500911 res!1021990) b!1500913))

(assert (= (and b!1500913 res!1021988) b!1500919))

(assert (= (and b!1500919 res!1021994) b!1500912))

(assert (= (and b!1500912 res!1021991) b!1500917))

(assert (= (and b!1500917 res!1021996) b!1500918))

(assert (= (and b!1500918 res!1021987) b!1500914))

(declare-fun m!1384105 () Bool)

(assert (=> start!127730 m!1384105))

(declare-fun m!1384107 () Bool)

(assert (=> start!127730 m!1384107))

(declare-fun m!1384109 () Bool)

(assert (=> b!1500918 m!1384109))

(declare-fun m!1384111 () Bool)

(assert (=> b!1500911 m!1384111))

(declare-fun m!1384113 () Bool)

(assert (=> b!1500915 m!1384113))

(assert (=> b!1500915 m!1384113))

(declare-fun m!1384115 () Bool)

(assert (=> b!1500915 m!1384115))

(declare-fun m!1384117 () Bool)

(assert (=> b!1500913 m!1384117))

(declare-fun m!1384119 () Bool)

(assert (=> b!1500919 m!1384119))

(declare-fun m!1384121 () Bool)

(assert (=> b!1500919 m!1384121))

(declare-fun m!1384123 () Bool)

(assert (=> b!1500919 m!1384123))

(declare-fun m!1384125 () Bool)

(assert (=> b!1500912 m!1384125))

(assert (=> b!1500912 m!1384125))

(declare-fun m!1384127 () Bool)

(assert (=> b!1500912 m!1384127))

(assert (=> b!1500920 m!1384125))

(assert (=> b!1500920 m!1384125))

(declare-fun m!1384129 () Bool)

(assert (=> b!1500920 m!1384129))

(assert (=> b!1500914 m!1384125))

(assert (=> b!1500914 m!1384125))

(declare-fun m!1384131 () Bool)

(assert (=> b!1500914 m!1384131))

(declare-fun m!1384133 () Bool)

(assert (=> b!1500917 m!1384133))

(assert (=> b!1500917 m!1384125))

(check-sat (not b!1500920) (not b!1500914) (not b!1500918) (not b!1500911) (not b!1500915) (not b!1500913) (not start!127730) (not b!1500912))
(check-sat)
