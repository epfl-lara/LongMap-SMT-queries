; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41600 () Bool)

(assert start!41600)

(declare-fun b_free!11267 () Bool)

(declare-fun b_next!11267 () Bool)

(assert (=> start!41600 (= b_free!11267 (not b_next!11267))))

(declare-fun tp!39799 () Bool)

(declare-fun b_and!19607 () Bool)

(assert (=> start!41600 (= tp!39799 b_and!19607)))

(declare-fun mapIsEmpty!20719 () Bool)

(declare-fun mapRes!20719 () Bool)

(assert (=> mapIsEmpty!20719 mapRes!20719))

(declare-fun b!464650 () Bool)

(declare-fun e!271449 () Bool)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!29175 0))(
  ( (array!29176 (arr!14019 (Array (_ BitVec 32) (_ BitVec 64))) (size!14371 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29175)

(assert (=> b!464650 (= e!271449 (not (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!14371 _keys!1025)))))))

(declare-datatypes ((V!18031 0))(
  ( (V!18032 (val!6392 Int)) )
))
(declare-datatypes ((tuple2!8372 0))(
  ( (tuple2!8373 (_1!4197 (_ BitVec 64)) (_2!4197 V!18031)) )
))
(declare-datatypes ((List!8466 0))(
  ( (Nil!8463) (Cons!8462 (h!9318 tuple2!8372) (t!14412 List!8466)) )
))
(declare-datatypes ((ListLongMap!7285 0))(
  ( (ListLongMap!7286 (toList!3658 List!8466)) )
))
(declare-fun lt!209806 () ListLongMap!7285)

(declare-fun lt!209807 () ListLongMap!7285)

(assert (=> b!464650 (= lt!209806 lt!209807)))

(declare-fun minValueBefore!38 () V!18031)

(declare-fun zeroValue!794 () V!18031)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13484 0))(
  ( (Unit!13485) )
))
(declare-fun lt!209805 () Unit!13484)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6004 0))(
  ( (ValueCellFull!6004 (v!8679 V!18031)) (EmptyCell!6004) )
))
(declare-datatypes ((array!29177 0))(
  ( (array!29178 (arr!14020 (Array (_ BitVec 32) ValueCell!6004)) (size!14372 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29177)

(declare-fun minValueAfter!38 () V!18031)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!18 (array!29175 array!29177 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18031 V!18031 V!18031 V!18031 (_ BitVec 32) Int) Unit!13484)

(assert (=> b!464650 (= lt!209805 (lemmaNoChangeToArrayThenSameMapNoExtras!18 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1838 (array!29175 array!29177 (_ BitVec 32) (_ BitVec 32) V!18031 V!18031 (_ BitVec 32) Int) ListLongMap!7285)

(assert (=> b!464650 (= lt!209807 (getCurrentListMapNoExtraKeys!1838 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464650 (= lt!209806 (getCurrentListMapNoExtraKeys!1838 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464651 () Bool)

(declare-fun res!277793 () Bool)

(assert (=> b!464651 (=> (not res!277793) (not e!271449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29175 (_ BitVec 32)) Bool)

(assert (=> b!464651 (= res!277793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464652 () Bool)

(declare-fun e!271451 () Bool)

(declare-fun tp_is_empty!12695 () Bool)

(assert (=> b!464652 (= e!271451 tp_is_empty!12695)))

(declare-fun b!464653 () Bool)

(declare-fun e!271448 () Bool)

(assert (=> b!464653 (= e!271448 (and e!271451 mapRes!20719))))

(declare-fun condMapEmpty!20719 () Bool)

(declare-fun mapDefault!20719 () ValueCell!6004)

