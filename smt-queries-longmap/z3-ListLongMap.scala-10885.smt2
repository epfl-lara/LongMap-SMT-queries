; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127574 () Bool)

(assert start!127574)

(declare-fun b!1498727 () Bool)

(declare-fun res!1019805 () Bool)

(declare-fun e!839100 () Bool)

(assert (=> b!1498727 (=> (not res!1019805) (not e!839100))))

(declare-datatypes ((array!99955 0))(
  ( (array!99956 (arr!48237 (Array (_ BitVec 32) (_ BitVec 64))) (size!48787 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99955)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498727 (= res!1019805 (validKeyInArray!0 (select (arr!48237 a!2850) j!87)))))

(declare-fun b!1498728 () Bool)

(declare-fun res!1019807 () Bool)

(assert (=> b!1498728 (=> (not res!1019807) (not e!839100))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498728 (= res!1019807 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48787 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48787 a!2850)) (= (select (arr!48237 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48237 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48787 a!2850))))))

(declare-fun b!1498729 () Bool)

(declare-fun res!1019803 () Bool)

(assert (=> b!1498729 (=> (not res!1019803) (not e!839100))))

(declare-datatypes ((List!34729 0))(
  ( (Nil!34726) (Cons!34725 (h!36122 (_ BitVec 64)) (t!49423 List!34729)) )
))
(declare-fun arrayNoDuplicates!0 (array!99955 (_ BitVec 32) List!34729) Bool)

(assert (=> b!1498729 (= res!1019803 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34726))))

(declare-fun b!1498730 () Bool)

(declare-fun res!1019804 () Bool)

(assert (=> b!1498730 (=> (not res!1019804) (not e!839100))))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1498730 (= res!1019804 (and (= (size!48787 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48787 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48787 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498731 () Bool)

(assert (=> b!1498731 (= e!839100 false)))

(declare-datatypes ((SeekEntryResult!12447 0))(
  ( (MissingZero!12447 (index!52180 (_ BitVec 32))) (Found!12447 (index!52181 (_ BitVec 32))) (Intermediate!12447 (undefined!13259 Bool) (index!52182 (_ BitVec 32)) (x!133873 (_ BitVec 32))) (Undefined!12447) (MissingVacant!12447 (index!52183 (_ BitVec 32))) )
))
(declare-fun lt!652666 () SeekEntryResult!12447)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99955 (_ BitVec 32)) SeekEntryResult!12447)

(assert (=> b!1498731 (= lt!652666 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48237 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1498733 () Bool)

(declare-fun res!1019806 () Bool)

(assert (=> b!1498733 (=> (not res!1019806) (not e!839100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99955 (_ BitVec 32)) Bool)

(assert (=> b!1498733 (= res!1019806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498732 () Bool)

(declare-fun res!1019808 () Bool)

(assert (=> b!1498732 (=> (not res!1019808) (not e!839100))))

(assert (=> b!1498732 (= res!1019808 (validKeyInArray!0 (select (arr!48237 a!2850) i!996)))))

(declare-fun res!1019809 () Bool)

(assert (=> start!127574 (=> (not res!1019809) (not e!839100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127574 (= res!1019809 (validMask!0 mask!2661))))

(assert (=> start!127574 e!839100))

(assert (=> start!127574 true))

(declare-fun array_inv!37265 (array!99955) Bool)

(assert (=> start!127574 (array_inv!37265 a!2850)))

(assert (= (and start!127574 res!1019809) b!1498730))

(assert (= (and b!1498730 res!1019804) b!1498732))

(assert (= (and b!1498732 res!1019808) b!1498727))

(assert (= (and b!1498727 res!1019805) b!1498733))

(assert (= (and b!1498733 res!1019806) b!1498729))

(assert (= (and b!1498729 res!1019803) b!1498728))

(assert (= (and b!1498728 res!1019807) b!1498731))

(declare-fun m!1381867 () Bool)

(assert (=> start!127574 m!1381867))

(declare-fun m!1381869 () Bool)

(assert (=> start!127574 m!1381869))

(declare-fun m!1381871 () Bool)

(assert (=> b!1498727 m!1381871))

(assert (=> b!1498727 m!1381871))

(declare-fun m!1381873 () Bool)

(assert (=> b!1498727 m!1381873))

(declare-fun m!1381875 () Bool)

(assert (=> b!1498728 m!1381875))

(declare-fun m!1381877 () Bool)

(assert (=> b!1498728 m!1381877))

(declare-fun m!1381879 () Bool)

(assert (=> b!1498728 m!1381879))

(declare-fun m!1381881 () Bool)

(assert (=> b!1498732 m!1381881))

(assert (=> b!1498732 m!1381881))

(declare-fun m!1381883 () Bool)

(assert (=> b!1498732 m!1381883))

(declare-fun m!1381885 () Bool)

(assert (=> b!1498729 m!1381885))

(declare-fun m!1381887 () Bool)

(assert (=> b!1498733 m!1381887))

(assert (=> b!1498731 m!1381871))

(assert (=> b!1498731 m!1381871))

(declare-fun m!1381889 () Bool)

(assert (=> b!1498731 m!1381889))

(check-sat (not b!1498727) (not start!127574) (not b!1498729) (not b!1498732) (not b!1498733) (not b!1498731))
