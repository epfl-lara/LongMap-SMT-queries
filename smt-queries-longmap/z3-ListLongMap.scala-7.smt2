; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!240 () Bool)

(assert start!240)

(declare-fun b_free!39 () Bool)

(declare-fun b_next!39 () Bool)

(assert (=> start!240 (= b_free!39 (not b_next!39))))

(declare-fun tp!143 () Bool)

(declare-fun b_and!93 () Bool)

(assert (=> start!240 (= tp!143 b_and!93)))

(declare-fun b!2009 () Bool)

(declare-fun res!4521 () Bool)

(declare-fun e!489 () Bool)

(assert (=> b!2009 (=> (not res!4521) (not e!489))))

(declare-datatypes ((B!274 0))(
  ( (B!275 (val!19 Int)) )
))
(declare-datatypes ((tuple2!38 0))(
  ( (tuple2!39 (_1!19 (_ BitVec 64)) (_2!19 B!274)) )
))
(declare-datatypes ((List!28 0))(
  ( (Nil!25) (Cons!24 (h!590 tuple2!38) (t!2077 List!28)) )
))
(declare-datatypes ((ListLongMap!43 0))(
  ( (ListLongMap!44 (toList!37 List!28)) )
))
(declare-fun lm!258 () ListLongMap!43)

(declare-fun k0!394 () (_ BitVec 64))

(declare-fun head!750 (List!28) tuple2!38)

(assert (=> b!2009 (= res!4521 (not (= (_1!19 (head!750 (toList!37 lm!258))) k0!394)))))

(declare-fun b!2010 () Bool)

(declare-fun e!488 () Bool)

(assert (=> b!2010 (= e!489 e!488)))

(declare-fun res!4522 () Bool)

(assert (=> b!2010 (=> (not res!4522) (not e!488))))

(declare-fun lt!320 () ListLongMap!43)

(declare-fun p!318 () Int)

(declare-fun forall!21 (List!28 Int) Bool)

(assert (=> b!2010 (= res!4522 (forall!21 (toList!37 lt!320) p!318))))

(declare-fun tail!39 (ListLongMap!43) ListLongMap!43)

(assert (=> b!2010 (= lt!320 (tail!39 lm!258))))

(declare-fun b!2011 () Bool)

(declare-fun e!487 () Bool)

(declare-fun tp!142 () Bool)

(assert (=> b!2011 (= e!487 tp!142)))

(declare-fun b!2012 () Bool)

(declare-fun res!4523 () Bool)

(assert (=> b!2012 (=> (not res!4523) (not e!489))))

(declare-fun isEmpty!26 (ListLongMap!43) Bool)

(assert (=> b!2012 (= res!4523 (not (isEmpty!26 lm!258)))))

(declare-fun b!2013 () Bool)

(declare-fun size!67 (List!28) Int)

(assert (=> b!2013 (= e!488 (>= (size!67 (toList!37 lt!320)) (size!67 (toList!37 lm!258))))))

(declare-fun res!4520 () Bool)

(assert (=> start!240 (=> (not res!4520) (not e!489))))

(assert (=> start!240 (= res!4520 (forall!21 (toList!37 lm!258) p!318))))

(assert (=> start!240 e!489))

(declare-fun inv!64 (ListLongMap!43) Bool)

(assert (=> start!240 (and (inv!64 lm!258) e!487)))

(assert (=> start!240 tp!143))

(assert (=> start!240 true))

(assert (= (and start!240 res!4520) b!2012))

(assert (= (and b!2012 res!4523) b!2009))

(assert (= (and b!2009 res!4521) b!2010))

(assert (= (and b!2010 res!4522) b!2013))

(assert (= start!240 b!2011))

(declare-fun m!655 () Bool)

(assert (=> b!2010 m!655))

(declare-fun m!657 () Bool)

(assert (=> b!2010 m!657))

(declare-fun m!659 () Bool)

(assert (=> b!2009 m!659))

(declare-fun m!661 () Bool)

(assert (=> start!240 m!661))

(declare-fun m!663 () Bool)

(assert (=> start!240 m!663))

(declare-fun m!665 () Bool)

(assert (=> b!2013 m!665))

(declare-fun m!667 () Bool)

(assert (=> b!2013 m!667))

