; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128474 () Bool)

(assert start!128474)

(declare-fun b!1506675 () Bool)

(declare-fun res!1026095 () Bool)

(declare-fun e!842279 () Bool)

(assert (=> b!1506675 (=> (not res!1026095) (not e!842279))))

(declare-datatypes ((array!100486 0))(
  ( (array!100487 (arr!48490 (Array (_ BitVec 32) (_ BitVec 64))) (size!49041 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100486)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1506675 (= res!1026095 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49041 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49041 a!2850)) (= (select (arr!48490 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48490 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49041 a!2850))))))

(declare-fun b!1506676 () Bool)

(declare-fun e!842277 () Bool)

(assert (=> b!1506676 (= e!842277 (not true))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun lt!654486 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12581 0))(
  ( (MissingZero!12581 (index!52716 (_ BitVec 32))) (Found!12581 (index!52717 (_ BitVec 32))) (Intermediate!12581 (undefined!13393 Bool) (index!52718 (_ BitVec 32)) (x!134604 (_ BitVec 32))) (Undefined!12581) (MissingVacant!12581 (index!52719 (_ BitVec 32))) )
))
(declare-fun lt!654487 () SeekEntryResult!12581)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100486 (_ BitVec 32)) SeekEntryResult!12581)

(assert (=> b!1506676 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!654486 vacantAfter!10 (select (store (arr!48490 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100487 (store (arr!48490 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49041 a!2850)) mask!2661) lt!654487)))

(declare-datatypes ((Unit!50203 0))(
  ( (Unit!50204) )
))
(declare-fun lt!654485 () Unit!50203)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50203)

