; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82414 () Bool)

(assert start!82414)

(declare-fun b!960964 () Bool)

(declare-fun e!541724 () Bool)

(declare-fun e!541721 () Bool)

(declare-fun mapRes!34069 () Bool)

(assert (=> b!960964 (= e!541724 (and e!541721 mapRes!34069))))

(declare-fun condMapEmpty!34069 () Bool)

(declare-datatypes ((V!33507 0))(
  ( (V!33508 (val!10747 Int)) )
))
(declare-datatypes ((ValueCell!10215 0))(
  ( (ValueCellFull!10215 (v!13304 V!33507)) (EmptyCell!10215) )
))
(declare-datatypes ((array!58873 0))(
  ( (array!58874 (arr!28310 (Array (_ BitVec 32) ValueCell!10215)) (size!28789 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58873)

(declare-fun mapDefault!34069 () ValueCell!10215)

(assert (=> b!960964 (= condMapEmpty!34069 (= (arr!28310 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10215)) mapDefault!34069)))))

(declare-fun b!960965 () Bool)

(declare-fun e!541725 () Bool)

(declare-fun tp_is_empty!21393 () Bool)

(assert (=> b!960965 (= e!541725 tp_is_empty!21393)))

(declare-fun res!643232 () Bool)

(declare-fun e!541722 () Bool)

(assert (=> start!82414 (=> (not res!643232) (not e!541722))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82414 (= res!643232 (validMask!0 mask!2110))))

(assert (=> start!82414 e!541722))

(assert (=> start!82414 true))

(declare-fun array_inv!21935 (array!58873) Bool)

(assert (=> start!82414 (and (array_inv!21935 _values!1400) e!541724)))

(declare-datatypes ((array!58875 0))(
  ( (array!58876 (arr!28311 (Array (_ BitVec 32) (_ BitVec 64))) (size!28790 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58875)

(declare-fun array_inv!21936 (array!58875) Bool)

(assert (=> start!82414 (array_inv!21936 _keys!1686)))

(declare-fun b!960966 () Bool)

(assert (=> b!960966 (= e!541721 tp_is_empty!21393)))

(declare-fun mapNonEmpty!34069 () Bool)

(declare-fun tp!64998 () Bool)

(assert (=> mapNonEmpty!34069 (= mapRes!34069 (and tp!64998 e!541725))))

(declare-fun mapRest!34069 () (Array (_ BitVec 32) ValueCell!10215))

(declare-fun mapKey!34069 () (_ BitVec 32))

(declare-fun mapValue!34069 () ValueCell!10215)

(assert (=> mapNonEmpty!34069 (= (arr!28310 _values!1400) (store mapRest!34069 mapKey!34069 mapValue!34069))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun b!960967 () Bool)

(assert (=> b!960967 (= e!541722 (and (= (size!28789 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28790 _keys!1686) (size!28789 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011) (= (size!28790 _keys!1686) (bvadd #b00000000000000000000000000000001 mask!2110)) (bvsgt #b00000000000000000000000000000000 (size!28790 _keys!1686))))))

(declare-fun mapIsEmpty!34069 () Bool)

(assert (=> mapIsEmpty!34069 mapRes!34069))

(assert (= (and start!82414 res!643232) b!960967))

(assert (= (and b!960964 condMapEmpty!34069) mapIsEmpty!34069))

(assert (= (and b!960964 (not condMapEmpty!34069)) mapNonEmpty!34069))

(get-info :version)

(assert (= (and mapNonEmpty!34069 ((_ is ValueCellFull!10215) mapValue!34069)) b!960965))

(assert (= (and b!960964 ((_ is ValueCellFull!10215) mapDefault!34069)) b!960966))

(assert (= start!82414 b!960964))

(declare-fun m!891097 () Bool)

(assert (=> start!82414 m!891097))

(declare-fun m!891099 () Bool)

(assert (=> start!82414 m!891099))

(declare-fun m!891101 () Bool)

(assert (=> start!82414 m!891101))

(declare-fun m!891103 () Bool)

(assert (=> mapNonEmpty!34069 m!891103))

(check-sat (not start!82414) (not mapNonEmpty!34069) tp_is_empty!21393)
(check-sat)
(get-model)

(declare-fun d!116013 () Bool)

(assert (=> d!116013 (= (validMask!0 mask!2110) (and (or (= mask!2110 #b00000000000000000000000000000111) (= mask!2110 #b00000000000000000000000000001111) (= mask!2110 #b00000000000000000000000000011111) (= mask!2110 #b00000000000000000000000000111111) (= mask!2110 #b00000000000000000000000001111111) (= mask!2110 #b00000000000000000000000011111111) (= mask!2110 #b00000000000000000000000111111111) (= mask!2110 #b00000000000000000000001111111111) (= mask!2110 #b00000000000000000000011111111111) (= mask!2110 #b00000000000000000000111111111111) (= mask!2110 #b00000000000000000001111111111111) (= mask!2110 #b00000000000000000011111111111111) (= mask!2110 #b00000000000000000111111111111111) (= mask!2110 #b00000000000000001111111111111111) (= mask!2110 #b00000000000000011111111111111111) (= mask!2110 #b00000000000000111111111111111111) (= mask!2110 #b00000000000001111111111111111111) (= mask!2110 #b00000000000011111111111111111111) (= mask!2110 #b00000000000111111111111111111111) (= mask!2110 #b00000000001111111111111111111111) (= mask!2110 #b00000000011111111111111111111111) (= mask!2110 #b00000000111111111111111111111111) (= mask!2110 #b00000001111111111111111111111111) (= mask!2110 #b00000011111111111111111111111111) (= mask!2110 #b00000111111111111111111111111111) (= mask!2110 #b00001111111111111111111111111111) (= mask!2110 #b00011111111111111111111111111111) (= mask!2110 #b00111111111111111111111111111111)) (bvsle mask!2110 #b00111111111111111111111111111111)))))

(assert (=> start!82414 d!116013))

(declare-fun d!116015 () Bool)

(assert (=> d!116015 (= (array_inv!21935 _values!1400) (bvsge (size!28789 _values!1400) #b00000000000000000000000000000000))))

(assert (=> start!82414 d!116015))

(declare-fun d!116017 () Bool)

(assert (=> d!116017 (= (array_inv!21936 _keys!1686) (bvsge (size!28790 _keys!1686) #b00000000000000000000000000000000))))

(assert (=> start!82414 d!116017))

(declare-fun b!960987 () Bool)

(declare-fun e!541746 () Bool)

(assert (=> b!960987 (= e!541746 tp_is_empty!21393)))

(declare-fun b!960986 () Bool)

(declare-fun e!541745 () Bool)

(assert (=> b!960986 (= e!541745 tp_is_empty!21393)))

(declare-fun condMapEmpty!34075 () Bool)

(declare-fun mapDefault!34075 () ValueCell!10215)

(assert (=> mapNonEmpty!34069 (= condMapEmpty!34075 (= mapRest!34069 ((as const (Array (_ BitVec 32) ValueCell!10215)) mapDefault!34075)))))

(declare-fun mapRes!34075 () Bool)

(assert (=> mapNonEmpty!34069 (= tp!64998 (and e!541746 mapRes!34075))))

(declare-fun mapIsEmpty!34075 () Bool)

(assert (=> mapIsEmpty!34075 mapRes!34075))

(declare-fun mapNonEmpty!34075 () Bool)

(declare-fun tp!65004 () Bool)

(assert (=> mapNonEmpty!34075 (= mapRes!34075 (and tp!65004 e!541745))))

(declare-fun mapValue!34075 () ValueCell!10215)

(declare-fun mapRest!34075 () (Array (_ BitVec 32) ValueCell!10215))

(declare-fun mapKey!34075 () (_ BitVec 32))

(assert (=> mapNonEmpty!34075 (= mapRest!34069 (store mapRest!34075 mapKey!34075 mapValue!34075))))

(assert (= (and mapNonEmpty!34069 condMapEmpty!34075) mapIsEmpty!34075))

(assert (= (and mapNonEmpty!34069 (not condMapEmpty!34075)) mapNonEmpty!34075))

(assert (= (and mapNonEmpty!34075 ((_ is ValueCellFull!10215) mapValue!34075)) b!960986))

(assert (= (and mapNonEmpty!34069 ((_ is ValueCellFull!10215) mapDefault!34075)) b!960987))

(declare-fun m!891113 () Bool)

(assert (=> mapNonEmpty!34075 m!891113))

(check-sat (not mapNonEmpty!34075) tp_is_empty!21393)
(check-sat)
