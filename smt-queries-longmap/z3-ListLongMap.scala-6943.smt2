; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87420 () Bool)

(assert start!87420)

(declare-fun b!1012720 () Bool)

(assert (=> b!1012720 true))

(assert (=> b!1012720 true))

(declare-fun b!1012716 () Bool)

(declare-datatypes ((Unit!32977 0))(
  ( (Unit!32978) )
))
(declare-fun e!569668 () Unit!32977)

(declare-fun Unit!32979 () Unit!32977)

(assert (=> b!1012716 (= e!569668 Unit!32979)))

(declare-fun b!1012717 () Bool)

(declare-fun e!569667 () Bool)

(declare-fun tp_is_empty!23431 () Bool)

(declare-fun tp!70347 () Bool)

(assert (=> b!1012717 (= e!569667 (and tp_is_empty!23431 tp!70347))))

(declare-fun b!1012718 () Bool)

(declare-fun res!680125 () Bool)

(declare-fun e!569669 () Bool)

(assert (=> b!1012718 (=> (not res!680125) (not e!569669))))

(declare-datatypes ((B!1364 0))(
  ( (B!1365 (val!11766 Int)) )
))
(declare-datatypes ((tuple2!15158 0))(
  ( (tuple2!15159 (_1!7590 (_ BitVec 64)) (_2!7590 B!1364)) )
))
(declare-datatypes ((List!21414 0))(
  ( (Nil!21411) (Cons!21410 (h!22608 tuple2!15158) (t!30406 List!21414)) )
))
(declare-fun l!412 () List!21414)

(declare-fun value!115 () B!1364)

(get-info :version)

(assert (=> b!1012718 (= res!680125 (and (not (= (_2!7590 (h!22608 l!412)) value!115)) ((_ is Cons!21410) l!412)))))

(declare-fun res!680126 () Bool)

(assert (=> start!87420 (=> (not res!680126) (not e!569669))))

(declare-fun isStrictlySorted!542 (List!21414) Bool)

(assert (=> start!87420 (= res!680126 (isStrictlySorted!542 l!412))))

(assert (=> start!87420 e!569669))

(assert (=> start!87420 e!569667))

(assert (=> start!87420 tp_is_empty!23431))

(declare-fun b!1012719 () Bool)

(assert (=> b!1012719 (= e!569669 (not (isStrictlySorted!542 (t!30406 l!412))))))

(declare-fun lt!447509 () Unit!32977)

(assert (=> b!1012719 (= lt!447509 e!569668)))

(declare-fun c!102319 () Bool)

(declare-datatypes ((List!21415 0))(
  ( (Nil!21412) (Cons!21411 (h!22609 (_ BitVec 64)) (t!30407 List!21415)) )
))
(declare-fun lt!447511 () List!21415)

(declare-fun isEmpty!809 (List!21415) Bool)

(assert (=> b!1012719 (= c!102319 (not (isEmpty!809 lt!447511)))))

(declare-fun getKeysOf!28 (List!21414 B!1364) List!21415)

(assert (=> b!1012719 (= lt!447511 (getKeysOf!28 (t!30406 l!412) value!115))))

(declare-fun lt!447510 () Unit!32977)

(assert (=> b!1012720 (= e!569668 lt!447510)))

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!19 (List!21414 List!21415 B!1364 tuple2!15158) Unit!32977)

(assert (=> b!1012720 (= lt!447510 (lemmaForallGetValueByKeySameWithASmallerHead!19 (t!30406 l!412) lt!447511 value!115 (h!22608 l!412)))))

(declare-fun lambda!419 () Int)

(declare-fun forall!224 (List!21415 Int) Bool)

(assert (=> b!1012720 (forall!224 lt!447511 lambda!419)))

(assert (= (and start!87420 res!680126) b!1012718))

(assert (= (and b!1012718 res!680125) b!1012719))

(assert (= (and b!1012719 c!102319) b!1012720))

(assert (= (and b!1012719 (not c!102319)) b!1012716))

(assert (= (and start!87420 ((_ is Cons!21410) l!412)) b!1012717))

