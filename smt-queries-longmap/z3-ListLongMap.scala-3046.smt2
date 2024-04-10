; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42740 () Bool)

(assert start!42740)

(declare-fun b_free!12087 () Bool)

(declare-fun b_next!12087 () Bool)

(assert (=> start!42740 (= b_free!12087 (not b_next!12087))))

(declare-fun tp!42316 () Bool)

(declare-fun b_and!20631 () Bool)

(assert (=> start!42740 (= tp!42316 b_and!20631)))

(declare-fun res!284466 () Bool)

(declare-fun e!279903 () Bool)

(assert (=> start!42740 (=> (not res!284466) (not e!279903))))

(declare-datatypes ((B!1036 0))(
  ( (B!1037 (val!6802 Int)) )
))
(declare-datatypes ((tuple2!8976 0))(
  ( (tuple2!8977 (_1!4499 (_ BitVec 64)) (_2!4499 B!1036)) )
))
(declare-datatypes ((List!9045 0))(
  ( (Nil!9042) (Cons!9041 (h!9897 tuple2!8976) (t!15039 List!9045)) )
))
(declare-datatypes ((ListLongMap!7889 0))(
  ( (ListLongMap!7890 (toList!3960 List!9045)) )
))
(declare-fun lm!215 () ListLongMap!7889)

(declare-fun p!166 () Int)

(declare-fun forall!189 (List!9045 Int) Bool)

(assert (=> start!42740 (= res!284466 (forall!189 (toList!3960 lm!215) p!166))))

(assert (=> start!42740 e!279903))

(declare-fun e!279904 () Bool)

(declare-fun inv!15472 (ListLongMap!7889) Bool)

(assert (=> start!42740 (and (inv!15472 lm!215) e!279904)))

(assert (=> start!42740 tp!42316))

(assert (=> start!42740 true))

(declare-fun tp_is_empty!13509 () Bool)

(assert (=> start!42740 tp_is_empty!13509))

(declare-fun b!476545 () Bool)

(declare-fun res!284467 () Bool)

(assert (=> b!476545 (=> (not res!284467) (not e!279903))))

(declare-fun b!85 () B!1036)

(declare-fun a!501 () (_ BitVec 64))

(declare-fun dynLambda!936 (Int tuple2!8976) Bool)

(assert (=> b!476545 (= res!284467 (dynLambda!936 p!166 (tuple2!8977 a!501 b!85)))))

(declare-fun b!476546 () Bool)

(declare-fun size!15138 (List!9045) Int)

(assert (=> b!476546 (= e!279903 (< (size!15138 (toList!3960 lm!215)) 0))))

(declare-fun b!476547 () Bool)

(declare-fun tp!42315 () Bool)

(assert (=> b!476547 (= e!279904 tp!42315)))

(assert (= (and start!42740 res!284466) b!476545))

(assert (= (and b!476545 res!284467) b!476546))

(assert (= start!42740 b!476547))

(declare-fun b_lambda!10373 () Bool)

(assert (=> (not b_lambda!10373) (not b!476545)))

(declare-fun t!15038 () Bool)

(declare-fun tb!3951 () Bool)

(assert (=> (and start!42740 (= p!166 p!166) t!15038) tb!3951))

(declare-fun result!7495 () Bool)

(assert (=> tb!3951 (= result!7495 true)))

(assert (=> b!476545 t!15038))

(declare-fun b_and!20633 () Bool)

(assert (= b_and!20631 (and (=> t!15038 result!7495) b_and!20633)))

(declare-fun m!458847 () Bool)

(assert (=> start!42740 m!458847))

(declare-fun m!458849 () Bool)

(assert (=> start!42740 m!458849))

(declare-fun m!458851 () Bool)

(assert (=> b!476545 m!458851))

(declare-fun m!458853 () Bool)

(assert (=> b!476546 m!458853))

(check-sat (not b_next!12087) (not b!476546) (not start!42740) b_and!20633 tp_is_empty!13509 (not b!476547) (not b_lambda!10373))
(check-sat b_and!20633 (not b_next!12087))
(get-model)

(declare-fun b_lambda!10379 () Bool)

(assert (= b_lambda!10373 (or (and start!42740 b_free!12087) b_lambda!10379)))

