; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42748 () Bool)

(assert start!42748)

(declare-fun b_free!12091 () Bool)

(declare-fun b_next!12091 () Bool)

(assert (=> start!42748 (= b_free!12091 (not b_next!12091))))

(declare-fun tp!42336 () Bool)

(declare-fun b_and!20619 () Bool)

(assert (=> start!42748 (= tp!42336 b_and!20619)))

(declare-fun b!476348 () Bool)

(declare-fun e!279778 () Bool)

(declare-fun tp!42337 () Bool)

(assert (=> b!476348 (= e!279778 tp!42337)))

(declare-fun res!284370 () Bool)

(declare-fun e!279777 () Bool)

(assert (=> start!42748 (=> (not res!284370) (not e!279777))))

(declare-datatypes ((B!1040 0))(
  ( (B!1041 (val!6804 Int)) )
))
(declare-datatypes ((tuple2!9040 0))(
  ( (tuple2!9041 (_1!4531 (_ BitVec 64)) (_2!4531 B!1040)) )
))
(declare-datatypes ((List!9092 0))(
  ( (Nil!9089) (Cons!9088 (h!9944 tuple2!9040) (t!15087 List!9092)) )
))
(declare-datatypes ((ListLongMap!7943 0))(
  ( (ListLongMap!7944 (toList!3987 List!9092)) )
))
(declare-fun lm!215 () ListLongMap!7943)

(declare-fun p!166 () Int)

(declare-fun forall!191 (List!9092 Int) Bool)

(assert (=> start!42748 (= res!284370 (forall!191 (toList!3987 lm!215) p!166))))

(assert (=> start!42748 e!279777))

(declare-fun inv!15479 (ListLongMap!7943) Bool)

(assert (=> start!42748 (and (inv!15479 lm!215) e!279778)))

(assert (=> start!42748 tp!42336))

(assert (=> start!42748 true))

(declare-fun tp_is_empty!13513 () Bool)

(assert (=> start!42748 tp_is_empty!13513))

(declare-fun b!476345 () Bool)

(declare-fun res!284369 () Bool)

(assert (=> b!476345 (=> (not res!284369) (not e!279777))))

(declare-fun b!85 () B!1040)

(declare-fun a!501 () (_ BitVec 64))

(declare-fun dynLambda!941 (Int tuple2!9040) Bool)

(assert (=> b!476345 (= res!284369 (dynLambda!941 p!166 (tuple2!9041 a!501 b!85)))))

(declare-fun b!476346 () Bool)

(declare-fun res!284371 () Bool)

(assert (=> b!476346 (=> (not res!284371) (not e!279777))))

(declare-fun isEmpty!593 (ListLongMap!7943) Bool)

(assert (=> b!476346 (= res!284371 (not (isEmpty!593 lm!215)))))

(declare-fun b!476347 () Bool)

(declare-fun tail!113 (ListLongMap!7943) ListLongMap!7943)

(assert (=> b!476347 (= e!279777 (not (forall!191 (toList!3987 (tail!113 lm!215)) p!166)))))

(assert (= (and start!42748 res!284370) b!476345))

(assert (= (and b!476345 res!284369) b!476346))

(assert (= (and b!476346 res!284371) b!476347))

(assert (= start!42748 b!476348))

(declare-fun b_lambda!10377 () Bool)

(assert (=> (not b_lambda!10377) (not b!476345)))

(declare-fun t!15086 () Bool)

(declare-fun tb!3953 () Bool)

(assert (=> (and start!42748 (= p!166 p!166) t!15086) tb!3953))

(declare-fun result!7503 () Bool)

(assert (=> tb!3953 (= result!7503 true)))

(assert (=> b!476345 t!15086))

(declare-fun b_and!20621 () Bool)

(assert (= b_and!20619 (and (=> t!15086 result!7503) b_and!20621)))

(declare-fun m!458153 () Bool)

(assert (=> start!42748 m!458153))

(declare-fun m!458155 () Bool)

(assert (=> start!42748 m!458155))

(declare-fun m!458157 () Bool)

(assert (=> b!476345 m!458157))

(declare-fun m!458159 () Bool)

(assert (=> b!476346 m!458159))

(declare-fun m!458161 () Bool)

(assert (=> b!476347 m!458161))

(declare-fun m!458163 () Bool)

(assert (=> b!476347 m!458163))

(check-sat (not b!476347) (not b_next!12091) tp_is_empty!13513 (not b_lambda!10377) (not b!476346) (not b!476348) b_and!20621 (not start!42748))
(check-sat b_and!20621 (not b_next!12091))
(get-model)

