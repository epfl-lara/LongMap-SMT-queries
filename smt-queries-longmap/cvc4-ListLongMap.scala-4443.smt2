; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61764 () Bool)

(assert start!61764)

(declare-fun b!691130 () Bool)

(declare-fun res!455515 () Bool)

(declare-fun e!393411 () Bool)

(assert (=> b!691130 (=> (not res!455515) (not e!393411))))

(declare-fun e!393410 () Bool)

(assert (=> b!691130 (= res!455515 e!393410)))

(declare-fun res!455521 () Bool)

(assert (=> b!691130 (=> res!455521 e!393410)))

(declare-fun e!393407 () Bool)

(assert (=> b!691130 (= res!455521 e!393407)))

(declare-fun res!455519 () Bool)

(assert (=> b!691130 (=> (not res!455519) (not e!393407))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691130 (= res!455519 (bvsgt from!3004 i!1382))))

(declare-fun b!691131 () Bool)

(declare-fun e!393408 () Bool)

(declare-datatypes ((List!13102 0))(
  ( (Nil!13099) (Cons!13098 (h!14143 (_ BitVec 64)) (t!19369 List!13102)) )
))
(declare-fun acc!681 () List!13102)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3679 (List!13102 (_ BitVec 64)) Bool)

(assert (=> b!691131 (= e!393408 (not (contains!3679 acc!681 k!2843)))))

(declare-fun res!455523 () Bool)

(assert (=> start!61764 (=> (not res!455523) (not e!393411))))

