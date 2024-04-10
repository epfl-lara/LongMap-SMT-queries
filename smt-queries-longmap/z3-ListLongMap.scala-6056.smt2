; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78384 () Bool)

(assert start!78384)

(declare-fun b_free!16749 () Bool)

(declare-fun b_next!16749 () Bool)

(assert (=> start!78384 (= b_free!16749 (not b_next!16749))))

(declare-fun tp!58535 () Bool)

(declare-fun b_and!27365 () Bool)

(assert (=> start!78384 (= tp!58535 b_and!27365)))

(declare-fun b!914367 () Bool)

(declare-fun e!512942 () Bool)

(declare-fun e!512938 () Bool)

(assert (=> b!914367 (= e!512942 e!512938)))

(declare-fun res!616656 () Bool)

(assert (=> b!914367 (=> res!616656 e!512938)))

(declare-datatypes ((V!30521 0))(
  ( (V!30522 (val!9634 Int)) )
))
(declare-datatypes ((tuple2!12558 0))(
  ( (tuple2!12559 (_1!6290 (_ BitVec 64)) (_2!6290 V!30521)) )
))
(declare-datatypes ((List!18346 0))(
  ( (Nil!18343) (Cons!18342 (h!19488 tuple2!12558) (t!25955 List!18346)) )
))
(declare-datatypes ((ListLongMap!11255 0))(
  ( (ListLongMap!11256 (toList!5643 List!18346)) )
))
(declare-fun lt!411464 () ListLongMap!11255)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4693 (ListLongMap!11255 (_ BitVec 64)) Bool)

(assert (=> b!914367 (= res!616656 (not (contains!4693 lt!411464 k0!1033)))))

