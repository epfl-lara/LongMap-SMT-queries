; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88324 () Bool)

(assert start!88324)

(declare-fun b!1017614 () Bool)

(assert (=> b!1017614 true))

(assert (=> b!1017614 true))

(declare-fun res!682196 () Bool)

(declare-fun e!572568 () Bool)

(assert (=> b!1017614 (=> (not res!682196) (not e!572568))))

(declare-datatypes ((List!21506 0))(
  ( (Nil!21503) (Cons!21502 (h!22709 (_ BitVec 64)) (t!30499 List!21506)) )
))
(declare-fun keys!40 () List!21506)

(declare-fun lambda!1010 () Int)

(declare-fun forall!279 (List!21506 Int) Bool)

(assert (=> b!1017614 (= res!682196 (forall!279 keys!40 lambda!1010))))

(declare-fun b!1017615 () Bool)

(declare-fun res!682194 () Bool)

(assert (=> b!1017615 (=> (not res!682194) (not e!572568))))

(declare-datatypes ((B!1526 0))(
  ( (B!1527 (val!11847 Int)) )
))
(declare-datatypes ((tuple2!15244 0))(
  ( (tuple2!15245 (_1!7633 (_ BitVec 64)) (_2!7633 B!1526)) )
))
(declare-fun newHead!31 () tuple2!15244)

(declare-datatypes ((List!21507 0))(
  ( (Nil!21504) (Cons!21503 (h!22710 tuple2!15244) (t!30500 List!21507)) )
))
(declare-fun l!1114 () List!21507)

(declare-fun head!960 (List!21507) tuple2!15244)

(assert (=> b!1017615 (= res!682194 (bvslt (_1!7633 newHead!31) (_1!7633 (head!960 l!1114))))))

(declare-fun b!1017616 () Bool)

(declare-datatypes ((Option!596 0))(
  ( (Some!595 (v!14446 B!1526)) (None!594) )
))
(declare-fun isDefined!397 (Option!596) Bool)

(declare-fun getValueByKey!545 (List!21507 (_ BitVec 64)) Option!596)

(assert (=> b!1017616 (= e!572568 (not (isDefined!397 (getValueByKey!545 l!1114 (h!22709 keys!40)))))))

(declare-fun b!1017617 () Bool)

(declare-fun res!682193 () Bool)

(assert (=> b!1017617 (=> (not res!682193) (not e!572568))))

(get-info :version)

(assert (=> b!1017617 (= res!682193 ((_ is Cons!21502) keys!40))))

(declare-fun b!1017618 () Bool)

(declare-fun res!682195 () Bool)

(assert (=> b!1017618 (=> (not res!682195) (not e!572568))))

(declare-fun isEmpty!881 (List!21507) Bool)

(assert (=> b!1017618 (= res!682195 (not (isEmpty!881 l!1114)))))

(declare-fun b!1017619 () Bool)

(declare-fun e!572567 () Bool)

(declare-fun tp_is_empty!23593 () Bool)

(declare-fun tp!70755 () Bool)

(assert (=> b!1017619 (= e!572567 (and tp_is_empty!23593 tp!70755))))

(declare-fun res!682192 () Bool)

(assert (=> start!88324 (=> (not res!682192) (not e!572568))))

(declare-fun isStrictlySorted!603 (List!21507) Bool)

(assert (=> start!88324 (= res!682192 (isStrictlySorted!603 l!1114))))

(assert (=> start!88324 e!572568))

(assert (=> start!88324 e!572567))

(assert (=> start!88324 true))

(assert (=> start!88324 tp_is_empty!23593))

(assert (= (and start!88324 res!682192) b!1017618))

(assert (= (and b!1017618 res!682195) b!1017614))

(assert (= (and b!1017614 res!682196) b!1017615))

(assert (= (and b!1017615 res!682194) b!1017617))

(assert (= (and b!1017617 res!682193) b!1017616))

(assert (= (and start!88324 ((_ is Cons!21503) l!1114)) b!1017619))

(declare-fun m!939695 () Bool)

(assert (=> start!88324 m!939695))

(declare-fun m!939697 () Bool)

(assert (=> b!1017614 m!939697))

(declare-fun m!939699 () Bool)

(assert (=> b!1017615 m!939699))

(declare-fun m!939701 () Bool)

(assert (=> b!1017618 m!939701))

(declare-fun m!939703 () Bool)

(assert (=> b!1017616 m!939703))

(assert (=> b!1017616 m!939703))

