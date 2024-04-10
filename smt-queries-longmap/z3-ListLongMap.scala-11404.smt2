; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132790 () Bool)

(assert start!132790)

(declare-fun res!1064392 () Bool)

(declare-fun e!866327 () Bool)

(assert (=> start!132790 (=> (not res!1064392) (not e!866327))))

(declare-datatypes ((B!2302 0))(
  ( (B!2303 (val!19237 Int)) )
))
(declare-datatypes ((tuple2!24850 0))(
  ( (tuple2!24851 (_1!12436 (_ BitVec 64)) (_2!12436 B!2302)) )
))
(declare-datatypes ((List!36271 0))(
  ( (Nil!36268) (Cons!36267 (h!37713 tuple2!24850) (t!50992 List!36271)) )
))
(declare-fun l!1177 () List!36271)

(declare-fun isStrictlySorted!927 (List!36271) Bool)

(assert (=> start!132790 (= res!1064392 (isStrictlySorted!927 l!1177))))

(assert (=> start!132790 e!866327))

(declare-fun e!866326 () Bool)

(assert (=> start!132790 e!866326))

(assert (=> start!132790 true))

(declare-fun tp_is_empty!38313 () Bool)

(assert (=> start!132790 tp_is_empty!38313))

(declare-fun b!1555614 () Bool)

(declare-fun res!1064391 () Bool)

(assert (=> b!1555614 (=> (not res!1064391) (not e!866327))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1555614 (= res!1064391 (and (not (= newKey!105 otherKey!50)) (or (not ((_ is Cons!36267) l!1177)) (= (_1!12436 (h!37713 l!1177)) otherKey!50))))))

(declare-fun b!1555615 () Bool)

(declare-fun newValue!105 () B!2302)

(declare-fun insertStrictlySorted!538 (List!36271 (_ BitVec 64) B!2302) List!36271)

(assert (=> b!1555615 (= e!866327 (not (isStrictlySorted!927 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105))))))

(declare-fun b!1555616 () Bool)

(declare-fun tp!112311 () Bool)

(assert (=> b!1555616 (= e!866326 (and tp_is_empty!38313 tp!112311))))

(assert (= (and start!132790 res!1064392) b!1555614))

(assert (= (and b!1555614 res!1064391) b!1555615))

(assert (= (and start!132790 ((_ is Cons!36267) l!1177)) b!1555616))

(declare-fun m!1433577 () Bool)

(assert (=> start!132790 m!1433577))

(declare-fun m!1433579 () Bool)

(assert (=> b!1555615 m!1433579))

(assert (=> b!1555615 m!1433579))

(declare-fun m!1433581 () Bool)

(assert (=> b!1555615 m!1433581))

(check-sat (not start!132790) (not b!1555615) (not b!1555616) tp_is_empty!38313)
(check-sat)
(get-model)

(declare-fun d!161991 () Bool)

(declare-fun res!1064403 () Bool)

(declare-fun e!866338 () Bool)

(assert (=> d!161991 (=> res!1064403 e!866338)))

(assert (=> d!161991 (= res!1064403 (or ((_ is Nil!36268) l!1177) ((_ is Nil!36268) (t!50992 l!1177))))))

(assert (=> d!161991 (= (isStrictlySorted!927 l!1177) e!866338)))

(declare-fun b!1555630 () Bool)

(declare-fun e!866339 () Bool)

(assert (=> b!1555630 (= e!866338 e!866339)))

(declare-fun res!1064404 () Bool)

(assert (=> b!1555630 (=> (not res!1064404) (not e!866339))))

(assert (=> b!1555630 (= res!1064404 (bvslt (_1!12436 (h!37713 l!1177)) (_1!12436 (h!37713 (t!50992 l!1177)))))))

(declare-fun b!1555631 () Bool)

(assert (=> b!1555631 (= e!866339 (isStrictlySorted!927 (t!50992 l!1177)))))

