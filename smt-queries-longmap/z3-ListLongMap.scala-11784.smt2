; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138430 () Bool)

(assert start!138430)

(declare-datatypes ((B!3046 0))(
  ( (B!3047 (val!19885 Int)) )
))
(declare-datatypes ((tuple2!25938 0))(
  ( (tuple2!25939 (_1!12980 (_ BitVec 64)) (_2!12980 B!3046)) )
))
(declare-datatypes ((List!37005 0))(
  ( (Nil!37002) (Cons!37001 (h!38544 tuple2!25938) (t!51935 List!37005)) )
))
(declare-fun l!628 () List!37005)

(declare-fun ListPrimitiveSize!236 (List!37005) Int)

(assert (=> start!138430 (< (ListPrimitiveSize!236 l!628) 0)))

(declare-fun e!885876 () Bool)

(assert (=> start!138430 e!885876))

(declare-fun b!1586363 () Bool)

(declare-fun tp_is_empty!39579 () Bool)

(declare-fun tp!115428 () Bool)

(assert (=> b!1586363 (= e!885876 (and tp_is_empty!39579 tp!115428))))

(get-info :version)

(assert (= (and start!138430 ((_ is Cons!37001) l!628)) b!1586363))

(declare-fun m!1454741 () Bool)

(assert (=> start!138430 m!1454741))

(check-sat (not start!138430) (not b!1586363) tp_is_empty!39579)
(check-sat)
(get-model)

(declare-fun d!167919 () Bool)

(declare-fun lt!677526 () Int)

(assert (=> d!167919 (>= lt!677526 0)))

(declare-fun e!885892 () Int)

(assert (=> d!167919 (= lt!677526 e!885892)))

(declare-fun c!147063 () Bool)

(assert (=> d!167919 (= c!147063 ((_ is Nil!37002) l!628))))

(assert (=> d!167919 (= (ListPrimitiveSize!236 l!628) lt!677526)))

(declare-fun b!1586391 () Bool)

(assert (=> b!1586391 (= e!885892 0)))

(declare-fun b!1586392 () Bool)

(assert (=> b!1586392 (= e!885892 (+ 1 (ListPrimitiveSize!236 (t!51935 l!628))))))

(assert (= (and d!167919 c!147063) b!1586391))

(assert (= (and d!167919 (not c!147063)) b!1586392))

(declare-fun m!1454749 () Bool)

(assert (=> b!1586392 m!1454749))

(assert (=> start!138430 d!167919))

(declare-fun b!1586399 () Bool)

(declare-fun e!885897 () Bool)

(declare-fun tp!115440 () Bool)

(assert (=> b!1586399 (= e!885897 (and tp_is_empty!39579 tp!115440))))

(assert (=> b!1586363 (= tp!115428 e!885897)))

(assert (= (and b!1586363 ((_ is Cons!37001) (t!51935 l!628))) b!1586399))

(check-sat (not b!1586392) (not b!1586399) tp_is_empty!39579)
(check-sat)
