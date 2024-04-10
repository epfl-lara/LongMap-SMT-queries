; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92518 () Bool)

(assert start!92518)

(declare-fun b!1052265 () Bool)

(declare-fun e!597408 () Bool)

(declare-fun e!597414 () Bool)

(assert (=> b!1052265 (= e!597408 e!597414)))

(declare-fun res!701402 () Bool)

(assert (=> b!1052265 (=> (not res!701402) (not e!597414))))

(declare-fun lt!464675 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052265 (= res!701402 (not (= lt!464675 i!1381)))))

(declare-datatypes ((array!66319 0))(
  ( (array!66320 (arr!31899 (Array (_ BitVec 32) (_ BitVec 64))) (size!32435 (_ BitVec 32))) )
))
(declare-fun lt!464671 () array!66319)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66319 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052265 (= lt!464675 (arrayScanForKey!0 lt!464671 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052266 () Bool)

(declare-fun res!701394 () Bool)

(declare-fun e!597415 () Bool)

(assert (=> b!1052266 (=> res!701394 e!597415)))

(declare-datatypes ((List!22211 0))(
  ( (Nil!22208) (Cons!22207 (h!23416 (_ BitVec 64)) (t!31518 List!22211)) )
))
(declare-fun noDuplicate!1538 (List!22211) Bool)

(assert (=> b!1052266 (= res!701394 (not (noDuplicate!1538 Nil!22208)))))

(declare-fun b!1052267 () Bool)

(assert (=> b!1052267 (= e!597415 true)))

(declare-fun lt!464672 () Bool)

(declare-fun contains!6153 (List!22211 (_ BitVec 64)) Bool)

(assert (=> b!1052267 (= lt!464672 (contains!6153 Nil!22208 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!597411 () Bool)

(declare-fun a!3488 () array!66319)

(declare-fun b!1052268 () Bool)

(declare-fun arrayContainsKey!0 (array!66319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052268 (= e!597411 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1052269 () Bool)

(declare-fun e!597409 () Bool)

(assert (=> b!1052269 (= e!597409 e!597408)))

(declare-fun res!701392 () Bool)

(assert (=> b!1052269 (=> (not res!701392) (not e!597408))))

(assert (=> b!1052269 (= res!701392 (arrayContainsKey!0 lt!464671 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052269 (= lt!464671 (array!66320 (store (arr!31899 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32435 a!3488)))))

(declare-fun b!1052270 () Bool)

(declare-fun res!701395 () Bool)

(assert (=> b!1052270 (=> (not res!701395) (not e!597409))))

(assert (=> b!1052270 (= res!701395 (= (select (arr!31899 a!3488) i!1381) k!2747))))

(declare-fun res!701401 () Bool)

(assert (=> start!92518 (=> (not res!701401) (not e!597409))))

(assert (=> start!92518 (= res!701401 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32435 a!3488)) (bvslt (size!32435 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92518 e!597409))

(assert (=> start!92518 true))

(declare-fun array_inv!24679 (array!66319) Bool)

(assert (=> start!92518 (array_inv!24679 a!3488)))

(declare-fun b!1052271 () Bool)

(declare-fun e!597413 () Bool)

(assert (=> b!1052271 (= e!597413 e!597411)))

(declare-fun res!701399 () Bool)

(assert (=> b!1052271 (=> res!701399 e!597411)))

(assert (=> b!1052271 (= res!701399 (or (bvsgt lt!464675 i!1381) (bvsle i!1381 lt!464675)))))

(declare-fun b!1052272 () Bool)

(declare-fun res!701391 () Bool)

(assert (=> b!1052272 (=> (not res!701391) (not e!597409))))

(declare-fun arrayNoDuplicates!0 (array!66319 (_ BitVec 32) List!22211) Bool)

(assert (=> b!1052272 (= res!701391 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22208))))

(declare-fun b!1052273 () Bool)

(declare-fun res!701400 () Bool)

(assert (=> b!1052273 (=> res!701400 e!597415)))

(assert (=> b!1052273 (= res!701400 (contains!6153 Nil!22208 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052274 () Bool)

(declare-fun e!597412 () Bool)

(assert (=> b!1052274 (= e!597412 e!597415)))

(declare-fun res!701398 () Bool)

(assert (=> b!1052274 (=> res!701398 e!597415)))

(declare-fun lt!464676 () (_ BitVec 32))

(assert (=> b!1052274 (= res!701398 (or (bvslt lt!464675 #b00000000000000000000000000000000) (bvsge lt!464676 (size!32435 a!3488)) (bvsge lt!464675 (size!32435 a!3488))))))

(assert (=> b!1052274 (arrayContainsKey!0 a!3488 k!2747 lt!464676)))

(declare-datatypes ((Unit!34470 0))(
  ( (Unit!34471) )
))
(declare-fun lt!464674 () Unit!34470)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66319 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34470)

(assert (=> b!1052274 (= lt!464674 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464676))))

(assert (=> b!1052274 (= lt!464676 (bvadd #b00000000000000000000000000000001 lt!464675))))

(assert (=> b!1052274 (arrayNoDuplicates!0 a!3488 lt!464675 Nil!22208)))

(declare-fun lt!464673 () Unit!34470)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66319 (_ BitVec 32) (_ BitVec 32)) Unit!34470)

(assert (=> b!1052274 (= lt!464673 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464675))))

(declare-fun b!1052275 () Bool)

(assert (=> b!1052275 (= e!597414 (not e!597412))))

(declare-fun res!701393 () Bool)

(assert (=> b!1052275 (=> res!701393 e!597412)))

(assert (=> b!1052275 (= res!701393 (or (bvsgt lt!464675 i!1381) (bvsle i!1381 lt!464675)))))

(assert (=> b!1052275 e!597413))

(declare-fun res!701397 () Bool)

(assert (=> b!1052275 (=> (not res!701397) (not e!597413))))

(assert (=> b!1052275 (= res!701397 (= (select (store (arr!31899 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464675) k!2747))))

(declare-fun b!1052276 () Bool)

(declare-fun res!701396 () Bool)

(assert (=> b!1052276 (=> (not res!701396) (not e!597409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052276 (= res!701396 (validKeyInArray!0 k!2747))))

(assert (= (and start!92518 res!701401) b!1052272))

(assert (= (and b!1052272 res!701391) b!1052276))

(assert (= (and b!1052276 res!701396) b!1052270))

(assert (= (and b!1052270 res!701395) b!1052269))

(assert (= (and b!1052269 res!701392) b!1052265))

(assert (= (and b!1052265 res!701402) b!1052275))

(assert (= (and b!1052275 res!701397) b!1052271))

(assert (= (and b!1052271 (not res!701399)) b!1052268))

(assert (= (and b!1052275 (not res!701393)) b!1052274))

(assert (= (and b!1052274 (not res!701398)) b!1052266))

(assert (= (and b!1052266 (not res!701394)) b!1052273))

(assert (= (and b!1052273 (not res!701400)) b!1052267))

(declare-fun m!972663 () Bool)

(assert (=> b!1052275 m!972663))

(declare-fun m!972665 () Bool)

(assert (=> b!1052275 m!972665))

(declare-fun m!972667 () Bool)

(assert (=> start!92518 m!972667))

(declare-fun m!972669 () Bool)

(assert (=> b!1052274 m!972669))

(declare-fun m!972671 () Bool)

(assert (=> b!1052274 m!972671))

(declare-fun m!972673 () Bool)

(assert (=> b!1052274 m!972673))

(declare-fun m!972675 () Bool)

(assert (=> b!1052274 m!972675))

(declare-fun m!972677 () Bool)

(assert (=> b!1052268 m!972677))

(declare-fun m!972679 () Bool)

(assert (=> b!1052276 m!972679))

(declare-fun m!972681 () Bool)

(assert (=> b!1052272 m!972681))

(declare-fun m!972683 () Bool)

(assert (=> b!1052269 m!972683))

(assert (=> b!1052269 m!972663))

(declare-fun m!972685 () Bool)

(assert (=> b!1052266 m!972685))

(declare-fun m!972687 () Bool)

(assert (=> b!1052273 m!972687))

(declare-fun m!972689 () Bool)

(assert (=> b!1052270 m!972689))

(declare-fun m!972691 () Bool)

(assert (=> b!1052265 m!972691))

(declare-fun m!972693 () Bool)

(assert (=> b!1052267 m!972693))

(push 1)

