; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112892 () Bool)

(assert start!112892)

(declare-fun res!888163 () Bool)

(declare-fun e!762288 () Bool)

(assert (=> start!112892 (=> (not res!888163) (not e!762288))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112892 (= res!888163 (validMask!0 mask!1977))))

(assert (=> start!112892 e!762288))

(assert (=> start!112892 true))

(declare-datatypes ((V!54419 0))(
  ( (V!54420 (val!18568 Int)) )
))
(declare-datatypes ((ValueCell!17595 0))(
  ( (ValueCellFull!17595 (v!21215 V!54419)) (EmptyCell!17595) )
))
(declare-datatypes ((array!90832 0))(
  ( (array!90833 (arr!43877 (Array (_ BitVec 32) ValueCell!17595)) (size!44427 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90832)

(declare-fun e!762286 () Bool)

(declare-fun array_inv!33089 (array!90832) Bool)

(assert (=> start!112892 (and (array_inv!33089 _values!1303) e!762286)))

(declare-datatypes ((array!90834 0))(
  ( (array!90835 (arr!43878 (Array (_ BitVec 32) (_ BitVec 64))) (size!44428 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90834)

(declare-fun array_inv!33090 (array!90834) Bool)

(assert (=> start!112892 (array_inv!33090 _keys!1571)))

(declare-fun mapNonEmpty!57172 () Bool)

(declare-fun mapRes!57172 () Bool)

(declare-fun tp!108871 () Bool)

(declare-fun e!762287 () Bool)

(assert (=> mapNonEmpty!57172 (= mapRes!57172 (and tp!108871 e!762287))))

(declare-fun mapKey!57172 () (_ BitVec 32))

(declare-fun mapValue!57172 () ValueCell!17595)

(declare-fun mapRest!57172 () (Array (_ BitVec 32) ValueCell!17595))

(assert (=> mapNonEmpty!57172 (= (arr!43877 _values!1303) (store mapRest!57172 mapKey!57172 mapValue!57172))))

(declare-fun b!1338661 () Bool)

(declare-fun e!762285 () Bool)

(declare-fun tp_is_empty!36987 () Bool)

(assert (=> b!1338661 (= e!762285 tp_is_empty!36987)))

(declare-fun b!1338662 () Bool)

(assert (=> b!1338662 (= e!762286 (and e!762285 mapRes!57172))))

(declare-fun condMapEmpty!57172 () Bool)

(declare-fun mapDefault!57172 () ValueCell!17595)

(assert (=> b!1338662 (= condMapEmpty!57172 (= (arr!43877 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17595)) mapDefault!57172)))))

(declare-fun mapIsEmpty!57172 () Bool)

(assert (=> mapIsEmpty!57172 mapRes!57172))

(declare-fun b!1338663 () Bool)

(assert (=> b!1338663 (= e!762287 tp_is_empty!36987)))

(declare-fun b!1338664 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1338664 (= e!762288 (and (= (size!44427 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44428 _keys!1571) (size!44427 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011) (= (size!44428 _keys!1571) (bvadd #b00000000000000000000000000000001 mask!1977)) (bvsgt #b00000000000000000000000000000000 (size!44428 _keys!1571))))))

(assert (= (and start!112892 res!888163) b!1338664))

(assert (= (and b!1338662 condMapEmpty!57172) mapIsEmpty!57172))

(assert (= (and b!1338662 (not condMapEmpty!57172)) mapNonEmpty!57172))

(get-info :version)

(assert (= (and mapNonEmpty!57172 ((_ is ValueCellFull!17595) mapValue!57172)) b!1338663))

(assert (= (and b!1338662 ((_ is ValueCellFull!17595) mapDefault!57172)) b!1338661))

(assert (= start!112892 b!1338662))

(declare-fun m!1227005 () Bool)

(assert (=> start!112892 m!1227005))

(declare-fun m!1227007 () Bool)

(assert (=> start!112892 m!1227007))

(declare-fun m!1227009 () Bool)

(assert (=> start!112892 m!1227009))

(declare-fun m!1227011 () Bool)

(assert (=> mapNonEmpty!57172 m!1227011))

(check-sat (not start!112892) (not mapNonEmpty!57172) tp_is_empty!36987)
(check-sat)
(get-model)

(declare-fun d!144073 () Bool)

(assert (=> d!144073 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!112892 d!144073))

(declare-fun d!144075 () Bool)

(assert (=> d!144075 (= (array_inv!33089 _values!1303) (bvsge (size!44427 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!112892 d!144075))

(declare-fun d!144077 () Bool)

(assert (=> d!144077 (= (array_inv!33090 _keys!1571) (bvsge (size!44428 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!112892 d!144077))

(declare-fun mapNonEmpty!57178 () Bool)

(declare-fun mapRes!57178 () Bool)

(declare-fun tp!108877 () Bool)

(declare-fun e!762309 () Bool)

(assert (=> mapNonEmpty!57178 (= mapRes!57178 (and tp!108877 e!762309))))

(declare-fun mapRest!57178 () (Array (_ BitVec 32) ValueCell!17595))

(declare-fun mapValue!57178 () ValueCell!17595)

(declare-fun mapKey!57178 () (_ BitVec 32))

(assert (=> mapNonEmpty!57178 (= mapRest!57172 (store mapRest!57178 mapKey!57178 mapValue!57178))))

(declare-fun b!1338683 () Bool)

(assert (=> b!1338683 (= e!762309 tp_is_empty!36987)))

(declare-fun mapIsEmpty!57178 () Bool)

(assert (=> mapIsEmpty!57178 mapRes!57178))

(declare-fun condMapEmpty!57178 () Bool)

(declare-fun mapDefault!57178 () ValueCell!17595)

(assert (=> mapNonEmpty!57172 (= condMapEmpty!57178 (= mapRest!57172 ((as const (Array (_ BitVec 32) ValueCell!17595)) mapDefault!57178)))))

(declare-fun e!762308 () Bool)

(assert (=> mapNonEmpty!57172 (= tp!108871 (and e!762308 mapRes!57178))))

(declare-fun b!1338684 () Bool)

(assert (=> b!1338684 (= e!762308 tp_is_empty!36987)))

(assert (= (and mapNonEmpty!57172 condMapEmpty!57178) mapIsEmpty!57178))

(assert (= (and mapNonEmpty!57172 (not condMapEmpty!57178)) mapNonEmpty!57178))

(assert (= (and mapNonEmpty!57178 ((_ is ValueCellFull!17595) mapValue!57178)) b!1338683))

(assert (= (and mapNonEmpty!57172 ((_ is ValueCellFull!17595) mapDefault!57178)) b!1338684))

(declare-fun m!1227021 () Bool)

(assert (=> mapNonEmpty!57178 m!1227021))

(check-sat (not mapNonEmpty!57178) tp_is_empty!36987)
(check-sat)
