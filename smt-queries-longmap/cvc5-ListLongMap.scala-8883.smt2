; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107862 () Bool)

(assert start!107862)

(declare-fun b!1274866 () Bool)

(declare-fun e!727632 () Bool)

(declare-datatypes ((B!2172 0))(
  ( (B!2173 (val!16682 Int)) )
))
(declare-datatypes ((tuple2!21522 0))(
  ( (tuple2!21523 (_1!10772 (_ BitVec 64)) (_2!10772 B!2172)) )
))
(declare-datatypes ((List!28681 0))(
  ( (Nil!28678) (Cons!28677 (h!29886 tuple2!21522) (t!42206 List!28681)) )
))
(declare-fun lt!575132 () List!28681)

(declare-fun key!173 () (_ BitVec 64))

(declare-fun containsKey!703 (List!28681 (_ BitVec 64)) Bool)

(assert (=> b!1274866 (= e!727632 (containsKey!703 lt!575132 key!173))))

(declare-fun res!847457 () Bool)

(declare-fun e!727633 () Bool)

(assert (=> start!107862 (=> (not res!847457) (not e!727633))))

(declare-fun l!595 () List!28681)

(declare-fun isStrictlySorted!857 (List!28681) Bool)

(assert (=> start!107862 (= res!847457 (isStrictlySorted!857 l!595))))

(assert (=> start!107862 e!727633))

(declare-fun e!727634 () Bool)

(assert (=> start!107862 e!727634))

(assert (=> start!107862 true))

(declare-fun b!1274867 () Bool)

(declare-fun tp_is_empty!33215 () Bool)

(declare-fun tp!98064 () Bool)

(assert (=> b!1274867 (= e!727634 (and tp_is_empty!33215 tp!98064))))

(declare-fun b!1274864 () Bool)

(declare-fun res!847458 () Bool)

(assert (=> b!1274864 (=> (not res!847458) (not e!727633))))

(assert (=> b!1274864 (= res!847458 (and (not (= (_1!10772 (h!29886 l!595)) key!173)) (is-Cons!28677 l!595)))))

(declare-fun b!1274865 () Bool)

(assert (=> b!1274865 (= e!727633 e!727632)))

(declare-fun res!847459 () Bool)

(assert (=> b!1274865 (=> res!847459 e!727632)))

(assert (=> b!1274865 (= res!847459 (not (isStrictlySorted!857 lt!575132)))))

(declare-fun $colon$colon!668 (List!28681 tuple2!21522) List!28681)

(declare-fun removeStrictlySorted!184 (List!28681 (_ BitVec 64)) List!28681)

(assert (=> b!1274865 (= lt!575132 ($colon$colon!668 (removeStrictlySorted!184 (t!42206 l!595) key!173) (h!29886 l!595)))))

(assert (= (and start!107862 res!847457) b!1274864))

(assert (= (and b!1274864 res!847458) b!1274865))

(assert (= (and b!1274865 (not res!847459)) b!1274866))

(assert (= (and start!107862 (is-Cons!28677 l!595)) b!1274867))

(declare-fun m!1170913 () Bool)

(assert (=> b!1274866 m!1170913))

(declare-fun m!1170915 () Bool)

(assert (=> start!107862 m!1170915))

(declare-fun m!1170917 () Bool)

(assert (=> b!1274865 m!1170917))

(declare-fun m!1170919 () Bool)

(assert (=> b!1274865 m!1170919))

(assert (=> b!1274865 m!1170919))

(declare-fun m!1170921 () Bool)

(assert (=> b!1274865 m!1170921))

(push 1)

(assert (not b!1274867))

(assert (not start!107862))

(assert (not b!1274865))

(assert (not b!1274866))

(assert tp_is_empty!33215)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140143 () Bool)

(declare-fun res!847486 () Bool)

(declare-fun e!727665 () Bool)

(assert (=> d!140143 (=> res!847486 e!727665)))

(assert (=> d!140143 (= res!847486 (or (is-Nil!28678 l!595) (is-Nil!28678 (t!42206 l!595))))))

(assert (=> d!140143 (= (isStrictlySorted!857 l!595) e!727665)))

(declare-fun b!1274902 () Bool)

(declare-fun e!727666 () Bool)

(assert (=> b!1274902 (= e!727665 e!727666)))

(declare-fun res!847487 () Bool)

(assert (=> b!1274902 (=> (not res!847487) (not e!727666))))

(assert (=> b!1274902 (= res!847487 (bvslt (_1!10772 (h!29886 l!595)) (_1!10772 (h!29886 (t!42206 l!595)))))))

