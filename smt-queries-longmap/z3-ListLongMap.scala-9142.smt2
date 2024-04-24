; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109860 () Bool)

(assert start!109860)

(declare-fun b_free!29125 () Bool)

(declare-fun b_next!29125 () Bool)

(assert (=> start!109860 (= b_free!29125 (not b_next!29125))))

(declare-fun tp!102493 () Bool)

(declare-fun b_and!47217 () Bool)

(assert (=> start!109860 (= tp!102493 b_and!47217)))

(declare-fun b!1300044 () Bool)

(declare-fun e!741757 () Bool)

(declare-fun tp_is_empty!34765 () Bool)

(assert (=> b!1300044 (= e!741757 tp_is_empty!34765)))

(declare-fun b!1300045 () Bool)

(declare-fun res!863653 () Bool)

(declare-fun e!741759 () Bool)

(assert (=> b!1300045 (=> (not res!863653) (not e!741759))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86575 0))(
  ( (array!86576 (arr!41784 (Array (_ BitVec 32) (_ BitVec 64))) (size!42335 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86575)

(assert (=> b!1300045 (= res!863653 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42335 _keys!1741)) (not (= (select (arr!41784 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1300046 () Bool)

(declare-fun res!863654 () Bool)

(assert (=> b!1300046 (=> (not res!863654) (not e!741759))))

(assert (=> b!1300046 (= res!863654 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42335 _keys!1741))))))

(declare-fun b!1300047 () Bool)

(declare-fun res!863655 () Bool)

(assert (=> b!1300047 (=> (not res!863655) (not e!741759))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86575 (_ BitVec 32)) Bool)

(assert (=> b!1300047 (= res!863655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1300048 () Bool)

(declare-fun e!741761 () Bool)

(assert (=> b!1300048 (= e!741759 (not e!741761))))

(declare-fun res!863656 () Bool)

(assert (=> b!1300048 (=> res!863656 e!741761)))

(assert (=> b!1300048 (= res!863656 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(declare-datatypes ((V!51457 0))(
  ( (V!51458 (val!17457 Int)) )
))
(declare-fun minValue!1387 () V!51457)

(declare-fun zeroValue!1387 () V!51457)

(declare-datatypes ((ValueCell!16484 0))(
  ( (ValueCellFull!16484 (v!20055 V!51457)) (EmptyCell!16484) )
))
(declare-datatypes ((array!86577 0))(
  ( (array!86578 (arr!41785 (Array (_ BitVec 32) ValueCell!16484)) (size!42336 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86577)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22522 0))(
  ( (tuple2!22523 (_1!11272 (_ BitVec 64)) (_2!11272 V!51457)) )
))
(declare-datatypes ((List!29681 0))(
  ( (Nil!29678) (Cons!29677 (h!30895 tuple2!22522) (t!43237 List!29681)) )
))
(declare-datatypes ((ListLongMap!20187 0))(
  ( (ListLongMap!20188 (toList!10109 List!29681)) )
))
(declare-fun contains!8239 (ListLongMap!20187 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5128 (array!86575 array!86577 (_ BitVec 32) (_ BitVec 32) V!51457 V!51457 (_ BitVec 32) Int) ListLongMap!20187)

(assert (=> b!1300048 (contains!8239 (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42971 0))(
  ( (Unit!42972) )
))
(declare-fun lt!581219 () Unit!42971)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!52 (array!86575 array!86577 (_ BitVec 32) (_ BitVec 32) V!51457 V!51457 (_ BitVec 64) (_ BitVec 32) Int) Unit!42971)

(assert (=> b!1300048 (= lt!581219 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!52 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1300049 () Bool)

(declare-fun res!863658 () Bool)

(assert (=> b!1300049 (=> (not res!863658) (not e!741759))))

(declare-datatypes ((List!29682 0))(
  ( (Nil!29679) (Cons!29678 (h!30896 (_ BitVec 64)) (t!43238 List!29682)) )
))
(declare-fun arrayNoDuplicates!0 (array!86575 (_ BitVec 32) List!29682) Bool)

(assert (=> b!1300049 (= res!863658 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29679))))

(declare-fun b!1300050 () Bool)

(declare-fun e!741762 () Bool)

(declare-fun e!741760 () Bool)

(declare-fun mapRes!53708 () Bool)

(assert (=> b!1300050 (= e!741762 (and e!741760 mapRes!53708))))

(declare-fun condMapEmpty!53708 () Bool)

(declare-fun mapDefault!53708 () ValueCell!16484)

(assert (=> b!1300050 (= condMapEmpty!53708 (= (arr!41785 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16484)) mapDefault!53708)))))

(declare-fun b!1300051 () Bool)

(declare-fun res!863652 () Bool)

(assert (=> b!1300051 (=> (not res!863652) (not e!741759))))

(assert (=> b!1300051 (= res!863652 (contains!8239 (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1300052 () Bool)

(declare-fun arrayContainsKey!0 (array!86575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1300052 (= e!741761 (arrayContainsKey!0 _keys!1741 k0!1205 from!2144))))

(assert (=> b!1300052 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144))))

(declare-fun lt!581220 () Unit!42971)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!641 (array!86575 array!86577 (_ BitVec 32) (_ BitVec 32) V!51457 V!51457 (_ BitVec 64) (_ BitVec 32) Int) Unit!42971)

(assert (=> b!1300052 (= lt!581220 (lemmaListMapContainsThenArrayContainsFrom!641 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1300053 () Bool)

(declare-fun res!863659 () Bool)

(assert (=> b!1300053 (=> (not res!863659) (not e!741759))))

(assert (=> b!1300053 (= res!863659 (and (= (size!42336 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42335 _keys!1741) (size!42336 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53708 () Bool)

(declare-fun tp!102494 () Bool)

(assert (=> mapNonEmpty!53708 (= mapRes!53708 (and tp!102494 e!741757))))

(declare-fun mapKey!53708 () (_ BitVec 32))

(declare-fun mapValue!53708 () ValueCell!16484)

(declare-fun mapRest!53708 () (Array (_ BitVec 32) ValueCell!16484))

(assert (=> mapNonEmpty!53708 (= (arr!41785 _values!1445) (store mapRest!53708 mapKey!53708 mapValue!53708))))

(declare-fun res!863657 () Bool)

(assert (=> start!109860 (=> (not res!863657) (not e!741759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109860 (= res!863657 (validMask!0 mask!2175))))

(assert (=> start!109860 e!741759))

(assert (=> start!109860 tp_is_empty!34765))

(assert (=> start!109860 true))

(declare-fun array_inv!31857 (array!86577) Bool)

(assert (=> start!109860 (and (array_inv!31857 _values!1445) e!741762)))

(declare-fun array_inv!31858 (array!86575) Bool)

(assert (=> start!109860 (array_inv!31858 _keys!1741)))

(assert (=> start!109860 tp!102493))

(declare-fun b!1300054 () Bool)

(assert (=> b!1300054 (= e!741760 tp_is_empty!34765)))

(declare-fun mapIsEmpty!53708 () Bool)

(assert (=> mapIsEmpty!53708 mapRes!53708))

(assert (= (and start!109860 res!863657) b!1300053))

(assert (= (and b!1300053 res!863659) b!1300047))

(assert (= (and b!1300047 res!863655) b!1300049))

(assert (= (and b!1300049 res!863658) b!1300046))

(assert (= (and b!1300046 res!863654) b!1300051))

(assert (= (and b!1300051 res!863652) b!1300045))

(assert (= (and b!1300045 res!863653) b!1300048))

(assert (= (and b!1300048 (not res!863656)) b!1300052))

(assert (= (and b!1300050 condMapEmpty!53708) mapIsEmpty!53708))

(assert (= (and b!1300050 (not condMapEmpty!53708)) mapNonEmpty!53708))

(get-info :version)

(assert (= (and mapNonEmpty!53708 ((_ is ValueCellFull!16484) mapValue!53708)) b!1300044))

(assert (= (and b!1300050 ((_ is ValueCellFull!16484) mapDefault!53708)) b!1300054))

(assert (= start!109860 b!1300050))

(declare-fun m!1191645 () Bool)

(assert (=> b!1300048 m!1191645))

(assert (=> b!1300048 m!1191645))

(declare-fun m!1191647 () Bool)

(assert (=> b!1300048 m!1191647))

(declare-fun m!1191649 () Bool)

(assert (=> b!1300048 m!1191649))

(declare-fun m!1191651 () Bool)

(assert (=> mapNonEmpty!53708 m!1191651))

(declare-fun m!1191653 () Bool)

(assert (=> b!1300051 m!1191653))

(assert (=> b!1300051 m!1191653))

(declare-fun m!1191655 () Bool)

(assert (=> b!1300051 m!1191655))

(declare-fun m!1191657 () Bool)

(assert (=> b!1300052 m!1191657))

(declare-fun m!1191659 () Bool)

(assert (=> b!1300052 m!1191659))

(declare-fun m!1191661 () Bool)

(assert (=> b!1300052 m!1191661))

(declare-fun m!1191663 () Bool)

(assert (=> b!1300049 m!1191663))

(declare-fun m!1191665 () Bool)

(assert (=> b!1300047 m!1191665))

(declare-fun m!1191667 () Bool)

(assert (=> start!109860 m!1191667))

(declare-fun m!1191669 () Bool)

(assert (=> start!109860 m!1191669))

(declare-fun m!1191671 () Bool)

(assert (=> start!109860 m!1191671))

(declare-fun m!1191673 () Bool)

(assert (=> b!1300045 m!1191673))

(check-sat (not b!1300051) (not b!1300048) (not mapNonEmpty!53708) (not start!109860) tp_is_empty!34765 (not b_next!29125) (not b!1300049) b_and!47217 (not b!1300052) (not b!1300047))
(check-sat b_and!47217 (not b_next!29125))
(get-model)

(declare-fun bm!63574 () Bool)

(declare-fun call!63577 () Bool)

(declare-fun c!124817 () Bool)

(assert (=> bm!63574 (= call!63577 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124817 (Cons!29678 (select (arr!41784 _keys!1741) #b00000000000000000000000000000000) Nil!29679) Nil!29679)))))

(declare-fun b!1300131 () Bool)

(declare-fun e!741810 () Bool)

(declare-fun e!741807 () Bool)

(assert (=> b!1300131 (= e!741810 e!741807)))

(declare-fun res!863716 () Bool)

(assert (=> b!1300131 (=> (not res!863716) (not e!741807))))

(declare-fun e!741808 () Bool)

(assert (=> b!1300131 (= res!863716 (not e!741808))))

(declare-fun res!863714 () Bool)

(assert (=> b!1300131 (=> (not res!863714) (not e!741808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300131 (= res!863714 (validKeyInArray!0 (select (arr!41784 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1300132 () Bool)

(declare-fun e!741809 () Bool)

(assert (=> b!1300132 (= e!741807 e!741809)))

(assert (=> b!1300132 (= c!124817 (validKeyInArray!0 (select (arr!41784 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1300133 () Bool)

(assert (=> b!1300133 (= e!741809 call!63577)))

(declare-fun b!1300134 () Bool)

(assert (=> b!1300134 (= e!741809 call!63577)))

(declare-fun d!141499 () Bool)

(declare-fun res!863715 () Bool)

(assert (=> d!141499 (=> res!863715 e!741810)))

(assert (=> d!141499 (= res!863715 (bvsge #b00000000000000000000000000000000 (size!42335 _keys!1741)))))

(assert (=> d!141499 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29679) e!741810)))

(declare-fun b!1300135 () Bool)

(declare-fun contains!8241 (List!29682 (_ BitVec 64)) Bool)

(assert (=> b!1300135 (= e!741808 (contains!8241 Nil!29679 (select (arr!41784 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141499 (not res!863715)) b!1300131))

(assert (= (and b!1300131 res!863714) b!1300135))

(assert (= (and b!1300131 res!863716) b!1300132))

(assert (= (and b!1300132 c!124817) b!1300133))

(assert (= (and b!1300132 (not c!124817)) b!1300134))

(assert (= (or b!1300133 b!1300134) bm!63574))

(declare-fun m!1191735 () Bool)

(assert (=> bm!63574 m!1191735))

(declare-fun m!1191737 () Bool)

(assert (=> bm!63574 m!1191737))

(assert (=> b!1300131 m!1191735))

(assert (=> b!1300131 m!1191735))

(declare-fun m!1191739 () Bool)

(assert (=> b!1300131 m!1191739))

(assert (=> b!1300132 m!1191735))

(assert (=> b!1300132 m!1191735))

(assert (=> b!1300132 m!1191739))

(assert (=> b!1300135 m!1191735))

(assert (=> b!1300135 m!1191735))

(declare-fun m!1191741 () Bool)

(assert (=> b!1300135 m!1191741))

(assert (=> b!1300049 d!141499))

(declare-fun d!141501 () Bool)

(assert (=> d!141501 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109860 d!141501))

(declare-fun d!141503 () Bool)

(assert (=> d!141503 (= (array_inv!31857 _values!1445) (bvsge (size!42336 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109860 d!141503))

(declare-fun d!141505 () Bool)

(assert (=> d!141505 (= (array_inv!31858 _keys!1741) (bvsge (size!42335 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109860 d!141505))

(declare-fun d!141507 () Bool)

(declare-fun e!741815 () Bool)

(assert (=> d!141507 e!741815))

(declare-fun res!863719 () Bool)

(assert (=> d!141507 (=> res!863719 e!741815)))

(declare-fun lt!581243 () Bool)

(assert (=> d!141507 (= res!863719 (not lt!581243))))

(declare-fun lt!581241 () Bool)

(assert (=> d!141507 (= lt!581243 lt!581241)))

(declare-fun lt!581244 () Unit!42971)

(declare-fun e!741816 () Unit!42971)

(assert (=> d!141507 (= lt!581244 e!741816)))

(declare-fun c!124820 () Bool)

(assert (=> d!141507 (= c!124820 lt!581241)))

(declare-fun containsKey!717 (List!29681 (_ BitVec 64)) Bool)

(assert (=> d!141507 (= lt!581241 (containsKey!717 (toList!10109 (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(assert (=> d!141507 (= (contains!8239 (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205) lt!581243)))

(declare-fun b!1300142 () Bool)

(declare-fun lt!581242 () Unit!42971)

(assert (=> b!1300142 (= e!741816 lt!581242)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!463 (List!29681 (_ BitVec 64)) Unit!42971)

(assert (=> b!1300142 (= lt!581242 (lemmaContainsKeyImpliesGetValueByKeyDefined!463 (toList!10109 (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!742 0))(
  ( (Some!741 (v!20058 V!51457)) (None!740) )
))
(declare-fun isDefined!500 (Option!742) Bool)

(declare-fun getValueByKey!691 (List!29681 (_ BitVec 64)) Option!742)

(assert (=> b!1300142 (isDefined!500 (getValueByKey!691 (toList!10109 (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(declare-fun b!1300143 () Bool)

(declare-fun Unit!42975 () Unit!42971)

(assert (=> b!1300143 (= e!741816 Unit!42975)))

(declare-fun b!1300144 () Bool)

(assert (=> b!1300144 (= e!741815 (isDefined!500 (getValueByKey!691 (toList!10109 (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141507 c!124820) b!1300142))

(assert (= (and d!141507 (not c!124820)) b!1300143))

(assert (= (and d!141507 (not res!863719)) b!1300144))

(declare-fun m!1191743 () Bool)

(assert (=> d!141507 m!1191743))

(declare-fun m!1191745 () Bool)

(assert (=> b!1300142 m!1191745))

(declare-fun m!1191747 () Bool)

(assert (=> b!1300142 m!1191747))

(assert (=> b!1300142 m!1191747))

(declare-fun m!1191749 () Bool)

(assert (=> b!1300142 m!1191749))

(assert (=> b!1300144 m!1191747))

(assert (=> b!1300144 m!1191747))

(assert (=> b!1300144 m!1191749))

(assert (=> b!1300048 d!141507))

(declare-fun b!1300187 () Bool)

(declare-fun e!741843 () Bool)

(assert (=> b!1300187 (= e!741843 (validKeyInArray!0 (select (arr!41784 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(declare-fun b!1300188 () Bool)

(declare-fun e!741852 () Bool)

(assert (=> b!1300188 (= e!741852 (validKeyInArray!0 (select (arr!41784 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(declare-fun b!1300189 () Bool)

(declare-fun e!741846 () Bool)

(declare-fun e!741850 () Bool)

(assert (=> b!1300189 (= e!741846 e!741850)))

(declare-fun res!863738 () Bool)

(declare-fun call!63597 () Bool)

(assert (=> b!1300189 (= res!863738 call!63597)))

(assert (=> b!1300189 (=> (not res!863738) (not e!741850))))

(declare-fun b!1300190 () Bool)

(declare-fun e!741851 () Bool)

(assert (=> b!1300190 (= e!741851 e!741846)))

(declare-fun c!124837 () Bool)

(assert (=> b!1300190 (= c!124837 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1300191 () Bool)

(declare-fun e!741848 () ListLongMap!20187)

(declare-fun call!63592 () ListLongMap!20187)

(assert (=> b!1300191 (= e!741848 call!63592)))

(declare-fun b!1300192 () Bool)

(declare-fun e!741845 () Unit!42971)

(declare-fun lt!581307 () Unit!42971)

(assert (=> b!1300192 (= e!741845 lt!581307)))

(declare-fun lt!581306 () ListLongMap!20187)

(declare-fun getCurrentListMapNoExtraKeys!6127 (array!86575 array!86577 (_ BitVec 32) (_ BitVec 32) V!51457 V!51457 (_ BitVec 32) Int) ListLongMap!20187)

(assert (=> b!1300192 (= lt!581306 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!581299 () (_ BitVec 64))

(assert (=> b!1300192 (= lt!581299 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581294 () (_ BitVec 64))

(assert (=> b!1300192 (= lt!581294 (select (arr!41784 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!581304 () Unit!42971)

(declare-fun addStillContains!1108 (ListLongMap!20187 (_ BitVec 64) V!51457 (_ BitVec 64)) Unit!42971)

(assert (=> b!1300192 (= lt!581304 (addStillContains!1108 lt!581306 lt!581299 zeroValue!1387 lt!581294))))

(declare-fun +!4487 (ListLongMap!20187 tuple2!22522) ListLongMap!20187)

(assert (=> b!1300192 (contains!8239 (+!4487 lt!581306 (tuple2!22523 lt!581299 zeroValue!1387)) lt!581294)))

(declare-fun lt!581296 () Unit!42971)

(assert (=> b!1300192 (= lt!581296 lt!581304)))

(declare-fun lt!581290 () ListLongMap!20187)

(assert (=> b!1300192 (= lt!581290 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!581291 () (_ BitVec 64))

(assert (=> b!1300192 (= lt!581291 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581298 () (_ BitVec 64))

(assert (=> b!1300192 (= lt!581298 (select (arr!41784 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!581301 () Unit!42971)

(declare-fun addApplyDifferent!550 (ListLongMap!20187 (_ BitVec 64) V!51457 (_ BitVec 64)) Unit!42971)

(assert (=> b!1300192 (= lt!581301 (addApplyDifferent!550 lt!581290 lt!581291 minValue!1387 lt!581298))))

(declare-fun apply!1021 (ListLongMap!20187 (_ BitVec 64)) V!51457)

(assert (=> b!1300192 (= (apply!1021 (+!4487 lt!581290 (tuple2!22523 lt!581291 minValue!1387)) lt!581298) (apply!1021 lt!581290 lt!581298))))

(declare-fun lt!581293 () Unit!42971)

(assert (=> b!1300192 (= lt!581293 lt!581301)))

(declare-fun lt!581289 () ListLongMap!20187)

(assert (=> b!1300192 (= lt!581289 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!581297 () (_ BitVec 64))

(assert (=> b!1300192 (= lt!581297 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581305 () (_ BitVec 64))

(assert (=> b!1300192 (= lt!581305 (select (arr!41784 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!581308 () Unit!42971)

(assert (=> b!1300192 (= lt!581308 (addApplyDifferent!550 lt!581289 lt!581297 zeroValue!1387 lt!581305))))

(assert (=> b!1300192 (= (apply!1021 (+!4487 lt!581289 (tuple2!22523 lt!581297 zeroValue!1387)) lt!581305) (apply!1021 lt!581289 lt!581305))))

(declare-fun lt!581300 () Unit!42971)

(assert (=> b!1300192 (= lt!581300 lt!581308)))

(declare-fun lt!581310 () ListLongMap!20187)

(assert (=> b!1300192 (= lt!581310 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!581309 () (_ BitVec 64))

(assert (=> b!1300192 (= lt!581309 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581292 () (_ BitVec 64))

(assert (=> b!1300192 (= lt!581292 (select (arr!41784 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(assert (=> b!1300192 (= lt!581307 (addApplyDifferent!550 lt!581310 lt!581309 minValue!1387 lt!581292))))

(assert (=> b!1300192 (= (apply!1021 (+!4487 lt!581310 (tuple2!22523 lt!581309 minValue!1387)) lt!581292) (apply!1021 lt!581310 lt!581292))))

(declare-fun bm!63589 () Bool)

(declare-fun c!124838 () Bool)

(declare-fun call!63596 () ListLongMap!20187)

(declare-fun c!124836 () Bool)

(declare-fun call!63594 () ListLongMap!20187)

(declare-fun call!63598 () ListLongMap!20187)

(assert (=> bm!63589 (= call!63598 (+!4487 (ite c!124836 call!63594 (ite c!124838 call!63596 call!63592)) (ite (or c!124836 c!124838) (tuple2!22523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun bm!63590 () Bool)

(declare-fun lt!581303 () ListLongMap!20187)

(assert (=> bm!63590 (= call!63597 (contains!8239 lt!581303 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1300193 () Bool)

(declare-fun call!63595 () ListLongMap!20187)

(assert (=> b!1300193 (= e!741848 call!63595)))

(declare-fun bm!63591 () Bool)

(assert (=> bm!63591 (= call!63592 call!63596)))

(declare-fun b!1300194 () Bool)

(assert (=> b!1300194 (= e!741850 (= (apply!1021 lt!581303 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1300195 () Bool)

(declare-fun e!741855 () Bool)

(declare-fun e!741844 () Bool)

(assert (=> b!1300195 (= e!741855 e!741844)))

(declare-fun res!863745 () Bool)

(declare-fun call!63593 () Bool)

(assert (=> b!1300195 (= res!863745 call!63593)))

(assert (=> b!1300195 (=> (not res!863745) (not e!741844))))

(declare-fun b!1300196 () Bool)

(declare-fun c!124835 () Bool)

(assert (=> b!1300196 (= c!124835 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!741854 () ListLongMap!20187)

(assert (=> b!1300196 (= e!741854 e!741848)))

(declare-fun b!1300197 () Bool)

(declare-fun e!741853 () Bool)

(declare-fun e!741847 () Bool)

(assert (=> b!1300197 (= e!741853 e!741847)))

(declare-fun res!863746 () Bool)

(assert (=> b!1300197 (=> (not res!863746) (not e!741847))))

(assert (=> b!1300197 (= res!863746 (contains!8239 lt!581303 (select (arr!41784 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(assert (=> b!1300197 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42335 _keys!1741)))))

(declare-fun b!1300198 () Bool)

(assert (=> b!1300198 (= e!741855 (not call!63593))))

(declare-fun bm!63592 () Bool)

(assert (=> bm!63592 (= call!63595 call!63598)))

(declare-fun b!1300199 () Bool)

(declare-fun get!21149 (ValueCell!16484 V!51457) V!51457)

(declare-fun dynLambda!3478 (Int (_ BitVec 64)) V!51457)

(assert (=> b!1300199 (= e!741847 (= (apply!1021 lt!581303 (select (arr!41784 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))) (get!21149 (select (arr!41785 _values!1445) (bvadd #b00000000000000000000000000000001 from!2144)) (dynLambda!3478 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1300199 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42336 _values!1445)))))

(assert (=> b!1300199 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42335 _keys!1741)))))

(declare-fun b!1300200 () Bool)

(assert (=> b!1300200 (= e!741844 (= (apply!1021 lt!581303 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1300201 () Bool)

(declare-fun e!741849 () ListLongMap!20187)

(assert (=> b!1300201 (= e!741849 (+!4487 call!63598 (tuple2!22523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun bm!63593 () Bool)

(assert (=> bm!63593 (= call!63594 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1300202 () Bool)

(declare-fun Unit!42976 () Unit!42971)

(assert (=> b!1300202 (= e!741845 Unit!42976)))

(declare-fun b!1300203 () Bool)

(assert (=> b!1300203 (= e!741846 (not call!63597))))

(declare-fun b!1300204 () Bool)

(assert (=> b!1300204 (= e!741849 e!741854)))

(assert (=> b!1300204 (= c!124838 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1300205 () Bool)

(assert (=> b!1300205 (= e!741854 call!63595)))

(declare-fun bm!63594 () Bool)

(assert (=> bm!63594 (= call!63596 call!63594)))

(declare-fun b!1300206 () Bool)

(declare-fun res!863739 () Bool)

(assert (=> b!1300206 (=> (not res!863739) (not e!741851))))

(assert (=> b!1300206 (= res!863739 e!741853)))

(declare-fun res!863743 () Bool)

(assert (=> b!1300206 (=> res!863743 e!741853)))

(assert (=> b!1300206 (= res!863743 (not e!741852))))

(declare-fun res!863740 () Bool)

(assert (=> b!1300206 (=> (not res!863740) (not e!741852))))

(assert (=> b!1300206 (= res!863740 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42335 _keys!1741)))))

(declare-fun b!1300207 () Bool)

(declare-fun res!863742 () Bool)

(assert (=> b!1300207 (=> (not res!863742) (not e!741851))))

(assert (=> b!1300207 (= res!863742 e!741855)))

(declare-fun c!124834 () Bool)

(assert (=> b!1300207 (= c!124834 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!141509 () Bool)

(assert (=> d!141509 e!741851))

(declare-fun res!863744 () Bool)

(assert (=> d!141509 (=> (not res!863744) (not e!741851))))

(assert (=> d!141509 (= res!863744 (or (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42335 _keys!1741)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42335 _keys!1741)))))))

(declare-fun lt!581295 () ListLongMap!20187)

(assert (=> d!141509 (= lt!581303 lt!581295)))

(declare-fun lt!581302 () Unit!42971)

(assert (=> d!141509 (= lt!581302 e!741845)))

(declare-fun c!124833 () Bool)

(assert (=> d!141509 (= c!124833 e!741843)))

(declare-fun res!863741 () Bool)

(assert (=> d!141509 (=> (not res!863741) (not e!741843))))

(assert (=> d!141509 (= res!863741 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42335 _keys!1741)))))

(assert (=> d!141509 (= lt!581295 e!741849)))

(assert (=> d!141509 (= c!124836 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141509 (validMask!0 mask!2175)))

(assert (=> d!141509 (= (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) lt!581303)))

(declare-fun bm!63595 () Bool)

(assert (=> bm!63595 (= call!63593 (contains!8239 lt!581303 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!141509 c!124836) b!1300201))

(assert (= (and d!141509 (not c!124836)) b!1300204))

(assert (= (and b!1300204 c!124838) b!1300205))

(assert (= (and b!1300204 (not c!124838)) b!1300196))

(assert (= (and b!1300196 c!124835) b!1300193))

(assert (= (and b!1300196 (not c!124835)) b!1300191))

(assert (= (or b!1300193 b!1300191) bm!63591))

(assert (= (or b!1300205 bm!63591) bm!63594))

(assert (= (or b!1300205 b!1300193) bm!63592))

(assert (= (or b!1300201 bm!63594) bm!63593))

(assert (= (or b!1300201 bm!63592) bm!63589))

(assert (= (and d!141509 res!863741) b!1300187))

(assert (= (and d!141509 c!124833) b!1300192))

(assert (= (and d!141509 (not c!124833)) b!1300202))

(assert (= (and d!141509 res!863744) b!1300206))

(assert (= (and b!1300206 res!863740) b!1300188))

(assert (= (and b!1300206 (not res!863743)) b!1300197))

(assert (= (and b!1300197 res!863746) b!1300199))

(assert (= (and b!1300206 res!863739) b!1300207))

(assert (= (and b!1300207 c!124834) b!1300195))

(assert (= (and b!1300207 (not c!124834)) b!1300198))

(assert (= (and b!1300195 res!863745) b!1300200))

(assert (= (or b!1300195 b!1300198) bm!63595))

(assert (= (and b!1300207 res!863742) b!1300190))

(assert (= (and b!1300190 c!124837) b!1300189))

(assert (= (and b!1300190 (not c!124837)) b!1300203))

(assert (= (and b!1300189 res!863738) b!1300194))

(assert (= (or b!1300189 b!1300203) bm!63590))

(declare-fun b_lambda!23131 () Bool)

(assert (=> (not b_lambda!23131) (not b!1300199)))

(declare-fun t!43242 () Bool)

(declare-fun tb!11361 () Bool)

(assert (=> (and start!109860 (= defaultEntry!1448 defaultEntry!1448) t!43242) tb!11361))

(declare-fun result!23731 () Bool)

(assert (=> tb!11361 (= result!23731 tp_is_empty!34765)))

(assert (=> b!1300199 t!43242))

(declare-fun b_and!47223 () Bool)

(assert (= b_and!47217 (and (=> t!43242 result!23731) b_and!47223)))

(declare-fun m!1191751 () Bool)

(assert (=> bm!63595 m!1191751))

(declare-fun m!1191753 () Bool)

(assert (=> b!1300200 m!1191753))

(declare-fun m!1191755 () Bool)

(assert (=> bm!63589 m!1191755))

(declare-fun m!1191757 () Bool)

(assert (=> b!1300194 m!1191757))

(declare-fun m!1191759 () Bool)

(assert (=> b!1300192 m!1191759))

(declare-fun m!1191761 () Bool)

(assert (=> b!1300192 m!1191761))

(declare-fun m!1191763 () Bool)

(assert (=> b!1300192 m!1191763))

(declare-fun m!1191765 () Bool)

(assert (=> b!1300192 m!1191765))

(declare-fun m!1191767 () Bool)

(assert (=> b!1300192 m!1191767))

(declare-fun m!1191769 () Bool)

(assert (=> b!1300192 m!1191769))

(declare-fun m!1191771 () Bool)

(assert (=> b!1300192 m!1191771))

(declare-fun m!1191773 () Bool)

(assert (=> b!1300192 m!1191773))

(declare-fun m!1191775 () Bool)

(assert (=> b!1300192 m!1191775))

(declare-fun m!1191777 () Bool)

(assert (=> b!1300192 m!1191777))

(declare-fun m!1191779 () Bool)

(assert (=> b!1300192 m!1191779))

(declare-fun m!1191781 () Bool)

(assert (=> b!1300192 m!1191781))

(assert (=> b!1300192 m!1191771))

(declare-fun m!1191783 () Bool)

(assert (=> b!1300192 m!1191783))

(declare-fun m!1191785 () Bool)

(assert (=> b!1300192 m!1191785))

(assert (=> b!1300192 m!1191777))

(declare-fun m!1191787 () Bool)

(assert (=> b!1300192 m!1191787))

(assert (=> b!1300192 m!1191775))

(declare-fun m!1191789 () Bool)

(assert (=> b!1300192 m!1191789))

(assert (=> b!1300192 m!1191769))

(declare-fun m!1191791 () Bool)

(assert (=> b!1300192 m!1191791))

(declare-fun m!1191793 () Bool)

(assert (=> b!1300201 m!1191793))

(assert (=> b!1300199 m!1191763))

(declare-fun m!1191795 () Bool)

(assert (=> b!1300199 m!1191795))

(declare-fun m!1191797 () Bool)

(assert (=> b!1300199 m!1191797))

(assert (=> b!1300199 m!1191763))

(declare-fun m!1191799 () Bool)

(assert (=> b!1300199 m!1191799))

(assert (=> b!1300199 m!1191795))

(assert (=> b!1300199 m!1191797))

(declare-fun m!1191801 () Bool)

(assert (=> b!1300199 m!1191801))

(assert (=> bm!63593 m!1191781))

(assert (=> b!1300197 m!1191763))

(assert (=> b!1300197 m!1191763))

(declare-fun m!1191803 () Bool)

(assert (=> b!1300197 m!1191803))

(assert (=> b!1300187 m!1191763))

(assert (=> b!1300187 m!1191763))

(declare-fun m!1191805 () Bool)

(assert (=> b!1300187 m!1191805))

(assert (=> d!141509 m!1191667))

(assert (=> b!1300188 m!1191763))

(assert (=> b!1300188 m!1191763))

(assert (=> b!1300188 m!1191805))

(declare-fun m!1191807 () Bool)

(assert (=> bm!63590 m!1191807))

(assert (=> b!1300048 d!141509))

(declare-fun d!141511 () Bool)

(assert (=> d!141511 (contains!8239 (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) k0!1205)))

(declare-fun lt!581313 () Unit!42971)

(declare-fun choose!1904 (array!86575 array!86577 (_ BitVec 32) (_ BitVec 32) V!51457 V!51457 (_ BitVec 64) (_ BitVec 32) Int) Unit!42971)

(assert (=> d!141511 (= lt!581313 (choose!1904 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(assert (=> d!141511 (validMask!0 mask!2175)))

(assert (=> d!141511 (= (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!52 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448) lt!581313)))

(declare-fun bs!37019 () Bool)

(assert (= bs!37019 d!141511))

(declare-fun m!1191809 () Bool)

(assert (=> bs!37019 m!1191809))

(assert (=> bs!37019 m!1191809))

(declare-fun m!1191811 () Bool)

(assert (=> bs!37019 m!1191811))

(declare-fun m!1191813 () Bool)

(assert (=> bs!37019 m!1191813))

(assert (=> bs!37019 m!1191667))

(assert (=> b!1300048 d!141511))

(declare-fun d!141513 () Bool)

(declare-fun res!863751 () Bool)

(declare-fun e!741860 () Bool)

(assert (=> d!141513 (=> res!863751 e!741860)))

(assert (=> d!141513 (= res!863751 (= (select (arr!41784 _keys!1741) from!2144) k0!1205))))

(assert (=> d!141513 (= (arrayContainsKey!0 _keys!1741 k0!1205 from!2144) e!741860)))

(declare-fun b!1300214 () Bool)

(declare-fun e!741861 () Bool)

(assert (=> b!1300214 (= e!741860 e!741861)))

(declare-fun res!863752 () Bool)

(assert (=> b!1300214 (=> (not res!863752) (not e!741861))))

(assert (=> b!1300214 (= res!863752 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42335 _keys!1741)))))

(declare-fun b!1300215 () Bool)

(assert (=> b!1300215 (= e!741861 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (= (and d!141513 (not res!863751)) b!1300214))

(assert (= (and b!1300214 res!863752) b!1300215))

(assert (=> d!141513 m!1191673))

(declare-fun m!1191815 () Bool)

(assert (=> b!1300215 m!1191815))

(assert (=> b!1300052 d!141513))

(declare-fun d!141515 () Bool)

(declare-fun res!863753 () Bool)

(declare-fun e!741862 () Bool)

(assert (=> d!141515 (=> res!863753 e!741862)))

(assert (=> d!141515 (= res!863753 (= (select (arr!41784 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)) k0!1205))))

(assert (=> d!141515 (= (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144)) e!741862)))

(declare-fun b!1300216 () Bool)

(declare-fun e!741863 () Bool)

(assert (=> b!1300216 (= e!741862 e!741863)))

(declare-fun res!863754 () Bool)

(assert (=> b!1300216 (=> (not res!863754) (not e!741863))))

(assert (=> b!1300216 (= res!863754 (bvslt (bvadd #b00000000000000000000000000000001 from!2144 #b00000000000000000000000000000001) (size!42335 _keys!1741)))))

(declare-fun b!1300217 () Bool)

(assert (=> b!1300217 (= e!741863 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144 #b00000000000000000000000000000001)))))

(assert (= (and d!141515 (not res!863753)) b!1300216))

(assert (= (and b!1300216 res!863754) b!1300217))

(assert (=> d!141515 m!1191763))

(declare-fun m!1191817 () Bool)

(assert (=> b!1300217 m!1191817))

(assert (=> b!1300052 d!141515))

(declare-fun d!141517 () Bool)

(declare-fun e!741866 () Bool)

(assert (=> d!141517 e!741866))

(declare-fun c!124841 () Bool)

(assert (=> d!141517 (= c!124841 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!581316 () Unit!42971)

(declare-fun choose!1905 (array!86575 array!86577 (_ BitVec 32) (_ BitVec 32) V!51457 V!51457 (_ BitVec 64) (_ BitVec 32) Int) Unit!42971)

(assert (=> d!141517 (= lt!581316 (choose!1905 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(assert (=> d!141517 (validMask!0 mask!2175)))

(assert (=> d!141517 (= (lemmaListMapContainsThenArrayContainsFrom!641 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) lt!581316)))

(declare-fun b!1300222 () Bool)

(assert (=> b!1300222 (= e!741866 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun b!1300223 () Bool)

(assert (=> b!1300223 (= e!741866 (ite (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!141517 c!124841) b!1300222))

(assert (= (and d!141517 (not c!124841)) b!1300223))

(declare-fun m!1191819 () Bool)

(assert (=> d!141517 m!1191819))

(assert (=> d!141517 m!1191667))

(assert (=> b!1300222 m!1191659))

(assert (=> b!1300052 d!141517))

(declare-fun d!141519 () Bool)

(declare-fun e!741867 () Bool)

(assert (=> d!141519 e!741867))

(declare-fun res!863755 () Bool)

(assert (=> d!141519 (=> res!863755 e!741867)))

(declare-fun lt!581319 () Bool)

(assert (=> d!141519 (= res!863755 (not lt!581319))))

(declare-fun lt!581317 () Bool)

(assert (=> d!141519 (= lt!581319 lt!581317)))

(declare-fun lt!581320 () Unit!42971)

(declare-fun e!741868 () Unit!42971)

(assert (=> d!141519 (= lt!581320 e!741868)))

(declare-fun c!124842 () Bool)

(assert (=> d!141519 (= c!124842 lt!581317)))

(assert (=> d!141519 (= lt!581317 (containsKey!717 (toList!10109 (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141519 (= (contains!8239 (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!581319)))

(declare-fun b!1300224 () Bool)

(declare-fun lt!581318 () Unit!42971)

(assert (=> b!1300224 (= e!741868 lt!581318)))

(assert (=> b!1300224 (= lt!581318 (lemmaContainsKeyImpliesGetValueByKeyDefined!463 (toList!10109 (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1300224 (isDefined!500 (getValueByKey!691 (toList!10109 (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1300225 () Bool)

(declare-fun Unit!42977 () Unit!42971)

(assert (=> b!1300225 (= e!741868 Unit!42977)))

(declare-fun b!1300226 () Bool)

(assert (=> b!1300226 (= e!741867 (isDefined!500 (getValueByKey!691 (toList!10109 (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141519 c!124842) b!1300224))

(assert (= (and d!141519 (not c!124842)) b!1300225))

(assert (= (and d!141519 (not res!863755)) b!1300226))

(declare-fun m!1191821 () Bool)

(assert (=> d!141519 m!1191821))

(declare-fun m!1191823 () Bool)

(assert (=> b!1300224 m!1191823))

(declare-fun m!1191825 () Bool)

(assert (=> b!1300224 m!1191825))

(assert (=> b!1300224 m!1191825))

(declare-fun m!1191827 () Bool)

(assert (=> b!1300224 m!1191827))

(assert (=> b!1300226 m!1191825))

(assert (=> b!1300226 m!1191825))

(assert (=> b!1300226 m!1191827))

(assert (=> b!1300051 d!141519))

(declare-fun b!1300227 () Bool)

(declare-fun e!741869 () Bool)

(assert (=> b!1300227 (= e!741869 (validKeyInArray!0 (select (arr!41784 _keys!1741) from!2144)))))

(declare-fun b!1300228 () Bool)

(declare-fun e!741878 () Bool)

(assert (=> b!1300228 (= e!741878 (validKeyInArray!0 (select (arr!41784 _keys!1741) from!2144)))))

(declare-fun b!1300229 () Bool)

(declare-fun e!741872 () Bool)

(declare-fun e!741876 () Bool)

(assert (=> b!1300229 (= e!741872 e!741876)))

(declare-fun res!863756 () Bool)

(declare-fun call!63604 () Bool)

(assert (=> b!1300229 (= res!863756 call!63604)))

(assert (=> b!1300229 (=> (not res!863756) (not e!741876))))

(declare-fun b!1300230 () Bool)

(declare-fun e!741877 () Bool)

(assert (=> b!1300230 (= e!741877 e!741872)))

(declare-fun c!124847 () Bool)

(assert (=> b!1300230 (= c!124847 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1300231 () Bool)

(declare-fun e!741874 () ListLongMap!20187)

(declare-fun call!63599 () ListLongMap!20187)

(assert (=> b!1300231 (= e!741874 call!63599)))

(declare-fun b!1300232 () Bool)

(declare-fun e!741871 () Unit!42971)

(declare-fun lt!581339 () Unit!42971)

(assert (=> b!1300232 (= e!741871 lt!581339)))

(declare-fun lt!581338 () ListLongMap!20187)

(assert (=> b!1300232 (= lt!581338 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581331 () (_ BitVec 64))

(assert (=> b!1300232 (= lt!581331 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581326 () (_ BitVec 64))

(assert (=> b!1300232 (= lt!581326 (select (arr!41784 _keys!1741) from!2144))))

(declare-fun lt!581336 () Unit!42971)

(assert (=> b!1300232 (= lt!581336 (addStillContains!1108 lt!581338 lt!581331 zeroValue!1387 lt!581326))))

(assert (=> b!1300232 (contains!8239 (+!4487 lt!581338 (tuple2!22523 lt!581331 zeroValue!1387)) lt!581326)))

(declare-fun lt!581328 () Unit!42971)

(assert (=> b!1300232 (= lt!581328 lt!581336)))

(declare-fun lt!581322 () ListLongMap!20187)

(assert (=> b!1300232 (= lt!581322 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581323 () (_ BitVec 64))

(assert (=> b!1300232 (= lt!581323 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581330 () (_ BitVec 64))

(assert (=> b!1300232 (= lt!581330 (select (arr!41784 _keys!1741) from!2144))))

(declare-fun lt!581333 () Unit!42971)

(assert (=> b!1300232 (= lt!581333 (addApplyDifferent!550 lt!581322 lt!581323 minValue!1387 lt!581330))))

(assert (=> b!1300232 (= (apply!1021 (+!4487 lt!581322 (tuple2!22523 lt!581323 minValue!1387)) lt!581330) (apply!1021 lt!581322 lt!581330))))

(declare-fun lt!581325 () Unit!42971)

(assert (=> b!1300232 (= lt!581325 lt!581333)))

(declare-fun lt!581321 () ListLongMap!20187)

(assert (=> b!1300232 (= lt!581321 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581329 () (_ BitVec 64))

(assert (=> b!1300232 (= lt!581329 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581337 () (_ BitVec 64))

(assert (=> b!1300232 (= lt!581337 (select (arr!41784 _keys!1741) from!2144))))

(declare-fun lt!581340 () Unit!42971)

(assert (=> b!1300232 (= lt!581340 (addApplyDifferent!550 lt!581321 lt!581329 zeroValue!1387 lt!581337))))

(assert (=> b!1300232 (= (apply!1021 (+!4487 lt!581321 (tuple2!22523 lt!581329 zeroValue!1387)) lt!581337) (apply!1021 lt!581321 lt!581337))))

(declare-fun lt!581332 () Unit!42971)

(assert (=> b!1300232 (= lt!581332 lt!581340)))

(declare-fun lt!581342 () ListLongMap!20187)

(assert (=> b!1300232 (= lt!581342 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581341 () (_ BitVec 64))

(assert (=> b!1300232 (= lt!581341 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581324 () (_ BitVec 64))

(assert (=> b!1300232 (= lt!581324 (select (arr!41784 _keys!1741) from!2144))))

(assert (=> b!1300232 (= lt!581339 (addApplyDifferent!550 lt!581342 lt!581341 minValue!1387 lt!581324))))

(assert (=> b!1300232 (= (apply!1021 (+!4487 lt!581342 (tuple2!22523 lt!581341 minValue!1387)) lt!581324) (apply!1021 lt!581342 lt!581324))))

(declare-fun call!63601 () ListLongMap!20187)

(declare-fun call!63605 () ListLongMap!20187)

(declare-fun c!124848 () Bool)

(declare-fun bm!63596 () Bool)

(declare-fun c!124846 () Bool)

(declare-fun call!63603 () ListLongMap!20187)

(assert (=> bm!63596 (= call!63605 (+!4487 (ite c!124846 call!63601 (ite c!124848 call!63603 call!63599)) (ite (or c!124846 c!124848) (tuple2!22523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun bm!63597 () Bool)

(declare-fun lt!581335 () ListLongMap!20187)

(assert (=> bm!63597 (= call!63604 (contains!8239 lt!581335 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1300233 () Bool)

(declare-fun call!63602 () ListLongMap!20187)

(assert (=> b!1300233 (= e!741874 call!63602)))

(declare-fun bm!63598 () Bool)

(assert (=> bm!63598 (= call!63599 call!63603)))

(declare-fun b!1300234 () Bool)

(assert (=> b!1300234 (= e!741876 (= (apply!1021 lt!581335 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1300235 () Bool)

(declare-fun e!741881 () Bool)

(declare-fun e!741870 () Bool)

(assert (=> b!1300235 (= e!741881 e!741870)))

(declare-fun res!863763 () Bool)

(declare-fun call!63600 () Bool)

(assert (=> b!1300235 (= res!863763 call!63600)))

(assert (=> b!1300235 (=> (not res!863763) (not e!741870))))

(declare-fun b!1300236 () Bool)

(declare-fun c!124845 () Bool)

(assert (=> b!1300236 (= c!124845 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!741880 () ListLongMap!20187)

(assert (=> b!1300236 (= e!741880 e!741874)))

(declare-fun b!1300237 () Bool)

(declare-fun e!741879 () Bool)

(declare-fun e!741873 () Bool)

(assert (=> b!1300237 (= e!741879 e!741873)))

(declare-fun res!863764 () Bool)

(assert (=> b!1300237 (=> (not res!863764) (not e!741873))))

(assert (=> b!1300237 (= res!863764 (contains!8239 lt!581335 (select (arr!41784 _keys!1741) from!2144)))))

(assert (=> b!1300237 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42335 _keys!1741)))))

(declare-fun b!1300238 () Bool)

(assert (=> b!1300238 (= e!741881 (not call!63600))))

(declare-fun bm!63599 () Bool)

(assert (=> bm!63599 (= call!63602 call!63605)))

(declare-fun b!1300239 () Bool)

(assert (=> b!1300239 (= e!741873 (= (apply!1021 lt!581335 (select (arr!41784 _keys!1741) from!2144)) (get!21149 (select (arr!41785 _values!1445) from!2144) (dynLambda!3478 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1300239 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42336 _values!1445)))))

(assert (=> b!1300239 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42335 _keys!1741)))))

(declare-fun b!1300240 () Bool)

(assert (=> b!1300240 (= e!741870 (= (apply!1021 lt!581335 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1300241 () Bool)

(declare-fun e!741875 () ListLongMap!20187)

(assert (=> b!1300241 (= e!741875 (+!4487 call!63605 (tuple2!22523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun bm!63600 () Bool)

(assert (=> bm!63600 (= call!63601 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1300242 () Bool)

(declare-fun Unit!42978 () Unit!42971)

(assert (=> b!1300242 (= e!741871 Unit!42978)))

(declare-fun b!1300243 () Bool)

(assert (=> b!1300243 (= e!741872 (not call!63604))))

(declare-fun b!1300244 () Bool)

(assert (=> b!1300244 (= e!741875 e!741880)))

(assert (=> b!1300244 (= c!124848 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1300245 () Bool)

(assert (=> b!1300245 (= e!741880 call!63602)))

(declare-fun bm!63601 () Bool)

(assert (=> bm!63601 (= call!63603 call!63601)))

(declare-fun b!1300246 () Bool)

(declare-fun res!863757 () Bool)

(assert (=> b!1300246 (=> (not res!863757) (not e!741877))))

(assert (=> b!1300246 (= res!863757 e!741879)))

(declare-fun res!863761 () Bool)

(assert (=> b!1300246 (=> res!863761 e!741879)))

(assert (=> b!1300246 (= res!863761 (not e!741878))))

(declare-fun res!863758 () Bool)

(assert (=> b!1300246 (=> (not res!863758) (not e!741878))))

(assert (=> b!1300246 (= res!863758 (bvslt from!2144 (size!42335 _keys!1741)))))

(declare-fun b!1300247 () Bool)

(declare-fun res!863760 () Bool)

(assert (=> b!1300247 (=> (not res!863760) (not e!741877))))

(assert (=> b!1300247 (= res!863760 e!741881)))

(declare-fun c!124844 () Bool)

(assert (=> b!1300247 (= c!124844 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!141521 () Bool)

(assert (=> d!141521 e!741877))

(declare-fun res!863762 () Bool)

(assert (=> d!141521 (=> (not res!863762) (not e!741877))))

(assert (=> d!141521 (= res!863762 (or (bvsge from!2144 (size!42335 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42335 _keys!1741)))))))

(declare-fun lt!581327 () ListLongMap!20187)

(assert (=> d!141521 (= lt!581335 lt!581327)))

(declare-fun lt!581334 () Unit!42971)

(assert (=> d!141521 (= lt!581334 e!741871)))

(declare-fun c!124843 () Bool)

(assert (=> d!141521 (= c!124843 e!741869)))

(declare-fun res!863759 () Bool)

(assert (=> d!141521 (=> (not res!863759) (not e!741869))))

(assert (=> d!141521 (= res!863759 (bvslt from!2144 (size!42335 _keys!1741)))))

(assert (=> d!141521 (= lt!581327 e!741875)))

(assert (=> d!141521 (= c!124846 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141521 (validMask!0 mask!2175)))

(assert (=> d!141521 (= (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581335)))

(declare-fun bm!63602 () Bool)

(assert (=> bm!63602 (= call!63600 (contains!8239 lt!581335 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!141521 c!124846) b!1300241))

(assert (= (and d!141521 (not c!124846)) b!1300244))

(assert (= (and b!1300244 c!124848) b!1300245))

(assert (= (and b!1300244 (not c!124848)) b!1300236))

(assert (= (and b!1300236 c!124845) b!1300233))

(assert (= (and b!1300236 (not c!124845)) b!1300231))

(assert (= (or b!1300233 b!1300231) bm!63598))

(assert (= (or b!1300245 bm!63598) bm!63601))

(assert (= (or b!1300245 b!1300233) bm!63599))

(assert (= (or b!1300241 bm!63601) bm!63600))

(assert (= (or b!1300241 bm!63599) bm!63596))

(assert (= (and d!141521 res!863759) b!1300227))

(assert (= (and d!141521 c!124843) b!1300232))

(assert (= (and d!141521 (not c!124843)) b!1300242))

(assert (= (and d!141521 res!863762) b!1300246))

(assert (= (and b!1300246 res!863758) b!1300228))

(assert (= (and b!1300246 (not res!863761)) b!1300237))

(assert (= (and b!1300237 res!863764) b!1300239))

(assert (= (and b!1300246 res!863757) b!1300247))

(assert (= (and b!1300247 c!124844) b!1300235))

(assert (= (and b!1300247 (not c!124844)) b!1300238))

(assert (= (and b!1300235 res!863763) b!1300240))

(assert (= (or b!1300235 b!1300238) bm!63602))

(assert (= (and b!1300247 res!863760) b!1300230))

(assert (= (and b!1300230 c!124847) b!1300229))

(assert (= (and b!1300230 (not c!124847)) b!1300243))

(assert (= (and b!1300229 res!863756) b!1300234))

(assert (= (or b!1300229 b!1300243) bm!63597))

(declare-fun b_lambda!23133 () Bool)

(assert (=> (not b_lambda!23133) (not b!1300239)))

(assert (=> b!1300239 t!43242))

(declare-fun b_and!47225 () Bool)

(assert (= b_and!47223 (and (=> t!43242 result!23731) b_and!47225)))

(declare-fun m!1191829 () Bool)

(assert (=> bm!63602 m!1191829))

(declare-fun m!1191831 () Bool)

(assert (=> b!1300240 m!1191831))

(declare-fun m!1191833 () Bool)

(assert (=> bm!63596 m!1191833))

(declare-fun m!1191835 () Bool)

(assert (=> b!1300234 m!1191835))

(declare-fun m!1191837 () Bool)

(assert (=> b!1300232 m!1191837))

(declare-fun m!1191839 () Bool)

(assert (=> b!1300232 m!1191839))

(assert (=> b!1300232 m!1191673))

(declare-fun m!1191841 () Bool)

(assert (=> b!1300232 m!1191841))

(declare-fun m!1191843 () Bool)

(assert (=> b!1300232 m!1191843))

(declare-fun m!1191845 () Bool)

(assert (=> b!1300232 m!1191845))

(declare-fun m!1191847 () Bool)

(assert (=> b!1300232 m!1191847))

(declare-fun m!1191849 () Bool)

(assert (=> b!1300232 m!1191849))

(declare-fun m!1191851 () Bool)

(assert (=> b!1300232 m!1191851))

(declare-fun m!1191853 () Bool)

(assert (=> b!1300232 m!1191853))

(declare-fun m!1191855 () Bool)

(assert (=> b!1300232 m!1191855))

(declare-fun m!1191857 () Bool)

(assert (=> b!1300232 m!1191857))

(assert (=> b!1300232 m!1191847))

(declare-fun m!1191859 () Bool)

(assert (=> b!1300232 m!1191859))

(declare-fun m!1191861 () Bool)

(assert (=> b!1300232 m!1191861))

(assert (=> b!1300232 m!1191853))

(declare-fun m!1191863 () Bool)

(assert (=> b!1300232 m!1191863))

(assert (=> b!1300232 m!1191851))

(declare-fun m!1191865 () Bool)

(assert (=> b!1300232 m!1191865))

(assert (=> b!1300232 m!1191845))

(declare-fun m!1191867 () Bool)

(assert (=> b!1300232 m!1191867))

(declare-fun m!1191869 () Bool)

(assert (=> b!1300241 m!1191869))

(assert (=> b!1300239 m!1191673))

(declare-fun m!1191871 () Bool)

(assert (=> b!1300239 m!1191871))

(assert (=> b!1300239 m!1191797))

(assert (=> b!1300239 m!1191673))

(declare-fun m!1191873 () Bool)

(assert (=> b!1300239 m!1191873))

(assert (=> b!1300239 m!1191871))

(assert (=> b!1300239 m!1191797))

(declare-fun m!1191875 () Bool)

(assert (=> b!1300239 m!1191875))

(assert (=> bm!63600 m!1191857))

(assert (=> b!1300237 m!1191673))

(assert (=> b!1300237 m!1191673))

(declare-fun m!1191877 () Bool)

(assert (=> b!1300237 m!1191877))

(assert (=> b!1300227 m!1191673))

(assert (=> b!1300227 m!1191673))

(declare-fun m!1191879 () Bool)

(assert (=> b!1300227 m!1191879))

(assert (=> d!141521 m!1191667))

(assert (=> b!1300228 m!1191673))

(assert (=> b!1300228 m!1191673))

(assert (=> b!1300228 m!1191879))

(declare-fun m!1191881 () Bool)

(assert (=> bm!63597 m!1191881))

(assert (=> b!1300051 d!141521))

(declare-fun b!1300256 () Bool)

(declare-fun e!741890 () Bool)

(declare-fun e!741889 () Bool)

(assert (=> b!1300256 (= e!741890 e!741889)))

(declare-fun lt!581351 () (_ BitVec 64))

(assert (=> b!1300256 (= lt!581351 (select (arr!41784 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!581350 () Unit!42971)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86575 (_ BitVec 64) (_ BitVec 32)) Unit!42971)

(assert (=> b!1300256 (= lt!581350 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!581351 #b00000000000000000000000000000000))))

(assert (=> b!1300256 (arrayContainsKey!0 _keys!1741 lt!581351 #b00000000000000000000000000000000)))

(declare-fun lt!581349 () Unit!42971)

(assert (=> b!1300256 (= lt!581349 lt!581350)))

(declare-fun res!863769 () Bool)

(declare-datatypes ((SeekEntryResult!9971 0))(
  ( (MissingZero!9971 (index!42255 (_ BitVec 32))) (Found!9971 (index!42256 (_ BitVec 32))) (Intermediate!9971 (undefined!10783 Bool) (index!42257 (_ BitVec 32)) (x!115361 (_ BitVec 32))) (Undefined!9971) (MissingVacant!9971 (index!42258 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86575 (_ BitVec 32)) SeekEntryResult!9971)

(assert (=> b!1300256 (= res!863769 (= (seekEntryOrOpen!0 (select (arr!41784 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9971 #b00000000000000000000000000000000)))))

(assert (=> b!1300256 (=> (not res!863769) (not e!741889))))

(declare-fun b!1300257 () Bool)

(declare-fun call!63608 () Bool)

(assert (=> b!1300257 (= e!741890 call!63608)))

(declare-fun d!141523 () Bool)

(declare-fun res!863770 () Bool)

(declare-fun e!741888 () Bool)

(assert (=> d!141523 (=> res!863770 e!741888)))

(assert (=> d!141523 (= res!863770 (bvsge #b00000000000000000000000000000000 (size!42335 _keys!1741)))))

(assert (=> d!141523 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!741888)))

(declare-fun b!1300258 () Bool)

(assert (=> b!1300258 (= e!741889 call!63608)))

(declare-fun bm!63605 () Bool)

(assert (=> bm!63605 (= call!63608 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1300259 () Bool)

(assert (=> b!1300259 (= e!741888 e!741890)))

(declare-fun c!124851 () Bool)

(assert (=> b!1300259 (= c!124851 (validKeyInArray!0 (select (arr!41784 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141523 (not res!863770)) b!1300259))

(assert (= (and b!1300259 c!124851) b!1300256))

(assert (= (and b!1300259 (not c!124851)) b!1300257))

(assert (= (and b!1300256 res!863769) b!1300258))

(assert (= (or b!1300258 b!1300257) bm!63605))

(assert (=> b!1300256 m!1191735))

(declare-fun m!1191883 () Bool)

(assert (=> b!1300256 m!1191883))

(declare-fun m!1191885 () Bool)

(assert (=> b!1300256 m!1191885))

(assert (=> b!1300256 m!1191735))

(declare-fun m!1191887 () Bool)

(assert (=> b!1300256 m!1191887))

(declare-fun m!1191889 () Bool)

(assert (=> bm!63605 m!1191889))

(assert (=> b!1300259 m!1191735))

(assert (=> b!1300259 m!1191735))

(assert (=> b!1300259 m!1191739))

(assert (=> b!1300047 d!141523))

(declare-fun b!1300266 () Bool)

(declare-fun e!741895 () Bool)

(assert (=> b!1300266 (= e!741895 tp_is_empty!34765)))

(declare-fun b!1300267 () Bool)

(declare-fun e!741896 () Bool)

(assert (=> b!1300267 (= e!741896 tp_is_empty!34765)))

(declare-fun mapIsEmpty!53717 () Bool)

(declare-fun mapRes!53717 () Bool)

(assert (=> mapIsEmpty!53717 mapRes!53717))

(declare-fun condMapEmpty!53717 () Bool)

(declare-fun mapDefault!53717 () ValueCell!16484)

(assert (=> mapNonEmpty!53708 (= condMapEmpty!53717 (= mapRest!53708 ((as const (Array (_ BitVec 32) ValueCell!16484)) mapDefault!53717)))))

(assert (=> mapNonEmpty!53708 (= tp!102494 (and e!741896 mapRes!53717))))

(declare-fun mapNonEmpty!53717 () Bool)

(declare-fun tp!102509 () Bool)

(assert (=> mapNonEmpty!53717 (= mapRes!53717 (and tp!102509 e!741895))))

(declare-fun mapKey!53717 () (_ BitVec 32))

(declare-fun mapValue!53717 () ValueCell!16484)

(declare-fun mapRest!53717 () (Array (_ BitVec 32) ValueCell!16484))

(assert (=> mapNonEmpty!53717 (= mapRest!53708 (store mapRest!53717 mapKey!53717 mapValue!53717))))

(assert (= (and mapNonEmpty!53708 condMapEmpty!53717) mapIsEmpty!53717))

(assert (= (and mapNonEmpty!53708 (not condMapEmpty!53717)) mapNonEmpty!53717))

(assert (= (and mapNonEmpty!53717 ((_ is ValueCellFull!16484) mapValue!53717)) b!1300266))

(assert (= (and mapNonEmpty!53708 ((_ is ValueCellFull!16484) mapDefault!53717)) b!1300267))

(declare-fun m!1191891 () Bool)

(assert (=> mapNonEmpty!53717 m!1191891))

(declare-fun b_lambda!23135 () Bool)

(assert (= b_lambda!23133 (or (and start!109860 b_free!29125) b_lambda!23135)))

(declare-fun b_lambda!23137 () Bool)

(assert (= b_lambda!23131 (or (and start!109860 b_free!29125) b_lambda!23137)))

(check-sat (not d!141507) b_and!47225 (not b!1300200) (not b!1300237) (not d!141511) (not b!1300241) (not bm!63574) (not b!1300234) (not b!1300142) (not bm!63600) (not b!1300188) (not b!1300256) (not bm!63597) (not d!141521) (not b!1300131) (not bm!63589) (not b!1300144) (not bm!63605) (not b!1300232) (not b!1300228) tp_is_empty!34765 (not b_next!29125) (not b!1300194) (not d!141509) (not d!141519) (not bm!63593) (not b!1300192) (not b!1300215) (not b!1300240) (not b!1300259) (not b!1300239) (not bm!63596) (not b!1300187) (not bm!63602) (not b!1300201) (not b!1300222) (not bm!63595) (not d!141517) (not b!1300217) (not b!1300132) (not bm!63590) (not b_lambda!23135) (not b!1300199) (not b!1300224) (not mapNonEmpty!53717) (not b!1300197) (not b!1300226) (not b!1300227) (not b!1300135) (not b_lambda!23137))
(check-sat b_and!47225 (not b_next!29125))
