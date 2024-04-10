; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62966 () Bool)

(assert start!62966)

(declare-fun b!709792 () Bool)

(declare-fun e!399428 () Bool)

(assert (=> b!709792 (= e!399428 false)))

(declare-fun lt!318265 () Bool)

(declare-datatypes ((List!13381 0))(
  ( (Nil!13378) (Cons!13377 (h!14422 (_ BitVec 64)) (t!19678 List!13381)) )
))
(declare-fun lt!318266 () List!13381)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3958 (List!13381 (_ BitVec 64)) Bool)

(assert (=> b!709792 (= lt!318265 (contains!3958 lt!318266 k!2824))))

(declare-fun res!473285 () Bool)

(declare-fun e!399427 () Bool)

(assert (=> start!62966 (=> (not res!473285) (not e!399427))))

(declare-datatypes ((array!40382 0))(
  ( (array!40383 (arr!19340 (Array (_ BitVec 32) (_ BitVec 64))) (size!19736 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40382)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62966 (= res!473285 (and (bvslt (size!19736 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19736 a!3591))))))

(assert (=> start!62966 e!399427))

(assert (=> start!62966 true))

(declare-fun array_inv!15136 (array!40382) Bool)

(assert (=> start!62966 (array_inv!15136 a!3591)))

(declare-fun b!709793 () Bool)

(declare-fun res!473290 () Bool)

(assert (=> b!709793 (=> (not res!473290) (not e!399427))))

(assert (=> b!709793 (= res!473290 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19736 a!3591)))))

(declare-fun b!709794 () Bool)

(declare-fun res!473298 () Bool)

(assert (=> b!709794 (=> (not res!473298) (not e!399427))))

(declare-fun newAcc!49 () List!13381)

(declare-fun noDuplicate!1205 (List!13381) Bool)

(assert (=> b!709794 (= res!473298 (noDuplicate!1205 newAcc!49))))

(declare-fun b!709795 () Bool)

(declare-fun res!473299 () Bool)

