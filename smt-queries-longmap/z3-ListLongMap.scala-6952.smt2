; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87862 () Bool)

(assert start!87862)

(declare-fun b!1015261 () Bool)

(assert (=> b!1015261 true))

(assert (=> b!1015261 true))

(declare-fun bs!29021 () Bool)

(declare-fun b!1015258 () Bool)

(assert (= bs!29021 (and b!1015258 b!1015261)))

(declare-fun lambda!602 () Int)

(declare-fun lambda!601 () Int)

(assert (=> bs!29021 (= lambda!602 lambda!601)))

(assert (=> b!1015258 true))

(assert (=> b!1015258 true))

(declare-fun b!1015257 () Bool)

(declare-fun res!681095 () Bool)

(declare-fun e!571226 () Bool)

(assert (=> b!1015257 (=> (not res!681095) (not e!571226))))

(declare-datatypes ((B!1418 0))(
  ( (B!1419 (val!11793 Int)) )
))
(declare-datatypes ((tuple2!15136 0))(
  ( (tuple2!15137 (_1!7579 (_ BitVec 64)) (_2!7579 B!1418)) )
))
(declare-datatypes ((List!21410 0))(
  ( (Nil!21407) (Cons!21406 (h!22613 tuple2!15136) (t!30403 List!21410)) )
))
(declare-fun l!412 () List!21410)

(declare-fun value!115 () B!1418)

(get-info :version)

(assert (=> b!1015257 (= res!681095 (and ((_ is Cons!21406) l!412) (= (_2!7579 (h!22613 l!412)) value!115)))))

(declare-datatypes ((List!21411 0))(
  ( (Nil!21408) (Cons!21407 (h!22614 (_ BitVec 64)) (t!30404 List!21411)) )
))
(declare-fun lt!448809 () List!21411)

(declare-fun forall!237 (List!21411 Int) Bool)

(assert (=> b!1015258 (= e!571226 (not (forall!237 (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809) lambda!602)))))

(declare-datatypes ((Unit!33144 0))(
  ( (Unit!33145) )
))
(declare-fun lt!448811 () Unit!33144)

(declare-fun e!571227 () Unit!33144)

(assert (=> b!1015258 (= lt!448811 e!571227)))

(declare-fun c!102982 () Bool)

(declare-fun isEmpty!830 (List!21411) Bool)

(assert (=> b!1015258 (= c!102982 (not (isEmpty!830 lt!448809)))))

(declare-fun getKeysOf!43 (List!21410 B!1418) List!21411)

(assert (=> b!1015258 (= lt!448809 (getKeysOf!43 (t!30403 l!412) value!115))))

(declare-fun b!1015259 () Bool)

(declare-fun e!571225 () Bool)

(declare-fun tp_is_empty!23485 () Bool)

(declare-fun tp!70482 () Bool)

(assert (=> b!1015259 (= e!571225 (and tp_is_empty!23485 tp!70482))))

(declare-fun b!1015260 () Bool)

(declare-fun Unit!33146 () Unit!33144)

(assert (=> b!1015260 (= e!571227 Unit!33146)))

(declare-fun lt!448810 () Unit!33144)

(assert (=> b!1015261 (= e!571227 lt!448810)))

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!32 (List!21410 List!21411 B!1418 tuple2!15136) Unit!33144)

(assert (=> b!1015261 (= lt!448810 (lemmaForallGetValueByKeySameWithASmallerHead!32 (t!30403 l!412) lt!448809 value!115 (h!22613 l!412)))))

(assert (=> b!1015261 (forall!237 lt!448809 lambda!601)))

(declare-fun res!681094 () Bool)

(assert (=> start!87862 (=> (not res!681094) (not e!571226))))

(declare-fun isStrictlySorted!555 (List!21410) Bool)

(assert (=> start!87862 (= res!681094 (isStrictlySorted!555 l!412))))

(assert (=> start!87862 e!571226))

(assert (=> start!87862 e!571225))

(assert (=> start!87862 tp_is_empty!23485))

(assert (= (and start!87862 res!681094) b!1015257))

(assert (= (and b!1015257 res!681095) b!1015258))

(assert (= (and b!1015258 c!102982) b!1015261))

(assert (= (and b!1015258 (not c!102982)) b!1015260))

(assert (= (and start!87862 ((_ is Cons!21406) l!412)) b!1015259))

(declare-fun m!938333 () Bool)

(assert (=> b!1015258 m!938333))

(declare-fun m!938335 () Bool)

(assert (=> b!1015258 m!938335))

(declare-fun m!938337 () Bool)

(assert (=> b!1015258 m!938337))

(declare-fun m!938339 () Bool)

(assert (=> b!1015261 m!938339))

(declare-fun m!938341 () Bool)

(assert (=> b!1015261 m!938341))

(declare-fun m!938343 () Bool)

(assert (=> start!87862 m!938343))

(check-sat (not b!1015261) (not b!1015258) tp_is_empty!23485 (not start!87862) (not b!1015259))
(check-sat)
(get-model)

(declare-fun bs!29024 () Bool)

(declare-fun b!1015317 () Bool)

(assert (= bs!29024 (and b!1015317 b!1015261)))

(declare-fun lambda!619 () Int)

(assert (=> bs!29024 (= (= (t!30403 l!412) l!412) (= lambda!619 lambda!601))))

(declare-fun bs!29025 () Bool)

(assert (= bs!29025 (and b!1015317 b!1015258)))

(assert (=> bs!29025 (= (= (t!30403 l!412) l!412) (= lambda!619 lambda!602))))

(assert (=> b!1015317 true))

(assert (=> b!1015317 true))

(declare-fun bs!29026 () Bool)

(declare-fun d!121035 () Bool)

(assert (= bs!29026 (and d!121035 b!1015261)))

(declare-fun lambda!621 () Int)

(assert (=> bs!29026 (= (= (Cons!21406 (h!22613 l!412) (t!30403 l!412)) l!412) (= lambda!621 lambda!601))))

(declare-fun bs!29027 () Bool)

(assert (= bs!29027 (and d!121035 b!1015258)))

(assert (=> bs!29027 (= (= (Cons!21406 (h!22613 l!412) (t!30403 l!412)) l!412) (= lambda!621 lambda!602))))

(declare-fun bs!29028 () Bool)

(assert (= bs!29028 (and d!121035 b!1015317)))

(assert (=> bs!29028 (= (= (Cons!21406 (h!22613 l!412) (t!30403 l!412)) (t!30403 l!412)) (= lambda!621 lambda!619))))

(assert (=> d!121035 true))

(assert (=> d!121035 true))

(assert (=> d!121035 true))

(assert (=> d!121035 (forall!237 lt!448809 lambda!621)))

(declare-fun lt!448832 () Unit!33144)

(declare-fun choose!1635 (List!21410 List!21411 B!1418 tuple2!15136) Unit!33144)

(assert (=> d!121035 (= lt!448832 (choose!1635 (t!30403 l!412) lt!448809 value!115 (h!22613 l!412)))))

(declare-fun e!571254 () Bool)

(assert (=> d!121035 e!571254))

(declare-fun res!681121 () Bool)

(assert (=> d!121035 (=> (not res!681121) (not e!571254))))

(assert (=> d!121035 (= res!681121 (isStrictlySorted!555 (t!30403 l!412)))))

(assert (=> d!121035 (= (lemmaForallGetValueByKeySameWithASmallerHead!32 (t!30403 l!412) lt!448809 value!115 (h!22613 l!412)) lt!448832)))

(declare-fun b!1015316 () Bool)

(declare-fun res!681120 () Bool)

(assert (=> b!1015316 (=> (not res!681120) (not e!571254))))

(declare-fun isEmpty!833 (List!21410) Bool)

(assert (=> b!1015316 (= res!681120 (not (isEmpty!833 (t!30403 l!412))))))

(declare-fun res!681122 () Bool)

(assert (=> b!1015317 (=> (not res!681122) (not e!571254))))

(assert (=> b!1015317 (= res!681122 (forall!237 lt!448809 lambda!619))))

(declare-fun b!1015318 () Bool)

(declare-fun head!933 (List!21410) tuple2!15136)

(assert (=> b!1015318 (= e!571254 (bvslt (_1!7579 (h!22613 l!412)) (_1!7579 (head!933 (t!30403 l!412)))))))

(assert (= (and d!121035 res!681121) b!1015316))

(assert (= (and b!1015316 res!681120) b!1015317))

(assert (= (and b!1015317 res!681122) b!1015318))

(declare-fun m!938371 () Bool)

(assert (=> d!121035 m!938371))

(declare-fun m!938373 () Bool)

(assert (=> d!121035 m!938373))

(declare-fun m!938375 () Bool)

(assert (=> d!121035 m!938375))

(declare-fun m!938377 () Bool)

(assert (=> b!1015316 m!938377))

(declare-fun m!938379 () Bool)

(assert (=> b!1015317 m!938379))

(declare-fun m!938381 () Bool)

(assert (=> b!1015318 m!938381))