(declare-datatypes ((array!39785 0))(
  ( (array!39786 (arr!19061 (Array (_ BitVec 32) (_ BitVec 64))) (size!19446 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39785)

(assert (=> start!61764 (= res!455523 (and (bvslt (size!19446 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19446 a!3626))))))

(assert (=> start!61764 e!393411))

(assert (=> start!61764 true))

(declare-fun array_inv!14857 (array!39785) Bool)

(assert (=> start!61764 (array_inv!14857 a!3626)))

(declare-fun b!691132 () Bool)

(declare-fun res!455510 () Bool)

(assert (=> b!691132 (=> (not res!455510) (not e!393411))))

(assert (=> b!691132 (= res!455510 (not (contains!3679 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691133 () Bool)

(declare-fun res!455518 () Bool)

(assert (=> b!691133 (=> (not res!455518) (not e!393411))))

(assert (=> b!691133 (= res!455518 (not (contains!3679 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691134 () Bool)

(assert (=> b!691134 (= e!393411 (not true))))

(declare-fun arrayContainsKey!0 (array!39785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691134 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!691135 () Bool)

(assert (=> b!691135 (= e!393410 e!393408)))

(declare-fun res!455516 () Bool)

(assert (=> b!691135 (=> (not res!455516) (not e!393408))))

(assert (=> b!691135 (= res!455516 (bvsle from!3004 i!1382))))

(declare-fun b!691136 () Bool)

(declare-fun res!455525 () Bool)

(assert (=> b!691136 (=> (not res!455525) (not e!393411))))

(assert (=> b!691136 (= res!455525 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19446 a!3626))))))

(declare-fun b!691137 () Bool)

(assert (=> b!691137 (= e!393407 (contains!3679 acc!681 k!2843))))

(declare-fun b!691138 () Bool)

(declare-fun res!455517 () Bool)

(assert (=> b!691138 (=> (not res!455517) (not e!393411))))

(assert (=> b!691138 (= res!455517 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19446 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691139 () Bool)

(declare-fun res!455524 () Bool)

(assert (=> b!691139 (=> (not res!455524) (not e!393411))))

(declare-fun arrayNoDuplicates!0 (array!39785 (_ BitVec 32) List!13102) Bool)

(assert (=> b!691139 (= res!455524 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13099))))

(declare-fun b!691140 () Bool)

(declare-fun res!455520 () Bool)

(assert (=> b!691140 (=> (not res!455520) (not e!393411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691140 (= res!455520 (validKeyInArray!0 k!2843))))

(declare-fun b!691141 () Bool)

(declare-fun res!455512 () Bool)

(assert (=> b!691141 (=> (not res!455512) (not e!393411))))

(assert (=> b!691141 (= res!455512 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691142 () Bool)

(declare-fun res!455514 () Bool)

(assert (=> b!691142 (=> (not res!455514) (not e!393411))))

(assert (=> b!691142 (= res!455514 (= (select (arr!19061 a!3626) from!3004) k!2843))))

(declare-fun b!691143 () Bool)

(declare-fun res!455513 () Bool)

(assert (=> b!691143 (=> (not res!455513) (not e!393411))))

(assert (=> b!691143 (= res!455513 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691144 () Bool)

(declare-fun res!455522 () Bool)

(assert (=> b!691144 (=> (not res!455522) (not e!393411))))

(declare-fun noDuplicate!926 (List!13102) Bool)

(assert (=> b!691144 (= res!455522 (noDuplicate!926 acc!681))))

(declare-fun b!691145 () Bool)

(declare-fun res!455511 () Bool)

(assert (=> b!691145 (=> (not res!455511) (not e!393411))))

(assert (=> b!691145 (= res!455511 (validKeyInArray!0 (select (arr!19061 a!3626) from!3004)))))

(assert (= (and start!61764 res!455523) b!691144))

(assert (= (and b!691144 res!455522) b!691133))

(assert (= (and b!691133 res!455518) b!691132))

(assert (= (and b!691132 res!455510) b!691130))

(assert (= (and b!691130 res!455519) b!691137))

(assert (= (and b!691130 (not res!455521)) b!691135))

(assert (= (and b!691135 res!455516) b!691131))

(assert (= (and b!691130 res!455515) b!691139))

(assert (= (and b!691139 res!455524) b!691143))

(assert (= (and b!691143 res!455513) b!691136))

(assert (= (and b!691136 res!455525) b!691140))

(assert (= (and b!691140 res!455520) b!691141))

(assert (= (and b!691141 res!455512) b!691138))

(assert (= (and b!691138 res!455517) b!691145))

(assert (= (and b!691145 res!455511) b!691142))

(assert (= (and b!691142 res!455514) b!691134))

(declare-fun m!654305 () Bool)

(assert (=> b!691132 m!654305))

(declare-fun m!654307 () Bool)

(assert (=> b!691134 m!654307))

(declare-fun m!654309 () Bool)

(assert (=> b!691133 m!654309))

(declare-fun m!654311 () Bool)

(assert (=> b!691137 m!654311))

(assert (=> b!691131 m!654311))

(declare-fun m!654313 () Bool)

(assert (=> b!691139 m!654313))

(declare-fun m!654315 () Bool)

(assert (=> b!691140 m!654315))

(declare-fun m!654317 () Bool)

(assert (=> b!691141 m!654317))

(declare-fun m!654319 () Bool)

(assert (=> b!691145 m!654319))

(assert (=> b!691145 m!654319))

(declare-fun m!654321 () Bool)

(assert (=> b!691145 m!654321))

(declare-fun m!654323 () Bool)

(assert (=> b!691144 m!654323))

(declare-fun m!654325 () Bool)

(assert (=> start!61764 m!654325))

(assert (=> b!691142 m!654319))

(declare-fun m!654327 () Bool)

(assert (=> b!691143 m!654327))

(push 1)

(assert (not b!691133))

(assert (not b!691141))

(assert (not b!691143))

(assert (not b!691134))

(assert (not b!691132))

(assert (not b!691139))

(assert (not b!691145))

(assert (not b!691140))

(assert (not start!61764))

(assert (not b!691137))

(assert (not b!691144))

(assert (not b!691131))

(check-sat)

(pop 1)

