; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88474 () Bool)

(assert start!88474)

(declare-fun b!1017608 () Bool)

(declare-fun e!572525 () Bool)

(declare-datatypes ((B!1598 0))(
  ( (B!1599 (val!11883 Int)) )
))
(declare-datatypes ((tuple2!15392 0))(
  ( (tuple2!15393 (_1!7707 (_ BitVec 64)) (_2!7707 B!1598)) )
))
(declare-datatypes ((List!21606 0))(
  ( (Nil!21603) (Cons!21602 (h!22800 tuple2!15392) (t!30598 List!21606)) )
))
(declare-fun l!1036 () List!21606)

(declare-fun ListPrimitiveSize!130 (List!21606) Int)

(assert (=> b!1017608 (= e!572525 (>= (ListPrimitiveSize!130 (t!30598 l!1036)) (ListPrimitiveSize!130 l!1036)))))

(declare-fun b!1017609 () Bool)

(declare-fun e!572526 () Bool)

(declare-fun tp_is_empty!23665 () Bool)

(declare-fun tp!70937 () Bool)

(assert (=> b!1017609 (= e!572526 (and tp_is_empty!23665 tp!70937))))

(declare-fun b!1017610 () Bool)

(declare-fun res!682487 () Bool)

(assert (=> b!1017610 (=> (not res!682487) (not e!572525))))

(declare-fun isStrictlySorted!638 (List!21606) Bool)

(assert (=> b!1017610 (= res!682487 (isStrictlySorted!638 (t!30598 l!1036)))))

(declare-fun b!1017611 () Bool)

(declare-fun res!682483 () Bool)

(assert (=> b!1017611 (=> (not res!682483) (not e!572525))))

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!628 0))(
  ( (Some!627 (v!14475 B!1598)) (None!626) )
))
(declare-fun isDefined!425 (Option!628) Bool)

(declare-fun getValueByKey!577 (List!21606 (_ BitVec 64)) Option!628)

(assert (=> b!1017611 (= res!682483 (isDefined!425 (getValueByKey!577 (t!30598 l!1036) key!271)))))

(declare-fun res!682484 () Bool)

(assert (=> start!88474 (=> (not res!682484) (not e!572525))))

(assert (=> start!88474 (= res!682484 (isStrictlySorted!638 l!1036))))

(assert (=> start!88474 e!572525))

(assert (=> start!88474 e!572526))

(assert (=> start!88474 true))

(declare-fun b!1017612 () Bool)

(declare-fun res!682486 () Bool)

(assert (=> b!1017612 (=> (not res!682486) (not e!572525))))

(assert (=> b!1017612 (= res!682486 (isDefined!425 (getValueByKey!577 l!1036 key!271)))))

(declare-fun b!1017613 () Bool)

(declare-fun res!682485 () Bool)

(assert (=> b!1017613 (=> (not res!682485) (not e!572525))))

(get-info :version)

(assert (=> b!1017613 (= res!682485 (and ((_ is Cons!21602) l!1036) (not (= (_1!7707 (h!22800 l!1036)) key!271))))))

(assert (= (and start!88474 res!682484) b!1017612))

(assert (= (and b!1017612 res!682486) b!1017613))

(assert (= (and b!1017613 res!682485) b!1017610))

(assert (= (and b!1017610 res!682487) b!1017611))

(assert (= (and b!1017611 res!682483) b!1017608))

(assert (= (and start!88474 ((_ is Cons!21602) l!1036)) b!1017609))

(declare-fun m!938329 () Bool)

(assert (=> start!88474 m!938329))

(declare-fun m!938331 () Bool)

(assert (=> b!1017608 m!938331))

(declare-fun m!938333 () Bool)

(assert (=> b!1017608 m!938333))

(declare-fun m!938335 () Bool)

(assert (=> b!1017612 m!938335))

(assert (=> b!1017612 m!938335))

(declare-fun m!938337 () Bool)

(assert (=> b!1017612 m!938337))

(declare-fun m!938339 () Bool)

(assert (=> b!1017611 m!938339))

(assert (=> b!1017611 m!938339))

(declare-fun m!938341 () Bool)

(assert (=> b!1017611 m!938341))

(declare-fun m!938343 () Bool)

(assert (=> b!1017610 m!938343))

(check-sat (not b!1017612) (not b!1017610) (not start!88474) tp_is_empty!23665 (not b!1017608) (not b!1017611) (not b!1017609))
(check-sat)
(get-model)

(declare-fun d!121547 () Bool)

(declare-fun res!682526 () Bool)

(declare-fun e!572547 () Bool)

(assert (=> d!121547 (=> res!682526 e!572547)))

