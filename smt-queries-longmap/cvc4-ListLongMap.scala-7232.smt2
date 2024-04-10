; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92458 () Bool)

(assert start!92458)

(declare-fun b!1051269 () Bool)

(declare-fun e!596718 () Bool)

(declare-fun e!596720 () Bool)

(assert (=> b!1051269 (= e!596718 e!596720)))

(declare-fun res!700399 () Bool)

(assert (=> b!1051269 (=> (not res!700399) (not e!596720))))

(declare-fun lt!464216 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051269 (= res!700399 (not (= lt!464216 i!1381)))))

(declare-datatypes ((array!66259 0))(
  ( (array!66260 (arr!31869 (Array (_ BitVec 32) (_ BitVec 64))) (size!32405 (_ BitVec 32))) )
))
(declare-fun lt!464215 () array!66259)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66259 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051269 (= lt!464216 (arrayScanForKey!0 lt!464215 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051270 () Bool)

(declare-fun a!3488 () array!66259)

(declare-fun e!596722 () Bool)

(declare-fun arrayContainsKey!0 (array!66259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051270 (= e!596722 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051271 () Bool)

(declare-fun res!700396 () Bool)

(declare-fun e!596716 () Bool)

(assert (=> b!1051271 (=> (not res!700396) (not e!596716))))

(assert (=> b!1051271 (= res!700396 (= (select (arr!31869 a!3488) i!1381) k!2747))))

(declare-fun b!1051272 () Bool)

(declare-fun e!596719 () Bool)

(assert (=> b!1051272 (= e!596719 e!596722)))

(declare-fun res!700402 () Bool)

(assert (=> b!1051272 (=> res!700402 e!596722)))

(assert (=> b!1051272 (= res!700402 (or (bvsgt lt!464216 i!1381) (bvsle i!1381 lt!464216)))))

(declare-fun b!1051273 () Bool)

(assert (=> b!1051273 (= e!596716 e!596718)))

(declare-fun res!700397 () Bool)

(assert (=> b!1051273 (=> (not res!700397) (not e!596718))))

(assert (=> b!1051273 (= res!700397 (arrayContainsKey!0 lt!464215 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051273 (= lt!464215 (array!66260 (store (arr!31869 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32405 a!3488)))))

(declare-fun b!1051274 () Bool)

(declare-fun res!700401 () Bool)

(assert (=> b!1051274 (=> (not res!700401) (not e!596716))))

(declare-datatypes ((List!22181 0))(
  ( (Nil!22178) (Cons!22177 (h!23386 (_ BitVec 64)) (t!31488 List!22181)) )
))
(declare-fun arrayNoDuplicates!0 (array!66259 (_ BitVec 32) List!22181) Bool)

(assert (=> b!1051274 (= res!700401 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22178))))

(declare-fun res!700398 () Bool)

(assert (=> start!92458 (=> (not res!700398) (not e!596716))))

(assert (=> start!92458 (= res!700398 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32405 a!3488)) (bvslt (size!32405 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92458 e!596716))

(assert (=> start!92458 true))

(declare-fun array_inv!24649 (array!66259) Bool)

(assert (=> start!92458 (array_inv!24649 a!3488)))

(declare-fun b!1051275 () Bool)

(declare-fun e!596717 () Bool)

(assert (=> b!1051275 (= e!596720 (not e!596717))))

(declare-fun res!700395 () Bool)

(assert (=> b!1051275 (=> res!700395 e!596717)))

(assert (=> b!1051275 (= res!700395 (or (bvsgt lt!464216 i!1381) (bvsle i!1381 lt!464216)))))

(assert (=> b!1051275 e!596719))

(declare-fun res!700400 () Bool)

(assert (=> b!1051275 (=> (not res!700400) (not e!596719))))

(assert (=> b!1051275 (= res!700400 (= (select (store (arr!31869 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464216) k!2747))))

(declare-fun b!1051276 () Bool)

(declare-fun res!700403 () Bool)

(assert (=> b!1051276 (=> (not res!700403) (not e!596716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051276 (= res!700403 (validKeyInArray!0 k!2747))))

(declare-fun b!1051277 () Bool)

(assert (=> b!1051277 (= e!596717 true)))

(assert (=> b!1051277 (arrayNoDuplicates!0 a!3488 lt!464216 Nil!22178)))

(declare-datatypes ((Unit!34410 0))(
  ( (Unit!34411) )
))
(declare-fun lt!464217 () Unit!34410)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66259 (_ BitVec 32) (_ BitVec 32)) Unit!34410)

(assert (=> b!1051277 (= lt!464217 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464216))))

(assert (= (and start!92458 res!700398) b!1051274))

(assert (= (and b!1051274 res!700401) b!1051276))

(assert (= (and b!1051276 res!700403) b!1051271))

(assert (= (and b!1051271 res!700396) b!1051273))

(assert (= (and b!1051273 res!700397) b!1051269))

(assert (= (and b!1051269 res!700399) b!1051275))

(assert (= (and b!1051275 res!700400) b!1051272))

(assert (= (and b!1051272 (not res!700402)) b!1051270))

(assert (= (and b!1051275 (not res!700395)) b!1051277))

(declare-fun m!971803 () Bool)

(assert (=> b!1051277 m!971803))

(declare-fun m!971805 () Bool)

(assert (=> b!1051277 m!971805))

(declare-fun m!971807 () Bool)

(assert (=> b!1051269 m!971807))

(declare-fun m!971809 () Bool)

(assert (=> b!1051275 m!971809))

(declare-fun m!971811 () Bool)

(assert (=> b!1051275 m!971811))

(declare-fun m!971813 () Bool)

(assert (=> b!1051273 m!971813))

(assert (=> b!1051273 m!971809))

(declare-fun m!971815 () Bool)

(assert (=> b!1051274 m!971815))

(declare-fun m!971817 () Bool)

(assert (=> b!1051271 m!971817))

(declare-fun m!971819 () Bool)

(assert (=> start!92458 m!971819))

(declare-fun m!971821 () Bool)

(assert (=> b!1051270 m!971821))

(declare-fun m!971823 () Bool)

(assert (=> b!1051276 m!971823))

(push 1)

(assert (not b!1051274))

(assert (not b!1051270))

(assert (not b!1051276))

(assert (not b!1051277))

