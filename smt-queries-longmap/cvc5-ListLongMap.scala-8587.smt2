; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104752 () Bool)

(assert start!104752)

(declare-fun b_free!26557 () Bool)

(declare-fun b_next!26557 () Bool)

(assert (=> start!104752 (= b_free!26557 (not b_next!26557))))

(declare-fun tp!93160 () Bool)

(declare-fun b_and!44325 () Bool)

(assert (=> start!104752 (= tp!93160 b_and!44325)))

(declare-fun b!1248738 () Bool)

(declare-fun e!708634 () Bool)

(declare-fun tp_is_empty!31459 () Bool)

(assert (=> b!1248738 (= e!708634 tp_is_empty!31459)))

(declare-fun b!1248739 () Bool)

(declare-fun e!708636 () Bool)

(assert (=> b!1248739 (= e!708636 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47311 0))(
  ( (V!47312 (val!15792 Int)) )
))
(declare-fun minValueAfter!43 () V!47311)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47311)

(declare-datatypes ((array!80606 0))(
  ( (array!80607 (arr!38870 (Array (_ BitVec 32) (_ BitVec 64))) (size!39406 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80606)

(declare-datatypes ((tuple2!20336 0))(
  ( (tuple2!20337 (_1!10179 (_ BitVec 64)) (_2!10179 V!47311)) )
))
(declare-datatypes ((List!27584 0))(
  ( (Nil!27581) (Cons!27580 (h!28789 tuple2!20336) (t!41055 List!27584)) )
))
(declare-datatypes ((ListLongMap!18209 0))(
  ( (ListLongMap!18210 (toList!9120 List!27584)) )
))
(declare-fun lt!563499 () ListLongMap!18209)

(declare-datatypes ((ValueCell!14966 0))(
  ( (ValueCellFull!14966 (v!18488 V!47311)) (EmptyCell!14966) )
))
(declare-datatypes ((array!80608 0))(
  ( (array!80609 (arr!38871 (Array (_ BitVec 32) ValueCell!14966)) (size!39407 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80608)

(declare-fun getCurrentListMapNoExtraKeys!5527 (array!80606 array!80608 (_ BitVec 32) (_ BitVec 32) V!47311 V!47311 (_ BitVec 32) Int) ListLongMap!18209)

(assert (=> b!1248739 (= lt!563499 (getCurrentListMapNoExtraKeys!5527 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lt!563500 () ListLongMap!18209)

(declare-fun minValueBefore!43 () V!47311)

(assert (=> b!1248739 (= lt!563500 (getCurrentListMapNoExtraKeys!5527 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!48949 () Bool)

(declare-fun mapRes!48949 () Bool)

(declare-fun tp!93161 () Bool)

(declare-fun e!708635 () Bool)

(assert (=> mapNonEmpty!48949 (= mapRes!48949 (and tp!93161 e!708635))))

(declare-fun mapValue!48949 () ValueCell!14966)

(declare-fun mapKey!48949 () (_ BitVec 32))

(declare-fun mapRest!48949 () (Array (_ BitVec 32) ValueCell!14966))

(assert (=> mapNonEmpty!48949 (= (arr!38871 _values!914) (store mapRest!48949 mapKey!48949 mapValue!48949))))

(declare-fun b!1248740 () Bool)

(declare-fun e!708633 () Bool)

(assert (=> b!1248740 (= e!708633 (and e!708634 mapRes!48949))))

(declare-fun condMapEmpty!48949 () Bool)

(declare-fun mapDefault!48949 () ValueCell!14966)

