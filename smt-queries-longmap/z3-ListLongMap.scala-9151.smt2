; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109990 () Bool)

(assert start!109990)

(declare-fun b_free!29179 () Bool)

(declare-fun b_next!29179 () Bool)

(assert (=> start!109990 (= b_free!29179 (not b_next!29179))))

(declare-fun tp!102667 () Bool)

(declare-fun b_and!47289 () Bool)

(assert (=> start!109990 (= tp!102667 b_and!47289)))

(declare-fun b!1301527 () Bool)

(declare-fun e!742544 () Bool)

(declare-fun tp_is_empty!34819 () Bool)

(assert (=> b!1301527 (= e!742544 tp_is_empty!34819)))

(declare-fun b!1301528 () Bool)

(declare-fun res!864571 () Bool)

(declare-fun e!742543 () Bool)

(assert (=> b!1301528 (=> (not res!864571) (not e!742543))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86689 0))(
  ( (array!86690 (arr!41837 (Array (_ BitVec 32) (_ BitVec 64))) (size!42388 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86689)

(assert (=> b!1301528 (= res!864571 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42388 _keys!1741))))))

(declare-fun b!1301529 () Bool)

(declare-fun e!742542 () Bool)

(assert (=> b!1301529 (= e!742542 tp_is_empty!34819)))

(declare-datatypes ((V!51529 0))(
  ( (V!51530 (val!17484 Int)) )
))
(declare-fun minValue!1387 () V!51529)

(declare-fun zeroValue!1387 () V!51529)

(declare-datatypes ((ValueCell!16511 0))(
  ( (ValueCellFull!16511 (v!20086 V!51529)) (EmptyCell!16511) )
))
(declare-datatypes ((array!86691 0))(
  ( (array!86692 (arr!41838 (Array (_ BitVec 32) ValueCell!16511)) (size!42389 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86691)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun b!1301530 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22566 0))(
  ( (tuple2!22567 (_1!11294 (_ BitVec 64)) (_2!11294 V!51529)) )
))
(declare-datatypes ((List!29725 0))(
  ( (Nil!29722) (Cons!29721 (h!30939 tuple2!22566) (t!43289 List!29725)) )
))
(declare-datatypes ((ListLongMap!20231 0))(
  ( (ListLongMap!20232 (toList!10131 List!29725)) )
))
(declare-fun contains!8267 (ListLongMap!20231 (_ BitVec 64)) Bool)

(declare-fun +!4502 (ListLongMap!20231 tuple2!22566) ListLongMap!20231)

(declare-fun getCurrentListMapNoExtraKeys!6142 (array!86689 array!86691 (_ BitVec 32) (_ BitVec 32) V!51529 V!51529 (_ BitVec 32) Int) ListLongMap!20231)

(assert (=> b!1301530 (= e!742543 (not (contains!8267 (+!4502 (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205)))))

(declare-fun b!1301531 () Bool)

(declare-fun res!864566 () Bool)

(assert (=> b!1301531 (=> (not res!864566) (not e!742543))))

(declare-datatypes ((List!29726 0))(
  ( (Nil!29723) (Cons!29722 (h!30940 (_ BitVec 64)) (t!43290 List!29726)) )
))
(declare-fun arrayNoDuplicates!0 (array!86689 (_ BitVec 32) List!29726) Bool)

(assert (=> b!1301531 (= res!864566 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29723))))

(declare-fun mapNonEmpty!53801 () Bool)

(declare-fun mapRes!53801 () Bool)

(declare-fun tp!102668 () Bool)

(assert (=> mapNonEmpty!53801 (= mapRes!53801 (and tp!102668 e!742544))))

(declare-fun mapKey!53801 () (_ BitVec 32))

(declare-fun mapRest!53801 () (Array (_ BitVec 32) ValueCell!16511))

(declare-fun mapValue!53801 () ValueCell!16511)

(assert (=> mapNonEmpty!53801 (= (arr!41838 _values!1445) (store mapRest!53801 mapKey!53801 mapValue!53801))))

(declare-fun b!1301532 () Bool)

(declare-fun e!742546 () Bool)

(assert (=> b!1301532 (= e!742546 (and e!742542 mapRes!53801))))

(declare-fun condMapEmpty!53801 () Bool)

(declare-fun mapDefault!53801 () ValueCell!16511)

(assert (=> b!1301532 (= condMapEmpty!53801 (= (arr!41838 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16511)) mapDefault!53801)))))

(declare-fun b!1301533 () Bool)

(declare-fun res!864570 () Bool)

