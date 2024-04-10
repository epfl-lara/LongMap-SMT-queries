; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84636 () Bool)

(assert start!84636)

(declare-fun b_free!20061 () Bool)

(declare-fun b_next!20061 () Bool)

(assert (=> start!84636 (= b_free!20061 (not b_next!20061))))

(declare-fun tp!69974 () Bool)

(declare-fun b_and!32193 () Bool)

(assert (=> start!84636 (= tp!69974 b_and!32193)))

(declare-fun b!989855 () Bool)

(declare-fun res!661925 () Bool)

(declare-fun e!558152 () Bool)

(assert (=> b!989855 (=> (not res!661925) (not e!558152))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!989855 (= res!661925 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36961 () Bool)

(declare-fun mapRes!36961 () Bool)

(declare-fun tp!69975 () Bool)

(declare-fun e!558156 () Bool)

(assert (=> mapNonEmpty!36961 (= mapRes!36961 (and tp!69975 e!558156))))

(declare-datatypes ((V!36019 0))(
  ( (V!36020 (val!11689 Int)) )
))
(declare-datatypes ((ValueCell!11157 0))(
  ( (ValueCellFull!11157 (v!14259 V!36019)) (EmptyCell!11157) )
))
(declare-datatypes ((array!62513 0))(
  ( (array!62514 (arr!30109 (Array (_ BitVec 32) ValueCell!11157)) (size!30588 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62513)

(declare-fun mapValue!36961 () ValueCell!11157)

(declare-fun mapKey!36961 () (_ BitVec 32))

(declare-fun mapRest!36961 () (Array (_ BitVec 32) ValueCell!11157))

(assert (=> mapNonEmpty!36961 (= (arr!30109 _values!1278) (store mapRest!36961 mapKey!36961 mapValue!36961))))

(declare-fun b!989856 () Bool)

(declare-fun e!558154 () Bool)

(declare-fun e!558155 () Bool)

(assert (=> b!989856 (= e!558154 (and e!558155 mapRes!36961))))

(declare-fun condMapEmpty!36961 () Bool)

(declare-fun mapDefault!36961 () ValueCell!11157)

(assert (=> b!989856 (= condMapEmpty!36961 (= (arr!30109 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11157)) mapDefault!36961)))))

(declare-fun b!989857 () Bool)

(declare-datatypes ((array!62515 0))(
  ( (array!62516 (arr!30110 (Array (_ BitVec 32) (_ BitVec 64))) (size!30589 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62515)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!989857 (= e!558152 (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30110 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14902 0))(
  ( (tuple2!14903 (_1!7462 (_ BitVec 64)) (_2!7462 V!36019)) )
))
(declare-datatypes ((List!20831 0))(
  ( (Nil!20828) (Cons!20827 (h!21989 tuple2!14902) (t!29788 List!20831)) )
))
(declare-datatypes ((ListLongMap!13599 0))(
  ( (ListLongMap!13600 (toList!6815 List!20831)) )
))
(declare-fun lt!439119 () ListLongMap!13599)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!36019)

(declare-fun zeroValue!1220 () V!36019)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3505 (array!62515 array!62513 (_ BitVec 32) (_ BitVec 32) V!36019 V!36019 (_ BitVec 32) Int) ListLongMap!13599)

(assert (=> b!989857 (= lt!439119 (getCurrentListMapNoExtraKeys!3505 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36961 () Bool)

(assert (=> mapIsEmpty!36961 mapRes!36961))

(declare-fun b!989858 () Bool)

(declare-fun res!661923 () Bool)

(assert (=> b!989858 (=> (not res!661923) (not e!558152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989858 (= res!661923 (validKeyInArray!0 (select (arr!30110 _keys!1544) from!1932)))))

(declare-fun res!661928 () Bool)

(assert (=> start!84636 (=> (not res!661928) (not e!558152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84636 (= res!661928 (validMask!0 mask!1948))))

(assert (=> start!84636 e!558152))

(assert (=> start!84636 true))

(declare-fun tp_is_empty!23277 () Bool)

(assert (=> start!84636 tp_is_empty!23277))

(declare-fun array_inv!23257 (array!62513) Bool)

(assert (=> start!84636 (and (array_inv!23257 _values!1278) e!558154)))

(assert (=> start!84636 tp!69974))

(declare-fun array_inv!23258 (array!62515) Bool)

(assert (=> start!84636 (array_inv!23258 _keys!1544)))

(declare-fun b!989859 () Bool)

(declare-fun res!661926 () Bool)

(assert (=> b!989859 (=> (not res!661926) (not e!558152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62515 (_ BitVec 32)) Bool)

(assert (=> b!989859 (= res!661926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!989860 () Bool)

(declare-fun res!661924 () Bool)

(assert (=> b!989860 (=> (not res!661924) (not e!558152))))

(assert (=> b!989860 (= res!661924 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30589 _keys!1544))))))

(declare-fun b!989861 () Bool)

(declare-fun res!661929 () Bool)

(assert (=> b!989861 (=> (not res!661929) (not e!558152))))

(declare-datatypes ((List!20832 0))(
  ( (Nil!20829) (Cons!20828 (h!21990 (_ BitVec 64)) (t!29789 List!20832)) )
))
(declare-fun arrayNoDuplicates!0 (array!62515 (_ BitVec 32) List!20832) Bool)

(assert (=> b!989861 (= res!661929 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20829))))

(declare-fun b!989862 () Bool)

(assert (=> b!989862 (= e!558156 tp_is_empty!23277)))

(declare-fun b!989863 () Bool)

(assert (=> b!989863 (= e!558155 tp_is_empty!23277)))

(declare-fun b!989864 () Bool)

(declare-fun res!661927 () Bool)

(assert (=> b!989864 (=> (not res!661927) (not e!558152))))

(assert (=> b!989864 (= res!661927 (and (= (size!30588 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30589 _keys!1544) (size!30588 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84636 res!661928) b!989864))

(assert (= (and b!989864 res!661927) b!989859))

(assert (= (and b!989859 res!661926) b!989861))

(assert (= (and b!989861 res!661929) b!989860))

(assert (= (and b!989860 res!661924) b!989858))

(assert (= (and b!989858 res!661923) b!989855))

(assert (= (and b!989855 res!661925) b!989857))

(assert (= (and b!989856 condMapEmpty!36961) mapIsEmpty!36961))

(assert (= (and b!989856 (not condMapEmpty!36961)) mapNonEmpty!36961))

(get-info :version)

(assert (= (and mapNonEmpty!36961 ((_ is ValueCellFull!11157) mapValue!36961)) b!989862))

(assert (= (and b!989856 ((_ is ValueCellFull!11157) mapDefault!36961)) b!989863))

(assert (= start!84636 b!989856))

(declare-fun m!917303 () Bool)

(assert (=> mapNonEmpty!36961 m!917303))

(declare-fun m!917305 () Bool)

(assert (=> start!84636 m!917305))

(declare-fun m!917307 () Bool)

(assert (=> start!84636 m!917307))

(declare-fun m!917309 () Bool)

(assert (=> start!84636 m!917309))

(declare-fun m!917311 () Bool)

(assert (=> b!989858 m!917311))

(assert (=> b!989858 m!917311))

(declare-fun m!917313 () Bool)

(assert (=> b!989858 m!917313))

(declare-fun m!917315 () Bool)

(assert (=> b!989859 m!917315))

(assert (=> b!989857 m!917311))

(declare-fun m!917317 () Bool)

(assert (=> b!989857 m!917317))

(declare-fun m!917319 () Bool)

(assert (=> b!989861 m!917319))

(check-sat tp_is_empty!23277 (not mapNonEmpty!36961) (not b!989859) (not b!989857) (not b!989858) (not b!989861) (not start!84636) b_and!32193 (not b_next!20061))
(check-sat b_and!32193 (not b_next!20061))
(get-model)

(declare-fun d!117521 () Bool)

(assert (=> d!117521 (= (validKeyInArray!0 (select (arr!30110 _keys!1544) from!1932)) (and (not (= (select (arr!30110 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30110 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!989858 d!117521))

(declare-fun b!989903 () Bool)

(declare-fun e!558179 () Bool)

(declare-fun call!41956 () Bool)

(assert (=> b!989903 (= e!558179 call!41956)))

(declare-fun bm!41953 () Bool)

(assert (=> bm!41953 (= call!41956 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!989904 () Bool)

(declare-fun e!558178 () Bool)

(assert (=> b!989904 (= e!558178 call!41956)))

(declare-fun b!989905 () Bool)

(assert (=> b!989905 (= e!558179 e!558178)))

(declare-fun lt!439129 () (_ BitVec 64))

(assert (=> b!989905 (= lt!439129 (select (arr!30110 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32846 0))(
  ( (Unit!32847) )
))
(declare-fun lt!439130 () Unit!32846)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62515 (_ BitVec 64) (_ BitVec 32)) Unit!32846)

(assert (=> b!989905 (= lt!439130 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439129 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!989905 (arrayContainsKey!0 _keys!1544 lt!439129 #b00000000000000000000000000000000)))

(declare-fun lt!439131 () Unit!32846)

(assert (=> b!989905 (= lt!439131 lt!439130)))

(declare-fun res!661956 () Bool)

(declare-datatypes ((SeekEntryResult!9211 0))(
  ( (MissingZero!9211 (index!39215 (_ BitVec 32))) (Found!9211 (index!39216 (_ BitVec 32))) (Intermediate!9211 (undefined!10023 Bool) (index!39217 (_ BitVec 32)) (x!86132 (_ BitVec 32))) (Undefined!9211) (MissingVacant!9211 (index!39218 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62515 (_ BitVec 32)) SeekEntryResult!9211)

(assert (=> b!989905 (= res!661956 (= (seekEntryOrOpen!0 (select (arr!30110 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9211 #b00000000000000000000000000000000)))))

(assert (=> b!989905 (=> (not res!661956) (not e!558178))))

(declare-fun d!117523 () Bool)

(declare-fun res!661955 () Bool)

(declare-fun e!558180 () Bool)

(assert (=> d!117523 (=> res!661955 e!558180)))

(assert (=> d!117523 (= res!661955 (bvsge #b00000000000000000000000000000000 (size!30589 _keys!1544)))))

(assert (=> d!117523 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!558180)))

(declare-fun b!989906 () Bool)

(assert (=> b!989906 (= e!558180 e!558179)))

(declare-fun c!100381 () Bool)

(assert (=> b!989906 (= c!100381 (validKeyInArray!0 (select (arr!30110 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117523 (not res!661955)) b!989906))

(assert (= (and b!989906 c!100381) b!989905))

(assert (= (and b!989906 (not c!100381)) b!989903))

(assert (= (and b!989905 res!661956) b!989904))

(assert (= (or b!989904 b!989903) bm!41953))

(declare-fun m!917339 () Bool)

(assert (=> bm!41953 m!917339))

(declare-fun m!917341 () Bool)

(assert (=> b!989905 m!917341))

(declare-fun m!917343 () Bool)

(assert (=> b!989905 m!917343))

(declare-fun m!917345 () Bool)

(assert (=> b!989905 m!917345))

(assert (=> b!989905 m!917341))

(declare-fun m!917347 () Bool)

(assert (=> b!989905 m!917347))

(assert (=> b!989906 m!917341))

(assert (=> b!989906 m!917341))

(declare-fun m!917349 () Bool)

(assert (=> b!989906 m!917349))

(assert (=> b!989859 d!117523))

(declare-fun d!117525 () Bool)

(assert (=> d!117525 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84636 d!117525))

(declare-fun d!117527 () Bool)

(assert (=> d!117527 (= (array_inv!23257 _values!1278) (bvsge (size!30588 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84636 d!117527))

(declare-fun d!117529 () Bool)

(assert (=> d!117529 (= (array_inv!23258 _keys!1544) (bvsge (size!30589 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84636 d!117529))

(declare-fun b!989917 () Bool)

(declare-fun e!558189 () Bool)

(declare-fun contains!5721 (List!20832 (_ BitVec 64)) Bool)

(assert (=> b!989917 (= e!558189 (contains!5721 Nil!20829 (select (arr!30110 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!989918 () Bool)

(declare-fun e!558190 () Bool)

(declare-fun e!558192 () Bool)

(assert (=> b!989918 (= e!558190 e!558192)))

(declare-fun c!100384 () Bool)

(assert (=> b!989918 (= c!100384 (validKeyInArray!0 (select (arr!30110 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!989919 () Bool)

(declare-fun call!41959 () Bool)

(assert (=> b!989919 (= e!558192 call!41959)))

(declare-fun b!989921 () Bool)

(assert (=> b!989921 (= e!558192 call!41959)))

(declare-fun bm!41956 () Bool)

(assert (=> bm!41956 (= call!41959 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100384 (Cons!20828 (select (arr!30110 _keys!1544) #b00000000000000000000000000000000) Nil!20829) Nil!20829)))))

(declare-fun b!989920 () Bool)

(declare-fun e!558191 () Bool)

(assert (=> b!989920 (= e!558191 e!558190)))

(declare-fun res!661963 () Bool)

(assert (=> b!989920 (=> (not res!661963) (not e!558190))))

(assert (=> b!989920 (= res!661963 (not e!558189))))

(declare-fun res!661965 () Bool)

(assert (=> b!989920 (=> (not res!661965) (not e!558189))))

(assert (=> b!989920 (= res!661965 (validKeyInArray!0 (select (arr!30110 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!117531 () Bool)

(declare-fun res!661964 () Bool)

(assert (=> d!117531 (=> res!661964 e!558191)))

(assert (=> d!117531 (= res!661964 (bvsge #b00000000000000000000000000000000 (size!30589 _keys!1544)))))

(assert (=> d!117531 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20829) e!558191)))

(assert (= (and d!117531 (not res!661964)) b!989920))

(assert (= (and b!989920 res!661965) b!989917))

(assert (= (and b!989920 res!661963) b!989918))

(assert (= (and b!989918 c!100384) b!989919))

(assert (= (and b!989918 (not c!100384)) b!989921))

(assert (= (or b!989919 b!989921) bm!41956))

(assert (=> b!989917 m!917341))

(assert (=> b!989917 m!917341))

(declare-fun m!917351 () Bool)

(assert (=> b!989917 m!917351))

(assert (=> b!989918 m!917341))

(assert (=> b!989918 m!917341))

(assert (=> b!989918 m!917349))

(assert (=> bm!41956 m!917341))

(declare-fun m!917353 () Bool)

(assert (=> bm!41956 m!917353))

(assert (=> b!989920 m!917341))

(assert (=> b!989920 m!917341))

(assert (=> b!989920 m!917349))

(assert (=> b!989861 d!117531))

(declare-fun b!989946 () Bool)

(assert (=> b!989946 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30589 _keys!1544)))))

(assert (=> b!989946 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30588 _values!1278)))))

(declare-fun lt!439148 () ListLongMap!13599)

(declare-fun e!558208 () Bool)

(declare-fun apply!896 (ListLongMap!13599 (_ BitVec 64)) V!36019)

(declare-fun get!15630 (ValueCell!11157 V!36019) V!36019)

(declare-fun dynLambda!1869 (Int (_ BitVec 64)) V!36019)

(assert (=> b!989946 (= e!558208 (= (apply!896 lt!439148 (select (arr!30110 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15630 (select (arr!30109 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1869 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!989947 () Bool)

(declare-fun res!661975 () Bool)

(declare-fun e!558209 () Bool)

(assert (=> b!989947 (=> (not res!661975) (not e!558209))))

(declare-fun contains!5722 (ListLongMap!13599 (_ BitVec 64)) Bool)

(assert (=> b!989947 (= res!661975 (not (contains!5722 lt!439148 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!41959 () Bool)

(declare-fun call!41962 () ListLongMap!13599)

(assert (=> bm!41959 (= call!41962 (getCurrentListMapNoExtraKeys!3505 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!989948 () Bool)

(declare-fun e!558211 () Bool)

(declare-fun isEmpty!725 (ListLongMap!13599) Bool)

(assert (=> b!989948 (= e!558211 (isEmpty!725 lt!439148))))

(declare-fun b!989949 () Bool)

(declare-fun e!558207 () Bool)

(assert (=> b!989949 (= e!558207 e!558211)))

(declare-fun c!100395 () Bool)

(assert (=> b!989949 (= c!100395 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30589 _keys!1544)))))

(declare-fun b!989951 () Bool)

(declare-fun e!558212 () ListLongMap!13599)

(declare-fun e!558210 () ListLongMap!13599)

(assert (=> b!989951 (= e!558212 e!558210)))

(declare-fun c!100393 () Bool)

(assert (=> b!989951 (= c!100393 (validKeyInArray!0 (select (arr!30110 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!989952 () Bool)

(assert (=> b!989952 (= e!558210 call!41962)))

(declare-fun b!989953 () Bool)

(assert (=> b!989953 (= e!558209 e!558207)))

(declare-fun c!100396 () Bool)

(declare-fun e!558213 () Bool)

(assert (=> b!989953 (= c!100396 e!558213)))

(declare-fun res!661977 () Bool)

(assert (=> b!989953 (=> (not res!661977) (not e!558213))))

(assert (=> b!989953 (= res!661977 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30589 _keys!1544)))))

(declare-fun b!989954 () Bool)

(declare-fun lt!439152 () Unit!32846)

(declare-fun lt!439147 () Unit!32846)

(assert (=> b!989954 (= lt!439152 lt!439147)))

(declare-fun lt!439149 () (_ BitVec 64))

(declare-fun lt!439146 () ListLongMap!13599)

(declare-fun lt!439150 () (_ BitVec 64))

(declare-fun lt!439151 () V!36019)

(declare-fun +!3086 (ListLongMap!13599 tuple2!14902) ListLongMap!13599)

(assert (=> b!989954 (not (contains!5722 (+!3086 lt!439146 (tuple2!14903 lt!439149 lt!439151)) lt!439150))))

(declare-fun addStillNotContains!235 (ListLongMap!13599 (_ BitVec 64) V!36019 (_ BitVec 64)) Unit!32846)

(assert (=> b!989954 (= lt!439147 (addStillNotContains!235 lt!439146 lt!439149 lt!439151 lt!439150))))

(assert (=> b!989954 (= lt!439150 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!989954 (= lt!439151 (get!15630 (select (arr!30109 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1869 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!989954 (= lt!439149 (select (arr!30110 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!989954 (= lt!439146 call!41962)))

(assert (=> b!989954 (= e!558210 (+!3086 call!41962 (tuple2!14903 (select (arr!30110 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15630 (select (arr!30109 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1869 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!989955 () Bool)

(assert (=> b!989955 (= e!558213 (validKeyInArray!0 (select (arr!30110 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!989955 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun d!117533 () Bool)

(assert (=> d!117533 e!558209))

(declare-fun res!661974 () Bool)

(assert (=> d!117533 (=> (not res!661974) (not e!558209))))

(assert (=> d!117533 (= res!661974 (not (contains!5722 lt!439148 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117533 (= lt!439148 e!558212)))

(declare-fun c!100394 () Bool)

(assert (=> d!117533 (= c!100394 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30589 _keys!1544)))))

(assert (=> d!117533 (validMask!0 mask!1948)))

(assert (=> d!117533 (= (getCurrentListMapNoExtraKeys!3505 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439148)))

(declare-fun b!989950 () Bool)

(assert (=> b!989950 (= e!558207 e!558208)))

(assert (=> b!989950 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30589 _keys!1544)))))

(declare-fun res!661976 () Bool)

(assert (=> b!989950 (= res!661976 (contains!5722 lt!439148 (select (arr!30110 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!989950 (=> (not res!661976) (not e!558208))))

(declare-fun b!989956 () Bool)

(assert (=> b!989956 (= e!558211 (= lt!439148 (getCurrentListMapNoExtraKeys!3505 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!989957 () Bool)

(assert (=> b!989957 (= e!558212 (ListLongMap!13600 Nil!20828))))

(assert (= (and d!117533 c!100394) b!989957))

(assert (= (and d!117533 (not c!100394)) b!989951))

(assert (= (and b!989951 c!100393) b!989954))

(assert (= (and b!989951 (not c!100393)) b!989952))

(assert (= (or b!989954 b!989952) bm!41959))

(assert (= (and d!117533 res!661974) b!989947))

(assert (= (and b!989947 res!661975) b!989953))

(assert (= (and b!989953 res!661977) b!989955))

(assert (= (and b!989953 c!100396) b!989950))

(assert (= (and b!989953 (not c!100396)) b!989949))

(assert (= (and b!989950 res!661976) b!989946))

(assert (= (and b!989949 c!100395) b!989956))

(assert (= (and b!989949 (not c!100395)) b!989948))

(declare-fun b_lambda!15137 () Bool)

(assert (=> (not b_lambda!15137) (not b!989946)))

(declare-fun t!29793 () Bool)

(declare-fun tb!6809 () Bool)

(assert (=> (and start!84636 (= defaultEntry!1281 defaultEntry!1281) t!29793) tb!6809))

(declare-fun result!13617 () Bool)

(assert (=> tb!6809 (= result!13617 tp_is_empty!23277)))

(assert (=> b!989946 t!29793))

(declare-fun b_and!32197 () Bool)

(assert (= b_and!32193 (and (=> t!29793 result!13617) b_and!32197)))

(declare-fun b_lambda!15139 () Bool)

(assert (=> (not b_lambda!15139) (not b!989954)))

(assert (=> b!989954 t!29793))

(declare-fun b_and!32199 () Bool)

(assert (= b_and!32197 (and (=> t!29793 result!13617) b_and!32199)))

(declare-fun m!917355 () Bool)

(assert (=> b!989946 m!917355))

(declare-fun m!917357 () Bool)

(assert (=> b!989946 m!917357))

(declare-fun m!917359 () Bool)

(assert (=> b!989946 m!917359))

(assert (=> b!989946 m!917357))

(declare-fun m!917361 () Bool)

(assert (=> b!989946 m!917361))

(assert (=> b!989946 m!917355))

(declare-fun m!917363 () Bool)

(assert (=> b!989946 m!917363))

(assert (=> b!989946 m!917361))

(declare-fun m!917365 () Bool)

(assert (=> b!989947 m!917365))

(declare-fun m!917367 () Bool)

(assert (=> b!989956 m!917367))

(assert (=> bm!41959 m!917367))

(assert (=> b!989950 m!917357))

(assert (=> b!989950 m!917357))

(declare-fun m!917369 () Bool)

(assert (=> b!989950 m!917369))

(declare-fun m!917371 () Bool)

(assert (=> b!989948 m!917371))

(assert (=> b!989951 m!917357))

(assert (=> b!989951 m!917357))

(declare-fun m!917373 () Bool)

(assert (=> b!989951 m!917373))

(declare-fun m!917375 () Bool)

(assert (=> b!989954 m!917375))

(declare-fun m!917377 () Bool)

(assert (=> b!989954 m!917377))

(assert (=> b!989954 m!917355))

(assert (=> b!989954 m!917357))

(assert (=> b!989954 m!917375))

(declare-fun m!917379 () Bool)

(assert (=> b!989954 m!917379))

(assert (=> b!989954 m!917361))

(assert (=> b!989954 m!917355))

(assert (=> b!989954 m!917363))

(assert (=> b!989954 m!917361))

(declare-fun m!917381 () Bool)

(assert (=> b!989954 m!917381))

(assert (=> b!989955 m!917357))

(assert (=> b!989955 m!917357))

(assert (=> b!989955 m!917373))

(declare-fun m!917383 () Bool)

(assert (=> d!117533 m!917383))

(assert (=> d!117533 m!917305))

(assert (=> b!989857 d!117533))

(declare-fun b!989967 () Bool)

(declare-fun e!558219 () Bool)

(assert (=> b!989967 (= e!558219 tp_is_empty!23277)))

(declare-fun mapIsEmpty!36967 () Bool)

(declare-fun mapRes!36967 () Bool)

(assert (=> mapIsEmpty!36967 mapRes!36967))

(declare-fun b!989966 () Bool)

(declare-fun e!558218 () Bool)

(assert (=> b!989966 (= e!558218 tp_is_empty!23277)))

(declare-fun condMapEmpty!36967 () Bool)

(declare-fun mapDefault!36967 () ValueCell!11157)

(assert (=> mapNonEmpty!36961 (= condMapEmpty!36967 (= mapRest!36961 ((as const (Array (_ BitVec 32) ValueCell!11157)) mapDefault!36967)))))

(assert (=> mapNonEmpty!36961 (= tp!69975 (and e!558219 mapRes!36967))))

(declare-fun mapNonEmpty!36967 () Bool)

(declare-fun tp!69984 () Bool)

(assert (=> mapNonEmpty!36967 (= mapRes!36967 (and tp!69984 e!558218))))

(declare-fun mapValue!36967 () ValueCell!11157)

(declare-fun mapRest!36967 () (Array (_ BitVec 32) ValueCell!11157))

(declare-fun mapKey!36967 () (_ BitVec 32))

(assert (=> mapNonEmpty!36967 (= mapRest!36961 (store mapRest!36967 mapKey!36967 mapValue!36967))))

(assert (= (and mapNonEmpty!36961 condMapEmpty!36967) mapIsEmpty!36967))

(assert (= (and mapNonEmpty!36961 (not condMapEmpty!36967)) mapNonEmpty!36967))

(assert (= (and mapNonEmpty!36967 ((_ is ValueCellFull!11157) mapValue!36967)) b!989966))

(assert (= (and mapNonEmpty!36961 ((_ is ValueCellFull!11157) mapDefault!36967)) b!989967))

(declare-fun m!917385 () Bool)

(assert (=> mapNonEmpty!36967 m!917385))

(declare-fun b_lambda!15141 () Bool)

(assert (= b_lambda!15139 (or (and start!84636 b_free!20061) b_lambda!15141)))

(declare-fun b_lambda!15143 () Bool)

(assert (= b_lambda!15137 (or (and start!84636 b_free!20061) b_lambda!15143)))

(check-sat (not d!117533) (not b!989905) tp_is_empty!23277 (not b!989947) (not b!989955) (not b!989918) (not b!989948) (not b_lambda!15143) (not b!989917) (not bm!41953) (not b_next!20061) (not b_lambda!15141) (not b!989920) (not b!989954) (not b!989906) (not b!989946) (not bm!41956) (not mapNonEmpty!36967) (not b!989951) (not bm!41959) b_and!32199 (not b!989950) (not b!989956))
(check-sat b_and!32199 (not b_next!20061))
