; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61848 () Bool)

(assert start!61848)

(declare-fun b!692007 () Bool)

(declare-fun res!456230 () Bool)

(declare-fun e!393776 () Bool)

(assert (=> b!692007 (=> (not res!456230) (not e!393776))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39807 0))(
  ( (array!39808 (arr!19069 (Array (_ BitVec 32) (_ BitVec 64))) (size!19452 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39807)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!692007 (= res!456230 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19452 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!692008 () Bool)

(declare-fun res!456220 () Bool)

(assert (=> b!692008 (=> (not res!456220) (not e!393776))))

(declare-datatypes ((List!13017 0))(
  ( (Nil!13014) (Cons!13013 (h!14061 (_ BitVec 64)) (t!19276 List!13017)) )
))
(declare-fun acc!681 () List!13017)

(declare-fun contains!3669 (List!13017 (_ BitVec 64)) Bool)

(assert (=> b!692008 (= res!456220 (not (contains!3669 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692009 () Bool)

(declare-fun res!456227 () Bool)

(assert (=> b!692009 (=> (not res!456227) (not e!393776))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!692009 (= res!456227 (validKeyInArray!0 k0!2843))))

(declare-fun b!692010 () Bool)

(declare-fun res!456223 () Bool)

(assert (=> b!692010 (=> (not res!456223) (not e!393776))))

(assert (=> b!692010 (= res!456223 (not (contains!3669 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692012 () Bool)

(declare-fun e!393773 () Bool)

(declare-fun e!393774 () Bool)

(assert (=> b!692012 (= e!393773 e!393774)))

(declare-fun res!456228 () Bool)

(assert (=> b!692012 (=> (not res!456228) (not e!393774))))

(assert (=> b!692012 (= res!456228 (bvsle from!3004 i!1382))))

(declare-fun b!692013 () Bool)

(declare-datatypes ((Unit!24393 0))(
  ( (Unit!24394) )
))
(declare-fun e!393775 () Unit!24393)

(declare-fun Unit!24395 () Unit!24393)

(assert (=> b!692013 (= e!393775 Unit!24395)))

(declare-fun b!692014 () Bool)

(declare-fun Unit!24396 () Unit!24393)

(assert (=> b!692014 (= e!393775 Unit!24396)))

(declare-fun arrayContainsKey!0 (array!39807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!692014 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316609 () Unit!24393)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39807 (_ BitVec 64) (_ BitVec 32)) Unit!24393)

(assert (=> b!692014 (= lt!316609 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!692014 false))

(declare-fun b!692015 () Bool)

(assert (=> b!692015 (= e!393774 (not (contains!3669 acc!681 k0!2843)))))

(declare-fun b!692016 () Bool)

(declare-fun res!456224 () Bool)

(assert (=> b!692016 (=> (not res!456224) (not e!393776))))

(assert (=> b!692016 (= res!456224 (validKeyInArray!0 (select (arr!19069 a!3626) from!3004)))))

(declare-fun b!692017 () Bool)

(declare-fun res!456225 () Bool)

(assert (=> b!692017 (=> (not res!456225) (not e!393776))))

(declare-fun noDuplicate!943 (List!13017) Bool)

(assert (=> b!692017 (= res!456225 (noDuplicate!943 acc!681))))

(declare-fun b!692018 () Bool)

(assert (=> b!692018 (= e!393776 (and (not (= (select (arr!19069 a!3626) from!3004) k0!2843)) (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun lt!316608 () Unit!24393)

(assert (=> b!692018 (= lt!316608 e!393775)))

(declare-fun c!78263 () Bool)

(assert (=> b!692018 (= c!78263 (= (select (arr!19069 a!3626) from!3004) k0!2843))))

(declare-fun b!692019 () Bool)

(declare-fun res!456222 () Bool)

(assert (=> b!692019 (=> (not res!456222) (not e!393776))))

(assert (=> b!692019 (= res!456222 e!393773)))

(declare-fun res!456229 () Bool)

(assert (=> b!692019 (=> res!456229 e!393773)))

(declare-fun e!393772 () Bool)

(assert (=> b!692019 (= res!456229 e!393772)))

(declare-fun res!456218 () Bool)

(assert (=> b!692019 (=> (not res!456218) (not e!393772))))

(assert (=> b!692019 (= res!456218 (bvsgt from!3004 i!1382))))

(declare-fun b!692020 () Bool)

(assert (=> b!692020 (= e!393772 (contains!3669 acc!681 k0!2843))))

(declare-fun b!692021 () Bool)

(declare-fun res!456231 () Bool)

(assert (=> b!692021 (=> (not res!456231) (not e!393776))))

(declare-fun arrayNoDuplicates!0 (array!39807 (_ BitVec 32) List!13017) Bool)

(assert (=> b!692021 (= res!456231 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!692022 () Bool)

(declare-fun res!456232 () Bool)

(assert (=> b!692022 (=> (not res!456232) (not e!393776))))

(assert (=> b!692022 (= res!456232 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!692023 () Bool)

(declare-fun res!456221 () Bool)

(assert (=> b!692023 (=> (not res!456221) (not e!393776))))

(assert (=> b!692023 (= res!456221 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19452 a!3626))))))

(declare-fun b!692011 () Bool)

(declare-fun res!456219 () Bool)

(assert (=> b!692011 (=> (not res!456219) (not e!393776))))

(assert (=> b!692011 (= res!456219 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13014))))

(declare-fun res!456226 () Bool)

(assert (=> start!61848 (=> (not res!456226) (not e!393776))))

(assert (=> start!61848 (= res!456226 (and (bvslt (size!19452 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19452 a!3626))))))

(assert (=> start!61848 e!393776))

(assert (=> start!61848 true))

(declare-fun array_inv!14928 (array!39807) Bool)

(assert (=> start!61848 (array_inv!14928 a!3626)))

(assert (= (and start!61848 res!456226) b!692017))

(assert (= (and b!692017 res!456225) b!692008))

(assert (= (and b!692008 res!456220) b!692010))

(assert (= (and b!692010 res!456223) b!692019))

(assert (= (and b!692019 res!456218) b!692020))

(assert (= (and b!692019 (not res!456229)) b!692012))

(assert (= (and b!692012 res!456228) b!692015))

(assert (= (and b!692019 res!456222) b!692011))

(assert (= (and b!692011 res!456219) b!692021))

(assert (= (and b!692021 res!456231) b!692023))

(assert (= (and b!692023 res!456221) b!692009))

(assert (= (and b!692009 res!456227) b!692022))

(assert (= (and b!692022 res!456232) b!692007))

(assert (= (and b!692007 res!456230) b!692016))

(assert (= (and b!692016 res!456224) b!692018))

(assert (= (and b!692018 c!78263) b!692014))

(assert (= (and b!692018 (not c!78263)) b!692013))

(declare-fun m!655339 () Bool)

(assert (=> b!692011 m!655339))

(declare-fun m!655341 () Bool)

(assert (=> b!692010 m!655341))

(declare-fun m!655343 () Bool)

(assert (=> start!61848 m!655343))

(declare-fun m!655345 () Bool)

(assert (=> b!692008 m!655345))

(declare-fun m!655347 () Bool)

(assert (=> b!692018 m!655347))

(declare-fun m!655349 () Bool)

(assert (=> b!692021 m!655349))

(declare-fun m!655351 () Bool)

(assert (=> b!692022 m!655351))

(declare-fun m!655353 () Bool)

(assert (=> b!692020 m!655353))

(declare-fun m!655355 () Bool)

(assert (=> b!692009 m!655355))

(declare-fun m!655357 () Bool)

(assert (=> b!692017 m!655357))

(assert (=> b!692015 m!655353))

(assert (=> b!692016 m!655347))

(assert (=> b!692016 m!655347))

(declare-fun m!655359 () Bool)

(assert (=> b!692016 m!655359))

(declare-fun m!655361 () Bool)

(assert (=> b!692014 m!655361))

(declare-fun m!655363 () Bool)

(assert (=> b!692014 m!655363))

(check-sat (not b!692015) (not b!692020) (not b!692014) (not b!692017) (not b!692011) (not b!692008) (not start!61848) (not b!692022) (not b!692010) (not b!692016) (not b!692009) (not b!692021))
(check-sat)
