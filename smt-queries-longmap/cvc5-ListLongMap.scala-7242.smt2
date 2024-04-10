; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92514 () Bool)

(assert start!92514)

(declare-fun b!1052193 () Bool)

(declare-fun res!701320 () Bool)

(declare-fun e!597360 () Bool)

(assert (=> b!1052193 (=> (not res!701320) (not e!597360))))

(declare-datatypes ((array!66315 0))(
  ( (array!66316 (arr!31897 (Array (_ BitVec 32) (_ BitVec 64))) (size!32433 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66315)

(declare-datatypes ((List!22209 0))(
  ( (Nil!22206) (Cons!22205 (h!23414 (_ BitVec 64)) (t!31516 List!22209)) )
))
(declare-fun arrayNoDuplicates!0 (array!66315 (_ BitVec 32) List!22209) Bool)

(assert (=> b!1052193 (= res!701320 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22206))))

(declare-fun e!597363 () Bool)

(declare-fun b!1052194 () Bool)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052194 (= e!597363 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1052195 () Bool)

(declare-fun res!701328 () Bool)

(assert (=> b!1052195 (=> (not res!701328) (not e!597360))))

(assert (=> b!1052195 (= res!701328 (= (select (arr!31897 a!3488) i!1381) k!2747))))

(declare-fun res!701325 () Bool)

(assert (=> start!92514 (=> (not res!701325) (not e!597360))))

(assert (=> start!92514 (= res!701325 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32433 a!3488)) (bvslt (size!32433 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92514 e!597360))

(assert (=> start!92514 true))

(declare-fun array_inv!24677 (array!66315) Bool)

(assert (=> start!92514 (array_inv!24677 a!3488)))

(declare-fun b!1052196 () Bool)

(declare-fun e!597366 () Bool)

(assert (=> b!1052196 (= e!597366 e!597363)))

(declare-fun res!701329 () Bool)

(assert (=> b!1052196 (=> res!701329 e!597363)))

(declare-fun lt!464637 () (_ BitVec 32))

(assert (=> b!1052196 (= res!701329 (or (bvsgt lt!464637 i!1381) (bvsle i!1381 lt!464637)))))

(declare-fun b!1052197 () Bool)

(declare-fun res!701323 () Bool)

(declare-fun e!597361 () Bool)

(assert (=> b!1052197 (=> res!701323 e!597361)))

(declare-fun noDuplicate!1536 (List!22209) Bool)

(assert (=> b!1052197 (= res!701323 (not (noDuplicate!1536 Nil!22206)))))

(declare-fun b!1052198 () Bool)

(declare-fun res!701319 () Bool)

(assert (=> b!1052198 (=> (not res!701319) (not e!597360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052198 (= res!701319 (validKeyInArray!0 k!2747))))

(declare-fun b!1052199 () Bool)

(declare-fun res!701330 () Bool)

(assert (=> b!1052199 (=> res!701330 e!597361)))

(declare-fun contains!6151 (List!22209 (_ BitVec 64)) Bool)

(assert (=> b!1052199 (= res!701330 (contains!6151 Nil!22206 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052200 () Bool)

(assert (=> b!1052200 (= e!597361 true)))

(declare-fun lt!464640 () Bool)

(assert (=> b!1052200 (= lt!464640 (contains!6151 Nil!22206 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052201 () Bool)

(declare-fun e!597365 () Bool)

(assert (=> b!1052201 (= e!597360 e!597365)))

(declare-fun res!701321 () Bool)

(assert (=> b!1052201 (=> (not res!701321) (not e!597365))))

(declare-fun lt!464636 () array!66315)

(assert (=> b!1052201 (= res!701321 (arrayContainsKey!0 lt!464636 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052201 (= lt!464636 (array!66316 (store (arr!31897 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32433 a!3488)))))

(declare-fun b!1052202 () Bool)

(declare-fun e!597362 () Bool)

(assert (=> b!1052202 (= e!597365 e!597362)))

(declare-fun res!701327 () Bool)

(assert (=> b!1052202 (=> (not res!701327) (not e!597362))))

(assert (=> b!1052202 (= res!701327 (not (= lt!464637 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66315 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052202 (= lt!464637 (arrayScanForKey!0 lt!464636 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052203 () Bool)

(declare-fun e!597367 () Bool)

(assert (=> b!1052203 (= e!597362 (not e!597367))))

(declare-fun res!701322 () Bool)

(assert (=> b!1052203 (=> res!701322 e!597367)))

(assert (=> b!1052203 (= res!701322 (or (bvsgt lt!464637 i!1381) (bvsle i!1381 lt!464637)))))

(assert (=> b!1052203 e!597366))

(declare-fun res!701324 () Bool)

(assert (=> b!1052203 (=> (not res!701324) (not e!597366))))

(assert (=> b!1052203 (= res!701324 (= (select (store (arr!31897 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464637) k!2747))))

(declare-fun b!1052204 () Bool)

(assert (=> b!1052204 (= e!597367 e!597361)))

(declare-fun res!701326 () Bool)

(assert (=> b!1052204 (=> res!701326 e!597361)))

(declare-fun lt!464638 () (_ BitVec 32))

(assert (=> b!1052204 (= res!701326 (or (bvslt lt!464637 #b00000000000000000000000000000000) (bvsge lt!464638 (size!32433 a!3488)) (bvsge lt!464637 (size!32433 a!3488))))))

(assert (=> b!1052204 (arrayContainsKey!0 a!3488 k!2747 lt!464638)))

(declare-datatypes ((Unit!34466 0))(
  ( (Unit!34467) )
))
(declare-fun lt!464635 () Unit!34466)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66315 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34466)

(assert (=> b!1052204 (= lt!464635 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464638))))

(assert (=> b!1052204 (= lt!464638 (bvadd #b00000000000000000000000000000001 lt!464637))))

(assert (=> b!1052204 (arrayNoDuplicates!0 a!3488 lt!464637 Nil!22206)))

(declare-fun lt!464639 () Unit!34466)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66315 (_ BitVec 32) (_ BitVec 32)) Unit!34466)

(assert (=> b!1052204 (= lt!464639 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464637))))

(assert (= (and start!92514 res!701325) b!1052193))

(assert (= (and b!1052193 res!701320) b!1052198))

(assert (= (and b!1052198 res!701319) b!1052195))

(assert (= (and b!1052195 res!701328) b!1052201))

(assert (= (and b!1052201 res!701321) b!1052202))

(assert (= (and b!1052202 res!701327) b!1052203))

(assert (= (and b!1052203 res!701324) b!1052196))

(assert (= (and b!1052196 (not res!701329)) b!1052194))

(assert (= (and b!1052203 (not res!701322)) b!1052204))

(assert (= (and b!1052204 (not res!701326)) b!1052197))

(assert (= (and b!1052197 (not res!701323)) b!1052199))

(assert (= (and b!1052199 (not res!701330)) b!1052200))

(declare-fun m!972599 () Bool)

(assert (=> b!1052195 m!972599))

(declare-fun m!972601 () Bool)

(assert (=> b!1052204 m!972601))

(declare-fun m!972603 () Bool)

(assert (=> b!1052204 m!972603))

(declare-fun m!972605 () Bool)

(assert (=> b!1052204 m!972605))

(declare-fun m!972607 () Bool)

(assert (=> b!1052204 m!972607))

(declare-fun m!972609 () Bool)

(assert (=> b!1052202 m!972609))

(declare-fun m!972611 () Bool)

(assert (=> b!1052198 m!972611))

(declare-fun m!972613 () Bool)

(assert (=> b!1052203 m!972613))

(declare-fun m!972615 () Bool)

(assert (=> b!1052203 m!972615))

(declare-fun m!972617 () Bool)

(assert (=> b!1052199 m!972617))

(declare-fun m!972619 () Bool)

(assert (=> start!92514 m!972619))

(declare-fun m!972621 () Bool)

(assert (=> b!1052193 m!972621))

(declare-fun m!972623 () Bool)

(assert (=> b!1052197 m!972623))

(declare-fun m!972625 () Bool)

(assert (=> b!1052194 m!972625))

(declare-fun m!972627 () Bool)

(assert (=> b!1052201 m!972627))

(assert (=> b!1052201 m!972613))

(declare-fun m!972629 () Bool)

(assert (=> b!1052200 m!972629))

(push 1)

