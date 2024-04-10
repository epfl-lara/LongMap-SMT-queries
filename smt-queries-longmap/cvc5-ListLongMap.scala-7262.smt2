; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92754 () Bool)

(assert start!92754)

(declare-fun b!1053577 () Bool)

(declare-fun e!598390 () Bool)

(assert (=> b!1053577 (= e!598390 (not true))))

(declare-fun e!598392 () Bool)

(assert (=> b!1053577 e!598392))

(declare-fun res!702564 () Bool)

(assert (=> b!1053577 (=> (not res!702564) (not e!598392))))

(declare-datatypes ((array!66447 0))(
  ( (array!66448 (arr!31957 (Array (_ BitVec 32) (_ BitVec 64))) (size!32493 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66447)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun lt!465167 () (_ BitVec 32))

(assert (=> b!1053577 (= res!702564 (= (select (store (arr!31957 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465167) k!2747))))

(declare-fun b!1053578 () Bool)

(declare-fun e!598388 () Bool)

(declare-fun arrayContainsKey!0 (array!66447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053578 (= e!598388 (arrayContainsKey!0 a!3488 k!2747 lt!465167))))

(declare-fun b!1053579 () Bool)

(declare-fun e!598393 () Bool)

(declare-fun e!598391 () Bool)

(assert (=> b!1053579 (= e!598393 e!598391)))

(declare-fun res!702559 () Bool)

(assert (=> b!1053579 (=> (not res!702559) (not e!598391))))

(declare-fun lt!465168 () array!66447)

(assert (=> b!1053579 (= res!702559 (arrayContainsKey!0 lt!465168 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053579 (= lt!465168 (array!66448 (store (arr!31957 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32493 a!3488)))))

(declare-fun b!1053580 () Bool)

(assert (=> b!1053580 (= e!598391 e!598390)))

(declare-fun res!702566 () Bool)

(assert (=> b!1053580 (=> (not res!702566) (not e!598390))))

(assert (=> b!1053580 (= res!702566 (not (= lt!465167 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66447 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053580 (= lt!465167 (arrayScanForKey!0 lt!465168 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053581 () Bool)

(declare-fun res!702560 () Bool)

(assert (=> b!1053581 (=> (not res!702560) (not e!598393))))

(assert (=> b!1053581 (= res!702560 (= (select (arr!31957 a!3488) i!1381) k!2747))))

(declare-fun b!1053582 () Bool)

(declare-fun res!702563 () Bool)

(assert (=> b!1053582 (=> (not res!702563) (not e!598393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053582 (= res!702563 (validKeyInArray!0 k!2747))))

(declare-fun b!1053583 () Bool)

(assert (=> b!1053583 (= e!598392 e!598388)))

(declare-fun res!702562 () Bool)

(assert (=> b!1053583 (=> res!702562 e!598388)))

(assert (=> b!1053583 (= res!702562 (bvsle lt!465167 i!1381))))

(declare-fun b!1053584 () Bool)

(declare-fun res!702561 () Bool)

(assert (=> b!1053584 (=> (not res!702561) (not e!598393))))

(declare-datatypes ((List!22269 0))(
  ( (Nil!22266) (Cons!22265 (h!23474 (_ BitVec 64)) (t!31576 List!22269)) )
))
(declare-fun arrayNoDuplicates!0 (array!66447 (_ BitVec 32) List!22269) Bool)

(assert (=> b!1053584 (= res!702561 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22266))))

(declare-fun res!702565 () Bool)

(assert (=> start!92754 (=> (not res!702565) (not e!598393))))

(assert (=> start!92754 (= res!702565 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32493 a!3488)) (bvslt (size!32493 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92754 e!598393))

(assert (=> start!92754 true))

(declare-fun array_inv!24737 (array!66447) Bool)

(assert (=> start!92754 (array_inv!24737 a!3488)))

(assert (= (and start!92754 res!702565) b!1053584))

(assert (= (and b!1053584 res!702561) b!1053582))

(assert (= (and b!1053582 res!702563) b!1053581))

(assert (= (and b!1053581 res!702560) b!1053579))

(assert (= (and b!1053579 res!702559) b!1053580))

(assert (= (and b!1053580 res!702566) b!1053577))

(assert (= (and b!1053577 res!702564) b!1053583))

(assert (= (and b!1053583 (not res!702562)) b!1053578))

(declare-fun m!973829 () Bool)

(assert (=> b!1053581 m!973829))

(declare-fun m!973831 () Bool)

(assert (=> b!1053579 m!973831))

(declare-fun m!973833 () Bool)

(assert (=> b!1053579 m!973833))

(assert (=> b!1053577 m!973833))

(declare-fun m!973835 () Bool)

(assert (=> b!1053577 m!973835))

(declare-fun m!973837 () Bool)

(assert (=> b!1053584 m!973837))

(declare-fun m!973839 () Bool)

(assert (=> b!1053578 m!973839))

(declare-fun m!973841 () Bool)

(assert (=> b!1053580 m!973841))

(declare-fun m!973843 () Bool)

(assert (=> b!1053582 m!973843))

(declare-fun m!973845 () Bool)

(assert (=> start!92754 m!973845))

(push 1)

