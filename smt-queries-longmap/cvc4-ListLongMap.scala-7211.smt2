; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92332 () Bool)

(assert start!92332)

(declare-fun b!1049502 () Bool)

(declare-fun res!698636 () Bool)

(declare-fun e!595455 () Bool)

(assert (=> b!1049502 (=> res!698636 e!595455)))

(declare-datatypes ((List!22118 0))(
  ( (Nil!22115) (Cons!22114 (h!23323 (_ BitVec 64)) (t!31425 List!22118)) )
))
(declare-fun contains!6111 (List!22118 (_ BitVec 64)) Bool)

(assert (=> b!1049502 (= res!698636 (contains!6111 Nil!22115 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049503 () Bool)

(declare-fun e!595460 () Bool)

(declare-fun e!595457 () Bool)

(assert (=> b!1049503 (= e!595460 e!595457)))

(declare-fun res!698634 () Bool)

(assert (=> b!1049503 (=> (not res!698634) (not e!595457))))

(declare-fun lt!463540 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049503 (= res!698634 (not (= lt!463540 i!1381)))))

(declare-datatypes ((array!66133 0))(
  ( (array!66134 (arr!31806 (Array (_ BitVec 32) (_ BitVec 64))) (size!32342 (_ BitVec 32))) )
))
(declare-fun lt!463539 () array!66133)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66133 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049503 (= lt!463540 (arrayScanForKey!0 lt!463539 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049504 () Bool)

(declare-fun res!698630 () Bool)

(assert (=> b!1049504 (=> res!698630 e!595455)))

(declare-fun noDuplicate!1496 (List!22118) Bool)

(assert (=> b!1049504 (= res!698630 (not (noDuplicate!1496 Nil!22115)))))

(declare-fun b!1049505 () Bool)

(declare-fun e!595462 () Bool)

(assert (=> b!1049505 (= e!595457 (not e!595462))))

(declare-fun res!698639 () Bool)

(assert (=> b!1049505 (=> res!698639 e!595462)))

(assert (=> b!1049505 (= res!698639 (bvsle lt!463540 i!1381))))

(declare-fun e!595461 () Bool)

(assert (=> b!1049505 e!595461))

(declare-fun res!698629 () Bool)

(assert (=> b!1049505 (=> (not res!698629) (not e!595461))))

(declare-fun a!3488 () array!66133)

(assert (=> b!1049505 (= res!698629 (= (select (store (arr!31806 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463540) k!2747))))

(declare-fun b!1049506 () Bool)

(declare-fun res!698631 () Bool)

(declare-fun e!595459 () Bool)

(assert (=> b!1049506 (=> (not res!698631) (not e!595459))))

(assert (=> b!1049506 (= res!698631 (= (select (arr!31806 a!3488) i!1381) k!2747))))

(declare-fun b!1049507 () Bool)

(assert (=> b!1049507 (= e!595462 e!595455)))

(declare-fun res!698632 () Bool)

(assert (=> b!1049507 (=> res!698632 e!595455)))

(assert (=> b!1049507 (= res!698632 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32342 a!3488)))))

(declare-fun arrayContainsKey!0 (array!66133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049507 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34332 0))(
  ( (Unit!34333) )
))
(declare-fun lt!463541 () Unit!34332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66133 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34332)

(assert (=> b!1049507 (= lt!463541 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463540 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66133 (_ BitVec 32) List!22118) Bool)

(assert (=> b!1049507 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22115)))

(declare-fun lt!463542 () Unit!34332)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66133 (_ BitVec 32) (_ BitVec 32)) Unit!34332)

