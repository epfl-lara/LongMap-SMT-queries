; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92288 () Bool)

(assert start!92288)

(declare-fun b!1048857 () Bool)

(declare-fun e!594977 () Bool)

(declare-fun e!594976 () Bool)

(assert (=> b!1048857 (= e!594977 e!594976)))

(declare-fun res!697985 () Bool)

(assert (=> b!1048857 (=> (not res!697985) (not e!594976))))

(declare-fun lt!463308 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048857 (= res!697985 (not (= lt!463308 i!1381)))))

(declare-datatypes ((array!66089 0))(
  ( (array!66090 (arr!31784 (Array (_ BitVec 32) (_ BitVec 64))) (size!32320 (_ BitVec 32))) )
))
(declare-fun lt!463307 () array!66089)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66089 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048857 (= lt!463308 (arrayScanForKey!0 lt!463307 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048858 () Bool)

(declare-fun res!697986 () Bool)

(declare-fun e!594981 () Bool)

(assert (=> b!1048858 (=> (not res!697986) (not e!594981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048858 (= res!697986 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048859 () Bool)

(declare-fun res!697989 () Bool)

(assert (=> b!1048859 (=> (not res!697989) (not e!594981))))

(declare-fun a!3488 () array!66089)

(declare-datatypes ((List!22096 0))(
  ( (Nil!22093) (Cons!22092 (h!23301 (_ BitVec 64)) (t!31403 List!22096)) )
))
(declare-fun arrayNoDuplicates!0 (array!66089 (_ BitVec 32) List!22096) Bool)

(assert (=> b!1048859 (= res!697989 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22093))))

(declare-fun b!1048860 () Bool)

(declare-fun res!697990 () Bool)

(assert (=> b!1048860 (=> (not res!697990) (not e!594981))))

(assert (=> b!1048860 (= res!697990 (= (select (arr!31784 a!3488) i!1381) k0!2747))))

(declare-fun b!1048861 () Bool)

(declare-fun e!594978 () Bool)

(declare-fun arrayContainsKey!0 (array!66089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048861 (= e!594978 (arrayContainsKey!0 a!3488 k0!2747 lt!463308))))

(declare-fun b!1048862 () Bool)

(declare-fun e!594980 () Bool)

(assert (=> b!1048862 (= e!594980 e!594978)))

(declare-fun res!697983 () Bool)

(assert (=> b!1048862 (=> res!697983 e!594978)))

(assert (=> b!1048862 (= res!697983 (bvsle lt!463308 i!1381))))

(declare-fun b!1048863 () Bool)

(declare-fun e!594982 () Bool)

(assert (=> b!1048863 (= e!594982 true)))

(assert (=> b!1048863 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22093)))

(declare-datatypes ((Unit!34288 0))(
  ( (Unit!34289) )
))
(declare-fun lt!463306 () Unit!34288)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66089 (_ BitVec 32) (_ BitVec 32)) Unit!34288)

(assert (=> b!1048863 (= lt!463306 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun res!697984 () Bool)

(assert (=> start!92288 (=> (not res!697984) (not e!594981))))

(assert (=> start!92288 (= res!697984 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32320 a!3488)) (bvslt (size!32320 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92288 e!594981))

(assert (=> start!92288 true))

(declare-fun array_inv!24564 (array!66089) Bool)

(assert (=> start!92288 (array_inv!24564 a!3488)))

(declare-fun b!1048864 () Bool)

(assert (=> b!1048864 (= e!594976 (not e!594982))))

(declare-fun res!697988 () Bool)

(assert (=> b!1048864 (=> res!697988 e!594982)))

(assert (=> b!1048864 (= res!697988 (bvsle lt!463308 i!1381))))

(assert (=> b!1048864 e!594980))

(declare-fun res!697987 () Bool)

(assert (=> b!1048864 (=> (not res!697987) (not e!594980))))

(assert (=> b!1048864 (= res!697987 (= (select (store (arr!31784 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463308) k0!2747))))

(declare-fun b!1048865 () Bool)

(assert (=> b!1048865 (= e!594981 e!594977)))

(declare-fun res!697991 () Bool)

(assert (=> b!1048865 (=> (not res!697991) (not e!594977))))

(assert (=> b!1048865 (= res!697991 (arrayContainsKey!0 lt!463307 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048865 (= lt!463307 (array!66090 (store (arr!31784 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32320 a!3488)))))

(assert (= (and start!92288 res!697984) b!1048859))

(assert (= (and b!1048859 res!697989) b!1048858))

(assert (= (and b!1048858 res!697986) b!1048860))

(assert (= (and b!1048860 res!697990) b!1048865))

(assert (= (and b!1048865 res!697991) b!1048857))

(assert (= (and b!1048857 res!697985) b!1048864))

(assert (= (and b!1048864 res!697987) b!1048862))

(assert (= (and b!1048862 (not res!697983)) b!1048861))

(assert (= (and b!1048864 (not res!697988)) b!1048863))

(declare-fun m!969723 () Bool)

(assert (=> b!1048863 m!969723))

(declare-fun m!969725 () Bool)

(assert (=> b!1048863 m!969725))

(declare-fun m!969727 () Bool)

(assert (=> b!1048861 m!969727))

(declare-fun m!969729 () Bool)

(assert (=> b!1048857 m!969729))

(declare-fun m!969731 () Bool)

(assert (=> start!92288 m!969731))

(declare-fun m!969733 () Bool)

(assert (=> b!1048859 m!969733))

(declare-fun m!969735 () Bool)

(assert (=> b!1048865 m!969735))

(declare-fun m!969737 () Bool)

(assert (=> b!1048865 m!969737))

(assert (=> b!1048864 m!969737))

(declare-fun m!969739 () Bool)

(assert (=> b!1048864 m!969739))

(declare-fun m!969741 () Bool)

(assert (=> b!1048860 m!969741))

(declare-fun m!969743 () Bool)

(assert (=> b!1048858 m!969743))

(check-sat (not b!1048865) (not b!1048857) (not b!1048858) (not b!1048863) (not start!92288) (not b!1048861) (not b!1048859))
(check-sat)
