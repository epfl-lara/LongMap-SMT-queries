; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92512 () Bool)

(assert start!92512)

(declare-fun b!1052158 () Bool)

(declare-fun res!701287 () Bool)

(declare-fun e!597337 () Bool)

(assert (=> b!1052158 (=> (not res!701287) (not e!597337))))

(declare-datatypes ((array!66313 0))(
  ( (array!66314 (arr!31896 (Array (_ BitVec 32) (_ BitVec 64))) (size!32432 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66313)

(declare-datatypes ((List!22208 0))(
  ( (Nil!22205) (Cons!22204 (h!23413 (_ BitVec 64)) (t!31515 List!22208)) )
))
(declare-fun arrayNoDuplicates!0 (array!66313 (_ BitVec 32) List!22208) Bool)

(assert (=> b!1052158 (= res!701287 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22205))))

(declare-fun b!1052159 () Bool)

(declare-fun e!597340 () Bool)

(declare-fun e!597339 () Bool)

(assert (=> b!1052159 (= e!597340 e!597339)))

(declare-fun res!701294 () Bool)

(assert (=> b!1052159 (=> (not res!701294) (not e!597339))))

(declare-fun lt!464620 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052159 (= res!701294 (not (= lt!464620 i!1381)))))

(declare-fun lt!464618 () array!66313)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66313 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052159 (= lt!464620 (arrayScanForKey!0 lt!464618 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052160 () Bool)

(declare-fun res!701283 () Bool)

(declare-fun e!597341 () Bool)

(assert (=> b!1052160 (=> res!701283 e!597341)))

(declare-fun noDuplicate!1535 (List!22208) Bool)

(assert (=> b!1052160 (= res!701283 (not (noDuplicate!1535 Nil!22205)))))

(declare-fun e!597342 () Bool)

(declare-fun b!1052161 () Bool)

(declare-fun arrayContainsKey!0 (array!66313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052161 (= e!597342 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1052162 () Bool)

(declare-fun res!701286 () Bool)

(assert (=> b!1052162 (=> res!701286 e!597341)))

(declare-fun contains!6150 (List!22208 (_ BitVec 64)) Bool)

(assert (=> b!1052162 (= res!701286 (contains!6150 Nil!22205 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052163 () Bool)

(declare-fun res!701292 () Bool)

(assert (=> b!1052163 (=> (not res!701292) (not e!597337))))

(assert (=> b!1052163 (= res!701292 (= (select (arr!31896 a!3488) i!1381) k!2747))))

(declare-fun b!1052164 () Bool)

(declare-fun e!597343 () Bool)

(assert (=> b!1052164 (= e!597343 e!597342)))

(declare-fun res!701290 () Bool)

(assert (=> b!1052164 (=> res!701290 e!597342)))

(assert (=> b!1052164 (= res!701290 (or (bvsgt lt!464620 i!1381) (bvsle i!1381 lt!464620)))))

(declare-fun b!1052157 () Bool)

(declare-fun e!597336 () Bool)

(assert (=> b!1052157 (= e!597336 e!597341)))

(declare-fun res!701289 () Bool)

(assert (=> b!1052157 (=> res!701289 e!597341)))

(declare-fun lt!464619 () (_ BitVec 32))

(assert (=> b!1052157 (= res!701289 (or (bvslt lt!464620 #b00000000000000000000000000000000) (bvsge lt!464619 (size!32432 a!3488)) (bvsge lt!464620 (size!32432 a!3488))))))

(assert (=> b!1052157 (arrayContainsKey!0 a!3488 k!2747 lt!464619)))

(declare-datatypes ((Unit!34464 0))(
  ( (Unit!34465) )
))
(declare-fun lt!464621 () Unit!34464)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66313 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34464)

(assert (=> b!1052157 (= lt!464621 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464619))))

(assert (=> b!1052157 (= lt!464619 (bvadd #b00000000000000000000000000000001 lt!464620))))

(assert (=> b!1052157 (arrayNoDuplicates!0 a!3488 lt!464620 Nil!22205)))

(declare-fun lt!464622 () Unit!34464)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66313 (_ BitVec 32) (_ BitVec 32)) Unit!34464)

(assert (=> b!1052157 (= lt!464622 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464620))))

(declare-fun res!701293 () Bool)

(assert (=> start!92512 (=> (not res!701293) (not e!597337))))

(assert (=> start!92512 (= res!701293 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32432 a!3488)) (bvslt (size!32432 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92512 e!597337))

(assert (=> start!92512 true))

(declare-fun array_inv!24676 (array!66313) Bool)

(assert (=> start!92512 (array_inv!24676 a!3488)))

(declare-fun b!1052165 () Bool)

(assert (=> b!1052165 (= e!597339 (not e!597336))))

(declare-fun res!701291 () Bool)

(assert (=> b!1052165 (=> res!701291 e!597336)))

(assert (=> b!1052165 (= res!701291 (or (bvsgt lt!464620 i!1381) (bvsle i!1381 lt!464620)))))

(assert (=> b!1052165 e!597343))

(declare-fun res!701285 () Bool)

(assert (=> b!1052165 (=> (not res!701285) (not e!597343))))

(assert (=> b!1052165 (= res!701285 (= (select (store (arr!31896 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464620) k!2747))))

(declare-fun b!1052166 () Bool)

(declare-fun res!701284 () Bool)

(assert (=> b!1052166 (=> (not res!701284) (not e!597337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052166 (= res!701284 (validKeyInArray!0 k!2747))))

(declare-fun b!1052167 () Bool)

(assert (=> b!1052167 (= e!597337 e!597340)))

(declare-fun res!701288 () Bool)

(assert (=> b!1052167 (=> (not res!701288) (not e!597340))))

(assert (=> b!1052167 (= res!701288 (arrayContainsKey!0 lt!464618 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052167 (= lt!464618 (array!66314 (store (arr!31896 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32432 a!3488)))))

(declare-fun b!1052168 () Bool)

(assert (=> b!1052168 (= e!597341 true)))

(declare-fun lt!464617 () Bool)

(assert (=> b!1052168 (= lt!464617 (contains!6150 Nil!22205 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92512 res!701293) b!1052158))

(assert (= (and b!1052158 res!701287) b!1052166))

(assert (= (and b!1052166 res!701284) b!1052163))

(assert (= (and b!1052163 res!701292) b!1052167))

(assert (= (and b!1052167 res!701288) b!1052159))

(assert (= (and b!1052159 res!701294) b!1052165))

(assert (= (and b!1052165 res!701285) b!1052164))

(assert (= (and b!1052164 (not res!701290)) b!1052161))

(assert (= (and b!1052165 (not res!701291)) b!1052157))

(assert (= (and b!1052157 (not res!701289)) b!1052160))

(assert (= (and b!1052160 (not res!701283)) b!1052162))

(assert (= (and b!1052162 (not res!701286)) b!1052168))

(declare-fun m!972567 () Bool)

(assert (=> start!92512 m!972567))

(declare-fun m!972569 () Bool)

(assert (=> b!1052160 m!972569))

(declare-fun m!972571 () Bool)

(assert (=> b!1052163 m!972571))

(declare-fun m!972573 () Bool)

(assert (=> b!1052166 m!972573))

(declare-fun m!972575 () Bool)

(assert (=> b!1052157 m!972575))

(declare-fun m!972577 () Bool)

(assert (=> b!1052157 m!972577))

(declare-fun m!972579 () Bool)

(assert (=> b!1052157 m!972579))

(declare-fun m!972581 () Bool)

(assert (=> b!1052157 m!972581))

(declare-fun m!972583 () Bool)

(assert (=> b!1052165 m!972583))

(declare-fun m!972585 () Bool)

(assert (=> b!1052165 m!972585))

(declare-fun m!972587 () Bool)

(assert (=> b!1052161 m!972587))

(declare-fun m!972589 () Bool)

(assert (=> b!1052158 m!972589))

(declare-fun m!972591 () Bool)

(assert (=> b!1052159 m!972591))

(declare-fun m!972593 () Bool)

(assert (=> b!1052168 m!972593))

(declare-fun m!972595 () Bool)

(assert (=> b!1052162 m!972595))

(declare-fun m!972597 () Bool)

(assert (=> b!1052167 m!972597))

(assert (=> b!1052167 m!972583))

(push 1)

(assert (not b!1052168))

