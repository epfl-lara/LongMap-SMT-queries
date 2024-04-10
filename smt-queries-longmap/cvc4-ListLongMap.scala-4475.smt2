; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62280 () Bool)

(assert start!62280)

(declare-fun res!461709 () Bool)

(declare-fun e!396696 () Bool)

(assert (=> start!62280 (=> (not res!461709) (not e!396696))))

(declare-datatypes ((array!39998 0))(
  ( (array!39999 (arr!19157 (Array (_ BitVec 32) (_ BitVec 64))) (size!19542 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39998)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!62280 (= res!461709 (and (bvslt (size!19542 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19542 a!3626))))))

(assert (=> start!62280 e!396696))

(assert (=> start!62280 true))

(declare-fun array_inv!14953 (array!39998) Bool)

(assert (=> start!62280 (array_inv!14953 a!3626)))

(declare-fun b!697827 () Bool)

(declare-fun res!461710 () Bool)

(assert (=> b!697827 (=> (not res!461710) (not e!396696))))

(declare-datatypes ((List!13198 0))(
  ( (Nil!13195) (Cons!13194 (h!14239 (_ BitVec 64)) (t!19480 List!13198)) )
))
(declare-fun arrayNoDuplicates!0 (array!39998 (_ BitVec 32) List!13198) Bool)

(assert (=> b!697827 (= res!461710 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13195))))

(declare-fun b!697828 () Bool)

(declare-fun e!396695 () Bool)

(declare-fun acc!681 () List!13198)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3775 (List!13198 (_ BitVec 64)) Bool)

(assert (=> b!697828 (= e!396695 (not (contains!3775 acc!681 k!2843)))))

(declare-fun b!697829 () Bool)

(declare-fun e!396698 () Bool)

(assert (=> b!697829 (= e!396698 (contains!3775 acc!681 k!2843))))

(declare-fun b!697830 () Bool)

(declare-fun res!461708 () Bool)

(assert (=> b!697830 (=> (not res!461708) (not e!396696))))

(declare-fun e!396697 () Bool)

(assert (=> b!697830 (= res!461708 e!396697)))

(declare-fun res!461705 () Bool)

(assert (=> b!697830 (=> res!461705 e!396697)))

(assert (=> b!697830 (= res!461705 e!396698)))

(declare-fun res!461707 () Bool)

(assert (=> b!697830 (=> (not res!461707) (not e!396698))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!697830 (= res!461707 (bvsgt from!3004 i!1382))))

(declare-fun b!697831 () Bool)

(assert (=> b!697831 (= e!396696 false)))

(declare-fun lt!317197 () Bool)

(assert (=> b!697831 (= lt!317197 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697832 () Bool)

(declare-fun res!461704 () Bool)

(assert (=> b!697832 (=> (not res!461704) (not e!396696))))

(declare-fun noDuplicate!1022 (List!13198) Bool)

(assert (=> b!697832 (= res!461704 (noDuplicate!1022 acc!681))))

(declare-fun b!697833 () Bool)

(assert (=> b!697833 (= e!396697 e!396695)))

(declare-fun res!461706 () Bool)

(assert (=> b!697833 (=> (not res!461706) (not e!396695))))

(assert (=> b!697833 (= res!461706 (bvsle from!3004 i!1382))))

(declare-fun b!697834 () Bool)

(declare-fun res!461711 () Bool)

(assert (=> b!697834 (=> (not res!461711) (not e!396696))))

(assert (=> b!697834 (= res!461711 (not (contains!3775 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697835 () Bool)

(declare-fun res!461703 () Bool)

(assert (=> b!697835 (=> (not res!461703) (not e!396696))))

(assert (=> b!697835 (= res!461703 (not (contains!3775 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62280 res!461709) b!697832))

(assert (= (and b!697832 res!461704) b!697834))

(assert (= (and b!697834 res!461711) b!697835))

(assert (= (and b!697835 res!461703) b!697830))

(assert (= (and b!697830 res!461707) b!697829))

(assert (= (and b!697830 (not res!461705)) b!697833))

(assert (= (and b!697833 res!461706) b!697828))

(assert (= (and b!697830 res!461708) b!697827))

(assert (= (and b!697827 res!461710) b!697831))

(declare-fun m!658149 () Bool)

(assert (=> b!697834 m!658149))

(declare-fun m!658151 () Bool)

(assert (=> start!62280 m!658151))

(declare-fun m!658153 () Bool)

(assert (=> b!697828 m!658153))

(declare-fun m!658155 () Bool)

(assert (=> b!697831 m!658155))

(declare-fun m!658157 () Bool)

(assert (=> b!697827 m!658157))

(declare-fun m!658159 () Bool)

(assert (=> b!697832 m!658159))

(declare-fun m!658161 () Bool)

(assert (=> b!697835 m!658161))

(assert (=> b!697829 m!658153))

(push 1)

(assert (not b!697834))

(assert (not b!697835))

(assert (not b!697832))

(assert (not b!697829))

(assert (not b!697831))

(assert (not b!697828))

(assert (not start!62280))

(assert (not b!697827))

(check-sat)

