; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60272 () Bool)

(assert start!60272)

(declare-fun res!442422 () Bool)

(declare-fun e!385613 () Bool)

(assert (=> start!60272 (=> (not res!442422) (not e!385613))))

(declare-datatypes ((array!39319 0))(
  ( (array!39320 (arr!18852 (Array (_ BitVec 32) (_ BitVec 64))) (size!19216 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39319)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60272 (= res!442422 (and (bvslt (size!19216 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19216 a!3626))))))

(assert (=> start!60272 e!385613))

(assert (=> start!60272 true))

(declare-fun array_inv!14648 (array!39319) Bool)

(assert (=> start!60272 (array_inv!14648 a!3626)))

(declare-fun b!675994 () Bool)

(declare-fun res!442436 () Bool)

(assert (=> b!675994 (=> (not res!442436) (not e!385613))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675994 (= res!442436 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675995 () Bool)

(declare-fun res!442427 () Bool)

(assert (=> b!675995 (=> (not res!442427) (not e!385613))))

(declare-fun e!385612 () Bool)

(assert (=> b!675995 (= res!442427 e!385612)))

(declare-fun res!442421 () Bool)

(assert (=> b!675995 (=> res!442421 e!385612)))

(declare-fun e!385609 () Bool)

(assert (=> b!675995 (= res!442421 e!385609)))

(declare-fun res!442437 () Bool)

(assert (=> b!675995 (=> (not res!442437) (not e!385609))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675995 (= res!442437 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675996 () Bool)

(declare-fun e!385608 () Bool)

(declare-datatypes ((List!12893 0))(
  ( (Nil!12890) (Cons!12889 (h!13934 (_ BitVec 64)) (t!19121 List!12893)) )
))
(declare-fun acc!681 () List!12893)

(declare-fun contains!3470 (List!12893 (_ BitVec 64)) Bool)

(assert (=> b!675996 (= e!385608 (not (contains!3470 acc!681 k!2843)))))

(declare-fun b!675997 () Bool)

(declare-fun e!385607 () Bool)

(assert (=> b!675997 (= e!385607 (not (contains!3470 acc!681 k!2843)))))

(declare-fun b!675998 () Bool)

(declare-fun res!442426 () Bool)

(assert (=> b!675998 (=> (not res!442426) (not e!385613))))

(assert (=> b!675998 (= res!442426 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675999 () Bool)

(declare-fun res!442432 () Bool)

(assert (=> b!675999 (=> (not res!442432) (not e!385613))))

(declare-fun noDuplicate!717 (List!12893) Bool)

(assert (=> b!675999 (= res!442432 (noDuplicate!717 acc!681))))

(declare-fun b!676000 () Bool)

(declare-fun e!385611 () Bool)

(assert (=> b!676000 (= e!385611 (contains!3470 acc!681 k!2843))))

(declare-fun b!676001 () Bool)

(declare-fun res!442435 () Bool)

(assert (=> b!676001 (=> (not res!442435) (not e!385613))))

(declare-fun e!385614 () Bool)

(assert (=> b!676001 (= res!442435 e!385614)))

(declare-fun res!442420 () Bool)

(assert (=> b!676001 (=> res!442420 e!385614)))

(assert (=> b!676001 (= res!442420 e!385611)))

(declare-fun res!442425 () Bool)

(assert (=> b!676001 (=> (not res!442425) (not e!385611))))

(assert (=> b!676001 (= res!442425 (bvsgt from!3004 i!1382))))

(declare-fun b!676002 () Bool)

(assert (=> b!676002 (= e!385609 (contains!3470 acc!681 k!2843))))

(declare-fun b!676003 () Bool)

(declare-fun res!442438 () Bool)

(assert (=> b!676003 (=> (not res!442438) (not e!385613))))

(declare-fun arrayNoDuplicates!0 (array!39319 (_ BitVec 32) List!12893) Bool)

(assert (=> b!676003 (= res!442438 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12890))))

(declare-fun b!676004 () Bool)

(assert (=> b!676004 (= e!385614 e!385607)))

(declare-fun res!442429 () Bool)

(assert (=> b!676004 (=> (not res!442429) (not e!385607))))

(assert (=> b!676004 (= res!442429 (bvsle from!3004 i!1382))))

(declare-fun b!676005 () Bool)

(declare-fun res!442439 () Bool)

(assert (=> b!676005 (=> (not res!442439) (not e!385613))))

(assert (=> b!676005 (= res!442439 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676006 () Bool)

(declare-fun res!442424 () Bool)

(assert (=> b!676006 (=> (not res!442424) (not e!385613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676006 (= res!442424 (validKeyInArray!0 k!2843))))

(declare-fun b!676007 () Bool)

(assert (=> b!676007 (= e!385613 false)))

(declare-fun lt!312754 () Bool)

(assert (=> b!676007 (= lt!312754 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676008 () Bool)

(assert (=> b!676008 (= e!385612 e!385608)))

(declare-fun res!442434 () Bool)

(assert (=> b!676008 (=> (not res!442434) (not e!385608))))

(assert (=> b!676008 (= res!442434 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676009 () Bool)

(declare-fun res!442423 () Bool)

(assert (=> b!676009 (=> (not res!442423) (not e!385613))))

(assert (=> b!676009 (= res!442423 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19216 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676010 () Bool)

(declare-fun res!442433 () Bool)

(assert (=> b!676010 (=> (not res!442433) (not e!385613))))

(assert (=> b!676010 (= res!442433 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19216 a!3626))))))

(declare-fun b!676011 () Bool)

(declare-fun res!442430 () Bool)

(assert (=> b!676011 (=> (not res!442430) (not e!385613))))

(assert (=> b!676011 (= res!442430 (not (contains!3470 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676012 () Bool)

(declare-fun res!442431 () Bool)

(assert (=> b!676012 (=> (not res!442431) (not e!385613))))

(assert (=> b!676012 (= res!442431 (not (validKeyInArray!0 (select (arr!18852 a!3626) from!3004))))))

(declare-fun b!676013 () Bool)

(declare-fun res!442428 () Bool)

(assert (=> b!676013 (=> (not res!442428) (not e!385613))))

(assert (=> b!676013 (= res!442428 (not (contains!3470 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60272 res!442422) b!675999))

(assert (= (and b!675999 res!442432) b!676011))

(assert (= (and b!676011 res!442430) b!676013))

(assert (= (and b!676013 res!442428) b!676001))

(assert (= (and b!676001 res!442425) b!676000))

(assert (= (and b!676001 (not res!442420)) b!676004))

(assert (= (and b!676004 res!442429) b!675997))

(assert (= (and b!676001 res!442435) b!676003))

(assert (= (and b!676003 res!442438) b!676005))

(assert (= (and b!676005 res!442439) b!676010))

(assert (= (and b!676010 res!442433) b!676006))

(assert (= (and b!676006 res!442424) b!675994))

(assert (= (and b!675994 res!442436) b!676009))

(assert (= (and b!676009 res!442423) b!676012))

(assert (= (and b!676012 res!442431) b!675998))

(assert (= (and b!675998 res!442426) b!675995))

(assert (= (and b!675995 res!442437) b!676002))

(assert (= (and b!675995 (not res!442421)) b!676008))

(assert (= (and b!676008 res!442434) b!675996))

(assert (= (and b!675995 res!442427) b!676007))

(declare-fun m!643115 () Bool)

(assert (=> b!676000 m!643115))

(declare-fun m!643117 () Bool)

(assert (=> b!675994 m!643117))

(declare-fun m!643119 () Bool)

(assert (=> b!676005 m!643119))

(declare-fun m!643121 () Bool)

(assert (=> start!60272 m!643121))

(declare-fun m!643123 () Bool)

(assert (=> b!676006 m!643123))

(assert (=> b!675997 m!643115))

(declare-fun m!643125 () Bool)

(assert (=> b!676013 m!643125))

(assert (=> b!675996 m!643115))

(declare-fun m!643127 () Bool)

(assert (=> b!676007 m!643127))

(declare-fun m!643129 () Bool)

(assert (=> b!676012 m!643129))

(assert (=> b!676012 m!643129))

(declare-fun m!643131 () Bool)

(assert (=> b!676012 m!643131))

(assert (=> b!676002 m!643115))

(declare-fun m!643133 () Bool)

(assert (=> b!675999 m!643133))

(declare-fun m!643135 () Bool)

(assert (=> b!676011 m!643135))

(declare-fun m!643137 () Bool)

(assert (=> b!676003 m!643137))

(push 1)

(assert (not b!675999))

(assert (not b!676013))

(assert (not b!675997))

(assert (not b!676000))

(assert (not start!60272))

(assert (not b!675996))

(assert (not b!676002))

(assert (not b!676003))

(assert (not b!675994))

(assert (not b!676011))

(assert (not b!676005))

(assert (not b!676006))

(assert (not b!676007))

(assert (not b!676012))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