(declare-datatypes ((ValueCell!9102 0))(
  ( (ValueCellFull!9102 (v!12150 V!30521)) (EmptyCell!9102) )
))
(declare-datatypes ((array!54326 0))(
  ( (array!54327 (arr!26114 (Array (_ BitVec 32) ValueCell!9102)) (size!26573 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54326)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30521)

(declare-datatypes ((array!54328 0))(
  ( (array!54329 (arr!26115 (Array (_ BitVec 32) (_ BitVec 64))) (size!26574 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54328)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30521)

(declare-fun getCurrentListMap!2904 (array!54328 array!54326 (_ BitVec 32) (_ BitVec 32) V!30521 V!30521 (_ BitVec 32) Int) ListLongMap!11255)

(assert (=> b!914367 (= lt!411464 (getCurrentListMap!2904 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!30489 () Bool)

(declare-fun mapRes!30489 () Bool)

(declare-fun tp!58534 () Bool)

(declare-fun e!512939 () Bool)

(assert (=> mapNonEmpty!30489 (= mapRes!30489 (and tp!58534 e!512939))))

(declare-fun mapRest!30489 () (Array (_ BitVec 32) ValueCell!9102))

(declare-fun mapKey!30489 () (_ BitVec 32))

(declare-fun mapValue!30489 () ValueCell!9102)

(assert (=> mapNonEmpty!30489 (= (arr!26114 _values!1152) (store mapRest!30489 mapKey!30489 mapValue!30489))))

(declare-fun mapIsEmpty!30489 () Bool)

(assert (=> mapIsEmpty!30489 mapRes!30489))

(declare-fun b!914368 () Bool)

(declare-fun e!512945 () Bool)

(assert (=> b!914368 (= e!512945 (not e!512942))))

(declare-fun res!616654 () Bool)

(assert (=> b!914368 (=> res!616654 e!512942)))

(assert (=> b!914368 (= res!616654 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26574 _keys!1386))))))

(declare-fun lt!411462 () V!30521)

(declare-fun get!13717 (ValueCell!9102 V!30521) V!30521)

(declare-fun dynLambda!1398 (Int (_ BitVec 64)) V!30521)

(assert (=> b!914368 (= lt!411462 (get!13717 (select (arr!26114 _values!1152) i!717) (dynLambda!1398 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!54328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!914368 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30954 0))(
  ( (Unit!30955) )
))
(declare-fun lt!411461 () Unit!30954)

(declare-fun lemmaKeyInListMapIsInArray!289 (array!54328 array!54326 (_ BitVec 32) (_ BitVec 32) V!30521 V!30521 (_ BitVec 64) Int) Unit!30954)

(assert (=> b!914368 (= lt!411461 (lemmaKeyInListMapIsInArray!289 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!914369 () Bool)

(declare-fun res!616655 () Bool)

(declare-fun e!512941 () Bool)

(assert (=> b!914369 (=> (not res!616655) (not e!512941))))

(assert (=> b!914369 (= res!616655 (and (= (size!26573 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26574 _keys!1386) (size!26573 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!914371 () Bool)

(declare-fun res!616659 () Bool)

(assert (=> b!914371 (=> (not res!616659) (not e!512941))))

(declare-datatypes ((List!18347 0))(
  ( (Nil!18344) (Cons!18343 (h!19489 (_ BitVec 64)) (t!25956 List!18347)) )
))
(declare-fun arrayNoDuplicates!0 (array!54328 (_ BitVec 32) List!18347) Bool)

(assert (=> b!914371 (= res!616659 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18344))))

(declare-fun b!914372 () Bool)

(declare-fun res!616652 () Bool)

(assert (=> b!914372 (=> res!616652 e!512938)))

(declare-fun apply!521 (ListLongMap!11255 (_ BitVec 64)) V!30521)

(assert (=> b!914372 (= res!616652 (not (= (apply!521 lt!411464 k0!1033) lt!411462)))))

(declare-fun b!914373 () Bool)

(declare-fun e!512943 () Bool)

(declare-fun tp_is_empty!19167 () Bool)

(assert (=> b!914373 (= e!512943 tp_is_empty!19167)))

(declare-fun b!914374 () Bool)

(declare-fun res!616658 () Bool)

(assert (=> b!914374 (=> (not res!616658) (not e!512945))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!914374 (= res!616658 (inRange!0 i!717 mask!1756))))

(declare-fun b!914370 () Bool)

(assert (=> b!914370 (= e!512939 tp_is_empty!19167)))

(declare-fun res!616660 () Bool)

(assert (=> start!78384 (=> (not res!616660) (not e!512941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78384 (= res!616660 (validMask!0 mask!1756))))

(assert (=> start!78384 e!512941))

(declare-fun e!512944 () Bool)

(declare-fun array_inv!20394 (array!54326) Bool)

(assert (=> start!78384 (and (array_inv!20394 _values!1152) e!512944)))

(assert (=> start!78384 tp!58535))

(assert (=> start!78384 true))

(assert (=> start!78384 tp_is_empty!19167))

(declare-fun array_inv!20395 (array!54328) Bool)

(assert (=> start!78384 (array_inv!20395 _keys!1386)))

(declare-fun b!914375 () Bool)

(assert (=> b!914375 (= e!512941 e!512945)))

(declare-fun res!616653 () Bool)

(assert (=> b!914375 (=> (not res!616653) (not e!512945))))

(declare-fun lt!411465 () ListLongMap!11255)

(assert (=> b!914375 (= res!616653 (contains!4693 lt!411465 k0!1033))))

(assert (=> b!914375 (= lt!411465 (getCurrentListMap!2904 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!914376 () Bool)

(declare-fun res!616657 () Bool)

(assert (=> b!914376 (=> (not res!616657) (not e!512945))))

(assert (=> b!914376 (= res!616657 (and (= (select (arr!26115 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!914377 () Bool)

(assert (=> b!914377 (= e!512944 (and e!512943 mapRes!30489))))

(declare-fun condMapEmpty!30489 () Bool)

(declare-fun mapDefault!30489 () ValueCell!9102)

(assert (=> b!914377 (= condMapEmpty!30489 (= (arr!26114 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9102)) mapDefault!30489)))))

(declare-fun b!914378 () Bool)

(assert (=> b!914378 (= e!512938 true)))

(assert (=> b!914378 (= (apply!521 lt!411465 k0!1033) lt!411462)))

(declare-fun lt!411463 () Unit!30954)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!64 (array!54328 array!54326 (_ BitVec 32) (_ BitVec 32) V!30521 V!30521 (_ BitVec 64) V!30521 (_ BitVec 32) Int) Unit!30954)

(assert (=> b!914378 (= lt!411463 (lemmaListMapApplyFromThenApplyFromZero!64 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!411462 i!717 defaultEntry!1160))))

(declare-fun b!914379 () Bool)

(declare-fun res!616661 () Bool)

(assert (=> b!914379 (=> (not res!616661) (not e!512941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54328 (_ BitVec 32)) Bool)

(assert (=> b!914379 (= res!616661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78384 res!616660) b!914369))

(assert (= (and b!914369 res!616655) b!914379))

(assert (= (and b!914379 res!616661) b!914371))

(assert (= (and b!914371 res!616659) b!914375))

(assert (= (and b!914375 res!616653) b!914374))

(assert (= (and b!914374 res!616658) b!914376))

(assert (= (and b!914376 res!616657) b!914368))

(assert (= (and b!914368 (not res!616654)) b!914367))

(assert (= (and b!914367 (not res!616656)) b!914372))

(assert (= (and b!914372 (not res!616652)) b!914378))

(assert (= (and b!914377 condMapEmpty!30489) mapIsEmpty!30489))

(assert (= (and b!914377 (not condMapEmpty!30489)) mapNonEmpty!30489))

(get-info :version)

(assert (= (and mapNonEmpty!30489 ((_ is ValueCellFull!9102) mapValue!30489)) b!914370))

(assert (= (and b!914377 ((_ is ValueCellFull!9102) mapDefault!30489)) b!914373))

(assert (= start!78384 b!914377))

(declare-fun b_lambda!13379 () Bool)

(assert (=> (not b_lambda!13379) (not b!914368)))

(declare-fun t!25954 () Bool)

(declare-fun tb!5459 () Bool)

(assert (=> (and start!78384 (= defaultEntry!1160 defaultEntry!1160) t!25954) tb!5459))

(declare-fun result!10729 () Bool)

(assert (=> tb!5459 (= result!10729 tp_is_empty!19167)))

(assert (=> b!914368 t!25954))

(declare-fun b_and!27367 () Bool)

(assert (= b_and!27365 (and (=> t!25954 result!10729) b_and!27367)))

(declare-fun m!849095 () Bool)

(assert (=> b!914374 m!849095))

(declare-fun m!849097 () Bool)

(assert (=> start!78384 m!849097))

(declare-fun m!849099 () Bool)

(assert (=> start!78384 m!849099))

(declare-fun m!849101 () Bool)

(assert (=> start!78384 m!849101))

(declare-fun m!849103 () Bool)

(assert (=> mapNonEmpty!30489 m!849103))

(declare-fun m!849105 () Bool)

(assert (=> b!914379 m!849105))

(declare-fun m!849107 () Bool)

(assert (=> b!914367 m!849107))

(declare-fun m!849109 () Bool)

(assert (=> b!914367 m!849109))

(declare-fun m!849111 () Bool)

(assert (=> b!914368 m!849111))

(declare-fun m!849113 () Bool)

(assert (=> b!914368 m!849113))

(declare-fun m!849115 () Bool)

(assert (=> b!914368 m!849115))

(declare-fun m!849117 () Bool)

(assert (=> b!914368 m!849117))

(assert (=> b!914368 m!849111))

(assert (=> b!914368 m!849115))

(declare-fun m!849119 () Bool)

(assert (=> b!914368 m!849119))

(declare-fun m!849121 () Bool)

(assert (=> b!914372 m!849121))

(declare-fun m!849123 () Bool)

(assert (=> b!914375 m!849123))

(declare-fun m!849125 () Bool)

(assert (=> b!914375 m!849125))

(declare-fun m!849127 () Bool)

(assert (=> b!914378 m!849127))

(declare-fun m!849129 () Bool)

(assert (=> b!914378 m!849129))

(declare-fun m!849131 () Bool)

(assert (=> b!914376 m!849131))

(declare-fun m!849133 () Bool)

(assert (=> b!914371 m!849133))

(check-sat (not b!914371) (not mapNonEmpty!30489) b_and!27367 (not b_lambda!13379) (not b!914379) (not b!914375) (not start!78384) (not b_next!16749) (not b!914367) (not b!914368) tp_is_empty!19167 (not b!914372) (not b!914378) (not b!914374))
(check-sat b_and!27367 (not b_next!16749))
