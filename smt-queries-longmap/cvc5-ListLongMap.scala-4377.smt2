; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60352 () Bool)

(assert start!60352)

(declare-fun b!676878 () Bool)

(declare-fun res!443210 () Bool)

(declare-fun e!386013 () Bool)

(assert (=> b!676878 (=> (not res!443210) (not e!386013))))

(declare-datatypes ((array!39337 0))(
  ( (array!39338 (arr!18858 (Array (_ BitVec 32) (_ BitVec 64))) (size!19222 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39337)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12806 0))(
  ( (Nil!12803) (Cons!12802 (h!13850 (_ BitVec 64)) (t!19026 List!12806)) )
))
(declare-fun acc!681 () List!12806)

(declare-fun arrayNoDuplicates!0 (array!39337 (_ BitVec 32) List!12806) Bool)

(assert (=> b!676878 (= res!443210 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676879 () Bool)

(declare-fun e!386017 () Bool)

(declare-fun e!386012 () Bool)

(assert (=> b!676879 (= e!386017 e!386012)))

(declare-fun res!443198 () Bool)

(assert (=> b!676879 (=> (not res!443198) (not e!386012))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676879 (= res!443198 (bvsle from!3004 i!1382))))

(declare-fun b!676880 () Bool)

(declare-fun e!386018 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3458 (List!12806 (_ BitVec 64)) Bool)

(assert (=> b!676880 (= e!386018 (not (contains!3458 acc!681 k!2843)))))

(declare-fun b!676881 () Bool)

(declare-fun res!443212 () Bool)

(assert (=> b!676881 (=> (not res!443212) (not e!386013))))

(assert (=> b!676881 (= res!443212 e!386017)))

(declare-fun res!443194 () Bool)

(assert (=> b!676881 (=> res!443194 e!386017)))

(declare-fun e!386015 () Bool)

(assert (=> b!676881 (= res!443194 e!386015)))

(declare-fun res!443211 () Bool)

(assert (=> b!676881 (=> (not res!443211) (not e!386015))))

(assert (=> b!676881 (= res!443211 (bvsgt from!3004 i!1382))))

(declare-fun b!676882 () Bool)

(assert (=> b!676882 (= e!386015 (contains!3458 acc!681 k!2843))))

(declare-fun res!443202 () Bool)

(assert (=> start!60352 (=> (not res!443202) (not e!386013))))

(assert (=> start!60352 (= res!443202 (and (bvslt (size!19222 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19222 a!3626))))))

(assert (=> start!60352 e!386013))

(assert (=> start!60352 true))

(declare-fun array_inv!14717 (array!39337) Bool)

(assert (=> start!60352 (array_inv!14717 a!3626)))

(declare-fun b!676883 () Bool)

(declare-fun e!386014 () Bool)

(assert (=> b!676883 (= e!386014 (contains!3458 acc!681 k!2843))))

(declare-fun b!676884 () Bool)

(declare-fun res!443201 () Bool)

(assert (=> b!676884 (=> (not res!443201) (not e!386013))))

(declare-fun e!386016 () Bool)

(assert (=> b!676884 (= res!443201 e!386016)))

(declare-fun res!443207 () Bool)

(assert (=> b!676884 (=> res!443207 e!386016)))

(assert (=> b!676884 (= res!443207 e!386014)))

(declare-fun res!443200 () Bool)

(assert (=> b!676884 (=> (not res!443200) (not e!386014))))

(assert (=> b!676884 (= res!443200 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676885 () Bool)

(declare-fun res!443197 () Bool)

(assert (=> b!676885 (=> (not res!443197) (not e!386013))))

(assert (=> b!676885 (= res!443197 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12803))))

(declare-fun b!676886 () Bool)

(declare-fun res!443205 () Bool)

(assert (=> b!676886 (=> (not res!443205) (not e!386013))))

(assert (=> b!676886 (= res!443205 (not (contains!3458 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676887 () Bool)

(assert (=> b!676887 (= e!386016 e!386018)))

(declare-fun res!443206 () Bool)

(assert (=> b!676887 (=> (not res!443206) (not e!386018))))

(assert (=> b!676887 (= res!443206 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676888 () Bool)

(declare-fun res!443199 () Bool)

(assert (=> b!676888 (=> (not res!443199) (not e!386013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676888 (= res!443199 (not (validKeyInArray!0 (select (arr!18858 a!3626) from!3004))))))

(declare-fun b!676889 () Bool)

(assert (=> b!676889 (= e!386012 (not (contains!3458 acc!681 k!2843)))))

(declare-fun b!676890 () Bool)

(declare-fun res!443209 () Bool)

(assert (=> b!676890 (=> (not res!443209) (not e!386013))))

(declare-fun noDuplicate!732 (List!12806) Bool)

(assert (=> b!676890 (= res!443209 (noDuplicate!732 acc!681))))

(declare-fun b!676891 () Bool)

(declare-fun res!443196 () Bool)

(assert (=> b!676891 (=> (not res!443196) (not e!386013))))

(assert (=> b!676891 (= res!443196 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676892 () Bool)

(declare-fun res!443193 () Bool)

(assert (=> b!676892 (=> (not res!443193) (not e!386013))))

(assert (=> b!676892 (= res!443193 (not (contains!3458 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676893 () Bool)

(declare-fun res!443204 () Bool)

(assert (=> b!676893 (=> (not res!443204) (not e!386013))))

(assert (=> b!676893 (= res!443204 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19222 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676894 () Bool)

(declare-fun res!443208 () Bool)

(assert (=> b!676894 (=> (not res!443208) (not e!386013))))

(declare-fun arrayContainsKey!0 (array!39337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676894 (= res!443208 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676895 () Bool)

(declare-fun res!443195 () Bool)

(assert (=> b!676895 (=> (not res!443195) (not e!386013))))

(assert (=> b!676895 (= res!443195 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19222 a!3626))))))

(declare-fun b!676896 () Bool)

(declare-fun res!443203 () Bool)

(assert (=> b!676896 (=> (not res!443203) (not e!386013))))

(assert (=> b!676896 (= res!443203 (validKeyInArray!0 k!2843))))

(declare-fun b!676897 () Bool)

(assert (=> b!676897 (= e!386013 false)))

(declare-fun lt!312889 () Bool)

(assert (=> b!676897 (= lt!312889 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(assert (= (and start!60352 res!443202) b!676890))

(assert (= (and b!676890 res!443209) b!676886))

(assert (= (and b!676886 res!443205) b!676892))

(assert (= (and b!676892 res!443193) b!676881))

(assert (= (and b!676881 res!443211) b!676882))

(assert (= (and b!676881 (not res!443194)) b!676879))

(assert (= (and b!676879 res!443198) b!676889))

(assert (= (and b!676881 res!443212) b!676885))

(assert (= (and b!676885 res!443197) b!676878))

(assert (= (and b!676878 res!443210) b!676895))

(assert (= (and b!676895 res!443195) b!676896))

(assert (= (and b!676896 res!443203) b!676894))

(assert (= (and b!676894 res!443208) b!676893))

(assert (= (and b!676893 res!443204) b!676888))

(assert (= (and b!676888 res!443199) b!676891))

(assert (= (and b!676891 res!443196) b!676884))

(assert (= (and b!676884 res!443200) b!676883))

(assert (= (and b!676884 (not res!443207)) b!676887))

(assert (= (and b!676887 res!443206) b!676880))

(assert (= (and b!676884 res!443201) b!676897))

(declare-fun m!644077 () Bool)

(assert (=> b!676890 m!644077))

(declare-fun m!644079 () Bool)

(assert (=> b!676885 m!644079))

(declare-fun m!644081 () Bool)

(assert (=> b!676889 m!644081))

(declare-fun m!644083 () Bool)

(assert (=> b!676892 m!644083))

(declare-fun m!644085 () Bool)

(assert (=> b!676878 m!644085))

(assert (=> b!676882 m!644081))

(declare-fun m!644087 () Bool)

(assert (=> b!676888 m!644087))

(assert (=> b!676888 m!644087))

(declare-fun m!644089 () Bool)

(assert (=> b!676888 m!644089))

(assert (=> b!676880 m!644081))

(declare-fun m!644091 () Bool)

(assert (=> start!60352 m!644091))

(assert (=> b!676883 m!644081))

(declare-fun m!644093 () Bool)

(assert (=> b!676894 m!644093))

(declare-fun m!644095 () Bool)

(assert (=> b!676897 m!644095))

(declare-fun m!644097 () Bool)

(assert (=> b!676886 m!644097))

(declare-fun m!644099 () Bool)

(assert (=> b!676896 m!644099))

(push 1)

(assert (not b!676883))

(assert (not b!676885))

(assert (not b!676888))

(assert (not b!676880))

(assert (not start!60352))

(assert (not b!676882))

(assert (not b!676878))

(assert (not b!676890))

(assert (not b!676892))

(assert (not b!676896))

(assert (not b!676886))

(assert (not b!676897))

(assert (not b!676889))

(assert (not b!676894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

