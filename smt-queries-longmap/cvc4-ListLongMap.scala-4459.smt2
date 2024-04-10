; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62052 () Bool)

(assert start!62052)

(declare-fun b!694866 () Bool)

(declare-fun res!458876 () Bool)

(declare-fun e!395208 () Bool)

(assert (=> b!694866 (=> (not res!458876) (not e!395208))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39893 0))(
  ( (array!39894 (arr!19109 (Array (_ BitVec 32) (_ BitVec 64))) (size!19494 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39893)

(assert (=> b!694866 (= res!458876 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19494 a!3626))))))

(declare-fun b!694867 () Bool)

(declare-fun res!458894 () Bool)

(assert (=> b!694867 (=> (not res!458894) (not e!395208))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694867 (= res!458894 (validKeyInArray!0 k!2843))))

(declare-fun b!694868 () Bool)

(declare-fun e!395214 () Bool)

(declare-datatypes ((List!13150 0))(
  ( (Nil!13147) (Cons!13146 (h!14191 (_ BitVec 64)) (t!19429 List!13150)) )
))
(declare-fun acc!681 () List!13150)

(declare-fun contains!3727 (List!13150 (_ BitVec 64)) Bool)

(assert (=> b!694868 (= e!395214 (contains!3727 acc!681 k!2843))))

(declare-fun b!694869 () Bool)

(declare-fun res!458897 () Bool)

(declare-fun e!395207 () Bool)

(assert (=> b!694869 (=> (not res!458897) (not e!395207))))

(declare-fun lt!316960 () List!13150)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39893 (_ BitVec 32) List!13150) Bool)

(assert (=> b!694869 (= res!458897 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316960))))

(declare-fun b!694870 () Bool)

(declare-fun e!395215 () Bool)

(declare-fun e!395210 () Bool)

(assert (=> b!694870 (= e!395215 e!395210)))

(declare-fun res!458892 () Bool)

(assert (=> b!694870 (=> (not res!458892) (not e!395210))))

(assert (=> b!694870 (= res!458892 (bvsle from!3004 i!1382))))

(declare-fun b!694871 () Bool)

(declare-datatypes ((Unit!24554 0))(
  ( (Unit!24555) )
))
(declare-fun e!395213 () Unit!24554)

(declare-fun Unit!24556 () Unit!24554)

(assert (=> b!694871 (= e!395213 Unit!24556)))

(declare-fun b!694872 () Bool)

(declare-fun e!395209 () Bool)

(assert (=> b!694872 (= e!395209 (not (contains!3727 lt!316960 k!2843)))))

(declare-fun b!694873 () Bool)

(declare-fun res!458884 () Bool)

(assert (=> b!694873 (=> (not res!458884) (not e!395208))))

(assert (=> b!694873 (= res!458884 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13147))))

(declare-fun b!694874 () Bool)

(declare-fun e!395216 () Bool)

(assert (=> b!694874 (= e!395216 e!395207)))

(declare-fun res!458880 () Bool)

(assert (=> b!694874 (=> (not res!458880) (not e!395207))))

