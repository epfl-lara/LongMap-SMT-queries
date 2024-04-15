; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42850 () Bool)

(assert start!42850)

(declare-fun b_free!12103 () Bool)

(declare-fun b_next!12103 () Bool)

(assert (=> start!42850 (= b_free!12103 (not b_next!12103))))

(declare-fun tp!42397 () Bool)

(declare-fun b_and!20691 () Bool)

(assert (=> start!42850 (= tp!42397 b_and!20691)))

(declare-fun res!284545 () Bool)

(declare-fun e!279977 () Bool)

(assert (=> start!42850 (=> (not res!284545) (not e!279977))))

(declare-datatypes ((B!1052 0))(
  ( (B!1053 (val!6810 Int)) )
))
(declare-datatypes ((tuple2!9052 0))(
  ( (tuple2!9053 (_1!4537 (_ BitVec 64)) (_2!4537 B!1052)) )
))
(declare-datatypes ((List!9098 0))(
  ( (Nil!9095) (Cons!9094 (h!9950 tuple2!9052) (t!15153 List!9098)) )
))
(declare-datatypes ((ListLongMap!7955 0))(
  ( (ListLongMap!7956 (toList!3993 List!9098)) )
))
(declare-fun lm!215 () ListLongMap!7955)

(declare-fun p!166 () Int)

(declare-fun forall!197 (List!9098 Int) Bool)

(assert (=> start!42850 (= res!284545 (forall!197 (toList!3993 lm!215) p!166))))

(assert (=> start!42850 e!279977))

(declare-fun e!279979 () Bool)

(declare-fun inv!15495 (ListLongMap!7955) Bool)

(assert (=> start!42850 (and (inv!15495 lm!215) e!279979)))

(assert (=> start!42850 tp!42397))

(declare-fun tp_is_empty!13525 () Bool)

(assert (=> start!42850 tp_is_empty!13525))

(assert (=> start!42850 true))

(declare-fun b!476608 () Bool)

(declare-fun res!284543 () Bool)

(declare-fun e!279978 () Bool)

(assert (=> b!476608 (=> (not res!284543) (not e!279978))))

(declare-fun isEmpty!605 (ListLongMap!7955) Bool)

(assert (=> b!476608 (= res!284543 (not (isEmpty!605 lm!215)))))

(declare-fun b!476609 () Bool)

(assert (=> b!476609 (= e!279977 e!279978)))

(declare-fun res!284542 () Bool)

(assert (=> b!476609 (=> (not res!284542) (not e!279978))))

(declare-fun lt!217108 () tuple2!9052)

(declare-fun dynLambda!947 (Int tuple2!9052) Bool)

(assert (=> b!476609 (= res!284542 (dynLambda!947 p!166 lt!217108))))

(declare-fun a!501 () (_ BitVec 64))

(declare-fun b!85 () B!1052)

(assert (=> b!476609 (= lt!217108 (tuple2!9053 a!501 b!85))))

(declare-fun e!279976 () Bool)

(declare-fun b!476610 () Bool)

(declare-fun +!1801 (ListLongMap!7955 tuple2!9052) ListLongMap!7955)

(assert (=> b!476610 (= e!279976 (not (forall!197 (toList!3993 (+!1801 lm!215 lt!217108)) p!166)))))

(declare-fun lt!217110 () ListLongMap!7955)

(assert (=> b!476610 (forall!197 (toList!3993 (+!1801 lt!217110 lt!217108)) p!166)))

(declare-datatypes ((Unit!14014 0))(
  ( (Unit!14015) )
))
(declare-fun lt!217109 () Unit!14014)

(declare-fun addValidProp!20 (ListLongMap!7955 Int (_ BitVec 64) B!1052) Unit!14014)

(assert (=> b!476610 (= lt!217109 (addValidProp!20 lt!217110 p!166 a!501 b!85))))

(declare-fun b!476611 () Bool)

(assert (=> b!476611 (= e!279978 e!279976)))

(declare-fun res!284544 () Bool)

(assert (=> b!476611 (=> (not res!284544) (not e!279976))))

(assert (=> b!476611 (= res!284544 (forall!197 (toList!3993 lt!217110) p!166))))

(declare-fun tail!125 (ListLongMap!7955) ListLongMap!7955)

(assert (=> b!476611 (= lt!217110 (tail!125 lm!215))))

(declare-fun b!476612 () Bool)

(declare-fun tp!42396 () Bool)

(assert (=> b!476612 (= e!279979 tp!42396)))

(assert (= (and start!42850 res!284545) b!476609))

(assert (= (and b!476609 res!284542) b!476608))

(assert (= (and b!476608 res!284543) b!476611))

(assert (= (and b!476611 res!284544) b!476610))

(assert (= start!42850 b!476612))

(declare-fun b_lambda!10497 () Bool)

(assert (=> (not b_lambda!10497) (not b!476609)))

(declare-fun t!15152 () Bool)

(declare-fun tb!4013 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15152) tb!4013))

(declare-fun result!7575 () Bool)

(assert (=> tb!4013 (= result!7575 true)))

(assert (=> b!476609 t!15152))

(declare-fun b_and!20693 () Bool)

(assert (= b_and!20691 (and (=> t!15152 result!7575) b_and!20693)))

(declare-fun m!458405 () Bool)

(assert (=> b!476611 m!458405))

(declare-fun m!458407 () Bool)

(assert (=> b!476611 m!458407))

(declare-fun m!458409 () Bool)

(assert (=> b!476609 m!458409))

(declare-fun m!458411 () Bool)

(assert (=> b!476608 m!458411))

(declare-fun m!458413 () Bool)

(assert (=> b!476610 m!458413))

(declare-fun m!458415 () Bool)

(assert (=> b!476610 m!458415))

(declare-fun m!458417 () Bool)

(assert (=> b!476610 m!458417))

(declare-fun m!458419 () Bool)

(assert (=> b!476610 m!458419))

(declare-fun m!458421 () Bool)

(assert (=> b!476610 m!458421))

(declare-fun m!458423 () Bool)

(assert (=> start!42850 m!458423))

(declare-fun m!458425 () Bool)

(assert (=> start!42850 m!458425))

(check-sat (not b!476610) (not start!42850) (not b!476608) (not b!476611) tp_is_empty!13525 b_and!20693 (not b_lambda!10497) (not b!476612) (not b_next!12103))
(check-sat b_and!20693 (not b_next!12103))
(get-model)

(declare-fun b_lambda!10505 () Bool)

(assert (= b_lambda!10497 (or (and start!42850 b_free!12103) b_lambda!10505)))

(check-sat (not start!42850) (not b!476608) (not b!476611) tp_is_empty!13525 b_and!20693 (not b!476610) (not b_lambda!10505) (not b!476612) (not b_next!12103))
(check-sat b_and!20693 (not b_next!12103))
(get-model)

(declare-fun d!75713 () Bool)

(declare-fun isEmpty!609 (List!9098) Bool)

(assert (=> d!75713 (= (isEmpty!605 lm!215) (isEmpty!609 (toList!3993 lm!215)))))

(declare-fun bs!15131 () Bool)

(assert (= bs!15131 d!75713))

(declare-fun m!458483 () Bool)

(assert (=> bs!15131 m!458483))

(assert (=> b!476608 d!75713))

(declare-fun d!75719 () Bool)

(declare-fun res!284584 () Bool)

(declare-fun e!280018 () Bool)

(assert (=> d!75719 (=> res!284584 e!280018)))

(get-info :version)

(assert (=> d!75719 (= res!284584 ((_ is Nil!9095) (toList!3993 lt!217110)))))

(assert (=> d!75719 (= (forall!197 (toList!3993 lt!217110) p!166) e!280018)))

(declare-fun b!476657 () Bool)

(declare-fun e!280019 () Bool)

(assert (=> b!476657 (= e!280018 e!280019)))

(declare-fun res!284585 () Bool)

(assert (=> b!476657 (=> (not res!284585) (not e!280019))))

(assert (=> b!476657 (= res!284585 (dynLambda!947 p!166 (h!9950 (toList!3993 lt!217110))))))

(declare-fun b!476658 () Bool)

(assert (=> b!476658 (= e!280019 (forall!197 (t!15153 (toList!3993 lt!217110)) p!166))))

(assert (= (and d!75719 (not res!284584)) b!476657))

(assert (= (and b!476657 res!284585) b!476658))

(declare-fun b_lambda!10515 () Bool)

(assert (=> (not b_lambda!10515) (not b!476657)))

(declare-fun t!15167 () Bool)

(declare-fun tb!4025 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15167) tb!4025))

(declare-fun result!7587 () Bool)

(assert (=> tb!4025 (= result!7587 true)))

(assert (=> b!476657 t!15167))

(declare-fun b_and!20709 () Bool)

(assert (= b_and!20693 (and (=> t!15167 result!7587) b_and!20709)))

(declare-fun m!458491 () Bool)

(assert (=> b!476657 m!458491))

(declare-fun m!458493 () Bool)

(assert (=> b!476658 m!458493))

(assert (=> b!476611 d!75719))

(declare-fun d!75725 () Bool)

(declare-fun tail!129 (List!9098) List!9098)

(assert (=> d!75725 (= (tail!125 lm!215) (ListLongMap!7956 (tail!129 (toList!3993 lm!215))))))

(declare-fun bs!15133 () Bool)

(assert (= bs!15133 d!75725))

(declare-fun m!458495 () Bool)

(assert (=> bs!15133 m!458495))

(assert (=> b!476611 d!75725))

(declare-fun d!75727 () Bool)

(declare-fun e!280036 () Bool)

(assert (=> d!75727 e!280036))

(declare-fun res!284610 () Bool)

(assert (=> d!75727 (=> (not res!284610) (not e!280036))))

(declare-fun lt!217161 () ListLongMap!7955)

(declare-fun contains!2561 (ListLongMap!7955 (_ BitVec 64)) Bool)

(assert (=> d!75727 (= res!284610 (contains!2561 lt!217161 (_1!4537 lt!217108)))))

(declare-fun lt!217163 () List!9098)

(assert (=> d!75727 (= lt!217161 (ListLongMap!7956 lt!217163))))

(declare-fun lt!217162 () Unit!14014)

(declare-fun lt!217164 () Unit!14014)

(assert (=> d!75727 (= lt!217162 lt!217164)))

(declare-datatypes ((Option!391 0))(
  ( (Some!390 (v!9087 B!1052)) (None!389) )
))
(declare-fun getValueByKey!385 (List!9098 (_ BitVec 64)) Option!391)

(assert (=> d!75727 (= (getValueByKey!385 lt!217163 (_1!4537 lt!217108)) (Some!390 (_2!4537 lt!217108)))))

(declare-fun lemmaContainsTupThenGetReturnValue!210 (List!9098 (_ BitVec 64) B!1052) Unit!14014)

(assert (=> d!75727 (= lt!217164 (lemmaContainsTupThenGetReturnValue!210 lt!217163 (_1!4537 lt!217108) (_2!4537 lt!217108)))))

(declare-fun insertStrictlySorted!213 (List!9098 (_ BitVec 64) B!1052) List!9098)

(assert (=> d!75727 (= lt!217163 (insertStrictlySorted!213 (toList!3993 lt!217110) (_1!4537 lt!217108) (_2!4537 lt!217108)))))

(assert (=> d!75727 (= (+!1801 lt!217110 lt!217108) lt!217161)))

(declare-fun b!476683 () Bool)

(declare-fun res!284611 () Bool)

(assert (=> b!476683 (=> (not res!284611) (not e!280036))))

(assert (=> b!476683 (= res!284611 (= (getValueByKey!385 (toList!3993 lt!217161) (_1!4537 lt!217108)) (Some!390 (_2!4537 lt!217108))))))

(declare-fun b!476684 () Bool)

(declare-fun contains!2562 (List!9098 tuple2!9052) Bool)

(assert (=> b!476684 (= e!280036 (contains!2562 (toList!3993 lt!217161) lt!217108))))

(assert (= (and d!75727 res!284610) b!476683))

(assert (= (and b!476683 res!284611) b!476684))

(declare-fun m!458529 () Bool)

(assert (=> d!75727 m!458529))

(declare-fun m!458531 () Bool)

(assert (=> d!75727 m!458531))

(declare-fun m!458533 () Bool)

(assert (=> d!75727 m!458533))

(declare-fun m!458535 () Bool)

(assert (=> d!75727 m!458535))

(declare-fun m!458537 () Bool)

(assert (=> b!476683 m!458537))

(declare-fun m!458539 () Bool)

(assert (=> b!476684 m!458539))

(assert (=> b!476610 d!75727))

(declare-fun d!75737 () Bool)

(declare-fun e!280037 () Bool)

(assert (=> d!75737 e!280037))

(declare-fun res!284612 () Bool)

(assert (=> d!75737 (=> (not res!284612) (not e!280037))))

(declare-fun lt!217165 () ListLongMap!7955)

(assert (=> d!75737 (= res!284612 (contains!2561 lt!217165 (_1!4537 lt!217108)))))

(declare-fun lt!217167 () List!9098)

(assert (=> d!75737 (= lt!217165 (ListLongMap!7956 lt!217167))))

(declare-fun lt!217166 () Unit!14014)

(declare-fun lt!217168 () Unit!14014)

(assert (=> d!75737 (= lt!217166 lt!217168)))

(assert (=> d!75737 (= (getValueByKey!385 lt!217167 (_1!4537 lt!217108)) (Some!390 (_2!4537 lt!217108)))))

(assert (=> d!75737 (= lt!217168 (lemmaContainsTupThenGetReturnValue!210 lt!217167 (_1!4537 lt!217108) (_2!4537 lt!217108)))))

(assert (=> d!75737 (= lt!217167 (insertStrictlySorted!213 (toList!3993 lm!215) (_1!4537 lt!217108) (_2!4537 lt!217108)))))

(assert (=> d!75737 (= (+!1801 lm!215 lt!217108) lt!217165)))

(declare-fun b!476685 () Bool)

(declare-fun res!284613 () Bool)

(assert (=> b!476685 (=> (not res!284613) (not e!280037))))

(assert (=> b!476685 (= res!284613 (= (getValueByKey!385 (toList!3993 lt!217165) (_1!4537 lt!217108)) (Some!390 (_2!4537 lt!217108))))))

(declare-fun b!476686 () Bool)

(assert (=> b!476686 (= e!280037 (contains!2562 (toList!3993 lt!217165) lt!217108))))

(assert (= (and d!75737 res!284612) b!476685))

(assert (= (and b!476685 res!284613) b!476686))

(declare-fun m!458541 () Bool)

(assert (=> d!75737 m!458541))

(declare-fun m!458543 () Bool)

(assert (=> d!75737 m!458543))

(declare-fun m!458545 () Bool)

(assert (=> d!75737 m!458545))

(declare-fun m!458547 () Bool)

(assert (=> d!75737 m!458547))

(declare-fun m!458549 () Bool)

(assert (=> b!476685 m!458549))

(declare-fun m!458551 () Bool)

(assert (=> b!476686 m!458551))

(assert (=> b!476610 d!75737))

(declare-fun d!75739 () Bool)

(assert (=> d!75739 (forall!197 (toList!3993 (+!1801 lt!217110 (tuple2!9053 a!501 b!85))) p!166)))

(declare-fun lt!217185 () Unit!14014)

(declare-fun choose!1369 (ListLongMap!7955 Int (_ BitVec 64) B!1052) Unit!14014)

(assert (=> d!75739 (= lt!217185 (choose!1369 lt!217110 p!166 a!501 b!85))))

(declare-fun e!280052 () Bool)

(assert (=> d!75739 e!280052))

(declare-fun res!284630 () Bool)

(assert (=> d!75739 (=> (not res!284630) (not e!280052))))

(assert (=> d!75739 (= res!284630 (forall!197 (toList!3993 lt!217110) p!166))))

(assert (=> d!75739 (= (addValidProp!20 lt!217110 p!166 a!501 b!85) lt!217185)))

(declare-fun b!476708 () Bool)

(assert (=> b!476708 (= e!280052 (dynLambda!947 p!166 (tuple2!9053 a!501 b!85)))))

(assert (= (and d!75739 res!284630) b!476708))

(declare-fun b_lambda!10529 () Bool)

(assert (=> (not b_lambda!10529) (not b!476708)))

(declare-fun t!15181 () Bool)

(declare-fun tb!4039 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15181) tb!4039))

(declare-fun result!7603 () Bool)

(assert (=> tb!4039 (= result!7603 true)))

(assert (=> b!476708 t!15181))

(declare-fun b_and!20723 () Bool)

(assert (= b_and!20709 (and (=> t!15181 result!7603) b_and!20723)))

(declare-fun m!458605 () Bool)

(assert (=> d!75739 m!458605))

(declare-fun m!458607 () Bool)

(assert (=> d!75739 m!458607))

(declare-fun m!458609 () Bool)

(assert (=> d!75739 m!458609))

(assert (=> d!75739 m!458405))

(declare-fun m!458613 () Bool)

(assert (=> b!476708 m!458613))

(assert (=> b!476610 d!75739))

(declare-fun d!75755 () Bool)

(declare-fun res!284633 () Bool)

(declare-fun e!280058 () Bool)

(assert (=> d!75755 (=> res!284633 e!280058)))

(assert (=> d!75755 (= res!284633 ((_ is Nil!9095) (toList!3993 (+!1801 lt!217110 lt!217108))))))

(assert (=> d!75755 (= (forall!197 (toList!3993 (+!1801 lt!217110 lt!217108)) p!166) e!280058)))

(declare-fun b!476714 () Bool)

(declare-fun e!280059 () Bool)

(assert (=> b!476714 (= e!280058 e!280059)))

(declare-fun res!284634 () Bool)

(assert (=> b!476714 (=> (not res!284634) (not e!280059))))

(assert (=> b!476714 (= res!284634 (dynLambda!947 p!166 (h!9950 (toList!3993 (+!1801 lt!217110 lt!217108)))))))

(declare-fun b!476715 () Bool)

(assert (=> b!476715 (= e!280059 (forall!197 (t!15153 (toList!3993 (+!1801 lt!217110 lt!217108))) p!166))))

(assert (= (and d!75755 (not res!284633)) b!476714))

(assert (= (and b!476714 res!284634) b!476715))

(declare-fun b_lambda!10543 () Bool)

(assert (=> (not b_lambda!10543) (not b!476714)))

(declare-fun t!15185 () Bool)

(declare-fun tb!4043 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15185) tb!4043))

(declare-fun result!7607 () Bool)

(assert (=> tb!4043 (= result!7607 true)))

(assert (=> b!476714 t!15185))

(declare-fun b_and!20727 () Bool)

(assert (= b_and!20723 (and (=> t!15185 result!7607) b_and!20727)))

(declare-fun m!458617 () Bool)

(assert (=> b!476714 m!458617))

(declare-fun m!458619 () Bool)

(assert (=> b!476715 m!458619))

(assert (=> b!476610 d!75755))

(declare-fun d!75759 () Bool)

(declare-fun res!284635 () Bool)

(declare-fun e!280060 () Bool)

(assert (=> d!75759 (=> res!284635 e!280060)))

