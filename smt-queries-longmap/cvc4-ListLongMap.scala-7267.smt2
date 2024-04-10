; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92788 () Bool)

(assert start!92788)

(declare-fun b!1053993 () Bool)

(declare-fun e!598706 () Bool)

(declare-fun e!598703 () Bool)

(assert (=> b!1053993 (= e!598706 e!598703)))

(declare-fun res!702980 () Bool)

(assert (=> b!1053993 (=> res!702980 e!598703)))

(declare-fun lt!465278 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053993 (= res!702980 (bvsle lt!465278 i!1381))))

(declare-fun b!1053994 () Bool)

(declare-fun e!598702 () Bool)

(assert (=> b!1053994 (= e!598702 (bvsge lt!465278 #b00000000000000000000000000000000))))

(declare-datatypes ((array!66481 0))(
  ( (array!66482 (arr!31974 (Array (_ BitVec 32) (_ BitVec 64))) (size!32510 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66481)

(declare-datatypes ((List!22286 0))(
  ( (Nil!22283) (Cons!22282 (h!23491 (_ BitVec 64)) (t!31593 List!22286)) )
))
(declare-fun arrayNoDuplicates!0 (array!66481 (_ BitVec 32) List!22286) Bool)

(assert (=> b!1053994 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22283)))

(declare-datatypes ((Unit!34506 0))(
  ( (Unit!34507) )
))
(declare-fun lt!465279 () Unit!34506)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66481 (_ BitVec 32) (_ BitVec 32)) Unit!34506)

(assert (=> b!1053994 (= lt!465279 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1053995 () Bool)

(declare-fun e!598704 () Bool)

(declare-fun e!598705 () Bool)

(assert (=> b!1053995 (= e!598704 e!598705)))

(declare-fun res!702978 () Bool)

(assert (=> b!1053995 (=> (not res!702978) (not e!598705))))

(declare-fun lt!465277 () array!66481)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053995 (= res!702978 (arrayContainsKey!0 lt!465277 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053995 (= lt!465277 (array!66482 (store (arr!31974 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32510 a!3488)))))

(declare-fun res!702975 () Bool)

(assert (=> start!92788 (=> (not res!702975) (not e!598704))))

(assert (=> start!92788 (= res!702975 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32510 a!3488)) (bvslt (size!32510 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92788 e!598704))

(assert (=> start!92788 true))

(declare-fun array_inv!24754 (array!66481) Bool)

(assert (=> start!92788 (array_inv!24754 a!3488)))

(declare-fun b!1053996 () Bool)

(declare-fun res!702977 () Bool)

(assert (=> b!1053996 (=> (not res!702977) (not e!598704))))

(assert (=> b!1053996 (= res!702977 (= (select (arr!31974 a!3488) i!1381) k!2747))))

(declare-fun b!1053997 () Bool)

(declare-fun res!702983 () Bool)

(assert (=> b!1053997 (=> (not res!702983) (not e!598704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053997 (= res!702983 (validKeyInArray!0 k!2747))))

(declare-fun b!1053998 () Bool)

(declare-fun res!702976 () Bool)

(assert (=> b!1053998 (=> (not res!702976) (not e!598704))))

(assert (=> b!1053998 (= res!702976 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22283))))

(declare-fun b!1053999 () Bool)

(declare-fun e!598707 () Bool)

(assert (=> b!1053999 (= e!598705 e!598707)))

(declare-fun res!702979 () Bool)

(assert (=> b!1053999 (=> (not res!702979) (not e!598707))))

(assert (=> b!1053999 (= res!702979 (not (= lt!465278 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66481 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053999 (= lt!465278 (arrayScanForKey!0 lt!465277 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054000 () Bool)

(assert (=> b!1054000 (= e!598703 (arrayContainsKey!0 a!3488 k!2747 lt!465278))))

(declare-fun b!1054001 () Bool)

(assert (=> b!1054001 (= e!598707 (not e!598702))))

(declare-fun res!702981 () Bool)

(assert (=> b!1054001 (=> res!702981 e!598702)))

(assert (=> b!1054001 (= res!702981 (bvsle lt!465278 i!1381))))

(assert (=> b!1054001 e!598706))

(declare-fun res!702982 () Bool)

(assert (=> b!1054001 (=> (not res!702982) (not e!598706))))

(assert (=> b!1054001 (= res!702982 (= (select (store (arr!31974 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465278) k!2747))))

(assert (= (and start!92788 res!702975) b!1053998))

(assert (= (and b!1053998 res!702976) b!1053997))

(assert (= (and b!1053997 res!702983) b!1053996))

(assert (= (and b!1053996 res!702977) b!1053995))

(assert (= (and b!1053995 res!702978) b!1053999))

(assert (= (and b!1053999 res!702979) b!1054001))

(assert (= (and b!1054001 res!702982) b!1053993))

(assert (= (and b!1053993 (not res!702980)) b!1054000))

(assert (= (and b!1054001 (not res!702981)) b!1053994))

(declare-fun m!974143 () Bool)

(assert (=> b!1053997 m!974143))

(declare-fun m!974145 () Bool)

(assert (=> b!1054001 m!974145))

(declare-fun m!974147 () Bool)

(assert (=> b!1054001 m!974147))

(declare-fun m!974149 () Bool)

(assert (=> b!1053994 m!974149))

(declare-fun m!974151 () Bool)

(assert (=> b!1053994 m!974151))

(declare-fun m!974153 () Bool)

(assert (=> b!1053999 m!974153))

(declare-fun m!974155 () Bool)

(assert (=> start!92788 m!974155))

(declare-fun m!974157 () Bool)

(assert (=> b!1054000 m!974157))

(declare-fun m!974159 () Bool)

(assert (=> b!1053995 m!974159))

(assert (=> b!1053995 m!974145))

(declare-fun m!974161 () Bool)

(assert (=> b!1053998 m!974161))

(declare-fun m!974163 () Bool)

(assert (=> b!1053996 m!974163))

(push 1)

