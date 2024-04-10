; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60030 () Bool)

(assert start!60030)

(declare-fun b!667703 () Bool)

(declare-fun e!382138 () Bool)

(declare-fun e!382143 () Bool)

(assert (=> b!667703 (= e!382138 (not e!382143))))

(declare-fun res!434888 () Bool)

(assert (=> b!667703 (=> res!434888 e!382143)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!667703 (= res!434888 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39077 0))(
  ( (array!39078 (arr!18731 (Array (_ BitVec 32) (_ BitVec 64))) (size!19095 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39077)

(declare-datatypes ((List!12772 0))(
  ( (Nil!12769) (Cons!12768 (h!13813 (_ BitVec 64)) (t!19000 List!12772)) )
))
(declare-fun lt!310929 () List!12772)

(declare-fun arrayNoDuplicates!0 (array!39077 (_ BitVec 32) List!12772) Bool)

(assert (=> b!667703 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!310929)))

(declare-fun acc!681 () List!12772)

(declare-datatypes ((Unit!23380 0))(
  ( (Unit!23381) )
))
(declare-fun lt!310931 () Unit!23380)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39077 (_ BitVec 64) (_ BitVec 32) List!12772 List!12772) Unit!23380)

(assert (=> b!667703 (= lt!310931 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!310929))))

(declare-fun -!86 (List!12772 (_ BitVec 64)) List!12772)

(assert (=> b!667703 (= (-!86 lt!310929 k!2843) acc!681)))

(declare-fun $colon$colon!220 (List!12772 (_ BitVec 64)) List!12772)

(assert (=> b!667703 (= lt!310929 ($colon$colon!220 acc!681 k!2843))))

(declare-fun lt!310926 () Unit!23380)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12772) Unit!23380)

