; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87610 () Bool)

(assert start!87610)

(declare-fun res!680548 () Bool)

(declare-fun e!570398 () Bool)

(assert (=> start!87610 (=> (not res!680548) (not e!570398))))

(declare-datatypes ((B!1346 0))(
  ( (B!1347 (val!11757 Int)) )
))
(declare-datatypes ((tuple2!15064 0))(
  ( (tuple2!15065 (_1!7543 (_ BitVec 64)) (_2!7543 B!1346)) )
))
(declare-datatypes ((List!21350 0))(
  ( (Nil!21347) (Cons!21346 (h!22553 tuple2!15064) (t!30343 List!21350)) )
))
(declare-fun l!412 () List!21350)

(declare-fun isStrictlySorted!525 (List!21350) Bool)

(assert (=> start!87610 (= res!680548 (isStrictlySorted!525 l!412))))

(assert (=> start!87610 e!570398))

(declare-fun e!570399 () Bool)

(assert (=> start!87610 e!570399))

(declare-fun tp_is_empty!23413 () Bool)

(assert (=> start!87610 tp_is_empty!23413))

(declare-fun b!1013771 () Bool)

(declare-fun res!680549 () Bool)

(assert (=> b!1013771 (=> (not res!680549) (not e!570398))))

(declare-fun value!115 () B!1346)

(get-info :version)

(assert (=> b!1013771 (= res!680549 (and (not (= (_2!7543 (h!22553 l!412)) value!115)) ((_ is Cons!21346) l!412)))))

(declare-fun b!1013772 () Bool)

(assert (=> b!1013772 (= e!570398 (not (isStrictlySorted!525 (t!30343 l!412))))))

(declare-datatypes ((List!21351 0))(
  ( (Nil!21348) (Cons!21347 (h!22554 (_ BitVec 64)) (t!30344 List!21351)) )
))
(declare-fun lt!447986 () List!21351)

(declare-fun getKeysOf!19 (List!21350 B!1346) List!21351)

(assert (=> b!1013772 (= lt!447986 (getKeysOf!19 (t!30343 l!412) value!115))))

(declare-fun b!1013773 () Bool)

(declare-fun tp!70302 () Bool)

(assert (=> b!1013773 (= e!570399 (and tp_is_empty!23413 tp!70302))))

(assert (= (and start!87610 res!680548) b!1013771))

(assert (= (and b!1013771 res!680549) b!1013772))

(assert (= (and start!87610 ((_ is Cons!21346) l!412)) b!1013773))

(declare-fun m!937673 () Bool)

(assert (=> start!87610 m!937673))

(declare-fun m!937675 () Bool)

(assert (=> b!1013772 m!937675))

(declare-fun m!937677 () Bool)

(assert (=> b!1013772 m!937677))

(check-sat (not b!1013772) (not start!87610) (not b!1013773) tp_is_empty!23413)
(check-sat)
(get-model)

(declare-fun d!120771 () Bool)

(declare-fun res!680572 () Bool)

(declare-fun e!570422 () Bool)

(assert (=> d!120771 (=> res!680572 e!570422)))

(assert (=> d!120771 (= res!680572 (or ((_ is Nil!21347) (t!30343 l!412)) ((_ is Nil!21347) (t!30343 (t!30343 l!412)))))))

(assert (=> d!120771 (= (isStrictlySorted!525 (t!30343 l!412)) e!570422)))

(declare-fun b!1013800 () Bool)

(declare-fun e!570423 () Bool)

(assert (=> b!1013800 (= e!570422 e!570423)))

(declare-fun res!680573 () Bool)

(assert (=> b!1013800 (=> (not res!680573) (not e!570423))))

(assert (=> b!1013800 (= res!680573 (bvslt (_1!7543 (h!22553 (t!30343 l!412))) (_1!7543 (h!22553 (t!30343 (t!30343 l!412))))))))

(declare-fun b!1013801 () Bool)

(assert (=> b!1013801 (= e!570423 (isStrictlySorted!525 (t!30343 (t!30343 l!412))))))

(assert (= (and d!120771 (not res!680572)) b!1013800))

(assert (= (and b!1013800 res!680573) b!1013801))

(declare-fun m!937691 () Bool)

(assert (=> b!1013801 m!937691))

(assert (=> b!1013772 d!120771))

(declare-fun b!1013870 () Bool)

(assert (=> b!1013870 true))

(assert (=> b!1013870 true))

(assert (=> b!1013870 true))

(declare-fun bs!28842 () Bool)

(declare-fun b!1013875 () Bool)

(assert (= bs!28842 (and b!1013875 b!1013870)))

(declare-fun lt!448085 () List!21350)

(declare-fun lt!448079 () tuple2!15064)

