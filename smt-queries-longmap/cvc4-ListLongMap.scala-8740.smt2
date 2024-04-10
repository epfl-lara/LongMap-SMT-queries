; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106008 () Bool)

(assert start!106008)

(declare-fun b_free!27479 () Bool)

(declare-fun b_next!27479 () Bool)

(assert (=> start!106008 (= b_free!27479 (not b_next!27479))))

(declare-fun tp!95981 () Bool)

(declare-fun b_and!45429 () Bool)

(assert (=> start!106008 (= tp!95981 b_and!45429)))

(declare-fun b!1262432 () Bool)

(declare-fun e!718630 () Bool)

(declare-fun tp_is_empty!32381 () Bool)

(assert (=> b!1262432 (= e!718630 tp_is_empty!32381)))

(declare-fun mapNonEmpty!50386 () Bool)

(declare-fun mapRes!50386 () Bool)

(declare-fun tp!95980 () Bool)

(assert (=> mapNonEmpty!50386 (= mapRes!50386 (and tp!95980 e!718630))))

(declare-fun mapKey!50386 () (_ BitVec 32))

(declare-datatypes ((V!48539 0))(
  ( (V!48540 (val!16253 Int)) )
))
(declare-datatypes ((ValueCell!15427 0))(
  ( (ValueCellFull!15427 (v!18960 V!48539)) (EmptyCell!15427) )
))
(declare-fun mapValue!50386 () ValueCell!15427)

(declare-fun mapRest!50386 () (Array (_ BitVec 32) ValueCell!15427))

(declare-datatypes ((array!82378 0))(
  ( (array!82379 (arr!39738 (Array (_ BitVec 32) ValueCell!15427)) (size!40274 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82378)

(assert (=> mapNonEmpty!50386 (= (arr!39738 _values!914) (store mapRest!50386 mapKey!50386 mapValue!50386))))

(declare-fun mapIsEmpty!50386 () Bool)

(assert (=> mapIsEmpty!50386 mapRes!50386))

(declare-fun b!1262433 () Bool)

(declare-fun e!718624 () Bool)

(declare-fun e!718626 () Bool)

(assert (=> b!1262433 (= e!718624 (not e!718626))))

(declare-fun res!841064 () Bool)

(assert (=> b!1262433 (=> res!841064 e!718626)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1262433 (= res!841064 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!718627 () Bool)

(assert (=> b!1262433 e!718627))

(declare-fun res!841067 () Bool)

(assert (=> b!1262433 (=> (not res!841067) (not e!718627))))

(declare-datatypes ((tuple2!21034 0))(
  ( (tuple2!21035 (_1!10528 (_ BitVec 64)) (_2!10528 V!48539)) )
))
(declare-datatypes ((List!28228 0))(
  ( (Nil!28225) (Cons!28224 (h!29433 tuple2!21034) (t!41735 List!28228)) )
))
(declare-datatypes ((ListLongMap!18907 0))(
  ( (ListLongMap!18908 (toList!9469 List!28228)) )
))
(declare-fun lt!572237 () ListLongMap!18907)

(declare-fun lt!572236 () ListLongMap!18907)

(assert (=> b!1262433 (= res!841067 (= lt!572237 lt!572236))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48539)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48539)

(declare-datatypes ((array!82380 0))(
  ( (array!82381 (arr!39739 (Array (_ BitVec 32) (_ BitVec 64))) (size!40275 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82380)

(declare-datatypes ((Unit!42082 0))(
  ( (Unit!42083) )
))
(declare-fun lt!572238 () Unit!42082)

(declare-fun minValueBefore!43 () V!48539)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1177 (array!82380 array!82378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48539 V!48539 V!48539 V!48539 (_ BitVec 32) Int) Unit!42082)

(assert (=> b!1262433 (= lt!572238 (lemmaNoChangeToArrayThenSameMapNoExtras!1177 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5835 (array!82380 array!82378 (_ BitVec 32) (_ BitVec 32) V!48539 V!48539 (_ BitVec 32) Int) ListLongMap!18907)

(assert (=> b!1262433 (= lt!572236 (getCurrentListMapNoExtraKeys!5835 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262433 (= lt!572237 (getCurrentListMapNoExtraKeys!5835 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262435 () Bool)

(declare-fun getCurrentListMap!4638 (array!82380 array!82378 (_ BitVec 32) (_ BitVec 32) V!48539 V!48539 (_ BitVec 32) Int) ListLongMap!18907)

(assert (=> b!1262435 (= e!718626 (= (getCurrentListMap!4638 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572236))))

(declare-fun b!1262436 () Bool)

(declare-fun e!718628 () Bool)

(assert (=> b!1262436 (= e!718627 e!718628)))

(declare-fun res!841061 () Bool)

(assert (=> b!1262436 (=> res!841061 e!718628)))

(assert (=> b!1262436 (= res!841061 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262437 () Bool)

(declare-fun e!718631 () Bool)

(assert (=> b!1262437 (= e!718631 tp_is_empty!32381)))

(declare-fun b!1262438 () Bool)

(declare-fun res!841062 () Bool)

(assert (=> b!1262438 (=> (not res!841062) (not e!718624))))

(declare-datatypes ((List!28229 0))(
  ( (Nil!28226) (Cons!28225 (h!29434 (_ BitVec 64)) (t!41736 List!28229)) )
))
(declare-fun arrayNoDuplicates!0 (array!82380 (_ BitVec 32) List!28229) Bool)

(assert (=> b!1262438 (= res!841062 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28226))))

(declare-fun b!1262439 () Bool)

(declare-fun +!4245 (ListLongMap!18907 tuple2!21034) ListLongMap!18907)

(assert (=> b!1262439 (= e!718628 (= (getCurrentListMap!4638 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4245 lt!572237 (tuple2!21035 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1262440 () Bool)

(declare-fun e!718629 () Bool)

(assert (=> b!1262440 (= e!718629 (and e!718631 mapRes!50386))))

(declare-fun condMapEmpty!50386 () Bool)

(declare-fun mapDefault!50386 () ValueCell!15427)

