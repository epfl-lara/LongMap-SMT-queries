; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71424 () Bool)

(assert start!71424)

(declare-fun b_free!13405 () Bool)

(declare-fun b_next!13405 () Bool)

(assert (=> start!71424 (= b_free!13405 (not b_next!13405))))

(declare-fun tp!46978 () Bool)

(declare-fun b_and!22353 () Bool)

(assert (=> start!71424 (= tp!46978 b_and!22353)))

(declare-fun b!828595 () Bool)

(declare-fun e!461705 () Bool)

(assert (=> b!828595 (= e!461705 false)))

(declare-datatypes ((array!46405 0))(
  ( (array!46406 (arr!22242 (Array (_ BitVec 32) (_ BitVec 64))) (size!22662 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46405)

(declare-datatypes ((V!25155 0))(
  ( (V!25156 (val!7605 Int)) )
))
(declare-fun zeroValueAfter!34 () V!25155)

(declare-fun minValue!754 () V!25155)

(declare-datatypes ((ValueCell!7142 0))(
  ( (ValueCellFull!7142 (v!10040 V!25155)) (EmptyCell!7142) )
))
(declare-datatypes ((array!46407 0))(
  ( (array!46408 (arr!22243 (Array (_ BitVec 32) ValueCell!7142)) (size!22663 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46407)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10008 0))(
  ( (tuple2!10009 (_1!5015 (_ BitVec 64)) (_2!5015 V!25155)) )
))
(declare-datatypes ((List!15783 0))(
  ( (Nil!15780) (Cons!15779 (h!16914 tuple2!10008) (t!22124 List!15783)) )
))
(declare-datatypes ((ListLongMap!8833 0))(
  ( (ListLongMap!8834 (toList!4432 List!15783)) )
))
(declare-fun lt!375335 () ListLongMap!8833)

(declare-fun getCurrentListMapNoExtraKeys!2509 (array!46405 array!46407 (_ BitVec 32) (_ BitVec 32) V!25155 V!25155 (_ BitVec 32) Int) ListLongMap!8833)

(assert (=> b!828595 (= lt!375335 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25155)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!375334 () ListLongMap!8833)

(assert (=> b!828595 (= lt!375334 (getCurrentListMapNoExtraKeys!2509 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828596 () Bool)

(declare-fun res!564473 () Bool)

(assert (=> b!828596 (=> (not res!564473) (not e!461705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46405 (_ BitVec 32)) Bool)

(assert (=> b!828596 (= res!564473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!564471 () Bool)

(assert (=> start!71424 (=> (not res!564471) (not e!461705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71424 (= res!564471 (validMask!0 mask!1312))))

(assert (=> start!71424 e!461705))

(declare-fun tp_is_empty!15115 () Bool)

(assert (=> start!71424 tp_is_empty!15115))

(declare-fun array_inv!17769 (array!46405) Bool)

(assert (=> start!71424 (array_inv!17769 _keys!976)))

(assert (=> start!71424 true))

(declare-fun e!461704 () Bool)

(declare-fun array_inv!17770 (array!46407) Bool)

(assert (=> start!71424 (and (array_inv!17770 _values!788) e!461704)))

(assert (=> start!71424 tp!46978))

(declare-fun b!828597 () Bool)

(declare-fun res!564472 () Bool)

(assert (=> b!828597 (=> (not res!564472) (not e!461705))))

(declare-datatypes ((List!15784 0))(
  ( (Nil!15781) (Cons!15780 (h!16915 (_ BitVec 64)) (t!22125 List!15784)) )
))
(declare-fun arrayNoDuplicates!0 (array!46405 (_ BitVec 32) List!15784) Bool)

(assert (=> b!828597 (= res!564472 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15781))))

(declare-fun b!828598 () Bool)

(declare-fun res!564474 () Bool)

(assert (=> b!828598 (=> (not res!564474) (not e!461705))))

(assert (=> b!828598 (= res!564474 (and (= (size!22663 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22662 _keys!976) (size!22663 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828599 () Bool)

(declare-fun e!461703 () Bool)

(assert (=> b!828599 (= e!461703 tp_is_empty!15115)))

(declare-fun b!828600 () Bool)

(declare-fun e!461707 () Bool)

(declare-fun mapRes!24301 () Bool)

(assert (=> b!828600 (= e!461704 (and e!461707 mapRes!24301))))

(declare-fun condMapEmpty!24301 () Bool)

(declare-fun mapDefault!24301 () ValueCell!7142)

(assert (=> b!828600 (= condMapEmpty!24301 (= (arr!22243 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7142)) mapDefault!24301)))))

(declare-fun mapIsEmpty!24301 () Bool)

(assert (=> mapIsEmpty!24301 mapRes!24301))

(declare-fun mapNonEmpty!24301 () Bool)

(declare-fun tp!46977 () Bool)

(assert (=> mapNonEmpty!24301 (= mapRes!24301 (and tp!46977 e!461703))))

(declare-fun mapKey!24301 () (_ BitVec 32))

(declare-fun mapRest!24301 () (Array (_ BitVec 32) ValueCell!7142))

(declare-fun mapValue!24301 () ValueCell!7142)

(assert (=> mapNonEmpty!24301 (= (arr!22243 _values!788) (store mapRest!24301 mapKey!24301 mapValue!24301))))

(declare-fun b!828601 () Bool)

(assert (=> b!828601 (= e!461707 tp_is_empty!15115)))

(assert (= (and start!71424 res!564471) b!828598))

(assert (= (and b!828598 res!564474) b!828596))

(assert (= (and b!828596 res!564473) b!828597))

(assert (= (and b!828597 res!564472) b!828595))

(assert (= (and b!828600 condMapEmpty!24301) mapIsEmpty!24301))

(assert (= (and b!828600 (not condMapEmpty!24301)) mapNonEmpty!24301))

(get-info :version)

(assert (= (and mapNonEmpty!24301 ((_ is ValueCellFull!7142) mapValue!24301)) b!828599))

(assert (= (and b!828600 ((_ is ValueCellFull!7142) mapDefault!24301)) b!828601))

(assert (= start!71424 b!828600))

(declare-fun m!772001 () Bool)

(assert (=> b!828597 m!772001))

(declare-fun m!772003 () Bool)

(assert (=> start!71424 m!772003))

(declare-fun m!772005 () Bool)

(assert (=> start!71424 m!772005))

(declare-fun m!772007 () Bool)

(assert (=> start!71424 m!772007))

(declare-fun m!772009 () Bool)

(assert (=> mapNonEmpty!24301 m!772009))

(declare-fun m!772011 () Bool)

(assert (=> b!828595 m!772011))

(declare-fun m!772013 () Bool)

(assert (=> b!828595 m!772013))

(declare-fun m!772015 () Bool)

(assert (=> b!828596 m!772015))

(check-sat (not b!828595) b_and!22353 (not mapNonEmpty!24301) (not b!828596) (not start!71424) (not b!828597) (not b_next!13405) tp_is_empty!15115)
(check-sat b_and!22353 (not b_next!13405))