(declare-fun m!939705 () Bool)

(assert (=> b!1017616 m!939705))

(check-sat (not b!1017619) (not b!1017614) (not start!88324) (not b!1017616) (not b!1017615) (not b!1017618) tp_is_empty!23593)
(check-sat)
(get-model)

(declare-fun d!121665 () Bool)

(assert (=> d!121665 (= (head!960 l!1114) (h!22710 l!1114))))

(assert (=> b!1017615 d!121665))

(declare-fun d!121667 () Bool)

(declare-fun res!682231 () Bool)

(declare-fun e!572585 () Bool)

(assert (=> d!121667 (=> res!682231 e!572585)))

(assert (=> d!121667 (= res!682231 (or ((_ is Nil!21504) l!1114) ((_ is Nil!21504) (t!30500 l!1114))))))

(assert (=> d!121667 (= (isStrictlySorted!603 l!1114) e!572585)))

(declare-fun b!1017672 () Bool)

(declare-fun e!572586 () Bool)

(assert (=> b!1017672 (= e!572585 e!572586)))

(declare-fun res!682232 () Bool)

(assert (=> b!1017672 (=> (not res!682232) (not e!572586))))

(assert (=> b!1017672 (= res!682232 (bvslt (_1!7633 (h!22710 l!1114)) (_1!7633 (h!22710 (t!30500 l!1114)))))))

(declare-fun b!1017673 () Bool)

(assert (=> b!1017673 (= e!572586 (isStrictlySorted!603 (t!30500 l!1114)))))

(assert (= (and d!121667 (not res!682231)) b!1017672))

(assert (= (and b!1017672 res!682232) b!1017673))

(declare-fun m!939731 () Bool)

(assert (=> b!1017673 m!939731))

(assert (=> start!88324 d!121667))

(declare-fun d!121669 () Bool)

(declare-fun res!682237 () Bool)

(declare-fun e!572591 () Bool)

(assert (=> d!121669 (=> res!682237 e!572591)))

(assert (=> d!121669 (= res!682237 ((_ is Nil!21503) keys!40))))

(assert (=> d!121669 (= (forall!279 keys!40 lambda!1010) e!572591)))

(declare-fun b!1017678 () Bool)

(declare-fun e!572592 () Bool)

(assert (=> b!1017678 (= e!572591 e!572592)))

(declare-fun res!682238 () Bool)

(assert (=> b!1017678 (=> (not res!682238) (not e!572592))))

(declare-fun dynLambda!1936 (Int (_ BitVec 64)) Bool)

(assert (=> b!1017678 (= res!682238 (dynLambda!1936 lambda!1010 (h!22709 keys!40)))))

(declare-fun b!1017679 () Bool)

(assert (=> b!1017679 (= e!572592 (forall!279 (t!30499 keys!40) lambda!1010))))

(assert (= (and d!121669 (not res!682237)) b!1017678))

(assert (= (and b!1017678 res!682238) b!1017679))

(declare-fun b_lambda!15513 () Bool)

(assert (=> (not b_lambda!15513) (not b!1017678)))

(declare-fun m!939733 () Bool)

(assert (=> b!1017678 m!939733))

(declare-fun m!939735 () Bool)

(assert (=> b!1017679 m!939735))

(assert (=> b!1017614 d!121669))

(declare-fun d!121675 () Bool)

(assert (=> d!121675 (= (isEmpty!881 l!1114) ((_ is Nil!21504) l!1114))))

(assert (=> b!1017618 d!121675))

(declare-fun d!121679 () Bool)

(declare-fun isEmpty!884 (Option!596) Bool)

(assert (=> d!121679 (= (isDefined!397 (getValueByKey!545 l!1114 (h!22709 keys!40))) (not (isEmpty!884 (getValueByKey!545 l!1114 (h!22709 keys!40)))))))

(declare-fun bs!29531 () Bool)

(assert (= bs!29531 d!121679))

(assert (=> bs!29531 m!939703))

(declare-fun m!939737 () Bool)

(assert (=> bs!29531 m!939737))

(assert (=> b!1017616 d!121679))

(declare-fun b!1017707 () Bool)

(declare-fun e!572615 () Option!596)

(declare-fun e!572616 () Option!596)

(assert (=> b!1017707 (= e!572615 e!572616)))

(declare-fun c!103339 () Bool)

(assert (=> b!1017707 (= c!103339 (and ((_ is Cons!21503) l!1114) (not (= (_1!7633 (h!22710 l!1114)) (h!22709 keys!40)))))))