(assert (=> b!1301533 (=> (not res!864570) (not e!742543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86689 (_ BitVec 32)) Bool)

(assert (=> b!1301533 (= res!864570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1301534 () Bool)

(declare-fun res!864569 () Bool)

(assert (=> b!1301534 (=> (not res!864569) (not e!742543))))

(assert (=> b!1301534 (= res!864569 (and (= (size!42389 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42388 _keys!1741) (size!42389 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1301535 () Bool)

(declare-fun res!864565 () Bool)

(assert (=> b!1301535 (=> (not res!864565) (not e!742543))))

(assert (=> b!1301535 (= res!864565 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1301536 () Bool)

(declare-fun res!864567 () Bool)

(assert (=> b!1301536 (=> (not res!864567) (not e!742543))))

(assert (=> b!1301536 (= res!864567 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42388 _keys!1741))))))

(declare-fun mapIsEmpty!53801 () Bool)

(assert (=> mapIsEmpty!53801 mapRes!53801))

(declare-fun res!864568 () Bool)

(assert (=> start!109990 (=> (not res!864568) (not e!742543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109990 (= res!864568 (validMask!0 mask!2175))))

(assert (=> start!109990 e!742543))

(assert (=> start!109990 tp_is_empty!34819))

(assert (=> start!109990 true))

(declare-fun array_inv!31895 (array!86691) Bool)

(assert (=> start!109990 (and (array_inv!31895 _values!1445) e!742546)))

(declare-fun array_inv!31896 (array!86689) Bool)

(assert (=> start!109990 (array_inv!31896 _keys!1741)))

(assert (=> start!109990 tp!102667))

(declare-fun b!1301537 () Bool)

(declare-fun res!864572 () Bool)

(assert (=> b!1301537 (=> (not res!864572) (not e!742543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301537 (= res!864572 (validKeyInArray!0 (select (arr!41837 _keys!1741) from!2144)))))

(declare-fun b!1301538 () Bool)

(declare-fun res!864564 () Bool)

(assert (=> b!1301538 (=> (not res!864564) (not e!742543))))

(declare-fun getCurrentListMap!5147 (array!86689 array!86691 (_ BitVec 32) (_ BitVec 32) V!51529 V!51529 (_ BitVec 32) Int) ListLongMap!20231)

(assert (=> b!1301538 (= res!864564 (contains!8267 (getCurrentListMap!5147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109990 res!864568) b!1301534))

(assert (= (and b!1301534 res!864569) b!1301533))

(assert (= (and b!1301533 res!864570) b!1301531))

(assert (= (and b!1301531 res!864566) b!1301528))

(assert (= (and b!1301528 res!864571) b!1301538))

(assert (= (and b!1301538 res!864564) b!1301536))

(assert (= (and b!1301536 res!864567) b!1301537))

(assert (= (and b!1301537 res!864572) b!1301535))

(assert (= (and b!1301535 res!864565) b!1301530))

(assert (= (and b!1301532 condMapEmpty!53801) mapIsEmpty!53801))

(assert (= (and b!1301532 (not condMapEmpty!53801)) mapNonEmpty!53801))

(get-info :version)

(assert (= (and mapNonEmpty!53801 ((_ is ValueCellFull!16511) mapValue!53801)) b!1301527))

(assert (= (and b!1301532 ((_ is ValueCellFull!16511) mapDefault!53801)) b!1301529))

(assert (= start!109990 b!1301532))

(declare-fun m!1192825 () Bool)

(assert (=> start!109990 m!1192825))

(declare-fun m!1192827 () Bool)

(assert (=> start!109990 m!1192827))

(declare-fun m!1192829 () Bool)

(assert (=> start!109990 m!1192829))

(declare-fun m!1192831 () Bool)

(assert (=> b!1301531 m!1192831))

(declare-fun m!1192833 () Bool)

(assert (=> mapNonEmpty!53801 m!1192833))

(declare-fun m!1192835 () Bool)

(assert (=> b!1301538 m!1192835))

(assert (=> b!1301538 m!1192835))

(declare-fun m!1192837 () Bool)

(assert (=> b!1301538 m!1192837))

(declare-fun m!1192839 () Bool)

(assert (=> b!1301537 m!1192839))

(assert (=> b!1301537 m!1192839))

(declare-fun m!1192841 () Bool)

(assert (=> b!1301537 m!1192841))

(declare-fun m!1192843 () Bool)

(assert (=> b!1301530 m!1192843))

(assert (=> b!1301530 m!1192843))

(declare-fun m!1192845 () Bool)

(assert (=> b!1301530 m!1192845))

(assert (=> b!1301530 m!1192845))

(declare-fun m!1192847 () Bool)

(assert (=> b!1301530 m!1192847))

(declare-fun m!1192849 () Bool)

(assert (=> b!1301533 m!1192849))

(check-sat b_and!47289 (not start!109990) (not b!1301533) tp_is_empty!34819 (not b!1301530) (not b!1301537) (not mapNonEmpty!53801) (not b!1301531) (not b_next!29179) (not b!1301538))
(check-sat b_and!47289 (not b_next!29179))
(get-model)

(declare-fun b!1301621 () Bool)

(declare-fun e!742588 () Bool)

(declare-fun call!63698 () Bool)

(assert (=> b!1301621 (= e!742588 call!63698)))

(declare-fun b!1301622 () Bool)

(assert (=> b!1301622 (= e!742588 call!63698)))

(declare-fun b!1301623 () Bool)

(declare-fun e!742585 () Bool)

(assert (=> b!1301623 (= e!742585 e!742588)))

(declare-fun c!124961 () Bool)

(assert (=> b!1301623 (= c!124961 (validKeyInArray!0 (select (arr!41837 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!63695 () Bool)

(assert (=> bm!63695 (= call!63698 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124961 (Cons!29722 (select (arr!41837 _keys!1741) #b00000000000000000000000000000000) Nil!29723) Nil!29723)))))

(declare-fun b!1301624 () Bool)

(declare-fun e!742587 () Bool)

(assert (=> b!1301624 (= e!742587 e!742585)))

(declare-fun res!864634 () Bool)

(assert (=> b!1301624 (=> (not res!864634) (not e!742585))))

(declare-fun e!742586 () Bool)

(assert (=> b!1301624 (= res!864634 (not e!742586))))

(declare-fun res!864635 () Bool)

(assert (=> b!1301624 (=> (not res!864635) (not e!742586))))

(assert (=> b!1301624 (= res!864635 (validKeyInArray!0 (select (arr!41837 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141605 () Bool)

(declare-fun res!864633 () Bool)

(assert (=> d!141605 (=> res!864633 e!742587)))

(assert (=> d!141605 (= res!864633 (bvsge #b00000000000000000000000000000000 (size!42388 _keys!1741)))))

(assert (=> d!141605 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29723) e!742587)))

(declare-fun b!1301625 () Bool)

(declare-fun contains!8268 (List!29726 (_ BitVec 64)) Bool)

(assert (=> b!1301625 (= e!742586 (contains!8268 Nil!29723 (select (arr!41837 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141605 (not res!864633)) b!1301624))

(assert (= (and b!1301624 res!864635) b!1301625))

(assert (= (and b!1301624 res!864634) b!1301623))

(assert (= (and b!1301623 c!124961) b!1301622))

(assert (= (and b!1301623 (not c!124961)) b!1301621))

(assert (= (or b!1301622 b!1301621) bm!63695))

(declare-fun m!1192903 () Bool)

(assert (=> b!1301623 m!1192903))

(assert (=> b!1301623 m!1192903))

(declare-fun m!1192905 () Bool)

(assert (=> b!1301623 m!1192905))

(assert (=> bm!63695 m!1192903))

(declare-fun m!1192907 () Bool)

(assert (=> bm!63695 m!1192907))

(assert (=> b!1301624 m!1192903))

(assert (=> b!1301624 m!1192903))

(assert (=> b!1301624 m!1192905))

(assert (=> b!1301625 m!1192903))

(assert (=> b!1301625 m!1192903))

(declare-fun m!1192909 () Bool)

(assert (=> b!1301625 m!1192909))

(assert (=> b!1301531 d!141605))

(declare-fun d!141607 () Bool)

(assert (=> d!141607 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109990 d!141607))

(declare-fun d!141609 () Bool)

(assert (=> d!141609 (= (array_inv!31895 _values!1445) (bvsge (size!42389 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109990 d!141609))

(declare-fun d!141611 () Bool)

(assert (=> d!141611 (= (array_inv!31896 _keys!1741) (bvsge (size!42388 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109990 d!141611))

(declare-fun b!1301634 () Bool)

(declare-fun e!742595 () Bool)

(declare-fun e!742596 () Bool)

(assert (=> b!1301634 (= e!742595 e!742596)))

(declare-fun lt!581762 () (_ BitVec 64))

(assert (=> b!1301634 (= lt!581762 (select (arr!41837 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43003 0))(
  ( (Unit!43004) )
))
(declare-fun lt!581761 () Unit!43003)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86689 (_ BitVec 64) (_ BitVec 32)) Unit!43003)

(assert (=> b!1301634 (= lt!581761 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!581762 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1301634 (arrayContainsKey!0 _keys!1741 lt!581762 #b00000000000000000000000000000000)))

(declare-fun lt!581760 () Unit!43003)

(assert (=> b!1301634 (= lt!581760 lt!581761)))

(declare-fun res!864640 () Bool)

(declare-datatypes ((SeekEntryResult!9975 0))(
  ( (MissingZero!9975 (index!42271 (_ BitVec 32))) (Found!9975 (index!42272 (_ BitVec 32))) (Intermediate!9975 (undefined!10787 Bool) (index!42273 (_ BitVec 32)) (x!115480 (_ BitVec 32))) (Undefined!9975) (MissingVacant!9975 (index!42274 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86689 (_ BitVec 32)) SeekEntryResult!9975)

(assert (=> b!1301634 (= res!864640 (= (seekEntryOrOpen!0 (select (arr!41837 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9975 #b00000000000000000000000000000000)))))

(assert (=> b!1301634 (=> (not res!864640) (not e!742596))))

(declare-fun bm!63698 () Bool)

(declare-fun call!63701 () Bool)

(assert (=> bm!63698 (= call!63701 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1301635 () Bool)

(assert (=> b!1301635 (= e!742596 call!63701)))

(declare-fun b!1301636 () Bool)

(assert (=> b!1301636 (= e!742595 call!63701)))

(declare-fun b!1301637 () Bool)

(declare-fun e!742597 () Bool)

(assert (=> b!1301637 (= e!742597 e!742595)))

(declare-fun c!124964 () Bool)

(assert (=> b!1301637 (= c!124964 (validKeyInArray!0 (select (arr!41837 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141613 () Bool)

(declare-fun res!864641 () Bool)

(assert (=> d!141613 (=> res!864641 e!742597)))

(assert (=> d!141613 (= res!864641 (bvsge #b00000000000000000000000000000000 (size!42388 _keys!1741)))))

(assert (=> d!141613 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!742597)))

(assert (= (and d!141613 (not res!864641)) b!1301637))

(assert (= (and b!1301637 c!124964) b!1301634))

(assert (= (and b!1301637 (not c!124964)) b!1301636))

(assert (= (and b!1301634 res!864640) b!1301635))

(assert (= (or b!1301635 b!1301636) bm!63698))

(assert (=> b!1301634 m!1192903))

(declare-fun m!1192911 () Bool)

(assert (=> b!1301634 m!1192911))

(declare-fun m!1192913 () Bool)

(assert (=> b!1301634 m!1192913))

(assert (=> b!1301634 m!1192903))

(declare-fun m!1192915 () Bool)

(assert (=> b!1301634 m!1192915))

(declare-fun m!1192917 () Bool)

(assert (=> bm!63698 m!1192917))

(assert (=> b!1301637 m!1192903))

(assert (=> b!1301637 m!1192903))

(assert (=> b!1301637 m!1192905))

(assert (=> b!1301533 d!141613))

(declare-fun d!141615 () Bool)

(declare-fun e!742603 () Bool)

(assert (=> d!141615 e!742603))

(declare-fun res!864644 () Bool)

(assert (=> d!141615 (=> res!864644 e!742603)))

(declare-fun lt!581772 () Bool)

(assert (=> d!141615 (= res!864644 (not lt!581772))))

(declare-fun lt!581773 () Bool)

(assert (=> d!141615 (= lt!581772 lt!581773)))

(declare-fun lt!581774 () Unit!43003)

(declare-fun e!742602 () Unit!43003)

(assert (=> d!141615 (= lt!581774 e!742602)))

(declare-fun c!124967 () Bool)

(assert (=> d!141615 (= c!124967 lt!581773)))

(declare-fun containsKey!721 (List!29725 (_ BitVec 64)) Bool)

(assert (=> d!141615 (= lt!581773 (containsKey!721 (toList!10131 (getCurrentListMap!5147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141615 (= (contains!8267 (getCurrentListMap!5147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!581772)))

(declare-fun b!1301644 () Bool)

(declare-fun lt!581771 () Unit!43003)

(assert (=> b!1301644 (= e!742602 lt!581771)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!467 (List!29725 (_ BitVec 64)) Unit!43003)

(assert (=> b!1301644 (= lt!581771 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10131 (getCurrentListMap!5147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!746 0))(
  ( (Some!745 (v!20089 V!51529)) (None!744) )
))
(declare-fun isDefined!504 (Option!746) Bool)

(declare-fun getValueByKey!695 (List!29725 (_ BitVec 64)) Option!746)

(assert (=> b!1301644 (isDefined!504 (getValueByKey!695 (toList!10131 (getCurrentListMap!5147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1301645 () Bool)

(declare-fun Unit!43005 () Unit!43003)

(assert (=> b!1301645 (= e!742602 Unit!43005)))

(declare-fun b!1301646 () Bool)

(assert (=> b!1301646 (= e!742603 (isDefined!504 (getValueByKey!695 (toList!10131 (getCurrentListMap!5147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141615 c!124967) b!1301644))

(assert (= (and d!141615 (not c!124967)) b!1301645))

(assert (= (and d!141615 (not res!864644)) b!1301646))

(declare-fun m!1192919 () Bool)

(assert (=> d!141615 m!1192919))

(declare-fun m!1192921 () Bool)

(assert (=> b!1301644 m!1192921))

(declare-fun m!1192923 () Bool)

(assert (=> b!1301644 m!1192923))

(assert (=> b!1301644 m!1192923))

(declare-fun m!1192925 () Bool)

(assert (=> b!1301644 m!1192925))

(assert (=> b!1301646 m!1192923))

(assert (=> b!1301646 m!1192923))

(assert (=> b!1301646 m!1192925))

(assert (=> b!1301538 d!141615))

(declare-fun b!1301689 () Bool)

(declare-fun e!742642 () Unit!43003)

(declare-fun Unit!43006 () Unit!43003)

(assert (=> b!1301689 (= e!742642 Unit!43006)))

(declare-fun b!1301690 () Bool)

(declare-fun lt!581833 () Unit!43003)

(assert (=> b!1301690 (= e!742642 lt!581833)))

(declare-fun lt!581826 () ListLongMap!20231)

(assert (=> b!1301690 (= lt!581826 (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581830 () (_ BitVec 64))

(assert (=> b!1301690 (= lt!581830 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581821 () (_ BitVec 64))

(assert (=> b!1301690 (= lt!581821 (select (arr!41837 _keys!1741) from!2144))))

(declare-fun lt!581828 () Unit!43003)

(declare-fun addStillContains!1112 (ListLongMap!20231 (_ BitVec 64) V!51529 (_ BitVec 64)) Unit!43003)

(assert (=> b!1301690 (= lt!581828 (addStillContains!1112 lt!581826 lt!581830 zeroValue!1387 lt!581821))))

(assert (=> b!1301690 (contains!8267 (+!4502 lt!581826 (tuple2!22567 lt!581830 zeroValue!1387)) lt!581821)))

(declare-fun lt!581835 () Unit!43003)

(assert (=> b!1301690 (= lt!581835 lt!581828)))

(declare-fun lt!581822 () ListLongMap!20231)

(assert (=> b!1301690 (= lt!581822 (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581823 () (_ BitVec 64))

(assert (=> b!1301690 (= lt!581823 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581836 () (_ BitVec 64))

(assert (=> b!1301690 (= lt!581836 (select (arr!41837 _keys!1741) from!2144))))

(declare-fun lt!581832 () Unit!43003)

(declare-fun addApplyDifferent!554 (ListLongMap!20231 (_ BitVec 64) V!51529 (_ BitVec 64)) Unit!43003)

(assert (=> b!1301690 (= lt!581832 (addApplyDifferent!554 lt!581822 lt!581823 minValue!1387 lt!581836))))

(declare-fun apply!1025 (ListLongMap!20231 (_ BitVec 64)) V!51529)

(assert (=> b!1301690 (= (apply!1025 (+!4502 lt!581822 (tuple2!22567 lt!581823 minValue!1387)) lt!581836) (apply!1025 lt!581822 lt!581836))))

(declare-fun lt!581838 () Unit!43003)

(assert (=> b!1301690 (= lt!581838 lt!581832)))

(declare-fun lt!581837 () ListLongMap!20231)

(assert (=> b!1301690 (= lt!581837 (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581827 () (_ BitVec 64))

(assert (=> b!1301690 (= lt!581827 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581819 () (_ BitVec 64))

(assert (=> b!1301690 (= lt!581819 (select (arr!41837 _keys!1741) from!2144))))

(declare-fun lt!581839 () Unit!43003)

(assert (=> b!1301690 (= lt!581839 (addApplyDifferent!554 lt!581837 lt!581827 zeroValue!1387 lt!581819))))

(assert (=> b!1301690 (= (apply!1025 (+!4502 lt!581837 (tuple2!22567 lt!581827 zeroValue!1387)) lt!581819) (apply!1025 lt!581837 lt!581819))))

(declare-fun lt!581831 () Unit!43003)

(assert (=> b!1301690 (= lt!581831 lt!581839)))

(declare-fun lt!581825 () ListLongMap!20231)

(assert (=> b!1301690 (= lt!581825 (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581829 () (_ BitVec 64))

(assert (=> b!1301690 (= lt!581829 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581824 () (_ BitVec 64))

(assert (=> b!1301690 (= lt!581824 (select (arr!41837 _keys!1741) from!2144))))

(assert (=> b!1301690 (= lt!581833 (addApplyDifferent!554 lt!581825 lt!581829 minValue!1387 lt!581824))))

(assert (=> b!1301690 (= (apply!1025 (+!4502 lt!581825 (tuple2!22567 lt!581829 minValue!1387)) lt!581824) (apply!1025 lt!581825 lt!581824))))

(declare-fun bm!63713 () Bool)

(declare-fun call!63720 () ListLongMap!20231)

(declare-fun call!63719 () ListLongMap!20231)

(assert (=> bm!63713 (= call!63720 call!63719)))

(declare-fun b!1301691 () Bool)

(declare-fun e!742639 () Bool)

(assert (=> b!1301691 (= e!742639 (validKeyInArray!0 (select (arr!41837 _keys!1741) from!2144)))))

(declare-fun b!1301692 () Bool)

(declare-fun e!742636 () Bool)

(assert (=> b!1301692 (= e!742636 (validKeyInArray!0 (select (arr!41837 _keys!1741) from!2144)))))

(declare-fun b!1301693 () Bool)

(declare-fun e!742631 () Bool)

(declare-fun lt!581834 () ListLongMap!20231)

(assert (=> b!1301693 (= e!742631 (= (apply!1025 lt!581834 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun bm!63714 () Bool)

(declare-fun call!63718 () Bool)

(assert (=> bm!63714 (= call!63718 (contains!8267 lt!581834 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!63715 () Bool)

(declare-fun call!63722 () ListLongMap!20231)

(declare-fun call!63721 () ListLongMap!20231)

(assert (=> bm!63715 (= call!63722 call!63721)))

(declare-fun b!1301695 () Bool)

(declare-fun e!742634 () Bool)

(declare-fun e!742635 () Bool)

(assert (=> b!1301695 (= e!742634 e!742635)))

(declare-fun res!864671 () Bool)

(assert (=> b!1301695 (= res!864671 call!63718)))

(assert (=> b!1301695 (=> (not res!864671) (not e!742635))))

(declare-fun b!1301696 () Bool)

(declare-fun res!864668 () Bool)

(declare-fun e!742630 () Bool)

(assert (=> b!1301696 (=> (not res!864668) (not e!742630))))

(declare-fun e!742640 () Bool)

(assert (=> b!1301696 (= res!864668 e!742640)))

(declare-fun res!864666 () Bool)

(assert (=> b!1301696 (=> res!864666 e!742640)))

(assert (=> b!1301696 (= res!864666 (not e!742636))))

(declare-fun res!864670 () Bool)

(assert (=> b!1301696 (=> (not res!864670) (not e!742636))))

(assert (=> b!1301696 (= res!864670 (bvslt from!2144 (size!42388 _keys!1741)))))

(declare-fun b!1301697 () Bool)

(assert (=> b!1301697 (= e!742630 e!742634)))

(declare-fun c!124985 () Bool)

(assert (=> b!1301697 (= c!124985 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!63717 () ListLongMap!20231)

(declare-fun bm!63716 () Bool)

(assert (=> bm!63716 (= call!63717 (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1301698 () Bool)

(declare-fun res!864667 () Bool)

(assert (=> b!1301698 (=> (not res!864667) (not e!742630))))

(declare-fun e!742638 () Bool)

(assert (=> b!1301698 (= res!864667 e!742638)))

(declare-fun c!124982 () Bool)

(assert (=> b!1301698 (= c!124982 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1301699 () Bool)

(declare-fun e!742633 () ListLongMap!20231)

(assert (=> b!1301699 (= e!742633 call!63722)))

(declare-fun b!1301700 () Bool)

(declare-fun e!742632 () ListLongMap!20231)

(assert (=> b!1301700 (= e!742632 (+!4502 call!63719 (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun c!124981 () Bool)

(declare-fun bm!63717 () Bool)

(declare-fun c!124984 () Bool)

(assert (=> bm!63717 (= call!63719 (+!4502 (ite c!124984 call!63717 (ite c!124981 call!63721 call!63722)) (ite (or c!124984 c!124981) (tuple2!22567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1301701 () Bool)

(assert (=> b!1301701 (= e!742638 e!742631)))

(declare-fun res!864664 () Bool)

(declare-fun call!63716 () Bool)

(assert (=> b!1301701 (= res!864664 call!63716)))

(assert (=> b!1301701 (=> (not res!864664) (not e!742631))))

(declare-fun bm!63718 () Bool)

(assert (=> bm!63718 (= call!63721 call!63717)))

(declare-fun d!141617 () Bool)

(assert (=> d!141617 e!742630))

(declare-fun res!864663 () Bool)

(assert (=> d!141617 (=> (not res!864663) (not e!742630))))

(assert (=> d!141617 (= res!864663 (or (bvsge from!2144 (size!42388 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42388 _keys!1741)))))))

(declare-fun lt!581820 () ListLongMap!20231)

(assert (=> d!141617 (= lt!581834 lt!581820)))

(declare-fun lt!581840 () Unit!43003)

(assert (=> d!141617 (= lt!581840 e!742642)))

(declare-fun c!124980 () Bool)

(assert (=> d!141617 (= c!124980 e!742639)))

(declare-fun res!864665 () Bool)

(assert (=> d!141617 (=> (not res!864665) (not e!742639))))

(assert (=> d!141617 (= res!864665 (bvslt from!2144 (size!42388 _keys!1741)))))

(assert (=> d!141617 (= lt!581820 e!742632)))

(assert (=> d!141617 (= c!124984 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141617 (validMask!0 mask!2175)))

(assert (=> d!141617 (= (getCurrentListMap!5147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581834)))

(declare-fun b!1301694 () Bool)

(declare-fun e!742641 () Bool)

(assert (=> b!1301694 (= e!742640 e!742641)))

(declare-fun res!864669 () Bool)

(assert (=> b!1301694 (=> (not res!864669) (not e!742641))))

(assert (=> b!1301694 (= res!864669 (contains!8267 lt!581834 (select (arr!41837 _keys!1741) from!2144)))))

(assert (=> b!1301694 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42388 _keys!1741)))))

(declare-fun b!1301702 () Bool)

(assert (=> b!1301702 (= e!742638 (not call!63716))))

(declare-fun bm!63719 () Bool)

(assert (=> bm!63719 (= call!63716 (contains!8267 lt!581834 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1301703 () Bool)

(declare-fun e!742637 () ListLongMap!20231)

(assert (=> b!1301703 (= e!742632 e!742637)))

(assert (=> b!1301703 (= c!124981 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1301704 () Bool)

(declare-fun c!124983 () Bool)

(assert (=> b!1301704 (= c!124983 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1301704 (= e!742637 e!742633)))

(declare-fun b!1301705 () Bool)

(assert (=> b!1301705 (= e!742633 call!63720)))

(declare-fun b!1301706 () Bool)

(assert (=> b!1301706 (= e!742635 (= (apply!1025 lt!581834 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1301707 () Bool)

(assert (=> b!1301707 (= e!742637 call!63720)))

(declare-fun b!1301708 () Bool)

(declare-fun get!21171 (ValueCell!16511 V!51529) V!51529)

(declare-fun dynLambda!3482 (Int (_ BitVec 64)) V!51529)

(assert (=> b!1301708 (= e!742641 (= (apply!1025 lt!581834 (select (arr!41837 _keys!1741) from!2144)) (get!21171 (select (arr!41838 _values!1445) from!2144) (dynLambda!3482 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1301708 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42389 _values!1445)))))

(assert (=> b!1301708 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42388 _keys!1741)))))

(declare-fun b!1301709 () Bool)

(assert (=> b!1301709 (= e!742634 (not call!63718))))

(assert (= (and d!141617 c!124984) b!1301700))

(assert (= (and d!141617 (not c!124984)) b!1301703))

(assert (= (and b!1301703 c!124981) b!1301707))

(assert (= (and b!1301703 (not c!124981)) b!1301704))

(assert (= (and b!1301704 c!124983) b!1301705))

(assert (= (and b!1301704 (not c!124983)) b!1301699))

(assert (= (or b!1301705 b!1301699) bm!63715))

(assert (= (or b!1301707 bm!63715) bm!63718))

(assert (= (or b!1301707 b!1301705) bm!63713))

(assert (= (or b!1301700 bm!63718) bm!63716))

(assert (= (or b!1301700 bm!63713) bm!63717))

(assert (= (and d!141617 res!864665) b!1301691))

(assert (= (and d!141617 c!124980) b!1301690))

(assert (= (and d!141617 (not c!124980)) b!1301689))

(assert (= (and d!141617 res!864663) b!1301696))

(assert (= (and b!1301696 res!864670) b!1301692))

(assert (= (and b!1301696 (not res!864666)) b!1301694))

(assert (= (and b!1301694 res!864669) b!1301708))

(assert (= (and b!1301696 res!864668) b!1301698))

(assert (= (and b!1301698 c!124982) b!1301701))

(assert (= (and b!1301698 (not c!124982)) b!1301702))

(assert (= (and b!1301701 res!864664) b!1301693))

(assert (= (or b!1301701 b!1301702) bm!63719))

(assert (= (and b!1301698 res!864667) b!1301697))

(assert (= (and b!1301697 c!124985) b!1301695))

(assert (= (and b!1301697 (not c!124985)) b!1301709))

(assert (= (and b!1301695 res!864671) b!1301706))

(assert (= (or b!1301695 b!1301709) bm!63714))

(declare-fun b_lambda!23167 () Bool)

(assert (=> (not b_lambda!23167) (not b!1301708)))

(declare-fun t!43292 () Bool)

(declare-fun tb!11369 () Bool)

(assert (=> (and start!109990 (= defaultEntry!1448 defaultEntry!1448) t!43292) tb!11369))

(declare-fun result!23755 () Bool)

(assert (=> tb!11369 (= result!23755 tp_is_empty!34819)))

(assert (=> b!1301708 t!43292))

(declare-fun b_and!47295 () Bool)

(assert (= b_and!47289 (and (=> t!43292 result!23755) b_and!47295)))

(declare-fun m!1192927 () Bool)

(assert (=> b!1301706 m!1192927))

(assert (=> b!1301694 m!1192839))

(assert (=> b!1301694 m!1192839))

(declare-fun m!1192929 () Bool)

(assert (=> b!1301694 m!1192929))

(declare-fun m!1192931 () Bool)

(assert (=> bm!63717 m!1192931))

(assert (=> d!141617 m!1192825))

(declare-fun m!1192933 () Bool)

(assert (=> b!1301690 m!1192933))

(declare-fun m!1192935 () Bool)

(assert (=> b!1301690 m!1192935))

(assert (=> b!1301690 m!1192843))

(declare-fun m!1192937 () Bool)

(assert (=> b!1301690 m!1192937))

(declare-fun m!1192939 () Bool)

(assert (=> b!1301690 m!1192939))

(declare-fun m!1192941 () Bool)

(assert (=> b!1301690 m!1192941))

(declare-fun m!1192943 () Bool)

(assert (=> b!1301690 m!1192943))

(declare-fun m!1192945 () Bool)

(assert (=> b!1301690 m!1192945))

(declare-fun m!1192947 () Bool)

(assert (=> b!1301690 m!1192947))

(assert (=> b!1301690 m!1192839))

(declare-fun m!1192949 () Bool)

(assert (=> b!1301690 m!1192949))

(declare-fun m!1192951 () Bool)

(assert (=> b!1301690 m!1192951))

(assert (=> b!1301690 m!1192937))

(assert (=> b!1301690 m!1192945))

(declare-fun m!1192953 () Bool)

(assert (=> b!1301690 m!1192953))

(declare-fun m!1192955 () Bool)

(assert (=> b!1301690 m!1192955))

(assert (=> b!1301690 m!1192935))

(declare-fun m!1192957 () Bool)

(assert (=> b!1301690 m!1192957))

(declare-fun m!1192959 () Bool)

(assert (=> b!1301690 m!1192959))

(assert (=> b!1301690 m!1192947))

(declare-fun m!1192961 () Bool)

(assert (=> b!1301690 m!1192961))

(declare-fun m!1192963 () Bool)

(assert (=> bm!63719 m!1192963))

(assert (=> b!1301691 m!1192839))

(assert (=> b!1301691 m!1192839))

(assert (=> b!1301691 m!1192841))

(declare-fun m!1192965 () Bool)

(assert (=> b!1301700 m!1192965))

(assert (=> b!1301708 m!1192839))

(declare-fun m!1192967 () Bool)

(assert (=> b!1301708 m!1192967))

(assert (=> b!1301708 m!1192967))

(declare-fun m!1192969 () Bool)

(assert (=> b!1301708 m!1192969))

(declare-fun m!1192971 () Bool)

(assert (=> b!1301708 m!1192971))

(assert (=> b!1301708 m!1192969))

(assert (=> b!1301708 m!1192839))

(declare-fun m!1192973 () Bool)

(assert (=> b!1301708 m!1192973))

(assert (=> bm!63716 m!1192843))

(declare-fun m!1192975 () Bool)

(assert (=> b!1301693 m!1192975))

(declare-fun m!1192977 () Bool)

(assert (=> bm!63714 m!1192977))

(assert (=> b!1301692 m!1192839))

(assert (=> b!1301692 m!1192839))

(assert (=> b!1301692 m!1192841))

(assert (=> b!1301538 d!141617))

(declare-fun d!141619 () Bool)

(declare-fun e!742644 () Bool)

(assert (=> d!141619 e!742644))

(declare-fun res!864672 () Bool)

(assert (=> d!141619 (=> res!864672 e!742644)))

(declare-fun lt!581842 () Bool)

(assert (=> d!141619 (= res!864672 (not lt!581842))))

(declare-fun lt!581843 () Bool)

(assert (=> d!141619 (= lt!581842 lt!581843)))

(declare-fun lt!581844 () Unit!43003)

(declare-fun e!742643 () Unit!43003)

(assert (=> d!141619 (= lt!581844 e!742643)))

(declare-fun c!124986 () Bool)

(assert (=> d!141619 (= c!124986 lt!581843)))

(assert (=> d!141619 (= lt!581843 (containsKey!721 (toList!10131 (+!4502 (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> d!141619 (= (contains!8267 (+!4502 (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205) lt!581842)))

(declare-fun b!1301712 () Bool)

(declare-fun lt!581841 () Unit!43003)

(assert (=> b!1301712 (= e!742643 lt!581841)))

(assert (=> b!1301712 (= lt!581841 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10131 (+!4502 (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> b!1301712 (isDefined!504 (getValueByKey!695 (toList!10131 (+!4502 (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun b!1301713 () Bool)

(declare-fun Unit!43007 () Unit!43003)

(assert (=> b!1301713 (= e!742643 Unit!43007)))

(declare-fun b!1301714 () Bool)

(assert (=> b!1301714 (= e!742644 (isDefined!504 (getValueByKey!695 (toList!10131 (+!4502 (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205)))))

(assert (= (and d!141619 c!124986) b!1301712))

(assert (= (and d!141619 (not c!124986)) b!1301713))

(assert (= (and d!141619 (not res!864672)) b!1301714))

(declare-fun m!1192979 () Bool)

(assert (=> d!141619 m!1192979))

(declare-fun m!1192981 () Bool)

(assert (=> b!1301712 m!1192981))

(declare-fun m!1192983 () Bool)

(assert (=> b!1301712 m!1192983))

(assert (=> b!1301712 m!1192983))

(declare-fun m!1192985 () Bool)

(assert (=> b!1301712 m!1192985))

(assert (=> b!1301714 m!1192983))

(assert (=> b!1301714 m!1192983))

(assert (=> b!1301714 m!1192985))

(assert (=> b!1301530 d!141619))

(declare-fun d!141621 () Bool)

(declare-fun e!742647 () Bool)

(assert (=> d!141621 e!742647))

(declare-fun res!864677 () Bool)

(assert (=> d!141621 (=> (not res!864677) (not e!742647))))

(declare-fun lt!581856 () ListLongMap!20231)

(assert (=> d!141621 (= res!864677 (contains!8267 lt!581856 (_1!11294 (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!581854 () List!29725)

(assert (=> d!141621 (= lt!581856 (ListLongMap!20232 lt!581854))))

(declare-fun lt!581853 () Unit!43003)

(declare-fun lt!581855 () Unit!43003)

(assert (=> d!141621 (= lt!581853 lt!581855)))

(assert (=> d!141621 (= (getValueByKey!695 lt!581854 (_1!11294 (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!745 (_2!11294 (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!346 (List!29725 (_ BitVec 64) V!51529) Unit!43003)

(assert (=> d!141621 (= lt!581855 (lemmaContainsTupThenGetReturnValue!346 lt!581854 (_1!11294 (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11294 (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun insertStrictlySorted!475 (List!29725 (_ BitVec 64) V!51529) List!29725)

(assert (=> d!141621 (= lt!581854 (insertStrictlySorted!475 (toList!10131 (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) (_1!11294 (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11294 (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141621 (= (+!4502 (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!581856)))

(declare-fun b!1301719 () Bool)

(declare-fun res!864678 () Bool)

(assert (=> b!1301719 (=> (not res!864678) (not e!742647))))

(assert (=> b!1301719 (= res!864678 (= (getValueByKey!695 (toList!10131 lt!581856) (_1!11294 (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!745 (_2!11294 (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1301720 () Bool)

(declare-fun contains!8269 (List!29725 tuple2!22566) Bool)

(assert (=> b!1301720 (= e!742647 (contains!8269 (toList!10131 lt!581856) (tuple2!22567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141621 res!864677) b!1301719))

(assert (= (and b!1301719 res!864678) b!1301720))

(declare-fun m!1192987 () Bool)

(assert (=> d!141621 m!1192987))

(declare-fun m!1192989 () Bool)

(assert (=> d!141621 m!1192989))

(declare-fun m!1192991 () Bool)

(assert (=> d!141621 m!1192991))

(declare-fun m!1192993 () Bool)

(assert (=> d!141621 m!1192993))

(declare-fun m!1192995 () Bool)

(assert (=> b!1301719 m!1192995))

(declare-fun m!1192997 () Bool)

(assert (=> b!1301720 m!1192997))

(assert (=> b!1301530 d!141621))

(declare-fun b!1301745 () Bool)

(declare-fun e!742666 () ListLongMap!20231)

(declare-fun call!63725 () ListLongMap!20231)

(assert (=> b!1301745 (= e!742666 call!63725)))

(declare-fun d!141623 () Bool)

(declare-fun e!742663 () Bool)

(assert (=> d!141623 e!742663))

(declare-fun res!864687 () Bool)

(assert (=> d!141623 (=> (not res!864687) (not e!742663))))

(declare-fun lt!581875 () ListLongMap!20231)

(assert (=> d!141623 (= res!864687 (not (contains!8267 lt!581875 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!742662 () ListLongMap!20231)

(assert (=> d!141623 (= lt!581875 e!742662)))

(declare-fun c!124995 () Bool)

(assert (=> d!141623 (= c!124995 (bvsge from!2144 (size!42388 _keys!1741)))))

(assert (=> d!141623 (validMask!0 mask!2175)))

(assert (=> d!141623 (= (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581875)))

(declare-fun b!1301746 () Bool)

(assert (=> b!1301746 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42388 _keys!1741)))))

(assert (=> b!1301746 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42389 _values!1445)))))

(declare-fun e!742668 () Bool)

(assert (=> b!1301746 (= e!742668 (= (apply!1025 lt!581875 (select (arr!41837 _keys!1741) from!2144)) (get!21171 (select (arr!41838 _values!1445) from!2144) (dynLambda!3482 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1301747 () Bool)

(declare-fun e!742665 () Bool)

(assert (=> b!1301747 (= e!742665 (validKeyInArray!0 (select (arr!41837 _keys!1741) from!2144)))))

(assert (=> b!1301747 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1301748 () Bool)

(assert (=> b!1301748 (= e!742662 (ListLongMap!20232 Nil!29722))))

(declare-fun b!1301749 () Bool)

(assert (=> b!1301749 (= e!742662 e!742666)))

(declare-fun c!124998 () Bool)

(assert (=> b!1301749 (= c!124998 (validKeyInArray!0 (select (arr!41837 _keys!1741) from!2144)))))

(declare-fun bm!63722 () Bool)

(assert (=> bm!63722 (= call!63725 (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1301750 () Bool)

(declare-fun e!742667 () Bool)

(declare-fun e!742664 () Bool)

(assert (=> b!1301750 (= e!742667 e!742664)))

(declare-fun c!124997 () Bool)

(assert (=> b!1301750 (= c!124997 (bvslt from!2144 (size!42388 _keys!1741)))))

(declare-fun b!1301751 () Bool)

(declare-fun res!864689 () Bool)

(assert (=> b!1301751 (=> (not res!864689) (not e!742663))))

(assert (=> b!1301751 (= res!864689 (not (contains!8267 lt!581875 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1301752 () Bool)

(assert (=> b!1301752 (= e!742667 e!742668)))

(assert (=> b!1301752 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42388 _keys!1741)))))

(declare-fun res!864688 () Bool)

(assert (=> b!1301752 (= res!864688 (contains!8267 lt!581875 (select (arr!41837 _keys!1741) from!2144)))))

(assert (=> b!1301752 (=> (not res!864688) (not e!742668))))

(declare-fun b!1301753 () Bool)

(assert (=> b!1301753 (= e!742663 e!742667)))

(declare-fun c!124996 () Bool)

(assert (=> b!1301753 (= c!124996 e!742665)))

(declare-fun res!864690 () Bool)

(assert (=> b!1301753 (=> (not res!864690) (not e!742665))))

(assert (=> b!1301753 (= res!864690 (bvslt from!2144 (size!42388 _keys!1741)))))

(declare-fun b!1301754 () Bool)

(declare-fun lt!581876 () Unit!43003)

(declare-fun lt!581877 () Unit!43003)

(assert (=> b!1301754 (= lt!581876 lt!581877)))

(declare-fun lt!581874 () (_ BitVec 64))

(declare-fun lt!581871 () ListLongMap!20231)

(declare-fun lt!581872 () V!51529)

(declare-fun lt!581873 () (_ BitVec 64))

(assert (=> b!1301754 (not (contains!8267 (+!4502 lt!581871 (tuple2!22567 lt!581873 lt!581872)) lt!581874))))

(declare-fun addStillNotContains!464 (ListLongMap!20231 (_ BitVec 64) V!51529 (_ BitVec 64)) Unit!43003)

(assert (=> b!1301754 (= lt!581877 (addStillNotContains!464 lt!581871 lt!581873 lt!581872 lt!581874))))

(assert (=> b!1301754 (= lt!581874 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1301754 (= lt!581872 (get!21171 (select (arr!41838 _values!1445) from!2144) (dynLambda!3482 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1301754 (= lt!581873 (select (arr!41837 _keys!1741) from!2144))))

(assert (=> b!1301754 (= lt!581871 call!63725)))

(assert (=> b!1301754 (= e!742666 (+!4502 call!63725 (tuple2!22567 (select (arr!41837 _keys!1741) from!2144) (get!21171 (select (arr!41838 _values!1445) from!2144) (dynLambda!3482 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1301755 () Bool)

(declare-fun isEmpty!1056 (ListLongMap!20231) Bool)

(assert (=> b!1301755 (= e!742664 (isEmpty!1056 lt!581875))))

(declare-fun b!1301756 () Bool)

(assert (=> b!1301756 (= e!742664 (= lt!581875 (getCurrentListMapNoExtraKeys!6142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(assert (= (and d!141623 c!124995) b!1301748))

(assert (= (and d!141623 (not c!124995)) b!1301749))

(assert (= (and b!1301749 c!124998) b!1301754))

(assert (= (and b!1301749 (not c!124998)) b!1301745))

(assert (= (or b!1301754 b!1301745) bm!63722))

(assert (= (and d!141623 res!864687) b!1301751))

(assert (= (and b!1301751 res!864689) b!1301753))

(assert (= (and b!1301753 res!864690) b!1301747))

(assert (= (and b!1301753 c!124996) b!1301752))

(assert (= (and b!1301753 (not c!124996)) b!1301750))

(assert (= (and b!1301752 res!864688) b!1301746))

(assert (= (and b!1301750 c!124997) b!1301756))

(assert (= (and b!1301750 (not c!124997)) b!1301755))

(declare-fun b_lambda!23169 () Bool)

(assert (=> (not b_lambda!23169) (not b!1301746)))

(assert (=> b!1301746 t!43292))

(declare-fun b_and!47297 () Bool)

(assert (= b_and!47295 (and (=> t!43292 result!23755) b_and!47297)))

(declare-fun b_lambda!23171 () Bool)

(assert (=> (not b_lambda!23171) (not b!1301754)))

(assert (=> b!1301754 t!43292))

(declare-fun b_and!47299 () Bool)

(assert (= b_and!47297 (and (=> t!43292 result!23755) b_and!47299)))

(assert (=> b!1301746 m!1192969))

(assert (=> b!1301746 m!1192967))

(assert (=> b!1301746 m!1192839))

(declare-fun m!1192999 () Bool)

(assert (=> b!1301746 m!1192999))

(assert (=> b!1301746 m!1192967))

(assert (=> b!1301746 m!1192969))

(assert (=> b!1301746 m!1192971))

(assert (=> b!1301746 m!1192839))

(declare-fun m!1193001 () Bool)

(assert (=> b!1301756 m!1193001))

(declare-fun m!1193003 () Bool)

(assert (=> d!141623 m!1193003))

(assert (=> d!141623 m!1192825))

(assert (=> b!1301752 m!1192839))

(assert (=> b!1301752 m!1192839))

(declare-fun m!1193005 () Bool)

(assert (=> b!1301752 m!1193005))

(assert (=> bm!63722 m!1193001))

(declare-fun m!1193007 () Bool)

(assert (=> b!1301755 m!1193007))

(assert (=> b!1301747 m!1192839))

(assert (=> b!1301747 m!1192839))

(assert (=> b!1301747 m!1192841))

(assert (=> b!1301749 m!1192839))

(assert (=> b!1301749 m!1192839))

(assert (=> b!1301749 m!1192841))

(declare-fun m!1193009 () Bool)

(assert (=> b!1301751 m!1193009))

(assert (=> b!1301754 m!1192969))

(assert (=> b!1301754 m!1192967))

(declare-fun m!1193011 () Bool)

(assert (=> b!1301754 m!1193011))

(assert (=> b!1301754 m!1192967))

(assert (=> b!1301754 m!1192969))

(assert (=> b!1301754 m!1192971))

(declare-fun m!1193013 () Bool)

(assert (=> b!1301754 m!1193013))

(declare-fun m!1193015 () Bool)

(assert (=> b!1301754 m!1193015))

(declare-fun m!1193017 () Bool)

(assert (=> b!1301754 m!1193017))

(assert (=> b!1301754 m!1192839))

(assert (=> b!1301754 m!1193015))

(assert (=> b!1301530 d!141623))

(declare-fun d!141625 () Bool)

(assert (=> d!141625 (= (validKeyInArray!0 (select (arr!41837 _keys!1741) from!2144)) (and (not (= (select (arr!41837 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41837 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1301537 d!141625))

(declare-fun mapNonEmpty!53810 () Bool)

(declare-fun mapRes!53810 () Bool)

(declare-fun tp!102683 () Bool)

(declare-fun e!742674 () Bool)

(assert (=> mapNonEmpty!53810 (= mapRes!53810 (and tp!102683 e!742674))))

(declare-fun mapValue!53810 () ValueCell!16511)

(declare-fun mapKey!53810 () (_ BitVec 32))

(declare-fun mapRest!53810 () (Array (_ BitVec 32) ValueCell!16511))

(assert (=> mapNonEmpty!53810 (= mapRest!53801 (store mapRest!53810 mapKey!53810 mapValue!53810))))

(declare-fun condMapEmpty!53810 () Bool)

(declare-fun mapDefault!53810 () ValueCell!16511)

(assert (=> mapNonEmpty!53801 (= condMapEmpty!53810 (= mapRest!53801 ((as const (Array (_ BitVec 32) ValueCell!16511)) mapDefault!53810)))))

(declare-fun e!742673 () Bool)

(assert (=> mapNonEmpty!53801 (= tp!102668 (and e!742673 mapRes!53810))))

(declare-fun b!1301764 () Bool)

(assert (=> b!1301764 (= e!742673 tp_is_empty!34819)))

(declare-fun b!1301763 () Bool)

(assert (=> b!1301763 (= e!742674 tp_is_empty!34819)))

(declare-fun mapIsEmpty!53810 () Bool)

(assert (=> mapIsEmpty!53810 mapRes!53810))

(assert (= (and mapNonEmpty!53801 condMapEmpty!53810) mapIsEmpty!53810))

(assert (= (and mapNonEmpty!53801 (not condMapEmpty!53810)) mapNonEmpty!53810))

(assert (= (and mapNonEmpty!53810 ((_ is ValueCellFull!16511) mapValue!53810)) b!1301763))

(assert (= (and mapNonEmpty!53801 ((_ is ValueCellFull!16511) mapDefault!53810)) b!1301764))

(declare-fun m!1193019 () Bool)

(assert (=> mapNonEmpty!53810 m!1193019))

(declare-fun b_lambda!23173 () Bool)

(assert (= b_lambda!23167 (or (and start!109990 b_free!29179) b_lambda!23173)))

(declare-fun b_lambda!23175 () Bool)

(assert (= b_lambda!23171 (or (and start!109990 b_free!29179) b_lambda!23175)))

(declare-fun b_lambda!23177 () Bool)

(assert (= b_lambda!23169 (or (and start!109990 b_free!29179) b_lambda!23177)))

(check-sat (not b!1301708) (not b!1301752) (not b!1301700) (not bm!63722) (not b!1301712) (not bm!63695) (not d!141619) (not b!1301749) (not b!1301720) (not b!1301693) (not b!1301714) (not bm!63717) (not d!141617) (not b!1301637) (not bm!63716) (not b!1301646) (not b!1301624) (not b!1301694) (not d!141615) (not b!1301692) (not b!1301625) (not b!1301756) tp_is_empty!34819 (not mapNonEmpty!53810) (not b!1301751) (not d!141621) (not d!141623) (not bm!63698) (not b!1301706) (not b_lambda!23173) b_and!47299 (not b!1301623) (not bm!63714) (not b_next!29179) (not b_lambda!23175) (not b!1301746) (not b_lambda!23177) (not b!1301719) (not b!1301755) (not b!1301747) (not b!1301644) (not b!1301634) (not b!1301754) (not bm!63719) (not b!1301690) (not b!1301691))
(check-sat b_and!47299 (not b_next!29179))
