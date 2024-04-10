; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1996 () Bool)

(assert start!1996)

(declare-fun b!13441 () Bool)

(assert (=> b!13441 true))

(declare-fun b!13440 () Bool)

(declare-fun e!8051 () Bool)

(declare-datatypes ((B!492 0))(
  ( (B!493 (val!344 Int)) )
))
(declare-datatypes ((tuple2!488 0))(
  ( (tuple2!489 (_1!244 (_ BitVec 64)) (_2!244 B!492)) )
))
(declare-datatypes ((List!399 0))(
  ( (Nil!396) (Cons!395 (h!961 tuple2!488) (t!2795 List!399)) )
))
(declare-fun lt!3516 () List!399)

(assert (=> b!13440 (= e!8051 (= lt!3516 Nil!396))))

(declare-fun b!13442 () Bool)

(declare-fun e!8050 () Bool)

(assert (=> b!13442 (= e!8050 e!8051)))

(declare-fun res!10592 () Bool)

(assert (=> b!13442 (=> (not res!10592) (not e!8051))))

(declare-fun isStrictlySorted!86 (List!399) Bool)

(assert (=> b!13442 (= res!10592 (isStrictlySorted!86 lt!3516))))

(declare-fun l!522 () List!399)

(declare-fun value!159 () B!492)

(declare-fun filterByValue!9 (List!399 B!492) List!399)

(assert (=> b!13442 (= lt!3516 (filterByValue!9 (t!2795 l!522) value!159))))

(declare-fun b!13443 () Bool)

(declare-fun e!8049 () Bool)

(declare-fun tp_is_empty!671 () Bool)

(declare-fun tp!2192 () Bool)

(assert (=> b!13443 (= e!8049 (and tp_is_empty!671 tp!2192))))

(declare-fun b!13444 () Bool)

(declare-fun res!10593 () Bool)

(assert (=> b!13444 (=> (not res!10593) (not e!8051))))

(declare-fun isEmpty!83 (List!399) Bool)

(assert (=> b!13444 (= res!10593 (not (isEmpty!83 l!522)))))

(declare-fun b!13445 () Bool)

(declare-fun res!10595 () Bool)

(assert (=> b!13445 (=> (not res!10595) (not e!8051))))

(assert (=> b!13445 (= res!10595 (not (isEmpty!83 lt!3516)))))

(declare-fun b!13446 () Bool)

(declare-fun res!10597 () Bool)

(assert (=> b!13446 (=> (not res!10597) (not e!8050))))

(assert (=> b!13446 (= res!10597 (and (not (= (_2!244 (h!961 l!522)) value!159)) (is-Cons!395 l!522)))))

(declare-fun res!10594 () Bool)

(assert (=> start!1996 (=> (not res!10594) (not e!8050))))

(assert (=> start!1996 (= res!10594 (isStrictlySorted!86 l!522))))

(assert (=> start!1996 e!8050))

(assert (=> start!1996 e!8049))

(assert (=> start!1996 tp_is_empty!671))

(declare-fun res!10596 () Bool)

(assert (=> b!13441 (=> (not res!10596) (not e!8051))))

(declare-fun lambda!77 () Int)

(declare-fun forall!76 (List!399 Int) Bool)

(assert (=> b!13441 (= res!10596 (forall!76 lt!3516 lambda!77))))

(assert (= (and start!1996 res!10594) b!13446))

(assert (= (and b!13446 res!10597) b!13442))

(assert (= (and b!13442 res!10592) b!13441))

(assert (= (and b!13441 res!10596) b!13444))

(assert (= (and b!13444 res!10593) b!13445))

(assert (= (and b!13445 res!10595) b!13440))

(assert (= (and start!1996 (is-Cons!395 l!522)) b!13443))

(declare-fun m!9125 () Bool)

(assert (=> b!13444 m!9125))

(declare-fun m!9127 () Bool)

(assert (=> b!13445 m!9127))

(declare-fun m!9129 () Bool)

(assert (=> b!13441 m!9129))

(declare-fun m!9131 () Bool)

(assert (=> start!1996 m!9131))

(declare-fun m!9133 () Bool)

(assert (=> b!13442 m!9133))

(declare-fun m!9135 () Bool)

(assert (=> b!13442 m!9135))

(push 1)

(assert (not b!13441))

(assert (not b!13445))

(assert (not b!13443))

(assert (not start!1996))

(assert (not b!13444))

(assert (not b!13442))

(assert tp_is_empty!671)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2015 () Bool)

(declare-fun res!10608 () Bool)

(declare-fun e!8062 () Bool)

(assert (=> d!2015 (=> res!10608 e!8062)))

