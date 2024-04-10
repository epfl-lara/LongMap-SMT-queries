; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105112 () Bool)

(assert start!105112)

(declare-fun b_free!26845 () Bool)

(declare-fun b_next!26845 () Bool)

(assert (=> start!105112 (= b_free!26845 (not b_next!26845))))

(declare-fun tp!94037 () Bool)

(declare-fun b_and!44649 () Bool)

(assert (=> start!105112 (= tp!94037 b_and!44649)))

(declare-fun mapNonEmpty!49393 () Bool)

(declare-fun mapRes!49393 () Bool)

(declare-fun tp!94036 () Bool)

(declare-fun e!711466 () Bool)

(assert (=> mapNonEmpty!49393 (= mapRes!49393 (and tp!94036 e!711466))))

(declare-datatypes ((V!47695 0))(
  ( (V!47696 (val!15936 Int)) )
))
(declare-datatypes ((ValueCell!15110 0))(
  ( (ValueCellFull!15110 (v!18634 V!47695)) (EmptyCell!15110) )
))
(declare-fun mapRest!49393 () (Array (_ BitVec 32) ValueCell!15110))

(declare-fun mapKey!49393 () (_ BitVec 32))

(declare-fun mapValue!49393 () ValueCell!15110)

(declare-datatypes ((array!81156 0))(
  ( (array!81157 (arr!39141 (Array (_ BitVec 32) ValueCell!15110)) (size!39677 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81156)

(assert (=> mapNonEmpty!49393 (= (arr!39141 _values!914) (store mapRest!49393 mapKey!49393 mapValue!49393))))

(declare-fun b!1252608 () Bool)

(declare-fun tp_is_empty!31747 () Bool)

(assert (=> b!1252608 (= e!711466 tp_is_empty!31747)))

(declare-fun mapIsEmpty!49393 () Bool)

(assert (=> mapIsEmpty!49393 mapRes!49393))

(declare-fun b!1252609 () Bool)

(declare-fun e!711469 () Bool)

(declare-fun e!711468 () Bool)

(assert (=> b!1252609 (= e!711469 (not e!711468))))

(declare-fun res!835342 () Bool)

(assert (=> b!1252609 (=> res!835342 e!711468)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252609 (= res!835342 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20556 0))(
  ( (tuple2!20557 (_1!10289 (_ BitVec 64)) (_2!10289 V!47695)) )
))
(declare-datatypes ((List!27790 0))(
  ( (Nil!27787) (Cons!27786 (h!28995 tuple2!20556) (t!41269 List!27790)) )
))
(declare-datatypes ((ListLongMap!18429 0))(
  ( (ListLongMap!18430 (toList!9230 List!27790)) )
))
(declare-fun lt!565415 () ListLongMap!18429)

(declare-fun lt!565417 () ListLongMap!18429)

(assert (=> b!1252609 (= lt!565415 lt!565417)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun minValueAfter!43 () V!47695)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47695)

(declare-datatypes ((array!81158 0))(
  ( (array!81159 (arr!39142 (Array (_ BitVec 32) (_ BitVec 64))) (size!39678 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81158)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueBefore!43 () V!47695)

(declare-datatypes ((Unit!41649 0))(
  ( (Unit!41650) )
))
(declare-fun lt!565418 () Unit!41649)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!990 (array!81158 array!81156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47695 V!47695 V!47695 V!47695 (_ BitVec 32) Int) Unit!41649)

(assert (=> b!1252609 (= lt!565418 (lemmaNoChangeToArrayThenSameMapNoExtras!990 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5626 (array!81158 array!81156 (_ BitVec 32) (_ BitVec 32) V!47695 V!47695 (_ BitVec 32) Int) ListLongMap!18429)

(assert (=> b!1252609 (= lt!565417 (getCurrentListMapNoExtraKeys!5626 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252609 (= lt!565415 (getCurrentListMapNoExtraKeys!5626 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252610 () Bool)

(declare-fun res!835339 () Bool)

(assert (=> b!1252610 (=> (not res!835339) (not e!711469))))

(assert (=> b!1252610 (= res!835339 (and (= (size!39677 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39678 _keys!1118) (size!39677 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252611 () Bool)

(assert (=> b!1252611 (= e!711468 true)))

(declare-fun lt!565416 () ListLongMap!18429)

(declare-fun getCurrentListMap!4478 (array!81158 array!81156 (_ BitVec 32) (_ BitVec 32) V!47695 V!47695 (_ BitVec 32) Int) ListLongMap!18429)

(assert (=> b!1252611 (= lt!565416 (getCurrentListMap!4478 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252612 () Bool)

(declare-fun res!835338 () Bool)

(assert (=> b!1252612 (=> (not res!835338) (not e!711469))))

(declare-datatypes ((List!27791 0))(
  ( (Nil!27788) (Cons!27787 (h!28996 (_ BitVec 64)) (t!41270 List!27791)) )
))
(declare-fun arrayNoDuplicates!0 (array!81158 (_ BitVec 32) List!27791) Bool)

(assert (=> b!1252612 (= res!835338 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27788))))

(declare-fun res!835340 () Bool)

(assert (=> start!105112 (=> (not res!835340) (not e!711469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105112 (= res!835340 (validMask!0 mask!1466))))

(assert (=> start!105112 e!711469))

(assert (=> start!105112 true))

(assert (=> start!105112 tp!94037))

(assert (=> start!105112 tp_is_empty!31747))

(declare-fun array_inv!29851 (array!81158) Bool)

(assert (=> start!105112 (array_inv!29851 _keys!1118)))

(declare-fun e!711465 () Bool)

(declare-fun array_inv!29852 (array!81156) Bool)

(assert (=> start!105112 (and (array_inv!29852 _values!914) e!711465)))

(declare-fun b!1252613 () Bool)

(declare-fun res!835341 () Bool)

(assert (=> b!1252613 (=> (not res!835341) (not e!711469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81158 (_ BitVec 32)) Bool)

(assert (=> b!1252613 (= res!835341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252614 () Bool)

(declare-fun e!711467 () Bool)

(assert (=> b!1252614 (= e!711465 (and e!711467 mapRes!49393))))

(declare-fun condMapEmpty!49393 () Bool)

(declare-fun mapDefault!49393 () ValueCell!15110)

