; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62220 () Bool)

(assert start!62220)

(declare-fun b!697176 () Bool)

(declare-fun res!461097 () Bool)

(declare-fun e!396349 () Bool)

(assert (=> b!697176 (=> (not res!461097) (not e!396349))))

(declare-datatypes ((List!13189 0))(
  ( (Nil!13186) (Cons!13185 (h!14230 (_ BitVec 64)) (t!19471 List!13189)) )
))
(declare-fun acc!681 () List!13189)

(declare-fun noDuplicate!1013 (List!13189) Bool)

(assert (=> b!697176 (= res!461097 (noDuplicate!1013 acc!681))))

(declare-fun b!697177 () Bool)

(declare-fun e!396350 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3766 (List!13189 (_ BitVec 64)) Bool)

(assert (=> b!697177 (= e!396350 (contains!3766 acc!681 k!2843))))

(declare-fun b!697178 () Bool)

(declare-fun e!396346 () Bool)

(declare-fun e!396344 () Bool)

(assert (=> b!697178 (= e!396346 e!396344)))

(declare-fun res!461104 () Bool)

(assert (=> b!697178 (=> (not res!461104) (not e!396344))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!697178 (= res!461104 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697179 () Bool)

(declare-datatypes ((array!39977 0))(
  ( (array!39978 (arr!19148 (Array (_ BitVec 32) (_ BitVec 64))) (size!19533 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39977)

(assert (=> b!697179 (= e!396349 (bvsge (bvsub (size!19533 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) (bvsub (size!19533 a!3626) from!3004)))))

(declare-fun b!697180 () Bool)

(assert (=> b!697180 (= e!396344 (not (contains!3766 acc!681 k!2843)))))

(declare-fun b!697182 () Bool)

(declare-fun res!461094 () Bool)

(assert (=> b!697182 (=> (not res!461094) (not e!396349))))

(declare-fun arrayNoDuplicates!0 (array!39977 (_ BitVec 32) List!13189) Bool)

(assert (=> b!697182 (= res!461094 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13186))))

(declare-fun b!697183 () Bool)

(declare-fun res!461098 () Bool)

(assert (=> b!697183 (=> (not res!461098) (not e!396349))))

(assert (=> b!697183 (= res!461098 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!697184 () Bool)

(declare-fun res!461112 () Bool)

(assert (=> b!697184 (=> (not res!461112) (not e!396349))))

(assert (=> b!697184 (= res!461112 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19533 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!697185 () Bool)

(declare-fun res!461108 () Bool)

(assert (=> b!697185 (=> (not res!461108) (not e!396349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697185 (= res!461108 (validKeyInArray!0 k!2843))))

(declare-fun b!697186 () Bool)

(declare-fun e!396347 () Bool)

(declare-fun e!396348 () Bool)

(assert (=> b!697186 (= e!396347 e!396348)))

(declare-fun res!461095 () Bool)

(assert (=> b!697186 (=> (not res!461095) (not e!396348))))

(assert (=> b!697186 (= res!461095 (bvsle from!3004 i!1382))))

(declare-fun b!697187 () Bool)

(assert (=> b!697187 (= e!396348 (not (contains!3766 acc!681 k!2843)))))

(declare-fun b!697188 () Bool)

(declare-fun res!461106 () Bool)

(assert (=> b!697188 (=> (not res!461106) (not e!396349))))

(assert (=> b!697188 (= res!461106 (not (contains!3766 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697189 () Bool)

(declare-fun res!461100 () Bool)

(assert (=> b!697189 (=> (not res!461100) (not e!396349))))

(assert (=> b!697189 (= res!461100 e!396347)))

(declare-fun res!461105 () Bool)

(assert (=> b!697189 (=> res!461105 e!396347)))

(declare-fun e!396345 () Bool)

(assert (=> b!697189 (= res!461105 e!396345)))

(declare-fun res!461103 () Bool)

(assert (=> b!697189 (=> (not res!461103) (not e!396345))))

(assert (=> b!697189 (= res!461103 (bvsgt from!3004 i!1382))))

(declare-fun b!697190 () Bool)

(declare-fun res!461102 () Bool)

(assert (=> b!697190 (=> (not res!461102) (not e!396349))))

(assert (=> b!697190 (= res!461102 e!396346)))

(declare-fun res!461099 () Bool)

(assert (=> b!697190 (=> res!461099 e!396346)))

(assert (=> b!697190 (= res!461099 e!396350)))

(declare-fun res!461113 () Bool)

(assert (=> b!697190 (=> (not res!461113) (not e!396350))))

(assert (=> b!697190 (= res!461113 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697191 () Bool)

(assert (=> b!697191 (= e!396345 (contains!3766 acc!681 k!2843))))

(declare-fun b!697192 () Bool)

(declare-fun res!461110 () Bool)

(assert (=> b!697192 (=> (not res!461110) (not e!396349))))

(declare-fun arrayContainsKey!0 (array!39977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697192 (= res!461110 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!461107 () Bool)

(assert (=> start!62220 (=> (not res!461107) (not e!396349))))

(assert (=> start!62220 (= res!461107 (and (bvslt (size!19533 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19533 a!3626))))))

(assert (=> start!62220 e!396349))

(assert (=> start!62220 true))

(declare-fun array_inv!14944 (array!39977) Bool)

(assert (=> start!62220 (array_inv!14944 a!3626)))

(declare-fun b!697181 () Bool)

(declare-fun res!461114 () Bool)

(assert (=> b!697181 (=> (not res!461114) (not e!396349))))

(assert (=> b!697181 (= res!461114 (not (contains!3766 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697193 () Bool)

(declare-fun res!461101 () Bool)

(assert (=> b!697193 (=> (not res!461101) (not e!396349))))

(assert (=> b!697193 (= res!461101 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697194 () Bool)

(declare-fun res!461096 () Bool)

(assert (=> b!697194 (=> (not res!461096) (not e!396349))))

(assert (=> b!697194 (= res!461096 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19533 a!3626))))))

(declare-fun b!697195 () Bool)

(declare-fun res!461111 () Bool)

(assert (=> b!697195 (=> (not res!461111) (not e!396349))))

(assert (=> b!697195 (= res!461111 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697196 () Bool)

(declare-fun res!461109 () Bool)

(assert (=> b!697196 (=> (not res!461109) (not e!396349))))

(assert (=> b!697196 (= res!461109 (not (validKeyInArray!0 (select (arr!19148 a!3626) from!3004))))))

(assert (= (and start!62220 res!461107) b!697176))

(assert (= (and b!697176 res!461097) b!697181))

(assert (= (and b!697181 res!461114) b!697188))

(assert (= (and b!697188 res!461106) b!697189))

(assert (= (and b!697189 res!461103) b!697191))

(assert (= (and b!697189 (not res!461105)) b!697186))

(assert (= (and b!697186 res!461095) b!697187))

(assert (= (and b!697189 res!461100) b!697182))

(assert (= (and b!697182 res!461094) b!697195))

(assert (= (and b!697195 res!461111) b!697194))

(assert (= (and b!697194 res!461096) b!697185))

(assert (= (and b!697185 res!461108) b!697192))

(assert (= (and b!697192 res!461110) b!697184))

(assert (= (and b!697184 res!461112) b!697196))

(assert (= (and b!697196 res!461109) b!697183))

(assert (= (and b!697183 res!461098) b!697190))

(assert (= (and b!697190 res!461113) b!697177))

(assert (= (and b!697190 (not res!461099)) b!697178))

(assert (= (and b!697178 res!461104) b!697180))

(assert (= (and b!697190 res!461102) b!697193))

(assert (= (and b!697193 res!461101) b!697179))

(declare-fun m!657731 () Bool)

(assert (=> b!697187 m!657731))

(declare-fun m!657733 () Bool)

(assert (=> b!697196 m!657733))

(assert (=> b!697196 m!657733))

(declare-fun m!657735 () Bool)

(assert (=> b!697196 m!657735))

(declare-fun m!657737 () Bool)

(assert (=> b!697193 m!657737))

(assert (=> b!697191 m!657731))

(assert (=> b!697177 m!657731))

(declare-fun m!657739 () Bool)

(assert (=> b!697185 m!657739))

(declare-fun m!657741 () Bool)

(assert (=> b!697182 m!657741))

(declare-fun m!657743 () Bool)

(assert (=> b!697188 m!657743))

(declare-fun m!657745 () Bool)

(assert (=> b!697195 m!657745))

(declare-fun m!657747 () Bool)

(assert (=> b!697181 m!657747))

(declare-fun m!657749 () Bool)

(assert (=> b!697192 m!657749))

(declare-fun m!657751 () Bool)

(assert (=> b!697176 m!657751))

(declare-fun m!657753 () Bool)

(assert (=> start!62220 m!657753))

(assert (=> b!697180 m!657731))

(push 1)

(assert (not b!697192))

(assert (not b!697177))

(assert (not b!697196))

(assert (not b!697182))

(assert (not b!697195))

(assert (not b!697180))

(assert (not b!697191))

(assert (not b!697181))

(assert (not b!697187))

(assert (not b!697185))

(assert (not b!697193))

(assert (not b!697176))

(assert (not b!697188))

(assert (not start!62220))

(check-sat)

(pop 1)

(push 1)

(check-sat)

