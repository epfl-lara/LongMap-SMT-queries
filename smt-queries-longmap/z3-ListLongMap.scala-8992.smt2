; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108712 () Bool)

(assert start!108712)

(declare-fun b_free!28225 () Bool)

(declare-fun b_next!28225 () Bool)

(assert (=> start!108712 (= b_free!28225 (not b_next!28225))))

(declare-fun tp!99791 () Bool)

(declare-fun b_and!46273 () Bool)

(assert (=> start!108712 (= tp!99791 b_and!46273)))

(declare-fun b!1283424 () Bool)

(declare-fun res!852561 () Bool)

(declare-fun e!733220 () Bool)

(assert (=> b!1283424 (=> (not res!852561) (not e!733220))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84691 0))(
  ( (array!84692 (arr!40848 (Array (_ BitVec 32) (_ BitVec 64))) (size!41400 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84691)

(assert (=> b!1283424 (= res!852561 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41400 _keys!1741))))))

(declare-fun mapNonEmpty!52355 () Bool)

(declare-fun mapRes!52355 () Bool)

(declare-fun tp!99792 () Bool)

(declare-fun e!733221 () Bool)

(assert (=> mapNonEmpty!52355 (= mapRes!52355 (and tp!99792 e!733221))))

(declare-datatypes ((V!50257 0))(
  ( (V!50258 (val!17007 Int)) )
))
(declare-datatypes ((ValueCell!16034 0))(
  ( (ValueCellFull!16034 (v!19608 V!50257)) (EmptyCell!16034) )
))
(declare-fun mapRest!52355 () (Array (_ BitVec 32) ValueCell!16034))

(declare-fun mapKey!52355 () (_ BitVec 32))

(declare-datatypes ((array!84693 0))(
  ( (array!84694 (arr!40849 (Array (_ BitVec 32) ValueCell!16034)) (size!41401 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84693)

(declare-fun mapValue!52355 () ValueCell!16034)

(assert (=> mapNonEmpty!52355 (= (arr!40849 _values!1445) (store mapRest!52355 mapKey!52355 mapValue!52355))))

(declare-fun b!1283425 () Bool)

(declare-fun tp_is_empty!33865 () Bool)

(assert (=> b!1283425 (= e!733221 tp_is_empty!33865)))

(declare-fun b!1283426 () Bool)

(declare-fun res!852564 () Bool)

(assert (=> b!1283426 (=> (not res!852564) (not e!733220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283426 (= res!852564 (validKeyInArray!0 (select (arr!40848 _keys!1741) from!2144)))))

(declare-fun b!1283427 () Bool)

(declare-fun res!852562 () Bool)

(assert (=> b!1283427 (=> (not res!852562) (not e!733220))))

(declare-datatypes ((List!29036 0))(
  ( (Nil!29033) (Cons!29032 (h!30241 (_ BitVec 64)) (t!42572 List!29036)) )
))
(declare-fun arrayNoDuplicates!0 (array!84691 (_ BitVec 32) List!29036) Bool)

(assert (=> b!1283427 (= res!852562 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29033))))

(declare-fun res!852563 () Bool)

(assert (=> start!108712 (=> (not res!852563) (not e!733220))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108712 (= res!852563 (validMask!0 mask!2175))))

(assert (=> start!108712 e!733220))

(assert (=> start!108712 tp_is_empty!33865))

(assert (=> start!108712 true))

(declare-fun e!733218 () Bool)

(declare-fun array_inv!31143 (array!84693) Bool)

(assert (=> start!108712 (and (array_inv!31143 _values!1445) e!733218)))

(declare-fun array_inv!31144 (array!84691) Bool)

(assert (=> start!108712 (array_inv!31144 _keys!1741)))

(assert (=> start!108712 tp!99791))

(declare-fun b!1283428 () Bool)

(declare-fun res!852557 () Bool)

(assert (=> b!1283428 (=> (not res!852557) (not e!733220))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1283428 (= res!852557 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41400 _keys!1741))))))

(declare-fun b!1283429 () Bool)

(declare-fun e!733217 () Bool)

(assert (=> b!1283429 (= e!733218 (and e!733217 mapRes!52355))))

(declare-fun condMapEmpty!52355 () Bool)

(declare-fun mapDefault!52355 () ValueCell!16034)

(assert (=> b!1283429 (= condMapEmpty!52355 (= (arr!40849 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16034)) mapDefault!52355)))))

(declare-fun b!1283430 () Bool)

(declare-fun res!852560 () Bool)

