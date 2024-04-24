; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42718 () Bool)

(assert start!42718)

(declare-fun b_free!12079 () Bool)

(declare-fun b_next!12079 () Bool)

(assert (=> start!42718 (= b_free!12079 (not b_next!12079))))

(declare-fun tp!42291 () Bool)

(declare-fun b_and!20625 () Bool)

(assert (=> start!42718 (= tp!42291 b_and!20625)))

(declare-fun b!476441 () Bool)

(declare-fun res!284430 () Bool)

(declare-fun e!279841 () Bool)

(assert (=> b!476441 (=> (not res!284430) (not e!279841))))

(declare-datatypes ((B!1028 0))(
  ( (B!1029 (val!6798 Int)) )
))
(declare-fun b!85 () B!1028)

(declare-fun p!166 () Int)

(declare-fun a!501 () (_ BitVec 64))

(declare-datatypes ((tuple2!8892 0))(
  ( (tuple2!8893 (_1!4457 (_ BitVec 64)) (_2!4457 B!1028)) )
))
(declare-fun dynLambda!929 (Int tuple2!8892) Bool)

(assert (=> b!476441 (= res!284430 (dynLambda!929 p!166 (tuple2!8893 a!501 b!85)))))

(declare-fun res!284428 () Bool)

(assert (=> start!42718 (=> (not res!284428) (not e!279841))))

(declare-datatypes ((List!8950 0))(
  ( (Nil!8947) (Cons!8946 (h!9802 tuple2!8892) (t!14928 List!8950)) )
))
(declare-datatypes ((ListLongMap!7807 0))(
  ( (ListLongMap!7808 (toList!3919 List!8950)) )
))
(declare-fun lm!215 () ListLongMap!7807)

(declare-fun forall!185 (List!8950 Int) Bool)

(assert (=> start!42718 (= res!284428 (forall!185 (toList!3919 lm!215) p!166))))

(assert (=> start!42718 e!279841))

(declare-fun e!279840 () Bool)

(declare-fun inv!15463 (ListLongMap!7807) Bool)

(assert (=> start!42718 (and (inv!15463 lm!215) e!279840)))

(assert (=> start!42718 tp!42291))

(assert (=> start!42718 true))

(declare-fun tp_is_empty!13501 () Bool)

(assert (=> start!42718 tp_is_empty!13501))

(declare-fun b!476444 () Bool)

(declare-fun tp!42292 () Bool)

(assert (=> b!476444 (= e!279840 tp!42292)))

(declare-fun b!476443 () Bool)

(assert (=> b!476443 (= e!279841 false)))

(declare-fun lt!217305 () Bool)

(declare-fun tail!110 (ListLongMap!7807) ListLongMap!7807)

(assert (=> b!476443 (= lt!217305 (forall!185 (toList!3919 (tail!110 lm!215)) p!166))))

(declare-fun b!476442 () Bool)

(declare-fun res!284429 () Bool)

(assert (=> b!476442 (=> (not res!284429) (not e!279841))))

(declare-fun isEmpty!592 (ListLongMap!7807) Bool)

(assert (=> b!476442 (= res!284429 (not (isEmpty!592 lm!215)))))

(assert (= (and start!42718 res!284428) b!476441))

(assert (= (and b!476441 res!284430) b!476442))

(assert (= (and b!476442 res!284429) b!476443))

(assert (= start!42718 b!476444))

(declare-fun b_lambda!10379 () Bool)

(assert (=> (not b_lambda!10379) (not b!476441)))

(declare-fun t!14927 () Bool)

(declare-fun tb!3935 () Bool)

(assert (=> (and start!42718 (= p!166 p!166) t!14927) tb!3935))

(declare-fun result!7479 () Bool)

(assert (=> tb!3935 (= result!7479 true)))

(assert (=> b!476441 t!14927))

(declare-fun b_and!20627 () Bool)

(assert (= b_and!20625 (and (=> t!14927 result!7479) b_and!20627)))

(declare-fun m!458985 () Bool)

(assert (=> b!476441 m!458985))

(declare-fun m!458987 () Bool)

(assert (=> start!42718 m!458987))

(declare-fun m!458989 () Bool)

(assert (=> start!42718 m!458989))

(declare-fun m!458991 () Bool)

(assert (=> b!476443 m!458991))

(declare-fun m!458993 () Bool)

(assert (=> b!476443 m!458993))

(declare-fun m!458995 () Bool)

(assert (=> b!476442 m!458995))

(check-sat (not b!476443) (not b_lambda!10379) b_and!20627 (not b!476444) (not b_next!12079) tp_is_empty!13501 (not start!42718) (not b!476442))
(check-sat b_and!20627 (not b_next!12079))
