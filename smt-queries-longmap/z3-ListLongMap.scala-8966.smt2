; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108746 () Bool)

(assert start!108746)

(declare-fun b_free!28069 () Bool)

(declare-fun b_next!28069 () Bool)

(assert (=> start!108746 (= b_free!28069 (not b_next!28069))))

(declare-fun tp!99316 () Bool)

(declare-fun b_and!46131 () Bool)

(assert (=> start!108746 (= tp!99316 b_and!46131)))

(declare-fun b!1282240 () Bool)

(declare-fun res!851406 () Bool)

(declare-fun e!732732 () Bool)

(assert (=> b!1282240 (=> (not res!851406) (not e!732732))))

(declare-datatypes ((array!84521 0))(
  ( (array!84522 (arr!40760 (Array (_ BitVec 32) (_ BitVec 64))) (size!41311 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84521)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84521 (_ BitVec 32)) Bool)

(assert (=> b!1282240 (= res!851406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282241 () Bool)

(declare-fun res!851403 () Bool)

(assert (=> b!1282241 (=> (not res!851403) (not e!732732))))

(declare-datatypes ((List!28907 0))(
  ( (Nil!28904) (Cons!28903 (h!30121 (_ BitVec 64)) (t!42439 List!28907)) )
))
(declare-fun arrayNoDuplicates!0 (array!84521 (_ BitVec 32) List!28907) Bool)

(assert (=> b!1282241 (= res!851403 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28904))))

(declare-fun b!1282242 () Bool)

(declare-fun e!732729 () Bool)

(declare-fun e!732731 () Bool)

(declare-fun mapRes!52115 () Bool)

(assert (=> b!1282242 (= e!732729 (and e!732731 mapRes!52115))))

(declare-fun condMapEmpty!52115 () Bool)

(declare-datatypes ((V!50049 0))(
  ( (V!50050 (val!16929 Int)) )
))
(declare-datatypes ((ValueCell!15956 0))(
  ( (ValueCellFull!15956 (v!19524 V!50049)) (EmptyCell!15956) )
))
(declare-datatypes ((array!84523 0))(
  ( (array!84524 (arr!40761 (Array (_ BitVec 32) ValueCell!15956)) (size!41312 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84523)

(declare-fun mapDefault!52115 () ValueCell!15956)

(assert (=> b!1282242 (= condMapEmpty!52115 (= (arr!40761 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15956)) mapDefault!52115)))))

(declare-fun mapNonEmpty!52115 () Bool)

(declare-fun tp!99317 () Bool)

(declare-fun e!732728 () Bool)

(assert (=> mapNonEmpty!52115 (= mapRes!52115 (and tp!99317 e!732728))))

(declare-fun mapValue!52115 () ValueCell!15956)

(declare-fun mapRest!52115 () (Array (_ BitVec 32) ValueCell!15956))

(declare-fun mapKey!52115 () (_ BitVec 32))

(assert (=> mapNonEmpty!52115 (= (arr!40761 _values!1445) (store mapRest!52115 mapKey!52115 mapValue!52115))))

(declare-fun res!851401 () Bool)

(assert (=> start!108746 (=> (not res!851401) (not e!732732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108746 (= res!851401 (validMask!0 mask!2175))))

(assert (=> start!108746 e!732732))

(declare-fun tp_is_empty!33709 () Bool)

(assert (=> start!108746 tp_is_empty!33709))

(assert (=> start!108746 true))

(declare-fun array_inv!31143 (array!84523) Bool)

(assert (=> start!108746 (and (array_inv!31143 _values!1445) e!732729)))

(declare-fun array_inv!31144 (array!84521) Bool)

(assert (=> start!108746 (array_inv!31144 _keys!1741)))

(assert (=> start!108746 tp!99316))

(declare-fun b!1282243 () Bool)

(declare-fun res!851405 () Bool)

(assert (=> b!1282243 (=> (not res!851405) (not e!732732))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1282243 (= res!851405 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41311 _keys!1741)) (not (= (select (arr!40760 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1282244 () Bool)

(assert (=> b!1282244 (= e!732731 tp_is_empty!33709)))

(declare-fun b!1282245 () Bool)

(assert (=> b!1282245 (= e!732732 (not true))))

(declare-fun minValue!1387 () V!50049)

(declare-fun zeroValue!1387 () V!50049)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21692 0))(
  ( (tuple2!21693 (_1!10857 (_ BitVec 64)) (_2!10857 V!50049)) )
))
(declare-datatypes ((List!28908 0))(
  ( (Nil!28905) (Cons!28904 (h!30122 tuple2!21692) (t!42440 List!28908)) )
))
(declare-datatypes ((ListLongMap!19357 0))(
  ( (ListLongMap!19358 (toList!9694 List!28908)) )
))
(declare-fun contains!7823 (ListLongMap!19357 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4763 (array!84521 array!84523 (_ BitVec 32) (_ BitVec 32) V!50049 V!50049 (_ BitVec 32) Int) ListLongMap!19357)

(assert (=> b!1282245 (contains!7823 (getCurrentListMap!4763 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42378 0))(
  ( (Unit!42379) )
))
(declare-fun lt!576660 () Unit!42378)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!10 (array!84521 array!84523 (_ BitVec 32) (_ BitVec 32) V!50049 V!50049 (_ BitVec 64) (_ BitVec 32) Int) Unit!42378)

(assert (=> b!1282245 (= lt!576660 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!10 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!52115 () Bool)

(assert (=> mapIsEmpty!52115 mapRes!52115))

(declare-fun b!1282246 () Bool)

(declare-fun res!851404 () Bool)

(assert (=> b!1282246 (=> (not res!851404) (not e!732732))))

(assert (=> b!1282246 (= res!851404 (contains!7823 (getCurrentListMap!4763 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282247 () Bool)

(declare-fun res!851402 () Bool)

(assert (=> b!1282247 (=> (not res!851402) (not e!732732))))

(assert (=> b!1282247 (= res!851402 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41311 _keys!1741))))))

(declare-fun b!1282248 () Bool)

(declare-fun res!851400 () Bool)

(assert (=> b!1282248 (=> (not res!851400) (not e!732732))))

(assert (=> b!1282248 (= res!851400 (and (= (size!41312 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41311 _keys!1741) (size!41312 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282249 () Bool)

(assert (=> b!1282249 (= e!732728 tp_is_empty!33709)))

(assert (= (and start!108746 res!851401) b!1282248))

(assert (= (and b!1282248 res!851400) b!1282240))

(assert (= (and b!1282240 res!851406) b!1282241))

(assert (= (and b!1282241 res!851403) b!1282247))

(assert (= (and b!1282247 res!851402) b!1282246))

(assert (= (and b!1282246 res!851404) b!1282243))

(assert (= (and b!1282243 res!851405) b!1282245))

(assert (= (and b!1282242 condMapEmpty!52115) mapIsEmpty!52115))

(assert (= (and b!1282242 (not condMapEmpty!52115)) mapNonEmpty!52115))

(get-info :version)

(assert (= (and mapNonEmpty!52115 ((_ is ValueCellFull!15956) mapValue!52115)) b!1282249))

(assert (= (and b!1282242 ((_ is ValueCellFull!15956) mapDefault!52115)) b!1282244))

(assert (= start!108746 b!1282242))

(declare-fun m!1177065 () Bool)

(assert (=> b!1282240 m!1177065))

(declare-fun m!1177067 () Bool)

(assert (=> start!108746 m!1177067))

(declare-fun m!1177069 () Bool)

(assert (=> start!108746 m!1177069))

(declare-fun m!1177071 () Bool)

(assert (=> start!108746 m!1177071))

(declare-fun m!1177073 () Bool)

(assert (=> b!1282243 m!1177073))

(declare-fun m!1177075 () Bool)

(assert (=> mapNonEmpty!52115 m!1177075))

(declare-fun m!1177077 () Bool)

(assert (=> b!1282241 m!1177077))

(declare-fun m!1177079 () Bool)

(assert (=> b!1282246 m!1177079))

(assert (=> b!1282246 m!1177079))

(declare-fun m!1177081 () Bool)

(assert (=> b!1282246 m!1177081))

(declare-fun m!1177083 () Bool)

(assert (=> b!1282245 m!1177083))

(assert (=> b!1282245 m!1177083))

(declare-fun m!1177085 () Bool)

(assert (=> b!1282245 m!1177085))

(declare-fun m!1177087 () Bool)

(assert (=> b!1282245 m!1177087))

(check-sat b_and!46131 (not b!1282246) (not b!1282240) (not b_next!28069) tp_is_empty!33709 (not start!108746) (not mapNonEmpty!52115) (not b!1282241) (not b!1282245))
(check-sat b_and!46131 (not b_next!28069))
