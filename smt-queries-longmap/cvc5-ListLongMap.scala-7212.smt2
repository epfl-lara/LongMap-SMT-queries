; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92334 () Bool)

(assert start!92334)

(declare-fun b!1049538 () Bool)

(declare-fun res!698675 () Bool)

(declare-fun e!595480 () Bool)

(assert (=> b!1049538 (=> (not res!698675) (not e!595480))))

(declare-datatypes ((array!66135 0))(
  ( (array!66136 (arr!31807 (Array (_ BitVec 32) (_ BitVec 64))) (size!32343 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66135)

(declare-datatypes ((List!22119 0))(
  ( (Nil!22116) (Cons!22115 (h!23324 (_ BitVec 64)) (t!31426 List!22119)) )
))
(declare-fun arrayNoDuplicates!0 (array!66135 (_ BitVec 32) List!22119) Bool)

(assert (=> b!1049538 (= res!698675 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22116))))

(declare-fun b!1049539 () Bool)

(declare-fun res!698671 () Bool)

(declare-fun e!595479 () Bool)

(assert (=> b!1049539 (=> res!698671 e!595479)))

(declare-fun noDuplicate!1497 (List!22119) Bool)

(assert (=> b!1049539 (= res!698671 (not (noDuplicate!1497 Nil!22116)))))

(declare-fun b!1049540 () Bool)

(declare-fun res!698670 () Bool)

(assert (=> b!1049540 (=> (not res!698670) (not e!595480))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049540 (= res!698670 (= (select (arr!31807 a!3488) i!1381) k!2747))))

(declare-fun b!1049541 () Bool)

(assert (=> b!1049541 (= e!595479 true)))

(declare-fun lt!463555 () Bool)

(declare-fun contains!6112 (List!22119 (_ BitVec 64)) Bool)

(assert (=> b!1049541 (= lt!463555 (contains!6112 Nil!22116 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049542 () Bool)

(declare-fun e!595485 () Bool)

(declare-fun e!595482 () Bool)

(assert (=> b!1049542 (= e!595485 (not e!595482))))

(declare-fun res!698672 () Bool)

(assert (=> b!1049542 (=> res!698672 e!595482)))

(declare-fun lt!463556 () (_ BitVec 32))

(assert (=> b!1049542 (= res!698672 (bvsle lt!463556 i!1381))))

(declare-fun e!595481 () Bool)

(assert (=> b!1049542 e!595481))

(declare-fun res!698668 () Bool)

(assert (=> b!1049542 (=> (not res!698668) (not e!595481))))

(assert (=> b!1049542 (= res!698668 (= (select (store (arr!31807 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463556) k!2747))))

(declare-fun b!1049543 () Bool)

(assert (=> b!1049543 (= e!595482 e!595479)))

(declare-fun res!698674 () Bool)

(assert (=> b!1049543 (=> res!698674 e!595479)))

(assert (=> b!1049543 (= res!698674 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32343 a!3488)))))

(declare-fun arrayContainsKey!0 (array!66135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049543 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34334 0))(
  ( (Unit!34335) )
))
(declare-fun lt!463554 () Unit!34334)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66135 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34334)

(assert (=> b!1049543 (= lt!463554 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463556 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1049543 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22116)))

(declare-fun lt!463553 () Unit!34334)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66135 (_ BitVec 32) (_ BitVec 32)) Unit!34334)

(assert (=> b!1049543 (= lt!463553 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049544 () Bool)

(declare-fun e!595486 () Bool)

(assert (=> b!1049544 (= e!595481 e!595486)))

(declare-fun res!698673 () Bool)

(assert (=> b!1049544 (=> res!698673 e!595486)))

(assert (=> b!1049544 (= res!698673 (bvsle lt!463556 i!1381))))

(declare-fun b!1049545 () Bool)

(declare-fun e!595484 () Bool)

(assert (=> b!1049545 (= e!595484 e!595485)))

(declare-fun res!698665 () Bool)

(assert (=> b!1049545 (=> (not res!698665) (not e!595485))))

(assert (=> b!1049545 (= res!698665 (not (= lt!463556 i!1381)))))

(declare-fun lt!463557 () array!66135)

(declare-fun arrayScanForKey!0 (array!66135 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049545 (= lt!463556 (arrayScanForKey!0 lt!463557 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!698667 () Bool)

(assert (=> start!92334 (=> (not res!698667) (not e!595480))))

(assert (=> start!92334 (= res!698667 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32343 a!3488)) (bvslt (size!32343 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92334 e!595480))

(assert (=> start!92334 true))

(declare-fun array_inv!24587 (array!66135) Bool)

(assert (=> start!92334 (array_inv!24587 a!3488)))

(declare-fun b!1049546 () Bool)

(declare-fun res!698669 () Bool)

(assert (=> b!1049546 (=> res!698669 e!595479)))

(assert (=> b!1049546 (= res!698669 (contains!6112 Nil!22116 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049547 () Bool)

(declare-fun res!698664 () Bool)

(assert (=> b!1049547 (=> (not res!698664) (not e!595480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049547 (= res!698664 (validKeyInArray!0 k!2747))))

(declare-fun b!1049548 () Bool)

(assert (=> b!1049548 (= e!595480 e!595484)))

(declare-fun res!698666 () Bool)

(assert (=> b!1049548 (=> (not res!698666) (not e!595484))))

(assert (=> b!1049548 (= res!698666 (arrayContainsKey!0 lt!463557 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049548 (= lt!463557 (array!66136 (store (arr!31807 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32343 a!3488)))))

(declare-fun b!1049549 () Bool)

(assert (=> b!1049549 (= e!595486 (arrayContainsKey!0 a!3488 k!2747 lt!463556))))

(assert (= (and start!92334 res!698667) b!1049538))

(assert (= (and b!1049538 res!698675) b!1049547))

(assert (= (and b!1049547 res!698664) b!1049540))

(assert (= (and b!1049540 res!698670) b!1049548))

(assert (= (and b!1049548 res!698666) b!1049545))

(assert (= (and b!1049545 res!698665) b!1049542))

(assert (= (and b!1049542 res!698668) b!1049544))

(assert (= (and b!1049544 (not res!698673)) b!1049549))

(assert (= (and b!1049542 (not res!698672)) b!1049543))

(assert (= (and b!1049543 (not res!698674)) b!1049539))

(assert (= (and b!1049539 (not res!698671)) b!1049546))

(assert (= (and b!1049546 (not res!698669)) b!1049541))

(declare-fun m!970289 () Bool)

(assert (=> b!1049539 m!970289))

(declare-fun m!970291 () Bool)

(assert (=> b!1049549 m!970291))

(declare-fun m!970293 () Bool)

(assert (=> b!1049538 m!970293))

(declare-fun m!970295 () Bool)

(assert (=> b!1049541 m!970295))

(declare-fun m!970297 () Bool)

(assert (=> b!1049547 m!970297))

(declare-fun m!970299 () Bool)

(assert (=> b!1049545 m!970299))

(declare-fun m!970301 () Bool)

(assert (=> b!1049548 m!970301))

(declare-fun m!970303 () Bool)

(assert (=> b!1049548 m!970303))

(declare-fun m!970305 () Bool)

(assert (=> b!1049546 m!970305))

(declare-fun m!970307 () Bool)

(assert (=> b!1049540 m!970307))

(declare-fun m!970309 () Bool)

(assert (=> b!1049543 m!970309))

(declare-fun m!970311 () Bool)

(assert (=> b!1049543 m!970311))

(declare-fun m!970313 () Bool)

(assert (=> b!1049543 m!970313))

(declare-fun m!970315 () Bool)

(assert (=> b!1049543 m!970315))

(assert (=> b!1049542 m!970303))

(declare-fun m!970317 () Bool)

(assert (=> b!1049542 m!970317))

(declare-fun m!970319 () Bool)

(assert (=> start!92334 m!970319))

(push 1)

(assert (not b!1049548))

(assert (not b!1049547))

(assert (not b!1049541))

(assert (not b!1049539))

(assert (not b!1049546))

(assert (not b!1049549))

(assert (not start!92334))

(assert (not b!1049543))

(assert (not b!1049545))