(declare-fun b_lambda!10387 () Bool)

(assert (= b_lambda!10377 (or (and start!42748 b_free!12091) b_lambda!10387)))

(check-sat (not b!476347) (not b_next!12091) tp_is_empty!13513 (not b!476346) (not b!476348) (not b_lambda!10387) b_and!20621 (not start!42748))
(check-sat b_and!20621 (not b_next!12091))
(get-model)

(declare-fun d!75561 () Bool)

(declare-fun res!284406 () Bool)

(declare-fun e!279807 () Bool)

(assert (=> d!75561 (=> res!284406 e!279807)))

(get-info :version)

(assert (=> d!75561 (= res!284406 ((_ is Nil!9089) (toList!3987 lm!215)))))

(assert (=> d!75561 (= (forall!191 (toList!3987 lm!215) p!166) e!279807)))

(declare-fun b!476389 () Bool)

(declare-fun e!279808 () Bool)

(assert (=> b!476389 (= e!279807 e!279808)))

(declare-fun res!284407 () Bool)

(assert (=> b!476389 (=> (not res!284407) (not e!279808))))

(assert (=> b!476389 (= res!284407 (dynLambda!941 p!166 (h!9944 (toList!3987 lm!215))))))

(declare-fun b!476390 () Bool)

(assert (=> b!476390 (= e!279808 (forall!191 (t!15087 (toList!3987 lm!215)) p!166))))

(assert (= (and d!75561 (not res!284406)) b!476389))

(assert (= (and b!476389 res!284407) b!476390))

(declare-fun b_lambda!10393 () Bool)

(assert (=> (not b_lambda!10393) (not b!476389)))

(declare-fun t!15099 () Bool)

(declare-fun tb!3963 () Bool)

(assert (=> (and start!42748 (= p!166 p!166) t!15099) tb!3963))

(declare-fun result!7513 () Bool)

(assert (=> tb!3963 (= result!7513 true)))

(assert (=> b!476389 t!15099))

(declare-fun b_and!20635 () Bool)

(assert (= b_and!20621 (and (=> t!15099 result!7513) b_and!20635)))

(declare-fun m!458199 () Bool)

(assert (=> b!476389 m!458199))

(declare-fun m!458203 () Bool)

(assert (=> b!476390 m!458203))

(assert (=> start!42748 d!75561))

(declare-fun d!75571 () Bool)

(declare-fun isStrictlySorted!377 (List!9092) Bool)

(assert (=> d!75571 (= (inv!15479 lm!215) (isStrictlySorted!377 (toList!3987 lm!215)))))

(declare-fun bs!15109 () Bool)

(assert (= bs!15109 d!75571))

(declare-fun m!458217 () Bool)

(assert (=> bs!15109 m!458217))

(assert (=> start!42748 d!75571))

(declare-fun d!75581 () Bool)

(declare-fun isEmpty!597 (List!9092) Bool)

(assert (=> d!75581 (= (isEmpty!593 lm!215) (isEmpty!597 (toList!3987 lm!215)))))

(declare-fun bs!15110 () Bool)

(assert (= bs!15110 d!75581))

(declare-fun m!458219 () Bool)

(assert (=> bs!15110 m!458219))

(assert (=> b!476346 d!75581))

(declare-fun d!75583 () Bool)

(declare-fun res!284412 () Bool)

(declare-fun e!279813 () Bool)

(assert (=> d!75583 (=> res!284412 e!279813)))

(assert (=> d!75583 (= res!284412 ((_ is Nil!9089) (toList!3987 (tail!113 lm!215))))))

(assert (=> d!75583 (= (forall!191 (toList!3987 (tail!113 lm!215)) p!166) e!279813)))

(declare-fun b!476395 () Bool)

(declare-fun e!279814 () Bool)

(assert (=> b!476395 (= e!279813 e!279814)))

(declare-fun res!284413 () Bool)

(assert (=> b!476395 (=> (not res!284413) (not e!279814))))

(assert (=> b!476395 (= res!284413 (dynLambda!941 p!166 (h!9944 (toList!3987 (tail!113 lm!215)))))))

(declare-fun b!476396 () Bool)

(assert (=> b!476396 (= e!279814 (forall!191 (t!15087 (toList!3987 (tail!113 lm!215))) p!166))))

(assert (= (and d!75583 (not res!284412)) b!476395))

(assert (= (and b!476395 res!284413) b!476396))

(declare-fun b_lambda!10399 () Bool)

(assert (=> (not b_lambda!10399) (not b!476395)))

