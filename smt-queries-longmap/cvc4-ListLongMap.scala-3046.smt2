; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42742 () Bool)

(assert start!42742)

(declare-fun b_free!12089 () Bool)

(declare-fun b_next!12089 () Bool)

(assert (=> start!42742 (= b_free!12089 (not b_next!12089))))

(declare-fun tp!42322 () Bool)

(declare-fun b_and!20635 () Bool)

(assert (=> start!42742 (= tp!42322 b_and!20635)))

(declare-fun res!284473 () Bool)

(declare-fun e!279909 () Bool)

(assert (=> start!42742 (=> (not res!284473) (not e!279909))))

(declare-datatypes ((B!1038 0))(
  ( (B!1039 (val!6803 Int)) )
))
(declare-datatypes ((tuple2!8978 0))(
  ( (tuple2!8979 (_1!4500 (_ BitVec 64)) (_2!4500 B!1038)) )
))
(declare-datatypes ((List!9046 0))(
  ( (Nil!9043) (Cons!9042 (h!9898 tuple2!8978) (t!15042 List!9046)) )
))
(declare-datatypes ((ListLongMap!7891 0))(
  ( (ListLongMap!7892 (toList!3961 List!9046)) )
))
(declare-fun lm!215 () ListLongMap!7891)

(declare-fun p!166 () Int)

(declare-fun forall!190 (List!9046 Int) Bool)

(assert (=> start!42742 (= res!284473 (forall!190 (toList!3961 lm!215) p!166))))

(assert (=> start!42742 e!279909))

(declare-fun e!279910 () Bool)

(declare-fun inv!15473 (ListLongMap!7891) Bool)

(assert (=> start!42742 (and (inv!15473 lm!215) e!279910)))

(assert (=> start!42742 tp!42322))

(assert (=> start!42742 true))

(declare-fun tp_is_empty!13511 () Bool)

(assert (=> start!42742 tp_is_empty!13511))

(declare-fun b!476554 () Bool)

(declare-fun res!284472 () Bool)

(assert (=> b!476554 (=> (not res!284472) (not e!279909))))

(declare-fun a!501 () (_ BitVec 64))

(declare-fun b!85 () B!1038)

(declare-fun dynLambda!937 (Int tuple2!8978) Bool)

(assert (=> b!476554 (= res!284472 (dynLambda!937 p!166 (tuple2!8979 a!501 b!85)))))

(declare-fun b!476555 () Bool)

(declare-fun size!15139 (List!9046) Int)

(assert (=> b!476555 (= e!279909 (< (size!15139 (toList!3961 lm!215)) 0))))

(declare-fun b!476556 () Bool)

(declare-fun tp!42321 () Bool)

(assert (=> b!476556 (= e!279910 tp!42321)))

(assert (= (and start!42742 res!284473) b!476554))

(assert (= (and b!476554 res!284472) b!476555))

(assert (= start!42742 b!476556))

(declare-fun b_lambda!10375 () Bool)

(assert (=> (not b_lambda!10375) (not b!476554)))

(declare-fun t!15041 () Bool)

(declare-fun tb!3953 () Bool)

(assert (=> (and start!42742 (= p!166 p!166) t!15041) tb!3953))

(declare-fun result!7497 () Bool)

(assert (=> tb!3953 (= result!7497 true)))

(assert (=> b!476554 t!15041))

(declare-fun b_and!20637 () Bool)

(assert (= b_and!20635 (and (=> t!15041 result!7497) b_and!20637)))

(declare-fun m!458855 () Bool)

(assert (=> start!42742 m!458855))

(declare-fun m!458857 () Bool)

(assert (=> start!42742 m!458857))

(declare-fun m!458859 () Bool)

(assert (=> b!476554 m!458859))

(declare-fun m!458861 () Bool)

(assert (=> b!476555 m!458861))

(push 1)

(assert (not b!476555))

(assert (not start!42742))

(assert (not b_lambda!10375))

(assert b_and!20637)

(assert (not b_next!12089))

(assert (not b!476556))

(assert tp_is_empty!13511)

(check-sat)

(pop 1)

(push 1)

(assert b_and!20637)

(assert (not b_next!12089))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!10381 () Bool)

(assert (= b_lambda!10375 (or (and start!42742 b_free!12089) b_lambda!10381)))

(push 1)

(assert (not b!476555))

(assert (not start!42742))

(assert b_and!20637)

(assert (not b_lambda!10381))

(assert (not b_next!12089))

(assert (not b!476556))

(assert tp_is_empty!13511)

(check-sat)

(pop 1)

(push 1)

(assert b_and!20637)

(assert (not b_next!12089))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75749 () Bool)

(declare-fun lt!217305 () Int)

(assert (=> d!75749 (>= lt!217305 0)))

(declare-fun e!279928 () Int)

(assert (=> d!75749 (= lt!217305 e!279928)))

(declare-fun c!57352 () Bool)

(assert (=> d!75749 (= c!57352 (is-Nil!9043 (toList!3961 lm!215)))))

(assert (=> d!75749 (= (size!15139 (toList!3961 lm!215)) lt!217305)))

(declare-fun b!476579 () Bool)

(assert (=> b!476579 (= e!279928 0)))

(declare-fun b!476580 () Bool)

(assert (=> b!476580 (= e!279928 (+ 1 (size!15139 (t!15042 (toList!3961 lm!215)))))))

(assert (= (and d!75749 c!57352) b!476579))

(assert (= (and d!75749 (not c!57352)) b!476580))

(declare-fun m!458875 () Bool)

(assert (=> b!476580 m!458875))

(assert (=> b!476555 d!75749))

(declare-fun d!75755 () Bool)

(declare-fun res!284490 () Bool)

(declare-fun e!279942 () Bool)

(assert (=> d!75755 (=> res!284490 e!279942)))

(assert (=> d!75755 (= res!284490 (is-Nil!9043 (toList!3961 lm!215)))))

(assert (=> d!75755 (= (forall!190 (toList!3961 lm!215) p!166) e!279942)))

(declare-fun b!476601 () Bool)

