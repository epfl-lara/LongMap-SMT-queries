; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109398 () Bool)

(assert start!109398)

(declare-fun b_free!28663 () Bool)

(declare-fun b_next!28663 () Bool)

(assert (=> start!109398 (= b_free!28663 (not b_next!28663))))

(declare-fun tp!101107 () Bool)

(declare-fun b_and!46755 () Bool)

(assert (=> start!109398 (= tp!101107 b_and!46755)))

(declare-fun b!1292522 () Bool)

(declare-fun res!858378 () Bool)

(declare-fun e!737951 () Bool)

(assert (=> b!1292522 (=> (not res!858378) (not e!737951))))

(declare-datatypes ((array!85677 0))(
  ( (array!85678 (arr!41335 (Array (_ BitVec 32) (_ BitVec 64))) (size!41886 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85677)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292522 (= res!858378 (not (validKeyInArray!0 (select (arr!41335 _keys!1741) from!2144))))))

(declare-fun b!1292523 () Bool)

(declare-fun e!737950 () Bool)

(assert (=> b!1292523 (= e!737950 true)))

(assert (=> b!1292523 false))

(declare-datatypes ((V!50841 0))(
  ( (V!50842 (val!17226 Int)) )
))
(declare-datatypes ((tuple2!22160 0))(
  ( (tuple2!22161 (_1!11091 (_ BitVec 64)) (_2!11091 V!50841)) )
))
(declare-datatypes ((List!29333 0))(
  ( (Nil!29330) (Cons!29329 (h!30547 tuple2!22160) (t!42889 List!29333)) )
))
(declare-datatypes ((ListLongMap!19825 0))(
  ( (ListLongMap!19826 (toList!9928 List!29333)) )
))
(declare-fun lt!579500 () ListLongMap!19825)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((Unit!42703 0))(
  ( (Unit!42704) )
))
(declare-fun lt!579501 () Unit!42703)

(declare-fun minValue!1387 () V!50841)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!55 ((_ BitVec 64) (_ BitVec 64) V!50841 ListLongMap!19825) Unit!42703)

(assert (=> b!1292523 (= lt!579501 (lemmaInListMapAfterAddingDiffThenInBefore!55 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579500))))

(declare-fun lt!579499 () ListLongMap!19825)

(declare-fun contains!8059 (ListLongMap!19825 (_ BitVec 64)) Bool)

(declare-fun +!4426 (ListLongMap!19825 tuple2!22160) ListLongMap!19825)

