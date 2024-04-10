; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105778 () Bool)

(assert start!105778)

(declare-fun b_free!27341 () Bool)

(declare-fun b_next!27341 () Bool)

(assert (=> start!105778 (= b_free!27341 (not b_next!27341))))

(declare-fun tp!95552 () Bool)

(declare-fun b_and!45237 () Bool)

(assert (=> start!105778 (= tp!95552 b_and!45237)))

(declare-fun b!1260012 () Bool)

(declare-fun e!716908 () Bool)

(declare-fun e!716906 () Bool)

(assert (=> b!1260012 (= e!716908 (not e!716906))))

(declare-fun res!839728 () Bool)

(assert (=> b!1260012 (=> res!839728 e!716906)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260012 (= res!839728 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48355 0))(
  ( (V!48356 (val!16184 Int)) )
))
(declare-datatypes ((tuple2!20928 0))(
  ( (tuple2!20929 (_1!10475 (_ BitVec 64)) (_2!10475 V!48355)) )
))
(declare-datatypes ((List!28130 0))(
  ( (Nil!28127) (Cons!28126 (h!29335 tuple2!20928) (t!41627 List!28130)) )
))
(declare-datatypes ((ListLongMap!18801 0))(
  ( (ListLongMap!18802 (toList!9416 List!28130)) )
))
(declare-fun lt!570647 () ListLongMap!18801)

(declare-fun lt!570645 () ListLongMap!18801)

(assert (=> b!1260012 (= lt!570647 lt!570645)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48355)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48355)

