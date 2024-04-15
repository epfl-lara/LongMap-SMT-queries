; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113042 () Bool)

(assert start!113042)

(declare-fun b_free!31093 () Bool)

(declare-fun b_next!31093 () Bool)

(assert (=> start!113042 (= b_free!31093 (not b_next!31093))))

(declare-fun tp!109085 () Bool)

(declare-fun b_and!50105 () Bool)

(assert (=> start!113042 (= tp!109085 b_and!50105)))

(declare-fun b!1339766 () Bool)

(declare-fun e!763143 () Bool)

(declare-fun tp_is_empty!37093 () Bool)

(assert (=> b!1339766 (= e!763143 tp_is_empty!37093)))

(declare-fun b!1339767 () Bool)

(declare-fun res!888770 () Bool)

(declare-fun e!763144 () Bool)

(assert (=> b!1339767 (=> (not res!888770) (not e!763144))))

(declare-datatypes ((array!90987 0))(
  ( (array!90988 (arr!43950 (Array (_ BitVec 32) (_ BitVec 64))) (size!44502 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90987)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90987 (_ BitVec 32)) Bool)

(assert (=> b!1339767 (= res!888770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339768 () Bool)

(declare-fun e!763145 () Bool)

(declare-fun e!763142 () Bool)

(declare-fun mapRes!57346 () Bool)

(assert (=> b!1339768 (= e!763145 (and e!763142 mapRes!57346))))

(declare-fun condMapEmpty!57346 () Bool)

(declare-datatypes ((V!54561 0))(
  ( (V!54562 (val!18621 Int)) )
))
(declare-datatypes ((ValueCell!17648 0))(
  ( (ValueCellFull!17648 (v!21268 V!54561)) (EmptyCell!17648) )
))
(declare-datatypes ((array!90989 0))(
  ( (array!90990 (arr!43951 (Array (_ BitVec 32) ValueCell!17648)) (size!44503 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90989)

(declare-fun mapDefault!57346 () ValueCell!17648)

(assert (=> b!1339768 (= condMapEmpty!57346 (= (arr!43951 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17648)) mapDefault!57346)))))

(declare-fun res!888772 () Bool)

(assert (=> start!113042 (=> (not res!888772) (not e!763144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113042 (= res!888772 (validMask!0 mask!1977))))

(assert (=> start!113042 e!763144))

(assert (=> start!113042 tp_is_empty!37093))

(assert (=> start!113042 true))

(declare-fun array_inv!33331 (array!90987) Bool)

(assert (=> start!113042 (array_inv!33331 _keys!1571)))

(declare-fun array_inv!33332 (array!90989) Bool)

(assert (=> start!113042 (and (array_inv!33332 _values!1303) e!763145)))

(assert (=> start!113042 tp!109085))

(declare-fun b!1339769 () Bool)

(assert (=> b!1339769 (= e!763144 false)))

(declare-fun minValue!1245 () V!54561)

(declare-fun lt!593748 () Bool)

(declare-fun zeroValue!1245 () V!54561)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24024 0))(
  ( (tuple2!24025 (_1!12023 (_ BitVec 64)) (_2!12023 V!54561)) )
))
(declare-datatypes ((List!31175 0))(
  ( (Nil!31172) (Cons!31171 (h!32380 tuple2!24024) (t!45499 List!31175)) )
))
(declare-datatypes ((ListLongMap!21681 0))(
  ( (ListLongMap!21682 (toList!10856 List!31175)) )
))
(declare-fun contains!8961 (ListLongMap!21681 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5709 (array!90987 array!90989 (_ BitVec 32) (_ BitVec 32) V!54561 V!54561 (_ BitVec 32) Int) ListLongMap!21681)

(assert (=> b!1339769 (= lt!593748 (contains!8961 (getCurrentListMap!5709 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1339770 () Bool)

(assert (=> b!1339770 (= e!763142 tp_is_empty!37093)))

(declare-fun b!1339771 () Bool)

(declare-fun res!888769 () Bool)

(assert (=> b!1339771 (=> (not res!888769) (not e!763144))))

(assert (=> b!1339771 (= res!888769 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44502 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57346 () Bool)

(assert (=> mapIsEmpty!57346 mapRes!57346))

(declare-fun mapNonEmpty!57346 () Bool)

(declare-fun tp!109084 () Bool)

(assert (=> mapNonEmpty!57346 (= mapRes!57346 (and tp!109084 e!763143))))

(declare-fun mapValue!57346 () ValueCell!17648)

(declare-fun mapRest!57346 () (Array (_ BitVec 32) ValueCell!17648))

(declare-fun mapKey!57346 () (_ BitVec 32))

(assert (=> mapNonEmpty!57346 (= (arr!43951 _values!1303) (store mapRest!57346 mapKey!57346 mapValue!57346))))

(declare-fun b!1339772 () Bool)

(declare-fun res!888771 () Bool)

(assert (=> b!1339772 (=> (not res!888771) (not e!763144))))

(assert (=> b!1339772 (= res!888771 (and (= (size!44503 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44502 _keys!1571) (size!44503 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339773 () Bool)

(declare-fun res!888768 () Bool)

(assert (=> b!1339773 (=> (not res!888768) (not e!763144))))

(declare-datatypes ((List!31176 0))(
  ( (Nil!31173) (Cons!31172 (h!32381 (_ BitVec 64)) (t!45500 List!31176)) )
))
(declare-fun arrayNoDuplicates!0 (array!90987 (_ BitVec 32) List!31176) Bool)

(assert (=> b!1339773 (= res!888768 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31173))))

(assert (= (and start!113042 res!888772) b!1339772))

(assert (= (and b!1339772 res!888771) b!1339767))

(assert (= (and b!1339767 res!888770) b!1339773))

(assert (= (and b!1339773 res!888768) b!1339771))

(assert (= (and b!1339771 res!888769) b!1339769))

(assert (= (and b!1339768 condMapEmpty!57346) mapIsEmpty!57346))

(assert (= (and b!1339768 (not condMapEmpty!57346)) mapNonEmpty!57346))

(get-info :version)

(assert (= (and mapNonEmpty!57346 ((_ is ValueCellFull!17648) mapValue!57346)) b!1339766))

(assert (= (and b!1339768 ((_ is ValueCellFull!17648) mapDefault!57346)) b!1339770))

(assert (= start!113042 b!1339768))

(declare-fun m!1227241 () Bool)

(assert (=> start!113042 m!1227241))

(declare-fun m!1227243 () Bool)

(assert (=> start!113042 m!1227243))

(declare-fun m!1227245 () Bool)

(assert (=> start!113042 m!1227245))

(declare-fun m!1227247 () Bool)

(assert (=> b!1339773 m!1227247))

(declare-fun m!1227249 () Bool)

(assert (=> b!1339767 m!1227249))

(declare-fun m!1227251 () Bool)

(assert (=> mapNonEmpty!57346 m!1227251))

(declare-fun m!1227253 () Bool)

(assert (=> b!1339769 m!1227253))

(assert (=> b!1339769 m!1227253))

(declare-fun m!1227255 () Bool)

(assert (=> b!1339769 m!1227255))

(check-sat b_and!50105 (not b!1339769) tp_is_empty!37093 (not mapNonEmpty!57346) (not b_next!31093) (not b!1339767) (not b!1339773) (not start!113042))
(check-sat b_and!50105 (not b_next!31093))
