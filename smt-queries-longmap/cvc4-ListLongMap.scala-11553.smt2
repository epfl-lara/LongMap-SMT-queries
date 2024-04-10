; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134538 () Bool)

(assert start!134538)

(declare-fun b!1570692 () Bool)

(declare-fun e!875698 () Bool)

(declare-fun tp_is_empty!39107 () Bool)

(declare-fun tp!114237 () Bool)

(assert (=> b!1570692 (= e!875698 (and tp_is_empty!39107 tp!114237))))

(declare-fun b!1570689 () Bool)

(declare-fun res!1073204 () Bool)

(declare-fun e!875699 () Bool)

(assert (=> b!1570689 (=> (not res!1073204) (not e!875699))))

(declare-datatypes ((B!2556 0))(
  ( (B!2557 (val!19640 Int)) )
))
(declare-datatypes ((tuple2!25382 0))(
  ( (tuple2!25383 (_1!12702 (_ BitVec 64)) (_2!12702 B!2556)) )
))
(declare-datatypes ((List!36760 0))(
  ( (Nil!36757) (Cons!36756 (h!38203 tuple2!25382) (t!51671 List!36760)) )
))
(declare-fun l!750 () List!36760)

(declare-fun isStrictlySorted!1024 (List!36760) Bool)

(assert (=> b!1570689 (= res!1073204 (isStrictlySorted!1024 l!750))))

(declare-fun v1!32 () B!2556)

(declare-fun v2!10 () B!2556)

(declare-fun b!1570691 () Bool)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun insertStrictlySorted!601 (List!36760 (_ BitVec 64) B!2556) List!36760)

(assert (=> b!1570691 (= e!875699 (not (= (insertStrictlySorted!601 (insertStrictlySorted!601 l!750 key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!601 (insertStrictlySorted!601 l!750 key2!21 v2!10) key1!37 v1!32))))))

(declare-fun res!1073203 () Bool)

(assert (=> start!134538 (=> (not res!1073203) (not e!875699))))

(assert (=> start!134538 (= res!1073203 (not (= key1!37 key2!21)))))

(assert (=> start!134538 e!875699))

(assert (=> start!134538 tp_is_empty!39107))

(assert (=> start!134538 e!875698))

(assert (=> start!134538 true))

(declare-fun b!1570690 () Bool)

(declare-fun res!1073205 () Bool)

(assert (=> b!1570690 (=> (not res!1073205) (not e!875699))))

(assert (=> b!1570690 (= res!1073205 (or (not (is-Cons!36756 l!750)) (bvsge (_1!12702 (h!38203 l!750)) key1!37) (bvsge (_1!12702 (h!38203 l!750)) key2!21)))))

(assert (= (and start!134538 res!1073203) b!1570689))

(assert (= (and b!1570689 res!1073204) b!1570690))

(assert (= (and b!1570690 res!1073205) b!1570691))

(assert (= (and start!134538 (is-Cons!36756 l!750)) b!1570692))

(declare-fun m!1444737 () Bool)

(assert (=> b!1570689 m!1444737))

(declare-fun m!1444739 () Bool)

(assert (=> b!1570691 m!1444739))

(assert (=> b!1570691 m!1444739))

(declare-fun m!1444741 () Bool)

(assert (=> b!1570691 m!1444741))

(declare-fun m!1444743 () Bool)

(assert (=> b!1570691 m!1444743))

(assert (=> b!1570691 m!1444743))

(declare-fun m!1444745 () Bool)

(assert (=> b!1570691 m!1444745))

(push 1)

(assert (not b!1570689))

(assert (not b!1570691))

(assert (not b!1570692))

(assert tp_is_empty!39107)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164305 () Bool)

(declare-fun res!1073216 () Bool)

(declare-fun e!875710 () Bool)

(assert (=> d!164305 (=> res!1073216 e!875710)))

(assert (=> d!164305 (= res!1073216 (or (is-Nil!36757 l!750) (is-Nil!36757 (t!51671 l!750))))))

(assert (=> d!164305 (= (isStrictlySorted!1024 l!750) e!875710)))

(declare-fun b!1570703 () Bool)

(declare-fun e!875711 () Bool)

(assert (=> b!1570703 (= e!875710 e!875711)))

(declare-fun res!1073217 () Bool)

(assert (=> b!1570703 (=> (not res!1073217) (not e!875711))))

(assert (=> b!1570703 (= res!1073217 (bvslt (_1!12702 (h!38203 l!750)) (_1!12702 (h!38203 (t!51671 l!750)))))))

(declare-fun b!1570704 () Bool)

(assert (=> b!1570704 (= e!875711 (isStrictlySorted!1024 (t!51671 l!750)))))

(assert (= (and d!164305 (not res!1073216)) b!1570703))

(assert (= (and b!1570703 res!1073217) b!1570704))

(declare-fun m!1444747 () Bool)

(assert (=> b!1570704 m!1444747))

(assert (=> b!1570689 d!164305))

(declare-fun c!145017 () Bool)

(declare-fun b!1570781 () Bool)

(declare-fun c!145018 () Bool)

(declare-fun e!875754 () List!36760)

(assert (=> b!1570781 (= e!875754 (ite c!145017 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (ite c!145018 (Cons!36756 (h!38203 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32))) Nil!36757)))))

(declare-fun bm!72282 () Bool)

(declare-fun call!72287 () List!36760)

(declare-fun call!72286 () List!36760)

(assert (=> bm!72282 (= call!72287 call!72286)))

(declare-fun e!875756 () Bool)

(declare-fun b!1570782 () Bool)

(declare-fun lt!673440 () List!36760)

(declare-fun contains!10431 (List!36760 tuple2!25382) Bool)

(assert (=> b!1570782 (= e!875756 (contains!10431 lt!673440 (tuple2!25383 key2!21 v2!10)))))

(declare-fun b!1570783 () Bool)

(declare-fun e!875757 () List!36760)

(declare-fun call!72285 () List!36760)

(assert (=> b!1570783 (= e!875757 call!72285)))

(declare-fun b!1570784 () Bool)

(assert (=> b!1570784 (= c!145018 (and (is-Cons!36756 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (bvsgt (_1!12702 (h!38203 (insertStrictlySorted!601 l!750 key1!37 v1!32))) key2!21)))))

(declare-fun e!875755 () List!36760)

(declare-fun e!875753 () List!36760)

(assert (=> b!1570784 (= e!875755 e!875753)))

(declare-fun b!1570785 () Bool)

(declare-fun res!1073238 () Bool)

(assert (=> b!1570785 (=> (not res!1073238) (not e!875756))))

(declare-fun containsKey!873 (List!36760 (_ BitVec 64)) Bool)

(assert (=> b!1570785 (= res!1073238 (containsKey!873 lt!673440 key2!21))))

(declare-fun bm!72283 () Bool)

(assert (=> bm!72283 (= call!72286 call!72285)))

(declare-fun b!1570786 () Bool)

(assert (=> b!1570786 (= e!875755 call!72286)))

(declare-fun c!145016 () Bool)

(declare-fun bm!72284 () Bool)

(declare-fun $colon$colon!1003 (List!36760 tuple2!25382) List!36760)

(assert (=> bm!72284 (= call!72285 ($colon$colon!1003 e!875754 (ite c!145016 (h!38203 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (tuple2!25383 key2!21 v2!10))))))

(declare-fun c!145019 () Bool)

(assert (=> bm!72284 (= c!145019 c!145016)))

(declare-fun b!1570787 () Bool)

(assert (=> b!1570787 (= e!875753 call!72287)))

(declare-fun b!1570788 () Bool)

(assert (=> b!1570788 (= e!875754 (insertStrictlySorted!601 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32)) key2!21 v2!10))))

(declare-fun d!164311 () Bool)

(assert (=> d!164311 e!875756))

(declare-fun res!1073239 () Bool)

(assert (=> d!164311 (=> (not res!1073239) (not e!875756))))

(assert (=> d!164311 (= res!1073239 (isStrictlySorted!1024 lt!673440))))

(assert (=> d!164311 (= lt!673440 e!875757)))

