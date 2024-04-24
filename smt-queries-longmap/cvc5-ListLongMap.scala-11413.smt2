; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133366 () Bool)

(assert start!133366)

(declare-fun b!1559225 () Bool)

(declare-fun res!1065823 () Bool)

(declare-fun e!868635 () Bool)

(assert (=> b!1559225 (=> (not res!1065823) (not e!868635))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2358 0))(
  ( (B!2359 (val!19265 Int)) )
))
(declare-datatypes ((tuple2!24960 0))(
  ( (tuple2!24961 (_1!12491 (_ BitVec 64)) (_2!12491 B!2358)) )
))
(declare-datatypes ((List!36328 0))(
  ( (Nil!36325) (Cons!36324 (h!37788 tuple2!24960) (t!51044 List!36328)) )
))
(declare-fun l!1177 () List!36328)

(assert (=> b!1559225 (= res!1065823 (and (not (= newKey!105 otherKey!50)) (or (not (is-Cons!36324 l!1177)) (= (_1!12491 (h!37788 l!1177)) otherKey!50))))))

(declare-fun b!1559228 () Bool)

(declare-fun e!868637 () Bool)

(declare-fun tp_is_empty!38369 () Bool)

(declare-fun tp!112452 () Bool)

(assert (=> b!1559228 (= e!868637 (and tp_is_empty!38369 tp!112452))))

(declare-fun b!1559226 () Bool)

(declare-fun e!868636 () Bool)

(assert (=> b!1559226 (= e!868635 e!868636)))

(declare-fun res!1065824 () Bool)

(assert (=> b!1559226 (=> res!1065824 e!868636)))

(declare-fun lt!671371 () List!36328)

(declare-fun containsKey!814 (List!36328 (_ BitVec 64)) Bool)

(assert (=> b!1559226 (= res!1065824 (not (= (containsKey!814 lt!671371 otherKey!50) (containsKey!814 l!1177 otherKey!50))))))

(declare-fun newValue!105 () B!2358)

(declare-fun insertStrictlySorted!555 (List!36328 (_ BitVec 64) B!2358) List!36328)

(assert (=> b!1559226 (= lt!671371 (insertStrictlySorted!555 l!1177 newKey!105 newValue!105))))

(declare-fun res!1065825 () Bool)

(assert (=> start!133366 (=> (not res!1065825) (not e!868635))))

(declare-fun isStrictlySorted!939 (List!36328) Bool)

(assert (=> start!133366 (= res!1065825 (isStrictlySorted!939 l!1177))))

(assert (=> start!133366 e!868635))

(assert (=> start!133366 e!868637))

(assert (=> start!133366 true))

(assert (=> start!133366 tp_is_empty!38369))

(declare-fun b!1559227 () Bool)

(declare-datatypes ((Option!851 0))(
  ( (Some!850 (v!22035 B!2358)) (None!849) )
))
(declare-fun getValueByKey!776 (List!36328 (_ BitVec 64)) Option!851)

(assert (=> b!1559227 (= e!868636 (not (= (getValueByKey!776 lt!671371 otherKey!50) (getValueByKey!776 l!1177 otherKey!50))))))

(assert (= (and start!133366 res!1065825) b!1559225))

(assert (= (and b!1559225 res!1065823) b!1559226))

(assert (= (and b!1559226 (not res!1065824)) b!1559227))

(assert (= (and start!133366 (is-Cons!36324 l!1177)) b!1559228))

(declare-fun m!1436447 () Bool)

(assert (=> b!1559226 m!1436447))

(declare-fun m!1436449 () Bool)

(assert (=> b!1559226 m!1436449))

(declare-fun m!1436451 () Bool)

(assert (=> b!1559226 m!1436451))

(declare-fun m!1436453 () Bool)

(assert (=> start!133366 m!1436453))

(declare-fun m!1436455 () Bool)

(assert (=> b!1559227 m!1436455))

(declare-fun m!1436457 () Bool)

(assert (=> b!1559227 m!1436457))

(push 1)

(assert (not b!1559228))

(assert tp_is_empty!38369)

(assert (not start!133366))

(assert (not b!1559226))

(assert (not b!1559227))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163003 () Bool)

(declare-fun res!1065844 () Bool)

(declare-fun e!868660 () Bool)

(assert (=> d!163003 (=> res!1065844 e!868660)))

(assert (=> d!163003 (= res!1065844 (or (is-Nil!36325 l!1177) (is-Nil!36325 (t!51044 l!1177))))))

(assert (=> d!163003 (= (isStrictlySorted!939 l!1177) e!868660)))

(declare-fun b!1559255 () Bool)

(declare-fun e!868661 () Bool)

