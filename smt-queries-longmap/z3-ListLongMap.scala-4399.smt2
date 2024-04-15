; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60482 () Bool)

(assert start!60482)

(declare-fun b!679586 () Bool)

(declare-fun res!446074 () Bool)

(declare-fun e!387120 () Bool)

(assert (=> b!679586 (=> (not res!446074) (not e!387120))))

(declare-datatypes ((array!39474 0))(
  ( (array!39475 (arr!18926 (Array (_ BitVec 32) (_ BitVec 64))) (size!19291 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39474)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13006 0))(
  ( (Nil!13003) (Cons!13002 (h!14047 (_ BitVec 64)) (t!19225 List!13006)) )
))
(declare-fun acc!681 () List!13006)

(declare-fun arrayNoDuplicates!0 (array!39474 (_ BitVec 32) List!13006) Bool)

(assert (=> b!679586 (= res!446074 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!446079 () Bool)

(assert (=> start!60482 (=> (not res!446079) (not e!387120))))

(assert (=> start!60482 (= res!446079 (and (bvslt (size!19291 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19291 a!3626))))))

(assert (=> start!60482 e!387120))

(assert (=> start!60482 true))

(declare-fun array_inv!14809 (array!39474) Bool)

(assert (=> start!60482 (array_inv!14809 a!3626)))

(declare-fun b!679587 () Bool)

(declare-fun res!446072 () Bool)

(assert (=> b!679587 (=> (not res!446072) (not e!387120))))

(declare-fun contains!3528 (List!13006 (_ BitVec 64)) Bool)

(assert (=> b!679587 (= res!446072 (not (contains!3528 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679588 () Bool)

(declare-fun res!446080 () Bool)

(assert (=> b!679588 (=> (not res!446080) (not e!387120))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679588 (= res!446080 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19291 a!3626))))))

(declare-fun b!679589 () Bool)

(declare-fun res!446071 () Bool)

(assert (=> b!679589 (=> (not res!446071) (not e!387120))))

(assert (=> b!679589 (= res!446071 (not (contains!3528 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679590 () Bool)

(declare-fun e!387117 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!679590 (= e!387117 (not (contains!3528 acc!681 k0!2843)))))

(declare-fun b!679591 () Bool)

(declare-fun res!446070 () Bool)

(assert (=> b!679591 (=> (not res!446070) (not e!387120))))

(assert (=> b!679591 (= res!446070 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19291 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679592 () Bool)

(declare-fun e!387122 () Bool)

(assert (=> b!679592 (= e!387122 e!387117)))

(declare-fun res!446078 () Bool)

(assert (=> b!679592 (=> (not res!446078) (not e!387117))))

(assert (=> b!679592 (= res!446078 (bvsle from!3004 i!1382))))

(declare-fun b!679593 () Bool)

(declare-datatypes ((Unit!23804 0))(
  ( (Unit!23805) )
))
(declare-fun e!387121 () Unit!23804)

(declare-fun Unit!23806 () Unit!23804)

(assert (=> b!679593 (= e!387121 Unit!23806)))

(declare-fun lt!312730 () Unit!23804)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39474 (_ BitVec 64) (_ BitVec 32)) Unit!23804)

(assert (=> b!679593 (= lt!312730 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!679593 false))

(declare-fun b!679594 () Bool)

(declare-fun res!446075 () Bool)

(assert (=> b!679594 (=> (not res!446075) (not e!387120))))

(assert (=> b!679594 (= res!446075 e!387122)))

(declare-fun res!446069 () Bool)

(assert (=> b!679594 (=> res!446069 e!387122)))

(declare-fun e!387119 () Bool)

(assert (=> b!679594 (= res!446069 e!387119)))

(declare-fun res!446073 () Bool)

(assert (=> b!679594 (=> (not res!446073) (not e!387119))))

(assert (=> b!679594 (= res!446073 (bvsgt from!3004 i!1382))))

(declare-fun b!679595 () Bool)

(declare-fun Unit!23807 () Unit!23804)

(assert (=> b!679595 (= e!387121 Unit!23807)))

(declare-fun b!679596 () Bool)

(declare-fun res!446066 () Bool)

(assert (=> b!679596 (=> (not res!446066) (not e!387120))))

(assert (=> b!679596 (= res!446066 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13003))))

(declare-fun b!679597 () Bool)

(declare-fun e!387118 () Bool)

(assert (=> b!679597 (= e!387120 (not e!387118))))

(declare-fun res!446077 () Bool)

(assert (=> b!679597 (=> res!446077 e!387118)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679597 (= res!446077 (not (validKeyInArray!0 (select (arr!18926 a!3626) from!3004))))))

(declare-fun lt!312732 () Unit!23804)

(assert (=> b!679597 (= lt!312732 e!387121)))

(declare-fun c!77127 () Bool)

(declare-fun arrayContainsKey!0 (array!39474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679597 (= c!77127 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!679597 (arrayContainsKey!0 (array!39475 (store (arr!18926 a!3626) i!1382 k0!2843) (size!19291 a!3626)) k0!2843 from!3004)))

(declare-fun b!679598 () Bool)

(declare-fun res!446076 () Bool)

(assert (=> b!679598 (=> (not res!446076) (not e!387120))))

(declare-fun noDuplicate!797 (List!13006) Bool)

(assert (=> b!679598 (= res!446076 (noDuplicate!797 acc!681))))

(declare-fun b!679599 () Bool)

(declare-fun res!446068 () Bool)

(assert (=> b!679599 (=> (not res!446068) (not e!387120))))

(assert (=> b!679599 (= res!446068 (validKeyInArray!0 k0!2843))))

(declare-fun b!679600 () Bool)

(assert (=> b!679600 (= e!387118 true)))

(declare-fun subseq!131 (List!13006 List!13006) Bool)

(assert (=> b!679600 (subseq!131 acc!681 acc!681)))

(declare-fun lt!312731 () Unit!23804)

(declare-fun lemmaListSubSeqRefl!0 (List!13006) Unit!23804)

(assert (=> b!679600 (= lt!312731 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!679601 () Bool)

(assert (=> b!679601 (= e!387119 (contains!3528 acc!681 k0!2843))))

(declare-fun b!679602 () Bool)

(declare-fun res!446067 () Bool)

(assert (=> b!679602 (=> (not res!446067) (not e!387120))))

(assert (=> b!679602 (= res!446067 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60482 res!446079) b!679598))

(assert (= (and b!679598 res!446076) b!679589))

(assert (= (and b!679589 res!446071) b!679587))

(assert (= (and b!679587 res!446072) b!679594))

(assert (= (and b!679594 res!446073) b!679601))

(assert (= (and b!679594 (not res!446069)) b!679592))

(assert (= (and b!679592 res!446078) b!679590))

(assert (= (and b!679594 res!446075) b!679596))

(assert (= (and b!679596 res!446066) b!679586))

(assert (= (and b!679586 res!446074) b!679588))

(assert (= (and b!679588 res!446080) b!679599))

(assert (= (and b!679599 res!446068) b!679602))

(assert (= (and b!679602 res!446067) b!679591))

(assert (= (and b!679591 res!446070) b!679597))

(assert (= (and b!679597 c!77127) b!679593))

(assert (= (and b!679597 (not c!77127)) b!679595))

(assert (= (and b!679597 (not res!446077)) b!679600))

(declare-fun m!644337 () Bool)

(assert (=> b!679589 m!644337))

(declare-fun m!644339 () Bool)

(assert (=> b!679598 m!644339))

(declare-fun m!644341 () Bool)

(assert (=> b!679600 m!644341))

(declare-fun m!644343 () Bool)

(assert (=> b!679600 m!644343))

(declare-fun m!644345 () Bool)

(assert (=> start!60482 m!644345))

(declare-fun m!644347 () Bool)

(assert (=> b!679586 m!644347))

(declare-fun m!644349 () Bool)

(assert (=> b!679602 m!644349))

(declare-fun m!644351 () Bool)

(assert (=> b!679596 m!644351))

(declare-fun m!644353 () Bool)

(assert (=> b!679593 m!644353))

(declare-fun m!644355 () Bool)

(assert (=> b!679599 m!644355))

(declare-fun m!644357 () Bool)

(assert (=> b!679597 m!644357))

(declare-fun m!644359 () Bool)

(assert (=> b!679597 m!644359))

(declare-fun m!644361 () Bool)

(assert (=> b!679597 m!644361))

(assert (=> b!679597 m!644357))

(declare-fun m!644363 () Bool)

(assert (=> b!679597 m!644363))

(declare-fun m!644365 () Bool)

(assert (=> b!679597 m!644365))

(declare-fun m!644367 () Bool)

(assert (=> b!679587 m!644367))

(declare-fun m!644369 () Bool)

(assert (=> b!679590 m!644369))

(assert (=> b!679601 m!644369))

(check-sat (not b!679586) (not b!679601) (not b!679589) (not b!679590) (not b!679599) (not b!679602) (not b!679598) (not b!679600) (not b!679593) (not b!679596) (not b!679597) (not start!60482) (not b!679587))
(check-sat)
