; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62216 () Bool)

(assert start!62216)

(declare-fun b!697050 () Bool)

(declare-fun res!460969 () Bool)

(declare-fun e!396301 () Bool)

(assert (=> b!697050 (=> (not res!460969) (not e!396301))))

(declare-datatypes ((List!13187 0))(
  ( (Nil!13184) (Cons!13183 (h!14228 (_ BitVec 64)) (t!19469 List!13187)) )
))
(declare-fun acc!681 () List!13187)

(declare-fun contains!3764 (List!13187 (_ BitVec 64)) Bool)

(assert (=> b!697050 (= res!460969 (not (contains!3764 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697051 () Bool)

(declare-fun e!396297 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!697051 (= e!396297 (contains!3764 acc!681 k!2843))))

(declare-fun b!697052 () Bool)

(declare-fun res!460986 () Bool)

(assert (=> b!697052 (=> (not res!460986) (not e!396301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697052 (= res!460986 (validKeyInArray!0 k!2843))))

(declare-fun res!460971 () Bool)

(assert (=> start!62216 (=> (not res!460971) (not e!396301))))

(declare-datatypes ((array!39973 0))(
  ( (array!39974 (arr!19146 (Array (_ BitVec 32) (_ BitVec 64))) (size!19531 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39973)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!62216 (= res!460971 (and (bvslt (size!19531 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19531 a!3626))))))

(assert (=> start!62216 e!396301))

(assert (=> start!62216 true))

(declare-fun array_inv!14942 (array!39973) Bool)

(assert (=> start!62216 (array_inv!14942 a!3626)))

(declare-fun b!697053 () Bool)

(declare-fun res!460982 () Bool)

(assert (=> b!697053 (=> (not res!460982) (not e!396301))))

(assert (=> b!697053 (= res!460982 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!697054 () Bool)

(declare-fun res!460973 () Bool)

(assert (=> b!697054 (=> (not res!460973) (not e!396301))))

(declare-fun arrayNoDuplicates!0 (array!39973 (_ BitVec 32) List!13187) Bool)

(assert (=> b!697054 (= res!460973 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697055 () Bool)

(declare-fun e!396299 () Bool)

(declare-fun e!396302 () Bool)

(assert (=> b!697055 (= e!396299 e!396302)))

(declare-fun res!460970 () Bool)

(assert (=> b!697055 (=> (not res!460970) (not e!396302))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!697055 (= res!460970 (bvsle from!3004 i!1382))))

(declare-fun b!697056 () Bool)

(assert (=> b!697056 (= e!396302 (not (contains!3764 acc!681 k!2843)))))

(declare-fun b!697057 () Bool)

(declare-fun res!460981 () Bool)

(assert (=> b!697057 (=> (not res!460981) (not e!396301))))

(assert (=> b!697057 (= res!460981 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697058 () Bool)

(declare-fun res!460972 () Bool)

(assert (=> b!697058 (=> (not res!460972) (not e!396301))))

(assert (=> b!697058 (= res!460972 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13184))))

(declare-fun b!697059 () Bool)

(declare-fun res!460976 () Bool)

(assert (=> b!697059 (=> (not res!460976) (not e!396301))))

(declare-fun arrayContainsKey!0 (array!39973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697059 (= res!460976 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!697060 () Bool)

(assert (=> b!697060 (= e!396301 (bvsge (bvsub (size!19531 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) (bvsub (size!19531 a!3626) from!3004)))))

(declare-fun b!697061 () Bool)

(declare-fun res!460968 () Bool)

(assert (=> b!697061 (=> (not res!460968) (not e!396301))))

(assert (=> b!697061 (= res!460968 (not (contains!3764 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697062 () Bool)

(declare-fun res!460984 () Bool)

(assert (=> b!697062 (=> (not res!460984) (not e!396301))))

(assert (=> b!697062 (= res!460984 e!396299)))

(declare-fun res!460987 () Bool)

(assert (=> b!697062 (=> res!460987 e!396299)))

(assert (=> b!697062 (= res!460987 e!396297)))

(declare-fun res!460974 () Bool)

(assert (=> b!697062 (=> (not res!460974) (not e!396297))))

(assert (=> b!697062 (= res!460974 (bvsgt from!3004 i!1382))))

(declare-fun b!697063 () Bool)

(declare-fun res!460975 () Bool)

(assert (=> b!697063 (=> (not res!460975) (not e!396301))))

(assert (=> b!697063 (= res!460975 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19531 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!697064 () Bool)

(declare-fun e!396303 () Bool)

(assert (=> b!697064 (= e!396303 (not (contains!3764 acc!681 k!2843)))))

(declare-fun b!697065 () Bool)

(declare-fun res!460988 () Bool)

(assert (=> b!697065 (=> (not res!460988) (not e!396301))))

(declare-fun noDuplicate!1011 (List!13187) Bool)

(assert (=> b!697065 (= res!460988 (noDuplicate!1011 acc!681))))

(declare-fun b!697066 () Bool)

(declare-fun e!396298 () Bool)

(assert (=> b!697066 (= e!396298 (contains!3764 acc!681 k!2843))))

(declare-fun b!697067 () Bool)

(declare-fun res!460977 () Bool)

(assert (=> b!697067 (=> (not res!460977) (not e!396301))))

(declare-fun e!396296 () Bool)

(assert (=> b!697067 (= res!460977 e!396296)))

(declare-fun res!460985 () Bool)

(assert (=> b!697067 (=> res!460985 e!396296)))

(assert (=> b!697067 (= res!460985 e!396298)))

(declare-fun res!460980 () Bool)

(assert (=> b!697067 (=> (not res!460980) (not e!396298))))

(assert (=> b!697067 (= res!460980 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697068 () Bool)

(assert (=> b!697068 (= e!396296 e!396303)))

(declare-fun res!460983 () Bool)

(assert (=> b!697068 (=> (not res!460983) (not e!396303))))

(assert (=> b!697068 (= res!460983 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697069 () Bool)

(declare-fun res!460978 () Bool)

(assert (=> b!697069 (=> (not res!460978) (not e!396301))))

(assert (=> b!697069 (= res!460978 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19531 a!3626))))))

(declare-fun b!697070 () Bool)

(declare-fun res!460979 () Bool)

(assert (=> b!697070 (=> (not res!460979) (not e!396301))))

(assert (=> b!697070 (= res!460979 (not (validKeyInArray!0 (select (arr!19146 a!3626) from!3004))))))

(assert (= (and start!62216 res!460971) b!697065))

(assert (= (and b!697065 res!460988) b!697061))

(assert (= (and b!697061 res!460968) b!697050))

(assert (= (and b!697050 res!460969) b!697062))

(assert (= (and b!697062 res!460974) b!697051))

(assert (= (and b!697062 (not res!460987)) b!697055))

(assert (= (and b!697055 res!460970) b!697056))

(assert (= (and b!697062 res!460984) b!697058))

(assert (= (and b!697058 res!460972) b!697054))

(assert (= (and b!697054 res!460973) b!697069))

(assert (= (and b!697069 res!460978) b!697052))

(assert (= (and b!697052 res!460986) b!697059))

(assert (= (and b!697059 res!460976) b!697063))

(assert (= (and b!697063 res!460975) b!697070))

(assert (= (and b!697070 res!460979) b!697053))

(assert (= (and b!697053 res!460982) b!697067))

(assert (= (and b!697067 res!460980) b!697066))

(assert (= (and b!697067 (not res!460985)) b!697068))

(assert (= (and b!697068 res!460983) b!697064))

(assert (= (and b!697067 res!460977) b!697057))

(assert (= (and b!697057 res!460981) b!697060))

(declare-fun m!657683 () Bool)

(assert (=> b!697065 m!657683))

(declare-fun m!657685 () Bool)

(assert (=> b!697064 m!657685))

(assert (=> b!697056 m!657685))

(declare-fun m!657687 () Bool)

(assert (=> b!697061 m!657687))

(declare-fun m!657689 () Bool)

(assert (=> b!697058 m!657689))

(declare-fun m!657691 () Bool)

(assert (=> b!697054 m!657691))

(assert (=> b!697066 m!657685))

(declare-fun m!657693 () Bool)

(assert (=> start!62216 m!657693))

(declare-fun m!657695 () Bool)

(assert (=> b!697057 m!657695))

(assert (=> b!697051 m!657685))

(declare-fun m!657697 () Bool)

(assert (=> b!697070 m!657697))

(assert (=> b!697070 m!657697))

(declare-fun m!657699 () Bool)

(assert (=> b!697070 m!657699))

(declare-fun m!657701 () Bool)

(assert (=> b!697059 m!657701))

(declare-fun m!657703 () Bool)

(assert (=> b!697052 m!657703))

(declare-fun m!657705 () Bool)

(assert (=> b!697050 m!657705))

(push 1)

(assert (not start!62216))

(assert (not b!697061))

(assert (not b!697065))

(assert (not b!697057))

(assert (not b!697052))

(assert (not b!697070))

(assert (not b!697051))

(assert (not b!697056))

(assert (not b!697050))

(assert (not b!697066))

(assert (not b!697059))

(assert (not b!697054))

(assert (not b!697058))

(assert (not b!697064))

(check-sat)

(pop 1)

(push 1)

(check-sat)

