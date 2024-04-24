; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71430 () Bool)

(assert start!71430)

(declare-fun b_free!13411 () Bool)

(declare-fun b_next!13411 () Bool)

(assert (=> start!71430 (= b_free!13411 (not b_next!13411))))

(declare-fun tp!46995 () Bool)

(declare-fun b_and!22359 () Bool)

(assert (=> start!71430 (= tp!46995 b_and!22359)))

(declare-fun mapNonEmpty!24310 () Bool)

(declare-fun mapRes!24310 () Bool)

(declare-fun tp!46996 () Bool)

(declare-fun e!461751 () Bool)

(assert (=> mapNonEmpty!24310 (= mapRes!24310 (and tp!46996 e!461751))))

(declare-fun mapKey!24310 () (_ BitVec 32))

(declare-datatypes ((V!25163 0))(
  ( (V!25164 (val!7608 Int)) )
))
(declare-datatypes ((ValueCell!7145 0))(
  ( (ValueCellFull!7145 (v!10043 V!25163)) (EmptyCell!7145) )
))
(declare-fun mapValue!24310 () ValueCell!7145)

(declare-fun mapRest!24310 () (Array (_ BitVec 32) ValueCell!7145))

(declare-datatypes ((array!46417 0))(
  ( (array!46418 (arr!22248 (Array (_ BitVec 32) ValueCell!7145)) (size!22668 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46417)

(assert (=> mapNonEmpty!24310 (= (arr!22248 _values!788) (store mapRest!24310 mapKey!24310 mapValue!24310))))

(declare-fun b!828658 () Bool)

(declare-fun e!461750 () Bool)

(declare-fun e!461749 () Bool)

(assert (=> b!828658 (= e!461750 (and e!461749 mapRes!24310))))

(declare-fun condMapEmpty!24310 () Bool)

(declare-fun mapDefault!24310 () ValueCell!7145)

(assert (=> b!828658 (= condMapEmpty!24310 (= (arr!22248 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7145)) mapDefault!24310)))))

(declare-fun mapIsEmpty!24310 () Bool)

(assert (=> mapIsEmpty!24310 mapRes!24310))

(declare-fun b!828659 () Bool)

(declare-fun res!564508 () Bool)

(declare-fun e!461748 () Bool)

(assert (=> b!828659 (=> (not res!564508) (not e!461748))))

(declare-datatypes ((array!46419 0))(
  ( (array!46420 (arr!22249 (Array (_ BitVec 32) (_ BitVec 64))) (size!22669 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46419)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46419 (_ BitVec 32)) Bool)

(assert (=> b!828659 (= res!564508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!828660 () Bool)

(declare-fun res!564509 () Bool)

(assert (=> b!828660 (=> (not res!564509) (not e!461748))))

(declare-datatypes ((List!15788 0))(
  ( (Nil!15785) (Cons!15784 (h!16919 (_ BitVec 64)) (t!22129 List!15788)) )
))
(declare-fun arrayNoDuplicates!0 (array!46419 (_ BitVec 32) List!15788) Bool)

(assert (=> b!828660 (= res!564509 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15785))))

(declare-fun b!828661 () Bool)

(declare-fun res!564507 () Bool)

(assert (=> b!828661 (=> (not res!564507) (not e!461748))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!828661 (= res!564507 (and (= (size!22668 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22669 _keys!976) (size!22668 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828662 () Bool)

(declare-fun tp_is_empty!15121 () Bool)

(assert (=> b!828662 (= e!461751 tp_is_empty!15121)))

(declare-fun b!828663 () Bool)

(assert (=> b!828663 (= e!461748 false)))

(declare-datatypes ((tuple2!10012 0))(
  ( (tuple2!10013 (_1!5017 (_ BitVec 64)) (_2!5017 V!25163)) )
))
(declare-datatypes ((List!15789 0))(
  ( (Nil!15786) (Cons!15785 (h!16920 tuple2!10012) (t!22130 List!15789)) )
))
(declare-datatypes ((ListLongMap!8837 0))(
  ( (ListLongMap!8838 (toList!4434 List!15789)) )
))
(declare-fun lt!375353 () ListLongMap!8837)

(declare-fun minValue!754 () V!25163)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!25163)

(declare-fun getCurrentListMapNoExtraKeys!2511 (array!46419 array!46417 (_ BitVec 32) (_ BitVec 32) V!25163 V!25163 (_ BitVec 32) Int) ListLongMap!8837)

(assert (=> b!828663 (= lt!375353 (getCurrentListMapNoExtraKeys!2511 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25163)

(declare-fun lt!375352 () ListLongMap!8837)

(assert (=> b!828663 (= lt!375352 (getCurrentListMapNoExtraKeys!2511 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828664 () Bool)

(assert (=> b!828664 (= e!461749 tp_is_empty!15121)))

(declare-fun res!564510 () Bool)

(assert (=> start!71430 (=> (not res!564510) (not e!461748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71430 (= res!564510 (validMask!0 mask!1312))))

(assert (=> start!71430 e!461748))

(assert (=> start!71430 tp_is_empty!15121))

(declare-fun array_inv!17773 (array!46419) Bool)

(assert (=> start!71430 (array_inv!17773 _keys!976)))

(assert (=> start!71430 true))

(declare-fun array_inv!17774 (array!46417) Bool)

(assert (=> start!71430 (and (array_inv!17774 _values!788) e!461750)))

(assert (=> start!71430 tp!46995))

(assert (= (and start!71430 res!564510) b!828661))

(assert (= (and b!828661 res!564507) b!828659))

(assert (= (and b!828659 res!564508) b!828660))

(assert (= (and b!828660 res!564509) b!828663))

(assert (= (and b!828658 condMapEmpty!24310) mapIsEmpty!24310))

(assert (= (and b!828658 (not condMapEmpty!24310)) mapNonEmpty!24310))

(get-info :version)

(assert (= (and mapNonEmpty!24310 ((_ is ValueCellFull!7145) mapValue!24310)) b!828662))

(assert (= (and b!828658 ((_ is ValueCellFull!7145) mapDefault!24310)) b!828664))

(assert (= start!71430 b!828658))

(declare-fun m!772049 () Bool)

(assert (=> mapNonEmpty!24310 m!772049))

(declare-fun m!772051 () Bool)

(assert (=> b!828660 m!772051))

(declare-fun m!772053 () Bool)

(assert (=> b!828663 m!772053))

(declare-fun m!772055 () Bool)

(assert (=> b!828663 m!772055))

(declare-fun m!772057 () Bool)

(assert (=> b!828659 m!772057))

(declare-fun m!772059 () Bool)

(assert (=> start!71430 m!772059))

(declare-fun m!772061 () Bool)

(assert (=> start!71430 m!772061))

(declare-fun m!772063 () Bool)

(assert (=> start!71430 m!772063))

(check-sat (not start!71430) (not b!828660) (not b!828659) (not mapNonEmpty!24310) (not b!828663) (not b_next!13411) b_and!22359 tp_is_empty!15121)
(check-sat b_and!22359 (not b_next!13411))