(assert (=> b!1015261 d!121035))

(declare-fun d!121043 () Bool)

(declare-fun res!681133 () Bool)

(declare-fun e!571261 () Bool)

(assert (=> d!121043 (=> res!681133 e!571261)))

(assert (=> d!121043 (= res!681133 ((_ is Nil!21408) lt!448809))))

(assert (=> d!121043 (= (forall!237 lt!448809 lambda!601) e!571261)))

(declare-fun b!1015331 () Bool)

(declare-fun e!571264 () Bool)

(assert (=> b!1015331 (= e!571261 e!571264)))

(declare-fun res!681136 () Bool)

(assert (=> b!1015331 (=> (not res!681136) (not e!571264))))

(declare-fun dynLambda!1912 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015331 (= res!681136 (dynLambda!1912 lambda!601 (h!22614 lt!448809)))))

(declare-fun b!1015332 () Bool)

(assert (=> b!1015332 (= e!571264 (forall!237 (t!30404 lt!448809) lambda!601))))

(assert (= (and d!121043 (not res!681133)) b!1015331))

(assert (= (and b!1015331 res!681136) b!1015332))

(declare-fun b_lambda!15291 () Bool)

(assert (=> (not b_lambda!15291) (not b!1015331)))

(declare-fun m!938383 () Bool)

(assert (=> b!1015331 m!938383))

(declare-fun m!938385 () Bool)

(assert (=> b!1015332 m!938385))

(assert (=> b!1015261 d!121043))

(declare-fun d!121045 () Bool)

(declare-fun res!681141 () Bool)

(declare-fun e!571265 () Bool)

(assert (=> d!121045 (=> res!681141 e!571265)))

(assert (=> d!121045 (= res!681141 ((_ is Nil!21408) (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809)))))

(assert (=> d!121045 (= (forall!237 (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809) lambda!602) e!571265)))

(declare-fun b!1015337 () Bool)

(declare-fun e!571266 () Bool)

(assert (=> b!1015337 (= e!571265 e!571266)))

(declare-fun res!681142 () Bool)

(assert (=> b!1015337 (=> (not res!681142) (not e!571266))))

(assert (=> b!1015337 (= res!681142 (dynLambda!1912 lambda!602 (h!22614 (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809))))))

(declare-fun b!1015338 () Bool)

(assert (=> b!1015338 (= e!571266 (forall!237 (t!30404 (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809)) lambda!602))))

(assert (= (and d!121045 (not res!681141)) b!1015337))

(assert (= (and b!1015337 res!681142) b!1015338))

(declare-fun b_lambda!15293 () Bool)

(assert (=> (not b_lambda!15293) (not b!1015337)))

(declare-fun m!938387 () Bool)

(assert (=> b!1015337 m!938387))

(declare-fun m!938389 () Bool)

(assert (=> b!1015338 m!938389))

(assert (=> b!1015258 d!121045))

(declare-fun d!121047 () Bool)

(assert (=> d!121047 (= (isEmpty!830 lt!448809) ((_ is Nil!21408) lt!448809))))

(assert (=> b!1015258 d!121047))

(declare-fun bs!29039 () Bool)

(declare-fun b!1015387 () Bool)

(assert (= bs!29039 (and b!1015387 b!1015261)))

(declare-fun lambda!639 () Int)

(declare-fun lt!448871 () tuple2!15136)

(declare-fun lt!448865 () List!21410)

(assert (=> bs!29039 (= (= (Cons!21406 lt!448871 lt!448865) l!412) (= lambda!639 lambda!601))))

(declare-fun bs!29040 () Bool)

(assert (= bs!29040 (and b!1015387 b!1015258)))

(assert (=> bs!29040 (= (= (Cons!21406 lt!448871 lt!448865) l!412) (= lambda!639 lambda!602))))

(declare-fun bs!29041 () Bool)

(assert (= bs!29041 (and b!1015387 b!1015317)))

(assert (=> bs!29041 (= (= (Cons!21406 lt!448871 lt!448865) (t!30403 l!412)) (= lambda!639 lambda!619))))

(declare-fun bs!29042 () Bool)

(assert (= bs!29042 (and b!1015387 d!121035)))

(assert (=> bs!29042 (= (= (Cons!21406 lt!448871 lt!448865) (Cons!21406 (h!22613 l!412) (t!30403 l!412))) (= lambda!639 lambda!621))))

(assert (=> b!1015387 true))

(assert (=> b!1015387 true))

(assert (=> b!1015387 true))

(declare-fun bs!29043 () Bool)

(declare-fun b!1015388 () Bool)

(assert (= bs!29043 (and b!1015388 b!1015258)))

(declare-fun lt!448870 () List!21410)

(declare-fun lambda!640 () Int)

(declare-fun lt!448867 () tuple2!15136)

(assert (=> bs!29043 (= (= (Cons!21406 lt!448867 lt!448870) l!412) (= lambda!640 lambda!602))))

(declare-fun bs!29044 () Bool)

(assert (= bs!29044 (and b!1015388 b!1015387)))

(assert (=> bs!29044 (= (= (Cons!21406 lt!448867 lt!448870) (Cons!21406 lt!448871 lt!448865)) (= lambda!640 lambda!639))))

(declare-fun bs!29045 () Bool)

(assert (= bs!29045 (and b!1015388 b!1015261)))

(assert (=> bs!29045 (= (= (Cons!21406 lt!448867 lt!448870) l!412) (= lambda!640 lambda!601))))

(declare-fun bs!29046 () Bool)

(assert (= bs!29046 (and b!1015388 d!121035)))

(assert (=> bs!29046 (= (= (Cons!21406 lt!448867 lt!448870) (Cons!21406 (h!22613 l!412) (t!30403 l!412))) (= lambda!640 lambda!621))))

(declare-fun bs!29047 () Bool)

(assert (= bs!29047 (and b!1015388 b!1015317)))

(assert (=> bs!29047 (= (= (Cons!21406 lt!448867 lt!448870) (t!30403 l!412)) (= lambda!640 lambda!619))))

(assert (=> b!1015388 true))

(assert (=> b!1015388 true))

(assert (=> b!1015388 true))

(declare-fun bs!29048 () Bool)

(declare-fun d!121049 () Bool)

(assert (= bs!29048 (and d!121049 b!1015258)))

(declare-fun lambda!641 () Int)

(assert (=> bs!29048 (= (= (t!30403 l!412) l!412) (= lambda!641 lambda!602))))

(declare-fun bs!29049 () Bool)

(assert (= bs!29049 (and d!121049 b!1015387)))

(assert (=> bs!29049 (= (= (t!30403 l!412) (Cons!21406 lt!448871 lt!448865)) (= lambda!641 lambda!639))))

(declare-fun bs!29050 () Bool)

(assert (= bs!29050 (and d!121049 b!1015261)))

(assert (=> bs!29050 (= (= (t!30403 l!412) l!412) (= lambda!641 lambda!601))))

(declare-fun bs!29051 () Bool)

(assert (= bs!29051 (and d!121049 d!121035)))

(assert (=> bs!29051 (= (= (t!30403 l!412) (Cons!21406 (h!22613 l!412) (t!30403 l!412))) (= lambda!641 lambda!621))))

(declare-fun bs!29052 () Bool)

(assert (= bs!29052 (and d!121049 b!1015317)))

(assert (=> bs!29052 (= lambda!641 lambda!619)))

(declare-fun bs!29053 () Bool)

(assert (= bs!29053 (and d!121049 b!1015388)))

(assert (=> bs!29053 (= (= (t!30403 l!412) (Cons!21406 lt!448867 lt!448870)) (= lambda!641 lambda!640))))

(assert (=> d!121049 true))

(assert (=> d!121049 true))

(declare-fun b!1015384 () Bool)

(declare-fun e!571295 () List!21411)

(declare-fun e!571293 () List!21411)

(assert (=> b!1015384 (= e!571295 e!571293)))

(declare-fun c!102998 () Bool)

(assert (=> b!1015384 (= c!102998 (and ((_ is Cons!21406) (t!30403 l!412)) (not (= (_2!7579 (h!22613 (t!30403 l!412))) value!115))))))

(declare-fun b!1015385 () Bool)

(declare-fun e!571296 () Unit!33144)

(declare-fun Unit!33153 () Unit!33144)

(assert (=> b!1015385 (= e!571296 Unit!33153)))

(declare-fun call!42806 () Bool)

(declare-fun lt!448874 () List!21411)

(declare-fun c!102997 () Bool)

(declare-fun bm!42802 () Bool)

(declare-fun lt!448868 () List!21411)

(assert (=> bm!42802 (= call!42806 (forall!237 (ite c!102997 lt!448868 lt!448874) (ite c!102997 lambda!639 lambda!640)))))

(declare-fun bm!42803 () Bool)

(declare-fun call!42808 () Bool)

(declare-fun call!42807 () List!21411)

(assert (=> bm!42803 (= call!42808 (isEmpty!830 call!42807))))

(declare-fun bm!42804 () Bool)

