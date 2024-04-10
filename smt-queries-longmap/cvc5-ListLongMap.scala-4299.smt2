; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59822 () Bool)

(assert start!59822)

(declare-fun b!661006 () Bool)

(declare-fun res!429072 () Bool)

(declare-fun e!379789 () Bool)

(assert (=> b!661006 (=> (not res!429072) (not e!379789))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38869 0))(
  ( (array!38870 (arr!18627 (Array (_ BitVec 32) (_ BitVec 64))) (size!18991 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38869)

(assert (=> b!661006 (= res!429072 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18991 a!3626))))))

(declare-fun b!661007 () Bool)

(declare-fun res!429081 () Bool)

(assert (=> b!661007 (=> (not res!429081) (not e!379789))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661007 (= res!429081 (validKeyInArray!0 k!2843))))

(declare-fun b!661008 () Bool)

(declare-fun res!429073 () Bool)

(assert (=> b!661008 (=> (not res!429073) (not e!379789))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12668 0))(
  ( (Nil!12665) (Cons!12664 (h!13709 (_ BitVec 64)) (t!18896 List!12668)) )
))
(declare-fun acc!681 () List!12668)

(declare-fun arrayNoDuplicates!0 (array!38869 (_ BitVec 32) List!12668) Bool)

(assert (=> b!661008 (= res!429073 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661009 () Bool)

(declare-fun res!429071 () Bool)

(assert (=> b!661009 (=> (not res!429071) (not e!379789))))

(declare-fun noDuplicate!492 (List!12668) Bool)

(assert (=> b!661009 (= res!429071 (noDuplicate!492 acc!681))))

(declare-fun b!661010 () Bool)

(declare-fun res!429079 () Bool)

(assert (=> b!661010 (=> (not res!429079) (not e!379789))))

(declare-fun e!379787 () Bool)

(assert (=> b!661010 (= res!429079 e!379787)))

(declare-fun res!429075 () Bool)

(assert (=> b!661010 (=> res!429075 e!379787)))

(declare-fun e!379790 () Bool)

(assert (=> b!661010 (= res!429075 e!379790)))

(declare-fun res!429076 () Bool)

(assert (=> b!661010 (=> (not res!429076) (not e!379790))))

(assert (=> b!661010 (= res!429076 (bvsgt from!3004 i!1382))))

(declare-fun b!661011 () Bool)

(declare-fun e!379788 () Bool)

(assert (=> b!661011 (= e!379787 e!379788)))

(declare-fun res!429078 () Bool)

(assert (=> b!661011 (=> (not res!429078) (not e!379788))))

(assert (=> b!661011 (= res!429078 (bvsle from!3004 i!1382))))

(declare-fun b!661012 () Bool)

(declare-fun res!429083 () Bool)

(assert (=> b!661012 (=> (not res!429083) (not e!379789))))

(assert (=> b!661012 (= res!429083 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12665))))

(declare-fun b!661013 () Bool)

(declare-fun res!429070 () Bool)

(assert (=> b!661013 (=> (not res!429070) (not e!379789))))

(declare-fun contains!3245 (List!12668 (_ BitVec 64)) Bool)

(assert (=> b!661013 (= res!429070 (not (contains!3245 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661014 () Bool)

(assert (=> b!661014 (= e!379789 (not true))))

(declare-fun arrayContainsKey!0 (array!38869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661014 (arrayContainsKey!0 (array!38870 (store (arr!18627 a!3626) i!1382 k!2843) (size!18991 a!3626)) k!2843 from!3004)))

(declare-fun b!661015 () Bool)

(declare-fun res!429082 () Bool)

(assert (=> b!661015 (=> (not res!429082) (not e!379789))))

(assert (=> b!661015 (= res!429082 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661016 () Bool)

(declare-fun res!429080 () Bool)

(assert (=> b!661016 (=> (not res!429080) (not e!379789))))

(assert (=> b!661016 (= res!429080 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18991 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!429077 () Bool)

(assert (=> start!59822 (=> (not res!429077) (not e!379789))))

(assert (=> start!59822 (= res!429077 (and (bvslt (size!18991 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18991 a!3626))))))

(assert (=> start!59822 e!379789))

(assert (=> start!59822 true))

(declare-fun array_inv!14423 (array!38869) Bool)

(assert (=> start!59822 (array_inv!14423 a!3626)))

(declare-fun b!661017 () Bool)

(declare-fun res!429074 () Bool)

(assert (=> b!661017 (=> (not res!429074) (not e!379789))))

(assert (=> b!661017 (= res!429074 (not (contains!3245 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661018 () Bool)

(assert (=> b!661018 (= e!379788 (not (contains!3245 acc!681 k!2843)))))

(declare-fun b!661019 () Bool)

(assert (=> b!661019 (= e!379790 (contains!3245 acc!681 k!2843))))

(assert (= (and start!59822 res!429077) b!661009))

(assert (= (and b!661009 res!429071) b!661017))

(assert (= (and b!661017 res!429074) b!661013))

(assert (= (and b!661013 res!429070) b!661010))

(assert (= (and b!661010 res!429076) b!661019))

(assert (= (and b!661010 (not res!429075)) b!661011))

(assert (= (and b!661011 res!429078) b!661018))

(assert (= (and b!661010 res!429079) b!661012))

(assert (= (and b!661012 res!429083) b!661008))

(assert (= (and b!661008 res!429073) b!661006))

(assert (= (and b!661006 res!429072) b!661007))

(assert (= (and b!661007 res!429081) b!661015))

(assert (= (and b!661015 res!429082) b!661016))

(assert (= (and b!661016 res!429080) b!661014))

(declare-fun m!633401 () Bool)

(assert (=> b!661007 m!633401))

(declare-fun m!633403 () Bool)

(assert (=> b!661012 m!633403))

(declare-fun m!633405 () Bool)

(assert (=> b!661019 m!633405))

(assert (=> b!661018 m!633405))

(declare-fun m!633407 () Bool)

(assert (=> b!661008 m!633407))

(declare-fun m!633409 () Bool)

(assert (=> b!661009 m!633409))

(declare-fun m!633411 () Bool)

(assert (=> b!661014 m!633411))

(declare-fun m!633413 () Bool)

(assert (=> b!661014 m!633413))

(declare-fun m!633415 () Bool)

(assert (=> b!661017 m!633415))

(declare-fun m!633417 () Bool)

(assert (=> b!661015 m!633417))

(declare-fun m!633419 () Bool)

(assert (=> b!661013 m!633419))

(declare-fun m!633421 () Bool)

(assert (=> start!59822 m!633421))

(push 1)

(assert (not b!661014))

(assert (not b!661009))

(assert (not b!661019))

(assert (not b!661007))

(assert (not b!661008))

(assert (not b!661013))

(assert (not b!661018))

(assert (not b!661015))

(assert (not b!661017))

(assert (not start!59822))

(assert (not b!661012))

(check-sat)

