; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92280 () Bool)

(assert start!92280)

(declare-fun b!1048756 () Bool)

(declare-fun e!594899 () Bool)

(declare-fun e!594902 () Bool)

(assert (=> b!1048756 (= e!594899 e!594902)))

(declare-fun res!697888 () Bool)

(assert (=> b!1048756 (=> (not res!697888) (not e!594902))))

(declare-datatypes ((array!66081 0))(
  ( (array!66082 (arr!31780 (Array (_ BitVec 32) (_ BitVec 64))) (size!32316 (_ BitVec 32))) )
))
(declare-fun lt!463277 () array!66081)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048756 (= res!697888 (arrayContainsKey!0 lt!463277 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66081)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048756 (= lt!463277 (array!66082 (store (arr!31780 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32316 a!3488)))))

(declare-fun b!1048757 () Bool)

(declare-fun e!594900 () Bool)

(assert (=> b!1048757 (= e!594902 e!594900)))

(declare-fun res!697882 () Bool)

(assert (=> b!1048757 (=> (not res!697882) (not e!594900))))

(declare-fun lt!463278 () (_ BitVec 32))

(assert (=> b!1048757 (= res!697882 (not (= lt!463278 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66081 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048757 (= lt!463278 (arrayScanForKey!0 lt!463277 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048758 () Bool)

(assert (=> b!1048758 (= e!594900 (not true))))

(declare-fun e!594904 () Bool)

(assert (=> b!1048758 e!594904))

(declare-fun res!697884 () Bool)

(assert (=> b!1048758 (=> (not res!697884) (not e!594904))))

(assert (=> b!1048758 (= res!697884 (= (select (store (arr!31780 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463278) k!2747))))

(declare-fun b!1048759 () Bool)

(declare-fun res!697889 () Bool)

(assert (=> b!1048759 (=> (not res!697889) (not e!594899))))

(declare-datatypes ((List!22092 0))(
  ( (Nil!22089) (Cons!22088 (h!23297 (_ BitVec 64)) (t!31399 List!22092)) )
))
(declare-fun arrayNoDuplicates!0 (array!66081 (_ BitVec 32) List!22092) Bool)

(assert (=> b!1048759 (= res!697889 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22089))))

(declare-fun e!594903 () Bool)

(declare-fun b!1048760 () Bool)

(assert (=> b!1048760 (= e!594903 (arrayContainsKey!0 a!3488 k!2747 lt!463278))))

(declare-fun b!1048761 () Bool)

(declare-fun res!697885 () Bool)

(assert (=> b!1048761 (=> (not res!697885) (not e!594899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048761 (= res!697885 (validKeyInArray!0 k!2747))))

(declare-fun b!1048763 () Bool)

(declare-fun res!697887 () Bool)

(assert (=> b!1048763 (=> (not res!697887) (not e!594899))))

(assert (=> b!1048763 (= res!697887 (= (select (arr!31780 a!3488) i!1381) k!2747))))

(declare-fun res!697883 () Bool)

(assert (=> start!92280 (=> (not res!697883) (not e!594899))))

(assert (=> start!92280 (= res!697883 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32316 a!3488)) (bvslt (size!32316 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92280 e!594899))

(assert (=> start!92280 true))

(declare-fun array_inv!24560 (array!66081) Bool)

(assert (=> start!92280 (array_inv!24560 a!3488)))

(declare-fun b!1048762 () Bool)

(assert (=> b!1048762 (= e!594904 e!594903)))

(declare-fun res!697886 () Bool)

(assert (=> b!1048762 (=> res!697886 e!594903)))

(assert (=> b!1048762 (= res!697886 (bvsle lt!463278 i!1381))))

(assert (= (and start!92280 res!697883) b!1048759))

(assert (= (and b!1048759 res!697889) b!1048761))

(assert (= (and b!1048761 res!697885) b!1048763))

(assert (= (and b!1048763 res!697887) b!1048756))

(assert (= (and b!1048756 res!697888) b!1048757))

(assert (= (and b!1048757 res!697882) b!1048758))

(assert (= (and b!1048758 res!697884) b!1048762))

(assert (= (and b!1048762 (not res!697886)) b!1048760))

(declare-fun m!969647 () Bool)

(assert (=> b!1048756 m!969647))

(declare-fun m!969649 () Bool)

(assert (=> b!1048756 m!969649))

(declare-fun m!969651 () Bool)

(assert (=> b!1048760 m!969651))

(declare-fun m!969653 () Bool)

(assert (=> b!1048757 m!969653))

(assert (=> b!1048758 m!969649))

(declare-fun m!969655 () Bool)

(assert (=> b!1048758 m!969655))

(declare-fun m!969657 () Bool)

(assert (=> b!1048759 m!969657))

(declare-fun m!969659 () Bool)

(assert (=> start!92280 m!969659))

(declare-fun m!969661 () Bool)

(assert (=> b!1048761 m!969661))

(declare-fun m!969663 () Bool)

(assert (=> b!1048763 m!969663))

(push 1)

