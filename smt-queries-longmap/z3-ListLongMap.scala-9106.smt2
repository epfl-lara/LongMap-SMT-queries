; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109422 () Bool)

(assert start!109422)

(declare-fun b_free!28911 () Bool)

(declare-fun b_next!28911 () Bool)

(assert (=> start!109422 (= b_free!28911 (not b_next!28911))))

(declare-fun tp!101852 () Bool)

(declare-fun b_and!47001 () Bool)

(assert (=> start!109422 (= tp!101852 b_and!47001)))

(declare-fun b!1295519 () Bool)

(declare-fun e!739176 () Bool)

(declare-fun e!739174 () Bool)

(assert (=> b!1295519 (= e!739176 (not e!739174))))

(declare-fun res!861043 () Bool)

(assert (=> b!1295519 (=> res!861043 e!739174)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295519 (= res!861043 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51171 0))(
  ( (V!51172 (val!17350 Int)) )
))
(declare-datatypes ((tuple2!22344 0))(
  ( (tuple2!22345 (_1!11183 (_ BitVec 64)) (_2!11183 V!51171)) )
))
(declare-datatypes ((List!29484 0))(
  ( (Nil!29481) (Cons!29480 (h!30689 tuple2!22344) (t!43048 List!29484)) )
))
(declare-datatypes ((ListLongMap!20001 0))(
  ( (ListLongMap!20002 (toList!10016 List!29484)) )
))
(declare-fun contains!8134 (ListLongMap!20001 (_ BitVec 64)) Bool)

(assert (=> b!1295519 (not (contains!8134 (ListLongMap!20002 Nil!29481) k0!1205))))

(declare-datatypes ((Unit!42910 0))(
  ( (Unit!42911) )
))
(declare-fun lt!579920 () Unit!42910)

(declare-fun emptyContainsNothing!174 ((_ BitVec 64)) Unit!42910)

(assert (=> b!1295519 (= lt!579920 (emptyContainsNothing!174 k0!1205))))

(declare-fun res!861042 () Bool)

(assert (=> start!109422 (=> (not res!861042) (not e!739176))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109422 (= res!861042 (validMask!0 mask!2175))))

(assert (=> start!109422 e!739176))

(declare-fun tp_is_empty!34551 () Bool)

(assert (=> start!109422 tp_is_empty!34551))

(assert (=> start!109422 true))

