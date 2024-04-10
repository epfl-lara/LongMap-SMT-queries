; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92538 () Bool)

(assert start!92538)

(declare-fun b!1052592 () Bool)

(declare-fun res!701725 () Bool)

(declare-fun e!597640 () Bool)

(assert (=> b!1052592 (=> (not res!701725) (not e!597640))))

(declare-datatypes ((array!66339 0))(
  ( (array!66340 (arr!31909 (Array (_ BitVec 32) (_ BitVec 64))) (size!32445 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66339)

(declare-datatypes ((List!22221 0))(
  ( (Nil!22218) (Cons!22217 (h!23426 (_ BitVec 64)) (t!31528 List!22221)) )
))
(declare-fun arrayNoDuplicates!0 (array!66339 (_ BitVec 32) List!22221) Bool)

(assert (=> b!1052592 (= res!701725 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22218))))

(declare-fun res!701724 () Bool)

(assert (=> start!92538 (=> (not res!701724) (not e!597640))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!92538 (= res!701724 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32445 a!3488)) (bvslt (size!32445 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92538 e!597640))

(assert (=> start!92538 true))

(declare-fun array_inv!24689 (array!66339) Bool)

(assert (=> start!92538 (array_inv!24689 a!3488)))

(declare-fun e!597642 () Bool)

(declare-fun b!1052593 () Bool)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052593 (= e!597642 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1052594 () Bool)

(declare-fun res!701723 () Bool)

(assert (=> b!1052594 (=> (not res!701723) (not e!597640))))

(assert (=> b!1052594 (= res!701723 (= (select (arr!31909 a!3488) i!1381) k!2747))))

(declare-fun b!1052595 () Bool)

(declare-fun e!597638 () Bool)

(assert (=> b!1052595 (= e!597638 e!597642)))

(declare-fun res!701721 () Bool)

(assert (=> b!1052595 (=> res!701721 e!597642)))

(declare-fun lt!464855 () (_ BitVec 32))

(assert (=> b!1052595 (= res!701721 (or (bvsgt lt!464855 i!1381) (bvsle i!1381 lt!464855)))))

(declare-fun b!1052596 () Bool)

(declare-fun e!597639 () Bool)

(assert (=> b!1052596 (= e!597640 e!597639)))

(declare-fun res!701726 () Bool)

(assert (=> b!1052596 (=> (not res!701726) (not e!597639))))

(declare-fun lt!464856 () array!66339)

(assert (=> b!1052596 (= res!701726 (arrayContainsKey!0 lt!464856 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052596 (= lt!464856 (array!66340 (store (arr!31909 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32445 a!3488)))))

(declare-fun b!1052597 () Bool)

(declare-fun e!597641 () Bool)

(assert (=> b!1052597 (= e!597641 true)))

(assert (=> b!1052597 (not (= (select (arr!31909 a!3488) lt!464855) k!2747))))

(declare-datatypes ((Unit!34490 0))(
  ( (Unit!34491) )
))
(declare-fun lt!464854 () Unit!34490)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66339 (_ BitVec 64) (_ BitVec 32) List!22221) Unit!34490)

(assert (=> b!1052597 (= lt!464854 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 lt!464855 Nil!22218))))

(declare-fun lt!464853 () (_ BitVec 32))

(assert (=> b!1052597 (arrayContainsKey!0 a!3488 k!2747 lt!464853)))

(declare-fun lt!464851 () Unit!34490)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66339 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34490)

(assert (=> b!1052597 (= lt!464851 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464853))))

(assert (=> b!1052597 (= lt!464853 (bvadd #b00000000000000000000000000000001 lt!464855))))

(assert (=> b!1052597 (arrayNoDuplicates!0 a!3488 lt!464855 Nil!22218)))

(declare-fun lt!464852 () Unit!34490)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66339 (_ BitVec 32) (_ BitVec 32)) Unit!34490)

(assert (=> b!1052597 (= lt!464852 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464855))))

(declare-fun b!1052598 () Bool)

(declare-fun e!597637 () Bool)

(assert (=> b!1052598 (= e!597639 e!597637)))

(declare-fun res!701720 () Bool)

(assert (=> b!1052598 (=> (not res!701720) (not e!597637))))

(assert (=> b!1052598 (= res!701720 (not (= lt!464855 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66339 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052598 (= lt!464855 (arrayScanForKey!0 lt!464856 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052599 () Bool)

(assert (=> b!1052599 (= e!597637 (not e!597641))))

(declare-fun res!701719 () Bool)

(assert (=> b!1052599 (=> res!701719 e!597641)))

(assert (=> b!1052599 (= res!701719 (or (bvsgt lt!464855 i!1381) (bvsle i!1381 lt!464855)))))

(assert (=> b!1052599 e!597638))

(declare-fun res!701718 () Bool)

(assert (=> b!1052599 (=> (not res!701718) (not e!597638))))

(assert (=> b!1052599 (= res!701718 (= (select (store (arr!31909 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464855) k!2747))))

(declare-fun b!1052600 () Bool)

(declare-fun res!701722 () Bool)

(assert (=> b!1052600 (=> (not res!701722) (not e!597640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052600 (= res!701722 (validKeyInArray!0 k!2747))))

(assert (= (and start!92538 res!701724) b!1052592))

(assert (= (and b!1052592 res!701725) b!1052600))

(assert (= (and b!1052600 res!701722) b!1052594))

(assert (= (and b!1052594 res!701723) b!1052596))

(assert (= (and b!1052596 res!701726) b!1052598))

(assert (= (and b!1052598 res!701720) b!1052599))

(assert (= (and b!1052599 res!701718) b!1052595))

(assert (= (and b!1052595 (not res!701721)) b!1052593))

(assert (= (and b!1052599 (not res!701719)) b!1052597))

(declare-fun m!972977 () Bool)

(assert (=> b!1052596 m!972977))

(declare-fun m!972979 () Bool)

(assert (=> b!1052596 m!972979))

(assert (=> b!1052599 m!972979))

(declare-fun m!972981 () Bool)

(assert (=> b!1052599 m!972981))

(declare-fun m!972983 () Bool)

(assert (=> b!1052600 m!972983))

(declare-fun m!972985 () Bool)

(assert (=> b!1052598 m!972985))

(declare-fun m!972987 () Bool)

(assert (=> b!1052597 m!972987))

(declare-fun m!972989 () Bool)

(assert (=> b!1052597 m!972989))

(declare-fun m!972991 () Bool)

(assert (=> b!1052597 m!972991))

(declare-fun m!972993 () Bool)

(assert (=> b!1052597 m!972993))

(declare-fun m!972995 () Bool)

(assert (=> b!1052597 m!972995))

(declare-fun m!972997 () Bool)

(assert (=> b!1052597 m!972997))

(declare-fun m!972999 () Bool)

(assert (=> start!92538 m!972999))

(declare-fun m!973001 () Bool)

(assert (=> b!1052592 m!973001))

(declare-fun m!973003 () Bool)

(assert (=> b!1052593 m!973003))

(declare-fun m!973005 () Bool)

(assert (=> b!1052594 m!973005))

(push 1)