(assert (=> d!2015 (= res!10608 (or (is-Nil!396 l!522) (is-Nil!396 (t!2795 l!522))))))

(assert (=> d!2015 (= (isStrictlySorted!86 l!522) e!8062)))

(declare-fun b!13459 () Bool)

(declare-fun e!8063 () Bool)

(assert (=> b!13459 (= e!8062 e!8063)))

(declare-fun res!10609 () Bool)

(assert (=> b!13459 (=> (not res!10609) (not e!8063))))

(assert (=> b!13459 (= res!10609 (bvslt (_1!244 (h!961 l!522)) (_1!244 (h!961 (t!2795 l!522)))))))

(declare-fun b!13460 () Bool)

(assert (=> b!13460 (= e!8063 (isStrictlySorted!86 (t!2795 l!522)))))

(assert (= (and d!2015 (not res!10608)) b!13459))

(assert (= (and b!13459 res!10609) b!13460))

(declare-fun m!9139 () Bool)

(assert (=> b!13460 m!9139))

(assert (=> start!1996 d!2015))

(declare-fun d!2023 () Bool)

(assert (=> d!2023 (= (isEmpty!83 lt!3516) (is-Nil!396 lt!3516))))

(assert (=> b!13445 d!2023))

(declare-fun d!2025 () Bool)

(declare-fun res!10622 () Bool)

(declare-fun e!8076 () Bool)

(assert (=> d!2025 (=> res!10622 e!8076)))

(assert (=> d!2025 (= res!10622 (is-Nil!396 lt!3516))))

(assert (=> d!2025 (= (forall!76 lt!3516 lambda!77) e!8076)))

(declare-fun b!13473 () Bool)

(declare-fun e!8077 () Bool)

(assert (=> b!13473 (= e!8076 e!8077)))

(declare-fun res!10623 () Bool)

(assert (=> b!13473 (=> (not res!10623) (not e!8077))))

(declare-fun dynLambda!85 (Int tuple2!488) Bool)

(assert (=> b!13473 (= res!10623 (dynLambda!85 lambda!77 (h!961 lt!3516)))))

(declare-fun b!13474 () Bool)

(assert (=> b!13474 (= e!8077 (forall!76 (t!2795 lt!3516) lambda!77))))

(assert (= (and d!2025 (not res!10622)) b!13473))

(assert (= (and b!13473 res!10623) b!13474))

(declare-fun b_lambda!875 () Bool)

(assert (=> (not b_lambda!875) (not b!13473)))

(declare-fun m!9145 () Bool)

(assert (=> b!13473 m!9145))

(declare-fun m!9147 () Bool)

(assert (=> b!13474 m!9147))

(assert (=> b!13441 d!2025))

(declare-fun d!2033 () Bool)

(declare-fun res!10624 () Bool)

(declare-fun e!8078 () Bool)

(assert (=> d!2033 (=> res!10624 e!8078)))

(assert (=> d!2033 (= res!10624 (or (is-Nil!396 lt!3516) (is-Nil!396 (t!2795 lt!3516))))))

(assert (=> d!2033 (= (isStrictlySorted!86 lt!3516) e!8078)))

(declare-fun b!13475 () Bool)

(declare-fun e!8079 () Bool)

(assert (=> b!13475 (= e!8078 e!8079)))

(declare-fun res!10625 () Bool)

(assert (=> b!13475 (=> (not res!10625) (not e!8079))))

(assert (=> b!13475 (= res!10625 (bvslt (_1!244 (h!961 lt!3516)) (_1!244 (h!961 (t!2795 lt!3516)))))))

(declare-fun b!13476 () Bool)

(assert (=> b!13476 (= e!8079 (isStrictlySorted!86 (t!2795 lt!3516)))))

(assert (= (and d!2033 (not res!10624)) b!13475))

(assert (= (and b!13475 res!10625) b!13476))

(declare-fun m!9149 () Bool)

(assert (=> b!13476 m!9149))

(assert (=> b!13442 d!2033))

(declare-fun bs!527 () Bool)

(declare-fun b!13553 () Bool)

(assert (= bs!527 (and b!13553 b!13441)))

(declare-fun lambda!86 () Int)

(assert (=> bs!527 (= lambda!86 lambda!77)))

(assert (=> b!13553 true))

(declare-fun b!13551 () Bool)

(declare-fun e!8124 () Bool)

(declare-fun e!8125 () Bool)

(assert (=> b!13551 (= e!8124 e!8125)))

(declare-fun res!10654 () Bool)

(declare-fun call!382 () Bool)

(assert (=> b!13551 (= res!10654 call!382)))

(assert (=> b!13551 (=> res!10654 e!8125)))

