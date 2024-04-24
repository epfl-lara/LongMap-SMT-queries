; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109296 () Bool)

(assert start!109296)

(declare-fun b_free!28561 () Bool)

(declare-fun b_next!28561 () Bool)

(assert (=> start!109296 (= b_free!28561 (not b_next!28561))))

(declare-fun tp!100801 () Bool)

(declare-fun b_and!46653 () Bool)

(assert (=> start!109296 (= tp!100801 b_and!46653)))

(declare-fun b!1290686 () Bool)

(declare-fun res!856994 () Bool)

(declare-fun e!737035 () Bool)

(assert (=> b!1290686 (=> (not res!856994) (not e!737035))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85481 0))(
  ( (array!85482 (arr!41237 (Array (_ BitVec 32) (_ BitVec 64))) (size!41788 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85481)

(assert (=> b!1290686 (= res!856994 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41788 _keys!1741))))))

(declare-fun mapNonEmpty!52862 () Bool)

(declare-fun mapRes!52862 () Bool)

(declare-fun tp!100802 () Bool)

(declare-fun e!737034 () Bool)

(assert (=> mapNonEmpty!52862 (= mapRes!52862 (and tp!100802 e!737034))))

(declare-fun mapKey!52862 () (_ BitVec 32))

(declare-datatypes ((V!50705 0))(
  ( (V!50706 (val!17175 Int)) )
))
(declare-datatypes ((ValueCell!16202 0))(
  ( (ValueCellFull!16202 (v!19773 V!50705)) (EmptyCell!16202) )
))
(declare-fun mapRest!52862 () (Array (_ BitVec 32) ValueCell!16202))

(declare-fun mapValue!52862 () ValueCell!16202)

