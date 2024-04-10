; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105554 () Bool)

(assert start!105554)

(declare-fun b_free!27169 () Bool)

(declare-fun b_next!27169 () Bool)

(assert (=> start!105554 (= b_free!27169 (not b_next!27169))))

(declare-fun tp!95027 () Bool)

(declare-fun b_and!45035 () Bool)

(assert (=> start!105554 (= tp!95027 b_and!45035)))

(declare-fun b!1257490 () Bool)

(declare-fun e!715051 () Bool)

(declare-fun tp_is_empty!32071 () Bool)

(assert (=> b!1257490 (= e!715051 tp_is_empty!32071)))

(declare-fun b!1257491 () Bool)

(declare-fun res!838222 () Bool)

(declare-fun e!715049 () Bool)

(assert (=> b!1257491 (=> (not res!838222) (not e!715049))))

(declare-datatypes ((array!81778 0))(
  ( (array!81779 (arr!39446 (Array (_ BitVec 32) (_ BitVec 64))) (size!39982 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81778)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81778 (_ BitVec 32)) Bool)

(assert (=> b!1257491 (= res!838222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49897 () Bool)

(declare-fun mapRes!49897 () Bool)

(declare-fun tp!95026 () Bool)

(assert (=> mapNonEmpty!49897 (= mapRes!49897 (and tp!95026 e!715051))))

(declare-datatypes ((V!48127 0))(
  ( (V!48128 (val!16098 Int)) )
))
(declare-datatypes ((ValueCell!15272 0))(
  ( (ValueCellFull!15272 (v!18800 V!48127)) (EmptyCell!15272) )
))
(declare-datatypes ((array!81780 0))(
  ( (array!81781 (arr!39447 (Array (_ BitVec 32) ValueCell!15272)) (size!39983 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81780)

(declare-fun mapKey!49897 () (_ BitVec 32))

(declare-fun mapValue!49897 () ValueCell!15272)

(declare-fun mapRest!49897 () (Array (_ BitVec 32) ValueCell!15272))

(assert (=> mapNonEmpty!49897 (= (arr!39447 _values!914) (store mapRest!49897 mapKey!49897 mapValue!49897))))

(declare-fun b!1257493 () Bool)

(declare-fun res!838224 () Bool)

(assert (=> b!1257493 (=> (not res!838224) (not e!715049))))

(declare-datatypes ((List!28014 0))(
  ( (Nil!28011) (Cons!28010 (h!29219 (_ BitVec 64)) (t!41505 List!28014)) )
))
(declare-fun arrayNoDuplicates!0 (array!81778 (_ BitVec 32) List!28014) Bool)

(assert (=> b!1257493 (= res!838224 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28011))))

(declare-fun mapIsEmpty!49897 () Bool)

(assert (=> mapIsEmpty!49897 mapRes!49897))

(declare-fun b!1257494 () Bool)

(declare-fun res!838223 () Bool)

(assert (=> b!1257494 (=> (not res!838223) (not e!715049))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1257494 (= res!838223 (and (= (size!39983 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39982 _keys!1118) (size!39983 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257495 () Bool)

(assert (=> b!1257495 (= e!715049 (not true))))

(declare-datatypes ((tuple2!20800 0))(
  ( (tuple2!20801 (_1!10411 (_ BitVec 64)) (_2!10411 V!48127)) )
))
(declare-datatypes ((List!28015 0))(
  ( (Nil!28012) (Cons!28011 (h!29220 tuple2!20800) (t!41506 List!28015)) )
))
(declare-datatypes ((ListLongMap!18673 0))(
  ( (ListLongMap!18674 (toList!9352 List!28015)) )
))
(declare-fun lt!568767 () ListLongMap!18673)

(declare-fun lt!568766 () ListLongMap!18673)

(assert (=> b!1257495 (= lt!568767 lt!568766)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48127)

(declare-datatypes ((Unit!41888 0))(
  ( (Unit!41889) )
))
(declare-fun lt!568765 () Unit!41888)

(declare-fun zeroValue!871 () V!48127)

(declare-fun minValueBefore!43 () V!48127)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1094 (array!81778 array!81780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48127 V!48127 V!48127 V!48127 (_ BitVec 32) Int) Unit!41888)

(assert (=> b!1257495 (= lt!568765 (lemmaNoChangeToArrayThenSameMapNoExtras!1094 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5730 (array!81778 array!81780 (_ BitVec 32) (_ BitVec 32) V!48127 V!48127 (_ BitVec 32) Int) ListLongMap!18673)

(assert (=> b!1257495 (= lt!568766 (getCurrentListMapNoExtraKeys!5730 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257495 (= lt!568767 (getCurrentListMapNoExtraKeys!5730 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257496 () Bool)

(declare-fun e!715048 () Bool)

(declare-fun e!715050 () Bool)

(assert (=> b!1257496 (= e!715048 (and e!715050 mapRes!49897))))

(declare-fun condMapEmpty!49897 () Bool)

(declare-fun mapDefault!49897 () ValueCell!15272)

