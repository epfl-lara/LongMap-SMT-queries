; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109426 () Bool)

(assert start!109426)

(declare-fun b_free!28915 () Bool)

(declare-fun b_next!28915 () Bool)

(assert (=> start!109426 (= b_free!28915 (not b_next!28915))))

(declare-fun tp!101865 () Bool)

(declare-fun b_and!46987 () Bool)

(assert (=> start!109426 (= tp!101865 b_and!46987)))

(declare-fun b!1295527 () Bool)

(declare-fun res!861064 () Bool)

(declare-fun e!739181 () Bool)

(assert (=> b!1295527 (=> (not res!861064) (not e!739181))))

(declare-datatypes ((array!86023 0))(
  ( (array!86024 (arr!41513 (Array (_ BitVec 32) (_ BitVec 64))) (size!42065 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86023)

(declare-datatypes ((List!29529 0))(
  ( (Nil!29526) (Cons!29525 (h!30734 (_ BitVec 64)) (t!43085 List!29529)) )
))
(declare-fun arrayNoDuplicates!0 (array!86023 (_ BitVec 32) List!29529) Bool)

(assert (=> b!1295527 (= res!861064 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29526))))

(declare-fun b!1295528 () Bool)

(declare-fun e!739180 () Bool)

(declare-fun e!739184 () Bool)

(declare-fun mapRes!53393 () Bool)

(assert (=> b!1295528 (= e!739180 (and e!739184 mapRes!53393))))

(declare-fun condMapEmpty!53393 () Bool)

(declare-datatypes ((V!51177 0))(
  ( (V!51178 (val!17352 Int)) )
))
(declare-datatypes ((ValueCell!16379 0))(
  ( (ValueCellFull!16379 (v!19954 V!51177)) (EmptyCell!16379) )
))
(declare-datatypes ((array!86025 0))(
  ( (array!86026 (arr!41514 (Array (_ BitVec 32) ValueCell!16379)) (size!42066 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86025)

(declare-fun mapDefault!53393 () ValueCell!16379)

(assert (=> b!1295528 (= condMapEmpty!53393 (= (arr!41514 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16379)) mapDefault!53393)))))

(declare-fun res!861065 () Bool)

(assert (=> start!109426 (=> (not res!861065) (not e!739181))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109426 (= res!861065 (validMask!0 mask!2175))))

(assert (=> start!109426 e!739181))

(declare-fun tp_is_empty!34555 () Bool)

(assert (=> start!109426 tp_is_empty!34555))

(assert (=> start!109426 true))

(declare-fun array_inv!31593 (array!86025) Bool)

(assert (=> start!109426 (and (array_inv!31593 _values!1445) e!739180)))

(declare-fun array_inv!31594 (array!86023) Bool)

(assert (=> start!109426 (array_inv!31594 _keys!1741)))

(assert (=> start!109426 tp!101865))

(declare-fun b!1295529 () Bool)

(declare-fun e!739183 () Bool)

(assert (=> b!1295529 (= e!739181 (not e!739183))))

(declare-fun res!861070 () Bool)

(assert (=> b!1295529 (=> res!861070 e!739183)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295529 (= res!861070 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22396 0))(
  ( (tuple2!22397 (_1!11209 (_ BitVec 64)) (_2!11209 V!51177)) )
))
(declare-datatypes ((List!29530 0))(
  ( (Nil!29527) (Cons!29526 (h!30735 tuple2!22396) (t!43086 List!29530)) )
))
(declare-datatypes ((ListLongMap!20053 0))(
  ( (ListLongMap!20054 (toList!10042 List!29530)) )
))
(declare-fun contains!8090 (ListLongMap!20053 (_ BitVec 64)) Bool)

(assert (=> b!1295529 (not (contains!8090 (ListLongMap!20054 Nil!29527) k0!1205))))

(declare-datatypes ((Unit!42754 0))(
  ( (Unit!42755) )
))
(declare-fun lt!579759 () Unit!42754)

(declare-fun emptyContainsNothing!169 ((_ BitVec 64)) Unit!42754)

(assert (=> b!1295529 (= lt!579759 (emptyContainsNothing!169 k0!1205))))

(declare-fun b!1295530 () Bool)

(declare-fun e!739185 () Bool)

(assert (=> b!1295530 (= e!739185 tp_is_empty!34555)))

(declare-fun b!1295531 () Bool)

(declare-fun res!861066 () Bool)

(assert (=> b!1295531 (=> (not res!861066) (not e!739181))))

(declare-fun minValue!1387 () V!51177)

(declare-fun zeroValue!1387 () V!51177)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4966 (array!86023 array!86025 (_ BitVec 32) (_ BitVec 32) V!51177 V!51177 (_ BitVec 32) Int) ListLongMap!20053)

(assert (=> b!1295531 (= res!861066 (contains!8090 (getCurrentListMap!4966 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295532 () Bool)

(declare-fun res!861072 () Bool)

(assert (=> b!1295532 (=> (not res!861072) (not e!739181))))

(assert (=> b!1295532 (= res!861072 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42065 _keys!1741))))))

(declare-fun b!1295533 () Bool)

(declare-fun res!861068 () Bool)

(assert (=> b!1295533 (=> (not res!861068) (not e!739181))))

(assert (=> b!1295533 (= res!861068 (and (= (size!42066 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42065 _keys!1741) (size!42066 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295534 () Bool)

(declare-fun res!861071 () Bool)

(assert (=> b!1295534 (=> (not res!861071) (not e!739181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86023 (_ BitVec 32)) Bool)

(assert (=> b!1295534 (= res!861071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53393 () Bool)

(declare-fun tp!101864 () Bool)

(assert (=> mapNonEmpty!53393 (= mapRes!53393 (and tp!101864 e!739185))))

(declare-fun mapRest!53393 () (Array (_ BitVec 32) ValueCell!16379))

(declare-fun mapKey!53393 () (_ BitVec 32))

(declare-fun mapValue!53393 () ValueCell!16379)

(assert (=> mapNonEmpty!53393 (= (arr!41514 _values!1445) (store mapRest!53393 mapKey!53393 mapValue!53393))))

(declare-fun b!1295535 () Bool)

(assert (=> b!1295535 (= e!739183 true)))

(declare-fun lt!579758 () ListLongMap!20053)

(declare-fun +!4456 (ListLongMap!20053 tuple2!22396) ListLongMap!20053)

(assert (=> b!1295535 (not (contains!8090 (+!4456 lt!579758 (tuple2!22397 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579760 () Unit!42754)

(declare-fun addStillNotContains!433 (ListLongMap!20053 (_ BitVec 64) V!51177 (_ BitVec 64)) Unit!42754)

(assert (=> b!1295535 (= lt!579760 (addStillNotContains!433 lt!579758 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6090 (array!86023 array!86025 (_ BitVec 32) (_ BitVec 32) V!51177 V!51177 (_ BitVec 32) Int) ListLongMap!20053)

(assert (=> b!1295535 (= lt!579758 (getCurrentListMapNoExtraKeys!6090 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295536 () Bool)

(declare-fun res!861067 () Bool)

(assert (=> b!1295536 (=> (not res!861067) (not e!739181))))

(assert (=> b!1295536 (= res!861067 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42065 _keys!1741))))))

(declare-fun mapIsEmpty!53393 () Bool)

(assert (=> mapIsEmpty!53393 mapRes!53393))

(declare-fun b!1295537 () Bool)

(assert (=> b!1295537 (= e!739184 tp_is_empty!34555)))

(declare-fun b!1295538 () Bool)

(declare-fun res!861069 () Bool)

(assert (=> b!1295538 (=> (not res!861069) (not e!739181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295538 (= res!861069 (not (validKeyInArray!0 (select (arr!41513 _keys!1741) from!2144))))))

(assert (= (and start!109426 res!861065) b!1295533))

(assert (= (and b!1295533 res!861068) b!1295534))

(assert (= (and b!1295534 res!861071) b!1295527))

(assert (= (and b!1295527 res!861064) b!1295532))

(assert (= (and b!1295532 res!861072) b!1295531))

(assert (= (and b!1295531 res!861066) b!1295536))

(assert (= (and b!1295536 res!861067) b!1295538))

(assert (= (and b!1295538 res!861069) b!1295529))

(assert (= (and b!1295529 (not res!861070)) b!1295535))

(assert (= (and b!1295528 condMapEmpty!53393) mapIsEmpty!53393))

(assert (= (and b!1295528 (not condMapEmpty!53393)) mapNonEmpty!53393))

(get-info :version)

(assert (= (and mapNonEmpty!53393 ((_ is ValueCellFull!16379) mapValue!53393)) b!1295530))

(assert (= (and b!1295528 ((_ is ValueCellFull!16379) mapDefault!53393)) b!1295537))

(assert (= start!109426 b!1295528))

(declare-fun m!1187091 () Bool)

(assert (=> b!1295529 m!1187091))

(declare-fun m!1187093 () Bool)

(assert (=> b!1295529 m!1187093))

(declare-fun m!1187095 () Bool)

(assert (=> b!1295538 m!1187095))

(assert (=> b!1295538 m!1187095))

(declare-fun m!1187097 () Bool)

(assert (=> b!1295538 m!1187097))

(declare-fun m!1187099 () Bool)

(assert (=> b!1295527 m!1187099))

(declare-fun m!1187101 () Bool)

(assert (=> b!1295535 m!1187101))

(assert (=> b!1295535 m!1187101))

(declare-fun m!1187103 () Bool)

(assert (=> b!1295535 m!1187103))

(declare-fun m!1187105 () Bool)

(assert (=> b!1295535 m!1187105))

(declare-fun m!1187107 () Bool)

(assert (=> b!1295535 m!1187107))

(declare-fun m!1187109 () Bool)

(assert (=> start!109426 m!1187109))

(declare-fun m!1187111 () Bool)

(assert (=> start!109426 m!1187111))

(declare-fun m!1187113 () Bool)

(assert (=> start!109426 m!1187113))

(declare-fun m!1187115 () Bool)

(assert (=> b!1295531 m!1187115))

(assert (=> b!1295531 m!1187115))

(declare-fun m!1187117 () Bool)

(assert (=> b!1295531 m!1187117))

(declare-fun m!1187119 () Bool)

(assert (=> mapNonEmpty!53393 m!1187119))

(declare-fun m!1187121 () Bool)

(assert (=> b!1295534 m!1187121))

(check-sat (not b!1295534) b_and!46987 (not b!1295535) (not b!1295538) (not b!1295529) (not mapNonEmpty!53393) (not b!1295531) (not start!109426) (not b!1295527) tp_is_empty!34555 (not b_next!28915))
(check-sat b_and!46987 (not b_next!28915))
