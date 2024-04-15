; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87798 () Bool)

(assert start!87798)

(declare-fun b!1014790 () Bool)

(assert (=> b!1014790 true))

(assert (=> b!1014790 true))

(declare-fun b!1014789 () Bool)

(declare-fun e!570864 () Bool)

(declare-fun tp_is_empty!23515 () Bool)

(declare-fun tp!70575 () Bool)

(assert (=> b!1014789 (= e!570864 (and tp_is_empty!23515 tp!70575))))

(declare-fun res!680866 () Bool)

(declare-fun e!570866 () Bool)

(assert (=> start!87798 (=> (not res!680866) (not e!570866))))

(declare-datatypes ((B!1448 0))(
  ( (B!1449 (val!11808 Int)) )
))
(declare-datatypes ((tuple2!15242 0))(
  ( (tuple2!15243 (_1!7632 (_ BitVec 64)) (_2!7632 B!1448)) )
))
(declare-datatypes ((List!21483 0))(
  ( (Nil!21480) (Cons!21479 (h!22677 tuple2!15242) (t!30475 List!21483)) )
))
(declare-fun l!412 () List!21483)

(declare-fun isStrictlySorted!578 (List!21483) Bool)

(assert (=> start!87798 (= res!680866 (isStrictlySorted!578 l!412))))

(assert (=> start!87798 e!570866))

(assert (=> start!87798 e!570864))

(assert (=> start!87798 tp_is_empty!23515))

(declare-datatypes ((Unit!33094 0))(
  ( (Unit!33095) )
))
(declare-fun e!570865 () Unit!33094)

(declare-fun lt!448656 () Unit!33094)

(assert (=> b!1014790 (= e!570865 lt!448656)))

(declare-datatypes ((List!21484 0))(
  ( (Nil!21481) (Cons!21480 (h!22678 (_ BitVec 64)) (t!30476 List!21484)) )
))
(declare-fun lt!448657 () List!21484)

(declare-fun value!115 () B!1448)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!45 (List!21483 List!21484 B!1448 tuple2!15242) Unit!33094)

(assert (=> b!1014790 (= lt!448656 (lemmaForallGetValueByKeySameWithASmallerHead!45 (t!30475 l!412) lt!448657 value!115 (h!22677 l!412)))))

(declare-fun lambda!776 () Int)

(declare-fun forall!251 (List!21484 Int) Bool)

(assert (=> b!1014790 (forall!251 lt!448657 lambda!776)))

(declare-fun b!1014791 () Bool)

(declare-fun res!680867 () Bool)

(assert (=> b!1014791 (=> (not res!680867) (not e!570866))))

(get-info :version)

(assert (=> b!1014791 (= res!680867 (and (not (= (_2!7632 (h!22677 l!412)) value!115)) ((_ is Cons!21479) l!412)))))

(declare-fun b!1014792 () Bool)

(declare-fun Unit!33096 () Unit!33094)

(assert (=> b!1014792 (= e!570865 Unit!33096)))

(declare-fun b!1014793 () Bool)

(declare-fun ListPrimitiveSize!118 (List!21483) Int)

(assert (=> b!1014793 (= e!570866 (>= (ListPrimitiveSize!118 (t!30475 l!412)) (ListPrimitiveSize!118 l!412)))))

(declare-fun lt!448655 () Unit!33094)

(assert (=> b!1014793 (= lt!448655 e!570865)))

(declare-fun c!102760 () Bool)

(declare-fun isEmpty!851 (List!21484) Bool)

(assert (=> b!1014793 (= c!102760 (not (isEmpty!851 lt!448657)))))

(declare-fun getKeysOf!55 (List!21483 B!1448) List!21484)

(assert (=> b!1014793 (= lt!448657 (getKeysOf!55 (t!30475 l!412) value!115))))

(assert (= (and start!87798 res!680866) b!1014791))

(assert (= (and b!1014791 res!680867) b!1014793))

(assert (= (and b!1014793 c!102760) b!1014790))

(assert (= (and b!1014793 (not c!102760)) b!1014792))

(assert (= (and start!87798 ((_ is Cons!21479) l!412)) b!1014789))

(declare-fun m!936637 () Bool)

