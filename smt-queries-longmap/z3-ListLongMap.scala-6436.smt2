; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82394 () Bool)

(assert start!82394)

(declare-fun res!643119 () Bool)

(declare-fun e!541558 () Bool)

(assert (=> start!82394 (=> (not res!643119) (not e!541558))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82394 (= res!643119 (validMask!0 mask!2110))))

(assert (=> start!82394 e!541558))

(assert (=> start!82394 true))

(declare-datatypes ((V!33505 0))(
  ( (V!33506 (val!10746 Int)) )
))
(declare-datatypes ((ValueCell!10214 0))(
  ( (ValueCellFull!10214 (v!13302 V!33505)) (EmptyCell!10214) )
))
(declare-datatypes ((array!58808 0))(
  ( (array!58809 (arr!28278 (Array (_ BitVec 32) ValueCell!10214)) (size!28759 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58808)

(declare-fun e!541559 () Bool)

(declare-fun array_inv!21967 (array!58808) Bool)

(assert (=> start!82394 (and (array_inv!21967 _values!1400) e!541559)))

(declare-datatypes ((array!58810 0))(
  ( (array!58811 (arr!28279 (Array (_ BitVec 32) (_ BitVec 64))) (size!28760 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58810)

(declare-fun array_inv!21968 (array!58810) Bool)

(assert (=> start!82394 (array_inv!21968 _keys!1686)))

(declare-fun b!960713 () Bool)

(declare-fun e!541561 () Bool)

(declare-fun tp_is_empty!21391 () Bool)

(assert (=> b!960713 (= e!541561 tp_is_empty!21391)))

(declare-fun mapIsEmpty!34066 () Bool)

(declare-fun mapRes!34066 () Bool)

(assert (=> mapIsEmpty!34066 mapRes!34066))

(declare-fun mapNonEmpty!34066 () Bool)

(declare-fun tp!64996 () Bool)

(assert (=> mapNonEmpty!34066 (= mapRes!34066 (and tp!64996 e!541561))))

(declare-fun mapValue!34066 () ValueCell!10214)

(declare-fun mapRest!34066 () (Array (_ BitVec 32) ValueCell!10214))

(declare-fun mapKey!34066 () (_ BitVec 32))

(assert (=> mapNonEmpty!34066 (= (arr!28278 _values!1400) (store mapRest!34066 mapKey!34066 mapValue!34066))))

(declare-fun b!960714 () Bool)

(declare-fun e!541562 () Bool)

(assert (=> b!960714 (= e!541559 (and e!541562 mapRes!34066))))

(declare-fun condMapEmpty!34066 () Bool)

(declare-fun mapDefault!34066 () ValueCell!10214)

(assert (=> b!960714 (= condMapEmpty!34066 (= (arr!28278 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10214)) mapDefault!34066)))))

(declare-fun b!960715 () Bool)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!960715 (= e!541558 (and (= (size!28759 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28760 _keys!1686) (size!28759 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011) (= (size!28760 _keys!1686) (bvadd #b00000000000000000000000000000001 mask!2110)) (bvsgt #b00000000000000000000000000000000 (size!28760 _keys!1686))))))

(declare-fun b!960716 () Bool)

(assert (=> b!960716 (= e!541562 tp_is_empty!21391)))

(assert (= (and start!82394 res!643119) b!960715))

(assert (= (and b!960714 condMapEmpty!34066) mapIsEmpty!34066))

(assert (= (and b!960714 (not condMapEmpty!34066)) mapNonEmpty!34066))

(get-info :version)

(assert (= (and mapNonEmpty!34066 ((_ is ValueCellFull!10214) mapValue!34066)) b!960713))

(assert (= (and b!960714 ((_ is ValueCellFull!10214) mapDefault!34066)) b!960716))

(assert (= start!82394 b!960714))

(declare-fun m!890331 () Bool)

(assert (=> start!82394 m!890331))

(declare-fun m!890333 () Bool)

(assert (=> start!82394 m!890333))

(declare-fun m!890335 () Bool)

(assert (=> start!82394 m!890335))

(declare-fun m!890337 () Bool)

(assert (=> mapNonEmpty!34066 m!890337))

(check-sat (not start!82394) (not mapNonEmpty!34066) tp_is_empty!21391)
(check-sat)
(get-model)

(declare-fun d!115815 () Bool)

(assert (=> d!115815 (= (validMask!0 mask!2110) (and (or (= mask!2110 #b00000000000000000000000000000111) (= mask!2110 #b00000000000000000000000000001111) (= mask!2110 #b00000000000000000000000000011111) (= mask!2110 #b00000000000000000000000000111111) (= mask!2110 #b00000000000000000000000001111111) (= mask!2110 #b00000000000000000000000011111111) (= mask!2110 #b00000000000000000000000111111111) (= mask!2110 #b00000000000000000000001111111111) (= mask!2110 #b00000000000000000000011111111111) (= mask!2110 #b00000000000000000000111111111111) (= mask!2110 #b00000000000000000001111111111111) (= mask!2110 #b00000000000000000011111111111111) (= mask!2110 #b00000000000000000111111111111111) (= mask!2110 #b00000000000000001111111111111111) (= mask!2110 #b00000000000000011111111111111111) (= mask!2110 #b00000000000000111111111111111111) (= mask!2110 #b00000000000001111111111111111111) (= mask!2110 #b00000000000011111111111111111111) (= mask!2110 #b00000000000111111111111111111111) (= mask!2110 #b00000000001111111111111111111111) (= mask!2110 #b00000000011111111111111111111111) (= mask!2110 #b00000000111111111111111111111111) (= mask!2110 #b00000001111111111111111111111111) (= mask!2110 #b00000011111111111111111111111111) (= mask!2110 #b00000111111111111111111111111111) (= mask!2110 #b00001111111111111111111111111111) (= mask!2110 #b00011111111111111111111111111111) (= mask!2110 #b00111111111111111111111111111111)) (bvsle mask!2110 #b00111111111111111111111111111111)))))

(assert (=> start!82394 d!115815))

(declare-fun d!115817 () Bool)

(assert (=> d!115817 (= (array_inv!21967 _values!1400) (bvsge (size!28759 _values!1400) #b00000000000000000000000000000000))))

(assert (=> start!82394 d!115817))

(declare-fun d!115819 () Bool)

(assert (=> d!115819 (= (array_inv!21968 _keys!1686) (bvsge (size!28760 _keys!1686) #b00000000000000000000000000000000))))

(assert (=> start!82394 d!115819))

(declare-fun mapIsEmpty!34075 () Bool)

(declare-fun mapRes!34075 () Bool)

(assert (=> mapIsEmpty!34075 mapRes!34075))

(declare-fun b!960747 () Bool)

(declare-fun e!541597 () Bool)

(assert (=> b!960747 (= e!541597 tp_is_empty!21391)))

(declare-fun b!960748 () Bool)

(declare-fun e!541598 () Bool)

(assert (=> b!960748 (= e!541598 tp_is_empty!21391)))

(declare-fun condMapEmpty!34075 () Bool)

(declare-fun mapDefault!34075 () ValueCell!10214)

(assert (=> mapNonEmpty!34066 (= condMapEmpty!34075 (= mapRest!34066 ((as const (Array (_ BitVec 32) ValueCell!10214)) mapDefault!34075)))))

(assert (=> mapNonEmpty!34066 (= tp!64996 (and e!541598 mapRes!34075))))

(declare-fun mapNonEmpty!34075 () Bool)

(declare-fun tp!65005 () Bool)

(assert (=> mapNonEmpty!34075 (= mapRes!34075 (and tp!65005 e!541597))))

(declare-fun mapKey!34075 () (_ BitVec 32))

(declare-fun mapValue!34075 () ValueCell!10214)

(declare-fun mapRest!34075 () (Array (_ BitVec 32) ValueCell!10214))

(assert (=> mapNonEmpty!34075 (= mapRest!34066 (store mapRest!34075 mapKey!34075 mapValue!34075))))

(assert (= (and mapNonEmpty!34066 condMapEmpty!34075) mapIsEmpty!34075))

(assert (= (and mapNonEmpty!34066 (not condMapEmpty!34075)) mapNonEmpty!34075))

(assert (= (and mapNonEmpty!34075 ((_ is ValueCellFull!10214) mapValue!34075)) b!960747))

(assert (= (and mapNonEmpty!34066 ((_ is ValueCellFull!10214) mapDefault!34075)) b!960748))

(declare-fun m!890355 () Bool)

(assert (=> mapNonEmpty!34075 m!890355))

(check-sat (not mapNonEmpty!34075) tp_is_empty!21391)
(check-sat)
