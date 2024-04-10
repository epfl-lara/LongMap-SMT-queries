; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42762 () Bool)

(assert start!42762)

(declare-fun b_free!12091 () Bool)

(declare-fun b_next!12091 () Bool)

(assert (=> start!42762 (= b_free!12091 (not b_next!12091))))

(declare-fun tp!42336 () Bool)

(declare-fun b_and!20645 () Bool)

(assert (=> start!42762 (= tp!42336 b_and!20645)))

(declare-fun res!284500 () Bool)

(declare-fun e!279952 () Bool)

(assert (=> start!42762 (=> (not res!284500) (not e!279952))))

(declare-datatypes ((B!1040 0))(
  ( (B!1041 (val!6804 Int)) )
))
(declare-datatypes ((tuple2!8980 0))(
  ( (tuple2!8981 (_1!4501 (_ BitVec 64)) (_2!4501 B!1040)) )
))
(declare-datatypes ((List!9047 0))(
  ( (Nil!9044) (Cons!9043 (h!9899 tuple2!8980) (t!15051 List!9047)) )
))
(declare-datatypes ((ListLongMap!7893 0))(
  ( (ListLongMap!7894 (toList!3962 List!9047)) )
))
(declare-fun lm!215 () ListLongMap!7893)

(declare-fun p!166 () Int)

(declare-fun forall!191 (List!9047 Int) Bool)

(assert (=> start!42762 (= res!284500 (forall!191 (toList!3962 lm!215) p!166))))

(assert (=> start!42762 e!279952))

(declare-fun e!279951 () Bool)

(declare-fun inv!15479 (ListLongMap!7893) Bool)

(assert (=> start!42762 (and (inv!15479 lm!215) e!279951)))

(assert (=> start!42762 tp!42336))

(assert (=> start!42762 true))

(declare-fun tp_is_empty!13513 () Bool)

(assert (=> start!42762 tp_is_empty!13513))

(declare-fun b!476619 () Bool)

(declare-fun tp!42337 () Bool)

(assert (=> b!476619 (= e!279951 tp!42337)))

(declare-fun b!476618 () Bool)

(declare-fun tail!113 (ListLongMap!7893) ListLongMap!7893)

(assert (=> b!476618 (= e!279952 (not (forall!191 (toList!3962 (tail!113 lm!215)) p!166)))))

(declare-fun b!476617 () Bool)

(declare-fun res!284498 () Bool)

(assert (=> b!476617 (=> (not res!284498) (not e!279952))))

(declare-fun isEmpty!589 (ListLongMap!7893) Bool)

(assert (=> b!476617 (= res!284498 (not (isEmpty!589 lm!215)))))

(declare-fun b!476616 () Bool)

(declare-fun res!284499 () Bool)

(assert (=> b!476616 (=> (not res!284499) (not e!279952))))

(declare-fun b!85 () B!1040)

(declare-fun a!501 () (_ BitVec 64))

(declare-fun dynLambda!938 (Int tuple2!8980) Bool)

(assert (=> b!476616 (= res!284499 (dynLambda!938 p!166 (tuple2!8981 a!501 b!85)))))

(assert (= (and start!42762 res!284500) b!476616))

(assert (= (and b!476616 res!284499) b!476617))

(assert (= (and b!476617 res!284498) b!476618))

(assert (= start!42762 b!476619))

(declare-fun b_lambda!10395 () Bool)

(assert (=> (not b_lambda!10395) (not b!476616)))

(declare-fun t!15050 () Bool)

(declare-fun tb!3961 () Bool)

(assert (=> (and start!42762 (= p!166 p!166) t!15050) tb!3961))

(declare-fun result!7511 () Bool)

(assert (=> tb!3961 (= result!7511 true)))

(assert (=> b!476616 t!15050))

(declare-fun b_and!20647 () Bool)

(assert (= b_and!20645 (and (=> t!15050 result!7511) b_and!20647)))

(declare-fun m!458887 () Bool)

(assert (=> start!42762 m!458887))

(declare-fun m!458889 () Bool)

(assert (=> start!42762 m!458889))

(declare-fun m!458891 () Bool)

(assert (=> b!476618 m!458891))

(declare-fun m!458893 () Bool)

(assert (=> b!476618 m!458893))

(declare-fun m!458895 () Bool)

(assert (=> b!476617 m!458895))

(declare-fun m!458897 () Bool)

(assert (=> b!476616 m!458897))

(push 1)

(assert (not b!476617))

(assert b_and!20647)

(assert (not b!476619))

(assert (not start!42762))

(assert (not b_next!12091))

(assert tp_is_empty!13513)

(assert (not b!476618))

