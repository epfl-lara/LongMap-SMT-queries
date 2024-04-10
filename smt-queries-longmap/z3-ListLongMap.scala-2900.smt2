; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41544 () Bool)

(assert start!41544)

(declare-fun b_free!11211 () Bool)

(declare-fun b_next!11211 () Bool)

(assert (=> start!41544 (= b_free!11211 (not b_next!11211))))

(declare-fun tp!39630 () Bool)

(declare-fun b_and!19551 () Bool)

(assert (=> start!41544 (= tp!39630 b_and!19551)))

(declare-fun b!464062 () Bool)

(declare-fun res!277460 () Bool)

(declare-fun e!271030 () Bool)

(assert (=> b!464062 (=> (not res!277460) (not e!271030))))

(declare-datatypes ((array!29067 0))(
  ( (array!29068 (arr!13965 (Array (_ BitVec 32) (_ BitVec 64))) (size!14317 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29067)

(declare-datatypes ((List!8430 0))(
  ( (Nil!8427) (Cons!8426 (h!9282 (_ BitVec 64)) (t!14376 List!8430)) )
))
(declare-fun arrayNoDuplicates!0 (array!29067 (_ BitVec 32) List!8430) Bool)

(assert (=> b!464062 (= res!277460 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8427))))

(declare-fun b!464063 () Bool)

(declare-fun e!271031 () Bool)

(declare-fun e!271029 () Bool)

(declare-fun mapRes!20635 () Bool)

(assert (=> b!464063 (= e!271031 (and e!271029 mapRes!20635))))

(declare-fun condMapEmpty!20635 () Bool)

(declare-datatypes ((V!17957 0))(
  ( (V!17958 (val!6364 Int)) )
))
(declare-datatypes ((ValueCell!5976 0))(
  ( (ValueCellFull!5976 (v!8651 V!17957)) (EmptyCell!5976) )
))
(declare-datatypes ((array!29069 0))(
  ( (array!29070 (arr!13966 (Array (_ BitVec 32) ValueCell!5976)) (size!14318 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29069)

(declare-fun mapDefault!20635 () ValueCell!5976)

(assert (=> b!464063 (= condMapEmpty!20635 (= (arr!13966 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5976)) mapDefault!20635)))))

(declare-fun b!464064 () Bool)

(assert (=> b!464064 (= e!271030 false)))

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun zeroValue!794 () V!17957)

(declare-datatypes ((tuple2!8336 0))(
  ( (tuple2!8337 (_1!4179 (_ BitVec 64)) (_2!4179 V!17957)) )
))
(declare-datatypes ((List!8431 0))(
  ( (Nil!8428) (Cons!8427 (h!9283 tuple2!8336) (t!14377 List!8431)) )
))
(declare-datatypes ((ListLongMap!7249 0))(
  ( (ListLongMap!7250 (toList!3640 List!8431)) )
))
(declare-fun lt!209557 () ListLongMap!7249)

(declare-fun minValueAfter!38 () V!17957)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1820 (array!29067 array!29069 (_ BitVec 32) (_ BitVec 32) V!17957 V!17957 (_ BitVec 32) Int) ListLongMap!7249)

(assert (=> b!464064 (= lt!209557 (getCurrentListMapNoExtraKeys!1820 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17957)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!209558 () ListLongMap!7249)

(assert (=> b!464064 (= lt!209558 (getCurrentListMapNoExtraKeys!1820 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464065 () Bool)

(declare-fun res!277459 () Bool)

(assert (=> b!464065 (=> (not res!277459) (not e!271030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29067 (_ BitVec 32)) Bool)

(assert (=> b!464065 (= res!277459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464066 () Bool)

(declare-fun res!277457 () Bool)

(assert (=> b!464066 (=> (not res!277457) (not e!271030))))

(assert (=> b!464066 (= res!277457 (and (= (size!14318 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14317 _keys!1025) (size!14318 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20635 () Bool)

(assert (=> mapIsEmpty!20635 mapRes!20635))

(declare-fun b!464067 () Bool)

(declare-fun tp_is_empty!12639 () Bool)

(assert (=> b!464067 (= e!271029 tp_is_empty!12639)))

(declare-fun b!464068 () Bool)

(declare-fun e!271028 () Bool)

(assert (=> b!464068 (= e!271028 tp_is_empty!12639)))

(declare-fun res!277458 () Bool)

(assert (=> start!41544 (=> (not res!277458) (not e!271030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41544 (= res!277458 (validMask!0 mask!1365))))

(assert (=> start!41544 e!271030))

(assert (=> start!41544 tp_is_empty!12639))

(assert (=> start!41544 tp!39630))

(assert (=> start!41544 true))

(declare-fun array_inv!10090 (array!29067) Bool)

(assert (=> start!41544 (array_inv!10090 _keys!1025)))

(declare-fun array_inv!10091 (array!29069) Bool)

(assert (=> start!41544 (and (array_inv!10091 _values!833) e!271031)))

(declare-fun mapNonEmpty!20635 () Bool)

(declare-fun tp!39631 () Bool)

(assert (=> mapNonEmpty!20635 (= mapRes!20635 (and tp!39631 e!271028))))

(declare-fun mapValue!20635 () ValueCell!5976)

(declare-fun mapRest!20635 () (Array (_ BitVec 32) ValueCell!5976))

(declare-fun mapKey!20635 () (_ BitVec 32))

(assert (=> mapNonEmpty!20635 (= (arr!13966 _values!833) (store mapRest!20635 mapKey!20635 mapValue!20635))))

(assert (= (and start!41544 res!277458) b!464066))

(assert (= (and b!464066 res!277457) b!464065))

(assert (= (and b!464065 res!277459) b!464062))

(assert (= (and b!464062 res!277460) b!464064))

(assert (= (and b!464063 condMapEmpty!20635) mapIsEmpty!20635))

(assert (= (and b!464063 (not condMapEmpty!20635)) mapNonEmpty!20635))

(get-info :version)

(assert (= (and mapNonEmpty!20635 ((_ is ValueCellFull!5976) mapValue!20635)) b!464068))

(assert (= (and b!464063 ((_ is ValueCellFull!5976) mapDefault!20635)) b!464067))

(assert (= start!41544 b!464063))

(declare-fun m!446505 () Bool)

(assert (=> b!464064 m!446505))

(declare-fun m!446507 () Bool)

(assert (=> b!464064 m!446507))

(declare-fun m!446509 () Bool)

(assert (=> b!464062 m!446509))

(declare-fun m!446511 () Bool)

(assert (=> b!464065 m!446511))

(declare-fun m!446513 () Bool)

(assert (=> start!41544 m!446513))

(declare-fun m!446515 () Bool)

(assert (=> start!41544 m!446515))

(declare-fun m!446517 () Bool)

(assert (=> start!41544 m!446517))

(declare-fun m!446519 () Bool)

(assert (=> mapNonEmpty!20635 m!446519))

(check-sat tp_is_empty!12639 (not b!464064) (not start!41544) (not mapNonEmpty!20635) (not b_next!11211) (not b!464065) (not b!464062) b_and!19551)
(check-sat b_and!19551 (not b_next!11211))
