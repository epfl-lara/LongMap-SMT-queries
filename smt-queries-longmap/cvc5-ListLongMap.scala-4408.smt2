; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60860 () Bool)

(assert start!60860)

(declare-fun b!682407 () Bool)

(declare-fun res!448421 () Bool)

(declare-fun e!388859 () Bool)

(assert (=> b!682407 (=> (not res!448421) (not e!388859))))

(declare-datatypes ((List!12995 0))(
  ( (Nil!12992) (Cons!12991 (h!14036 (_ BitVec 64)) (t!19238 List!12995)) )
))
(declare-fun acc!681 () List!12995)

(declare-fun contains!3572 (List!12995 (_ BitVec 64)) Bool)

(assert (=> b!682407 (= res!448421 (not (contains!3572 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682408 () Bool)

(declare-fun res!448422 () Bool)

(assert (=> b!682408 (=> (not res!448422) (not e!388859))))

(declare-fun e!388855 () Bool)

(assert (=> b!682408 (= res!448422 e!388855)))

(declare-fun res!448419 () Bool)

(assert (=> b!682408 (=> res!448419 e!388855)))

(declare-fun e!388856 () Bool)

(assert (=> b!682408 (= res!448419 e!388856)))

(declare-fun res!448418 () Bool)

(assert (=> b!682408 (=> (not res!448418) (not e!388856))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682408 (= res!448418 (bvsgt from!3004 i!1382))))

(declare-fun b!682409 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!682409 (= e!388859 (not (not (contains!3572 acc!681 k!2843))))))

(declare-fun subseq!158 (List!12995 List!12995) Bool)

(assert (=> b!682409 (subseq!158 acc!681 acc!681)))

(declare-datatypes ((Unit!23937 0))(
  ( (Unit!23938) )
))
(declare-fun lt!313511 () Unit!23937)

(declare-fun lemmaListSubSeqRefl!0 (List!12995) Unit!23937)

(assert (=> b!682409 (= lt!313511 (lemmaListSubSeqRefl!0 acc!681))))

(declare-datatypes ((array!39544 0))(
  ( (array!39545 (arr!18954 (Array (_ BitVec 32) (_ BitVec 64))) (size!19318 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39544)

(declare-fun arrayNoDuplicates!0 (array!39544 (_ BitVec 32) List!12995) Bool)

(assert (=> b!682409 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313513 () Unit!23937)

(declare-fun e!388857 () Unit!23937)

(assert (=> b!682409 (= lt!313513 e!388857)))

(declare-fun c!77366 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682409 (= c!77366 (validKeyInArray!0 (select (arr!18954 a!3626) from!3004)))))

(declare-fun lt!313510 () Unit!23937)

(declare-fun e!388854 () Unit!23937)

(assert (=> b!682409 (= lt!313510 e!388854)))

(declare-fun c!77365 () Bool)

(declare-fun arrayContainsKey!0 (array!39544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682409 (= c!77365 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682409 (arrayContainsKey!0 (array!39545 (store (arr!18954 a!3626) i!1382 k!2843) (size!19318 a!3626)) k!2843 from!3004)))

(declare-fun b!682410 () Bool)

(declare-fun res!448420 () Bool)

(assert (=> b!682410 (=> (not res!448420) (not e!388859))))

(assert (=> b!682410 (= res!448420 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682411 () Bool)

(declare-fun lt!313508 () Unit!23937)

(assert (=> b!682411 (= e!388857 lt!313508)))

(declare-fun lt!313512 () Unit!23937)

(assert (=> b!682411 (= lt!313512 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682411 (subseq!158 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39544 List!12995 List!12995 (_ BitVec 32)) Unit!23937)

(declare-fun $colon$colon!323 (List!12995 (_ BitVec 64)) List!12995)

(assert (=> b!682411 (= lt!313508 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!323 acc!681 (select (arr!18954 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682411 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun res!448412 () Bool)

(assert (=> start!60860 (=> (not res!448412) (not e!388859))))

(assert (=> start!60860 (= res!448412 (and (bvslt (size!19318 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19318 a!3626))))))

(assert (=> start!60860 e!388859))

(assert (=> start!60860 true))

(declare-fun array_inv!14750 (array!39544) Bool)

(assert (=> start!60860 (array_inv!14750 a!3626)))

(declare-fun b!682412 () Bool)

(declare-fun res!448423 () Bool)

(assert (=> b!682412 (=> (not res!448423) (not e!388859))))

(assert (=> b!682412 (= res!448423 (validKeyInArray!0 k!2843))))

(declare-fun b!682413 () Bool)

(declare-fun res!448424 () Bool)

(assert (=> b!682413 (=> (not res!448424) (not e!388859))))

(declare-fun noDuplicate!819 (List!12995) Bool)

(assert (=> b!682413 (= res!448424 (noDuplicate!819 acc!681))))

(declare-fun b!682414 () Bool)

(declare-fun e!388860 () Bool)

(assert (=> b!682414 (= e!388860 (not (contains!3572 acc!681 k!2843)))))

(declare-fun b!682415 () Bool)

(declare-fun res!448413 () Bool)

(assert (=> b!682415 (=> (not res!448413) (not e!388859))))

(assert (=> b!682415 (= res!448413 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682416 () Bool)

(declare-fun Unit!23939 () Unit!23937)

(assert (=> b!682416 (= e!388857 Unit!23939)))

(declare-fun b!682417 () Bool)

(declare-fun Unit!23940 () Unit!23937)

(assert (=> b!682417 (= e!388854 Unit!23940)))

(declare-fun b!682418 () Bool)

(declare-fun res!448414 () Bool)

(assert (=> b!682418 (=> (not res!448414) (not e!388859))))

(assert (=> b!682418 (= res!448414 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19318 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682419 () Bool)

(declare-fun res!448416 () Bool)

(assert (=> b!682419 (=> (not res!448416) (not e!388859))))

(assert (=> b!682419 (= res!448416 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12992))))

(declare-fun b!682420 () Bool)

(declare-fun res!448411 () Bool)

(assert (=> b!682420 (=> (not res!448411) (not e!388859))))

(assert (=> b!682420 (= res!448411 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19318 a!3626))))))

(declare-fun b!682421 () Bool)

(assert (=> b!682421 (= e!388856 (contains!3572 acc!681 k!2843))))

(declare-fun b!682422 () Bool)

(assert (=> b!682422 (= e!388855 e!388860)))

(declare-fun res!448417 () Bool)

(assert (=> b!682422 (=> (not res!448417) (not e!388860))))

(assert (=> b!682422 (= res!448417 (bvsle from!3004 i!1382))))

(declare-fun b!682423 () Bool)

(declare-fun Unit!23941 () Unit!23937)

(assert (=> b!682423 (= e!388854 Unit!23941)))

(declare-fun lt!313509 () Unit!23937)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39544 (_ BitVec 64) (_ BitVec 32)) Unit!23937)

(assert (=> b!682423 (= lt!313509 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!682423 false))

(declare-fun b!682424 () Bool)

(declare-fun res!448415 () Bool)

(assert (=> b!682424 (=> (not res!448415) (not e!388859))))

(assert (=> b!682424 (= res!448415 (not (contains!3572 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60860 res!448412) b!682413))

(assert (= (and b!682413 res!448424) b!682424))

(assert (= (and b!682424 res!448415) b!682407))

(assert (= (and b!682407 res!448421) b!682408))

(assert (= (and b!682408 res!448418) b!682421))

(assert (= (and b!682408 (not res!448419)) b!682422))

(assert (= (and b!682422 res!448417) b!682414))

(assert (= (and b!682408 res!448422) b!682419))

(assert (= (and b!682419 res!448416) b!682410))

(assert (= (and b!682410 res!448420) b!682420))

(assert (= (and b!682420 res!448411) b!682412))

(assert (= (and b!682412 res!448423) b!682415))

(assert (= (and b!682415 res!448413) b!682418))

(assert (= (and b!682418 res!448414) b!682409))

(assert (= (and b!682409 c!77365) b!682423))

(assert (= (and b!682409 (not c!77365)) b!682417))

(assert (= (and b!682409 c!77366) b!682411))

(assert (= (and b!682409 (not c!77366)) b!682416))

(declare-fun m!647117 () Bool)

(assert (=> b!682411 m!647117))

(declare-fun m!647119 () Bool)

(assert (=> b!682411 m!647119))

(declare-fun m!647121 () Bool)

(assert (=> b!682411 m!647121))

(declare-fun m!647123 () Bool)

(assert (=> b!682411 m!647123))

(assert (=> b!682411 m!647119))

(assert (=> b!682411 m!647121))

(declare-fun m!647125 () Bool)

(assert (=> b!682411 m!647125))

(declare-fun m!647127 () Bool)

(assert (=> b!682411 m!647127))

(declare-fun m!647129 () Bool)

(assert (=> b!682410 m!647129))

(declare-fun m!647131 () Bool)

(assert (=> b!682423 m!647131))

(declare-fun m!647133 () Bool)

(assert (=> b!682415 m!647133))

(declare-fun m!647135 () Bool)

(assert (=> start!60860 m!647135))

(assert (=> b!682409 m!647117))

(assert (=> b!682409 m!647119))

(declare-fun m!647137 () Bool)

(assert (=> b!682409 m!647137))

(declare-fun m!647139 () Bool)

(assert (=> b!682409 m!647139))

(assert (=> b!682409 m!647125))

(declare-fun m!647141 () Bool)

(assert (=> b!682409 m!647141))

(assert (=> b!682409 m!647119))

(declare-fun m!647143 () Bool)

(assert (=> b!682409 m!647143))

(declare-fun m!647145 () Bool)

(assert (=> b!682409 m!647145))

(assert (=> b!682409 m!647127))

(declare-fun m!647147 () Bool)

(assert (=> b!682413 m!647147))

(assert (=> b!682421 m!647137))

(declare-fun m!647149 () Bool)

(assert (=> b!682419 m!647149))

(declare-fun m!647151 () Bool)

(assert (=> b!682412 m!647151))

(declare-fun m!647153 () Bool)

(assert (=> b!682407 m!647153))

(declare-fun m!647155 () Bool)

(assert (=> b!682424 m!647155))

(assert (=> b!682414 m!647137))

(push 1)

