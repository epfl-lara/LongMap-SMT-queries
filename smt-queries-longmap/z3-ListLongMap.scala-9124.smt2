; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109530 () Bool)

(assert start!109530)

(declare-fun b_free!29019 () Bool)

(declare-fun b_next!29019 () Bool)

(assert (=> start!109530 (= b_free!29019 (not b_next!29019))))

(declare-fun tp!102176 () Bool)

(declare-fun b_and!47109 () Bool)

(assert (=> start!109530 (= tp!102176 b_and!47109)))

(declare-fun b!1297263 () Bool)

(declare-fun e!740116 () Bool)

(declare-fun tp_is_empty!34659 () Bool)

(assert (=> b!1297263 (= e!740116 tp_is_empty!34659)))

(declare-fun b!1297264 () Bool)

(declare-fun res!862135 () Bool)

(declare-fun e!740114 () Bool)

(assert (=> b!1297264 (=> (not res!862135) (not e!740114))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51315 0))(
  ( (V!51316 (val!17404 Int)) )
))
(declare-datatypes ((ValueCell!16431 0))(
  ( (ValueCellFull!16431 (v!20007 V!51315)) (EmptyCell!16431) )
))
(declare-datatypes ((array!86328 0))(
  ( (array!86329 (arr!41665 (Array (_ BitVec 32) ValueCell!16431)) (size!42215 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86328)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86330 0))(
  ( (array!86331 (arr!41666 (Array (_ BitVec 32) (_ BitVec 64))) (size!42216 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86330)

(assert (=> b!1297264 (= res!862135 (and (= (size!42215 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42216 _keys!1741) (size!42215 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297265 () Bool)

(declare-fun e!740115 () Bool)

(declare-fun mapRes!53549 () Bool)

(assert (=> b!1297265 (= e!740115 (and e!740116 mapRes!53549))))

(declare-fun condMapEmpty!53549 () Bool)

(declare-fun mapDefault!53549 () ValueCell!16431)

(assert (=> b!1297265 (= condMapEmpty!53549 (= (arr!41665 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16431)) mapDefault!53549)))))

(declare-fun b!1297266 () Bool)

(declare-fun res!862137 () Bool)

(assert (=> b!1297266 (=> (not res!862137) (not e!740114))))

(declare-datatypes ((List!29560 0))(
  ( (Nil!29557) (Cons!29556 (h!30765 (_ BitVec 64)) (t!43124 List!29560)) )
))
(declare-fun arrayNoDuplicates!0 (array!86330 (_ BitVec 32) List!29560) Bool)

(assert (=> b!1297266 (= res!862137 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29557))))

(declare-fun b!1297267 () Bool)

(assert (=> b!1297267 (= e!740114 false)))

(declare-fun minValue!1387 () V!51315)

(declare-fun zeroValue!1387 () V!51315)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580574 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22424 0))(
  ( (tuple2!22425 (_1!11223 (_ BitVec 64)) (_2!11223 V!51315)) )
))
(declare-datatypes ((List!29561 0))(
  ( (Nil!29558) (Cons!29557 (h!30766 tuple2!22424) (t!43125 List!29561)) )
))
(declare-datatypes ((ListLongMap!20081 0))(
  ( (ListLongMap!20082 (toList!10056 List!29561)) )
))
(declare-fun contains!8174 (ListLongMap!20081 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5085 (array!86330 array!86328 (_ BitVec 32) (_ BitVec 32) V!51315 V!51315 (_ BitVec 32) Int) ListLongMap!20081)

(assert (=> b!1297267 (= lt!580574 (contains!8174 (getCurrentListMap!5085 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!862136 () Bool)

(assert (=> start!109530 (=> (not res!862136) (not e!740114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109530 (= res!862136 (validMask!0 mask!2175))))

(assert (=> start!109530 e!740114))

(assert (=> start!109530 tp_is_empty!34659))

(assert (=> start!109530 true))

(declare-fun array_inv!31533 (array!86328) Bool)

(assert (=> start!109530 (and (array_inv!31533 _values!1445) e!740115)))

(declare-fun array_inv!31534 (array!86330) Bool)

(assert (=> start!109530 (array_inv!31534 _keys!1741)))

(assert (=> start!109530 tp!102176))

(declare-fun mapIsEmpty!53549 () Bool)

(assert (=> mapIsEmpty!53549 mapRes!53549))

(declare-fun b!1297268 () Bool)

(declare-fun res!862133 () Bool)

(assert (=> b!1297268 (=> (not res!862133) (not e!740114))))

(assert (=> b!1297268 (= res!862133 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42216 _keys!1741))))))

(declare-fun b!1297269 () Bool)

(declare-fun e!740117 () Bool)

(assert (=> b!1297269 (= e!740117 tp_is_empty!34659)))

(declare-fun mapNonEmpty!53549 () Bool)

(declare-fun tp!102175 () Bool)

(assert (=> mapNonEmpty!53549 (= mapRes!53549 (and tp!102175 e!740117))))

(declare-fun mapKey!53549 () (_ BitVec 32))

(declare-fun mapRest!53549 () (Array (_ BitVec 32) ValueCell!16431))

(declare-fun mapValue!53549 () ValueCell!16431)

(assert (=> mapNonEmpty!53549 (= (arr!41665 _values!1445) (store mapRest!53549 mapKey!53549 mapValue!53549))))

(declare-fun b!1297270 () Bool)

(declare-fun res!862134 () Bool)

(assert (=> b!1297270 (=> (not res!862134) (not e!740114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86330 (_ BitVec 32)) Bool)

(assert (=> b!1297270 (= res!862134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109530 res!862136) b!1297264))

(assert (= (and b!1297264 res!862135) b!1297270))

(assert (= (and b!1297270 res!862134) b!1297266))

(assert (= (and b!1297266 res!862137) b!1297268))

(assert (= (and b!1297268 res!862133) b!1297267))

(assert (= (and b!1297265 condMapEmpty!53549) mapIsEmpty!53549))

(assert (= (and b!1297265 (not condMapEmpty!53549)) mapNonEmpty!53549))

(get-info :version)

(assert (= (and mapNonEmpty!53549 ((_ is ValueCellFull!16431) mapValue!53549)) b!1297269))

(assert (= (and b!1297265 ((_ is ValueCellFull!16431) mapDefault!53549)) b!1297263))

(assert (= start!109530 b!1297265))

(declare-fun m!1188915 () Bool)

(assert (=> b!1297267 m!1188915))

(assert (=> b!1297267 m!1188915))

(declare-fun m!1188917 () Bool)

(assert (=> b!1297267 m!1188917))

(declare-fun m!1188919 () Bool)

(assert (=> mapNonEmpty!53549 m!1188919))

(declare-fun m!1188921 () Bool)

(assert (=> b!1297266 m!1188921))

(declare-fun m!1188923 () Bool)

(assert (=> b!1297270 m!1188923))

(declare-fun m!1188925 () Bool)

(assert (=> start!109530 m!1188925))

(declare-fun m!1188927 () Bool)

(assert (=> start!109530 m!1188927))

(declare-fun m!1188929 () Bool)

(assert (=> start!109530 m!1188929))

(check-sat (not b!1297270) (not b_next!29019) tp_is_empty!34659 (not b!1297267) (not mapNonEmpty!53549) (not b!1297266) (not start!109530) b_and!47109)
(check-sat b_and!47109 (not b_next!29019))
