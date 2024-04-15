; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102688 () Bool)

(assert start!102688)

(declare-fun b!1234214 () Bool)

(declare-fun res!822433 () Bool)

(declare-fun e!700019 () Bool)

(assert (=> b!1234214 (=> (not res!822433) (not e!700019))))

(declare-datatypes ((array!79501 0))(
  ( (array!79502 (arr!38360 (Array (_ BitVec 32) (_ BitVec 64))) (size!38898 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79501)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234214 (= res!822433 (validKeyInArray!0 (select (arr!38360 a!3835) from!3213)))))

(declare-fun b!1234215 () Bool)

(declare-fun res!822436 () Bool)

(assert (=> b!1234215 (=> (not res!822436) (not e!700019))))

(declare-datatypes ((List!27234 0))(
  ( (Nil!27231) (Cons!27230 (h!28439 (_ BitVec 64)) (t!40688 List!27234)) )
))
(declare-fun acc!846 () List!27234)

(declare-fun contains!7206 (List!27234 (_ BitVec 64)) Bool)

(assert (=> b!1234215 (= res!822436 (not (contains!7206 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234216 () Bool)

(declare-fun res!822434 () Bool)

(assert (=> b!1234216 (=> (not res!822434) (not e!700019))))

(assert (=> b!1234216 (= res!822434 (not (contains!7206 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234217 () Bool)

(declare-fun lt!559654 () List!27234)

(declare-fun isEmpty!1008 (List!27234) Bool)

(assert (=> b!1234217 (= e!700019 (not (not (isEmpty!1008 lt!559654))))))

(declare-fun subseq!506 (List!27234 List!27234) Bool)

(assert (=> b!1234217 (subseq!506 lt!559654 lt!559654)))

(declare-datatypes ((Unit!40715 0))(
  ( (Unit!40716) )
))
(declare-fun lt!559655 () Unit!40715)

(declare-fun lemmaListSubSeqRefl!0 (List!27234) Unit!40715)

(assert (=> b!1234217 (= lt!559655 (lemmaListSubSeqRefl!0 lt!559654))))

(assert (=> b!1234217 (= lt!559654 (Cons!27230 (select (arr!38360 a!3835) from!3213) acc!846))))

(declare-fun b!1234218 () Bool)

(declare-fun res!822435 () Bool)

(assert (=> b!1234218 (=> (not res!822435) (not e!700019))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1234218 (= res!822435 (contains!7206 acc!846 k0!2925))))

(declare-fun b!1234219 () Bool)

(declare-fun res!822431 () Bool)

(assert (=> b!1234219 (=> (not res!822431) (not e!700019))))

(declare-fun arrayNoDuplicates!0 (array!79501 (_ BitVec 32) List!27234) Bool)

(assert (=> b!1234219 (= res!822431 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!822432 () Bool)

(assert (=> start!102688 (=> (not res!822432) (not e!700019))))

(assert (=> start!102688 (= res!822432 (and (bvslt (size!38898 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38898 a!3835))))))

(assert (=> start!102688 e!700019))

(declare-fun array_inv!29343 (array!79501) Bool)

(assert (=> start!102688 (array_inv!29343 a!3835)))

(assert (=> start!102688 true))

(declare-fun b!1234220 () Bool)

(declare-fun res!822437 () Bool)

(assert (=> b!1234220 (=> (not res!822437) (not e!700019))))

(declare-fun noDuplicate!1849 (List!27234) Bool)

(assert (=> b!1234220 (= res!822437 (noDuplicate!1849 acc!846))))

(declare-fun b!1234221 () Bool)

(declare-fun res!822430 () Bool)

(assert (=> b!1234221 (=> (not res!822430) (not e!700019))))

(assert (=> b!1234221 (= res!822430 (not (= from!3213 (bvsub (size!38898 a!3835) #b00000000000000000000000000000001))))))

(assert (= (and start!102688 res!822432) b!1234220))

(assert (= (and b!1234220 res!822437) b!1234216))

(assert (= (and b!1234216 res!822434) b!1234215))

(assert (= (and b!1234215 res!822436) b!1234219))

(assert (= (and b!1234219 res!822431) b!1234218))

(assert (= (and b!1234218 res!822435) b!1234221))

(assert (= (and b!1234221 res!822430) b!1234214))

(assert (= (and b!1234214 res!822433) b!1234217))

(declare-fun m!1137777 () Bool)

(assert (=> b!1234215 m!1137777))

(declare-fun m!1137779 () Bool)

(assert (=> b!1234216 m!1137779))

(declare-fun m!1137781 () Bool)

(assert (=> start!102688 m!1137781))

(declare-fun m!1137783 () Bool)

(assert (=> b!1234218 m!1137783))

(declare-fun m!1137785 () Bool)

(assert (=> b!1234217 m!1137785))

(declare-fun m!1137787 () Bool)

(assert (=> b!1234217 m!1137787))

(declare-fun m!1137789 () Bool)

(assert (=> b!1234217 m!1137789))

(declare-fun m!1137791 () Bool)

(assert (=> b!1234217 m!1137791))

(assert (=> b!1234214 m!1137791))

(assert (=> b!1234214 m!1137791))

(declare-fun m!1137793 () Bool)

(assert (=> b!1234214 m!1137793))

(declare-fun m!1137795 () Bool)

(assert (=> b!1234220 m!1137795))

(declare-fun m!1137797 () Bool)

(assert (=> b!1234219 m!1137797))

(check-sat (not b!1234214) (not b!1234220) (not b!1234219) (not b!1234217) (not b!1234215) (not b!1234218) (not b!1234216) (not start!102688))
(check-sat)
(get-model)

(declare-fun d!135271 () Bool)

(declare-fun lt!559670 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!578 (List!27234) (InoxSet (_ BitVec 64)))

(assert (=> d!135271 (= lt!559670 (select (content!578 acc!846) k0!2925))))

(declare-fun e!700036 () Bool)

(assert (=> d!135271 (= lt!559670 e!700036)))

(declare-fun res!822491 () Bool)

(assert (=> d!135271 (=> (not res!822491) (not e!700036))))

(get-info :version)

(assert (=> d!135271 (= res!822491 ((_ is Cons!27230) acc!846))))

(assert (=> d!135271 (= (contains!7206 acc!846 k0!2925) lt!559670)))

(declare-fun b!1234274 () Bool)

(declare-fun e!700037 () Bool)

(assert (=> b!1234274 (= e!700036 e!700037)))

(declare-fun res!822490 () Bool)

(assert (=> b!1234274 (=> res!822490 e!700037)))

(assert (=> b!1234274 (= res!822490 (= (h!28439 acc!846) k0!2925))))

(declare-fun b!1234275 () Bool)

(assert (=> b!1234275 (= e!700037 (contains!7206 (t!40688 acc!846) k0!2925))))

(assert (= (and d!135271 res!822491) b!1234274))

(assert (= (and b!1234274 (not res!822490)) b!1234275))

(declare-fun m!1137843 () Bool)

(assert (=> d!135271 m!1137843))

(declare-fun m!1137845 () Bool)

(assert (=> d!135271 m!1137845))

(declare-fun m!1137847 () Bool)

(assert (=> b!1234275 m!1137847))

(assert (=> b!1234218 d!135271))

(declare-fun d!135273 () Bool)

(declare-fun res!822496 () Bool)

(declare-fun e!700042 () Bool)

(assert (=> d!135273 (=> res!822496 e!700042)))

(assert (=> d!135273 (= res!822496 ((_ is Nil!27231) acc!846))))

(assert (=> d!135273 (= (noDuplicate!1849 acc!846) e!700042)))

(declare-fun b!1234280 () Bool)

(declare-fun e!700043 () Bool)

(assert (=> b!1234280 (= e!700042 e!700043)))

(declare-fun res!822497 () Bool)

(assert (=> b!1234280 (=> (not res!822497) (not e!700043))))

(assert (=> b!1234280 (= res!822497 (not (contains!7206 (t!40688 acc!846) (h!28439 acc!846))))))

(declare-fun b!1234281 () Bool)

(assert (=> b!1234281 (= e!700043 (noDuplicate!1849 (t!40688 acc!846)))))

(assert (= (and d!135273 (not res!822496)) b!1234280))

(assert (= (and b!1234280 res!822497) b!1234281))

(declare-fun m!1137849 () Bool)

(assert (=> b!1234280 m!1137849))

(declare-fun m!1137851 () Bool)

(assert (=> b!1234281 m!1137851))

(assert (=> b!1234220 d!135273))

(declare-fun d!135277 () Bool)

(assert (=> d!135277 (= (array_inv!29343 a!3835) (bvsge (size!38898 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!102688 d!135277))

(declare-fun d!135281 () Bool)

(assert (=> d!135281 (= (validKeyInArray!0 (select (arr!38360 a!3835) from!3213)) (and (not (= (select (arr!38360 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38360 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1234214 d!135281))

(declare-fun b!1234323 () Bool)

(declare-fun e!700080 () Bool)

(declare-fun call!60972 () Bool)

(assert (=> b!1234323 (= e!700080 call!60972)))

(declare-fun c!120760 () Bool)

(declare-fun bm!60969 () Bool)

(assert (=> bm!60969 (= call!60972 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120760 (Cons!27230 (select (arr!38360 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun e!700083 () Bool)

(declare-fun b!1234325 () Bool)

(assert (=> b!1234325 (= e!700083 (contains!7206 acc!846 (select (arr!38360 a!3835) from!3213)))))

(declare-fun b!1234326 () Bool)

(declare-fun e!700081 () Bool)

(declare-fun e!700082 () Bool)

(assert (=> b!1234326 (= e!700081 e!700082)))

(declare-fun res!822529 () Bool)

(assert (=> b!1234326 (=> (not res!822529) (not e!700082))))

(assert (=> b!1234326 (= res!822529 (not e!700083))))

(declare-fun res!822531 () Bool)

(assert (=> b!1234326 (=> (not res!822531) (not e!700083))))

(assert (=> b!1234326 (= res!822531 (validKeyInArray!0 (select (arr!38360 a!3835) from!3213)))))

(declare-fun b!1234327 () Bool)

(assert (=> b!1234327 (= e!700082 e!700080)))

(assert (=> b!1234327 (= c!120760 (validKeyInArray!0 (select (arr!38360 a!3835) from!3213)))))

(declare-fun d!135287 () Bool)

(declare-fun res!822530 () Bool)

(assert (=> d!135287 (=> res!822530 e!700081)))

(assert (=> d!135287 (= res!822530 (bvsge from!3213 (size!38898 a!3835)))))

(assert (=> d!135287 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!700081)))

(declare-fun b!1234324 () Bool)

(assert (=> b!1234324 (= e!700080 call!60972)))

(assert (= (and d!135287 (not res!822530)) b!1234326))

(assert (= (and b!1234326 res!822531) b!1234325))

(assert (= (and b!1234326 res!822529) b!1234327))

(assert (= (and b!1234327 c!120760) b!1234324))

(assert (= (and b!1234327 (not c!120760)) b!1234323))

(assert (= (or b!1234324 b!1234323) bm!60969))

(assert (=> bm!60969 m!1137791))

(declare-fun m!1137863 () Bool)

(assert (=> bm!60969 m!1137863))

(assert (=> b!1234325 m!1137791))

(assert (=> b!1234325 m!1137791))

(declare-fun m!1137865 () Bool)

(assert (=> b!1234325 m!1137865))

(assert (=> b!1234326 m!1137791))

(assert (=> b!1234326 m!1137791))

(assert (=> b!1234326 m!1137793))

(assert (=> b!1234327 m!1137791))

(assert (=> b!1234327 m!1137791))

(assert (=> b!1234327 m!1137793))

(assert (=> b!1234219 d!135287))

(declare-fun d!135295 () Bool)

(declare-fun lt!559674 () Bool)

(assert (=> d!135295 (= lt!559674 (select (content!578 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700086 () Bool)

(assert (=> d!135295 (= lt!559674 e!700086)))

(declare-fun res!822535 () Bool)

(assert (=> d!135295 (=> (not res!822535) (not e!700086))))

(assert (=> d!135295 (= res!822535 ((_ is Cons!27230) acc!846))))

(assert (=> d!135295 (= (contains!7206 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559674)))

(declare-fun b!1234330 () Bool)

(declare-fun e!700087 () Bool)

(assert (=> b!1234330 (= e!700086 e!700087)))

(declare-fun res!822534 () Bool)

(assert (=> b!1234330 (=> res!822534 e!700087)))

(assert (=> b!1234330 (= res!822534 (= (h!28439 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234331 () Bool)

(assert (=> b!1234331 (= e!700087 (contains!7206 (t!40688 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135295 res!822535) b!1234330))

(assert (= (and b!1234330 (not res!822534)) b!1234331))

(assert (=> d!135295 m!1137843))

(declare-fun m!1137871 () Bool)

(assert (=> d!135295 m!1137871))

(declare-fun m!1137873 () Bool)

(assert (=> b!1234331 m!1137873))

(assert (=> b!1234216 d!135295))

(declare-fun d!135299 () Bool)

(declare-fun lt!559675 () Bool)

(assert (=> d!135299 (= lt!559675 (select (content!578 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700088 () Bool)

(assert (=> d!135299 (= lt!559675 e!700088)))

(declare-fun res!822537 () Bool)

(assert (=> d!135299 (=> (not res!822537) (not e!700088))))

(assert (=> d!135299 (= res!822537 ((_ is Cons!27230) acc!846))))

(assert (=> d!135299 (= (contains!7206 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559675)))

(declare-fun b!1234332 () Bool)

(declare-fun e!700089 () Bool)

(assert (=> b!1234332 (= e!700088 e!700089)))

(declare-fun res!822536 () Bool)

(assert (=> b!1234332 (=> res!822536 e!700089)))

(assert (=> b!1234332 (= res!822536 (= (h!28439 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234333 () Bool)

(assert (=> b!1234333 (= e!700089 (contains!7206 (t!40688 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135299 res!822537) b!1234332))

(assert (= (and b!1234332 (not res!822536)) b!1234333))

(assert (=> d!135299 m!1137843))

(declare-fun m!1137875 () Bool)

(assert (=> d!135299 m!1137875))

(declare-fun m!1137877 () Bool)

(assert (=> b!1234333 m!1137877))

(assert (=> b!1234215 d!135299))

(declare-fun d!135301 () Bool)

(assert (=> d!135301 (= (isEmpty!1008 lt!559654) ((_ is Nil!27231) lt!559654))))

(assert (=> b!1234217 d!135301))

(declare-fun b!1234364 () Bool)

(declare-fun e!700119 () Bool)

(assert (=> b!1234364 (= e!700119 (subseq!506 (t!40688 lt!559654) (t!40688 lt!559654)))))

(declare-fun b!1234362 () Bool)

(declare-fun e!700121 () Bool)

(declare-fun e!700120 () Bool)

(assert (=> b!1234362 (= e!700121 e!700120)))

(declare-fun res!822567 () Bool)

(assert (=> b!1234362 (=> (not res!822567) (not e!700120))))

(assert (=> b!1234362 (= res!822567 ((_ is Cons!27230) lt!559654))))

(declare-fun b!1234363 () Bool)

(declare-fun e!700118 () Bool)

(assert (=> b!1234363 (= e!700120 e!700118)))

(declare-fun res!822569 () Bool)

(assert (=> b!1234363 (=> res!822569 e!700118)))

(assert (=> b!1234363 (= res!822569 e!700119)))

(declare-fun res!822568 () Bool)

(assert (=> b!1234363 (=> (not res!822568) (not e!700119))))

(assert (=> b!1234363 (= res!822568 (= (h!28439 lt!559654) (h!28439 lt!559654)))))

(declare-fun d!135303 () Bool)

(declare-fun res!822566 () Bool)

(assert (=> d!135303 (=> res!822566 e!700121)))

(assert (=> d!135303 (= res!822566 ((_ is Nil!27231) lt!559654))))

(assert (=> d!135303 (= (subseq!506 lt!559654 lt!559654) e!700121)))

(declare-fun b!1234365 () Bool)

(assert (=> b!1234365 (= e!700118 (subseq!506 lt!559654 (t!40688 lt!559654)))))

(assert (= (and d!135303 (not res!822566)) b!1234362))

(assert (= (and b!1234362 res!822567) b!1234363))

(assert (= (and b!1234363 res!822568) b!1234364))

(assert (= (and b!1234363 (not res!822569)) b!1234365))

(declare-fun m!1137899 () Bool)

(assert (=> b!1234364 m!1137899))

(declare-fun m!1137901 () Bool)

(assert (=> b!1234365 m!1137901))

(assert (=> b!1234217 d!135303))

(declare-fun d!135315 () Bool)

(assert (=> d!135315 (subseq!506 lt!559654 lt!559654)))

(declare-fun lt!559685 () Unit!40715)

(declare-fun choose!36 (List!27234) Unit!40715)

(assert (=> d!135315 (= lt!559685 (choose!36 lt!559654))))

(assert (=> d!135315 (= (lemmaListSubSeqRefl!0 lt!559654) lt!559685)))

(declare-fun bs!34667 () Bool)

(assert (= bs!34667 d!135315))

(assert (=> bs!34667 m!1137787))

(declare-fun m!1137903 () Bool)

(assert (=> bs!34667 m!1137903))

(assert (=> b!1234217 d!135315))

(check-sat (not b!1234275) (not b!1234364) (not b!1234365) (not bm!60969) (not b!1234280) (not d!135271) (not d!135299) (not d!135315) (not b!1234326) (not b!1234325) (not b!1234281) (not d!135295) (not b!1234331) (not b!1234333) (not b!1234327))
(check-sat)
