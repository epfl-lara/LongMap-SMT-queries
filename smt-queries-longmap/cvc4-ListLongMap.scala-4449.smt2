; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61800 () Bool)

(assert start!61800)

(declare-fun b!692038 () Bool)

(declare-datatypes ((Unit!24434 0))(
  ( (Unit!24435) )
))
(declare-fun e!393725 () Unit!24434)

(declare-fun Unit!24436 () Unit!24434)

(assert (=> b!692038 (= e!393725 Unit!24436)))

(declare-fun b!692039 () Bool)

(declare-fun res!456336 () Bool)

(declare-fun e!393721 () Bool)

(assert (=> b!692039 (=> (not res!456336) (not e!393721))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!692039 (= res!456336 (validKeyInArray!0 k!2843))))

(declare-fun b!692040 () Bool)

(declare-fun e!393722 () Bool)

(declare-fun e!393723 () Bool)

(assert (=> b!692040 (= e!393722 e!393723)))

(declare-fun res!456340 () Bool)

(assert (=> b!692040 (=> (not res!456340) (not e!393723))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!692040 (= res!456340 (bvsle from!3004 i!1382))))

(declare-fun b!692041 () Bool)

(declare-fun res!456338 () Bool)

(assert (=> b!692041 (=> (not res!456338) (not e!393721))))

