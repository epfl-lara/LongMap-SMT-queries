; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104794 () Bool)

(assert start!104794)

(declare-fun b_free!26599 () Bool)

(declare-fun b_next!26599 () Bool)

(assert (=> start!104794 (= b_free!26599 (not b_next!26599))))

(declare-fun tp!93286 () Bool)

(declare-fun b_and!44367 () Bool)

(assert (=> start!104794 (= tp!93286 b_and!44367)))

(declare-fun b!1249179 () Bool)

(declare-fun e!708951 () Bool)

(assert (=> b!1249179 (= e!708951 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47367 0))(
  ( (V!47368 (val!15813 Int)) )
))
(declare-fun minValueAfter!43 () V!47367)

(declare-datatypes ((array!80686 0))(
  ( (array!80687 (arr!38910 (Array (_ BitVec 32) (_ BitVec 64))) (size!39446 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80686)

(declare-datatypes ((ValueCell!14987 0))(
  ( (ValueCellFull!14987 (v!18509 V!47367)) (EmptyCell!14987) )
))
(declare-datatypes ((array!80688 0))(
  ( (array!80689 (arr!38911 (Array (_ BitVec 32) ValueCell!14987)) (size!39447 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80688)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47367)

(declare-datatypes ((tuple2!20372 0))(
  ( (tuple2!20373 (_1!10197 (_ BitVec 64)) (_2!10197 V!47367)) )
))
(declare-datatypes ((List!27618 0))(
  ( (Nil!27615) (Cons!27614 (h!28823 tuple2!20372) (t!41089 List!27618)) )
))
(declare-datatypes ((ListLongMap!18245 0))(
  ( (ListLongMap!18246 (toList!9138 List!27618)) )
))
(declare-fun lt!563626 () ListLongMap!18245)

(declare-fun getCurrentListMapNoExtraKeys!5545 (array!80686 array!80688 (_ BitVec 32) (_ BitVec 32) V!47367 V!47367 (_ BitVec 32) Int) ListLongMap!18245)

(assert (=> b!1249179 (= lt!563626 (getCurrentListMapNoExtraKeys!5545 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563625 () ListLongMap!18245)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47367)

(assert (=> b!1249179 (= lt!563625 (getCurrentListMapNoExtraKeys!5545 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249180 () Bool)

(declare-fun e!708950 () Bool)

(declare-fun tp_is_empty!31501 () Bool)

(assert (=> b!1249180 (= e!708950 tp_is_empty!31501)))

(declare-fun mapNonEmpty!49012 () Bool)

(declare-fun mapRes!49012 () Bool)

(declare-fun tp!93287 () Bool)

(declare-fun e!708952 () Bool)

(assert (=> mapNonEmpty!49012 (= mapRes!49012 (and tp!93287 e!708952))))

(declare-fun mapRest!49012 () (Array (_ BitVec 32) ValueCell!14987))

(declare-fun mapValue!49012 () ValueCell!14987)

(declare-fun mapKey!49012 () (_ BitVec 32))

(assert (=> mapNonEmpty!49012 (= (arr!38911 _values!914) (store mapRest!49012 mapKey!49012 mapValue!49012))))

(declare-fun b!1249181 () Bool)

(declare-fun e!708948 () Bool)

(assert (=> b!1249181 (= e!708948 (and e!708950 mapRes!49012))))

(declare-fun condMapEmpty!49012 () Bool)

(declare-fun mapDefault!49012 () ValueCell!14987)