(declare-fun t!15105 () Bool)

(declare-fun tb!3969 () Bool)

(assert (=> (and start!42748 (= p!166 p!166) t!15105) tb!3969))

(declare-fun result!7521 () Bool)

(assert (=> tb!3969 (= result!7521 true)))

(assert (=> b!476395 t!15105))

(declare-fun b_and!20641 () Bool)

(assert (= b_and!20635 (and (=> t!15105 result!7521) b_and!20641)))

(declare-fun m!458225 () Bool)

(assert (=> b!476395 m!458225))

(declare-fun m!458227 () Bool)

(assert (=> b!476396 m!458227))

(assert (=> b!476347 d!75583))

(declare-fun d!75585 () Bool)

(declare-fun tail!118 (List!9092) List!9092)

(assert (=> d!75585 (= (tail!113 lm!215) (ListLongMap!7944 (tail!118 (toList!3987 lm!215))))))

(declare-fun bs!15113 () Bool)

(assert (= bs!15113 d!75585))

(declare-fun m!458229 () Bool)

(assert (=> bs!15113 m!458229))

(assert (=> b!476347 d!75585))

(declare-fun b!476411 () Bool)

(declare-fun e!279823 () Bool)

(declare-fun tp!42358 () Bool)

(assert (=> b!476411 (= e!279823 (and tp_is_empty!13513 tp!42358))))

(assert (=> b!476348 (= tp!42337 e!279823)))

(assert (= (and b!476348 ((_ is Cons!9088) (toList!3987 lm!215))) b!476411))

(declare-fun b_lambda!10409 () Bool)

(assert (= b_lambda!10399 (or (and start!42748 b_free!12091) b_lambda!10409)))

(declare-fun b_lambda!10411 () Bool)

(assert (= b_lambda!10393 (or (and start!42748 b_free!12091) b_lambda!10411)))

(check-sat (not b!476390) (not d!75581) (not b_next!12091) (not b_lambda!10411) (not b!476396) (not d!75585) (not b!476411) (not b_lambda!10387) tp_is_empty!13513 (not d!75571) (not b_lambda!10409) b_and!20641)
(check-sat b_and!20641 (not b_next!12091))
(get-model)

(declare-fun d!75587 () Bool)

(declare-fun res!284418 () Bool)

(declare-fun e!279828 () Bool)

(assert (=> d!75587 (=> res!284418 e!279828)))

(assert (=> d!75587 (= res!284418 (or ((_ is Nil!9089) (toList!3987 lm!215)) ((_ is Nil!9089) (t!15087 (toList!3987 lm!215)))))))

(assert (=> d!75587 (= (isStrictlySorted!377 (toList!3987 lm!215)) e!279828)))

(declare-fun b!476416 () Bool)

(declare-fun e!279829 () Bool)

(assert (=> b!476416 (= e!279828 e!279829)))

(declare-fun res!284419 () Bool)

(assert (=> b!476416 (=> (not res!284419) (not e!279829))))

(assert (=> b!476416 (= res!284419 (bvslt (_1!4531 (h!9944 (toList!3987 lm!215))) (_1!4531 (h!9944 (t!15087 (toList!3987 lm!215))))))))

(declare-fun b!476417 () Bool)

(assert (=> b!476417 (= e!279829 (isStrictlySorted!377 (t!15087 (toList!3987 lm!215))))))

(assert (= (and d!75587 (not res!284418)) b!476416))

(assert (= (and b!476416 res!284419) b!476417))

(declare-fun m!458231 () Bool)

(assert (=> b!476417 m!458231))

(assert (=> d!75571 d!75587))

(declare-fun d!75589 () Bool)

(declare-fun res!284420 () Bool)

(declare-fun e!279830 () Bool)

(assert (=> d!75589 (=> res!284420 e!279830)))

(assert (=> d!75589 (= res!284420 ((_ is Nil!9089) (t!15087 (toList!3987 (tail!113 lm!215)))))))

(assert (=> d!75589 (= (forall!191 (t!15087 (toList!3987 (tail!113 lm!215))) p!166) e!279830)))

(declare-fun b!476418 () Bool)

(declare-fun e!279831 () Bool)

(assert (=> b!476418 (= e!279830 e!279831)))

(declare-fun res!284421 () Bool)

(assert (=> b!476418 (=> (not res!284421) (not e!279831))))

(assert (=> b!476418 (= res!284421 (dynLambda!941 p!166 (h!9944 (t!15087 (toList!3987 (tail!113 lm!215))))))))

(declare-fun b!476419 () Bool)

