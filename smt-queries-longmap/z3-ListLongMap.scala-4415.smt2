; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60982 () Bool)

(assert start!60982)

(declare-fun b!683863 () Bool)

(declare-fun res!449546 () Bool)

(declare-fun e!389553 () Bool)

(assert (=> b!683863 (=> (not res!449546) (not e!389553))))

(declare-datatypes ((array!39591 0))(
  ( (array!39592 (arr!18976 (Array (_ BitVec 32) (_ BitVec 64))) (size!19343 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39591)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683863 (= res!449546 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683864 () Bool)

(declare-fun res!449541 () Bool)

(assert (=> b!683864 (=> (not res!449541) (not e!389553))))

(declare-datatypes ((List!13017 0))(
  ( (Nil!13014) (Cons!13013 (h!14058 (_ BitVec 64)) (t!19263 List!13017)) )
))
(declare-fun acc!681 () List!13017)

(declare-fun contains!3594 (List!13017 (_ BitVec 64)) Bool)

(assert (=> b!683864 (= res!449541 (not (contains!3594 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683865 () Bool)

(declare-fun e!389555 () Bool)

(assert (=> b!683865 (= e!389555 (contains!3594 acc!681 k0!2843))))

(declare-fun b!683866 () Bool)

(declare-fun res!449545 () Bool)

(assert (=> b!683866 (=> (not res!449545) (not e!389553))))

(assert (=> b!683866 (= res!449545 (not (contains!3594 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683867 () Bool)

(declare-fun res!449542 () Bool)

(assert (=> b!683867 (=> (not res!449542) (not e!389553))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!683867 (= res!449542 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19343 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683868 () Bool)

(declare-datatypes ((Unit!24047 0))(
  ( (Unit!24048) )
))
(declare-fun e!389554 () Unit!24047)

(declare-fun Unit!24049 () Unit!24047)

(assert (=> b!683868 (= e!389554 Unit!24049)))

(declare-fun b!683869 () Bool)

(declare-fun res!449539 () Bool)

(assert (=> b!683869 (=> (not res!449539) (not e!389553))))

(declare-fun e!389552 () Bool)

(assert (=> b!683869 (= res!449539 e!389552)))

(declare-fun res!449547 () Bool)

(assert (=> b!683869 (=> res!449547 e!389552)))

(assert (=> b!683869 (= res!449547 e!389555)))

(declare-fun res!449537 () Bool)

(assert (=> b!683869 (=> (not res!449537) (not e!389555))))

(assert (=> b!683869 (= res!449537 (bvsgt from!3004 i!1382))))

(declare-fun res!449552 () Bool)

(assert (=> start!60982 (=> (not res!449552) (not e!389553))))

(assert (=> start!60982 (= res!449552 (and (bvslt (size!19343 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19343 a!3626))))))

(assert (=> start!60982 e!389553))

(assert (=> start!60982 true))

(declare-fun array_inv!14772 (array!39591) Bool)

(assert (=> start!60982 (array_inv!14772 a!3626)))

(declare-fun b!683870 () Bool)

(declare-fun res!449538 () Bool)

(assert (=> b!683870 (=> (not res!449538) (not e!389553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683870 (= res!449538 (validKeyInArray!0 k0!2843))))

(declare-fun b!683871 () Bool)

(declare-fun e!389551 () Unit!24047)

(declare-fun Unit!24050 () Unit!24047)

(assert (=> b!683871 (= e!389551 Unit!24050)))

(declare-fun b!683872 () Bool)

(declare-fun Unit!24051 () Unit!24047)

(assert (=> b!683872 (= e!389554 Unit!24051)))

(declare-fun lt!314066 () Unit!24047)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39591 (_ BitVec 64) (_ BitVec 32)) Unit!24047)

(assert (=> b!683872 (= lt!314066 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!683872 false))

(declare-fun b!683873 () Bool)

(declare-fun res!449550 () Bool)

(assert (=> b!683873 (=> (not res!449550) (not e!389553))))

(declare-fun arrayNoDuplicates!0 (array!39591 (_ BitVec 32) List!13017) Bool)

(assert (=> b!683873 (= res!449550 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683874 () Bool)

(declare-fun e!389550 () Bool)

(declare-fun lt!314068 () Bool)

(assert (=> b!683874 (= e!389550 (not lt!314068))))

(declare-fun b!683875 () Bool)

(declare-fun res!449543 () Bool)

(assert (=> b!683875 (=> res!449543 e!389550)))

(declare-fun lt!314064 () List!13017)

(declare-fun noDuplicate!841 (List!13017) Bool)

(assert (=> b!683875 (= res!449543 (not (noDuplicate!841 lt!314064)))))

(declare-fun b!683876 () Bool)

(declare-fun lt!314062 () Unit!24047)

(assert (=> b!683876 (= e!389551 lt!314062)))

(declare-fun lt!314060 () Unit!24047)

(declare-fun lemmaListSubSeqRefl!0 (List!13017) Unit!24047)

(assert (=> b!683876 (= lt!314060 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!180 (List!13017 List!13017) Bool)

(assert (=> b!683876 (subseq!180 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39591 List!13017 List!13017 (_ BitVec 32)) Unit!24047)

(declare-fun $colon$colon!345 (List!13017 (_ BitVec 64)) List!13017)

(assert (=> b!683876 (= lt!314062 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!345 acc!681 (select (arr!18976 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683876 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683877 () Bool)

(assert (=> b!683877 (= e!389553 (not e!389550))))

(declare-fun res!449551 () Bool)

(assert (=> b!683877 (=> res!449551 e!389550)))

(assert (=> b!683877 (= res!449551 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!145 (List!13017 (_ BitVec 64)) List!13017)

(assert (=> b!683877 (= (-!145 lt!314064 k0!2843) acc!681)))

(assert (=> b!683877 (= lt!314064 ($colon$colon!345 acc!681 k0!2843))))

(declare-fun lt!314065 () Unit!24047)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13017) Unit!24047)

(assert (=> b!683877 (= lt!314065 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!683877 (subseq!180 acc!681 acc!681)))

(declare-fun lt!314061 () Unit!24047)

(assert (=> b!683877 (= lt!314061 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683877 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314067 () Unit!24047)

(assert (=> b!683877 (= lt!314067 e!389551)))

(declare-fun c!77531 () Bool)

(assert (=> b!683877 (= c!77531 (validKeyInArray!0 (select (arr!18976 a!3626) from!3004)))))

(declare-fun lt!314063 () Unit!24047)

(assert (=> b!683877 (= lt!314063 e!389554)))

(declare-fun c!77530 () Bool)

(assert (=> b!683877 (= c!77530 lt!314068)))

(assert (=> b!683877 (= lt!314068 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683877 (arrayContainsKey!0 (array!39592 (store (arr!18976 a!3626) i!1382 k0!2843) (size!19343 a!3626)) k0!2843 from!3004)))

(declare-fun b!683878 () Bool)

(declare-fun res!449540 () Bool)

(assert (=> b!683878 (=> (not res!449540) (not e!389553))))

(assert (=> b!683878 (= res!449540 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13014))))

(declare-fun b!683879 () Bool)

(declare-fun res!449548 () Bool)

(assert (=> b!683879 (=> (not res!449548) (not e!389553))))

(assert (=> b!683879 (= res!449548 (noDuplicate!841 acc!681))))

(declare-fun b!683880 () Bool)

(declare-fun res!449544 () Bool)

(assert (=> b!683880 (=> (not res!449544) (not e!389553))))

(assert (=> b!683880 (= res!449544 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19343 a!3626))))))

(declare-fun b!683881 () Bool)

(declare-fun e!389549 () Bool)

(assert (=> b!683881 (= e!389552 e!389549)))

(declare-fun res!449549 () Bool)

(assert (=> b!683881 (=> (not res!449549) (not e!389549))))

(assert (=> b!683881 (= res!449549 (bvsle from!3004 i!1382))))

(declare-fun b!683882 () Bool)

(assert (=> b!683882 (= e!389549 (not (contains!3594 acc!681 k0!2843)))))

(assert (= (and start!60982 res!449552) b!683879))

(assert (= (and b!683879 res!449548) b!683864))

(assert (= (and b!683864 res!449541) b!683866))

(assert (= (and b!683866 res!449545) b!683869))

(assert (= (and b!683869 res!449537) b!683865))

(assert (= (and b!683869 (not res!449547)) b!683881))

(assert (= (and b!683881 res!449549) b!683882))

(assert (= (and b!683869 res!449539) b!683878))

(assert (= (and b!683878 res!449540) b!683873))

(assert (= (and b!683873 res!449550) b!683880))

(assert (= (and b!683880 res!449544) b!683870))

(assert (= (and b!683870 res!449538) b!683863))

(assert (= (and b!683863 res!449546) b!683867))

(assert (= (and b!683867 res!449542) b!683877))

(assert (= (and b!683877 c!77530) b!683872))

(assert (= (and b!683877 (not c!77530)) b!683868))

(assert (= (and b!683877 c!77531) b!683876))

(assert (= (and b!683877 (not c!77531)) b!683871))

(assert (= (and b!683877 (not res!449551)) b!683875))

(assert (= (and b!683875 (not res!449543)) b!683874))

(declare-fun m!648353 () Bool)

(assert (=> b!683863 m!648353))

(declare-fun m!648355 () Bool)

(assert (=> b!683864 m!648355))

(declare-fun m!648357 () Bool)

(assert (=> b!683878 m!648357))

(declare-fun m!648359 () Bool)

(assert (=> b!683877 m!648359))

(declare-fun m!648361 () Bool)

(assert (=> b!683877 m!648361))

(declare-fun m!648363 () Bool)

(assert (=> b!683877 m!648363))

(declare-fun m!648365 () Bool)

(assert (=> b!683877 m!648365))

(declare-fun m!648367 () Bool)

(assert (=> b!683877 m!648367))

(declare-fun m!648369 () Bool)

(assert (=> b!683877 m!648369))

(declare-fun m!648371 () Bool)

(assert (=> b!683877 m!648371))

(assert (=> b!683877 m!648361))

(declare-fun m!648373 () Bool)

(assert (=> b!683877 m!648373))

(declare-fun m!648375 () Bool)

(assert (=> b!683877 m!648375))

(declare-fun m!648377 () Bool)

(assert (=> b!683877 m!648377))

(declare-fun m!648379 () Bool)

(assert (=> b!683877 m!648379))

(declare-fun m!648381 () Bool)

(assert (=> b!683882 m!648381))

(declare-fun m!648383 () Bool)

(assert (=> b!683875 m!648383))

(declare-fun m!648385 () Bool)

(assert (=> start!60982 m!648385))

(declare-fun m!648387 () Bool)

(assert (=> b!683873 m!648387))

(declare-fun m!648389 () Bool)

(assert (=> b!683870 m!648389))

(assert (=> b!683876 m!648359))

(assert (=> b!683876 m!648361))

(declare-fun m!648391 () Bool)

(assert (=> b!683876 m!648391))

(declare-fun m!648393 () Bool)

(assert (=> b!683876 m!648393))

(assert (=> b!683876 m!648361))

(assert (=> b!683876 m!648391))

(assert (=> b!683876 m!648367))

(assert (=> b!683876 m!648379))

(declare-fun m!648395 () Bool)

(assert (=> b!683872 m!648395))

(declare-fun m!648397 () Bool)

(assert (=> b!683879 m!648397))

(assert (=> b!683865 m!648381))

(declare-fun m!648399 () Bool)

(assert (=> b!683866 m!648399))

(check-sat (not b!683882) (not b!683864) (not b!683872) (not b!683875) (not b!683863) (not b!683865) (not b!683876) (not b!683870) (not b!683866) (not b!683877) (not b!683878) (not start!60982) (not b!683879) (not b!683873))
(check-sat)
