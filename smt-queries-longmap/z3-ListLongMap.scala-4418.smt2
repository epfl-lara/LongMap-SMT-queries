; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61000 () Bool)

(assert start!61000)

(declare-fun res!449995 () Bool)

(declare-fun e!389770 () Bool)

(assert (=> start!61000 (=> (not res!449995) (not e!389770))))

(declare-datatypes ((array!39609 0))(
  ( (array!39610 (arr!18985 (Array (_ BitVec 32) (_ BitVec 64))) (size!19352 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39609)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61000 (= res!449995 (and (bvslt (size!19352 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19352 a!3626))))))

(assert (=> start!61000 e!389770))

(assert (=> start!61000 true))

(declare-fun array_inv!14781 (array!39609) Bool)

(assert (=> start!61000 (array_inv!14781 a!3626)))

(declare-fun b!684426 () Bool)

(declare-fun e!389769 () Bool)

(declare-fun e!389767 () Bool)

(assert (=> b!684426 (= e!389769 e!389767)))

(declare-fun res!449994 () Bool)

(assert (=> b!684426 (=> (not res!449994) (not e!389767))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!684426 (= res!449994 (bvsle from!3004 i!1382))))

(declare-fun b!684427 () Bool)

(declare-fun res!449996 () Bool)

(assert (=> b!684427 (=> (not res!449996) (not e!389770))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684427 (= res!449996 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684428 () Bool)

(declare-fun res!449999 () Bool)

(assert (=> b!684428 (=> (not res!449999) (not e!389770))))

(assert (=> b!684428 (= res!449999 e!389769)))

(declare-fun res!450002 () Bool)

(assert (=> b!684428 (=> res!450002 e!389769)))

(declare-fun e!389771 () Bool)

(assert (=> b!684428 (= res!450002 e!389771)))

(declare-fun res!450007 () Bool)

(assert (=> b!684428 (=> (not res!450007) (not e!389771))))

(assert (=> b!684428 (= res!450007 (bvsgt from!3004 i!1382))))

(declare-fun b!684429 () Bool)

(declare-fun e!389766 () Bool)

(assert (=> b!684429 (= e!389770 (not e!389766))))

(declare-fun res!450008 () Bool)

(assert (=> b!684429 (=> res!450008 e!389766)))

(assert (=> b!684429 (= res!450008 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!13026 0))(
  ( (Nil!13023) (Cons!13022 (h!14067 (_ BitVec 64)) (t!19272 List!13026)) )
))
(declare-fun lt!314321 () List!13026)

(declare-fun acc!681 () List!13026)

(declare-fun -!154 (List!13026 (_ BitVec 64)) List!13026)

(assert (=> b!684429 (= (-!154 lt!314321 k0!2843) acc!681)))

(declare-fun $colon$colon!354 (List!13026 (_ BitVec 64)) List!13026)

(assert (=> b!684429 (= lt!314321 ($colon$colon!354 acc!681 k0!2843))))

(declare-datatypes ((Unit!24092 0))(
  ( (Unit!24093) )
))
(declare-fun lt!314322 () Unit!24092)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13026) Unit!24092)

(assert (=> b!684429 (= lt!314322 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!189 (List!13026 List!13026) Bool)

(assert (=> b!684429 (subseq!189 acc!681 acc!681)))

(declare-fun lt!314318 () Unit!24092)

(declare-fun lemmaListSubSeqRefl!0 (List!13026) Unit!24092)

(assert (=> b!684429 (= lt!314318 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!39609 (_ BitVec 32) List!13026) Bool)

(assert (=> b!684429 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314323 () Unit!24092)

(declare-fun e!389772 () Unit!24092)

(assert (=> b!684429 (= lt!314323 e!389772)))

(declare-fun c!77584 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684429 (= c!77584 (validKeyInArray!0 (select (arr!18985 a!3626) from!3004)))))

(declare-fun lt!314317 () Unit!24092)

(declare-fun e!389768 () Unit!24092)

(assert (=> b!684429 (= lt!314317 e!389768)))

(declare-fun c!77585 () Bool)

(declare-fun lt!314320 () Bool)

(assert (=> b!684429 (= c!77585 lt!314320)))

(assert (=> b!684429 (= lt!314320 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684429 (arrayContainsKey!0 (array!39610 (store (arr!18985 a!3626) i!1382 k0!2843) (size!19352 a!3626)) k0!2843 from!3004)))

(declare-fun b!684430 () Bool)

(assert (=> b!684430 (= e!389766 true)))

(declare-fun lt!314319 () Bool)

(declare-fun contains!3603 (List!13026 (_ BitVec 64)) Bool)

(assert (=> b!684430 (= lt!314319 (contains!3603 acc!681 k0!2843))))

(declare-fun b!684431 () Bool)

(declare-fun res!450006 () Bool)

(assert (=> b!684431 (=> (not res!450006) (not e!389770))))

(assert (=> b!684431 (= res!450006 (validKeyInArray!0 k0!2843))))

(declare-fun b!684432 () Bool)

(declare-fun lt!314325 () Unit!24092)

(assert (=> b!684432 (= e!389772 lt!314325)))

(declare-fun lt!314326 () Unit!24092)

(assert (=> b!684432 (= lt!314326 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684432 (subseq!189 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39609 List!13026 List!13026 (_ BitVec 32)) Unit!24092)

(assert (=> b!684432 (= lt!314325 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!354 acc!681 (select (arr!18985 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684432 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684433 () Bool)

(declare-fun Unit!24094 () Unit!24092)

(assert (=> b!684433 (= e!389768 Unit!24094)))

(declare-fun lt!314324 () Unit!24092)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39609 (_ BitVec 64) (_ BitVec 32)) Unit!24092)

(assert (=> b!684433 (= lt!314324 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!684433 false))

(declare-fun b!684434 () Bool)

(declare-fun res!450001 () Bool)

(assert (=> b!684434 (=> (not res!450001) (not e!389770))))

(assert (=> b!684434 (= res!450001 (not (contains!3603 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684435 () Bool)

(declare-fun res!449998 () Bool)

(assert (=> b!684435 (=> (not res!449998) (not e!389770))))

(declare-fun noDuplicate!850 (List!13026) Bool)

(assert (=> b!684435 (= res!449998 (noDuplicate!850 acc!681))))

(declare-fun b!684436 () Bool)

(declare-fun res!449993 () Bool)

(assert (=> b!684436 (=> (not res!449993) (not e!389770))))

(assert (=> b!684436 (= res!449993 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13023))))

(declare-fun b!684437 () Bool)

(assert (=> b!684437 (= e!389771 (contains!3603 acc!681 k0!2843))))

(declare-fun b!684438 () Bool)

(assert (=> b!684438 (= e!389767 (not (contains!3603 acc!681 k0!2843)))))

(declare-fun b!684439 () Bool)

(declare-fun res!449997 () Bool)

(assert (=> b!684439 (=> res!449997 e!389766)))

(assert (=> b!684439 (= res!449997 (not (noDuplicate!850 lt!314321)))))

(declare-fun b!684440 () Bool)

(declare-fun res!450004 () Bool)

(assert (=> b!684440 (=> (not res!450004) (not e!389770))))

(assert (=> b!684440 (= res!450004 (not (contains!3603 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684441 () Bool)

(declare-fun Unit!24095 () Unit!24092)

(assert (=> b!684441 (= e!389768 Unit!24095)))

(declare-fun b!684442 () Bool)

(declare-fun res!450003 () Bool)

(assert (=> b!684442 (=> (not res!450003) (not e!389770))))

(assert (=> b!684442 (= res!450003 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684443 () Bool)

(declare-fun Unit!24096 () Unit!24092)

(assert (=> b!684443 (= e!389772 Unit!24096)))

(declare-fun b!684444 () Bool)

(declare-fun res!450005 () Bool)

(assert (=> b!684444 (=> (not res!450005) (not e!389770))))

(assert (=> b!684444 (= res!450005 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19352 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684445 () Bool)

(declare-fun res!449992 () Bool)

(assert (=> b!684445 (=> (not res!449992) (not e!389770))))

(assert (=> b!684445 (= res!449992 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19352 a!3626))))))

(declare-fun b!684446 () Bool)

(declare-fun res!450000 () Bool)

(assert (=> b!684446 (=> res!450000 e!389766)))

(assert (=> b!684446 (= res!450000 lt!314320)))

(assert (= (and start!61000 res!449995) b!684435))

(assert (= (and b!684435 res!449998) b!684434))

(assert (= (and b!684434 res!450001) b!684440))

(assert (= (and b!684440 res!450004) b!684428))

(assert (= (and b!684428 res!450007) b!684437))

(assert (= (and b!684428 (not res!450002)) b!684426))

(assert (= (and b!684426 res!449994) b!684438))

(assert (= (and b!684428 res!449999) b!684436))

(assert (= (and b!684436 res!449993) b!684442))

(assert (= (and b!684442 res!450003) b!684445))

(assert (= (and b!684445 res!449992) b!684431))

(assert (= (and b!684431 res!450006) b!684427))

(assert (= (and b!684427 res!449996) b!684444))

(assert (= (and b!684444 res!450005) b!684429))

(assert (= (and b!684429 c!77585) b!684433))

(assert (= (and b!684429 (not c!77585)) b!684441))

(assert (= (and b!684429 c!77584) b!684432))

(assert (= (and b!684429 (not c!77584)) b!684443))

(assert (= (and b!684429 (not res!450008)) b!684439))

(assert (= (and b!684439 (not res!449997)) b!684446))

(assert (= (and b!684446 (not res!450000)) b!684430))

(declare-fun m!648785 () Bool)

(assert (=> b!684432 m!648785))

(declare-fun m!648787 () Bool)

(assert (=> b!684432 m!648787))

(declare-fun m!648789 () Bool)

(assert (=> b!684432 m!648789))

(declare-fun m!648791 () Bool)

(assert (=> b!684432 m!648791))

(assert (=> b!684432 m!648787))

(assert (=> b!684432 m!648789))

(declare-fun m!648793 () Bool)

(assert (=> b!684432 m!648793))

(declare-fun m!648795 () Bool)

(assert (=> b!684432 m!648795))

(declare-fun m!648797 () Bool)

(assert (=> b!684433 m!648797))

(declare-fun m!648799 () Bool)

(assert (=> b!684437 m!648799))

(declare-fun m!648801 () Bool)

(assert (=> b!684436 m!648801))

(assert (=> b!684438 m!648799))

(declare-fun m!648803 () Bool)

(assert (=> b!684434 m!648803))

(declare-fun m!648805 () Bool)

(assert (=> b!684431 m!648805))

(declare-fun m!648807 () Bool)

(assert (=> b!684439 m!648807))

(declare-fun m!648809 () Bool)

(assert (=> b!684435 m!648809))

(declare-fun m!648811 () Bool)

(assert (=> b!684427 m!648811))

(assert (=> b!684430 m!648799))

(declare-fun m!648813 () Bool)

(assert (=> start!61000 m!648813))

(declare-fun m!648815 () Bool)

(assert (=> b!684442 m!648815))

(assert (=> b!684429 m!648785))

(assert (=> b!684429 m!648787))

(declare-fun m!648817 () Bool)

(assert (=> b!684429 m!648817))

(declare-fun m!648819 () Bool)

(assert (=> b!684429 m!648819))

(declare-fun m!648821 () Bool)

(assert (=> b!684429 m!648821))

(assert (=> b!684429 m!648793))

(declare-fun m!648823 () Bool)

(assert (=> b!684429 m!648823))

(declare-fun m!648825 () Bool)

(assert (=> b!684429 m!648825))

(assert (=> b!684429 m!648787))

(declare-fun m!648827 () Bool)

(assert (=> b!684429 m!648827))

(declare-fun m!648829 () Bool)

(assert (=> b!684429 m!648829))

(assert (=> b!684429 m!648795))

(declare-fun m!648831 () Bool)

(assert (=> b!684440 m!648831))

(check-sat (not b!684440) (not b!684429) (not b!684432) (not b!684430) (not b!684436) (not b!684434) (not b!684439) (not b!684433) (not b!684427) (not start!61000) (not b!684437) (not b!684435) (not b!684438) (not b!684431) (not b!684442))
