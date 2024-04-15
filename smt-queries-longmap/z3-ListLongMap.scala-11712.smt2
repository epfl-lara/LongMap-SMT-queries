; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137026 () Bool)

(assert start!137026)

(declare-fun b!1579591 () Bool)

(declare-fun res!1079122 () Bool)

(declare-fun e!881159 () Bool)

(assert (=> b!1579591 (=> (not res!1079122) (not e!881159))))

(declare-datatypes ((B!2612 0))(
  ( (B!2613 (val!19668 Int)) )
))
(declare-datatypes ((tuple2!25506 0))(
  ( (tuple2!25507 (_1!12764 (_ BitVec 64)) (_2!12764 B!2612)) )
))
(declare-datatypes ((List!36829 0))(
  ( (Nil!36826) (Cons!36825 (h!38369 tuple2!25506) (t!51735 List!36829)) )
))
(declare-fun l!1390 () List!36829)

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!890 (List!36829 (_ BitVec 64)) Bool)

(assert (=> b!1579591 (= res!1079122 (containsKey!890 l!1390 key!405))))

(declare-fun b!1579592 () Bool)

(declare-fun res!1079123 () Bool)

(assert (=> b!1579592 (=> (not res!1079123) (not e!881159))))

(declare-fun value!194 () B!2612)

(declare-fun contains!10415 (List!36829 tuple2!25506) Bool)

(assert (=> b!1579592 (= res!1079123 (contains!10415 l!1390 (tuple2!25507 key!405 value!194)))))

(declare-fun res!1079124 () Bool)

(assert (=> start!137026 (=> (not res!1079124) (not e!881159))))

(declare-fun isStrictlySorted!1044 (List!36829) Bool)

(assert (=> start!137026 (= res!1079124 (isStrictlySorted!1044 l!1390))))

(assert (=> start!137026 e!881159))

(declare-fun e!881157 () Bool)

(assert (=> start!137026 e!881157))

(assert (=> start!137026 true))

(declare-fun tp_is_empty!39157 () Bool)

(assert (=> start!137026 tp_is_empty!39157))

(declare-fun b!1579593 () Bool)

(declare-fun e!881158 () Bool)

(declare-datatypes ((tuple2!25508 0))(
  ( (tuple2!25509 (_1!12765 tuple2!25506) (_2!12765 List!36829)) )
))
(declare-datatypes ((Option!889 0))(
  ( (Some!888 (v!22377 tuple2!25508)) (None!887) )
))
(declare-fun lt!676359 () Option!889)

(declare-fun isDefined!599 (Option!889) Bool)

(assert (=> b!1579593 (= e!881158 (not (isDefined!599 lt!676359)))))

(declare-fun b!1579594 () Bool)

(declare-fun tp!114388 () Bool)

(assert (=> b!1579594 (= e!881157 (and tp_is_empty!39157 tp!114388))))

(declare-fun b!1579595 () Bool)

(assert (=> b!1579595 (= e!881159 e!881158)))

(declare-fun res!1079121 () Bool)

(assert (=> b!1579595 (=> (not res!1079121) (not e!881158))))

(declare-fun isEmpty!1158 (Option!889) Bool)

(assert (=> b!1579595 (= res!1079121 (not (isEmpty!1158 lt!676359)))))

(declare-fun unapply!70 (List!36829) Option!889)

(assert (=> b!1579595 (= lt!676359 (unapply!70 l!1390))))

(assert (= (and start!137026 res!1079124) b!1579591))

(assert (= (and b!1579591 res!1079122) b!1579592))

(assert (= (and b!1579592 res!1079123) b!1579595))

(assert (= (and b!1579595 res!1079121) b!1579593))

(get-info :version)

(assert (= (and start!137026 ((_ is Cons!36825) l!1390)) b!1579594))

(declare-fun m!1450635 () Bool)

(assert (=> b!1579593 m!1450635))

(declare-fun m!1450637 () Bool)

(assert (=> b!1579595 m!1450637))

(declare-fun m!1450639 () Bool)

(assert (=> b!1579595 m!1450639))

(declare-fun m!1450641 () Bool)

(assert (=> b!1579592 m!1450641))

(declare-fun m!1450643 () Bool)

(assert (=> b!1579591 m!1450643))

(declare-fun m!1450645 () Bool)

(assert (=> start!137026 m!1450645))

(check-sat (not b!1579593) tp_is_empty!39157 (not b!1579595) (not b!1579591) (not b!1579594) (not b!1579592) (not start!137026))
(check-sat)
(get-model)

(declare-fun d!166119 () Bool)

(declare-fun res!1079157 () Bool)

(declare-fun e!881186 () Bool)

(assert (=> d!166119 (=> res!1079157 e!881186)))

(assert (=> d!166119 (= res!1079157 (and ((_ is Cons!36825) l!1390) (= (_1!12764 (h!38369 l!1390)) key!405)))))

(assert (=> d!166119 (= (containsKey!890 l!1390 key!405) e!881186)))

(declare-fun b!1579634 () Bool)

(declare-fun e!881187 () Bool)

(assert (=> b!1579634 (= e!881186 e!881187)))

(declare-fun res!1079158 () Bool)

(assert (=> b!1579634 (=> (not res!1079158) (not e!881187))))