(declare-fun d!2035 () Bool)

(declare-fun e!8126 () Bool)

(assert (=> d!2035 e!8126))

(declare-fun res!10653 () Bool)

(assert (=> d!2035 (=> (not res!10653) (not e!8126))))

(declare-fun lt!3525 () List!399)

(assert (=> d!2035 (= res!10653 (isStrictlySorted!86 lt!3525))))

(declare-fun e!8123 () List!399)

(assert (=> d!2035 (= lt!3525 e!8123)))

(declare-fun c!1266 () Bool)

(assert (=> d!2035 (= c!1266 (and (is-Cons!395 (t!2795 l!522)) (= (_2!244 (h!961 (t!2795 l!522))) value!159)))))

(assert (=> d!2035 (isStrictlySorted!86 (t!2795 l!522))))

(assert (=> d!2035 (= (filterByValue!9 (t!2795 l!522) value!159) lt!3525)))

(declare-fun b!13552 () Bool)

(declare-fun e!8122 () List!399)

(assert (=> b!13552 (= e!8122 Nil!396)))

(declare-fun res!10652 () Bool)

(assert (=> b!13553 (=> (not res!10652) (not e!8126))))

(assert (=> b!13553 (= res!10652 (forall!76 lt!3525 lambda!86))))

(declare-fun b!13554 () Bool)

(assert (=> b!13554 (= e!8126 e!8124)))

(declare-fun c!1268 () Bool)

(assert (=> b!13554 (= c!1268 (isEmpty!83 (t!2795 l!522)))))

(declare-fun b!13555 () Bool)

(assert (=> b!13555 (= e!8123 e!8122)))

(declare-fun c!1267 () Bool)

(assert (=> b!13555 (= c!1267 (and (is-Cons!395 (t!2795 l!522)) (not (= (_2!244 (h!961 (t!2795 l!522))) value!159))))))

(declare-fun b!13556 () Bool)

(assert (=> b!13556 (= e!8124 call!382)))

(declare-fun bm!379 () Bool)

(assert (=> bm!379 (= call!382 (isEmpty!83 lt!3525))))

(declare-fun b!13557 () Bool)

(declare-fun call!383 () List!399)

(declare-fun $colon$colon!17 (List!399 tuple2!488) List!399)

(assert (=> b!13557 (= e!8123 ($colon$colon!17 call!383 (h!961 (t!2795 l!522))))))

(declare-fun bm!380 () Bool)

(assert (=> bm!380 (= call!383 (filterByValue!9 (t!2795 (t!2795 l!522)) value!159))))

(declare-fun b!13558 () Bool)

(declare-fun head!787 (List!399) tuple2!488)

(assert (=> b!13558 (= e!8125 (bvsge (_1!244 (head!787 lt!3525)) (_1!244 (head!787 (t!2795 l!522)))))))

(declare-fun b!13559 () Bool)

(assert (=> b!13559 (= e!8122 call!383)))

(assert (= (and d!2035 c!1266) b!13557))

(assert (= (and d!2035 (not c!1266)) b!13555))

(assert (= (and b!13555 c!1267) b!13559))

(assert (= (and b!13555 (not c!1267)) b!13552))

(assert (= (or b!13557 b!13559) bm!380))

(assert (= (and d!2035 res!10653) b!13553))

(assert (= (and b!13553 res!10652) b!13554))

(assert (= (and b!13554 c!1268) b!13556))

(assert (= (and b!13554 (not c!1268)) b!13551))

(assert (= (and b!13551 (not res!10654)) b!13558))

(assert (= (or b!13556 b!13551) bm!379))

(declare-fun m!9185 () Bool)

(assert (=> b!13557 m!9185))

(declare-fun m!9187 () Bool)

(assert (=> bm!380 m!9187))

(declare-fun m!9189 () Bool)

(assert (=> bm!379 m!9189))

(declare-fun m!9191 () Bool)

(assert (=> b!13553 m!9191))

(declare-fun m!9193 () Bool)

(assert (=> b!13554 m!9193))

(declare-fun m!9195 () Bool)

(assert (=> b!13558 m!9195))

(declare-fun m!9197 () Bool)

(assert (=> b!13558 m!9197))

(declare-fun m!9199 () Bool)

(assert (=> d!2035 m!9199))

(assert (=> d!2035 m!9139))

(assert (=> b!13442 d!2035))

(declare-fun d!2045 () Bool)

(assert (=> d!2045 (= (isEmpty!83 l!522) (is-Nil!396 l!522))))

(assert (=> b!13444 d!2045))

(declare-fun b!13578 () Bool)

(declare-fun e!8141 () Bool)

(declare-fun tp!2197 () Bool)

