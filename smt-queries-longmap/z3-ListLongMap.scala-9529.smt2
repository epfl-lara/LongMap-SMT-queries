; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113038 () Bool)

(assert start!113038)

(declare-fun b_free!31089 () Bool)

(declare-fun b_next!31089 () Bool)

(assert (=> start!113038 (= b_free!31089 (not b_next!31089))))

(declare-fun tp!109072 () Bool)

(declare-fun b_and!50119 () Bool)

(assert (=> start!113038 (= tp!109072 b_and!50119)))

(declare-fun res!888769 () Bool)

(declare-fun e!763146 () Bool)

(assert (=> start!113038 (=> (not res!888769) (not e!763146))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113038 (= res!888769 (validMask!0 mask!1977))))

(assert (=> start!113038 e!763146))

(declare-fun tp_is_empty!37089 () Bool)

(assert (=> start!113038 tp_is_empty!37089))

(assert (=> start!113038 true))

(declare-datatypes ((array!91032 0))(
  ( (array!91033 (arr!43972 (Array (_ BitVec 32) (_ BitVec 64))) (size!44522 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91032)

(declare-fun array_inv!33157 (array!91032) Bool)

(assert (=> start!113038 (array_inv!33157 _keys!1571)))

(declare-datatypes ((V!54555 0))(
  ( (V!54556 (val!18619 Int)) )
))
(declare-datatypes ((ValueCell!17646 0))(
  ( (ValueCellFull!17646 (v!21267 V!54555)) (EmptyCell!17646) )
))
(declare-datatypes ((array!91034 0))(
  ( (array!91035 (arr!43973 (Array (_ BitVec 32) ValueCell!17646)) (size!44523 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91034)

(declare-fun e!763147 () Bool)

(declare-fun array_inv!33158 (array!91034) Bool)

(assert (=> start!113038 (and (array_inv!33158 _values!1303) e!763147)))

(assert (=> start!113038 tp!109072))

(declare-fun b!1339788 () Bool)

(declare-fun e!763145 () Bool)

(assert (=> b!1339788 (= e!763145 tp_is_empty!37089)))

(declare-fun b!1339789 () Bool)

(declare-fun res!888768 () Bool)

(assert (=> b!1339789 (=> (not res!888768) (not e!763146))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1339789 (= res!888768 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44522 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57340 () Bool)

(declare-fun mapRes!57340 () Bool)

(declare-fun tp!109071 () Bool)

(declare-fun e!763144 () Bool)

(assert (=> mapNonEmpty!57340 (= mapRes!57340 (and tp!109071 e!763144))))

(declare-fun mapRest!57340 () (Array (_ BitVec 32) ValueCell!17646))

(declare-fun mapValue!57340 () ValueCell!17646)

(declare-fun mapKey!57340 () (_ BitVec 32))

(assert (=> mapNonEmpty!57340 (= (arr!43973 _values!1303) (store mapRest!57340 mapKey!57340 mapValue!57340))))

(declare-fun b!1339790 () Bool)

(assert (=> b!1339790 (= e!763144 tp_is_empty!37089)))

(declare-fun b!1339791 () Bool)

(declare-fun res!888771 () Bool)

(assert (=> b!1339791 (=> (not res!888771) (not e!763146))))

(declare-datatypes ((List!31125 0))(
  ( (Nil!31122) (Cons!31121 (h!32330 (_ BitVec 64)) (t!45457 List!31125)) )
))
(declare-fun arrayNoDuplicates!0 (array!91032 (_ BitVec 32) List!31125) Bool)

(assert (=> b!1339791 (= res!888771 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31122))))

(declare-fun b!1339792 () Bool)

(assert (=> b!1339792 (= e!763146 false)))

(declare-fun minValue!1245 () V!54555)

(declare-fun zeroValue!1245 () V!54555)

(declare-fun lt!593928 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!23958 0))(
  ( (tuple2!23959 (_1!11990 (_ BitVec 64)) (_2!11990 V!54555)) )
))
(declare-datatypes ((List!31126 0))(
  ( (Nil!31123) (Cons!31122 (h!32331 tuple2!23958) (t!45458 List!31126)) )
))
(declare-datatypes ((ListLongMap!21615 0))(
  ( (ListLongMap!21616 (toList!10823 List!31126)) )
))
(declare-fun contains!8999 (ListLongMap!21615 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5792 (array!91032 array!91034 (_ BitVec 32) (_ BitVec 32) V!54555 V!54555 (_ BitVec 32) Int) ListLongMap!21615)

(assert (=> b!1339792 (= lt!593928 (contains!8999 (getCurrentListMap!5792 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1339793 () Bool)

(declare-fun res!888770 () Bool)

(assert (=> b!1339793 (=> (not res!888770) (not e!763146))))

(assert (=> b!1339793 (= res!888770 (and (= (size!44523 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44522 _keys!1571) (size!44523 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57340 () Bool)

(assert (=> mapIsEmpty!57340 mapRes!57340))

(declare-fun b!1339794 () Bool)

(assert (=> b!1339794 (= e!763147 (and e!763145 mapRes!57340))))

(declare-fun condMapEmpty!57340 () Bool)

(declare-fun mapDefault!57340 () ValueCell!17646)

(assert (=> b!1339794 (= condMapEmpty!57340 (= (arr!43973 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17646)) mapDefault!57340)))))

(declare-fun b!1339795 () Bool)

(declare-fun res!888767 () Bool)

(assert (=> b!1339795 (=> (not res!888767) (not e!763146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91032 (_ BitVec 32)) Bool)

(assert (=> b!1339795 (= res!888767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113038 res!888769) b!1339793))

(assert (= (and b!1339793 res!888770) b!1339795))

(assert (= (and b!1339795 res!888767) b!1339791))

(assert (= (and b!1339791 res!888771) b!1339789))

(assert (= (and b!1339789 res!888768) b!1339792))

(assert (= (and b!1339794 condMapEmpty!57340) mapIsEmpty!57340))

(assert (= (and b!1339794 (not condMapEmpty!57340)) mapNonEmpty!57340))

(get-info :version)

(assert (= (and mapNonEmpty!57340 ((_ is ValueCellFull!17646) mapValue!57340)) b!1339790))

(assert (= (and b!1339794 ((_ is ValueCellFull!17646) mapDefault!57340)) b!1339788))

(assert (= start!113038 b!1339794))

(declare-fun m!1227725 () Bool)

(assert (=> b!1339795 m!1227725))

(declare-fun m!1227727 () Bool)

(assert (=> mapNonEmpty!57340 m!1227727))

(declare-fun m!1227729 () Bool)

(assert (=> start!113038 m!1227729))

(declare-fun m!1227731 () Bool)

(assert (=> start!113038 m!1227731))

(declare-fun m!1227733 () Bool)

(assert (=> start!113038 m!1227733))

(declare-fun m!1227735 () Bool)

(assert (=> b!1339792 m!1227735))

(assert (=> b!1339792 m!1227735))

(declare-fun m!1227737 () Bool)

(assert (=> b!1339792 m!1227737))

(declare-fun m!1227739 () Bool)

(assert (=> b!1339791 m!1227739))

(check-sat tp_is_empty!37089 (not b!1339795) (not start!113038) (not b_next!31089) (not mapNonEmpty!57340) (not b!1339792) (not b!1339791) b_and!50119)
(check-sat b_and!50119 (not b_next!31089))