(assert (=> d!164311 (= c!145016 (and (is-Cons!36756 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (bvslt (_1!12702 (h!38203 (insertStrictlySorted!601 l!750 key1!37 v1!32))) key2!21)))))

(assert (=> d!164311 (isStrictlySorted!1024 (insertStrictlySorted!601 l!750 key1!37 v1!32))))

(assert (=> d!164311 (= (insertStrictlySorted!601 (insertStrictlySorted!601 l!750 key1!37 v1!32) key2!21 v2!10) lt!673440)))

(declare-fun b!1570789 () Bool)

(assert (=> b!1570789 (= e!875757 e!875755)))

(assert (=> b!1570789 (= c!145017 (and (is-Cons!36756 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (= (_1!12702 (h!38203 (insertStrictlySorted!601 l!750 key1!37 v1!32))) key2!21)))))

(declare-fun b!1570790 () Bool)

(assert (=> b!1570790 (= e!875753 call!72287)))

(assert (= (and d!164311 c!145016) b!1570783))

(assert (= (and d!164311 (not c!145016)) b!1570789))

(assert (= (and b!1570789 c!145017) b!1570786))

(assert (= (and b!1570789 (not c!145017)) b!1570784))

(assert (= (and b!1570784 c!145018) b!1570790))

(assert (= (and b!1570784 (not c!145018)) b!1570787))

(assert (= (or b!1570790 b!1570787) bm!72282))

(assert (= (or b!1570786 bm!72282) bm!72283))

(assert (= (or b!1570783 bm!72283) bm!72284))

(assert (= (and bm!72284 c!145019) b!1570788))

(assert (= (and bm!72284 (not c!145019)) b!1570781))

(assert (= (and d!164311 res!1073239) b!1570785))

(assert (= (and b!1570785 res!1073238) b!1570782))

(declare-fun m!1444757 () Bool)

(assert (=> b!1570788 m!1444757))

(declare-fun m!1444761 () Bool)

(assert (=> b!1570782 m!1444761))

(declare-fun m!1444767 () Bool)

(assert (=> bm!72284 m!1444767))

(declare-fun m!1444769 () Bool)

(assert (=> d!164311 m!1444769))

(assert (=> d!164311 m!1444739))

(declare-fun m!1444773 () Bool)

(assert (=> d!164311 m!1444773))

(declare-fun m!1444775 () Bool)

(assert (=> b!1570785 m!1444775))

(assert (=> b!1570691 d!164311))

(declare-fun e!875769 () List!36760)

(declare-fun c!145030 () Bool)

(declare-fun b!1570811 () Bool)

(declare-fun c!145029 () Bool)

(assert (=> b!1570811 (= e!875769 (ite c!145029 (t!51671 l!750) (ite c!145030 (Cons!36756 (h!38203 l!750) (t!51671 l!750)) Nil!36757)))))

(declare-fun bm!72291 () Bool)

(declare-fun call!72296 () List!36760)

(declare-fun call!72295 () List!36760)

(assert (=> bm!72291 (= call!72296 call!72295)))

(declare-fun lt!673443 () List!36760)

(declare-fun e!875771 () Bool)

(declare-fun b!1570812 () Bool)

(assert (=> b!1570812 (= e!875771 (contains!10431 lt!673443 (tuple2!25383 key1!37 v1!32)))))

(declare-fun b!1570813 () Bool)

(declare-fun e!875772 () List!36760)

(declare-fun call!72294 () List!36760)

(assert (=> b!1570813 (= e!875772 call!72294)))

(declare-fun b!1570814 () Bool)

(assert (=> b!1570814 (= c!145030 (and (is-Cons!36756 l!750) (bvsgt (_1!12702 (h!38203 l!750)) key1!37)))))

(declare-fun e!875770 () List!36760)

(declare-fun e!875768 () List!36760)

(assert (=> b!1570814 (= e!875770 e!875768)))

(declare-fun b!1570815 () Bool)

(declare-fun res!1073244 () Bool)

(assert (=> b!1570815 (=> (not res!1073244) (not e!875771))))

(assert (=> b!1570815 (= res!1073244 (containsKey!873 lt!673443 key1!37))))

(declare-fun bm!72292 () Bool)

(assert (=> bm!72292 (= call!72295 call!72294)))

(declare-fun b!1570816 () Bool)

(assert (=> b!1570816 (= e!875770 call!72295)))

(declare-fun c!145028 () Bool)

(declare-fun bm!72293 () Bool)

(assert (=> bm!72293 (= call!72294 ($colon$colon!1003 e!875769 (ite c!145028 (h!38203 l!750) (tuple2!25383 key1!37 v1!32))))))

(declare-fun c!145031 () Bool)

(assert (=> bm!72293 (= c!145031 c!145028)))

(declare-fun b!1570817 () Bool)

(assert (=> b!1570817 (= e!875768 call!72296)))

(declare-fun b!1570818 () Bool)

(assert (=> b!1570818 (= e!875769 (insertStrictlySorted!601 (t!51671 l!750) key1!37 v1!32))))

(declare-fun d!164319 () Bool)

(assert (=> d!164319 e!875771))

(declare-fun res!1073245 () Bool)

(assert (=> d!164319 (=> (not res!1073245) (not e!875771))))

(assert (=> d!164319 (= res!1073245 (isStrictlySorted!1024 lt!673443))))

(assert (=> d!164319 (= lt!673443 e!875772)))

(assert (=> d!164319 (= c!145028 (and (is-Cons!36756 l!750) (bvslt (_1!12702 (h!38203 l!750)) key1!37)))))

(assert (=> d!164319 (isStrictlySorted!1024 l!750)))

(assert (=> d!164319 (= (insertStrictlySorted!601 l!750 key1!37 v1!32) lt!673443)))

(declare-fun b!1570819 () Bool)

(assert (=> b!1570819 (= e!875772 e!875770)))

(assert (=> b!1570819 (= c!145029 (and (is-Cons!36756 l!750) (= (_1!12702 (h!38203 l!750)) key1!37)))))

(declare-fun b!1570820 () Bool)

(assert (=> b!1570820 (= e!875768 call!72296)))

(assert (= (and d!164319 c!145028) b!1570813))

(assert (= (and d!164319 (not c!145028)) b!1570819))

(assert (= (and b!1570819 c!145029) b!1570816))

(assert (= (and b!1570819 (not c!145029)) b!1570814))

(assert (= (and b!1570814 c!145030) b!1570820))

(assert (= (and b!1570814 (not c!145030)) b!1570817))

(assert (= (or b!1570820 b!1570817) bm!72291))

(assert (= (or b!1570816 bm!72291) bm!72292))

(assert (= (or b!1570813 bm!72292) bm!72293))

(assert (= (and bm!72293 c!145031) b!1570818))

(assert (= (and bm!72293 (not c!145031)) b!1570811))

(assert (= (and d!164319 res!1073245) b!1570815))

(assert (= (and b!1570815 res!1073244) b!1570812))

(declare-fun m!1444793 () Bool)

(assert (=> b!1570818 m!1444793))

(declare-fun m!1444797 () Bool)

(assert (=> b!1570812 m!1444797))

(declare-fun m!1444801 () Bool)

(assert (=> bm!72293 m!1444801))

(declare-fun m!1444805 () Bool)

(assert (=> d!164319 m!1444805))

(assert (=> d!164319 m!1444737))

(declare-fun m!1444807 () Bool)

(assert (=> b!1570815 m!1444807))

(assert (=> b!1570691 d!164319))

(declare-fun e!875784 () List!36760)

(declare-fun b!1570841 () Bool)

(declare-fun c!145042 () Bool)

(declare-fun c!145041 () Bool)

(assert (=> b!1570841 (= e!875784 (ite c!145041 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (ite c!145042 (Cons!36756 (h!38203 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10))) Nil!36757)))))

(declare-fun bm!72300 () Bool)

(declare-fun call!72305 () List!36760)

(declare-fun call!72304 () List!36760)

(assert (=> bm!72300 (= call!72305 call!72304)))

(declare-fun lt!673446 () List!36760)

(declare-fun b!1570842 () Bool)

(declare-fun e!875786 () Bool)

(assert (=> b!1570842 (= e!875786 (contains!10431 lt!673446 (tuple2!25383 key1!37 v1!32)))))

(declare-fun b!1570843 () Bool)

(declare-fun e!875787 () List!36760)

(declare-fun call!72303 () List!36760)

(assert (=> b!1570843 (= e!875787 call!72303)))

(declare-fun b!1570844 () Bool)

(assert (=> b!1570844 (= c!145042 (and (is-Cons!36756 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (bvsgt (_1!12702 (h!38203 (insertStrictlySorted!601 l!750 key2!21 v2!10))) key1!37)))))

(declare-fun e!875785 () List!36760)

(declare-fun e!875783 () List!36760)

(assert (=> b!1570844 (= e!875785 e!875783)))

(declare-fun b!1570845 () Bool)

(declare-fun res!1073250 () Bool)

(assert (=> b!1570845 (=> (not res!1073250) (not e!875786))))

(assert (=> b!1570845 (= res!1073250 (containsKey!873 lt!673446 key1!37))))

(declare-fun bm!72301 () Bool)

(assert (=> bm!72301 (= call!72304 call!72303)))

(declare-fun b!1570846 () Bool)

(assert (=> b!1570846 (= e!875785 call!72304)))

(declare-fun c!145040 () Bool)

(declare-fun bm!72302 () Bool)

(assert (=> bm!72302 (= call!72303 ($colon$colon!1003 e!875784 (ite c!145040 (h!38203 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (tuple2!25383 key1!37 v1!32))))))

(declare-fun c!145043 () Bool)

(assert (=> bm!72302 (= c!145043 c!145040)))

(declare-fun b!1570847 () Bool)

(assert (=> b!1570847 (= e!875783 call!72305)))

(declare-fun b!1570848 () Bool)

(assert (=> b!1570848 (= e!875784 (insertStrictlySorted!601 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10)) key1!37 v1!32))))

(declare-fun d!164325 () Bool)

(assert (=> d!164325 e!875786))

(declare-fun res!1073251 () Bool)

(assert (=> d!164325 (=> (not res!1073251) (not e!875786))))

(assert (=> d!164325 (= res!1073251 (isStrictlySorted!1024 lt!673446))))

(assert (=> d!164325 (= lt!673446 e!875787)))

(assert (=> d!164325 (= c!145040 (and (is-Cons!36756 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (bvslt (_1!12702 (h!38203 (insertStrictlySorted!601 l!750 key2!21 v2!10))) key1!37)))))

(assert (=> d!164325 (isStrictlySorted!1024 (insertStrictlySorted!601 l!750 key2!21 v2!10))))

(assert (=> d!164325 (= (insertStrictlySorted!601 (insertStrictlySorted!601 l!750 key2!21 v2!10) key1!37 v1!32) lt!673446)))

(declare-fun b!1570849 () Bool)

(assert (=> b!1570849 (= e!875787 e!875785)))

(assert (=> b!1570849 (= c!145041 (and (is-Cons!36756 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (= (_1!12702 (h!38203 (insertStrictlySorted!601 l!750 key2!21 v2!10))) key1!37)))))

(declare-fun b!1570850 () Bool)

(assert (=> b!1570850 (= e!875783 call!72305)))

(assert (= (and d!164325 c!145040) b!1570843))

(assert (= (and d!164325 (not c!145040)) b!1570849))

(assert (= (and b!1570849 c!145041) b!1570846))

(assert (= (and b!1570849 (not c!145041)) b!1570844))

(assert (= (and b!1570844 c!145042) b!1570850))

(assert (= (and b!1570844 (not c!145042)) b!1570847))

(assert (= (or b!1570850 b!1570847) bm!72300))

(assert (= (or b!1570846 bm!72300) bm!72301))

(assert (= (or b!1570843 bm!72301) bm!72302))

(assert (= (and bm!72302 c!145043) b!1570848))

(assert (= (and bm!72302 (not c!145043)) b!1570841))

(assert (= (and d!164325 res!1073251) b!1570845))

(assert (= (and b!1570845 res!1073250) b!1570842))

(declare-fun m!1444824 () Bool)

(assert (=> b!1570848 m!1444824))

(declare-fun m!1444829 () Bool)

(assert (=> b!1570842 m!1444829))

(declare-fun m!1444833 () Bool)

(assert (=> bm!72302 m!1444833))

(declare-fun m!1444835 () Bool)

(assert (=> d!164325 m!1444835))

(assert (=> d!164325 m!1444743))

(declare-fun m!1444839 () Bool)

(assert (=> d!164325 m!1444839))

(declare-fun m!1444841 () Bool)

(assert (=> b!1570845 m!1444841))

(assert (=> b!1570691 d!164325))

(declare-fun e!875799 () List!36760)

(declare-fun c!145053 () Bool)

(declare-fun c!145054 () Bool)

(declare-fun b!1570871 () Bool)

(assert (=> b!1570871 (= e!875799 (ite c!145053 (t!51671 l!750) (ite c!145054 (Cons!36756 (h!38203 l!750) (t!51671 l!750)) Nil!36757)))))

(declare-fun bm!72309 () Bool)

(declare-fun call!72314 () List!36760)

(declare-fun call!72313 () List!36760)

(assert (=> bm!72309 (= call!72314 call!72313)))

(declare-fun b!1570872 () Bool)

(declare-fun lt!673449 () List!36760)

(declare-fun e!875801 () Bool)

(assert (=> b!1570872 (= e!875801 (contains!10431 lt!673449 (tuple2!25383 key2!21 v2!10)))))

(declare-fun b!1570873 () Bool)

(declare-fun e!875802 () List!36760)

(declare-fun call!72312 () List!36760)

(assert (=> b!1570873 (= e!875802 call!72312)))

(declare-fun b!1570874 () Bool)

(assert (=> b!1570874 (= c!145054 (and (is-Cons!36756 l!750) (bvsgt (_1!12702 (h!38203 l!750)) key2!21)))))

(declare-fun e!875800 () List!36760)

(declare-fun e!875798 () List!36760)

(assert (=> b!1570874 (= e!875800 e!875798)))

(declare-fun b!1570875 () Bool)

(declare-fun res!1073256 () Bool)

(assert (=> b!1570875 (=> (not res!1073256) (not e!875801))))

(assert (=> b!1570875 (= res!1073256 (containsKey!873 lt!673449 key2!21))))

(declare-fun bm!72310 () Bool)

(assert (=> bm!72310 (= call!72313 call!72312)))

(declare-fun b!1570876 () Bool)

(assert (=> b!1570876 (= e!875800 call!72313)))

(declare-fun c!145052 () Bool)

(declare-fun bm!72311 () Bool)

(assert (=> bm!72311 (= call!72312 ($colon$colon!1003 e!875799 (ite c!145052 (h!38203 l!750) (tuple2!25383 key2!21 v2!10))))))

(declare-fun c!145055 () Bool)

(assert (=> bm!72311 (= c!145055 c!145052)))

(declare-fun b!1570877 () Bool)

(assert (=> b!1570877 (= e!875798 call!72314)))

(declare-fun b!1570878 () Bool)

(assert (=> b!1570878 (= e!875799 (insertStrictlySorted!601 (t!51671 l!750) key2!21 v2!10))))

(declare-fun d!164331 () Bool)

(assert (=> d!164331 e!875801))

(declare-fun res!1073257 () Bool)

(assert (=> d!164331 (=> (not res!1073257) (not e!875801))))

(assert (=> d!164331 (= res!1073257 (isStrictlySorted!1024 lt!673449))))

(assert (=> d!164331 (= lt!673449 e!875802)))

(assert (=> d!164331 (= c!145052 (and (is-Cons!36756 l!750) (bvslt (_1!12702 (h!38203 l!750)) key2!21)))))

(assert (=> d!164331 (isStrictlySorted!1024 l!750)))

(assert (=> d!164331 (= (insertStrictlySorted!601 l!750 key2!21 v2!10) lt!673449)))

(declare-fun b!1570879 () Bool)

(assert (=> b!1570879 (= e!875802 e!875800)))

(assert (=> b!1570879 (= c!145053 (and (is-Cons!36756 l!750) (= (_1!12702 (h!38203 l!750)) key2!21)))))

(declare-fun b!1570880 () Bool)

(assert (=> b!1570880 (= e!875798 call!72314)))

(assert (= (and d!164331 c!145052) b!1570873))

(assert (= (and d!164331 (not c!145052)) b!1570879))

(assert (= (and b!1570879 c!145053) b!1570876))

(assert (= (and b!1570879 (not c!145053)) b!1570874))

(assert (= (and b!1570874 c!145054) b!1570880))

(assert (= (and b!1570874 (not c!145054)) b!1570877))

(assert (= (or b!1570880 b!1570877) bm!72309))

(assert (= (or b!1570876 bm!72309) bm!72310))

(assert (= (or b!1570873 bm!72310) bm!72311))

(assert (= (and bm!72311 c!145055) b!1570878))

(assert (= (and bm!72311 (not c!145055)) b!1570871))

(assert (= (and d!164331 res!1073257) b!1570875))

(assert (= (and b!1570875 res!1073256) b!1570872))

(declare-fun m!1444861 () Bool)

(assert (=> b!1570878 m!1444861))

(declare-fun m!1444863 () Bool)

(assert (=> b!1570872 m!1444863))

(declare-fun m!1444867 () Bool)

(assert (=> bm!72311 m!1444867))

(declare-fun m!1444871 () Bool)

(assert (=> d!164331 m!1444871))

(assert (=> d!164331 m!1444737))

(declare-fun m!1444873 () Bool)

(assert (=> b!1570875 m!1444873))

(assert (=> b!1570691 d!164331))

(declare-fun b!1570899 () Bool)

(declare-fun e!875812 () Bool)

(declare-fun tp!114242 () Bool)

(assert (=> b!1570899 (= e!875812 (and tp_is_empty!39107 tp!114242))))

(assert (=> b!1570692 (= tp!114237 e!875812)))

(assert (= (and b!1570692 (is-Cons!36756 (t!51671 l!750))) b!1570899))

(push 1)

(assert (not b!1570812))

(assert (not d!164325))

(assert (not bm!72311))

(assert (not bm!72302))

(assert (not b!1570875))

(assert (not b!1570899))

(assert tp_is_empty!39107)

(assert (not b!1570704))

(assert (not d!164319))

(assert (not d!164331))

(assert (not b!1570788))

(assert (not b!1570785))

(assert (not b!1570842))

(assert (not d!164311))

(assert (not b!1570872))

(assert (not b!1570848))

(assert (not bm!72284))

(assert (not b!1570878))

(assert (not b!1570782))

(assert (not b!1570845))

(assert (not b!1570818))

(assert (not b!1570815))

(assert (not bm!72293))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164427 () Bool)

(declare-fun res!1073356 () Bool)

(declare-fun e!875939 () Bool)

(assert (=> d!164427 (=> res!1073356 e!875939)))

(assert (=> d!164427 (= res!1073356 (and (is-Cons!36756 lt!673449) (= (_1!12702 (h!38203 lt!673449)) key2!21)))))

(assert (=> d!164427 (= (containsKey!873 lt!673449 key2!21) e!875939)))

(declare-fun b!1571068 () Bool)

(declare-fun e!875940 () Bool)

(assert (=> b!1571068 (= e!875939 e!875940)))

(declare-fun res!1073357 () Bool)

(assert (=> b!1571068 (=> (not res!1073357) (not e!875940))))

(assert (=> b!1571068 (= res!1073357 (and (or (not (is-Cons!36756 lt!673449)) (bvsle (_1!12702 (h!38203 lt!673449)) key2!21)) (is-Cons!36756 lt!673449) (bvslt (_1!12702 (h!38203 lt!673449)) key2!21)))))

(declare-fun b!1571069 () Bool)

(assert (=> b!1571069 (= e!875940 (containsKey!873 (t!51671 lt!673449) key2!21))))

(assert (= (and d!164427 (not res!1073356)) b!1571068))

(assert (= (and b!1571068 res!1073357) b!1571069))

(declare-fun m!1445057 () Bool)

(assert (=> b!1571069 m!1445057))

(assert (=> b!1570875 d!164427))

(declare-fun d!164429 () Bool)

(declare-fun lt!673473 () Bool)

(declare-fun content!823 (List!36760) (Set tuple2!25382))

(assert (=> d!164429 (= lt!673473 (member (tuple2!25383 key1!37 v1!32) (content!823 lt!673446)))))

(declare-fun e!875945 () Bool)

(assert (=> d!164429 (= lt!673473 e!875945)))

(declare-fun res!1073363 () Bool)

(assert (=> d!164429 (=> (not res!1073363) (not e!875945))))

(assert (=> d!164429 (= res!1073363 (is-Cons!36756 lt!673446))))

(assert (=> d!164429 (= (contains!10431 lt!673446 (tuple2!25383 key1!37 v1!32)) lt!673473)))

(declare-fun b!1571074 () Bool)

(declare-fun e!875946 () Bool)

(assert (=> b!1571074 (= e!875945 e!875946)))

(declare-fun res!1073362 () Bool)

(assert (=> b!1571074 (=> res!1073362 e!875946)))

(assert (=> b!1571074 (= res!1073362 (= (h!38203 lt!673446) (tuple2!25383 key1!37 v1!32)))))

(declare-fun b!1571075 () Bool)

(assert (=> b!1571075 (= e!875946 (contains!10431 (t!51671 lt!673446) (tuple2!25383 key1!37 v1!32)))))

(assert (= (and d!164429 res!1073363) b!1571074))

(assert (= (and b!1571074 (not res!1073362)) b!1571075))

(declare-fun m!1445059 () Bool)

(assert (=> d!164429 m!1445059))

(declare-fun m!1445061 () Bool)

(assert (=> d!164429 m!1445061))

(declare-fun m!1445063 () Bool)

(assert (=> b!1571075 m!1445063))

(assert (=> b!1570842 d!164429))

(declare-fun lt!673474 () Bool)

(declare-fun d!164431 () Bool)

(assert (=> d!164431 (= lt!673474 (member (tuple2!25383 key2!21 v2!10) (content!823 lt!673440)))))

(declare-fun e!875947 () Bool)

(assert (=> d!164431 (= lt!673474 e!875947)))

(declare-fun res!1073365 () Bool)

(assert (=> d!164431 (=> (not res!1073365) (not e!875947))))

(assert (=> d!164431 (= res!1073365 (is-Cons!36756 lt!673440))))

(assert (=> d!164431 (= (contains!10431 lt!673440 (tuple2!25383 key2!21 v2!10)) lt!673474)))

(declare-fun b!1571076 () Bool)

(declare-fun e!875948 () Bool)

(assert (=> b!1571076 (= e!875947 e!875948)))

(declare-fun res!1073364 () Bool)

(assert (=> b!1571076 (=> res!1073364 e!875948)))

(assert (=> b!1571076 (= res!1073364 (= (h!38203 lt!673440) (tuple2!25383 key2!21 v2!10)))))

(declare-fun b!1571077 () Bool)

(assert (=> b!1571077 (= e!875948 (contains!10431 (t!51671 lt!673440) (tuple2!25383 key2!21 v2!10)))))

(assert (= (and d!164431 res!1073365) b!1571076))

(assert (= (and b!1571076 (not res!1073364)) b!1571077))

(declare-fun m!1445065 () Bool)

(assert (=> d!164431 m!1445065))

(declare-fun m!1445067 () Bool)

(assert (=> d!164431 m!1445067))

(declare-fun m!1445069 () Bool)

(assert (=> b!1571077 m!1445069))

(assert (=> b!1570782 d!164431))

(declare-fun d!164433 () Bool)

(assert (=> d!164433 (= ($colon$colon!1003 e!875769 (ite c!145028 (h!38203 l!750) (tuple2!25383 key1!37 v1!32))) (Cons!36756 (ite c!145028 (h!38203 l!750) (tuple2!25383 key1!37 v1!32)) e!875769))))

(assert (=> bm!72293 d!164433))

(declare-fun d!164435 () Bool)

(declare-fun res!1073366 () Bool)

(declare-fun e!875949 () Bool)

(assert (=> d!164435 (=> res!1073366 e!875949)))

(assert (=> d!164435 (= res!1073366 (or (is-Nil!36757 lt!673446) (is-Nil!36757 (t!51671 lt!673446))))))

(assert (=> d!164435 (= (isStrictlySorted!1024 lt!673446) e!875949)))

(declare-fun b!1571078 () Bool)

(declare-fun e!875950 () Bool)

(assert (=> b!1571078 (= e!875949 e!875950)))

(declare-fun res!1073367 () Bool)

(assert (=> b!1571078 (=> (not res!1073367) (not e!875950))))

(assert (=> b!1571078 (= res!1073367 (bvslt (_1!12702 (h!38203 lt!673446)) (_1!12702 (h!38203 (t!51671 lt!673446)))))))

(declare-fun b!1571079 () Bool)

(assert (=> b!1571079 (= e!875950 (isStrictlySorted!1024 (t!51671 lt!673446)))))

(assert (= (and d!164435 (not res!1073366)) b!1571078))

(assert (= (and b!1571078 res!1073367) b!1571079))

(declare-fun m!1445071 () Bool)

(assert (=> b!1571079 m!1445071))

(assert (=> d!164325 d!164435))

(declare-fun d!164437 () Bool)

(declare-fun res!1073368 () Bool)

(declare-fun e!875951 () Bool)

(assert (=> d!164437 (=> res!1073368 e!875951)))

(assert (=> d!164437 (= res!1073368 (or (is-Nil!36757 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (is-Nil!36757 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10)))))))

(assert (=> d!164437 (= (isStrictlySorted!1024 (insertStrictlySorted!601 l!750 key2!21 v2!10)) e!875951)))

(declare-fun b!1571080 () Bool)

(declare-fun e!875952 () Bool)

(assert (=> b!1571080 (= e!875951 e!875952)))

(declare-fun res!1073369 () Bool)

(assert (=> b!1571080 (=> (not res!1073369) (not e!875952))))

(assert (=> b!1571080 (= res!1073369 (bvslt (_1!12702 (h!38203 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (_1!12702 (h!38203 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10))))))))

(declare-fun b!1571081 () Bool)

(assert (=> b!1571081 (= e!875952 (isStrictlySorted!1024 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10))))))

