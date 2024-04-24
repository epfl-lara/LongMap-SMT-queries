; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109512 () Bool)

(assert start!109512)

(declare-fun b_free!28777 () Bool)

(declare-fun b_next!28777 () Bool)

(assert (=> start!109512 (= b_free!28777 (not b_next!28777))))

(declare-fun tp!101450 () Bool)

(declare-fun b_and!46869 () Bool)

(assert (=> start!109512 (= tp!101450 b_and!46869)))

(declare-fun b!1294493 () Bool)

(declare-fun e!738897 () Bool)

(assert (=> b!1294493 (= e!738897 true)))

(declare-datatypes ((V!50993 0))(
  ( (V!50994 (val!17283 Int)) )
))
(declare-datatypes ((tuple2!22254 0))(
  ( (tuple2!22255 (_1!11138 (_ BitVec 64)) (_2!11138 V!50993)) )
))
(declare-datatypes ((List!29420 0))(
  ( (Nil!29417) (Cons!29416 (h!30634 tuple2!22254) (t!42976 List!29420)) )
))
(declare-datatypes ((ListLongMap!19919 0))(
  ( (ListLongMap!19920 (toList!9975 List!29420)) )
))
(declare-fun lt!579972 () ListLongMap!19919)

(declare-fun zeroValue!1387 () V!50993)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8106 (ListLongMap!19919 (_ BitVec 64)) Bool)

(declare-fun +!4445 (ListLongMap!19919 tuple2!22254) ListLongMap!19919)