(assert (=> b!1559255 (= e!868660 e!868661)))

(declare-fun res!1065845 () Bool)

(assert (=> b!1559255 (=> (not res!1065845) (not e!868661))))

(assert (=> b!1559255 (= res!1065845 (bvslt (_1!12491 (h!37788 l!1177)) (_1!12491 (h!37788 (t!51044 l!1177)))))))

(declare-fun b!1559256 () Bool)

(assert (=> b!1559256 (= e!868661 (isStrictlySorted!939 (t!51044 l!1177)))))

(assert (= (and d!163003 (not res!1065844)) b!1559255))

(assert (= (and b!1559255 res!1065845) b!1559256))

(declare-fun m!1436465 () Bool)

(assert (=> b!1559256 m!1436465))

(assert (=> start!133366 d!163003))

(declare-fun b!1559277 () Bool)

(declare-fun e!868674 () Option!851)

(assert (=> b!1559277 (= e!868674 (Some!850 (_2!12491 (h!37788 lt!671371))))))

(declare-fun b!1559278 () Bool)

(declare-fun e!868675 () Option!851)

(assert (=> b!1559278 (= e!868674 e!868675)))

(declare-fun c!144660 () Bool)

(assert (=> b!1559278 (= c!144660 (and (is-Cons!36324 lt!671371) (not (= (_1!12491 (h!37788 lt!671371)) otherKey!50))))))

(declare-fun d!163009 () Bool)

(declare-fun c!144659 () Bool)

(assert (=> d!163009 (= c!144659 (and (is-Cons!36324 lt!671371) (= (_1!12491 (h!37788 lt!671371)) otherKey!50)))))

(assert (=> d!163009 (= (getValueByKey!776 lt!671371 otherKey!50) e!868674)))

(declare-fun b!1559279 () Bool)

(assert (=> b!1559279 (= e!868675 (getValueByKey!776 (t!51044 lt!671371) otherKey!50))))

(declare-fun b!1559280 () Bool)

(assert (=> b!1559280 (= e!868675 None!849)))

(assert (= (and d!163009 c!144659) b!1559277))

(assert (= (and d!163009 (not c!144659)) b!1559278))

(assert (= (and b!1559278 c!144660) b!1559279))

(assert (= (and b!1559278 (not c!144660)) b!1559280))

(declare-fun m!1436471 () Bool)

(assert (=> b!1559279 m!1436471))

(assert (=> b!1559227 d!163009))

(declare-fun b!1559283 () Bool)

(declare-fun e!868678 () Option!851)

(assert (=> b!1559283 (= e!868678 (Some!850 (_2!12491 (h!37788 l!1177))))))

(declare-fun b!1559284 () Bool)

(declare-fun e!868679 () Option!851)

(assert (=> b!1559284 (= e!868678 e!868679)))

(declare-fun c!144662 () Bool)

(assert (=> b!1559284 (= c!144662 (and (is-Cons!36324 l!1177) (not (= (_1!12491 (h!37788 l!1177)) otherKey!50))))))

(declare-fun d!163015 () Bool)

(declare-fun c!144661 () Bool)

(assert (=> d!163015 (= c!144661 (and (is-Cons!36324 l!1177) (= (_1!12491 (h!37788 l!1177)) otherKey!50)))))

(assert (=> d!163015 (= (getValueByKey!776 l!1177 otherKey!50) e!868678)))

(declare-fun b!1559285 () Bool)

(assert (=> b!1559285 (= e!868679 (getValueByKey!776 (t!51044 l!1177) otherKey!50))))

(declare-fun b!1559286 () Bool)

(assert (=> b!1559286 (= e!868679 None!849)))

(assert (= (and d!163015 c!144661) b!1559283))

(assert (= (and d!163015 (not c!144661)) b!1559284))

(assert (= (and b!1559284 c!144662) b!1559285))

(assert (= (and b!1559284 (not c!144662)) b!1559286))

(declare-fun m!1436475 () Bool)

(assert (=> b!1559285 m!1436475))

(assert (=> b!1559227 d!163015))

(declare-fun d!163019 () Bool)

(declare-fun res!1065858 () Bool)

(declare-fun e!868686 () Bool)

(assert (=> d!163019 (=> res!1065858 e!868686)))

(assert (=> d!163019 (= res!1065858 (and (is-Cons!36324 lt!671371) (= (_1!12491 (h!37788 lt!671371)) otherKey!50)))))

(assert (=> d!163019 (= (containsKey!814 lt!671371 otherKey!50) e!868686)))

(declare-fun b!1559293 () Bool)

(declare-fun e!868687 () Bool)

(assert (=> b!1559293 (= e!868686 e!868687)))

(declare-fun res!1065859 () Bool)