(assert (=> b!1579634 (= res!1079158 (and (or (not ((_ is Cons!36825) l!1390)) (bvsle (_1!12764 (h!38369 l!1390)) key!405)) ((_ is Cons!36825) l!1390) (bvslt (_1!12764 (h!38369 l!1390)) key!405)))))

(declare-fun b!1579635 () Bool)

(assert (=> b!1579635 (= e!881187 (containsKey!890 (t!51735 l!1390) key!405))))

(assert (= (and d!166119 (not res!1079157)) b!1579634))

(assert (= (and b!1579634 res!1079158) b!1579635))

(declare-fun m!1450671 () Bool)

(assert (=> b!1579635 m!1450671))

(assert (=> b!1579591 d!166119))

(declare-fun d!166129 () Bool)

(assert (=> d!166129 (= (isEmpty!1158 lt!676359) (not ((_ is Some!888) lt!676359)))))

(assert (=> b!1579595 d!166129))

(declare-fun d!166133 () Bool)

(assert (=> d!166133 (= (unapply!70 l!1390) (ite ((_ is Nil!36826) l!1390) None!887 (Some!888 (tuple2!25509 (h!38369 l!1390) (t!51735 l!1390)))))))

(assert (=> b!1579595 d!166133))

(declare-fun d!166135 () Bool)

(assert (=> d!166135 (= (isDefined!599 lt!676359) (not (isEmpty!1158 lt!676359)))))

(declare-fun bs!45720 () Bool)

(assert (= bs!45720 d!166135))

(assert (=> bs!45720 m!1450637))

(assert (=> b!1579593 d!166135))

(declare-fun d!166137 () Bool)

(declare-fun res!1079181 () Bool)

(declare-fun e!881210 () Bool)

(assert (=> d!166137 (=> res!1079181 e!881210)))

(assert (=> d!166137 (= res!1079181 (or ((_ is Nil!36826) l!1390) ((_ is Nil!36826) (t!51735 l!1390))))))

(assert (=> d!166137 (= (isStrictlySorted!1044 l!1390) e!881210)))

(declare-fun b!1579658 () Bool)

(declare-fun e!881211 () Bool)

(assert (=> b!1579658 (= e!881210 e!881211)))

(declare-fun res!1079182 () Bool)

(assert (=> b!1579658 (=> (not res!1079182) (not e!881211))))

(assert (=> b!1579658 (= res!1079182 (bvslt (_1!12764 (h!38369 l!1390)) (_1!12764 (h!38369 (t!51735 l!1390)))))))

(declare-fun b!1579659 () Bool)

(assert (=> b!1579659 (= e!881211 (isStrictlySorted!1044 (t!51735 l!1390)))))

(assert (= (and d!166137 (not res!1079181)) b!1579658))

(assert (= (and b!1579658 res!1079182) b!1579659))

(declare-fun m!1450683 () Bool)

(assert (=> b!1579659 m!1450683))

(assert (=> start!137026 d!166137))

(declare-fun lt!676374 () Bool)

(declare-fun d!166145 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!820 (List!36829) (InoxSet tuple2!25506))

(assert (=> d!166145 (= lt!676374 (select (content!820 l!1390) (tuple2!25507 key!405 value!194)))))

(declare-fun e!881227 () Bool)

(assert (=> d!166145 (= lt!676374 e!881227)))

(declare-fun res!1079197 () Bool)

(assert (=> d!166145 (=> (not res!1079197) (not e!881227))))

(assert (=> d!166145 (= res!1079197 ((_ is Cons!36825) l!1390))))

(assert (=> d!166145 (= (contains!10415 l!1390 (tuple2!25507 key!405 value!194)) lt!676374)))

(declare-fun b!1579674 () Bool)

(declare-fun e!881226 () Bool)

(assert (=> b!1579674 (= e!881227 e!881226)))

(declare-fun res!1079198 () Bool)

(assert (=> b!1579674 (=> res!1079198 e!881226)))

(assert (=> b!1579674 (= res!1079198 (= (h!38369 l!1390) (tuple2!25507 key!405 value!194)))))

(declare-fun b!1579675 () Bool)

(assert (=> b!1579675 (= e!881226 (contains!10415 (t!51735 l!1390) (tuple2!25507 key!405 value!194)))))

(assert (= (and d!166145 res!1079197) b!1579674))

(assert (= (and b!1579674 (not res!1079198)) b!1579675))

(declare-fun m!1450691 () Bool)

(assert (=> d!166145 m!1450691))

(declare-fun m!1450693 () Bool)

(assert (=> d!166145 m!1450693))

(declare-fun m!1450695 () Bool)

(assert (=> b!1579675 m!1450695))

(assert (=> b!1579592 d!166145))

(declare-fun b!1579689 () Bool)

(declare-fun e!881237 () Bool)

(declare-fun tp!114400 () Bool)

(assert (=> b!1579689 (= e!881237 (and tp_is_empty!39157 tp!114400))))

(assert (=> b!1579594 (= tp!114388 e!881237)))

(assert (= (and b!1579594 ((_ is Cons!36825) (t!51735 l!1390))) b!1579689))

(check-sat (not b!1579689) tp_is_empty!39157 (not d!166145) (not b!1579635) (not b!1579675) (not d!166135) (not b!1579659))
(check-sat)