(assert (= (and d!164437 (not res!1073368)) b!1571080))

(assert (= (and b!1571080 res!1073369) b!1571081))

(declare-fun m!1445073 () Bool)

(assert (=> b!1571081 m!1445073))

(assert (=> d!164325 d!164437))

(declare-fun c!145093 () Bool)

(declare-fun e!875954 () List!36760)

(declare-fun b!1571082 () Bool)

(declare-fun c!145094 () Bool)

(assert (=> b!1571082 (= e!875954 (ite c!145093 (t!51671 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (ite c!145094 (Cons!36756 (h!38203 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (t!51671 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10)))) Nil!36757)))))

(declare-fun bm!72339 () Bool)

(declare-fun call!72344 () List!36760)

(declare-fun call!72343 () List!36760)

(assert (=> bm!72339 (= call!72344 call!72343)))

(declare-fun b!1571083 () Bool)

(declare-fun lt!673475 () List!36760)

(declare-fun e!875956 () Bool)

(assert (=> b!1571083 (= e!875956 (contains!10431 lt!673475 (tuple2!25383 key1!37 v1!32)))))

(declare-fun b!1571084 () Bool)

(declare-fun e!875957 () List!36760)

(declare-fun call!72342 () List!36760)

(assert (=> b!1571084 (= e!875957 call!72342)))

