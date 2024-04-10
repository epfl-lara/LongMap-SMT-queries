; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92256 () Bool)

(assert start!92256)

(declare-fun b!1048468 () Bool)

(declare-fun res!697598 () Bool)

(declare-fun e!594688 () Bool)

(assert (=> b!1048468 (=> (not res!697598) (not e!594688))))

(declare-datatypes ((array!66057 0))(
  ( (array!66058 (arr!31768 (Array (_ BitVec 32) (_ BitVec 64))) (size!32304 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66057)

(declare-datatypes ((List!22080 0))(
  ( (Nil!22077) (Cons!22076 (h!23285 (_ BitVec 64)) (t!31387 List!22080)) )
))
(declare-fun arrayNoDuplicates!0 (array!66057 (_ BitVec 32) List!22080) Bool)

(assert (=> b!1048468 (= res!697598 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22077))))

(declare-fun b!1048469 () Bool)

(declare-fun e!594686 () Bool)

(assert (=> b!1048469 (= e!594688 e!594686)))

(declare-fun res!697594 () Bool)

(assert (=> b!1048469 (=> (not res!697594) (not e!594686))))

(declare-fun lt!463205 () array!66057)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048469 (= res!697594 (arrayContainsKey!0 lt!463205 k!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048469 (= lt!463205 (array!66058 (store (arr!31768 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32304 a!3488)))))

(declare-fun b!1048470 () Bool)

(declare-fun e!594687 () Bool)

(assert (=> b!1048470 (= e!594687 (not true))))

(declare-fun e!594684 () Bool)

(assert (=> b!1048470 e!594684))

(declare-fun res!697595 () Bool)

(assert (=> b!1048470 (=> (not res!697595) (not e!594684))))

(declare-fun lt!463206 () (_ BitVec 32))

(assert (=> b!1048470 (= res!697595 (= (select (store (arr!31768 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463206) k!2747))))

(declare-fun e!594685 () Bool)

(declare-fun b!1048471 () Bool)

(assert (=> b!1048471 (= e!594685 (arrayContainsKey!0 a!3488 k!2747 lt!463206))))

(declare-fun b!1048472 () Bool)

(declare-fun res!697597 () Bool)

(assert (=> b!1048472 (=> (not res!697597) (not e!594688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048472 (= res!697597 (validKeyInArray!0 k!2747))))

(declare-fun b!1048474 () Bool)

(assert (=> b!1048474 (= e!594684 e!594685)))

(declare-fun res!697600 () Bool)

(assert (=> b!1048474 (=> res!697600 e!594685)))

(assert (=> b!1048474 (= res!697600 (bvsle lt!463206 i!1381))))

(declare-fun b!1048475 () Bool)

(assert (=> b!1048475 (= e!594686 e!594687)))

(declare-fun res!697601 () Bool)

(assert (=> b!1048475 (=> (not res!697601) (not e!594687))))

(assert (=> b!1048475 (= res!697601 (not (= lt!463206 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66057 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048475 (= lt!463206 (arrayScanForKey!0 lt!463205 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048473 () Bool)

(declare-fun res!697596 () Bool)

(assert (=> b!1048473 (=> (not res!697596) (not e!594688))))

(assert (=> b!1048473 (= res!697596 (= (select (arr!31768 a!3488) i!1381) k!2747))))

(declare-fun res!697599 () Bool)

(assert (=> start!92256 (=> (not res!697599) (not e!594688))))

(assert (=> start!92256 (= res!697599 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32304 a!3488)) (bvslt (size!32304 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92256 e!594688))

(assert (=> start!92256 true))

(declare-fun array_inv!24548 (array!66057) Bool)

(assert (=> start!92256 (array_inv!24548 a!3488)))

(assert (= (and start!92256 res!697599) b!1048468))

(assert (= (and b!1048468 res!697598) b!1048472))

(assert (= (and b!1048472 res!697597) b!1048473))

(assert (= (and b!1048473 res!697596) b!1048469))

(assert (= (and b!1048469 res!697594) b!1048475))

(assert (= (and b!1048475 res!697601) b!1048470))

(assert (= (and b!1048470 res!697595) b!1048474))

(assert (= (and b!1048474 (not res!697600)) b!1048471))

(declare-fun m!969431 () Bool)

(assert (=> b!1048471 m!969431))

(declare-fun m!969433 () Bool)

(assert (=> b!1048469 m!969433))

(declare-fun m!969435 () Bool)

(assert (=> b!1048469 m!969435))

(declare-fun m!969437 () Bool)

(assert (=> b!1048473 m!969437))

(declare-fun m!969439 () Bool)

(assert (=> b!1048475 m!969439))

(declare-fun m!969441 () Bool)

(assert (=> b!1048468 m!969441))

(declare-fun m!969443 () Bool)

(assert (=> start!92256 m!969443))

(declare-fun m!969445 () Bool)

(assert (=> b!1048472 m!969445))

(assert (=> b!1048470 m!969435))

(declare-fun m!969447 () Bool)

(assert (=> b!1048470 m!969447))

(push 1)

(assert (not b!1048469))

(assert (not b!1048472))

(assert (not b!1048468))

(assert (not start!92256))

(assert (not b!1048471))

(assert (not b!1048475))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

