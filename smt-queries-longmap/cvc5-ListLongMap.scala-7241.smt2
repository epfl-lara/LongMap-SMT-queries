; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92508 () Bool)

(assert start!92508)

(declare-fun b!1052085 () Bool)

(declare-fun e!597290 () Bool)

(declare-fun e!597288 () Bool)

(assert (=> b!1052085 (= e!597290 (not e!597288))))

(declare-fun res!701215 () Bool)

(assert (=> b!1052085 (=> res!701215 e!597288)))

(declare-fun lt!464586 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052085 (= res!701215 (or (bvsgt lt!464586 i!1381) (bvsle i!1381 lt!464586)))))

(declare-fun e!597292 () Bool)

(assert (=> b!1052085 e!597292))

(declare-fun res!701220 () Bool)

(assert (=> b!1052085 (=> (not res!701220) (not e!597292))))

(declare-datatypes ((array!66309 0))(
  ( (array!66310 (arr!31894 (Array (_ BitVec 32) (_ BitVec 64))) (size!32430 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66309)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1052085 (= res!701220 (= (select (store (arr!31894 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464586) k!2747))))

(declare-fun b!1052086 () Bool)

(declare-fun res!701214 () Bool)

(declare-fun e!597289 () Bool)

(assert (=> b!1052086 (=> (not res!701214) (not e!597289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052086 (= res!701214 (validKeyInArray!0 k!2747))))

(declare-fun b!1052088 () Bool)

(declare-fun res!701221 () Bool)

(declare-fun e!597295 () Bool)

(assert (=> b!1052088 (=> res!701221 e!597295)))

(declare-datatypes ((List!22206 0))(
  ( (Nil!22203) (Cons!22202 (h!23411 (_ BitVec 64)) (t!31513 List!22206)) )
))
(declare-fun noDuplicate!1533 (List!22206) Bool)

(assert (=> b!1052088 (= res!701221 (not (noDuplicate!1533 Nil!22203)))))

(declare-fun b!1052089 () Bool)

(declare-fun e!597294 () Bool)

(assert (=> b!1052089 (= e!597289 e!597294)))

(declare-fun res!701213 () Bool)

(assert (=> b!1052089 (=> (not res!701213) (not e!597294))))

(declare-fun lt!464581 () array!66309)

(declare-fun arrayContainsKey!0 (array!66309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052089 (= res!701213 (arrayContainsKey!0 lt!464581 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052089 (= lt!464581 (array!66310 (store (arr!31894 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32430 a!3488)))))

(declare-fun b!1052090 () Bool)

(declare-fun res!701219 () Bool)

(assert (=> b!1052090 (=> res!701219 e!597295)))

(declare-fun contains!6148 (List!22206 (_ BitVec 64)) Bool)

(assert (=> b!1052090 (= res!701219 (contains!6148 Nil!22203 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052091 () Bool)

(declare-fun res!701216 () Bool)

(assert (=> b!1052091 (=> (not res!701216) (not e!597289))))

(assert (=> b!1052091 (= res!701216 (= (select (arr!31894 a!3488) i!1381) k!2747))))

(declare-fun b!1052092 () Bool)

(assert (=> b!1052092 (= e!597295 true)))

(declare-fun lt!464583 () Bool)

(assert (=> b!1052092 (= lt!464583 (contains!6148 Nil!22203 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052093 () Bool)

(assert (=> b!1052093 (= e!597294 e!597290)))

(declare-fun res!701217 () Bool)

(assert (=> b!1052093 (=> (not res!701217) (not e!597290))))

(assert (=> b!1052093 (= res!701217 (not (= lt!464586 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66309 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052093 (= lt!464586 (arrayScanForKey!0 lt!464581 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052094 () Bool)

(declare-fun e!597291 () Bool)

(assert (=> b!1052094 (= e!597292 e!597291)))

(declare-fun res!701222 () Bool)

(assert (=> b!1052094 (=> res!701222 e!597291)))

(assert (=> b!1052094 (= res!701222 (or (bvsgt lt!464586 i!1381) (bvsle i!1381 lt!464586)))))

(declare-fun res!701218 () Bool)

(assert (=> start!92508 (=> (not res!701218) (not e!597289))))

(assert (=> start!92508 (= res!701218 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32430 a!3488)) (bvslt (size!32430 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92508 e!597289))

(assert (=> start!92508 true))

(declare-fun array_inv!24674 (array!66309) Bool)

(assert (=> start!92508 (array_inv!24674 a!3488)))

(declare-fun b!1052087 () Bool)

(assert (=> b!1052087 (= e!597291 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1052095 () Bool)

(assert (=> b!1052095 (= e!597288 e!597295)))

(declare-fun res!701212 () Bool)

(assert (=> b!1052095 (=> res!701212 e!597295)))

(declare-fun lt!464582 () (_ BitVec 32))

(assert (=> b!1052095 (= res!701212 (or (bvslt lt!464586 #b00000000000000000000000000000000) (bvsge lt!464582 (size!32430 a!3488)) (bvsge lt!464586 (size!32430 a!3488))))))

(assert (=> b!1052095 (arrayContainsKey!0 a!3488 k!2747 lt!464582)))

(declare-datatypes ((Unit!34460 0))(
  ( (Unit!34461) )
))
(declare-fun lt!464585 () Unit!34460)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66309 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34460)

(assert (=> b!1052095 (= lt!464585 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464582))))

(assert (=> b!1052095 (= lt!464582 (bvadd #b00000000000000000000000000000001 lt!464586))))

(declare-fun arrayNoDuplicates!0 (array!66309 (_ BitVec 32) List!22206) Bool)

(assert (=> b!1052095 (arrayNoDuplicates!0 a!3488 lt!464586 Nil!22203)))

(declare-fun lt!464584 () Unit!34460)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66309 (_ BitVec 32) (_ BitVec 32)) Unit!34460)

(assert (=> b!1052095 (= lt!464584 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464586))))

(declare-fun b!1052096 () Bool)

(declare-fun res!701211 () Bool)

(assert (=> b!1052096 (=> (not res!701211) (not e!597289))))

(assert (=> b!1052096 (= res!701211 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22203))))

(assert (= (and start!92508 res!701218) b!1052096))

(assert (= (and b!1052096 res!701211) b!1052086))

(assert (= (and b!1052086 res!701214) b!1052091))

(assert (= (and b!1052091 res!701216) b!1052089))

(assert (= (and b!1052089 res!701213) b!1052093))

(assert (= (and b!1052093 res!701217) b!1052085))

(assert (= (and b!1052085 res!701220) b!1052094))

(assert (= (and b!1052094 (not res!701222)) b!1052087))

(assert (= (and b!1052085 (not res!701215)) b!1052095))

(assert (= (and b!1052095 (not res!701212)) b!1052088))

(assert (= (and b!1052088 (not res!701221)) b!1052090))

(assert (= (and b!1052090 (not res!701219)) b!1052092))

(declare-fun m!972503 () Bool)

(assert (=> b!1052091 m!972503))

(declare-fun m!972505 () Bool)

(assert (=> b!1052096 m!972505))

(declare-fun m!972507 () Bool)

(assert (=> b!1052088 m!972507))

(declare-fun m!972509 () Bool)

(assert (=> b!1052092 m!972509))

(declare-fun m!972511 () Bool)

(assert (=> b!1052095 m!972511))

(declare-fun m!972513 () Bool)

(assert (=> b!1052095 m!972513))

(declare-fun m!972515 () Bool)

(assert (=> b!1052095 m!972515))

(declare-fun m!972517 () Bool)

(assert (=> b!1052095 m!972517))

(declare-fun m!972519 () Bool)

(assert (=> start!92508 m!972519))

(declare-fun m!972521 () Bool)

(assert (=> b!1052086 m!972521))

(declare-fun m!972523 () Bool)

(assert (=> b!1052089 m!972523))

(declare-fun m!972525 () Bool)

(assert (=> b!1052089 m!972525))

(declare-fun m!972527 () Bool)

(assert (=> b!1052090 m!972527))

(declare-fun m!972529 () Bool)

(assert (=> b!1052093 m!972529))

(declare-fun m!972531 () Bool)

(assert (=> b!1052087 m!972531))

(assert (=> b!1052085 m!972525))

(declare-fun m!972533 () Bool)

(assert (=> b!1052085 m!972533))

(push 1)

