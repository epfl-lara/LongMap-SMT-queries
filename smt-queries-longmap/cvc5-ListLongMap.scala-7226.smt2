; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92418 () Bool)

(assert start!92418)

(declare-fun b!1050763 () Bool)

(declare-fun res!699896 () Bool)

(declare-fun e!596332 () Bool)

(assert (=> b!1050763 (=> (not res!699896) (not e!596332))))

(declare-datatypes ((array!66219 0))(
  ( (array!66220 (arr!31849 (Array (_ BitVec 32) (_ BitVec 64))) (size!32385 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66219)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050763 (= res!699896 (= (select (arr!31849 a!3488) i!1381) k!2747))))

(declare-fun b!1050764 () Bool)

(declare-fun res!699892 () Bool)

(assert (=> b!1050764 (=> (not res!699892) (not e!596332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050764 (= res!699892 (validKeyInArray!0 k!2747))))

(declare-fun b!1050765 () Bool)

(declare-fun e!596330 () Bool)

(assert (=> b!1050765 (= e!596330 (not true))))

(declare-fun e!596333 () Bool)

(assert (=> b!1050765 e!596333))

(declare-fun res!699890 () Bool)

(assert (=> b!1050765 (=> (not res!699890) (not e!596333))))

(declare-fun lt!464070 () (_ BitVec 32))

(assert (=> b!1050765 (= res!699890 (= (select (store (arr!31849 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464070) k!2747))))

(declare-fun b!1050766 () Bool)

(declare-fun e!596334 () Bool)

(declare-fun arrayContainsKey!0 (array!66219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050766 (= e!596334 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun res!699889 () Bool)

(assert (=> start!92418 (=> (not res!699889) (not e!596332))))

(assert (=> start!92418 (= res!699889 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32385 a!3488)) (bvslt (size!32385 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92418 e!596332))

(assert (=> start!92418 true))

(declare-fun array_inv!24629 (array!66219) Bool)

(assert (=> start!92418 (array_inv!24629 a!3488)))

(declare-fun b!1050767 () Bool)

(declare-fun e!596331 () Bool)

(assert (=> b!1050767 (= e!596331 e!596330)))

(declare-fun res!699891 () Bool)

(assert (=> b!1050767 (=> (not res!699891) (not e!596330))))

(assert (=> b!1050767 (= res!699891 (not (= lt!464070 i!1381)))))

(declare-fun lt!464069 () array!66219)

(declare-fun arrayScanForKey!0 (array!66219 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050767 (= lt!464070 (arrayScanForKey!0 lt!464069 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050768 () Bool)

(assert (=> b!1050768 (= e!596333 e!596334)))

(declare-fun res!699895 () Bool)

(assert (=> b!1050768 (=> res!699895 e!596334)))

(assert (=> b!1050768 (= res!699895 (or (bvsgt lt!464070 i!1381) (bvsle i!1381 lt!464070)))))

(declare-fun b!1050769 () Bool)

(declare-fun res!699893 () Bool)

(assert (=> b!1050769 (=> (not res!699893) (not e!596332))))

(declare-datatypes ((List!22161 0))(
  ( (Nil!22158) (Cons!22157 (h!23366 (_ BitVec 64)) (t!31468 List!22161)) )
))
(declare-fun arrayNoDuplicates!0 (array!66219 (_ BitVec 32) List!22161) Bool)

(assert (=> b!1050769 (= res!699893 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22158))))

(declare-fun b!1050770 () Bool)

(assert (=> b!1050770 (= e!596332 e!596331)))

(declare-fun res!699894 () Bool)

(assert (=> b!1050770 (=> (not res!699894) (not e!596331))))

(assert (=> b!1050770 (= res!699894 (arrayContainsKey!0 lt!464069 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050770 (= lt!464069 (array!66220 (store (arr!31849 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32385 a!3488)))))

(assert (= (and start!92418 res!699889) b!1050769))

(assert (= (and b!1050769 res!699893) b!1050764))

(assert (= (and b!1050764 res!699892) b!1050763))

(assert (= (and b!1050763 res!699896) b!1050770))

(assert (= (and b!1050770 res!699894) b!1050767))

(assert (= (and b!1050767 res!699891) b!1050765))

(assert (= (and b!1050765 res!699890) b!1050768))

(assert (= (and b!1050768 (not res!699895)) b!1050766))

(declare-fun m!971411 () Bool)

(assert (=> b!1050769 m!971411))

(declare-fun m!971413 () Bool)

(assert (=> b!1050764 m!971413))

(declare-fun m!971415 () Bool)

(assert (=> b!1050766 m!971415))

(declare-fun m!971417 () Bool)

(assert (=> b!1050765 m!971417))

(declare-fun m!971419 () Bool)

(assert (=> b!1050765 m!971419))

(declare-fun m!971421 () Bool)

(assert (=> b!1050763 m!971421))

(declare-fun m!971423 () Bool)

(assert (=> start!92418 m!971423))

(declare-fun m!971425 () Bool)

(assert (=> b!1050767 m!971425))

(declare-fun m!971427 () Bool)

(assert (=> b!1050770 m!971427))

(assert (=> b!1050770 m!971417))

(push 1)

