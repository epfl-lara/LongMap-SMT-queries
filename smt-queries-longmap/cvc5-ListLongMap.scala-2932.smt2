; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41780 () Bool)

(assert start!41780)

(declare-fun b_free!11401 () Bool)

(declare-fun b_next!11401 () Bool)

(assert (=> start!41780 (= b_free!11401 (not b_next!11401))))

(declare-fun tp!40210 () Bool)

(declare-fun b_and!19769 () Bool)

(assert (=> start!41780 (= tp!40210 b_and!19769)))

(declare-fun b!466530 () Bool)

(declare-fun res!278860 () Bool)

(declare-fun e!272794 () Bool)

(assert (=> b!466530 (=> (not res!278860) (not e!272794))))

(declare-datatypes ((array!29441 0))(
  ( (array!29442 (arr!14149 (Array (_ BitVec 32) (_ BitVec 64))) (size!14501 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29441)

(declare-datatypes ((List!8562 0))(
  ( (Nil!8559) (Cons!8558 (h!9414 (_ BitVec 64)) (t!14514 List!8562)) )
))
(declare-fun arrayNoDuplicates!0 (array!29441 (_ BitVec 32) List!8562) Bool)

(assert (=> b!466530 (= res!278860 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8559))))

(declare-fun b!466531 () Bool)

(declare-fun e!272793 () Bool)

(assert (=> b!466531 (= e!272794 (not e!272793))))

(declare-fun res!278863 () Bool)

(assert (=> b!466531 (=> res!278863 e!272793)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!466531 (= res!278863 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!18211 0))(
  ( (V!18212 (val!6459 Int)) )
))
(declare-datatypes ((tuple2!8472 0))(
  ( (tuple2!8473 (_1!4247 (_ BitVec 64)) (_2!4247 V!18211)) )
))
(declare-datatypes ((List!8563 0))(
  ( (Nil!8560) (Cons!8559 (h!9415 tuple2!8472) (t!14515 List!8563)) )
))
(declare-datatypes ((ListLongMap!7385 0))(
  ( (ListLongMap!7386 (toList!3708 List!8563)) )
))
(declare-fun lt!210849 () ListLongMap!7385)

(declare-fun lt!210851 () ListLongMap!7385)

(assert (=> b!466531 (= lt!210849 lt!210851)))

(declare-fun minValueBefore!38 () V!18211)

(declare-fun zeroValue!794 () V!18211)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13578 0))(
  ( (Unit!13579) )
))
(declare-fun lt!210848 () Unit!13578)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6071 0))(
  ( (ValueCellFull!6071 (v!8747 V!18211)) (EmptyCell!6071) )
))
(declare-datatypes ((array!29443 0))(
  ( (array!29444 (arr!14150 (Array (_ BitVec 32) ValueCell!6071)) (size!14502 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29443)

(declare-fun minValueAfter!38 () V!18211)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!64 (array!29441 array!29443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18211 V!18211 V!18211 V!18211 (_ BitVec 32) Int) Unit!13578)

(assert (=> b!466531 (= lt!210848 (lemmaNoChangeToArrayThenSameMapNoExtras!64 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1884 (array!29441 array!29443 (_ BitVec 32) (_ BitVec 32) V!18211 V!18211 (_ BitVec 32) Int) ListLongMap!7385)

(assert (=> b!466531 (= lt!210851 (getCurrentListMapNoExtraKeys!1884 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466531 (= lt!210849 (getCurrentListMapNoExtraKeys!1884 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466532 () Bool)

(assert (=> b!466532 (= e!272793 true)))

(declare-fun lt!210852 () ListLongMap!7385)

(declare-fun getCurrentListMap!2158 (array!29441 array!29443 (_ BitVec 32) (_ BitVec 32) V!18211 V!18211 (_ BitVec 32) Int) ListLongMap!7385)

(assert (=> b!466532 (= lt!210852 (getCurrentListMap!2158 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210850 () ListLongMap!7385)

(declare-fun +!1664 (ListLongMap!7385 tuple2!8472) ListLongMap!7385)

(assert (=> b!466532 (= lt!210850 (+!1664 (getCurrentListMap!2158 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8473 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466533 () Bool)

(declare-fun res!278864 () Bool)

(assert (=> b!466533 (=> (not res!278864) (not e!272794))))

(assert (=> b!466533 (= res!278864 (and (= (size!14502 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14501 _keys!1025) (size!14502 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20929 () Bool)

(declare-fun mapRes!20929 () Bool)

(declare-fun tp!40209 () Bool)

(declare-fun e!272796 () Bool)

(assert (=> mapNonEmpty!20929 (= mapRes!20929 (and tp!40209 e!272796))))

(declare-fun mapRest!20929 () (Array (_ BitVec 32) ValueCell!6071))

(declare-fun mapValue!20929 () ValueCell!6071)

(declare-fun mapKey!20929 () (_ BitVec 32))

(assert (=> mapNonEmpty!20929 (= (arr!14150 _values!833) (store mapRest!20929 mapKey!20929 mapValue!20929))))

(declare-fun b!466534 () Bool)

(declare-fun e!272797 () Bool)

(declare-fun e!272792 () Bool)

(assert (=> b!466534 (= e!272797 (and e!272792 mapRes!20929))))

(declare-fun condMapEmpty!20929 () Bool)

(declare-fun mapDefault!20929 () ValueCell!6071)

