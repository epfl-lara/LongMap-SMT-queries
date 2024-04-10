; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60328 () Bool)

(assert start!60328)

(declare-fun b!677706 () Bool)

(declare-fun res!444150 () Bool)

(declare-fun e!386282 () Bool)

(assert (=> b!677706 (=> (not res!444150) (not e!386282))))

(declare-datatypes ((array!39375 0))(
  ( (array!39376 (arr!18880 (Array (_ BitVec 32) (_ BitVec 64))) (size!19244 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39375)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12921 0))(
  ( (Nil!12918) (Cons!12917 (h!13962 (_ BitVec 64)) (t!19149 List!12921)) )
))
(declare-fun acc!681 () List!12921)

(declare-fun arrayNoDuplicates!0 (array!39375 (_ BitVec 32) List!12921) Bool)

(assert (=> b!677706 (= res!444150 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677707 () Bool)

(declare-fun res!444133 () Bool)

(assert (=> b!677707 (=> (not res!444133) (not e!386282))))

(declare-fun contains!3498 (List!12921 (_ BitVec 64)) Bool)

(assert (=> b!677707 (= res!444133 (not (contains!3498 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677708 () Bool)

(declare-fun e!386285 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!677708 (= e!386285 (not (contains!3498 acc!681 k0!2843)))))

(declare-fun b!677709 () Bool)

(declare-fun res!444135 () Bool)

(assert (=> b!677709 (=> (not res!444135) (not e!386282))))

(declare-fun e!386279 () Bool)

(assert (=> b!677709 (= res!444135 e!386279)))

(declare-fun res!444149 () Bool)

(assert (=> b!677709 (=> res!444149 e!386279)))

(declare-fun e!386284 () Bool)

(assert (=> b!677709 (= res!444149 e!386284)))

(declare-fun res!444140 () Bool)

(assert (=> b!677709 (=> (not res!444140) (not e!386284))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677709 (= res!444140 (bvsgt from!3004 i!1382))))

(declare-fun b!677710 () Bool)

(declare-fun res!444141 () Bool)

(assert (=> b!677710 (=> (not res!444141) (not e!386282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677710 (= res!444141 (not (validKeyInArray!0 (select (arr!18880 a!3626) from!3004))))))

(declare-fun res!444146 () Bool)

(assert (=> start!60328 (=> (not res!444146) (not e!386282))))

(assert (=> start!60328 (= res!444146 (and (bvslt (size!19244 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19244 a!3626))))))

(assert (=> start!60328 e!386282))

(assert (=> start!60328 true))

(declare-fun array_inv!14676 (array!39375) Bool)

(assert (=> start!60328 (array_inv!14676 a!3626)))

(declare-fun b!677711 () Bool)

(declare-fun e!386286 () Bool)

(assert (=> b!677711 (= e!386286 e!386285)))

(declare-fun res!444137 () Bool)

(assert (=> b!677711 (=> (not res!444137) (not e!386285))))

(assert (=> b!677711 (= res!444137 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677712 () Bool)

(declare-fun e!386280 () Bool)

(assert (=> b!677712 (= e!386279 e!386280)))

(declare-fun res!444151 () Bool)

(assert (=> b!677712 (=> (not res!444151) (not e!386280))))

(assert (=> b!677712 (= res!444151 (bvsle from!3004 i!1382))))

(declare-fun b!677713 () Bool)

(declare-fun res!444152 () Bool)

(assert (=> b!677713 (=> (not res!444152) (not e!386282))))

(assert (=> b!677713 (= res!444152 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19244 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677714 () Bool)

(declare-fun res!444136 () Bool)

(assert (=> b!677714 (=> (not res!444136) (not e!386282))))

(assert (=> b!677714 (= res!444136 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12918))))

(declare-fun b!677715 () Bool)

(declare-fun res!444134 () Bool)

(assert (=> b!677715 (=> (not res!444134) (not e!386282))))

(assert (=> b!677715 (= res!444134 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677716 () Bool)

(declare-fun res!444142 () Bool)

(assert (=> b!677716 (=> (not res!444142) (not e!386282))))

(assert (=> b!677716 (= res!444142 (validKeyInArray!0 k0!2843))))

(declare-fun b!677717 () Bool)

(declare-fun res!444147 () Bool)

(assert (=> b!677717 (=> (not res!444147) (not e!386282))))

(assert (=> b!677717 (= res!444147 e!386286)))

(declare-fun res!444145 () Bool)

(assert (=> b!677717 (=> res!444145 e!386286)))

(declare-fun e!386283 () Bool)

(assert (=> b!677717 (= res!444145 e!386283)))

(declare-fun res!444132 () Bool)

(assert (=> b!677717 (=> (not res!444132) (not e!386283))))

(assert (=> b!677717 (= res!444132 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677718 () Bool)

(assert (=> b!677718 (= e!386280 (not (contains!3498 acc!681 k0!2843)))))

(declare-fun b!677719 () Bool)

(declare-fun res!444148 () Bool)

(assert (=> b!677719 (=> (not res!444148) (not e!386282))))

(declare-fun arrayContainsKey!0 (array!39375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677719 (= res!444148 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677720 () Bool)

(declare-fun res!444143 () Bool)

(assert (=> b!677720 (=> (not res!444143) (not e!386282))))

(assert (=> b!677720 (= res!444143 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19244 a!3626))))))

(declare-fun b!677721 () Bool)

(declare-fun res!444144 () Bool)

(assert (=> b!677721 (=> (not res!444144) (not e!386282))))

(declare-fun noDuplicate!745 (List!12921) Bool)

(assert (=> b!677721 (= res!444144 (noDuplicate!745 acc!681))))

(declare-fun b!677722 () Bool)

(declare-fun res!444138 () Bool)

(assert (=> b!677722 (=> (not res!444138) (not e!386282))))

(assert (=> b!677722 (= res!444138 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677723 () Bool)

(assert (=> b!677723 (= e!386284 (contains!3498 acc!681 k0!2843))))

(declare-fun b!677724 () Bool)

(assert (=> b!677724 (= e!386282 (not true))))

(assert (=> b!677724 (arrayNoDuplicates!0 (array!39376 (store (arr!18880 a!3626) i!1382 k0!2843) (size!19244 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23780 0))(
  ( (Unit!23781) )
))
(declare-fun lt!312838 () Unit!23780)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39375 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12921) Unit!23780)

(assert (=> b!677724 (= lt!312838 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677725 () Bool)

(assert (=> b!677725 (= e!386283 (contains!3498 acc!681 k0!2843))))

(declare-fun b!677726 () Bool)

(declare-fun res!444139 () Bool)

(assert (=> b!677726 (=> (not res!444139) (not e!386282))))

(assert (=> b!677726 (= res!444139 (not (contains!3498 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60328 res!444146) b!677721))

(assert (= (and b!677721 res!444144) b!677726))

(assert (= (and b!677726 res!444139) b!677707))

(assert (= (and b!677707 res!444133) b!677709))

(assert (= (and b!677709 res!444140) b!677723))

(assert (= (and b!677709 (not res!444149)) b!677712))

(assert (= (and b!677712 res!444151) b!677718))

(assert (= (and b!677709 res!444135) b!677714))

(assert (= (and b!677714 res!444136) b!677706))

(assert (= (and b!677706 res!444150) b!677720))

(assert (= (and b!677720 res!444143) b!677716))

(assert (= (and b!677716 res!444142) b!677719))

(assert (= (and b!677719 res!444148) b!677713))

(assert (= (and b!677713 res!444152) b!677710))

(assert (= (and b!677710 res!444141) b!677715))

(assert (= (and b!677715 res!444134) b!677717))

(assert (= (and b!677717 res!444132) b!677725))

(assert (= (and b!677717 (not res!444145)) b!677711))

(assert (= (and b!677711 res!444137) b!677708))

(assert (= (and b!677717 res!444147) b!677722))

(assert (= (and b!677722 res!444138) b!677724))

(declare-fun m!643847 () Bool)

(assert (=> b!677725 m!643847))

(assert (=> b!677708 m!643847))

(declare-fun m!643849 () Bool)

(assert (=> b!677714 m!643849))

(declare-fun m!643851 () Bool)

(assert (=> b!677710 m!643851))

(assert (=> b!677710 m!643851))

(declare-fun m!643853 () Bool)

(assert (=> b!677710 m!643853))

(declare-fun m!643855 () Bool)

(assert (=> b!677719 m!643855))

(assert (=> b!677718 m!643847))

(declare-fun m!643857 () Bool)

(assert (=> b!677707 m!643857))

(declare-fun m!643859 () Bool)

(assert (=> b!677724 m!643859))

(declare-fun m!643861 () Bool)

(assert (=> b!677724 m!643861))

(declare-fun m!643863 () Bool)

(assert (=> b!677724 m!643863))

(declare-fun m!643865 () Bool)

(assert (=> b!677726 m!643865))

(declare-fun m!643867 () Bool)

(assert (=> b!677722 m!643867))

(declare-fun m!643869 () Bool)

(assert (=> b!677721 m!643869))

(declare-fun m!643871 () Bool)

(assert (=> b!677716 m!643871))

(declare-fun m!643873 () Bool)

(assert (=> b!677706 m!643873))

(declare-fun m!643875 () Bool)

(assert (=> start!60328 m!643875))

(assert (=> b!677723 m!643847))

(check-sat (not b!677719) (not b!677722) (not b!677725) (not b!677708) (not b!677707) (not b!677718) (not b!677724) (not b!677716) (not start!60328) (not b!677714) (not b!677710) (not b!677721) (not b!677706) (not b!677723) (not b!677726))