(assert (=> b!1559293 (=> (not res!1065859) (not e!868687))))

(assert (=> b!1559293 (= res!1065859 (and (or (not (is-Cons!36324 lt!671371)) (bvsle (_1!12491 (h!37788 lt!671371)) otherKey!50)) (is-Cons!36324 lt!671371) (bvslt (_1!12491 (h!37788 lt!671371)) otherKey!50)))))

(declare-fun b!1559294 () Bool)

(assert (=> b!1559294 (= e!868687 (containsKey!814 (t!51044 lt!671371) otherKey!50))))

(assert (= (and d!163019 (not res!1065858)) b!1559293))

(assert (= (and b!1559293 res!1065859) b!1559294))

(declare-fun m!1436479 () Bool)

(assert (=> b!1559294 m!1436479))

(assert (=> b!1559226 d!163019))

(declare-fun d!163023 () Bool)

(declare-fun res!1065860 () Bool)

(declare-fun e!868688 () Bool)

(assert (=> d!163023 (=> res!1065860 e!868688)))

(assert (=> d!163023 (= res!1065860 (and (is-Cons!36324 l!1177) (= (_1!12491 (h!37788 l!1177)) otherKey!50)))))

(assert (=> d!163023 (= (containsKey!814 l!1177 otherKey!50) e!868688)))

(declare-fun b!1559297 () Bool)

(declare-fun e!868689 () Bool)

(assert (=> b!1559297 (= e!868688 e!868689)))

(declare-fun res!1065861 () Bool)

(assert (=> b!1559297 (=> (not res!1065861) (not e!868689))))

(assert (=> b!1559297 (= res!1065861 (and (or (not (is-Cons!36324 l!1177)) (bvsle (_1!12491 (h!37788 l!1177)) otherKey!50)) (is-Cons!36324 l!1177) (bvslt (_1!12491 (h!37788 l!1177)) otherKey!50)))))

(declare-fun b!1559298 () Bool)

(assert (=> b!1559298 (= e!868689 (containsKey!814 (t!51044 l!1177) otherKey!50))))

(assert (= (and d!163023 (not res!1065860)) b!1559297))

(assert (= (and b!1559297 res!1065861) b!1559298))

(declare-fun m!1436481 () Bool)

(assert (=> b!1559298 m!1436481))

(assert (=> b!1559226 d!163023))

(declare-fun b!1559404 () Bool)

(declare-fun e!868747 () List!36328)

(declare-fun call!71802 () List!36328)

(assert (=> b!1559404 (= e!868747 call!71802)))

(declare-fun e!868751 () List!36328)

(declare-fun b!1559405 () Bool)

(assert (=> b!1559405 (= e!868751 (insertStrictlySorted!555 (t!51044 l!1177) newKey!105 newValue!105))))

(declare-fun b!1559406 () Bool)

(declare-fun e!868750 () List!36328)

(declare-fun call!71800 () List!36328)

(assert (=> b!1559406 (= e!868750 call!71800)))

(declare-fun call!71801 () List!36328)

(declare-fun c!144706 () Bool)

(declare-fun bm!71797 () Bool)

(declare-fun $colon$colon!970 (List!36328 tuple2!24960) List!36328)

(assert (=> bm!71797 (= call!71801 ($colon$colon!970 e!868751 (ite c!144706 (h!37788 l!1177) (tuple2!24961 newKey!105 newValue!105))))))

(declare-fun c!144704 () Bool)

(assert (=> bm!71797 (= c!144704 c!144706)))

(declare-fun d!163025 () Bool)

(declare-fun e!868748 () Bool)

(assert (=> d!163025 e!868748))

(declare-fun res!1065885 () Bool)

(assert (=> d!163025 (=> (not res!1065885) (not e!868748))))

(declare-fun lt!671380 () List!36328)

(assert (=> d!163025 (= res!1065885 (isStrictlySorted!939 lt!671380))))

(declare-fun e!868749 () List!36328)

(assert (=> d!163025 (= lt!671380 e!868749)))

(assert (=> d!163025 (= c!144706 (and (is-Cons!36324 l!1177) (bvslt (_1!12491 (h!37788 l!1177)) newKey!105)))))

(assert (=> d!163025 (isStrictlySorted!939 l!1177)))

(assert (=> d!163025 (= (insertStrictlySorted!555 l!1177 newKey!105 newValue!105) lt!671380)))

(declare-fun bm!71798 () Bool)

(assert (=> bm!71798 (= call!71800 call!71801)))

(declare-fun b!1559407 () Bool)

(assert (=> b!1559407 (= e!868749 e!868750)))

(declare-fun c!144703 () Bool)

