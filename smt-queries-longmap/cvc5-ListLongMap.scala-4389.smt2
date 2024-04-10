; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60362 () Bool)

(assert start!60362)

(declare-fun b!678329 () Bool)

(declare-fun e!386557 () Bool)

(declare-datatypes ((array!39409 0))(
  ( (array!39410 (arr!18897 (Array (_ BitVec 32) (_ BitVec 64))) (size!19261 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39409)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!678329 (= e!386557 (bvslt (bvsub (size!19261 a!3626) from!3004) #b00000000000000000000000000000000))))

(declare-fun b!678330 () Bool)

(declare-fun res!444743 () Bool)

(assert (=> b!678330 (=> (not res!444743) (not e!386557))))

(declare-fun e!386555 () Bool)

(assert (=> b!678330 (= res!444743 e!386555)))

(declare-fun res!444747 () Bool)

(assert (=> b!678330 (=> res!444747 e!386555)))

(declare-fun e!386559 () Bool)

(assert (=> b!678330 (= res!444747 e!386559)))

(declare-fun res!444745 () Bool)

(assert (=> b!678330 (=> (not res!444745) (not e!386559))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678330 (= res!444745 (bvsgt from!3004 i!1382))))

(declare-fun b!678331 () Bool)

(declare-fun res!444737 () Bool)

(assert (=> b!678331 (=> (not res!444737) (not e!386557))))

(declare-datatypes ((List!12938 0))(
  ( (Nil!12935) (Cons!12934 (h!13979 (_ BitVec 64)) (t!19166 List!12938)) )
))
(declare-fun acc!681 () List!12938)

(declare-fun arrayNoDuplicates!0 (array!39409 (_ BitVec 32) List!12938) Bool)

(assert (=> b!678331 (= res!444737 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678333 () Bool)

(declare-fun res!444738 () Bool)

(assert (=> b!678333 (=> (not res!444738) (not e!386557))))

(assert (=> b!678333 (= res!444738 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12935))))

(declare-fun b!678334 () Bool)

(declare-fun res!444739 () Bool)

(assert (=> b!678334 (=> (not res!444739) (not e!386557))))

(declare-fun contains!3515 (List!12938 (_ BitVec 64)) Bool)

(assert (=> b!678334 (= res!444739 (not (contains!3515 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678335 () Bool)

(declare-fun res!444748 () Bool)

(assert (=> b!678335 (=> (not res!444748) (not e!386557))))

(declare-fun noDuplicate!762 (List!12938) Bool)

(assert (=> b!678335 (= res!444748 (noDuplicate!762 acc!681))))

(declare-fun b!678336 () Bool)

(declare-fun res!444749 () Bool)

(assert (=> b!678336 (=> (not res!444749) (not e!386557))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678336 (= res!444749 (validKeyInArray!0 k!2843))))

(declare-fun b!678337 () Bool)

(declare-fun res!444746 () Bool)

(assert (=> b!678337 (=> (not res!444746) (not e!386557))))

(assert (=> b!678337 (= res!444746 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19261 a!3626))))))

(declare-fun b!678338 () Bool)

(declare-fun e!386556 () Bool)

(assert (=> b!678338 (= e!386555 e!386556)))

(declare-fun res!444742 () Bool)

(assert (=> b!678338 (=> (not res!444742) (not e!386556))))

(assert (=> b!678338 (= res!444742 (bvsle from!3004 i!1382))))

(declare-fun b!678339 () Bool)

(declare-fun res!444740 () Bool)

(assert (=> b!678339 (=> (not res!444740) (not e!386557))))

(assert (=> b!678339 (= res!444740 (not (contains!3515 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!444741 () Bool)

(assert (=> start!60362 (=> (not res!444741) (not e!386557))))

(assert (=> start!60362 (= res!444741 (and (bvslt (size!19261 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19261 a!3626))))))

(assert (=> start!60362 e!386557))

(assert (=> start!60362 true))

(declare-fun array_inv!14693 (array!39409) Bool)

(assert (=> start!60362 (array_inv!14693 a!3626)))

(declare-fun b!678332 () Bool)

(assert (=> b!678332 (= e!386556 (not (contains!3515 acc!681 k!2843)))))

(declare-fun b!678340 () Bool)

(assert (=> b!678340 (= e!386559 (contains!3515 acc!681 k!2843))))

(declare-fun b!678341 () Bool)

(declare-fun res!444744 () Bool)

(assert (=> b!678341 (=> (not res!444744) (not e!386557))))

(declare-fun arrayContainsKey!0 (array!39409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678341 (= res!444744 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60362 res!444741) b!678335))

(assert (= (and b!678335 res!444748) b!678339))

(assert (= (and b!678339 res!444740) b!678334))

(assert (= (and b!678334 res!444739) b!678330))

(assert (= (and b!678330 res!444745) b!678340))

(assert (= (and b!678330 (not res!444747)) b!678338))

(assert (= (and b!678338 res!444742) b!678332))

(assert (= (and b!678330 res!444743) b!678333))

(assert (= (and b!678333 res!444738) b!678331))

(assert (= (and b!678331 res!444737) b!678337))

(assert (= (and b!678337 res!444746) b!678336))

(assert (= (and b!678336 res!444749) b!678341))

(assert (= (and b!678341 res!444744) b!678329))

(declare-fun m!644165 () Bool)

(assert (=> b!678332 m!644165))

(declare-fun m!644167 () Bool)

(assert (=> b!678335 m!644167))

(declare-fun m!644169 () Bool)

(assert (=> b!678334 m!644169))

(declare-fun m!644171 () Bool)

(assert (=> b!678336 m!644171))

(declare-fun m!644173 () Bool)

(assert (=> start!60362 m!644173))

(assert (=> b!678340 m!644165))

(declare-fun m!644175 () Bool)

(assert (=> b!678341 m!644175))

(declare-fun m!644177 () Bool)

(assert (=> b!678333 m!644177))

(declare-fun m!644179 () Bool)

(assert (=> b!678339 m!644179))

(declare-fun m!644181 () Bool)

(assert (=> b!678331 m!644181))

(push 1)

(assert (not b!678340))

(assert (not b!678333))

(assert (not b!678339))

(assert (not b!678331))

(assert (not start!60362))

(assert (not b!678332))

(assert (not b!678341))

(assert (not b!678334))

(assert (not b!678335))

(assert (not b!678336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

