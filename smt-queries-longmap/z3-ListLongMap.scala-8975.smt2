; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108820 () Bool)

(assert start!108820)

(declare-fun b_free!28123 () Bool)

(declare-fun b_next!28123 () Bool)

(assert (=> start!108820 (= b_free!28123 (not b_next!28123))))

(declare-fun tp!99481 () Bool)

(declare-fun b_and!46189 () Bool)

(assert (=> start!108820 (= tp!99481 b_and!46189)))

(declare-fun b!1283200 () Bool)

(declare-fun res!852035 () Bool)

(declare-fun e!733260 () Bool)

(assert (=> b!1283200 (=> (not res!852035) (not e!733260))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50121 0))(
  ( (V!50122 (val!16956 Int)) )
))
(declare-datatypes ((ValueCell!15983 0))(
  ( (ValueCellFull!15983 (v!19552 V!50121)) (EmptyCell!15983) )
))
(declare-datatypes ((array!84629 0))(
  ( (array!84630 (arr!40813 (Array (_ BitVec 32) ValueCell!15983)) (size!41364 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84629)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84631 0))(
  ( (array!84632 (arr!40814 (Array (_ BitVec 32) (_ BitVec 64))) (size!41365 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84631)

(assert (=> b!1283200 (= res!852035 (and (= (size!41364 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41365 _keys!1741) (size!41364 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283201 () Bool)

(declare-fun res!852033 () Bool)

(assert (=> b!1283201 (=> (not res!852033) (not e!733260))))

(declare-datatypes ((List!28947 0))(
  ( (Nil!28944) (Cons!28943 (h!30161 (_ BitVec 64)) (t!42481 List!28947)) )
))
(declare-fun arrayNoDuplicates!0 (array!84631 (_ BitVec 32) List!28947) Bool)

(assert (=> b!1283201 (= res!852033 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28944))))

(declare-fun b!1283202 () Bool)

(declare-fun e!733257 () Bool)

(declare-fun e!733259 () Bool)

(declare-fun mapRes!52199 () Bool)

(assert (=> b!1283202 (= e!733257 (and e!733259 mapRes!52199))))

(declare-fun condMapEmpty!52199 () Bool)

(declare-fun mapDefault!52199 () ValueCell!15983)

(assert (=> b!1283202 (= condMapEmpty!52199 (= (arr!40813 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15983)) mapDefault!52199)))))

(declare-fun mapNonEmpty!52199 () Bool)

(declare-fun tp!99482 () Bool)

(declare-fun e!733256 () Bool)

(assert (=> mapNonEmpty!52199 (= mapRes!52199 (and tp!99482 e!733256))))

(declare-fun mapKey!52199 () (_ BitVec 32))

(declare-fun mapValue!52199 () ValueCell!15983)

(declare-fun mapRest!52199 () (Array (_ BitVec 32) ValueCell!15983))

(assert (=> mapNonEmpty!52199 (= (arr!40813 _values!1445) (store mapRest!52199 mapKey!52199 mapValue!52199))))

(declare-fun b!1283203 () Bool)

(assert (=> b!1283203 (= e!733260 false)))

(declare-fun minValue!1387 () V!50121)

(declare-fun zeroValue!1387 () V!50121)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576887 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21734 0))(
  ( (tuple2!21735 (_1!10878 (_ BitVec 64)) (_2!10878 V!50121)) )
))
(declare-datatypes ((List!28948 0))(
  ( (Nil!28945) (Cons!28944 (h!30162 tuple2!21734) (t!42482 List!28948)) )
))
(declare-datatypes ((ListLongMap!19399 0))(
  ( (ListLongMap!19400 (toList!9715 List!28948)) )
))
(declare-fun contains!7845 (ListLongMap!19399 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4784 (array!84631 array!84629 (_ BitVec 32) (_ BitVec 32) V!50121 V!50121 (_ BitVec 32) Int) ListLongMap!19399)

(assert (=> b!1283203 (= lt!576887 (contains!7845 (getCurrentListMap!4784 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283204 () Bool)

(declare-fun tp_is_empty!33763 () Bool)

(assert (=> b!1283204 (= e!733256 tp_is_empty!33763)))

(declare-fun b!1283205 () Bool)

(declare-fun res!852037 () Bool)

(assert (=> b!1283205 (=> (not res!852037) (not e!733260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84631 (_ BitVec 32)) Bool)

(assert (=> b!1283205 (= res!852037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!852036 () Bool)

(assert (=> start!108820 (=> (not res!852036) (not e!733260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108820 (= res!852036 (validMask!0 mask!2175))))

(assert (=> start!108820 e!733260))

(assert (=> start!108820 tp_is_empty!33763))

(assert (=> start!108820 true))

(declare-fun array_inv!31179 (array!84629) Bool)

(assert (=> start!108820 (and (array_inv!31179 _values!1445) e!733257)))

(declare-fun array_inv!31180 (array!84631) Bool)

(assert (=> start!108820 (array_inv!31180 _keys!1741)))

(assert (=> start!108820 tp!99481))

(declare-fun b!1283206 () Bool)

(declare-fun res!852034 () Bool)

(assert (=> b!1283206 (=> (not res!852034) (not e!733260))))

(assert (=> b!1283206 (= res!852034 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41365 _keys!1741))))))

(declare-fun mapIsEmpty!52199 () Bool)

(assert (=> mapIsEmpty!52199 mapRes!52199))

(declare-fun b!1283207 () Bool)

(assert (=> b!1283207 (= e!733259 tp_is_empty!33763)))

(assert (= (and start!108820 res!852036) b!1283200))

(assert (= (and b!1283200 res!852035) b!1283205))

(assert (= (and b!1283205 res!852037) b!1283201))

(assert (= (and b!1283201 res!852033) b!1283206))

(assert (= (and b!1283206 res!852034) b!1283203))

(assert (= (and b!1283202 condMapEmpty!52199) mapIsEmpty!52199))

(assert (= (and b!1283202 (not condMapEmpty!52199)) mapNonEmpty!52199))

(get-info :version)

(assert (= (and mapNonEmpty!52199 ((_ is ValueCellFull!15983) mapValue!52199)) b!1283204))

(assert (= (and b!1283202 ((_ is ValueCellFull!15983) mapDefault!52199)) b!1283207))

(assert (= start!108820 b!1283202))

(declare-fun m!1177881 () Bool)

(assert (=> b!1283205 m!1177881))

(declare-fun m!1177883 () Bool)

(assert (=> b!1283201 m!1177883))

(declare-fun m!1177885 () Bool)

(assert (=> mapNonEmpty!52199 m!1177885))

(declare-fun m!1177887 () Bool)

(assert (=> start!108820 m!1177887))

(declare-fun m!1177889 () Bool)

(assert (=> start!108820 m!1177889))

(declare-fun m!1177891 () Bool)

(assert (=> start!108820 m!1177891))

(declare-fun m!1177893 () Bool)

(assert (=> b!1283203 m!1177893))

(assert (=> b!1283203 m!1177893))

(declare-fun m!1177895 () Bool)

(assert (=> b!1283203 m!1177895))

(check-sat (not b!1283201) (not b_next!28123) (not start!108820) (not mapNonEmpty!52199) b_and!46189 (not b!1283205) (not b!1283203) tp_is_empty!33763)
(check-sat b_and!46189 (not b_next!28123))