(declare-fun b!1571085 () Bool)

(assert (=> b!1571085 (= c!145094 (and (is-Cons!36756 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (bvsgt (_1!12702 (h!38203 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10)))) key1!37)))))

(declare-fun e!875955 () List!36760)

(declare-fun e!875953 () List!36760)

(assert (=> b!1571085 (= e!875955 e!875953)))

(declare-fun b!1571086 () Bool)

(declare-fun res!1073370 () Bool)

(assert (=> b!1571086 (=> (not res!1073370) (not e!875956))))

(assert (=> b!1571086 (= res!1073370 (containsKey!873 lt!673475 key1!37))))

(declare-fun bm!72340 () Bool)

(assert (=> bm!72340 (= call!72343 call!72342)))

(declare-fun b!1571087 () Bool)

(assert (=> b!1571087 (= e!875955 call!72343)))

(declare-fun bm!72341 () Bool)

(declare-fun c!145092 () Bool)

(assert (=> bm!72341 (= call!72342 ($colon$colon!1003 e!875954 (ite c!145092 (h!38203 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (tuple2!25383 key1!37 v1!32))))))

(declare-fun c!145095 () Bool)

(assert (=> bm!72341 (= c!145095 c!145092)))

(declare-fun b!1571088 () Bool)

(assert (=> b!1571088 (= e!875953 call!72344)))

(declare-fun b!1571089 () Bool)

(assert (=> b!1571089 (= e!875954 (insertStrictlySorted!601 (t!51671 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10))) key1!37 v1!32))))

