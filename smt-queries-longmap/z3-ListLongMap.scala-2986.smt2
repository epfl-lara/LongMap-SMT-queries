; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42192 () Bool)

(assert start!42192)

(declare-fun b_free!11725 () Bool)

(declare-fun b_next!11725 () Bool)

(assert (=> start!42192 (= b_free!11725 (not b_next!11725))))

(declare-fun tp!41199 () Bool)

(declare-fun b_and!20165 () Bool)

(assert (=> start!42192 (= tp!41199 b_and!20165)))

(declare-fun b!471018 () Bool)

(declare-fun res!281441 () Bool)

(declare-fun e!276009 () Bool)

(assert (=> b!471018 (=> (not res!281441) (not e!276009))))

(declare-datatypes ((array!30056 0))(
  ( (array!30057 (arr!14450 (Array (_ BitVec 32) (_ BitVec 64))) (size!14802 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30056)

(declare-datatypes ((List!8708 0))(
  ( (Nil!8705) (Cons!8704 (h!9560 (_ BitVec 64)) (t!14664 List!8708)) )
))
(declare-fun arrayNoDuplicates!0 (array!30056 (_ BitVec 32) List!8708) Bool)

(assert (=> b!471018 (= res!281441 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8705))))

(declare-fun b!471019 () Bool)

(declare-fun res!281439 () Bool)

(assert (=> b!471019 (=> (not res!281439) (not e!276009))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30056 (_ BitVec 32)) Bool)

(assert (=> b!471019 (= res!281439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471020 () Bool)

(declare-fun e!276008 () Bool)

(declare-fun tp_is_empty!13153 () Bool)

(assert (=> b!471020 (= e!276008 tp_is_empty!13153)))

(declare-fun b!471021 () Bool)

(assert (=> b!471021 (= e!276009 (not true))))

(declare-datatypes ((V!18643 0))(
  ( (V!18644 (val!6621 Int)) )
))
(declare-datatypes ((tuple2!8638 0))(
  ( (tuple2!8639 (_1!4330 (_ BitVec 64)) (_2!4330 V!18643)) )
))
(declare-datatypes ((List!8709 0))(
  ( (Nil!8706) (Cons!8705 (h!9561 tuple2!8638) (t!14665 List!8709)) )
))
(declare-datatypes ((ListLongMap!7553 0))(
  ( (ListLongMap!7554 (toList!3792 List!8709)) )
))
(declare-fun lt!213743 () ListLongMap!7553)

(declare-fun lt!213745 () ListLongMap!7553)

(assert (=> b!471021 (= lt!213743 lt!213745)))

(declare-datatypes ((Unit!13797 0))(
  ( (Unit!13798) )
))
(declare-fun lt!213744 () Unit!13797)

(declare-fun minValueBefore!38 () V!18643)

(declare-fun zeroValue!794 () V!18643)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6233 0))(
  ( (ValueCellFull!6233 (v!8913 V!18643)) (EmptyCell!6233) )
))
(declare-datatypes ((array!30058 0))(
  ( (array!30059 (arr!14451 (Array (_ BitVec 32) ValueCell!6233)) (size!14803 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30058)

(declare-fun minValueAfter!38 () V!18643)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!167 (array!30056 array!30058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18643 V!18643 V!18643 V!18643 (_ BitVec 32) Int) Unit!13797)

(assert (=> b!471021 (= lt!213744 (lemmaNoChangeToArrayThenSameMapNoExtras!167 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2007 (array!30056 array!30058 (_ BitVec 32) (_ BitVec 32) V!18643 V!18643 (_ BitVec 32) Int) ListLongMap!7553)

(assert (=> b!471021 (= lt!213745 (getCurrentListMapNoExtraKeys!2007 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471021 (= lt!213743 (getCurrentListMapNoExtraKeys!2007 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471022 () Bool)

(declare-fun e!276007 () Bool)

(assert (=> b!471022 (= e!276007 tp_is_empty!13153)))

(declare-fun b!471023 () Bool)

(declare-fun res!281442 () Bool)

(assert (=> b!471023 (=> (not res!281442) (not e!276009))))

(assert (=> b!471023 (= res!281442 (and (= (size!14803 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14802 _keys!1025) (size!14803 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21433 () Bool)

(declare-fun mapRes!21433 () Bool)

(declare-fun tp!41200 () Bool)

(assert (=> mapNonEmpty!21433 (= mapRes!21433 (and tp!41200 e!276007))))

(declare-fun mapValue!21433 () ValueCell!6233)

(declare-fun mapRest!21433 () (Array (_ BitVec 32) ValueCell!6233))

(declare-fun mapKey!21433 () (_ BitVec 32))

(assert (=> mapNonEmpty!21433 (= (arr!14451 _values!833) (store mapRest!21433 mapKey!21433 mapValue!21433))))

(declare-fun mapIsEmpty!21433 () Bool)

(assert (=> mapIsEmpty!21433 mapRes!21433))

(declare-fun b!471017 () Bool)

(declare-fun e!276010 () Bool)

(assert (=> b!471017 (= e!276010 (and e!276008 mapRes!21433))))

(declare-fun condMapEmpty!21433 () Bool)

(declare-fun mapDefault!21433 () ValueCell!6233)

(assert (=> b!471017 (= condMapEmpty!21433 (= (arr!14451 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6233)) mapDefault!21433)))))

(declare-fun res!281440 () Bool)

(assert (=> start!42192 (=> (not res!281440) (not e!276009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42192 (= res!281440 (validMask!0 mask!1365))))

(assert (=> start!42192 e!276009))

(assert (=> start!42192 tp_is_empty!13153))

(assert (=> start!42192 tp!41199))

(assert (=> start!42192 true))

(declare-fun array_inv!10514 (array!30056) Bool)

(assert (=> start!42192 (array_inv!10514 _keys!1025)))

(declare-fun array_inv!10515 (array!30058) Bool)

(assert (=> start!42192 (and (array_inv!10515 _values!833) e!276010)))

(assert (= (and start!42192 res!281440) b!471023))

(assert (= (and b!471023 res!281442) b!471019))

(assert (= (and b!471019 res!281439) b!471018))

(assert (= (and b!471018 res!281441) b!471021))

(assert (= (and b!471017 condMapEmpty!21433) mapIsEmpty!21433))

(assert (= (and b!471017 (not condMapEmpty!21433)) mapNonEmpty!21433))

(get-info :version)

(assert (= (and mapNonEmpty!21433 ((_ is ValueCellFull!6233) mapValue!21433)) b!471022))

(assert (= (and b!471017 ((_ is ValueCellFull!6233) mapDefault!21433)) b!471020))

(assert (= start!42192 b!471017))

(declare-fun m!453451 () Bool)

(assert (=> b!471018 m!453451))

(declare-fun m!453453 () Bool)

(assert (=> b!471019 m!453453))

(declare-fun m!453455 () Bool)

(assert (=> mapNonEmpty!21433 m!453455))

(declare-fun m!453457 () Bool)

(assert (=> start!42192 m!453457))

(declare-fun m!453459 () Bool)

(assert (=> start!42192 m!453459))

(declare-fun m!453461 () Bool)

(assert (=> start!42192 m!453461))

(declare-fun m!453463 () Bool)

(assert (=> b!471021 m!453463))

(declare-fun m!453465 () Bool)

(assert (=> b!471021 m!453465))

(declare-fun m!453467 () Bool)

(assert (=> b!471021 m!453467))

(check-sat (not mapNonEmpty!21433) tp_is_empty!13153 b_and!20165 (not b!471018) (not b!471021) (not b!471019) (not start!42192) (not b_next!11725))
(check-sat b_and!20165 (not b_next!11725))