(declare-fun b!1274903 () Bool)

(assert (=> b!1274903 (= e!727666 (isStrictlySorted!857 (t!42206 l!595)))))

(assert (= (and d!140143 (not res!847486)) b!1274902))

(assert (= (and b!1274902 res!847487) b!1274903))

(declare-fun m!1170931 () Bool)

(assert (=> b!1274903 m!1170931))

(assert (=> start!107862 d!140143))

(declare-fun d!140151 () Bool)

(declare-fun res!847488 () Bool)

(declare-fun e!727667 () Bool)

(assert (=> d!140151 (=> res!847488 e!727667)))

(assert (=> d!140151 (= res!847488 (or (is-Nil!28678 lt!575132) (is-Nil!28678 (t!42206 lt!575132))))))

(assert (=> d!140151 (= (isStrictlySorted!857 lt!575132) e!727667)))

(declare-fun b!1274904 () Bool)

(declare-fun e!727668 () Bool)

(assert (=> b!1274904 (= e!727667 e!727668)))

(declare-fun res!847489 () Bool)

(assert (=> b!1274904 (=> (not res!847489) (not e!727668))))

(assert (=> b!1274904 (= res!847489 (bvslt (_1!10772 (h!29886 lt!575132)) (_1!10772 (h!29886 (t!42206 lt!575132)))))))

(declare-fun b!1274905 () Bool)

(assert (=> b!1274905 (= e!727668 (isStrictlySorted!857 (t!42206 lt!575132)))))

(assert (= (and d!140151 (not res!847488)) b!1274904))

(assert (= (and b!1274904 res!847489) b!1274905))

(declare-fun m!1170933 () Bool)

(assert (=> b!1274905 m!1170933))

(assert (=> b!1274865 d!140151))

(declare-fun d!140153 () Bool)

(assert (=> d!140153 (= ($colon$colon!668 (removeStrictlySorted!184 (t!42206 l!595) key!173) (h!29886 l!595)) (Cons!28677 (h!29886 l!595) (removeStrictlySorted!184 (t!42206 l!595) key!173)))))

(assert (=> b!1274865 d!140153))

(declare-fun b!1274954 () Bool)

(declare-fun e!727701 () List!28681)

(assert (=> b!1274954 (= e!727701 Nil!28678)))

(declare-fun b!1274955 () Bool)

(declare-fun e!727703 () Bool)

(declare-fun lt!575141 () List!28681)

(assert (=> b!1274955 (= e!727703 (not (containsKey!703 lt!575141 key!173)))))

(declare-fun b!1274956 () Bool)

(assert (=> b!1274956 (= e!727701 ($colon$colon!668 (removeStrictlySorted!184 (t!42206 (t!42206 l!595)) key!173) (h!29886 (t!42206 l!595))))))

(declare-fun b!1274958 () Bool)

(declare-fun e!727702 () List!28681)

(assert (=> b!1274958 (= e!727702 (t!42206 (t!42206 l!595)))))

(declare-fun b!1274957 () Bool)

(assert (=> b!1274957 (= e!727702 e!727701)))

(declare-fun c!123892 () Bool)

(assert (=> b!1274957 (= c!123892 (and (is-Cons!28677 (t!42206 l!595)) (not (= (_1!10772 (h!29886 (t!42206 l!595))) key!173))))))

(declare-fun d!140155 () Bool)

(assert (=> d!140155 e!727703))

(declare-fun res!847504 () Bool)

(assert (=> d!140155 (=> (not res!847504) (not e!727703))))

(assert (=> d!140155 (= res!847504 (isStrictlySorted!857 lt!575141))))

(assert (=> d!140155 (= lt!575141 e!727702)))

(declare-fun c!123893 () Bool)

(assert (=> d!140155 (= c!123893 (and (is-Cons!28677 (t!42206 l!595)) (= (_1!10772 (h!29886 (t!42206 l!595))) key!173)))))

(assert (=> d!140155 (isStrictlySorted!857 (t!42206 l!595))))

(assert (=> d!140155 (= (removeStrictlySorted!184 (t!42206 l!595) key!173) lt!575141)))

(assert (= (and d!140155 c!123893) b!1274958))

(assert (= (and d!140155 (not c!123893)) b!1274957))

(assert (= (and b!1274957 c!123892) b!1274956))

(assert (= (and b!1274957 (not c!123892)) b!1274954))

(assert (= (and d!140155 res!847504) b!1274955))

(declare-fun m!1170955 () Bool)

(assert (=> b!1274955 m!1170955))

(declare-fun m!1170957 () Bool)

(assert (=> b!1274956 m!1170957))