(assert (=> start!87798 m!936637))

(declare-fun m!936639 () Bool)

(assert (=> b!1014790 m!936639))

(declare-fun m!936641 () Bool)

(assert (=> b!1014790 m!936641))

(declare-fun m!936643 () Bool)

(assert (=> b!1014793 m!936643))

(declare-fun m!936645 () Bool)

(assert (=> b!1014793 m!936645))

(declare-fun m!936647 () Bool)

(assert (=> b!1014793 m!936647))

(declare-fun m!936649 () Bool)

(assert (=> b!1014793 m!936649))

(check-sat tp_is_empty!23515 (not b!1014789) (not b!1014793) (not start!87798) (not b!1014790))
(check-sat)
(get-model)

(declare-fun d!120719 () Bool)

(declare-fun res!680884 () Bool)

(declare-fun e!570891 () Bool)

(assert (=> d!120719 (=> res!680884 e!570891)))

(assert (=> d!120719 (= res!680884 (or ((_ is Nil!21480) l!412) ((_ is Nil!21480) (t!30475 l!412))))))

(assert (=> d!120719 (= (isStrictlySorted!578 l!412) e!570891)))

(declare-fun b!1014844 () Bool)

(declare-fun e!570892 () Bool)

(assert (=> b!1014844 (= e!570891 e!570892)))

(declare-fun res!680885 () Bool)

(assert (=> b!1014844 (=> (not res!680885) (not e!570892))))

(assert (=> b!1014844 (= res!680885 (bvslt (_1!7632 (h!22677 l!412)) (_1!7632 (h!22677 (t!30475 l!412)))))))

(declare-fun b!1014845 () Bool)

(assert (=> b!1014845 (= e!570892 (isStrictlySorted!578 (t!30475 l!412)))))

(assert (= (and d!120719 (not res!680884)) b!1014844))

(assert (= (and b!1014844 res!680885) b!1014845))

(declare-fun m!936679 () Bool)

(assert (=> b!1014845 m!936679))

(assert (=> start!87798 d!120719))

(declare-fun d!120725 () Bool)

(declare-fun lt!448685 () Int)

(assert (=> d!120725 (>= lt!448685 0)))

(declare-fun e!570900 () Int)

(assert (=> d!120725 (= lt!448685 e!570900)))

(declare-fun c!102776 () Bool)

(assert (=> d!120725 (= c!102776 ((_ is Nil!21480) (t!30475 l!412)))))

(assert (=> d!120725 (= (ListPrimitiveSize!118 (t!30475 l!412)) lt!448685)))

(declare-fun b!1014860 () Bool)

(assert (=> b!1014860 (= e!570900 0)))

(declare-fun b!1014861 () Bool)

(assert (=> b!1014861 (= e!570900 (+ 1 (ListPrimitiveSize!118 (t!30475 (t!30475 l!412)))))))

(assert (= (and d!120725 c!102776) b!1014860))

(assert (= (and d!120725 (not c!102776)) b!1014861))

(declare-fun m!936685 () Bool)

(assert (=> b!1014861 m!936685))

(assert (=> b!1014793 d!120725))

(declare-fun d!120735 () Bool)

(declare-fun lt!448687 () Int)

(assert (=> d!120735 (>= lt!448687 0)))

(declare-fun e!570902 () Int)

(assert (=> d!120735 (= lt!448687 e!570902)))

(declare-fun c!102778 () Bool)

(assert (=> d!120735 (= c!102778 ((_ is Nil!21480) l!412))))

(assert (=> d!120735 (= (ListPrimitiveSize!118 l!412) lt!448687)))

(declare-fun b!1014864 () Bool)

(assert (=> b!1014864 (= e!570902 0)))

(declare-fun b!1014865 () Bool)

(assert (=> b!1014865 (= e!570902 (+ 1 (ListPrimitiveSize!118 (t!30475 l!412))))))

(assert (= (and d!120735 c!102778) b!1014864))

(assert (= (and d!120735 (not c!102778)) b!1014865))

(assert (=> b!1014865 m!936643))

(assert (=> b!1014793 d!120735))

(declare-fun d!120739 () Bool)

(assert (=> d!120739 (= (isEmpty!851 lt!448657) ((_ is Nil!21481) lt!448657))))

