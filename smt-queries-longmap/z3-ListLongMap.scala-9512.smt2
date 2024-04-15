; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112890 () Bool)

(assert start!112890)

(declare-datatypes ((array!90773 0))(
  ( (array!90774 (arr!43848 (Array (_ BitVec 32) (_ BitVec 64))) (size!44400 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90773)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54417 0))(
  ( (V!54418 (val!18567 Int)) )
))
(declare-datatypes ((ValueCell!17594 0))(
  ( (ValueCellFull!17594 (v!21213 V!54417)) (EmptyCell!17594) )
))
(declare-datatypes ((array!90775 0))(
  ( (array!90776 (arr!43849 (Array (_ BitVec 32) ValueCell!17594)) (size!44401 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90775)

(declare-fun b!1338579 () Bool)

(declare-fun e!762240 () Bool)

(declare-fun mask!1977 () (_ BitVec 32))

(assert (=> b!1338579 (= e!762240 (and (= (size!44401 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44400 _keys!1571) (size!44401 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011) (= (size!44400 _keys!1571) (bvadd #b00000000000000000000000000000001 mask!1977)) (bvsgt #b00000000000000000000000000000000 (size!44400 _keys!1571))))))

(declare-fun res!888131 () Bool)

(assert (=> start!112890 (=> (not res!888131) (not e!762240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112890 (= res!888131 (validMask!0 mask!1977))))

(assert (=> start!112890 e!762240))

(assert (=> start!112890 true))

(declare-fun e!762238 () Bool)

(declare-fun array_inv!33259 (array!90775) Bool)

(assert (=> start!112890 (and (array_inv!33259 _values!1303) e!762238)))

(declare-fun array_inv!33260 (array!90773) Bool)

(assert (=> start!112890 (array_inv!33260 _keys!1571)))

(declare-fun b!1338580 () Bool)

(declare-fun e!762239 () Bool)

(declare-fun tp_is_empty!36985 () Bool)

(assert (=> b!1338580 (= e!762239 tp_is_empty!36985)))

(declare-fun mapIsEmpty!57169 () Bool)

(declare-fun mapRes!57169 () Bool)

(assert (=> mapIsEmpty!57169 mapRes!57169))

(declare-fun b!1338581 () Bool)

(declare-fun e!762236 () Bool)

(assert (=> b!1338581 (= e!762238 (and e!762236 mapRes!57169))))

(declare-fun condMapEmpty!57169 () Bool)

(declare-fun mapDefault!57169 () ValueCell!17594)

(assert (=> b!1338581 (= condMapEmpty!57169 (= (arr!43849 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17594)) mapDefault!57169)))))

(declare-fun b!1338582 () Bool)

(assert (=> b!1338582 (= e!762236 tp_is_empty!36985)))

(declare-fun mapNonEmpty!57169 () Bool)

(declare-fun tp!108869 () Bool)

(assert (=> mapNonEmpty!57169 (= mapRes!57169 (and tp!108869 e!762239))))

(declare-fun mapKey!57169 () (_ BitVec 32))

(declare-fun mapValue!57169 () ValueCell!17594)

(declare-fun mapRest!57169 () (Array (_ BitVec 32) ValueCell!17594))

(assert (=> mapNonEmpty!57169 (= (arr!43849 _values!1303) (store mapRest!57169 mapKey!57169 mapValue!57169))))

(assert (= (and start!112890 res!888131) b!1338579))

(assert (= (and b!1338581 condMapEmpty!57169) mapIsEmpty!57169))

(assert (= (and b!1338581 (not condMapEmpty!57169)) mapNonEmpty!57169))

(get-info :version)

(assert (= (and mapNonEmpty!57169 ((_ is ValueCellFull!17594) mapValue!57169)) b!1338580))

(assert (= (and b!1338581 ((_ is ValueCellFull!17594) mapDefault!57169)) b!1338582))

(assert (= start!112890 b!1338581))

(declare-fun m!1226481 () Bool)

(assert (=> start!112890 m!1226481))

(declare-fun m!1226483 () Bool)

(assert (=> start!112890 m!1226483))

(declare-fun m!1226485 () Bool)

(assert (=> start!112890 m!1226485))

(declare-fun m!1226487 () Bool)

(assert (=> mapNonEmpty!57169 m!1226487))

(check-sat (not start!112890) (not mapNonEmpty!57169) tp_is_empty!36985)
(check-sat)
(get-model)

(declare-fun d!143957 () Bool)

(assert (=> d!143957 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!112890 d!143957))

(declare-fun d!143959 () Bool)

(assert (=> d!143959 (= (array_inv!33259 _values!1303) (bvsge (size!44401 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!112890 d!143959))

(declare-fun d!143961 () Bool)

(assert (=> d!143961 (= (array_inv!33260 _keys!1571) (bvsge (size!44400 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!112890 d!143961))

(declare-fun mapIsEmpty!57178 () Bool)

(declare-fun mapRes!57178 () Bool)

(assert (=> mapIsEmpty!57178 mapRes!57178))

(declare-fun condMapEmpty!57178 () Bool)

(declare-fun mapDefault!57178 () ValueCell!17594)

(assert (=> mapNonEmpty!57169 (= condMapEmpty!57178 (= mapRest!57169 ((as const (Array (_ BitVec 32) ValueCell!17594)) mapDefault!57178)))))

(declare-fun e!762275 () Bool)

(assert (=> mapNonEmpty!57169 (= tp!108869 (and e!762275 mapRes!57178))))

(declare-fun b!1338613 () Bool)

(declare-fun e!762276 () Bool)

(assert (=> b!1338613 (= e!762276 tp_is_empty!36985)))

(declare-fun mapNonEmpty!57178 () Bool)

(declare-fun tp!108878 () Bool)

(assert (=> mapNonEmpty!57178 (= mapRes!57178 (and tp!108878 e!762276))))

(declare-fun mapRest!57178 () (Array (_ BitVec 32) ValueCell!17594))

(declare-fun mapKey!57178 () (_ BitVec 32))

(declare-fun mapValue!57178 () ValueCell!17594)

(assert (=> mapNonEmpty!57178 (= mapRest!57169 (store mapRest!57178 mapKey!57178 mapValue!57178))))

(declare-fun b!1338614 () Bool)

(assert (=> b!1338614 (= e!762275 tp_is_empty!36985)))

(assert (= (and mapNonEmpty!57169 condMapEmpty!57178) mapIsEmpty!57178))

(assert (= (and mapNonEmpty!57169 (not condMapEmpty!57178)) mapNonEmpty!57178))

(assert (= (and mapNonEmpty!57178 ((_ is ValueCellFull!17594) mapValue!57178)) b!1338613))

(assert (= (and mapNonEmpty!57169 ((_ is ValueCellFull!17594) mapDefault!57178)) b!1338614))

(declare-fun m!1226505 () Bool)

(assert (=> mapNonEmpty!57178 m!1226505))

(check-sat (not mapNonEmpty!57178) tp_is_empty!36985)
(check-sat)
