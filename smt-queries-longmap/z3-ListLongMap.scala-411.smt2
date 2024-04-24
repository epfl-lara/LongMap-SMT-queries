; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7696 () Bool)

(assert start!7696)

(declare-fun b!48941 () Bool)

(declare-fun res!28385 () Bool)

(declare-fun e!31430 () Bool)

(assert (=> b!48941 (=> (not res!28385) (not e!31430))))

(declare-datatypes ((B!980 0))(
  ( (B!981 (val!1110 Int)) )
))
(declare-datatypes ((tuple2!1784 0))(
  ( (tuple2!1785 (_1!903 (_ BitVec 64)) (_2!903 B!980)) )
))
(declare-datatypes ((List!1293 0))(
  ( (Nil!1290) (Cons!1289 (h!1869 tuple2!1784) (t!4324 List!1293)) )
))
(declare-fun l!1333 () List!1293)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!120 (List!1293 (_ BitVec 64)) Bool)

(assert (=> b!48941 (= res!28385 (not (containsKey!120 l!1333 newKey!147)))))

(declare-fun b!48942 () Bool)

(declare-fun res!28386 () Bool)

(assert (=> b!48942 (=> (not res!28386) (not e!31430))))

(get-info :version)

(assert (=> b!48942 (= res!28386 (not ((_ is Nil!1290) l!1333)))))

(declare-fun b!48944 () Bool)

(declare-fun e!31431 () Bool)

(declare-fun tp_is_empty!2131 () Bool)

(declare-fun tp!6476 () Bool)

(assert (=> b!48944 (= e!31431 (and tp_is_empty!2131 tp!6476))))

(declare-fun res!28387 () Bool)

(assert (=> start!7696 (=> (not res!28387) (not e!31430))))

(declare-fun isStrictlySorted!259 (List!1293) Bool)

(assert (=> start!7696 (= res!28387 (isStrictlySorted!259 l!1333))))

(assert (=> start!7696 e!31430))

(assert (=> start!7696 e!31431))

(assert (=> start!7696 true))

(declare-fun b!48943 () Bool)

(declare-fun ListPrimitiveSize!52 (List!1293) Int)

(assert (=> b!48943 (= e!31430 (>= (ListPrimitiveSize!52 (t!4324 l!1333)) (ListPrimitiveSize!52 l!1333)))))

(assert (= (and start!7696 res!28387) b!48941))

(assert (= (and b!48941 res!28385) b!48942))

(assert (= (and b!48942 res!28386) b!48943))

(assert (= (and start!7696 ((_ is Cons!1289) l!1333)) b!48944))

(declare-fun m!42443 () Bool)

(assert (=> b!48941 m!42443))

(declare-fun m!42445 () Bool)

(assert (=> start!7696 m!42445))

(declare-fun m!42447 () Bool)

(assert (=> b!48943 m!42447))

(declare-fun m!42449 () Bool)

(assert (=> b!48943 m!42449))

(check-sat (not b!48944) (not b!48943) tp_is_empty!2131 (not b!48941) (not start!7696))
(check-sat)
(get-model)

(declare-fun d!9749 () Bool)

(declare-fun res!28414 () Bool)

(declare-fun e!31455 () Bool)

(assert (=> d!9749 (=> res!28414 e!31455)))

(assert (=> d!9749 (= res!28414 (and ((_ is Cons!1289) l!1333) (= (_1!903 (h!1869 l!1333)) newKey!147)))))

(assert (=> d!9749 (= (containsKey!120 l!1333 newKey!147) e!31455)))

(declare-fun b!48983 () Bool)

(declare-fun e!31456 () Bool)

(assert (=> b!48983 (= e!31455 e!31456)))

(declare-fun res!28415 () Bool)

(assert (=> b!48983 (=> (not res!28415) (not e!31456))))

(assert (=> b!48983 (= res!28415 (and (or (not ((_ is Cons!1289) l!1333)) (bvsle (_1!903 (h!1869 l!1333)) newKey!147)) ((_ is Cons!1289) l!1333) (bvslt (_1!903 (h!1869 l!1333)) newKey!147)))))

(declare-fun b!48984 () Bool)

