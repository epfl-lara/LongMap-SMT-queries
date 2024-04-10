; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87758 () Bool)

(assert start!87758)

(declare-fun b!1014744 () Bool)

(assert (=> b!1014744 true))

(assert (=> b!1014744 true))

(declare-fun b!1014738 () Bool)

(declare-fun res!680862 () Bool)

(declare-fun e!570833 () Bool)

(assert (=> b!1014738 (=> res!680862 e!570833)))

(declare-datatypes ((B!1444 0))(
  ( (B!1445 (val!11806 Int)) )
))
(declare-datatypes ((tuple2!15158 0))(
  ( (tuple2!15159 (_1!7590 (_ BitVec 64)) (_2!7590 B!1444)) )
))
(declare-datatypes ((List!21444 0))(
  ( (Nil!21441) (Cons!21440 (h!22638 tuple2!15158) (t!30445 List!21444)) )
))
(declare-fun l!412 () List!21444)

(declare-fun isEmpty!841 (List!21444) Bool)

(assert (=> b!1014738 (= res!680862 (isEmpty!841 (t!30445 l!412)))))

(declare-fun b!1014739 () Bool)

(declare-fun res!680857 () Bool)

(declare-fun e!570832 () Bool)

(assert (=> b!1014739 (=> (not res!680857) (not e!570832))))

(declare-fun value!115 () B!1444)

(get-info :version)

(assert (=> b!1014739 (= res!680857 (and (not (= (_2!7590 (h!22638 l!412)) value!115)) ((_ is Cons!21440) l!412)))))

(declare-fun b!1014740 () Bool)

(declare-fun e!570835 () Bool)

(assert (=> b!1014740 (= e!570835 e!570833)))

(declare-fun res!680858 () Bool)

(assert (=> b!1014740 (=> res!680858 e!570833)))

(declare-fun isStrictlySorted!580 (List!21444) Bool)

(assert (=> b!1014740 (= res!680858 (not (isStrictlySorted!580 (t!30445 l!412))))))

(declare-fun b!1014741 () Bool)

(assert (=> b!1014741 (= e!570832 e!570835)))

(declare-fun res!680860 () Bool)

(assert (=> b!1014741 (=> (not res!680860) (not e!570835))))

(declare-datatypes ((List!21445 0))(
  ( (Nil!21442) (Cons!21441 (h!22639 (_ BitVec 64)) (t!30446 List!21445)) )
))
(declare-fun lt!448737 () List!21445)

(declare-fun isEmpty!842 (List!21445) Bool)

(assert (=> b!1014741 (= res!680860 (not (isEmpty!842 lt!448737)))))

(declare-fun getKeysOf!53 (List!21444 B!1444) List!21445)

(assert (=> b!1014741 (= lt!448737 (getKeysOf!53 (t!30445 l!412) value!115))))

(declare-fun b!1014742 () Bool)

(declare-fun head!942 (List!21444) tuple2!15158)

(assert (=> b!1014742 (= e!570833 (bvsge (_1!7590 (h!22638 l!412)) (_1!7590 (head!942 (t!30445 l!412)))))))

(declare-fun b!1014743 () Bool)

(declare-fun e!570834 () Bool)

(declare-fun tp_is_empty!23511 () Bool)

(declare-fun tp!70559 () Bool)

(assert (=> b!1014743 (= e!570834 (and tp_is_empty!23511 tp!70559))))

(declare-fun res!680859 () Bool)

(assert (=> b!1014744 (=> res!680859 e!570833)))

(declare-fun lambda!743 () Int)

(declare-fun forall!245 (List!21445 Int) Bool)

(assert (=> b!1014744 (= res!680859 (not (forall!245 lt!448737 lambda!743)))))

(declare-fun res!680861 () Bool)

(assert (=> start!87758 (=> (not res!680861) (not e!570832))))

(assert (=> start!87758 (= res!680861 (isStrictlySorted!580 l!412))))

(assert (=> start!87758 e!570832))

(assert (=> start!87758 e!570834))

(assert (=> start!87758 tp_is_empty!23511))

