; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60162 () Bool)

(assert start!60162)

(declare-fun b!671950 () Bool)

(declare-fun res!438627 () Bool)

(declare-fun e!383940 () Bool)

(assert (=> b!671950 (=> (not res!438627) (not e!383940))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39209 0))(
  ( (array!39210 (arr!18797 (Array (_ BitVec 32) (_ BitVec 64))) (size!19161 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39209)

(assert (=> b!671950 (= res!438627 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19161 a!3626))))))

(declare-fun b!671951 () Bool)

(declare-fun e!383941 () Bool)

(declare-datatypes ((List!12838 0))(
  ( (Nil!12835) (Cons!12834 (h!13879 (_ BitVec 64)) (t!19066 List!12838)) )
))
(declare-fun acc!681 () List!12838)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3415 (List!12838 (_ BitVec 64)) Bool)

(assert (=> b!671951 (= e!383941 (contains!3415 acc!681 k!2843))))

(declare-fun b!671952 () Bool)

(declare-fun res!438619 () Bool)

(assert (=> b!671952 (=> (not res!438619) (not e!383940))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!671952 (= res!438619 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19161 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671953 () Bool)

(declare-fun res!438634 () Bool)

(declare-fun e!383934 () Bool)

(assert (=> b!671953 (=> (not res!438634) (not e!383934))))

(declare-fun lt!312238 () List!12838)

(declare-fun noDuplicate!662 (List!12838) Bool)

(assert (=> b!671953 (= res!438634 (noDuplicate!662 lt!312238))))

(declare-fun b!671954 () Bool)

(declare-fun e!383933 () Bool)

(assert (=> b!671954 (= e!383940 e!383933)))

(declare-fun res!438632 () Bool)

(assert (=> b!671954 (=> (not res!438632) (not e!383933))))

(assert (=> b!671954 (= res!438632 (not (= (select (arr!18797 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!23600 0))(
  ( (Unit!23601) )
))
(declare-fun lt!312237 () Unit!23600)

(declare-fun e!383936 () Unit!23600)

(assert (=> b!671954 (= lt!312237 e!383936)))

(declare-fun c!77036 () Bool)

(assert (=> b!671954 (= c!77036 (= (select (arr!18797 a!3626) from!3004) k!2843))))

(declare-fun b!671955 () Bool)

(declare-fun res!438612 () Bool)

(assert (=> b!671955 (=> (not res!438612) (not e!383934))))

(declare-fun e!383938 () Bool)

(assert (=> b!671955 (= res!438612 e!383938)))

(declare-fun res!438613 () Bool)

(assert (=> b!671955 (=> res!438613 e!383938)))

(declare-fun e!383937 () Bool)

(assert (=> b!671955 (= res!438613 e!383937)))

(declare-fun res!438620 () Bool)

(assert (=> b!671955 (=> (not res!438620) (not e!383937))))

(assert (=> b!671955 (= res!438620 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671956 () Bool)

(declare-fun res!438630 () Bool)

(assert (=> b!671956 (=> (not res!438630) (not e!383934))))

(assert (=> b!671956 (= res!438630 (not (contains!3415 lt!312238 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671957 () Bool)

(declare-fun res!438624 () Bool)

(assert (=> b!671957 (=> (not res!438624) (not e!383940))))

(declare-fun arrayContainsKey!0 (array!39209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671957 (= res!438624 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671958 () Bool)

(declare-fun res!438628 () Bool)

(assert (=> b!671958 (=> (not res!438628) (not e!383940))))

(assert (=> b!671958 (= res!438628 (not (contains!3415 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!438622 () Bool)

(assert (=> start!60162 (=> (not res!438622) (not e!383940))))

(assert (=> start!60162 (= res!438622 (and (bvslt (size!19161 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19161 a!3626))))))

(assert (=> start!60162 e!383940))

(assert (=> start!60162 true))

(declare-fun array_inv!14593 (array!39209) Bool)

(assert (=> start!60162 (array_inv!14593 a!3626)))

(declare-fun b!671959 () Bool)

(declare-fun res!438615 () Bool)

(assert (=> b!671959 (=> (not res!438615) (not e!383940))))

(declare-fun arrayNoDuplicates!0 (array!39209 (_ BitVec 32) List!12838) Bool)

(assert (=> b!671959 (= res!438615 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12835))))

(declare-fun b!671960 () Bool)

(declare-fun res!438621 () Bool)

(assert (=> b!671960 (=> (not res!438621) (not e!383940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671960 (= res!438621 (validKeyInArray!0 (select (arr!18797 a!3626) from!3004)))))

(declare-fun b!671961 () Bool)

(declare-fun Unit!23602 () Unit!23600)

(assert (=> b!671961 (= e!383936 Unit!23602)))

(declare-fun b!671962 () Bool)

(declare-fun res!438616 () Bool)

(assert (=> b!671962 (=> (not res!438616) (not e!383940))))

(declare-fun e!383943 () Bool)

(assert (=> b!671962 (= res!438616 e!383943)))

(declare-fun res!438625 () Bool)

(assert (=> b!671962 (=> res!438625 e!383943)))

(assert (=> b!671962 (= res!438625 e!383941)))

(declare-fun res!438614 () Bool)

(assert (=> b!671962 (=> (not res!438614) (not e!383941))))

(assert (=> b!671962 (= res!438614 (bvsgt from!3004 i!1382))))

(declare-fun b!671963 () Bool)

(assert (=> b!671963 (= e!383933 e!383934)))

(declare-fun res!438626 () Bool)

(assert (=> b!671963 (=> (not res!438626) (not e!383934))))

(assert (=> b!671963 (= res!438626 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!265 (List!12838 (_ BitVec 64)) List!12838)

(assert (=> b!671963 (= lt!312238 ($colon$colon!265 acc!681 (select (arr!18797 a!3626) from!3004)))))

(declare-fun b!671964 () Bool)

(assert (=> b!671964 (= e!383937 (contains!3415 lt!312238 k!2843))))

(declare-fun b!671965 () Bool)

(declare-fun res!438635 () Bool)

(assert (=> b!671965 (=> (not res!438635) (not e!383940))))

(assert (=> b!671965 (= res!438635 (noDuplicate!662 acc!681))))

(declare-fun b!671966 () Bool)

(declare-fun e!383939 () Bool)

(assert (=> b!671966 (= e!383939 (not (contains!3415 lt!312238 k!2843)))))

(declare-fun b!671967 () Bool)

(declare-fun res!438629 () Bool)

(assert (=> b!671967 (=> (not res!438629) (not e!383940))))

(assert (=> b!671967 (= res!438629 (validKeyInArray!0 k!2843))))

(declare-fun b!671968 () Bool)

(declare-fun res!438617 () Bool)

(assert (=> b!671968 (=> (not res!438617) (not e!383940))))

(assert (=> b!671968 (= res!438617 (not (contains!3415 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671969 () Bool)

(declare-fun Unit!23603 () Unit!23600)

(assert (=> b!671969 (= e!383936 Unit!23603)))

(assert (=> b!671969 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312236 () Unit!23600)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39209 (_ BitVec 64) (_ BitVec 32)) Unit!23600)

(assert (=> b!671969 (= lt!312236 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!671969 false))

(declare-fun b!671970 () Bool)

(assert (=> b!671970 (= e!383938 e!383939)))

(declare-fun res!438633 () Bool)

(assert (=> b!671970 (=> (not res!438633) (not e!383939))))

(assert (=> b!671970 (= res!438633 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671971 () Bool)

(assert (=> b!671971 (= e!383934 false)))

(declare-fun lt!312235 () Bool)

(assert (=> b!671971 (= lt!312235 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312238))))

(declare-fun b!671972 () Bool)

(declare-fun res!438631 () Bool)

(assert (=> b!671972 (=> (not res!438631) (not e!383934))))

(assert (=> b!671972 (= res!438631 (not (contains!3415 lt!312238 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671973 () Bool)

(declare-fun e!383942 () Bool)

(assert (=> b!671973 (= e!383943 e!383942)))

(declare-fun res!438618 () Bool)

(assert (=> b!671973 (=> (not res!438618) (not e!383942))))

(assert (=> b!671973 (= res!438618 (bvsle from!3004 i!1382))))

(declare-fun b!671974 () Bool)

(declare-fun res!438623 () Bool)

(assert (=> b!671974 (=> (not res!438623) (not e!383940))))

(assert (=> b!671974 (= res!438623 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671975 () Bool)

(assert (=> b!671975 (= e!383942 (not (contains!3415 acc!681 k!2843)))))

(assert (= (and start!60162 res!438622) b!671965))

(assert (= (and b!671965 res!438635) b!671958))

(assert (= (and b!671958 res!438628) b!671968))

(assert (= (and b!671968 res!438617) b!671962))

(assert (= (and b!671962 res!438614) b!671951))

(assert (= (and b!671962 (not res!438625)) b!671973))

(assert (= (and b!671973 res!438618) b!671975))

(assert (= (and b!671962 res!438616) b!671959))

(assert (= (and b!671959 res!438615) b!671974))

(assert (= (and b!671974 res!438623) b!671950))

(assert (= (and b!671950 res!438627) b!671967))

(assert (= (and b!671967 res!438629) b!671957))

(assert (= (and b!671957 res!438624) b!671952))

(assert (= (and b!671952 res!438619) b!671960))

(assert (= (and b!671960 res!438621) b!671954))

(assert (= (and b!671954 c!77036) b!671969))

(assert (= (and b!671954 (not c!77036)) b!671961))

(assert (= (and b!671954 res!438632) b!671963))

(assert (= (and b!671963 res!438626) b!671953))

(assert (= (and b!671953 res!438634) b!671972))

(assert (= (and b!671972 res!438631) b!671956))

(assert (= (and b!671956 res!438630) b!671955))

(assert (= (and b!671955 res!438620) b!671964))

(assert (= (and b!671955 (not res!438613)) b!671970))

(assert (= (and b!671970 res!438633) b!671966))

(assert (= (and b!671955 res!438612) b!671971))

(declare-fun m!641163 () Bool)

(assert (=> b!671957 m!641163))

(declare-fun m!641165 () Bool)

(assert (=> b!671963 m!641165))

(assert (=> b!671963 m!641165))

(declare-fun m!641167 () Bool)

(assert (=> b!671963 m!641167))

(declare-fun m!641169 () Bool)

(assert (=> b!671974 m!641169))

(assert (=> b!671954 m!641165))

(declare-fun m!641171 () Bool)

(assert (=> b!671966 m!641171))

(declare-fun m!641173 () Bool)

(assert (=> b!671958 m!641173))

(declare-fun m!641175 () Bool)

(assert (=> b!671959 m!641175))

(declare-fun m!641177 () Bool)

(assert (=> b!671975 m!641177))

(declare-fun m!641179 () Bool)

(assert (=> b!671972 m!641179))

(declare-fun m!641181 () Bool)

(assert (=> b!671956 m!641181))

(declare-fun m!641183 () Bool)

(assert (=> b!671965 m!641183))

(declare-fun m!641185 () Bool)

(assert (=> b!671953 m!641185))

(declare-fun m!641187 () Bool)

(assert (=> start!60162 m!641187))

(assert (=> b!671960 m!641165))

(assert (=> b!671960 m!641165))

(declare-fun m!641189 () Bool)

(assert (=> b!671960 m!641189))

(assert (=> b!671951 m!641177))

(declare-fun m!641191 () Bool)

(assert (=> b!671971 m!641191))

(declare-fun m!641193 () Bool)

(assert (=> b!671967 m!641193))

(declare-fun m!641195 () Bool)

(assert (=> b!671969 m!641195))

(declare-fun m!641197 () Bool)

(assert (=> b!671969 m!641197))

(declare-fun m!641199 () Bool)

(assert (=> b!671968 m!641199))

(assert (=> b!671964 m!641171))

(push 1)

