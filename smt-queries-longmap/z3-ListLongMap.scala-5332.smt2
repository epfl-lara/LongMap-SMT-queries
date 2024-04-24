; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71418 () Bool)

(assert start!71418)

(declare-fun b_free!13399 () Bool)

(declare-fun b_next!13399 () Bool)

(assert (=> start!71418 (= b_free!13399 (not b_next!13399))))

(declare-fun tp!46959 () Bool)

(declare-fun b_and!22347 () Bool)

(assert (=> start!71418 (= tp!46959 b_and!22347)))

(declare-fun mapIsEmpty!24292 () Bool)

(declare-fun mapRes!24292 () Bool)

(assert (=> mapIsEmpty!24292 mapRes!24292))

(declare-fun b!828532 () Bool)

(declare-fun res!564438 () Bool)

(declare-fun e!461662 () Bool)

(assert (=> b!828532 (=> (not res!564438) (not e!461662))))

(declare-datatypes ((array!46395 0))(
  ( (array!46396 (arr!22237 (Array (_ BitVec 32) (_ BitVec 64))) (size!22657 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46395)

(declare-datatypes ((List!15779 0))(
  ( (Nil!15776) (Cons!15775 (h!16910 (_ BitVec 64)) (t!22120 List!15779)) )
))
(declare-fun arrayNoDuplicates!0 (array!46395 (_ BitVec 32) List!15779) Bool)

(assert (=> b!828532 (= res!564438 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15776))))

(declare-fun b!828533 () Bool)

(declare-fun res!564436 () Bool)

(assert (=> b!828533 (=> (not res!564436) (not e!461662))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25147 0))(
  ( (V!25148 (val!7602 Int)) )
))
(declare-datatypes ((ValueCell!7139 0))(
  ( (ValueCellFull!7139 (v!10037 V!25147)) (EmptyCell!7139) )
))
(declare-datatypes ((array!46397 0))(
  ( (array!46398 (arr!22238 (Array (_ BitVec 32) ValueCell!7139)) (size!22658 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46397)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!828533 (= res!564436 (and (= (size!22658 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22657 _keys!976) (size!22658 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828534 () Bool)

(declare-fun e!461660 () Bool)

(declare-fun tp_is_empty!15109 () Bool)

(assert (=> b!828534 (= e!461660 tp_is_empty!15109)))

(declare-fun b!828535 () Bool)

(declare-fun e!461658 () Bool)

(declare-fun e!461659 () Bool)

(assert (=> b!828535 (= e!461658 (and e!461659 mapRes!24292))))

(declare-fun condMapEmpty!24292 () Bool)

(declare-fun mapDefault!24292 () ValueCell!7139)

(assert (=> b!828535 (= condMapEmpty!24292 (= (arr!22238 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7139)) mapDefault!24292)))))

(declare-fun res!564437 () Bool)

(assert (=> start!71418 (=> (not res!564437) (not e!461662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71418 (= res!564437 (validMask!0 mask!1312))))

(assert (=> start!71418 e!461662))

(assert (=> start!71418 tp_is_empty!15109))

(declare-fun array_inv!17765 (array!46395) Bool)

(assert (=> start!71418 (array_inv!17765 _keys!976)))

(assert (=> start!71418 true))

(declare-fun array_inv!17766 (array!46397) Bool)

(assert (=> start!71418 (and (array_inv!17766 _values!788) e!461658)))

(assert (=> start!71418 tp!46959))

(declare-fun b!828536 () Bool)

(assert (=> b!828536 (= e!461659 tp_is_empty!15109)))

(declare-fun b!828537 () Bool)

(assert (=> b!828537 (= e!461662 false)))

(declare-fun zeroValueAfter!34 () V!25147)

(declare-fun minValue!754 () V!25147)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10004 0))(
  ( (tuple2!10005 (_1!5013 (_ BitVec 64)) (_2!5013 V!25147)) )
))
(declare-datatypes ((List!15780 0))(
  ( (Nil!15777) (Cons!15776 (h!16911 tuple2!10004) (t!22121 List!15780)) )
))
(declare-datatypes ((ListLongMap!8829 0))(
  ( (ListLongMap!8830 (toList!4430 List!15780)) )
))
(declare-fun lt!375317 () ListLongMap!8829)

(declare-fun getCurrentListMapNoExtraKeys!2507 (array!46395 array!46397 (_ BitVec 32) (_ BitVec 32) V!25147 V!25147 (_ BitVec 32) Int) ListLongMap!8829)

(assert (=> b!828537 (= lt!375317 (getCurrentListMapNoExtraKeys!2507 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375316 () ListLongMap!8829)

(declare-fun zeroValueBefore!34 () V!25147)

(assert (=> b!828537 (= lt!375316 (getCurrentListMapNoExtraKeys!2507 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24292 () Bool)

(declare-fun tp!46960 () Bool)

(assert (=> mapNonEmpty!24292 (= mapRes!24292 (and tp!46960 e!461660))))

(declare-fun mapValue!24292 () ValueCell!7139)

(declare-fun mapKey!24292 () (_ BitVec 32))

(declare-fun mapRest!24292 () (Array (_ BitVec 32) ValueCell!7139))

(assert (=> mapNonEmpty!24292 (= (arr!22238 _values!788) (store mapRest!24292 mapKey!24292 mapValue!24292))))

(declare-fun b!828538 () Bool)

(declare-fun res!564435 () Bool)

(assert (=> b!828538 (=> (not res!564435) (not e!461662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46395 (_ BitVec 32)) Bool)

(assert (=> b!828538 (= res!564435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71418 res!564437) b!828533))

(assert (= (and b!828533 res!564436) b!828538))

(assert (= (and b!828538 res!564435) b!828532))

(assert (= (and b!828532 res!564438) b!828537))

(assert (= (and b!828535 condMapEmpty!24292) mapIsEmpty!24292))

(assert (= (and b!828535 (not condMapEmpty!24292)) mapNonEmpty!24292))

(get-info :version)

(assert (= (and mapNonEmpty!24292 ((_ is ValueCellFull!7139) mapValue!24292)) b!828534))

(assert (= (and b!828535 ((_ is ValueCellFull!7139) mapDefault!24292)) b!828536))

(assert (= start!71418 b!828535))

(declare-fun m!771953 () Bool)

(assert (=> start!71418 m!771953))

(declare-fun m!771955 () Bool)

(assert (=> start!71418 m!771955))

(declare-fun m!771957 () Bool)

(assert (=> start!71418 m!771957))

(declare-fun m!771959 () Bool)

(assert (=> mapNonEmpty!24292 m!771959))

(declare-fun m!771961 () Bool)

(assert (=> b!828532 m!771961))

(declare-fun m!771963 () Bool)

(assert (=> b!828538 m!771963))

(declare-fun m!771965 () Bool)

(assert (=> b!828537 m!771965))

(declare-fun m!771967 () Bool)

(assert (=> b!828537 m!771967))

(check-sat b_and!22347 (not b!828532) (not b!828537) (not b!828538) (not b_next!13399) (not start!71418) (not mapNonEmpty!24292) tp_is_empty!15109)
(check-sat b_and!22347 (not b_next!13399))
