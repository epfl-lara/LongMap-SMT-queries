; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108838 () Bool)

(assert start!108838)

(declare-fun b_free!28351 () Bool)

(declare-fun b_next!28351 () Bool)

(assert (=> start!108838 (= b_free!28351 (not b_next!28351))))

(declare-fun tp!100170 () Bool)

(declare-fun b_and!46399 () Bool)

(assert (=> start!108838 (= tp!100170 b_and!46399)))

(declare-fun b!1285279 () Bool)

(declare-fun res!853846 () Bool)

(declare-fun e!734166 () Bool)

(assert (=> b!1285279 (=> (not res!853846) (not e!734166))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50425 0))(
  ( (V!50426 (val!17070 Int)) )
))
(declare-datatypes ((ValueCell!16097 0))(
  ( (ValueCellFull!16097 (v!19671 V!50425)) (EmptyCell!16097) )
))
(declare-datatypes ((array!84927 0))(
  ( (array!84928 (arr!40966 (Array (_ BitVec 32) ValueCell!16097)) (size!41518 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84927)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84929 0))(
  ( (array!84930 (arr!40967 (Array (_ BitVec 32) (_ BitVec 64))) (size!41519 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84929)

(assert (=> b!1285279 (= res!853846 (and (= (size!41518 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41519 _keys!1741) (size!41518 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285280 () Bool)

(declare-fun res!853848 () Bool)

(assert (=> b!1285280 (=> (not res!853848) (not e!734166))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1285280 (= res!853848 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41519 _keys!1741))))))

(declare-fun b!1285281 () Bool)

(declare-fun res!853845 () Bool)

(assert (=> b!1285281 (=> (not res!853845) (not e!734166))))

(declare-datatypes ((List!29123 0))(
  ( (Nil!29120) (Cons!29119 (h!30328 (_ BitVec 64)) (t!42659 List!29123)) )
))
(declare-fun arrayNoDuplicates!0 (array!84929 (_ BitVec 32) List!29123) Bool)

(assert (=> b!1285281 (= res!853845 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29120))))

(declare-fun b!1285282 () Bool)

(assert (=> b!1285282 (= e!734166 false)))

(declare-fun minValue!1387 () V!50425)

(declare-fun zeroValue!1387 () V!50425)

(declare-fun lt!576726 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21944 0))(
  ( (tuple2!21945 (_1!10983 (_ BitVec 64)) (_2!10983 V!50425)) )
))
(declare-datatypes ((List!29124 0))(
  ( (Nil!29121) (Cons!29120 (h!30329 tuple2!21944) (t!42660 List!29124)) )
))
(declare-datatypes ((ListLongMap!19601 0))(
  ( (ListLongMap!19602 (toList!9816 List!29124)) )
))
(declare-fun contains!7863 (ListLongMap!19601 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4786 (array!84929 array!84927 (_ BitVec 32) (_ BitVec 32) V!50425 V!50425 (_ BitVec 32) Int) ListLongMap!19601)

(assert (=> b!1285282 (= lt!576726 (contains!7863 (getCurrentListMap!4786 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285283 () Bool)

(declare-fun e!734162 () Bool)

(declare-fun tp_is_empty!33991 () Bool)

(assert (=> b!1285283 (= e!734162 tp_is_empty!33991)))

(declare-fun mapNonEmpty!52544 () Bool)

(declare-fun mapRes!52544 () Bool)

(declare-fun tp!100169 () Bool)

(declare-fun e!734164 () Bool)

(assert (=> mapNonEmpty!52544 (= mapRes!52544 (and tp!100169 e!734164))))

(declare-fun mapRest!52544 () (Array (_ BitVec 32) ValueCell!16097))

(declare-fun mapValue!52544 () ValueCell!16097)

(declare-fun mapKey!52544 () (_ BitVec 32))

(assert (=> mapNonEmpty!52544 (= (arr!40966 _values!1445) (store mapRest!52544 mapKey!52544 mapValue!52544))))

(declare-fun b!1285284 () Bool)

(assert (=> b!1285284 (= e!734164 tp_is_empty!33991)))

(declare-fun b!1285285 () Bool)

(declare-fun res!853844 () Bool)

(assert (=> b!1285285 (=> (not res!853844) (not e!734166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84929 (_ BitVec 32)) Bool)

(assert (=> b!1285285 (= res!853844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285286 () Bool)

(declare-fun e!734163 () Bool)

(assert (=> b!1285286 (= e!734163 (and e!734162 mapRes!52544))))

(declare-fun condMapEmpty!52544 () Bool)

(declare-fun mapDefault!52544 () ValueCell!16097)

(assert (=> b!1285286 (= condMapEmpty!52544 (= (arr!40966 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16097)) mapDefault!52544)))))

(declare-fun mapIsEmpty!52544 () Bool)

(assert (=> mapIsEmpty!52544 mapRes!52544))

(declare-fun res!853847 () Bool)

(assert (=> start!108838 (=> (not res!853847) (not e!734166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108838 (= res!853847 (validMask!0 mask!2175))))

(assert (=> start!108838 e!734166))

(assert (=> start!108838 tp_is_empty!33991))

(assert (=> start!108838 true))

(declare-fun array_inv!31229 (array!84927) Bool)

(assert (=> start!108838 (and (array_inv!31229 _values!1445) e!734163)))

(declare-fun array_inv!31230 (array!84929) Bool)

(assert (=> start!108838 (array_inv!31230 _keys!1741)))

(assert (=> start!108838 tp!100170))

(assert (= (and start!108838 res!853847) b!1285279))

(assert (= (and b!1285279 res!853846) b!1285285))

(assert (= (and b!1285285 res!853844) b!1285281))

(assert (= (and b!1285281 res!853845) b!1285280))

(assert (= (and b!1285280 res!853848) b!1285282))

(assert (= (and b!1285286 condMapEmpty!52544) mapIsEmpty!52544))

(assert (= (and b!1285286 (not condMapEmpty!52544)) mapNonEmpty!52544))

(get-info :version)

(assert (= (and mapNonEmpty!52544 ((_ is ValueCellFull!16097) mapValue!52544)) b!1285284))

(assert (= (and b!1285286 ((_ is ValueCellFull!16097) mapDefault!52544)) b!1285283))

(assert (= start!108838 b!1285286))

(declare-fun m!1178233 () Bool)

(assert (=> start!108838 m!1178233))

(declare-fun m!1178235 () Bool)

(assert (=> start!108838 m!1178235))

(declare-fun m!1178237 () Bool)

(assert (=> start!108838 m!1178237))

(declare-fun m!1178239 () Bool)

(assert (=> b!1285282 m!1178239))

(assert (=> b!1285282 m!1178239))

(declare-fun m!1178241 () Bool)

(assert (=> b!1285282 m!1178241))

(declare-fun m!1178243 () Bool)

(assert (=> b!1285285 m!1178243))

(declare-fun m!1178245 () Bool)

(assert (=> mapNonEmpty!52544 m!1178245))

(declare-fun m!1178247 () Bool)

(assert (=> b!1285281 m!1178247))

(check-sat b_and!46399 (not b!1285285) (not mapNonEmpty!52544) (not b!1285282) (not b!1285281) (not start!108838) tp_is_empty!33991 (not b_next!28351))
(check-sat b_and!46399 (not b_next!28351))