(declare-datatypes ((array!85483 0))(
  ( (array!85484 (arr!41238 (Array (_ BitVec 32) ValueCell!16202)) (size!41789 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85483)

(assert (=> mapNonEmpty!52862 (= (arr!41238 _values!1445) (store mapRest!52862 mapKey!52862 mapValue!52862))))

(declare-fun b!1290687 () Bool)

(declare-fun tp_is_empty!34201 () Bool)

(assert (=> b!1290687 (= e!737034 tp_is_empty!34201)))

(declare-fun b!1290688 () Bool)

(declare-fun res!857000 () Bool)

(assert (=> b!1290688 (=> (not res!857000) (not e!737035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290688 (= res!857000 (not (validKeyInArray!0 (select (arr!41237 _keys!1741) from!2144))))))

(declare-fun b!1290689 () Bool)

(declare-fun res!856999 () Bool)

(assert (=> b!1290689 (=> (not res!856999) (not e!737035))))

(declare-datatypes ((List!29253 0))(
  ( (Nil!29250) (Cons!29249 (h!30467 (_ BitVec 64)) (t!42809 List!29253)) )
))
(declare-fun arrayNoDuplicates!0 (array!85481 (_ BitVec 32) List!29253) Bool)

(assert (=> b!1290689 (= res!856999 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29250))))

(declare-fun b!1290690 () Bool)

(declare-fun res!856997 () Bool)

(assert (=> b!1290690 (=> (not res!856997) (not e!737035))))

(declare-fun minValue!1387 () V!50705)

(declare-fun zeroValue!1387 () V!50705)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22072 0))(
  ( (tuple2!22073 (_1!11047 (_ BitVec 64)) (_2!11047 V!50705)) )
))
(declare-datatypes ((List!29254 0))(
  ( (Nil!29251) (Cons!29250 (h!30468 tuple2!22072) (t!42810 List!29254)) )
))
(declare-datatypes ((ListLongMap!19737 0))(
  ( (ListLongMap!19738 (toList!9884 List!29254)) )
))
(declare-fun contains!8015 (ListLongMap!19737 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4930 (array!85481 array!85483 (_ BitVec 32) (_ BitVec 32) V!50705 V!50705 (_ BitVec 32) Int) ListLongMap!19737)

(assert (=> b!1290690 (= res!856997 (contains!8015 (getCurrentListMap!4930 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!856995 () Bool)

(assert (=> start!109296 (=> (not res!856995) (not e!737035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109296 (= res!856995 (validMask!0 mask!2175))))

(assert (=> start!109296 e!737035))

(assert (=> start!109296 tp_is_empty!34201))

(assert (=> start!109296 true))

(declare-fun e!737032 () Bool)

(declare-fun array_inv!31471 (array!85483) Bool)

(assert (=> start!109296 (and (array_inv!31471 _values!1445) e!737032)))

(declare-fun array_inv!31472 (array!85481) Bool)

(assert (=> start!109296 (array_inv!31472 _keys!1741)))

(assert (=> start!109296 tp!100801))

(declare-fun mapIsEmpty!52862 () Bool)

(assert (=> mapIsEmpty!52862 mapRes!52862))

(declare-fun b!1290691 () Bool)

(declare-fun res!857001 () Bool)

(assert (=> b!1290691 (=> (not res!857001) (not e!737035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85481 (_ BitVec 32)) Bool)

(assert (=> b!1290691 (= res!857001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290692 () Bool)

(declare-fun e!737033 () Bool)

(assert (=> b!1290692 (= e!737033 tp_is_empty!34201)))

(declare-fun b!1290693 () Bool)

(declare-fun res!856996 () Bool)

(assert (=> b!1290693 (=> (not res!856996) (not e!737035))))

(assert (=> b!1290693 (= res!856996 (and (= (size!41789 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41788 _keys!1741) (size!41789 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290694 () Bool)

(assert (=> b!1290694 (= e!737032 (and e!737033 mapRes!52862))))

(declare-fun condMapEmpty!52862 () Bool)

(declare-fun mapDefault!52862 () ValueCell!16202)

(assert (=> b!1290694 (= condMapEmpty!52862 (= (arr!41238 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16202)) mapDefault!52862)))))

(declare-fun b!1290695 () Bool)

(declare-fun e!737037 () Bool)

(assert (=> b!1290695 (= e!737035 (not e!737037))))

(declare-fun res!856998 () Bool)

(assert (=> b!1290695 (=> res!856998 e!737037)))

(assert (=> b!1290695 (= res!856998 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290695 (not (contains!8015 (ListLongMap!19738 Nil!29251) k0!1205))))

(declare-datatypes ((Unit!42617 0))(
  ( (Unit!42618) )
))
(declare-fun lt!578721 () Unit!42617)

(declare-fun emptyContainsNothing!60 ((_ BitVec 64)) Unit!42617)

(assert (=> b!1290695 (= lt!578721 (emptyContainsNothing!60 k0!1205))))

(declare-fun b!1290696 () Bool)

(declare-fun res!857002 () Bool)

(assert (=> b!1290696 (=> (not res!857002) (not e!737035))))

(assert (=> b!1290696 (= res!857002 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41788 _keys!1741))))))

(declare-fun b!1290697 () Bool)

(assert (=> b!1290697 (= e!737037 true)))

(declare-fun lt!578722 () ListLongMap!19737)

(declare-fun +!4388 (ListLongMap!19737 tuple2!22072) ListLongMap!19737)

(assert (=> b!1290697 (not (contains!8015 (+!4388 lt!578722 (tuple2!22073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578724 () Unit!42617)

(declare-fun addStillNotContains!364 (ListLongMap!19737 (_ BitVec 64) V!50705 (_ BitVec 64)) Unit!42617)

(assert (=> b!1290697 (= lt!578724 (addStillNotContains!364 lt!578722 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290697 (not (contains!8015 (+!4388 lt!578722 (tuple2!22073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578723 () Unit!42617)

(assert (=> b!1290697 (= lt!578723 (addStillNotContains!364 lt!578722 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6026 (array!85481 array!85483 (_ BitVec 32) (_ BitVec 32) V!50705 V!50705 (_ BitVec 32) Int) ListLongMap!19737)

(assert (=> b!1290697 (= lt!578722 (getCurrentListMapNoExtraKeys!6026 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(assert (= (and start!109296 res!856995) b!1290693))

(assert (= (and b!1290693 res!856996) b!1290691))

(assert (= (and b!1290691 res!857001) b!1290689))

(assert (= (and b!1290689 res!856999) b!1290686))

(assert (= (and b!1290686 res!856994) b!1290690))

(assert (= (and b!1290690 res!856997) b!1290696))

(assert (= (and b!1290696 res!857002) b!1290688))

(assert (= (and b!1290688 res!857000) b!1290695))

(assert (= (and b!1290695 (not res!856998)) b!1290697))

(assert (= (and b!1290694 condMapEmpty!52862) mapIsEmpty!52862))

(assert (= (and b!1290694 (not condMapEmpty!52862)) mapNonEmpty!52862))

(get-info :version)

(assert (= (and mapNonEmpty!52862 ((_ is ValueCellFull!16202) mapValue!52862)) b!1290687))

(assert (= (and b!1290694 ((_ is ValueCellFull!16202) mapDefault!52862)) b!1290692))

(assert (= start!109296 b!1290694))

(declare-fun m!1183515 () Bool)

(assert (=> b!1290688 m!1183515))

(assert (=> b!1290688 m!1183515))

(declare-fun m!1183517 () Bool)

(assert (=> b!1290688 m!1183517))

(declare-fun m!1183519 () Bool)

(assert (=> mapNonEmpty!52862 m!1183519))

(declare-fun m!1183521 () Bool)

(assert (=> b!1290697 m!1183521))

(declare-fun m!1183523 () Bool)

(assert (=> b!1290697 m!1183523))

(assert (=> b!1290697 m!1183521))

(declare-fun m!1183525 () Bool)

(assert (=> b!1290697 m!1183525))

(declare-fun m!1183527 () Bool)

(assert (=> b!1290697 m!1183527))

(declare-fun m!1183529 () Bool)

(assert (=> b!1290697 m!1183529))

(declare-fun m!1183531 () Bool)

(assert (=> b!1290697 m!1183531))

(assert (=> b!1290697 m!1183525))

(declare-fun m!1183533 () Bool)

(assert (=> b!1290697 m!1183533))

(declare-fun m!1183535 () Bool)

(assert (=> b!1290695 m!1183535))

(declare-fun m!1183537 () Bool)

(assert (=> b!1290695 m!1183537))

(declare-fun m!1183539 () Bool)

(assert (=> b!1290691 m!1183539))

(declare-fun m!1183541 () Bool)

(assert (=> b!1290689 m!1183541))

(declare-fun m!1183543 () Bool)

(assert (=> b!1290690 m!1183543))

(assert (=> b!1290690 m!1183543))

(declare-fun m!1183545 () Bool)

(assert (=> b!1290690 m!1183545))

(declare-fun m!1183547 () Bool)

(assert (=> start!109296 m!1183547))

(declare-fun m!1183549 () Bool)

(assert (=> start!109296 m!1183549))

(declare-fun m!1183551 () Bool)

(assert (=> start!109296 m!1183551))

(check-sat (not b!1290689) (not start!109296) (not b_next!28561) (not b!1290691) (not b!1290688) tp_is_empty!34201 (not b!1290690) (not b!1290695) (not b!1290697) b_and!46653 (not mapNonEmpty!52862))
(check-sat b_and!46653 (not b_next!28561))
