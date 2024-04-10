; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59950 () Bool)

(assert start!59950)

(declare-fun b!664703 () Bool)

(declare-fun e!381124 () Bool)

(declare-fun e!381128 () Bool)

(assert (=> b!664703 (= e!381124 e!381128)))

(declare-fun res!432358 () Bool)

(assert (=> b!664703 (=> (not res!432358) (not e!381128))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664703 (= res!432358 (bvsle from!3004 i!1382))))

(declare-fun res!432360 () Bool)

(declare-fun e!381127 () Bool)

(assert (=> start!59950 (=> (not res!432360) (not e!381127))))

(declare-datatypes ((array!38997 0))(
  ( (array!38998 (arr!18691 (Array (_ BitVec 32) (_ BitVec 64))) (size!19055 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38997)

(assert (=> start!59950 (= res!432360 (and (bvslt (size!19055 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19055 a!3626))))))

(assert (=> start!59950 e!381127))

(assert (=> start!59950 true))

(declare-fun array_inv!14487 (array!38997) Bool)

(assert (=> start!59950 (array_inv!14487 a!3626)))

(declare-fun b!664704 () Bool)

(declare-fun res!432351 () Bool)

(declare-fun e!381129 () Bool)

(assert (=> b!664704 (=> res!432351 e!381129)))

(declare-datatypes ((List!12732 0))(
  ( (Nil!12729) (Cons!12728 (h!13773 (_ BitVec 64)) (t!18960 List!12732)) )
))
(declare-fun lt!309730 () List!12732)

(declare-fun noDuplicate!556 (List!12732) Bool)

(assert (=> b!664704 (= res!432351 (not (noDuplicate!556 lt!309730)))))

(declare-fun b!664705 () Bool)

(assert (=> b!664705 (= e!381129 true)))

(declare-fun lt!309732 () Bool)

(declare-fun contains!3309 (List!12732 (_ BitVec 64)) Bool)

(assert (=> b!664705 (= lt!309732 (contains!3309 lt!309730 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664706 () Bool)

(declare-fun res!432371 () Bool)

(assert (=> b!664706 (=> (not res!432371) (not e!381127))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664706 (= res!432371 (validKeyInArray!0 k0!2843))))

(declare-fun b!664707 () Bool)

(assert (=> b!664707 (= e!381127 (not e!381129))))

(declare-fun res!432364 () Bool)

(assert (=> b!664707 (=> res!432364 e!381129)))

(assert (=> b!664707 (= res!432364 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun acc!681 () List!12732)

(declare-fun -!46 (List!12732 (_ BitVec 64)) List!12732)

(assert (=> b!664707 (= (-!46 lt!309730 k0!2843) acc!681)))

(declare-fun $colon$colon!180 (List!12732 (_ BitVec 64)) List!12732)

(assert (=> b!664707 (= lt!309730 ($colon$colon!180 acc!681 k0!2843))))

(declare-datatypes ((Unit!23180 0))(
  ( (Unit!23181) )
))
(declare-fun lt!309733 () Unit!23180)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12732) Unit!23180)

(assert (=> b!664707 (= lt!309733 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!48 (List!12732 List!12732) Bool)

(assert (=> b!664707 (subseq!48 acc!681 acc!681)))

(declare-fun lt!309728 () Unit!23180)

(declare-fun lemmaListSubSeqRefl!0 (List!12732) Unit!23180)

(assert (=> b!664707 (= lt!309728 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!38997 (_ BitVec 32) List!12732) Bool)

(assert (=> b!664707 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309725 () Unit!23180)

(declare-fun e!381123 () Unit!23180)

(assert (=> b!664707 (= lt!309725 e!381123)))

(declare-fun c!76544 () Bool)

(assert (=> b!664707 (= c!76544 (validKeyInArray!0 (select (arr!18691 a!3626) from!3004)))))

(declare-fun lt!309724 () Unit!23180)

(declare-fun e!381125 () Unit!23180)

(assert (=> b!664707 (= lt!309724 e!381125)))

(declare-fun c!76543 () Bool)

(declare-fun lt!309731 () Bool)

(assert (=> b!664707 (= c!76543 lt!309731)))

(declare-fun arrayContainsKey!0 (array!38997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664707 (= lt!309731 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664707 (arrayContainsKey!0 (array!38998 (store (arr!18691 a!3626) i!1382 k0!2843) (size!19055 a!3626)) k0!2843 from!3004)))

(declare-fun b!664708 () Bool)

(declare-fun res!432365 () Bool)

(assert (=> b!664708 (=> (not res!432365) (not e!381127))))

(assert (=> b!664708 (= res!432365 (not (contains!3309 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664709 () Bool)

(declare-fun res!432369 () Bool)

(assert (=> b!664709 (=> (not res!432369) (not e!381127))))

(assert (=> b!664709 (= res!432369 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19055 a!3626))))))

(declare-fun b!664710 () Bool)

(declare-fun lt!309726 () Unit!23180)

(assert (=> b!664710 (= e!381123 lt!309726)))

(declare-fun lt!309727 () Unit!23180)

(assert (=> b!664710 (= lt!309727 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664710 (subseq!48 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38997 List!12732 List!12732 (_ BitVec 32)) Unit!23180)

(assert (=> b!664710 (= lt!309726 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!180 acc!681 (select (arr!18691 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664710 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664711 () Bool)

(declare-fun e!381126 () Bool)

(assert (=> b!664711 (= e!381126 (contains!3309 acc!681 k0!2843))))

(declare-fun b!664712 () Bool)

(declare-fun res!432363 () Bool)

(assert (=> b!664712 (=> (not res!432363) (not e!381127))))

(assert (=> b!664712 (= res!432363 (noDuplicate!556 acc!681))))

(declare-fun b!664713 () Bool)

(assert (=> b!664713 (= e!381128 (not (contains!3309 acc!681 k0!2843)))))

(declare-fun b!664714 () Bool)

(declare-fun res!432367 () Bool)

(assert (=> b!664714 (=> res!432367 e!381129)))

(assert (=> b!664714 (= res!432367 (not (contains!3309 lt!309730 k0!2843)))))

(declare-fun b!664715 () Bool)

(declare-fun res!432359 () Bool)

(assert (=> b!664715 (=> res!432359 e!381129)))

(assert (=> b!664715 (= res!432359 (contains!3309 acc!681 k0!2843))))

(declare-fun b!664716 () Bool)

(declare-fun res!432353 () Bool)

(assert (=> b!664716 (=> res!432353 e!381129)))

(assert (=> b!664716 (= res!432353 (contains!3309 lt!309730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664717 () Bool)

(declare-fun res!432368 () Bool)

(assert (=> b!664717 (=> (not res!432368) (not e!381127))))

(assert (=> b!664717 (= res!432368 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19055 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664718 () Bool)

(declare-fun Unit!23182 () Unit!23180)

(assert (=> b!664718 (= e!381123 Unit!23182)))

(declare-fun b!664719 () Bool)

(declare-fun res!432355 () Bool)

(assert (=> b!664719 (=> (not res!432355) (not e!381127))))

(assert (=> b!664719 (= res!432355 (not (contains!3309 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664720 () Bool)

(declare-fun res!432357 () Bool)

(assert (=> b!664720 (=> (not res!432357) (not e!381127))))

(assert (=> b!664720 (= res!432357 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12729))))

(declare-fun b!664721 () Bool)

(declare-fun res!432352 () Bool)

(assert (=> b!664721 (=> (not res!432352) (not e!381127))))

(assert (=> b!664721 (= res!432352 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664722 () Bool)

(declare-fun res!432354 () Bool)

(assert (=> b!664722 (=> (not res!432354) (not e!381127))))

(assert (=> b!664722 (= res!432354 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664723 () Bool)

(declare-fun Unit!23183 () Unit!23180)

(assert (=> b!664723 (= e!381125 Unit!23183)))

(declare-fun b!664724 () Bool)

(declare-fun Unit!23184 () Unit!23180)

(assert (=> b!664724 (= e!381125 Unit!23184)))

(declare-fun lt!309729 () Unit!23180)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38997 (_ BitVec 64) (_ BitVec 32)) Unit!23180)

(assert (=> b!664724 (= lt!309729 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!664724 false))

(declare-fun b!664725 () Bool)

(declare-fun res!432362 () Bool)

(assert (=> b!664725 (=> (not res!432362) (not e!381127))))

(assert (=> b!664725 (= res!432362 e!381124)))

(declare-fun res!432361 () Bool)

(assert (=> b!664725 (=> res!432361 e!381124)))

(assert (=> b!664725 (= res!432361 e!381126)))

(declare-fun res!432356 () Bool)

(assert (=> b!664725 (=> (not res!432356) (not e!381126))))

(assert (=> b!664725 (= res!432356 (bvsgt from!3004 i!1382))))

(declare-fun b!664726 () Bool)

(declare-fun res!432366 () Bool)

(assert (=> b!664726 (=> res!432366 e!381129)))

(assert (=> b!664726 (= res!432366 lt!309731)))

(declare-fun b!664727 () Bool)

(declare-fun res!432370 () Bool)

(assert (=> b!664727 (=> res!432370 e!381129)))

(assert (=> b!664727 (= res!432370 (not (subseq!48 acc!681 lt!309730)))))

(assert (= (and start!59950 res!432360) b!664712))

(assert (= (and b!664712 res!432363) b!664719))

(assert (= (and b!664719 res!432355) b!664708))

(assert (= (and b!664708 res!432365) b!664725))

(assert (= (and b!664725 res!432356) b!664711))

(assert (= (and b!664725 (not res!432361)) b!664703))

(assert (= (and b!664703 res!432358) b!664713))

(assert (= (and b!664725 res!432362) b!664720))

(assert (= (and b!664720 res!432357) b!664722))

(assert (= (and b!664722 res!432354) b!664709))

(assert (= (and b!664709 res!432369) b!664706))

(assert (= (and b!664706 res!432371) b!664721))

(assert (= (and b!664721 res!432352) b!664717))

(assert (= (and b!664717 res!432368) b!664707))

(assert (= (and b!664707 c!76543) b!664724))

(assert (= (and b!664707 (not c!76543)) b!664723))

(assert (= (and b!664707 c!76544) b!664710))

(assert (= (and b!664707 (not c!76544)) b!664718))

(assert (= (and b!664707 (not res!432364)) b!664704))

(assert (= (and b!664704 (not res!432351)) b!664726))

(assert (= (and b!664726 (not res!432366)) b!664715))

(assert (= (and b!664715 (not res!432359)) b!664727))

(assert (= (and b!664727 (not res!432370)) b!664714))

(assert (= (and b!664714 (not res!432367)) b!664716))

(assert (= (and b!664716 (not res!432353)) b!664705))

(declare-fun m!635941 () Bool)

(assert (=> b!664719 m!635941))

(declare-fun m!635943 () Bool)

(assert (=> b!664705 m!635943))

(declare-fun m!635945 () Bool)

(assert (=> b!664727 m!635945))

(declare-fun m!635947 () Bool)

(assert (=> b!664713 m!635947))

(declare-fun m!635949 () Bool)

(assert (=> b!664721 m!635949))

(assert (=> b!664711 m!635947))

(declare-fun m!635951 () Bool)

(assert (=> b!664720 m!635951))

(declare-fun m!635953 () Bool)

(assert (=> b!664710 m!635953))

(declare-fun m!635955 () Bool)

(assert (=> b!664710 m!635955))

(declare-fun m!635957 () Bool)

(assert (=> b!664710 m!635957))

(declare-fun m!635959 () Bool)

(assert (=> b!664710 m!635959))

(assert (=> b!664710 m!635955))

(assert (=> b!664710 m!635957))

(declare-fun m!635961 () Bool)

(assert (=> b!664710 m!635961))

(declare-fun m!635963 () Bool)

(assert (=> b!664710 m!635963))

(assert (=> b!664707 m!635953))

(assert (=> b!664707 m!635955))

(declare-fun m!635965 () Bool)

(assert (=> b!664707 m!635965))

(declare-fun m!635967 () Bool)

(assert (=> b!664707 m!635967))

(declare-fun m!635969 () Bool)

(assert (=> b!664707 m!635969))

(assert (=> b!664707 m!635961))

(declare-fun m!635971 () Bool)

(assert (=> b!664707 m!635971))

(declare-fun m!635973 () Bool)

(assert (=> b!664707 m!635973))

(assert (=> b!664707 m!635955))

(declare-fun m!635975 () Bool)

(assert (=> b!664707 m!635975))

(declare-fun m!635977 () Bool)

(assert (=> b!664707 m!635977))

(assert (=> b!664707 m!635963))

(declare-fun m!635979 () Bool)

(assert (=> b!664704 m!635979))

(assert (=> b!664715 m!635947))

(declare-fun m!635981 () Bool)

(assert (=> b!664722 m!635981))

(declare-fun m!635983 () Bool)

(assert (=> b!664706 m!635983))

(declare-fun m!635985 () Bool)

(assert (=> b!664708 m!635985))

(declare-fun m!635987 () Bool)

(assert (=> b!664724 m!635987))

(declare-fun m!635989 () Bool)

(assert (=> b!664714 m!635989))

(declare-fun m!635991 () Bool)

(assert (=> b!664716 m!635991))

(declare-fun m!635993 () Bool)

(assert (=> start!59950 m!635993))

(declare-fun m!635995 () Bool)

(assert (=> b!664712 m!635995))

(check-sat (not b!664707) (not b!664706) (not b!664715) (not b!664714) (not b!664711) (not b!664708) (not b!664720) (not b!664710) (not start!59950) (not b!664713) (not b!664712) (not b!664719) (not b!664724) (not b!664722) (not b!664716) (not b!664705) (not b!664721) (not b!664704) (not b!664727))
(check-sat)
