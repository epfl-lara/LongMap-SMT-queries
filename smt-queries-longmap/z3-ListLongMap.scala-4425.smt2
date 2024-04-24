; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61332 () Bool)

(assert start!61332)

(declare-fun b!686711 () Bool)

(declare-fun res!451729 () Bool)

(declare-fun e!391067 () Bool)

(assert (=> b!686711 (=> (not res!451729) (not e!391067))))

(declare-fun e!391071 () Bool)

(assert (=> b!686711 (= res!451729 e!391071)))

(declare-fun res!451728 () Bool)

(assert (=> b!686711 (=> res!451728 e!391071)))

(declare-fun e!391070 () Bool)

(assert (=> b!686711 (= res!451728 e!391070)))

(declare-fun res!451736 () Bool)

(assert (=> b!686711 (=> (not res!451736) (not e!391070))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!686711 (= res!451736 (bvsgt from!3004 i!1382))))

(declare-fun b!686712 () Bool)

(declare-datatypes ((List!12948 0))(
  ( (Nil!12945) (Cons!12944 (h!13992 (_ BitVec 64)) (t!19195 List!12948)) )
))
(declare-fun acc!681 () List!12948)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3600 (List!12948 (_ BitVec 64)) Bool)

(assert (=> b!686712 (= e!391070 (contains!3600 acc!681 k0!2843))))

(declare-fun b!686713 () Bool)

(assert (=> b!686713 (= e!391067 (not true))))

(declare-datatypes ((array!39654 0))(
  ( (array!39655 (arr!19000 (Array (_ BitVec 32) (_ BitVec 64))) (size!19375 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39654)

(declare-fun lt!315168 () List!12948)

(declare-fun arrayNoDuplicates!0 (array!39654 (_ BitVec 32) List!12948) Bool)

(assert (=> b!686713 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315168)))

(declare-datatypes ((Unit!24171 0))(
  ( (Unit!24172) )
))
(declare-fun lt!315164 () Unit!24171)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39654 (_ BitVec 64) (_ BitVec 32) List!12948 List!12948) Unit!24171)

(assert (=> b!686713 (= lt!315164 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315168))))

(declare-fun -!173 (List!12948 (_ BitVec 64)) List!12948)

(assert (=> b!686713 (= (-!173 lt!315168 k0!2843) acc!681)))

(declare-fun $colon$colon!371 (List!12948 (_ BitVec 64)) List!12948)

(assert (=> b!686713 (= lt!315168 ($colon$colon!371 acc!681 k0!2843))))

(declare-fun lt!315170 () Unit!24171)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12948) Unit!24171)

