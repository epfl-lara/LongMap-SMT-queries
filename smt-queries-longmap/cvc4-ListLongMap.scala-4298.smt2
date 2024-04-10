; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59820 () Bool)

(assert start!59820)

(declare-fun b!660964 () Bool)

(declare-fun res!429039 () Bool)

(declare-fun e!379774 () Bool)

(assert (=> b!660964 (=> (not res!429039) (not e!379774))))

(declare-datatypes ((array!38867 0))(
  ( (array!38868 (arr!18626 (Array (_ BitVec 32) (_ BitVec 64))) (size!18990 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38867)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12667 0))(
  ( (Nil!12664) (Cons!12663 (h!13708 (_ BitVec 64)) (t!18895 List!12667)) )
))
(declare-fun acc!681 () List!12667)

(declare-fun arrayNoDuplicates!0 (array!38867 (_ BitVec 32) List!12667) Bool)

(assert (=> b!660964 (= res!429039 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660965 () Bool)

(declare-fun res!429035 () Bool)

(assert (=> b!660965 (=> (not res!429035) (not e!379774))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660965 (= res!429035 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18990 a!3626))))))

(declare-fun b!660966 () Bool)

(declare-fun res!429041 () Bool)

(assert (=> b!660966 (=> (not res!429041) (not e!379774))))

(assert (=> b!660966 (= res!429041 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12664))))

(declare-fun b!660967 () Bool)

(declare-fun e!379776 () Bool)

(declare-fun e!379773 () Bool)

(assert (=> b!660967 (= e!379776 e!379773)))

(declare-fun res!429033 () Bool)

(assert (=> b!660967 (=> (not res!429033) (not e!379773))))

(assert (=> b!660967 (= res!429033 (bvsle from!3004 i!1382))))

(declare-fun b!660968 () Bool)

(declare-fun res!429028 () Bool)

(assert (=> b!660968 (=> (not res!429028) (not e!379774))))

(assert (=> b!660968 (= res!429028 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18990 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!660969 () Bool)

(assert (=> b!660969 (= e!379774 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!660969 (arrayContainsKey!0 (array!38868 (store (arr!18626 a!3626) i!1382 k!2843) (size!18990 a!3626)) k!2843 from!3004)))

(declare-fun b!660970 () Bool)

(declare-fun res!429040 () Bool)

(assert (=> b!660970 (=> (not res!429040) (not e!379774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!660970 (= res!429040 (validKeyInArray!0 k!2843))))

(declare-fun b!660971 () Bool)

(declare-fun res!429034 () Bool)

(assert (=> b!660971 (=> (not res!429034) (not e!379774))))

(declare-fun contains!3244 (List!12667 (_ BitVec 64)) Bool)

(assert (=> b!660971 (= res!429034 (not (contains!3244 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660972 () Bool)

(declare-fun res!429036 () Bool)

(assert (=> b!660972 (=> (not res!429036) (not e!379774))))

(assert (=> b!660972 (= res!429036 (not (contains!3244 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660973 () Bool)

(declare-fun res!429031 () Bool)

(assert (=> b!660973 (=> (not res!429031) (not e!379774))))

(assert (=> b!660973 (= res!429031 e!379776)))

(declare-fun res!429037 () Bool)

(assert (=> b!660973 (=> res!429037 e!379776)))

(declare-fun e!379772 () Bool)

(assert (=> b!660973 (= res!429037 e!379772)))

(declare-fun res!429029 () Bool)

(assert (=> b!660973 (=> (not res!429029) (not e!379772))))

(assert (=> b!660973 (= res!429029 (bvsgt from!3004 i!1382))))

(declare-fun b!660974 () Bool)

(declare-fun res!429038 () Bool)

(assert (=> b!660974 (=> (not res!429038) (not e!379774))))

(assert (=> b!660974 (= res!429038 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!429032 () Bool)

(assert (=> start!59820 (=> (not res!429032) (not e!379774))))

(assert (=> start!59820 (= res!429032 (and (bvslt (size!18990 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18990 a!3626))))))

(assert (=> start!59820 e!379774))

(assert (=> start!59820 true))

(declare-fun array_inv!14422 (array!38867) Bool)

(assert (=> start!59820 (array_inv!14422 a!3626)))

(declare-fun b!660975 () Bool)

(assert (=> b!660975 (= e!379773 (not (contains!3244 acc!681 k!2843)))))

(declare-fun b!660976 () Bool)

(assert (=> b!660976 (= e!379772 (contains!3244 acc!681 k!2843))))

(declare-fun b!660977 () Bool)

(declare-fun res!429030 () Bool)

(assert (=> b!660977 (=> (not res!429030) (not e!379774))))

(declare-fun noDuplicate!491 (List!12667) Bool)

(assert (=> b!660977 (= res!429030 (noDuplicate!491 acc!681))))

(assert (= (and start!59820 res!429032) b!660977))

(assert (= (and b!660977 res!429030) b!660972))

(assert (= (and b!660972 res!429036) b!660971))

(assert (= (and b!660971 res!429034) b!660973))

(assert (= (and b!660973 res!429029) b!660976))

(assert (= (and b!660973 (not res!429037)) b!660967))

(assert (= (and b!660967 res!429033) b!660975))

(assert (= (and b!660973 res!429031) b!660966))

(assert (= (and b!660966 res!429041) b!660964))

(assert (= (and b!660964 res!429039) b!660965))

(assert (= (and b!660965 res!429035) b!660970))

(assert (= (and b!660970 res!429040) b!660974))

(assert (= (and b!660974 res!429038) b!660968))

(assert (= (and b!660968 res!429028) b!660969))

(declare-fun m!633379 () Bool)

(assert (=> b!660974 m!633379))

(declare-fun m!633381 () Bool)

(assert (=> b!660976 m!633381))

(declare-fun m!633383 () Bool)

(assert (=> b!660971 m!633383))

(declare-fun m!633385 () Bool)

(assert (=> b!660969 m!633385))

(declare-fun m!633387 () Bool)

(assert (=> b!660969 m!633387))

(declare-fun m!633389 () Bool)

(assert (=> b!660972 m!633389))

(declare-fun m!633391 () Bool)

(assert (=> b!660970 m!633391))

(declare-fun m!633393 () Bool)

(assert (=> start!59820 m!633393))

(assert (=> b!660975 m!633381))

(declare-fun m!633395 () Bool)

(assert (=> b!660966 m!633395))

(declare-fun m!633397 () Bool)

(assert (=> b!660977 m!633397))

(declare-fun m!633399 () Bool)

(assert (=> b!660964 m!633399))

(push 1)