(declare-fun m!935545 () Bool)

(assert (=> start!87420 m!935545))

(declare-fun m!935547 () Bool)

(assert (=> b!1012719 m!935547))

(declare-fun m!935549 () Bool)

(assert (=> b!1012719 m!935549))

(declare-fun m!935551 () Bool)

(assert (=> b!1012719 m!935551))

(declare-fun m!935553 () Bool)

(assert (=> b!1012720 m!935553))

(declare-fun m!935555 () Bool)

(assert (=> b!1012720 m!935555))

(check-sat tp_is_empty!23431 (not start!87420) (not b!1012720) (not b!1012717) (not b!1012719))
(check-sat)
(get-model)

(declare-fun d!120205 () Bool)

(declare-fun res!680143 () Bool)

(declare-fun e!569692 () Bool)

(assert (=> d!120205 (=> res!680143 e!569692)))

(assert (=> d!120205 (= res!680143 (or ((_ is Nil!21411) (t!30406 l!412)) ((_ is Nil!21411) (t!30406 (t!30406 l!412)))))))

(assert (=> d!120205 (= (isStrictlySorted!542 (t!30406 l!412)) e!569692)))

(declare-fun b!1012767 () Bool)

(declare-fun e!569693 () Bool)

(assert (=> b!1012767 (= e!569692 e!569693)))

(declare-fun res!680144 () Bool)

(assert (=> b!1012767 (=> (not res!680144) (not e!569693))))

(assert (=> b!1012767 (= res!680144 (bvslt (_1!7590 (h!22608 (t!30406 l!412))) (_1!7590 (h!22608 (t!30406 (t!30406 l!412))))))))

(declare-fun b!1012768 () Bool)

(assert (=> b!1012768 (= e!569693 (isStrictlySorted!542 (t!30406 (t!30406 l!412))))))

(assert (= (and d!120205 (not res!680143)) b!1012767))

(assert (= (and b!1012767 res!680144) b!1012768))

(declare-fun m!935581 () Bool)

(assert (=> b!1012768 m!935581))

(assert (=> b!1012719 d!120205))

(declare-fun d!120211 () Bool)

(assert (=> d!120211 (= (isEmpty!809 lt!447511) ((_ is Nil!21412) lt!447511))))

(assert (=> b!1012719 d!120211))

(declare-fun bs!28828 () Bool)

(declare-fun b!1012864 () Bool)

(assert (= bs!28828 (and b!1012864 b!1012720)))

(declare-fun lambda!457 () Int)

(declare-fun lt!447625 () tuple2!15158)

(declare-fun lt!447624 () List!21414)

(assert (=> bs!28828 (= (= (Cons!21410 lt!447625 lt!447624) l!412) (= lambda!457 lambda!419))))

(assert (=> b!1012864 true))

(assert (=> b!1012864 true))

(assert (=> b!1012864 true))

(declare-fun bs!28829 () Bool)

(declare-fun b!1012871 () Bool)

(assert (= bs!28829 (and b!1012871 b!1012720)))

(declare-fun lt!447619 () tuple2!15158)

(declare-fun lambda!458 () Int)

(declare-fun lt!447628 () List!21414)

(assert (=> bs!28829 (= (= (Cons!21410 lt!447619 lt!447628) l!412) (= lambda!458 lambda!419))))

(declare-fun bs!28832 () Bool)

(assert (= bs!28832 (and b!1012871 b!1012864)))

(assert (=> bs!28832 (= (= (Cons!21410 lt!447619 lt!447628) (Cons!21410 lt!447625 lt!447624)) (= lambda!458 lambda!457))))

(assert (=> b!1012871 true))

(assert (=> b!1012871 true))

(assert (=> b!1012871 true))

(declare-fun bs!28836 () Bool)

(declare-fun d!120213 () Bool)

(assert (= bs!28836 (and d!120213 b!1012720)))

(declare-fun lambda!461 () Int)

(assert (=> bs!28836 (= (= (t!30406 l!412) l!412) (= lambda!461 lambda!419))))

