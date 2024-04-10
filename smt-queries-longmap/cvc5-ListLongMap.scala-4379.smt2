; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60302 () Bool)

(assert start!60302)

(declare-fun b!676894 () Bool)

(declare-fun e!385974 () Bool)

(declare-datatypes ((List!12908 0))(
  ( (Nil!12905) (Cons!12904 (h!13949 (_ BitVec 64)) (t!19136 List!12908)) )
))
(declare-fun acc!681 () List!12908)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3485 (List!12908 (_ BitVec 64)) Bool)

(assert (=> b!676894 (= e!385974 (not (contains!3485 acc!681 k!2843)))))

(declare-fun b!676895 () Bool)

(declare-fun res!443325 () Bool)

(declare-fun e!385973 () Bool)

(assert (=> b!676895 (=> (not res!443325) (not e!385973))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39349 0))(
  ( (array!39350 (arr!18867 (Array (_ BitVec 32) (_ BitVec 64))) (size!19231 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39349)

(assert (=> b!676895 (= res!443325 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19231 a!3626))))))

(declare-fun b!676896 () Bool)

(declare-fun e!385970 () Bool)

(assert (=> b!676896 (= e!385970 (contains!3485 acc!681 k!2843))))

(declare-fun b!676897 () Bool)

(declare-fun e!385972 () Bool)

(assert (=> b!676897 (= e!385972 (contains!3485 acc!681 k!2843))))

(declare-fun b!676898 () Bool)

(declare-fun res!443328 () Bool)

(assert (=> b!676898 (=> (not res!443328) (not e!385973))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676898 (= res!443328 (not (validKeyInArray!0 (select (arr!18867 a!3626) from!3004))))))

(declare-fun b!676899 () Bool)

(declare-fun res!443326 () Bool)

(assert (=> b!676899 (=> (not res!443326) (not e!385973))))

(declare-fun e!385969 () Bool)

(assert (=> b!676899 (= res!443326 e!385969)))

(declare-fun res!443332 () Bool)

(assert (=> b!676899 (=> res!443332 e!385969)))

(assert (=> b!676899 (= res!443332 e!385972)))

(declare-fun res!443322 () Bool)

(assert (=> b!676899 (=> (not res!443322) (not e!385972))))

