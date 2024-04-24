; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60430 () Bool)

(assert start!60430)

(declare-fun b!678716 () Bool)

(declare-fun res!445013 () Bool)

(declare-fun e!386774 () Bool)

(assert (=> b!678716 (=> (not res!445013) (not e!386774))))

(declare-datatypes ((List!12845 0))(
  ( (Nil!12842) (Cons!12841 (h!13889 (_ BitVec 64)) (t!19065 List!12845)) )
))
(declare-fun acc!681 () List!12845)

(declare-fun noDuplicate!771 (List!12845) Bool)

(assert (=> b!678716 (= res!445013 (noDuplicate!771 acc!681))))

(declare-fun b!678717 () Bool)

(declare-fun res!445018 () Bool)

(assert (=> b!678717 (=> (not res!445018) (not e!386774))))

(declare-fun contains!3497 (List!12845 (_ BitVec 64)) Bool)

(assert (=> b!678717 (= res!445018 (not (contains!3497 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678718 () Bool)

(declare-fun res!445017 () Bool)

(assert (=> b!678718 (=> (not res!445017) (not e!386774))))

(declare-datatypes ((array!39415 0))(
  ( (array!39416 (arr!18897 (Array (_ BitVec 32) (_ BitVec 64))) (size!19261 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39415)

(declare-fun arrayNoDuplicates!0 (array!39415 (_ BitVec 32) List!12845) Bool)

(assert (=> b!678718 (= res!445017 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12842))))

(declare-fun b!678719 () Bool)

(declare-fun res!445021 () Bool)

(assert (=> b!678719 (=> (not res!445021) (not e!386774))))

(assert (=> b!678719 (= res!445021 (not (contains!3497 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678720 () Bool)

(declare-fun res!445015 () Bool)

(assert (=> b!678720 (=> (not res!445015) (not e!386774))))

(declare-fun e!386775 () Bool)

(assert (=> b!678720 (= res!445015 e!386775)))

(declare-fun res!445019 () Bool)

(assert (=> b!678720 (=> res!445019 e!386775)))

(declare-fun e!386773 () Bool)

(assert (=> b!678720 (= res!445019 e!386773)))

(declare-fun res!445016 () Bool)

(assert (=> b!678720 (=> (not res!445016) (not e!386773))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678720 (= res!445016 (bvsgt from!3004 i!1382))))

(declare-fun b!678721 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!678721 (= e!386773 (contains!3497 acc!681 k!2843))))

(declare-fun b!678722 () Bool)

(declare-fun e!386772 () Bool)

(assert (=> b!678722 (= e!386772 (not (contains!3497 acc!681 k!2843)))))

(declare-fun b!678723 () Bool)

(assert (=> b!678723 (= e!386774 false)))

(declare-fun lt!312997 () Bool)

(assert (=> b!678723 (= lt!312997 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678724 () Bool)

(assert (=> b!678724 (= e!386775 e!386772)))

(declare-fun res!445014 () Bool)

(assert (=> b!678724 (=> (not res!445014) (not e!386772))))

(assert (=> b!678724 (= res!445014 (bvsle from!3004 i!1382))))

(declare-fun res!445020 () Bool)

(assert (=> start!60430 (=> (not res!445020) (not e!386774))))

(assert (=> start!60430 (= res!445020 (and (bvslt (size!19261 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19261 a!3626))))))

(assert (=> start!60430 e!386774))

(assert (=> start!60430 true))

(declare-fun array_inv!14756 (array!39415) Bool)

(assert (=> start!60430 (array_inv!14756 a!3626)))

(assert (= (and start!60430 res!445020) b!678716))

(assert (= (and b!678716 res!445013) b!678717))

(assert (= (and b!678717 res!445018) b!678719))

(assert (= (and b!678719 res!445021) b!678720))

(assert (= (and b!678720 res!445016) b!678721))

(assert (= (and b!678720 (not res!445019)) b!678724))

(assert (= (and b!678724 res!445014) b!678722))

(assert (= (and b!678720 res!445015) b!678718))

(assert (= (and b!678718 res!445017) b!678723))

(declare-fun m!644945 () Bool)

(assert (=> b!678719 m!644945))

(declare-fun m!644947 () Bool)

(assert (=> b!678716 m!644947))

(declare-fun m!644949 () Bool)

(assert (=> b!678717 m!644949))

(declare-fun m!644951 () Bool)

(assert (=> b!678721 m!644951))

(declare-fun m!644953 () Bool)

(assert (=> b!678723 m!644953))

(declare-fun m!644955 () Bool)

(assert (=> start!60430 m!644955))

(declare-fun m!644957 () Bool)

(assert (=> b!678718 m!644957))

(assert (=> b!678722 m!644951))

(push 1)

(assert (not b!678722))

(assert (not b!678723))

(assert (not b!678719))

(assert (not start!60430))

(assert (not b!678718))

(assert (not b!678716))

(assert (not b!678717))

(assert (not b!678721))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