(declare-fun call!42805 () Unit!33144)

(assert (=> bm!42804 (= call!42805 (lemmaForallGetValueByKeySameWithASmallerHead!32 (ite c!102997 lt!448865 lt!448870) (ite c!102997 lt!448868 lt!448874) value!115 (ite c!102997 lt!448871 lt!448867)))))

(declare-fun b!1015386 () Bool)

(assert (=> b!1015386 (= e!571293 Nil!21408)))

(assert (=> b!1015387 call!42806))

(declare-fun lt!448873 () Unit!33144)

(assert (=> b!1015387 (= lt!448873 call!42805)))

(assert (=> b!1015387 (= lt!448871 (h!22613 (t!30403 l!412)))))

(assert (=> b!1015387 (= lt!448868 call!42807)))

(assert (=> b!1015387 (= lt!448865 (t!30403 (t!30403 l!412)))))

(assert (=> b!1015387 (= e!571296 lt!448873)))

(declare-fun lt!448864 () List!21411)

(assert (=> d!121049 (forall!237 lt!448864 lambda!641)))

(assert (=> d!121049 (= lt!448864 e!571295)))

(assert (=> d!121049 (= c!102997 (and ((_ is Cons!21406) (t!30403 l!412)) (= (_2!7579 (h!22613 (t!30403 l!412))) value!115)))))

(assert (=> d!121049 (isStrictlySorted!555 (t!30403 l!412))))

(assert (=> d!121049 (= (getKeysOf!43 (t!30403 l!412) value!115) lt!448864)))

(declare-fun b!1015383 () Bool)

(declare-fun e!571294 () Unit!33144)

(declare-fun Unit!33154 () Unit!33144)

(assert (=> b!1015383 (= e!571294 Unit!33154)))

(declare-fun lt!448866 () Unit!33144)

(assert (=> b!1015388 (= e!571294 lt!448866)))

(assert (=> b!1015388 (= lt!448870 (t!30403 (t!30403 l!412)))))

(assert (=> b!1015388 (= lt!448874 call!42807)))

(assert (=> b!1015388 (= lt!448867 (h!22613 (t!30403 l!412)))))

(assert (=> b!1015388 (= lt!448866 call!42805)))

(assert (=> b!1015388 call!42806))

(declare-fun bm!42805 () Bool)

(assert (=> bm!42805 (= call!42807 (getKeysOf!43 (t!30403 (t!30403 l!412)) value!115))))

(declare-fun b!1015389 () Bool)

(declare-fun lt!448872 () Unit!33144)

(assert (=> b!1015389 (= lt!448872 e!571294)))

(declare-fun c!102999 () Bool)

(assert (=> b!1015389 (= c!102999 (not call!42808))))

(declare-fun lt!448863 () List!21411)

(assert (=> b!1015389 (= lt!448863 call!42807)))

(assert (=> b!1015389 (= e!571293 call!42807)))

(declare-fun b!1015390 () Bool)

(assert (=> b!1015390 (= e!571295 (Cons!21407 (_1!7579 (h!22613 (t!30403 l!412))) call!42807))))

(declare-fun c!103000 () Bool)

(assert (=> b!1015390 (= c!103000 (not call!42808))))

(declare-fun lt!448869 () Unit!33144)

(assert (=> b!1015390 (= lt!448869 e!571296)))

(assert (= (and d!121049 c!102997) b!1015390))

(assert (= (and d!121049 (not c!102997)) b!1015384))

(assert (= (and b!1015390 c!103000) b!1015387))

(assert (= (and b!1015390 (not c!103000)) b!1015385))

(assert (= (and b!1015384 c!102998) b!1015389))

(assert (= (and b!1015384 (not c!102998)) b!1015386))

(assert (= (and b!1015389 c!102999) b!1015388))

(assert (= (and b!1015389 (not c!102999)) b!1015383))

(assert (= (or b!1015387 b!1015388) bm!42804))

(assert (= (or b!1015387 b!1015388) bm!42802))

(assert (= (or b!1015390 b!1015387 b!1015388 b!1015389) bm!42805))

(assert (= (or b!1015390 b!1015389) bm!42803))

(declare-fun m!938429 () Bool)

(assert (=> bm!42802 m!938429))

(declare-fun m!938431 () Bool)

(assert (=> bm!42805 m!938431))

(declare-fun m!938433 () Bool)

(assert (=> bm!42804 m!938433))

(declare-fun m!938435 () Bool)

(assert (=> bm!42803 m!938435))

(declare-fun m!938437 () Bool)

(assert (=> d!121049 m!938437))

(assert (=> d!121049 m!938375))

(assert (=> b!1015258 d!121049))

(declare-fun d!121067 () Bool)

(declare-fun res!681169 () Bool)

(declare-fun e!571301 () Bool)

(assert (=> d!121067 (=> res!681169 e!571301)))

(assert (=> d!121067 (= res!681169 (or ((_ is Nil!21407) l!412) ((_ is Nil!21407) (t!30403 l!412))))))

(assert (=> d!121067 (= (isStrictlySorted!555 l!412) e!571301)))

(declare-fun b!1015395 () Bool)

(declare-fun e!571302 () Bool)

(assert (=> b!1015395 (= e!571301 e!571302)))

(declare-fun res!681170 () Bool)

(assert (=> b!1015395 (=> (not res!681170) (not e!571302))))

(assert (=> b!1015395 (= res!681170 (bvslt (_1!7579 (h!22613 l!412)) (_1!7579 (h!22613 (t!30403 l!412)))))))

(declare-fun b!1015396 () Bool)

(assert (=> b!1015396 (= e!571302 (isStrictlySorted!555 (t!30403 l!412)))))

(assert (= (and d!121067 (not res!681169)) b!1015395))

(assert (= (and b!1015395 res!681170) b!1015396))

(assert (=> b!1015396 m!938375))

(assert (=> start!87862 d!121067))

(declare-fun b!1015405 () Bool)

(declare-fun e!571307 () Bool)

(declare-fun tp!70491 () Bool)

(assert (=> b!1015405 (= e!571307 (and tp_is_empty!23485 tp!70491))))

(assert (=> b!1015259 (= tp!70482 e!571307)))

(assert (= (and b!1015259 ((_ is Cons!21406) (t!30403 l!412))) b!1015405))

(declare-fun b_lambda!15303 () Bool)

(assert (= b_lambda!15293 (or b!1015258 b_lambda!15303)))

(declare-fun bs!29054 () Bool)

(declare-fun d!121069 () Bool)

(assert (= bs!29054 (and d!121069 b!1015258)))

(declare-datatypes ((Option!572 0))(
  ( (Some!571 (v!14422 B!1418)) (None!570) )
))
(declare-fun getValueByKey!521 (List!21410 (_ BitVec 64)) Option!572)

(assert (=> bs!29054 (= (dynLambda!1912 lambda!602 (h!22614 (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809))) (= (getValueByKey!521 l!412 (h!22614 (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809))) (Some!571 value!115)))))

(declare-fun m!938439 () Bool)

(assert (=> bs!29054 m!938439))

(assert (=> b!1015337 d!121069))

(declare-fun b_lambda!15305 () Bool)

(assert (= b_lambda!15291 (or b!1015261 b_lambda!15305)))

(declare-fun bs!29055 () Bool)

(declare-fun d!121071 () Bool)

(assert (= bs!29055 (and d!121071 b!1015261)))

(assert (=> bs!29055 (= (dynLambda!1912 lambda!601 (h!22614 lt!448809)) (= (getValueByKey!521 l!412 (h!22614 lt!448809)) (Some!571 value!115)))))

(declare-fun m!938441 () Bool)

(assert (=> bs!29055 m!938441))

(assert (=> b!1015331 d!121071))

(check-sat (not b!1015396) (not bm!42805) (not bs!29054) (not d!121049) (not b_lambda!15305) (not b!1015338) (not d!121035) (not b!1015318) (not b!1015332) tp_is_empty!23485 (not b_lambda!15303) (not b!1015317) (not b!1015316) (not bm!42803) (not bm!42802) (not bs!29055) (not bm!42804) (not b!1015405))
(check-sat)
(get-model)

(declare-fun d!121083 () Bool)

(declare-fun res!681177 () Bool)

(declare-fun e!571342 () Bool)

(assert (=> d!121083 (=> res!681177 e!571342)))

(assert (=> d!121083 (= res!681177 ((_ is Nil!21408) (ite c!102997 lt!448868 lt!448874)))))

(assert (=> d!121083 (= (forall!237 (ite c!102997 lt!448868 lt!448874) (ite c!102997 lambda!639 lambda!640)) e!571342)))

(declare-fun b!1015466 () Bool)

(declare-fun e!571343 () Bool)

(assert (=> b!1015466 (= e!571342 e!571343)))

(declare-fun res!681178 () Bool)

(assert (=> b!1015466 (=> (not res!681178) (not e!571343))))

(assert (=> b!1015466 (= res!681178 (dynLambda!1912 (ite c!102997 lambda!639 lambda!640) (h!22614 (ite c!102997 lt!448868 lt!448874))))))

