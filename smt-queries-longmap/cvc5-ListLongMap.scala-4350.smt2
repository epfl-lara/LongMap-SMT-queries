; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60190 () Bool)

(assert start!60190)

(declare-fun b!671284 () Bool)

(declare-fun res!437874 () Bool)

(declare-fun e!383750 () Bool)

(assert (=> b!671284 (=> (not res!437874) (not e!383750))))

(declare-datatypes ((array!39175 0))(
  ( (array!39176 (arr!18777 (Array (_ BitVec 32) (_ BitVec 64))) (size!19141 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39175)

(declare-datatypes ((List!12725 0))(
  ( (Nil!12722) (Cons!12721 (h!13769 (_ BitVec 64)) (t!18945 List!12725)) )
))
(declare-fun arrayNoDuplicates!0 (array!39175 (_ BitVec 32) List!12725) Bool)

(assert (=> b!671284 (= res!437874 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12722))))

(declare-fun b!671285 () Bool)

(declare-fun e!383749 () Bool)

(declare-fun acc!681 () List!12725)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3377 (List!12725 (_ BitVec 64)) Bool)

(assert (=> b!671285 (= e!383749 (contains!3377 acc!681 k!2843))))

(declare-fun b!671286 () Bool)

(declare-fun res!437882 () Bool)

(assert (=> b!671286 (=> (not res!437882) (not e!383750))))

(declare-fun arrayContainsKey!0 (array!39175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671286 (= res!437882 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671287 () Bool)

(declare-fun res!437878 () Bool)

(assert (=> b!671287 (=> (not res!437878) (not e!383750))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!671287 (= res!437878 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671288 () Bool)

(declare-fun e!383748 () Bool)

(assert (=> b!671288 (= e!383748 (not (contains!3377 acc!681 k!2843)))))

(declare-fun b!671289 () Bool)

(declare-fun res!437880 () Bool)

(assert (=> b!671289 (=> (not res!437880) (not e!383750))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671289 (= res!437880 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19141 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun res!437869 () Bool)

(assert (=> start!60190 (=> (not res!437869) (not e!383750))))

(assert (=> start!60190 (= res!437869 (and (bvslt (size!19141 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19141 a!3626))))))

(assert (=> start!60190 e!383750))

(assert (=> start!60190 true))

(declare-fun array_inv!14636 (array!39175) Bool)

(assert (=> start!60190 (array_inv!14636 a!3626)))

(declare-fun b!671290 () Bool)

(declare-fun e!383751 () Bool)

(assert (=> b!671290 (= e!383751 e!383748)))

(declare-fun res!437870 () Bool)

(assert (=> b!671290 (=> (not res!437870) (not e!383748))))

(assert (=> b!671290 (= res!437870 (bvsle from!3004 i!1382))))

(declare-fun b!671291 () Bool)

(declare-fun res!437873 () Bool)

(assert (=> b!671291 (=> (not res!437873) (not e!383750))))

(assert (=> b!671291 (= res!437873 (not (contains!3377 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671292 () Bool)

(declare-fun res!437871 () Bool)

(assert (=> b!671292 (=> (not res!437871) (not e!383750))))

(assert (=> b!671292 (= res!437871 (= (select (arr!18777 a!3626) from!3004) k!2843))))

(declare-fun b!671293 () Bool)

(assert (=> b!671293 (= e!383750 (not true))))

(assert (=> b!671293 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!671294 () Bool)

(declare-fun res!437875 () Bool)

(assert (=> b!671294 (=> (not res!437875) (not e!383750))))

(assert (=> b!671294 (= res!437875 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19141 a!3626))))))

(declare-fun b!671295 () Bool)

(declare-fun res!437883 () Bool)

(assert (=> b!671295 (=> (not res!437883) (not e!383750))))

(assert (=> b!671295 (= res!437883 (not (contains!3377 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671296 () Bool)

(declare-fun res!437872 () Bool)

(assert (=> b!671296 (=> (not res!437872) (not e!383750))))

(assert (=> b!671296 (= res!437872 e!383751)))

(declare-fun res!437879 () Bool)

(assert (=> b!671296 (=> res!437879 e!383751)))

(assert (=> b!671296 (= res!437879 e!383749)))

(declare-fun res!437881 () Bool)

(assert (=> b!671296 (=> (not res!437881) (not e!383749))))

(assert (=> b!671296 (= res!437881 (bvsgt from!3004 i!1382))))

(declare-fun b!671297 () Bool)

(declare-fun res!437876 () Bool)

(assert (=> b!671297 (=> (not res!437876) (not e!383750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671297 (= res!437876 (validKeyInArray!0 k!2843))))

(declare-fun b!671298 () Bool)

(declare-fun res!437877 () Bool)

(assert (=> b!671298 (=> (not res!437877) (not e!383750))))

(declare-fun noDuplicate!651 (List!12725) Bool)

(assert (=> b!671298 (= res!437877 (noDuplicate!651 acc!681))))

(declare-fun b!671299 () Bool)

(declare-fun res!437884 () Bool)

(assert (=> b!671299 (=> (not res!437884) (not e!383750))))

(assert (=> b!671299 (= res!437884 (validKeyInArray!0 (select (arr!18777 a!3626) from!3004)))))

(assert (= (and start!60190 res!437869) b!671298))

(assert (= (and b!671298 res!437877) b!671291))

(assert (= (and b!671291 res!437873) b!671295))

(assert (= (and b!671295 res!437883) b!671296))

(assert (= (and b!671296 res!437881) b!671285))

(assert (= (and b!671296 (not res!437879)) b!671290))

(assert (= (and b!671290 res!437870) b!671288))

(assert (= (and b!671296 res!437872) b!671284))

(assert (= (and b!671284 res!437874) b!671287))

(assert (= (and b!671287 res!437878) b!671294))

(assert (= (and b!671294 res!437875) b!671297))

(assert (= (and b!671297 res!437876) b!671286))

(assert (= (and b!671286 res!437882) b!671289))

(assert (= (and b!671289 res!437880) b!671299))

(assert (= (and b!671299 res!437884) b!671292))

(assert (= (and b!671292 res!437871) b!671293))

(declare-fun m!641431 () Bool)

(assert (=> b!671285 m!641431))

(assert (=> b!671288 m!641431))

(declare-fun m!641433 () Bool)

(assert (=> b!671291 m!641433))

(declare-fun m!641435 () Bool)

(assert (=> b!671284 m!641435))

(declare-fun m!641437 () Bool)

(assert (=> start!60190 m!641437))

(declare-fun m!641439 () Bool)

(assert (=> b!671287 m!641439))

(declare-fun m!641441 () Bool)

(assert (=> b!671298 m!641441))

(declare-fun m!641443 () Bool)

(assert (=> b!671297 m!641443))

(declare-fun m!641445 () Bool)

(assert (=> b!671292 m!641445))

(declare-fun m!641447 () Bool)

(assert (=> b!671286 m!641447))

(declare-fun m!641449 () Bool)

(assert (=> b!671295 m!641449))

(assert (=> b!671299 m!641445))

(assert (=> b!671299 m!641445))

(declare-fun m!641451 () Bool)

(assert (=> b!671299 m!641451))

(declare-fun m!641453 () Bool)

(assert (=> b!671293 m!641453))

(push 1)

(assert (not b!671287))

(assert (not b!671285))

(assert (not start!60190))

(assert (not b!671299))

(assert (not b!671286))

(assert (not b!671297))

(assert (not b!671291))

(assert (not b!671284))

(assert (not b!671293))

(assert (not b!671288))

(assert (not b!671295))

(assert (not b!671298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

