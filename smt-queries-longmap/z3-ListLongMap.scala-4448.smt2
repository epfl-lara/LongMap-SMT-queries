; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61778 () Bool)

(assert start!61778)

(declare-fun b!691487 () Bool)

(declare-fun res!455972 () Bool)

(declare-fun e!393446 () Bool)

(assert (=> b!691487 (=> (not res!455972) (not e!393446))))

(declare-datatypes ((array!39810 0))(
  ( (array!39811 (arr!19073 (Array (_ BitVec 32) (_ BitVec 64))) (size!19455 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39810)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691487 (= res!455972 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691489 () Bool)

(declare-fun e!393441 () Bool)

(declare-datatypes ((List!13153 0))(
  ( (Nil!13150) (Cons!13149 (h!14194 (_ BitVec 64)) (t!19411 List!13153)) )
))
(declare-fun acc!681 () List!13153)

(declare-fun contains!3675 (List!13153 (_ BitVec 64)) Bool)

(assert (=> b!691489 (= e!393441 (contains!3675 acc!681 k0!2843))))

(declare-fun b!691490 () Bool)

(declare-fun res!455977 () Bool)

(assert (=> b!691490 (=> (not res!455977) (not e!393446))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39810 (_ BitVec 32) List!13153) Bool)

(assert (=> b!691490 (= res!455977 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691491 () Bool)

(declare-datatypes ((Unit!24392 0))(
  ( (Unit!24393) )
))
(declare-fun e!393443 () Unit!24392)

(declare-fun Unit!24394 () Unit!24392)

(assert (=> b!691491 (= e!393443 Unit!24394)))

(assert (=> b!691491 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316251 () Unit!24392)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39810 (_ BitVec 64) (_ BitVec 32)) Unit!24392)

(assert (=> b!691491 (= lt!316251 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!691491 false))

(declare-fun b!691492 () Bool)

(declare-fun res!455969 () Bool)

(assert (=> b!691492 (=> (not res!455969) (not e!393446))))

(assert (=> b!691492 (= res!455969 (not (contains!3675 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691493 () Bool)

(declare-fun e!393445 () Bool)

(assert (=> b!691493 (= e!393445 (not (contains!3675 acc!681 k0!2843)))))

(declare-fun b!691488 () Bool)

(declare-fun res!455975 () Bool)

(assert (=> b!691488 (=> (not res!455975) (not e!393446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691488 (= res!455975 (validKeyInArray!0 k0!2843))))

(declare-fun res!455974 () Bool)

(assert (=> start!61778 (=> (not res!455974) (not e!393446))))

(assert (=> start!61778 (= res!455974 (and (bvslt (size!19455 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19455 a!3626))))))

(assert (=> start!61778 e!393446))

(assert (=> start!61778 true))

(declare-fun array_inv!14956 (array!39810) Bool)

(assert (=> start!61778 (array_inv!14956 a!3626)))

(declare-fun b!691494 () Bool)

(declare-fun res!455976 () Bool)

(assert (=> b!691494 (=> (not res!455976) (not e!393446))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691494 (= res!455976 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19455 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691495 () Bool)

(declare-fun res!455978 () Bool)

(assert (=> b!691495 (=> (not res!455978) (not e!393446))))

(assert (=> b!691495 (= res!455978 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13150))))

(declare-fun b!691496 () Bool)

(declare-fun res!455983 () Bool)

(assert (=> b!691496 (=> (not res!455983) (not e!393446))))

(declare-fun e!393444 () Bool)

(assert (=> b!691496 (= res!455983 e!393444)))

(declare-fun res!455973 () Bool)

(assert (=> b!691496 (=> res!455973 e!393444)))

(assert (=> b!691496 (= res!455973 e!393441)))

(declare-fun res!455970 () Bool)

(assert (=> b!691496 (=> (not res!455970) (not e!393441))))

(assert (=> b!691496 (= res!455970 (bvsgt from!3004 i!1382))))

(declare-fun b!691497 () Bool)

(declare-fun res!455971 () Bool)

(assert (=> b!691497 (=> (not res!455971) (not e!393446))))

(assert (=> b!691497 (= res!455971 (validKeyInArray!0 (select (arr!19073 a!3626) from!3004)))))

(declare-fun b!691498 () Bool)

(assert (=> b!691498 (= e!393444 e!393445)))

(declare-fun res!455980 () Bool)

(assert (=> b!691498 (=> (not res!455980) (not e!393445))))

(assert (=> b!691498 (= res!455980 (bvsle from!3004 i!1382))))

(declare-fun b!691499 () Bool)

(declare-fun res!455979 () Bool)

(assert (=> b!691499 (=> (not res!455979) (not e!393446))))

(assert (=> b!691499 (= res!455979 (not (contains!3675 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691500 () Bool)

(declare-fun res!455982 () Bool)

(assert (=> b!691500 (=> (not res!455982) (not e!393446))))

(declare-fun noDuplicate!944 (List!13153) Bool)

(assert (=> b!691500 (= res!455982 (noDuplicate!944 acc!681))))

(declare-fun b!691501 () Bool)

(declare-fun res!455981 () Bool)

(assert (=> b!691501 (=> (not res!455981) (not e!393446))))

(assert (=> b!691501 (= res!455981 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19455 a!3626))))))

(declare-fun b!691502 () Bool)

(assert (=> b!691502 (= e!393446 (and (not (= (select (arr!19073 a!3626) from!3004) k0!2843)) (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun lt!316250 () Unit!24392)

(assert (=> b!691502 (= lt!316250 e!393443)))

(declare-fun c!78126 () Bool)

(assert (=> b!691502 (= c!78126 (= (select (arr!19073 a!3626) from!3004) k0!2843))))

(declare-fun b!691503 () Bool)

(declare-fun Unit!24395 () Unit!24392)

(assert (=> b!691503 (= e!393443 Unit!24395)))

(assert (= (and start!61778 res!455974) b!691500))

(assert (= (and b!691500 res!455982) b!691492))

(assert (= (and b!691492 res!455969) b!691499))

(assert (= (and b!691499 res!455979) b!691496))

(assert (= (and b!691496 res!455970) b!691489))

(assert (= (and b!691496 (not res!455973)) b!691498))

(assert (= (and b!691498 res!455980) b!691493))

(assert (= (and b!691496 res!455983) b!691495))

(assert (= (and b!691495 res!455978) b!691490))

(assert (= (and b!691490 res!455977) b!691501))

(assert (= (and b!691501 res!455981) b!691488))

(assert (= (and b!691488 res!455975) b!691487))

(assert (= (and b!691487 res!455972) b!691494))

(assert (= (and b!691494 res!455976) b!691497))

(assert (= (and b!691497 res!455971) b!691502))

(assert (= (and b!691502 c!78126) b!691491))

(assert (= (and b!691502 (not c!78126)) b!691503))

(declare-fun m!653859 () Bool)

(assert (=> start!61778 m!653859))

(declare-fun m!653861 () Bool)

(assert (=> b!691499 m!653861))

(declare-fun m!653863 () Bool)

(assert (=> b!691493 m!653863))

(declare-fun m!653865 () Bool)

(assert (=> b!691487 m!653865))

(declare-fun m!653867 () Bool)

(assert (=> b!691488 m!653867))

(declare-fun m!653869 () Bool)

(assert (=> b!691491 m!653869))

(declare-fun m!653871 () Bool)

(assert (=> b!691491 m!653871))

(declare-fun m!653873 () Bool)

(assert (=> b!691490 m!653873))

(declare-fun m!653875 () Bool)

(assert (=> b!691492 m!653875))

(declare-fun m!653877 () Bool)

(assert (=> b!691502 m!653877))

(assert (=> b!691489 m!653863))

(assert (=> b!691497 m!653877))

(assert (=> b!691497 m!653877))

(declare-fun m!653879 () Bool)

(assert (=> b!691497 m!653879))

(declare-fun m!653881 () Bool)

(assert (=> b!691500 m!653881))

(declare-fun m!653883 () Bool)

(assert (=> b!691495 m!653883))

(check-sat (not b!691491) (not b!691500) (not b!691497) (not b!691490) (not b!691487) (not start!61778) (not b!691499) (not b!691488) (not b!691495) (not b!691492) (not b!691489) (not b!691493))
(check-sat)