(assert (=> d!75759 (= res!284635 ((_ is Nil!9095) (toList!3993 (+!1801 lm!215 lt!217108))))))

(assert (=> d!75759 (= (forall!197 (toList!3993 (+!1801 lm!215 lt!217108)) p!166) e!280060)))

(declare-fun b!476716 () Bool)

(declare-fun e!280061 () Bool)

(assert (=> b!476716 (= e!280060 e!280061)))

(declare-fun res!284636 () Bool)

(assert (=> b!476716 (=> (not res!284636) (not e!280061))))

(assert (=> b!476716 (= res!284636 (dynLambda!947 p!166 (h!9950 (toList!3993 (+!1801 lm!215 lt!217108)))))))

(declare-fun b!476717 () Bool)

(assert (=> b!476717 (= e!280061 (forall!197 (t!15153 (toList!3993 (+!1801 lm!215 lt!217108))) p!166))))

(assert (= (and d!75759 (not res!284635)) b!476716))

(assert (= (and b!476716 res!284636) b!476717))

(declare-fun b_lambda!10545 () Bool)

(assert (=> (not b_lambda!10545) (not b!476716)))

(declare-fun t!15187 () Bool)

(declare-fun tb!4045 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15187) tb!4045))

(declare-fun result!7611 () Bool)

(assert (=> tb!4045 (= result!7611 true)))

(assert (=> b!476716 t!15187))

(declare-fun b_and!20729 () Bool)

(assert (= b_and!20727 (and (=> t!15187 result!7611) b_and!20729)))

(declare-fun m!458623 () Bool)

(assert (=> b!476716 m!458623))

(declare-fun m!458625 () Bool)

(assert (=> b!476717 m!458625))

(assert (=> b!476610 d!75759))

(declare-fun d!75761 () Bool)

(declare-fun res!284637 () Bool)

(declare-fun e!280064 () Bool)

(assert (=> d!75761 (=> res!284637 e!280064)))

(assert (=> d!75761 (= res!284637 ((_ is Nil!9095) (toList!3993 lm!215)))))

(assert (=> d!75761 (= (forall!197 (toList!3993 lm!215) p!166) e!280064)))

(declare-fun b!476722 () Bool)

(declare-fun e!280065 () Bool)

(assert (=> b!476722 (= e!280064 e!280065)))

(declare-fun res!284638 () Bool)

(assert (=> b!476722 (=> (not res!284638) (not e!280065))))

(assert (=> b!476722 (= res!284638 (dynLambda!947 p!166 (h!9950 (toList!3993 lm!215))))))

(declare-fun b!476723 () Bool)

(assert (=> b!476723 (= e!280065 (forall!197 (t!15153 (toList!3993 lm!215)) p!166))))

(assert (= (and d!75761 (not res!284637)) b!476722))

(assert (= (and b!476722 res!284638) b!476723))

(declare-fun b_lambda!10547 () Bool)

(assert (=> (not b_lambda!10547) (not b!476722)))

(declare-fun t!15189 () Bool)

(declare-fun tb!4047 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15189) tb!4047))

(declare-fun result!7613 () Bool)

(assert (=> tb!4047 (= result!7613 true)))

(assert (=> b!476722 t!15189))

(declare-fun b_and!20731 () Bool)

(assert (= b_and!20729 (and (=> t!15189 result!7613) b_and!20731)))

(declare-fun m!458627 () Bool)

(assert (=> b!476722 m!458627))

(declare-fun m!458629 () Bool)

(assert (=> b!476723 m!458629))

(assert (=> start!42850 d!75761))

(declare-fun d!75763 () Bool)

(declare-fun isStrictlySorted!384 (List!9098) Bool)

(assert (=> d!75763 (= (inv!15495 lm!215) (isStrictlySorted!384 (toList!3993 lm!215)))))

(declare-fun bs!15137 () Bool)

(assert (= bs!15137 d!75763))

(declare-fun m!458631 () Bool)

(assert (=> bs!15137 m!458631))

(assert (=> start!42850 d!75763))

(declare-fun b!476729 () Bool)

(declare-fun e!280069 () Bool)

(declare-fun tp!42418 () Bool)

(assert (=> b!476729 (= e!280069 (and tp_is_empty!13525 tp!42418))))

(assert (=> b!476612 (= tp!42396 e!280069)))

(assert (= (and b!476612 ((_ is Cons!9094) (toList!3993 lm!215))) b!476729))

(declare-fun b_lambda!10559 () Bool)

(assert (= b_lambda!10545 (or (and start!42850 b_free!12103) b_lambda!10559)))

(declare-fun b_lambda!10561 () Bool)

(assert (= b_lambda!10543 (or (and start!42850 b_free!12103) b_lambda!10561)))

(declare-fun b_lambda!10563 () Bool)

(assert (= b_lambda!10529 (or (and start!42850 b_free!12103) b_lambda!10563)))

(declare-fun b_lambda!10565 () Bool)

(assert (= b_lambda!10547 (or (and start!42850 b_free!12103) b_lambda!10565)))

(declare-fun b_lambda!10567 () Bool)

(assert (= b_lambda!10515 (or (and start!42850 b_free!12103) b_lambda!10567)))

(check-sat b_and!20731 (not b!476658) (not b!476723) (not b_lambda!10567) (not d!75727) (not b!476685) (not b!476715) (not b!476683) (not b_lambda!10505) (not b_lambda!10559) (not b_lambda!10565) (not d!75737) (not d!75713) (not d!75739) (not b!476686) (not d!75725) (not b_lambda!10561) (not b_next!12103) (not b!476684) (not b!476717) (not d!75763) (not b_lambda!10563) tp_is_empty!13525 (not b!476729))
(check-sat b_and!20731 (not b_next!12103))
(get-model)

(declare-fun d!75765 () Bool)

(assert (=> d!75765 (= (isEmpty!609 (toList!3993 lm!215)) ((_ is Nil!9095) (toList!3993 lm!215)))))

(assert (=> d!75713 d!75765))

(declare-fun d!75767 () Bool)

(declare-fun res!284643 () Bool)

(declare-fun e!280074 () Bool)

(assert (=> d!75767 (=> res!284643 e!280074)))

(assert (=> d!75767 (= res!284643 (or ((_ is Nil!9095) (toList!3993 lm!215)) ((_ is Nil!9095) (t!15153 (toList!3993 lm!215)))))))

(assert (=> d!75767 (= (isStrictlySorted!384 (toList!3993 lm!215)) e!280074)))

(declare-fun b!476734 () Bool)

(declare-fun e!280075 () Bool)

(assert (=> b!476734 (= e!280074 e!280075)))

(declare-fun res!284644 () Bool)

(assert (=> b!476734 (=> (not res!284644) (not e!280075))))

(assert (=> b!476734 (= res!284644 (bvslt (_1!4537 (h!9950 (toList!3993 lm!215))) (_1!4537 (h!9950 (t!15153 (toList!3993 lm!215))))))))

(declare-fun b!476735 () Bool)

(assert (=> b!476735 (= e!280075 (isStrictlySorted!384 (t!15153 (toList!3993 lm!215))))))

(assert (= (and d!75767 (not res!284643)) b!476734))

(assert (= (and b!476734 res!284644) b!476735))

(declare-fun m!458633 () Bool)

(assert (=> b!476735 m!458633))

(assert (=> d!75763 d!75767))

(declare-fun b!476744 () Bool)

(declare-fun e!280080 () Option!391)

(assert (=> b!476744 (= e!280080 (Some!390 (_2!4537 (h!9950 (toList!3993 lt!217161)))))))

(declare-fun d!75769 () Bool)

(declare-fun c!57307 () Bool)

(assert (=> d!75769 (= c!57307 (and ((_ is Cons!9094) (toList!3993 lt!217161)) (= (_1!4537 (h!9950 (toList!3993 lt!217161))) (_1!4537 lt!217108))))))

(assert (=> d!75769 (= (getValueByKey!385 (toList!3993 lt!217161) (_1!4537 lt!217108)) e!280080)))

(declare-fun b!476745 () Bool)

(declare-fun e!280081 () Option!391)

(assert (=> b!476745 (= e!280080 e!280081)))

(declare-fun c!57308 () Bool)

(assert (=> b!476745 (= c!57308 (and ((_ is Cons!9094) (toList!3993 lt!217161)) (not (= (_1!4537 (h!9950 (toList!3993 lt!217161))) (_1!4537 lt!217108)))))))

(declare-fun b!476747 () Bool)

(assert (=> b!476747 (= e!280081 None!389)))

(declare-fun b!476746 () Bool)

(assert (=> b!476746 (= e!280081 (getValueByKey!385 (t!15153 (toList!3993 lt!217161)) (_1!4537 lt!217108)))))

(assert (= (and d!75769 c!57307) b!476744))

(assert (= (and d!75769 (not c!57307)) b!476745))

(assert (= (and b!476745 c!57308) b!476746))

(assert (= (and b!476745 (not c!57308)) b!476747))

(declare-fun m!458635 () Bool)

(assert (=> b!476746 m!458635))

(assert (=> b!476683 d!75769))

(declare-fun d!75773 () Bool)

(declare-fun res!284647 () Bool)

(declare-fun e!280084 () Bool)

(assert (=> d!75773 (=> res!284647 e!280084)))

(assert (=> d!75773 (= res!284647 ((_ is Nil!9095) (t!15153 (toList!3993 (+!1801 lt!217110 lt!217108)))))))

(assert (=> d!75773 (= (forall!197 (t!15153 (toList!3993 (+!1801 lt!217110 lt!217108))) p!166) e!280084)))

(declare-fun b!476750 () Bool)

(declare-fun e!280085 () Bool)

(assert (=> b!476750 (= e!280084 e!280085)))

(declare-fun res!284648 () Bool)

(assert (=> b!476750 (=> (not res!284648) (not e!280085))))

(assert (=> b!476750 (= res!284648 (dynLambda!947 p!166 (h!9950 (t!15153 (toList!3993 (+!1801 lt!217110 lt!217108))))))))

(declare-fun b!476751 () Bool)

(assert (=> b!476751 (= e!280085 (forall!197 (t!15153 (t!15153 (toList!3993 (+!1801 lt!217110 lt!217108)))) p!166))))

(assert (= (and d!75773 (not res!284647)) b!476750))

(assert (= (and b!476750 res!284648) b!476751))

(declare-fun b_lambda!10571 () Bool)

(assert (=> (not b_lambda!10571) (not b!476750)))

(declare-fun t!15193 () Bool)

(declare-fun tb!4051 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15193) tb!4051))

(declare-fun result!7619 () Bool)

(assert (=> tb!4051 (= result!7619 true)))

(assert (=> b!476750 t!15193))

(declare-fun b_and!20735 () Bool)

(assert (= b_and!20731 (and (=> t!15193 result!7619) b_and!20735)))

(declare-fun m!458639 () Bool)

(assert (=> b!476750 m!458639))

(declare-fun m!458643 () Bool)

(assert (=> b!476751 m!458643))

(assert (=> b!476715 d!75773))

(declare-fun d!75777 () Bool)

(declare-fun res!284651 () Bool)

(declare-fun e!280088 () Bool)

(assert (=> d!75777 (=> res!284651 e!280088)))

(assert (=> d!75777 (= res!284651 ((_ is Nil!9095) (t!15153 (toList!3993 lt!217110))))))

(assert (=> d!75777 (= (forall!197 (t!15153 (toList!3993 lt!217110)) p!166) e!280088)))

(declare-fun b!476754 () Bool)

(declare-fun e!280089 () Bool)

(assert (=> b!476754 (= e!280088 e!280089)))

(declare-fun res!284652 () Bool)

(assert (=> b!476754 (=> (not res!284652) (not e!280089))))

(assert (=> b!476754 (= res!284652 (dynLambda!947 p!166 (h!9950 (t!15153 (toList!3993 lt!217110)))))))

(declare-fun b!476755 () Bool)

(assert (=> b!476755 (= e!280089 (forall!197 (t!15153 (t!15153 (toList!3993 lt!217110))) p!166))))

(assert (= (and d!75777 (not res!284651)) b!476754))

(assert (= (and b!476754 res!284652) b!476755))

(declare-fun b_lambda!10575 () Bool)

(assert (=> (not b_lambda!10575) (not b!476754)))

(declare-fun t!15197 () Bool)

(declare-fun tb!4055 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15197) tb!4055))

(declare-fun result!7623 () Bool)

(assert (=> tb!4055 (= result!7623 true)))

(assert (=> b!476754 t!15197))

(declare-fun b_and!20739 () Bool)

(assert (= b_and!20735 (and (=> t!15197 result!7623) b_and!20739)))

(declare-fun m!458647 () Bool)

(assert (=> b!476754 m!458647))

(declare-fun m!458651 () Bool)

(assert (=> b!476755 m!458651))

(assert (=> b!476658 d!75777))

(declare-fun d!75781 () Bool)

(declare-fun res!284653 () Bool)

(declare-fun e!280090 () Bool)

(assert (=> d!75781 (=> res!284653 e!280090)))

(assert (=> d!75781 (= res!284653 ((_ is Nil!9095) (t!15153 (toList!3993 lm!215))))))

(assert (=> d!75781 (= (forall!197 (t!15153 (toList!3993 lm!215)) p!166) e!280090)))

(declare-fun b!476756 () Bool)

(declare-fun e!280091 () Bool)

(assert (=> b!476756 (= e!280090 e!280091)))

(declare-fun res!284654 () Bool)

(assert (=> b!476756 (=> (not res!284654) (not e!280091))))

(assert (=> b!476756 (= res!284654 (dynLambda!947 p!166 (h!9950 (t!15153 (toList!3993 lm!215)))))))

(declare-fun b!476757 () Bool)

(assert (=> b!476757 (= e!280091 (forall!197 (t!15153 (t!15153 (toList!3993 lm!215))) p!166))))

(assert (= (and d!75781 (not res!284653)) b!476756))

(assert (= (and b!476756 res!284654) b!476757))

(declare-fun b_lambda!10577 () Bool)

(assert (=> (not b_lambda!10577) (not b!476756)))

(declare-fun t!15199 () Bool)

(declare-fun tb!4057 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15199) tb!4057))

(declare-fun result!7625 () Bool)

(assert (=> tb!4057 (= result!7625 true)))

(assert (=> b!476756 t!15199))

(declare-fun b_and!20741 () Bool)

(assert (= b_and!20739 (and (=> t!15199 result!7625) b_and!20741)))

(declare-fun m!458653 () Bool)

(assert (=> b!476756 m!458653))

(declare-fun m!458655 () Bool)

(assert (=> b!476757 m!458655))

(assert (=> b!476723 d!75781))

(declare-fun d!75783 () Bool)

(declare-fun e!280112 () Bool)

(assert (=> d!75783 e!280112))

(declare-fun res!284665 () Bool)

(assert (=> d!75783 (=> res!284665 e!280112)))

(declare-fun lt!217195 () Bool)

(assert (=> d!75783 (= res!284665 (not lt!217195))))

(declare-fun lt!217196 () Bool)

(assert (=> d!75783 (= lt!217195 lt!217196)))

(declare-fun lt!217197 () Unit!14014)

(declare-fun e!280113 () Unit!14014)

(assert (=> d!75783 (= lt!217197 e!280113)))

(declare-fun c!57319 () Bool)

(assert (=> d!75783 (= c!57319 lt!217196)))

(declare-fun containsKey!346 (List!9098 (_ BitVec 64)) Bool)

(assert (=> d!75783 (= lt!217196 (containsKey!346 (toList!3993 lt!217161) (_1!4537 lt!217108)))))

(assert (=> d!75783 (= (contains!2561 lt!217161 (_1!4537 lt!217108)) lt!217195)))

(declare-fun b!476788 () Bool)

(declare-fun lt!217194 () Unit!14014)

(assert (=> b!476788 (= e!280113 lt!217194)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!295 (List!9098 (_ BitVec 64)) Unit!14014)

(assert (=> b!476788 (= lt!217194 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3993 lt!217161) (_1!4537 lt!217108)))))

(declare-fun isDefined!296 (Option!391) Bool)

(assert (=> b!476788 (isDefined!296 (getValueByKey!385 (toList!3993 lt!217161) (_1!4537 lt!217108)))))

(declare-fun b!476789 () Bool)

(declare-fun Unit!14020 () Unit!14014)

(assert (=> b!476789 (= e!280113 Unit!14020)))

(declare-fun b!476790 () Bool)

(assert (=> b!476790 (= e!280112 (isDefined!296 (getValueByKey!385 (toList!3993 lt!217161) (_1!4537 lt!217108))))))

(assert (= (and d!75783 c!57319) b!476788))

(assert (= (and d!75783 (not c!57319)) b!476789))

(assert (= (and d!75783 (not res!284665)) b!476790))

(declare-fun m!458667 () Bool)

(assert (=> d!75783 m!458667))

(declare-fun m!458669 () Bool)

(assert (=> b!476788 m!458669))

(assert (=> b!476788 m!458537))

(assert (=> b!476788 m!458537))

(declare-fun m!458671 () Bool)

(assert (=> b!476788 m!458671))

(assert (=> b!476790 m!458537))

(assert (=> b!476790 m!458537))

(assert (=> b!476790 m!458671))

(assert (=> d!75727 d!75783))

(declare-fun b!476791 () Bool)

(declare-fun e!280114 () Option!391)

(assert (=> b!476791 (= e!280114 (Some!390 (_2!4537 (h!9950 lt!217163))))))

(declare-fun d!75793 () Bool)

(declare-fun c!57320 () Bool)

(assert (=> d!75793 (= c!57320 (and ((_ is Cons!9094) lt!217163) (= (_1!4537 (h!9950 lt!217163)) (_1!4537 lt!217108))))))

(assert (=> d!75793 (= (getValueByKey!385 lt!217163 (_1!4537 lt!217108)) e!280114)))

(declare-fun b!476792 () Bool)

(declare-fun e!280115 () Option!391)

(assert (=> b!476792 (= e!280114 e!280115)))

(declare-fun c!57321 () Bool)

(assert (=> b!476792 (= c!57321 (and ((_ is Cons!9094) lt!217163) (not (= (_1!4537 (h!9950 lt!217163)) (_1!4537 lt!217108)))))))

(declare-fun b!476794 () Bool)

(assert (=> b!476794 (= e!280115 None!389)))

(declare-fun b!476793 () Bool)

(assert (=> b!476793 (= e!280115 (getValueByKey!385 (t!15153 lt!217163) (_1!4537 lt!217108)))))

(assert (= (and d!75793 c!57320) b!476791))

(assert (= (and d!75793 (not c!57320)) b!476792))

(assert (= (and b!476792 c!57321) b!476793))

(assert (= (and b!476792 (not c!57321)) b!476794))

(declare-fun m!458673 () Bool)

(assert (=> b!476793 m!458673))

(assert (=> d!75727 d!75793))

(declare-fun d!75795 () Bool)

(assert (=> d!75795 (= (getValueByKey!385 lt!217163 (_1!4537 lt!217108)) (Some!390 (_2!4537 lt!217108)))))

(declare-fun lt!217204 () Unit!14014)