(declare-fun b!1015467 () Bool)

(assert (=> b!1015467 (= e!571343 (forall!237 (t!30404 (ite c!102997 lt!448868 lt!448874)) (ite c!102997 lambda!639 lambda!640)))))

(assert (= (and d!121083 (not res!681177)) b!1015466))

(assert (= (and b!1015466 res!681178) b!1015467))

(declare-fun b_lambda!15315 () Bool)

(assert (=> (not b_lambda!15315) (not b!1015466)))

(declare-fun m!938471 () Bool)

(assert (=> b!1015466 m!938471))

(declare-fun m!938473 () Bool)

(assert (=> b!1015467 m!938473))

(assert (=> bm!42802 d!121083))

(declare-fun bs!29090 () Bool)

(declare-fun b!1015472 () Bool)

(assert (= bs!29090 (and b!1015472 b!1015258)))

(declare-fun lt!448949 () List!21410)

(declare-fun lt!448955 () tuple2!15136)

(declare-fun lambda!660 () Int)

(assert (=> bs!29090 (= (= (Cons!21406 lt!448955 lt!448949) l!412) (= lambda!660 lambda!602))))

(declare-fun bs!29091 () Bool)

(assert (= bs!29091 (and b!1015472 b!1015387)))

(assert (=> bs!29091 (= (= (Cons!21406 lt!448955 lt!448949) (Cons!21406 lt!448871 lt!448865)) (= lambda!660 lambda!639))))

(declare-fun bs!29092 () Bool)

(assert (= bs!29092 (and b!1015472 d!121049)))

(assert (=> bs!29092 (= (= (Cons!21406 lt!448955 lt!448949) (t!30403 l!412)) (= lambda!660 lambda!641))))

(declare-fun bs!29093 () Bool)

(assert (= bs!29093 (and b!1015472 b!1015261)))

(assert (=> bs!29093 (= (= (Cons!21406 lt!448955 lt!448949) l!412) (= lambda!660 lambda!601))))

(declare-fun bs!29094 () Bool)

(assert (= bs!29094 (and b!1015472 d!121035)))

(assert (=> bs!29094 (= (= (Cons!21406 lt!448955 lt!448949) (Cons!21406 (h!22613 l!412) (t!30403 l!412))) (= lambda!660 lambda!621))))

(declare-fun bs!29095 () Bool)

(assert (= bs!29095 (and b!1015472 b!1015317)))

(assert (=> bs!29095 (= (= (Cons!21406 lt!448955 lt!448949) (t!30403 l!412)) (= lambda!660 lambda!619))))

(declare-fun bs!29096 () Bool)

(assert (= bs!29096 (and b!1015472 b!1015388)))

(assert (=> bs!29096 (= (= (Cons!21406 lt!448955 lt!448949) (Cons!21406 lt!448867 lt!448870)) (= lambda!660 lambda!640))))

(assert (=> b!1015472 true))

(assert (=> b!1015472 true))

(assert (=> b!1015472 true))

(declare-fun bs!29097 () Bool)

(declare-fun b!1015473 () Bool)

(assert (= bs!29097 (and b!1015473 b!1015258)))

(declare-fun lt!448951 () tuple2!15136)

(declare-fun lt!448954 () List!21410)

(declare-fun lambda!661 () Int)

(assert (=> bs!29097 (= (= (Cons!21406 lt!448951 lt!448954) l!412) (= lambda!661 lambda!602))))

(declare-fun bs!29098 () Bool)

(assert (= bs!29098 (and b!1015473 b!1015387)))

(assert (=> bs!29098 (= (= (Cons!21406 lt!448951 lt!448954) (Cons!21406 lt!448871 lt!448865)) (= lambda!661 lambda!639))))

(declare-fun bs!29099 () Bool)

(assert (= bs!29099 (and b!1015473 d!121049)))

(assert (=> bs!29099 (= (= (Cons!21406 lt!448951 lt!448954) (t!30403 l!412)) (= lambda!661 lambda!641))))

(declare-fun bs!29100 () Bool)

(assert (= bs!29100 (and b!1015473 b!1015472)))

(assert (=> bs!29100 (= (= (Cons!21406 lt!448951 lt!448954) (Cons!21406 lt!448955 lt!448949)) (= lambda!661 lambda!660))))

(declare-fun bs!29101 () Bool)

(assert (= bs!29101 (and b!1015473 b!1015261)))

(assert (=> bs!29101 (= (= (Cons!21406 lt!448951 lt!448954) l!412) (= lambda!661 lambda!601))))

(declare-fun bs!29102 () Bool)

(assert (= bs!29102 (and b!1015473 d!121035)))

(assert (=> bs!29102 (= (= (Cons!21406 lt!448951 lt!448954) (Cons!21406 (h!22613 l!412) (t!30403 l!412))) (= lambda!661 lambda!621))))

(declare-fun bs!29103 () Bool)

(assert (= bs!29103 (and b!1015473 b!1015317)))

(assert (=> bs!29103 (= (= (Cons!21406 lt!448951 lt!448954) (t!30403 l!412)) (= lambda!661 lambda!619))))

(declare-fun bs!29104 () Bool)

(assert (= bs!29104 (and b!1015473 b!1015388)))

(assert (=> bs!29104 (= (= (Cons!21406 lt!448951 lt!448954) (Cons!21406 lt!448867 lt!448870)) (= lambda!661 lambda!640))))

(assert (=> b!1015473 true))

(assert (=> b!1015473 true))

(assert (=> b!1015473 true))

(declare-fun bs!29105 () Bool)

(declare-fun d!121085 () Bool)

(assert (= bs!29105 (and d!121085 b!1015258)))

(declare-fun lambda!662 () Int)

(assert (=> bs!29105 (= (= (t!30403 (t!30403 l!412)) l!412) (= lambda!662 lambda!602))))

(declare-fun bs!29106 () Bool)

(assert (= bs!29106 (and d!121085 b!1015387)))

(assert (=> bs!29106 (= (= (t!30403 (t!30403 l!412)) (Cons!21406 lt!448871 lt!448865)) (= lambda!662 lambda!639))))

(declare-fun bs!29107 () Bool)

(assert (= bs!29107 (and d!121085 d!121049)))

(assert (=> bs!29107 (= (= (t!30403 (t!30403 l!412)) (t!30403 l!412)) (= lambda!662 lambda!641))))

(declare-fun bs!29108 () Bool)

(assert (= bs!29108 (and d!121085 b!1015473)))

(assert (=> bs!29108 (= (= (t!30403 (t!30403 l!412)) (Cons!21406 lt!448951 lt!448954)) (= lambda!662 lambda!661))))

(declare-fun bs!29109 () Bool)

(assert (= bs!29109 (and d!121085 b!1015472)))

(assert (=> bs!29109 (= (= (t!30403 (t!30403 l!412)) (Cons!21406 lt!448955 lt!448949)) (= lambda!662 lambda!660))))

(declare-fun bs!29110 () Bool)

(assert (= bs!29110 (and d!121085 b!1015261)))

(assert (=> bs!29110 (= (= (t!30403 (t!30403 l!412)) l!412) (= lambda!662 lambda!601))))

(declare-fun bs!29111 () Bool)

(assert (= bs!29111 (and d!121085 d!121035)))

(assert (=> bs!29111 (= (= (t!30403 (t!30403 l!412)) (Cons!21406 (h!22613 l!412) (t!30403 l!412))) (= lambda!662 lambda!621))))

(declare-fun bs!29112 () Bool)

(assert (= bs!29112 (and d!121085 b!1015317)))

(assert (=> bs!29112 (= (= (t!30403 (t!30403 l!412)) (t!30403 l!412)) (= lambda!662 lambda!619))))

(declare-fun bs!29113 () Bool)

(assert (= bs!29113 (and d!121085 b!1015388)))

(assert (=> bs!29113 (= (= (t!30403 (t!30403 l!412)) (Cons!21406 lt!448867 lt!448870)) (= lambda!662 lambda!640))))

(assert (=> d!121085 true))

(assert (=> d!121085 true))

(declare-fun b!1015469 () Bool)

(declare-fun e!571346 () List!21411)

(declare-fun e!571344 () List!21411)

(assert (=> b!1015469 (= e!571346 e!571344)))

(declare-fun c!103026 () Bool)

(assert (=> b!1015469 (= c!103026 (and ((_ is Cons!21406) (t!30403 (t!30403 l!412))) (not (= (_2!7579 (h!22613 (t!30403 (t!30403 l!412)))) value!115))))))

(declare-fun b!1015470 () Bool)

(declare-fun e!571347 () Unit!33144)

(declare-fun Unit!33159 () Unit!33144)

(assert (=> b!1015470 (= e!571347 Unit!33159)))

(declare-fun bm!42830 () Bool)

(declare-fun lt!448952 () List!21411)

(declare-fun c!103025 () Bool)

(declare-fun call!42834 () Bool)

