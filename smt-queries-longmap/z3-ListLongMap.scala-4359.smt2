; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60240 () Bool)

(assert start!60240)

(declare-fun b!672954 () Bool)

(declare-fun res!439460 () Bool)

(declare-fun e!384408 () Bool)

(assert (=> b!672954 (=> (not res!439460) (not e!384408))))

(declare-datatypes ((List!12750 0))(
  ( (Nil!12747) (Cons!12746 (h!13794 (_ BitVec 64)) (t!18970 List!12750)) )
))
(declare-fun lt!312458 () List!12750)

(declare-fun noDuplicate!676 (List!12750) Bool)

(assert (=> b!672954 (= res!439460 (noDuplicate!676 lt!312458))))

(declare-fun b!672955 () Bool)

(declare-fun res!439462 () Bool)

(assert (=> b!672955 (=> (not res!439462) (not e!384408))))

(declare-fun contains!3402 (List!12750 (_ BitVec 64)) Bool)

(assert (=> b!672955 (= res!439462 (not (contains!3402 lt!312458 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672956 () Bool)

(declare-datatypes ((Unit!23619 0))(
  ( (Unit!23620) )
))
(declare-fun e!384405 () Unit!23619)

(declare-fun Unit!23621 () Unit!23619)

(assert (=> b!672956 (= e!384405 Unit!23621)))

(declare-datatypes ((array!39225 0))(
  ( (array!39226 (arr!18802 (Array (_ BitVec 32) (_ BitVec 64))) (size!19166 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39225)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!39225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672956 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312459 () Unit!23619)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39225 (_ BitVec 64) (_ BitVec 32)) Unit!23619)

(assert (=> b!672956 (= lt!312459 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!672956 false))

(declare-fun b!672958 () Bool)

(declare-fun res!439459 () Bool)

(declare-fun e!384411 () Bool)

(assert (=> b!672958 (=> (not res!439459) (not e!384411))))

(declare-fun arrayNoDuplicates!0 (array!39225 (_ BitVec 32) List!12750) Bool)

(assert (=> b!672958 (= res!439459 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12747))))

(declare-fun b!672959 () Bool)

(declare-fun res!439455 () Bool)

(assert (=> b!672959 (=> (not res!439455) (not e!384411))))

(declare-fun acc!681 () List!12750)

(assert (=> b!672959 (= res!439455 (noDuplicate!676 acc!681))))

(declare-fun b!672960 () Bool)

(declare-fun res!439451 () Bool)

(assert (=> b!672960 (=> (not res!439451) (not e!384411))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672960 (= res!439451 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19166 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672961 () Bool)

(declare-fun res!439457 () Bool)

(assert (=> b!672961 (=> (not res!439457) (not e!384408))))

(assert (=> b!672961 (= res!439457 (not (contains!3402 lt!312458 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672962 () Bool)

(declare-fun e!384412 () Bool)

(assert (=> b!672962 (= e!384412 (not (contains!3402 acc!681 k0!2843)))))

(declare-fun b!672963 () Bool)

(declare-fun e!384407 () Bool)

(assert (=> b!672963 (= e!384407 (not (contains!3402 lt!312458 k0!2843)))))

(declare-fun b!672964 () Bool)

(declare-fun e!384409 () Bool)

(assert (=> b!672964 (= e!384411 e!384409)))

(declare-fun res!439450 () Bool)

(assert (=> b!672964 (=> (not res!439450) (not e!384409))))

(assert (=> b!672964 (= res!439450 (not (= (select (arr!18802 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312460 () Unit!23619)

(assert (=> b!672964 (= lt!312460 e!384405)))

(declare-fun c!77123 () Bool)

(assert (=> b!672964 (= c!77123 (= (select (arr!18802 a!3626) from!3004) k0!2843))))

(declare-fun b!672965 () Bool)

(declare-fun e!384410 () Bool)

(assert (=> b!672965 (= e!384410 e!384407)))

(declare-fun res!439466 () Bool)

(assert (=> b!672965 (=> (not res!439466) (not e!384407))))

(assert (=> b!672965 (= res!439466 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672966 () Bool)

(declare-fun res!439461 () Bool)

(assert (=> b!672966 (=> (not res!439461) (not e!384411))))

(assert (=> b!672966 (= res!439461 (not (contains!3402 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672967 () Bool)

(declare-fun res!439458 () Bool)

(assert (=> b!672967 (=> (not res!439458) (not e!384408))))

(assert (=> b!672967 (= res!439458 e!384410)))

(declare-fun res!439449 () Bool)

(assert (=> b!672967 (=> res!439449 e!384410)))

(declare-fun e!384406 () Bool)

(assert (=> b!672967 (= res!439449 e!384406)))

(declare-fun res!439464 () Bool)

(assert (=> b!672967 (=> (not res!439464) (not e!384406))))

(assert (=> b!672967 (= res!439464 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672968 () Bool)

(declare-fun e!384413 () Bool)

(assert (=> b!672968 (= e!384413 (contains!3402 acc!681 k0!2843))))

(declare-fun res!439453 () Bool)

(assert (=> start!60240 (=> (not res!439453) (not e!384411))))

(assert (=> start!60240 (= res!439453 (and (bvslt (size!19166 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19166 a!3626))))))

(assert (=> start!60240 e!384411))

(assert (=> start!60240 true))

(declare-fun array_inv!14661 (array!39225) Bool)

(assert (=> start!60240 (array_inv!14661 a!3626)))

(declare-fun b!672957 () Bool)

(declare-fun res!439446 () Bool)

(assert (=> b!672957 (=> (not res!439446) (not e!384411))))

(declare-fun e!384414 () Bool)

(assert (=> b!672957 (= res!439446 e!384414)))

(declare-fun res!439445 () Bool)

(assert (=> b!672957 (=> res!439445 e!384414)))

(assert (=> b!672957 (= res!439445 e!384413)))

(declare-fun res!439447 () Bool)

(assert (=> b!672957 (=> (not res!439447) (not e!384413))))

(assert (=> b!672957 (= res!439447 (bvsgt from!3004 i!1382))))

(declare-fun b!672969 () Bool)

(declare-fun res!439452 () Bool)

(assert (=> b!672969 (=> (not res!439452) (not e!384411))))

(assert (=> b!672969 (= res!439452 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672970 () Bool)

(assert (=> b!672970 (= e!384406 (contains!3402 lt!312458 k0!2843))))

(declare-fun b!672971 () Bool)

(declare-fun res!439456 () Bool)

(assert (=> b!672971 (=> (not res!439456) (not e!384411))))

(assert (=> b!672971 (= res!439456 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672972 () Bool)

(declare-fun res!439465 () Bool)

(assert (=> b!672972 (=> (not res!439465) (not e!384411))))

(assert (=> b!672972 (= res!439465 (not (contains!3402 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672973 () Bool)

(declare-fun res!439467 () Bool)

(assert (=> b!672973 (=> (not res!439467) (not e!384411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672973 (= res!439467 (validKeyInArray!0 (select (arr!18802 a!3626) from!3004)))))

(declare-fun b!672974 () Bool)

(assert (=> b!672974 (= e!384414 e!384412)))

(declare-fun res!439468 () Bool)

(assert (=> b!672974 (=> (not res!439468) (not e!384412))))

(assert (=> b!672974 (= res!439468 (bvsle from!3004 i!1382))))

(declare-fun b!672975 () Bool)

(assert (=> b!672975 (= e!384409 e!384408)))

(declare-fun res!439448 () Bool)

(assert (=> b!672975 (=> (not res!439448) (not e!384408))))

(assert (=> b!672975 (= res!439448 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!272 (List!12750 (_ BitVec 64)) List!12750)

(assert (=> b!672975 (= lt!312458 ($colon$colon!272 acc!681 (select (arr!18802 a!3626) from!3004)))))

(declare-fun b!672976 () Bool)

(declare-fun res!439454 () Bool)

(assert (=> b!672976 (=> (not res!439454) (not e!384411))))

(assert (=> b!672976 (= res!439454 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19166 a!3626))))))

(declare-fun b!672977 () Bool)

(assert (=> b!672977 (= e!384408 false)))

(declare-fun lt!312457 () Bool)

(assert (=> b!672977 (= lt!312457 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312458))))

(declare-fun b!672978 () Bool)

(declare-fun Unit!23622 () Unit!23619)

(assert (=> b!672978 (= e!384405 Unit!23622)))

(declare-fun b!672979 () Bool)

(declare-fun res!439463 () Bool)

(assert (=> b!672979 (=> (not res!439463) (not e!384411))))

(assert (=> b!672979 (= res!439463 (validKeyInArray!0 k0!2843))))

(assert (= (and start!60240 res!439453) b!672959))

(assert (= (and b!672959 res!439455) b!672972))

(assert (= (and b!672972 res!439465) b!672966))

(assert (= (and b!672966 res!439461) b!672957))

(assert (= (and b!672957 res!439447) b!672968))

(assert (= (and b!672957 (not res!439445)) b!672974))

(assert (= (and b!672974 res!439468) b!672962))

(assert (= (and b!672957 res!439446) b!672958))

(assert (= (and b!672958 res!439459) b!672971))

(assert (= (and b!672971 res!439456) b!672976))

(assert (= (and b!672976 res!439454) b!672979))

(assert (= (and b!672979 res!439463) b!672969))

(assert (= (and b!672969 res!439452) b!672960))

(assert (= (and b!672960 res!439451) b!672973))

(assert (= (and b!672973 res!439467) b!672964))

(assert (= (and b!672964 c!77123) b!672956))

(assert (= (and b!672964 (not c!77123)) b!672978))

(assert (= (and b!672964 res!439450) b!672975))

(assert (= (and b!672975 res!439448) b!672954))

(assert (= (and b!672954 res!439460) b!672961))

(assert (= (and b!672961 res!439457) b!672955))

(assert (= (and b!672955 res!439462) b!672967))

(assert (= (and b!672967 res!439464) b!672970))

(assert (= (and b!672967 (not res!439449)) b!672965))

(assert (= (and b!672965 res!439466) b!672963))

(assert (= (and b!672967 res!439458) b!672977))

(declare-fun m!642241 () Bool)

(assert (=> b!672961 m!642241))

(declare-fun m!642243 () Bool)

(assert (=> b!672977 m!642243))

(declare-fun m!642245 () Bool)

(assert (=> b!672956 m!642245))

(declare-fun m!642247 () Bool)

(assert (=> b!672956 m!642247))

(declare-fun m!642249 () Bool)

(assert (=> b!672962 m!642249))

(declare-fun m!642251 () Bool)

(assert (=> b!672959 m!642251))

(declare-fun m!642253 () Bool)

(assert (=> b!672979 m!642253))

(declare-fun m!642255 () Bool)

(assert (=> b!672969 m!642255))

(declare-fun m!642257 () Bool)

(assert (=> b!672958 m!642257))

(declare-fun m!642259 () Bool)

(assert (=> b!672964 m!642259))

(declare-fun m!642261 () Bool)

(assert (=> start!60240 m!642261))

(declare-fun m!642263 () Bool)

(assert (=> b!672970 m!642263))

(declare-fun m!642265 () Bool)

(assert (=> b!672955 m!642265))

(declare-fun m!642267 () Bool)

(assert (=> b!672954 m!642267))

(declare-fun m!642269 () Bool)

(assert (=> b!672966 m!642269))

(assert (=> b!672963 m!642263))

(assert (=> b!672968 m!642249))

(assert (=> b!672973 m!642259))

(assert (=> b!672973 m!642259))

(declare-fun m!642271 () Bool)

(assert (=> b!672973 m!642271))

(declare-fun m!642273 () Bool)

(assert (=> b!672972 m!642273))

(assert (=> b!672975 m!642259))

(assert (=> b!672975 m!642259))

(declare-fun m!642275 () Bool)

(assert (=> b!672975 m!642275))

(declare-fun m!642277 () Bool)

(assert (=> b!672971 m!642277))

(check-sat (not b!672971) (not b!672966) (not b!672977) (not start!60240) (not b!672959) (not b!672975) (not b!672968) (not b!672955) (not b!672958) (not b!672956) (not b!672962) (not b!672970) (not b!672979) (not b!672973) (not b!672954) (not b!672969) (not b!672963) (not b!672972) (not b!672961))
(check-sat)
