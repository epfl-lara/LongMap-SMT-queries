; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105740 () Bool)

(assert start!105740)

(declare-fun b_free!27325 () Bool)

(declare-fun b_next!27325 () Bool)

(assert (=> start!105740 (= b_free!27325 (not b_next!27325))))

(declare-fun tp!95501 () Bool)

(declare-fun b_and!45209 () Bool)

(assert (=> start!105740 (= tp!95501 b_and!45209)))

(declare-fun b!1259610 () Bool)

(declare-fun e!716620 () Bool)

(declare-datatypes ((array!82072 0))(
  ( (array!82073 (arr!39591 (Array (_ BitVec 32) (_ BitVec 64))) (size!40127 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82072)

(assert (=> b!1259610 (= e!716620 (bvsle #b00000000000000000000000000000000 (size!40127 _keys!1118)))))

(declare-fun b!1259611 () Bool)

(declare-fun res!839496 () Bool)

(declare-fun e!716618 () Bool)

(assert (=> b!1259611 (=> (not res!839496) (not e!716618))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82072 (_ BitVec 32)) Bool)

(assert (=> b!1259611 (= res!839496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259612 () Bool)

(declare-fun e!716622 () Bool)

(declare-fun tp_is_empty!32227 () Bool)

(assert (=> b!1259612 (= e!716622 tp_is_empty!32227)))

(declare-fun b!1259613 () Bool)

(declare-fun res!839500 () Bool)

(assert (=> b!1259613 (=> (not res!839500) (not e!716618))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48335 0))(
  ( (V!48336 (val!16176 Int)) )
))
(declare-datatypes ((ValueCell!15350 0))(
  ( (ValueCellFull!15350 (v!18878 V!48335)) (EmptyCell!15350) )
))
(declare-datatypes ((array!82074 0))(
  ( (array!82075 (arr!39592 (Array (_ BitVec 32) ValueCell!15350)) (size!40128 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82074)

(assert (=> b!1259613 (= res!839500 (and (= (size!40128 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40127 _keys!1118) (size!40128 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259614 () Bool)

(declare-fun e!716617 () Bool)

(assert (=> b!1259614 (= e!716618 (not e!716617))))

(declare-fun res!839498 () Bool)

(assert (=> b!1259614 (=> res!839498 e!716617)))

(assert (=> b!1259614 (= res!839498 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20914 0))(
  ( (tuple2!20915 (_1!10468 (_ BitVec 64)) (_2!10468 V!48335)) )
))
(declare-datatypes ((List!28118 0))(
  ( (Nil!28115) (Cons!28114 (h!29323 tuple2!20914) (t!41613 List!28118)) )
))
(declare-datatypes ((ListLongMap!18787 0))(
  ( (ListLongMap!18788 (toList!9409 List!28118)) )
))
(declare-fun lt!570263 () ListLongMap!18787)

(declare-fun lt!570256 () ListLongMap!18787)

(assert (=> b!1259614 (= lt!570263 lt!570256)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48335)

(declare-fun zeroValue!871 () V!48335)

(declare-fun minValueBefore!43 () V!48335)

(declare-datatypes ((Unit!42001 0))(
  ( (Unit!42002) )
))
(declare-fun lt!570262 () Unit!42001)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1149 (array!82072 array!82074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48335 V!48335 V!48335 V!48335 (_ BitVec 32) Int) Unit!42001)

(assert (=> b!1259614 (= lt!570262 (lemmaNoChangeToArrayThenSameMapNoExtras!1149 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5785 (array!82072 array!82074 (_ BitVec 32) (_ BitVec 32) V!48335 V!48335 (_ BitVec 32) Int) ListLongMap!18787)

(assert (=> b!1259614 (= lt!570256 (getCurrentListMapNoExtraKeys!5785 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259614 (= lt!570263 (getCurrentListMapNoExtraKeys!5785 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259615 () Bool)

(assert (=> b!1259615 (= e!716617 e!716620)))

(declare-fun res!839499 () Bool)

(assert (=> b!1259615 (=> res!839499 e!716620)))

(declare-fun lt!570260 () ListLongMap!18787)

(declare-fun lt!570258 () ListLongMap!18787)

(declare-fun -!2115 (ListLongMap!18787 (_ BitVec 64)) ListLongMap!18787)

(assert (=> b!1259615 (= res!839499 (not (= (-!2115 lt!570260 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570258)))))

(declare-fun lt!570259 () ListLongMap!18787)

(declare-fun lt!570261 () ListLongMap!18787)

(assert (=> b!1259615 (= (-!2115 lt!570259 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570261)))

(declare-fun lt!570257 () Unit!42001)

(declare-fun addThenRemoveForNewKeyIsSame!352 (ListLongMap!18787 (_ BitVec 64) V!48335) Unit!42001)

(assert (=> b!1259615 (= lt!570257 (addThenRemoveForNewKeyIsSame!352 lt!570261 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716619 () Bool)

(assert (=> b!1259615 e!716619))

(declare-fun res!839502 () Bool)

(assert (=> b!1259615 (=> (not res!839502) (not e!716619))))

(assert (=> b!1259615 (= res!839502 (= lt!570260 lt!570259))))

(declare-fun +!4213 (ListLongMap!18787 tuple2!20914) ListLongMap!18787)

(assert (=> b!1259615 (= lt!570259 (+!4213 lt!570261 (tuple2!20915 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570255 () tuple2!20914)

(assert (=> b!1259615 (= lt!570261 (+!4213 lt!570263 lt!570255))))

(assert (=> b!1259615 (= lt!570255 (tuple2!20915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4606 (array!82072 array!82074 (_ BitVec 32) (_ BitVec 32) V!48335 V!48335 (_ BitVec 32) Int) ListLongMap!18787)

(assert (=> b!1259615 (= lt!570258 (getCurrentListMap!4606 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259615 (= lt!570260 (getCurrentListMap!4606 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259616 () Bool)

(declare-fun res!839501 () Bool)

(assert (=> b!1259616 (=> (not res!839501) (not e!716618))))

(declare-datatypes ((List!28119 0))(
  ( (Nil!28116) (Cons!28115 (h!29324 (_ BitVec 64)) (t!41614 List!28119)) )
))
(declare-fun arrayNoDuplicates!0 (array!82072 (_ BitVec 32) List!28119) Bool)

(assert (=> b!1259616 (= res!839501 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28116))))

(declare-fun mapNonEmpty!50137 () Bool)

(declare-fun mapRes!50137 () Bool)

(declare-fun tp!95500 () Bool)

(assert (=> mapNonEmpty!50137 (= mapRes!50137 (and tp!95500 e!716622))))

(declare-fun mapKey!50137 () (_ BitVec 32))

(declare-fun mapRest!50137 () (Array (_ BitVec 32) ValueCell!15350))

(declare-fun mapValue!50137 () ValueCell!15350)

(assert (=> mapNonEmpty!50137 (= (arr!39592 _values!914) (store mapRest!50137 mapKey!50137 mapValue!50137))))

(declare-fun res!839497 () Bool)

(assert (=> start!105740 (=> (not res!839497) (not e!716618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105740 (= res!839497 (validMask!0 mask!1466))))

(assert (=> start!105740 e!716618))

(assert (=> start!105740 true))

(assert (=> start!105740 tp!95501))

(assert (=> start!105740 tp_is_empty!32227))

(declare-fun array_inv!30143 (array!82072) Bool)

(assert (=> start!105740 (array_inv!30143 _keys!1118)))

(declare-fun e!716616 () Bool)

(declare-fun array_inv!30144 (array!82074) Bool)

(assert (=> start!105740 (and (array_inv!30144 _values!914) e!716616)))

(declare-fun mapIsEmpty!50137 () Bool)

(assert (=> mapIsEmpty!50137 mapRes!50137))

(declare-fun b!1259617 () Bool)

(declare-fun e!716621 () Bool)

(assert (=> b!1259617 (= e!716621 tp_is_empty!32227)))

(declare-fun b!1259618 () Bool)

(assert (=> b!1259618 (= e!716619 (= lt!570258 (+!4213 lt!570256 lt!570255)))))

(declare-fun b!1259619 () Bool)

(assert (=> b!1259619 (= e!716616 (and e!716621 mapRes!50137))))

(declare-fun condMapEmpty!50137 () Bool)

(declare-fun mapDefault!50137 () ValueCell!15350)

