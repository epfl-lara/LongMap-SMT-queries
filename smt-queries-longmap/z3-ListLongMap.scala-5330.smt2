; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71406 () Bool)

(assert start!71406)

(declare-fun b_free!13387 () Bool)

(declare-fun b_next!13387 () Bool)

(assert (=> start!71406 (= b_free!13387 (not b_next!13387))))

(declare-fun tp!46924 () Bool)

(declare-fun b_and!22335 () Bool)

(assert (=> start!71406 (= tp!46924 b_and!22335)))

(declare-fun b!828406 () Bool)

(declare-fun e!461572 () Bool)

(declare-fun e!461569 () Bool)

(declare-fun mapRes!24274 () Bool)

(assert (=> b!828406 (= e!461572 (and e!461569 mapRes!24274))))

(declare-fun condMapEmpty!24274 () Bool)

(declare-datatypes ((V!25131 0))(
  ( (V!25132 (val!7596 Int)) )
))
(declare-datatypes ((ValueCell!7133 0))(
  ( (ValueCellFull!7133 (v!10031 V!25131)) (EmptyCell!7133) )
))
(declare-datatypes ((array!46373 0))(
  ( (array!46374 (arr!22226 (Array (_ BitVec 32) ValueCell!7133)) (size!22646 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46373)

(declare-fun mapDefault!24274 () ValueCell!7133)

(assert (=> b!828406 (= condMapEmpty!24274 (= (arr!22226 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7133)) mapDefault!24274)))))

(declare-fun b!828407 () Bool)

(declare-fun res!564364 () Bool)

(declare-fun e!461570 () Bool)

(assert (=> b!828407 (=> (not res!564364) (not e!461570))))

(declare-datatypes ((array!46375 0))(
  ( (array!46376 (arr!22227 (Array (_ BitVec 32) (_ BitVec 64))) (size!22647 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46375)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!828407 (= res!564364 (and (= (size!22646 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22647 _keys!976) (size!22646 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828408 () Bool)

(declare-fun res!564366 () Bool)

(assert (=> b!828408 (=> (not res!564366) (not e!461570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46375 (_ BitVec 32)) Bool)

(assert (=> b!828408 (= res!564366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24274 () Bool)

(assert (=> mapIsEmpty!24274 mapRes!24274))

(declare-fun mapNonEmpty!24274 () Bool)

(declare-fun tp!46923 () Bool)

(declare-fun e!461568 () Bool)

(assert (=> mapNonEmpty!24274 (= mapRes!24274 (and tp!46923 e!461568))))

(declare-fun mapKey!24274 () (_ BitVec 32))

(declare-fun mapRest!24274 () (Array (_ BitVec 32) ValueCell!7133))

(declare-fun mapValue!24274 () ValueCell!7133)

(assert (=> mapNonEmpty!24274 (= (arr!22226 _values!788) (store mapRest!24274 mapKey!24274 mapValue!24274))))

(declare-fun b!828409 () Bool)

(declare-fun tp_is_empty!15097 () Bool)

(assert (=> b!828409 (= e!461569 tp_is_empty!15097)))

(declare-fun b!828410 () Bool)

(declare-fun res!564365 () Bool)

(assert (=> b!828410 (=> (not res!564365) (not e!461570))))

(declare-datatypes ((List!15770 0))(
  ( (Nil!15767) (Cons!15766 (h!16901 (_ BitVec 64)) (t!22111 List!15770)) )
))
(declare-fun arrayNoDuplicates!0 (array!46375 (_ BitVec 32) List!15770) Bool)

(assert (=> b!828410 (= res!564365 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15767))))

(declare-fun b!828411 () Bool)

(assert (=> b!828411 (= e!461570 false)))

(declare-fun zeroValueAfter!34 () V!25131)

(declare-fun minValue!754 () V!25131)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9996 0))(
  ( (tuple2!9997 (_1!5009 (_ BitVec 64)) (_2!5009 V!25131)) )
))
(declare-datatypes ((List!15771 0))(
  ( (Nil!15768) (Cons!15767 (h!16902 tuple2!9996) (t!22112 List!15771)) )
))
(declare-datatypes ((ListLongMap!8821 0))(
  ( (ListLongMap!8822 (toList!4426 List!15771)) )
))
(declare-fun lt!375280 () ListLongMap!8821)

(declare-fun getCurrentListMapNoExtraKeys!2503 (array!46375 array!46373 (_ BitVec 32) (_ BitVec 32) V!25131 V!25131 (_ BitVec 32) Int) ListLongMap!8821)

(assert (=> b!828411 (= lt!375280 (getCurrentListMapNoExtraKeys!2503 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25131)

(declare-fun lt!375281 () ListLongMap!8821)

(assert (=> b!828411 (= lt!375281 (getCurrentListMapNoExtraKeys!2503 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828412 () Bool)

(assert (=> b!828412 (= e!461568 tp_is_empty!15097)))

(declare-fun res!564363 () Bool)

(assert (=> start!71406 (=> (not res!564363) (not e!461570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71406 (= res!564363 (validMask!0 mask!1312))))

(assert (=> start!71406 e!461570))

(assert (=> start!71406 tp_is_empty!15097))

(declare-fun array_inv!17757 (array!46375) Bool)

(assert (=> start!71406 (array_inv!17757 _keys!976)))

(assert (=> start!71406 true))

(declare-fun array_inv!17758 (array!46373) Bool)

(assert (=> start!71406 (and (array_inv!17758 _values!788) e!461572)))

(assert (=> start!71406 tp!46924))

(assert (= (and start!71406 res!564363) b!828407))

(assert (= (and b!828407 res!564364) b!828408))

(assert (= (and b!828408 res!564366) b!828410))

(assert (= (and b!828410 res!564365) b!828411))

(assert (= (and b!828406 condMapEmpty!24274) mapIsEmpty!24274))

(assert (= (and b!828406 (not condMapEmpty!24274)) mapNonEmpty!24274))

(get-info :version)

(assert (= (and mapNonEmpty!24274 ((_ is ValueCellFull!7133) mapValue!24274)) b!828412))

(assert (= (and b!828406 ((_ is ValueCellFull!7133) mapDefault!24274)) b!828409))

(assert (= start!71406 b!828406))

(declare-fun m!771857 () Bool)

(assert (=> b!828408 m!771857))

(declare-fun m!771859 () Bool)

(assert (=> b!828410 m!771859))

(declare-fun m!771861 () Bool)

(assert (=> start!71406 m!771861))

(declare-fun m!771863 () Bool)

(assert (=> start!71406 m!771863))

(declare-fun m!771865 () Bool)

(assert (=> start!71406 m!771865))

(declare-fun m!771867 () Bool)

(assert (=> b!828411 m!771867))

(declare-fun m!771869 () Bool)

(assert (=> b!828411 m!771869))

(declare-fun m!771871 () Bool)

(assert (=> mapNonEmpty!24274 m!771871))

(check-sat (not b!828411) tp_is_empty!15097 (not b!828410) (not b!828408) b_and!22335 (not start!71406) (not mapNonEmpty!24274) (not b_next!13387))
(check-sat b_and!22335 (not b_next!13387))
