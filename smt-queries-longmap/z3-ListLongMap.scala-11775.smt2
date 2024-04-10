; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138274 () Bool)

(assert start!138274)

(declare-fun b!1585714 () Bool)

(declare-fun res!1082934 () Bool)

(declare-fun e!885365 () Bool)

(assert (=> b!1585714 (=> res!1082934 e!885365)))

(declare-datatypes ((B!2992 0))(
  ( (B!2993 (val!19858 Int)) )
))
(declare-datatypes ((tuple2!25884 0))(
  ( (tuple2!25885 (_1!12953 (_ BitVec 64)) (_2!12953 B!2992)) )
))
(declare-datatypes ((List!36978 0))(
  ( (Nil!36975) (Cons!36974 (h!38517 tuple2!25884) (t!51899 List!36978)) )
))
(declare-fun lt!677417 () List!36978)

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun containsKey!1013 (List!36978 (_ BitVec 64)) Bool)

(assert (=> b!1585714 (= res!1082934 (not (containsKey!1013 lt!677417 newKey!21)))))

(declare-fun b!1585716 () Bool)

(declare-fun res!1082935 () Bool)

(declare-fun e!885364 () Bool)

(assert (=> b!1585716 (=> (not res!1082935) (not e!885364))))

(declare-fun l!556 () List!36978)

(get-info :version)

(assert (=> b!1585716 (= res!1082935 (and (bvsge (_1!12953 (h!38517 l!556)) newKey!21) ((_ is Cons!36974) l!556) (= (_1!12953 (h!38517 l!556)) newKey!21)))))

(declare-fun b!1585717 () Bool)

(assert (=> b!1585717 (= e!885364 e!885365)))

(declare-fun res!1082936 () Bool)

(assert (=> b!1585717 (=> res!1082936 e!885365)))

(declare-fun isStrictlySorted!1200 (List!36978) Bool)

(assert (=> b!1585717 (= res!1082936 (not (isStrictlySorted!1200 lt!677417)))))

(declare-fun lt!677418 () tuple2!25884)

(declare-fun $colon$colon!1044 (List!36978 tuple2!25884) List!36978)

(assert (=> b!1585717 (= lt!677417 ($colon$colon!1044 (t!51899 l!556) lt!677418))))

(declare-fun newValue!21 () B!2992)

(assert (=> b!1585717 (= lt!677418 (tuple2!25885 newKey!21 newValue!21))))

(declare-fun b!1585718 () Bool)

(declare-fun e!885366 () Bool)

(declare-fun tp_is_empty!39525 () Bool)

(declare-fun tp!115284 () Bool)

(assert (=> b!1585718 (= e!885366 (and tp_is_empty!39525 tp!115284))))

(declare-fun b!1585715 () Bool)

(declare-fun contains!10536 (List!36978 tuple2!25884) Bool)

(assert (=> b!1585715 (= e!885365 (not (contains!10536 lt!677417 lt!677418)))))

(declare-fun res!1082933 () Bool)

(assert (=> start!138274 (=> (not res!1082933) (not e!885364))))

(assert (=> start!138274 (= res!1082933 (isStrictlySorted!1200 l!556))))

(assert (=> start!138274 e!885364))

(assert (=> start!138274 e!885366))

(assert (=> start!138274 true))

(assert (=> start!138274 tp_is_empty!39525))

(assert (= (and start!138274 res!1082933) b!1585716))

(assert (= (and b!1585716 res!1082935) b!1585717))

(assert (= (and b!1585717 (not res!1082936)) b!1585714))

(assert (= (and b!1585714 (not res!1082934)) b!1585715))

(assert (= (and start!138274 ((_ is Cons!36974) l!556)) b!1585718))

(declare-fun m!1454443 () Bool)

(assert (=> b!1585714 m!1454443))

(declare-fun m!1454445 () Bool)

(assert (=> b!1585717 m!1454445))

(declare-fun m!1454447 () Bool)

(assert (=> b!1585717 m!1454447))

(declare-fun m!1454449 () Bool)

(assert (=> b!1585715 m!1454449))

(declare-fun m!1454451 () Bool)

(assert (=> start!138274 m!1454451))

(check-sat (not b!1585714) (not b!1585718) tp_is_empty!39525 (not start!138274) (not b!1585715) (not b!1585717))
(check-sat)
(get-model)

(declare-fun d!167769 () Bool)

(declare-fun res!1082953 () Bool)

(declare-fun e!885380 () Bool)

(assert (=> d!167769 (=> res!1082953 e!885380)))

(assert (=> d!167769 (= res!1082953 (or ((_ is Nil!36975) lt!677417) ((_ is Nil!36975) (t!51899 lt!677417))))))

(assert (=> d!167769 (= (isStrictlySorted!1200 lt!677417) e!885380)))

(declare-fun b!1585738 () Bool)

(declare-fun e!885381 () Bool)

(assert (=> b!1585738 (= e!885380 e!885381)))

(declare-fun res!1082954 () Bool)

(assert (=> b!1585738 (=> (not res!1082954) (not e!885381))))

(assert (=> b!1585738 (= res!1082954 (bvslt (_1!12953 (h!38517 lt!677417)) (_1!12953 (h!38517 (t!51899 lt!677417)))))))

(declare-fun b!1585739 () Bool)

(assert (=> b!1585739 (= e!885381 (isStrictlySorted!1200 (t!51899 lt!677417)))))

(assert (= (and d!167769 (not res!1082953)) b!1585738))

(assert (= (and b!1585738 res!1082954) b!1585739))