(assert (=> b!686713 (= lt!315170 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!209 (List!12948 List!12948) Bool)

(assert (=> b!686713 (subseq!209 acc!681 acc!681)))

(declare-fun lt!315165 () Unit!24171)

(declare-fun lemmaListSubSeqRefl!0 (List!12948) Unit!24171)

(assert (=> b!686713 (= lt!315165 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686713 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315169 () Unit!24171)

(declare-fun e!391069 () Unit!24171)

(assert (=> b!686713 (= lt!315169 e!391069)))

(declare-fun c!77860 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686713 (= c!77860 (validKeyInArray!0 (select (arr!19000 a!3626) from!3004)))))

(declare-fun lt!315167 () Unit!24171)

(declare-fun e!391066 () Unit!24171)

(assert (=> b!686713 (= lt!315167 e!391066)))

(declare-fun c!77861 () Bool)

(declare-fun arrayContainsKey!0 (array!39654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686713 (= c!77861 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686713 (arrayContainsKey!0 (array!39655 (store (arr!19000 a!3626) i!1382 k0!2843) (size!19375 a!3626)) k0!2843 from!3004)))

(declare-fun b!686714 () Bool)

(declare-fun res!451738 () Bool)

(assert (=> b!686714 (=> (not res!451738) (not e!391067))))

(declare-fun noDuplicate!874 (List!12948) Bool)

(assert (=> b!686714 (= res!451738 (noDuplicate!874 acc!681))))

(declare-fun b!686715 () Bool)

(declare-fun res!451730 () Bool)

(assert (=> b!686715 (=> (not res!451730) (not e!391067))))

(assert (=> b!686715 (= res!451730 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686716 () Bool)

(declare-fun res!451740 () Bool)

(assert (=> b!686716 (=> (not res!451740) (not e!391067))))

(assert (=> b!686716 (= res!451740 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686717 () Bool)

(declare-fun res!451733 () Bool)

(assert (=> b!686717 (=> (not res!451733) (not e!391067))))

(assert (=> b!686717 (= res!451733 (not (contains!3600 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686718 () Bool)

(declare-fun res!451731 () Bool)

(assert (=> b!686718 (=> (not res!451731) (not e!391067))))

(assert (=> b!686718 (= res!451731 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19375 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686719 () Bool)

(declare-fun e!391065 () Bool)

(assert (=> b!686719 (= e!391071 e!391065)))

(declare-fun res!451732 () Bool)

(assert (=> b!686719 (=> (not res!451732) (not e!391065))))

(assert (=> b!686719 (= res!451732 (bvsle from!3004 i!1382))))

(declare-fun b!686720 () Bool)

(declare-fun Unit!24173 () Unit!24171)

(assert (=> b!686720 (= e!391069 Unit!24173)))

(declare-fun b!686721 () Bool)

(declare-fun lt!315166 () Unit!24171)

(assert (=> b!686721 (= e!391069 lt!315166)))

(declare-fun lt!315171 () Unit!24171)

(assert (=> b!686721 (= lt!315171 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686721 (subseq!209 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39654 List!12948 List!12948 (_ BitVec 32)) Unit!24171)

(assert (=> b!686721 (= lt!315166 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!371 acc!681 (select (arr!19000 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686721 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686722 () Bool)

(declare-fun Unit!24174 () Unit!24171)

(assert (=> b!686722 (= e!391066 Unit!24174)))

(declare-fun lt!315172 () Unit!24171)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39654 (_ BitVec 64) (_ BitVec 32)) Unit!24171)

(assert (=> b!686722 (= lt!315172 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!686722 false))

(declare-fun b!686723 () Bool)

(declare-fun res!451735 () Bool)

(assert (=> b!686723 (=> (not res!451735) (not e!391067))))

(assert (=> b!686723 (= res!451735 (validKeyInArray!0 k0!2843))))

(declare-fun b!686724 () Bool)

(declare-fun res!451741 () Bool)

(assert (=> b!686724 (=> (not res!451741) (not e!391067))))

(assert (=> b!686724 (= res!451741 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12945))))

(declare-fun b!686725 () Bool)

(declare-fun res!451737 () Bool)

(assert (=> b!686725 (=> (not res!451737) (not e!391067))))

(assert (=> b!686725 (= res!451737 (not (contains!3600 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686726 () Bool)

(declare-fun Unit!24175 () Unit!24171)

(assert (=> b!686726 (= e!391066 Unit!24175)))

(declare-fun res!451739 () Bool)

(assert (=> start!61332 (=> (not res!451739) (not e!391067))))

(assert (=> start!61332 (= res!451739 (and (bvslt (size!19375 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19375 a!3626))))))

(assert (=> start!61332 e!391067))

(assert (=> start!61332 true))

(declare-fun array_inv!14859 (array!39654) Bool)

(assert (=> start!61332 (array_inv!14859 a!3626)))

(declare-fun b!686727 () Bool)

(assert (=> b!686727 (= e!391065 (not (contains!3600 acc!681 k0!2843)))))

(declare-fun b!686728 () Bool)

(declare-fun res!451734 () Bool)

(assert (=> b!686728 (=> (not res!451734) (not e!391067))))

(assert (=> b!686728 (= res!451734 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19375 a!3626))))))

(assert (= (and start!61332 res!451739) b!686714))

(assert (= (and b!686714 res!451738) b!686717))

(assert (= (and b!686717 res!451733) b!686725))

(assert (= (and b!686725 res!451737) b!686711))

(assert (= (and b!686711 res!451736) b!686712))

(assert (= (and b!686711 (not res!451728)) b!686719))

(assert (= (and b!686719 res!451732) b!686727))

(assert (= (and b!686711 res!451729) b!686724))

(assert (= (and b!686724 res!451741) b!686715))

(assert (= (and b!686715 res!451730) b!686728))

(assert (= (and b!686728 res!451734) b!686723))

(assert (= (and b!686723 res!451735) b!686716))

(assert (= (and b!686716 res!451740) b!686718))

(assert (= (and b!686718 res!451731) b!686713))

(assert (= (and b!686713 c!77861) b!686722))

(assert (= (and b!686713 (not c!77861)) b!686726))

(assert (= (and b!686713 c!77860) b!686721))

(assert (= (and b!686713 (not c!77860)) b!686720))

(declare-fun m!651277 () Bool)

(assert (=> b!686715 m!651277))

(declare-fun m!651279 () Bool)

(assert (=> b!686725 m!651279))

(declare-fun m!651281 () Bool)

(assert (=> b!686723 m!651281))

(declare-fun m!651283 () Bool)

(assert (=> b!686722 m!651283))

(declare-fun m!651285 () Bool)

(assert (=> b!686714 m!651285))

(declare-fun m!651287 () Bool)

(assert (=> b!686717 m!651287))

(declare-fun m!651289 () Bool)

(assert (=> start!61332 m!651289))

(declare-fun m!651291 () Bool)

(assert (=> b!686721 m!651291))

(declare-fun m!651293 () Bool)

(assert (=> b!686721 m!651293))

(declare-fun m!651295 () Bool)

(assert (=> b!686721 m!651295))

(declare-fun m!651297 () Bool)

(assert (=> b!686721 m!651297))

(assert (=> b!686721 m!651293))

(assert (=> b!686721 m!651295))

(declare-fun m!651299 () Bool)

(assert (=> b!686721 m!651299))

(declare-fun m!651301 () Bool)

(assert (=> b!686721 m!651301))

(declare-fun m!651303 () Bool)

(assert (=> b!686713 m!651303))

(assert (=> b!686713 m!651291))

(assert (=> b!686713 m!651293))

(declare-fun m!651305 () Bool)

(assert (=> b!686713 m!651305))

(declare-fun m!651307 () Bool)

(assert (=> b!686713 m!651307))

(declare-fun m!651309 () Bool)

(assert (=> b!686713 m!651309))

(assert (=> b!686713 m!651299))

(declare-fun m!651311 () Bool)

(assert (=> b!686713 m!651311))

(declare-fun m!651313 () Bool)

(assert (=> b!686713 m!651313))

(assert (=> b!686713 m!651293))

(declare-fun m!651315 () Bool)

(assert (=> b!686713 m!651315))

(declare-fun m!651317 () Bool)

(assert (=> b!686713 m!651317))

(assert (=> b!686713 m!651301))

(declare-fun m!651319 () Bool)

(assert (=> b!686713 m!651319))

(declare-fun m!651321 () Bool)

(assert (=> b!686724 m!651321))

(declare-fun m!651323 () Bool)

(assert (=> b!686712 m!651323))

(declare-fun m!651325 () Bool)

(assert (=> b!686716 m!651325))

(assert (=> b!686727 m!651323))

(check-sat (not b!686717) (not b!686724) (not b!686715) (not b!686713) (not b!686723) (not b!686722) (not b!686727) (not b!686712) (not b!686725) (not b!686714) (not b!686721) (not start!61332) (not b!686716))
(check-sat)
