; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92350 () Bool)

(assert start!92350)

(declare-fun b!1049711 () Bool)

(declare-fun e!595610 () Bool)

(declare-fun e!595608 () Bool)

(assert (=> b!1049711 (= e!595610 e!595608)))

(declare-fun res!698922 () Bool)

(assert (=> b!1049711 (=> res!698922 e!595608)))

(declare-fun lt!463491 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049711 (= res!698922 (bvsle lt!463491 i!1381))))

(declare-fun b!1049712 () Bool)

(declare-fun res!698921 () Bool)

(declare-fun e!595609 () Bool)

(assert (=> b!1049712 (=> (not res!698921) (not e!595609))))

(declare-datatypes ((array!66092 0))(
  ( (array!66093 (arr!31785 (Array (_ BitVec 32) (_ BitVec 64))) (size!32323 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66092)

(declare-datatypes ((List!22156 0))(
  ( (Nil!22153) (Cons!22152 (h!23361 (_ BitVec 64)) (t!31454 List!22156)) )
))
(declare-fun arrayNoDuplicates!0 (array!66092 (_ BitVec 32) List!22156) Bool)

(assert (=> b!1049712 (= res!698921 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22153))))

(declare-fun b!1049713 () Bool)

(declare-fun e!595607 () Bool)

(assert (=> b!1049713 (= e!595607 true)))

(declare-fun lt!463492 () Bool)

(declare-fun contains!6094 (List!22156 (_ BitVec 64)) Bool)

(assert (=> b!1049713 (= lt!463492 (contains!6094 Nil!22153 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049714 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049714 (= e!595608 (arrayContainsKey!0 a!3488 k0!2747 lt!463491))))

(declare-fun b!1049715 () Bool)

(declare-fun e!595604 () Bool)

(declare-fun e!595606 () Bool)

(assert (=> b!1049715 (= e!595604 (not e!595606))))

(declare-fun res!698923 () Bool)

(assert (=> b!1049715 (=> res!698923 e!595606)))

(assert (=> b!1049715 (= res!698923 (bvsle lt!463491 i!1381))))

(assert (=> b!1049715 e!595610))

(declare-fun res!698932 () Bool)

(assert (=> b!1049715 (=> (not res!698932) (not e!595610))))

(assert (=> b!1049715 (= res!698932 (= (select (store (arr!31785 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463491) k0!2747))))

(declare-fun res!698928 () Bool)

(assert (=> start!92350 (=> (not res!698928) (not e!595609))))

(assert (=> start!92350 (= res!698928 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32323 a!3488)) (bvslt (size!32323 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92350 e!595609))

(assert (=> start!92350 true))

(declare-fun array_inv!24568 (array!66092) Bool)

(assert (=> start!92350 (array_inv!24568 a!3488)))

(declare-fun b!1049716 () Bool)

(declare-fun e!595605 () Bool)

(assert (=> b!1049716 (= e!595605 e!595604)))

(declare-fun res!698930 () Bool)

(assert (=> b!1049716 (=> (not res!698930) (not e!595604))))

(assert (=> b!1049716 (= res!698930 (not (= lt!463491 i!1381)))))

(declare-fun lt!463488 () array!66092)

(declare-fun arrayScanForKey!0 (array!66092 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049716 (= lt!463491 (arrayScanForKey!0 lt!463488 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049717 () Bool)

(assert (=> b!1049717 (= e!595609 e!595605)))

(declare-fun res!698929 () Bool)

(assert (=> b!1049717 (=> (not res!698929) (not e!595605))))

(assert (=> b!1049717 (= res!698929 (arrayContainsKey!0 lt!463488 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049717 (= lt!463488 (array!66093 (store (arr!31785 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32323 a!3488)))))

(declare-fun b!1049718 () Bool)

(declare-fun res!698927 () Bool)

(assert (=> b!1049718 (=> res!698927 e!595607)))

(assert (=> b!1049718 (= res!698927 (contains!6094 Nil!22153 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049719 () Bool)

(declare-fun res!698924 () Bool)

(assert (=> b!1049719 (=> (not res!698924) (not e!595609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049719 (= res!698924 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049720 () Bool)

(assert (=> b!1049720 (= e!595606 e!595607)))

(declare-fun res!698931 () Bool)

(assert (=> b!1049720 (=> res!698931 e!595607)))

(assert (=> b!1049720 (= res!698931 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32323 a!3488)))))

(assert (=> b!1049720 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34223 0))(
  ( (Unit!34224) )
))
(declare-fun lt!463489 () Unit!34223)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66092 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34223)

(assert (=> b!1049720 (= lt!463489 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463491 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1049720 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22153)))

(declare-fun lt!463490 () Unit!34223)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66092 (_ BitVec 32) (_ BitVec 32)) Unit!34223)

(assert (=> b!1049720 (= lt!463490 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049721 () Bool)

(declare-fun res!698925 () Bool)

(assert (=> b!1049721 (=> (not res!698925) (not e!595609))))

(assert (=> b!1049721 (= res!698925 (= (select (arr!31785 a!3488) i!1381) k0!2747))))

(declare-fun b!1049722 () Bool)

(declare-fun res!698926 () Bool)

(assert (=> b!1049722 (=> res!698926 e!595607)))

(declare-fun noDuplicate!1519 (List!22156) Bool)

(assert (=> b!1049722 (= res!698926 (not (noDuplicate!1519 Nil!22153)))))

(assert (= (and start!92350 res!698928) b!1049712))

(assert (= (and b!1049712 res!698921) b!1049719))

(assert (= (and b!1049719 res!698924) b!1049721))

(assert (= (and b!1049721 res!698925) b!1049717))

(assert (= (and b!1049717 res!698929) b!1049716))

(assert (= (and b!1049716 res!698930) b!1049715))

(assert (= (and b!1049715 res!698932) b!1049711))

(assert (= (and b!1049711 (not res!698922)) b!1049714))

(assert (= (and b!1049715 (not res!698923)) b!1049720))

(assert (= (and b!1049720 (not res!698931)) b!1049722))

(assert (= (and b!1049722 (not res!698926)) b!1049718))

(assert (= (and b!1049718 (not res!698927)) b!1049713))

(declare-fun m!969961 () Bool)

(assert (=> b!1049714 m!969961))

(declare-fun m!969963 () Bool)

(assert (=> b!1049718 m!969963))

(declare-fun m!969965 () Bool)

(assert (=> b!1049712 m!969965))

(declare-fun m!969967 () Bool)

(assert (=> b!1049720 m!969967))

(declare-fun m!969969 () Bool)

(assert (=> b!1049720 m!969969))

(declare-fun m!969971 () Bool)

(assert (=> b!1049720 m!969971))

(declare-fun m!969973 () Bool)

(assert (=> b!1049720 m!969973))

(declare-fun m!969975 () Bool)

(assert (=> start!92350 m!969975))

(declare-fun m!969977 () Bool)

(assert (=> b!1049715 m!969977))

(declare-fun m!969979 () Bool)

(assert (=> b!1049715 m!969979))

(declare-fun m!969981 () Bool)

(assert (=> b!1049722 m!969981))

(declare-fun m!969983 () Bool)

(assert (=> b!1049717 m!969983))

(assert (=> b!1049717 m!969977))

(declare-fun m!969985 () Bool)

(assert (=> b!1049713 m!969985))

(declare-fun m!969987 () Bool)

(assert (=> b!1049719 m!969987))

(declare-fun m!969989 () Bool)

(assert (=> b!1049716 m!969989))

(declare-fun m!969991 () Bool)

(assert (=> b!1049721 m!969991))

(check-sat (not b!1049717) (not b!1049720) (not b!1049712) (not start!92350) (not b!1049716) (not b!1049718) (not b!1049722) (not b!1049713) (not b!1049714) (not b!1049719))
(check-sat)