(declare-fun d!164439 () Bool)

(assert (=> d!164439 e!875956))

(declare-fun res!1073371 () Bool)

(assert (=> d!164439 (=> (not res!1073371) (not e!875956))))

(assert (=> d!164439 (= res!1073371 (isStrictlySorted!1024 lt!673475))))

(assert (=> d!164439 (= lt!673475 e!875957)))

(assert (=> d!164439 (= c!145092 (and (is-Cons!36756 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (bvslt (_1!12702 (h!38203 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10)))) key1!37)))))

(assert (=> d!164439 (isStrictlySorted!1024 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10)))))

(assert (=> d!164439 (= (insertStrictlySorted!601 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10)) key1!37 v1!32) lt!673475)))

(declare-fun b!1571090 () Bool)

(assert (=> b!1571090 (= e!875957 e!875955)))

(assert (=> b!1571090 (= c!145093 (and (is-Cons!36756 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (= (_1!12702 (h!38203 (t!51671 (insertStrictlySorted!601 l!750 key2!21 v2!10)))) key1!37)))))

(declare-fun b!1571091 () Bool)

(assert (=> b!1571091 (= e!875953 call!72344)))

(assert (= (and d!164439 c!145092) b!1571084))

(assert (= (and d!164439 (not c!145092)) b!1571090))

(assert (= (and b!1571090 c!145093) b!1571087))

(assert (= (and b!1571090 (not c!145093)) b!1571085))

(assert (= (and b!1571085 c!145094) b!1571091))

(assert (= (and b!1571085 (not c!145094)) b!1571088))

(assert (= (or b!1571091 b!1571088) bm!72339))

(assert (= (or b!1571087 bm!72339) bm!72340))

(assert (= (or b!1571084 bm!72340) bm!72341))

(assert (= (and bm!72341 c!145095) b!1571089))

(assert (= (and bm!72341 (not c!145095)) b!1571082))

(assert (= (and d!164439 res!1073371) b!1571086))

(assert (= (and b!1571086 res!1073370) b!1571083))

(declare-fun m!1445075 () Bool)

(assert (=> b!1571089 m!1445075))

(declare-fun m!1445077 () Bool)

(assert (=> b!1571083 m!1445077))

(declare-fun m!1445079 () Bool)

(assert (=> bm!72341 m!1445079))

(declare-fun m!1445081 () Bool)

(assert (=> d!164439 m!1445081))

(assert (=> d!164439 m!1445073))

(declare-fun m!1445083 () Bool)

(assert (=> b!1571086 m!1445083))

(assert (=> b!1570848 d!164439))

(declare-fun d!164441 () Bool)

(declare-fun res!1073372 () Bool)

(declare-fun e!875958 () Bool)

(assert (=> d!164441 (=> res!1073372 e!875958)))

(assert (=> d!164441 (= res!1073372 (or (is-Nil!36757 lt!673443) (is-Nil!36757 (t!51671 lt!673443))))))

(assert (=> d!164441 (= (isStrictlySorted!1024 lt!673443) e!875958)))

(declare-fun b!1571092 () Bool)

(declare-fun e!875959 () Bool)

(assert (=> b!1571092 (= e!875958 e!875959)))

(declare-fun res!1073373 () Bool)

(assert (=> b!1571092 (=> (not res!1073373) (not e!875959))))

(assert (=> b!1571092 (= res!1073373 (bvslt (_1!12702 (h!38203 lt!673443)) (_1!12702 (h!38203 (t!51671 lt!673443)))))))

(declare-fun b!1571093 () Bool)

(assert (=> b!1571093 (= e!875959 (isStrictlySorted!1024 (t!51671 lt!673443)))))

(assert (= (and d!164441 (not res!1073372)) b!1571092))

(assert (= (and b!1571092 res!1073373) b!1571093))

(declare-fun m!1445085 () Bool)

(assert (=> b!1571093 m!1445085))

(assert (=> d!164319 d!164441))

(assert (=> d!164319 d!164305))

(declare-fun e!875961 () List!36760)

(declare-fun c!145097 () Bool)

(declare-fun b!1571094 () Bool)

(declare-fun c!145098 () Bool)

(assert (=> b!1571094 (= e!875961 (ite c!145097 (t!51671 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (ite c!145098 (Cons!36756 (h!38203 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (t!51671 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32)))) Nil!36757)))))

(declare-fun bm!72342 () Bool)

(declare-fun call!72347 () List!36760)

(declare-fun call!72346 () List!36760)

(assert (=> bm!72342 (= call!72347 call!72346)))

(declare-fun e!875963 () Bool)

(declare-fun b!1571095 () Bool)

(declare-fun lt!673476 () List!36760)

(assert (=> b!1571095 (= e!875963 (contains!10431 lt!673476 (tuple2!25383 key2!21 v2!10)))))

(declare-fun b!1571096 () Bool)

(declare-fun e!875964 () List!36760)

(declare-fun call!72345 () List!36760)

(assert (=> b!1571096 (= e!875964 call!72345)))

(declare-fun b!1571097 () Bool)

(assert (=> b!1571097 (= c!145098 (and (is-Cons!36756 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (bvsgt (_1!12702 (h!38203 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32)))) key2!21)))))

(declare-fun e!875962 () List!36760)

(declare-fun e!875960 () List!36760)

(assert (=> b!1571097 (= e!875962 e!875960)))

(declare-fun b!1571098 () Bool)

(declare-fun res!1073374 () Bool)

(assert (=> b!1571098 (=> (not res!1073374) (not e!875963))))

(assert (=> b!1571098 (= res!1073374 (containsKey!873 lt!673476 key2!21))))

(declare-fun bm!72343 () Bool)

(assert (=> bm!72343 (= call!72346 call!72345)))

(declare-fun b!1571099 () Bool)

(assert (=> b!1571099 (= e!875962 call!72346)))

(declare-fun c!145096 () Bool)

(declare-fun bm!72344 () Bool)

(assert (=> bm!72344 (= call!72345 ($colon$colon!1003 e!875961 (ite c!145096 (h!38203 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (tuple2!25383 key2!21 v2!10))))))

(declare-fun c!145099 () Bool)

(assert (=> bm!72344 (= c!145099 c!145096)))

(declare-fun b!1571100 () Bool)

(assert (=> b!1571100 (= e!875960 call!72347)))

(declare-fun b!1571101 () Bool)

(assert (=> b!1571101 (= e!875961 (insertStrictlySorted!601 (t!51671 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32))) key2!21 v2!10))))

(declare-fun d!164443 () Bool)

(assert (=> d!164443 e!875963))

(declare-fun res!1073375 () Bool)

(assert (=> d!164443 (=> (not res!1073375) (not e!875963))))

(assert (=> d!164443 (= res!1073375 (isStrictlySorted!1024 lt!673476))))

(assert (=> d!164443 (= lt!673476 e!875964)))

(assert (=> d!164443 (= c!145096 (and (is-Cons!36756 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (bvslt (_1!12702 (h!38203 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32)))) key2!21)))))

(assert (=> d!164443 (isStrictlySorted!1024 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32)))))

(assert (=> d!164443 (= (insertStrictlySorted!601 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32)) key2!21 v2!10) lt!673476)))

(declare-fun b!1571102 () Bool)

(assert (=> b!1571102 (= e!875964 e!875962)))

(assert (=> b!1571102 (= c!145097 (and (is-Cons!36756 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (= (_1!12702 (h!38203 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32)))) key2!21)))))

(declare-fun b!1571103 () Bool)

(assert (=> b!1571103 (= e!875960 call!72347)))

(assert (= (and d!164443 c!145096) b!1571096))

(assert (= (and d!164443 (not c!145096)) b!1571102))

(assert (= (and b!1571102 c!145097) b!1571099))

(assert (= (and b!1571102 (not c!145097)) b!1571097))

(assert (= (and b!1571097 c!145098) b!1571103))

(assert (= (and b!1571097 (not c!145098)) b!1571100))

(assert (= (or b!1571103 b!1571100) bm!72342))

(assert (= (or b!1571099 bm!72342) bm!72343))

(assert (= (or b!1571096 bm!72343) bm!72344))

