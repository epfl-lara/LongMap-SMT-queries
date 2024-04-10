; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122250 () Bool)

(assert start!122250)

(declare-fun b!1417858 () Bool)

(declare-fun res!953573 () Bool)

(declare-fun e!802400 () Bool)

(assert (=> b!1417858 (=> (not res!953573) (not e!802400))))

(declare-datatypes ((array!96813 0))(
  ( (array!96814 (arr!46733 (Array (_ BitVec 32) (_ BitVec 64))) (size!47283 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96813)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96813 (_ BitVec 32)) Bool)

(assert (=> b!1417858 (= res!953573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1417859 () Bool)

(declare-fun res!953570 () Bool)

(assert (=> b!1417859 (=> (not res!953570) (not e!802400))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417859 (= res!953570 (validKeyInArray!0 (select (arr!46733 a!2831) i!982)))))

(declare-fun b!1417861 () Bool)

(declare-datatypes ((List!33243 0))(
  ( (Nil!33240) (Cons!33239 (h!34532 (_ BitVec 64)) (t!47937 List!33243)) )
))
(declare-fun noDuplicate!2606 (List!33243) Bool)

(assert (=> b!1417861 (= e!802400 (not (noDuplicate!2606 Nil!33240)))))

(declare-fun b!1417862 () Bool)

(declare-fun res!953572 () Bool)

(assert (=> b!1417862 (=> (not res!953572) (not e!802400))))

(assert (=> b!1417862 (= res!953572 (and (bvsle #b00000000000000000000000000000000 (size!47283 a!2831)) (bvslt (size!47283 a!2831) #b01111111111111111111111111111111)))))

(declare-fun b!1417863 () Bool)

(declare-fun res!953575 () Bool)

(assert (=> b!1417863 (=> (not res!953575) (not e!802400))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1417863 (= res!953575 (and (= (size!47283 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47283 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47283 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!953574 () Bool)

(assert (=> start!122250 (=> (not res!953574) (not e!802400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122250 (= res!953574 (validMask!0 mask!2608))))

(assert (=> start!122250 e!802400))

(assert (=> start!122250 true))

(declare-fun array_inv!35761 (array!96813) Bool)

(assert (=> start!122250 (array_inv!35761 a!2831)))

(declare-fun b!1417860 () Bool)

(declare-fun res!953571 () Bool)

(assert (=> b!1417860 (=> (not res!953571) (not e!802400))))

(assert (=> b!1417860 (= res!953571 (validKeyInArray!0 (select (arr!46733 a!2831) j!81)))))

(assert (= (and start!122250 res!953574) b!1417863))

(assert (= (and b!1417863 res!953575) b!1417859))

(assert (= (and b!1417859 res!953570) b!1417860))

(assert (= (and b!1417860 res!953571) b!1417858))

(assert (= (and b!1417858 res!953573) b!1417862))

(assert (= (and b!1417862 res!953572) b!1417861))

(declare-fun m!1308633 () Bool)

(assert (=> b!1417861 m!1308633))

(declare-fun m!1308635 () Bool)

(assert (=> b!1417858 m!1308635))

(declare-fun m!1308637 () Bool)

(assert (=> start!122250 m!1308637))

(declare-fun m!1308639 () Bool)

(assert (=> start!122250 m!1308639))

(declare-fun m!1308641 () Bool)

(assert (=> b!1417860 m!1308641))

(assert (=> b!1417860 m!1308641))

(declare-fun m!1308643 () Bool)

(assert (=> b!1417860 m!1308643))

(declare-fun m!1308645 () Bool)

(assert (=> b!1417859 m!1308645))

(assert (=> b!1417859 m!1308645))

(declare-fun m!1308647 () Bool)

(assert (=> b!1417859 m!1308647))

(push 1)

(assert (not b!1417858))

(assert (not b!1417859))

(assert (not b!1417860))

(assert (not start!122250))

(assert (not b!1417861))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152751 () Bool)

(declare-fun res!953628 () Bool)

(declare-fun e!802429 () Bool)

(assert (=> d!152751 (=> res!953628 e!802429)))

(assert (=> d!152751 (= res!953628 (is-Nil!33240 Nil!33240))))

(assert (=> d!152751 (= (noDuplicate!2606 Nil!33240) e!802429)))

(declare-fun b!1417916 () Bool)

(declare-fun e!802430 () Bool)

(assert (=> b!1417916 (= e!802429 e!802430)))

(declare-fun res!953629 () Bool)

(assert (=> b!1417916 (=> (not res!953629) (not e!802430))))

(declare-fun contains!9833 (List!33243 (_ BitVec 64)) Bool)

(assert (=> b!1417916 (= res!953629 (not (contains!9833 (t!47937 Nil!33240) (h!34532 Nil!33240))))))

(declare-fun b!1417917 () Bool)

(assert (=> b!1417917 (= e!802430 (noDuplicate!2606 (t!47937 Nil!33240)))))

(assert (= (and d!152751 (not res!953628)) b!1417916))

(assert (= (and b!1417916 res!953629) b!1417917))

(declare-fun m!1308689 () Bool)

(assert (=> b!1417916 m!1308689))

(declare-fun m!1308691 () Bool)

(assert (=> b!1417917 m!1308691))

(assert (=> b!1417861 d!152751))

(declare-fun d!152757 () Bool)

(assert (=> d!152757 (= (validKeyInArray!0 (select (arr!46733 a!2831) j!81)) (and (not (= (select (arr!46733 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46733 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417860 d!152757))

(declare-fun b!1417926 () Bool)

(declare-fun e!802439 () Bool)

(declare-fun e!802437 () Bool)

(assert (=> b!1417926 (= e!802439 e!802437)))

(declare-fun c!131628 () Bool)

(assert (=> b!1417926 (= c!131628 (validKeyInArray!0 (select (arr!46733 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1417927 () Bool)

(declare-fun e!802438 () Bool)

(assert (=> b!1417927 (= e!802437 e!802438)))

(declare-fun lt!625474 () (_ BitVec 64))

(assert (=> b!1417927 (= lt!625474 (select (arr!46733 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48052 0))(
  ( (Unit!48053) )
))
(declare-fun lt!625476 () Unit!48052)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96813 (_ BitVec 64) (_ BitVec 32)) Unit!48052)

(assert (=> b!1417927 (= lt!625476 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625474 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1417927 (arrayContainsKey!0 a!2831 lt!625474 #b00000000000000000000000000000000)))

(declare-fun lt!625475 () Unit!48052)

(assert (=> b!1417927 (= lt!625475 lt!625476)))

(declare-fun res!953635 () Bool)

(declare-datatypes ((SeekEntryResult!11039 0))(
  ( (MissingZero!11039 (index!46548 (_ BitVec 32))) (Found!11039 (index!46549 (_ BitVec 32))) (Intermediate!11039 (undefined!11851 Bool) (index!46550 (_ BitVec 32)) (x!128162 (_ BitVec 32))) (Undefined!11039) (MissingVacant!11039 (index!46551 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96813 (_ BitVec 32)) SeekEntryResult!11039)

(assert (=> b!1417927 (= res!953635 (= (seekEntryOrOpen!0 (select (arr!46733 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11039 #b00000000000000000000000000000000)))))

(assert (=> b!1417927 (=> (not res!953635) (not e!802438))))

(declare-fun b!1417928 () Bool)

(declare-fun call!67234 () Bool)

(assert (=> b!1417928 (= e!802437 call!67234)))

(declare-fun bm!67231 () Bool)

(assert (=> bm!67231 (= call!67234 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!152759 () Bool)

(declare-fun res!953634 () Bool)

(assert (=> d!152759 (=> res!953634 e!802439)))

(assert (=> d!152759 (= res!953634 (bvsge #b00000000000000000000000000000000 (size!47283 a!2831)))))

(assert (=> d!152759 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802439)))

(declare-fun b!1417929 () Bool)

(assert (=> b!1417929 (= e!802438 call!67234)))

(assert (= (and d!152759 (not res!953634)) b!1417926))

(assert (= (and b!1417926 c!131628) b!1417927))

(assert (= (and b!1417926 (not c!131628)) b!1417928))

(assert (= (and b!1417927 res!953635) b!1417929))

(assert (= (or b!1417929 b!1417928) bm!67231))

(declare-fun m!1308693 () Bool)

(assert (=> b!1417926 m!1308693))

(assert (=> b!1417926 m!1308693))

(declare-fun m!1308695 () Bool)

(assert (=> b!1417926 m!1308695))

(assert (=> b!1417927 m!1308693))

(declare-fun m!1308697 () Bool)

(assert (=> b!1417927 m!1308697))

(declare-fun m!1308699 () Bool)

(assert (=> b!1417927 m!1308699))

(assert (=> b!1417927 m!1308693))

(declare-fun m!1308701 () Bool)