(assert (=> b!709795 (=> (not res!473299) (not e!399427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!709795 (= res!473299 (validKeyInArray!0 (select (arr!19340 a!3591) from!2969)))))

(declare-fun b!709796 () Bool)

(declare-fun res!473295 () Bool)

(assert (=> b!709796 (=> (not res!473295) (not e!399427))))

(declare-fun acc!652 () List!13381)

(declare-fun subseq!403 (List!13381 List!13381) Bool)

(assert (=> b!709796 (= res!473295 (subseq!403 acc!652 newAcc!49))))

(declare-fun b!709797 () Bool)

(declare-fun res!473294 () Bool)

(assert (=> b!709797 (=> (not res!473294) (not e!399427))))

(assert (=> b!709797 (= res!473294 (not (contains!3958 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709798 () Bool)

(declare-fun res!473301 () Bool)

(assert (=> b!709798 (=> (not res!473301) (not e!399428))))

(assert (=> b!709798 (= res!473301 (not (contains!3958 lt!318266 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709799 () Bool)

(declare-fun res!473292 () Bool)

(assert (=> b!709799 (=> (not res!473292) (not e!399427))))

(assert (=> b!709799 (= res!473292 (not (contains!3958 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709800 () Bool)

(declare-fun res!473296 () Bool)

(assert (=> b!709800 (=> (not res!473296) (not e!399427))))

(declare-fun arrayNoDuplicates!0 (array!40382 (_ BitVec 32) List!13381) Bool)

(assert (=> b!709800 (= res!473296 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!709801 () Bool)

(declare-fun res!473289 () Bool)

(assert (=> b!709801 (=> (not res!473289) (not e!399427))))

(assert (=> b!709801 (= res!473289 (validKeyInArray!0 k!2824))))

(declare-fun b!709802 () Bool)

(declare-fun res!473291 () Bool)

(assert (=> b!709802 (=> (not res!473291) (not e!399427))))

(declare-fun -!368 (List!13381 (_ BitVec 64)) List!13381)

(assert (=> b!709802 (= res!473291 (= (-!368 newAcc!49 k!2824) acc!652))))

(declare-fun b!709803 () Bool)

(assert (=> b!709803 (= e!399427 e!399428)))

(declare-fun res!473304 () Bool)

(assert (=> b!709803 (=> (not res!473304) (not e!399428))))

(assert (=> b!709803 (= res!473304 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!514 (List!13381 (_ BitVec 64)) List!13381)

(assert (=> b!709803 (= lt!318266 ($colon$colon!514 acc!652 (select (arr!19340 a!3591) from!2969)))))

(declare-fun b!709804 () Bool)

(declare-fun res!473300 () Bool)

(assert (=> b!709804 (=> (not res!473300) (not e!399427))))

(assert (=> b!709804 (= res!473300 (not (contains!3958 acc!652 k!2824)))))

(declare-fun b!709805 () Bool)

(declare-fun res!473293 () Bool)

(assert (=> b!709805 (=> (not res!473293) (not e!399427))))

(assert (=> b!709805 (= res!473293 (not (contains!3958 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709806 () Bool)

(declare-fun res!473287 () Bool)

(assert (=> b!709806 (=> (not res!473287) (not e!399427))))

(assert (=> b!709806 (= res!473287 (contains!3958 newAcc!49 k!2824))))

(declare-fun b!709807 () Bool)

(declare-fun res!473302 () Bool)

(assert (=> b!709807 (=> (not res!473302) (not e!399428))))

(assert (=> b!709807 (= res!473302 (noDuplicate!1205 ($colon$colon!514 newAcc!49 (select (arr!19340 a!3591) from!2969))))))

(declare-fun b!709808 () Bool)

(declare-fun res!473305 () Bool)

(assert (=> b!709808 (=> (not res!473305) (not e!399427))))

(assert (=> b!709808 (= res!473305 (noDuplicate!1205 acc!652))))

(declare-fun b!709809 () Bool)

(declare-fun res!473284 () Bool)

(assert (=> b!709809 (=> (not res!473284) (not e!399427))))

(declare-fun arrayContainsKey!0 (array!40382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!709809 (= res!473284 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!709810 () Bool)

(declare-fun res!473297 () Bool)

(assert (=> b!709810 (=> (not res!473297) (not e!399427))))

(assert (=> b!709810 (= res!473297 (not (contains!3958 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709811 () Bool)

(declare-fun res!473288 () Bool)

(assert (=> b!709811 (=> (not res!473288) (not e!399428))))

(assert (=> b!709811 (= res!473288 (noDuplicate!1205 lt!318266))))

(declare-fun b!709812 () Bool)

(declare-fun res!473303 () Bool)

(assert (=> b!709812 (=> (not res!473303) (not e!399428))))

(assert (=> b!709812 (= res!473303 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!709813 () Bool)

(declare-fun res!473286 () Bool)

(assert (=> b!709813 (=> (not res!473286) (not e!399428))))

(assert (=> b!709813 (= res!473286 (not (contains!3958 lt!318266 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62966 res!473285) b!709808))

(assert (= (and b!709808 res!473305) b!709794))

(assert (= (and b!709794 res!473298) b!709799))

(assert (= (and b!709799 res!473292) b!709810))

(assert (= (and b!709810 res!473297) b!709809))

(assert (= (and b!709809 res!473284) b!709804))

(assert (= (and b!709804 res!473300) b!709801))

(assert (= (and b!709801 res!473289) b!709800))

(assert (= (and b!709800 res!473296) b!709796))

(assert (= (and b!709796 res!473295) b!709806))

(assert (= (and b!709806 res!473287) b!709802))

(assert (= (and b!709802 res!473291) b!709805))

(assert (= (and b!709805 res!473293) b!709797))

(assert (= (and b!709797 res!473294) b!709793))

(assert (= (and b!709793 res!473290) b!709795))

(assert (= (and b!709795 res!473299) b!709803))

(assert (= (and b!709803 res!473304) b!709811))

(assert (= (and b!709811 res!473288) b!709807))

(assert (= (and b!709807 res!473302) b!709813))

(assert (= (and b!709813 res!473286) b!709798))

(assert (= (and b!709798 res!473301) b!709812))

(assert (= (and b!709812 res!473303) b!709792))

(declare-fun m!667027 () Bool)

(assert (=> b!709797 m!667027))

(declare-fun m!667029 () Bool)

(assert (=> b!709792 m!667029))

(declare-fun m!667031 () Bool)

(assert (=> b!709802 m!667031))

(declare-fun m!667033 () Bool)

(assert (=> b!709813 m!667033))

(declare-fun m!667035 () Bool)

(assert (=> b!709809 m!667035))

(declare-fun m!667037 () Bool)

(assert (=> b!709811 m!667037))

(declare-fun m!667039 () Bool)

(assert (=> b!709798 m!667039))

(declare-fun m!667041 () Bool)

(assert (=> b!709796 m!667041))

(declare-fun m!667043 () Bool)

(assert (=> b!709794 m!667043))

(declare-fun m!667045 () Bool)

(assert (=> b!709812 m!667045))

(declare-fun m!667047 () Bool)

(assert (=> b!709805 m!667047))

(declare-fun m!667049 () Bool)

(assert (=> b!709810 m!667049))

(declare-fun m!667051 () Bool)

(assert (=> b!709795 m!667051))

(assert (=> b!709795 m!667051))

(declare-fun m!667053 () Bool)

(assert (=> b!709795 m!667053))

(declare-fun m!667055 () Bool)

(assert (=> b!709800 m!667055))

(declare-fun m!667057 () Bool)

(assert (=> b!709801 m!667057))

(declare-fun m!667059 () Bool)

(assert (=> b!709804 m!667059))

(declare-fun m!667061 () Bool)

(assert (=> b!709799 m!667061))

(assert (=> b!709807 m!667051))

(assert (=> b!709807 m!667051))

(declare-fun m!667063 () Bool)

(assert (=> b!709807 m!667063))

(assert (=> b!709807 m!667063))

(declare-fun m!667065 () Bool)

(assert (=> b!709807 m!667065))

(declare-fun m!667067 () Bool)

(assert (=> start!62966 m!667067))

(declare-fun m!667069 () Bool)

(assert (=> b!709808 m!667069))

(assert (=> b!709803 m!667051))

(assert (=> b!709803 m!667051))

(declare-fun m!667071 () Bool)

(assert (=> b!709803 m!667071))

(declare-fun m!667073 () Bool)

(assert (=> b!709806 m!667073))

(push 1)