(declare-fun bs!28840 () Bool)

(assert (= bs!28840 (and d!120213 b!1012864)))

(assert (=> bs!28840 (= (= (t!30406 l!412) (Cons!21410 lt!447625 lt!447624)) (= lambda!461 lambda!457))))

(declare-fun bs!28842 () Bool)

(assert (= bs!28842 (and d!120213 b!1012871)))

(assert (=> bs!28842 (= (= (t!30406 l!412) (Cons!21410 lt!447619 lt!447628)) (= lambda!461 lambda!458))))

(assert (=> d!120213 true))

(assert (=> d!120213 true))

(declare-fun bm!42588 () Bool)

(declare-fun call!42594 () List!21415)

(assert (=> bm!42588 (= call!42594 (getKeysOf!28 (t!30406 (t!30406 l!412)) value!115))))

(declare-fun b!1012865 () Bool)

(declare-fun lt!447629 () Unit!32977)

(declare-fun e!569749 () Unit!32977)

(assert (=> b!1012865 (= lt!447629 e!569749)))

(declare-fun c!102357 () Bool)

(declare-fun call!42593 () Bool)

(assert (=> b!1012865 (= c!102357 (not call!42593))))

(declare-fun lt!447620 () List!21415)

(assert (=> b!1012865 (= lt!447620 call!42594)))

(declare-fun e!569750 () List!21415)

(assert (=> b!1012865 (= e!569750 call!42594)))

(declare-fun c!102354 () Bool)

(declare-fun lt!447621 () List!21415)

(declare-fun call!42592 () Bool)

(declare-fun lt!447627 () List!21415)

(declare-fun bm!42589 () Bool)

(assert (=> bm!42589 (= call!42592 (forall!224 (ite c!102354 lt!447627 lt!447621) (ite c!102354 lambda!457 lambda!458)))))

(declare-fun call!42591 () Unit!32977)

(declare-fun bm!42590 () Bool)

(assert (=> bm!42590 (= call!42591 (lemmaForallGetValueByKeySameWithASmallerHead!19 (ite c!102354 lt!447624 lt!447628) (ite c!102354 lt!447627 lt!447621) value!115 (ite c!102354 lt!447625 lt!447619)))))

(declare-fun b!1012866 () Bool)

(declare-fun Unit!32988 () Unit!32977)

(assert (=> b!1012866 (= e!569749 Unit!32988)))

(declare-fun b!1012867 () Bool)

(declare-fun e!569748 () List!21415)

(assert (=> b!1012867 (= e!569748 e!569750)))

(declare-fun c!102355 () Bool)

(assert (=> b!1012867 (= c!102355 (and ((_ is Cons!21410) (t!30406 l!412)) (not (= (_2!7590 (h!22608 (t!30406 l!412))) value!115))))))

(declare-fun b!1012868 () Bool)

(assert (=> b!1012868 (= e!569750 Nil!21412)))

(declare-fun bm!42591 () Bool)

(assert (=> bm!42591 (= call!42593 (isEmpty!809 call!42594))))

(declare-fun b!1012869 () Bool)

(assert (=> b!1012869 (= e!569748 (Cons!21411 (_1!7590 (h!22608 (t!30406 l!412))) call!42594))))

(declare-fun c!102356 () Bool)

(assert (=> b!1012869 (= c!102356 (not call!42593))))

(declare-fun lt!447630 () Unit!32977)

(declare-fun e!569747 () Unit!32977)

(assert (=> b!1012869 (= lt!447630 e!569747)))

(assert (=> b!1012864 call!42592))

(declare-fun lt!447622 () Unit!32977)

(assert (=> b!1012864 (= lt!447622 call!42591)))

(assert (=> b!1012864 (= lt!447625 (h!22608 (t!30406 l!412)))))

(assert (=> b!1012864 (= lt!447627 call!42594)))

(assert (=> b!1012864 (= lt!447624 (t!30406 (t!30406 l!412)))))

(assert (=> b!1012864 (= e!569747 lt!447622)))

(declare-fun lt!447626 () List!21415)

