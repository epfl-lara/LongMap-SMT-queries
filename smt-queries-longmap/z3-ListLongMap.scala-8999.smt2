; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108978 () Bool)

(assert start!108978)

(declare-fun b_free!28267 () Bool)

(declare-fun b_next!28267 () Bool)

(assert (=> start!108978 (= b_free!28267 (not b_next!28267))))

(declare-fun tp!99916 () Bool)

(declare-fun b_and!46335 () Bool)

(assert (=> start!108978 (= tp!99916 b_and!46335)))

(declare-fun b!1285541 () Bool)

(declare-fun e!734410 () Bool)

(declare-fun tp_is_empty!33907 () Bool)

(assert (=> b!1285541 (= e!734410 tp_is_empty!33907)))

(declare-fun b!1285542 () Bool)

(declare-fun e!734409 () Bool)

(assert (=> b!1285542 (= e!734409 false)))

(declare-datatypes ((V!50313 0))(
  ( (V!50314 (val!17028 Int)) )
))
(declare-fun minValue!1387 () V!50313)

(declare-fun zeroValue!1387 () V!50313)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!577271 () Bool)

(declare-datatypes ((ValueCell!16055 0))(
  ( (ValueCellFull!16055 (v!19625 V!50313)) (EmptyCell!16055) )
))
(declare-datatypes ((array!84903 0))(
  ( (array!84904 (arr!40949 (Array (_ BitVec 32) ValueCell!16055)) (size!41500 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84903)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84905 0))(
  ( (array!84906 (arr!40950 (Array (_ BitVec 32) (_ BitVec 64))) (size!41501 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84905)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21836 0))(
  ( (tuple2!21837 (_1!10929 (_ BitVec 64)) (_2!10929 V!50313)) )
))
(declare-datatypes ((List!29042 0))(
  ( (Nil!29039) (Cons!29038 (h!30256 tuple2!21836) (t!42578 List!29042)) )
))
(declare-datatypes ((ListLongMap!19501 0))(
  ( (ListLongMap!19502 (toList!9766 List!29042)) )
))
(declare-fun contains!7897 (ListLongMap!19501 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4830 (array!84905 array!84903 (_ BitVec 32) (_ BitVec 32) V!50313 V!50313 (_ BitVec 32) Int) ListLongMap!19501)

(assert (=> b!1285542 (= lt!577271 (contains!7897 (getCurrentListMap!4830 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!853665 () Bool)

(assert (=> start!108978 (=> (not res!853665) (not e!734409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108978 (= res!853665 (validMask!0 mask!2175))))

(assert (=> start!108978 e!734409))

(assert (=> start!108978 tp_is_empty!33907))

(assert (=> start!108978 true))

(declare-fun e!734412 () Bool)

(declare-fun array_inv!31273 (array!84903) Bool)

(assert (=> start!108978 (and (array_inv!31273 _values!1445) e!734412)))

(declare-fun array_inv!31274 (array!84905) Bool)

(assert (=> start!108978 (array_inv!31274 _keys!1741)))

(assert (=> start!108978 tp!99916))

(declare-fun b!1285543 () Bool)

(declare-fun res!853664 () Bool)

(assert (=> b!1285543 (=> (not res!853664) (not e!734409))))

(assert (=> b!1285543 (= res!853664 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41501 _keys!1741))))))

(declare-fun b!1285544 () Bool)

(declare-fun res!853663 () Bool)

(assert (=> b!1285544 (=> (not res!853663) (not e!734409))))

(declare-datatypes ((List!29043 0))(
  ( (Nil!29040) (Cons!29039 (h!30257 (_ BitVec 64)) (t!42579 List!29043)) )
))
(declare-fun arrayNoDuplicates!0 (array!84905 (_ BitVec 32) List!29043) Bool)

(assert (=> b!1285544 (= res!853663 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29040))))

(declare-fun mapNonEmpty!52418 () Bool)

(declare-fun mapRes!52418 () Bool)

(declare-fun tp!99917 () Bool)

(assert (=> mapNonEmpty!52418 (= mapRes!52418 (and tp!99917 e!734410))))

(declare-fun mapKey!52418 () (_ BitVec 32))

(declare-fun mapValue!52418 () ValueCell!16055)

(declare-fun mapRest!52418 () (Array (_ BitVec 32) ValueCell!16055))

(assert (=> mapNonEmpty!52418 (= (arr!40949 _values!1445) (store mapRest!52418 mapKey!52418 mapValue!52418))))

(declare-fun b!1285545 () Bool)

(declare-fun e!734411 () Bool)

(assert (=> b!1285545 (= e!734411 tp_is_empty!33907)))

(declare-fun b!1285546 () Bool)

(assert (=> b!1285546 (= e!734412 (and e!734411 mapRes!52418))))

(declare-fun condMapEmpty!52418 () Bool)

(declare-fun mapDefault!52418 () ValueCell!16055)

(assert (=> b!1285546 (= condMapEmpty!52418 (= (arr!40949 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16055)) mapDefault!52418)))))

(declare-fun b!1285547 () Bool)

(declare-fun res!853666 () Bool)

(assert (=> b!1285547 (=> (not res!853666) (not e!734409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84905 (_ BitVec 32)) Bool)

(assert (=> b!1285547 (= res!853666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285548 () Bool)

(declare-fun res!853662 () Bool)

(assert (=> b!1285548 (=> (not res!853662) (not e!734409))))

(assert (=> b!1285548 (= res!853662 (and (= (size!41500 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41501 _keys!1741) (size!41500 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52418 () Bool)

(assert (=> mapIsEmpty!52418 mapRes!52418))

(assert (= (and start!108978 res!853665) b!1285548))

(assert (= (and b!1285548 res!853662) b!1285547))

(assert (= (and b!1285547 res!853666) b!1285544))

(assert (= (and b!1285544 res!853663) b!1285543))

(assert (= (and b!1285543 res!853664) b!1285542))

(assert (= (and b!1285546 condMapEmpty!52418) mapIsEmpty!52418))

(assert (= (and b!1285546 (not condMapEmpty!52418)) mapNonEmpty!52418))

(get-info :version)

(assert (= (and mapNonEmpty!52418 ((_ is ValueCellFull!16055) mapValue!52418)) b!1285541))

(assert (= (and b!1285546 ((_ is ValueCellFull!16055) mapDefault!52418)) b!1285545))

(assert (= start!108978 b!1285546))

(declare-fun m!1179601 () Bool)

(assert (=> b!1285544 m!1179601))

(declare-fun m!1179603 () Bool)

(assert (=> b!1285542 m!1179603))

(assert (=> b!1285542 m!1179603))

(declare-fun m!1179605 () Bool)

(assert (=> b!1285542 m!1179605))

(declare-fun m!1179607 () Bool)

(assert (=> b!1285547 m!1179607))

(declare-fun m!1179609 () Bool)

(assert (=> mapNonEmpty!52418 m!1179609))

(declare-fun m!1179611 () Bool)

(assert (=> start!108978 m!1179611))

(declare-fun m!1179613 () Bool)

(assert (=> start!108978 m!1179613))

(declare-fun m!1179615 () Bool)

(assert (=> start!108978 m!1179615))

(check-sat (not b!1285542) (not b!1285547) (not mapNonEmpty!52418) b_and!46335 (not b!1285544) tp_is_empty!33907 (not b_next!28267) (not start!108978))
(check-sat b_and!46335 (not b_next!28267))
