; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!636 () Bool)

(assert start!636)

(declare-fun b_free!109 () Bool)

(declare-fun b_next!109 () Bool)

(assert (=> start!636 (= b_free!109 (not b_next!109))))

(declare-fun tp!545 () Bool)

(declare-fun b_and!247 () Bool)

(assert (=> start!636 (= tp!545 b_and!247)))

(declare-fun b!4078 () Bool)

(declare-fun res!5534 () Bool)

(declare-fun e!2118 () Bool)

(assert (=> b!4078 (=> (not res!5534) (not e!2118))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!427 0))(
  ( (V!428 (val!99 Int)) )
))
(declare-datatypes ((ValueCell!77 0))(
  ( (ValueCellFull!77 (v!1186 V!427)) (EmptyCell!77) )
))
(declare-datatypes ((array!301 0))(
  ( (array!302 (arr!143 (Array (_ BitVec 32) ValueCell!77)) (size!205 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!301)

(declare-datatypes ((array!303 0))(
  ( (array!304 (arr!144 (Array (_ BitVec 32) (_ BitVec 64))) (size!206 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!303)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!4078 (= res!5534 (and (= (size!205 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!206 _keys!1806) (size!205 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4079 () Bool)

(declare-fun res!5536 () Bool)

(assert (=> b!4079 (=> (not res!5536) (not e!2118))))

(declare-datatypes ((List!90 0))(
  ( (Nil!87) (Cons!86 (h!652 (_ BitVec 64)) (t!2217 List!90)) )
))
(declare-fun arrayNoDuplicates!0 (array!303 (_ BitVec 32) List!90) Bool)

(assert (=> b!4079 (= res!5536 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!87))))

(declare-fun b!4080 () Bool)

(assert (=> b!4080 (= e!2118 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun lt!564 () Bool)

(declare-fun minValue!1434 () V!427)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!427)

(declare-datatypes ((tuple2!86 0))(
  ( (tuple2!87 (_1!43 (_ BitVec 64)) (_2!43 V!427)) )
))
(declare-datatypes ((List!91 0))(
  ( (Nil!88) (Cons!87 (h!653 tuple2!86) (t!2218 List!91)) )
))
(declare-datatypes ((ListLongMap!91 0))(
  ( (ListLongMap!92 (toList!61 List!91)) )
))
(declare-fun contains!31 (ListLongMap!91 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!20 (array!303 array!301 (_ BitVec 32) (_ BitVec 32) V!427 V!427 (_ BitVec 32) Int) ListLongMap!91)

(assert (=> b!4080 (= lt!564 (contains!31 (getCurrentListMap!20 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!4081 () Bool)

(declare-fun e!2120 () Bool)

(declare-fun e!2116 () Bool)

(declare-fun mapRes!239 () Bool)

(assert (=> b!4081 (= e!2120 (and e!2116 mapRes!239))))

(declare-fun condMapEmpty!239 () Bool)

(declare-fun mapDefault!239 () ValueCell!77)

(assert (=> b!4081 (= condMapEmpty!239 (= (arr!143 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!77)) mapDefault!239)))))

(declare-fun b!4082 () Bool)

(declare-fun tp_is_empty!187 () Bool)

(assert (=> b!4082 (= e!2116 tp_is_empty!187)))

(declare-fun mapNonEmpty!239 () Bool)

(declare-fun tp!544 () Bool)

(declare-fun e!2117 () Bool)

(assert (=> mapNonEmpty!239 (= mapRes!239 (and tp!544 e!2117))))

(declare-fun mapValue!239 () ValueCell!77)

(declare-fun mapRest!239 () (Array (_ BitVec 32) ValueCell!77))

(declare-fun mapKey!239 () (_ BitVec 32))

(assert (=> mapNonEmpty!239 (= (arr!143 _values!1492) (store mapRest!239 mapKey!239 mapValue!239))))

(declare-fun b!4083 () Bool)

(declare-fun res!5535 () Bool)

(assert (=> b!4083 (=> (not res!5535) (not e!2118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!303 (_ BitVec 32)) Bool)

(assert (=> b!4083 (= res!5535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!5533 () Bool)

(assert (=> start!636 (=> (not res!5533) (not e!2118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!636 (= res!5533 (validMask!0 mask!2250))))

(assert (=> start!636 e!2118))

(assert (=> start!636 tp!545))

(assert (=> start!636 true))

(declare-fun array_inv!97 (array!301) Bool)

(assert (=> start!636 (and (array_inv!97 _values!1492) e!2120)))

(assert (=> start!636 tp_is_empty!187))

(declare-fun array_inv!98 (array!303) Bool)

(assert (=> start!636 (array_inv!98 _keys!1806)))

(declare-fun mapIsEmpty!239 () Bool)

(assert (=> mapIsEmpty!239 mapRes!239))

(declare-fun b!4084 () Bool)

(assert (=> b!4084 (= e!2117 tp_is_empty!187)))

(assert (= (and start!636 res!5533) b!4078))

(assert (= (and b!4078 res!5534) b!4083))

(assert (= (and b!4083 res!5535) b!4079))

(assert (= (and b!4079 res!5536) b!4080))

(assert (= (and b!4081 condMapEmpty!239) mapIsEmpty!239))

(assert (= (and b!4081 (not condMapEmpty!239)) mapNonEmpty!239))

(get-info :version)

(assert (= (and mapNonEmpty!239 ((_ is ValueCellFull!77) mapValue!239)) b!4084))

(assert (= (and b!4081 ((_ is ValueCellFull!77) mapDefault!239)) b!4082))

(assert (= start!636 b!4081))

(declare-fun m!2111 () Bool)

(assert (=> start!636 m!2111))

(declare-fun m!2113 () Bool)

(assert (=> start!636 m!2113))

(declare-fun m!2115 () Bool)

(assert (=> start!636 m!2115))

(declare-fun m!2117 () Bool)

(assert (=> mapNonEmpty!239 m!2117))

(declare-fun m!2119 () Bool)

(assert (=> b!4080 m!2119))

(assert (=> b!4080 m!2119))

(declare-fun m!2121 () Bool)

(assert (=> b!4080 m!2121))

(declare-fun m!2123 () Bool)

(assert (=> b!4079 m!2123))

(declare-fun m!2125 () Bool)

(assert (=> b!4083 m!2125))

(check-sat (not b!4079) b_and!247 (not b!4083) (not start!636) tp_is_empty!187 (not b!4080) (not b_next!109) (not mapNonEmpty!239))
(check-sat b_and!247 (not b_next!109))