(assert (= (and d!161991 (not res!1064403)) b!1555630))

(assert (= (and b!1555630 res!1064404) b!1555631))

(declare-fun m!1433589 () Bool)

(assert (=> b!1555631 m!1433589))

(assert (=> start!132790 d!161991))

(declare-fun d!161995 () Bool)

(declare-fun res!1064405 () Bool)

(declare-fun e!866340 () Bool)

(assert (=> d!161995 (=> res!1064405 e!866340)))

(assert (=> d!161995 (= res!1064405 (or ((_ is Nil!36268) (insertStrictlySorted!538 l!1177 newKey!105 newValue!105)) ((_ is Nil!36268) (t!50992 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105)))))))

(assert (=> d!161995 (= (isStrictlySorted!927 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105)) e!866340)))

(declare-fun b!1555632 () Bool)

(declare-fun e!866341 () Bool)

(assert (=> b!1555632 (= e!866340 e!866341)))

(declare-fun res!1064406 () Bool)

(assert (=> b!1555632 (=> (not res!1064406) (not e!866341))))

(assert (=> b!1555632 (= res!1064406 (bvslt (_1!12436 (h!37713 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105))) (_1!12436 (h!37713 (t!50992 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105))))))))

(declare-fun b!1555633 () Bool)

(assert (=> b!1555633 (= e!866341 (isStrictlySorted!927 (t!50992 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105))))))

(assert (= (and d!161995 (not res!1064405)) b!1555632))

(assert (= (and b!1555632 res!1064406) b!1555633))

(declare-fun m!1433591 () Bool)

(assert (=> b!1555633 m!1433591))

(assert (=> b!1555615 d!161995))

(declare-fun c!143659 () Bool)

(declare-fun c!143658 () Bool)

(declare-fun b!1555710 () Bool)

(declare-fun e!866391 () List!36271)

(assert (=> b!1555710 (= e!866391 (ite c!143658 (t!50992 l!1177) (ite c!143659 (Cons!36267 (h!37713 l!1177) (t!50992 l!1177)) Nil!36268)))))

(declare-fun bm!71542 () Bool)

(declare-fun call!71546 () List!36271)

(declare-fun call!71547 () List!36271)

(assert (=> bm!71542 (= call!71546 call!71547)))

(declare-fun b!1555711 () Bool)

(declare-fun e!866389 () List!36271)

(declare-fun call!71545 () List!36271)

(assert (=> b!1555711 (= e!866389 call!71545)))

(declare-fun b!1555712 () Bool)

(declare-fun res!1064435 () Bool)

(declare-fun e!866390 () Bool)

(assert (=> b!1555712 (=> (not res!1064435) (not e!866390))))

(declare-fun lt!670332 () List!36271)

(declare-fun containsKey!797 (List!36271 (_ BitVec 64)) Bool)

(assert (=> b!1555712 (= res!1064435 (containsKey!797 lt!670332 newKey!105))))

(declare-fun bm!71543 () Bool)

(assert (=> bm!71543 (= call!71545 call!71546)))

(declare-fun d!161999 () Bool)

(assert (=> d!161999 e!866390))

(declare-fun res!1064436 () Bool)

(assert (=> d!161999 (=> (not res!1064436) (not e!866390))))

(assert (=> d!161999 (= res!1064436 (isStrictlySorted!927 lt!670332))))

(declare-fun e!866388 () List!36271)

(assert (=> d!161999 (= lt!670332 e!866388)))

(declare-fun c!143661 () Bool)

(assert (=> d!161999 (= c!143661 (and ((_ is Cons!36267) l!1177) (bvslt (_1!12436 (h!37713 l!1177)) newKey!105)))))

(assert (=> d!161999 (isStrictlySorted!927 l!1177)))

(assert (=> d!161999 (= (insertStrictlySorted!538 l!1177 newKey!105 newValue!105) lt!670332)))

