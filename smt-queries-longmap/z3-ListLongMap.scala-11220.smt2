; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130902 () Bool)

(assert start!130902)

(declare-fun b!1535820 () Bool)

(declare-fun res!1053097 () Bool)

(declare-fun e!854845 () Bool)

(assert (=> b!1535820 (=> (not res!1053097) (not e!854845))))

(declare-datatypes ((array!101998 0))(
  ( (array!101999 (arr!49216 (Array (_ BitVec 32) (_ BitVec 64))) (size!49768 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101998)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535820 (= res!1053097 (validKeyInArray!0 (select (arr!49216 a!2792) i!951)))))

(declare-fun b!1535821 () Bool)

(declare-fun e!854842 () Bool)

(assert (=> b!1535821 (= e!854842 (not true))))

(declare-datatypes ((SeekEntryResult!13373 0))(
  ( (MissingZero!13373 (index!55887 (_ BitVec 32))) (Found!13373 (index!55888 (_ BitVec 32))) (Intermediate!13373 (undefined!14185 Bool) (index!55889 (_ BitVec 32)) (x!137626 (_ BitVec 32))) (Undefined!13373) (MissingVacant!13373 (index!55890 (_ BitVec 32))) )
))
(declare-fun lt!663951 () SeekEntryResult!13373)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun lt!663950 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101998 (_ BitVec 32)) SeekEntryResult!13373)

(assert (=> b!1535821 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663950 vacantIndex!5 (select (store (arr!49216 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!101999 (store (arr!49216 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49768 a!2792)) mask!2480) lt!663951)))

(declare-datatypes ((Unit!51153 0))(
  ( (Unit!51154) )
))
(declare-fun lt!663948 () Unit!51153)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101998 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51153)

(assert (=> b!1535821 (= lt!663948 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!663950 vacantIndex!5 mask!2480))))

(declare-fun b!1535822 () Bool)

(declare-fun res!1053094 () Bool)

(assert (=> b!1535822 (=> (not res!1053094) (not e!854845))))

(declare-datatypes ((List!35768 0))(
  ( (Nil!35765) (Cons!35764 (h!37210 (_ BitVec 64)) (t!50454 List!35768)) )
))
(declare-fun arrayNoDuplicates!0 (array!101998 (_ BitVec 32) List!35768) Bool)

(assert (=> b!1535822 (= res!1053094 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35765))))

(declare-fun b!1535824 () Bool)

(declare-fun res!1053091 () Bool)

