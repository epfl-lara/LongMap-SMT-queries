; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60416 () Bool)

(assert start!60416)

(declare-fun b!678787 () Bool)

(declare-fun res!445182 () Bool)

(declare-fun e!386814 () Bool)

(assert (=> b!678787 (=> (not res!445182) (not e!386814))))

(declare-datatypes ((List!12947 0))(
  ( (Nil!12944) (Cons!12943 (h!13988 (_ BitVec 64)) (t!19175 List!12947)) )
))
(declare-fun acc!681 () List!12947)

(declare-fun contains!3524 (List!12947 (_ BitVec 64)) Bool)

(assert (=> b!678787 (= res!445182 (not (contains!3524 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!445174 () Bool)

(assert (=> start!60416 (=> (not res!445174) (not e!386814))))

(declare-datatypes ((array!39430 0))(
  ( (array!39431 (arr!18906 (Array (_ BitVec 32) (_ BitVec 64))) (size!19270 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39430)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60416 (= res!445174 (and (bvslt (size!19270 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19270 a!3626))))))

(assert (=> start!60416 e!386814))

(assert (=> start!60416 true))

(declare-fun array_inv!14702 (array!39430) Bool)

(assert (=> start!60416 (array_inv!14702 a!3626)))

(declare-fun b!678788 () Bool)

(assert (=> b!678788 (= e!386814 (not true))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678788 (arrayContainsKey!0 (array!39431 (store (arr!18906 a!3626) i!1382 k!2843) (size!19270 a!3626)) k!2843 from!3004)))

(declare-fun b!678789 () Bool)

(declare-fun res!445183 () Bool)

(assert (=> b!678789 (=> (not res!445183) (not e!386814))))

(assert (=> b!678789 (= res!445183 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19270 a!3626))))))

(declare-fun b!678790 () Bool)

(declare-fun res!445177 () Bool)

(assert (=> b!678790 (=> (not res!445177) (not e!386814))))

(declare-fun e!386810 () Bool)

(assert (=> b!678790 (= res!445177 e!386810)))

(declare-fun res!445179 () Bool)

(assert (=> b!678790 (=> res!445179 e!386810)))

(declare-fun e!386812 () Bool)

(assert (=> b!678790 (= res!445179 e!386812)))

(declare-fun res!445184 () Bool)

(assert (=> b!678790 (=> (not res!445184) (not e!386812))))

(assert (=> b!678790 (= res!445184 (bvsgt from!3004 i!1382))))

(declare-fun b!678791 () Bool)

(declare-fun res!445180 () Bool)

(assert (=> b!678791 (=> (not res!445180) (not e!386814))))

(declare-fun arrayNoDuplicates!0 (array!39430 (_ BitVec 32) List!12947) Bool)

(assert (=> b!678791 (= res!445180 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12944))))

(declare-fun b!678792 () Bool)

(declare-fun res!445178 () Bool)

(assert (=> b!678792 (=> (not res!445178) (not e!386814))))

(assert (=> b!678792 (= res!445178 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678793 () Bool)

(declare-fun e!386811 () Bool)

(assert (=> b!678793 (= e!386811 (not (contains!3524 acc!681 k!2843)))))

(declare-fun b!678794 () Bool)

(declare-fun res!445171 () Bool)

(assert (=> b!678794 (=> (not res!445171) (not e!386814))))

(declare-fun noDuplicate!771 (List!12947) Bool)

(assert (=> b!678794 (= res!445171 (noDuplicate!771 acc!681))))

(declare-fun b!678795 () Bool)

(declare-fun res!445175 () Bool)

(assert (=> b!678795 (=> (not res!445175) (not e!386814))))

(assert (=> b!678795 (= res!445175 (not (contains!3524 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678796 () Bool)

(declare-fun res!445176 () Bool)

(assert (=> b!678796 (=> (not res!445176) (not e!386814))))

(assert (=> b!678796 (= res!445176 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19270 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!678797 () Bool)

(declare-fun res!445173 () Bool)

(assert (=> b!678797 (=> (not res!445173) (not e!386814))))

(assert (=> b!678797 (= res!445173 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678798 () Bool)

(declare-fun res!445181 () Bool)

(assert (=> b!678798 (=> (not res!445181) (not e!386814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678798 (= res!445181 (validKeyInArray!0 k!2843))))

(declare-fun b!678799 () Bool)

(assert (=> b!678799 (= e!386810 e!386811)))

(declare-fun res!445172 () Bool)

(assert (=> b!678799 (=> (not res!445172) (not e!386811))))

(assert (=> b!678799 (= res!445172 (bvsle from!3004 i!1382))))

(declare-fun b!678800 () Bool)

(assert (=> b!678800 (= e!386812 (contains!3524 acc!681 k!2843))))

(assert (= (and start!60416 res!445174) b!678794))

(assert (= (and b!678794 res!445171) b!678787))

(assert (= (and b!678787 res!445182) b!678795))

(assert (= (and b!678795 res!445175) b!678790))

(assert (= (and b!678790 res!445184) b!678800))

(assert (= (and b!678790 (not res!445179)) b!678799))

(assert (= (and b!678799 res!445172) b!678793))

(assert (= (and b!678790 res!445177) b!678791))

(assert (= (and b!678791 res!445180) b!678792))

(assert (= (and b!678792 res!445178) b!678789))

(assert (= (and b!678789 res!445183) b!678798))

(assert (= (and b!678798 res!445181) b!678797))

(assert (= (and b!678797 res!445173) b!678796))

(assert (= (and b!678796 res!445176) b!678788))

(declare-fun m!644447 () Bool)

(assert (=> b!678797 m!644447))

(declare-fun m!644449 () Bool)

(assert (=> b!678795 m!644449))

(declare-fun m!644451 () Bool)

(assert (=> b!678792 m!644451))

(declare-fun m!644453 () Bool)

(assert (=> b!678800 m!644453))

(declare-fun m!644455 () Bool)

(assert (=> b!678794 m!644455))

(declare-fun m!644457 () Bool)

(assert (=> b!678791 m!644457))

(declare-fun m!644459 () Bool)

(assert (=> b!678788 m!644459))

(declare-fun m!644461 () Bool)

(assert (=> b!678788 m!644461))

(declare-fun m!644463 () Bool)

(assert (=> b!678787 m!644463))

(assert (=> b!678793 m!644453))

(declare-fun m!644465 () Bool)

(assert (=> start!60416 m!644465))

(declare-fun m!644467 () Bool)

(assert (=> b!678798 m!644467))

(push 1)

(assert (not b!678791))

(assert (not b!678800))

(assert (not b!678792))

(assert (not b!678793))

(assert (not b!678788))

(assert (not start!60416))

(assert (not b!678798))

(assert (not b!678795))

(assert (not b!678787))

(assert (not b!678797))

(assert (not b!678794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

