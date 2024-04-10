; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60978 () Bool)

(assert start!60978)

(declare-fun b!683744 () Bool)

(declare-fun res!449445 () Bool)

(declare-fun e!389503 () Bool)

(assert (=> b!683744 (=> (not res!449445) (not e!389503))))

(declare-datatypes ((array!39587 0))(
  ( (array!39588 (arr!18974 (Array (_ BitVec 32) (_ BitVec 64))) (size!19341 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39587)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13015 0))(
  ( (Nil!13012) (Cons!13011 (h!14056 (_ BitVec 64)) (t!19261 List!13015)) )
))
(declare-fun acc!681 () List!13015)

(declare-fun arrayNoDuplicates!0 (array!39587 (_ BitVec 32) List!13015) Bool)

(assert (=> b!683744 (= res!449445 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683745 () Bool)

(declare-fun e!389505 () Bool)

(assert (=> b!683745 (= e!389505 true)))

(declare-fun lt!314009 () Bool)

(declare-fun lt!314007 () List!13015)

(declare-fun noDuplicate!839 (List!13015) Bool)

(assert (=> b!683745 (= lt!314009 (noDuplicate!839 lt!314007))))

(declare-fun b!683746 () Bool)

(declare-fun res!449442 () Bool)

(assert (=> b!683746 (=> (not res!449442) (not e!389503))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683746 (= res!449442 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683747 () Bool)

(declare-datatypes ((Unit!24037 0))(
  ( (Unit!24038) )
))
(declare-fun e!389507 () Unit!24037)

(declare-fun lt!314012 () Unit!24037)

(assert (=> b!683747 (= e!389507 lt!314012)))

(declare-fun lt!314013 () Unit!24037)

(declare-fun lemmaListSubSeqRefl!0 (List!13015) Unit!24037)

(assert (=> b!683747 (= lt!314013 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!178 (List!13015 List!13015) Bool)

(assert (=> b!683747 (subseq!178 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39587 List!13015 List!13015 (_ BitVec 32)) Unit!24037)

(declare-fun $colon$colon!343 (List!13015 (_ BitVec 64)) List!13015)

(assert (=> b!683747 (= lt!314012 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!343 acc!681 (select (arr!18974 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683747 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683748 () Bool)

(declare-fun e!389506 () Bool)

(declare-fun e!389504 () Bool)

(assert (=> b!683748 (= e!389506 e!389504)))

(declare-fun res!449444 () Bool)

(assert (=> b!683748 (=> (not res!449444) (not e!389504))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683748 (= res!449444 (bvsle from!3004 i!1382))))

(declare-fun b!683749 () Bool)

(declare-fun res!449451 () Bool)

(assert (=> b!683749 (=> (not res!449451) (not e!389503))))

(assert (=> b!683749 (= res!449451 e!389506)))

(declare-fun res!449455 () Bool)

(assert (=> b!683749 (=> res!449455 e!389506)))

(declare-fun e!389508 () Bool)

(assert (=> b!683749 (= res!449455 e!389508)))

(declare-fun res!449450 () Bool)

(assert (=> b!683749 (=> (not res!449450) (not e!389508))))

(assert (=> b!683749 (= res!449450 (bvsgt from!3004 i!1382))))

(declare-fun b!683750 () Bool)

(declare-fun e!389502 () Unit!24037)

(declare-fun Unit!24039 () Unit!24037)

(assert (=> b!683750 (= e!389502 Unit!24039)))

(declare-fun b!683751 () Bool)

(declare-fun res!449452 () Bool)

(assert (=> b!683751 (=> (not res!449452) (not e!389503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683751 (= res!449452 (validKeyInArray!0 k!2843))))

(declare-fun res!449443 () Bool)

(assert (=> start!60978 (=> (not res!449443) (not e!389503))))

(assert (=> start!60978 (= res!449443 (and (bvslt (size!19341 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19341 a!3626))))))

(assert (=> start!60978 e!389503))

(assert (=> start!60978 true))

(declare-fun array_inv!14770 (array!39587) Bool)

(assert (=> start!60978 (array_inv!14770 a!3626)))

(declare-fun b!683752 () Bool)

(declare-fun res!449456 () Bool)

(assert (=> b!683752 (=> (not res!449456) (not e!389503))))

(assert (=> b!683752 (= res!449456 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19341 a!3626))))))

(declare-fun b!683753 () Bool)

(declare-fun Unit!24040 () Unit!24037)

(assert (=> b!683753 (= e!389507 Unit!24040)))

(declare-fun b!683754 () Bool)

(declare-fun contains!3592 (List!13015 (_ BitVec 64)) Bool)

(assert (=> b!683754 (= e!389504 (not (contains!3592 acc!681 k!2843)))))

(declare-fun b!683755 () Bool)

(assert (=> b!683755 (= e!389503 (not e!389505))))

(declare-fun res!449453 () Bool)

(assert (=> b!683755 (=> res!449453 e!389505)))

(assert (=> b!683755 (= res!449453 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!143 (List!13015 (_ BitVec 64)) List!13015)

(assert (=> b!683755 (= (-!143 lt!314007 k!2843) acc!681)))

(assert (=> b!683755 (= lt!314007 ($colon$colon!343 acc!681 k!2843))))

(declare-fun lt!314010 () Unit!24037)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13015) Unit!24037)

(assert (=> b!683755 (= lt!314010 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!683755 (subseq!178 acc!681 acc!681)))

(declare-fun lt!314011 () Unit!24037)

(assert (=> b!683755 (= lt!314011 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683755 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314008 () Unit!24037)

(assert (=> b!683755 (= lt!314008 e!389507)))

(declare-fun c!77519 () Bool)

(assert (=> b!683755 (= c!77519 (validKeyInArray!0 (select (arr!18974 a!3626) from!3004)))))

(declare-fun lt!314014 () Unit!24037)

(assert (=> b!683755 (= lt!314014 e!389502)))

(declare-fun c!77518 () Bool)

(assert (=> b!683755 (= c!77518 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683755 (arrayContainsKey!0 (array!39588 (store (arr!18974 a!3626) i!1382 k!2843) (size!19341 a!3626)) k!2843 from!3004)))

(declare-fun b!683756 () Bool)

(declare-fun res!449448 () Bool)

(assert (=> b!683756 (=> (not res!449448) (not e!389503))))

(assert (=> b!683756 (= res!449448 (not (contains!3592 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683757 () Bool)

(declare-fun res!449454 () Bool)

(assert (=> b!683757 (=> (not res!449454) (not e!389503))))

(assert (=> b!683757 (= res!449454 (noDuplicate!839 acc!681))))

(declare-fun b!683758 () Bool)

(declare-fun res!449446 () Bool)

(assert (=> b!683758 (=> (not res!449446) (not e!389503))))

(assert (=> b!683758 (= res!449446 (not (contains!3592 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683759 () Bool)

(assert (=> b!683759 (= e!389508 (contains!3592 acc!681 k!2843))))

(declare-fun b!683760 () Bool)

(declare-fun Unit!24041 () Unit!24037)

(assert (=> b!683760 (= e!389502 Unit!24041)))

(declare-fun lt!314006 () Unit!24037)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39587 (_ BitVec 64) (_ BitVec 32)) Unit!24037)

(assert (=> b!683760 (= lt!314006 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!683760 false))

(declare-fun b!683761 () Bool)

(declare-fun res!449449 () Bool)

(assert (=> b!683761 (=> (not res!449449) (not e!389503))))

(assert (=> b!683761 (= res!449449 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19341 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683762 () Bool)

(declare-fun res!449447 () Bool)

(assert (=> b!683762 (=> (not res!449447) (not e!389503))))

(assert (=> b!683762 (= res!449447 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13012))))

(assert (= (and start!60978 res!449443) b!683757))

(assert (= (and b!683757 res!449454) b!683758))

(assert (= (and b!683758 res!449446) b!683756))

(assert (= (and b!683756 res!449448) b!683749))

(assert (= (and b!683749 res!449450) b!683759))

(assert (= (and b!683749 (not res!449455)) b!683748))

(assert (= (and b!683748 res!449444) b!683754))

(assert (= (and b!683749 res!449451) b!683762))

(assert (= (and b!683762 res!449447) b!683744))

(assert (= (and b!683744 res!449445) b!683752))

(assert (= (and b!683752 res!449456) b!683751))

(assert (= (and b!683751 res!449452) b!683746))

(assert (= (and b!683746 res!449442) b!683761))

(assert (= (and b!683761 res!449449) b!683755))

(assert (= (and b!683755 c!77518) b!683760))

(assert (= (and b!683755 (not c!77518)) b!683750))

(assert (= (and b!683755 c!77519) b!683747))

(assert (= (and b!683755 (not c!77519)) b!683753))

(assert (= (and b!683755 (not res!449453)) b!683745))

(declare-fun m!648257 () Bool)

(assert (=> b!683744 m!648257))

(declare-fun m!648259 () Bool)

(assert (=> start!60978 m!648259))

(declare-fun m!648261 () Bool)

(assert (=> b!683757 m!648261))

(declare-fun m!648263 () Bool)

(assert (=> b!683746 m!648263))

(declare-fun m!648265 () Bool)

(assert (=> b!683745 m!648265))

(declare-fun m!648267 () Bool)

(assert (=> b!683751 m!648267))

(declare-fun m!648269 () Bool)

(assert (=> b!683747 m!648269))

(declare-fun m!648271 () Bool)

(assert (=> b!683747 m!648271))

(declare-fun m!648273 () Bool)

(assert (=> b!683747 m!648273))

(declare-fun m!648275 () Bool)

(assert (=> b!683747 m!648275))

(assert (=> b!683747 m!648271))

(assert (=> b!683747 m!648273))

(declare-fun m!648277 () Bool)

(assert (=> b!683747 m!648277))

(declare-fun m!648279 () Bool)

(assert (=> b!683747 m!648279))

(declare-fun m!648281 () Bool)

(assert (=> b!683758 m!648281))

(declare-fun m!648283 () Bool)

(assert (=> b!683760 m!648283))

(declare-fun m!648285 () Bool)

(assert (=> b!683762 m!648285))

(declare-fun m!648287 () Bool)

(assert (=> b!683754 m!648287))

(declare-fun m!648289 () Bool)

(assert (=> b!683755 m!648289))

(assert (=> b!683755 m!648269))

(assert (=> b!683755 m!648271))

(declare-fun m!648291 () Bool)

(assert (=> b!683755 m!648291))

(declare-fun m!648293 () Bool)

(assert (=> b!683755 m!648293))

(assert (=> b!683755 m!648277))

(declare-fun m!648295 () Bool)

(assert (=> b!683755 m!648295))

(declare-fun m!648297 () Bool)

(assert (=> b!683755 m!648297))

(assert (=> b!683755 m!648271))

(declare-fun m!648299 () Bool)

(assert (=> b!683755 m!648299))

(declare-fun m!648301 () Bool)

(assert (=> b!683755 m!648301))

(assert (=> b!683755 m!648279))

(assert (=> b!683759 m!648287))

(declare-fun m!648303 () Bool)

(assert (=> b!683756 m!648303))

(push 1)

(assert (not b!683757))

(assert (not b!683745))

(assert (not b!683747))

(assert (not b!683759))

(assert (not b!683754))

(assert (not b!683762))

(assert (not start!60978))

(assert (not b!683755))

(assert (not b!683744))

(assert (not b!683760))

(assert (not b!683756))

(assert (not b!683751))

(assert (not b!683746))

(assert (not b!683758))

(check-sat)

(pop 1)

