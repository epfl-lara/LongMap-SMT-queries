; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59906 () Bool)

(assert start!59906)

(declare-fun res!431386 () Bool)

(declare-fun e!380578 () Bool)

(assert (=> start!59906 (=> (not res!431386) (not e!380578))))

(declare-datatypes ((array!38964 0))(
  ( (array!38965 (arr!18674 (Array (_ BitVec 32) (_ BitVec 64))) (size!19039 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38964)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59906 (= res!431386 (and (bvslt (size!19039 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19039 a!3626))))))

(assert (=> start!59906 e!380578))

(assert (=> start!59906 true))

(declare-fun array_inv!14557 (array!38964) Bool)

(assert (=> start!59906 (array_inv!14557 a!3626)))

(declare-fun b!663382 () Bool)

(declare-fun res!431391 () Bool)

(assert (=> b!663382 (=> (not res!431391) (not e!380578))))

(declare-datatypes ((List!12754 0))(
  ( (Nil!12751) (Cons!12750 (h!13795 (_ BitVec 64)) (t!18973 List!12754)) )
))
(declare-fun acc!681 () List!12754)

(declare-fun arrayNoDuplicates!0 (array!38964 (_ BitVec 32) List!12754) Bool)

(assert (=> b!663382 (= res!431391 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663383 () Bool)

(declare-datatypes ((Unit!23078 0))(
  ( (Unit!23079) )
))
(declare-fun e!380574 () Unit!23078)

(declare-fun Unit!23080 () Unit!23078)

(assert (=> b!663383 (= e!380574 Unit!23080)))

(declare-fun b!663384 () Bool)

(declare-fun lt!309099 () Unit!23078)

(assert (=> b!663384 (= e!380574 lt!309099)))

(declare-fun lt!309097 () Unit!23078)

(declare-fun lemmaListSubSeqRefl!0 (List!12754) Unit!23078)

(assert (=> b!663384 (= lt!309097 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!32 (List!12754 List!12754) Bool)

(assert (=> b!663384 (subseq!32 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38964 List!12754 List!12754 (_ BitVec 32)) Unit!23078)

(declare-fun $colon$colon!163 (List!12754 (_ BitVec 64)) List!12754)

(assert (=> b!663384 (= lt!309099 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!163 acc!681 (select (arr!18674 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663384 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!663385 () Bool)

(declare-fun e!380575 () Unit!23078)

(declare-fun Unit!23081 () Unit!23078)

(assert (=> b!663385 (= e!380575 Unit!23081)))

(declare-fun lt!309098 () Unit!23078)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38964 (_ BitVec 64) (_ BitVec 32)) Unit!23078)

(assert (=> b!663385 (= lt!309098 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!663385 false))

(declare-fun b!663386 () Bool)

(declare-fun res!431387 () Bool)

(assert (=> b!663386 (=> (not res!431387) (not e!380578))))

(declare-fun noDuplicate!545 (List!12754) Bool)

(assert (=> b!663386 (= res!431387 (noDuplicate!545 acc!681))))

(declare-fun b!663387 () Bool)

(declare-fun e!380579 () Bool)

(declare-fun contains!3276 (List!12754 (_ BitVec 64)) Bool)

(assert (=> b!663387 (= e!380579 (not (contains!3276 acc!681 k0!2843)))))

(declare-fun b!663388 () Bool)

(declare-fun res!431382 () Bool)

(assert (=> b!663388 (=> (not res!431382) (not e!380578))))

(assert (=> b!663388 (= res!431382 (not (contains!3276 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663389 () Bool)

(declare-fun res!431392 () Bool)

(assert (=> b!663389 (=> (not res!431392) (not e!380578))))

(declare-fun arrayContainsKey!0 (array!38964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663389 (= res!431392 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663390 () Bool)

(declare-fun res!431383 () Bool)

(assert (=> b!663390 (=> (not res!431383) (not e!380578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663390 (= res!431383 (validKeyInArray!0 k0!2843))))

(declare-fun b!663391 () Bool)

(declare-fun res!431393 () Bool)

(assert (=> b!663391 (=> (not res!431393) (not e!380578))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663391 (= res!431393 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19039 a!3626))))))

(declare-fun b!663392 () Bool)

(declare-fun res!431390 () Bool)

(assert (=> b!663392 (=> (not res!431390) (not e!380578))))

(declare-fun e!380576 () Bool)

(assert (=> b!663392 (= res!431390 e!380576)))

(declare-fun res!431389 () Bool)

(assert (=> b!663392 (=> res!431389 e!380576)))

(declare-fun e!380573 () Bool)

(assert (=> b!663392 (= res!431389 e!380573)))

(declare-fun res!431388 () Bool)

(assert (=> b!663392 (=> (not res!431388) (not e!380573))))

(assert (=> b!663392 (= res!431388 (bvsgt from!3004 i!1382))))

(declare-fun b!663393 () Bool)

(assert (=> b!663393 (= e!380578 (not true))))

(declare-fun lt!309095 () Unit!23078)

(assert (=> b!663393 (= lt!309095 e!380574)))

(declare-fun c!76367 () Bool)

(assert (=> b!663393 (= c!76367 (validKeyInArray!0 (select (arr!18674 a!3626) from!3004)))))

(declare-fun lt!309096 () Unit!23078)

(assert (=> b!663393 (= lt!309096 e!380575)))

(declare-fun c!76368 () Bool)

(assert (=> b!663393 (= c!76368 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663393 (arrayContainsKey!0 (array!38965 (store (arr!18674 a!3626) i!1382 k0!2843) (size!19039 a!3626)) k0!2843 from!3004)))

(declare-fun b!663394 () Bool)

(declare-fun res!431395 () Bool)

(assert (=> b!663394 (=> (not res!431395) (not e!380578))))

(assert (=> b!663394 (= res!431395 (not (contains!3276 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663395 () Bool)

(declare-fun res!431384 () Bool)

(assert (=> b!663395 (=> (not res!431384) (not e!380578))))

(assert (=> b!663395 (= res!431384 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12751))))

(declare-fun b!663396 () Bool)

(declare-fun res!431394 () Bool)

(assert (=> b!663396 (=> (not res!431394) (not e!380578))))

(assert (=> b!663396 (= res!431394 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19039 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663397 () Bool)

(assert (=> b!663397 (= e!380576 e!380579)))

(declare-fun res!431385 () Bool)

(assert (=> b!663397 (=> (not res!431385) (not e!380579))))

(assert (=> b!663397 (= res!431385 (bvsle from!3004 i!1382))))

(declare-fun b!663398 () Bool)

(assert (=> b!663398 (= e!380573 (contains!3276 acc!681 k0!2843))))

(declare-fun b!663399 () Bool)

(declare-fun Unit!23082 () Unit!23078)

(assert (=> b!663399 (= e!380575 Unit!23082)))

(assert (= (and start!59906 res!431386) b!663386))

(assert (= (and b!663386 res!431387) b!663388))

(assert (= (and b!663388 res!431382) b!663394))

(assert (= (and b!663394 res!431395) b!663392))

(assert (= (and b!663392 res!431388) b!663398))

(assert (= (and b!663392 (not res!431389)) b!663397))

(assert (= (and b!663397 res!431385) b!663387))

(assert (= (and b!663392 res!431390) b!663395))

(assert (= (and b!663395 res!431384) b!663382))

(assert (= (and b!663382 res!431391) b!663391))

(assert (= (and b!663391 res!431393) b!663390))

(assert (= (and b!663390 res!431383) b!663389))

(assert (= (and b!663389 res!431392) b!663396))

(assert (= (and b!663396 res!431394) b!663393))

(assert (= (and b!663393 c!76368) b!663385))

(assert (= (and b!663393 (not c!76368)) b!663399))

(assert (= (and b!663393 c!76367) b!663384))

(assert (= (and b!663393 (not c!76367)) b!663383))

(declare-fun m!634407 () Bool)

(assert (=> b!663390 m!634407))

(declare-fun m!634409 () Bool)

(assert (=> b!663382 m!634409))

(declare-fun m!634411 () Bool)

(assert (=> b!663389 m!634411))

(declare-fun m!634413 () Bool)

(assert (=> b!663387 m!634413))

(assert (=> b!663398 m!634413))

(declare-fun m!634415 () Bool)

(assert (=> b!663385 m!634415))

(declare-fun m!634417 () Bool)

(assert (=> start!59906 m!634417))

(declare-fun m!634419 () Bool)

(assert (=> b!663384 m!634419))

(declare-fun m!634421 () Bool)

(assert (=> b!663384 m!634421))

(declare-fun m!634423 () Bool)

(assert (=> b!663384 m!634423))

(declare-fun m!634425 () Bool)

(assert (=> b!663384 m!634425))

(assert (=> b!663384 m!634421))

(assert (=> b!663384 m!634423))

(declare-fun m!634427 () Bool)

(assert (=> b!663384 m!634427))

(declare-fun m!634429 () Bool)

(assert (=> b!663384 m!634429))

(declare-fun m!634431 () Bool)

(assert (=> b!663395 m!634431))

(declare-fun m!634433 () Bool)

(assert (=> b!663388 m!634433))

(declare-fun m!634435 () Bool)

(assert (=> b!663394 m!634435))

(assert (=> b!663393 m!634421))

(declare-fun m!634437 () Bool)

(assert (=> b!663393 m!634437))

(declare-fun m!634439 () Bool)

(assert (=> b!663393 m!634439))

(assert (=> b!663393 m!634421))

(declare-fun m!634441 () Bool)

(assert (=> b!663393 m!634441))

(declare-fun m!634443 () Bool)

(assert (=> b!663393 m!634443))

(declare-fun m!634445 () Bool)

(assert (=> b!663386 m!634445))

(check-sat (not start!59906) (not b!663382) (not b!663387) (not b!663385) (not b!663386) (not b!663394) (not b!663384) (not b!663389) (not b!663388) (not b!663390) (not b!663398) (not b!663393) (not b!663395))
(check-sat)
