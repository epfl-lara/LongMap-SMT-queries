; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92638 () Bool)

(assert start!92638)

(declare-fun b!1052973 () Bool)

(declare-fun res!702148 () Bool)

(declare-fun e!597972 () Bool)

(assert (=> b!1052973 (=> (not res!702148) (not e!597972))))

(declare-datatypes ((array!66353 0))(
  ( (array!66354 (arr!31914 (Array (_ BitVec 32) (_ BitVec 64))) (size!32452 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66353)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052973 (= res!702148 (= (select (arr!31914 a!3488) i!1381) k0!2747))))

(declare-fun b!1052974 () Bool)

(declare-fun res!702151 () Bool)

(assert (=> b!1052974 (=> (not res!702151) (not e!597972))))

(declare-datatypes ((List!22285 0))(
  ( (Nil!22282) (Cons!22281 (h!23490 (_ BitVec 64)) (t!31583 List!22285)) )
))
(declare-fun arrayNoDuplicates!0 (array!66353 (_ BitVec 32) List!22285) Bool)

(assert (=> b!1052974 (= res!702151 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22282))))

(declare-fun b!1052975 () Bool)

(declare-fun res!702149 () Bool)

(assert (=> b!1052975 (=> (not res!702149) (not e!597972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052975 (= res!702149 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052976 () Bool)

(declare-fun e!597971 () Bool)

(assert (=> b!1052976 (= e!597971 false)))

(declare-fun lt!464868 () (_ BitVec 32))

(declare-fun lt!464869 () array!66353)

(declare-fun arrayScanForKey!0 (array!66353 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052976 (= lt!464868 (arrayScanForKey!0 lt!464869 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052977 () Bool)

(assert (=> b!1052977 (= e!597972 e!597971)))

(declare-fun res!702150 () Bool)

(assert (=> b!1052977 (=> (not res!702150) (not e!597971))))

(declare-fun arrayContainsKey!0 (array!66353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052977 (= res!702150 (arrayContainsKey!0 lt!464869 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052977 (= lt!464869 (array!66354 (store (arr!31914 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32452 a!3488)))))

(declare-fun res!702147 () Bool)

(assert (=> start!92638 (=> (not res!702147) (not e!597972))))

(assert (=> start!92638 (= res!702147 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32452 a!3488)) (bvslt (size!32452 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92638 e!597972))

(assert (=> start!92638 true))

(declare-fun array_inv!24697 (array!66353) Bool)

(assert (=> start!92638 (array_inv!24697 a!3488)))

(assert (= (and start!92638 res!702147) b!1052974))

(assert (= (and b!1052974 res!702151) b!1052975))

(assert (= (and b!1052975 res!702149) b!1052973))

(assert (= (and b!1052973 res!702148) b!1052977))

(assert (= (and b!1052977 res!702150) b!1052976))

(declare-fun m!972871 () Bool)

(assert (=> start!92638 m!972871))

(declare-fun m!972873 () Bool)

(assert (=> b!1052973 m!972873))

(declare-fun m!972875 () Bool)

(assert (=> b!1052974 m!972875))

(declare-fun m!972877 () Bool)

(assert (=> b!1052976 m!972877))

(declare-fun m!972879 () Bool)

(assert (=> b!1052977 m!972879))

(declare-fun m!972881 () Bool)

(assert (=> b!1052977 m!972881))

(declare-fun m!972883 () Bool)

(assert (=> b!1052975 m!972883))

(check-sat (not b!1052977) (not start!92638) (not b!1052976) (not b!1052974) (not b!1052975))
(check-sat)
