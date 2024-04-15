; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103486 () Bool)

(assert start!103486)

(declare-fun res!827679 () Bool)

(declare-fun e!703043 () Bool)

(assert (=> start!103486 (=> (not res!827679) (not e!703043))))

(declare-fun a1!66 () (_ BitVec 64))

(declare-fun a2!55 () (_ BitVec 64))

(assert (=> start!103486 (= res!827679 (not (= a1!66 a2!55)))))

(assert (=> start!103486 e!703043))

(assert (=> start!103486 true))

(declare-datatypes ((B!1790 0))(
  ( (B!1791 (val!15657 Int)) )
))
(declare-datatypes ((tuple2!20270 0))(
  ( (tuple2!20271 (_1!10146 (_ BitVec 64)) (_2!10146 B!1790)) )
))
(declare-datatypes ((List!27384 0))(
  ( (Nil!27381) (Cons!27380 (h!28589 tuple2!20270) (t!40838 List!27384)) )
))
(declare-datatypes ((ListLongMap!18239 0))(
  ( (ListLongMap!18240 (toList!9135 List!27384)) )
))
(declare-fun lm!211 () ListLongMap!18239)

(declare-fun e!703044 () Bool)

(declare-fun inv!42765 (ListLongMap!18239) Bool)

(assert (=> start!103486 (and (inv!42765 lm!211) e!703044)))

(declare-fun b!1240371 () Bool)

(declare-fun isStrictlySorted!726 (List!27384) Bool)

(assert (=> b!1240371 (= e!703043 (not (isStrictlySorted!726 (toList!9135 lm!211))))))

(declare-fun b!1240372 () Bool)

(declare-fun tp!92519 () Bool)

(assert (=> b!1240372 (= e!703044 tp!92519)))

(assert (= (and start!103486 res!827679) b!1240371))

(assert (= start!103486 b!1240372))

(declare-fun m!1143213 () Bool)

(assert (=> start!103486 m!1143213))

(declare-fun m!1143215 () Bool)

(assert (=> b!1240371 m!1143215))

(check-sat (not b!1240371) (not start!103486) (not b!1240372))
(check-sat)
(get-model)

(declare-fun d!136151 () Bool)

(declare-fun res!827694 () Bool)

(declare-fun e!703065 () Bool)

(assert (=> d!136151 (=> res!827694 e!703065)))

(get-info :version)

(assert (=> d!136151 (= res!827694 (or ((_ is Nil!27381) (toList!9135 lm!211)) ((_ is Nil!27381) (t!40838 (toList!9135 lm!211)))))))

(assert (=> d!136151 (= (isStrictlySorted!726 (toList!9135 lm!211)) e!703065)))

(declare-fun b!1240393 () Bool)

(declare-fun e!703066 () Bool)

(assert (=> b!1240393 (= e!703065 e!703066)))

(declare-fun res!827695 () Bool)

(assert (=> b!1240393 (=> (not res!827695) (not e!703066))))

(assert (=> b!1240393 (= res!827695 (bvslt (_1!10146 (h!28589 (toList!9135 lm!211))) (_1!10146 (h!28589 (t!40838 (toList!9135 lm!211))))))))

(declare-fun b!1240394 () Bool)

(assert (=> b!1240394 (= e!703066 (isStrictlySorted!726 (t!40838 (toList!9135 lm!211))))))

(assert (= (and d!136151 (not res!827694)) b!1240393))

(assert (= (and b!1240393 res!827695) b!1240394))

(declare-fun m!1143225 () Bool)

(assert (=> b!1240394 m!1143225))

(assert (=> b!1240371 d!136151))

(declare-fun d!136161 () Bool)

(assert (=> d!136161 (= (inv!42765 lm!211) (isStrictlySorted!726 (toList!9135 lm!211)))))

(declare-fun bs!34881 () Bool)

(assert (= bs!34881 d!136161))

(assert (=> bs!34881 m!1143215))

(assert (=> start!103486 d!136161))

(declare-fun b!1240413 () Bool)

(declare-fun e!703080 () Bool)

(declare-fun tp_is_empty!31191 () Bool)

(declare-fun tp!92531 () Bool)

(assert (=> b!1240413 (= e!703080 (and tp_is_empty!31191 tp!92531))))

(assert (=> b!1240372 (= tp!92519 e!703080)))

(assert (= (and b!1240372 ((_ is Cons!27380) (toList!9135 lm!211))) b!1240413))

(check-sat (not d!136161) (not b!1240394) (not b!1240413) tp_is_empty!31191)
(check-sat)