(assert (=> b!1294493 (not (contains!8106 (+!4445 lt!579972 (tuple2!22255 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42789 0))(
  ( (Unit!42790) )
))
(declare-fun lt!579970 () Unit!42789)

(declare-fun addStillNotContains!421 (ListLongMap!19919 (_ BitVec 64) V!50993 (_ BitVec 64)) Unit!42789)

(assert (=> b!1294493 (= lt!579970 (addStillNotContains!421 lt!579972 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50993)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16310 0))(
  ( (ValueCellFull!16310 (v!19881 V!50993)) (EmptyCell!16310) )
))
(declare-datatypes ((array!85897 0))(
  ( (array!85898 (arr!41445 (Array (_ BitVec 32) ValueCell!16310)) (size!41996 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85897)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85899 0))(
  ( (array!85900 (arr!41446 (Array (_ BitVec 32) (_ BitVec 64))) (size!41997 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85899)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6085 (array!85899 array!85897 (_ BitVec 32) (_ BitVec 32) V!50993 V!50993 (_ BitVec 32) Int) ListLongMap!19919)

(assert (=> b!1294493 (= lt!579972 (getCurrentListMapNoExtraKeys!6085 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1294494 () Bool)

(declare-fun e!738900 () Bool)

(declare-fun tp_is_empty!34417 () Bool)

(assert (=> b!1294494 (= e!738900 tp_is_empty!34417)))

(declare-fun mapNonEmpty!53186 () Bool)

(declare-fun mapRes!53186 () Bool)

(declare-fun tp!101449 () Bool)

(assert (=> mapNonEmpty!53186 (= mapRes!53186 (and tp!101449 e!738900))))

(declare-fun mapRest!53186 () (Array (_ BitVec 32) ValueCell!16310))

(declare-fun mapValue!53186 () ValueCell!16310)

(declare-fun mapKey!53186 () (_ BitVec 32))

(assert (=> mapNonEmpty!53186 (= (arr!41445 _values!1445) (store mapRest!53186 mapKey!53186 mapValue!53186))))

(declare-fun b!1294496 () Bool)

(declare-fun res!859830 () Bool)

(declare-fun e!738898 () Bool)

(assert (=> b!1294496 (=> (not res!859830) (not e!738898))))

(declare-fun getCurrentListMap!5005 (array!85899 array!85897 (_ BitVec 32) (_ BitVec 32) V!50993 V!50993 (_ BitVec 32) Int) ListLongMap!19919)

(assert (=> b!1294496 (= res!859830 (contains!8106 (getCurrentListMap!5005 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53186 () Bool)

(assert (=> mapIsEmpty!53186 mapRes!53186))

(declare-fun b!1294497 () Bool)

(declare-fun e!738899 () Bool)

(assert (=> b!1294497 (= e!738899 tp_is_empty!34417)))

(declare-fun b!1294498 () Bool)

(declare-fun res!859831 () Bool)

(assert (=> b!1294498 (=> (not res!859831) (not e!738898))))

(assert (=> b!1294498 (= res!859831 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41997 _keys!1741))))))

(declare-fun b!1294499 () Bool)

(declare-fun e!738895 () Bool)

(assert (=> b!1294499 (= e!738895 (and e!738899 mapRes!53186))))

(declare-fun condMapEmpty!53186 () Bool)

(declare-fun mapDefault!53186 () ValueCell!16310)

(assert (=> b!1294499 (= condMapEmpty!53186 (= (arr!41445 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16310)) mapDefault!53186)))))

(declare-fun b!1294500 () Bool)

(assert (=> b!1294500 (= e!738898 (not e!738897))))

(declare-fun res!859835 () Bool)

(assert (=> b!1294500 (=> res!859835 e!738897)))

(assert (=> b!1294500 (= res!859835 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1294500 (not (contains!8106 (ListLongMap!19920 Nil!29417) k0!1205))))

(declare-fun lt!579971 () Unit!42789)

(declare-fun emptyContainsNothing!137 ((_ BitVec 64)) Unit!42789)

(assert (=> b!1294500 (= lt!579971 (emptyContainsNothing!137 k0!1205))))

(declare-fun b!1294501 () Bool)

(declare-fun res!859836 () Bool)

(assert (=> b!1294501 (=> (not res!859836) (not e!738898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85899 (_ BitVec 32)) Bool)

(assert (=> b!1294501 (= res!859836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294502 () Bool)

(declare-fun res!859829 () Bool)

(assert (=> b!1294502 (=> (not res!859829) (not e!738898))))

(declare-datatypes ((List!29421 0))(
  ( (Nil!29418) (Cons!29417 (h!30635 (_ BitVec 64)) (t!42977 List!29421)) )
))
(declare-fun arrayNoDuplicates!0 (array!85899 (_ BitVec 32) List!29421) Bool)

(assert (=> b!1294502 (= res!859829 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29418))))

(declare-fun b!1294495 () Bool)

(declare-fun res!859832 () Bool)

(assert (=> b!1294495 (=> (not res!859832) (not e!738898))))

(assert (=> b!1294495 (= res!859832 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41997 _keys!1741))))))

(declare-fun res!859833 () Bool)

(assert (=> start!109512 (=> (not res!859833) (not e!738898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109512 (= res!859833 (validMask!0 mask!2175))))

(assert (=> start!109512 e!738898))

(assert (=> start!109512 tp_is_empty!34417))

(assert (=> start!109512 true))

(declare-fun array_inv!31627 (array!85897) Bool)

(assert (=> start!109512 (and (array_inv!31627 _values!1445) e!738895)))

(declare-fun array_inv!31628 (array!85899) Bool)

(assert (=> start!109512 (array_inv!31628 _keys!1741)))

(assert (=> start!109512 tp!101450))

(declare-fun b!1294503 () Bool)

(declare-fun res!859834 () Bool)

(assert (=> b!1294503 (=> (not res!859834) (not e!738898))))

(assert (=> b!1294503 (= res!859834 (and (= (size!41996 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41997 _keys!1741) (size!41996 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294504 () Bool)

(declare-fun res!859837 () Bool)

(assert (=> b!1294504 (=> (not res!859837) (not e!738898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294504 (= res!859837 (not (validKeyInArray!0 (select (arr!41446 _keys!1741) from!2144))))))

(assert (= (and start!109512 res!859833) b!1294503))

(assert (= (and b!1294503 res!859834) b!1294501))

(assert (= (and b!1294501 res!859836) b!1294502))

(assert (= (and b!1294502 res!859829) b!1294498))

(assert (= (and b!1294498 res!859831) b!1294496))

(assert (= (and b!1294496 res!859830) b!1294495))

(assert (= (and b!1294495 res!859832) b!1294504))

(assert (= (and b!1294504 res!859837) b!1294500))

(assert (= (and b!1294500 (not res!859835)) b!1294493))

(assert (= (and b!1294499 condMapEmpty!53186) mapIsEmpty!53186))

(assert (= (and b!1294499 (not condMapEmpty!53186)) mapNonEmpty!53186))

(get-info :version)

(assert (= (and mapNonEmpty!53186 ((_ is ValueCellFull!16310) mapValue!53186)) b!1294494))

(assert (= (and b!1294499 ((_ is ValueCellFull!16310) mapDefault!53186)) b!1294497))

(assert (= start!109512 b!1294499))

(declare-fun m!1187229 () Bool)

(assert (=> b!1294501 m!1187229))

(declare-fun m!1187231 () Bool)

(assert (=> b!1294504 m!1187231))

(assert (=> b!1294504 m!1187231))

(declare-fun m!1187233 () Bool)

(assert (=> b!1294504 m!1187233))

(declare-fun m!1187235 () Bool)

(assert (=> start!109512 m!1187235))

(declare-fun m!1187237 () Bool)

(assert (=> start!109512 m!1187237))

(declare-fun m!1187239 () Bool)

(assert (=> start!109512 m!1187239))

(declare-fun m!1187241 () Bool)

(assert (=> b!1294493 m!1187241))

(assert (=> b!1294493 m!1187241))

(declare-fun m!1187243 () Bool)

(assert (=> b!1294493 m!1187243))

(declare-fun m!1187245 () Bool)

(assert (=> b!1294493 m!1187245))

(declare-fun m!1187247 () Bool)

(assert (=> b!1294493 m!1187247))

(declare-fun m!1187249 () Bool)

(assert (=> b!1294500 m!1187249))

(declare-fun m!1187251 () Bool)

(assert (=> b!1294500 m!1187251))

(declare-fun m!1187253 () Bool)

(assert (=> mapNonEmpty!53186 m!1187253))

(declare-fun m!1187255 () Bool)

(assert (=> b!1294502 m!1187255))

(declare-fun m!1187257 () Bool)

(assert (=> b!1294496 m!1187257))

(assert (=> b!1294496 m!1187257))

(declare-fun m!1187259 () Bool)

(assert (=> b!1294496 m!1187259))

(check-sat b_and!46869 (not b!1294500) (not b!1294496) (not b!1294493) (not b!1294502) (not mapNonEmpty!53186) (not start!109512) (not b!1294501) (not b_next!28777) tp_is_empty!34417 (not b!1294504))
(check-sat b_and!46869 (not b_next!28777))
