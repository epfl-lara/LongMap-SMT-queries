; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105096 () Bool)

(assert start!105096)

(declare-fun b_free!26829 () Bool)

(declare-fun b_next!26829 () Bool)

(assert (=> start!105096 (= b_free!26829 (not b_next!26829))))

(declare-fun tp!93988 () Bool)

(declare-fun b_and!44633 () Bool)

(assert (=> start!105096 (= tp!93988 b_and!44633)))

(declare-fun b!1252416 () Bool)

(declare-fun e!711323 () Bool)

(declare-fun tp_is_empty!31731 () Bool)

(assert (=> b!1252416 (= e!711323 tp_is_empty!31731)))

(declare-fun mapNonEmpty!49369 () Bool)

(declare-fun mapRes!49369 () Bool)

(declare-fun tp!93989 () Bool)

(assert (=> mapNonEmpty!49369 (= mapRes!49369 (and tp!93989 e!711323))))

(declare-datatypes ((V!47673 0))(
  ( (V!47674 (val!15928 Int)) )
))
(declare-datatypes ((ValueCell!15102 0))(
  ( (ValueCellFull!15102 (v!18626 V!47673)) (EmptyCell!15102) )
))
(declare-fun mapValue!49369 () ValueCell!15102)

(declare-datatypes ((array!81124 0))(
  ( (array!81125 (arr!39125 (Array (_ BitVec 32) ValueCell!15102)) (size!39661 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81124)

(declare-fun mapKey!49369 () (_ BitVec 32))

(declare-fun mapRest!49369 () (Array (_ BitVec 32) ValueCell!15102))

(assert (=> mapNonEmpty!49369 (= (arr!39125 _values!914) (store mapRest!49369 mapKey!49369 mapValue!49369))))

(declare-fun b!1252417 () Bool)

(declare-fun e!711324 () Bool)

(assert (=> b!1252417 (= e!711324 true)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47673)

(declare-datatypes ((array!81126 0))(
  ( (array!81127 (arr!39126 (Array (_ BitVec 32) (_ BitVec 64))) (size!39662 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81126)

(declare-fun minValueBefore!43 () V!47673)

(declare-datatypes ((tuple2!20544 0))(
  ( (tuple2!20545 (_1!10283 (_ BitVec 64)) (_2!10283 V!47673)) )
))
(declare-datatypes ((List!27776 0))(
  ( (Nil!27773) (Cons!27772 (h!28981 tuple2!20544) (t!41255 List!27776)) )
))
(declare-datatypes ((ListLongMap!18417 0))(
  ( (ListLongMap!18418 (toList!9224 List!27776)) )
))
(declare-fun lt!565322 () ListLongMap!18417)

(declare-fun getCurrentListMap!4472 (array!81126 array!81124 (_ BitVec 32) (_ BitVec 32) V!47673 V!47673 (_ BitVec 32) Int) ListLongMap!18417)

(assert (=> b!1252417 (= lt!565322 (getCurrentListMap!4472 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252419 () Bool)

(declare-fun res!835218 () Bool)

(declare-fun e!711325 () Bool)

(assert (=> b!1252419 (=> (not res!835218) (not e!711325))))

(declare-datatypes ((List!27777 0))(
  ( (Nil!27774) (Cons!27773 (h!28982 (_ BitVec 64)) (t!41256 List!27777)) )
))
(declare-fun arrayNoDuplicates!0 (array!81126 (_ BitVec 32) List!27777) Bool)

(assert (=> b!1252419 (= res!835218 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27774))))

(declare-fun b!1252420 () Bool)

(assert (=> b!1252420 (= e!711325 (not e!711324))))

(declare-fun res!835219 () Bool)

(assert (=> b!1252420 (=> res!835219 e!711324)))

(assert (=> b!1252420 (= res!835219 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!565319 () ListLongMap!18417)

(declare-fun lt!565321 () ListLongMap!18417)

(assert (=> b!1252420 (= lt!565319 lt!565321)))

(declare-datatypes ((Unit!41637 0))(
  ( (Unit!41638) )
))
(declare-fun lt!565320 () Unit!41637)

(declare-fun minValueAfter!43 () V!47673)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!984 (array!81126 array!81124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47673 V!47673 V!47673 V!47673 (_ BitVec 32) Int) Unit!41637)

(assert (=> b!1252420 (= lt!565320 (lemmaNoChangeToArrayThenSameMapNoExtras!984 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5620 (array!81126 array!81124 (_ BitVec 32) (_ BitVec 32) V!47673 V!47673 (_ BitVec 32) Int) ListLongMap!18417)

(assert (=> b!1252420 (= lt!565321 (getCurrentListMapNoExtraKeys!5620 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252420 (= lt!565319 (getCurrentListMapNoExtraKeys!5620 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252418 () Bool)

(declare-fun e!711322 () Bool)

(assert (=> b!1252418 (= e!711322 tp_is_empty!31731)))

(declare-fun res!835220 () Bool)

(assert (=> start!105096 (=> (not res!835220) (not e!711325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105096 (= res!835220 (validMask!0 mask!1466))))

(assert (=> start!105096 e!711325))

(assert (=> start!105096 true))

(assert (=> start!105096 tp!93988))

(assert (=> start!105096 tp_is_empty!31731))

(declare-fun array_inv!29841 (array!81126) Bool)

(assert (=> start!105096 (array_inv!29841 _keys!1118)))

(declare-fun e!711326 () Bool)

(declare-fun array_inv!29842 (array!81124) Bool)

(assert (=> start!105096 (and (array_inv!29842 _values!914) e!711326)))

(declare-fun b!1252421 () Bool)

(declare-fun res!835222 () Bool)

(assert (=> b!1252421 (=> (not res!835222) (not e!711325))))

(assert (=> b!1252421 (= res!835222 (and (= (size!39661 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39662 _keys!1118) (size!39661 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49369 () Bool)

(assert (=> mapIsEmpty!49369 mapRes!49369))

(declare-fun b!1252422 () Bool)

(assert (=> b!1252422 (= e!711326 (and e!711322 mapRes!49369))))

(declare-fun condMapEmpty!49369 () Bool)

(declare-fun mapDefault!49369 () ValueCell!15102)

(assert (=> b!1252422 (= condMapEmpty!49369 (= (arr!39125 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15102)) mapDefault!49369)))))

(declare-fun b!1252423 () Bool)

(declare-fun res!835221 () Bool)

(assert (=> b!1252423 (=> (not res!835221) (not e!711325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81126 (_ BitVec 32)) Bool)

(assert (=> b!1252423 (= res!835221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105096 res!835220) b!1252421))

(assert (= (and b!1252421 res!835222) b!1252423))

(assert (= (and b!1252423 res!835221) b!1252419))

(assert (= (and b!1252419 res!835218) b!1252420))

(assert (= (and b!1252420 (not res!835219)) b!1252417))

(assert (= (and b!1252422 condMapEmpty!49369) mapIsEmpty!49369))

(assert (= (and b!1252422 (not condMapEmpty!49369)) mapNonEmpty!49369))

(get-info :version)

(assert (= (and mapNonEmpty!49369 ((_ is ValueCellFull!15102) mapValue!49369)) b!1252416))

(assert (= (and b!1252422 ((_ is ValueCellFull!15102) mapDefault!49369)) b!1252418))

(assert (= start!105096 b!1252422))

(declare-fun m!1153045 () Bool)

(assert (=> b!1252417 m!1153045))

(declare-fun m!1153047 () Bool)

(assert (=> b!1252420 m!1153047))

(declare-fun m!1153049 () Bool)

(assert (=> b!1252420 m!1153049))

(declare-fun m!1153051 () Bool)

(assert (=> b!1252420 m!1153051))

(declare-fun m!1153053 () Bool)

(assert (=> b!1252419 m!1153053))

(declare-fun m!1153055 () Bool)

(assert (=> start!105096 m!1153055))

(declare-fun m!1153057 () Bool)

(assert (=> start!105096 m!1153057))

(declare-fun m!1153059 () Bool)

(assert (=> start!105096 m!1153059))

(declare-fun m!1153061 () Bool)

(assert (=> b!1252423 m!1153061))

(declare-fun m!1153063 () Bool)

(assert (=> mapNonEmpty!49369 m!1153063))

(check-sat tp_is_empty!31731 (not b!1252423) (not b_next!26829) (not b!1252419) (not b!1252417) b_and!44633 (not start!105096) (not mapNonEmpty!49369) (not b!1252420))
(check-sat b_and!44633 (not b_next!26829))
