; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63502 () Bool)

(assert start!63502)

(declare-fun b!715190 () Bool)

(declare-fun e!401837 () Bool)

(assert (=> b!715190 (= e!401837 false)))

(declare-datatypes ((array!40516 0))(
  ( (array!40517 (arr!19395 (Array (_ BitVec 32) (_ BitVec 64))) (size!19811 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40516)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun lt!318827 () Bool)

(declare-datatypes ((List!13436 0))(
  ( (Nil!13433) (Cons!13432 (h!14477 (_ BitVec 64)) (t!19751 List!13436)) )
))
(declare-fun acc!652 () List!13436)

(declare-fun arrayNoDuplicates!0 (array!40516 (_ BitVec 32) List!13436) Bool)

(assert (=> b!715190 (= lt!318827 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715191 () Bool)

(declare-fun res!478175 () Bool)

(assert (=> b!715191 (=> (not res!478175) (not e!401837))))

(declare-fun newAcc!49 () List!13436)

(declare-fun noDuplicate!1260 (List!13436) Bool)

(assert (=> b!715191 (= res!478175 (noDuplicate!1260 newAcc!49))))

(declare-fun b!715192 () Bool)

(declare-fun res!478163 () Bool)

(assert (=> b!715192 (=> (not res!478163) (not e!401837))))

(declare-fun subseq!458 (List!13436 List!13436) Bool)

(assert (=> b!715192 (= res!478163 (subseq!458 acc!652 newAcc!49))))

(declare-fun b!715193 () Bool)

(declare-fun res!478162 () Bool)

(assert (=> b!715193 (=> (not res!478162) (not e!401837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715193 (= res!478162 (not (validKeyInArray!0 (select (arr!19395 a!3591) from!2969))))))

(declare-fun b!715194 () Bool)

(declare-fun res!478173 () Bool)

(assert (=> b!715194 (=> (not res!478173) (not e!401837))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!423 (List!13436 (_ BitVec 64)) List!13436)

(assert (=> b!715194 (= res!478173 (= (-!423 newAcc!49 k!2824) acc!652))))

(declare-fun b!715195 () Bool)

(declare-fun res!478172 () Bool)

(assert (=> b!715195 (=> (not res!478172) (not e!401837))))

(declare-fun arrayContainsKey!0 (array!40516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715195 (= res!478172 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!715196 () Bool)

(declare-fun res!478171 () Bool)

(assert (=> b!715196 (=> (not res!478171) (not e!401837))))

(assert (=> b!715196 (= res!478171 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19811 a!3591)))))

(declare-fun res!478174 () Bool)

(assert (=> start!63502 (=> (not res!478174) (not e!401837))))

(assert (=> start!63502 (= res!478174 (and (bvslt (size!19811 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19811 a!3591))))))

(assert (=> start!63502 e!401837))

(assert (=> start!63502 true))

(declare-fun array_inv!15191 (array!40516) Bool)

(assert (=> start!63502 (array_inv!15191 a!3591)))

(declare-fun b!715197 () Bool)

(declare-fun res!478166 () Bool)

(assert (=> b!715197 (=> (not res!478166) (not e!401837))))

(assert (=> b!715197 (= res!478166 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715198 () Bool)

(declare-fun res!478165 () Bool)

(assert (=> b!715198 (=> (not res!478165) (not e!401837))))

(declare-fun contains!4013 (List!13436 (_ BitVec 64)) Bool)

(assert (=> b!715198 (= res!478165 (not (contains!4013 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715199 () Bool)

(declare-fun res!478164 () Bool)

(assert (=> b!715199 (=> (not res!478164) (not e!401837))))

(assert (=> b!715199 (= res!478164 (not (contains!4013 acc!652 k!2824)))))

(declare-fun b!715200 () Bool)

(declare-fun res!478169 () Bool)

(assert (=> b!715200 (=> (not res!478169) (not e!401837))))

(assert (=> b!715200 (= res!478169 (not (contains!4013 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715201 () Bool)

(declare-fun res!478176 () Bool)

(assert (=> b!715201 (=> (not res!478176) (not e!401837))))

(assert (=> b!715201 (= res!478176 (noDuplicate!1260 acc!652))))

(declare-fun b!715202 () Bool)

(declare-fun res!478177 () Bool)

(assert (=> b!715202 (=> (not res!478177) (not e!401837))))

(assert (=> b!715202 (= res!478177 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715203 () Bool)

(declare-fun res!478168 () Bool)

(assert (=> b!715203 (=> (not res!478168) (not e!401837))))

(assert (=> b!715203 (= res!478168 (not (contains!4013 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715204 () Bool)

(declare-fun res!478160 () Bool)

(assert (=> b!715204 (=> (not res!478160) (not e!401837))))

(assert (=> b!715204 (= res!478160 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715205 () Bool)

(declare-fun res!478170 () Bool)

(assert (=> b!715205 (=> (not res!478170) (not e!401837))))

(assert (=> b!715205 (= res!478170 (validKeyInArray!0 k!2824))))

(declare-fun b!715206 () Bool)

(declare-fun res!478161 () Bool)

(assert (=> b!715206 (=> (not res!478161) (not e!401837))))

(assert (=> b!715206 (= res!478161 (not (contains!4013 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715207 () Bool)

(declare-fun res!478167 () Bool)

(assert (=> b!715207 (=> (not res!478167) (not e!401837))))

(assert (=> b!715207 (= res!478167 (contains!4013 newAcc!49 k!2824))))

(assert (= (and start!63502 res!478174) b!715201))

(assert (= (and b!715201 res!478176) b!715191))

(assert (= (and b!715191 res!478175) b!715200))

(assert (= (and b!715200 res!478169) b!715198))

(assert (= (and b!715198 res!478165) b!715195))

(assert (= (and b!715195 res!478172) b!715199))

(assert (= (and b!715199 res!478164) b!715205))

(assert (= (and b!715205 res!478170) b!715197))

(assert (= (and b!715197 res!478166) b!715192))

(assert (= (and b!715192 res!478163) b!715207))

(assert (= (and b!715207 res!478167) b!715194))

(assert (= (and b!715194 res!478173) b!715203))

(assert (= (and b!715203 res!478168) b!715206))

(assert (= (and b!715206 res!478161) b!715196))

(assert (= (and b!715196 res!478171) b!715193))

(assert (= (and b!715193 res!478162) b!715202))

(assert (= (and b!715202 res!478177) b!715204))

(assert (= (and b!715204 res!478160) b!715190))

(declare-fun m!671515 () Bool)

(assert (=> b!715200 m!671515))

(declare-fun m!671517 () Bool)

(assert (=> b!715206 m!671517))

(declare-fun m!671519 () Bool)

(assert (=> b!715193 m!671519))

(assert (=> b!715193 m!671519))

(declare-fun m!671521 () Bool)

(assert (=> b!715193 m!671521))

(declare-fun m!671523 () Bool)

(assert (=> b!715195 m!671523))

(declare-fun m!671525 () Bool)

(assert (=> b!715197 m!671525))

(declare-fun m!671527 () Bool)

(assert (=> b!715191 m!671527))

(declare-fun m!671529 () Bool)

(assert (=> b!715190 m!671529))

(declare-fun m!671531 () Bool)

(assert (=> b!715201 m!671531))

(declare-fun m!671533 () Bool)

(assert (=> start!63502 m!671533))

(declare-fun m!671535 () Bool)

(assert (=> b!715204 m!671535))

(declare-fun m!671537 () Bool)

(assert (=> b!715199 m!671537))

(declare-fun m!671539 () Bool)

(assert (=> b!715192 m!671539))

(declare-fun m!671541 () Bool)

(assert (=> b!715207 m!671541))

(declare-fun m!671543 () Bool)

(assert (=> b!715194 m!671543))

(declare-fun m!671545 () Bool)

(assert (=> b!715198 m!671545))

(declare-fun m!671547 () Bool)

(assert (=> b!715205 m!671547))

(declare-fun m!671549 () Bool)

(assert (=> b!715203 m!671549))

(push 1)

(assert (not b!715199))

(assert (not b!715206))

(assert (not start!63502))

(assert (not b!715194))

(assert (not b!715204))

(assert (not b!715191))

(assert (not b!715198))

(assert (not b!715201))

(assert (not b!715190))

(assert (not b!715195))

(assert (not b!715205))

(assert (not b!715207))

(assert (not b!715203))

(assert (not b!715193))

(assert (not b!715192))

(assert (not b!715197))

(assert (not b!715200))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

