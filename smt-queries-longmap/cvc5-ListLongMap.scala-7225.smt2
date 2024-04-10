; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92412 () Bool)

(assert start!92412)

(declare-fun b!1050691 () Bool)

(declare-fun res!699823 () Bool)

(declare-fun e!596277 () Bool)

(assert (=> b!1050691 (=> (not res!699823) (not e!596277))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050691 (= res!699823 (validKeyInArray!0 k!2747))))

(declare-fun b!1050692 () Bool)

(declare-fun res!699821 () Bool)

(assert (=> b!1050692 (=> (not res!699821) (not e!596277))))

(declare-datatypes ((array!66213 0))(
  ( (array!66214 (arr!31846 (Array (_ BitVec 32) (_ BitVec 64))) (size!32382 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66213)

(declare-datatypes ((List!22158 0))(
  ( (Nil!22155) (Cons!22154 (h!23363 (_ BitVec 64)) (t!31465 List!22158)) )
))
(declare-fun arrayNoDuplicates!0 (array!66213 (_ BitVec 32) List!22158) Bool)

(assert (=> b!1050692 (= res!699821 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22155))))

(declare-fun b!1050693 () Bool)

(declare-fun e!596278 () Bool)

(assert (=> b!1050693 (= e!596278 (not true))))

(declare-fun e!596281 () Bool)

(assert (=> b!1050693 e!596281))

(declare-fun res!699817 () Bool)

(assert (=> b!1050693 (=> (not res!699817) (not e!596281))))

(declare-fun lt!464052 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050693 (= res!699817 (= (select (store (arr!31846 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464052) k!2747))))

(declare-fun res!699818 () Bool)

(assert (=> start!92412 (=> (not res!699818) (not e!596277))))

(assert (=> start!92412 (= res!699818 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32382 a!3488)) (bvslt (size!32382 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92412 e!596277))

(assert (=> start!92412 true))

(declare-fun array_inv!24626 (array!66213) Bool)

(assert (=> start!92412 (array_inv!24626 a!3488)))

(declare-fun b!1050694 () Bool)

(declare-fun res!699820 () Bool)

(assert (=> b!1050694 (=> (not res!699820) (not e!596277))))

(assert (=> b!1050694 (= res!699820 (= (select (arr!31846 a!3488) i!1381) k!2747))))

(declare-fun b!1050695 () Bool)

(declare-fun e!596276 () Bool)

(declare-fun arrayContainsKey!0 (array!66213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050695 (= e!596276 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1050696 () Bool)

(declare-fun e!596279 () Bool)

(assert (=> b!1050696 (= e!596277 e!596279)))

(declare-fun res!699819 () Bool)

(assert (=> b!1050696 (=> (not res!699819) (not e!596279))))

(declare-fun lt!464051 () array!66213)

(assert (=> b!1050696 (= res!699819 (arrayContainsKey!0 lt!464051 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050696 (= lt!464051 (array!66214 (store (arr!31846 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32382 a!3488)))))

(declare-fun b!1050697 () Bool)

(assert (=> b!1050697 (= e!596279 e!596278)))

(declare-fun res!699822 () Bool)

(assert (=> b!1050697 (=> (not res!699822) (not e!596278))))

(assert (=> b!1050697 (= res!699822 (not (= lt!464052 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66213 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050697 (= lt!464052 (arrayScanForKey!0 lt!464051 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050698 () Bool)

(assert (=> b!1050698 (= e!596281 e!596276)))

(declare-fun res!699824 () Bool)

(assert (=> b!1050698 (=> res!699824 e!596276)))

(assert (=> b!1050698 (= res!699824 (or (bvsgt lt!464052 i!1381) (bvsle i!1381 lt!464052)))))

(assert (= (and start!92412 res!699818) b!1050692))

(assert (= (and b!1050692 res!699821) b!1050691))

(assert (= (and b!1050691 res!699823) b!1050694))

(assert (= (and b!1050694 res!699820) b!1050696))

(assert (= (and b!1050696 res!699819) b!1050697))

(assert (= (and b!1050697 res!699822) b!1050693))

(assert (= (and b!1050693 res!699817) b!1050698))

(assert (= (and b!1050698 (not res!699824)) b!1050695))

(declare-fun m!971357 () Bool)

(assert (=> b!1050697 m!971357))

(declare-fun m!971359 () Bool)

(assert (=> b!1050695 m!971359))

(declare-fun m!971361 () Bool)

(assert (=> b!1050696 m!971361))

(declare-fun m!971363 () Bool)

(assert (=> b!1050696 m!971363))

(declare-fun m!971365 () Bool)

(assert (=> b!1050694 m!971365))

(declare-fun m!971367 () Bool)

(assert (=> b!1050692 m!971367))

(assert (=> b!1050693 m!971363))

(declare-fun m!971369 () Bool)

(assert (=> b!1050693 m!971369))

(declare-fun m!971371 () Bool)

(assert (=> start!92412 m!971371))

(declare-fun m!971373 () Bool)

(assert (=> b!1050691 m!971373))

(push 1)