(declare-datatypes ((array!39821 0))(
  ( (array!39822 (arr!19079 (Array (_ BitVec 32) (_ BitVec 64))) (size!19464 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39821)

(assert (=> b!692041 (= res!456338 (validKeyInArray!0 (select (arr!19079 a!3626) from!3004)))))

(declare-fun b!692042 () Bool)

(declare-fun res!456330 () Bool)

(assert (=> b!692042 (=> (not res!456330) (not e!393721))))

(declare-fun arrayContainsKey!0 (array!39821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!692042 (= res!456330 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!692043 () Bool)

(declare-fun Unit!24437 () Unit!24434)

(assert (=> b!692043 (= e!393725 Unit!24437)))

(assert (=> b!692043 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316537 () Unit!24434)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39821 (_ BitVec 64) (_ BitVec 32)) Unit!24434)

(assert (=> b!692043 (= lt!316537 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!692043 false))

(declare-fun b!692044 () Bool)

(declare-fun res!456334 () Bool)

(assert (=> b!692044 (=> (not res!456334) (not e!393721))))

(assert (=> b!692044 (= res!456334 e!393722)))

(declare-fun res!456337 () Bool)

(assert (=> b!692044 (=> res!456337 e!393722)))

(declare-fun e!393726 () Bool)

(assert (=> b!692044 (= res!456337 e!393726)))

(declare-fun res!456333 () Bool)

(assert (=> b!692044 (=> (not res!456333) (not e!393726))))

(assert (=> b!692044 (= res!456333 (bvsgt from!3004 i!1382))))

(declare-fun b!692045 () Bool)

(declare-fun res!456339 () Bool)

(assert (=> b!692045 (=> (not res!456339) (not e!393721))))

(declare-datatypes ((List!13120 0))(
  ( (Nil!13117) (Cons!13116 (h!14161 (_ BitVec 64)) (t!19387 List!13120)) )
))
(declare-fun acc!681 () List!13120)

(declare-fun arrayNoDuplicates!0 (array!39821 (_ BitVec 32) List!13120) Bool)

(assert (=> b!692045 (= res!456339 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!692046 () Bool)

(declare-fun res!456335 () Bool)

(assert (=> b!692046 (=> (not res!456335) (not e!393721))))

(declare-fun noDuplicate!944 (List!13120) Bool)

(assert (=> b!692046 (= res!456335 (noDuplicate!944 acc!681))))

(declare-fun b!692047 () Bool)

(declare-fun res!456344 () Bool)

(assert (=> b!692047 (=> (not res!456344) (not e!393721))))

(declare-fun contains!3697 (List!13120 (_ BitVec 64)) Bool)

(assert (=> b!692047 (= res!456344 (not (contains!3697 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692048 () Bool)

(declare-fun res!456331 () Bool)

(assert (=> b!692048 (=> (not res!456331) (not e!393721))))

(assert (=> b!692048 (= res!456331 (not (contains!3697 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692050 () Bool)

(declare-fun res!456341 () Bool)

(assert (=> b!692050 (=> (not res!456341) (not e!393721))))

(assert (=> b!692050 (= res!456341 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19464 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!692051 () Bool)

(declare-fun res!456332 () Bool)

(assert (=> b!692051 (=> (not res!456332) (not e!393721))))

(assert (=> b!692051 (= res!456332 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13117))))

(declare-fun b!692052 () Bool)

(assert (=> b!692052 (= e!393721 false)))

(declare-fun lt!316536 () Unit!24434)

(assert (=> b!692052 (= lt!316536 e!393725)))

(declare-fun c!78221 () Bool)

(assert (=> b!692052 (= c!78221 (= (select (arr!19079 a!3626) from!3004) k!2843))))

(declare-fun b!692053 () Bool)

(assert (=> b!692053 (= e!393723 (not (contains!3697 acc!681 k!2843)))))

(declare-fun b!692054 () Bool)

(declare-fun res!456342 () Bool)

(assert (=> b!692054 (=> (not res!456342) (not e!393721))))

(assert (=> b!692054 (= res!456342 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19464 a!3626))))))

(declare-fun b!692049 () Bool)

(assert (=> b!692049 (= e!393726 (contains!3697 acc!681 k!2843))))

(declare-fun res!456343 () Bool)

(assert (=> start!61800 (=> (not res!456343) (not e!393721))))

(assert (=> start!61800 (= res!456343 (and (bvslt (size!19464 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19464 a!3626))))))

(assert (=> start!61800 e!393721))

(assert (=> start!61800 true))

(declare-fun array_inv!14875 (array!39821) Bool)

(assert (=> start!61800 (array_inv!14875 a!3626)))

(assert (= (and start!61800 res!456343) b!692046))

(assert (= (and b!692046 res!456335) b!692048))

(assert (= (and b!692048 res!456331) b!692047))

(assert (= (and b!692047 res!456344) b!692044))

(assert (= (and b!692044 res!456333) b!692049))

(assert (= (and b!692044 (not res!456337)) b!692040))

(assert (= (and b!692040 res!456340) b!692053))

(assert (= (and b!692044 res!456334) b!692051))

(assert (= (and b!692051 res!456332) b!692045))

(assert (= (and b!692045 res!456339) b!692054))

(assert (= (and b!692054 res!456342) b!692039))

(assert (= (and b!692039 res!456336) b!692042))

(assert (= (and b!692042 res!456330) b!692050))

(assert (= (and b!692050 res!456341) b!692041))

(assert (= (and b!692041 res!456338) b!692052))

(assert (= (and b!692052 c!78221) b!692043))

(assert (= (and b!692052 (not c!78221)) b!692038))

(declare-fun m!654771 () Bool)

(assert (=> b!692048 m!654771))

(declare-fun m!654773 () Bool)

(assert (=> b!692052 m!654773))

(declare-fun m!654775 () Bool)

(assert (=> b!692051 m!654775))

(declare-fun m!654777 () Bool)

(assert (=> b!692046 m!654777))

(declare-fun m!654779 () Bool)

(assert (=> b!692053 m!654779))

(declare-fun m!654781 () Bool)

(assert (=> start!61800 m!654781))

(declare-fun m!654783 () Bool)

(assert (=> b!692043 m!654783))

(declare-fun m!654785 () Bool)

(assert (=> b!692043 m!654785))

(declare-fun m!654787 () Bool)

(assert (=> b!692042 m!654787))

(assert (=> b!692041 m!654773))

(assert (=> b!692041 m!654773))

(declare-fun m!654789 () Bool)

(assert (=> b!692041 m!654789))

(declare-fun m!654791 () Bool)

(assert (=> b!692045 m!654791))

(declare-fun m!654793 () Bool)

(assert (=> b!692047 m!654793))

(declare-fun m!654795 () Bool)

(assert (=> b!692039 m!654795))

(assert (=> b!692049 m!654779))

(push 1)

(assert (not b!692042))

(assert (not b!692048))

(assert (not b!692047))

(assert (not b!692039))

(assert (not b!692053))

(assert (not start!61800))

(assert (not b!692049))

(assert (not b!692043))

(assert (not b!692045))

(assert (not b!692051))

(assert (not b!692046))

(assert (not b!692041))

(check-sat)

