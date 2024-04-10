; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113434 () Bool)

(assert start!113434)

(declare-fun b_free!31485 () Bool)

(declare-fun b_next!31485 () Bool)

(assert (=> start!113434 (= b_free!31485 (not b_next!31485))))

(declare-fun tp!110259 () Bool)

(declare-fun b_and!50773 () Bool)

(assert (=> start!113434 (= tp!110259 b_and!50773)))

(declare-fun b!1346577 () Bool)

(declare-fun res!893523 () Bool)

(declare-fun e!766198 () Bool)

(assert (=> b!1346577 (=> (not res!893523) (not e!766198))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91802 0))(
  ( (array!91803 (arr!44357 (Array (_ BitVec 32) (_ BitVec 64))) (size!44907 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91802)

(declare-datatypes ((V!55083 0))(
  ( (V!55084 (val!18817 Int)) )
))
(declare-fun zeroValue!1245 () V!55083)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17844 0))(
  ( (ValueCellFull!17844 (v!21465 V!55083)) (EmptyCell!17844) )
))
(declare-datatypes ((array!91804 0))(
  ( (array!91805 (arr!44358 (Array (_ BitVec 32) ValueCell!17844)) (size!44908 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91804)

(declare-fun minValue!1245 () V!55083)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24252 0))(
  ( (tuple2!24253 (_1!12137 (_ BitVec 64)) (_2!12137 V!55083)) )
))
(declare-datatypes ((List!31410 0))(
  ( (Nil!31407) (Cons!31406 (h!32615 tuple2!24252) (t!46000 List!31410)) )
))
(declare-datatypes ((ListLongMap!21909 0))(
  ( (ListLongMap!21910 (toList!10970 List!31410)) )
))
(declare-fun contains!9146 (ListLongMap!21909 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5922 (array!91802 array!91804 (_ BitVec 32) (_ BitVec 32) V!55083 V!55083 (_ BitVec 32) Int) ListLongMap!21909)

(assert (=> b!1346577 (= res!893523 (contains!9146 (getCurrentListMap!5922 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346578 () Bool)

(declare-fun res!893516 () Bool)

(assert (=> b!1346578 (=> (not res!893516) (not e!766198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346578 (= res!893516 (not (validKeyInArray!0 (select (arr!44357 _keys!1571) from!1960))))))

(declare-fun mapNonEmpty!57934 () Bool)

(declare-fun mapRes!57934 () Bool)

(declare-fun tp!110260 () Bool)

(declare-fun e!766195 () Bool)

(assert (=> mapNonEmpty!57934 (= mapRes!57934 (and tp!110260 e!766195))))

(declare-fun mapRest!57934 () (Array (_ BitVec 32) ValueCell!17844))

(declare-fun mapValue!57934 () ValueCell!17844)

(declare-fun mapKey!57934 () (_ BitVec 32))

(assert (=> mapNonEmpty!57934 (= (arr!44358 _values!1303) (store mapRest!57934 mapKey!57934 mapValue!57934))))

(declare-fun b!1346579 () Bool)

(declare-fun res!893517 () Bool)

(assert (=> b!1346579 (=> (not res!893517) (not e!766198))))

(assert (=> b!1346579 (= res!893517 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44907 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346580 () Bool)

(declare-fun res!893520 () Bool)

(assert (=> b!1346580 (=> (not res!893520) (not e!766198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91802 (_ BitVec 32)) Bool)

(assert (=> b!1346580 (= res!893520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346581 () Bool)

(declare-fun res!893518 () Bool)

(assert (=> b!1346581 (=> (not res!893518) (not e!766198))))

(declare-datatypes ((List!31411 0))(
  ( (Nil!31408) (Cons!31407 (h!32616 (_ BitVec 64)) (t!46001 List!31411)) )
))
(declare-fun arrayNoDuplicates!0 (array!91802 (_ BitVec 32) List!31411) Bool)

(assert (=> b!1346581 (= res!893518 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31408))))

(declare-fun b!1346582 () Bool)

(declare-fun e!766197 () Bool)

(declare-fun e!766199 () Bool)

(assert (=> b!1346582 (= e!766197 (and e!766199 mapRes!57934))))

(declare-fun condMapEmpty!57934 () Bool)

(declare-fun mapDefault!57934 () ValueCell!17844)

(assert (=> b!1346582 (= condMapEmpty!57934 (= (arr!44358 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17844)) mapDefault!57934)))))

(declare-fun res!893519 () Bool)

(assert (=> start!113434 (=> (not res!893519) (not e!766198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113434 (= res!893519 (validMask!0 mask!1977))))

(assert (=> start!113434 e!766198))

(declare-fun tp_is_empty!37485 () Bool)

(assert (=> start!113434 tp_is_empty!37485))

(assert (=> start!113434 true))

(declare-fun array_inv!33415 (array!91802) Bool)

(assert (=> start!113434 (array_inv!33415 _keys!1571)))

(declare-fun array_inv!33416 (array!91804) Bool)

(assert (=> start!113434 (and (array_inv!33416 _values!1303) e!766197)))

(assert (=> start!113434 tp!110259))

(declare-fun b!1346583 () Bool)

(declare-fun res!893521 () Bool)

(assert (=> b!1346583 (=> (not res!893521) (not e!766198))))

(assert (=> b!1346583 (= res!893521 (not (= (select (arr!44357 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!57934 () Bool)

(assert (=> mapIsEmpty!57934 mapRes!57934))

(declare-fun b!1346584 () Bool)

(assert (=> b!1346584 (= e!766195 tp_is_empty!37485)))

(declare-fun b!1346585 () Bool)

(assert (=> b!1346585 (= e!766199 tp_is_empty!37485)))

(declare-fun b!1346586 () Bool)

(assert (=> b!1346586 (= e!766198 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000))))

(declare-fun b!1346587 () Bool)

(declare-fun res!893522 () Bool)

(assert (=> b!1346587 (=> (not res!893522) (not e!766198))))

(assert (=> b!1346587 (= res!893522 (and (= (size!44908 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44907 _keys!1571) (size!44908 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113434 res!893519) b!1346587))

(assert (= (and b!1346587 res!893522) b!1346580))

(assert (= (and b!1346580 res!893520) b!1346581))

(assert (= (and b!1346581 res!893518) b!1346579))

(assert (= (and b!1346579 res!893517) b!1346577))

(assert (= (and b!1346577 res!893523) b!1346583))

(assert (= (and b!1346583 res!893521) b!1346578))

(assert (= (and b!1346578 res!893516) b!1346586))

(assert (= (and b!1346582 condMapEmpty!57934) mapIsEmpty!57934))

(assert (= (and b!1346582 (not condMapEmpty!57934)) mapNonEmpty!57934))

(get-info :version)

(assert (= (and mapNonEmpty!57934 ((_ is ValueCellFull!17844) mapValue!57934)) b!1346584))

(assert (= (and b!1346582 ((_ is ValueCellFull!17844) mapDefault!57934)) b!1346585))

(assert (= start!113434 b!1346582))

(declare-fun m!1233675 () Bool)

(assert (=> b!1346583 m!1233675))

(declare-fun m!1233677 () Bool)

(assert (=> b!1346581 m!1233677))

(declare-fun m!1233679 () Bool)

(assert (=> mapNonEmpty!57934 m!1233679))

(declare-fun m!1233681 () Bool)

(assert (=> b!1346580 m!1233681))

(assert (=> b!1346578 m!1233675))

(assert (=> b!1346578 m!1233675))

(declare-fun m!1233683 () Bool)

(assert (=> b!1346578 m!1233683))

(declare-fun m!1233685 () Bool)

(assert (=> b!1346577 m!1233685))

(assert (=> b!1346577 m!1233685))

(declare-fun m!1233687 () Bool)

(assert (=> b!1346577 m!1233687))

(declare-fun m!1233689 () Bool)

(assert (=> start!113434 m!1233689))

(declare-fun m!1233691 () Bool)

(assert (=> start!113434 m!1233691))

(declare-fun m!1233693 () Bool)

(assert (=> start!113434 m!1233693))

(check-sat (not b!1346581) tp_is_empty!37485 (not b!1346580) b_and!50773 (not b!1346577) (not start!113434) (not mapNonEmpty!57934) (not b_next!31485) (not b!1346578))
(check-sat b_and!50773 (not b_next!31485))
