; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93166 () Bool)

(assert start!93166)

(declare-fun b!1056544 () Bool)

(declare-fun res!705292 () Bool)

(declare-fun e!600679 () Bool)

(assert (=> b!1056544 (=> (not res!705292) (not e!600679))))

(declare-datatypes ((array!66637 0))(
  ( (array!66638 (arr!32043 (Array (_ BitVec 32) (_ BitVec 64))) (size!32579 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66637)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056544 (= res!705292 (= (select (arr!32043 a!3488) i!1381) k!2747))))

(declare-fun b!1056545 () Bool)

(declare-fun e!600678 () Bool)

(assert (=> b!1056545 (= e!600678 (not true))))

(declare-fun e!600674 () Bool)

(assert (=> b!1056545 e!600674))

(declare-fun res!705291 () Bool)

(assert (=> b!1056545 (=> (not res!705291) (not e!600674))))

(declare-fun lt!466127 () (_ BitVec 32))

(assert (=> b!1056545 (= res!705291 (= (select (store (arr!32043 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466127) k!2747))))

(declare-fun b!1056546 () Bool)

(declare-fun res!705288 () Bool)

(assert (=> b!1056546 (=> (not res!705288) (not e!600679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056546 (= res!705288 (validKeyInArray!0 k!2747))))

(declare-fun res!705290 () Bool)

(assert (=> start!93166 (=> (not res!705290) (not e!600679))))

(assert (=> start!93166 (= res!705290 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32579 a!3488)) (bvslt (size!32579 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93166 e!600679))

(assert (=> start!93166 true))

(declare-fun array_inv!24823 (array!66637) Bool)

(assert (=> start!93166 (array_inv!24823 a!3488)))

(declare-fun b!1056547 () Bool)

(declare-fun e!600675 () Bool)

(assert (=> b!1056547 (= e!600675 e!600678)))

(declare-fun res!705286 () Bool)

(assert (=> b!1056547 (=> (not res!705286) (not e!600678))))

(assert (=> b!1056547 (= res!705286 (not (= lt!466127 i!1381)))))

(declare-fun lt!466128 () array!66637)

(declare-fun arrayScanForKey!0 (array!66637 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056547 (= lt!466127 (arrayScanForKey!0 lt!466128 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056548 () Bool)

(declare-fun res!705293 () Bool)

(assert (=> b!1056548 (=> (not res!705293) (not e!600679))))

(declare-datatypes ((List!22355 0))(
  ( (Nil!22352) (Cons!22351 (h!23560 (_ BitVec 64)) (t!31662 List!22355)) )
))
(declare-fun arrayNoDuplicates!0 (array!66637 (_ BitVec 32) List!22355) Bool)

(assert (=> b!1056548 (= res!705293 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22352))))

(declare-fun b!1056549 () Bool)

(declare-fun e!600676 () Bool)

(declare-fun arrayContainsKey!0 (array!66637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056549 (= e!600676 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1056550 () Bool)

(assert (=> b!1056550 (= e!600674 e!600676)))

(declare-fun res!705289 () Bool)

(assert (=> b!1056550 (=> res!705289 e!600676)))

(assert (=> b!1056550 (= res!705289 (or (bvsgt lt!466127 i!1381) (bvsle i!1381 lt!466127)))))

(declare-fun b!1056551 () Bool)

(assert (=> b!1056551 (= e!600679 e!600675)))

(declare-fun res!705287 () Bool)

(assert (=> b!1056551 (=> (not res!705287) (not e!600675))))

(assert (=> b!1056551 (= res!705287 (arrayContainsKey!0 lt!466128 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056551 (= lt!466128 (array!66638 (store (arr!32043 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32579 a!3488)))))

(assert (= (and start!93166 res!705290) b!1056548))

(assert (= (and b!1056548 res!705293) b!1056546))

(assert (= (and b!1056546 res!705288) b!1056544))

(assert (= (and b!1056544 res!705292) b!1056551))

(assert (= (and b!1056551 res!705287) b!1056547))

(assert (= (and b!1056547 res!705286) b!1056545))

(assert (= (and b!1056545 res!705291) b!1056550))

(assert (= (and b!1056550 (not res!705289)) b!1056549))

(declare-fun m!976367 () Bool)

(assert (=> start!93166 m!976367))

(declare-fun m!976369 () Bool)

(assert (=> b!1056548 m!976369))

(declare-fun m!976371 () Bool)

(assert (=> b!1056546 m!976371))

(declare-fun m!976373 () Bool)

(assert (=> b!1056547 m!976373))

(declare-fun m!976375 () Bool)

(assert (=> b!1056544 m!976375))

(declare-fun m!976377 () Bool)

(assert (=> b!1056545 m!976377))

(declare-fun m!976379 () Bool)

(assert (=> b!1056545 m!976379))

(declare-fun m!976381 () Bool)

(assert (=> b!1056551 m!976381))

(assert (=> b!1056551 m!976377))

(declare-fun m!976383 () Bool)

(assert (=> b!1056549 m!976383))

(push 1)

(assert (not b!1056549))

(assert (not start!93166))

(assert (not b!1056551))

(assert (not b!1056548))

(assert (not b!1056546))

(assert (not b!1056547))