(declare-fun lt!448958 () List!21411)

(assert (=> bm!42830 (= call!42834 (forall!237 (ite c!103025 lt!448952 lt!448958) (ite c!103025 lambda!660 lambda!661)))))

(declare-fun bm!42831 () Bool)

(declare-fun call!42836 () Bool)

(declare-fun call!42835 () List!21411)

(assert (=> bm!42831 (= call!42836 (isEmpty!830 call!42835))))

(declare-fun bm!42832 () Bool)

(declare-fun call!42833 () Unit!33144)

(assert (=> bm!42832 (= call!42833 (lemmaForallGetValueByKeySameWithASmallerHead!32 (ite c!103025 lt!448949 lt!448954) (ite c!103025 lt!448952 lt!448958) value!115 (ite c!103025 lt!448955 lt!448951)))))

(declare-fun b!1015471 () Bool)

(assert (=> b!1015471 (= e!571344 Nil!21408)))

(assert (=> b!1015472 call!42834))

(declare-fun lt!448957 () Unit!33144)

(assert (=> b!1015472 (= lt!448957 call!42833)))

(assert (=> b!1015472 (= lt!448955 (h!22613 (t!30403 (t!30403 l!412))))))

(assert (=> b!1015472 (= lt!448952 call!42835)))

(assert (=> b!1015472 (= lt!448949 (t!30403 (t!30403 (t!30403 l!412))))))

(assert (=> b!1015472 (= e!571347 lt!448957)))

(declare-fun lt!448948 () List!21411)

(assert (=> d!121085 (forall!237 lt!448948 lambda!662)))

(assert (=> d!121085 (= lt!448948 e!571346)))

(assert (=> d!121085 (= c!103025 (and ((_ is Cons!21406) (t!30403 (t!30403 l!412))) (= (_2!7579 (h!22613 (t!30403 (t!30403 l!412)))) value!115)))))

(assert (=> d!121085 (isStrictlySorted!555 (t!30403 (t!30403 l!412)))))

(assert (=> d!121085 (= (getKeysOf!43 (t!30403 (t!30403 l!412)) value!115) lt!448948)))

(declare-fun b!1015468 () Bool)

(declare-fun e!571345 () Unit!33144)

(declare-fun Unit!33160 () Unit!33144)

(assert (=> b!1015468 (= e!571345 Unit!33160)))

(declare-fun lt!448950 () Unit!33144)

(assert (=> b!1015473 (= e!571345 lt!448950)))

(assert (=> b!1015473 (= lt!448954 (t!30403 (t!30403 (t!30403 l!412))))))

(assert (=> b!1015473 (= lt!448958 call!42835)))

(assert (=> b!1015473 (= lt!448951 (h!22613 (t!30403 (t!30403 l!412))))))

(assert (=> b!1015473 (= lt!448950 call!42833)))

(assert (=> b!1015473 call!42834))

(declare-fun bm!42833 () Bool)

(assert (=> bm!42833 (= call!42835 (getKeysOf!43 (t!30403 (t!30403 (t!30403 l!412))) value!115))))

(declare-fun b!1015474 () Bool)

(declare-fun lt!448956 () Unit!33144)

(assert (=> b!1015474 (= lt!448956 e!571345)))

(declare-fun c!103027 () Bool)

(assert (=> b!1015474 (= c!103027 (not call!42836))))

(declare-fun lt!448947 () List!21411)

(assert (=> b!1015474 (= lt!448947 call!42835)))

(assert (=> b!1015474 (= e!571344 call!42835)))

(declare-fun b!1015475 () Bool)

(assert (=> b!1015475 (= e!571346 (Cons!21407 (_1!7579 (h!22613 (t!30403 (t!30403 l!412)))) call!42835))))

(declare-fun c!103028 () Bool)

(assert (=> b!1015475 (= c!103028 (not call!42836))))

(declare-fun lt!448953 () Unit!33144)

(assert (=> b!1015475 (= lt!448953 e!571347)))

(assert (= (and d!121085 c!103025) b!1015475))

(assert (= (and d!121085 (not c!103025)) b!1015469))

(assert (= (and b!1015475 c!103028) b!1015472))

(assert (= (and b!1015475 (not c!103028)) b!1015470))

(assert (= (and b!1015469 c!103026) b!1015474))

(assert (= (and b!1015469 (not c!103026)) b!1015471))

(assert (= (and b!1015474 c!103027) b!1015473))

(assert (= (and b!1015474 (not c!103027)) b!1015468))

(assert (= (or b!1015472 b!1015473) bm!42832))

(assert (= (or b!1015472 b!1015473) bm!42830))

(assert (= (or b!1015475 b!1015472 b!1015473 b!1015474) bm!42833))

(assert (= (or b!1015475 b!1015474) bm!42831))

(declare-fun m!938475 () Bool)

(assert (=> bm!42830 m!938475))

(declare-fun m!938477 () Bool)

(assert (=> bm!42833 m!938477))

(declare-fun m!938479 () Bool)

(assert (=> bm!42832 m!938479))

(declare-fun m!938481 () Bool)

(assert (=> bm!42831 m!938481))

(declare-fun m!938483 () Bool)

(assert (=> d!121085 m!938483))

(declare-fun m!938485 () Bool)

(assert (=> d!121085 m!938485))

(assert (=> bm!42805 d!121085))

(declare-fun d!121087 () Bool)

(declare-fun res!681179 () Bool)

(declare-fun e!571348 () Bool)

(assert (=> d!121087 (=> res!681179 e!571348)))

(assert (=> d!121087 (= res!681179 (or ((_ is Nil!21407) (t!30403 l!412)) ((_ is Nil!21407) (t!30403 (t!30403 l!412)))))))

(assert (=> d!121087 (= (isStrictlySorted!555 (t!30403 l!412)) e!571348)))

(declare-fun b!1015476 () Bool)

(declare-fun e!571349 () Bool)

(assert (=> b!1015476 (= e!571348 e!571349)))

(declare-fun res!681180 () Bool)

(assert (=> b!1015476 (=> (not res!681180) (not e!571349))))

(assert (=> b!1015476 (= res!681180 (bvslt (_1!7579 (h!22613 (t!30403 l!412))) (_1!7579 (h!22613 (t!30403 (t!30403 l!412))))))))

(declare-fun b!1015477 () Bool)

(assert (=> b!1015477 (= e!571349 (isStrictlySorted!555 (t!30403 (t!30403 l!412))))))

(assert (= (and d!121087 (not res!681179)) b!1015476))

(assert (= (and b!1015476 res!681180) b!1015477))

(assert (=> b!1015477 m!938485))

(assert (=> b!1015396 d!121087))

(declare-fun d!121089 () Bool)

(declare-fun res!681181 () Bool)

(declare-fun e!571350 () Bool)

(assert (=> d!121089 (=> res!681181 e!571350)))

(assert (=> d!121089 (= res!681181 ((_ is Nil!21408) lt!448809))))

(assert (=> d!121089 (= (forall!237 lt!448809 lambda!619) e!571350)))

(declare-fun b!1015478 () Bool)

(declare-fun e!571351 () Bool)

(assert (=> b!1015478 (= e!571350 e!571351)))

(declare-fun res!681182 () Bool)

(assert (=> b!1015478 (=> (not res!681182) (not e!571351))))

(assert (=> b!1015478 (= res!681182 (dynLambda!1912 lambda!619 (h!22614 lt!448809)))))

(declare-fun b!1015479 () Bool)

(assert (=> b!1015479 (= e!571351 (forall!237 (t!30404 lt!448809) lambda!619))))

(assert (= (and d!121089 (not res!681181)) b!1015478))

(assert (= (and b!1015478 res!681182) b!1015479))

(declare-fun b_lambda!15317 () Bool)

(assert (=> (not b_lambda!15317) (not b!1015478)))

(declare-fun m!938487 () Bool)

(assert (=> b!1015478 m!938487))

(declare-fun m!938489 () Bool)

(assert (=> b!1015479 m!938489))

(assert (=> b!1015317 d!121089))

(declare-fun d!121091 () Bool)

(declare-fun res!681183 () Bool)

(declare-fun e!571352 () Bool)

(assert (=> d!121091 (=> res!681183 e!571352)))

(assert (=> d!121091 (= res!681183 ((_ is Nil!21408) (t!30404 (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809))))))

(assert (=> d!121091 (= (forall!237 (t!30404 (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809)) lambda!602) e!571352)))

(declare-fun b!1015480 () Bool)

(declare-fun e!571353 () Bool)

(assert (=> b!1015480 (= e!571352 e!571353)))

(declare-fun res!681184 () Bool)

(assert (=> b!1015480 (=> (not res!681184) (not e!571353))))

(assert (=> b!1015480 (= res!681184 (dynLambda!1912 lambda!602 (h!22614 (t!30404 (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809)))))))

(declare-fun b!1015481 () Bool)

(assert (=> b!1015481 (= e!571353 (forall!237 (t!30404 (t!30404 (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809))) lambda!602))))

