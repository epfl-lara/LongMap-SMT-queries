; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105634 () Bool)

(assert start!105634)

(declare-fun b_free!27235 () Bool)

(declare-fun b_next!27235 () Bool)

(assert (=> start!105634 (= b_free!27235 (not b_next!27235))))

(declare-fun tp!95227 () Bool)

(declare-fun b_and!45109 () Bool)

(assert (=> start!105634 (= tp!95227 b_and!45109)))

(declare-fun res!838679 () Bool)

(declare-fun e!715628 () Bool)

(assert (=> start!105634 (=> (not res!838679) (not e!715628))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105634 (= res!838679 (validMask!0 mask!1466))))

(assert (=> start!105634 e!715628))

(assert (=> start!105634 true))

(assert (=> start!105634 tp!95227))

(declare-fun tp_is_empty!32137 () Bool)

(assert (=> start!105634 tp_is_empty!32137))

(declare-datatypes ((array!81898 0))(
  ( (array!81899 (arr!39505 (Array (_ BitVec 32) (_ BitVec 64))) (size!40041 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81898)

(declare-fun array_inv!30089 (array!81898) Bool)

(assert (=> start!105634 (array_inv!30089 _keys!1118)))

(declare-datatypes ((V!48215 0))(
  ( (V!48216 (val!16131 Int)) )
))
(declare-datatypes ((ValueCell!15305 0))(
  ( (ValueCellFull!15305 (v!18833 V!48215)) (EmptyCell!15305) )
))
(declare-datatypes ((array!81900 0))(
  ( (array!81901 (arr!39506 (Array (_ BitVec 32) ValueCell!15305)) (size!40042 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81900)

(declare-fun e!715630 () Bool)

(declare-fun array_inv!30090 (array!81900) Bool)

(assert (=> start!105634 (and (array_inv!30090 _values!914) e!715630)))

(declare-fun b!1258297 () Bool)

(declare-fun res!838678 () Bool)

(assert (=> b!1258297 (=> (not res!838678) (not e!715628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81898 (_ BitVec 32)) Bool)

(assert (=> b!1258297 (= res!838678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258298 () Bool)

(declare-fun e!715631 () Bool)

(assert (=> b!1258298 (= e!715631 tp_is_empty!32137)))

(declare-fun mapNonEmpty!49999 () Bool)

(declare-fun mapRes!49999 () Bool)

(declare-fun tp!95228 () Bool)

(declare-fun e!715627 () Bool)

(assert (=> mapNonEmpty!49999 (= mapRes!49999 (and tp!95228 e!715627))))

(declare-fun mapRest!49999 () (Array (_ BitVec 32) ValueCell!15305))

(declare-fun mapKey!49999 () (_ BitVec 32))

(declare-fun mapValue!49999 () ValueCell!15305)

(assert (=> mapNonEmpty!49999 (= (arr!39506 _values!914) (store mapRest!49999 mapKey!49999 mapValue!49999))))

(declare-fun b!1258299 () Bool)

(assert (=> b!1258299 (= e!715627 tp_is_empty!32137)))

(declare-fun b!1258300 () Bool)

(declare-fun e!715629 () Bool)

(assert (=> b!1258300 (= e!715628 (not e!715629))))

(declare-fun res!838680 () Bool)

(assert (=> b!1258300 (=> res!838680 e!715629)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258300 (= res!838680 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20836 0))(
  ( (tuple2!20837 (_1!10429 (_ BitVec 64)) (_2!10429 V!48215)) )
))
(declare-datatypes ((List!28053 0))(
  ( (Nil!28050) (Cons!28049 (h!29258 tuple2!20836) (t!41546 List!28053)) )
))
(declare-datatypes ((ListLongMap!18709 0))(
  ( (ListLongMap!18710 (toList!9370 List!28053)) )
))
(declare-fun lt!569133 () ListLongMap!18709)

(declare-fun lt!569131 () ListLongMap!18709)

(assert (=> b!1258300 (= lt!569133 lt!569131)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48215)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48215)

(declare-fun minValueBefore!43 () V!48215)

(declare-datatypes ((Unit!41924 0))(
  ( (Unit!41925) )
))
(declare-fun lt!569134 () Unit!41924)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1112 (array!81898 array!81900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48215 V!48215 V!48215 V!48215 (_ BitVec 32) Int) Unit!41924)

(assert (=> b!1258300 (= lt!569134 (lemmaNoChangeToArrayThenSameMapNoExtras!1112 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5748 (array!81898 array!81900 (_ BitVec 32) (_ BitVec 32) V!48215 V!48215 (_ BitVec 32) Int) ListLongMap!18709)

(assert (=> b!1258300 (= lt!569131 (getCurrentListMapNoExtraKeys!5748 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258300 (= lt!569133 (getCurrentListMapNoExtraKeys!5748 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258301 () Bool)

(assert (=> b!1258301 (= e!715629 true)))

(declare-fun lt!569132 () ListLongMap!18709)

(declare-fun getCurrentListMap!4575 (array!81898 array!81900 (_ BitVec 32) (_ BitVec 32) V!48215 V!48215 (_ BitVec 32) Int) ListLongMap!18709)

(assert (=> b!1258301 (= lt!569132 (getCurrentListMap!4575 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258302 () Bool)

(assert (=> b!1258302 (= e!715630 (and e!715631 mapRes!49999))))

(declare-fun condMapEmpty!49999 () Bool)

(declare-fun mapDefault!49999 () ValueCell!15305)