(declare-fun m!669 () Bool)

(assert (=> b!2012 m!669))

(check-sat b_and!93 (not b!2013) (not b!2012) (not start!240) (not b!2009) (not b!2011) (not b!2010) (not b_next!39))
(check-sat b_and!93 (not b_next!39))
(get-model)

(declare-fun d!255 () Bool)

(declare-fun isEmpty!29 (List!28) Bool)

(assert (=> d!255 (= (isEmpty!26 lm!258) (isEmpty!29 (toList!37 lm!258)))))

(declare-fun bs!64 () Bool)

(assert (= bs!64 d!255))

(declare-fun m!693 () Bool)

(assert (=> bs!64 m!693))

(assert (=> b!2012 d!255))

(declare-fun d!261 () Bool)

(declare-fun res!4552 () Bool)

(declare-fun e!519 () Bool)

(assert (=> d!261 (=> res!4552 e!519)))

(get-info :version)

(assert (=> d!261 (= res!4552 ((_ is Nil!25) (toList!37 lt!320)))))

(assert (=> d!261 (= (forall!21 (toList!37 lt!320) p!318) e!519)))

(declare-fun b!2053 () Bool)

(declare-fun e!520 () Bool)

(assert (=> b!2053 (= e!519 e!520)))

(declare-fun res!4553 () Bool)

(assert (=> b!2053 (=> (not res!4553) (not e!520))))

(declare-fun dynLambda!13 (Int tuple2!38) Bool)

(assert (=> b!2053 (= res!4553 (dynLambda!13 p!318 (h!590 (toList!37 lt!320))))))

(declare-fun b!2054 () Bool)

(assert (=> b!2054 (= e!520 (forall!21 (t!2077 (toList!37 lt!320)) p!318))))

(assert (= (and d!261 (not res!4552)) b!2053))

(assert (= (and b!2053 res!4553) b!2054))

(declare-fun b_lambda!113 () Bool)

(assert (=> (not b_lambda!113) (not b!2053)))

(declare-fun t!2084 () Bool)

(declare-fun tb!53 () Bool)

(assert (=> (and start!240 (= p!318 p!318) t!2084) tb!53))

(declare-fun result!77 () Bool)

(assert (=> tb!53 (= result!77 true)))

(assert (=> b!2053 t!2084))

(declare-fun b_and!101 () Bool)

(assert (= b_and!93 (and (=> t!2084 result!77) b_and!101)))

(declare-fun m!707 () Bool)

(assert (=> b!2053 m!707))

(declare-fun m!709 () Bool)

(assert (=> b!2054 m!709))

(assert (=> b!2010 d!261))

(declare-fun d!273 () Bool)

(declare-fun tail!42 (List!28) List!28)

(assert (=> d!273 (= (tail!39 lm!258) (ListLongMap!44 (tail!42 (toList!37 lm!258))))))

(declare-fun bs!67 () Bool)

(assert (= bs!67 d!273))

(declare-fun m!715 () Bool)

(assert (=> bs!67 m!715))

(assert (=> b!2010 d!273))

(declare-fun d!277 () Bool)

(declare-fun res!4556 () Bool)

(declare-fun e!526 () Bool)

(assert (=> d!277 (=> res!4556 e!526)))

(assert (=> d!277 (= res!4556 ((_ is Nil!25) (toList!37 lm!258)))))

(assert (=> d!277 (= (forall!21 (toList!37 lm!258) p!318) e!526)))

(declare-fun b!2063 () Bool)

(declare-fun e!527 () Bool)

(assert (=> b!2063 (= e!526 e!527)))

(declare-fun res!4557 () Bool)

(assert (=> b!2063 (=> (not res!4557) (not e!527))))

(assert (=> b!2063 (= res!4557 (dynLambda!13 p!318 (h!590 (toList!37 lm!258))))))

(declare-fun b!2064 () Bool)

(assert (=> b!2064 (= e!527 (forall!21 (t!2077 (toList!37 lm!258)) p!318))))

(assert (= (and d!277 (not res!4556)) b!2063))

(assert (= (and b!2063 res!4557) b!2064))

(declare-fun b_lambda!117 () Bool)

(assert (=> (not b_lambda!117) (not b!2063)))

(declare-fun t!2088 () Bool)

