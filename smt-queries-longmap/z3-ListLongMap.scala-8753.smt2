; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106212 () Bool)

(assert start!106212)

(declare-fun res!842073 () Bool)

(declare-fun e!720010 () Bool)

(assert (=> start!106212 (=> (not res!842073) (not e!720010))))

(declare-datatypes ((B!1910 0))(
  ( (B!1911 (val!16290 Int)) )
))
(declare-datatypes ((tuple2!21180 0))(
  ( (tuple2!21181 (_1!10601 (_ BitVec 64)) (_2!10601 B!1910)) )
))
(declare-datatypes ((List!28366 0))(
  ( (Nil!28363) (Cons!28362 (h!29571 tuple2!21180) (t!41878 List!28366)) )
))
(declare-datatypes ((ListLongMap!19053 0))(
  ( (ListLongMap!19054 (toList!9542 List!28366)) )
))
(declare-fun lm!212 () ListLongMap!19053)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7591 (ListLongMap!19053 (_ BitVec 64)) Bool)

(assert (=> start!106212 (= res!842073 (not (contains!7591 lm!212 a1!67)))))

(assert (=> start!106212 e!720010))

(declare-fun e!720011 () Bool)

(declare-fun inv!44072 (ListLongMap!19053) Bool)

(assert (=> start!106212 (and (inv!44072 lm!212) e!720011)))

(assert (=> start!106212 true))

(declare-fun b!1264421 () Bool)

(declare-fun isStrictlySorted!765 (List!28366) Bool)

(assert (=> b!1264421 (= e!720010 (not (isStrictlySorted!765 (toList!9542 lm!212))))))

(declare-fun b!1264422 () Bool)

(declare-fun tp!96203 () Bool)

(assert (=> b!1264422 (= e!720011 tp!96203)))

(assert (= (and start!106212 res!842073) b!1264421))

(assert (= start!106212 b!1264422))

(declare-fun m!1164551 () Bool)

(assert (=> start!106212 m!1164551))

(declare-fun m!1164553 () Bool)

(assert (=> start!106212 m!1164553))

(declare-fun m!1164555 () Bool)

(assert (=> b!1264421 m!1164555))

(check-sat (not b!1264421) (not start!106212) (not b!1264422))
(check-sat)
(get-model)

(declare-fun d!138605 () Bool)

(declare-fun res!842084 () Bool)

(declare-fun e!720028 () Bool)

(assert (=> d!138605 (=> res!842084 e!720028)))

(get-info :version)

(assert (=> d!138605 (= res!842084 (or ((_ is Nil!28363) (toList!9542 lm!212)) ((_ is Nil!28363) (t!41878 (toList!9542 lm!212)))))))

(assert (=> d!138605 (= (isStrictlySorted!765 (toList!9542 lm!212)) e!720028)))

(declare-fun b!1264439 () Bool)

(declare-fun e!720029 () Bool)

(assert (=> b!1264439 (= e!720028 e!720029)))

(declare-fun res!842085 () Bool)

(assert (=> b!1264439 (=> (not res!842085) (not e!720029))))

(assert (=> b!1264439 (= res!842085 (bvslt (_1!10601 (h!29571 (toList!9542 lm!212))) (_1!10601 (h!29571 (t!41878 (toList!9542 lm!212))))))))

(declare-fun b!1264440 () Bool)

(assert (=> b!1264440 (= e!720029 (isStrictlySorted!765 (t!41878 (toList!9542 lm!212))))))

(assert (= (and d!138605 (not res!842084)) b!1264439))

(assert (= (and b!1264439 res!842085) b!1264440))

(declare-fun m!1164569 () Bool)

(assert (=> b!1264440 m!1164569))

(assert (=> b!1264421 d!138605))

(declare-fun d!138607 () Bool)

(declare-fun e!720054 () Bool)

(assert (=> d!138607 e!720054))

(declare-fun res!842102 () Bool)