(assert (=> b!667703 (= lt!310926 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!88 (List!12772 List!12772) Bool)

(assert (=> b!667703 (subseq!88 acc!681 acc!681)))

(declare-fun lt!310928 () Unit!23380)

(declare-fun lemmaListSubSeqRefl!0 (List!12772) Unit!23380)

(assert (=> b!667703 (= lt!310928 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667703 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310933 () Unit!23380)

(declare-fun e!382140 () Unit!23380)

(assert (=> b!667703 (= lt!310933 e!382140)))

(declare-fun c!76784 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667703 (= c!76784 (validKeyInArray!0 (select (arr!18731 a!3626) from!3004)))))

(declare-fun lt!310930 () Unit!23380)

(declare-fun e!382135 () Unit!23380)

(assert (=> b!667703 (= lt!310930 e!382135)))

(declare-fun c!76783 () Bool)

(declare-fun arrayContainsKey!0 (array!39077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667703 (= c!76783 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667703 (arrayContainsKey!0 (array!39078 (store (arr!18731 a!3626) i!1382 k!2843) (size!19095 a!3626)) k!2843 from!3004)))

(declare-fun b!667704 () Bool)

(declare-fun res!434879 () Bool)

(assert (=> b!667704 (=> (not res!434879) (not e!382138))))

(assert (=> b!667704 (= res!434879 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19095 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667705 () Bool)

(declare-fun e!382141 () Bool)

(declare-fun contains!3349 (List!12772 (_ BitVec 64)) Bool)

(assert (=> b!667705 (= e!382141 (contains!3349 acc!681 k!2843))))

(declare-fun b!667706 () Bool)

(declare-fun res!434887 () Bool)

(assert (=> b!667706 (=> (not res!434887) (not e!382138))))

(assert (=> b!667706 (= res!434887 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667707 () Bool)

(declare-fun res!434889 () Bool)

(assert (=> b!667707 (=> (not res!434889) (not e!382138))))

(assert (=> b!667707 (= res!434889 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19095 a!3626))))))

(declare-fun b!667709 () Bool)

(declare-fun res!434886 () Bool)

(assert (=> b!667709 (=> (not res!434886) (not e!382138))))

(assert (=> b!667709 (= res!434886 (not (contains!3349 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667710 () Bool)

(declare-fun Unit!23382 () Unit!23380)

(assert (=> b!667710 (= e!382135 Unit!23382)))

(declare-fun b!667711 () Bool)

(declare-fun res!434874 () Bool)

(assert (=> b!667711 (=> (not res!434874) (not e!382138))))

(assert (=> b!667711 (= res!434874 (not (contains!3349 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667712 () Bool)

(declare-fun res!434876 () Bool)

(assert (=> b!667712 (=> (not res!434876) (not e!382138))))

(assert (=> b!667712 (= res!434876 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667713 () Bool)

(assert (=> b!667713 (= e!382143 true)))

(declare-fun lt!310924 () Bool)

(declare-fun e!382134 () Bool)

(assert (=> b!667713 (= lt!310924 e!382134)))

(declare-fun res!434881 () Bool)

(assert (=> b!667713 (=> res!434881 e!382134)))

(declare-fun e!382139 () Bool)

(assert (=> b!667713 (= res!434881 e!382139)))

(declare-fun res!434890 () Bool)

(assert (=> b!667713 (=> (not res!434890) (not e!382139))))

(assert (=> b!667713 (= res!434890 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667714 () Bool)

(declare-fun e!382142 () Bool)

(declare-fun e!382137 () Bool)

(assert (=> b!667714 (= e!382142 e!382137)))

(declare-fun res!434871 () Bool)

(assert (=> b!667714 (=> (not res!434871) (not e!382137))))

(assert (=> b!667714 (= res!434871 (bvsle from!3004 i!1382))))

(declare-fun b!667715 () Bool)

(assert (=> b!667715 (= e!382137 (not (contains!3349 acc!681 k!2843)))))

(declare-fun b!667716 () Bool)

(declare-fun res!434878 () Bool)

(assert (=> b!667716 (=> (not res!434878) (not e!382138))))

(declare-fun noDuplicate!596 (List!12772) Bool)

(assert (=> b!667716 (= res!434878 (noDuplicate!596 acc!681))))

(declare-fun res!434884 () Bool)

(assert (=> start!60030 (=> (not res!434884) (not e!382138))))

(assert (=> start!60030 (= res!434884 (and (bvslt (size!19095 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19095 a!3626))))))

(assert (=> start!60030 e!382138))

(assert (=> start!60030 true))

(declare-fun array_inv!14527 (array!39077) Bool)

(assert (=> start!60030 (array_inv!14527 a!3626)))

(declare-fun b!667708 () Bool)

(declare-fun res!434877 () Bool)

(assert (=> b!667708 (=> res!434877 e!382143)))

(assert (=> b!667708 (= res!434877 (contains!3349 lt!310929 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667717 () Bool)

(declare-fun res!434885 () Bool)

(assert (=> b!667717 (=> (not res!434885) (not e!382138))))

(assert (=> b!667717 (= res!434885 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12769))))

(declare-fun b!667718 () Bool)

(declare-fun e!382136 () Bool)

(assert (=> b!667718 (= e!382136 (not (contains!3349 lt!310929 k!2843)))))

(declare-fun b!667719 () Bool)

(declare-fun res!434873 () Bool)

(assert (=> b!667719 (=> (not res!434873) (not e!382138))))

(assert (=> b!667719 (= res!434873 e!382142)))

(declare-fun res!434872 () Bool)

(assert (=> b!667719 (=> res!434872 e!382142)))

(assert (=> b!667719 (= res!434872 e!382141)))

(declare-fun res!434891 () Bool)

(assert (=> b!667719 (=> (not res!434891) (not e!382141))))

(assert (=> b!667719 (= res!434891 (bvsgt from!3004 i!1382))))

(declare-fun b!667720 () Bool)

(declare-fun res!434880 () Bool)

(assert (=> b!667720 (=> res!434880 e!382143)))

(assert (=> b!667720 (= res!434880 (not (noDuplicate!596 lt!310929)))))

(declare-fun b!667721 () Bool)

(declare-fun Unit!23383 () Unit!23380)

(assert (=> b!667721 (= e!382140 Unit!23383)))

(declare-fun b!667722 () Bool)

(assert (=> b!667722 (= e!382139 (contains!3349 lt!310929 k!2843))))

(declare-fun b!667723 () Bool)

(declare-fun res!434875 () Bool)

(assert (=> b!667723 (=> (not res!434875) (not e!382138))))

(assert (=> b!667723 (= res!434875 (validKeyInArray!0 k!2843))))

(declare-fun b!667724 () Bool)

(declare-fun lt!310925 () Unit!23380)

(assert (=> b!667724 (= e!382140 lt!310925)))

(declare-fun lt!310927 () Unit!23380)

(assert (=> b!667724 (= lt!310927 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667724 (subseq!88 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39077 List!12772 List!12772 (_ BitVec 32)) Unit!23380)

(assert (=> b!667724 (= lt!310925 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!220 acc!681 (select (arr!18731 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667724 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667725 () Bool)

(declare-fun res!434882 () Bool)

(assert (=> b!667725 (=> res!434882 e!382143)))

(assert (=> b!667725 (= res!434882 (contains!3349 lt!310929 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667726 () Bool)

(declare-fun Unit!23384 () Unit!23380)

(assert (=> b!667726 (= e!382135 Unit!23384)))

(declare-fun lt!310932 () Unit!23380)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39077 (_ BitVec 64) (_ BitVec 32)) Unit!23380)

(assert (=> b!667726 (= lt!310932 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!667726 false))

(declare-fun b!667727 () Bool)

(assert (=> b!667727 (= e!382134 e!382136)))

(declare-fun res!434883 () Bool)

(assert (=> b!667727 (=> (not res!434883) (not e!382136))))

(assert (=> b!667727 (= res!434883 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60030 res!434884) b!667716))

(assert (= (and b!667716 res!434878) b!667709))

(assert (= (and b!667709 res!434886) b!667711))

(assert (= (and b!667711 res!434874) b!667719))

(assert (= (and b!667719 res!434891) b!667705))

(assert (= (and b!667719 (not res!434872)) b!667714))

(assert (= (and b!667714 res!434871) b!667715))

(assert (= (and b!667719 res!434873) b!667717))

(assert (= (and b!667717 res!434885) b!667712))

(assert (= (and b!667712 res!434876) b!667707))

(assert (= (and b!667707 res!434889) b!667723))

(assert (= (and b!667723 res!434875) b!667706))

(assert (= (and b!667706 res!434887) b!667704))

(assert (= (and b!667704 res!434879) b!667703))

(assert (= (and b!667703 c!76783) b!667726))

(assert (= (and b!667703 (not c!76783)) b!667710))

(assert (= (and b!667703 c!76784) b!667724))

(assert (= (and b!667703 (not c!76784)) b!667721))

(assert (= (and b!667703 (not res!434888)) b!667720))

(assert (= (and b!667720 (not res!434880)) b!667708))

(assert (= (and b!667708 (not res!434877)) b!667725))

(assert (= (and b!667725 (not res!434882)) b!667713))

(assert (= (and b!667713 res!434890) b!667722))

(assert (= (and b!667713 (not res!434881)) b!667727))

(assert (= (and b!667727 res!434883) b!667718))

(declare-fun m!638191 () Bool)

(assert (=> b!667711 m!638191))

(declare-fun m!638193 () Bool)

(assert (=> b!667708 m!638193))

(declare-fun m!638195 () Bool)

(assert (=> b!667726 m!638195))

(declare-fun m!638197 () Bool)

(assert (=> b!667712 m!638197))

(declare-fun m!638199 () Bool)

(assert (=> b!667725 m!638199))

(declare-fun m!638201 () Bool)

(assert (=> b!667722 m!638201))

(declare-fun m!638203 () Bool)

(assert (=> start!60030 m!638203))

(declare-fun m!638205 () Bool)

(assert (=> b!667723 m!638205))

(declare-fun m!638207 () Bool)

(assert (=> b!667717 m!638207))

(declare-fun m!638209 () Bool)

(assert (=> b!667716 m!638209))

(declare-fun m!638211 () Bool)

(assert (=> b!667724 m!638211))

(declare-fun m!638213 () Bool)

(assert (=> b!667724 m!638213))

(declare-fun m!638215 () Bool)

(assert (=> b!667724 m!638215))

(declare-fun m!638217 () Bool)

(assert (=> b!667724 m!638217))

(assert (=> b!667724 m!638213))

(assert (=> b!667724 m!638215))

(declare-fun m!638219 () Bool)

(assert (=> b!667724 m!638219))

(declare-fun m!638221 () Bool)

(assert (=> b!667724 m!638221))

(assert (=> b!667718 m!638201))

(declare-fun m!638223 () Bool)

(assert (=> b!667720 m!638223))

(assert (=> b!667703 m!638211))

(assert (=> b!667703 m!638213))

(declare-fun m!638225 () Bool)

(assert (=> b!667703 m!638225))

(declare-fun m!638227 () Bool)

(assert (=> b!667703 m!638227))

(assert (=> b!667703 m!638219))

(declare-fun m!638229 () Bool)

(assert (=> b!667703 m!638229))

(declare-fun m!638231 () Bool)

(assert (=> b!667703 m!638231))

(assert (=> b!667703 m!638213))

(declare-fun m!638233 () Bool)

(assert (=> b!667703 m!638233))

(declare-fun m!638235 () Bool)

(assert (=> b!667703 m!638235))

(declare-fun m!638237 () Bool)

(assert (=> b!667703 m!638237))

(declare-fun m!638239 () Bool)

(assert (=> b!667703 m!638239))

(declare-fun m!638241 () Bool)

(assert (=> b!667703 m!638241))

(assert (=> b!667703 m!638221))

(declare-fun m!638243 () Bool)

(assert (=> b!667715 m!638243))

(assert (=> b!667705 m!638243))

(declare-fun m!638245 () Bool)

(assert (=> b!667709 m!638245))

(declare-fun m!638247 () Bool)

(assert (=> b!667706 m!638247))

(push 1)

(assert (not b!667717))

(assert (not b!667720))

(assert (not b!667715))

(assert (not b!667708))

(assert (not b!667709))

(assert (not b!667716))

(assert (not b!667705))

(assert (not b!667718))

(assert (not b!667723))

(assert (not b!667711))

(assert (not b!667706))

(assert (not b!667712))

(assert (not start!60030))

(assert (not b!667703))

(assert (not b!667725))

(assert (not b!667724))

(assert (not b!667722))

(assert (not b!667726))

(check-sat)

