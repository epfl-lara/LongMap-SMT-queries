; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92316 () Bool)

(assert start!92316)

(declare-fun b!1049235 () Bool)

(declare-fun res!698363 () Bool)

(declare-fun e!595275 () Bool)

(assert (=> b!1049235 (=> (not res!698363) (not e!595275))))

(declare-datatypes ((array!66117 0))(
  ( (array!66118 (arr!31798 (Array (_ BitVec 32) (_ BitVec 64))) (size!32334 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66117)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049235 (= res!698363 (= (select (arr!31798 a!3488) i!1381) k!2747))))

(declare-fun b!1049236 () Bool)

(declare-fun e!595276 () Bool)

(declare-fun e!595272 () Bool)

(assert (=> b!1049236 (= e!595276 e!595272)))

(declare-fun res!698361 () Bool)

(assert (=> b!1049236 (=> res!698361 e!595272)))

(declare-fun lt!463433 () (_ BitVec 32))

(assert (=> b!1049236 (= res!698361 (bvsle lt!463433 i!1381))))

(declare-fun b!1049237 () Bool)

(declare-fun e!595273 () Bool)

(declare-fun e!595271 () Bool)

(assert (=> b!1049237 (= e!595273 (not e!595271))))

(declare-fun res!698367 () Bool)

(assert (=> b!1049237 (=> res!698367 e!595271)))

(assert (=> b!1049237 (= res!698367 (bvsle lt!463433 i!1381))))

(assert (=> b!1049237 e!595276))

(declare-fun res!698369 () Bool)

(assert (=> b!1049237 (=> (not res!698369) (not e!595276))))

(assert (=> b!1049237 (= res!698369 (= (select (store (arr!31798 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463433) k!2747))))

(declare-fun b!1049238 () Bool)

(declare-fun arrayContainsKey!0 (array!66117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049238 (= e!595272 (arrayContainsKey!0 a!3488 k!2747 lt!463433))))

(declare-fun b!1049239 () Bool)

(declare-fun e!595274 () Bool)

(assert (=> b!1049239 (= e!595275 e!595274)))

(declare-fun res!698365 () Bool)

(assert (=> b!1049239 (=> (not res!698365) (not e!595274))))

(declare-fun lt!463434 () array!66117)

(assert (=> b!1049239 (= res!698365 (arrayContainsKey!0 lt!463434 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049239 (= lt!463434 (array!66118 (store (arr!31798 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32334 a!3488)))))

(declare-fun b!1049240 () Bool)

(declare-fun res!698368 () Bool)

(assert (=> b!1049240 (=> (not res!698368) (not e!595275))))

(declare-datatypes ((List!22110 0))(
  ( (Nil!22107) (Cons!22106 (h!23315 (_ BitVec 64)) (t!31417 List!22110)) )
))
(declare-fun arrayNoDuplicates!0 (array!66117 (_ BitVec 32) List!22110) Bool)

(assert (=> b!1049240 (= res!698368 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22107))))

(declare-fun b!1049241 () Bool)

(assert (=> b!1049241 (= e!595271 true)))

(assert (=> b!1049241 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22107)))

(declare-datatypes ((Unit!34316 0))(
  ( (Unit!34317) )
))
(declare-fun lt!463432 () Unit!34316)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66117 (_ BitVec 32) (_ BitVec 32)) Unit!34316)

(assert (=> b!1049241 (= lt!463432 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049242 () Bool)

(declare-fun res!698366 () Bool)

(assert (=> b!1049242 (=> (not res!698366) (not e!595275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049242 (= res!698366 (validKeyInArray!0 k!2747))))

(declare-fun res!698364 () Bool)

(assert (=> start!92316 (=> (not res!698364) (not e!595275))))

(assert (=> start!92316 (= res!698364 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32334 a!3488)) (bvslt (size!32334 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92316 e!595275))

(assert (=> start!92316 true))

(declare-fun array_inv!24578 (array!66117) Bool)

(assert (=> start!92316 (array_inv!24578 a!3488)))

(declare-fun b!1049243 () Bool)

(assert (=> b!1049243 (= e!595274 e!595273)))

(declare-fun res!698362 () Bool)

(assert (=> b!1049243 (=> (not res!698362) (not e!595273))))

(assert (=> b!1049243 (= res!698362 (not (= lt!463433 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66117 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049243 (= lt!463433 (arrayScanForKey!0 lt!463434 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92316 res!698364) b!1049240))

(assert (= (and b!1049240 res!698368) b!1049242))

(assert (= (and b!1049242 res!698366) b!1049235))

(assert (= (and b!1049235 res!698363) b!1049239))

(assert (= (and b!1049239 res!698365) b!1049243))

(assert (= (and b!1049243 res!698362) b!1049237))

(assert (= (and b!1049237 res!698369) b!1049236))

(assert (= (and b!1049236 (not res!698361)) b!1049238))

(assert (= (and b!1049237 (not res!698367)) b!1049241))

(declare-fun m!970031 () Bool)

(assert (=> start!92316 m!970031))

(declare-fun m!970033 () Bool)

(assert (=> b!1049241 m!970033))

(declare-fun m!970035 () Bool)

(assert (=> b!1049241 m!970035))

(declare-fun m!970037 () Bool)

(assert (=> b!1049242 m!970037))

(declare-fun m!970039 () Bool)

(assert (=> b!1049243 m!970039))

(declare-fun m!970041 () Bool)

(assert (=> b!1049238 m!970041))

(declare-fun m!970043 () Bool)

(assert (=> b!1049237 m!970043))

(declare-fun m!970045 () Bool)

(assert (=> b!1049237 m!970045))

(declare-fun m!970047 () Bool)

(assert (=> b!1049239 m!970047))

(assert (=> b!1049239 m!970043))

(declare-fun m!970049 () Bool)

(assert (=> b!1049235 m!970049))

(declare-fun m!970051 () Bool)

(assert (=> b!1049240 m!970051))

(push 1)

(assert (not b!1049243))

(assert (not b!1049238))

(assert (not start!92316))

(assert (not b!1049240))

(assert (not b!1049242))

(assert (not b!1049239))

(assert (not b!1049241))

