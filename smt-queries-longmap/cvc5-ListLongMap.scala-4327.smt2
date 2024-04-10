; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59990 () Bool)

(assert start!59990)

(declare-fun b!666203 () Bool)

(declare-fun e!381609 () Bool)

(declare-fun e!381608 () Bool)

(assert (=> b!666203 (= e!381609 e!381608)))

(declare-fun res!433618 () Bool)

(assert (=> b!666203 (=> (not res!433618) (not e!381608))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666203 (= res!433618 (bvsle from!3004 i!1382))))

(declare-fun b!666205 () Bool)

(declare-fun res!433625 () Bool)

(declare-fun e!381602 () Bool)

(assert (=> b!666205 (=> (not res!433625) (not e!381602))))

(declare-datatypes ((array!39037 0))(
  ( (array!39038 (arr!18711 (Array (_ BitVec 32) (_ BitVec 64))) (size!19075 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39037)

(declare-datatypes ((List!12752 0))(
  ( (Nil!12749) (Cons!12748 (h!13793 (_ BitVec 64)) (t!18980 List!12752)) )
))
(declare-fun acc!681 () List!12752)

(declare-fun arrayNoDuplicates!0 (array!39037 (_ BitVec 32) List!12752) Bool)

(assert (=> b!666205 (= res!433625 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666206 () Bool)

(declare-datatypes ((Unit!23280 0))(
  ( (Unit!23281) )
))
(declare-fun e!381604 () Unit!23280)

(declare-fun Unit!23282 () Unit!23280)

(assert (=> b!666206 (= e!381604 Unit!23282)))

(declare-fun lt!310333 () Unit!23280)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39037 (_ BitVec 64) (_ BitVec 32)) Unit!23280)

(assert (=> b!666206 (= lt!310333 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!666206 false))

(declare-fun b!666207 () Bool)

(declare-fun res!433617 () Bool)

(assert (=> b!666207 (=> (not res!433617) (not e!381602))))

(declare-fun arrayContainsKey!0 (array!39037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666207 (= res!433617 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666208 () Bool)

(declare-fun e!381603 () Unit!23280)

(declare-fun lt!310329 () Unit!23280)

(assert (=> b!666208 (= e!381603 lt!310329)))

(declare-fun lt!310326 () Unit!23280)

(declare-fun lemmaListSubSeqRefl!0 (List!12752) Unit!23280)

(assert (=> b!666208 (= lt!310326 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!68 (List!12752 List!12752) Bool)

(assert (=> b!666208 (subseq!68 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39037 List!12752 List!12752 (_ BitVec 32)) Unit!23280)

(declare-fun $colon$colon!200 (List!12752 (_ BitVec 64)) List!12752)

(assert (=> b!666208 (= lt!310329 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!200 acc!681 (select (arr!18711 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666208 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666209 () Bool)

(declare-fun res!433623 () Bool)

(declare-fun e!381606 () Bool)

(assert (=> b!666209 (=> res!433623 e!381606)))

(declare-fun lt!310325 () List!12752)

(assert (=> b!666209 (= res!433623 (not (subseq!68 acc!681 lt!310325)))))

(declare-fun b!666210 () Bool)

(declare-fun res!433628 () Bool)

(assert (=> b!666210 (=> res!433628 e!381606)))

(declare-fun noDuplicate!576 (List!12752) Bool)

(assert (=> b!666210 (= res!433628 (not (noDuplicate!576 lt!310325)))))

(declare-fun b!666211 () Bool)

(declare-fun res!433630 () Bool)

(assert (=> b!666211 (=> res!433630 e!381606)))

(declare-fun contains!3329 (List!12752 (_ BitVec 64)) Bool)

(assert (=> b!666211 (= res!433630 (contains!3329 acc!681 k!2843))))

(declare-fun b!666212 () Bool)

(declare-fun Unit!23283 () Unit!23280)

(assert (=> b!666212 (= e!381603 Unit!23283)))

(declare-fun b!666213 () Bool)

(declare-fun res!433629 () Bool)

(assert (=> b!666213 (=> (not res!433629) (not e!381602))))

(assert (=> b!666213 (= res!433629 (not (contains!3329 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666204 () Bool)

(declare-fun res!433612 () Bool)

(assert (=> b!666204 (=> res!433612 e!381606)))

(assert (=> b!666204 (= res!433612 (contains!3329 lt!310325 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!433615 () Bool)

(assert (=> start!59990 (=> (not res!433615) (not e!381602))))

(assert (=> start!59990 (= res!433615 (and (bvslt (size!19075 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19075 a!3626))))))

(assert (=> start!59990 e!381602))

(assert (=> start!59990 true))

(declare-fun array_inv!14507 (array!39037) Bool)

(assert (=> start!59990 (array_inv!14507 a!3626)))

(declare-fun b!666214 () Bool)

(declare-fun res!433619 () Bool)

(assert (=> b!666214 (=> res!433619 e!381606)))

(declare-fun lt!310331 () Bool)

(assert (=> b!666214 (= res!433619 lt!310331)))

(declare-fun b!666215 () Bool)

(declare-fun res!433627 () Bool)

(assert (=> b!666215 (=> (not res!433627) (not e!381602))))

(assert (=> b!666215 (= res!433627 (not (contains!3329 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666216 () Bool)

(declare-fun res!433616 () Bool)

(assert (=> b!666216 (=> (not res!433616) (not e!381602))))

(assert (=> b!666216 (= res!433616 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12749))))

(declare-fun b!666217 () Bool)

(declare-fun res!433621 () Bool)

(assert (=> b!666217 (=> (not res!433621) (not e!381602))))

(assert (=> b!666217 (= res!433621 e!381609)))

(declare-fun res!433620 () Bool)

(assert (=> b!666217 (=> res!433620 e!381609)))

(declare-fun e!381607 () Bool)

(assert (=> b!666217 (= res!433620 e!381607)))

(declare-fun res!433626 () Bool)

(assert (=> b!666217 (=> (not res!433626) (not e!381607))))

(assert (=> b!666217 (= res!433626 (bvsgt from!3004 i!1382))))

(declare-fun b!666218 () Bool)

(declare-fun res!433613 () Bool)

(assert (=> b!666218 (=> (not res!433613) (not e!381602))))

(assert (=> b!666218 (= res!433613 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19075 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666219 () Bool)

(assert (=> b!666219 (= e!381607 (contains!3329 acc!681 k!2843))))

(declare-fun b!666220 () Bool)

(declare-fun res!433624 () Bool)

(assert (=> b!666220 (=> (not res!433624) (not e!381602))))

(assert (=> b!666220 (= res!433624 (noDuplicate!576 acc!681))))

(declare-fun b!666221 () Bool)

(declare-fun res!433622 () Bool)

(assert (=> b!666221 (=> res!433622 e!381606)))

(assert (=> b!666221 (= res!433622 (not (contains!3329 lt!310325 k!2843)))))

(declare-fun b!666222 () Bool)

(declare-fun res!433611 () Bool)

(assert (=> b!666222 (=> (not res!433611) (not e!381602))))

(assert (=> b!666222 (= res!433611 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19075 a!3626))))))

(declare-fun b!666223 () Bool)

(assert (=> b!666223 (= e!381602 (not e!381606))))

(declare-fun res!433614 () Bool)

(assert (=> b!666223 (=> res!433614 e!381606)))

(assert (=> b!666223 (= res!433614 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!66 (List!12752 (_ BitVec 64)) List!12752)

(assert (=> b!666223 (= (-!66 lt!310325 k!2843) acc!681)))

(assert (=> b!666223 (= lt!310325 ($colon$colon!200 acc!681 k!2843))))

(declare-fun lt!310328 () Unit!23280)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12752) Unit!23280)

(assert (=> b!666223 (= lt!310328 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!666223 (subseq!68 acc!681 acc!681)))

(declare-fun lt!310324 () Unit!23280)

(assert (=> b!666223 (= lt!310324 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666223 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310332 () Unit!23280)

(assert (=> b!666223 (= lt!310332 e!381603)))

(declare-fun c!76663 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666223 (= c!76663 (validKeyInArray!0 (select (arr!18711 a!3626) from!3004)))))

(declare-fun lt!310327 () Unit!23280)

(assert (=> b!666223 (= lt!310327 e!381604)))

(declare-fun c!76664 () Bool)

(assert (=> b!666223 (= c!76664 lt!310331)))

(assert (=> b!666223 (= lt!310331 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666223 (arrayContainsKey!0 (array!39038 (store (arr!18711 a!3626) i!1382 k!2843) (size!19075 a!3626)) k!2843 from!3004)))

(declare-fun b!666224 () Bool)

(assert (=> b!666224 (= e!381606 true)))

(declare-fun lt!310330 () Bool)

(assert (=> b!666224 (= lt!310330 (contains!3329 lt!310325 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666225 () Bool)

(declare-fun Unit!23284 () Unit!23280)

(assert (=> b!666225 (= e!381604 Unit!23284)))

(declare-fun b!666226 () Bool)

(declare-fun res!433631 () Bool)

(assert (=> b!666226 (=> (not res!433631) (not e!381602))))

(assert (=> b!666226 (= res!433631 (validKeyInArray!0 k!2843))))

(declare-fun b!666227 () Bool)

(assert (=> b!666227 (= e!381608 (not (contains!3329 acc!681 k!2843)))))

(assert (= (and start!59990 res!433615) b!666220))

(assert (= (and b!666220 res!433624) b!666213))

(assert (= (and b!666213 res!433629) b!666215))

(assert (= (and b!666215 res!433627) b!666217))

(assert (= (and b!666217 res!433626) b!666219))

(assert (= (and b!666217 (not res!433620)) b!666203))

(assert (= (and b!666203 res!433618) b!666227))

(assert (= (and b!666217 res!433621) b!666216))

(assert (= (and b!666216 res!433616) b!666205))

(assert (= (and b!666205 res!433625) b!666222))

(assert (= (and b!666222 res!433611) b!666226))

(assert (= (and b!666226 res!433631) b!666207))

(assert (= (and b!666207 res!433617) b!666218))

(assert (= (and b!666218 res!433613) b!666223))

(assert (= (and b!666223 c!76664) b!666206))

(assert (= (and b!666223 (not c!76664)) b!666225))

(assert (= (and b!666223 c!76663) b!666208))

(assert (= (and b!666223 (not c!76663)) b!666212))

(assert (= (and b!666223 (not res!433614)) b!666210))

(assert (= (and b!666210 (not res!433628)) b!666214))

(assert (= (and b!666214 (not res!433619)) b!666211))

(assert (= (and b!666211 (not res!433630)) b!666209))

(assert (= (and b!666209 (not res!433623)) b!666221))

(assert (= (and b!666221 (not res!433622)) b!666204))

(assert (= (and b!666204 (not res!433612)) b!666224))

(declare-fun m!637061 () Bool)

(assert (=> b!666210 m!637061))

(declare-fun m!637063 () Bool)

(assert (=> b!666213 m!637063))

(declare-fun m!637065 () Bool)

(assert (=> b!666215 m!637065))

(declare-fun m!637067 () Bool)

(assert (=> b!666219 m!637067))

(declare-fun m!637069 () Bool)

(assert (=> b!666204 m!637069))

(declare-fun m!637071 () Bool)

(assert (=> b!666206 m!637071))

(declare-fun m!637073 () Bool)

(assert (=> b!666223 m!637073))

(declare-fun m!637075 () Bool)

(assert (=> b!666223 m!637075))

(declare-fun m!637077 () Bool)

(assert (=> b!666223 m!637077))

(declare-fun m!637079 () Bool)

(assert (=> b!666223 m!637079))

(declare-fun m!637081 () Bool)

(assert (=> b!666223 m!637081))

(declare-fun m!637083 () Bool)

(assert (=> b!666223 m!637083))

(declare-fun m!637085 () Bool)

(assert (=> b!666223 m!637085))

(declare-fun m!637087 () Bool)

(assert (=> b!666223 m!637087))

(assert (=> b!666223 m!637077))

(declare-fun m!637089 () Bool)

(assert (=> b!666223 m!637089))

(declare-fun m!637091 () Bool)

(assert (=> b!666223 m!637091))

(declare-fun m!637093 () Bool)

(assert (=> b!666223 m!637093))

(declare-fun m!637095 () Bool)

(assert (=> b!666221 m!637095))

(declare-fun m!637097 () Bool)

(assert (=> b!666216 m!637097))

(declare-fun m!637099 () Bool)

(assert (=> start!59990 m!637099))

(declare-fun m!637101 () Bool)

(assert (=> b!666220 m!637101))

(declare-fun m!637103 () Bool)

(assert (=> b!666209 m!637103))

(declare-fun m!637105 () Bool)

(assert (=> b!666207 m!637105))

(declare-fun m!637107 () Bool)

(assert (=> b!666205 m!637107))

(assert (=> b!666208 m!637075))

(assert (=> b!666208 m!637077))

(declare-fun m!637109 () Bool)

(assert (=> b!666208 m!637109))

(declare-fun m!637111 () Bool)

(assert (=> b!666208 m!637111))

(assert (=> b!666208 m!637077))

(assert (=> b!666208 m!637109))

(assert (=> b!666208 m!637083))

(assert (=> b!666208 m!637093))

(assert (=> b!666211 m!637067))

(declare-fun m!637113 () Bool)

(assert (=> b!666226 m!637113))

(declare-fun m!637115 () Bool)

(assert (=> b!666224 m!637115))

(assert (=> b!666227 m!637067))

(push 1)

(assert (not b!666207))

(assert (not b!666221))

(assert (not b!666219))

(assert (not b!666215))

(assert (not b!666224))

(assert (not b!666204))

(assert (not b!666216))

(assert (not b!666213))

(assert (not b!666226))

(assert (not b!666208))

(assert (not b!666211))

(assert (not b!666227))

(assert (not b!666223))

(assert (not b!666205))

(assert (not b!666209))

(assert (not b!666220))

(assert (not start!59990))

(assert (not b!666210))

(assert (not b!666206))

(check-sat)