(assert (not b_lambda!10395))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20647)

(assert (not b_next!12091))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!10401 () Bool)

(assert (= b_lambda!10395 (or (and start!42762 b_free!12091) b_lambda!10401)))

(push 1)

(assert (not b!476617))

(assert b_and!20647)

(assert (not b!476619))

(assert (not start!42762))

(assert (not b_next!12091))

(assert (not b_lambda!10401))

(assert tp_is_empty!13513)

(assert (not b!476618))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20647)

(assert (not b_next!12091))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75761 () Bool)

(declare-fun isEmpty!592 (List!9047) Bool)

(assert (=> d!75761 (= (isEmpty!589 lm!215) (isEmpty!592 (toList!3962 lm!215)))))

(declare-fun bs!15135 () Bool)

(assert (= bs!15135 d!75761))

(declare-fun m!458923 () Bool)

(assert (=> bs!15135 m!458923))

(assert (=> b!476617 d!75761))

(declare-fun d!75763 () Bool)

(declare-fun res!284523 () Bool)

(declare-fun e!279969 () Bool)

(assert (=> d!75763 (=> res!284523 e!279969)))

(assert (=> d!75763 (= res!284523 (is-Nil!9044 (toList!3962 lm!215)))))

(assert (=> d!75763 (= (forall!191 (toList!3962 lm!215) p!166) e!279969)))

(declare-fun b!476648 () Bool)

(declare-fun e!279970 () Bool)

(assert (=> b!476648 (= e!279969 e!279970)))

(declare-fun res!284524 () Bool)

(assert (=> b!476648 (=> (not res!284524) (not e!279970))))

(assert (=> b!476648 (= res!284524 (dynLambda!938 p!166 (h!9899 (toList!3962 lm!215))))))

(declare-fun b!476649 () Bool)

(assert (=> b!476649 (= e!279970 (forall!191 (t!15051 (toList!3962 lm!215)) p!166))))

(assert (= (and d!75763 (not res!284523)) b!476648))

(assert (= (and b!476648 res!284524) b!476649))

(declare-fun b_lambda!10407 () Bool)

(assert (=> (not b_lambda!10407) (not b!476648)))

(declare-fun t!15059 () Bool)

(declare-fun tb!3967 () Bool)

(assert (=> (and start!42762 (= p!166 p!166) t!15059) tb!3967))

(declare-fun result!7517 () Bool)

(assert (=> tb!3967 (= result!7517 true)))

(assert (=> b!476648 t!15059))

(declare-fun b_and!20657 () Bool)

(assert (= b_and!20647 (and (=> t!15059 result!7517) b_and!20657)))

(declare-fun m!458925 () Bool)

(assert (=> b!476648 m!458925))

(declare-fun m!458927 () Bool)

(assert (=> b!476649 m!458927))

(assert (=> start!42762 d!75763))

(declare-fun d!75767 () Bool)

(declare-fun isStrictlySorted!381 (List!9047) Bool)

(assert (=> d!75767 (= (inv!15479 lm!215) (isStrictlySorted!381 (toList!3962 lm!215)))))

(declare-fun bs!15136 () Bool)

(assert (= bs!15136 d!75767))

(declare-fun m!458929 () Bool)

(assert (=> bs!15136 m!458929))

(assert (=> start!42762 d!75767))

(declare-fun d!75771 () Bool)

(declare-fun res!284529 () Bool)

(declare-fun e!279975 () Bool)

(assert (=> d!75771 (=> res!284529 e!279975)))

(assert (=> d!75771 (= res!284529 (is-Nil!9044 (toList!3962 (tail!113 lm!215))))))

(assert (=> d!75771 (= (forall!191 (toList!3962 (tail!113 lm!215)) p!166) e!279975)))

(declare-fun b!476654 () Bool)

(declare-fun e!279976 () Bool)

(assert (=> b!476654 (= e!279975 e!279976)))

(declare-fun res!284530 () Bool)

(assert (=> b!476654 (=> (not res!284530) (not e!279976))))

(assert (=> b!476654 (= res!284530 (dynLambda!938 p!166 (h!9899 (toList!3962 (tail!113 lm!215)))))))

(declare-fun b!476655 () Bool)

(assert (=> b!476655 (= e!279976 (forall!191 (t!15051 (toList!3962 (tail!113 lm!215))) p!166))))

(assert (= (and d!75771 (not res!284529)) b!476654))

(assert (= (and b!476654 res!284530) b!476655))

(declare-fun b_lambda!10409 () Bool)

(assert (=> (not b_lambda!10409) (not b!476654)))

(declare-fun t!15061 () Bool)

(declare-fun tb!3969 () Bool)

