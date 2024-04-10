; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92250 () Bool)

(assert start!92250)

(declare-fun b!1048410 () Bool)

(declare-fun res!697541 () Bool)

(declare-fun e!594646 () Bool)

(assert (=> b!1048410 (=> (not res!697541) (not e!594646))))

(declare-datatypes ((array!66051 0))(
  ( (array!66052 (arr!31765 (Array (_ BitVec 32) (_ BitVec 64))) (size!32301 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66051)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048410 (= res!697541 (= (select (arr!31765 a!3488) i!1381) k!2747))))

(declare-fun b!1048411 () Bool)

(declare-fun e!594643 () Bool)

(assert (=> b!1048411 (= e!594643 (not true))))

(declare-fun lt!463188 () (_ BitVec 32))

(assert (=> b!1048411 (= (select (store (arr!31765 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463188) k!2747)))

(declare-fun b!1048412 () Bool)

(declare-fun res!697536 () Bool)

(assert (=> b!1048412 (=> (not res!697536) (not e!594646))))

(declare-datatypes ((List!22077 0))(
  ( (Nil!22074) (Cons!22073 (h!23282 (_ BitVec 64)) (t!31384 List!22077)) )
))
(declare-fun arrayNoDuplicates!0 (array!66051 (_ BitVec 32) List!22077) Bool)

(assert (=> b!1048412 (= res!697536 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22074))))

(declare-fun b!1048413 () Bool)

(declare-fun e!594644 () Bool)

(assert (=> b!1048413 (= e!594646 e!594644)))

(declare-fun res!697537 () Bool)

(assert (=> b!1048413 (=> (not res!697537) (not e!594644))))

(declare-fun lt!463187 () array!66051)

(declare-fun arrayContainsKey!0 (array!66051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048413 (= res!697537 (arrayContainsKey!0 lt!463187 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048413 (= lt!463187 (array!66052 (store (arr!31765 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32301 a!3488)))))

(declare-fun res!697539 () Bool)

(assert (=> start!92250 (=> (not res!697539) (not e!594646))))

(assert (=> start!92250 (= res!697539 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32301 a!3488)) (bvslt (size!32301 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92250 e!594646))

(assert (=> start!92250 true))

(declare-fun array_inv!24545 (array!66051) Bool)

(assert (=> start!92250 (array_inv!24545 a!3488)))

(declare-fun b!1048414 () Bool)

(declare-fun res!697540 () Bool)

(assert (=> b!1048414 (=> (not res!697540) (not e!594646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048414 (= res!697540 (validKeyInArray!0 k!2747))))

(declare-fun b!1048415 () Bool)

(assert (=> b!1048415 (= e!594644 e!594643)))

(declare-fun res!697538 () Bool)

(assert (=> b!1048415 (=> (not res!697538) (not e!594643))))

(assert (=> b!1048415 (= res!697538 (not (= lt!463188 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66051 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048415 (= lt!463188 (arrayScanForKey!0 lt!463187 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92250 res!697539) b!1048412))

(assert (= (and b!1048412 res!697536) b!1048414))

(assert (= (and b!1048414 res!697540) b!1048410))

(assert (= (and b!1048410 res!697541) b!1048413))

(assert (= (and b!1048413 res!697537) b!1048415))

(assert (= (and b!1048415 res!697538) b!1048411))

(declare-fun m!969383 () Bool)

(assert (=> b!1048414 m!969383))

(declare-fun m!969385 () Bool)

(assert (=> start!92250 m!969385))

(declare-fun m!969387 () Bool)

(assert (=> b!1048413 m!969387))

(declare-fun m!969389 () Bool)

(assert (=> b!1048413 m!969389))

(declare-fun m!969391 () Bool)

(assert (=> b!1048412 m!969391))

(declare-fun m!969393 () Bool)

(assert (=> b!1048410 m!969393))

(assert (=> b!1048411 m!969389))

(declare-fun m!969395 () Bool)

(assert (=> b!1048411 m!969395))

(declare-fun m!969397 () Bool)

(assert (=> b!1048415 m!969397))

(push 1)

(assert (not b!1048413))

