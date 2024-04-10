; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42134 () Bool)

(assert start!42134)

(declare-fun b_free!11667 () Bool)

(declare-fun b_next!11667 () Bool)

(assert (=> start!42134 (= b_free!11667 (not b_next!11667))))

(declare-fun tp!41022 () Bool)

(declare-fun b_and!20089 () Bool)

(assert (=> start!42134 (= tp!41022 b_and!20089)))

(declare-fun b!470384 () Bool)

(declare-fun e!275559 () Bool)

(declare-fun tp_is_empty!13095 () Bool)

(assert (=> b!470384 (= e!275559 tp_is_empty!13095)))

(declare-fun mapNonEmpty!21343 () Bool)

(declare-fun mapRes!21343 () Bool)

(declare-fun tp!41023 () Bool)

(assert (=> mapNonEmpty!21343 (= mapRes!21343 (and tp!41023 e!275559))))

(declare-datatypes ((V!18565 0))(
  ( (V!18566 (val!6592 Int)) )
))
(declare-datatypes ((ValueCell!6204 0))(
  ( (ValueCellFull!6204 (v!8883 V!18565)) (EmptyCell!6204) )
))
(declare-datatypes ((array!29961 0))(
  ( (array!29962 (arr!14404 (Array (_ BitVec 32) ValueCell!6204)) (size!14756 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29961)

(declare-fun mapKey!21343 () (_ BitVec 32))

(declare-fun mapValue!21343 () ValueCell!6204)

(declare-fun mapRest!21343 () (Array (_ BitVec 32) ValueCell!6204))

(assert (=> mapNonEmpty!21343 (= (arr!14404 _values!833) (store mapRest!21343 mapKey!21343 mapValue!21343))))

(declare-fun b!470385 () Bool)

(declare-fun e!275560 () Bool)

(assert (=> b!470385 (= e!275560 (not true))))

(declare-datatypes ((tuple2!8682 0))(
  ( (tuple2!8683 (_1!4352 (_ BitVec 64)) (_2!4352 V!18565)) )
))
(declare-datatypes ((List!8762 0))(
  ( (Nil!8759) (Cons!8758 (h!9614 tuple2!8682) (t!14724 List!8762)) )
))
(declare-datatypes ((ListLongMap!7595 0))(
  ( (ListLongMap!7596 (toList!3813 List!8762)) )
))
(declare-fun lt!213432 () ListLongMap!7595)

(declare-fun lt!213431 () ListLongMap!7595)

(assert (=> b!470385 (= lt!213432 lt!213431)))

(declare-fun minValueBefore!38 () V!18565)

(declare-fun zeroValue!794 () V!18565)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13785 0))(
  ( (Unit!13786) )
))
(declare-fun lt!213430 () Unit!13785)

(declare-datatypes ((array!29963 0))(
  ( (array!29964 (arr!14405 (Array (_ BitVec 32) (_ BitVec 64))) (size!14757 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29963)

(declare-fun minValueAfter!38 () V!18565)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!156 (array!29963 array!29961 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18565 V!18565 V!18565 V!18565 (_ BitVec 32) Int) Unit!13785)

(assert (=> b!470385 (= lt!213430 (lemmaNoChangeToArrayThenSameMapNoExtras!156 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1976 (array!29963 array!29961 (_ BitVec 32) (_ BitVec 32) V!18565 V!18565 (_ BitVec 32) Int) ListLongMap!7595)

(assert (=> b!470385 (= lt!213431 (getCurrentListMapNoExtraKeys!1976 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470385 (= lt!213432 (getCurrentListMapNoExtraKeys!1976 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470386 () Bool)

(declare-fun e!275556 () Bool)

(declare-fun e!275558 () Bool)

(assert (=> b!470386 (= e!275556 (and e!275558 mapRes!21343))))

(declare-fun condMapEmpty!21343 () Bool)

(declare-fun mapDefault!21343 () ValueCell!6204)

(assert (=> b!470386 (= condMapEmpty!21343 (= (arr!14404 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6204)) mapDefault!21343)))))

(declare-fun res!281069 () Bool)

(assert (=> start!42134 (=> (not res!281069) (not e!275560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42134 (= res!281069 (validMask!0 mask!1365))))

(assert (=> start!42134 e!275560))

(assert (=> start!42134 tp_is_empty!13095))

(assert (=> start!42134 tp!41022))

(assert (=> start!42134 true))

(declare-fun array_inv!10394 (array!29963) Bool)

(assert (=> start!42134 (array_inv!10394 _keys!1025)))

(declare-fun array_inv!10395 (array!29961) Bool)

(assert (=> start!42134 (and (array_inv!10395 _values!833) e!275556)))

(declare-fun b!470387 () Bool)

(declare-fun res!281067 () Bool)

(assert (=> b!470387 (=> (not res!281067) (not e!275560))))

(assert (=> b!470387 (= res!281067 (and (= (size!14756 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14757 _keys!1025) (size!14756 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21343 () Bool)

(assert (=> mapIsEmpty!21343 mapRes!21343))

(declare-fun b!470388 () Bool)

(declare-fun res!281070 () Bool)

(assert (=> b!470388 (=> (not res!281070) (not e!275560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29963 (_ BitVec 32)) Bool)

(assert (=> b!470388 (= res!281070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470389 () Bool)

(declare-fun res!281068 () Bool)

(assert (=> b!470389 (=> (not res!281068) (not e!275560))))

(declare-datatypes ((List!8763 0))(
  ( (Nil!8760) (Cons!8759 (h!9615 (_ BitVec 64)) (t!14725 List!8763)) )
))
(declare-fun arrayNoDuplicates!0 (array!29963 (_ BitVec 32) List!8763) Bool)

(assert (=> b!470389 (= res!281068 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8760))))

(declare-fun b!470390 () Bool)

(assert (=> b!470390 (= e!275558 tp_is_empty!13095)))

(assert (= (and start!42134 res!281069) b!470387))

(assert (= (and b!470387 res!281067) b!470388))

(assert (= (and b!470388 res!281070) b!470389))

(assert (= (and b!470389 res!281068) b!470385))

(assert (= (and b!470386 condMapEmpty!21343) mapIsEmpty!21343))

(assert (= (and b!470386 (not condMapEmpty!21343)) mapNonEmpty!21343))

(get-info :version)

(assert (= (and mapNonEmpty!21343 ((_ is ValueCellFull!6204) mapValue!21343)) b!470384))

(assert (= (and b!470386 ((_ is ValueCellFull!6204) mapDefault!21343)) b!470390))

(assert (= start!42134 b!470386))

(declare-fun m!452681 () Bool)

(assert (=> b!470385 m!452681))

(declare-fun m!452683 () Bool)

(assert (=> b!470385 m!452683))

(declare-fun m!452685 () Bool)

(assert (=> b!470385 m!452685))

(declare-fun m!452687 () Bool)

(assert (=> mapNonEmpty!21343 m!452687))

(declare-fun m!452689 () Bool)

(assert (=> b!470388 m!452689))

(declare-fun m!452691 () Bool)

(assert (=> start!42134 m!452691))

(declare-fun m!452693 () Bool)

(assert (=> start!42134 m!452693))

(declare-fun m!452695 () Bool)

(assert (=> start!42134 m!452695))

(declare-fun m!452697 () Bool)

(assert (=> b!470389 m!452697))

(check-sat (not mapNonEmpty!21343) (not b!470389) tp_is_empty!13095 (not b_next!11667) (not b!470385) b_and!20089 (not b!470388) (not start!42134))
(check-sat b_and!20089 (not b_next!11667))