(assert (=> b!1559407 (= c!144703 (and (is-Cons!36324 l!1177) (= (_1!12491 (h!37788 l!1177)) newKey!105)))))

(declare-fun b!1559408 () Bool)

(declare-fun contains!10231 (List!36328 tuple2!24960) Bool)

(assert (=> b!1559408 (= e!868748 (contains!10231 lt!671380 (tuple2!24961 newKey!105 newValue!105)))))

(declare-fun b!1559409 () Bool)

(assert (=> b!1559409 (= e!868749 call!71801)))

(declare-fun c!144705 () Bool)

(declare-fun b!1559410 () Bool)

(assert (=> b!1559410 (= e!868751 (ite c!144703 (t!51044 l!1177) (ite c!144705 (Cons!36324 (h!37788 l!1177) (t!51044 l!1177)) Nil!36325)))))

(declare-fun b!1559411 () Bool)

(assert (=> b!1559411 (= c!144705 (and (is-Cons!36324 l!1177) (bvsgt (_1!12491 (h!37788 l!1177)) newKey!105)))))

(assert (=> b!1559411 (= e!868750 e!868747)))

(declare-fun b!1559412 () Bool)

(declare-fun res!1065884 () Bool)

(assert (=> b!1559412 (=> (not res!1065884) (not e!868748))))

(assert (=> b!1559412 (= res!1065884 (containsKey!814 lt!671380 newKey!105))))

(declare-fun b!1559413 () Bool)

(assert (=> b!1559413 (= e!868747 call!71802)))

(declare-fun bm!71799 () Bool)

(assert (=> bm!71799 (= call!71802 call!71800)))

(assert (= (and d!163025 c!144706) b!1559409))

(assert (= (and d!163025 (not c!144706)) b!1559407))

(assert (= (and b!1559407 c!144703) b!1559406))

(assert (= (and b!1559407 (not c!144703)) b!1559411))

(assert (= (and b!1559411 c!144705) b!1559413))

(assert (= (and b!1559411 (not c!144705)) b!1559404))

(assert (= (or b!1559413 b!1559404) bm!71799))

(assert (= (or b!1559406 bm!71799) bm!71798))

(assert (= (or b!1559409 bm!71798) bm!71797))

(assert (= (and bm!71797 c!144704) b!1559405))

(assert (= (and bm!71797 (not c!144704)) b!1559410))

(assert (= (and d!163025 res!1065885) b!1559412))

(assert (= (and b!1559412 res!1065884) b!1559408))

(declare-fun m!1436509 () Bool)

(assert (=> d!163025 m!1436509))

(assert (=> d!163025 m!1436453))

(declare-fun m!1436511 () Bool)

(assert (=> b!1559412 m!1436511))

(declare-fun m!1436513 () Bool)

(assert (=> b!1559408 m!1436513))

(declare-fun m!1436515 () Bool)

(assert (=> bm!71797 m!1436515))

(declare-fun m!1436517 () Bool)

(assert (=> b!1559405 m!1436517))

(assert (=> b!1559226 d!163025))

(declare-fun b!1559423 () Bool)

(declare-fun e!868757 () Bool)

(declare-fun tp!112461 () Bool)

(assert (=> b!1559423 (= e!868757 (and tp_is_empty!38369 tp!112461))))

(assert (=> b!1559228 (= tp!112452 e!868757)))

(assert (= (and b!1559228 (is-Cons!36324 (t!51044 l!1177))) b!1559423))

(push 1)

(assert (not b!1559285))

(assert (not b!1559423))

(assert (not d!163025))

(assert (not b!1559412))

(assert (not b!1559408))

(assert (not b!1559294))

(assert (not b!1559405))

(assert tp_is_empty!38369)

(assert (not b!1559298))

(assert (not b!1559279))

(assert (not bm!71797))