(declare-fun lt!448080 () tuple2!15064)

(declare-fun lt!448077 () List!21350)

(declare-fun lambda!367 () Int)

(declare-fun lambda!370 () Int)

(assert (=> bs!28842 (= (= (Cons!21346 lt!448079 lt!448085) (Cons!21346 lt!448080 lt!448077)) (= lambda!370 lambda!367))))

(assert (=> b!1013875 true))

(assert (=> b!1013875 true))

(assert (=> b!1013875 true))

(declare-fun bs!28844 () Bool)

(declare-fun d!120777 () Bool)

(assert (= bs!28844 (and d!120777 b!1013870)))

(declare-fun lambda!372 () Int)

(assert (=> bs!28844 (= (= (t!30343 l!412) (Cons!21346 lt!448080 lt!448077)) (= lambda!372 lambda!367))))

(declare-fun bs!28846 () Bool)

(assert (= bs!28846 (and d!120777 b!1013875)))

(assert (=> bs!28846 (= (= (t!30343 l!412) (Cons!21346 lt!448079 lt!448085)) (= lambda!372 lambda!370))))

(assert (=> d!120777 true))

(assert (=> d!120777 true))

(declare-fun bm!42606 () Bool)

(declare-fun call!42612 () Bool)

(declare-fun call!42610 () List!21351)

(declare-fun isEmpty!798 (List!21351) Bool)

(assert (=> bm!42606 (= call!42612 (isEmpty!798 call!42610))))

(declare-fun lt!448081 () List!21351)

(declare-fun lt!448088 () List!21351)

(declare-fun call!42609 () Bool)

(declare-fun bm!42607 () Bool)

(declare-fun c!102722 () Bool)

(declare-fun forall!213 (List!21351 Int) Bool)

(assert (=> bm!42607 (= call!42609 (forall!213 (ite c!102722 lt!448088 lt!448081) (ite c!102722 lambda!367 lambda!370)))))

(declare-fun b!1013868 () Bool)

(declare-fun e!570460 () List!21351)

(declare-fun e!570463 () List!21351)

(assert (=> b!1013868 (= e!570460 e!570463)))

(declare-fun c!102723 () Bool)

(assert (=> b!1013868 (= c!102723 (and ((_ is Cons!21346) (t!30343 l!412)) (not (= (_2!7543 (h!22553 (t!30343 l!412))) value!115))))))

(declare-fun b!1013869 () Bool)

(assert (=> b!1013869 (= e!570463 Nil!21348)))

(declare-fun bm!42608 () Bool)

(assert (=> bm!42608 (= call!42610 (getKeysOf!19 (t!30343 (t!30343 l!412)) value!115))))

(assert (=> b!1013870 call!42609))

(declare-datatypes ((Unit!33064 0))(
  ( (Unit!33066) )
))
(declare-fun lt!448086 () Unit!33064)

(declare-fun call!42611 () Unit!33064)

(assert (=> b!1013870 (= lt!448086 call!42611)))

(assert (=> b!1013870 (= lt!448080 (h!22553 (t!30343 l!412)))))

(assert (=> b!1013870 (= lt!448088 call!42610)))

(assert (=> b!1013870 (= lt!448077 (t!30343 (t!30343 l!412)))))

(declare-fun e!570461 () Unit!33064)

(assert (=> b!1013870 (= e!570461 lt!448086)))

(declare-fun b!1013871 () Bool)

(assert (=> b!1013871 (= e!570460 (Cons!21347 (_1!7543 (h!22553 (t!30343 l!412))) call!42610))))

(declare-fun c!102720 () Bool)

(assert (=> b!1013871 (= c!102720 (not call!42612))))

(declare-fun lt!448084 () Unit!33064)

(assert (=> b!1013871 (= lt!448084 e!570461)))

(declare-fun b!1013873 () Bool)

(declare-fun e!570462 () Unit!33064)

(declare-fun Unit!33067 () Unit!33064)

(assert (=> b!1013873 (= e!570462 Unit!33067)))

(declare-fun bm!42609 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!11 (List!21350 List!21351 B!1346 tuple2!15064) Unit!33064)

(assert (=> bm!42609 (= call!42611 (lemmaForallGetValueByKeySameWithASmallerHead!11 (ite c!102722 lt!448077 lt!448085) (ite c!102722 lt!448088 lt!448081) value!115 (ite c!102722 lt!448080 lt!448079)))))

(declare-fun b!1013874 () Bool)

(declare-fun Unit!33069 () Unit!33064)

(assert (=> b!1013874 (= e!570461 Unit!33069)))

(declare-fun lt!448082 () Unit!33064)

(assert (=> b!1013875 (= e!570462 lt!448082)))

