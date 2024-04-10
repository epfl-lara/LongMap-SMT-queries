; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92340 () Bool)

(assert start!92340)

(declare-fun b!1049646 () Bool)

(declare-fun e!595554 () Bool)

(declare-fun lt!463599 () (_ BitVec 32))

(declare-datatypes ((array!66141 0))(
  ( (array!66142 (arr!31810 (Array (_ BitVec 32) (_ BitVec 64))) (size!32346 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66141)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049646 (= e!595554 (arrayContainsKey!0 a!3488 k!2747 lt!463599))))

(declare-fun b!1049647 () Bool)

(declare-fun res!698780 () Bool)

(declare-fun e!595552 () Bool)

(assert (=> b!1049647 (=> (not res!698780) (not e!595552))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049647 (= res!698780 (= (select (arr!31810 a!3488) i!1381) k!2747))))

(declare-fun b!1049648 () Bool)

(declare-fun res!698779 () Bool)

(declare-fun e!595557 () Bool)

(assert (=> b!1049648 (=> res!698779 e!595557)))

(declare-datatypes ((List!22122 0))(
  ( (Nil!22119) (Cons!22118 (h!23327 (_ BitVec 64)) (t!31429 List!22122)) )
))
(declare-fun noDuplicate!1500 (List!22122) Bool)

(assert (=> b!1049648 (= res!698779 (not (noDuplicate!1500 Nil!22119)))))

(declare-fun b!1049649 () Bool)

(declare-fun e!595556 () Bool)

(declare-fun e!595555 () Bool)

(assert (=> b!1049649 (= e!595556 (not e!595555))))

(declare-fun res!698781 () Bool)

(assert (=> b!1049649 (=> res!698781 e!595555)))

(assert (=> b!1049649 (= res!698781 (bvsle lt!463599 i!1381))))

(declare-fun e!595551 () Bool)

(assert (=> b!1049649 e!595551))

(declare-fun res!698777 () Bool)

(assert (=> b!1049649 (=> (not res!698777) (not e!595551))))

(assert (=> b!1049649 (= res!698777 (= (select (store (arr!31810 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463599) k!2747))))

(declare-fun b!1049650 () Bool)

(declare-fun res!698775 () Bool)

(assert (=> b!1049650 (=> (not res!698775) (not e!595552))))

(declare-fun arrayNoDuplicates!0 (array!66141 (_ BitVec 32) List!22122) Bool)

(assert (=> b!1049650 (= res!698775 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22119))))

(declare-fun b!1049651 () Bool)

(declare-fun res!698773 () Bool)

(assert (=> b!1049651 (=> (not res!698773) (not e!595552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049651 (= res!698773 (validKeyInArray!0 k!2747))))

(declare-fun res!698778 () Bool)

(assert (=> start!92340 (=> (not res!698778) (not e!595552))))

(assert (=> start!92340 (= res!698778 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32346 a!3488)) (bvslt (size!32346 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92340 e!595552))

(assert (=> start!92340 true))

(declare-fun array_inv!24590 (array!66141) Bool)

(assert (=> start!92340 (array_inv!24590 a!3488)))

(declare-fun b!1049652 () Bool)

(assert (=> b!1049652 (= e!595557 true)))

(declare-fun lt!463598 () Bool)

(declare-fun contains!6115 (List!22122 (_ BitVec 64)) Bool)

(assert (=> b!1049652 (= lt!463598 (contains!6115 Nil!22119 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049653 () Bool)

(assert (=> b!1049653 (= e!595555 e!595557)))

(declare-fun res!698772 () Bool)

(assert (=> b!1049653 (=> res!698772 e!595557)))

(assert (=> b!1049653 (= res!698772 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32346 a!3488)))))

(assert (=> b!1049653 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34340 0))(
  ( (Unit!34341) )
))
(declare-fun lt!463602 () Unit!34340)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66141 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34340)

(assert (=> b!1049653 (= lt!463602 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463599 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1049653 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22119)))

(declare-fun lt!463600 () Unit!34340)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66141 (_ BitVec 32) (_ BitVec 32)) Unit!34340)

(assert (=> b!1049653 (= lt!463600 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049654 () Bool)

(declare-fun res!698783 () Bool)

(assert (=> b!1049654 (=> res!698783 e!595557)))

(assert (=> b!1049654 (= res!698783 (contains!6115 Nil!22119 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049655 () Bool)

(declare-fun e!595558 () Bool)

(assert (=> b!1049655 (= e!595552 e!595558)))

(declare-fun res!698774 () Bool)

(assert (=> b!1049655 (=> (not res!698774) (not e!595558))))

(declare-fun lt!463601 () array!66141)

(assert (=> b!1049655 (= res!698774 (arrayContainsKey!0 lt!463601 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049655 (= lt!463601 (array!66142 (store (arr!31810 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32346 a!3488)))))

(declare-fun b!1049656 () Bool)

(assert (=> b!1049656 (= e!595558 e!595556)))

(declare-fun res!698782 () Bool)

(assert (=> b!1049656 (=> (not res!698782) (not e!595556))))

(assert (=> b!1049656 (= res!698782 (not (= lt!463599 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66141 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049656 (= lt!463599 (arrayScanForKey!0 lt!463601 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049657 () Bool)

(assert (=> b!1049657 (= e!595551 e!595554)))

(declare-fun res!698776 () Bool)

(assert (=> b!1049657 (=> res!698776 e!595554)))

(assert (=> b!1049657 (= res!698776 (bvsle lt!463599 i!1381))))

(assert (= (and start!92340 res!698778) b!1049650))

(assert (= (and b!1049650 res!698775) b!1049651))

(assert (= (and b!1049651 res!698773) b!1049647))

(assert (= (and b!1049647 res!698780) b!1049655))

(assert (= (and b!1049655 res!698774) b!1049656))

(assert (= (and b!1049656 res!698782) b!1049649))

(assert (= (and b!1049649 res!698777) b!1049657))

(assert (= (and b!1049657 (not res!698776)) b!1049646))

(assert (= (and b!1049649 (not res!698781)) b!1049653))

(assert (= (and b!1049653 (not res!698772)) b!1049648))

(assert (= (and b!1049648 (not res!698779)) b!1049654))

(assert (= (and b!1049654 (not res!698783)) b!1049652))

(declare-fun m!970385 () Bool)

(assert (=> b!1049653 m!970385))

(declare-fun m!970387 () Bool)

(assert (=> b!1049653 m!970387))

(declare-fun m!970389 () Bool)

(assert (=> b!1049653 m!970389))

(declare-fun m!970391 () Bool)

(assert (=> b!1049653 m!970391))

(declare-fun m!970393 () Bool)

(assert (=> b!1049649 m!970393))

(declare-fun m!970395 () Bool)

(assert (=> b!1049649 m!970395))

(declare-fun m!970397 () Bool)

(assert (=> b!1049654 m!970397))

(declare-fun m!970399 () Bool)

(assert (=> start!92340 m!970399))

(declare-fun m!970401 () Bool)

(assert (=> b!1049655 m!970401))

(assert (=> b!1049655 m!970393))

(declare-fun m!970403 () Bool)

(assert (=> b!1049647 m!970403))

(declare-fun m!970405 () Bool)

(assert (=> b!1049652 m!970405))

(declare-fun m!970407 () Bool)

(assert (=> b!1049656 m!970407))

(declare-fun m!970409 () Bool)

(assert (=> b!1049648 m!970409))

(declare-fun m!970411 () Bool)

(assert (=> b!1049650 m!970411))

(declare-fun m!970413 () Bool)

(assert (=> b!1049646 m!970413))

(declare-fun m!970415 () Bool)

(assert (=> b!1049651 m!970415))

(push 1)

(assert (not b!1049655))

(assert (not b!1049652))

(assert (not b!1049648))

(assert (not b!1049654))

(assert (not start!92340))

(assert (not b!1049653))

(assert (not b!1049646))

