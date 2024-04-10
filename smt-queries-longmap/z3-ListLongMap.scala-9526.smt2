; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113020 () Bool)

(assert start!113020)

(declare-fun b_free!31071 () Bool)

(declare-fun b_next!31071 () Bool)

(assert (=> start!113020 (= b_free!31071 (not b_next!31071))))

(declare-fun tp!109018 () Bool)

(declare-fun b_and!50101 () Bool)

(assert (=> start!113020 (= tp!109018 b_and!50101)))

(declare-fun res!888632 () Bool)

(declare-fun e!763010 () Bool)

(assert (=> start!113020 (=> (not res!888632) (not e!763010))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113020 (= res!888632 (validMask!0 mask!1977))))

(assert (=> start!113020 e!763010))

(declare-fun tp_is_empty!37071 () Bool)

(assert (=> start!113020 tp_is_empty!37071))

(assert (=> start!113020 true))

(declare-datatypes ((array!90998 0))(
  ( (array!90999 (arr!43955 (Array (_ BitVec 32) (_ BitVec 64))) (size!44505 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90998)

(declare-fun array_inv!33145 (array!90998) Bool)

(assert (=> start!113020 (array_inv!33145 _keys!1571)))

(declare-datatypes ((V!54531 0))(
  ( (V!54532 (val!18610 Int)) )
))
(declare-datatypes ((ValueCell!17637 0))(
  ( (ValueCellFull!17637 (v!21258 V!54531)) (EmptyCell!17637) )
))
(declare-datatypes ((array!91000 0))(
  ( (array!91001 (arr!43956 (Array (_ BitVec 32) ValueCell!17637)) (size!44506 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91000)

(declare-fun e!763009 () Bool)

(declare-fun array_inv!33146 (array!91000) Bool)

(assert (=> start!113020 (and (array_inv!33146 _values!1303) e!763009)))

(assert (=> start!113020 tp!109018))

(declare-fun b!1339572 () Bool)

(declare-fun res!888636 () Bool)

(assert (=> b!1339572 (=> (not res!888636) (not e!763010))))

(declare-datatypes ((List!31115 0))(
  ( (Nil!31112) (Cons!31111 (h!32320 (_ BitVec 64)) (t!45447 List!31115)) )
))
(declare-fun arrayNoDuplicates!0 (array!90998 (_ BitVec 32) List!31115) Bool)

(assert (=> b!1339572 (= res!888636 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31112))))

(declare-fun b!1339573 () Bool)

(declare-fun res!888633 () Bool)

(assert (=> b!1339573 (=> (not res!888633) (not e!763010))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339573 (= res!888633 (and (= (size!44506 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44505 _keys!1571) (size!44506 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339574 () Bool)

(assert (=> b!1339574 (= e!763010 false)))

(declare-fun minValue!1245 () V!54531)

(declare-fun lt!593901 () Bool)

(declare-fun zeroValue!1245 () V!54531)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!23950 0))(
  ( (tuple2!23951 (_1!11986 (_ BitVec 64)) (_2!11986 V!54531)) )
))
(declare-datatypes ((List!31116 0))(
  ( (Nil!31113) (Cons!31112 (h!32321 tuple2!23950) (t!45448 List!31116)) )
))
(declare-datatypes ((ListLongMap!21607 0))(
  ( (ListLongMap!21608 (toList!10819 List!31116)) )
))
(declare-fun contains!8995 (ListLongMap!21607 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5788 (array!90998 array!91000 (_ BitVec 32) (_ BitVec 32) V!54531 V!54531 (_ BitVec 32) Int) ListLongMap!21607)

(assert (=> b!1339574 (= lt!593901 (contains!8995 (getCurrentListMap!5788 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1339575 () Bool)

(declare-fun e!763013 () Bool)

(assert (=> b!1339575 (= e!763013 tp_is_empty!37071)))

(declare-fun b!1339576 () Bool)

(declare-fun e!763011 () Bool)

(assert (=> b!1339576 (= e!763011 tp_is_empty!37071)))

(declare-fun b!1339577 () Bool)

(declare-fun mapRes!57313 () Bool)

(assert (=> b!1339577 (= e!763009 (and e!763013 mapRes!57313))))

(declare-fun condMapEmpty!57313 () Bool)

(declare-fun mapDefault!57313 () ValueCell!17637)

(assert (=> b!1339577 (= condMapEmpty!57313 (= (arr!43956 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17637)) mapDefault!57313)))))

(declare-fun b!1339578 () Bool)

(declare-fun res!888635 () Bool)

(assert (=> b!1339578 (=> (not res!888635) (not e!763010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90998 (_ BitVec 32)) Bool)

(assert (=> b!1339578 (= res!888635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57313 () Bool)

(declare-fun tp!109017 () Bool)

(assert (=> mapNonEmpty!57313 (= mapRes!57313 (and tp!109017 e!763011))))

(declare-fun mapRest!57313 () (Array (_ BitVec 32) ValueCell!17637))

(declare-fun mapKey!57313 () (_ BitVec 32))

(declare-fun mapValue!57313 () ValueCell!17637)

(assert (=> mapNonEmpty!57313 (= (arr!43956 _values!1303) (store mapRest!57313 mapKey!57313 mapValue!57313))))

(declare-fun b!1339579 () Bool)

(declare-fun res!888634 () Bool)

(assert (=> b!1339579 (=> (not res!888634) (not e!763010))))

(assert (=> b!1339579 (= res!888634 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44505 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57313 () Bool)

(assert (=> mapIsEmpty!57313 mapRes!57313))

(assert (= (and start!113020 res!888632) b!1339573))

(assert (= (and b!1339573 res!888633) b!1339578))

(assert (= (and b!1339578 res!888635) b!1339572))

(assert (= (and b!1339572 res!888636) b!1339579))

(assert (= (and b!1339579 res!888634) b!1339574))

(assert (= (and b!1339577 condMapEmpty!57313) mapIsEmpty!57313))

(assert (= (and b!1339577 (not condMapEmpty!57313)) mapNonEmpty!57313))

(get-info :version)

(assert (= (and mapNonEmpty!57313 ((_ is ValueCellFull!17637) mapValue!57313)) b!1339576))

(assert (= (and b!1339577 ((_ is ValueCellFull!17637) mapDefault!57313)) b!1339575))

(assert (= start!113020 b!1339577))

(declare-fun m!1227581 () Bool)

(assert (=> b!1339574 m!1227581))

(assert (=> b!1339574 m!1227581))

(declare-fun m!1227583 () Bool)

(assert (=> b!1339574 m!1227583))

(declare-fun m!1227585 () Bool)

(assert (=> start!113020 m!1227585))

(declare-fun m!1227587 () Bool)

(assert (=> start!113020 m!1227587))

(declare-fun m!1227589 () Bool)

(assert (=> start!113020 m!1227589))

(declare-fun m!1227591 () Bool)

(assert (=> b!1339572 m!1227591))

(declare-fun m!1227593 () Bool)

(assert (=> b!1339578 m!1227593))

(declare-fun m!1227595 () Bool)

(assert (=> mapNonEmpty!57313 m!1227595))

(check-sat (not mapNonEmpty!57313) tp_is_empty!37071 (not start!113020) b_and!50101 (not b!1339572) (not b_next!31071) (not b!1339574) (not b!1339578))
(check-sat b_and!50101 (not b_next!31071))
