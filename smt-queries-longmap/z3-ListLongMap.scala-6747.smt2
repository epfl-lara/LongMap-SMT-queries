; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84728 () Bool)

(assert start!84728)

(declare-fun b_free!20041 () Bool)

(declare-fun b_next!20041 () Bool)

(assert (=> start!84728 (= b_free!20041 (not b_next!20041))))

(declare-fun tp!69911 () Bool)

(declare-fun b_and!32161 () Bool)

(assert (=> start!84728 (= tp!69911 b_and!32161)))

(declare-fun res!661842 () Bool)

(declare-fun e!558275 () Bool)

(assert (=> start!84728 (=> (not res!661842) (not e!558275))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84728 (= res!661842 (validMask!0 mask!1948))))

(assert (=> start!84728 e!558275))

(assert (=> start!84728 true))

(declare-fun tp_is_empty!23257 () Bool)

(assert (=> start!84728 tp_is_empty!23257))

(declare-datatypes ((V!35993 0))(
  ( (V!35994 (val!11679 Int)) )
))
(declare-datatypes ((ValueCell!11147 0))(
  ( (ValueCellFull!11147 (v!14243 V!35993)) (EmptyCell!11147) )
))
(declare-datatypes ((array!62518 0))(
  ( (array!62519 (arr!30108 (Array (_ BitVec 32) ValueCell!11147)) (size!30588 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62518)

(declare-fun e!558279 () Bool)

(declare-fun array_inv!23285 (array!62518) Bool)

(assert (=> start!84728 (and (array_inv!23285 _values!1278) e!558279)))

(assert (=> start!84728 tp!69911))

(declare-datatypes ((array!62520 0))(
  ( (array!62521 (arr!30109 (Array (_ BitVec 32) (_ BitVec 64))) (size!30589 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62520)

(declare-fun array_inv!23286 (array!62520) Bool)

(assert (=> start!84728 (array_inv!23286 _keys!1544)))

(declare-fun mapNonEmpty!36927 () Bool)

(declare-fun mapRes!36927 () Bool)

(declare-fun tp!69912 () Bool)

(declare-fun e!558276 () Bool)

(assert (=> mapNonEmpty!36927 (= mapRes!36927 (and tp!69912 e!558276))))

(declare-fun mapKey!36927 () (_ BitVec 32))

(declare-fun mapValue!36927 () ValueCell!11147)

(declare-fun mapRest!36927 () (Array (_ BitVec 32) ValueCell!11147))

(assert (=> mapNonEmpty!36927 (= (arr!30108 _values!1278) (store mapRest!36927 mapKey!36927 mapValue!36927))))

(declare-fun b!989950 () Bool)

(declare-fun e!558278 () Bool)

(assert (=> b!989950 (= e!558278 tp_is_empty!23257)))

(declare-fun b!989951 () Bool)

(declare-fun res!661844 () Bool)

(assert (=> b!989951 (=> (not res!661844) (not e!558275))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!989951 (= res!661844 (and (= (size!30588 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30589 _keys!1544) (size!30588 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!989952 () Bool)

(declare-fun res!661845 () Bool)

(assert (=> b!989952 (=> (not res!661845) (not e!558275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62520 (_ BitVec 32)) Bool)

(assert (=> b!989952 (= res!661845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!989953 () Bool)

(declare-fun res!661840 () Bool)

(assert (=> b!989953 (=> (not res!661840) (not e!558275))))

(declare-datatypes ((List!20815 0))(
  ( (Nil!20812) (Cons!20811 (h!21979 (_ BitVec 64)) (t!29760 List!20815)) )
))
(declare-fun arrayNoDuplicates!0 (array!62520 (_ BitVec 32) List!20815) Bool)

(assert (=> b!989953 (= res!661840 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20812))))

(declare-fun b!989954 () Bool)

(declare-fun res!661846 () Bool)

(assert (=> b!989954 (=> (not res!661846) (not e!558275))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!989954 (= res!661846 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30589 _keys!1544))))))

(declare-fun b!989955 () Bool)

(declare-fun res!661847 () Bool)

(assert (=> b!989955 (=> (not res!661847) (not e!558275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989955 (= res!661847 (validKeyInArray!0 (select (arr!30109 _keys!1544) from!1932)))))

(declare-fun minValue!1220 () V!35993)

(declare-fun e!558280 () Bool)

(declare-fun zeroValue!1220 () V!35993)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14910 0))(
  ( (tuple2!14911 (_1!7466 (_ BitVec 64)) (_2!7466 V!35993)) )
))
(declare-fun lt!439060 () tuple2!14910)

(declare-fun b!989956 () Bool)

(declare-datatypes ((List!20816 0))(
  ( (Nil!20813) (Cons!20812 (h!21980 tuple2!14910) (t!29761 List!20816)) )
))
(declare-datatypes ((ListLongMap!13609 0))(
  ( (ListLongMap!13610 (toList!6820 List!20816)) )
))
(declare-fun getCurrentListMap!3873 (array!62520 array!62518 (_ BitVec 32) (_ BitVec 32) V!35993 V!35993 (_ BitVec 32) Int) ListLongMap!13609)

(declare-fun +!3113 (ListLongMap!13609 tuple2!14910) ListLongMap!13609)

(assert (=> b!989956 (= e!558280 (not (= (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3113 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439060))))))

(declare-fun lt!439058 () ListLongMap!13609)

(declare-fun lt!439057 () tuple2!14910)

(assert (=> b!989956 (= (+!3113 (+!3113 lt!439058 lt!439057) lt!439060) (+!3113 (+!3113 lt!439058 lt!439060) lt!439057))))

(declare-fun lt!439061 () V!35993)

(assert (=> b!989956 (= lt!439060 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061))))

(assert (=> b!989956 (= lt!439057 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32822 0))(
  ( (Unit!32823) )
))
(declare-fun lt!439059 () Unit!32822)

(declare-fun addCommutativeForDiffKeys!715 (ListLongMap!13609 (_ BitVec 64) V!35993 (_ BitVec 64) V!35993) Unit!32822)

(assert (=> b!989956 (= lt!439059 (addCommutativeForDiffKeys!715 lt!439058 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30109 _keys!1544) from!1932) lt!439061))))

(declare-fun b!989957 () Bool)

(assert (=> b!989957 (= e!558279 (and e!558278 mapRes!36927))))

(declare-fun condMapEmpty!36927 () Bool)

(declare-fun mapDefault!36927 () ValueCell!11147)

(assert (=> b!989957 (= condMapEmpty!36927 (= (arr!30108 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11147)) mapDefault!36927)))))

(declare-fun mapIsEmpty!36927 () Bool)

(assert (=> mapIsEmpty!36927 mapRes!36927))

(declare-fun b!989958 () Bool)

(assert (=> b!989958 (= e!558276 tp_is_empty!23257)))

(declare-fun b!989959 () Bool)

(assert (=> b!989959 (= e!558275 e!558280)))

(declare-fun res!661841 () Bool)

(assert (=> b!989959 (=> (not res!661841) (not e!558280))))

(assert (=> b!989959 (= res!661841 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30109 _keys!1544) from!1932))))))

(declare-fun get!15652 (ValueCell!11147 V!35993) V!35993)

(declare-fun dynLambda!1896 (Int (_ BitVec 64)) V!35993)

(assert (=> b!989959 (= lt!439061 (get!15652 (select (arr!30108 _values!1278) from!1932) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!3548 (array!62520 array!62518 (_ BitVec 32) (_ BitVec 32) V!35993 V!35993 (_ BitVec 32) Int) ListLongMap!13609)

(assert (=> b!989959 (= lt!439058 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989960 () Bool)

(declare-fun res!661843 () Bool)

(assert (=> b!989960 (=> (not res!661843) (not e!558275))))

(assert (=> b!989960 (= res!661843 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!84728 res!661842) b!989951))

(assert (= (and b!989951 res!661844) b!989952))

(assert (= (and b!989952 res!661845) b!989953))

(assert (= (and b!989953 res!661840) b!989954))

(assert (= (and b!989954 res!661846) b!989955))

(assert (= (and b!989955 res!661847) b!989960))

(assert (= (and b!989960 res!661843) b!989959))

(assert (= (and b!989959 res!661841) b!989956))

(assert (= (and b!989957 condMapEmpty!36927) mapIsEmpty!36927))

(assert (= (and b!989957 (not condMapEmpty!36927)) mapNonEmpty!36927))

(get-info :version)

(assert (= (and mapNonEmpty!36927 ((_ is ValueCellFull!11147) mapValue!36927)) b!989958))

(assert (= (and b!989957 ((_ is ValueCellFull!11147) mapDefault!36927)) b!989950))

(assert (= start!84728 b!989957))

(declare-fun b_lambda!15111 () Bool)

(assert (=> (not b_lambda!15111) (not b!989959)))

(declare-fun t!29759 () Bool)

(declare-fun tb!6795 () Bool)

(assert (=> (and start!84728 (= defaultEntry!1281 defaultEntry!1281) t!29759) tb!6795))

(declare-fun result!13595 () Bool)

(assert (=> tb!6795 (= result!13595 tp_is_empty!23257)))

(assert (=> b!989959 t!29759))

(declare-fun b_and!32163 () Bool)

(assert (= b_and!32161 (and (=> t!29759 result!13595) b_and!32163)))

(declare-fun m!917453 () Bool)

(assert (=> b!989953 m!917453))

(declare-fun m!917455 () Bool)

(assert (=> b!989959 m!917455))

(declare-fun m!917457 () Bool)

(assert (=> b!989959 m!917457))

(declare-fun m!917459 () Bool)

(assert (=> b!989959 m!917459))

(declare-fun m!917461 () Bool)

(assert (=> b!989959 m!917461))

(assert (=> b!989959 m!917457))

(assert (=> b!989959 m!917461))

(declare-fun m!917463 () Bool)

(assert (=> b!989959 m!917463))

(declare-fun m!917465 () Bool)

(assert (=> b!989952 m!917465))

(declare-fun m!917467 () Bool)

(assert (=> mapNonEmpty!36927 m!917467))

(assert (=> b!989955 m!917455))

(assert (=> b!989955 m!917455))

(declare-fun m!917469 () Bool)

(assert (=> b!989955 m!917469))

(declare-fun m!917471 () Bool)

(assert (=> start!84728 m!917471))

(declare-fun m!917473 () Bool)

(assert (=> start!84728 m!917473))

(declare-fun m!917475 () Bool)

(assert (=> start!84728 m!917475))

(declare-fun m!917477 () Bool)

(assert (=> b!989956 m!917477))

(declare-fun m!917479 () Bool)

(assert (=> b!989956 m!917479))

(assert (=> b!989956 m!917455))

(declare-fun m!917481 () Bool)

(assert (=> b!989956 m!917481))

(declare-fun m!917483 () Bool)

(assert (=> b!989956 m!917483))

(assert (=> b!989956 m!917483))

(declare-fun m!917485 () Bool)

(assert (=> b!989956 m!917485))

(assert (=> b!989956 m!917481))

(declare-fun m!917487 () Bool)

(assert (=> b!989956 m!917487))

(assert (=> b!989956 m!917477))

(assert (=> b!989956 m!917455))

(declare-fun m!917489 () Bool)

(assert (=> b!989956 m!917489))

(declare-fun m!917491 () Bool)

(assert (=> b!989956 m!917491))

(check-sat (not b!989956) (not b_next!20041) (not mapNonEmpty!36927) b_and!32163 (not b!989955) (not b!989953) (not start!84728) (not b!989959) (not b!989952) tp_is_empty!23257 (not b_lambda!15111))
(check-sat b_and!32163 (not b_next!20041))
(get-model)

(declare-fun b_lambda!15117 () Bool)

(assert (= b_lambda!15111 (or (and start!84728 b_free!20041) b_lambda!15117)))

(check-sat (not b!989956) tp_is_empty!23257 (not b_next!20041) (not mapNonEmpty!36927) b_and!32163 (not b!989955) (not b!989953) (not b_lambda!15117) (not start!84728) (not b!989959) (not b!989952))
(check-sat b_and!32163 (not b_next!20041))
(get-model)

(declare-fun d!117599 () Bool)

(declare-fun e!558319 () Bool)

(assert (=> d!117599 e!558319))

(declare-fun res!661901 () Bool)

(assert (=> d!117599 (=> (not res!661901) (not e!558319))))

(declare-fun lt!439101 () ListLongMap!13609)

(declare-fun contains!5740 (ListLongMap!13609 (_ BitVec 64)) Bool)

(assert (=> d!117599 (= res!661901 (contains!5740 lt!439101 (_1!7466 lt!439057)))))

(declare-fun lt!439102 () List!20816)

(assert (=> d!117599 (= lt!439101 (ListLongMap!13610 lt!439102))))

(declare-fun lt!439100 () Unit!32822)

(declare-fun lt!439103 () Unit!32822)

(assert (=> d!117599 (= lt!439100 lt!439103)))

(declare-datatypes ((Option!517 0))(
  ( (Some!516 (v!14246 V!35993)) (None!515) )
))
(declare-fun getValueByKey!511 (List!20816 (_ BitVec 64)) Option!517)

(assert (=> d!117599 (= (getValueByKey!511 lt!439102 (_1!7466 lt!439057)) (Some!516 (_2!7466 lt!439057)))))

(declare-fun lemmaContainsTupThenGetReturnValue!273 (List!20816 (_ BitVec 64) V!35993) Unit!32822)

(assert (=> d!117599 (= lt!439103 (lemmaContainsTupThenGetReturnValue!273 lt!439102 (_1!7466 lt!439057) (_2!7466 lt!439057)))))

(declare-fun insertStrictlySorted!330 (List!20816 (_ BitVec 64) V!35993) List!20816)

(assert (=> d!117599 (= lt!439102 (insertStrictlySorted!330 (toList!6820 lt!439058) (_1!7466 lt!439057) (_2!7466 lt!439057)))))

(assert (=> d!117599 (= (+!3113 lt!439058 lt!439057) lt!439101)))

(declare-fun b!990037 () Bool)

(declare-fun res!661900 () Bool)

(assert (=> b!990037 (=> (not res!661900) (not e!558319))))

(assert (=> b!990037 (= res!661900 (= (getValueByKey!511 (toList!6820 lt!439101) (_1!7466 lt!439057)) (Some!516 (_2!7466 lt!439057))))))

(declare-fun b!990038 () Bool)

(declare-fun contains!5741 (List!20816 tuple2!14910) Bool)

(assert (=> b!990038 (= e!558319 (contains!5741 (toList!6820 lt!439101) lt!439057))))

(assert (= (and d!117599 res!661901) b!990037))

(assert (= (and b!990037 res!661900) b!990038))

(declare-fun m!917573 () Bool)

(assert (=> d!117599 m!917573))

(declare-fun m!917575 () Bool)

(assert (=> d!117599 m!917575))

(declare-fun m!917577 () Bool)

(assert (=> d!117599 m!917577))

(declare-fun m!917579 () Bool)

(assert (=> d!117599 m!917579))

(declare-fun m!917581 () Bool)

(assert (=> b!990037 m!917581))

(declare-fun m!917583 () Bool)

(assert (=> b!990038 m!917583))

(assert (=> b!989956 d!117599))

(declare-fun d!117601 () Bool)

(declare-fun e!558320 () Bool)

(assert (=> d!117601 e!558320))

(declare-fun res!661903 () Bool)

(assert (=> d!117601 (=> (not res!661903) (not e!558320))))

(declare-fun lt!439105 () ListLongMap!13609)

(assert (=> d!117601 (= res!661903 (contains!5740 lt!439105 (_1!7466 lt!439057)))))

(declare-fun lt!439106 () List!20816)

(assert (=> d!117601 (= lt!439105 (ListLongMap!13610 lt!439106))))

(declare-fun lt!439104 () Unit!32822)

(declare-fun lt!439107 () Unit!32822)

(assert (=> d!117601 (= lt!439104 lt!439107)))

(assert (=> d!117601 (= (getValueByKey!511 lt!439106 (_1!7466 lt!439057)) (Some!516 (_2!7466 lt!439057)))))

(assert (=> d!117601 (= lt!439107 (lemmaContainsTupThenGetReturnValue!273 lt!439106 (_1!7466 lt!439057) (_2!7466 lt!439057)))))

(assert (=> d!117601 (= lt!439106 (insertStrictlySorted!330 (toList!6820 (+!3113 lt!439058 lt!439060)) (_1!7466 lt!439057) (_2!7466 lt!439057)))))

(assert (=> d!117601 (= (+!3113 (+!3113 lt!439058 lt!439060) lt!439057) lt!439105)))

(declare-fun b!990039 () Bool)

(declare-fun res!661902 () Bool)

(assert (=> b!990039 (=> (not res!661902) (not e!558320))))

(assert (=> b!990039 (= res!661902 (= (getValueByKey!511 (toList!6820 lt!439105) (_1!7466 lt!439057)) (Some!516 (_2!7466 lt!439057))))))

(declare-fun b!990040 () Bool)

(assert (=> b!990040 (= e!558320 (contains!5741 (toList!6820 lt!439105) lt!439057))))

(assert (= (and d!117601 res!661903) b!990039))

(assert (= (and b!990039 res!661902) b!990040))

(declare-fun m!917585 () Bool)

(assert (=> d!117601 m!917585))

(declare-fun m!917587 () Bool)

(assert (=> d!117601 m!917587))

(declare-fun m!917589 () Bool)

(assert (=> d!117601 m!917589))

(declare-fun m!917591 () Bool)

(assert (=> d!117601 m!917591))

(declare-fun m!917593 () Bool)

(assert (=> b!990039 m!917593))

(declare-fun m!917595 () Bool)

(assert (=> b!990040 m!917595))

(assert (=> b!989956 d!117601))

(declare-fun d!117603 () Bool)

(declare-fun e!558321 () Bool)

(assert (=> d!117603 e!558321))

(declare-fun res!661905 () Bool)

(assert (=> d!117603 (=> (not res!661905) (not e!558321))))

(declare-fun lt!439109 () ListLongMap!13609)

(assert (=> d!117603 (= res!661905 (contains!5740 lt!439109 (_1!7466 lt!439060)))))

(declare-fun lt!439110 () List!20816)

(assert (=> d!117603 (= lt!439109 (ListLongMap!13610 lt!439110))))

(declare-fun lt!439108 () Unit!32822)

(declare-fun lt!439111 () Unit!32822)

(assert (=> d!117603 (= lt!439108 lt!439111)))

(assert (=> d!117603 (= (getValueByKey!511 lt!439110 (_1!7466 lt!439060)) (Some!516 (_2!7466 lt!439060)))))

(assert (=> d!117603 (= lt!439111 (lemmaContainsTupThenGetReturnValue!273 lt!439110 (_1!7466 lt!439060) (_2!7466 lt!439060)))))

(assert (=> d!117603 (= lt!439110 (insertStrictlySorted!330 (toList!6820 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7466 lt!439060) (_2!7466 lt!439060)))))

(assert (=> d!117603 (= (+!3113 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439060) lt!439109)))

(declare-fun b!990041 () Bool)

(declare-fun res!661904 () Bool)

(assert (=> b!990041 (=> (not res!661904) (not e!558321))))

(assert (=> b!990041 (= res!661904 (= (getValueByKey!511 (toList!6820 lt!439109) (_1!7466 lt!439060)) (Some!516 (_2!7466 lt!439060))))))

(declare-fun b!990042 () Bool)

(assert (=> b!990042 (= e!558321 (contains!5741 (toList!6820 lt!439109) lt!439060))))

(assert (= (and d!117603 res!661905) b!990041))

(assert (= (and b!990041 res!661904) b!990042))

(declare-fun m!917597 () Bool)

(assert (=> d!117603 m!917597))

(declare-fun m!917599 () Bool)

(assert (=> d!117603 m!917599))

(declare-fun m!917601 () Bool)

(assert (=> d!117603 m!917601))

(declare-fun m!917603 () Bool)

(assert (=> d!117603 m!917603))

(declare-fun m!917605 () Bool)

(assert (=> b!990041 m!917605))

(declare-fun m!917607 () Bool)

(assert (=> b!990042 m!917607))

(assert (=> b!989956 d!117603))

(declare-fun b!990085 () Bool)

(declare-fun e!558351 () ListLongMap!13609)

(declare-fun call!41953 () ListLongMap!13609)

(assert (=> b!990085 (= e!558351 call!41953)))

(declare-fun b!990086 () Bool)

(declare-fun e!558358 () Bool)

(declare-fun call!41952 () Bool)

(assert (=> b!990086 (= e!558358 (not call!41952))))

(declare-fun b!990087 () Bool)

(declare-fun e!558356 () ListLongMap!13609)

(declare-fun call!41954 () ListLongMap!13609)

(assert (=> b!990087 (= e!558356 (+!3113 call!41954 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun b!990088 () Bool)

(declare-fun e!558354 () Bool)

(declare-fun call!41951 () Bool)

(assert (=> b!990088 (= e!558354 (not call!41951))))

(declare-fun bm!41948 () Bool)

(declare-fun call!41957 () ListLongMap!13609)

(assert (=> bm!41948 (= call!41957 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!990089 () Bool)

(declare-fun res!661924 () Bool)

(declare-fun e!558353 () Bool)

(assert (=> b!990089 (=> (not res!661924) (not e!558353))))

(assert (=> b!990089 (= res!661924 e!558354)))

(declare-fun c!100540 () Bool)

(assert (=> b!990089 (= c!100540 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41949 () Bool)

(declare-fun call!41956 () ListLongMap!13609)

(assert (=> bm!41949 (= call!41956 call!41954)))

(declare-fun bm!41950 () Bool)

(declare-fun lt!439170 () ListLongMap!13609)

(assert (=> bm!41950 (= call!41952 (contains!5740 lt!439170 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990090 () Bool)

(declare-fun e!558352 () Bool)

(assert (=> b!990090 (= e!558352 (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990091 () Bool)

(assert (=> b!990091 (= e!558353 e!558358)))

(declare-fun c!100537 () Bool)

(assert (=> b!990091 (= c!100537 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!990092 () Bool)

(declare-fun e!558357 () Bool)

(declare-fun apply!904 (ListLongMap!13609 (_ BitVec 64)) V!35993)

(assert (=> b!990092 (= e!558357 (= (apply!904 lt!439170 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun b!990093 () Bool)

(assert (=> b!990093 (= e!558354 e!558357)))

(declare-fun res!661928 () Bool)

(assert (=> b!990093 (= res!661928 call!41951)))

(assert (=> b!990093 (=> (not res!661928) (not e!558357))))

(declare-fun d!117605 () Bool)

(assert (=> d!117605 e!558353))

(declare-fun res!661926 () Bool)

(assert (=> d!117605 (=> (not res!661926) (not e!558353))))

(assert (=> d!117605 (= res!661926 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30589 _keys!1544)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30589 _keys!1544)))))))

(declare-fun lt!439158 () ListLongMap!13609)

(assert (=> d!117605 (= lt!439170 lt!439158)))

(declare-fun lt!439164 () Unit!32822)

(declare-fun e!558350 () Unit!32822)

(assert (=> d!117605 (= lt!439164 e!558350)))

(declare-fun c!100538 () Bool)

(declare-fun e!558355 () Bool)

(assert (=> d!117605 (= c!100538 e!558355)))

(declare-fun res!661930 () Bool)

(assert (=> d!117605 (=> (not res!661930) (not e!558355))))

(assert (=> d!117605 (= res!661930 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30589 _keys!1544)))))

(assert (=> d!117605 (= lt!439158 e!558356)))

(declare-fun c!100539 () Bool)

(assert (=> d!117605 (= c!100539 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117605 (validMask!0 mask!1948)))

(assert (=> d!117605 (= (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439170)))

(declare-fun b!990094 () Bool)

(declare-fun e!558359 () ListLongMap!13609)

(assert (=> b!990094 (= e!558359 call!41956)))

(declare-fun b!990095 () Bool)

(assert (=> b!990095 (= e!558351 call!41956)))

(declare-fun b!990096 () Bool)

(declare-fun res!661925 () Bool)

(assert (=> b!990096 (=> (not res!661925) (not e!558353))))

(declare-fun e!558348 () Bool)

(assert (=> b!990096 (= res!661925 e!558348)))

(declare-fun res!661932 () Bool)

(assert (=> b!990096 (=> res!661932 e!558348)))

(assert (=> b!990096 (= res!661932 (not e!558352))))

(declare-fun res!661927 () Bool)

(assert (=> b!990096 (=> (not res!661927) (not e!558352))))

(assert (=> b!990096 (= res!661927 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30589 _keys!1544)))))

(declare-fun e!558349 () Bool)

(declare-fun b!990097 () Bool)

(assert (=> b!990097 (= e!558349 (= (apply!904 lt!439170 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990097 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30588 _values!1278)))))

(assert (=> b!990097 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30589 _keys!1544)))))

(declare-fun bm!41951 () Bool)

(declare-fun call!41955 () ListLongMap!13609)

(assert (=> bm!41951 (= call!41955 call!41957)))

(declare-fun b!990098 () Bool)

(assert (=> b!990098 (= e!558356 e!558359)))

(declare-fun c!100541 () Bool)

(assert (=> b!990098 (= c!100541 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!990099 () Bool)

(declare-fun Unit!32824 () Unit!32822)

(assert (=> b!990099 (= e!558350 Unit!32824)))

(declare-fun bm!41952 () Bool)

(assert (=> bm!41952 (= call!41954 (+!3113 (ite c!100539 call!41957 (ite c!100541 call!41955 call!41953)) (ite (or c!100539 c!100541) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun bm!41953 () Bool)

(assert (=> bm!41953 (= call!41951 (contains!5740 lt!439170 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990100 () Bool)

(declare-fun c!100542 () Bool)

(assert (=> b!990100 (= c!100542 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!990100 (= e!558359 e!558351)))

(declare-fun b!990101 () Bool)

(assert (=> b!990101 (= e!558355 (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990102 () Bool)

(assert (=> b!990102 (= e!558348 e!558349)))

(declare-fun res!661931 () Bool)

(assert (=> b!990102 (=> (not res!661931) (not e!558349))))

(assert (=> b!990102 (= res!661931 (contains!5740 lt!439170 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990102 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30589 _keys!1544)))))

(declare-fun b!990103 () Bool)

(declare-fun e!558360 () Bool)

(assert (=> b!990103 (= e!558360 (= (apply!904 lt!439170 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun b!990104 () Bool)

(declare-fun lt!439157 () Unit!32822)

(assert (=> b!990104 (= e!558350 lt!439157)))

(declare-fun lt!439174 () ListLongMap!13609)

(assert (=> b!990104 (= lt!439174 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439173 () (_ BitVec 64))

(assert (=> b!990104 (= lt!439173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439166 () (_ BitVec 64))

(assert (=> b!990104 (= lt!439166 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439176 () Unit!32822)

(declare-fun addStillContains!615 (ListLongMap!13609 (_ BitVec 64) V!35993 (_ BitVec 64)) Unit!32822)

(assert (=> b!990104 (= lt!439176 (addStillContains!615 lt!439174 lt!439173 zeroValue!1220 lt!439166))))

(assert (=> b!990104 (contains!5740 (+!3113 lt!439174 (tuple2!14911 lt!439173 zeroValue!1220)) lt!439166)))

(declare-fun lt!439161 () Unit!32822)

(assert (=> b!990104 (= lt!439161 lt!439176)))

(declare-fun lt!439159 () ListLongMap!13609)

(assert (=> b!990104 (= lt!439159 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439167 () (_ BitVec 64))

(assert (=> b!990104 (= lt!439167 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439171 () (_ BitVec 64))

(assert (=> b!990104 (= lt!439171 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439163 () Unit!32822)

(declare-fun addApplyDifferent!471 (ListLongMap!13609 (_ BitVec 64) V!35993 (_ BitVec 64)) Unit!32822)

(assert (=> b!990104 (= lt!439163 (addApplyDifferent!471 lt!439159 lt!439167 minValue!1220 lt!439171))))

(assert (=> b!990104 (= (apply!904 (+!3113 lt!439159 (tuple2!14911 lt!439167 minValue!1220)) lt!439171) (apply!904 lt!439159 lt!439171))))

(declare-fun lt!439177 () Unit!32822)

(assert (=> b!990104 (= lt!439177 lt!439163)))

(declare-fun lt!439160 () ListLongMap!13609)

(assert (=> b!990104 (= lt!439160 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439169 () (_ BitVec 64))

(assert (=> b!990104 (= lt!439169 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439172 () (_ BitVec 64))

(assert (=> b!990104 (= lt!439172 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439165 () Unit!32822)

(assert (=> b!990104 (= lt!439165 (addApplyDifferent!471 lt!439160 lt!439169 zeroValue!1220 lt!439172))))

(assert (=> b!990104 (= (apply!904 (+!3113 lt!439160 (tuple2!14911 lt!439169 zeroValue!1220)) lt!439172) (apply!904 lt!439160 lt!439172))))

(declare-fun lt!439175 () Unit!32822)

(assert (=> b!990104 (= lt!439175 lt!439165)))

(declare-fun lt!439162 () ListLongMap!13609)

(assert (=> b!990104 (= lt!439162 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439168 () (_ BitVec 64))

(assert (=> b!990104 (= lt!439168 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439156 () (_ BitVec 64))

(assert (=> b!990104 (= lt!439156 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!990104 (= lt!439157 (addApplyDifferent!471 lt!439162 lt!439168 minValue!1220 lt!439156))))

(assert (=> b!990104 (= (apply!904 (+!3113 lt!439162 (tuple2!14911 lt!439168 minValue!1220)) lt!439156) (apply!904 lt!439162 lt!439156))))

(declare-fun b!990105 () Bool)

(assert (=> b!990105 (= e!558358 e!558360)))

(declare-fun res!661929 () Bool)

(assert (=> b!990105 (= res!661929 call!41952)))

(assert (=> b!990105 (=> (not res!661929) (not e!558360))))

(declare-fun bm!41954 () Bool)

(assert (=> bm!41954 (= call!41953 call!41955)))

(assert (= (and d!117605 c!100539) b!990087))

(assert (= (and d!117605 (not c!100539)) b!990098))

(assert (= (and b!990098 c!100541) b!990094))

(assert (= (and b!990098 (not c!100541)) b!990100))

(assert (= (and b!990100 c!100542) b!990095))

(assert (= (and b!990100 (not c!100542)) b!990085))

(assert (= (or b!990095 b!990085) bm!41954))

(assert (= (or b!990094 bm!41954) bm!41951))

(assert (= (or b!990094 b!990095) bm!41949))

(assert (= (or b!990087 bm!41951) bm!41948))

(assert (= (or b!990087 bm!41949) bm!41952))

(assert (= (and d!117605 res!661930) b!990101))

(assert (= (and d!117605 c!100538) b!990104))

(assert (= (and d!117605 (not c!100538)) b!990099))

(assert (= (and d!117605 res!661926) b!990096))

(assert (= (and b!990096 res!661927) b!990090))

(assert (= (and b!990096 (not res!661932)) b!990102))

(assert (= (and b!990102 res!661931) b!990097))

(assert (= (and b!990096 res!661925) b!990089))

(assert (= (and b!990089 c!100540) b!990093))

(assert (= (and b!990089 (not c!100540)) b!990088))

(assert (= (and b!990093 res!661928) b!990092))

(assert (= (or b!990093 b!990088) bm!41953))

(assert (= (and b!990089 res!661924) b!990091))

(assert (= (and b!990091 c!100537) b!990105))

(assert (= (and b!990091 (not c!100537)) b!990086))

(assert (= (and b!990105 res!661929) b!990103))

(assert (= (or b!990105 b!990086) bm!41950))

(declare-fun b_lambda!15119 () Bool)

(assert (=> (not b_lambda!15119) (not b!990097)))

(assert (=> b!990097 t!29759))

(declare-fun b_and!32173 () Bool)

(assert (= b_and!32163 (and (=> t!29759 result!13595) b_and!32173)))

(declare-fun m!917609 () Bool)

(assert (=> b!990087 m!917609))

(declare-fun m!917611 () Bool)

(assert (=> bm!41953 m!917611))

(declare-fun m!917613 () Bool)

(assert (=> b!990101 m!917613))

(assert (=> b!990101 m!917613))

(declare-fun m!917615 () Bool)

(assert (=> b!990101 m!917615))

(declare-fun m!917617 () Bool)

(assert (=> b!990092 m!917617))

(assert (=> b!990090 m!917613))

(assert (=> b!990090 m!917613))

(assert (=> b!990090 m!917615))

(declare-fun m!917619 () Bool)

(assert (=> b!990103 m!917619))

(assert (=> b!990102 m!917613))

(assert (=> b!990102 m!917613))

(declare-fun m!917621 () Bool)

(assert (=> b!990102 m!917621))

(declare-fun m!917623 () Bool)

(assert (=> bm!41952 m!917623))

(assert (=> d!117605 m!917471))

(declare-fun m!917625 () Bool)

(assert (=> b!990097 m!917625))

(assert (=> b!990097 m!917461))

(declare-fun m!917627 () Bool)

(assert (=> b!990097 m!917627))

(assert (=> b!990097 m!917461))

(assert (=> b!990097 m!917625))

(assert (=> b!990097 m!917613))

(declare-fun m!917629 () Bool)

(assert (=> b!990097 m!917629))

(assert (=> b!990097 m!917613))

(assert (=> bm!41948 m!917459))

(declare-fun m!917631 () Bool)

(assert (=> bm!41950 m!917631))

(declare-fun m!917633 () Bool)

(assert (=> b!990104 m!917633))

(declare-fun m!917635 () Bool)

(assert (=> b!990104 m!917635))

(declare-fun m!917637 () Bool)

(assert (=> b!990104 m!917637))

(declare-fun m!917639 () Bool)

(assert (=> b!990104 m!917639))

(declare-fun m!917641 () Bool)

(assert (=> b!990104 m!917641))

(declare-fun m!917643 () Bool)

(assert (=> b!990104 m!917643))

(declare-fun m!917645 () Bool)

(assert (=> b!990104 m!917645))

(declare-fun m!917647 () Bool)

(assert (=> b!990104 m!917647))

(assert (=> b!990104 m!917613))

(declare-fun m!917649 () Bool)

(assert (=> b!990104 m!917649))

(declare-fun m!917651 () Bool)

(assert (=> b!990104 m!917651))

(declare-fun m!917653 () Bool)

(assert (=> b!990104 m!917653))

(assert (=> b!990104 m!917645))

(declare-fun m!917655 () Bool)

(assert (=> b!990104 m!917655))

(assert (=> b!990104 m!917459))

(declare-fun m!917657 () Bool)

(assert (=> b!990104 m!917657))

(assert (=> b!990104 m!917641))

(declare-fun m!917659 () Bool)

(assert (=> b!990104 m!917659))

(declare-fun m!917661 () Bool)

(assert (=> b!990104 m!917661))

(assert (=> b!990104 m!917635))

(assert (=> b!990104 m!917659))

(assert (=> b!989956 d!117605))

(declare-fun d!117607 () Bool)

(declare-fun e!558361 () Bool)

(assert (=> d!117607 e!558361))

(declare-fun res!661934 () Bool)

(assert (=> d!117607 (=> (not res!661934) (not e!558361))))

(declare-fun lt!439179 () ListLongMap!13609)

(assert (=> d!117607 (= res!661934 (contains!5740 lt!439179 (_1!7466 lt!439060)))))

(declare-fun lt!439180 () List!20816)

(assert (=> d!117607 (= lt!439179 (ListLongMap!13610 lt!439180))))

(declare-fun lt!439178 () Unit!32822)

(declare-fun lt!439181 () Unit!32822)

(assert (=> d!117607 (= lt!439178 lt!439181)))

(assert (=> d!117607 (= (getValueByKey!511 lt!439180 (_1!7466 lt!439060)) (Some!516 (_2!7466 lt!439060)))))

(assert (=> d!117607 (= lt!439181 (lemmaContainsTupThenGetReturnValue!273 lt!439180 (_1!7466 lt!439060) (_2!7466 lt!439060)))))

(assert (=> d!117607 (= lt!439180 (insertStrictlySorted!330 (toList!6820 (+!3113 lt!439058 lt!439057)) (_1!7466 lt!439060) (_2!7466 lt!439060)))))

(assert (=> d!117607 (= (+!3113 (+!3113 lt!439058 lt!439057) lt!439060) lt!439179)))

(declare-fun b!990106 () Bool)

(declare-fun res!661933 () Bool)

(assert (=> b!990106 (=> (not res!661933) (not e!558361))))

(assert (=> b!990106 (= res!661933 (= (getValueByKey!511 (toList!6820 lt!439179) (_1!7466 lt!439060)) (Some!516 (_2!7466 lt!439060))))))

(declare-fun b!990107 () Bool)

(assert (=> b!990107 (= e!558361 (contains!5741 (toList!6820 lt!439179) lt!439060))))

(assert (= (and d!117607 res!661934) b!990106))

(assert (= (and b!990106 res!661933) b!990107))

(declare-fun m!917663 () Bool)

(assert (=> d!117607 m!917663))

(declare-fun m!917665 () Bool)

(assert (=> d!117607 m!917665))

(declare-fun m!917667 () Bool)

(assert (=> d!117607 m!917667))

(declare-fun m!917669 () Bool)

(assert (=> d!117607 m!917669))

(declare-fun m!917671 () Bool)

(assert (=> b!990106 m!917671))

(declare-fun m!917673 () Bool)

(assert (=> b!990107 m!917673))

(assert (=> b!989956 d!117607))

(declare-fun d!117609 () Bool)

(declare-fun e!558362 () Bool)

(assert (=> d!117609 e!558362))

(declare-fun res!661936 () Bool)

(assert (=> d!117609 (=> (not res!661936) (not e!558362))))

(declare-fun lt!439183 () ListLongMap!13609)

(assert (=> d!117609 (= res!661936 (contains!5740 lt!439183 (_1!7466 lt!439060)))))

(declare-fun lt!439184 () List!20816)

(assert (=> d!117609 (= lt!439183 (ListLongMap!13610 lt!439184))))

(declare-fun lt!439182 () Unit!32822)

(declare-fun lt!439185 () Unit!32822)

(assert (=> d!117609 (= lt!439182 lt!439185)))

(assert (=> d!117609 (= (getValueByKey!511 lt!439184 (_1!7466 lt!439060)) (Some!516 (_2!7466 lt!439060)))))

(assert (=> d!117609 (= lt!439185 (lemmaContainsTupThenGetReturnValue!273 lt!439184 (_1!7466 lt!439060) (_2!7466 lt!439060)))))

(assert (=> d!117609 (= lt!439184 (insertStrictlySorted!330 (toList!6820 lt!439058) (_1!7466 lt!439060) (_2!7466 lt!439060)))))

(assert (=> d!117609 (= (+!3113 lt!439058 lt!439060) lt!439183)))

(declare-fun b!990108 () Bool)

(declare-fun res!661935 () Bool)

(assert (=> b!990108 (=> (not res!661935) (not e!558362))))

(assert (=> b!990108 (= res!661935 (= (getValueByKey!511 (toList!6820 lt!439183) (_1!7466 lt!439060)) (Some!516 (_2!7466 lt!439060))))))

(declare-fun b!990109 () Bool)

(assert (=> b!990109 (= e!558362 (contains!5741 (toList!6820 lt!439183) lt!439060))))

(assert (= (and d!117609 res!661936) b!990108))

(assert (= (and b!990108 res!661935) b!990109))

(declare-fun m!917675 () Bool)

(assert (=> d!117609 m!917675))

(declare-fun m!917677 () Bool)

(assert (=> d!117609 m!917677))

(declare-fun m!917679 () Bool)

(assert (=> d!117609 m!917679))

(declare-fun m!917681 () Bool)

(assert (=> d!117609 m!917681))

(declare-fun m!917683 () Bool)

(assert (=> b!990108 m!917683))

(declare-fun m!917685 () Bool)

(assert (=> b!990109 m!917685))

(assert (=> b!989956 d!117609))

(declare-fun d!117611 () Bool)

(assert (=> d!117611 (= (+!3113 (+!3113 lt!439058 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061)) (+!3113 (+!3113 lt!439058 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061)) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun lt!439188 () Unit!32822)

(declare-fun choose!1616 (ListLongMap!13609 (_ BitVec 64) V!35993 (_ BitVec 64) V!35993) Unit!32822)

(assert (=> d!117611 (= lt!439188 (choose!1616 lt!439058 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30109 _keys!1544) from!1932) lt!439061))))

(assert (=> d!117611 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30109 _keys!1544) from!1932)))))

(assert (=> d!117611 (= (addCommutativeForDiffKeys!715 lt!439058 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30109 _keys!1544) from!1932) lt!439061) lt!439188)))

(declare-fun bs!28089 () Bool)

(assert (= bs!28089 d!117611))

(assert (=> bs!28089 m!917455))

(declare-fun m!917687 () Bool)

(assert (=> bs!28089 m!917687))

(declare-fun m!917689 () Bool)

(assert (=> bs!28089 m!917689))

(declare-fun m!917691 () Bool)

(assert (=> bs!28089 m!917691))

(declare-fun m!917693 () Bool)

(assert (=> bs!28089 m!917693))

(declare-fun m!917695 () Bool)

(assert (=> bs!28089 m!917695))

(assert (=> bs!28089 m!917689))

(assert (=> bs!28089 m!917693))

(assert (=> b!989956 d!117611))

(declare-fun b!990110 () Bool)

(declare-fun e!558366 () ListLongMap!13609)

(declare-fun call!41960 () ListLongMap!13609)

(assert (=> b!990110 (= e!558366 call!41960)))

(declare-fun b!990111 () Bool)

(declare-fun e!558373 () Bool)

(declare-fun call!41959 () Bool)

(assert (=> b!990111 (= e!558373 (not call!41959))))

(declare-fun b!990112 () Bool)

(declare-fun e!558371 () ListLongMap!13609)

(declare-fun call!41961 () ListLongMap!13609)

(assert (=> b!990112 (= e!558371 (+!3113 call!41961 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun b!990113 () Bool)

(declare-fun e!558369 () Bool)

(declare-fun call!41958 () Bool)

(assert (=> b!990113 (= e!558369 (not call!41958))))

(declare-fun bm!41955 () Bool)

(declare-fun call!41964 () ListLongMap!13609)

(assert (=> bm!41955 (= call!41964 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun b!990114 () Bool)

(declare-fun res!661937 () Bool)

(declare-fun e!558368 () Bool)

(assert (=> b!990114 (=> (not res!661937) (not e!558368))))

(assert (=> b!990114 (= res!661937 e!558369)))

(declare-fun c!100546 () Bool)

(assert (=> b!990114 (= c!100546 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41956 () Bool)

(declare-fun call!41963 () ListLongMap!13609)

(assert (=> bm!41956 (= call!41963 call!41961)))

(declare-fun bm!41957 () Bool)

(declare-fun lt!439203 () ListLongMap!13609)

(assert (=> bm!41957 (= call!41959 (contains!5740 lt!439203 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990115 () Bool)

(declare-fun e!558367 () Bool)

(assert (=> b!990115 (= e!558367 (validKeyInArray!0 (select (arr!30109 _keys!1544) from!1932)))))

(declare-fun b!990116 () Bool)

(assert (=> b!990116 (= e!558368 e!558373)))

(declare-fun c!100543 () Bool)

(assert (=> b!990116 (= c!100543 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!990117 () Bool)

(declare-fun e!558372 () Bool)

(assert (=> b!990117 (= e!558372 (= (apply!904 lt!439203 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun b!990118 () Bool)

(assert (=> b!990118 (= e!558369 e!558372)))

(declare-fun res!661941 () Bool)

(assert (=> b!990118 (= res!661941 call!41958)))

(assert (=> b!990118 (=> (not res!661941) (not e!558372))))

(declare-fun d!117613 () Bool)

(assert (=> d!117613 e!558368))

(declare-fun res!661939 () Bool)

(assert (=> d!117613 (=> (not res!661939) (not e!558368))))

(assert (=> d!117613 (= res!661939 (or (bvsge from!1932 (size!30589 _keys!1544)) (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30589 _keys!1544)))))))

(declare-fun lt!439191 () ListLongMap!13609)

(assert (=> d!117613 (= lt!439203 lt!439191)))

(declare-fun lt!439197 () Unit!32822)

(declare-fun e!558365 () Unit!32822)

(assert (=> d!117613 (= lt!439197 e!558365)))

(declare-fun c!100544 () Bool)

(declare-fun e!558370 () Bool)

(assert (=> d!117613 (= c!100544 e!558370)))

(declare-fun res!661943 () Bool)

(assert (=> d!117613 (=> (not res!661943) (not e!558370))))

(assert (=> d!117613 (= res!661943 (bvslt from!1932 (size!30589 _keys!1544)))))

(assert (=> d!117613 (= lt!439191 e!558371)))

(declare-fun c!100545 () Bool)

(assert (=> d!117613 (= c!100545 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117613 (validMask!0 mask!1948)))

(assert (=> d!117613 (= (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!439203)))

(declare-fun b!990119 () Bool)

(declare-fun e!558374 () ListLongMap!13609)

(assert (=> b!990119 (= e!558374 call!41963)))

(declare-fun b!990120 () Bool)

(assert (=> b!990120 (= e!558366 call!41963)))

(declare-fun b!990121 () Bool)

(declare-fun res!661938 () Bool)

(assert (=> b!990121 (=> (not res!661938) (not e!558368))))

(declare-fun e!558363 () Bool)

(assert (=> b!990121 (= res!661938 e!558363)))

(declare-fun res!661945 () Bool)

(assert (=> b!990121 (=> res!661945 e!558363)))

(assert (=> b!990121 (= res!661945 (not e!558367))))

(declare-fun res!661940 () Bool)

(assert (=> b!990121 (=> (not res!661940) (not e!558367))))

(assert (=> b!990121 (= res!661940 (bvslt from!1932 (size!30589 _keys!1544)))))

(declare-fun e!558364 () Bool)

(declare-fun b!990122 () Bool)

(assert (=> b!990122 (= e!558364 (= (apply!904 lt!439203 (select (arr!30109 _keys!1544) from!1932)) (get!15652 (select (arr!30108 _values!1278) from!1932) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990122 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30588 _values!1278)))))

(assert (=> b!990122 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30589 _keys!1544)))))

(declare-fun bm!41958 () Bool)

(declare-fun call!41962 () ListLongMap!13609)

(assert (=> bm!41958 (= call!41962 call!41964)))

(declare-fun b!990123 () Bool)

(assert (=> b!990123 (= e!558371 e!558374)))

(declare-fun c!100547 () Bool)

(assert (=> b!990123 (= c!100547 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!990124 () Bool)

(declare-fun Unit!32825 () Unit!32822)

(assert (=> b!990124 (= e!558365 Unit!32825)))

(declare-fun bm!41959 () Bool)

(assert (=> bm!41959 (= call!41961 (+!3113 (ite c!100545 call!41964 (ite c!100547 call!41962 call!41960)) (ite (or c!100545 c!100547) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun bm!41960 () Bool)

(assert (=> bm!41960 (= call!41958 (contains!5740 lt!439203 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990125 () Bool)

(declare-fun c!100548 () Bool)

(assert (=> b!990125 (= c!100548 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!990125 (= e!558374 e!558366)))

(declare-fun b!990126 () Bool)

(assert (=> b!990126 (= e!558370 (validKeyInArray!0 (select (arr!30109 _keys!1544) from!1932)))))

(declare-fun b!990127 () Bool)

(assert (=> b!990127 (= e!558363 e!558364)))

(declare-fun res!661944 () Bool)

(assert (=> b!990127 (=> (not res!661944) (not e!558364))))

(assert (=> b!990127 (= res!661944 (contains!5740 lt!439203 (select (arr!30109 _keys!1544) from!1932)))))

(assert (=> b!990127 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30589 _keys!1544)))))

(declare-fun b!990128 () Bool)

(declare-fun e!558375 () Bool)

(assert (=> b!990128 (= e!558375 (= (apply!904 lt!439203 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun b!990129 () Bool)

(declare-fun lt!439190 () Unit!32822)

(assert (=> b!990129 (= e!558365 lt!439190)))

(declare-fun lt!439207 () ListLongMap!13609)

(assert (=> b!990129 (= lt!439207 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439206 () (_ BitVec 64))

(assert (=> b!990129 (= lt!439206 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439199 () (_ BitVec 64))

(assert (=> b!990129 (= lt!439199 (select (arr!30109 _keys!1544) from!1932))))

(declare-fun lt!439209 () Unit!32822)

(assert (=> b!990129 (= lt!439209 (addStillContains!615 lt!439207 lt!439206 zeroValue!1220 lt!439199))))

(assert (=> b!990129 (contains!5740 (+!3113 lt!439207 (tuple2!14911 lt!439206 zeroValue!1220)) lt!439199)))

(declare-fun lt!439194 () Unit!32822)

(assert (=> b!990129 (= lt!439194 lt!439209)))

(declare-fun lt!439192 () ListLongMap!13609)

(assert (=> b!990129 (= lt!439192 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439200 () (_ BitVec 64))

(assert (=> b!990129 (= lt!439200 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439204 () (_ BitVec 64))

(assert (=> b!990129 (= lt!439204 (select (arr!30109 _keys!1544) from!1932))))

(declare-fun lt!439196 () Unit!32822)

(assert (=> b!990129 (= lt!439196 (addApplyDifferent!471 lt!439192 lt!439200 minValue!1220 lt!439204))))

(assert (=> b!990129 (= (apply!904 (+!3113 lt!439192 (tuple2!14911 lt!439200 minValue!1220)) lt!439204) (apply!904 lt!439192 lt!439204))))

(declare-fun lt!439210 () Unit!32822)

(assert (=> b!990129 (= lt!439210 lt!439196)))

(declare-fun lt!439193 () ListLongMap!13609)

(assert (=> b!990129 (= lt!439193 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439202 () (_ BitVec 64))

(assert (=> b!990129 (= lt!439202 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439205 () (_ BitVec 64))

(assert (=> b!990129 (= lt!439205 (select (arr!30109 _keys!1544) from!1932))))

(declare-fun lt!439198 () Unit!32822)

(assert (=> b!990129 (= lt!439198 (addApplyDifferent!471 lt!439193 lt!439202 zeroValue!1220 lt!439205))))

(assert (=> b!990129 (= (apply!904 (+!3113 lt!439193 (tuple2!14911 lt!439202 zeroValue!1220)) lt!439205) (apply!904 lt!439193 lt!439205))))

(declare-fun lt!439208 () Unit!32822)

(assert (=> b!990129 (= lt!439208 lt!439198)))

(declare-fun lt!439195 () ListLongMap!13609)

(assert (=> b!990129 (= lt!439195 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439201 () (_ BitVec 64))

(assert (=> b!990129 (= lt!439201 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439189 () (_ BitVec 64))

(assert (=> b!990129 (= lt!439189 (select (arr!30109 _keys!1544) from!1932))))

(assert (=> b!990129 (= lt!439190 (addApplyDifferent!471 lt!439195 lt!439201 minValue!1220 lt!439189))))

(assert (=> b!990129 (= (apply!904 (+!3113 lt!439195 (tuple2!14911 lt!439201 minValue!1220)) lt!439189) (apply!904 lt!439195 lt!439189))))

(declare-fun b!990130 () Bool)

(assert (=> b!990130 (= e!558373 e!558375)))

(declare-fun res!661942 () Bool)

(assert (=> b!990130 (= res!661942 call!41959)))

(assert (=> b!990130 (=> (not res!661942) (not e!558375))))

(declare-fun bm!41961 () Bool)

(assert (=> bm!41961 (= call!41960 call!41962)))

(assert (= (and d!117613 c!100545) b!990112))

(assert (= (and d!117613 (not c!100545)) b!990123))

(assert (= (and b!990123 c!100547) b!990119))

(assert (= (and b!990123 (not c!100547)) b!990125))

(assert (= (and b!990125 c!100548) b!990120))

(assert (= (and b!990125 (not c!100548)) b!990110))

(assert (= (or b!990120 b!990110) bm!41961))

(assert (= (or b!990119 bm!41961) bm!41958))

(assert (= (or b!990119 b!990120) bm!41956))

(assert (= (or b!990112 bm!41958) bm!41955))

(assert (= (or b!990112 bm!41956) bm!41959))

(assert (= (and d!117613 res!661943) b!990126))

(assert (= (and d!117613 c!100544) b!990129))

(assert (= (and d!117613 (not c!100544)) b!990124))

(assert (= (and d!117613 res!661939) b!990121))

(assert (= (and b!990121 res!661940) b!990115))

(assert (= (and b!990121 (not res!661945)) b!990127))

(assert (= (and b!990127 res!661944) b!990122))

(assert (= (and b!990121 res!661938) b!990114))

(assert (= (and b!990114 c!100546) b!990118))

(assert (= (and b!990114 (not c!100546)) b!990113))

(assert (= (and b!990118 res!661941) b!990117))

(assert (= (or b!990118 b!990113) bm!41960))

(assert (= (and b!990114 res!661937) b!990116))

(assert (= (and b!990116 c!100543) b!990130))

(assert (= (and b!990116 (not c!100543)) b!990111))

(assert (= (and b!990130 res!661942) b!990128))

(assert (= (or b!990130 b!990111) bm!41957))

(declare-fun b_lambda!15121 () Bool)

(assert (=> (not b_lambda!15121) (not b!990122)))

(assert (=> b!990122 t!29759))

(declare-fun b_and!32175 () Bool)

(assert (= b_and!32173 (and (=> t!29759 result!13595) b_and!32175)))

(declare-fun m!917697 () Bool)

(assert (=> b!990112 m!917697))

(declare-fun m!917699 () Bool)

(assert (=> bm!41960 m!917699))

(assert (=> b!990126 m!917455))

(assert (=> b!990126 m!917455))

(assert (=> b!990126 m!917469))

(declare-fun m!917701 () Bool)

(assert (=> b!990117 m!917701))

(assert (=> b!990115 m!917455))

(assert (=> b!990115 m!917455))

(assert (=> b!990115 m!917469))

(declare-fun m!917703 () Bool)

(assert (=> b!990128 m!917703))

(assert (=> b!990127 m!917455))

(assert (=> b!990127 m!917455))

(declare-fun m!917705 () Bool)

(assert (=> b!990127 m!917705))

(declare-fun m!917707 () Bool)

(assert (=> bm!41959 m!917707))

(assert (=> d!117613 m!917471))

(assert (=> b!990122 m!917457))

(assert (=> b!990122 m!917461))

(assert (=> b!990122 m!917463))

(assert (=> b!990122 m!917461))

(assert (=> b!990122 m!917457))

(assert (=> b!990122 m!917455))

(declare-fun m!917709 () Bool)

(assert (=> b!990122 m!917709))

(assert (=> b!990122 m!917455))

(declare-fun m!917711 () Bool)

(assert (=> bm!41955 m!917711))

(declare-fun m!917713 () Bool)

(assert (=> bm!41957 m!917713))

(declare-fun m!917715 () Bool)

(assert (=> b!990129 m!917715))

(declare-fun m!917717 () Bool)

(assert (=> b!990129 m!917717))

(declare-fun m!917719 () Bool)

(assert (=> b!990129 m!917719))

(declare-fun m!917721 () Bool)

(assert (=> b!990129 m!917721))

(declare-fun m!917723 () Bool)

(assert (=> b!990129 m!917723))

(declare-fun m!917725 () Bool)

(assert (=> b!990129 m!917725))

(declare-fun m!917727 () Bool)

(assert (=> b!990129 m!917727))

(declare-fun m!917729 () Bool)

(assert (=> b!990129 m!917729))

(assert (=> b!990129 m!917455))

(declare-fun m!917731 () Bool)

(assert (=> b!990129 m!917731))

(declare-fun m!917733 () Bool)

(assert (=> b!990129 m!917733))

(declare-fun m!917735 () Bool)

(assert (=> b!990129 m!917735))

(assert (=> b!990129 m!917727))

(declare-fun m!917737 () Bool)

(assert (=> b!990129 m!917737))

(assert (=> b!990129 m!917711))

(declare-fun m!917739 () Bool)

(assert (=> b!990129 m!917739))

(assert (=> b!990129 m!917723))

(declare-fun m!917741 () Bool)

(assert (=> b!990129 m!917741))

(declare-fun m!917743 () Bool)

(assert (=> b!990129 m!917743))

(assert (=> b!990129 m!917717))

(assert (=> b!990129 m!917741))

(assert (=> b!989956 d!117613))

(declare-fun d!117615 () Bool)

(assert (=> d!117615 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84728 d!117615))

(declare-fun d!117617 () Bool)

(assert (=> d!117617 (= (array_inv!23285 _values!1278) (bvsge (size!30588 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84728 d!117617))

(declare-fun d!117619 () Bool)

(assert (=> d!117619 (= (array_inv!23286 _keys!1544) (bvsge (size!30589 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84728 d!117619))

(declare-fun d!117621 () Bool)

(assert (=> d!117621 (= (validKeyInArray!0 (select (arr!30109 _keys!1544) from!1932)) (and (not (= (select (arr!30109 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30109 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!989955 d!117621))

(declare-fun d!117623 () Bool)

(declare-fun c!100551 () Bool)

(assert (=> d!117623 (= c!100551 ((_ is ValueCellFull!11147) (select (arr!30108 _values!1278) from!1932)))))

(declare-fun e!558378 () V!35993)

(assert (=> d!117623 (= (get!15652 (select (arr!30108 _values!1278) from!1932) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!558378)))

(declare-fun b!990135 () Bool)

(declare-fun get!15653 (ValueCell!11147 V!35993) V!35993)

(assert (=> b!990135 (= e!558378 (get!15653 (select (arr!30108 _values!1278) from!1932) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990136 () Bool)

(declare-fun get!15654 (ValueCell!11147 V!35993) V!35993)

(assert (=> b!990136 (= e!558378 (get!15654 (select (arr!30108 _values!1278) from!1932) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117623 c!100551) b!990135))

(assert (= (and d!117623 (not c!100551)) b!990136))

(assert (=> b!990135 m!917457))

(assert (=> b!990135 m!917461))

(declare-fun m!917745 () Bool)

(assert (=> b!990135 m!917745))

(assert (=> b!990136 m!917457))

(assert (=> b!990136 m!917461))

(declare-fun m!917747 () Bool)

(assert (=> b!990136 m!917747))

(assert (=> b!989959 d!117623))

(declare-fun b!990161 () Bool)

(declare-fun e!558397 () Bool)

(declare-fun e!558394 () Bool)

(assert (=> b!990161 (= e!558397 e!558394)))

(declare-fun c!100563 () Bool)

(assert (=> b!990161 (= c!100563 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30589 _keys!1544)))))

(declare-fun b!990162 () Bool)

(declare-fun e!558398 () ListLongMap!13609)

(declare-fun call!41967 () ListLongMap!13609)

(assert (=> b!990162 (= e!558398 call!41967)))

(declare-fun b!990163 () Bool)

(declare-fun e!558393 () Bool)

(assert (=> b!990163 (= e!558393 e!558397)))

(declare-fun c!100561 () Bool)

(declare-fun e!558396 () Bool)

(assert (=> b!990163 (= c!100561 e!558396)))

(declare-fun res!661954 () Bool)

(assert (=> b!990163 (=> (not res!661954) (not e!558396))))

(assert (=> b!990163 (= res!661954 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30589 _keys!1544)))))

(declare-fun b!990164 () Bool)

(declare-fun e!558395 () Bool)

(assert (=> b!990164 (= e!558397 e!558395)))

(assert (=> b!990164 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30589 _keys!1544)))))

(declare-fun res!661957 () Bool)

(declare-fun lt!439229 () ListLongMap!13609)

(assert (=> b!990164 (= res!661957 (contains!5740 lt!439229 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990164 (=> (not res!661957) (not e!558395))))

(declare-fun bm!41964 () Bool)

(assert (=> bm!41964 (= call!41967 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!990165 () Bool)

(declare-fun e!558399 () ListLongMap!13609)

(assert (=> b!990165 (= e!558399 e!558398)))

(declare-fun c!100562 () Bool)

(assert (=> b!990165 (= c!100562 (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990166 () Bool)

(assert (=> b!990166 (= e!558399 (ListLongMap!13610 Nil!20813))))

(declare-fun b!990167 () Bool)

(declare-fun isEmpty!729 (ListLongMap!13609) Bool)

(assert (=> b!990167 (= e!558394 (isEmpty!729 lt!439229))))

(declare-fun b!990168 () Bool)

(assert (=> b!990168 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30589 _keys!1544)))))

(assert (=> b!990168 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30588 _values!1278)))))

(assert (=> b!990168 (= e!558395 (= (apply!904 lt!439229 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!990169 () Bool)

(declare-fun res!661955 () Bool)

(assert (=> b!990169 (=> (not res!661955) (not e!558393))))

(assert (=> b!990169 (= res!661955 (not (contains!5740 lt!439229 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990170 () Bool)

(assert (=> b!990170 (= e!558394 (= lt!439229 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun d!117625 () Bool)

(assert (=> d!117625 e!558393))

(declare-fun res!661956 () Bool)

(assert (=> d!117625 (=> (not res!661956) (not e!558393))))

(assert (=> d!117625 (= res!661956 (not (contains!5740 lt!439229 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117625 (= lt!439229 e!558399)))

(declare-fun c!100560 () Bool)

(assert (=> d!117625 (= c!100560 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30589 _keys!1544)))))

(assert (=> d!117625 (validMask!0 mask!1948)))

(assert (=> d!117625 (= (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439229)))

(declare-fun b!990171 () Bool)

(declare-fun lt!439228 () Unit!32822)

(declare-fun lt!439226 () Unit!32822)

(assert (=> b!990171 (= lt!439228 lt!439226)))

(declare-fun lt!439231 () (_ BitVec 64))

(declare-fun lt!439227 () (_ BitVec 64))

(declare-fun lt!439230 () ListLongMap!13609)

(declare-fun lt!439225 () V!35993)

(assert (=> b!990171 (not (contains!5740 (+!3113 lt!439230 (tuple2!14911 lt!439227 lt!439225)) lt!439231))))

(declare-fun addStillNotContains!236 (ListLongMap!13609 (_ BitVec 64) V!35993 (_ BitVec 64)) Unit!32822)

(assert (=> b!990171 (= lt!439226 (addStillNotContains!236 lt!439230 lt!439227 lt!439225 lt!439231))))

(assert (=> b!990171 (= lt!439231 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!990171 (= lt!439225 (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!990171 (= lt!439227 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!990171 (= lt!439230 call!41967)))

(assert (=> b!990171 (= e!558398 (+!3113 call!41967 (tuple2!14911 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!990172 () Bool)

(assert (=> b!990172 (= e!558396 (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990172 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(assert (= (and d!117625 c!100560) b!990166))

(assert (= (and d!117625 (not c!100560)) b!990165))

(assert (= (and b!990165 c!100562) b!990171))

(assert (= (and b!990165 (not c!100562)) b!990162))

(assert (= (or b!990171 b!990162) bm!41964))

(assert (= (and d!117625 res!661956) b!990169))

(assert (= (and b!990169 res!661955) b!990163))

(assert (= (and b!990163 res!661954) b!990172))

(assert (= (and b!990163 c!100561) b!990164))

(assert (= (and b!990163 (not c!100561)) b!990161))

(assert (= (and b!990164 res!661957) b!990168))

(assert (= (and b!990161 c!100563) b!990170))

(assert (= (and b!990161 (not c!100563)) b!990167))

(declare-fun b_lambda!15123 () Bool)

(assert (=> (not b_lambda!15123) (not b!990168)))

(assert (=> b!990168 t!29759))

(declare-fun b_and!32177 () Bool)

(assert (= b_and!32175 (and (=> t!29759 result!13595) b_and!32177)))

(declare-fun b_lambda!15125 () Bool)

(assert (=> (not b_lambda!15125) (not b!990171)))

(assert (=> b!990171 t!29759))

(declare-fun b_and!32179 () Bool)

(assert (= b_and!32177 (and (=> t!29759 result!13595) b_and!32179)))

(assert (=> b!990165 m!917613))

(assert (=> b!990165 m!917613))

(assert (=> b!990165 m!917615))

(declare-fun m!917749 () Bool)

(assert (=> b!990170 m!917749))

(assert (=> b!990168 m!917625))

(assert (=> b!990168 m!917461))

(assert (=> b!990168 m!917613))

(assert (=> b!990168 m!917625))

(assert (=> b!990168 m!917461))

(assert (=> b!990168 m!917627))

(assert (=> b!990168 m!917613))

(declare-fun m!917751 () Bool)

(assert (=> b!990168 m!917751))

(assert (=> b!990172 m!917613))

(assert (=> b!990172 m!917613))

(assert (=> b!990172 m!917615))

(assert (=> bm!41964 m!917749))

(declare-fun m!917753 () Bool)

(assert (=> b!990171 m!917753))

(declare-fun m!917755 () Bool)

(assert (=> b!990171 m!917755))

(assert (=> b!990171 m!917461))

(assert (=> b!990171 m!917613))

(assert (=> b!990171 m!917625))

(assert (=> b!990171 m!917461))

(assert (=> b!990171 m!917627))

(assert (=> b!990171 m!917625))

(declare-fun m!917757 () Bool)

(assert (=> b!990171 m!917757))

(assert (=> b!990171 m!917753))

(declare-fun m!917759 () Bool)

(assert (=> b!990171 m!917759))

(assert (=> b!990164 m!917613))

(assert (=> b!990164 m!917613))

(declare-fun m!917761 () Bool)

(assert (=> b!990164 m!917761))

(declare-fun m!917763 () Bool)

(assert (=> b!990167 m!917763))

(declare-fun m!917765 () Bool)

(assert (=> b!990169 m!917765))

(declare-fun m!917767 () Bool)

(assert (=> d!117625 m!917767))

(assert (=> d!117625 m!917471))

(assert (=> b!989959 d!117625))

(declare-fun bm!41967 () Bool)

(declare-fun call!41970 () Bool)

(assert (=> bm!41967 (= call!41970 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!990181 () Bool)

(declare-fun e!558406 () Bool)

(declare-fun e!558407 () Bool)

(assert (=> b!990181 (= e!558406 e!558407)))

(declare-fun lt!439239 () (_ BitVec 64))

(assert (=> b!990181 (= lt!439239 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!439240 () Unit!32822)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62520 (_ BitVec 64) (_ BitVec 32)) Unit!32822)

(assert (=> b!990181 (= lt!439240 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439239 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!990181 (arrayContainsKey!0 _keys!1544 lt!439239 #b00000000000000000000000000000000)))

(declare-fun lt!439238 () Unit!32822)

(assert (=> b!990181 (= lt!439238 lt!439240)))

(declare-fun res!661963 () Bool)

(declare-datatypes ((SeekEntryResult!9165 0))(
  ( (MissingZero!9165 (index!39031 (_ BitVec 32))) (Found!9165 (index!39032 (_ BitVec 32))) (Intermediate!9165 (undefined!9977 Bool) (index!39033 (_ BitVec 32)) (x!86061 (_ BitVec 32))) (Undefined!9165) (MissingVacant!9165 (index!39034 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62520 (_ BitVec 32)) SeekEntryResult!9165)

(assert (=> b!990181 (= res!661963 (= (seekEntryOrOpen!0 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9165 #b00000000000000000000000000000000)))))

(assert (=> b!990181 (=> (not res!661963) (not e!558407))))

(declare-fun b!990182 () Bool)

(declare-fun e!558408 () Bool)

(assert (=> b!990182 (= e!558408 e!558406)))

(declare-fun c!100566 () Bool)

(assert (=> b!990182 (= c!100566 (validKeyInArray!0 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!117627 () Bool)

(declare-fun res!661962 () Bool)

(assert (=> d!117627 (=> res!661962 e!558408)))

(assert (=> d!117627 (= res!661962 (bvsge #b00000000000000000000000000000000 (size!30589 _keys!1544)))))

(assert (=> d!117627 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!558408)))

(declare-fun b!990183 () Bool)

(assert (=> b!990183 (= e!558407 call!41970)))

(declare-fun b!990184 () Bool)

(assert (=> b!990184 (= e!558406 call!41970)))

(assert (= (and d!117627 (not res!661962)) b!990182))

(assert (= (and b!990182 c!100566) b!990181))

(assert (= (and b!990182 (not c!100566)) b!990184))

(assert (= (and b!990181 res!661963) b!990183))

(assert (= (or b!990183 b!990184) bm!41967))

(declare-fun m!917769 () Bool)

(assert (=> bm!41967 m!917769))

(declare-fun m!917771 () Bool)

(assert (=> b!990181 m!917771))

(declare-fun m!917773 () Bool)

(assert (=> b!990181 m!917773))

(declare-fun m!917775 () Bool)

(assert (=> b!990181 m!917775))

(assert (=> b!990181 m!917771))

(declare-fun m!917777 () Bool)

(assert (=> b!990181 m!917777))

(assert (=> b!990182 m!917771))

(assert (=> b!990182 m!917771))

(declare-fun m!917779 () Bool)

(assert (=> b!990182 m!917779))

(assert (=> b!989952 d!117627))

(declare-fun b!990195 () Bool)

(declare-fun e!558419 () Bool)

(declare-fun e!558418 () Bool)

(assert (=> b!990195 (= e!558419 e!558418)))

(declare-fun c!100569 () Bool)

(assert (=> b!990195 (= c!100569 (validKeyInArray!0 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!117629 () Bool)

(declare-fun res!661970 () Bool)

(declare-fun e!558417 () Bool)

(assert (=> d!117629 (=> res!661970 e!558417)))

(assert (=> d!117629 (= res!661970 (bvsge #b00000000000000000000000000000000 (size!30589 _keys!1544)))))

(assert (=> d!117629 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20812) e!558417)))

(declare-fun b!990196 () Bool)

(declare-fun call!41973 () Bool)

(assert (=> b!990196 (= e!558418 call!41973)))

(declare-fun b!990197 () Bool)

(assert (=> b!990197 (= e!558418 call!41973)))

(declare-fun b!990198 () Bool)

(assert (=> b!990198 (= e!558417 e!558419)))

(declare-fun res!661971 () Bool)

(assert (=> b!990198 (=> (not res!661971) (not e!558419))))

(declare-fun e!558420 () Bool)

(assert (=> b!990198 (= res!661971 (not e!558420))))

(declare-fun res!661972 () Bool)

(assert (=> b!990198 (=> (not res!661972) (not e!558420))))

(assert (=> b!990198 (= res!661972 (validKeyInArray!0 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!990199 () Bool)

(declare-fun contains!5742 (List!20815 (_ BitVec 64)) Bool)

(assert (=> b!990199 (= e!558420 (contains!5742 Nil!20812 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41970 () Bool)

(assert (=> bm!41970 (= call!41973 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100569 (Cons!20811 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) Nil!20812) Nil!20812)))))

(assert (= (and d!117629 (not res!661970)) b!990198))

(assert (= (and b!990198 res!661972) b!990199))

(assert (= (and b!990198 res!661971) b!990195))

(assert (= (and b!990195 c!100569) b!990196))

(assert (= (and b!990195 (not c!100569)) b!990197))

(assert (= (or b!990196 b!990197) bm!41970))

(assert (=> b!990195 m!917771))

(assert (=> b!990195 m!917771))

(assert (=> b!990195 m!917779))

(assert (=> b!990198 m!917771))

(assert (=> b!990198 m!917771))

(assert (=> b!990198 m!917779))

(assert (=> b!990199 m!917771))

(assert (=> b!990199 m!917771))

(declare-fun m!917781 () Bool)

(assert (=> b!990199 m!917781))

(assert (=> bm!41970 m!917771))

(declare-fun m!917783 () Bool)

(assert (=> bm!41970 m!917783))

(assert (=> b!989953 d!117629))

(declare-fun b!990207 () Bool)

(declare-fun e!558426 () Bool)

(assert (=> b!990207 (= e!558426 tp_is_empty!23257)))

(declare-fun mapIsEmpty!36936 () Bool)

(declare-fun mapRes!36936 () Bool)

(assert (=> mapIsEmpty!36936 mapRes!36936))

(declare-fun b!990206 () Bool)

(declare-fun e!558425 () Bool)

(assert (=> b!990206 (= e!558425 tp_is_empty!23257)))

(declare-fun mapNonEmpty!36936 () Bool)

(declare-fun tp!69927 () Bool)

(assert (=> mapNonEmpty!36936 (= mapRes!36936 (and tp!69927 e!558425))))

(declare-fun mapKey!36936 () (_ BitVec 32))

(declare-fun mapValue!36936 () ValueCell!11147)

(declare-fun mapRest!36936 () (Array (_ BitVec 32) ValueCell!11147))

(assert (=> mapNonEmpty!36936 (= mapRest!36927 (store mapRest!36936 mapKey!36936 mapValue!36936))))

(declare-fun condMapEmpty!36936 () Bool)

(declare-fun mapDefault!36936 () ValueCell!11147)

(assert (=> mapNonEmpty!36927 (= condMapEmpty!36936 (= mapRest!36927 ((as const (Array (_ BitVec 32) ValueCell!11147)) mapDefault!36936)))))

(assert (=> mapNonEmpty!36927 (= tp!69912 (and e!558426 mapRes!36936))))

(assert (= (and mapNonEmpty!36927 condMapEmpty!36936) mapIsEmpty!36936))

(assert (= (and mapNonEmpty!36927 (not condMapEmpty!36936)) mapNonEmpty!36936))

(assert (= (and mapNonEmpty!36936 ((_ is ValueCellFull!11147) mapValue!36936)) b!990206))

(assert (= (and mapNonEmpty!36927 ((_ is ValueCellFull!11147) mapDefault!36936)) b!990207))

(declare-fun m!917785 () Bool)

(assert (=> mapNonEmpty!36936 m!917785))

(declare-fun b_lambda!15127 () Bool)

(assert (= b_lambda!15123 (or (and start!84728 b_free!20041) b_lambda!15127)))

(declare-fun b_lambda!15129 () Bool)

(assert (= b_lambda!15119 (or (and start!84728 b_free!20041) b_lambda!15129)))

(declare-fun b_lambda!15131 () Bool)

(assert (= b_lambda!15125 (or (and start!84728 b_free!20041) b_lambda!15131)))

(declare-fun b_lambda!15133 () Bool)

(assert (= b_lambda!15121 (or (and start!84728 b_free!20041) b_lambda!15133)))

(check-sat (not bm!41970) (not b!990182) (not b!990117) (not b!990092) (not b!990037) (not b!990170) (not d!117613) (not b!990040) (not b_lambda!15117) (not bm!41955) (not b!990109) (not b_lambda!15133) (not b!990097) (not b!990171) (not b!990042) (not d!117599) (not b!990181) (not bm!41950) tp_is_empty!23257 (not d!117603) (not bm!41948) (not d!117611) (not b!990198) (not b!990039) (not b!990168) (not b!990164) (not b!990090) (not b!990107) (not d!117605) (not bm!41964) (not b!990129) (not b!990127) (not b!990165) (not b!990038) (not b_lambda!15131) (not b!990112) (not b!990115) (not d!117625) (not b_next!20041) (not bm!41952) (not b!990041) (not b!990136) (not b!990167) (not b!990102) (not b!990103) (not b!990172) (not b!990101) (not d!117607) (not d!117601) (not bm!41953) (not b!990106) (not b_lambda!15127) (not bm!41957) (not b!990104) b_and!32179 (not bm!41959) (not b!990169) (not b!990195) (not b!990108) (not mapNonEmpty!36936) (not b_lambda!15129) (not b!990126) (not b!990135) (not b!990087) (not b!990199) (not b!990122) (not bm!41967) (not d!117609) (not b!990128) (not bm!41960))
(check-sat b_and!32179 (not b_next!20041))
(get-model)

(declare-fun d!117631 () Bool)

(declare-fun e!558432 () Bool)

(assert (=> d!117631 e!558432))

(declare-fun res!661975 () Bool)

(assert (=> d!117631 (=> res!661975 e!558432)))

(declare-fun lt!439249 () Bool)

(assert (=> d!117631 (= res!661975 (not lt!439249))))

(declare-fun lt!439252 () Bool)

(assert (=> d!117631 (= lt!439249 lt!439252)))

(declare-fun lt!439250 () Unit!32822)

(declare-fun e!558431 () Unit!32822)

(assert (=> d!117631 (= lt!439250 e!558431)))

(declare-fun c!100572 () Bool)

(assert (=> d!117631 (= c!100572 lt!439252)))

(declare-fun containsKey!480 (List!20816 (_ BitVec 64)) Bool)

(assert (=> d!117631 (= lt!439252 (containsKey!480 (toList!6820 lt!439105) (_1!7466 lt!439057)))))

(assert (=> d!117631 (= (contains!5740 lt!439105 (_1!7466 lt!439057)) lt!439249)))

(declare-fun b!990214 () Bool)

(declare-fun lt!439251 () Unit!32822)

(assert (=> b!990214 (= e!558431 lt!439251)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!374 (List!20816 (_ BitVec 64)) Unit!32822)

(assert (=> b!990214 (= lt!439251 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 lt!439105) (_1!7466 lt!439057)))))

(declare-fun isDefined!382 (Option!517) Bool)

(assert (=> b!990214 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439105) (_1!7466 lt!439057)))))

(declare-fun b!990215 () Bool)

(declare-fun Unit!32826 () Unit!32822)

(assert (=> b!990215 (= e!558431 Unit!32826)))

(declare-fun b!990216 () Bool)

(assert (=> b!990216 (= e!558432 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439105) (_1!7466 lt!439057))))))

(assert (= (and d!117631 c!100572) b!990214))

(assert (= (and d!117631 (not c!100572)) b!990215))

(assert (= (and d!117631 (not res!661975)) b!990216))

(declare-fun m!917787 () Bool)

(assert (=> d!117631 m!917787))

(declare-fun m!917789 () Bool)

(assert (=> b!990214 m!917789))

(assert (=> b!990214 m!917593))

(assert (=> b!990214 m!917593))

(declare-fun m!917791 () Bool)

(assert (=> b!990214 m!917791))

(assert (=> b!990216 m!917593))

(assert (=> b!990216 m!917593))

(assert (=> b!990216 m!917791))

(assert (=> d!117601 d!117631))

(declare-fun b!990228 () Bool)

(declare-fun e!558438 () Option!517)

(assert (=> b!990228 (= e!558438 None!515)))

(declare-fun b!990227 () Bool)

(assert (=> b!990227 (= e!558438 (getValueByKey!511 (t!29761 lt!439106) (_1!7466 lt!439057)))))

(declare-fun d!117633 () Bool)

(declare-fun c!100577 () Bool)

(assert (=> d!117633 (= c!100577 (and ((_ is Cons!20812) lt!439106) (= (_1!7466 (h!21980 lt!439106)) (_1!7466 lt!439057))))))

(declare-fun e!558437 () Option!517)

(assert (=> d!117633 (= (getValueByKey!511 lt!439106 (_1!7466 lt!439057)) e!558437)))

(declare-fun b!990225 () Bool)

(assert (=> b!990225 (= e!558437 (Some!516 (_2!7466 (h!21980 lt!439106))))))

(declare-fun b!990226 () Bool)

(assert (=> b!990226 (= e!558437 e!558438)))

(declare-fun c!100578 () Bool)

(assert (=> b!990226 (= c!100578 (and ((_ is Cons!20812) lt!439106) (not (= (_1!7466 (h!21980 lt!439106)) (_1!7466 lt!439057)))))))

(assert (= (and d!117633 c!100577) b!990225))

(assert (= (and d!117633 (not c!100577)) b!990226))

(assert (= (and b!990226 c!100578) b!990227))

(assert (= (and b!990226 (not c!100578)) b!990228))

(declare-fun m!917793 () Bool)

(assert (=> b!990227 m!917793))

(assert (=> d!117601 d!117633))

(declare-fun d!117635 () Bool)

(assert (=> d!117635 (= (getValueByKey!511 lt!439106 (_1!7466 lt!439057)) (Some!516 (_2!7466 lt!439057)))))

(declare-fun lt!439255 () Unit!32822)

(declare-fun choose!1617 (List!20816 (_ BitVec 64) V!35993) Unit!32822)

(assert (=> d!117635 (= lt!439255 (choose!1617 lt!439106 (_1!7466 lt!439057) (_2!7466 lt!439057)))))

(declare-fun e!558441 () Bool)

(assert (=> d!117635 e!558441))

(declare-fun res!661980 () Bool)

(assert (=> d!117635 (=> (not res!661980) (not e!558441))))

(declare-fun isStrictlySorted!504 (List!20816) Bool)

(assert (=> d!117635 (= res!661980 (isStrictlySorted!504 lt!439106))))

(assert (=> d!117635 (= (lemmaContainsTupThenGetReturnValue!273 lt!439106 (_1!7466 lt!439057) (_2!7466 lt!439057)) lt!439255)))

(declare-fun b!990233 () Bool)

(declare-fun res!661981 () Bool)

(assert (=> b!990233 (=> (not res!661981) (not e!558441))))

(assert (=> b!990233 (= res!661981 (containsKey!480 lt!439106 (_1!7466 lt!439057)))))

(declare-fun b!990234 () Bool)

(assert (=> b!990234 (= e!558441 (contains!5741 lt!439106 (tuple2!14911 (_1!7466 lt!439057) (_2!7466 lt!439057))))))

(assert (= (and d!117635 res!661980) b!990233))

(assert (= (and b!990233 res!661981) b!990234))

(assert (=> d!117635 m!917587))

(declare-fun m!917795 () Bool)

(assert (=> d!117635 m!917795))

(declare-fun m!917797 () Bool)

(assert (=> d!117635 m!917797))

(declare-fun m!917799 () Bool)

(assert (=> b!990233 m!917799))

(declare-fun m!917801 () Bool)

(assert (=> b!990234 m!917801))

(assert (=> d!117601 d!117635))

(declare-fun b!990255 () Bool)

(declare-fun e!558453 () List!20816)

(declare-fun call!41981 () List!20816)

(assert (=> b!990255 (= e!558453 call!41981)))

(declare-fun b!990256 () Bool)

(declare-fun e!558452 () Bool)

(declare-fun lt!439258 () List!20816)

(assert (=> b!990256 (= e!558452 (contains!5741 lt!439258 (tuple2!14911 (_1!7466 lt!439057) (_2!7466 lt!439057))))))

(declare-fun b!990257 () Bool)

(declare-fun e!558454 () List!20816)

(declare-fun e!558456 () List!20816)

(assert (=> b!990257 (= e!558454 e!558456)))

(declare-fun c!100588 () Bool)

(assert (=> b!990257 (= c!100588 (and ((_ is Cons!20812) (toList!6820 (+!3113 lt!439058 lt!439060))) (= (_1!7466 (h!21980 (toList!6820 (+!3113 lt!439058 lt!439060)))) (_1!7466 lt!439057))))))

(declare-fun b!990259 () Bool)

(declare-fun res!661986 () Bool)

(assert (=> b!990259 (=> (not res!661986) (not e!558452))))

(assert (=> b!990259 (= res!661986 (containsKey!480 lt!439258 (_1!7466 lt!439057)))))

(declare-fun b!990260 () Bool)

(declare-fun call!41982 () List!20816)

(assert (=> b!990260 (= e!558456 call!41982)))

(declare-fun e!558455 () List!20816)

(declare-fun c!100590 () Bool)

(declare-fun call!41980 () List!20816)

(declare-fun bm!41977 () Bool)

(declare-fun $colon$colon!554 (List!20816 tuple2!14910) List!20816)

(assert (=> bm!41977 (= call!41980 ($colon$colon!554 e!558455 (ite c!100590 (h!21980 (toList!6820 (+!3113 lt!439058 lt!439060))) (tuple2!14911 (_1!7466 lt!439057) (_2!7466 lt!439057)))))))

(declare-fun c!100587 () Bool)

(assert (=> bm!41977 (= c!100587 c!100590)))

(declare-fun b!990261 () Bool)

(assert (=> b!990261 (= e!558455 (insertStrictlySorted!330 (t!29761 (toList!6820 (+!3113 lt!439058 lt!439060))) (_1!7466 lt!439057) (_2!7466 lt!439057)))))

(declare-fun b!990262 () Bool)

(assert (=> b!990262 (= e!558453 call!41981)))

(declare-fun bm!41978 () Bool)

(assert (=> bm!41978 (= call!41982 call!41980)))

(declare-fun bm!41979 () Bool)

(assert (=> bm!41979 (= call!41981 call!41982)))

(declare-fun d!117637 () Bool)

(assert (=> d!117637 e!558452))

(declare-fun res!661987 () Bool)

(assert (=> d!117637 (=> (not res!661987) (not e!558452))))

(assert (=> d!117637 (= res!661987 (isStrictlySorted!504 lt!439258))))

(assert (=> d!117637 (= lt!439258 e!558454)))

(assert (=> d!117637 (= c!100590 (and ((_ is Cons!20812) (toList!6820 (+!3113 lt!439058 lt!439060))) (bvslt (_1!7466 (h!21980 (toList!6820 (+!3113 lt!439058 lt!439060)))) (_1!7466 lt!439057))))))

(assert (=> d!117637 (isStrictlySorted!504 (toList!6820 (+!3113 lt!439058 lt!439060)))))

(assert (=> d!117637 (= (insertStrictlySorted!330 (toList!6820 (+!3113 lt!439058 lt!439060)) (_1!7466 lt!439057) (_2!7466 lt!439057)) lt!439258)))

(declare-fun b!990258 () Bool)

(declare-fun c!100589 () Bool)

(assert (=> b!990258 (= c!100589 (and ((_ is Cons!20812) (toList!6820 (+!3113 lt!439058 lt!439060))) (bvsgt (_1!7466 (h!21980 (toList!6820 (+!3113 lt!439058 lt!439060)))) (_1!7466 lt!439057))))))

(assert (=> b!990258 (= e!558456 e!558453)))

(declare-fun b!990263 () Bool)

(assert (=> b!990263 (= e!558454 call!41980)))

(declare-fun b!990264 () Bool)

(assert (=> b!990264 (= e!558455 (ite c!100588 (t!29761 (toList!6820 (+!3113 lt!439058 lt!439060))) (ite c!100589 (Cons!20812 (h!21980 (toList!6820 (+!3113 lt!439058 lt!439060))) (t!29761 (toList!6820 (+!3113 lt!439058 lt!439060)))) Nil!20813)))))

(assert (= (and d!117637 c!100590) b!990263))

(assert (= (and d!117637 (not c!100590)) b!990257))

(assert (= (and b!990257 c!100588) b!990260))

(assert (= (and b!990257 (not c!100588)) b!990258))

(assert (= (and b!990258 c!100589) b!990255))

(assert (= (and b!990258 (not c!100589)) b!990262))

(assert (= (or b!990255 b!990262) bm!41979))

(assert (= (or b!990260 bm!41979) bm!41978))

(assert (= (or b!990263 bm!41978) bm!41977))

(assert (= (and bm!41977 c!100587) b!990261))

(assert (= (and bm!41977 (not c!100587)) b!990264))

(assert (= (and d!117637 res!661987) b!990259))

(assert (= (and b!990259 res!661986) b!990256))

(declare-fun m!917803 () Bool)

(assert (=> b!990261 m!917803))

(declare-fun m!917805 () Bool)

(assert (=> b!990259 m!917805))

(declare-fun m!917807 () Bool)

(assert (=> bm!41977 m!917807))

(declare-fun m!917809 () Bool)

(assert (=> b!990256 m!917809))

(declare-fun m!917811 () Bool)

(assert (=> d!117637 m!917811))

(declare-fun m!917813 () Bool)

(assert (=> d!117637 m!917813))

(assert (=> d!117601 d!117637))

(declare-fun d!117639 () Bool)

(declare-fun e!558458 () Bool)

(assert (=> d!117639 e!558458))

(declare-fun res!661988 () Bool)

(assert (=> d!117639 (=> res!661988 e!558458)))

(declare-fun lt!439259 () Bool)

(assert (=> d!117639 (= res!661988 (not lt!439259))))

(declare-fun lt!439262 () Bool)

(assert (=> d!117639 (= lt!439259 lt!439262)))

(declare-fun lt!439260 () Unit!32822)

(declare-fun e!558457 () Unit!32822)

(assert (=> d!117639 (= lt!439260 e!558457)))

(declare-fun c!100591 () Bool)

(assert (=> d!117639 (= c!100591 lt!439262)))

(assert (=> d!117639 (= lt!439262 (containsKey!480 (toList!6820 lt!439229) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117639 (= (contains!5740 lt!439229 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439259)))

(declare-fun b!990265 () Bool)

(declare-fun lt!439261 () Unit!32822)

(assert (=> b!990265 (= e!558457 lt!439261)))

(assert (=> b!990265 (= lt!439261 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 lt!439229) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990265 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439229) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990266 () Bool)

(declare-fun Unit!32827 () Unit!32822)

(assert (=> b!990266 (= e!558457 Unit!32827)))

(declare-fun b!990267 () Bool)

(assert (=> b!990267 (= e!558458 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439229) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117639 c!100591) b!990265))

(assert (= (and d!117639 (not c!100591)) b!990266))

(assert (= (and d!117639 (not res!661988)) b!990267))

(declare-fun m!917815 () Bool)

(assert (=> d!117639 m!917815))

(declare-fun m!917817 () Bool)

(assert (=> b!990265 m!917817))

(declare-fun m!917819 () Bool)

(assert (=> b!990265 m!917819))

(assert (=> b!990265 m!917819))

(declare-fun m!917821 () Bool)

(assert (=> b!990265 m!917821))

(assert (=> b!990267 m!917819))

(assert (=> b!990267 m!917819))

(assert (=> b!990267 m!917821))

(assert (=> d!117625 d!117639))

(assert (=> d!117625 d!117615))

(declare-fun d!117641 () Bool)

(declare-fun e!558460 () Bool)

(assert (=> d!117641 e!558460))

(declare-fun res!661989 () Bool)

(assert (=> d!117641 (=> res!661989 e!558460)))

(declare-fun lt!439263 () Bool)

(assert (=> d!117641 (= res!661989 (not lt!439263))))

(declare-fun lt!439266 () Bool)

(assert (=> d!117641 (= lt!439263 lt!439266)))

(declare-fun lt!439264 () Unit!32822)

(declare-fun e!558459 () Unit!32822)

(assert (=> d!117641 (= lt!439264 e!558459)))

(declare-fun c!100592 () Bool)

(assert (=> d!117641 (= c!100592 lt!439266)))

(assert (=> d!117641 (= lt!439266 (containsKey!480 (toList!6820 lt!439109) (_1!7466 lt!439060)))))

(assert (=> d!117641 (= (contains!5740 lt!439109 (_1!7466 lt!439060)) lt!439263)))

(declare-fun b!990268 () Bool)

(declare-fun lt!439265 () Unit!32822)

(assert (=> b!990268 (= e!558459 lt!439265)))

(assert (=> b!990268 (= lt!439265 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 lt!439109) (_1!7466 lt!439060)))))

(assert (=> b!990268 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439109) (_1!7466 lt!439060)))))

(declare-fun b!990269 () Bool)

(declare-fun Unit!32828 () Unit!32822)

(assert (=> b!990269 (= e!558459 Unit!32828)))

(declare-fun b!990270 () Bool)

(assert (=> b!990270 (= e!558460 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439109) (_1!7466 lt!439060))))))

(assert (= (and d!117641 c!100592) b!990268))

(assert (= (and d!117641 (not c!100592)) b!990269))

(assert (= (and d!117641 (not res!661989)) b!990270))

(declare-fun m!917823 () Bool)

(assert (=> d!117641 m!917823))

(declare-fun m!917825 () Bool)

(assert (=> b!990268 m!917825))

(assert (=> b!990268 m!917605))

(assert (=> b!990268 m!917605))

(declare-fun m!917827 () Bool)

(assert (=> b!990268 m!917827))

(assert (=> b!990270 m!917605))

(assert (=> b!990270 m!917605))

(assert (=> b!990270 m!917827))

(assert (=> d!117603 d!117641))

(declare-fun b!990274 () Bool)

(declare-fun e!558462 () Option!517)

(assert (=> b!990274 (= e!558462 None!515)))

(declare-fun b!990273 () Bool)

(assert (=> b!990273 (= e!558462 (getValueByKey!511 (t!29761 lt!439110) (_1!7466 lt!439060)))))

(declare-fun d!117643 () Bool)

(declare-fun c!100593 () Bool)

(assert (=> d!117643 (= c!100593 (and ((_ is Cons!20812) lt!439110) (= (_1!7466 (h!21980 lt!439110)) (_1!7466 lt!439060))))))

(declare-fun e!558461 () Option!517)

(assert (=> d!117643 (= (getValueByKey!511 lt!439110 (_1!7466 lt!439060)) e!558461)))

(declare-fun b!990271 () Bool)

(assert (=> b!990271 (= e!558461 (Some!516 (_2!7466 (h!21980 lt!439110))))))

(declare-fun b!990272 () Bool)

(assert (=> b!990272 (= e!558461 e!558462)))

(declare-fun c!100594 () Bool)

(assert (=> b!990272 (= c!100594 (and ((_ is Cons!20812) lt!439110) (not (= (_1!7466 (h!21980 lt!439110)) (_1!7466 lt!439060)))))))

(assert (= (and d!117643 c!100593) b!990271))

(assert (= (and d!117643 (not c!100593)) b!990272))

(assert (= (and b!990272 c!100594) b!990273))

(assert (= (and b!990272 (not c!100594)) b!990274))

(declare-fun m!917829 () Bool)

(assert (=> b!990273 m!917829))

(assert (=> d!117603 d!117643))

(declare-fun d!117645 () Bool)

(assert (=> d!117645 (= (getValueByKey!511 lt!439110 (_1!7466 lt!439060)) (Some!516 (_2!7466 lt!439060)))))

(declare-fun lt!439267 () Unit!32822)

(assert (=> d!117645 (= lt!439267 (choose!1617 lt!439110 (_1!7466 lt!439060) (_2!7466 lt!439060)))))

(declare-fun e!558463 () Bool)

(assert (=> d!117645 e!558463))

(declare-fun res!661990 () Bool)

(assert (=> d!117645 (=> (not res!661990) (not e!558463))))

(assert (=> d!117645 (= res!661990 (isStrictlySorted!504 lt!439110))))

(assert (=> d!117645 (= (lemmaContainsTupThenGetReturnValue!273 lt!439110 (_1!7466 lt!439060) (_2!7466 lt!439060)) lt!439267)))

(declare-fun b!990275 () Bool)

(declare-fun res!661991 () Bool)

(assert (=> b!990275 (=> (not res!661991) (not e!558463))))

(assert (=> b!990275 (= res!661991 (containsKey!480 lt!439110 (_1!7466 lt!439060)))))

(declare-fun b!990276 () Bool)

(assert (=> b!990276 (= e!558463 (contains!5741 lt!439110 (tuple2!14911 (_1!7466 lt!439060) (_2!7466 lt!439060))))))

(assert (= (and d!117645 res!661990) b!990275))

(assert (= (and b!990275 res!661991) b!990276))

(assert (=> d!117645 m!917599))

(declare-fun m!917831 () Bool)

(assert (=> d!117645 m!917831))

(declare-fun m!917833 () Bool)

(assert (=> d!117645 m!917833))

(declare-fun m!917835 () Bool)

(assert (=> b!990275 m!917835))

(declare-fun m!917837 () Bool)

(assert (=> b!990276 m!917837))

(assert (=> d!117603 d!117645))

(declare-fun b!990277 () Bool)

(declare-fun e!558465 () List!20816)

(declare-fun call!41984 () List!20816)

(assert (=> b!990277 (= e!558465 call!41984)))

(declare-fun b!990278 () Bool)

(declare-fun e!558464 () Bool)

(declare-fun lt!439268 () List!20816)

(assert (=> b!990278 (= e!558464 (contains!5741 lt!439268 (tuple2!14911 (_1!7466 lt!439060) (_2!7466 lt!439060))))))

(declare-fun b!990279 () Bool)

(declare-fun e!558466 () List!20816)

(declare-fun e!558468 () List!20816)

(assert (=> b!990279 (= e!558466 e!558468)))

(declare-fun c!100596 () Bool)

(assert (=> b!990279 (= c!100596 (and ((_ is Cons!20812) (toList!6820 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (= (_1!7466 (h!21980 (toList!6820 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7466 lt!439060))))))

(declare-fun b!990281 () Bool)

(declare-fun res!661992 () Bool)

(assert (=> b!990281 (=> (not res!661992) (not e!558464))))

(assert (=> b!990281 (= res!661992 (containsKey!480 lt!439268 (_1!7466 lt!439060)))))

(declare-fun b!990282 () Bool)

(declare-fun call!41985 () List!20816)

(assert (=> b!990282 (= e!558468 call!41985)))

(declare-fun bm!41980 () Bool)

(declare-fun e!558467 () List!20816)

(declare-fun c!100598 () Bool)

(declare-fun call!41983 () List!20816)

(assert (=> bm!41980 (= call!41983 ($colon$colon!554 e!558467 (ite c!100598 (h!21980 (toList!6820 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (tuple2!14911 (_1!7466 lt!439060) (_2!7466 lt!439060)))))))

(declare-fun c!100595 () Bool)

(assert (=> bm!41980 (= c!100595 c!100598)))

(declare-fun b!990283 () Bool)

(assert (=> b!990283 (= e!558467 (insertStrictlySorted!330 (t!29761 (toList!6820 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (_1!7466 lt!439060) (_2!7466 lt!439060)))))

(declare-fun b!990284 () Bool)

(assert (=> b!990284 (= e!558465 call!41984)))

(declare-fun bm!41981 () Bool)

(assert (=> bm!41981 (= call!41985 call!41983)))

(declare-fun bm!41982 () Bool)

(assert (=> bm!41982 (= call!41984 call!41985)))

(declare-fun d!117647 () Bool)

(assert (=> d!117647 e!558464))

(declare-fun res!661993 () Bool)

(assert (=> d!117647 (=> (not res!661993) (not e!558464))))

(assert (=> d!117647 (= res!661993 (isStrictlySorted!504 lt!439268))))

(assert (=> d!117647 (= lt!439268 e!558466)))

(assert (=> d!117647 (= c!100598 (and ((_ is Cons!20812) (toList!6820 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvslt (_1!7466 (h!21980 (toList!6820 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7466 lt!439060))))))

(assert (=> d!117647 (isStrictlySorted!504 (toList!6820 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))))

(assert (=> d!117647 (= (insertStrictlySorted!330 (toList!6820 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7466 lt!439060) (_2!7466 lt!439060)) lt!439268)))

(declare-fun b!990280 () Bool)

(declare-fun c!100597 () Bool)

(assert (=> b!990280 (= c!100597 (and ((_ is Cons!20812) (toList!6820 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvsgt (_1!7466 (h!21980 (toList!6820 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7466 lt!439060))))))

(assert (=> b!990280 (= e!558468 e!558465)))

(declare-fun b!990285 () Bool)

(assert (=> b!990285 (= e!558466 call!41983)))

(declare-fun b!990286 () Bool)

(assert (=> b!990286 (= e!558467 (ite c!100596 (t!29761 (toList!6820 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (ite c!100597 (Cons!20812 (h!21980 (toList!6820 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (t!29761 (toList!6820 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) Nil!20813)))))

(assert (= (and d!117647 c!100598) b!990285))

(assert (= (and d!117647 (not c!100598)) b!990279))

(assert (= (and b!990279 c!100596) b!990282))

(assert (= (and b!990279 (not c!100596)) b!990280))

(assert (= (and b!990280 c!100597) b!990277))

(assert (= (and b!990280 (not c!100597)) b!990284))

(assert (= (or b!990277 b!990284) bm!41982))

(assert (= (or b!990282 bm!41982) bm!41981))

(assert (= (or b!990285 bm!41981) bm!41980))

(assert (= (and bm!41980 c!100595) b!990283))

(assert (= (and bm!41980 (not c!100595)) b!990286))

(assert (= (and d!117647 res!661993) b!990281))

(assert (= (and b!990281 res!661992) b!990278))

(declare-fun m!917839 () Bool)

(assert (=> b!990283 m!917839))

(declare-fun m!917841 () Bool)

(assert (=> b!990281 m!917841))

(declare-fun m!917843 () Bool)

(assert (=> bm!41980 m!917843))

(declare-fun m!917845 () Bool)

(assert (=> b!990278 m!917845))

(declare-fun m!917847 () Bool)

(assert (=> d!117647 m!917847))

(declare-fun m!917849 () Bool)

(assert (=> d!117647 m!917849))

(assert (=> d!117603 d!117647))

(declare-fun bm!41983 () Bool)

(declare-fun call!41986 () Bool)

(assert (=> bm!41983 (= call!41986 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!990287 () Bool)

(declare-fun e!558469 () Bool)

(declare-fun e!558470 () Bool)

(assert (=> b!990287 (= e!558469 e!558470)))

(declare-fun lt!439270 () (_ BitVec 64))

(assert (=> b!990287 (= lt!439270 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!439271 () Unit!32822)

(assert (=> b!990287 (= lt!439271 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439270 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!990287 (arrayContainsKey!0 _keys!1544 lt!439270 #b00000000000000000000000000000000)))

(declare-fun lt!439269 () Unit!32822)

(assert (=> b!990287 (= lt!439269 lt!439271)))

(declare-fun res!661995 () Bool)

(assert (=> b!990287 (= res!661995 (= (seekEntryOrOpen!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1544 mask!1948) (Found!9165 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!990287 (=> (not res!661995) (not e!558470))))

(declare-fun b!990288 () Bool)

(declare-fun e!558471 () Bool)

(assert (=> b!990288 (= e!558471 e!558469)))

(declare-fun c!100599 () Bool)

(assert (=> b!990288 (= c!100599 (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!117649 () Bool)

(declare-fun res!661994 () Bool)

(assert (=> d!117649 (=> res!661994 e!558471)))

(assert (=> d!117649 (= res!661994 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30589 _keys!1544)))))

(assert (=> d!117649 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948) e!558471)))

(declare-fun b!990289 () Bool)

(assert (=> b!990289 (= e!558470 call!41986)))

(declare-fun b!990290 () Bool)

(assert (=> b!990290 (= e!558469 call!41986)))

(assert (= (and d!117649 (not res!661994)) b!990288))

(assert (= (and b!990288 c!100599) b!990287))

(assert (= (and b!990288 (not c!100599)) b!990290))

(assert (= (and b!990287 res!661995) b!990289))

(assert (= (or b!990289 b!990290) bm!41983))

(declare-fun m!917851 () Bool)

(assert (=> bm!41983 m!917851))

(declare-fun m!917853 () Bool)

(assert (=> b!990287 m!917853))

(declare-fun m!917855 () Bool)

(assert (=> b!990287 m!917855))

(declare-fun m!917857 () Bool)

(assert (=> b!990287 m!917857))

(assert (=> b!990287 m!917853))

(declare-fun m!917859 () Bool)

(assert (=> b!990287 m!917859))

(assert (=> b!990288 m!917853))

(assert (=> b!990288 m!917853))

(declare-fun m!917861 () Bool)

(assert (=> b!990288 m!917861))

(assert (=> bm!41967 d!117649))

(declare-fun d!117651 () Bool)

(declare-fun e!558473 () Bool)

(assert (=> d!117651 e!558473))

(declare-fun res!661996 () Bool)

(assert (=> d!117651 (=> res!661996 e!558473)))

(declare-fun lt!439272 () Bool)

(assert (=> d!117651 (= res!661996 (not lt!439272))))

(declare-fun lt!439275 () Bool)

(assert (=> d!117651 (= lt!439272 lt!439275)))

(declare-fun lt!439273 () Unit!32822)

(declare-fun e!558472 () Unit!32822)

(assert (=> d!117651 (= lt!439273 e!558472)))

(declare-fun c!100600 () Bool)

(assert (=> d!117651 (= c!100600 lt!439275)))

(assert (=> d!117651 (= lt!439275 (containsKey!480 (toList!6820 lt!439170) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117651 (= (contains!5740 lt!439170 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439272)))

(declare-fun b!990291 () Bool)

(declare-fun lt!439274 () Unit!32822)

(assert (=> b!990291 (= e!558472 lt!439274)))

(assert (=> b!990291 (= lt!439274 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 lt!439170) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990291 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439170) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990292 () Bool)

(declare-fun Unit!32829 () Unit!32822)

(assert (=> b!990292 (= e!558472 Unit!32829)))

(declare-fun b!990293 () Bool)

(assert (=> b!990293 (= e!558473 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439170) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117651 c!100600) b!990291))

(assert (= (and d!117651 (not c!100600)) b!990292))

(assert (= (and d!117651 (not res!661996)) b!990293))

(declare-fun m!917863 () Bool)

(assert (=> d!117651 m!917863))

(declare-fun m!917865 () Bool)

(assert (=> b!990291 m!917865))

(declare-fun m!917867 () Bool)

(assert (=> b!990291 m!917867))

(assert (=> b!990291 m!917867))

(declare-fun m!917869 () Bool)

(assert (=> b!990291 m!917869))

(assert (=> b!990293 m!917867))

(assert (=> b!990293 m!917867))

(assert (=> b!990293 m!917869))

(assert (=> bm!41953 d!117651))

(assert (=> d!117605 d!117615))

(declare-fun d!117653 () Bool)

(assert (=> d!117653 (= (validKeyInArray!0 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)) (and (not (= (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990195 d!117653))

(assert (=> b!990182 d!117653))

(declare-fun d!117655 () Bool)

(assert (=> d!117655 (= (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (and (not (= (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990101 d!117655))

(declare-fun d!117657 () Bool)

(declare-fun e!558475 () Bool)

(assert (=> d!117657 e!558475))

(declare-fun res!661997 () Bool)

(assert (=> d!117657 (=> res!661997 e!558475)))

(declare-fun lt!439276 () Bool)

(assert (=> d!117657 (= res!661997 (not lt!439276))))

(declare-fun lt!439279 () Bool)

(assert (=> d!117657 (= lt!439276 lt!439279)))

(declare-fun lt!439277 () Unit!32822)

(declare-fun e!558474 () Unit!32822)

(assert (=> d!117657 (= lt!439277 e!558474)))

(declare-fun c!100601 () Bool)

(assert (=> d!117657 (= c!100601 lt!439279)))

(assert (=> d!117657 (= lt!439279 (containsKey!480 (toList!6820 lt!439179) (_1!7466 lt!439060)))))

(assert (=> d!117657 (= (contains!5740 lt!439179 (_1!7466 lt!439060)) lt!439276)))

(declare-fun b!990294 () Bool)

(declare-fun lt!439278 () Unit!32822)

(assert (=> b!990294 (= e!558474 lt!439278)))

(assert (=> b!990294 (= lt!439278 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 lt!439179) (_1!7466 lt!439060)))))

(assert (=> b!990294 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439179) (_1!7466 lt!439060)))))

(declare-fun b!990295 () Bool)

(declare-fun Unit!32830 () Unit!32822)

(assert (=> b!990295 (= e!558474 Unit!32830)))

(declare-fun b!990296 () Bool)

(assert (=> b!990296 (= e!558475 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439179) (_1!7466 lt!439060))))))

(assert (= (and d!117657 c!100601) b!990294))

(assert (= (and d!117657 (not c!100601)) b!990295))

(assert (= (and d!117657 (not res!661997)) b!990296))

(declare-fun m!917871 () Bool)

(assert (=> d!117657 m!917871))

(declare-fun m!917873 () Bool)

(assert (=> b!990294 m!917873))

(assert (=> b!990294 m!917671))

(assert (=> b!990294 m!917671))

(declare-fun m!917875 () Bool)

(assert (=> b!990294 m!917875))

(assert (=> b!990296 m!917671))

(assert (=> b!990296 m!917671))

(assert (=> b!990296 m!917875))

(assert (=> d!117607 d!117657))

(declare-fun b!990300 () Bool)

(declare-fun e!558477 () Option!517)

(assert (=> b!990300 (= e!558477 None!515)))

(declare-fun b!990299 () Bool)

(assert (=> b!990299 (= e!558477 (getValueByKey!511 (t!29761 lt!439180) (_1!7466 lt!439060)))))

(declare-fun d!117659 () Bool)

(declare-fun c!100602 () Bool)

(assert (=> d!117659 (= c!100602 (and ((_ is Cons!20812) lt!439180) (= (_1!7466 (h!21980 lt!439180)) (_1!7466 lt!439060))))))

(declare-fun e!558476 () Option!517)

(assert (=> d!117659 (= (getValueByKey!511 lt!439180 (_1!7466 lt!439060)) e!558476)))

(declare-fun b!990297 () Bool)

(assert (=> b!990297 (= e!558476 (Some!516 (_2!7466 (h!21980 lt!439180))))))

(declare-fun b!990298 () Bool)

(assert (=> b!990298 (= e!558476 e!558477)))

(declare-fun c!100603 () Bool)

(assert (=> b!990298 (= c!100603 (and ((_ is Cons!20812) lt!439180) (not (= (_1!7466 (h!21980 lt!439180)) (_1!7466 lt!439060)))))))

(assert (= (and d!117659 c!100602) b!990297))

(assert (= (and d!117659 (not c!100602)) b!990298))

(assert (= (and b!990298 c!100603) b!990299))

(assert (= (and b!990298 (not c!100603)) b!990300))

(declare-fun m!917877 () Bool)

(assert (=> b!990299 m!917877))

(assert (=> d!117607 d!117659))

(declare-fun d!117661 () Bool)

(assert (=> d!117661 (= (getValueByKey!511 lt!439180 (_1!7466 lt!439060)) (Some!516 (_2!7466 lt!439060)))))

(declare-fun lt!439280 () Unit!32822)

(assert (=> d!117661 (= lt!439280 (choose!1617 lt!439180 (_1!7466 lt!439060) (_2!7466 lt!439060)))))

(declare-fun e!558478 () Bool)

(assert (=> d!117661 e!558478))

(declare-fun res!661998 () Bool)

(assert (=> d!117661 (=> (not res!661998) (not e!558478))))

(assert (=> d!117661 (= res!661998 (isStrictlySorted!504 lt!439180))))

(assert (=> d!117661 (= (lemmaContainsTupThenGetReturnValue!273 lt!439180 (_1!7466 lt!439060) (_2!7466 lt!439060)) lt!439280)))

(declare-fun b!990301 () Bool)

(declare-fun res!661999 () Bool)

(assert (=> b!990301 (=> (not res!661999) (not e!558478))))

(assert (=> b!990301 (= res!661999 (containsKey!480 lt!439180 (_1!7466 lt!439060)))))

(declare-fun b!990302 () Bool)

(assert (=> b!990302 (= e!558478 (contains!5741 lt!439180 (tuple2!14911 (_1!7466 lt!439060) (_2!7466 lt!439060))))))

(assert (= (and d!117661 res!661998) b!990301))

(assert (= (and b!990301 res!661999) b!990302))

(assert (=> d!117661 m!917665))

(declare-fun m!917879 () Bool)

(assert (=> d!117661 m!917879))

(declare-fun m!917881 () Bool)

(assert (=> d!117661 m!917881))

(declare-fun m!917883 () Bool)

(assert (=> b!990301 m!917883))

(declare-fun m!917885 () Bool)

(assert (=> b!990302 m!917885))

(assert (=> d!117607 d!117661))

(declare-fun b!990303 () Bool)

(declare-fun e!558480 () List!20816)

(declare-fun call!41988 () List!20816)

(assert (=> b!990303 (= e!558480 call!41988)))

(declare-fun b!990304 () Bool)

(declare-fun e!558479 () Bool)

(declare-fun lt!439281 () List!20816)

(assert (=> b!990304 (= e!558479 (contains!5741 lt!439281 (tuple2!14911 (_1!7466 lt!439060) (_2!7466 lt!439060))))))

(declare-fun b!990305 () Bool)

(declare-fun e!558481 () List!20816)

(declare-fun e!558483 () List!20816)

(assert (=> b!990305 (= e!558481 e!558483)))

(declare-fun c!100605 () Bool)

(assert (=> b!990305 (= c!100605 (and ((_ is Cons!20812) (toList!6820 (+!3113 lt!439058 lt!439057))) (= (_1!7466 (h!21980 (toList!6820 (+!3113 lt!439058 lt!439057)))) (_1!7466 lt!439060))))))

(declare-fun b!990307 () Bool)

(declare-fun res!662000 () Bool)

(assert (=> b!990307 (=> (not res!662000) (not e!558479))))

(assert (=> b!990307 (= res!662000 (containsKey!480 lt!439281 (_1!7466 lt!439060)))))

(declare-fun b!990308 () Bool)

(declare-fun call!41989 () List!20816)

(assert (=> b!990308 (= e!558483 call!41989)))

(declare-fun e!558482 () List!20816)

(declare-fun c!100607 () Bool)

(declare-fun bm!41984 () Bool)

(declare-fun call!41987 () List!20816)

(assert (=> bm!41984 (= call!41987 ($colon$colon!554 e!558482 (ite c!100607 (h!21980 (toList!6820 (+!3113 lt!439058 lt!439057))) (tuple2!14911 (_1!7466 lt!439060) (_2!7466 lt!439060)))))))

(declare-fun c!100604 () Bool)

(assert (=> bm!41984 (= c!100604 c!100607)))

(declare-fun b!990309 () Bool)

(assert (=> b!990309 (= e!558482 (insertStrictlySorted!330 (t!29761 (toList!6820 (+!3113 lt!439058 lt!439057))) (_1!7466 lt!439060) (_2!7466 lt!439060)))))

(declare-fun b!990310 () Bool)

(assert (=> b!990310 (= e!558480 call!41988)))

(declare-fun bm!41985 () Bool)

(assert (=> bm!41985 (= call!41989 call!41987)))

(declare-fun bm!41986 () Bool)

(assert (=> bm!41986 (= call!41988 call!41989)))

(declare-fun d!117663 () Bool)

(assert (=> d!117663 e!558479))

(declare-fun res!662001 () Bool)

(assert (=> d!117663 (=> (not res!662001) (not e!558479))))

(assert (=> d!117663 (= res!662001 (isStrictlySorted!504 lt!439281))))

(assert (=> d!117663 (= lt!439281 e!558481)))

(assert (=> d!117663 (= c!100607 (and ((_ is Cons!20812) (toList!6820 (+!3113 lt!439058 lt!439057))) (bvslt (_1!7466 (h!21980 (toList!6820 (+!3113 lt!439058 lt!439057)))) (_1!7466 lt!439060))))))

(assert (=> d!117663 (isStrictlySorted!504 (toList!6820 (+!3113 lt!439058 lt!439057)))))

(assert (=> d!117663 (= (insertStrictlySorted!330 (toList!6820 (+!3113 lt!439058 lt!439057)) (_1!7466 lt!439060) (_2!7466 lt!439060)) lt!439281)))

(declare-fun c!100606 () Bool)

(declare-fun b!990306 () Bool)

(assert (=> b!990306 (= c!100606 (and ((_ is Cons!20812) (toList!6820 (+!3113 lt!439058 lt!439057))) (bvsgt (_1!7466 (h!21980 (toList!6820 (+!3113 lt!439058 lt!439057)))) (_1!7466 lt!439060))))))

(assert (=> b!990306 (= e!558483 e!558480)))

(declare-fun b!990311 () Bool)

(assert (=> b!990311 (= e!558481 call!41987)))

(declare-fun b!990312 () Bool)

(assert (=> b!990312 (= e!558482 (ite c!100605 (t!29761 (toList!6820 (+!3113 lt!439058 lt!439057))) (ite c!100606 (Cons!20812 (h!21980 (toList!6820 (+!3113 lt!439058 lt!439057))) (t!29761 (toList!6820 (+!3113 lt!439058 lt!439057)))) Nil!20813)))))

(assert (= (and d!117663 c!100607) b!990311))

(assert (= (and d!117663 (not c!100607)) b!990305))

(assert (= (and b!990305 c!100605) b!990308))

(assert (= (and b!990305 (not c!100605)) b!990306))

(assert (= (and b!990306 c!100606) b!990303))

(assert (= (and b!990306 (not c!100606)) b!990310))

(assert (= (or b!990303 b!990310) bm!41986))

(assert (= (or b!990308 bm!41986) bm!41985))

(assert (= (or b!990311 bm!41985) bm!41984))

(assert (= (and bm!41984 c!100604) b!990309))

(assert (= (and bm!41984 (not c!100604)) b!990312))

(assert (= (and d!117663 res!662001) b!990307))

(assert (= (and b!990307 res!662000) b!990304))

(declare-fun m!917887 () Bool)

(assert (=> b!990309 m!917887))

(declare-fun m!917889 () Bool)

(assert (=> b!990307 m!917889))

(declare-fun m!917891 () Bool)

(assert (=> bm!41984 m!917891))

(declare-fun m!917893 () Bool)

(assert (=> b!990304 m!917893))

(declare-fun m!917895 () Bool)

(assert (=> d!117663 m!917895))

(declare-fun m!917897 () Bool)

(assert (=> d!117663 m!917897))

(assert (=> d!117607 d!117663))

(assert (=> b!990126 d!117621))

(declare-fun b!990316 () Bool)

(declare-fun e!558485 () Option!517)

(assert (=> b!990316 (= e!558485 None!515)))

(declare-fun b!990315 () Bool)

(assert (=> b!990315 (= e!558485 (getValueByKey!511 (t!29761 (toList!6820 lt!439105)) (_1!7466 lt!439057)))))

(declare-fun d!117665 () Bool)

(declare-fun c!100608 () Bool)

(assert (=> d!117665 (= c!100608 (and ((_ is Cons!20812) (toList!6820 lt!439105)) (= (_1!7466 (h!21980 (toList!6820 lt!439105))) (_1!7466 lt!439057))))))

(declare-fun e!558484 () Option!517)

(assert (=> d!117665 (= (getValueByKey!511 (toList!6820 lt!439105) (_1!7466 lt!439057)) e!558484)))

(declare-fun b!990313 () Bool)

(assert (=> b!990313 (= e!558484 (Some!516 (_2!7466 (h!21980 (toList!6820 lt!439105)))))))

(declare-fun b!990314 () Bool)

(assert (=> b!990314 (= e!558484 e!558485)))

(declare-fun c!100609 () Bool)

(assert (=> b!990314 (= c!100609 (and ((_ is Cons!20812) (toList!6820 lt!439105)) (not (= (_1!7466 (h!21980 (toList!6820 lt!439105))) (_1!7466 lt!439057)))))))

(assert (= (and d!117665 c!100608) b!990313))

(assert (= (and d!117665 (not c!100608)) b!990314))

(assert (= (and b!990314 c!100609) b!990315))

(assert (= (and b!990314 (not c!100609)) b!990316))

(declare-fun m!917899 () Bool)

(assert (=> b!990315 m!917899))

(assert (=> b!990039 d!117665))

(declare-fun d!117667 () Bool)

(declare-fun lt!439284 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!420 (List!20815) (InoxSet (_ BitVec 64)))

(assert (=> d!117667 (= lt!439284 (select (content!420 Nil!20812) (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun e!558490 () Bool)

(assert (=> d!117667 (= lt!439284 e!558490)))

(declare-fun res!662007 () Bool)

(assert (=> d!117667 (=> (not res!662007) (not e!558490))))

(assert (=> d!117667 (= res!662007 ((_ is Cons!20811) Nil!20812))))

(assert (=> d!117667 (= (contains!5742 Nil!20812 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)) lt!439284)))

(declare-fun b!990321 () Bool)

(declare-fun e!558491 () Bool)

(assert (=> b!990321 (= e!558490 e!558491)))

(declare-fun res!662006 () Bool)

(assert (=> b!990321 (=> res!662006 e!558491)))

(assert (=> b!990321 (= res!662006 (= (h!21979 Nil!20812) (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!990322 () Bool)

(assert (=> b!990322 (= e!558491 (contains!5742 (t!29760 Nil!20812) (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117667 res!662007) b!990321))

(assert (= (and b!990321 (not res!662006)) b!990322))

(declare-fun m!917901 () Bool)

(assert (=> d!117667 m!917901))

(assert (=> d!117667 m!917771))

(declare-fun m!917903 () Bool)

(assert (=> d!117667 m!917903))

(assert (=> b!990322 m!917771))

(declare-fun m!917905 () Bool)

(assert (=> b!990322 m!917905))

(assert (=> b!990199 d!117667))

(declare-fun b!990326 () Bool)

(declare-fun e!558493 () Option!517)

(assert (=> b!990326 (= e!558493 None!515)))

(declare-fun b!990325 () Bool)

(assert (=> b!990325 (= e!558493 (getValueByKey!511 (t!29761 (toList!6820 lt!439101)) (_1!7466 lt!439057)))))

(declare-fun d!117669 () Bool)

(declare-fun c!100610 () Bool)

(assert (=> d!117669 (= c!100610 (and ((_ is Cons!20812) (toList!6820 lt!439101)) (= (_1!7466 (h!21980 (toList!6820 lt!439101))) (_1!7466 lt!439057))))))

(declare-fun e!558492 () Option!517)

(assert (=> d!117669 (= (getValueByKey!511 (toList!6820 lt!439101) (_1!7466 lt!439057)) e!558492)))

(declare-fun b!990323 () Bool)

(assert (=> b!990323 (= e!558492 (Some!516 (_2!7466 (h!21980 (toList!6820 lt!439101)))))))

(declare-fun b!990324 () Bool)

(assert (=> b!990324 (= e!558492 e!558493)))

(declare-fun c!100611 () Bool)

(assert (=> b!990324 (= c!100611 (and ((_ is Cons!20812) (toList!6820 lt!439101)) (not (= (_1!7466 (h!21980 (toList!6820 lt!439101))) (_1!7466 lt!439057)))))))

(assert (= (and d!117669 c!100610) b!990323))

(assert (= (and d!117669 (not c!100610)) b!990324))

(assert (= (and b!990324 c!100611) b!990325))

(assert (= (and b!990324 (not c!100611)) b!990326))

(declare-fun m!917907 () Bool)

(assert (=> b!990325 m!917907))

(assert (=> b!990037 d!117669))

(declare-fun d!117671 () Bool)

(declare-fun e!558495 () Bool)

(assert (=> d!117671 e!558495))

(declare-fun res!662008 () Bool)

(assert (=> d!117671 (=> res!662008 e!558495)))

(declare-fun lt!439285 () Bool)

(assert (=> d!117671 (= res!662008 (not lt!439285))))

(declare-fun lt!439288 () Bool)

(assert (=> d!117671 (= lt!439285 lt!439288)))

(declare-fun lt!439286 () Unit!32822)

(declare-fun e!558494 () Unit!32822)

(assert (=> d!117671 (= lt!439286 e!558494)))

(declare-fun c!100612 () Bool)

(assert (=> d!117671 (= c!100612 lt!439288)))

(assert (=> d!117671 (= lt!439288 (containsKey!480 (toList!6820 lt!439203) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117671 (= (contains!5740 lt!439203 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439285)))

(declare-fun b!990327 () Bool)

(declare-fun lt!439287 () Unit!32822)

(assert (=> b!990327 (= e!558494 lt!439287)))

(assert (=> b!990327 (= lt!439287 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 lt!439203) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990327 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439203) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990328 () Bool)

(declare-fun Unit!32831 () Unit!32822)

(assert (=> b!990328 (= e!558494 Unit!32831)))

(declare-fun b!990329 () Bool)

(assert (=> b!990329 (= e!558495 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439203) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117671 c!100612) b!990327))

(assert (= (and d!117671 (not c!100612)) b!990328))

(assert (= (and d!117671 (not res!662008)) b!990329))

(declare-fun m!917909 () Bool)

(assert (=> d!117671 m!917909))

(declare-fun m!917911 () Bool)

(assert (=> b!990327 m!917911))

(declare-fun m!917913 () Bool)

(assert (=> b!990327 m!917913))

(assert (=> b!990327 m!917913))

(declare-fun m!917915 () Bool)

(assert (=> b!990327 m!917915))

(assert (=> b!990329 m!917913))

(assert (=> b!990329 m!917913))

(assert (=> b!990329 m!917915))

(assert (=> bm!41960 d!117671))

(declare-fun b!990330 () Bool)

(declare-fun e!558500 () Bool)

(declare-fun e!558497 () Bool)

(assert (=> b!990330 (= e!558500 e!558497)))

(declare-fun c!100616 () Bool)

(assert (=> b!990330 (= c!100616 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30589 _keys!1544)))))

(declare-fun b!990331 () Bool)

(declare-fun e!558501 () ListLongMap!13609)

(declare-fun call!41990 () ListLongMap!13609)

(assert (=> b!990331 (= e!558501 call!41990)))

(declare-fun b!990332 () Bool)

(declare-fun e!558496 () Bool)

(assert (=> b!990332 (= e!558496 e!558500)))

(declare-fun c!100614 () Bool)

(declare-fun e!558499 () Bool)

(assert (=> b!990332 (= c!100614 e!558499)))

(declare-fun res!662009 () Bool)

(assert (=> b!990332 (=> (not res!662009) (not e!558499))))

(assert (=> b!990332 (= res!662009 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30589 _keys!1544)))))

(declare-fun b!990333 () Bool)

(declare-fun e!558498 () Bool)

(assert (=> b!990333 (= e!558500 e!558498)))

(assert (=> b!990333 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30589 _keys!1544)))))

(declare-fun lt!439293 () ListLongMap!13609)

(declare-fun res!662012 () Bool)

(assert (=> b!990333 (= res!662012 (contains!5740 lt!439293 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!990333 (=> (not res!662012) (not e!558498))))

(declare-fun bm!41987 () Bool)

(assert (=> bm!41987 (= call!41990 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!990334 () Bool)

(declare-fun e!558502 () ListLongMap!13609)

(assert (=> b!990334 (= e!558502 e!558501)))

(declare-fun c!100615 () Bool)

(assert (=> b!990334 (= c!100615 (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(declare-fun b!990335 () Bool)

(assert (=> b!990335 (= e!558502 (ListLongMap!13610 Nil!20813))))

(declare-fun b!990336 () Bool)

(assert (=> b!990336 (= e!558497 (isEmpty!729 lt!439293))))

(declare-fun b!990337 () Bool)

(assert (=> b!990337 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30589 _keys!1544)))))

(assert (=> b!990337 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30588 _values!1278)))))

(assert (=> b!990337 (= e!558498 (= (apply!904 lt!439293 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))) (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!990338 () Bool)

(declare-fun res!662010 () Bool)

(assert (=> b!990338 (=> (not res!662010) (not e!558496))))

(assert (=> b!990338 (= res!662010 (not (contains!5740 lt!439293 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990339 () Bool)

(assert (=> b!990339 (= e!558497 (= lt!439293 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun d!117673 () Bool)

(assert (=> d!117673 e!558496))

(declare-fun res!662011 () Bool)

(assert (=> d!117673 (=> (not res!662011) (not e!558496))))

(assert (=> d!117673 (= res!662011 (not (contains!5740 lt!439293 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117673 (= lt!439293 e!558502)))

(declare-fun c!100613 () Bool)

(assert (=> d!117673 (= c!100613 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30589 _keys!1544)))))

(assert (=> d!117673 (validMask!0 mask!1948)))

(assert (=> d!117673 (= (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281) lt!439293)))

(declare-fun b!990340 () Bool)

(declare-fun lt!439292 () Unit!32822)

(declare-fun lt!439290 () Unit!32822)

(assert (=> b!990340 (= lt!439292 lt!439290)))

(declare-fun lt!439294 () ListLongMap!13609)

(declare-fun lt!439291 () (_ BitVec 64))

(declare-fun lt!439289 () V!35993)

(declare-fun lt!439295 () (_ BitVec 64))

(assert (=> b!990340 (not (contains!5740 (+!3113 lt!439294 (tuple2!14911 lt!439291 lt!439289)) lt!439295))))

(assert (=> b!990340 (= lt!439290 (addStillNotContains!236 lt!439294 lt!439291 lt!439289 lt!439295))))

(assert (=> b!990340 (= lt!439295 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!990340 (= lt!439289 (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!990340 (= lt!439291 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)))))

(assert (=> b!990340 (= lt!439294 call!41990)))

(assert (=> b!990340 (= e!558501 (+!3113 call!41990 (tuple2!14911 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!990341 () Bool)

(assert (=> b!990341 (= e!558499 (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!990341 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (= (and d!117673 c!100613) b!990335))

(assert (= (and d!117673 (not c!100613)) b!990334))

(assert (= (and b!990334 c!100615) b!990340))

(assert (= (and b!990334 (not c!100615)) b!990331))

(assert (= (or b!990340 b!990331) bm!41987))

(assert (= (and d!117673 res!662011) b!990338))

(assert (= (and b!990338 res!662010) b!990332))

(assert (= (and b!990332 res!662009) b!990341))

(assert (= (and b!990332 c!100614) b!990333))

(assert (= (and b!990332 (not c!100614)) b!990330))

(assert (= (and b!990333 res!662012) b!990337))

(assert (= (and b!990330 c!100616) b!990339))

(assert (= (and b!990330 (not c!100616)) b!990336))

(declare-fun b_lambda!15135 () Bool)

(assert (=> (not b_lambda!15135) (not b!990337)))

(assert (=> b!990337 t!29759))

(declare-fun b_and!32181 () Bool)

(assert (= b_and!32179 (and (=> t!29759 result!13595) b_and!32181)))

(declare-fun b_lambda!15137 () Bool)

(assert (=> (not b_lambda!15137) (not b!990340)))

(assert (=> b!990340 t!29759))

(declare-fun b_and!32183 () Bool)

(assert (= b_and!32181 (and (=> t!29759 result!13595) b_and!32183)))

(declare-fun m!917917 () Bool)

(assert (=> b!990334 m!917917))

(assert (=> b!990334 m!917917))

(declare-fun m!917919 () Bool)

(assert (=> b!990334 m!917919))

(declare-fun m!917921 () Bool)

(assert (=> b!990339 m!917921))

(declare-fun m!917923 () Bool)

(assert (=> b!990337 m!917923))

(assert (=> b!990337 m!917461))

(assert (=> b!990337 m!917917))

(assert (=> b!990337 m!917923))

(assert (=> b!990337 m!917461))

(declare-fun m!917925 () Bool)

(assert (=> b!990337 m!917925))

(assert (=> b!990337 m!917917))

(declare-fun m!917927 () Bool)

(assert (=> b!990337 m!917927))

(assert (=> b!990341 m!917917))

(assert (=> b!990341 m!917917))

(assert (=> b!990341 m!917919))

(assert (=> bm!41987 m!917921))

(declare-fun m!917929 () Bool)

(assert (=> b!990340 m!917929))

(declare-fun m!917931 () Bool)

(assert (=> b!990340 m!917931))

(assert (=> b!990340 m!917461))

(assert (=> b!990340 m!917917))

(assert (=> b!990340 m!917923))

(assert (=> b!990340 m!917461))

(assert (=> b!990340 m!917925))

(assert (=> b!990340 m!917923))

(declare-fun m!917933 () Bool)

(assert (=> b!990340 m!917933))

(assert (=> b!990340 m!917929))

(declare-fun m!917935 () Bool)

(assert (=> b!990340 m!917935))

(assert (=> b!990333 m!917917))

(assert (=> b!990333 m!917917))

(declare-fun m!917937 () Bool)

(assert (=> b!990333 m!917937))

(declare-fun m!917939 () Bool)

(assert (=> b!990336 m!917939))

(declare-fun m!917941 () Bool)

(assert (=> b!990338 m!917941))

(declare-fun m!917943 () Bool)

(assert (=> d!117673 m!917943))

(assert (=> d!117673 m!917471))

(assert (=> bm!41964 d!117673))

(declare-fun d!117675 () Bool)

(declare-fun get!15655 (Option!517) V!35993)

(assert (=> d!117675 (= (apply!904 lt!439203 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15655 (getValueByKey!511 (toList!6820 lt!439203) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28090 () Bool)

(assert (= bs!28090 d!117675))

(declare-fun m!917945 () Bool)

(assert (=> bs!28090 m!917945))

(assert (=> bs!28090 m!917945))

(declare-fun m!917947 () Bool)

(assert (=> bs!28090 m!917947))

(assert (=> b!990128 d!117675))

(declare-fun d!117677 () Bool)

(declare-fun e!558504 () Bool)

(assert (=> d!117677 e!558504))

(declare-fun res!662013 () Bool)

(assert (=> d!117677 (=> res!662013 e!558504)))

(declare-fun lt!439296 () Bool)

(assert (=> d!117677 (= res!662013 (not lt!439296))))

(declare-fun lt!439299 () Bool)

(assert (=> d!117677 (= lt!439296 lt!439299)))

(declare-fun lt!439297 () Unit!32822)

(declare-fun e!558503 () Unit!32822)

(assert (=> d!117677 (= lt!439297 e!558503)))

(declare-fun c!100617 () Bool)

(assert (=> d!117677 (= c!100617 lt!439299)))

(assert (=> d!117677 (= lt!439299 (containsKey!480 (toList!6820 lt!439183) (_1!7466 lt!439060)))))

(assert (=> d!117677 (= (contains!5740 lt!439183 (_1!7466 lt!439060)) lt!439296)))

(declare-fun b!990342 () Bool)

(declare-fun lt!439298 () Unit!32822)

(assert (=> b!990342 (= e!558503 lt!439298)))

(assert (=> b!990342 (= lt!439298 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 lt!439183) (_1!7466 lt!439060)))))

(assert (=> b!990342 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439183) (_1!7466 lt!439060)))))

(declare-fun b!990343 () Bool)

(declare-fun Unit!32832 () Unit!32822)

(assert (=> b!990343 (= e!558503 Unit!32832)))

(declare-fun b!990344 () Bool)

(assert (=> b!990344 (= e!558504 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439183) (_1!7466 lt!439060))))))

(assert (= (and d!117677 c!100617) b!990342))

(assert (= (and d!117677 (not c!100617)) b!990343))

(assert (= (and d!117677 (not res!662013)) b!990344))

(declare-fun m!917949 () Bool)

(assert (=> d!117677 m!917949))

(declare-fun m!917951 () Bool)

(assert (=> b!990342 m!917951))

(assert (=> b!990342 m!917683))

(assert (=> b!990342 m!917683))

(declare-fun m!917953 () Bool)

(assert (=> b!990342 m!917953))

(assert (=> b!990344 m!917683))

(assert (=> b!990344 m!917683))

(assert (=> b!990344 m!917953))

(assert (=> d!117609 d!117677))

(declare-fun b!990348 () Bool)

(declare-fun e!558506 () Option!517)

(assert (=> b!990348 (= e!558506 None!515)))

(declare-fun b!990347 () Bool)

(assert (=> b!990347 (= e!558506 (getValueByKey!511 (t!29761 lt!439184) (_1!7466 lt!439060)))))

(declare-fun d!117679 () Bool)

(declare-fun c!100618 () Bool)

(assert (=> d!117679 (= c!100618 (and ((_ is Cons!20812) lt!439184) (= (_1!7466 (h!21980 lt!439184)) (_1!7466 lt!439060))))))

(declare-fun e!558505 () Option!517)

(assert (=> d!117679 (= (getValueByKey!511 lt!439184 (_1!7466 lt!439060)) e!558505)))

(declare-fun b!990345 () Bool)

(assert (=> b!990345 (= e!558505 (Some!516 (_2!7466 (h!21980 lt!439184))))))

(declare-fun b!990346 () Bool)

(assert (=> b!990346 (= e!558505 e!558506)))

(declare-fun c!100619 () Bool)

(assert (=> b!990346 (= c!100619 (and ((_ is Cons!20812) lt!439184) (not (= (_1!7466 (h!21980 lt!439184)) (_1!7466 lt!439060)))))))

(assert (= (and d!117679 c!100618) b!990345))

(assert (= (and d!117679 (not c!100618)) b!990346))

(assert (= (and b!990346 c!100619) b!990347))

(assert (= (and b!990346 (not c!100619)) b!990348))

(declare-fun m!917955 () Bool)

(assert (=> b!990347 m!917955))

(assert (=> d!117609 d!117679))

(declare-fun d!117681 () Bool)

(assert (=> d!117681 (= (getValueByKey!511 lt!439184 (_1!7466 lt!439060)) (Some!516 (_2!7466 lt!439060)))))

(declare-fun lt!439300 () Unit!32822)

(assert (=> d!117681 (= lt!439300 (choose!1617 lt!439184 (_1!7466 lt!439060) (_2!7466 lt!439060)))))

(declare-fun e!558507 () Bool)

(assert (=> d!117681 e!558507))

(declare-fun res!662014 () Bool)

(assert (=> d!117681 (=> (not res!662014) (not e!558507))))

(assert (=> d!117681 (= res!662014 (isStrictlySorted!504 lt!439184))))

(assert (=> d!117681 (= (lemmaContainsTupThenGetReturnValue!273 lt!439184 (_1!7466 lt!439060) (_2!7466 lt!439060)) lt!439300)))

(declare-fun b!990349 () Bool)

(declare-fun res!662015 () Bool)

(assert (=> b!990349 (=> (not res!662015) (not e!558507))))

(assert (=> b!990349 (= res!662015 (containsKey!480 lt!439184 (_1!7466 lt!439060)))))

(declare-fun b!990350 () Bool)

(assert (=> b!990350 (= e!558507 (contains!5741 lt!439184 (tuple2!14911 (_1!7466 lt!439060) (_2!7466 lt!439060))))))

(assert (= (and d!117681 res!662014) b!990349))

(assert (= (and b!990349 res!662015) b!990350))

(assert (=> d!117681 m!917677))

(declare-fun m!917957 () Bool)

(assert (=> d!117681 m!917957))

(declare-fun m!917959 () Bool)

(assert (=> d!117681 m!917959))

(declare-fun m!917961 () Bool)

(assert (=> b!990349 m!917961))

(declare-fun m!917963 () Bool)

(assert (=> b!990350 m!917963))

(assert (=> d!117609 d!117681))

(declare-fun b!990351 () Bool)

(declare-fun e!558509 () List!20816)

(declare-fun call!41992 () List!20816)

(assert (=> b!990351 (= e!558509 call!41992)))

(declare-fun b!990352 () Bool)

(declare-fun e!558508 () Bool)

(declare-fun lt!439301 () List!20816)

(assert (=> b!990352 (= e!558508 (contains!5741 lt!439301 (tuple2!14911 (_1!7466 lt!439060) (_2!7466 lt!439060))))))

(declare-fun b!990353 () Bool)

(declare-fun e!558510 () List!20816)

(declare-fun e!558512 () List!20816)

(assert (=> b!990353 (= e!558510 e!558512)))

(declare-fun c!100621 () Bool)

(assert (=> b!990353 (= c!100621 (and ((_ is Cons!20812) (toList!6820 lt!439058)) (= (_1!7466 (h!21980 (toList!6820 lt!439058))) (_1!7466 lt!439060))))))

(declare-fun b!990355 () Bool)

(declare-fun res!662016 () Bool)

(assert (=> b!990355 (=> (not res!662016) (not e!558508))))

(assert (=> b!990355 (= res!662016 (containsKey!480 lt!439301 (_1!7466 lt!439060)))))

(declare-fun b!990356 () Bool)

(declare-fun call!41993 () List!20816)

(assert (=> b!990356 (= e!558512 call!41993)))

(declare-fun c!100623 () Bool)

(declare-fun e!558511 () List!20816)

(declare-fun bm!41988 () Bool)

(declare-fun call!41991 () List!20816)

(assert (=> bm!41988 (= call!41991 ($colon$colon!554 e!558511 (ite c!100623 (h!21980 (toList!6820 lt!439058)) (tuple2!14911 (_1!7466 lt!439060) (_2!7466 lt!439060)))))))

(declare-fun c!100620 () Bool)

(assert (=> bm!41988 (= c!100620 c!100623)))

(declare-fun b!990357 () Bool)

(assert (=> b!990357 (= e!558511 (insertStrictlySorted!330 (t!29761 (toList!6820 lt!439058)) (_1!7466 lt!439060) (_2!7466 lt!439060)))))

(declare-fun b!990358 () Bool)

(assert (=> b!990358 (= e!558509 call!41992)))

(declare-fun bm!41989 () Bool)

(assert (=> bm!41989 (= call!41993 call!41991)))

(declare-fun bm!41990 () Bool)

(assert (=> bm!41990 (= call!41992 call!41993)))

(declare-fun d!117683 () Bool)

(assert (=> d!117683 e!558508))

(declare-fun res!662017 () Bool)

(assert (=> d!117683 (=> (not res!662017) (not e!558508))))

(assert (=> d!117683 (= res!662017 (isStrictlySorted!504 lt!439301))))

(assert (=> d!117683 (= lt!439301 e!558510)))

(assert (=> d!117683 (= c!100623 (and ((_ is Cons!20812) (toList!6820 lt!439058)) (bvslt (_1!7466 (h!21980 (toList!6820 lt!439058))) (_1!7466 lt!439060))))))

(assert (=> d!117683 (isStrictlySorted!504 (toList!6820 lt!439058))))

(assert (=> d!117683 (= (insertStrictlySorted!330 (toList!6820 lt!439058) (_1!7466 lt!439060) (_2!7466 lt!439060)) lt!439301)))

(declare-fun b!990354 () Bool)

(declare-fun c!100622 () Bool)

(assert (=> b!990354 (= c!100622 (and ((_ is Cons!20812) (toList!6820 lt!439058)) (bvsgt (_1!7466 (h!21980 (toList!6820 lt!439058))) (_1!7466 lt!439060))))))

(assert (=> b!990354 (= e!558512 e!558509)))

(declare-fun b!990359 () Bool)

(assert (=> b!990359 (= e!558510 call!41991)))

(declare-fun b!990360 () Bool)

(assert (=> b!990360 (= e!558511 (ite c!100621 (t!29761 (toList!6820 lt!439058)) (ite c!100622 (Cons!20812 (h!21980 (toList!6820 lt!439058)) (t!29761 (toList!6820 lt!439058))) Nil!20813)))))

(assert (= (and d!117683 c!100623) b!990359))

(assert (= (and d!117683 (not c!100623)) b!990353))

(assert (= (and b!990353 c!100621) b!990356))

(assert (= (and b!990353 (not c!100621)) b!990354))

(assert (= (and b!990354 c!100622) b!990351))

(assert (= (and b!990354 (not c!100622)) b!990358))

(assert (= (or b!990351 b!990358) bm!41990))

(assert (= (or b!990356 bm!41990) bm!41989))

(assert (= (or b!990359 bm!41989) bm!41988))

(assert (= (and bm!41988 c!100620) b!990357))

(assert (= (and bm!41988 (not c!100620)) b!990360))

(assert (= (and d!117683 res!662017) b!990355))

(assert (= (and b!990355 res!662016) b!990352))

(declare-fun m!917965 () Bool)

(assert (=> b!990357 m!917965))

(declare-fun m!917967 () Bool)

(assert (=> b!990355 m!917967))

(declare-fun m!917969 () Bool)

(assert (=> bm!41988 m!917969))

(declare-fun m!917971 () Bool)

(assert (=> b!990352 m!917971))

(declare-fun m!917973 () Bool)

(assert (=> d!117683 m!917973))

(declare-fun m!917975 () Bool)

(assert (=> d!117683 m!917975))

(assert (=> d!117609 d!117683))

(declare-fun d!117685 () Bool)

(assert (=> d!117685 (= (apply!904 lt!439229 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15655 (getValueByKey!511 (toList!6820 lt!439229) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28091 () Bool)

(assert (= bs!28091 d!117685))

(assert (=> bs!28091 m!917613))

(declare-fun m!917977 () Bool)

(assert (=> bs!28091 m!917977))

(assert (=> bs!28091 m!917977))

(declare-fun m!917979 () Bool)

(assert (=> bs!28091 m!917979))

(assert (=> b!990168 d!117685))

(declare-fun d!117687 () Bool)

(declare-fun c!100624 () Bool)

(assert (=> d!117687 (= c!100624 ((_ is ValueCellFull!11147) (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun e!558513 () V!35993)

(assert (=> d!117687 (= (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!558513)))

(declare-fun b!990361 () Bool)

(assert (=> b!990361 (= e!558513 (get!15653 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990362 () Bool)

(assert (=> b!990362 (= e!558513 (get!15654 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117687 c!100624) b!990361))

(assert (= (and d!117687 (not c!100624)) b!990362))

(assert (=> b!990361 m!917625))

(assert (=> b!990361 m!917461))

(declare-fun m!917981 () Bool)

(assert (=> b!990361 m!917981))

(assert (=> b!990362 m!917625))

(assert (=> b!990362 m!917461))

(declare-fun m!917983 () Bool)

(assert (=> b!990362 m!917983))

(assert (=> b!990168 d!117687))

(declare-fun b!990366 () Bool)

(declare-fun e!558515 () Option!517)

(assert (=> b!990366 (= e!558515 None!515)))

(declare-fun b!990365 () Bool)

(assert (=> b!990365 (= e!558515 (getValueByKey!511 (t!29761 (toList!6820 lt!439109)) (_1!7466 lt!439060)))))

(declare-fun d!117689 () Bool)

(declare-fun c!100625 () Bool)

(assert (=> d!117689 (= c!100625 (and ((_ is Cons!20812) (toList!6820 lt!439109)) (= (_1!7466 (h!21980 (toList!6820 lt!439109))) (_1!7466 lt!439060))))))

(declare-fun e!558514 () Option!517)

(assert (=> d!117689 (= (getValueByKey!511 (toList!6820 lt!439109) (_1!7466 lt!439060)) e!558514)))

(declare-fun b!990363 () Bool)

(assert (=> b!990363 (= e!558514 (Some!516 (_2!7466 (h!21980 (toList!6820 lt!439109)))))))

(declare-fun b!990364 () Bool)

(assert (=> b!990364 (= e!558514 e!558515)))

(declare-fun c!100626 () Bool)

(assert (=> b!990364 (= c!100626 (and ((_ is Cons!20812) (toList!6820 lt!439109)) (not (= (_1!7466 (h!21980 (toList!6820 lt!439109))) (_1!7466 lt!439060)))))))

(assert (= (and d!117689 c!100625) b!990363))

(assert (= (and d!117689 (not c!100625)) b!990364))

(assert (= (and b!990364 c!100626) b!990365))

(assert (= (and b!990364 (not c!100626)) b!990366))

(declare-fun m!917985 () Bool)

(assert (=> b!990365 m!917985))

(assert (=> b!990041 d!117689))

(declare-fun d!117691 () Bool)

(assert (=> d!117691 (= (apply!904 lt!439170 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15655 (getValueByKey!511 (toList!6820 lt!439170) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28092 () Bool)

(assert (= bs!28092 d!117691))

(declare-fun m!917987 () Bool)

(assert (=> bs!28092 m!917987))

(assert (=> bs!28092 m!917987))

(declare-fun m!917989 () Bool)

(assert (=> bs!28092 m!917989))

(assert (=> b!990103 d!117691))

(assert (=> b!990170 d!117673))

(declare-fun d!117693 () Bool)

(declare-fun e!558517 () Bool)

(assert (=> d!117693 e!558517))

(declare-fun res!662018 () Bool)

(assert (=> d!117693 (=> res!662018 e!558517)))

(declare-fun lt!439302 () Bool)

(assert (=> d!117693 (= res!662018 (not lt!439302))))

(declare-fun lt!439305 () Bool)

(assert (=> d!117693 (= lt!439302 lt!439305)))

(declare-fun lt!439303 () Unit!32822)

(declare-fun e!558516 () Unit!32822)

(assert (=> d!117693 (= lt!439303 e!558516)))

(declare-fun c!100627 () Bool)

(assert (=> d!117693 (= c!100627 lt!439305)))

(assert (=> d!117693 (= lt!439305 (containsKey!480 (toList!6820 lt!439170) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117693 (= (contains!5740 lt!439170 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439302)))

(declare-fun b!990367 () Bool)

(declare-fun lt!439304 () Unit!32822)

(assert (=> b!990367 (= e!558516 lt!439304)))

(assert (=> b!990367 (= lt!439304 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 lt!439170) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990367 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439170) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990368 () Bool)

(declare-fun Unit!32833 () Unit!32822)

(assert (=> b!990368 (= e!558516 Unit!32833)))

(declare-fun b!990369 () Bool)

(assert (=> b!990369 (= e!558517 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439170) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117693 c!100627) b!990367))

(assert (= (and d!117693 (not c!100627)) b!990368))

(assert (= (and d!117693 (not res!662018)) b!990369))

(declare-fun m!917991 () Bool)

(assert (=> d!117693 m!917991))

(declare-fun m!917993 () Bool)

(assert (=> b!990367 m!917993))

(assert (=> b!990367 m!917987))

(assert (=> b!990367 m!917987))

(declare-fun m!917995 () Bool)

(assert (=> b!990367 m!917995))

(assert (=> b!990369 m!917987))

(assert (=> b!990369 m!917987))

(assert (=> b!990369 m!917995))

(assert (=> bm!41950 d!117693))

(assert (=> d!117613 d!117615))

(declare-fun d!117695 () Bool)

(declare-fun e!558518 () Bool)

(assert (=> d!117695 e!558518))

(declare-fun res!662020 () Bool)

(assert (=> d!117695 (=> (not res!662020) (not e!558518))))

(declare-fun lt!439307 () ListLongMap!13609)

(assert (=> d!117695 (= res!662020 (contains!5740 lt!439307 (_1!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061))))))

(declare-fun lt!439308 () List!20816)

(assert (=> d!117695 (= lt!439307 (ListLongMap!13610 lt!439308))))

(declare-fun lt!439306 () Unit!32822)

(declare-fun lt!439309 () Unit!32822)

(assert (=> d!117695 (= lt!439306 lt!439309)))

(assert (=> d!117695 (= (getValueByKey!511 lt!439308 (_1!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061))) (Some!516 (_2!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061))))))

(assert (=> d!117695 (= lt!439309 (lemmaContainsTupThenGetReturnValue!273 lt!439308 (_1!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061)) (_2!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061))))))

(assert (=> d!117695 (= lt!439308 (insertStrictlySorted!330 (toList!6820 lt!439058) (_1!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061)) (_2!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061))))))

(assert (=> d!117695 (= (+!3113 lt!439058 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061)) lt!439307)))

(declare-fun b!990370 () Bool)

(declare-fun res!662019 () Bool)

(assert (=> b!990370 (=> (not res!662019) (not e!558518))))

(assert (=> b!990370 (= res!662019 (= (getValueByKey!511 (toList!6820 lt!439307) (_1!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061))) (Some!516 (_2!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061)))))))

(declare-fun b!990371 () Bool)

(assert (=> b!990371 (= e!558518 (contains!5741 (toList!6820 lt!439307) (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061)))))

(assert (= (and d!117695 res!662020) b!990370))

(assert (= (and b!990370 res!662019) b!990371))

(declare-fun m!917997 () Bool)

(assert (=> d!117695 m!917997))

(declare-fun m!917999 () Bool)

(assert (=> d!117695 m!917999))

(declare-fun m!918001 () Bool)

(assert (=> d!117695 m!918001))

(declare-fun m!918003 () Bool)

(assert (=> d!117695 m!918003))

(declare-fun m!918005 () Bool)

(assert (=> b!990370 m!918005))

(declare-fun m!918007 () Bool)

(assert (=> b!990371 m!918007))

(assert (=> d!117611 d!117695))

(declare-fun d!117697 () Bool)

(declare-fun e!558519 () Bool)

(assert (=> d!117697 e!558519))

(declare-fun res!662022 () Bool)

(assert (=> d!117697 (=> (not res!662022) (not e!558519))))

(declare-fun lt!439311 () ListLongMap!13609)

(assert (=> d!117697 (= res!662022 (contains!5740 lt!439311 (_1!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!439312 () List!20816)

(assert (=> d!117697 (= lt!439311 (ListLongMap!13610 lt!439312))))

(declare-fun lt!439310 () Unit!32822)

(declare-fun lt!439313 () Unit!32822)

(assert (=> d!117697 (= lt!439310 lt!439313)))

(assert (=> d!117697 (= (getValueByKey!511 lt!439312 (_1!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!516 (_2!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117697 (= lt!439313 (lemmaContainsTupThenGetReturnValue!273 lt!439312 (_1!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117697 (= lt!439312 (insertStrictlySorted!330 (toList!6820 (+!3113 lt!439058 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061))) (_1!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117697 (= (+!3113 (+!3113 lt!439058 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061)) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!439311)))

(declare-fun b!990372 () Bool)

(declare-fun res!662021 () Bool)

(assert (=> b!990372 (=> (not res!662021) (not e!558519))))

(assert (=> b!990372 (= res!662021 (= (getValueByKey!511 (toList!6820 lt!439311) (_1!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!516 (_2!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!990373 () Bool)

(assert (=> b!990373 (= e!558519 (contains!5741 (toList!6820 lt!439311) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!117697 res!662022) b!990372))

(assert (= (and b!990372 res!662021) b!990373))

(declare-fun m!918009 () Bool)

(assert (=> d!117697 m!918009))

(declare-fun m!918011 () Bool)

(assert (=> d!117697 m!918011))

(declare-fun m!918013 () Bool)

(assert (=> d!117697 m!918013))

(declare-fun m!918015 () Bool)

(assert (=> d!117697 m!918015))

(declare-fun m!918017 () Bool)

(assert (=> b!990372 m!918017))

(declare-fun m!918019 () Bool)

(assert (=> b!990373 m!918019))

(assert (=> d!117611 d!117697))

(declare-fun d!117699 () Bool)

(declare-fun e!558520 () Bool)

(assert (=> d!117699 e!558520))

(declare-fun res!662024 () Bool)

(assert (=> d!117699 (=> (not res!662024) (not e!558520))))

(declare-fun lt!439315 () ListLongMap!13609)

(assert (=> d!117699 (= res!662024 (contains!5740 lt!439315 (_1!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061))))))

(declare-fun lt!439316 () List!20816)

(assert (=> d!117699 (= lt!439315 (ListLongMap!13610 lt!439316))))

(declare-fun lt!439314 () Unit!32822)

(declare-fun lt!439317 () Unit!32822)

(assert (=> d!117699 (= lt!439314 lt!439317)))

(assert (=> d!117699 (= (getValueByKey!511 lt!439316 (_1!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061))) (Some!516 (_2!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061))))))

(assert (=> d!117699 (= lt!439317 (lemmaContainsTupThenGetReturnValue!273 lt!439316 (_1!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061)) (_2!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061))))))

(assert (=> d!117699 (= lt!439316 (insertStrictlySorted!330 (toList!6820 (+!3113 lt!439058 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (_1!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061)) (_2!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061))))))

(assert (=> d!117699 (= (+!3113 (+!3113 lt!439058 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061)) lt!439315)))

(declare-fun b!990374 () Bool)

(declare-fun res!662023 () Bool)

(assert (=> b!990374 (=> (not res!662023) (not e!558520))))

(assert (=> b!990374 (= res!662023 (= (getValueByKey!511 (toList!6820 lt!439315) (_1!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061))) (Some!516 (_2!7466 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061)))))))

(declare-fun b!990375 () Bool)

(assert (=> b!990375 (= e!558520 (contains!5741 (toList!6820 lt!439315) (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061)))))

(assert (= (and d!117699 res!662024) b!990374))

(assert (= (and b!990374 res!662023) b!990375))

(declare-fun m!918021 () Bool)

(assert (=> d!117699 m!918021))

(declare-fun m!918023 () Bool)

(assert (=> d!117699 m!918023))

(declare-fun m!918025 () Bool)

(assert (=> d!117699 m!918025))

(declare-fun m!918027 () Bool)

(assert (=> d!117699 m!918027))

(declare-fun m!918029 () Bool)

(assert (=> b!990374 m!918029))

(declare-fun m!918031 () Bool)

(assert (=> b!990375 m!918031))

(assert (=> d!117611 d!117699))

(declare-fun d!117701 () Bool)

(declare-fun e!558521 () Bool)

(assert (=> d!117701 e!558521))

(declare-fun res!662026 () Bool)

(assert (=> d!117701 (=> (not res!662026) (not e!558521))))

(declare-fun lt!439319 () ListLongMap!13609)

(assert (=> d!117701 (= res!662026 (contains!5740 lt!439319 (_1!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!439320 () List!20816)

(assert (=> d!117701 (= lt!439319 (ListLongMap!13610 lt!439320))))

(declare-fun lt!439318 () Unit!32822)

(declare-fun lt!439321 () Unit!32822)

(assert (=> d!117701 (= lt!439318 lt!439321)))

(assert (=> d!117701 (= (getValueByKey!511 lt!439320 (_1!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!516 (_2!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117701 (= lt!439321 (lemmaContainsTupThenGetReturnValue!273 lt!439320 (_1!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117701 (= lt!439320 (insertStrictlySorted!330 (toList!6820 lt!439058) (_1!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117701 (= (+!3113 lt!439058 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!439319)))

(declare-fun b!990376 () Bool)

(declare-fun res!662025 () Bool)

(assert (=> b!990376 (=> (not res!662025) (not e!558521))))

(assert (=> b!990376 (= res!662025 (= (getValueByKey!511 (toList!6820 lt!439319) (_1!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!516 (_2!7466 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!990377 () Bool)

(assert (=> b!990377 (= e!558521 (contains!5741 (toList!6820 lt!439319) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!117701 res!662026) b!990376))

(assert (= (and b!990376 res!662025) b!990377))

(declare-fun m!918033 () Bool)

(assert (=> d!117701 m!918033))

(declare-fun m!918035 () Bool)

(assert (=> d!117701 m!918035))

(declare-fun m!918037 () Bool)

(assert (=> d!117701 m!918037))

(declare-fun m!918039 () Bool)

(assert (=> d!117701 m!918039))

(declare-fun m!918041 () Bool)

(assert (=> b!990376 m!918041))

(declare-fun m!918043 () Bool)

(assert (=> b!990377 m!918043))

(assert (=> d!117611 d!117701))

(declare-fun d!117703 () Bool)

(assert (=> d!117703 (= (+!3113 (+!3113 lt!439058 (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061)) (+!3113 (+!3113 lt!439058 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) lt!439061)) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (=> d!117703 true))

(declare-fun _$28!188 () Unit!32822)

(assert (=> d!117703 (= (choose!1616 lt!439058 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30109 _keys!1544) from!1932) lt!439061) _$28!188)))

(declare-fun bs!28093 () Bool)

(assert (= bs!28093 d!117703))

(assert (=> bs!28093 m!917689))

(assert (=> bs!28093 m!917689))

(assert (=> bs!28093 m!917691))

(assert (=> bs!28093 m!917693))

(assert (=> bs!28093 m!917693))

(assert (=> bs!28093 m!917695))

(assert (=> d!117611 d!117703))

(declare-fun b!990381 () Bool)

(declare-fun e!558523 () Option!517)

(assert (=> b!990381 (= e!558523 None!515)))

(declare-fun b!990380 () Bool)

(assert (=> b!990380 (= e!558523 (getValueByKey!511 (t!29761 (toList!6820 lt!439179)) (_1!7466 lt!439060)))))

(declare-fun d!117705 () Bool)

(declare-fun c!100628 () Bool)

(assert (=> d!117705 (= c!100628 (and ((_ is Cons!20812) (toList!6820 lt!439179)) (= (_1!7466 (h!21980 (toList!6820 lt!439179))) (_1!7466 lt!439060))))))

(declare-fun e!558522 () Option!517)

(assert (=> d!117705 (= (getValueByKey!511 (toList!6820 lt!439179) (_1!7466 lt!439060)) e!558522)))

(declare-fun b!990378 () Bool)

(assert (=> b!990378 (= e!558522 (Some!516 (_2!7466 (h!21980 (toList!6820 lt!439179)))))))

(declare-fun b!990379 () Bool)

(assert (=> b!990379 (= e!558522 e!558523)))

(declare-fun c!100629 () Bool)

(assert (=> b!990379 (= c!100629 (and ((_ is Cons!20812) (toList!6820 lt!439179)) (not (= (_1!7466 (h!21980 (toList!6820 lt!439179))) (_1!7466 lt!439060)))))))

(assert (= (and d!117705 c!100628) b!990378))

(assert (= (and d!117705 (not c!100628)) b!990379))

(assert (= (and b!990379 c!100629) b!990380))

(assert (= (and b!990379 (not c!100629)) b!990381))

(declare-fun m!918045 () Bool)

(assert (=> b!990380 m!918045))

(assert (=> b!990106 d!117705))

(declare-fun d!117707 () Bool)

(declare-fun e!558525 () Bool)

(assert (=> d!117707 e!558525))

(declare-fun res!662027 () Bool)

(assert (=> d!117707 (=> res!662027 e!558525)))

(declare-fun lt!439322 () Bool)

(assert (=> d!117707 (= res!662027 (not lt!439322))))

(declare-fun lt!439325 () Bool)

(assert (=> d!117707 (= lt!439322 lt!439325)))

(declare-fun lt!439323 () Unit!32822)

(declare-fun e!558524 () Unit!32822)

(assert (=> d!117707 (= lt!439323 e!558524)))

(declare-fun c!100630 () Bool)

(assert (=> d!117707 (= c!100630 lt!439325)))

(assert (=> d!117707 (= lt!439325 (containsKey!480 (toList!6820 lt!439203) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117707 (= (contains!5740 lt!439203 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439322)))

(declare-fun b!990382 () Bool)

(declare-fun lt!439324 () Unit!32822)

(assert (=> b!990382 (= e!558524 lt!439324)))

(assert (=> b!990382 (= lt!439324 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 lt!439203) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990382 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439203) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990383 () Bool)

(declare-fun Unit!32834 () Unit!32822)

(assert (=> b!990383 (= e!558524 Unit!32834)))

(declare-fun b!990384 () Bool)

(assert (=> b!990384 (= e!558525 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439203) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117707 c!100630) b!990382))

(assert (= (and d!117707 (not c!100630)) b!990383))

(assert (= (and d!117707 (not res!662027)) b!990384))

(declare-fun m!918047 () Bool)

(assert (=> d!117707 m!918047))

(declare-fun m!918049 () Bool)

(assert (=> b!990382 m!918049))

(assert (=> b!990382 m!917945))

(assert (=> b!990382 m!917945))

(declare-fun m!918051 () Bool)

(assert (=> b!990382 m!918051))

(assert (=> b!990384 m!917945))

(assert (=> b!990384 m!917945))

(assert (=> b!990384 m!918051))

(assert (=> bm!41957 d!117707))

(assert (=> b!990172 d!117655))

(declare-fun b!990388 () Bool)

(declare-fun e!558527 () Option!517)

(assert (=> b!990388 (= e!558527 None!515)))

(declare-fun b!990387 () Bool)

(assert (=> b!990387 (= e!558527 (getValueByKey!511 (t!29761 (toList!6820 lt!439183)) (_1!7466 lt!439060)))))

(declare-fun d!117709 () Bool)

(declare-fun c!100631 () Bool)

(assert (=> d!117709 (= c!100631 (and ((_ is Cons!20812) (toList!6820 lt!439183)) (= (_1!7466 (h!21980 (toList!6820 lt!439183))) (_1!7466 lt!439060))))))

(declare-fun e!558526 () Option!517)

(assert (=> d!117709 (= (getValueByKey!511 (toList!6820 lt!439183) (_1!7466 lt!439060)) e!558526)))

(declare-fun b!990385 () Bool)

(assert (=> b!990385 (= e!558526 (Some!516 (_2!7466 (h!21980 (toList!6820 lt!439183)))))))

(declare-fun b!990386 () Bool)

(assert (=> b!990386 (= e!558526 e!558527)))

(declare-fun c!100632 () Bool)

(assert (=> b!990386 (= c!100632 (and ((_ is Cons!20812) (toList!6820 lt!439183)) (not (= (_1!7466 (h!21980 (toList!6820 lt!439183))) (_1!7466 lt!439060)))))))

(assert (= (and d!117709 c!100631) b!990385))

(assert (= (and d!117709 (not c!100631)) b!990386))

(assert (= (and b!990386 c!100632) b!990387))

(assert (= (and b!990386 (not c!100632)) b!990388))

(declare-fun m!918053 () Bool)

(assert (=> b!990387 m!918053))

(assert (=> b!990108 d!117709))

(declare-fun d!117711 () Bool)

(declare-fun e!558529 () Bool)

(assert (=> d!117711 e!558529))

(declare-fun res!662028 () Bool)

(assert (=> d!117711 (=> res!662028 e!558529)))

(declare-fun lt!439326 () Bool)

(assert (=> d!117711 (= res!662028 (not lt!439326))))

(declare-fun lt!439329 () Bool)

(assert (=> d!117711 (= lt!439326 lt!439329)))

(declare-fun lt!439327 () Unit!32822)

(declare-fun e!558528 () Unit!32822)

(assert (=> d!117711 (= lt!439327 e!558528)))

(declare-fun c!100633 () Bool)

(assert (=> d!117711 (= c!100633 lt!439329)))

(assert (=> d!117711 (= lt!439329 (containsKey!480 (toList!6820 lt!439101) (_1!7466 lt!439057)))))

(assert (=> d!117711 (= (contains!5740 lt!439101 (_1!7466 lt!439057)) lt!439326)))

(declare-fun b!990389 () Bool)

(declare-fun lt!439328 () Unit!32822)

(assert (=> b!990389 (= e!558528 lt!439328)))

(assert (=> b!990389 (= lt!439328 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 lt!439101) (_1!7466 lt!439057)))))

(assert (=> b!990389 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439101) (_1!7466 lt!439057)))))

(declare-fun b!990390 () Bool)

(declare-fun Unit!32835 () Unit!32822)

(assert (=> b!990390 (= e!558528 Unit!32835)))

(declare-fun b!990391 () Bool)

(assert (=> b!990391 (= e!558529 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439101) (_1!7466 lt!439057))))))

(assert (= (and d!117711 c!100633) b!990389))

(assert (= (and d!117711 (not c!100633)) b!990390))

(assert (= (and d!117711 (not res!662028)) b!990391))

(declare-fun m!918055 () Bool)

(assert (=> d!117711 m!918055))

(declare-fun m!918057 () Bool)

(assert (=> b!990389 m!918057))

(assert (=> b!990389 m!917581))

(assert (=> b!990389 m!917581))

(declare-fun m!918059 () Bool)

(assert (=> b!990389 m!918059))

(assert (=> b!990391 m!917581))

(assert (=> b!990391 m!917581))

(assert (=> b!990391 m!918059))

(assert (=> d!117599 d!117711))

(declare-fun b!990395 () Bool)

(declare-fun e!558531 () Option!517)

(assert (=> b!990395 (= e!558531 None!515)))

(declare-fun b!990394 () Bool)

(assert (=> b!990394 (= e!558531 (getValueByKey!511 (t!29761 lt!439102) (_1!7466 lt!439057)))))

(declare-fun d!117713 () Bool)

(declare-fun c!100634 () Bool)

(assert (=> d!117713 (= c!100634 (and ((_ is Cons!20812) lt!439102) (= (_1!7466 (h!21980 lt!439102)) (_1!7466 lt!439057))))))

(declare-fun e!558530 () Option!517)

(assert (=> d!117713 (= (getValueByKey!511 lt!439102 (_1!7466 lt!439057)) e!558530)))

(declare-fun b!990392 () Bool)

(assert (=> b!990392 (= e!558530 (Some!516 (_2!7466 (h!21980 lt!439102))))))

(declare-fun b!990393 () Bool)

(assert (=> b!990393 (= e!558530 e!558531)))

(declare-fun c!100635 () Bool)

(assert (=> b!990393 (= c!100635 (and ((_ is Cons!20812) lt!439102) (not (= (_1!7466 (h!21980 lt!439102)) (_1!7466 lt!439057)))))))

(assert (= (and d!117713 c!100634) b!990392))

(assert (= (and d!117713 (not c!100634)) b!990393))

(assert (= (and b!990393 c!100635) b!990394))

(assert (= (and b!990393 (not c!100635)) b!990395))

(declare-fun m!918061 () Bool)

(assert (=> b!990394 m!918061))

(assert (=> d!117599 d!117713))

(declare-fun d!117715 () Bool)

(assert (=> d!117715 (= (getValueByKey!511 lt!439102 (_1!7466 lt!439057)) (Some!516 (_2!7466 lt!439057)))))

(declare-fun lt!439330 () Unit!32822)

(assert (=> d!117715 (= lt!439330 (choose!1617 lt!439102 (_1!7466 lt!439057) (_2!7466 lt!439057)))))

(declare-fun e!558532 () Bool)

(assert (=> d!117715 e!558532))

(declare-fun res!662029 () Bool)

(assert (=> d!117715 (=> (not res!662029) (not e!558532))))

(assert (=> d!117715 (= res!662029 (isStrictlySorted!504 lt!439102))))

(assert (=> d!117715 (= (lemmaContainsTupThenGetReturnValue!273 lt!439102 (_1!7466 lt!439057) (_2!7466 lt!439057)) lt!439330)))

(declare-fun b!990396 () Bool)

(declare-fun res!662030 () Bool)

(assert (=> b!990396 (=> (not res!662030) (not e!558532))))

(assert (=> b!990396 (= res!662030 (containsKey!480 lt!439102 (_1!7466 lt!439057)))))

(declare-fun b!990397 () Bool)

(assert (=> b!990397 (= e!558532 (contains!5741 lt!439102 (tuple2!14911 (_1!7466 lt!439057) (_2!7466 lt!439057))))))

(assert (= (and d!117715 res!662029) b!990396))

(assert (= (and b!990396 res!662030) b!990397))

(assert (=> d!117715 m!917575))

(declare-fun m!918063 () Bool)

(assert (=> d!117715 m!918063))

(declare-fun m!918065 () Bool)

(assert (=> d!117715 m!918065))

(declare-fun m!918067 () Bool)

(assert (=> b!990396 m!918067))

(declare-fun m!918069 () Bool)

(assert (=> b!990397 m!918069))

(assert (=> d!117599 d!117715))

(declare-fun b!990398 () Bool)

(declare-fun e!558534 () List!20816)

(declare-fun call!41995 () List!20816)

(assert (=> b!990398 (= e!558534 call!41995)))

(declare-fun b!990399 () Bool)

(declare-fun e!558533 () Bool)

(declare-fun lt!439331 () List!20816)

(assert (=> b!990399 (= e!558533 (contains!5741 lt!439331 (tuple2!14911 (_1!7466 lt!439057) (_2!7466 lt!439057))))))

(declare-fun b!990400 () Bool)

(declare-fun e!558535 () List!20816)

(declare-fun e!558537 () List!20816)

(assert (=> b!990400 (= e!558535 e!558537)))

(declare-fun c!100637 () Bool)

(assert (=> b!990400 (= c!100637 (and ((_ is Cons!20812) (toList!6820 lt!439058)) (= (_1!7466 (h!21980 (toList!6820 lt!439058))) (_1!7466 lt!439057))))))

(declare-fun b!990402 () Bool)

(declare-fun res!662031 () Bool)

(assert (=> b!990402 (=> (not res!662031) (not e!558533))))

(assert (=> b!990402 (= res!662031 (containsKey!480 lt!439331 (_1!7466 lt!439057)))))

(declare-fun b!990403 () Bool)

(declare-fun call!41996 () List!20816)

(assert (=> b!990403 (= e!558537 call!41996)))

(declare-fun call!41994 () List!20816)

(declare-fun e!558536 () List!20816)

(declare-fun bm!41991 () Bool)

(declare-fun c!100639 () Bool)

(assert (=> bm!41991 (= call!41994 ($colon$colon!554 e!558536 (ite c!100639 (h!21980 (toList!6820 lt!439058)) (tuple2!14911 (_1!7466 lt!439057) (_2!7466 lt!439057)))))))

(declare-fun c!100636 () Bool)

(assert (=> bm!41991 (= c!100636 c!100639)))

(declare-fun b!990404 () Bool)

(assert (=> b!990404 (= e!558536 (insertStrictlySorted!330 (t!29761 (toList!6820 lt!439058)) (_1!7466 lt!439057) (_2!7466 lt!439057)))))

(declare-fun b!990405 () Bool)

(assert (=> b!990405 (= e!558534 call!41995)))

(declare-fun bm!41992 () Bool)

(assert (=> bm!41992 (= call!41996 call!41994)))

(declare-fun bm!41993 () Bool)

(assert (=> bm!41993 (= call!41995 call!41996)))

(declare-fun d!117717 () Bool)

(assert (=> d!117717 e!558533))

(declare-fun res!662032 () Bool)

(assert (=> d!117717 (=> (not res!662032) (not e!558533))))

(assert (=> d!117717 (= res!662032 (isStrictlySorted!504 lt!439331))))

(assert (=> d!117717 (= lt!439331 e!558535)))

(assert (=> d!117717 (= c!100639 (and ((_ is Cons!20812) (toList!6820 lt!439058)) (bvslt (_1!7466 (h!21980 (toList!6820 lt!439058))) (_1!7466 lt!439057))))))

(assert (=> d!117717 (isStrictlySorted!504 (toList!6820 lt!439058))))

(assert (=> d!117717 (= (insertStrictlySorted!330 (toList!6820 lt!439058) (_1!7466 lt!439057) (_2!7466 lt!439057)) lt!439331)))

(declare-fun b!990401 () Bool)

(declare-fun c!100638 () Bool)

(assert (=> b!990401 (= c!100638 (and ((_ is Cons!20812) (toList!6820 lt!439058)) (bvsgt (_1!7466 (h!21980 (toList!6820 lt!439058))) (_1!7466 lt!439057))))))

(assert (=> b!990401 (= e!558537 e!558534)))

(declare-fun b!990406 () Bool)

(assert (=> b!990406 (= e!558535 call!41994)))

(declare-fun b!990407 () Bool)

(assert (=> b!990407 (= e!558536 (ite c!100637 (t!29761 (toList!6820 lt!439058)) (ite c!100638 (Cons!20812 (h!21980 (toList!6820 lt!439058)) (t!29761 (toList!6820 lt!439058))) Nil!20813)))))

(assert (= (and d!117717 c!100639) b!990406))

(assert (= (and d!117717 (not c!100639)) b!990400))

(assert (= (and b!990400 c!100637) b!990403))

(assert (= (and b!990400 (not c!100637)) b!990401))

(assert (= (and b!990401 c!100638) b!990398))

(assert (= (and b!990401 (not c!100638)) b!990405))

(assert (= (or b!990398 b!990405) bm!41993))

(assert (= (or b!990403 bm!41993) bm!41992))

(assert (= (or b!990406 bm!41992) bm!41991))

(assert (= (and bm!41991 c!100636) b!990404))

(assert (= (and bm!41991 (not c!100636)) b!990407))

(assert (= (and d!117717 res!662032) b!990402))

(assert (= (and b!990402 res!662031) b!990399))

(declare-fun m!918071 () Bool)

(assert (=> b!990404 m!918071))

(declare-fun m!918073 () Bool)

(assert (=> b!990402 m!918073))

(declare-fun m!918075 () Bool)

(assert (=> bm!41991 m!918075))

(declare-fun m!918077 () Bool)

(assert (=> b!990399 m!918077))

(declare-fun m!918079 () Bool)

(assert (=> d!117717 m!918079))

(assert (=> d!117717 m!917975))

(assert (=> d!117599 d!117717))

(declare-fun d!117719 () Bool)

(assert (=> d!117719 (= (get!15653 (select (arr!30108 _values!1278) from!1932) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14243 (select (arr!30108 _values!1278) from!1932)))))

(assert (=> b!990135 d!117719))

(declare-fun d!117721 () Bool)

(assert (=> d!117721 (= (apply!904 lt!439170 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15655 (getValueByKey!511 (toList!6820 lt!439170) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28094 () Bool)

(assert (= bs!28094 d!117721))

(assert (=> bs!28094 m!917613))

(declare-fun m!918081 () Bool)

(assert (=> bs!28094 m!918081))

(assert (=> bs!28094 m!918081))

(declare-fun m!918083 () Bool)

(assert (=> bs!28094 m!918083))

(assert (=> b!990097 d!117721))

(assert (=> b!990097 d!117687))

(declare-fun d!117723 () Bool)

(assert (=> d!117723 (= (apply!904 lt!439203 (select (arr!30109 _keys!1544) from!1932)) (get!15655 (getValueByKey!511 (toList!6820 lt!439203) (select (arr!30109 _keys!1544) from!1932))))))

(declare-fun bs!28095 () Bool)

(assert (= bs!28095 d!117723))

(assert (=> bs!28095 m!917455))

(declare-fun m!918085 () Bool)

(assert (=> bs!28095 m!918085))

(assert (=> bs!28095 m!918085))

(declare-fun m!918087 () Bool)

(assert (=> bs!28095 m!918087))

(assert (=> b!990122 d!117723))

(assert (=> b!990122 d!117623))

(declare-fun d!117725 () Bool)

(declare-fun e!558538 () Bool)

(assert (=> d!117725 e!558538))

(declare-fun res!662034 () Bool)

(assert (=> d!117725 (=> (not res!662034) (not e!558538))))

(declare-fun lt!439333 () ListLongMap!13609)

(assert (=> d!117725 (= res!662034 (contains!5740 lt!439333 (_1!7466 (ite (or c!100545 c!100547) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!439334 () List!20816)

(assert (=> d!117725 (= lt!439333 (ListLongMap!13610 lt!439334))))

(declare-fun lt!439332 () Unit!32822)

(declare-fun lt!439335 () Unit!32822)

(assert (=> d!117725 (= lt!439332 lt!439335)))

(assert (=> d!117725 (= (getValueByKey!511 lt!439334 (_1!7466 (ite (or c!100545 c!100547) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!516 (_2!7466 (ite (or c!100545 c!100547) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117725 (= lt!439335 (lemmaContainsTupThenGetReturnValue!273 lt!439334 (_1!7466 (ite (or c!100545 c!100547) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7466 (ite (or c!100545 c!100547) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117725 (= lt!439334 (insertStrictlySorted!330 (toList!6820 (ite c!100545 call!41964 (ite c!100547 call!41962 call!41960))) (_1!7466 (ite (or c!100545 c!100547) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7466 (ite (or c!100545 c!100547) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117725 (= (+!3113 (ite c!100545 call!41964 (ite c!100547 call!41962 call!41960)) (ite (or c!100545 c!100547) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!439333)))

(declare-fun b!990408 () Bool)

(declare-fun res!662033 () Bool)

(assert (=> b!990408 (=> (not res!662033) (not e!558538))))

(assert (=> b!990408 (= res!662033 (= (getValueByKey!511 (toList!6820 lt!439333) (_1!7466 (ite (or c!100545 c!100547) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!516 (_2!7466 (ite (or c!100545 c!100547) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!990409 () Bool)

(assert (=> b!990409 (= e!558538 (contains!5741 (toList!6820 lt!439333) (ite (or c!100545 c!100547) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117725 res!662034) b!990408))

(assert (= (and b!990408 res!662033) b!990409))

(declare-fun m!918089 () Bool)

(assert (=> d!117725 m!918089))

(declare-fun m!918091 () Bool)

(assert (=> d!117725 m!918091))

(declare-fun m!918093 () Bool)

(assert (=> d!117725 m!918093))

(declare-fun m!918095 () Bool)

(assert (=> d!117725 m!918095))

(declare-fun m!918097 () Bool)

(assert (=> b!990408 m!918097))

(declare-fun m!918099 () Bool)

(assert (=> b!990409 m!918099))

(assert (=> bm!41959 d!117725))

(declare-fun d!117727 () Bool)

(declare-fun e!558540 () Bool)

(assert (=> d!117727 e!558540))

(declare-fun res!662035 () Bool)

(assert (=> d!117727 (=> res!662035 e!558540)))

(declare-fun lt!439336 () Bool)

(assert (=> d!117727 (= res!662035 (not lt!439336))))

(declare-fun lt!439339 () Bool)

(assert (=> d!117727 (= lt!439336 lt!439339)))

(declare-fun lt!439337 () Unit!32822)

(declare-fun e!558539 () Unit!32822)

(assert (=> d!117727 (= lt!439337 e!558539)))

(declare-fun c!100640 () Bool)

(assert (=> d!117727 (= c!100640 lt!439339)))

(assert (=> d!117727 (= lt!439339 (containsKey!480 (toList!6820 lt!439229) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117727 (= (contains!5740 lt!439229 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!439336)))

(declare-fun b!990410 () Bool)

(declare-fun lt!439338 () Unit!32822)

(assert (=> b!990410 (= e!558539 lt!439338)))

(assert (=> b!990410 (= lt!439338 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 lt!439229) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990410 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439229) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990411 () Bool)

(declare-fun Unit!32836 () Unit!32822)

(assert (=> b!990411 (= e!558539 Unit!32836)))

(declare-fun b!990412 () Bool)

(assert (=> b!990412 (= e!558540 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439229) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117727 c!100640) b!990410))

(assert (= (and d!117727 (not c!100640)) b!990411))

(assert (= (and d!117727 (not res!662035)) b!990412))

(assert (=> d!117727 m!917613))

(declare-fun m!918101 () Bool)

(assert (=> d!117727 m!918101))

(assert (=> b!990410 m!917613))

(declare-fun m!918103 () Bool)

(assert (=> b!990410 m!918103))

(assert (=> b!990410 m!917613))

(assert (=> b!990410 m!917977))

(assert (=> b!990410 m!917977))

(declare-fun m!918105 () Bool)

(assert (=> b!990410 m!918105))

(assert (=> b!990412 m!917613))

(assert (=> b!990412 m!917977))

(assert (=> b!990412 m!917977))

(assert (=> b!990412 m!918105))

(assert (=> b!990164 d!117727))

(declare-fun d!117729 () Bool)

(declare-fun e!558541 () Bool)

(assert (=> d!117729 e!558541))

(declare-fun res!662037 () Bool)

(assert (=> d!117729 (=> (not res!662037) (not e!558541))))

(declare-fun lt!439341 () ListLongMap!13609)

(assert (=> d!117729 (= res!662037 (contains!5740 lt!439341 (_1!7466 (ite (or c!100539 c!100541) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!439342 () List!20816)

(assert (=> d!117729 (= lt!439341 (ListLongMap!13610 lt!439342))))

(declare-fun lt!439340 () Unit!32822)

(declare-fun lt!439343 () Unit!32822)

(assert (=> d!117729 (= lt!439340 lt!439343)))

(assert (=> d!117729 (= (getValueByKey!511 lt!439342 (_1!7466 (ite (or c!100539 c!100541) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!516 (_2!7466 (ite (or c!100539 c!100541) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117729 (= lt!439343 (lemmaContainsTupThenGetReturnValue!273 lt!439342 (_1!7466 (ite (or c!100539 c!100541) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7466 (ite (or c!100539 c!100541) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117729 (= lt!439342 (insertStrictlySorted!330 (toList!6820 (ite c!100539 call!41957 (ite c!100541 call!41955 call!41953))) (_1!7466 (ite (or c!100539 c!100541) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7466 (ite (or c!100539 c!100541) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117729 (= (+!3113 (ite c!100539 call!41957 (ite c!100541 call!41955 call!41953)) (ite (or c!100539 c!100541) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!439341)))

(declare-fun b!990413 () Bool)

(declare-fun res!662036 () Bool)

(assert (=> b!990413 (=> (not res!662036) (not e!558541))))

(assert (=> b!990413 (= res!662036 (= (getValueByKey!511 (toList!6820 lt!439341) (_1!7466 (ite (or c!100539 c!100541) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!516 (_2!7466 (ite (or c!100539 c!100541) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!990414 () Bool)

(assert (=> b!990414 (= e!558541 (contains!5741 (toList!6820 lt!439341) (ite (or c!100539 c!100541) (tuple2!14911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117729 res!662037) b!990413))

(assert (= (and b!990413 res!662036) b!990414))

(declare-fun m!918107 () Bool)

(assert (=> d!117729 m!918107))

(declare-fun m!918109 () Bool)

(assert (=> d!117729 m!918109))

(declare-fun m!918111 () Bool)

(assert (=> d!117729 m!918111))

(declare-fun m!918113 () Bool)

(assert (=> d!117729 m!918113))

(declare-fun m!918115 () Bool)

(assert (=> b!990413 m!918115))

(declare-fun m!918117 () Bool)

(assert (=> b!990414 m!918117))

(assert (=> bm!41952 d!117729))

(assert (=> b!990198 d!117653))

(declare-fun d!117731 () Bool)

(declare-fun lt!439346 () Bool)

(declare-fun content!421 (List!20816) (InoxSet tuple2!14910))

(assert (=> d!117731 (= lt!439346 (select (content!421 (toList!6820 lt!439101)) lt!439057))))

(declare-fun e!558546 () Bool)

(assert (=> d!117731 (= lt!439346 e!558546)))

(declare-fun res!662042 () Bool)

(assert (=> d!117731 (=> (not res!662042) (not e!558546))))

(assert (=> d!117731 (= res!662042 ((_ is Cons!20812) (toList!6820 lt!439101)))))

(assert (=> d!117731 (= (contains!5741 (toList!6820 lt!439101) lt!439057) lt!439346)))

(declare-fun b!990419 () Bool)

(declare-fun e!558547 () Bool)

(assert (=> b!990419 (= e!558546 e!558547)))

(declare-fun res!662043 () Bool)

(assert (=> b!990419 (=> res!662043 e!558547)))

(assert (=> b!990419 (= res!662043 (= (h!21980 (toList!6820 lt!439101)) lt!439057))))

(declare-fun b!990420 () Bool)

(assert (=> b!990420 (= e!558547 (contains!5741 (t!29761 (toList!6820 lt!439101)) lt!439057))))

(assert (= (and d!117731 res!662042) b!990419))

(assert (= (and b!990419 (not res!662043)) b!990420))

(declare-fun m!918119 () Bool)

(assert (=> d!117731 m!918119))

(declare-fun m!918121 () Bool)

(assert (=> d!117731 m!918121))

(declare-fun m!918123 () Bool)

(assert (=> b!990420 m!918123))

(assert (=> b!990038 d!117731))

(assert (=> b!990165 d!117655))

(declare-fun d!117733 () Bool)

(declare-fun e!558549 () Bool)

(assert (=> d!117733 e!558549))

(declare-fun res!662044 () Bool)

(assert (=> d!117733 (=> res!662044 e!558549)))

(declare-fun lt!439347 () Bool)

(assert (=> d!117733 (= res!662044 (not lt!439347))))

(declare-fun lt!439350 () Bool)

(assert (=> d!117733 (= lt!439347 lt!439350)))

(declare-fun lt!439348 () Unit!32822)

(declare-fun e!558548 () Unit!32822)

(assert (=> d!117733 (= lt!439348 e!558548)))

(declare-fun c!100641 () Bool)

(assert (=> d!117733 (= c!100641 lt!439350)))

(assert (=> d!117733 (= lt!439350 (containsKey!480 (toList!6820 lt!439170) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117733 (= (contains!5740 lt!439170 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!439347)))

(declare-fun b!990421 () Bool)

(declare-fun lt!439349 () Unit!32822)

(assert (=> b!990421 (= e!558548 lt!439349)))

(assert (=> b!990421 (= lt!439349 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 lt!439170) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990421 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439170) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990422 () Bool)

(declare-fun Unit!32837 () Unit!32822)

(assert (=> b!990422 (= e!558548 Unit!32837)))

(declare-fun b!990423 () Bool)

(assert (=> b!990423 (= e!558549 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439170) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117733 c!100641) b!990421))

(assert (= (and d!117733 (not c!100641)) b!990422))

(assert (= (and d!117733 (not res!662044)) b!990423))

(assert (=> d!117733 m!917613))

(declare-fun m!918125 () Bool)

(assert (=> d!117733 m!918125))

(assert (=> b!990421 m!917613))

(declare-fun m!918127 () Bool)

(assert (=> b!990421 m!918127))

(assert (=> b!990421 m!917613))

(assert (=> b!990421 m!918081))

(assert (=> b!990421 m!918081))

(declare-fun m!918129 () Bool)

(assert (=> b!990421 m!918129))

(assert (=> b!990423 m!917613))

(assert (=> b!990423 m!918081))

(assert (=> b!990423 m!918081))

(assert (=> b!990423 m!918129))

(assert (=> b!990102 d!117733))

(declare-fun d!117735 () Bool)

(assert (=> d!117735 (arrayContainsKey!0 _keys!1544 lt!439239 #b00000000000000000000000000000000)))

(declare-fun lt!439353 () Unit!32822)

(declare-fun choose!13 (array!62520 (_ BitVec 64) (_ BitVec 32)) Unit!32822)

(assert (=> d!117735 (= lt!439353 (choose!13 _keys!1544 lt!439239 #b00000000000000000000000000000000))))

(assert (=> d!117735 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!117735 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439239 #b00000000000000000000000000000000) lt!439353)))

(declare-fun bs!28096 () Bool)

(assert (= bs!28096 d!117735))

(assert (=> bs!28096 m!917775))

(declare-fun m!918131 () Bool)

(assert (=> bs!28096 m!918131))

(assert (=> b!990181 d!117735))

(declare-fun d!117737 () Bool)

(declare-fun res!662049 () Bool)

(declare-fun e!558554 () Bool)

(assert (=> d!117737 (=> res!662049 e!558554)))

(assert (=> d!117737 (= res!662049 (= (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) lt!439239))))

(assert (=> d!117737 (= (arrayContainsKey!0 _keys!1544 lt!439239 #b00000000000000000000000000000000) e!558554)))

(declare-fun b!990428 () Bool)

(declare-fun e!558555 () Bool)

(assert (=> b!990428 (= e!558554 e!558555)))

(declare-fun res!662050 () Bool)

(assert (=> b!990428 (=> (not res!662050) (not e!558555))))

(assert (=> b!990428 (= res!662050 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30589 _keys!1544)))))

(declare-fun b!990429 () Bool)

(assert (=> b!990429 (= e!558555 (arrayContainsKey!0 _keys!1544 lt!439239 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!117737 (not res!662049)) b!990428))

(assert (= (and b!990428 res!662050) b!990429))

(assert (=> d!117737 m!917771))

(declare-fun m!918133 () Bool)

(assert (=> b!990429 m!918133))

(assert (=> b!990181 d!117737))

(declare-fun b!990442 () Bool)

(declare-fun lt!439361 () SeekEntryResult!9165)

(declare-fun e!558562 () SeekEntryResult!9165)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62520 (_ BitVec 32)) SeekEntryResult!9165)

(assert (=> b!990442 (= e!558562 (seekKeyOrZeroReturnVacant!0 (x!86061 lt!439361) (index!39033 lt!439361) (index!39033 lt!439361) (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(declare-fun b!990443 () Bool)

(declare-fun e!558564 () SeekEntryResult!9165)

(assert (=> b!990443 (= e!558564 (Found!9165 (index!39033 lt!439361)))))

(declare-fun b!990444 () Bool)

(declare-fun c!100650 () Bool)

(declare-fun lt!439360 () (_ BitVec 64))

(assert (=> b!990444 (= c!100650 (= lt!439360 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990444 (= e!558564 e!558562)))

(declare-fun d!117739 () Bool)

(declare-fun lt!439362 () SeekEntryResult!9165)

(assert (=> d!117739 (and (or ((_ is Undefined!9165) lt!439362) (not ((_ is Found!9165) lt!439362)) (and (bvsge (index!39032 lt!439362) #b00000000000000000000000000000000) (bvslt (index!39032 lt!439362) (size!30589 _keys!1544)))) (or ((_ is Undefined!9165) lt!439362) ((_ is Found!9165) lt!439362) (not ((_ is MissingZero!9165) lt!439362)) (and (bvsge (index!39031 lt!439362) #b00000000000000000000000000000000) (bvslt (index!39031 lt!439362) (size!30589 _keys!1544)))) (or ((_ is Undefined!9165) lt!439362) ((_ is Found!9165) lt!439362) ((_ is MissingZero!9165) lt!439362) (not ((_ is MissingVacant!9165) lt!439362)) (and (bvsge (index!39034 lt!439362) #b00000000000000000000000000000000) (bvslt (index!39034 lt!439362) (size!30589 _keys!1544)))) (or ((_ is Undefined!9165) lt!439362) (ite ((_ is Found!9165) lt!439362) (= (select (arr!30109 _keys!1544) (index!39032 lt!439362)) (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9165) lt!439362) (= (select (arr!30109 _keys!1544) (index!39031 lt!439362)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9165) lt!439362) (= (select (arr!30109 _keys!1544) (index!39034 lt!439362)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!558563 () SeekEntryResult!9165)

(assert (=> d!117739 (= lt!439362 e!558563)))

(declare-fun c!100648 () Bool)

(assert (=> d!117739 (= c!100648 (and ((_ is Intermediate!9165) lt!439361) (undefined!9977 lt!439361)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62520 (_ BitVec 32)) SeekEntryResult!9165)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!117739 (= lt!439361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) mask!1948) (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(assert (=> d!117739 (validMask!0 mask!1948)))

(assert (=> d!117739 (= (seekEntryOrOpen!0 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) lt!439362)))

(declare-fun b!990445 () Bool)

(assert (=> b!990445 (= e!558562 (MissingZero!9165 (index!39033 lt!439361)))))

(declare-fun b!990446 () Bool)

(assert (=> b!990446 (= e!558563 Undefined!9165)))

(declare-fun b!990447 () Bool)

(assert (=> b!990447 (= e!558563 e!558564)))

(assert (=> b!990447 (= lt!439360 (select (arr!30109 _keys!1544) (index!39033 lt!439361)))))

(declare-fun c!100649 () Bool)

(assert (=> b!990447 (= c!100649 (= lt!439360 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117739 c!100648) b!990446))

(assert (= (and d!117739 (not c!100648)) b!990447))

(assert (= (and b!990447 c!100649) b!990443))

(assert (= (and b!990447 (not c!100649)) b!990444))

(assert (= (and b!990444 c!100650) b!990445))

(assert (= (and b!990444 (not c!100650)) b!990442))

(assert (=> b!990442 m!917771))

(declare-fun m!918135 () Bool)

(assert (=> b!990442 m!918135))

(declare-fun m!918137 () Bool)

(assert (=> d!117739 m!918137))

(assert (=> d!117739 m!917471))

(declare-fun m!918139 () Bool)

(assert (=> d!117739 m!918139))

(assert (=> d!117739 m!917771))

(declare-fun m!918141 () Bool)

(assert (=> d!117739 m!918141))

(declare-fun m!918143 () Bool)

(assert (=> d!117739 m!918143))

(assert (=> d!117739 m!917771))

(assert (=> d!117739 m!918139))

(declare-fun m!918145 () Bool)

(assert (=> d!117739 m!918145))

(declare-fun m!918147 () Bool)

(assert (=> b!990447 m!918147))

(assert (=> b!990181 d!117739))

(declare-fun d!117741 () Bool)

(assert (=> d!117741 (= (apply!904 (+!3113 lt!439160 (tuple2!14911 lt!439169 zeroValue!1220)) lt!439172) (get!15655 (getValueByKey!511 (toList!6820 (+!3113 lt!439160 (tuple2!14911 lt!439169 zeroValue!1220))) lt!439172)))))

(declare-fun bs!28097 () Bool)

(assert (= bs!28097 d!117741))

(declare-fun m!918149 () Bool)

(assert (=> bs!28097 m!918149))

(assert (=> bs!28097 m!918149))

(declare-fun m!918151 () Bool)

(assert (=> bs!28097 m!918151))

(assert (=> b!990104 d!117741))

(declare-fun d!117743 () Bool)

(assert (=> d!117743 (= (apply!904 lt!439159 lt!439171) (get!15655 (getValueByKey!511 (toList!6820 lt!439159) lt!439171)))))

(declare-fun bs!28098 () Bool)

(assert (= bs!28098 d!117743))

(declare-fun m!918153 () Bool)

(assert (=> bs!28098 m!918153))

(assert (=> bs!28098 m!918153))

(declare-fun m!918155 () Bool)

(assert (=> bs!28098 m!918155))

(assert (=> b!990104 d!117743))

(declare-fun d!117745 () Bool)

(assert (=> d!117745 (= (apply!904 lt!439160 lt!439172) (get!15655 (getValueByKey!511 (toList!6820 lt!439160) lt!439172)))))

(declare-fun bs!28099 () Bool)

(assert (= bs!28099 d!117745))

(declare-fun m!918157 () Bool)

(assert (=> bs!28099 m!918157))

(assert (=> bs!28099 m!918157))

(declare-fun m!918159 () Bool)

(assert (=> bs!28099 m!918159))

(assert (=> b!990104 d!117745))

(declare-fun d!117747 () Bool)

(assert (=> d!117747 (contains!5740 (+!3113 lt!439174 (tuple2!14911 lt!439173 zeroValue!1220)) lt!439166)))

(declare-fun lt!439365 () Unit!32822)

(declare-fun choose!1618 (ListLongMap!13609 (_ BitVec 64) V!35993 (_ BitVec 64)) Unit!32822)

(assert (=> d!117747 (= lt!439365 (choose!1618 lt!439174 lt!439173 zeroValue!1220 lt!439166))))

(assert (=> d!117747 (contains!5740 lt!439174 lt!439166)))

(assert (=> d!117747 (= (addStillContains!615 lt!439174 lt!439173 zeroValue!1220 lt!439166) lt!439365)))

(declare-fun bs!28100 () Bool)

(assert (= bs!28100 d!117747))

(assert (=> bs!28100 m!917641))

(assert (=> bs!28100 m!917641))

(assert (=> bs!28100 m!917643))

(declare-fun m!918161 () Bool)

(assert (=> bs!28100 m!918161))

(declare-fun m!918163 () Bool)

(assert (=> bs!28100 m!918163))

(assert (=> b!990104 d!117747))

(declare-fun d!117749 () Bool)

(declare-fun e!558566 () Bool)

(assert (=> d!117749 e!558566))

(declare-fun res!662051 () Bool)

(assert (=> d!117749 (=> res!662051 e!558566)))

(declare-fun lt!439366 () Bool)

(assert (=> d!117749 (= res!662051 (not lt!439366))))

(declare-fun lt!439369 () Bool)

(assert (=> d!117749 (= lt!439366 lt!439369)))

(declare-fun lt!439367 () Unit!32822)

(declare-fun e!558565 () Unit!32822)

(assert (=> d!117749 (= lt!439367 e!558565)))

(declare-fun c!100651 () Bool)

(assert (=> d!117749 (= c!100651 lt!439369)))

(assert (=> d!117749 (= lt!439369 (containsKey!480 (toList!6820 (+!3113 lt!439174 (tuple2!14911 lt!439173 zeroValue!1220))) lt!439166))))

(assert (=> d!117749 (= (contains!5740 (+!3113 lt!439174 (tuple2!14911 lt!439173 zeroValue!1220)) lt!439166) lt!439366)))

(declare-fun b!990449 () Bool)

(declare-fun lt!439368 () Unit!32822)

(assert (=> b!990449 (= e!558565 lt!439368)))

(assert (=> b!990449 (= lt!439368 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 (+!3113 lt!439174 (tuple2!14911 lt!439173 zeroValue!1220))) lt!439166))))

(assert (=> b!990449 (isDefined!382 (getValueByKey!511 (toList!6820 (+!3113 lt!439174 (tuple2!14911 lt!439173 zeroValue!1220))) lt!439166))))

(declare-fun b!990450 () Bool)

(declare-fun Unit!32838 () Unit!32822)

(assert (=> b!990450 (= e!558565 Unit!32838)))

(declare-fun b!990451 () Bool)

(assert (=> b!990451 (= e!558566 (isDefined!382 (getValueByKey!511 (toList!6820 (+!3113 lt!439174 (tuple2!14911 lt!439173 zeroValue!1220))) lt!439166)))))

(assert (= (and d!117749 c!100651) b!990449))

(assert (= (and d!117749 (not c!100651)) b!990450))

(assert (= (and d!117749 (not res!662051)) b!990451))

(declare-fun m!918165 () Bool)

(assert (=> d!117749 m!918165))

(declare-fun m!918167 () Bool)

(assert (=> b!990449 m!918167))

(declare-fun m!918169 () Bool)

(assert (=> b!990449 m!918169))

(assert (=> b!990449 m!918169))

(declare-fun m!918171 () Bool)

(assert (=> b!990449 m!918171))

(assert (=> b!990451 m!918169))

(assert (=> b!990451 m!918169))

(assert (=> b!990451 m!918171))

(assert (=> b!990104 d!117749))

(declare-fun d!117751 () Bool)

(declare-fun e!558567 () Bool)

(assert (=> d!117751 e!558567))

(declare-fun res!662053 () Bool)

(assert (=> d!117751 (=> (not res!662053) (not e!558567))))

(declare-fun lt!439371 () ListLongMap!13609)

(assert (=> d!117751 (= res!662053 (contains!5740 lt!439371 (_1!7466 (tuple2!14911 lt!439167 minValue!1220))))))

(declare-fun lt!439372 () List!20816)

(assert (=> d!117751 (= lt!439371 (ListLongMap!13610 lt!439372))))

(declare-fun lt!439370 () Unit!32822)

(declare-fun lt!439373 () Unit!32822)

(assert (=> d!117751 (= lt!439370 lt!439373)))

(assert (=> d!117751 (= (getValueByKey!511 lt!439372 (_1!7466 (tuple2!14911 lt!439167 minValue!1220))) (Some!516 (_2!7466 (tuple2!14911 lt!439167 minValue!1220))))))

(assert (=> d!117751 (= lt!439373 (lemmaContainsTupThenGetReturnValue!273 lt!439372 (_1!7466 (tuple2!14911 lt!439167 minValue!1220)) (_2!7466 (tuple2!14911 lt!439167 minValue!1220))))))

(assert (=> d!117751 (= lt!439372 (insertStrictlySorted!330 (toList!6820 lt!439159) (_1!7466 (tuple2!14911 lt!439167 minValue!1220)) (_2!7466 (tuple2!14911 lt!439167 minValue!1220))))))

(assert (=> d!117751 (= (+!3113 lt!439159 (tuple2!14911 lt!439167 minValue!1220)) lt!439371)))

(declare-fun b!990452 () Bool)

(declare-fun res!662052 () Bool)

(assert (=> b!990452 (=> (not res!662052) (not e!558567))))

(assert (=> b!990452 (= res!662052 (= (getValueByKey!511 (toList!6820 lt!439371) (_1!7466 (tuple2!14911 lt!439167 minValue!1220))) (Some!516 (_2!7466 (tuple2!14911 lt!439167 minValue!1220)))))))

(declare-fun b!990453 () Bool)

(assert (=> b!990453 (= e!558567 (contains!5741 (toList!6820 lt!439371) (tuple2!14911 lt!439167 minValue!1220)))))

(assert (= (and d!117751 res!662053) b!990452))

(assert (= (and b!990452 res!662052) b!990453))

(declare-fun m!918173 () Bool)

(assert (=> d!117751 m!918173))

(declare-fun m!918175 () Bool)

(assert (=> d!117751 m!918175))

(declare-fun m!918177 () Bool)

(assert (=> d!117751 m!918177))

(declare-fun m!918179 () Bool)

(assert (=> d!117751 m!918179))

(declare-fun m!918181 () Bool)

(assert (=> b!990452 m!918181))

(declare-fun m!918183 () Bool)

(assert (=> b!990453 m!918183))

(assert (=> b!990104 d!117751))

(assert (=> b!990104 d!117625))

(declare-fun d!117753 () Bool)

(assert (=> d!117753 (= (apply!904 (+!3113 lt!439160 (tuple2!14911 lt!439169 zeroValue!1220)) lt!439172) (apply!904 lt!439160 lt!439172))))

(declare-fun lt!439376 () Unit!32822)

(declare-fun choose!1619 (ListLongMap!13609 (_ BitVec 64) V!35993 (_ BitVec 64)) Unit!32822)

(assert (=> d!117753 (= lt!439376 (choose!1619 lt!439160 lt!439169 zeroValue!1220 lt!439172))))

(declare-fun e!558570 () Bool)

(assert (=> d!117753 e!558570))

(declare-fun res!662056 () Bool)

(assert (=> d!117753 (=> (not res!662056) (not e!558570))))

(assert (=> d!117753 (= res!662056 (contains!5740 lt!439160 lt!439172))))

(assert (=> d!117753 (= (addApplyDifferent!471 lt!439160 lt!439169 zeroValue!1220 lt!439172) lt!439376)))

(declare-fun b!990457 () Bool)

(assert (=> b!990457 (= e!558570 (not (= lt!439172 lt!439169)))))

(assert (= (and d!117753 res!662056) b!990457))

(assert (=> d!117753 m!917635))

(assert (=> d!117753 m!917635))

(assert (=> d!117753 m!917637))

(declare-fun m!918185 () Bool)

(assert (=> d!117753 m!918185))

(assert (=> d!117753 m!917649))

(declare-fun m!918187 () Bool)

(assert (=> d!117753 m!918187))

(assert (=> b!990104 d!117753))

(declare-fun d!117755 () Bool)

(declare-fun e!558571 () Bool)

(assert (=> d!117755 e!558571))

(declare-fun res!662058 () Bool)

(assert (=> d!117755 (=> (not res!662058) (not e!558571))))

(declare-fun lt!439378 () ListLongMap!13609)

(assert (=> d!117755 (= res!662058 (contains!5740 lt!439378 (_1!7466 (tuple2!14911 lt!439169 zeroValue!1220))))))

(declare-fun lt!439379 () List!20816)

(assert (=> d!117755 (= lt!439378 (ListLongMap!13610 lt!439379))))

(declare-fun lt!439377 () Unit!32822)

(declare-fun lt!439380 () Unit!32822)

(assert (=> d!117755 (= lt!439377 lt!439380)))

(assert (=> d!117755 (= (getValueByKey!511 lt!439379 (_1!7466 (tuple2!14911 lt!439169 zeroValue!1220))) (Some!516 (_2!7466 (tuple2!14911 lt!439169 zeroValue!1220))))))

(assert (=> d!117755 (= lt!439380 (lemmaContainsTupThenGetReturnValue!273 lt!439379 (_1!7466 (tuple2!14911 lt!439169 zeroValue!1220)) (_2!7466 (tuple2!14911 lt!439169 zeroValue!1220))))))

(assert (=> d!117755 (= lt!439379 (insertStrictlySorted!330 (toList!6820 lt!439160) (_1!7466 (tuple2!14911 lt!439169 zeroValue!1220)) (_2!7466 (tuple2!14911 lt!439169 zeroValue!1220))))))

(assert (=> d!117755 (= (+!3113 lt!439160 (tuple2!14911 lt!439169 zeroValue!1220)) lt!439378)))

(declare-fun b!990458 () Bool)

(declare-fun res!662057 () Bool)

(assert (=> b!990458 (=> (not res!662057) (not e!558571))))

(assert (=> b!990458 (= res!662057 (= (getValueByKey!511 (toList!6820 lt!439378) (_1!7466 (tuple2!14911 lt!439169 zeroValue!1220))) (Some!516 (_2!7466 (tuple2!14911 lt!439169 zeroValue!1220)))))))

(declare-fun b!990459 () Bool)

(assert (=> b!990459 (= e!558571 (contains!5741 (toList!6820 lt!439378) (tuple2!14911 lt!439169 zeroValue!1220)))))

(assert (= (and d!117755 res!662058) b!990458))

(assert (= (and b!990458 res!662057) b!990459))

(declare-fun m!918189 () Bool)

(assert (=> d!117755 m!918189))

(declare-fun m!918191 () Bool)

(assert (=> d!117755 m!918191))

(declare-fun m!918193 () Bool)

(assert (=> d!117755 m!918193))

(declare-fun m!918195 () Bool)

(assert (=> d!117755 m!918195))

(declare-fun m!918197 () Bool)

(assert (=> b!990458 m!918197))

(declare-fun m!918199 () Bool)

(assert (=> b!990459 m!918199))

(assert (=> b!990104 d!117755))

(declare-fun d!117757 () Bool)

(declare-fun e!558572 () Bool)

(assert (=> d!117757 e!558572))

(declare-fun res!662060 () Bool)

(assert (=> d!117757 (=> (not res!662060) (not e!558572))))

(declare-fun lt!439382 () ListLongMap!13609)

(assert (=> d!117757 (= res!662060 (contains!5740 lt!439382 (_1!7466 (tuple2!14911 lt!439168 minValue!1220))))))

(declare-fun lt!439383 () List!20816)

(assert (=> d!117757 (= lt!439382 (ListLongMap!13610 lt!439383))))

(declare-fun lt!439381 () Unit!32822)

(declare-fun lt!439384 () Unit!32822)

(assert (=> d!117757 (= lt!439381 lt!439384)))

(assert (=> d!117757 (= (getValueByKey!511 lt!439383 (_1!7466 (tuple2!14911 lt!439168 minValue!1220))) (Some!516 (_2!7466 (tuple2!14911 lt!439168 minValue!1220))))))

(assert (=> d!117757 (= lt!439384 (lemmaContainsTupThenGetReturnValue!273 lt!439383 (_1!7466 (tuple2!14911 lt!439168 minValue!1220)) (_2!7466 (tuple2!14911 lt!439168 minValue!1220))))))

(assert (=> d!117757 (= lt!439383 (insertStrictlySorted!330 (toList!6820 lt!439162) (_1!7466 (tuple2!14911 lt!439168 minValue!1220)) (_2!7466 (tuple2!14911 lt!439168 minValue!1220))))))

(assert (=> d!117757 (= (+!3113 lt!439162 (tuple2!14911 lt!439168 minValue!1220)) lt!439382)))

(declare-fun b!990460 () Bool)

(declare-fun res!662059 () Bool)

(assert (=> b!990460 (=> (not res!662059) (not e!558572))))

(assert (=> b!990460 (= res!662059 (= (getValueByKey!511 (toList!6820 lt!439382) (_1!7466 (tuple2!14911 lt!439168 minValue!1220))) (Some!516 (_2!7466 (tuple2!14911 lt!439168 minValue!1220)))))))

(declare-fun b!990461 () Bool)

(assert (=> b!990461 (= e!558572 (contains!5741 (toList!6820 lt!439382) (tuple2!14911 lt!439168 minValue!1220)))))

(assert (= (and d!117757 res!662060) b!990460))

(assert (= (and b!990460 res!662059) b!990461))

(declare-fun m!918201 () Bool)

(assert (=> d!117757 m!918201))

(declare-fun m!918203 () Bool)

(assert (=> d!117757 m!918203))

(declare-fun m!918205 () Bool)

(assert (=> d!117757 m!918205))

(declare-fun m!918207 () Bool)

(assert (=> d!117757 m!918207))

(declare-fun m!918209 () Bool)

(assert (=> b!990460 m!918209))

(declare-fun m!918211 () Bool)

(assert (=> b!990461 m!918211))

(assert (=> b!990104 d!117757))

(declare-fun d!117759 () Bool)

(assert (=> d!117759 (= (apply!904 (+!3113 lt!439162 (tuple2!14911 lt!439168 minValue!1220)) lt!439156) (apply!904 lt!439162 lt!439156))))

(declare-fun lt!439385 () Unit!32822)

(assert (=> d!117759 (= lt!439385 (choose!1619 lt!439162 lt!439168 minValue!1220 lt!439156))))

(declare-fun e!558573 () Bool)

(assert (=> d!117759 e!558573))

(declare-fun res!662061 () Bool)

(assert (=> d!117759 (=> (not res!662061) (not e!558573))))

(assert (=> d!117759 (= res!662061 (contains!5740 lt!439162 lt!439156))))

(assert (=> d!117759 (= (addApplyDifferent!471 lt!439162 lt!439168 minValue!1220 lt!439156) lt!439385)))

(declare-fun b!990462 () Bool)

(assert (=> b!990462 (= e!558573 (not (= lt!439156 lt!439168)))))

(assert (= (and d!117759 res!662061) b!990462))

(assert (=> d!117759 m!917659))

(assert (=> d!117759 m!917659))

(assert (=> d!117759 m!917661))

(declare-fun m!918213 () Bool)

(assert (=> d!117759 m!918213))

(assert (=> d!117759 m!917651))

(declare-fun m!918215 () Bool)

(assert (=> d!117759 m!918215))

(assert (=> b!990104 d!117759))

(declare-fun d!117761 () Bool)

(assert (=> d!117761 (= (apply!904 (+!3113 lt!439159 (tuple2!14911 lt!439167 minValue!1220)) lt!439171) (get!15655 (getValueByKey!511 (toList!6820 (+!3113 lt!439159 (tuple2!14911 lt!439167 minValue!1220))) lt!439171)))))

(declare-fun bs!28101 () Bool)

(assert (= bs!28101 d!117761))

(declare-fun m!918217 () Bool)

(assert (=> bs!28101 m!918217))

(assert (=> bs!28101 m!918217))

(declare-fun m!918219 () Bool)

(assert (=> bs!28101 m!918219))

(assert (=> b!990104 d!117761))

(declare-fun d!117763 () Bool)

(assert (=> d!117763 (= (apply!904 lt!439162 lt!439156) (get!15655 (getValueByKey!511 (toList!6820 lt!439162) lt!439156)))))

(declare-fun bs!28102 () Bool)

(assert (= bs!28102 d!117763))

(declare-fun m!918221 () Bool)

(assert (=> bs!28102 m!918221))

(assert (=> bs!28102 m!918221))

(declare-fun m!918223 () Bool)

(assert (=> bs!28102 m!918223))

(assert (=> b!990104 d!117763))

(declare-fun d!117765 () Bool)

(declare-fun e!558574 () Bool)

(assert (=> d!117765 e!558574))

(declare-fun res!662063 () Bool)

(assert (=> d!117765 (=> (not res!662063) (not e!558574))))

(declare-fun lt!439387 () ListLongMap!13609)

(assert (=> d!117765 (= res!662063 (contains!5740 lt!439387 (_1!7466 (tuple2!14911 lt!439173 zeroValue!1220))))))

(declare-fun lt!439388 () List!20816)

(assert (=> d!117765 (= lt!439387 (ListLongMap!13610 lt!439388))))

(declare-fun lt!439386 () Unit!32822)

(declare-fun lt!439389 () Unit!32822)

(assert (=> d!117765 (= lt!439386 lt!439389)))

(assert (=> d!117765 (= (getValueByKey!511 lt!439388 (_1!7466 (tuple2!14911 lt!439173 zeroValue!1220))) (Some!516 (_2!7466 (tuple2!14911 lt!439173 zeroValue!1220))))))

(assert (=> d!117765 (= lt!439389 (lemmaContainsTupThenGetReturnValue!273 lt!439388 (_1!7466 (tuple2!14911 lt!439173 zeroValue!1220)) (_2!7466 (tuple2!14911 lt!439173 zeroValue!1220))))))

(assert (=> d!117765 (= lt!439388 (insertStrictlySorted!330 (toList!6820 lt!439174) (_1!7466 (tuple2!14911 lt!439173 zeroValue!1220)) (_2!7466 (tuple2!14911 lt!439173 zeroValue!1220))))))

(assert (=> d!117765 (= (+!3113 lt!439174 (tuple2!14911 lt!439173 zeroValue!1220)) lt!439387)))

(declare-fun b!990463 () Bool)

(declare-fun res!662062 () Bool)

(assert (=> b!990463 (=> (not res!662062) (not e!558574))))

(assert (=> b!990463 (= res!662062 (= (getValueByKey!511 (toList!6820 lt!439387) (_1!7466 (tuple2!14911 lt!439173 zeroValue!1220))) (Some!516 (_2!7466 (tuple2!14911 lt!439173 zeroValue!1220)))))))

(declare-fun b!990464 () Bool)

(assert (=> b!990464 (= e!558574 (contains!5741 (toList!6820 lt!439387) (tuple2!14911 lt!439173 zeroValue!1220)))))

(assert (= (and d!117765 res!662063) b!990463))

(assert (= (and b!990463 res!662062) b!990464))

(declare-fun m!918225 () Bool)

(assert (=> d!117765 m!918225))

(declare-fun m!918227 () Bool)

(assert (=> d!117765 m!918227))

(declare-fun m!918229 () Bool)

(assert (=> d!117765 m!918229))

(declare-fun m!918231 () Bool)

(assert (=> d!117765 m!918231))

(declare-fun m!918233 () Bool)

(assert (=> b!990463 m!918233))

(declare-fun m!918235 () Bool)

(assert (=> b!990464 m!918235))

(assert (=> b!990104 d!117765))

(declare-fun d!117767 () Bool)

(assert (=> d!117767 (= (apply!904 (+!3113 lt!439159 (tuple2!14911 lt!439167 minValue!1220)) lt!439171) (apply!904 lt!439159 lt!439171))))

(declare-fun lt!439390 () Unit!32822)

(assert (=> d!117767 (= lt!439390 (choose!1619 lt!439159 lt!439167 minValue!1220 lt!439171))))

(declare-fun e!558575 () Bool)

(assert (=> d!117767 e!558575))

(declare-fun res!662064 () Bool)

(assert (=> d!117767 (=> (not res!662064) (not e!558575))))

(assert (=> d!117767 (= res!662064 (contains!5740 lt!439159 lt!439171))))

(assert (=> d!117767 (= (addApplyDifferent!471 lt!439159 lt!439167 minValue!1220 lt!439171) lt!439390)))

(declare-fun b!990465 () Bool)

(assert (=> b!990465 (= e!558575 (not (= lt!439171 lt!439167)))))

(assert (= (and d!117767 res!662064) b!990465))

(assert (=> d!117767 m!917645))

(assert (=> d!117767 m!917645))

(assert (=> d!117767 m!917647))

(declare-fun m!918237 () Bool)

(assert (=> d!117767 m!918237))

(assert (=> d!117767 m!917639))

(declare-fun m!918239 () Bool)

(assert (=> d!117767 m!918239))

(assert (=> b!990104 d!117767))

(declare-fun d!117769 () Bool)

(assert (=> d!117769 (= (apply!904 (+!3113 lt!439162 (tuple2!14911 lt!439168 minValue!1220)) lt!439156) (get!15655 (getValueByKey!511 (toList!6820 (+!3113 lt!439162 (tuple2!14911 lt!439168 minValue!1220))) lt!439156)))))

(declare-fun bs!28103 () Bool)

(assert (= bs!28103 d!117769))

(declare-fun m!918241 () Bool)

(assert (=> bs!28103 m!918241))

(assert (=> bs!28103 m!918241))

(declare-fun m!918243 () Bool)

(assert (=> bs!28103 m!918243))

(assert (=> b!990104 d!117769))

(assert (=> bm!41948 d!117625))

(declare-fun d!117771 () Bool)

(declare-fun lt!439391 () Bool)

(assert (=> d!117771 (= lt!439391 (select (content!421 (toList!6820 lt!439109)) lt!439060))))

(declare-fun e!558576 () Bool)

(assert (=> d!117771 (= lt!439391 e!558576)))

(declare-fun res!662065 () Bool)

(assert (=> d!117771 (=> (not res!662065) (not e!558576))))

(assert (=> d!117771 (= res!662065 ((_ is Cons!20812) (toList!6820 lt!439109)))))

(assert (=> d!117771 (= (contains!5741 (toList!6820 lt!439109) lt!439060) lt!439391)))

(declare-fun b!990466 () Bool)

(declare-fun e!558577 () Bool)

(assert (=> b!990466 (= e!558576 e!558577)))

(declare-fun res!662066 () Bool)

(assert (=> b!990466 (=> res!662066 e!558577)))

(assert (=> b!990466 (= res!662066 (= (h!21980 (toList!6820 lt!439109)) lt!439060))))

(declare-fun b!990467 () Bool)

(assert (=> b!990467 (= e!558577 (contains!5741 (t!29761 (toList!6820 lt!439109)) lt!439060))))

(assert (= (and d!117771 res!662065) b!990466))

(assert (= (and b!990466 (not res!662066)) b!990467))

(declare-fun m!918245 () Bool)

(assert (=> d!117771 m!918245))

(declare-fun m!918247 () Bool)

(assert (=> d!117771 m!918247))

(declare-fun m!918249 () Bool)

(assert (=> b!990467 m!918249))

(assert (=> b!990042 d!117771))

(declare-fun d!117773 () Bool)

(assert (=> d!117773 (= (apply!904 (+!3113 lt!439195 (tuple2!14911 lt!439201 minValue!1220)) lt!439189) (apply!904 lt!439195 lt!439189))))

(declare-fun lt!439392 () Unit!32822)

(assert (=> d!117773 (= lt!439392 (choose!1619 lt!439195 lt!439201 minValue!1220 lt!439189))))

(declare-fun e!558578 () Bool)

(assert (=> d!117773 e!558578))

(declare-fun res!662067 () Bool)

(assert (=> d!117773 (=> (not res!662067) (not e!558578))))

(assert (=> d!117773 (= res!662067 (contains!5740 lt!439195 lt!439189))))

(assert (=> d!117773 (= (addApplyDifferent!471 lt!439195 lt!439201 minValue!1220 lt!439189) lt!439392)))

(declare-fun b!990468 () Bool)

(assert (=> b!990468 (= e!558578 (not (= lt!439189 lt!439201)))))

(assert (= (and d!117773 res!662067) b!990468))

(assert (=> d!117773 m!917741))

(assert (=> d!117773 m!917741))

(assert (=> d!117773 m!917743))

(declare-fun m!918251 () Bool)

(assert (=> d!117773 m!918251))

(assert (=> d!117773 m!917733))

(declare-fun m!918253 () Bool)

(assert (=> d!117773 m!918253))

(assert (=> b!990129 d!117773))

(declare-fun d!117775 () Bool)

(assert (=> d!117775 (= (apply!904 lt!439195 lt!439189) (get!15655 (getValueByKey!511 (toList!6820 lt!439195) lt!439189)))))

(declare-fun bs!28104 () Bool)

(assert (= bs!28104 d!117775))

(declare-fun m!918255 () Bool)

(assert (=> bs!28104 m!918255))

(assert (=> bs!28104 m!918255))

(declare-fun m!918257 () Bool)

(assert (=> bs!28104 m!918257))

(assert (=> b!990129 d!117775))

(declare-fun d!117777 () Bool)

(assert (=> d!117777 (= (apply!904 (+!3113 lt!439193 (tuple2!14911 lt!439202 zeroValue!1220)) lt!439205) (get!15655 (getValueByKey!511 (toList!6820 (+!3113 lt!439193 (tuple2!14911 lt!439202 zeroValue!1220))) lt!439205)))))

(declare-fun bs!28105 () Bool)

(assert (= bs!28105 d!117777))

(declare-fun m!918259 () Bool)

(assert (=> bs!28105 m!918259))

(assert (=> bs!28105 m!918259))

(declare-fun m!918261 () Bool)

(assert (=> bs!28105 m!918261))

(assert (=> b!990129 d!117777))

(declare-fun d!117779 () Bool)

(assert (=> d!117779 (= (apply!904 lt!439193 lt!439205) (get!15655 (getValueByKey!511 (toList!6820 lt!439193) lt!439205)))))

(declare-fun bs!28106 () Bool)

(assert (= bs!28106 d!117779))

(declare-fun m!918263 () Bool)

(assert (=> bs!28106 m!918263))

(assert (=> bs!28106 m!918263))

(declare-fun m!918265 () Bool)

(assert (=> bs!28106 m!918265))

(assert (=> b!990129 d!117779))

(declare-fun d!117781 () Bool)

(assert (=> d!117781 (= (apply!904 (+!3113 lt!439193 (tuple2!14911 lt!439202 zeroValue!1220)) lt!439205) (apply!904 lt!439193 lt!439205))))

(declare-fun lt!439393 () Unit!32822)

(assert (=> d!117781 (= lt!439393 (choose!1619 lt!439193 lt!439202 zeroValue!1220 lt!439205))))

(declare-fun e!558579 () Bool)

(assert (=> d!117781 e!558579))

(declare-fun res!662068 () Bool)

(assert (=> d!117781 (=> (not res!662068) (not e!558579))))

(assert (=> d!117781 (= res!662068 (contains!5740 lt!439193 lt!439205))))

(assert (=> d!117781 (= (addApplyDifferent!471 lt!439193 lt!439202 zeroValue!1220 lt!439205) lt!439393)))

(declare-fun b!990469 () Bool)

(assert (=> b!990469 (= e!558579 (not (= lt!439205 lt!439202)))))

(assert (= (and d!117781 res!662068) b!990469))

(assert (=> d!117781 m!917717))

(assert (=> d!117781 m!917717))

(assert (=> d!117781 m!917719))

(declare-fun m!918267 () Bool)

(assert (=> d!117781 m!918267))

(assert (=> d!117781 m!917731))

(declare-fun m!918269 () Bool)

(assert (=> d!117781 m!918269))

(assert (=> b!990129 d!117781))

(declare-fun b!990470 () Bool)

(declare-fun e!558584 () Bool)

(declare-fun e!558581 () Bool)

(assert (=> b!990470 (= e!558584 e!558581)))

(declare-fun c!100655 () Bool)

(assert (=> b!990470 (= c!100655 (bvslt from!1932 (size!30589 _keys!1544)))))

(declare-fun b!990471 () Bool)

(declare-fun e!558585 () ListLongMap!13609)

(declare-fun call!41997 () ListLongMap!13609)

(assert (=> b!990471 (= e!558585 call!41997)))

(declare-fun b!990472 () Bool)

(declare-fun e!558580 () Bool)

(assert (=> b!990472 (= e!558580 e!558584)))

(declare-fun c!100653 () Bool)

(declare-fun e!558583 () Bool)

(assert (=> b!990472 (= c!100653 e!558583)))

(declare-fun res!662069 () Bool)

(assert (=> b!990472 (=> (not res!662069) (not e!558583))))

(assert (=> b!990472 (= res!662069 (bvslt from!1932 (size!30589 _keys!1544)))))

(declare-fun b!990473 () Bool)

(declare-fun e!558582 () Bool)

(assert (=> b!990473 (= e!558584 e!558582)))

(assert (=> b!990473 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30589 _keys!1544)))))

(declare-fun res!662072 () Bool)

(declare-fun lt!439398 () ListLongMap!13609)

(assert (=> b!990473 (= res!662072 (contains!5740 lt!439398 (select (arr!30109 _keys!1544) from!1932)))))

(assert (=> b!990473 (=> (not res!662072) (not e!558582))))

(declare-fun bm!41994 () Bool)

(assert (=> bm!41994 (= call!41997 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!990474 () Bool)

(declare-fun e!558586 () ListLongMap!13609)

(assert (=> b!990474 (= e!558586 e!558585)))

(declare-fun c!100654 () Bool)

(assert (=> b!990474 (= c!100654 (validKeyInArray!0 (select (arr!30109 _keys!1544) from!1932)))))

(declare-fun b!990475 () Bool)

(assert (=> b!990475 (= e!558586 (ListLongMap!13610 Nil!20813))))

(declare-fun b!990476 () Bool)

(assert (=> b!990476 (= e!558581 (isEmpty!729 lt!439398))))

(declare-fun b!990477 () Bool)

(assert (=> b!990477 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30589 _keys!1544)))))

(assert (=> b!990477 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30588 _values!1278)))))

(assert (=> b!990477 (= e!558582 (= (apply!904 lt!439398 (select (arr!30109 _keys!1544) from!1932)) (get!15652 (select (arr!30108 _values!1278) from!1932) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!990478 () Bool)

(declare-fun res!662070 () Bool)

(assert (=> b!990478 (=> (not res!662070) (not e!558580))))

(assert (=> b!990478 (= res!662070 (not (contains!5740 lt!439398 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990479 () Bool)

(assert (=> b!990479 (= e!558581 (= lt!439398 (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun d!117783 () Bool)

(assert (=> d!117783 e!558580))

(declare-fun res!662071 () Bool)

(assert (=> d!117783 (=> (not res!662071) (not e!558580))))

(assert (=> d!117783 (= res!662071 (not (contains!5740 lt!439398 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117783 (= lt!439398 e!558586)))

(declare-fun c!100652 () Bool)

(assert (=> d!117783 (= c!100652 (bvsge from!1932 (size!30589 _keys!1544)))))

(assert (=> d!117783 (validMask!0 mask!1948)))

(assert (=> d!117783 (= (getCurrentListMapNoExtraKeys!3548 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!439398)))

(declare-fun b!990480 () Bool)

(declare-fun lt!439397 () Unit!32822)

(declare-fun lt!439395 () Unit!32822)

(assert (=> b!990480 (= lt!439397 lt!439395)))

(declare-fun lt!439400 () (_ BitVec 64))

(declare-fun lt!439399 () ListLongMap!13609)

(declare-fun lt!439394 () V!35993)

(declare-fun lt!439396 () (_ BitVec 64))

(assert (=> b!990480 (not (contains!5740 (+!3113 lt!439399 (tuple2!14911 lt!439396 lt!439394)) lt!439400))))

(assert (=> b!990480 (= lt!439395 (addStillNotContains!236 lt!439399 lt!439396 lt!439394 lt!439400))))

(assert (=> b!990480 (= lt!439400 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!990480 (= lt!439394 (get!15652 (select (arr!30108 _values!1278) from!1932) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!990480 (= lt!439396 (select (arr!30109 _keys!1544) from!1932))))

(assert (=> b!990480 (= lt!439399 call!41997)))

(assert (=> b!990480 (= e!558585 (+!3113 call!41997 (tuple2!14911 (select (arr!30109 _keys!1544) from!1932) (get!15652 (select (arr!30108 _values!1278) from!1932) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!990481 () Bool)

(assert (=> b!990481 (= e!558583 (validKeyInArray!0 (select (arr!30109 _keys!1544) from!1932)))))

(assert (=> b!990481 (bvsge from!1932 #b00000000000000000000000000000000)))

(assert (= (and d!117783 c!100652) b!990475))

(assert (= (and d!117783 (not c!100652)) b!990474))

(assert (= (and b!990474 c!100654) b!990480))

(assert (= (and b!990474 (not c!100654)) b!990471))

(assert (= (or b!990480 b!990471) bm!41994))

(assert (= (and d!117783 res!662071) b!990478))

(assert (= (and b!990478 res!662070) b!990472))

(assert (= (and b!990472 res!662069) b!990481))

(assert (= (and b!990472 c!100653) b!990473))

(assert (= (and b!990472 (not c!100653)) b!990470))

(assert (= (and b!990473 res!662072) b!990477))

(assert (= (and b!990470 c!100655) b!990479))

(assert (= (and b!990470 (not c!100655)) b!990476))

(declare-fun b_lambda!15139 () Bool)

(assert (=> (not b_lambda!15139) (not b!990477)))

(assert (=> b!990477 t!29759))

(declare-fun b_and!32185 () Bool)

(assert (= b_and!32183 (and (=> t!29759 result!13595) b_and!32185)))

(declare-fun b_lambda!15141 () Bool)

(assert (=> (not b_lambda!15141) (not b!990480)))

(assert (=> b!990480 t!29759))

(declare-fun b_and!32187 () Bool)

(assert (= b_and!32185 (and (=> t!29759 result!13595) b_and!32187)))

(assert (=> b!990474 m!917455))

(assert (=> b!990474 m!917455))

(assert (=> b!990474 m!917469))

(declare-fun m!918271 () Bool)

(assert (=> b!990479 m!918271))

(assert (=> b!990477 m!917457))

(assert (=> b!990477 m!917461))

(assert (=> b!990477 m!917455))

(assert (=> b!990477 m!917457))

(assert (=> b!990477 m!917461))

(assert (=> b!990477 m!917463))

(assert (=> b!990477 m!917455))

(declare-fun m!918273 () Bool)

(assert (=> b!990477 m!918273))

(assert (=> b!990481 m!917455))

(assert (=> b!990481 m!917455))

(assert (=> b!990481 m!917469))

(assert (=> bm!41994 m!918271))

(declare-fun m!918275 () Bool)

(assert (=> b!990480 m!918275))

(declare-fun m!918277 () Bool)

(assert (=> b!990480 m!918277))

(assert (=> b!990480 m!917461))

(assert (=> b!990480 m!917455))

(assert (=> b!990480 m!917457))

(assert (=> b!990480 m!917461))

(assert (=> b!990480 m!917463))

(assert (=> b!990480 m!917457))

(declare-fun m!918279 () Bool)

(assert (=> b!990480 m!918279))

(assert (=> b!990480 m!918275))

(declare-fun m!918281 () Bool)

(assert (=> b!990480 m!918281))

(assert (=> b!990473 m!917455))

(assert (=> b!990473 m!917455))

(declare-fun m!918283 () Bool)

(assert (=> b!990473 m!918283))

(declare-fun m!918285 () Bool)

(assert (=> b!990476 m!918285))

(declare-fun m!918287 () Bool)

(assert (=> b!990478 m!918287))

(declare-fun m!918289 () Bool)

(assert (=> d!117783 m!918289))

(assert (=> d!117783 m!917471))

(assert (=> b!990129 d!117783))

(declare-fun d!117785 () Bool)

(assert (=> d!117785 (contains!5740 (+!3113 lt!439207 (tuple2!14911 lt!439206 zeroValue!1220)) lt!439199)))

(declare-fun lt!439401 () Unit!32822)

(assert (=> d!117785 (= lt!439401 (choose!1618 lt!439207 lt!439206 zeroValue!1220 lt!439199))))

(assert (=> d!117785 (contains!5740 lt!439207 lt!439199)))

(assert (=> d!117785 (= (addStillContains!615 lt!439207 lt!439206 zeroValue!1220 lt!439199) lt!439401)))

(declare-fun bs!28107 () Bool)

(assert (= bs!28107 d!117785))

(assert (=> bs!28107 m!917723))

(assert (=> bs!28107 m!917723))

(assert (=> bs!28107 m!917725))

(declare-fun m!918291 () Bool)

(assert (=> bs!28107 m!918291))

(declare-fun m!918293 () Bool)

(assert (=> bs!28107 m!918293))

(assert (=> b!990129 d!117785))

(declare-fun d!117787 () Bool)

(declare-fun e!558588 () Bool)

(assert (=> d!117787 e!558588))

(declare-fun res!662073 () Bool)

(assert (=> d!117787 (=> res!662073 e!558588)))

(declare-fun lt!439402 () Bool)

(assert (=> d!117787 (= res!662073 (not lt!439402))))

(declare-fun lt!439405 () Bool)

(assert (=> d!117787 (= lt!439402 lt!439405)))

(declare-fun lt!439403 () Unit!32822)

(declare-fun e!558587 () Unit!32822)

(assert (=> d!117787 (= lt!439403 e!558587)))

(declare-fun c!100656 () Bool)

(assert (=> d!117787 (= c!100656 lt!439405)))

(assert (=> d!117787 (= lt!439405 (containsKey!480 (toList!6820 (+!3113 lt!439207 (tuple2!14911 lt!439206 zeroValue!1220))) lt!439199))))

(assert (=> d!117787 (= (contains!5740 (+!3113 lt!439207 (tuple2!14911 lt!439206 zeroValue!1220)) lt!439199) lt!439402)))

(declare-fun b!990482 () Bool)

(declare-fun lt!439404 () Unit!32822)

(assert (=> b!990482 (= e!558587 lt!439404)))

(assert (=> b!990482 (= lt!439404 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 (+!3113 lt!439207 (tuple2!14911 lt!439206 zeroValue!1220))) lt!439199))))

(assert (=> b!990482 (isDefined!382 (getValueByKey!511 (toList!6820 (+!3113 lt!439207 (tuple2!14911 lt!439206 zeroValue!1220))) lt!439199))))

(declare-fun b!990483 () Bool)

(declare-fun Unit!32839 () Unit!32822)

(assert (=> b!990483 (= e!558587 Unit!32839)))

(declare-fun b!990484 () Bool)

(assert (=> b!990484 (= e!558588 (isDefined!382 (getValueByKey!511 (toList!6820 (+!3113 lt!439207 (tuple2!14911 lt!439206 zeroValue!1220))) lt!439199)))))

(assert (= (and d!117787 c!100656) b!990482))

(assert (= (and d!117787 (not c!100656)) b!990483))

(assert (= (and d!117787 (not res!662073)) b!990484))

(declare-fun m!918295 () Bool)

(assert (=> d!117787 m!918295))

(declare-fun m!918297 () Bool)

(assert (=> b!990482 m!918297))

(declare-fun m!918299 () Bool)

(assert (=> b!990482 m!918299))

(assert (=> b!990482 m!918299))

(declare-fun m!918301 () Bool)

(assert (=> b!990482 m!918301))

(assert (=> b!990484 m!918299))

(assert (=> b!990484 m!918299))

(assert (=> b!990484 m!918301))

(assert (=> b!990129 d!117787))

(declare-fun d!117789 () Bool)

(declare-fun e!558589 () Bool)

(assert (=> d!117789 e!558589))

(declare-fun res!662075 () Bool)

(assert (=> d!117789 (=> (not res!662075) (not e!558589))))

(declare-fun lt!439407 () ListLongMap!13609)

(assert (=> d!117789 (= res!662075 (contains!5740 lt!439407 (_1!7466 (tuple2!14911 lt!439202 zeroValue!1220))))))

(declare-fun lt!439408 () List!20816)

(assert (=> d!117789 (= lt!439407 (ListLongMap!13610 lt!439408))))

(declare-fun lt!439406 () Unit!32822)

(declare-fun lt!439409 () Unit!32822)

(assert (=> d!117789 (= lt!439406 lt!439409)))

(assert (=> d!117789 (= (getValueByKey!511 lt!439408 (_1!7466 (tuple2!14911 lt!439202 zeroValue!1220))) (Some!516 (_2!7466 (tuple2!14911 lt!439202 zeroValue!1220))))))

(assert (=> d!117789 (= lt!439409 (lemmaContainsTupThenGetReturnValue!273 lt!439408 (_1!7466 (tuple2!14911 lt!439202 zeroValue!1220)) (_2!7466 (tuple2!14911 lt!439202 zeroValue!1220))))))

(assert (=> d!117789 (= lt!439408 (insertStrictlySorted!330 (toList!6820 lt!439193) (_1!7466 (tuple2!14911 lt!439202 zeroValue!1220)) (_2!7466 (tuple2!14911 lt!439202 zeroValue!1220))))))

(assert (=> d!117789 (= (+!3113 lt!439193 (tuple2!14911 lt!439202 zeroValue!1220)) lt!439407)))

(declare-fun b!990485 () Bool)

(declare-fun res!662074 () Bool)

(assert (=> b!990485 (=> (not res!662074) (not e!558589))))

(assert (=> b!990485 (= res!662074 (= (getValueByKey!511 (toList!6820 lt!439407) (_1!7466 (tuple2!14911 lt!439202 zeroValue!1220))) (Some!516 (_2!7466 (tuple2!14911 lt!439202 zeroValue!1220)))))))

(declare-fun b!990486 () Bool)

(assert (=> b!990486 (= e!558589 (contains!5741 (toList!6820 lt!439407) (tuple2!14911 lt!439202 zeroValue!1220)))))

(assert (= (and d!117789 res!662075) b!990485))

(assert (= (and b!990485 res!662074) b!990486))

(declare-fun m!918303 () Bool)

(assert (=> d!117789 m!918303))

(declare-fun m!918305 () Bool)

(assert (=> d!117789 m!918305))

(declare-fun m!918307 () Bool)

(assert (=> d!117789 m!918307))

(declare-fun m!918309 () Bool)

(assert (=> d!117789 m!918309))

(declare-fun m!918311 () Bool)

(assert (=> b!990485 m!918311))

(declare-fun m!918313 () Bool)

(assert (=> b!990486 m!918313))

(assert (=> b!990129 d!117789))

(declare-fun d!117791 () Bool)

(declare-fun e!558590 () Bool)

(assert (=> d!117791 e!558590))

(declare-fun res!662077 () Bool)

(assert (=> d!117791 (=> (not res!662077) (not e!558590))))

(declare-fun lt!439411 () ListLongMap!13609)

(assert (=> d!117791 (= res!662077 (contains!5740 lt!439411 (_1!7466 (tuple2!14911 lt!439206 zeroValue!1220))))))

(declare-fun lt!439412 () List!20816)

(assert (=> d!117791 (= lt!439411 (ListLongMap!13610 lt!439412))))

(declare-fun lt!439410 () Unit!32822)

(declare-fun lt!439413 () Unit!32822)

(assert (=> d!117791 (= lt!439410 lt!439413)))

(assert (=> d!117791 (= (getValueByKey!511 lt!439412 (_1!7466 (tuple2!14911 lt!439206 zeroValue!1220))) (Some!516 (_2!7466 (tuple2!14911 lt!439206 zeroValue!1220))))))

(assert (=> d!117791 (= lt!439413 (lemmaContainsTupThenGetReturnValue!273 lt!439412 (_1!7466 (tuple2!14911 lt!439206 zeroValue!1220)) (_2!7466 (tuple2!14911 lt!439206 zeroValue!1220))))))

(assert (=> d!117791 (= lt!439412 (insertStrictlySorted!330 (toList!6820 lt!439207) (_1!7466 (tuple2!14911 lt!439206 zeroValue!1220)) (_2!7466 (tuple2!14911 lt!439206 zeroValue!1220))))))

(assert (=> d!117791 (= (+!3113 lt!439207 (tuple2!14911 lt!439206 zeroValue!1220)) lt!439411)))

(declare-fun b!990487 () Bool)

(declare-fun res!662076 () Bool)

(assert (=> b!990487 (=> (not res!662076) (not e!558590))))

(assert (=> b!990487 (= res!662076 (= (getValueByKey!511 (toList!6820 lt!439411) (_1!7466 (tuple2!14911 lt!439206 zeroValue!1220))) (Some!516 (_2!7466 (tuple2!14911 lt!439206 zeroValue!1220)))))))

(declare-fun b!990488 () Bool)

(assert (=> b!990488 (= e!558590 (contains!5741 (toList!6820 lt!439411) (tuple2!14911 lt!439206 zeroValue!1220)))))

(assert (= (and d!117791 res!662077) b!990487))

(assert (= (and b!990487 res!662076) b!990488))

(declare-fun m!918315 () Bool)

(assert (=> d!117791 m!918315))

(declare-fun m!918317 () Bool)

(assert (=> d!117791 m!918317))

(declare-fun m!918319 () Bool)

(assert (=> d!117791 m!918319))

(declare-fun m!918321 () Bool)

(assert (=> d!117791 m!918321))

(declare-fun m!918323 () Bool)

(assert (=> b!990487 m!918323))

(declare-fun m!918325 () Bool)

(assert (=> b!990488 m!918325))

(assert (=> b!990129 d!117791))

(declare-fun d!117793 () Bool)

(assert (=> d!117793 (= (apply!904 (+!3113 lt!439192 (tuple2!14911 lt!439200 minValue!1220)) lt!439204) (get!15655 (getValueByKey!511 (toList!6820 (+!3113 lt!439192 (tuple2!14911 lt!439200 minValue!1220))) lt!439204)))))

(declare-fun bs!28108 () Bool)

(assert (= bs!28108 d!117793))

(declare-fun m!918327 () Bool)

(assert (=> bs!28108 m!918327))

(assert (=> bs!28108 m!918327))

(declare-fun m!918329 () Bool)

(assert (=> bs!28108 m!918329))

(assert (=> b!990129 d!117793))

(declare-fun d!117795 () Bool)

(assert (=> d!117795 (= (apply!904 (+!3113 lt!439195 (tuple2!14911 lt!439201 minValue!1220)) lt!439189) (get!15655 (getValueByKey!511 (toList!6820 (+!3113 lt!439195 (tuple2!14911 lt!439201 minValue!1220))) lt!439189)))))

(declare-fun bs!28109 () Bool)

(assert (= bs!28109 d!117795))

(declare-fun m!918331 () Bool)

(assert (=> bs!28109 m!918331))

(assert (=> bs!28109 m!918331))

(declare-fun m!918333 () Bool)

(assert (=> bs!28109 m!918333))

(assert (=> b!990129 d!117795))

(declare-fun d!117797 () Bool)

(assert (=> d!117797 (= (apply!904 lt!439192 lt!439204) (get!15655 (getValueByKey!511 (toList!6820 lt!439192) lt!439204)))))

(declare-fun bs!28110 () Bool)

(assert (= bs!28110 d!117797))

(declare-fun m!918335 () Bool)

(assert (=> bs!28110 m!918335))

(assert (=> bs!28110 m!918335))

(declare-fun m!918337 () Bool)

(assert (=> bs!28110 m!918337))

(assert (=> b!990129 d!117797))

(declare-fun d!117799 () Bool)

(declare-fun e!558591 () Bool)

(assert (=> d!117799 e!558591))

(declare-fun res!662079 () Bool)

(assert (=> d!117799 (=> (not res!662079) (not e!558591))))

(declare-fun lt!439415 () ListLongMap!13609)

(assert (=> d!117799 (= res!662079 (contains!5740 lt!439415 (_1!7466 (tuple2!14911 lt!439200 minValue!1220))))))

(declare-fun lt!439416 () List!20816)

(assert (=> d!117799 (= lt!439415 (ListLongMap!13610 lt!439416))))

(declare-fun lt!439414 () Unit!32822)

(declare-fun lt!439417 () Unit!32822)

(assert (=> d!117799 (= lt!439414 lt!439417)))

(assert (=> d!117799 (= (getValueByKey!511 lt!439416 (_1!7466 (tuple2!14911 lt!439200 minValue!1220))) (Some!516 (_2!7466 (tuple2!14911 lt!439200 minValue!1220))))))

(assert (=> d!117799 (= lt!439417 (lemmaContainsTupThenGetReturnValue!273 lt!439416 (_1!7466 (tuple2!14911 lt!439200 minValue!1220)) (_2!7466 (tuple2!14911 lt!439200 minValue!1220))))))

(assert (=> d!117799 (= lt!439416 (insertStrictlySorted!330 (toList!6820 lt!439192) (_1!7466 (tuple2!14911 lt!439200 minValue!1220)) (_2!7466 (tuple2!14911 lt!439200 minValue!1220))))))

(assert (=> d!117799 (= (+!3113 lt!439192 (tuple2!14911 lt!439200 minValue!1220)) lt!439415)))

(declare-fun b!990489 () Bool)

(declare-fun res!662078 () Bool)

(assert (=> b!990489 (=> (not res!662078) (not e!558591))))

(assert (=> b!990489 (= res!662078 (= (getValueByKey!511 (toList!6820 lt!439415) (_1!7466 (tuple2!14911 lt!439200 minValue!1220))) (Some!516 (_2!7466 (tuple2!14911 lt!439200 minValue!1220)))))))

(declare-fun b!990490 () Bool)

(assert (=> b!990490 (= e!558591 (contains!5741 (toList!6820 lt!439415) (tuple2!14911 lt!439200 minValue!1220)))))

(assert (= (and d!117799 res!662079) b!990489))

(assert (= (and b!990489 res!662078) b!990490))

(declare-fun m!918339 () Bool)

(assert (=> d!117799 m!918339))

(declare-fun m!918341 () Bool)

(assert (=> d!117799 m!918341))

(declare-fun m!918343 () Bool)

(assert (=> d!117799 m!918343))

(declare-fun m!918345 () Bool)

(assert (=> d!117799 m!918345))

(declare-fun m!918347 () Bool)

(assert (=> b!990489 m!918347))

(declare-fun m!918349 () Bool)

(assert (=> b!990490 m!918349))

(assert (=> b!990129 d!117799))

(declare-fun d!117801 () Bool)

(assert (=> d!117801 (= (apply!904 (+!3113 lt!439192 (tuple2!14911 lt!439200 minValue!1220)) lt!439204) (apply!904 lt!439192 lt!439204))))

(declare-fun lt!439418 () Unit!32822)

(assert (=> d!117801 (= lt!439418 (choose!1619 lt!439192 lt!439200 minValue!1220 lt!439204))))

(declare-fun e!558592 () Bool)

(assert (=> d!117801 e!558592))

(declare-fun res!662080 () Bool)

(assert (=> d!117801 (=> (not res!662080) (not e!558592))))

(assert (=> d!117801 (= res!662080 (contains!5740 lt!439192 lt!439204))))

(assert (=> d!117801 (= (addApplyDifferent!471 lt!439192 lt!439200 minValue!1220 lt!439204) lt!439418)))

(declare-fun b!990491 () Bool)

(assert (=> b!990491 (= e!558592 (not (= lt!439204 lt!439200)))))

(assert (= (and d!117801 res!662080) b!990491))

(assert (=> d!117801 m!917727))

(assert (=> d!117801 m!917727))

(assert (=> d!117801 m!917729))

(declare-fun m!918351 () Bool)

(assert (=> d!117801 m!918351))

(assert (=> d!117801 m!917721))

(declare-fun m!918353 () Bool)

(assert (=> d!117801 m!918353))

(assert (=> b!990129 d!117801))

(declare-fun d!117803 () Bool)

(declare-fun e!558593 () Bool)

(assert (=> d!117803 e!558593))

(declare-fun res!662082 () Bool)

(assert (=> d!117803 (=> (not res!662082) (not e!558593))))

(declare-fun lt!439420 () ListLongMap!13609)

(assert (=> d!117803 (= res!662082 (contains!5740 lt!439420 (_1!7466 (tuple2!14911 lt!439201 minValue!1220))))))

(declare-fun lt!439421 () List!20816)

(assert (=> d!117803 (= lt!439420 (ListLongMap!13610 lt!439421))))

(declare-fun lt!439419 () Unit!32822)

(declare-fun lt!439422 () Unit!32822)

(assert (=> d!117803 (= lt!439419 lt!439422)))

(assert (=> d!117803 (= (getValueByKey!511 lt!439421 (_1!7466 (tuple2!14911 lt!439201 minValue!1220))) (Some!516 (_2!7466 (tuple2!14911 lt!439201 minValue!1220))))))

(assert (=> d!117803 (= lt!439422 (lemmaContainsTupThenGetReturnValue!273 lt!439421 (_1!7466 (tuple2!14911 lt!439201 minValue!1220)) (_2!7466 (tuple2!14911 lt!439201 minValue!1220))))))

(assert (=> d!117803 (= lt!439421 (insertStrictlySorted!330 (toList!6820 lt!439195) (_1!7466 (tuple2!14911 lt!439201 minValue!1220)) (_2!7466 (tuple2!14911 lt!439201 minValue!1220))))))

(assert (=> d!117803 (= (+!3113 lt!439195 (tuple2!14911 lt!439201 minValue!1220)) lt!439420)))

(declare-fun b!990492 () Bool)

(declare-fun res!662081 () Bool)

(assert (=> b!990492 (=> (not res!662081) (not e!558593))))

(assert (=> b!990492 (= res!662081 (= (getValueByKey!511 (toList!6820 lt!439420) (_1!7466 (tuple2!14911 lt!439201 minValue!1220))) (Some!516 (_2!7466 (tuple2!14911 lt!439201 minValue!1220)))))))

(declare-fun b!990493 () Bool)

(assert (=> b!990493 (= e!558593 (contains!5741 (toList!6820 lt!439420) (tuple2!14911 lt!439201 minValue!1220)))))

(assert (= (and d!117803 res!662082) b!990492))

(assert (= (and b!990492 res!662081) b!990493))

(declare-fun m!918355 () Bool)

(assert (=> d!117803 m!918355))

(declare-fun m!918357 () Bool)

(assert (=> d!117803 m!918357))

(declare-fun m!918359 () Bool)

(assert (=> d!117803 m!918359))

(declare-fun m!918361 () Bool)

(assert (=> d!117803 m!918361))

(declare-fun m!918363 () Bool)

(assert (=> b!990492 m!918363))

(declare-fun m!918365 () Bool)

(assert (=> b!990493 m!918365))

(assert (=> b!990129 d!117803))

(declare-fun d!117805 () Bool)

(declare-fun lt!439423 () Bool)

(assert (=> d!117805 (= lt!439423 (select (content!421 (toList!6820 lt!439105)) lt!439057))))

(declare-fun e!558594 () Bool)

(assert (=> d!117805 (= lt!439423 e!558594)))

(declare-fun res!662083 () Bool)

(assert (=> d!117805 (=> (not res!662083) (not e!558594))))

(assert (=> d!117805 (= res!662083 ((_ is Cons!20812) (toList!6820 lt!439105)))))

(assert (=> d!117805 (= (contains!5741 (toList!6820 lt!439105) lt!439057) lt!439423)))

(declare-fun b!990494 () Bool)

(declare-fun e!558595 () Bool)

(assert (=> b!990494 (= e!558594 e!558595)))

(declare-fun res!662084 () Bool)

(assert (=> b!990494 (=> res!662084 e!558595)))

(assert (=> b!990494 (= res!662084 (= (h!21980 (toList!6820 lt!439105)) lt!439057))))

(declare-fun b!990495 () Bool)

(assert (=> b!990495 (= e!558595 (contains!5741 (t!29761 (toList!6820 lt!439105)) lt!439057))))

(assert (= (and d!117805 res!662083) b!990494))

(assert (= (and b!990494 (not res!662084)) b!990495))

(declare-fun m!918367 () Bool)

(assert (=> d!117805 m!918367))

(declare-fun m!918369 () Bool)

(assert (=> d!117805 m!918369))

(declare-fun m!918371 () Bool)

(assert (=> b!990495 m!918371))

(assert (=> b!990040 d!117805))

(declare-fun d!117807 () Bool)

(declare-fun e!558596 () Bool)

(assert (=> d!117807 e!558596))

(declare-fun res!662086 () Bool)

(assert (=> d!117807 (=> (not res!662086) (not e!558596))))

(declare-fun lt!439425 () ListLongMap!13609)

(assert (=> d!117807 (= res!662086 (contains!5740 lt!439425 (_1!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439426 () List!20816)

(assert (=> d!117807 (= lt!439425 (ListLongMap!13610 lt!439426))))

(declare-fun lt!439424 () Unit!32822)

(declare-fun lt!439427 () Unit!32822)

(assert (=> d!117807 (= lt!439424 lt!439427)))

(assert (=> d!117807 (= (getValueByKey!511 lt!439426 (_1!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!516 (_2!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117807 (= lt!439427 (lemmaContainsTupThenGetReturnValue!273 lt!439426 (_1!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117807 (= lt!439426 (insertStrictlySorted!330 (toList!6820 call!41954) (_1!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117807 (= (+!3113 call!41954 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439425)))

(declare-fun b!990496 () Bool)

(declare-fun res!662085 () Bool)

(assert (=> b!990496 (=> (not res!662085) (not e!558596))))

(assert (=> b!990496 (= res!662085 (= (getValueByKey!511 (toList!6820 lt!439425) (_1!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!516 (_2!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!990497 () Bool)

(assert (=> b!990497 (= e!558596 (contains!5741 (toList!6820 lt!439425) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117807 res!662086) b!990496))

(assert (= (and b!990496 res!662085) b!990497))

(declare-fun m!918373 () Bool)

(assert (=> d!117807 m!918373))

(declare-fun m!918375 () Bool)

(assert (=> d!117807 m!918375))

(declare-fun m!918377 () Bool)

(assert (=> d!117807 m!918377))

(declare-fun m!918379 () Bool)

(assert (=> d!117807 m!918379))

(declare-fun m!918381 () Bool)

(assert (=> b!990496 m!918381))

(declare-fun m!918383 () Bool)

(assert (=> b!990497 m!918383))

(assert (=> b!990087 d!117807))

(declare-fun d!117809 () Bool)

(declare-fun e!558598 () Bool)

(assert (=> d!117809 e!558598))

(declare-fun res!662087 () Bool)

(assert (=> d!117809 (=> res!662087 e!558598)))

(declare-fun lt!439428 () Bool)

(assert (=> d!117809 (= res!662087 (not lt!439428))))

(declare-fun lt!439431 () Bool)

(assert (=> d!117809 (= lt!439428 lt!439431)))

(declare-fun lt!439429 () Unit!32822)

(declare-fun e!558597 () Unit!32822)

(assert (=> d!117809 (= lt!439429 e!558597)))

(declare-fun c!100657 () Bool)

(assert (=> d!117809 (= c!100657 lt!439431)))

(assert (=> d!117809 (= lt!439431 (containsKey!480 (toList!6820 lt!439203) (select (arr!30109 _keys!1544) from!1932)))))

(assert (=> d!117809 (= (contains!5740 lt!439203 (select (arr!30109 _keys!1544) from!1932)) lt!439428)))

(declare-fun b!990498 () Bool)

(declare-fun lt!439430 () Unit!32822)

(assert (=> b!990498 (= e!558597 lt!439430)))

(assert (=> b!990498 (= lt!439430 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 lt!439203) (select (arr!30109 _keys!1544) from!1932)))))

(assert (=> b!990498 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439203) (select (arr!30109 _keys!1544) from!1932)))))

(declare-fun b!990499 () Bool)

(declare-fun Unit!32840 () Unit!32822)

(assert (=> b!990499 (= e!558597 Unit!32840)))

(declare-fun b!990500 () Bool)

(assert (=> b!990500 (= e!558598 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439203) (select (arr!30109 _keys!1544) from!1932))))))

(assert (= (and d!117809 c!100657) b!990498))

(assert (= (and d!117809 (not c!100657)) b!990499))

(assert (= (and d!117809 (not res!662087)) b!990500))

(assert (=> d!117809 m!917455))

(declare-fun m!918385 () Bool)

(assert (=> d!117809 m!918385))

(assert (=> b!990498 m!917455))

(declare-fun m!918387 () Bool)

(assert (=> b!990498 m!918387))

(assert (=> b!990498 m!917455))

(assert (=> b!990498 m!918085))

(assert (=> b!990498 m!918085))

(declare-fun m!918389 () Bool)

(assert (=> b!990498 m!918389))

(assert (=> b!990500 m!917455))

(assert (=> b!990500 m!918085))

(assert (=> b!990500 m!918085))

(assert (=> b!990500 m!918389))

(assert (=> b!990127 d!117809))

(declare-fun b!990501 () Bool)

(declare-fun e!558601 () Bool)

(declare-fun e!558600 () Bool)

(assert (=> b!990501 (= e!558601 e!558600)))

(declare-fun c!100658 () Bool)

(assert (=> b!990501 (= c!100658 (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!117811 () Bool)

(declare-fun res!662088 () Bool)

(declare-fun e!558599 () Bool)

(assert (=> d!117811 (=> res!662088 e!558599)))

(assert (=> d!117811 (= res!662088 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30589 _keys!1544)))))

(assert (=> d!117811 (= (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100569 (Cons!20811 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) Nil!20812) Nil!20812)) e!558599)))

(declare-fun b!990502 () Bool)

(declare-fun call!41998 () Bool)

(assert (=> b!990502 (= e!558600 call!41998)))

(declare-fun b!990503 () Bool)

(assert (=> b!990503 (= e!558600 call!41998)))

(declare-fun b!990504 () Bool)

(assert (=> b!990504 (= e!558599 e!558601)))

(declare-fun res!662089 () Bool)

(assert (=> b!990504 (=> (not res!662089) (not e!558601))))

(declare-fun e!558602 () Bool)

(assert (=> b!990504 (= res!662089 (not e!558602))))

(declare-fun res!662090 () Bool)

(assert (=> b!990504 (=> (not res!662090) (not e!558602))))

(assert (=> b!990504 (= res!662090 (validKeyInArray!0 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!990505 () Bool)

(assert (=> b!990505 (= e!558602 (contains!5742 (ite c!100569 (Cons!20811 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) Nil!20812) Nil!20812) (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!41995 () Bool)

(assert (=> bm!41995 (= call!41998 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100658 (Cons!20811 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!100569 (Cons!20811 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) Nil!20812) Nil!20812)) (ite c!100569 (Cons!20811 (select (arr!30109 _keys!1544) #b00000000000000000000000000000000) Nil!20812) Nil!20812))))))

(assert (= (and d!117811 (not res!662088)) b!990504))

(assert (= (and b!990504 res!662090) b!990505))

(assert (= (and b!990504 res!662089) b!990501))

(assert (= (and b!990501 c!100658) b!990502))

(assert (= (and b!990501 (not c!100658)) b!990503))

(assert (= (or b!990502 b!990503) bm!41995))

(assert (=> b!990501 m!917853))

(assert (=> b!990501 m!917853))

(assert (=> b!990501 m!917861))

(assert (=> b!990504 m!917853))

(assert (=> b!990504 m!917853))

(assert (=> b!990504 m!917861))

(assert (=> b!990505 m!917853))

(assert (=> b!990505 m!917853))

(declare-fun m!918391 () Bool)

(assert (=> b!990505 m!918391))

(assert (=> bm!41995 m!917853))

(declare-fun m!918393 () Bool)

(assert (=> bm!41995 m!918393))

(assert (=> bm!41970 d!117811))

(declare-fun d!117813 () Bool)

(declare-fun e!558603 () Bool)

(assert (=> d!117813 e!558603))

(declare-fun res!662092 () Bool)

(assert (=> d!117813 (=> (not res!662092) (not e!558603))))

(declare-fun lt!439433 () ListLongMap!13609)

(assert (=> d!117813 (= res!662092 (contains!5740 lt!439433 (_1!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439434 () List!20816)

(assert (=> d!117813 (= lt!439433 (ListLongMap!13610 lt!439434))))

(declare-fun lt!439432 () Unit!32822)

(declare-fun lt!439435 () Unit!32822)

(assert (=> d!117813 (= lt!439432 lt!439435)))

(assert (=> d!117813 (= (getValueByKey!511 lt!439434 (_1!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!516 (_2!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117813 (= lt!439435 (lemmaContainsTupThenGetReturnValue!273 lt!439434 (_1!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117813 (= lt!439434 (insertStrictlySorted!330 (toList!6820 call!41961) (_1!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117813 (= (+!3113 call!41961 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439433)))

(declare-fun b!990506 () Bool)

(declare-fun res!662091 () Bool)

(assert (=> b!990506 (=> (not res!662091) (not e!558603))))

(assert (=> b!990506 (= res!662091 (= (getValueByKey!511 (toList!6820 lt!439433) (_1!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!516 (_2!7466 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!990507 () Bool)

(assert (=> b!990507 (= e!558603 (contains!5741 (toList!6820 lt!439433) (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117813 res!662092) b!990506))

(assert (= (and b!990506 res!662091) b!990507))

(declare-fun m!918395 () Bool)

(assert (=> d!117813 m!918395))

(declare-fun m!918397 () Bool)

(assert (=> d!117813 m!918397))

(declare-fun m!918399 () Bool)

(assert (=> d!117813 m!918399))

(declare-fun m!918401 () Bool)

(assert (=> d!117813 m!918401))

(declare-fun m!918403 () Bool)

(assert (=> b!990506 m!918403))

(declare-fun m!918405 () Bool)

(assert (=> b!990507 m!918405))

(assert (=> b!990112 d!117813))

(declare-fun d!117815 () Bool)

(declare-fun isEmpty!730 (List!20816) Bool)

(assert (=> d!117815 (= (isEmpty!729 lt!439229) (isEmpty!730 (toList!6820 lt!439229)))))

(declare-fun bs!28111 () Bool)

(assert (= bs!28111 d!117815))

(declare-fun m!918407 () Bool)

(assert (=> bs!28111 m!918407))

(assert (=> b!990167 d!117815))

(declare-fun d!117817 () Bool)

(declare-fun e!558604 () Bool)

(assert (=> d!117817 e!558604))

(declare-fun res!662094 () Bool)

(assert (=> d!117817 (=> (not res!662094) (not e!558604))))

(declare-fun lt!439437 () ListLongMap!13609)

(assert (=> d!117817 (= res!662094 (contains!5740 lt!439437 (_1!7466 (tuple2!14911 lt!439227 lt!439225))))))

(declare-fun lt!439438 () List!20816)

(assert (=> d!117817 (= lt!439437 (ListLongMap!13610 lt!439438))))

(declare-fun lt!439436 () Unit!32822)

(declare-fun lt!439439 () Unit!32822)

(assert (=> d!117817 (= lt!439436 lt!439439)))

(assert (=> d!117817 (= (getValueByKey!511 lt!439438 (_1!7466 (tuple2!14911 lt!439227 lt!439225))) (Some!516 (_2!7466 (tuple2!14911 lt!439227 lt!439225))))))

(assert (=> d!117817 (= lt!439439 (lemmaContainsTupThenGetReturnValue!273 lt!439438 (_1!7466 (tuple2!14911 lt!439227 lt!439225)) (_2!7466 (tuple2!14911 lt!439227 lt!439225))))))

(assert (=> d!117817 (= lt!439438 (insertStrictlySorted!330 (toList!6820 lt!439230) (_1!7466 (tuple2!14911 lt!439227 lt!439225)) (_2!7466 (tuple2!14911 lt!439227 lt!439225))))))

(assert (=> d!117817 (= (+!3113 lt!439230 (tuple2!14911 lt!439227 lt!439225)) lt!439437)))

(declare-fun b!990508 () Bool)

(declare-fun res!662093 () Bool)

(assert (=> b!990508 (=> (not res!662093) (not e!558604))))

(assert (=> b!990508 (= res!662093 (= (getValueByKey!511 (toList!6820 lt!439437) (_1!7466 (tuple2!14911 lt!439227 lt!439225))) (Some!516 (_2!7466 (tuple2!14911 lt!439227 lt!439225)))))))

(declare-fun b!990509 () Bool)

(assert (=> b!990509 (= e!558604 (contains!5741 (toList!6820 lt!439437) (tuple2!14911 lt!439227 lt!439225)))))

(assert (= (and d!117817 res!662094) b!990508))

(assert (= (and b!990508 res!662093) b!990509))

(declare-fun m!918409 () Bool)

(assert (=> d!117817 m!918409))

(declare-fun m!918411 () Bool)

(assert (=> d!117817 m!918411))

(declare-fun m!918413 () Bool)

(assert (=> d!117817 m!918413))

(declare-fun m!918415 () Bool)

(assert (=> d!117817 m!918415))

(declare-fun m!918417 () Bool)

(assert (=> b!990508 m!918417))

(declare-fun m!918419 () Bool)

(assert (=> b!990509 m!918419))

(assert (=> b!990171 d!117817))

(assert (=> b!990171 d!117687))

(declare-fun d!117819 () Bool)

(declare-fun e!558605 () Bool)

(assert (=> d!117819 e!558605))

(declare-fun res!662096 () Bool)

(assert (=> d!117819 (=> (not res!662096) (not e!558605))))

(declare-fun lt!439441 () ListLongMap!13609)

(assert (=> d!117819 (= res!662096 (contains!5740 lt!439441 (_1!7466 (tuple2!14911 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!439442 () List!20816)

(assert (=> d!117819 (= lt!439441 (ListLongMap!13610 lt!439442))))

(declare-fun lt!439440 () Unit!32822)

(declare-fun lt!439443 () Unit!32822)

(assert (=> d!117819 (= lt!439440 lt!439443)))

(assert (=> d!117819 (= (getValueByKey!511 lt!439442 (_1!7466 (tuple2!14911 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!516 (_2!7466 (tuple2!14911 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117819 (= lt!439443 (lemmaContainsTupThenGetReturnValue!273 lt!439442 (_1!7466 (tuple2!14911 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7466 (tuple2!14911 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117819 (= lt!439442 (insertStrictlySorted!330 (toList!6820 call!41967) (_1!7466 (tuple2!14911 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7466 (tuple2!14911 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117819 (= (+!3113 call!41967 (tuple2!14911 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!439441)))

(declare-fun b!990510 () Bool)

(declare-fun res!662095 () Bool)

(assert (=> b!990510 (=> (not res!662095) (not e!558605))))

(assert (=> b!990510 (= res!662095 (= (getValueByKey!511 (toList!6820 lt!439441) (_1!7466 (tuple2!14911 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!516 (_2!7466 (tuple2!14911 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!990511 () Bool)

(assert (=> b!990511 (= e!558605 (contains!5741 (toList!6820 lt!439441) (tuple2!14911 (select (arr!30109 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15652 (select (arr!30108 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!117819 res!662096) b!990510))

(assert (= (and b!990510 res!662095) b!990511))

(declare-fun m!918421 () Bool)

(assert (=> d!117819 m!918421))

(declare-fun m!918423 () Bool)

(assert (=> d!117819 m!918423))

(declare-fun m!918425 () Bool)

(assert (=> d!117819 m!918425))

(declare-fun m!918427 () Bool)

(assert (=> d!117819 m!918427))

(declare-fun m!918429 () Bool)

(assert (=> b!990510 m!918429))

(declare-fun m!918431 () Bool)

(assert (=> b!990511 m!918431))

(assert (=> b!990171 d!117819))

(declare-fun d!117821 () Bool)

(declare-fun e!558607 () Bool)

(assert (=> d!117821 e!558607))

(declare-fun res!662097 () Bool)

(assert (=> d!117821 (=> res!662097 e!558607)))

(declare-fun lt!439444 () Bool)

(assert (=> d!117821 (= res!662097 (not lt!439444))))

(declare-fun lt!439447 () Bool)

(assert (=> d!117821 (= lt!439444 lt!439447)))

(declare-fun lt!439445 () Unit!32822)

(declare-fun e!558606 () Unit!32822)

(assert (=> d!117821 (= lt!439445 e!558606)))

(declare-fun c!100659 () Bool)

(assert (=> d!117821 (= c!100659 lt!439447)))

(assert (=> d!117821 (= lt!439447 (containsKey!480 (toList!6820 (+!3113 lt!439230 (tuple2!14911 lt!439227 lt!439225))) lt!439231))))

(assert (=> d!117821 (= (contains!5740 (+!3113 lt!439230 (tuple2!14911 lt!439227 lt!439225)) lt!439231) lt!439444)))

(declare-fun b!990512 () Bool)

(declare-fun lt!439446 () Unit!32822)

(assert (=> b!990512 (= e!558606 lt!439446)))

(assert (=> b!990512 (= lt!439446 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 (+!3113 lt!439230 (tuple2!14911 lt!439227 lt!439225))) lt!439231))))

(assert (=> b!990512 (isDefined!382 (getValueByKey!511 (toList!6820 (+!3113 lt!439230 (tuple2!14911 lt!439227 lt!439225))) lt!439231))))

(declare-fun b!990513 () Bool)

(declare-fun Unit!32841 () Unit!32822)

(assert (=> b!990513 (= e!558606 Unit!32841)))

(declare-fun b!990514 () Bool)

(assert (=> b!990514 (= e!558607 (isDefined!382 (getValueByKey!511 (toList!6820 (+!3113 lt!439230 (tuple2!14911 lt!439227 lt!439225))) lt!439231)))))

(assert (= (and d!117821 c!100659) b!990512))

(assert (= (and d!117821 (not c!100659)) b!990513))

(assert (= (and d!117821 (not res!662097)) b!990514))

(declare-fun m!918433 () Bool)

(assert (=> d!117821 m!918433))

(declare-fun m!918435 () Bool)

(assert (=> b!990512 m!918435))

(declare-fun m!918437 () Bool)

(assert (=> b!990512 m!918437))

(assert (=> b!990512 m!918437))

(declare-fun m!918439 () Bool)

(assert (=> b!990512 m!918439))

(assert (=> b!990514 m!918437))

(assert (=> b!990514 m!918437))

(assert (=> b!990514 m!918439))

(assert (=> b!990171 d!117821))

(declare-fun d!117823 () Bool)

(assert (=> d!117823 (not (contains!5740 (+!3113 lt!439230 (tuple2!14911 lt!439227 lt!439225)) lt!439231))))

(declare-fun lt!439450 () Unit!32822)

(declare-fun choose!1620 (ListLongMap!13609 (_ BitVec 64) V!35993 (_ BitVec 64)) Unit!32822)

(assert (=> d!117823 (= lt!439450 (choose!1620 lt!439230 lt!439227 lt!439225 lt!439231))))

(declare-fun e!558610 () Bool)

(assert (=> d!117823 e!558610))

(declare-fun res!662100 () Bool)

(assert (=> d!117823 (=> (not res!662100) (not e!558610))))

(assert (=> d!117823 (= res!662100 (not (contains!5740 lt!439230 lt!439231)))))

(assert (=> d!117823 (= (addStillNotContains!236 lt!439230 lt!439227 lt!439225 lt!439231) lt!439450)))

(declare-fun b!990518 () Bool)

(assert (=> b!990518 (= e!558610 (not (= lt!439227 lt!439231)))))

(assert (= (and d!117823 res!662100) b!990518))

(assert (=> d!117823 m!917753))

(assert (=> d!117823 m!917753))

(assert (=> d!117823 m!917755))

(declare-fun m!918441 () Bool)

(assert (=> d!117823 m!918441))

(declare-fun m!918443 () Bool)

(assert (=> d!117823 m!918443))

(assert (=> b!990171 d!117823))

(assert (=> bm!41955 d!117783))

(declare-fun d!117825 () Bool)

(declare-fun e!558612 () Bool)

(assert (=> d!117825 e!558612))

(declare-fun res!662101 () Bool)

(assert (=> d!117825 (=> res!662101 e!558612)))

(declare-fun lt!439451 () Bool)

(assert (=> d!117825 (= res!662101 (not lt!439451))))

(declare-fun lt!439454 () Bool)

(assert (=> d!117825 (= lt!439451 lt!439454)))

(declare-fun lt!439452 () Unit!32822)

(declare-fun e!558611 () Unit!32822)

(assert (=> d!117825 (= lt!439452 e!558611)))

(declare-fun c!100660 () Bool)

(assert (=> d!117825 (= c!100660 lt!439454)))

(assert (=> d!117825 (= lt!439454 (containsKey!480 (toList!6820 lt!439229) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117825 (= (contains!5740 lt!439229 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439451)))

(declare-fun b!990519 () Bool)

(declare-fun lt!439453 () Unit!32822)

(assert (=> b!990519 (= e!558611 lt!439453)))

(assert (=> b!990519 (= lt!439453 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6820 lt!439229) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990519 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439229) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990520 () Bool)

(declare-fun Unit!32842 () Unit!32822)

(assert (=> b!990520 (= e!558611 Unit!32842)))

(declare-fun b!990521 () Bool)

(assert (=> b!990521 (= e!558612 (isDefined!382 (getValueByKey!511 (toList!6820 lt!439229) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117825 c!100660) b!990519))

(assert (= (and d!117825 (not c!100660)) b!990520))

(assert (= (and d!117825 (not res!662101)) b!990521))

(declare-fun m!918445 () Bool)

(assert (=> d!117825 m!918445))

(declare-fun m!918447 () Bool)

(assert (=> b!990519 m!918447))

(declare-fun m!918449 () Bool)

(assert (=> b!990519 m!918449))

(assert (=> b!990519 m!918449))

(declare-fun m!918451 () Bool)

(assert (=> b!990519 m!918451))

(assert (=> b!990521 m!918449))

(assert (=> b!990521 m!918449))

(assert (=> b!990521 m!918451))

(assert (=> b!990169 d!117825))

(assert (=> b!990115 d!117621))

(assert (=> b!990090 d!117655))

(declare-fun d!117827 () Bool)

(declare-fun lt!439455 () Bool)

(assert (=> d!117827 (= lt!439455 (select (content!421 (toList!6820 lt!439183)) lt!439060))))

(declare-fun e!558613 () Bool)

(assert (=> d!117827 (= lt!439455 e!558613)))

(declare-fun res!662102 () Bool)

(assert (=> d!117827 (=> (not res!662102) (not e!558613))))

(assert (=> d!117827 (= res!662102 ((_ is Cons!20812) (toList!6820 lt!439183)))))

(assert (=> d!117827 (= (contains!5741 (toList!6820 lt!439183) lt!439060) lt!439455)))

(declare-fun b!990522 () Bool)

(declare-fun e!558614 () Bool)

(assert (=> b!990522 (= e!558613 e!558614)))

(declare-fun res!662103 () Bool)

(assert (=> b!990522 (=> res!662103 e!558614)))

(assert (=> b!990522 (= res!662103 (= (h!21980 (toList!6820 lt!439183)) lt!439060))))

(declare-fun b!990523 () Bool)

(assert (=> b!990523 (= e!558614 (contains!5741 (t!29761 (toList!6820 lt!439183)) lt!439060))))

(assert (= (and d!117827 res!662102) b!990522))

(assert (= (and b!990522 (not res!662103)) b!990523))

(declare-fun m!918453 () Bool)

(assert (=> d!117827 m!918453))

(declare-fun m!918455 () Bool)

(assert (=> d!117827 m!918455))

(declare-fun m!918457 () Bool)

(assert (=> b!990523 m!918457))

(assert (=> b!990109 d!117827))

(declare-fun d!117829 () Bool)

(assert (=> d!117829 (= (apply!904 lt!439170 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15655 (getValueByKey!511 (toList!6820 lt!439170) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28112 () Bool)

(assert (= bs!28112 d!117829))

(assert (=> bs!28112 m!917867))

(assert (=> bs!28112 m!917867))

(declare-fun m!918459 () Bool)

(assert (=> bs!28112 m!918459))

(assert (=> b!990092 d!117829))

(declare-fun d!117831 () Bool)

(assert (=> d!117831 (= (apply!904 lt!439203 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15655 (getValueByKey!511 (toList!6820 lt!439203) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28113 () Bool)

(assert (= bs!28113 d!117831))

(assert (=> bs!28113 m!917913))

(assert (=> bs!28113 m!917913))

(declare-fun m!918461 () Bool)

(assert (=> bs!28113 m!918461))

(assert (=> b!990117 d!117831))

(declare-fun d!117833 () Bool)

(declare-fun lt!439456 () Bool)

(assert (=> d!117833 (= lt!439456 (select (content!421 (toList!6820 lt!439179)) lt!439060))))

(declare-fun e!558615 () Bool)

(assert (=> d!117833 (= lt!439456 e!558615)))

(declare-fun res!662104 () Bool)

(assert (=> d!117833 (=> (not res!662104) (not e!558615))))

(assert (=> d!117833 (= res!662104 ((_ is Cons!20812) (toList!6820 lt!439179)))))

(assert (=> d!117833 (= (contains!5741 (toList!6820 lt!439179) lt!439060) lt!439456)))

(declare-fun b!990524 () Bool)

(declare-fun e!558616 () Bool)

(assert (=> b!990524 (= e!558615 e!558616)))

(declare-fun res!662105 () Bool)

(assert (=> b!990524 (=> res!662105 e!558616)))

(assert (=> b!990524 (= res!662105 (= (h!21980 (toList!6820 lt!439179)) lt!439060))))

(declare-fun b!990525 () Bool)

(assert (=> b!990525 (= e!558616 (contains!5741 (t!29761 (toList!6820 lt!439179)) lt!439060))))

(assert (= (and d!117833 res!662104) b!990524))

(assert (= (and b!990524 (not res!662105)) b!990525))

(declare-fun m!918463 () Bool)

(assert (=> d!117833 m!918463))

(declare-fun m!918465 () Bool)

(assert (=> d!117833 m!918465))

(declare-fun m!918467 () Bool)

(assert (=> b!990525 m!918467))

(assert (=> b!990107 d!117833))

(declare-fun d!117835 () Bool)

(assert (=> d!117835 (= (get!15654 (select (arr!30108 _values!1278) from!1932) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1896 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990136 d!117835))

(declare-fun b!990527 () Bool)

(declare-fun e!558618 () Bool)

(assert (=> b!990527 (= e!558618 tp_is_empty!23257)))

(declare-fun mapIsEmpty!36937 () Bool)

(declare-fun mapRes!36937 () Bool)

(assert (=> mapIsEmpty!36937 mapRes!36937))

(declare-fun b!990526 () Bool)

(declare-fun e!558617 () Bool)

(assert (=> b!990526 (= e!558617 tp_is_empty!23257)))

(declare-fun mapNonEmpty!36937 () Bool)

(declare-fun tp!69928 () Bool)

(assert (=> mapNonEmpty!36937 (= mapRes!36937 (and tp!69928 e!558617))))

(declare-fun mapRest!36937 () (Array (_ BitVec 32) ValueCell!11147))

(declare-fun mapKey!36937 () (_ BitVec 32))

(declare-fun mapValue!36937 () ValueCell!11147)

(assert (=> mapNonEmpty!36937 (= mapRest!36936 (store mapRest!36937 mapKey!36937 mapValue!36937))))

(declare-fun condMapEmpty!36937 () Bool)

(declare-fun mapDefault!36937 () ValueCell!11147)

(assert (=> mapNonEmpty!36936 (= condMapEmpty!36937 (= mapRest!36936 ((as const (Array (_ BitVec 32) ValueCell!11147)) mapDefault!36937)))))

(assert (=> mapNonEmpty!36936 (= tp!69927 (and e!558618 mapRes!36937))))

(assert (= (and mapNonEmpty!36936 condMapEmpty!36937) mapIsEmpty!36937))

(assert (= (and mapNonEmpty!36936 (not condMapEmpty!36937)) mapNonEmpty!36937))

(assert (= (and mapNonEmpty!36937 ((_ is ValueCellFull!11147) mapValue!36937)) b!990526))

(assert (= (and mapNonEmpty!36936 ((_ is ValueCellFull!11147) mapDefault!36937)) b!990527))

(declare-fun m!918469 () Bool)

(assert (=> mapNonEmpty!36937 m!918469))

(declare-fun b_lambda!15143 () Bool)

(assert (= b_lambda!15139 (or (and start!84728 b_free!20041) b_lambda!15143)))

(declare-fun b_lambda!15145 () Bool)

(assert (= b_lambda!15137 (or (and start!84728 b_free!20041) b_lambda!15145)))

(declare-fun b_lambda!15147 () Bool)

(assert (= b_lambda!15135 (or (and start!84728 b_free!20041) b_lambda!15147)))

(declare-fun b_lambda!15149 () Bool)

(assert (= b_lambda!15141 (or (and start!84728 b_free!20041) b_lambda!15149)))

(check-sat (not b!990256) (not b!990492) (not d!117757) (not b_lambda!15143) (not d!117789) (not d!117773) (not b!990273) (not d!117779) (not b!990278) (not bm!41988) (not b!990372) (not d!117693) (not b!990497) (not d!117639) (not b_lambda!15133) (not b!990519) (not d!117801) (not b!990511) (not bm!41987) (not d!117741) (not d!117785) (not b!990478) (not d!117661) (not b!990412) (not d!117739) (not d!117807) (not b!990490) (not b!990380) (not d!117647) (not d!117667) (not b!990391) (not b!990486) (not d!117833) tp_is_empty!23257 (not b!990523) (not d!117821) (not b!990301) (not b_lambda!15149) (not b!990458) (not d!117727) (not b!990397) (not b!990377) (not d!117731) (not b!990369) (not d!117825) (not b!990485) (not b!990482) (not b!990479) (not b!990265) (not d!117683) (not b!990382) (not b!990501) (not b!990460) (not d!117797) (not b!990467) (not d!117701) (not b!990420) (not b!990216) (not b!990399) (not b!990493) (not b!990389) (not b!990288) (not d!117781) (not b!990489) (not b!990322) (not d!117763) (not b_lambda!15147) (not b!990338) (not d!117829) (not b!990451) (not b!990281) (not bm!41983) (not d!117711) (not bm!41980) (not b!990476) (not b!990357) (not b!990352) (not d!117817) (not b!990413) (not b!990307) (not b!990350) (not d!117697) (not d!117733) (not d!117755) (not b!990367) (not b!990344) (not b!990227) (not d!117677) (not b_lambda!15131) (not b!990365) (not b!990510) (not b!990495) (not d!117819) (not b_next!20041) (not d!117651) b_and!32187 (not b!990480) (not b!990509) (not b!990234) (not b!990507) (not b!990373) (not b!990488) (not b!990325) (not b_lambda!15145) (not b!990341) (not b!990521) (not d!117747) (not b!990429) (not d!117765) (not d!117815) (not b!990421) (not b!990302) (not b!990291) (not b!990214) (not b!990384) (not d!117809) (not b!990500) (not b!990337) (not b!990342) (not b!990296) (not b!990504) (not d!117799) (not b!990283) (not b!990394) (not bm!41991) (not b!990309) (not bm!41984) (not d!117827) (not b!990442) (not d!117771) (not b!990414) (not b!990299) (not b!990473) (not d!117805) (not b!990498) (not d!117723) (not bm!41995) (not b!990408) (not d!117743) (not b!990496) (not b!990508) (not d!117637) (not b!990453) (not b!990375) (not d!117695) (not b!990293) (not d!117745) (not d!117831) (not b!990396) (not d!117795) (not b!990514) (not b!990463) (not d!117783) (not d!117725) (not b!990371) (not b!990506) (not b!990339) (not b!990327) (not b!990477) (not b!990294) (not d!117793) (not b!990370) (not b!990505) (not b!990423) (not d!117691) (not b!990355) (not b_lambda!15127) (not bm!41977) (not d!117685) (not b!990374) (not d!117751) (not d!117663) (not d!117761) (not d!117769) (not b!990340) (not b!990474) (not b!990267) (not b!990484) (not b!990349) (not b!990409) (not b!990270) (not b!990459) (not bm!41994) (not d!117735) (not b_lambda!15117) (not d!117729) (not b!990487) (not d!117749) (not b!990481) (not d!117657) (not b!990376) (not d!117631) (not b!990449) (not b!990268) (not d!117775) (not b!990259) (not d!117645) (not d!117787) (not d!117721) (not d!117753) (not d!117759) (not d!117803) (not b!990275) (not b!990315) (not d!117671) (not b!990261) (not b!990233) (not b!990287) (not b_lambda!15129) (not b!990334) (not b!990347) (not b!990410) (not b!990461) (not d!117641) (not b!990333) (not b!990336) (not d!117673) (not d!117767) (not b!990276) (not b!990304) (not d!117791) (not b!990387) (not d!117675) (not b!990464) (not b!990525) (not d!117715) (not d!117823) (not d!117635) (not d!117707) (not d!117699) (not d!117681) (not b!990402) (not d!117777) (not d!117703) (not b!990361) (not b!990362) (not b!990404) (not b!990329) (not d!117813) (not b!990452) (not mapNonEmpty!36937) (not d!117717) (not b!990512))
(check-sat b_and!32187 (not b_next!20041))
