; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60984 () Bool)

(assert start!60984)

(declare-fun b!683923 () Bool)

(declare-fun e!389578 () Bool)

(declare-fun lt!314094 () Bool)

(assert (=> b!683923 (= e!389578 (not lt!314094))))

(declare-fun b!683924 () Bool)

(declare-datatypes ((Unit!24052 0))(
  ( (Unit!24053) )
))
(declare-fun e!389577 () Unit!24052)

(declare-fun Unit!24054 () Unit!24052)

(assert (=> b!683924 (= e!389577 Unit!24054)))

(declare-fun b!683926 () Bool)

(declare-fun res!449593 () Bool)

(declare-fun e!389580 () Bool)

(assert (=> b!683926 (=> (not res!449593) (not e!389580))))

(declare-datatypes ((array!39593 0))(
  ( (array!39594 (arr!18977 (Array (_ BitVec 32) (_ BitVec 64))) (size!19344 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39593)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683926 (= res!449593 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683927 () Bool)

(declare-fun res!449589 () Bool)

(assert (=> b!683927 (=> (not res!449589) (not e!389580))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!683927 (= res!449589 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19344 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683928 () Bool)

(declare-fun res!449595 () Bool)

(assert (=> b!683928 (=> (not res!449595) (not e!389580))))

(declare-datatypes ((List!13018 0))(
  ( (Nil!13015) (Cons!13014 (h!14059 (_ BitVec 64)) (t!19264 List!13018)) )
))
(declare-fun acc!681 () List!13018)

(declare-fun arrayNoDuplicates!0 (array!39593 (_ BitVec 32) List!13018) Bool)

(assert (=> b!683928 (= res!449595 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683929 () Bool)

(declare-fun e!389576 () Bool)

(declare-fun e!389575 () Bool)

(assert (=> b!683929 (= e!389576 e!389575)))

(declare-fun res!449594 () Bool)

(assert (=> b!683929 (=> (not res!449594) (not e!389575))))

(assert (=> b!683929 (= res!449594 (bvsle from!3004 i!1382))))

(declare-fun b!683930 () Bool)

(declare-fun contains!3595 (List!13018 (_ BitVec 64)) Bool)

(assert (=> b!683930 (= e!389575 (not (contains!3595 acc!681 k!2843)))))

(declare-fun b!683931 () Bool)

(declare-fun res!449600 () Bool)

(assert (=> b!683931 (=> (not res!449600) (not e!389580))))

(assert (=> b!683931 (= res!449600 (not (contains!3595 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683932 () Bool)

(declare-fun res!449587 () Bool)

(assert (=> b!683932 (=> (not res!449587) (not e!389580))))

(assert (=> b!683932 (= res!449587 (not (contains!3595 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683933 () Bool)

(declare-fun res!449597 () Bool)

(assert (=> b!683933 (=> (not res!449597) (not e!389580))))

(declare-fun noDuplicate!842 (List!13018) Bool)

(assert (=> b!683933 (= res!449597 (noDuplicate!842 acc!681))))

(declare-fun b!683934 () Bool)

(declare-fun res!449585 () Bool)

(assert (=> b!683934 (=> res!449585 e!389578)))

(declare-fun lt!314088 () List!13018)

(assert (=> b!683934 (= res!449585 (not (noDuplicate!842 lt!314088)))))

(declare-fun b!683935 () Bool)

(declare-fun lt!314090 () Unit!24052)

(assert (=> b!683935 (= e!389577 lt!314090)))

(declare-fun lt!314093 () Unit!24052)

(declare-fun lemmaListSubSeqRefl!0 (List!13018) Unit!24052)

(assert (=> b!683935 (= lt!314093 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!181 (List!13018 List!13018) Bool)

(assert (=> b!683935 (subseq!181 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39593 List!13018 List!13018 (_ BitVec 32)) Unit!24052)

(declare-fun $colon$colon!346 (List!13018 (_ BitVec 64)) List!13018)

(assert (=> b!683935 (= lt!314090 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!346 acc!681 (select (arr!18977 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683935 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683936 () Bool)

(declare-fun res!449591 () Bool)

(assert (=> b!683936 (=> (not res!449591) (not e!389580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683936 (= res!449591 (validKeyInArray!0 k!2843))))

(declare-fun b!683925 () Bool)

(declare-fun res!449596 () Bool)

(assert (=> b!683925 (=> (not res!449596) (not e!389580))))

(assert (=> b!683925 (= res!449596 e!389576)))

(declare-fun res!449592 () Bool)

(assert (=> b!683925 (=> res!449592 e!389576)))

(declare-fun e!389573 () Bool)

(assert (=> b!683925 (= res!449592 e!389573)))

(declare-fun res!449588 () Bool)

(assert (=> b!683925 (=> (not res!449588) (not e!389573))))

(assert (=> b!683925 (= res!449588 (bvsgt from!3004 i!1382))))

(declare-fun res!449599 () Bool)

(assert (=> start!60984 (=> (not res!449599) (not e!389580))))

(assert (=> start!60984 (= res!449599 (and (bvslt (size!19344 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19344 a!3626))))))

(assert (=> start!60984 e!389580))

(assert (=> start!60984 true))

(declare-fun array_inv!14773 (array!39593) Bool)

(assert (=> start!60984 (array_inv!14773 a!3626)))

(declare-fun b!683937 () Bool)

(declare-fun res!449590 () Bool)

(assert (=> b!683937 (=> (not res!449590) (not e!389580))))

(assert (=> b!683937 (= res!449590 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13015))))

(declare-fun b!683938 () Bool)

(declare-fun e!389579 () Unit!24052)

(declare-fun Unit!24055 () Unit!24052)

(assert (=> b!683938 (= e!389579 Unit!24055)))

(declare-fun b!683939 () Bool)

(declare-fun Unit!24056 () Unit!24052)

(assert (=> b!683939 (= e!389579 Unit!24056)))

(declare-fun lt!314089 () Unit!24052)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39593 (_ BitVec 64) (_ BitVec 32)) Unit!24052)

(assert (=> b!683939 (= lt!314089 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!683939 false))

(declare-fun b!683940 () Bool)

(assert (=> b!683940 (= e!389573 (contains!3595 acc!681 k!2843))))

(declare-fun b!683941 () Bool)

(assert (=> b!683941 (= e!389580 (not e!389578))))

(declare-fun res!449586 () Bool)

(assert (=> b!683941 (=> res!449586 e!389578)))

(assert (=> b!683941 (= res!449586 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!146 (List!13018 (_ BitVec 64)) List!13018)

(assert (=> b!683941 (= (-!146 lt!314088 k!2843) acc!681)))

(assert (=> b!683941 (= lt!314088 ($colon$colon!346 acc!681 k!2843))))

(declare-fun lt!314087 () Unit!24052)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13018) Unit!24052)

(assert (=> b!683941 (= lt!314087 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!683941 (subseq!181 acc!681 acc!681)))

(declare-fun lt!314092 () Unit!24052)

(assert (=> b!683941 (= lt!314092 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683941 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314095 () Unit!24052)

(assert (=> b!683941 (= lt!314095 e!389577)))

(declare-fun c!77537 () Bool)

(assert (=> b!683941 (= c!77537 (validKeyInArray!0 (select (arr!18977 a!3626) from!3004)))))

(declare-fun lt!314091 () Unit!24052)

(assert (=> b!683941 (= lt!314091 e!389579)))

(declare-fun c!77536 () Bool)

(assert (=> b!683941 (= c!77536 lt!314094)))

(assert (=> b!683941 (= lt!314094 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683941 (arrayContainsKey!0 (array!39594 (store (arr!18977 a!3626) i!1382 k!2843) (size!19344 a!3626)) k!2843 from!3004)))

(declare-fun b!683942 () Bool)

(declare-fun res!449598 () Bool)

(assert (=> b!683942 (=> (not res!449598) (not e!389580))))

(assert (=> b!683942 (= res!449598 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19344 a!3626))))))

(assert (= (and start!60984 res!449599) b!683933))

(assert (= (and b!683933 res!449597) b!683931))

(assert (= (and b!683931 res!449600) b!683932))

(assert (= (and b!683932 res!449587) b!683925))

(assert (= (and b!683925 res!449588) b!683940))

(assert (= (and b!683925 (not res!449592)) b!683929))

(assert (= (and b!683929 res!449594) b!683930))

(assert (= (and b!683925 res!449596) b!683937))

(assert (= (and b!683937 res!449590) b!683928))

(assert (= (and b!683928 res!449595) b!683942))

(assert (= (and b!683942 res!449598) b!683936))

(assert (= (and b!683936 res!449591) b!683926))

(assert (= (and b!683926 res!449593) b!683927))

(assert (= (and b!683927 res!449589) b!683941))

(assert (= (and b!683941 c!77536) b!683939))

(assert (= (and b!683941 (not c!77536)) b!683938))

(assert (= (and b!683941 c!77537) b!683935))

(assert (= (and b!683941 (not c!77537)) b!683924))

(assert (= (and b!683941 (not res!449586)) b!683934))

(assert (= (and b!683934 (not res!449585)) b!683923))

(declare-fun m!648401 () Bool)

(assert (=> b!683930 m!648401))

(assert (=> b!683940 m!648401))

(declare-fun m!648403 () Bool)

(assert (=> b!683931 m!648403))

(declare-fun m!648405 () Bool)

(assert (=> b!683934 m!648405))

(declare-fun m!648407 () Bool)

(assert (=> b!683933 m!648407))

(declare-fun m!648409 () Bool)

(assert (=> b!683936 m!648409))

(declare-fun m!648411 () Bool)

(assert (=> b!683941 m!648411))

(declare-fun m!648413 () Bool)

(assert (=> b!683941 m!648413))

(declare-fun m!648415 () Bool)

(assert (=> b!683941 m!648415))

(declare-fun m!648417 () Bool)

(assert (=> b!683941 m!648417))

(declare-fun m!648419 () Bool)

(assert (=> b!683941 m!648419))

(declare-fun m!648421 () Bool)

(assert (=> b!683941 m!648421))

(declare-fun m!648423 () Bool)

(assert (=> b!683941 m!648423))

(declare-fun m!648425 () Bool)

(assert (=> b!683941 m!648425))

(assert (=> b!683941 m!648413))

(declare-fun m!648427 () Bool)

(assert (=> b!683941 m!648427))

(declare-fun m!648429 () Bool)

(assert (=> b!683941 m!648429))

(declare-fun m!648431 () Bool)

(assert (=> b!683941 m!648431))

(assert (=> b!683935 m!648411))

(assert (=> b!683935 m!648413))

(declare-fun m!648433 () Bool)

(assert (=> b!683935 m!648433))

(declare-fun m!648435 () Bool)

(assert (=> b!683935 m!648435))

(assert (=> b!683935 m!648413))

(assert (=> b!683935 m!648433))

(assert (=> b!683935 m!648419))

(assert (=> b!683935 m!648431))

(declare-fun m!648437 () Bool)

(assert (=> b!683926 m!648437))

(declare-fun m!648439 () Bool)

(assert (=> b!683932 m!648439))

(declare-fun m!648441 () Bool)

(assert (=> b!683928 m!648441))

(declare-fun m!648443 () Bool)

(assert (=> b!683939 m!648443))

(declare-fun m!648445 () Bool)

(assert (=> start!60984 m!648445))

(declare-fun m!648447 () Bool)

(assert (=> b!683937 m!648447))

(push 1)

(assert (not b!683931))

(assert (not b!683932))

(assert (not b!683939))

(assert (not b!683937))

(assert (not start!60984))

(assert (not b!683935))

(assert (not b!683940))

(assert (not b!683934))

(assert (not b!683933))

(assert (not b!683936))

(assert (not b!683926))

(assert (not b!683930))

(assert (not b!683928))

(assert (not b!683941))

(check-sat)

(pop 1)