(assert (=> b!1014793 d!120739))

(declare-fun bs!29286 () Bool)

(declare-fun b!1014930 () Bool)

(assert (= bs!29286 (and b!1014930 b!1014790)))

(declare-fun lt!448781 () List!21483)

(declare-fun lt!448793 () tuple2!15242)

(declare-fun lambda!803 () Int)

(assert (=> bs!29286 (= (= (Cons!21479 lt!448793 lt!448781) l!412) (= lambda!803 lambda!776))))

(assert (=> b!1014930 true))

(assert (=> b!1014930 true))

(assert (=> b!1014930 true))

(declare-fun bs!29290 () Bool)

(declare-fun b!1014931 () Bool)

(assert (= bs!29290 (and b!1014931 b!1014790)))

(declare-fun lt!448795 () List!21483)

(declare-fun lt!448792 () tuple2!15242)

(declare-fun lambda!806 () Int)

(assert (=> bs!29290 (= (= (Cons!21479 lt!448792 lt!448795) l!412) (= lambda!806 lambda!776))))

(declare-fun bs!29292 () Bool)

(assert (= bs!29292 (and b!1014931 b!1014930)))

(assert (=> bs!29292 (= (= (Cons!21479 lt!448792 lt!448795) (Cons!21479 lt!448793 lt!448781)) (= lambda!806 lambda!803))))

(assert (=> b!1014931 true))

(assert (=> b!1014931 true))

(assert (=> b!1014931 true))

(declare-fun bs!29297 () Bool)

(declare-fun d!120743 () Bool)

(assert (= bs!29297 (and d!120743 b!1014790)))

(declare-fun lambda!809 () Int)

(assert (=> bs!29297 (= (= (t!30475 l!412) l!412) (= lambda!809 lambda!776))))

(declare-fun bs!29299 () Bool)

(assert (= bs!29299 (and d!120743 b!1014930)))

(assert (=> bs!29299 (= (= (t!30475 l!412) (Cons!21479 lt!448793 lt!448781)) (= lambda!809 lambda!803))))

(declare-fun bs!29301 () Bool)

(assert (= bs!29301 (and d!120743 b!1014931)))

(assert (=> bs!29301 (= (= (t!30475 l!412) (Cons!21479 lt!448792 lt!448795)) (= lambda!809 lambda!806))))

(assert (=> d!120743 true))

(assert (=> d!120743 true))

(declare-fun lt!448777 () List!21484)

(assert (=> d!120743 (forall!251 lt!448777 lambda!809)))

(declare-fun e!570938 () List!21484)

(assert (=> d!120743 (= lt!448777 e!570938)))

(declare-fun c!102814 () Bool)

(assert (=> d!120743 (= c!102814 (and ((_ is Cons!21479) (t!30475 l!412)) (= (_2!7632 (h!22677 (t!30475 l!412))) value!115)))))

(assert (=> d!120743 (isStrictlySorted!578 (t!30475 l!412))))

(assert (=> d!120743 (= (getKeysOf!55 (t!30475 l!412) value!115) lt!448777)))

(declare-fun lt!448784 () List!21484)

(declare-fun bm!42892 () Bool)

(declare-fun lt!448790 () List!21484)

(declare-fun call!42895 () Bool)

(assert (=> bm!42892 (= call!42895 (forall!251 (ite c!102814 lt!448784 lt!448790) (ite c!102814 lambda!803 lambda!806)))))

(declare-fun bm!42893 () Bool)

(declare-fun call!42896 () Bool)

(declare-fun call!42898 () List!21484)

(assert (=> bm!42893 (= call!42896 (isEmpty!851 call!42898))))

(assert (=> b!1014930 call!42895))

(declare-fun lt!448788 () Unit!33094)

(declare-fun call!42897 () Unit!33094)

(assert (=> b!1014930 (= lt!448788 call!42897)))

(assert (=> b!1014930 (= lt!448793 (h!22677 (t!30475 l!412)))))

(assert (=> b!1014930 (= lt!448784 call!42898)))

(assert (=> b!1014930 (= lt!448781 (t!30475 (t!30475 l!412)))))

(declare-fun e!570935 () Unit!33094)

