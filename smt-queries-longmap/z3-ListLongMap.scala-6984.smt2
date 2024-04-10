; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88542 () Bool)

(assert start!88542)

(declare-fun res!682722 () Bool)

(declare-fun e!572807 () Bool)

(assert (=> start!88542 (=> (not res!682722) (not e!572807))))

(declare-datatypes ((B!1612 0))(
  ( (B!1613 (val!11890 Int)) )
))
(declare-datatypes ((tuple2!15326 0))(
  ( (tuple2!15327 (_1!7674 (_ BitVec 64)) (_2!7674 B!1612)) )
))
(declare-datatypes ((List!21578 0))(
  ( (Nil!21575) (Cons!21574 (h!22772 tuple2!15326) (t!30579 List!21578)) )
))
(declare-fun l!1036 () List!21578)

(declare-fun isStrictlySorted!649 (List!21578) Bool)

(assert (=> start!88542 (= res!682722 (isStrictlySorted!649 l!1036))))

(assert (=> start!88542 e!572807))

(declare-fun e!572808 () Bool)

(assert (=> start!88542 e!572808))

(assert (=> start!88542 true))

(declare-fun b!1018091 () Bool)

(declare-fun res!682723 () Bool)

(assert (=> b!1018091 (=> (not res!682723) (not e!572807))))

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!633 0))(
  ( (Some!632 (v!14483 B!1612)) (None!631) )
))
(declare-fun isDefined!429 (Option!633) Bool)

(declare-fun getValueByKey!582 (List!21578 (_ BitVec 64)) Option!633)

(assert (=> b!1018091 (= res!682723 (isDefined!429 (getValueByKey!582 l!1036 key!271)))))

(declare-fun b!1018093 () Bool)

(declare-fun containsKey!509 (List!21578 (_ BitVec 64)) Bool)

(assert (=> b!1018093 (= e!572807 (not (containsKey!509 l!1036 key!271)))))

(declare-fun b!1018092 () Bool)

(declare-fun res!682724 () Bool)

(assert (=> b!1018092 (=> (not res!682724) (not e!572807))))

(get-info :version)

(assert (=> b!1018092 (= res!682724 (or (not ((_ is Cons!21574) l!1036)) (= (_1!7674 (h!22772 l!1036)) key!271)))))

(declare-fun b!1018094 () Bool)

(declare-fun tp_is_empty!23679 () Bool)

(declare-fun tp!70975 () Bool)

(assert (=> b!1018094 (= e!572808 (and tp_is_empty!23679 tp!70975))))

(assert (= (and start!88542 res!682722) b!1018091))

(assert (= (and b!1018091 res!682723) b!1018092))

(assert (= (and b!1018092 res!682724) b!1018093))

(assert (= (and start!88542 ((_ is Cons!21574) l!1036)) b!1018094))

(declare-fun m!939117 () Bool)

(assert (=> start!88542 m!939117))

(declare-fun m!939119 () Bool)

(assert (=> b!1018091 m!939119))

(assert (=> b!1018091 m!939119))

(declare-fun m!939121 () Bool)

(assert (=> b!1018091 m!939121))

(declare-fun m!939123 () Bool)

(assert (=> b!1018093 m!939123))

(check-sat (not b!1018091) (not start!88542) (not b!1018093) tp_is_empty!23679 (not b!1018094))
(check-sat)
(get-model)

(declare-fun d!121797 () Bool)

(declare-fun isEmpty!921 (Option!633) Bool)

(assert (=> d!121797 (= (isDefined!429 (getValueByKey!582 l!1036 key!271)) (not (isEmpty!921 (getValueByKey!582 l!1036 key!271))))))

(declare-fun bs!29644 () Bool)

(assert (= bs!29644 d!121797))

(assert (=> bs!29644 m!939119))

(declare-fun m!939137 () Bool)

(assert (=> bs!29644 m!939137))

(assert (=> b!1018091 d!121797))

(declare-fun d!121803 () Bool)

(declare-fun c!103134 () Bool)

(assert (=> d!121803 (= c!103134 (and ((_ is Cons!21574) l!1036) (= (_1!7674 (h!22772 l!1036)) key!271)))))

(declare-fun e!572861 () Option!633)

(assert (=> d!121803 (= (getValueByKey!582 l!1036 key!271) e!572861)))

(declare-fun b!1018174 () Bool)

(declare-fun e!572862 () Option!633)

(assert (=> b!1018174 (= e!572861 e!572862)))

(declare-fun c!103135 () Bool)

(assert (=> b!1018174 (= c!103135 (and ((_ is Cons!21574) l!1036) (not (= (_1!7674 (h!22772 l!1036)) key!271))))))

(declare-fun b!1018176 () Bool)

(assert (=> b!1018176 (= e!572862 None!631)))