(assert (=> d!120213 (forall!224 lt!447626 lambda!461)))

(assert (=> d!120213 (= lt!447626 e!569748)))

(assert (=> d!120213 (= c!102354 (and ((_ is Cons!21410) (t!30406 l!412)) (= (_2!7590 (h!22608 (t!30406 l!412))) value!115)))))

(assert (=> d!120213 (isStrictlySorted!542 (t!30406 l!412))))

(assert (=> d!120213 (= (getKeysOf!28 (t!30406 l!412) value!115) lt!447626)))

(declare-fun b!1012870 () Bool)

(declare-fun Unit!32989 () Unit!32977)

(assert (=> b!1012870 (= e!569747 Unit!32989)))

(declare-fun lt!447623 () Unit!32977)

(assert (=> b!1012871 (= e!569749 lt!447623)))

(assert (=> b!1012871 (= lt!447628 (t!30406 (t!30406 l!412)))))

(assert (=> b!1012871 (= lt!447621 call!42594)))

(assert (=> b!1012871 (= lt!447619 (h!22608 (t!30406 l!412)))))

(assert (=> b!1012871 (= lt!447623 call!42591)))

(assert (=> b!1012871 call!42592))

(assert (= (and d!120213 c!102354) b!1012869))

(assert (= (and d!120213 (not c!102354)) b!1012867))

(assert (= (and b!1012869 c!102356) b!1012864))

(assert (= (and b!1012869 (not c!102356)) b!1012870))

(assert (= (and b!1012867 c!102355) b!1012865))

(assert (= (and b!1012867 (not c!102355)) b!1012868))

(assert (= (and b!1012865 c!102357) b!1012871))

(assert (= (and b!1012865 (not c!102357)) b!1012866))

(assert (= (or b!1012864 b!1012871) bm!42590))

(assert (= (or b!1012864 b!1012871) bm!42589))

(assert (= (or b!1012869 b!1012864 b!1012865 b!1012871) bm!42588))

(assert (= (or b!1012869 b!1012865) bm!42591))

(declare-fun m!935621 () Bool)

(assert (=> d!120213 m!935621))

(assert (=> d!120213 m!935547))

(declare-fun m!935623 () Bool)

(assert (=> bm!42589 m!935623))

(declare-fun m!935625 () Bool)

(assert (=> bm!42590 m!935625))

(declare-fun m!935627 () Bool)

(assert (=> bm!42591 m!935627))

(declare-fun m!935629 () Bool)

(assert (=> bm!42588 m!935629))

(assert (=> b!1012719 d!120213))

(declare-fun bs!28857 () Bool)

(declare-fun b!1012910 () Bool)

(assert (= bs!28857 (and b!1012910 b!1012720)))

(declare-fun lambda!469 () Int)

(assert (=> bs!28857 (= (= (t!30406 l!412) l!412) (= lambda!469 lambda!419))))

(declare-fun bs!28858 () Bool)

(assert (= bs!28858 (and b!1012910 b!1012864)))

(assert (=> bs!28858 (= (= (t!30406 l!412) (Cons!21410 lt!447625 lt!447624)) (= lambda!469 lambda!457))))

(declare-fun bs!28859 () Bool)

(assert (= bs!28859 (and b!1012910 b!1012871)))

(assert (=> bs!28859 (= (= (t!30406 l!412) (Cons!21410 lt!447619 lt!447628)) (= lambda!469 lambda!458))))

(declare-fun bs!28860 () Bool)

(assert (= bs!28860 (and b!1012910 d!120213)))

(assert (=> bs!28860 (= lambda!469 lambda!461)))

(assert (=> b!1012910 true))

(assert (=> b!1012910 true))

(declare-fun bs!28861 () Bool)

(declare-fun d!120233 () Bool)

(assert (= bs!28861 (and d!120233 b!1012910)))

(declare-fun lambda!470 () Int)

(assert (=> bs!28861 (= (= (Cons!21410 (h!22608 l!412) (t!30406 l!412)) (t!30406 l!412)) (= lambda!470 lambda!469))))

(declare-fun bs!28862 () Bool)

