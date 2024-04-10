; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63496 () Bool)

(assert start!63496)

(declare-fun b!715028 () Bool)

(declare-fun res!478014 () Bool)

(declare-fun e!401818 () Bool)

(assert (=> b!715028 (=> (not res!478014) (not e!401818))))

(declare-datatypes ((array!40510 0))(
  ( (array!40511 (arr!19392 (Array (_ BitVec 32) (_ BitVec 64))) (size!19808 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40510)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715028 (= res!478014 (not (validKeyInArray!0 (select (arr!19392 a!3591) from!2969))))))

(declare-fun b!715029 () Bool)

(assert (=> b!715029 (= e!401818 false)))

(declare-fun lt!318818 () Bool)

(declare-datatypes ((List!13433 0))(
  ( (Nil!13430) (Cons!13429 (h!14474 (_ BitVec 64)) (t!19748 List!13433)) )
))
(declare-fun acc!652 () List!13433)

(declare-fun arrayNoDuplicates!0 (array!40510 (_ BitVec 32) List!13433) Bool)

(assert (=> b!715029 (= lt!318818 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715030 () Bool)

(declare-fun res!478000 () Bool)

(assert (=> b!715030 (=> (not res!478000) (not e!401818))))

(declare-fun contains!4010 (List!13433 (_ BitVec 64)) Bool)

(assert (=> b!715030 (= res!478000 (not (contains!4010 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715031 () Bool)

(declare-fun res!478003 () Bool)

(assert (=> b!715031 (=> (not res!478003) (not e!401818))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715031 (= res!478003 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715032 () Bool)

(declare-fun res!478002 () Bool)

(assert (=> b!715032 (=> (not res!478002) (not e!401818))))

(assert (=> b!715032 (= res!478002 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715033 () Bool)

(declare-fun res!478010 () Bool)

(assert (=> b!715033 (=> (not res!478010) (not e!401818))))

(declare-fun newAcc!49 () List!13433)

(assert (=> b!715033 (= res!478010 (contains!4010 newAcc!49 k!2824))))

(declare-fun b!715034 () Bool)

(declare-fun res!478008 () Bool)

(assert (=> b!715034 (=> (not res!478008) (not e!401818))))

(assert (=> b!715034 (= res!478008 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19808 a!3591)))))

(declare-fun b!715035 () Bool)

(declare-fun res!478009 () Bool)

(assert (=> b!715035 (=> (not res!478009) (not e!401818))))

(declare-fun noDuplicate!1257 (List!13433) Bool)

(assert (=> b!715035 (= res!478009 (noDuplicate!1257 newAcc!49))))

(declare-fun b!715036 () Bool)

(declare-fun res!477998 () Bool)

(assert (=> b!715036 (=> (not res!477998) (not e!401818))))

(assert (=> b!715036 (= res!477998 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!715037 () Bool)

(declare-fun res!478012 () Bool)

(assert (=> b!715037 (=> (not res!478012) (not e!401818))))

(assert (=> b!715037 (= res!478012 (not (contains!4010 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715038 () Bool)

(declare-fun res!477999 () Bool)

(assert (=> b!715038 (=> (not res!477999) (not e!401818))))

(assert (=> b!715038 (= res!477999 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun res!478015 () Bool)

(assert (=> start!63496 (=> (not res!478015) (not e!401818))))

(assert (=> start!63496 (= res!478015 (and (bvslt (size!19808 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19808 a!3591))))))

(assert (=> start!63496 e!401818))

(assert (=> start!63496 true))

(declare-fun array_inv!15188 (array!40510) Bool)

(assert (=> start!63496 (array_inv!15188 a!3591)))

(declare-fun b!715039 () Bool)

(declare-fun res!478007 () Bool)

(assert (=> b!715039 (=> (not res!478007) (not e!401818))))

(assert (=> b!715039 (= res!478007 (not (contains!4010 acc!652 k!2824)))))

(declare-fun b!715040 () Bool)

(declare-fun res!478005 () Bool)

(assert (=> b!715040 (=> (not res!478005) (not e!401818))))

(declare-fun -!420 (List!13433 (_ BitVec 64)) List!13433)

(assert (=> b!715040 (= res!478005 (= (-!420 newAcc!49 k!2824) acc!652))))

(declare-fun b!715041 () Bool)

(declare-fun res!478011 () Bool)

(assert (=> b!715041 (=> (not res!478011) (not e!401818))))

(assert (=> b!715041 (= res!478011 (validKeyInArray!0 k!2824))))

(declare-fun b!715042 () Bool)

(declare-fun res!478001 () Bool)

(assert (=> b!715042 (=> (not res!478001) (not e!401818))))

(assert (=> b!715042 (= res!478001 (not (contains!4010 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715043 () Bool)

(declare-fun res!478013 () Bool)

(assert (=> b!715043 (=> (not res!478013) (not e!401818))))

(assert (=> b!715043 (= res!478013 (not (contains!4010 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715044 () Bool)

(declare-fun res!478004 () Bool)

(assert (=> b!715044 (=> (not res!478004) (not e!401818))))

(declare-fun subseq!455 (List!13433 List!13433) Bool)

(assert (=> b!715044 (= res!478004 (subseq!455 acc!652 newAcc!49))))

(declare-fun b!715045 () Bool)

(declare-fun res!478006 () Bool)

(assert (=> b!715045 (=> (not res!478006) (not e!401818))))

(assert (=> b!715045 (= res!478006 (noDuplicate!1257 acc!652))))

(assert (= (and start!63496 res!478015) b!715045))

(assert (= (and b!715045 res!478006) b!715035))

(assert (= (and b!715035 res!478009) b!715030))

(assert (= (and b!715030 res!478000) b!715037))

(assert (= (and b!715037 res!478012) b!715036))

(assert (= (and b!715036 res!477998) b!715039))

(assert (= (and b!715039 res!478007) b!715041))

(assert (= (and b!715041 res!478011) b!715032))

(assert (= (and b!715032 res!478002) b!715044))

(assert (= (and b!715044 res!478004) b!715033))

(assert (= (and b!715033 res!478010) b!715040))

(assert (= (and b!715040 res!478005) b!715043))

(assert (= (and b!715043 res!478013) b!715042))

(assert (= (and b!715042 res!478001) b!715034))

(assert (= (and b!715034 res!478008) b!715028))

(assert (= (and b!715028 res!478014) b!715038))

(assert (= (and b!715038 res!477999) b!715031))

(assert (= (and b!715031 res!478003) b!715029))

(declare-fun m!671407 () Bool)

(assert (=> b!715035 m!671407))

(declare-fun m!671409 () Bool)

(assert (=> b!715039 m!671409))

(declare-fun m!671411 () Bool)

(assert (=> b!715030 m!671411))

(declare-fun m!671413 () Bool)

(assert (=> b!715045 m!671413))

(declare-fun m!671415 () Bool)

(assert (=> b!715031 m!671415))

(declare-fun m!671417 () Bool)

(assert (=> b!715033 m!671417))

(declare-fun m!671419 () Bool)

(assert (=> start!63496 m!671419))

(declare-fun m!671421 () Bool)

(assert (=> b!715042 m!671421))

(declare-fun m!671423 () Bool)

(assert (=> b!715043 m!671423))

(declare-fun m!671425 () Bool)

(assert (=> b!715044 m!671425))

(declare-fun m!671427 () Bool)

(assert (=> b!715029 m!671427))

(declare-fun m!671429 () Bool)

(assert (=> b!715041 m!671429))

(declare-fun m!671431 () Bool)

(assert (=> b!715037 m!671431))

(declare-fun m!671433 () Bool)

(assert (=> b!715040 m!671433))

(declare-fun m!671435 () Bool)

(assert (=> b!715028 m!671435))

(assert (=> b!715028 m!671435))

(declare-fun m!671437 () Bool)

(assert (=> b!715028 m!671437))

(declare-fun m!671439 () Bool)

(assert (=> b!715036 m!671439))

(declare-fun m!671441 () Bool)

(assert (=> b!715032 m!671441))

(push 1)

(assert (not b!715036))

(assert (not b!715045))

(assert (not b!715028))

(assert (not b!715035))

(assert (not b!715031))

(assert (not b!715029))

(assert (not start!63496))

(assert (not b!715039))

(assert (not b!715030))

(assert (not b!715032))

(assert (not b!715037))

(assert (not b!715044))

(assert (not b!715043))

(assert (not b!715040))

(assert (not b!715041))

(assert (not b!715042))

(assert (not b!715033))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