(assert (=> b!1274956 m!1170957))

(declare-fun m!1170959 () Bool)

(assert (=> b!1274956 m!1170959))

(declare-fun m!1170961 () Bool)

(assert (=> d!140155 m!1170961))

(assert (=> d!140155 m!1170931))

(assert (=> b!1274865 d!140155))

(declare-fun d!140161 () Bool)

(declare-fun res!847509 () Bool)

(declare-fun e!727708 () Bool)

(assert (=> d!140161 (=> res!847509 e!727708)))

(assert (=> d!140161 (= res!847509 (and (is-Cons!28677 lt!575132) (= (_1!10772 (h!29886 lt!575132)) key!173)))))

(assert (=> d!140161 (= (containsKey!703 lt!575132 key!173) e!727708)))

(declare-fun b!1274963 () Bool)

(declare-fun e!727709 () Bool)

(assert (=> b!1274963 (= e!727708 e!727709)))

(declare-fun res!847510 () Bool)

(assert (=> b!1274963 (=> (not res!847510) (not e!727709))))

(assert (=> b!1274963 (= res!847510 (and (or (not (is-Cons!28677 lt!575132)) (bvsle (_1!10772 (h!29886 lt!575132)) key!173)) (is-Cons!28677 lt!575132) (bvslt (_1!10772 (h!29886 lt!575132)) key!173)))))

(declare-fun b!1274964 () Bool)

(assert (=> b!1274964 (= e!727709 (containsKey!703 (t!42206 lt!575132) key!173))))

(assert (= (and d!140161 (not res!847509)) b!1274963))

(assert (= (and b!1274963 res!847510) b!1274964))

(declare-fun m!1170963 () Bool)

(assert (=> b!1274964 m!1170963))

(assert (=> b!1274866 d!140161))

(declare-fun b!1274969 () Bool)

(declare-fun e!727712 () Bool)

(declare-fun tp!98073 () Bool)

(assert (=> b!1274969 (= e!727712 (and tp_is_empty!33215 tp!98073))))

(assert (=> b!1274867 (= tp!98064 e!727712)))

(assert (= (and b!1274867 (is-Cons!28677 (t!42206 l!595))) b!1274969))

(push 1)

(assert (not d!140155))

(assert (not b!1274969))

(assert tp_is_empty!33215)

(assert (not b!1274955))

(assert (not b!1274903))

(assert (not b!1274956))

(assert (not b!1274905))

(assert (not b!1274964))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140191 () Bool)

(declare-fun res!847533 () Bool)

(declare-fun e!727741 () Bool)

(assert (=> d!140191 (=> res!847533 e!727741)))

(assert (=> d!140191 (= res!847533 (and (is-Cons!28677 (t!42206 lt!575132)) (= (_1!10772 (h!29886 (t!42206 lt!575132))) key!173)))))

(assert (=> d!140191 (= (containsKey!703 (t!42206 lt!575132) key!173) e!727741)))

(declare-fun b!1275002 () Bool)

(declare-fun e!727742 () Bool)

(assert (=> b!1275002 (= e!727741 e!727742)))

(declare-fun res!847534 () Bool)

(assert (=> b!1275002 (=> (not res!847534) (not e!727742))))

(assert (=> b!1275002 (= res!847534 (and (or (not (is-Cons!28677 (t!42206 lt!575132))) (bvsle (_1!10772 (h!29886 (t!42206 lt!575132))) key!173)) (is-Cons!28677 (t!42206 lt!575132)) (bvslt (_1!10772 (h!29886 (t!42206 lt!575132))) key!173)))))

(declare-fun b!1275003 () Bool)

(assert (=> b!1275003 (= e!727742 (containsKey!703 (t!42206 (t!42206 lt!575132)) key!173))))

(assert (= (and d!140191 (not res!847533)) b!1275002))

(assert (= (and b!1275002 res!847534) b!1275003))

(declare-fun m!1171001 () Bool)

(assert (=> b!1275003 m!1171001))

(assert (=> b!1274964 d!140191))

(declare-fun d!140193 () Bool)

(declare-fun res!847535 () Bool)

(declare-fun e!727743 () Bool)

(assert (=> d!140193 (=> res!847535 e!727743)))

(assert (=> d!140193 (= res!847535 (or (is-Nil!28678 (t!42206 l!595)) (is-Nil!28678 (t!42206 (t!42206 l!595)))))))

(assert (=> d!140193 (= (isStrictlySorted!857 (t!42206 l!595)) e!727743)))

(declare-fun b!1275004 () Bool)

(declare-fun e!727744 () Bool)

