; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59998 () Bool)

(assert start!59998)

(declare-fun b!666503 () Bool)

(declare-fun res!433874 () Bool)

(declare-fun e!381700 () Bool)

(assert (=> b!666503 (=> (not res!433874) (not e!381700))))

(declare-datatypes ((array!39045 0))(
  ( (array!39046 (arr!18715 (Array (_ BitVec 32) (_ BitVec 64))) (size!19079 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39045)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666503 (= res!433874 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666504 () Bool)

(declare-fun e!381705 () Bool)

(declare-fun e!381699 () Bool)

(assert (=> b!666504 (= e!381705 e!381699)))

(declare-fun res!433872 () Bool)

(assert (=> b!666504 (=> (not res!433872) (not e!381699))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666504 (= res!433872 (bvsle from!3004 i!1382))))

(declare-fun b!666505 () Bool)

(declare-fun res!433868 () Bool)

(declare-fun e!381703 () Bool)

(assert (=> b!666505 (=> res!433868 e!381703)))

(declare-datatypes ((List!12756 0))(
  ( (Nil!12753) (Cons!12752 (h!13797 (_ BitVec 64)) (t!18984 List!12756)) )
))
(declare-fun acc!681 () List!12756)

(declare-fun lt!310451 () List!12756)

(declare-fun subseq!72 (List!12756 List!12756) Bool)

(assert (=> b!666505 (= res!433868 (not (subseq!72 acc!681 lt!310451)))))

(declare-fun b!666506 () Bool)

(declare-fun res!433864 () Bool)

(assert (=> b!666506 (=> (not res!433864) (not e!381700))))

(assert (=> b!666506 (= res!433864 e!381705)))

(declare-fun res!433883 () Bool)

(assert (=> b!666506 (=> res!433883 e!381705)))

(declare-fun e!381701 () Bool)

(assert (=> b!666506 (= res!433883 e!381701)))

(declare-fun res!433877 () Bool)

(assert (=> b!666506 (=> (not res!433877) (not e!381701))))

(assert (=> b!666506 (= res!433877 (bvsgt from!3004 i!1382))))

(declare-fun b!666507 () Bool)

(declare-fun res!433876 () Bool)

(assert (=> b!666507 (=> res!433876 e!381703)))

(declare-fun contains!3333 (List!12756 (_ BitVec 64)) Bool)

(assert (=> b!666507 (= res!433876 (contains!3333 lt!310451 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666508 () Bool)

(declare-fun res!433873 () Bool)

(assert (=> b!666508 (=> (not res!433873) (not e!381700))))

(assert (=> b!666508 (= res!433873 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19079 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666509 () Bool)

(declare-fun res!433867 () Bool)

(assert (=> b!666509 (=> (not res!433867) (not e!381700))))

(declare-fun noDuplicate!580 (List!12756) Bool)

(assert (=> b!666509 (= res!433867 (noDuplicate!580 acc!681))))

(declare-fun b!666510 () Bool)

(declare-fun res!433882 () Bool)

(assert (=> b!666510 (=> (not res!433882) (not e!381700))))

(assert (=> b!666510 (= res!433882 (not (contains!3333 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666511 () Bool)

(assert (=> b!666511 (= e!381703 true)))

(declare-fun lt!310445 () Bool)

(assert (=> b!666511 (= lt!310445 (contains!3333 lt!310451 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666512 () Bool)

(declare-fun res!433878 () Bool)

(assert (=> b!666512 (=> (not res!433878) (not e!381700))))

(declare-fun arrayNoDuplicates!0 (array!39045 (_ BitVec 32) List!12756) Bool)

(assert (=> b!666512 (= res!433878 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666513 () Bool)

(declare-datatypes ((Unit!23300 0))(
  ( (Unit!23301) )
))
(declare-fun e!381698 () Unit!23300)

(declare-fun Unit!23302 () Unit!23300)

(assert (=> b!666513 (= e!381698 Unit!23302)))

(declare-fun b!666514 () Bool)

(declare-fun res!433880 () Bool)

(assert (=> b!666514 (=> (not res!433880) (not e!381700))))

(assert (=> b!666514 (= res!433880 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19079 a!3626))))))

(declare-fun res!433875 () Bool)

(assert (=> start!59998 (=> (not res!433875) (not e!381700))))

(assert (=> start!59998 (= res!433875 (and (bvslt (size!19079 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19079 a!3626))))))

(assert (=> start!59998 e!381700))

(assert (=> start!59998 true))

(declare-fun array_inv!14511 (array!39045) Bool)

(assert (=> start!59998 (array_inv!14511 a!3626)))

(declare-fun b!666515 () Bool)

(declare-fun e!381704 () Unit!23300)

(declare-fun Unit!23303 () Unit!23300)

(assert (=> b!666515 (= e!381704 Unit!23303)))

(declare-fun b!666516 () Bool)

(assert (=> b!666516 (= e!381700 (not e!381703))))

(declare-fun res!433866 () Bool)

(assert (=> b!666516 (=> res!433866 e!381703)))

(assert (=> b!666516 (= res!433866 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!70 (List!12756 (_ BitVec 64)) List!12756)

(assert (=> b!666516 (= (-!70 lt!310451 k0!2843) acc!681)))

(declare-fun $colon$colon!204 (List!12756 (_ BitVec 64)) List!12756)

(assert (=> b!666516 (= lt!310451 ($colon$colon!204 acc!681 k0!2843))))

(declare-fun lt!310447 () Unit!23300)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12756) Unit!23300)

(assert (=> b!666516 (= lt!310447 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!666516 (subseq!72 acc!681 acc!681)))

(declare-fun lt!310452 () Unit!23300)

(declare-fun lemmaListSubSeqRefl!0 (List!12756) Unit!23300)

(assert (=> b!666516 (= lt!310452 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666516 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310453 () Unit!23300)

(assert (=> b!666516 (= lt!310453 e!381698)))

(declare-fun c!76687 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666516 (= c!76687 (validKeyInArray!0 (select (arr!18715 a!3626) from!3004)))))

(declare-fun lt!310449 () Unit!23300)

(assert (=> b!666516 (= lt!310449 e!381704)))

(declare-fun c!76688 () Bool)

(declare-fun lt!310450 () Bool)

(assert (=> b!666516 (= c!76688 lt!310450)))

(assert (=> b!666516 (= lt!310450 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666516 (arrayContainsKey!0 (array!39046 (store (arr!18715 a!3626) i!1382 k0!2843) (size!19079 a!3626)) k0!2843 from!3004)))

(declare-fun b!666517 () Bool)

(assert (=> b!666517 (= e!381701 (contains!3333 acc!681 k0!2843))))

(declare-fun b!666518 () Bool)

(declare-fun res!433870 () Bool)

(assert (=> b!666518 (=> (not res!433870) (not e!381700))))

(assert (=> b!666518 (= res!433870 (validKeyInArray!0 k0!2843))))

(declare-fun b!666519 () Bool)

(declare-fun res!433869 () Bool)

(assert (=> b!666519 (=> res!433869 e!381703)))

(assert (=> b!666519 (= res!433869 (not (noDuplicate!580 lt!310451)))))

(declare-fun b!666520 () Bool)

(assert (=> b!666520 (= e!381699 (not (contains!3333 acc!681 k0!2843)))))

(declare-fun b!666521 () Bool)

(declare-fun Unit!23304 () Unit!23300)

(assert (=> b!666521 (= e!381704 Unit!23304)))

(declare-fun lt!310448 () Unit!23300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39045 (_ BitVec 64) (_ BitVec 32)) Unit!23300)

(assert (=> b!666521 (= lt!310448 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!666521 false))

(declare-fun b!666522 () Bool)

(declare-fun res!433871 () Bool)

(assert (=> b!666522 (=> res!433871 e!381703)))

(assert (=> b!666522 (= res!433871 (contains!3333 acc!681 k0!2843))))

(declare-fun b!666523 () Bool)

(declare-fun res!433879 () Bool)

(assert (=> b!666523 (=> (not res!433879) (not e!381700))))

(assert (=> b!666523 (= res!433879 (not (contains!3333 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666524 () Bool)

(declare-fun res!433865 () Bool)

(assert (=> b!666524 (=> res!433865 e!381703)))

(assert (=> b!666524 (= res!433865 (not (contains!3333 lt!310451 k0!2843)))))

(declare-fun b!666525 () Bool)

(declare-fun res!433881 () Bool)

(assert (=> b!666525 (=> (not res!433881) (not e!381700))))

(assert (=> b!666525 (= res!433881 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12753))))

(declare-fun b!666526 () Bool)

(declare-fun lt!310444 () Unit!23300)

(assert (=> b!666526 (= e!381698 lt!310444)))

(declare-fun lt!310446 () Unit!23300)

(assert (=> b!666526 (= lt!310446 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666526 (subseq!72 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39045 List!12756 List!12756 (_ BitVec 32)) Unit!23300)

(assert (=> b!666526 (= lt!310444 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!204 acc!681 (select (arr!18715 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666526 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666527 () Bool)

(declare-fun res!433863 () Bool)

(assert (=> b!666527 (=> res!433863 e!381703)))

(assert (=> b!666527 (= res!433863 lt!310450)))

(assert (= (and start!59998 res!433875) b!666509))

(assert (= (and b!666509 res!433867) b!666510))

(assert (= (and b!666510 res!433882) b!666523))

(assert (= (and b!666523 res!433879) b!666506))

(assert (= (and b!666506 res!433877) b!666517))

(assert (= (and b!666506 (not res!433883)) b!666504))

(assert (= (and b!666504 res!433872) b!666520))

(assert (= (and b!666506 res!433864) b!666525))

(assert (= (and b!666525 res!433881) b!666512))

(assert (= (and b!666512 res!433878) b!666514))

(assert (= (and b!666514 res!433880) b!666518))

(assert (= (and b!666518 res!433870) b!666503))

(assert (= (and b!666503 res!433874) b!666508))

(assert (= (and b!666508 res!433873) b!666516))

(assert (= (and b!666516 c!76688) b!666521))

(assert (= (and b!666516 (not c!76688)) b!666515))

(assert (= (and b!666516 c!76687) b!666526))

(assert (= (and b!666516 (not c!76687)) b!666513))

(assert (= (and b!666516 (not res!433866)) b!666519))

(assert (= (and b!666519 (not res!433869)) b!666527))

(assert (= (and b!666527 (not res!433863)) b!666522))

(assert (= (and b!666522 (not res!433871)) b!666505))

(assert (= (and b!666505 (not res!433868)) b!666524))

(assert (= (and b!666524 (not res!433865)) b!666507))

(assert (= (and b!666507 (not res!433876)) b!666511))

(declare-fun m!637285 () Bool)

(assert (=> b!666511 m!637285))

(declare-fun m!637287 () Bool)

(assert (=> b!666503 m!637287))

(declare-fun m!637289 () Bool)

(assert (=> b!666524 m!637289))

(declare-fun m!637291 () Bool)

(assert (=> b!666520 m!637291))

(declare-fun m!637293 () Bool)

(assert (=> b!666518 m!637293))

(declare-fun m!637295 () Bool)

(assert (=> start!59998 m!637295))

(declare-fun m!637297 () Bool)

(assert (=> b!666516 m!637297))

(declare-fun m!637299 () Bool)

(assert (=> b!666516 m!637299))

(declare-fun m!637301 () Bool)

(assert (=> b!666516 m!637301))

(declare-fun m!637303 () Bool)

(assert (=> b!666516 m!637303))

(declare-fun m!637305 () Bool)

(assert (=> b!666516 m!637305))

(declare-fun m!637307 () Bool)

(assert (=> b!666516 m!637307))

(declare-fun m!637309 () Bool)

(assert (=> b!666516 m!637309))

(declare-fun m!637311 () Bool)

(assert (=> b!666516 m!637311))

(assert (=> b!666516 m!637301))

(declare-fun m!637313 () Bool)

(assert (=> b!666516 m!637313))

(declare-fun m!637315 () Bool)

(assert (=> b!666516 m!637315))

(declare-fun m!637317 () Bool)

(assert (=> b!666516 m!637317))

(declare-fun m!637319 () Bool)

(assert (=> b!666525 m!637319))

(assert (=> b!666522 m!637291))

(declare-fun m!637321 () Bool)

(assert (=> b!666512 m!637321))

(declare-fun m!637323 () Bool)

(assert (=> b!666519 m!637323))

(assert (=> b!666517 m!637291))

(declare-fun m!637325 () Bool)

(assert (=> b!666510 m!637325))

(assert (=> b!666526 m!637299))

(assert (=> b!666526 m!637301))

(declare-fun m!637327 () Bool)

(assert (=> b!666526 m!637327))

(declare-fun m!637329 () Bool)

(assert (=> b!666526 m!637329))

(assert (=> b!666526 m!637301))

(assert (=> b!666526 m!637327))

(assert (=> b!666526 m!637307))

(assert (=> b!666526 m!637317))

(declare-fun m!637331 () Bool)

(assert (=> b!666505 m!637331))

(declare-fun m!637333 () Bool)

(assert (=> b!666521 m!637333))

(declare-fun m!637335 () Bool)

(assert (=> b!666509 m!637335))

(declare-fun m!637337 () Bool)

(assert (=> b!666523 m!637337))

(declare-fun m!637339 () Bool)

(assert (=> b!666507 m!637339))

(check-sat (not b!666521) (not b!666511) (not b!666512) (not b!666525) (not b!666526) (not b!666517) (not b!666507) (not b!666516) (not b!666519) (not start!59998) (not b!666518) (not b!666524) (not b!666510) (not b!666503) (not b!666505) (not b!666522) (not b!666509) (not b!666523) (not b!666520))
(check-sat)