(assert (=> b!48984 (= e!31456 (containsKey!120 (t!4324 l!1333) newKey!147))))

(assert (= (and d!9749 (not res!28414)) b!48983))

(assert (= (and b!48983 res!28415) b!48984))

(declare-fun m!42469 () Bool)

(assert (=> b!48984 m!42469))

(assert (=> b!48941 d!9749))

(declare-fun d!9759 () Bool)

(declare-fun lt!20666 () Int)

(assert (=> d!9759 (>= lt!20666 0)))

(declare-fun e!31470 () Int)

(assert (=> d!9759 (= lt!20666 e!31470)))

(declare-fun c!6585 () Bool)

(assert (=> d!9759 (= c!6585 ((_ is Nil!1290) (t!4324 l!1333)))))

(assert (=> d!9759 (= (ListPrimitiveSize!52 (t!4324 l!1333)) lt!20666)))

(declare-fun b!49001 () Bool)

(assert (=> b!49001 (= e!31470 0)))

(declare-fun b!49002 () Bool)

(assert (=> b!49002 (= e!31470 (+ 1 (ListPrimitiveSize!52 (t!4324 (t!4324 l!1333)))))))

(assert (= (and d!9759 c!6585) b!49001))

(assert (= (and d!9759 (not c!6585)) b!49002))

(declare-fun m!42473 () Bool)

(assert (=> b!49002 m!42473))

(assert (=> b!48943 d!9759))

(declare-fun d!9763 () Bool)

(declare-fun lt!20667 () Int)

(assert (=> d!9763 (>= lt!20667 0)))

(declare-fun e!31475 () Int)

(assert (=> d!9763 (= lt!20667 e!31475)))

(declare-fun c!6586 () Bool)

(assert (=> d!9763 (= c!6586 ((_ is Nil!1290) l!1333))))

(assert (=> d!9763 (= (ListPrimitiveSize!52 l!1333) lt!20667)))

(declare-fun b!49007 () Bool)

(assert (=> b!49007 (= e!31475 0)))

(declare-fun b!49008 () Bool)

(assert (=> b!49008 (= e!31475 (+ 1 (ListPrimitiveSize!52 (t!4324 l!1333))))))

(assert (= (and d!9763 c!6586) b!49007))

(assert (= (and d!9763 (not c!6586)) b!49008))

(assert (=> b!49008 m!42447))

(assert (=> b!48943 d!9763))

(declare-fun d!9769 () Bool)

(declare-fun res!28438 () Bool)

(declare-fun e!31488 () Bool)

(assert (=> d!9769 (=> res!28438 e!31488)))

(assert (=> d!9769 (= res!28438 (or ((_ is Nil!1290) l!1333) ((_ is Nil!1290) (t!4324 l!1333))))))

(assert (=> d!9769 (= (isStrictlySorted!259 l!1333) e!31488)))

(declare-fun b!49025 () Bool)

(declare-fun e!31489 () Bool)

(assert (=> b!49025 (= e!31488 e!31489)))

(declare-fun res!28439 () Bool)

(assert (=> b!49025 (=> (not res!28439) (not e!31489))))

(assert (=> b!49025 (= res!28439 (bvslt (_1!903 (h!1869 l!1333)) (_1!903 (h!1869 (t!4324 l!1333)))))))

(declare-fun b!49026 () Bool)

(assert (=> b!49026 (= e!31489 (isStrictlySorted!259 (t!4324 l!1333)))))

(assert (= (and d!9769 (not res!28438)) b!49025))

(assert (= (and b!49025 res!28439) b!49026))

(declare-fun m!42481 () Bool)

(assert (=> b!49026 m!42481))

(assert (=> start!7696 d!9769))

(declare-fun b!49042 () Bool)

(declare-fun e!31499 () Bool)

(declare-fun tp!6490 () Bool)

(assert (=> b!49042 (= e!31499 (and tp_is_empty!2131 tp!6490))))

(assert (=> b!48944 (= tp!6476 e!31499)))

(assert (= (and b!48944 ((_ is Cons!1289) (t!4324 l!1333))) b!49042))

(check-sat (not b!48984) (not b!49026) tp_is_empty!2131 (not b!49008) (not b!49002) (not b!49042))
(check-sat)
