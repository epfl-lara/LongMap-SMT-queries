; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!638 () Bool)

(assert start!638)

(declare-fun b_free!111 () Bool)

(declare-fun b_next!111 () Bool)

(assert (=> start!638 (= b_free!111 (not b_next!111))))

(declare-fun tp!550 () Bool)

(declare-fun b_and!249 () Bool)

(assert (=> start!638 (= tp!550 b_and!249)))

(declare-fun b!4099 () Bool)

(declare-fun e!2132 () Bool)

(declare-fun e!2134 () Bool)

(declare-fun mapRes!242 () Bool)

(assert (=> b!4099 (= e!2132 (and e!2134 mapRes!242))))

(declare-fun condMapEmpty!242 () Bool)

(declare-datatypes ((V!429 0))(
  ( (V!430 (val!100 Int)) )
))
(declare-datatypes ((ValueCell!78 0))(
  ( (ValueCellFull!78 (v!1187 V!429)) (EmptyCell!78) )
))
(declare-datatypes ((array!309 0))(
  ( (array!310 (arr!147 (Array (_ BitVec 32) ValueCell!78)) (size!209 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!309)

(declare-fun mapDefault!242 () ValueCell!78)

(assert (=> b!4099 (= condMapEmpty!242 (= (arr!147 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!78)) mapDefault!242)))))

(declare-fun b!4100 () Bool)

(declare-fun e!2135 () Bool)

(assert (=> b!4100 (= e!2135 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun minValue!1434 () V!429)

(declare-datatypes ((array!311 0))(
  ( (array!312 (arr!148 (Array (_ BitVec 32) (_ BitVec 64))) (size!210 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!311)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!429)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun lt!567 () Bool)

(declare-datatypes ((tuple2!78 0))(
  ( (tuple2!79 (_1!39 (_ BitVec 64)) (_2!39 V!429)) )
))
(declare-datatypes ((List!88 0))(
  ( (Nil!85) (Cons!84 (h!650 tuple2!78) (t!2215 List!88)) )
))
(declare-datatypes ((ListLongMap!83 0))(
  ( (ListLongMap!84 (toList!57 List!88)) )
))
(declare-fun contains!27 (ListLongMap!83 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!16 (array!311 array!309 (_ BitVec 32) (_ BitVec 32) V!429 V!429 (_ BitVec 32) Int) ListLongMap!83)

(assert (=> b!4100 (= lt!567 (contains!27 (getCurrentListMap!16 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun res!5548 () Bool)

(assert (=> start!638 (=> (not res!5548) (not e!2135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!638 (= res!5548 (validMask!0 mask!2250))))

(assert (=> start!638 e!2135))

(assert (=> start!638 tp!550))

(assert (=> start!638 true))

(declare-fun array_inv!107 (array!309) Bool)

(assert (=> start!638 (and (array_inv!107 _values!1492) e!2132)))

(declare-fun tp_is_empty!189 () Bool)

(assert (=> start!638 tp_is_empty!189))

(declare-fun array_inv!108 (array!311) Bool)

(assert (=> start!638 (array_inv!108 _keys!1806)))

(declare-fun mapIsEmpty!242 () Bool)

(assert (=> mapIsEmpty!242 mapRes!242))

(declare-fun b!4101 () Bool)

(declare-fun res!5545 () Bool)

(assert (=> b!4101 (=> (not res!5545) (not e!2135))))

(declare-datatypes ((List!89 0))(
  ( (Nil!86) (Cons!85 (h!651 (_ BitVec 64)) (t!2216 List!89)) )
))
(declare-fun arrayNoDuplicates!0 (array!311 (_ BitVec 32) List!89) Bool)

(assert (=> b!4101 (= res!5545 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!86))))

(declare-fun b!4102 () Bool)

(declare-fun e!2131 () Bool)

(assert (=> b!4102 (= e!2131 tp_is_empty!189)))

(declare-fun b!4103 () Bool)

(declare-fun res!5546 () Bool)

(assert (=> b!4103 (=> (not res!5546) (not e!2135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!311 (_ BitVec 32)) Bool)

(assert (=> b!4103 (= res!5546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!4104 () Bool)

(assert (=> b!4104 (= e!2134 tp_is_empty!189)))

(declare-fun mapNonEmpty!242 () Bool)

(declare-fun tp!551 () Bool)

(assert (=> mapNonEmpty!242 (= mapRes!242 (and tp!551 e!2131))))

(declare-fun mapRest!242 () (Array (_ BitVec 32) ValueCell!78))

(declare-fun mapValue!242 () ValueCell!78)

(declare-fun mapKey!242 () (_ BitVec 32))

(assert (=> mapNonEmpty!242 (= (arr!147 _values!1492) (store mapRest!242 mapKey!242 mapValue!242))))

(declare-fun b!4105 () Bool)

(declare-fun res!5547 () Bool)

(assert (=> b!4105 (=> (not res!5547) (not e!2135))))

(assert (=> b!4105 (= res!5547 (and (= (size!209 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!210 _keys!1806) (size!209 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(assert (= (and start!638 res!5548) b!4105))

(assert (= (and b!4105 res!5547) b!4103))

(assert (= (and b!4103 res!5546) b!4101))

(assert (= (and b!4101 res!5545) b!4100))

(assert (= (and b!4099 condMapEmpty!242) mapIsEmpty!242))

(assert (= (and b!4099 (not condMapEmpty!242)) mapNonEmpty!242))

(get-info :version)

(assert (= (and mapNonEmpty!242 ((_ is ValueCellFull!78) mapValue!242)) b!4102))

(assert (= (and b!4099 ((_ is ValueCellFull!78) mapDefault!242)) b!4104))

(assert (= start!638 b!4099))

(declare-fun m!2127 () Bool)

(assert (=> b!4103 m!2127))

(declare-fun m!2129 () Bool)

(assert (=> b!4100 m!2129))

(assert (=> b!4100 m!2129))

(declare-fun m!2131 () Bool)

(assert (=> b!4100 m!2131))

(declare-fun m!2133 () Bool)

(assert (=> b!4101 m!2133))

(declare-fun m!2135 () Bool)

(assert (=> start!638 m!2135))

(declare-fun m!2137 () Bool)

(assert (=> start!638 m!2137))

(declare-fun m!2139 () Bool)

(assert (=> start!638 m!2139))

(declare-fun m!2141 () Bool)

(assert (=> mapNonEmpty!242 m!2141))

(check-sat (not b!4101) tp_is_empty!189 (not b!4103) (not start!638) (not mapNonEmpty!242) (not b_next!111) (not b!4100) b_and!249)
(check-sat b_and!249 (not b_next!111))