(declare-datatypes ((array!82104 0))(
  ( (array!82105 (arr!39606 (Array (_ BitVec 32) (_ BitVec 64))) (size!40142 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82104)

(declare-datatypes ((ValueCell!15358 0))(
  ( (ValueCellFull!15358 (v!18887 V!48355)) (EmptyCell!15358) )
))
(declare-datatypes ((array!82106 0))(
  ( (array!82107 (arr!39607 (Array (_ BitVec 32) ValueCell!15358)) (size!40143 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82106)

(declare-fun minValueBefore!43 () V!48355)

(declare-datatypes ((Unit!42017 0))(
  ( (Unit!42018) )
))
(declare-fun lt!570652 () Unit!42017)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1155 (array!82104 array!82106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48355 V!48355 V!48355 V!48355 (_ BitVec 32) Int) Unit!42017)

(assert (=> b!1260012 (= lt!570652 (lemmaNoChangeToArrayThenSameMapNoExtras!1155 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5791 (array!82104 array!82106 (_ BitVec 32) (_ BitVec 32) V!48355 V!48355 (_ BitVec 32) Int) ListLongMap!18801)

(assert (=> b!1260012 (= lt!570645 (getCurrentListMapNoExtraKeys!5791 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260012 (= lt!570647 (getCurrentListMapNoExtraKeys!5791 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260013 () Bool)

(assert (=> b!1260013 (= e!716906 true)))

(declare-fun lt!570644 () ListLongMap!18801)

(declare-fun lt!570648 () ListLongMap!18801)

(declare-fun -!2122 (ListLongMap!18801 (_ BitVec 64)) ListLongMap!18801)

(assert (=> b!1260013 (= lt!570644 (-!2122 lt!570648 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570643 () ListLongMap!18801)

(declare-fun lt!570646 () ListLongMap!18801)

(assert (=> b!1260013 (= (-!2122 lt!570643 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570646)))

(declare-fun lt!570651 () Unit!42017)

(declare-fun addThenRemoveForNewKeyIsSame!359 (ListLongMap!18801 (_ BitVec 64) V!48355) Unit!42017)

(assert (=> b!1260013 (= lt!570651 (addThenRemoveForNewKeyIsSame!359 lt!570646 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716903 () Bool)

(assert (=> b!1260013 e!716903))

(declare-fun res!839725 () Bool)

(assert (=> b!1260013 (=> (not res!839725) (not e!716903))))

(assert (=> b!1260013 (= res!839725 (= lt!570648 lt!570643))))

(declare-fun +!4220 (ListLongMap!18801 tuple2!20928) ListLongMap!18801)

(assert (=> b!1260013 (= lt!570643 (+!4220 lt!570646 (tuple2!20929 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570649 () tuple2!20928)

(assert (=> b!1260013 (= lt!570646 (+!4220 lt!570647 lt!570649))))

(assert (=> b!1260013 (= lt!570649 (tuple2!20929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!570650 () ListLongMap!18801)

(declare-fun getCurrentListMap!4613 (array!82104 array!82106 (_ BitVec 32) (_ BitVec 32) V!48355 V!48355 (_ BitVec 32) Int) ListLongMap!18801)

(assert (=> b!1260013 (= lt!570650 (getCurrentListMap!4613 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260013 (= lt!570648 (getCurrentListMap!4613 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!839729 () Bool)

(assert (=> start!105778 (=> (not res!839729) (not e!716908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105778 (= res!839729 (validMask!0 mask!1466))))

(assert (=> start!105778 e!716908))

(assert (=> start!105778 true))

(assert (=> start!105778 tp!95552))

(declare-fun tp_is_empty!32243 () Bool)

(assert (=> start!105778 tp_is_empty!32243))

(declare-fun array_inv!30153 (array!82104) Bool)

(assert (=> start!105778 (array_inv!30153 _keys!1118)))

(declare-fun e!716905 () Bool)

(declare-fun array_inv!30154 (array!82106) Bool)

(assert (=> start!105778 (and (array_inv!30154 _values!914) e!716905)))

(declare-fun b!1260014 () Bool)

(declare-fun res!839727 () Bool)

(assert (=> b!1260014 (=> (not res!839727) (not e!716908))))

(declare-datatypes ((List!28131 0))(
  ( (Nil!28128) (Cons!28127 (h!29336 (_ BitVec 64)) (t!41628 List!28131)) )
))
(declare-fun arrayNoDuplicates!0 (array!82104 (_ BitVec 32) List!28131) Bool)

(assert (=> b!1260014 (= res!839727 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28128))))

(declare-fun b!1260015 () Bool)

(assert (=> b!1260015 (= e!716903 (= lt!570650 (+!4220 lt!570645 lt!570649)))))

(declare-fun b!1260016 () Bool)

(declare-fun res!839724 () Bool)

(assert (=> b!1260016 (=> (not res!839724) (not e!716908))))

(assert (=> b!1260016 (= res!839724 (and (= (size!40143 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40142 _keys!1118) (size!40143 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260017 () Bool)

(declare-fun e!716902 () Bool)

(assert (=> b!1260017 (= e!716902 tp_is_empty!32243)))

(declare-fun mapIsEmpty!50164 () Bool)

(declare-fun mapRes!50164 () Bool)

(assert (=> mapIsEmpty!50164 mapRes!50164))

(declare-fun mapNonEmpty!50164 () Bool)

(declare-fun tp!95551 () Bool)

(declare-fun e!716907 () Bool)

(assert (=> mapNonEmpty!50164 (= mapRes!50164 (and tp!95551 e!716907))))

(declare-fun mapRest!50164 () (Array (_ BitVec 32) ValueCell!15358))

(declare-fun mapKey!50164 () (_ BitVec 32))

(declare-fun mapValue!50164 () ValueCell!15358)

(assert (=> mapNonEmpty!50164 (= (arr!39607 _values!914) (store mapRest!50164 mapKey!50164 mapValue!50164))))

(declare-fun b!1260018 () Bool)

(declare-fun res!839726 () Bool)

(assert (=> b!1260018 (=> (not res!839726) (not e!716908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82104 (_ BitVec 32)) Bool)

(assert (=> b!1260018 (= res!839726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260019 () Bool)

(assert (=> b!1260019 (= e!716907 tp_is_empty!32243)))

(declare-fun b!1260020 () Bool)

(assert (=> b!1260020 (= e!716905 (and e!716902 mapRes!50164))))

(declare-fun condMapEmpty!50164 () Bool)

(declare-fun mapDefault!50164 () ValueCell!15358)

