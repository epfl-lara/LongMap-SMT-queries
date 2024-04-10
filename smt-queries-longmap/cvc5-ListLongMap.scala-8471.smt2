; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103128 () Bool)

(assert start!103128)

(declare-fun b!1238301 () Bool)

(declare-fun res!826027 () Bool)

(declare-fun e!701794 () Bool)

(assert (=> b!1238301 (=> res!826027 e!701794)))

(declare-datatypes ((List!27283 0))(
  ( (Nil!27280) (Cons!27279 (h!28488 (_ BitVec 64)) (t!40746 List!27283)) )
))
(declare-fun lt!561269 () List!27283)

(declare-fun contains!7345 (List!27283 (_ BitVec 64)) Bool)

(assert (=> b!1238301 (= res!826027 (contains!7345 lt!561269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238302 () Bool)

(declare-fun res!826035 () Bool)

(assert (=> b!1238302 (=> res!826035 e!701794)))

(assert (=> b!1238302 (= res!826035 (contains!7345 lt!561269 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238303 () Bool)

(declare-fun res!826031 () Bool)

(declare-fun e!701795 () Bool)

(assert (=> b!1238303 (=> (not res!826031) (not e!701795))))

(declare-fun acc!846 () List!27283)

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238303 (= res!826031 (contains!7345 acc!846 k!2925))))

(declare-fun b!1238304 () Bool)

(declare-fun res!826026 () Bool)

(assert (=> b!1238304 (=> (not res!826026) (not e!701795))))

(declare-datatypes ((array!79814 0))(
  ( (array!79815 (arr!38510 (Array (_ BitVec 32) (_ BitVec 64))) (size!39046 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79814)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79814 (_ BitVec 32) List!27283) Bool)

(assert (=> b!1238304 (= res!826026 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238305 () Bool)

(assert (=> b!1238305 (= e!701795 (not e!701794))))

(declare-fun res!826028 () Bool)

(assert (=> b!1238305 (=> res!826028 e!701794)))

(assert (=> b!1238305 (= res!826028 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!599 (List!27283 List!27283) Bool)

(assert (=> b!1238305 (subseq!599 acc!846 lt!561269)))

(declare-datatypes ((Unit!41106 0))(
  ( (Unit!41107) )
))
(declare-fun lt!561266 () Unit!41106)

(declare-fun subseqTail!86 (List!27283 List!27283) Unit!41106)

(assert (=> b!1238305 (= lt!561266 (subseqTail!86 lt!561269 lt!561269))))

(assert (=> b!1238305 (subseq!599 lt!561269 lt!561269)))

(declare-fun lt!561268 () Unit!41106)

(declare-fun lemmaListSubSeqRefl!0 (List!27283) Unit!41106)

(assert (=> b!1238305 (= lt!561268 (lemmaListSubSeqRefl!0 lt!561269))))

(assert (=> b!1238305 (= lt!561269 (Cons!27279 (select (arr!38510 a!3835) from!3213) acc!846))))

(declare-fun b!1238306 () Bool)

(declare-fun res!826036 () Bool)

(assert (=> b!1238306 (=> res!826036 e!701794)))

(declare-fun noDuplicate!1942 (List!27283) Bool)

(assert (=> b!1238306 (= res!826036 (not (noDuplicate!1942 lt!561269)))))

(declare-fun b!1238307 () Bool)

(declare-fun res!826025 () Bool)

(assert (=> b!1238307 (=> (not res!826025) (not e!701795))))

(assert (=> b!1238307 (= res!826025 (not (contains!7345 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238309 () Bool)

(declare-fun res!826032 () Bool)

(assert (=> b!1238309 (=> (not res!826032) (not e!701795))))

(assert (=> b!1238309 (= res!826032 (not (= from!3213 (bvsub (size!39046 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238310 () Bool)

(assert (=> b!1238310 (= e!701794 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!561269))))

(declare-fun lt!561267 () Unit!41106)

(declare-fun noDuplicateSubseq!80 (List!27283 List!27283) Unit!41106)

(assert (=> b!1238310 (= lt!561267 (noDuplicateSubseq!80 acc!846 lt!561269))))

(declare-fun b!1238311 () Bool)

(declare-fun res!826034 () Bool)

(assert (=> b!1238311 (=> (not res!826034) (not e!701795))))

(assert (=> b!1238311 (= res!826034 (not (contains!7345 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238312 () Bool)

(declare-fun res!826033 () Bool)

(assert (=> b!1238312 (=> (not res!826033) (not e!701795))))

(assert (=> b!1238312 (= res!826033 (noDuplicate!1942 acc!846))))

(declare-fun res!826030 () Bool)

(assert (=> start!103128 (=> (not res!826030) (not e!701795))))

(assert (=> start!103128 (= res!826030 (and (bvslt (size!39046 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39046 a!3835))))))

(assert (=> start!103128 e!701795))

(declare-fun array_inv!29358 (array!79814) Bool)

(assert (=> start!103128 (array_inv!29358 a!3835)))

(assert (=> start!103128 true))

(declare-fun b!1238308 () Bool)

(declare-fun res!826029 () Bool)

(assert (=> b!1238308 (=> (not res!826029) (not e!701795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238308 (= res!826029 (validKeyInArray!0 (select (arr!38510 a!3835) from!3213)))))

(assert (= (and start!103128 res!826030) b!1238312))

(assert (= (and b!1238312 res!826033) b!1238311))

(assert (= (and b!1238311 res!826034) b!1238307))

(assert (= (and b!1238307 res!826025) b!1238304))

(assert (= (and b!1238304 res!826026) b!1238303))

(assert (= (and b!1238303 res!826031) b!1238309))

(assert (= (and b!1238309 res!826032) b!1238308))

(assert (= (and b!1238308 res!826029) b!1238305))

(assert (= (and b!1238305 (not res!826028)) b!1238306))

(assert (= (and b!1238306 (not res!826036)) b!1238301))

(assert (= (and b!1238301 (not res!826027)) b!1238302))

(assert (= (and b!1238302 (not res!826035)) b!1238310))

(declare-fun m!1141855 () Bool)

(assert (=> b!1238307 m!1141855))

(declare-fun m!1141857 () Bool)

(assert (=> b!1238312 m!1141857))

(declare-fun m!1141859 () Bool)

(assert (=> b!1238301 m!1141859))

(declare-fun m!1141861 () Bool)

(assert (=> b!1238304 m!1141861))

(declare-fun m!1141863 () Bool)

(assert (=> b!1238302 m!1141863))

(declare-fun m!1141865 () Bool)

(assert (=> b!1238306 m!1141865))

(declare-fun m!1141867 () Bool)

(assert (=> b!1238305 m!1141867))

(declare-fun m!1141869 () Bool)

(assert (=> b!1238305 m!1141869))

(declare-fun m!1141871 () Bool)

(assert (=> b!1238305 m!1141871))

(declare-fun m!1141873 () Bool)

(assert (=> b!1238305 m!1141873))

(declare-fun m!1141875 () Bool)

(assert (=> b!1238305 m!1141875))

(assert (=> b!1238308 m!1141869))

(assert (=> b!1238308 m!1141869))

(declare-fun m!1141877 () Bool)

(assert (=> b!1238308 m!1141877))

(declare-fun m!1141879 () Bool)

(assert (=> b!1238303 m!1141879))

(declare-fun m!1141881 () Bool)

(assert (=> b!1238310 m!1141881))

(declare-fun m!1141883 () Bool)

(assert (=> b!1238310 m!1141883))

(declare-fun m!1141885 () Bool)

(assert (=> b!1238311 m!1141885))

(declare-fun m!1141887 () Bool)

(assert (=> start!103128 m!1141887))

(push 1)

(assert (not b!1238307))

(assert (not b!1238311))

(assert (not b!1238310))

(assert (not b!1238306))

(assert (not b!1238302))

(assert (not b!1238304))

(assert (not start!103128))

(assert (not b!1238305))

(assert (not b!1238312))

(assert (not b!1238303))

(assert (not b!1238308))

(assert (not b!1238301))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!135859 () Bool)

(declare-fun res!826133 () Bool)

(declare-fun e!701839 () Bool)

(assert (=> d!135859 (=> res!826133 e!701839)))

(assert (=> d!135859 (= res!826133 (is-Nil!27280 acc!846))))

(assert (=> d!135859 (= (noDuplicate!1942 acc!846) e!701839)))

(declare-fun b!1238409 () Bool)

(declare-fun e!701840 () Bool)

(assert (=> b!1238409 (= e!701839 e!701840)))

(declare-fun res!826134 () Bool)

(assert (=> b!1238409 (=> (not res!826134) (not e!701840))))

(assert (=> b!1238409 (= res!826134 (not (contains!7345 (t!40746 acc!846) (h!28488 acc!846))))))

(declare-fun b!1238410 () Bool)

(assert (=> b!1238410 (= e!701840 (noDuplicate!1942 (t!40746 acc!846)))))

(assert (= (and d!135859 (not res!826133)) b!1238409))

(assert (= (and b!1238409 res!826134) b!1238410))

(declare-fun m!1141973 () Bool)

(assert (=> b!1238409 m!1141973))

(declare-fun m!1141975 () Bool)

(assert (=> b!1238410 m!1141975))

(assert (=> b!1238312 d!135859))

(declare-fun d!135865 () Bool)

(declare-fun lt!561300 () Bool)

(declare-fun content!591 (List!27283) (Set (_ BitVec 64)))

(assert (=> d!135865 (= lt!561300 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!591 lt!561269)))))

(declare-fun e!701857 () Bool)

(assert (=> d!135865 (= lt!561300 e!701857)))

(declare-fun res!826148 () Bool)

(assert (=> d!135865 (=> (not res!826148) (not e!701857))))

(assert (=> d!135865 (= res!826148 (is-Cons!27279 lt!561269))))

(assert (=> d!135865 (= (contains!7345 lt!561269 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561300)))

(declare-fun b!1238430 () Bool)

(declare-fun e!701858 () Bool)

(assert (=> b!1238430 (= e!701857 e!701858)))

(declare-fun res!826149 () Bool)

(assert (=> b!1238430 (=> res!826149 e!701858)))

(assert (=> b!1238430 (= res!826149 (= (h!28488 lt!561269) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238431 () Bool)

(assert (=> b!1238431 (= e!701858 (contains!7345 (t!40746 lt!561269) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135865 res!826148) b!1238430))

(assert (= (and b!1238430 (not res!826149)) b!1238431))

(declare-fun m!1141981 () Bool)

(assert (=> d!135865 m!1141981))

(declare-fun m!1141983 () Bool)

(assert (=> d!135865 m!1141983))

(declare-fun m!1141985 () Bool)

(assert (=> b!1238431 m!1141985))

(assert (=> b!1238302 d!135865))

(declare-fun d!135867 () Bool)

(declare-fun lt!561301 () Bool)

(assert (=> d!135867 (= lt!561301 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!591 acc!846)))))

(declare-fun e!701861 () Bool)

(assert (=> d!135867 (= lt!561301 e!701861)))

(declare-fun res!826152 () Bool)

(assert (=> d!135867 (=> (not res!826152) (not e!701861))))

(assert (=> d!135867 (= res!826152 (is-Cons!27279 acc!846))))

(assert (=> d!135867 (= (contains!7345 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561301)))

(declare-fun b!1238434 () Bool)

(declare-fun e!701862 () Bool)

(assert (=> b!1238434 (= e!701861 e!701862)))

(declare-fun res!826153 () Bool)

(assert (=> b!1238434 (=> res!826153 e!701862)))

(assert (=> b!1238434 (= res!826153 (= (h!28488 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238435 () Bool)

(assert (=> b!1238435 (= e!701862 (contains!7345 (t!40746 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135867 res!826152) b!1238434))

(assert (= (and b!1238434 (not res!826153)) b!1238435))

(declare-fun m!1141991 () Bool)

(assert (=> d!135867 m!1141991))

(declare-fun m!1141993 () Bool)

(assert (=> d!135867 m!1141993))

(declare-fun m!1141995 () Bool)

(assert (=> b!1238435 m!1141995))

(assert (=> b!1238311 d!135867))

(declare-fun d!135871 () Bool)

(declare-fun lt!561304 () Bool)

(assert (=> d!135871 (= lt!561304 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!591 lt!561269)))))

(declare-fun e!701869 () Bool)

(assert (=> d!135871 (= lt!561304 e!701869)))

(declare-fun res!826154 () Bool)

(assert (=> d!135871 (=> (not res!826154) (not e!701869))))

(assert (=> d!135871 (= res!826154 (is-Cons!27279 lt!561269))))

(assert (=> d!135871 (= (contains!7345 lt!561269 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561304)))

(declare-fun b!1238448 () Bool)

(declare-fun e!701870 () Bool)

(assert (=> b!1238448 (= e!701869 e!701870)))

(declare-fun res!826155 () Bool)

(assert (=> b!1238448 (=> res!826155 e!701870)))

(assert (=> b!1238448 (= res!826155 (= (h!28488 lt!561269) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238449 () Bool)

(assert (=> b!1238449 (= e!701870 (contains!7345 (t!40746 lt!561269) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135871 res!826154) b!1238448))

(assert (= (and b!1238448 (not res!826155)) b!1238449))

(assert (=> d!135871 m!1141981))

(declare-fun m!1141997 () Bool)

(assert (=> d!135871 m!1141997))

(declare-fun m!1141999 () Bool)

(assert (=> b!1238449 m!1141999))

(assert (=> b!1238301 d!135871))

(declare-fun d!135873 () Bool)

(assert (=> d!135873 (= (array_inv!29358 a!3835) (bvsge (size!39046 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103128 d!135873))

(declare-fun b!1238485 () Bool)

(declare-fun e!701903 () Bool)

(declare-fun call!61064 () Bool)

(assert (=> b!1238485 (= e!701903 call!61064)))

(declare-fun b!1238486 () Bool)

(assert (=> b!1238486 (= e!701903 call!61064)))

(declare-fun d!135875 () Bool)

(declare-fun res!826180 () Bool)

(declare-fun e!701901 () Bool)

(assert (=> d!135875 (=> res!826180 e!701901)))

(assert (=> d!135875 (= res!826180 (bvsge from!3213 (size!39046 a!3835)))))

(assert (=> d!135875 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!701901)))

(declare-fun b!1238487 () Bool)

(declare-fun e!701900 () Bool)

(assert (=> b!1238487 (= e!701900 e!701903)))

(declare-fun c!121013 () Bool)

(assert (=> b!1238487 (= c!121013 (validKeyInArray!0 (select (arr!38510 a!3835) from!3213)))))

(declare-fun bm!61061 () Bool)

(assert (=> bm!61061 (= call!61064 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121013 (Cons!27279 (select (arr!38510 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1238488 () Bool)

(assert (=> b!1238488 (= e!701901 e!701900)))

(declare-fun res!826181 () Bool)

(assert (=> b!1238488 (=> (not res!826181) (not e!701900))))

(declare-fun e!701902 () Bool)

(assert (=> b!1238488 (= res!826181 (not e!701902))))

(declare-fun res!826179 () Bool)

(assert (=> b!1238488 (=> (not res!826179) (not e!701902))))

(assert (=> b!1238488 (= res!826179 (validKeyInArray!0 (select (arr!38510 a!3835) from!3213)))))

(declare-fun b!1238489 () Bool)

(assert (=> b!1238489 (= e!701902 (contains!7345 acc!846 (select (arr!38510 a!3835) from!3213)))))

(assert (= (and d!135875 (not res!826180)) b!1238488))

(assert (= (and b!1238488 res!826179) b!1238489))

(assert (= (and b!1238488 res!826181) b!1238487))

(assert (= (and b!1238487 c!121013) b!1238486))

(assert (= (and b!1238487 (not c!121013)) b!1238485))

(assert (= (or b!1238486 b!1238485) bm!61061))

(assert (=> b!1238487 m!1141869))

(assert (=> b!1238487 m!1141869))

(assert (=> b!1238487 m!1141877))

(assert (=> bm!61061 m!1141869))

(declare-fun m!1142027 () Bool)

(assert (=> bm!61061 m!1142027))

(assert (=> b!1238488 m!1141869))

(assert (=> b!1238488 m!1141869))

(assert (=> b!1238488 m!1141877))

(assert (=> b!1238489 m!1141869))

(assert (=> b!1238489 m!1141869))

(declare-fun m!1142029 () Bool)

(assert (=> b!1238489 m!1142029))

(assert (=> b!1238304 d!135875))

(declare-fun b!1238519 () Bool)

(declare-fun e!701933 () Bool)

(declare-fun e!701932 () Bool)

(assert (=> b!1238519 (= e!701933 e!701932)))

(declare-fun res!826209 () Bool)

(assert (=> b!1238519 (=> res!826209 e!701932)))

(declare-fun e!701931 () Bool)

(assert (=> b!1238519 (= res!826209 e!701931)))

(declare-fun res!826206 () Bool)

(assert (=> b!1238519 (=> (not res!826206) (not e!701931))))

(assert (=> b!1238519 (= res!826206 (= (h!28488 acc!846) (h!28488 lt!561269)))))

(declare-fun b!1238518 () Bool)

(declare-fun e!701930 () Bool)

(assert (=> b!1238518 (= e!701930 e!701933)))

(declare-fun res!826208 () Bool)

(assert (=> b!1238518 (=> (not res!826208) (not e!701933))))

(assert (=> b!1238518 (= res!826208 (is-Cons!27279 lt!561269))))

(declare-fun d!135889 () Bool)

(declare-fun res!826207 () Bool)

(assert (=> d!135889 (=> res!826207 e!701930)))

(assert (=> d!135889 (= res!826207 (is-Nil!27280 acc!846))))

(assert (=> d!135889 (= (subseq!599 acc!846 lt!561269) e!701930)))

(declare-fun b!1238521 () Bool)

(assert (=> b!1238521 (= e!701932 (subseq!599 acc!846 (t!40746 lt!561269)))))

(declare-fun b!1238520 () Bool)

(assert (=> b!1238520 (= e!701931 (subseq!599 (t!40746 acc!846) (t!40746 lt!561269)))))

(assert (= (and d!135889 (not res!826207)) b!1238518))

(assert (= (and b!1238518 res!826208) b!1238519))

(assert (= (and b!1238519 res!826206) b!1238520))

(assert (= (and b!1238519 (not res!826209)) b!1238521))

(declare-fun m!1142037 () Bool)

(assert (=> b!1238521 m!1142037))

(declare-fun m!1142039 () Bool)

(assert (=> b!1238520 m!1142039))

(assert (=> b!1238305 d!135889))

(declare-fun b!1238575 () Bool)

(declare-fun e!701973 () Unit!41106)

(declare-fun Unit!41114 () Unit!41106)

(assert (=> b!1238575 (= e!701973 Unit!41114)))

(declare-fun bm!61070 () Bool)

(declare-fun call!61073 () Unit!41106)

(declare-fun c!121031 () Bool)

(assert (=> bm!61070 (= call!61073 (subseqTail!86 (ite c!121031 lt!561269 (t!40746 lt!561269)) (t!40746 lt!561269)))))

(declare-fun b!1238576 () Bool)

(assert (=> b!1238576 (= e!701973 call!61073)))

(declare-fun b!1238577 () Bool)

(declare-fun e!701976 () Unit!41106)

(declare-fun Unit!41115 () Unit!41106)

(assert (=> b!1238577 (= e!701976 Unit!41115)))

(declare-fun d!135893 () Bool)

(declare-fun tail!167 (List!27283) List!27283)

(assert (=> d!135893 (subseq!599 (tail!167 lt!561269) lt!561269)))

(declare-fun lt!561324 () Unit!41106)

(assert (=> d!135893 (= lt!561324 e!701976)))

(declare-fun c!121032 () Bool)

(assert (=> d!135893 (= c!121032 (and (is-Cons!27279 lt!561269) (is-Cons!27279 lt!561269)))))

(declare-fun e!701974 () Bool)

(assert (=> d!135893 e!701974))

(declare-fun res!826235 () Bool)

(assert (=> d!135893 (=> (not res!826235) (not e!701974))))

(declare-fun isEmpty!1015 (List!27283) Bool)

(assert (=> d!135893 (= res!826235 (not (isEmpty!1015 lt!561269)))))

(assert (=> d!135893 (= (subseqTail!86 lt!561269 lt!561269) lt!561324)))

(declare-fun b!1238578 () Bool)

(declare-fun e!701975 () Unit!41106)

(assert (=> b!1238578 (= e!701976 e!701975)))

(assert (=> b!1238578 (= c!121031 (subseq!599 lt!561269 (t!40746 lt!561269)))))

(declare-fun b!1238579 () Bool)

(declare-fun c!121030 () Bool)

(assert (=> b!1238579 (= c!121030 (not (isEmpty!1015 (t!40746 lt!561269))))))

(assert (=> b!1238579 (= e!701975 e!701973)))

(declare-fun b!1238580 () Bool)

(assert (=> b!1238580 (= e!701974 (subseq!599 lt!561269 lt!561269))))

(declare-fun b!1238581 () Bool)

(assert (=> b!1238581 (= e!701975 call!61073)))

(assert (= (and d!135893 res!826235) b!1238580))

(assert (= (and d!135893 c!121032) b!1238578))

(assert (= (and d!135893 (not c!121032)) b!1238577))

(assert (= (and b!1238578 c!121031) b!1238581))

(assert (= (and b!1238578 (not c!121031)) b!1238579))

(assert (= (and b!1238579 c!121030) b!1238576))

(assert (= (and b!1238579 (not c!121030)) b!1238575))

(assert (= (or b!1238581 b!1238576) bm!61070))

(declare-fun m!1142071 () Bool)

(assert (=> bm!61070 m!1142071))

(declare-fun m!1142073 () Bool)

(assert (=> b!1238579 m!1142073))

(declare-fun m!1142075 () Bool)

(assert (=> b!1238578 m!1142075))

(assert (=> b!1238580 m!1141875))

(declare-fun m!1142077 () Bool)

(assert (=> d!135893 m!1142077))

(assert (=> d!135893 m!1142077))

(declare-fun m!1142079 () Bool)

(assert (=> d!135893 m!1142079))

(declare-fun m!1142081 () Bool)

(assert (=> d!135893 m!1142081))

(assert (=> b!1238305 d!135893))

(declare-fun b!1238585 () Bool)

(declare-fun e!701982 () Bool)

(declare-fun e!701981 () Bool)

(assert (=> b!1238585 (= e!701982 e!701981)))

(declare-fun res!826241 () Bool)

(assert (=> b!1238585 (=> res!826241 e!701981)))

(declare-fun e!701980 () Bool)

(assert (=> b!1238585 (= res!826241 e!701980)))

(declare-fun res!826238 () Bool)

(assert (=> b!1238585 (=> (not res!826238) (not e!701980))))

(assert (=> b!1238585 (= res!826238 (= (h!28488 lt!561269) (h!28488 lt!561269)))))

(declare-fun b!1238584 () Bool)

(declare-fun e!701979 () Bool)

(assert (=> b!1238584 (= e!701979 e!701982)))

(declare-fun res!826240 () Bool)

(assert (=> b!1238584 (=> (not res!826240) (not e!701982))))

(assert (=> b!1238584 (= res!826240 (is-Cons!27279 lt!561269))))

(declare-fun d!135909 () Bool)

(declare-fun res!826239 () Bool)

(assert (=> d!135909 (=> res!826239 e!701979)))

(assert (=> d!135909 (= res!826239 (is-Nil!27280 lt!561269))))

(assert (=> d!135909 (= (subseq!599 lt!561269 lt!561269) e!701979)))

(declare-fun b!1238587 () Bool)

(assert (=> b!1238587 (= e!701981 (subseq!599 lt!561269 (t!40746 lt!561269)))))

(declare-fun b!1238586 () Bool)

(assert (=> b!1238586 (= e!701980 (subseq!599 (t!40746 lt!561269) (t!40746 lt!561269)))))

(assert (= (and d!135909 (not res!826239)) b!1238584))

(assert (= (and b!1238584 res!826240) b!1238585))

(assert (= (and b!1238585 res!826238) b!1238586))

(assert (= (and b!1238585 (not res!826241)) b!1238587))

(assert (=> b!1238587 m!1142075))

(declare-fun m!1142083 () Bool)

(assert (=> b!1238586 m!1142083))

(assert (=> b!1238305 d!135909))

(declare-fun d!135911 () Bool)

(assert (=> d!135911 (subseq!599 lt!561269 lt!561269)))

(declare-fun lt!561328 () Unit!41106)

(declare-fun choose!36 (List!27283) Unit!41106)

(assert (=> d!135911 (= lt!561328 (choose!36 lt!561269))))

(assert (=> d!135911 (= (lemmaListSubSeqRefl!0 lt!561269) lt!561328)))

(declare-fun bs!34821 () Bool)

(assert (= bs!34821 d!135911))

(assert (=> bs!34821 m!1141875))

(declare-fun m!1142089 () Bool)

(assert (=> bs!34821 m!1142089))

(assert (=> b!1238305 d!135911))

(declare-fun d!135915 () Bool)

(declare-fun lt!561329 () Bool)

(assert (=> d!135915 (= lt!561329 (set.member k!2925 (content!591 acc!846)))))

(declare-fun e!701985 () Bool)

(assert (=> d!135915 (= lt!561329 e!701985)))

(declare-fun res!826244 () Bool)

(assert (=> d!135915 (=> (not res!826244) (not e!701985))))

(assert (=> d!135915 (= res!826244 (is-Cons!27279 acc!846))))

(assert (=> d!135915 (= (contains!7345 acc!846 k!2925) lt!561329)))

(declare-fun b!1238590 () Bool)

(declare-fun e!701986 () Bool)

(assert (=> b!1238590 (= e!701985 e!701986)))

(declare-fun res!826245 () Bool)

(assert (=> b!1238590 (=> res!826245 e!701986)))

(assert (=> b!1238590 (= res!826245 (= (h!28488 acc!846) k!2925))))

(declare-fun b!1238591 () Bool)

(assert (=> b!1238591 (= e!701986 (contains!7345 (t!40746 acc!846) k!2925))))

(assert (= (and d!135915 res!826244) b!1238590))

(assert (= (and b!1238590 (not res!826245)) b!1238591))

(assert (=> d!135915 m!1141991))

(declare-fun m!1142091 () Bool)

(assert (=> d!135915 m!1142091))

(declare-fun m!1142093 () Bool)

(assert (=> b!1238591 m!1142093))

(assert (=> b!1238303 d!135915))

(declare-fun d!135917 () Bool)

(declare-fun lt!561330 () Bool)

(assert (=> d!135917 (= lt!561330 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!591 acc!846)))))

(declare-fun e!701987 () Bool)

(assert (=> d!135917 (= lt!561330 e!701987)))

(declare-fun res!826246 () Bool)

(assert (=> d!135917 (=> (not res!826246) (not e!701987))))

(assert (=> d!135917 (= res!826246 (is-Cons!27279 acc!846))))

(assert (=> d!135917 (= (contains!7345 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561330)))

(declare-fun b!1238592 () Bool)

(declare-fun e!701988 () Bool)

(assert (=> b!1238592 (= e!701987 e!701988)))

(declare-fun res!826247 () Bool)

(assert (=> b!1238592 (=> res!826247 e!701988)))

(assert (=> b!1238592 (= res!826247 (= (h!28488 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238593 () Bool)

(assert (=> b!1238593 (= e!701988 (contains!7345 (t!40746 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135917 res!826246) b!1238592))

(assert (= (and b!1238592 (not res!826247)) b!1238593))

(assert (=> d!135917 m!1141991))

(declare-fun m!1142095 () Bool)

(assert (=> d!135917 m!1142095))

(declare-fun m!1142097 () Bool)

(assert (=> b!1238593 m!1142097))