(assert (=> b!1014930 (= e!570935 lt!448788)))

(declare-fun e!570936 () Unit!33094)

(declare-fun lt!448794 () Unit!33094)

(assert (=> b!1014931 (= e!570936 lt!448794)))

(assert (=> b!1014931 (= lt!448795 (t!30475 (t!30475 l!412)))))

(assert (=> b!1014931 (= lt!448790 call!42898)))

(assert (=> b!1014931 (= lt!448792 (h!22677 (t!30475 l!412)))))

(assert (=> b!1014931 (= lt!448794 call!42897)))

(assert (=> b!1014931 call!42895))

(declare-fun bm!42894 () Bool)

(assert (=> bm!42894 (= call!42897 (lemmaForallGetValueByKeySameWithASmallerHead!45 (ite c!102814 lt!448781 lt!448795) (ite c!102814 lt!448784 lt!448790) value!115 (ite c!102814 lt!448793 lt!448792)))))

(declare-fun b!1014932 () Bool)

(declare-fun e!570937 () List!21484)

(assert (=> b!1014932 (= e!570937 Nil!21481)))

(declare-fun b!1014933 () Bool)

(declare-fun Unit!33104 () Unit!33094)

(assert (=> b!1014933 (= e!570935 Unit!33104)))

(declare-fun b!1014934 () Bool)

(declare-fun lt!448775 () Unit!33094)

(assert (=> b!1014934 (= lt!448775 e!570936)))

(declare-fun c!102811 () Bool)

(assert (=> b!1014934 (= c!102811 (not call!42896))))

(declare-fun lt!448791 () List!21484)

(assert (=> b!1014934 (= lt!448791 call!42898)))

(assert (=> b!1014934 (= e!570937 call!42898)))

(declare-fun b!1014935 () Bool)

(assert (=> b!1014935 (= e!570938 e!570937)))

(declare-fun c!102813 () Bool)

(assert (=> b!1014935 (= c!102813 (and ((_ is Cons!21479) (t!30475 l!412)) (not (= (_2!7632 (h!22677 (t!30475 l!412))) value!115))))))

(declare-fun b!1014936 () Bool)

(assert (=> b!1014936 (= e!570938 (Cons!21480 (_1!7632 (h!22677 (t!30475 l!412))) call!42898))))

(declare-fun c!102812 () Bool)

(assert (=> b!1014936 (= c!102812 (not call!42896))))

(declare-fun lt!448786 () Unit!33094)

(assert (=> b!1014936 (= lt!448786 e!570935)))

(declare-fun bm!42895 () Bool)

(assert (=> bm!42895 (= call!42898 (getKeysOf!55 (t!30475 (t!30475 l!412)) value!115))))

(declare-fun b!1014937 () Bool)

(declare-fun Unit!33105 () Unit!33094)

(assert (=> b!1014937 (= e!570936 Unit!33105)))

(assert (= (and d!120743 c!102814) b!1014936))

(assert (= (and d!120743 (not c!102814)) b!1014935))

(assert (= (and b!1014936 c!102812) b!1014930))

(assert (= (and b!1014936 (not c!102812)) b!1014933))

(assert (= (and b!1014935 c!102813) b!1014934))

(assert (= (and b!1014935 (not c!102813)) b!1014932))

(assert (= (and b!1014934 c!102811) b!1014931))

(assert (= (and b!1014934 (not c!102811)) b!1014937))

(assert (= (or b!1014930 b!1014931) bm!42894))

(assert (= (or b!1014930 b!1014931) bm!42892))

(assert (= (or b!1014936 b!1014930 b!1014931 b!1014934) bm!42895))

(assert (= (or b!1014936 b!1014934) bm!42893))

(declare-fun m!936701 () Bool)

(assert (=> bm!42894 m!936701))

(declare-fun m!936707 () Bool)

(assert (=> bm!42895 m!936707))

(declare-fun m!936711 () Bool)

(assert (=> bm!42893 m!936711))

(declare-fun m!936715 () Bool)

(assert (=> d!120743 m!936715))

(assert (=> d!120743 m!936679))

(declare-fun m!936719 () Bool)

(assert (=> bm!42892 m!936719))

(assert (=> b!1014793 d!120743))

