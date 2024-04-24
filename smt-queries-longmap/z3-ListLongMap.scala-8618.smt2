; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105198 () Bool)

(assert start!105198)

(declare-fun b_free!26743 () Bool)

(declare-fun b_next!26743 () Bool)

(assert (=> start!105198 (= b_free!26743 (not b_next!26743))))

(declare-fun tp!93725 () Bool)

(declare-fun b_and!44531 () Bool)

(assert (=> start!105198 (= tp!93725 b_and!44531)))

(declare-fun b!1252485 () Bool)

(declare-fun e!711280 () Bool)

(declare-fun e!711277 () Bool)

(assert (=> b!1252485 (= e!711280 (not e!711277))))

(declare-fun res!835041 () Bool)

(assert (=> b!1252485 (=> res!835041 e!711277)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252485 (= res!835041 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47559 0))(
  ( (V!47560 (val!15885 Int)) )
))
(declare-datatypes ((tuple2!20508 0))(
  ( (tuple2!20509 (_1!10265 (_ BitVec 64)) (_2!10265 V!47559)) )
))
(declare-datatypes ((List!27754 0))(
  ( (Nil!27751) (Cons!27750 (h!28968 tuple2!20508) (t!41221 List!27754)) )
))
(declare-datatypes ((ListLongMap!18389 0))(
  ( (ListLongMap!18390 (toList!9210 List!27754)) )
))
(declare-fun lt!565163 () ListLongMap!18389)

(declare-fun lt!565164 () ListLongMap!18389)

(assert (=> b!1252485 (= lt!565163 lt!565164)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47559)

(declare-datatypes ((Unit!41558 0))(
  ( (Unit!41559) )
))
(declare-fun lt!565161 () Unit!41558)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47559)

