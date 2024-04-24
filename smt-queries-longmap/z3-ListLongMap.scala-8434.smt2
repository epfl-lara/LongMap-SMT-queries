; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102928 () Bool)

(assert start!102928)

(declare-fun b!1235606 () Bool)

(declare-fun res!822998 () Bool)

(declare-fun e!700916 () Bool)

(assert (=> b!1235606 (=> (not res!822998) (not e!700916))))

(declare-datatypes ((List!27197 0))(
  ( (Nil!27194) (Cons!27193 (h!28411 (_ BitVec 64)) (t!40652 List!27197)) )
))
(declare-fun acc!846 () List!27197)

(declare-fun noDuplicate!1849 (List!27197) Bool)

(assert (=> b!1235606 (= res!822998 (noDuplicate!1849 acc!846))))

(declare-fun b!1235608 () Bool)

(declare-fun res!823000 () Bool)

(assert (=> b!1235608 (=> (not res!823000) (not e!700916))))

(declare-datatypes ((array!79616 0))(
  ( (array!79617 (arr!38411 (Array (_ BitVec 32) (_ BitVec 64))) (size!38948 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79616)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235608 (= res!823000 (validKeyInArray!0 (select (arr!38411 a!3835) from!3213)))))

(declare-fun b!1235609 () Bool)

(declare-fun res!822999 () Bool)

(assert (=> b!1235609 (=> (not res!822999) (not e!700916))))

(declare-fun arrayNoDuplicates!0 (array!79616 (_ BitVec 32) List!27197) Bool)

(assert (=> b!1235609 (= res!822999 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235610 () Bool)

(declare-fun res!822996 () Bool)

(assert (=> b!1235610 (=> (not res!822996) (not e!700916))))

(declare-fun contains!7268 (List!27197 (_ BitVec 64)) Bool)

(assert (=> b!1235610 (= res!822996 (not (contains!7268 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235611 () Bool)

(declare-fun res!823001 () Bool)

(assert (=> b!1235611 (=> (not res!823001) (not e!700916))))

(assert (=> b!1235611 (= res!823001 (not (contains!7268 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235612 () Bool)

(declare-fun res!822995 () Bool)

(assert (=> b!1235612 (=> (not res!822995) (not e!700916))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235612 (= res!822995 (contains!7268 acc!846 k0!2925))))

(declare-fun b!1235613 () Bool)

(declare-fun res!822997 () Bool)

(assert (=> b!1235613 (=> (not res!822997) (not e!700916))))

(assert (=> b!1235613 (= res!822997 (not (= from!3213 (bvsub (size!38948 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235607 () Bool)

(declare-fun lt!560315 () List!27197)

(declare-fun isEmpty!1007 (List!27197) Bool)

(assert (=> b!1235607 (= e!700916 (not (not (isEmpty!1007 lt!560315))))))

(declare-fun subseq!506 (List!27197 List!27197) Bool)

(assert (=> b!1235607 (subseq!506 lt!560315 lt!560315)))

(declare-datatypes ((Unit!40841 0))(
  ( (Unit!40842) )
))
(declare-fun lt!560314 () Unit!40841)

(declare-fun lemmaListSubSeqRefl!0 (List!27197) Unit!40841)

(assert (=> b!1235607 (= lt!560314 (lemmaListSubSeqRefl!0 lt!560315))))

(assert (=> b!1235607 (= lt!560315 (Cons!27193 (select (arr!38411 a!3835) from!3213) acc!846))))

(declare-fun res!823002 () Bool)

(assert (=> start!102928 (=> (not res!823002) (not e!700916))))

(assert (=> start!102928 (= res!823002 (and (bvslt (size!38948 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38948 a!3835))))))

(assert (=> start!102928 e!700916))

(declare-fun array_inv!29349 (array!79616) Bool)

(assert (=> start!102928 (array_inv!29349 a!3835)))

(assert (=> start!102928 true))

(assert (= (and start!102928 res!823002) b!1235606))

(assert (= (and b!1235606 res!822998) b!1235610))

(assert (= (and b!1235610 res!822996) b!1235611))

(assert (= (and b!1235611 res!823001) b!1235609))

(assert (= (and b!1235609 res!822999) b!1235612))

(assert (= (and b!1235612 res!822995) b!1235613))

(assert (= (and b!1235613 res!822997) b!1235608))

(assert (= (and b!1235608 res!823000) b!1235607))

(declare-fun m!1139921 () Bool)

(assert (=> b!1235606 m!1139921))

(declare-fun m!1139923 () Bool)

(assert (=> b!1235608 m!1139923))

(assert (=> b!1235608 m!1139923))

(declare-fun m!1139925 () Bool)

(assert (=> b!1235608 m!1139925))

(declare-fun m!1139927 () Bool)

(assert (=> b!1235610 m!1139927))

(declare-fun m!1139929 () Bool)

(assert (=> start!102928 m!1139929))

(declare-fun m!1139931 () Bool)

(assert (=> b!1235607 m!1139931))

(declare-fun m!1139933 () Bool)

(assert (=> b!1235607 m!1139933))

(declare-fun m!1139935 () Bool)

(assert (=> b!1235607 m!1139935))

(assert (=> b!1235607 m!1139923))

(declare-fun m!1139937 () Bool)

(assert (=> b!1235611 m!1139937))

(declare-fun m!1139939 () Bool)

(assert (=> b!1235612 m!1139939))

(declare-fun m!1139941 () Bool)

(assert (=> b!1235609 m!1139941))

(check-sat (not b!1235607) (not b!1235608) (not b!1235606) (not start!102928) (not b!1235612) (not b!1235609) (not b!1235610) (not b!1235611))
(check-sat)
(get-model)

(declare-fun d!135853 () Bool)

(declare-fun lt!560330 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!579 (List!27197) (InoxSet (_ BitVec 64)))

(assert (=> d!135853 (= lt!560330 (select (content!579 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700934 () Bool)

(assert (=> d!135853 (= lt!560330 e!700934)))

(declare-fun res!823055 () Bool)

(assert (=> d!135853 (=> (not res!823055) (not e!700934))))

(get-info :version)

(assert (=> d!135853 (= res!823055 ((_ is Cons!27193) acc!846))))

(assert (=> d!135853 (= (contains!7268 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!560330)))

(declare-fun b!1235666 () Bool)

(declare-fun e!700933 () Bool)

(assert (=> b!1235666 (= e!700934 e!700933)))

(declare-fun res!823056 () Bool)

(assert (=> b!1235666 (=> res!823056 e!700933)))

(assert (=> b!1235666 (= res!823056 (= (h!28411 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235667 () Bool)

(assert (=> b!1235667 (= e!700933 (contains!7268 (t!40652 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135853 res!823055) b!1235666))

(assert (= (and b!1235666 (not res!823056)) b!1235667))

(declare-fun m!1139987 () Bool)

(assert (=> d!135853 m!1139987))

(declare-fun m!1139989 () Bool)

(assert (=> d!135853 m!1139989))

(declare-fun m!1139991 () Bool)

(assert (=> b!1235667 m!1139991))

(assert (=> b!1235610 d!135853))

(declare-fun b!1235678 () Bool)

(declare-fun e!700944 () Bool)

(assert (=> b!1235678 (= e!700944 (contains!7268 acc!846 (select (arr!38411 a!3835) from!3213)))))

(declare-fun bm!61053 () Bool)

(declare-fun call!61056 () Bool)

(declare-fun c!121175 () Bool)

(assert (=> bm!61053 (= call!61056 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121175 (Cons!27193 (select (arr!38411 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1235679 () Bool)

(declare-fun e!700946 () Bool)

(assert (=> b!1235679 (= e!700946 call!61056)))

(declare-fun b!1235680 () Bool)

(declare-fun e!700945 () Bool)

(assert (=> b!1235680 (= e!700945 e!700946)))

(assert (=> b!1235680 (= c!121175 (validKeyInArray!0 (select (arr!38411 a!3835) from!3213)))))

(declare-fun d!135855 () Bool)

(declare-fun res!823064 () Bool)

(declare-fun e!700943 () Bool)

(assert (=> d!135855 (=> res!823064 e!700943)))

(assert (=> d!135855 (= res!823064 (bvsge from!3213 (size!38948 a!3835)))))

(assert (=> d!135855 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!700943)))

(declare-fun b!1235681 () Bool)

(assert (=> b!1235681 (= e!700946 call!61056)))

(declare-fun b!1235682 () Bool)

(assert (=> b!1235682 (= e!700943 e!700945)))

(declare-fun res!823063 () Bool)

(assert (=> b!1235682 (=> (not res!823063) (not e!700945))))

(assert (=> b!1235682 (= res!823063 (not e!700944))))

(declare-fun res!823065 () Bool)

(assert (=> b!1235682 (=> (not res!823065) (not e!700944))))

(assert (=> b!1235682 (= res!823065 (validKeyInArray!0 (select (arr!38411 a!3835) from!3213)))))

(assert (= (and d!135855 (not res!823064)) b!1235682))

(assert (= (and b!1235682 res!823065) b!1235678))

(assert (= (and b!1235682 res!823063) b!1235680))

(assert (= (and b!1235680 c!121175) b!1235681))

(assert (= (and b!1235680 (not c!121175)) b!1235679))

(assert (= (or b!1235681 b!1235679) bm!61053))

(assert (=> b!1235678 m!1139923))

(assert (=> b!1235678 m!1139923))

(declare-fun m!1139993 () Bool)

(assert (=> b!1235678 m!1139993))

(assert (=> bm!61053 m!1139923))

(declare-fun m!1139995 () Bool)

(assert (=> bm!61053 m!1139995))

(assert (=> b!1235680 m!1139923))

(assert (=> b!1235680 m!1139923))

(assert (=> b!1235680 m!1139925))

(assert (=> b!1235682 m!1139923))

(assert (=> b!1235682 m!1139923))

(assert (=> b!1235682 m!1139925))

(assert (=> b!1235609 d!135855))

(declare-fun d!135857 () Bool)

(assert (=> d!135857 (= (isEmpty!1007 lt!560315) ((_ is Nil!27194) lt!560315))))

(assert (=> b!1235607 d!135857))

(declare-fun b!1235701 () Bool)

(declare-fun e!700963 () Bool)

(assert (=> b!1235701 (= e!700963 (subseq!506 (t!40652 lt!560315) (t!40652 lt!560315)))))

(declare-fun b!1235700 () Bool)

(declare-fun e!700965 () Bool)

(declare-fun e!700964 () Bool)

(assert (=> b!1235700 (= e!700965 e!700964)))

(declare-fun res!823084 () Bool)

(assert (=> b!1235700 (=> res!823084 e!700964)))

(assert (=> b!1235700 (= res!823084 e!700963)))

(declare-fun res!823083 () Bool)

(assert (=> b!1235700 (=> (not res!823083) (not e!700963))))

(assert (=> b!1235700 (= res!823083 (= (h!28411 lt!560315) (h!28411 lt!560315)))))

(declare-fun b!1235702 () Bool)

(assert (=> b!1235702 (= e!700964 (subseq!506 lt!560315 (t!40652 lt!560315)))))

(declare-fun d!135859 () Bool)

(declare-fun res!823085 () Bool)

(declare-fun e!700966 () Bool)

(assert (=> d!135859 (=> res!823085 e!700966)))

(assert (=> d!135859 (= res!823085 ((_ is Nil!27194) lt!560315))))

(assert (=> d!135859 (= (subseq!506 lt!560315 lt!560315) e!700966)))

(declare-fun b!1235699 () Bool)

(assert (=> b!1235699 (= e!700966 e!700965)))

(declare-fun res!823082 () Bool)

(assert (=> b!1235699 (=> (not res!823082) (not e!700965))))

(assert (=> b!1235699 (= res!823082 ((_ is Cons!27193) lt!560315))))

(assert (= (and d!135859 (not res!823085)) b!1235699))

(assert (= (and b!1235699 res!823082) b!1235700))

(assert (= (and b!1235700 res!823083) b!1235701))

(assert (= (and b!1235700 (not res!823084)) b!1235702))

(declare-fun m!1139997 () Bool)

(assert (=> b!1235701 m!1139997))

(declare-fun m!1139999 () Bool)

(assert (=> b!1235702 m!1139999))

(assert (=> b!1235607 d!135859))

(declare-fun d!135865 () Bool)

(assert (=> d!135865 (subseq!506 lt!560315 lt!560315)))

(declare-fun lt!560342 () Unit!40841)

(declare-fun choose!36 (List!27197) Unit!40841)

(assert (=> d!135865 (= lt!560342 (choose!36 lt!560315))))

(assert (=> d!135865 (= (lemmaListSubSeqRefl!0 lt!560315) lt!560342)))

(declare-fun bs!34712 () Bool)

(assert (= bs!34712 d!135865))

(assert (=> bs!34712 m!1139933))

(declare-fun m!1140021 () Bool)

(assert (=> bs!34712 m!1140021))

(assert (=> b!1235607 d!135865))

(declare-fun d!135875 () Bool)

(assert (=> d!135875 (= (validKeyInArray!0 (select (arr!38411 a!3835) from!3213)) (and (not (= (select (arr!38411 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38411 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1235608 d!135875))

(declare-fun d!135883 () Bool)

(declare-fun lt!560344 () Bool)

(assert (=> d!135883 (= lt!560344 (select (content!579 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700980 () Bool)

(assert (=> d!135883 (= lt!560344 e!700980)))

(declare-fun res!823098 () Bool)

(assert (=> d!135883 (=> (not res!823098) (not e!700980))))

(assert (=> d!135883 (= res!823098 ((_ is Cons!27193) acc!846))))

(assert (=> d!135883 (= (contains!7268 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!560344)))

(declare-fun b!1235715 () Bool)

(declare-fun e!700979 () Bool)

(assert (=> b!1235715 (= e!700980 e!700979)))

(declare-fun res!823099 () Bool)

(assert (=> b!1235715 (=> res!823099 e!700979)))

(assert (=> b!1235715 (= res!823099 (= (h!28411 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235716 () Bool)

(assert (=> b!1235716 (= e!700979 (contains!7268 (t!40652 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135883 res!823098) b!1235715))

(assert (= (and b!1235715 (not res!823099)) b!1235716))

(assert (=> d!135883 m!1139987))

(declare-fun m!1140031 () Bool)

(assert (=> d!135883 m!1140031))

(declare-fun m!1140033 () Bool)

(assert (=> b!1235716 m!1140033))

(assert (=> b!1235611 d!135883))

(declare-fun d!135887 () Bool)

(declare-fun res!823104 () Bool)

(declare-fun e!700985 () Bool)

(assert (=> d!135887 (=> res!823104 e!700985)))

(assert (=> d!135887 (= res!823104 ((_ is Nil!27194) acc!846))))

(assert (=> d!135887 (= (noDuplicate!1849 acc!846) e!700985)))

(declare-fun b!1235721 () Bool)

(declare-fun e!700986 () Bool)

(assert (=> b!1235721 (= e!700985 e!700986)))

(declare-fun res!823105 () Bool)

(assert (=> b!1235721 (=> (not res!823105) (not e!700986))))

(assert (=> b!1235721 (= res!823105 (not (contains!7268 (t!40652 acc!846) (h!28411 acc!846))))))

(declare-fun b!1235722 () Bool)

(assert (=> b!1235722 (= e!700986 (noDuplicate!1849 (t!40652 acc!846)))))

(assert (= (and d!135887 (not res!823104)) b!1235721))

(assert (= (and b!1235721 res!823105) b!1235722))

(declare-fun m!1140035 () Bool)

(assert (=> b!1235721 m!1140035))

(declare-fun m!1140037 () Bool)

(assert (=> b!1235722 m!1140037))

(assert (=> b!1235606 d!135887))

(declare-fun d!135891 () Bool)

(assert (=> d!135891 (= (array_inv!29349 a!3835) (bvsge (size!38948 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!102928 d!135891))

(declare-fun d!135893 () Bool)

(declare-fun lt!560345 () Bool)

(assert (=> d!135893 (= lt!560345 (select (content!579 acc!846) k0!2925))))

(declare-fun e!700992 () Bool)

(assert (=> d!135893 (= lt!560345 e!700992)))

(declare-fun res!823110 () Bool)

(assert (=> d!135893 (=> (not res!823110) (not e!700992))))

(assert (=> d!135893 (= res!823110 ((_ is Cons!27193) acc!846))))

(assert (=> d!135893 (= (contains!7268 acc!846 k0!2925) lt!560345)))

(declare-fun b!1235727 () Bool)

(declare-fun e!700991 () Bool)

(assert (=> b!1235727 (= e!700992 e!700991)))

(declare-fun res!823111 () Bool)

(assert (=> b!1235727 (=> res!823111 e!700991)))

(assert (=> b!1235727 (= res!823111 (= (h!28411 acc!846) k0!2925))))

(declare-fun b!1235728 () Bool)

(assert (=> b!1235728 (= e!700991 (contains!7268 (t!40652 acc!846) k0!2925))))

(assert (= (and d!135893 res!823110) b!1235727))

(assert (= (and b!1235727 (not res!823111)) b!1235728))

(assert (=> d!135893 m!1139987))

(declare-fun m!1140039 () Bool)

(assert (=> d!135893 m!1140039))

(declare-fun m!1140041 () Bool)

(assert (=> b!1235728 m!1140041))

(assert (=> b!1235612 d!135893))

(check-sat (not b!1235702) (not b!1235701) (not d!135865) (not b!1235680) (not bm!61053) (not d!135883) (not b!1235728) (not b!1235682) (not b!1235678) (not b!1235667) (not d!135893) (not b!1235721) (not b!1235716) (not b!1235722) (not d!135853))
(check-sat)