(declare-fun b!1018175 () Bool)

(assert (=> b!1018175 (= e!572862 (getValueByKey!582 (t!30579 l!1036) key!271))))

(declare-fun b!1018173 () Bool)

(assert (=> b!1018173 (= e!572861 (Some!632 (_2!7674 (h!22772 l!1036))))))

(assert (= (and d!121803 c!103134) b!1018173))

(assert (= (and d!121803 (not c!103134)) b!1018174))

(assert (= (and b!1018174 c!103135) b!1018175))

(assert (= (and b!1018174 (not c!103135)) b!1018176))

(declare-fun m!939151 () Bool)

(assert (=> b!1018175 m!939151))

(assert (=> b!1018091 d!121803))

(declare-fun d!121813 () Bool)

(declare-fun res!682762 () Bool)

(declare-fun e!572867 () Bool)

(assert (=> d!121813 (=> res!682762 e!572867)))

(assert (=> d!121813 (= res!682762 (and ((_ is Cons!21574) l!1036) (= (_1!7674 (h!22772 l!1036)) key!271)))))

(assert (=> d!121813 (= (containsKey!509 l!1036 key!271) e!572867)))

(declare-fun b!1018181 () Bool)

(declare-fun e!572868 () Bool)

(assert (=> b!1018181 (= e!572867 e!572868)))

(declare-fun res!682763 () Bool)

(assert (=> b!1018181 (=> (not res!682763) (not e!572868))))

(assert (=> b!1018181 (= res!682763 (and (or (not ((_ is Cons!21574) l!1036)) (bvsle (_1!7674 (h!22772 l!1036)) key!271)) ((_ is Cons!21574) l!1036) (bvslt (_1!7674 (h!22772 l!1036)) key!271)))))

(declare-fun b!1018182 () Bool)

(assert (=> b!1018182 (= e!572868 (containsKey!509 (t!30579 l!1036) key!271))))

(assert (= (and d!121813 (not res!682762)) b!1018181))

(assert (= (and b!1018181 res!682763) b!1018182))

(declare-fun m!939153 () Bool)

(assert (=> b!1018182 m!939153))

(assert (=> b!1018093 d!121813))

(declare-fun d!121815 () Bool)

(declare-fun res!682768 () Bool)

(declare-fun e!572873 () Bool)

(assert (=> d!121815 (=> res!682768 e!572873)))

(assert (=> d!121815 (= res!682768 (or ((_ is Nil!21575) l!1036) ((_ is Nil!21575) (t!30579 l!1036))))))

(assert (=> d!121815 (= (isStrictlySorted!649 l!1036) e!572873)))

(declare-fun b!1018187 () Bool)

(declare-fun e!572874 () Bool)

(assert (=> b!1018187 (= e!572873 e!572874)))

(declare-fun res!682769 () Bool)

(assert (=> b!1018187 (=> (not res!682769) (not e!572874))))

(assert (=> b!1018187 (= res!682769 (bvslt (_1!7674 (h!22772 l!1036)) (_1!7674 (h!22772 (t!30579 l!1036)))))))

(declare-fun b!1018188 () Bool)

(assert (=> b!1018188 (= e!572874 (isStrictlySorted!649 (t!30579 l!1036)))))

(assert (= (and d!121815 (not res!682768)) b!1018187))

(assert (= (and b!1018187 res!682769) b!1018188))

(declare-fun m!939155 () Bool)

(assert (=> b!1018188 m!939155))

(assert (=> start!88542 d!121815))

(declare-fun b!1018193 () Bool)

(declare-fun e!572877 () Bool)

(declare-fun tp!70987 () Bool)

(assert (=> b!1018193 (= e!572877 (and tp_is_empty!23679 tp!70987))))

(assert (=> b!1018094 (= tp!70975 e!572877)))

(assert (= (and b!1018094 ((_ is Cons!21574) (t!30579 l!1036))) b!1018193))

(check-sat (not b!1018193) (not b!1018175) (not b!1018188) (not d!121797) tp_is_empty!23679 (not b!1018182))
(check-sat)
(get-model)

(declare-fun d!121825 () Bool)

(declare-fun res!682774 () Bool)

(declare-fun e!572885 () Bool)

(assert (=> d!121825 (=> res!682774 e!572885)))

(assert (=> d!121825 (= res!682774 (or ((_ is Nil!21575) (t!30579 l!1036)) ((_ is Nil!21575) (t!30579 (t!30579 l!1036)))))))

(assert (=> d!121825 (= (isStrictlySorted!649 (t!30579 l!1036)) e!572885)))

(declare-fun b!1018203 () Bool)

(declare-fun e!572886 () Bool)

(assert (=> b!1018203 (= e!572885 e!572886)))