(declare-fun b!1017709 () Bool)

(assert (=> b!1017709 (= e!572616 None!594)))

(declare-fun b!1017708 () Bool)

(assert (=> b!1017708 (= e!572616 (getValueByKey!545 (t!30500 l!1114) (h!22709 keys!40)))))

(declare-fun d!121681 () Bool)

(declare-fun c!103338 () Bool)

(assert (=> d!121681 (= c!103338 (and ((_ is Cons!21503) l!1114) (= (_1!7633 (h!22710 l!1114)) (h!22709 keys!40))))))

(assert (=> d!121681 (= (getValueByKey!545 l!1114 (h!22709 keys!40)) e!572615)))

(declare-fun b!1017706 () Bool)

(assert (=> b!1017706 (= e!572615 (Some!595 (_2!7633 (h!22710 l!1114))))))

(assert (= (and d!121681 c!103338) b!1017706))

(assert (= (and d!121681 (not c!103338)) b!1017707))

(assert (= (and b!1017707 c!103339) b!1017708))

(assert (= (and b!1017707 (not c!103339)) b!1017709))

(declare-fun m!939749 () Bool)

(assert (=> b!1017708 m!939749))

(assert (=> b!1017616 d!121681))

(declare-fun b!1017722 () Bool)

(declare-fun e!572623 () Bool)

(declare-fun tp!70764 () Bool)

(assert (=> b!1017722 (= e!572623 (and tp_is_empty!23593 tp!70764))))

(assert (=> b!1017619 (= tp!70755 e!572623)))

(assert (= (and b!1017619 ((_ is Cons!21503) (t!30500 l!1114))) b!1017722))

(declare-fun b_lambda!15517 () Bool)

(assert (= b_lambda!15513 (or b!1017614 b_lambda!15517)))

(declare-fun bs!29534 () Bool)

(declare-fun d!121695 () Bool)

(assert (= bs!29534 (and d!121695 b!1017614)))

(declare-fun value!178 () B!1526)

(assert (=> bs!29534 (= (dynLambda!1936 lambda!1010 (h!22709 keys!40)) (= (getValueByKey!545 l!1114 (h!22709 keys!40)) (Some!595 value!178)))))

(assert (=> bs!29534 m!939703))

(assert (=> b!1017678 d!121695))

(check-sat (not d!121679) (not b_lambda!15517) (not b!1017673) (not bs!29534) (not b!1017722) tp_is_empty!23593 (not b!1017679) (not b!1017708))
(check-sat)
(get-model)

(declare-fun d!121707 () Bool)

(assert (=> d!121707 (= (isEmpty!884 (getValueByKey!545 l!1114 (h!22709 keys!40))) (not ((_ is Some!595) (getValueByKey!545 l!1114 (h!22709 keys!40)))))))

(assert (=> d!121679 d!121707))

(declare-fun d!121709 () Bool)

(declare-fun res!682263 () Bool)

(declare-fun e!572644 () Bool)

(assert (=> d!121709 (=> res!682263 e!572644)))

(assert (=> d!121709 (= res!682263 (or ((_ is Nil!21504) (t!30500 l!1114)) ((_ is Nil!21504) (t!30500 (t!30500 l!1114)))))))

(assert (=> d!121709 (= (isStrictlySorted!603 (t!30500 l!1114)) e!572644)))

(declare-fun b!1017755 () Bool)

(declare-fun e!572645 () Bool)

(assert (=> b!1017755 (= e!572644 e!572645)))

(declare-fun res!682264 () Bool)

(assert (=> b!1017755 (=> (not res!682264) (not e!572645))))

(assert (=> b!1017755 (= res!682264 (bvslt (_1!7633 (h!22710 (t!30500 l!1114))) (_1!7633 (h!22710 (t!30500 (t!30500 l!1114))))))))

(declare-fun b!1017756 () Bool)

(assert (=> b!1017756 (= e!572645 (isStrictlySorted!603 (t!30500 (t!30500 l!1114))))))

(assert (= (and d!121709 (not res!682263)) b!1017755))

(assert (= (and b!1017755 res!682264) b!1017756))

(declare-fun m!939761 () Bool)

(assert (=> b!1017756 m!939761))

(assert (=> b!1017673 d!121709))

(assert (=> bs!29534 d!121681))

(declare-fun b!1017758 () Bool)

(declare-fun e!572646 () Option!596)

(declare-fun e!572647 () Option!596)