(assert (=> b!1013875 (= lt!448085 (t!30343 (t!30343 l!412)))))

(assert (=> b!1013875 (= lt!448081 call!42610)))

(assert (=> b!1013875 (= lt!448079 (h!22553 (t!30343 l!412)))))

(assert (=> b!1013875 (= lt!448082 call!42611)))

(assert (=> b!1013875 call!42609))

(declare-fun lt!448087 () List!21351)

(assert (=> d!120777 (forall!213 lt!448087 lambda!372)))

(assert (=> d!120777 (= lt!448087 e!570460)))

(assert (=> d!120777 (= c!102722 (and ((_ is Cons!21346) (t!30343 l!412)) (= (_2!7543 (h!22553 (t!30343 l!412))) value!115)))))

(assert (=> d!120777 (isStrictlySorted!525 (t!30343 l!412))))

(assert (=> d!120777 (= (getKeysOf!19 (t!30343 l!412) value!115) lt!448087)))

(declare-fun b!1013872 () Bool)

(declare-fun lt!448083 () Unit!33064)

(assert (=> b!1013872 (= lt!448083 e!570462)))

(declare-fun c!102721 () Bool)

(assert (=> b!1013872 (= c!102721 (not call!42612))))

(declare-fun lt!448078 () List!21351)

(assert (=> b!1013872 (= lt!448078 call!42610)))

(assert (=> b!1013872 (= e!570463 call!42610)))

(assert (= (and d!120777 c!102722) b!1013871))

(assert (= (and d!120777 (not c!102722)) b!1013868))

(assert (= (and b!1013871 c!102720) b!1013870))

(assert (= (and b!1013871 (not c!102720)) b!1013874))

(assert (= (and b!1013868 c!102723) b!1013872))

(assert (= (and b!1013868 (not c!102723)) b!1013869))

(assert (= (and b!1013872 c!102721) b!1013875))

(assert (= (and b!1013872 (not c!102721)) b!1013873))

(assert (= (or b!1013870 b!1013875) bm!42609))

(assert (= (or b!1013870 b!1013875) bm!42607))

(assert (= (or b!1013871 b!1013870 b!1013875 b!1013872) bm!42608))

(assert (= (or b!1013871 b!1013872) bm!42606))

(declare-fun m!937699 () Bool)

(assert (=> bm!42609 m!937699))

(declare-fun m!937703 () Bool)

(assert (=> bm!42607 m!937703))

(declare-fun m!937707 () Bool)

(assert (=> d!120777 m!937707))

(assert (=> d!120777 m!937675))

(declare-fun m!937711 () Bool)

(assert (=> bm!42606 m!937711))

(declare-fun m!937715 () Bool)

(assert (=> bm!42608 m!937715))

(assert (=> b!1013772 d!120777))

(declare-fun d!120786 () Bool)

(declare-fun res!680583 () Bool)

(declare-fun e!570469 () Bool)

(assert (=> d!120786 (=> res!680583 e!570469)))

(assert (=> d!120786 (= res!680583 (or ((_ is Nil!21347) l!412) ((_ is Nil!21347) (t!30343 l!412))))))

(assert (=> d!120786 (= (isStrictlySorted!525 l!412) e!570469)))

(declare-fun b!1013903 () Bool)

(declare-fun e!570471 () Bool)

(assert (=> b!1013903 (= e!570469 e!570471)))

(declare-fun res!680585 () Bool)

(assert (=> b!1013903 (=> (not res!680585) (not e!570471))))

(assert (=> b!1013903 (= res!680585 (bvslt (_1!7543 (h!22553 l!412)) (_1!7543 (h!22553 (t!30343 l!412)))))))

(declare-fun b!1013905 () Bool)

(assert (=> b!1013905 (= e!570471 (isStrictlySorted!525 (t!30343 l!412)))))

(assert (= (and d!120786 (not res!680583)) b!1013903))

(assert (= (and b!1013903 res!680585) b!1013905))

(assert (=> b!1013905 m!937675))

(assert (=> start!87610 d!120786))

(declare-fun b!1013914 () Bool)

(declare-fun e!570476 () Bool)

(declare-fun tp!70313 () Bool)

(assert (=> b!1013914 (= e!570476 (and tp_is_empty!23413 tp!70313))))

(assert (=> b!1013773 (= tp!70302 e!570476)))

(assert (= (and b!1013773 ((_ is Cons!21346) (t!30343 l!412))) b!1013914))

(check-sat (not b!1013801) (not bm!42609) (not bm!42608) (not b!1013905) (not d!120777) (not bm!42607) (not bm!42606) tp_is_empty!23413 (not b!1013914))
(check-sat)
