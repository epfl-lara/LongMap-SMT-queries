; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42326 () Bool)

(assert start!42326)

(declare-fun b_free!11817 () Bool)

(declare-fun b_next!11817 () Bool)

(assert (=> start!42326 (= b_free!11817 (not b_next!11817))))

(declare-fun tp!41481 () Bool)

(declare-fun b_and!20263 () Bool)

(assert (=> start!42326 (= tp!41481 b_and!20263)))

(declare-fun res!282076 () Bool)

(declare-fun e!276861 () Bool)

(assert (=> start!42326 (=> (not res!282076) (not e!276861))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42326 (= res!282076 (validMask!0 mask!1365))))

(assert (=> start!42326 e!276861))

(declare-fun tp_is_empty!13245 () Bool)

(assert (=> start!42326 tp_is_empty!13245))

(assert (=> start!42326 tp!41481))

(assert (=> start!42326 true))

(declare-datatypes ((array!30247 0))(
  ( (array!30248 (arr!14544 (Array (_ BitVec 32) (_ BitVec 64))) (size!14896 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30247)

(declare-fun array_inv!10484 (array!30247) Bool)

(assert (=> start!42326 (array_inv!10484 _keys!1025)))

(declare-datatypes ((V!18765 0))(
  ( (V!18766 (val!6667 Int)) )
))
(declare-datatypes ((ValueCell!6279 0))(
  ( (ValueCellFull!6279 (v!8958 V!18765)) (EmptyCell!6279) )
))
(declare-datatypes ((array!30249 0))(
  ( (array!30250 (arr!14545 (Array (_ BitVec 32) ValueCell!6279)) (size!14897 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30249)

(declare-fun e!276862 () Bool)

(declare-fun array_inv!10485 (array!30249) Bool)

(assert (=> start!42326 (and (array_inv!10485 _values!833) e!276862)))

(declare-fun b!472228 () Bool)

(declare-fun e!276865 () Bool)

(declare-fun mapRes!21577 () Bool)

(assert (=> b!472228 (= e!276862 (and e!276865 mapRes!21577))))

(declare-fun condMapEmpty!21577 () Bool)

(declare-fun mapDefault!21577 () ValueCell!6279)

(assert (=> b!472228 (= condMapEmpty!21577 (= (arr!14545 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6279)) mapDefault!21577)))))

(declare-fun b!472229 () Bool)

(declare-fun res!282074 () Bool)

(assert (=> b!472229 (=> (not res!282074) (not e!276861))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!472229 (= res!282074 (and (= (size!14897 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14896 _keys!1025) (size!14897 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472230 () Bool)

(declare-fun res!282078 () Bool)

(assert (=> b!472230 (=> (not res!282078) (not e!276861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30247 (_ BitVec 32)) Bool)

(assert (=> b!472230 (= res!282078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472231 () Bool)

(declare-fun e!276864 () Bool)

(assert (=> b!472231 (= e!276861 (not e!276864))))

(declare-fun res!282075 () Bool)

(assert (=> b!472231 (=> res!282075 e!276864)))

(assert (=> b!472231 (= res!282075 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8776 0))(
  ( (tuple2!8777 (_1!4399 (_ BitVec 64)) (_2!4399 V!18765)) )
))
(declare-datatypes ((List!8859 0))(
  ( (Nil!8856) (Cons!8855 (h!9711 tuple2!8776) (t!14827 List!8859)) )
))
(declare-datatypes ((ListLongMap!7689 0))(
  ( (ListLongMap!7690 (toList!3860 List!8859)) )
))
(declare-fun lt!214240 () ListLongMap!7689)

(declare-fun lt!214242 () ListLongMap!7689)

(assert (=> b!472231 (= lt!214240 lt!214242)))

(declare-fun minValueBefore!38 () V!18765)

(declare-fun zeroValue!794 () V!18765)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13879 0))(
  ( (Unit!13880) )
))
(declare-fun lt!214239 () Unit!13879)

(declare-fun minValueAfter!38 () V!18765)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!203 (array!30247 array!30249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18765 V!18765 V!18765 V!18765 (_ BitVec 32) Int) Unit!13879)

(assert (=> b!472231 (= lt!214239 (lemmaNoChangeToArrayThenSameMapNoExtras!203 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2023 (array!30247 array!30249 (_ BitVec 32) (_ BitVec 32) V!18765 V!18765 (_ BitVec 32) Int) ListLongMap!7689)

(assert (=> b!472231 (= lt!214242 (getCurrentListMapNoExtraKeys!2023 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472231 (= lt!214240 (getCurrentListMapNoExtraKeys!2023 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21577 () Bool)

(assert (=> mapIsEmpty!21577 mapRes!21577))

(declare-fun b!472232 () Bool)

(declare-fun e!276860 () Bool)

(assert (=> b!472232 (= e!276860 tp_is_empty!13245)))

(declare-fun mapNonEmpty!21577 () Bool)

(declare-fun tp!41482 () Bool)

(assert (=> mapNonEmpty!21577 (= mapRes!21577 (and tp!41482 e!276860))))

(declare-fun mapRest!21577 () (Array (_ BitVec 32) ValueCell!6279))

(declare-fun mapKey!21577 () (_ BitVec 32))

(declare-fun mapValue!21577 () ValueCell!6279)

(assert (=> mapNonEmpty!21577 (= (arr!14545 _values!833) (store mapRest!21577 mapKey!21577 mapValue!21577))))

(declare-fun b!472233 () Bool)

(assert (=> b!472233 (= e!276864 true)))

(declare-fun lt!214241 () ListLongMap!7689)

(declare-fun getCurrentListMap!2231 (array!30247 array!30249 (_ BitVec 32) (_ BitVec 32) V!18765 V!18765 (_ BitVec 32) Int) ListLongMap!7689)

(assert (=> b!472233 (= lt!214241 (getCurrentListMap!2231 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472234 () Bool)

(declare-fun res!282077 () Bool)

(assert (=> b!472234 (=> (not res!282077) (not e!276861))))

(declare-datatypes ((List!8860 0))(
  ( (Nil!8857) (Cons!8856 (h!9712 (_ BitVec 64)) (t!14828 List!8860)) )
))
(declare-fun arrayNoDuplicates!0 (array!30247 (_ BitVec 32) List!8860) Bool)

(assert (=> b!472234 (= res!282077 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8857))))

(declare-fun b!472235 () Bool)

(assert (=> b!472235 (= e!276865 tp_is_empty!13245)))

(assert (= (and start!42326 res!282076) b!472229))

(assert (= (and b!472229 res!282074) b!472230))

(assert (= (and b!472230 res!282078) b!472234))

(assert (= (and b!472234 res!282077) b!472231))

(assert (= (and b!472231 (not res!282075)) b!472233))

(assert (= (and b!472228 condMapEmpty!21577) mapIsEmpty!21577))

(assert (= (and b!472228 (not condMapEmpty!21577)) mapNonEmpty!21577))

(get-info :version)

(assert (= (and mapNonEmpty!21577 ((_ is ValueCellFull!6279) mapValue!21577)) b!472232))

(assert (= (and b!472228 ((_ is ValueCellFull!6279) mapDefault!21577)) b!472235))

(assert (= start!42326 b!472228))

(declare-fun m!454237 () Bool)

(assert (=> b!472233 m!454237))

(declare-fun m!454239 () Bool)

(assert (=> b!472234 m!454239))

(declare-fun m!454241 () Bool)

(assert (=> b!472230 m!454241))

(declare-fun m!454243 () Bool)

(assert (=> mapNonEmpty!21577 m!454243))

(declare-fun m!454245 () Bool)

(assert (=> start!42326 m!454245))

(declare-fun m!454247 () Bool)

(assert (=> start!42326 m!454247))

(declare-fun m!454249 () Bool)

(assert (=> start!42326 m!454249))

(declare-fun m!454251 () Bool)

(assert (=> b!472231 m!454251))

(declare-fun m!454253 () Bool)

(assert (=> b!472231 m!454253))

(declare-fun m!454255 () Bool)

(assert (=> b!472231 m!454255))

(check-sat (not b_next!11817) (not mapNonEmpty!21577) (not b!472230) tp_is_empty!13245 b_and!20263 (not start!42326) (not b!472233) (not b!472231) (not b!472234))
(check-sat b_and!20263 (not b_next!11817))