(assert (= bs!28862 (and d!120233 b!1012871)))

(assert (=> bs!28862 (= (= (Cons!21410 (h!22608 l!412) (t!30406 l!412)) (Cons!21410 lt!447619 lt!447628)) (= lambda!470 lambda!458))))

(declare-fun bs!28863 () Bool)

(assert (= bs!28863 (and d!120233 d!120213)))

(assert (=> bs!28863 (= (= (Cons!21410 (h!22608 l!412) (t!30406 l!412)) (t!30406 l!412)) (= lambda!470 lambda!461))))

(declare-fun bs!28864 () Bool)

(assert (= bs!28864 (and d!120233 b!1012864)))

(assert (=> bs!28864 (= (= (Cons!21410 (h!22608 l!412) (t!30406 l!412)) (Cons!21410 lt!447625 lt!447624)) (= lambda!470 lambda!457))))

(declare-fun bs!28865 () Bool)

(assert (= bs!28865 (and d!120233 b!1012720)))

(assert (=> bs!28865 (= (= (Cons!21410 (h!22608 l!412) (t!30406 l!412)) l!412) (= lambda!470 lambda!419))))

(assert (=> d!120233 true))

(assert (=> d!120233 true))

(assert (=> d!120233 true))

(assert (=> d!120233 (forall!224 lt!447511 lambda!470)))

(declare-fun lt!447646 () Unit!32977)

(declare-fun choose!1637 (List!21414 List!21415 B!1364 tuple2!15158) Unit!32977)

(assert (=> d!120233 (= lt!447646 (choose!1637 (t!30406 l!412) lt!447511 value!115 (h!22608 l!412)))))

(declare-fun e!569772 () Bool)

(assert (=> d!120233 e!569772))

(declare-fun res!680198 () Bool)

(assert (=> d!120233 (=> (not res!680198) (not e!569772))))

(assert (=> d!120233 (= res!680198 (isStrictlySorted!542 (t!30406 l!412)))))

(assert (=> d!120233 (= (lemmaForallGetValueByKeySameWithASmallerHead!19 (t!30406 l!412) lt!447511 value!115 (h!22608 l!412)) lt!447646)))

(declare-fun b!1012909 () Bool)

(declare-fun res!680199 () Bool)

(assert (=> b!1012909 (=> (not res!680199) (not e!569772))))

(declare-fun isEmpty!814 (List!21414) Bool)

(assert (=> b!1012909 (= res!680199 (not (isEmpty!814 (t!30406 l!412))))))

(declare-fun res!680197 () Bool)

(assert (=> b!1012910 (=> (not res!680197) (not e!569772))))

(assert (=> b!1012910 (= res!680197 (forall!224 lt!447511 lambda!469))))

(declare-fun b!1012911 () Bool)

(declare-fun head!931 (List!21414) tuple2!15158)

(assert (=> b!1012911 (= e!569772 (bvslt (_1!7590 (h!22608 l!412)) (_1!7590 (head!931 (t!30406 l!412)))))))

(assert (= (and d!120233 res!680198) b!1012909))

(assert (= (and b!1012909 res!680199) b!1012910))

(assert (= (and b!1012910 res!680197) b!1012911))

(declare-fun m!935649 () Bool)

(assert (=> d!120233 m!935649))

(declare-fun m!935651 () Bool)

(assert (=> d!120233 m!935651))

(assert (=> d!120233 m!935547))

(declare-fun m!935653 () Bool)

(assert (=> b!1012909 m!935653))

(declare-fun m!935655 () Bool)

(assert (=> b!1012910 m!935655))

(declare-fun m!935657 () Bool)

(assert (=> b!1012911 m!935657))

(assert (=> b!1012720 d!120233))

(declare-fun d!120241 () Bool)

(declare-fun res!680204 () Bool)

(declare-fun e!569777 () Bool)

(assert (=> d!120241 (=> res!680204 e!569777)))

(assert (=> d!120241 (= res!680204 ((_ is Nil!21412) lt!447511))))

(assert (=> d!120241 (= (forall!224 lt!447511 lambda!419) e!569777)))

