; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138442 () Bool)

(assert start!138442)

(declare-fun res!1083365 () Bool)

(declare-fun e!885908 () Bool)

(assert (=> start!138442 (=> (not res!1083365) (not e!885908))))

(declare-datatypes ((B!3052 0))(
  ( (B!3053 (val!19888 Int)) )
))
(declare-datatypes ((tuple2!25944 0))(
  ( (tuple2!25945 (_1!12983 (_ BitVec 64)) (_2!12983 B!3052)) )
))
(declare-datatypes ((List!37008 0))(
  ( (Nil!37005) (Cons!37004 (h!38547 tuple2!25944) (t!51938 List!37008)) )
))
(declare-fun l!628 () List!37008)

(get-info :version)

(assert (=> start!138442 (= res!1083365 (and (not ((_ is Nil!37005) l!628)) (not ((_ is Nil!37005) (t!51938 l!628))) (bvslt (_1!12983 (h!38547 l!628)) (_1!12983 (h!38547 (t!51938 l!628))))))))

(assert (=> start!138442 e!885908))

(declare-fun e!885909 () Bool)

(assert (=> start!138442 e!885909))

(declare-fun b!1586410 () Bool)

(declare-fun ListPrimitiveSize!239 (List!37008) Int)

(assert (=> b!1586410 (= e!885908 (>= (ListPrimitiveSize!239 (t!51938 l!628)) (ListPrimitiveSize!239 l!628)))))

(declare-fun b!1586411 () Bool)

(declare-fun tp_is_empty!39585 () Bool)

(declare-fun tp!115446 () Bool)

(assert (=> b!1586411 (= e!885909 (and tp_is_empty!39585 tp!115446))))

(assert (= (and start!138442 res!1083365) b!1586410))

(assert (= (and start!138442 ((_ is Cons!37004) l!628)) b!1586411))

(declare-fun m!1454755 () Bool)

(assert (=> b!1586410 m!1454755))

(declare-fun m!1454757 () Bool)

(assert (=> b!1586410 m!1454757))

(check-sat (not b!1586410) (not b!1586411) tp_is_empty!39585)
(check-sat)
(get-model)

(declare-fun d!167927 () Bool)

(declare-fun lt!677529 () Int)

(assert (=> d!167927 (>= lt!677529 0)))

(declare-fun e!885918 () Int)

(assert (=> d!167927 (= lt!677529 e!885918)))

(declare-fun c!147066 () Bool)

(assert (=> d!167927 (= c!147066 ((_ is Nil!37005) (t!51938 l!628)))))

(assert (=> d!167927 (= (ListPrimitiveSize!239 (t!51938 l!628)) lt!677529)))

(declare-fun b!1586422 () Bool)

(assert (=> b!1586422 (= e!885918 0)))

(declare-fun b!1586423 () Bool)

(assert (=> b!1586423 (= e!885918 (+ 1 (ListPrimitiveSize!239 (t!51938 (t!51938 l!628)))))))

(assert (= (and d!167927 c!147066) b!1586422))

(assert (= (and d!167927 (not c!147066)) b!1586423))

(declare-fun m!1454763 () Bool)

(assert (=> b!1586423 m!1454763))

(assert (=> b!1586410 d!167927))

(declare-fun d!167929 () Bool)

(declare-fun lt!677530 () Int)

(assert (=> d!167929 (>= lt!677530 0)))

(declare-fun e!885919 () Int)

(assert (=> d!167929 (= lt!677530 e!885919)))

(declare-fun c!147067 () Bool)

(assert (=> d!167929 (= c!147067 ((_ is Nil!37005) l!628))))

(assert (=> d!167929 (= (ListPrimitiveSize!239 l!628) lt!677530)))

(declare-fun b!1586424 () Bool)

(assert (=> b!1586424 (= e!885919 0)))

(declare-fun b!1586425 () Bool)

(assert (=> b!1586425 (= e!885919 (+ 1 (ListPrimitiveSize!239 (t!51938 l!628))))))

(assert (= (and d!167929 c!147067) b!1586424))

(assert (= (and d!167929 (not c!147067)) b!1586425))

(assert (=> b!1586425 m!1454755))

(assert (=> b!1586410 d!167929))

(declare-fun b!1586430 () Bool)

(declare-fun e!885922 () Bool)

(declare-fun tp!115452 () Bool)

(assert (=> b!1586430 (= e!885922 (and tp_is_empty!39585 tp!115452))))

(assert (=> b!1586411 (= tp!115446 e!885922)))

(assert (= (and b!1586411 ((_ is Cons!37004) (t!51938 l!628))) b!1586430))

(check-sat (not b!1586423) (not b!1586425) (not b!1586430) tp_is_empty!39585)
(check-sat)