(assert (=> b!1506676 (= lt!654485 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!654486 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1506677 () Bool)

(declare-fun res!1026091 () Bool)

(declare-fun e!842280 () Bool)

(assert (=> b!1506677 (=> (not res!1026091) (not e!842280))))

(assert (=> b!1506677 (= res!1026091 (not (= (select (arr!48490 a!2850) index!625) (select (arr!48490 a!2850) j!87))))))

(declare-fun b!1506678 () Bool)

(declare-fun res!1026094 () Bool)

(assert (=> b!1506678 (=> (not res!1026094) (not e!842279))))

(declare-datatypes ((List!34969 0))(
  ( (Nil!34966) (Cons!34965 (h!36377 (_ BitVec 64)) (t!49655 List!34969)) )
))
(declare-fun arrayNoDuplicates!0 (array!100486 (_ BitVec 32) List!34969) Bool)

(assert (=> b!1506678 (= res!1026094 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34966))))

(declare-fun res!1026097 () Bool)

(assert (=> start!128474 (=> (not res!1026097) (not e!842279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128474 (= res!1026097 (validMask!0 mask!2661))))

(assert (=> start!128474 e!842279))

(assert (=> start!128474 true))

(declare-fun array_inv!37771 (array!100486) Bool)

(assert (=> start!128474 (array_inv!37771 a!2850)))

(declare-fun b!1506679 () Bool)

(assert (=> b!1506679 (= e!842280 e!842277)))

(declare-fun res!1026096 () Bool)

(assert (=> b!1506679 (=> (not res!1026096) (not e!842277))))

(assert (=> b!1506679 (= res!1026096 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!654486 #b00000000000000000000000000000000) (bvslt lt!654486 (size!49041 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506679 (= lt!654486 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1506680 () Bool)

(declare-fun res!1026089 () Bool)

(assert (=> b!1506680 (=> (not res!1026089) (not e!842279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506680 (= res!1026089 (validKeyInArray!0 (select (arr!48490 a!2850) j!87)))))

(declare-fun b!1506681 () Bool)

(declare-fun res!1026090 () Bool)

(assert (=> b!1506681 (=> (not res!1026090) (not e!842277))))

(assert (=> b!1506681 (= res!1026090 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!654486 vacantBefore!10 (select (arr!48490 a!2850) j!87) a!2850 mask!2661) lt!654487))))

(declare-fun b!1506682 () Bool)

(declare-fun res!1026088 () Bool)

(assert (=> b!1506682 (=> (not res!1026088) (not e!842279))))

(assert (=> b!1506682 (= res!1026088 (validKeyInArray!0 (select (arr!48490 a!2850) i!996)))))

(declare-fun b!1506683 () Bool)

(assert (=> b!1506683 (= e!842279 e!842280)))

(declare-fun res!1026092 () Bool)

(assert (=> b!1506683 (=> (not res!1026092) (not e!842280))))

(assert (=> b!1506683 (= res!1026092 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48490 a!2850) j!87) a!2850 mask!2661) lt!654487))))

(assert (=> b!1506683 (= lt!654487 (Found!12581 j!87))))

(declare-fun b!1506684 () Bool)

(declare-fun res!1026098 () Bool)

(assert (=> b!1506684 (=> (not res!1026098) (not e!842279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100486 (_ BitVec 32)) Bool)

(assert (=> b!1506684 (= res!1026098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1506685 () Bool)

(declare-fun res!1026093 () Bool)

(assert (=> b!1506685 (=> (not res!1026093) (not e!842279))))

(assert (=> b!1506685 (= res!1026093 (and (= (size!49041 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49041 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49041 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!128474 res!1026097) b!1506685))

(assert (= (and b!1506685 res!1026093) b!1506682))

(assert (= (and b!1506682 res!1026088) b!1506680))

(assert (= (and b!1506680 res!1026089) b!1506684))

(assert (= (and b!1506684 res!1026098) b!1506678))

(assert (= (and b!1506678 res!1026094) b!1506675))

(assert (= (and b!1506675 res!1026095) b!1506683))

(assert (= (and b!1506683 res!1026092) b!1506677))

(assert (= (and b!1506677 res!1026091) b!1506679))

(assert (= (and b!1506679 res!1026096) b!1506681))

(assert (= (and b!1506681 res!1026090) b!1506676))

(declare-fun m!1389723 () Bool)

(assert (=> b!1506684 m!1389723))

(declare-fun m!1389725 () Bool)

(assert (=> b!1506676 m!1389725))

(declare-fun m!1389727 () Bool)

(assert (=> b!1506676 m!1389727))

(assert (=> b!1506676 m!1389727))

(declare-fun m!1389729 () Bool)

(assert (=> b!1506676 m!1389729))

(declare-fun m!1389731 () Bool)

(assert (=> b!1506676 m!1389731))

(declare-fun m!1389733 () Bool)

(assert (=> b!1506678 m!1389733))

(declare-fun m!1389735 () Bool)

(assert (=> b!1506682 m!1389735))

(assert (=> b!1506682 m!1389735))

(declare-fun m!1389737 () Bool)

(assert (=> b!1506682 m!1389737))

(declare-fun m!1389739 () Bool)

(assert (=> b!1506679 m!1389739))

(declare-fun m!1389741 () Bool)

(assert (=> b!1506680 m!1389741))

(assert (=> b!1506680 m!1389741))

(declare-fun m!1389743 () Bool)

(assert (=> b!1506680 m!1389743))

(declare-fun m!1389745 () Bool)

(assert (=> start!128474 m!1389745))

(declare-fun m!1389747 () Bool)

(assert (=> start!128474 m!1389747))

(declare-fun m!1389749 () Bool)

(assert (=> b!1506675 m!1389749))

(assert (=> b!1506675 m!1389725))

(declare-fun m!1389751 () Bool)

(assert (=> b!1506675 m!1389751))

(assert (=> b!1506683 m!1389741))

(assert (=> b!1506683 m!1389741))

(declare-fun m!1389753 () Bool)

(assert (=> b!1506683 m!1389753))

(assert (=> b!1506681 m!1389741))

(assert (=> b!1506681 m!1389741))

(declare-fun m!1389755 () Bool)

(assert (=> b!1506681 m!1389755))

(declare-fun m!1389757 () Bool)

(assert (=> b!1506677 m!1389757))

(assert (=> b!1506677 m!1389741))

(check-sat (not b!1506678) (not b!1506682) (not b!1506676) (not b!1506684) (not b!1506679) (not b!1506683) (not start!128474) (not b!1506680) (not b!1506681))
(check-sat)
