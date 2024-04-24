; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105210 () Bool)

(assert start!105210)

(declare-fun b_free!26755 () Bool)

(declare-fun b_next!26755 () Bool)

(assert (=> start!105210 (= b_free!26755 (not b_next!26755))))

(declare-fun tp!93760 () Bool)

(declare-fun b_and!44543 () Bool)

(assert (=> start!105210 (= tp!93760 b_and!44543)))

(declare-fun b!1252647 () Bool)

(declare-fun e!711405 () Bool)

(declare-fun tp_is_empty!31657 () Bool)

(assert (=> b!1252647 (= e!711405 tp_is_empty!31657)))

(declare-fun b!1252648 () Bool)

(declare-fun e!711403 () Bool)

(declare-fun mapRes!49252 () Bool)

(assert (=> b!1252648 (= e!711403 (and e!711405 mapRes!49252))))

(declare-fun condMapEmpty!49252 () Bool)

(declare-datatypes ((V!47575 0))(
  ( (V!47576 (val!15891 Int)) )
))
(declare-datatypes ((ValueCell!15065 0))(
  ( (ValueCellFull!15065 (v!18584 V!47575)) (EmptyCell!15065) )
))
(declare-datatypes ((array!81027 0))(
  ( (array!81028 (arr!39074 (Array (_ BitVec 32) ValueCell!15065)) (size!39611 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81027)

(declare-fun mapDefault!49252 () ValueCell!15065)

(assert (=> b!1252648 (= condMapEmpty!49252 (= (arr!39074 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15065)) mapDefault!49252)))))

(declare-fun mapNonEmpty!49252 () Bool)

(declare-fun tp!93761 () Bool)

(declare-fun e!711404 () Bool)

(assert (=> mapNonEmpty!49252 (= mapRes!49252 (and tp!93761 e!711404))))

(declare-fun mapKey!49252 () (_ BitVec 32))

(declare-fun mapValue!49252 () ValueCell!15065)

(declare-fun mapRest!49252 () (Array (_ BitVec 32) ValueCell!15065))

(assert (=> mapNonEmpty!49252 (= (arr!39074 _values!914) (store mapRest!49252 mapKey!49252 mapValue!49252))))

(declare-fun b!1252649 () Bool)

(declare-fun e!711408 () Bool)

(assert (=> b!1252649 (= e!711408 true)))

(declare-datatypes ((tuple2!20514 0))(
  ( (tuple2!20515 (_1!10268 (_ BitVec 64)) (_2!10268 V!47575)) )
))
(declare-datatypes ((List!27760 0))(
  ( (Nil!27757) (Cons!27756 (h!28974 tuple2!20514) (t!41227 List!27760)) )
))
(declare-datatypes ((ListLongMap!18395 0))(
  ( (ListLongMap!18396 (toList!9213 List!27760)) )
))
(declare-fun lt!565253 () ListLongMap!18395)

(declare-fun -!1998 (ListLongMap!18395 (_ BitVec 64)) ListLongMap!18395)

(assert (=> b!1252649 (= (-!1998 lt!565253 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565253)))

(declare-datatypes ((Unit!41564 0))(
  ( (Unit!41565) )
))
(declare-fun lt!565255 () Unit!41564)

(declare-fun removeNotPresentStillSame!108 (ListLongMap!18395 (_ BitVec 64)) Unit!41564)

(assert (=> b!1252649 (= lt!565255 (removeNotPresentStillSame!108 lt!565253 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1252650 () Bool)

(assert (=> b!1252650 (= e!711404 tp_is_empty!31657)))

(declare-fun b!1252651 () Bool)

(declare-fun res!835150 () Bool)

(declare-fun e!711406 () Bool)

(assert (=> b!1252651 (=> (not res!835150) (not e!711406))))

(declare-datatypes ((array!81029 0))(
  ( (array!81030 (arr!39075 (Array (_ BitVec 32) (_ BitVec 64))) (size!39612 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81029)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81029 (_ BitVec 32)) Bool)

(assert (=> b!1252651 (= res!835150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252652 () Bool)

(declare-fun e!711409 () Bool)

(assert (=> b!1252652 (= e!711409 e!711408)))

(declare-fun res!835147 () Bool)

(assert (=> b!1252652 (=> res!835147 e!711408)))

(declare-fun contains!7536 (ListLongMap!18395 (_ BitVec 64)) Bool)

(assert (=> b!1252652 (= res!835147 (contains!7536 lt!565253 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47575)

(declare-fun minValueBefore!43 () V!47575)

(declare-fun getCurrentListMap!4472 (array!81029 array!81027 (_ BitVec 32) (_ BitVec 32) V!47575 V!47575 (_ BitVec 32) Int) ListLongMap!18395)

(assert (=> b!1252652 (= lt!565253 (getCurrentListMap!4472 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49252 () Bool)

(assert (=> mapIsEmpty!49252 mapRes!49252))

(declare-fun b!1252653 () Bool)

(declare-fun res!835148 () Bool)

(assert (=> b!1252653 (=> (not res!835148) (not e!711406))))

(declare-datatypes ((List!27761 0))(
  ( (Nil!27758) (Cons!27757 (h!28975 (_ BitVec 64)) (t!41228 List!27761)) )
))
(declare-fun arrayNoDuplicates!0 (array!81029 (_ BitVec 32) List!27761) Bool)

(assert (=> b!1252653 (= res!835148 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27758))))

(declare-fun res!835149 () Bool)

(assert (=> start!105210 (=> (not res!835149) (not e!711406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105210 (= res!835149 (validMask!0 mask!1466))))

(assert (=> start!105210 e!711406))

(assert (=> start!105210 true))

(assert (=> start!105210 tp!93760))

(assert (=> start!105210 tp_is_empty!31657))

(declare-fun array_inv!29919 (array!81029) Bool)

(assert (=> start!105210 (array_inv!29919 _keys!1118)))

(declare-fun array_inv!29920 (array!81027) Bool)

(assert (=> start!105210 (and (array_inv!29920 _values!914) e!711403)))

(declare-fun b!1252654 () Bool)

(assert (=> b!1252654 (= e!711406 (not e!711409))))

(declare-fun res!835151 () Bool)

(assert (=> b!1252654 (=> res!835151 e!711409)))

(assert (=> b!1252654 (= res!835151 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!565252 () ListLongMap!18395)

(declare-fun lt!565254 () ListLongMap!18395)

(assert (=> b!1252654 (= lt!565252 lt!565254)))

(declare-fun minValueAfter!43 () V!47575)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lt!565251 () Unit!41564)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!955 (array!81029 array!81027 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47575 V!47575 V!47575 V!47575 (_ BitVec 32) Int) Unit!41564)

(assert (=> b!1252654 (= lt!565251 (lemmaNoChangeToArrayThenSameMapNoExtras!955 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5641 (array!81029 array!81027 (_ BitVec 32) (_ BitVec 32) V!47575 V!47575 (_ BitVec 32) Int) ListLongMap!18395)

(assert (=> b!1252654 (= lt!565254 (getCurrentListMapNoExtraKeys!5641 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252654 (= lt!565252 (getCurrentListMapNoExtraKeys!5641 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252655 () Bool)

(declare-fun res!835152 () Bool)

(assert (=> b!1252655 (=> (not res!835152) (not e!711406))))

(assert (=> b!1252655 (= res!835152 (and (= (size!39611 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39612 _keys!1118) (size!39611 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105210 res!835149) b!1252655))

(assert (= (and b!1252655 res!835152) b!1252651))

(assert (= (and b!1252651 res!835150) b!1252653))

(assert (= (and b!1252653 res!835148) b!1252654))

(assert (= (and b!1252654 (not res!835151)) b!1252652))

(assert (= (and b!1252652 (not res!835147)) b!1252649))

(assert (= (and b!1252648 condMapEmpty!49252) mapIsEmpty!49252))

(assert (= (and b!1252648 (not condMapEmpty!49252)) mapNonEmpty!49252))

(get-info :version)

(assert (= (and mapNonEmpty!49252 ((_ is ValueCellFull!15065) mapValue!49252)) b!1252650))

(assert (= (and b!1252648 ((_ is ValueCellFull!15065) mapDefault!49252)) b!1252647))

(assert (= start!105210 b!1252648))

(declare-fun m!1153725 () Bool)

(assert (=> b!1252654 m!1153725))

(declare-fun m!1153727 () Bool)

(assert (=> b!1252654 m!1153727))

(declare-fun m!1153729 () Bool)

(assert (=> b!1252654 m!1153729))

(declare-fun m!1153731 () Bool)

(assert (=> b!1252651 m!1153731))

(declare-fun m!1153733 () Bool)

(assert (=> b!1252652 m!1153733))

(declare-fun m!1153735 () Bool)

(assert (=> b!1252652 m!1153735))

(declare-fun m!1153737 () Bool)

(assert (=> start!105210 m!1153737))

(declare-fun m!1153739 () Bool)

(assert (=> start!105210 m!1153739))

(declare-fun m!1153741 () Bool)

(assert (=> start!105210 m!1153741))

(declare-fun m!1153743 () Bool)

(assert (=> mapNonEmpty!49252 m!1153743))

(declare-fun m!1153745 () Bool)

(assert (=> b!1252653 m!1153745))

(declare-fun m!1153747 () Bool)

(assert (=> b!1252649 m!1153747))

(declare-fun m!1153749 () Bool)

(assert (=> b!1252649 m!1153749))

(check-sat b_and!44543 (not b!1252649) tp_is_empty!31657 (not b!1252654) (not start!105210) (not b!1252652) (not b!1252653) (not mapNonEmpty!49252) (not b!1252651) (not b_next!26755))
(check-sat b_and!44543 (not b_next!26755))
