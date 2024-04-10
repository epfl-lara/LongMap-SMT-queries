; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61968 () Bool)

(assert start!61968)

(declare-fun b!693275 () Bool)

(declare-fun res!457439 () Bool)

(declare-fun e!394467 () Bool)

(assert (=> b!693275 (=> (not res!457439) (not e!394467))))

(declare-datatypes ((List!13132 0))(
  ( (Nil!13129) (Cons!13128 (h!14173 (_ BitVec 64)) (t!19408 List!13132)) )
))
(declare-fun acc!681 () List!13132)

(declare-fun contains!3709 (List!13132 (_ BitVec 64)) Bool)

(assert (=> b!693275 (= res!457439 (not (contains!3709 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693276 () Bool)

(declare-fun e!394460 () Bool)

(declare-fun lt!316731 () List!13132)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!693276 (= e!394460 (not (contains!3709 lt!316731 k!2843)))))

(declare-fun b!693277 () Bool)

(declare-fun e!394462 () Bool)

(assert (=> b!693277 (= e!394462 e!394460)))

(declare-fun res!457437 () Bool)

(assert (=> b!693277 (=> (not res!457437) (not e!394460))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!693277 (= res!457437 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693278 () Bool)

(declare-fun res!457430 () Bool)

(assert (=> b!693278 (=> (not res!457430) (not e!394467))))

(declare-fun noDuplicate!956 (List!13132) Bool)

(assert (=> b!693278 (= res!457430 (noDuplicate!956 acc!681))))

(declare-fun b!693279 () Bool)

(declare-fun res!457442 () Bool)

(assert (=> b!693279 (=> (not res!457442) (not e!394467))))

(assert (=> b!693279 (= res!457442 (not (contains!3709 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693280 () Bool)

(declare-fun res!457435 () Bool)

(assert (=> b!693280 (=> (not res!457435) (not e!394467))))

(declare-datatypes ((array!39854 0))(
  ( (array!39855 (arr!19091 (Array (_ BitVec 32) (_ BitVec 64))) (size!19476 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39854)

(declare-fun arrayNoDuplicates!0 (array!39854 (_ BitVec 32) List!13132) Bool)

(assert (=> b!693280 (= res!457435 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13129))))

(declare-fun b!693281 () Bool)

(declare-fun res!457443 () Bool)

(declare-fun e!394463 () Bool)

(assert (=> b!693281 (=> (not res!457443) (not e!394463))))

(assert (=> b!693281 (= res!457443 (noDuplicate!956 lt!316731))))

(declare-fun b!693282 () Bool)

(declare-fun res!457425 () Bool)

(assert (=> b!693282 (=> (not res!457425) (not e!394467))))

(declare-fun arrayContainsKey!0 (array!39854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!693282 (= res!457425 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!693283 () Bool)

(declare-fun e!394465 () Bool)

(assert (=> b!693283 (= e!394465 (not (contains!3709 acc!681 k!2843)))))

(declare-fun b!693284 () Bool)

(declare-fun res!457432 () Bool)

(assert (=> b!693284 (=> (not res!457432) (not e!394467))))

(declare-fun e!394458 () Bool)

(assert (=> b!693284 (= res!457432 e!394458)))

(declare-fun res!457438 () Bool)

(assert (=> b!693284 (=> res!457438 e!394458)))

(declare-fun e!394459 () Bool)

(assert (=> b!693284 (= res!457438 e!394459)))

(declare-fun res!457423 () Bool)

(assert (=> b!693284 (=> (not res!457423) (not e!394459))))

(assert (=> b!693284 (= res!457423 (bvsgt from!3004 i!1382))))

(declare-fun b!693285 () Bool)

(declare-fun res!457426 () Bool)

(assert (=> b!693285 (=> (not res!457426) (not e!394467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!693285 (= res!457426 (validKeyInArray!0 (select (arr!19091 a!3626) from!3004)))))

(declare-fun b!693286 () Bool)

(declare-fun res!457431 () Bool)

(assert (=> b!693286 (=> (not res!457431) (not e!394463))))

(assert (=> b!693286 (= res!457431 (not (contains!3709 lt!316731 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693287 () Bool)

(declare-fun res!457428 () Bool)

(assert (=> b!693287 (=> (not res!457428) (not e!394467))))

(assert (=> b!693287 (= res!457428 (validKeyInArray!0 k!2843))))

(declare-fun b!693288 () Bool)

(declare-fun e!394466 () Bool)

(assert (=> b!693288 (= e!394467 e!394466)))

(declare-fun res!457424 () Bool)

(assert (=> b!693288 (=> (not res!457424) (not e!394466))))

(assert (=> b!693288 (= res!457424 (not (= (select (arr!19091 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!24482 0))(
  ( (Unit!24483) )
))
(declare-fun lt!316732 () Unit!24482)

(declare-fun e!394457 () Unit!24482)

(assert (=> b!693288 (= lt!316732 e!394457)))

(declare-fun c!78293 () Bool)

(assert (=> b!693288 (= c!78293 (= (select (arr!19091 a!3626) from!3004) k!2843))))

(declare-fun b!693289 () Bool)

(assert (=> b!693289 (= e!394463 false)))

(declare-fun lt!316729 () Bool)

(assert (=> b!693289 (= lt!316729 e!394462)))

(declare-fun res!457434 () Bool)

(assert (=> b!693289 (=> res!457434 e!394462)))

(declare-fun e!394464 () Bool)

(assert (=> b!693289 (= res!457434 e!394464)))

(declare-fun res!457436 () Bool)

(assert (=> b!693289 (=> (not res!457436) (not e!394464))))

(assert (=> b!693289 (= res!457436 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693290 () Bool)

(assert (=> b!693290 (= e!394458 e!394465)))

(declare-fun res!457429 () Bool)

(assert (=> b!693290 (=> (not res!457429) (not e!394465))))

(assert (=> b!693290 (= res!457429 (bvsle from!3004 i!1382))))

(declare-fun b!693291 () Bool)

(declare-fun res!457440 () Bool)

(assert (=> b!693291 (=> (not res!457440) (not e!394467))))

(assert (=> b!693291 (= res!457440 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!693292 () Bool)

(declare-fun Unit!24484 () Unit!24482)

(assert (=> b!693292 (= e!394457 Unit!24484)))

(assert (=> b!693292 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316730 () Unit!24482)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39854 (_ BitVec 64) (_ BitVec 32)) Unit!24482)

(assert (=> b!693292 (= lt!316730 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!693292 false))

(declare-fun b!693293 () Bool)

(declare-fun res!457444 () Bool)

(assert (=> b!693293 (=> (not res!457444) (not e!394463))))

(assert (=> b!693293 (= res!457444 (not (contains!3709 lt!316731 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693294 () Bool)

(declare-fun res!457433 () Bool)

(assert (=> b!693294 (=> (not res!457433) (not e!394467))))

(assert (=> b!693294 (= res!457433 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19476 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!693295 () Bool)

(assert (=> b!693295 (= e!394464 (contains!3709 lt!316731 k!2843))))

(declare-fun b!693296 () Bool)

(declare-fun res!457441 () Bool)

(assert (=> b!693296 (=> (not res!457441) (not e!394467))))

(assert (=> b!693296 (= res!457441 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19476 a!3626))))))

(declare-fun b!693297 () Bool)

(assert (=> b!693297 (= e!394466 e!394463)))

(declare-fun res!457445 () Bool)

(assert (=> b!693297 (=> (not res!457445) (not e!394463))))

(assert (=> b!693297 (= res!457445 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!421 (List!13132 (_ BitVec 64)) List!13132)

(assert (=> b!693297 (= lt!316731 ($colon$colon!421 acc!681 (select (arr!19091 a!3626) from!3004)))))

(declare-fun b!693298 () Bool)

(declare-fun Unit!24485 () Unit!24482)

(assert (=> b!693298 (= e!394457 Unit!24485)))

(declare-fun b!693299 () Bool)

(assert (=> b!693299 (= e!394459 (contains!3709 acc!681 k!2843))))

(declare-fun res!457427 () Bool)

(assert (=> start!61968 (=> (not res!457427) (not e!394467))))

(assert (=> start!61968 (= res!457427 (and (bvslt (size!19476 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19476 a!3626))))))

(assert (=> start!61968 e!394467))

(assert (=> start!61968 true))

(declare-fun array_inv!14887 (array!39854) Bool)

(assert (=> start!61968 (array_inv!14887 a!3626)))

(assert (= (and start!61968 res!457427) b!693278))

(assert (= (and b!693278 res!457430) b!693275))

(assert (= (and b!693275 res!457439) b!693279))

(assert (= (and b!693279 res!457442) b!693284))

(assert (= (and b!693284 res!457423) b!693299))

(assert (= (and b!693284 (not res!457438)) b!693290))

(assert (= (and b!693290 res!457429) b!693283))

(assert (= (and b!693284 res!457432) b!693280))

(assert (= (and b!693280 res!457435) b!693291))

(assert (= (and b!693291 res!457440) b!693296))

(assert (= (and b!693296 res!457441) b!693287))

(assert (= (and b!693287 res!457428) b!693282))

(assert (= (and b!693282 res!457425) b!693294))

(assert (= (and b!693294 res!457433) b!693285))

(assert (= (and b!693285 res!457426) b!693288))

(assert (= (and b!693288 c!78293) b!693292))

(assert (= (and b!693288 (not c!78293)) b!693298))

(assert (= (and b!693288 res!457424) b!693297))

(assert (= (and b!693297 res!457445) b!693281))

(assert (= (and b!693281 res!457443) b!693286))

(assert (= (and b!693286 res!457431) b!693293))

(assert (= (and b!693293 res!457444) b!693289))

(assert (= (and b!693289 res!457436) b!693295))

(assert (= (and b!693289 (not res!457434)) b!693277))

(assert (= (and b!693277 res!457437) b!693276))

(declare-fun m!655601 () Bool)

(assert (=> b!693281 m!655601))

(declare-fun m!655603 () Bool)

(assert (=> b!693283 m!655603))

(declare-fun m!655605 () Bool)

(assert (=> b!693275 m!655605))

(declare-fun m!655607 () Bool)

(assert (=> b!693278 m!655607))

(declare-fun m!655609 () Bool)

(assert (=> b!693287 m!655609))

(declare-fun m!655611 () Bool)

(assert (=> b!693285 m!655611))

(assert (=> b!693285 m!655611))

(declare-fun m!655613 () Bool)

(assert (=> b!693285 m!655613))

(declare-fun m!655615 () Bool)

(assert (=> b!693276 m!655615))

(declare-fun m!655617 () Bool)

(assert (=> b!693293 m!655617))

(assert (=> b!693299 m!655603))

(declare-fun m!655619 () Bool)

(assert (=> b!693282 m!655619))

(declare-fun m!655621 () Bool)

(assert (=> b!693291 m!655621))

(assert (=> b!693297 m!655611))

(assert (=> b!693297 m!655611))

(declare-fun m!655623 () Bool)

(assert (=> b!693297 m!655623))

(declare-fun m!655625 () Bool)

(assert (=> b!693279 m!655625))

(assert (=> b!693295 m!655615))

(declare-fun m!655627 () Bool)

(assert (=> start!61968 m!655627))

(declare-fun m!655629 () Bool)

(assert (=> b!693280 m!655629))

(assert (=> b!693288 m!655611))

(declare-fun m!655631 () Bool)

(assert (=> b!693292 m!655631))

(declare-fun m!655633 () Bool)

(assert (=> b!693292 m!655633))

(declare-fun m!655635 () Bool)

(assert (=> b!693286 m!655635))

(push 1)