(assert (= (and start!87758 res!680861) b!1014739))

(assert (= (and b!1014739 res!680857) b!1014741))

(assert (= (and b!1014741 res!680860) b!1014740))

(assert (= (and b!1014740 (not res!680858)) b!1014738))

(assert (= (and b!1014738 (not res!680862)) b!1014744))

(assert (= (and b!1014744 (not res!680859)) b!1014742))

(assert (= (and start!87758 ((_ is Cons!21440) l!412)) b!1014743))

(declare-fun m!937163 () Bool)

(assert (=> b!1014741 m!937163))

(declare-fun m!937165 () Bool)

(assert (=> b!1014741 m!937165))

(declare-fun m!937167 () Bool)

(assert (=> b!1014738 m!937167))

(declare-fun m!937169 () Bool)

(assert (=> start!87758 m!937169))

(declare-fun m!937171 () Bool)

(assert (=> b!1014742 m!937171))

(declare-fun m!937173 () Bool)

(assert (=> b!1014744 m!937173))

(declare-fun m!937175 () Bool)

(assert (=> b!1014740 m!937175))

(check-sat (not b!1014744) (not b!1014742) (not b!1014741) (not b!1014738) (not b!1014743) (not start!87758) tp_is_empty!23511 (not b!1014740))
(check-sat)
(get-model)

(declare-fun d!120807 () Bool)

(assert (=> d!120807 (= (isEmpty!842 lt!448737) ((_ is Nil!21442) lt!448737))))

(assert (=> b!1014741 d!120807))

(declare-fun bs!29289 () Bool)

(declare-fun b!1014831 () Bool)

(assert (= bs!29289 (and b!1014831 b!1014744)))

(declare-fun lambda!758 () Int)

(declare-fun lt!448798 () List!21444)

(declare-fun lt!448790 () tuple2!15158)

(assert (=> bs!29289 (= (= (Cons!21440 lt!448790 lt!448798) (t!30445 l!412)) (= lambda!758 lambda!743))))

(assert (=> b!1014831 true))

(assert (=> b!1014831 true))

(assert (=> b!1014831 true))

(declare-fun bs!29290 () Bool)

(declare-fun b!1014824 () Bool)

(assert (= bs!29290 (and b!1014824 b!1014744)))

(declare-fun lt!448793 () List!21444)

(declare-fun lambda!760 () Int)

(declare-fun lt!448789 () tuple2!15158)

(assert (=> bs!29290 (= (= (Cons!21440 lt!448789 lt!448793) (t!30445 l!412)) (= lambda!760 lambda!743))))

(declare-fun bs!29291 () Bool)

(assert (= bs!29291 (and b!1014824 b!1014831)))

(assert (=> bs!29291 (= (= (Cons!21440 lt!448789 lt!448793) (Cons!21440 lt!448790 lt!448798)) (= lambda!760 lambda!758))))

(assert (=> b!1014824 true))

(assert (=> b!1014824 true))

(assert (=> b!1014824 true))

(declare-fun bs!29292 () Bool)

(declare-fun d!120809 () Bool)

(assert (= bs!29292 (and d!120809 b!1014744)))

(declare-fun lambda!761 () Int)

(assert (=> bs!29292 (= lambda!761 lambda!743)))

(declare-fun bs!29293 () Bool)

(assert (= bs!29293 (and d!120809 b!1014831)))

(assert (=> bs!29293 (= (= (t!30445 l!412) (Cons!21440 lt!448790 lt!448798)) (= lambda!761 lambda!758))))

(declare-fun bs!29294 () Bool)

(assert (= bs!29294 (and d!120809 b!1014824)))

(assert (=> bs!29294 (= (= (t!30445 l!412) (Cons!21440 lt!448789 lt!448793)) (= lambda!761 lambda!760))))

(assert (=> d!120809 true))

(assert (=> d!120809 true))

(declare-datatypes ((Unit!33185 0))(
  ( (Unit!33186) )
))
(declare-fun e!570882 () Unit!33185)

(declare-fun lt!448800 () Unit!33185)