(declare-fun m!1454463 () Bool)

(assert (=> b!1585739 m!1454463))

(assert (=> b!1585717 d!167769))

(declare-fun d!167771 () Bool)

(assert (=> d!167771 (= ($colon$colon!1044 (t!51899 l!556) lt!677418) (Cons!36974 lt!677418 (t!51899 l!556)))))

(assert (=> b!1585717 d!167771))

(declare-fun d!167773 () Bool)

(declare-fun res!1082955 () Bool)

(declare-fun e!885382 () Bool)

(assert (=> d!167773 (=> res!1082955 e!885382)))

(assert (=> d!167773 (= res!1082955 (or ((_ is Nil!36975) l!556) ((_ is Nil!36975) (t!51899 l!556))))))

(assert (=> d!167773 (= (isStrictlySorted!1200 l!556) e!885382)))

(declare-fun b!1585740 () Bool)

(declare-fun e!885383 () Bool)

(assert (=> b!1585740 (= e!885382 e!885383)))

(declare-fun res!1082956 () Bool)

(assert (=> b!1585740 (=> (not res!1082956) (not e!885383))))

(assert (=> b!1585740 (= res!1082956 (bvslt (_1!12953 (h!38517 l!556)) (_1!12953 (h!38517 (t!51899 l!556)))))))

(declare-fun b!1585741 () Bool)

(assert (=> b!1585741 (= e!885383 (isStrictlySorted!1200 (t!51899 l!556)))))

(assert (= (and d!167773 (not res!1082955)) b!1585740))

(assert (= (and b!1585740 res!1082956) b!1585741))

(declare-fun m!1454465 () Bool)

(assert (=> b!1585741 m!1454465))

(assert (=> start!138274 d!167773))

(declare-fun d!167777 () Bool)

(declare-fun res!1082967 () Bool)

(declare-fun e!885394 () Bool)

(assert (=> d!167777 (=> res!1082967 e!885394)))

(assert (=> d!167777 (= res!1082967 (and ((_ is Cons!36974) lt!677417) (= (_1!12953 (h!38517 lt!677417)) newKey!21)))))

(assert (=> d!167777 (= (containsKey!1013 lt!677417 newKey!21) e!885394)))

(declare-fun b!1585752 () Bool)

(declare-fun e!885395 () Bool)

(assert (=> b!1585752 (= e!885394 e!885395)))

(declare-fun res!1082968 () Bool)

(assert (=> b!1585752 (=> (not res!1082968) (not e!885395))))

(assert (=> b!1585752 (= res!1082968 (and (or (not ((_ is Cons!36974) lt!677417)) (bvsle (_1!12953 (h!38517 lt!677417)) newKey!21)) ((_ is Cons!36974) lt!677417) (bvslt (_1!12953 (h!38517 lt!677417)) newKey!21)))))

(declare-fun b!1585753 () Bool)

(assert (=> b!1585753 (= e!885395 (containsKey!1013 (t!51899 lt!677417) newKey!21))))

(assert (= (and d!167777 (not res!1082967)) b!1585752))

(assert (= (and b!1585752 res!1082968) b!1585753))

(declare-fun m!1454469 () Bool)

(assert (=> b!1585753 m!1454469))

(assert (=> b!1585714 d!167777))

(declare-fun d!167781 () Bool)

(declare-fun lt!677432 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!869 (List!36978) (InoxSet tuple2!25884))

(assert (=> d!167781 (= lt!677432 (select (content!869 lt!677417) lt!677418))))

(declare-fun e!885413 () Bool)

(assert (=> d!167781 (= lt!677432 e!885413)))

(declare-fun res!1082985 () Bool)

(assert (=> d!167781 (=> (not res!1082985) (not e!885413))))

(assert (=> d!167781 (= res!1082985 ((_ is Cons!36974) lt!677417))))

(assert (=> d!167781 (= (contains!10536 lt!677417 lt!677418) lt!677432)))

(declare-fun b!1585770 () Bool)

(declare-fun e!885412 () Bool)

(assert (=> b!1585770 (= e!885413 e!885412)))

(declare-fun res!1082986 () Bool)

(assert (=> b!1585770 (=> res!1082986 e!885412)))

(assert (=> b!1585770 (= res!1082986 (= (h!38517 lt!677417) lt!677418))))

(declare-fun b!1585771 () Bool)

(assert (=> b!1585771 (= e!885412 (contains!10536 (t!51899 lt!677417) lt!677418))))

(assert (= (and d!167781 res!1082985) b!1585770))

(assert (= (and b!1585770 (not res!1082986)) b!1585771))

(declare-fun m!1454479 () Bool)

(assert (=> d!167781 m!1454479))

(declare-fun m!1454481 () Bool)

(assert (=> d!167781 m!1454481))

(declare-fun m!1454483 () Bool)

(assert (=> b!1585771 m!1454483))

(assert (=> b!1585715 d!167781))

(declare-fun b!1585776 () Bool)

(declare-fun e!885416 () Bool)

(declare-fun tp!115290 () Bool)

(assert (=> b!1585776 (= e!885416 (and tp_is_empty!39525 tp!115290))))

(assert (=> b!1585718 (= tp!115284 e!885416)))

(assert (= (and b!1585718 ((_ is Cons!36974) (t!51899 l!556))) b!1585776))

(check-sat (not b!1585741) (not d!167781) (not b!1585739) (not b!1585771) (not b!1585753) (not b!1585776) tp_is_empty!39525)
(check-sat)
