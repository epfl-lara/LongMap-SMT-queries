; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82980 () Bool)

(assert start!82980)

(declare-fun mapNonEmpty!34867 () Bool)

(declare-fun mapRes!34867 () Bool)

(declare-fun tp!66435 () Bool)

(declare-fun e!545830 () Bool)

(assert (=> mapNonEmpty!34867 (= mapRes!34867 (and tp!66435 e!545830))))

(declare-fun mapKey!34867 () (_ BitVec 32))

(declare-datatypes ((V!34203 0))(
  ( (V!34204 (val!11008 Int)) )
))
(declare-datatypes ((ValueCell!10476 0))(
  ( (ValueCellFull!10476 (v!13566 V!34203)) (EmptyCell!10476) )
))
(declare-datatypes ((array!59899 0))(
  ( (array!59900 (arr!28818 (Array (_ BitVec 32) ValueCell!10476)) (size!29297 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59899)

(declare-fun mapValue!34867 () ValueCell!10476)

(declare-fun mapRest!34867 () (Array (_ BitVec 32) ValueCell!10476))

(assert (=> mapNonEmpty!34867 (= (arr!28818 _values!1425) (store mapRest!34867 mapKey!34867 mapValue!34867))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun e!545831 () Bool)

(declare-fun b!968524 () Bool)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!59901 0))(
  ( (array!59902 (arr!28819 (Array (_ BitVec 32) (_ BitVec 64))) (size!29298 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59901)

(assert (=> b!968524 (= e!545831 (and (= (size!29297 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29298 _keys!1717) (size!29297 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011) (= (size!29298 _keys!1717) (bvadd #b00000000000000000000000000000001 mask!2147)) (bvsgt #b00000000000000000000000000000000 (size!29298 _keys!1717))))))

(declare-fun b!968525 () Bool)

(declare-fun e!545833 () Bool)

(declare-fun tp_is_empty!21915 () Bool)

(assert (=> b!968525 (= e!545833 tp_is_empty!21915)))

(declare-fun mapIsEmpty!34867 () Bool)

(assert (=> mapIsEmpty!34867 mapRes!34867))

(declare-fun b!968526 () Bool)

(declare-fun e!545834 () Bool)

(assert (=> b!968526 (= e!545834 (and e!545833 mapRes!34867))))

(declare-fun condMapEmpty!34867 () Bool)

(declare-fun mapDefault!34867 () ValueCell!10476)

(assert (=> b!968526 (= condMapEmpty!34867 (= (arr!28818 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10476)) mapDefault!34867)))))

(declare-fun b!968527 () Bool)

(assert (=> b!968527 (= e!545830 tp_is_empty!21915)))

(declare-fun res!648379 () Bool)

(assert (=> start!82980 (=> (not res!648379) (not e!545831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82980 (= res!648379 (validMask!0 mask!2147))))

(assert (=> start!82980 e!545831))

(assert (=> start!82980 true))

(declare-fun array_inv!22309 (array!59899) Bool)

(assert (=> start!82980 (and (array_inv!22309 _values!1425) e!545834)))

(declare-fun array_inv!22310 (array!59901) Bool)

(assert (=> start!82980 (array_inv!22310 _keys!1717)))

(assert (= (and start!82980 res!648379) b!968524))

(assert (= (and b!968526 condMapEmpty!34867) mapIsEmpty!34867))

(assert (= (and b!968526 (not condMapEmpty!34867)) mapNonEmpty!34867))

(get-info :version)

(assert (= (and mapNonEmpty!34867 ((_ is ValueCellFull!10476) mapValue!34867)) b!968527))

(assert (= (and b!968526 ((_ is ValueCellFull!10476) mapDefault!34867)) b!968525))

(assert (= start!82980 b!968526))

(declare-fun m!896855 () Bool)

(assert (=> mapNonEmpty!34867 m!896855))

(declare-fun m!896857 () Bool)

(assert (=> start!82980 m!896857))

(declare-fun m!896859 () Bool)

(assert (=> start!82980 m!896859))

(declare-fun m!896861 () Bool)

(assert (=> start!82980 m!896861))

(check-sat (not start!82980) (not mapNonEmpty!34867) tp_is_empty!21915)
(check-sat)
(get-model)

(declare-fun d!116233 () Bool)

(assert (=> d!116233 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!82980 d!116233))

(declare-fun d!116235 () Bool)

(assert (=> d!116235 (= (array_inv!22309 _values!1425) (bvsge (size!29297 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!82980 d!116235))

(declare-fun d!116237 () Bool)

(assert (=> d!116237 (= (array_inv!22310 _keys!1717) (bvsge (size!29298 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!82980 d!116237))

(declare-fun mapIsEmpty!34873 () Bool)

(declare-fun mapRes!34873 () Bool)

(assert (=> mapIsEmpty!34873 mapRes!34873))

(declare-fun mapNonEmpty!34873 () Bool)

(declare-fun tp!66441 () Bool)

(declare-fun e!545855 () Bool)

(assert (=> mapNonEmpty!34873 (= mapRes!34873 (and tp!66441 e!545855))))

(declare-fun mapValue!34873 () ValueCell!10476)

(declare-fun mapKey!34873 () (_ BitVec 32))

(declare-fun mapRest!34873 () (Array (_ BitVec 32) ValueCell!10476))

(assert (=> mapNonEmpty!34873 (= mapRest!34867 (store mapRest!34873 mapKey!34873 mapValue!34873))))

(declare-fun condMapEmpty!34873 () Bool)

(declare-fun mapDefault!34873 () ValueCell!10476)

(assert (=> mapNonEmpty!34867 (= condMapEmpty!34873 (= mapRest!34867 ((as const (Array (_ BitVec 32) ValueCell!10476)) mapDefault!34873)))))

(declare-fun e!545854 () Bool)

(assert (=> mapNonEmpty!34867 (= tp!66435 (and e!545854 mapRes!34873))))

(declare-fun b!968547 () Bool)

(assert (=> b!968547 (= e!545854 tp_is_empty!21915)))

(declare-fun b!968546 () Bool)

(assert (=> b!968546 (= e!545855 tp_is_empty!21915)))

(assert (= (and mapNonEmpty!34867 condMapEmpty!34873) mapIsEmpty!34873))

(assert (= (and mapNonEmpty!34867 (not condMapEmpty!34873)) mapNonEmpty!34873))

(assert (= (and mapNonEmpty!34873 ((_ is ValueCellFull!10476) mapValue!34873)) b!968546))

(assert (= (and mapNonEmpty!34867 ((_ is ValueCellFull!10476) mapDefault!34873)) b!968547))

(declare-fun m!896871 () Bool)

(assert (=> mapNonEmpty!34873 m!896871))

(check-sat (not mapNonEmpty!34873) tp_is_empty!21915)
(check-sat)
