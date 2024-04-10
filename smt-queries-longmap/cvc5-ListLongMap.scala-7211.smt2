; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92328 () Bool)

(assert start!92328)

(declare-fun b!1049430 () Bool)

(declare-fun res!698565 () Bool)

(declare-fun e!595411 () Bool)

(assert (=> b!1049430 (=> res!698565 e!595411)))

(declare-datatypes ((List!22116 0))(
  ( (Nil!22113) (Cons!22112 (h!23321 (_ BitVec 64)) (t!31423 List!22116)) )
))
(declare-fun contains!6109 (List!22116 (_ BitVec 64)) Bool)

(assert (=> b!1049430 (= res!698565 (contains!6109 Nil!22113 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049431 () Bool)

(declare-fun e!595408 () Bool)

(declare-fun e!595413 () Bool)

(assert (=> b!1049431 (= e!595408 e!595413)))

(declare-fun res!698556 () Bool)

(assert (=> b!1049431 (=> (not res!698556) (not e!595413))))

(declare-fun lt!463512 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049431 (= res!698556 (not (= lt!463512 i!1381)))))

(declare-datatypes ((array!66129 0))(
  ( (array!66130 (arr!31804 (Array (_ BitVec 32) (_ BitVec 64))) (size!32340 (_ BitVec 32))) )
))
(declare-fun lt!463510 () array!66129)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66129 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049431 (= lt!463512 (arrayScanForKey!0 lt!463510 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66129)

(declare-fun b!1049433 () Bool)

(declare-fun e!595410 () Bool)

(declare-fun arrayContainsKey!0 (array!66129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049433 (= e!595410 (arrayContainsKey!0 a!3488 k!2747 lt!463512))))

(declare-fun b!1049434 () Bool)

(declare-fun res!698558 () Bool)

(declare-fun e!595414 () Bool)

(assert (=> b!1049434 (=> (not res!698558) (not e!595414))))

(declare-fun arrayNoDuplicates!0 (array!66129 (_ BitVec 32) List!22116) Bool)

(assert (=> b!1049434 (= res!698558 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22113))))

(declare-fun b!1049435 () Bool)

(declare-fun res!698559 () Bool)

(assert (=> b!1049435 (=> (not res!698559) (not e!595414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049435 (= res!698559 (validKeyInArray!0 k!2747))))

(declare-fun b!1049436 () Bool)

(declare-fun res!698561 () Bool)

(assert (=> b!1049436 (=> (not res!698561) (not e!595414))))

(assert (=> b!1049436 (= res!698561 (= (select (arr!31804 a!3488) i!1381) k!2747))))

(declare-fun b!1049437 () Bool)

(declare-fun e!595407 () Bool)

(assert (=> b!1049437 (= e!595407 e!595411)))

(declare-fun res!698557 () Bool)

(assert (=> b!1049437 (=> res!698557 e!595411)))

(assert (=> b!1049437 (= res!698557 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32340 a!3488)))))

(assert (=> b!1049437 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34328 0))(
  ( (Unit!34329) )
))
(declare-fun lt!463508 () Unit!34328)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66129 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34328)

(assert (=> b!1049437 (= lt!463508 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463512 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1049437 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22113)))

(declare-fun lt!463509 () Unit!34328)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66129 (_ BitVec 32) (_ BitVec 32)) Unit!34328)