(assert (=> d!138607 (=> res!842102 e!720054)))

(declare-fun lt!573658 () Bool)

(assert (=> d!138607 (= res!842102 (not lt!573658))))

(declare-fun lt!573661 () Bool)

(assert (=> d!138607 (= lt!573658 lt!573661)))

(declare-datatypes ((Unit!41998 0))(
  ( (Unit!41999) )
))
(declare-fun lt!573660 () Unit!41998)

(declare-fun e!720055 () Unit!41998)

(assert (=> d!138607 (= lt!573660 e!720055)))

(declare-fun c!123127 () Bool)

(assert (=> d!138607 (= c!123127 lt!573661)))

(declare-fun containsKey!628 (List!28366 (_ BitVec 64)) Bool)

(assert (=> d!138607 (= lt!573661 (containsKey!628 (toList!9542 lm!212) a1!67))))

(assert (=> d!138607 (= (contains!7591 lm!212 a1!67) lt!573658)))

(declare-fun b!1264473 () Bool)

(declare-fun lt!573659 () Unit!41998)

(assert (=> b!1264473 (= e!720055 lt!573659)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!438 (List!28366 (_ BitVec 64)) Unit!41998)

(assert (=> b!1264473 (= lt!573659 (lemmaContainsKeyImpliesGetValueByKeyDefined!438 (toList!9542 lm!212) a1!67))))

(declare-datatypes ((Option!725 0))(
  ( (Some!724 (v!18999 B!1910)) (None!723) )
))
(declare-fun isDefined!481 (Option!725) Bool)

(declare-fun getValueByKey!674 (List!28366 (_ BitVec 64)) Option!725)

(assert (=> b!1264473 (isDefined!481 (getValueByKey!674 (toList!9542 lm!212) a1!67))))

(declare-fun b!1264474 () Bool)

(declare-fun Unit!42002 () Unit!41998)

(assert (=> b!1264474 (= e!720055 Unit!42002)))

(declare-fun b!1264475 () Bool)

(assert (=> b!1264475 (= e!720054 (isDefined!481 (getValueByKey!674 (toList!9542 lm!212) a1!67)))))

(assert (= (and d!138607 c!123127) b!1264473))

(assert (= (and d!138607 (not c!123127)) b!1264474))

(assert (= (and d!138607 (not res!842102)) b!1264475))

(declare-fun m!1164587 () Bool)

(assert (=> d!138607 m!1164587))

(declare-fun m!1164589 () Bool)

(assert (=> b!1264473 m!1164589))

(declare-fun m!1164591 () Bool)

(assert (=> b!1264473 m!1164591))

(assert (=> b!1264473 m!1164591))

(declare-fun m!1164593 () Bool)

(assert (=> b!1264473 m!1164593))

(assert (=> b!1264475 m!1164591))

(assert (=> b!1264475 m!1164591))

(assert (=> b!1264475 m!1164593))

(assert (=> start!106212 d!138607))

(declare-fun d!138617 () Bool)

(assert (=> d!138617 (= (inv!44072 lm!212) (isStrictlySorted!765 (toList!9542 lm!212)))))

(declare-fun bs!35748 () Bool)

(assert (= bs!35748 d!138617))

(assert (=> bs!35748 m!1164555))

(assert (=> start!106212 d!138617))

(declare-fun b!1264494 () Bool)

(declare-fun e!720068 () Bool)

(declare-fun tp_is_empty!32447 () Bool)

(declare-fun tp!96218 () Bool)

(assert (=> b!1264494 (= e!720068 (and tp_is_empty!32447 tp!96218))))

(assert (=> b!1264422 (= tp!96203 e!720068)))

(assert (= (and b!1264422 ((_ is Cons!28362) (toList!9542 lm!212))) b!1264494))

(check-sat (not d!138607) (not d!138617) (not b!1264440) (not b!1264473) (not b!1264475) (not b!1264494) tp_is_empty!32447)
(check-sat)
