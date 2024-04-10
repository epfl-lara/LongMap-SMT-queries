; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61268 () Bool)

(assert start!61268)

(declare-fun b!686325 () Bool)

(declare-fun res!451492 () Bool)

(declare-fun e!390865 () Bool)

(assert (=> b!686325 (=> (not res!451492) (not e!390865))))

(declare-datatypes ((array!39652 0))(
  ( (array!39653 (arr!19002 (Array (_ BitVec 32) (_ BitVec 64))) (size!19376 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39652)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13043 0))(
  ( (Nil!13040) (Cons!13039 (h!14084 (_ BitVec 64)) (t!19298 List!13043)) )
))
(declare-fun acc!681 () List!13043)

(declare-fun arrayNoDuplicates!0 (array!39652 (_ BitVec 32) List!13043) Bool)

(assert (=> b!686325 (= res!451492 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686327 () Bool)

(declare-fun res!451490 () Bool)

(assert (=> b!686327 (=> (not res!451490) (not e!390865))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686327 (= res!451490 (validKeyInArray!0 k!2843))))

(declare-fun b!686328 () Bool)

(assert (=> b!686328 (= e!390865 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun lt!314983 () List!13043)

(assert (=> b!686328 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!314983)))

(declare-datatypes ((Unit!24177 0))(
  ( (Unit!24178) )
))
(declare-fun lt!314984 () Unit!24177)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39652 (_ BitVec 64) (_ BitVec 32) List!13043 List!13043) Unit!24177)

(assert (=> b!686328 (= lt!314984 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!314983))))

(declare-fun -!171 (List!13043 (_ BitVec 64)) List!13043)

(assert (=> b!686328 (= (-!171 lt!314983 k!2843) acc!681)))

(declare-fun $colon$colon!371 (List!13043 (_ BitVec 64)) List!13043)

(assert (=> b!686328 (= lt!314983 ($colon$colon!371 acc!681 k!2843))))

(declare-fun lt!314988 () Unit!24177)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13043) Unit!24177)

