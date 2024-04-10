; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93064 () Bool)

(assert start!93064)

(declare-fun b!1055865 () Bool)

(declare-fun e!600159 () Bool)

(declare-fun e!600160 () Bool)

(assert (=> b!1055865 (= e!600159 e!600160)))

(declare-fun res!704685 () Bool)

(assert (=> b!1055865 (=> res!704685 e!600160)))

(declare-fun lt!465954 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055865 (= res!704685 (bvsle lt!465954 i!1381))))

(declare-fun res!704679 () Bool)

(declare-fun e!600163 () Bool)

(assert (=> start!93064 (=> (not res!704679) (not e!600163))))

(declare-datatypes ((array!66589 0))(
  ( (array!66590 (arr!32022 (Array (_ BitVec 32) (_ BitVec 64))) (size!32558 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66589)

(assert (=> start!93064 (= res!704679 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32558 a!3488)) (bvslt (size!32558 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93064 e!600163))

(assert (=> start!93064 true))

(declare-fun array_inv!24802 (array!66589) Bool)

(assert (=> start!93064 (array_inv!24802 a!3488)))

(declare-fun b!1055866 () Bool)

(declare-fun e!600161 () Bool)

(declare-fun e!600157 () Bool)

(assert (=> b!1055866 (= e!600161 e!600157)))

(declare-fun res!704684 () Bool)

(assert (=> b!1055866 (=> (not res!704684) (not e!600157))))

(assert (=> b!1055866 (= res!704684 (not (= lt!465954 i!1381)))))

(declare-fun lt!465953 () array!66589)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66589 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055866 (= lt!465954 (arrayScanForKey!0 lt!465953 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055867 () Bool)

(assert (=> b!1055867 (= e!600163 e!600161)))

(declare-fun res!704682 () Bool)

(assert (=> b!1055867 (=> (not res!704682) (not e!600161))))

(declare-fun arrayContainsKey!0 (array!66589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055867 (= res!704682 (arrayContainsKey!0 lt!465953 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055867 (= lt!465953 (array!66590 (store (arr!32022 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32558 a!3488)))))

(declare-fun b!1055868 () Bool)

(declare-fun res!704686 () Bool)

(assert (=> b!1055868 (=> (not res!704686) (not e!600163))))

(declare-datatypes ((List!22334 0))(
  ( (Nil!22331) (Cons!22330 (h!23539 (_ BitVec 64)) (t!31641 List!22334)) )
))
(declare-fun arrayNoDuplicates!0 (array!66589 (_ BitVec 32) List!22334) Bool)

(assert (=> b!1055868 (= res!704686 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22331))))

(declare-fun b!1055869 () Bool)

(assert (=> b!1055869 (= e!600160 (arrayContainsKey!0 a!3488 k!2747 lt!465954))))

(declare-fun b!1055870 () Bool)

(declare-fun e!600158 () Bool)

(assert (=> b!1055870 (= e!600157 (not e!600158))))

(declare-fun res!704680 () Bool)

(assert (=> b!1055870 (=> res!704680 e!600158)))

(assert (=> b!1055870 (= res!704680 (bvsle lt!465954 i!1381))))

(assert (=> b!1055870 e!600159))

(declare-fun res!704681 () Bool)

(assert (=> b!1055870 (=> (not res!704681) (not e!600159))))

(assert (=> b!1055870 (= res!704681 (= (select (store (arr!32022 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465954) k!2747))))

(declare-fun b!1055871 () Bool)

(assert (=> b!1055871 (= e!600158 true)))

(assert (=> b!1055871 false))

(declare-datatypes ((Unit!34602 0))(
  ( (Unit!34603) )
))
(declare-fun lt!465956 () Unit!34602)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66589 (_ BitVec 64) (_ BitVec 32) List!22334) Unit!34602)

(assert (=> b!1055871 (= lt!465956 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 i!1381 Nil!22331))))

(assert (=> b!1055871 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465955 () Unit!34602)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66589 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34602)

(assert (=> b!1055871 (= lt!465955 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465954 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1055871 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22331)))

(declare-fun lt!465957 () Unit!34602)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66589 (_ BitVec 32) (_ BitVec 32)) Unit!34602)

(assert (=> b!1055871 (= lt!465957 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055872 () Bool)

(declare-fun res!704683 () Bool)

(assert (=> b!1055872 (=> (not res!704683) (not e!600163))))

(assert (=> b!1055872 (= res!704683 (= (select (arr!32022 a!3488) i!1381) k!2747))))

(declare-fun b!1055873 () Bool)

(declare-fun res!704687 () Bool)

(assert (=> b!1055873 (=> (not res!704687) (not e!600163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055873 (= res!704687 (validKeyInArray!0 k!2747))))

(assert (= (and start!93064 res!704679) b!1055868))

(assert (= (and b!1055868 res!704686) b!1055873))

(assert (= (and b!1055873 res!704687) b!1055872))

(assert (= (and b!1055872 res!704683) b!1055867))

(assert (= (and b!1055867 res!704682) b!1055866))

(assert (= (and b!1055866 res!704684) b!1055870))

(assert (= (and b!1055870 res!704681) b!1055865))

(assert (= (and b!1055865 (not res!704685)) b!1055869))

(assert (= (and b!1055870 (not res!704680)) b!1055871))

(declare-fun m!975841 () Bool)

(assert (=> b!1055866 m!975841))

(declare-fun m!975843 () Bool)

(assert (=> start!93064 m!975843))

(declare-fun m!975845 () Bool)

(assert (=> b!1055873 m!975845))

(declare-fun m!975847 () Bool)

(assert (=> b!1055869 m!975847))

(declare-fun m!975849 () Bool)

(assert (=> b!1055868 m!975849))

(declare-fun m!975851 () Bool)

(assert (=> b!1055870 m!975851))

(declare-fun m!975853 () Bool)

(assert (=> b!1055870 m!975853))

(declare-fun m!975855 () Bool)

(assert (=> b!1055872 m!975855))

(declare-fun m!975857 () Bool)

(assert (=> b!1055871 m!975857))

(declare-fun m!975859 () Bool)

(assert (=> b!1055871 m!975859))

(declare-fun m!975861 () Bool)

(assert (=> b!1055871 m!975861))

(declare-fun m!975863 () Bool)

(assert (=> b!1055871 m!975863))

(declare-fun m!975865 () Bool)

(assert (=> b!1055871 m!975865))

(declare-fun m!975867 () Bool)

(assert (=> b!1055867 m!975867))

(assert (=> b!1055867 m!975851))

(push 1)

(assert (not b!1055866))