(assert (=> b!1014824 (= e!570882 lt!448800)))

(assert (=> b!1014824 (= lt!448793 (t!30445 (t!30445 l!412)))))

(declare-fun lt!448791 () List!21445)

(declare-fun call!42866 () List!21445)

(assert (=> b!1014824 (= lt!448791 call!42866)))

(assert (=> b!1014824 (= lt!448789 (h!22638 (t!30445 l!412)))))

(declare-fun call!42868 () Unit!33185)

(assert (=> b!1014824 (= lt!448800 call!42868)))

(declare-fun call!42869 () Bool)

(assert (=> b!1014824 call!42869))

(declare-fun b!1014825 () Bool)

(declare-fun e!570883 () Unit!33185)

(declare-fun Unit!33189 () Unit!33185)

(assert (=> b!1014825 (= e!570883 Unit!33189)))

(declare-fun b!1014826 () Bool)

(declare-fun e!570884 () List!21445)

(assert (=> b!1014826 (= e!570884 (Cons!21441 (_1!7590 (h!22638 (t!30445 l!412))) call!42866))))

(declare-fun c!102773 () Bool)

(declare-fun call!42867 () Bool)

(assert (=> b!1014826 (= c!102773 (not call!42867))))

(declare-fun lt!448797 () Unit!33185)

(assert (=> b!1014826 (= lt!448797 e!570883)))

(declare-fun bm!42863 () Bool)

(assert (=> bm!42863 (= call!42866 (getKeysOf!53 (t!30445 (t!30445 l!412)) value!115))))

(declare-fun b!1014827 () Bool)

(declare-fun Unit!33190 () Unit!33185)

(assert (=> b!1014827 (= e!570882 Unit!33190)))

(declare-fun b!1014828 () Bool)

(declare-fun e!570885 () List!21445)

(assert (=> b!1014828 (= e!570884 e!570885)))

(declare-fun c!102770 () Bool)

(assert (=> b!1014828 (= c!102770 (and ((_ is Cons!21440) (t!30445 l!412)) (not (= (_2!7590 (h!22638 (t!30445 l!412))) value!115))))))

(declare-fun b!1014829 () Bool)

(assert (=> b!1014829 (= e!570885 Nil!21442)))

(declare-fun bm!42864 () Bool)

(assert (=> bm!42864 (= call!42867 (isEmpty!842 call!42866))))

(declare-fun lt!448792 () List!21445)

(assert (=> d!120809 (forall!245 lt!448792 lambda!761)))

(assert (=> d!120809 (= lt!448792 e!570884)))

(declare-fun c!102771 () Bool)

(assert (=> d!120809 (= c!102771 (and ((_ is Cons!21440) (t!30445 l!412)) (= (_2!7590 (h!22638 (t!30445 l!412))) value!115)))))

(assert (=> d!120809 (isStrictlySorted!580 (t!30445 l!412))))

(assert (=> d!120809 (= (getKeysOf!53 (t!30445 l!412) value!115) lt!448792)))

(declare-fun lt!448795 () List!21445)

(declare-fun bm!42865 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!38 (List!21444 List!21445 B!1444 tuple2!15158) Unit!33185)

(assert (=> bm!42865 (= call!42868 (lemmaForallGetValueByKeySameWithASmallerHead!38 (ite c!102771 lt!448798 lt!448793) (ite c!102771 lt!448795 lt!448791) value!115 (ite c!102771 lt!448790 lt!448789)))))

(declare-fun bm!42866 () Bool)

(assert (=> bm!42866 (= call!42869 (forall!245 (ite c!102771 lt!448795 lt!448791) (ite c!102771 lambda!758 lambda!760)))))

(declare-fun b!1014830 () Bool)

(declare-fun lt!448794 () Unit!33185)

(assert (=> b!1014830 (= lt!448794 e!570882)))

(declare-fun c!102772 () Bool)

(assert (=> b!1014830 (= c!102772 (not call!42867))))

(declare-fun lt!448799 () List!21445)

(assert (=> b!1014830 (= lt!448799 call!42866)))