(declare-fun tb!57 () Bool)

(assert (=> (and start!240 (= p!318 p!318) t!2088) tb!57))

(declare-fun result!81 () Bool)

(assert (=> tb!57 (= result!81 true)))

(assert (=> b!2063 t!2088))

(declare-fun b_and!105 () Bool)

(assert (= b_and!101 (and (=> t!2088 result!81) b_and!105)))

(declare-fun m!721 () Bool)

(assert (=> b!2063 m!721))

(declare-fun m!723 () Bool)

(assert (=> b!2064 m!723))

(assert (=> start!240 d!277))

(declare-fun d!283 () Bool)

(declare-fun isStrictlySorted!12 (List!28) Bool)

(assert (=> d!283 (= (inv!64 lm!258) (isStrictlySorted!12 (toList!37 lm!258)))))

(declare-fun bs!69 () Bool)

(assert (= bs!69 d!283))

(declare-fun m!728 () Bool)

(assert (=> bs!69 m!728))

(assert (=> start!240 d!283))

(declare-fun d!289 () Bool)

(assert (=> d!289 (= (head!750 (toList!37 lm!258)) (h!590 (toList!37 lm!258)))))

(assert (=> b!2009 d!289))

(declare-fun d!291 () Bool)

(declare-fun lt!334 () Int)

(assert (=> d!291 (>= lt!334 0)))

(declare-fun e!536 () Int)

(assert (=> d!291 (= lt!334 e!536)))

(declare-fun c!106 () Bool)

(assert (=> d!291 (= c!106 ((_ is Nil!25) (toList!37 lt!320)))))

(assert (=> d!291 (= (size!67 (toList!37 lt!320)) lt!334)))

(declare-fun b!2080 () Bool)

(assert (=> b!2080 (= e!536 0)))

(declare-fun b!2081 () Bool)

(assert (=> b!2081 (= e!536 (+ 1 (size!67 (t!2077 (toList!37 lt!320)))))))

(assert (= (and d!291 c!106) b!2080))

(assert (= (and d!291 (not c!106)) b!2081))

(declare-fun m!737 () Bool)

(assert (=> b!2081 m!737))

(assert (=> b!2013 d!291))

(declare-fun d!297 () Bool)

(declare-fun lt!335 () Int)

(assert (=> d!297 (>= lt!335 0)))

(declare-fun e!539 () Int)

(assert (=> d!297 (= lt!335 e!539)))

(declare-fun c!107 () Bool)

(assert (=> d!297 (= c!107 ((_ is Nil!25) (toList!37 lm!258)))))

(assert (=> d!297 (= (size!67 (toList!37 lm!258)) lt!335)))

(declare-fun b!2084 () Bool)

(assert (=> b!2084 (= e!539 0)))

(declare-fun b!2085 () Bool)

(assert (=> b!2085 (= e!539 (+ 1 (size!67 (t!2077 (toList!37 lm!258)))))))

(assert (= (and d!297 c!107) b!2084))

(assert (= (and d!297 (not c!107)) b!2085))

(declare-fun m!739 () Bool)

(assert (=> b!2085 m!739))

(assert (=> b!2013 d!297))

(declare-fun b!2091 () Bool)

(declare-fun e!543 () Bool)

(declare-fun tp_is_empty!29 () Bool)

(declare-fun tp!158 () Bool)

(assert (=> b!2091 (= e!543 (and tp_is_empty!29 tp!158))))

(assert (=> b!2011 (= tp!142 e!543)))

(assert (= (and b!2011 ((_ is Cons!24) (toList!37 lm!258))) b!2091))

(declare-fun b_lambda!129 () Bool)

(assert (= b_lambda!117 (or (and start!240 b_free!39) b_lambda!129)))

(declare-fun b_lambda!131 () Bool)

(assert (= b_lambda!113 (or (and start!240 b_free!39) b_lambda!131)))

(check-sat (not d!273) (not d!283) tp_is_empty!29 (not b!2081) (not b_lambda!129) (not b!2091) (not b!2054) (not b_next!39) (not b!2085) (not b_lambda!131) b_and!105 (not b!2064) (not d!255))
(check-sat b_and!105 (not b_next!39))
(get-model)

(declare-fun d!301 () Bool)