(assert (= (and d!121091 (not res!681183)) b!1015480))

(assert (= (and b!1015480 res!681184) b!1015481))

(declare-fun b_lambda!15319 () Bool)

(assert (=> (not b_lambda!15319) (not b!1015480)))

(declare-fun m!938491 () Bool)

(assert (=> b!1015480 m!938491))

(declare-fun m!938493 () Bool)

(assert (=> b!1015481 m!938493))

(assert (=> b!1015338 d!121091))

(declare-fun d!121093 () Bool)

(assert (=> d!121093 (= (head!933 (t!30403 l!412)) (h!22613 (t!30403 l!412)))))

(assert (=> b!1015318 d!121093))

(declare-fun d!121095 () Bool)

(assert (=> d!121095 (= (isEmpty!833 (t!30403 l!412)) ((_ is Nil!21407) (t!30403 l!412)))))

(assert (=> b!1015316 d!121095))

(declare-fun d!121097 () Bool)

(assert (=> d!121097 (= (isEmpty!830 call!42807) ((_ is Nil!21408) call!42807))))

(assert (=> bm!42803 d!121097))

(declare-fun d!121099 () Bool)

(declare-fun res!681185 () Bool)

(declare-fun e!571354 () Bool)

(assert (=> d!121099 (=> res!681185 e!571354)))

(assert (=> d!121099 (= res!681185 ((_ is Nil!21408) (t!30404 lt!448809)))))

(assert (=> d!121099 (= (forall!237 (t!30404 lt!448809) lambda!601) e!571354)))

(declare-fun b!1015482 () Bool)

(declare-fun e!571355 () Bool)

(assert (=> b!1015482 (= e!571354 e!571355)))

(declare-fun res!681186 () Bool)

(assert (=> b!1015482 (=> (not res!681186) (not e!571355))))

(assert (=> b!1015482 (= res!681186 (dynLambda!1912 lambda!601 (h!22614 (t!30404 lt!448809))))))

(declare-fun b!1015483 () Bool)

(assert (=> b!1015483 (= e!571355 (forall!237 (t!30404 (t!30404 lt!448809)) lambda!601))))

(assert (= (and d!121099 (not res!681185)) b!1015482))

(assert (= (and b!1015482 res!681186) b!1015483))

(declare-fun b_lambda!15321 () Bool)

(assert (=> (not b_lambda!15321) (not b!1015482)))

(declare-fun m!938495 () Bool)

(assert (=> b!1015482 m!938495))

(declare-fun m!938497 () Bool)

(assert (=> b!1015483 m!938497))

(assert (=> b!1015332 d!121099))

(declare-fun b!1015494 () Bool)

(declare-fun e!571361 () Option!572)

(assert (=> b!1015494 (= e!571361 (getValueByKey!521 (t!30403 l!412) (h!22614 lt!448809)))))

(declare-fun b!1015495 () Bool)

(assert (=> b!1015495 (= e!571361 None!570)))

(declare-fun b!1015492 () Bool)

(declare-fun e!571360 () Option!572)

(assert (=> b!1015492 (= e!571360 (Some!571 (_2!7579 (h!22613 l!412))))))

(declare-fun b!1015493 () Bool)

(assert (=> b!1015493 (= e!571360 e!571361)))

(declare-fun c!103034 () Bool)

(assert (=> b!1015493 (= c!103034 (and ((_ is Cons!21406) l!412) (not (= (_1!7579 (h!22613 l!412)) (h!22614 lt!448809)))))))

(declare-fun d!121101 () Bool)

(declare-fun c!103033 () Bool)

(assert (=> d!121101 (= c!103033 (and ((_ is Cons!21406) l!412) (= (_1!7579 (h!22613 l!412)) (h!22614 lt!448809))))))

(assert (=> d!121101 (= (getValueByKey!521 l!412 (h!22614 lt!448809)) e!571360)))

(assert (= (and d!121101 c!103033) b!1015492))

(assert (= (and d!121101 (not c!103033)) b!1015493))

(assert (= (and b!1015493 c!103034) b!1015494))

(assert (= (and b!1015493 (not c!103034)) b!1015495))

(declare-fun m!938499 () Bool)

(assert (=> b!1015494 m!938499))

(assert (=> bs!29055 d!121101))

(declare-fun d!121103 () Bool)

(declare-fun res!681187 () Bool)

(declare-fun e!571362 () Bool)

(assert (=> d!121103 (=> res!681187 e!571362)))

(assert (=> d!121103 (= res!681187 ((_ is Nil!21408) lt!448864))))

(assert (=> d!121103 (= (forall!237 lt!448864 lambda!641) e!571362)))

(declare-fun b!1015496 () Bool)

(declare-fun e!571363 () Bool)

(assert (=> b!1015496 (= e!571362 e!571363)))

(declare-fun res!681188 () Bool)

(assert (=> b!1015496 (=> (not res!681188) (not e!571363))))

(assert (=> b!1015496 (= res!681188 (dynLambda!1912 lambda!641 (h!22614 lt!448864)))))

(declare-fun b!1015497 () Bool)

(assert (=> b!1015497 (= e!571363 (forall!237 (t!30404 lt!448864) lambda!641))))

(assert (= (and d!121103 (not res!681187)) b!1015496))

(assert (= (and b!1015496 res!681188) b!1015497))

(declare-fun b_lambda!15323 () Bool)

(assert (=> (not b_lambda!15323) (not b!1015496)))

(declare-fun m!938501 () Bool)

(assert (=> b!1015496 m!938501))

(declare-fun m!938503 () Bool)

(assert (=> b!1015497 m!938503))

(assert (=> d!121049 d!121103))

(assert (=> d!121049 d!121087))

(declare-fun b!1015500 () Bool)

(declare-fun e!571365 () Option!572)

(assert (=> b!1015500 (= e!571365 (getValueByKey!521 (t!30403 l!412) (h!22614 (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809))))))

(declare-fun b!1015501 () Bool)

(assert (=> b!1015501 (= e!571365 None!570)))

(declare-fun b!1015498 () Bool)

(declare-fun e!571364 () Option!572)

(assert (=> b!1015498 (= e!571364 (Some!571 (_2!7579 (h!22613 l!412))))))

(declare-fun b!1015499 () Bool)

(assert (=> b!1015499 (= e!571364 e!571365)))

(declare-fun c!103036 () Bool)

(assert (=> b!1015499 (= c!103036 (and ((_ is Cons!21406) l!412) (not (= (_1!7579 (h!22613 l!412)) (h!22614 (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809))))))))

(declare-fun d!121105 () Bool)

(declare-fun c!103035 () Bool)

(assert (=> d!121105 (= c!103035 (and ((_ is Cons!21406) l!412) (= (_1!7579 (h!22613 l!412)) (h!22614 (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809)))))))

(assert (=> d!121105 (= (getValueByKey!521 l!412 (h!22614 (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809))) e!571364)))

(assert (= (and d!121105 c!103035) b!1015498))

(assert (= (and d!121105 (not c!103035)) b!1015499))

(assert (= (and b!1015499 c!103036) b!1015500))

(assert (= (and b!1015499 (not c!103036)) b!1015501))

(declare-fun m!938505 () Bool)

(assert (=> b!1015500 m!938505))

(assert (=> bs!29054 d!121105))

(declare-fun d!121107 () Bool)

(declare-fun res!681189 () Bool)

(declare-fun e!571366 () Bool)

(assert (=> d!121107 (=> res!681189 e!571366)))

(assert (=> d!121107 (= res!681189 ((_ is Nil!21408) lt!448809))))

(assert (=> d!121107 (= (forall!237 lt!448809 lambda!621) e!571366)))

(declare-fun b!1015502 () Bool)

(declare-fun e!571367 () Bool)

(assert (=> b!1015502 (= e!571366 e!571367)))

(declare-fun res!681190 () Bool)

(assert (=> b!1015502 (=> (not res!681190) (not e!571367))))

(assert (=> b!1015502 (= res!681190 (dynLambda!1912 lambda!621 (h!22614 lt!448809)))))

(declare-fun b!1015503 () Bool)

(assert (=> b!1015503 (= e!571367 (forall!237 (t!30404 lt!448809) lambda!621))))

(assert (= (and d!121107 (not res!681189)) b!1015502))

(assert (= (and b!1015502 res!681190) b!1015503))

(declare-fun b_lambda!15325 () Bool)

(assert (=> (not b_lambda!15325) (not b!1015502)))

(declare-fun m!938507 () Bool)

(assert (=> b!1015502 m!938507))

(declare-fun m!938509 () Bool)

(assert (=> b!1015503 m!938509))

(assert (=> d!121035 d!121107))

(declare-fun bs!29114 () Bool)

(declare-fun d!121109 () Bool)

(assert (= bs!29114 (and d!121109 b!1015258)))

(declare-fun lambda!665 () Int)

(assert (=> bs!29114 (= (= (Cons!21406 (h!22613 l!412) (t!30403 l!412)) l!412) (= lambda!665 lambda!602))))

