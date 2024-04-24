; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4402 () Bool)

(assert start!4402)

(declare-fun b_free!1195 () Bool)

(declare-fun b_next!1195 () Bool)

(assert (=> start!4402 (= b_free!1195 (not b_next!1195))))

(declare-fun tp!5020 () Bool)

(declare-fun b_and!2005 () Bool)

(assert (=> start!4402 (= tp!5020 b_and!2005)))

(declare-fun b!33920 () Bool)

(declare-fun e!21530 () Bool)

(assert (=> b!33920 (= e!21530 (not false))))

(declare-fun lt!12506 () (_ BitVec 32))

(declare-datatypes ((array!2297 0))(
  ( (array!2298 (arr!1097 (Array (_ BitVec 32) (_ BitVec 64))) (size!1198 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2297)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2297 (_ BitVec 32)) Bool)

(assert (=> b!33920 (arrayForallSeekEntryOrOpenFound!0 lt!12506 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!768 0))(
  ( (Unit!769) )
))
(declare-fun lt!12509 () Unit!768)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!2297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!768)

(assert (=> b!33920 (= lt!12509 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!12506))))

(declare-datatypes ((SeekEntryResult!131 0))(
  ( (MissingZero!131 (index!2646 (_ BitVec 32))) (Found!131 (index!2647 (_ BitVec 32))) (Intermediate!131 (undefined!943 Bool) (index!2648 (_ BitVec 32)) (x!6867 (_ BitVec 32))) (Undefined!131) (MissingVacant!131 (index!2649 (_ BitVec 32))) )
))
(declare-fun lt!12510 () SeekEntryResult!131)

(get-info :version)

(assert (=> b!33920 (and ((_ is Found!131) lt!12510) (= (index!2647 lt!12510) lt!12506))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2297 (_ BitVec 32)) SeekEntryResult!131)

(assert (=> b!33920 (= lt!12510 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!12508 () Unit!768)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2297 (_ BitVec 32)) Unit!768)

(assert (=> b!33920 (= lt!12508 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12506 _keys!1833 mask!2294))))

(declare-datatypes ((V!1891 0))(
  ( (V!1892 (val!801 Int)) )
))
(declare-datatypes ((tuple2!1284 0))(
  ( (tuple2!1285 (_1!653 (_ BitVec 64)) (_2!653 V!1891)) )
))
(declare-datatypes ((List!877 0))(
  ( (Nil!874) (Cons!873 (h!1440 tuple2!1284) (t!3574 List!877)) )
))
(declare-datatypes ((ListLongMap!855 0))(
  ( (ListLongMap!856 (toList!443 List!877)) )
))
(declare-fun lt!12505 () ListLongMap!855)

(declare-fun contains!390 (ListLongMap!855 (_ BitVec 64)) Bool)

(assert (=> b!33920 (contains!390 lt!12505 (select (arr!1097 _keys!1833) lt!12506))))