(assert (=> b!1014830 (= e!570885 call!42866)))

(assert (=> b!1014831 call!42869))

(declare-fun lt!448796 () Unit!33185)

(assert (=> b!1014831 (= lt!448796 call!42868)))

(assert (=> b!1014831 (= lt!448790 (h!22638 (t!30445 l!412)))))

(assert (=> b!1014831 (= lt!448795 call!42866)))

(assert (=> b!1014831 (= lt!448798 (t!30445 (t!30445 l!412)))))

(assert (=> b!1014831 (= e!570883 lt!448796)))

(assert (= (and d!120809 c!102771) b!1014826))

(assert (= (and d!120809 (not c!102771)) b!1014828))

(assert (= (and b!1014826 c!102773) b!1014831))

(assert (= (and b!1014826 (not c!102773)) b!1014825))

(assert (= (and b!1014828 c!102770) b!1014830))

(assert (= (and b!1014828 (not c!102770)) b!1014829))

(assert (= (and b!1014830 c!102772) b!1014824))

(assert (= (and b!1014830 (not c!102772)) b!1014827))

(assert (= (or b!1014831 b!1014824) bm!42865))

(assert (= (or b!1014831 b!1014824) bm!42866))

(assert (= (or b!1014826 b!1014831 b!1014824 b!1014830) bm!42863))

(assert (= (or b!1014826 b!1014830) bm!42864))

(declare-fun m!937195 () Bool)

(assert (=> bm!42865 m!937195))

(declare-fun m!937197 () Bool)

(assert (=> bm!42864 m!937197))

(declare-fun m!937199 () Bool)

(assert (=> bm!42863 m!937199))

(declare-fun m!937201 () Bool)

(assert (=> d!120809 m!937201))

(assert (=> d!120809 m!937175))

(declare-fun m!937203 () Bool)

(assert (=> bm!42866 m!937203))

(assert (=> b!1014741 d!120809))

(declare-fun d!120829 () Bool)

(assert (=> d!120829 (= (head!942 (t!30445 l!412)) (h!22638 (t!30445 l!412)))))

(assert (=> b!1014742 d!120829))

(declare-fun d!120831 () Bool)

(declare-fun res!680903 () Bool)

(declare-fun e!570894 () Bool)

(assert (=> d!120831 (=> res!680903 e!570894)))

(assert (=> d!120831 (= res!680903 (or ((_ is Nil!21441) (t!30445 l!412)) ((_ is Nil!21441) (t!30445 (t!30445 l!412)))))))

(assert (=> d!120831 (= (isStrictlySorted!580 (t!30445 l!412)) e!570894)))

(declare-fun b!1014848 () Bool)

(declare-fun e!570895 () Bool)

(assert (=> b!1014848 (= e!570894 e!570895)))

(declare-fun res!680904 () Bool)

(assert (=> b!1014848 (=> (not res!680904) (not e!570895))))

(assert (=> b!1014848 (= res!680904 (bvslt (_1!7590 (h!22638 (t!30445 l!412))) (_1!7590 (h!22638 (t!30445 (t!30445 l!412))))))))

(declare-fun b!1014849 () Bool)

(assert (=> b!1014849 (= e!570895 (isStrictlySorted!580 (t!30445 (t!30445 l!412))))))

(assert (= (and d!120831 (not res!680903)) b!1014848))

(assert (= (and b!1014848 res!680904) b!1014849))

(declare-fun m!937205 () Bool)

(assert (=> b!1014849 m!937205))

(assert (=> b!1014740 d!120831))

(declare-fun d!120833 () Bool)

(declare-fun res!680913 () Bool)

(declare-fun e!570904 () Bool)

(assert (=> d!120833 (=> res!680913 e!570904)))

(assert (=> d!120833 (= res!680913 ((_ is Nil!21442) lt!448737))))

(assert (=> d!120833 (= (forall!245 lt!448737 lambda!743) e!570904)))

(declare-fun b!1014858 () Bool)

(declare-fun e!570905 () Bool)

(assert (=> b!1014858 (= e!570904 e!570905)))

