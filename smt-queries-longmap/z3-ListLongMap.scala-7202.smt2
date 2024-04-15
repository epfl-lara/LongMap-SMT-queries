; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92272 () Bool)

(assert start!92272)

(declare-fun lt!463059 () (_ BitVec 32))

(declare-fun b!1048533 () Bool)

(declare-fun e!594756 () Bool)

(declare-datatypes ((array!66014 0))(
  ( (array!66015 (arr!31746 (Array (_ BitVec 32) (_ BitVec 64))) (size!32284 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66014)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048533 (= e!594756 (arrayContainsKey!0 a!3488 k0!2747 lt!463059))))

(declare-fun b!1048534 () Bool)

(declare-fun e!594759 () Bool)

(assert (=> b!1048534 (= e!594759 (not true))))

(declare-fun e!594757 () Bool)

(assert (=> b!1048534 e!594757))

(declare-fun res!697745 () Bool)

(assert (=> b!1048534 (=> (not res!697745) (not e!594757))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048534 (= res!697745 (= (select (store (arr!31746 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463059) k0!2747))))

(declare-fun b!1048535 () Bool)

(declare-fun res!697747 () Bool)

(declare-fun e!594754 () Bool)

(assert (=> b!1048535 (=> (not res!697747) (not e!594754))))

(assert (=> b!1048535 (= res!697747 (= (select (arr!31746 a!3488) i!1381) k0!2747))))

(declare-fun b!1048537 () Bool)

(declare-fun e!594755 () Bool)

(assert (=> b!1048537 (= e!594755 e!594759)))

(declare-fun res!697750 () Bool)

(assert (=> b!1048537 (=> (not res!697750) (not e!594759))))

(assert (=> b!1048537 (= res!697750 (not (= lt!463059 i!1381)))))

(declare-fun lt!463060 () array!66014)

(declare-fun arrayScanForKey!0 (array!66014 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048537 (= lt!463059 (arrayScanForKey!0 lt!463060 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048538 () Bool)

(declare-fun res!697749 () Bool)

(assert (=> b!1048538 (=> (not res!697749) (not e!594754))))

(declare-datatypes ((List!22117 0))(
  ( (Nil!22114) (Cons!22113 (h!23322 (_ BitVec 64)) (t!31415 List!22117)) )
))
(declare-fun arrayNoDuplicates!0 (array!66014 (_ BitVec 32) List!22117) Bool)

(assert (=> b!1048538 (= res!697749 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22114))))

(declare-fun b!1048539 () Bool)

(declare-fun res!697746 () Bool)

(assert (=> b!1048539 (=> (not res!697746) (not e!594754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048539 (= res!697746 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048540 () Bool)

(assert (=> b!1048540 (= e!594757 e!594756)))

(declare-fun res!697748 () Bool)

(assert (=> b!1048540 (=> res!697748 e!594756)))

(assert (=> b!1048540 (= res!697748 (bvsle lt!463059 i!1381))))

(declare-fun res!697743 () Bool)

(assert (=> start!92272 (=> (not res!697743) (not e!594754))))

(assert (=> start!92272 (= res!697743 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32284 a!3488)) (bvslt (size!32284 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92272 e!594754))

(assert (=> start!92272 true))

(declare-fun array_inv!24529 (array!66014) Bool)

(assert (=> start!92272 (array_inv!24529 a!3488)))

(declare-fun b!1048536 () Bool)

(assert (=> b!1048536 (= e!594754 e!594755)))

(declare-fun res!697744 () Bool)

(assert (=> b!1048536 (=> (not res!697744) (not e!594755))))

(assert (=> b!1048536 (= res!697744 (arrayContainsKey!0 lt!463060 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048536 (= lt!463060 (array!66015 (store (arr!31746 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32284 a!3488)))))

(assert (= (and start!92272 res!697743) b!1048538))

(assert (= (and b!1048538 res!697749) b!1048539))

(assert (= (and b!1048539 res!697746) b!1048535))

(assert (= (and b!1048535 res!697747) b!1048536))

(assert (= (and b!1048536 res!697744) b!1048537))

(assert (= (and b!1048537 res!697750) b!1048534))

(assert (= (and b!1048534 res!697745) b!1048540))

(assert (= (and b!1048540 (not res!697748)) b!1048533))

(declare-fun m!968977 () Bool)

(assert (=> b!1048537 m!968977))

(declare-fun m!968979 () Bool)

(assert (=> start!92272 m!968979))

(declare-fun m!968981 () Bool)

(assert (=> b!1048539 m!968981))

(declare-fun m!968983 () Bool)

(assert (=> b!1048538 m!968983))

(declare-fun m!968985 () Bool)

(assert (=> b!1048533 m!968985))

(declare-fun m!968987 () Bool)

(assert (=> b!1048534 m!968987))

(declare-fun m!968989 () Bool)

(assert (=> b!1048534 m!968989))

(declare-fun m!968991 () Bool)

(assert (=> b!1048536 m!968991))

(assert (=> b!1048536 m!968987))

(declare-fun m!968993 () Bool)

(assert (=> b!1048535 m!968993))

(check-sat (not b!1048537) (not b!1048539) (not start!92272) (not b!1048538) (not b!1048536) (not b!1048533))
(check-sat)