(declare-fun bs!29115 () Bool)

(assert (= bs!29115 (and d!121109 b!1015387)))

(assert (=> bs!29115 (= (= (Cons!21406 (h!22613 l!412) (t!30403 l!412)) (Cons!21406 lt!448871 lt!448865)) (= lambda!665 lambda!639))))

(declare-fun bs!29116 () Bool)

(assert (= bs!29116 (and d!121109 d!121085)))

(assert (=> bs!29116 (= (= (Cons!21406 (h!22613 l!412) (t!30403 l!412)) (t!30403 (t!30403 l!412))) (= lambda!665 lambda!662))))

(declare-fun bs!29117 () Bool)

(assert (= bs!29117 (and d!121109 d!121049)))

(assert (=> bs!29117 (= (= (Cons!21406 (h!22613 l!412) (t!30403 l!412)) (t!30403 l!412)) (= lambda!665 lambda!641))))

(declare-fun bs!29118 () Bool)

(assert (= bs!29118 (and d!121109 b!1015473)))

(assert (=> bs!29118 (= (= (Cons!21406 (h!22613 l!412) (t!30403 l!412)) (Cons!21406 lt!448951 lt!448954)) (= lambda!665 lambda!661))))

(declare-fun bs!29119 () Bool)

(assert (= bs!29119 (and d!121109 b!1015472)))

(assert (=> bs!29119 (= (= (Cons!21406 (h!22613 l!412) (t!30403 l!412)) (Cons!21406 lt!448955 lt!448949)) (= lambda!665 lambda!660))))

(declare-fun bs!29120 () Bool)

(assert (= bs!29120 (and d!121109 b!1015261)))

(assert (=> bs!29120 (= (= (Cons!21406 (h!22613 l!412) (t!30403 l!412)) l!412) (= lambda!665 lambda!601))))

(declare-fun bs!29121 () Bool)

(assert (= bs!29121 (and d!121109 d!121035)))

(assert (=> bs!29121 (= lambda!665 lambda!621)))

(declare-fun bs!29122 () Bool)

(assert (= bs!29122 (and d!121109 b!1015317)))

(assert (=> bs!29122 (= (= (Cons!21406 (h!22613 l!412) (t!30403 l!412)) (t!30403 l!412)) (= lambda!665 lambda!619))))

(declare-fun bs!29123 () Bool)

(assert (= bs!29123 (and d!121109 b!1015388)))

(assert (=> bs!29123 (= (= (Cons!21406 (h!22613 l!412) (t!30403 l!412)) (Cons!21406 lt!448867 lt!448870)) (= lambda!665 lambda!640))))

(assert (=> d!121109 true))

(assert (=> d!121109 true))

(assert (=> d!121109 true))

(assert (=> d!121109 (forall!237 lt!448809 lambda!665)))

(assert (=> d!121109 true))

(declare-fun _$15!110 () Unit!33144)

(assert (=> d!121109 (= (choose!1635 (t!30403 l!412) lt!448809 value!115 (h!22613 l!412)) _$15!110)))

(declare-fun bs!29124 () Bool)

(assert (= bs!29124 d!121109))

(declare-fun m!938511 () Bool)

(assert (=> bs!29124 m!938511))

(assert (=> d!121035 d!121109))

(assert (=> d!121035 d!121087))

(declare-fun bs!29125 () Bool)

(declare-fun b!1015505 () Bool)

(assert (= bs!29125 (and b!1015505 b!1015258)))

(declare-fun lambda!666 () Int)

(assert (=> bs!29125 (= (= (ite c!102997 lt!448865 lt!448870) l!412) (= lambda!666 lambda!602))))

(declare-fun bs!29126 () Bool)

(assert (= bs!29126 (and b!1015505 b!1015387)))

(assert (=> bs!29126 (= (= (ite c!102997 lt!448865 lt!448870) (Cons!21406 lt!448871 lt!448865)) (= lambda!666 lambda!639))))

(declare-fun bs!29127 () Bool)

(assert (= bs!29127 (and b!1015505 d!121085)))

(assert (=> bs!29127 (= (= (ite c!102997 lt!448865 lt!448870) (t!30403 (t!30403 l!412))) (= lambda!666 lambda!662))))

(declare-fun bs!29128 () Bool)

(assert (= bs!29128 (and b!1015505 d!121049)))

(assert (=> bs!29128 (= (= (ite c!102997 lt!448865 lt!448870) (t!30403 l!412)) (= lambda!666 lambda!641))))

(declare-fun bs!29129 () Bool)

(assert (= bs!29129 (and b!1015505 b!1015473)))

(assert (=> bs!29129 (= (= (ite c!102997 lt!448865 lt!448870) (Cons!21406 lt!448951 lt!448954)) (= lambda!666 lambda!661))))

(declare-fun bs!29130 () Bool)

(assert (= bs!29130 (and b!1015505 b!1015472)))

(assert (=> bs!29130 (= (= (ite c!102997 lt!448865 lt!448870) (Cons!21406 lt!448955 lt!448949)) (= lambda!666 lambda!660))))

(declare-fun bs!29131 () Bool)

(assert (= bs!29131 (and b!1015505 b!1015261)))

(assert (=> bs!29131 (= (= (ite c!102997 lt!448865 lt!448870) l!412) (= lambda!666 lambda!601))))

(declare-fun bs!29132 () Bool)

(assert (= bs!29132 (and b!1015505 d!121035)))

(assert (=> bs!29132 (= (= (ite c!102997 lt!448865 lt!448870) (Cons!21406 (h!22613 l!412) (t!30403 l!412))) (= lambda!666 lambda!621))))

(declare-fun bs!29133 () Bool)

(assert (= bs!29133 (and b!1015505 d!121109)))

(assert (=> bs!29133 (= (= (ite c!102997 lt!448865 lt!448870) (Cons!21406 (h!22613 l!412) (t!30403 l!412))) (= lambda!666 lambda!665))))

(declare-fun bs!29134 () Bool)

(assert (= bs!29134 (and b!1015505 b!1015317)))

(assert (=> bs!29134 (= (= (ite c!102997 lt!448865 lt!448870) (t!30403 l!412)) (= lambda!666 lambda!619))))

(declare-fun bs!29135 () Bool)

(assert (= bs!29135 (and b!1015505 b!1015388)))

(assert (=> bs!29135 (= (= (ite c!102997 lt!448865 lt!448870) (Cons!21406 lt!448867 lt!448870)) (= lambda!666 lambda!640))))

(assert (=> b!1015505 true))

(assert (=> b!1015505 true))

(declare-fun bs!29136 () Bool)

(declare-fun d!121111 () Bool)

(assert (= bs!29136 (and d!121111 b!1015258)))

(declare-fun lambda!667 () Int)

(assert (=> bs!29136 (= (= (Cons!21406 (ite c!102997 lt!448871 lt!448867) (ite c!102997 lt!448865 lt!448870)) l!412) (= lambda!667 lambda!602))))

(declare-fun bs!29137 () Bool)

(assert (= bs!29137 (and d!121111 b!1015387)))

(assert (=> bs!29137 (= (= (Cons!21406 (ite c!102997 lt!448871 lt!448867) (ite c!102997 lt!448865 lt!448870)) (Cons!21406 lt!448871 lt!448865)) (= lambda!667 lambda!639))))

(declare-fun bs!29138 () Bool)

(assert (= bs!29138 (and d!121111 d!121085)))

(assert (=> bs!29138 (= (= (Cons!21406 (ite c!102997 lt!448871 lt!448867) (ite c!102997 lt!448865 lt!448870)) (t!30403 (t!30403 l!412))) (= lambda!667 lambda!662))))

(declare-fun bs!29139 () Bool)

(assert (= bs!29139 (and d!121111 b!1015505)))

(assert (=> bs!29139 (= (= (Cons!21406 (ite c!102997 lt!448871 lt!448867) (ite c!102997 lt!448865 lt!448870)) (ite c!102997 lt!448865 lt!448870)) (= lambda!667 lambda!666))))

(declare-fun bs!29140 () Bool)

(assert (= bs!29140 (and d!121111 d!121049)))

(assert (=> bs!29140 (= (= (Cons!21406 (ite c!102997 lt!448871 lt!448867) (ite c!102997 lt!448865 lt!448870)) (t!30403 l!412)) (= lambda!667 lambda!641))))

(declare-fun bs!29141 () Bool)

(assert (= bs!29141 (and d!121111 b!1015473)))

(assert (=> bs!29141 (= (= (Cons!21406 (ite c!102997 lt!448871 lt!448867) (ite c!102997 lt!448865 lt!448870)) (Cons!21406 lt!448951 lt!448954)) (= lambda!667 lambda!661))))

(declare-fun bs!29142 () Bool)

(assert (= bs!29142 (and d!121111 b!1015472)))

(assert (=> bs!29142 (= (= (Cons!21406 (ite c!102997 lt!448871 lt!448867) (ite c!102997 lt!448865 lt!448870)) (Cons!21406 lt!448955 lt!448949)) (= lambda!667 lambda!660))))

