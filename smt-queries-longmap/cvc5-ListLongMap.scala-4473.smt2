; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62222 () Bool)

(assert start!62222)

(declare-fun b!697239 () Bool)

(declare-fun res!461159 () Bool)

(declare-fun e!396372 () Bool)

(assert (=> b!697239 (=> (not res!461159) (not e!396372))))

(declare-datatypes ((array!39979 0))(
  ( (array!39980 (arr!19149 (Array (_ BitVec 32) (_ BitVec 64))) (size!19534 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39979)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697239 (= res!461159 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!697240 () Bool)

(declare-fun res!461157 () Bool)

(assert (=> b!697240 (=> (not res!461157) (not e!396372))))

(declare-fun e!396375 () Bool)

(assert (=> b!697240 (= res!461157 e!396375)))

(declare-fun res!461162 () Bool)

(assert (=> b!697240 (=> res!461162 e!396375)))

(declare-fun e!396368 () Bool)

(assert (=> b!697240 (= res!461162 e!396368)))

(declare-fun res!461169 () Bool)

(assert (=> b!697240 (=> (not res!461169) (not e!396368))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!697240 (= res!461169 (bvsgt from!3004 i!1382))))

(declare-fun b!697241 () Bool)

(declare-fun res!461160 () Bool)

(assert (=> b!697241 (=> (not res!461160) (not e!396372))))

(declare-datatypes ((List!13190 0))(
  ( (Nil!13187) (Cons!13186 (h!14231 (_ BitVec 64)) (t!19472 List!13190)) )
))
(declare-fun acc!681 () List!13190)

(declare-fun contains!3767 (List!13190 (_ BitVec 64)) Bool)

(assert (=> b!697241 (= res!461160 (not (contains!3767 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697242 () Bool)

(declare-fun res!461171 () Bool)

(assert (=> b!697242 (=> (not res!461171) (not e!396372))))

(declare-fun arrayNoDuplicates!0 (array!39979 (_ BitVec 32) List!13190) Bool)

(assert (=> b!697242 (= res!461171 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13187))))

(declare-fun res!461170 () Bool)

(assert (=> start!62222 (=> (not res!461170) (not e!396372))))

(assert (=> start!62222 (= res!461170 (and (bvslt (size!19534 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19534 a!3626))))))

(assert (=> start!62222 e!396372))

(assert (=> start!62222 true))

(declare-fun array_inv!14945 (array!39979) Bool)

(assert (=> start!62222 (array_inv!14945 a!3626)))

(declare-fun b!697243 () Bool)

(declare-fun e!396371 () Bool)

(assert (=> b!697243 (= e!396375 e!396371)))

(declare-fun res!461158 () Bool)

(assert (=> b!697243 (=> (not res!461158) (not e!396371))))

(assert (=> b!697243 (= res!461158 (bvsle from!3004 i!1382))))

(declare-fun b!697244 () Bool)

(assert (=> b!697244 (= e!396371 (not (contains!3767 acc!681 k!2843)))))

(declare-fun b!697245 () Bool)

(declare-fun res!461165 () Bool)

(assert (=> b!697245 (=> (not res!461165) (not e!396372))))

(declare-fun noDuplicate!1014 (List!13190) Bool)

(assert (=> b!697245 (= res!461165 (noDuplicate!1014 acc!681))))

(declare-fun b!697246 () Bool)

(declare-fun res!461167 () Bool)

(assert (=> b!697246 (=> (not res!461167) (not e!396372))))

(assert (=> b!697246 (= res!461167 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697247 () Bool)

(declare-fun res!461164 () Bool)

(assert (=> b!697247 (=> (not res!461164) (not e!396372))))

(assert (=> b!697247 (= res!461164 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19534 a!3626))))))

(declare-fun b!697248 () Bool)

(declare-fun res!461168 () Bool)

(assert (=> b!697248 (=> (not res!461168) (not e!396372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697248 (= res!461168 (not (validKeyInArray!0 (select (arr!19149 a!3626) from!3004))))))

(declare-fun b!697249 () Bool)

(declare-fun res!461174 () Bool)

(assert (=> b!697249 (=> (not res!461174) (not e!396372))))

(assert (=> b!697249 (= res!461174 (not (contains!3767 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697250 () Bool)

(declare-fun res!461161 () Bool)

(assert (=> b!697250 (=> (not res!461161) (not e!396372))))

(assert (=> b!697250 (= res!461161 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697251 () Bool)

(declare-fun res!461176 () Bool)

(assert (=> b!697251 (=> (not res!461176) (not e!396372))))

(declare-fun e!396374 () Bool)

(assert (=> b!697251 (= res!461176 e!396374)))

(declare-fun res!461175 () Bool)

(assert (=> b!697251 (=> res!461175 e!396374)))

(declare-fun e!396369 () Bool)

(assert (=> b!697251 (= res!461175 e!396369)))

(declare-fun res!461172 () Bool)

(assert (=> b!697251 (=> (not res!461172) (not e!396369))))

(assert (=> b!697251 (= res!461172 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697252 () Bool)

(assert (=> b!697252 (= e!396372 (not true))))

(assert (=> b!697252 (arrayNoDuplicates!0 (array!39980 (store (arr!19149 a!3626) i!1382 k!2843) (size!19534 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!24570 0))(
  ( (Unit!24571) )
))
(declare-fun lt!317140 () Unit!24570)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39979 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13190) Unit!24570)

(assert (=> b!697252 (= lt!317140 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697253 () Bool)

(declare-fun res!461173 () Bool)

(assert (=> b!697253 (=> (not res!461173) (not e!396372))))

(assert (=> b!697253 (= res!461173 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!697254 () Bool)

(assert (=> b!697254 (= e!396369 (contains!3767 acc!681 k!2843))))

(declare-fun b!697255 () Bool)

(declare-fun e!396373 () Bool)

(assert (=> b!697255 (= e!396374 e!396373)))

(declare-fun res!461177 () Bool)

(assert (=> b!697255 (=> (not res!461177) (not e!396373))))

(assert (=> b!697255 (= res!461177 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697256 () Bool)

(assert (=> b!697256 (= e!396368 (contains!3767 acc!681 k!2843))))

(declare-fun b!697257 () Bool)

(assert (=> b!697257 (= e!396373 (not (contains!3767 acc!681 k!2843)))))

(declare-fun b!697258 () Bool)

(declare-fun res!461166 () Bool)

(assert (=> b!697258 (=> (not res!461166) (not e!396372))))

(assert (=> b!697258 (= res!461166 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19534 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!697259 () Bool)

(declare-fun res!461163 () Bool)

(assert (=> b!697259 (=> (not res!461163) (not e!396372))))

(assert (=> b!697259 (= res!461163 (validKeyInArray!0 k!2843))))

(assert (= (and start!62222 res!461170) b!697245))

(assert (= (and b!697245 res!461165) b!697241))

(assert (= (and b!697241 res!461160) b!697249))

(assert (= (and b!697249 res!461174) b!697240))

(assert (= (and b!697240 res!461169) b!697256))

(assert (= (and b!697240 (not res!461162)) b!697243))

(assert (= (and b!697243 res!461158) b!697244))

(assert (= (and b!697240 res!461157) b!697242))

(assert (= (and b!697242 res!461171) b!697250))

(assert (= (and b!697250 res!461161) b!697247))

(assert (= (and b!697247 res!461164) b!697259))

(assert (= (and b!697259 res!461163) b!697239))

(assert (= (and b!697239 res!461159) b!697258))

(assert (= (and b!697258 res!461166) b!697248))

(assert (= (and b!697248 res!461168) b!697253))

(assert (= (and b!697253 res!461173) b!697251))

(assert (= (and b!697251 res!461172) b!697254))

(assert (= (and b!697251 (not res!461175)) b!697255))

(assert (= (and b!697255 res!461177) b!697257))

(assert (= (and b!697251 res!461176) b!697246))

(assert (= (and b!697246 res!461167) b!697252))

(declare-fun m!657755 () Bool)

(assert (=> b!697246 m!657755))

(declare-fun m!657757 () Bool)

(assert (=> b!697250 m!657757))

(declare-fun m!657759 () Bool)

(assert (=> b!697257 m!657759))

(declare-fun m!657761 () Bool)

(assert (=> b!697245 m!657761))

(declare-fun m!657763 () Bool)

(assert (=> b!697241 m!657763))

(assert (=> b!697256 m!657759))

(declare-fun m!657765 () Bool)

(assert (=> b!697242 m!657765))

(declare-fun m!657767 () Bool)

(assert (=> b!697249 m!657767))

(assert (=> b!697254 m!657759))

(assert (=> b!697244 m!657759))

(declare-fun m!657769 () Bool)

(assert (=> b!697248 m!657769))

(assert (=> b!697248 m!657769))

(declare-fun m!657771 () Bool)

(assert (=> b!697248 m!657771))

(declare-fun m!657773 () Bool)

(assert (=> b!697259 m!657773))

(declare-fun m!657775 () Bool)

(assert (=> start!62222 m!657775))

(declare-fun m!657777 () Bool)

(assert (=> b!697252 m!657777))

(declare-fun m!657779 () Bool)

(assert (=> b!697252 m!657779))

(declare-fun m!657781 () Bool)

(assert (=> b!697252 m!657781))

(declare-fun m!657783 () Bool)

(assert (=> b!697239 m!657783))

(push 1)

(assert (not b!697241))

(assert (not b!697257))

(assert (not b!697242))

(assert (not b!697249))

(assert (not b!697252))

(assert (not b!697239))

(assert (not b!697256))

(assert (not b!697254))

(assert (not b!697246))

(assert (not b!697248))

(assert (not b!697244))

(assert (not start!62222))

(assert (not b!697245))

(assert (not b!697259))

(assert (not b!697250))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

