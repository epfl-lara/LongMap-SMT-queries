; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83146 () Bool)

(assert start!83146)

(declare-fun b!969416 () Bool)

(declare-fun e!546401 () Bool)

(declare-fun tp_is_empty!21913 () Bool)

(assert (=> b!969416 (= e!546401 tp_is_empty!21913)))

(declare-fun mapIsEmpty!34864 () Bool)

(declare-fun mapRes!34864 () Bool)

(assert (=> mapIsEmpty!34864 mapRes!34864))

(declare-fun b!969417 () Bool)

(declare-fun e!546397 () Bool)

(assert (=> b!969417 (= e!546397 (and e!546401 mapRes!34864))))

(declare-fun condMapEmpty!34864 () Bool)

(declare-datatypes ((V!34201 0))(
  ( (V!34202 (val!11007 Int)) )
))
(declare-datatypes ((ValueCell!10475 0))(
  ( (ValueCellFull!10475 (v!13562 V!34201)) (EmptyCell!10475) )
))
(declare-datatypes ((array!59912 0))(
  ( (array!59913 (arr!28820 (Array (_ BitVec 32) ValueCell!10475)) (size!29300 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59912)

(declare-fun mapDefault!34864 () ValueCell!10475)

(assert (=> b!969417 (= condMapEmpty!34864 (= (arr!28820 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10475)) mapDefault!34864)))))

(declare-fun res!648720 () Bool)

(declare-fun e!546398 () Bool)

(assert (=> start!83146 (=> (not res!648720) (not e!546398))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83146 (= res!648720 (validMask!0 mask!2147))))

(assert (=> start!83146 e!546398))

(assert (=> start!83146 true))

(declare-fun array_inv!22373 (array!59912) Bool)

(assert (=> start!83146 (and (array_inv!22373 _values!1425) e!546397)))

(declare-datatypes ((array!59914 0))(
  ( (array!59915 (arr!28821 (Array (_ BitVec 32) (_ BitVec 64))) (size!29301 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59914)

(declare-fun array_inv!22374 (array!59914) Bool)

(assert (=> start!83146 (array_inv!22374 _keys!1717)))

(declare-fun b!969415 () Bool)

(declare-fun e!546399 () Bool)

(assert (=> b!969415 (= e!546399 tp_is_empty!21913)))

(declare-fun b!969418 () Bool)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969418 (= e!546398 (and (= (size!29300 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29301 _keys!1717) (size!29300 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011) (= (size!29301 _keys!1717) (bvadd #b00000000000000000000000000000001 mask!2147)) (bvsgt #b00000000000000000000000000000000 (size!29301 _keys!1717))))))

(declare-fun mapNonEmpty!34864 () Bool)

(declare-fun tp!66433 () Bool)

(assert (=> mapNonEmpty!34864 (= mapRes!34864 (and tp!66433 e!546399))))

(declare-fun mapValue!34864 () ValueCell!10475)

(declare-fun mapRest!34864 () (Array (_ BitVec 32) ValueCell!10475))

(declare-fun mapKey!34864 () (_ BitVec 32))

(assert (=> mapNonEmpty!34864 (= (arr!28820 _values!1425) (store mapRest!34864 mapKey!34864 mapValue!34864))))

(assert (= (and start!83146 res!648720) b!969418))

(assert (= (and b!969417 condMapEmpty!34864) mapIsEmpty!34864))

(assert (= (and b!969417 (not condMapEmpty!34864)) mapNonEmpty!34864))

(get-info :version)

(assert (= (and mapNonEmpty!34864 ((_ is ValueCellFull!10475) mapValue!34864)) b!969415))

(assert (= (and b!969417 ((_ is ValueCellFull!10475) mapDefault!34864)) b!969416))

(assert (= start!83146 b!969417))

(declare-fun m!898141 () Bool)

(assert (=> start!83146 m!898141))

(declare-fun m!898143 () Bool)

(assert (=> start!83146 m!898143))

(declare-fun m!898145 () Bool)

(assert (=> start!83146 m!898145))

(declare-fun m!898147 () Bool)

(assert (=> mapNonEmpty!34864 m!898147))

(check-sat (not start!83146) (not mapNonEmpty!34864) tp_is_empty!21913)
(check-sat)
(get-model)

(declare-fun d!116555 () Bool)

(assert (=> d!116555 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!83146 d!116555))

(declare-fun d!116557 () Bool)

(assert (=> d!116557 (= (array_inv!22373 _values!1425) (bvsge (size!29300 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!83146 d!116557))

(declare-fun d!116559 () Bool)

(assert (=> d!116559 (= (array_inv!22374 _keys!1717) (bvsge (size!29301 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!83146 d!116559))

(declare-fun condMapEmpty!34873 () Bool)

(declare-fun mapDefault!34873 () ValueCell!10475)

(assert (=> mapNonEmpty!34864 (= condMapEmpty!34873 (= mapRest!34864 ((as const (Array (_ BitVec 32) ValueCell!10475)) mapDefault!34873)))))

(declare-fun e!546437 () Bool)

(declare-fun mapRes!34873 () Bool)

(assert (=> mapNonEmpty!34864 (= tp!66433 (and e!546437 mapRes!34873))))

(declare-fun b!969449 () Bool)

(declare-fun e!546436 () Bool)

(assert (=> b!969449 (= e!546436 tp_is_empty!21913)))

(declare-fun mapNonEmpty!34873 () Bool)

(declare-fun tp!66442 () Bool)

(assert (=> mapNonEmpty!34873 (= mapRes!34873 (and tp!66442 e!546436))))

(declare-fun mapValue!34873 () ValueCell!10475)

(declare-fun mapKey!34873 () (_ BitVec 32))

(declare-fun mapRest!34873 () (Array (_ BitVec 32) ValueCell!10475))

(assert (=> mapNonEmpty!34873 (= mapRest!34864 (store mapRest!34873 mapKey!34873 mapValue!34873))))

(declare-fun mapIsEmpty!34873 () Bool)

(assert (=> mapIsEmpty!34873 mapRes!34873))

(declare-fun b!969450 () Bool)

(assert (=> b!969450 (= e!546437 tp_is_empty!21913)))

(assert (= (and mapNonEmpty!34864 condMapEmpty!34873) mapIsEmpty!34873))

(assert (= (and mapNonEmpty!34864 (not condMapEmpty!34873)) mapNonEmpty!34873))

(assert (= (and mapNonEmpty!34873 ((_ is ValueCellFull!10475) mapValue!34873)) b!969449))

(assert (= (and mapNonEmpty!34864 ((_ is ValueCellFull!10475) mapDefault!34873)) b!969450))

(declare-fun m!898165 () Bool)

(assert (=> mapNonEmpty!34873 m!898165))

(check-sat (not mapNonEmpty!34873) tp_is_empty!21913)
(check-sat)