(declare-fun bs!29143 () Bool)

(assert (= bs!29143 (and d!121111 b!1015261)))

(assert (=> bs!29143 (= (= (Cons!21406 (ite c!102997 lt!448871 lt!448867) (ite c!102997 lt!448865 lt!448870)) l!412) (= lambda!667 lambda!601))))

(declare-fun bs!29144 () Bool)

(assert (= bs!29144 (and d!121111 d!121035)))

(assert (=> bs!29144 (= (= (Cons!21406 (ite c!102997 lt!448871 lt!448867) (ite c!102997 lt!448865 lt!448870)) (Cons!21406 (h!22613 l!412) (t!30403 l!412))) (= lambda!667 lambda!621))))

(declare-fun bs!29145 () Bool)

(assert (= bs!29145 (and d!121111 d!121109)))

(assert (=> bs!29145 (= (= (Cons!21406 (ite c!102997 lt!448871 lt!448867) (ite c!102997 lt!448865 lt!448870)) (Cons!21406 (h!22613 l!412) (t!30403 l!412))) (= lambda!667 lambda!665))))

(declare-fun bs!29146 () Bool)

(assert (= bs!29146 (and d!121111 b!1015317)))

(assert (=> bs!29146 (= (= (Cons!21406 (ite c!102997 lt!448871 lt!448867) (ite c!102997 lt!448865 lt!448870)) (t!30403 l!412)) (= lambda!667 lambda!619))))

(declare-fun bs!29147 () Bool)

(assert (= bs!29147 (and d!121111 b!1015388)))

(assert (=> bs!29147 (= (= (Cons!21406 (ite c!102997 lt!448871 lt!448867) (ite c!102997 lt!448865 lt!448870)) (Cons!21406 lt!448867 lt!448870)) (= lambda!667 lambda!640))))

(assert (=> d!121111 true))

(assert (=> d!121111 true))

(assert (=> d!121111 true))

(assert (=> d!121111 (forall!237 (ite c!102997 lt!448868 lt!448874) lambda!667)))

(declare-fun lt!448959 () Unit!33144)

(assert (=> d!121111 (= lt!448959 (choose!1635 (ite c!102997 lt!448865 lt!448870) (ite c!102997 lt!448868 lt!448874) value!115 (ite c!102997 lt!448871 lt!448867)))))

(declare-fun e!571368 () Bool)

(assert (=> d!121111 e!571368))

(declare-fun res!681192 () Bool)

(assert (=> d!121111 (=> (not res!681192) (not e!571368))))

(assert (=> d!121111 (= res!681192 (isStrictlySorted!555 (ite c!102997 lt!448865 lt!448870)))))

(assert (=> d!121111 (= (lemmaForallGetValueByKeySameWithASmallerHead!32 (ite c!102997 lt!448865 lt!448870) (ite c!102997 lt!448868 lt!448874) value!115 (ite c!102997 lt!448871 lt!448867)) lt!448959)))

(declare-fun b!1015504 () Bool)

(declare-fun res!681191 () Bool)

(assert (=> b!1015504 (=> (not res!681191) (not e!571368))))

(assert (=> b!1015504 (= res!681191 (not (isEmpty!833 (ite c!102997 lt!448865 lt!448870))))))

(declare-fun res!681193 () Bool)

(assert (=> b!1015505 (=> (not res!681193) (not e!571368))))

(assert (=> b!1015505 (= res!681193 (forall!237 (ite c!102997 lt!448868 lt!448874) lambda!666))))

(declare-fun b!1015506 () Bool)

(assert (=> b!1015506 (= e!571368 (bvslt (_1!7579 (ite c!102997 lt!448871 lt!448867)) (_1!7579 (head!933 (ite c!102997 lt!448865 lt!448870)))))))

(assert (= (and d!121111 res!681192) b!1015504))

(assert (= (and b!1015504 res!681191) b!1015505))

(assert (= (and b!1015505 res!681193) b!1015506))

(declare-fun m!938513 () Bool)

(assert (=> d!121111 m!938513))

(declare-fun m!938515 () Bool)

(assert (=> d!121111 m!938515))

(declare-fun m!938517 () Bool)

(assert (=> d!121111 m!938517))

(declare-fun m!938519 () Bool)

(assert (=> b!1015504 m!938519))

(declare-fun m!938521 () Bool)

(assert (=> b!1015505 m!938521))

(declare-fun m!938523 () Bool)

(assert (=> b!1015506 m!938523))

(assert (=> bm!42804 d!121111))

(declare-fun b!1015507 () Bool)

(declare-fun e!571369 () Bool)

(declare-fun tp!70498 () Bool)

(assert (=> b!1015507 (= e!571369 (and tp_is_empty!23485 tp!70498))))

(assert (=> b!1015405 (= tp!70491 e!571369)))

(assert (= (and b!1015405 ((_ is Cons!21406) (t!30403 (t!30403 l!412)))) b!1015507))

(declare-fun b_lambda!15327 () Bool)

(assert (= b_lambda!15321 (or b!1015261 b_lambda!15327)))

(declare-fun bs!29148 () Bool)

(declare-fun d!121113 () Bool)

(assert (= bs!29148 (and d!121113 b!1015261)))

(assert (=> bs!29148 (= (dynLambda!1912 lambda!601 (h!22614 (t!30404 lt!448809))) (= (getValueByKey!521 l!412 (h!22614 (t!30404 lt!448809))) (Some!571 value!115)))))

(declare-fun m!938525 () Bool)

(assert (=> bs!29148 m!938525))

(assert (=> b!1015482 d!121113))

(declare-fun b_lambda!15329 () Bool)

(assert (= b_lambda!15319 (or b!1015258 b_lambda!15329)))

(declare-fun bs!29149 () Bool)

(declare-fun d!121115 () Bool)

(assert (= bs!29149 (and d!121115 b!1015258)))

(assert (=> bs!29149 (= (dynLambda!1912 lambda!602 (h!22614 (t!30404 (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809)))) (= (getValueByKey!521 l!412 (h!22614 (t!30404 (Cons!21407 (_1!7579 (h!22613 l!412)) lt!448809)))) (Some!571 value!115)))))

(declare-fun m!938527 () Bool)

(assert (=> bs!29149 m!938527))

(assert (=> b!1015480 d!121115))

(declare-fun b_lambda!15331 () Bool)

(assert (= b_lambda!15317 (or b!1015317 b_lambda!15331)))

(declare-fun bs!29150 () Bool)

(declare-fun d!121117 () Bool)

(assert (= bs!29150 (and d!121117 b!1015317)))

(assert (=> bs!29150 (= (dynLambda!1912 lambda!619 (h!22614 lt!448809)) (= (getValueByKey!521 (t!30403 l!412) (h!22614 lt!448809)) (Some!571 value!115)))))

(assert (=> bs!29150 m!938499))

(assert (=> b!1015478 d!121117))

(declare-fun b_lambda!15333 () Bool)

(assert (= b_lambda!15325 (or d!121035 b_lambda!15333)))

(declare-fun bs!29151 () Bool)

(declare-fun d!121119 () Bool)

(assert (= bs!29151 (and d!121119 d!121035)))

(assert (=> bs!29151 (= (dynLambda!1912 lambda!621 (h!22614 lt!448809)) (= (getValueByKey!521 (Cons!21406 (h!22613 l!412) (t!30403 l!412)) (h!22614 lt!448809)) (Some!571 value!115)))))

(declare-fun m!938529 () Bool)

(assert (=> bs!29151 m!938529))

(assert (=> b!1015502 d!121119))

(declare-fun b_lambda!15335 () Bool)

(assert (= b_lambda!15323 (or d!121049 b_lambda!15335)))

(declare-fun bs!29152 () Bool)

(declare-fun d!121121 () Bool)

(assert (= bs!29152 (and d!121121 d!121049)))

(assert (=> bs!29152 (= (dynLambda!1912 lambda!641 (h!22614 lt!448864)) (= (getValueByKey!521 (t!30403 l!412) (h!22614 lt!448864)) (Some!571 value!115)))))

(declare-fun m!938531 () Bool)

(assert (=> bs!29152 m!938531))

(assert (=> b!1015496 d!121121))

(check-sat (not bm!42833) (not b_lambda!15331) (not bm!42831) (not b_lambda!15305) (not b!1015504) (not bs!29151) (not b!1015483) (not b!1015467) (not b!1015505) (not b!1015479) (not d!121111) (not bs!29149) (not bm!42830) (not b!1015506) (not b!1015494) (not b_lambda!15303) (not b!1015481) (not b_lambda!15335) (not b_lambda!15329) (not b!1015497) (not b!1015507) (not b!1015500) (not b_lambda!15315) (not b_lambda!15333) (not bs!29148) (not b_lambda!15327) (not bm!42832) (not b!1015503) (not bs!29150) (not d!121109) (not bs!29152) tp_is_empty!23485 (not b!1015477) (not d!121085))
(check-sat)