(declare-fun bs!29302 () Bool)

(declare-fun b!1014969 () Bool)

(assert (= bs!29302 (and b!1014969 b!1014790)))

(declare-fun lambda!820 () Int)

(assert (=> bs!29302 (= (= (t!30475 l!412) l!412) (= lambda!820 lambda!776))))

(declare-fun bs!29304 () Bool)

(assert (= bs!29304 (and b!1014969 b!1014930)))

(assert (=> bs!29304 (= (= (t!30475 l!412) (Cons!21479 lt!448793 lt!448781)) (= lambda!820 lambda!803))))

(declare-fun bs!29306 () Bool)

(assert (= bs!29306 (and b!1014969 b!1014931)))

(assert (=> bs!29306 (= (= (t!30475 l!412) (Cons!21479 lt!448792 lt!448795)) (= lambda!820 lambda!806))))

(declare-fun bs!29308 () Bool)

(assert (= bs!29308 (and b!1014969 d!120743)))

(assert (=> bs!29308 (= lambda!820 lambda!809)))

(assert (=> b!1014969 true))

(assert (=> b!1014969 true))

(declare-fun bs!29310 () Bool)

(declare-fun d!120749 () Bool)

(assert (= bs!29310 (and d!120749 b!1014931)))

(declare-fun lambda!824 () Int)

(assert (=> bs!29310 (= (= (Cons!21479 (h!22677 l!412) (t!30475 l!412)) (Cons!21479 lt!448792 lt!448795)) (= lambda!824 lambda!806))))

(declare-fun bs!29312 () Bool)

(assert (= bs!29312 (and d!120749 d!120743)))

(assert (=> bs!29312 (= (= (Cons!21479 (h!22677 l!412) (t!30475 l!412)) (t!30475 l!412)) (= lambda!824 lambda!809))))

(declare-fun bs!29314 () Bool)

(assert (= bs!29314 (and d!120749 b!1014790)))

(assert (=> bs!29314 (= (= (Cons!21479 (h!22677 l!412) (t!30475 l!412)) l!412) (= lambda!824 lambda!776))))

(declare-fun bs!29316 () Bool)

(assert (= bs!29316 (and d!120749 b!1014969)))

(assert (=> bs!29316 (= (= (Cons!21479 (h!22677 l!412) (t!30475 l!412)) (t!30475 l!412)) (= lambda!824 lambda!820))))

(declare-fun bs!29318 () Bool)

(assert (= bs!29318 (and d!120749 b!1014930)))

(assert (=> bs!29318 (= (= (Cons!21479 (h!22677 l!412) (t!30475 l!412)) (Cons!21479 lt!448793 lt!448781)) (= lambda!824 lambda!803))))

(assert (=> d!120749 true))

(assert (=> d!120749 true))

(assert (=> d!120749 true))

(assert (=> d!120749 (forall!251 lt!448657 lambda!824)))

(declare-fun lt!448802 () Unit!33094)

(declare-fun choose!1644 (List!21483 List!21484 B!1448 tuple2!15242) Unit!33094)

(assert (=> d!120749 (= lt!448802 (choose!1644 (t!30475 l!412) lt!448657 value!115 (h!22677 l!412)))))

(declare-fun e!570951 () Bool)

(assert (=> d!120749 e!570951))

(declare-fun res!680911 () Bool)

(assert (=> d!120749 (=> (not res!680911) (not e!570951))))

(assert (=> d!120749 (= res!680911 (isStrictlySorted!578 (t!30475 l!412)))))

(assert (=> d!120749 (= (lemmaForallGetValueByKeySameWithASmallerHead!45 (t!30475 l!412) lt!448657 value!115 (h!22677 l!412)) lt!448802)))

(declare-fun b!1014968 () Bool)

(declare-fun res!680912 () Bool)

(assert (=> b!1014968 (=> (not res!680912) (not e!570951))))

(declare-fun isEmpty!854 (List!21483) Bool)

(assert (=> b!1014968 (= res!680912 (not (isEmpty!854 (t!30475 l!412))))))

(declare-fun res!680910 () Bool)

(assert (=> b!1014969 (=> (not res!680910) (not e!570951))))

