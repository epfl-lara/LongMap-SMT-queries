; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41756 () Bool)

(assert start!41756)

(declare-fun b_free!11377 () Bool)

(declare-fun b_next!11377 () Bool)

(assert (=> start!41756 (= b_free!11377 (not b_next!11377))))

(declare-fun tp!40137 () Bool)

(declare-fun b_and!19745 () Bool)

(assert (=> start!41756 (= tp!40137 b_and!19745)))

(declare-fun b!466242 () Bool)

(declare-fun e!272579 () Bool)

(declare-fun e!272578 () Bool)

(assert (=> b!466242 (= e!272579 (not e!272578))))

(declare-fun res!278684 () Bool)

(assert (=> b!466242 (=> res!278684 e!272578)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!466242 (= res!278684 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!18179 0))(
  ( (V!18180 (val!6447 Int)) )
))
(declare-datatypes ((tuple2!8450 0))(
  ( (tuple2!8451 (_1!4236 (_ BitVec 64)) (_2!4236 V!18179)) )
))
(declare-datatypes ((List!8542 0))(
  ( (Nil!8539) (Cons!8538 (h!9394 tuple2!8450) (t!14494 List!8542)) )
))
(declare-datatypes ((ListLongMap!7363 0))(
  ( (ListLongMap!7364 (toList!3697 List!8542)) )
))
(declare-fun lt!210671 () ListLongMap!7363)

(declare-fun lt!210669 () ListLongMap!7363)

(assert (=> b!466242 (= lt!210671 lt!210669)))

(declare-fun minValueBefore!38 () V!18179)

(declare-fun zeroValue!794 () V!18179)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29393 0))(
  ( (array!29394 (arr!14125 (Array (_ BitVec 32) (_ BitVec 64))) (size!14477 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29393)

(declare-datatypes ((ValueCell!6059 0))(
  ( (ValueCellFull!6059 (v!8735 V!18179)) (EmptyCell!6059) )
))
(declare-datatypes ((array!29395 0))(
  ( (array!29396 (arr!14126 (Array (_ BitVec 32) ValueCell!6059)) (size!14478 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29395)

(declare-fun minValueAfter!38 () V!18179)

(declare-datatypes ((Unit!13560 0))(
  ( (Unit!13561) )
))
(declare-fun lt!210668 () Unit!13560)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!55 (array!29393 array!29395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18179 V!18179 V!18179 V!18179 (_ BitVec 32) Int) Unit!13560)

(assert (=> b!466242 (= lt!210668 (lemmaNoChangeToArrayThenSameMapNoExtras!55 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1875 (array!29393 array!29395 (_ BitVec 32) (_ BitVec 32) V!18179 V!18179 (_ BitVec 32) Int) ListLongMap!7363)

(assert (=> b!466242 (= lt!210669 (getCurrentListMapNoExtraKeys!1875 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466242 (= lt!210671 (getCurrentListMapNoExtraKeys!1875 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466243 () Bool)

(declare-fun e!272576 () Bool)

(declare-fun e!272581 () Bool)

(declare-fun mapRes!20893 () Bool)

(assert (=> b!466243 (= e!272576 (and e!272581 mapRes!20893))))

(declare-fun condMapEmpty!20893 () Bool)

(declare-fun mapDefault!20893 () ValueCell!6059)

