; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93054 () Bool)

(assert start!93054)

(declare-fun res!704547 () Bool)

(declare-fun e!600056 () Bool)

(assert (=> start!93054 (=> (not res!704547) (not e!600056))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66579 0))(
  ( (array!66580 (arr!32017 (Array (_ BitVec 32) (_ BitVec 64))) (size!32553 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66579)

(assert (=> start!93054 (= res!704547 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32553 a!3488)) (bvslt (size!32553 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93054 e!600056))

(assert (=> start!93054 true))

(declare-fun array_inv!24797 (array!66579) Bool)

(assert (=> start!93054 (array_inv!24797 a!3488)))

(declare-fun b!1055730 () Bool)

(declare-fun e!600054 () Bool)

(declare-fun e!600053 () Bool)

(assert (=> b!1055730 (= e!600054 e!600053)))

(declare-fun res!704545 () Bool)

(assert (=> b!1055730 (=> (not res!704545) (not e!600053))))

(declare-fun lt!465882 () (_ BitVec 32))

(assert (=> b!1055730 (= res!704545 (not (= lt!465882 i!1381)))))

(declare-fun lt!465880 () array!66579)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66579 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055730 (= lt!465882 (arrayScanForKey!0 lt!465880 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055731 () Bool)

(declare-fun res!704551 () Bool)

(assert (=> b!1055731 (=> (not res!704551) (not e!600056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055731 (= res!704551 (validKeyInArray!0 k!2747))))

(declare-fun b!1055732 () Bool)

(declare-fun res!704549 () Bool)

(assert (=> b!1055732 (=> (not res!704549) (not e!600056))))

(assert (=> b!1055732 (= res!704549 (= (select (arr!32017 a!3488) i!1381) k!2747))))

(declare-fun b!1055733 () Bool)

(assert (=> b!1055733 (= e!600056 e!600054)))

(declare-fun res!704548 () Bool)

(assert (=> b!1055733 (=> (not res!704548) (not e!600054))))

(declare-fun arrayContainsKey!0 (array!66579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055733 (= res!704548 (arrayContainsKey!0 lt!465880 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055733 (= lt!465880 (array!66580 (store (arr!32017 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32553 a!3488)))))

(declare-fun e!600055 () Bool)

(declare-fun b!1055734 () Bool)

(assert (=> b!1055734 (= e!600055 (arrayContainsKey!0 a!3488 k!2747 lt!465882))))

(declare-fun b!1055735 () Bool)

(declare-fun e!600052 () Bool)

(assert (=> b!1055735 (= e!600052 e!600055)))

(declare-fun res!704550 () Bool)

(assert (=> b!1055735 (=> res!704550 e!600055)))

(assert (=> b!1055735 (= res!704550 (bvsle lt!465882 i!1381))))

(declare-fun b!1055736 () Bool)

(declare-fun e!600058 () Bool)

(assert (=> b!1055736 (= e!600053 (not e!600058))))

(declare-fun res!704546 () Bool)

(assert (=> b!1055736 (=> res!704546 e!600058)))

(assert (=> b!1055736 (= res!704546 (bvsle lt!465882 i!1381))))

(assert (=> b!1055736 e!600052))

(declare-fun res!704544 () Bool)

(assert (=> b!1055736 (=> (not res!704544) (not e!600052))))

(assert (=> b!1055736 (= res!704544 (= (select (store (arr!32017 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465882) k!2747))))

(declare-fun b!1055737 () Bool)

(declare-fun res!704552 () Bool)

(assert (=> b!1055737 (=> (not res!704552) (not e!600056))))

(declare-datatypes ((List!22329 0))(
  ( (Nil!22326) (Cons!22325 (h!23534 (_ BitVec 64)) (t!31636 List!22329)) )
))
(declare-fun arrayNoDuplicates!0 (array!66579 (_ BitVec 32) List!22329) Bool)

(assert (=> b!1055737 (= res!704552 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22326))))

(declare-fun b!1055738 () Bool)

(assert (=> b!1055738 (= e!600058 true)))

(assert (=> b!1055738 false))

(declare-datatypes ((Unit!34592 0))(
  ( (Unit!34593) )
))
(declare-fun lt!465878 () Unit!34592)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66579 (_ BitVec 64) (_ BitVec 32) List!22329) Unit!34592)

(assert (=> b!1055738 (= lt!465878 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 i!1381 Nil!22326))))

(assert (=> b!1055738 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465879 () Unit!34592)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66579 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34592)

(assert (=> b!1055738 (= lt!465879 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465882 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1055738 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22326)))

(declare-fun lt!465881 () Unit!34592)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66579 (_ BitVec 32) (_ BitVec 32)) Unit!34592)

(assert (=> b!1055738 (= lt!465881 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!93054 res!704547) b!1055737))

(assert (= (and b!1055737 res!704552) b!1055731))

(assert (= (and b!1055731 res!704551) b!1055732))

(assert (= (and b!1055732 res!704549) b!1055733))

(assert (= (and b!1055733 res!704548) b!1055730))

(assert (= (and b!1055730 res!704545) b!1055736))

(assert (= (and b!1055736 res!704544) b!1055735))

(assert (= (and b!1055735 (not res!704550)) b!1055734))

(assert (= (and b!1055736 (not res!704546)) b!1055738))

(declare-fun m!975701 () Bool)

(assert (=> b!1055738 m!975701))

(declare-fun m!975703 () Bool)

(assert (=> b!1055738 m!975703))

(declare-fun m!975705 () Bool)

(assert (=> b!1055738 m!975705))

(declare-fun m!975707 () Bool)

(assert (=> b!1055738 m!975707))

(declare-fun m!975709 () Bool)

(assert (=> b!1055738 m!975709))

(declare-fun m!975711 () Bool)

(assert (=> b!1055737 m!975711))

(declare-fun m!975713 () Bool)

(assert (=> start!93054 m!975713))

(declare-fun m!975715 () Bool)

(assert (=> b!1055736 m!975715))

(declare-fun m!975717 () Bool)

(assert (=> b!1055736 m!975717))

(declare-fun m!975719 () Bool)

(assert (=> b!1055730 m!975719))

(declare-fun m!975721 () Bool)

(assert (=> b!1055731 m!975721))

(declare-fun m!975723 () Bool)

(assert (=> b!1055734 m!975723))

(declare-fun m!975725 () Bool)

(assert (=> b!1055733 m!975725))

(assert (=> b!1055733 m!975715))

(declare-fun m!975727 () Bool)

(assert (=> b!1055732 m!975727))

(push 1)