(declare-fun b!1012916 () Bool)

(declare-fun e!569778 () Bool)

(assert (=> b!1012916 (= e!569777 e!569778)))

(declare-fun res!680205 () Bool)

(assert (=> b!1012916 (=> (not res!680205) (not e!569778))))

(declare-fun dynLambda!1873 (Int (_ BitVec 64)) Bool)

(assert (=> b!1012916 (= res!680205 (dynLambda!1873 lambda!419 (h!22609 lt!447511)))))

(declare-fun b!1012917 () Bool)

(assert (=> b!1012917 (= e!569778 (forall!224 (t!30407 lt!447511) lambda!419))))

(assert (= (and d!120241 (not res!680204)) b!1012916))

(assert (= (and b!1012916 res!680205) b!1012917))

(declare-fun b_lambda!15231 () Bool)

(assert (=> (not b_lambda!15231) (not b!1012916)))

(declare-fun m!935659 () Bool)

(assert (=> b!1012916 m!935659))

(declare-fun m!935661 () Bool)

(assert (=> b!1012917 m!935661))

(assert (=> b!1012720 d!120241))

(declare-fun d!120243 () Bool)

(declare-fun res!680206 () Bool)

(declare-fun e!569779 () Bool)

(assert (=> d!120243 (=> res!680206 e!569779)))

(assert (=> d!120243 (= res!680206 (or ((_ is Nil!21411) l!412) ((_ is Nil!21411) (t!30406 l!412))))))

(assert (=> d!120243 (= (isStrictlySorted!542 l!412) e!569779)))

(declare-fun b!1012918 () Bool)

(declare-fun e!569780 () Bool)

(assert (=> b!1012918 (= e!569779 e!569780)))

(declare-fun res!680207 () Bool)

(assert (=> b!1012918 (=> (not res!680207) (not e!569780))))

(assert (=> b!1012918 (= res!680207 (bvslt (_1!7590 (h!22608 l!412)) (_1!7590 (h!22608 (t!30406 l!412)))))))

(declare-fun b!1012919 () Bool)

(assert (=> b!1012919 (= e!569780 (isStrictlySorted!542 (t!30406 l!412)))))

(assert (= (and d!120243 (not res!680206)) b!1012918))

(assert (= (and b!1012918 res!680207) b!1012919))

(assert (=> b!1012919 m!935547))

(assert (=> start!87420 d!120243))

(declare-fun b!1012924 () Bool)

(declare-fun e!569783 () Bool)

(declare-fun tp!70362 () Bool)

(assert (=> b!1012924 (= e!569783 (and tp_is_empty!23431 tp!70362))))

(assert (=> b!1012717 (= tp!70347 e!569783)))

(assert (= (and b!1012717 ((_ is Cons!21410) (t!30406 l!412))) b!1012924))

(declare-fun b_lambda!15233 () Bool)

(assert (= b_lambda!15231 (or b!1012720 b_lambda!15233)))

(declare-fun bs!28866 () Bool)

(declare-fun d!120245 () Bool)

(assert (= bs!28866 (and d!120245 b!1012720)))

(declare-datatypes ((Option!572 0))(
  ( (Some!571 (v!14419 B!1364)) (None!570) )
))
(declare-fun getValueByKey!521 (List!21414 (_ BitVec 64)) Option!572)

(assert (=> bs!28866 (= (dynLambda!1873 lambda!419 (h!22609 lt!447511)) (= (getValueByKey!521 l!412 (h!22609 lt!447511)) (Some!571 value!115)))))

(declare-fun m!935663 () Bool)

(assert (=> bs!28866 m!935663))

(assert (=> b!1012916 d!120245))

(check-sat (not b!1012909) (not b!1012910) (not b!1012768) (not b!1012924) (not d!120233) (not d!120213) (not b!1012911) (not b!1012917) (not b_lambda!15233) (not bm!42589) (not bm!42588) (not bm!42590) tp_is_empty!23431 (not b!1012919) (not bs!28866) (not bm!42591))
(check-sat)
