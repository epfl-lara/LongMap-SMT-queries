; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92872 () Bool)

(assert start!92872)

(declare-fun b!1054743 () Bool)

(declare-fun e!599288 () Bool)

(declare-fun e!599292 () Bool)

(assert (=> b!1054743 (= e!599288 (not e!599292))))

(declare-fun res!703688 () Bool)

(assert (=> b!1054743 (=> res!703688 e!599292)))

(declare-fun lt!465538 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054743 (= res!703688 (bvsle lt!465538 i!1381))))

(declare-fun e!599293 () Bool)

(assert (=> b!1054743 e!599293))

(declare-fun res!703683 () Bool)

(assert (=> b!1054743 (=> (not res!703683) (not e!599293))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-datatypes ((array!66532 0))(
  ( (array!66533 (arr!31998 (Array (_ BitVec 32) (_ BitVec 64))) (size!32534 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66532)

(assert (=> b!1054743 (= res!703683 (= (select (store (arr!31998 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465538) k!2747))))

(declare-fun res!703687 () Bool)

(declare-fun e!599290 () Bool)

(assert (=> start!92872 (=> (not res!703687) (not e!599290))))

(assert (=> start!92872 (= res!703687 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32534 a!3488)) (bvslt (size!32534 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92872 e!599290))

(assert (=> start!92872 true))

(declare-fun array_inv!24778 (array!66532) Bool)

(assert (=> start!92872 (array_inv!24778 a!3488)))

(declare-fun b!1054744 () Bool)

(declare-fun res!703686 () Bool)

(assert (=> b!1054744 (=> (not res!703686) (not e!599290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054744 (= res!703686 (validKeyInArray!0 k!2747))))

(declare-fun b!1054745 () Bool)

(declare-fun e!599291 () Bool)

(declare-fun arrayContainsKey!0 (array!66532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054745 (= e!599291 (arrayContainsKey!0 a!3488 k!2747 lt!465538))))

(declare-fun b!1054746 () Bool)

(assert (=> b!1054746 (= e!599293 e!599291)))

(declare-fun res!703689 () Bool)

(assert (=> b!1054746 (=> res!703689 e!599291)))

(assert (=> b!1054746 (= res!703689 (bvsle lt!465538 i!1381))))

(declare-fun b!1054747 () Bool)

(assert (=> b!1054747 (= e!599292 true)))

(assert (=> b!1054747 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34554 0))(
  ( (Unit!34555) )
))
(declare-fun lt!465540 () Unit!34554)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66532 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34554)

(assert (=> b!1054747 (= lt!465540 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465538 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22310 0))(
  ( (Nil!22307) (Cons!22306 (h!23515 (_ BitVec 64)) (t!31617 List!22310)) )
))
(declare-fun arrayNoDuplicates!0 (array!66532 (_ BitVec 32) List!22310) Bool)

(assert (=> b!1054747 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22307)))

(declare-fun lt!465539 () Unit!34554)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66532 (_ BitVec 32) (_ BitVec 32)) Unit!34554)

(assert (=> b!1054747 (= lt!465539 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054748 () Bool)

(declare-fun e!599287 () Bool)

(assert (=> b!1054748 (= e!599287 e!599288)))

(declare-fun res!703690 () Bool)

(assert (=> b!1054748 (=> (not res!703690) (not e!599288))))

(assert (=> b!1054748 (= res!703690 (not (= lt!465538 i!1381)))))

(declare-fun lt!465537 () array!66532)

(declare-fun arrayScanForKey!0 (array!66532 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054748 (= lt!465538 (arrayScanForKey!0 lt!465537 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054749 () Bool)

(declare-fun res!703691 () Bool)

(assert (=> b!1054749 (=> (not res!703691) (not e!599290))))

(assert (=> b!1054749 (= res!703691 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22307))))

(declare-fun b!1054750 () Bool)

(assert (=> b!1054750 (= e!599290 e!599287)))

(declare-fun res!703685 () Bool)

(assert (=> b!1054750 (=> (not res!703685) (not e!599287))))

(assert (=> b!1054750 (= res!703685 (arrayContainsKey!0 lt!465537 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054750 (= lt!465537 (array!66533 (store (arr!31998 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32534 a!3488)))))

(declare-fun b!1054751 () Bool)

(declare-fun res!703684 () Bool)

(assert (=> b!1054751 (=> (not res!703684) (not e!599290))))

(assert (=> b!1054751 (= res!703684 (= (select (arr!31998 a!3488) i!1381) k!2747))))

(assert (= (and start!92872 res!703687) b!1054749))

(assert (= (and b!1054749 res!703691) b!1054744))

(assert (= (and b!1054744 res!703686) b!1054751))

(assert (= (and b!1054751 res!703684) b!1054750))

(assert (= (and b!1054750 res!703685) b!1054748))

(assert (= (and b!1054748 res!703690) b!1054743))

(assert (= (and b!1054743 res!703683) b!1054746))

(assert (= (and b!1054746 (not res!703689)) b!1054745))

(assert (= (and b!1054743 (not res!703688)) b!1054747))

(declare-fun m!974787 () Bool)

(assert (=> b!1054744 m!974787))

(declare-fun m!974789 () Bool)

(assert (=> b!1054749 m!974789))

(declare-fun m!974791 () Bool)

(assert (=> b!1054751 m!974791))

(declare-fun m!974793 () Bool)

(assert (=> b!1054747 m!974793))

(declare-fun m!974795 () Bool)

(assert (=> b!1054747 m!974795))

(declare-fun m!974797 () Bool)

(assert (=> b!1054747 m!974797))

(declare-fun m!974799 () Bool)

(assert (=> b!1054747 m!974799))

(declare-fun m!974801 () Bool)

(assert (=> b!1054750 m!974801))

(declare-fun m!974803 () Bool)

(assert (=> b!1054750 m!974803))

(assert (=> b!1054743 m!974803))

(declare-fun m!974805 () Bool)

(assert (=> b!1054743 m!974805))

(declare-fun m!974807 () Bool)

(assert (=> b!1054748 m!974807))

(declare-fun m!974809 () Bool)

(assert (=> start!92872 m!974809))

(declare-fun m!974811 () Bool)

(assert (=> b!1054745 m!974811))

(push 1)

