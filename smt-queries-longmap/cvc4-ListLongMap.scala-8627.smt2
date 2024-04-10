; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105054 () Bool)

(assert start!105054)

(declare-fun b_free!26801 () Bool)

(declare-fun b_next!26801 () Bool)

(assert (=> start!105054 (= b_free!26801 (not b_next!26801))))

(declare-fun tp!93902 () Bool)

(declare-fun b_and!44597 () Bool)

(assert (=> start!105054 (= tp!93902 b_and!44597)))

(declare-fun b!1252032 () Bool)

(declare-fun res!835017 () Bool)

(declare-fun e!711052 () Bool)

(assert (=> b!1252032 (=> (not res!835017) (not e!711052))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81070 0))(
  ( (array!81071 (arr!39099 (Array (_ BitVec 32) (_ BitVec 64))) (size!39635 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81070)

(declare-datatypes ((V!47635 0))(
  ( (V!47636 (val!15914 Int)) )
))
(declare-datatypes ((ValueCell!15088 0))(
  ( (ValueCellFull!15088 (v!18612 V!47635)) (EmptyCell!15088) )
))
(declare-datatypes ((array!81072 0))(
  ( (array!81073 (arr!39100 (Array (_ BitVec 32) ValueCell!15088)) (size!39636 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81072)

(assert (=> b!1252032 (= res!835017 (and (= (size!39636 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39635 _keys!1118) (size!39636 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252033 () Bool)

(declare-fun res!835016 () Bool)

(assert (=> b!1252033 (=> (not res!835016) (not e!711052))))

(declare-datatypes ((List!27758 0))(
  ( (Nil!27755) (Cons!27754 (h!28963 (_ BitVec 64)) (t!41235 List!27758)) )
))
(declare-fun arrayNoDuplicates!0 (array!81070 (_ BitVec 32) List!27758) Bool)

(assert (=> b!1252033 (= res!835016 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27755))))

(declare-fun res!835014 () Bool)

(assert (=> start!105054 (=> (not res!835014) (not e!711052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105054 (= res!835014 (validMask!0 mask!1466))))

(assert (=> start!105054 e!711052))

(assert (=> start!105054 true))

(assert (=> start!105054 tp!93902))

(declare-fun tp_is_empty!31703 () Bool)

(assert (=> start!105054 tp_is_empty!31703))

(declare-fun array_inv!29823 (array!81070) Bool)

(assert (=> start!105054 (array_inv!29823 _keys!1118)))

(declare-fun e!711053 () Bool)

(declare-fun array_inv!29824 (array!81072) Bool)

(assert (=> start!105054 (and (array_inv!29824 _values!914) e!711053)))

(declare-fun mapNonEmpty!49324 () Bool)

(declare-fun mapRes!49324 () Bool)

(declare-fun tp!93901 () Bool)

(declare-fun e!711055 () Bool)

(assert (=> mapNonEmpty!49324 (= mapRes!49324 (and tp!93901 e!711055))))

(declare-fun mapValue!49324 () ValueCell!15088)

(declare-fun mapRest!49324 () (Array (_ BitVec 32) ValueCell!15088))

(declare-fun mapKey!49324 () (_ BitVec 32))

(assert (=> mapNonEmpty!49324 (= (arr!39100 _values!914) (store mapRest!49324 mapKey!49324 mapValue!49324))))

(declare-fun b!1252034 () Bool)

(declare-fun e!711051 () Bool)

(assert (=> b!1252034 (= e!711051 tp_is_empty!31703)))

(declare-fun b!1252035 () Bool)

(assert (=> b!1252035 (= e!711055 tp_is_empty!31703)))

(declare-fun b!1252036 () Bool)

(declare-fun res!835015 () Bool)

(assert (=> b!1252036 (=> (not res!835015) (not e!711052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81070 (_ BitVec 32)) Bool)

(assert (=> b!1252036 (= res!835015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252037 () Bool)

(assert (=> b!1252037 (= e!711052 (not true))))

(declare-datatypes ((tuple2!20526 0))(
  ( (tuple2!20527 (_1!10274 (_ BitVec 64)) (_2!10274 V!47635)) )
))
(declare-datatypes ((List!27759 0))(
  ( (Nil!27756) (Cons!27755 (h!28964 tuple2!20526) (t!41236 List!27759)) )
))
(declare-datatypes ((ListLongMap!18399 0))(
  ( (ListLongMap!18400 (toList!9215 List!27759)) )
))
(declare-fun lt!565148 () ListLongMap!18399)

(declare-fun lt!565150 () ListLongMap!18399)

(assert (=> b!1252037 (= lt!565148 lt!565150)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47635)

(declare-fun zeroValue!871 () V!47635)

(declare-datatypes ((Unit!41619 0))(
  ( (Unit!41620) )
))
(declare-fun lt!565149 () Unit!41619)

(declare-fun minValueBefore!43 () V!47635)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!975 (array!81070 array!81072 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47635 V!47635 V!47635 V!47635 (_ BitVec 32) Int) Unit!41619)

(assert (=> b!1252037 (= lt!565149 (lemmaNoChangeToArrayThenSameMapNoExtras!975 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5611 (array!81070 array!81072 (_ BitVec 32) (_ BitVec 32) V!47635 V!47635 (_ BitVec 32) Int) ListLongMap!18399)

(assert (=> b!1252037 (= lt!565150 (getCurrentListMapNoExtraKeys!5611 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252037 (= lt!565148 (getCurrentListMapNoExtraKeys!5611 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49324 () Bool)

(assert (=> mapIsEmpty!49324 mapRes!49324))

(declare-fun b!1252038 () Bool)

(assert (=> b!1252038 (= e!711053 (and e!711051 mapRes!49324))))

(declare-fun condMapEmpty!49324 () Bool)

(declare-fun mapDefault!49324 () ValueCell!15088)