(declare-datatypes ((ValueCell!575 0))(
  ( (ValueCellFull!575 (v!1895 V!1891)) (EmptyCell!575) )
))
(declare-datatypes ((array!2299 0))(
  ( (array!2300 (arr!1098 (Array (_ BitVec 32) ValueCell!575)) (size!1199 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2299)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1891)

(declare-fun minValue!1443 () V!1891)

(declare-fun lt!12507 () Unit!768)

(declare-fun lemmaValidKeyInArrayIsInListMap!65 (array!2297 array!2299 (_ BitVec 32) (_ BitVec 32) V!1891 V!1891 (_ BitVec 32) Int) Unit!768)

(assert (=> b!33920 (= lt!12507 (lemmaValidKeyInArrayIsInListMap!65 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12506 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2297 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33920 (= lt!12506 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33921 () Bool)

(declare-fun res!20584 () Bool)

(declare-fun e!21535 () Bool)

(assert (=> b!33921 (=> (not res!20584) (not e!21535))))

(declare-datatypes ((List!878 0))(
  ( (Nil!875) (Cons!874 (h!1441 (_ BitVec 64)) (t!3575 List!878)) )
))
(declare-fun arrayNoDuplicates!0 (array!2297 (_ BitVec 32) List!878) Bool)

(assert (=> b!33921 (= res!20584 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!875))))

(declare-fun b!33922 () Bool)

(declare-fun e!21534 () Bool)

(declare-fun e!21533 () Bool)

(declare-fun mapRes!1867 () Bool)

(assert (=> b!33922 (= e!21534 (and e!21533 mapRes!1867))))

(declare-fun condMapEmpty!1867 () Bool)

(declare-fun mapDefault!1867 () ValueCell!575)

(assert (=> b!33922 (= condMapEmpty!1867 (= (arr!1098 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!575)) mapDefault!1867)))))

(declare-fun mapIsEmpty!1867 () Bool)

(assert (=> mapIsEmpty!1867 mapRes!1867))

(declare-fun res!20588 () Bool)

(assert (=> start!4402 (=> (not res!20588) (not e!21535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4402 (= res!20588 (validMask!0 mask!2294))))

(assert (=> start!4402 e!21535))

(assert (=> start!4402 true))

(assert (=> start!4402 tp!5020))

(declare-fun array_inv!751 (array!2299) Bool)

(assert (=> start!4402 (and (array_inv!751 _values!1501) e!21534)))

(declare-fun array_inv!752 (array!2297) Bool)

(assert (=> start!4402 (array_inv!752 _keys!1833)))

(declare-fun tp_is_empty!1549 () Bool)

(assert (=> start!4402 tp_is_empty!1549))

(declare-fun b!33923 () Bool)

(assert (=> b!33923 (= e!21533 tp_is_empty!1549)))

(declare-fun mapNonEmpty!1867 () Bool)

(declare-fun tp!5019 () Bool)

(declare-fun e!21531 () Bool)

(assert (=> mapNonEmpty!1867 (= mapRes!1867 (and tp!5019 e!21531))))

(declare-fun mapKey!1867 () (_ BitVec 32))

(declare-fun mapRest!1867 () (Array (_ BitVec 32) ValueCell!575))

(declare-fun mapValue!1867 () ValueCell!575)

(assert (=> mapNonEmpty!1867 (= (arr!1098 _values!1501) (store mapRest!1867 mapKey!1867 mapValue!1867))))

(declare-fun b!33924 () Bool)

(declare-fun res!20587 () Bool)

(assert (=> b!33924 (=> (not res!20587) (not e!21530))))

(declare-fun arrayContainsKey!0 (array!2297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33924 (= res!20587 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33925 () Bool)

(declare-fun res!20583 () Bool)

(assert (=> b!33925 (=> (not res!20583) (not e!21535))))

(assert (=> b!33925 (= res!20583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33926 () Bool)

(assert (=> b!33926 (= e!21535 e!21530)))

(declare-fun res!20582 () Bool)

(assert (=> b!33926 (=> (not res!20582) (not e!21530))))

(assert (=> b!33926 (= res!20582 (not (contains!390 lt!12505 k0!1304)))))

(declare-fun getCurrentListMap!265 (array!2297 array!2299 (_ BitVec 32) (_ BitVec 32) V!1891 V!1891 (_ BitVec 32) Int) ListLongMap!855)

(assert (=> b!33926 (= lt!12505 (getCurrentListMap!265 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33927 () Bool)

(assert (=> b!33927 (= e!21531 tp_is_empty!1549)))

(declare-fun b!33928 () Bool)

(declare-fun res!20586 () Bool)

(assert (=> b!33928 (=> (not res!20586) (not e!21535))))

(assert (=> b!33928 (= res!20586 (and (= (size!1199 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1198 _keys!1833) (size!1199 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!33929 () Bool)

(declare-fun res!20585 () Bool)

(assert (=> b!33929 (=> (not res!20585) (not e!21535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33929 (= res!20585 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4402 res!20588) b!33928))

(assert (= (and b!33928 res!20586) b!33925))

(assert (= (and b!33925 res!20583) b!33921))

(assert (= (and b!33921 res!20584) b!33929))

(assert (= (and b!33929 res!20585) b!33926))

(assert (= (and b!33926 res!20582) b!33924))

(assert (= (and b!33924 res!20587) b!33920))

(assert (= (and b!33922 condMapEmpty!1867) mapIsEmpty!1867))

(assert (= (and b!33922 (not condMapEmpty!1867)) mapNonEmpty!1867))

(assert (= (and mapNonEmpty!1867 ((_ is ValueCellFull!575) mapValue!1867)) b!33927))

(assert (= (and b!33922 ((_ is ValueCellFull!575) mapDefault!1867)) b!33923))

(assert (= start!4402 b!33922))

(declare-fun m!27191 () Bool)

(assert (=> b!33929 m!27191))

(declare-fun m!27193 () Bool)

(assert (=> start!4402 m!27193))

(declare-fun m!27195 () Bool)

(assert (=> start!4402 m!27195))

(declare-fun m!27197 () Bool)

(assert (=> start!4402 m!27197))

(declare-fun m!27199 () Bool)

(assert (=> b!33924 m!27199))

(declare-fun m!27201 () Bool)

(assert (=> b!33921 m!27201))

(declare-fun m!27203 () Bool)

(assert (=> b!33920 m!27203))

(declare-fun m!27205 () Bool)

(assert (=> b!33920 m!27205))

(declare-fun m!27207 () Bool)

(assert (=> b!33920 m!27207))

(assert (=> b!33920 m!27205))

(declare-fun m!27209 () Bool)

(assert (=> b!33920 m!27209))

(declare-fun m!27211 () Bool)

(assert (=> b!33920 m!27211))

(declare-fun m!27213 () Bool)

(assert (=> b!33920 m!27213))

(declare-fun m!27215 () Bool)

(assert (=> b!33920 m!27215))

(declare-fun m!27217 () Bool)

(assert (=> b!33920 m!27217))

(declare-fun m!27219 () Bool)

(assert (=> b!33925 m!27219))

(declare-fun m!27221 () Bool)

(assert (=> b!33926 m!27221))

(declare-fun m!27223 () Bool)

(assert (=> b!33926 m!27223))

(declare-fun m!27225 () Bool)

(assert (=> mapNonEmpty!1867 m!27225))

(check-sat tp_is_empty!1549 (not b!33924) b_and!2005 (not b_next!1195) (not b!33920) (not start!4402) (not b!33921) (not b!33926) (not b!33925) (not b!33929) (not mapNonEmpty!1867))
(check-sat b_and!2005 (not b_next!1195))
(get-model)

(declare-fun d!5187 () Bool)

(declare-fun e!21577 () Bool)

(assert (=> d!5187 e!21577))

(declare-fun res!20633 () Bool)

(assert (=> d!5187 (=> res!20633 e!21577)))

(declare-fun lt!12556 () Bool)

(assert (=> d!5187 (= res!20633 (not lt!12556))))

(declare-fun lt!12557 () Bool)

(assert (=> d!5187 (= lt!12556 lt!12557)))

(declare-fun lt!12555 () Unit!768)

(declare-fun e!21576 () Unit!768)

(assert (=> d!5187 (= lt!12555 e!21576)))

(declare-fun c!3904 () Bool)

(assert (=> d!5187 (= c!3904 lt!12557)))

(declare-fun containsKey!34 (List!877 (_ BitVec 64)) Bool)

(assert (=> d!5187 (= lt!12557 (containsKey!34 (toList!443 lt!12505) k0!1304))))

(assert (=> d!5187 (= (contains!390 lt!12505 k0!1304) lt!12556)))

(declare-fun b!33996 () Bool)

(declare-fun lt!12558 () Unit!768)

(assert (=> b!33996 (= e!21576 lt!12558)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!31 (List!877 (_ BitVec 64)) Unit!768)

(assert (=> b!33996 (= lt!12558 (lemmaContainsKeyImpliesGetValueByKeyDefined!31 (toList!443 lt!12505) k0!1304))))

(declare-datatypes ((Option!76 0))(
  ( (Some!75 (v!1898 V!1891)) (None!74) )
))
(declare-fun isDefined!32 (Option!76) Bool)

(declare-fun getValueByKey!70 (List!877 (_ BitVec 64)) Option!76)

(assert (=> b!33996 (isDefined!32 (getValueByKey!70 (toList!443 lt!12505) k0!1304))))

(declare-fun b!33997 () Bool)

(declare-fun Unit!770 () Unit!768)

(assert (=> b!33997 (= e!21576 Unit!770)))

(declare-fun b!33998 () Bool)

(assert (=> b!33998 (= e!21577 (isDefined!32 (getValueByKey!70 (toList!443 lt!12505) k0!1304)))))

(assert (= (and d!5187 c!3904) b!33996))

(assert (= (and d!5187 (not c!3904)) b!33997))

(assert (= (and d!5187 (not res!20633)) b!33998))

(declare-fun m!27299 () Bool)

(assert (=> d!5187 m!27299))

(declare-fun m!27301 () Bool)

(assert (=> b!33996 m!27301))

(declare-fun m!27303 () Bool)

(assert (=> b!33996 m!27303))

(assert (=> b!33996 m!27303))

(declare-fun m!27305 () Bool)

(assert (=> b!33996 m!27305))

(assert (=> b!33998 m!27303))

(assert (=> b!33998 m!27303))

(assert (=> b!33998 m!27305))

(assert (=> b!33926 d!5187))

(declare-fun b!34041 () Bool)

(declare-fun e!21606 () Bool)

(declare-fun e!21616 () Bool)

(assert (=> b!34041 (= e!21606 e!21616)))

(declare-fun res!20657 () Bool)

(assert (=> b!34041 (=> (not res!20657) (not e!21616))))

(declare-fun lt!12605 () ListLongMap!855)

(assert (=> b!34041 (= res!20657 (contains!390 lt!12605 (select (arr!1097 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!34041 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1198 _keys!1833)))))

(declare-fun b!34042 () Bool)

(declare-fun e!21607 () Bool)

(declare-fun call!2726 () Bool)

(assert (=> b!34042 (= e!21607 (not call!2726))))

(declare-fun b!34043 () Bool)

(declare-fun e!21608 () Bool)

(declare-fun call!2728 () Bool)

(assert (=> b!34043 (= e!21608 (not call!2728))))

(declare-fun b!34045 () Bool)

(declare-fun e!21611 () Unit!768)

(declare-fun lt!12612 () Unit!768)

(assert (=> b!34045 (= e!21611 lt!12612)))

(declare-fun lt!12613 () ListLongMap!855)

(declare-fun getCurrentListMapNoExtraKeys!25 (array!2297 array!2299 (_ BitVec 32) (_ BitVec 32) V!1891 V!1891 (_ BitVec 32) Int) ListLongMap!855)

(assert (=> b!34045 (= lt!12613 (getCurrentListMapNoExtraKeys!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12616 () (_ BitVec 64))

(assert (=> b!34045 (= lt!12616 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12614 () (_ BitVec 64))

(assert (=> b!34045 (= lt!12614 (select (arr!1097 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12618 () Unit!768)

(declare-fun addStillContains!23 (ListLongMap!855 (_ BitVec 64) V!1891 (_ BitVec 64)) Unit!768)

(assert (=> b!34045 (= lt!12618 (addStillContains!23 lt!12613 lt!12616 zeroValue!1443 lt!12614))))

(declare-fun +!55 (ListLongMap!855 tuple2!1284) ListLongMap!855)

(assert (=> b!34045 (contains!390 (+!55 lt!12613 (tuple2!1285 lt!12616 zeroValue!1443)) lt!12614)))

(declare-fun lt!12610 () Unit!768)

(assert (=> b!34045 (= lt!12610 lt!12618)))

(declare-fun lt!12609 () ListLongMap!855)

(assert (=> b!34045 (= lt!12609 (getCurrentListMapNoExtraKeys!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12619 () (_ BitVec 64))

(assert (=> b!34045 (= lt!12619 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12607 () (_ BitVec 64))

(assert (=> b!34045 (= lt!12607 (select (arr!1097 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12620 () Unit!768)

(declare-fun addApplyDifferent!23 (ListLongMap!855 (_ BitVec 64) V!1891 (_ BitVec 64)) Unit!768)

(assert (=> b!34045 (= lt!12620 (addApplyDifferent!23 lt!12609 lt!12619 minValue!1443 lt!12607))))

(declare-fun apply!38 (ListLongMap!855 (_ BitVec 64)) V!1891)

(assert (=> b!34045 (= (apply!38 (+!55 lt!12609 (tuple2!1285 lt!12619 minValue!1443)) lt!12607) (apply!38 lt!12609 lt!12607))))

(declare-fun lt!12606 () Unit!768)

(assert (=> b!34045 (= lt!12606 lt!12620)))

(declare-fun lt!12604 () ListLongMap!855)

(assert (=> b!34045 (= lt!12604 (getCurrentListMapNoExtraKeys!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12623 () (_ BitVec 64))

(assert (=> b!34045 (= lt!12623 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12611 () (_ BitVec 64))

(assert (=> b!34045 (= lt!12611 (select (arr!1097 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12621 () Unit!768)

(assert (=> b!34045 (= lt!12621 (addApplyDifferent!23 lt!12604 lt!12623 zeroValue!1443 lt!12611))))

(assert (=> b!34045 (= (apply!38 (+!55 lt!12604 (tuple2!1285 lt!12623 zeroValue!1443)) lt!12611) (apply!38 lt!12604 lt!12611))))

(declare-fun lt!12624 () Unit!768)

(assert (=> b!34045 (= lt!12624 lt!12621)))

(declare-fun lt!12622 () ListLongMap!855)

(assert (=> b!34045 (= lt!12622 (getCurrentListMapNoExtraKeys!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12608 () (_ BitVec 64))

(assert (=> b!34045 (= lt!12608 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12603 () (_ BitVec 64))

(assert (=> b!34045 (= lt!12603 (select (arr!1097 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!34045 (= lt!12612 (addApplyDifferent!23 lt!12622 lt!12608 minValue!1443 lt!12603))))

(assert (=> b!34045 (= (apply!38 (+!55 lt!12622 (tuple2!1285 lt!12608 minValue!1443)) lt!12603) (apply!38 lt!12622 lt!12603))))

(declare-fun b!34046 () Bool)

(declare-fun Unit!771 () Unit!768)

(assert (=> b!34046 (= e!21611 Unit!771)))

(declare-fun b!34047 () Bool)

(declare-fun e!21610 () ListLongMap!855)

(declare-fun e!21614 () ListLongMap!855)

(assert (=> b!34047 (= e!21610 e!21614)))

(declare-fun c!3920 () Bool)

(assert (=> b!34047 (= c!3920 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!34048 () Bool)

(declare-fun call!2730 () ListLongMap!855)

(assert (=> b!34048 (= e!21614 call!2730)))

(declare-fun b!34049 () Bool)

(declare-fun e!21615 () ListLongMap!855)

(declare-fun call!2725 () ListLongMap!855)

(assert (=> b!34049 (= e!21615 call!2725)))

(declare-fun bm!2721 () Bool)

(declare-fun call!2729 () ListLongMap!855)

(declare-fun call!2724 () ListLongMap!855)

(assert (=> bm!2721 (= call!2729 call!2724)))

(declare-fun b!34050 () Bool)

(declare-fun e!21605 () Bool)

(assert (=> b!34050 (= e!21605 (= (apply!38 lt!12605 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun bm!2722 () Bool)

(assert (=> bm!2722 (= call!2725 call!2729)))

(declare-fun b!34051 () Bool)

(declare-fun e!21609 () Bool)

(assert (=> b!34051 (= e!21609 e!21607)))

(declare-fun c!3917 () Bool)

(assert (=> b!34051 (= c!3917 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2723 () Bool)

(declare-fun call!2727 () ListLongMap!855)

(assert (=> bm!2723 (= call!2730 call!2727)))

(declare-fun bm!2724 () Bool)

(assert (=> bm!2724 (= call!2724 (getCurrentListMapNoExtraKeys!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!34052 () Bool)

(declare-fun res!20652 () Bool)

(assert (=> b!34052 (=> (not res!20652) (not e!21609))))

(assert (=> b!34052 (= res!20652 e!21606)))

(declare-fun res!20656 () Bool)

(assert (=> b!34052 (=> res!20656 e!21606)))

(declare-fun e!21612 () Bool)

(assert (=> b!34052 (= res!20656 (not e!21612))))

(declare-fun res!20659 () Bool)

(assert (=> b!34052 (=> (not res!20659) (not e!21612))))

(assert (=> b!34052 (= res!20659 (bvslt #b00000000000000000000000000000000 (size!1198 _keys!1833)))))

(declare-fun b!34053 () Bool)

(assert (=> b!34053 (= e!21612 (validKeyInArray!0 (select (arr!1097 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!34054 () Bool)

(assert (=> b!34054 (= e!21607 e!21605)))

(declare-fun res!20655 () Bool)

(assert (=> b!34054 (= res!20655 call!2726)))

(assert (=> b!34054 (=> (not res!20655) (not e!21605))))

(declare-fun d!5189 () Bool)

(assert (=> d!5189 e!21609))

(declare-fun res!20658 () Bool)

(assert (=> d!5189 (=> (not res!20658) (not e!21609))))

(assert (=> d!5189 (= res!20658 (or (bvsge #b00000000000000000000000000000000 (size!1198 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1198 _keys!1833)))))))

(declare-fun lt!12615 () ListLongMap!855)

(assert (=> d!5189 (= lt!12605 lt!12615)))

(declare-fun lt!12617 () Unit!768)

(assert (=> d!5189 (= lt!12617 e!21611)))

(declare-fun c!3921 () Bool)

(declare-fun e!21613 () Bool)

(assert (=> d!5189 (= c!3921 e!21613)))

(declare-fun res!20660 () Bool)

(assert (=> d!5189 (=> (not res!20660) (not e!21613))))

(assert (=> d!5189 (= res!20660 (bvslt #b00000000000000000000000000000000 (size!1198 _keys!1833)))))

(assert (=> d!5189 (= lt!12615 e!21610)))

(declare-fun c!3919 () Bool)

(assert (=> d!5189 (= c!3919 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5189 (validMask!0 mask!2294)))

(assert (=> d!5189 (= (getCurrentListMap!265 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!12605)))

(declare-fun b!34044 () Bool)

(declare-fun c!3918 () Bool)

(assert (=> b!34044 (= c!3918 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!34044 (= e!21614 e!21615)))

(declare-fun b!34055 () Bool)

(declare-fun e!21604 () Bool)

(assert (=> b!34055 (= e!21604 (= (apply!38 lt!12605 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun bm!2725 () Bool)

(assert (=> bm!2725 (= call!2727 (+!55 (ite c!3919 call!2724 (ite c!3920 call!2729 call!2725)) (ite (or c!3919 c!3920) (tuple2!1285 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1285 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!34056 () Bool)

(declare-fun res!20654 () Bool)

(assert (=> b!34056 (=> (not res!20654) (not e!21609))))

(assert (=> b!34056 (= res!20654 e!21608)))

(declare-fun c!3922 () Bool)

(assert (=> b!34056 (= c!3922 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!34057 () Bool)

(assert (=> b!34057 (= e!21610 (+!55 call!2727 (tuple2!1285 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!34058 () Bool)

(assert (=> b!34058 (= e!21613 (validKeyInArray!0 (select (arr!1097 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!34059 () Bool)

(assert (=> b!34059 (= e!21608 e!21604)))

(declare-fun res!20653 () Bool)

(assert (=> b!34059 (= res!20653 call!2728)))

(assert (=> b!34059 (=> (not res!20653) (not e!21604))))

(declare-fun b!34060 () Bool)

(assert (=> b!34060 (= e!21615 call!2730)))

(declare-fun bm!2726 () Bool)

(assert (=> bm!2726 (= call!2726 (contains!390 lt!12605 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!34061 () Bool)

(declare-fun get!579 (ValueCell!575 V!1891) V!1891)

(declare-fun dynLambda!151 (Int (_ BitVec 64)) V!1891)

(assert (=> b!34061 (= e!21616 (= (apply!38 lt!12605 (select (arr!1097 _keys!1833) #b00000000000000000000000000000000)) (get!579 (select (arr!1098 _values!1501) #b00000000000000000000000000000000) (dynLambda!151 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!34061 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1199 _values!1501)))))

(assert (=> b!34061 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1198 _keys!1833)))))

(declare-fun bm!2727 () Bool)

(assert (=> bm!2727 (= call!2728 (contains!390 lt!12605 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!5189 c!3919) b!34057))

(assert (= (and d!5189 (not c!3919)) b!34047))

(assert (= (and b!34047 c!3920) b!34048))

(assert (= (and b!34047 (not c!3920)) b!34044))

(assert (= (and b!34044 c!3918) b!34060))

(assert (= (and b!34044 (not c!3918)) b!34049))

(assert (= (or b!34060 b!34049) bm!2722))

(assert (= (or b!34048 bm!2722) bm!2721))

(assert (= (or b!34048 b!34060) bm!2723))

(assert (= (or b!34057 bm!2721) bm!2724))

(assert (= (or b!34057 bm!2723) bm!2725))

(assert (= (and d!5189 res!20660) b!34058))

(assert (= (and d!5189 c!3921) b!34045))

(assert (= (and d!5189 (not c!3921)) b!34046))

(assert (= (and d!5189 res!20658) b!34052))

(assert (= (and b!34052 res!20659) b!34053))

(assert (= (and b!34052 (not res!20656)) b!34041))

(assert (= (and b!34041 res!20657) b!34061))

(assert (= (and b!34052 res!20652) b!34056))

(assert (= (and b!34056 c!3922) b!34059))

(assert (= (and b!34056 (not c!3922)) b!34043))

(assert (= (and b!34059 res!20653) b!34055))

(assert (= (or b!34059 b!34043) bm!2727))

(assert (= (and b!34056 res!20654) b!34051))

(assert (= (and b!34051 c!3917) b!34054))

(assert (= (and b!34051 (not c!3917)) b!34042))

(assert (= (and b!34054 res!20655) b!34050))

(assert (= (or b!34054 b!34042) bm!2726))

(declare-fun b_lambda!1699 () Bool)

(assert (=> (not b_lambda!1699) (not b!34061)))

(declare-fun t!3577 () Bool)

(declare-fun tb!685 () Bool)

(assert (=> (and start!4402 (= defaultEntry!1504 defaultEntry!1504) t!3577) tb!685))

(declare-fun result!1177 () Bool)

(assert (=> tb!685 (= result!1177 tp_is_empty!1549)))

(assert (=> b!34061 t!3577))

(declare-fun b_and!2011 () Bool)

(assert (= b_and!2005 (and (=> t!3577 result!1177) b_and!2011)))

(declare-fun m!27307 () Bool)

(assert (=> bm!2726 m!27307))

(declare-fun m!27309 () Bool)

(assert (=> b!34057 m!27309))

(declare-fun m!27311 () Bool)

(assert (=> bm!2725 m!27311))

(declare-fun m!27313 () Bool)

(assert (=> b!34041 m!27313))

(assert (=> b!34041 m!27313))

(declare-fun m!27315 () Bool)

(assert (=> b!34041 m!27315))

(assert (=> d!5189 m!27193))

(declare-fun m!27317 () Bool)

(assert (=> b!34061 m!27317))

(assert (=> b!34061 m!27313))

(declare-fun m!27319 () Bool)

(assert (=> b!34061 m!27319))

(assert (=> b!34061 m!27317))

(declare-fun m!27321 () Bool)

(assert (=> b!34061 m!27321))

(declare-fun m!27323 () Bool)

(assert (=> b!34061 m!27323))

(assert (=> b!34061 m!27313))

(assert (=> b!34061 m!27321))

(declare-fun m!27325 () Bool)

(assert (=> bm!2727 m!27325))

(assert (=> b!34053 m!27313))

(assert (=> b!34053 m!27313))

(declare-fun m!27327 () Bool)

(assert (=> b!34053 m!27327))

(assert (=> b!34058 m!27313))

(assert (=> b!34058 m!27313))

(assert (=> b!34058 m!27327))

(declare-fun m!27329 () Bool)

(assert (=> b!34055 m!27329))

(declare-fun m!27331 () Bool)

(assert (=> bm!2724 m!27331))

(declare-fun m!27333 () Bool)

(assert (=> b!34050 m!27333))

(declare-fun m!27335 () Bool)

(assert (=> b!34045 m!27335))

(declare-fun m!27337 () Bool)

(assert (=> b!34045 m!27337))

(declare-fun m!27339 () Bool)

(assert (=> b!34045 m!27339))

(declare-fun m!27341 () Bool)

(assert (=> b!34045 m!27341))

(declare-fun m!27343 () Bool)

(assert (=> b!34045 m!27343))

(declare-fun m!27345 () Bool)

(assert (=> b!34045 m!27345))

(assert (=> b!34045 m!27335))

(declare-fun m!27347 () Bool)

(assert (=> b!34045 m!27347))

(assert (=> b!34045 m!27331))

(assert (=> b!34045 m!27313))

(declare-fun m!27349 () Bool)

(assert (=> b!34045 m!27349))

(declare-fun m!27351 () Bool)

(assert (=> b!34045 m!27351))

(declare-fun m!27353 () Bool)

(assert (=> b!34045 m!27353))

(declare-fun m!27355 () Bool)

(assert (=> b!34045 m!27355))

(declare-fun m!27357 () Bool)

(assert (=> b!34045 m!27357))

(declare-fun m!27359 () Bool)

(assert (=> b!34045 m!27359))

(assert (=> b!34045 m!27341))

(declare-fun m!27361 () Bool)

(assert (=> b!34045 m!27361))

(assert (=> b!34045 m!27359))

(declare-fun m!27363 () Bool)

(assert (=> b!34045 m!27363))

(assert (=> b!34045 m!27349))

(assert (=> b!33926 d!5189))

(declare-fun d!5191 () Bool)

(declare-fun res!20665 () Bool)

(declare-fun e!21621 () Bool)

(assert (=> d!5191 (=> res!20665 e!21621)))

(assert (=> d!5191 (= res!20665 (= (select (arr!1097 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5191 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!21621)))

(declare-fun b!34068 () Bool)

(declare-fun e!21622 () Bool)

(assert (=> b!34068 (= e!21621 e!21622)))

(declare-fun res!20666 () Bool)

(assert (=> b!34068 (=> (not res!20666) (not e!21622))))

(assert (=> b!34068 (= res!20666 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1198 _keys!1833)))))

(declare-fun b!34069 () Bool)

(assert (=> b!34069 (= e!21622 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5191 (not res!20665)) b!34068))

(assert (= (and b!34068 res!20666) b!34069))

(assert (=> d!5191 m!27313))

(declare-fun m!27365 () Bool)

(assert (=> b!34069 m!27365))

(assert (=> b!33924 d!5191))

(declare-fun b!34080 () Bool)

(declare-fun e!21633 () Bool)

(declare-fun call!2733 () Bool)

(assert (=> b!34080 (= e!21633 call!2733)))

(declare-fun d!5193 () Bool)

(declare-fun res!20675 () Bool)

(declare-fun e!21631 () Bool)

(assert (=> d!5193 (=> res!20675 e!21631)))

(assert (=> d!5193 (= res!20675 (bvsge #b00000000000000000000000000000000 (size!1198 _keys!1833)))))

(assert (=> d!5193 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!875) e!21631)))

(declare-fun bm!2730 () Bool)

(declare-fun c!3925 () Bool)

(assert (=> bm!2730 (= call!2733 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3925 (Cons!874 (select (arr!1097 _keys!1833) #b00000000000000000000000000000000) Nil!875) Nil!875)))))

(declare-fun b!34081 () Bool)

(assert (=> b!34081 (= e!21633 call!2733)))

(declare-fun b!34082 () Bool)

(declare-fun e!21632 () Bool)

(assert (=> b!34082 (= e!21632 e!21633)))

(assert (=> b!34082 (= c!3925 (validKeyInArray!0 (select (arr!1097 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!34083 () Bool)

(declare-fun e!21634 () Bool)

(declare-fun contains!391 (List!878 (_ BitVec 64)) Bool)

(assert (=> b!34083 (= e!21634 (contains!391 Nil!875 (select (arr!1097 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!34084 () Bool)

(assert (=> b!34084 (= e!21631 e!21632)))

(declare-fun res!20673 () Bool)

(assert (=> b!34084 (=> (not res!20673) (not e!21632))))

(assert (=> b!34084 (= res!20673 (not e!21634))))

(declare-fun res!20674 () Bool)

(assert (=> b!34084 (=> (not res!20674) (not e!21634))))

(assert (=> b!34084 (= res!20674 (validKeyInArray!0 (select (arr!1097 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5193 (not res!20675)) b!34084))

(assert (= (and b!34084 res!20674) b!34083))

(assert (= (and b!34084 res!20673) b!34082))

(assert (= (and b!34082 c!3925) b!34081))

(assert (= (and b!34082 (not c!3925)) b!34080))

(assert (= (or b!34081 b!34080) bm!2730))

(assert (=> bm!2730 m!27313))

(declare-fun m!27367 () Bool)

(assert (=> bm!2730 m!27367))

(assert (=> b!34082 m!27313))

(assert (=> b!34082 m!27313))

(assert (=> b!34082 m!27327))

(assert (=> b!34083 m!27313))

(assert (=> b!34083 m!27313))

(declare-fun m!27369 () Bool)

(assert (=> b!34083 m!27369))

(assert (=> b!34084 m!27313))

(assert (=> b!34084 m!27313))

(assert (=> b!34084 m!27327))

(assert (=> b!33921 d!5193))

(declare-fun b!34093 () Bool)

(declare-fun e!21641 () Bool)

(declare-fun call!2736 () Bool)

(assert (=> b!34093 (= e!21641 call!2736)))

(declare-fun b!34094 () Bool)

(declare-fun e!21642 () Bool)

(assert (=> b!34094 (= e!21642 e!21641)))

(declare-fun lt!12632 () (_ BitVec 64))

(assert (=> b!34094 (= lt!12632 (select (arr!1097 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12631 () Unit!768)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2297 (_ BitVec 64) (_ BitVec 32)) Unit!768)

(assert (=> b!34094 (= lt!12631 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12632 #b00000000000000000000000000000000))))

(assert (=> b!34094 (arrayContainsKey!0 _keys!1833 lt!12632 #b00000000000000000000000000000000)))

(declare-fun lt!12633 () Unit!768)

(assert (=> b!34094 (= lt!12633 lt!12631)))

(declare-fun res!20680 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2297 (_ BitVec 32)) SeekEntryResult!131)

(assert (=> b!34094 (= res!20680 (= (seekEntryOrOpen!0 (select (arr!1097 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!131 #b00000000000000000000000000000000)))))

(assert (=> b!34094 (=> (not res!20680) (not e!21641))))

(declare-fun b!34095 () Bool)

(assert (=> b!34095 (= e!21642 call!2736)))

(declare-fun bm!2733 () Bool)

(assert (=> bm!2733 (= call!2736 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun d!5195 () Bool)

(declare-fun res!20681 () Bool)

(declare-fun e!21643 () Bool)

(assert (=> d!5195 (=> res!20681 e!21643)))

(assert (=> d!5195 (= res!20681 (bvsge #b00000000000000000000000000000000 (size!1198 _keys!1833)))))

(assert (=> d!5195 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!21643)))

(declare-fun b!34096 () Bool)

(assert (=> b!34096 (= e!21643 e!21642)))

(declare-fun c!3928 () Bool)

(assert (=> b!34096 (= c!3928 (validKeyInArray!0 (select (arr!1097 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5195 (not res!20681)) b!34096))

(assert (= (and b!34096 c!3928) b!34094))

(assert (= (and b!34096 (not c!3928)) b!34095))

(assert (= (and b!34094 res!20680) b!34093))

(assert (= (or b!34093 b!34095) bm!2733))

(assert (=> b!34094 m!27313))

(declare-fun m!27371 () Bool)

(assert (=> b!34094 m!27371))

(declare-fun m!27373 () Bool)

(assert (=> b!34094 m!27373))

(assert (=> b!34094 m!27313))

(declare-fun m!27375 () Bool)

(assert (=> b!34094 m!27375))

(declare-fun m!27377 () Bool)

(assert (=> bm!2733 m!27377))

(assert (=> b!34096 m!27313))

(assert (=> b!34096 m!27313))

(assert (=> b!34096 m!27327))

(assert (=> b!33925 d!5195))

(declare-fun d!5197 () Bool)

(declare-fun lt!12636 () (_ BitVec 32))

(assert (=> d!5197 (and (or (bvslt lt!12636 #b00000000000000000000000000000000) (bvsge lt!12636 (size!1198 _keys!1833)) (and (bvsge lt!12636 #b00000000000000000000000000000000) (bvslt lt!12636 (size!1198 _keys!1833)))) (bvsge lt!12636 #b00000000000000000000000000000000) (bvslt lt!12636 (size!1198 _keys!1833)) (= (select (arr!1097 _keys!1833) lt!12636) k0!1304))))

(declare-fun e!21646 () (_ BitVec 32))

(assert (=> d!5197 (= lt!12636 e!21646)))

(declare-fun c!3931 () Bool)

(assert (=> d!5197 (= c!3931 (= (select (arr!1097 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5197 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1198 _keys!1833)) (bvslt (size!1198 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5197 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!12636)))

(declare-fun b!34101 () Bool)

(assert (=> b!34101 (= e!21646 #b00000000000000000000000000000000)))

(declare-fun b!34102 () Bool)

(assert (=> b!34102 (= e!21646 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5197 c!3931) b!34101))

(assert (= (and d!5197 (not c!3931)) b!34102))

(declare-fun m!27379 () Bool)

(assert (=> d!5197 m!27379))

(assert (=> d!5197 m!27313))

(declare-fun m!27381 () Bool)

(assert (=> b!34102 m!27381))

(assert (=> b!33920 d!5197))

(declare-fun d!5199 () Bool)

(declare-fun e!21649 () Bool)

(assert (=> d!5199 e!21649))

(declare-fun res!20684 () Bool)

(assert (=> d!5199 (=> (not res!20684) (not e!21649))))

(assert (=> d!5199 (= res!20684 (and (bvsge lt!12506 #b00000000000000000000000000000000) (bvslt lt!12506 (size!1198 _keys!1833))))))

(declare-fun lt!12639 () Unit!768)

(declare-fun choose!220 (array!2297 array!2299 (_ BitVec 32) (_ BitVec 32) V!1891 V!1891 (_ BitVec 32) Int) Unit!768)

(assert (=> d!5199 (= lt!12639 (choose!220 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12506 defaultEntry!1504))))

(assert (=> d!5199 (validMask!0 mask!2294)))

(assert (=> d!5199 (= (lemmaValidKeyInArrayIsInListMap!65 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12506 defaultEntry!1504) lt!12639)))

(declare-fun b!34105 () Bool)

(assert (=> b!34105 (= e!21649 (contains!390 (getCurrentListMap!265 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) (select (arr!1097 _keys!1833) lt!12506)))))

(assert (= (and d!5199 res!20684) b!34105))

(declare-fun m!27383 () Bool)

(assert (=> d!5199 m!27383))

(assert (=> d!5199 m!27193))

(assert (=> b!34105 m!27223))

(assert (=> b!34105 m!27205))

(assert (=> b!34105 m!27223))

(assert (=> b!34105 m!27205))

(declare-fun m!27385 () Bool)

(assert (=> b!34105 m!27385))

(assert (=> b!33920 d!5199))

(declare-fun b!34106 () Bool)

(declare-fun e!21650 () Bool)

(declare-fun call!2737 () Bool)

(assert (=> b!34106 (= e!21650 call!2737)))

(declare-fun b!34107 () Bool)

(declare-fun e!21651 () Bool)

(assert (=> b!34107 (= e!21651 e!21650)))

(declare-fun lt!12641 () (_ BitVec 64))

(assert (=> b!34107 (= lt!12641 (select (arr!1097 _keys!1833) lt!12506))))

(declare-fun lt!12640 () Unit!768)

(assert (=> b!34107 (= lt!12640 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12641 lt!12506))))

(assert (=> b!34107 (arrayContainsKey!0 _keys!1833 lt!12641 #b00000000000000000000000000000000)))

(declare-fun lt!12642 () Unit!768)

(assert (=> b!34107 (= lt!12642 lt!12640)))

(declare-fun res!20685 () Bool)

(assert (=> b!34107 (= res!20685 (= (seekEntryOrOpen!0 (select (arr!1097 _keys!1833) lt!12506) _keys!1833 mask!2294) (Found!131 lt!12506)))))

(assert (=> b!34107 (=> (not res!20685) (not e!21650))))

(declare-fun b!34108 () Bool)

(assert (=> b!34108 (= e!21651 call!2737)))

(declare-fun bm!2734 () Bool)

(assert (=> bm!2734 (= call!2737 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!12506 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun d!5201 () Bool)

(declare-fun res!20686 () Bool)

(declare-fun e!21652 () Bool)

(assert (=> d!5201 (=> res!20686 e!21652)))

(assert (=> d!5201 (= res!20686 (bvsge lt!12506 (size!1198 _keys!1833)))))

(assert (=> d!5201 (= (arrayForallSeekEntryOrOpenFound!0 lt!12506 _keys!1833 mask!2294) e!21652)))

(declare-fun b!34109 () Bool)

(assert (=> b!34109 (= e!21652 e!21651)))

(declare-fun c!3932 () Bool)

(assert (=> b!34109 (= c!3932 (validKeyInArray!0 (select (arr!1097 _keys!1833) lt!12506)))))

(assert (= (and d!5201 (not res!20686)) b!34109))

(assert (= (and b!34109 c!3932) b!34107))

(assert (= (and b!34109 (not c!3932)) b!34108))

(assert (= (and b!34107 res!20685) b!34106))

(assert (= (or b!34106 b!34108) bm!2734))

(assert (=> b!34107 m!27205))

(declare-fun m!27387 () Bool)

(assert (=> b!34107 m!27387))

(declare-fun m!27389 () Bool)

(assert (=> b!34107 m!27389))

(assert (=> b!34107 m!27205))

(declare-fun m!27391 () Bool)

(assert (=> b!34107 m!27391))

(declare-fun m!27393 () Bool)

(assert (=> bm!2734 m!27393))

(assert (=> b!34109 m!27205))

(assert (=> b!34109 m!27205))

(declare-fun m!27395 () Bool)

(assert (=> b!34109 m!27395))

(assert (=> b!33920 d!5201))

(declare-fun d!5203 () Bool)

(declare-fun lt!12648 () SeekEntryResult!131)

(assert (=> d!5203 (and ((_ is Found!131) lt!12648) (= (index!2647 lt!12648) lt!12506))))

(assert (=> d!5203 (= lt!12648 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!12647 () Unit!768)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!2297 (_ BitVec 32)) Unit!768)

(assert (=> d!5203 (= lt!12647 (choose!0 k0!1304 lt!12506 _keys!1833 mask!2294))))

(assert (=> d!5203 (validMask!0 mask!2294)))

(assert (=> d!5203 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12506 _keys!1833 mask!2294) lt!12647)))

(declare-fun bs!1315 () Bool)

(assert (= bs!1315 d!5203))

(assert (=> bs!1315 m!27211))

(declare-fun m!27397 () Bool)

(assert (=> bs!1315 m!27397))

(assert (=> bs!1315 m!27193))

(assert (=> b!33920 d!5203))

(declare-fun d!5205 () Bool)

(assert (=> d!5205 (arrayForallSeekEntryOrOpenFound!0 lt!12506 _keys!1833 mask!2294)))

(declare-fun lt!12651 () Unit!768)

(declare-fun choose!38 (array!2297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!768)

(assert (=> d!5205 (= lt!12651 (choose!38 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!12506))))

(assert (=> d!5205 (validMask!0 mask!2294)))

(assert (=> d!5205 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!12506) lt!12651)))

(declare-fun bs!1316 () Bool)

(assert (= bs!1316 d!5205))

(assert (=> bs!1316 m!27209))

(declare-fun m!27399 () Bool)

(assert (=> bs!1316 m!27399))

(assert (=> bs!1316 m!27193))

(assert (=> b!33920 d!5205))

(declare-fun d!5207 () Bool)

(declare-fun lt!12663 () SeekEntryResult!131)

(assert (=> d!5207 (and (or ((_ is MissingVacant!131) lt!12663) (not ((_ is Found!131) lt!12663)) (and (bvsge (index!2647 lt!12663) #b00000000000000000000000000000000) (bvslt (index!2647 lt!12663) (size!1198 _keys!1833)))) (not ((_ is MissingVacant!131) lt!12663)) (or (not ((_ is Found!131) lt!12663)) (= (select (arr!1097 _keys!1833) (index!2647 lt!12663)) k0!1304)))))

(declare-fun e!21661 () SeekEntryResult!131)

(assert (=> d!5207 (= lt!12663 e!21661)))

(declare-fun c!3941 () Bool)

(declare-fun lt!12661 () SeekEntryResult!131)

(assert (=> d!5207 (= c!3941 (and ((_ is Intermediate!131) lt!12661) (undefined!943 lt!12661)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2297 (_ BitVec 32)) SeekEntryResult!131)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5207 (= lt!12661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5207 (validMask!0 mask!2294)))

(assert (=> d!5207 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!12663)))

(declare-fun b!34122 () Bool)

(declare-fun c!3940 () Bool)

(declare-fun lt!12662 () (_ BitVec 64))

(assert (=> b!34122 (= c!3940 (= lt!12662 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21659 () SeekEntryResult!131)

(declare-fun e!21660 () SeekEntryResult!131)

(assert (=> b!34122 (= e!21659 e!21660)))

(declare-fun b!34123 () Bool)

(assert (=> b!34123 (= e!21661 e!21659)))

(assert (=> b!34123 (= lt!12662 (select (arr!1097 _keys!1833) (index!2648 lt!12661)))))

(declare-fun c!3939 () Bool)

(assert (=> b!34123 (= c!3939 (= lt!12662 k0!1304))))

(declare-fun b!34124 () Bool)

(assert (=> b!34124 (= e!21659 (Found!131 (index!2648 lt!12661)))))

(declare-fun b!34125 () Bool)

(declare-fun lt!12660 () SeekEntryResult!131)

(assert (=> b!34125 (= e!21660 (ite ((_ is MissingVacant!131) lt!12660) (MissingZero!131 (index!2649 lt!12660)) lt!12660))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2297 (_ BitVec 32)) SeekEntryResult!131)

(assert (=> b!34125 (= lt!12660 (seekKeyOrZeroReturnVacant!0 (x!6867 lt!12661) (index!2648 lt!12661) (index!2648 lt!12661) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34126 () Bool)

(assert (=> b!34126 (= e!21660 (MissingZero!131 (index!2648 lt!12661)))))

(declare-fun b!34127 () Bool)

(assert (=> b!34127 (= e!21661 Undefined!131)))

(assert (= (and d!5207 c!3941) b!34127))

(assert (= (and d!5207 (not c!3941)) b!34123))

(assert (= (and b!34123 c!3939) b!34124))

(assert (= (and b!34123 (not c!3939)) b!34122))

(assert (= (and b!34122 c!3940) b!34126))

(assert (= (and b!34122 (not c!3940)) b!34125))

(declare-fun m!27401 () Bool)

(assert (=> d!5207 m!27401))

(declare-fun m!27403 () Bool)

(assert (=> d!5207 m!27403))

(assert (=> d!5207 m!27403))

(declare-fun m!27405 () Bool)

(assert (=> d!5207 m!27405))

(assert (=> d!5207 m!27193))

(declare-fun m!27407 () Bool)

(assert (=> b!34123 m!27407))

(declare-fun m!27409 () Bool)

(assert (=> b!34125 m!27409))

(assert (=> b!33920 d!5207))

(declare-fun d!5209 () Bool)

(declare-fun e!21663 () Bool)

(assert (=> d!5209 e!21663))

(declare-fun res!20687 () Bool)

(assert (=> d!5209 (=> res!20687 e!21663)))

(declare-fun lt!12665 () Bool)

(assert (=> d!5209 (= res!20687 (not lt!12665))))

(declare-fun lt!12666 () Bool)

(assert (=> d!5209 (= lt!12665 lt!12666)))

(declare-fun lt!12664 () Unit!768)

(declare-fun e!21662 () Unit!768)

(assert (=> d!5209 (= lt!12664 e!21662)))

(declare-fun c!3942 () Bool)

(assert (=> d!5209 (= c!3942 lt!12666)))

(assert (=> d!5209 (= lt!12666 (containsKey!34 (toList!443 lt!12505) (select (arr!1097 _keys!1833) lt!12506)))))

(assert (=> d!5209 (= (contains!390 lt!12505 (select (arr!1097 _keys!1833) lt!12506)) lt!12665)))

(declare-fun b!34128 () Bool)

(declare-fun lt!12667 () Unit!768)

(assert (=> b!34128 (= e!21662 lt!12667)))

(assert (=> b!34128 (= lt!12667 (lemmaContainsKeyImpliesGetValueByKeyDefined!31 (toList!443 lt!12505) (select (arr!1097 _keys!1833) lt!12506)))))

(assert (=> b!34128 (isDefined!32 (getValueByKey!70 (toList!443 lt!12505) (select (arr!1097 _keys!1833) lt!12506)))))

(declare-fun b!34129 () Bool)

(declare-fun Unit!772 () Unit!768)

(assert (=> b!34129 (= e!21662 Unit!772)))

(declare-fun b!34130 () Bool)

(assert (=> b!34130 (= e!21663 (isDefined!32 (getValueByKey!70 (toList!443 lt!12505) (select (arr!1097 _keys!1833) lt!12506))))))

(assert (= (and d!5209 c!3942) b!34128))

(assert (= (and d!5209 (not c!3942)) b!34129))

(assert (= (and d!5209 (not res!20687)) b!34130))

(assert (=> d!5209 m!27205))

(declare-fun m!27411 () Bool)

(assert (=> d!5209 m!27411))

(assert (=> b!34128 m!27205))

(declare-fun m!27413 () Bool)

(assert (=> b!34128 m!27413))

(assert (=> b!34128 m!27205))

(declare-fun m!27415 () Bool)

(assert (=> b!34128 m!27415))

(assert (=> b!34128 m!27415))

(declare-fun m!27417 () Bool)

(assert (=> b!34128 m!27417))

(assert (=> b!34130 m!27205))

(assert (=> b!34130 m!27415))

(assert (=> b!34130 m!27415))

(assert (=> b!34130 m!27417))

(assert (=> b!33920 d!5209))

(declare-fun d!5211 () Bool)

(assert (=> d!5211 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33929 d!5211))

(declare-fun d!5213 () Bool)

(assert (=> d!5213 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4402 d!5213))

(declare-fun d!5215 () Bool)

(assert (=> d!5215 (= (array_inv!751 _values!1501) (bvsge (size!1199 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4402 d!5215))

(declare-fun d!5217 () Bool)

(assert (=> d!5217 (= (array_inv!752 _keys!1833) (bvsge (size!1198 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4402 d!5217))

(declare-fun mapNonEmpty!1876 () Bool)

(declare-fun mapRes!1876 () Bool)

(declare-fun tp!5035 () Bool)

(declare-fun e!21669 () Bool)

(assert (=> mapNonEmpty!1876 (= mapRes!1876 (and tp!5035 e!21669))))

(declare-fun mapValue!1876 () ValueCell!575)

(declare-fun mapKey!1876 () (_ BitVec 32))

(declare-fun mapRest!1876 () (Array (_ BitVec 32) ValueCell!575))

(assert (=> mapNonEmpty!1876 (= mapRest!1867 (store mapRest!1876 mapKey!1876 mapValue!1876))))

(declare-fun mapIsEmpty!1876 () Bool)

(assert (=> mapIsEmpty!1876 mapRes!1876))

(declare-fun b!34138 () Bool)

(declare-fun e!21668 () Bool)

(assert (=> b!34138 (= e!21668 tp_is_empty!1549)))

(declare-fun condMapEmpty!1876 () Bool)

(declare-fun mapDefault!1876 () ValueCell!575)

(assert (=> mapNonEmpty!1867 (= condMapEmpty!1876 (= mapRest!1867 ((as const (Array (_ BitVec 32) ValueCell!575)) mapDefault!1876)))))

(assert (=> mapNonEmpty!1867 (= tp!5019 (and e!21668 mapRes!1876))))

(declare-fun b!34137 () Bool)

(assert (=> b!34137 (= e!21669 tp_is_empty!1549)))

(assert (= (and mapNonEmpty!1867 condMapEmpty!1876) mapIsEmpty!1876))

(assert (= (and mapNonEmpty!1867 (not condMapEmpty!1876)) mapNonEmpty!1876))

(assert (= (and mapNonEmpty!1876 ((_ is ValueCellFull!575) mapValue!1876)) b!34137))

(assert (= (and mapNonEmpty!1867 ((_ is ValueCellFull!575) mapDefault!1876)) b!34138))

(declare-fun m!27419 () Bool)

(assert (=> mapNonEmpty!1876 m!27419))

(declare-fun b_lambda!1701 () Bool)

(assert (= b_lambda!1699 (or (and start!4402 b_free!1195) b_lambda!1701)))

(check-sat (not b!34082) (not b!34107) (not b!34096) (not b!34045) (not bm!2734) (not b_lambda!1701) (not b!34125) (not b!33996) (not b!34109) (not b!33998) tp_is_empty!1549 (not b!34069) (not bm!2725) (not b!34094) (not d!5203) (not b!34041) (not b!34128) (not b!34102) (not b!34130) (not b!34055) (not mapNonEmpty!1876) (not d!5199) (not bm!2726) (not d!5207) (not bm!2727) (not b!34053) (not b!34061) (not d!5209) (not d!5205) (not bm!2733) (not b!34105) (not b_next!1195) (not bm!2730) (not bm!2724) (not b!34057) (not b!34050) b_and!2011 (not d!5187) (not d!5189) (not b!34058) (not b!34083) (not b!34084))
(check-sat b_and!2011 (not b_next!1195))
