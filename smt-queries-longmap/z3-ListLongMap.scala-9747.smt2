; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115468 () Bool)

(assert start!115468)

(declare-fun b!1365809 () Bool)

(declare-fun res!909400 () Bool)

(declare-fun e!774293 () Bool)

(assert (=> b!1365809 (=> (not res!909400) (not e!774293))))

(declare-datatypes ((array!92789 0))(
  ( (array!92790 (arr!44823 (Array (_ BitVec 32) (_ BitVec 64))) (size!45373 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92789)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!31891 0))(
  ( (Nil!31888) (Cons!31887 (h!33096 (_ BitVec 64)) (t!46585 List!31891)) )
))
(declare-fun acc!866 () List!31891)

(declare-fun contains!9573 (List!31891 (_ BitVec 64)) Bool)

(assert (=> b!1365809 (= res!909400 (not (contains!9573 acc!866 (select (arr!44823 a!3861) from!3239))))))

(declare-fun b!1365810 () Bool)

(declare-fun res!909383 () Bool)

(declare-fun e!774295 () Bool)

(assert (=> b!1365810 (=> (not res!909383) (not e!774295))))

(declare-fun lt!601389 () List!31891)

(assert (=> b!1365810 (= res!909383 (not (contains!9573 lt!601389 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365811 () Bool)

(declare-fun res!909394 () Bool)

(declare-fun e!774294 () Bool)

(assert (=> b!1365811 (=> (not res!909394) (not e!774294))))

(assert (=> b!1365811 (= res!909394 (not (contains!9573 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365813 () Bool)

(declare-fun res!909396 () Bool)

(assert (=> b!1365813 (=> (not res!909396) (not e!774295))))

(declare-fun lt!601391 () List!31891)

(assert (=> b!1365813 (= res!909396 (not (contains!9573 lt!601391 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365814 () Bool)

(declare-fun res!909398 () Bool)

(assert (=> b!1365814 (=> (not res!909398) (not e!774294))))

(declare-fun noDuplicate!2430 (List!31891) Bool)

(assert (=> b!1365814 (= res!909398 (noDuplicate!2430 acc!866))))

(declare-fun b!1365815 () Bool)

(declare-fun res!909385 () Bool)

(assert (=> b!1365815 (=> (not res!909385) (not e!774295))))

(assert (=> b!1365815 (= res!909385 (not (contains!9573 lt!601391 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365816 () Bool)

(declare-fun res!909387 () Bool)

(assert (=> b!1365816 (=> (not res!909387) (not e!774295))))

(assert (=> b!1365816 (= res!909387 (noDuplicate!2430 lt!601391))))

(declare-fun b!1365817 () Bool)

(assert (=> b!1365817 (= e!774295 false)))

(declare-fun lt!601392 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92789 (_ BitVec 32) List!31891) Bool)

(assert (=> b!1365817 (= lt!601392 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601391))))

(declare-datatypes ((Unit!45083 0))(
  ( (Unit!45084) )
))
(declare-fun lt!601390 () Unit!45083)

(declare-fun noDuplicateSubseq!162 (List!31891 List!31891) Unit!45083)

(assert (=> b!1365817 (= lt!601390 (noDuplicateSubseq!162 lt!601389 lt!601391))))

(declare-fun b!1365818 () Bool)

(declare-fun res!909386 () Bool)

(assert (=> b!1365818 (=> (not res!909386) (not e!774294))))

(declare-fun newAcc!98 () List!31891)

(assert (=> b!1365818 (= res!909386 (not (contains!9573 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365819 () Bool)

(declare-fun res!909391 () Bool)

(assert (=> b!1365819 (=> (not res!909391) (not e!774293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365819 (= res!909391 (validKeyInArray!0 (select (arr!44823 a!3861) from!3239)))))

(declare-fun b!1365820 () Bool)

(declare-fun res!909399 () Bool)

(assert (=> b!1365820 (=> (not res!909399) (not e!774295))))

(assert (=> b!1365820 (= res!909399 (not (contains!9573 lt!601389 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365821 () Bool)

(assert (=> b!1365821 (= e!774293 e!774295)))

(declare-fun res!909389 () Bool)

(assert (=> b!1365821 (=> (not res!909389) (not e!774295))))

(assert (=> b!1365821 (= res!909389 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1365821 (= lt!601389 (Cons!31887 (select (arr!44823 a!3861) from!3239) newAcc!98))))

(assert (=> b!1365821 (= lt!601391 (Cons!31887 (select (arr!44823 a!3861) from!3239) acc!866))))

(declare-fun b!1365822 () Bool)

(declare-fun res!909384 () Bool)

(assert (=> b!1365822 (=> (not res!909384) (not e!774294))))

(assert (=> b!1365822 (= res!909384 (not (contains!9573 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365823 () Bool)

(declare-fun res!909397 () Bool)

(assert (=> b!1365823 (=> (not res!909397) (not e!774293))))

(assert (=> b!1365823 (= res!909397 (bvslt from!3239 (size!45373 a!3861)))))

(declare-fun b!1365824 () Bool)

(declare-fun res!909388 () Bool)

(assert (=> b!1365824 (=> (not res!909388) (not e!774294))))

(declare-fun subseq!975 (List!31891 List!31891) Bool)

(assert (=> b!1365824 (= res!909388 (subseq!975 newAcc!98 acc!866))))

(declare-fun b!1365812 () Bool)

(assert (=> b!1365812 (= e!774294 e!774293)))

(declare-fun res!909393 () Bool)

(assert (=> b!1365812 (=> (not res!909393) (not e!774293))))

(assert (=> b!1365812 (= res!909393 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601393 () Unit!45083)

(assert (=> b!1365812 (= lt!601393 (noDuplicateSubseq!162 newAcc!98 acc!866))))

(declare-fun res!909390 () Bool)

(assert (=> start!115468 (=> (not res!909390) (not e!774294))))

(assert (=> start!115468 (= res!909390 (and (bvslt (size!45373 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45373 a!3861))))))

(assert (=> start!115468 e!774294))

(declare-fun array_inv!33851 (array!92789) Bool)

(assert (=> start!115468 (array_inv!33851 a!3861)))

(assert (=> start!115468 true))

(declare-fun b!1365825 () Bool)

(declare-fun res!909395 () Bool)

(assert (=> b!1365825 (=> (not res!909395) (not e!774295))))

(assert (=> b!1365825 (= res!909395 (subseq!975 lt!601389 lt!601391))))

(declare-fun b!1365826 () Bool)

(declare-fun res!909392 () Bool)

(assert (=> b!1365826 (=> (not res!909392) (not e!774294))))

(assert (=> b!1365826 (= res!909392 (not (contains!9573 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115468 res!909390) b!1365814))

(assert (= (and b!1365814 res!909398) b!1365811))

(assert (= (and b!1365811 res!909394) b!1365822))

(assert (= (and b!1365822 res!909384) b!1365818))

(assert (= (and b!1365818 res!909386) b!1365826))

(assert (= (and b!1365826 res!909392) b!1365824))

(assert (= (and b!1365824 res!909388) b!1365812))

(assert (= (and b!1365812 res!909393) b!1365823))

(assert (= (and b!1365823 res!909397) b!1365819))

(assert (= (and b!1365819 res!909391) b!1365809))

(assert (= (and b!1365809 res!909400) b!1365821))

(assert (= (and b!1365821 res!909389) b!1365816))

(assert (= (and b!1365816 res!909387) b!1365813))

(assert (= (and b!1365813 res!909396) b!1365815))

(assert (= (and b!1365815 res!909385) b!1365820))

(assert (= (and b!1365820 res!909399) b!1365810))

(assert (= (and b!1365810 res!909383) b!1365825))

(assert (= (and b!1365825 res!909395) b!1365817))

(declare-fun m!1250261 () Bool)

(assert (=> b!1365812 m!1250261))

(declare-fun m!1250263 () Bool)

(assert (=> b!1365812 m!1250263))

(declare-fun m!1250265 () Bool)

(assert (=> b!1365826 m!1250265))

(declare-fun m!1250267 () Bool)

(assert (=> b!1365821 m!1250267))

(declare-fun m!1250269 () Bool)

(assert (=> b!1365810 m!1250269))

(assert (=> b!1365819 m!1250267))

(assert (=> b!1365819 m!1250267))

(declare-fun m!1250271 () Bool)

(assert (=> b!1365819 m!1250271))

(declare-fun m!1250273 () Bool)

(assert (=> b!1365816 m!1250273))

(declare-fun m!1250275 () Bool)

(assert (=> b!1365824 m!1250275))

(declare-fun m!1250277 () Bool)

(assert (=> b!1365817 m!1250277))

(declare-fun m!1250279 () Bool)

(assert (=> b!1365817 m!1250279))

(declare-fun m!1250281 () Bool)

(assert (=> b!1365815 m!1250281))

(declare-fun m!1250283 () Bool)

(assert (=> b!1365813 m!1250283))

(declare-fun m!1250285 () Bool)

(assert (=> b!1365825 m!1250285))

(declare-fun m!1250287 () Bool)

(assert (=> start!115468 m!1250287))

(declare-fun m!1250289 () Bool)

(assert (=> b!1365814 m!1250289))

(declare-fun m!1250291 () Bool)

(assert (=> b!1365818 m!1250291))

(declare-fun m!1250293 () Bool)

(assert (=> b!1365820 m!1250293))

(declare-fun m!1250295 () Bool)

(assert (=> b!1365811 m!1250295))

(assert (=> b!1365809 m!1250267))

(assert (=> b!1365809 m!1250267))

(declare-fun m!1250297 () Bool)

(assert (=> b!1365809 m!1250297))

(declare-fun m!1250299 () Bool)

(assert (=> b!1365822 m!1250299))

(check-sat (not b!1365812) (not b!1365825) (not b!1365811) (not b!1365815) (not b!1365820) (not b!1365818) (not b!1365809) (not b!1365816) (not b!1365822) (not b!1365810) (not b!1365813) (not b!1365819) (not b!1365817) (not b!1365814) (not b!1365824) (not b!1365826) (not start!115468))
(check-sat)
