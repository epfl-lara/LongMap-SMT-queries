; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60382 () Bool)

(assert start!60382)

(declare-fun b!677804 () Bool)

(declare-fun e!386375 () Bool)

(declare-datatypes ((List!12821 0))(
  ( (Nil!12818) (Cons!12817 (h!13865 (_ BitVec 64)) (t!19041 List!12821)) )
))
(declare-fun acc!681 () List!12821)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3473 (List!12821 (_ BitVec 64)) Bool)

(assert (=> b!677804 (= e!386375 (contains!3473 acc!681 k!2843))))

(declare-fun b!677806 () Bool)

(declare-fun res!444123 () Bool)

(declare-fun e!386379 () Bool)

(assert (=> b!677806 (=> (not res!444123) (not e!386379))))

(declare-datatypes ((array!39367 0))(
  ( (array!39368 (arr!18873 (Array (_ BitVec 32) (_ BitVec 64))) (size!19237 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39367)

(declare-fun arrayNoDuplicates!0 (array!39367 (_ BitVec 32) List!12821) Bool)

(assert (=> b!677806 (= res!444123 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12818))))

(declare-fun b!677807 () Bool)

(declare-fun res!444139 () Bool)

(assert (=> b!677807 (=> (not res!444139) (not e!386379))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!677807 (= res!444139 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677808 () Bool)

(assert (=> b!677808 (= e!386379 (not true))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677808 (arrayNoDuplicates!0 (array!39368 (store (arr!18873 a!3626) i!1382 k!2843) (size!19237 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23755 0))(
  ( (Unit!23756) )
))
(declare-fun lt!312934 () Unit!23755)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39367 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12821) Unit!23755)

(assert (=> b!677808 (= lt!312934 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677809 () Bool)

(declare-fun res!444124 () Bool)

(assert (=> b!677809 (=> (not res!444124) (not e!386379))))

(assert (=> b!677809 (= res!444124 (not (contains!3473 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677810 () Bool)

(declare-fun e!386376 () Bool)

(assert (=> b!677810 (= e!386376 (not (contains!3473 acc!681 k!2843)))))

(declare-fun b!677811 () Bool)

(declare-fun e!386374 () Bool)

(assert (=> b!677811 (= e!386374 (contains!3473 acc!681 k!2843))))

(declare-fun b!677812 () Bool)

(declare-fun e!386372 () Bool)

(assert (=> b!677812 (= e!386372 e!386376)))

(declare-fun res!444127 () Bool)

(assert (=> b!677812 (=> (not res!444127) (not e!386376))))

(assert (=> b!677812 (= res!444127 (bvsle from!3004 i!1382))))

(declare-fun b!677813 () Bool)

(declare-fun res!444120 () Bool)

(assert (=> b!677813 (=> (not res!444120) (not e!386379))))

(assert (=> b!677813 (= res!444120 (not (contains!3473 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677814 () Bool)

(declare-fun res!444134 () Bool)

(assert (=> b!677814 (=> (not res!444134) (not e!386379))))

(assert (=> b!677814 (= res!444134 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19237 a!3626))))))

(declare-fun b!677815 () Bool)

(declare-fun res!444135 () Bool)

(assert (=> b!677815 (=> (not res!444135) (not e!386379))))

(declare-fun e!386373 () Bool)

(assert (=> b!677815 (= res!444135 e!386373)))

(declare-fun res!444133 () Bool)

(assert (=> b!677815 (=> res!444133 e!386373)))

(assert (=> b!677815 (= res!444133 e!386374)))

(declare-fun res!444119 () Bool)

(assert (=> b!677815 (=> (not res!444119) (not e!386374))))

(assert (=> b!677815 (= res!444119 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677816 () Bool)

(declare-fun res!444129 () Bool)

(assert (=> b!677816 (=> (not res!444129) (not e!386379))))

(declare-fun noDuplicate!747 (List!12821) Bool)

(assert (=> b!677816 (= res!444129 (noDuplicate!747 acc!681))))

(declare-fun b!677817 () Bool)

(declare-fun res!444121 () Bool)

(assert (=> b!677817 (=> (not res!444121) (not e!386379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677817 (= res!444121 (validKeyInArray!0 k!2843))))

(declare-fun b!677818 () Bool)

(declare-fun res!444131 () Bool)

(assert (=> b!677818 (=> (not res!444131) (not e!386379))))

(assert (=> b!677818 (= res!444131 (not (validKeyInArray!0 (select (arr!18873 a!3626) from!3004))))))

(declare-fun b!677819 () Bool)

(declare-fun res!444128 () Bool)

(assert (=> b!677819 (=> (not res!444128) (not e!386379))))

(assert (=> b!677819 (= res!444128 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19237 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677820 () Bool)

(declare-fun res!444136 () Bool)

(assert (=> b!677820 (=> (not res!444136) (not e!386379))))

(assert (=> b!677820 (= res!444136 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677805 () Bool)

(declare-fun res!444126 () Bool)

(assert (=> b!677805 (=> (not res!444126) (not e!386379))))

(declare-fun arrayContainsKey!0 (array!39367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677805 (= res!444126 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!444138 () Bool)

(assert (=> start!60382 (=> (not res!444138) (not e!386379))))

(assert (=> start!60382 (= res!444138 (and (bvslt (size!19237 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19237 a!3626))))))

(assert (=> start!60382 e!386379))

(assert (=> start!60382 true))

(declare-fun array_inv!14732 (array!39367) Bool)

(assert (=> start!60382 (array_inv!14732 a!3626)))

(declare-fun b!677821 () Bool)

(declare-fun e!386378 () Bool)

(assert (=> b!677821 (= e!386373 e!386378)))

(declare-fun res!444132 () Bool)

(assert (=> b!677821 (=> (not res!444132) (not e!386378))))

(assert (=> b!677821 (= res!444132 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677822 () Bool)

(assert (=> b!677822 (= e!386378 (not (contains!3473 acc!681 k!2843)))))

(declare-fun b!677823 () Bool)

(declare-fun res!444137 () Bool)

(assert (=> b!677823 (=> (not res!444137) (not e!386379))))

(assert (=> b!677823 (= res!444137 e!386372)))

(declare-fun res!444125 () Bool)

(assert (=> b!677823 (=> res!444125 e!386372)))

(assert (=> b!677823 (= res!444125 e!386375)))

(declare-fun res!444122 () Bool)

(assert (=> b!677823 (=> (not res!444122) (not e!386375))))

(assert (=> b!677823 (= res!444122 (bvsgt from!3004 i!1382))))

(declare-fun b!677824 () Bool)

(declare-fun res!444130 () Bool)

(assert (=> b!677824 (=> (not res!444130) (not e!386379))))

(assert (=> b!677824 (= res!444130 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60382 res!444138) b!677816))

(assert (= (and b!677816 res!444129) b!677813))

(assert (= (and b!677813 res!444120) b!677809))

(assert (= (and b!677809 res!444124) b!677823))

(assert (= (and b!677823 res!444122) b!677804))

(assert (= (and b!677823 (not res!444125)) b!677812))

(assert (= (and b!677812 res!444127) b!677810))

(assert (= (and b!677823 res!444137) b!677806))

(assert (= (and b!677806 res!444123) b!677824))

(assert (= (and b!677824 res!444130) b!677814))

(assert (= (and b!677814 res!444134) b!677817))

(assert (= (and b!677817 res!444121) b!677805))

(assert (= (and b!677805 res!444126) b!677819))

(assert (= (and b!677819 res!444128) b!677818))

(assert (= (and b!677818 res!444131) b!677807))

(assert (= (and b!677807 res!444139) b!677815))

(assert (= (and b!677815 res!444119) b!677811))

(assert (= (and b!677815 (not res!444133)) b!677821))

(assert (= (and b!677821 res!444132) b!677822))

(assert (= (and b!677815 res!444135) b!677820))

(assert (= (and b!677820 res!444136) b!677808))

(declare-fun m!644485 () Bool)

(assert (=> start!60382 m!644485))

(declare-fun m!644487 () Bool)

(assert (=> b!677817 m!644487))

(declare-fun m!644489 () Bool)

(assert (=> b!677809 m!644489))

(declare-fun m!644491 () Bool)

(assert (=> b!677822 m!644491))

(assert (=> b!677810 m!644491))

(declare-fun m!644493 () Bool)

(assert (=> b!677820 m!644493))

(declare-fun m!644495 () Bool)

(assert (=> b!677813 m!644495))

(assert (=> b!677811 m!644491))

(declare-fun m!644497 () Bool)

(assert (=> b!677818 m!644497))

(assert (=> b!677818 m!644497))

(declare-fun m!644499 () Bool)

(assert (=> b!677818 m!644499))

(declare-fun m!644501 () Bool)

(assert (=> b!677816 m!644501))

(declare-fun m!644503 () Bool)

(assert (=> b!677805 m!644503))

(assert (=> b!677804 m!644491))

(declare-fun m!644505 () Bool)

(assert (=> b!677806 m!644505))

(declare-fun m!644507 () Bool)

(assert (=> b!677824 m!644507))

(declare-fun m!644509 () Bool)

(assert (=> b!677808 m!644509))

(declare-fun m!644511 () Bool)

(assert (=> b!677808 m!644511))

(declare-fun m!644513 () Bool)

(assert (=> b!677808 m!644513))

(push 1)

(assert (not b!677824))

(assert (not b!677808))

(assert (not start!60382))

(assert (not b!677810))

(assert (not b!677820))

(assert (not b!677811))

(assert (not b!677805))

(assert (not b!677804))

(assert (not b!677817))

(assert (not b!677818))

(assert (not b!677806))

(assert (not b!677816))

(assert (not b!677813))

(assert (not b!677809))

(assert (not b!677822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