(assert (=> b!1017758 (= e!572646 e!572647)))

(declare-fun c!103353 () Bool)

(assert (=> b!1017758 (= c!103353 (and ((_ is Cons!21503) (t!30500 l!1114)) (not (= (_1!7633 (h!22710 (t!30500 l!1114))) (h!22709 keys!40)))))))

(declare-fun b!1017760 () Bool)

(assert (=> b!1017760 (= e!572647 None!594)))

(declare-fun b!1017759 () Bool)

(assert (=> b!1017759 (= e!572647 (getValueByKey!545 (t!30500 (t!30500 l!1114)) (h!22709 keys!40)))))

(declare-fun d!121711 () Bool)

(declare-fun c!103352 () Bool)

(assert (=> d!121711 (= c!103352 (and ((_ is Cons!21503) (t!30500 l!1114)) (= (_1!7633 (h!22710 (t!30500 l!1114))) (h!22709 keys!40))))))

(assert (=> d!121711 (= (getValueByKey!545 (t!30500 l!1114) (h!22709 keys!40)) e!572646)))

(declare-fun b!1017757 () Bool)

(assert (=> b!1017757 (= e!572646 (Some!595 (_2!7633 (h!22710 (t!30500 l!1114)))))))

(assert (= (and d!121711 c!103352) b!1017757))

(assert (= (and d!121711 (not c!103352)) b!1017758))

(assert (= (and b!1017758 c!103353) b!1017759))

(assert (= (and b!1017758 (not c!103353)) b!1017760))

(declare-fun m!939763 () Bool)

(assert (=> b!1017759 m!939763))

(assert (=> b!1017708 d!121711))

(declare-fun d!121713 () Bool)

(declare-fun res!682265 () Bool)

(declare-fun e!572648 () Bool)

(assert (=> d!121713 (=> res!682265 e!572648)))

(assert (=> d!121713 (= res!682265 ((_ is Nil!21503) (t!30499 keys!40)))))

(assert (=> d!121713 (= (forall!279 (t!30499 keys!40) lambda!1010) e!572648)))

(declare-fun b!1017761 () Bool)

(declare-fun e!572649 () Bool)

(assert (=> b!1017761 (= e!572648 e!572649)))

(declare-fun res!682266 () Bool)

(assert (=> b!1017761 (=> (not res!682266) (not e!572649))))

(assert (=> b!1017761 (= res!682266 (dynLambda!1936 lambda!1010 (h!22709 (t!30499 keys!40))))))

(declare-fun b!1017762 () Bool)

(assert (=> b!1017762 (= e!572649 (forall!279 (t!30499 (t!30499 keys!40)) lambda!1010))))

(assert (= (and d!121713 (not res!682265)) b!1017761))

(assert (= (and b!1017761 res!682266) b!1017762))

(declare-fun b_lambda!15525 () Bool)

(assert (=> (not b_lambda!15525) (not b!1017761)))

(declare-fun m!939765 () Bool)

(assert (=> b!1017761 m!939765))

(declare-fun m!939767 () Bool)

(assert (=> b!1017762 m!939767))

(assert (=> b!1017679 d!121713))

(declare-fun b!1017763 () Bool)

(declare-fun e!572650 () Bool)

(declare-fun tp!70771 () Bool)

(assert (=> b!1017763 (= e!572650 (and tp_is_empty!23593 tp!70771))))

(assert (=> b!1017722 (= tp!70764 e!572650)))

(assert (= (and b!1017722 ((_ is Cons!21503) (t!30500 (t!30500 l!1114)))) b!1017763))

(declare-fun b_lambda!15527 () Bool)

(assert (= b_lambda!15525 (or b!1017614 b_lambda!15527)))

(declare-fun bs!29537 () Bool)

(declare-fun d!121715 () Bool)

(assert (= bs!29537 (and d!121715 b!1017614)))

(assert (=> bs!29537 (= (dynLambda!1936 lambda!1010 (h!22709 (t!30499 keys!40))) (= (getValueByKey!545 l!1114 (h!22709 (t!30499 keys!40))) (Some!595 value!178)))))

(declare-fun m!939769 () Bool)

(assert (=> bs!29537 m!939769))

(assert (=> b!1017761 d!121715))

(check-sat (not b!1017759) (not b!1017762) (not b_lambda!15517) (not b_lambda!15527) (not b!1017756) (not b!1017763) (not bs!29537) tp_is_empty!23593)
(check-sat)
