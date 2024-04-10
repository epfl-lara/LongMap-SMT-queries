; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92780 () Bool)

(assert start!92780)

(declare-fun e!598623 () Bool)

(declare-fun b!1053889 () Bool)

(declare-fun lt!465246 () (_ BitVec 32))

(declare-datatypes ((array!66473 0))(
  ( (array!66474 (arr!31970 (Array (_ BitVec 32) (_ BitVec 64))) (size!32506 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66473)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053889 (= e!598623 (arrayContainsKey!0 a!3488 k0!2747 lt!465246))))

(declare-fun b!1053890 () Bool)

(declare-fun e!598624 () Bool)

(declare-fun e!598627 () Bool)

(assert (=> b!1053890 (= e!598624 e!598627)))

(declare-fun res!702876 () Bool)

(assert (=> b!1053890 (=> (not res!702876) (not e!598627))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053890 (= res!702876 (not (= lt!465246 i!1381)))))

(declare-fun lt!465245 () array!66473)

(declare-fun arrayScanForKey!0 (array!66473 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053890 (= lt!465246 (arrayScanForKey!0 lt!465245 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053891 () Bool)

(declare-fun res!702871 () Bool)

(declare-fun e!598626 () Bool)

(assert (=> b!1053891 (=> (not res!702871) (not e!598626))))

(declare-datatypes ((List!22282 0))(
  ( (Nil!22279) (Cons!22278 (h!23487 (_ BitVec 64)) (t!31589 List!22282)) )
))
(declare-fun arrayNoDuplicates!0 (array!66473 (_ BitVec 32) List!22282) Bool)

(assert (=> b!1053891 (= res!702871 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22279))))

(declare-fun b!1053892 () Bool)

(declare-fun e!598622 () Bool)

(assert (=> b!1053892 (= e!598622 e!598623)))

(declare-fun res!702877 () Bool)

(assert (=> b!1053892 (=> res!702877 e!598623)))

(assert (=> b!1053892 (= res!702877 (bvsle lt!465246 i!1381))))

(declare-fun b!1053893 () Bool)

(declare-fun res!702874 () Bool)

(assert (=> b!1053893 (=> (not res!702874) (not e!598626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053893 (= res!702874 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053894 () Bool)

(assert (=> b!1053894 (= e!598627 (not true))))

(assert (=> b!1053894 e!598622))

(declare-fun res!702878 () Bool)

(assert (=> b!1053894 (=> (not res!702878) (not e!598622))))

(assert (=> b!1053894 (= res!702878 (= (select (store (arr!31970 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465246) k0!2747))))

(declare-fun res!702873 () Bool)

(assert (=> start!92780 (=> (not res!702873) (not e!598626))))

(assert (=> start!92780 (= res!702873 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32506 a!3488)) (bvslt (size!32506 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92780 e!598626))

(assert (=> start!92780 true))

(declare-fun array_inv!24750 (array!66473) Bool)

(assert (=> start!92780 (array_inv!24750 a!3488)))

(declare-fun b!1053895 () Bool)

(assert (=> b!1053895 (= e!598626 e!598624)))

(declare-fun res!702872 () Bool)

(assert (=> b!1053895 (=> (not res!702872) (not e!598624))))

(assert (=> b!1053895 (= res!702872 (arrayContainsKey!0 lt!465245 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053895 (= lt!465245 (array!66474 (store (arr!31970 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32506 a!3488)))))

(declare-fun b!1053896 () Bool)

(declare-fun res!702875 () Bool)

(assert (=> b!1053896 (=> (not res!702875) (not e!598626))))

(assert (=> b!1053896 (= res!702875 (= (select (arr!31970 a!3488) i!1381) k0!2747))))

(assert (= (and start!92780 res!702873) b!1053891))

(assert (= (and b!1053891 res!702871) b!1053893))

(assert (= (and b!1053893 res!702874) b!1053896))

(assert (= (and b!1053896 res!702875) b!1053895))

(assert (= (and b!1053895 res!702872) b!1053890))

(assert (= (and b!1053890 res!702876) b!1053894))

(assert (= (and b!1053894 res!702878) b!1053892))

(assert (= (and b!1053892 (not res!702877)) b!1053889))

(declare-fun m!974063 () Bool)

(assert (=> b!1053889 m!974063))

(declare-fun m!974065 () Bool)

(assert (=> b!1053890 m!974065))

(declare-fun m!974067 () Bool)

(assert (=> start!92780 m!974067))

(declare-fun m!974069 () Bool)

(assert (=> b!1053896 m!974069))

(declare-fun m!974071 () Bool)

(assert (=> b!1053895 m!974071))

(declare-fun m!974073 () Bool)

(assert (=> b!1053895 m!974073))

(declare-fun m!974075 () Bool)

(assert (=> b!1053893 m!974075))

(declare-fun m!974077 () Bool)

(assert (=> b!1053891 m!974077))

(assert (=> b!1053894 m!974073))

(declare-fun m!974079 () Bool)

(assert (=> b!1053894 m!974079))

(check-sat (not b!1053891) (not b!1053893) (not b!1053890) (not b!1053895) (not start!92780) (not b!1053889))
(check-sat)