(assert (=> b!476419 (= e!279831 (forall!191 (t!15087 (t!15087 (toList!3987 (tail!113 lm!215)))) p!166))))

(assert (= (and d!75589 (not res!284420)) b!476418))

(assert (= (and b!476418 res!284421) b!476419))

(declare-fun b_lambda!10413 () Bool)

(assert (=> (not b_lambda!10413) (not b!476418)))

(declare-fun t!15107 () Bool)

(declare-fun tb!3971 () Bool)

(assert (=> (and start!42748 (= p!166 p!166) t!15107) tb!3971))

(declare-fun result!7527 () Bool)

(assert (=> tb!3971 (= result!7527 true)))

(assert (=> b!476418 t!15107))

(declare-fun b_and!20643 () Bool)

(assert (= b_and!20641 (and (=> t!15107 result!7527) b_and!20643)))

(declare-fun m!458233 () Bool)

(assert (=> b!476418 m!458233))

(declare-fun m!458235 () Bool)

(assert (=> b!476419 m!458235))

(assert (=> b!476396 d!75589))

(declare-fun d!75591 () Bool)

(assert (=> d!75591 (= (isEmpty!597 (toList!3987 lm!215)) ((_ is Nil!9089) (toList!3987 lm!215)))))

(assert (=> d!75581 d!75591))

(declare-fun d!75593 () Bool)

(assert (=> d!75593 (= (tail!118 (toList!3987 lm!215)) (t!15087 (toList!3987 lm!215)))))

(assert (=> d!75585 d!75593))

(declare-fun d!75597 () Bool)

(declare-fun res!284422 () Bool)

(declare-fun e!279832 () Bool)

(assert (=> d!75597 (=> res!284422 e!279832)))

(assert (=> d!75597 (= res!284422 ((_ is Nil!9089) (t!15087 (toList!3987 lm!215))))))

(assert (=> d!75597 (= (forall!191 (t!15087 (toList!3987 lm!215)) p!166) e!279832)))

(declare-fun b!476420 () Bool)

(declare-fun e!279833 () Bool)

(assert (=> b!476420 (= e!279832 e!279833)))

(declare-fun res!284423 () Bool)

(assert (=> b!476420 (=> (not res!284423) (not e!279833))))

(assert (=> b!476420 (= res!284423 (dynLambda!941 p!166 (h!9944 (t!15087 (toList!3987 lm!215)))))))

(declare-fun b!476421 () Bool)

(assert (=> b!476421 (= e!279833 (forall!191 (t!15087 (t!15087 (toList!3987 lm!215))) p!166))))

(assert (= (and d!75597 (not res!284422)) b!476420))

(assert (= (and b!476420 res!284423) b!476421))

(declare-fun b_lambda!10415 () Bool)

(assert (=> (not b_lambda!10415) (not b!476420)))

(declare-fun t!15109 () Bool)

(declare-fun tb!3973 () Bool)

(assert (=> (and start!42748 (= p!166 p!166) t!15109) tb!3973))

(declare-fun result!7529 () Bool)

(assert (=> tb!3973 (= result!7529 true)))

(assert (=> b!476420 t!15109))

(declare-fun b_and!20645 () Bool)

(assert (= b_and!20643 (and (=> t!15109 result!7529) b_and!20645)))

(declare-fun m!458237 () Bool)

(assert (=> b!476420 m!458237))

(declare-fun m!458239 () Bool)

(assert (=> b!476421 m!458239))

(assert (=> b!476390 d!75597))

(declare-fun b!476422 () Bool)

(declare-fun e!279834 () Bool)

(declare-fun tp!42359 () Bool)

(assert (=> b!476422 (= e!279834 (and tp_is_empty!13513 tp!42359))))

(assert (=> b!476411 (= tp!42358 e!279834)))

(assert (= (and b!476411 ((_ is Cons!9088) (t!15087 (toList!3987 lm!215)))) b!476422))

(declare-fun b_lambda!10417 () Bool)

(assert (= b_lambda!10415 (or (and start!42748 b_free!12091) b_lambda!10417)))

(declare-fun b_lambda!10419 () Bool)

(assert (= b_lambda!10413 (or (and start!42748 b_free!12091) b_lambda!10419)))

(check-sat b_and!20645 (not b_next!12091) (not b_lambda!10411) (not b!476417) (not b!476421) (not b!476422) (not b_lambda!10387) tp_is_empty!13513 (not b_lambda!10417) (not b!476419) (not b_lambda!10419) (not b_lambda!10409))
(check-sat b_and!20645 (not b_next!12091))