(assert (=> b!1049507 (= lt!463542 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049508 () Bool)

(assert (=> b!1049508 (= e!595455 true)))

(declare-fun lt!463538 () Bool)

(assert (=> b!1049508 (= lt!463538 (contains!6111 Nil!22115 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049509 () Bool)

(declare-fun e!595456 () Bool)

(assert (=> b!1049509 (= e!595461 e!595456)))

(declare-fun res!698635 () Bool)

(assert (=> b!1049509 (=> res!698635 e!595456)))

(assert (=> b!1049509 (= res!698635 (bvsle lt!463540 i!1381))))

(declare-fun b!1049510 () Bool)

(assert (=> b!1049510 (= e!595456 (arrayContainsKey!0 a!3488 k!2747 lt!463540))))

(declare-fun b!1049511 () Bool)

(declare-fun res!698633 () Bool)

(assert (=> b!1049511 (=> (not res!698633) (not e!595459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049511 (= res!698633 (validKeyInArray!0 k!2747))))

(declare-fun res!698638 () Bool)

(assert (=> start!92332 (=> (not res!698638) (not e!595459))))

(assert (=> start!92332 (= res!698638 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32342 a!3488)) (bvslt (size!32342 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92332 e!595459))

(assert (=> start!92332 true))

(declare-fun array_inv!24586 (array!66133) Bool)

(assert (=> start!92332 (array_inv!24586 a!3488)))

(declare-fun b!1049512 () Bool)

(declare-fun res!698628 () Bool)

(assert (=> b!1049512 (=> (not res!698628) (not e!595459))))

(assert (=> b!1049512 (= res!698628 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22115))))

(declare-fun b!1049513 () Bool)

(assert (=> b!1049513 (= e!595459 e!595460)))

(declare-fun res!698637 () Bool)

(assert (=> b!1049513 (=> (not res!698637) (not e!595460))))

(assert (=> b!1049513 (= res!698637 (arrayContainsKey!0 lt!463539 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049513 (= lt!463539 (array!66134 (store (arr!31806 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32342 a!3488)))))

(assert (= (and start!92332 res!698638) b!1049512))

(assert (= (and b!1049512 res!698628) b!1049511))

(assert (= (and b!1049511 res!698633) b!1049506))

(assert (= (and b!1049506 res!698631) b!1049513))

(assert (= (and b!1049513 res!698637) b!1049503))

(assert (= (and b!1049503 res!698634) b!1049505))

(assert (= (and b!1049505 res!698629) b!1049509))

(assert (= (and b!1049509 (not res!698635)) b!1049510))

(assert (= (and b!1049505 (not res!698639)) b!1049507))

(assert (= (and b!1049507 (not res!698632)) b!1049504))

(assert (= (and b!1049504 (not res!698630)) b!1049502))

(assert (= (and b!1049502 (not res!698636)) b!1049508))

(declare-fun m!970257 () Bool)

(assert (=> b!1049512 m!970257))

(declare-fun m!970259 () Bool)

(assert (=> b!1049502 m!970259))

(declare-fun m!970261 () Bool)

(assert (=> b!1049513 m!970261))

(declare-fun m!970263 () Bool)

(assert (=> b!1049513 m!970263))

(declare-fun m!970265 () Bool)

(assert (=> b!1049510 m!970265))

(declare-fun m!970267 () Bool)

(assert (=> start!92332 m!970267))

(declare-fun m!970269 () Bool)

(assert (=> b!1049506 m!970269))

(declare-fun m!970271 () Bool)

(assert (=> b!1049503 m!970271))

(assert (=> b!1049505 m!970263))

(declare-fun m!970273 () Bool)

(assert (=> b!1049505 m!970273))

(declare-fun m!970275 () Bool)

(assert (=> b!1049508 m!970275))

(declare-fun m!970277 () Bool)

(assert (=> b!1049511 m!970277))

(declare-fun m!970279 () Bool)

(assert (=> b!1049504 m!970279))

(declare-fun m!970281 () Bool)

(assert (=> b!1049507 m!970281))

(declare-fun m!970283 () Bool)

(assert (=> b!1049507 m!970283))

(declare-fun m!970285 () Bool)

(assert (=> b!1049507 m!970285))

(declare-fun m!970287 () Bool)

(assert (=> b!1049507 m!970287))

(push 1)

(assert (not b!1049511))

(assert (not b!1049513))

(assert (not b!1049510))

(assert (not b!1049503))

(assert (not b!1049507))

(assert (not b!1049508))

(assert (not start!92332))

(assert (not b!1049502))

(assert (not b!1049512))

(assert (not b!1049504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