(assert (not b!1559256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1559424 () Bool)

(declare-fun e!868758 () Option!851)

(assert (=> b!1559424 (= e!868758 (Some!850 (_2!12491 (h!37788 (t!51044 l!1177)))))))

(declare-fun b!1559425 () Bool)

(declare-fun e!868759 () Option!851)

(assert (=> b!1559425 (= e!868758 e!868759)))

(declare-fun c!144708 () Bool)

(assert (=> b!1559425 (= c!144708 (and (is-Cons!36324 (t!51044 l!1177)) (not (= (_1!12491 (h!37788 (t!51044 l!1177))) otherKey!50))))))

(declare-fun d!163033 () Bool)

(declare-fun c!144707 () Bool)

(assert (=> d!163033 (= c!144707 (and (is-Cons!36324 (t!51044 l!1177)) (= (_1!12491 (h!37788 (t!51044 l!1177))) otherKey!50)))))

(assert (=> d!163033 (= (getValueByKey!776 (t!51044 l!1177) otherKey!50) e!868758)))

(declare-fun b!1559426 () Bool)

(assert (=> b!1559426 (= e!868759 (getValueByKey!776 (t!51044 (t!51044 l!1177)) otherKey!50))))

(declare-fun b!1559427 () Bool)

(assert (=> b!1559427 (= e!868759 None!849)))

(assert (= (and d!163033 c!144707) b!1559424))

(assert (= (and d!163033 (not c!144707)) b!1559425))

(assert (= (and b!1559425 c!144708) b!1559426))

(assert (= (and b!1559425 (not c!144708)) b!1559427))

(declare-fun m!1436519 () Bool)

(assert (=> b!1559426 m!1436519))

(assert (=> b!1559285 d!163033))

(declare-fun d!163035 () Bool)

(declare-fun res!1065886 () Bool)

(declare-fun e!868760 () Bool)

(assert (=> d!163035 (=> res!1065886 e!868760)))

(assert (=> d!163035 (= res!1065886 (or (is-Nil!36325 lt!671380) (is-Nil!36325 (t!51044 lt!671380))))))

(assert (=> d!163035 (= (isStrictlySorted!939 lt!671380) e!868760)))

(declare-fun b!1559428 () Bool)

(declare-fun e!868761 () Bool)

(assert (=> b!1559428 (= e!868760 e!868761)))

(declare-fun res!1065887 () Bool)

(assert (=> b!1559428 (=> (not res!1065887) (not e!868761))))

(assert (=> b!1559428 (= res!1065887 (bvslt (_1!12491 (h!37788 lt!671380)) (_1!12491 (h!37788 (t!51044 lt!671380)))))))

(declare-fun b!1559429 () Bool)

(assert (=> b!1559429 (= e!868761 (isStrictlySorted!939 (t!51044 lt!671380)))))

(assert (= (and d!163035 (not res!1065886)) b!1559428))

(assert (= (and b!1559428 res!1065887) b!1559429))

(declare-fun m!1436521 () Bool)

(assert (=> b!1559429 m!1436521))

(assert (=> d!163025 d!163035))

(assert (=> d!163025 d!163003))

(declare-fun d!163039 () Bool)

(declare-fun res!1065890 () Bool)

(declare-fun e!868764 () Bool)

(assert (=> d!163039 (=> res!1065890 e!868764)))

(assert (=> d!163039 (= res!1065890 (and (is-Cons!36324 lt!671380) (= (_1!12491 (h!37788 lt!671380)) newKey!105)))))

(assert (=> d!163039 (= (containsKey!814 lt!671380 newKey!105) e!868764)))

(declare-fun b!1559432 () Bool)

(declare-fun e!868765 () Bool)

(assert (=> b!1559432 (= e!868764 e!868765)))

(declare-fun res!1065891 () Bool)

(assert (=> b!1559432 (=> (not res!1065891) (not e!868765))))

(assert (=> b!1559432 (= res!1065891 (and (or (not (is-Cons!36324 lt!671380)) (bvsle (_1!12491 (h!37788 lt!671380)) newKey!105)) (is-Cons!36324 lt!671380) (bvslt (_1!12491 (h!37788 lt!671380)) newKey!105)))))

(declare-fun b!1559433 () Bool)

(assert (=> b!1559433 (= e!868765 (containsKey!814 (t!51044 lt!671380) newKey!105))))

(assert (= (and d!163039 (not res!1065890)) b!1559432))

(assert (= (and b!1559432 res!1065891) b!1559433))

(declare-fun m!1436525 () Bool)

(assert (=> b!1559433 m!1436525))

(assert (=> b!1559412 d!163039))

(declare-fun d!163043 () Bool)

(assert (=> d!163043 (= ($colon$colon!970 e!868751 (ite c!144706 (h!37788 l!1177) (tuple2!24961 newKey!105 newValue!105))) (Cons!36324 (ite c!144706 (h!37788 l!1177) (tuple2!24961 newKey!105 newValue!105)) e!868751))))

(assert (=> bm!71797 d!163043))

(declare-fun d!163045 () Bool)

(declare-fun res!1065892 () Bool)

(declare-fun e!868766 () Bool)

(assert (=> d!163045 (=> res!1065892 e!868766)))

(assert (=> d!163045 (= res!1065892 (or (is-Nil!36325 (t!51044 l!1177)) (is-Nil!36325 (t!51044 (t!51044 l!1177)))))))

(assert (=> d!163045 (= (isStrictlySorted!939 (t!51044 l!1177)) e!868766)))

(declare-fun b!1559434 () Bool)

(declare-fun e!868767 () Bool)

(assert (=> b!1559434 (= e!868766 e!868767)))

(declare-fun res!1065893 () Bool)

(assert (=> b!1559434 (=> (not res!1065893) (not e!868767))))

(assert (=> b!1559434 (= res!1065893 (bvslt (_1!12491 (h!37788 (t!51044 l!1177))) (_1!12491 (h!37788 (t!51044 (t!51044 l!1177))))))))

(declare-fun b!1559435 () Bool)

(assert (=> b!1559435 (= e!868767 (isStrictlySorted!939 (t!51044 (t!51044 l!1177))))))

(assert (= (and d!163045 (not res!1065892)) b!1559434))

(assert (= (and b!1559434 res!1065893) b!1559435))

(declare-fun m!1436527 () Bool)

(assert (=> b!1559435 m!1436527))

(assert (=> b!1559256 d!163045))

(declare-fun d!163047 () Bool)

(declare-fun res!1065894 () Bool)

(declare-fun e!868768 () Bool)

(assert (=> d!163047 (=> res!1065894 e!868768)))

(assert (=> d!163047 (= res!1065894 (and (is-Cons!36324 (t!51044 lt!671371)) (= (_1!12491 (h!37788 (t!51044 lt!671371))) otherKey!50)))))

(assert (=> d!163047 (= (containsKey!814 (t!51044 lt!671371) otherKey!50) e!868768)))

(declare-fun b!1559436 () Bool)

(declare-fun e!868769 () Bool)

(assert (=> b!1559436 (= e!868768 e!868769)))

(declare-fun res!1065895 () Bool)

(assert (=> b!1559436 (=> (not res!1065895) (not e!868769))))

(assert (=> b!1559436 (= res!1065895 (and (or (not (is-Cons!36324 (t!51044 lt!671371))) (bvsle (_1!12491 (h!37788 (t!51044 lt!671371))) otherKey!50)) (is-Cons!36324 (t!51044 lt!671371)) (bvslt (_1!12491 (h!37788 (t!51044 lt!671371))) otherKey!50)))))

(declare-fun b!1559437 () Bool)

(assert (=> b!1559437 (= e!868769 (containsKey!814 (t!51044 (t!51044 lt!671371)) otherKey!50))))

(assert (= (and d!163047 (not res!1065894)) b!1559436))

(assert (= (and b!1559436 res!1065895) b!1559437))

(declare-fun m!1436529 () Bool)

(assert (=> b!1559437 m!1436529))

(assert (=> b!1559294 d!163047))

(declare-fun b!1559438 () Bool)

(declare-fun e!868770 () Option!851)

(assert (=> b!1559438 (= e!868770 (Some!850 (_2!12491 (h!37788 (t!51044 lt!671371)))))))

(declare-fun b!1559439 () Bool)

(declare-fun e!868771 () Option!851)

(assert (=> b!1559439 (= e!868770 e!868771)))

(declare-fun c!144710 () Bool)

(assert (=> b!1559439 (= c!144710 (and (is-Cons!36324 (t!51044 lt!671371)) (not (= (_1!12491 (h!37788 (t!51044 lt!671371))) otherKey!50))))))

(declare-fun d!163049 () Bool)

(declare-fun c!144709 () Bool)

(assert (=> d!163049 (= c!144709 (and (is-Cons!36324 (t!51044 lt!671371)) (= (_1!12491 (h!37788 (t!51044 lt!671371))) otherKey!50)))))

(assert (=> d!163049 (= (getValueByKey!776 (t!51044 lt!671371) otherKey!50) e!868770)))

(declare-fun b!1559440 () Bool)

(assert (=> b!1559440 (= e!868771 (getValueByKey!776 (t!51044 (t!51044 lt!671371)) otherKey!50))))

(declare-fun b!1559441 () Bool)

(assert (=> b!1559441 (= e!868771 None!849)))

(assert (= (and d!163049 c!144709) b!1559438))

(assert (= (and d!163049 (not c!144709)) b!1559439))

(assert (= (and b!1559439 c!144710) b!1559440))

(assert (= (and b!1559439 (not c!144710)) b!1559441))

(declare-fun m!1436531 () Bool)

(assert (=> b!1559440 m!1436531))

(assert (=> b!1559279 d!163049))

(declare-fun d!163051 () Bool)

(declare-fun res!1065896 () Bool)

(declare-fun e!868772 () Bool)

(assert (=> d!163051 (=> res!1065896 e!868772)))

(assert (=> d!163051 (= res!1065896 (and (is-Cons!36324 (t!51044 l!1177)) (= (_1!12491 (h!37788 (t!51044 l!1177))) otherKey!50)))))

(assert (=> d!163051 (= (containsKey!814 (t!51044 l!1177) otherKey!50) e!868772)))

(declare-fun b!1559442 () Bool)

(declare-fun e!868773 () Bool)

(assert (=> b!1559442 (= e!868772 e!868773)))

(declare-fun res!1065897 () Bool)

(assert (=> b!1559442 (=> (not res!1065897) (not e!868773))))

(assert (=> b!1559442 (= res!1065897 (and (or (not (is-Cons!36324 (t!51044 l!1177))) (bvsle (_1!12491 (h!37788 (t!51044 l!1177))) otherKey!50)) (is-Cons!36324 (t!51044 l!1177)) (bvslt (_1!12491 (h!37788 (t!51044 l!1177))) otherKey!50)))))

(declare-fun b!1559443 () Bool)

(assert (=> b!1559443 (= e!868773 (containsKey!814 (t!51044 (t!51044 l!1177)) otherKey!50))))

(assert (= (and d!163051 (not res!1065896)) b!1559442))

(assert (= (and b!1559442 res!1065897) b!1559443))

(declare-fun m!1436533 () Bool)

(assert (=> b!1559443 m!1436533))

(assert (=> b!1559298 d!163051))

(declare-fun b!1559448 () Bool)

(declare-fun e!868778 () List!36328)

(declare-fun call!71805 () List!36328)

(assert (=> b!1559448 (= e!868778 call!71805)))

(declare-fun b!1559449 () Bool)

(declare-fun e!868782 () List!36328)

(assert (=> b!1559449 (= e!868782 (insertStrictlySorted!555 (t!51044 (t!51044 l!1177)) newKey!105 newValue!105))))

(declare-fun b!1559450 () Bool)

(declare-fun e!868781 () List!36328)

(declare-fun call!71803 () List!36328)

(assert (=> b!1559450 (= e!868781 call!71803)))

(declare-fun c!144714 () Bool)

(declare-fun bm!71800 () Bool)

(declare-fun call!71804 () List!36328)

(assert (=> bm!71800 (= call!71804 ($colon$colon!970 e!868782 (ite c!144714 (h!37788 (t!51044 l!1177)) (tuple2!24961 newKey!105 newValue!105))))))

(declare-fun c!144712 () Bool)

(assert (=> bm!71800 (= c!144712 c!144714)))

(declare-fun d!163053 () Bool)

(declare-fun e!868779 () Bool)

(assert (=> d!163053 e!868779))

(declare-fun res!1065903 () Bool)

(assert (=> d!163053 (=> (not res!1065903) (not e!868779))))

(declare-fun lt!671383 () List!36328)

(assert (=> d!163053 (= res!1065903 (isStrictlySorted!939 lt!671383))))

(declare-fun e!868780 () List!36328)

(assert (=> d!163053 (= lt!671383 e!868780)))

(assert (=> d!163053 (= c!144714 (and (is-Cons!36324 (t!51044 l!1177)) (bvslt (_1!12491 (h!37788 (t!51044 l!1177))) newKey!105)))))

(assert (=> d!163053 (isStrictlySorted!939 (t!51044 l!1177))))

(assert (=> d!163053 (= (insertStrictlySorted!555 (t!51044 l!1177) newKey!105 newValue!105) lt!671383)))

(declare-fun bm!71801 () Bool)

(assert (=> bm!71801 (= call!71803 call!71804)))

(declare-fun b!1559451 () Bool)

(assert (=> b!1559451 (= e!868780 e!868781)))

(declare-fun c!144711 () Bool)

(assert (=> b!1559451 (= c!144711 (and (is-Cons!36324 (t!51044 l!1177)) (= (_1!12491 (h!37788 (t!51044 l!1177))) newKey!105)))))

(declare-fun b!1559452 () Bool)

(assert (=> b!1559452 (= e!868779 (contains!10231 lt!671383 (tuple2!24961 newKey!105 newValue!105)))))

(declare-fun b!1559453 () Bool)

(assert (=> b!1559453 (= e!868780 call!71804)))

(declare-fun b!1559454 () Bool)

(declare-fun c!144713 () Bool)

(assert (=> b!1559454 (= e!868782 (ite c!144711 (t!51044 (t!51044 l!1177)) (ite c!144713 (Cons!36324 (h!37788 (t!51044 l!1177)) (t!51044 (t!51044 l!1177))) Nil!36325)))))

(declare-fun b!1559455 () Bool)

(assert (=> b!1559455 (= c!144713 (and (is-Cons!36324 (t!51044 l!1177)) (bvsgt (_1!12491 (h!37788 (t!51044 l!1177))) newKey!105)))))

(assert (=> b!1559455 (= e!868781 e!868778)))

(declare-fun b!1559456 () Bool)

(declare-fun res!1065902 () Bool)

(assert (=> b!1559456 (=> (not res!1065902) (not e!868779))))

(assert (=> b!1559456 (= res!1065902 (containsKey!814 lt!671383 newKey!105))))

(declare-fun b!1559457 () Bool)

(assert (=> b!1559457 (= e!868778 call!71805)))

(declare-fun bm!71802 () Bool)

(assert (=> bm!71802 (= call!71805 call!71803)))

(assert (= (and d!163053 c!144714) b!1559453))

(assert (= (and d!163053 (not c!144714)) b!1559451))

(assert (= (and b!1559451 c!144711) b!1559450))

(assert (= (and b!1559451 (not c!144711)) b!1559455))

(assert (= (and b!1559455 c!144713) b!1559457))

(assert (= (and b!1559455 (not c!144713)) b!1559448))

(assert (= (or b!1559457 b!1559448) bm!71802))

(assert (= (or b!1559450 bm!71802) bm!71801))

(assert (= (or b!1559453 bm!71801) bm!71800))

(assert (= (and bm!71800 c!144712) b!1559449))

(assert (= (and bm!71800 (not c!144712)) b!1559454))

(assert (= (and d!163053 res!1065903) b!1559456))

(assert (= (and b!1559456 res!1065902) b!1559452))

(declare-fun m!1436535 () Bool)

(assert (=> d!163053 m!1436535))

(assert (=> d!163053 m!1436465))

(declare-fun m!1436537 () Bool)

(assert (=> b!1559456 m!1436537))

(declare-fun m!1436539 () Bool)

(assert (=> b!1559452 m!1436539))

(declare-fun m!1436541 () Bool)

(assert (=> bm!71800 m!1436541))

(declare-fun m!1436543 () Bool)

(assert (=> b!1559449 m!1436543))

(assert (=> b!1559405 d!163053))

(declare-fun lt!671388 () Bool)

(declare-fun d!163055 () Bool)

(declare-fun content!789 (List!36328) (Set tuple2!24960))

(assert (=> d!163055 (= lt!671388 (set.member (tuple2!24961 newKey!105 newValue!105) (content!789 lt!671380)))))

(declare-fun e!868807 () Bool)

(assert (=> d!163055 (= lt!671388 e!868807)))

(declare-fun res!1065921 () Bool)

(assert (=> d!163055 (=> (not res!1065921) (not e!868807))))

(assert (=> d!163055 (= res!1065921 (is-Cons!36324 lt!671380))))

(assert (=> d!163055 (= (contains!10231 lt!671380 (tuple2!24961 newKey!105 newValue!105)) lt!671388)))

(declare-fun b!1559490 () Bool)

(declare-fun e!868806 () Bool)

(assert (=> b!1559490 (= e!868807 e!868806)))

(declare-fun res!1065920 () Bool)

(assert (=> b!1559490 (=> res!1065920 e!868806)))

(assert (=> b!1559490 (= res!1065920 (= (h!37788 lt!671380) (tuple2!24961 newKey!105 newValue!105)))))

(declare-fun b!1559491 () Bool)

(assert (=> b!1559491 (= e!868806 (contains!10231 (t!51044 lt!671380) (tuple2!24961 newKey!105 newValue!105)))))

(assert (= (and d!163055 res!1065921) b!1559490))

(assert (= (and b!1559490 (not res!1065920)) b!1559491))

(declare-fun m!1436571 () Bool)

(assert (=> d!163055 m!1436571))

(declare-fun m!1436575 () Bool)

(assert (=> d!163055 m!1436575))

(declare-fun m!1436577 () Bool)

(assert (=> b!1559491 m!1436577))

(assert (=> b!1559408 d!163055))

(declare-fun b!1559492 () Bool)

(declare-fun e!868808 () Bool)

(declare-fun tp!112462 () Bool)

(assert (=> b!1559492 (= e!868808 (and tp_is_empty!38369 tp!112462))))

(assert (=> b!1559423 (= tp!112461 e!868808)))

(assert (= (and b!1559423 (is-Cons!36324 (t!51044 (t!51044 l!1177)))) b!1559492))

(push 1)

(assert (not b!1559452))

(assert (not b!1559433))

(assert (not b!1559437))

(assert (not b!1559449))

(assert (not d!163055))

(assert (not b!1559426))

(assert (not b!1559491))

(assert tp_is_empty!38369)

(assert (not d!163053))

(assert (not bm!71800))

(assert (not b!1559440))

(assert (not b!1559456))

(assert (not b!1559443))

(assert (not b!1559429))

(assert (not b!1559435))

(assert (not b!1559492))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

