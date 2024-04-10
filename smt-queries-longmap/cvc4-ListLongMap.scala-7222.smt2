; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92398 () Bool)

(assert start!92398)

(declare-fun res!699687 () Bool)

(declare-fun e!596188 () Bool)

(assert (=> start!92398 (=> (not res!699687) (not e!596188))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66199 0))(
  ( (array!66200 (arr!31839 (Array (_ BitVec 32) (_ BitVec 64))) (size!32375 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66199)

(assert (=> start!92398 (= res!699687 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32375 a!3488)) (bvslt (size!32375 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92398 e!596188))

(assert (=> start!92398 true))

(declare-fun array_inv!24619 (array!66199) Bool)

(assert (=> start!92398 (array_inv!24619 a!3488)))

(declare-fun b!1050561 () Bool)

(declare-fun e!596190 () Bool)

(assert (=> b!1050561 (= e!596188 e!596190)))

(declare-fun res!699688 () Bool)

(assert (=> b!1050561 (=> (not res!699688) (not e!596190))))

(declare-fun lt!464009 () array!66199)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050561 (= res!699688 (arrayContainsKey!0 lt!464009 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050561 (= lt!464009 (array!66200 (store (arr!31839 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32375 a!3488)))))

(declare-fun b!1050562 () Bool)

(declare-fun res!699690 () Bool)

(assert (=> b!1050562 (=> (not res!699690) (not e!596188))))

(declare-datatypes ((List!22151 0))(
  ( (Nil!22148) (Cons!22147 (h!23356 (_ BitVec 64)) (t!31458 List!22151)) )
))
(declare-fun arrayNoDuplicates!0 (array!66199 (_ BitVec 32) List!22151) Bool)

(assert (=> b!1050562 (= res!699690 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22148))))

(declare-fun b!1050563 () Bool)

(declare-fun res!699692 () Bool)

(assert (=> b!1050563 (=> (not res!699692) (not e!596188))))

(assert (=> b!1050563 (= res!699692 (= (select (arr!31839 a!3488) i!1381) k!2747))))

(declare-fun b!1050564 () Bool)

(declare-fun e!596189 () Bool)

(assert (=> b!1050564 (= e!596189 (not true))))

(declare-fun lt!464010 () (_ BitVec 32))

(assert (=> b!1050564 (= (select (store (arr!31839 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464010) k!2747)))

(declare-fun b!1050565 () Bool)

(declare-fun res!699689 () Bool)

(assert (=> b!1050565 (=> (not res!699689) (not e!596188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050565 (= res!699689 (validKeyInArray!0 k!2747))))

(declare-fun b!1050566 () Bool)

(assert (=> b!1050566 (= e!596190 e!596189)))

(declare-fun res!699691 () Bool)

(assert (=> b!1050566 (=> (not res!699691) (not e!596189))))

(assert (=> b!1050566 (= res!699691 (not (= lt!464010 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66199 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050566 (= lt!464010 (arrayScanForKey!0 lt!464009 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92398 res!699687) b!1050562))

(assert (= (and b!1050562 res!699690) b!1050565))

(assert (= (and b!1050565 res!699689) b!1050563))

(assert (= (and b!1050563 res!699692) b!1050561))

(assert (= (and b!1050561 res!699688) b!1050566))

(assert (= (and b!1050566 res!699691) b!1050564))

(declare-fun m!971245 () Bool)

(assert (=> b!1050565 m!971245))

(declare-fun m!971247 () Bool)

(assert (=> b!1050563 m!971247))

(declare-fun m!971249 () Bool)

(assert (=> b!1050561 m!971249))

(declare-fun m!971251 () Bool)

(assert (=> b!1050561 m!971251))

(declare-fun m!971253 () Bool)

(assert (=> b!1050562 m!971253))

(declare-fun m!971255 () Bool)

(assert (=> start!92398 m!971255))

(declare-fun m!971257 () Bool)

(assert (=> b!1050566 m!971257))

(assert (=> b!1050564 m!971251))

(declare-fun m!971259 () Bool)

(assert (=> b!1050564 m!971259))

(push 1)

(assert (not b!1050565))

(assert (not b!1050566))

(assert (not b!1050562))

(assert (not start!92398))

(assert (not b!1050561))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

