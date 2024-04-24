; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60166 () Bool)

(assert start!60166)

(declare-fun b!670887 () Bool)

(declare-fun res!437483 () Bool)

(declare-fun e!383570 () Bool)

(assert (=> b!670887 (=> (not res!437483) (not e!383570))))

(declare-datatypes ((array!39151 0))(
  ( (array!39152 (arr!18765 (Array (_ BitVec 32) (_ BitVec 64))) (size!19129 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39151)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12713 0))(
  ( (Nil!12710) (Cons!12709 (h!13757 (_ BitVec 64)) (t!18933 List!12713)) )
))
(declare-fun acc!681 () List!12713)

(declare-fun arrayNoDuplicates!0 (array!39151 (_ BitVec 32) List!12713) Bool)

(assert (=> b!670887 (= res!437483 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670888 () Bool)

(declare-fun res!437479 () Bool)

(assert (=> b!670888 (=> (not res!437479) (not e!383570))))

(assert (=> b!670888 (= res!437479 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12710))))

(declare-fun b!670889 () Bool)

(declare-fun res!437482 () Bool)

(declare-fun e!383569 () Bool)

(assert (=> b!670889 (=> res!437482 e!383569)))

(declare-fun e!383565 () Bool)

(assert (=> b!670889 (= res!437482 e!383565)))

(declare-fun res!437494 () Bool)

(assert (=> b!670889 (=> (not res!437494) (not e!383565))))

(declare-fun e!383561 () Bool)

(assert (=> b!670889 (= res!437494 e!383561)))

(declare-fun res!437497 () Bool)

(assert (=> b!670889 (=> res!437497 e!383561)))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670889 (= res!437497 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!437491 () Bool)

(assert (=> start!60166 (=> (not res!437491) (not e!383570))))

(assert (=> start!60166 (= res!437491 (and (bvslt (size!19129 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19129 a!3626))))))

(assert (=> start!60166 e!383570))

(assert (=> start!60166 true))

(declare-fun array_inv!14624 (array!39151) Bool)

(assert (=> start!60166 (array_inv!14624 a!3626)))

(declare-fun b!670890 () Bool)

(declare-fun res!437486 () Bool)

(assert (=> b!670890 (=> (not res!437486) (not e!383570))))

(assert (=> b!670890 (= res!437486 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19129 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!670891 () Bool)

(declare-fun res!437484 () Bool)

(assert (=> b!670891 (=> (not res!437484) (not e!383570))))

(declare-fun e!383566 () Bool)

(assert (=> b!670891 (= res!437484 e!383566)))

(declare-fun res!437488 () Bool)

(assert (=> b!670891 (=> res!437488 e!383566)))

(declare-fun e!383564 () Bool)

(assert (=> b!670891 (= res!437488 e!383564)))

(declare-fun res!437490 () Bool)

(assert (=> b!670891 (=> (not res!437490) (not e!383564))))

(assert (=> b!670891 (= res!437490 (bvsgt from!3004 i!1382))))

(declare-fun b!670892 () Bool)

(declare-datatypes ((Unit!23554 0))(
  ( (Unit!23555) )
))
(declare-fun e!383568 () Unit!23554)

(declare-fun Unit!23556 () Unit!23554)

(assert (=> b!670892 (= e!383568 Unit!23556)))

(declare-fun lt!312240 () Unit!23554)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39151 (_ BitVec 64) (_ BitVec 32)) Unit!23554)

(assert (=> b!670892 (= lt!312240 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!670892 false))

(declare-fun b!670893 () Bool)

(declare-fun res!437493 () Bool)

(assert (=> b!670893 (=> (not res!437493) (not e!383570))))

(declare-fun contains!3365 (List!12713 (_ BitVec 64)) Bool)

(assert (=> b!670893 (= res!437493 (not (contains!3365 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670894 () Bool)

(assert (=> b!670894 (= e!383570 (not e!383569))))

(declare-fun res!437492 () Bool)

(assert (=> b!670894 (=> res!437492 e!383569)))

(assert (=> b!670894 (= res!437492 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!312239 () List!12713)

(assert (=> b!670894 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312239)))

(declare-fun lt!312232 () Unit!23554)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39151 (_ BitVec 64) (_ BitVec 32) List!12713 List!12713) Unit!23554)

(assert (=> b!670894 (= lt!312232 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!312239))))

(declare-fun -!124 (List!12713 (_ BitVec 64)) List!12713)

(assert (=> b!670894 (= (-!124 lt!312239 k!2843) acc!681)))

(declare-fun $colon$colon!256 (List!12713 (_ BitVec 64)) List!12713)

(assert (=> b!670894 (= lt!312239 ($colon$colon!256 acc!681 k!2843))))

(declare-fun lt!312233 () Unit!23554)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12713) Unit!23554)

(assert (=> b!670894 (= lt!312233 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!127 (List!12713 List!12713) Bool)

(assert (=> b!670894 (subseq!127 acc!681 acc!681)))

(declare-fun lt!312236 () Unit!23554)

(declare-fun lemmaListSubSeqRefl!0 (List!12713) Unit!23554)

(assert (=> b!670894 (= lt!312236 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670894 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!312238 () Unit!23554)

(declare-fun e!383563 () Unit!23554)

(assert (=> b!670894 (= lt!312238 e!383563)))

(declare-fun c!77075 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670894 (= c!77075 (validKeyInArray!0 (select (arr!18765 a!3626) from!3004)))))

(declare-fun lt!312234 () Unit!23554)

(assert (=> b!670894 (= lt!312234 e!383568)))

(declare-fun c!77074 () Bool)

(declare-fun arrayContainsKey!0 (array!39151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670894 (= c!77074 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!312237 () array!39151)

(assert (=> b!670894 (arrayContainsKey!0 lt!312237 k!2843 from!3004)))

(assert (=> b!670894 (= lt!312237 (array!39152 (store (arr!18765 a!3626) i!1382 k!2843) (size!19129 a!3626)))))

(declare-fun b!670895 () Bool)

(declare-fun res!437476 () Bool)

(assert (=> b!670895 (=> (not res!437476) (not e!383570))))

(assert (=> b!670895 (= res!437476 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!670896 () Bool)

(declare-fun lt!312241 () Unit!23554)

(assert (=> b!670896 (= e!383563 lt!312241)))

(declare-fun lt!312235 () Unit!23554)

(assert (=> b!670896 (= lt!312235 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670896 (subseq!127 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39151 List!12713 List!12713 (_ BitVec 32)) Unit!23554)

(assert (=> b!670896 (= lt!312241 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!256 acc!681 (select (arr!18765 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670896 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!670897 () Bool)

(declare-fun res!437477 () Bool)

(assert (=> b!670897 (=> res!437477 e!383569)))

(assert (=> b!670897 (= res!437477 (contains!3365 lt!312239 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670898 () Bool)

(declare-fun e!383571 () Bool)

(assert (=> b!670898 (= e!383571 (not (contains!3365 acc!681 k!2843)))))

(declare-fun b!670899 () Bool)

(declare-fun res!437481 () Bool)

(assert (=> b!670899 (=> (not res!437481) (not e!383570))))

(assert (=> b!670899 (= res!437481 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19129 a!3626))))))

(declare-fun b!670900 () Bool)

(declare-fun res!437495 () Bool)

(assert (=> b!670900 (=> res!437495 e!383569)))

(assert (=> b!670900 (= res!437495 (contains!3365 lt!312239 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670901 () Bool)

(declare-fun res!437496 () Bool)

(assert (=> b!670901 (=> res!437496 e!383569)))

(declare-fun noDuplicate!639 (List!12713) Bool)

(assert (=> b!670901 (= res!437496 (not (noDuplicate!639 lt!312239)))))

(declare-fun b!670902 () Bool)

(assert (=> b!670902 (= e!383566 e!383571)))

(declare-fun res!437487 () Bool)

(assert (=> b!670902 (=> (not res!437487) (not e!383571))))

(assert (=> b!670902 (= res!437487 (bvsle from!3004 i!1382))))

(declare-fun b!670903 () Bool)

(assert (=> b!670903 (= e!383561 (not (contains!3365 lt!312239 k!2843)))))

(declare-fun b!670904 () Bool)

(assert (=> b!670904 (= e!383564 (contains!3365 acc!681 k!2843))))

(declare-fun b!670905 () Bool)

(declare-fun res!437489 () Bool)

(assert (=> b!670905 (=> (not res!437489) (not e!383570))))

(assert (=> b!670905 (= res!437489 (validKeyInArray!0 k!2843))))

(declare-fun b!670906 () Bool)

(declare-fun Unit!23557 () Unit!23554)

(assert (=> b!670906 (= e!383563 Unit!23557)))

(declare-fun b!670907 () Bool)

(declare-fun e!383567 () Bool)

(assert (=> b!670907 (= e!383565 e!383567)))

(declare-fun res!437480 () Bool)

(assert (=> b!670907 (=> res!437480 e!383567)))

(assert (=> b!670907 (= res!437480 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670908 () Bool)

(assert (=> b!670908 (= e!383567 (contains!3365 lt!312239 k!2843))))

(declare-fun b!670909 () Bool)

(assert (=> b!670909 (= e!383569 true)))

(assert (=> b!670909 (arrayNoDuplicates!0 lt!312237 (bvadd #b00000000000000000000000000000001 from!3004) lt!312239)))

(declare-fun lt!312231 () Unit!23554)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39151 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12713) Unit!23554)

(assert (=> b!670909 (= lt!312231 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312239))))

(declare-fun b!670910 () Bool)

(declare-fun res!437478 () Bool)

(assert (=> b!670910 (=> (not res!437478) (not e!383570))))

(assert (=> b!670910 (= res!437478 (not (contains!3365 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670911 () Bool)

(declare-fun Unit!23558 () Unit!23554)

(assert (=> b!670911 (= e!383568 Unit!23558)))

(declare-fun b!670912 () Bool)

(declare-fun res!437485 () Bool)

(assert (=> b!670912 (=> (not res!437485) (not e!383570))))

(assert (=> b!670912 (= res!437485 (noDuplicate!639 acc!681))))

(assert (= (and start!60166 res!437491) b!670912))

(assert (= (and b!670912 res!437485) b!670893))

(assert (= (and b!670893 res!437493) b!670910))

(assert (= (and b!670910 res!437478) b!670891))

(assert (= (and b!670891 res!437490) b!670904))

(assert (= (and b!670891 (not res!437488)) b!670902))

(assert (= (and b!670902 res!437487) b!670898))

(assert (= (and b!670891 res!437484) b!670888))

(assert (= (and b!670888 res!437479) b!670887))

(assert (= (and b!670887 res!437483) b!670899))

(assert (= (and b!670899 res!437481) b!670905))

(assert (= (and b!670905 res!437489) b!670895))

(assert (= (and b!670895 res!437476) b!670890))

(assert (= (and b!670890 res!437486) b!670894))

(assert (= (and b!670894 c!77074) b!670892))

(assert (= (and b!670894 (not c!77074)) b!670911))

(assert (= (and b!670894 c!77075) b!670896))

(assert (= (and b!670894 (not c!77075)) b!670906))

(assert (= (and b!670894 (not res!437492)) b!670901))

(assert (= (and b!670901 (not res!437496)) b!670900))

(assert (= (and b!670900 (not res!437495)) b!670897))

(assert (= (and b!670897 (not res!437477)) b!670889))

(assert (= (and b!670889 (not res!437497)) b!670903))

(assert (= (and b!670889 res!437494) b!670907))

(assert (= (and b!670907 (not res!437480)) b!670908))

(assert (= (and b!670889 (not res!437482)) b!670909))

(declare-fun m!641195 () Bool)

(assert (=> b!670892 m!641195))

(declare-fun m!641197 () Bool)

(assert (=> b!670901 m!641197))

(declare-fun m!641199 () Bool)

(assert (=> b!670912 m!641199))

(declare-fun m!641201 () Bool)

(assert (=> b!670905 m!641201))

(declare-fun m!641203 () Bool)

(assert (=> b!670896 m!641203))

(declare-fun m!641205 () Bool)

(assert (=> b!670896 m!641205))

(declare-fun m!641207 () Bool)

(assert (=> b!670896 m!641207))

(declare-fun m!641209 () Bool)

(assert (=> b!670896 m!641209))

(assert (=> b!670896 m!641205))

(assert (=> b!670896 m!641207))

(declare-fun m!641211 () Bool)

(assert (=> b!670896 m!641211))

(declare-fun m!641213 () Bool)

(assert (=> b!670896 m!641213))

(declare-fun m!641215 () Bool)

(assert (=> b!670895 m!641215))

(declare-fun m!641217 () Bool)

(assert (=> b!670904 m!641217))

(declare-fun m!641219 () Bool)

(assert (=> b!670887 m!641219))

(assert (=> b!670898 m!641217))

(declare-fun m!641221 () Bool)

(assert (=> b!670909 m!641221))

(declare-fun m!641223 () Bool)

(assert (=> b!670909 m!641223))

(declare-fun m!641225 () Bool)

(assert (=> b!670888 m!641225))

(declare-fun m!641227 () Bool)

(assert (=> b!670908 m!641227))

(declare-fun m!641229 () Bool)

(assert (=> start!60166 m!641229))

(declare-fun m!641231 () Bool)

(assert (=> b!670897 m!641231))

(declare-fun m!641233 () Bool)

(assert (=> b!670894 m!641233))

(assert (=> b!670894 m!641203))

(assert (=> b!670894 m!641205))

(declare-fun m!641235 () Bool)

(assert (=> b!670894 m!641235))

(declare-fun m!641237 () Bool)

(assert (=> b!670894 m!641237))

(declare-fun m!641239 () Bool)

(assert (=> b!670894 m!641239))

(assert (=> b!670894 m!641211))

(declare-fun m!641241 () Bool)

(assert (=> b!670894 m!641241))

(declare-fun m!641243 () Bool)

(assert (=> b!670894 m!641243))

(declare-fun m!641245 () Bool)

(assert (=> b!670894 m!641245))

(assert (=> b!670894 m!641205))

(declare-fun m!641247 () Bool)

(assert (=> b!670894 m!641247))

(assert (=> b!670894 m!641213))

(declare-fun m!641249 () Bool)

(assert (=> b!670894 m!641249))

(declare-fun m!641251 () Bool)

(assert (=> b!670900 m!641251))

(declare-fun m!641253 () Bool)

(assert (=> b!670910 m!641253))

(assert (=> b!670903 m!641227))

(declare-fun m!641255 () Bool)

(assert (=> b!670893 m!641255))

(push 1)

(assert (not b!670901))

(assert (not b!670910))

(assert (not b!670905))

(assert (not b!670898))

(assert (not b!670908))

(assert (not b!670887))

(assert (not b!670912))

(assert (not b!670893))

(assert (not b!670896))

(assert (not b!670904))

(assert (not b!670894))

(assert (not b!670892))

(assert (not b!670900))

(assert (not b!670903))

(assert (not b!670888))

(assert (not start!60166))

(assert (not b!670909))

(assert (not b!670897))

(assert (not b!670895))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

