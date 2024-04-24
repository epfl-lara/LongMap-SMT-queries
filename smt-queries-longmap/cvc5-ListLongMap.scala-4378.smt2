; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60358 () Bool)

(assert start!60358)

(declare-fun b!677058 () Bool)

(declare-fun res!443383 () Bool)

(declare-fun e!386089 () Bool)

(assert (=> b!677058 (=> (not res!443383) (not e!386089))))

(declare-datatypes ((List!12809 0))(
  ( (Nil!12806) (Cons!12805 (h!13853 (_ BitVec 64)) (t!19029 List!12809)) )
))
(declare-fun acc!681 () List!12809)

(declare-fun noDuplicate!735 (List!12809) Bool)

(assert (=> b!677058 (= res!443383 (noDuplicate!735 acc!681))))

(declare-fun b!677060 () Bool)

(declare-fun res!443381 () Bool)

(assert (=> b!677060 (=> (not res!443381) (not e!386089))))

(declare-datatypes ((array!39343 0))(
  ( (array!39344 (arr!18861 (Array (_ BitVec 32) (_ BitVec 64))) (size!19225 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39343)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677060 (= res!443381 (not (validKeyInArray!0 (select (arr!18861 a!3626) from!3004))))))

(declare-fun b!677061 () Bool)

(declare-fun res!443382 () Bool)

(assert (=> b!677061 (=> (not res!443382) (not e!386089))))

(declare-fun contains!3461 (List!12809 (_ BitVec 64)) Bool)

(assert (=> b!677061 (= res!443382 (not (contains!3461 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677062 () Bool)

(declare-fun res!443390 () Bool)

(assert (=> b!677062 (=> (not res!443390) (not e!386089))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677062 (= res!443390 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19225 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677063 () Bool)

(declare-fun e!386084 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!677063 (= e!386084 (contains!3461 acc!681 k!2843))))

(declare-fun b!677064 () Bool)

(assert (=> b!677064 (= e!386089 false)))

(declare-fun lt!312898 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39343 (_ BitVec 32) List!12809) Bool)

(assert (=> b!677064 (= lt!312898 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677065 () Bool)

(declare-fun e!386086 () Bool)

(declare-fun e!386091 () Bool)

(assert (=> b!677065 (= e!386086 e!386091)))

(declare-fun res!443374 () Bool)

(assert (=> b!677065 (=> (not res!443374) (not e!386091))))

(assert (=> b!677065 (= res!443374 (bvsle from!3004 i!1382))))

(declare-fun b!677066 () Bool)

(declare-fun e!386090 () Bool)

(assert (=> b!677066 (= e!386090 (not (contains!3461 acc!681 k!2843)))))

(declare-fun b!677067 () Bool)

(declare-fun res!443384 () Bool)

(assert (=> b!677067 (=> (not res!443384) (not e!386089))))

(assert (=> b!677067 (= res!443384 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677068 () Bool)

(declare-fun res!443376 () Bool)

(assert (=> b!677068 (=> (not res!443376) (not e!386089))))

(assert (=> b!677068 (= res!443376 (validKeyInArray!0 k!2843))))

(declare-fun b!677069 () Bool)

(declare-fun res!443386 () Bool)

(assert (=> b!677069 (=> (not res!443386) (not e!386089))))

(assert (=> b!677069 (= res!443386 (not (contains!3461 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!443389 () Bool)

(assert (=> start!60358 (=> (not res!443389) (not e!386089))))

(assert (=> start!60358 (= res!443389 (and (bvslt (size!19225 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19225 a!3626))))))

(assert (=> start!60358 e!386089))

(assert (=> start!60358 true))

(declare-fun array_inv!14720 (array!39343) Bool)

(assert (=> start!60358 (array_inv!14720 a!3626)))

(declare-fun b!677059 () Bool)

(declare-fun res!443388 () Bool)

(assert (=> b!677059 (=> (not res!443388) (not e!386089))))

(declare-fun arrayContainsKey!0 (array!39343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677059 (= res!443388 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677070 () Bool)

(declare-fun res!443391 () Bool)

(assert (=> b!677070 (=> (not res!443391) (not e!386089))))

(declare-fun e!386088 () Bool)

(assert (=> b!677070 (= res!443391 e!386088)))

(declare-fun res!443375 () Bool)

(assert (=> b!677070 (=> res!443375 e!386088)))

(assert (=> b!677070 (= res!443375 e!386084)))

(declare-fun res!443377 () Bool)

(assert (=> b!677070 (=> (not res!443377) (not e!386084))))

(assert (=> b!677070 (= res!443377 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677071 () Bool)

(assert (=> b!677071 (= e!386088 e!386090)))

(declare-fun res!443379 () Bool)

(assert (=> b!677071 (=> (not res!443379) (not e!386090))))

(assert (=> b!677071 (= res!443379 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677072 () Bool)

(declare-fun e!386085 () Bool)

(assert (=> b!677072 (= e!386085 (contains!3461 acc!681 k!2843))))

(declare-fun b!677073 () Bool)

(declare-fun res!443380 () Bool)

(assert (=> b!677073 (=> (not res!443380) (not e!386089))))

(assert (=> b!677073 (= res!443380 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19225 a!3626))))))

(declare-fun b!677074 () Bool)

(assert (=> b!677074 (= e!386091 (not (contains!3461 acc!681 k!2843)))))

(declare-fun b!677075 () Bool)

(declare-fun res!443373 () Bool)

(assert (=> b!677075 (=> (not res!443373) (not e!386089))))

(assert (=> b!677075 (= res!443373 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12806))))

(declare-fun b!677076 () Bool)

(declare-fun res!443378 () Bool)

(assert (=> b!677076 (=> (not res!443378) (not e!386089))))

(assert (=> b!677076 (= res!443378 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677077 () Bool)

(declare-fun res!443387 () Bool)

(assert (=> b!677077 (=> (not res!443387) (not e!386089))))

(assert (=> b!677077 (= res!443387 e!386086)))

(declare-fun res!443385 () Bool)

(assert (=> b!677077 (=> res!443385 e!386086)))

(assert (=> b!677077 (= res!443385 e!386085)))

(declare-fun res!443392 () Bool)

(assert (=> b!677077 (=> (not res!443392) (not e!386085))))

(assert (=> b!677077 (= res!443392 (bvsgt from!3004 i!1382))))

(assert (= (and start!60358 res!443389) b!677058))

(assert (= (and b!677058 res!443383) b!677069))

(assert (= (and b!677069 res!443386) b!677061))

(assert (= (and b!677061 res!443382) b!677077))

(assert (= (and b!677077 res!443392) b!677072))

(assert (= (and b!677077 (not res!443385)) b!677065))

(assert (= (and b!677065 res!443374) b!677074))

(assert (= (and b!677077 res!443387) b!677075))

(assert (= (and b!677075 res!443373) b!677067))

(assert (= (and b!677067 res!443384) b!677073))

(assert (= (and b!677073 res!443380) b!677068))

(assert (= (and b!677068 res!443376) b!677059))

(assert (= (and b!677059 res!443388) b!677062))

(assert (= (and b!677062 res!443390) b!677060))

(assert (= (and b!677060 res!443381) b!677076))

(assert (= (and b!677076 res!443378) b!677070))

(assert (= (and b!677070 res!443377) b!677063))

(assert (= (and b!677070 (not res!443375)) b!677071))

(assert (= (and b!677071 res!443379) b!677066))

(assert (= (and b!677070 res!443391) b!677064))

(declare-fun m!644149 () Bool)

(assert (=> b!677058 m!644149))

(declare-fun m!644151 () Bool)

(assert (=> b!677061 m!644151))

(declare-fun m!644153 () Bool)

(assert (=> b!677068 m!644153))

(declare-fun m!644155 () Bool)

(assert (=> b!677075 m!644155))

(declare-fun m!644157 () Bool)

(assert (=> b!677072 m!644157))

(declare-fun m!644159 () Bool)

(assert (=> b!677060 m!644159))

(assert (=> b!677060 m!644159))

(declare-fun m!644161 () Bool)

(assert (=> b!677060 m!644161))

(declare-fun m!644163 () Bool)

(assert (=> b!677059 m!644163))

(assert (=> b!677063 m!644157))

(declare-fun m!644165 () Bool)

(assert (=> b!677069 m!644165))

(assert (=> b!677066 m!644157))

(declare-fun m!644167 () Bool)

(assert (=> b!677064 m!644167))

(declare-fun m!644169 () Bool)

(assert (=> b!677067 m!644169))

(declare-fun m!644171 () Bool)

(assert (=> start!60358 m!644171))

(assert (=> b!677074 m!644157))

(push 1)

(assert (not b!677059))

(assert (not b!677064))

(assert (not b!677074))

(assert (not b!677069))

(assert (not b!677058))

(assert (not b!677060))

(assert (not b!677066))

(assert (not b!677061))

(assert (not b!677063))

(assert (not b!677067))

(assert (not start!60358))

(assert (not b!677072))

(assert (not b!677068))

(assert (not b!677075))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