(assert (=> (and start!42762 (= p!166 p!166) t!15061) tb!3969))

(declare-fun result!7519 () Bool)

(assert (=> tb!3969 (= result!7519 true)))

(assert (=> b!476654 t!15061))

(declare-fun b_and!20659 () Bool)

(assert (= b_and!20657 (and (=> t!15061 result!7519) b_and!20659)))

(declare-fun m!458931 () Bool)

(assert (=> b!476654 m!458931))

(declare-fun m!458935 () Bool)

(assert (=> b!476655 m!458935))

(assert (=> b!476618 d!75771))

(declare-fun d!75775 () Bool)

(declare-fun tail!116 (List!9047) List!9047)

(assert (=> d!75775 (= (tail!113 lm!215) (ListLongMap!7894 (tail!116 (toList!3962 lm!215))))))

(declare-fun bs!15138 () Bool)

(assert (= bs!15138 d!75775))

(declare-fun m!458941 () Bool)

(assert (=> bs!15138 m!458941))

(assert (=> b!476618 d!75775))

(declare-fun b!476666 () Bool)

(declare-fun e!279985 () Bool)

(declare-fun tp!42352 () Bool)

(assert (=> b!476666 (= e!279985 (and tp_is_empty!13513 tp!42352))))

(assert (=> b!476619 (= tp!42337 e!279985)))

(assert (= (and b!476619 (is-Cons!9043 (toList!3962 lm!215))) b!476666))

(declare-fun b_lambda!10413 () Bool)

(assert (= b_lambda!10409 (or (and start!42762 b_free!12091) b_lambda!10413)))

(declare-fun b_lambda!10415 () Bool)

(assert (= b_lambda!10407 (or (and start!42762 b_free!12091) b_lambda!10415)))

(push 1)

(assert (not b!476655))

(assert (not b_lambda!10415))

(assert (not b_next!12091))

(assert (not b!476649))

(assert (not b!476666))

(assert (not b_lambda!10401))

(assert tp_is_empty!13513)

(assert (not d!75767))

(assert (not d!75775))

(assert (not d!75761))

(assert (not b_lambda!10413))

(assert b_and!20659)

(check-sat)

(pop 1)

(push 1)

(assert b_and!20659)

(assert (not b_next!12091))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75791 () Bool)

(assert (=> d!75791 (= (tail!116 (toList!3962 lm!215)) (t!15051 (toList!3962 lm!215)))))

(assert (=> d!75775 d!75791))

(declare-fun d!75793 () Bool)

(declare-fun res!284543 () Bool)

(declare-fun e!279998 () Bool)

(assert (=> d!75793 (=> res!284543 e!279998)))

(assert (=> d!75793 (= res!284543 (is-Nil!9044 (t!15051 (toList!3962 (tail!113 lm!215)))))))

(assert (=> d!75793 (= (forall!191 (t!15051 (toList!3962 (tail!113 lm!215))) p!166) e!279998)))

(declare-fun b!476683 () Bool)

(declare-fun e!279999 () Bool)

(assert (=> b!476683 (= e!279998 e!279999)))

(declare-fun res!284544 () Bool)

(assert (=> b!476683 (=> (not res!284544) (not e!279999))))

(assert (=> b!476683 (= res!284544 (dynLambda!938 p!166 (h!9899 (t!15051 (toList!3962 (tail!113 lm!215))))))))

(declare-fun b!476684 () Bool)

(assert (=> b!476684 (= e!279999 (forall!191 (t!15051 (t!15051 (toList!3962 (tail!113 lm!215)))) p!166))))

(assert (= (and d!75793 (not res!284543)) b!476683))

(assert (= (and b!476683 res!284544) b!476684))

(declare-fun b_lambda!10431 () Bool)

(assert (=> (not b_lambda!10431) (not b!476683)))

(declare-fun t!15071 () Bool)

(declare-fun tb!3979 () Bool)

(assert (=> (and start!42762 (= p!166 p!166) t!15071) tb!3979))

(declare-fun result!7535 () Bool)

(assert (=> tb!3979 (= result!7535 true)))

(assert (=> b!476683 t!15071))

(declare-fun b_and!20669 () Bool)

(assert (= b_and!20659 (and (=> t!15071 result!7535) b_and!20669)))

(declare-fun m!458965 () Bool)

(assert (=> b!476683 m!458965))

(declare-fun m!458967 () Bool)

(assert (=> b!476684 m!458967))

(assert (=> b!476655 d!75793))

(declare-fun d!75795 () Bool)

(declare-fun res!284545 () Bool)

(declare-fun e!280000 () Bool)

(assert (=> d!75795 (=> res!284545 e!280000)))

