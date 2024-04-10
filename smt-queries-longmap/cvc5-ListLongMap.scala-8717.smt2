; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105774 () Bool)

(assert start!105774)

(declare-fun b_free!27337 () Bool)

(declare-fun b_next!27337 () Bool)

(assert (=> start!105774 (= b_free!27337 (not b_next!27337))))

(declare-fun tp!95539 () Bool)

(declare-fun b_and!45233 () Bool)

(assert (=> start!105774 (= tp!95539 b_and!45233)))

(declare-fun b!1259958 () Bool)

(declare-fun e!716863 () Bool)

(declare-fun e!716864 () Bool)

(assert (=> b!1259958 (= e!716863 (not e!716864))))

(declare-fun res!839688 () Bool)

(assert (=> b!1259958 (=> res!839688 e!716864)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259958 (= res!839688 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48351 0))(
  ( (V!48352 (val!16182 Int)) )
))
(declare-datatypes ((tuple2!20924 0))(
  ( (tuple2!20925 (_1!10473 (_ BitVec 64)) (_2!10473 V!48351)) )
))
(declare-datatypes ((List!28127 0))(
  ( (Nil!28124) (Cons!28123 (h!29332 tuple2!20924) (t!41624 List!28127)) )
))
(declare-datatypes ((ListLongMap!18797 0))(
  ( (ListLongMap!18798 (toList!9414 List!28127)) )
))
(declare-fun lt!570585 () ListLongMap!18797)

(declare-fun lt!570587 () ListLongMap!18797)

(assert (=> b!1259958 (= lt!570585 lt!570587)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48351)

(declare-fun zeroValue!871 () V!48351)

(declare-datatypes ((array!82096 0))(
  ( (array!82097 (arr!39602 (Array (_ BitVec 32) (_ BitVec 64))) (size!40138 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82096)

(declare-datatypes ((ValueCell!15356 0))(
  ( (ValueCellFull!15356 (v!18885 V!48351)) (EmptyCell!15356) )
))
(declare-datatypes ((array!82098 0))(
  ( (array!82099 (arr!39603 (Array (_ BitVec 32) ValueCell!15356)) (size!40139 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82098)

(declare-datatypes ((Unit!42013 0))(
  ( (Unit!42014) )
))
(declare-fun lt!570590 () Unit!42013)

(declare-fun minValueBefore!43 () V!48351)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1153 (array!82096 array!82098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48351 V!48351 V!48351 V!48351 (_ BitVec 32) Int) Unit!42013)

(assert (=> b!1259958 (= lt!570590 (lemmaNoChangeToArrayThenSameMapNoExtras!1153 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5789 (array!82096 array!82098 (_ BitVec 32) (_ BitVec 32) V!48351 V!48351 (_ BitVec 32) Int) ListLongMap!18797)

(assert (=> b!1259958 (= lt!570587 (getCurrentListMapNoExtraKeys!5789 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259958 (= lt!570585 (getCurrentListMapNoExtraKeys!5789 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259959 () Bool)

(declare-fun e!716865 () Bool)

(declare-fun tp_is_empty!32239 () Bool)

(assert (=> b!1259959 (= e!716865 tp_is_empty!32239)))

(declare-fun b!1259960 () Bool)

(declare-fun res!839689 () Bool)

(assert (=> b!1259960 (=> (not res!839689) (not e!716863))))

(assert (=> b!1259960 (= res!839689 (and (= (size!40139 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40138 _keys!1118) (size!40139 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259961 () Bool)

(declare-fun res!839693 () Bool)

(assert (=> b!1259961 (=> (not res!839693) (not e!716863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82096 (_ BitVec 32)) Bool)

(assert (=> b!1259961 (= res!839693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259962 () Bool)

(declare-fun e!716866 () Bool)

(assert (=> b!1259962 (= e!716866 tp_is_empty!32239)))

(declare-fun b!1259963 () Bool)

(assert (=> b!1259963 (= e!716864 true)))

(declare-fun lt!570586 () ListLongMap!18797)

(declare-fun lt!570583 () ListLongMap!18797)

(declare-fun -!2120 (ListLongMap!18797 (_ BitVec 64)) ListLongMap!18797)

(assert (=> b!1259963 (= lt!570586 (-!2120 lt!570583 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570588 () ListLongMap!18797)

(declare-fun lt!570584 () ListLongMap!18797)

(assert (=> b!1259963 (= (-!2120 lt!570588 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570584)))

(declare-fun lt!570589 () Unit!42013)

(declare-fun addThenRemoveForNewKeyIsSame!357 (ListLongMap!18797 (_ BitVec 64) V!48351) Unit!42013)

(assert (=> b!1259963 (= lt!570589 (addThenRemoveForNewKeyIsSame!357 lt!570584 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716860 () Bool)

(assert (=> b!1259963 e!716860))

(declare-fun res!839692 () Bool)

(assert (=> b!1259963 (=> (not res!839692) (not e!716860))))

(assert (=> b!1259963 (= res!839692 (= lt!570583 lt!570588))))

(declare-fun +!4218 (ListLongMap!18797 tuple2!20924) ListLongMap!18797)

(assert (=> b!1259963 (= lt!570588 (+!4218 lt!570584 (tuple2!20925 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570591 () tuple2!20924)

(assert (=> b!1259963 (= lt!570584 (+!4218 lt!570585 lt!570591))))

(assert (=> b!1259963 (= lt!570591 (tuple2!20925 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!570592 () ListLongMap!18797)

(declare-fun getCurrentListMap!4611 (array!82096 array!82098 (_ BitVec 32) (_ BitVec 32) V!48351 V!48351 (_ BitVec 32) Int) ListLongMap!18797)

(assert (=> b!1259963 (= lt!570592 (getCurrentListMap!4611 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259963 (= lt!570583 (getCurrentListMap!4611 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259964 () Bool)

(declare-fun e!716862 () Bool)

(declare-fun mapRes!50158 () Bool)

(assert (=> b!1259964 (= e!716862 (and e!716865 mapRes!50158))))

(declare-fun condMapEmpty!50158 () Bool)

(declare-fun mapDefault!50158 () ValueCell!15356)