(declare-fun res!4562 () Bool)

(declare-fun e!546 () Bool)

(assert (=> d!301 (=> res!4562 e!546)))

(assert (=> d!301 (= res!4562 ((_ is Nil!25) (t!2077 (toList!37 lm!258))))))

(assert (=> d!301 (= (forall!21 (t!2077 (toList!37 lm!258)) p!318) e!546)))

(declare-fun b!2094 () Bool)

(declare-fun e!547 () Bool)

(assert (=> b!2094 (= e!546 e!547)))

(declare-fun res!4563 () Bool)

(assert (=> b!2094 (=> (not res!4563) (not e!547))))

(assert (=> b!2094 (= res!4563 (dynLambda!13 p!318 (h!590 (t!2077 (toList!37 lm!258)))))))

(declare-fun b!2095 () Bool)

(assert (=> b!2095 (= e!547 (forall!21 (t!2077 (t!2077 (toList!37 lm!258))) p!318))))

(assert (= (and d!301 (not res!4562)) b!2094))

(assert (= (and b!2094 res!4563) b!2095))

(declare-fun b_lambda!135 () Bool)

(assert (=> (not b_lambda!135) (not b!2094)))

(declare-fun t!2094 () Bool)

(declare-fun tb!63 () Bool)

(assert (=> (and start!240 (= p!318 p!318) t!2094) tb!63))

(declare-fun result!93 () Bool)

(assert (=> tb!63 (= result!93 true)))

(assert (=> b!2094 t!2094))

(declare-fun b_and!111 () Bool)

(assert (= b_and!105 (and (=> t!2094 result!93) b_and!111)))

(declare-fun m!745 () Bool)

(assert (=> b!2094 m!745))

(declare-fun m!747 () Bool)

(assert (=> b!2095 m!747))

(assert (=> b!2064 d!301))

(declare-fun d!305 () Bool)

(assert (=> d!305 (= (isEmpty!29 (toList!37 lm!258)) ((_ is Nil!25) (toList!37 lm!258)))))

(assert (=> d!255 d!305))

(declare-fun d!309 () Bool)

(declare-fun lt!336 () Int)

(assert (=> d!309 (>= lt!336 0)))

(declare-fun e!548 () Int)

(assert (=> d!309 (= lt!336 e!548)))

(declare-fun c!108 () Bool)

(assert (=> d!309 (= c!108 ((_ is Nil!25) (t!2077 (toList!37 lm!258))))))

(assert (=> d!309 (= (size!67 (t!2077 (toList!37 lm!258))) lt!336)))

(declare-fun b!2096 () Bool)

(assert (=> b!2096 (= e!548 0)))

(declare-fun b!2097 () Bool)

(assert (=> b!2097 (= e!548 (+ 1 (size!67 (t!2077 (t!2077 (toList!37 lm!258))))))))

(assert (= (and d!309 c!108) b!2096))

(assert (= (and d!309 (not c!108)) b!2097))

(declare-fun m!749 () Bool)

(assert (=> b!2097 m!749))

(assert (=> b!2085 d!309))

(declare-fun d!313 () Bool)

(assert (=> d!313 (= (tail!42 (toList!37 lm!258)) (t!2077 (toList!37 lm!258)))))

(assert (=> d!273 d!313))

(declare-fun d!317 () Bool)

(declare-fun res!4566 () Bool)

(declare-fun e!551 () Bool)

(assert (=> d!317 (=> res!4566 e!551)))

(assert (=> d!317 (= res!4566 ((_ is Nil!25) (t!2077 (toList!37 lt!320))))))

(assert (=> d!317 (= (forall!21 (t!2077 (toList!37 lt!320)) p!318) e!551)))

(declare-fun b!2100 () Bool)

(declare-fun e!552 () Bool)

(assert (=> b!2100 (= e!551 e!552)))

(declare-fun res!4567 () Bool)

(assert (=> b!2100 (=> (not res!4567) (not e!552))))

(assert (=> b!2100 (= res!4567 (dynLambda!13 p!318 (h!590 (t!2077 (toList!37 lt!320)))))))

(declare-fun b!2101 () Bool)

(assert (=> b!2101 (= e!552 (forall!21 (t!2077 (t!2077 (toList!37 lt!320))) p!318))))

