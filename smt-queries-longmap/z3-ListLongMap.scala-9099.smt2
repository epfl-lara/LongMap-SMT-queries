; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109378 () Bool)

(assert start!109378)

(declare-fun b_free!28867 () Bool)

(declare-fun b_next!28867 () Bool)

(assert (=> start!109378 (= b_free!28867 (not b_next!28867))))

(declare-fun tp!101720 () Bool)

(declare-fun b_and!46939 () Bool)

(assert (=> start!109378 (= tp!101720 b_and!46939)))

(declare-fun b!1294670 () Bool)

(declare-fun res!860428 () Bool)

(declare-fun e!738759 () Bool)

(assert (=> b!1294670 (=> (not res!860428) (not e!738759))))

(declare-datatypes ((array!85927 0))(
  ( (array!85928 (arr!41465 (Array (_ BitVec 32) (_ BitVec 64))) (size!42017 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85927)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294670 (= res!860428 (not (validKeyInArray!0 (select (arr!41465 _keys!1741) from!2144))))))

(declare-fun b!1294671 () Bool)

(declare-fun e!738758 () Bool)

(declare-fun e!738757 () Bool)

(declare-fun mapRes!53321 () Bool)

(assert (=> b!1294671 (= e!738758 (and e!738757 mapRes!53321))))

(declare-fun condMapEmpty!53321 () Bool)

(declare-datatypes ((V!51113 0))(
  ( (V!51114 (val!17328 Int)) )
))
(declare-datatypes ((ValueCell!16355 0))(
  ( (ValueCellFull!16355 (v!19930 V!51113)) (EmptyCell!16355) )
))
(declare-datatypes ((array!85929 0))(
  ( (array!85930 (arr!41466 (Array (_ BitVec 32) ValueCell!16355)) (size!42018 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85929)

(declare-fun mapDefault!53321 () ValueCell!16355)

(assert (=> b!1294671 (= condMapEmpty!53321 (= (arr!41466 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16355)) mapDefault!53321)))))

(declare-fun b!1294672 () Bool)

(declare-fun res!860427 () Bool)

(assert (=> b!1294672 (=> (not res!860427) (not e!738759))))

(declare-datatypes ((List!29495 0))(
  ( (Nil!29492) (Cons!29491 (h!30700 (_ BitVec 64)) (t!43051 List!29495)) )
))
(declare-fun arrayNoDuplicates!0 (array!85927 (_ BitVec 32) List!29495) Bool)

(assert (=> b!1294672 (= res!860427 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29492))))

(declare-fun b!1294673 () Bool)

(declare-fun res!860423 () Bool)

(assert (=> b!1294673 (=> (not res!860423) (not e!738759))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1294673 (= res!860423 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42017 _keys!1741))))))

(declare-fun b!1294674 () Bool)

(declare-fun res!860429 () Bool)

(assert (=> b!1294674 (=> (not res!860429) (not e!738759))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85927 (_ BitVec 32)) Bool)

(assert (=> b!1294674 (= res!860429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294675 () Bool)

(declare-fun res!860430 () Bool)

(assert (=> b!1294675 (=> (not res!860430) (not e!738759))))

(assert (=> b!1294675 (= res!860430 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42017 _keys!1741))))))

(declare-fun b!1294676 () Bool)

(declare-fun res!860426 () Bool)

