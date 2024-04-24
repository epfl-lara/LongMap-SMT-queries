; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42100 () Bool)

(assert start!42100)

(declare-fun b_free!11647 () Bool)

(declare-fun b_next!11647 () Bool)

(assert (=> start!42100 (= b_free!11647 (not b_next!11647))))

(declare-fun tp!40962 () Bool)

(declare-fun b_and!20079 () Bool)

(assert (=> start!42100 (= tp!40962 b_and!20079)))

(declare-fun b!470113 () Bool)

(declare-fun e!275371 () Bool)

(declare-fun tp_is_empty!13075 () Bool)

(assert (=> b!470113 (= e!275371 tp_is_empty!13075)))

(declare-fun b!470114 () Bool)

(declare-fun e!275367 () Bool)

(assert (=> b!470114 (= e!275367 (not true))))

(declare-datatypes ((V!18539 0))(
  ( (V!18540 (val!6582 Int)) )
))
(declare-datatypes ((tuple2!8590 0))(
  ( (tuple2!8591 (_1!4306 (_ BitVec 64)) (_2!4306 V!18539)) )
))
(declare-datatypes ((List!8663 0))(
  ( (Nil!8660) (Cons!8659 (h!9515 tuple2!8590) (t!14617 List!8663)) )
))
(declare-datatypes ((ListLongMap!7505 0))(
  ( (ListLongMap!7506 (toList!3768 List!8663)) )
))
(declare-fun lt!213353 () ListLongMap!7505)

(declare-fun lt!213354 () ListLongMap!7505)

(assert (=> b!470114 (= lt!213353 lt!213354)))

(declare-fun minValueBefore!38 () V!18539)

(declare-fun zeroValue!794 () V!18539)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13749 0))(
  ( (Unit!13750) )
))
(declare-fun lt!213352 () Unit!13749)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29910 0))(
  ( (array!29911 (arr!14378 (Array (_ BitVec 32) (_ BitVec 64))) (size!14730 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29910)

(declare-datatypes ((ValueCell!6194 0))(
  ( (ValueCellFull!6194 (v!8874 V!18539)) (EmptyCell!6194) )
))
(declare-datatypes ((array!29912 0))(
  ( (array!29913 (arr!14379 (Array (_ BitVec 32) ValueCell!6194)) (size!14731 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29912)

(declare-fun minValueAfter!38 () V!18539)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!143 (array!29910 array!29912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18539 V!18539 V!18539 V!18539 (_ BitVec 32) Int) Unit!13749)

(assert (=> b!470114 (= lt!213352 (lemmaNoChangeToArrayThenSameMapNoExtras!143 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1983 (array!29910 array!29912 (_ BitVec 32) (_ BitVec 32) V!18539 V!18539 (_ BitVec 32) Int) ListLongMap!7505)

(assert (=> b!470114 (= lt!213354 (getCurrentListMapNoExtraKeys!1983 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470114 (= lt!213353 (getCurrentListMapNoExtraKeys!1983 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21313 () Bool)

(declare-fun mapRes!21313 () Bool)

(declare-fun tp!40963 () Bool)

(assert (=> mapNonEmpty!21313 (= mapRes!21313 (and tp!40963 e!275371))))

(declare-fun mapKey!21313 () (_ BitVec 32))

(declare-fun mapRest!21313 () (Array (_ BitVec 32) ValueCell!6194))

(declare-fun mapValue!21313 () ValueCell!6194)

(assert (=> mapNonEmpty!21313 (= (arr!14379 _values!833) (store mapRest!21313 mapKey!21313 mapValue!21313))))

(declare-fun b!470115 () Bool)

(declare-fun res!280941 () Bool)

(assert (=> b!470115 (=> (not res!280941) (not e!275367))))

(declare-datatypes ((List!8664 0))(
  ( (Nil!8661) (Cons!8660 (h!9516 (_ BitVec 64)) (t!14618 List!8664)) )
))
(declare-fun arrayNoDuplicates!0 (array!29910 (_ BitVec 32) List!8664) Bool)

(assert (=> b!470115 (= res!280941 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8661))))

(declare-fun res!280943 () Bool)

(assert (=> start!42100 (=> (not res!280943) (not e!275367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42100 (= res!280943 (validMask!0 mask!1365))))

(assert (=> start!42100 e!275367))

(assert (=> start!42100 tp_is_empty!13075))

(assert (=> start!42100 tp!40962))

(assert (=> start!42100 true))

(declare-fun array_inv!10466 (array!29910) Bool)

(assert (=> start!42100 (array_inv!10466 _keys!1025)))

(declare-fun e!275368 () Bool)

(declare-fun array_inv!10467 (array!29912) Bool)

(assert (=> start!42100 (and (array_inv!10467 _values!833) e!275368)))

(declare-fun b!470116 () Bool)

(declare-fun res!280942 () Bool)

(assert (=> b!470116 (=> (not res!280942) (not e!275367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29910 (_ BitVec 32)) Bool)

(assert (=> b!470116 (= res!280942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21313 () Bool)

(assert (=> mapIsEmpty!21313 mapRes!21313))

(declare-fun b!470117 () Bool)

(declare-fun e!275369 () Bool)

(assert (=> b!470117 (= e!275368 (and e!275369 mapRes!21313))))

(declare-fun condMapEmpty!21313 () Bool)

(declare-fun mapDefault!21313 () ValueCell!6194)

(assert (=> b!470117 (= condMapEmpty!21313 (= (arr!14379 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6194)) mapDefault!21313)))))

(declare-fun b!470118 () Bool)

(assert (=> b!470118 (= e!275369 tp_is_empty!13075)))

(declare-fun b!470119 () Bool)

(declare-fun res!280940 () Bool)

(assert (=> b!470119 (=> (not res!280940) (not e!275367))))

(assert (=> b!470119 (= res!280940 (and (= (size!14731 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14730 _keys!1025) (size!14731 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42100 res!280943) b!470119))

(assert (= (and b!470119 res!280940) b!470116))

(assert (= (and b!470116 res!280942) b!470115))

(assert (= (and b!470115 res!280941) b!470114))

(assert (= (and b!470117 condMapEmpty!21313) mapIsEmpty!21313))

(assert (= (and b!470117 (not condMapEmpty!21313)) mapNonEmpty!21313))

(get-info :version)

(assert (= (and mapNonEmpty!21313 ((_ is ValueCellFull!6194) mapValue!21313)) b!470113))

(assert (= (and b!470117 ((_ is ValueCellFull!6194) mapDefault!21313)) b!470118))

(assert (= start!42100 b!470117))

(declare-fun m!452683 () Bool)

(assert (=> b!470116 m!452683))

(declare-fun m!452685 () Bool)

(assert (=> start!42100 m!452685))

(declare-fun m!452687 () Bool)

(assert (=> start!42100 m!452687))

(declare-fun m!452689 () Bool)

(assert (=> start!42100 m!452689))

(declare-fun m!452691 () Bool)

(assert (=> mapNonEmpty!21313 m!452691))

(declare-fun m!452693 () Bool)

(assert (=> b!470114 m!452693))

(declare-fun m!452695 () Bool)

(assert (=> b!470114 m!452695))

(declare-fun m!452697 () Bool)

(assert (=> b!470114 m!452697))

(declare-fun m!452699 () Bool)

(assert (=> b!470115 m!452699))

(check-sat tp_is_empty!13075 (not b!470116) (not b!470115) (not start!42100) (not b_next!11647) (not b!470114) b_and!20079 (not mapNonEmpty!21313))
(check-sat b_and!20079 (not b_next!11647))
