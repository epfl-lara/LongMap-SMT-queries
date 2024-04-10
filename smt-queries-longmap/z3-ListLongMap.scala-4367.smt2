; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60232 () Bool)

(assert start!60232)

(declare-fun b!674703 () Bool)

(declare-fun res!441158 () Bool)

(declare-fun e!385097 () Bool)

(assert (=> b!674703 (=> (not res!441158) (not e!385097))))

(declare-datatypes ((List!12873 0))(
  ( (Nil!12870) (Cons!12869 (h!13914 (_ BitVec 64)) (t!19101 List!12873)) )
))
(declare-fun acc!681 () List!12873)

(declare-fun contains!3450 (List!12873 (_ BitVec 64)) Bool)

(assert (=> b!674703 (= res!441158 (not (contains!3450 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674704 () Bool)

(declare-fun e!385095 () Bool)

(declare-fun lt!312658 () List!12873)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!674704 (= e!385095 (not (contains!3450 lt!312658 k0!2843)))))

(declare-fun b!674705 () Bool)

(declare-fun e!385093 () Bool)

(assert (=> b!674705 (= e!385093 (contains!3450 lt!312658 k0!2843))))

(declare-fun b!674706 () Bool)

(declare-datatypes ((Unit!23740 0))(
  ( (Unit!23741) )
))
(declare-fun e!385088 () Unit!23740)

(declare-fun Unit!23742 () Unit!23740)

(assert (=> b!674706 (= e!385088 Unit!23742)))

(declare-fun b!674707 () Bool)

(declare-fun res!441163 () Bool)

(assert (=> b!674707 (=> (not res!441163) (not e!385097))))

(assert (=> b!674707 (= res!441163 (not (contains!3450 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674708 () Bool)

(declare-fun res!441179 () Bool)

(declare-fun e!385096 () Bool)

(assert (=> b!674708 (=> (not res!441179) (not e!385096))))

(assert (=> b!674708 (= res!441179 (not (contains!3450 lt!312658 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674709 () Bool)

(declare-fun res!441171 () Bool)

(assert (=> b!674709 (=> (not res!441171) (not e!385097))))

(declare-datatypes ((array!39279 0))(
  ( (array!39280 (arr!18832 (Array (_ BitVec 32) (_ BitVec 64))) (size!19196 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39279)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39279 (_ BitVec 32) List!12873) Bool)

(assert (=> b!674709 (= res!441171 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!674710 () Bool)

(declare-fun res!441156 () Bool)

(assert (=> b!674710 (=> (not res!441156) (not e!385097))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674710 (= res!441156 (validKeyInArray!0 k0!2843))))

(declare-fun b!674711 () Bool)

(declare-fun res!441175 () Bool)

(assert (=> b!674711 (=> (not res!441175) (not e!385096))))

(declare-fun e!385092 () Bool)

(assert (=> b!674711 (= res!441175 e!385092)))

(declare-fun res!441155 () Bool)

(assert (=> b!674711 (=> res!441155 e!385092)))

(assert (=> b!674711 (= res!441155 e!385093)))

(declare-fun res!441169 () Bool)

(assert (=> b!674711 (=> (not res!441169) (not e!385093))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!674711 (= res!441169 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674712 () Bool)

(declare-fun res!441168 () Bool)

(assert (=> b!674712 (=> (not res!441168) (not e!385096))))

(assert (=> b!674712 (= res!441168 (not (contains!3450 lt!312658 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674714 () Bool)

(declare-fun e!385091 () Bool)

(declare-fun e!385089 () Bool)

(assert (=> b!674714 (= e!385091 e!385089)))

(declare-fun res!441159 () Bool)

(assert (=> b!674714 (=> (not res!441159) (not e!385089))))

(assert (=> b!674714 (= res!441159 (bvsle from!3004 i!1382))))

(declare-fun b!674715 () Bool)

(declare-fun res!441172 () Bool)

(assert (=> b!674715 (=> (not res!441172) (not e!385097))))

(assert (=> b!674715 (= res!441172 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19196 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674716 () Bool)

(declare-fun res!441176 () Bool)

(assert (=> b!674716 (=> (not res!441176) (not e!385097))))

(assert (=> b!674716 (= res!441176 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19196 a!3626))))))

(declare-fun b!674717 () Bool)

(declare-fun res!441161 () Bool)

(assert (=> b!674717 (=> (not res!441161) (not e!385097))))

(assert (=> b!674717 (= res!441161 (validKeyInArray!0 (select (arr!18832 a!3626) from!3004)))))

(declare-fun b!674718 () Bool)

(declare-fun e!385098 () Bool)

(assert (=> b!674718 (= e!385098 e!385096)))

(declare-fun res!441160 () Bool)

(assert (=> b!674718 (=> (not res!441160) (not e!385096))))

(assert (=> b!674718 (= res!441160 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!300 (List!12873 (_ BitVec 64)) List!12873)

(assert (=> b!674718 (= lt!312658 ($colon$colon!300 acc!681 (select (arr!18832 a!3626) from!3004)))))

(declare-fun b!674719 () Bool)

(assert (=> b!674719 (= e!385092 e!385095)))

(declare-fun res!441166 () Bool)

(assert (=> b!674719 (=> (not res!441166) (not e!385095))))

(assert (=> b!674719 (= res!441166 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674720 () Bool)

(assert (=> b!674720 (= e!385089 (not (contains!3450 acc!681 k0!2843)))))

(declare-fun b!674721 () Bool)

(declare-fun res!441177 () Bool)

(assert (=> b!674721 (=> (not res!441177) (not e!385097))))

(assert (=> b!674721 (= res!441177 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12870))))

(declare-fun b!674722 () Bool)

(declare-fun res!441173 () Bool)

(assert (=> b!674722 (=> (not res!441173) (not e!385096))))

(assert (=> b!674722 (= res!441173 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312658))))

(declare-fun b!674723 () Bool)

(assert (=> b!674723 (= e!385096 (not true))))

(assert (=> b!674723 (arrayNoDuplicates!0 (array!39280 (store (arr!18832 a!3626) i!1382 k0!2843) (size!19196 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312658)))

(declare-fun lt!312657 () Unit!23740)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39279 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12873) Unit!23740)

(assert (=> b!674723 (= lt!312657 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312658))))

(declare-fun b!674724 () Bool)

(declare-fun res!441164 () Bool)

(assert (=> b!674724 (=> (not res!441164) (not e!385097))))

(assert (=> b!674724 (= res!441164 e!385091)))

(declare-fun res!441167 () Bool)

(assert (=> b!674724 (=> res!441167 e!385091)))

(declare-fun e!385094 () Bool)

(assert (=> b!674724 (= res!441167 e!385094)))

(declare-fun res!441162 () Bool)

(assert (=> b!674724 (=> (not res!441162) (not e!385094))))

(assert (=> b!674724 (= res!441162 (bvsgt from!3004 i!1382))))

(declare-fun b!674725 () Bool)

(declare-fun res!441170 () Bool)

(assert (=> b!674725 (=> (not res!441170) (not e!385097))))

(declare-fun noDuplicate!697 (List!12873) Bool)

(assert (=> b!674725 (= res!441170 (noDuplicate!697 acc!681))))

(declare-fun b!674726 () Bool)

(declare-fun res!441165 () Bool)

(assert (=> b!674726 (=> (not res!441165) (not e!385096))))

(assert (=> b!674726 (= res!441165 (noDuplicate!697 lt!312658))))

(declare-fun b!674727 () Bool)

(declare-fun Unit!23743 () Unit!23740)

(assert (=> b!674727 (= e!385088 Unit!23743)))

(declare-fun arrayContainsKey!0 (array!39279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674727 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312656 () Unit!23740)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39279 (_ BitVec 64) (_ BitVec 32)) Unit!23740)

(assert (=> b!674727 (= lt!312656 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!674727 false))

(declare-fun res!441174 () Bool)

(assert (=> start!60232 (=> (not res!441174) (not e!385097))))

(assert (=> start!60232 (= res!441174 (and (bvslt (size!19196 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19196 a!3626))))))

(assert (=> start!60232 e!385097))

(assert (=> start!60232 true))

(declare-fun array_inv!14628 (array!39279) Bool)

(assert (=> start!60232 (array_inv!14628 a!3626)))

(declare-fun b!674713 () Bool)

(assert (=> b!674713 (= e!385097 e!385098)))

(declare-fun res!441157 () Bool)

(assert (=> b!674713 (=> (not res!441157) (not e!385098))))

(assert (=> b!674713 (= res!441157 (not (= (select (arr!18832 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312655 () Unit!23740)

(assert (=> b!674713 (= lt!312655 e!385088)))

(declare-fun c!77141 () Bool)

(assert (=> b!674713 (= c!77141 (= (select (arr!18832 a!3626) from!3004) k0!2843))))

(declare-fun b!674728 () Bool)

(assert (=> b!674728 (= e!385094 (contains!3450 acc!681 k0!2843))))

(declare-fun b!674729 () Bool)

(declare-fun res!441178 () Bool)

(assert (=> b!674729 (=> (not res!441178) (not e!385097))))

(assert (=> b!674729 (= res!441178 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60232 res!441174) b!674725))

(assert (= (and b!674725 res!441170) b!674703))

(assert (= (and b!674703 res!441158) b!674707))

(assert (= (and b!674707 res!441163) b!674724))

(assert (= (and b!674724 res!441162) b!674728))

(assert (= (and b!674724 (not res!441167)) b!674714))

(assert (= (and b!674714 res!441159) b!674720))

(assert (= (and b!674724 res!441164) b!674721))

(assert (= (and b!674721 res!441177) b!674709))

(assert (= (and b!674709 res!441171) b!674716))

(assert (= (and b!674716 res!441176) b!674710))

(assert (= (and b!674710 res!441156) b!674729))

(assert (= (and b!674729 res!441178) b!674715))

(assert (= (and b!674715 res!441172) b!674717))

(assert (= (and b!674717 res!441161) b!674713))

(assert (= (and b!674713 c!77141) b!674727))

(assert (= (and b!674713 (not c!77141)) b!674706))

(assert (= (and b!674713 res!441157) b!674718))

(assert (= (and b!674718 res!441160) b!674726))

(assert (= (and b!674726 res!441165) b!674712))

(assert (= (and b!674712 res!441168) b!674708))

(assert (= (and b!674708 res!441179) b!674711))

(assert (= (and b!674711 res!441169) b!674705))

(assert (= (and b!674711 (not res!441155)) b!674719))

(assert (= (and b!674719 res!441166) b!674704))

(assert (= (and b!674711 res!441175) b!674722))

(assert (= (and b!674722 res!441173) b!674723))

(declare-fun m!642535 () Bool)

(assert (=> b!674726 m!642535))

(declare-fun m!642537 () Bool)

(assert (=> b!674712 m!642537))

(declare-fun m!642539 () Bool)

(assert (=> b!674703 m!642539))

(declare-fun m!642541 () Bool)

(assert (=> b!674707 m!642541))

(declare-fun m!642543 () Bool)

(assert (=> b!674720 m!642543))

(declare-fun m!642545 () Bool)

(assert (=> b!674725 m!642545))

(declare-fun m!642547 () Bool)

(assert (=> b!674705 m!642547))

(declare-fun m!642549 () Bool)

(assert (=> b!674721 m!642549))

(declare-fun m!642551 () Bool)

(assert (=> b!674710 m!642551))

(declare-fun m!642553 () Bool)

(assert (=> start!60232 m!642553))

(declare-fun m!642555 () Bool)

(assert (=> b!674713 m!642555))

(declare-fun m!642557 () Bool)

(assert (=> b!674708 m!642557))

(assert (=> b!674718 m!642555))

(assert (=> b!674718 m!642555))

(declare-fun m!642559 () Bool)

(assert (=> b!674718 m!642559))

(assert (=> b!674717 m!642555))

(assert (=> b!674717 m!642555))

(declare-fun m!642561 () Bool)

(assert (=> b!674717 m!642561))

(assert (=> b!674704 m!642547))

(declare-fun m!642563 () Bool)

(assert (=> b!674723 m!642563))

(declare-fun m!642565 () Bool)

(assert (=> b!674723 m!642565))

(declare-fun m!642567 () Bool)

(assert (=> b!674723 m!642567))

(assert (=> b!674728 m!642543))

(declare-fun m!642569 () Bool)

(assert (=> b!674722 m!642569))

(declare-fun m!642571 () Bool)

(assert (=> b!674727 m!642571))

(declare-fun m!642573 () Bool)

(assert (=> b!674727 m!642573))

(declare-fun m!642575 () Bool)

(assert (=> b!674729 m!642575))

(declare-fun m!642577 () Bool)

(assert (=> b!674709 m!642577))

(check-sat (not b!674721) (not b!674726) (not b!674705) (not b!674717) (not b!674710) (not b!674722) (not b!674720) (not b!674704) (not b!674707) (not b!674723) (not b!674727) (not b!674709) (not b!674725) (not b!674718) (not start!60232) (not b!674712) (not b!674728) (not b!674703) (not b!674708) (not b!674729))
(check-sat)
