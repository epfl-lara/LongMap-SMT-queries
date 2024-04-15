; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83600 () Bool)

(assert start!83600)

(declare-fun mapIsEmpty!35711 () Bool)

(declare-fun mapRes!35711 () Bool)

(assert (=> mapIsEmpty!35711 mapRes!35711))

(declare-fun b!976699 () Bool)

(declare-fun e!550473 () Bool)

(declare-fun e!550469 () Bool)

(assert (=> b!976699 (= e!550473 (and e!550469 mapRes!35711))))

(declare-fun condMapEmpty!35711 () Bool)

(declare-datatypes ((V!34937 0))(
  ( (V!34938 (val!11283 Int)) )
))
(declare-datatypes ((ValueCell!10751 0))(
  ( (ValueCellFull!10751 (v!13843 V!34937)) (EmptyCell!10751) )
))
(declare-datatypes ((array!60890 0))(
  ( (array!60891 (arr!29308 (Array (_ BitVec 32) ValueCell!10751)) (size!29789 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60890)

(declare-fun mapDefault!35711 () ValueCell!10751)

(assert (=> b!976699 (= condMapEmpty!35711 (= (arr!29308 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10751)) mapDefault!35711)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun b!976700 () Bool)

(declare-fun e!550470 () Bool)

(declare-datatypes ((array!60892 0))(
  ( (array!60893 (arr!29309 (Array (_ BitVec 32) (_ BitVec 64))) (size!29790 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60892)

(assert (=> b!976700 (= e!550470 (and (= (size!29789 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29790 _keys!1544) (size!29789 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011) (= (size!29790 _keys!1544) (bvadd #b00000000000000000000000000000001 mask!1948)) (bvsgt #b00000000000000000000000000000000 (size!29790 _keys!1544))))))

(declare-fun b!976701 () Bool)

(declare-fun e!550472 () Bool)

(declare-fun tp_is_empty!22465 () Bool)

(assert (=> b!976701 (= e!550472 tp_is_empty!22465)))

(declare-fun res!653818 () Bool)

(assert (=> start!83600 (=> (not res!653818) (not e!550470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83600 (= res!653818 (validMask!0 mask!1948))))

(assert (=> start!83600 e!550470))

(assert (=> start!83600 true))

(declare-fun array_inv!22701 (array!60890) Bool)

(assert (=> start!83600 (and (array_inv!22701 _values!1278) e!550473)))

(declare-fun array_inv!22702 (array!60892) Bool)

(assert (=> start!83600 (array_inv!22702 _keys!1544)))

(declare-fun mapNonEmpty!35711 () Bool)

(declare-fun tp!67964 () Bool)

(assert (=> mapNonEmpty!35711 (= mapRes!35711 (and tp!67964 e!550472))))

(declare-fun mapRest!35711 () (Array (_ BitVec 32) ValueCell!10751))

(declare-fun mapKey!35711 () (_ BitVec 32))

(declare-fun mapValue!35711 () ValueCell!10751)

(assert (=> mapNonEmpty!35711 (= (arr!29308 _values!1278) (store mapRest!35711 mapKey!35711 mapValue!35711))))

(declare-fun b!976702 () Bool)

(assert (=> b!976702 (= e!550469 tp_is_empty!22465)))

(assert (= (and start!83600 res!653818) b!976700))

(assert (= (and b!976699 condMapEmpty!35711) mapIsEmpty!35711))

(assert (= (and b!976699 (not condMapEmpty!35711)) mapNonEmpty!35711))

(get-info :version)

(assert (= (and mapNonEmpty!35711 ((_ is ValueCellFull!10751) mapValue!35711)) b!976701))

(assert (= (and b!976699 ((_ is ValueCellFull!10751) mapDefault!35711)) b!976702))

(assert (= start!83600 b!976699))

(declare-fun m!903637 () Bool)

(assert (=> start!83600 m!903637))

(declare-fun m!903639 () Bool)

(assert (=> start!83600 m!903639))

(declare-fun m!903641 () Bool)

(assert (=> start!83600 m!903641))

(declare-fun m!903643 () Bool)

(assert (=> mapNonEmpty!35711 m!903643))

(check-sat (not start!83600) (not mapNonEmpty!35711) tp_is_empty!22465)
(check-sat)
(get-model)

(declare-fun d!116419 () Bool)

(assert (=> d!116419 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!83600 d!116419))

(declare-fun d!116421 () Bool)

(assert (=> d!116421 (= (array_inv!22701 _values!1278) (bvsge (size!29789 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!83600 d!116421))

(declare-fun d!116423 () Bool)

(assert (=> d!116423 (= (array_inv!22702 _keys!1544) (bvsge (size!29790 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!83600 d!116423))

(declare-fun mapIsEmpty!35720 () Bool)

(declare-fun mapRes!35720 () Bool)

(assert (=> mapIsEmpty!35720 mapRes!35720))

(declare-fun b!976734 () Bool)

(declare-fun e!550509 () Bool)

(assert (=> b!976734 (= e!550509 tp_is_empty!22465)))

(declare-fun mapNonEmpty!35720 () Bool)

(declare-fun tp!67973 () Bool)

(declare-fun e!550508 () Bool)

(assert (=> mapNonEmpty!35720 (= mapRes!35720 (and tp!67973 e!550508))))

(declare-fun mapKey!35720 () (_ BitVec 32))

(declare-fun mapValue!35720 () ValueCell!10751)

(declare-fun mapRest!35720 () (Array (_ BitVec 32) ValueCell!10751))

(assert (=> mapNonEmpty!35720 (= mapRest!35711 (store mapRest!35720 mapKey!35720 mapValue!35720))))

(declare-fun b!976733 () Bool)

(assert (=> b!976733 (= e!550508 tp_is_empty!22465)))

(declare-fun condMapEmpty!35720 () Bool)

(declare-fun mapDefault!35720 () ValueCell!10751)

(assert (=> mapNonEmpty!35711 (= condMapEmpty!35720 (= mapRest!35711 ((as const (Array (_ BitVec 32) ValueCell!10751)) mapDefault!35720)))))

(assert (=> mapNonEmpty!35711 (= tp!67964 (and e!550509 mapRes!35720))))

(assert (= (and mapNonEmpty!35711 condMapEmpty!35720) mapIsEmpty!35720))

(assert (= (and mapNonEmpty!35711 (not condMapEmpty!35720)) mapNonEmpty!35720))

(assert (= (and mapNonEmpty!35720 ((_ is ValueCellFull!10751) mapValue!35720)) b!976733))

(assert (= (and mapNonEmpty!35711 ((_ is ValueCellFull!10751) mapDefault!35720)) b!976734))

(declare-fun m!903661 () Bool)

(assert (=> mapNonEmpty!35720 m!903661))

(check-sat (not mapNonEmpty!35720) tp_is_empty!22465)
(check-sat)
