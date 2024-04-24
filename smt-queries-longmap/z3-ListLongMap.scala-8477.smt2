; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103456 () Bool)

(assert start!103456)

(declare-fun b!1240380 () Bool)

(declare-fun res!827145 () Bool)

(declare-fun e!703030 () Bool)

(assert (=> b!1240380 (=> (not res!827145) (not e!703030))))

(declare-datatypes ((List!27326 0))(
  ( (Nil!27323) (Cons!27322 (h!28540 (_ BitVec 64)) (t!40781 List!27326)) )
))
(declare-fun acc!846 () List!27326)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7397 (List!27326 (_ BitVec 64)) Bool)

(assert (=> b!1240380 (= res!827145 (contains!7397 acc!846 k0!2925))))

(declare-fun b!1240381 () Bool)

(declare-datatypes ((Unit!41134 0))(
  ( (Unit!41135) )
))
(declare-fun e!703031 () Unit!41134)

(declare-fun lt!562064 () Unit!41134)

(assert (=> b!1240381 (= e!703031 lt!562064)))

(declare-fun lt!562065 () List!27326)

(declare-datatypes ((array!79889 0))(
  ( (array!79890 (arr!38540 (Array (_ BitVec 32) (_ BitVec 64))) (size!39077 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79889)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1240381 (= lt!562065 (Cons!27322 (select (arr!38540 a!3835) from!3213) acc!846))))

(declare-fun lt!562063 () Unit!41134)

(declare-fun lemmaListSubSeqRefl!0 (List!27326) Unit!41134)

(assert (=> b!1240381 (= lt!562063 (lemmaListSubSeqRefl!0 lt!562065))))

(declare-fun subseq!617 (List!27326 List!27326) Bool)

(assert (=> b!1240381 (subseq!617 lt!562065 lt!562065)))

(declare-fun lt!562066 () Unit!41134)

(declare-fun subseqTail!104 (List!27326 List!27326) Unit!41134)

(assert (=> b!1240381 (= lt!562066 (subseqTail!104 lt!562065 lt!562065))))

(assert (=> b!1240381 (subseq!617 acc!846 lt!562065)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79889 List!27326 List!27326 (_ BitVec 32)) Unit!41134)

(assert (=> b!1240381 (= lt!562064 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!562065 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79889 (_ BitVec 32) List!27326) Bool)

(assert (=> b!1240381 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1240382 () Bool)

(declare-fun res!827144 () Bool)

(assert (=> b!1240382 (=> (not res!827144) (not e!703030))))

(assert (=> b!1240382 (= res!827144 (not (contains!7397 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240383 () Bool)

(declare-fun e!703028 () Bool)

(assert (=> b!1240383 (= e!703028 (not (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))))

(declare-fun b!1240384 () Bool)

(declare-fun res!827143 () Bool)

(assert (=> b!1240384 (=> (not res!827143) (not e!703030))))

(assert (=> b!1240384 (= res!827143 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!827146 () Bool)

(assert (=> start!103456 (=> (not res!827146) (not e!703030))))

(assert (=> start!103456 (= res!827146 (and (bvslt (size!39077 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39077 a!3835))))))

(assert (=> start!103456 e!703030))

(declare-fun array_inv!29478 (array!79889) Bool)

(assert (=> start!103456 (array_inv!29478 a!3835)))

(assert (=> start!103456 true))

(declare-fun b!1240385 () Bool)

(assert (=> b!1240385 (= e!703030 e!703028)))

(declare-fun res!827141 () Bool)

(assert (=> b!1240385 (=> (not res!827141) (not e!703028))))

(assert (=> b!1240385 (= res!827141 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39077 a!3835))))))

(declare-fun lt!562067 () Unit!41134)

(assert (=> b!1240385 (= lt!562067 e!703031)))

(declare-fun c!121487 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1240385 (= c!121487 (validKeyInArray!0 (select (arr!38540 a!3835) from!3213)))))

(declare-fun b!1240386 () Bool)

(declare-fun res!827147 () Bool)

(assert (=> b!1240386 (=> (not res!827147) (not e!703030))))

(assert (=> b!1240386 (= res!827147 (not (= from!3213 (bvsub (size!39077 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1240387 () Bool)

(declare-fun res!827142 () Bool)

(assert (=> b!1240387 (=> (not res!827142) (not e!703030))))

(assert (=> b!1240387 (= res!827142 (not (contains!7397 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240388 () Bool)

(declare-fun res!827148 () Bool)

(assert (=> b!1240388 (=> (not res!827148) (not e!703030))))

(declare-fun noDuplicate!1978 (List!27326) Bool)

(assert (=> b!1240388 (= res!827148 (noDuplicate!1978 acc!846))))

(declare-fun b!1240389 () Bool)

(declare-fun Unit!41136 () Unit!41134)

(assert (=> b!1240389 (= e!703031 Unit!41136)))

(assert (= (and start!103456 res!827146) b!1240388))

(assert (= (and b!1240388 res!827148) b!1240387))

(assert (= (and b!1240387 res!827142) b!1240382))

(assert (= (and b!1240382 res!827144) b!1240384))

(assert (= (and b!1240384 res!827143) b!1240380))

(assert (= (and b!1240380 res!827145) b!1240386))

(assert (= (and b!1240386 res!827147) b!1240385))

(assert (= (and b!1240385 c!121487) b!1240381))

(assert (= (and b!1240385 (not c!121487)) b!1240389))

(assert (= (and b!1240385 res!827141) b!1240383))

(declare-fun m!1144223 () Bool)

(assert (=> b!1240387 m!1144223))

(declare-fun m!1144225 () Bool)

(assert (=> b!1240380 m!1144225))

(declare-fun m!1144227 () Bool)

(assert (=> start!103456 m!1144227))

(declare-fun m!1144229 () Bool)

(assert (=> b!1240383 m!1144229))

(declare-fun m!1144231 () Bool)

(assert (=> b!1240381 m!1144231))

(declare-fun m!1144233 () Bool)

(assert (=> b!1240381 m!1144233))

(declare-fun m!1144235 () Bool)

(assert (=> b!1240381 m!1144235))

(declare-fun m!1144237 () Bool)

(assert (=> b!1240381 m!1144237))

(declare-fun m!1144239 () Bool)

(assert (=> b!1240381 m!1144239))

(assert (=> b!1240381 m!1144229))

(declare-fun m!1144241 () Bool)

(assert (=> b!1240381 m!1144241))

(assert (=> b!1240385 m!1144241))

(assert (=> b!1240385 m!1144241))

(declare-fun m!1144243 () Bool)

(assert (=> b!1240385 m!1144243))

(declare-fun m!1144245 () Bool)

(assert (=> b!1240384 m!1144245))

(declare-fun m!1144247 () Bool)

(assert (=> b!1240388 m!1144247))

(declare-fun m!1144249 () Bool)

(assert (=> b!1240382 m!1144249))

(check-sat (not b!1240388) (not b!1240380) (not b!1240382) (not b!1240387) (not b!1240385) (not b!1240381) (not b!1240384) (not b!1240383) (not start!103456))
(check-sat)
(get-model)

(declare-fun d!136425 () Bool)

(declare-fun lt!562100 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!592 (List!27326) (InoxSet (_ BitVec 64)))

(assert (=> d!136425 (= lt!562100 (select (content!592 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!703061 () Bool)

(assert (=> d!136425 (= lt!562100 e!703061)))

(declare-fun res!827201 () Bool)

(assert (=> d!136425 (=> (not res!827201) (not e!703061))))

(get-info :version)

(assert (=> d!136425 (= res!827201 ((_ is Cons!27322) acc!846))))

(assert (=> d!136425 (= (contains!7397 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562100)))

(declare-fun b!1240454 () Bool)

(declare-fun e!703060 () Bool)

(assert (=> b!1240454 (= e!703061 e!703060)))

(declare-fun res!827202 () Bool)

(assert (=> b!1240454 (=> res!827202 e!703060)))

(assert (=> b!1240454 (= res!827202 (= (h!28540 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1240455 () Bool)

(assert (=> b!1240455 (= e!703060 (contains!7397 (t!40781 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136425 res!827201) b!1240454))

(assert (= (and b!1240454 (not res!827202)) b!1240455))

(declare-fun m!1144307 () Bool)

(assert (=> d!136425 m!1144307))

(declare-fun m!1144309 () Bool)

(assert (=> d!136425 m!1144309))

(declare-fun m!1144311 () Bool)

(assert (=> b!1240455 m!1144311))

(assert (=> b!1240382 d!136425))

(declare-fun d!136427 () Bool)

(declare-fun lt!562101 () Bool)

(assert (=> d!136427 (= lt!562101 (select (content!592 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!703063 () Bool)

(assert (=> d!136427 (= lt!562101 e!703063)))

(declare-fun res!827203 () Bool)

(assert (=> d!136427 (=> (not res!827203) (not e!703063))))

(assert (=> d!136427 (= res!827203 ((_ is Cons!27322) acc!846))))

(assert (=> d!136427 (= (contains!7397 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562101)))

(declare-fun b!1240456 () Bool)

(declare-fun e!703062 () Bool)

(assert (=> b!1240456 (= e!703063 e!703062)))

(declare-fun res!827204 () Bool)

(assert (=> b!1240456 (=> res!827204 e!703062)))

(assert (=> b!1240456 (= res!827204 (= (h!28540 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1240457 () Bool)

(assert (=> b!1240457 (= e!703062 (contains!7397 (t!40781 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136427 res!827203) b!1240456))

(assert (= (and b!1240456 (not res!827204)) b!1240457))

(assert (=> d!136427 m!1144307))

(declare-fun m!1144313 () Bool)

(assert (=> d!136427 m!1144313))

(declare-fun m!1144315 () Bool)

(assert (=> b!1240457 m!1144315))

(assert (=> b!1240387 d!136427))

(declare-fun b!1240468 () Bool)

(declare-fun e!703075 () Bool)

(declare-fun call!61146 () Bool)

(assert (=> b!1240468 (= e!703075 call!61146)))

(declare-fun b!1240469 () Bool)

(assert (=> b!1240469 (= e!703075 call!61146)))

(declare-fun e!703072 () Bool)

(declare-fun b!1240470 () Bool)

(assert (=> b!1240470 (= e!703072 (contains!7397 acc!846 (select (arr!38540 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun c!121496 () Bool)

(declare-fun bm!61143 () Bool)

(assert (=> bm!61143 (= call!61146 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (ite c!121496 (Cons!27322 (select (arr!38540 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) acc!846) acc!846)))))

(declare-fun d!136429 () Bool)

(declare-fun res!827212 () Bool)

(declare-fun e!703073 () Bool)

(assert (=> d!136429 (=> res!827212 e!703073)))

(assert (=> d!136429 (= res!827212 (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39077 a!3835)))))

(assert (=> d!136429 (= (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846) e!703073)))

(declare-fun b!1240471 () Bool)

(declare-fun e!703074 () Bool)

(assert (=> b!1240471 (= e!703074 e!703075)))

(assert (=> b!1240471 (= c!121496 (validKeyInArray!0 (select (arr!38540 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1240472 () Bool)

(assert (=> b!1240472 (= e!703073 e!703074)))

(declare-fun res!827211 () Bool)

(assert (=> b!1240472 (=> (not res!827211) (not e!703074))))

(assert (=> b!1240472 (= res!827211 (not e!703072))))

(declare-fun res!827213 () Bool)

(assert (=> b!1240472 (=> (not res!827213) (not e!703072))))

(assert (=> b!1240472 (= res!827213 (validKeyInArray!0 (select (arr!38540 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(assert (= (and d!136429 (not res!827212)) b!1240472))

(assert (= (and b!1240472 res!827213) b!1240470))

(assert (= (and b!1240472 res!827211) b!1240471))

(assert (= (and b!1240471 c!121496) b!1240469))

(assert (= (and b!1240471 (not c!121496)) b!1240468))

(assert (= (or b!1240469 b!1240468) bm!61143))

(declare-fun m!1144317 () Bool)

(assert (=> b!1240470 m!1144317))

(assert (=> b!1240470 m!1144317))

(declare-fun m!1144319 () Bool)

(assert (=> b!1240470 m!1144319))

(assert (=> bm!61143 m!1144317))

(declare-fun m!1144321 () Bool)

(assert (=> bm!61143 m!1144321))

(assert (=> b!1240471 m!1144317))

(assert (=> b!1240471 m!1144317))

(declare-fun m!1144323 () Bool)

(assert (=> b!1240471 m!1144323))

(assert (=> b!1240472 m!1144317))

(assert (=> b!1240472 m!1144317))

(assert (=> b!1240472 m!1144323))

(assert (=> b!1240383 d!136429))

(declare-fun d!136433 () Bool)

(declare-fun res!827224 () Bool)

(declare-fun e!703086 () Bool)

(assert (=> d!136433 (=> res!827224 e!703086)))

(assert (=> d!136433 (= res!827224 ((_ is Nil!27323) acc!846))))

(assert (=> d!136433 (= (noDuplicate!1978 acc!846) e!703086)))

(declare-fun b!1240483 () Bool)

(declare-fun e!703087 () Bool)

(assert (=> b!1240483 (= e!703086 e!703087)))

(declare-fun res!827225 () Bool)

(assert (=> b!1240483 (=> (not res!827225) (not e!703087))))

(assert (=> b!1240483 (= res!827225 (not (contains!7397 (t!40781 acc!846) (h!28540 acc!846))))))

(declare-fun b!1240484 () Bool)

(assert (=> b!1240484 (= e!703087 (noDuplicate!1978 (t!40781 acc!846)))))

(assert (= (and d!136433 (not res!827224)) b!1240483))

(assert (= (and b!1240483 res!827225) b!1240484))

(declare-fun m!1144331 () Bool)

(assert (=> b!1240483 m!1144331))

(declare-fun m!1144333 () Bool)

(assert (=> b!1240484 m!1144333))

(assert (=> b!1240388 d!136433))

(declare-fun d!136437 () Bool)

(assert (=> d!136437 (= (array_inv!29478 a!3835) (bvsge (size!39077 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103456 d!136437))

(declare-fun d!136439 () Bool)

(assert (=> d!136439 (= (validKeyInArray!0 (select (arr!38540 a!3835) from!3213)) (and (not (= (select (arr!38540 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38540 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1240385 d!136439))

(declare-fun b!1240493 () Bool)

(declare-fun e!703099 () Bool)

(declare-fun call!61147 () Bool)

(assert (=> b!1240493 (= e!703099 call!61147)))

(declare-fun b!1240494 () Bool)

(assert (=> b!1240494 (= e!703099 call!61147)))

(declare-fun e!703096 () Bool)

(declare-fun b!1240495 () Bool)

(assert (=> b!1240495 (= e!703096 (contains!7397 acc!846 (select (arr!38540 a!3835) from!3213)))))

(declare-fun bm!61144 () Bool)

(declare-fun c!121497 () Bool)

(assert (=> bm!61144 (= call!61147 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121497 (Cons!27322 (select (arr!38540 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun d!136443 () Bool)

(declare-fun res!827235 () Bool)

(declare-fun e!703097 () Bool)

(assert (=> d!136443 (=> res!827235 e!703097)))

(assert (=> d!136443 (= res!827235 (bvsge from!3213 (size!39077 a!3835)))))

(assert (=> d!136443 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!703097)))

(declare-fun b!1240496 () Bool)

(declare-fun e!703098 () Bool)

(assert (=> b!1240496 (= e!703098 e!703099)))

(assert (=> b!1240496 (= c!121497 (validKeyInArray!0 (select (arr!38540 a!3835) from!3213)))))

(declare-fun b!1240497 () Bool)

(assert (=> b!1240497 (= e!703097 e!703098)))

(declare-fun res!827234 () Bool)

(assert (=> b!1240497 (=> (not res!827234) (not e!703098))))

(assert (=> b!1240497 (= res!827234 (not e!703096))))

(declare-fun res!827236 () Bool)

(assert (=> b!1240497 (=> (not res!827236) (not e!703096))))

(assert (=> b!1240497 (= res!827236 (validKeyInArray!0 (select (arr!38540 a!3835) from!3213)))))

(assert (= (and d!136443 (not res!827235)) b!1240497))

(assert (= (and b!1240497 res!827236) b!1240495))

(assert (= (and b!1240497 res!827234) b!1240496))

(assert (= (and b!1240496 c!121497) b!1240494))

(assert (= (and b!1240496 (not c!121497)) b!1240493))

(assert (= (or b!1240494 b!1240493) bm!61144))

(assert (=> b!1240495 m!1144241))

(assert (=> b!1240495 m!1144241))

(declare-fun m!1144343 () Bool)

(assert (=> b!1240495 m!1144343))

(assert (=> bm!61144 m!1144241))

(declare-fun m!1144345 () Bool)

(assert (=> bm!61144 m!1144345))

(assert (=> b!1240496 m!1144241))

(assert (=> b!1240496 m!1144241))

(assert (=> b!1240496 m!1144243))

(assert (=> b!1240497 m!1144241))

(assert (=> b!1240497 m!1144241))

(assert (=> b!1240497 m!1144243))

(assert (=> b!1240384 d!136443))

(declare-fun b!1240531 () Bool)

(declare-fun e!703124 () Bool)

(assert (=> b!1240531 (= e!703124 (subseq!617 lt!562065 lt!562065))))

(declare-fun b!1240532 () Bool)

(declare-fun e!703126 () Unit!41134)

(declare-fun Unit!41143 () Unit!41134)

(assert (=> b!1240532 (= e!703126 Unit!41143)))

(declare-fun d!136447 () Bool)

(declare-fun tail!169 (List!27326) List!27326)

(assert (=> d!136447 (subseq!617 (tail!169 lt!562065) lt!562065)))

(declare-fun lt!562110 () Unit!41134)

(assert (=> d!136447 (= lt!562110 e!703126)))

(declare-fun c!121508 () Bool)

(assert (=> d!136447 (= c!121508 (and ((_ is Cons!27322) lt!562065) ((_ is Cons!27322) lt!562065)))))

(assert (=> d!136447 e!703124))

(declare-fun res!827252 () Bool)

(assert (=> d!136447 (=> (not res!827252) (not e!703124))))

(declare-fun isEmpty!1021 (List!27326) Bool)

(assert (=> d!136447 (= res!827252 (not (isEmpty!1021 lt!562065)))))

(assert (=> d!136447 (= (subseqTail!104 lt!562065 lt!562065) lt!562110)))

(declare-fun b!1240533 () Bool)

(declare-fun e!703127 () Unit!41134)

(declare-fun call!61153 () Unit!41134)

(assert (=> b!1240533 (= e!703127 call!61153)))

(declare-fun bm!61150 () Bool)

(declare-fun c!121507 () Bool)

(assert (=> bm!61150 (= call!61153 (subseqTail!104 (ite c!121507 lt!562065 (t!40781 lt!562065)) (t!40781 lt!562065)))))

(declare-fun b!1240534 () Bool)

(declare-fun e!703125 () Unit!41134)

(declare-fun Unit!41144 () Unit!41134)

(assert (=> b!1240534 (= e!703125 Unit!41144)))

(declare-fun b!1240535 () Bool)

(declare-fun c!121509 () Bool)

(assert (=> b!1240535 (= c!121509 (not (isEmpty!1021 (t!40781 lt!562065))))))

(assert (=> b!1240535 (= e!703127 e!703125)))

(declare-fun b!1240536 () Bool)

(assert (=> b!1240536 (= e!703125 call!61153)))

(declare-fun b!1240537 () Bool)

(assert (=> b!1240537 (= e!703126 e!703127)))

(assert (=> b!1240537 (= c!121507 (subseq!617 lt!562065 (t!40781 lt!562065)))))

(assert (= (and d!136447 res!827252) b!1240531))

(assert (= (and d!136447 c!121508) b!1240537))

(assert (= (and d!136447 (not c!121508)) b!1240532))

(assert (= (and b!1240537 c!121507) b!1240533))

(assert (= (and b!1240537 (not c!121507)) b!1240535))

(assert (= (and b!1240535 c!121509) b!1240536))

(assert (= (and b!1240535 (not c!121509)) b!1240534))

(assert (= (or b!1240533 b!1240536) bm!61150))

(declare-fun m!1144355 () Bool)

(assert (=> d!136447 m!1144355))

(assert (=> d!136447 m!1144355))

(declare-fun m!1144357 () Bool)

(assert (=> d!136447 m!1144357))

(declare-fun m!1144359 () Bool)

(assert (=> d!136447 m!1144359))

(declare-fun m!1144361 () Bool)

(assert (=> b!1240537 m!1144361))

(declare-fun m!1144363 () Bool)

(assert (=> b!1240535 m!1144363))

(declare-fun m!1144365 () Bool)

(assert (=> bm!61150 m!1144365))

(assert (=> b!1240531 m!1144233))

(assert (=> b!1240381 d!136447))

(assert (=> b!1240381 d!136429))

(declare-fun b!1240568 () Bool)

(declare-fun e!703158 () Bool)

(assert (=> b!1240568 (= e!703158 (subseq!617 (t!40781 acc!846) (t!40781 lt!562065)))))

(declare-fun d!136453 () Bool)

(declare-fun res!827282 () Bool)

(declare-fun e!703156 () Bool)

(assert (=> d!136453 (=> res!827282 e!703156)))

(assert (=> d!136453 (= res!827282 ((_ is Nil!27323) acc!846))))

(assert (=> d!136453 (= (subseq!617 acc!846 lt!562065) e!703156)))

(declare-fun b!1240566 () Bool)

(declare-fun e!703157 () Bool)

(assert (=> b!1240566 (= e!703156 e!703157)))

(declare-fun res!827281 () Bool)

(assert (=> b!1240566 (=> (not res!827281) (not e!703157))))

(assert (=> b!1240566 (= res!827281 ((_ is Cons!27322) lt!562065))))

(declare-fun b!1240567 () Bool)

(declare-fun e!703159 () Bool)

(assert (=> b!1240567 (= e!703157 e!703159)))

(declare-fun res!827284 () Bool)

(assert (=> b!1240567 (=> res!827284 e!703159)))

(assert (=> b!1240567 (= res!827284 e!703158)))

(declare-fun res!827283 () Bool)

(assert (=> b!1240567 (=> (not res!827283) (not e!703158))))

(assert (=> b!1240567 (= res!827283 (= (h!28540 acc!846) (h!28540 lt!562065)))))

(declare-fun b!1240569 () Bool)

(assert (=> b!1240569 (= e!703159 (subseq!617 acc!846 (t!40781 lt!562065)))))

(assert (= (and d!136453 (not res!827282)) b!1240566))

(assert (= (and b!1240566 res!827281) b!1240567))

(assert (= (and b!1240567 res!827283) b!1240568))

(assert (= (and b!1240567 (not res!827284)) b!1240569))

(declare-fun m!1144383 () Bool)

(assert (=> b!1240568 m!1144383))

(declare-fun m!1144385 () Bool)

(assert (=> b!1240569 m!1144385))

(assert (=> b!1240381 d!136453))

(declare-fun d!136463 () Bool)

(assert (=> d!136463 (subseq!617 lt!562065 lt!562065)))

(declare-fun lt!562120 () Unit!41134)

(declare-fun choose!36 (List!27326) Unit!41134)

(assert (=> d!136463 (= lt!562120 (choose!36 lt!562065))))

(assert (=> d!136463 (= (lemmaListSubSeqRefl!0 lt!562065) lt!562120)))

(declare-fun bs!34861 () Bool)

(assert (= bs!34861 d!136463))

(assert (=> bs!34861 m!1144233))

(declare-fun m!1144389 () Bool)

(assert (=> bs!34861 m!1144389))

(assert (=> b!1240381 d!136463))

(declare-fun b!1240572 () Bool)

(declare-fun e!703162 () Bool)

(assert (=> b!1240572 (= e!703162 (subseq!617 (t!40781 lt!562065) (t!40781 lt!562065)))))

(declare-fun d!136467 () Bool)

(declare-fun res!827286 () Bool)

(declare-fun e!703160 () Bool)

(assert (=> d!136467 (=> res!827286 e!703160)))

(assert (=> d!136467 (= res!827286 ((_ is Nil!27323) lt!562065))))

(assert (=> d!136467 (= (subseq!617 lt!562065 lt!562065) e!703160)))

(declare-fun b!1240570 () Bool)

(declare-fun e!703161 () Bool)

(assert (=> b!1240570 (= e!703160 e!703161)))

(declare-fun res!827285 () Bool)

(assert (=> b!1240570 (=> (not res!827285) (not e!703161))))

(assert (=> b!1240570 (= res!827285 ((_ is Cons!27322) lt!562065))))

(declare-fun b!1240571 () Bool)

(declare-fun e!703163 () Bool)

(assert (=> b!1240571 (= e!703161 e!703163)))

(declare-fun res!827288 () Bool)

(assert (=> b!1240571 (=> res!827288 e!703163)))

(assert (=> b!1240571 (= res!827288 e!703162)))

(declare-fun res!827287 () Bool)

(assert (=> b!1240571 (=> (not res!827287) (not e!703162))))

(assert (=> b!1240571 (= res!827287 (= (h!28540 lt!562065) (h!28540 lt!562065)))))

(declare-fun b!1240573 () Bool)

(assert (=> b!1240573 (= e!703163 (subseq!617 lt!562065 (t!40781 lt!562065)))))

(assert (= (and d!136467 (not res!827286)) b!1240570))

(assert (= (and b!1240570 res!827285) b!1240571))

(assert (= (and b!1240571 res!827287) b!1240572))

(assert (= (and b!1240571 (not res!827288)) b!1240573))

(declare-fun m!1144391 () Bool)

(assert (=> b!1240572 m!1144391))

(assert (=> b!1240573 m!1144361))

(assert (=> b!1240381 d!136467))

(declare-fun d!136469 () Bool)

(assert (=> d!136469 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun lt!562123 () Unit!41134)

(declare-fun choose!80 (array!79889 List!27326 List!27326 (_ BitVec 32)) Unit!41134)

(assert (=> d!136469 (= lt!562123 (choose!80 a!3835 lt!562065 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> d!136469 (bvslt (size!39077 a!3835) #b01111111111111111111111111111111)))

(assert (=> d!136469 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!562065 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)) lt!562123)))

(declare-fun bs!34862 () Bool)

(assert (= bs!34862 d!136469))

(assert (=> bs!34862 m!1144229))

(declare-fun m!1144393 () Bool)

(assert (=> bs!34862 m!1144393))

(assert (=> b!1240381 d!136469))

(declare-fun d!136471 () Bool)

(declare-fun lt!562124 () Bool)

(assert (=> d!136471 (= lt!562124 (select (content!592 acc!846) k0!2925))))

(declare-fun e!703165 () Bool)

(assert (=> d!136471 (= lt!562124 e!703165)))

(declare-fun res!827289 () Bool)

(assert (=> d!136471 (=> (not res!827289) (not e!703165))))

(assert (=> d!136471 (= res!827289 ((_ is Cons!27322) acc!846))))

(assert (=> d!136471 (= (contains!7397 acc!846 k0!2925) lt!562124)))

(declare-fun b!1240574 () Bool)

(declare-fun e!703164 () Bool)

(assert (=> b!1240574 (= e!703165 e!703164)))

(declare-fun res!827290 () Bool)

(assert (=> b!1240574 (=> res!827290 e!703164)))

(assert (=> b!1240574 (= res!827290 (= (h!28540 acc!846) k0!2925))))

(declare-fun b!1240575 () Bool)

(assert (=> b!1240575 (= e!703164 (contains!7397 (t!40781 acc!846) k0!2925))))

(assert (= (and d!136471 res!827289) b!1240574))

(assert (= (and b!1240574 (not res!827290)) b!1240575))

(assert (=> d!136471 m!1144307))

(declare-fun m!1144395 () Bool)

(assert (=> d!136471 m!1144395))

(declare-fun m!1144397 () Bool)

(assert (=> b!1240575 m!1144397))

(assert (=> b!1240380 d!136471))

(check-sat (not b!1240537) (not d!136447) (not b!1240568) (not d!136471) (not b!1240569) (not b!1240484) (not b!1240470) (not b!1240572) (not b!1240531) (not b!1240483) (not b!1240573) (not b!1240496) (not b!1240471) (not bm!61150) (not b!1240472) (not d!136427) (not b!1240495) (not b!1240455) (not bm!61144) (not bm!61143) (not d!136469) (not b!1240497) (not b!1240535) (not d!136463) (not d!136425) (not b!1240575) (not b!1240457))
(check-sat)