(assert (=> b!676899 (= res!443322 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676900 () Bool)

(declare-fun res!443321 () Bool)

(assert (=> b!676900 (=> (not res!443321) (not e!385973))))

(declare-fun noDuplicate!732 (List!12908) Bool)

(assert (=> b!676900 (= res!443321 (noDuplicate!732 acc!681))))

(declare-fun b!676901 () Bool)

(declare-fun e!385967 () Bool)

(assert (=> b!676901 (= e!385967 (not (contains!3485 acc!681 k!2843)))))

(declare-fun res!443337 () Bool)

(assert (=> start!60302 (=> (not res!443337) (not e!385973))))

(assert (=> start!60302 (= res!443337 (and (bvslt (size!19231 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19231 a!3626))))))

(assert (=> start!60302 e!385973))

(assert (=> start!60302 true))

(declare-fun array_inv!14663 (array!39349) Bool)

(assert (=> start!60302 (array_inv!14663 a!3626)))

(declare-fun b!676902 () Bool)

(declare-fun e!385971 () Bool)

(assert (=> b!676902 (= e!385971 e!385967)))

(declare-fun res!443330 () Bool)

(assert (=> b!676902 (=> (not res!443330) (not e!385967))))

(assert (=> b!676902 (= res!443330 (bvsle from!3004 i!1382))))

(declare-fun b!676903 () Bool)

(declare-fun res!443327 () Bool)

(assert (=> b!676903 (=> (not res!443327) (not e!385973))))

(declare-fun arrayNoDuplicates!0 (array!39349 (_ BitVec 32) List!12908) Bool)

(assert (=> b!676903 (= res!443327 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676904 () Bool)

(declare-fun res!443338 () Bool)

(assert (=> b!676904 (=> (not res!443338) (not e!385973))))

(assert (=> b!676904 (= res!443338 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19231 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676905 () Bool)

(declare-fun res!443324 () Bool)

(assert (=> b!676905 (=> (not res!443324) (not e!385973))))

(assert (=> b!676905 (= res!443324 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676906 () Bool)

(declare-fun res!443339 () Bool)

(assert (=> b!676906 (=> (not res!443339) (not e!385973))))

(declare-fun arrayContainsKey!0 (array!39349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676906 (= res!443339 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676907 () Bool)

(assert (=> b!676907 (= e!385969 e!385974)))

(declare-fun res!443333 () Bool)

(assert (=> b!676907 (=> (not res!443333) (not e!385974))))

(assert (=> b!676907 (= res!443333 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676908 () Bool)

(declare-fun res!443329 () Bool)

(assert (=> b!676908 (=> (not res!443329) (not e!385973))))

(assert (=> b!676908 (= res!443329 (not (contains!3485 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676909 () Bool)

(declare-fun res!443336 () Bool)

(assert (=> b!676909 (=> (not res!443336) (not e!385973))))

(assert (=> b!676909 (= res!443336 (validKeyInArray!0 k!2843))))

(declare-fun b!676910 () Bool)

(declare-fun res!443335 () Bool)

(assert (=> b!676910 (=> (not res!443335) (not e!385973))))

(assert (=> b!676910 (= res!443335 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12905))))

(declare-fun b!676911 () Bool)

(assert (=> b!676911 (= e!385973 false)))

(declare-fun lt!312799 () Bool)

(assert (=> b!676911 (= lt!312799 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676912 () Bool)

(declare-fun res!443320 () Bool)

(assert (=> b!676912 (=> (not res!443320) (not e!385973))))

(assert (=> b!676912 (= res!443320 e!385971)))

(declare-fun res!443323 () Bool)

(assert (=> b!676912 (=> res!443323 e!385971)))

(assert (=> b!676912 (= res!443323 e!385970)))

(declare-fun res!443334 () Bool)

(assert (=> b!676912 (=> (not res!443334) (not e!385970))))

(assert (=> b!676912 (= res!443334 (bvsgt from!3004 i!1382))))

(declare-fun b!676913 () Bool)

(declare-fun res!443331 () Bool)

(assert (=> b!676913 (=> (not res!443331) (not e!385973))))

(assert (=> b!676913 (= res!443331 (not (contains!3485 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60302 res!443337) b!676900))

(assert (= (and b!676900 res!443321) b!676908))

(assert (= (and b!676908 res!443329) b!676913))

(assert (= (and b!676913 res!443331) b!676912))

(assert (= (and b!676912 res!443334) b!676896))

(assert (= (and b!676912 (not res!443323)) b!676902))

(assert (= (and b!676902 res!443330) b!676901))

(assert (= (and b!676912 res!443320) b!676910))

(assert (= (and b!676910 res!443335) b!676903))

(assert (= (and b!676903 res!443327) b!676895))

(assert (= (and b!676895 res!443325) b!676909))

(assert (= (and b!676909 res!443336) b!676906))

(assert (= (and b!676906 res!443339) b!676904))

(assert (= (and b!676904 res!443338) b!676898))

(assert (= (and b!676898 res!443328) b!676905))

(assert (= (and b!676905 res!443324) b!676899))

(assert (= (and b!676899 res!443322) b!676897))

(assert (= (and b!676899 (not res!443332)) b!676907))

(assert (= (and b!676907 res!443333) b!676894))

(assert (= (and b!676899 res!443326) b!676911))

(declare-fun m!643475 () Bool)

(assert (=> b!676901 m!643475))

(declare-fun m!643477 () Bool)

(assert (=> b!676898 m!643477))

(assert (=> b!676898 m!643477))

(declare-fun m!643479 () Bool)

(assert (=> b!676898 m!643479))

(assert (=> b!676894 m!643475))

(declare-fun m!643481 () Bool)

(assert (=> b!676903 m!643481))

(assert (=> b!676897 m!643475))

(declare-fun m!643483 () Bool)

(assert (=> b!676909 m!643483))

(declare-fun m!643485 () Bool)

(assert (=> b!676910 m!643485))

(declare-fun m!643487 () Bool)

(assert (=> b!676900 m!643487))

(declare-fun m!643489 () Bool)

(assert (=> start!60302 m!643489))

(declare-fun m!643491 () Bool)

(assert (=> b!676906 m!643491))

(declare-fun m!643493 () Bool)

(assert (=> b!676911 m!643493))

(declare-fun m!643495 () Bool)

(assert (=> b!676908 m!643495))

(assert (=> b!676896 m!643475))

(declare-fun m!643497 () Bool)

(assert (=> b!676913 m!643497))

(push 1)

(assert (not b!676903))

(assert (not b!676908))

(assert (not b!676910))

(assert (not b!676913))

(assert (not b!676901))

(assert (not b!676896))

(assert (not b!676897))

(assert (not b!676911))

(assert (not start!60302))

(assert (not b!676898))

(assert (not b!676906))

(assert (not b!676900))

(assert (not b!676909))

(assert (not b!676894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

