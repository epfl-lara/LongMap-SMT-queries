; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41840 () Bool)

(assert start!41840)

(declare-fun b_free!11443 () Bool)

(declare-fun b_next!11443 () Bool)

(assert (=> start!41840 (= b_free!11443 (not b_next!11443))))

(declare-fun tp!40339 () Bool)

(declare-fun b_and!19823 () Bool)

(assert (=> start!41840 (= tp!40339 b_and!19823)))

(declare-fun b!467198 () Bool)

(declare-fun e!273263 () Bool)

(declare-fun tp_is_empty!12871 () Bool)

(assert (=> b!467198 (= e!273263 tp_is_empty!12871)))

(declare-fun b!467199 () Bool)

(declare-fun e!273260 () Bool)

(assert (=> b!467199 (= e!273260 (not true))))

(declare-datatypes ((V!18267 0))(
  ( (V!18268 (val!6480 Int)) )
))
(declare-datatypes ((tuple2!8504 0))(
  ( (tuple2!8505 (_1!4263 (_ BitVec 64)) (_2!4263 V!18267)) )
))
(declare-datatypes ((List!8592 0))(
  ( (Nil!8589) (Cons!8588 (h!9444 tuple2!8504) (t!14546 List!8592)) )
))
(declare-datatypes ((ListLongMap!7417 0))(
  ( (ListLongMap!7418 (toList!3724 List!8592)) )
))
(declare-fun lt!211246 () ListLongMap!7417)

(declare-fun lt!211247 () ListLongMap!7417)

(assert (=> b!467199 (= lt!211246 lt!211247)))

(declare-datatypes ((Unit!13608 0))(
  ( (Unit!13609) )
))
(declare-fun lt!211245 () Unit!13608)

(declare-fun minValueBefore!38 () V!18267)

(declare-fun zeroValue!794 () V!18267)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29523 0))(
  ( (array!29524 (arr!14189 (Array (_ BitVec 32) (_ BitVec 64))) (size!14541 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29523)

(declare-datatypes ((ValueCell!6092 0))(
  ( (ValueCellFull!6092 (v!8769 V!18267)) (EmptyCell!6092) )
))
(declare-datatypes ((array!29525 0))(
  ( (array!29526 (arr!14190 (Array (_ BitVec 32) ValueCell!6092)) (size!14542 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29525)

(declare-fun minValueAfter!38 () V!18267)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!78 (array!29523 array!29525 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18267 V!18267 V!18267 V!18267 (_ BitVec 32) Int) Unit!13608)

(assert (=> b!467199 (= lt!211245 (lemmaNoChangeToArrayThenSameMapNoExtras!78 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1898 (array!29523 array!29525 (_ BitVec 32) (_ BitVec 32) V!18267 V!18267 (_ BitVec 32) Int) ListLongMap!7417)

(assert (=> b!467199 (= lt!211247 (getCurrentListMapNoExtraKeys!1898 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467199 (= lt!211246 (getCurrentListMapNoExtraKeys!1898 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467200 () Bool)

(declare-fun e!273261 () Bool)

(assert (=> b!467200 (= e!273261 tp_is_empty!12871)))

(declare-fun b!467201 () Bool)

(declare-fun res!279238 () Bool)

(assert (=> b!467201 (=> (not res!279238) (not e!273260))))

(declare-datatypes ((List!8593 0))(
  ( (Nil!8590) (Cons!8589 (h!9445 (_ BitVec 64)) (t!14547 List!8593)) )
))
(declare-fun arrayNoDuplicates!0 (array!29523 (_ BitVec 32) List!8593) Bool)

(assert (=> b!467201 (= res!279238 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8590))))

(declare-fun mapIsEmpty!20995 () Bool)

(declare-fun mapRes!20995 () Bool)

(assert (=> mapIsEmpty!20995 mapRes!20995))

(declare-fun b!467202 () Bool)

(declare-fun res!279237 () Bool)

(assert (=> b!467202 (=> (not res!279237) (not e!273260))))

(assert (=> b!467202 (= res!279237 (and (= (size!14542 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14541 _keys!1025) (size!14542 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20995 () Bool)

(declare-fun tp!40338 () Bool)

(assert (=> mapNonEmpty!20995 (= mapRes!20995 (and tp!40338 e!273261))))

(declare-fun mapRest!20995 () (Array (_ BitVec 32) ValueCell!6092))

(declare-fun mapValue!20995 () ValueCell!6092)

(declare-fun mapKey!20995 () (_ BitVec 32))

(assert (=> mapNonEmpty!20995 (= (arr!14190 _values!833) (store mapRest!20995 mapKey!20995 mapValue!20995))))

(declare-fun res!279240 () Bool)

(assert (=> start!41840 (=> (not res!279240) (not e!273260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41840 (= res!279240 (validMask!0 mask!1365))))

(assert (=> start!41840 e!273260))

(assert (=> start!41840 tp_is_empty!12871))

(assert (=> start!41840 tp!40339))

(assert (=> start!41840 true))

(declare-fun array_inv!10244 (array!29523) Bool)

(assert (=> start!41840 (array_inv!10244 _keys!1025)))

(declare-fun e!273264 () Bool)

(declare-fun array_inv!10245 (array!29525) Bool)

(assert (=> start!41840 (and (array_inv!10245 _values!833) e!273264)))

(declare-fun b!467203 () Bool)

(declare-fun res!279239 () Bool)

(assert (=> b!467203 (=> (not res!279239) (not e!273260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29523 (_ BitVec 32)) Bool)

(assert (=> b!467203 (= res!279239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467204 () Bool)

(assert (=> b!467204 (= e!273264 (and e!273263 mapRes!20995))))

(declare-fun condMapEmpty!20995 () Bool)

(declare-fun mapDefault!20995 () ValueCell!6092)