(declare-fun res!682775 () Bool)

(assert (=> b!1018203 (=> (not res!682775) (not e!572886))))

(assert (=> b!1018203 (= res!682775 (bvslt (_1!7674 (h!22772 (t!30579 l!1036))) (_1!7674 (h!22772 (t!30579 (t!30579 l!1036))))))))

(declare-fun b!1018204 () Bool)

(assert (=> b!1018204 (= e!572886 (isStrictlySorted!649 (t!30579 (t!30579 l!1036))))))

(assert (= (and d!121825 (not res!682774)) b!1018203))

(assert (= (and b!1018203 res!682775) b!1018204))

(declare-fun m!939163 () Bool)

(assert (=> b!1018204 m!939163))

(assert (=> b!1018188 d!121825))

(declare-fun d!121827 () Bool)

(declare-fun c!103138 () Bool)

(assert (=> d!121827 (= c!103138 (and ((_ is Cons!21574) (t!30579 l!1036)) (= (_1!7674 (h!22772 (t!30579 l!1036))) key!271)))))

(declare-fun e!572887 () Option!633)

(assert (=> d!121827 (= (getValueByKey!582 (t!30579 l!1036) key!271) e!572887)))

(declare-fun b!1018206 () Bool)

(declare-fun e!572888 () Option!633)

(assert (=> b!1018206 (= e!572887 e!572888)))

(declare-fun c!103139 () Bool)

(assert (=> b!1018206 (= c!103139 (and ((_ is Cons!21574) (t!30579 l!1036)) (not (= (_1!7674 (h!22772 (t!30579 l!1036))) key!271))))))

(declare-fun b!1018208 () Bool)

(assert (=> b!1018208 (= e!572888 None!631)))

(declare-fun b!1018207 () Bool)

(assert (=> b!1018207 (= e!572888 (getValueByKey!582 (t!30579 (t!30579 l!1036)) key!271))))

(declare-fun b!1018205 () Bool)

(assert (=> b!1018205 (= e!572887 (Some!632 (_2!7674 (h!22772 (t!30579 l!1036)))))))

(assert (= (and d!121827 c!103138) b!1018205))

(assert (= (and d!121827 (not c!103138)) b!1018206))

(assert (= (and b!1018206 c!103139) b!1018207))

(assert (= (and b!1018206 (not c!103139)) b!1018208))

(declare-fun m!939165 () Bool)

(assert (=> b!1018207 m!939165))

(assert (=> b!1018175 d!121827))

(declare-fun d!121831 () Bool)

(declare-fun res!682776 () Bool)

(declare-fun e!572889 () Bool)

(assert (=> d!121831 (=> res!682776 e!572889)))

(assert (=> d!121831 (= res!682776 (and ((_ is Cons!21574) (t!30579 l!1036)) (= (_1!7674 (h!22772 (t!30579 l!1036))) key!271)))))

(assert (=> d!121831 (= (containsKey!509 (t!30579 l!1036) key!271) e!572889)))

(declare-fun b!1018209 () Bool)

(declare-fun e!572890 () Bool)

(assert (=> b!1018209 (= e!572889 e!572890)))

(declare-fun res!682777 () Bool)

(assert (=> b!1018209 (=> (not res!682777) (not e!572890))))

(assert (=> b!1018209 (= res!682777 (and (or (not ((_ is Cons!21574) (t!30579 l!1036))) (bvsle (_1!7674 (h!22772 (t!30579 l!1036))) key!271)) ((_ is Cons!21574) (t!30579 l!1036)) (bvslt (_1!7674 (h!22772 (t!30579 l!1036))) key!271)))))

(declare-fun b!1018210 () Bool)

(assert (=> b!1018210 (= e!572890 (containsKey!509 (t!30579 (t!30579 l!1036)) key!271))))

(assert (= (and d!121831 (not res!682776)) b!1018209))

(assert (= (and b!1018209 res!682777) b!1018210))

(declare-fun m!939167 () Bool)

(assert (=> b!1018210 m!939167))

(assert (=> b!1018182 d!121831))

(declare-fun d!121833 () Bool)

(assert (=> d!121833 (= (isEmpty!921 (getValueByKey!582 l!1036 key!271)) (not ((_ is Some!632) (getValueByKey!582 l!1036 key!271))))))

(assert (=> d!121797 d!121833))

(declare-fun b!1018217 () Bool)

(declare-fun e!572895 () Bool)

(declare-fun tp!70989 () Bool)

(assert (=> b!1018217 (= e!572895 (and tp_is_empty!23679 tp!70989))))

(assert (=> b!1018193 (= tp!70987 e!572895)))

(assert (= (and b!1018193 ((_ is Cons!21574) (t!30579 (t!30579 l!1036)))) b!1018217))

