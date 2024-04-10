; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41926 () Bool)

(assert start!41926)

(declare-fun b_free!11515 () Bool)

(declare-fun b_next!11515 () Bool)

(assert (=> start!41926 (= b_free!11515 (not b_next!11515))))

(declare-fun tp!40558 () Bool)

(declare-fun b_and!19903 () Bool)

(assert (=> start!41926 (= tp!40558 b_and!19903)))

(declare-fun b!468086 () Bool)

(declare-fun res!279750 () Bool)

(declare-fun e!273903 () Bool)

(assert (=> b!468086 (=> (not res!279750) (not e!273903))))

(declare-datatypes ((array!29663 0))(
  ( (array!29664 (arr!14258 (Array (_ BitVec 32) (_ BitVec 64))) (size!14610 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29663)

(declare-datatypes ((List!8647 0))(
  ( (Nil!8644) (Cons!8643 (h!9499 (_ BitVec 64)) (t!14603 List!8647)) )
))
(declare-fun arrayNoDuplicates!0 (array!29663 (_ BitVec 32) List!8647) Bool)

(assert (=> b!468086 (= res!279750 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8644))))

(declare-fun mapIsEmpty!21106 () Bool)

(declare-fun mapRes!21106 () Bool)

(assert (=> mapIsEmpty!21106 mapRes!21106))

(declare-fun b!468087 () Bool)

(declare-fun e!273907 () Bool)

(declare-fun tp_is_empty!12943 () Bool)

(assert (=> b!468087 (= e!273907 tp_is_empty!12943)))

(declare-fun res!279749 () Bool)

(assert (=> start!41926 (=> (not res!279749) (not e!273903))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41926 (= res!279749 (validMask!0 mask!1365))))

(assert (=> start!41926 e!273903))

(assert (=> start!41926 tp_is_empty!12943))

(assert (=> start!41926 tp!40558))

(assert (=> start!41926 true))

(declare-fun array_inv!10294 (array!29663) Bool)

(assert (=> start!41926 (array_inv!10294 _keys!1025)))

(declare-datatypes ((V!18363 0))(
  ( (V!18364 (val!6516 Int)) )
))
(declare-datatypes ((ValueCell!6128 0))(
  ( (ValueCellFull!6128 (v!8805 V!18363)) (EmptyCell!6128) )
))
(declare-datatypes ((array!29665 0))(
  ( (array!29666 (arr!14259 (Array (_ BitVec 32) ValueCell!6128)) (size!14611 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29665)

(declare-fun e!273905 () Bool)

(declare-fun array_inv!10295 (array!29665) Bool)

(assert (=> start!41926 (and (array_inv!10295 _values!833) e!273905)))

(declare-fun b!468088 () Bool)

(declare-fun res!279751 () Bool)

(assert (=> b!468088 (=> (not res!279751) (not e!273903))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!468088 (= res!279751 (and (= (size!14611 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14610 _keys!1025) (size!14611 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21106 () Bool)

(declare-fun tp!40557 () Bool)

(declare-fun e!273902 () Bool)

(assert (=> mapNonEmpty!21106 (= mapRes!21106 (and tp!40557 e!273902))))

(declare-fun mapValue!21106 () ValueCell!6128)

(declare-fun mapKey!21106 () (_ BitVec 32))

(declare-fun mapRest!21106 () (Array (_ BitVec 32) ValueCell!6128))

(assert (=> mapNonEmpty!21106 (= (arr!14259 _values!833) (store mapRest!21106 mapKey!21106 mapValue!21106))))

(declare-fun b!468089 () Bool)

(declare-fun res!279748 () Bool)

(assert (=> b!468089 (=> (not res!279748) (not e!273903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29663 (_ BitVec 32)) Bool)

(assert (=> b!468089 (= res!279748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468090 () Bool)

(declare-fun e!273906 () Bool)

(assert (=> b!468090 (= e!273906 true)))

(declare-fun minValueBefore!38 () V!18363)

(declare-fun zeroValue!794 () V!18363)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8558 0))(
  ( (tuple2!8559 (_1!4290 (_ BitVec 64)) (_2!4290 V!18363)) )
))
(declare-datatypes ((List!8648 0))(
  ( (Nil!8645) (Cons!8644 (h!9500 tuple2!8558) (t!14604 List!8648)) )
))
(declare-datatypes ((ListLongMap!7471 0))(
  ( (ListLongMap!7472 (toList!3751 List!8648)) )
))
(declare-fun lt!211658 () ListLongMap!7471)

(declare-fun getCurrentListMap!2180 (array!29663 array!29665 (_ BitVec 32) (_ BitVec 32) V!18363 V!18363 (_ BitVec 32) Int) ListLongMap!7471)

(assert (=> b!468090 (= lt!211658 (getCurrentListMap!2180 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468091 () Bool)

(assert (=> b!468091 (= e!273903 (not e!273906))))

(declare-fun res!279747 () Bool)

(assert (=> b!468091 (=> res!279747 e!273906)))

(assert (=> b!468091 (= res!279747 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211659 () ListLongMap!7471)

(declare-fun lt!211657 () ListLongMap!7471)

(assert (=> b!468091 (= lt!211659 lt!211657)))

(declare-datatypes ((Unit!13660 0))(
  ( (Unit!13661) )
))
(declare-fun lt!211656 () Unit!13660)

(declare-fun minValueAfter!38 () V!18363)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!104 (array!29663 array!29665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18363 V!18363 V!18363 V!18363 (_ BitVec 32) Int) Unit!13660)

(assert (=> b!468091 (= lt!211656 (lemmaNoChangeToArrayThenSameMapNoExtras!104 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1924 (array!29663 array!29665 (_ BitVec 32) (_ BitVec 32) V!18363 V!18363 (_ BitVec 32) Int) ListLongMap!7471)

(assert (=> b!468091 (= lt!211657 (getCurrentListMapNoExtraKeys!1924 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468091 (= lt!211659 (getCurrentListMapNoExtraKeys!1924 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468092 () Bool)

(assert (=> b!468092 (= e!273905 (and e!273907 mapRes!21106))))

(declare-fun condMapEmpty!21106 () Bool)

(declare-fun mapDefault!21106 () ValueCell!6128)