(check-sat (not b_next!12087) (not b!476546) (not start!42740) (not b_lambda!10379) b_and!20633 (not b!476547) tp_is_empty!13509)
(check-sat b_and!20633 (not b_next!12087))
(get-model)

(declare-fun d!75743 () Bool)

(declare-fun lt!217302 () Int)

(assert (=> d!75743 (>= lt!217302 0)))

(declare-fun e!279919 () Int)

(assert (=> d!75743 (= lt!217302 e!279919)))

(declare-fun c!57349 () Bool)

(get-info :version)

(assert (=> d!75743 (= c!57349 ((_ is Nil!9042) (toList!3960 lm!215)))))

(assert (=> d!75743 (= (size!15138 (toList!3960 lm!215)) lt!217302)))

(declare-fun b!476567 () Bool)

(assert (=> b!476567 (= e!279919 0)))

(declare-fun b!476568 () Bool)

(assert (=> b!476568 (= e!279919 (+ 1 (size!15138 (t!15039 (toList!3960 lm!215)))))))

(assert (= (and d!75743 c!57349) b!476567))

(assert (= (and d!75743 (not c!57349)) b!476568))

(declare-fun m!458863 () Bool)

(assert (=> b!476568 m!458863))

(assert (=> b!476546 d!75743))

(declare-fun d!75745 () Bool)

(declare-fun res!284484 () Bool)

(declare-fun e!279926 () Bool)

(assert (=> d!75745 (=> res!284484 e!279926)))

(assert (=> d!75745 (= res!284484 ((_ is Nil!9042) (toList!3960 lm!215)))))

(assert (=> d!75745 (= (forall!189 (toList!3960 lm!215) p!166) e!279926)))

(declare-fun b!476577 () Bool)

(declare-fun e!279927 () Bool)

(assert (=> b!476577 (= e!279926 e!279927)))

(declare-fun res!284485 () Bool)

(assert (=> b!476577 (=> (not res!284485) (not e!279927))))

(assert (=> b!476577 (= res!284485 (dynLambda!936 p!166 (h!9897 (toList!3960 lm!215))))))

(declare-fun b!476578 () Bool)

(assert (=> b!476578 (= e!279927 (forall!189 (t!15039 (toList!3960 lm!215)) p!166))))

(assert (= (and d!75745 (not res!284484)) b!476577))

(assert (= (and b!476577 res!284485) b!476578))

(declare-fun b_lambda!10385 () Bool)

(assert (=> (not b_lambda!10385) (not b!476577)))

(declare-fun t!15046 () Bool)

(declare-fun tb!3957 () Bool)

(assert (=> (and start!42740 (= p!166 p!166) t!15046) tb!3957))

(declare-fun result!7501 () Bool)

(assert (=> tb!3957 (= result!7501 true)))

(assert (=> b!476577 t!15046))

(declare-fun b_and!20641 () Bool)

(assert (= b_and!20633 (and (=> t!15046 result!7501) b_and!20641)))

(declare-fun m!458871 () Bool)

(assert (=> b!476577 m!458871))

(declare-fun m!458873 () Bool)

(assert (=> b!476578 m!458873))

(assert (=> start!42740 d!75745))

(declare-fun d!75753 () Bool)

(declare-fun isStrictlySorted!380 (List!9045) Bool)

(assert (=> d!75753 (= (inv!15472 lm!215) (isStrictlySorted!380 (toList!3960 lm!215)))))

(declare-fun bs!15130 () Bool)

(assert (= bs!15130 d!75753))

(declare-fun m!458879 () Bool)

(assert (=> bs!15130 m!458879))

(assert (=> start!42740 d!75753))

(declare-fun b!476600 () Bool)

(declare-fun e!279941 () Bool)

(declare-fun tp!42328 () Bool)

(assert (=> b!476600 (= e!279941 (and tp_is_empty!13509 tp!42328))))

(assert (=> b!476547 (= tp!42315 e!279941)))

(assert (= (and b!476547 ((_ is Cons!9041) (toList!3960 lm!215))) b!476600))

(declare-fun b_lambda!10389 () Bool)

(assert (= b_lambda!10385 (or (and start!42740 b_free!12087) b_lambda!10389)))

(check-sat (not b!476568) (not b_next!12087) (not d!75753) b_and!20641 (not b_lambda!10379) (not b!476600) tp_is_empty!13509 (not b!476578) (not b_lambda!10389))
(check-sat b_and!20641 (not b_next!12087))