(assert (=> d!75795 (= res!284545 (is-Nil!9044 (t!15051 (toList!3962 lm!215))))))

(assert (=> d!75795 (= (forall!191 (t!15051 (toList!3962 lm!215)) p!166) e!280000)))

(declare-fun b!476685 () Bool)

(declare-fun e!280001 () Bool)

(assert (=> b!476685 (= e!280000 e!280001)))

(declare-fun res!284546 () Bool)

(assert (=> b!476685 (=> (not res!284546) (not e!280001))))

(assert (=> b!476685 (= res!284546 (dynLambda!938 p!166 (h!9899 (t!15051 (toList!3962 lm!215)))))))

(declare-fun b!476686 () Bool)

(assert (=> b!476686 (= e!280001 (forall!191 (t!15051 (t!15051 (toList!3962 lm!215))) p!166))))

(assert (= (and d!75795 (not res!284545)) b!476685))

(assert (= (and b!476685 res!284546) b!476686))

(declare-fun b_lambda!10433 () Bool)

(assert (=> (not b_lambda!10433) (not b!476685)))

(declare-fun t!15073 () Bool)

(declare-fun tb!3981 () Bool)

(assert (=> (and start!42762 (= p!166 p!166) t!15073) tb!3981))

(declare-fun result!7537 () Bool)

(assert (=> tb!3981 (= result!7537 true)))

(assert (=> b!476685 t!15073))

(declare-fun b_and!20671 () Bool)

(assert (= b_and!20669 (and (=> t!15073 result!7537) b_and!20671)))

(declare-fun m!458969 () Bool)

(assert (=> b!476685 m!458969))

(declare-fun m!458971 () Bool)

(assert (=> b!476686 m!458971))

(assert (=> b!476649 d!75795))

(declare-fun d!75797 () Bool)

(assert (=> d!75797 (= (isEmpty!592 (toList!3962 lm!215)) (is-Nil!9044 (toList!3962 lm!215)))))

(assert (=> d!75761 d!75797))

(declare-fun d!75799 () Bool)

(declare-fun res!284551 () Bool)

(declare-fun e!280006 () Bool)

(assert (=> d!75799 (=> res!284551 e!280006)))

(assert (=> d!75799 (= res!284551 (or (is-Nil!9044 (toList!3962 lm!215)) (is-Nil!9044 (t!15051 (toList!3962 lm!215)))))))

(assert (=> d!75799 (= (isStrictlySorted!381 (toList!3962 lm!215)) e!280006)))

(declare-fun b!476691 () Bool)

(declare-fun e!280007 () Bool)

(assert (=> b!476691 (= e!280006 e!280007)))

(declare-fun res!284552 () Bool)

(assert (=> b!476691 (=> (not res!284552) (not e!280007))))

(assert (=> b!476691 (= res!284552 (bvslt (_1!4501 (h!9899 (toList!3962 lm!215))) (_1!4501 (h!9899 (t!15051 (toList!3962 lm!215))))))))

(declare-fun b!476692 () Bool)

(assert (=> b!476692 (= e!280007 (isStrictlySorted!381 (t!15051 (toList!3962 lm!215))))))

(assert (= (and d!75799 (not res!284551)) b!476691))

(assert (= (and b!476691 res!284552) b!476692))

(declare-fun m!458973 () Bool)

(assert (=> b!476692 m!458973))

(assert (=> d!75767 d!75799))

(declare-fun b!476693 () Bool)

(declare-fun e!280008 () Bool)

(declare-fun tp!42359 () Bool)

(assert (=> b!476693 (= e!280008 (and tp_is_empty!13513 tp!42359))))

(assert (=> b!476666 (= tp!42352 e!280008)))

(assert (= (and b!476666 (is-Cons!9043 (t!15051 (toList!3962 lm!215)))) b!476693))

(declare-fun b_lambda!10435 () Bool)

(assert (= b_lambda!10431 (or (and start!42762 b_free!12091) b_lambda!10435)))

(declare-fun b_lambda!10437 () Bool)

(assert (= b_lambda!10433 (or (and start!42762 b_free!12091) b_lambda!10437)))

(push 1)

(assert (not b!476692))

(assert (not b_lambda!10437))

(assert (not b!476684))

(assert (not b!476686))

(assert (not b_lambda!10415))

(assert (not b_next!12091))

(assert (not b_lambda!10413))

(assert (not b_lambda!10401))

(assert (not b_lambda!10435))

(assert tp_is_empty!13513)

(assert (not b!476693))

(assert b_and!20671)

(check-sat)

(pop 1)

(push 1)

(assert b_and!20671)

(assert (not b_next!12091))

(check-sat)

(pop 1)

