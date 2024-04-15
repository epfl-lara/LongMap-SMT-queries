; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127646 () Bool)

(assert start!127646)

(declare-fun b!1500025 () Bool)

(declare-fun e!839367 () Bool)

(declare-fun e!839366 () Bool)

(assert (=> b!1500025 (= e!839367 e!839366)))

(declare-fun res!1021289 () Bool)

(assert (=> b!1500025 (=> (not res!1021289) (not e!839366))))

(declare-datatypes ((array!100021 0))(
  ( (array!100022 (arr!48271 (Array (_ BitVec 32) (_ BitVec 64))) (size!48823 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100021)

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!652639 () (_ BitVec 32))

(assert (=> b!1500025 (= res!1021289 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652639 #b00000000000000000000000000000000) (bvslt lt!652639 (size!48823 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500025 (= lt!652639 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500026 () Bool)

(declare-fun res!1021298 () Bool)

(assert (=> b!1500026 (=> (not res!1021298) (not e!839367))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500026 (= res!1021298 (not (= (select (arr!48271 a!2850) index!625) (select (arr!48271 a!2850) j!87))))))

(declare-fun b!1500027 () Bool)

(declare-fun res!1021290 () Bool)

(assert (=> b!1500027 (=> (not res!1021290) (not e!839367))))

(declare-datatypes ((List!34841 0))(
  ( (Nil!34838) (Cons!34837 (h!36235 (_ BitVec 64)) (t!49527 List!34841)) )
))
(declare-fun arrayNoDuplicates!0 (array!100021 (_ BitVec 32) List!34841) Bool)

(assert (=> b!1500027 (= res!1021290 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34838))))

(declare-fun b!1500028 () Bool)

(declare-fun res!1021294 () Bool)

(assert (=> b!1500028 (=> (not res!1021294) (not e!839367))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500028 (= res!1021294 (validKeyInArray!0 (select (arr!48271 a!2850) i!996)))))

(declare-fun b!1500029 () Bool)

(declare-fun res!1021292 () Bool)

(assert (=> b!1500029 (=> (not res!1021292) (not e!839367))))

(assert (=> b!1500029 (= res!1021292 (validKeyInArray!0 (select (arr!48271 a!2850) j!87)))))

(declare-fun res!1021297 () Bool)

(assert (=> start!127646 (=> (not res!1021297) (not e!839367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127646 (= res!1021297 (validMask!0 mask!2661))))

(assert (=> start!127646 e!839367))

(assert (=> start!127646 true))

(declare-fun array_inv!37504 (array!100021) Bool)

(assert (=> start!127646 (array_inv!37504 a!2850)))

(declare-fun b!1500030 () Bool)

(declare-fun res!1021293 () Bool)

(assert (=> b!1500030 (=> (not res!1021293) (not e!839367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100021 (_ BitVec 32)) Bool)

(assert (=> b!1500030 (= res!1021293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500031 () Bool)

(declare-fun res!1021296 () Bool)

(assert (=> b!1500031 (=> (not res!1021296) (not e!839367))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12502 0))(
  ( (MissingZero!12502 (index!52400 (_ BitVec 32))) (Found!12502 (index!52401 (_ BitVec 32))) (Intermediate!12502 (undefined!13314 Bool) (index!52402 (_ BitVec 32)) (x!134083 (_ BitVec 32))) (Undefined!12502) (MissingVacant!12502 (index!52403 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100021 (_ BitVec 32)) SeekEntryResult!12502)

(assert (=> b!1500031 (= res!1021296 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48271 a!2850) j!87) a!2850 mask!2661) (Found!12502 j!87)))))

(declare-fun b!1500032 () Bool)

(declare-fun res!1021295 () Bool)

(assert (=> b!1500032 (=> (not res!1021295) (not e!839367))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500032 (= res!1021295 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48823 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48823 a!2850)) (= (select (arr!48271 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48271 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48823 a!2850))))))

(declare-fun b!1500033 () Bool)

(declare-fun res!1021291 () Bool)

(assert (=> b!1500033 (=> (not res!1021291) (not e!839367))))

(assert (=> b!1500033 (= res!1021291 (and (= (size!48823 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48823 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48823 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500034 () Bool)

(assert (=> b!1500034 (= e!839366 false)))

(declare-fun lt!652638 () SeekEntryResult!12502)

(assert (=> b!1500034 (= lt!652638 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652639 vacantBefore!10 (select (arr!48271 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127646 res!1021297) b!1500033))

(assert (= (and b!1500033 res!1021291) b!1500028))

(assert (= (and b!1500028 res!1021294) b!1500029))

(assert (= (and b!1500029 res!1021292) b!1500030))

(assert (= (and b!1500030 res!1021293) b!1500027))

(assert (= (and b!1500027 res!1021290) b!1500032))

(assert (= (and b!1500032 res!1021295) b!1500031))

(assert (= (and b!1500031 res!1021296) b!1500026))

(assert (= (and b!1500026 res!1021298) b!1500025))

(assert (= (and b!1500025 res!1021289) b!1500034))

(declare-fun m!1382665 () Bool)

(assert (=> b!1500029 m!1382665))

(assert (=> b!1500029 m!1382665))

(declare-fun m!1382667 () Bool)

(assert (=> b!1500029 m!1382667))

(declare-fun m!1382669 () Bool)

(assert (=> b!1500032 m!1382669))

(declare-fun m!1382671 () Bool)

(assert (=> b!1500032 m!1382671))

(declare-fun m!1382673 () Bool)

(assert (=> b!1500032 m!1382673))

(declare-fun m!1382675 () Bool)

(assert (=> b!1500027 m!1382675))

(declare-fun m!1382677 () Bool)

(assert (=> start!127646 m!1382677))

(declare-fun m!1382679 () Bool)

(assert (=> start!127646 m!1382679))

(declare-fun m!1382681 () Bool)

(assert (=> b!1500028 m!1382681))

(assert (=> b!1500028 m!1382681))

(declare-fun m!1382683 () Bool)

(assert (=> b!1500028 m!1382683))

(declare-fun m!1382685 () Bool)

(assert (=> b!1500025 m!1382685))

(assert (=> b!1500034 m!1382665))

(assert (=> b!1500034 m!1382665))

(declare-fun m!1382687 () Bool)

(assert (=> b!1500034 m!1382687))

(declare-fun m!1382689 () Bool)

(assert (=> b!1500026 m!1382689))

(assert (=> b!1500026 m!1382665))

(assert (=> b!1500031 m!1382665))

(assert (=> b!1500031 m!1382665))

(declare-fun m!1382691 () Bool)

(assert (=> b!1500031 m!1382691))

(declare-fun m!1382693 () Bool)

(assert (=> b!1500030 m!1382693))

(check-sat (not b!1500031) (not b!1500028) (not b!1500025) (not b!1500027) (not b!1500034) (not b!1500030) (not b!1500029) (not start!127646))
(check-sat)
