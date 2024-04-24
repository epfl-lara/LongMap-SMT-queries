; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41754 () Bool)

(assert start!41754)

(declare-fun b_free!11389 () Bool)

(declare-fun b_next!11389 () Bool)

(assert (=> start!41754 (= b_free!11389 (not b_next!11389))))

(declare-fun tp!40174 () Bool)

(declare-fun b_and!19767 () Bool)

(assert (=> start!41754 (= tp!40174 b_and!19767)))

(declare-fun b!466325 () Bool)

(declare-fun e!272646 () Bool)

(declare-fun e!272650 () Bool)

(declare-fun mapRes!20911 () Bool)

(assert (=> b!466325 (= e!272646 (and e!272650 mapRes!20911))))

(declare-fun condMapEmpty!20911 () Bool)

(declare-datatypes ((V!18195 0))(
  ( (V!18196 (val!6453 Int)) )
))
(declare-datatypes ((ValueCell!6065 0))(
  ( (ValueCellFull!6065 (v!8742 V!18195)) (EmptyCell!6065) )
))
(declare-datatypes ((array!29414 0))(
  ( (array!29415 (arr!14135 (Array (_ BitVec 32) ValueCell!6065)) (size!14487 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29414)

(declare-fun mapDefault!20911 () ValueCell!6065)

(assert (=> b!466325 (= condMapEmpty!20911 (= (arr!14135 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6065)) mapDefault!20911)))))

(declare-fun b!466326 () Bool)

(declare-fun e!272649 () Bool)

(declare-fun tp_is_empty!12817 () Bool)

(assert (=> b!466326 (= e!272649 tp_is_empty!12817)))

(declare-fun b!466327 () Bool)

(declare-fun res!278766 () Bool)

(declare-fun e!272647 () Bool)

(assert (=> b!466327 (=> (not res!278766) (not e!272647))))

(declare-datatypes ((array!29416 0))(
  ( (array!29417 (arr!14136 (Array (_ BitVec 32) (_ BitVec 64))) (size!14488 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29416)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29416 (_ BitVec 32)) Bool)

(assert (=> b!466327 (= res!278766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466328 () Bool)

(declare-fun e!272645 () Bool)

(assert (=> b!466328 (= e!272647 (not e!272645))))

(declare-fun res!278764 () Bool)

(assert (=> b!466328 (=> res!278764 e!272645)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!466328 (= res!278764 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8398 0))(
  ( (tuple2!8399 (_1!4210 (_ BitVec 64)) (_2!4210 V!18195)) )
))
(declare-datatypes ((List!8481 0))(
  ( (Nil!8478) (Cons!8477 (h!9333 tuple2!8398) (t!14425 List!8481)) )
))
(declare-datatypes ((ListLongMap!7313 0))(
  ( (ListLongMap!7314 (toList!3672 List!8481)) )
))
(declare-fun lt!210774 () ListLongMap!7313)

(declare-fun lt!210772 () ListLongMap!7313)

(assert (=> b!466328 (= lt!210774 lt!210772)))

(declare-fun minValueBefore!38 () V!18195)

(declare-fun zeroValue!794 () V!18195)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13558 0))(
  ( (Unit!13559) )
))
(declare-fun lt!210771 () Unit!13558)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18195)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!56 (array!29416 array!29414 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18195 V!18195 V!18195 V!18195 (_ BitVec 32) Int) Unit!13558)

(assert (=> b!466328 (= lt!210771 (lemmaNoChangeToArrayThenSameMapNoExtras!56 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1896 (array!29416 array!29414 (_ BitVec 32) (_ BitVec 32) V!18195 V!18195 (_ BitVec 32) Int) ListLongMap!7313)

(assert (=> b!466328 (= lt!210772 (getCurrentListMapNoExtraKeys!1896 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466328 (= lt!210774 (getCurrentListMapNoExtraKeys!1896 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20911 () Bool)

(assert (=> mapIsEmpty!20911 mapRes!20911))

(declare-fun res!278763 () Bool)

(assert (=> start!41754 (=> (not res!278763) (not e!272647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41754 (= res!278763 (validMask!0 mask!1365))))

(assert (=> start!41754 e!272647))

(assert (=> start!41754 tp_is_empty!12817))

(assert (=> start!41754 tp!40174))

(assert (=> start!41754 true))

(declare-fun array_inv!10292 (array!29416) Bool)

(assert (=> start!41754 (array_inv!10292 _keys!1025)))

(declare-fun array_inv!10293 (array!29414) Bool)

(assert (=> start!41754 (and (array_inv!10293 _values!833) e!272646)))

(declare-fun b!466329 () Bool)

(declare-fun res!278765 () Bool)

(assert (=> b!466329 (=> (not res!278765) (not e!272647))))

(declare-datatypes ((List!8482 0))(
  ( (Nil!8479) (Cons!8478 (h!9334 (_ BitVec 64)) (t!14426 List!8482)) )
))
(declare-fun arrayNoDuplicates!0 (array!29416 (_ BitVec 32) List!8482) Bool)

(assert (=> b!466329 (= res!278765 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8479))))

(declare-fun b!466330 () Bool)

(assert (=> b!466330 (= e!272650 tp_is_empty!12817)))

(declare-fun b!466331 () Bool)

(assert (=> b!466331 (= e!272645 true)))

(declare-fun lt!210770 () ListLongMap!7313)

(declare-fun getCurrentListMap!2121 (array!29416 array!29414 (_ BitVec 32) (_ BitVec 32) V!18195 V!18195 (_ BitVec 32) Int) ListLongMap!7313)

(assert (=> b!466331 (= lt!210770 (getCurrentListMap!2121 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210773 () ListLongMap!7313)

(declare-fun +!1670 (ListLongMap!7313 tuple2!8398) ListLongMap!7313)

(assert (=> b!466331 (= lt!210773 (+!1670 (getCurrentListMap!2121 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8399 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun mapNonEmpty!20911 () Bool)

(declare-fun tp!40173 () Bool)

(assert (=> mapNonEmpty!20911 (= mapRes!20911 (and tp!40173 e!272649))))

(declare-fun mapValue!20911 () ValueCell!6065)

(declare-fun mapRest!20911 () (Array (_ BitVec 32) ValueCell!6065))

(declare-fun mapKey!20911 () (_ BitVec 32))

(assert (=> mapNonEmpty!20911 (= (arr!14135 _values!833) (store mapRest!20911 mapKey!20911 mapValue!20911))))

(declare-fun b!466332 () Bool)

(declare-fun res!278767 () Bool)

(assert (=> b!466332 (=> (not res!278767) (not e!272647))))

(assert (=> b!466332 (= res!278767 (and (= (size!14487 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14488 _keys!1025) (size!14487 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41754 res!278763) b!466332))

(assert (= (and b!466332 res!278767) b!466327))

(assert (= (and b!466327 res!278766) b!466329))

(assert (= (and b!466329 res!278765) b!466328))

(assert (= (and b!466328 (not res!278764)) b!466331))

(assert (= (and b!466325 condMapEmpty!20911) mapIsEmpty!20911))

(assert (= (and b!466325 (not condMapEmpty!20911)) mapNonEmpty!20911))

(get-info :version)

(assert (= (and mapNonEmpty!20911 ((_ is ValueCellFull!6065) mapValue!20911)) b!466326))

(assert (= (and b!466325 ((_ is ValueCellFull!6065) mapDefault!20911)) b!466330))

(assert (= start!41754 b!466325))

(declare-fun m!448785 () Bool)

(assert (=> start!41754 m!448785))

(declare-fun m!448787 () Bool)

(assert (=> start!41754 m!448787))

(declare-fun m!448789 () Bool)

(assert (=> start!41754 m!448789))

(declare-fun m!448791 () Bool)

(assert (=> mapNonEmpty!20911 m!448791))

(declare-fun m!448793 () Bool)

(assert (=> b!466327 m!448793))

(declare-fun m!448795 () Bool)

(assert (=> b!466328 m!448795))

(declare-fun m!448797 () Bool)

(assert (=> b!466328 m!448797))

(declare-fun m!448799 () Bool)

(assert (=> b!466328 m!448799))

(declare-fun m!448801 () Bool)

(assert (=> b!466331 m!448801))

(declare-fun m!448803 () Bool)

(assert (=> b!466331 m!448803))

(assert (=> b!466331 m!448803))

(declare-fun m!448805 () Bool)

(assert (=> b!466331 m!448805))

(declare-fun m!448807 () Bool)

(assert (=> b!466329 m!448807))

(check-sat tp_is_empty!12817 (not b!466328) (not b!466327) (not start!41754) b_and!19767 (not b!466329) (not b!466331) (not mapNonEmpty!20911) (not b_next!11389))
(check-sat b_and!19767 (not b_next!11389))