(assert (= (and d!317 (not res!4566)) b!2100))

(assert (= (and b!2100 res!4567) b!2101))

(declare-fun b_lambda!139 () Bool)

(assert (=> (not b_lambda!139) (not b!2100)))

(declare-fun t!2098 () Bool)

(declare-fun tb!67 () Bool)

(assert (=> (and start!240 (= p!318 p!318) t!2098) tb!67))

(declare-fun result!97 () Bool)

(assert (=> tb!67 (= result!97 true)))

(assert (=> b!2100 t!2098))

(declare-fun b_and!115 () Bool)

(assert (= b_and!111 (and (=> t!2098 result!97) b_and!115)))

(declare-fun m!755 () Bool)

(assert (=> b!2100 m!755))

(declare-fun m!757 () Bool)

(assert (=> b!2101 m!757))

(assert (=> b!2054 d!317))

(declare-fun d!321 () Bool)

(declare-fun res!4582 () Bool)

(declare-fun e!570 () Bool)

(assert (=> d!321 (=> res!4582 e!570)))

(assert (=> d!321 (= res!4582 (or ((_ is Nil!25) (toList!37 lm!258)) ((_ is Nil!25) (t!2077 (toList!37 lm!258)))))))

(assert (=> d!321 (= (isStrictlySorted!12 (toList!37 lm!258)) e!570)))

(declare-fun b!2123 () Bool)

(declare-fun e!572 () Bool)

(assert (=> b!2123 (= e!570 e!572)))

(declare-fun res!4584 () Bool)

(assert (=> b!2123 (=> (not res!4584) (not e!572))))

(assert (=> b!2123 (= res!4584 (bvslt (_1!19 (h!590 (toList!37 lm!258))) (_1!19 (h!590 (t!2077 (toList!37 lm!258))))))))

(declare-fun b!2125 () Bool)

(assert (=> b!2125 (= e!572 (isStrictlySorted!12 (t!2077 (toList!37 lm!258))))))

(assert (= (and d!321 (not res!4582)) b!2123))

(assert (= (and b!2123 res!4584) b!2125))

(declare-fun m!769 () Bool)

(assert (=> b!2125 m!769))

(assert (=> d!283 d!321))

(declare-fun d!331 () Bool)

(declare-fun lt!340 () Int)

(assert (=> d!331 (>= lt!340 0)))

(declare-fun e!575 () Int)

(assert (=> d!331 (= lt!340 e!575)))

(declare-fun c!112 () Bool)

(assert (=> d!331 (= c!112 ((_ is Nil!25) (t!2077 (toList!37 lt!320))))))

(assert (=> d!331 (= (size!67 (t!2077 (toList!37 lt!320))) lt!340)))

(declare-fun b!2127 () Bool)

(assert (=> b!2127 (= e!575 0)))

(declare-fun b!2128 () Bool)

(assert (=> b!2128 (= e!575 (+ 1 (size!67 (t!2077 (t!2077 (toList!37 lt!320))))))))

(assert (= (and d!331 c!112) b!2127))

(assert (= (and d!331 (not c!112)) b!2128))

(declare-fun m!771 () Bool)

(assert (=> b!2128 m!771))

(assert (=> b!2081 d!331))

(declare-fun b!2131 () Bool)

(declare-fun e!578 () Bool)

(declare-fun tp!160 () Bool)

(assert (=> b!2131 (= e!578 (and tp_is_empty!29 tp!160))))

(assert (=> b!2091 (= tp!158 e!578)))

(assert (= (and b!2091 ((_ is Cons!24) (t!2077 (toList!37 lm!258)))) b!2131))

(declare-fun b_lambda!147 () Bool)

(assert (= b_lambda!139 (or (and start!240 b_free!39) b_lambda!147)))

(declare-fun b_lambda!149 () Bool)

(assert (= b_lambda!135 (or (and start!240 b_free!39) b_lambda!149)))

(check-sat (not b!2095) (not b!2128) (not b_lambda!129) (not b!2097) (not b_lambda!131) (not b!2125) (not b!2101) (not b_next!39) (not b_lambda!147) (not b_lambda!149) tp_is_empty!29 b_and!115 (not b!2131))
(check-sat b_and!115 (not b_next!39))