(declare-datatypes ((array!81005 0))(
  ( (array!81006 (arr!39063 (Array (_ BitVec 32) (_ BitVec 64))) (size!39600 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81005)

(declare-datatypes ((ValueCell!15059 0))(
  ( (ValueCellFull!15059 (v!18578 V!47559)) (EmptyCell!15059) )
))
(declare-datatypes ((array!81007 0))(
  ( (array!81008 (arr!39064 (Array (_ BitVec 32) ValueCell!15059)) (size!39601 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81007)

(declare-fun minValueBefore!43 () V!47559)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!952 (array!81005 array!81007 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47559 V!47559 V!47559 V!47559 (_ BitVec 32) Int) Unit!41558)

(assert (=> b!1252485 (= lt!565161 (lemmaNoChangeToArrayThenSameMapNoExtras!952 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5638 (array!81005 array!81007 (_ BitVec 32) (_ BitVec 32) V!47559 V!47559 (_ BitVec 32) Int) ListLongMap!18389)

(assert (=> b!1252485 (= lt!565164 (getCurrentListMapNoExtraKeys!5638 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252485 (= lt!565163 (getCurrentListMapNoExtraKeys!5638 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!835042 () Bool)

(assert (=> start!105198 (=> (not res!835042) (not e!711280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105198 (= res!835042 (validMask!0 mask!1466))))

(assert (=> start!105198 e!711280))

(assert (=> start!105198 true))

(assert (=> start!105198 tp!93725))

(declare-fun tp_is_empty!31645 () Bool)

(assert (=> start!105198 tp_is_empty!31645))

(declare-fun array_inv!29915 (array!81005) Bool)

(assert (=> start!105198 (array_inv!29915 _keys!1118)))

(declare-fun e!711283 () Bool)

(declare-fun array_inv!29916 (array!81007) Bool)

(assert (=> start!105198 (and (array_inv!29916 _values!914) e!711283)))

(declare-fun b!1252486 () Bool)

(declare-fun res!835039 () Bool)

(assert (=> b!1252486 (=> (not res!835039) (not e!711280))))

(assert (=> b!1252486 (= res!835039 (and (= (size!39601 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39600 _keys!1118) (size!39601 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252487 () Bool)

(declare-fun res!835043 () Bool)

(assert (=> b!1252487 (=> (not res!835043) (not e!711280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81005 (_ BitVec 32)) Bool)

(assert (=> b!1252487 (= res!835043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252488 () Bool)

(declare-fun res!835044 () Bool)

(assert (=> b!1252488 (=> (not res!835044) (not e!711280))))

(declare-datatypes ((List!27755 0))(
  ( (Nil!27752) (Cons!27751 (h!28969 (_ BitVec 64)) (t!41222 List!27755)) )
))
(declare-fun arrayNoDuplicates!0 (array!81005 (_ BitVec 32) List!27755) Bool)

(assert (=> b!1252488 (= res!835044 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27752))))

(declare-fun mapIsEmpty!49234 () Bool)

(declare-fun mapRes!49234 () Bool)

(assert (=> mapIsEmpty!49234 mapRes!49234))

(declare-fun b!1252489 () Bool)

(declare-fun e!711281 () Bool)

(assert (=> b!1252489 (= e!711283 (and e!711281 mapRes!49234))))

(declare-fun condMapEmpty!49234 () Bool)

(declare-fun mapDefault!49234 () ValueCell!15059)

(assert (=> b!1252489 (= condMapEmpty!49234 (= (arr!39064 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15059)) mapDefault!49234)))))

(declare-fun b!1252490 () Bool)

(declare-fun e!711279 () Bool)

(assert (=> b!1252490 (= e!711277 e!711279)))

(declare-fun res!835040 () Bool)

(assert (=> b!1252490 (=> res!835040 e!711279)))

(declare-fun lt!565162 () ListLongMap!18389)

(declare-fun contains!7534 (ListLongMap!18389 (_ BitVec 64)) Bool)

(assert (=> b!1252490 (= res!835040 (contains!7534 lt!565162 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4470 (array!81005 array!81007 (_ BitVec 32) (_ BitVec 32) V!47559 V!47559 (_ BitVec 32) Int) ListLongMap!18389)

(assert (=> b!1252490 (= lt!565162 (getCurrentListMap!4470 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252491 () Bool)

(declare-fun e!711282 () Bool)

(assert (=> b!1252491 (= e!711282 tp_is_empty!31645)))

(declare-fun mapNonEmpty!49234 () Bool)

(declare-fun tp!93724 () Bool)

(assert (=> mapNonEmpty!49234 (= mapRes!49234 (and tp!93724 e!711282))))

(declare-fun mapValue!49234 () ValueCell!15059)

(declare-fun mapRest!49234 () (Array (_ BitVec 32) ValueCell!15059))

(declare-fun mapKey!49234 () (_ BitVec 32))

(assert (=> mapNonEmpty!49234 (= (arr!39064 _values!914) (store mapRest!49234 mapKey!49234 mapValue!49234))))

(declare-fun b!1252492 () Bool)

(assert (=> b!1252492 (= e!711279 true)))

(declare-fun -!1996 (ListLongMap!18389 (_ BitVec 64)) ListLongMap!18389)

(assert (=> b!1252492 (= (-!1996 lt!565162 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565162)))

(declare-fun lt!565165 () Unit!41558)

(declare-fun removeNotPresentStillSame!106 (ListLongMap!18389 (_ BitVec 64)) Unit!41558)

(assert (=> b!1252492 (= lt!565165 (removeNotPresentStillSame!106 lt!565162 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1252493 () Bool)

(assert (=> b!1252493 (= e!711281 tp_is_empty!31645)))

(assert (= (and start!105198 res!835042) b!1252486))

(assert (= (and b!1252486 res!835039) b!1252487))

(assert (= (and b!1252487 res!835043) b!1252488))

(assert (= (and b!1252488 res!835044) b!1252485))

(assert (= (and b!1252485 (not res!835041)) b!1252490))

(assert (= (and b!1252490 (not res!835040)) b!1252492))

(assert (= (and b!1252489 condMapEmpty!49234) mapIsEmpty!49234))

(assert (= (and b!1252489 (not condMapEmpty!49234)) mapNonEmpty!49234))

(get-info :version)

(assert (= (and mapNonEmpty!49234 ((_ is ValueCellFull!15059) mapValue!49234)) b!1252491))

(assert (= (and b!1252489 ((_ is ValueCellFull!15059) mapDefault!49234)) b!1252493))

(assert (= start!105198 b!1252489))

(declare-fun m!1153569 () Bool)

(assert (=> start!105198 m!1153569))

(declare-fun m!1153571 () Bool)

(assert (=> start!105198 m!1153571))

(declare-fun m!1153573 () Bool)

(assert (=> start!105198 m!1153573))

(declare-fun m!1153575 () Bool)

(assert (=> b!1252490 m!1153575))

(declare-fun m!1153577 () Bool)

(assert (=> b!1252490 m!1153577))

(declare-fun m!1153579 () Bool)

(assert (=> mapNonEmpty!49234 m!1153579))

(declare-fun m!1153581 () Bool)

(assert (=> b!1252487 m!1153581))

(declare-fun m!1153583 () Bool)

(assert (=> b!1252488 m!1153583))

(declare-fun m!1153585 () Bool)

(assert (=> b!1252485 m!1153585))

(declare-fun m!1153587 () Bool)

(assert (=> b!1252485 m!1153587))

(declare-fun m!1153589 () Bool)

(assert (=> b!1252485 m!1153589))

(declare-fun m!1153591 () Bool)

(assert (=> b!1252492 m!1153591))

(declare-fun m!1153593 () Bool)

(assert (=> b!1252492 m!1153593))

(check-sat (not b!1252488) (not b!1252492) (not start!105198) b_and!44531 (not b!1252490) (not b!1252487) (not b_next!26743) tp_is_empty!31645 (not mapNonEmpty!49234) (not b!1252485))
(check-sat b_and!44531 (not b_next!26743))