(declare-fun choose!1371 (List!9098 (_ BitVec 64) B!1052) Unit!14014)

(assert (=> d!75795 (= lt!217204 (choose!1371 lt!217163 (_1!4537 lt!217108) (_2!4537 lt!217108)))))

(declare-fun e!280126 () Bool)

(assert (=> d!75795 e!280126))

(declare-fun res!284678 () Bool)

(assert (=> d!75795 (=> (not res!284678) (not e!280126))))

(assert (=> d!75795 (= res!284678 (isStrictlySorted!384 lt!217163))))

(assert (=> d!75795 (= (lemmaContainsTupThenGetReturnValue!210 lt!217163 (_1!4537 lt!217108) (_2!4537 lt!217108)) lt!217204)))

(declare-fun b!476807 () Bool)

(declare-fun res!284679 () Bool)

(assert (=> b!476807 (=> (not res!284679) (not e!280126))))

(assert (=> b!476807 (= res!284679 (containsKey!346 lt!217163 (_1!4537 lt!217108)))))

(declare-fun b!476808 () Bool)

(assert (=> b!476808 (= e!280126 (contains!2562 lt!217163 (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(assert (= (and d!75795 res!284678) b!476807))

(assert (= (and b!476807 res!284679) b!476808))

(assert (=> d!75795 m!458531))

(declare-fun m!458687 () Bool)

(assert (=> d!75795 m!458687))

(declare-fun m!458689 () Bool)

(assert (=> d!75795 m!458689))

(declare-fun m!458691 () Bool)

(assert (=> b!476807 m!458691))

(declare-fun m!458693 () Bool)

(assert (=> b!476808 m!458693))

(assert (=> d!75727 d!75795))

(declare-fun b!476866 () Bool)

(declare-fun res!284699 () Bool)

(declare-fun e!280160 () Bool)

(assert (=> b!476866 (=> (not res!284699) (not e!280160))))

(declare-fun lt!217222 () List!9098)

(assert (=> b!476866 (= res!284699 (containsKey!346 lt!217222 (_1!4537 lt!217108)))))

(declare-fun b!476867 () Bool)

(declare-fun e!280161 () List!9098)

(declare-fun call!30712 () List!9098)

(assert (=> b!476867 (= e!280161 call!30712)))

(declare-fun b!476868 () Bool)

(declare-fun e!280163 () List!9098)

(assert (=> b!476868 (= e!280163 (insertStrictlySorted!213 (t!15153 (toList!3993 lt!217110)) (_1!4537 lt!217108) (_2!4537 lt!217108)))))

(declare-fun bm!30709 () Bool)

(declare-fun call!30713 () List!9098)

(declare-fun call!30714 () List!9098)

(assert (=> bm!30709 (= call!30713 call!30714)))

(declare-fun b!476869 () Bool)

(declare-fun c!57342 () Bool)

(assert (=> b!476869 (= c!57342 (and ((_ is Cons!9094) (toList!3993 lt!217110)) (bvsgt (_1!4537 (h!9950 (toList!3993 lt!217110))) (_1!4537 lt!217108))))))

(declare-fun e!280164 () List!9098)

(assert (=> b!476869 (= e!280164 e!280161)))

(declare-fun bm!30710 () Bool)

(assert (=> bm!30710 (= call!30712 call!30713)))

(declare-fun b!476870 () Bool)

(assert (=> b!476870 (= e!280164 call!30713)))

(declare-fun b!476871 () Bool)

(assert (=> b!476871 (= e!280160 (contains!2562 lt!217222 (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(declare-fun c!57341 () Bool)

(declare-fun bm!30711 () Bool)

(declare-fun $colon$colon!109 (List!9098 tuple2!9052) List!9098)

(assert (=> bm!30711 (= call!30714 ($colon$colon!109 e!280163 (ite c!57341 (h!9950 (toList!3993 lt!217110)) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108)))))))

(declare-fun c!57344 () Bool)

(assert (=> bm!30711 (= c!57344 c!57341)))

(declare-fun d!75801 () Bool)

(assert (=> d!75801 e!280160))

(declare-fun res!284700 () Bool)

(assert (=> d!75801 (=> (not res!284700) (not e!280160))))

(assert (=> d!75801 (= res!284700 (isStrictlySorted!384 lt!217222))))

(declare-fun e!280162 () List!9098)

(assert (=> d!75801 (= lt!217222 e!280162)))

(assert (=> d!75801 (= c!57341 (and ((_ is Cons!9094) (toList!3993 lt!217110)) (bvslt (_1!4537 (h!9950 (toList!3993 lt!217110))) (_1!4537 lt!217108))))))

(assert (=> d!75801 (isStrictlySorted!384 (toList!3993 lt!217110))))

(assert (=> d!75801 (= (insertStrictlySorted!213 (toList!3993 lt!217110) (_1!4537 lt!217108) (_2!4537 lt!217108)) lt!217222)))

(declare-fun b!476872 () Bool)

(assert (=> b!476872 (= e!280162 call!30714)))

(declare-fun c!57343 () Bool)

(declare-fun b!476873 () Bool)

(assert (=> b!476873 (= e!280163 (ite c!57343 (t!15153 (toList!3993 lt!217110)) (ite c!57342 (Cons!9094 (h!9950 (toList!3993 lt!217110)) (t!15153 (toList!3993 lt!217110))) Nil!9095)))))

(declare-fun b!476874 () Bool)

(assert (=> b!476874 (= e!280161 call!30712)))

(declare-fun b!476875 () Bool)

(assert (=> b!476875 (= e!280162 e!280164)))

(assert (=> b!476875 (= c!57343 (and ((_ is Cons!9094) (toList!3993 lt!217110)) (= (_1!4537 (h!9950 (toList!3993 lt!217110))) (_1!4537 lt!217108))))))

(assert (= (and d!75801 c!57341) b!476872))

(assert (= (and d!75801 (not c!57341)) b!476875))

(assert (= (and b!476875 c!57343) b!476870))

(assert (= (and b!476875 (not c!57343)) b!476869))

(assert (= (and b!476869 c!57342) b!476867))

(assert (= (and b!476869 (not c!57342)) b!476874))

(assert (= (or b!476867 b!476874) bm!30710))

(assert (= (or b!476870 bm!30710) bm!30709))

(assert (= (or b!476872 bm!30709) bm!30711))

(assert (= (and bm!30711 c!57344) b!476868))

(assert (= (and bm!30711 (not c!57344)) b!476873))

(assert (= (and d!75801 res!284700) b!476866))

(assert (= (and b!476866 res!284699) b!476871))

(declare-fun m!458715 () Bool)

(assert (=> b!476871 m!458715))

(declare-fun m!458717 () Bool)

(assert (=> bm!30711 m!458717))

(declare-fun m!458719 () Bool)

(assert (=> b!476868 m!458719))

(declare-fun m!458721 () Bool)

(assert (=> d!75801 m!458721))

(declare-fun m!458723 () Bool)

(assert (=> d!75801 m!458723))

(declare-fun m!458725 () Bool)

(assert (=> b!476866 m!458725))

(assert (=> d!75727 d!75801))

(declare-fun b!476876 () Bool)

(declare-fun e!280165 () Option!391)

(assert (=> b!476876 (= e!280165 (Some!390 (_2!4537 (h!9950 (toList!3993 lt!217165)))))))

(declare-fun d!75815 () Bool)

(declare-fun c!57345 () Bool)

(assert (=> d!75815 (= c!57345 (and ((_ is Cons!9094) (toList!3993 lt!217165)) (= (_1!4537 (h!9950 (toList!3993 lt!217165))) (_1!4537 lt!217108))))))

(assert (=> d!75815 (= (getValueByKey!385 (toList!3993 lt!217165) (_1!4537 lt!217108)) e!280165)))

(declare-fun b!476877 () Bool)

(declare-fun e!280166 () Option!391)

(assert (=> b!476877 (= e!280165 e!280166)))

(declare-fun c!57346 () Bool)

(assert (=> b!476877 (= c!57346 (and ((_ is Cons!9094) (toList!3993 lt!217165)) (not (= (_1!4537 (h!9950 (toList!3993 lt!217165))) (_1!4537 lt!217108)))))))

(declare-fun b!476879 () Bool)

(assert (=> b!476879 (= e!280166 None!389)))

(declare-fun b!476878 () Bool)

(assert (=> b!476878 (= e!280166 (getValueByKey!385 (t!15153 (toList!3993 lt!217165)) (_1!4537 lt!217108)))))

(assert (= (and d!75815 c!57345) b!476876))

(assert (= (and d!75815 (not c!57345)) b!476877))

(assert (= (and b!476877 c!57346) b!476878))

(assert (= (and b!476877 (not c!57346)) b!476879))

(declare-fun m!458727 () Bool)

(assert (=> b!476878 m!458727))

(assert (=> b!476685 d!75815))

(declare-fun d!75817 () Bool)

(declare-fun lt!217230 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!209 (List!9098) (InoxSet tuple2!9052))

(assert (=> d!75817 (= lt!217230 (select (content!209 (toList!3993 lt!217165)) lt!217108))))

(declare-fun e!280180 () Bool)

(assert (=> d!75817 (= lt!217230 e!280180)))

(declare-fun res!284713 () Bool)

(assert (=> d!75817 (=> (not res!284713) (not e!280180))))

(assert (=> d!75817 (= res!284713 ((_ is Cons!9094) (toList!3993 lt!217165)))))

(assert (=> d!75817 (= (contains!2562 (toList!3993 lt!217165) lt!217108) lt!217230)))

(declare-fun b!476892 () Bool)

(declare-fun e!280179 () Bool)

(assert (=> b!476892 (= e!280180 e!280179)))

(declare-fun res!284714 () Bool)

(assert (=> b!476892 (=> res!284714 e!280179)))

(assert (=> b!476892 (= res!284714 (= (h!9950 (toList!3993 lt!217165)) lt!217108))))

(declare-fun b!476893 () Bool)

(assert (=> b!476893 (= e!280179 (contains!2562 (t!15153 (toList!3993 lt!217165)) lt!217108))))

(assert (= (and d!75817 res!284713) b!476892))

(assert (= (and b!476892 (not res!284714)) b!476893))

(declare-fun m!458739 () Bool)

(assert (=> d!75817 m!458739))

(declare-fun m!458741 () Bool)

(assert (=> d!75817 m!458741))

(declare-fun m!458743 () Bool)

(assert (=> b!476893 m!458743))

(assert (=> b!476686 d!75817))

(declare-fun d!75823 () Bool)

(declare-fun res!284717 () Bool)

(declare-fun e!280191 () Bool)

(assert (=> d!75823 (=> res!284717 e!280191)))

(assert (=> d!75823 (= res!284717 ((_ is Nil!9095) (toList!3993 (+!1801 lt!217110 (tuple2!9053 a!501 b!85)))))))

(assert (=> d!75823 (= (forall!197 (toList!3993 (+!1801 lt!217110 (tuple2!9053 a!501 b!85))) p!166) e!280191)))

(declare-fun b!476912 () Bool)

(declare-fun e!280192 () Bool)

(assert (=> b!476912 (= e!280191 e!280192)))

(declare-fun res!284718 () Bool)

(assert (=> b!476912 (=> (not res!284718) (not e!280192))))

(assert (=> b!476912 (= res!284718 (dynLambda!947 p!166 (h!9950 (toList!3993 (+!1801 lt!217110 (tuple2!9053 a!501 b!85))))))))

(declare-fun b!476913 () Bool)

(assert (=> b!476913 (= e!280192 (forall!197 (t!15153 (toList!3993 (+!1801 lt!217110 (tuple2!9053 a!501 b!85)))) p!166))))

(assert (= (and d!75823 (not res!284717)) b!476912))

(assert (= (and b!476912 res!284718) b!476913))

(declare-fun b_lambda!10585 () Bool)

(assert (=> (not b_lambda!10585) (not b!476912)))

(declare-fun t!15207 () Bool)

(declare-fun tb!4065 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15207) tb!4065))

(declare-fun result!7633 () Bool)

(assert (=> tb!4065 (= result!7633 true)))

(assert (=> b!476912 t!15207))

(declare-fun b_and!20749 () Bool)

(assert (= b_and!20741 (and (=> t!15207 result!7633) b_and!20749)))

(declare-fun m!458751 () Bool)

(assert (=> b!476912 m!458751))

(declare-fun m!458753 () Bool)

(assert (=> b!476913 m!458753))

(assert (=> d!75739 d!75823))

(declare-fun d!75829 () Bool)

(declare-fun e!280193 () Bool)

(assert (=> d!75829 e!280193))

(declare-fun res!284719 () Bool)

(assert (=> d!75829 (=> (not res!284719) (not e!280193))))

(declare-fun lt!217231 () ListLongMap!7955)

(assert (=> d!75829 (= res!284719 (contains!2561 lt!217231 (_1!4537 (tuple2!9053 a!501 b!85))))))

(declare-fun lt!217233 () List!9098)

(assert (=> d!75829 (= lt!217231 (ListLongMap!7956 lt!217233))))

(declare-fun lt!217232 () Unit!14014)

(declare-fun lt!217234 () Unit!14014)

(assert (=> d!75829 (= lt!217232 lt!217234)))

(assert (=> d!75829 (= (getValueByKey!385 lt!217233 (_1!4537 (tuple2!9053 a!501 b!85))) (Some!390 (_2!4537 (tuple2!9053 a!501 b!85))))))

(assert (=> d!75829 (= lt!217234 (lemmaContainsTupThenGetReturnValue!210 lt!217233 (_1!4537 (tuple2!9053 a!501 b!85)) (_2!4537 (tuple2!9053 a!501 b!85))))))

(assert (=> d!75829 (= lt!217233 (insertStrictlySorted!213 (toList!3993 lt!217110) (_1!4537 (tuple2!9053 a!501 b!85)) (_2!4537 (tuple2!9053 a!501 b!85))))))

(assert (=> d!75829 (= (+!1801 lt!217110 (tuple2!9053 a!501 b!85)) lt!217231)))

(declare-fun b!476914 () Bool)

(declare-fun res!284720 () Bool)

(assert (=> b!476914 (=> (not res!284720) (not e!280193))))

(assert (=> b!476914 (= res!284720 (= (getValueByKey!385 (toList!3993 lt!217231) (_1!4537 (tuple2!9053 a!501 b!85))) (Some!390 (_2!4537 (tuple2!9053 a!501 b!85)))))))

(declare-fun b!476915 () Bool)

(assert (=> b!476915 (= e!280193 (contains!2562 (toList!3993 lt!217231) (tuple2!9053 a!501 b!85)))))

(assert (= (and d!75829 res!284719) b!476914))

(assert (= (and b!476914 res!284720) b!476915))

(declare-fun m!458755 () Bool)

(assert (=> d!75829 m!458755))

(declare-fun m!458757 () Bool)

(assert (=> d!75829 m!458757))

(declare-fun m!458759 () Bool)

(assert (=> d!75829 m!458759))

(declare-fun m!458761 () Bool)

(assert (=> d!75829 m!458761))

(declare-fun m!458763 () Bool)

(assert (=> b!476914 m!458763))

(declare-fun m!458765 () Bool)

(assert (=> b!476915 m!458765))

(assert (=> d!75739 d!75829))

(declare-fun d!75831 () Bool)

(assert (=> d!75831 (forall!197 (toList!3993 (+!1801 lt!217110 (tuple2!9053 a!501 b!85))) p!166)))

(assert (=> d!75831 true))

(declare-fun _$30!87 () Unit!14014)

(assert (=> d!75831 (= (choose!1369 lt!217110 p!166 a!501 b!85) _$30!87)))

(declare-fun bs!15138 () Bool)

(assert (= bs!15138 d!75831))

(assert (=> bs!15138 m!458605))

(assert (=> bs!15138 m!458607))

(assert (=> d!75739 d!75831))

(assert (=> d!75739 d!75719))

(declare-fun d!75833 () Bool)

(declare-fun lt!217235 () Bool)

(assert (=> d!75833 (= lt!217235 (select (content!209 (toList!3993 lt!217161)) lt!217108))))

(declare-fun e!280199 () Bool)

(assert (=> d!75833 (= lt!217235 e!280199)))

(declare-fun res!284725 () Bool)

(assert (=> d!75833 (=> (not res!284725) (not e!280199))))

(assert (=> d!75833 (= res!284725 ((_ is Cons!9094) (toList!3993 lt!217161)))))

(assert (=> d!75833 (= (contains!2562 (toList!3993 lt!217161) lt!217108) lt!217235)))

(declare-fun b!476925 () Bool)

(declare-fun e!280198 () Bool)

(assert (=> b!476925 (= e!280199 e!280198)))

(declare-fun res!284726 () Bool)

(assert (=> b!476925 (=> res!284726 e!280198)))

(assert (=> b!476925 (= res!284726 (= (h!9950 (toList!3993 lt!217161)) lt!217108))))

(declare-fun b!476926 () Bool)

(assert (=> b!476926 (= e!280198 (contains!2562 (t!15153 (toList!3993 lt!217161)) lt!217108))))

(assert (= (and d!75833 res!284725) b!476925))

(assert (= (and b!476925 (not res!284726)) b!476926))

(declare-fun m!458767 () Bool)

(assert (=> d!75833 m!458767))

(declare-fun m!458769 () Bool)

(assert (=> d!75833 m!458769))

(declare-fun m!458771 () Bool)

(assert (=> b!476926 m!458771))

(assert (=> b!476684 d!75833))

(declare-fun d!75835 () Bool)

(declare-fun e!280207 () Bool)

(assert (=> d!75835 e!280207))

(declare-fun res!284729 () Bool)

(assert (=> d!75835 (=> res!284729 e!280207)))

(declare-fun lt!217246 () Bool)

(assert (=> d!75835 (= res!284729 (not lt!217246))))

(declare-fun lt!217247 () Bool)

(assert (=> d!75835 (= lt!217246 lt!217247)))

(declare-fun lt!217248 () Unit!14014)

(declare-fun e!280208 () Unit!14014)

(assert (=> d!75835 (= lt!217248 e!280208)))

(declare-fun c!57363 () Bool)

(assert (=> d!75835 (= c!57363 lt!217247)))

(assert (=> d!75835 (= lt!217247 (containsKey!346 (toList!3993 lt!217165) (_1!4537 lt!217108)))))

(assert (=> d!75835 (= (contains!2561 lt!217165 (_1!4537 lt!217108)) lt!217246)))

(declare-fun b!476941 () Bool)

(declare-fun lt!217245 () Unit!14014)

(assert (=> b!476941 (= e!280208 lt!217245)))

(assert (=> b!476941 (= lt!217245 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3993 lt!217165) (_1!4537 lt!217108)))))

(assert (=> b!476941 (isDefined!296 (getValueByKey!385 (toList!3993 lt!217165) (_1!4537 lt!217108)))))

(declare-fun b!476942 () Bool)

(declare-fun Unit!14022 () Unit!14014)

(assert (=> b!476942 (= e!280208 Unit!14022)))

(declare-fun b!476943 () Bool)

(assert (=> b!476943 (= e!280207 (isDefined!296 (getValueByKey!385 (toList!3993 lt!217165) (_1!4537 lt!217108))))))

(assert (= (and d!75835 c!57363) b!476941))

(assert (= (and d!75835 (not c!57363)) b!476942))

(assert (= (and d!75835 (not res!284729)) b!476943))

(declare-fun m!458773 () Bool)

(assert (=> d!75835 m!458773))

(declare-fun m!458775 () Bool)

(assert (=> b!476941 m!458775))

(assert (=> b!476941 m!458549))

(assert (=> b!476941 m!458549))

(declare-fun m!458777 () Bool)

(assert (=> b!476941 m!458777))

(assert (=> b!476943 m!458549))

(assert (=> b!476943 m!458549))

(assert (=> b!476943 m!458777))

(assert (=> d!75737 d!75835))

(declare-fun b!476946 () Bool)

(declare-fun e!280211 () Option!391)

(assert (=> b!476946 (= e!280211 (Some!390 (_2!4537 (h!9950 lt!217167))))))

(declare-fun d!75837 () Bool)

(declare-fun c!57364 () Bool)

(assert (=> d!75837 (= c!57364 (and ((_ is Cons!9094) lt!217167) (= (_1!4537 (h!9950 lt!217167)) (_1!4537 lt!217108))))))

(assert (=> d!75837 (= (getValueByKey!385 lt!217167 (_1!4537 lt!217108)) e!280211)))

(declare-fun b!476947 () Bool)

(declare-fun e!280212 () Option!391)

(assert (=> b!476947 (= e!280211 e!280212)))

(declare-fun c!57365 () Bool)

(assert (=> b!476947 (= c!57365 (and ((_ is Cons!9094) lt!217167) (not (= (_1!4537 (h!9950 lt!217167)) (_1!4537 lt!217108)))))))

(declare-fun b!476949 () Bool)

(assert (=> b!476949 (= e!280212 None!389)))

(declare-fun b!476948 () Bool)

(assert (=> b!476948 (= e!280212 (getValueByKey!385 (t!15153 lt!217167) (_1!4537 lt!217108)))))

(assert (= (and d!75837 c!57364) b!476946))

(assert (= (and d!75837 (not c!57364)) b!476947))

(assert (= (and b!476947 c!57365) b!476948))

(assert (= (and b!476947 (not c!57365)) b!476949))

(declare-fun m!458789 () Bool)

(assert (=> b!476948 m!458789))

(assert (=> d!75737 d!75837))

(declare-fun d!75841 () Bool)

(assert (=> d!75841 (= (getValueByKey!385 lt!217167 (_1!4537 lt!217108)) (Some!390 (_2!4537 lt!217108)))))

(declare-fun lt!217249 () Unit!14014)

(assert (=> d!75841 (= lt!217249 (choose!1371 lt!217167 (_1!4537 lt!217108) (_2!4537 lt!217108)))))

(declare-fun e!280215 () Bool)

(assert (=> d!75841 e!280215))

(declare-fun res!284734 () Bool)

(assert (=> d!75841 (=> (not res!284734) (not e!280215))))

(assert (=> d!75841 (= res!284734 (isStrictlySorted!384 lt!217167))))

(assert (=> d!75841 (= (lemmaContainsTupThenGetReturnValue!210 lt!217167 (_1!4537 lt!217108) (_2!4537 lt!217108)) lt!217249)))

(declare-fun b!476952 () Bool)

(declare-fun res!284735 () Bool)

(assert (=> b!476952 (=> (not res!284735) (not e!280215))))

(assert (=> b!476952 (= res!284735 (containsKey!346 lt!217167 (_1!4537 lt!217108)))))

(declare-fun b!476953 () Bool)

(assert (=> b!476953 (= e!280215 (contains!2562 lt!217167 (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(assert (= (and d!75841 res!284734) b!476952))

(assert (= (and b!476952 res!284735) b!476953))

(assert (=> d!75841 m!458543))

(declare-fun m!458791 () Bool)

(assert (=> d!75841 m!458791))

(declare-fun m!458793 () Bool)

(assert (=> d!75841 m!458793))

(declare-fun m!458795 () Bool)

(assert (=> b!476952 m!458795))

(declare-fun m!458797 () Bool)

(assert (=> b!476953 m!458797))

(assert (=> d!75737 d!75841))

(declare-fun b!476954 () Bool)

(declare-fun res!284736 () Bool)

(declare-fun e!280216 () Bool)

(assert (=> b!476954 (=> (not res!284736) (not e!280216))))

(declare-fun lt!217250 () List!9098)

(assert (=> b!476954 (= res!284736 (containsKey!346 lt!217250 (_1!4537 lt!217108)))))

(declare-fun b!476955 () Bool)

(declare-fun e!280217 () List!9098)

(declare-fun call!30724 () List!9098)

(assert (=> b!476955 (= e!280217 call!30724)))

(declare-fun b!476956 () Bool)

(declare-fun e!280219 () List!9098)

(assert (=> b!476956 (= e!280219 (insertStrictlySorted!213 (t!15153 (toList!3993 lm!215)) (_1!4537 lt!217108) (_2!4537 lt!217108)))))

(declare-fun bm!30721 () Bool)

(declare-fun call!30725 () List!9098)

(declare-fun call!30726 () List!9098)

(assert (=> bm!30721 (= call!30725 call!30726)))

(declare-fun b!476957 () Bool)

(declare-fun c!57367 () Bool)

(assert (=> b!476957 (= c!57367 (and ((_ is Cons!9094) (toList!3993 lm!215)) (bvsgt (_1!4537 (h!9950 (toList!3993 lm!215))) (_1!4537 lt!217108))))))

(declare-fun e!280220 () List!9098)

(assert (=> b!476957 (= e!280220 e!280217)))

(declare-fun bm!30722 () Bool)

(assert (=> bm!30722 (= call!30724 call!30725)))

(declare-fun b!476958 () Bool)

(assert (=> b!476958 (= e!280220 call!30725)))

(declare-fun b!476959 () Bool)

(assert (=> b!476959 (= e!280216 (contains!2562 lt!217250 (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(declare-fun bm!30723 () Bool)

(declare-fun c!57366 () Bool)

(assert (=> bm!30723 (= call!30726 ($colon$colon!109 e!280219 (ite c!57366 (h!9950 (toList!3993 lm!215)) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108)))))))

(declare-fun c!57369 () Bool)

(assert (=> bm!30723 (= c!57369 c!57366)))

(declare-fun d!75843 () Bool)

(assert (=> d!75843 e!280216))

(declare-fun res!284737 () Bool)

(assert (=> d!75843 (=> (not res!284737) (not e!280216))))

(assert (=> d!75843 (= res!284737 (isStrictlySorted!384 lt!217250))))

(declare-fun e!280218 () List!9098)

(assert (=> d!75843 (= lt!217250 e!280218)))

(assert (=> d!75843 (= c!57366 (and ((_ is Cons!9094) (toList!3993 lm!215)) (bvslt (_1!4537 (h!9950 (toList!3993 lm!215))) (_1!4537 lt!217108))))))

(assert (=> d!75843 (isStrictlySorted!384 (toList!3993 lm!215))))

(assert (=> d!75843 (= (insertStrictlySorted!213 (toList!3993 lm!215) (_1!4537 lt!217108) (_2!4537 lt!217108)) lt!217250)))

(declare-fun b!476960 () Bool)

(assert (=> b!476960 (= e!280218 call!30726)))

(declare-fun b!476961 () Bool)

(declare-fun c!57368 () Bool)

(assert (=> b!476961 (= e!280219 (ite c!57368 (t!15153 (toList!3993 lm!215)) (ite c!57367 (Cons!9094 (h!9950 (toList!3993 lm!215)) (t!15153 (toList!3993 lm!215))) Nil!9095)))))

(declare-fun b!476962 () Bool)

(assert (=> b!476962 (= e!280217 call!30724)))

(declare-fun b!476963 () Bool)

(assert (=> b!476963 (= e!280218 e!280220)))

(assert (=> b!476963 (= c!57368 (and ((_ is Cons!9094) (toList!3993 lm!215)) (= (_1!4537 (h!9950 (toList!3993 lm!215))) (_1!4537 lt!217108))))))

(assert (= (and d!75843 c!57366) b!476960))

(assert (= (and d!75843 (not c!57366)) b!476963))

(assert (= (and b!476963 c!57368) b!476958))

(assert (= (and b!476963 (not c!57368)) b!476957))

(assert (= (and b!476957 c!57367) b!476955))

(assert (= (and b!476957 (not c!57367)) b!476962))

(assert (= (or b!476955 b!476962) bm!30722))

(assert (= (or b!476958 bm!30722) bm!30721))

(assert (= (or b!476960 bm!30721) bm!30723))

(assert (= (and bm!30723 c!57369) b!476956))

(assert (= (and bm!30723 (not c!57369)) b!476961))

(assert (= (and d!75843 res!284737) b!476954))

(assert (= (and b!476954 res!284736) b!476959))

(declare-fun m!458819 () Bool)

(assert (=> b!476959 m!458819))

(declare-fun m!458823 () Bool)

(assert (=> bm!30723 m!458823))

(declare-fun m!458825 () Bool)

(assert (=> b!476956 m!458825))

(declare-fun m!458827 () Bool)

(assert (=> d!75843 m!458827))

(assert (=> d!75843 m!458631))

(declare-fun m!458829 () Bool)

(assert (=> b!476954 m!458829))

(assert (=> d!75737 d!75843))

(declare-fun d!75851 () Bool)

(declare-fun res!284741 () Bool)

(declare-fun e!280226 () Bool)

(assert (=> d!75851 (=> res!284741 e!280226)))

(assert (=> d!75851 (= res!284741 ((_ is Nil!9095) (t!15153 (toList!3993 (+!1801 lm!215 lt!217108)))))))

(assert (=> d!75851 (= (forall!197 (t!15153 (toList!3993 (+!1801 lm!215 lt!217108))) p!166) e!280226)))

(declare-fun b!476973 () Bool)

(declare-fun e!280227 () Bool)

(assert (=> b!476973 (= e!280226 e!280227)))

(declare-fun res!284742 () Bool)

(assert (=> b!476973 (=> (not res!284742) (not e!280227))))

(assert (=> b!476973 (= res!284742 (dynLambda!947 p!166 (h!9950 (t!15153 (toList!3993 (+!1801 lm!215 lt!217108))))))))

(declare-fun b!476974 () Bool)

(assert (=> b!476974 (= e!280227 (forall!197 (t!15153 (t!15153 (toList!3993 (+!1801 lm!215 lt!217108)))) p!166))))

(assert (= (and d!75851 (not res!284741)) b!476973))

(assert (= (and b!476973 res!284742) b!476974))

(declare-fun b_lambda!10589 () Bool)

(assert (=> (not b_lambda!10589) (not b!476973)))

(declare-fun t!15211 () Bool)

(declare-fun tb!4069 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15211) tb!4069))

(declare-fun result!7637 () Bool)

(assert (=> tb!4069 (= result!7637 true)))

(assert (=> b!476973 t!15211))

(declare-fun b_and!20753 () Bool)

(assert (= b_and!20749 (and (=> t!15211 result!7637) b_and!20753)))

(declare-fun m!458833 () Bool)

(assert (=> b!476973 m!458833))

(declare-fun m!458835 () Bool)

(assert (=> b!476974 m!458835))

(assert (=> b!476717 d!75851))

(declare-fun d!75855 () Bool)

(assert (=> d!75855 (= (tail!129 (toList!3993 lm!215)) (t!15153 (toList!3993 lm!215)))))

(assert (=> d!75725 d!75855))

(declare-fun b!476975 () Bool)

(declare-fun e!280228 () Bool)

(declare-fun tp!42419 () Bool)

(assert (=> b!476975 (= e!280228 (and tp_is_empty!13525 tp!42419))))

(assert (=> b!476729 (= tp!42418 e!280228)))

(assert (= (and b!476729 ((_ is Cons!9094) (t!15153 (toList!3993 lm!215)))) b!476975))

(declare-fun b_lambda!10591 () Bool)

(assert (= b_lambda!10575 (or (and start!42850 b_free!12103) b_lambda!10591)))

(declare-fun b_lambda!10593 () Bool)

(assert (= b_lambda!10571 (or (and start!42850 b_free!12103) b_lambda!10593)))

(declare-fun b_lambda!10595 () Bool)

(assert (= b_lambda!10577 (or (and start!42850 b_free!12103) b_lambda!10595)))

(declare-fun b_lambda!10597 () Bool)

(assert (= b_lambda!10589 (or (and start!42850 b_free!12103) b_lambda!10597)))

(declare-fun b_lambda!10599 () Bool)

(assert (= b_lambda!10585 (or (and start!42850 b_free!12103) b_lambda!10599)))

(check-sat (not b!476943) (not d!75831) b_and!20753 (not b!476793) (not b!476952) (not b!476866) (not bm!30711) (not b!476871) (not d!75841) (not b!476959) (not b!476948) (not d!75783) (not b!476956) (not d!75801) (not b!476878) (not b!476868) (not b_lambda!10559) (not b_lambda!10505) (not b!476913) (not b!476975) (not b_lambda!10565) (not d!75829) (not d!75843) (not b!476953) (not b_lambda!10561) (not b_next!12103) (not b!476807) (not b!476914) (not b_lambda!10591) (not b!476893) (not b!476757) (not d!75833) (not bm!30723) (not b!476790) (not b_lambda!10563) (not b!476926) (not b!476808) (not b_lambda!10567) (not b!476974) (not b!476755) (not b_lambda!10593) (not b!476746) (not b!476915) (not d!75795) (not b!476941) (not b!476735) tp_is_empty!13525 (not b_lambda!10599) (not b!476788) (not d!75817) (not b!476954) (not b_lambda!10597) (not b_lambda!10595) (not b!476751) (not d!75835))
(check-sat b_and!20753 (not b_next!12103))
(get-model)

(declare-fun d!75897 () Bool)

(declare-fun res!284777 () Bool)

(declare-fun e!280280 () Bool)

(assert (=> d!75897 (=> res!284777 e!280280)))

(assert (=> d!75897 (= res!284777 ((_ is Nil!9095) (t!15153 (t!15153 (toList!3993 (+!1801 lt!217110 lt!217108))))))))

(assert (=> d!75897 (= (forall!197 (t!15153 (t!15153 (toList!3993 (+!1801 lt!217110 lt!217108)))) p!166) e!280280)))

(declare-fun b!477066 () Bool)

(declare-fun e!280281 () Bool)

(assert (=> b!477066 (= e!280280 e!280281)))

(declare-fun res!284778 () Bool)

(assert (=> b!477066 (=> (not res!284778) (not e!280281))))

(assert (=> b!477066 (= res!284778 (dynLambda!947 p!166 (h!9950 (t!15153 (t!15153 (toList!3993 (+!1801 lt!217110 lt!217108)))))))))

(declare-fun b!477067 () Bool)

(assert (=> b!477067 (= e!280281 (forall!197 (t!15153 (t!15153 (t!15153 (toList!3993 (+!1801 lt!217110 lt!217108))))) p!166))))

(assert (= (and d!75897 (not res!284777)) b!477066))

(assert (= (and b!477066 res!284778) b!477067))

(declare-fun b_lambda!10629 () Bool)

(assert (=> (not b_lambda!10629) (not b!477066)))

(declare-fun t!15221 () Bool)

(declare-fun tb!4079 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15221) tb!4079))

(declare-fun result!7647 () Bool)

(assert (=> tb!4079 (= result!7647 true)))

(assert (=> b!477066 t!15221))

(declare-fun b_and!20763 () Bool)

(assert (= b_and!20753 (and (=> t!15221 result!7647) b_and!20763)))

(declare-fun m!458945 () Bool)

(assert (=> b!477066 m!458945))

(declare-fun m!458947 () Bool)

(assert (=> b!477067 m!458947))

(assert (=> b!476751 d!75897))

(declare-fun d!75899 () Bool)

(declare-fun res!284783 () Bool)

(declare-fun e!280286 () Bool)

(assert (=> d!75899 (=> res!284783 e!280286)))

(assert (=> d!75899 (= res!284783 (and ((_ is Cons!9094) lt!217167) (= (_1!4537 (h!9950 lt!217167)) (_1!4537 lt!217108))))))

(assert (=> d!75899 (= (containsKey!346 lt!217167 (_1!4537 lt!217108)) e!280286)))

(declare-fun b!477072 () Bool)

(declare-fun e!280287 () Bool)

(assert (=> b!477072 (= e!280286 e!280287)))

(declare-fun res!284784 () Bool)

(assert (=> b!477072 (=> (not res!284784) (not e!280287))))

(assert (=> b!477072 (= res!284784 (and (or (not ((_ is Cons!9094) lt!217167)) (bvsle (_1!4537 (h!9950 lt!217167)) (_1!4537 lt!217108))) ((_ is Cons!9094) lt!217167) (bvslt (_1!4537 (h!9950 lt!217167)) (_1!4537 lt!217108))))))

(declare-fun b!477073 () Bool)

(assert (=> b!477073 (= e!280287 (containsKey!346 (t!15153 lt!217167) (_1!4537 lt!217108)))))

(assert (= (and d!75899 (not res!284783)) b!477072))

(assert (= (and b!477072 res!284784) b!477073))

(declare-fun m!458949 () Bool)

(assert (=> b!477073 m!458949))

(assert (=> b!476952 d!75899))

(declare-fun d!75901 () Bool)

(declare-fun lt!217282 () Bool)

(assert (=> d!75901 (= lt!217282 (select (content!209 (t!15153 (toList!3993 lt!217165))) lt!217108))))

(declare-fun e!280289 () Bool)

(assert (=> d!75901 (= lt!217282 e!280289)))

(declare-fun res!284785 () Bool)

(assert (=> d!75901 (=> (not res!284785) (not e!280289))))

(assert (=> d!75901 (= res!284785 ((_ is Cons!9094) (t!15153 (toList!3993 lt!217165))))))

(assert (=> d!75901 (= (contains!2562 (t!15153 (toList!3993 lt!217165)) lt!217108) lt!217282)))

(declare-fun b!477074 () Bool)

(declare-fun e!280288 () Bool)

(assert (=> b!477074 (= e!280289 e!280288)))

(declare-fun res!284786 () Bool)

(assert (=> b!477074 (=> res!284786 e!280288)))

(assert (=> b!477074 (= res!284786 (= (h!9950 (t!15153 (toList!3993 lt!217165))) lt!217108))))

(declare-fun b!477075 () Bool)

(assert (=> b!477075 (= e!280288 (contains!2562 (t!15153 (t!15153 (toList!3993 lt!217165))) lt!217108))))

(assert (= (and d!75901 res!284785) b!477074))

(assert (= (and b!477074 (not res!284786)) b!477075))

(declare-fun m!458951 () Bool)

(assert (=> d!75901 m!458951))

(declare-fun m!458953 () Bool)

(assert (=> d!75901 m!458953))

(declare-fun m!458955 () Bool)

(assert (=> b!477075 m!458955))

(assert (=> b!476893 d!75901))

(declare-fun d!75903 () Bool)

(declare-fun c!57401 () Bool)

(assert (=> d!75903 (= c!57401 ((_ is Nil!9095) (toList!3993 lt!217165)))))

(declare-fun e!280292 () (InoxSet tuple2!9052))

(assert (=> d!75903 (= (content!209 (toList!3993 lt!217165)) e!280292)))

(declare-fun b!477080 () Bool)

(assert (=> b!477080 (= e!280292 ((as const (Array tuple2!9052 Bool)) false))))

(declare-fun b!477081 () Bool)

(assert (=> b!477081 (= e!280292 ((_ map or) (store ((as const (Array tuple2!9052 Bool)) false) (h!9950 (toList!3993 lt!217165)) true) (content!209 (t!15153 (toList!3993 lt!217165)))))))

(assert (= (and d!75903 c!57401) b!477080))

(assert (= (and d!75903 (not c!57401)) b!477081))

(declare-fun m!458957 () Bool)

(assert (=> b!477081 m!458957))

(assert (=> b!477081 m!458951))

(assert (=> d!75817 d!75903))

(declare-fun d!75905 () Bool)

(declare-fun lt!217283 () Bool)

(assert (=> d!75905 (= lt!217283 (select (content!209 lt!217250) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(declare-fun e!280294 () Bool)

(assert (=> d!75905 (= lt!217283 e!280294)))

(declare-fun res!284787 () Bool)

(assert (=> d!75905 (=> (not res!284787) (not e!280294))))

(assert (=> d!75905 (= res!284787 ((_ is Cons!9094) lt!217250))))

(assert (=> d!75905 (= (contains!2562 lt!217250 (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))) lt!217283)))

(declare-fun b!477082 () Bool)

(declare-fun e!280293 () Bool)

(assert (=> b!477082 (= e!280294 e!280293)))

(declare-fun res!284788 () Bool)

(assert (=> b!477082 (=> res!284788 e!280293)))

(assert (=> b!477082 (= res!284788 (= (h!9950 lt!217250) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(declare-fun b!477083 () Bool)

(assert (=> b!477083 (= e!280293 (contains!2562 (t!15153 lt!217250) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(assert (= (and d!75905 res!284787) b!477082))

(assert (= (and b!477082 (not res!284788)) b!477083))

(declare-fun m!458959 () Bool)

(assert (=> d!75905 m!458959))

(declare-fun m!458961 () Bool)

(assert (=> d!75905 m!458961))

(declare-fun m!458963 () Bool)

(assert (=> b!477083 m!458963))

(assert (=> b!476959 d!75905))

(declare-fun d!75907 () Bool)

(declare-fun lt!217284 () Bool)

(assert (=> d!75907 (= lt!217284 (select (content!209 lt!217167) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(declare-fun e!280296 () Bool)

(assert (=> d!75907 (= lt!217284 e!280296)))

(declare-fun res!284789 () Bool)

(assert (=> d!75907 (=> (not res!284789) (not e!280296))))

(assert (=> d!75907 (= res!284789 ((_ is Cons!9094) lt!217167))))

(assert (=> d!75907 (= (contains!2562 lt!217167 (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))) lt!217284)))

(declare-fun b!477084 () Bool)

(declare-fun e!280295 () Bool)

(assert (=> b!477084 (= e!280296 e!280295)))

(declare-fun res!284790 () Bool)

(assert (=> b!477084 (=> res!284790 e!280295)))

(assert (=> b!477084 (= res!284790 (= (h!9950 lt!217167) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(declare-fun b!477085 () Bool)

(assert (=> b!477085 (= e!280295 (contains!2562 (t!15153 lt!217167) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(assert (= (and d!75907 res!284789) b!477084))

(assert (= (and b!477084 (not res!284790)) b!477085))

(declare-fun m!458965 () Bool)

(assert (=> d!75907 m!458965))

(declare-fun m!458967 () Bool)

(assert (=> d!75907 m!458967))

(declare-fun m!458969 () Bool)

(assert (=> b!477085 m!458969))

(assert (=> b!476953 d!75907))

(declare-fun d!75909 () Bool)

(declare-fun res!284791 () Bool)

(declare-fun e!280297 () Bool)

(assert (=> d!75909 (=> res!284791 e!280297)))

(assert (=> d!75909 (= res!284791 (and ((_ is Cons!9094) lt!217222) (= (_1!4537 (h!9950 lt!217222)) (_1!4537 lt!217108))))))

(assert (=> d!75909 (= (containsKey!346 lt!217222 (_1!4537 lt!217108)) e!280297)))

(declare-fun b!477086 () Bool)

(declare-fun e!280298 () Bool)

(assert (=> b!477086 (= e!280297 e!280298)))

(declare-fun res!284792 () Bool)

(assert (=> b!477086 (=> (not res!284792) (not e!280298))))

(assert (=> b!477086 (= res!284792 (and (or (not ((_ is Cons!9094) lt!217222)) (bvsle (_1!4537 (h!9950 lt!217222)) (_1!4537 lt!217108))) ((_ is Cons!9094) lt!217222) (bvslt (_1!4537 (h!9950 lt!217222)) (_1!4537 lt!217108))))))

(declare-fun b!477087 () Bool)

(assert (=> b!477087 (= e!280298 (containsKey!346 (t!15153 lt!217222) (_1!4537 lt!217108)))))

(assert (= (and d!75909 (not res!284791)) b!477086))

(assert (= (and b!477086 res!284792) b!477087))

(declare-fun m!458971 () Bool)

(assert (=> b!477087 m!458971))

(assert (=> b!476866 d!75909))

(declare-fun b!477088 () Bool)

(declare-fun e!280299 () Option!391)

(assert (=> b!477088 (= e!280299 (Some!390 (_2!4537 (h!9950 (t!15153 (toList!3993 lt!217161))))))))

(declare-fun d!75911 () Bool)

(declare-fun c!57402 () Bool)

(assert (=> d!75911 (= c!57402 (and ((_ is Cons!9094) (t!15153 (toList!3993 lt!217161))) (= (_1!4537 (h!9950 (t!15153 (toList!3993 lt!217161)))) (_1!4537 lt!217108))))))

(assert (=> d!75911 (= (getValueByKey!385 (t!15153 (toList!3993 lt!217161)) (_1!4537 lt!217108)) e!280299)))

(declare-fun b!477089 () Bool)

(declare-fun e!280300 () Option!391)

(assert (=> b!477089 (= e!280299 e!280300)))

(declare-fun c!57403 () Bool)

(assert (=> b!477089 (= c!57403 (and ((_ is Cons!9094) (t!15153 (toList!3993 lt!217161))) (not (= (_1!4537 (h!9950 (t!15153 (toList!3993 lt!217161)))) (_1!4537 lt!217108)))))))

(declare-fun b!477091 () Bool)

(assert (=> b!477091 (= e!280300 None!389)))

(declare-fun b!477090 () Bool)

(assert (=> b!477090 (= e!280300 (getValueByKey!385 (t!15153 (t!15153 (toList!3993 lt!217161))) (_1!4537 lt!217108)))))

(assert (= (and d!75911 c!57402) b!477088))

(assert (= (and d!75911 (not c!57402)) b!477089))

(assert (= (and b!477089 c!57403) b!477090))

(assert (= (and b!477089 (not c!57403)) b!477091))

(declare-fun m!458973 () Bool)

(assert (=> b!477090 m!458973))

(assert (=> b!476746 d!75911))

(declare-fun d!75913 () Bool)

(assert (=> d!75913 (= ($colon$colon!109 e!280219 (ite c!57366 (h!9950 (toList!3993 lm!215)) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108)))) (Cons!9094 (ite c!57366 (h!9950 (toList!3993 lm!215)) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))) e!280219))))

(assert (=> bm!30723 d!75913))

(declare-fun b!477092 () Bool)

(declare-fun res!284793 () Bool)

(declare-fun e!280301 () Bool)

(assert (=> b!477092 (=> (not res!284793) (not e!280301))))

(declare-fun lt!217285 () List!9098)

(assert (=> b!477092 (= res!284793 (containsKey!346 lt!217285 (_1!4537 lt!217108)))))

(declare-fun b!477093 () Bool)

(declare-fun e!280302 () List!9098)

(declare-fun call!30742 () List!9098)

(assert (=> b!477093 (= e!280302 call!30742)))

(declare-fun b!477094 () Bool)

(declare-fun e!280304 () List!9098)

(assert (=> b!477094 (= e!280304 (insertStrictlySorted!213 (t!15153 (t!15153 (toList!3993 lt!217110))) (_1!4537 lt!217108) (_2!4537 lt!217108)))))

(declare-fun bm!30739 () Bool)

(declare-fun call!30743 () List!9098)

(declare-fun call!30744 () List!9098)

(assert (=> bm!30739 (= call!30743 call!30744)))

(declare-fun b!477095 () Bool)

(declare-fun c!57405 () Bool)

(assert (=> b!477095 (= c!57405 (and ((_ is Cons!9094) (t!15153 (toList!3993 lt!217110))) (bvsgt (_1!4537 (h!9950 (t!15153 (toList!3993 lt!217110)))) (_1!4537 lt!217108))))))

(declare-fun e!280305 () List!9098)

(assert (=> b!477095 (= e!280305 e!280302)))

(declare-fun bm!30740 () Bool)

(assert (=> bm!30740 (= call!30742 call!30743)))

(declare-fun b!477096 () Bool)

(assert (=> b!477096 (= e!280305 call!30743)))

(declare-fun b!477097 () Bool)

(assert (=> b!477097 (= e!280301 (contains!2562 lt!217285 (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(declare-fun c!57404 () Bool)

(declare-fun bm!30741 () Bool)

(assert (=> bm!30741 (= call!30744 ($colon$colon!109 e!280304 (ite c!57404 (h!9950 (t!15153 (toList!3993 lt!217110))) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108)))))))

(declare-fun c!57407 () Bool)

(assert (=> bm!30741 (= c!57407 c!57404)))

(declare-fun d!75915 () Bool)

(assert (=> d!75915 e!280301))

(declare-fun res!284794 () Bool)

(assert (=> d!75915 (=> (not res!284794) (not e!280301))))

(assert (=> d!75915 (= res!284794 (isStrictlySorted!384 lt!217285))))

(declare-fun e!280303 () List!9098)

(assert (=> d!75915 (= lt!217285 e!280303)))

(assert (=> d!75915 (= c!57404 (and ((_ is Cons!9094) (t!15153 (toList!3993 lt!217110))) (bvslt (_1!4537 (h!9950 (t!15153 (toList!3993 lt!217110)))) (_1!4537 lt!217108))))))

(assert (=> d!75915 (isStrictlySorted!384 (t!15153 (toList!3993 lt!217110)))))

(assert (=> d!75915 (= (insertStrictlySorted!213 (t!15153 (toList!3993 lt!217110)) (_1!4537 lt!217108) (_2!4537 lt!217108)) lt!217285)))

(declare-fun b!477098 () Bool)

(assert (=> b!477098 (= e!280303 call!30744)))

(declare-fun b!477099 () Bool)

(declare-fun c!57406 () Bool)

(assert (=> b!477099 (= e!280304 (ite c!57406 (t!15153 (t!15153 (toList!3993 lt!217110))) (ite c!57405 (Cons!9094 (h!9950 (t!15153 (toList!3993 lt!217110))) (t!15153 (t!15153 (toList!3993 lt!217110)))) Nil!9095)))))

(declare-fun b!477100 () Bool)

(assert (=> b!477100 (= e!280302 call!30742)))

(declare-fun b!477101 () Bool)

(assert (=> b!477101 (= e!280303 e!280305)))

(assert (=> b!477101 (= c!57406 (and ((_ is Cons!9094) (t!15153 (toList!3993 lt!217110))) (= (_1!4537 (h!9950 (t!15153 (toList!3993 lt!217110)))) (_1!4537 lt!217108))))))

(assert (= (and d!75915 c!57404) b!477098))

(assert (= (and d!75915 (not c!57404)) b!477101))

(assert (= (and b!477101 c!57406) b!477096))

(assert (= (and b!477101 (not c!57406)) b!477095))

(assert (= (and b!477095 c!57405) b!477093))

(assert (= (and b!477095 (not c!57405)) b!477100))

(assert (= (or b!477093 b!477100) bm!30740))

(assert (= (or b!477096 bm!30740) bm!30739))

(assert (= (or b!477098 bm!30739) bm!30741))

(assert (= (and bm!30741 c!57407) b!477094))

(assert (= (and bm!30741 (not c!57407)) b!477099))

(assert (= (and d!75915 res!284794) b!477092))

(assert (= (and b!477092 res!284793) b!477097))

(declare-fun m!458975 () Bool)

(assert (=> b!477097 m!458975))

(declare-fun m!458977 () Bool)

(assert (=> bm!30741 m!458977))

(declare-fun m!458979 () Bool)

(assert (=> b!477094 m!458979))

(declare-fun m!458981 () Bool)

(assert (=> d!75915 m!458981))

(declare-fun m!458983 () Bool)

(assert (=> d!75915 m!458983))

(declare-fun m!458985 () Bool)

(assert (=> b!477092 m!458985))

(assert (=> b!476868 d!75915))

(declare-fun d!75917 () Bool)

(declare-fun res!284795 () Bool)

(declare-fun e!280306 () Bool)

(assert (=> d!75917 (=> res!284795 e!280306)))

(assert (=> d!75917 (= res!284795 ((_ is Nil!9095) (t!15153 (t!15153 (toList!3993 lt!217110)))))))

(assert (=> d!75917 (= (forall!197 (t!15153 (t!15153 (toList!3993 lt!217110))) p!166) e!280306)))

(declare-fun b!477102 () Bool)

(declare-fun e!280307 () Bool)

(assert (=> b!477102 (= e!280306 e!280307)))

(declare-fun res!284796 () Bool)

(assert (=> b!477102 (=> (not res!284796) (not e!280307))))

(assert (=> b!477102 (= res!284796 (dynLambda!947 p!166 (h!9950 (t!15153 (t!15153 (toList!3993 lt!217110))))))))

(declare-fun b!477103 () Bool)

(assert (=> b!477103 (= e!280307 (forall!197 (t!15153 (t!15153 (t!15153 (toList!3993 lt!217110)))) p!166))))

(assert (= (and d!75917 (not res!284795)) b!477102))

(assert (= (and b!477102 res!284796) b!477103))

(declare-fun b_lambda!10631 () Bool)

(assert (=> (not b_lambda!10631) (not b!477102)))

(declare-fun t!15224 () Bool)

(declare-fun tb!4081 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15224) tb!4081))

(declare-fun result!7649 () Bool)

(assert (=> tb!4081 (= result!7649 true)))

(assert (=> b!477102 t!15224))

(declare-fun b_and!20765 () Bool)

(assert (= b_and!20763 (and (=> t!15224 result!7649) b_and!20765)))

(declare-fun m!458987 () Bool)

(assert (=> b!477102 m!458987))

(declare-fun m!458989 () Bool)

(assert (=> b!477103 m!458989))

(assert (=> b!476755 d!75917))

(declare-fun d!75919 () Bool)

(declare-fun res!284797 () Bool)

(declare-fun e!280308 () Bool)

(assert (=> d!75919 (=> res!284797 e!280308)))

(assert (=> d!75919 (= res!284797 (and ((_ is Cons!9094) (toList!3993 lt!217165)) (= (_1!4537 (h!9950 (toList!3993 lt!217165))) (_1!4537 lt!217108))))))

(assert (=> d!75919 (= (containsKey!346 (toList!3993 lt!217165) (_1!4537 lt!217108)) e!280308)))

(declare-fun b!477104 () Bool)

(declare-fun e!280309 () Bool)

(assert (=> b!477104 (= e!280308 e!280309)))

(declare-fun res!284798 () Bool)

(assert (=> b!477104 (=> (not res!284798) (not e!280309))))

(assert (=> b!477104 (= res!284798 (and (or (not ((_ is Cons!9094) (toList!3993 lt!217165))) (bvsle (_1!4537 (h!9950 (toList!3993 lt!217165))) (_1!4537 lt!217108))) ((_ is Cons!9094) (toList!3993 lt!217165)) (bvslt (_1!4537 (h!9950 (toList!3993 lt!217165))) (_1!4537 lt!217108))))))

(declare-fun b!477105 () Bool)

(assert (=> b!477105 (= e!280309 (containsKey!346 (t!15153 (toList!3993 lt!217165)) (_1!4537 lt!217108)))))

(assert (= (and d!75919 (not res!284797)) b!477104))

(assert (= (and b!477104 res!284798) b!477105))

(declare-fun m!458991 () Bool)

(assert (=> b!477105 m!458991))

(assert (=> d!75835 d!75919))

(declare-fun d!75921 () Bool)

(declare-fun c!57408 () Bool)

(assert (=> d!75921 (= c!57408 ((_ is Nil!9095) (toList!3993 lt!217161)))))

(declare-fun e!280310 () (InoxSet tuple2!9052))

(assert (=> d!75921 (= (content!209 (toList!3993 lt!217161)) e!280310)))

(declare-fun b!477106 () Bool)

(assert (=> b!477106 (= e!280310 ((as const (Array tuple2!9052 Bool)) false))))

(declare-fun b!477107 () Bool)

(assert (=> b!477107 (= e!280310 ((_ map or) (store ((as const (Array tuple2!9052 Bool)) false) (h!9950 (toList!3993 lt!217161)) true) (content!209 (t!15153 (toList!3993 lt!217161)))))))

(assert (= (and d!75921 c!57408) b!477106))

(assert (= (and d!75921 (not c!57408)) b!477107))

(declare-fun m!458993 () Bool)

(assert (=> b!477107 m!458993))

(declare-fun m!458995 () Bool)

(assert (=> b!477107 m!458995))

(assert (=> d!75833 d!75921))

(declare-fun d!75923 () Bool)

(declare-fun e!280311 () Bool)

(assert (=> d!75923 e!280311))

(declare-fun res!284799 () Bool)

(assert (=> d!75923 (=> res!284799 e!280311)))

(declare-fun lt!217287 () Bool)

(assert (=> d!75923 (= res!284799 (not lt!217287))))

(declare-fun lt!217288 () Bool)

(assert (=> d!75923 (= lt!217287 lt!217288)))

(declare-fun lt!217289 () Unit!14014)

(declare-fun e!280312 () Unit!14014)

(assert (=> d!75923 (= lt!217289 e!280312)))

(declare-fun c!57409 () Bool)

(assert (=> d!75923 (= c!57409 lt!217288)))

(assert (=> d!75923 (= lt!217288 (containsKey!346 (toList!3993 lt!217231) (_1!4537 (tuple2!9053 a!501 b!85))))))

(assert (=> d!75923 (= (contains!2561 lt!217231 (_1!4537 (tuple2!9053 a!501 b!85))) lt!217287)))

(declare-fun b!477108 () Bool)

(declare-fun lt!217286 () Unit!14014)

(assert (=> b!477108 (= e!280312 lt!217286)))

(assert (=> b!477108 (= lt!217286 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3993 lt!217231) (_1!4537 (tuple2!9053 a!501 b!85))))))

(assert (=> b!477108 (isDefined!296 (getValueByKey!385 (toList!3993 lt!217231) (_1!4537 (tuple2!9053 a!501 b!85))))))

(declare-fun b!477109 () Bool)

(declare-fun Unit!14026 () Unit!14014)

(assert (=> b!477109 (= e!280312 Unit!14026)))

(declare-fun b!477110 () Bool)

(assert (=> b!477110 (= e!280311 (isDefined!296 (getValueByKey!385 (toList!3993 lt!217231) (_1!4537 (tuple2!9053 a!501 b!85)))))))

(assert (= (and d!75923 c!57409) b!477108))

(assert (= (and d!75923 (not c!57409)) b!477109))

(assert (= (and d!75923 (not res!284799)) b!477110))

(declare-fun m!458997 () Bool)

(assert (=> d!75923 m!458997))

(declare-fun m!458999 () Bool)

(assert (=> b!477108 m!458999))

(assert (=> b!477108 m!458763))

(assert (=> b!477108 m!458763))

(declare-fun m!459001 () Bool)

(assert (=> b!477108 m!459001))

(assert (=> b!477110 m!458763))

(assert (=> b!477110 m!458763))

(assert (=> b!477110 m!459001))

(assert (=> d!75829 d!75923))

(declare-fun b!477111 () Bool)

(declare-fun e!280313 () Option!391)

(assert (=> b!477111 (= e!280313 (Some!390 (_2!4537 (h!9950 lt!217233))))))

(declare-fun c!57410 () Bool)

(declare-fun d!75925 () Bool)

(assert (=> d!75925 (= c!57410 (and ((_ is Cons!9094) lt!217233) (= (_1!4537 (h!9950 lt!217233)) (_1!4537 (tuple2!9053 a!501 b!85)))))))

(assert (=> d!75925 (= (getValueByKey!385 lt!217233 (_1!4537 (tuple2!9053 a!501 b!85))) e!280313)))

(declare-fun b!477112 () Bool)

(declare-fun e!280314 () Option!391)

(assert (=> b!477112 (= e!280313 e!280314)))

(declare-fun c!57411 () Bool)

(assert (=> b!477112 (= c!57411 (and ((_ is Cons!9094) lt!217233) (not (= (_1!4537 (h!9950 lt!217233)) (_1!4537 (tuple2!9053 a!501 b!85))))))))

(declare-fun b!477114 () Bool)

(assert (=> b!477114 (= e!280314 None!389)))

(declare-fun b!477113 () Bool)

(assert (=> b!477113 (= e!280314 (getValueByKey!385 (t!15153 lt!217233) (_1!4537 (tuple2!9053 a!501 b!85))))))

(assert (= (and d!75925 c!57410) b!477111))

(assert (= (and d!75925 (not c!57410)) b!477112))

(assert (= (and b!477112 c!57411) b!477113))

(assert (= (and b!477112 (not c!57411)) b!477114))

(declare-fun m!459003 () Bool)

(assert (=> b!477113 m!459003))

(assert (=> d!75829 d!75925))

(declare-fun d!75927 () Bool)

(assert (=> d!75927 (= (getValueByKey!385 lt!217233 (_1!4537 (tuple2!9053 a!501 b!85))) (Some!390 (_2!4537 (tuple2!9053 a!501 b!85))))))

(declare-fun lt!217290 () Unit!14014)

(assert (=> d!75927 (= lt!217290 (choose!1371 lt!217233 (_1!4537 (tuple2!9053 a!501 b!85)) (_2!4537 (tuple2!9053 a!501 b!85))))))

(declare-fun e!280315 () Bool)

(assert (=> d!75927 e!280315))

(declare-fun res!284800 () Bool)

(assert (=> d!75927 (=> (not res!284800) (not e!280315))))

(assert (=> d!75927 (= res!284800 (isStrictlySorted!384 lt!217233))))

(assert (=> d!75927 (= (lemmaContainsTupThenGetReturnValue!210 lt!217233 (_1!4537 (tuple2!9053 a!501 b!85)) (_2!4537 (tuple2!9053 a!501 b!85))) lt!217290)))

(declare-fun b!477115 () Bool)

(declare-fun res!284801 () Bool)

(assert (=> b!477115 (=> (not res!284801) (not e!280315))))

(assert (=> b!477115 (= res!284801 (containsKey!346 lt!217233 (_1!4537 (tuple2!9053 a!501 b!85))))))

(declare-fun b!477116 () Bool)

(assert (=> b!477116 (= e!280315 (contains!2562 lt!217233 (tuple2!9053 (_1!4537 (tuple2!9053 a!501 b!85)) (_2!4537 (tuple2!9053 a!501 b!85)))))))

(assert (= (and d!75927 res!284800) b!477115))

(assert (= (and b!477115 res!284801) b!477116))

(assert (=> d!75927 m!458757))

(declare-fun m!459005 () Bool)

(assert (=> d!75927 m!459005))

(declare-fun m!459007 () Bool)

(assert (=> d!75927 m!459007))

(declare-fun m!459009 () Bool)

(assert (=> b!477115 m!459009))

(declare-fun m!459011 () Bool)

(assert (=> b!477116 m!459011))

(assert (=> d!75829 d!75927))

(declare-fun b!477117 () Bool)

(declare-fun res!284802 () Bool)

(declare-fun e!280316 () Bool)

(assert (=> b!477117 (=> (not res!284802) (not e!280316))))

(declare-fun lt!217291 () List!9098)

(assert (=> b!477117 (= res!284802 (containsKey!346 lt!217291 (_1!4537 (tuple2!9053 a!501 b!85))))))

(declare-fun b!477118 () Bool)

(declare-fun e!280317 () List!9098)

(declare-fun call!30745 () List!9098)

(assert (=> b!477118 (= e!280317 call!30745)))

(declare-fun b!477119 () Bool)

(declare-fun e!280319 () List!9098)

(assert (=> b!477119 (= e!280319 (insertStrictlySorted!213 (t!15153 (toList!3993 lt!217110)) (_1!4537 (tuple2!9053 a!501 b!85)) (_2!4537 (tuple2!9053 a!501 b!85))))))

(declare-fun bm!30742 () Bool)

(declare-fun call!30746 () List!9098)

(declare-fun call!30747 () List!9098)

(assert (=> bm!30742 (= call!30746 call!30747)))

(declare-fun b!477120 () Bool)

(declare-fun c!57413 () Bool)

(assert (=> b!477120 (= c!57413 (and ((_ is Cons!9094) (toList!3993 lt!217110)) (bvsgt (_1!4537 (h!9950 (toList!3993 lt!217110))) (_1!4537 (tuple2!9053 a!501 b!85)))))))

(declare-fun e!280320 () List!9098)

(assert (=> b!477120 (= e!280320 e!280317)))

(declare-fun bm!30743 () Bool)

(assert (=> bm!30743 (= call!30745 call!30746)))

(declare-fun b!477121 () Bool)

(assert (=> b!477121 (= e!280320 call!30746)))

(declare-fun b!477122 () Bool)

(assert (=> b!477122 (= e!280316 (contains!2562 lt!217291 (tuple2!9053 (_1!4537 (tuple2!9053 a!501 b!85)) (_2!4537 (tuple2!9053 a!501 b!85)))))))

(declare-fun c!57412 () Bool)

(declare-fun bm!30744 () Bool)

(assert (=> bm!30744 (= call!30747 ($colon$colon!109 e!280319 (ite c!57412 (h!9950 (toList!3993 lt!217110)) (tuple2!9053 (_1!4537 (tuple2!9053 a!501 b!85)) (_2!4537 (tuple2!9053 a!501 b!85))))))))

(declare-fun c!57415 () Bool)

(assert (=> bm!30744 (= c!57415 c!57412)))

(declare-fun d!75929 () Bool)

(assert (=> d!75929 e!280316))

(declare-fun res!284803 () Bool)

(assert (=> d!75929 (=> (not res!284803) (not e!280316))))

(assert (=> d!75929 (= res!284803 (isStrictlySorted!384 lt!217291))))

(declare-fun e!280318 () List!9098)

(assert (=> d!75929 (= lt!217291 e!280318)))

(assert (=> d!75929 (= c!57412 (and ((_ is Cons!9094) (toList!3993 lt!217110)) (bvslt (_1!4537 (h!9950 (toList!3993 lt!217110))) (_1!4537 (tuple2!9053 a!501 b!85)))))))

(assert (=> d!75929 (isStrictlySorted!384 (toList!3993 lt!217110))))

(assert (=> d!75929 (= (insertStrictlySorted!213 (toList!3993 lt!217110) (_1!4537 (tuple2!9053 a!501 b!85)) (_2!4537 (tuple2!9053 a!501 b!85))) lt!217291)))

(declare-fun b!477123 () Bool)

(assert (=> b!477123 (= e!280318 call!30747)))

(declare-fun c!57414 () Bool)

(declare-fun b!477124 () Bool)

(assert (=> b!477124 (= e!280319 (ite c!57414 (t!15153 (toList!3993 lt!217110)) (ite c!57413 (Cons!9094 (h!9950 (toList!3993 lt!217110)) (t!15153 (toList!3993 lt!217110))) Nil!9095)))))

(declare-fun b!477125 () Bool)

(assert (=> b!477125 (= e!280317 call!30745)))

(declare-fun b!477126 () Bool)

(assert (=> b!477126 (= e!280318 e!280320)))

(assert (=> b!477126 (= c!57414 (and ((_ is Cons!9094) (toList!3993 lt!217110)) (= (_1!4537 (h!9950 (toList!3993 lt!217110))) (_1!4537 (tuple2!9053 a!501 b!85)))))))

(assert (= (and d!75929 c!57412) b!477123))

(assert (= (and d!75929 (not c!57412)) b!477126))

(assert (= (and b!477126 c!57414) b!477121))

(assert (= (and b!477126 (not c!57414)) b!477120))

(assert (= (and b!477120 c!57413) b!477118))

(assert (= (and b!477120 (not c!57413)) b!477125))

(assert (= (or b!477118 b!477125) bm!30743))

(assert (= (or b!477121 bm!30743) bm!30742))

(assert (= (or b!477123 bm!30742) bm!30744))

(assert (= (and bm!30744 c!57415) b!477119))

(assert (= (and bm!30744 (not c!57415)) b!477124))

(assert (= (and d!75929 res!284803) b!477117))

(assert (= (and b!477117 res!284802) b!477122))

(declare-fun m!459013 () Bool)

(assert (=> b!477122 m!459013))

(declare-fun m!459015 () Bool)

(assert (=> bm!30744 m!459015))

(declare-fun m!459017 () Bool)

(assert (=> b!477119 m!459017))

(declare-fun m!459019 () Bool)

(assert (=> d!75929 m!459019))

(assert (=> d!75929 m!458723))

(declare-fun m!459021 () Bool)

(assert (=> b!477117 m!459021))

(assert (=> d!75829 d!75929))

(declare-fun d!75931 () Bool)

(declare-fun lt!217292 () Bool)

(assert (=> d!75931 (= lt!217292 (select (content!209 lt!217222) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(declare-fun e!280322 () Bool)

(assert (=> d!75931 (= lt!217292 e!280322)))

(declare-fun res!284804 () Bool)

(assert (=> d!75931 (=> (not res!284804) (not e!280322))))

(assert (=> d!75931 (= res!284804 ((_ is Cons!9094) lt!217222))))

(assert (=> d!75931 (= (contains!2562 lt!217222 (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))) lt!217292)))

(declare-fun b!477127 () Bool)

(declare-fun e!280321 () Bool)

(assert (=> b!477127 (= e!280322 e!280321)))

(declare-fun res!284805 () Bool)

(assert (=> b!477127 (=> res!284805 e!280321)))

(assert (=> b!477127 (= res!284805 (= (h!9950 lt!217222) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(declare-fun b!477128 () Bool)

(assert (=> b!477128 (= e!280321 (contains!2562 (t!15153 lt!217222) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(assert (= (and d!75931 res!284804) b!477127))

(assert (= (and b!477127 (not res!284805)) b!477128))

(declare-fun m!459023 () Bool)

(assert (=> d!75931 m!459023))

(declare-fun m!459025 () Bool)

(assert (=> d!75931 m!459025))

(declare-fun m!459027 () Bool)

(assert (=> b!477128 m!459027))

(assert (=> b!476871 d!75931))

(declare-fun b!477129 () Bool)

(declare-fun e!280323 () Option!391)

(assert (=> b!477129 (= e!280323 (Some!390 (_2!4537 (h!9950 (t!15153 lt!217163)))))))

(declare-fun d!75933 () Bool)

(declare-fun c!57416 () Bool)

(assert (=> d!75933 (= c!57416 (and ((_ is Cons!9094) (t!15153 lt!217163)) (= (_1!4537 (h!9950 (t!15153 lt!217163))) (_1!4537 lt!217108))))))

(assert (=> d!75933 (= (getValueByKey!385 (t!15153 lt!217163) (_1!4537 lt!217108)) e!280323)))

(declare-fun b!477130 () Bool)

(declare-fun e!280324 () Option!391)

(assert (=> b!477130 (= e!280323 e!280324)))

(declare-fun c!57417 () Bool)

(assert (=> b!477130 (= c!57417 (and ((_ is Cons!9094) (t!15153 lt!217163)) (not (= (_1!4537 (h!9950 (t!15153 lt!217163))) (_1!4537 lt!217108)))))))

(declare-fun b!477132 () Bool)

(assert (=> b!477132 (= e!280324 None!389)))

(declare-fun b!477131 () Bool)

(assert (=> b!477131 (= e!280324 (getValueByKey!385 (t!15153 (t!15153 lt!217163)) (_1!4537 lt!217108)))))

(assert (= (and d!75933 c!57416) b!477129))

(assert (= (and d!75933 (not c!57416)) b!477130))

(assert (= (and b!477130 c!57417) b!477131))

(assert (= (and b!477130 (not c!57417)) b!477132))

(declare-fun m!459029 () Bool)

(assert (=> b!477131 m!459029))

(assert (=> b!476793 d!75933))

(declare-fun d!75935 () Bool)

(declare-fun res!284806 () Bool)

(declare-fun e!280325 () Bool)

(assert (=> d!75935 (=> res!284806 e!280325)))

(assert (=> d!75935 (= res!284806 (or ((_ is Nil!9095) lt!217222) ((_ is Nil!9095) (t!15153 lt!217222))))))

(assert (=> d!75935 (= (isStrictlySorted!384 lt!217222) e!280325)))

(declare-fun b!477133 () Bool)

(declare-fun e!280326 () Bool)

(assert (=> b!477133 (= e!280325 e!280326)))

(declare-fun res!284807 () Bool)

(assert (=> b!477133 (=> (not res!284807) (not e!280326))))

(assert (=> b!477133 (= res!284807 (bvslt (_1!4537 (h!9950 lt!217222)) (_1!4537 (h!9950 (t!15153 lt!217222)))))))

(declare-fun b!477134 () Bool)

(assert (=> b!477134 (= e!280326 (isStrictlySorted!384 (t!15153 lt!217222)))))

(assert (= (and d!75935 (not res!284806)) b!477133))

(assert (= (and b!477133 res!284807) b!477134))

(declare-fun m!459031 () Bool)

(assert (=> b!477134 m!459031))

(assert (=> d!75801 d!75935))

(declare-fun d!75937 () Bool)

(declare-fun res!284808 () Bool)

(declare-fun e!280327 () Bool)

(assert (=> d!75937 (=> res!284808 e!280327)))

(assert (=> d!75937 (= res!284808 (or ((_ is Nil!9095) (toList!3993 lt!217110)) ((_ is Nil!9095) (t!15153 (toList!3993 lt!217110)))))))

(assert (=> d!75937 (= (isStrictlySorted!384 (toList!3993 lt!217110)) e!280327)))

(declare-fun b!477135 () Bool)

(declare-fun e!280328 () Bool)

(assert (=> b!477135 (= e!280327 e!280328)))

(declare-fun res!284809 () Bool)

(assert (=> b!477135 (=> (not res!284809) (not e!280328))))

(assert (=> b!477135 (= res!284809 (bvslt (_1!4537 (h!9950 (toList!3993 lt!217110))) (_1!4537 (h!9950 (t!15153 (toList!3993 lt!217110))))))))

(declare-fun b!477136 () Bool)

(assert (=> b!477136 (= e!280328 (isStrictlySorted!384 (t!15153 (toList!3993 lt!217110))))))

(assert (= (and d!75937 (not res!284808)) b!477135))

(assert (= (and b!477135 res!284809) b!477136))

(assert (=> b!477136 m!458983))

(assert (=> d!75801 d!75937))

(declare-fun d!75939 () Bool)

(assert (=> d!75939 (= ($colon$colon!109 e!280163 (ite c!57341 (h!9950 (toList!3993 lt!217110)) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108)))) (Cons!9094 (ite c!57341 (h!9950 (toList!3993 lt!217110)) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))) e!280163))))

(assert (=> bm!30711 d!75939))

(declare-fun d!75941 () Bool)

(assert (=> d!75941 (isDefined!296 (getValueByKey!385 (toList!3993 lt!217161) (_1!4537 lt!217108)))))

(declare-fun lt!217295 () Unit!14014)

(declare-fun choose!1375 (List!9098 (_ BitVec 64)) Unit!14014)

(assert (=> d!75941 (= lt!217295 (choose!1375 (toList!3993 lt!217161) (_1!4537 lt!217108)))))

(declare-fun e!280333 () Bool)

(assert (=> d!75941 e!280333))

(declare-fun res!284812 () Bool)

(assert (=> d!75941 (=> (not res!284812) (not e!280333))))

(assert (=> d!75941 (= res!284812 (isStrictlySorted!384 (toList!3993 lt!217161)))))

(assert (=> d!75941 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3993 lt!217161) (_1!4537 lt!217108)) lt!217295)))

(declare-fun b!477143 () Bool)

(assert (=> b!477143 (= e!280333 (containsKey!346 (toList!3993 lt!217161) (_1!4537 lt!217108)))))

(assert (= (and d!75941 res!284812) b!477143))

(assert (=> d!75941 m!458537))

(assert (=> d!75941 m!458537))

(assert (=> d!75941 m!458671))

(declare-fun m!459035 () Bool)

(assert (=> d!75941 m!459035))

(declare-fun m!459037 () Bool)

(assert (=> d!75941 m!459037))

(assert (=> b!477143 m!458667))

(assert (=> b!476788 d!75941))

(declare-fun d!75947 () Bool)

(declare-fun isEmpty!612 (Option!391) Bool)

(assert (=> d!75947 (= (isDefined!296 (getValueByKey!385 (toList!3993 lt!217161) (_1!4537 lt!217108))) (not (isEmpty!612 (getValueByKey!385 (toList!3993 lt!217161) (_1!4537 lt!217108)))))))

(declare-fun bs!15141 () Bool)

(assert (= bs!15141 d!75947))

(assert (=> bs!15141 m!458537))

(declare-fun m!459039 () Bool)

(assert (=> bs!15141 m!459039))

(assert (=> b!476788 d!75947))

(assert (=> b!476788 d!75769))

(assert (=> d!75841 d!75837))

(declare-fun d!75949 () Bool)

(assert (=> d!75949 (= (getValueByKey!385 lt!217167 (_1!4537 lt!217108)) (Some!390 (_2!4537 lt!217108)))))

(assert (=> d!75949 true))

(declare-fun _$22!547 () Unit!14014)

(assert (=> d!75949 (= (choose!1371 lt!217167 (_1!4537 lt!217108) (_2!4537 lt!217108)) _$22!547)))

(declare-fun bs!15142 () Bool)

(assert (= bs!15142 d!75949))

(assert (=> bs!15142 m!458543))

(assert (=> d!75841 d!75949))

(declare-fun d!75953 () Bool)

(declare-fun res!284821 () Bool)

(declare-fun e!280342 () Bool)

(assert (=> d!75953 (=> res!284821 e!280342)))

(assert (=> d!75953 (= res!284821 (or ((_ is Nil!9095) lt!217167) ((_ is Nil!9095) (t!15153 lt!217167))))))

(assert (=> d!75953 (= (isStrictlySorted!384 lt!217167) e!280342)))

(declare-fun b!477152 () Bool)

(declare-fun e!280343 () Bool)

(assert (=> b!477152 (= e!280342 e!280343)))

(declare-fun res!284822 () Bool)

(assert (=> b!477152 (=> (not res!284822) (not e!280343))))

(assert (=> b!477152 (= res!284822 (bvslt (_1!4537 (h!9950 lt!217167)) (_1!4537 (h!9950 (t!15153 lt!217167)))))))

(declare-fun b!477153 () Bool)

(assert (=> b!477153 (= e!280343 (isStrictlySorted!384 (t!15153 lt!217167)))))

(assert (= (and d!75953 (not res!284821)) b!477152))

(assert (= (and b!477152 res!284822) b!477153))

(declare-fun m!459045 () Bool)

(assert (=> b!477153 m!459045))

(assert (=> d!75841 d!75953))

(assert (=> d!75795 d!75793))

(declare-fun d!75957 () Bool)

(assert (=> d!75957 (= (getValueByKey!385 lt!217163 (_1!4537 lt!217108)) (Some!390 (_2!4537 lt!217108)))))

(assert (=> d!75957 true))

(declare-fun _$22!548 () Unit!14014)

(assert (=> d!75957 (= (choose!1371 lt!217163 (_1!4537 lt!217108) (_2!4537 lt!217108)) _$22!548)))

(declare-fun bs!15143 () Bool)

(assert (= bs!15143 d!75957))

(assert (=> bs!15143 m!458531))

(assert (=> d!75795 d!75957))

(declare-fun d!75959 () Bool)

(declare-fun res!284825 () Bool)

(declare-fun e!280346 () Bool)

(assert (=> d!75959 (=> res!284825 e!280346)))

(assert (=> d!75959 (= res!284825 (or ((_ is Nil!9095) lt!217163) ((_ is Nil!9095) (t!15153 lt!217163))))))

(assert (=> d!75959 (= (isStrictlySorted!384 lt!217163) e!280346)))

(declare-fun b!477156 () Bool)

(declare-fun e!280347 () Bool)

(assert (=> b!477156 (= e!280346 e!280347)))

(declare-fun res!284826 () Bool)

(assert (=> b!477156 (=> (not res!284826) (not e!280347))))

(assert (=> b!477156 (= res!284826 (bvslt (_1!4537 (h!9950 lt!217163)) (_1!4537 (h!9950 (t!15153 lt!217163)))))))

(declare-fun b!477157 () Bool)

(assert (=> b!477157 (= e!280347 (isStrictlySorted!384 (t!15153 lt!217163)))))

(assert (= (and d!75959 (not res!284825)) b!477156))

(assert (= (and b!477156 res!284826) b!477157))

(declare-fun m!459047 () Bool)

(assert (=> b!477157 m!459047))

(assert (=> d!75795 d!75959))

(declare-fun d!75961 () Bool)

(declare-fun res!284827 () Bool)

(declare-fun e!280348 () Bool)

(assert (=> d!75961 (=> res!284827 e!280348)))

(assert (=> d!75961 (= res!284827 (or ((_ is Nil!9095) (t!15153 (toList!3993 lm!215))) ((_ is Nil!9095) (t!15153 (t!15153 (toList!3993 lm!215))))))))

(assert (=> d!75961 (= (isStrictlySorted!384 (t!15153 (toList!3993 lm!215))) e!280348)))

(declare-fun b!477158 () Bool)

(declare-fun e!280349 () Bool)

(assert (=> b!477158 (= e!280348 e!280349)))

(declare-fun res!284828 () Bool)

(assert (=> b!477158 (=> (not res!284828) (not e!280349))))

(assert (=> b!477158 (= res!284828 (bvslt (_1!4537 (h!9950 (t!15153 (toList!3993 lm!215)))) (_1!4537 (h!9950 (t!15153 (t!15153 (toList!3993 lm!215)))))))))

(declare-fun b!477159 () Bool)

(assert (=> b!477159 (= e!280349 (isStrictlySorted!384 (t!15153 (t!15153 (toList!3993 lm!215)))))))

(assert (= (and d!75961 (not res!284827)) b!477158))

(assert (= (and b!477158 res!284828) b!477159))

(declare-fun m!459053 () Bool)

(assert (=> b!477159 m!459053))

(assert (=> b!476735 d!75961))

(declare-fun d!75965 () Bool)

(declare-fun lt!217296 () Bool)

(assert (=> d!75965 (= lt!217296 (select (content!209 (t!15153 (toList!3993 lt!217161))) lt!217108))))

(declare-fun e!280353 () Bool)

(assert (=> d!75965 (= lt!217296 e!280353)))

(declare-fun res!284831 () Bool)

(assert (=> d!75965 (=> (not res!284831) (not e!280353))))

(assert (=> d!75965 (= res!284831 ((_ is Cons!9094) (t!15153 (toList!3993 lt!217161))))))

(assert (=> d!75965 (= (contains!2562 (t!15153 (toList!3993 lt!217161)) lt!217108) lt!217296)))

(declare-fun b!477162 () Bool)

(declare-fun e!280352 () Bool)

(assert (=> b!477162 (= e!280353 e!280352)))

(declare-fun res!284832 () Bool)

(assert (=> b!477162 (=> res!284832 e!280352)))

(assert (=> b!477162 (= res!284832 (= (h!9950 (t!15153 (toList!3993 lt!217161))) lt!217108))))

(declare-fun b!477163 () Bool)

(assert (=> b!477163 (= e!280352 (contains!2562 (t!15153 (t!15153 (toList!3993 lt!217161))) lt!217108))))

(assert (= (and d!75965 res!284831) b!477162))

(assert (= (and b!477162 (not res!284832)) b!477163))

(assert (=> d!75965 m!458995))

(declare-fun m!459057 () Bool)

(assert (=> d!75965 m!459057))

(declare-fun m!459059 () Bool)

(assert (=> b!477163 m!459059))

(assert (=> b!476926 d!75965))

(assert (=> d!75831 d!75823))

(assert (=> d!75831 d!75829))

(declare-fun d!75969 () Bool)

(declare-fun res!284833 () Bool)

(declare-fun e!280354 () Bool)

(assert (=> d!75969 (=> res!284833 e!280354)))

(assert (=> d!75969 (= res!284833 ((_ is Nil!9095) (t!15153 (toList!3993 (+!1801 lt!217110 (tuple2!9053 a!501 b!85))))))))

(assert (=> d!75969 (= (forall!197 (t!15153 (toList!3993 (+!1801 lt!217110 (tuple2!9053 a!501 b!85)))) p!166) e!280354)))

(declare-fun b!477164 () Bool)

(declare-fun e!280355 () Bool)

(assert (=> b!477164 (= e!280354 e!280355)))

(declare-fun res!284834 () Bool)

(assert (=> b!477164 (=> (not res!284834) (not e!280355))))

(assert (=> b!477164 (= res!284834 (dynLambda!947 p!166 (h!9950 (t!15153 (toList!3993 (+!1801 lt!217110 (tuple2!9053 a!501 b!85)))))))))

(declare-fun b!477165 () Bool)

(assert (=> b!477165 (= e!280355 (forall!197 (t!15153 (t!15153 (toList!3993 (+!1801 lt!217110 (tuple2!9053 a!501 b!85))))) p!166))))

(assert (= (and d!75969 (not res!284833)) b!477164))

(assert (= (and b!477164 res!284834) b!477165))

(declare-fun b_lambda!10635 () Bool)

(assert (=> (not b_lambda!10635) (not b!477164)))

(declare-fun t!15228 () Bool)

(declare-fun tb!4085 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15228) tb!4085))

(declare-fun result!7653 () Bool)

(assert (=> tb!4085 (= result!7653 true)))

(assert (=> b!477164 t!15228))

(declare-fun b_and!20769 () Bool)

(assert (= b_and!20765 (and (=> t!15228 result!7653) b_and!20769)))

(declare-fun m!459061 () Bool)

(assert (=> b!477164 m!459061))

(declare-fun m!459063 () Bool)

(assert (=> b!477165 m!459063))

(assert (=> b!476913 d!75969))

(declare-fun d!75971 () Bool)

(assert (=> d!75971 (isDefined!296 (getValueByKey!385 (toList!3993 lt!217165) (_1!4537 lt!217108)))))

(declare-fun lt!217297 () Unit!14014)

(assert (=> d!75971 (= lt!217297 (choose!1375 (toList!3993 lt!217165) (_1!4537 lt!217108)))))

(declare-fun e!280358 () Bool)

(assert (=> d!75971 e!280358))

(declare-fun res!284835 () Bool)

(assert (=> d!75971 (=> (not res!284835) (not e!280358))))

(assert (=> d!75971 (= res!284835 (isStrictlySorted!384 (toList!3993 lt!217165)))))

(assert (=> d!75971 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3993 lt!217165) (_1!4537 lt!217108)) lt!217297)))

(declare-fun b!477170 () Bool)

(assert (=> b!477170 (= e!280358 (containsKey!346 (toList!3993 lt!217165) (_1!4537 lt!217108)))))

(assert (= (and d!75971 res!284835) b!477170))

(assert (=> d!75971 m!458549))

(assert (=> d!75971 m!458549))

(assert (=> d!75971 m!458777))

(declare-fun m!459065 () Bool)

(assert (=> d!75971 m!459065))

(declare-fun m!459067 () Bool)

(assert (=> d!75971 m!459067))

(assert (=> b!477170 m!458773))

(assert (=> b!476941 d!75971))

(declare-fun d!75973 () Bool)

(assert (=> d!75973 (= (isDefined!296 (getValueByKey!385 (toList!3993 lt!217165) (_1!4537 lt!217108))) (not (isEmpty!612 (getValueByKey!385 (toList!3993 lt!217165) (_1!4537 lt!217108)))))))

(declare-fun bs!15144 () Bool)

(assert (= bs!15144 d!75973))

(assert (=> bs!15144 m!458549))

(declare-fun m!459069 () Bool)

(assert (=> bs!15144 m!459069))

(assert (=> b!476941 d!75973))

(assert (=> b!476941 d!75815))

(assert (=> b!476943 d!75973))

(assert (=> b!476943 d!75815))

(declare-fun b!477171 () Bool)

(declare-fun e!280359 () Option!391)

(assert (=> b!477171 (= e!280359 (Some!390 (_2!4537 (h!9950 (t!15153 lt!217167)))))))

(declare-fun d!75975 () Bool)

(declare-fun c!57422 () Bool)

(assert (=> d!75975 (= c!57422 (and ((_ is Cons!9094) (t!15153 lt!217167)) (= (_1!4537 (h!9950 (t!15153 lt!217167))) (_1!4537 lt!217108))))))

(assert (=> d!75975 (= (getValueByKey!385 (t!15153 lt!217167) (_1!4537 lt!217108)) e!280359)))

(declare-fun b!477172 () Bool)

(declare-fun e!280360 () Option!391)

(assert (=> b!477172 (= e!280359 e!280360)))

(declare-fun c!57423 () Bool)

(assert (=> b!477172 (= c!57423 (and ((_ is Cons!9094) (t!15153 lt!217167)) (not (= (_1!4537 (h!9950 (t!15153 lt!217167))) (_1!4537 lt!217108)))))))

(declare-fun b!477174 () Bool)

(assert (=> b!477174 (= e!280360 None!389)))

(declare-fun b!477173 () Bool)

(assert (=> b!477173 (= e!280360 (getValueByKey!385 (t!15153 (t!15153 lt!217167)) (_1!4537 lt!217108)))))

(assert (= (and d!75975 c!57422) b!477171))

(assert (= (and d!75975 (not c!57422)) b!477172))

(assert (= (and b!477172 c!57423) b!477173))

(assert (= (and b!477172 (not c!57423)) b!477174))

(declare-fun m!459071 () Bool)

(assert (=> b!477173 m!459071))

(assert (=> b!476948 d!75975))

(assert (=> b!476790 d!75947))

(assert (=> b!476790 d!75769))

(declare-fun d!75977 () Bool)

(declare-fun res!284836 () Bool)

(declare-fun e!280361 () Bool)

(assert (=> d!75977 (=> res!284836 e!280361)))

(assert (=> d!75977 (= res!284836 (and ((_ is Cons!9094) (toList!3993 lt!217161)) (= (_1!4537 (h!9950 (toList!3993 lt!217161))) (_1!4537 lt!217108))))))

(assert (=> d!75977 (= (containsKey!346 (toList!3993 lt!217161) (_1!4537 lt!217108)) e!280361)))

(declare-fun b!477175 () Bool)

(declare-fun e!280362 () Bool)

(assert (=> b!477175 (= e!280361 e!280362)))

(declare-fun res!284837 () Bool)

(assert (=> b!477175 (=> (not res!284837) (not e!280362))))

(assert (=> b!477175 (= res!284837 (and (or (not ((_ is Cons!9094) (toList!3993 lt!217161))) (bvsle (_1!4537 (h!9950 (toList!3993 lt!217161))) (_1!4537 lt!217108))) ((_ is Cons!9094) (toList!3993 lt!217161)) (bvslt (_1!4537 (h!9950 (toList!3993 lt!217161))) (_1!4537 lt!217108))))))

(declare-fun b!477176 () Bool)

(assert (=> b!477176 (= e!280362 (containsKey!346 (t!15153 (toList!3993 lt!217161)) (_1!4537 lt!217108)))))

(assert (= (and d!75977 (not res!284836)) b!477175))

(assert (= (and b!477175 res!284837) b!477176))

(declare-fun m!459075 () Bool)

(assert (=> b!477176 m!459075))

(assert (=> d!75783 d!75977))

(declare-fun b!477181 () Bool)

(declare-fun e!280365 () Option!391)

(assert (=> b!477181 (= e!280365 (Some!390 (_2!4537 (h!9950 (toList!3993 lt!217231)))))))

(declare-fun c!57426 () Bool)

(declare-fun d!75979 () Bool)

(assert (=> d!75979 (= c!57426 (and ((_ is Cons!9094) (toList!3993 lt!217231)) (= (_1!4537 (h!9950 (toList!3993 lt!217231))) (_1!4537 (tuple2!9053 a!501 b!85)))))))

(assert (=> d!75979 (= (getValueByKey!385 (toList!3993 lt!217231) (_1!4537 (tuple2!9053 a!501 b!85))) e!280365)))

(declare-fun b!477182 () Bool)

(declare-fun e!280366 () Option!391)

(assert (=> b!477182 (= e!280365 e!280366)))

(declare-fun c!57427 () Bool)

(assert (=> b!477182 (= c!57427 (and ((_ is Cons!9094) (toList!3993 lt!217231)) (not (= (_1!4537 (h!9950 (toList!3993 lt!217231))) (_1!4537 (tuple2!9053 a!501 b!85))))))))

(declare-fun b!477184 () Bool)

(assert (=> b!477184 (= e!280366 None!389)))

(declare-fun b!477183 () Bool)

(assert (=> b!477183 (= e!280366 (getValueByKey!385 (t!15153 (toList!3993 lt!217231)) (_1!4537 (tuple2!9053 a!501 b!85))))))

(assert (= (and d!75979 c!57426) b!477181))

(assert (= (and d!75979 (not c!57426)) b!477182))

(assert (= (and b!477182 c!57427) b!477183))

(assert (= (and b!477182 (not c!57427)) b!477184))

(declare-fun m!459083 () Bool)

(assert (=> b!477183 m!459083))

(assert (=> b!476914 d!75979))

(declare-fun d!75985 () Bool)

(declare-fun res!284838 () Bool)

(declare-fun e!280367 () Bool)

(assert (=> d!75985 (=> res!284838 e!280367)))

(assert (=> d!75985 (= res!284838 (and ((_ is Cons!9094) lt!217250) (= (_1!4537 (h!9950 lt!217250)) (_1!4537 lt!217108))))))

(assert (=> d!75985 (= (containsKey!346 lt!217250 (_1!4537 lt!217108)) e!280367)))

(declare-fun b!477185 () Bool)

(declare-fun e!280368 () Bool)

(assert (=> b!477185 (= e!280367 e!280368)))

(declare-fun res!284839 () Bool)

(assert (=> b!477185 (=> (not res!284839) (not e!280368))))

(assert (=> b!477185 (= res!284839 (and (or (not ((_ is Cons!9094) lt!217250)) (bvsle (_1!4537 (h!9950 lt!217250)) (_1!4537 lt!217108))) ((_ is Cons!9094) lt!217250) (bvslt (_1!4537 (h!9950 lt!217250)) (_1!4537 lt!217108))))))

(declare-fun b!477186 () Bool)

(assert (=> b!477186 (= e!280368 (containsKey!346 (t!15153 lt!217250) (_1!4537 lt!217108)))))

(assert (= (and d!75985 (not res!284838)) b!477185))

(assert (= (and b!477185 res!284839) b!477186))

(declare-fun m!459085 () Bool)

(assert (=> b!477186 m!459085))

(assert (=> b!476954 d!75985))

(declare-fun b!477187 () Bool)

(declare-fun res!284840 () Bool)

(declare-fun e!280369 () Bool)

(assert (=> b!477187 (=> (not res!284840) (not e!280369))))

(declare-fun lt!217298 () List!9098)

(assert (=> b!477187 (= res!284840 (containsKey!346 lt!217298 (_1!4537 lt!217108)))))

(declare-fun b!477188 () Bool)

(declare-fun e!280370 () List!9098)

(declare-fun call!30748 () List!9098)

(assert (=> b!477188 (= e!280370 call!30748)))

(declare-fun b!477189 () Bool)

(declare-fun e!280372 () List!9098)

(assert (=> b!477189 (= e!280372 (insertStrictlySorted!213 (t!15153 (t!15153 (toList!3993 lm!215))) (_1!4537 lt!217108) (_2!4537 lt!217108)))))

(declare-fun bm!30745 () Bool)

(declare-fun call!30749 () List!9098)

(declare-fun call!30750 () List!9098)

(assert (=> bm!30745 (= call!30749 call!30750)))

(declare-fun b!477190 () Bool)

(declare-fun c!57429 () Bool)

(assert (=> b!477190 (= c!57429 (and ((_ is Cons!9094) (t!15153 (toList!3993 lm!215))) (bvsgt (_1!4537 (h!9950 (t!15153 (toList!3993 lm!215)))) (_1!4537 lt!217108))))))

(declare-fun e!280373 () List!9098)

(assert (=> b!477190 (= e!280373 e!280370)))

(declare-fun bm!30746 () Bool)

(assert (=> bm!30746 (= call!30748 call!30749)))

(declare-fun b!477191 () Bool)

(assert (=> b!477191 (= e!280373 call!30749)))

(declare-fun b!477192 () Bool)

(assert (=> b!477192 (= e!280369 (contains!2562 lt!217298 (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(declare-fun bm!30747 () Bool)

(declare-fun c!57428 () Bool)

(assert (=> bm!30747 (= call!30750 ($colon$colon!109 e!280372 (ite c!57428 (h!9950 (t!15153 (toList!3993 lm!215))) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108)))))))

(declare-fun c!57431 () Bool)

(assert (=> bm!30747 (= c!57431 c!57428)))

(declare-fun d!75987 () Bool)

(assert (=> d!75987 e!280369))

(declare-fun res!284841 () Bool)

(assert (=> d!75987 (=> (not res!284841) (not e!280369))))

(assert (=> d!75987 (= res!284841 (isStrictlySorted!384 lt!217298))))

(declare-fun e!280371 () List!9098)

(assert (=> d!75987 (= lt!217298 e!280371)))

(assert (=> d!75987 (= c!57428 (and ((_ is Cons!9094) (t!15153 (toList!3993 lm!215))) (bvslt (_1!4537 (h!9950 (t!15153 (toList!3993 lm!215)))) (_1!4537 lt!217108))))))

(assert (=> d!75987 (isStrictlySorted!384 (t!15153 (toList!3993 lm!215)))))

(assert (=> d!75987 (= (insertStrictlySorted!213 (t!15153 (toList!3993 lm!215)) (_1!4537 lt!217108) (_2!4537 lt!217108)) lt!217298)))

(declare-fun b!477193 () Bool)

(assert (=> b!477193 (= e!280371 call!30750)))

(declare-fun b!477194 () Bool)

(declare-fun c!57430 () Bool)

(assert (=> b!477194 (= e!280372 (ite c!57430 (t!15153 (t!15153 (toList!3993 lm!215))) (ite c!57429 (Cons!9094 (h!9950 (t!15153 (toList!3993 lm!215))) (t!15153 (t!15153 (toList!3993 lm!215)))) Nil!9095)))))

(declare-fun b!477195 () Bool)

(assert (=> b!477195 (= e!280370 call!30748)))

(declare-fun b!477196 () Bool)

(assert (=> b!477196 (= e!280371 e!280373)))

(assert (=> b!477196 (= c!57430 (and ((_ is Cons!9094) (t!15153 (toList!3993 lm!215))) (= (_1!4537 (h!9950 (t!15153 (toList!3993 lm!215)))) (_1!4537 lt!217108))))))

(assert (= (and d!75987 c!57428) b!477193))

(assert (= (and d!75987 (not c!57428)) b!477196))

(assert (= (and b!477196 c!57430) b!477191))

(assert (= (and b!477196 (not c!57430)) b!477190))

(assert (= (and b!477190 c!57429) b!477188))

(assert (= (and b!477190 (not c!57429)) b!477195))

(assert (= (or b!477188 b!477195) bm!30746))

(assert (= (or b!477191 bm!30746) bm!30745))

(assert (= (or b!477193 bm!30745) bm!30747))

(assert (= (and bm!30747 c!57431) b!477189))

(assert (= (and bm!30747 (not c!57431)) b!477194))

(assert (= (and d!75987 res!284841) b!477187))

(assert (= (and b!477187 res!284840) b!477192))

(declare-fun m!459087 () Bool)

(assert (=> b!477192 m!459087))

(declare-fun m!459089 () Bool)

(assert (=> bm!30747 m!459089))

(declare-fun m!459091 () Bool)

(assert (=> b!477189 m!459091))

(declare-fun m!459093 () Bool)

(assert (=> d!75987 m!459093))

(assert (=> d!75987 m!458633))

(declare-fun m!459095 () Bool)

(assert (=> b!477187 m!459095))

(assert (=> b!476956 d!75987))

(declare-fun b!477199 () Bool)

(declare-fun e!280376 () Option!391)

(assert (=> b!477199 (= e!280376 (Some!390 (_2!4537 (h!9950 (t!15153 (toList!3993 lt!217165))))))))

(declare-fun d!75991 () Bool)

(declare-fun c!57432 () Bool)

(assert (=> d!75991 (= c!57432 (and ((_ is Cons!9094) (t!15153 (toList!3993 lt!217165))) (= (_1!4537 (h!9950 (t!15153 (toList!3993 lt!217165)))) (_1!4537 lt!217108))))))

(assert (=> d!75991 (= (getValueByKey!385 (t!15153 (toList!3993 lt!217165)) (_1!4537 lt!217108)) e!280376)))

(declare-fun b!477200 () Bool)

(declare-fun e!280377 () Option!391)

(assert (=> b!477200 (= e!280376 e!280377)))

(declare-fun c!57433 () Bool)

(assert (=> b!477200 (= c!57433 (and ((_ is Cons!9094) (t!15153 (toList!3993 lt!217165))) (not (= (_1!4537 (h!9950 (t!15153 (toList!3993 lt!217165)))) (_1!4537 lt!217108)))))))

(declare-fun b!477202 () Bool)

(assert (=> b!477202 (= e!280377 None!389)))

(declare-fun b!477201 () Bool)

(assert (=> b!477201 (= e!280377 (getValueByKey!385 (t!15153 (t!15153 (toList!3993 lt!217165))) (_1!4537 lt!217108)))))

(assert (= (and d!75991 c!57432) b!477199))

(assert (= (and d!75991 (not c!57432)) b!477200))

(assert (= (and b!477200 c!57433) b!477201))

(assert (= (and b!477200 (not c!57433)) b!477202))

(declare-fun m!459099 () Bool)

(assert (=> b!477201 m!459099))

(assert (=> b!476878 d!75991))

(declare-fun d!75995 () Bool)

(declare-fun lt!217300 () Bool)

(assert (=> d!75995 (= lt!217300 (select (content!209 (toList!3993 lt!217231)) (tuple2!9053 a!501 b!85)))))

(declare-fun e!280381 () Bool)

(assert (=> d!75995 (= lt!217300 e!280381)))

(declare-fun res!284846 () Bool)

(assert (=> d!75995 (=> (not res!284846) (not e!280381))))

(assert (=> d!75995 (= res!284846 ((_ is Cons!9094) (toList!3993 lt!217231)))))

(assert (=> d!75995 (= (contains!2562 (toList!3993 lt!217231) (tuple2!9053 a!501 b!85)) lt!217300)))

(declare-fun b!477205 () Bool)

(declare-fun e!280380 () Bool)

(assert (=> b!477205 (= e!280381 e!280380)))

(declare-fun res!284847 () Bool)

(assert (=> b!477205 (=> res!284847 e!280380)))

(assert (=> b!477205 (= res!284847 (= (h!9950 (toList!3993 lt!217231)) (tuple2!9053 a!501 b!85)))))

(declare-fun b!477206 () Bool)

(assert (=> b!477206 (= e!280380 (contains!2562 (t!15153 (toList!3993 lt!217231)) (tuple2!9053 a!501 b!85)))))

(assert (= (and d!75995 res!284846) b!477205))

(assert (= (and b!477205 (not res!284847)) b!477206))

(declare-fun m!459107 () Bool)

(assert (=> d!75995 m!459107))

(declare-fun m!459109 () Bool)

(assert (=> d!75995 m!459109))

(declare-fun m!459111 () Bool)

(assert (=> b!477206 m!459111))

(assert (=> b!476915 d!75995))

(declare-fun d!75999 () Bool)

(declare-fun lt!217301 () Bool)

(assert (=> d!75999 (= lt!217301 (select (content!209 lt!217163) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(declare-fun e!280385 () Bool)

(assert (=> d!75999 (= lt!217301 e!280385)))

(declare-fun res!284848 () Bool)

(assert (=> d!75999 (=> (not res!284848) (not e!280385))))

(assert (=> d!75999 (= res!284848 ((_ is Cons!9094) lt!217163))))

(assert (=> d!75999 (= (contains!2562 lt!217163 (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))) lt!217301)))

(declare-fun b!477211 () Bool)

(declare-fun e!280384 () Bool)

(assert (=> b!477211 (= e!280385 e!280384)))

(declare-fun res!284849 () Bool)

(assert (=> b!477211 (=> res!284849 e!280384)))

(assert (=> b!477211 (= res!284849 (= (h!9950 lt!217163) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(declare-fun b!477212 () Bool)

(assert (=> b!477212 (= e!280384 (contains!2562 (t!15153 lt!217163) (tuple2!9053 (_1!4537 lt!217108) (_2!4537 lt!217108))))))

(assert (= (and d!75999 res!284848) b!477211))

(assert (= (and b!477211 (not res!284849)) b!477212))

(declare-fun m!459115 () Bool)

(assert (=> d!75999 m!459115))

(declare-fun m!459117 () Bool)

(assert (=> d!75999 m!459117))

(declare-fun m!459121 () Bool)

(assert (=> b!477212 m!459121))

(assert (=> b!476808 d!75999))

(declare-fun d!76005 () Bool)

(declare-fun res!284853 () Bool)

(declare-fun e!280389 () Bool)

(assert (=> d!76005 (=> res!284853 e!280389)))

(assert (=> d!76005 (= res!284853 (or ((_ is Nil!9095) lt!217250) ((_ is Nil!9095) (t!15153 lt!217250))))))

(assert (=> d!76005 (= (isStrictlySorted!384 lt!217250) e!280389)))

(declare-fun b!477216 () Bool)

(declare-fun e!280391 () Bool)

(assert (=> b!477216 (= e!280389 e!280391)))

(declare-fun res!284855 () Bool)

(assert (=> b!477216 (=> (not res!284855) (not e!280391))))

(assert (=> b!477216 (= res!284855 (bvslt (_1!4537 (h!9950 lt!217250)) (_1!4537 (h!9950 (t!15153 lt!217250)))))))

(declare-fun b!477218 () Bool)

(assert (=> b!477218 (= e!280391 (isStrictlySorted!384 (t!15153 lt!217250)))))

(assert (= (and d!76005 (not res!284853)) b!477216))

(assert (= (and b!477216 res!284855) b!477218))

(declare-fun m!459125 () Bool)

(assert (=> b!477218 m!459125))

(assert (=> d!75843 d!76005))

(assert (=> d!75843 d!75767))

(declare-fun d!76009 () Bool)

(declare-fun res!284856 () Bool)

(declare-fun e!280394 () Bool)

(assert (=> d!76009 (=> res!284856 e!280394)))

(assert (=> d!76009 (= res!284856 ((_ is Nil!9095) (t!15153 (t!15153 (toList!3993 (+!1801 lm!215 lt!217108))))))))

(assert (=> d!76009 (= (forall!197 (t!15153 (t!15153 (toList!3993 (+!1801 lm!215 lt!217108)))) p!166) e!280394)))

(declare-fun b!477223 () Bool)

(declare-fun e!280395 () Bool)

(assert (=> b!477223 (= e!280394 e!280395)))

(declare-fun res!284857 () Bool)

(assert (=> b!477223 (=> (not res!284857) (not e!280395))))

(assert (=> b!477223 (= res!284857 (dynLambda!947 p!166 (h!9950 (t!15153 (t!15153 (toList!3993 (+!1801 lm!215 lt!217108)))))))))

(declare-fun b!477224 () Bool)

(assert (=> b!477224 (= e!280395 (forall!197 (t!15153 (t!15153 (t!15153 (toList!3993 (+!1801 lm!215 lt!217108))))) p!166))))

(assert (= (and d!76009 (not res!284856)) b!477223))

(assert (= (and b!477223 res!284857) b!477224))

(declare-fun b_lambda!10637 () Bool)

(assert (=> (not b_lambda!10637) (not b!477223)))

(declare-fun t!15230 () Bool)

(declare-fun tb!4087 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15230) tb!4087))

(declare-fun result!7655 () Bool)

(assert (=> tb!4087 (= result!7655 true)))

(assert (=> b!477223 t!15230))

(declare-fun b_and!20771 () Bool)

(assert (= b_and!20769 (and (=> t!15230 result!7655) b_and!20771)))

(declare-fun m!459129 () Bool)

(assert (=> b!477223 m!459129))

(declare-fun m!459131 () Bool)

(assert (=> b!477224 m!459131))

(assert (=> b!476974 d!76009))

(declare-fun d!76013 () Bool)

(declare-fun res!284858 () Bool)

(declare-fun e!280396 () Bool)

(assert (=> d!76013 (=> res!284858 e!280396)))

(assert (=> d!76013 (= res!284858 (and ((_ is Cons!9094) lt!217163) (= (_1!4537 (h!9950 lt!217163)) (_1!4537 lt!217108))))))

(assert (=> d!76013 (= (containsKey!346 lt!217163 (_1!4537 lt!217108)) e!280396)))

(declare-fun b!477225 () Bool)

(declare-fun e!280397 () Bool)

(assert (=> b!477225 (= e!280396 e!280397)))

(declare-fun res!284859 () Bool)

(assert (=> b!477225 (=> (not res!284859) (not e!280397))))

(assert (=> b!477225 (= res!284859 (and (or (not ((_ is Cons!9094) lt!217163)) (bvsle (_1!4537 (h!9950 lt!217163)) (_1!4537 lt!217108))) ((_ is Cons!9094) lt!217163) (bvslt (_1!4537 (h!9950 lt!217163)) (_1!4537 lt!217108))))))

(declare-fun b!477226 () Bool)

(assert (=> b!477226 (= e!280397 (containsKey!346 (t!15153 lt!217163) (_1!4537 lt!217108)))))

(assert (= (and d!76013 (not res!284858)) b!477225))

(assert (= (and b!477225 res!284859) b!477226))

(declare-fun m!459133 () Bool)

(assert (=> b!477226 m!459133))

(assert (=> b!476807 d!76013))

(declare-fun d!76015 () Bool)

(declare-fun res!284860 () Bool)

(declare-fun e!280398 () Bool)

(assert (=> d!76015 (=> res!284860 e!280398)))

(assert (=> d!76015 (= res!284860 ((_ is Nil!9095) (t!15153 (t!15153 (toList!3993 lm!215)))))))

(assert (=> d!76015 (= (forall!197 (t!15153 (t!15153 (toList!3993 lm!215))) p!166) e!280398)))

(declare-fun b!477227 () Bool)

(declare-fun e!280399 () Bool)

(assert (=> b!477227 (= e!280398 e!280399)))

(declare-fun res!284861 () Bool)

(assert (=> b!477227 (=> (not res!284861) (not e!280399))))

(assert (=> b!477227 (= res!284861 (dynLambda!947 p!166 (h!9950 (t!15153 (t!15153 (toList!3993 lm!215))))))))

(declare-fun b!477228 () Bool)

(assert (=> b!477228 (= e!280399 (forall!197 (t!15153 (t!15153 (t!15153 (toList!3993 lm!215)))) p!166))))

(assert (= (and d!76015 (not res!284860)) b!477227))

(assert (= (and b!477227 res!284861) b!477228))

(declare-fun b_lambda!10639 () Bool)

(assert (=> (not b_lambda!10639) (not b!477227)))

(declare-fun t!15232 () Bool)

(declare-fun tb!4089 () Bool)

(assert (=> (and start!42850 (= p!166 p!166) t!15232) tb!4089))

(declare-fun result!7657 () Bool)

(assert (=> tb!4089 (= result!7657 true)))

(assert (=> b!477227 t!15232))

(declare-fun b_and!20773 () Bool)

(assert (= b_and!20771 (and (=> t!15232 result!7657) b_and!20773)))

(declare-fun m!459135 () Bool)

(assert (=> b!477227 m!459135))

(declare-fun m!459137 () Bool)

(assert (=> b!477228 m!459137))

(assert (=> b!476757 d!76015))

(declare-fun b!477229 () Bool)

(declare-fun e!280400 () Bool)

(declare-fun tp!42422 () Bool)

(assert (=> b!477229 (= e!280400 (and tp_is_empty!13525 tp!42422))))

(assert (=> b!476975 (= tp!42419 e!280400)))

(assert (= (and b!476975 ((_ is Cons!9094) (t!15153 (t!15153 (toList!3993 lm!215))))) b!477229))

(declare-fun b_lambda!10641 () Bool)

(assert (= b_lambda!10635 (or (and start!42850 b_free!12103) b_lambda!10641)))

(declare-fun b_lambda!10643 () Bool)

(assert (= b_lambda!10639 (or (and start!42850 b_free!12103) b_lambda!10643)))

(declare-fun b_lambda!10645 () Bool)

(assert (= b_lambda!10629 (or (and start!42850 b_free!12103) b_lambda!10645)))

(declare-fun b_lambda!10647 () Bool)

(assert (= b_lambda!10637 (or (and start!42850 b_free!12103) b_lambda!10647)))

(declare-fun b_lambda!10649 () Bool)

(assert (= b_lambda!10631 (or (and start!42850 b_free!12103) b_lambda!10649)))

(check-sat (not b!477107) (not d!75957) (not b!477073) (not b!477183) (not b_lambda!10649) (not b_lambda!10643) (not d!75907) (not b!477097) (not b!477173) (not b!477212) (not b!477117) (not b_lambda!10505) (not b!477122) (not b_lambda!10559) (not d!75949) (not b!477153) b_and!20773 (not b!477134) (not b_lambda!10565) (not bm!30741) (not b!477186) (not b!477128) (not b!477189) (not b_lambda!10641) (not d!75941) (not b!477105) (not b!477228) (not b!477113) (not bm!30744) (not b!477159) (not d!75905) (not b!477108) (not b!477083) (not b_lambda!10561) (not b!477103) (not b_next!12103) (not b!477229) (not b!477206) (not b!477224) (not b!477085) (not b_lambda!10591) (not d!75987) (not b!477087) (not b!477157) (not b!477094) (not b!477192) (not d!75929) (not d!75931) (not b!477115) (not d!75999) (not b_lambda!10647) (not b!477187) (not b!477218) (not b!477090) (not b!477110) (not b!477119) (not d!75915) (not d!75947) (not b!477163) (not b!477116) (not b_lambda!10563) (not b!477067) (not b_lambda!10567) (not d!75923) (not b!477165) (not b!477092) (not b!477136) (not d!75995) (not b!477075) (not b!477143) (not b_lambda!10593) (not d!75927) (not b_lambda!10645) tp_is_empty!13525 (not d!75965) (not b!477226) (not b_lambda!10599) (not b!477081) (not b!477201) (not bm!30747) (not b_lambda!10597) (not d!75901) (not b_lambda!10595) (not d!75973) (not b!477176) (not b!477170) (not d!75971) (not b!477131))
(check-sat b_and!20773 (not b_next!12103))
