; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62550 () Bool)

(assert start!62550)

(declare-fun b!705052 () Bool)

(declare-fun res!468868 () Bool)

(declare-fun e!397789 () Bool)

(assert (=> b!705052 (=> (not res!468868) (not e!397789))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40229 0))(
  ( (array!40230 (arr!19271 (Array (_ BitVec 32) (_ BitVec 64))) (size!19656 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40229)

(assert (=> b!705052 (= res!468868 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19656 a!3591)))))

(declare-fun b!705053 () Bool)

(declare-fun res!468866 () Bool)

(assert (=> b!705053 (=> (not res!468866) (not e!397789))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705053 (= res!468866 (validKeyInArray!0 k!2824))))

(declare-fun b!705054 () Bool)

(assert (=> b!705054 (= e!397789 false)))

(declare-fun lt!317877 () Bool)

(declare-datatypes ((List!13312 0))(
  ( (Nil!13309) (Cons!13308 (h!14353 (_ BitVec 64)) (t!19594 List!13312)) )
))
(declare-fun acc!652 () List!13312)

(declare-fun arrayNoDuplicates!0 (array!40229 (_ BitVec 32) List!13312) Bool)

(assert (=> b!705054 (= lt!317877 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705055 () Bool)

(declare-fun res!468862 () Bool)

(assert (=> b!705055 (=> (not res!468862) (not e!397789))))

(declare-fun newAcc!49 () List!13312)

(declare-fun contains!3889 (List!13312 (_ BitVec 64)) Bool)

(assert (=> b!705055 (= res!468862 (contains!3889 newAcc!49 k!2824))))

(declare-fun b!705056 () Bool)

(declare-fun res!468872 () Bool)

(assert (=> b!705056 (=> (not res!468872) (not e!397789))))

(assert (=> b!705056 (= res!468872 (not (contains!3889 acc!652 k!2824)))))

(declare-fun b!705057 () Bool)

(declare-fun res!468879 () Bool)

(assert (=> b!705057 (=> (not res!468879) (not e!397789))))

(assert (=> b!705057 (= res!468879 (not (contains!3889 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705058 () Bool)

(declare-fun res!468874 () Bool)

(assert (=> b!705058 (=> (not res!468874) (not e!397789))))

(declare-fun arrayContainsKey!0 (array!40229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705058 (= res!468874 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun res!468863 () Bool)

(assert (=> start!62550 (=> (not res!468863) (not e!397789))))

(assert (=> start!62550 (= res!468863 (and (bvslt (size!19656 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19656 a!3591))))))

(assert (=> start!62550 e!397789))

(assert (=> start!62550 true))

(declare-fun array_inv!15067 (array!40229) Bool)

(assert (=> start!62550 (array_inv!15067 a!3591)))

(declare-fun b!705059 () Bool)

(declare-fun res!468865 () Bool)

(assert (=> b!705059 (=> (not res!468865) (not e!397789))))

(assert (=> b!705059 (= res!468865 (not (contains!3889 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705060 () Bool)

(declare-fun res!468869 () Bool)

(assert (=> b!705060 (=> (not res!468869) (not e!397789))))

(assert (=> b!705060 (= res!468869 (not (contains!3889 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705061 () Bool)

(declare-fun res!468876 () Bool)

(assert (=> b!705061 (=> (not res!468876) (not e!397789))))

(assert (=> b!705061 (= res!468876 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705062 () Bool)

(declare-fun res!468871 () Bool)

(assert (=> b!705062 (=> (not res!468871) (not e!397789))))

(declare-fun -!299 (List!13312 (_ BitVec 64)) List!13312)

(assert (=> b!705062 (= res!468871 (= (-!299 newAcc!49 k!2824) acc!652))))

(declare-fun b!705063 () Bool)

(declare-fun res!468867 () Bool)

(assert (=> b!705063 (=> (not res!468867) (not e!397789))))

(assert (=> b!705063 (= res!468867 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705064 () Bool)

(declare-fun res!468878 () Bool)

(assert (=> b!705064 (=> (not res!468878) (not e!397789))))

(assert (=> b!705064 (= res!468878 (not (validKeyInArray!0 (select (arr!19271 a!3591) from!2969))))))

(declare-fun b!705065 () Bool)

(declare-fun res!468864 () Bool)

(assert (=> b!705065 (=> (not res!468864) (not e!397789))))

(declare-fun noDuplicate!1136 (List!13312) Bool)

(assert (=> b!705065 (= res!468864 (noDuplicate!1136 newAcc!49))))

(declare-fun b!705066 () Bool)

(declare-fun res!468870 () Bool)

(assert (=> b!705066 (=> (not res!468870) (not e!397789))))

(declare-fun subseq!334 (List!13312 List!13312) Bool)

(assert (=> b!705066 (= res!468870 (subseq!334 acc!652 newAcc!49))))

(declare-fun b!705067 () Bool)

(declare-fun res!468873 () Bool)

(assert (=> b!705067 (=> (not res!468873) (not e!397789))))

(assert (=> b!705067 (= res!468873 (not (contains!3889 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705068 () Bool)

(declare-fun res!468875 () Bool)

(assert (=> b!705068 (=> (not res!468875) (not e!397789))))

(assert (=> b!705068 (= res!468875 (noDuplicate!1136 acc!652))))

(declare-fun b!705069 () Bool)

(declare-fun res!468877 () Bool)

(assert (=> b!705069 (=> (not res!468877) (not e!397789))))

(assert (=> b!705069 (= res!468877 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and start!62550 res!468863) b!705068))

(assert (= (and b!705068 res!468875) b!705065))

(assert (= (and b!705065 res!468864) b!705057))

(assert (= (and b!705057 res!468879) b!705059))

(assert (= (and b!705059 res!468865) b!705058))

(assert (= (and b!705058 res!468874) b!705056))

(assert (= (and b!705056 res!468872) b!705053))

(assert (= (and b!705053 res!468866) b!705063))

(assert (= (and b!705063 res!468867) b!705066))

(assert (= (and b!705066 res!468870) b!705055))

(assert (= (and b!705055 res!468862) b!705062))

(assert (= (and b!705062 res!468871) b!705067))

(assert (= (and b!705067 res!468873) b!705060))

(assert (= (and b!705060 res!468869) b!705052))

(assert (= (and b!705052 res!468868) b!705064))

(assert (= (and b!705064 res!468878) b!705061))

(assert (= (and b!705061 res!468876) b!705069))

(assert (= (and b!705069 res!468877) b!705054))

(declare-fun m!663343 () Bool)

(assert (=> b!705054 m!663343))

(declare-fun m!663345 () Bool)

(assert (=> b!705067 m!663345))

(declare-fun m!663347 () Bool)

(assert (=> b!705057 m!663347))

(declare-fun m!663349 () Bool)

(assert (=> b!705060 m!663349))

(declare-fun m!663351 () Bool)

(assert (=> b!705069 m!663351))

(declare-fun m!663353 () Bool)

(assert (=> b!705056 m!663353))

(declare-fun m!663355 () Bool)

(assert (=> b!705053 m!663355))

(declare-fun m!663357 () Bool)

(assert (=> b!705068 m!663357))

(declare-fun m!663359 () Bool)

(assert (=> b!705055 m!663359))

(declare-fun m!663361 () Bool)

(assert (=> start!62550 m!663361))

(declare-fun m!663363 () Bool)

(assert (=> b!705062 m!663363))

(declare-fun m!663365 () Bool)

(assert (=> b!705064 m!663365))

(assert (=> b!705064 m!663365))

(declare-fun m!663367 () Bool)

(assert (=> b!705064 m!663367))

(declare-fun m!663369 () Bool)

(assert (=> b!705066 m!663369))

(declare-fun m!663371 () Bool)

(assert (=> b!705058 m!663371))

(declare-fun m!663373 () Bool)

(assert (=> b!705063 m!663373))

(declare-fun m!663375 () Bool)

(assert (=> b!705065 m!663375))

(declare-fun m!663377 () Bool)

(assert (=> b!705059 m!663377))

(push 1)

(assert (not start!62550))

(assert (not b!705058))

(assert (not b!705064))

(assert (not b!705054))

(assert (not b!705059))

(assert (not b!705053))

(assert (not b!705068))

(assert (not b!705062))

(assert (not b!705065))

(assert (not b!705069))

(assert (not b!705056))

(assert (not b!705055))

(assert (not b!705060))

(assert (not b!705057))

(assert (not b!705067))

(assert (not b!705063))

(assert (not b!705066))

(check-sat)

