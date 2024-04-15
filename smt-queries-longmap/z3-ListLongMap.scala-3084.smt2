; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43382 () Bool)

(assert start!43382)

(declare-fun b_free!12223 () Bool)

(declare-fun b_next!12223 () Bool)

(assert (=> start!43382 (= b_free!12223 (not b_next!12223))))

(declare-fun tp!42946 () Bool)

(declare-fun b_and!20953 () Bool)

(assert (=> start!43382 (= tp!42946 b_and!20953)))

(declare-fun b!480620 () Bool)

(declare-fun res!286638 () Bool)

(declare-fun e!282769 () Bool)

(assert (=> b!480620 (=> (not res!286638) (not e!282769))))

(declare-datatypes ((array!31131 0))(
  ( (array!31132 (arr!14970 (Array (_ BitVec 32) (_ BitVec 64))) (size!15329 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31131)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31131 (_ BitVec 32)) Bool)

(assert (=> b!480620 (= res!286638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!286636 () Bool)

(assert (=> start!43382 (=> (not res!286636) (not e!282769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43382 (= res!286636 (validMask!0 mask!2352))))

(assert (=> start!43382 e!282769))

(assert (=> start!43382 true))

(declare-fun tp_is_empty!13735 () Bool)

(assert (=> start!43382 tp_is_empty!13735))

(declare-datatypes ((V!19385 0))(
  ( (V!19386 (val!6915 Int)) )
))
(declare-datatypes ((ValueCell!6506 0))(
  ( (ValueCellFull!6506 (v!9200 V!19385)) (EmptyCell!6506) )
))
(declare-datatypes ((array!31133 0))(
  ( (array!31134 (arr!14971 (Array (_ BitVec 32) ValueCell!6506)) (size!15330 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31133)

(declare-fun e!282767 () Bool)

(declare-fun array_inv!10888 (array!31133) Bool)

(assert (=> start!43382 (and (array_inv!10888 _values!1516) e!282767)))

(assert (=> start!43382 tp!42946))

(declare-fun array_inv!10889 (array!31131) Bool)

(assert (=> start!43382 (array_inv!10889 _keys!1874)))

(declare-fun b!480621 () Bool)

(declare-fun res!286635 () Bool)

(assert (=> b!480621 (=> (not res!286635) (not e!282769))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19385)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun defaultEntry!1519 () Int)

(declare-fun zeroValue!1458 () V!19385)

(declare-datatypes ((tuple2!9124 0))(
  ( (tuple2!9125 (_1!4573 (_ BitVec 64)) (_2!4573 V!19385)) )
))
(declare-datatypes ((List!9187 0))(
  ( (Nil!9184) (Cons!9183 (h!10039 tuple2!9124) (t!15388 List!9187)) )
))
(declare-datatypes ((ListLongMap!8027 0))(
  ( (ListLongMap!8028 (toList!4029 List!9187)) )
))
(declare-fun contains!2606 (ListLongMap!8027 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2282 (array!31131 array!31133 (_ BitVec 32) (_ BitVec 32) V!19385 V!19385 (_ BitVec 32) Int) ListLongMap!8027)

(assert (=> b!480621 (= res!286635 (contains!2606 (getCurrentListMap!2282 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480622 () Bool)

(declare-fun res!286634 () Bool)

(assert (=> b!480622 (=> (not res!286634) (not e!282769))))

(declare-datatypes ((List!9188 0))(
  ( (Nil!9185) (Cons!9184 (h!10040 (_ BitVec 64)) (t!15389 List!9188)) )
))
(declare-fun arrayNoDuplicates!0 (array!31131 (_ BitVec 32) List!9188) Bool)

(assert (=> b!480622 (= res!286634 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9185))))

(declare-fun b!480623 () Bool)

(declare-fun e!282770 () Bool)

(declare-fun arrayContainsKey!0 (array!31131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480623 (= e!282770 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480624 () Bool)

(declare-fun e!282771 () Bool)

(declare-fun mapRes!22306 () Bool)

(assert (=> b!480624 (= e!282767 (and e!282771 mapRes!22306))))

(declare-fun condMapEmpty!22306 () Bool)

(declare-fun mapDefault!22306 () ValueCell!6506)

(assert (=> b!480624 (= condMapEmpty!22306 (= (arr!14971 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6506)) mapDefault!22306)))))

(declare-fun b!480625 () Bool)

(declare-fun e!282768 () Bool)

(assert (=> b!480625 (= e!282768 tp_is_empty!13735)))

(declare-fun b!480626 () Bool)

(assert (=> b!480626 (= e!282770 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480627 () Bool)

(declare-fun lt!218020 () (_ BitVec 32))

(assert (=> b!480627 (= e!282769 (not (or (not (= (size!15329 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))) (bvsge lt!218020 #b00000000000000000000000000000000))))))

(assert (=> b!480627 (arrayForallSeekEntryOrOpenFound!0 lt!218020 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14088 0))(
  ( (Unit!14089) )
))
(declare-fun lt!218018 () Unit!14088)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14088)

(assert (=> b!480627 (= lt!218018 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218020))))

(declare-fun arrayScanForKey!0 (array!31131 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480627 (= lt!218020 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480627 e!282770))

(declare-fun c!57749 () Bool)

(assert (=> b!480627 (= c!57749 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218019 () Unit!14088)

(declare-fun lemmaKeyInListMapIsInArray!133 (array!31131 array!31133 (_ BitVec 32) (_ BitVec 32) V!19385 V!19385 (_ BitVec 64) Int) Unit!14088)

(assert (=> b!480627 (= lt!218019 (lemmaKeyInListMapIsInArray!133 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun mapNonEmpty!22306 () Bool)

(declare-fun tp!42945 () Bool)

(assert (=> mapNonEmpty!22306 (= mapRes!22306 (and tp!42945 e!282768))))

(declare-fun mapRest!22306 () (Array (_ BitVec 32) ValueCell!6506))

(declare-fun mapValue!22306 () ValueCell!6506)

(declare-fun mapKey!22306 () (_ BitVec 32))

(assert (=> mapNonEmpty!22306 (= (arr!14971 _values!1516) (store mapRest!22306 mapKey!22306 mapValue!22306))))

(declare-fun mapIsEmpty!22306 () Bool)

(assert (=> mapIsEmpty!22306 mapRes!22306))

(declare-fun b!480628 () Bool)

(assert (=> b!480628 (= e!282771 tp_is_empty!13735)))

(declare-fun b!480629 () Bool)

(declare-fun res!286637 () Bool)

(assert (=> b!480629 (=> (not res!286637) (not e!282769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480629 (= res!286637 (validKeyInArray!0 k0!1332))))

(declare-fun b!480630 () Bool)

(declare-fun res!286633 () Bool)

(assert (=> b!480630 (=> (not res!286633) (not e!282769))))

(assert (=> b!480630 (= res!286633 (and (= (size!15330 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15329 _keys!1874) (size!15330 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43382 res!286636) b!480630))

(assert (= (and b!480630 res!286633) b!480620))

(assert (= (and b!480620 res!286638) b!480622))

(assert (= (and b!480622 res!286634) b!480621))

(assert (= (and b!480621 res!286635) b!480629))

(assert (= (and b!480629 res!286637) b!480627))

(assert (= (and b!480627 c!57749) b!480623))

(assert (= (and b!480627 (not c!57749)) b!480626))

(assert (= (and b!480624 condMapEmpty!22306) mapIsEmpty!22306))

(assert (= (and b!480624 (not condMapEmpty!22306)) mapNonEmpty!22306))

(get-info :version)

(assert (= (and mapNonEmpty!22306 ((_ is ValueCellFull!6506) mapValue!22306)) b!480625))

(assert (= (and b!480624 ((_ is ValueCellFull!6506) mapDefault!22306)) b!480628))

(assert (= start!43382 b!480624))

(declare-fun m!461709 () Bool)

(assert (=> mapNonEmpty!22306 m!461709))

(declare-fun m!461711 () Bool)

(assert (=> b!480622 m!461711))

(declare-fun m!461713 () Bool)

(assert (=> b!480620 m!461713))

(declare-fun m!461715 () Bool)

(assert (=> b!480623 m!461715))

(declare-fun m!461717 () Bool)

(assert (=> b!480621 m!461717))

(assert (=> b!480621 m!461717))

(declare-fun m!461719 () Bool)

(assert (=> b!480621 m!461719))

(declare-fun m!461721 () Bool)

(assert (=> b!480627 m!461721))

(declare-fun m!461723 () Bool)

(assert (=> b!480627 m!461723))

(declare-fun m!461725 () Bool)

(assert (=> b!480627 m!461725))

(declare-fun m!461727 () Bool)

(assert (=> b!480627 m!461727))

(declare-fun m!461729 () Bool)

(assert (=> start!43382 m!461729))

(declare-fun m!461731 () Bool)

(assert (=> start!43382 m!461731))

(declare-fun m!461733 () Bool)

(assert (=> start!43382 m!461733))

(declare-fun m!461735 () Bool)

(assert (=> b!480629 m!461735))

(check-sat (not b_next!12223) (not b!480620) b_and!20953 (not b!480623) tp_is_empty!13735 (not start!43382) (not b!480621) (not b!480629) (not b!480627) (not mapNonEmpty!22306) (not b!480622))
(check-sat b_and!20953 (not b_next!12223))
(get-model)

(declare-fun d!76537 () Bool)

(declare-fun e!282812 () Bool)

(assert (=> d!76537 e!282812))

(declare-fun res!286677 () Bool)

(assert (=> d!76537 (=> res!286677 e!282812)))

(declare-fun lt!218049 () Bool)

(assert (=> d!76537 (= res!286677 (not lt!218049))))

(declare-fun lt!218050 () Bool)

(assert (=> d!76537 (= lt!218049 lt!218050)))

(declare-fun lt!218047 () Unit!14088)

(declare-fun e!282813 () Unit!14088)

(assert (=> d!76537 (= lt!218047 e!282813)))

(declare-fun c!57758 () Bool)

(assert (=> d!76537 (= c!57758 lt!218050)))

(declare-fun containsKey!354 (List!9187 (_ BitVec 64)) Bool)

(assert (=> d!76537 (= lt!218050 (containsKey!354 (toList!4029 (getCurrentListMap!2282 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76537 (= (contains!2606 (getCurrentListMap!2282 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!218049)))

(declare-fun b!480703 () Bool)

(declare-fun lt!218048 () Unit!14088)

(assert (=> b!480703 (= e!282813 lt!218048)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!303 (List!9187 (_ BitVec 64)) Unit!14088)

(assert (=> b!480703 (= lt!218048 (lemmaContainsKeyImpliesGetValueByKeyDefined!303 (toList!4029 (getCurrentListMap!2282 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!398 0))(
  ( (Some!397 (v!9203 V!19385)) (None!396) )
))
(declare-fun isDefined!304 (Option!398) Bool)

(declare-fun getValueByKey!392 (List!9187 (_ BitVec 64)) Option!398)

(assert (=> b!480703 (isDefined!304 (getValueByKey!392 (toList!4029 (getCurrentListMap!2282 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!480704 () Bool)

(declare-fun Unit!14092 () Unit!14088)

(assert (=> b!480704 (= e!282813 Unit!14092)))

(declare-fun b!480705 () Bool)

(assert (=> b!480705 (= e!282812 (isDefined!304 (getValueByKey!392 (toList!4029 (getCurrentListMap!2282 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76537 c!57758) b!480703))

(assert (= (and d!76537 (not c!57758)) b!480704))

(assert (= (and d!76537 (not res!286677)) b!480705))

(declare-fun m!461793 () Bool)

(assert (=> d!76537 m!461793))

(declare-fun m!461795 () Bool)

(assert (=> b!480703 m!461795))

(declare-fun m!461797 () Bool)

(assert (=> b!480703 m!461797))

(assert (=> b!480703 m!461797))

(declare-fun m!461799 () Bool)

(assert (=> b!480703 m!461799))

(assert (=> b!480705 m!461797))

(assert (=> b!480705 m!461797))

(assert (=> b!480705 m!461799))

(assert (=> b!480621 d!76537))

(declare-fun b!480748 () Bool)

(declare-fun e!282840 () Bool)

(declare-fun lt!218107 () ListLongMap!8027)

(declare-fun apply!341 (ListLongMap!8027 (_ BitVec 64)) V!19385)

(assert (=> b!480748 (= e!282840 (= (apply!341 lt!218107 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!480749 () Bool)

(declare-fun e!282848 () ListLongMap!8027)

(declare-fun call!30897 () ListLongMap!8027)

(declare-fun +!1809 (ListLongMap!8027 tuple2!9124) ListLongMap!8027)

(assert (=> b!480749 (= e!282848 (+!1809 call!30897 (tuple2!9125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!480750 () Bool)

(declare-fun c!57775 () Bool)

(assert (=> b!480750 (= c!57775 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!282846 () ListLongMap!8027)

(declare-fun e!282841 () ListLongMap!8027)

(assert (=> b!480750 (= e!282846 e!282841)))

(declare-fun b!480751 () Bool)

(declare-fun res!286699 () Bool)

(declare-fun e!282849 () Bool)

(assert (=> b!480751 (=> (not res!286699) (not e!282849))))

(declare-fun e!282843 () Bool)

(assert (=> b!480751 (= res!286699 e!282843)))

(declare-fun c!57773 () Bool)

(assert (=> b!480751 (= c!57773 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!480752 () Bool)

(declare-fun e!282842 () Bool)

(assert (=> b!480752 (= e!282842 e!282840)))

(declare-fun res!286697 () Bool)

(declare-fun call!30894 () Bool)

(assert (=> b!480752 (= res!286697 call!30894)))

(assert (=> b!480752 (=> (not res!286697) (not e!282840))))

(declare-fun c!57772 () Bool)

(declare-fun call!30895 () ListLongMap!8027)

(declare-fun c!57771 () Bool)

(declare-fun call!30892 () ListLongMap!8027)

(declare-fun call!30896 () ListLongMap!8027)

(declare-fun bm!30888 () Bool)

(assert (=> bm!30888 (= call!30897 (+!1809 (ite c!57772 call!30892 (ite c!57771 call!30895 call!30896)) (ite (or c!57772 c!57771) (tuple2!9125 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun bm!30889 () Bool)

(declare-fun call!30893 () Bool)

(assert (=> bm!30889 (= call!30893 (contains!2606 lt!218107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30890 () Bool)

(assert (=> bm!30890 (= call!30894 (contains!2606 lt!218107 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!480754 () Bool)

(declare-fun e!282845 () Bool)

(declare-fun e!282851 () Bool)

(assert (=> b!480754 (= e!282845 e!282851)))

(declare-fun res!286701 () Bool)

(assert (=> b!480754 (=> (not res!286701) (not e!282851))))

(assert (=> b!480754 (= res!286701 (contains!2606 lt!218107 (select (arr!14970 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!480754 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15329 _keys!1874)))))

(declare-fun b!480755 () Bool)

(declare-fun call!30891 () ListLongMap!8027)

(assert (=> b!480755 (= e!282841 call!30891)))

(declare-fun b!480756 () Bool)

(declare-fun get!7264 (ValueCell!6506 V!19385) V!19385)

(declare-fun dynLambda!955 (Int (_ BitVec 64)) V!19385)

(assert (=> b!480756 (= e!282851 (= (apply!341 lt!218107 (select (arr!14970 _keys!1874) #b00000000000000000000000000000000)) (get!7264 (select (arr!14971 _values!1516) #b00000000000000000000000000000000) (dynLambda!955 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!480756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15330 _values!1516)))))

(assert (=> b!480756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15329 _keys!1874)))))

(declare-fun b!480757 () Bool)

(assert (=> b!480757 (= e!282841 call!30896)))

(declare-fun bm!30891 () Bool)

(assert (=> bm!30891 (= call!30895 call!30892)))

(declare-fun bm!30892 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2145 (array!31131 array!31133 (_ BitVec 32) (_ BitVec 32) V!19385 V!19385 (_ BitVec 32) Int) ListLongMap!8027)

(assert (=> bm!30892 (= call!30892 (getCurrentListMapNoExtraKeys!2145 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!480758 () Bool)

(assert (=> b!480758 (= e!282846 call!30891)))

(declare-fun b!480759 () Bool)

(assert (=> b!480759 (= e!282848 e!282846)))

(assert (=> b!480759 (= c!57771 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!480760 () Bool)

(declare-fun e!282852 () Bool)

(assert (=> b!480760 (= e!282852 (= (apply!341 lt!218107 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun b!480761 () Bool)

(declare-fun res!286704 () Bool)

(assert (=> b!480761 (=> (not res!286704) (not e!282849))))

(assert (=> b!480761 (= res!286704 e!282845)))

(declare-fun res!286696 () Bool)

(assert (=> b!480761 (=> res!286696 e!282845)))

(declare-fun e!282850 () Bool)

(assert (=> b!480761 (= res!286696 (not e!282850))))

(declare-fun res!286703 () Bool)

(assert (=> b!480761 (=> (not res!286703) (not e!282850))))

(assert (=> b!480761 (= res!286703 (bvslt #b00000000000000000000000000000000 (size!15329 _keys!1874)))))

(declare-fun b!480753 () Bool)

(assert (=> b!480753 (= e!282842 (not call!30894))))

(declare-fun d!76539 () Bool)

(assert (=> d!76539 e!282849))

(declare-fun res!286698 () Bool)

(assert (=> d!76539 (=> (not res!286698) (not e!282849))))

(assert (=> d!76539 (= res!286698 (or (bvsge #b00000000000000000000000000000000 (size!15329 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15329 _keys!1874)))))))

(declare-fun lt!218103 () ListLongMap!8027)

(assert (=> d!76539 (= lt!218107 lt!218103)))

(declare-fun lt!218104 () Unit!14088)

(declare-fun e!282844 () Unit!14088)

(assert (=> d!76539 (= lt!218104 e!282844)))

(declare-fun c!57774 () Bool)

(declare-fun e!282847 () Bool)

(assert (=> d!76539 (= c!57774 e!282847)))

(declare-fun res!286700 () Bool)

(assert (=> d!76539 (=> (not res!286700) (not e!282847))))

(assert (=> d!76539 (= res!286700 (bvslt #b00000000000000000000000000000000 (size!15329 _keys!1874)))))

(assert (=> d!76539 (= lt!218103 e!282848)))

(assert (=> d!76539 (= c!57772 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76539 (validMask!0 mask!2352)))

(assert (=> d!76539 (= (getCurrentListMap!2282 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!218107)))

(declare-fun b!480762 () Bool)

(assert (=> b!480762 (= e!282843 e!282852)))

(declare-fun res!286702 () Bool)

(assert (=> b!480762 (= res!286702 call!30893)))

(assert (=> b!480762 (=> (not res!286702) (not e!282852))))

(declare-fun b!480763 () Bool)

(declare-fun Unit!14093 () Unit!14088)

(assert (=> b!480763 (= e!282844 Unit!14093)))

(declare-fun b!480764 () Bool)

(assert (=> b!480764 (= e!282843 (not call!30893))))

(declare-fun b!480765 () Bool)

(assert (=> b!480765 (= e!282849 e!282842)))

(declare-fun c!57776 () Bool)

(assert (=> b!480765 (= c!57776 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!480766 () Bool)

(declare-fun lt!218113 () Unit!14088)

(assert (=> b!480766 (= e!282844 lt!218113)))

(declare-fun lt!218100 () ListLongMap!8027)

(assert (=> b!480766 (= lt!218100 (getCurrentListMapNoExtraKeys!2145 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218114 () (_ BitVec 64))

(assert (=> b!480766 (= lt!218114 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218098 () (_ BitVec 64))

(assert (=> b!480766 (= lt!218098 (select (arr!14970 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218101 () Unit!14088)

(declare-fun addStillContains!299 (ListLongMap!8027 (_ BitVec 64) V!19385 (_ BitVec 64)) Unit!14088)

(assert (=> b!480766 (= lt!218101 (addStillContains!299 lt!218100 lt!218114 zeroValue!1458 lt!218098))))

(assert (=> b!480766 (contains!2606 (+!1809 lt!218100 (tuple2!9125 lt!218114 zeroValue!1458)) lt!218098)))

(declare-fun lt!218111 () Unit!14088)

(assert (=> b!480766 (= lt!218111 lt!218101)))

(declare-fun lt!218112 () ListLongMap!8027)

(assert (=> b!480766 (= lt!218112 (getCurrentListMapNoExtraKeys!2145 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218096 () (_ BitVec 64))

(assert (=> b!480766 (= lt!218096 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218115 () (_ BitVec 64))

(assert (=> b!480766 (= lt!218115 (select (arr!14970 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218095 () Unit!14088)

(declare-fun addApplyDifferent!299 (ListLongMap!8027 (_ BitVec 64) V!19385 (_ BitVec 64)) Unit!14088)

(assert (=> b!480766 (= lt!218095 (addApplyDifferent!299 lt!218112 lt!218096 minValue!1458 lt!218115))))

(assert (=> b!480766 (= (apply!341 (+!1809 lt!218112 (tuple2!9125 lt!218096 minValue!1458)) lt!218115) (apply!341 lt!218112 lt!218115))))

(declare-fun lt!218102 () Unit!14088)

(assert (=> b!480766 (= lt!218102 lt!218095)))

(declare-fun lt!218099 () ListLongMap!8027)

(assert (=> b!480766 (= lt!218099 (getCurrentListMapNoExtraKeys!2145 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218116 () (_ BitVec 64))

(assert (=> b!480766 (= lt!218116 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218097 () (_ BitVec 64))

(assert (=> b!480766 (= lt!218097 (select (arr!14970 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218110 () Unit!14088)

(assert (=> b!480766 (= lt!218110 (addApplyDifferent!299 lt!218099 lt!218116 zeroValue!1458 lt!218097))))

(assert (=> b!480766 (= (apply!341 (+!1809 lt!218099 (tuple2!9125 lt!218116 zeroValue!1458)) lt!218097) (apply!341 lt!218099 lt!218097))))

(declare-fun lt!218105 () Unit!14088)

(assert (=> b!480766 (= lt!218105 lt!218110)))

(declare-fun lt!218108 () ListLongMap!8027)

(assert (=> b!480766 (= lt!218108 (getCurrentListMapNoExtraKeys!2145 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218106 () (_ BitVec 64))

(assert (=> b!480766 (= lt!218106 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218109 () (_ BitVec 64))

(assert (=> b!480766 (= lt!218109 (select (arr!14970 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!480766 (= lt!218113 (addApplyDifferent!299 lt!218108 lt!218106 minValue!1458 lt!218109))))

(assert (=> b!480766 (= (apply!341 (+!1809 lt!218108 (tuple2!9125 lt!218106 minValue!1458)) lt!218109) (apply!341 lt!218108 lt!218109))))

(declare-fun b!480767 () Bool)

(assert (=> b!480767 (= e!282847 (validKeyInArray!0 (select (arr!14970 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30893 () Bool)

(assert (=> bm!30893 (= call!30896 call!30895)))

(declare-fun bm!30894 () Bool)

(assert (=> bm!30894 (= call!30891 call!30897)))

(declare-fun b!480768 () Bool)

(assert (=> b!480768 (= e!282850 (validKeyInArray!0 (select (arr!14970 _keys!1874) #b00000000000000000000000000000000)))))

(assert (= (and d!76539 c!57772) b!480749))

(assert (= (and d!76539 (not c!57772)) b!480759))

(assert (= (and b!480759 c!57771) b!480758))

(assert (= (and b!480759 (not c!57771)) b!480750))

(assert (= (and b!480750 c!57775) b!480755))

(assert (= (and b!480750 (not c!57775)) b!480757))

(assert (= (or b!480755 b!480757) bm!30893))

(assert (= (or b!480758 bm!30893) bm!30891))

(assert (= (or b!480758 b!480755) bm!30894))

(assert (= (or b!480749 bm!30891) bm!30892))

(assert (= (or b!480749 bm!30894) bm!30888))

(assert (= (and d!76539 res!286700) b!480767))

(assert (= (and d!76539 c!57774) b!480766))

(assert (= (and d!76539 (not c!57774)) b!480763))

(assert (= (and d!76539 res!286698) b!480761))

(assert (= (and b!480761 res!286703) b!480768))

(assert (= (and b!480761 (not res!286696)) b!480754))

(assert (= (and b!480754 res!286701) b!480756))

(assert (= (and b!480761 res!286704) b!480751))

(assert (= (and b!480751 c!57773) b!480762))

(assert (= (and b!480751 (not c!57773)) b!480764))

(assert (= (and b!480762 res!286702) b!480760))

(assert (= (or b!480762 b!480764) bm!30889))

(assert (= (and b!480751 res!286699) b!480765))

(assert (= (and b!480765 c!57776) b!480752))

(assert (= (and b!480765 (not c!57776)) b!480753))

(assert (= (and b!480752 res!286697) b!480748))

(assert (= (or b!480752 b!480753) bm!30890))

(declare-fun b_lambda!10781 () Bool)

(assert (=> (not b_lambda!10781) (not b!480756)))

(declare-fun t!15394 () Bool)

(declare-fun tb!4155 () Bool)

(assert (=> (and start!43382 (= defaultEntry!1519 defaultEntry!1519) t!15394) tb!4155))

(declare-fun result!7749 () Bool)

(assert (=> tb!4155 (= result!7749 tp_is_empty!13735)))

(assert (=> b!480756 t!15394))

(declare-fun b_and!20959 () Bool)

(assert (= b_and!20953 (and (=> t!15394 result!7749) b_and!20959)))

(declare-fun m!461801 () Bool)

(assert (=> bm!30889 m!461801))

(assert (=> d!76539 m!461729))

(declare-fun m!461803 () Bool)

(assert (=> b!480754 m!461803))

(assert (=> b!480754 m!461803))

(declare-fun m!461805 () Bool)

(assert (=> b!480754 m!461805))

(assert (=> b!480767 m!461803))

(assert (=> b!480767 m!461803))

(declare-fun m!461807 () Bool)

(assert (=> b!480767 m!461807))

(declare-fun m!461809 () Bool)

(assert (=> b!480749 m!461809))

(assert (=> b!480768 m!461803))

(assert (=> b!480768 m!461803))

(assert (=> b!480768 m!461807))

(declare-fun m!461811 () Bool)

(assert (=> bm!30888 m!461811))

(declare-fun m!461813 () Bool)

(assert (=> b!480760 m!461813))

(declare-fun m!461815 () Bool)

(assert (=> bm!30892 m!461815))

(declare-fun m!461817 () Bool)

(assert (=> bm!30890 m!461817))

(declare-fun m!461819 () Bool)

(assert (=> b!480748 m!461819))

(declare-fun m!461821 () Bool)

(assert (=> b!480766 m!461821))

(declare-fun m!461823 () Bool)

(assert (=> b!480766 m!461823))

(declare-fun m!461825 () Bool)

(assert (=> b!480766 m!461825))

(declare-fun m!461827 () Bool)

(assert (=> b!480766 m!461827))

(declare-fun m!461829 () Bool)

(assert (=> b!480766 m!461829))

(declare-fun m!461831 () Bool)

(assert (=> b!480766 m!461831))

(declare-fun m!461833 () Bool)

(assert (=> b!480766 m!461833))

(declare-fun m!461835 () Bool)

(assert (=> b!480766 m!461835))

(declare-fun m!461837 () Bool)

(assert (=> b!480766 m!461837))

(assert (=> b!480766 m!461835))

(assert (=> b!480766 m!461803))

(assert (=> b!480766 m!461815))

(declare-fun m!461839 () Bool)

(assert (=> b!480766 m!461839))

(assert (=> b!480766 m!461833))

(declare-fun m!461841 () Bool)

(assert (=> b!480766 m!461841))

(declare-fun m!461843 () Bool)

(assert (=> b!480766 m!461843))

(assert (=> b!480766 m!461823))

(declare-fun m!461845 () Bool)

(assert (=> b!480766 m!461845))

(declare-fun m!461847 () Bool)

(assert (=> b!480766 m!461847))

(assert (=> b!480766 m!461827))

(declare-fun m!461849 () Bool)

(assert (=> b!480766 m!461849))

(declare-fun m!461851 () Bool)

(assert (=> b!480756 m!461851))

(declare-fun m!461853 () Bool)

(assert (=> b!480756 m!461853))

(declare-fun m!461855 () Bool)

(assert (=> b!480756 m!461855))

(assert (=> b!480756 m!461803))

(declare-fun m!461857 () Bool)

(assert (=> b!480756 m!461857))

(assert (=> b!480756 m!461851))

(assert (=> b!480756 m!461853))

(assert (=> b!480756 m!461803))

(assert (=> b!480621 d!76539))

(declare-fun d!76541 () Bool)

(assert (=> d!76541 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!480629 d!76541))

(declare-fun d!76543 () Bool)

(assert (=> d!76543 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43382 d!76543))

(declare-fun d!76545 () Bool)

(assert (=> d!76545 (= (array_inv!10888 _values!1516) (bvsge (size!15330 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43382 d!76545))

(declare-fun d!76547 () Bool)

(assert (=> d!76547 (= (array_inv!10889 _keys!1874) (bvsge (size!15329 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43382 d!76547))

(declare-fun b!480781 () Bool)

(declare-fun e!282861 () Bool)

(declare-fun contains!2608 (List!9188 (_ BitVec 64)) Bool)

(assert (=> b!480781 (= e!282861 (contains!2608 Nil!9185 (select (arr!14970 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!480783 () Bool)

(declare-fun e!282864 () Bool)

(declare-fun e!282863 () Bool)

(assert (=> b!480783 (= e!282864 e!282863)))

(declare-fun res!286711 () Bool)

(assert (=> b!480783 (=> (not res!286711) (not e!282863))))

(assert (=> b!480783 (= res!286711 (not e!282861))))

(declare-fun res!286712 () Bool)

(assert (=> b!480783 (=> (not res!286712) (not e!282861))))

(assert (=> b!480783 (= res!286712 (validKeyInArray!0 (select (arr!14970 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!480784 () Bool)

(declare-fun e!282862 () Bool)

(assert (=> b!480784 (= e!282863 e!282862)))

(declare-fun c!57779 () Bool)

(assert (=> b!480784 (= c!57779 (validKeyInArray!0 (select (arr!14970 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76549 () Bool)

(declare-fun res!286713 () Bool)

(assert (=> d!76549 (=> res!286713 e!282864)))

(assert (=> d!76549 (= res!286713 (bvsge #b00000000000000000000000000000000 (size!15329 _keys!1874)))))

(assert (=> d!76549 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9185) e!282864)))

(declare-fun b!480782 () Bool)

(declare-fun call!30900 () Bool)

(assert (=> b!480782 (= e!282862 call!30900)))

(declare-fun b!480785 () Bool)

(assert (=> b!480785 (= e!282862 call!30900)))

(declare-fun bm!30897 () Bool)

(assert (=> bm!30897 (= call!30900 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57779 (Cons!9184 (select (arr!14970 _keys!1874) #b00000000000000000000000000000000) Nil!9185) Nil!9185)))))

(assert (= (and d!76549 (not res!286713)) b!480783))

(assert (= (and b!480783 res!286712) b!480781))

(assert (= (and b!480783 res!286711) b!480784))

(assert (= (and b!480784 c!57779) b!480782))

(assert (= (and b!480784 (not c!57779)) b!480785))

(assert (= (or b!480782 b!480785) bm!30897))

(assert (=> b!480781 m!461803))

(assert (=> b!480781 m!461803))

(declare-fun m!461859 () Bool)

(assert (=> b!480781 m!461859))

(assert (=> b!480783 m!461803))

(assert (=> b!480783 m!461803))

(assert (=> b!480783 m!461807))

(assert (=> b!480784 m!461803))

(assert (=> b!480784 m!461803))

(assert (=> b!480784 m!461807))

(assert (=> bm!30897 m!461803))

(declare-fun m!461861 () Bool)

(assert (=> bm!30897 m!461861))

(assert (=> b!480622 d!76549))

(declare-fun b!480794 () Bool)

(declare-fun e!282872 () Bool)

(declare-fun e!282873 () Bool)

(assert (=> b!480794 (= e!282872 e!282873)))

(declare-fun lt!218125 () (_ BitVec 64))

(assert (=> b!480794 (= lt!218125 (select (arr!14970 _keys!1874) lt!218020))))

(declare-fun lt!218123 () Unit!14088)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31131 (_ BitVec 64) (_ BitVec 32)) Unit!14088)

(assert (=> b!480794 (= lt!218123 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218125 lt!218020))))

(assert (=> b!480794 (arrayContainsKey!0 _keys!1874 lt!218125 #b00000000000000000000000000000000)))

(declare-fun lt!218124 () Unit!14088)

(assert (=> b!480794 (= lt!218124 lt!218123)))

(declare-fun res!286718 () Bool)

(declare-datatypes ((SeekEntryResult!3565 0))(
  ( (MissingZero!3565 (index!16439 (_ BitVec 32))) (Found!3565 (index!16440 (_ BitVec 32))) (Intermediate!3565 (undefined!4377 Bool) (index!16441 (_ BitVec 32)) (x!45166 (_ BitVec 32))) (Undefined!3565) (MissingVacant!3565 (index!16442 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31131 (_ BitVec 32)) SeekEntryResult!3565)

(assert (=> b!480794 (= res!286718 (= (seekEntryOrOpen!0 (select (arr!14970 _keys!1874) lt!218020) _keys!1874 mask!2352) (Found!3565 lt!218020)))))

(assert (=> b!480794 (=> (not res!286718) (not e!282873))))

(declare-fun d!76551 () Bool)

(declare-fun res!286719 () Bool)

(declare-fun e!282871 () Bool)

(assert (=> d!76551 (=> res!286719 e!282871)))

(assert (=> d!76551 (= res!286719 (bvsge lt!218020 (size!15329 _keys!1874)))))

(assert (=> d!76551 (= (arrayForallSeekEntryOrOpenFound!0 lt!218020 _keys!1874 mask!2352) e!282871)))

(declare-fun b!480795 () Bool)

(declare-fun call!30903 () Bool)

(assert (=> b!480795 (= e!282873 call!30903)))

(declare-fun b!480796 () Bool)

(assert (=> b!480796 (= e!282872 call!30903)))

(declare-fun bm!30900 () Bool)

(assert (=> bm!30900 (= call!30903 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!218020 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!480797 () Bool)

(assert (=> b!480797 (= e!282871 e!282872)))

(declare-fun c!57782 () Bool)

(assert (=> b!480797 (= c!57782 (validKeyInArray!0 (select (arr!14970 _keys!1874) lt!218020)))))

(assert (= (and d!76551 (not res!286719)) b!480797))

(assert (= (and b!480797 c!57782) b!480794))

(assert (= (and b!480797 (not c!57782)) b!480796))

(assert (= (and b!480794 res!286718) b!480795))

(assert (= (or b!480795 b!480796) bm!30900))

(declare-fun m!461863 () Bool)

(assert (=> b!480794 m!461863))

(declare-fun m!461865 () Bool)

(assert (=> b!480794 m!461865))

(declare-fun m!461867 () Bool)

(assert (=> b!480794 m!461867))

(assert (=> b!480794 m!461863))

(declare-fun m!461869 () Bool)

(assert (=> b!480794 m!461869))

(declare-fun m!461871 () Bool)

(assert (=> bm!30900 m!461871))

(assert (=> b!480797 m!461863))

(assert (=> b!480797 m!461863))

(declare-fun m!461873 () Bool)

(assert (=> b!480797 m!461873))

(assert (=> b!480627 d!76551))

(declare-fun d!76553 () Bool)

(assert (=> d!76553 (arrayForallSeekEntryOrOpenFound!0 lt!218020 _keys!1874 mask!2352)))

(declare-fun lt!218128 () Unit!14088)

(declare-fun choose!38 (array!31131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14088)

(assert (=> d!76553 (= lt!218128 (choose!38 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218020))))

(assert (=> d!76553 (validMask!0 mask!2352)))

(assert (=> d!76553 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218020) lt!218128)))

(declare-fun bs!15270 () Bool)

(assert (= bs!15270 d!76553))

(assert (=> bs!15270 m!461721))

(declare-fun m!461875 () Bool)

(assert (=> bs!15270 m!461875))

(assert (=> bs!15270 m!461729))

(assert (=> b!480627 d!76553))

(declare-fun d!76555 () Bool)

(declare-fun lt!218131 () (_ BitVec 32))

(assert (=> d!76555 (and (or (bvslt lt!218131 #b00000000000000000000000000000000) (bvsge lt!218131 (size!15329 _keys!1874)) (and (bvsge lt!218131 #b00000000000000000000000000000000) (bvslt lt!218131 (size!15329 _keys!1874)))) (bvsge lt!218131 #b00000000000000000000000000000000) (bvslt lt!218131 (size!15329 _keys!1874)) (= (select (arr!14970 _keys!1874) lt!218131) k0!1332))))

(declare-fun e!282876 () (_ BitVec 32))

(assert (=> d!76555 (= lt!218131 e!282876)))

(declare-fun c!57785 () Bool)

(assert (=> d!76555 (= c!57785 (= (select (arr!14970 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76555 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15329 _keys!1874)) (bvslt (size!15329 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76555 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!218131)))

(declare-fun b!480802 () Bool)

(assert (=> b!480802 (= e!282876 #b00000000000000000000000000000000)))

(declare-fun b!480803 () Bool)

(assert (=> b!480803 (= e!282876 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76555 c!57785) b!480802))

(assert (= (and d!76555 (not c!57785)) b!480803))

(declare-fun m!461877 () Bool)

(assert (=> d!76555 m!461877))

(assert (=> d!76555 m!461803))

(declare-fun m!461879 () Bool)

(assert (=> b!480803 m!461879))

(assert (=> b!480627 d!76555))

(declare-fun d!76557 () Bool)

(declare-fun e!282879 () Bool)

(assert (=> d!76557 e!282879))

(declare-fun c!57788 () Bool)

(assert (=> d!76557 (= c!57788 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218134 () Unit!14088)

(declare-fun choose!1384 (array!31131 array!31133 (_ BitVec 32) (_ BitVec 32) V!19385 V!19385 (_ BitVec 64) Int) Unit!14088)

(assert (=> d!76557 (= lt!218134 (choose!1384 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76557 (validMask!0 mask!2352)))

(assert (=> d!76557 (= (lemmaKeyInListMapIsInArray!133 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218134)))

(declare-fun b!480808 () Bool)

(assert (=> b!480808 (= e!282879 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480809 () Bool)

(assert (=> b!480809 (= e!282879 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76557 c!57788) b!480808))

(assert (= (and d!76557 (not c!57788)) b!480809))

(declare-fun m!461881 () Bool)

(assert (=> d!76557 m!461881))

(assert (=> d!76557 m!461729))

(assert (=> b!480808 m!461715))

(assert (=> b!480627 d!76557))

(declare-fun d!76559 () Bool)

(declare-fun res!286724 () Bool)

(declare-fun e!282884 () Bool)

(assert (=> d!76559 (=> res!286724 e!282884)))

(assert (=> d!76559 (= res!286724 (= (select (arr!14970 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76559 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!282884)))

(declare-fun b!480814 () Bool)

(declare-fun e!282885 () Bool)

(assert (=> b!480814 (= e!282884 e!282885)))

(declare-fun res!286725 () Bool)

(assert (=> b!480814 (=> (not res!286725) (not e!282885))))

(assert (=> b!480814 (= res!286725 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15329 _keys!1874)))))

(declare-fun b!480815 () Bool)

(assert (=> b!480815 (= e!282885 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76559 (not res!286724)) b!480814))

(assert (= (and b!480814 res!286725) b!480815))

(assert (=> d!76559 m!461803))

(declare-fun m!461883 () Bool)

(assert (=> b!480815 m!461883))

(assert (=> b!480623 d!76559))

(declare-fun b!480816 () Bool)

(declare-fun e!282887 () Bool)

(declare-fun e!282888 () Bool)

(assert (=> b!480816 (= e!282887 e!282888)))

(declare-fun lt!218137 () (_ BitVec 64))

(assert (=> b!480816 (= lt!218137 (select (arr!14970 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218135 () Unit!14088)

(assert (=> b!480816 (= lt!218135 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218137 #b00000000000000000000000000000000))))

(assert (=> b!480816 (arrayContainsKey!0 _keys!1874 lt!218137 #b00000000000000000000000000000000)))

(declare-fun lt!218136 () Unit!14088)

(assert (=> b!480816 (= lt!218136 lt!218135)))

(declare-fun res!286726 () Bool)

(assert (=> b!480816 (= res!286726 (= (seekEntryOrOpen!0 (select (arr!14970 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3565 #b00000000000000000000000000000000)))))

(assert (=> b!480816 (=> (not res!286726) (not e!282888))))

(declare-fun d!76561 () Bool)

(declare-fun res!286727 () Bool)

(declare-fun e!282886 () Bool)

(assert (=> d!76561 (=> res!286727 e!282886)))

(assert (=> d!76561 (= res!286727 (bvsge #b00000000000000000000000000000000 (size!15329 _keys!1874)))))

(assert (=> d!76561 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!282886)))

(declare-fun b!480817 () Bool)

(declare-fun call!30904 () Bool)

(assert (=> b!480817 (= e!282888 call!30904)))

(declare-fun b!480818 () Bool)

(assert (=> b!480818 (= e!282887 call!30904)))

(declare-fun bm!30901 () Bool)

(assert (=> bm!30901 (= call!30904 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!480819 () Bool)

(assert (=> b!480819 (= e!282886 e!282887)))

(declare-fun c!57789 () Bool)

(assert (=> b!480819 (= c!57789 (validKeyInArray!0 (select (arr!14970 _keys!1874) #b00000000000000000000000000000000)))))

(assert (= (and d!76561 (not res!286727)) b!480819))

(assert (= (and b!480819 c!57789) b!480816))

(assert (= (and b!480819 (not c!57789)) b!480818))

(assert (= (and b!480816 res!286726) b!480817))

(assert (= (or b!480817 b!480818) bm!30901))

(assert (=> b!480816 m!461803))

(declare-fun m!461885 () Bool)

(assert (=> b!480816 m!461885))

(declare-fun m!461887 () Bool)

(assert (=> b!480816 m!461887))

(assert (=> b!480816 m!461803))

(declare-fun m!461889 () Bool)

(assert (=> b!480816 m!461889))

(declare-fun m!461891 () Bool)

(assert (=> bm!30901 m!461891))

(assert (=> b!480819 m!461803))

(assert (=> b!480819 m!461803))

(assert (=> b!480819 m!461807))

(assert (=> b!480620 d!76561))

(declare-fun mapIsEmpty!22315 () Bool)

(declare-fun mapRes!22315 () Bool)

(assert (=> mapIsEmpty!22315 mapRes!22315))

(declare-fun condMapEmpty!22315 () Bool)

(declare-fun mapDefault!22315 () ValueCell!6506)

(assert (=> mapNonEmpty!22306 (= condMapEmpty!22315 (= mapRest!22306 ((as const (Array (_ BitVec 32) ValueCell!6506)) mapDefault!22315)))))

(declare-fun e!282894 () Bool)

(assert (=> mapNonEmpty!22306 (= tp!42945 (and e!282894 mapRes!22315))))

(declare-fun b!480827 () Bool)

(assert (=> b!480827 (= e!282894 tp_is_empty!13735)))

(declare-fun mapNonEmpty!22315 () Bool)

(declare-fun tp!42961 () Bool)

(declare-fun e!282893 () Bool)

(assert (=> mapNonEmpty!22315 (= mapRes!22315 (and tp!42961 e!282893))))

(declare-fun mapValue!22315 () ValueCell!6506)

(declare-fun mapKey!22315 () (_ BitVec 32))

(declare-fun mapRest!22315 () (Array (_ BitVec 32) ValueCell!6506))

(assert (=> mapNonEmpty!22315 (= mapRest!22306 (store mapRest!22315 mapKey!22315 mapValue!22315))))

(declare-fun b!480826 () Bool)

(assert (=> b!480826 (= e!282893 tp_is_empty!13735)))

(assert (= (and mapNonEmpty!22306 condMapEmpty!22315) mapIsEmpty!22315))

(assert (= (and mapNonEmpty!22306 (not condMapEmpty!22315)) mapNonEmpty!22315))

(assert (= (and mapNonEmpty!22315 ((_ is ValueCellFull!6506) mapValue!22315)) b!480826))

(assert (= (and mapNonEmpty!22306 ((_ is ValueCellFull!6506) mapDefault!22315)) b!480827))

(declare-fun m!461893 () Bool)

(assert (=> mapNonEmpty!22315 m!461893))

(declare-fun b_lambda!10783 () Bool)

(assert (= b_lambda!10781 (or (and start!43382 b_free!12223) b_lambda!10783)))

(check-sat (not b_next!12223) (not d!76557) (not b!480815) (not b!480794) (not bm!30901) (not b!480766) (not b!480816) (not bm!30897) tp_is_empty!13735 (not bm!30888) (not d!76539) (not b!480705) (not b!480760) (not b!480703) (not b!480767) (not b!480748) (not b!480797) (not bm!30889) (not b!480768) (not b!480749) (not b!480781) b_and!20959 (not b!480756) (not bm!30890) (not d!76553) (not b!480808) (not b!480754) (not mapNonEmpty!22315) (not b!480803) (not b!480819) (not b_lambda!10783) (not d!76537) (not b!480784) (not bm!30892) (not bm!30900) (not b!480783))
(check-sat b_and!20959 (not b_next!12223))