(assert (=> b!1283430 (=> (not res!852560) (not e!733220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84691 (_ BitVec 32)) Bool)

(assert (=> b!1283430 (= res!852560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52355 () Bool)

(assert (=> mapIsEmpty!52355 mapRes!52355))

(declare-fun b!1283431 () Bool)

(declare-fun res!852556 () Bool)

(assert (=> b!1283431 (=> (not res!852556) (not e!733220))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283431 (= res!852556 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283432 () Bool)

(assert (=> b!1283432 (= e!733217 tp_is_empty!33865)))

(declare-fun b!1283433 () Bool)

(declare-fun res!852559 () Bool)

(assert (=> b!1283433 (=> (not res!852559) (not e!733220))))

(assert (=> b!1283433 (= res!852559 (and (= (size!41401 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41400 _keys!1741) (size!41401 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283434 () Bool)

(declare-fun res!852558 () Bool)

(assert (=> b!1283434 (=> (not res!852558) (not e!733220))))

(declare-fun minValue!1387 () V!50257)

(declare-fun zeroValue!1387 () V!50257)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21850 0))(
  ( (tuple2!21851 (_1!10936 (_ BitVec 64)) (_2!10936 V!50257)) )
))
(declare-datatypes ((List!29037 0))(
  ( (Nil!29034) (Cons!29033 (h!30242 tuple2!21850) (t!42573 List!29037)) )
))
(declare-datatypes ((ListLongMap!19507 0))(
  ( (ListLongMap!19508 (toList!9769 List!29037)) )
))
(declare-fun contains!7816 (ListLongMap!19507 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4742 (array!84691 array!84693 (_ BitVec 32) (_ BitVec 32) V!50257 V!50257 (_ BitVec 32) Int) ListLongMap!19507)

(assert (=> b!1283434 (= res!852558 (contains!7816 (getCurrentListMap!4742 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283435 () Bool)

(assert (=> b!1283435 (= e!733220 (not true))))

(declare-fun lt!576485 () ListLongMap!19507)

(assert (=> b!1283435 (contains!7816 lt!576485 k0!1205)))

(declare-datatypes ((Unit!42323 0))(
  ( (Unit!42324) )
))
(declare-fun lt!576486 () Unit!42323)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!12 ((_ BitVec 64) (_ BitVec 64) V!50257 ListLongMap!19507) Unit!42323)

(assert (=> b!1283435 (= lt!576486 (lemmaInListMapAfterAddingDiffThenInBefore!12 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576485))))

(declare-fun +!4327 (ListLongMap!19507 tuple2!21850) ListLongMap!19507)

(declare-fun getCurrentListMapNoExtraKeys!5958 (array!84691 array!84693 (_ BitVec 32) (_ BitVec 32) V!50257 V!50257 (_ BitVec 32) Int) ListLongMap!19507)

(assert (=> b!1283435 (= lt!576485 (+!4327 (getCurrentListMapNoExtraKeys!5958 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and start!108712 res!852563) b!1283433))

(assert (= (and b!1283433 res!852559) b!1283430))

(assert (= (and b!1283430 res!852560) b!1283427))

(assert (= (and b!1283427 res!852562) b!1283424))

(assert (= (and b!1283424 res!852561) b!1283434))

(assert (= (and b!1283434 res!852558) b!1283428))

(assert (= (and b!1283428 res!852557) b!1283426))

(assert (= (and b!1283426 res!852564) b!1283431))

(assert (= (and b!1283431 res!852556) b!1283435))

(assert (= (and b!1283429 condMapEmpty!52355) mapIsEmpty!52355))

(assert (= (and b!1283429 (not condMapEmpty!52355)) mapNonEmpty!52355))

(get-info :version)

(assert (= (and mapNonEmpty!52355 ((_ is ValueCellFull!16034) mapValue!52355)) b!1283425))

(assert (= (and b!1283429 ((_ is ValueCellFull!16034) mapDefault!52355)) b!1283432))

(assert (= start!108712 b!1283429))

(declare-fun m!1176901 () Bool)

(assert (=> b!1283426 m!1176901))

(assert (=> b!1283426 m!1176901))

(declare-fun m!1176903 () Bool)

(assert (=> b!1283426 m!1176903))

(declare-fun m!1176905 () Bool)

(assert (=> b!1283427 m!1176905))

(declare-fun m!1176907 () Bool)

(assert (=> start!108712 m!1176907))

(declare-fun m!1176909 () Bool)

(assert (=> start!108712 m!1176909))

(declare-fun m!1176911 () Bool)

(assert (=> start!108712 m!1176911))

(declare-fun m!1176913 () Bool)

(assert (=> b!1283434 m!1176913))

(assert (=> b!1283434 m!1176913))

(declare-fun m!1176915 () Bool)

(assert (=> b!1283434 m!1176915))

(declare-fun m!1176917 () Bool)

(assert (=> mapNonEmpty!52355 m!1176917))

(declare-fun m!1176919 () Bool)

(assert (=> b!1283430 m!1176919))

(declare-fun m!1176921 () Bool)

(assert (=> b!1283435 m!1176921))

(declare-fun m!1176923 () Bool)

(assert (=> b!1283435 m!1176923))

(declare-fun m!1176925 () Bool)

(assert (=> b!1283435 m!1176925))

(assert (=> b!1283435 m!1176925))

(declare-fun m!1176927 () Bool)

(assert (=> b!1283435 m!1176927))

(check-sat (not b!1283434) (not b!1283435) (not b!1283430) (not b!1283426) b_and!46273 (not start!108712) (not b!1283427) (not mapNonEmpty!52355) (not b_next!28225) tp_is_empty!33865)
(check-sat b_and!46273 (not b_next!28225))
