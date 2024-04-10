; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127774 () Bool)

(assert start!127774)

(declare-fun b!1501633 () Bool)

(declare-fun res!1022715 () Bool)

(declare-fun e!839997 () Bool)

(assert (=> b!1501633 (=> (not res!1022715) (not e!839997))))

(declare-datatypes ((array!100155 0))(
  ( (array!100156 (arr!48337 (Array (_ BitVec 32) (_ BitVec 64))) (size!48887 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100155)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501633 (= res!1022715 (validKeyInArray!0 (select (arr!48337 a!2850) j!87)))))

(declare-fun b!1501634 () Bool)

(declare-fun res!1022714 () Bool)

(assert (=> b!1501634 (=> (not res!1022714) (not e!839997))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501634 (= res!1022714 (validKeyInArray!0 (select (arr!48337 a!2850) i!996)))))

(declare-fun b!1501635 () Bool)

(declare-fun res!1022710 () Bool)

(assert (=> b!1501635 (=> (not res!1022710) (not e!839997))))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1501635 (= res!1022710 (and (= (size!48887 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48887 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48887 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501636 () Bool)

(declare-fun res!1022709 () Bool)

(assert (=> b!1501636 (=> (not res!1022709) (not e!839997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100155 (_ BitVec 32)) Bool)

(assert (=> b!1501636 (= res!1022709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501637 () Bool)

(declare-fun e!839998 () Bool)

(assert (=> b!1501637 (= e!839997 e!839998)))

(declare-fun res!1022716 () Bool)

(assert (=> b!1501637 (=> (not res!1022716) (not e!839998))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12547 0))(
  ( (MissingZero!12547 (index!52580 (_ BitVec 32))) (Found!12547 (index!52581 (_ BitVec 32))) (Intermediate!12547 (undefined!13359 Bool) (index!52582 (_ BitVec 32)) (x!134237 (_ BitVec 32))) (Undefined!12547) (MissingVacant!12547 (index!52583 (_ BitVec 32))) )
))
(declare-fun lt!653227 () SeekEntryResult!12547)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100155 (_ BitVec 32)) SeekEntryResult!12547)

(assert (=> b!1501637 (= res!1022716 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48337 a!2850) j!87) a!2850 mask!2661) lt!653227))))

(assert (=> b!1501637 (= lt!653227 (Found!12547 j!87))))

(declare-fun res!1022718 () Bool)

(assert (=> start!127774 (=> (not res!1022718) (not e!839997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127774 (= res!1022718 (validMask!0 mask!2661))))

(assert (=> start!127774 e!839997))

(assert (=> start!127774 true))

(declare-fun array_inv!37365 (array!100155) Bool)

(assert (=> start!127774 (array_inv!37365 a!2850)))

(declare-fun b!1501638 () Bool)

(declare-fun e!839996 () Bool)

(assert (=> b!1501638 (= e!839998 e!839996)))

(declare-fun res!1022711 () Bool)

(assert (=> b!1501638 (=> (not res!1022711) (not e!839996))))

(declare-fun lt!653225 () (_ BitVec 32))

(assert (=> b!1501638 (= res!1022711 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653225 #b00000000000000000000000000000000) (bvslt lt!653225 (size!48887 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501638 (= lt!653225 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501639 () Bool)

(declare-fun res!1022717 () Bool)

(assert (=> b!1501639 (=> (not res!1022717) (not e!839996))))

(assert (=> b!1501639 (= res!1022717 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653225 vacantBefore!10 (select (arr!48337 a!2850) j!87) a!2850 mask!2661) lt!653227))))

(declare-fun b!1501640 () Bool)

(declare-fun res!1022712 () Bool)

(assert (=> b!1501640 (=> (not res!1022712) (not e!839998))))

(assert (=> b!1501640 (= res!1022712 (not (= (select (arr!48337 a!2850) index!625) (select (arr!48337 a!2850) j!87))))))

(declare-fun b!1501641 () Bool)

(declare-fun res!1022713 () Bool)

(assert (=> b!1501641 (=> (not res!1022713) (not e!839997))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501641 (= res!1022713 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48887 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48887 a!2850)) (= (select (arr!48337 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48337 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48887 a!2850))))))

(declare-fun b!1501642 () Bool)

(declare-fun res!1022719 () Bool)

(assert (=> b!1501642 (=> (not res!1022719) (not e!839997))))

(declare-datatypes ((List!34829 0))(
  ( (Nil!34826) (Cons!34825 (h!36222 (_ BitVec 64)) (t!49523 List!34829)) )
))
(declare-fun arrayNoDuplicates!0 (array!100155 (_ BitVec 32) List!34829) Bool)

(assert (=> b!1501642 (= res!1022719 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34826))))

(declare-fun b!1501643 () Bool)

(assert (=> b!1501643 (= e!839996 (not true))))

(assert (=> b!1501643 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653225 vacantAfter!10 (select (store (arr!48337 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100156 (store (arr!48337 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48887 a!2850)) mask!2661) lt!653227)))

(declare-datatypes ((Unit!50248 0))(
  ( (Unit!50249) )
))
(declare-fun lt!653226 () Unit!50248)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100155 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50248)

(assert (=> b!1501643 (= lt!653226 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653225 vacantBefore!10 vacantAfter!10 mask!2661))))

(assert (= (and start!127774 res!1022718) b!1501635))

(assert (= (and b!1501635 res!1022710) b!1501634))

(assert (= (and b!1501634 res!1022714) b!1501633))

(assert (= (and b!1501633 res!1022715) b!1501636))

(assert (= (and b!1501636 res!1022709) b!1501642))

(assert (= (and b!1501642 res!1022719) b!1501641))

(assert (= (and b!1501641 res!1022713) b!1501637))

(assert (= (and b!1501637 res!1022716) b!1501640))

(assert (= (and b!1501640 res!1022712) b!1501638))

(assert (= (and b!1501638 res!1022711) b!1501639))

(assert (= (and b!1501639 res!1022717) b!1501643))

(declare-fun m!1384885 () Bool)

(assert (=> b!1501633 m!1384885))

(assert (=> b!1501633 m!1384885))

(declare-fun m!1384887 () Bool)

(assert (=> b!1501633 m!1384887))

(declare-fun m!1384889 () Bool)

(assert (=> b!1501636 m!1384889))

(assert (=> b!1501639 m!1384885))

(assert (=> b!1501639 m!1384885))

(declare-fun m!1384891 () Bool)

(assert (=> b!1501639 m!1384891))

(declare-fun m!1384893 () Bool)

(assert (=> b!1501641 m!1384893))

(declare-fun m!1384895 () Bool)

(assert (=> b!1501641 m!1384895))

(declare-fun m!1384897 () Bool)

(assert (=> b!1501641 m!1384897))

(declare-fun m!1384899 () Bool)

(assert (=> b!1501642 m!1384899))

(declare-fun m!1384901 () Bool)

(assert (=> start!127774 m!1384901))

(declare-fun m!1384903 () Bool)

(assert (=> start!127774 m!1384903))

(declare-fun m!1384905 () Bool)

(assert (=> b!1501640 m!1384905))

(assert (=> b!1501640 m!1384885))

(assert (=> b!1501643 m!1384895))

(declare-fun m!1384907 () Bool)

(assert (=> b!1501643 m!1384907))

(assert (=> b!1501643 m!1384907))

(declare-fun m!1384909 () Bool)

(assert (=> b!1501643 m!1384909))

(declare-fun m!1384911 () Bool)

(assert (=> b!1501643 m!1384911))

(declare-fun m!1384913 () Bool)

(assert (=> b!1501638 m!1384913))

(declare-fun m!1384915 () Bool)

(assert (=> b!1501634 m!1384915))

(assert (=> b!1501634 m!1384915))

(declare-fun m!1384917 () Bool)

(assert (=> b!1501634 m!1384917))

(assert (=> b!1501637 m!1384885))

(assert (=> b!1501637 m!1384885))

(declare-fun m!1384919 () Bool)

(assert (=> b!1501637 m!1384919))

(push 1)

(assert (not b!1501642))

(assert (not b!1501638))

(assert (not b!1501634))

