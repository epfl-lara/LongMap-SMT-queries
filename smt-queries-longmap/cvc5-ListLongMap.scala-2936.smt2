; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41804 () Bool)

(assert start!41804)

(declare-fun b_free!11425 () Bool)

(declare-fun b_next!11425 () Bool)

(assert (=> start!41804 (= b_free!11425 (not b_next!11425))))

(declare-fun tp!40282 () Bool)

(declare-fun b_and!19793 () Bool)

(assert (=> start!41804 (= tp!40282 b_and!19793)))

(declare-fun res!279043 () Bool)

(declare-fun e!273011 () Bool)

(assert (=> start!41804 (=> (not res!279043) (not e!273011))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41804 (= res!279043 (validMask!0 mask!1365))))

(assert (=> start!41804 e!273011))

(declare-fun tp_is_empty!12853 () Bool)

(assert (=> start!41804 tp_is_empty!12853))

(assert (=> start!41804 tp!40282))

(assert (=> start!41804 true))

(declare-datatypes ((array!29487 0))(
  ( (array!29488 (arr!14172 (Array (_ BitVec 32) (_ BitVec 64))) (size!14524 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29487)

(declare-fun array_inv!10232 (array!29487) Bool)

(assert (=> start!41804 (array_inv!10232 _keys!1025)))

(declare-datatypes ((V!18243 0))(
  ( (V!18244 (val!6471 Int)) )
))
(declare-datatypes ((ValueCell!6083 0))(
  ( (ValueCellFull!6083 (v!8759 V!18243)) (EmptyCell!6083) )
))
(declare-datatypes ((array!29489 0))(
  ( (array!29490 (arr!14173 (Array (_ BitVec 32) ValueCell!6083)) (size!14525 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29489)

(declare-fun e!273009 () Bool)

(declare-fun array_inv!10233 (array!29489) Bool)

(assert (=> start!41804 (and (array_inv!10233 _values!833) e!273009)))

(declare-fun b!466820 () Bool)

(declare-fun e!273008 () Bool)

(assert (=> b!466820 (= e!273008 tp_is_empty!12853)))

(declare-fun mapIsEmpty!20965 () Bool)

(declare-fun mapRes!20965 () Bool)

(assert (=> mapIsEmpty!20965 mapRes!20965))

(declare-fun b!466821 () Bool)

(declare-fun res!279046 () Bool)

(assert (=> b!466821 (=> (not res!279046) (not e!273011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29487 (_ BitVec 32)) Bool)

(assert (=> b!466821 (= res!279046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20965 () Bool)

(declare-fun tp!40281 () Bool)

(assert (=> mapNonEmpty!20965 (= mapRes!20965 (and tp!40281 e!273008))))

(declare-fun mapValue!20965 () ValueCell!6083)

(declare-fun mapRest!20965 () (Array (_ BitVec 32) ValueCell!6083))

(declare-fun mapKey!20965 () (_ BitVec 32))

(assert (=> mapNonEmpty!20965 (= (arr!14173 _values!833) (store mapRest!20965 mapKey!20965 mapValue!20965))))

(declare-fun b!466822 () Bool)

(declare-fun res!279045 () Bool)

(assert (=> b!466822 (=> (not res!279045) (not e!273011))))

(declare-datatypes ((List!8578 0))(
  ( (Nil!8575) (Cons!8574 (h!9430 (_ BitVec 64)) (t!14530 List!8578)) )
))
(declare-fun arrayNoDuplicates!0 (array!29487 (_ BitVec 32) List!8578) Bool)

(assert (=> b!466822 (= res!279045 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8575))))

(declare-fun b!466823 () Bool)

(declare-fun e!273010 () Bool)

(assert (=> b!466823 (= e!273011 (not e!273010))))

(declare-fun res!279042 () Bool)

(assert (=> b!466823 (=> res!279042 e!273010)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!466823 (= res!279042 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8488 0))(
  ( (tuple2!8489 (_1!4255 (_ BitVec 64)) (_2!4255 V!18243)) )
))
(declare-datatypes ((List!8579 0))(
  ( (Nil!8576) (Cons!8575 (h!9431 tuple2!8488) (t!14531 List!8579)) )
))
(declare-datatypes ((ListLongMap!7401 0))(
  ( (ListLongMap!7402 (toList!3716 List!8579)) )
))
(declare-fun lt!211026 () ListLongMap!7401)

(declare-fun lt!211025 () ListLongMap!7401)

(assert (=> b!466823 (= lt!211026 lt!211025)))

(declare-fun minValueBefore!38 () V!18243)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13592 0))(
  ( (Unit!13593) )
))
(declare-fun lt!211024 () Unit!13592)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun zeroValue!794 () V!18243)

(declare-fun minValueAfter!38 () V!18243)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!71 (array!29487 array!29489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18243 V!18243 V!18243 V!18243 (_ BitVec 32) Int) Unit!13592)

(assert (=> b!466823 (= lt!211024 (lemmaNoChangeToArrayThenSameMapNoExtras!71 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1891 (array!29487 array!29489 (_ BitVec 32) (_ BitVec 32) V!18243 V!18243 (_ BitVec 32) Int) ListLongMap!7401)

(assert (=> b!466823 (= lt!211025 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466823 (= lt!211026 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466824 () Bool)

(declare-fun res!279044 () Bool)

(assert (=> b!466824 (=> (not res!279044) (not e!273011))))

(assert (=> b!466824 (= res!279044 (and (= (size!14525 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14524 _keys!1025) (size!14525 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466825 () Bool)

(declare-fun e!273013 () Bool)

(assert (=> b!466825 (= e!273009 (and e!273013 mapRes!20965))))

(declare-fun condMapEmpty!20965 () Bool)

(declare-fun mapDefault!20965 () ValueCell!6083)

