; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59964 () Bool)

(assert start!59964)

(declare-fun b!663578 () Bool)

(declare-fun res!431388 () Bool)

(declare-fun e!380779 () Bool)

(assert (=> b!663578 (=> (not res!431388) (not e!380779))))

(declare-datatypes ((List!12612 0))(
  ( (Nil!12609) (Cons!12608 (h!13656 (_ BitVec 64)) (t!18832 List!12612)) )
))
(declare-fun acc!681 () List!12612)

(declare-fun contains!3264 (List!12612 (_ BitVec 64)) Bool)

(assert (=> b!663578 (= res!431388 (not (contains!3264 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663579 () Bool)

(declare-fun res!431389 () Bool)

(assert (=> b!663579 (=> (not res!431389) (not e!380779))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38949 0))(
  ( (array!38950 (arr!18664 (Array (_ BitVec 32) (_ BitVec 64))) (size!19028 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38949)

(assert (=> b!663579 (= res!431389 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19028 a!3626))))))

(declare-fun b!663580 () Bool)

(declare-fun e!380783 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!663580 (= e!380783 (contains!3264 acc!681 k0!2843))))

(declare-fun b!663581 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!663581 (= e!380779 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!23049 0))(
  ( (Unit!23050) )
))
(declare-fun lt!309364 () Unit!23049)

(declare-fun e!380780 () Unit!23049)

(assert (=> b!663581 (= lt!309364 e!380780)))

(declare-fun c!76468 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663581 (= c!76468 (validKeyInArray!0 (select (arr!18664 a!3626) from!3004)))))

(declare-fun lt!309366 () Unit!23049)

(declare-fun e!380781 () Unit!23049)

(assert (=> b!663581 (= lt!309366 e!380781)))

(declare-fun c!76469 () Bool)

(declare-fun arrayContainsKey!0 (array!38949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663581 (= c!76469 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663581 (arrayContainsKey!0 (array!38950 (store (arr!18664 a!3626) i!1382 k0!2843) (size!19028 a!3626)) k0!2843 from!3004)))

(declare-fun b!663582 () Bool)

(declare-fun lt!309367 () Unit!23049)

(assert (=> b!663582 (= e!380780 lt!309367)))

(declare-fun lt!309365 () Unit!23049)

(declare-fun lemmaListSubSeqRefl!0 (List!12612) Unit!23049)

(assert (=> b!663582 (= lt!309365 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!26 (List!12612 List!12612) Bool)

(assert (=> b!663582 (subseq!26 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38949 List!12612 List!12612 (_ BitVec 32)) Unit!23049)

(declare-fun $colon$colon!155 (List!12612 (_ BitVec 64)) List!12612)

(assert (=> b!663582 (= lt!309367 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!155 acc!681 (select (arr!18664 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!38949 (_ BitVec 32) List!12612) Bool)

(assert (=> b!663582 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!663583 () Bool)

(declare-fun res!431386 () Bool)

(assert (=> b!663583 (=> (not res!431386) (not e!380779))))

(assert (=> b!663583 (= res!431386 (not (contains!3264 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!431392 () Bool)

(assert (=> start!59964 (=> (not res!431392) (not e!380779))))

(assert (=> start!59964 (= res!431392 (and (bvslt (size!19028 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19028 a!3626))))))

(assert (=> start!59964 e!380779))

(assert (=> start!59964 true))

(declare-fun array_inv!14523 (array!38949) Bool)

(assert (=> start!59964 (array_inv!14523 a!3626)))

(declare-fun b!663584 () Bool)

(declare-fun res!431380 () Bool)

(assert (=> b!663584 (=> (not res!431380) (not e!380779))))

(assert (=> b!663584 (= res!431380 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663585 () Bool)

(declare-fun res!431382 () Bool)

(assert (=> b!663585 (=> (not res!431382) (not e!380779))))

(assert (=> b!663585 (= res!431382 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12609))))

(declare-fun b!663586 () Bool)

(declare-fun Unit!23051 () Unit!23049)

(assert (=> b!663586 (= e!380780 Unit!23051)))

(declare-fun b!663587 () Bool)

(declare-fun res!431385 () Bool)

(assert (=> b!663587 (=> (not res!431385) (not e!380779))))

(assert (=> b!663587 (= res!431385 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19028 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663588 () Bool)

(declare-fun e!380784 () Bool)

(assert (=> b!663588 (= e!380784 (not (contains!3264 acc!681 k0!2843)))))

(declare-fun b!663589 () Bool)

(declare-fun res!431379 () Bool)

(assert (=> b!663589 (=> (not res!431379) (not e!380779))))

(declare-fun noDuplicate!538 (List!12612) Bool)

(assert (=> b!663589 (= res!431379 (noDuplicate!538 acc!681))))

(declare-fun b!663590 () Bool)

(declare-fun Unit!23052 () Unit!23049)

(assert (=> b!663590 (= e!380781 Unit!23052)))

(declare-fun b!663591 () Bool)

(declare-fun res!431387 () Bool)

(assert (=> b!663591 (=> (not res!431387) (not e!380779))))

(assert (=> b!663591 (= res!431387 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663592 () Bool)

(declare-fun res!431381 () Bool)

(assert (=> b!663592 (=> (not res!431381) (not e!380779))))

(assert (=> b!663592 (= res!431381 (validKeyInArray!0 k0!2843))))

(declare-fun b!663593 () Bool)

(declare-fun Unit!23053 () Unit!23049)

(assert (=> b!663593 (= e!380781 Unit!23053)))

(declare-fun lt!309363 () Unit!23049)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38949 (_ BitVec 64) (_ BitVec 32)) Unit!23049)

(assert (=> b!663593 (= lt!309363 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!663593 false))

(declare-fun b!663594 () Bool)

(declare-fun e!380782 () Bool)

(assert (=> b!663594 (= e!380782 e!380784)))

(declare-fun res!431383 () Bool)

(assert (=> b!663594 (=> (not res!431383) (not e!380784))))

(assert (=> b!663594 (= res!431383 (bvsle from!3004 i!1382))))

(declare-fun b!663595 () Bool)

(declare-fun res!431384 () Bool)

(assert (=> b!663595 (=> (not res!431384) (not e!380779))))

(assert (=> b!663595 (= res!431384 e!380782)))

(declare-fun res!431391 () Bool)

(assert (=> b!663595 (=> res!431391 e!380782)))

(assert (=> b!663595 (= res!431391 e!380783)))

(declare-fun res!431390 () Bool)

(assert (=> b!663595 (=> (not res!431390) (not e!380783))))

(assert (=> b!663595 (= res!431390 (bvsgt from!3004 i!1382))))

(assert (= (and start!59964 res!431392) b!663589))

(assert (= (and b!663589 res!431379) b!663578))

(assert (= (and b!663578 res!431388) b!663583))

(assert (= (and b!663583 res!431386) b!663595))

(assert (= (and b!663595 res!431390) b!663580))

(assert (= (and b!663595 (not res!431391)) b!663594))

(assert (= (and b!663594 res!431383) b!663588))

(assert (= (and b!663595 res!431384) b!663585))

(assert (= (and b!663585 res!431382) b!663584))

(assert (= (and b!663584 res!431380) b!663579))

(assert (= (and b!663579 res!431389) b!663592))

(assert (= (and b!663592 res!431381) b!663591))

(assert (= (and b!663591 res!431387) b!663587))

(assert (= (and b!663587 res!431385) b!663581))

(assert (= (and b!663581 c!76469) b!663593))

(assert (= (and b!663581 (not c!76469)) b!663590))

(assert (= (and b!663581 c!76468) b!663582))

(assert (= (and b!663581 (not c!76468)) b!663586))

(declare-fun m!635647 () Bool)

(assert (=> b!663588 m!635647))

(declare-fun m!635649 () Bool)

(assert (=> b!663592 m!635649))

(declare-fun m!635651 () Bool)

(assert (=> b!663582 m!635651))

(declare-fun m!635653 () Bool)

(assert (=> b!663582 m!635653))

(declare-fun m!635655 () Bool)

(assert (=> b!663582 m!635655))

(declare-fun m!635657 () Bool)

(assert (=> b!663582 m!635657))

(assert (=> b!663582 m!635653))

(assert (=> b!663582 m!635655))

(declare-fun m!635659 () Bool)

(assert (=> b!663582 m!635659))

(declare-fun m!635661 () Bool)

(assert (=> b!663582 m!635661))

(declare-fun m!635663 () Bool)

(assert (=> start!59964 m!635663))

(assert (=> b!663580 m!635647))

(declare-fun m!635665 () Bool)

(assert (=> b!663585 m!635665))

(declare-fun m!635667 () Bool)

(assert (=> b!663583 m!635667))

(declare-fun m!635669 () Bool)

(assert (=> b!663591 m!635669))

(assert (=> b!663581 m!635653))

(declare-fun m!635671 () Bool)

(assert (=> b!663581 m!635671))

(declare-fun m!635673 () Bool)

(assert (=> b!663581 m!635673))

(assert (=> b!663581 m!635653))

(declare-fun m!635675 () Bool)

(assert (=> b!663581 m!635675))

(declare-fun m!635677 () Bool)

(assert (=> b!663581 m!635677))

(declare-fun m!635679 () Bool)

(assert (=> b!663593 m!635679))

(declare-fun m!635681 () Bool)

(assert (=> b!663589 m!635681))

(declare-fun m!635683 () Bool)

(assert (=> b!663578 m!635683))

(declare-fun m!635685 () Bool)

(assert (=> b!663584 m!635685))

(check-sat (not b!663582) (not start!59964) (not b!663580) (not b!663589) (not b!663593) (not b!663578) (not b!663588) (not b!663592) (not b!663591) (not b!663583) (not b!663584) (not b!663585) (not b!663581))
(check-sat)
