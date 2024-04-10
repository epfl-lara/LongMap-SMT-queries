; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92760 () Bool)

(assert start!92760)

(declare-fun b!1053649 () Bool)

(declare-fun lt!465185 () (_ BitVec 32))

(declare-fun e!598446 () Bool)

(declare-datatypes ((array!66453 0))(
  ( (array!66454 (arr!31960 (Array (_ BitVec 32) (_ BitVec 64))) (size!32496 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66453)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053649 (= e!598446 (arrayContainsKey!0 a!3488 k!2747 lt!465185))))

(declare-fun b!1053650 () Bool)

(declare-fun res!702635 () Bool)

(declare-fun e!598445 () Bool)

(assert (=> b!1053650 (=> (not res!702635) (not e!598445))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053650 (= res!702635 (= (select (arr!31960 a!3488) i!1381) k!2747))))

(declare-fun b!1053651 () Bool)

(declare-fun res!702636 () Bool)

(assert (=> b!1053651 (=> (not res!702636) (not e!598445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053651 (= res!702636 (validKeyInArray!0 k!2747))))

(declare-fun res!702631 () Bool)

(assert (=> start!92760 (=> (not res!702631) (not e!598445))))

(assert (=> start!92760 (= res!702631 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32496 a!3488)) (bvslt (size!32496 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92760 e!598445))

(assert (=> start!92760 true))

(declare-fun array_inv!24740 (array!66453) Bool)

(assert (=> start!92760 (array_inv!24740 a!3488)))

(declare-fun b!1053652 () Bool)

(declare-fun res!702633 () Bool)

(assert (=> b!1053652 (=> (not res!702633) (not e!598445))))

(declare-datatypes ((List!22272 0))(
  ( (Nil!22269) (Cons!22268 (h!23477 (_ BitVec 64)) (t!31579 List!22272)) )
))
(declare-fun arrayNoDuplicates!0 (array!66453 (_ BitVec 32) List!22272) Bool)

(assert (=> b!1053652 (= res!702633 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22269))))

(declare-fun b!1053653 () Bool)

(declare-fun e!598447 () Bool)

(assert (=> b!1053653 (= e!598447 (not true))))

(declare-fun e!598444 () Bool)

(assert (=> b!1053653 e!598444))

(declare-fun res!702638 () Bool)

(assert (=> b!1053653 (=> (not res!702638) (not e!598444))))

(assert (=> b!1053653 (= res!702638 (= (select (store (arr!31960 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465185) k!2747))))

(declare-fun b!1053654 () Bool)

(declare-fun e!598442 () Bool)

(assert (=> b!1053654 (= e!598442 e!598447)))

(declare-fun res!702637 () Bool)

(assert (=> b!1053654 (=> (not res!702637) (not e!598447))))

(assert (=> b!1053654 (= res!702637 (not (= lt!465185 i!1381)))))

(declare-fun lt!465186 () array!66453)

(declare-fun arrayScanForKey!0 (array!66453 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053654 (= lt!465185 (arrayScanForKey!0 lt!465186 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053655 () Bool)

(assert (=> b!1053655 (= e!598444 e!598446)))

(declare-fun res!702632 () Bool)

(assert (=> b!1053655 (=> res!702632 e!598446)))

(assert (=> b!1053655 (= res!702632 (bvsle lt!465185 i!1381))))

(declare-fun b!1053656 () Bool)

(assert (=> b!1053656 (= e!598445 e!598442)))

(declare-fun res!702634 () Bool)

(assert (=> b!1053656 (=> (not res!702634) (not e!598442))))

(assert (=> b!1053656 (= res!702634 (arrayContainsKey!0 lt!465186 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053656 (= lt!465186 (array!66454 (store (arr!31960 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32496 a!3488)))))

(assert (= (and start!92760 res!702631) b!1053652))

(assert (= (and b!1053652 res!702633) b!1053651))

(assert (= (and b!1053651 res!702636) b!1053650))

(assert (= (and b!1053650 res!702635) b!1053656))

(assert (= (and b!1053656 res!702634) b!1053654))

(assert (= (and b!1053654 res!702637) b!1053653))

(assert (= (and b!1053653 res!702638) b!1053655))

(assert (= (and b!1053655 (not res!702632)) b!1053649))

(declare-fun m!973883 () Bool)

(assert (=> b!1053656 m!973883))

(declare-fun m!973885 () Bool)

(assert (=> b!1053656 m!973885))

(declare-fun m!973887 () Bool)

(assert (=> b!1053651 m!973887))

(assert (=> b!1053653 m!973885))

(declare-fun m!973889 () Bool)

(assert (=> b!1053653 m!973889))

(declare-fun m!973891 () Bool)

(assert (=> b!1053652 m!973891))

(declare-fun m!973893 () Bool)

(assert (=> b!1053649 m!973893))

(declare-fun m!973895 () Bool)

(assert (=> start!92760 m!973895))

(declare-fun m!973897 () Bool)

(assert (=> b!1053650 m!973897))

(declare-fun m!973899 () Bool)

(assert (=> b!1053654 m!973899))

(push 1)