(assert (= (and bm!72344 c!145099) b!1571101))

(assert (= (and bm!72344 (not c!145099)) b!1571094))

(assert (= (and d!164443 res!1073375) b!1571098))

(assert (= (and b!1571098 res!1073374) b!1571095))

(declare-fun m!1445087 () Bool)

(assert (=> b!1571101 m!1445087))

(declare-fun m!1445089 () Bool)

(assert (=> b!1571095 m!1445089))

(declare-fun m!1445091 () Bool)

(assert (=> bm!72344 m!1445091))

(declare-fun m!1445093 () Bool)

(assert (=> d!164443 m!1445093))

(declare-fun m!1445095 () Bool)

(assert (=> d!164443 m!1445095))

(declare-fun m!1445097 () Bool)

(assert (=> b!1571098 m!1445097))

(assert (=> b!1570788 d!164443))

(declare-fun d!164445 () Bool)

(declare-fun res!1073376 () Bool)

(declare-fun e!875965 () Bool)

(assert (=> d!164445 (=> res!1073376 e!875965)))

(assert (=> d!164445 (= res!1073376 (and (is-Cons!36756 lt!673443) (= (_1!12702 (h!38203 lt!673443)) key1!37)))))

(assert (=> d!164445 (= (containsKey!873 lt!673443 key1!37) e!875965)))

(declare-fun b!1571104 () Bool)

(declare-fun e!875966 () Bool)

(assert (=> b!1571104 (= e!875965 e!875966)))

(declare-fun res!1073377 () Bool)

(assert (=> b!1571104 (=> (not res!1073377) (not e!875966))))

(assert (=> b!1571104 (= res!1073377 (and (or (not (is-Cons!36756 lt!673443)) (bvsle (_1!12702 (h!38203 lt!673443)) key1!37)) (is-Cons!36756 lt!673443) (bvslt (_1!12702 (h!38203 lt!673443)) key1!37)))))

(declare-fun b!1571105 () Bool)

(assert (=> b!1571105 (= e!875966 (containsKey!873 (t!51671 lt!673443) key1!37))))

(assert (= (and d!164445 (not res!1073376)) b!1571104))

(assert (= (and b!1571104 res!1073377) b!1571105))

(declare-fun m!1445099 () Bool)

(assert (=> b!1571105 m!1445099))

(assert (=> b!1570815 d!164445))

(declare-fun d!164447 () Bool)

(declare-fun res!1073378 () Bool)

(declare-fun e!875967 () Bool)

(assert (=> d!164447 (=> res!1073378 e!875967)))

(assert (=> d!164447 (= res!1073378 (or (is-Nil!36757 (t!51671 l!750)) (is-Nil!36757 (t!51671 (t!51671 l!750)))))))

(assert (=> d!164447 (= (isStrictlySorted!1024 (t!51671 l!750)) e!875967)))

(declare-fun b!1571106 () Bool)

(declare-fun e!875968 () Bool)

(assert (=> b!1571106 (= e!875967 e!875968)))

(declare-fun res!1073379 () Bool)

(assert (=> b!1571106 (=> (not res!1073379) (not e!875968))))

(assert (=> b!1571106 (= res!1073379 (bvslt (_1!12702 (h!38203 (t!51671 l!750))) (_1!12702 (h!38203 (t!51671 (t!51671 l!750))))))))

(declare-fun b!1571107 () Bool)

(assert (=> b!1571107 (= e!875968 (isStrictlySorted!1024 (t!51671 (t!51671 l!750))))))

(assert (= (and d!164447 (not res!1073378)) b!1571106))

(assert (= (and b!1571106 res!1073379) b!1571107))

(declare-fun m!1445101 () Bool)

(assert (=> b!1571107 m!1445101))

(assert (=> b!1570704 d!164447))

(declare-fun d!164449 () Bool)

(declare-fun res!1073380 () Bool)

(declare-fun e!875969 () Bool)

(assert (=> d!164449 (=> res!1073380 e!875969)))

(assert (=> d!164449 (= res!1073380 (or (is-Nil!36757 lt!673440) (is-Nil!36757 (t!51671 lt!673440))))))

(assert (=> d!164449 (= (isStrictlySorted!1024 lt!673440) e!875969)))

(declare-fun b!1571108 () Bool)

(declare-fun e!875970 () Bool)

(assert (=> b!1571108 (= e!875969 e!875970)))

(declare-fun res!1073381 () Bool)

(assert (=> b!1571108 (=> (not res!1073381) (not e!875970))))

(assert (=> b!1571108 (= res!1073381 (bvslt (_1!12702 (h!38203 lt!673440)) (_1!12702 (h!38203 (t!51671 lt!673440)))))))

(declare-fun b!1571109 () Bool)

(assert (=> b!1571109 (= e!875970 (isStrictlySorted!1024 (t!51671 lt!673440)))))

(assert (= (and d!164449 (not res!1073380)) b!1571108))

(assert (= (and b!1571108 res!1073381) b!1571109))

(declare-fun m!1445103 () Bool)

(assert (=> b!1571109 m!1445103))

(assert (=> d!164311 d!164449))

(declare-fun d!164451 () Bool)

(declare-fun res!1073382 () Bool)

(declare-fun e!875971 () Bool)

(assert (=> d!164451 (=> res!1073382 e!875971)))

(assert (=> d!164451 (= res!1073382 (or (is-Nil!36757 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (is-Nil!36757 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32)))))))

(assert (=> d!164451 (= (isStrictlySorted!1024 (insertStrictlySorted!601 l!750 key1!37 v1!32)) e!875971)))

(declare-fun b!1571110 () Bool)

(declare-fun e!875972 () Bool)

(assert (=> b!1571110 (= e!875971 e!875972)))

(declare-fun res!1073383 () Bool)

(assert (=> b!1571110 (=> (not res!1073383) (not e!875972))))

(assert (=> b!1571110 (= res!1073383 (bvslt (_1!12702 (h!38203 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (_1!12702 (h!38203 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32))))))))

(declare-fun b!1571111 () Bool)

(assert (=> b!1571111 (= e!875972 (isStrictlySorted!1024 (t!51671 (insertStrictlySorted!601 l!750 key1!37 v1!32))))))

(assert (= (and d!164451 (not res!1073382)) b!1571110))

(assert (= (and b!1571110 res!1073383) b!1571111))

(assert (=> b!1571111 m!1445095))

(assert (=> d!164311 d!164451))

(declare-fun lt!673477 () Bool)

(declare-fun d!164453 () Bool)

(assert (=> d!164453 (= lt!673477 (member (tuple2!25383 key1!37 v1!32) (content!823 lt!673443)))))

(declare-fun e!875973 () Bool)

(assert (=> d!164453 (= lt!673477 e!875973)))

(declare-fun res!1073385 () Bool)

(assert (=> d!164453 (=> (not res!1073385) (not e!875973))))

(assert (=> d!164453 (= res!1073385 (is-Cons!36756 lt!673443))))

(assert (=> d!164453 (= (contains!10431 lt!673443 (tuple2!25383 key1!37 v1!32)) lt!673477)))

(declare-fun b!1571112 () Bool)

(declare-fun e!875974 () Bool)

(assert (=> b!1571112 (= e!875973 e!875974)))

(declare-fun res!1073384 () Bool)

(assert (=> b!1571112 (=> res!1073384 e!875974)))

(assert (=> b!1571112 (= res!1073384 (= (h!38203 lt!673443) (tuple2!25383 key1!37 v1!32)))))

(declare-fun b!1571113 () Bool)

(assert (=> b!1571113 (= e!875974 (contains!10431 (t!51671 lt!673443) (tuple2!25383 key1!37 v1!32)))))

(assert (= (and d!164453 res!1073385) b!1571112))

(assert (= (and b!1571112 (not res!1073384)) b!1571113))

(declare-fun m!1445105 () Bool)

(assert (=> d!164453 m!1445105))

(declare-fun m!1445107 () Bool)

(assert (=> d!164453 m!1445107))

(declare-fun m!1445109 () Bool)

(assert (=> b!1571113 m!1445109))

(assert (=> b!1570812 d!164453))

(declare-fun d!164455 () Bool)