(declare-datatypes ((ValueCell!16377 0))(
  ( (ValueCellFull!16377 (v!19953 V!51171)) (EmptyCell!16377) )
))
(declare-datatypes ((array!86122 0))(
  ( (array!86123 (arr!41562 (Array (_ BitVec 32) ValueCell!16377)) (size!42112 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86122)

(declare-fun e!739173 () Bool)

(declare-fun array_inv!31467 (array!86122) Bool)

(assert (=> start!109422 (and (array_inv!31467 _values!1445) e!739173)))

(declare-datatypes ((array!86124 0))(
  ( (array!86125 (arr!41563 (Array (_ BitVec 32) (_ BitVec 64))) (size!42113 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86124)

(declare-fun array_inv!31468 (array!86124) Bool)

(assert (=> start!109422 (array_inv!31468 _keys!1741)))

(assert (=> start!109422 tp!101852))

(declare-fun b!1295520 () Bool)

(declare-fun res!861045 () Bool)

(assert (=> b!1295520 (=> (not res!861045) (not e!739176))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1295520 (= res!861045 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42113 _keys!1741))))))

(declare-fun b!1295521 () Bool)

(declare-fun res!861039 () Bool)

(assert (=> b!1295521 (=> (not res!861039) (not e!739176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86124 (_ BitVec 32)) Bool)

(assert (=> b!1295521 (= res!861039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295522 () Bool)

(declare-fun res!861041 () Bool)

(assert (=> b!1295522 (=> (not res!861041) (not e!739176))))

(declare-fun minValue!1387 () V!51171)

(declare-fun zeroValue!1387 () V!51171)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5050 (array!86124 array!86122 (_ BitVec 32) (_ BitVec 32) V!51171 V!51171 (_ BitVec 32) Int) ListLongMap!20001)

(assert (=> b!1295522 (= res!861041 (contains!8134 (getCurrentListMap!5050 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295523 () Bool)

(declare-fun res!861044 () Bool)

(assert (=> b!1295523 (=> (not res!861044) (not e!739176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295523 (= res!861044 (not (validKeyInArray!0 (select (arr!41563 _keys!1741) from!2144))))))

(declare-fun b!1295524 () Bool)

(declare-fun res!861038 () Bool)

(assert (=> b!1295524 (=> (not res!861038) (not e!739176))))

(declare-datatypes ((List!29485 0))(
  ( (Nil!29482) (Cons!29481 (h!30690 (_ BitVec 64)) (t!43049 List!29485)) )
))
(declare-fun arrayNoDuplicates!0 (array!86124 (_ BitVec 32) List!29485) Bool)

(assert (=> b!1295524 (= res!861038 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29482))))

(declare-fun b!1295525 () Bool)

(declare-fun e!739175 () Bool)

(assert (=> b!1295525 (= e!739175 tp_is_empty!34551)))

(declare-fun mapNonEmpty!53387 () Bool)

(declare-fun mapRes!53387 () Bool)

(declare-fun tp!101851 () Bool)

(declare-fun e!739177 () Bool)

(assert (=> mapNonEmpty!53387 (= mapRes!53387 (and tp!101851 e!739177))))

(declare-fun mapKey!53387 () (_ BitVec 32))

(declare-fun mapValue!53387 () ValueCell!16377)

(declare-fun mapRest!53387 () (Array (_ BitVec 32) ValueCell!16377))

(assert (=> mapNonEmpty!53387 (= (arr!41562 _values!1445) (store mapRest!53387 mapKey!53387 mapValue!53387))))

(declare-fun b!1295526 () Bool)

(declare-fun res!861037 () Bool)

(assert (=> b!1295526 (=> (not res!861037) (not e!739176))))

(assert (=> b!1295526 (= res!861037 (and (= (size!42112 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42113 _keys!1741) (size!42112 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53387 () Bool)

(assert (=> mapIsEmpty!53387 mapRes!53387))

(declare-fun b!1295527 () Bool)

(assert (=> b!1295527 (= e!739174 true)))

(declare-fun lt!579918 () ListLongMap!20001)

(declare-fun +!4421 (ListLongMap!20001 tuple2!22344) ListLongMap!20001)

(assert (=> b!1295527 (not (contains!8134 (+!4421 lt!579918 (tuple2!22345 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579919 () Unit!42910)

(declare-fun addStillNotContains!439 (ListLongMap!20001 (_ BitVec 64) V!51171 (_ BitVec 64)) Unit!42910)

(assert (=> b!1295527 (= lt!579919 (addStillNotContains!439 lt!579918 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6054 (array!86124 array!86122 (_ BitVec 32) (_ BitVec 32) V!51171 V!51171 (_ BitVec 32) Int) ListLongMap!20001)

(assert (=> b!1295527 (= lt!579918 (getCurrentListMapNoExtraKeys!6054 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295528 () Bool)

(declare-fun res!861040 () Bool)

(assert (=> b!1295528 (=> (not res!861040) (not e!739176))))

(assert (=> b!1295528 (= res!861040 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42113 _keys!1741))))))

(declare-fun b!1295529 () Bool)

(assert (=> b!1295529 (= e!739177 tp_is_empty!34551)))

(declare-fun b!1295530 () Bool)

(assert (=> b!1295530 (= e!739173 (and e!739175 mapRes!53387))))

(declare-fun condMapEmpty!53387 () Bool)

(declare-fun mapDefault!53387 () ValueCell!16377)

(assert (=> b!1295530 (= condMapEmpty!53387 (= (arr!41562 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16377)) mapDefault!53387)))))

(assert (= (and start!109422 res!861042) b!1295526))

(assert (= (and b!1295526 res!861037) b!1295521))

(assert (= (and b!1295521 res!861039) b!1295524))

(assert (= (and b!1295524 res!861038) b!1295520))

(assert (= (and b!1295520 res!861045) b!1295522))

(assert (= (and b!1295522 res!861041) b!1295528))

(assert (= (and b!1295528 res!861040) b!1295523))

(assert (= (and b!1295523 res!861044) b!1295519))

(assert (= (and b!1295519 (not res!861043)) b!1295527))

(assert (= (and b!1295530 condMapEmpty!53387) mapIsEmpty!53387))

(assert (= (and b!1295530 (not condMapEmpty!53387)) mapNonEmpty!53387))

(get-info :version)

(assert (= (and mapNonEmpty!53387 ((_ is ValueCellFull!16377) mapValue!53387)) b!1295529))

(assert (= (and b!1295530 ((_ is ValueCellFull!16377) mapDefault!53387)) b!1295525))

(assert (= start!109422 b!1295530))

(declare-fun m!1187527 () Bool)

(assert (=> b!1295523 m!1187527))

(assert (=> b!1295523 m!1187527))

(declare-fun m!1187529 () Bool)

(assert (=> b!1295523 m!1187529))

(declare-fun m!1187531 () Bool)

(assert (=> b!1295522 m!1187531))

(assert (=> b!1295522 m!1187531))

(declare-fun m!1187533 () Bool)

(assert (=> b!1295522 m!1187533))

(declare-fun m!1187535 () Bool)

(assert (=> start!109422 m!1187535))

(declare-fun m!1187537 () Bool)

(assert (=> start!109422 m!1187537))

(declare-fun m!1187539 () Bool)

(assert (=> start!109422 m!1187539))

(declare-fun m!1187541 () Bool)

(assert (=> b!1295524 m!1187541))

(declare-fun m!1187543 () Bool)

(assert (=> b!1295519 m!1187543))

(declare-fun m!1187545 () Bool)

(assert (=> b!1295519 m!1187545))

(declare-fun m!1187547 () Bool)

(assert (=> b!1295521 m!1187547))

(declare-fun m!1187549 () Bool)

(assert (=> b!1295527 m!1187549))

(assert (=> b!1295527 m!1187549))

(declare-fun m!1187551 () Bool)

(assert (=> b!1295527 m!1187551))

(declare-fun m!1187553 () Bool)

(assert (=> b!1295527 m!1187553))

(declare-fun m!1187555 () Bool)

(assert (=> b!1295527 m!1187555))

(declare-fun m!1187557 () Bool)

(assert (=> mapNonEmpty!53387 m!1187557))

(check-sat (not b!1295522) (not start!109422) (not b!1295523) b_and!47001 (not b!1295519) (not b!1295524) (not b!1295521) (not mapNonEmpty!53387) (not b!1295527) (not b_next!28911) tp_is_empty!34551)
(check-sat b_and!47001 (not b_next!28911))