(assert (=> b!1014969 (= res!680910 (forall!251 lt!448657 lambda!820))))

(declare-fun b!1014970 () Bool)

(declare-fun head!943 (List!21483) tuple2!15242)

(assert (=> b!1014970 (= e!570951 (bvslt (_1!7632 (h!22677 l!412)) (_1!7632 (head!943 (t!30475 l!412)))))))

(assert (= (and d!120749 res!680911) b!1014968))

(assert (= (and b!1014968 res!680912) b!1014969))

(assert (= (and b!1014969 res!680910) b!1014970))

(declare-fun m!936721 () Bool)

(assert (=> d!120749 m!936721))

(declare-fun m!936725 () Bool)

(assert (=> d!120749 m!936725))

(assert (=> d!120749 m!936679))

(declare-fun m!936729 () Bool)

(assert (=> b!1014968 m!936729))

(declare-fun m!936731 () Bool)

(assert (=> b!1014969 m!936731))

(declare-fun m!936735 () Bool)

(assert (=> b!1014970 m!936735))

(assert (=> b!1014790 d!120749))

(declare-fun d!120753 () Bool)

(declare-fun res!680928 () Bool)

(declare-fun e!570963 () Bool)

(assert (=> d!120753 (=> res!680928 e!570963)))

(assert (=> d!120753 (= res!680928 ((_ is Nil!21481) lt!448657))))

(assert (=> d!120753 (= (forall!251 lt!448657 lambda!776) e!570963)))

(declare-fun b!1014987 () Bool)

(declare-fun e!570965 () Bool)

(assert (=> b!1014987 (= e!570963 e!570965)))

(declare-fun res!680930 () Bool)

(assert (=> b!1014987 (=> (not res!680930) (not e!570965))))

(declare-fun dynLambda!1885 (Int (_ BitVec 64)) Bool)

(assert (=> b!1014987 (= res!680930 (dynLambda!1885 lambda!776 (h!22678 lt!448657)))))

(declare-fun b!1014988 () Bool)

(assert (=> b!1014988 (= e!570965 (forall!251 (t!30476 lt!448657) lambda!776))))

(assert (= (and d!120753 (not res!680928)) b!1014987))

(assert (= (and b!1014987 res!680930) b!1014988))

(declare-fun b_lambda!15362 () Bool)

(assert (=> (not b_lambda!15362) (not b!1014987)))

(declare-fun m!936742 () Bool)

(assert (=> b!1014987 m!936742))

(declare-fun m!936747 () Bool)

(assert (=> b!1014988 m!936747))

(assert (=> b!1014790 d!120753))

(declare-fun b!1014993 () Bool)

(declare-fun e!570968 () Bool)

(declare-fun tp!70584 () Bool)

(assert (=> b!1014993 (= e!570968 (and tp_is_empty!23515 tp!70584))))

(assert (=> b!1014789 (= tp!70575 e!570968)))

(assert (= (and b!1014789 ((_ is Cons!21479) (t!30475 l!412))) b!1014993))

(declare-fun b_lambda!15365 () Bool)

(assert (= b_lambda!15362 (or b!1014790 b_lambda!15365)))

(declare-fun bs!29329 () Bool)

(declare-fun d!120761 () Bool)

(assert (= bs!29329 (and d!120761 b!1014790)))

(declare-datatypes ((Option!585 0))(
  ( (Some!584 (v!14432 B!1448)) (None!583) )
))
(declare-fun getValueByKey!534 (List!21483 (_ BitVec 64)) Option!585)

(assert (=> bs!29329 (= (dynLambda!1885 lambda!776 (h!22678 lt!448657)) (= (getValueByKey!534 l!412 (h!22678 lt!448657)) (Some!584 value!115)))))

(declare-fun m!936759 () Bool)

(assert (=> bs!29329 m!936759))

(assert (=> b!1014987 d!120761))

(check-sat (not bm!42893) (not b!1014993) (not bm!42894) (not bm!42895) tp_is_empty!23515 (not b!1014969) (not b!1014970) (not b!1014968) (not b!1014861) (not b!1014845) (not bs!29329) (not d!120743) (not b!1014988) (not b!1014865) (not d!120749) (not bm!42892) (not b_lambda!15365))
(check-sat)