(assert (=> b!1275004 (= e!727743 e!727744)))

(declare-fun res!847536 () Bool)

(assert (=> b!1275004 (=> (not res!847536) (not e!727744))))

(assert (=> b!1275004 (= res!847536 (bvslt (_1!10772 (h!29886 (t!42206 l!595))) (_1!10772 (h!29886 (t!42206 (t!42206 l!595))))))))

(declare-fun b!1275005 () Bool)

(assert (=> b!1275005 (= e!727744 (isStrictlySorted!857 (t!42206 (t!42206 l!595))))))

(assert (= (and d!140193 (not res!847535)) b!1275004))

(assert (= (and b!1275004 res!847536) b!1275005))

(declare-fun m!1171003 () Bool)

(assert (=> b!1275005 m!1171003))

(assert (=> b!1274903 d!140193))

(declare-fun d!140195 () Bool)

(declare-fun res!847537 () Bool)

(declare-fun e!727745 () Bool)

(assert (=> d!140195 (=> res!847537 e!727745)))

(assert (=> d!140195 (= res!847537 (or (is-Nil!28678 lt!575141) (is-Nil!28678 (t!42206 lt!575141))))))

(assert (=> d!140195 (= (isStrictlySorted!857 lt!575141) e!727745)))

(declare-fun b!1275006 () Bool)

(declare-fun e!727746 () Bool)

(assert (=> b!1275006 (= e!727745 e!727746)))

(declare-fun res!847538 () Bool)

(assert (=> b!1275006 (=> (not res!847538) (not e!727746))))

(assert (=> b!1275006 (= res!847538 (bvslt (_1!10772 (h!29886 lt!575141)) (_1!10772 (h!29886 (t!42206 lt!575141)))))))

(declare-fun b!1275007 () Bool)

(assert (=> b!1275007 (= e!727746 (isStrictlySorted!857 (t!42206 lt!575141)))))

(assert (= (and d!140195 (not res!847537)) b!1275006))

(assert (= (and b!1275006 res!847538) b!1275007))

(declare-fun m!1171005 () Bool)

(assert (=> b!1275007 m!1171005))

(assert (=> d!140155 d!140195))

(assert (=> d!140155 d!140193))

(declare-fun d!140197 () Bool)

(assert (=> d!140197 (= ($colon$colon!668 (removeStrictlySorted!184 (t!42206 (t!42206 l!595)) key!173) (h!29886 (t!42206 l!595))) (Cons!28677 (h!29886 (t!42206 l!595)) (removeStrictlySorted!184 (t!42206 (t!42206 l!595)) key!173)))))

(assert (=> b!1274956 d!140197))

(declare-fun b!1275008 () Bool)

(declare-fun e!727747 () List!28681)

(assert (=> b!1275008 (= e!727747 Nil!28678)))

(declare-fun b!1275009 () Bool)

(declare-fun e!727749 () Bool)

(declare-fun lt!575144 () List!28681)

(assert (=> b!1275009 (= e!727749 (not (containsKey!703 lt!575144 key!173)))))

(declare-fun b!1275010 () Bool)

(assert (=> b!1275010 (= e!727747 ($colon$colon!668 (removeStrictlySorted!184 (t!42206 (t!42206 (t!42206 l!595))) key!173) (h!29886 (t!42206 (t!42206 l!595)))))))

(declare-fun b!1275012 () Bool)

(declare-fun e!727748 () List!28681)

(assert (=> b!1275012 (= e!727748 (t!42206 (t!42206 (t!42206 l!595))))))

(declare-fun b!1275011 () Bool)

(assert (=> b!1275011 (= e!727748 e!727747)))

(declare-fun c!123898 () Bool)

(assert (=> b!1275011 (= c!123898 (and (is-Cons!28677 (t!42206 (t!42206 l!595))) (not (= (_1!10772 (h!29886 (t!42206 (t!42206 l!595)))) key!173))))))

(declare-fun d!140199 () Bool)

(assert (=> d!140199 e!727749))

(declare-fun res!847539 () Bool)

(assert (=> d!140199 (=> (not res!847539) (not e!727749))))

(assert (=> d!140199 (= res!847539 (isStrictlySorted!857 lt!575144))))

(assert (=> d!140199 (= lt!575144 e!727748)))

(declare-fun c!123899 () Bool)

(assert (=> d!140199 (= c!123899 (and (is-Cons!28677 (t!42206 (t!42206 l!595))) (= (_1!10772 (h!29886 (t!42206 (t!42206 l!595)))) key!173)))))

(assert (=> d!140199 (isStrictlySorted!857 (t!42206 (t!42206 l!595)))))

