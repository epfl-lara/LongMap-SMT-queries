; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92268 () Bool)

(assert start!92268)

(declare-fun b!1048612 () Bool)

(declare-fun lt!463241 () (_ BitVec 32))

(declare-datatypes ((array!66069 0))(
  ( (array!66070 (arr!31774 (Array (_ BitVec 32) (_ BitVec 64))) (size!32310 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66069)

(declare-fun e!594791 () Bool)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048612 (= e!594791 (arrayContainsKey!0 a!3488 k!2747 lt!463241))))

(declare-fun b!1048613 () Bool)

(declare-fun e!594794 () Bool)

(declare-fun e!594793 () Bool)

(assert (=> b!1048613 (= e!594794 e!594793)))

(declare-fun res!697742 () Bool)

(assert (=> b!1048613 (=> (not res!697742) (not e!594793))))

(declare-fun lt!463242 () array!66069)

(assert (=> b!1048613 (= res!697742 (arrayContainsKey!0 lt!463242 k!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048613 (= lt!463242 (array!66070 (store (arr!31774 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32310 a!3488)))))

(declare-fun b!1048614 () Bool)

(declare-fun res!697741 () Bool)

(assert (=> b!1048614 (=> (not res!697741) (not e!594794))))

(declare-datatypes ((List!22086 0))(
  ( (Nil!22083) (Cons!22082 (h!23291 (_ BitVec 64)) (t!31393 List!22086)) )
))
(declare-fun arrayNoDuplicates!0 (array!66069 (_ BitVec 32) List!22086) Bool)

(assert (=> b!1048614 (= res!697741 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22083))))

(declare-fun b!1048615 () Bool)

(declare-fun res!697739 () Bool)

(assert (=> b!1048615 (=> (not res!697739) (not e!594794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048615 (= res!697739 (validKeyInArray!0 k!2747))))

(declare-fun b!1048616 () Bool)

(declare-fun e!594796 () Bool)

(assert (=> b!1048616 (= e!594793 e!594796)))

(declare-fun res!697740 () Bool)

(assert (=> b!1048616 (=> (not res!697740) (not e!594796))))

(assert (=> b!1048616 (= res!697740 (not (= lt!463241 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66069 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048616 (= lt!463241 (arrayScanForKey!0 lt!463242 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048617 () Bool)

(declare-fun e!594795 () Bool)

(assert (=> b!1048617 (= e!594795 e!594791)))

(declare-fun res!697738 () Bool)

(assert (=> b!1048617 (=> res!697738 e!594791)))

(assert (=> b!1048617 (= res!697738 (bvsle lt!463241 i!1381))))

(declare-fun b!1048619 () Bool)

(declare-fun res!697744 () Bool)

(assert (=> b!1048619 (=> (not res!697744) (not e!594794))))

(assert (=> b!1048619 (= res!697744 (= (select (arr!31774 a!3488) i!1381) k!2747))))

(declare-fun b!1048618 () Bool)

(assert (=> b!1048618 (= e!594796 (not true))))

(assert (=> b!1048618 e!594795))

(declare-fun res!697745 () Bool)

(assert (=> b!1048618 (=> (not res!697745) (not e!594795))))

(assert (=> b!1048618 (= res!697745 (= (select (store (arr!31774 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463241) k!2747))))

(declare-fun res!697743 () Bool)

(assert (=> start!92268 (=> (not res!697743) (not e!594794))))

(assert (=> start!92268 (= res!697743 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32310 a!3488)) (bvslt (size!32310 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92268 e!594794))

(assert (=> start!92268 true))

(declare-fun array_inv!24554 (array!66069) Bool)

(assert (=> start!92268 (array_inv!24554 a!3488)))

(assert (= (and start!92268 res!697743) b!1048614))

(assert (= (and b!1048614 res!697741) b!1048615))

(assert (= (and b!1048615 res!697739) b!1048619))

(assert (= (and b!1048619 res!697744) b!1048613))

(assert (= (and b!1048613 res!697742) b!1048616))

(assert (= (and b!1048616 res!697740) b!1048618))

(assert (= (and b!1048618 res!697745) b!1048617))

(assert (= (and b!1048617 (not res!697738)) b!1048612))

(declare-fun m!969539 () Bool)

(assert (=> b!1048618 m!969539))

(declare-fun m!969541 () Bool)

(assert (=> b!1048618 m!969541))

(declare-fun m!969543 () Bool)

(assert (=> b!1048614 m!969543))

(declare-fun m!969545 () Bool)

(assert (=> b!1048619 m!969545))

(declare-fun m!969547 () Bool)

(assert (=> start!92268 m!969547))

(declare-fun m!969549 () Bool)

(assert (=> b!1048612 m!969549))

(declare-fun m!969551 () Bool)

(assert (=> b!1048616 m!969551))

(declare-fun m!969553 () Bool)

(assert (=> b!1048613 m!969553))

(assert (=> b!1048613 m!969539))

(declare-fun m!969555 () Bool)

(assert (=> b!1048615 m!969555))

(push 1)

