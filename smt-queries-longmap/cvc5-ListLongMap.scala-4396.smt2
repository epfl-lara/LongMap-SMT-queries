; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60476 () Bool)

(assert start!60476)

(declare-fun b!679446 () Bool)

(declare-fun res!445807 () Bool)

(declare-fun e!387134 () Bool)

(assert (=> b!679446 (=> (not res!445807) (not e!387134))))

(declare-fun e!387135 () Bool)

(assert (=> b!679446 (= res!445807 e!387135)))

(declare-fun res!445806 () Bool)

(assert (=> b!679446 (=> res!445806 e!387135)))

(declare-fun e!387138 () Bool)

(assert (=> b!679446 (= res!445806 e!387138)))

(declare-fun res!445815 () Bool)

(assert (=> b!679446 (=> (not res!445815) (not e!387138))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679446 (= res!445815 (bvsgt from!3004 i!1382))))

(declare-fun b!679447 () Bool)

(declare-fun res!445808 () Bool)

(assert (=> b!679447 (=> (not res!445808) (not e!387134))))

(declare-datatypes ((List!12959 0))(
  ( (Nil!12956) (Cons!12955 (h!14000 (_ BitVec 64)) (t!19187 List!12959)) )
))
(declare-fun acc!681 () List!12959)

(declare-fun noDuplicate!783 (List!12959) Bool)

(assert (=> b!679447 (= res!445808 (noDuplicate!783 acc!681))))

(declare-fun b!679448 () Bool)

(declare-fun res!445809 () Bool)

(assert (=> b!679448 (=> (not res!445809) (not e!387134))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679448 (= res!445809 (validKeyInArray!0 k!2843))))

(declare-fun b!679449 () Bool)

(declare-fun contains!3536 (List!12959 (_ BitVec 64)) Bool)

(assert (=> b!679449 (= e!387138 (contains!3536 acc!681 k!2843))))

(declare-fun b!679450 () Bool)

(declare-fun e!387133 () Bool)

(assert (=> b!679450 (= e!387133 true)))

(assert (=> b!679450 false))

(declare-datatypes ((Unit!23796 0))(
  ( (Unit!23797) )
))
(declare-fun lt!312928 () Unit!23796)

