; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103216 () Bool)

(assert start!103216)

(declare-fun b!1238988 () Bool)

(declare-fun res!826583 () Bool)

(declare-fun e!702133 () Bool)

(assert (=> b!1238988 (=> (not res!826583) (not e!702133))))

(declare-datatypes ((array!79774 0))(
  ( (array!79775 (arr!38489 (Array (_ BitVec 32) (_ BitVec 64))) (size!39027 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79774)

(declare-datatypes ((List!27363 0))(
  ( (Nil!27360) (Cons!27359 (h!28568 (_ BitVec 64)) (t!40817 List!27363)) )
))
(declare-fun acc!846 () List!27363)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79774 (_ BitVec 32) List!27363) Bool)

(assert (=> b!1238988 (= res!826583 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238989 () Bool)

(declare-fun res!826576 () Bool)

(assert (=> b!1238989 (=> (not res!826576) (not e!702133))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7335 (List!27363 (_ BitVec 64)) Bool)

(assert (=> b!1238989 (= res!826576 (contains!7335 acc!846 k0!2925))))

(declare-fun b!1238990 () Bool)

(declare-fun e!702134 () Bool)

(assert (=> b!1238990 (= e!702133 e!702134)))

(declare-fun res!826582 () Bool)

(assert (=> b!1238990 (=> (not res!826582) (not e!702134))))

(assert (=> b!1238990 (= res!826582 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39027 a!3835))))))

(declare-datatypes ((Unit!41006 0))(
  ( (Unit!41007) )
))
(declare-fun lt!561405 () Unit!41006)

(declare-fun e!702131 () Unit!41006)

(assert (=> b!1238990 (= lt!561405 e!702131)))

(declare-fun c!121069 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238990 (= c!121069 (validKeyInArray!0 (select (arr!38489 a!3835) from!3213)))))

(declare-fun b!1238991 () Bool)

(declare-fun res!826579 () Bool)

(assert (=> b!1238991 (=> (not res!826579) (not e!702133))))

(declare-fun noDuplicate!1978 (List!27363) Bool)

(assert (=> b!1238991 (= res!826579 (noDuplicate!1978 acc!846))))

(declare-fun b!1238992 () Bool)

(assert (=> b!1238992 (= e!702134 (not (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))))

(declare-fun b!1238993 () Bool)

(declare-fun res!826578 () Bool)

(assert (=> b!1238993 (=> (not res!826578) (not e!702133))))

(assert (=> b!1238993 (= res!826578 (not (= from!3213 (bvsub (size!39027 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238994 () Bool)

(declare-fun res!826581 () Bool)

(assert (=> b!1238994 (=> (not res!826581) (not e!702133))))

(assert (=> b!1238994 (= res!826581 (not (contains!7335 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238995 () Bool)

(declare-fun lt!561406 () Unit!41006)

(assert (=> b!1238995 (= e!702131 lt!561406)))

(declare-fun lt!561404 () List!27363)

(assert (=> b!1238995 (= lt!561404 (Cons!27359 (select (arr!38489 a!3835) from!3213) acc!846))))

(declare-fun lt!561403 () Unit!41006)

(declare-fun lemmaListSubSeqRefl!0 (List!27363) Unit!41006)

(assert (=> b!1238995 (= lt!561403 (lemmaListSubSeqRefl!0 lt!561404))))

(declare-fun subseq!617 (List!27363 List!27363) Bool)

(assert (=> b!1238995 (subseq!617 lt!561404 lt!561404)))

(declare-fun lt!561407 () Unit!41006)

(declare-fun subseqTail!104 (List!27363 List!27363) Unit!41006)

(assert (=> b!1238995 (= lt!561407 (subseqTail!104 lt!561404 lt!561404))))

(assert (=> b!1238995 (subseq!617 acc!846 lt!561404)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79774 List!27363 List!27363 (_ BitVec 32)) Unit!41006)

(assert (=> b!1238995 (= lt!561406 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561404 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1238995 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238997 () Bool)

(declare-fun res!826577 () Bool)

(assert (=> b!1238997 (=> (not res!826577) (not e!702133))))

(assert (=> b!1238997 (= res!826577 (not (contains!7335 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!826580 () Bool)

(assert (=> start!103216 (=> (not res!826580) (not e!702133))))

(assert (=> start!103216 (= res!826580 (and (bvslt (size!39027 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39027 a!3835))))))

(assert (=> start!103216 e!702133))

(declare-fun array_inv!29472 (array!79774) Bool)

(assert (=> start!103216 (array_inv!29472 a!3835)))

(assert (=> start!103216 true))

(declare-fun b!1238996 () Bool)

(declare-fun Unit!41008 () Unit!41006)

(assert (=> b!1238996 (= e!702131 Unit!41008)))

(assert (= (and start!103216 res!826580) b!1238991))

(assert (= (and b!1238991 res!826579) b!1238994))

(assert (= (and b!1238994 res!826581) b!1238997))

(assert (= (and b!1238997 res!826577) b!1238988))

(assert (= (and b!1238988 res!826583) b!1238989))

(assert (= (and b!1238989 res!826576) b!1238993))

(assert (= (and b!1238993 res!826578) b!1238990))

(assert (= (and b!1238990 c!121069) b!1238995))

(assert (= (and b!1238990 (not c!121069)) b!1238996))

(assert (= (and b!1238990 res!826582) b!1238992))

(declare-fun m!1142079 () Bool)

(assert (=> start!103216 m!1142079))

(declare-fun m!1142081 () Bool)

(assert (=> b!1238992 m!1142081))

(declare-fun m!1142083 () Bool)

(assert (=> b!1238997 m!1142083))

(declare-fun m!1142085 () Bool)

(assert (=> b!1238990 m!1142085))

(assert (=> b!1238990 m!1142085))

(declare-fun m!1142087 () Bool)

(assert (=> b!1238990 m!1142087))

(declare-fun m!1142089 () Bool)

(assert (=> b!1238995 m!1142089))

(declare-fun m!1142091 () Bool)

(assert (=> b!1238995 m!1142091))

(declare-fun m!1142093 () Bool)

(assert (=> b!1238995 m!1142093))

(assert (=> b!1238995 m!1142081))

(assert (=> b!1238995 m!1142085))

(declare-fun m!1142095 () Bool)

(assert (=> b!1238995 m!1142095))

(declare-fun m!1142097 () Bool)

(assert (=> b!1238995 m!1142097))

(declare-fun m!1142099 () Bool)

(assert (=> b!1238988 m!1142099))

(declare-fun m!1142101 () Bool)

(assert (=> b!1238991 m!1142101))

(declare-fun m!1142103 () Bool)

(assert (=> b!1238994 m!1142103))

(declare-fun m!1142105 () Bool)

(assert (=> b!1238989 m!1142105))

(check-sat (not start!103216) (not b!1238994) (not b!1238992) (not b!1238988) (not b!1238997) (not b!1238989) (not b!1238995) (not b!1238991) (not b!1238990))
(check-sat)
(get-model)

(declare-fun b!1239068 () Bool)

(declare-fun e!702167 () Bool)

(declare-fun e!702170 () Bool)

(assert (=> b!1239068 (= e!702167 e!702170)))

(declare-fun c!121078 () Bool)

(assert (=> b!1239068 (= c!121078 (validKeyInArray!0 (select (arr!38489 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun e!702169 () Bool)

(declare-fun b!1239069 () Bool)

(assert (=> b!1239069 (= e!702169 (contains!7335 acc!846 (select (arr!38489 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1239070 () Bool)

(declare-fun call!61059 () Bool)

(assert (=> b!1239070 (= e!702170 call!61059)))

(declare-fun d!135843 () Bool)

(declare-fun res!826639 () Bool)

(declare-fun e!702168 () Bool)

(assert (=> d!135843 (=> res!826639 e!702168)))

(assert (=> d!135843 (= res!826639 (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39027 a!3835)))))

(assert (=> d!135843 (= (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846) e!702168)))

(declare-fun b!1239071 () Bool)

(assert (=> b!1239071 (= e!702168 e!702167)))

(declare-fun res!826638 () Bool)

(assert (=> b!1239071 (=> (not res!826638) (not e!702167))))

(assert (=> b!1239071 (= res!826638 (not e!702169))))

(declare-fun res!826640 () Bool)

(assert (=> b!1239071 (=> (not res!826640) (not e!702169))))

(assert (=> b!1239071 (= res!826640 (validKeyInArray!0 (select (arr!38489 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun bm!61056 () Bool)

(assert (=> bm!61056 (= call!61059 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (ite c!121078 (Cons!27359 (select (arr!38489 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) acc!846) acc!846)))))

(declare-fun b!1239072 () Bool)

(assert (=> b!1239072 (= e!702170 call!61059)))

(assert (= (and d!135843 (not res!826639)) b!1239071))

(assert (= (and b!1239071 res!826640) b!1239069))

(assert (= (and b!1239071 res!826638) b!1239068))

(assert (= (and b!1239068 c!121078) b!1239070))

(assert (= (and b!1239068 (not c!121078)) b!1239072))

(assert (= (or b!1239070 b!1239072) bm!61056))

(declare-fun m!1142163 () Bool)

(assert (=> b!1239068 m!1142163))

(assert (=> b!1239068 m!1142163))

(declare-fun m!1142165 () Bool)

(assert (=> b!1239068 m!1142165))

(assert (=> b!1239069 m!1142163))

(assert (=> b!1239069 m!1142163))

(declare-fun m!1142167 () Bool)

(assert (=> b!1239069 m!1142167))

(assert (=> b!1239071 m!1142163))

(assert (=> b!1239071 m!1142163))

(assert (=> b!1239071 m!1142165))

(assert (=> bm!61056 m!1142163))

(declare-fun m!1142169 () Bool)

(assert (=> bm!61056 m!1142169))

(assert (=> b!1238995 d!135843))

(declare-fun b!1239082 () Bool)

(declare-fun e!702181 () Bool)

(declare-fun e!702182 () Bool)

(assert (=> b!1239082 (= e!702181 e!702182)))

(declare-fun res!826651 () Bool)

(assert (=> b!1239082 (=> res!826651 e!702182)))

(declare-fun e!702180 () Bool)

(assert (=> b!1239082 (= res!826651 e!702180)))

(declare-fun res!826649 () Bool)

(assert (=> b!1239082 (=> (not res!826649) (not e!702180))))

(assert (=> b!1239082 (= res!826649 (= (h!28568 lt!561404) (h!28568 lt!561404)))))

(declare-fun b!1239081 () Bool)

(declare-fun e!702179 () Bool)

(assert (=> b!1239081 (= e!702179 e!702181)))

(declare-fun res!826652 () Bool)

(assert (=> b!1239081 (=> (not res!826652) (not e!702181))))

(get-info :version)

(assert (=> b!1239081 (= res!826652 ((_ is Cons!27359) lt!561404))))

(declare-fun d!135845 () Bool)

(declare-fun res!826650 () Bool)

(assert (=> d!135845 (=> res!826650 e!702179)))

(assert (=> d!135845 (= res!826650 ((_ is Nil!27360) lt!561404))))

(assert (=> d!135845 (= (subseq!617 lt!561404 lt!561404) e!702179)))

(declare-fun b!1239084 () Bool)

(assert (=> b!1239084 (= e!702182 (subseq!617 lt!561404 (t!40817 lt!561404)))))

(declare-fun b!1239083 () Bool)

(assert (=> b!1239083 (= e!702180 (subseq!617 (t!40817 lt!561404) (t!40817 lt!561404)))))

(assert (= (and d!135845 (not res!826650)) b!1239081))

(assert (= (and b!1239081 res!826652) b!1239082))

(assert (= (and b!1239082 res!826649) b!1239083))

(assert (= (and b!1239082 (not res!826651)) b!1239084))

(declare-fun m!1142171 () Bool)

(assert (=> b!1239084 m!1142171))

(declare-fun m!1142173 () Bool)

(assert (=> b!1239083 m!1142173))

(assert (=> b!1238995 d!135845))

(declare-fun b!1239132 () Bool)

(declare-fun e!702221 () Unit!41006)

(declare-fun call!61065 () Unit!41006)

(assert (=> b!1239132 (= e!702221 call!61065)))

(declare-fun b!1239133 () Bool)

(declare-fun e!702223 () Bool)

(assert (=> b!1239133 (= e!702223 (subseq!617 lt!561404 lt!561404))))

(declare-fun b!1239134 () Bool)

(declare-fun c!121089 () Bool)

(declare-fun isEmpty!1022 (List!27363) Bool)

(assert (=> b!1239134 (= c!121089 (not (isEmpty!1022 (t!40817 lt!561404))))))

(declare-fun e!702222 () Unit!41006)

(assert (=> b!1239134 (= e!702221 e!702222)))

(declare-fun d!135849 () Bool)

(declare-fun tail!169 (List!27363) List!27363)

(assert (=> d!135849 (subseq!617 (tail!169 lt!561404) lt!561404)))

(declare-fun lt!561446 () Unit!41006)

(declare-fun e!702224 () Unit!41006)

(assert (=> d!135849 (= lt!561446 e!702224)))

(declare-fun c!121090 () Bool)

(assert (=> d!135849 (= c!121090 (and ((_ is Cons!27359) lt!561404) ((_ is Cons!27359) lt!561404)))))

(assert (=> d!135849 e!702223))

(declare-fun res!826682 () Bool)

(assert (=> d!135849 (=> (not res!826682) (not e!702223))))

(assert (=> d!135849 (= res!826682 (not (isEmpty!1022 lt!561404)))))

(assert (=> d!135849 (= (subseqTail!104 lt!561404 lt!561404) lt!561446)))

(declare-fun b!1239135 () Bool)

(declare-fun Unit!41015 () Unit!41006)

(assert (=> b!1239135 (= e!702222 Unit!41015)))

(declare-fun b!1239136 () Bool)

(declare-fun Unit!41016 () Unit!41006)

(assert (=> b!1239136 (= e!702224 Unit!41016)))

(declare-fun b!1239137 () Bool)

(assert (=> b!1239137 (= e!702222 call!61065)))

(declare-fun b!1239138 () Bool)

(assert (=> b!1239138 (= e!702224 e!702221)))

(declare-fun c!121088 () Bool)

(assert (=> b!1239138 (= c!121088 (subseq!617 lt!561404 (t!40817 lt!561404)))))

(declare-fun bm!61062 () Bool)

(assert (=> bm!61062 (= call!61065 (subseqTail!104 (ite c!121088 lt!561404 (t!40817 lt!561404)) (t!40817 lt!561404)))))

(assert (= (and d!135849 res!826682) b!1239133))

(assert (= (and d!135849 c!121090) b!1239138))

(assert (= (and d!135849 (not c!121090)) b!1239136))

(assert (= (and b!1239138 c!121088) b!1239132))

(assert (= (and b!1239138 (not c!121088)) b!1239134))

(assert (= (and b!1239134 c!121089) b!1239137))

(assert (= (and b!1239134 (not c!121089)) b!1239135))

(assert (= (or b!1239132 b!1239137) bm!61062))

(assert (=> b!1239133 m!1142095))

(declare-fun m!1142197 () Bool)

(assert (=> b!1239134 m!1142197))

(assert (=> b!1239138 m!1142171))

(declare-fun m!1142199 () Bool)

(assert (=> d!135849 m!1142199))

(assert (=> d!135849 m!1142199))

(declare-fun m!1142203 () Bool)

(assert (=> d!135849 m!1142203))

(declare-fun m!1142205 () Bool)

(assert (=> d!135849 m!1142205))

(declare-fun m!1142207 () Bool)

(assert (=> bm!61062 m!1142207))

(assert (=> b!1238995 d!135849))

(declare-fun b!1239145 () Bool)

(declare-fun e!702231 () Bool)

(declare-fun e!702232 () Bool)

(assert (=> b!1239145 (= e!702231 e!702232)))

(declare-fun res!826688 () Bool)

(assert (=> b!1239145 (=> res!826688 e!702232)))

(declare-fun e!702230 () Bool)

(assert (=> b!1239145 (= res!826688 e!702230)))

(declare-fun res!826686 () Bool)

(assert (=> b!1239145 (=> (not res!826686) (not e!702230))))

(assert (=> b!1239145 (= res!826686 (= (h!28568 acc!846) (h!28568 lt!561404)))))

(declare-fun b!1239144 () Bool)

(declare-fun e!702229 () Bool)

(assert (=> b!1239144 (= e!702229 e!702231)))

(declare-fun res!826689 () Bool)

(assert (=> b!1239144 (=> (not res!826689) (not e!702231))))

(assert (=> b!1239144 (= res!826689 ((_ is Cons!27359) lt!561404))))

(declare-fun d!135865 () Bool)

(declare-fun res!826687 () Bool)

(assert (=> d!135865 (=> res!826687 e!702229)))

(assert (=> d!135865 (= res!826687 ((_ is Nil!27360) acc!846))))

(assert (=> d!135865 (= (subseq!617 acc!846 lt!561404) e!702229)))

(declare-fun b!1239147 () Bool)

(assert (=> b!1239147 (= e!702232 (subseq!617 acc!846 (t!40817 lt!561404)))))

(declare-fun b!1239146 () Bool)

(assert (=> b!1239146 (= e!702230 (subseq!617 (t!40817 acc!846) (t!40817 lt!561404)))))

(assert (= (and d!135865 (not res!826687)) b!1239144))

(assert (= (and b!1239144 res!826689) b!1239145))

(assert (= (and b!1239145 res!826686) b!1239146))

(assert (= (and b!1239145 (not res!826688)) b!1239147))

(declare-fun m!1142209 () Bool)

(assert (=> b!1239147 m!1142209))

(declare-fun m!1142211 () Bool)

(assert (=> b!1239146 m!1142211))

(assert (=> b!1238995 d!135865))

(declare-fun d!135867 () Bool)

(assert (=> d!135867 (subseq!617 lt!561404 lt!561404)))

(declare-fun lt!561449 () Unit!41006)

(declare-fun choose!36 (List!27363) Unit!41006)

(assert (=> d!135867 (= lt!561449 (choose!36 lt!561404))))

(assert (=> d!135867 (= (lemmaListSubSeqRefl!0 lt!561404) lt!561449)))

(declare-fun bs!34813 () Bool)

(assert (= bs!34813 d!135867))

(assert (=> bs!34813 m!1142095))

(declare-fun m!1142217 () Bool)

(assert (=> bs!34813 m!1142217))

(assert (=> b!1238995 d!135867))

(declare-fun d!135873 () Bool)

(assert (=> d!135873 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun lt!561452 () Unit!41006)

(declare-fun choose!80 (array!79774 List!27363 List!27363 (_ BitVec 32)) Unit!41006)

(assert (=> d!135873 (= lt!561452 (choose!80 a!3835 lt!561404 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> d!135873 (bvslt (size!39027 a!3835) #b01111111111111111111111111111111)))

(assert (=> d!135873 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561404 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)) lt!561452)))

(declare-fun bs!34814 () Bool)

(assert (= bs!34814 d!135873))

(assert (=> bs!34814 m!1142081))

(declare-fun m!1142223 () Bool)

(assert (=> bs!34814 m!1142223))

(assert (=> b!1238995 d!135873))

(declare-fun d!135877 () Bool)

(assert (=> d!135877 (= (validKeyInArray!0 (select (arr!38489 a!3835) from!3213)) (and (not (= (select (arr!38489 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38489 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1238990 d!135877))

(declare-fun d!135881 () Bool)

(declare-fun lt!561458 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!595 (List!27363) (InoxSet (_ BitVec 64)))

(assert (=> d!135881 (= lt!561458 (select (content!595 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702273 () Bool)

(assert (=> d!135881 (= lt!561458 e!702273)))

(declare-fun res!826727 () Bool)

(assert (=> d!135881 (=> (not res!826727) (not e!702273))))

(assert (=> d!135881 (= res!826727 ((_ is Cons!27359) acc!846))))

(assert (=> d!135881 (= (contains!7335 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561458)))

(declare-fun b!1239192 () Bool)

(declare-fun e!702274 () Bool)

(assert (=> b!1239192 (= e!702273 e!702274)))

(declare-fun res!826726 () Bool)

(assert (=> b!1239192 (=> res!826726 e!702274)))

(assert (=> b!1239192 (= res!826726 (= (h!28568 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239193 () Bool)

(assert (=> b!1239193 (= e!702274 (contains!7335 (t!40817 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135881 res!826727) b!1239192))

(assert (= (and b!1239192 (not res!826726)) b!1239193))

(declare-fun m!1142249 () Bool)

(assert (=> d!135881 m!1142249))

(declare-fun m!1142251 () Bool)

(assert (=> d!135881 m!1142251))

(declare-fun m!1142253 () Bool)

(assert (=> b!1239193 m!1142253))

(assert (=> b!1238997 d!135881))

(assert (=> b!1238992 d!135843))

(declare-fun d!135891 () Bool)

(declare-fun res!826748 () Bool)

(declare-fun e!702295 () Bool)

(assert (=> d!135891 (=> res!826748 e!702295)))

(assert (=> d!135891 (= res!826748 ((_ is Nil!27360) acc!846))))

(assert (=> d!135891 (= (noDuplicate!1978 acc!846) e!702295)))

(declare-fun b!1239214 () Bool)

(declare-fun e!702296 () Bool)

(assert (=> b!1239214 (= e!702295 e!702296)))

(declare-fun res!826749 () Bool)

(assert (=> b!1239214 (=> (not res!826749) (not e!702296))))

(assert (=> b!1239214 (= res!826749 (not (contains!7335 (t!40817 acc!846) (h!28568 acc!846))))))

(declare-fun b!1239215 () Bool)

(assert (=> b!1239215 (= e!702296 (noDuplicate!1978 (t!40817 acc!846)))))

(assert (= (and d!135891 (not res!826748)) b!1239214))

(assert (= (and b!1239214 res!826749) b!1239215))

(declare-fun m!1142263 () Bool)

(assert (=> b!1239214 m!1142263))

(declare-fun m!1142265 () Bool)

(assert (=> b!1239215 m!1142265))

(assert (=> b!1238991 d!135891))

(declare-fun d!135897 () Bool)

(assert (=> d!135897 (= (array_inv!29472 a!3835) (bvsge (size!39027 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103216 d!135897))

(declare-fun b!1239220 () Bool)

(declare-fun e!702301 () Bool)

(declare-fun e!702304 () Bool)

(assert (=> b!1239220 (= e!702301 e!702304)))

(declare-fun c!121096 () Bool)

(assert (=> b!1239220 (= c!121096 (validKeyInArray!0 (select (arr!38489 a!3835) from!3213)))))

(declare-fun e!702303 () Bool)

(declare-fun b!1239221 () Bool)

(assert (=> b!1239221 (= e!702303 (contains!7335 acc!846 (select (arr!38489 a!3835) from!3213)))))

(declare-fun b!1239222 () Bool)

(declare-fun call!61071 () Bool)

(assert (=> b!1239222 (= e!702304 call!61071)))

(declare-fun d!135899 () Bool)

(declare-fun res!826755 () Bool)

(declare-fun e!702302 () Bool)

(assert (=> d!135899 (=> res!826755 e!702302)))

(assert (=> d!135899 (= res!826755 (bvsge from!3213 (size!39027 a!3835)))))

(assert (=> d!135899 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!702302)))

(declare-fun b!1239223 () Bool)

(assert (=> b!1239223 (= e!702302 e!702301)))

(declare-fun res!826754 () Bool)

(assert (=> b!1239223 (=> (not res!826754) (not e!702301))))

(assert (=> b!1239223 (= res!826754 (not e!702303))))

(declare-fun res!826756 () Bool)

(assert (=> b!1239223 (=> (not res!826756) (not e!702303))))

(assert (=> b!1239223 (= res!826756 (validKeyInArray!0 (select (arr!38489 a!3835) from!3213)))))

(declare-fun bm!61068 () Bool)

(assert (=> bm!61068 (= call!61071 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121096 (Cons!27359 (select (arr!38489 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1239224 () Bool)

(assert (=> b!1239224 (= e!702304 call!61071)))

(assert (= (and d!135899 (not res!826755)) b!1239223))

(assert (= (and b!1239223 res!826756) b!1239221))

(assert (= (and b!1239223 res!826754) b!1239220))

(assert (= (and b!1239220 c!121096) b!1239222))

(assert (= (and b!1239220 (not c!121096)) b!1239224))

(assert (= (or b!1239222 b!1239224) bm!61068))

(assert (=> b!1239220 m!1142085))

(assert (=> b!1239220 m!1142085))

(assert (=> b!1239220 m!1142087))

(assert (=> b!1239221 m!1142085))

(assert (=> b!1239221 m!1142085))

(declare-fun m!1142271 () Bool)

(assert (=> b!1239221 m!1142271))

(assert (=> b!1239223 m!1142085))

(assert (=> b!1239223 m!1142085))

(assert (=> b!1239223 m!1142087))

(assert (=> bm!61068 m!1142085))

(declare-fun m!1142273 () Bool)

(assert (=> bm!61068 m!1142273))

(assert (=> b!1238988 d!135899))

(declare-fun d!135903 () Bool)

(declare-fun lt!561459 () Bool)

(assert (=> d!135903 (= lt!561459 (select (content!595 acc!846) k0!2925))))

(declare-fun e!702305 () Bool)

(assert (=> d!135903 (= lt!561459 e!702305)))

(declare-fun res!826758 () Bool)

(assert (=> d!135903 (=> (not res!826758) (not e!702305))))

(assert (=> d!135903 (= res!826758 ((_ is Cons!27359) acc!846))))

(assert (=> d!135903 (= (contains!7335 acc!846 k0!2925) lt!561459)))

(declare-fun b!1239225 () Bool)

(declare-fun e!702306 () Bool)

(assert (=> b!1239225 (= e!702305 e!702306)))

(declare-fun res!826757 () Bool)

(assert (=> b!1239225 (=> res!826757 e!702306)))

(assert (=> b!1239225 (= res!826757 (= (h!28568 acc!846) k0!2925))))

(declare-fun b!1239226 () Bool)

(assert (=> b!1239226 (= e!702306 (contains!7335 (t!40817 acc!846) k0!2925))))

(assert (= (and d!135903 res!826758) b!1239225))

(assert (= (and b!1239225 (not res!826757)) b!1239226))

(assert (=> d!135903 m!1142249))

(declare-fun m!1142275 () Bool)

(assert (=> d!135903 m!1142275))

(declare-fun m!1142277 () Bool)

(assert (=> b!1239226 m!1142277))

(assert (=> b!1238989 d!135903))

(declare-fun d!135905 () Bool)

(declare-fun lt!561460 () Bool)

(assert (=> d!135905 (= lt!561460 (select (content!595 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702307 () Bool)

(assert (=> d!135905 (= lt!561460 e!702307)))

(declare-fun res!826760 () Bool)

(assert (=> d!135905 (=> (not res!826760) (not e!702307))))

(assert (=> d!135905 (= res!826760 ((_ is Cons!27359) acc!846))))

(assert (=> d!135905 (= (contains!7335 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561460)))

(declare-fun b!1239227 () Bool)

(declare-fun e!702308 () Bool)

(assert (=> b!1239227 (= e!702307 e!702308)))

(declare-fun res!826759 () Bool)

(assert (=> b!1239227 (=> res!826759 e!702308)))

(assert (=> b!1239227 (= res!826759 (= (h!28568 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239228 () Bool)

(assert (=> b!1239228 (= e!702308 (contains!7335 (t!40817 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135905 res!826760) b!1239227))

(assert (= (and b!1239227 (not res!826759)) b!1239228))

(assert (=> d!135905 m!1142249))

(declare-fun m!1142279 () Bool)

(assert (=> d!135905 m!1142279))

(declare-fun m!1142281 () Bool)

(assert (=> b!1239228 m!1142281))

(assert (=> b!1238994 d!135905))

(check-sat (not b!1239220) (not b!1239146) (not b!1239228) (not b!1239083) (not d!135873) (not b!1239138) (not b!1239226) (not bm!61056) (not d!135905) (not b!1239084) (not b!1239071) (not bm!61062) (not b!1239133) (not d!135881) (not b!1239068) (not b!1239215) (not d!135903) (not d!135849) (not b!1239134) (not b!1239069) (not b!1239193) (not b!1239221) (not b!1239223) (not d!135867) (not b!1239214) (not bm!61068) (not b!1239147))
(check-sat)
