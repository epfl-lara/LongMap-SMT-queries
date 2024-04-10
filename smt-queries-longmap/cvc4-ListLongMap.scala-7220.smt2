; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92386 () Bool)

(assert start!92386)

(declare-fun b!1050423 () Bool)

(declare-fun res!699552 () Bool)

(declare-fun e!596086 () Bool)

(assert (=> b!1050423 (=> (not res!699552) (not e!596086))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66187 0))(
  ( (array!66188 (arr!31833 (Array (_ BitVec 32) (_ BitVec 64))) (size!32369 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66187)

(assert (=> b!1050423 (= res!699552 (= (select (arr!31833 a!3488) i!1381) k!2747))))

(declare-fun b!1050424 () Bool)

(declare-fun e!596092 () Bool)

(declare-fun e!596089 () Bool)

(assert (=> b!1050424 (= e!596092 (not e!596089))))

(declare-fun res!699556 () Bool)

(assert (=> b!1050424 (=> res!699556 e!596089)))

(declare-fun lt!463947 () (_ BitVec 32))

(assert (=> b!1050424 (= res!699556 (bvsle lt!463947 i!1381))))

(declare-fun e!596087 () Bool)

(assert (=> b!1050424 e!596087))

(declare-fun res!699551 () Bool)

(assert (=> b!1050424 (=> (not res!699551) (not e!596087))))

(assert (=> b!1050424 (= res!699551 (= (select (store (arr!31833 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463947) k!2747))))

(declare-fun b!1050425 () Bool)

(declare-fun e!596091 () Bool)

(assert (=> b!1050425 (= e!596086 e!596091)))

(declare-fun res!699554 () Bool)

(assert (=> b!1050425 (=> (not res!699554) (not e!596091))))

(declare-fun lt!463944 () array!66187)

(declare-fun arrayContainsKey!0 (array!66187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050425 (= res!699554 (arrayContainsKey!0 lt!463944 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050425 (= lt!463944 (array!66188 (store (arr!31833 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32369 a!3488)))))

(declare-fun res!699549 () Bool)

(assert (=> start!92386 (=> (not res!699549) (not e!596086))))

(assert (=> start!92386 (= res!699549 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32369 a!3488)) (bvslt (size!32369 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92386 e!596086))

(assert (=> start!92386 true))

(declare-fun array_inv!24613 (array!66187) Bool)

(assert (=> start!92386 (array_inv!24613 a!3488)))

(declare-fun b!1050426 () Bool)

(declare-fun res!699550 () Bool)

(assert (=> b!1050426 (=> (not res!699550) (not e!596086))))

(declare-datatypes ((List!22145 0))(
  ( (Nil!22142) (Cons!22141 (h!23350 (_ BitVec 64)) (t!31452 List!22145)) )
))
(declare-fun arrayNoDuplicates!0 (array!66187 (_ BitVec 32) List!22145) Bool)

(assert (=> b!1050426 (= res!699550 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22142))))

(declare-fun b!1050427 () Bool)

(declare-fun res!699555 () Bool)

(assert (=> b!1050427 (=> (not res!699555) (not e!596086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050427 (= res!699555 (validKeyInArray!0 k!2747))))

(declare-fun b!1050428 () Bool)

(declare-fun e!596088 () Bool)

(assert (=> b!1050428 (= e!596087 e!596088)))

(declare-fun res!699557 () Bool)

(assert (=> b!1050428 (=> res!699557 e!596088)))

(assert (=> b!1050428 (= res!699557 (bvsle lt!463947 i!1381))))

(declare-fun b!1050429 () Bool)

(assert (=> b!1050429 (= e!596091 e!596092)))

(declare-fun res!699553 () Bool)

(assert (=> b!1050429 (=> (not res!699553) (not e!596092))))

(assert (=> b!1050429 (= res!699553 (not (= lt!463947 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66187 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050429 (= lt!463947 (arrayScanForKey!0 lt!463944 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050430 () Bool)

(assert (=> b!1050430 (= e!596089 true)))

(assert (=> b!1050430 false))

(declare-datatypes ((Unit!34386 0))(
  ( (Unit!34387) )
))
(declare-fun lt!463945 () Unit!34386)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66187 (_ BitVec 64) (_ BitVec 32) List!22145) Unit!34386)

(assert (=> b!1050430 (= lt!463945 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 i!1381 Nil!22142))))

(assert (=> b!1050430 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!463946 () Unit!34386)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66187 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34386)

(assert (=> b!1050430 (= lt!463946 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463947 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1050430 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22142)))

(declare-fun lt!463943 () Unit!34386)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66187 (_ BitVec 32) (_ BitVec 32)) Unit!34386)

(assert (=> b!1050430 (= lt!463943 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050431 () Bool)

(assert (=> b!1050431 (= e!596088 (arrayContainsKey!0 a!3488 k!2747 lt!463947))))

(assert (= (and start!92386 res!699549) b!1050426))

(assert (= (and b!1050426 res!699550) b!1050427))

(assert (= (and b!1050427 res!699555) b!1050423))

(assert (= (and b!1050423 res!699552) b!1050425))

(assert (= (and b!1050425 res!699554) b!1050429))

(assert (= (and b!1050429 res!699553) b!1050424))

(assert (= (and b!1050424 res!699551) b!1050428))

(assert (= (and b!1050428 (not res!699557)) b!1050431))

(assert (= (and b!1050424 (not res!699556)) b!1050430))

(declare-fun m!971101 () Bool)

(assert (=> b!1050424 m!971101))

(declare-fun m!971103 () Bool)

(assert (=> b!1050424 m!971103))

(declare-fun m!971105 () Bool)

(assert (=> b!1050425 m!971105))

(assert (=> b!1050425 m!971101))

(declare-fun m!971107 () Bool)

(assert (=> b!1050430 m!971107))

(declare-fun m!971109 () Bool)

(assert (=> b!1050430 m!971109))

(declare-fun m!971111 () Bool)

(assert (=> b!1050430 m!971111))

(declare-fun m!971113 () Bool)

(assert (=> b!1050430 m!971113))

(declare-fun m!971115 () Bool)

(assert (=> b!1050430 m!971115))

(declare-fun m!971117 () Bool)

(assert (=> b!1050427 m!971117))

(declare-fun m!971119 () Bool)

(assert (=> b!1050429 m!971119))

(declare-fun m!971121 () Bool)

(assert (=> b!1050426 m!971121))

(declare-fun m!971123 () Bool)

(assert (=> b!1050423 m!971123))

(declare-fun m!971125 () Bool)

(assert (=> start!92386 m!971125))

(declare-fun m!971127 () Bool)

(assert (=> b!1050431 m!971127))

(push 1)

(assert (not b!1050430))

(assert (not b!1050429))

(assert (not b!1050426))

(assert (not b!1050431))

(assert (not start!92386))

(assert (not b!1050425))

(assert (not b!1050427))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