(assert (=> b!1292523 (not (contains!8059 (+!4426 lt!579499 (tuple2!22161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579504 () Unit!42703)

(declare-fun addStillNotContains!402 (ListLongMap!19825 (_ BitVec 64) V!50841 (_ BitVec 64)) Unit!42703)

(assert (=> b!1292523 (= lt!579504 (addStillNotContains!402 lt!579499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1292523 (not (contains!8059 lt!579500 k0!1205))))

(declare-fun zeroValue!1387 () V!50841)

(assert (=> b!1292523 (= lt!579500 (+!4426 lt!579499 (tuple2!22161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579503 () Unit!42703)

(assert (=> b!1292523 (= lt!579503 (addStillNotContains!402 lt!579499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-datatypes ((ValueCell!16253 0))(
  ( (ValueCellFull!16253 (v!19824 V!50841)) (EmptyCell!16253) )
))
(declare-datatypes ((array!85679 0))(
  ( (array!85680 (arr!41336 (Array (_ BitVec 32) ValueCell!16253)) (size!41887 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85679)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6064 (array!85677 array!85679 (_ BitVec 32) (_ BitVec 32) V!50841 V!50841 (_ BitVec 32) Int) ListLongMap!19825)

(assert (=> b!1292523 (= lt!579499 (getCurrentListMapNoExtraKeys!6064 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1292524 () Bool)

(declare-fun res!858372 () Bool)

(assert (=> b!1292524 (=> (not res!858372) (not e!737951))))

(declare-datatypes ((List!29334 0))(
  ( (Nil!29331) (Cons!29330 (h!30548 (_ BitVec 64)) (t!42890 List!29334)) )
))
(declare-fun arrayNoDuplicates!0 (array!85677 (_ BitVec 32) List!29334) Bool)

(assert (=> b!1292524 (= res!858372 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29331))))

(declare-fun b!1292525 () Bool)

(assert (=> b!1292525 (= e!737951 (not e!737950))))

(declare-fun res!858373 () Bool)

(assert (=> b!1292525 (=> res!858373 e!737950)))

(assert (=> b!1292525 (= res!858373 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1292525 (not (contains!8059 (ListLongMap!19826 Nil!29330) k0!1205))))

(declare-fun lt!579502 () Unit!42703)

(declare-fun emptyContainsNothing!99 ((_ BitVec 64)) Unit!42703)

(assert (=> b!1292525 (= lt!579502 (emptyContainsNothing!99 k0!1205))))

(declare-fun res!858379 () Bool)

(assert (=> start!109398 (=> (not res!858379) (not e!737951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109398 (= res!858379 (validMask!0 mask!2175))))

(assert (=> start!109398 e!737951))

(declare-fun tp_is_empty!34303 () Bool)

(assert (=> start!109398 tp_is_empty!34303))

(assert (=> start!109398 true))

(declare-fun e!737953 () Bool)

(declare-fun array_inv!31553 (array!85679) Bool)

(assert (=> start!109398 (and (array_inv!31553 _values!1445) e!737953)))

(declare-fun array_inv!31554 (array!85677) Bool)

(assert (=> start!109398 (array_inv!31554 _keys!1741)))

(assert (=> start!109398 tp!101107))

(declare-fun b!1292526 () Bool)

(declare-fun res!858374 () Bool)

(assert (=> b!1292526 (=> (not res!858374) (not e!737951))))

(declare-fun getCurrentListMap!4964 (array!85677 array!85679 (_ BitVec 32) (_ BitVec 32) V!50841 V!50841 (_ BitVec 32) Int) ListLongMap!19825)

(assert (=> b!1292526 (= res!858374 (contains!8059 (getCurrentListMap!4964 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292527 () Bool)

(declare-fun res!858377 () Bool)

(assert (=> b!1292527 (=> (not res!858377) (not e!737951))))

(assert (=> b!1292527 (= res!858377 (and (= (size!41887 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41886 _keys!1741) (size!41887 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292528 () Bool)

(declare-fun e!737954 () Bool)

(declare-fun mapRes!53015 () Bool)

(assert (=> b!1292528 (= e!737953 (and e!737954 mapRes!53015))))

(declare-fun condMapEmpty!53015 () Bool)

(declare-fun mapDefault!53015 () ValueCell!16253)

(assert (=> b!1292528 (= condMapEmpty!53015 (= (arr!41336 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16253)) mapDefault!53015)))))

(declare-fun b!1292529 () Bool)

(declare-fun res!858375 () Bool)

(assert (=> b!1292529 (=> (not res!858375) (not e!737951))))

(assert (=> b!1292529 (= res!858375 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41886 _keys!1741))))))

(declare-fun b!1292530 () Bool)

(declare-fun e!737952 () Bool)

(assert (=> b!1292530 (= e!737952 tp_is_empty!34303)))

(declare-fun mapNonEmpty!53015 () Bool)

(declare-fun tp!101108 () Bool)

(assert (=> mapNonEmpty!53015 (= mapRes!53015 (and tp!101108 e!737952))))

(declare-fun mapKey!53015 () (_ BitVec 32))

(declare-fun mapValue!53015 () ValueCell!16253)

(declare-fun mapRest!53015 () (Array (_ BitVec 32) ValueCell!16253))

(assert (=> mapNonEmpty!53015 (= (arr!41336 _values!1445) (store mapRest!53015 mapKey!53015 mapValue!53015))))

(declare-fun b!1292531 () Bool)

(declare-fun res!858376 () Bool)

(assert (=> b!1292531 (=> (not res!858376) (not e!737951))))

(assert (=> b!1292531 (= res!858376 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41886 _keys!1741))))))

(declare-fun b!1292532 () Bool)

(assert (=> b!1292532 (= e!737954 tp_is_empty!34303)))

(declare-fun b!1292533 () Bool)

(declare-fun res!858371 () Bool)

(assert (=> b!1292533 (=> (not res!858371) (not e!737951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85677 (_ BitVec 32)) Bool)

(assert (=> b!1292533 (= res!858371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53015 () Bool)

(assert (=> mapIsEmpty!53015 mapRes!53015))

(assert (= (and start!109398 res!858379) b!1292527))

(assert (= (and b!1292527 res!858377) b!1292533))

(assert (= (and b!1292533 res!858371) b!1292524))

(assert (= (and b!1292524 res!858372) b!1292529))

(assert (= (and b!1292529 res!858375) b!1292526))

(assert (= (and b!1292526 res!858374) b!1292531))

(assert (= (and b!1292531 res!858376) b!1292522))

(assert (= (and b!1292522 res!858378) b!1292525))

(assert (= (and b!1292525 (not res!858373)) b!1292523))

(assert (= (and b!1292528 condMapEmpty!53015) mapIsEmpty!53015))

(assert (= (and b!1292528 (not condMapEmpty!53015)) mapNonEmpty!53015))

(get-info :version)

(assert (= (and mapNonEmpty!53015 ((_ is ValueCellFull!16253) mapValue!53015)) b!1292530))

(assert (= (and b!1292528 ((_ is ValueCellFull!16253) mapDefault!53015)) b!1292532))

(assert (= start!109398 b!1292528))

(declare-fun m!1185513 () Bool)

(assert (=> b!1292533 m!1185513))

(declare-fun m!1185515 () Bool)

(assert (=> b!1292525 m!1185515))

(declare-fun m!1185517 () Bool)

(assert (=> b!1292525 m!1185517))

(declare-fun m!1185519 () Bool)

(assert (=> b!1292524 m!1185519))

(declare-fun m!1185521 () Bool)

(assert (=> mapNonEmpty!53015 m!1185521))

(declare-fun m!1185523 () Bool)

(assert (=> b!1292522 m!1185523))

(assert (=> b!1292522 m!1185523))

(declare-fun m!1185525 () Bool)

(assert (=> b!1292522 m!1185525))

(declare-fun m!1185527 () Bool)

(assert (=> b!1292523 m!1185527))

(declare-fun m!1185529 () Bool)

(assert (=> b!1292523 m!1185529))

(declare-fun m!1185531 () Bool)

(assert (=> b!1292523 m!1185531))

(declare-fun m!1185533 () Bool)

(assert (=> b!1292523 m!1185533))

(declare-fun m!1185535 () Bool)

(assert (=> b!1292523 m!1185535))

(declare-fun m!1185537 () Bool)

(assert (=> b!1292523 m!1185537))

(declare-fun m!1185539 () Bool)

(assert (=> b!1292523 m!1185539))

(assert (=> b!1292523 m!1185527))

(declare-fun m!1185541 () Bool)

(assert (=> b!1292523 m!1185541))

(declare-fun m!1185543 () Bool)

(assert (=> start!109398 m!1185543))

(declare-fun m!1185545 () Bool)

(assert (=> start!109398 m!1185545))

(declare-fun m!1185547 () Bool)

(assert (=> start!109398 m!1185547))

(declare-fun m!1185549 () Bool)

(assert (=> b!1292526 m!1185549))

(assert (=> b!1292526 m!1185549))

(declare-fun m!1185551 () Bool)

(assert (=> b!1292526 m!1185551))

(check-sat (not b!1292524) (not b!1292523) (not b_next!28663) (not b!1292533) tp_is_empty!34303 (not b!1292522) b_and!46755 (not b!1292525) (not start!109398) (not mapNonEmpty!53015) (not b!1292526))
(check-sat b_and!46755 (not b_next!28663))