(assert (=> b!694874 (= res!458880 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!439 (List!13150 (_ BitVec 64)) List!13150)

(assert (=> b!694874 (= lt!316960 ($colon$colon!439 acc!681 (select (arr!19109 a!3626) from!3004)))))

(declare-fun b!694875 () Bool)

(assert (=> b!694875 (= e!395207 (not true))))

(assert (=> b!694875 (arrayNoDuplicates!0 (array!39894 (store (arr!19109 a!3626) i!1382 k!2843) (size!19494 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!316960)))

(declare-fun lt!316961 () Unit!24554)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39893 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13150) Unit!24554)

(assert (=> b!694875 (= lt!316961 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316960))))

(declare-fun res!458887 () Bool)

(assert (=> start!62052 (=> (not res!458887) (not e!395208))))

(assert (=> start!62052 (= res!458887 (and (bvslt (size!19494 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19494 a!3626))))))

(assert (=> start!62052 e!395208))

(assert (=> start!62052 true))

(declare-fun array_inv!14905 (array!39893) Bool)

(assert (=> start!62052 (array_inv!14905 a!3626)))

(declare-fun b!694876 () Bool)

(declare-fun res!458898 () Bool)

(assert (=> b!694876 (=> (not res!458898) (not e!395208))))

(assert (=> b!694876 (= res!458898 (not (contains!3727 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694877 () Bool)

(declare-fun res!458883 () Bool)

(assert (=> b!694877 (=> (not res!458883) (not e!395208))))

(assert (=> b!694877 (= res!458883 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19494 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694878 () Bool)

(declare-fun e!395217 () Bool)

(assert (=> b!694878 (= e!395217 (contains!3727 lt!316960 k!2843))))

(declare-fun b!694879 () Bool)

(declare-fun res!458886 () Bool)

(assert (=> b!694879 (=> (not res!458886) (not e!395208))))

(assert (=> b!694879 (= res!458886 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!694880 () Bool)

(declare-fun res!458885 () Bool)

(assert (=> b!694880 (=> (not res!458885) (not e!395208))))

(assert (=> b!694880 (= res!458885 e!395215)))

(declare-fun res!458891 () Bool)

(assert (=> b!694880 (=> res!458891 e!395215)))

(assert (=> b!694880 (= res!458891 e!395214)))

(declare-fun res!458881 () Bool)

(assert (=> b!694880 (=> (not res!458881) (not e!395214))))

(assert (=> b!694880 (= res!458881 (bvsgt from!3004 i!1382))))

(declare-fun b!694881 () Bool)

(declare-fun res!458893 () Bool)

(assert (=> b!694881 (=> (not res!458893) (not e!395208))))

(assert (=> b!694881 (= res!458893 (not (contains!3727 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694882 () Bool)

(declare-fun res!458900 () Bool)

(assert (=> b!694882 (=> (not res!458900) (not e!395207))))

(declare-fun e!395212 () Bool)

(assert (=> b!694882 (= res!458900 e!395212)))

(declare-fun res!458878 () Bool)

(assert (=> b!694882 (=> res!458878 e!395212)))

(assert (=> b!694882 (= res!458878 e!395217)))

(declare-fun res!458899 () Bool)

(assert (=> b!694882 (=> (not res!458899) (not e!395217))))

(assert (=> b!694882 (= res!458899 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694883 () Bool)

(declare-fun res!458889 () Bool)

(assert (=> b!694883 (=> (not res!458889) (not e!395208))))

(declare-fun noDuplicate!974 (List!13150) Bool)

(assert (=> b!694883 (= res!458889 (noDuplicate!974 acc!681))))

(declare-fun b!694884 () Bool)

(declare-fun res!458895 () Bool)

(assert (=> b!694884 (=> (not res!458895) (not e!395208))))

(assert (=> b!694884 (= res!458895 (validKeyInArray!0 (select (arr!19109 a!3626) from!3004)))))

(declare-fun b!694885 () Bool)

(assert (=> b!694885 (= e!395208 e!395216)))

(declare-fun res!458882 () Bool)

(assert (=> b!694885 (=> (not res!458882) (not e!395216))))

(assert (=> b!694885 (= res!458882 (not (= (select (arr!19109 a!3626) from!3004) k!2843)))))

(declare-fun lt!316963 () Unit!24554)

(assert (=> b!694885 (= lt!316963 e!395213)))

(declare-fun c!78362 () Bool)

(assert (=> b!694885 (= c!78362 (= (select (arr!19109 a!3626) from!3004) k!2843))))

(declare-fun b!694886 () Bool)

(declare-fun Unit!24557 () Unit!24554)

(assert (=> b!694886 (= e!395213 Unit!24557)))

(declare-fun arrayContainsKey!0 (array!39893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694886 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316962 () Unit!24554)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39893 (_ BitVec 64) (_ BitVec 32)) Unit!24554)

(assert (=> b!694886 (= lt!316962 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!694886 false))

(declare-fun b!694887 () Bool)

(assert (=> b!694887 (= e!395210 (not (contains!3727 acc!681 k!2843)))))

(declare-fun b!694888 () Bool)

(declare-fun res!458879 () Bool)

(assert (=> b!694888 (=> (not res!458879) (not e!395207))))

(assert (=> b!694888 (= res!458879 (noDuplicate!974 lt!316960))))

(declare-fun b!694889 () Bool)

(declare-fun res!458877 () Bool)

(assert (=> b!694889 (=> (not res!458877) (not e!395208))))

(assert (=> b!694889 (= res!458877 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694890 () Bool)

(assert (=> b!694890 (= e!395212 e!395209)))

(declare-fun res!458896 () Bool)

(assert (=> b!694890 (=> (not res!458896) (not e!395209))))

(assert (=> b!694890 (= res!458896 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694891 () Bool)

(declare-fun res!458890 () Bool)

(assert (=> b!694891 (=> (not res!458890) (not e!395207))))

(assert (=> b!694891 (= res!458890 (not (contains!3727 lt!316960 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694892 () Bool)

(declare-fun res!458888 () Bool)

(assert (=> b!694892 (=> (not res!458888) (not e!395207))))

(assert (=> b!694892 (= res!458888 (not (contains!3727 lt!316960 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62052 res!458887) b!694883))

(assert (= (and b!694883 res!458889) b!694881))

(assert (= (and b!694881 res!458893) b!694876))

(assert (= (and b!694876 res!458898) b!694880))

(assert (= (and b!694880 res!458881) b!694868))

(assert (= (and b!694880 (not res!458891)) b!694870))

(assert (= (and b!694870 res!458892) b!694887))

(assert (= (and b!694880 res!458885) b!694873))

(assert (= (and b!694873 res!458884) b!694879))

(assert (= (and b!694879 res!458886) b!694866))

(assert (= (and b!694866 res!458876) b!694867))

(assert (= (and b!694867 res!458894) b!694889))

(assert (= (and b!694889 res!458877) b!694877))

(assert (= (and b!694877 res!458883) b!694884))

(assert (= (and b!694884 res!458895) b!694885))

(assert (= (and b!694885 c!78362) b!694886))

(assert (= (and b!694885 (not c!78362)) b!694871))

(assert (= (and b!694885 res!458882) b!694874))

(assert (= (and b!694874 res!458880) b!694888))

(assert (= (and b!694888 res!458879) b!694892))

(assert (= (and b!694892 res!458888) b!694891))

(assert (= (and b!694891 res!458890) b!694882))

(assert (= (and b!694882 res!458899) b!694878))

(assert (= (and b!694882 (not res!458878)) b!694890))

(assert (= (and b!694890 res!458896) b!694872))

(assert (= (and b!694882 res!458900) b!694869))

(assert (= (and b!694869 res!458897) b!694875))

(declare-fun m!656481 () Bool)

(assert (=> b!694868 m!656481))

(declare-fun m!656483 () Bool)

(assert (=> b!694876 m!656483))

(declare-fun m!656485 () Bool)

(assert (=> b!694888 m!656485))

(declare-fun m!656487 () Bool)

(assert (=> b!694867 m!656487))

(declare-fun m!656489 () Bool)

(assert (=> b!694869 m!656489))

(declare-fun m!656491 () Bool)

(assert (=> b!694892 m!656491))

(declare-fun m!656493 () Bool)

(assert (=> b!694886 m!656493))

(declare-fun m!656495 () Bool)

(assert (=> b!694886 m!656495))

(declare-fun m!656497 () Bool)

(assert (=> start!62052 m!656497))

(assert (=> b!694887 m!656481))

(declare-fun m!656499 () Bool)

(assert (=> b!694881 m!656499))

(declare-fun m!656501 () Bool)

(assert (=> b!694878 m!656501))

(declare-fun m!656503 () Bool)

(assert (=> b!694891 m!656503))

(declare-fun m!656505 () Bool)

(assert (=> b!694874 m!656505))

(assert (=> b!694874 m!656505))

(declare-fun m!656507 () Bool)

(assert (=> b!694874 m!656507))

(declare-fun m!656509 () Bool)

(assert (=> b!694879 m!656509))

(declare-fun m!656511 () Bool)

(assert (=> b!694883 m!656511))

(assert (=> b!694885 m!656505))

(declare-fun m!656513 () Bool)

(assert (=> b!694873 m!656513))

(assert (=> b!694872 m!656501))

(declare-fun m!656515 () Bool)

(assert (=> b!694875 m!656515))

(declare-fun m!656517 () Bool)

(assert (=> b!694875 m!656517))

(declare-fun m!656519 () Bool)

(assert (=> b!694875 m!656519))

(declare-fun m!656521 () Bool)

(assert (=> b!694889 m!656521))

(assert (=> b!694884 m!656505))

(assert (=> b!694884 m!656505))

(declare-fun m!656523 () Bool)

(assert (=> b!694884 m!656523))

(push 1)

