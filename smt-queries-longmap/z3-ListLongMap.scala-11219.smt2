; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130896 () Bool)

(assert start!130896)

(declare-fun b!1535721 () Bool)

(declare-fun res!1052999 () Bool)

(declare-fun e!854796 () Bool)

(assert (=> b!1535721 (=> (not res!1052999) (not e!854796))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101992 0))(
  ( (array!101993 (arr!49213 (Array (_ BitVec 32) (_ BitVec 64))) (size!49765 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101992)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535721 (= res!1052999 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49765 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49765 a!2792)) (= (select (arr!49213 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535722 () Bool)

(declare-fun res!1052995 () Bool)

(assert (=> b!1535722 (=> (not res!1052995) (not e!854796))))

(declare-datatypes ((List!35765 0))(
  ( (Nil!35762) (Cons!35761 (h!37207 (_ BitVec 64)) (t!50451 List!35765)) )
))
(declare-fun arrayNoDuplicates!0 (array!101992 (_ BitVec 32) List!35765) Bool)

(assert (=> b!1535722 (= res!1052995 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35762))))

(declare-fun b!1535723 () Bool)

(declare-fun res!1052997 () Bool)

(assert (=> b!1535723 (=> (not res!1052997) (not e!854796))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101992 (_ BitVec 32)) Bool)

(assert (=> b!1535723 (= res!1052997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535724 () Bool)

(declare-fun e!854797 () Bool)

(declare-fun e!854799 () Bool)

(assert (=> b!1535724 (= e!854797 e!854799)))

(declare-fun res!1053000 () Bool)

(assert (=> b!1535724 (=> (not res!1053000) (not e!854799))))

(declare-datatypes ((SeekEntryResult!13370 0))(
  ( (MissingZero!13370 (index!55875 (_ BitVec 32))) (Found!13370 (index!55876 (_ BitVec 32))) (Intermediate!13370 (undefined!14182 Bool) (index!55877 (_ BitVec 32)) (x!137615 (_ BitVec 32))) (Undefined!13370) (MissingVacant!13370 (index!55878 (_ BitVec 32))) )
))
(declare-fun lt!663914 () SeekEntryResult!13370)

(declare-fun lt!663913 () SeekEntryResult!13370)

(assert (=> b!1535724 (= res!1053000 (= lt!663914 lt!663913))))

(declare-fun lt!663915 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101992 (_ BitVec 32)) SeekEntryResult!13370)

(assert (=> b!1535724 (= lt!663914 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663915 vacantIndex!5 (select (arr!49213 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535725 () Bool)

(declare-fun res!1052996 () Bool)

(assert (=> b!1535725 (=> (not res!1052996) (not e!854796))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535725 (= res!1052996 (validKeyInArray!0 (select (arr!49213 a!2792) i!951)))))

(declare-fun b!1535726 () Bool)

(declare-fun e!854798 () Bool)

(assert (=> b!1535726 (= e!854798 e!854797)))

(declare-fun res!1052994 () Bool)

(assert (=> b!1535726 (=> (not res!1052994) (not e!854797))))

(assert (=> b!1535726 (= res!1052994 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663915 #b00000000000000000000000000000000) (bvslt lt!663915 (size!49765 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535726 (= lt!663915 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun res!1052993 () Bool)

(assert (=> start!130896 (=> (not res!1052993) (not e!854796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130896 (= res!1052993 (validMask!0 mask!2480))))

(assert (=> start!130896 e!854796))

(assert (=> start!130896 true))

(declare-fun array_inv!38446 (array!101992) Bool)

(assert (=> start!130896 (array_inv!38446 a!2792)))

(declare-fun b!1535727 () Bool)

(assert (=> b!1535727 (= e!854796 e!854798)))

(declare-fun res!1052998 () Bool)

(assert (=> b!1535727 (=> (not res!1052998) (not e!854798))))

(assert (=> b!1535727 (= res!1052998 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49213 a!2792) j!64) a!2792 mask!2480) lt!663913))))

(assert (=> b!1535727 (= lt!663913 (Found!13370 j!64))))

(declare-fun b!1535728 () Bool)

(declare-fun res!1052992 () Bool)

(assert (=> b!1535728 (=> (not res!1052992) (not e!854798))))

(assert (=> b!1535728 (= res!1052992 (not (= (select (arr!49213 a!2792) index!463) (select (arr!49213 a!2792) j!64))))))

(declare-fun b!1535729 () Bool)

(declare-fun res!1053001 () Bool)

(assert (=> b!1535729 (=> (not res!1053001) (not e!854796))))

(assert (=> b!1535729 (= res!1053001 (validKeyInArray!0 (select (arr!49213 a!2792) j!64)))))

(declare-fun b!1535730 () Bool)

(assert (=> b!1535730 (= e!854799 (not (bvsge mask!2480 #b00000000000000000000000000000000)))))

(assert (=> b!1535730 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663915 vacantIndex!5 (select (store (arr!49213 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!101993 (store (arr!49213 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49765 a!2792)) mask!2480) lt!663914)))

(declare-datatypes ((Unit!51147 0))(
  ( (Unit!51148) )
))
(declare-fun lt!663912 () Unit!51147)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51147)

(assert (=> b!1535730 (= lt!663912 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!663915 vacantIndex!5 mask!2480))))

(declare-fun b!1535731 () Bool)

(declare-fun res!1052991 () Bool)

(assert (=> b!1535731 (=> (not res!1052991) (not e!854796))))

(assert (=> b!1535731 (= res!1052991 (and (= (size!49765 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49765 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49765 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130896 res!1052993) b!1535731))

(assert (= (and b!1535731 res!1052991) b!1535725))

(assert (= (and b!1535725 res!1052996) b!1535729))

(assert (= (and b!1535729 res!1053001) b!1535723))

(assert (= (and b!1535723 res!1052997) b!1535722))

(assert (= (and b!1535722 res!1052995) b!1535721))

(assert (= (and b!1535721 res!1052999) b!1535727))

(assert (= (and b!1535727 res!1052998) b!1535728))

(assert (= (and b!1535728 res!1052992) b!1535726))

(assert (= (and b!1535726 res!1052994) b!1535724))

(assert (= (and b!1535724 res!1053000) b!1535730))

(declare-fun m!1417595 () Bool)

(assert (=> b!1535721 m!1417595))

(declare-fun m!1417597 () Bool)

(assert (=> b!1535722 m!1417597))

(declare-fun m!1417599 () Bool)

(assert (=> start!130896 m!1417599))

(declare-fun m!1417601 () Bool)

(assert (=> start!130896 m!1417601))

(declare-fun m!1417603 () Bool)

(assert (=> b!1535726 m!1417603))

(declare-fun m!1417605 () Bool)

(assert (=> b!1535723 m!1417605))

(declare-fun m!1417607 () Bool)

(assert (=> b!1535729 m!1417607))

(assert (=> b!1535729 m!1417607))

(declare-fun m!1417609 () Bool)

(assert (=> b!1535729 m!1417609))

(assert (=> b!1535727 m!1417607))

(assert (=> b!1535727 m!1417607))

(declare-fun m!1417611 () Bool)

(assert (=> b!1535727 m!1417611))

(declare-fun m!1417613 () Bool)

(assert (=> b!1535730 m!1417613))

(declare-fun m!1417615 () Bool)

(assert (=> b!1535730 m!1417615))

(assert (=> b!1535730 m!1417615))

(declare-fun m!1417617 () Bool)

(assert (=> b!1535730 m!1417617))

(declare-fun m!1417619 () Bool)

(assert (=> b!1535730 m!1417619))

(assert (=> b!1535724 m!1417607))

(assert (=> b!1535724 m!1417607))

(declare-fun m!1417621 () Bool)

(assert (=> b!1535724 m!1417621))

(declare-fun m!1417623 () Bool)

(assert (=> b!1535725 m!1417623))

(assert (=> b!1535725 m!1417623))

(declare-fun m!1417625 () Bool)

(assert (=> b!1535725 m!1417625))

(declare-fun m!1417627 () Bool)

(assert (=> b!1535728 m!1417627))

(assert (=> b!1535728 m!1417607))

(check-sat (not b!1535726) (not start!130896) (not b!1535724) (not b!1535727) (not b!1535723) (not b!1535725) (not b!1535730) (not b!1535729) (not b!1535722))
(check-sat)
