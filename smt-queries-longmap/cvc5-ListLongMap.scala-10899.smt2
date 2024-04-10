; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127656 () Bool)

(assert start!127656)

(declare-fun b!1499801 () Bool)

(declare-fun res!1020882 () Bool)

(declare-fun e!839402 () Bool)

(assert (=> b!1499801 (=> (not res!1020882) (not e!839402))))

(declare-datatypes ((array!100037 0))(
  ( (array!100038 (arr!48278 (Array (_ BitVec 32) (_ BitVec 64))) (size!48828 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100037)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499801 (= res!1020882 (not (= (select (arr!48278 a!2850) index!625) (select (arr!48278 a!2850) j!87))))))

(declare-fun b!1499802 () Bool)

(declare-fun res!1020880 () Bool)

(assert (=> b!1499802 (=> (not res!1020880) (not e!839402))))

(declare-datatypes ((List!34770 0))(
  ( (Nil!34767) (Cons!34766 (h!36163 (_ BitVec 64)) (t!49464 List!34770)) )
))
(declare-fun arrayNoDuplicates!0 (array!100037 (_ BitVec 32) List!34770) Bool)

(assert (=> b!1499802 (= res!1020880 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34767))))

(declare-fun b!1499803 () Bool)

(declare-fun e!839404 () Bool)

(assert (=> b!1499803 (= e!839404 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12488 0))(
  ( (MissingZero!12488 (index!52344 (_ BitVec 32))) (Found!12488 (index!52345 (_ BitVec 32))) (Intermediate!12488 (undefined!13300 Bool) (index!52346 (_ BitVec 32)) (x!134026 (_ BitVec 32))) (Undefined!12488) (MissingVacant!12488 (index!52347 (_ BitVec 32))) )
))
(declare-fun lt!652810 () SeekEntryResult!12488)

(declare-fun lt!652809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100037 (_ BitVec 32)) SeekEntryResult!12488)

(assert (=> b!1499803 (= lt!652810 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652809 vacantBefore!10 (select (arr!48278 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499804 () Bool)

(declare-fun res!1020885 () Bool)

(assert (=> b!1499804 (=> (not res!1020885) (not e!839402))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499804 (= res!1020885 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48828 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48828 a!2850)) (= (select (arr!48278 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48278 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48828 a!2850))))))

(declare-fun b!1499805 () Bool)

(declare-fun res!1020883 () Bool)

(assert (=> b!1499805 (=> (not res!1020883) (not e!839402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499805 (= res!1020883 (validKeyInArray!0 (select (arr!48278 a!2850) j!87)))))

(declare-fun b!1499806 () Bool)

(declare-fun res!1020879 () Bool)

(assert (=> b!1499806 (=> (not res!1020879) (not e!839402))))

(assert (=> b!1499806 (= res!1020879 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48278 a!2850) j!87) a!2850 mask!2661) (Found!12488 j!87)))))

(declare-fun res!1020881 () Bool)

(assert (=> start!127656 (=> (not res!1020881) (not e!839402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127656 (= res!1020881 (validMask!0 mask!2661))))

(assert (=> start!127656 e!839402))

(assert (=> start!127656 true))

(declare-fun array_inv!37306 (array!100037) Bool)

(assert (=> start!127656 (array_inv!37306 a!2850)))

(declare-fun b!1499807 () Bool)

(declare-fun res!1020878 () Bool)

(assert (=> b!1499807 (=> (not res!1020878) (not e!839402))))

(assert (=> b!1499807 (= res!1020878 (validKeyInArray!0 (select (arr!48278 a!2850) i!996)))))

(declare-fun b!1499808 () Bool)

(assert (=> b!1499808 (= e!839402 e!839404)))

(declare-fun res!1020884 () Bool)

(assert (=> b!1499808 (=> (not res!1020884) (not e!839404))))

(assert (=> b!1499808 (= res!1020884 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652809 #b00000000000000000000000000000000) (bvslt lt!652809 (size!48828 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499808 (= lt!652809 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499809 () Bool)

(declare-fun res!1020886 () Bool)

(assert (=> b!1499809 (=> (not res!1020886) (not e!839402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100037 (_ BitVec 32)) Bool)

(assert (=> b!1499809 (= res!1020886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499810 () Bool)

(declare-fun res!1020877 () Bool)

(assert (=> b!1499810 (=> (not res!1020877) (not e!839402))))

(assert (=> b!1499810 (= res!1020877 (and (= (size!48828 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48828 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48828 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127656 res!1020881) b!1499810))

(assert (= (and b!1499810 res!1020877) b!1499807))

(assert (= (and b!1499807 res!1020878) b!1499805))

(assert (= (and b!1499805 res!1020883) b!1499809))

(assert (= (and b!1499809 res!1020886) b!1499802))

(assert (= (and b!1499802 res!1020880) b!1499804))

(assert (= (and b!1499804 res!1020885) b!1499806))

(assert (= (and b!1499806 res!1020879) b!1499801))

(assert (= (and b!1499801 res!1020882) b!1499808))

(assert (= (and b!1499808 res!1020884) b!1499803))

(declare-fun m!1382995 () Bool)

(assert (=> b!1499805 m!1382995))

(assert (=> b!1499805 m!1382995))

(declare-fun m!1382997 () Bool)

(assert (=> b!1499805 m!1382997))

(declare-fun m!1382999 () Bool)

(assert (=> b!1499801 m!1382999))

(assert (=> b!1499801 m!1382995))

(declare-fun m!1383001 () Bool)

(assert (=> start!127656 m!1383001))

(declare-fun m!1383003 () Bool)

(assert (=> start!127656 m!1383003))

(assert (=> b!1499806 m!1382995))

(assert (=> b!1499806 m!1382995))

(declare-fun m!1383005 () Bool)

(assert (=> b!1499806 m!1383005))

(declare-fun m!1383007 () Bool)

(assert (=> b!1499808 m!1383007))

(declare-fun m!1383009 () Bool)

(assert (=> b!1499807 m!1383009))

(assert (=> b!1499807 m!1383009))

(declare-fun m!1383011 () Bool)

(assert (=> b!1499807 m!1383011))

(declare-fun m!1383013 () Bool)

(assert (=> b!1499802 m!1383013))

(declare-fun m!1383015 () Bool)

(assert (=> b!1499809 m!1383015))

(declare-fun m!1383017 () Bool)

(assert (=> b!1499804 m!1383017))

(declare-fun m!1383019 () Bool)

(assert (=> b!1499804 m!1383019))

(declare-fun m!1383021 () Bool)

(assert (=> b!1499804 m!1383021))

(assert (=> b!1499803 m!1382995))

(assert (=> b!1499803 m!1382995))

(declare-fun m!1383023 () Bool)

(assert (=> b!1499803 m!1383023))

(push 1)

