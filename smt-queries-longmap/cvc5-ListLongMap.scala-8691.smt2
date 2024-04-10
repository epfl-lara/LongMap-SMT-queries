; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105566 () Bool)

(assert start!105566)

(declare-fun b_free!27181 () Bool)

(declare-fun b_next!27181 () Bool)

(assert (=> start!105566 (= b_free!27181 (not b_next!27181))))

(declare-fun tp!95062 () Bool)

(declare-fun b_and!45047 () Bool)

(assert (=> start!105566 (= tp!95062 b_and!45047)))

(declare-fun b!1257616 () Bool)

(declare-fun res!838296 () Bool)

(declare-fun e!715138 () Bool)

(assert (=> b!1257616 (=> (not res!838296) (not e!715138))))

(declare-datatypes ((array!81798 0))(
  ( (array!81799 (arr!39456 (Array (_ BitVec 32) (_ BitVec 64))) (size!39992 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81798)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81798 (_ BitVec 32)) Bool)

(assert (=> b!1257616 (= res!838296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257617 () Bool)

(declare-fun e!715137 () Bool)

(declare-fun tp_is_empty!32083 () Bool)

(assert (=> b!1257617 (= e!715137 tp_is_empty!32083)))

(declare-fun res!838295 () Bool)

(assert (=> start!105566 (=> (not res!838295) (not e!715138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105566 (= res!838295 (validMask!0 mask!1466))))

(assert (=> start!105566 e!715138))

(assert (=> start!105566 true))

(assert (=> start!105566 tp!95062))

(assert (=> start!105566 tp_is_empty!32083))

(declare-fun array_inv!30053 (array!81798) Bool)

(assert (=> start!105566 (array_inv!30053 _keys!1118)))

(declare-datatypes ((V!48143 0))(
  ( (V!48144 (val!16104 Int)) )
))
(declare-datatypes ((ValueCell!15278 0))(
  ( (ValueCellFull!15278 (v!18806 V!48143)) (EmptyCell!15278) )
))
(declare-datatypes ((array!81800 0))(
  ( (array!81801 (arr!39457 (Array (_ BitVec 32) ValueCell!15278)) (size!39993 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81800)

(declare-fun e!715139 () Bool)

(declare-fun array_inv!30054 (array!81800) Bool)

(assert (=> start!105566 (and (array_inv!30054 _values!914) e!715139)))

(declare-fun b!1257618 () Bool)

(declare-fun res!838294 () Bool)

(assert (=> b!1257618 (=> (not res!838294) (not e!715138))))

(declare-datatypes ((List!28021 0))(
  ( (Nil!28018) (Cons!28017 (h!29226 (_ BitVec 64)) (t!41512 List!28021)) )
))
(declare-fun arrayNoDuplicates!0 (array!81798 (_ BitVec 32) List!28021) Bool)

(assert (=> b!1257618 (= res!838294 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28018))))

(declare-fun b!1257619 () Bool)

(declare-fun res!838297 () Bool)

(assert (=> b!1257619 (=> (not res!838297) (not e!715138))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1257619 (= res!838297 (and (= (size!39993 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39992 _keys!1118) (size!39993 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49915 () Bool)

(declare-fun mapRes!49915 () Bool)

(declare-fun tp!95063 () Bool)

(assert (=> mapNonEmpty!49915 (= mapRes!49915 (and tp!95063 e!715137))))

(declare-fun mapRest!49915 () (Array (_ BitVec 32) ValueCell!15278))

(declare-fun mapValue!49915 () ValueCell!15278)

(declare-fun mapKey!49915 () (_ BitVec 32))

(assert (=> mapNonEmpty!49915 (= (arr!39457 _values!914) (store mapRest!49915 mapKey!49915 mapValue!49915))))

(declare-fun b!1257620 () Bool)

(assert (=> b!1257620 (= e!715138 (not true))))

(declare-datatypes ((tuple2!20806 0))(
  ( (tuple2!20807 (_1!10414 (_ BitVec 64)) (_2!10414 V!48143)) )
))
(declare-datatypes ((List!28022 0))(
  ( (Nil!28019) (Cons!28018 (h!29227 tuple2!20806) (t!41513 List!28022)) )
))
(declare-datatypes ((ListLongMap!18679 0))(
  ( (ListLongMap!18680 (toList!9355 List!28022)) )
))
(declare-fun lt!568819 () ListLongMap!18679)

(declare-fun lt!568820 () ListLongMap!18679)

(assert (=> b!1257620 (= lt!568819 lt!568820)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48143)

(declare-datatypes ((Unit!41894 0))(
  ( (Unit!41895) )
))
(declare-fun lt!568821 () Unit!41894)

(declare-fun zeroValue!871 () V!48143)

(declare-fun minValueBefore!43 () V!48143)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1097 (array!81798 array!81800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48143 V!48143 V!48143 V!48143 (_ BitVec 32) Int) Unit!41894)

(assert (=> b!1257620 (= lt!568821 (lemmaNoChangeToArrayThenSameMapNoExtras!1097 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5733 (array!81798 array!81800 (_ BitVec 32) (_ BitVec 32) V!48143 V!48143 (_ BitVec 32) Int) ListLongMap!18679)

(assert (=> b!1257620 (= lt!568820 (getCurrentListMapNoExtraKeys!5733 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257620 (= lt!568819 (getCurrentListMapNoExtraKeys!5733 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257621 () Bool)

(declare-fun e!715141 () Bool)

(assert (=> b!1257621 (= e!715141 tp_is_empty!32083)))

(declare-fun b!1257622 () Bool)

(assert (=> b!1257622 (= e!715139 (and e!715141 mapRes!49915))))

(declare-fun condMapEmpty!49915 () Bool)

(declare-fun mapDefault!49915 () ValueCell!15278)

