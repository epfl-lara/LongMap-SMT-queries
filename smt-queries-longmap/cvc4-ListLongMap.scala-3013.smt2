; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42416 () Bool)

(assert start!42416)

(declare-fun b_free!11891 () Bool)

(declare-fun b_next!11891 () Bool)

(assert (=> start!42416 (= b_free!11891 (not b_next!11891))))

(declare-fun tp!41706 () Bool)

(declare-fun b_and!20347 () Bool)

(assert (=> start!42416 (= tp!41706 b_and!20347)))

(declare-fun b!473264 () Bool)

(declare-fun res!282690 () Bool)

(declare-fun e!277625 () Bool)

(assert (=> b!473264 (=> (not res!282690) (not e!277625))))

(declare-datatypes ((array!30397 0))(
  ( (array!30398 (arr!14618 (Array (_ BitVec 32) (_ BitVec 64))) (size!14970 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30397)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30397 (_ BitVec 32)) Bool)

(assert (=> b!473264 (= res!282690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473265 () Bool)

(declare-fun e!277621 () Bool)

(declare-fun tp_is_empty!13319 () Bool)

(assert (=> b!473265 (= e!277621 tp_is_empty!13319)))

(declare-fun mapIsEmpty!21691 () Bool)

(declare-fun mapRes!21691 () Bool)

(assert (=> mapIsEmpty!21691 mapRes!21691))

(declare-fun b!473267 () Bool)

(declare-fun e!277622 () Bool)

(assert (=> b!473267 (= e!277622 tp_is_empty!13319)))

(declare-fun b!473268 () Bool)

(declare-fun e!277620 () Bool)

(assert (=> b!473268 (= e!277620 true)))

(declare-datatypes ((V!18863 0))(
  ( (V!18864 (val!6704 Int)) )
))
(declare-datatypes ((tuple2!8832 0))(
  ( (tuple2!8833 (_1!4427 (_ BitVec 64)) (_2!4427 V!18863)) )
))
(declare-datatypes ((List!8915 0))(
  ( (Nil!8912) (Cons!8911 (h!9767 tuple2!8832) (t!14885 List!8915)) )
))
(declare-datatypes ((ListLongMap!7745 0))(
  ( (ListLongMap!7746 (toList!3888 List!8915)) )
))
(declare-fun lt!214970 () ListLongMap!7745)

(declare-fun lt!214969 () tuple2!8832)

(declare-fun minValueBefore!38 () V!18863)

(declare-fun +!1727 (ListLongMap!7745 tuple2!8832) ListLongMap!7745)

(assert (=> b!473268 (= (+!1727 lt!214970 lt!214969) (+!1727 (+!1727 lt!214970 (tuple2!8833 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214969))))

(declare-fun minValueAfter!38 () V!18863)

(assert (=> b!473268 (= lt!214969 (tuple2!8833 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13932 0))(
  ( (Unit!13933) )
))
(declare-fun lt!214971 () Unit!13932)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!136 (ListLongMap!7745 (_ BitVec 64) V!18863 V!18863) Unit!13932)

(assert (=> b!473268 (= lt!214971 (addSameAsAddTwiceSameKeyDiffValues!136 lt!214970 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!214968 () ListLongMap!7745)

(declare-fun zeroValue!794 () V!18863)

(assert (=> b!473268 (= lt!214970 (+!1727 lt!214968 (tuple2!8833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!214965 () ListLongMap!7745)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6316 0))(
  ( (ValueCellFull!6316 (v!8995 V!18863)) (EmptyCell!6316) )
))
(declare-datatypes ((array!30399 0))(
  ( (array!30400 (arr!14619 (Array (_ BitVec 32) ValueCell!6316)) (size!14971 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30399)

(declare-fun getCurrentListMap!2256 (array!30397 array!30399 (_ BitVec 32) (_ BitVec 32) V!18863 V!18863 (_ BitVec 32) Int) ListLongMap!7745)

(assert (=> b!473268 (= lt!214965 (getCurrentListMap!2256 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214966 () ListLongMap!7745)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473268 (= lt!214966 (getCurrentListMap!2256 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21691 () Bool)

(declare-fun tp!41707 () Bool)

(assert (=> mapNonEmpty!21691 (= mapRes!21691 (and tp!41707 e!277622))))

(declare-fun mapKey!21691 () (_ BitVec 32))

(declare-fun mapValue!21691 () ValueCell!6316)

(declare-fun mapRest!21691 () (Array (_ BitVec 32) ValueCell!6316))

(assert (=> mapNonEmpty!21691 (= (arr!14619 _values!833) (store mapRest!21691 mapKey!21691 mapValue!21691))))

(declare-fun b!473269 () Bool)

(assert (=> b!473269 (= e!277625 (not e!277620))))

(declare-fun res!282687 () Bool)

(assert (=> b!473269 (=> res!282687 e!277620)))

(assert (=> b!473269 (= res!282687 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214967 () ListLongMap!7745)

(assert (=> b!473269 (= lt!214968 lt!214967)))

(declare-fun lt!214972 () Unit!13932)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!228 (array!30397 array!30399 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18863 V!18863 V!18863 V!18863 (_ BitVec 32) Int) Unit!13932)

(assert (=> b!473269 (= lt!214972 (lemmaNoChangeToArrayThenSameMapNoExtras!228 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2048 (array!30397 array!30399 (_ BitVec 32) (_ BitVec 32) V!18863 V!18863 (_ BitVec 32) Int) ListLongMap!7745)

(assert (=> b!473269 (= lt!214967 (getCurrentListMapNoExtraKeys!2048 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473269 (= lt!214968 (getCurrentListMapNoExtraKeys!2048 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473270 () Bool)

(declare-fun res!282691 () Bool)

(assert (=> b!473270 (=> (not res!282691) (not e!277625))))

(assert (=> b!473270 (= res!282691 (and (= (size!14971 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14970 _keys!1025) (size!14971 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473271 () Bool)

(declare-fun e!277623 () Bool)

(assert (=> b!473271 (= e!277623 (and e!277621 mapRes!21691))))

(declare-fun condMapEmpty!21691 () Bool)

(declare-fun mapDefault!21691 () ValueCell!6316)