(declare-datatypes ((array!39457 0))(
  ( (array!39458 (arr!18918 (Array (_ BitVec 32) (_ BitVec 64))) (size!19282 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39457)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39457 (_ BitVec 64) (_ BitVec 32)) Unit!23796)

(assert (=> b!679450 (= lt!312928 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(declare-fun b!679451 () Bool)

(declare-fun e!387136 () Bool)

(assert (=> b!679451 (= e!387136 (not (contains!3536 acc!681 k!2843)))))

(declare-fun res!445817 () Bool)

(assert (=> start!60476 (=> (not res!445817) (not e!387134))))

(assert (=> start!60476 (= res!445817 (and (bvslt (size!19282 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19282 a!3626))))))

(assert (=> start!60476 e!387134))

(assert (=> start!60476 true))

(declare-fun array_inv!14714 (array!39457) Bool)

(assert (=> start!60476 (array_inv!14714 a!3626)))

(declare-fun b!679452 () Bool)

(declare-fun res!445819 () Bool)

(assert (=> b!679452 (=> (not res!445819) (not e!387134))))

(assert (=> b!679452 (= res!445819 (not (contains!3536 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679453 () Bool)

(assert (=> b!679453 (= e!387135 e!387136)))

(declare-fun res!445818 () Bool)

(assert (=> b!679453 (=> (not res!445818) (not e!387136))))

(assert (=> b!679453 (= res!445818 (bvsle from!3004 i!1382))))

(declare-fun b!679454 () Bool)

(declare-fun res!445812 () Bool)

(assert (=> b!679454 (=> (not res!445812) (not e!387134))))

(assert (=> b!679454 (= res!445812 (not (contains!3536 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679455 () Bool)

(declare-fun res!445820 () Bool)

(assert (=> b!679455 (=> (not res!445820) (not e!387134))))

(assert (=> b!679455 (= res!445820 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19282 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679456 () Bool)

(declare-fun res!445810 () Bool)

(assert (=> b!679456 (=> (not res!445810) (not e!387134))))

(declare-fun arrayNoDuplicates!0 (array!39457 (_ BitVec 32) List!12959) Bool)

(assert (=> b!679456 (= res!445810 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12956))))

(declare-fun b!679457 () Bool)

(declare-fun res!445813 () Bool)

(assert (=> b!679457 (=> (not res!445813) (not e!387134))))

(assert (=> b!679457 (= res!445813 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679458 () Bool)

(assert (=> b!679458 (= e!387134 (not e!387133))))

(declare-fun res!445814 () Bool)

(assert (=> b!679458 (=> res!445814 e!387133)))

(declare-fun arrayContainsKey!0 (array!39457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679458 (= res!445814 (not (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (=> b!679458 (arrayContainsKey!0 (array!39458 (store (arr!18918 a!3626) i!1382 k!2843) (size!19282 a!3626)) k!2843 from!3004)))

(declare-fun b!679459 () Bool)

(declare-fun res!445811 () Bool)

(assert (=> b!679459 (=> (not res!445811) (not e!387134))))

(assert (=> b!679459 (= res!445811 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679460 () Bool)

(declare-fun res!445816 () Bool)

(assert (=> b!679460 (=> (not res!445816) (not e!387134))))

(assert (=> b!679460 (= res!445816 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19282 a!3626))))))

(assert (= (and start!60476 res!445817) b!679447))

(assert (= (and b!679447 res!445808) b!679452))

(assert (= (and b!679452 res!445819) b!679454))

(assert (= (and b!679454 res!445812) b!679446))

(assert (= (and b!679446 res!445815) b!679449))

(assert (= (and b!679446 (not res!445806)) b!679453))

(assert (= (and b!679453 res!445818) b!679451))

(assert (= (and b!679446 res!445807) b!679456))

(assert (= (and b!679456 res!445810) b!679457))

(assert (= (and b!679457 res!445813) b!679460))

(assert (= (and b!679460 res!445816) b!679448))

(assert (= (and b!679448 res!445809) b!679459))

(assert (= (and b!679459 res!445811) b!679455))

(assert (= (and b!679455 res!445820) b!679458))

(assert (= (and b!679458 (not res!445814)) b!679450))

(declare-fun m!644861 () Bool)

(assert (=> b!679448 m!644861))

(declare-fun m!644863 () Bool)

(assert (=> b!679447 m!644863))

(declare-fun m!644865 () Bool)

(assert (=> b!679454 m!644865))

(declare-fun m!644867 () Bool)

(assert (=> b!679458 m!644867))

(declare-fun m!644869 () Bool)

(assert (=> b!679458 m!644869))

(declare-fun m!644871 () Bool)

(assert (=> b!679458 m!644871))

(declare-fun m!644873 () Bool)

(assert (=> start!60476 m!644873))

(declare-fun m!644875 () Bool)

(assert (=> b!679457 m!644875))

(declare-fun m!644877 () Bool)

(assert (=> b!679449 m!644877))

(declare-fun m!644879 () Bool)

(assert (=> b!679456 m!644879))

(declare-fun m!644881 () Bool)

(assert (=> b!679452 m!644881))

(assert (=> b!679451 m!644877))

(declare-fun m!644883 () Bool)

(assert (=> b!679459 m!644883))

(declare-fun m!644885 () Bool)

(assert (=> b!679450 m!644885))

(push 1)

(assert (not b!679447))

(assert (not b!679448))

(assert (not b!679456))

(assert (not start!60476))

(assert (not b!679452))

(assert (not b!679459))

(assert (not b!679458))

(assert (not b!679454))

(assert (not b!679451))

(assert (not b!679449))

(assert (not b!679450))

(assert (not b!679457))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

