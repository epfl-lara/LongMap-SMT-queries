; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62106 () Bool)

(assert start!62106)

(declare-fun b!694928 () Bool)

(declare-fun res!458849 () Bool)

(declare-fun e!395289 () Bool)

(assert (=> b!694928 (=> (not res!458849) (not e!395289))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39885 0))(
  ( (array!39886 (arr!19102 (Array (_ BitVec 32) (_ BitVec 64))) (size!19485 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39885)

(assert (=> b!694928 (= res!458849 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19485 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694929 () Bool)

(declare-datatypes ((Unit!24525 0))(
  ( (Unit!24526) )
))
(declare-fun e!395285 () Unit!24525)

(declare-fun Unit!24527 () Unit!24525)

(assert (=> b!694929 (= e!395285 Unit!24527)))

(declare-fun res!458844 () Bool)

(assert (=> start!62106 (=> (not res!458844) (not e!395289))))

(assert (=> start!62106 (= res!458844 (and (bvslt (size!19485 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19485 a!3626))))))

(assert (=> start!62106 e!395289))

(assert (=> start!62106 true))

(declare-fun array_inv!14961 (array!39885) Bool)

(assert (=> start!62106 (array_inv!14961 a!3626)))

(declare-fun b!694930 () Bool)

(declare-fun res!458853 () Bool)

(assert (=> b!694930 (=> (not res!458853) (not e!395289))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694930 (= res!458853 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694931 () Bool)

(declare-fun e!395283 () Bool)

(declare-datatypes ((List!13050 0))(
  ( (Nil!13047) (Cons!13046 (h!14094 (_ BitVec 64)) (t!19321 List!13050)) )
))
(declare-fun lt!317040 () List!13050)

(declare-fun contains!3702 (List!13050 (_ BitVec 64)) Bool)

(assert (=> b!694931 (= e!395283 (contains!3702 lt!317040 k0!2843))))

(declare-fun b!694932 () Bool)

(declare-fun e!395290 () Bool)

(assert (=> b!694932 (= e!395289 e!395290)))

(declare-fun res!458858 () Bool)

(assert (=> b!694932 (=> (not res!458858) (not e!395290))))

(assert (=> b!694932 (= res!458858 (not (= (select (arr!19102 a!3626) from!3004) k0!2843)))))

(declare-fun lt!317041 () Unit!24525)

(assert (=> b!694932 (= lt!317041 e!395285)))

(declare-fun c!78413 () Bool)

(assert (=> b!694932 (= c!78413 (= (select (arr!19102 a!3626) from!3004) k0!2843))))

(declare-fun b!694933 () Bool)

(declare-fun e!395284 () Bool)

(declare-fun acc!681 () List!13050)

(assert (=> b!694933 (= e!395284 (not (contains!3702 acc!681 k0!2843)))))

(declare-fun b!694934 () Bool)

(declare-fun e!395292 () Bool)

(assert (=> b!694934 (= e!395292 (not (contains!3702 lt!317040 k0!2843)))))

(declare-fun b!694935 () Bool)

(declare-fun res!458855 () Bool)

(declare-fun e!395287 () Bool)

(assert (=> b!694935 (=> (not res!458855) (not e!395287))))

(assert (=> b!694935 (= res!458855 (not (contains!3702 lt!317040 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694936 () Bool)

(declare-fun e!395286 () Bool)

(assert (=> b!694936 (= e!395286 (contains!3702 acc!681 k0!2843))))

(declare-fun b!694937 () Bool)

(declare-fun e!395291 () Bool)

(assert (=> b!694937 (= e!395291 e!395292)))

(declare-fun res!458856 () Bool)

(assert (=> b!694937 (=> (not res!458856) (not e!395292))))

(assert (=> b!694937 (= res!458856 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694938 () Bool)

(declare-fun res!458857 () Bool)

(assert (=> b!694938 (=> (not res!458857) (not e!395289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694938 (= res!458857 (validKeyInArray!0 (select (arr!19102 a!3626) from!3004)))))

(declare-fun b!694939 () Bool)

(declare-fun res!458850 () Bool)

(assert (=> b!694939 (=> (not res!458850) (not e!395287))))

(declare-fun noDuplicate!976 (List!13050) Bool)

(assert (=> b!694939 (= res!458850 (noDuplicate!976 lt!317040))))

(declare-fun b!694940 () Bool)

(declare-fun res!458859 () Bool)

(assert (=> b!694940 (=> (not res!458859) (not e!395289))))

(assert (=> b!694940 (= res!458859 (not (contains!3702 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694941 () Bool)

(declare-fun Unit!24528 () Unit!24525)

(assert (=> b!694941 (= e!395285 Unit!24528)))

(assert (=> b!694941 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!317039 () Unit!24525)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39885 (_ BitVec 64) (_ BitVec 32)) Unit!24525)

(assert (=> b!694941 (= lt!317039 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!694941 false))

(declare-fun b!694942 () Bool)

(declare-fun e!395282 () Bool)

(assert (=> b!694942 (= e!395282 e!395284)))

(declare-fun res!458860 () Bool)

(assert (=> b!694942 (=> (not res!458860) (not e!395284))))

(assert (=> b!694942 (= res!458860 (bvsle from!3004 i!1382))))

(declare-fun b!694943 () Bool)

(declare-fun res!458841 () Bool)

(assert (=> b!694943 (=> (not res!458841) (not e!395287))))

(declare-fun arrayNoDuplicates!0 (array!39885 (_ BitVec 32) List!13050) Bool)

(assert (=> b!694943 (= res!458841 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!317040))))

(declare-fun b!694944 () Bool)

(assert (=> b!694944 (= e!395290 e!395287)))

(declare-fun res!458839 () Bool)

(assert (=> b!694944 (=> (not res!458839) (not e!395287))))

(assert (=> b!694944 (= res!458839 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!434 (List!13050 (_ BitVec 64)) List!13050)

(assert (=> b!694944 (= lt!317040 ($colon$colon!434 acc!681 (select (arr!19102 a!3626) from!3004)))))

(declare-fun b!694945 () Bool)

(declare-fun res!458842 () Bool)

(assert (=> b!694945 (=> (not res!458842) (not e!395289))))

(assert (=> b!694945 (= res!458842 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13047))))

(declare-fun b!694946 () Bool)

(declare-fun res!458861 () Bool)

(assert (=> b!694946 (=> (not res!458861) (not e!395287))))

(assert (=> b!694946 (= res!458861 (not (contains!3702 lt!317040 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694947 () Bool)

(declare-fun res!458846 () Bool)

(assert (=> b!694947 (=> (not res!458846) (not e!395289))))

(assert (=> b!694947 (= res!458846 (noDuplicate!976 acc!681))))

(declare-fun b!694948 () Bool)

(declare-fun res!458843 () Bool)

(assert (=> b!694948 (=> (not res!458843) (not e!395287))))

(assert (=> b!694948 (= res!458843 e!395291)))

(declare-fun res!458851 () Bool)

(assert (=> b!694948 (=> res!458851 e!395291)))

(assert (=> b!694948 (= res!458851 e!395283)))

(declare-fun res!458863 () Bool)

(assert (=> b!694948 (=> (not res!458863) (not e!395283))))

(assert (=> b!694948 (= res!458863 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694949 () Bool)

(assert (=> b!694949 (= e!395287 (not true))))

(assert (=> b!694949 (arrayNoDuplicates!0 (array!39886 (store (arr!19102 a!3626) i!1382 k0!2843) (size!19485 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!317040)))

(declare-fun lt!317038 () Unit!24525)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39885 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13050) Unit!24525)

(assert (=> b!694949 (= lt!317038 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!317040))))

(declare-fun b!694950 () Bool)

(declare-fun res!458852 () Bool)

(assert (=> b!694950 (=> (not res!458852) (not e!395289))))

(assert (=> b!694950 (= res!458852 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!694951 () Bool)

(declare-fun res!458840 () Bool)

(assert (=> b!694951 (=> (not res!458840) (not e!395289))))

(assert (=> b!694951 (= res!458840 (validKeyInArray!0 k0!2843))))

(declare-fun b!694952 () Bool)

(declare-fun res!458847 () Bool)

(assert (=> b!694952 (=> (not res!458847) (not e!395289))))

(assert (=> b!694952 (= res!458847 e!395282)))

(declare-fun res!458862 () Bool)

(assert (=> b!694952 (=> res!458862 e!395282)))

(assert (=> b!694952 (= res!458862 e!395286)))

(declare-fun res!458854 () Bool)

(assert (=> b!694952 (=> (not res!458854) (not e!395286))))

(assert (=> b!694952 (= res!458854 (bvsgt from!3004 i!1382))))

(declare-fun b!694953 () Bool)

(declare-fun res!458845 () Bool)

(assert (=> b!694953 (=> (not res!458845) (not e!395289))))

(assert (=> b!694953 (= res!458845 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19485 a!3626))))))

(declare-fun b!694954 () Bool)

(declare-fun res!458848 () Bool)

(assert (=> b!694954 (=> (not res!458848) (not e!395289))))

(assert (=> b!694954 (= res!458848 (not (contains!3702 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62106 res!458844) b!694947))

(assert (= (and b!694947 res!458846) b!694940))

(assert (= (and b!694940 res!458859) b!694954))

(assert (= (and b!694954 res!458848) b!694952))

(assert (= (and b!694952 res!458854) b!694936))

(assert (= (and b!694952 (not res!458862)) b!694942))

(assert (= (and b!694942 res!458860) b!694933))

(assert (= (and b!694952 res!458847) b!694945))

(assert (= (and b!694945 res!458842) b!694950))

(assert (= (and b!694950 res!458852) b!694953))

(assert (= (and b!694953 res!458845) b!694951))

(assert (= (and b!694951 res!458840) b!694930))

(assert (= (and b!694930 res!458853) b!694928))

(assert (= (and b!694928 res!458849) b!694938))

(assert (= (and b!694938 res!458857) b!694932))

(assert (= (and b!694932 c!78413) b!694941))

(assert (= (and b!694932 (not c!78413)) b!694929))

(assert (= (and b!694932 res!458858) b!694944))

(assert (= (and b!694944 res!458839) b!694939))

(assert (= (and b!694939 res!458850) b!694946))

(assert (= (and b!694946 res!458861) b!694935))

(assert (= (and b!694935 res!458855) b!694948))

(assert (= (and b!694948 res!458863) b!694931))

(assert (= (and b!694948 (not res!458851)) b!694937))

(assert (= (and b!694937 res!458856) b!694934))

(assert (= (and b!694948 res!458843) b!694943))

(assert (= (and b!694943 res!458841) b!694949))

(declare-fun m!657091 () Bool)

(assert (=> b!694951 m!657091))

(declare-fun m!657093 () Bool)

(assert (=> b!694944 m!657093))

(assert (=> b!694944 m!657093))

(declare-fun m!657095 () Bool)

(assert (=> b!694944 m!657095))

(declare-fun m!657097 () Bool)

(assert (=> b!694954 m!657097))

(declare-fun m!657099 () Bool)

(assert (=> b!694943 m!657099))

(declare-fun m!657101 () Bool)

(assert (=> b!694946 m!657101))

(assert (=> b!694938 m!657093))

(assert (=> b!694938 m!657093))

(declare-fun m!657103 () Bool)

(assert (=> b!694938 m!657103))

(assert (=> b!694932 m!657093))

(declare-fun m!657105 () Bool)

(assert (=> b!694940 m!657105))

(declare-fun m!657107 () Bool)

(assert (=> b!694933 m!657107))

(declare-fun m!657109 () Bool)

(assert (=> b!694931 m!657109))

(declare-fun m!657111 () Bool)

(assert (=> b!694935 m!657111))

(declare-fun m!657113 () Bool)

(assert (=> b!694949 m!657113))

(declare-fun m!657115 () Bool)

(assert (=> b!694949 m!657115))

(declare-fun m!657117 () Bool)

(assert (=> b!694949 m!657117))

(assert (=> b!694936 m!657107))

(declare-fun m!657119 () Bool)

(assert (=> b!694930 m!657119))

(declare-fun m!657121 () Bool)

(assert (=> start!62106 m!657121))

(declare-fun m!657123 () Bool)

(assert (=> b!694939 m!657123))

(declare-fun m!657125 () Bool)

(assert (=> b!694947 m!657125))

(declare-fun m!657127 () Bool)

(assert (=> b!694941 m!657127))

(declare-fun m!657129 () Bool)

(assert (=> b!694941 m!657129))

(declare-fun m!657131 () Bool)

(assert (=> b!694950 m!657131))

(declare-fun m!657133 () Bool)

(assert (=> b!694945 m!657133))

(assert (=> b!694934 m!657109))

(check-sat (not b!694940) (not b!694935) (not b!694954) (not b!694943) (not b!694945) (not b!694931) (not b!694946) (not b!694950) (not b!694936) (not b!694939) (not b!694949) (not start!62106) (not b!694930) (not b!694941) (not b!694947) (not b!694938) (not b!694951) (not b!694934) (not b!694944) (not b!694933))
(check-sat)