(assert (=> d!121547 (= res!682526 (or ((_ is Nil!21603) (t!30598 l!1036)) ((_ is Nil!21603) (t!30598 (t!30598 l!1036)))))))

(assert (=> d!121547 (= (isStrictlySorted!638 (t!30598 l!1036)) e!572547)))

(declare-fun b!1017658 () Bool)

(declare-fun e!572548 () Bool)

(assert (=> b!1017658 (= e!572547 e!572548)))

(declare-fun res!682527 () Bool)

(assert (=> b!1017658 (=> (not res!682527) (not e!572548))))

(assert (=> b!1017658 (= res!682527 (bvslt (_1!7707 (h!22800 (t!30598 l!1036))) (_1!7707 (h!22800 (t!30598 (t!30598 l!1036))))))))

(declare-fun b!1017659 () Bool)

(assert (=> b!1017659 (= e!572548 (isStrictlySorted!638 (t!30598 (t!30598 l!1036))))))

(assert (= (and d!121547 (not res!682526)) b!1017658))

(assert (= (and b!1017658 res!682527) b!1017659))

(declare-fun m!938379 () Bool)

(assert (=> b!1017659 m!938379))

(assert (=> b!1017610 d!121547))

(declare-fun d!121553 () Bool)

(declare-fun res!682530 () Bool)

(declare-fun e!572551 () Bool)

(assert (=> d!121553 (=> res!682530 e!572551)))

(assert (=> d!121553 (= res!682530 (or ((_ is Nil!21603) l!1036) ((_ is Nil!21603) (t!30598 l!1036))))))

(assert (=> d!121553 (= (isStrictlySorted!638 l!1036) e!572551)))

(declare-fun b!1017662 () Bool)

(declare-fun e!572552 () Bool)

(assert (=> b!1017662 (= e!572551 e!572552)))

(declare-fun res!682531 () Bool)

(assert (=> b!1017662 (=> (not res!682531) (not e!572552))))

(assert (=> b!1017662 (= res!682531 (bvslt (_1!7707 (h!22800 l!1036)) (_1!7707 (h!22800 (t!30598 l!1036)))))))

(declare-fun b!1017663 () Bool)

(assert (=> b!1017663 (= e!572552 (isStrictlySorted!638 (t!30598 l!1036)))))

(assert (= (and d!121553 (not res!682530)) b!1017662))

(assert (= (and b!1017662 res!682531) b!1017663))

(assert (=> b!1017663 m!938343))

(assert (=> start!88474 d!121553))

(declare-fun d!121557 () Bool)

(declare-fun isEmpty!920 (Option!628) Bool)

(assert (=> d!121557 (= (isDefined!425 (getValueByKey!577 (t!30598 l!1036) key!271)) (not (isEmpty!920 (getValueByKey!577 (t!30598 l!1036) key!271))))))

(declare-fun bs!29599 () Bool)

(assert (= bs!29599 d!121557))

(assert (=> bs!29599 m!938339))

(declare-fun m!938383 () Bool)

(assert (=> bs!29599 m!938383))

(assert (=> b!1017611 d!121557))

(declare-fun b!1017703 () Bool)

(declare-fun e!572572 () Option!628)

(assert (=> b!1017703 (= e!572572 None!626)))

(declare-fun d!121561 () Bool)

(declare-fun c!103042 () Bool)

(assert (=> d!121561 (= c!103042 (and ((_ is Cons!21602) (t!30598 l!1036)) (= (_1!7707 (h!22800 (t!30598 l!1036))) key!271)))))

(declare-fun e!572571 () Option!628)

(assert (=> d!121561 (= (getValueByKey!577 (t!30598 l!1036) key!271) e!572571)))

(declare-fun b!1017700 () Bool)

(assert (=> b!1017700 (= e!572571 (Some!627 (_2!7707 (h!22800 (t!30598 l!1036)))))))

(declare-fun b!1017702 () Bool)

(assert (=> b!1017702 (= e!572572 (getValueByKey!577 (t!30598 (t!30598 l!1036)) key!271))))

(declare-fun b!1017701 () Bool)

(assert (=> b!1017701 (= e!572571 e!572572)))

(declare-fun c!103043 () Bool)

(assert (=> b!1017701 (= c!103043 (and ((_ is Cons!21602) (t!30598 l!1036)) (not (= (_1!7707 (h!22800 (t!30598 l!1036))) key!271))))))

(assert (= (and d!121561 c!103042) b!1017700))

(assert (= (and d!121561 (not c!103042)) b!1017701))

(assert (= (and b!1017701 c!103043) b!1017702))

(assert (= (and b!1017701 (not c!103043)) b!1017703))

(declare-fun m!938391 () Bool)

(assert (=> b!1017702 m!938391))

(assert (=> b!1017611 d!121561))

(declare-fun d!121573 () Bool)

