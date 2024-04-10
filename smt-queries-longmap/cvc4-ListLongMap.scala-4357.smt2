; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60174 () Bool)

(assert start!60174)

(declare-fun res!439051 () Bool)

(declare-fun e!384133 () Bool)

(assert (=> start!60174 (=> (not res!439051) (not e!384133))))

(declare-datatypes ((array!39221 0))(
  ( (array!39222 (arr!18803 (Array (_ BitVec 32) (_ BitVec 64))) (size!19167 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39221)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60174 (= res!439051 (and (bvslt (size!19167 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19167 a!3626))))))

(assert (=> start!60174 e!384133))

(assert (=> start!60174 true))

(declare-fun array_inv!14599 (array!39221) Bool)

(assert (=> start!60174 (array_inv!14599 a!3626)))

(declare-fun b!672418 () Bool)

(declare-fun res!439059 () Bool)

(assert (=> b!672418 (=> (not res!439059) (not e!384133))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672418 (= res!439059 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19167 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672419 () Bool)

(declare-fun res!439053 () Bool)

(assert (=> b!672419 (=> (not res!439053) (not e!384133))))

(assert (=> b!672419 (= res!439053 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19167 a!3626))))))

(declare-fun b!672420 () Bool)

(declare-fun res!439047 () Bool)

(assert (=> b!672420 (=> (not res!439047) (not e!384133))))

(declare-datatypes ((List!12844 0))(
  ( (Nil!12841) (Cons!12840 (h!13885 (_ BitVec 64)) (t!19072 List!12844)) )
))
(declare-fun acc!681 () List!12844)

(declare-fun contains!3421 (List!12844 (_ BitVec 64)) Bool)

(assert (=> b!672420 (= res!439047 (not (contains!3421 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672421 () Bool)

(declare-fun res!439050 () Bool)

(assert (=> b!672421 (=> (not res!439050) (not e!384133))))

(declare-fun arrayNoDuplicates!0 (array!39221 (_ BitVec 32) List!12844) Bool)

(assert (=> b!672421 (= res!439050 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672422 () Bool)

(declare-fun res!439049 () Bool)

(declare-fun e!384132 () Bool)

(assert (=> b!672422 (=> (not res!439049) (not e!384132))))

(declare-fun lt!312307 () List!12844)

(assert (=> b!672422 (= res!439049 (not (contains!3421 lt!312307 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672423 () Bool)

(declare-fun e!384136 () Bool)

(assert (=> b!672423 (= e!384136 e!384132)))

(declare-fun res!439055 () Bool)

(assert (=> b!672423 (=> (not res!439055) (not e!384132))))

(assert (=> b!672423 (= res!439055 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!271 (List!12844 (_ BitVec 64)) List!12844)

(assert (=> b!672423 (= lt!312307 ($colon$colon!271 acc!681 (select (arr!18803 a!3626) from!3004)))))

(declare-fun b!672424 () Bool)

(declare-fun res!439052 () Bool)

(assert (=> b!672424 (=> (not res!439052) (not e!384133))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672424 (= res!439052 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672425 () Bool)

(declare-fun res!439045 () Bool)

(assert (=> b!672425 (=> (not res!439045) (not e!384133))))

(assert (=> b!672425 (= res!439045 (not (contains!3421 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672426 () Bool)

(declare-fun res!439057 () Bool)

(assert (=> b!672426 (=> (not res!439057) (not e!384133))))

(declare-fun noDuplicate!668 (List!12844) Bool)

(assert (=> b!672426 (= res!439057 (noDuplicate!668 acc!681))))

(declare-fun b!672427 () Bool)

(declare-fun res!439048 () Bool)

(assert (=> b!672427 (=> (not res!439048) (not e!384133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672427 (= res!439048 (validKeyInArray!0 k!2843))))

(declare-fun b!672428 () Bool)

(declare-fun res!439065 () Bool)

(assert (=> b!672428 (=> (not res!439065) (not e!384132))))

(assert (=> b!672428 (= res!439065 (not (contains!3421 lt!312307 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672429 () Bool)

(assert (=> b!672429 (= e!384132 false)))

(declare-fun lt!312309 () Bool)

(assert (=> b!672429 (= lt!312309 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312307))))

(declare-fun b!672430 () Bool)

(declare-datatypes ((Unit!23624 0))(
  ( (Unit!23625) )
))
(declare-fun e!384137 () Unit!23624)

(declare-fun Unit!23626 () Unit!23624)

(assert (=> b!672430 (= e!384137 Unit!23626)))

(declare-fun b!672431 () Bool)

(declare-fun res!439067 () Bool)

(assert (=> b!672431 (=> (not res!439067) (not e!384133))))

(assert (=> b!672431 (= res!439067 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12841))))

(declare-fun b!672432 () Bool)

(declare-fun e!384139 () Bool)

(declare-fun e!384138 () Bool)

(assert (=> b!672432 (= e!384139 e!384138)))

(declare-fun res!439060 () Bool)

(assert (=> b!672432 (=> (not res!439060) (not e!384138))))

(assert (=> b!672432 (= res!439060 (bvsle from!3004 i!1382))))

(declare-fun b!672433 () Bool)

(assert (=> b!672433 (= e!384138 (not (contains!3421 acc!681 k!2843)))))

(declare-fun b!672434 () Bool)

(declare-fun res!439044 () Bool)

(assert (=> b!672434 (=> (not res!439044) (not e!384133))))

(assert (=> b!672434 (= res!439044 (validKeyInArray!0 (select (arr!18803 a!3626) from!3004)))))

(declare-fun b!672435 () Bool)

(declare-fun e!384135 () Bool)

(assert (=> b!672435 (= e!384135 (contains!3421 lt!312307 k!2843))))

(declare-fun b!672436 () Bool)

(declare-fun Unit!23627 () Unit!23624)

(assert (=> b!672436 (= e!384137 Unit!23627)))

(assert (=> b!672436 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312310 () Unit!23624)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39221 (_ BitVec 64) (_ BitVec 32)) Unit!23624)

(assert (=> b!672436 (= lt!312310 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!672436 false))

(declare-fun b!672437 () Bool)

(declare-fun res!439046 () Bool)

(assert (=> b!672437 (=> (not res!439046) (not e!384132))))

(declare-fun e!384140 () Bool)

(assert (=> b!672437 (= res!439046 e!384140)))

(declare-fun res!439066 () Bool)

(assert (=> b!672437 (=> res!439066 e!384140)))

(assert (=> b!672437 (= res!439066 e!384135)))

(declare-fun res!439058 () Bool)

(assert (=> b!672437 (=> (not res!439058) (not e!384135))))

(assert (=> b!672437 (= res!439058 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672438 () Bool)

(declare-fun res!439062 () Bool)

(assert (=> b!672438 (=> (not res!439062) (not e!384132))))

(assert (=> b!672438 (= res!439062 (noDuplicate!668 lt!312307))))

(declare-fun b!672439 () Bool)

(declare-fun e!384141 () Bool)

(assert (=> b!672439 (= e!384140 e!384141)))

(declare-fun res!439063 () Bool)

(assert (=> b!672439 (=> (not res!439063) (not e!384141))))

(assert (=> b!672439 (= res!439063 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672440 () Bool)

(declare-fun res!439054 () Bool)

(assert (=> b!672440 (=> (not res!439054) (not e!384133))))

(assert (=> b!672440 (= res!439054 e!384139)))

(declare-fun res!439064 () Bool)

(assert (=> b!672440 (=> res!439064 e!384139)))

(declare-fun e!384131 () Bool)

(assert (=> b!672440 (= res!439064 e!384131)))

(declare-fun res!439061 () Bool)

(assert (=> b!672440 (=> (not res!439061) (not e!384131))))

(assert (=> b!672440 (= res!439061 (bvsgt from!3004 i!1382))))

(declare-fun b!672441 () Bool)

(assert (=> b!672441 (= e!384131 (contains!3421 acc!681 k!2843))))

(declare-fun b!672442 () Bool)

(assert (=> b!672442 (= e!384141 (not (contains!3421 lt!312307 k!2843)))))

(declare-fun b!672443 () Bool)

(assert (=> b!672443 (= e!384133 e!384136)))

(declare-fun res!439056 () Bool)

(assert (=> b!672443 (=> (not res!439056) (not e!384136))))

(assert (=> b!672443 (= res!439056 (not (= (select (arr!18803 a!3626) from!3004) k!2843)))))

(declare-fun lt!312308 () Unit!23624)

(assert (=> b!672443 (= lt!312308 e!384137)))

(declare-fun c!77054 () Bool)

(assert (=> b!672443 (= c!77054 (= (select (arr!18803 a!3626) from!3004) k!2843))))

(assert (= (and start!60174 res!439051) b!672426))

(assert (= (and b!672426 res!439057) b!672420))

(assert (= (and b!672420 res!439047) b!672425))

(assert (= (and b!672425 res!439045) b!672440))

(assert (= (and b!672440 res!439061) b!672441))

(assert (= (and b!672440 (not res!439064)) b!672432))

(assert (= (and b!672432 res!439060) b!672433))

(assert (= (and b!672440 res!439054) b!672431))

(assert (= (and b!672431 res!439067) b!672421))

(assert (= (and b!672421 res!439050) b!672419))

(assert (= (and b!672419 res!439053) b!672427))

(assert (= (and b!672427 res!439048) b!672424))

(assert (= (and b!672424 res!439052) b!672418))

(assert (= (and b!672418 res!439059) b!672434))

(assert (= (and b!672434 res!439044) b!672443))

(assert (= (and b!672443 c!77054) b!672436))

(assert (= (and b!672443 (not c!77054)) b!672430))

(assert (= (and b!672443 res!439056) b!672423))

(assert (= (and b!672423 res!439055) b!672438))

(assert (= (and b!672438 res!439062) b!672422))

(assert (= (and b!672422 res!439049) b!672428))

(assert (= (and b!672428 res!439065) b!672437))

(assert (= (and b!672437 res!439058) b!672435))

(assert (= (and b!672437 (not res!439066)) b!672439))

(assert (= (and b!672439 res!439063) b!672442))

(assert (= (and b!672437 res!439046) b!672429))

(declare-fun m!641391 () Bool)

(assert (=> start!60174 m!641391))

(declare-fun m!641393 () Bool)

(assert (=> b!672431 m!641393))

(declare-fun m!641395 () Bool)

(assert (=> b!672442 m!641395))

(declare-fun m!641397 () Bool)

(assert (=> b!672426 m!641397))

(declare-fun m!641399 () Bool)

(assert (=> b!672436 m!641399))

(declare-fun m!641401 () Bool)

(assert (=> b!672436 m!641401))

(declare-fun m!641403 () Bool)

(assert (=> b!672433 m!641403))

(declare-fun m!641405 () Bool)

(assert (=> b!672424 m!641405))

(assert (=> b!672441 m!641403))

(declare-fun m!641407 () Bool)

(assert (=> b!672423 m!641407))

(assert (=> b!672423 m!641407))

(declare-fun m!641409 () Bool)

(assert (=> b!672423 m!641409))

(declare-fun m!641411 () Bool)

(assert (=> b!672427 m!641411))

(declare-fun m!641413 () Bool)

(assert (=> b!672428 m!641413))

(assert (=> b!672435 m!641395))

(declare-fun m!641415 () Bool)

(assert (=> b!672420 m!641415))

(declare-fun m!641417 () Bool)

(assert (=> b!672421 m!641417))

(declare-fun m!641419 () Bool)

(assert (=> b!672438 m!641419))

(assert (=> b!672443 m!641407))

(declare-fun m!641421 () Bool)

(assert (=> b!672422 m!641421))

(declare-fun m!641423 () Bool)

(assert (=> b!672429 m!641423))

(declare-fun m!641425 () Bool)

(assert (=> b!672425 m!641425))

(assert (=> b!672434 m!641407))

(assert (=> b!672434 m!641407))

(declare-fun m!641427 () Bool)

(assert (=> b!672434 m!641427))

(push 1)

