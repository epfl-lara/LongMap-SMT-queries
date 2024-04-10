; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92380 () Bool)

(assert start!92380)

(declare-fun b!1050342 () Bool)

(declare-fun e!596028 () Bool)

(declare-fun e!596026 () Bool)

(assert (=> b!1050342 (= e!596028 e!596026)))

(declare-fun res!699471 () Bool)

(assert (=> b!1050342 (=> (not res!699471) (not e!596026))))

(declare-datatypes ((array!66181 0))(
  ( (array!66182 (arr!31830 (Array (_ BitVec 32) (_ BitVec 64))) (size!32366 (_ BitVec 32))) )
))
(declare-fun lt!463898 () array!66181)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050342 (= res!699471 (arrayContainsKey!0 lt!463898 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66181)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050342 (= lt!463898 (array!66182 (store (arr!31830 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32366 a!3488)))))

(declare-fun b!1050343 () Bool)

(declare-fun e!596025 () Bool)

(declare-fun e!596024 () Bool)

(assert (=> b!1050343 (= e!596025 (not e!596024))))

(declare-fun res!699473 () Bool)

(assert (=> b!1050343 (=> res!699473 e!596024)))

(declare-fun lt!463901 () (_ BitVec 32))

(assert (=> b!1050343 (= res!699473 (bvsle lt!463901 i!1381))))

(declare-fun e!596023 () Bool)

(assert (=> b!1050343 e!596023))

(declare-fun res!699476 () Bool)

(assert (=> b!1050343 (=> (not res!699476) (not e!596023))))

(assert (=> b!1050343 (= res!699476 (= (select (store (arr!31830 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463901) k!2747))))

(declare-fun b!1050344 () Bool)

(declare-fun res!699474 () Bool)

(assert (=> b!1050344 (=> (not res!699474) (not e!596028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050344 (= res!699474 (validKeyInArray!0 k!2747))))

(declare-fun b!1050345 () Bool)

(assert (=> b!1050345 (= e!596026 e!596025)))

(declare-fun res!699472 () Bool)

(assert (=> b!1050345 (=> (not res!699472) (not e!596025))))

(assert (=> b!1050345 (= res!699472 (not (= lt!463901 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66181 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050345 (= lt!463901 (arrayScanForKey!0 lt!463898 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!699475 () Bool)

(assert (=> start!92380 (=> (not res!699475) (not e!596028))))

(assert (=> start!92380 (= res!699475 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32366 a!3488)) (bvslt (size!32366 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92380 e!596028))

(assert (=> start!92380 true))

(declare-fun array_inv!24610 (array!66181) Bool)

(assert (=> start!92380 (array_inv!24610 a!3488)))

(declare-fun b!1050346 () Bool)

(assert (=> b!1050346 (= e!596024 true)))

(assert (=> b!1050346 false))

(declare-datatypes ((Unit!34380 0))(
  ( (Unit!34381) )
))
(declare-fun lt!463899 () Unit!34380)

(declare-datatypes ((List!22142 0))(
  ( (Nil!22139) (Cons!22138 (h!23347 (_ BitVec 64)) (t!31449 List!22142)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66181 (_ BitVec 64) (_ BitVec 32) List!22142) Unit!34380)

(assert (=> b!1050346 (= lt!463899 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 i!1381 Nil!22139))))

(assert (=> b!1050346 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!463900 () Unit!34380)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66181 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34380)

(assert (=> b!1050346 (= lt!463900 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463901 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66181 (_ BitVec 32) List!22142) Bool)

(assert (=> b!1050346 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22139)))

(declare-fun lt!463902 () Unit!34380)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66181 (_ BitVec 32) (_ BitVec 32)) Unit!34380)

(assert (=> b!1050346 (= lt!463902 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050347 () Bool)

(declare-fun res!699468 () Bool)

(assert (=> b!1050347 (=> (not res!699468) (not e!596028))))

(assert (=> b!1050347 (= res!699468 (= (select (arr!31830 a!3488) i!1381) k!2747))))

(declare-fun b!1050348 () Bool)

(declare-fun e!596029 () Bool)

(assert (=> b!1050348 (= e!596029 (arrayContainsKey!0 a!3488 k!2747 lt!463901))))

(declare-fun b!1050349 () Bool)

(declare-fun res!699470 () Bool)

(assert (=> b!1050349 (=> (not res!699470) (not e!596028))))

(assert (=> b!1050349 (= res!699470 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22139))))

(declare-fun b!1050350 () Bool)

(assert (=> b!1050350 (= e!596023 e!596029)))

(declare-fun res!699469 () Bool)

(assert (=> b!1050350 (=> res!699469 e!596029)))

(assert (=> b!1050350 (= res!699469 (bvsle lt!463901 i!1381))))

(assert (= (and start!92380 res!699475) b!1050349))

(assert (= (and b!1050349 res!699470) b!1050344))

(assert (= (and b!1050344 res!699474) b!1050347))

(assert (= (and b!1050347 res!699468) b!1050342))

(assert (= (and b!1050342 res!699471) b!1050345))

(assert (= (and b!1050345 res!699472) b!1050343))

(assert (= (and b!1050343 res!699476) b!1050350))

(assert (= (and b!1050350 (not res!699469)) b!1050348))

(assert (= (and b!1050343 (not res!699473)) b!1050346))

(declare-fun m!971017 () Bool)

(assert (=> b!1050342 m!971017))

(declare-fun m!971019 () Bool)

(assert (=> b!1050342 m!971019))

(declare-fun m!971021 () Bool)

(assert (=> b!1050345 m!971021))

(declare-fun m!971023 () Bool)

(assert (=> start!92380 m!971023))

(declare-fun m!971025 () Bool)

(assert (=> b!1050349 m!971025))

(declare-fun m!971027 () Bool)

(assert (=> b!1050347 m!971027))

(declare-fun m!971029 () Bool)

(assert (=> b!1050346 m!971029))

(declare-fun m!971031 () Bool)

(assert (=> b!1050346 m!971031))

(declare-fun m!971033 () Bool)

(assert (=> b!1050346 m!971033))

(declare-fun m!971035 () Bool)

(assert (=> b!1050346 m!971035))

(declare-fun m!971037 () Bool)

(assert (=> b!1050346 m!971037))

(declare-fun m!971039 () Bool)

(assert (=> b!1050348 m!971039))

(declare-fun m!971041 () Bool)

(assert (=> b!1050344 m!971041))

(assert (=> b!1050343 m!971019))

(declare-fun m!971043 () Bool)

(assert (=> b!1050343 m!971043))

(push 1)

(assert (not b!1050348))

(assert (not b!1050349))

(assert (not start!92380))

(assert (not b!1050345))

(assert (not b!1050346))

(assert (not b!1050344))

(assert (not b!1050342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

