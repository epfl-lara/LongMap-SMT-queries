; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92844 () Bool)

(assert start!92844)

(declare-fun b!1054365 () Bool)

(declare-fun e!598996 () Bool)

(declare-fun e!598995 () Bool)

(assert (=> b!1054365 (= e!598996 e!598995)))

(declare-fun res!703306 () Bool)

(assert (=> b!1054365 (=> (not res!703306) (not e!598995))))

(declare-fun lt!465386 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054365 (= res!703306 (not (= lt!465386 i!1381)))))

(declare-datatypes ((array!66504 0))(
  ( (array!66505 (arr!31984 (Array (_ BitVec 32) (_ BitVec 64))) (size!32520 (_ BitVec 32))) )
))
(declare-fun lt!465385 () array!66504)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66504 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054365 (= lt!465386 (arrayScanForKey!0 lt!465385 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054367 () Bool)

(declare-fun e!598999 () Bool)

(declare-fun e!598997 () Bool)

(assert (=> b!1054367 (= e!598999 e!598997)))

(declare-fun res!703313 () Bool)

(assert (=> b!1054367 (=> res!703313 e!598997)))

(assert (=> b!1054367 (= res!703313 (bvsle lt!465386 i!1381))))

(declare-fun b!1054368 () Bool)

(declare-fun e!598998 () Bool)

(assert (=> b!1054368 (= e!598998 e!598996)))

(declare-fun res!703307 () Bool)

(assert (=> b!1054368 (=> (not res!703307) (not e!598996))))

(declare-fun arrayContainsKey!0 (array!66504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054368 (= res!703307 (arrayContainsKey!0 lt!465385 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66504)

(assert (=> b!1054368 (= lt!465385 (array!66505 (store (arr!31984 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32520 a!3488)))))

(declare-fun b!1054369 () Bool)

(assert (=> b!1054369 (= e!598997 (arrayContainsKey!0 a!3488 k!2747 lt!465386))))

(declare-fun b!1054370 () Bool)

(declare-fun e!598993 () Bool)

(assert (=> b!1054370 (= e!598995 (not e!598993))))

(declare-fun res!703308 () Bool)

(assert (=> b!1054370 (=> res!703308 e!598993)))

(assert (=> b!1054370 (= res!703308 (bvsle lt!465386 i!1381))))

(assert (=> b!1054370 e!598999))

(declare-fun res!703310 () Bool)

(assert (=> b!1054370 (=> (not res!703310) (not e!598999))))

(assert (=> b!1054370 (= res!703310 (= (select (store (arr!31984 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465386) k!2747))))

(declare-fun b!1054371 () Bool)

(declare-fun res!703311 () Bool)

(assert (=> b!1054371 (=> (not res!703311) (not e!598998))))

(declare-datatypes ((List!22296 0))(
  ( (Nil!22293) (Cons!22292 (h!23501 (_ BitVec 64)) (t!31603 List!22296)) )
))
(declare-fun arrayNoDuplicates!0 (array!66504 (_ BitVec 32) List!22296) Bool)

(assert (=> b!1054371 (= res!703311 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22293))))

(declare-fun b!1054366 () Bool)

(declare-fun res!703305 () Bool)

(assert (=> b!1054366 (=> (not res!703305) (not e!598998))))

(assert (=> b!1054366 (= res!703305 (= (select (arr!31984 a!3488) i!1381) k!2747))))

(declare-fun res!703309 () Bool)

(assert (=> start!92844 (=> (not res!703309) (not e!598998))))

(assert (=> start!92844 (= res!703309 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32520 a!3488)) (bvslt (size!32520 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92844 e!598998))

(assert (=> start!92844 true))

(declare-fun array_inv!24764 (array!66504) Bool)

(assert (=> start!92844 (array_inv!24764 a!3488)))

(declare-fun b!1054372 () Bool)

(assert (=> b!1054372 (= e!598993 true)))

(assert (=> b!1054372 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22293)))

(declare-datatypes ((Unit!34526 0))(
  ( (Unit!34527) )
))
(declare-fun lt!465387 () Unit!34526)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66504 (_ BitVec 32) (_ BitVec 32)) Unit!34526)

(assert (=> b!1054372 (= lt!465387 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054373 () Bool)

(declare-fun res!703312 () Bool)

(assert (=> b!1054373 (=> (not res!703312) (not e!598998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054373 (= res!703312 (validKeyInArray!0 k!2747))))

(assert (= (and start!92844 res!703309) b!1054371))

(assert (= (and b!1054371 res!703311) b!1054373))

(assert (= (and b!1054373 res!703312) b!1054366))

(assert (= (and b!1054366 res!703305) b!1054368))

(assert (= (and b!1054368 res!703307) b!1054365))

(assert (= (and b!1054365 res!703306) b!1054370))

(assert (= (and b!1054370 res!703310) b!1054367))

(assert (= (and b!1054367 (not res!703313)) b!1054369))

(assert (= (and b!1054370 (not res!703308)) b!1054372))

(declare-fun m!974447 () Bool)

(assert (=> b!1054372 m!974447))

(declare-fun m!974449 () Bool)

(assert (=> b!1054372 m!974449))

(declare-fun m!974451 () Bool)

(assert (=> b!1054371 m!974451))

(declare-fun m!974453 () Bool)

(assert (=> b!1054368 m!974453))

(declare-fun m!974455 () Bool)

(assert (=> b!1054368 m!974455))

(declare-fun m!974457 () Bool)

(assert (=> b!1054366 m!974457))

(assert (=> b!1054370 m!974455))

(declare-fun m!974459 () Bool)

(assert (=> b!1054370 m!974459))

(declare-fun m!974461 () Bool)

(assert (=> b!1054369 m!974461))

(declare-fun m!974463 () Bool)

(assert (=> b!1054365 m!974463))

(declare-fun m!974465 () Bool)

(assert (=> start!92844 m!974465))

(declare-fun m!974467 () Bool)

(assert (=> b!1054373 m!974467))

(push 1)

