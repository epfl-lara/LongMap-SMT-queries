; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109078 () Bool)

(assert start!109078)

(declare-fun b_free!28567 () Bool)

(declare-fun b_next!28567 () Bool)

(assert (=> start!109078 (= b_free!28567 (not b_next!28567))))

(declare-fun tp!100820 () Bool)

(declare-fun b_and!46639 () Bool)

(assert (=> start!109078 (= tp!100820 b_and!46639)))

(declare-fun b!1289425 () Bool)

(declare-fun e!736210 () Bool)

(declare-fun e!736213 () Bool)

(declare-fun mapRes!52871 () Bool)

(assert (=> b!1289425 (= e!736210 (and e!736213 mapRes!52871))))

(declare-fun condMapEmpty!52871 () Bool)

(declare-datatypes ((V!50713 0))(
  ( (V!50714 (val!17178 Int)) )
))
(declare-datatypes ((ValueCell!16205 0))(
  ( (ValueCellFull!16205 (v!19780 V!50713)) (EmptyCell!16205) )
))
(declare-datatypes ((array!85343 0))(
  ( (array!85344 (arr!41173 (Array (_ BitVec 32) ValueCell!16205)) (size!41725 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85343)

(declare-fun mapDefault!52871 () ValueCell!16205)

(assert (=> b!1289425 (= condMapEmpty!52871 (= (arr!41173 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16205)) mapDefault!52871)))))

(declare-fun b!1289426 () Bool)

(declare-fun e!736215 () Bool)

(assert (=> b!1289426 (= e!736215 true)))

(declare-datatypes ((tuple2!22114 0))(
  ( (tuple2!22115 (_1!11068 (_ BitVec 64)) (_2!11068 V!50713)) )
))
(declare-datatypes ((List!29276 0))(
  ( (Nil!29273) (Cons!29272 (h!30481 tuple2!22114) (t!42832 List!29276)) )
))
(declare-datatypes ((ListLongMap!19771 0))(
  ( (ListLongMap!19772 (toList!9901 List!29276)) )
))
(declare-fun lt!578095 () ListLongMap!19771)

(declare-fun minValue!1387 () V!50713)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7949 (ListLongMap!19771 (_ BitVec 64)) Bool)

(declare-fun +!4386 (ListLongMap!19771 tuple2!22114) ListLongMap!19771)

(assert (=> b!1289426 (not (contains!7949 (+!4386 lt!578095 (tuple2!22115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42506 0))(
  ( (Unit!42507) )
))
(declare-fun lt!578098 () Unit!42506)

(declare-fun addStillNotContains!363 (ListLongMap!19771 (_ BitVec 64) V!50713 (_ BitVec 64)) Unit!42506)

(assert (=> b!1289426 (= lt!578098 (addStillNotContains!363 lt!578095 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!50713)

(assert (=> b!1289426 (not (contains!7949 (+!4386 lt!578095 (tuple2!22115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578097 () Unit!42506)

(assert (=> b!1289426 (= lt!578097 (addStillNotContains!363 lt!578095 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85345 0))(
  ( (array!85346 (arr!41174 (Array (_ BitVec 32) (_ BitVec 64))) (size!41726 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85345)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6017 (array!85345 array!85343 (_ BitVec 32) (_ BitVec 32) V!50713 V!50713 (_ BitVec 32) Int) ListLongMap!19771)

(assert (=> b!1289426 (= lt!578095 (getCurrentListMapNoExtraKeys!6017 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289427 () Bool)

(declare-fun res!856528 () Bool)

(declare-fun e!736211 () Bool)

(assert (=> b!1289427 (=> (not res!856528) (not e!736211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289427 (= res!856528 (not (validKeyInArray!0 (select (arr!41174 _keys!1741) from!2144))))))

(declare-fun b!1289428 () Bool)

(declare-fun e!736214 () Bool)

(declare-fun tp_is_empty!34207 () Bool)

(assert (=> b!1289428 (= e!736214 tp_is_empty!34207)))

(declare-fun b!1289429 () Bool)

(declare-fun res!856535 () Bool)

(assert (=> b!1289429 (=> (not res!856535) (not e!736211))))

(assert (=> b!1289429 (= res!856535 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41726 _keys!1741))))))

(declare-fun b!1289430 () Bool)

(declare-fun res!856536 () Bool)

(assert (=> b!1289430 (=> (not res!856536) (not e!736211))))

(declare-fun getCurrentListMap!4852 (array!85345 array!85343 (_ BitVec 32) (_ BitVec 32) V!50713 V!50713 (_ BitVec 32) Int) ListLongMap!19771)

(assert (=> b!1289430 (= res!856536 (contains!7949 (getCurrentListMap!4852 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289431 () Bool)

(declare-fun res!856532 () Bool)

(assert (=> b!1289431 (=> (not res!856532) (not e!736211))))

(assert (=> b!1289431 (= res!856532 (and (= (size!41725 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41726 _keys!1741) (size!41725 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289432 () Bool)

(declare-fun res!856530 () Bool)

(assert (=> b!1289432 (=> (not res!856530) (not e!736211))))

(assert (=> b!1289432 (= res!856530 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41726 _keys!1741))))))

(declare-fun b!1289433 () Bool)

(assert (=> b!1289433 (= e!736213 tp_is_empty!34207)))

(declare-fun b!1289434 () Bool)

(assert (=> b!1289434 (= e!736211 (not e!736215))))

(declare-fun res!856531 () Bool)

(assert (=> b!1289434 (=> res!856531 e!736215)))

(assert (=> b!1289434 (= res!856531 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289434 (not (contains!7949 (ListLongMap!19772 Nil!29273) k0!1205))))

(declare-fun lt!578096 () Unit!42506)

(declare-fun emptyContainsNothing!54 ((_ BitVec 64)) Unit!42506)

(assert (=> b!1289434 (= lt!578096 (emptyContainsNothing!54 k0!1205))))

(declare-fun b!1289435 () Bool)

(declare-fun res!856534 () Bool)

(assert (=> b!1289435 (=> (not res!856534) (not e!736211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85345 (_ BitVec 32)) Bool)

(assert (=> b!1289435 (= res!856534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52871 () Bool)

(assert (=> mapIsEmpty!52871 mapRes!52871))

(declare-fun b!1289436 () Bool)

(declare-fun res!856529 () Bool)

(assert (=> b!1289436 (=> (not res!856529) (not e!736211))))

(declare-datatypes ((List!29277 0))(
  ( (Nil!29274) (Cons!29273 (h!30482 (_ BitVec 64)) (t!42833 List!29277)) )
))
(declare-fun arrayNoDuplicates!0 (array!85345 (_ BitVec 32) List!29277) Bool)

(assert (=> b!1289436 (= res!856529 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29274))))

(declare-fun mapNonEmpty!52871 () Bool)

(declare-fun tp!100821 () Bool)

(assert (=> mapNonEmpty!52871 (= mapRes!52871 (and tp!100821 e!736214))))

(declare-fun mapKey!52871 () (_ BitVec 32))

(declare-fun mapValue!52871 () ValueCell!16205)

(declare-fun mapRest!52871 () (Array (_ BitVec 32) ValueCell!16205))

(assert (=> mapNonEmpty!52871 (= (arr!41173 _values!1445) (store mapRest!52871 mapKey!52871 mapValue!52871))))

(declare-fun res!856533 () Bool)

(assert (=> start!109078 (=> (not res!856533) (not e!736211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109078 (= res!856533 (validMask!0 mask!2175))))

(assert (=> start!109078 e!736211))

(assert (=> start!109078 tp_is_empty!34207))

(assert (=> start!109078 true))

(declare-fun array_inv!31373 (array!85343) Bool)

(assert (=> start!109078 (and (array_inv!31373 _values!1445) e!736210)))

(declare-fun array_inv!31374 (array!85345) Bool)

(assert (=> start!109078 (array_inv!31374 _keys!1741)))

(assert (=> start!109078 tp!100820))

(assert (= (and start!109078 res!856533) b!1289431))

(assert (= (and b!1289431 res!856532) b!1289435))

(assert (= (and b!1289435 res!856534) b!1289436))

(assert (= (and b!1289436 res!856529) b!1289429))

(assert (= (and b!1289429 res!856535) b!1289430))

(assert (= (and b!1289430 res!856536) b!1289432))

(assert (= (and b!1289432 res!856530) b!1289427))

(assert (= (and b!1289427 res!856528) b!1289434))

(assert (= (and b!1289434 (not res!856531)) b!1289426))

(assert (= (and b!1289425 condMapEmpty!52871) mapIsEmpty!52871))

(assert (= (and b!1289425 (not condMapEmpty!52871)) mapNonEmpty!52871))

(get-info :version)

(assert (= (and mapNonEmpty!52871 ((_ is ValueCellFull!16205) mapValue!52871)) b!1289428))

(assert (= (and b!1289425 ((_ is ValueCellFull!16205) mapDefault!52871)) b!1289433))

(assert (= start!109078 b!1289425))

(declare-fun m!1181511 () Bool)

(assert (=> b!1289430 m!1181511))

(assert (=> b!1289430 m!1181511))

(declare-fun m!1181513 () Bool)

(assert (=> b!1289430 m!1181513))

(declare-fun m!1181515 () Bool)

(assert (=> b!1289435 m!1181515))

(declare-fun m!1181517 () Bool)

(assert (=> b!1289427 m!1181517))

(assert (=> b!1289427 m!1181517))

(declare-fun m!1181519 () Bool)

(assert (=> b!1289427 m!1181519))

(declare-fun m!1181521 () Bool)

(assert (=> b!1289434 m!1181521))

(declare-fun m!1181523 () Bool)

(assert (=> b!1289434 m!1181523))

(declare-fun m!1181525 () Bool)

(assert (=> start!109078 m!1181525))

(declare-fun m!1181527 () Bool)

(assert (=> start!109078 m!1181527))

(declare-fun m!1181529 () Bool)

(assert (=> start!109078 m!1181529))

(declare-fun m!1181531 () Bool)

(assert (=> b!1289436 m!1181531))

(declare-fun m!1181533 () Bool)

(assert (=> b!1289426 m!1181533))

(declare-fun m!1181535 () Bool)

(assert (=> b!1289426 m!1181535))

(declare-fun m!1181537 () Bool)

(assert (=> b!1289426 m!1181537))

(declare-fun m!1181539 () Bool)

(assert (=> b!1289426 m!1181539))

(assert (=> b!1289426 m!1181535))

(declare-fun m!1181541 () Bool)

(assert (=> b!1289426 m!1181541))

(assert (=> b!1289426 m!1181539))

(declare-fun m!1181543 () Bool)

(assert (=> b!1289426 m!1181543))

(declare-fun m!1181545 () Bool)

(assert (=> b!1289426 m!1181545))

(declare-fun m!1181547 () Bool)

(assert (=> mapNonEmpty!52871 m!1181547))

(check-sat (not b_next!28567) (not b!1289436) (not b!1289434) (not b!1289427) (not mapNonEmpty!52871) (not b!1289426) b_and!46639 (not b!1289435) tp_is_empty!34207 (not b!1289430) (not start!109078))
(check-sat b_and!46639 (not b_next!28567))
