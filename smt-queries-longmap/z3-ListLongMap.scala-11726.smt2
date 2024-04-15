; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137378 () Bool)

(assert start!137378)

(declare-fun b!1581135 () Bool)

(declare-fun res!1080299 () Bool)

(declare-fun e!882229 () Bool)

(assert (=> b!1581135 (=> (not res!1080299) (not e!882229))))

(declare-datatypes ((B!2696 0))(
  ( (B!2697 (val!19710 Int)) )
))
(declare-datatypes ((tuple2!25644 0))(
  ( (tuple2!25645 (_1!12833 (_ BitVec 64)) (_2!12833 B!2696)) )
))
(declare-datatypes ((List!36871 0))(
  ( (Nil!36868) (Cons!36867 (h!38411 tuple2!25644) (t!51777 List!36871)) )
))
(declare-fun l!1390 () List!36871)

(declare-fun isStrictlySorted!1086 (List!36871) Bool)

(assert (=> b!1581135 (= res!1080299 (isStrictlySorted!1086 (t!51777 l!1390)))))

(declare-fun b!1581136 () Bool)

(declare-fun res!1080303 () Bool)

(assert (=> b!1581136 (=> (not res!1080303) (not e!882229))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!932 (List!36871 (_ BitVec 64)) Bool)

(assert (=> b!1581136 (= res!1080303 (containsKey!932 (t!51777 l!1390) key!405))))

(declare-fun b!1581137 () Bool)

(declare-datatypes ((Option!925 0))(
  ( (Some!924 (v!22434 B!2696)) (None!923) )
))
(declare-fun lt!676668 () Option!925)

(declare-fun getValueByKey!823 (List!36871 (_ BitVec 64)) Option!925)

(assert (=> b!1581137 (= e!882229 (not (= (getValueByKey!823 l!1390 key!405) lt!676668)))))

(assert (=> b!1581137 (= (getValueByKey!823 (t!51777 l!1390) key!405) lt!676668)))

(declare-fun value!194 () B!2696)

(assert (=> b!1581137 (= lt!676668 (Some!924 value!194))))

(declare-datatypes ((Unit!52060 0))(
  ( (Unit!52061) )
))
(declare-fun lt!676670 () Unit!52060)

(declare-fun lemmaContainsTupThenGetReturnValue!401 (List!36871 (_ BitVec 64) B!2696) Unit!52060)

(assert (=> b!1581137 (= lt!676670 (lemmaContainsTupThenGetReturnValue!401 (t!51777 l!1390) key!405 value!194))))

(declare-fun b!1581138 () Bool)

(declare-fun e!882230 () Bool)

(declare-datatypes ((tuple2!25646 0))(
  ( (tuple2!25647 (_1!12834 tuple2!25644) (_2!12834 List!36871)) )
))
(declare-datatypes ((Option!926 0))(
  ( (Some!925 (v!22435 tuple2!25646)) (None!924) )
))
(declare-fun lt!676667 () Option!926)

(get-info :version)

(declare-fun get!26815 (Option!926) tuple2!25646)

(assert (=> b!1581138 (= e!882230 (not ((_ is Nil!36868) (_2!12834 (get!26815 lt!676667)))))))

(declare-fun b!1581139 () Bool)

(declare-fun res!1080304 () Bool)

(assert (=> b!1581139 (=> (not res!1080304) (not e!882229))))

(declare-fun lt!676669 () tuple2!25644)

(declare-fun contains!10457 (List!36871 tuple2!25644) Bool)

(assert (=> b!1581139 (= res!1080304 (contains!10457 (t!51777 l!1390) lt!676669))))

(declare-fun b!1581140 () Bool)

(declare-fun e!882226 () Bool)

(declare-fun e!882227 () Bool)

(assert (=> b!1581140 (= e!882226 e!882227)))

(declare-fun res!1080305 () Bool)

(assert (=> b!1581140 (=> (not res!1080305) (not e!882227))))

(assert (=> b!1581140 (= res!1080305 (contains!10457 l!1390 lt!676669))))

(assert (=> b!1581140 (= lt!676669 (tuple2!25645 key!405 value!194))))

(declare-fun res!1080300 () Bool)

(assert (=> start!137378 (=> (not res!1080300) (not e!882226))))

(assert (=> start!137378 (= res!1080300 (isStrictlySorted!1086 l!1390))))

(assert (=> start!137378 e!882226))

(declare-fun e!882228 () Bool)

(assert (=> start!137378 e!882228))

(assert (=> start!137378 true))

(declare-fun tp_is_empty!39241 () Bool)

(assert (=> start!137378 tp_is_empty!39241))

(declare-fun b!1581141 () Bool)

(declare-fun res!1080298 () Bool)

(assert (=> b!1581141 (=> (not res!1080298) (not e!882226))))

(assert (=> b!1581141 (= res!1080298 (containsKey!932 l!1390 key!405))))

(declare-fun b!1581142 () Bool)

(declare-fun tp!114579 () Bool)

(assert (=> b!1581142 (= e!882228 (and tp_is_empty!39241 tp!114579))))

(declare-fun b!1581143 () Bool)

(declare-fun res!1080306 () Bool)

(assert (=> b!1581143 (=> (not res!1080306) (not e!882229))))

(assert (=> b!1581143 (= res!1080306 (and (or (not ((_ is Cons!36867) l!1390)) (not (= (_1!12833 (h!38411 l!1390)) key!405))) ((_ is Cons!36867) l!1390)))))

(declare-fun b!1581144 () Bool)

(assert (=> b!1581144 (= e!882227 e!882229)))

(declare-fun res!1080301 () Bool)

(assert (=> b!1581144 (=> (not res!1080301) (not e!882229))))

(assert (=> b!1581144 (= res!1080301 e!882230)))

(declare-fun res!1080302 () Bool)

(assert (=> b!1581144 (=> res!1080302 e!882230)))

(declare-fun isEmpty!1185 (Option!926) Bool)

(assert (=> b!1581144 (= res!1080302 (isEmpty!1185 lt!676667))))

(declare-fun unapply!97 (List!36871) Option!926)

(assert (=> b!1581144 (= lt!676667 (unapply!97 l!1390))))

(assert (= (and start!137378 res!1080300) b!1581141))

(assert (= (and b!1581141 res!1080298) b!1581140))

(assert (= (and b!1581140 res!1080305) b!1581144))

(assert (= (and b!1581144 (not res!1080302)) b!1581138))

(assert (= (and b!1581144 res!1080301) b!1581143))

(assert (= (and b!1581143 res!1080306) b!1581135))

(assert (= (and b!1581135 res!1080299) b!1581136))

(assert (= (and b!1581136 res!1080303) b!1581139))

(assert (= (and b!1581139 res!1080304) b!1581137))

(assert (= (and start!137378 ((_ is Cons!36867) l!1390)) b!1581142))

(declare-fun m!1451533 () Bool)

(assert (=> b!1581138 m!1451533))

(declare-fun m!1451535 () Bool)

(assert (=> b!1581140 m!1451535))

(declare-fun m!1451537 () Bool)

(assert (=> b!1581141 m!1451537))

(declare-fun m!1451539 () Bool)

(assert (=> b!1581139 m!1451539))

(declare-fun m!1451541 () Bool)

(assert (=> b!1581136 m!1451541))

(declare-fun m!1451543 () Bool)

(assert (=> b!1581144 m!1451543))

(declare-fun m!1451545 () Bool)

(assert (=> b!1581144 m!1451545))

(declare-fun m!1451547 () Bool)

(assert (=> b!1581137 m!1451547))

(declare-fun m!1451549 () Bool)

(assert (=> b!1581137 m!1451549))

(declare-fun m!1451551 () Bool)

(assert (=> b!1581137 m!1451551))

(declare-fun m!1451553 () Bool)

(assert (=> b!1581135 m!1451553))

(declare-fun m!1451555 () Bool)

(assert (=> start!137378 m!1451555))

(check-sat (not b!1581141) (not b!1581139) (not b!1581137) (not b!1581140) (not b!1581136) (not b!1581142) tp_is_empty!39241 (not b!1581144) (not b!1581135) (not b!1581138) (not start!137378))
(check-sat)
(get-model)

(declare-fun d!166503 () Bool)

(declare-fun res!1080365 () Bool)

(declare-fun e!882265 () Bool)

(assert (=> d!166503 (=> res!1080365 e!882265)))

(assert (=> d!166503 (= res!1080365 (and ((_ is Cons!36867) l!1390) (= (_1!12833 (h!38411 l!1390)) key!405)))))

(assert (=> d!166503 (= (containsKey!932 l!1390 key!405) e!882265)))

(declare-fun b!1581209 () Bool)

(declare-fun e!882266 () Bool)

(assert (=> b!1581209 (= e!882265 e!882266)))

(declare-fun res!1080366 () Bool)

(assert (=> b!1581209 (=> (not res!1080366) (not e!882266))))

(assert (=> b!1581209 (= res!1080366 (and (or (not ((_ is Cons!36867) l!1390)) (bvsle (_1!12833 (h!38411 l!1390)) key!405)) ((_ is Cons!36867) l!1390) (bvslt (_1!12833 (h!38411 l!1390)) key!405)))))

(declare-fun b!1581210 () Bool)

(assert (=> b!1581210 (= e!882266 (containsKey!932 (t!51777 l!1390) key!405))))

(assert (= (and d!166503 (not res!1080365)) b!1581209))

(assert (= (and b!1581209 res!1080366) b!1581210))

(assert (=> b!1581210 m!1451541))

(assert (=> b!1581141 d!166503))

(declare-fun d!166505 () Bool)

(declare-fun res!1080367 () Bool)

(declare-fun e!882267 () Bool)

(assert (=> d!166505 (=> res!1080367 e!882267)))

(assert (=> d!166505 (= res!1080367 (and ((_ is Cons!36867) (t!51777 l!1390)) (= (_1!12833 (h!38411 (t!51777 l!1390))) key!405)))))

(assert (=> d!166505 (= (containsKey!932 (t!51777 l!1390) key!405) e!882267)))

(declare-fun b!1581211 () Bool)

(declare-fun e!882268 () Bool)

(assert (=> b!1581211 (= e!882267 e!882268)))

(declare-fun res!1080368 () Bool)

(assert (=> b!1581211 (=> (not res!1080368) (not e!882268))))

(assert (=> b!1581211 (= res!1080368 (and (or (not ((_ is Cons!36867) (t!51777 l!1390))) (bvsle (_1!12833 (h!38411 (t!51777 l!1390))) key!405)) ((_ is Cons!36867) (t!51777 l!1390)) (bvslt (_1!12833 (h!38411 (t!51777 l!1390))) key!405)))))

(declare-fun b!1581212 () Bool)

(assert (=> b!1581212 (= e!882268 (containsKey!932 (t!51777 (t!51777 l!1390)) key!405))))

(assert (= (and d!166505 (not res!1080367)) b!1581211))

(assert (= (and b!1581211 res!1080368) b!1581212))

(declare-fun m!1451605 () Bool)

(assert (=> b!1581212 m!1451605))

(assert (=> b!1581136 d!166505))

(declare-fun d!166507 () Bool)

(declare-fun lt!676701 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!841 (List!36871) (InoxSet tuple2!25644))

(assert (=> d!166507 (= lt!676701 (select (content!841 l!1390) lt!676669))))

(declare-fun e!882282 () Bool)

(assert (=> d!166507 (= lt!676701 e!882282)))

(declare-fun res!1080381 () Bool)

(assert (=> d!166507 (=> (not res!1080381) (not e!882282))))

(assert (=> d!166507 (= res!1080381 ((_ is Cons!36867) l!1390))))

(assert (=> d!166507 (= (contains!10457 l!1390 lt!676669) lt!676701)))

(declare-fun b!1581225 () Bool)

(declare-fun e!882281 () Bool)

(assert (=> b!1581225 (= e!882282 e!882281)))

(declare-fun res!1080382 () Bool)

(assert (=> b!1581225 (=> res!1080382 e!882281)))

(assert (=> b!1581225 (= res!1080382 (= (h!38411 l!1390) lt!676669))))

(declare-fun b!1581226 () Bool)

(assert (=> b!1581226 (= e!882281 (contains!10457 (t!51777 l!1390) lt!676669))))

(assert (= (and d!166507 res!1080381) b!1581225))

(assert (= (and b!1581225 (not res!1080382)) b!1581226))

(declare-fun m!1451607 () Bool)

(assert (=> d!166507 m!1451607))

(declare-fun m!1451609 () Bool)

(assert (=> d!166507 m!1451609))

(assert (=> b!1581226 m!1451539))

(assert (=> b!1581140 d!166507))

(declare-fun d!166513 () Bool)

(declare-fun res!1080391 () Bool)

(declare-fun e!882291 () Bool)

(assert (=> d!166513 (=> res!1080391 e!882291)))

(assert (=> d!166513 (= res!1080391 (or ((_ is Nil!36868) l!1390) ((_ is Nil!36868) (t!51777 l!1390))))))

(assert (=> d!166513 (= (isStrictlySorted!1086 l!1390) e!882291)))

(declare-fun b!1581235 () Bool)

(declare-fun e!882292 () Bool)

(assert (=> b!1581235 (= e!882291 e!882292)))

(declare-fun res!1080392 () Bool)

(assert (=> b!1581235 (=> (not res!1080392) (not e!882292))))

(assert (=> b!1581235 (= res!1080392 (bvslt (_1!12833 (h!38411 l!1390)) (_1!12833 (h!38411 (t!51777 l!1390)))))))

(declare-fun b!1581236 () Bool)

(assert (=> b!1581236 (= e!882292 (isStrictlySorted!1086 (t!51777 l!1390)))))

(assert (= (and d!166513 (not res!1080391)) b!1581235))

(assert (= (and b!1581235 res!1080392) b!1581236))

(assert (=> b!1581236 m!1451553))

(assert (=> start!137378 d!166513))

(declare-fun d!166523 () Bool)

(declare-fun res!1080397 () Bool)

(declare-fun e!882297 () Bool)

(assert (=> d!166523 (=> res!1080397 e!882297)))

(assert (=> d!166523 (= res!1080397 (or ((_ is Nil!36868) (t!51777 l!1390)) ((_ is Nil!36868) (t!51777 (t!51777 l!1390)))))))

(assert (=> d!166523 (= (isStrictlySorted!1086 (t!51777 l!1390)) e!882297)))

(declare-fun b!1581239 () Bool)

(declare-fun e!882298 () Bool)

(assert (=> b!1581239 (= e!882297 e!882298)))

(declare-fun res!1080398 () Bool)

(assert (=> b!1581239 (=> (not res!1080398) (not e!882298))))

(assert (=> b!1581239 (= res!1080398 (bvslt (_1!12833 (h!38411 (t!51777 l!1390))) (_1!12833 (h!38411 (t!51777 (t!51777 l!1390))))))))

(declare-fun b!1581241 () Bool)

(assert (=> b!1581241 (= e!882298 (isStrictlySorted!1086 (t!51777 (t!51777 l!1390))))))

(assert (= (and d!166523 (not res!1080397)) b!1581239))

(assert (= (and b!1581239 res!1080398) b!1581241))

(declare-fun m!1451623 () Bool)

(assert (=> b!1581241 m!1451623))

(assert (=> b!1581135 d!166523))

(declare-fun d!166525 () Bool)

(assert (=> d!166525 (= (get!26815 lt!676667) (v!22435 lt!676667))))

(assert (=> b!1581138 d!166525))

(declare-fun d!166527 () Bool)

(assert (=> d!166527 (= (isEmpty!1185 lt!676667) (not ((_ is Some!925) lt!676667)))))

(assert (=> b!1581144 d!166527))

(declare-fun d!166531 () Bool)

(assert (=> d!166531 (= (unapply!97 l!1390) (ite ((_ is Nil!36868) l!1390) None!924 (Some!925 (tuple2!25647 (h!38411 l!1390) (t!51777 l!1390)))))))

(assert (=> b!1581144 d!166531))

(declare-fun d!166537 () Bool)

(declare-fun lt!676704 () Bool)

(assert (=> d!166537 (= lt!676704 (select (content!841 (t!51777 l!1390)) lt!676669))))

(declare-fun e!882308 () Bool)

(assert (=> d!166537 (= lt!676704 e!882308)))

(declare-fun res!1080407 () Bool)

(assert (=> d!166537 (=> (not res!1080407) (not e!882308))))

(assert (=> d!166537 (= res!1080407 ((_ is Cons!36867) (t!51777 l!1390)))))

(assert (=> d!166537 (= (contains!10457 (t!51777 l!1390) lt!676669) lt!676704)))

(declare-fun b!1581251 () Bool)

(declare-fun e!882307 () Bool)

(assert (=> b!1581251 (= e!882308 e!882307)))

(declare-fun res!1080408 () Bool)

(assert (=> b!1581251 (=> res!1080408 e!882307)))

(assert (=> b!1581251 (= res!1080408 (= (h!38411 (t!51777 l!1390)) lt!676669))))

(declare-fun b!1581252 () Bool)

(assert (=> b!1581252 (= e!882307 (contains!10457 (t!51777 (t!51777 l!1390)) lt!676669))))

(assert (= (and d!166537 res!1080407) b!1581251))

(assert (= (and b!1581251 (not res!1080408)) b!1581252))

(declare-fun m!1451625 () Bool)

(assert (=> d!166537 m!1451625))

(declare-fun m!1451627 () Bool)

(assert (=> d!166537 m!1451627))

(declare-fun m!1451629 () Bool)

(assert (=> b!1581252 m!1451629))

(assert (=> b!1581139 d!166537))

(declare-fun b!1581285 () Bool)

(declare-fun e!882333 () Option!925)

(assert (=> b!1581285 (= e!882333 (Some!924 (_2!12833 (h!38411 l!1390))))))

(declare-fun d!166539 () Bool)

(declare-fun c!146510 () Bool)

(assert (=> d!166539 (= c!146510 (and ((_ is Cons!36867) l!1390) (= (_1!12833 (h!38411 l!1390)) key!405)))))

(assert (=> d!166539 (= (getValueByKey!823 l!1390 key!405) e!882333)))

(declare-fun b!1581288 () Bool)

(declare-fun e!882334 () Option!925)

(assert (=> b!1581288 (= e!882334 None!923)))

(declare-fun b!1581286 () Bool)

(assert (=> b!1581286 (= e!882333 e!882334)))

(declare-fun c!146511 () Bool)

(assert (=> b!1581286 (= c!146511 (and ((_ is Cons!36867) l!1390) (not (= (_1!12833 (h!38411 l!1390)) key!405))))))

(declare-fun b!1581287 () Bool)

(assert (=> b!1581287 (= e!882334 (getValueByKey!823 (t!51777 l!1390) key!405))))

(assert (= (and d!166539 c!146510) b!1581285))

(assert (= (and d!166539 (not c!146510)) b!1581286))

(assert (= (and b!1581286 c!146511) b!1581287))

(assert (= (and b!1581286 (not c!146511)) b!1581288))

(assert (=> b!1581287 m!1451549))

(assert (=> b!1581137 d!166539))

(declare-fun b!1581289 () Bool)

(declare-fun e!882335 () Option!925)

(assert (=> b!1581289 (= e!882335 (Some!924 (_2!12833 (h!38411 (t!51777 l!1390)))))))

(declare-fun d!166549 () Bool)

(declare-fun c!146512 () Bool)

(assert (=> d!166549 (= c!146512 (and ((_ is Cons!36867) (t!51777 l!1390)) (= (_1!12833 (h!38411 (t!51777 l!1390))) key!405)))))

(assert (=> d!166549 (= (getValueByKey!823 (t!51777 l!1390) key!405) e!882335)))

(declare-fun b!1581292 () Bool)

(declare-fun e!882336 () Option!925)

(assert (=> b!1581292 (= e!882336 None!923)))

(declare-fun b!1581290 () Bool)

(assert (=> b!1581290 (= e!882335 e!882336)))

(declare-fun c!146513 () Bool)

(assert (=> b!1581290 (= c!146513 (and ((_ is Cons!36867) (t!51777 l!1390)) (not (= (_1!12833 (h!38411 (t!51777 l!1390))) key!405))))))

(declare-fun b!1581291 () Bool)

(assert (=> b!1581291 (= e!882336 (getValueByKey!823 (t!51777 (t!51777 l!1390)) key!405))))

(assert (= (and d!166549 c!146512) b!1581289))

(assert (= (and d!166549 (not c!146512)) b!1581290))

(assert (= (and b!1581290 c!146513) b!1581291))

(assert (= (and b!1581290 (not c!146513)) b!1581292))

(declare-fun m!1451637 () Bool)

(assert (=> b!1581291 m!1451637))

(assert (=> b!1581137 d!166549))

(declare-fun d!166551 () Bool)

(assert (=> d!166551 (= (getValueByKey!823 (t!51777 l!1390) key!405) (Some!924 value!194))))

(declare-fun lt!676709 () Unit!52060)

(declare-fun choose!2108 (List!36871 (_ BitVec 64) B!2696) Unit!52060)

(assert (=> d!166551 (= lt!676709 (choose!2108 (t!51777 l!1390) key!405 value!194))))

(declare-fun e!882353 () Bool)

(assert (=> d!166551 e!882353))

(declare-fun res!1080433 () Bool)

(assert (=> d!166551 (=> (not res!1080433) (not e!882353))))

(assert (=> d!166551 (= res!1080433 (isStrictlySorted!1086 (t!51777 l!1390)))))

(assert (=> d!166551 (= (lemmaContainsTupThenGetReturnValue!401 (t!51777 l!1390) key!405 value!194) lt!676709)))

(declare-fun b!1581325 () Bool)

(declare-fun res!1080434 () Bool)

(assert (=> b!1581325 (=> (not res!1080434) (not e!882353))))

(assert (=> b!1581325 (= res!1080434 (containsKey!932 (t!51777 l!1390) key!405))))

(declare-fun b!1581326 () Bool)

(assert (=> b!1581326 (= e!882353 (contains!10457 (t!51777 l!1390) (tuple2!25645 key!405 value!194)))))

(assert (= (and d!166551 res!1080433) b!1581325))

(assert (= (and b!1581325 res!1080434) b!1581326))

(assert (=> d!166551 m!1451549))

(declare-fun m!1451643 () Bool)

(assert (=> d!166551 m!1451643))

(assert (=> d!166551 m!1451553))

(assert (=> b!1581325 m!1451541))

(declare-fun m!1451645 () Bool)

(assert (=> b!1581326 m!1451645))

(assert (=> b!1581137 d!166551))

(declare-fun b!1581331 () Bool)

(declare-fun e!882356 () Bool)

(declare-fun tp!114588 () Bool)

(assert (=> b!1581331 (= e!882356 (and tp_is_empty!39241 tp!114588))))

(assert (=> b!1581142 (= tp!114579 e!882356)))

(assert (= (and b!1581142 ((_ is Cons!36867) (t!51777 l!1390))) b!1581331))

(check-sat (not b!1581331) (not d!166551) (not d!166507) (not b!1581325) (not b!1581287) (not b!1581252) tp_is_empty!39241 (not b!1581241) (not b!1581226) (not b!1581236) (not d!166537) (not b!1581210) (not b!1581212) (not b!1581326) (not b!1581291))
(check-sat)
