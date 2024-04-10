; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104852 () Bool)

(assert start!104852)

(declare-fun b_free!26657 () Bool)

(declare-fun b_next!26657 () Bool)

(assert (=> start!104852 (= b_free!26657 (not b_next!26657))))

(declare-fun tp!93460 () Bool)

(declare-fun b_and!44425 () Bool)

(assert (=> start!104852 (= tp!93460 b_and!44425)))

(declare-fun mapNonEmpty!49099 () Bool)

(declare-fun mapRes!49099 () Bool)

(declare-fun tp!93461 () Bool)

(declare-fun e!709383 () Bool)

(assert (=> mapNonEmpty!49099 (= mapRes!49099 (and tp!93461 e!709383))))

(declare-datatypes ((V!47443 0))(
  ( (V!47444 (val!15842 Int)) )
))
(declare-datatypes ((ValueCell!15016 0))(
  ( (ValueCellFull!15016 (v!18538 V!47443)) (EmptyCell!15016) )
))
(declare-fun mapRest!49099 () (Array (_ BitVec 32) ValueCell!15016))

(declare-fun mapKey!49099 () (_ BitVec 32))

(declare-fun mapValue!49099 () ValueCell!15016)

(declare-datatypes ((array!80790 0))(
  ( (array!80791 (arr!38962 (Array (_ BitVec 32) ValueCell!15016)) (size!39498 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80790)

(assert (=> mapNonEmpty!49099 (= (arr!38962 _values!914) (store mapRest!49099 mapKey!49099 mapValue!49099))))

(declare-fun b!1249788 () Bool)

(declare-fun e!709387 () Bool)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((array!80792 0))(
  ( (array!80793 (arr!38963 (Array (_ BitVec 32) (_ BitVec 64))) (size!39499 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80792)

(assert (=> b!1249788 (= e!709387 (not (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!39499 _keys!1118)))))))

(declare-datatypes ((tuple2!20404 0))(
  ( (tuple2!20405 (_1!10213 (_ BitVec 64)) (_2!10213 V!47443)) )
))
(declare-datatypes ((List!27648 0))(
  ( (Nil!27645) (Cons!27644 (h!28853 tuple2!20404) (t!41119 List!27648)) )
))
(declare-datatypes ((ListLongMap!18277 0))(
  ( (ListLongMap!18278 (toList!9154 List!27648)) )
))
(declare-fun lt!563879 () ListLongMap!18277)

(declare-fun lt!563881 () ListLongMap!18277)

(assert (=> b!1249788 (= lt!563879 lt!563881)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47443)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47443)

(declare-fun minValueBefore!43 () V!47443)

(declare-datatypes ((Unit!41505 0))(
  ( (Unit!41506) )
))
(declare-fun lt!563880 () Unit!41505)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!925 (array!80792 array!80790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47443 V!47443 V!47443 V!47443 (_ BitVec 32) Int) Unit!41505)

(assert (=> b!1249788 (= lt!563880 (lemmaNoChangeToArrayThenSameMapNoExtras!925 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5561 (array!80792 array!80790 (_ BitVec 32) (_ BitVec 32) V!47443 V!47443 (_ BitVec 32) Int) ListLongMap!18277)

(assert (=> b!1249788 (= lt!563881 (getCurrentListMapNoExtraKeys!5561 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249788 (= lt!563879 (getCurrentListMapNoExtraKeys!5561 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249789 () Bool)

(declare-fun e!709385 () Bool)

(declare-fun tp_is_empty!31559 () Bool)

(assert (=> b!1249789 (= e!709385 tp_is_empty!31559)))

(declare-fun b!1249790 () Bool)

(declare-fun res!833665 () Bool)

(assert (=> b!1249790 (=> (not res!833665) (not e!709387))))

(declare-datatypes ((List!27649 0))(
  ( (Nil!27646) (Cons!27645 (h!28854 (_ BitVec 64)) (t!41120 List!27649)) )
))
(declare-fun arrayNoDuplicates!0 (array!80792 (_ BitVec 32) List!27649) Bool)

(assert (=> b!1249790 (= res!833665 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27646))))

(declare-fun res!833664 () Bool)

(assert (=> start!104852 (=> (not res!833664) (not e!709387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104852 (= res!833664 (validMask!0 mask!1466))))

(assert (=> start!104852 e!709387))

(assert (=> start!104852 true))

(assert (=> start!104852 tp!93460))

(assert (=> start!104852 tp_is_empty!31559))

(declare-fun array_inv!29729 (array!80792) Bool)

(assert (=> start!104852 (array_inv!29729 _keys!1118)))

(declare-fun e!709386 () Bool)

(declare-fun array_inv!29730 (array!80790) Bool)

(assert (=> start!104852 (and (array_inv!29730 _values!914) e!709386)))

(declare-fun b!1249791 () Bool)

(assert (=> b!1249791 (= e!709386 (and e!709385 mapRes!49099))))

(declare-fun condMapEmpty!49099 () Bool)

(declare-fun mapDefault!49099 () ValueCell!15016)

