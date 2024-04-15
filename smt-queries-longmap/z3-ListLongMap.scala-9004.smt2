; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108784 () Bool)

(assert start!108784)

(declare-fun b_free!28297 () Bool)

(declare-fun b_next!28297 () Bool)

(assert (=> start!108784 (= b_free!28297 (not b_next!28297))))

(declare-fun tp!100007 () Bool)

(declare-fun b_and!46345 () Bool)

(assert (=> start!108784 (= tp!100007 b_and!46345)))

(declare-fun b!1284532 () Bool)

(declare-fun res!853344 () Bool)

(declare-fun e!733761 () Bool)

(assert (=> b!1284532 (=> (not res!853344) (not e!733761))))

(declare-datatypes ((array!84827 0))(
  ( (array!84828 (arr!40916 (Array (_ BitVec 32) (_ BitVec 64))) (size!41468 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84827)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84827 (_ BitVec 32)) Bool)

(assert (=> b!1284532 (= res!853344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!853343 () Bool)

(assert (=> start!108784 (=> (not res!853343) (not e!733761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108784 (= res!853343 (validMask!0 mask!2175))))

(assert (=> start!108784 e!733761))

(declare-fun tp_is_empty!33937 () Bool)

(assert (=> start!108784 tp_is_empty!33937))

(assert (=> start!108784 true))

(declare-datatypes ((V!50353 0))(
  ( (V!50354 (val!17043 Int)) )
))
(declare-datatypes ((ValueCell!16070 0))(
  ( (ValueCellFull!16070 (v!19644 V!50353)) (EmptyCell!16070) )
))
(declare-datatypes ((array!84829 0))(
  ( (array!84830 (arr!40917 (Array (_ BitVec 32) ValueCell!16070)) (size!41469 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84829)

(declare-fun e!733760 () Bool)

(declare-fun array_inv!31197 (array!84829) Bool)

(assert (=> start!108784 (and (array_inv!31197 _values!1445) e!733760)))

(declare-fun array_inv!31198 (array!84827) Bool)

(assert (=> start!108784 (array_inv!31198 _keys!1741)))

(assert (=> start!108784 tp!100007))

(declare-fun b!1284533 () Bool)

(declare-fun e!733759 () Bool)

(assert (=> b!1284533 (= e!733759 tp_is_empty!33937)))

(declare-fun b!1284534 () Bool)

(declare-fun res!853340 () Bool)

(assert (=> b!1284534 (=> (not res!853340) (not e!733761))))

(declare-datatypes ((List!29088 0))(
  ( (Nil!29085) (Cons!29084 (h!30293 (_ BitVec 64)) (t!42624 List!29088)) )
))
(declare-fun arrayNoDuplicates!0 (array!84827 (_ BitVec 32) List!29088) Bool)

(assert (=> b!1284534 (= res!853340 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29085))))

(declare-fun mapNonEmpty!52463 () Bool)

(declare-fun mapRes!52463 () Bool)

(declare-fun tp!100008 () Bool)

(assert (=> mapNonEmpty!52463 (= mapRes!52463 (and tp!100008 e!733759))))

(declare-fun mapKey!52463 () (_ BitVec 32))

(declare-fun mapValue!52463 () ValueCell!16070)

(declare-fun mapRest!52463 () (Array (_ BitVec 32) ValueCell!16070))

(assert (=> mapNonEmpty!52463 (= (arr!40917 _values!1445) (store mapRest!52463 mapKey!52463 mapValue!52463))))

(declare-fun b!1284535 () Bool)

(declare-fun e!733757 () Bool)

(assert (=> b!1284535 (= e!733760 (and e!733757 mapRes!52463))))

(declare-fun condMapEmpty!52463 () Bool)

(declare-fun mapDefault!52463 () ValueCell!16070)

(assert (=> b!1284535 (= condMapEmpty!52463 (= (arr!40917 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16070)) mapDefault!52463)))))

(declare-fun b!1284536 () Bool)

(assert (=> b!1284536 (= e!733761 false)))

(declare-fun minValue!1387 () V!50353)

(declare-fun zeroValue!1387 () V!50353)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576654 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21908 0))(
  ( (tuple2!21909 (_1!10965 (_ BitVec 64)) (_2!10965 V!50353)) )
))
(declare-datatypes ((List!29089 0))(
  ( (Nil!29086) (Cons!29085 (h!30294 tuple2!21908) (t!42625 List!29089)) )
))
(declare-datatypes ((ListLongMap!19565 0))(
  ( (ListLongMap!19566 (toList!9798 List!29089)) )
))
(declare-fun contains!7845 (ListLongMap!19565 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4768 (array!84827 array!84829 (_ BitVec 32) (_ BitVec 32) V!50353 V!50353 (_ BitVec 32) Int) ListLongMap!19565)

(assert (=> b!1284536 (= lt!576654 (contains!7845 (getCurrentListMap!4768 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284537 () Bool)

(declare-fun res!853341 () Bool)

(assert (=> b!1284537 (=> (not res!853341) (not e!733761))))

(assert (=> b!1284537 (= res!853341 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41468 _keys!1741))))))

(declare-fun mapIsEmpty!52463 () Bool)

(assert (=> mapIsEmpty!52463 mapRes!52463))

(declare-fun b!1284538 () Bool)

(assert (=> b!1284538 (= e!733757 tp_is_empty!33937)))

(declare-fun b!1284539 () Bool)

(declare-fun res!853342 () Bool)

(assert (=> b!1284539 (=> (not res!853342) (not e!733761))))

(assert (=> b!1284539 (= res!853342 (and (= (size!41469 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41468 _keys!1741) (size!41469 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108784 res!853343) b!1284539))

(assert (= (and b!1284539 res!853342) b!1284532))

(assert (= (and b!1284532 res!853344) b!1284534))

(assert (= (and b!1284534 res!853340) b!1284537))

(assert (= (and b!1284537 res!853341) b!1284536))

(assert (= (and b!1284535 condMapEmpty!52463) mapIsEmpty!52463))

(assert (= (and b!1284535 (not condMapEmpty!52463)) mapNonEmpty!52463))

(get-info :version)

(assert (= (and mapNonEmpty!52463 ((_ is ValueCellFull!16070) mapValue!52463)) b!1284533))

(assert (= (and b!1284535 ((_ is ValueCellFull!16070) mapDefault!52463)) b!1284538))

(assert (= start!108784 b!1284535))

(declare-fun m!1177729 () Bool)

(assert (=> b!1284536 m!1177729))

(assert (=> b!1284536 m!1177729))

(declare-fun m!1177731 () Bool)

(assert (=> b!1284536 m!1177731))

(declare-fun m!1177733 () Bool)

(assert (=> b!1284532 m!1177733))

(declare-fun m!1177735 () Bool)

(assert (=> start!108784 m!1177735))

(declare-fun m!1177737 () Bool)

(assert (=> start!108784 m!1177737))

(declare-fun m!1177739 () Bool)

(assert (=> start!108784 m!1177739))

(declare-fun m!1177741 () Bool)

(assert (=> b!1284534 m!1177741))

(declare-fun m!1177743 () Bool)

(assert (=> mapNonEmpty!52463 m!1177743))

(check-sat (not b_next!28297) (not mapNonEmpty!52463) (not b!1284532) (not start!108784) (not b!1284534) tp_is_empty!33937 (not b!1284536) b_and!46345)
(check-sat b_and!46345 (not b_next!28297))
