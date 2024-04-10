; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60278 () Bool)

(assert start!60278)

(declare-fun b!676174 () Bool)

(declare-fun res!442613 () Bool)

(declare-fun e!385680 () Bool)

(assert (=> b!676174 (=> (not res!442613) (not e!385680))))

(declare-datatypes ((List!12896 0))(
  ( (Nil!12893) (Cons!12892 (h!13937 (_ BitVec 64)) (t!19124 List!12896)) )
))
(declare-fun acc!681 () List!12896)

(declare-fun noDuplicate!720 (List!12896) Bool)

(assert (=> b!676174 (= res!442613 (noDuplicate!720 acc!681))))

(declare-fun b!676175 () Bool)

(declare-fun res!442608 () Bool)

(assert (=> b!676175 (=> (not res!442608) (not e!385680))))

(declare-fun e!385681 () Bool)

(assert (=> b!676175 (= res!442608 e!385681)))

(declare-fun res!442615 () Bool)

(assert (=> b!676175 (=> res!442615 e!385681)))

(declare-fun e!385684 () Bool)

(assert (=> b!676175 (= res!442615 e!385684)))

(declare-fun res!442602 () Bool)

(assert (=> b!676175 (=> (not res!442602) (not e!385684))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676175 (= res!442602 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676176 () Bool)

(declare-fun res!442603 () Bool)

(assert (=> b!676176 (=> (not res!442603) (not e!385680))))

(declare-fun e!385682 () Bool)

(assert (=> b!676176 (= res!442603 e!385682)))

(declare-fun res!442612 () Bool)

(assert (=> b!676176 (=> res!442612 e!385682)))

(declare-fun e!385685 () Bool)

(assert (=> b!676176 (= res!442612 e!385685)))

(declare-fun res!442614 () Bool)

(assert (=> b!676176 (=> (not res!442614) (not e!385685))))

(assert (=> b!676176 (= res!442614 (bvsgt from!3004 i!1382))))

(declare-fun b!676177 () Bool)

(declare-fun e!385686 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3473 (List!12896 (_ BitVec 64)) Bool)

(assert (=> b!676177 (= e!385686 (not (contains!3473 acc!681 k!2843)))))

(declare-fun b!676178 () Bool)

(declare-fun res!442606 () Bool)

(assert (=> b!676178 (=> (not res!442606) (not e!385680))))

(declare-datatypes ((array!39325 0))(
  ( (array!39326 (arr!18855 (Array (_ BitVec 32) (_ BitVec 64))) (size!19219 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39325)

(assert (=> b!676178 (= res!442606 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19219 a!3626))))))

(declare-fun b!676179 () Bool)

(assert (=> b!676179 (= e!385681 e!385686)))

(declare-fun res!442610 () Bool)

(assert (=> b!676179 (=> (not res!442610) (not e!385686))))

(assert (=> b!676179 (= res!442610 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676180 () Bool)

(declare-fun res!442601 () Bool)

(assert (=> b!676180 (=> (not res!442601) (not e!385680))))

(assert (=> b!676180 (= res!442601 (not (contains!3473 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676181 () Bool)

(declare-fun res!442619 () Bool)

(assert (=> b!676181 (=> (not res!442619) (not e!385680))))

(declare-fun arrayNoDuplicates!0 (array!39325 (_ BitVec 32) List!12896) Bool)

(assert (=> b!676181 (= res!442619 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12893))))

(declare-fun res!442611 () Bool)

(assert (=> start!60278 (=> (not res!442611) (not e!385680))))

(assert (=> start!60278 (= res!442611 (and (bvslt (size!19219 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19219 a!3626))))))

(assert (=> start!60278 e!385680))

(assert (=> start!60278 true))

(declare-fun array_inv!14651 (array!39325) Bool)

(assert (=> start!60278 (array_inv!14651 a!3626)))

(declare-fun b!676182 () Bool)

(assert (=> b!676182 (= e!385684 (contains!3473 acc!681 k!2843))))

(declare-fun b!676183 () Bool)

(declare-fun res!442600 () Bool)

(assert (=> b!676183 (=> (not res!442600) (not e!385680))))

(assert (=> b!676183 (= res!442600 (not (contains!3473 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676184 () Bool)

(declare-fun res!442609 () Bool)

(assert (=> b!676184 (=> (not res!442609) (not e!385680))))

(declare-fun arrayContainsKey!0 (array!39325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676184 (= res!442609 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676185 () Bool)

(declare-fun res!442604 () Bool)

(assert (=> b!676185 (=> (not res!442604) (not e!385680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676185 (= res!442604 (not (validKeyInArray!0 (select (arr!18855 a!3626) from!3004))))))

(declare-fun b!676186 () Bool)

(declare-fun e!385683 () Bool)

(assert (=> b!676186 (= e!385682 e!385683)))

(declare-fun res!442607 () Bool)

(assert (=> b!676186 (=> (not res!442607) (not e!385683))))

(assert (=> b!676186 (= res!442607 (bvsle from!3004 i!1382))))

(declare-fun b!676187 () Bool)

(declare-fun res!442617 () Bool)

(assert (=> b!676187 (=> (not res!442617) (not e!385680))))

(assert (=> b!676187 (= res!442617 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676188 () Bool)

(declare-fun res!442616 () Bool)

(assert (=> b!676188 (=> (not res!442616) (not e!385680))))

(assert (=> b!676188 (= res!442616 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676189 () Bool)

(declare-fun res!442605 () Bool)

(assert (=> b!676189 (=> (not res!442605) (not e!385680))))

(assert (=> b!676189 (= res!442605 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19219 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676190 () Bool)

(assert (=> b!676190 (= e!385680 false)))

(declare-fun lt!312763 () Bool)

(assert (=> b!676190 (= lt!312763 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676191 () Bool)

(assert (=> b!676191 (= e!385683 (not (contains!3473 acc!681 k!2843)))))

(declare-fun b!676192 () Bool)

(declare-fun res!442618 () Bool)

(assert (=> b!676192 (=> (not res!442618) (not e!385680))))

(assert (=> b!676192 (= res!442618 (validKeyInArray!0 k!2843))))

(declare-fun b!676193 () Bool)

(assert (=> b!676193 (= e!385685 (contains!3473 acc!681 k!2843))))

(assert (= (and start!60278 res!442611) b!676174))

(assert (= (and b!676174 res!442613) b!676183))

(assert (= (and b!676183 res!442600) b!676180))

(assert (= (and b!676180 res!442601) b!676176))

(assert (= (and b!676176 res!442614) b!676193))

(assert (= (and b!676176 (not res!442612)) b!676186))

(assert (= (and b!676186 res!442607) b!676191))

(assert (= (and b!676176 res!442603) b!676181))

(assert (= (and b!676181 res!442619) b!676187))

(assert (= (and b!676187 res!442617) b!676178))

(assert (= (and b!676178 res!442606) b!676192))

(assert (= (and b!676192 res!442618) b!676184))

(assert (= (and b!676184 res!442609) b!676189))

(assert (= (and b!676189 res!442605) b!676185))

(assert (= (and b!676185 res!442604) b!676188))

(assert (= (and b!676188 res!442616) b!676175))

(assert (= (and b!676175 res!442602) b!676182))

(assert (= (and b!676175 (not res!442615)) b!676179))

(assert (= (and b!676179 res!442610) b!676177))

(assert (= (and b!676175 res!442608) b!676190))

(declare-fun m!643187 () Bool)

(assert (=> b!676192 m!643187))

(declare-fun m!643189 () Bool)

(assert (=> b!676182 m!643189))

(declare-fun m!643191 () Bool)

(assert (=> b!676183 m!643191))

(declare-fun m!643193 () Bool)

(assert (=> start!60278 m!643193))

(declare-fun m!643195 () Bool)

(assert (=> b!676187 m!643195))

(declare-fun m!643197 () Bool)

(assert (=> b!676181 m!643197))

(declare-fun m!643199 () Bool)

(assert (=> b!676180 m!643199))

(assert (=> b!676193 m!643189))

(declare-fun m!643201 () Bool)

(assert (=> b!676174 m!643201))

(declare-fun m!643203 () Bool)

(assert (=> b!676185 m!643203))

(assert (=> b!676185 m!643203))

(declare-fun m!643205 () Bool)

(assert (=> b!676185 m!643205))

(assert (=> b!676177 m!643189))

(assert (=> b!676191 m!643189))

(declare-fun m!643207 () Bool)

(assert (=> b!676184 m!643207))

(declare-fun m!643209 () Bool)

(assert (=> b!676190 m!643209))

(push 1)

(assert (not b!676184))

(assert (not b!676180))

(assert (not b!676190))

(assert (not b!676185))

(assert (not b!676183))

(assert (not b!676193))

(assert (not b!676192))

(assert (not b!676191))

(assert (not b!676182))

(assert (not b!676174))

(assert (not b!676187))

(assert (not b!676181))

(assert (not b!676177))

(assert (not start!60278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

