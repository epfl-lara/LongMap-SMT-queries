; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60172 () Bool)

(assert start!60172)

(declare-fun b!670986 () Bool)

(declare-fun e!383615 () Bool)

(declare-datatypes ((List!12716 0))(
  ( (Nil!12713) (Cons!12712 (h!13760 (_ BitVec 64)) (t!18936 List!12716)) )
))
(declare-fun acc!681 () List!12716)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3368 (List!12716 (_ BitVec 64)) Bool)

(assert (=> b!670986 (= e!383615 (not (contains!3368 acc!681 k!2843)))))

(declare-fun b!670987 () Bool)

(declare-fun res!437576 () Bool)

(declare-fun e!383614 () Bool)

(assert (=> b!670987 (=> (not res!437576) (not e!383614))))

(declare-fun e!383613 () Bool)

(assert (=> b!670987 (= res!437576 e!383613)))

(declare-fun res!437575 () Bool)

(assert (=> b!670987 (=> res!437575 e!383613)))

(declare-fun e!383616 () Bool)

(assert (=> b!670987 (= res!437575 e!383616)))

(declare-fun res!437574 () Bool)

(assert (=> b!670987 (=> (not res!437574) (not e!383616))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670987 (= res!437574 (bvsgt from!3004 i!1382))))

(declare-fun b!670988 () Bool)

(declare-fun res!437578 () Bool)

(assert (=> b!670988 (=> (not res!437578) (not e!383614))))

(assert (=> b!670988 (= res!437578 (not (contains!3368 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670989 () Bool)

(assert (=> b!670989 (= e!383613 e!383615)))

(declare-fun res!437570 () Bool)

(assert (=> b!670989 (=> (not res!437570) (not e!383615))))

(assert (=> b!670989 (= res!437570 (bvsle from!3004 i!1382))))

(declare-fun b!670990 () Bool)

(declare-fun res!437577 () Bool)

(assert (=> b!670990 (=> (not res!437577) (not e!383614))))

(declare-datatypes ((array!39157 0))(
  ( (array!39158 (arr!18768 (Array (_ BitVec 32) (_ BitVec 64))) (size!19132 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39157)

(declare-fun arrayNoDuplicates!0 (array!39157 (_ BitVec 32) List!12716) Bool)

(assert (=> b!670990 (= res!437577 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12713))))

(declare-fun b!670991 () Bool)

(declare-fun res!437573 () Bool)

(assert (=> b!670991 (=> (not res!437573) (not e!383614))))

(declare-fun noDuplicate!642 (List!12716) Bool)

(assert (=> b!670991 (= res!437573 (noDuplicate!642 acc!681))))

(declare-fun b!670985 () Bool)

(assert (=> b!670985 (= e!383616 (contains!3368 acc!681 k!2843))))

(declare-fun res!437571 () Bool)

(assert (=> start!60172 (=> (not res!437571) (not e!383614))))

(assert (=> start!60172 (= res!437571 (and (bvslt (size!19132 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19132 a!3626))))))

(assert (=> start!60172 e!383614))

(assert (=> start!60172 true))

(declare-fun array_inv!14627 (array!39157) Bool)

(assert (=> start!60172 (array_inv!14627 a!3626)))

(declare-fun b!670992 () Bool)

(assert (=> b!670992 (= e!383614 false)))

(declare-fun lt!312250 () Bool)

(assert (=> b!670992 (= lt!312250 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670993 () Bool)

(declare-fun res!437572 () Bool)

(assert (=> b!670993 (=> (not res!437572) (not e!383614))))

(assert (=> b!670993 (= res!437572 (not (contains!3368 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60172 res!437571) b!670991))

(assert (= (and b!670991 res!437573) b!670993))

(assert (= (and b!670993 res!437572) b!670988))

(assert (= (and b!670988 res!437578) b!670987))

(assert (= (and b!670987 res!437574) b!670985))

(assert (= (and b!670987 (not res!437575)) b!670989))

(assert (= (and b!670989 res!437570) b!670986))

(assert (= (and b!670987 res!437576) b!670990))

(assert (= (and b!670990 res!437577) b!670992))

(declare-fun m!641285 () Bool)

(assert (=> b!670991 m!641285))

(declare-fun m!641287 () Bool)

(assert (=> start!60172 m!641287))

(declare-fun m!641289 () Bool)

(assert (=> b!670990 m!641289))

(declare-fun m!641291 () Bool)

(assert (=> b!670992 m!641291))

(declare-fun m!641293 () Bool)

(assert (=> b!670986 m!641293))

(assert (=> b!670985 m!641293))

(declare-fun m!641295 () Bool)

(assert (=> b!670993 m!641295))

(declare-fun m!641297 () Bool)

(assert (=> b!670988 m!641297))

(push 1)

(assert (not b!670992))

(assert (not b!670986))

(assert (not b!670990))

(assert (not b!670985))

(assert (not start!60172))

(assert (not b!670991))

(assert (not b!670988))

(assert (not b!670993))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