(assert (=> d!121573 (= (isDefined!425 (getValueByKey!577 l!1036 key!271)) (not (isEmpty!920 (getValueByKey!577 l!1036 key!271))))))

(declare-fun bs!29602 () Bool)

(assert (= bs!29602 d!121573))

(assert (=> bs!29602 m!938335))

(declare-fun m!938393 () Bool)

(assert (=> bs!29602 m!938393))

(assert (=> b!1017612 d!121573))

(declare-fun b!1017711 () Bool)

(declare-fun e!572577 () Option!628)

(assert (=> b!1017711 (= e!572577 None!626)))

(declare-fun d!121575 () Bool)

(declare-fun c!103046 () Bool)

(assert (=> d!121575 (= c!103046 (and ((_ is Cons!21602) l!1036) (= (_1!7707 (h!22800 l!1036)) key!271)))))

(declare-fun e!572575 () Option!628)

(assert (=> d!121575 (= (getValueByKey!577 l!1036 key!271) e!572575)))

(declare-fun b!1017708 () Bool)

(assert (=> b!1017708 (= e!572575 (Some!627 (_2!7707 (h!22800 l!1036))))))

(declare-fun b!1017710 () Bool)

(assert (=> b!1017710 (= e!572577 (getValueByKey!577 (t!30598 l!1036) key!271))))

(declare-fun b!1017709 () Bool)

(assert (=> b!1017709 (= e!572575 e!572577)))

(declare-fun c!103047 () Bool)

(assert (=> b!1017709 (= c!103047 (and ((_ is Cons!21602) l!1036) (not (= (_1!7707 (h!22800 l!1036)) key!271))))))

(assert (= (and d!121575 c!103046) b!1017708))

(assert (= (and d!121575 (not c!103046)) b!1017709))

(assert (= (and b!1017709 c!103047) b!1017710))

(assert (= (and b!1017709 (not c!103047)) b!1017711))

(assert (=> b!1017710 m!938339))

(assert (=> b!1017612 d!121575))

(declare-fun d!121579 () Bool)

(declare-fun lt!449274 () Int)

(assert (=> d!121579 (>= lt!449274 0)))

(declare-fun e!572590 () Int)

(assert (=> d!121579 (= lt!449274 e!572590)))

(declare-fun c!103055 () Bool)

(assert (=> d!121579 (= c!103055 ((_ is Nil!21603) (t!30598 l!1036)))))

(assert (=> d!121579 (= (ListPrimitiveSize!130 (t!30598 l!1036)) lt!449274)))

(declare-fun b!1017732 () Bool)

(assert (=> b!1017732 (= e!572590 0)))

(declare-fun b!1017733 () Bool)

(assert (=> b!1017733 (= e!572590 (+ 1 (ListPrimitiveSize!130 (t!30598 (t!30598 l!1036)))))))

(assert (= (and d!121579 c!103055) b!1017732))

(assert (= (and d!121579 (not c!103055)) b!1017733))

(declare-fun m!938401 () Bool)

(assert (=> b!1017733 m!938401))

(assert (=> b!1017608 d!121579))

(declare-fun d!121585 () Bool)

(declare-fun lt!449276 () Int)

(assert (=> d!121585 (>= lt!449276 0)))

(declare-fun e!572592 () Int)

(assert (=> d!121585 (= lt!449276 e!572592)))

(declare-fun c!103057 () Bool)

(assert (=> d!121585 (= c!103057 ((_ is Nil!21603) l!1036))))

(assert (=> d!121585 (= (ListPrimitiveSize!130 l!1036) lt!449276)))

(declare-fun b!1017736 () Bool)

(assert (=> b!1017736 (= e!572592 0)))

(declare-fun b!1017737 () Bool)

(assert (=> b!1017737 (= e!572592 (+ 1 (ListPrimitiveSize!130 (t!30598 l!1036))))))

(assert (= (and d!121585 c!103057) b!1017736))

(assert (= (and d!121585 (not c!103057)) b!1017737))

(assert (=> b!1017737 m!938331))

(assert (=> b!1017608 d!121585))

(declare-fun b!1017750 () Bool)

(declare-fun e!572600 () Bool)

(declare-fun tp!70948 () Bool)

(assert (=> b!1017750 (= e!572600 (and tp_is_empty!23665 tp!70948))))

(assert (=> b!1017609 (= tp!70937 e!572600)))

(assert (= (and b!1017609 ((_ is Cons!21602) (t!30598 l!1036))) b!1017750))

(check-sat (not b!1017733) (not b!1017663) tp_is_empty!23665 (not b!1017710) (not b!1017750) (not b!1017702) (not d!121573) (not b!1017737) (not d!121557) (not b!1017659))
(check-sat)
