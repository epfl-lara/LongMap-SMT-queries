; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60224 () Bool)

(assert start!60224)

(declare-fun b!674379 () Bool)

(declare-datatypes ((Unit!23724 0))(
  ( (Unit!23725) )
))
(declare-fun e!384957 () Unit!23724)

(declare-fun Unit!23726 () Unit!23724)

(assert (=> b!674379 (= e!384957 Unit!23726)))

(declare-datatypes ((array!39271 0))(
  ( (array!39272 (arr!18828 (Array (_ BitVec 32) (_ BitVec 64))) (size!19192 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39271)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!39271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674379 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312608 () Unit!23724)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39271 (_ BitVec 64) (_ BitVec 32)) Unit!23724)

(assert (=> b!674379 (= lt!312608 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!674379 false))

(declare-fun b!674380 () Bool)

(declare-fun res!440876 () Bool)

(declare-fun e!384958 () Bool)

(assert (=> b!674380 (=> (not res!440876) (not e!384958))))

(declare-datatypes ((List!12869 0))(
  ( (Nil!12866) (Cons!12865 (h!13910 (_ BitVec 64)) (t!19097 List!12869)) )
))
(declare-fun acc!681 () List!12869)

(declare-fun contains!3446 (List!12869 (_ BitVec 64)) Bool)

(assert (=> b!674380 (= res!440876 (not (contains!3446 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674381 () Bool)

(declare-fun res!440857 () Bool)

(assert (=> b!674381 (=> (not res!440857) (not e!384958))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!674381 (= res!440857 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19192 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674383 () Bool)

(declare-fun e!384961 () Bool)

(declare-fun lt!312607 () List!12869)

(assert (=> b!674383 (= e!384961 (not (contains!3446 lt!312607 k!2843)))))

(declare-fun b!674384 () Bool)

(declare-fun res!440878 () Bool)

(declare-fun e!384963 () Bool)

(assert (=> b!674384 (=> (not res!440878) (not e!384963))))

(assert (=> b!674384 (= res!440878 (not (contains!3446 lt!312607 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674385 () Bool)

(declare-fun res!440859 () Bool)

(assert (=> b!674385 (=> (not res!440859) (not e!384963))))

(assert (=> b!674385 (= res!440859 (not (contains!3446 lt!312607 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674386 () Bool)

(declare-fun e!384964 () Bool)

(assert (=> b!674386 (= e!384964 e!384963)))

(declare-fun res!440868 () Bool)

(assert (=> b!674386 (=> (not res!440868) (not e!384963))))

(assert (=> b!674386 (= res!440868 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!296 (List!12869 (_ BitVec 64)) List!12869)

(assert (=> b!674386 (= lt!312607 ($colon$colon!296 acc!681 (select (arr!18828 a!3626) from!3004)))))

(declare-fun b!674387 () Bool)

(assert (=> b!674387 (= e!384963 (not true))))

(declare-fun arrayNoDuplicates!0 (array!39271 (_ BitVec 32) List!12869) Bool)

(assert (=> b!674387 (arrayNoDuplicates!0 (array!39272 (store (arr!18828 a!3626) i!1382 k!2843) (size!19192 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312607)))

(declare-fun lt!312609 () Unit!23724)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39271 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12869) Unit!23724)

(assert (=> b!674387 (= lt!312609 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312607))))

(declare-fun b!674388 () Bool)

(declare-fun e!384962 () Bool)

(assert (=> b!674388 (= e!384962 e!384961)))

(declare-fun res!440864 () Bool)

(assert (=> b!674388 (=> (not res!440864) (not e!384961))))

(assert (=> b!674388 (= res!440864 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674389 () Bool)

(declare-fun res!440872 () Bool)

(assert (=> b!674389 (=> (not res!440872) (not e!384958))))

(declare-fun noDuplicate!693 (List!12869) Bool)

(assert (=> b!674389 (= res!440872 (noDuplicate!693 acc!681))))

(declare-fun b!674390 () Bool)

(declare-fun Unit!23727 () Unit!23724)

(assert (=> b!674390 (= e!384957 Unit!23727)))

(declare-fun b!674391 () Bool)

(assert (=> b!674391 (= e!384958 e!384964)))

(declare-fun res!440870 () Bool)

(assert (=> b!674391 (=> (not res!440870) (not e!384964))))

(assert (=> b!674391 (= res!440870 (not (= (select (arr!18828 a!3626) from!3004) k!2843)))))

(declare-fun lt!312610 () Unit!23724)

(assert (=> b!674391 (= lt!312610 e!384957)))

(declare-fun c!77129 () Bool)

(assert (=> b!674391 (= c!77129 (= (select (arr!18828 a!3626) from!3004) k!2843))))

(declare-fun b!674392 () Bool)

(declare-fun res!440856 () Bool)

(assert (=> b!674392 (=> (not res!440856) (not e!384958))))

(declare-fun e!384960 () Bool)

(assert (=> b!674392 (= res!440856 e!384960)))

(declare-fun res!440867 () Bool)

(assert (=> b!674392 (=> res!440867 e!384960)))

(declare-fun e!384966 () Bool)

(assert (=> b!674392 (= res!440867 e!384966)))

(declare-fun res!440874 () Bool)

(assert (=> b!674392 (=> (not res!440874) (not e!384966))))

(assert (=> b!674392 (= res!440874 (bvsgt from!3004 i!1382))))

(declare-fun b!674393 () Bool)

(declare-fun e!384965 () Bool)

(assert (=> b!674393 (= e!384965 (contains!3446 lt!312607 k!2843))))

(declare-fun b!674394 () Bool)

(declare-fun res!440865 () Bool)

(assert (=> b!674394 (=> (not res!440865) (not e!384963))))

(assert (=> b!674394 (= res!440865 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312607))))

(declare-fun b!674395 () Bool)

(declare-fun e!384959 () Bool)

(assert (=> b!674395 (= e!384960 e!384959)))

(declare-fun res!440863 () Bool)

(assert (=> b!674395 (=> (not res!440863) (not e!384959))))

(assert (=> b!674395 (= res!440863 (bvsle from!3004 i!1382))))

(declare-fun b!674396 () Bool)

(assert (=> b!674396 (= e!384966 (contains!3446 acc!681 k!2843))))

(declare-fun res!440873 () Bool)

(assert (=> start!60224 (=> (not res!440873) (not e!384958))))

(assert (=> start!60224 (= res!440873 (and (bvslt (size!19192 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19192 a!3626))))))

(assert (=> start!60224 e!384958))

(assert (=> start!60224 true))

(declare-fun array_inv!14624 (array!39271) Bool)

(assert (=> start!60224 (array_inv!14624 a!3626)))

(declare-fun b!674382 () Bool)

(declare-fun res!440877 () Bool)

(assert (=> b!674382 (=> (not res!440877) (not e!384958))))

(assert (=> b!674382 (= res!440877 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674397 () Bool)

(declare-fun res!440860 () Bool)

(assert (=> b!674397 (=> (not res!440860) (not e!384958))))

(assert (=> b!674397 (= res!440860 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19192 a!3626))))))

(declare-fun b!674398 () Bool)

(declare-fun res!440862 () Bool)

(assert (=> b!674398 (=> (not res!440862) (not e!384958))))

(assert (=> b!674398 (= res!440862 (not (contains!3446 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674399 () Bool)

(declare-fun res!440871 () Bool)

(assert (=> b!674399 (=> (not res!440871) (not e!384958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674399 (= res!440871 (validKeyInArray!0 k!2843))))

(declare-fun b!674400 () Bool)

(declare-fun res!440879 () Bool)

(assert (=> b!674400 (=> (not res!440879) (not e!384958))))

(assert (=> b!674400 (= res!440879 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12866))))

(declare-fun b!674401 () Bool)

(declare-fun res!440875 () Bool)

(assert (=> b!674401 (=> (not res!440875) (not e!384958))))

(assert (=> b!674401 (= res!440875 (validKeyInArray!0 (select (arr!18828 a!3626) from!3004)))))

(declare-fun b!674402 () Bool)

(declare-fun res!440866 () Bool)

(assert (=> b!674402 (=> (not res!440866) (not e!384963))))

(assert (=> b!674402 (= res!440866 (noDuplicate!693 lt!312607))))

(declare-fun b!674403 () Bool)

(declare-fun res!440861 () Bool)

(assert (=> b!674403 (=> (not res!440861) (not e!384963))))

(assert (=> b!674403 (= res!440861 e!384962)))

(declare-fun res!440858 () Bool)

(assert (=> b!674403 (=> res!440858 e!384962)))

(assert (=> b!674403 (= res!440858 e!384965)))

(declare-fun res!440869 () Bool)

(assert (=> b!674403 (=> (not res!440869) (not e!384965))))

(assert (=> b!674403 (= res!440869 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674404 () Bool)

(declare-fun res!440855 () Bool)

(assert (=> b!674404 (=> (not res!440855) (not e!384958))))

(assert (=> b!674404 (= res!440855 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!674405 () Bool)

(assert (=> b!674405 (= e!384959 (not (contains!3446 acc!681 k!2843)))))

(assert (= (and start!60224 res!440873) b!674389))

(assert (= (and b!674389 res!440872) b!674380))

(assert (= (and b!674380 res!440876) b!674398))

(assert (= (and b!674398 res!440862) b!674392))

(assert (= (and b!674392 res!440874) b!674396))

(assert (= (and b!674392 (not res!440867)) b!674395))

(assert (= (and b!674395 res!440863) b!674405))

(assert (= (and b!674392 res!440856) b!674400))

(assert (= (and b!674400 res!440879) b!674404))

(assert (= (and b!674404 res!440855) b!674397))

(assert (= (and b!674397 res!440860) b!674399))

(assert (= (and b!674399 res!440871) b!674382))

(assert (= (and b!674382 res!440877) b!674381))

(assert (= (and b!674381 res!440857) b!674401))

(assert (= (and b!674401 res!440875) b!674391))

(assert (= (and b!674391 c!77129) b!674379))

(assert (= (and b!674391 (not c!77129)) b!674390))

(assert (= (and b!674391 res!440870) b!674386))

(assert (= (and b!674386 res!440868) b!674402))

(assert (= (and b!674402 res!440866) b!674385))

(assert (= (and b!674385 res!440859) b!674384))

(assert (= (and b!674384 res!440878) b!674403))

(assert (= (and b!674403 res!440869) b!674393))

(assert (= (and b!674403 (not res!440858)) b!674388))

(assert (= (and b!674388 res!440864) b!674383))

(assert (= (and b!674403 res!440861) b!674394))

(assert (= (and b!674394 res!440865) b!674387))

(declare-fun m!642359 () Bool)

(assert (=> b!674396 m!642359))

(declare-fun m!642361 () Bool)

(assert (=> b!674404 m!642361))

(declare-fun m!642363 () Bool)

(assert (=> b!674389 m!642363))

(declare-fun m!642365 () Bool)

(assert (=> b!674382 m!642365))

(declare-fun m!642367 () Bool)

(assert (=> b!674394 m!642367))

(declare-fun m!642369 () Bool)

(assert (=> b!674393 m!642369))

(declare-fun m!642371 () Bool)

(assert (=> b!674385 m!642371))

(declare-fun m!642373 () Bool)

(assert (=> b!674387 m!642373))

(declare-fun m!642375 () Bool)

(assert (=> b!674387 m!642375))

(declare-fun m!642377 () Bool)

(assert (=> b!674387 m!642377))

(declare-fun m!642379 () Bool)

(assert (=> start!60224 m!642379))

(declare-fun m!642381 () Bool)

(assert (=> b!674402 m!642381))

(declare-fun m!642383 () Bool)

(assert (=> b!674400 m!642383))

(declare-fun m!642385 () Bool)

(assert (=> b!674384 m!642385))

(assert (=> b!674383 m!642369))

(declare-fun m!642387 () Bool)

(assert (=> b!674386 m!642387))

(assert (=> b!674386 m!642387))

(declare-fun m!642389 () Bool)

(assert (=> b!674386 m!642389))

(assert (=> b!674391 m!642387))

(assert (=> b!674401 m!642387))

(assert (=> b!674401 m!642387))

(declare-fun m!642391 () Bool)

(assert (=> b!674401 m!642391))

(assert (=> b!674405 m!642359))

(declare-fun m!642393 () Bool)

(assert (=> b!674380 m!642393))

(declare-fun m!642395 () Bool)

(assert (=> b!674398 m!642395))

(declare-fun m!642397 () Bool)

(assert (=> b!674379 m!642397))

(declare-fun m!642399 () Bool)

(assert (=> b!674379 m!642399))

(declare-fun m!642401 () Bool)

(assert (=> b!674399 m!642401))

(push 1)

