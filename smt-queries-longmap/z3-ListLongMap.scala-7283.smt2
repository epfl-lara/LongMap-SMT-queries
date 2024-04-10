; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93062 () Bool)

(assert start!93062)

(declare-fun b!1055838 () Bool)

(declare-fun e!600142 () Bool)

(declare-fun e!600140 () Bool)

(assert (=> b!1055838 (= e!600142 e!600140)))

(declare-fun res!704655 () Bool)

(assert (=> b!1055838 (=> (not res!704655) (not e!600140))))

(declare-datatypes ((array!66587 0))(
  ( (array!66588 (arr!32021 (Array (_ BitVec 32) (_ BitVec 64))) (size!32557 (_ BitVec 32))) )
))
(declare-fun lt!465941 () array!66587)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055838 (= res!704655 (arrayContainsKey!0 lt!465941 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66587)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055838 (= lt!465941 (array!66588 (store (arr!32021 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32557 a!3488)))))

(declare-fun e!600138 () Bool)

(declare-fun b!1055839 () Bool)

(declare-fun lt!465942 () (_ BitVec 32))

(assert (=> b!1055839 (= e!600138 (arrayContainsKey!0 a!3488 k0!2747 lt!465942))))

(declare-fun b!1055840 () Bool)

(declare-fun e!600137 () Bool)

(assert (=> b!1055840 (= e!600137 e!600138)))

(declare-fun res!704659 () Bool)

(assert (=> b!1055840 (=> res!704659 e!600138)))

(assert (=> b!1055840 (= res!704659 (bvsle lt!465942 i!1381))))

(declare-fun b!1055841 () Bool)

(declare-fun e!600141 () Bool)

(assert (=> b!1055841 (= e!600141 true)))

(assert (=> b!1055841 false))

(declare-datatypes ((Unit!34600 0))(
  ( (Unit!34601) )
))
(declare-fun lt!465938 () Unit!34600)

(declare-datatypes ((List!22333 0))(
  ( (Nil!22330) (Cons!22329 (h!23538 (_ BitVec 64)) (t!31640 List!22333)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66587 (_ BitVec 64) (_ BitVec 32) List!22333) Unit!34600)

(assert (=> b!1055841 (= lt!465938 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22330))))

(assert (=> b!1055841 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465940 () Unit!34600)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66587 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34600)

(assert (=> b!1055841 (= lt!465940 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465942 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66587 (_ BitVec 32) List!22333) Bool)

(assert (=> b!1055841 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22330)))

(declare-fun lt!465939 () Unit!34600)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66587 (_ BitVec 32) (_ BitVec 32)) Unit!34600)

(assert (=> b!1055841 (= lt!465939 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055842 () Bool)

(declare-fun res!704652 () Bool)

(assert (=> b!1055842 (=> (not res!704652) (not e!600142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055842 (= res!704652 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055843 () Bool)

(declare-fun e!600139 () Bool)

(assert (=> b!1055843 (= e!600139 (not e!600141))))

(declare-fun res!704658 () Bool)

(assert (=> b!1055843 (=> res!704658 e!600141)))

(assert (=> b!1055843 (= res!704658 (bvsle lt!465942 i!1381))))

(assert (=> b!1055843 e!600137))

(declare-fun res!704660 () Bool)

(assert (=> b!1055843 (=> (not res!704660) (not e!600137))))

(assert (=> b!1055843 (= res!704660 (= (select (store (arr!32021 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465942) k0!2747))))

(declare-fun res!704653 () Bool)

(assert (=> start!93062 (=> (not res!704653) (not e!600142))))

(assert (=> start!93062 (= res!704653 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32557 a!3488)) (bvslt (size!32557 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93062 e!600142))

(assert (=> start!93062 true))

(declare-fun array_inv!24801 (array!66587) Bool)

(assert (=> start!93062 (array_inv!24801 a!3488)))

(declare-fun b!1055844 () Bool)

(assert (=> b!1055844 (= e!600140 e!600139)))

(declare-fun res!704657 () Bool)

(assert (=> b!1055844 (=> (not res!704657) (not e!600139))))

(assert (=> b!1055844 (= res!704657 (not (= lt!465942 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66587 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055844 (= lt!465942 (arrayScanForKey!0 lt!465941 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055845 () Bool)

(declare-fun res!704654 () Bool)

(assert (=> b!1055845 (=> (not res!704654) (not e!600142))))

(assert (=> b!1055845 (= res!704654 (= (select (arr!32021 a!3488) i!1381) k0!2747))))

(declare-fun b!1055846 () Bool)

(declare-fun res!704656 () Bool)

(assert (=> b!1055846 (=> (not res!704656) (not e!600142))))

(assert (=> b!1055846 (= res!704656 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22330))))

(assert (= (and start!93062 res!704653) b!1055846))

(assert (= (and b!1055846 res!704656) b!1055842))

(assert (= (and b!1055842 res!704652) b!1055845))

(assert (= (and b!1055845 res!704654) b!1055838))

(assert (= (and b!1055838 res!704655) b!1055844))

(assert (= (and b!1055844 res!704657) b!1055843))

(assert (= (and b!1055843 res!704660) b!1055840))

(assert (= (and b!1055840 (not res!704659)) b!1055839))

(assert (= (and b!1055843 (not res!704658)) b!1055841))

(declare-fun m!975813 () Bool)

(assert (=> b!1055842 m!975813))

(declare-fun m!975815 () Bool)

(assert (=> b!1055844 m!975815))

(declare-fun m!975817 () Bool)

(assert (=> b!1055845 m!975817))

(declare-fun m!975819 () Bool)

(assert (=> start!93062 m!975819))

(declare-fun m!975821 () Bool)

(assert (=> b!1055841 m!975821))

(declare-fun m!975823 () Bool)

(assert (=> b!1055841 m!975823))

(declare-fun m!975825 () Bool)

(assert (=> b!1055841 m!975825))

(declare-fun m!975827 () Bool)

(assert (=> b!1055841 m!975827))

(declare-fun m!975829 () Bool)

(assert (=> b!1055841 m!975829))

(declare-fun m!975831 () Bool)

(assert (=> b!1055843 m!975831))

(declare-fun m!975833 () Bool)

(assert (=> b!1055843 m!975833))

(declare-fun m!975835 () Bool)

(assert (=> b!1055838 m!975835))

(assert (=> b!1055838 m!975831))

(declare-fun m!975837 () Bool)

(assert (=> b!1055839 m!975837))

(declare-fun m!975839 () Bool)

(assert (=> b!1055846 m!975839))

(check-sat (not start!93062) (not b!1055839) (not b!1055844) (not b!1055846) (not b!1055842) (not b!1055838) (not b!1055841))
(check-sat)
