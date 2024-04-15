; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60194 () Bool)

(assert start!60194)

(declare-fun b!673371 () Bool)

(declare-fun res!440063 () Bool)

(declare-fun e!384471 () Bool)

(assert (=> b!673371 (=> (not res!440063) (not e!384471))))

(declare-fun e!384470 () Bool)

(assert (=> b!673371 (= res!440063 e!384470)))

(declare-fun res!440082 () Bool)

(assert (=> b!673371 (=> res!440082 e!384470)))

(declare-fun e!384476 () Bool)

(assert (=> b!673371 (= res!440082 e!384476)))

(declare-fun res!440077 () Bool)

(assert (=> b!673371 (=> (not res!440077) (not e!384476))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673371 (= res!440077 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673372 () Bool)

(declare-datatypes ((List!12898 0))(
  ( (Nil!12895) (Cons!12894 (h!13939 (_ BitVec 64)) (t!19117 List!12898)) )
))
(declare-fun lt!312243 () List!12898)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3420 (List!12898 (_ BitVec 64)) Bool)

(assert (=> b!673372 (= e!384476 (contains!3420 lt!312243 k0!2843))))

(declare-fun b!673373 () Bool)

(declare-fun res!440061 () Bool)

(declare-fun e!384477 () Bool)

(assert (=> b!673373 (=> (not res!440061) (not e!384477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673373 (= res!440061 (validKeyInArray!0 k0!2843))))

(declare-fun b!673374 () Bool)

(declare-fun res!440069 () Bool)

(assert (=> b!673374 (=> (not res!440069) (not e!384477))))

(declare-fun e!384475 () Bool)

(assert (=> b!673374 (= res!440069 e!384475)))

(declare-fun res!440074 () Bool)

(assert (=> b!673374 (=> res!440074 e!384475)))

(declare-fun e!384469 () Bool)

(assert (=> b!673374 (= res!440074 e!384469)))

(declare-fun res!440067 () Bool)

(assert (=> b!673374 (=> (not res!440067) (not e!384469))))

(assert (=> b!673374 (= res!440067 (bvsgt from!3004 i!1382))))

(declare-fun b!673375 () Bool)

(declare-fun acc!681 () List!12898)

(assert (=> b!673375 (= e!384469 (contains!3420 acc!681 k0!2843))))

(declare-fun b!673376 () Bool)

(declare-fun e!384474 () Bool)

(assert (=> b!673376 (= e!384477 e!384474)))

(declare-fun res!440080 () Bool)

(assert (=> b!673376 (=> (not res!440080) (not e!384474))))

(declare-datatypes ((array!39252 0))(
  ( (array!39253 (arr!18818 (Array (_ BitVec 32) (_ BitVec 64))) (size!19183 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39252)

(assert (=> b!673376 (= res!440080 (not (= (select (arr!18818 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23666 0))(
  ( (Unit!23667) )
))
(declare-fun lt!312244 () Unit!23666)

(declare-fun e!384472 () Unit!23666)

(assert (=> b!673376 (= lt!312244 e!384472)))

(declare-fun c!77022 () Bool)

(assert (=> b!673376 (= c!77022 (= (select (arr!18818 a!3626) from!3004) k0!2843))))

(declare-fun b!673377 () Bool)

(declare-fun e!384479 () Bool)

(assert (=> b!673377 (= e!384479 (not (contains!3420 acc!681 k0!2843)))))

(declare-fun b!673378 () Bool)

(assert (=> b!673378 (= e!384475 e!384479)))

(declare-fun res!440062 () Bool)

(assert (=> b!673378 (=> (not res!440062) (not e!384479))))

(assert (=> b!673378 (= res!440062 (bvsle from!3004 i!1382))))

(declare-fun b!673379 () Bool)

(declare-fun res!440060 () Bool)

(assert (=> b!673379 (=> (not res!440060) (not e!384477))))

(assert (=> b!673379 (= res!440060 (validKeyInArray!0 (select (arr!18818 a!3626) from!3004)))))

(declare-fun b!673370 () Bool)

(declare-fun res!440079 () Bool)

(assert (=> b!673370 (=> (not res!440079) (not e!384477))))

(assert (=> b!673370 (= res!440079 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19183 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun res!440071 () Bool)

(assert (=> start!60194 (=> (not res!440071) (not e!384477))))

(assert (=> start!60194 (= res!440071 (and (bvslt (size!19183 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19183 a!3626))))))

(assert (=> start!60194 e!384477))

(assert (=> start!60194 true))

(declare-fun array_inv!14701 (array!39252) Bool)

(assert (=> start!60194 (array_inv!14701 a!3626)))

(declare-fun b!673380 () Bool)

(declare-fun res!440068 () Bool)

(assert (=> b!673380 (=> (not res!440068) (not e!384477))))

(assert (=> b!673380 (= res!440068 (not (contains!3420 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673381 () Bool)

(declare-fun res!440076 () Bool)

(assert (=> b!673381 (=> (not res!440076) (not e!384471))))

(assert (=> b!673381 (= res!440076 (not (contains!3420 lt!312243 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673382 () Bool)

(declare-fun res!440072 () Bool)

(assert (=> b!673382 (=> (not res!440072) (not e!384477))))

(assert (=> b!673382 (= res!440072 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19183 a!3626))))))

(declare-fun b!673383 () Bool)

(assert (=> b!673383 (= e!384471 false)))

(declare-fun lt!312246 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39252 (_ BitVec 32) List!12898) Bool)

(assert (=> b!673383 (= lt!312246 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312243))))

(declare-fun b!673384 () Bool)

(declare-fun Unit!23668 () Unit!23666)

(assert (=> b!673384 (= e!384472 Unit!23668)))

(declare-fun arrayContainsKey!0 (array!39252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673384 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312245 () Unit!23666)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39252 (_ BitVec 64) (_ BitVec 32)) Unit!23666)

(assert (=> b!673384 (= lt!312245 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!673384 false))

(declare-fun b!673385 () Bool)

(declare-fun res!440066 () Bool)

(assert (=> b!673385 (=> (not res!440066) (not e!384471))))

(declare-fun noDuplicate!689 (List!12898) Bool)

(assert (=> b!673385 (= res!440066 (noDuplicate!689 lt!312243))))

(declare-fun b!673386 () Bool)

(assert (=> b!673386 (= e!384474 e!384471)))

(declare-fun res!440081 () Bool)

(assert (=> b!673386 (=> (not res!440081) (not e!384471))))

(assert (=> b!673386 (= res!440081 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!286 (List!12898 (_ BitVec 64)) List!12898)

(assert (=> b!673386 (= lt!312243 ($colon$colon!286 acc!681 (select (arr!18818 a!3626) from!3004)))))

(declare-fun b!673387 () Bool)

(declare-fun e!384473 () Bool)

(assert (=> b!673387 (= e!384473 (not (contains!3420 lt!312243 k0!2843)))))

(declare-fun b!673388 () Bool)

(declare-fun Unit!23669 () Unit!23666)

(assert (=> b!673388 (= e!384472 Unit!23669)))

(declare-fun b!673389 () Bool)

(declare-fun res!440075 () Bool)

(assert (=> b!673389 (=> (not res!440075) (not e!384477))))

(assert (=> b!673389 (= res!440075 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673390 () Bool)

(declare-fun res!440064 () Bool)

(assert (=> b!673390 (=> (not res!440064) (not e!384477))))

(assert (=> b!673390 (= res!440064 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12895))))

(declare-fun b!673391 () Bool)

(declare-fun res!440070 () Bool)

(assert (=> b!673391 (=> (not res!440070) (not e!384471))))

(assert (=> b!673391 (= res!440070 (not (contains!3420 lt!312243 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673392 () Bool)

(declare-fun res!440078 () Bool)

(assert (=> b!673392 (=> (not res!440078) (not e!384477))))

(assert (=> b!673392 (= res!440078 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673393 () Bool)

(declare-fun res!440065 () Bool)

(assert (=> b!673393 (=> (not res!440065) (not e!384477))))

(assert (=> b!673393 (= res!440065 (noDuplicate!689 acc!681))))

(declare-fun b!673394 () Bool)

(declare-fun res!440083 () Bool)

(assert (=> b!673394 (=> (not res!440083) (not e!384477))))

(assert (=> b!673394 (= res!440083 (not (contains!3420 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673395 () Bool)

(assert (=> b!673395 (= e!384470 e!384473)))

(declare-fun res!440073 () Bool)

(assert (=> b!673395 (=> (not res!440073) (not e!384473))))

(assert (=> b!673395 (= res!440073 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60194 res!440071) b!673393))

(assert (= (and b!673393 res!440065) b!673380))

(assert (= (and b!673380 res!440068) b!673394))

(assert (= (and b!673394 res!440083) b!673374))

(assert (= (and b!673374 res!440067) b!673375))

(assert (= (and b!673374 (not res!440074)) b!673378))

(assert (= (and b!673378 res!440062) b!673377))

(assert (= (and b!673374 res!440069) b!673390))

(assert (= (and b!673390 res!440064) b!673389))

(assert (= (and b!673389 res!440075) b!673382))

(assert (= (and b!673382 res!440072) b!673373))

(assert (= (and b!673373 res!440061) b!673392))

(assert (= (and b!673392 res!440078) b!673370))

(assert (= (and b!673370 res!440079) b!673379))

(assert (= (and b!673379 res!440060) b!673376))

(assert (= (and b!673376 c!77022) b!673384))

(assert (= (and b!673376 (not c!77022)) b!673388))

(assert (= (and b!673376 res!440080) b!673386))

(assert (= (and b!673386 res!440081) b!673385))

(assert (= (and b!673385 res!440066) b!673391))

(assert (= (and b!673391 res!440070) b!673381))

(assert (= (and b!673381 res!440076) b!673371))

(assert (= (and b!673371 res!440077) b!673372))

(assert (= (and b!673371 (not res!440082)) b!673395))

(assert (= (and b!673395 res!440073) b!673387))

(assert (= (and b!673371 res!440063) b!673383))

(declare-fun m!641217 () Bool)

(assert (=> b!673389 m!641217))

(declare-fun m!641219 () Bool)

(assert (=> b!673387 m!641219))

(declare-fun m!641221 () Bool)

(assert (=> b!673373 m!641221))

(declare-fun m!641223 () Bool)

(assert (=> b!673381 m!641223))

(declare-fun m!641225 () Bool)

(assert (=> b!673384 m!641225))

(declare-fun m!641227 () Bool)

(assert (=> b!673384 m!641227))

(declare-fun m!641229 () Bool)

(assert (=> start!60194 m!641229))

(declare-fun m!641231 () Bool)

(assert (=> b!673383 m!641231))

(declare-fun m!641233 () Bool)

(assert (=> b!673394 m!641233))

(declare-fun m!641235 () Bool)

(assert (=> b!673385 m!641235))

(declare-fun m!641237 () Bool)

(assert (=> b!673375 m!641237))

(declare-fun m!641239 () Bool)

(assert (=> b!673379 m!641239))

(assert (=> b!673379 m!641239))

(declare-fun m!641241 () Bool)

(assert (=> b!673379 m!641241))

(assert (=> b!673372 m!641219))

(declare-fun m!641243 () Bool)

(assert (=> b!673380 m!641243))

(assert (=> b!673376 m!641239))

(declare-fun m!641245 () Bool)

(assert (=> b!673390 m!641245))

(declare-fun m!641247 () Bool)

(assert (=> b!673393 m!641247))

(declare-fun m!641249 () Bool)

(assert (=> b!673392 m!641249))

(assert (=> b!673386 m!641239))

(assert (=> b!673386 m!641239))

(declare-fun m!641251 () Bool)

(assert (=> b!673386 m!641251))

(assert (=> b!673377 m!641237))

(declare-fun m!641253 () Bool)

(assert (=> b!673391 m!641253))

(check-sat (not b!673380) (not b!673377) (not b!673379) (not b!673385) (not b!673392) (not b!673387) (not b!673375) (not b!673390) (not b!673372) (not b!673389) (not b!673393) (not b!673384) (not b!673391) (not b!673386) (not b!673373) (not b!673381) (not start!60194) (not b!673394) (not b!673383))
(check-sat)