(assert (=> d!164455 (= ($colon$colon!1003 e!875784 (ite c!145040 (h!38203 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (tuple2!25383 key1!37 v1!32))) (Cons!36756 (ite c!145040 (h!38203 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (tuple2!25383 key1!37 v1!32)) e!875784))))

(assert (=> bm!72302 d!164455))

(declare-fun d!164457 () Bool)

(assert (=> d!164457 (= ($colon$colon!1003 e!875754 (ite c!145016 (h!38203 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (tuple2!25383 key2!21 v2!10))) (Cons!36756 (ite c!145016 (h!38203 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (tuple2!25383 key2!21 v2!10)) e!875754))))

(assert (=> bm!72284 d!164457))

(declare-fun d!164459 () Bool)

(declare-fun lt!673478 () Bool)

(assert (=> d!164459 (= lt!673478 (member (tuple2!25383 key2!21 v2!10) (content!823 lt!673449)))))

(declare-fun e!875975 () Bool)

(assert (=> d!164459 (= lt!673478 e!875975)))

(declare-fun res!1073387 () Bool)

(assert (=> d!164459 (=> (not res!1073387) (not e!875975))))

(assert (=> d!164459 (= res!1073387 (is-Cons!36756 lt!673449))))

(assert (=> d!164459 (= (contains!10431 lt!673449 (tuple2!25383 key2!21 v2!10)) lt!673478)))

(declare-fun b!1571114 () Bool)

(declare-fun e!875976 () Bool)

(assert (=> b!1571114 (= e!875975 e!875976)))

(declare-fun res!1073386 () Bool)

(assert (=> b!1571114 (=> res!1073386 e!875976)))

(assert (=> b!1571114 (= res!1073386 (= (h!38203 lt!673449) (tuple2!25383 key2!21 v2!10)))))

(declare-fun b!1571115 () Bool)

(assert (=> b!1571115 (= e!875976 (contains!10431 (t!51671 lt!673449) (tuple2!25383 key2!21 v2!10)))))

(assert (= (and d!164459 res!1073387) b!1571114))

(assert (= (and b!1571114 (not res!1073386)) b!1571115))

(declare-fun m!1445111 () Bool)

(assert (=> d!164459 m!1445111))

(declare-fun m!1445113 () Bool)

(assert (=> d!164459 m!1445113))

(declare-fun m!1445115 () Bool)

(assert (=> b!1571115 m!1445115))

(assert (=> b!1570872 d!164459))

(declare-fun d!164461 () Bool)

(declare-fun res!1073388 () Bool)

(declare-fun e!875977 () Bool)

(assert (=> d!164461 (=> res!1073388 e!875977)))

(assert (=> d!164461 (= res!1073388 (or (is-Nil!36757 lt!673449) (is-Nil!36757 (t!51671 lt!673449))))))

(assert (=> d!164461 (= (isStrictlySorted!1024 lt!673449) e!875977)))

(declare-fun b!1571116 () Bool)

(declare-fun e!875978 () Bool)

(assert (=> b!1571116 (= e!875977 e!875978)))

(declare-fun res!1073389 () Bool)

(assert (=> b!1571116 (=> (not res!1073389) (not e!875978))))

(assert (=> b!1571116 (= res!1073389 (bvslt (_1!12702 (h!38203 lt!673449)) (_1!12702 (h!38203 (t!51671 lt!673449)))))))

(declare-fun b!1571117 () Bool)

(assert (=> b!1571117 (= e!875978 (isStrictlySorted!1024 (t!51671 lt!673449)))))

(assert (= (and d!164461 (not res!1073388)) b!1571116))

(assert (= (and b!1571116 res!1073389) b!1571117))

(declare-fun m!1445117 () Bool)

(assert (=> b!1571117 m!1445117))

(assert (=> d!164331 d!164461))

(assert (=> d!164331 d!164305))

(declare-fun d!164463 () Bool)

(assert (=> d!164463 (= ($colon$colon!1003 e!875799 (ite c!145052 (h!38203 l!750) (tuple2!25383 key2!21 v2!10))) (Cons!36756 (ite c!145052 (h!38203 l!750) (tuple2!25383 key2!21 v2!10)) e!875799))))

(assert (=> bm!72311 d!164463))

(declare-fun b!1571118 () Bool)

(declare-fun c!145101 () Bool)

(declare-fun c!145102 () Bool)

(declare-fun e!875980 () List!36760)

(assert (=> b!1571118 (= e!875980 (ite c!145101 (t!51671 (t!51671 l!750)) (ite c!145102 (Cons!36756 (h!38203 (t!51671 l!750)) (t!51671 (t!51671 l!750))) Nil!36757)))))

(declare-fun bm!72345 () Bool)

(declare-fun call!72350 () List!36760)

(declare-fun call!72349 () List!36760)

(assert (=> bm!72345 (= call!72350 call!72349)))

(declare-fun e!875982 () Bool)

(declare-fun lt!673479 () List!36760)

(declare-fun b!1571119 () Bool)

(assert (=> b!1571119 (= e!875982 (contains!10431 lt!673479 (tuple2!25383 key1!37 v1!32)))))

(declare-fun b!1571120 () Bool)

(declare-fun e!875983 () List!36760)

(declare-fun call!72348 () List!36760)

(assert (=> b!1571120 (= e!875983 call!72348)))

(declare-fun b!1571121 () Bool)

(assert (=> b!1571121 (= c!145102 (and (is-Cons!36756 (t!51671 l!750)) (bvsgt (_1!12702 (h!38203 (t!51671 l!750))) key1!37)))))

(declare-fun e!875981 () List!36760)

(declare-fun e!875979 () List!36760)

(assert (=> b!1571121 (= e!875981 e!875979)))

(declare-fun b!1571122 () Bool)

(declare-fun res!1073390 () Bool)

(assert (=> b!1571122 (=> (not res!1073390) (not e!875982))))

(assert (=> b!1571122 (= res!1073390 (containsKey!873 lt!673479 key1!37))))

(declare-fun bm!72346 () Bool)

(assert (=> bm!72346 (= call!72349 call!72348)))

(declare-fun b!1571123 () Bool)

(assert (=> b!1571123 (= e!875981 call!72349)))

(declare-fun bm!72347 () Bool)

(declare-fun c!145100 () Bool)

(assert (=> bm!72347 (= call!72348 ($colon$colon!1003 e!875980 (ite c!145100 (h!38203 (t!51671 l!750)) (tuple2!25383 key1!37 v1!32))))))

(declare-fun c!145103 () Bool)

(assert (=> bm!72347 (= c!145103 c!145100)))

(declare-fun b!1571124 () Bool)

(assert (=> b!1571124 (= e!875979 call!72350)))

(declare-fun b!1571125 () Bool)

(assert (=> b!1571125 (= e!875980 (insertStrictlySorted!601 (t!51671 (t!51671 l!750)) key1!37 v1!32))))

(declare-fun d!164465 () Bool)

(assert (=> d!164465 e!875982))

(declare-fun res!1073391 () Bool)

(assert (=> d!164465 (=> (not res!1073391) (not e!875982))))

(assert (=> d!164465 (= res!1073391 (isStrictlySorted!1024 lt!673479))))

(assert (=> d!164465 (= lt!673479 e!875983)))

(assert (=> d!164465 (= c!145100 (and (is-Cons!36756 (t!51671 l!750)) (bvslt (_1!12702 (h!38203 (t!51671 l!750))) key1!37)))))

(assert (=> d!164465 (isStrictlySorted!1024 (t!51671 l!750))))

(assert (=> d!164465 (= (insertStrictlySorted!601 (t!51671 l!750) key1!37 v1!32) lt!673479)))

(declare-fun b!1571126 () Bool)

(assert (=> b!1571126 (= e!875983 e!875981)))

(assert (=> b!1571126 (= c!145101 (and (is-Cons!36756 (t!51671 l!750)) (= (_1!12702 (h!38203 (t!51671 l!750))) key1!37)))))

(declare-fun b!1571127 () Bool)

(assert (=> b!1571127 (= e!875979 call!72350)))

(assert (= (and d!164465 c!145100) b!1571120))

(assert (= (and d!164465 (not c!145100)) b!1571126))

(assert (= (and b!1571126 c!145101) b!1571123))

(assert (= (and b!1571126 (not c!145101)) b!1571121))

(assert (= (and b!1571121 c!145102) b!1571127))

(assert (= (and b!1571121 (not c!145102)) b!1571124))

(assert (= (or b!1571127 b!1571124) bm!72345))

(assert (= (or b!1571123 bm!72345) bm!72346))

(assert (= (or b!1571120 bm!72346) bm!72347))

(assert (= (and bm!72347 c!145103) b!1571125))

(assert (= (and bm!72347 (not c!145103)) b!1571118))

(assert (= (and d!164465 res!1073391) b!1571122))

(assert (= (and b!1571122 res!1073390) b!1571119))

(declare-fun m!1445119 () Bool)

(assert (=> b!1571125 m!1445119))

(declare-fun m!1445121 () Bool)

(assert (=> b!1571119 m!1445121))

(declare-fun m!1445123 () Bool)

(assert (=> bm!72347 m!1445123))

(declare-fun m!1445125 () Bool)

(assert (=> d!164465 m!1445125))

(assert (=> d!164465 m!1444747))

(declare-fun m!1445127 () Bool)

(assert (=> b!1571122 m!1445127))

(assert (=> b!1570818 d!164465))

(declare-fun d!164467 () Bool)

(declare-fun res!1073392 () Bool)

(declare-fun e!875984 () Bool)

(assert (=> d!164467 (=> res!1073392 e!875984)))

(assert (=> d!164467 (= res!1073392 (and (is-Cons!36756 lt!673446) (= (_1!12702 (h!38203 lt!673446)) key1!37)))))

(assert (=> d!164467 (= (containsKey!873 lt!673446 key1!37) e!875984)))

(declare-fun b!1571128 () Bool)

(declare-fun e!875985 () Bool)

(assert (=> b!1571128 (= e!875984 e!875985)))

(declare-fun res!1073393 () Bool)

(assert (=> b!1571128 (=> (not res!1073393) (not e!875985))))

(assert (=> b!1571128 (= res!1073393 (and (or (not (is-Cons!36756 lt!673446)) (bvsle (_1!12702 (h!38203 lt!673446)) key1!37)) (is-Cons!36756 lt!673446) (bvslt (_1!12702 (h!38203 lt!673446)) key1!37)))))

(declare-fun b!1571129 () Bool)

(assert (=> b!1571129 (= e!875985 (containsKey!873 (t!51671 lt!673446) key1!37))))

(assert (= (and d!164467 (not res!1073392)) b!1571128))

(assert (= (and b!1571128 res!1073393) b!1571129))

(declare-fun m!1445129 () Bool)

(assert (=> b!1571129 m!1445129))

(assert (=> b!1570845 d!164467))

(declare-fun e!875987 () List!36760)

(declare-fun c!145106 () Bool)

(declare-fun c!145105 () Bool)

(declare-fun b!1571130 () Bool)

(assert (=> b!1571130 (= e!875987 (ite c!145105 (t!51671 (t!51671 l!750)) (ite c!145106 (Cons!36756 (h!38203 (t!51671 l!750)) (t!51671 (t!51671 l!750))) Nil!36757)))))

(declare-fun bm!72348 () Bool)

(declare-fun call!72353 () List!36760)

(declare-fun call!72352 () List!36760)

(assert (=> bm!72348 (= call!72353 call!72352)))

(declare-fun b!1571131 () Bool)

(declare-fun lt!673480 () List!36760)

(declare-fun e!875989 () Bool)

(assert (=> b!1571131 (= e!875989 (contains!10431 lt!673480 (tuple2!25383 key2!21 v2!10)))))

(declare-fun b!1571132 () Bool)

(declare-fun e!875990 () List!36760)

(declare-fun call!72351 () List!36760)

(assert (=> b!1571132 (= e!875990 call!72351)))

(declare-fun b!1571133 () Bool)

(assert (=> b!1571133 (= c!145106 (and (is-Cons!36756 (t!51671 l!750)) (bvsgt (_1!12702 (h!38203 (t!51671 l!750))) key2!21)))))

(declare-fun e!875988 () List!36760)

(declare-fun e!875986 () List!36760)

(assert (=> b!1571133 (= e!875988 e!875986)))

(declare-fun b!1571134 () Bool)

(declare-fun res!1073394 () Bool)

(assert (=> b!1571134 (=> (not res!1073394) (not e!875989))))

(assert (=> b!1571134 (= res!1073394 (containsKey!873 lt!673480 key2!21))))

(declare-fun bm!72349 () Bool)

(assert (=> bm!72349 (= call!72352 call!72351)))

(declare-fun b!1571135 () Bool)

(assert (=> b!1571135 (= e!875988 call!72352)))

(declare-fun c!145104 () Bool)

(declare-fun bm!72350 () Bool)

(assert (=> bm!72350 (= call!72351 ($colon$colon!1003 e!875987 (ite c!145104 (h!38203 (t!51671 l!750)) (tuple2!25383 key2!21 v2!10))))))

(declare-fun c!145107 () Bool)

(assert (=> bm!72350 (= c!145107 c!145104)))

(declare-fun b!1571136 () Bool)

(assert (=> b!1571136 (= e!875986 call!72353)))

(declare-fun b!1571137 () Bool)

(assert (=> b!1571137 (= e!875987 (insertStrictlySorted!601 (t!51671 (t!51671 l!750)) key2!21 v2!10))))

(declare-fun d!164469 () Bool)

(assert (=> d!164469 e!875989))

(declare-fun res!1073395 () Bool)

(assert (=> d!164469 (=> (not res!1073395) (not e!875989))))

(assert (=> d!164469 (= res!1073395 (isStrictlySorted!1024 lt!673480))))

(assert (=> d!164469 (= lt!673480 e!875990)))

(assert (=> d!164469 (= c!145104 (and (is-Cons!36756 (t!51671 l!750)) (bvslt (_1!12702 (h!38203 (t!51671 l!750))) key2!21)))))

(assert (=> d!164469 (isStrictlySorted!1024 (t!51671 l!750))))

(assert (=> d!164469 (= (insertStrictlySorted!601 (t!51671 l!750) key2!21 v2!10) lt!673480)))

(declare-fun b!1571138 () Bool)

(assert (=> b!1571138 (= e!875990 e!875988)))

(assert (=> b!1571138 (= c!145105 (and (is-Cons!36756 (t!51671 l!750)) (= (_1!12702 (h!38203 (t!51671 l!750))) key2!21)))))

(declare-fun b!1571139 () Bool)

(assert (=> b!1571139 (= e!875986 call!72353)))

(assert (= (and d!164469 c!145104) b!1571132))

(assert (= (and d!164469 (not c!145104)) b!1571138))

(assert (= (and b!1571138 c!145105) b!1571135))

(assert (= (and b!1571138 (not c!145105)) b!1571133))

(assert (= (and b!1571133 c!145106) b!1571139))

(assert (= (and b!1571133 (not c!145106)) b!1571136))

(assert (= (or b!1571139 b!1571136) bm!72348))

(assert (= (or b!1571135 bm!72348) bm!72349))

(assert (= (or b!1571132 bm!72349) bm!72350))

(assert (= (and bm!72350 c!145107) b!1571137))

(assert (= (and bm!72350 (not c!145107)) b!1571130))

(assert (= (and d!164469 res!1073395) b!1571134))

(assert (= (and b!1571134 res!1073394) b!1571131))

(declare-fun m!1445131 () Bool)

(assert (=> b!1571137 m!1445131))

(declare-fun m!1445133 () Bool)

(assert (=> b!1571131 m!1445133))

(declare-fun m!1445135 () Bool)

(assert (=> bm!72350 m!1445135))

(declare-fun m!1445137 () Bool)

(assert (=> d!164469 m!1445137))

(assert (=> d!164469 m!1444747))

(declare-fun m!1445139 () Bool)

(assert (=> b!1571134 m!1445139))

(assert (=> b!1570878 d!164469))

(declare-fun d!164471 () Bool)

(declare-fun res!1073396 () Bool)

(declare-fun e!875991 () Bool)

(assert (=> d!164471 (=> res!1073396 e!875991)))

(assert (=> d!164471 (= res!1073396 (and (is-Cons!36756 lt!673440) (= (_1!12702 (h!38203 lt!673440)) key2!21)))))

(assert (=> d!164471 (= (containsKey!873 lt!673440 key2!21) e!875991)))

(declare-fun b!1571140 () Bool)

(declare-fun e!875992 () Bool)

(assert (=> b!1571140 (= e!875991 e!875992)))

(declare-fun res!1073397 () Bool)

(assert (=> b!1571140 (=> (not res!1073397) (not e!875992))))

(assert (=> b!1571140 (= res!1073397 (and (or (not (is-Cons!36756 lt!673440)) (bvsle (_1!12702 (h!38203 lt!673440)) key2!21)) (is-Cons!36756 lt!673440) (bvslt (_1!12702 (h!38203 lt!673440)) key2!21)))))

(declare-fun b!1571141 () Bool)

(assert (=> b!1571141 (= e!875992 (containsKey!873 (t!51671 lt!673440) key2!21))))

(assert (= (and d!164471 (not res!1073396)) b!1571140))

(assert (= (and b!1571140 res!1073397) b!1571141))

(declare-fun m!1445141 () Bool)

(assert (=> b!1571141 m!1445141))

(assert (=> b!1570785 d!164471))

(declare-fun b!1571142 () Bool)

(declare-fun e!875993 () Bool)

(declare-fun tp!114249 () Bool)

(assert (=> b!1571142 (= e!875993 (and tp_is_empty!39107 tp!114249))))

(assert (=> b!1570899 (= tp!114242 e!875993)))

(assert (= (and b!1570899 (is-Cons!36756 (t!51671 (t!51671 l!750)))) b!1571142))

(push 1)

(assert (not b!1571115))

(assert (not b!1571109))

(assert (not d!164453))

(assert (not d!164429))

(assert (not d!164465))

(assert (not b!1571105))

(assert tp_is_empty!39107)

(assert (not b!1571117))

(assert (not b!1571107))

(assert (not d!164439))

(assert (not b!1571129))

(assert (not b!1571098))

(assert (not b!1571134))

(assert (not b!1571069))

(assert (not b!1571077))

(assert (not bm!72341))

(assert (not b!1571141))

(assert (not b!1571119))

(assert (not b!1571137))

(assert (not bm!72344))

(assert (not b!1571093))

(assert (not b!1571113))

(assert (not d!164459))

(assert (not bm!72347))

(assert (not b!1571083))

(assert (not b!1571111))

(assert (not b!1571086))

(assert (not b!1571081))

(assert (not b!1571095))

(assert (not b!1571131))

(assert (not b!1571075))

(assert (not b!1571079))

(assert (not d!164443))

(assert (not bm!72350))

(assert (not b!1571125))

(assert (not b!1571122))

(assert (not d!164431))

(assert (not b!1571142))

(assert (not b!1571101))

(assert (not b!1571089))

(assert (not d!164469))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