(assert (=> b!1049437 (= lt!463509 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049438 () Bool)

(assert (=> b!1049438 (= e!595413 (not e!595407))))

(declare-fun res!698567 () Bool)

(assert (=> b!1049438 (=> res!698567 e!595407)))

(assert (=> b!1049438 (= res!698567 (bvsle lt!463512 i!1381))))

(declare-fun e!595412 () Bool)

(assert (=> b!1049438 e!595412))

(declare-fun res!698560 () Bool)

(assert (=> b!1049438 (=> (not res!698560) (not e!595412))))

(assert (=> b!1049438 (= res!698560 (= (select (store (arr!31804 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463512) k!2747))))

(declare-fun b!1049439 () Bool)

(assert (=> b!1049439 (= e!595411 true)))

(declare-fun lt!463511 () Bool)

(assert (=> b!1049439 (= lt!463511 (contains!6109 Nil!22113 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049440 () Bool)

(assert (=> b!1049440 (= e!595414 e!595408)))

(declare-fun res!698562 () Bool)

(assert (=> b!1049440 (=> (not res!698562) (not e!595408))))

(assert (=> b!1049440 (= res!698562 (arrayContainsKey!0 lt!463510 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049440 (= lt!463510 (array!66130 (store (arr!31804 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32340 a!3488)))))

(declare-fun b!1049441 () Bool)

(declare-fun res!698566 () Bool)

(assert (=> b!1049441 (=> res!698566 e!595411)))

(declare-fun noDuplicate!1494 (List!22116) Bool)

(assert (=> b!1049441 (= res!698566 (not (noDuplicate!1494 Nil!22113)))))

(declare-fun b!1049432 () Bool)

(assert (=> b!1049432 (= e!595412 e!595410)))

(declare-fun res!698563 () Bool)

(assert (=> b!1049432 (=> res!698563 e!595410)))

(assert (=> b!1049432 (= res!698563 (bvsle lt!463512 i!1381))))

(declare-fun res!698564 () Bool)

(assert (=> start!92328 (=> (not res!698564) (not e!595414))))

(assert (=> start!92328 (= res!698564 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32340 a!3488)) (bvslt (size!32340 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92328 e!595414))

(assert (=> start!92328 true))

(declare-fun array_inv!24584 (array!66129) Bool)

(assert (=> start!92328 (array_inv!24584 a!3488)))

(assert (= (and start!92328 res!698564) b!1049434))

(assert (= (and b!1049434 res!698558) b!1049435))

(assert (= (and b!1049435 res!698559) b!1049436))

(assert (= (and b!1049436 res!698561) b!1049440))

(assert (= (and b!1049440 res!698562) b!1049431))

(assert (= (and b!1049431 res!698556) b!1049438))

(assert (= (and b!1049438 res!698560) b!1049432))

(assert (= (and b!1049432 (not res!698563)) b!1049433))

(assert (= (and b!1049438 (not res!698567)) b!1049437))

(assert (= (and b!1049437 (not res!698557)) b!1049441))

(assert (= (and b!1049441 (not res!698566)) b!1049430))

(assert (= (and b!1049430 (not res!698565)) b!1049439))

(declare-fun m!970193 () Bool)

(assert (=> start!92328 m!970193))

(declare-fun m!970195 () Bool)

(assert (=> b!1049433 m!970195))

(declare-fun m!970197 () Bool)

(assert (=> b!1049430 m!970197))

(declare-fun m!970199 () Bool)

(assert (=> b!1049436 m!970199))

(declare-fun m!970201 () Bool)

(assert (=> b!1049439 m!970201))

(declare-fun m!970203 () Bool)

(assert (=> b!1049435 m!970203))

(declare-fun m!970205 () Bool)

(assert (=> b!1049437 m!970205))

(declare-fun m!970207 () Bool)

(assert (=> b!1049437 m!970207))

(declare-fun m!970209 () Bool)

(assert (=> b!1049437 m!970209))

(declare-fun m!970211 () Bool)

(assert (=> b!1049437 m!970211))

(declare-fun m!970213 () Bool)

(assert (=> b!1049431 m!970213))

(declare-fun m!970215 () Bool)

(assert (=> b!1049434 m!970215))

(declare-fun m!970217 () Bool)

(assert (=> b!1049441 m!970217))

(declare-fun m!970219 () Bool)

(assert (=> b!1049438 m!970219))

(declare-fun m!970221 () Bool)

(assert (=> b!1049438 m!970221))

(declare-fun m!970223 () Bool)

(assert (=> b!1049440 m!970223))

(assert (=> b!1049440 m!970219))

(push 1)

(assert (not b!1049439))

(assert (not b!1049440))

(assert (not b!1049431))

(assert (not b!1049433))

(assert (not b!1049430))

(assert (not b!1049435))

(assert (not b!1049441))

(assert (not start!92328))

