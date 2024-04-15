; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88952 () Bool)

(assert start!88952)

(declare-fun b!1020359 () Bool)

(declare-fun e!574350 () Bool)

(declare-fun e!574352 () Bool)

(assert (=> b!1020359 (= e!574350 e!574352)))

(declare-fun res!683941 () Bool)

(assert (=> b!1020359 (=> (not res!683941) (not e!574352))))

(declare-datatypes ((B!1736 0))(
  ( (B!1737 (val!11952 Int)) )
))
(declare-datatypes ((tuple2!15530 0))(
  ( (tuple2!15531 (_1!7776 (_ BitVec 64)) (_2!7776 B!1736)) )
))
(declare-datatypes ((List!21675 0))(
  ( (Nil!21672) (Cons!21671 (h!22869 tuple2!15530) (t!30676 List!21675)) )
))
(declare-fun l!1367 () List!21675)

(declare-fun lt!449674 () tuple2!15530)

(declare-fun contains!5907 (List!21675 tuple2!15530) Bool)

(assert (=> b!1020359 (= res!683941 (contains!5907 l!1367 lt!449674))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1736)

(assert (=> b!1020359 (= lt!449674 (tuple2!15531 key!393 value!188))))

(declare-fun b!1020360 () Bool)

(declare-fun res!683938 () Bool)

(assert (=> b!1020360 (=> (not res!683938) (not e!574352))))

(assert (=> b!1020360 (= res!683938 (contains!5907 (t!30676 l!1367) lt!449674))))

(declare-fun res!683937 () Bool)

(assert (=> start!88952 (=> (not res!683937) (not e!574350))))

(declare-fun isStrictlySorted!701 (List!21675) Bool)

(assert (=> start!88952 (= res!683937 (isStrictlySorted!701 l!1367))))

(assert (=> start!88952 e!574350))

(declare-fun e!574351 () Bool)

(assert (=> start!88952 e!574351))

(assert (=> start!88952 true))

(declare-fun tp_is_empty!23803 () Bool)

(assert (=> start!88952 tp_is_empty!23803))

(declare-fun b!1020361 () Bool)

(declare-fun res!683939 () Bool)

(assert (=> b!1020361 (=> (not res!683939) (not e!574352))))

(get-info :version)

(assert (=> b!1020361 (= res!683939 (and ((_ is Cons!21671) l!1367) (not (= (h!22869 l!1367) lt!449674))))))

(declare-fun b!1020362 () Bool)

(declare-fun ListPrimitiveSize!142 (List!21675) Int)

(assert (=> b!1020362 (= e!574352 (>= (ListPrimitiveSize!142 (t!30676 l!1367)) (ListPrimitiveSize!142 l!1367)))))

(declare-fun b!1020363 () Bool)

(declare-fun tp!71272 () Bool)

(assert (=> b!1020363 (= e!574351 (and tp_is_empty!23803 tp!71272))))

(declare-fun b!1020364 () Bool)

(declare-fun res!683940 () Bool)

(assert (=> b!1020364 (=> (not res!683940) (not e!574352))))

(assert (=> b!1020364 (= res!683940 (isStrictlySorted!701 (t!30676 l!1367)))))

(assert (= (and start!88952 res!683937) b!1020359))

(assert (= (and b!1020359 res!683941) b!1020361))

(assert (= (and b!1020361 res!683939) b!1020364))

(assert (= (and b!1020364 res!683940) b!1020360))

(assert (= (and b!1020360 res!683938) b!1020362))

(assert (= (and start!88952 ((_ is Cons!21671) l!1367)) b!1020363))

(declare-fun m!939791 () Bool)

(assert (=> b!1020359 m!939791))

(declare-fun m!939793 () Bool)

(assert (=> b!1020362 m!939793))

(declare-fun m!939795 () Bool)

(assert (=> b!1020362 m!939795))

(declare-fun m!939797 () Bool)

(assert (=> b!1020360 m!939797))

(declare-fun m!939799 () Bool)

(assert (=> b!1020364 m!939799))

(declare-fun m!939801 () Bool)

(assert (=> start!88952 m!939801))

(check-sat (not b!1020363) (not b!1020360) (not start!88952) (not b!1020362) (not b!1020359) (not b!1020364) tp_is_empty!23803)
(check-sat)
(get-model)

(declare-fun d!122225 () Bool)

(declare-fun lt!449683 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!499 (List!21675) (InoxSet tuple2!15530))

(assert (=> d!122225 (= lt!449683 (select (content!499 (t!30676 l!1367)) lt!449674))))

(declare-fun e!574375 () Bool)

(assert (=> d!122225 (= lt!449683 e!574375)))

(declare-fun res!683977 () Bool)

(assert (=> d!122225 (=> (not res!683977) (not e!574375))))

(assert (=> d!122225 (= res!683977 ((_ is Cons!21671) (t!30676 l!1367)))))

(assert (=> d!122225 (= (contains!5907 (t!30676 l!1367) lt!449674) lt!449683)))

(declare-fun b!1020405 () Bool)

(declare-fun e!574376 () Bool)

(assert (=> b!1020405 (= e!574375 e!574376)))

(declare-fun res!683976 () Bool)

(assert (=> b!1020405 (=> res!683976 e!574376)))

(assert (=> b!1020405 (= res!683976 (= (h!22869 (t!30676 l!1367)) lt!449674))))

(declare-fun b!1020406 () Bool)

(assert (=> b!1020406 (= e!574376 (contains!5907 (t!30676 (t!30676 l!1367)) lt!449674))))

(assert (= (and d!122225 res!683977) b!1020405))

(assert (= (and b!1020405 (not res!683976)) b!1020406))

(declare-fun m!939827 () Bool)

(assert (=> d!122225 m!939827))

(declare-fun m!939829 () Bool)

(assert (=> d!122225 m!939829))

(declare-fun m!939831 () Bool)

(assert (=> b!1020406 m!939831))

(assert (=> b!1020360 d!122225))

(declare-fun d!122231 () Bool)

(declare-fun lt!449686 () Bool)

(assert (=> d!122231 (= lt!449686 (select (content!499 l!1367) lt!449674))))

(declare-fun e!574379 () Bool)

(assert (=> d!122231 (= lt!449686 e!574379)))

(declare-fun res!683979 () Bool)

(assert (=> d!122231 (=> (not res!683979) (not e!574379))))

(assert (=> d!122231 (= res!683979 ((_ is Cons!21671) l!1367))))

(assert (=> d!122231 (= (contains!5907 l!1367 lt!449674) lt!449686)))

(declare-fun b!1020411 () Bool)

(declare-fun e!574380 () Bool)

(assert (=> b!1020411 (= e!574379 e!574380)))

(declare-fun res!683978 () Bool)

(assert (=> b!1020411 (=> res!683978 e!574380)))

(assert (=> b!1020411 (= res!683978 (= (h!22869 l!1367) lt!449674))))

(declare-fun b!1020412 () Bool)

(assert (=> b!1020412 (= e!574380 (contains!5907 (t!30676 l!1367) lt!449674))))

(assert (= (and d!122231 res!683979) b!1020411))

(assert (= (and b!1020411 (not res!683978)) b!1020412))

(declare-fun m!939833 () Bool)

(assert (=> d!122231 m!939833))

(declare-fun m!939835 () Bool)

(assert (=> d!122231 m!939835))

(assert (=> b!1020412 m!939797))

(assert (=> b!1020359 d!122231))

(declare-fun d!122233 () Bool)

(declare-fun res!683990 () Bool)

(declare-fun e!574393 () Bool)

(assert (=> d!122233 (=> res!683990 e!574393)))

(assert (=> d!122233 (= res!683990 (or ((_ is Nil!21672) (t!30676 l!1367)) ((_ is Nil!21672) (t!30676 (t!30676 l!1367)))))))

(assert (=> d!122233 (= (isStrictlySorted!701 (t!30676 l!1367)) e!574393)))

(declare-fun b!1020427 () Bool)

(declare-fun e!574394 () Bool)

(assert (=> b!1020427 (= e!574393 e!574394)))

(declare-fun res!683991 () Bool)

(assert (=> b!1020427 (=> (not res!683991) (not e!574394))))

(assert (=> b!1020427 (= res!683991 (bvslt (_1!7776 (h!22869 (t!30676 l!1367))) (_1!7776 (h!22869 (t!30676 (t!30676 l!1367))))))))

(declare-fun b!1020428 () Bool)

(assert (=> b!1020428 (= e!574394 (isStrictlySorted!701 (t!30676 (t!30676 l!1367))))))

(assert (= (and d!122233 (not res!683990)) b!1020427))

(assert (= (and b!1020427 res!683991) b!1020428))

(declare-fun m!939839 () Bool)

(assert (=> b!1020428 m!939839))

(assert (=> b!1020364 d!122233))

(declare-fun d!122241 () Bool)

(declare-fun lt!449695 () Int)

(assert (=> d!122241 (>= lt!449695 0)))

(declare-fun e!574401 () Int)

(assert (=> d!122241 (= lt!449695 e!574401)))

(declare-fun c!103472 () Bool)

(assert (=> d!122241 (= c!103472 ((_ is Nil!21672) (t!30676 l!1367)))))

(assert (=> d!122241 (= (ListPrimitiveSize!142 (t!30676 l!1367)) lt!449695)))

(declare-fun b!1020437 () Bool)

(assert (=> b!1020437 (= e!574401 0)))

(declare-fun b!1020438 () Bool)

(assert (=> b!1020438 (= e!574401 (+ 1 (ListPrimitiveSize!142 (t!30676 (t!30676 l!1367)))))))

(assert (= (and d!122241 c!103472) b!1020437))

(assert (= (and d!122241 (not c!103472)) b!1020438))

(declare-fun m!939841 () Bool)

(assert (=> b!1020438 m!939841))

(assert (=> b!1020362 d!122241))

(declare-fun d!122243 () Bool)

(declare-fun lt!449696 () Int)

(assert (=> d!122243 (>= lt!449696 0)))

(declare-fun e!574406 () Int)

(assert (=> d!122243 (= lt!449696 e!574406)))

(declare-fun c!103473 () Bool)

(assert (=> d!122243 (= c!103473 ((_ is Nil!21672) l!1367))))

(assert (=> d!122243 (= (ListPrimitiveSize!142 l!1367) lt!449696)))

(declare-fun b!1020443 () Bool)

(assert (=> b!1020443 (= e!574406 0)))

(declare-fun b!1020444 () Bool)

(assert (=> b!1020444 (= e!574406 (+ 1 (ListPrimitiveSize!142 (t!30676 l!1367))))))

(assert (= (and d!122243 c!103473) b!1020443))

(assert (= (and d!122243 (not c!103473)) b!1020444))

(assert (=> b!1020444 m!939793))

(assert (=> b!1020362 d!122243))

(declare-fun d!122245 () Bool)

(declare-fun res!684000 () Bool)

(declare-fun e!574407 () Bool)

(assert (=> d!122245 (=> res!684000 e!574407)))

(assert (=> d!122245 (= res!684000 (or ((_ is Nil!21672) l!1367) ((_ is Nil!21672) (t!30676 l!1367))))))

(assert (=> d!122245 (= (isStrictlySorted!701 l!1367) e!574407)))

(declare-fun b!1020445 () Bool)

(declare-fun e!574408 () Bool)

(assert (=> b!1020445 (= e!574407 e!574408)))

(declare-fun res!684001 () Bool)

(assert (=> b!1020445 (=> (not res!684001) (not e!574408))))

(assert (=> b!1020445 (= res!684001 (bvslt (_1!7776 (h!22869 l!1367)) (_1!7776 (h!22869 (t!30676 l!1367)))))))

(declare-fun b!1020446 () Bool)

(assert (=> b!1020446 (= e!574408 (isStrictlySorted!701 (t!30676 l!1367)))))

(assert (= (and d!122245 (not res!684000)) b!1020445))

(assert (= (and b!1020445 res!684001) b!1020446))

(assert (=> b!1020446 m!939799))

(assert (=> start!88952 d!122245))

(declare-fun b!1020451 () Bool)

(declare-fun e!574411 () Bool)

(declare-fun tp!71281 () Bool)

(assert (=> b!1020451 (= e!574411 (and tp_is_empty!23803 tp!71281))))

(assert (=> b!1020363 (= tp!71272 e!574411)))

(assert (= (and b!1020363 ((_ is Cons!21671) (t!30676 l!1367))) b!1020451))

(check-sat (not d!122225) (not d!122231) (not b!1020412) (not b!1020444) (not b!1020438) (not b!1020428) (not b!1020446) (not b!1020451) (not b!1020406) tp_is_empty!23803)
(check-sat)