(assert (=> b!1294676 (=> (not res!860426) (not e!738759))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1294676 (= res!860426 (and (= (size!42018 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42017 _keys!1741) (size!42018 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294677 () Bool)

(assert (=> b!1294677 (= e!738759 (not (or (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle from!2144 (size!42017 _keys!1741)))))))

(declare-datatypes ((tuple2!22356 0))(
  ( (tuple2!22357 (_1!11189 (_ BitVec 64)) (_2!11189 V!51113)) )
))
(declare-datatypes ((List!29496 0))(
  ( (Nil!29493) (Cons!29492 (h!30701 tuple2!22356) (t!43052 List!29496)) )
))
(declare-datatypes ((ListLongMap!20013 0))(
  ( (ListLongMap!20014 (toList!10022 List!29496)) )
))
(declare-fun contains!8070 (ListLongMap!20013 (_ BitVec 64)) Bool)

(assert (=> b!1294677 (not (contains!8070 (ListLongMap!20014 Nil!29493) k0!1205))))

(declare-datatypes ((Unit!42716 0))(
  ( (Unit!42717) )
))
(declare-fun lt!579565 () Unit!42716)

(declare-fun emptyContainsNothing!151 ((_ BitVec 64)) Unit!42716)

(assert (=> b!1294677 (= lt!579565 (emptyContainsNothing!151 k0!1205))))

(declare-fun mapNonEmpty!53321 () Bool)

(declare-fun tp!101721 () Bool)

(declare-fun e!738755 () Bool)

(assert (=> mapNonEmpty!53321 (= mapRes!53321 (and tp!101721 e!738755))))

(declare-fun mapValue!53321 () ValueCell!16355)

(declare-fun mapKey!53321 () (_ BitVec 32))

(declare-fun mapRest!53321 () (Array (_ BitVec 32) ValueCell!16355))

(assert (=> mapNonEmpty!53321 (= (arr!41466 _values!1445) (store mapRest!53321 mapKey!53321 mapValue!53321))))

(declare-fun b!1294678 () Bool)

(declare-fun tp_is_empty!34507 () Bool)

(assert (=> b!1294678 (= e!738757 tp_is_empty!34507)))

(declare-fun mapIsEmpty!53321 () Bool)

(assert (=> mapIsEmpty!53321 mapRes!53321))

(declare-fun b!1294680 () Bool)

(declare-fun res!860424 () Bool)

(assert (=> b!1294680 (=> (not res!860424) (not e!738759))))

(declare-fun minValue!1387 () V!51113)

(declare-fun zeroValue!1387 () V!51113)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4951 (array!85927 array!85929 (_ BitVec 32) (_ BitVec 32) V!51113 V!51113 (_ BitVec 32) Int) ListLongMap!20013)

(assert (=> b!1294680 (= res!860424 (contains!8070 (getCurrentListMap!4951 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!860425 () Bool)

(assert (=> start!109378 (=> (not res!860425) (not e!738759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109378 (= res!860425 (validMask!0 mask!2175))))

(assert (=> start!109378 e!738759))

(assert (=> start!109378 tp_is_empty!34507))

(assert (=> start!109378 true))

(declare-fun array_inv!31563 (array!85929) Bool)

(assert (=> start!109378 (and (array_inv!31563 _values!1445) e!738758)))

(declare-fun array_inv!31564 (array!85927) Bool)

(assert (=> start!109378 (array_inv!31564 _keys!1741)))

(assert (=> start!109378 tp!101720))

(declare-fun b!1294679 () Bool)

(assert (=> b!1294679 (= e!738755 tp_is_empty!34507)))

(assert (= (and start!109378 res!860425) b!1294676))

(assert (= (and b!1294676 res!860426) b!1294674))

(assert (= (and b!1294674 res!860429) b!1294672))

(assert (= (and b!1294672 res!860427) b!1294675))

(assert (= (and b!1294675 res!860430) b!1294680))

(assert (= (and b!1294680 res!860424) b!1294673))

(assert (= (and b!1294673 res!860423) b!1294670))

(assert (= (and b!1294670 res!860428) b!1294677))

(assert (= (and b!1294671 condMapEmpty!53321) mapIsEmpty!53321))

(assert (= (and b!1294671 (not condMapEmpty!53321)) mapNonEmpty!53321))

(get-info :version)

(assert (= (and mapNonEmpty!53321 ((_ is ValueCellFull!16355) mapValue!53321)) b!1294679))

(assert (= (and b!1294671 ((_ is ValueCellFull!16355) mapDefault!53321)) b!1294678))

(assert (= start!109378 b!1294671))

(declare-fun m!1186359 () Bool)

(assert (=> b!1294680 m!1186359))

(assert (=> b!1294680 m!1186359))

(declare-fun m!1186361 () Bool)

(assert (=> b!1294680 m!1186361))

(declare-fun m!1186363 () Bool)

(assert (=> mapNonEmpty!53321 m!1186363))

(declare-fun m!1186365 () Bool)

(assert (=> start!109378 m!1186365))

(declare-fun m!1186367 () Bool)

(assert (=> start!109378 m!1186367))

(declare-fun m!1186369 () Bool)

(assert (=> start!109378 m!1186369))

(declare-fun m!1186371 () Bool)

(assert (=> b!1294670 m!1186371))

(assert (=> b!1294670 m!1186371))

(declare-fun m!1186373 () Bool)

(assert (=> b!1294670 m!1186373))

(declare-fun m!1186375 () Bool)

(assert (=> b!1294672 m!1186375))

(declare-fun m!1186377 () Bool)

(assert (=> b!1294677 m!1186377))

(declare-fun m!1186379 () Bool)

(assert (=> b!1294677 m!1186379))

(declare-fun m!1186381 () Bool)

(assert (=> b!1294674 m!1186381))

(check-sat (not b!1294670) b_and!46939 (not start!109378) (not b!1294680) (not b!1294677) (not b!1294674) (not mapNonEmpty!53321) tp_is_empty!34507 (not b_next!28867) (not b!1294672))
(check-sat b_and!46939 (not b_next!28867))
