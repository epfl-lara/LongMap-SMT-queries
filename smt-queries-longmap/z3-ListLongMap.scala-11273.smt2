; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131892 () Bool)

(assert start!131892)

(declare-fun res!1058460 () Bool)

(declare-fun e!858567 () Bool)

(assert (=> start!131892 (=> (not res!1058460) (not e!858567))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131892 (= res!1058460 (validMask!0 mask!4052))))

(assert (=> start!131892 e!858567))

(assert (=> start!131892 true))

(declare-datatypes ((array!102503 0))(
  ( (array!102504 (arr!49453 (Array (_ BitVec 32) (_ BitVec 64))) (size!50004 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102503)

(declare-fun array_inv!38734 (array!102503) Bool)

(assert (=> start!131892 (array_inv!38734 a!3920)))

(declare-fun b!1543489 () Bool)

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1543489 (= e!858567 (not (bvsge newFrom!293 #b00000000000000000000000000000000)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102503 (_ BitVec 32)) Bool)

(assert (=> b!1543489 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-fun from!3298 () (_ BitVec 32))

(declare-datatypes ((Unit!51391 0))(
  ( (Unit!51392) )
))
(declare-fun lt!666480 () Unit!51391)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102503 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51391)

(assert (=> b!1543489 (= lt!666480 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun b!1543490 () Bool)

(declare-fun res!1058463 () Bool)

(assert (=> b!1543490 (=> (not res!1058463) (not e!858567))))

(assert (=> b!1543490 (= res!1058463 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1543491 () Bool)

(declare-fun res!1058462 () Bool)

(assert (=> b!1543491 (=> (not res!1058462) (not e!858567))))

(assert (=> b!1543491 (= res!1058462 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1543492 () Bool)

(declare-fun res!1058461 () Bool)

(assert (=> b!1543492 (=> (not res!1058461) (not e!858567))))

(assert (=> b!1543492 (= res!1058461 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!50004 a!3920))))))

(declare-fun b!1543493 () Bool)

(declare-fun res!1058459 () Bool)

(assert (=> b!1543493 (=> (not res!1058459) (not e!858567))))

(assert (=> b!1543493 (= res!1058459 (and (= (size!50004 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!50004 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!50004 a!3920))))))

(assert (= (and start!131892 res!1058460) b!1543493))

(assert (= (and b!1543493 res!1058459) b!1543490))

(assert (= (and b!1543490 res!1058463) b!1543492))

(assert (= (and b!1543492 res!1058461) b!1543491))

(assert (= (and b!1543491 res!1058462) b!1543489))

(declare-fun m!1425341 () Bool)

(assert (=> start!131892 m!1425341))

(declare-fun m!1425343 () Bool)

(assert (=> start!131892 m!1425343))

(declare-fun m!1425345 () Bool)

(assert (=> b!1543489 m!1425345))

(declare-fun m!1425347 () Bool)

(assert (=> b!1543489 m!1425347))

(declare-fun m!1425349 () Bool)

(assert (=> b!1543490 m!1425349))

(declare-fun m!1425351 () Bool)

(assert (=> b!1543491 m!1425351))

(check-sat (not b!1543490) (not b!1543491) (not b!1543489) (not start!131892))
(check-sat)
