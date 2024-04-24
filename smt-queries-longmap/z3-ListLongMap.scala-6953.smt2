; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87922 () Bool)

(assert start!87922)

(declare-fun res!681233 () Bool)

(declare-fun e!571431 () Bool)

(assert (=> start!87922 (=> (not res!681233) (not e!571431))))

(declare-datatypes ((B!1424 0))(
  ( (B!1425 (val!11796 Int)) )
))
(declare-datatypes ((tuple2!15142 0))(
  ( (tuple2!15143 (_1!7582 (_ BitVec 64)) (_2!7582 B!1424)) )
))
(declare-datatypes ((List!21416 0))(
  ( (Nil!21413) (Cons!21412 (h!22619 tuple2!15142) (t!30409 List!21416)) )
))
(declare-fun l!412 () List!21416)

(declare-fun isStrictlySorted!558 (List!21416) Bool)

(assert (=> start!87922 (= res!681233 (isStrictlySorted!558 l!412))))

(assert (=> start!87922 e!571431))

(declare-fun e!571430 () Bool)

(assert (=> start!87922 e!571430))

(declare-fun tp_is_empty!23491 () Bool)

(assert (=> start!87922 tp_is_empty!23491))

(declare-fun b!1015598 () Bool)

(declare-fun res!681232 () Bool)

(assert (=> b!1015598 (=> (not res!681232) (not e!571431))))

(declare-fun value!115 () B!1424)

(get-info :version)

(assert (=> b!1015598 (= res!681232 (and (not (= (_2!7582 (h!22619 l!412)) value!115)) ((_ is Cons!21412) l!412)))))

(declare-fun b!1015599 () Bool)

(declare-fun ListPrimitiveSize!109 (List!21416) Int)

(assert (=> b!1015599 (= e!571431 (>= (ListPrimitiveSize!109 (t!30409 l!412)) (ListPrimitiveSize!109 l!412)))))

(declare-fun b!1015600 () Bool)

(declare-fun tp!70503 () Bool)

(assert (=> b!1015600 (= e!571430 (and tp_is_empty!23491 tp!70503))))

(assert (= (and start!87922 res!681233) b!1015598))

(assert (= (and b!1015598 res!681232) b!1015599))

(assert (= (and start!87922 ((_ is Cons!21412) l!412)) b!1015600))

(declare-fun m!938657 () Bool)

(assert (=> start!87922 m!938657))

(declare-fun m!938659 () Bool)

(assert (=> b!1015599 m!938659))

(declare-fun m!938661 () Bool)

(assert (=> b!1015599 m!938661))

(check-sat (not start!87922) (not b!1015599) (not b!1015600) tp_is_empty!23491)
(check-sat)
(get-model)

(declare-fun d!121205 () Bool)

(declare-fun res!681250 () Bool)

(declare-fun e!571448 () Bool)

(assert (=> d!121205 (=> res!681250 e!571448)))

(assert (=> d!121205 (= res!681250 (or ((_ is Nil!21413) l!412) ((_ is Nil!21413) (t!30409 l!412))))))

(assert (=> d!121205 (= (isStrictlySorted!558 l!412) e!571448)))

(declare-fun b!1015623 () Bool)

(declare-fun e!571449 () Bool)

(assert (=> b!1015623 (= e!571448 e!571449)))

(declare-fun res!681251 () Bool)

(assert (=> b!1015623 (=> (not res!681251) (not e!571449))))

(assert (=> b!1015623 (= res!681251 (bvslt (_1!7582 (h!22619 l!412)) (_1!7582 (h!22619 (t!30409 l!412)))))))

(declare-fun b!1015624 () Bool)

(assert (=> b!1015624 (= e!571449 (isStrictlySorted!558 (t!30409 l!412)))))

(assert (= (and d!121205 (not res!681250)) b!1015623))

(assert (= (and b!1015623 res!681251) b!1015624))

(declare-fun m!938675 () Bool)

(assert (=> b!1015624 m!938675))

(assert (=> start!87922 d!121205))

(declare-fun d!121207 () Bool)

(declare-fun lt!448988 () Int)

(assert (=> d!121207 (>= lt!448988 0)))

(declare-fun e!571452 () Int)

(assert (=> d!121207 (= lt!448988 e!571452)))

(declare-fun c!103063 () Bool)

(assert (=> d!121207 (= c!103063 ((_ is Nil!21413) (t!30409 l!412)))))

(assert (=> d!121207 (= (ListPrimitiveSize!109 (t!30409 l!412)) lt!448988)))

(declare-fun b!1015629 () Bool)

(assert (=> b!1015629 (= e!571452 0)))

(declare-fun b!1015630 () Bool)

(assert (=> b!1015630 (= e!571452 (+ 1 (ListPrimitiveSize!109 (t!30409 (t!30409 l!412)))))))

(assert (= (and d!121207 c!103063) b!1015629))

(assert (= (and d!121207 (not c!103063)) b!1015630))

(declare-fun m!938677 () Bool)

(assert (=> b!1015630 m!938677))

(assert (=> b!1015599 d!121207))

(declare-fun d!121213 () Bool)

(declare-fun lt!448989 () Int)

(assert (=> d!121213 (>= lt!448989 0)))

(declare-fun e!571453 () Int)

(assert (=> d!121213 (= lt!448989 e!571453)))

(declare-fun c!103064 () Bool)

(assert (=> d!121213 (= c!103064 ((_ is Nil!21413) l!412))))

(assert (=> d!121213 (= (ListPrimitiveSize!109 l!412) lt!448989)))

(declare-fun b!1015631 () Bool)

(assert (=> b!1015631 (= e!571453 0)))

(declare-fun b!1015632 () Bool)

(assert (=> b!1015632 (= e!571453 (+ 1 (ListPrimitiveSize!109 (t!30409 l!412))))))

(assert (= (and d!121213 c!103064) b!1015631))

(assert (= (and d!121213 (not c!103064)) b!1015632))

(assert (=> b!1015632 m!938659))

(assert (=> b!1015599 d!121213))

(declare-fun b!1015637 () Bool)

(declare-fun e!571456 () Bool)

(declare-fun tp!70512 () Bool)

(assert (=> b!1015637 (= e!571456 (and tp_is_empty!23491 tp!70512))))

(assert (=> b!1015600 (= tp!70503 e!571456)))

(assert (= (and b!1015600 ((_ is Cons!21412) (t!30409 l!412))) b!1015637))

(check-sat (not b!1015637) (not b!1015624) (not b!1015632) (not b!1015630) tp_is_empty!23491)
(check-sat)
