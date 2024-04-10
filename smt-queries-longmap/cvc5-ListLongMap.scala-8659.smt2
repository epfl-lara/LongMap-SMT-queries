; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105294 () Bool)

(assert start!105294)

(declare-fun b_free!26989 () Bool)

(declare-fun b_next!26989 () Bool)

(assert (=> start!105294 (= b_free!26989 (not b_next!26989))))

(declare-fun tp!94474 () Bool)

(declare-fun b_and!44815 () Bool)

(assert (=> start!105294 (= tp!94474 b_and!44815)))

(declare-fun b!1254679 () Bool)

(declare-fun e!712986 () Bool)

(declare-fun e!712991 () Bool)

(assert (=> b!1254679 (= e!712986 e!712991)))

(declare-fun res!836574 () Bool)

(assert (=> b!1254679 (=> res!836574 e!712991)))

(declare-datatypes ((V!47887 0))(
  ( (V!47888 (val!16008 Int)) )
))
(declare-datatypes ((tuple2!20674 0))(
  ( (tuple2!20675 (_1!10348 (_ BitVec 64)) (_2!10348 V!47887)) )
))
(declare-datatypes ((List!27900 0))(
  ( (Nil!27897) (Cons!27896 (h!29105 tuple2!20674) (t!41383 List!27900)) )
))
(declare-datatypes ((ListLongMap!18547 0))(
  ( (ListLongMap!18548 (toList!9289 List!27900)) )
))
(declare-fun lt!567161 () ListLongMap!18547)

(declare-fun lt!567159 () ListLongMap!18547)

(declare-fun -!2060 (ListLongMap!18547 (_ BitVec 64)) ListLongMap!18547)

(assert (=> b!1254679 (= res!836574 (not (= (-!2060 lt!567161 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567159)))))

(declare-fun lt!567162 () ListLongMap!18547)

(declare-fun lt!567165 () ListLongMap!18547)

(assert (=> b!1254679 (= (-!2060 lt!567162 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567165)))

(declare-datatypes ((Unit!41762 0))(
  ( (Unit!41763) )
))
(declare-fun lt!567164 () Unit!41762)

(declare-fun minValueBefore!43 () V!47887)

(declare-fun addThenRemoveForNewKeyIsSame!330 (ListLongMap!18547 (_ BitVec 64) V!47887) Unit!41762)

(assert (=> b!1254679 (= lt!567164 (addThenRemoveForNewKeyIsSame!330 lt!567165 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!567163 () ListLongMap!18547)

(assert (=> b!1254679 (and (= lt!567161 lt!567162) (= lt!567159 lt!567163))))

(declare-fun +!4183 (ListLongMap!18547 tuple2!20674) ListLongMap!18547)

(assert (=> b!1254679 (= lt!567162 (+!4183 lt!567165 (tuple2!20675 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47887)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47887)

(declare-datatypes ((array!81436 0))(
  ( (array!81437 (arr!39279 (Array (_ BitVec 32) (_ BitVec 64))) (size!39815 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81436)

(declare-datatypes ((ValueCell!15182 0))(
  ( (ValueCellFull!15182 (v!18707 V!47887)) (EmptyCell!15182) )
))
(declare-datatypes ((array!81438 0))(
  ( (array!81439 (arr!39280 (Array (_ BitVec 32) ValueCell!15182)) (size!39816 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81438)

(declare-fun getCurrentListMap!4531 (array!81436 array!81438 (_ BitVec 32) (_ BitVec 32) V!47887 V!47887 (_ BitVec 32) Int) ListLongMap!18547)

(assert (=> b!1254679 (= lt!567159 (getCurrentListMap!4531 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254679 (= lt!567161 (getCurrentListMap!4531 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254680 () Bool)

(declare-fun e!712990 () Bool)

(assert (=> b!1254680 (= e!712990 (not e!712986))))

(declare-fun res!836572 () Bool)

(assert (=> b!1254680 (=> res!836572 e!712986)))

(assert (=> b!1254680 (= res!836572 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254680 (= lt!567165 lt!567163)))

(declare-fun lt!567160 () Unit!41762)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1039 (array!81436 array!81438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47887 V!47887 V!47887 V!47887 (_ BitVec 32) Int) Unit!41762)

(assert (=> b!1254680 (= lt!567160 (lemmaNoChangeToArrayThenSameMapNoExtras!1039 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5675 (array!81436 array!81438 (_ BitVec 32) (_ BitVec 32) V!47887 V!47887 (_ BitVec 32) Int) ListLongMap!18547)

(assert (=> b!1254680 (= lt!567163 (getCurrentListMapNoExtraKeys!5675 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254680 (= lt!567165 (getCurrentListMapNoExtraKeys!5675 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49615 () Bool)

(declare-fun mapRes!49615 () Bool)

(declare-fun tp!94475 () Bool)

(declare-fun e!712985 () Bool)

(assert (=> mapNonEmpty!49615 (= mapRes!49615 (and tp!94475 e!712985))))

(declare-fun mapRest!49615 () (Array (_ BitVec 32) ValueCell!15182))

(declare-fun mapKey!49615 () (_ BitVec 32))

(declare-fun mapValue!49615 () ValueCell!15182)

(assert (=> mapNonEmpty!49615 (= (arr!39280 _values!914) (store mapRest!49615 mapKey!49615 mapValue!49615))))

(declare-fun mapIsEmpty!49615 () Bool)

(assert (=> mapIsEmpty!49615 mapRes!49615))

(declare-fun b!1254681 () Bool)

(declare-fun e!712987 () Bool)

(declare-fun e!712988 () Bool)

(assert (=> b!1254681 (= e!712987 (and e!712988 mapRes!49615))))

(declare-fun condMapEmpty!49615 () Bool)

(declare-fun mapDefault!49615 () ValueCell!15182)

