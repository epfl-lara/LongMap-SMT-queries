; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60482 () Bool)

(assert start!60482)

(declare-fun b!679583 () Bool)

(declare-fun res!445942 () Bool)

(declare-fun e!387191 () Bool)

(assert (=> b!679583 (=> (not res!445942) (not e!387191))))

(declare-datatypes ((List!12962 0))(
  ( (Nil!12959) (Cons!12958 (h!14003 (_ BitVec 64)) (t!19190 List!12962)) )
))
(declare-fun acc!681 () List!12962)

(declare-fun contains!3539 (List!12962 (_ BitVec 64)) Bool)

(assert (=> b!679583 (= res!445942 (not (contains!3539 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679584 () Bool)

(declare-fun res!445951 () Bool)

(assert (=> b!679584 (=> (not res!445951) (not e!387191))))

(assert (=> b!679584 (= res!445951 (not (contains!3539 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679585 () Bool)

(declare-fun res!445948 () Bool)

(assert (=> b!679585 (=> (not res!445948) (not e!387191))))

(declare-datatypes ((array!39463 0))(
  ( (array!39464 (arr!18921 (Array (_ BitVec 32) (_ BitVec 64))) (size!19285 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39463)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39463 (_ BitVec 32) List!12962) Bool)

(assert (=> b!679585 (= res!445948 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679586 () Bool)

(declare-datatypes ((Unit!23802 0))(
  ( (Unit!23803) )
))
(declare-fun e!387189 () Unit!23802)

(declare-fun Unit!23804 () Unit!23802)

(assert (=> b!679586 (= e!387189 Unit!23804)))

(declare-fun lt!312940 () Unit!23802)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39463 (_ BitVec 64) (_ BitVec 32)) Unit!23802)

(assert (=> b!679586 (= lt!312940 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!679586 false))

(declare-fun res!445952 () Bool)

(assert (=> start!60482 (=> (not res!445952) (not e!387191))))

(assert (=> start!60482 (= res!445952 (and (bvslt (size!19285 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19285 a!3626))))))

(assert (=> start!60482 e!387191))

(assert (=> start!60482 true))

(declare-fun array_inv!14717 (array!39463) Bool)

(assert (=> start!60482 (array_inv!14717 a!3626)))

(declare-fun b!679587 () Bool)

(assert (=> b!679587 (= e!387191 (not true))))

(declare-fun lt!312939 () Unit!23802)

(assert (=> b!679587 (= lt!312939 e!387189)))

(declare-fun c!77189 () Bool)

(declare-fun arrayContainsKey!0 (array!39463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679587 (= c!77189 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679587 (arrayContainsKey!0 (array!39464 (store (arr!18921 a!3626) i!1382 k!2843) (size!19285 a!3626)) k!2843 from!3004)))

(declare-fun b!679588 () Bool)

(declare-fun res!445944 () Bool)

(assert (=> b!679588 (=> (not res!445944) (not e!387191))))

(declare-fun noDuplicate!786 (List!12962) Bool)

(assert (=> b!679588 (= res!445944 (noDuplicate!786 acc!681))))

(declare-fun b!679589 () Bool)

(declare-fun e!387190 () Bool)

(assert (=> b!679589 (= e!387190 (contains!3539 acc!681 k!2843))))

(declare-fun b!679590 () Bool)

(declare-fun res!445945 () Bool)

(assert (=> b!679590 (=> (not res!445945) (not e!387191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679590 (= res!445945 (validKeyInArray!0 k!2843))))

(declare-fun b!679591 () Bool)

(declare-fun e!387192 () Bool)

(assert (=> b!679591 (= e!387192 (not (contains!3539 acc!681 k!2843)))))

(declare-fun b!679592 () Bool)

(declare-fun res!445941 () Bool)

(assert (=> b!679592 (=> (not res!445941) (not e!387191))))

(assert (=> b!679592 (= res!445941 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12959))))

(declare-fun b!679593 () Bool)

(declare-fun e!387187 () Bool)

(assert (=> b!679593 (= e!387187 e!387192)))

(declare-fun res!445949 () Bool)

(assert (=> b!679593 (=> (not res!445949) (not e!387192))))

(assert (=> b!679593 (= res!445949 (bvsle from!3004 i!1382))))

(declare-fun b!679594 () Bool)

(declare-fun res!445940 () Bool)

(assert (=> b!679594 (=> (not res!445940) (not e!387191))))

(assert (=> b!679594 (= res!445940 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19285 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679595 () Bool)

(declare-fun res!445947 () Bool)

(assert (=> b!679595 (=> (not res!445947) (not e!387191))))

(assert (=> b!679595 (= res!445947 e!387187)))

(declare-fun res!445943 () Bool)

(assert (=> b!679595 (=> res!445943 e!387187)))

(assert (=> b!679595 (= res!445943 e!387190)))

(declare-fun res!445939 () Bool)

(assert (=> b!679595 (=> (not res!445939) (not e!387190))))

(assert (=> b!679595 (= res!445939 (bvsgt from!3004 i!1382))))

(declare-fun b!679596 () Bool)

(declare-fun res!445946 () Bool)

(assert (=> b!679596 (=> (not res!445946) (not e!387191))))

(assert (=> b!679596 (= res!445946 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19285 a!3626))))))

(declare-fun b!679597 () Bool)

(declare-fun Unit!23805 () Unit!23802)

(assert (=> b!679597 (= e!387189 Unit!23805)))

(declare-fun b!679598 () Bool)

(declare-fun res!445950 () Bool)

(assert (=> b!679598 (=> (not res!445950) (not e!387191))))

(assert (=> b!679598 (= res!445950 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60482 res!445952) b!679588))

(assert (= (and b!679588 res!445944) b!679584))

(assert (= (and b!679584 res!445951) b!679583))

(assert (= (and b!679583 res!445942) b!679595))

(assert (= (and b!679595 res!445939) b!679589))

(assert (= (and b!679595 (not res!445943)) b!679593))

(assert (= (and b!679593 res!445949) b!679591))

(assert (= (and b!679595 res!445947) b!679592))

(assert (= (and b!679592 res!445941) b!679585))

(assert (= (and b!679585 res!445948) b!679596))

(assert (= (and b!679596 res!445946) b!679590))

(assert (= (and b!679590 res!445945) b!679598))

(assert (= (and b!679598 res!445950) b!679594))

(assert (= (and b!679594 res!445940) b!679587))

(assert (= (and b!679587 c!77189) b!679586))

(assert (= (and b!679587 (not c!77189)) b!679597))

(declare-fun m!644939 () Bool)

(assert (=> b!679585 m!644939))

(declare-fun m!644941 () Bool)

(assert (=> b!679591 m!644941))

(declare-fun m!644943 () Bool)

(assert (=> start!60482 m!644943))

(declare-fun m!644945 () Bool)

(assert (=> b!679592 m!644945))

(declare-fun m!644947 () Bool)

(assert (=> b!679590 m!644947))

(declare-fun m!644949 () Bool)

(assert (=> b!679588 m!644949))

(declare-fun m!644951 () Bool)

(assert (=> b!679586 m!644951))

(declare-fun m!644953 () Bool)

(assert (=> b!679584 m!644953))

(declare-fun m!644955 () Bool)

(assert (=> b!679598 m!644955))

(declare-fun m!644957 () Bool)

(assert (=> b!679587 m!644957))

(declare-fun m!644959 () Bool)

(assert (=> b!679587 m!644959))

(declare-fun m!644961 () Bool)

(assert (=> b!679587 m!644961))

(assert (=> b!679589 m!644941))

(declare-fun m!644963 () Bool)

(assert (=> b!679583 m!644963))

(push 1)

(assert (not b!679583))

(assert (not b!679592))

(assert (not start!60482))

(assert (not b!679588))

(assert (not b!679598))

(assert (not b!679584))

(assert (not b!679589))

(assert (not b!679591))

(assert (not b!679586))

(assert (not b!679585))

(assert (not b!679587))

(assert (not b!679590))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