(assert (=> d!140199 (= (removeStrictlySorted!184 (t!42206 (t!42206 l!595)) key!173) lt!575144)))

(assert (= (and d!140199 c!123899) b!1275012))

(assert (= (and d!140199 (not c!123899)) b!1275011))

(assert (= (and b!1275011 c!123898) b!1275010))

(assert (= (and b!1275011 (not c!123898)) b!1275008))

(assert (= (and d!140199 res!847539) b!1275009))

(declare-fun m!1171007 () Bool)

(assert (=> b!1275009 m!1171007))

(declare-fun m!1171009 () Bool)

(assert (=> b!1275010 m!1171009))

(assert (=> b!1275010 m!1171009))

(declare-fun m!1171011 () Bool)

(assert (=> b!1275010 m!1171011))

(declare-fun m!1171013 () Bool)

(assert (=> d!140199 m!1171013))

(assert (=> d!140199 m!1171003))

(assert (=> b!1274956 d!140199))

(declare-fun d!140201 () Bool)

(declare-fun res!847540 () Bool)

(declare-fun e!727750 () Bool)

(assert (=> d!140201 (=> res!847540 e!727750)))

(assert (=> d!140201 (= res!847540 (or (is-Nil!28678 (t!42206 lt!575132)) (is-Nil!28678 (t!42206 (t!42206 lt!575132)))))))

(assert (=> d!140201 (= (isStrictlySorted!857 (t!42206 lt!575132)) e!727750)))

(declare-fun b!1275013 () Bool)

(declare-fun e!727751 () Bool)

(assert (=> b!1275013 (= e!727750 e!727751)))

(declare-fun res!847541 () Bool)

(assert (=> b!1275013 (=> (not res!847541) (not e!727751))))

(assert (=> b!1275013 (= res!847541 (bvslt (_1!10772 (h!29886 (t!42206 lt!575132))) (_1!10772 (h!29886 (t!42206 (t!42206 lt!575132))))))))

(declare-fun b!1275014 () Bool)

(assert (=> b!1275014 (= e!727751 (isStrictlySorted!857 (t!42206 (t!42206 lt!575132))))))

(assert (= (and d!140201 (not res!847540)) b!1275013))

(assert (= (and b!1275013 res!847541) b!1275014))

(declare-fun m!1171015 () Bool)

(assert (=> b!1275014 m!1171015))

(assert (=> b!1274905 d!140201))

(declare-fun d!140203 () Bool)

(declare-fun res!847542 () Bool)

(declare-fun e!727752 () Bool)

(assert (=> d!140203 (=> res!847542 e!727752)))

(assert (=> d!140203 (= res!847542 (and (is-Cons!28677 lt!575141) (= (_1!10772 (h!29886 lt!575141)) key!173)))))

(assert (=> d!140203 (= (containsKey!703 lt!575141 key!173) e!727752)))

(declare-fun b!1275015 () Bool)

(declare-fun e!727753 () Bool)

(assert (=> b!1275015 (= e!727752 e!727753)))

(declare-fun res!847543 () Bool)

(assert (=> b!1275015 (=> (not res!847543) (not e!727753))))

(assert (=> b!1275015 (= res!847543 (and (or (not (is-Cons!28677 lt!575141)) (bvsle (_1!10772 (h!29886 lt!575141)) key!173)) (is-Cons!28677 lt!575141) (bvslt (_1!10772 (h!29886 lt!575141)) key!173)))))

(declare-fun b!1275016 () Bool)

(assert (=> b!1275016 (= e!727753 (containsKey!703 (t!42206 lt!575141) key!173))))

(assert (= (and d!140203 (not res!847542)) b!1275015))

(assert (= (and b!1275015 res!847543) b!1275016))

(declare-fun m!1171017 () Bool)

(assert (=> b!1275016 m!1171017))

(assert (=> b!1274955 d!140203))

(declare-fun b!1275017 () Bool)

(declare-fun e!727754 () Bool)

(declare-fun tp!98076 () Bool)

(assert (=> b!1275017 (= e!727754 (and tp_is_empty!33215 tp!98076))))

(assert (=> b!1274969 (= tp!98073 e!727754)))

(assert (= (and b!1274969 (is-Cons!28677 (t!42206 (t!42206 l!595)))) b!1275017))

(push 1)

(assert (not b!1275014))

(assert (not b!1275005))

(assert (not d!140199))

(assert (not b!1275010))

(assert (not b!1275017))

(assert (not b!1275007))

(assert tp_is_empty!33215)

(assert (not b!1275009))

(assert (not b!1275003))

(assert (not b!1275016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

