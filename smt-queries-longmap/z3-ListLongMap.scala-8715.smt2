; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105742 () Bool)

(assert start!105742)

(declare-fun b_free!27327 () Bool)

(declare-fun b_next!27327 () Bool)

(assert (=> start!105742 (= b_free!27327 (not b_next!27327))))

(declare-fun tp!95507 () Bool)

(declare-fun b_and!45211 () Bool)

(assert (=> start!105742 (= tp!95507 b_and!45211)))

(declare-fun b!1259640 () Bool)

(declare-fun e!716644 () Bool)

(declare-fun tp_is_empty!32229 () Bool)

(assert (=> b!1259640 (= e!716644 tp_is_empty!32229)))

(declare-fun res!839521 () Bool)

(declare-fun e!716645 () Bool)

(assert (=> start!105742 (=> (not res!839521) (not e!716645))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105742 (= res!839521 (validMask!0 mask!1466))))

(assert (=> start!105742 e!716645))

(assert (=> start!105742 true))

(assert (=> start!105742 tp!95507))

(assert (=> start!105742 tp_is_empty!32229))

(declare-datatypes ((array!82076 0))(
  ( (array!82077 (arr!39593 (Array (_ BitVec 32) (_ BitVec 64))) (size!40129 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82076)

(declare-fun array_inv!30145 (array!82076) Bool)

(assert (=> start!105742 (array_inv!30145 _keys!1118)))

(declare-datatypes ((V!48337 0))(
  ( (V!48338 (val!16177 Int)) )
))
(declare-datatypes ((ValueCell!15351 0))(
  ( (ValueCellFull!15351 (v!18879 V!48337)) (EmptyCell!15351) )
))
(declare-datatypes ((array!82078 0))(
  ( (array!82079 (arr!39594 (Array (_ BitVec 32) ValueCell!15351)) (size!40130 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82078)

(declare-fun e!716640 () Bool)

(declare-fun array_inv!30146 (array!82078) Bool)

(assert (=> start!105742 (and (array_inv!30146 _values!914) e!716640)))

(declare-fun b!1259641 () Bool)

(declare-fun e!716643 () Bool)

(assert (=> b!1259641 (= e!716643 (bvsle #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(declare-fun b!1259642 () Bool)

(declare-fun res!839523 () Bool)

(assert (=> b!1259642 (=> (not res!839523) (not e!716645))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259642 (= res!839523 (and (= (size!40130 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40129 _keys!1118) (size!40130 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259643 () Bool)

(declare-fun res!839519 () Bool)

(assert (=> b!1259643 (=> (not res!839519) (not e!716645))))

(declare-datatypes ((List!28120 0))(
  ( (Nil!28117) (Cons!28116 (h!29325 (_ BitVec 64)) (t!41615 List!28120)) )
))
(declare-fun arrayNoDuplicates!0 (array!82076 (_ BitVec 32) List!28120) Bool)

(assert (=> b!1259643 (= res!839519 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28117))))

(declare-fun b!1259644 () Bool)

(declare-fun mapRes!50140 () Bool)

(assert (=> b!1259644 (= e!716640 (and e!716644 mapRes!50140))))

(declare-fun condMapEmpty!50140 () Bool)

(declare-fun mapDefault!50140 () ValueCell!15351)

(assert (=> b!1259644 (= condMapEmpty!50140 (= (arr!39594 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15351)) mapDefault!50140)))))

(declare-fun b!1259645 () Bool)

(declare-fun res!839517 () Bool)

(assert (=> b!1259645 (=> (not res!839517) (not e!716645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82076 (_ BitVec 32)) Bool)

(assert (=> b!1259645 (= res!839517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259646 () Bool)

(declare-fun e!716646 () Bool)

(assert (=> b!1259646 (= e!716646 tp_is_empty!32229)))

(declare-fun mapNonEmpty!50140 () Bool)

(declare-fun tp!95506 () Bool)

(assert (=> mapNonEmpty!50140 (= mapRes!50140 (and tp!95506 e!716646))))

(declare-fun mapKey!50140 () (_ BitVec 32))

(declare-fun mapValue!50140 () ValueCell!15351)

(declare-fun mapRest!50140 () (Array (_ BitVec 32) ValueCell!15351))

(assert (=> mapNonEmpty!50140 (= (arr!39594 _values!914) (store mapRest!50140 mapKey!50140 mapValue!50140))))

(declare-fun b!1259647 () Bool)

(declare-fun e!716642 () Bool)

(assert (=> b!1259647 (= e!716642 e!716643)))

(declare-fun res!839522 () Bool)

(assert (=> b!1259647 (=> res!839522 e!716643)))

(declare-datatypes ((tuple2!20916 0))(
  ( (tuple2!20917 (_1!10469 (_ BitVec 64)) (_2!10469 V!48337)) )
))
(declare-datatypes ((List!28121 0))(
  ( (Nil!28118) (Cons!28117 (h!29326 tuple2!20916) (t!41616 List!28121)) )
))
(declare-datatypes ((ListLongMap!18789 0))(
  ( (ListLongMap!18790 (toList!9410 List!28121)) )
))
(declare-fun lt!570285 () ListLongMap!18789)

(declare-fun lt!570290 () ListLongMap!18789)

(declare-fun -!2116 (ListLongMap!18789 (_ BitVec 64)) ListLongMap!18789)

(assert (=> b!1259647 (= res!839522 (not (= (-!2116 lt!570285 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570290)))))

(declare-fun lt!570289 () ListLongMap!18789)

(declare-fun lt!570282 () ListLongMap!18789)

(assert (=> b!1259647 (= (-!2116 lt!570289 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570282)))

(declare-datatypes ((Unit!42003 0))(
  ( (Unit!42004) )
))
(declare-fun lt!570288 () Unit!42003)

(declare-fun minValueBefore!43 () V!48337)

(declare-fun addThenRemoveForNewKeyIsSame!353 (ListLongMap!18789 (_ BitVec 64) V!48337) Unit!42003)

(assert (=> b!1259647 (= lt!570288 (addThenRemoveForNewKeyIsSame!353 lt!570282 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716641 () Bool)

(assert (=> b!1259647 e!716641))

(declare-fun res!839518 () Bool)

(assert (=> b!1259647 (=> (not res!839518) (not e!716641))))

(assert (=> b!1259647 (= res!839518 (= lt!570285 lt!570289))))

(declare-fun +!4214 (ListLongMap!18789 tuple2!20916) ListLongMap!18789)

(assert (=> b!1259647 (= lt!570289 (+!4214 lt!570282 (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570286 () ListLongMap!18789)

(declare-fun lt!570287 () tuple2!20916)

(assert (=> b!1259647 (= lt!570282 (+!4214 lt!570286 lt!570287))))

(declare-fun zeroValue!871 () V!48337)

(assert (=> b!1259647 (= lt!570287 (tuple2!20917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48337)

(declare-fun getCurrentListMap!4607 (array!82076 array!82078 (_ BitVec 32) (_ BitVec 32) V!48337 V!48337 (_ BitVec 32) Int) ListLongMap!18789)

(assert (=> b!1259647 (= lt!570290 (getCurrentListMap!4607 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259647 (= lt!570285 (getCurrentListMap!4607 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259648 () Bool)

(declare-fun lt!570283 () ListLongMap!18789)

(assert (=> b!1259648 (= e!716641 (= lt!570290 (+!4214 lt!570283 lt!570287)))))

(declare-fun b!1259649 () Bool)

(assert (=> b!1259649 (= e!716645 (not e!716642))))

(declare-fun res!839520 () Bool)

(assert (=> b!1259649 (=> res!839520 e!716642)))

(assert (=> b!1259649 (= res!839520 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1259649 (= lt!570286 lt!570283)))

(declare-fun lt!570284 () Unit!42003)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1150 (array!82076 array!82078 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48337 V!48337 V!48337 V!48337 (_ BitVec 32) Int) Unit!42003)

(assert (=> b!1259649 (= lt!570284 (lemmaNoChangeToArrayThenSameMapNoExtras!1150 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5786 (array!82076 array!82078 (_ BitVec 32) (_ BitVec 32) V!48337 V!48337 (_ BitVec 32) Int) ListLongMap!18789)

(assert (=> b!1259649 (= lt!570283 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259649 (= lt!570286 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50140 () Bool)

(assert (=> mapIsEmpty!50140 mapRes!50140))

(assert (= (and start!105742 res!839521) b!1259642))

(assert (= (and b!1259642 res!839523) b!1259645))

(assert (= (and b!1259645 res!839517) b!1259643))

(assert (= (and b!1259643 res!839519) b!1259649))

(assert (= (and b!1259649 (not res!839520)) b!1259647))

(assert (= (and b!1259647 res!839518) b!1259648))

(assert (= (and b!1259647 (not res!839522)) b!1259641))

(assert (= (and b!1259644 condMapEmpty!50140) mapIsEmpty!50140))

(assert (= (and b!1259644 (not condMapEmpty!50140)) mapNonEmpty!50140))

(get-info :version)

(assert (= (and mapNonEmpty!50140 ((_ is ValueCellFull!15351) mapValue!50140)) b!1259646))

(assert (= (and b!1259644 ((_ is ValueCellFull!15351) mapDefault!50140)) b!1259640))

(assert (= start!105742 b!1259644))

(declare-fun m!1160161 () Bool)

(assert (=> b!1259648 m!1160161))

(declare-fun m!1160163 () Bool)

(assert (=> b!1259643 m!1160163))

(declare-fun m!1160165 () Bool)

(assert (=> b!1259649 m!1160165))

(declare-fun m!1160167 () Bool)

(assert (=> b!1259649 m!1160167))

(declare-fun m!1160169 () Bool)

(assert (=> b!1259649 m!1160169))

(declare-fun m!1160171 () Bool)

(assert (=> b!1259647 m!1160171))

(declare-fun m!1160173 () Bool)

(assert (=> b!1259647 m!1160173))

(declare-fun m!1160175 () Bool)

(assert (=> b!1259647 m!1160175))

(declare-fun m!1160177 () Bool)

(assert (=> b!1259647 m!1160177))

(declare-fun m!1160179 () Bool)

(assert (=> b!1259647 m!1160179))

(declare-fun m!1160181 () Bool)

(assert (=> b!1259647 m!1160181))

(declare-fun m!1160183 () Bool)

(assert (=> b!1259647 m!1160183))

(declare-fun m!1160185 () Bool)

(assert (=> mapNonEmpty!50140 m!1160185))

(declare-fun m!1160187 () Bool)

(assert (=> start!105742 m!1160187))

(declare-fun m!1160189 () Bool)

(assert (=> start!105742 m!1160189))

(declare-fun m!1160191 () Bool)

(assert (=> start!105742 m!1160191))

(declare-fun m!1160193 () Bool)

(assert (=> b!1259645 m!1160193))

(check-sat (not b!1259648) (not b!1259645) (not b!1259643) tp_is_empty!32229 b_and!45211 (not start!105742) (not b!1259647) (not b_next!27327) (not b!1259649) (not mapNonEmpty!50140))
(check-sat b_and!45211 (not b_next!27327))
(get-model)

(declare-fun d!138341 () Bool)

(declare-fun e!716673 () Bool)

(assert (=> d!138341 e!716673))

(declare-fun res!839550 () Bool)

(assert (=> d!138341 (=> (not res!839550) (not e!716673))))

(declare-fun lt!570326 () ListLongMap!18789)

(declare-fun contains!7573 (ListLongMap!18789 (_ BitVec 64)) Bool)

(assert (=> d!138341 (= res!839550 (contains!7573 lt!570326 (_1!10469 lt!570287)))))

(declare-fun lt!570327 () List!28121)

(assert (=> d!138341 (= lt!570326 (ListLongMap!18790 lt!570327))))

(declare-fun lt!570328 () Unit!42003)

(declare-fun lt!570329 () Unit!42003)

(assert (=> d!138341 (= lt!570328 lt!570329)))

(declare-datatypes ((Option!709 0))(
  ( (Some!708 (v!18881 V!48337)) (None!707) )
))
(declare-fun getValueByKey!658 (List!28121 (_ BitVec 64)) Option!709)

(assert (=> d!138341 (= (getValueByKey!658 lt!570327 (_1!10469 lt!570287)) (Some!708 (_2!10469 lt!570287)))))

(declare-fun lemmaContainsTupThenGetReturnValue!331 (List!28121 (_ BitVec 64) V!48337) Unit!42003)

(assert (=> d!138341 (= lt!570329 (lemmaContainsTupThenGetReturnValue!331 lt!570327 (_1!10469 lt!570287) (_2!10469 lt!570287)))))

(declare-fun insertStrictlySorted!445 (List!28121 (_ BitVec 64) V!48337) List!28121)

(assert (=> d!138341 (= lt!570327 (insertStrictlySorted!445 (toList!9410 lt!570283) (_1!10469 lt!570287) (_2!10469 lt!570287)))))

(assert (=> d!138341 (= (+!4214 lt!570283 lt!570287) lt!570326)))

(declare-fun b!1259684 () Bool)

(declare-fun res!839549 () Bool)

(assert (=> b!1259684 (=> (not res!839549) (not e!716673))))

(assert (=> b!1259684 (= res!839549 (= (getValueByKey!658 (toList!9410 lt!570326) (_1!10469 lt!570287)) (Some!708 (_2!10469 lt!570287))))))

(declare-fun b!1259685 () Bool)

(declare-fun contains!7574 (List!28121 tuple2!20916) Bool)

(assert (=> b!1259685 (= e!716673 (contains!7574 (toList!9410 lt!570326) lt!570287))))

(assert (= (and d!138341 res!839550) b!1259684))

(assert (= (and b!1259684 res!839549) b!1259685))

(declare-fun m!1160229 () Bool)

(assert (=> d!138341 m!1160229))

(declare-fun m!1160231 () Bool)

(assert (=> d!138341 m!1160231))

(declare-fun m!1160233 () Bool)

(assert (=> d!138341 m!1160233))

(declare-fun m!1160235 () Bool)

(assert (=> d!138341 m!1160235))

(declare-fun m!1160237 () Bool)

(assert (=> b!1259684 m!1160237))

(declare-fun m!1160239 () Bool)

(assert (=> b!1259685 m!1160239))

(assert (=> b!1259648 d!138341))

(declare-fun d!138343 () Bool)

(declare-fun e!716674 () Bool)

(assert (=> d!138343 e!716674))

(declare-fun res!839552 () Bool)

(assert (=> d!138343 (=> (not res!839552) (not e!716674))))

(declare-fun lt!570330 () ListLongMap!18789)

(assert (=> d!138343 (= res!839552 (contains!7573 lt!570330 (_1!10469 (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!570331 () List!28121)

(assert (=> d!138343 (= lt!570330 (ListLongMap!18790 lt!570331))))

(declare-fun lt!570332 () Unit!42003)

(declare-fun lt!570333 () Unit!42003)

(assert (=> d!138343 (= lt!570332 lt!570333)))

(assert (=> d!138343 (= (getValueByKey!658 lt!570331 (_1!10469 (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!708 (_2!10469 (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138343 (= lt!570333 (lemmaContainsTupThenGetReturnValue!331 lt!570331 (_1!10469 (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10469 (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138343 (= lt!570331 (insertStrictlySorted!445 (toList!9410 lt!570282) (_1!10469 (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10469 (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138343 (= (+!4214 lt!570282 (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!570330)))

(declare-fun b!1259686 () Bool)

(declare-fun res!839551 () Bool)

(assert (=> b!1259686 (=> (not res!839551) (not e!716674))))

(assert (=> b!1259686 (= res!839551 (= (getValueByKey!658 (toList!9410 lt!570330) (_1!10469 (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!708 (_2!10469 (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1259687 () Bool)

(assert (=> b!1259687 (= e!716674 (contains!7574 (toList!9410 lt!570330) (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138343 res!839552) b!1259686))

(assert (= (and b!1259686 res!839551) b!1259687))

(declare-fun m!1160241 () Bool)

(assert (=> d!138343 m!1160241))

(declare-fun m!1160243 () Bool)

(assert (=> d!138343 m!1160243))

(declare-fun m!1160245 () Bool)

(assert (=> d!138343 m!1160245))

(declare-fun m!1160247 () Bool)

(assert (=> d!138343 m!1160247))

(declare-fun m!1160249 () Bool)

(assert (=> b!1259686 m!1160249))

(declare-fun m!1160251 () Bool)

(assert (=> b!1259687 m!1160251))

(assert (=> b!1259647 d!138343))

(declare-fun d!138345 () Bool)

(declare-fun lt!570336 () ListLongMap!18789)

(assert (=> d!138345 (not (contains!7573 lt!570336 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!142 (List!28121 (_ BitVec 64)) List!28121)

(assert (=> d!138345 (= lt!570336 (ListLongMap!18790 (removeStrictlySorted!142 (toList!9410 lt!570289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138345 (= (-!2116 lt!570289 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570336)))

(declare-fun bs!35638 () Bool)

(assert (= bs!35638 d!138345))

(declare-fun m!1160253 () Bool)

(assert (=> bs!35638 m!1160253))

(declare-fun m!1160255 () Bool)

(assert (=> bs!35638 m!1160255))

(assert (=> b!1259647 d!138345))

(declare-fun d!138347 () Bool)

(assert (=> d!138347 (= (-!2116 (+!4214 lt!570282 (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!570282)))

(declare-fun lt!570339 () Unit!42003)

(declare-fun choose!1864 (ListLongMap!18789 (_ BitVec 64) V!48337) Unit!42003)

(assert (=> d!138347 (= lt!570339 (choose!1864 lt!570282 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> d!138347 (not (contains!7573 lt!570282 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138347 (= (addThenRemoveForNewKeyIsSame!353 lt!570282 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43) lt!570339)))

(declare-fun bs!35639 () Bool)

(assert (= bs!35639 d!138347))

(assert (=> bs!35639 m!1160179))

(assert (=> bs!35639 m!1160179))

(declare-fun m!1160257 () Bool)

(assert (=> bs!35639 m!1160257))

(declare-fun m!1160259 () Bool)

(assert (=> bs!35639 m!1160259))

(declare-fun m!1160261 () Bool)

(assert (=> bs!35639 m!1160261))

(assert (=> b!1259647 d!138347))

(declare-fun d!138349 () Bool)

(declare-fun lt!570340 () ListLongMap!18789)

(assert (=> d!138349 (not (contains!7573 lt!570340 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138349 (= lt!570340 (ListLongMap!18790 (removeStrictlySorted!142 (toList!9410 lt!570285) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138349 (= (-!2116 lt!570285 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570340)))

(declare-fun bs!35640 () Bool)

(assert (= bs!35640 d!138349))

(declare-fun m!1160263 () Bool)

(assert (=> bs!35640 m!1160263))

(declare-fun m!1160265 () Bool)

(assert (=> bs!35640 m!1160265))

(assert (=> b!1259647 d!138349))

(declare-fun b!1259730 () Bool)

(declare-fun res!839579 () Bool)

(declare-fun e!716706 () Bool)

(assert (=> b!1259730 (=> (not res!839579) (not e!716706))))

(declare-fun e!716707 () Bool)

(assert (=> b!1259730 (= res!839579 e!716707)))

(declare-fun res!839575 () Bool)

(assert (=> b!1259730 (=> res!839575 e!716707)))

(declare-fun e!716712 () Bool)

(assert (=> b!1259730 (= res!839575 (not e!716712))))

(declare-fun res!839573 () Bool)

(assert (=> b!1259730 (=> (not res!839573) (not e!716712))))

(assert (=> b!1259730 (= res!839573 (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(declare-fun call!61897 () ListLongMap!18789)

(declare-fun bm!61892 () Bool)

(assert (=> bm!61892 (= call!61897 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259731 () Bool)

(declare-fun e!716709 () Bool)

(declare-fun e!716705 () Bool)

(assert (=> b!1259731 (= e!716709 e!716705)))

(declare-fun res!839576 () Bool)

(declare-fun call!61900 () Bool)

(assert (=> b!1259731 (= res!839576 call!61900)))

(assert (=> b!1259731 (=> (not res!839576) (not e!716705))))

(declare-fun b!1259732 () Bool)

(declare-fun e!716710 () Bool)

(assert (=> b!1259732 (= e!716707 e!716710)))

(declare-fun res!839574 () Bool)

(assert (=> b!1259732 (=> (not res!839574) (not e!716710))))

(declare-fun lt!570406 () ListLongMap!18789)

(assert (=> b!1259732 (= res!839574 (contains!7573 lt!570406 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1259732 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(declare-fun bm!61893 () Bool)

(declare-fun call!61895 () ListLongMap!18789)

(declare-fun call!61901 () ListLongMap!18789)

(assert (=> bm!61893 (= call!61895 call!61901)))

(declare-fun b!1259733 () Bool)

(assert (=> b!1259733 (= e!716706 e!716709)))

(declare-fun c!122571 () Bool)

(assert (=> b!1259733 (= c!122571 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259734 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1259734 (= e!716712 (validKeyInArray!0 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138351 () Bool)

(assert (=> d!138351 e!716706))

(declare-fun res!839572 () Bool)

(assert (=> d!138351 (=> (not res!839572) (not e!716706))))

(assert (=> d!138351 (= res!839572 (or (bvsge #b00000000000000000000000000000000 (size!40129 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))))

(declare-fun lt!570404 () ListLongMap!18789)

(assert (=> d!138351 (= lt!570406 lt!570404)))

(declare-fun lt!570393 () Unit!42003)

(declare-fun e!716704 () Unit!42003)

(assert (=> d!138351 (= lt!570393 e!716704)))

(declare-fun c!122573 () Bool)

(declare-fun e!716701 () Bool)

(assert (=> d!138351 (= c!122573 e!716701)))

(declare-fun res!839578 () Bool)

(assert (=> d!138351 (=> (not res!839578) (not e!716701))))

(assert (=> d!138351 (= res!839578 (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(declare-fun e!716713 () ListLongMap!18789)

(assert (=> d!138351 (= lt!570404 e!716713)))

(declare-fun c!122570 () Bool)

(assert (=> d!138351 (= c!122570 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138351 (validMask!0 mask!1466)))

(assert (=> d!138351 (= (getCurrentListMap!4607 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!570406)))

(declare-fun b!1259735 () Bool)

(declare-fun apply!992 (ListLongMap!18789 (_ BitVec 64)) V!48337)

(assert (=> b!1259735 (= e!716705 (= (apply!992 lt!570406 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1259736 () Bool)

(declare-fun e!716708 () ListLongMap!18789)

(assert (=> b!1259736 (= e!716713 e!716708)))

(declare-fun c!122574 () Bool)

(assert (=> b!1259736 (= c!122574 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259737 () Bool)

(declare-fun call!61899 () ListLongMap!18789)

(assert (=> b!1259737 (= e!716713 (+!4214 call!61899 (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun bm!61894 () Bool)

(declare-fun call!61898 () Bool)

(assert (=> bm!61894 (= call!61898 (contains!7573 lt!570406 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1259738 () Bool)

(declare-fun c!122569 () Bool)

(assert (=> b!1259738 (= c!122569 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!716711 () ListLongMap!18789)

(assert (=> b!1259738 (= e!716708 e!716711)))

(declare-fun b!1259739 () Bool)

(declare-fun e!716703 () Bool)

(assert (=> b!1259739 (= e!716703 (not call!61898))))

(declare-fun b!1259740 () Bool)

(declare-fun res!839571 () Bool)

(assert (=> b!1259740 (=> (not res!839571) (not e!716706))))

(assert (=> b!1259740 (= res!839571 e!716703)))

(declare-fun c!122572 () Bool)

(assert (=> b!1259740 (= c!122572 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!61895 () Bool)

(declare-fun call!61896 () ListLongMap!18789)

(assert (=> bm!61895 (= call!61896 call!61899)))

(declare-fun bm!61896 () Bool)

(assert (=> bm!61896 (= call!61900 (contains!7573 lt!570406 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1259741 () Bool)

(assert (=> b!1259741 (= e!716708 call!61896)))

(declare-fun b!1259742 () Bool)

(assert (=> b!1259742 (= e!716701 (validKeyInArray!0 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61897 () Bool)

(assert (=> bm!61897 (= call!61901 call!61897)))

(declare-fun b!1259743 () Bool)

(declare-fun Unit!42007 () Unit!42003)

(assert (=> b!1259743 (= e!716704 Unit!42007)))

(declare-fun b!1259744 () Bool)

(declare-fun get!20219 (ValueCell!15351 V!48337) V!48337)

(declare-fun dynLambda!3390 (Int (_ BitVec 64)) V!48337)

(assert (=> b!1259744 (= e!716710 (= (apply!992 lt!570406 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)) (get!20219 (select (arr!39594 _values!914) #b00000000000000000000000000000000) (dynLambda!3390 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1259744 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40130 _values!914)))))

(assert (=> b!1259744 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(declare-fun b!1259745 () Bool)

(declare-fun e!716702 () Bool)

(assert (=> b!1259745 (= e!716702 (= (apply!992 lt!570406 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1259746 () Bool)

(assert (=> b!1259746 (= e!716709 (not call!61900))))

(declare-fun b!1259747 () Bool)

(assert (=> b!1259747 (= e!716711 call!61895)))

(declare-fun bm!61898 () Bool)

(assert (=> bm!61898 (= call!61899 (+!4214 (ite c!122570 call!61897 (ite c!122574 call!61901 call!61895)) (ite (or c!122570 c!122574) (tuple2!20917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1259748 () Bool)

(assert (=> b!1259748 (= e!716703 e!716702)))

(declare-fun res!839577 () Bool)

(assert (=> b!1259748 (= res!839577 call!61898)))

(assert (=> b!1259748 (=> (not res!839577) (not e!716702))))

(declare-fun b!1259749 () Bool)

(assert (=> b!1259749 (= e!716711 call!61896)))

(declare-fun b!1259750 () Bool)

(declare-fun lt!570394 () Unit!42003)

(assert (=> b!1259750 (= e!716704 lt!570394)))

(declare-fun lt!570391 () ListLongMap!18789)

(assert (=> b!1259750 (= lt!570391 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570397 () (_ BitVec 64))

(assert (=> b!1259750 (= lt!570397 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570403 () (_ BitVec 64))

(assert (=> b!1259750 (= lt!570403 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570396 () Unit!42003)

(declare-fun addStillContains!1083 (ListLongMap!18789 (_ BitVec 64) V!48337 (_ BitVec 64)) Unit!42003)

(assert (=> b!1259750 (= lt!570396 (addStillContains!1083 lt!570391 lt!570397 zeroValue!871 lt!570403))))

(assert (=> b!1259750 (contains!7573 (+!4214 lt!570391 (tuple2!20917 lt!570397 zeroValue!871)) lt!570403)))

(declare-fun lt!570385 () Unit!42003)

(assert (=> b!1259750 (= lt!570385 lt!570396)))

(declare-fun lt!570402 () ListLongMap!18789)

(assert (=> b!1259750 (= lt!570402 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570395 () (_ BitVec 64))

(assert (=> b!1259750 (= lt!570395 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570401 () (_ BitVec 64))

(assert (=> b!1259750 (= lt!570401 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570399 () Unit!42003)

(declare-fun addApplyDifferent!537 (ListLongMap!18789 (_ BitVec 64) V!48337 (_ BitVec 64)) Unit!42003)

(assert (=> b!1259750 (= lt!570399 (addApplyDifferent!537 lt!570402 lt!570395 minValueAfter!43 lt!570401))))

(assert (=> b!1259750 (= (apply!992 (+!4214 lt!570402 (tuple2!20917 lt!570395 minValueAfter!43)) lt!570401) (apply!992 lt!570402 lt!570401))))

(declare-fun lt!570400 () Unit!42003)

(assert (=> b!1259750 (= lt!570400 lt!570399)))

(declare-fun lt!570387 () ListLongMap!18789)

(assert (=> b!1259750 (= lt!570387 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570398 () (_ BitVec 64))

(assert (=> b!1259750 (= lt!570398 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570386 () (_ BitVec 64))

(assert (=> b!1259750 (= lt!570386 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570392 () Unit!42003)

(assert (=> b!1259750 (= lt!570392 (addApplyDifferent!537 lt!570387 lt!570398 zeroValue!871 lt!570386))))

(assert (=> b!1259750 (= (apply!992 (+!4214 lt!570387 (tuple2!20917 lt!570398 zeroValue!871)) lt!570386) (apply!992 lt!570387 lt!570386))))

(declare-fun lt!570389 () Unit!42003)

(assert (=> b!1259750 (= lt!570389 lt!570392)))

(declare-fun lt!570390 () ListLongMap!18789)

(assert (=> b!1259750 (= lt!570390 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570405 () (_ BitVec 64))

(assert (=> b!1259750 (= lt!570405 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570388 () (_ BitVec 64))

(assert (=> b!1259750 (= lt!570388 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1259750 (= lt!570394 (addApplyDifferent!537 lt!570390 lt!570405 minValueAfter!43 lt!570388))))

(assert (=> b!1259750 (= (apply!992 (+!4214 lt!570390 (tuple2!20917 lt!570405 minValueAfter!43)) lt!570388) (apply!992 lt!570390 lt!570388))))

(assert (= (and d!138351 c!122570) b!1259737))

(assert (= (and d!138351 (not c!122570)) b!1259736))

(assert (= (and b!1259736 c!122574) b!1259741))

(assert (= (and b!1259736 (not c!122574)) b!1259738))

(assert (= (and b!1259738 c!122569) b!1259749))

(assert (= (and b!1259738 (not c!122569)) b!1259747))

(assert (= (or b!1259749 b!1259747) bm!61893))

(assert (= (or b!1259741 bm!61893) bm!61897))

(assert (= (or b!1259741 b!1259749) bm!61895))

(assert (= (or b!1259737 bm!61897) bm!61892))

(assert (= (or b!1259737 bm!61895) bm!61898))

(assert (= (and d!138351 res!839578) b!1259742))

(assert (= (and d!138351 c!122573) b!1259750))

(assert (= (and d!138351 (not c!122573)) b!1259743))

(assert (= (and d!138351 res!839572) b!1259730))

(assert (= (and b!1259730 res!839573) b!1259734))

(assert (= (and b!1259730 (not res!839575)) b!1259732))

(assert (= (and b!1259732 res!839574) b!1259744))

(assert (= (and b!1259730 res!839579) b!1259740))

(assert (= (and b!1259740 c!122572) b!1259748))

(assert (= (and b!1259740 (not c!122572)) b!1259739))

(assert (= (and b!1259748 res!839577) b!1259745))

(assert (= (or b!1259748 b!1259739) bm!61894))

(assert (= (and b!1259740 res!839571) b!1259733))

(assert (= (and b!1259733 c!122571) b!1259731))

(assert (= (and b!1259733 (not c!122571)) b!1259746))

(assert (= (and b!1259731 res!839576) b!1259735))

(assert (= (or b!1259731 b!1259746) bm!61896))

(declare-fun b_lambda!22743 () Bool)

(assert (=> (not b_lambda!22743) (not b!1259744)))

(declare-fun t!41619 () Bool)

(declare-fun tb!11311 () Bool)

(assert (=> (and start!105742 (= defaultEntry!922 defaultEntry!922) t!41619) tb!11311))

(declare-fun result!23341 () Bool)

(assert (=> tb!11311 (= result!23341 tp_is_empty!32229)))

(assert (=> b!1259744 t!41619))

(declare-fun b_and!45215 () Bool)

(assert (= b_and!45211 (and (=> t!41619 result!23341) b_and!45215)))

(assert (=> bm!61892 m!1160167))

(declare-fun m!1160267 () Bool)

(assert (=> b!1259735 m!1160267))

(declare-fun m!1160269 () Bool)

(assert (=> b!1259745 m!1160269))

(declare-fun m!1160271 () Bool)

(assert (=> bm!61894 m!1160271))

(declare-fun m!1160273 () Bool)

(assert (=> b!1259742 m!1160273))

(assert (=> b!1259742 m!1160273))

(declare-fun m!1160275 () Bool)

(assert (=> b!1259742 m!1160275))

(assert (=> b!1259732 m!1160273))

(assert (=> b!1259732 m!1160273))

(declare-fun m!1160277 () Bool)

(assert (=> b!1259732 m!1160277))

(declare-fun m!1160279 () Bool)

(assert (=> bm!61896 m!1160279))

(declare-fun m!1160281 () Bool)

(assert (=> bm!61898 m!1160281))

(declare-fun m!1160283 () Bool)

(assert (=> b!1259750 m!1160283))

(declare-fun m!1160285 () Bool)

(assert (=> b!1259750 m!1160285))

(declare-fun m!1160287 () Bool)

(assert (=> b!1259750 m!1160287))

(declare-fun m!1160289 () Bool)

(assert (=> b!1259750 m!1160289))

(assert (=> b!1259750 m!1160273))

(declare-fun m!1160291 () Bool)

(assert (=> b!1259750 m!1160291))

(declare-fun m!1160293 () Bool)

(assert (=> b!1259750 m!1160293))

(declare-fun m!1160295 () Bool)

(assert (=> b!1259750 m!1160295))

(declare-fun m!1160297 () Bool)

(assert (=> b!1259750 m!1160297))

(assert (=> b!1259750 m!1160291))

(declare-fun m!1160299 () Bool)

(assert (=> b!1259750 m!1160299))

(declare-fun m!1160301 () Bool)

(assert (=> b!1259750 m!1160301))

(assert (=> b!1259750 m!1160297))

(declare-fun m!1160303 () Bool)

(assert (=> b!1259750 m!1160303))

(declare-fun m!1160305 () Bool)

(assert (=> b!1259750 m!1160305))

(declare-fun m!1160307 () Bool)

(assert (=> b!1259750 m!1160307))

(assert (=> b!1259750 m!1160283))

(declare-fun m!1160309 () Bool)

(assert (=> b!1259750 m!1160309))

(declare-fun m!1160311 () Bool)

(assert (=> b!1259750 m!1160311))

(assert (=> b!1259750 m!1160287))

(assert (=> b!1259750 m!1160167))

(declare-fun m!1160313 () Bool)

(assert (=> b!1259744 m!1160313))

(assert (=> b!1259744 m!1160273))

(declare-fun m!1160315 () Bool)

(assert (=> b!1259744 m!1160315))

(assert (=> b!1259744 m!1160273))

(declare-fun m!1160317 () Bool)

(assert (=> b!1259744 m!1160317))

(assert (=> b!1259744 m!1160313))

(assert (=> b!1259744 m!1160317))

(declare-fun m!1160319 () Bool)

(assert (=> b!1259744 m!1160319))

(assert (=> d!138351 m!1160187))

(assert (=> b!1259734 m!1160273))

(assert (=> b!1259734 m!1160273))

(assert (=> b!1259734 m!1160275))

(declare-fun m!1160321 () Bool)

(assert (=> b!1259737 m!1160321))

(assert (=> b!1259647 d!138351))

(declare-fun d!138353 () Bool)

(declare-fun e!716714 () Bool)

(assert (=> d!138353 e!716714))

(declare-fun res!839581 () Bool)

(assert (=> d!138353 (=> (not res!839581) (not e!716714))))

(declare-fun lt!570407 () ListLongMap!18789)

(assert (=> d!138353 (= res!839581 (contains!7573 lt!570407 (_1!10469 lt!570287)))))

(declare-fun lt!570408 () List!28121)

(assert (=> d!138353 (= lt!570407 (ListLongMap!18790 lt!570408))))

(declare-fun lt!570409 () Unit!42003)

(declare-fun lt!570410 () Unit!42003)

(assert (=> d!138353 (= lt!570409 lt!570410)))

(assert (=> d!138353 (= (getValueByKey!658 lt!570408 (_1!10469 lt!570287)) (Some!708 (_2!10469 lt!570287)))))

(assert (=> d!138353 (= lt!570410 (lemmaContainsTupThenGetReturnValue!331 lt!570408 (_1!10469 lt!570287) (_2!10469 lt!570287)))))

(assert (=> d!138353 (= lt!570408 (insertStrictlySorted!445 (toList!9410 lt!570286) (_1!10469 lt!570287) (_2!10469 lt!570287)))))

(assert (=> d!138353 (= (+!4214 lt!570286 lt!570287) lt!570407)))

(declare-fun b!1259753 () Bool)

(declare-fun res!839580 () Bool)

(assert (=> b!1259753 (=> (not res!839580) (not e!716714))))

(assert (=> b!1259753 (= res!839580 (= (getValueByKey!658 (toList!9410 lt!570407) (_1!10469 lt!570287)) (Some!708 (_2!10469 lt!570287))))))

(declare-fun b!1259754 () Bool)

(assert (=> b!1259754 (= e!716714 (contains!7574 (toList!9410 lt!570407) lt!570287))))

(assert (= (and d!138353 res!839581) b!1259753))

(assert (= (and b!1259753 res!839580) b!1259754))

(declare-fun m!1160323 () Bool)

(assert (=> d!138353 m!1160323))

(declare-fun m!1160325 () Bool)

(assert (=> d!138353 m!1160325))

(declare-fun m!1160327 () Bool)

(assert (=> d!138353 m!1160327))

(declare-fun m!1160329 () Bool)

(assert (=> d!138353 m!1160329))

(declare-fun m!1160331 () Bool)

(assert (=> b!1259753 m!1160331))

(declare-fun m!1160333 () Bool)

(assert (=> b!1259754 m!1160333))

(assert (=> b!1259647 d!138353))

(declare-fun b!1259755 () Bool)

(declare-fun res!839590 () Bool)

(declare-fun e!716720 () Bool)

(assert (=> b!1259755 (=> (not res!839590) (not e!716720))))

(declare-fun e!716721 () Bool)

(assert (=> b!1259755 (= res!839590 e!716721)))

(declare-fun res!839586 () Bool)

(assert (=> b!1259755 (=> res!839586 e!716721)))

(declare-fun e!716726 () Bool)

(assert (=> b!1259755 (= res!839586 (not e!716726))))

(declare-fun res!839584 () Bool)

(assert (=> b!1259755 (=> (not res!839584) (not e!716726))))

(assert (=> b!1259755 (= res!839584 (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(declare-fun call!61904 () ListLongMap!18789)

(declare-fun bm!61899 () Bool)

(assert (=> bm!61899 (= call!61904 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259756 () Bool)

(declare-fun e!716723 () Bool)

(declare-fun e!716719 () Bool)

(assert (=> b!1259756 (= e!716723 e!716719)))

(declare-fun res!839587 () Bool)

(declare-fun call!61907 () Bool)

(assert (=> b!1259756 (= res!839587 call!61907)))

(assert (=> b!1259756 (=> (not res!839587) (not e!716719))))

(declare-fun b!1259757 () Bool)

(declare-fun e!716724 () Bool)

(assert (=> b!1259757 (= e!716721 e!716724)))

(declare-fun res!839585 () Bool)

(assert (=> b!1259757 (=> (not res!839585) (not e!716724))))

(declare-fun lt!570432 () ListLongMap!18789)

(assert (=> b!1259757 (= res!839585 (contains!7573 lt!570432 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1259757 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(declare-fun bm!61900 () Bool)

(declare-fun call!61902 () ListLongMap!18789)

(declare-fun call!61908 () ListLongMap!18789)

(assert (=> bm!61900 (= call!61902 call!61908)))

(declare-fun b!1259758 () Bool)

(assert (=> b!1259758 (= e!716720 e!716723)))

(declare-fun c!122577 () Bool)

(assert (=> b!1259758 (= c!122577 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259759 () Bool)

(assert (=> b!1259759 (= e!716726 (validKeyInArray!0 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138355 () Bool)

(assert (=> d!138355 e!716720))

(declare-fun res!839583 () Bool)

(assert (=> d!138355 (=> (not res!839583) (not e!716720))))

(assert (=> d!138355 (= res!839583 (or (bvsge #b00000000000000000000000000000000 (size!40129 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))))

(declare-fun lt!570430 () ListLongMap!18789)

(assert (=> d!138355 (= lt!570432 lt!570430)))

(declare-fun lt!570419 () Unit!42003)

(declare-fun e!716718 () Unit!42003)

(assert (=> d!138355 (= lt!570419 e!716718)))

(declare-fun c!122579 () Bool)

(declare-fun e!716715 () Bool)

(assert (=> d!138355 (= c!122579 e!716715)))

(declare-fun res!839589 () Bool)

(assert (=> d!138355 (=> (not res!839589) (not e!716715))))

(assert (=> d!138355 (= res!839589 (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(declare-fun e!716727 () ListLongMap!18789)

(assert (=> d!138355 (= lt!570430 e!716727)))

(declare-fun c!122576 () Bool)

(assert (=> d!138355 (= c!122576 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138355 (validMask!0 mask!1466)))

(assert (=> d!138355 (= (getCurrentListMap!4607 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!570432)))

(declare-fun b!1259760 () Bool)

(assert (=> b!1259760 (= e!716719 (= (apply!992 lt!570432 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1259761 () Bool)

(declare-fun e!716722 () ListLongMap!18789)

(assert (=> b!1259761 (= e!716727 e!716722)))

(declare-fun c!122580 () Bool)

(assert (=> b!1259761 (= c!122580 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259762 () Bool)

(declare-fun call!61906 () ListLongMap!18789)

(assert (=> b!1259762 (= e!716727 (+!4214 call!61906 (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun bm!61901 () Bool)

(declare-fun call!61905 () Bool)

(assert (=> bm!61901 (= call!61905 (contains!7573 lt!570432 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1259763 () Bool)

(declare-fun c!122575 () Bool)

(assert (=> b!1259763 (= c!122575 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!716725 () ListLongMap!18789)

(assert (=> b!1259763 (= e!716722 e!716725)))

(declare-fun b!1259764 () Bool)

(declare-fun e!716717 () Bool)

(assert (=> b!1259764 (= e!716717 (not call!61905))))

(declare-fun b!1259765 () Bool)

(declare-fun res!839582 () Bool)

(assert (=> b!1259765 (=> (not res!839582) (not e!716720))))

(assert (=> b!1259765 (= res!839582 e!716717)))

(declare-fun c!122578 () Bool)

(assert (=> b!1259765 (= c!122578 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!61902 () Bool)

(declare-fun call!61903 () ListLongMap!18789)

(assert (=> bm!61902 (= call!61903 call!61906)))

(declare-fun bm!61903 () Bool)

(assert (=> bm!61903 (= call!61907 (contains!7573 lt!570432 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1259766 () Bool)

(assert (=> b!1259766 (= e!716722 call!61903)))

(declare-fun b!1259767 () Bool)

(assert (=> b!1259767 (= e!716715 (validKeyInArray!0 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61904 () Bool)

(assert (=> bm!61904 (= call!61908 call!61904)))

(declare-fun b!1259768 () Bool)

(declare-fun Unit!42008 () Unit!42003)

(assert (=> b!1259768 (= e!716718 Unit!42008)))

(declare-fun b!1259769 () Bool)

(assert (=> b!1259769 (= e!716724 (= (apply!992 lt!570432 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)) (get!20219 (select (arr!39594 _values!914) #b00000000000000000000000000000000) (dynLambda!3390 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1259769 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40130 _values!914)))))

(assert (=> b!1259769 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(declare-fun b!1259770 () Bool)

(declare-fun e!716716 () Bool)

(assert (=> b!1259770 (= e!716716 (= (apply!992 lt!570432 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1259771 () Bool)

(assert (=> b!1259771 (= e!716723 (not call!61907))))

(declare-fun b!1259772 () Bool)

(assert (=> b!1259772 (= e!716725 call!61902)))

(declare-fun bm!61905 () Bool)

(assert (=> bm!61905 (= call!61906 (+!4214 (ite c!122576 call!61904 (ite c!122580 call!61908 call!61902)) (ite (or c!122576 c!122580) (tuple2!20917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1259773 () Bool)

(assert (=> b!1259773 (= e!716717 e!716716)))

(declare-fun res!839588 () Bool)

(assert (=> b!1259773 (= res!839588 call!61905)))

(assert (=> b!1259773 (=> (not res!839588) (not e!716716))))

(declare-fun b!1259774 () Bool)

(assert (=> b!1259774 (= e!716725 call!61903)))

(declare-fun b!1259775 () Bool)

(declare-fun lt!570420 () Unit!42003)

(assert (=> b!1259775 (= e!716718 lt!570420)))

(declare-fun lt!570417 () ListLongMap!18789)

(assert (=> b!1259775 (= lt!570417 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570423 () (_ BitVec 64))

(assert (=> b!1259775 (= lt!570423 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570429 () (_ BitVec 64))

(assert (=> b!1259775 (= lt!570429 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570422 () Unit!42003)

(assert (=> b!1259775 (= lt!570422 (addStillContains!1083 lt!570417 lt!570423 zeroValue!871 lt!570429))))

(assert (=> b!1259775 (contains!7573 (+!4214 lt!570417 (tuple2!20917 lt!570423 zeroValue!871)) lt!570429)))

(declare-fun lt!570411 () Unit!42003)

(assert (=> b!1259775 (= lt!570411 lt!570422)))

(declare-fun lt!570428 () ListLongMap!18789)

(assert (=> b!1259775 (= lt!570428 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570421 () (_ BitVec 64))

(assert (=> b!1259775 (= lt!570421 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570427 () (_ BitVec 64))

(assert (=> b!1259775 (= lt!570427 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570425 () Unit!42003)

(assert (=> b!1259775 (= lt!570425 (addApplyDifferent!537 lt!570428 lt!570421 minValueBefore!43 lt!570427))))

(assert (=> b!1259775 (= (apply!992 (+!4214 lt!570428 (tuple2!20917 lt!570421 minValueBefore!43)) lt!570427) (apply!992 lt!570428 lt!570427))))

(declare-fun lt!570426 () Unit!42003)

(assert (=> b!1259775 (= lt!570426 lt!570425)))

(declare-fun lt!570413 () ListLongMap!18789)

(assert (=> b!1259775 (= lt!570413 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570424 () (_ BitVec 64))

(assert (=> b!1259775 (= lt!570424 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570412 () (_ BitVec 64))

(assert (=> b!1259775 (= lt!570412 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570418 () Unit!42003)

(assert (=> b!1259775 (= lt!570418 (addApplyDifferent!537 lt!570413 lt!570424 zeroValue!871 lt!570412))))

(assert (=> b!1259775 (= (apply!992 (+!4214 lt!570413 (tuple2!20917 lt!570424 zeroValue!871)) lt!570412) (apply!992 lt!570413 lt!570412))))

(declare-fun lt!570415 () Unit!42003)

(assert (=> b!1259775 (= lt!570415 lt!570418)))

(declare-fun lt!570416 () ListLongMap!18789)

(assert (=> b!1259775 (= lt!570416 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570431 () (_ BitVec 64))

(assert (=> b!1259775 (= lt!570431 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570414 () (_ BitVec 64))

(assert (=> b!1259775 (= lt!570414 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1259775 (= lt!570420 (addApplyDifferent!537 lt!570416 lt!570431 minValueBefore!43 lt!570414))))

(assert (=> b!1259775 (= (apply!992 (+!4214 lt!570416 (tuple2!20917 lt!570431 minValueBefore!43)) lt!570414) (apply!992 lt!570416 lt!570414))))

(assert (= (and d!138355 c!122576) b!1259762))

(assert (= (and d!138355 (not c!122576)) b!1259761))

(assert (= (and b!1259761 c!122580) b!1259766))

(assert (= (and b!1259761 (not c!122580)) b!1259763))

(assert (= (and b!1259763 c!122575) b!1259774))

(assert (= (and b!1259763 (not c!122575)) b!1259772))

(assert (= (or b!1259774 b!1259772) bm!61900))

(assert (= (or b!1259766 bm!61900) bm!61904))

(assert (= (or b!1259766 b!1259774) bm!61902))

(assert (= (or b!1259762 bm!61904) bm!61899))

(assert (= (or b!1259762 bm!61902) bm!61905))

(assert (= (and d!138355 res!839589) b!1259767))

(assert (= (and d!138355 c!122579) b!1259775))

(assert (= (and d!138355 (not c!122579)) b!1259768))

(assert (= (and d!138355 res!839583) b!1259755))

(assert (= (and b!1259755 res!839584) b!1259759))

(assert (= (and b!1259755 (not res!839586)) b!1259757))

(assert (= (and b!1259757 res!839585) b!1259769))

(assert (= (and b!1259755 res!839590) b!1259765))

(assert (= (and b!1259765 c!122578) b!1259773))

(assert (= (and b!1259765 (not c!122578)) b!1259764))

(assert (= (and b!1259773 res!839588) b!1259770))

(assert (= (or b!1259773 b!1259764) bm!61901))

(assert (= (and b!1259765 res!839582) b!1259758))

(assert (= (and b!1259758 c!122577) b!1259756))

(assert (= (and b!1259758 (not c!122577)) b!1259771))

(assert (= (and b!1259756 res!839587) b!1259760))

(assert (= (or b!1259756 b!1259771) bm!61903))

(declare-fun b_lambda!22745 () Bool)

(assert (=> (not b_lambda!22745) (not b!1259769)))

(assert (=> b!1259769 t!41619))

(declare-fun b_and!45217 () Bool)

(assert (= b_and!45215 (and (=> t!41619 result!23341) b_and!45217)))

(assert (=> bm!61899 m!1160169))

(declare-fun m!1160335 () Bool)

(assert (=> b!1259760 m!1160335))

(declare-fun m!1160337 () Bool)

(assert (=> b!1259770 m!1160337))

(declare-fun m!1160339 () Bool)

(assert (=> bm!61901 m!1160339))

(assert (=> b!1259767 m!1160273))

(assert (=> b!1259767 m!1160273))

(assert (=> b!1259767 m!1160275))

(assert (=> b!1259757 m!1160273))

(assert (=> b!1259757 m!1160273))

(declare-fun m!1160341 () Bool)

(assert (=> b!1259757 m!1160341))

(declare-fun m!1160343 () Bool)

(assert (=> bm!61903 m!1160343))

(declare-fun m!1160345 () Bool)

(assert (=> bm!61905 m!1160345))

(declare-fun m!1160347 () Bool)

(assert (=> b!1259775 m!1160347))

(declare-fun m!1160349 () Bool)

(assert (=> b!1259775 m!1160349))

(declare-fun m!1160351 () Bool)

(assert (=> b!1259775 m!1160351))

(declare-fun m!1160353 () Bool)

(assert (=> b!1259775 m!1160353))

(assert (=> b!1259775 m!1160273))

(declare-fun m!1160355 () Bool)

(assert (=> b!1259775 m!1160355))

(declare-fun m!1160357 () Bool)

(assert (=> b!1259775 m!1160357))

(declare-fun m!1160359 () Bool)

(assert (=> b!1259775 m!1160359))

(declare-fun m!1160361 () Bool)

(assert (=> b!1259775 m!1160361))

(assert (=> b!1259775 m!1160355))

(declare-fun m!1160363 () Bool)

(assert (=> b!1259775 m!1160363))

(declare-fun m!1160365 () Bool)

(assert (=> b!1259775 m!1160365))

(assert (=> b!1259775 m!1160361))

(declare-fun m!1160367 () Bool)

(assert (=> b!1259775 m!1160367))

(declare-fun m!1160369 () Bool)

(assert (=> b!1259775 m!1160369))

(declare-fun m!1160371 () Bool)

(assert (=> b!1259775 m!1160371))

(assert (=> b!1259775 m!1160347))

(declare-fun m!1160373 () Bool)

(assert (=> b!1259775 m!1160373))

(declare-fun m!1160375 () Bool)

(assert (=> b!1259775 m!1160375))

(assert (=> b!1259775 m!1160351))

(assert (=> b!1259775 m!1160169))

(assert (=> b!1259769 m!1160313))

(assert (=> b!1259769 m!1160273))

(declare-fun m!1160377 () Bool)

(assert (=> b!1259769 m!1160377))

(assert (=> b!1259769 m!1160273))

(assert (=> b!1259769 m!1160317))

(assert (=> b!1259769 m!1160313))

(assert (=> b!1259769 m!1160317))

(assert (=> b!1259769 m!1160319))

(assert (=> d!138355 m!1160187))

(assert (=> b!1259759 m!1160273))

(assert (=> b!1259759 m!1160273))

(assert (=> b!1259759 m!1160275))

(declare-fun m!1160379 () Bool)

(assert (=> b!1259762 m!1160379))

(assert (=> b!1259647 d!138355))

(declare-fun b!1259786 () Bool)

(declare-fun e!716739 () Bool)

(declare-fun call!61911 () Bool)

(assert (=> b!1259786 (= e!716739 call!61911)))

(declare-fun d!138357 () Bool)

(declare-fun res!839599 () Bool)

(declare-fun e!716736 () Bool)

(assert (=> d!138357 (=> res!839599 e!716736)))

(assert (=> d!138357 (= res!839599 (bvsge #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(assert (=> d!138357 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28117) e!716736)))

(declare-fun b!1259787 () Bool)

(declare-fun e!716737 () Bool)

(assert (=> b!1259787 (= e!716737 e!716739)))

(declare-fun c!122583 () Bool)

(assert (=> b!1259787 (= c!122583 (validKeyInArray!0 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61908 () Bool)

(assert (=> bm!61908 (= call!61911 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122583 (Cons!28116 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000) Nil!28117) Nil!28117)))))

(declare-fun b!1259788 () Bool)

(assert (=> b!1259788 (= e!716736 e!716737)))

(declare-fun res!839598 () Bool)

(assert (=> b!1259788 (=> (not res!839598) (not e!716737))))

(declare-fun e!716738 () Bool)

(assert (=> b!1259788 (= res!839598 (not e!716738))))

(declare-fun res!839597 () Bool)

(assert (=> b!1259788 (=> (not res!839597) (not e!716738))))

(assert (=> b!1259788 (= res!839597 (validKeyInArray!0 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1259789 () Bool)

(assert (=> b!1259789 (= e!716739 call!61911)))

(declare-fun b!1259790 () Bool)

(declare-fun contains!7575 (List!28120 (_ BitVec 64)) Bool)

(assert (=> b!1259790 (= e!716738 (contains!7575 Nil!28117 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138357 (not res!839599)) b!1259788))

(assert (= (and b!1259788 res!839597) b!1259790))

(assert (= (and b!1259788 res!839598) b!1259787))

(assert (= (and b!1259787 c!122583) b!1259786))

(assert (= (and b!1259787 (not c!122583)) b!1259789))

(assert (= (or b!1259786 b!1259789) bm!61908))

(assert (=> b!1259787 m!1160273))

(assert (=> b!1259787 m!1160273))

(assert (=> b!1259787 m!1160275))

(assert (=> bm!61908 m!1160273))

(declare-fun m!1160381 () Bool)

(assert (=> bm!61908 m!1160381))

(assert (=> b!1259788 m!1160273))

(assert (=> b!1259788 m!1160273))

(assert (=> b!1259788 m!1160275))

(assert (=> b!1259790 m!1160273))

(assert (=> b!1259790 m!1160273))

(declare-fun m!1160383 () Bool)

(assert (=> b!1259790 m!1160383))

(assert (=> b!1259643 d!138357))

(declare-fun d!138359 () Bool)

(assert (=> d!138359 (= (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570435 () Unit!42003)

(declare-fun choose!1865 (array!82076 array!82078 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48337 V!48337 V!48337 V!48337 (_ BitVec 32) Int) Unit!42003)

(assert (=> d!138359 (= lt!570435 (choose!1865 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138359 (validMask!0 mask!1466)))

(assert (=> d!138359 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1150 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!570435)))

(declare-fun bs!35641 () Bool)

(assert (= bs!35641 d!138359))

(assert (=> bs!35641 m!1160169))

(assert (=> bs!35641 m!1160167))

(declare-fun m!1160385 () Bool)

(assert (=> bs!35641 m!1160385))

(assert (=> bs!35641 m!1160187))

(assert (=> b!1259649 d!138359))

(declare-fun b!1259815 () Bool)

(declare-fun e!716757 () Bool)

(declare-fun lt!570453 () ListLongMap!18789)

(declare-fun isEmpty!1034 (ListLongMap!18789) Bool)

(assert (=> b!1259815 (= e!716757 (isEmpty!1034 lt!570453))))

(declare-fun b!1259816 () Bool)

(declare-fun e!716759 () ListLongMap!18789)

(assert (=> b!1259816 (= e!716759 (ListLongMap!18790 Nil!28118))))

(declare-fun b!1259817 () Bool)

(declare-fun res!839609 () Bool)

(declare-fun e!716760 () Bool)

(assert (=> b!1259817 (=> (not res!839609) (not e!716760))))

(assert (=> b!1259817 (= res!839609 (not (contains!7573 lt!570453 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!138361 () Bool)

(assert (=> d!138361 e!716760))

(declare-fun res!839610 () Bool)

(assert (=> d!138361 (=> (not res!839610) (not e!716760))))

(assert (=> d!138361 (= res!839610 (not (contains!7573 lt!570453 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138361 (= lt!570453 e!716759)))

(declare-fun c!122592 () Bool)

(assert (=> d!138361 (= c!122592 (bvsge #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(assert (=> d!138361 (validMask!0 mask!1466)))

(assert (=> d!138361 (= (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!570453)))

(declare-fun b!1259818 () Bool)

(declare-fun e!716755 () Bool)

(declare-fun e!716754 () Bool)

(assert (=> b!1259818 (= e!716755 e!716754)))

(assert (=> b!1259818 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(declare-fun res!839611 () Bool)

(assert (=> b!1259818 (= res!839611 (contains!7573 lt!570453 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1259818 (=> (not res!839611) (not e!716754))))

(declare-fun b!1259819 () Bool)

(declare-fun e!716756 () ListLongMap!18789)

(assert (=> b!1259819 (= e!716759 e!716756)))

(declare-fun c!122594 () Bool)

(assert (=> b!1259819 (= c!122594 (validKeyInArray!0 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun call!61914 () ListLongMap!18789)

(declare-fun bm!61911 () Bool)

(assert (=> bm!61911 (= call!61914 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1259820 () Bool)

(declare-fun lt!570456 () Unit!42003)

(declare-fun lt!570454 () Unit!42003)

(assert (=> b!1259820 (= lt!570456 lt!570454)))

(declare-fun lt!570455 () (_ BitVec 64))

(declare-fun lt!570451 () ListLongMap!18789)

(declare-fun lt!570452 () V!48337)

(declare-fun lt!570450 () (_ BitVec 64))

(assert (=> b!1259820 (not (contains!7573 (+!4214 lt!570451 (tuple2!20917 lt!570450 lt!570452)) lt!570455))))

(declare-fun addStillNotContains!320 (ListLongMap!18789 (_ BitVec 64) V!48337 (_ BitVec 64)) Unit!42003)

(assert (=> b!1259820 (= lt!570454 (addStillNotContains!320 lt!570451 lt!570450 lt!570452 lt!570455))))

(assert (=> b!1259820 (= lt!570455 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1259820 (= lt!570452 (get!20219 (select (arr!39594 _values!914) #b00000000000000000000000000000000) (dynLambda!3390 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1259820 (= lt!570450 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1259820 (= lt!570451 call!61914)))

(assert (=> b!1259820 (= e!716756 (+!4214 call!61914 (tuple2!20917 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000) (get!20219 (select (arr!39594 _values!914) #b00000000000000000000000000000000) (dynLambda!3390 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1259821 () Bool)

(assert (=> b!1259821 (= e!716755 e!716757)))

(declare-fun c!122595 () Bool)

(assert (=> b!1259821 (= c!122595 (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(declare-fun b!1259822 () Bool)

(assert (=> b!1259822 (= e!716760 e!716755)))

(declare-fun c!122593 () Bool)

(declare-fun e!716758 () Bool)

(assert (=> b!1259822 (= c!122593 e!716758)))

(declare-fun res!839608 () Bool)

(assert (=> b!1259822 (=> (not res!839608) (not e!716758))))

(assert (=> b!1259822 (= res!839608 (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(declare-fun b!1259823 () Bool)

(assert (=> b!1259823 (= e!716756 call!61914)))

(declare-fun b!1259824 () Bool)

(assert (=> b!1259824 (= e!716758 (validKeyInArray!0 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1259824 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1259825 () Bool)

(assert (=> b!1259825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(assert (=> b!1259825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40130 _values!914)))))

(assert (=> b!1259825 (= e!716754 (= (apply!992 lt!570453 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)) (get!20219 (select (arr!39594 _values!914) #b00000000000000000000000000000000) (dynLambda!3390 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1259826 () Bool)

(assert (=> b!1259826 (= e!716757 (= lt!570453 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(assert (= (and d!138361 c!122592) b!1259816))

(assert (= (and d!138361 (not c!122592)) b!1259819))

(assert (= (and b!1259819 c!122594) b!1259820))

(assert (= (and b!1259819 (not c!122594)) b!1259823))

(assert (= (or b!1259820 b!1259823) bm!61911))

(assert (= (and d!138361 res!839610) b!1259817))

(assert (= (and b!1259817 res!839609) b!1259822))

(assert (= (and b!1259822 res!839608) b!1259824))

(assert (= (and b!1259822 c!122593) b!1259818))

(assert (= (and b!1259822 (not c!122593)) b!1259821))

(assert (= (and b!1259818 res!839611) b!1259825))

(assert (= (and b!1259821 c!122595) b!1259826))

(assert (= (and b!1259821 (not c!122595)) b!1259815))

(declare-fun b_lambda!22747 () Bool)

(assert (=> (not b_lambda!22747) (not b!1259820)))

(assert (=> b!1259820 t!41619))

(declare-fun b_and!45219 () Bool)

(assert (= b_and!45217 (and (=> t!41619 result!23341) b_and!45219)))

(declare-fun b_lambda!22749 () Bool)

(assert (=> (not b_lambda!22749) (not b!1259825)))

(assert (=> b!1259825 t!41619))

(declare-fun b_and!45221 () Bool)

(assert (= b_and!45219 (and (=> t!41619 result!23341) b_and!45221)))

(declare-fun m!1160387 () Bool)

(assert (=> b!1259815 m!1160387))

(declare-fun m!1160389 () Bool)

(assert (=> bm!61911 m!1160389))

(assert (=> b!1259826 m!1160389))

(declare-fun m!1160391 () Bool)

(assert (=> d!138361 m!1160391))

(assert (=> d!138361 m!1160187))

(assert (=> b!1259820 m!1160313))

(assert (=> b!1259820 m!1160317))

(assert (=> b!1259820 m!1160319))

(assert (=> b!1259820 m!1160317))

(declare-fun m!1160393 () Bool)

(assert (=> b!1259820 m!1160393))

(declare-fun m!1160395 () Bool)

(assert (=> b!1259820 m!1160395))

(assert (=> b!1259820 m!1160273))

(declare-fun m!1160397 () Bool)

(assert (=> b!1259820 m!1160397))

(assert (=> b!1259820 m!1160313))

(declare-fun m!1160399 () Bool)

(assert (=> b!1259820 m!1160399))

(assert (=> b!1259820 m!1160393))

(assert (=> b!1259818 m!1160273))

(assert (=> b!1259818 m!1160273))

(declare-fun m!1160401 () Bool)

(assert (=> b!1259818 m!1160401))

(assert (=> b!1259825 m!1160313))

(assert (=> b!1259825 m!1160317))

(assert (=> b!1259825 m!1160319))

(assert (=> b!1259825 m!1160273))

(declare-fun m!1160403 () Bool)

(assert (=> b!1259825 m!1160403))

(assert (=> b!1259825 m!1160317))

(assert (=> b!1259825 m!1160273))

(assert (=> b!1259825 m!1160313))

(assert (=> b!1259824 m!1160273))

(assert (=> b!1259824 m!1160273))

(assert (=> b!1259824 m!1160275))

(declare-fun m!1160405 () Bool)

(assert (=> b!1259817 m!1160405))

(assert (=> b!1259819 m!1160273))

(assert (=> b!1259819 m!1160273))

(assert (=> b!1259819 m!1160275))

(assert (=> b!1259649 d!138361))

(declare-fun b!1259827 () Bool)

(declare-fun e!716764 () Bool)

(declare-fun lt!570460 () ListLongMap!18789)

(assert (=> b!1259827 (= e!716764 (isEmpty!1034 lt!570460))))

(declare-fun b!1259828 () Bool)

(declare-fun e!716766 () ListLongMap!18789)

(assert (=> b!1259828 (= e!716766 (ListLongMap!18790 Nil!28118))))

(declare-fun b!1259829 () Bool)

(declare-fun res!839613 () Bool)

(declare-fun e!716767 () Bool)

(assert (=> b!1259829 (=> (not res!839613) (not e!716767))))

(assert (=> b!1259829 (= res!839613 (not (contains!7573 lt!570460 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!138363 () Bool)

(assert (=> d!138363 e!716767))

(declare-fun res!839614 () Bool)

(assert (=> d!138363 (=> (not res!839614) (not e!716767))))

(assert (=> d!138363 (= res!839614 (not (contains!7573 lt!570460 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138363 (= lt!570460 e!716766)))

(declare-fun c!122596 () Bool)

(assert (=> d!138363 (= c!122596 (bvsge #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(assert (=> d!138363 (validMask!0 mask!1466)))

(assert (=> d!138363 (= (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!570460)))

(declare-fun b!1259830 () Bool)

(declare-fun e!716762 () Bool)

(declare-fun e!716761 () Bool)

(assert (=> b!1259830 (= e!716762 e!716761)))

(assert (=> b!1259830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(declare-fun res!839615 () Bool)

(assert (=> b!1259830 (= res!839615 (contains!7573 lt!570460 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1259830 (=> (not res!839615) (not e!716761))))

(declare-fun b!1259831 () Bool)

(declare-fun e!716763 () ListLongMap!18789)

(assert (=> b!1259831 (= e!716766 e!716763)))

(declare-fun c!122598 () Bool)

(assert (=> b!1259831 (= c!122598 (validKeyInArray!0 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun call!61915 () ListLongMap!18789)

(declare-fun bm!61912 () Bool)

(assert (=> bm!61912 (= call!61915 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1259832 () Bool)

(declare-fun lt!570463 () Unit!42003)

(declare-fun lt!570461 () Unit!42003)

(assert (=> b!1259832 (= lt!570463 lt!570461)))

(declare-fun lt!570457 () (_ BitVec 64))

(declare-fun lt!570459 () V!48337)

(declare-fun lt!570462 () (_ BitVec 64))

(declare-fun lt!570458 () ListLongMap!18789)

(assert (=> b!1259832 (not (contains!7573 (+!4214 lt!570458 (tuple2!20917 lt!570457 lt!570459)) lt!570462))))

(assert (=> b!1259832 (= lt!570461 (addStillNotContains!320 lt!570458 lt!570457 lt!570459 lt!570462))))

(assert (=> b!1259832 (= lt!570462 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1259832 (= lt!570459 (get!20219 (select (arr!39594 _values!914) #b00000000000000000000000000000000) (dynLambda!3390 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1259832 (= lt!570457 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1259832 (= lt!570458 call!61915)))

(assert (=> b!1259832 (= e!716763 (+!4214 call!61915 (tuple2!20917 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000) (get!20219 (select (arr!39594 _values!914) #b00000000000000000000000000000000) (dynLambda!3390 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1259833 () Bool)

(assert (=> b!1259833 (= e!716762 e!716764)))

(declare-fun c!122599 () Bool)

(assert (=> b!1259833 (= c!122599 (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(declare-fun b!1259834 () Bool)

(assert (=> b!1259834 (= e!716767 e!716762)))

(declare-fun c!122597 () Bool)

(declare-fun e!716765 () Bool)

(assert (=> b!1259834 (= c!122597 e!716765)))

(declare-fun res!839612 () Bool)

(assert (=> b!1259834 (=> (not res!839612) (not e!716765))))

(assert (=> b!1259834 (= res!839612 (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(declare-fun b!1259835 () Bool)

(assert (=> b!1259835 (= e!716763 call!61915)))

(declare-fun b!1259836 () Bool)

(assert (=> b!1259836 (= e!716765 (validKeyInArray!0 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1259836 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1259837 () Bool)

(assert (=> b!1259837 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(assert (=> b!1259837 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40130 _values!914)))))

(assert (=> b!1259837 (= e!716761 (= (apply!992 lt!570460 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)) (get!20219 (select (arr!39594 _values!914) #b00000000000000000000000000000000) (dynLambda!3390 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1259838 () Bool)

(assert (=> b!1259838 (= e!716764 (= lt!570460 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(assert (= (and d!138363 c!122596) b!1259828))

(assert (= (and d!138363 (not c!122596)) b!1259831))

(assert (= (and b!1259831 c!122598) b!1259832))

(assert (= (and b!1259831 (not c!122598)) b!1259835))

(assert (= (or b!1259832 b!1259835) bm!61912))

(assert (= (and d!138363 res!839614) b!1259829))

(assert (= (and b!1259829 res!839613) b!1259834))

(assert (= (and b!1259834 res!839612) b!1259836))

(assert (= (and b!1259834 c!122597) b!1259830))

(assert (= (and b!1259834 (not c!122597)) b!1259833))

(assert (= (and b!1259830 res!839615) b!1259837))

(assert (= (and b!1259833 c!122599) b!1259838))

(assert (= (and b!1259833 (not c!122599)) b!1259827))

(declare-fun b_lambda!22751 () Bool)

(assert (=> (not b_lambda!22751) (not b!1259832)))

(assert (=> b!1259832 t!41619))

(declare-fun b_and!45223 () Bool)

(assert (= b_and!45221 (and (=> t!41619 result!23341) b_and!45223)))

(declare-fun b_lambda!22753 () Bool)

(assert (=> (not b_lambda!22753) (not b!1259837)))

(assert (=> b!1259837 t!41619))

(declare-fun b_and!45225 () Bool)

(assert (= b_and!45223 (and (=> t!41619 result!23341) b_and!45225)))

(declare-fun m!1160407 () Bool)

(assert (=> b!1259827 m!1160407))

(declare-fun m!1160409 () Bool)

(assert (=> bm!61912 m!1160409))

(assert (=> b!1259838 m!1160409))

(declare-fun m!1160411 () Bool)

(assert (=> d!138363 m!1160411))

(assert (=> d!138363 m!1160187))

(assert (=> b!1259832 m!1160313))

(assert (=> b!1259832 m!1160317))

(assert (=> b!1259832 m!1160319))

(assert (=> b!1259832 m!1160317))

(declare-fun m!1160413 () Bool)

(assert (=> b!1259832 m!1160413))

(declare-fun m!1160415 () Bool)

(assert (=> b!1259832 m!1160415))

(assert (=> b!1259832 m!1160273))

(declare-fun m!1160417 () Bool)

(assert (=> b!1259832 m!1160417))

(assert (=> b!1259832 m!1160313))

(declare-fun m!1160419 () Bool)

(assert (=> b!1259832 m!1160419))

(assert (=> b!1259832 m!1160413))

(assert (=> b!1259830 m!1160273))

(assert (=> b!1259830 m!1160273))

(declare-fun m!1160421 () Bool)

(assert (=> b!1259830 m!1160421))

(assert (=> b!1259837 m!1160313))

(assert (=> b!1259837 m!1160317))

(assert (=> b!1259837 m!1160319))

(assert (=> b!1259837 m!1160273))

(declare-fun m!1160423 () Bool)

(assert (=> b!1259837 m!1160423))

(assert (=> b!1259837 m!1160317))

(assert (=> b!1259837 m!1160273))

(assert (=> b!1259837 m!1160313))

(assert (=> b!1259836 m!1160273))

(assert (=> b!1259836 m!1160273))

(assert (=> b!1259836 m!1160275))

(declare-fun m!1160425 () Bool)

(assert (=> b!1259829 m!1160425))

(assert (=> b!1259831 m!1160273))

(assert (=> b!1259831 m!1160273))

(assert (=> b!1259831 m!1160275))

(assert (=> b!1259649 d!138363))

(declare-fun d!138365 () Bool)

(assert (=> d!138365 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105742 d!138365))

(declare-fun d!138367 () Bool)

(assert (=> d!138367 (= (array_inv!30145 _keys!1118) (bvsge (size!40129 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105742 d!138367))

(declare-fun d!138369 () Bool)

(assert (=> d!138369 (= (array_inv!30146 _values!914) (bvsge (size!40130 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105742 d!138369))

(declare-fun b!1259847 () Bool)

(declare-fun e!716776 () Bool)

(declare-fun call!61918 () Bool)

(assert (=> b!1259847 (= e!716776 call!61918)))

(declare-fun b!1259848 () Bool)

(declare-fun e!716775 () Bool)

(assert (=> b!1259848 (= e!716775 e!716776)))

(declare-fun lt!570471 () (_ BitVec 64))

(assert (=> b!1259848 (= lt!570471 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570470 () Unit!42003)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82076 (_ BitVec 64) (_ BitVec 32)) Unit!42003)

(assert (=> b!1259848 (= lt!570470 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!570471 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82076 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1259848 (arrayContainsKey!0 _keys!1118 lt!570471 #b00000000000000000000000000000000)))

(declare-fun lt!570472 () Unit!42003)

(assert (=> b!1259848 (= lt!570472 lt!570470)))

(declare-fun res!839620 () Bool)

(declare-datatypes ((SeekEntryResult!9970 0))(
  ( (MissingZero!9970 (index!42251 (_ BitVec 32))) (Found!9970 (index!42252 (_ BitVec 32))) (Intermediate!9970 (undefined!10782 Bool) (index!42253 (_ BitVec 32)) (x!110977 (_ BitVec 32))) (Undefined!9970) (MissingVacant!9970 (index!42254 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82076 (_ BitVec 32)) SeekEntryResult!9970)

(assert (=> b!1259848 (= res!839620 (= (seekEntryOrOpen!0 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9970 #b00000000000000000000000000000000)))))

(assert (=> b!1259848 (=> (not res!839620) (not e!716776))))

(declare-fun b!1259849 () Bool)

(assert (=> b!1259849 (= e!716775 call!61918)))

(declare-fun d!138371 () Bool)

(declare-fun res!839621 () Bool)

(declare-fun e!716774 () Bool)

(assert (=> d!138371 (=> res!839621 e!716774)))

(assert (=> d!138371 (= res!839621 (bvsge #b00000000000000000000000000000000 (size!40129 _keys!1118)))))

(assert (=> d!138371 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!716774)))

(declare-fun bm!61915 () Bool)

(assert (=> bm!61915 (= call!61918 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1259850 () Bool)

(assert (=> b!1259850 (= e!716774 e!716775)))

(declare-fun c!122602 () Bool)

(assert (=> b!1259850 (= c!122602 (validKeyInArray!0 (select (arr!39593 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138371 (not res!839621)) b!1259850))

(assert (= (and b!1259850 c!122602) b!1259848))

(assert (= (and b!1259850 (not c!122602)) b!1259849))

(assert (= (and b!1259848 res!839620) b!1259847))

(assert (= (or b!1259847 b!1259849) bm!61915))

(assert (=> b!1259848 m!1160273))

(declare-fun m!1160427 () Bool)

(assert (=> b!1259848 m!1160427))

(declare-fun m!1160429 () Bool)

(assert (=> b!1259848 m!1160429))

(assert (=> b!1259848 m!1160273))

(declare-fun m!1160431 () Bool)

(assert (=> b!1259848 m!1160431))

(declare-fun m!1160433 () Bool)

(assert (=> bm!61915 m!1160433))

(assert (=> b!1259850 m!1160273))

(assert (=> b!1259850 m!1160273))

(assert (=> b!1259850 m!1160275))

(assert (=> b!1259645 d!138371))

(declare-fun b!1259858 () Bool)

(declare-fun e!716781 () Bool)

(assert (=> b!1259858 (= e!716781 tp_is_empty!32229)))

(declare-fun b!1259857 () Bool)

(declare-fun e!716782 () Bool)

(assert (=> b!1259857 (= e!716782 tp_is_empty!32229)))

(declare-fun mapNonEmpty!50146 () Bool)

(declare-fun mapRes!50146 () Bool)

(declare-fun tp!95516 () Bool)

(assert (=> mapNonEmpty!50146 (= mapRes!50146 (and tp!95516 e!716782))))

(declare-fun mapValue!50146 () ValueCell!15351)

(declare-fun mapRest!50146 () (Array (_ BitVec 32) ValueCell!15351))

(declare-fun mapKey!50146 () (_ BitVec 32))

(assert (=> mapNonEmpty!50146 (= mapRest!50140 (store mapRest!50146 mapKey!50146 mapValue!50146))))

(declare-fun condMapEmpty!50146 () Bool)

(declare-fun mapDefault!50146 () ValueCell!15351)

(assert (=> mapNonEmpty!50140 (= condMapEmpty!50146 (= mapRest!50140 ((as const (Array (_ BitVec 32) ValueCell!15351)) mapDefault!50146)))))

(assert (=> mapNonEmpty!50140 (= tp!95506 (and e!716781 mapRes!50146))))

(declare-fun mapIsEmpty!50146 () Bool)

(assert (=> mapIsEmpty!50146 mapRes!50146))

(assert (= (and mapNonEmpty!50140 condMapEmpty!50146) mapIsEmpty!50146))

(assert (= (and mapNonEmpty!50140 (not condMapEmpty!50146)) mapNonEmpty!50146))

(assert (= (and mapNonEmpty!50146 ((_ is ValueCellFull!15351) mapValue!50146)) b!1259857))

(assert (= (and mapNonEmpty!50140 ((_ is ValueCellFull!15351) mapDefault!50146)) b!1259858))

(declare-fun m!1160435 () Bool)

(assert (=> mapNonEmpty!50146 m!1160435))

(declare-fun b_lambda!22755 () Bool)

(assert (= b_lambda!22743 (or (and start!105742 b_free!27327) b_lambda!22755)))

(declare-fun b_lambda!22757 () Bool)

(assert (= b_lambda!22753 (or (and start!105742 b_free!27327) b_lambda!22757)))

(declare-fun b_lambda!22759 () Bool)

(assert (= b_lambda!22751 (or (and start!105742 b_free!27327) b_lambda!22759)))

(declare-fun b_lambda!22761 () Bool)

(assert (= b_lambda!22745 (or (and start!105742 b_free!27327) b_lambda!22761)))

(declare-fun b_lambda!22763 () Bool)

(assert (= b_lambda!22747 (or (and start!105742 b_free!27327) b_lambda!22763)))

(declare-fun b_lambda!22765 () Bool)

(assert (= b_lambda!22749 (or (and start!105742 b_free!27327) b_lambda!22765)))

(check-sat (not d!138353) (not b!1259737) (not b!1259684) (not b!1259790) (not bm!61898) (not b_lambda!22757) (not b!1259838) (not d!138355) (not b!1259817) (not b!1259819) (not d!138351) (not b!1259837) (not b!1259848) (not b!1259759) (not b!1259787) (not b!1259827) (not bm!61892) (not b_lambda!22763) (not b!1259775) (not bm!61905) (not bm!61912) (not bm!61915) (not b!1259815) (not b!1259735) (not b!1259769) (not d!138341) (not b!1259732) (not d!138345) (not b!1259836) (not b!1259734) (not b!1259825) (not b!1259831) (not b_lambda!22765) (not b!1259757) (not b!1259742) (not b_lambda!22761) (not mapNonEmpty!50146) (not b!1259820) (not b!1259754) (not bm!61896) (not b!1259686) (not b!1259762) (not bm!61903) (not b!1259824) (not bm!61901) (not b!1259850) (not d!138359) (not b_lambda!22755) (not bm!61908) (not b!1259830) (not b_next!27327) b_and!45225 (not d!138343) (not b!1259760) (not b!1259687) (not b!1259767) (not b!1259788) tp_is_empty!32229 (not d!138347) (not b!1259826) (not b!1259770) (not bm!61899) (not b!1259818) (not b!1259753) (not b!1259745) (not b!1259744) (not b_lambda!22759) (not bm!61911) (not b!1259832) (not bm!61894) (not b!1259750) (not b!1259685) (not d!138349) (not d!138363) (not d!138361) (not b!1259829))
(check-sat b_and!45225 (not b_next!27327))