(assert (=> b!1535824 (=> (not res!1053091) (not e!854845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101998 (_ BitVec 32)) Bool)

(assert (=> b!1535824 (= res!1053091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535825 () Bool)

(declare-fun res!1053092 () Bool)

(assert (=> b!1535825 (=> (not res!1053092) (not e!854845))))

(assert (=> b!1535825 (= res!1053092 (and (= (size!49768 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49768 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49768 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535826 () Bool)

(declare-fun res!1053093 () Bool)

(declare-fun e!854843 () Bool)

(assert (=> b!1535826 (=> (not res!1053093) (not e!854843))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535826 (= res!1053093 (not (= (select (arr!49216 a!2792) index!463) (select (arr!49216 a!2792) j!64))))))

(declare-fun b!1535827 () Bool)

(declare-fun e!854844 () Bool)

(assert (=> b!1535827 (= e!854844 e!854842)))

(declare-fun res!1053099 () Bool)

(assert (=> b!1535827 (=> (not res!1053099) (not e!854842))))

(declare-fun lt!663949 () SeekEntryResult!13373)

(assert (=> b!1535827 (= res!1053099 (= lt!663951 lt!663949))))

(assert (=> b!1535827 (= lt!663951 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663950 vacantIndex!5 (select (arr!49216 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535828 () Bool)

(declare-fun res!1053090 () Bool)

(assert (=> b!1535828 (=> (not res!1053090) (not e!854845))))

(assert (=> b!1535828 (= res!1053090 (validKeyInArray!0 (select (arr!49216 a!2792) j!64)))))

(declare-fun res!1053096 () Bool)

(assert (=> start!130902 (=> (not res!1053096) (not e!854845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130902 (= res!1053096 (validMask!0 mask!2480))))

(assert (=> start!130902 e!854845))

(assert (=> start!130902 true))

(declare-fun array_inv!38449 (array!101998) Bool)

(assert (=> start!130902 (array_inv!38449 a!2792)))

(declare-fun b!1535823 () Bool)

(assert (=> b!1535823 (= e!854845 e!854843)))

(declare-fun res!1053095 () Bool)

(assert (=> b!1535823 (=> (not res!1053095) (not e!854843))))

(assert (=> b!1535823 (= res!1053095 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49216 a!2792) j!64) a!2792 mask!2480) lt!663949))))

(assert (=> b!1535823 (= lt!663949 (Found!13373 j!64))))

(declare-fun b!1535829 () Bool)

(assert (=> b!1535829 (= e!854843 e!854844)))

(declare-fun res!1053100 () Bool)

(assert (=> b!1535829 (=> (not res!1053100) (not e!854844))))

(assert (=> b!1535829 (= res!1053100 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663950 #b00000000000000000000000000000000) (bvslt lt!663950 (size!49768 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535829 (= lt!663950 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535830 () Bool)

(declare-fun res!1053098 () Bool)

(assert (=> b!1535830 (=> (not res!1053098) (not e!854845))))

(assert (=> b!1535830 (= res!1053098 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49768 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49768 a!2792)) (= (select (arr!49216 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130902 res!1053096) b!1535825))

(assert (= (and b!1535825 res!1053092) b!1535820))

(assert (= (and b!1535820 res!1053097) b!1535828))

(assert (= (and b!1535828 res!1053090) b!1535824))

(assert (= (and b!1535824 res!1053091) b!1535822))

(assert (= (and b!1535822 res!1053094) b!1535830))

(assert (= (and b!1535830 res!1053098) b!1535823))

(assert (= (and b!1535823 res!1053095) b!1535826))

(assert (= (and b!1535826 res!1053093) b!1535829))

(assert (= (and b!1535829 res!1053100) b!1535827))

(assert (= (and b!1535827 res!1053099) b!1535821))

(declare-fun m!1417697 () Bool)

(assert (=> start!130902 m!1417697))

(declare-fun m!1417699 () Bool)

(assert (=> start!130902 m!1417699))

(declare-fun m!1417701 () Bool)

(assert (=> b!1535822 m!1417701))

(declare-fun m!1417703 () Bool)

(assert (=> b!1535828 m!1417703))

(assert (=> b!1535828 m!1417703))

(declare-fun m!1417705 () Bool)

(assert (=> b!1535828 m!1417705))

(declare-fun m!1417707 () Bool)

(assert (=> b!1535821 m!1417707))

(declare-fun m!1417709 () Bool)

(assert (=> b!1535821 m!1417709))

(assert (=> b!1535821 m!1417709))

(declare-fun m!1417711 () Bool)

(assert (=> b!1535821 m!1417711))

(declare-fun m!1417713 () Bool)

(assert (=> b!1535821 m!1417713))

(assert (=> b!1535827 m!1417703))

(assert (=> b!1535827 m!1417703))

(declare-fun m!1417715 () Bool)

(assert (=> b!1535827 m!1417715))

(assert (=> b!1535823 m!1417703))

(assert (=> b!1535823 m!1417703))

(declare-fun m!1417717 () Bool)

(assert (=> b!1535823 m!1417717))

(declare-fun m!1417719 () Bool)

(assert (=> b!1535824 m!1417719))

(declare-fun m!1417721 () Bool)

(assert (=> b!1535830 m!1417721))

(declare-fun m!1417723 () Bool)

(assert (=> b!1535829 m!1417723))

(declare-fun m!1417725 () Bool)

(assert (=> b!1535826 m!1417725))

(assert (=> b!1535826 m!1417703))

(declare-fun m!1417727 () Bool)

(assert (=> b!1535820 m!1417727))

(assert (=> b!1535820 m!1417727))

(declare-fun m!1417729 () Bool)

(assert (=> b!1535820 m!1417729))

(check-sat (not b!1535824) (not b!1535822) (not b!1535821) (not b!1535828) (not b!1535827) (not b!1535823) (not start!130902) (not b!1535829) (not b!1535820))
(check-sat)
