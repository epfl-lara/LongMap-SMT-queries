; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110158 () Bool)

(assert start!110158)

(declare-fun b_free!29233 () Bool)

(declare-fun b_next!29233 () Bool)

(assert (=> start!110158 (= b_free!29233 (not b_next!29233))))

(declare-fun tp!102840 () Bool)

(declare-fun b_and!47377 () Bool)

(assert (=> start!110158 (= tp!102840 b_and!47377)))

(declare-fun b!1303585 () Bool)

(declare-fun res!865578 () Bool)

(declare-fun e!743635 () Bool)

(assert (=> b!1303585 (=> (not res!865578) (not e!743635))))

(declare-datatypes ((array!86797 0))(
  ( (array!86798 (arr!41888 (Array (_ BitVec 32) (_ BitVec 64))) (size!42439 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86797)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86797 (_ BitVec 32)) Bool)

(assert (=> b!1303585 (= res!865578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53892 () Bool)

(declare-fun mapRes!53892 () Bool)

(declare-fun tp!102839 () Bool)

(declare-fun e!743637 () Bool)

(assert (=> mapNonEmpty!53892 (= mapRes!53892 (and tp!102839 e!743637))))

(declare-fun mapKey!53892 () (_ BitVec 32))

(declare-datatypes ((V!51601 0))(
  ( (V!51602 (val!17511 Int)) )
))
(declare-datatypes ((ValueCell!16538 0))(
  ( (ValueCellFull!16538 (v!20118 V!51601)) (EmptyCell!16538) )
))
(declare-datatypes ((array!86799 0))(
  ( (array!86800 (arr!41889 (Array (_ BitVec 32) ValueCell!16538)) (size!42440 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86799)

(declare-fun mapValue!53892 () ValueCell!16538)

(declare-fun mapRest!53892 () (Array (_ BitVec 32) ValueCell!16538))

(assert (=> mapNonEmpty!53892 (= (arr!41889 _values!1445) (store mapRest!53892 mapKey!53892 mapValue!53892))))

(declare-fun b!1303586 () Bool)

(declare-fun e!743638 () Bool)

(assert (=> b!1303586 (= e!743635 (not e!743638))))

(declare-fun res!865574 () Bool)

(assert (=> b!1303586 (=> res!865574 e!743638)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1303586 (= res!865574 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22614 0))(
  ( (tuple2!22615 (_1!11318 (_ BitVec 64)) (_2!11318 V!51601)) )
))
(declare-datatypes ((List!29765 0))(
  ( (Nil!29762) (Cons!29761 (h!30979 tuple2!22614) (t!43345 List!29765)) )
))
(declare-datatypes ((ListLongMap!20279 0))(
  ( (ListLongMap!20280 (toList!10155 List!29765)) )
))
(declare-fun contains!8297 (ListLongMap!20279 (_ BitVec 64)) Bool)

(assert (=> b!1303586 (not (contains!8297 (ListLongMap!20280 Nil!29762) k0!1205))))

(declare-datatypes ((Unit!43085 0))(
  ( (Unit!43086) )
))
(declare-fun lt!583044 () Unit!43085)

(declare-fun emptyContainsNothing!212 ((_ BitVec 64)) Unit!43085)

(assert (=> b!1303586 (= lt!583044 (emptyContainsNothing!212 k0!1205))))

(declare-fun b!1303587 () Bool)

(declare-fun res!865571 () Bool)

(assert (=> b!1303587 (=> (not res!865571) (not e!743635))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303587 (= res!865571 (not (validKeyInArray!0 (select (arr!41888 _keys!1741) from!2144))))))

(declare-fun b!1303588 () Bool)

(declare-fun e!743636 () Bool)

(declare-fun tp_is_empty!34873 () Bool)

(assert (=> b!1303588 (= e!743636 tp_is_empty!34873)))

(declare-fun b!1303589 () Bool)

(declare-fun res!865569 () Bool)

(assert (=> b!1303589 (=> (not res!865569) (not e!743635))))

(declare-datatypes ((List!29766 0))(
  ( (Nil!29763) (Cons!29762 (h!30980 (_ BitVec 64)) (t!43346 List!29766)) )
))
(declare-fun arrayNoDuplicates!0 (array!86797 (_ BitVec 32) List!29766) Bool)

(assert (=> b!1303589 (= res!865569 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29763))))

(declare-fun b!1303590 () Bool)

(declare-fun res!865572 () Bool)

(assert (=> b!1303590 (=> (not res!865572) (not e!743635))))

(assert (=> b!1303590 (= res!865572 (and (= (size!42440 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42439 _keys!1741) (size!42440 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1303591 () Bool)

(declare-fun e!743641 () Bool)

(assert (=> b!1303591 (= e!743641 (and e!743636 mapRes!53892))))

(declare-fun condMapEmpty!53892 () Bool)

(declare-fun mapDefault!53892 () ValueCell!16538)

(assert (=> b!1303591 (= condMapEmpty!53892 (= (arr!41889 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16538)) mapDefault!53892)))))

(declare-fun b!1303592 () Bool)

(declare-fun res!865573 () Bool)

(assert (=> b!1303592 (=> (not res!865573) (not e!743635))))

(assert (=> b!1303592 (= res!865573 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42439 _keys!1741))))))

(declare-fun res!865570 () Bool)

(assert (=> start!110158 (=> (not res!865570) (not e!743635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110158 (= res!865570 (validMask!0 mask!2175))))

(assert (=> start!110158 e!743635))

(assert (=> start!110158 tp_is_empty!34873))

(assert (=> start!110158 true))

(declare-fun array_inv!31933 (array!86799) Bool)

(assert (=> start!110158 (and (array_inv!31933 _values!1445) e!743641)))

(declare-fun array_inv!31934 (array!86797) Bool)

(assert (=> start!110158 (array_inv!31934 _keys!1741)))

(assert (=> start!110158 tp!102840))

(declare-fun b!1303593 () Bool)

(assert (=> b!1303593 (= e!743637 tp_is_empty!34873)))

(declare-fun mapIsEmpty!53892 () Bool)

(assert (=> mapIsEmpty!53892 mapRes!53892))

(declare-fun b!1303594 () Bool)

(declare-fun e!743639 () Bool)

(assert (=> b!1303594 (= e!743638 e!743639)))

(declare-fun res!865575 () Bool)

(assert (=> b!1303594 (=> (not res!865575) (not e!743639))))

(declare-fun minValue!1387 () V!51601)

(declare-fun zeroValue!1387 () V!51601)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6158 (array!86797 array!86799 (_ BitVec 32) (_ BitVec 32) V!51601 V!51601 (_ BitVec 32) Int) ListLongMap!20279)

(assert (=> b!1303594 (= res!865575 (not (contains!8297 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205)))))

(declare-fun b!1303595 () Bool)

(declare-fun res!865576 () Bool)

(assert (=> b!1303595 (=> (not res!865576) (not e!743635))))

(assert (=> b!1303595 (= res!865576 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42439 _keys!1741))))))

(declare-fun b!1303596 () Bool)

(assert (=> b!1303596 (= e!743639 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(declare-fun b!1303597 () Bool)

(declare-fun res!865577 () Bool)

(assert (=> b!1303597 (=> (not res!865577) (not e!743635))))

(declare-fun getCurrentListMap!5167 (array!86797 array!86799 (_ BitVec 32) (_ BitVec 32) V!51601 V!51601 (_ BitVec 32) Int) ListLongMap!20279)

(assert (=> b!1303597 (= res!865577 (contains!8297 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!110158 res!865570) b!1303590))

(assert (= (and b!1303590 res!865572) b!1303585))

(assert (= (and b!1303585 res!865578) b!1303589))

(assert (= (and b!1303589 res!865569) b!1303592))

(assert (= (and b!1303592 res!865573) b!1303597))

(assert (= (and b!1303597 res!865577) b!1303595))

(assert (= (and b!1303595 res!865576) b!1303587))

(assert (= (and b!1303587 res!865571) b!1303586))

(assert (= (and b!1303586 (not res!865574)) b!1303594))

(assert (= (and b!1303594 res!865575) b!1303596))

(assert (= (and b!1303591 condMapEmpty!53892) mapIsEmpty!53892))

(assert (= (and b!1303591 (not condMapEmpty!53892)) mapNonEmpty!53892))

(get-info :version)

(assert (= (and mapNonEmpty!53892 ((_ is ValueCellFull!16538) mapValue!53892)) b!1303593))

(assert (= (and b!1303591 ((_ is ValueCellFull!16538) mapDefault!53892)) b!1303588))

(assert (= start!110158 b!1303591))

(declare-fun m!1194679 () Bool)

(assert (=> mapNonEmpty!53892 m!1194679))

(declare-fun m!1194681 () Bool)

(assert (=> b!1303589 m!1194681))

(declare-fun m!1194683 () Bool)

(assert (=> b!1303585 m!1194683))

(declare-fun m!1194685 () Bool)

(assert (=> b!1303587 m!1194685))

(assert (=> b!1303587 m!1194685))

(declare-fun m!1194687 () Bool)

(assert (=> b!1303587 m!1194687))

(declare-fun m!1194689 () Bool)

(assert (=> b!1303586 m!1194689))

(declare-fun m!1194691 () Bool)

(assert (=> b!1303586 m!1194691))

(declare-fun m!1194693 () Bool)

(assert (=> start!110158 m!1194693))

(declare-fun m!1194695 () Bool)

(assert (=> start!110158 m!1194695))

(declare-fun m!1194697 () Bool)

(assert (=> start!110158 m!1194697))

(declare-fun m!1194699 () Bool)

(assert (=> b!1303597 m!1194699))

(assert (=> b!1303597 m!1194699))

(declare-fun m!1194701 () Bool)

(assert (=> b!1303597 m!1194701))

(declare-fun m!1194703 () Bool)

(assert (=> b!1303594 m!1194703))

(assert (=> b!1303594 m!1194703))

(declare-fun m!1194705 () Bool)

(assert (=> b!1303594 m!1194705))

(check-sat (not b!1303586) tp_is_empty!34873 (not b!1303594) (not b!1303587) (not start!110158) (not b!1303597) (not mapNonEmpty!53892) (not b!1303585) b_and!47377 (not b_next!29233) (not b!1303589))
(check-sat b_and!47377 (not b_next!29233))
(get-model)

(declare-fun d!141881 () Bool)

(declare-fun e!743688 () Bool)

(assert (=> d!141881 e!743688))

(declare-fun res!865641 () Bool)

(assert (=> d!141881 (=> res!865641 e!743688)))

(declare-fun lt!583060 () Bool)

(assert (=> d!141881 (= res!865641 (not lt!583060))))

(declare-fun lt!583062 () Bool)

(assert (=> d!141881 (= lt!583060 lt!583062)))

(declare-fun lt!583061 () Unit!43085)

(declare-fun e!743689 () Unit!43085)

(assert (=> d!141881 (= lt!583061 e!743689)))

(declare-fun c!125343 () Bool)

(assert (=> d!141881 (= c!125343 lt!583062)))

(declare-fun containsKey!724 (List!29765 (_ BitVec 64)) Bool)

(assert (=> d!141881 (= lt!583062 (containsKey!724 (toList!10155 (ListLongMap!20280 Nil!29762)) k0!1205))))

(assert (=> d!141881 (= (contains!8297 (ListLongMap!20280 Nil!29762) k0!1205) lt!583060)))

(declare-fun b!1303682 () Bool)

(declare-fun lt!583059 () Unit!43085)

(assert (=> b!1303682 (= e!743689 lt!583059)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!470 (List!29765 (_ BitVec 64)) Unit!43085)

(assert (=> b!1303682 (= lt!583059 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10155 (ListLongMap!20280 Nil!29762)) k0!1205))))

(declare-datatypes ((Option!749 0))(
  ( (Some!748 (v!20121 V!51601)) (None!747) )
))
(declare-fun isDefined!507 (Option!749) Bool)

(declare-fun getValueByKey!698 (List!29765 (_ BitVec 64)) Option!749)

(assert (=> b!1303682 (isDefined!507 (getValueByKey!698 (toList!10155 (ListLongMap!20280 Nil!29762)) k0!1205))))

(declare-fun b!1303683 () Bool)

(declare-fun Unit!43087 () Unit!43085)

(assert (=> b!1303683 (= e!743689 Unit!43087)))

(declare-fun b!1303684 () Bool)

(assert (=> b!1303684 (= e!743688 (isDefined!507 (getValueByKey!698 (toList!10155 (ListLongMap!20280 Nil!29762)) k0!1205)))))

(assert (= (and d!141881 c!125343) b!1303682))

(assert (= (and d!141881 (not c!125343)) b!1303683))

(assert (= (and d!141881 (not res!865641)) b!1303684))

(declare-fun m!1194763 () Bool)

(assert (=> d!141881 m!1194763))

(declare-fun m!1194765 () Bool)

(assert (=> b!1303682 m!1194765))

(declare-fun m!1194767 () Bool)

(assert (=> b!1303682 m!1194767))

(assert (=> b!1303682 m!1194767))

(declare-fun m!1194769 () Bool)

(assert (=> b!1303682 m!1194769))

(assert (=> b!1303684 m!1194767))

(assert (=> b!1303684 m!1194767))

(assert (=> b!1303684 m!1194769))

(assert (=> b!1303586 d!141881))

(declare-fun d!141883 () Bool)

(assert (=> d!141883 (not (contains!8297 (ListLongMap!20280 Nil!29762) k0!1205))))

(declare-fun lt!583065 () Unit!43085)

(declare-fun choose!1915 ((_ BitVec 64)) Unit!43085)

(assert (=> d!141883 (= lt!583065 (choose!1915 k0!1205))))

(assert (=> d!141883 (= (emptyContainsNothing!212 k0!1205) lt!583065)))

(declare-fun bs!37102 () Bool)

(assert (= bs!37102 d!141883))

(assert (=> bs!37102 m!1194689))

(declare-fun m!1194771 () Bool)

(assert (=> bs!37102 m!1194771))

(assert (=> b!1303586 d!141883))

(declare-fun d!141885 () Bool)

(assert (=> d!141885 (= (validKeyInArray!0 (select (arr!41888 _keys!1741) from!2144)) (and (not (= (select (arr!41888 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41888 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1303587 d!141885))

(declare-fun d!141887 () Bool)

(declare-fun e!743690 () Bool)

(assert (=> d!141887 e!743690))

(declare-fun res!865642 () Bool)

(assert (=> d!141887 (=> res!865642 e!743690)))

(declare-fun lt!583067 () Bool)

(assert (=> d!141887 (= res!865642 (not lt!583067))))

(declare-fun lt!583069 () Bool)

(assert (=> d!141887 (= lt!583067 lt!583069)))

(declare-fun lt!583068 () Unit!43085)

(declare-fun e!743691 () Unit!43085)

(assert (=> d!141887 (= lt!583068 e!743691)))

(declare-fun c!125344 () Bool)

(assert (=> d!141887 (= c!125344 lt!583069)))

(assert (=> d!141887 (= lt!583069 (containsKey!724 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141887 (= (contains!8297 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583067)))

(declare-fun b!1303685 () Bool)

(declare-fun lt!583066 () Unit!43085)

(assert (=> b!1303685 (= e!743691 lt!583066)))

(assert (=> b!1303685 (= lt!583066 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1303685 (isDefined!507 (getValueByKey!698 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1303686 () Bool)

(declare-fun Unit!43088 () Unit!43085)

(assert (=> b!1303686 (= e!743691 Unit!43088)))

(declare-fun b!1303687 () Bool)

(assert (=> b!1303687 (= e!743690 (isDefined!507 (getValueByKey!698 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141887 c!125344) b!1303685))

(assert (= (and d!141887 (not c!125344)) b!1303686))

(assert (= (and d!141887 (not res!865642)) b!1303687))

(declare-fun m!1194773 () Bool)

(assert (=> d!141887 m!1194773))

(declare-fun m!1194775 () Bool)

(assert (=> b!1303685 m!1194775))

(declare-fun m!1194777 () Bool)

(assert (=> b!1303685 m!1194777))

(assert (=> b!1303685 m!1194777))

(declare-fun m!1194779 () Bool)

(assert (=> b!1303685 m!1194779))

(assert (=> b!1303687 m!1194777))

(assert (=> b!1303687 m!1194777))

(assert (=> b!1303687 m!1194779))

(assert (=> b!1303597 d!141887))

(declare-fun b!1303730 () Bool)

(declare-fun e!743723 () Bool)

(declare-fun lt!583131 () ListLongMap!20279)

(declare-fun apply!1028 (ListLongMap!20279 (_ BitVec 64)) V!51601)

(assert (=> b!1303730 (= e!743723 (= (apply!1028 lt!583131 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun d!141889 () Bool)

(declare-fun e!743719 () Bool)

(assert (=> d!141889 e!743719))

(declare-fun res!865662 () Bool)

(assert (=> d!141889 (=> (not res!865662) (not e!743719))))

(assert (=> d!141889 (= res!865662 (or (bvsge from!2144 (size!42439 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42439 _keys!1741)))))))

(declare-fun lt!583123 () ListLongMap!20279)

(assert (=> d!141889 (= lt!583131 lt!583123)))

(declare-fun lt!583120 () Unit!43085)

(declare-fun e!743718 () Unit!43085)

(assert (=> d!141889 (= lt!583120 e!743718)))

(declare-fun c!125357 () Bool)

(declare-fun e!743730 () Bool)

(assert (=> d!141889 (= c!125357 e!743730)))

(declare-fun res!865666 () Bool)

(assert (=> d!141889 (=> (not res!865666) (not e!743730))))

(assert (=> d!141889 (= res!865666 (bvslt from!2144 (size!42439 _keys!1741)))))

(declare-fun e!743725 () ListLongMap!20279)

(assert (=> d!141889 (= lt!583123 e!743725)))

(declare-fun c!125358 () Bool)

(assert (=> d!141889 (= c!125358 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141889 (validMask!0 mask!2175)))

(assert (=> d!141889 (= (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583131)))

(declare-fun bm!64190 () Bool)

(declare-fun call!64194 () Bool)

(assert (=> bm!64190 (= call!64194 (contains!8297 lt!583131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303731 () Bool)

(declare-fun e!743729 () ListLongMap!20279)

(declare-fun call!64196 () ListLongMap!20279)

(assert (=> b!1303731 (= e!743729 call!64196)))

(declare-fun b!1303732 () Bool)

(declare-fun e!743720 () ListLongMap!20279)

(assert (=> b!1303732 (= e!743720 call!64196)))

(declare-fun bm!64191 () Bool)

(declare-fun call!64193 () ListLongMap!20279)

(assert (=> bm!64191 (= call!64196 call!64193)))

(declare-fun b!1303733 () Bool)

(declare-fun call!64197 () ListLongMap!20279)

(assert (=> b!1303733 (= e!743720 call!64197)))

(declare-fun b!1303734 () Bool)

(declare-fun e!743728 () Bool)

(assert (=> b!1303734 (= e!743719 e!743728)))

(declare-fun c!125359 () Bool)

(assert (=> b!1303734 (= c!125359 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1303735 () Bool)

(declare-fun Unit!43089 () Unit!43085)

(assert (=> b!1303735 (= e!743718 Unit!43089)))

(declare-fun b!1303736 () Bool)

(declare-fun e!743726 () Bool)

(assert (=> b!1303736 (= e!743726 (= (apply!1028 lt!583131 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1303737 () Bool)

(declare-fun e!743722 () Bool)

(declare-fun e!743727 () Bool)

(assert (=> b!1303737 (= e!743722 e!743727)))

(declare-fun res!865663 () Bool)

(assert (=> b!1303737 (=> (not res!865663) (not e!743727))))

(assert (=> b!1303737 (= res!865663 (contains!8297 lt!583131 (select (arr!41888 _keys!1741) from!2144)))))

(assert (=> b!1303737 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42439 _keys!1741)))))

(declare-fun call!64199 () ListLongMap!20279)

(declare-fun bm!64192 () Bool)

(assert (=> bm!64192 (= call!64199 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1303738 () Bool)

(declare-fun lt!583125 () Unit!43085)

(assert (=> b!1303738 (= e!743718 lt!583125)))

(declare-fun lt!583126 () ListLongMap!20279)

(assert (=> b!1303738 (= lt!583126 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583117 () (_ BitVec 64))

(assert (=> b!1303738 (= lt!583117 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583134 () (_ BitVec 64))

(assert (=> b!1303738 (= lt!583134 (select (arr!41888 _keys!1741) from!2144))))

(declare-fun lt!583129 () Unit!43085)

(declare-fun addStillContains!1115 (ListLongMap!20279 (_ BitVec 64) V!51601 (_ BitVec 64)) Unit!43085)

(assert (=> b!1303738 (= lt!583129 (addStillContains!1115 lt!583126 lt!583117 zeroValue!1387 lt!583134))))

(declare-fun +!4520 (ListLongMap!20279 tuple2!22614) ListLongMap!20279)

(assert (=> b!1303738 (contains!8297 (+!4520 lt!583126 (tuple2!22615 lt!583117 zeroValue!1387)) lt!583134)))

(declare-fun lt!583133 () Unit!43085)

(assert (=> b!1303738 (= lt!583133 lt!583129)))

(declare-fun lt!583130 () ListLongMap!20279)

(assert (=> b!1303738 (= lt!583130 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583119 () (_ BitVec 64))

(assert (=> b!1303738 (= lt!583119 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583118 () (_ BitVec 64))

(assert (=> b!1303738 (= lt!583118 (select (arr!41888 _keys!1741) from!2144))))

(declare-fun lt!583124 () Unit!43085)

(declare-fun addApplyDifferent!557 (ListLongMap!20279 (_ BitVec 64) V!51601 (_ BitVec 64)) Unit!43085)

(assert (=> b!1303738 (= lt!583124 (addApplyDifferent!557 lt!583130 lt!583119 minValue!1387 lt!583118))))

(assert (=> b!1303738 (= (apply!1028 (+!4520 lt!583130 (tuple2!22615 lt!583119 minValue!1387)) lt!583118) (apply!1028 lt!583130 lt!583118))))

(declare-fun lt!583135 () Unit!43085)

(assert (=> b!1303738 (= lt!583135 lt!583124)))

(declare-fun lt!583116 () ListLongMap!20279)

(assert (=> b!1303738 (= lt!583116 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583132 () (_ BitVec 64))

(assert (=> b!1303738 (= lt!583132 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583114 () (_ BitVec 64))

(assert (=> b!1303738 (= lt!583114 (select (arr!41888 _keys!1741) from!2144))))

(declare-fun lt!583127 () Unit!43085)

(assert (=> b!1303738 (= lt!583127 (addApplyDifferent!557 lt!583116 lt!583132 zeroValue!1387 lt!583114))))

(assert (=> b!1303738 (= (apply!1028 (+!4520 lt!583116 (tuple2!22615 lt!583132 zeroValue!1387)) lt!583114) (apply!1028 lt!583116 lt!583114))))

(declare-fun lt!583121 () Unit!43085)

(assert (=> b!1303738 (= lt!583121 lt!583127)))

(declare-fun lt!583128 () ListLongMap!20279)

(assert (=> b!1303738 (= lt!583128 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583122 () (_ BitVec 64))

(assert (=> b!1303738 (= lt!583122 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583115 () (_ BitVec 64))

(assert (=> b!1303738 (= lt!583115 (select (arr!41888 _keys!1741) from!2144))))

(assert (=> b!1303738 (= lt!583125 (addApplyDifferent!557 lt!583128 lt!583122 minValue!1387 lt!583115))))

(assert (=> b!1303738 (= (apply!1028 (+!4520 lt!583128 (tuple2!22615 lt!583122 minValue!1387)) lt!583115) (apply!1028 lt!583128 lt!583115))))

(declare-fun b!1303739 () Bool)

(assert (=> b!1303739 (= e!743725 e!743729)))

(declare-fun c!125360 () Bool)

(assert (=> b!1303739 (= c!125360 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1303740 () Bool)

(assert (=> b!1303740 (= e!743725 (+!4520 call!64193 (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun bm!64193 () Bool)

(declare-fun call!64195 () Bool)

(assert (=> bm!64193 (= call!64195 (contains!8297 lt!583131 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303741 () Bool)

(declare-fun res!865661 () Bool)

(assert (=> b!1303741 (=> (not res!865661) (not e!743719))))

(assert (=> b!1303741 (= res!865661 e!743722)))

(declare-fun res!865669 () Bool)

(assert (=> b!1303741 (=> res!865669 e!743722)))

(declare-fun e!743721 () Bool)

(assert (=> b!1303741 (= res!865669 (not e!743721))))

(declare-fun res!865665 () Bool)

(assert (=> b!1303741 (=> (not res!865665) (not e!743721))))

(assert (=> b!1303741 (= res!865665 (bvslt from!2144 (size!42439 _keys!1741)))))

(declare-fun call!64198 () ListLongMap!20279)

(declare-fun bm!64194 () Bool)

(assert (=> bm!64194 (= call!64193 (+!4520 (ite c!125358 call!64199 (ite c!125360 call!64198 call!64197)) (ite (or c!125358 c!125360) (tuple2!22615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1303742 () Bool)

(declare-fun e!743724 () Bool)

(assert (=> b!1303742 (= e!743724 (not call!64194))))

(declare-fun b!1303743 () Bool)

(declare-fun c!125362 () Bool)

(assert (=> b!1303743 (= c!125362 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1303743 (= e!743729 e!743720)))

(declare-fun b!1303744 () Bool)

(assert (=> b!1303744 (= e!743721 (validKeyInArray!0 (select (arr!41888 _keys!1741) from!2144)))))

(declare-fun bm!64195 () Bool)

(assert (=> bm!64195 (= call!64197 call!64198)))

(declare-fun b!1303745 () Bool)

(assert (=> b!1303745 (= e!743730 (validKeyInArray!0 (select (arr!41888 _keys!1741) from!2144)))))

(declare-fun bm!64196 () Bool)

(assert (=> bm!64196 (= call!64198 call!64199)))

(declare-fun b!1303746 () Bool)

(declare-fun get!21199 (ValueCell!16538 V!51601) V!51601)

(declare-fun dynLambda!3489 (Int (_ BitVec 64)) V!51601)

(assert (=> b!1303746 (= e!743727 (= (apply!1028 lt!583131 (select (arr!41888 _keys!1741) from!2144)) (get!21199 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1303746 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42440 _values!1445)))))

(assert (=> b!1303746 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42439 _keys!1741)))))

(declare-fun b!1303747 () Bool)

(assert (=> b!1303747 (= e!743728 e!743723)))

(declare-fun res!865664 () Bool)

(assert (=> b!1303747 (= res!865664 call!64195)))

(assert (=> b!1303747 (=> (not res!865664) (not e!743723))))

(declare-fun b!1303748 () Bool)

(declare-fun res!865668 () Bool)

(assert (=> b!1303748 (=> (not res!865668) (not e!743719))))

(assert (=> b!1303748 (= res!865668 e!743724)))

(declare-fun c!125361 () Bool)

(assert (=> b!1303748 (= c!125361 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1303749 () Bool)

(assert (=> b!1303749 (= e!743728 (not call!64195))))

(declare-fun b!1303750 () Bool)

(assert (=> b!1303750 (= e!743724 e!743726)))

(declare-fun res!865667 () Bool)

(assert (=> b!1303750 (= res!865667 call!64194)))

(assert (=> b!1303750 (=> (not res!865667) (not e!743726))))

(assert (= (and d!141889 c!125358) b!1303740))

(assert (= (and d!141889 (not c!125358)) b!1303739))

(assert (= (and b!1303739 c!125360) b!1303731))

(assert (= (and b!1303739 (not c!125360)) b!1303743))

(assert (= (and b!1303743 c!125362) b!1303732))

(assert (= (and b!1303743 (not c!125362)) b!1303733))

(assert (= (or b!1303732 b!1303733) bm!64195))

(assert (= (or b!1303731 bm!64195) bm!64196))

(assert (= (or b!1303731 b!1303732) bm!64191))

(assert (= (or b!1303740 bm!64196) bm!64192))

(assert (= (or b!1303740 bm!64191) bm!64194))

(assert (= (and d!141889 res!865666) b!1303745))

(assert (= (and d!141889 c!125357) b!1303738))

(assert (= (and d!141889 (not c!125357)) b!1303735))

(assert (= (and d!141889 res!865662) b!1303741))

(assert (= (and b!1303741 res!865665) b!1303744))

(assert (= (and b!1303741 (not res!865669)) b!1303737))

(assert (= (and b!1303737 res!865663) b!1303746))

(assert (= (and b!1303741 res!865661) b!1303748))

(assert (= (and b!1303748 c!125361) b!1303750))

(assert (= (and b!1303748 (not c!125361)) b!1303742))

(assert (= (and b!1303750 res!865667) b!1303736))

(assert (= (or b!1303750 b!1303742) bm!64190))

(assert (= (and b!1303748 res!865668) b!1303734))

(assert (= (and b!1303734 c!125359) b!1303747))

(assert (= (and b!1303734 (not c!125359)) b!1303749))

(assert (= (and b!1303747 res!865664) b!1303730))

(assert (= (or b!1303747 b!1303749) bm!64193))

(declare-fun b_lambda!23225 () Bool)

(assert (=> (not b_lambda!23225) (not b!1303746)))

(declare-fun t!43349 () Bool)

(declare-fun tb!11385 () Bool)

(assert (=> (and start!110158 (= defaultEntry!1448 defaultEntry!1448) t!43349) tb!11385))

(declare-fun result!23793 () Bool)

(assert (=> tb!11385 (= result!23793 tp_is_empty!34873)))

(assert (=> b!1303746 t!43349))

(declare-fun b_and!47383 () Bool)

(assert (= b_and!47377 (and (=> t!43349 result!23793) b_and!47383)))

(declare-fun m!1194781 () Bool)

(assert (=> b!1303730 m!1194781))

(declare-fun m!1194783 () Bool)

(assert (=> bm!64193 m!1194783))

(declare-fun m!1194785 () Bool)

(assert (=> bm!64194 m!1194785))

(declare-fun m!1194787 () Bool)

(assert (=> b!1303738 m!1194787))

(declare-fun m!1194789 () Bool)

(assert (=> b!1303738 m!1194789))

(declare-fun m!1194791 () Bool)

(assert (=> b!1303738 m!1194791))

(assert (=> b!1303738 m!1194703))

(assert (=> b!1303738 m!1194685))

(declare-fun m!1194793 () Bool)

(assert (=> b!1303738 m!1194793))

(declare-fun m!1194795 () Bool)

(assert (=> b!1303738 m!1194795))

(declare-fun m!1194797 () Bool)

(assert (=> b!1303738 m!1194797))

(assert (=> b!1303738 m!1194789))

(declare-fun m!1194799 () Bool)

(assert (=> b!1303738 m!1194799))

(declare-fun m!1194801 () Bool)

(assert (=> b!1303738 m!1194801))

(declare-fun m!1194803 () Bool)

(assert (=> b!1303738 m!1194803))

(declare-fun m!1194805 () Bool)

(assert (=> b!1303738 m!1194805))

(assert (=> b!1303738 m!1194801))

(declare-fun m!1194807 () Bool)

(assert (=> b!1303738 m!1194807))

(declare-fun m!1194809 () Bool)

(assert (=> b!1303738 m!1194809))

(declare-fun m!1194811 () Bool)

(assert (=> b!1303738 m!1194811))

(declare-fun m!1194813 () Bool)

(assert (=> b!1303738 m!1194813))

(assert (=> b!1303738 m!1194793))

(declare-fun m!1194815 () Bool)

(assert (=> b!1303738 m!1194815))

(assert (=> b!1303738 m!1194811))

(declare-fun m!1194817 () Bool)

(assert (=> bm!64190 m!1194817))

(declare-fun m!1194819 () Bool)

(assert (=> b!1303740 m!1194819))

(assert (=> b!1303744 m!1194685))

(assert (=> b!1303744 m!1194685))

(assert (=> b!1303744 m!1194687))

(assert (=> b!1303745 m!1194685))

(assert (=> b!1303745 m!1194685))

(assert (=> b!1303745 m!1194687))

(assert (=> d!141889 m!1194693))

(assert (=> b!1303746 m!1194685))

(declare-fun m!1194821 () Bool)

(assert (=> b!1303746 m!1194821))

(assert (=> b!1303746 m!1194685))

(declare-fun m!1194823 () Bool)

(assert (=> b!1303746 m!1194823))

(declare-fun m!1194825 () Bool)

(assert (=> b!1303746 m!1194825))

(declare-fun m!1194827 () Bool)

(assert (=> b!1303746 m!1194827))

(assert (=> b!1303746 m!1194823))

(assert (=> b!1303746 m!1194825))

(assert (=> b!1303737 m!1194685))

(assert (=> b!1303737 m!1194685))

(declare-fun m!1194829 () Bool)

(assert (=> b!1303737 m!1194829))

(assert (=> bm!64192 m!1194703))

(declare-fun m!1194831 () Bool)

(assert (=> b!1303736 m!1194831))

(assert (=> b!1303597 d!141889))

(declare-fun b!1303763 () Bool)

(declare-fun e!743741 () Bool)

(declare-fun call!64202 () Bool)

(assert (=> b!1303763 (= e!743741 call!64202)))

(declare-fun b!1303765 () Bool)

(declare-fun e!743740 () Bool)

(assert (=> b!1303765 (= e!743740 e!743741)))

(declare-fun c!125365 () Bool)

(assert (=> b!1303765 (= c!125365 (validKeyInArray!0 (select (arr!41888 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303766 () Bool)

(assert (=> b!1303766 (= e!743741 call!64202)))

(declare-fun b!1303767 () Bool)

(declare-fun e!743742 () Bool)

(declare-fun contains!8299 (List!29766 (_ BitVec 64)) Bool)

(assert (=> b!1303767 (= e!743742 (contains!8299 Nil!29763 (select (arr!41888 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64199 () Bool)

(assert (=> bm!64199 (= call!64202 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125365 (Cons!29762 (select (arr!41888 _keys!1741) #b00000000000000000000000000000000) Nil!29763) Nil!29763)))))

(declare-fun d!141891 () Bool)

(declare-fun res!865676 () Bool)

(declare-fun e!743739 () Bool)

(assert (=> d!141891 (=> res!865676 e!743739)))

(assert (=> d!141891 (= res!865676 (bvsge #b00000000000000000000000000000000 (size!42439 _keys!1741)))))

(assert (=> d!141891 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29763) e!743739)))

(declare-fun b!1303764 () Bool)

(assert (=> b!1303764 (= e!743739 e!743740)))

(declare-fun res!865678 () Bool)

(assert (=> b!1303764 (=> (not res!865678) (not e!743740))))

(assert (=> b!1303764 (= res!865678 (not e!743742))))

(declare-fun res!865677 () Bool)

(assert (=> b!1303764 (=> (not res!865677) (not e!743742))))

(assert (=> b!1303764 (= res!865677 (validKeyInArray!0 (select (arr!41888 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141891 (not res!865676)) b!1303764))

(assert (= (and b!1303764 res!865677) b!1303767))

(assert (= (and b!1303764 res!865678) b!1303765))

(assert (= (and b!1303765 c!125365) b!1303766))

(assert (= (and b!1303765 (not c!125365)) b!1303763))

(assert (= (or b!1303766 b!1303763) bm!64199))

(declare-fun m!1194833 () Bool)

(assert (=> b!1303765 m!1194833))

(assert (=> b!1303765 m!1194833))

(declare-fun m!1194835 () Bool)

(assert (=> b!1303765 m!1194835))

(assert (=> b!1303767 m!1194833))

(assert (=> b!1303767 m!1194833))

(declare-fun m!1194837 () Bool)

(assert (=> b!1303767 m!1194837))

(assert (=> bm!64199 m!1194833))

(declare-fun m!1194839 () Bool)

(assert (=> bm!64199 m!1194839))

(assert (=> b!1303764 m!1194833))

(assert (=> b!1303764 m!1194833))

(assert (=> b!1303764 m!1194835))

(assert (=> b!1303589 d!141891))

(declare-fun d!141893 () Bool)

(declare-fun e!743743 () Bool)

(assert (=> d!141893 e!743743))

(declare-fun res!865679 () Bool)

(assert (=> d!141893 (=> res!865679 e!743743)))

(declare-fun lt!583137 () Bool)

(assert (=> d!141893 (= res!865679 (not lt!583137))))

(declare-fun lt!583139 () Bool)

(assert (=> d!141893 (= lt!583137 lt!583139)))

(declare-fun lt!583138 () Unit!43085)

(declare-fun e!743744 () Unit!43085)

(assert (=> d!141893 (= lt!583138 e!743744)))

(declare-fun c!125366 () Bool)

(assert (=> d!141893 (= c!125366 lt!583139)))

(assert (=> d!141893 (= lt!583139 (containsKey!724 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141893 (= (contains!8297 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583137)))

(declare-fun b!1303768 () Bool)

(declare-fun lt!583136 () Unit!43085)

(assert (=> b!1303768 (= e!743744 lt!583136)))

(assert (=> b!1303768 (= lt!583136 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1303768 (isDefined!507 (getValueByKey!698 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1303769 () Bool)

(declare-fun Unit!43090 () Unit!43085)

(assert (=> b!1303769 (= e!743744 Unit!43090)))

(declare-fun b!1303770 () Bool)

(assert (=> b!1303770 (= e!743743 (isDefined!507 (getValueByKey!698 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141893 c!125366) b!1303768))

(assert (= (and d!141893 (not c!125366)) b!1303769))

(assert (= (and d!141893 (not res!865679)) b!1303770))

(declare-fun m!1194841 () Bool)

(assert (=> d!141893 m!1194841))

(declare-fun m!1194843 () Bool)

(assert (=> b!1303768 m!1194843))

(declare-fun m!1194845 () Bool)

(assert (=> b!1303768 m!1194845))

(assert (=> b!1303768 m!1194845))

(declare-fun m!1194847 () Bool)

(assert (=> b!1303768 m!1194847))

(assert (=> b!1303770 m!1194845))

(assert (=> b!1303770 m!1194845))

(assert (=> b!1303770 m!1194847))

(assert (=> b!1303594 d!141893))

(declare-fun b!1303795 () Bool)

(declare-fun e!743764 () Bool)

(declare-fun e!743759 () Bool)

(assert (=> b!1303795 (= e!743764 e!743759)))

(declare-fun c!125378 () Bool)

(declare-fun e!743762 () Bool)

(assert (=> b!1303795 (= c!125378 e!743762)))

(declare-fun res!865688 () Bool)

(assert (=> b!1303795 (=> (not res!865688) (not e!743762))))

(assert (=> b!1303795 (= res!865688 (bvslt from!2144 (size!42439 _keys!1741)))))

(declare-fun b!1303796 () Bool)

(declare-fun e!743761 () Bool)

(declare-fun lt!583160 () ListLongMap!20279)

(declare-fun isEmpty!1061 (ListLongMap!20279) Bool)

(assert (=> b!1303796 (= e!743761 (isEmpty!1061 lt!583160))))

(declare-fun b!1303797 () Bool)

(assert (=> b!1303797 (= e!743762 (validKeyInArray!0 (select (arr!41888 _keys!1741) from!2144)))))

(assert (=> b!1303797 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1303798 () Bool)

(assert (=> b!1303798 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42439 _keys!1741)))))

(assert (=> b!1303798 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42440 _values!1445)))))

(declare-fun e!743763 () Bool)

(assert (=> b!1303798 (= e!743763 (= (apply!1028 lt!583160 (select (arr!41888 _keys!1741) from!2144)) (get!21199 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1303799 () Bool)

(assert (=> b!1303799 (= e!743759 e!743763)))

(assert (=> b!1303799 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42439 _keys!1741)))))

(declare-fun res!865689 () Bool)

(assert (=> b!1303799 (= res!865689 (contains!8297 lt!583160 (select (arr!41888 _keys!1741) from!2144)))))

(assert (=> b!1303799 (=> (not res!865689) (not e!743763))))

(declare-fun b!1303800 () Bool)

(declare-fun e!743760 () ListLongMap!20279)

(declare-fun call!64205 () ListLongMap!20279)

(assert (=> b!1303800 (= e!743760 call!64205)))

(declare-fun b!1303801 () Bool)

(declare-fun e!743765 () ListLongMap!20279)

(assert (=> b!1303801 (= e!743765 (ListLongMap!20280 Nil!29762))))

(declare-fun b!1303802 () Bool)

(declare-fun lt!583159 () Unit!43085)

(declare-fun lt!583155 () Unit!43085)

(assert (=> b!1303802 (= lt!583159 lt!583155)))

(declare-fun lt!583154 () (_ BitVec 64))

(declare-fun lt!583157 () (_ BitVec 64))

(declare-fun lt!583158 () ListLongMap!20279)

(declare-fun lt!583156 () V!51601)

(assert (=> b!1303802 (not (contains!8297 (+!4520 lt!583158 (tuple2!22615 lt!583157 lt!583156)) lt!583154))))

(declare-fun addStillNotContains!471 (ListLongMap!20279 (_ BitVec 64) V!51601 (_ BitVec 64)) Unit!43085)

(assert (=> b!1303802 (= lt!583155 (addStillNotContains!471 lt!583158 lt!583157 lt!583156 lt!583154))))

(assert (=> b!1303802 (= lt!583154 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1303802 (= lt!583156 (get!21199 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1303802 (= lt!583157 (select (arr!41888 _keys!1741) from!2144))))

(assert (=> b!1303802 (= lt!583158 call!64205)))

(assert (=> b!1303802 (= e!743760 (+!4520 call!64205 (tuple2!22615 (select (arr!41888 _keys!1741) from!2144) (get!21199 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1303803 () Bool)

(assert (=> b!1303803 (= e!743761 (= lt!583160 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun d!141895 () Bool)

(assert (=> d!141895 e!743764))

(declare-fun res!865691 () Bool)

(assert (=> d!141895 (=> (not res!865691) (not e!743764))))

(assert (=> d!141895 (= res!865691 (not (contains!8297 lt!583160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141895 (= lt!583160 e!743765)))

(declare-fun c!125375 () Bool)

(assert (=> d!141895 (= c!125375 (bvsge from!2144 (size!42439 _keys!1741)))))

(assert (=> d!141895 (validMask!0 mask!2175)))

(assert (=> d!141895 (= (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583160)))

(declare-fun b!1303804 () Bool)

(assert (=> b!1303804 (= e!743765 e!743760)))

(declare-fun c!125376 () Bool)

(assert (=> b!1303804 (= c!125376 (validKeyInArray!0 (select (arr!41888 _keys!1741) from!2144)))))

(declare-fun bm!64202 () Bool)

(assert (=> bm!64202 (= call!64205 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1303805 () Bool)

(declare-fun res!865690 () Bool)

(assert (=> b!1303805 (=> (not res!865690) (not e!743764))))

(assert (=> b!1303805 (= res!865690 (not (contains!8297 lt!583160 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1303806 () Bool)

(assert (=> b!1303806 (= e!743759 e!743761)))

(declare-fun c!125377 () Bool)

(assert (=> b!1303806 (= c!125377 (bvslt from!2144 (size!42439 _keys!1741)))))

(assert (= (and d!141895 c!125375) b!1303801))

(assert (= (and d!141895 (not c!125375)) b!1303804))

(assert (= (and b!1303804 c!125376) b!1303802))

(assert (= (and b!1303804 (not c!125376)) b!1303800))

(assert (= (or b!1303802 b!1303800) bm!64202))

(assert (= (and d!141895 res!865691) b!1303805))

(assert (= (and b!1303805 res!865690) b!1303795))

(assert (= (and b!1303795 res!865688) b!1303797))

(assert (= (and b!1303795 c!125378) b!1303799))

(assert (= (and b!1303795 (not c!125378)) b!1303806))

(assert (= (and b!1303799 res!865689) b!1303798))

(assert (= (and b!1303806 c!125377) b!1303803))

(assert (= (and b!1303806 (not c!125377)) b!1303796))

(declare-fun b_lambda!23227 () Bool)

(assert (=> (not b_lambda!23227) (not b!1303798)))

(assert (=> b!1303798 t!43349))

(declare-fun b_and!47385 () Bool)

(assert (= b_and!47383 (and (=> t!43349 result!23793) b_and!47385)))

(declare-fun b_lambda!23229 () Bool)

(assert (=> (not b_lambda!23229) (not b!1303802)))

(assert (=> b!1303802 t!43349))

(declare-fun b_and!47387 () Bool)

(assert (= b_and!47385 (and (=> t!43349 result!23793) b_and!47387)))

(declare-fun m!1194849 () Bool)

(assert (=> b!1303805 m!1194849))

(assert (=> b!1303804 m!1194685))

(assert (=> b!1303804 m!1194685))

(assert (=> b!1303804 m!1194687))

(assert (=> b!1303797 m!1194685))

(assert (=> b!1303797 m!1194685))

(assert (=> b!1303797 m!1194687))

(declare-fun m!1194851 () Bool)

(assert (=> b!1303803 m!1194851))

(assert (=> b!1303798 m!1194825))

(assert (=> b!1303798 m!1194685))

(declare-fun m!1194853 () Bool)

(assert (=> b!1303798 m!1194853))

(assert (=> b!1303798 m!1194823))

(assert (=> b!1303798 m!1194823))

(assert (=> b!1303798 m!1194825))

(assert (=> b!1303798 m!1194827))

(assert (=> b!1303798 m!1194685))

(declare-fun m!1194855 () Bool)

(assert (=> b!1303802 m!1194855))

(assert (=> b!1303802 m!1194825))

(declare-fun m!1194857 () Bool)

(assert (=> b!1303802 m!1194857))

(declare-fun m!1194859 () Bool)

(assert (=> b!1303802 m!1194859))

(declare-fun m!1194861 () Bool)

(assert (=> b!1303802 m!1194861))

(assert (=> b!1303802 m!1194823))

(assert (=> b!1303802 m!1194859))

(assert (=> b!1303802 m!1194823))

(assert (=> b!1303802 m!1194825))

(assert (=> b!1303802 m!1194827))

(assert (=> b!1303802 m!1194685))

(assert (=> b!1303799 m!1194685))

(assert (=> b!1303799 m!1194685))

(declare-fun m!1194863 () Bool)

(assert (=> b!1303799 m!1194863))

(assert (=> bm!64202 m!1194851))

(declare-fun m!1194865 () Bool)

(assert (=> d!141895 m!1194865))

(assert (=> d!141895 m!1194693))

(declare-fun m!1194867 () Bool)

(assert (=> b!1303796 m!1194867))

(assert (=> b!1303594 d!141895))

(declare-fun d!141897 () Bool)

(assert (=> d!141897 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110158 d!141897))

(declare-fun d!141899 () Bool)

(assert (=> d!141899 (= (array_inv!31933 _values!1445) (bvsge (size!42440 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110158 d!141899))

(declare-fun d!141901 () Bool)

(assert (=> d!141901 (= (array_inv!31934 _keys!1741) (bvsge (size!42439 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110158 d!141901))

(declare-fun bm!64205 () Bool)

(declare-fun call!64208 () Bool)

(assert (=> bm!64205 (= call!64208 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1303815 () Bool)

(declare-fun e!743772 () Bool)

(declare-fun e!743773 () Bool)

(assert (=> b!1303815 (= e!743772 e!743773)))

(declare-fun lt!583167 () (_ BitVec 64))

(assert (=> b!1303815 (= lt!583167 (select (arr!41888 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!583168 () Unit!43085)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86797 (_ BitVec 64) (_ BitVec 32)) Unit!43085)

(assert (=> b!1303815 (= lt!583168 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583167 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1303815 (arrayContainsKey!0 _keys!1741 lt!583167 #b00000000000000000000000000000000)))

(declare-fun lt!583169 () Unit!43085)

(assert (=> b!1303815 (= lt!583169 lt!583168)))

(declare-fun res!865696 () Bool)

(declare-datatypes ((SeekEntryResult!9978 0))(
  ( (MissingZero!9978 (index!42283 (_ BitVec 32))) (Found!9978 (index!42284 (_ BitVec 32))) (Intermediate!9978 (undefined!10790 Bool) (index!42285 (_ BitVec 32)) (x!115654 (_ BitVec 32))) (Undefined!9978) (MissingVacant!9978 (index!42286 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86797 (_ BitVec 32)) SeekEntryResult!9978)

(assert (=> b!1303815 (= res!865696 (= (seekEntryOrOpen!0 (select (arr!41888 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9978 #b00000000000000000000000000000000)))))

(assert (=> b!1303815 (=> (not res!865696) (not e!743773))))

(declare-fun b!1303816 () Bool)

(assert (=> b!1303816 (= e!743773 call!64208)))

(declare-fun d!141903 () Bool)

(declare-fun res!865697 () Bool)

(declare-fun e!743774 () Bool)

(assert (=> d!141903 (=> res!865697 e!743774)))

(assert (=> d!141903 (= res!865697 (bvsge #b00000000000000000000000000000000 (size!42439 _keys!1741)))))

(assert (=> d!141903 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!743774)))

(declare-fun b!1303817 () Bool)

(assert (=> b!1303817 (= e!743772 call!64208)))

(declare-fun b!1303818 () Bool)

(assert (=> b!1303818 (= e!743774 e!743772)))

(declare-fun c!125381 () Bool)

(assert (=> b!1303818 (= c!125381 (validKeyInArray!0 (select (arr!41888 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141903 (not res!865697)) b!1303818))

(assert (= (and b!1303818 c!125381) b!1303815))

(assert (= (and b!1303818 (not c!125381)) b!1303817))

(assert (= (and b!1303815 res!865696) b!1303816))

(assert (= (or b!1303816 b!1303817) bm!64205))

(declare-fun m!1194869 () Bool)

(assert (=> bm!64205 m!1194869))

(assert (=> b!1303815 m!1194833))

(declare-fun m!1194871 () Bool)

(assert (=> b!1303815 m!1194871))

(declare-fun m!1194873 () Bool)

(assert (=> b!1303815 m!1194873))

(assert (=> b!1303815 m!1194833))

(declare-fun m!1194875 () Bool)

(assert (=> b!1303815 m!1194875))

(assert (=> b!1303818 m!1194833))

(assert (=> b!1303818 m!1194833))

(assert (=> b!1303818 m!1194835))

(assert (=> b!1303585 d!141903))

(declare-fun b!1303826 () Bool)

(declare-fun e!743779 () Bool)

(assert (=> b!1303826 (= e!743779 tp_is_empty!34873)))

(declare-fun condMapEmpty!53901 () Bool)

(declare-fun mapDefault!53901 () ValueCell!16538)

(assert (=> mapNonEmpty!53892 (= condMapEmpty!53901 (= mapRest!53892 ((as const (Array (_ BitVec 32) ValueCell!16538)) mapDefault!53901)))))

(declare-fun mapRes!53901 () Bool)

(assert (=> mapNonEmpty!53892 (= tp!102839 (and e!743779 mapRes!53901))))

(declare-fun mapNonEmpty!53901 () Bool)

(declare-fun tp!102855 () Bool)

(declare-fun e!743780 () Bool)

(assert (=> mapNonEmpty!53901 (= mapRes!53901 (and tp!102855 e!743780))))

(declare-fun mapValue!53901 () ValueCell!16538)

(declare-fun mapRest!53901 () (Array (_ BitVec 32) ValueCell!16538))

(declare-fun mapKey!53901 () (_ BitVec 32))

(assert (=> mapNonEmpty!53901 (= mapRest!53892 (store mapRest!53901 mapKey!53901 mapValue!53901))))

(declare-fun mapIsEmpty!53901 () Bool)

(assert (=> mapIsEmpty!53901 mapRes!53901))

(declare-fun b!1303825 () Bool)

(assert (=> b!1303825 (= e!743780 tp_is_empty!34873)))

(assert (= (and mapNonEmpty!53892 condMapEmpty!53901) mapIsEmpty!53901))

(assert (= (and mapNonEmpty!53892 (not condMapEmpty!53901)) mapNonEmpty!53901))

(assert (= (and mapNonEmpty!53901 ((_ is ValueCellFull!16538) mapValue!53901)) b!1303825))

(assert (= (and mapNonEmpty!53892 ((_ is ValueCellFull!16538) mapDefault!53901)) b!1303826))

(declare-fun m!1194877 () Bool)

(assert (=> mapNonEmpty!53901 m!1194877))

(declare-fun b_lambda!23231 () Bool)

(assert (= b_lambda!23225 (or (and start!110158 b_free!29233) b_lambda!23231)))

(declare-fun b_lambda!23233 () Bool)

(assert (= b_lambda!23227 (or (and start!110158 b_free!29233) b_lambda!23233)))

(declare-fun b_lambda!23235 () Bool)

(assert (= b_lambda!23229 (or (and start!110158 b_free!29233) b_lambda!23235)))

(check-sat (not b!1303684) (not b!1303798) (not d!141889) (not b!1303685) (not b!1303804) (not b!1303815) (not b_lambda!23231) (not b!1303805) (not b!1303818) (not b!1303745) (not bm!64205) (not bm!64190) (not b!1303796) (not mapNonEmpty!53901) tp_is_empty!34873 (not bm!64194) (not b_lambda!23235) b_and!47387 (not b!1303730) (not d!141893) (not bm!64192) (not b!1303802) (not bm!64193) (not d!141881) (not b!1303767) (not b_lambda!23233) (not b!1303740) (not b!1303803) (not b!1303764) (not b!1303799) (not b!1303770) (not b!1303746) (not b!1303797) (not b!1303737) (not b!1303744) (not bm!64199) (not d!141887) (not b!1303687) (not b!1303765) (not d!141883) (not bm!64202) (not b_next!29233) (not b!1303682) (not b!1303736) (not d!141895) (not b!1303768) (not b!1303738))
(check-sat b_and!47387 (not b_next!29233))
(get-model)

(declare-fun d!141905 () Bool)

(declare-fun e!743783 () Bool)

(assert (=> d!141905 e!743783))

(declare-fun res!865703 () Bool)

(assert (=> d!141905 (=> (not res!865703) (not e!743783))))

(declare-fun lt!583178 () ListLongMap!20279)

(assert (=> d!141905 (= res!865703 (contains!8297 lt!583178 (_1!11318 (ite (or c!125358 c!125360) (tuple2!22615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!583181 () List!29765)

(assert (=> d!141905 (= lt!583178 (ListLongMap!20280 lt!583181))))

(declare-fun lt!583180 () Unit!43085)

(declare-fun lt!583179 () Unit!43085)

(assert (=> d!141905 (= lt!583180 lt!583179)))

(assert (=> d!141905 (= (getValueByKey!698 lt!583181 (_1!11318 (ite (or c!125358 c!125360) (tuple2!22615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!748 (_2!11318 (ite (or c!125358 c!125360) (tuple2!22615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!349 (List!29765 (_ BitVec 64) V!51601) Unit!43085)

(assert (=> d!141905 (= lt!583179 (lemmaContainsTupThenGetReturnValue!349 lt!583181 (_1!11318 (ite (or c!125358 c!125360) (tuple2!22615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11318 (ite (or c!125358 c!125360) (tuple2!22615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun insertStrictlySorted!478 (List!29765 (_ BitVec 64) V!51601) List!29765)

(assert (=> d!141905 (= lt!583181 (insertStrictlySorted!478 (toList!10155 (ite c!125358 call!64199 (ite c!125360 call!64198 call!64197))) (_1!11318 (ite (or c!125358 c!125360) (tuple2!22615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11318 (ite (or c!125358 c!125360) (tuple2!22615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141905 (= (+!4520 (ite c!125358 call!64199 (ite c!125360 call!64198 call!64197)) (ite (or c!125358 c!125360) (tuple2!22615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!583178)))

(declare-fun b!1303831 () Bool)

(declare-fun res!865702 () Bool)

(assert (=> b!1303831 (=> (not res!865702) (not e!743783))))

(assert (=> b!1303831 (= res!865702 (= (getValueByKey!698 (toList!10155 lt!583178) (_1!11318 (ite (or c!125358 c!125360) (tuple2!22615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!748 (_2!11318 (ite (or c!125358 c!125360) (tuple2!22615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1303832 () Bool)

(declare-fun contains!8300 (List!29765 tuple2!22614) Bool)

(assert (=> b!1303832 (= e!743783 (contains!8300 (toList!10155 lt!583178) (ite (or c!125358 c!125360) (tuple2!22615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!141905 res!865703) b!1303831))

(assert (= (and b!1303831 res!865702) b!1303832))

(declare-fun m!1194879 () Bool)

(assert (=> d!141905 m!1194879))

(declare-fun m!1194881 () Bool)

(assert (=> d!141905 m!1194881))

(declare-fun m!1194883 () Bool)

(assert (=> d!141905 m!1194883))

(declare-fun m!1194885 () Bool)

(assert (=> d!141905 m!1194885))

(declare-fun m!1194887 () Bool)

(assert (=> b!1303831 m!1194887))

(declare-fun m!1194889 () Bool)

(assert (=> b!1303832 m!1194889))

(assert (=> bm!64194 d!141905))

(declare-fun d!141907 () Bool)

(assert (=> d!141907 (= (validKeyInArray!0 (select (arr!41888 _keys!1741) #b00000000000000000000000000000000)) (and (not (= (select (arr!41888 _keys!1741) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41888 _keys!1741) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1303765 d!141907))

(declare-fun d!141909 () Bool)

(assert (=> d!141909 (isDefined!507 (getValueByKey!698 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!583184 () Unit!43085)

(declare-fun choose!1916 (List!29765 (_ BitVec 64)) Unit!43085)

(assert (=> d!141909 (= lt!583184 (choose!1916 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!743786 () Bool)

(assert (=> d!141909 e!743786))

(declare-fun res!865706 () Bool)

(assert (=> d!141909 (=> (not res!865706) (not e!743786))))

(declare-fun isStrictlySorted!860 (List!29765) Bool)

(assert (=> d!141909 (= res!865706 (isStrictlySorted!860 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141909 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!583184)))

(declare-fun b!1303835 () Bool)

(assert (=> b!1303835 (= e!743786 (containsKey!724 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141909 res!865706) b!1303835))

(assert (=> d!141909 m!1194845))

(assert (=> d!141909 m!1194845))

(assert (=> d!141909 m!1194847))

(declare-fun m!1194891 () Bool)

(assert (=> d!141909 m!1194891))

(declare-fun m!1194893 () Bool)

(assert (=> d!141909 m!1194893))

(assert (=> b!1303835 m!1194841))

(assert (=> b!1303768 d!141909))

(declare-fun d!141911 () Bool)

(declare-fun isEmpty!1062 (Option!749) Bool)

(assert (=> d!141911 (= (isDefined!507 (getValueByKey!698 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1062 (getValueByKey!698 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37103 () Bool)

(assert (= bs!37103 d!141911))

(assert (=> bs!37103 m!1194845))

(declare-fun m!1194895 () Bool)

(assert (=> bs!37103 m!1194895))

(assert (=> b!1303768 d!141911))

(declare-fun b!1303845 () Bool)

(declare-fun e!743791 () Option!749)

(declare-fun e!743792 () Option!749)

(assert (=> b!1303845 (= e!743791 e!743792)))

(declare-fun c!125387 () Bool)

(assert (=> b!1303845 (= c!125387 (and ((_ is Cons!29761) (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11318 (h!30979 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun b!1303847 () Bool)

(assert (=> b!1303847 (= e!743792 None!747)))

(declare-fun b!1303844 () Bool)

(assert (=> b!1303844 (= e!743791 (Some!748 (_2!11318 (h!30979 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun d!141913 () Bool)

(declare-fun c!125386 () Bool)

(assert (=> d!141913 (= c!125386 (and ((_ is Cons!29761) (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11318 (h!30979 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141913 (= (getValueByKey!698 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!743791)))

(declare-fun b!1303846 () Bool)

(assert (=> b!1303846 (= e!743792 (getValueByKey!698 (t!43345 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141913 c!125386) b!1303844))

(assert (= (and d!141913 (not c!125386)) b!1303845))

(assert (= (and b!1303845 c!125387) b!1303846))

(assert (= (and b!1303845 (not c!125387)) b!1303847))

(declare-fun m!1194897 () Bool)

(assert (=> b!1303846 m!1194897))

(assert (=> b!1303768 d!141913))

(assert (=> b!1303804 d!141885))

(declare-fun d!141915 () Bool)

(declare-fun res!865711 () Bool)

(declare-fun e!743797 () Bool)

(assert (=> d!141915 (=> res!865711 e!743797)))

(assert (=> d!141915 (= res!865711 (and ((_ is Cons!29761) (toList!10155 (ListLongMap!20280 Nil!29762))) (= (_1!11318 (h!30979 (toList!10155 (ListLongMap!20280 Nil!29762)))) k0!1205)))))

(assert (=> d!141915 (= (containsKey!724 (toList!10155 (ListLongMap!20280 Nil!29762)) k0!1205) e!743797)))

(declare-fun b!1303852 () Bool)

(declare-fun e!743798 () Bool)

(assert (=> b!1303852 (= e!743797 e!743798)))

(declare-fun res!865712 () Bool)

(assert (=> b!1303852 (=> (not res!865712) (not e!743798))))

(assert (=> b!1303852 (= res!865712 (and (or (not ((_ is Cons!29761) (toList!10155 (ListLongMap!20280 Nil!29762)))) (bvsle (_1!11318 (h!30979 (toList!10155 (ListLongMap!20280 Nil!29762)))) k0!1205)) ((_ is Cons!29761) (toList!10155 (ListLongMap!20280 Nil!29762))) (bvslt (_1!11318 (h!30979 (toList!10155 (ListLongMap!20280 Nil!29762)))) k0!1205)))))

(declare-fun b!1303853 () Bool)

(assert (=> b!1303853 (= e!743798 (containsKey!724 (t!43345 (toList!10155 (ListLongMap!20280 Nil!29762))) k0!1205))))

(assert (= (and d!141915 (not res!865711)) b!1303852))

(assert (= (and b!1303852 res!865712) b!1303853))

(declare-fun m!1194899 () Bool)

(assert (=> b!1303853 m!1194899))

(assert (=> d!141881 d!141915))

(declare-fun b!1303854 () Bool)

(declare-fun e!743804 () Bool)

(declare-fun e!743799 () Bool)

(assert (=> b!1303854 (= e!743804 e!743799)))

(declare-fun c!125391 () Bool)

(declare-fun e!743802 () Bool)

(assert (=> b!1303854 (= c!125391 e!743802)))

(declare-fun res!865713 () Bool)

(assert (=> b!1303854 (=> (not res!865713) (not e!743802))))

(assert (=> b!1303854 (= res!865713 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42439 _keys!1741)))))

(declare-fun b!1303855 () Bool)

(declare-fun e!743801 () Bool)

(declare-fun lt!583191 () ListLongMap!20279)

(assert (=> b!1303855 (= e!743801 (isEmpty!1061 lt!583191))))

(declare-fun b!1303856 () Bool)

(assert (=> b!1303856 (= e!743802 (validKeyInArray!0 (select (arr!41888 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1303856 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1303857 () Bool)

(assert (=> b!1303857 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42439 _keys!1741)))))

(assert (=> b!1303857 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42440 _values!1445)))))

(declare-fun e!743803 () Bool)

(assert (=> b!1303857 (= e!743803 (= (apply!1028 lt!583191 (select (arr!41888 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))) (get!21199 (select (arr!41889 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1303858 () Bool)

(assert (=> b!1303858 (= e!743799 e!743803)))

(assert (=> b!1303858 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42439 _keys!1741)))))

(declare-fun res!865714 () Bool)

(assert (=> b!1303858 (= res!865714 (contains!8297 lt!583191 (select (arr!41888 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1303858 (=> (not res!865714) (not e!743803))))

(declare-fun b!1303859 () Bool)

(declare-fun e!743800 () ListLongMap!20279)

(declare-fun call!64209 () ListLongMap!20279)

(assert (=> b!1303859 (= e!743800 call!64209)))

(declare-fun b!1303860 () Bool)

(declare-fun e!743805 () ListLongMap!20279)

(assert (=> b!1303860 (= e!743805 (ListLongMap!20280 Nil!29762))))

(declare-fun b!1303861 () Bool)

(declare-fun lt!583190 () Unit!43085)

(declare-fun lt!583186 () Unit!43085)

(assert (=> b!1303861 (= lt!583190 lt!583186)))

(declare-fun lt!583188 () (_ BitVec 64))

(declare-fun lt!583187 () V!51601)

(declare-fun lt!583185 () (_ BitVec 64))

(declare-fun lt!583189 () ListLongMap!20279)

(assert (=> b!1303861 (not (contains!8297 (+!4520 lt!583189 (tuple2!22615 lt!583188 lt!583187)) lt!583185))))

(assert (=> b!1303861 (= lt!583186 (addStillNotContains!471 lt!583189 lt!583188 lt!583187 lt!583185))))

(assert (=> b!1303861 (= lt!583185 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1303861 (= lt!583187 (get!21199 (select (arr!41889 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1303861 (= lt!583188 (select (arr!41888 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (=> b!1303861 (= lt!583189 call!64209)))

(assert (=> b!1303861 (= e!743800 (+!4520 call!64209 (tuple2!22615 (select (arr!41888 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)) (get!21199 (select (arr!41889 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1303862 () Bool)

(assert (=> b!1303862 (= e!743801 (= lt!583191 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun d!141917 () Bool)

(assert (=> d!141917 e!743804))

(declare-fun res!865716 () Bool)

(assert (=> d!141917 (=> (not res!865716) (not e!743804))))

(assert (=> d!141917 (= res!865716 (not (contains!8297 lt!583191 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141917 (= lt!583191 e!743805)))

(declare-fun c!125388 () Bool)

(assert (=> d!141917 (= c!125388 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) (size!42439 _keys!1741)))))

(assert (=> d!141917 (validMask!0 mask!2175)))

(assert (=> d!141917 (= (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) lt!583191)))

(declare-fun b!1303863 () Bool)

(assert (=> b!1303863 (= e!743805 e!743800)))

(declare-fun c!125389 () Bool)

(assert (=> b!1303863 (= c!125389 (validKeyInArray!0 (select (arr!41888 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(declare-fun bm!64206 () Bool)

(assert (=> bm!64206 (= call!64209 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1303864 () Bool)

(declare-fun res!865715 () Bool)

(assert (=> b!1303864 (=> (not res!865715) (not e!743804))))

(assert (=> b!1303864 (= res!865715 (not (contains!8297 lt!583191 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1303865 () Bool)

(assert (=> b!1303865 (= e!743799 e!743801)))

(declare-fun c!125390 () Bool)

(assert (=> b!1303865 (= c!125390 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42439 _keys!1741)))))

(assert (= (and d!141917 c!125388) b!1303860))

(assert (= (and d!141917 (not c!125388)) b!1303863))

(assert (= (and b!1303863 c!125389) b!1303861))

(assert (= (and b!1303863 (not c!125389)) b!1303859))

(assert (= (or b!1303861 b!1303859) bm!64206))

(assert (= (and d!141917 res!865716) b!1303864))

(assert (= (and b!1303864 res!865715) b!1303854))

(assert (= (and b!1303854 res!865713) b!1303856))

(assert (= (and b!1303854 c!125391) b!1303858))

(assert (= (and b!1303854 (not c!125391)) b!1303865))

(assert (= (and b!1303858 res!865714) b!1303857))

(assert (= (and b!1303865 c!125390) b!1303862))

(assert (= (and b!1303865 (not c!125390)) b!1303855))

(declare-fun b_lambda!23237 () Bool)

(assert (=> (not b_lambda!23237) (not b!1303857)))

(assert (=> b!1303857 t!43349))

(declare-fun b_and!47389 () Bool)

(assert (= b_and!47387 (and (=> t!43349 result!23793) b_and!47389)))

(declare-fun b_lambda!23239 () Bool)

(assert (=> (not b_lambda!23239) (not b!1303861)))

(assert (=> b!1303861 t!43349))

(declare-fun b_and!47391 () Bool)

(assert (= b_and!47389 (and (=> t!43349 result!23793) b_and!47391)))

(declare-fun m!1194901 () Bool)

(assert (=> b!1303864 m!1194901))

(declare-fun m!1194903 () Bool)

(assert (=> b!1303863 m!1194903))

(assert (=> b!1303863 m!1194903))

(declare-fun m!1194905 () Bool)

(assert (=> b!1303863 m!1194905))

(assert (=> b!1303856 m!1194903))

(assert (=> b!1303856 m!1194903))

(assert (=> b!1303856 m!1194905))

(declare-fun m!1194907 () Bool)

(assert (=> b!1303862 m!1194907))

(assert (=> b!1303857 m!1194825))

(assert (=> b!1303857 m!1194903))

(declare-fun m!1194909 () Bool)

(assert (=> b!1303857 m!1194909))

(declare-fun m!1194911 () Bool)

(assert (=> b!1303857 m!1194911))

(assert (=> b!1303857 m!1194911))

(assert (=> b!1303857 m!1194825))

(declare-fun m!1194913 () Bool)

(assert (=> b!1303857 m!1194913))

(assert (=> b!1303857 m!1194903))

(declare-fun m!1194915 () Bool)

(assert (=> b!1303861 m!1194915))

(assert (=> b!1303861 m!1194825))

(declare-fun m!1194917 () Bool)

(assert (=> b!1303861 m!1194917))

(declare-fun m!1194919 () Bool)

(assert (=> b!1303861 m!1194919))

(declare-fun m!1194921 () Bool)

(assert (=> b!1303861 m!1194921))

(assert (=> b!1303861 m!1194911))

(assert (=> b!1303861 m!1194919))

(assert (=> b!1303861 m!1194911))

(assert (=> b!1303861 m!1194825))

(assert (=> b!1303861 m!1194913))

(assert (=> b!1303861 m!1194903))

(assert (=> b!1303858 m!1194903))

(assert (=> b!1303858 m!1194903))

(declare-fun m!1194923 () Bool)

(assert (=> b!1303858 m!1194923))

(assert (=> bm!64206 m!1194907))

(declare-fun m!1194925 () Bool)

(assert (=> d!141917 m!1194925))

(assert (=> d!141917 m!1194693))

(declare-fun m!1194927 () Bool)

(assert (=> b!1303855 m!1194927))

(assert (=> bm!64202 d!141917))

(declare-fun d!141919 () Bool)

(declare-fun res!865717 () Bool)

(declare-fun e!743806 () Bool)

(assert (=> d!141919 (=> res!865717 e!743806)))

(assert (=> d!141919 (= res!865717 (and ((_ is Cons!29761) (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11318 (h!30979 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141919 (= (containsKey!724 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!743806)))

(declare-fun b!1303866 () Bool)

(declare-fun e!743807 () Bool)

(assert (=> b!1303866 (= e!743806 e!743807)))

(declare-fun res!865718 () Bool)

(assert (=> b!1303866 (=> (not res!865718) (not e!743807))))

(assert (=> b!1303866 (= res!865718 (and (or (not ((_ is Cons!29761) (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11318 (h!30979 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29761) (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11318 (h!30979 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1303867 () Bool)

(assert (=> b!1303867 (= e!743807 (containsKey!724 (t!43345 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141919 (not res!865717)) b!1303866))

(assert (= (and b!1303866 res!865718) b!1303867))

(declare-fun m!1194929 () Bool)

(assert (=> b!1303867 m!1194929))

(assert (=> d!141887 d!141919))

(assert (=> d!141889 d!141897))

(declare-fun d!141921 () Bool)

(declare-fun lt!583194 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!644 (List!29766) (InoxSet (_ BitVec 64)))

(assert (=> d!141921 (= lt!583194 (select (content!644 Nil!29763) (select (arr!41888 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun e!743813 () Bool)

(assert (=> d!141921 (= lt!583194 e!743813)))

(declare-fun res!865723 () Bool)

(assert (=> d!141921 (=> (not res!865723) (not e!743813))))

(assert (=> d!141921 (= res!865723 ((_ is Cons!29762) Nil!29763))))

(assert (=> d!141921 (= (contains!8299 Nil!29763 (select (arr!41888 _keys!1741) #b00000000000000000000000000000000)) lt!583194)))

(declare-fun b!1303872 () Bool)

(declare-fun e!743812 () Bool)

(assert (=> b!1303872 (= e!743813 e!743812)))

(declare-fun res!865724 () Bool)

(assert (=> b!1303872 (=> res!865724 e!743812)))

(assert (=> b!1303872 (= res!865724 (= (h!30980 Nil!29763) (select (arr!41888 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303873 () Bool)

(assert (=> b!1303873 (= e!743812 (contains!8299 (t!43346 Nil!29763) (select (arr!41888 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141921 res!865723) b!1303872))

(assert (= (and b!1303872 (not res!865724)) b!1303873))

(declare-fun m!1194931 () Bool)

(assert (=> d!141921 m!1194931))

(assert (=> d!141921 m!1194833))

(declare-fun m!1194933 () Bool)

(assert (=> d!141921 m!1194933))

(assert (=> b!1303873 m!1194833))

(declare-fun m!1194935 () Bool)

(assert (=> b!1303873 m!1194935))

(assert (=> b!1303767 d!141921))

(assert (=> b!1303770 d!141911))

(assert (=> b!1303770 d!141913))

(declare-fun d!141923 () Bool)

(declare-fun e!743814 () Bool)

(assert (=> d!141923 e!743814))

(declare-fun res!865725 () Bool)

(assert (=> d!141923 (=> res!865725 e!743814)))

(declare-fun lt!583196 () Bool)

(assert (=> d!141923 (= res!865725 (not lt!583196))))

(declare-fun lt!583198 () Bool)

(assert (=> d!141923 (= lt!583196 lt!583198)))

(declare-fun lt!583197 () Unit!43085)

(declare-fun e!743815 () Unit!43085)

(assert (=> d!141923 (= lt!583197 e!743815)))

(declare-fun c!125392 () Bool)

(assert (=> d!141923 (= c!125392 lt!583198)))

(assert (=> d!141923 (= lt!583198 (containsKey!724 (toList!10155 lt!583160) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141923 (= (contains!8297 lt!583160 #b1000000000000000000000000000000000000000000000000000000000000000) lt!583196)))

(declare-fun b!1303874 () Bool)

(declare-fun lt!583195 () Unit!43085)

(assert (=> b!1303874 (= e!743815 lt!583195)))

(assert (=> b!1303874 (= lt!583195 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10155 lt!583160) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303874 (isDefined!507 (getValueByKey!698 (toList!10155 lt!583160) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303875 () Bool)

(declare-fun Unit!43091 () Unit!43085)

(assert (=> b!1303875 (= e!743815 Unit!43091)))

(declare-fun b!1303876 () Bool)

(assert (=> b!1303876 (= e!743814 (isDefined!507 (getValueByKey!698 (toList!10155 lt!583160) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141923 c!125392) b!1303874))

(assert (= (and d!141923 (not c!125392)) b!1303875))

(assert (= (and d!141923 (not res!865725)) b!1303876))

(declare-fun m!1194937 () Bool)

(assert (=> d!141923 m!1194937))

(declare-fun m!1194939 () Bool)

(assert (=> b!1303874 m!1194939))

(declare-fun m!1194941 () Bool)

(assert (=> b!1303874 m!1194941))

(assert (=> b!1303874 m!1194941))

(declare-fun m!1194943 () Bool)

(assert (=> b!1303874 m!1194943))

(assert (=> b!1303876 m!1194941))

(assert (=> b!1303876 m!1194941))

(assert (=> b!1303876 m!1194943))

(assert (=> b!1303805 d!141923))

(assert (=> b!1303744 d!141885))

(declare-fun b!1303877 () Bool)

(declare-fun e!743818 () Bool)

(declare-fun call!64210 () Bool)

(assert (=> b!1303877 (= e!743818 call!64210)))

(declare-fun b!1303879 () Bool)

(declare-fun e!743817 () Bool)

(assert (=> b!1303879 (= e!743817 e!743818)))

(declare-fun c!125393 () Bool)

(assert (=> b!1303879 (= c!125393 (validKeyInArray!0 (select (arr!41888 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1303880 () Bool)

(assert (=> b!1303880 (= e!743818 call!64210)))

(declare-fun b!1303881 () Bool)

(declare-fun e!743819 () Bool)

(assert (=> b!1303881 (= e!743819 (contains!8299 (ite c!125365 (Cons!29762 (select (arr!41888 _keys!1741) #b00000000000000000000000000000000) Nil!29763) Nil!29763) (select (arr!41888 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!64207 () Bool)

(assert (=> bm!64207 (= call!64210 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125393 (Cons!29762 (select (arr!41888 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125365 (Cons!29762 (select (arr!41888 _keys!1741) #b00000000000000000000000000000000) Nil!29763) Nil!29763)) (ite c!125365 (Cons!29762 (select (arr!41888 _keys!1741) #b00000000000000000000000000000000) Nil!29763) Nil!29763))))))

(declare-fun d!141925 () Bool)

(declare-fun res!865726 () Bool)

(declare-fun e!743816 () Bool)

(assert (=> d!141925 (=> res!865726 e!743816)))

(assert (=> d!141925 (= res!865726 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42439 _keys!1741)))))

(assert (=> d!141925 (= (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125365 (Cons!29762 (select (arr!41888 _keys!1741) #b00000000000000000000000000000000) Nil!29763) Nil!29763)) e!743816)))

(declare-fun b!1303878 () Bool)

(assert (=> b!1303878 (= e!743816 e!743817)))

(declare-fun res!865728 () Bool)

(assert (=> b!1303878 (=> (not res!865728) (not e!743817))))

(assert (=> b!1303878 (= res!865728 (not e!743819))))

(declare-fun res!865727 () Bool)

(assert (=> b!1303878 (=> (not res!865727) (not e!743819))))

(assert (=> b!1303878 (= res!865727 (validKeyInArray!0 (select (arr!41888 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!141925 (not res!865726)) b!1303878))

(assert (= (and b!1303878 res!865727) b!1303881))

(assert (= (and b!1303878 res!865728) b!1303879))

(assert (= (and b!1303879 c!125393) b!1303880))

(assert (= (and b!1303879 (not c!125393)) b!1303877))

(assert (= (or b!1303880 b!1303877) bm!64207))

(declare-fun m!1194945 () Bool)

(assert (=> b!1303879 m!1194945))

(assert (=> b!1303879 m!1194945))

(declare-fun m!1194947 () Bool)

(assert (=> b!1303879 m!1194947))

(assert (=> b!1303881 m!1194945))

(assert (=> b!1303881 m!1194945))

(declare-fun m!1194949 () Bool)

(assert (=> b!1303881 m!1194949))

(assert (=> bm!64207 m!1194945))

(declare-fun m!1194951 () Bool)

(assert (=> bm!64207 m!1194951))

(assert (=> b!1303878 m!1194945))

(assert (=> b!1303878 m!1194945))

(assert (=> b!1303878 m!1194947))

(assert (=> bm!64199 d!141925))

(assert (=> b!1303745 d!141885))

(declare-fun d!141927 () Bool)

(declare-fun get!21200 (Option!749) V!51601)

(assert (=> d!141927 (= (apply!1028 lt!583131 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21200 (getValueByKey!698 (toList!10155 lt!583131) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37104 () Bool)

(assert (= bs!37104 d!141927))

(declare-fun m!1194953 () Bool)

(assert (=> bs!37104 m!1194953))

(assert (=> bs!37104 m!1194953))

(declare-fun m!1194955 () Bool)

(assert (=> bs!37104 m!1194955))

(assert (=> b!1303730 d!141927))

(declare-fun d!141929 () Bool)

(declare-fun e!743820 () Bool)

(assert (=> d!141929 e!743820))

(declare-fun res!865729 () Bool)

(assert (=> d!141929 (=> res!865729 e!743820)))

(declare-fun lt!583200 () Bool)

(assert (=> d!141929 (= res!865729 (not lt!583200))))

(declare-fun lt!583202 () Bool)

(assert (=> d!141929 (= lt!583200 lt!583202)))

(declare-fun lt!583201 () Unit!43085)

(declare-fun e!743821 () Unit!43085)

(assert (=> d!141929 (= lt!583201 e!743821)))

(declare-fun c!125394 () Bool)

(assert (=> d!141929 (= c!125394 lt!583202)))

(assert (=> d!141929 (= lt!583202 (containsKey!724 (toList!10155 lt!583131) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141929 (= (contains!8297 lt!583131 #b0000000000000000000000000000000000000000000000000000000000000000) lt!583200)))

(declare-fun b!1303882 () Bool)

(declare-fun lt!583199 () Unit!43085)

(assert (=> b!1303882 (= e!743821 lt!583199)))

(assert (=> b!1303882 (= lt!583199 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10155 lt!583131) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303882 (isDefined!507 (getValueByKey!698 (toList!10155 lt!583131) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303883 () Bool)

(declare-fun Unit!43092 () Unit!43085)

(assert (=> b!1303883 (= e!743821 Unit!43092)))

(declare-fun b!1303884 () Bool)

(assert (=> b!1303884 (= e!743820 (isDefined!507 (getValueByKey!698 (toList!10155 lt!583131) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141929 c!125394) b!1303882))

(assert (= (and d!141929 (not c!125394)) b!1303883))

(assert (= (and d!141929 (not res!865729)) b!1303884))

(declare-fun m!1194957 () Bool)

(assert (=> d!141929 m!1194957))

(declare-fun m!1194959 () Bool)

(assert (=> b!1303882 m!1194959))

(declare-fun m!1194961 () Bool)

(assert (=> b!1303882 m!1194961))

(assert (=> b!1303882 m!1194961))

(declare-fun m!1194963 () Bool)

(assert (=> b!1303882 m!1194963))

(assert (=> b!1303884 m!1194961))

(assert (=> b!1303884 m!1194961))

(assert (=> b!1303884 m!1194963))

(assert (=> bm!64190 d!141929))

(assert (=> d!141883 d!141881))

(declare-fun d!141931 () Bool)

(assert (=> d!141931 (not (contains!8297 (ListLongMap!20280 Nil!29762) k0!1205))))

(assert (=> d!141931 true))

(declare-fun _$29!195 () Unit!43085)

(assert (=> d!141931 (= (choose!1915 k0!1205) _$29!195)))

(declare-fun bs!37105 () Bool)

(assert (= bs!37105 d!141931))

(assert (=> bs!37105 m!1194689))

(assert (=> d!141883 d!141931))

(declare-fun d!141933 () Bool)

(assert (=> d!141933 (= (apply!1028 lt!583131 (select (arr!41888 _keys!1741) from!2144)) (get!21200 (getValueByKey!698 (toList!10155 lt!583131) (select (arr!41888 _keys!1741) from!2144))))))

(declare-fun bs!37106 () Bool)

(assert (= bs!37106 d!141933))

(assert (=> bs!37106 m!1194685))

(declare-fun m!1194965 () Bool)

(assert (=> bs!37106 m!1194965))

(assert (=> bs!37106 m!1194965))

(declare-fun m!1194967 () Bool)

(assert (=> bs!37106 m!1194967))

(assert (=> b!1303746 d!141933))

(declare-fun d!141935 () Bool)

(declare-fun c!125397 () Bool)

(assert (=> d!141935 (= c!125397 ((_ is ValueCellFull!16538) (select (arr!41889 _values!1445) from!2144)))))

(declare-fun e!743824 () V!51601)

(assert (=> d!141935 (= (get!21199 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) e!743824)))

(declare-fun b!1303889 () Bool)

(declare-fun get!21201 (ValueCell!16538 V!51601) V!51601)

(assert (=> b!1303889 (= e!743824 (get!21201 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1303890 () Bool)

(declare-fun get!21202 (ValueCell!16538 V!51601) V!51601)

(assert (=> b!1303890 (= e!743824 (get!21202 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141935 c!125397) b!1303889))

(assert (= (and d!141935 (not c!125397)) b!1303890))

(assert (=> b!1303889 m!1194823))

(assert (=> b!1303889 m!1194825))

(declare-fun m!1194969 () Bool)

(assert (=> b!1303889 m!1194969))

(assert (=> b!1303890 m!1194823))

(assert (=> b!1303890 m!1194825))

(declare-fun m!1194971 () Bool)

(assert (=> b!1303890 m!1194971))

(assert (=> b!1303746 d!141935))

(declare-fun bm!64208 () Bool)

(declare-fun call!64211 () Bool)

(assert (=> bm!64208 (= call!64211 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1303891 () Bool)

(declare-fun e!743825 () Bool)

(declare-fun e!743826 () Bool)

(assert (=> b!1303891 (= e!743825 e!743826)))

(declare-fun lt!583203 () (_ BitVec 64))

(assert (=> b!1303891 (= lt!583203 (select (arr!41888 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!583204 () Unit!43085)

(assert (=> b!1303891 (= lt!583204 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583203 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1303891 (arrayContainsKey!0 _keys!1741 lt!583203 #b00000000000000000000000000000000)))

(declare-fun lt!583205 () Unit!43085)

(assert (=> b!1303891 (= lt!583205 lt!583204)))

(declare-fun res!865730 () Bool)

(assert (=> b!1303891 (= res!865730 (= (seekEntryOrOpen!0 (select (arr!41888 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1741 mask!2175) (Found!9978 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1303891 (=> (not res!865730) (not e!743826))))

(declare-fun b!1303892 () Bool)

(assert (=> b!1303892 (= e!743826 call!64211)))

(declare-fun d!141937 () Bool)

(declare-fun res!865731 () Bool)

(declare-fun e!743827 () Bool)

(assert (=> d!141937 (=> res!865731 e!743827)))

(assert (=> d!141937 (= res!865731 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42439 _keys!1741)))))

(assert (=> d!141937 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175) e!743827)))

(declare-fun b!1303893 () Bool)

(assert (=> b!1303893 (= e!743825 call!64211)))

(declare-fun b!1303894 () Bool)

(assert (=> b!1303894 (= e!743827 e!743825)))

(declare-fun c!125398 () Bool)

(assert (=> b!1303894 (= c!125398 (validKeyInArray!0 (select (arr!41888 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!141937 (not res!865731)) b!1303894))

(assert (= (and b!1303894 c!125398) b!1303891))

(assert (= (and b!1303894 (not c!125398)) b!1303893))

(assert (= (and b!1303891 res!865730) b!1303892))

(assert (= (or b!1303892 b!1303893) bm!64208))

(declare-fun m!1194973 () Bool)

(assert (=> bm!64208 m!1194973))

(assert (=> b!1303891 m!1194945))

(declare-fun m!1194975 () Bool)

(assert (=> b!1303891 m!1194975))

(declare-fun m!1194977 () Bool)

(assert (=> b!1303891 m!1194977))

(assert (=> b!1303891 m!1194945))

(declare-fun m!1194979 () Bool)

(assert (=> b!1303891 m!1194979))

(assert (=> b!1303894 m!1194945))

(assert (=> b!1303894 m!1194945))

(assert (=> b!1303894 m!1194947))

(assert (=> bm!64205 d!141937))

(declare-fun d!141939 () Bool)

(assert (=> d!141939 (arrayContainsKey!0 _keys!1741 lt!583167 #b00000000000000000000000000000000)))

(declare-fun lt!583208 () Unit!43085)

(declare-fun choose!13 (array!86797 (_ BitVec 64) (_ BitVec 32)) Unit!43085)

(assert (=> d!141939 (= lt!583208 (choose!13 _keys!1741 lt!583167 #b00000000000000000000000000000000))))

(assert (=> d!141939 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!141939 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583167 #b00000000000000000000000000000000) lt!583208)))

(declare-fun bs!37107 () Bool)

(assert (= bs!37107 d!141939))

(assert (=> bs!37107 m!1194873))

(declare-fun m!1194981 () Bool)

(assert (=> bs!37107 m!1194981))

(assert (=> b!1303815 d!141939))

(declare-fun d!141941 () Bool)

(declare-fun res!865736 () Bool)

(declare-fun e!743832 () Bool)

(assert (=> d!141941 (=> res!865736 e!743832)))

(assert (=> d!141941 (= res!865736 (= (select (arr!41888 _keys!1741) #b00000000000000000000000000000000) lt!583167))))

(assert (=> d!141941 (= (arrayContainsKey!0 _keys!1741 lt!583167 #b00000000000000000000000000000000) e!743832)))

(declare-fun b!1303899 () Bool)

(declare-fun e!743833 () Bool)

(assert (=> b!1303899 (= e!743832 e!743833)))

(declare-fun res!865737 () Bool)

(assert (=> b!1303899 (=> (not res!865737) (not e!743833))))

(assert (=> b!1303899 (= res!865737 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42439 _keys!1741)))))

(declare-fun b!1303900 () Bool)

(assert (=> b!1303900 (= e!743833 (arrayContainsKey!0 _keys!1741 lt!583167 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!141941 (not res!865736)) b!1303899))

(assert (= (and b!1303899 res!865737) b!1303900))

(assert (=> d!141941 m!1194833))

(declare-fun m!1194983 () Bool)

(assert (=> b!1303900 m!1194983))

(assert (=> b!1303815 d!141941))

(declare-fun b!1303913 () Bool)

(declare-fun e!743842 () SeekEntryResult!9978)

(declare-fun lt!583217 () SeekEntryResult!9978)

(assert (=> b!1303913 (= e!743842 (MissingZero!9978 (index!42285 lt!583217)))))

(declare-fun b!1303915 () Bool)

(declare-fun e!743840 () SeekEntryResult!9978)

(assert (=> b!1303915 (= e!743840 (Found!9978 (index!42285 lt!583217)))))

(declare-fun b!1303916 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86797 (_ BitVec 32)) SeekEntryResult!9978)

(assert (=> b!1303916 (= e!743842 (seekKeyOrZeroReturnVacant!0 (x!115654 lt!583217) (index!42285 lt!583217) (index!42285 lt!583217) (select (arr!41888 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(declare-fun b!1303914 () Bool)

(declare-fun e!743841 () SeekEntryResult!9978)

(assert (=> b!1303914 (= e!743841 Undefined!9978)))

(declare-fun d!141943 () Bool)

(declare-fun lt!583215 () SeekEntryResult!9978)

(assert (=> d!141943 (and (or ((_ is Undefined!9978) lt!583215) (not ((_ is Found!9978) lt!583215)) (and (bvsge (index!42284 lt!583215) #b00000000000000000000000000000000) (bvslt (index!42284 lt!583215) (size!42439 _keys!1741)))) (or ((_ is Undefined!9978) lt!583215) ((_ is Found!9978) lt!583215) (not ((_ is MissingZero!9978) lt!583215)) (and (bvsge (index!42283 lt!583215) #b00000000000000000000000000000000) (bvslt (index!42283 lt!583215) (size!42439 _keys!1741)))) (or ((_ is Undefined!9978) lt!583215) ((_ is Found!9978) lt!583215) ((_ is MissingZero!9978) lt!583215) (not ((_ is MissingVacant!9978) lt!583215)) (and (bvsge (index!42286 lt!583215) #b00000000000000000000000000000000) (bvslt (index!42286 lt!583215) (size!42439 _keys!1741)))) (or ((_ is Undefined!9978) lt!583215) (ite ((_ is Found!9978) lt!583215) (= (select (arr!41888 _keys!1741) (index!42284 lt!583215)) (select (arr!41888 _keys!1741) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9978) lt!583215) (= (select (arr!41888 _keys!1741) (index!42283 lt!583215)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9978) lt!583215) (= (select (arr!41888 _keys!1741) (index!42286 lt!583215)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141943 (= lt!583215 e!743841)))

(declare-fun c!125407 () Bool)

(assert (=> d!141943 (= c!125407 (and ((_ is Intermediate!9978) lt!583217) (undefined!10790 lt!583217)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86797 (_ BitVec 32)) SeekEntryResult!9978)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!141943 (= lt!583217 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!41888 _keys!1741) #b00000000000000000000000000000000) mask!2175) (select (arr!41888 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(assert (=> d!141943 (validMask!0 mask!2175)))

(assert (=> d!141943 (= (seekEntryOrOpen!0 (select (arr!41888 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) lt!583215)))

(declare-fun b!1303917 () Bool)

(declare-fun c!125405 () Bool)

(declare-fun lt!583216 () (_ BitVec 64))

(assert (=> b!1303917 (= c!125405 (= lt!583216 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303917 (= e!743840 e!743842)))

(declare-fun b!1303918 () Bool)

(assert (=> b!1303918 (= e!743841 e!743840)))

(assert (=> b!1303918 (= lt!583216 (select (arr!41888 _keys!1741) (index!42285 lt!583217)))))

(declare-fun c!125406 () Bool)

(assert (=> b!1303918 (= c!125406 (= lt!583216 (select (arr!41888 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141943 c!125407) b!1303914))

(assert (= (and d!141943 (not c!125407)) b!1303918))

(assert (= (and b!1303918 c!125406) b!1303915))

(assert (= (and b!1303918 (not c!125406)) b!1303917))

(assert (= (and b!1303917 c!125405) b!1303913))

(assert (= (and b!1303917 (not c!125405)) b!1303916))

(assert (=> b!1303916 m!1194833))

(declare-fun m!1194985 () Bool)

(assert (=> b!1303916 m!1194985))

(declare-fun m!1194987 () Bool)

(assert (=> d!141943 m!1194987))

(assert (=> d!141943 m!1194693))

(declare-fun m!1194989 () Bool)

(assert (=> d!141943 m!1194989))

(assert (=> d!141943 m!1194833))

(declare-fun m!1194991 () Bool)

(assert (=> d!141943 m!1194991))

(declare-fun m!1194993 () Bool)

(assert (=> d!141943 m!1194993))

(assert (=> d!141943 m!1194991))

(assert (=> d!141943 m!1194833))

(declare-fun m!1194995 () Bool)

(assert (=> d!141943 m!1194995))

(declare-fun m!1194997 () Bool)

(assert (=> b!1303918 m!1194997))

(assert (=> b!1303815 d!141943))

(declare-fun d!141945 () Bool)

(assert (=> d!141945 (isDefined!507 (getValueByKey!698 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!583218 () Unit!43085)

(assert (=> d!141945 (= lt!583218 (choose!1916 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!743843 () Bool)

(assert (=> d!141945 e!743843))

(declare-fun res!865738 () Bool)

(assert (=> d!141945 (=> (not res!865738) (not e!743843))))

(assert (=> d!141945 (= res!865738 (isStrictlySorted!860 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141945 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!583218)))

(declare-fun b!1303919 () Bool)

(assert (=> b!1303919 (= e!743843 (containsKey!724 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141945 res!865738) b!1303919))

(assert (=> d!141945 m!1194777))

(assert (=> d!141945 m!1194777))

(assert (=> d!141945 m!1194779))

(declare-fun m!1194999 () Bool)

(assert (=> d!141945 m!1194999))

(declare-fun m!1195001 () Bool)

(assert (=> d!141945 m!1195001))

(assert (=> b!1303919 m!1194773))

(assert (=> b!1303685 d!141945))

(declare-fun d!141947 () Bool)

(assert (=> d!141947 (= (isDefined!507 (getValueByKey!698 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1062 (getValueByKey!698 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37108 () Bool)

(assert (= bs!37108 d!141947))

(assert (=> bs!37108 m!1194777))

(declare-fun m!1195003 () Bool)

(assert (=> bs!37108 m!1195003))

(assert (=> b!1303685 d!141947))

(declare-fun b!1303921 () Bool)

(declare-fun e!743844 () Option!749)

(declare-fun e!743845 () Option!749)

(assert (=> b!1303921 (= e!743844 e!743845)))

(declare-fun c!125409 () Bool)

(assert (=> b!1303921 (= c!125409 (and ((_ is Cons!29761) (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11318 (h!30979 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun b!1303923 () Bool)

(assert (=> b!1303923 (= e!743845 None!747)))

(declare-fun b!1303920 () Bool)

(assert (=> b!1303920 (= e!743844 (Some!748 (_2!11318 (h!30979 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun d!141949 () Bool)

(declare-fun c!125408 () Bool)

(assert (=> d!141949 (= c!125408 (and ((_ is Cons!29761) (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11318 (h!30979 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141949 (= (getValueByKey!698 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!743844)))

(declare-fun b!1303922 () Bool)

(assert (=> b!1303922 (= e!743845 (getValueByKey!698 (t!43345 (toList!10155 (getCurrentListMap!5167 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141949 c!125408) b!1303920))

(assert (= (and d!141949 (not c!125408)) b!1303921))

(assert (= (and b!1303921 c!125409) b!1303922))

(assert (= (and b!1303921 (not c!125409)) b!1303923))

(declare-fun m!1195005 () Bool)

(assert (=> b!1303922 m!1195005))

(assert (=> b!1303685 d!141949))

(declare-fun d!141951 () Bool)

(declare-fun e!743846 () Bool)

(assert (=> d!141951 e!743846))

(declare-fun res!865739 () Bool)

(assert (=> d!141951 (=> res!865739 e!743846)))

(declare-fun lt!583220 () Bool)

(assert (=> d!141951 (= res!865739 (not lt!583220))))

(declare-fun lt!583222 () Bool)

(assert (=> d!141951 (= lt!583220 lt!583222)))

(declare-fun lt!583221 () Unit!43085)

(declare-fun e!743847 () Unit!43085)

(assert (=> d!141951 (= lt!583221 e!743847)))

(declare-fun c!125410 () Bool)

(assert (=> d!141951 (= c!125410 lt!583222)))

(assert (=> d!141951 (= lt!583222 (containsKey!724 (toList!10155 lt!583160) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141951 (= (contains!8297 lt!583160 #b0000000000000000000000000000000000000000000000000000000000000000) lt!583220)))

(declare-fun b!1303924 () Bool)

(declare-fun lt!583219 () Unit!43085)

(assert (=> b!1303924 (= e!743847 lt!583219)))

(assert (=> b!1303924 (= lt!583219 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10155 lt!583160) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303924 (isDefined!507 (getValueByKey!698 (toList!10155 lt!583160) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303925 () Bool)

(declare-fun Unit!43093 () Unit!43085)

(assert (=> b!1303925 (= e!743847 Unit!43093)))

(declare-fun b!1303926 () Bool)

(assert (=> b!1303926 (= e!743846 (isDefined!507 (getValueByKey!698 (toList!10155 lt!583160) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141951 c!125410) b!1303924))

(assert (= (and d!141951 (not c!125410)) b!1303925))

(assert (= (and d!141951 (not res!865739)) b!1303926))

(declare-fun m!1195007 () Bool)

(assert (=> d!141951 m!1195007))

(declare-fun m!1195009 () Bool)

(assert (=> b!1303924 m!1195009))

(declare-fun m!1195011 () Bool)

(assert (=> b!1303924 m!1195011))

(assert (=> b!1303924 m!1195011))

(declare-fun m!1195013 () Bool)

(assert (=> b!1303924 m!1195013))

(assert (=> b!1303926 m!1195011))

(assert (=> b!1303926 m!1195011))

(assert (=> b!1303926 m!1195013))

(assert (=> d!141895 d!141951))

(assert (=> d!141895 d!141897))

(declare-fun d!141953 () Bool)

(declare-fun res!865740 () Bool)

(declare-fun e!743848 () Bool)

(assert (=> d!141953 (=> res!865740 e!743848)))

(assert (=> d!141953 (= res!865740 (and ((_ is Cons!29761) (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11318 (h!30979 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141953 (= (containsKey!724 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!743848)))

(declare-fun b!1303927 () Bool)

(declare-fun e!743849 () Bool)

(assert (=> b!1303927 (= e!743848 e!743849)))

(declare-fun res!865741 () Bool)

(assert (=> b!1303927 (=> (not res!865741) (not e!743849))))

(assert (=> b!1303927 (= res!865741 (and (or (not ((_ is Cons!29761) (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11318 (h!30979 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29761) (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11318 (h!30979 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1303928 () Bool)

(assert (=> b!1303928 (= e!743849 (containsKey!724 (t!43345 (toList!10155 (getCurrentListMapNoExtraKeys!6158 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141953 (not res!865740)) b!1303927))

(assert (= (and b!1303927 res!865741) b!1303928))

(declare-fun m!1195015 () Bool)

(assert (=> b!1303928 m!1195015))

(assert (=> d!141893 d!141953))

(declare-fun d!141955 () Bool)

(assert (=> d!141955 (= (apply!1028 lt!583131 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21200 (getValueByKey!698 (toList!10155 lt!583131) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37109 () Bool)

(assert (= bs!37109 d!141955))

(assert (=> bs!37109 m!1194961))

(assert (=> bs!37109 m!1194961))

(declare-fun m!1195017 () Bool)

(assert (=> bs!37109 m!1195017))

(assert (=> b!1303736 d!141955))

(assert (=> b!1303818 d!141907))

(assert (=> b!1303687 d!141947))

(assert (=> b!1303687 d!141949))

(declare-fun d!141957 () Bool)

(declare-fun isEmpty!1063 (List!29765) Bool)

(assert (=> d!141957 (= (isEmpty!1061 lt!583160) (isEmpty!1063 (toList!10155 lt!583160)))))

(declare-fun bs!37110 () Bool)

(assert (= bs!37110 d!141957))

(declare-fun m!1195019 () Bool)

(assert (=> bs!37110 m!1195019))

(assert (=> b!1303796 d!141957))

(declare-fun d!141959 () Bool)

(declare-fun e!743850 () Bool)

(assert (=> d!141959 e!743850))

(declare-fun res!865742 () Bool)

(assert (=> d!141959 (=> res!865742 e!743850)))

(declare-fun lt!583224 () Bool)

(assert (=> d!141959 (= res!865742 (not lt!583224))))

(declare-fun lt!583226 () Bool)

(assert (=> d!141959 (= lt!583224 lt!583226)))

(declare-fun lt!583225 () Unit!43085)

(declare-fun e!743851 () Unit!43085)

(assert (=> d!141959 (= lt!583225 e!743851)))

(declare-fun c!125411 () Bool)

(assert (=> d!141959 (= c!125411 lt!583226)))

(assert (=> d!141959 (= lt!583226 (containsKey!724 (toList!10155 lt!583131) (select (arr!41888 _keys!1741) from!2144)))))

(assert (=> d!141959 (= (contains!8297 lt!583131 (select (arr!41888 _keys!1741) from!2144)) lt!583224)))

(declare-fun b!1303929 () Bool)

(declare-fun lt!583223 () Unit!43085)

(assert (=> b!1303929 (= e!743851 lt!583223)))

(assert (=> b!1303929 (= lt!583223 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10155 lt!583131) (select (arr!41888 _keys!1741) from!2144)))))

(assert (=> b!1303929 (isDefined!507 (getValueByKey!698 (toList!10155 lt!583131) (select (arr!41888 _keys!1741) from!2144)))))

(declare-fun b!1303930 () Bool)

(declare-fun Unit!43094 () Unit!43085)

(assert (=> b!1303930 (= e!743851 Unit!43094)))

(declare-fun b!1303931 () Bool)

(assert (=> b!1303931 (= e!743850 (isDefined!507 (getValueByKey!698 (toList!10155 lt!583131) (select (arr!41888 _keys!1741) from!2144))))))

(assert (= (and d!141959 c!125411) b!1303929))

(assert (= (and d!141959 (not c!125411)) b!1303930))

(assert (= (and d!141959 (not res!865742)) b!1303931))

(assert (=> d!141959 m!1194685))

(declare-fun m!1195021 () Bool)

(assert (=> d!141959 m!1195021))

(assert (=> b!1303929 m!1194685))

(declare-fun m!1195023 () Bool)

(assert (=> b!1303929 m!1195023))

(assert (=> b!1303929 m!1194685))

(assert (=> b!1303929 m!1194965))

(assert (=> b!1303929 m!1194965))

(declare-fun m!1195025 () Bool)

(assert (=> b!1303929 m!1195025))

(assert (=> b!1303931 m!1194685))

(assert (=> b!1303931 m!1194965))

(assert (=> b!1303931 m!1194965))

(assert (=> b!1303931 m!1195025))

(assert (=> b!1303737 d!141959))

(assert (=> b!1303797 d!141885))

(assert (=> bm!64192 d!141895))

(declare-fun d!141961 () Bool)

(assert (=> d!141961 (= (apply!1028 lt!583160 (select (arr!41888 _keys!1741) from!2144)) (get!21200 (getValueByKey!698 (toList!10155 lt!583160) (select (arr!41888 _keys!1741) from!2144))))))

(declare-fun bs!37111 () Bool)

(assert (= bs!37111 d!141961))

(assert (=> bs!37111 m!1194685))

(declare-fun m!1195027 () Bool)

(assert (=> bs!37111 m!1195027))

(assert (=> bs!37111 m!1195027))

(declare-fun m!1195029 () Bool)

(assert (=> bs!37111 m!1195029))

(assert (=> b!1303798 d!141961))

(assert (=> b!1303798 d!141935))

(declare-fun d!141963 () Bool)

(assert (=> d!141963 (isDefined!507 (getValueByKey!698 (toList!10155 (ListLongMap!20280 Nil!29762)) k0!1205))))

(declare-fun lt!583227 () Unit!43085)

(assert (=> d!141963 (= lt!583227 (choose!1916 (toList!10155 (ListLongMap!20280 Nil!29762)) k0!1205))))

(declare-fun e!743852 () Bool)

(assert (=> d!141963 e!743852))

(declare-fun res!865743 () Bool)

(assert (=> d!141963 (=> (not res!865743) (not e!743852))))

(assert (=> d!141963 (= res!865743 (isStrictlySorted!860 (toList!10155 (ListLongMap!20280 Nil!29762))))))

(assert (=> d!141963 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10155 (ListLongMap!20280 Nil!29762)) k0!1205) lt!583227)))

(declare-fun b!1303932 () Bool)

(assert (=> b!1303932 (= e!743852 (containsKey!724 (toList!10155 (ListLongMap!20280 Nil!29762)) k0!1205))))

(assert (= (and d!141963 res!865743) b!1303932))

(assert (=> d!141963 m!1194767))

(assert (=> d!141963 m!1194767))

(assert (=> d!141963 m!1194769))

(declare-fun m!1195031 () Bool)

(assert (=> d!141963 m!1195031))

(declare-fun m!1195033 () Bool)

(assert (=> d!141963 m!1195033))

(assert (=> b!1303932 m!1194763))

(assert (=> b!1303682 d!141963))

(declare-fun d!141965 () Bool)

(assert (=> d!141965 (= (isDefined!507 (getValueByKey!698 (toList!10155 (ListLongMap!20280 Nil!29762)) k0!1205)) (not (isEmpty!1062 (getValueByKey!698 (toList!10155 (ListLongMap!20280 Nil!29762)) k0!1205))))))

(declare-fun bs!37112 () Bool)

(assert (= bs!37112 d!141965))

(assert (=> bs!37112 m!1194767))

(declare-fun m!1195035 () Bool)

(assert (=> bs!37112 m!1195035))

(assert (=> b!1303682 d!141965))

(declare-fun b!1303934 () Bool)

(declare-fun e!743853 () Option!749)

(declare-fun e!743854 () Option!749)

(assert (=> b!1303934 (= e!743853 e!743854)))

(declare-fun c!125413 () Bool)

(assert (=> b!1303934 (= c!125413 (and ((_ is Cons!29761) (toList!10155 (ListLongMap!20280 Nil!29762))) (not (= (_1!11318 (h!30979 (toList!10155 (ListLongMap!20280 Nil!29762)))) k0!1205))))))

(declare-fun b!1303936 () Bool)

(assert (=> b!1303936 (= e!743854 None!747)))

(declare-fun b!1303933 () Bool)

(assert (=> b!1303933 (= e!743853 (Some!748 (_2!11318 (h!30979 (toList!10155 (ListLongMap!20280 Nil!29762))))))))

(declare-fun d!141967 () Bool)

(declare-fun c!125412 () Bool)

(assert (=> d!141967 (= c!125412 (and ((_ is Cons!29761) (toList!10155 (ListLongMap!20280 Nil!29762))) (= (_1!11318 (h!30979 (toList!10155 (ListLongMap!20280 Nil!29762)))) k0!1205)))))

(assert (=> d!141967 (= (getValueByKey!698 (toList!10155 (ListLongMap!20280 Nil!29762)) k0!1205) e!743853)))

(declare-fun b!1303935 () Bool)

(assert (=> b!1303935 (= e!743854 (getValueByKey!698 (t!43345 (toList!10155 (ListLongMap!20280 Nil!29762))) k0!1205))))

(assert (= (and d!141967 c!125412) b!1303933))

(assert (= (and d!141967 (not c!125412)) b!1303934))

(assert (= (and b!1303934 c!125413) b!1303935))

(assert (= (and b!1303934 (not c!125413)) b!1303936))

(declare-fun m!1195037 () Bool)

(assert (=> b!1303935 m!1195037))

(assert (=> b!1303682 d!141967))

(declare-fun d!141969 () Bool)

(declare-fun e!743855 () Bool)

(assert (=> d!141969 e!743855))

(declare-fun res!865745 () Bool)

(assert (=> d!141969 (=> (not res!865745) (not e!743855))))

(declare-fun lt!583228 () ListLongMap!20279)

(assert (=> d!141969 (= res!865745 (contains!8297 lt!583228 (_1!11318 (tuple2!22615 lt!583122 minValue!1387))))))

(declare-fun lt!583231 () List!29765)

(assert (=> d!141969 (= lt!583228 (ListLongMap!20280 lt!583231))))

(declare-fun lt!583230 () Unit!43085)

(declare-fun lt!583229 () Unit!43085)

(assert (=> d!141969 (= lt!583230 lt!583229)))

(assert (=> d!141969 (= (getValueByKey!698 lt!583231 (_1!11318 (tuple2!22615 lt!583122 minValue!1387))) (Some!748 (_2!11318 (tuple2!22615 lt!583122 minValue!1387))))))

(assert (=> d!141969 (= lt!583229 (lemmaContainsTupThenGetReturnValue!349 lt!583231 (_1!11318 (tuple2!22615 lt!583122 minValue!1387)) (_2!11318 (tuple2!22615 lt!583122 minValue!1387))))))

(assert (=> d!141969 (= lt!583231 (insertStrictlySorted!478 (toList!10155 lt!583128) (_1!11318 (tuple2!22615 lt!583122 minValue!1387)) (_2!11318 (tuple2!22615 lt!583122 minValue!1387))))))

(assert (=> d!141969 (= (+!4520 lt!583128 (tuple2!22615 lt!583122 minValue!1387)) lt!583228)))

(declare-fun b!1303937 () Bool)

(declare-fun res!865744 () Bool)

(assert (=> b!1303937 (=> (not res!865744) (not e!743855))))

(assert (=> b!1303937 (= res!865744 (= (getValueByKey!698 (toList!10155 lt!583228) (_1!11318 (tuple2!22615 lt!583122 minValue!1387))) (Some!748 (_2!11318 (tuple2!22615 lt!583122 minValue!1387)))))))

(declare-fun b!1303938 () Bool)

(assert (=> b!1303938 (= e!743855 (contains!8300 (toList!10155 lt!583228) (tuple2!22615 lt!583122 minValue!1387)))))

(assert (= (and d!141969 res!865745) b!1303937))

(assert (= (and b!1303937 res!865744) b!1303938))

(declare-fun m!1195039 () Bool)

(assert (=> d!141969 m!1195039))

(declare-fun m!1195041 () Bool)

(assert (=> d!141969 m!1195041))

(declare-fun m!1195043 () Bool)

(assert (=> d!141969 m!1195043))

(declare-fun m!1195045 () Bool)

(assert (=> d!141969 m!1195045))

(declare-fun m!1195047 () Bool)

(assert (=> b!1303937 m!1195047))

(declare-fun m!1195049 () Bool)

(assert (=> b!1303938 m!1195049))

(assert (=> b!1303738 d!141969))

(declare-fun d!141971 () Bool)

(assert (=> d!141971 (= (apply!1028 (+!4520 lt!583116 (tuple2!22615 lt!583132 zeroValue!1387)) lt!583114) (apply!1028 lt!583116 lt!583114))))

(declare-fun lt!583234 () Unit!43085)

(declare-fun choose!1917 (ListLongMap!20279 (_ BitVec 64) V!51601 (_ BitVec 64)) Unit!43085)

(assert (=> d!141971 (= lt!583234 (choose!1917 lt!583116 lt!583132 zeroValue!1387 lt!583114))))

(declare-fun e!743858 () Bool)

(assert (=> d!141971 e!743858))

(declare-fun res!865748 () Bool)

(assert (=> d!141971 (=> (not res!865748) (not e!743858))))

(assert (=> d!141971 (= res!865748 (contains!8297 lt!583116 lt!583114))))

(assert (=> d!141971 (= (addApplyDifferent!557 lt!583116 lt!583132 zeroValue!1387 lt!583114) lt!583234)))

(declare-fun b!1303942 () Bool)

(assert (=> b!1303942 (= e!743858 (not (= lt!583114 lt!583132)))))

(assert (= (and d!141971 res!865748) b!1303942))

(assert (=> d!141971 m!1194801))

(assert (=> d!141971 m!1194807))

(declare-fun m!1195051 () Bool)

(assert (=> d!141971 m!1195051))

(assert (=> d!141971 m!1194803))

(assert (=> d!141971 m!1194801))

(declare-fun m!1195053 () Bool)

(assert (=> d!141971 m!1195053))

(assert (=> b!1303738 d!141971))

(declare-fun d!141973 () Bool)

(declare-fun e!743859 () Bool)

(assert (=> d!141973 e!743859))

(declare-fun res!865750 () Bool)

(assert (=> d!141973 (=> (not res!865750) (not e!743859))))

(declare-fun lt!583235 () ListLongMap!20279)

(assert (=> d!141973 (= res!865750 (contains!8297 lt!583235 (_1!11318 (tuple2!22615 lt!583117 zeroValue!1387))))))

(declare-fun lt!583238 () List!29765)

(assert (=> d!141973 (= lt!583235 (ListLongMap!20280 lt!583238))))

(declare-fun lt!583237 () Unit!43085)

(declare-fun lt!583236 () Unit!43085)

(assert (=> d!141973 (= lt!583237 lt!583236)))

(assert (=> d!141973 (= (getValueByKey!698 lt!583238 (_1!11318 (tuple2!22615 lt!583117 zeroValue!1387))) (Some!748 (_2!11318 (tuple2!22615 lt!583117 zeroValue!1387))))))

(assert (=> d!141973 (= lt!583236 (lemmaContainsTupThenGetReturnValue!349 lt!583238 (_1!11318 (tuple2!22615 lt!583117 zeroValue!1387)) (_2!11318 (tuple2!22615 lt!583117 zeroValue!1387))))))

(assert (=> d!141973 (= lt!583238 (insertStrictlySorted!478 (toList!10155 lt!583126) (_1!11318 (tuple2!22615 lt!583117 zeroValue!1387)) (_2!11318 (tuple2!22615 lt!583117 zeroValue!1387))))))

(assert (=> d!141973 (= (+!4520 lt!583126 (tuple2!22615 lt!583117 zeroValue!1387)) lt!583235)))

(declare-fun b!1303943 () Bool)

(declare-fun res!865749 () Bool)

(assert (=> b!1303943 (=> (not res!865749) (not e!743859))))

(assert (=> b!1303943 (= res!865749 (= (getValueByKey!698 (toList!10155 lt!583235) (_1!11318 (tuple2!22615 lt!583117 zeroValue!1387))) (Some!748 (_2!11318 (tuple2!22615 lt!583117 zeroValue!1387)))))))

(declare-fun b!1303944 () Bool)

(assert (=> b!1303944 (= e!743859 (contains!8300 (toList!10155 lt!583235) (tuple2!22615 lt!583117 zeroValue!1387)))))

(assert (= (and d!141973 res!865750) b!1303943))

(assert (= (and b!1303943 res!865749) b!1303944))

(declare-fun m!1195055 () Bool)

(assert (=> d!141973 m!1195055))

(declare-fun m!1195057 () Bool)

(assert (=> d!141973 m!1195057))

(declare-fun m!1195059 () Bool)

(assert (=> d!141973 m!1195059))

(declare-fun m!1195061 () Bool)

(assert (=> d!141973 m!1195061))

(declare-fun m!1195063 () Bool)

(assert (=> b!1303943 m!1195063))

(declare-fun m!1195065 () Bool)

(assert (=> b!1303944 m!1195065))

(assert (=> b!1303738 d!141973))

(declare-fun d!141975 () Bool)

(assert (=> d!141975 (= (apply!1028 lt!583130 lt!583118) (get!21200 (getValueByKey!698 (toList!10155 lt!583130) lt!583118)))))

(declare-fun bs!37113 () Bool)

(assert (= bs!37113 d!141975))

(declare-fun m!1195067 () Bool)

(assert (=> bs!37113 m!1195067))

(assert (=> bs!37113 m!1195067))

(declare-fun m!1195069 () Bool)

(assert (=> bs!37113 m!1195069))

(assert (=> b!1303738 d!141975))

(declare-fun d!141977 () Bool)

(assert (=> d!141977 (= (apply!1028 lt!583128 lt!583115) (get!21200 (getValueByKey!698 (toList!10155 lt!583128) lt!583115)))))

(declare-fun bs!37114 () Bool)

(assert (= bs!37114 d!141977))

(declare-fun m!1195071 () Bool)

(assert (=> bs!37114 m!1195071))

(assert (=> bs!37114 m!1195071))

(declare-fun m!1195073 () Bool)

(assert (=> bs!37114 m!1195073))

(assert (=> b!1303738 d!141977))

(declare-fun d!141979 () Bool)

(assert (=> d!141979 (= (apply!1028 lt!583116 lt!583114) (get!21200 (getValueByKey!698 (toList!10155 lt!583116) lt!583114)))))

(declare-fun bs!37115 () Bool)

(assert (= bs!37115 d!141979))

(declare-fun m!1195075 () Bool)

(assert (=> bs!37115 m!1195075))

(assert (=> bs!37115 m!1195075))

(declare-fun m!1195077 () Bool)

(assert (=> bs!37115 m!1195077))

(assert (=> b!1303738 d!141979))

(declare-fun d!141981 () Bool)

(declare-fun e!743860 () Bool)

(assert (=> d!141981 e!743860))

(declare-fun res!865752 () Bool)

(assert (=> d!141981 (=> (not res!865752) (not e!743860))))

(declare-fun lt!583239 () ListLongMap!20279)

(assert (=> d!141981 (= res!865752 (contains!8297 lt!583239 (_1!11318 (tuple2!22615 lt!583132 zeroValue!1387))))))

(declare-fun lt!583242 () List!29765)

(assert (=> d!141981 (= lt!583239 (ListLongMap!20280 lt!583242))))

(declare-fun lt!583241 () Unit!43085)

(declare-fun lt!583240 () Unit!43085)

(assert (=> d!141981 (= lt!583241 lt!583240)))

(assert (=> d!141981 (= (getValueByKey!698 lt!583242 (_1!11318 (tuple2!22615 lt!583132 zeroValue!1387))) (Some!748 (_2!11318 (tuple2!22615 lt!583132 zeroValue!1387))))))

(assert (=> d!141981 (= lt!583240 (lemmaContainsTupThenGetReturnValue!349 lt!583242 (_1!11318 (tuple2!22615 lt!583132 zeroValue!1387)) (_2!11318 (tuple2!22615 lt!583132 zeroValue!1387))))))

(assert (=> d!141981 (= lt!583242 (insertStrictlySorted!478 (toList!10155 lt!583116) (_1!11318 (tuple2!22615 lt!583132 zeroValue!1387)) (_2!11318 (tuple2!22615 lt!583132 zeroValue!1387))))))

(assert (=> d!141981 (= (+!4520 lt!583116 (tuple2!22615 lt!583132 zeroValue!1387)) lt!583239)))

(declare-fun b!1303945 () Bool)

(declare-fun res!865751 () Bool)

(assert (=> b!1303945 (=> (not res!865751) (not e!743860))))

(assert (=> b!1303945 (= res!865751 (= (getValueByKey!698 (toList!10155 lt!583239) (_1!11318 (tuple2!22615 lt!583132 zeroValue!1387))) (Some!748 (_2!11318 (tuple2!22615 lt!583132 zeroValue!1387)))))))

(declare-fun b!1303946 () Bool)

(assert (=> b!1303946 (= e!743860 (contains!8300 (toList!10155 lt!583239) (tuple2!22615 lt!583132 zeroValue!1387)))))

(assert (= (and d!141981 res!865752) b!1303945))

(assert (= (and b!1303945 res!865751) b!1303946))

(declare-fun m!1195079 () Bool)

(assert (=> d!141981 m!1195079))

(declare-fun m!1195081 () Bool)

(assert (=> d!141981 m!1195081))

(declare-fun m!1195083 () Bool)

(assert (=> d!141981 m!1195083))

(declare-fun m!1195085 () Bool)

(assert (=> d!141981 m!1195085))

(declare-fun m!1195087 () Bool)

(assert (=> b!1303945 m!1195087))

(declare-fun m!1195089 () Bool)

(assert (=> b!1303946 m!1195089))

(assert (=> b!1303738 d!141981))

(declare-fun d!141983 () Bool)

(assert (=> d!141983 (= (apply!1028 (+!4520 lt!583116 (tuple2!22615 lt!583132 zeroValue!1387)) lt!583114) (get!21200 (getValueByKey!698 (toList!10155 (+!4520 lt!583116 (tuple2!22615 lt!583132 zeroValue!1387))) lt!583114)))))

(declare-fun bs!37116 () Bool)

(assert (= bs!37116 d!141983))

(declare-fun m!1195091 () Bool)

(assert (=> bs!37116 m!1195091))

(assert (=> bs!37116 m!1195091))

(declare-fun m!1195093 () Bool)

(assert (=> bs!37116 m!1195093))

(assert (=> b!1303738 d!141983))

(assert (=> b!1303738 d!141895))

(declare-fun d!141985 () Bool)

(assert (=> d!141985 (= (apply!1028 (+!4520 lt!583128 (tuple2!22615 lt!583122 minValue!1387)) lt!583115) (apply!1028 lt!583128 lt!583115))))

(declare-fun lt!583243 () Unit!43085)

(assert (=> d!141985 (= lt!583243 (choose!1917 lt!583128 lt!583122 minValue!1387 lt!583115))))

(declare-fun e!743861 () Bool)

(assert (=> d!141985 e!743861))

(declare-fun res!865753 () Bool)

(assert (=> d!141985 (=> (not res!865753) (not e!743861))))

(assert (=> d!141985 (= res!865753 (contains!8297 lt!583128 lt!583115))))

(assert (=> d!141985 (= (addApplyDifferent!557 lt!583128 lt!583122 minValue!1387 lt!583115) lt!583243)))

(declare-fun b!1303947 () Bool)

(assert (=> b!1303947 (= e!743861 (not (= lt!583115 lt!583122)))))

(assert (= (and d!141985 res!865753) b!1303947))

(assert (=> d!141985 m!1194811))

(assert (=> d!141985 m!1194813))

(declare-fun m!1195095 () Bool)

(assert (=> d!141985 m!1195095))

(assert (=> d!141985 m!1194799))

(assert (=> d!141985 m!1194811))

(declare-fun m!1195097 () Bool)

(assert (=> d!141985 m!1195097))

(assert (=> b!1303738 d!141985))

(declare-fun d!141987 () Bool)

(declare-fun e!743862 () Bool)

(assert (=> d!141987 e!743862))

(declare-fun res!865755 () Bool)

(assert (=> d!141987 (=> (not res!865755) (not e!743862))))

(declare-fun lt!583244 () ListLongMap!20279)

(assert (=> d!141987 (= res!865755 (contains!8297 lt!583244 (_1!11318 (tuple2!22615 lt!583119 minValue!1387))))))

(declare-fun lt!583247 () List!29765)

(assert (=> d!141987 (= lt!583244 (ListLongMap!20280 lt!583247))))

(declare-fun lt!583246 () Unit!43085)

(declare-fun lt!583245 () Unit!43085)

(assert (=> d!141987 (= lt!583246 lt!583245)))

(assert (=> d!141987 (= (getValueByKey!698 lt!583247 (_1!11318 (tuple2!22615 lt!583119 minValue!1387))) (Some!748 (_2!11318 (tuple2!22615 lt!583119 minValue!1387))))))

(assert (=> d!141987 (= lt!583245 (lemmaContainsTupThenGetReturnValue!349 lt!583247 (_1!11318 (tuple2!22615 lt!583119 minValue!1387)) (_2!11318 (tuple2!22615 lt!583119 minValue!1387))))))

(assert (=> d!141987 (= lt!583247 (insertStrictlySorted!478 (toList!10155 lt!583130) (_1!11318 (tuple2!22615 lt!583119 minValue!1387)) (_2!11318 (tuple2!22615 lt!583119 minValue!1387))))))

(assert (=> d!141987 (= (+!4520 lt!583130 (tuple2!22615 lt!583119 minValue!1387)) lt!583244)))

(declare-fun b!1303948 () Bool)

(declare-fun res!865754 () Bool)

(assert (=> b!1303948 (=> (not res!865754) (not e!743862))))

(assert (=> b!1303948 (= res!865754 (= (getValueByKey!698 (toList!10155 lt!583244) (_1!11318 (tuple2!22615 lt!583119 minValue!1387))) (Some!748 (_2!11318 (tuple2!22615 lt!583119 minValue!1387)))))))

(declare-fun b!1303949 () Bool)

(assert (=> b!1303949 (= e!743862 (contains!8300 (toList!10155 lt!583244) (tuple2!22615 lt!583119 minValue!1387)))))

(assert (= (and d!141987 res!865755) b!1303948))

(assert (= (and b!1303948 res!865754) b!1303949))

(declare-fun m!1195099 () Bool)

(assert (=> d!141987 m!1195099))

(declare-fun m!1195101 () Bool)

(assert (=> d!141987 m!1195101))

(declare-fun m!1195103 () Bool)

(assert (=> d!141987 m!1195103))

(declare-fun m!1195105 () Bool)

(assert (=> d!141987 m!1195105))

(declare-fun m!1195107 () Bool)

(assert (=> b!1303948 m!1195107))

(declare-fun m!1195109 () Bool)

(assert (=> b!1303949 m!1195109))

(assert (=> b!1303738 d!141987))

(declare-fun d!141989 () Bool)

(assert (=> d!141989 (= (apply!1028 (+!4520 lt!583130 (tuple2!22615 lt!583119 minValue!1387)) lt!583118) (get!21200 (getValueByKey!698 (toList!10155 (+!4520 lt!583130 (tuple2!22615 lt!583119 minValue!1387))) lt!583118)))))

(declare-fun bs!37117 () Bool)

(assert (= bs!37117 d!141989))

(declare-fun m!1195111 () Bool)

(assert (=> bs!37117 m!1195111))

(assert (=> bs!37117 m!1195111))

(declare-fun m!1195113 () Bool)

(assert (=> bs!37117 m!1195113))

(assert (=> b!1303738 d!141989))

(declare-fun d!141991 () Bool)

(assert (=> d!141991 (= (apply!1028 (+!4520 lt!583128 (tuple2!22615 lt!583122 minValue!1387)) lt!583115) (get!21200 (getValueByKey!698 (toList!10155 (+!4520 lt!583128 (tuple2!22615 lt!583122 minValue!1387))) lt!583115)))))

(declare-fun bs!37118 () Bool)

(assert (= bs!37118 d!141991))

(declare-fun m!1195115 () Bool)

(assert (=> bs!37118 m!1195115))

(assert (=> bs!37118 m!1195115))

(declare-fun m!1195117 () Bool)

(assert (=> bs!37118 m!1195117))

(assert (=> b!1303738 d!141991))

(declare-fun d!141993 () Bool)

(assert (=> d!141993 (contains!8297 (+!4520 lt!583126 (tuple2!22615 lt!583117 zeroValue!1387)) lt!583134)))

(declare-fun lt!583250 () Unit!43085)

(declare-fun choose!1918 (ListLongMap!20279 (_ BitVec 64) V!51601 (_ BitVec 64)) Unit!43085)

(assert (=> d!141993 (= lt!583250 (choose!1918 lt!583126 lt!583117 zeroValue!1387 lt!583134))))

(assert (=> d!141993 (contains!8297 lt!583126 lt!583134)))

(assert (=> d!141993 (= (addStillContains!1115 lt!583126 lt!583117 zeroValue!1387 lt!583134) lt!583250)))

(declare-fun bs!37119 () Bool)

(assert (= bs!37119 d!141993))

(assert (=> bs!37119 m!1194793))

(assert (=> bs!37119 m!1194793))

(assert (=> bs!37119 m!1194815))

(declare-fun m!1195119 () Bool)

(assert (=> bs!37119 m!1195119))

(declare-fun m!1195121 () Bool)

(assert (=> bs!37119 m!1195121))

(assert (=> b!1303738 d!141993))

(declare-fun d!141995 () Bool)

(assert (=> d!141995 (= (apply!1028 (+!4520 lt!583130 (tuple2!22615 lt!583119 minValue!1387)) lt!583118) (apply!1028 lt!583130 lt!583118))))

(declare-fun lt!583251 () Unit!43085)

(assert (=> d!141995 (= lt!583251 (choose!1917 lt!583130 lt!583119 minValue!1387 lt!583118))))

(declare-fun e!743863 () Bool)

(assert (=> d!141995 e!743863))

(declare-fun res!865756 () Bool)

(assert (=> d!141995 (=> (not res!865756) (not e!743863))))

(assert (=> d!141995 (= res!865756 (contains!8297 lt!583130 lt!583118))))

(assert (=> d!141995 (= (addApplyDifferent!557 lt!583130 lt!583119 minValue!1387 lt!583118) lt!583251)))

(declare-fun b!1303951 () Bool)

(assert (=> b!1303951 (= e!743863 (not (= lt!583118 lt!583119)))))

(assert (= (and d!141995 res!865756) b!1303951))

(assert (=> d!141995 m!1194789))

(assert (=> d!141995 m!1194791))

(declare-fun m!1195123 () Bool)

(assert (=> d!141995 m!1195123))

(assert (=> d!141995 m!1194797))

(assert (=> d!141995 m!1194789))

(declare-fun m!1195125 () Bool)

(assert (=> d!141995 m!1195125))

(assert (=> b!1303738 d!141995))

(declare-fun d!141997 () Bool)

(declare-fun e!743864 () Bool)

(assert (=> d!141997 e!743864))

(declare-fun res!865757 () Bool)

(assert (=> d!141997 (=> res!865757 e!743864)))

(declare-fun lt!583253 () Bool)

(assert (=> d!141997 (= res!865757 (not lt!583253))))

(declare-fun lt!583255 () Bool)

(assert (=> d!141997 (= lt!583253 lt!583255)))

(declare-fun lt!583254 () Unit!43085)

(declare-fun e!743865 () Unit!43085)

(assert (=> d!141997 (= lt!583254 e!743865)))

(declare-fun c!125414 () Bool)

(assert (=> d!141997 (= c!125414 lt!583255)))

(assert (=> d!141997 (= lt!583255 (containsKey!724 (toList!10155 (+!4520 lt!583126 (tuple2!22615 lt!583117 zeroValue!1387))) lt!583134))))

(assert (=> d!141997 (= (contains!8297 (+!4520 lt!583126 (tuple2!22615 lt!583117 zeroValue!1387)) lt!583134) lt!583253)))

(declare-fun b!1303952 () Bool)

(declare-fun lt!583252 () Unit!43085)

(assert (=> b!1303952 (= e!743865 lt!583252)))

(assert (=> b!1303952 (= lt!583252 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10155 (+!4520 lt!583126 (tuple2!22615 lt!583117 zeroValue!1387))) lt!583134))))

(assert (=> b!1303952 (isDefined!507 (getValueByKey!698 (toList!10155 (+!4520 lt!583126 (tuple2!22615 lt!583117 zeroValue!1387))) lt!583134))))

(declare-fun b!1303953 () Bool)

(declare-fun Unit!43095 () Unit!43085)

(assert (=> b!1303953 (= e!743865 Unit!43095)))

(declare-fun b!1303954 () Bool)

(assert (=> b!1303954 (= e!743864 (isDefined!507 (getValueByKey!698 (toList!10155 (+!4520 lt!583126 (tuple2!22615 lt!583117 zeroValue!1387))) lt!583134)))))

(assert (= (and d!141997 c!125414) b!1303952))

(assert (= (and d!141997 (not c!125414)) b!1303953))

(assert (= (and d!141997 (not res!865757)) b!1303954))

(declare-fun m!1195127 () Bool)

(assert (=> d!141997 m!1195127))

(declare-fun m!1195129 () Bool)

(assert (=> b!1303952 m!1195129))

(declare-fun m!1195131 () Bool)

(assert (=> b!1303952 m!1195131))

(assert (=> b!1303952 m!1195131))

(declare-fun m!1195133 () Bool)

(assert (=> b!1303952 m!1195133))

(assert (=> b!1303954 m!1195131))

(assert (=> b!1303954 m!1195131))

(assert (=> b!1303954 m!1195133))

(assert (=> b!1303738 d!141997))

(declare-fun d!141999 () Bool)

(declare-fun e!743866 () Bool)

(assert (=> d!141999 e!743866))

(declare-fun res!865758 () Bool)

(assert (=> d!141999 (=> res!865758 e!743866)))

(declare-fun lt!583257 () Bool)

(assert (=> d!141999 (= res!865758 (not lt!583257))))

(declare-fun lt!583259 () Bool)

(assert (=> d!141999 (= lt!583257 lt!583259)))

(declare-fun lt!583258 () Unit!43085)

(declare-fun e!743867 () Unit!43085)

(assert (=> d!141999 (= lt!583258 e!743867)))

(declare-fun c!125415 () Bool)

(assert (=> d!141999 (= c!125415 lt!583259)))

(assert (=> d!141999 (= lt!583259 (containsKey!724 (toList!10155 lt!583160) (select (arr!41888 _keys!1741) from!2144)))))

(assert (=> d!141999 (= (contains!8297 lt!583160 (select (arr!41888 _keys!1741) from!2144)) lt!583257)))

(declare-fun b!1303955 () Bool)

(declare-fun lt!583256 () Unit!43085)

(assert (=> b!1303955 (= e!743867 lt!583256)))

(assert (=> b!1303955 (= lt!583256 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10155 lt!583160) (select (arr!41888 _keys!1741) from!2144)))))

(assert (=> b!1303955 (isDefined!507 (getValueByKey!698 (toList!10155 lt!583160) (select (arr!41888 _keys!1741) from!2144)))))

(declare-fun b!1303956 () Bool)

(declare-fun Unit!43096 () Unit!43085)

(assert (=> b!1303956 (= e!743867 Unit!43096)))

(declare-fun b!1303957 () Bool)

(assert (=> b!1303957 (= e!743866 (isDefined!507 (getValueByKey!698 (toList!10155 lt!583160) (select (arr!41888 _keys!1741) from!2144))))))

(assert (= (and d!141999 c!125415) b!1303955))

(assert (= (and d!141999 (not c!125415)) b!1303956))

(assert (= (and d!141999 (not res!865758)) b!1303957))

(assert (=> d!141999 m!1194685))

(declare-fun m!1195135 () Bool)

(assert (=> d!141999 m!1195135))

(assert (=> b!1303955 m!1194685))

(declare-fun m!1195137 () Bool)

(assert (=> b!1303955 m!1195137))

(assert (=> b!1303955 m!1194685))

(assert (=> b!1303955 m!1195027))

(assert (=> b!1303955 m!1195027))

(declare-fun m!1195139 () Bool)

(assert (=> b!1303955 m!1195139))

(assert (=> b!1303957 m!1194685))

(assert (=> b!1303957 m!1195027))

(assert (=> b!1303957 m!1195027))

(assert (=> b!1303957 m!1195139))

(assert (=> b!1303799 d!141999))

(assert (=> b!1303684 d!141965))

(assert (=> b!1303684 d!141967))

(declare-fun d!142001 () Bool)

(declare-fun e!743868 () Bool)

(assert (=> d!142001 e!743868))

(declare-fun res!865760 () Bool)

(assert (=> d!142001 (=> (not res!865760) (not e!743868))))

(declare-fun lt!583260 () ListLongMap!20279)

(assert (=> d!142001 (= res!865760 (contains!8297 lt!583260 (_1!11318 (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!583263 () List!29765)

(assert (=> d!142001 (= lt!583260 (ListLongMap!20280 lt!583263))))

(declare-fun lt!583262 () Unit!43085)

(declare-fun lt!583261 () Unit!43085)

(assert (=> d!142001 (= lt!583262 lt!583261)))

(assert (=> d!142001 (= (getValueByKey!698 lt!583263 (_1!11318 (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!748 (_2!11318 (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142001 (= lt!583261 (lemmaContainsTupThenGetReturnValue!349 lt!583263 (_1!11318 (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11318 (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142001 (= lt!583263 (insertStrictlySorted!478 (toList!10155 call!64193) (_1!11318 (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11318 (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142001 (= (+!4520 call!64193 (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!583260)))

(declare-fun b!1303958 () Bool)

(declare-fun res!865759 () Bool)

(assert (=> b!1303958 (=> (not res!865759) (not e!743868))))

(assert (=> b!1303958 (= res!865759 (= (getValueByKey!698 (toList!10155 lt!583260) (_1!11318 (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!748 (_2!11318 (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1303959 () Bool)

(assert (=> b!1303959 (= e!743868 (contains!8300 (toList!10155 lt!583260) (tuple2!22615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!142001 res!865760) b!1303958))

(assert (= (and b!1303958 res!865759) b!1303959))

(declare-fun m!1195141 () Bool)

(assert (=> d!142001 m!1195141))

(declare-fun m!1195143 () Bool)

(assert (=> d!142001 m!1195143))

(declare-fun m!1195145 () Bool)

(assert (=> d!142001 m!1195145))

(declare-fun m!1195147 () Bool)

(assert (=> d!142001 m!1195147))

(declare-fun m!1195149 () Bool)

(assert (=> b!1303958 m!1195149))

(declare-fun m!1195151 () Bool)

(assert (=> b!1303959 m!1195151))

(assert (=> b!1303740 d!142001))

(declare-fun d!142003 () Bool)

(declare-fun e!743869 () Bool)

(assert (=> d!142003 e!743869))

(declare-fun res!865761 () Bool)

(assert (=> d!142003 (=> res!865761 e!743869)))

(declare-fun lt!583265 () Bool)

(assert (=> d!142003 (= res!865761 (not lt!583265))))

(declare-fun lt!583267 () Bool)

(assert (=> d!142003 (= lt!583265 lt!583267)))

(declare-fun lt!583266 () Unit!43085)

(declare-fun e!743870 () Unit!43085)

(assert (=> d!142003 (= lt!583266 e!743870)))

(declare-fun c!125416 () Bool)

(assert (=> d!142003 (= c!125416 lt!583267)))

(assert (=> d!142003 (= lt!583267 (containsKey!724 (toList!10155 lt!583131) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142003 (= (contains!8297 lt!583131 #b1000000000000000000000000000000000000000000000000000000000000000) lt!583265)))

(declare-fun b!1303960 () Bool)

(declare-fun lt!583264 () Unit!43085)

(assert (=> b!1303960 (= e!743870 lt!583264)))

(assert (=> b!1303960 (= lt!583264 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10155 lt!583131) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303960 (isDefined!507 (getValueByKey!698 (toList!10155 lt!583131) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303961 () Bool)

(declare-fun Unit!43097 () Unit!43085)

(assert (=> b!1303961 (= e!743870 Unit!43097)))

(declare-fun b!1303962 () Bool)

(assert (=> b!1303962 (= e!743869 (isDefined!507 (getValueByKey!698 (toList!10155 lt!583131) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142003 c!125416) b!1303960))

(assert (= (and d!142003 (not c!125416)) b!1303961))

(assert (= (and d!142003 (not res!865761)) b!1303962))

(declare-fun m!1195153 () Bool)

(assert (=> d!142003 m!1195153))

(declare-fun m!1195155 () Bool)

(assert (=> b!1303960 m!1195155))

(assert (=> b!1303960 m!1194953))

(assert (=> b!1303960 m!1194953))

(declare-fun m!1195157 () Bool)

(assert (=> b!1303960 m!1195157))

(assert (=> b!1303962 m!1194953))

(assert (=> b!1303962 m!1194953))

(assert (=> b!1303962 m!1195157))

(assert (=> bm!64193 d!142003))

(declare-fun d!142005 () Bool)

(declare-fun e!743871 () Bool)

(assert (=> d!142005 e!743871))

(declare-fun res!865763 () Bool)

(assert (=> d!142005 (=> (not res!865763) (not e!743871))))

(declare-fun lt!583268 () ListLongMap!20279)

(assert (=> d!142005 (= res!865763 (contains!8297 lt!583268 (_1!11318 (tuple2!22615 (select (arr!41888 _keys!1741) from!2144) (get!21199 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!583271 () List!29765)

(assert (=> d!142005 (= lt!583268 (ListLongMap!20280 lt!583271))))

(declare-fun lt!583270 () Unit!43085)

(declare-fun lt!583269 () Unit!43085)

(assert (=> d!142005 (= lt!583270 lt!583269)))

(assert (=> d!142005 (= (getValueByKey!698 lt!583271 (_1!11318 (tuple2!22615 (select (arr!41888 _keys!1741) from!2144) (get!21199 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!748 (_2!11318 (tuple2!22615 (select (arr!41888 _keys!1741) from!2144) (get!21199 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142005 (= lt!583269 (lemmaContainsTupThenGetReturnValue!349 lt!583271 (_1!11318 (tuple2!22615 (select (arr!41888 _keys!1741) from!2144) (get!21199 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11318 (tuple2!22615 (select (arr!41888 _keys!1741) from!2144) (get!21199 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142005 (= lt!583271 (insertStrictlySorted!478 (toList!10155 call!64205) (_1!11318 (tuple2!22615 (select (arr!41888 _keys!1741) from!2144) (get!21199 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11318 (tuple2!22615 (select (arr!41888 _keys!1741) from!2144) (get!21199 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142005 (= (+!4520 call!64205 (tuple2!22615 (select (arr!41888 _keys!1741) from!2144) (get!21199 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!583268)))

(declare-fun b!1303963 () Bool)

(declare-fun res!865762 () Bool)

(assert (=> b!1303963 (=> (not res!865762) (not e!743871))))

(assert (=> b!1303963 (= res!865762 (= (getValueByKey!698 (toList!10155 lt!583268) (_1!11318 (tuple2!22615 (select (arr!41888 _keys!1741) from!2144) (get!21199 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!748 (_2!11318 (tuple2!22615 (select (arr!41888 _keys!1741) from!2144) (get!21199 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1303964 () Bool)

(assert (=> b!1303964 (= e!743871 (contains!8300 (toList!10155 lt!583268) (tuple2!22615 (select (arr!41888 _keys!1741) from!2144) (get!21199 (select (arr!41889 _values!1445) from!2144) (dynLambda!3489 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142005 res!865763) b!1303963))

(assert (= (and b!1303963 res!865762) b!1303964))

(declare-fun m!1195159 () Bool)

(assert (=> d!142005 m!1195159))

(declare-fun m!1195161 () Bool)

(assert (=> d!142005 m!1195161))

(declare-fun m!1195163 () Bool)

(assert (=> d!142005 m!1195163))

(declare-fun m!1195165 () Bool)

(assert (=> d!142005 m!1195165))

(declare-fun m!1195167 () Bool)

(assert (=> b!1303963 m!1195167))

(declare-fun m!1195169 () Bool)

(assert (=> b!1303964 m!1195169))

(assert (=> b!1303802 d!142005))

(declare-fun d!142007 () Bool)

(declare-fun e!743872 () Bool)

(assert (=> d!142007 e!743872))

(declare-fun res!865765 () Bool)

(assert (=> d!142007 (=> (not res!865765) (not e!743872))))

(declare-fun lt!583272 () ListLongMap!20279)

(assert (=> d!142007 (= res!865765 (contains!8297 lt!583272 (_1!11318 (tuple2!22615 lt!583157 lt!583156))))))

(declare-fun lt!583275 () List!29765)

(assert (=> d!142007 (= lt!583272 (ListLongMap!20280 lt!583275))))

(declare-fun lt!583274 () Unit!43085)

(declare-fun lt!583273 () Unit!43085)

(assert (=> d!142007 (= lt!583274 lt!583273)))

(assert (=> d!142007 (= (getValueByKey!698 lt!583275 (_1!11318 (tuple2!22615 lt!583157 lt!583156))) (Some!748 (_2!11318 (tuple2!22615 lt!583157 lt!583156))))))

(assert (=> d!142007 (= lt!583273 (lemmaContainsTupThenGetReturnValue!349 lt!583275 (_1!11318 (tuple2!22615 lt!583157 lt!583156)) (_2!11318 (tuple2!22615 lt!583157 lt!583156))))))

(assert (=> d!142007 (= lt!583275 (insertStrictlySorted!478 (toList!10155 lt!583158) (_1!11318 (tuple2!22615 lt!583157 lt!583156)) (_2!11318 (tuple2!22615 lt!583157 lt!583156))))))

(assert (=> d!142007 (= (+!4520 lt!583158 (tuple2!22615 lt!583157 lt!583156)) lt!583272)))

(declare-fun b!1303965 () Bool)

(declare-fun res!865764 () Bool)

(assert (=> b!1303965 (=> (not res!865764) (not e!743872))))

(assert (=> b!1303965 (= res!865764 (= (getValueByKey!698 (toList!10155 lt!583272) (_1!11318 (tuple2!22615 lt!583157 lt!583156))) (Some!748 (_2!11318 (tuple2!22615 lt!583157 lt!583156)))))))

(declare-fun b!1303966 () Bool)

(assert (=> b!1303966 (= e!743872 (contains!8300 (toList!10155 lt!583272) (tuple2!22615 lt!583157 lt!583156)))))

(assert (= (and d!142007 res!865765) b!1303965))

(assert (= (and b!1303965 res!865764) b!1303966))

(declare-fun m!1195171 () Bool)

(assert (=> d!142007 m!1195171))

(declare-fun m!1195173 () Bool)

(assert (=> d!142007 m!1195173))

(declare-fun m!1195175 () Bool)

(assert (=> d!142007 m!1195175))

(declare-fun m!1195177 () Bool)

(assert (=> d!142007 m!1195177))

(declare-fun m!1195179 () Bool)

(assert (=> b!1303965 m!1195179))

(declare-fun m!1195181 () Bool)

(assert (=> b!1303966 m!1195181))

(assert (=> b!1303802 d!142007))

(assert (=> b!1303802 d!141935))

(declare-fun d!142009 () Bool)

(declare-fun e!743873 () Bool)

(assert (=> d!142009 e!743873))

(declare-fun res!865766 () Bool)

(assert (=> d!142009 (=> res!865766 e!743873)))

(declare-fun lt!583277 () Bool)

(assert (=> d!142009 (= res!865766 (not lt!583277))))

(declare-fun lt!583279 () Bool)

(assert (=> d!142009 (= lt!583277 lt!583279)))

(declare-fun lt!583278 () Unit!43085)

(declare-fun e!743874 () Unit!43085)

(assert (=> d!142009 (= lt!583278 e!743874)))

(declare-fun c!125417 () Bool)

(assert (=> d!142009 (= c!125417 lt!583279)))

(assert (=> d!142009 (= lt!583279 (containsKey!724 (toList!10155 (+!4520 lt!583158 (tuple2!22615 lt!583157 lt!583156))) lt!583154))))

(assert (=> d!142009 (= (contains!8297 (+!4520 lt!583158 (tuple2!22615 lt!583157 lt!583156)) lt!583154) lt!583277)))

(declare-fun b!1303967 () Bool)

(declare-fun lt!583276 () Unit!43085)

(assert (=> b!1303967 (= e!743874 lt!583276)))

(assert (=> b!1303967 (= lt!583276 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10155 (+!4520 lt!583158 (tuple2!22615 lt!583157 lt!583156))) lt!583154))))

(assert (=> b!1303967 (isDefined!507 (getValueByKey!698 (toList!10155 (+!4520 lt!583158 (tuple2!22615 lt!583157 lt!583156))) lt!583154))))

(declare-fun b!1303968 () Bool)

(declare-fun Unit!43098 () Unit!43085)

(assert (=> b!1303968 (= e!743874 Unit!43098)))

(declare-fun b!1303969 () Bool)

(assert (=> b!1303969 (= e!743873 (isDefined!507 (getValueByKey!698 (toList!10155 (+!4520 lt!583158 (tuple2!22615 lt!583157 lt!583156))) lt!583154)))))

(assert (= (and d!142009 c!125417) b!1303967))

(assert (= (and d!142009 (not c!125417)) b!1303968))

(assert (= (and d!142009 (not res!865766)) b!1303969))

(declare-fun m!1195183 () Bool)

(assert (=> d!142009 m!1195183))

(declare-fun m!1195185 () Bool)

(assert (=> b!1303967 m!1195185))

(declare-fun m!1195187 () Bool)

(assert (=> b!1303967 m!1195187))

(assert (=> b!1303967 m!1195187))

(declare-fun m!1195189 () Bool)

(assert (=> b!1303967 m!1195189))

(assert (=> b!1303969 m!1195187))

(assert (=> b!1303969 m!1195187))

(assert (=> b!1303969 m!1195189))

(assert (=> b!1303802 d!142009))

(declare-fun d!142011 () Bool)

(assert (=> d!142011 (not (contains!8297 (+!4520 lt!583158 (tuple2!22615 lt!583157 lt!583156)) lt!583154))))

(declare-fun lt!583282 () Unit!43085)

(declare-fun choose!1919 (ListLongMap!20279 (_ BitVec 64) V!51601 (_ BitVec 64)) Unit!43085)

(assert (=> d!142011 (= lt!583282 (choose!1919 lt!583158 lt!583157 lt!583156 lt!583154))))

(declare-fun e!743877 () Bool)

(assert (=> d!142011 e!743877))

(declare-fun res!865769 () Bool)

(assert (=> d!142011 (=> (not res!865769) (not e!743877))))

(assert (=> d!142011 (= res!865769 (not (contains!8297 lt!583158 lt!583154)))))

(assert (=> d!142011 (= (addStillNotContains!471 lt!583158 lt!583157 lt!583156 lt!583154) lt!583282)))

(declare-fun b!1303973 () Bool)

(assert (=> b!1303973 (= e!743877 (not (= lt!583157 lt!583154)))))

(assert (= (and d!142011 res!865769) b!1303973))

(assert (=> d!142011 m!1194859))

(assert (=> d!142011 m!1194859))

(assert (=> d!142011 m!1194861))

(declare-fun m!1195191 () Bool)

(assert (=> d!142011 m!1195191))

(declare-fun m!1195193 () Bool)

(assert (=> d!142011 m!1195193))

(assert (=> b!1303802 d!142011))

(assert (=> b!1303764 d!141907))

(assert (=> b!1303803 d!141917))

(declare-fun b!1303975 () Bool)

(declare-fun e!743878 () Bool)

(assert (=> b!1303975 (= e!743878 tp_is_empty!34873)))

(declare-fun condMapEmpty!53902 () Bool)

(declare-fun mapDefault!53902 () ValueCell!16538)

(assert (=> mapNonEmpty!53901 (= condMapEmpty!53902 (= mapRest!53901 ((as const (Array (_ BitVec 32) ValueCell!16538)) mapDefault!53902)))))

(declare-fun mapRes!53902 () Bool)

(assert (=> mapNonEmpty!53901 (= tp!102855 (and e!743878 mapRes!53902))))

(declare-fun mapNonEmpty!53902 () Bool)

(declare-fun tp!102856 () Bool)

(declare-fun e!743879 () Bool)

(assert (=> mapNonEmpty!53902 (= mapRes!53902 (and tp!102856 e!743879))))

(declare-fun mapRest!53902 () (Array (_ BitVec 32) ValueCell!16538))

(declare-fun mapValue!53902 () ValueCell!16538)

(declare-fun mapKey!53902 () (_ BitVec 32))

(assert (=> mapNonEmpty!53902 (= mapRest!53901 (store mapRest!53902 mapKey!53902 mapValue!53902))))

(declare-fun mapIsEmpty!53902 () Bool)

(assert (=> mapIsEmpty!53902 mapRes!53902))

(declare-fun b!1303974 () Bool)

(assert (=> b!1303974 (= e!743879 tp_is_empty!34873)))

(assert (= (and mapNonEmpty!53901 condMapEmpty!53902) mapIsEmpty!53902))

(assert (= (and mapNonEmpty!53901 (not condMapEmpty!53902)) mapNonEmpty!53902))

(assert (= (and mapNonEmpty!53902 ((_ is ValueCellFull!16538) mapValue!53902)) b!1303974))

(assert (= (and mapNonEmpty!53901 ((_ is ValueCellFull!16538) mapDefault!53902)) b!1303975))

(declare-fun m!1195195 () Bool)

(assert (=> mapNonEmpty!53902 m!1195195))

(declare-fun b_lambda!23241 () Bool)

(assert (= b_lambda!23237 (or (and start!110158 b_free!29233) b_lambda!23241)))

(declare-fun b_lambda!23243 () Bool)

(assert (= b_lambda!23239 (or (and start!110158 b_free!29233) b_lambda!23243)))

(check-sat (not d!141945) (not d!141951) (not d!141955) (not b!1303954) (not b!1303928) (not b!1303922) (not d!141987) (not b!1303944) (not b!1303937) (not b!1303857) (not d!141997) (not d!141973) (not b_lambda!23243) (not d!142005) (not b!1303873) (not d!141985) (not b!1303878) (not d!141963) (not d!141917) (not d!141977) (not b!1303935) tp_is_empty!34873 (not b!1303952) (not b_lambda!23235) (not d!142011) (not bm!64208) (not b!1303926) (not d!142007) (not b!1303943) (not b!1303890) (not b_lambda!23233) (not d!141957) (not d!141979) (not d!141905) (not b_lambda!23241) (not d!142009) (not d!142003) (not b!1303966) (not b!1303831) (not b!1303846) (not b!1303879) (not b!1303884) (not bm!64207) (not d!141933) (not b!1303889) (not b!1303853) (not b!1303881) (not bm!64206) (not d!141921) (not b!1303874) (not b!1303858) (not b!1303864) (not d!141929) (not d!141969) (not mapNonEmpty!53902) (not b!1303963) (not b!1303861) (not b!1303835) (not d!142001) (not d!141911) (not d!141965) (not d!141961) (not b!1303949) (not b!1303900) (not d!141971) (not b!1303931) b_and!47391 (not d!141931) (not b!1303894) (not d!141959) (not b!1303969) (not b!1303856) (not b!1303919) (not b!1303891) (not b!1303924) (not d!141975) (not b!1303948) (not d!141923) (not b!1303957) (not d!141939) (not b!1303929) (not b!1303832) (not b_next!29233) (not b!1303855) (not b!1303932) (not b!1303965) (not d!141983) (not b!1303867) (not b!1303960) (not b!1303964) (not d!141927) (not b!1303959) (not d!141991) (not b!1303863) (not b!1303955) (not b!1303938) (not b!1303958) (not d!141947) (not b!1303862) (not b_lambda!23231) (not d!141909) (not d!141989) (not d!141981) (not b!1303962) (not d!141995) (not b!1303946) (not d!141999) (not d!141993) (not b!1303945) (not b!1303876) (not b!1303916) (not b!1303882) (not d!141943) (not b!1303967))
(check-sat b_and!47391 (not b_next!29233))
