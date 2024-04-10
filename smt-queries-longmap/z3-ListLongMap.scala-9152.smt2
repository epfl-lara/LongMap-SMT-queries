; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109794 () Bool)

(assert start!109794)

(declare-fun b_free!29187 () Bool)

(declare-fun b_next!29187 () Bool)

(assert (=> start!109794 (= b_free!29187 (not b_next!29187))))

(declare-fun tp!102695 () Bool)

(declare-fun b_and!47301 () Bool)

(assert (=> start!109794 (= tp!102695 b_and!47301)))

(declare-fun mapNonEmpty!53816 () Bool)

(declare-fun mapRes!53816 () Bool)

(declare-fun tp!102694 () Bool)

(declare-fun e!741856 () Bool)

(assert (=> mapNonEmpty!53816 (= mapRes!53816 (and tp!102694 e!741856))))

(declare-fun mapKey!53816 () (_ BitVec 32))

(declare-datatypes ((V!51539 0))(
  ( (V!51540 (val!17488 Int)) )
))
(declare-datatypes ((ValueCell!16515 0))(
  ( (ValueCellFull!16515 (v!20096 V!51539)) (EmptyCell!16515) )
))
(declare-fun mapValue!53816 () ValueCell!16515)

(declare-datatypes ((array!86666 0))(
  ( (array!86667 (arr!41829 (Array (_ BitVec 32) ValueCell!16515)) (size!42379 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86666)

(declare-fun mapRest!53816 () (Array (_ BitVec 32) ValueCell!16515))

(assert (=> mapNonEmpty!53816 (= (arr!41829 _values!1445) (store mapRest!53816 mapKey!53816 mapValue!53816))))

(declare-fun b!1300521 () Bool)

(declare-fun res!864224 () Bool)

(declare-fun e!741854 () Bool)

(assert (=> b!1300521 (=> (not res!864224) (not e!741854))))

(declare-fun minValue!1387 () V!51539)

(declare-fun zeroValue!1387 () V!51539)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86668 0))(
  ( (array!86669 (arr!41830 (Array (_ BitVec 32) (_ BitVec 64))) (size!42380 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86668)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22554 0))(
  ( (tuple2!22555 (_1!11288 (_ BitVec 64)) (_2!11288 V!51539)) )
))
(declare-datatypes ((List!29687 0))(
  ( (Nil!29684) (Cons!29683 (h!30892 tuple2!22554) (t!43261 List!29687)) )
))
(declare-datatypes ((ListLongMap!20211 0))(
  ( (ListLongMap!20212 (toList!10121 List!29687)) )
))
(declare-fun contains!8247 (ListLongMap!20211 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5148 (array!86668 array!86666 (_ BitVec 32) (_ BitVec 32) V!51539 V!51539 (_ BitVec 32) Int) ListLongMap!20211)

(assert (=> b!1300521 (= res!864224 (contains!8247 (getCurrentListMap!5148 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1300522 () Bool)

(declare-fun res!864218 () Bool)

(assert (=> b!1300522 (=> (not res!864218) (not e!741854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86668 (_ BitVec 32)) Bool)

(assert (=> b!1300522 (= res!864218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1300523 () Bool)

(declare-fun res!864217 () Bool)

(assert (=> b!1300523 (=> (not res!864217) (not e!741854))))

(assert (=> b!1300523 (= res!864217 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42380 _keys!1741))))))

(declare-fun b!1300524 () Bool)

(declare-fun res!864222 () Bool)

(assert (=> b!1300524 (=> (not res!864222) (not e!741854))))

(assert (=> b!1300524 (= res!864222 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1300525 () Bool)

(declare-fun e!741857 () Bool)

(declare-fun tp_is_empty!34827 () Bool)

(assert (=> b!1300525 (= e!741857 tp_is_empty!34827)))

(declare-fun b!1300526 () Bool)

(declare-fun res!864216 () Bool)

(assert (=> b!1300526 (=> (not res!864216) (not e!741854))))

(assert (=> b!1300526 (= res!864216 (and (= (size!42379 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42380 _keys!1741) (size!42379 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!864221 () Bool)

(assert (=> start!109794 (=> (not res!864221) (not e!741854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109794 (= res!864221 (validMask!0 mask!2175))))

(assert (=> start!109794 e!741854))

(assert (=> start!109794 tp_is_empty!34827))

(assert (=> start!109794 true))

(declare-fun e!741853 () Bool)

(declare-fun array_inv!31649 (array!86666) Bool)

(assert (=> start!109794 (and (array_inv!31649 _values!1445) e!741853)))

(declare-fun array_inv!31650 (array!86668) Bool)

(assert (=> start!109794 (array_inv!31650 _keys!1741)))

(assert (=> start!109794 tp!102695))

(declare-fun b!1300520 () Bool)

(assert (=> b!1300520 (= e!741853 (and e!741857 mapRes!53816))))

(declare-fun condMapEmpty!53816 () Bool)

(declare-fun mapDefault!53816 () ValueCell!16515)

(assert (=> b!1300520 (= condMapEmpty!53816 (= (arr!41829 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16515)) mapDefault!53816)))))

(declare-fun mapIsEmpty!53816 () Bool)

(assert (=> mapIsEmpty!53816 mapRes!53816))

(declare-fun b!1300527 () Bool)

(assert (=> b!1300527 (= e!741856 tp_is_empty!34827)))

(declare-fun b!1300528 () Bool)

(declare-fun res!864219 () Bool)

(assert (=> b!1300528 (=> (not res!864219) (not e!741854))))

(declare-datatypes ((List!29688 0))(
  ( (Nil!29685) (Cons!29684 (h!30893 (_ BitVec 64)) (t!43262 List!29688)) )
))
(declare-fun arrayNoDuplicates!0 (array!86668 (_ BitVec 32) List!29688) Bool)

(assert (=> b!1300528 (= res!864219 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29685))))

(declare-fun b!1300529 () Bool)

(assert (=> b!1300529 (= e!741854 false)))

(declare-fun lt!581399 () Bool)

(declare-fun +!4452 (ListLongMap!20211 tuple2!22554) ListLongMap!20211)

(declare-fun getCurrentListMapNoExtraKeys!6083 (array!86668 array!86666 (_ BitVec 32) (_ BitVec 32) V!51539 V!51539 (_ BitVec 32) Int) ListLongMap!20211)

(assert (=> b!1300529 (= lt!581399 (contains!8247 (+!4452 (getCurrentListMapNoExtraKeys!6083 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun b!1300530 () Bool)

(declare-fun res!864223 () Bool)

(assert (=> b!1300530 (=> (not res!864223) (not e!741854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300530 (= res!864223 (validKeyInArray!0 (select (arr!41830 _keys!1741) from!2144)))))

(declare-fun b!1300531 () Bool)

(declare-fun res!864220 () Bool)

(assert (=> b!1300531 (=> (not res!864220) (not e!741854))))

(assert (=> b!1300531 (= res!864220 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42380 _keys!1741))))))

(assert (= (and start!109794 res!864221) b!1300526))

(assert (= (and b!1300526 res!864216) b!1300522))

(assert (= (and b!1300522 res!864218) b!1300528))

(assert (= (and b!1300528 res!864219) b!1300531))

(assert (= (and b!1300531 res!864220) b!1300521))

(assert (= (and b!1300521 res!864224) b!1300523))

(assert (= (and b!1300523 res!864217) b!1300530))

(assert (= (and b!1300530 res!864223) b!1300524))

(assert (= (and b!1300524 res!864222) b!1300529))

(assert (= (and b!1300520 condMapEmpty!53816) mapIsEmpty!53816))

(assert (= (and b!1300520 (not condMapEmpty!53816)) mapNonEmpty!53816))

(get-info :version)

(assert (= (and mapNonEmpty!53816 ((_ is ValueCellFull!16515) mapValue!53816)) b!1300527))

(assert (= (and b!1300520 ((_ is ValueCellFull!16515) mapDefault!53816)) b!1300525))

(assert (= start!109794 b!1300520))

(declare-fun m!1191429 () Bool)

(assert (=> mapNonEmpty!53816 m!1191429))

(declare-fun m!1191431 () Bool)

(assert (=> b!1300530 m!1191431))

(assert (=> b!1300530 m!1191431))

(declare-fun m!1191433 () Bool)

(assert (=> b!1300530 m!1191433))

(declare-fun m!1191435 () Bool)

(assert (=> b!1300521 m!1191435))

(assert (=> b!1300521 m!1191435))

(declare-fun m!1191437 () Bool)

(assert (=> b!1300521 m!1191437))

(declare-fun m!1191439 () Bool)

(assert (=> b!1300529 m!1191439))

(assert (=> b!1300529 m!1191439))

(declare-fun m!1191441 () Bool)

(assert (=> b!1300529 m!1191441))

(assert (=> b!1300529 m!1191441))

(declare-fun m!1191443 () Bool)

(assert (=> b!1300529 m!1191443))

(declare-fun m!1191445 () Bool)

(assert (=> start!109794 m!1191445))

(declare-fun m!1191447 () Bool)

(assert (=> start!109794 m!1191447))

(declare-fun m!1191449 () Bool)

(assert (=> start!109794 m!1191449))

(declare-fun m!1191451 () Bool)

(assert (=> b!1300522 m!1191451))

(declare-fun m!1191453 () Bool)

(assert (=> b!1300528 m!1191453))

(check-sat (not b!1300522) (not b!1300529) (not b!1300521) (not b_next!29187) (not b!1300530) tp_is_empty!34827 (not mapNonEmpty!53816) b_and!47301 (not b!1300528) (not start!109794))
(check-sat b_and!47301 (not b_next!29187))