(declare-fun bm!71544 () Bool)

(declare-fun $colon$colon!960 (List!36271 tuple2!24850) List!36271)

(assert (=> bm!71544 (= call!71547 ($colon$colon!960 e!866391 (ite c!143661 (h!37713 l!1177) (tuple2!24851 newKey!105 newValue!105))))))

(declare-fun c!143660 () Bool)

(assert (=> bm!71544 (= c!143660 c!143661)))

(declare-fun b!1555713 () Bool)

(declare-fun e!866392 () List!36271)

(assert (=> b!1555713 (= e!866388 e!866392)))

(assert (=> b!1555713 (= c!143658 (and ((_ is Cons!36267) l!1177) (= (_1!12436 (h!37713 l!1177)) newKey!105)))))

(declare-fun b!1555714 () Bool)

(assert (=> b!1555714 (= e!866389 call!71545)))

(declare-fun b!1555715 () Bool)

(declare-fun contains!10177 (List!36271 tuple2!24850) Bool)

(assert (=> b!1555715 (= e!866390 (contains!10177 lt!670332 (tuple2!24851 newKey!105 newValue!105)))))

(declare-fun b!1555716 () Bool)

(assert (=> b!1555716 (= e!866392 call!71546)))

(declare-fun b!1555717 () Bool)

(assert (=> b!1555717 (= e!866391 (insertStrictlySorted!538 (t!50992 l!1177) newKey!105 newValue!105))))

(declare-fun b!1555718 () Bool)

(assert (=> b!1555718 (= e!866388 call!71547)))

(declare-fun b!1555719 () Bool)

(assert (=> b!1555719 (= c!143659 (and ((_ is Cons!36267) l!1177) (bvsgt (_1!12436 (h!37713 l!1177)) newKey!105)))))

(assert (=> b!1555719 (= e!866392 e!866389)))

(assert (= (and d!161999 c!143661) b!1555718))

(assert (= (and d!161999 (not c!143661)) b!1555713))

(assert (= (and b!1555713 c!143658) b!1555716))

(assert (= (and b!1555713 (not c!143658)) b!1555719))

(assert (= (and b!1555719 c!143659) b!1555714))

(assert (= (and b!1555719 (not c!143659)) b!1555711))

(assert (= (or b!1555714 b!1555711) bm!71543))

(assert (= (or b!1555716 bm!71543) bm!71542))

(assert (= (or b!1555718 bm!71542) bm!71544))

(assert (= (and bm!71544 c!143660) b!1555717))

(assert (= (and bm!71544 (not c!143660)) b!1555710))

(assert (= (and d!161999 res!1064436) b!1555712))

(assert (= (and b!1555712 res!1064435) b!1555715))

(declare-fun m!1433601 () Bool)

(assert (=> b!1555712 m!1433601))

(declare-fun m!1433603 () Bool)

(assert (=> bm!71544 m!1433603))

(declare-fun m!1433605 () Bool)

(assert (=> b!1555717 m!1433605))

(declare-fun m!1433607 () Bool)

(assert (=> d!161999 m!1433607))

(assert (=> d!161999 m!1433577))

(declare-fun m!1433609 () Bool)

(assert (=> b!1555715 m!1433609))

(assert (=> b!1555615 d!161999))

(declare-fun b!1555734 () Bool)

(declare-fun e!866400 () Bool)

(declare-fun tp!112317 () Bool)

(assert (=> b!1555734 (= e!866400 (and tp_is_empty!38313 tp!112317))))

(assert (=> b!1555616 (= tp!112311 e!866400)))

(assert (= (and b!1555616 ((_ is Cons!36267) (t!50992 l!1177))) b!1555734))

(check-sat tp_is_empty!38313 (not b!1555715) (not d!161999) (not b!1555712) (not bm!71544) (not b!1555717) (not b!1555633) (not b!1555734) (not b!1555631))
(check-sat)