(assert (=> b!686328 (= lt!314988 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!206 (List!13043 List!13043) Bool)

(assert (=> b!686328 (subseq!206 acc!681 acc!681)))

(declare-fun lt!314989 () Unit!24177)

(declare-fun lemmaListSubSeqRefl!0 (List!13043) Unit!24177)

(assert (=> b!686328 (= lt!314989 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686328 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314981 () Unit!24177)

(declare-fun e!390864 () Unit!24177)

(assert (=> b!686328 (= lt!314981 e!390864)))

(declare-fun c!77786 () Bool)

(assert (=> b!686328 (= c!77786 (validKeyInArray!0 (select (arr!19002 a!3626) from!3004)))))

(declare-fun lt!314987 () Unit!24177)

(declare-fun e!390863 () Unit!24177)

(assert (=> b!686328 (= lt!314987 e!390863)))

(declare-fun c!77785 () Bool)

(declare-fun arrayContainsKey!0 (array!39652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686328 (= c!77785 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!686328 (arrayContainsKey!0 (array!39653 (store (arr!19002 a!3626) i!1382 k!2843) (size!19376 a!3626)) k!2843 from!3004)))

(declare-fun b!686329 () Bool)

(declare-fun e!390866 () Bool)

(declare-fun contains!3620 (List!13043 (_ BitVec 64)) Bool)

(assert (=> b!686329 (= e!390866 (not (contains!3620 acc!681 k!2843)))))

(declare-fun b!686330 () Bool)

(declare-fun lt!314985 () Unit!24177)

(assert (=> b!686330 (= e!390864 lt!314985)))

(declare-fun lt!314982 () Unit!24177)

(assert (=> b!686330 (= lt!314982 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686330 (subseq!206 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39652 List!13043 List!13043 (_ BitVec 32)) Unit!24177)

(assert (=> b!686330 (= lt!314985 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!371 acc!681 (select (arr!19002 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686330 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686331 () Bool)

(declare-fun res!451493 () Bool)

(assert (=> b!686331 (=> (not res!451493) (not e!390865))))

(assert (=> b!686331 (= res!451493 (not (contains!3620 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686332 () Bool)

(declare-fun res!451498 () Bool)

(assert (=> b!686332 (=> (not res!451498) (not e!390865))))

(declare-fun noDuplicate!867 (List!13043) Bool)

(assert (=> b!686332 (= res!451498 (noDuplicate!867 acc!681))))

(declare-fun b!686333 () Bool)

(declare-fun e!390862 () Bool)

(assert (=> b!686333 (= e!390862 (contains!3620 acc!681 k!2843))))

(declare-fun b!686334 () Bool)

(declare-fun res!451497 () Bool)

(assert (=> b!686334 (=> (not res!451497) (not e!390865))))

(declare-fun e!390867 () Bool)

(assert (=> b!686334 (= res!451497 e!390867)))

(declare-fun res!451494 () Bool)

(assert (=> b!686334 (=> res!451494 e!390867)))

(assert (=> b!686334 (= res!451494 e!390862)))

(declare-fun res!451499 () Bool)

(assert (=> b!686334 (=> (not res!451499) (not e!390862))))

(assert (=> b!686334 (= res!451499 (bvsgt from!3004 i!1382))))

(declare-fun b!686335 () Bool)

(declare-fun Unit!24179 () Unit!24177)

(assert (=> b!686335 (= e!390863 Unit!24179)))

(declare-fun b!686336 () Bool)

(declare-fun res!451502 () Bool)

(assert (=> b!686336 (=> (not res!451502) (not e!390865))))

(assert (=> b!686336 (= res!451502 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19376 a!3626))))))

(declare-fun b!686337 () Bool)

(declare-fun Unit!24180 () Unit!24177)

(assert (=> b!686337 (= e!390863 Unit!24180)))

(declare-fun lt!314986 () Unit!24177)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39652 (_ BitVec 64) (_ BitVec 32)) Unit!24177)

(assert (=> b!686337 (= lt!314986 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!686337 false))

(declare-fun b!686338 () Bool)

(declare-fun res!451495 () Bool)

(assert (=> b!686338 (=> (not res!451495) (not e!390865))))

(assert (=> b!686338 (= res!451495 (not (contains!3620 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!451491 () Bool)

(assert (=> start!61268 (=> (not res!451491) (not e!390865))))

(assert (=> start!61268 (= res!451491 (and (bvslt (size!19376 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19376 a!3626))))))

(assert (=> start!61268 e!390865))

(assert (=> start!61268 true))

(declare-fun array_inv!14798 (array!39652) Bool)

(assert (=> start!61268 (array_inv!14798 a!3626)))

(declare-fun b!686326 () Bool)

(declare-fun res!451489 () Bool)

(assert (=> b!686326 (=> (not res!451489) (not e!390865))))

(assert (=> b!686326 (= res!451489 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686339 () Bool)

(declare-fun res!451501 () Bool)

(assert (=> b!686339 (=> (not res!451501) (not e!390865))))

(assert (=> b!686339 (= res!451501 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19376 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686340 () Bool)

(assert (=> b!686340 (= e!390867 e!390866)))

(declare-fun res!451500 () Bool)

(assert (=> b!686340 (=> (not res!451500) (not e!390866))))

(assert (=> b!686340 (= res!451500 (bvsle from!3004 i!1382))))

(declare-fun b!686341 () Bool)

(declare-fun res!451496 () Bool)

(assert (=> b!686341 (=> (not res!451496) (not e!390865))))

(assert (=> b!686341 (= res!451496 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13040))))

(declare-fun b!686342 () Bool)

(declare-fun Unit!24181 () Unit!24177)

(assert (=> b!686342 (= e!390864 Unit!24181)))

(assert (= (and start!61268 res!451491) b!686332))

(assert (= (and b!686332 res!451498) b!686331))

(assert (= (and b!686331 res!451493) b!686338))

(assert (= (and b!686338 res!451495) b!686334))

(assert (= (and b!686334 res!451499) b!686333))

(assert (= (and b!686334 (not res!451494)) b!686340))

(assert (= (and b!686340 res!451500) b!686329))

(assert (= (and b!686334 res!451497) b!686341))

(assert (= (and b!686341 res!451496) b!686325))

(assert (= (and b!686325 res!451492) b!686336))

(assert (= (and b!686336 res!451502) b!686327))

(assert (= (and b!686327 res!451490) b!686326))

(assert (= (and b!686326 res!451489) b!686339))

(assert (= (and b!686339 res!451501) b!686328))

(assert (= (and b!686328 c!77785) b!686337))

(assert (= (and b!686328 (not c!77785)) b!686335))

(assert (= (and b!686328 c!77786) b!686330))

(assert (= (and b!686328 (not c!77786)) b!686342))

(declare-fun m!650429 () Bool)

(assert (=> b!686328 m!650429))

(declare-fun m!650431 () Bool)

(assert (=> b!686328 m!650431))

(declare-fun m!650433 () Bool)

(assert (=> b!686328 m!650433))

(declare-fun m!650435 () Bool)

(assert (=> b!686328 m!650435))

(declare-fun m!650437 () Bool)

(assert (=> b!686328 m!650437))

(declare-fun m!650439 () Bool)

(assert (=> b!686328 m!650439))

(declare-fun m!650441 () Bool)

(assert (=> b!686328 m!650441))

(assert (=> b!686328 m!650429))

(declare-fun m!650443 () Bool)

(assert (=> b!686328 m!650443))

(declare-fun m!650445 () Bool)

(assert (=> b!686328 m!650445))

(declare-fun m!650447 () Bool)

(assert (=> b!686328 m!650447))

(declare-fun m!650449 () Bool)

(assert (=> b!686328 m!650449))

(declare-fun m!650451 () Bool)

(assert (=> b!686328 m!650451))

(declare-fun m!650453 () Bool)

(assert (=> b!686328 m!650453))

(declare-fun m!650455 () Bool)

(assert (=> b!686341 m!650455))

(declare-fun m!650457 () Bool)

(assert (=> start!61268 m!650457))

(declare-fun m!650459 () Bool)

(assert (=> b!686338 m!650459))

(declare-fun m!650461 () Bool)

(assert (=> b!686326 m!650461))

(assert (=> b!686330 m!650449))

(assert (=> b!686330 m!650429))

(declare-fun m!650463 () Bool)

(assert (=> b!686330 m!650463))

(declare-fun m!650465 () Bool)

(assert (=> b!686330 m!650465))

(assert (=> b!686330 m!650429))

(assert (=> b!686330 m!650463))

(assert (=> b!686330 m!650437))

(assert (=> b!686330 m!650453))

(declare-fun m!650467 () Bool)

(assert (=> b!686332 m!650467))

(declare-fun m!650469 () Bool)

(assert (=> b!686329 m!650469))

(declare-fun m!650471 () Bool)

(assert (=> b!686331 m!650471))

(declare-fun m!650473 () Bool)

(assert (=> b!686337 m!650473))

(assert (=> b!686333 m!650469))

(declare-fun m!650475 () Bool)

(assert (=> b!686327 m!650475))

(declare-fun m!650477 () Bool)

(assert (=> b!686325 m!650477))

(push 1)

