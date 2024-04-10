; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59940 () Bool)

(assert start!59940)

(declare-fun res!432050 () Bool)

(declare-fun e!381004 () Bool)

(assert (=> start!59940 (=> (not res!432050) (not e!381004))))

(declare-datatypes ((array!38987 0))(
  ( (array!38988 (arr!18686 (Array (_ BitVec 32) (_ BitVec 64))) (size!19050 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38987)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59940 (= res!432050 (and (bvslt (size!19050 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19050 a!3626))))))

(assert (=> start!59940 e!381004))

(assert (=> start!59940 true))

(declare-fun array_inv!14482 (array!38987) Bool)

(assert (=> start!59940 (array_inv!14482 a!3626)))

(declare-fun b!664328 () Bool)

(declare-fun res!432037 () Bool)

(declare-fun e!381005 () Bool)

(assert (=> b!664328 (=> res!432037 e!381005)))

(declare-datatypes ((List!12727 0))(
  ( (Nil!12724) (Cons!12723 (h!13768 (_ BitVec 64)) (t!18955 List!12727)) )
))
(declare-fun acc!681 () List!12727)

(declare-fun lt!309583 () List!12727)

(declare-fun subseq!43 (List!12727 List!12727) Bool)

(assert (=> b!664328 (= res!432037 (not (subseq!43 acc!681 lt!309583)))))

(declare-fun b!664329 () Bool)

(declare-fun res!432051 () Bool)

(assert (=> b!664329 (=> res!432051 e!381005)))

(declare-fun lt!309576 () Bool)

(assert (=> b!664329 (= res!432051 lt!309576)))

(declare-fun b!664330 () Bool)

(assert (=> b!664330 (= e!381004 (not e!381005))))

(declare-fun res!432046 () Bool)

(assert (=> b!664330 (=> res!432046 e!381005)))

(assert (=> b!664330 (= res!432046 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun -!41 (List!12727 (_ BitVec 64)) List!12727)

(assert (=> b!664330 (= (-!41 lt!309583 k!2843) acc!681)))

(declare-fun $colon$colon!175 (List!12727 (_ BitVec 64)) List!12727)

(assert (=> b!664330 (= lt!309583 ($colon$colon!175 acc!681 k!2843))))

(declare-datatypes ((Unit!23155 0))(
  ( (Unit!23156) )
))
(declare-fun lt!309578 () Unit!23155)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12727) Unit!23155)

(assert (=> b!664330 (= lt!309578 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!664330 (subseq!43 acc!681 acc!681)))

(declare-fun lt!309579 () Unit!23155)

(declare-fun lemmaListSubSeqRefl!0 (List!12727) Unit!23155)

(assert (=> b!664330 (= lt!309579 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!38987 (_ BitVec 32) List!12727) Bool)

(assert (=> b!664330 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309577 () Unit!23155)

(declare-fun e!381003 () Unit!23155)

(assert (=> b!664330 (= lt!309577 e!381003)))

(declare-fun c!76513 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664330 (= c!76513 (validKeyInArray!0 (select (arr!18686 a!3626) from!3004)))))

(declare-fun lt!309575 () Unit!23155)

(declare-fun e!381008 () Unit!23155)

(assert (=> b!664330 (= lt!309575 e!381008)))

(declare-fun c!76514 () Bool)

(assert (=> b!664330 (= c!76514 lt!309576)))

(declare-fun arrayContainsKey!0 (array!38987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664330 (= lt!309576 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664330 (arrayContainsKey!0 (array!38988 (store (arr!18686 a!3626) i!1382 k!2843) (size!19050 a!3626)) k!2843 from!3004)))

(declare-fun b!664331 () Bool)

(declare-fun res!432041 () Bool)

(assert (=> b!664331 (=> (not res!432041) (not e!381004))))

(assert (=> b!664331 (= res!432041 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664332 () Bool)

(declare-fun Unit!23157 () Unit!23155)

(assert (=> b!664332 (= e!381008 Unit!23157)))

(declare-fun lt!309580 () Unit!23155)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38987 (_ BitVec 64) (_ BitVec 32)) Unit!23155)

(assert (=> b!664332 (= lt!309580 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!664332 false))

(declare-fun b!664333 () Bool)

(declare-fun e!381007 () Bool)

(declare-fun contains!3304 (List!12727 (_ BitVec 64)) Bool)

(assert (=> b!664333 (= e!381007 (contains!3304 acc!681 k!2843))))

(declare-fun b!664334 () Bool)

(declare-fun res!432047 () Bool)

(assert (=> b!664334 (=> (not res!432047) (not e!381004))))

(assert (=> b!664334 (= res!432047 (not (contains!3304 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664335 () Bool)

(declare-fun res!432048 () Bool)

(assert (=> b!664335 (=> res!432048 e!381005)))

(assert (=> b!664335 (= res!432048 (not (contains!3304 lt!309583 k!2843)))))

(declare-fun b!664336 () Bool)

(assert (=> b!664336 (= e!381005 true)))

(declare-fun lt!309574 () Bool)

(assert (=> b!664336 (= lt!309574 (contains!3304 lt!309583 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664337 () Bool)

(declare-fun res!432049 () Bool)

(assert (=> b!664337 (=> (not res!432049) (not e!381004))))

(declare-fun e!381009 () Bool)

(assert (=> b!664337 (= res!432049 e!381009)))

(declare-fun res!432045 () Bool)

(assert (=> b!664337 (=> res!432045 e!381009)))

(assert (=> b!664337 (= res!432045 e!381007)))

(declare-fun res!432039 () Bool)

(assert (=> b!664337 (=> (not res!432039) (not e!381007))))

(assert (=> b!664337 (= res!432039 (bvsgt from!3004 i!1382))))

(declare-fun b!664338 () Bool)

(declare-fun res!432053 () Bool)

(assert (=> b!664338 (=> (not res!432053) (not e!381004))))

(assert (=> b!664338 (= res!432053 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19050 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664339 () Bool)

(declare-fun Unit!23158 () Unit!23155)

(assert (=> b!664339 (= e!381003 Unit!23158)))

(declare-fun b!664340 () Bool)

(declare-fun res!432055 () Bool)

(assert (=> b!664340 (=> res!432055 e!381005)))

(assert (=> b!664340 (= res!432055 (contains!3304 lt!309583 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664341 () Bool)

(declare-fun res!432036 () Bool)

(assert (=> b!664341 (=> (not res!432036) (not e!381004))))

(assert (=> b!664341 (= res!432036 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664342 () Bool)

(declare-fun e!381002 () Bool)

(assert (=> b!664342 (= e!381002 (not (contains!3304 acc!681 k!2843)))))

(declare-fun b!664343 () Bool)

(declare-fun res!432043 () Bool)

(assert (=> b!664343 (=> (not res!432043) (not e!381004))))

(assert (=> b!664343 (= res!432043 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19050 a!3626))))))

(declare-fun b!664344 () Bool)

(declare-fun res!432044 () Bool)

(assert (=> b!664344 (=> (not res!432044) (not e!381004))))

(assert (=> b!664344 (= res!432044 (validKeyInArray!0 k!2843))))

(declare-fun b!664345 () Bool)

(declare-fun res!432056 () Bool)

(assert (=> b!664345 (=> (not res!432056) (not e!381004))))

(assert (=> b!664345 (= res!432056 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12724))))

(declare-fun b!664346 () Bool)

(declare-fun Unit!23159 () Unit!23155)

(assert (=> b!664346 (= e!381008 Unit!23159)))

(declare-fun b!664347 () Bool)

(assert (=> b!664347 (= e!381009 e!381002)))

(declare-fun res!432054 () Bool)

(assert (=> b!664347 (=> (not res!432054) (not e!381002))))

(assert (=> b!664347 (= res!432054 (bvsle from!3004 i!1382))))

(declare-fun b!664348 () Bool)

(declare-fun res!432052 () Bool)

(assert (=> b!664348 (=> res!432052 e!381005)))

(declare-fun noDuplicate!551 (List!12727) Bool)

(assert (=> b!664348 (= res!432052 (not (noDuplicate!551 lt!309583)))))

(declare-fun b!664349 () Bool)

(declare-fun res!432040 () Bool)

(assert (=> b!664349 (=> res!432040 e!381005)))

(assert (=> b!664349 (= res!432040 (contains!3304 acc!681 k!2843))))

(declare-fun b!664350 () Bool)

(declare-fun res!432038 () Bool)

(assert (=> b!664350 (=> (not res!432038) (not e!381004))))

(assert (=> b!664350 (= res!432038 (noDuplicate!551 acc!681))))

(declare-fun b!664351 () Bool)

(declare-fun res!432042 () Bool)

(assert (=> b!664351 (=> (not res!432042) (not e!381004))))

(assert (=> b!664351 (= res!432042 (not (contains!3304 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664352 () Bool)

(declare-fun lt!309582 () Unit!23155)

(assert (=> b!664352 (= e!381003 lt!309582)))

(declare-fun lt!309581 () Unit!23155)

(assert (=> b!664352 (= lt!309581 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664352 (subseq!43 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38987 List!12727 List!12727 (_ BitVec 32)) Unit!23155)

(assert (=> b!664352 (= lt!309582 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!175 acc!681 (select (arr!18686 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664352 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (= (and start!59940 res!432050) b!664350))

(assert (= (and b!664350 res!432038) b!664351))

(assert (= (and b!664351 res!432042) b!664334))

(assert (= (and b!664334 res!432047) b!664337))

(assert (= (and b!664337 res!432039) b!664333))

(assert (= (and b!664337 (not res!432045)) b!664347))

(assert (= (and b!664347 res!432054) b!664342))

(assert (= (and b!664337 res!432049) b!664345))

(assert (= (and b!664345 res!432056) b!664331))

(assert (= (and b!664331 res!432041) b!664343))

(assert (= (and b!664343 res!432043) b!664344))

(assert (= (and b!664344 res!432044) b!664341))

(assert (= (and b!664341 res!432036) b!664338))

(assert (= (and b!664338 res!432053) b!664330))

(assert (= (and b!664330 c!76514) b!664332))

(assert (= (and b!664330 (not c!76514)) b!664346))

(assert (= (and b!664330 c!76513) b!664352))

(assert (= (and b!664330 (not c!76513)) b!664339))

(assert (= (and b!664330 (not res!432046)) b!664348))

(assert (= (and b!664348 (not res!432052)) b!664329))

(assert (= (and b!664329 (not res!432051)) b!664349))

(assert (= (and b!664349 (not res!432040)) b!664328))

(assert (= (and b!664328 (not res!432037)) b!664335))

(assert (= (and b!664335 (not res!432048)) b!664340))

(assert (= (and b!664340 (not res!432055)) b!664336))

(declare-fun m!635661 () Bool)

(assert (=> b!664350 m!635661))

(declare-fun m!635663 () Bool)

(assert (=> b!664344 m!635663))

(declare-fun m!635665 () Bool)

(assert (=> b!664336 m!635665))

(declare-fun m!635667 () Bool)

(assert (=> b!664334 m!635667))

(declare-fun m!635669 () Bool)

(assert (=> b!664341 m!635669))

(declare-fun m!635671 () Bool)

(assert (=> b!664349 m!635671))

(declare-fun m!635673 () Bool)

(assert (=> b!664335 m!635673))

(declare-fun m!635675 () Bool)

(assert (=> start!59940 m!635675))

(declare-fun m!635677 () Bool)

(assert (=> b!664345 m!635677))

(declare-fun m!635679 () Bool)

(assert (=> b!664331 m!635679))

(assert (=> b!664333 m!635671))

(declare-fun m!635681 () Bool)

(assert (=> b!664340 m!635681))

(declare-fun m!635683 () Bool)

(assert (=> b!664330 m!635683))

(declare-fun m!635685 () Bool)

(assert (=> b!664330 m!635685))

(declare-fun m!635687 () Bool)

(assert (=> b!664330 m!635687))

(declare-fun m!635689 () Bool)

(assert (=> b!664330 m!635689))

(declare-fun m!635691 () Bool)

(assert (=> b!664330 m!635691))

(declare-fun m!635693 () Bool)

(assert (=> b!664330 m!635693))

(assert (=> b!664330 m!635685))

(declare-fun m!635695 () Bool)

(assert (=> b!664330 m!635695))

(declare-fun m!635697 () Bool)

(assert (=> b!664330 m!635697))

(declare-fun m!635699 () Bool)

(assert (=> b!664330 m!635699))

(declare-fun m!635701 () Bool)

(assert (=> b!664330 m!635701))

(declare-fun m!635703 () Bool)

(assert (=> b!664330 m!635703))

(declare-fun m!635705 () Bool)

(assert (=> b!664351 m!635705))

(declare-fun m!635707 () Bool)

(assert (=> b!664328 m!635707))

(declare-fun m!635709 () Bool)

(assert (=> b!664332 m!635709))

(assert (=> b!664342 m!635671))

(assert (=> b!664352 m!635683))

(assert (=> b!664352 m!635685))

(declare-fun m!635711 () Bool)

(assert (=> b!664352 m!635711))

(declare-fun m!635713 () Bool)

(assert (=> b!664352 m!635713))

(assert (=> b!664352 m!635685))

(assert (=> b!664352 m!635711))

(assert (=> b!664352 m!635689))

(assert (=> b!664352 m!635703))

(declare-fun m!635715 () Bool)

(assert (=> b!664348 m!635715))

(push 1)

(assert (not b!664342))

(assert (not b!664345))

(assert (not b!664341))

(assert (not b!664350))

(assert (not b!664348))

(assert (not b!664352))

(assert (not b!664331))

(assert (not b!664333))

(assert (not start!59940))

(assert (not b!664344))

(assert (not b!664351))

(assert (not b!664332))

(assert (not b!664334))

(assert (not b!664340))

(assert (not b!664328))

(assert (not b!664349))

(assert (not b!664336))

(assert (not b!664335))

(assert (not b!664330))

(check-sat)