(declare-fun res!680914 () Bool)

(assert (=> b!1014858 (=> (not res!680914) (not e!570905))))

(declare-fun dynLambda!1892 (Int (_ BitVec 64)) Bool)

(assert (=> b!1014858 (= res!680914 (dynLambda!1892 lambda!743 (h!22639 lt!448737)))))

(declare-fun b!1014859 () Bool)

(assert (=> b!1014859 (= e!570905 (forall!245 (t!30446 lt!448737) lambda!743))))

(assert (= (and d!120833 (not res!680913)) b!1014858))

(assert (= (and b!1014858 res!680914) b!1014859))

(declare-fun b_lambda!15369 () Bool)

(assert (=> (not b_lambda!15369) (not b!1014858)))

(declare-fun m!937219 () Bool)

(assert (=> b!1014858 m!937219))

(declare-fun m!937221 () Bool)

(assert (=> b!1014859 m!937221))

(assert (=> b!1014744 d!120833))

(declare-fun d!120839 () Bool)

(declare-fun res!680917 () Bool)

(declare-fun e!570908 () Bool)

(assert (=> d!120839 (=> res!680917 e!570908)))

(assert (=> d!120839 (= res!680917 (or ((_ is Nil!21441) l!412) ((_ is Nil!21441) (t!30445 l!412))))))

(assert (=> d!120839 (= (isStrictlySorted!580 l!412) e!570908)))

(declare-fun b!1014862 () Bool)

(declare-fun e!570909 () Bool)

(assert (=> b!1014862 (= e!570908 e!570909)))

(declare-fun res!680918 () Bool)

(assert (=> b!1014862 (=> (not res!680918) (not e!570909))))

(assert (=> b!1014862 (= res!680918 (bvslt (_1!7590 (h!22638 l!412)) (_1!7590 (h!22638 (t!30445 l!412)))))))

(declare-fun b!1014863 () Bool)

(assert (=> b!1014863 (= e!570909 (isStrictlySorted!580 (t!30445 l!412)))))

(assert (= (and d!120839 (not res!680917)) b!1014862))

(assert (= (and b!1014862 res!680918) b!1014863))

(assert (=> b!1014863 m!937175))

(assert (=> start!87758 d!120839))

(declare-fun d!120841 () Bool)

(assert (=> d!120841 (= (isEmpty!841 (t!30445 l!412)) ((_ is Nil!21441) (t!30445 l!412)))))

(assert (=> b!1014738 d!120841))

(declare-fun b!1014878 () Bool)

(declare-fun e!570918 () Bool)

(declare-fun tp!70565 () Bool)

(assert (=> b!1014878 (= e!570918 (and tp_is_empty!23511 tp!70565))))

(assert (=> b!1014743 (= tp!70559 e!570918)))

(assert (= (and b!1014743 ((_ is Cons!21440) (t!30445 l!412))) b!1014878))

(declare-fun b_lambda!15373 () Bool)

(assert (= b_lambda!15369 (or b!1014744 b_lambda!15373)))

(declare-fun bs!29301 () Bool)

(declare-fun d!120845 () Bool)

(assert (= bs!29301 (and d!120845 b!1014744)))

(declare-datatypes ((Option!578 0))(
  ( (Some!577 (v!14428 B!1444)) (None!576) )
))
(declare-fun getValueByKey!527 (List!21444 (_ BitVec 64)) Option!578)

(assert (=> bs!29301 (= (dynLambda!1892 lambda!743 (h!22639 lt!448737)) (= (getValueByKey!527 (t!30445 l!412) (h!22639 lt!448737)) (Some!577 value!115)))))

(declare-fun m!937227 () Bool)

(assert (=> bs!29301 m!937227))

(assert (=> b!1014858 d!120845))

(check-sat (not bm!42865) (not bm!42866) (not b!1014859) (not bs!29301) (not bm!42863) (not b!1014849) (not bm!42864) (not b_lambda!15373) (not b!1014878) (not d!120809) tp_is_empty!23511 (not b!1014863))
(check-sat)
