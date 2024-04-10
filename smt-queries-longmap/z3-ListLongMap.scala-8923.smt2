; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108208 () Bool)

(assert start!108208)

(declare-fun b_free!27903 () Bool)

(declare-fun b_next!27903 () Bool)

(assert (=> start!108208 (= b_free!27903 (not b_next!27903))))

(declare-fun tp!98666 () Bool)

(declare-fun b_and!45961 () Bool)

(assert (=> start!108208 (= tp!98666 b_and!45961)))

(declare-fun res!849033 () Bool)

(declare-fun e!729786 () Bool)

(assert (=> start!108208 (=> (not res!849033) (not e!729786))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108208 (= res!849033 (validMask!0 mask!1805))))

(assert (=> start!108208 e!729786))

(assert (=> start!108208 true))

(assert (=> start!108208 tp!98666))

(declare-fun tp_is_empty!33453 () Bool)

(assert (=> start!108208 tp_is_empty!33453))

(declare-datatypes ((V!49707 0))(
  ( (V!49708 (val!16801 Int)) )
))
(declare-datatypes ((ValueCell!15828 0))(
  ( (ValueCellFull!15828 (v!19399 V!49707)) (EmptyCell!15828) )
))
(declare-datatypes ((array!83996 0))(
  ( (array!83997 (arr!40508 (Array (_ BitVec 32) ValueCell!15828)) (size!41058 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83996)

(declare-fun e!729787 () Bool)

(declare-fun array_inv!30773 (array!83996) Bool)

(assert (=> start!108208 (and (array_inv!30773 _values!1187) e!729787)))

(declare-datatypes ((array!83998 0))(
  ( (array!83999 (arr!40509 (Array (_ BitVec 32) (_ BitVec 64))) (size!41059 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83998)

(declare-fun array_inv!30774 (array!83998) Bool)

(assert (=> start!108208 (array_inv!30774 _keys!1427)))

(declare-fun b!1277786 () Bool)

(declare-fun res!849029 () Bool)

(assert (=> b!1277786 (=> (not res!849029) (not e!729786))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1277786 (= res!849029 (and (= (size!41058 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41059 _keys!1427) (size!41058 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277787 () Bool)

(declare-fun res!849030 () Bool)

(assert (=> b!1277787 (=> (not res!849030) (not e!729786))))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49707)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49707)

(declare-datatypes ((tuple2!21550 0))(
  ( (tuple2!21551 (_1!10786 (_ BitVec 64)) (_2!10786 V!49707)) )
))
(declare-datatypes ((List!28726 0))(
  ( (Nil!28723) (Cons!28722 (h!29931 tuple2!21550) (t!42264 List!28726)) )
))
(declare-datatypes ((ListLongMap!19207 0))(
  ( (ListLongMap!19208 (toList!9619 List!28726)) )
))
(declare-fun contains!7729 (ListLongMap!19207 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4703 (array!83998 array!83996 (_ BitVec 32) (_ BitVec 32) V!49707 V!49707 (_ BitVec 32) Int) ListLongMap!19207)

(assert (=> b!1277787 (= res!849030 (contains!7729 (getCurrentListMap!4703 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1277788 () Bool)

(declare-fun e!729785 () Bool)

(assert (=> b!1277788 (= e!729785 tp_is_empty!33453)))

(declare-fun mapIsEmpty!51713 () Bool)

(declare-fun mapRes!51713 () Bool)

(assert (=> mapIsEmpty!51713 mapRes!51713))

(declare-fun b!1277789 () Bool)

(assert (=> b!1277789 (= e!729787 (and e!729785 mapRes!51713))))

(declare-fun condMapEmpty!51713 () Bool)

(declare-fun mapDefault!51713 () ValueCell!15828)

(assert (=> b!1277789 (= condMapEmpty!51713 (= (arr!40508 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15828)) mapDefault!51713)))))

(declare-fun mapNonEmpty!51713 () Bool)

(declare-fun tp!98665 () Bool)

(declare-fun e!729788 () Bool)

(assert (=> mapNonEmpty!51713 (= mapRes!51713 (and tp!98665 e!729788))))

(declare-fun mapRest!51713 () (Array (_ BitVec 32) ValueCell!15828))

(declare-fun mapValue!51713 () ValueCell!15828)

(declare-fun mapKey!51713 () (_ BitVec 32))

(assert (=> mapNonEmpty!51713 (= (arr!40508 _values!1187) (store mapRest!51713 mapKey!51713 mapValue!51713))))

(declare-fun b!1277790 () Bool)

(declare-fun res!849032 () Bool)

(assert (=> b!1277790 (=> (not res!849032) (not e!729786))))

(declare-datatypes ((List!28727 0))(
  ( (Nil!28724) (Cons!28723 (h!29932 (_ BitVec 64)) (t!42265 List!28727)) )
))
(declare-fun arrayNoDuplicates!0 (array!83998 (_ BitVec 32) List!28727) Bool)

(assert (=> b!1277790 (= res!849032 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28724))))

(declare-fun b!1277791 () Bool)

(declare-fun res!849031 () Bool)

(assert (=> b!1277791 (=> (not res!849031) (not e!729786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83998 (_ BitVec 32)) Bool)

(assert (=> b!1277791 (= res!849031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277792 () Bool)

(assert (=> b!1277792 (= e!729786 (bvsge #b00000000000000000000000000000000 (size!41059 _keys!1427)))))

(declare-fun b!1277793 () Bool)

(assert (=> b!1277793 (= e!729788 tp_is_empty!33453)))

(assert (= (and start!108208 res!849033) b!1277786))

(assert (= (and b!1277786 res!849029) b!1277791))

(assert (= (and b!1277791 res!849031) b!1277790))

(assert (= (and b!1277790 res!849032) b!1277787))

(assert (= (and b!1277787 res!849030) b!1277792))

(assert (= (and b!1277789 condMapEmpty!51713) mapIsEmpty!51713))

(assert (= (and b!1277789 (not condMapEmpty!51713)) mapNonEmpty!51713))

(get-info :version)

(assert (= (and mapNonEmpty!51713 ((_ is ValueCellFull!15828) mapValue!51713)) b!1277793))

(assert (= (and b!1277789 ((_ is ValueCellFull!15828) mapDefault!51713)) b!1277788))

(assert (= start!108208 b!1277789))

(declare-fun m!1173321 () Bool)

(assert (=> b!1277787 m!1173321))

(assert (=> b!1277787 m!1173321))

(declare-fun m!1173323 () Bool)

(assert (=> b!1277787 m!1173323))

(declare-fun m!1173325 () Bool)

(assert (=> b!1277790 m!1173325))

(declare-fun m!1173327 () Bool)

(assert (=> mapNonEmpty!51713 m!1173327))

(declare-fun m!1173329 () Bool)

(assert (=> start!108208 m!1173329))

(declare-fun m!1173331 () Bool)

(assert (=> start!108208 m!1173331))

(declare-fun m!1173333 () Bool)

(assert (=> start!108208 m!1173333))

(declare-fun m!1173335 () Bool)

(assert (=> b!1277791 m!1173335))

(check-sat (not start!108208) b_and!45961 (not mapNonEmpty!51713) (not b!1277790) (not b_next!27903) tp_is_empty!33453 (not b!1277791) (not b!1277787))
(check-sat b_and!45961 (not b_next!27903))
(get-model)

(declare-fun d!140483 () Bool)

(assert (=> d!140483 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!108208 d!140483))

(declare-fun d!140485 () Bool)

(assert (=> d!140485 (= (array_inv!30773 _values!1187) (bvsge (size!41058 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!108208 d!140485))

(declare-fun d!140487 () Bool)

(assert (=> d!140487 (= (array_inv!30774 _keys!1427) (bvsge (size!41059 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!108208 d!140487))

(declare-fun b!1277826 () Bool)

(declare-fun e!729813 () Bool)

(declare-fun e!729811 () Bool)

(assert (=> b!1277826 (= e!729813 e!729811)))

(declare-fun c!123993 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1277826 (= c!123993 (validKeyInArray!0 (select (arr!40509 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277827 () Bool)

(declare-fun e!729812 () Bool)

(assert (=> b!1277827 (= e!729811 e!729812)))

(declare-fun lt!575747 () (_ BitVec 64))

(assert (=> b!1277827 (= lt!575747 (select (arr!40509 _keys!1427) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42375 0))(
  ( (Unit!42376) )
))
(declare-fun lt!575748 () Unit!42375)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83998 (_ BitVec 64) (_ BitVec 32)) Unit!42375)

(assert (=> b!1277827 (= lt!575748 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575747 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1277827 (arrayContainsKey!0 _keys!1427 lt!575747 #b00000000000000000000000000000000)))

(declare-fun lt!575749 () Unit!42375)

(assert (=> b!1277827 (= lt!575749 lt!575748)))

(declare-fun res!849053 () Bool)

(declare-datatypes ((SeekEntryResult!10007 0))(
  ( (MissingZero!10007 (index!42399 (_ BitVec 32))) (Found!10007 (index!42400 (_ BitVec 32))) (Intermediate!10007 (undefined!10819 Bool) (index!42401 (_ BitVec 32)) (x!113252 (_ BitVec 32))) (Undefined!10007) (MissingVacant!10007 (index!42402 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83998 (_ BitVec 32)) SeekEntryResult!10007)

(assert (=> b!1277827 (= res!849053 (= (seekEntryOrOpen!0 (select (arr!40509 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!10007 #b00000000000000000000000000000000)))))

(assert (=> b!1277827 (=> (not res!849053) (not e!729812))))

(declare-fun d!140489 () Bool)

(declare-fun res!849054 () Bool)

(assert (=> d!140489 (=> res!849054 e!729813)))

(assert (=> d!140489 (= res!849054 (bvsge #b00000000000000000000000000000000 (size!41059 _keys!1427)))))

(assert (=> d!140489 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!729813)))

(declare-fun bm!62677 () Bool)

(declare-fun call!62680 () Bool)

(assert (=> bm!62677 (= call!62680 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1277828 () Bool)

(assert (=> b!1277828 (= e!729812 call!62680)))

(declare-fun b!1277829 () Bool)

(assert (=> b!1277829 (= e!729811 call!62680)))

(assert (= (and d!140489 (not res!849054)) b!1277826))

(assert (= (and b!1277826 c!123993) b!1277827))

(assert (= (and b!1277826 (not c!123993)) b!1277829))

(assert (= (and b!1277827 res!849053) b!1277828))

(assert (= (or b!1277828 b!1277829) bm!62677))

(declare-fun m!1173353 () Bool)

(assert (=> b!1277826 m!1173353))

(assert (=> b!1277826 m!1173353))

(declare-fun m!1173355 () Bool)

(assert (=> b!1277826 m!1173355))

(assert (=> b!1277827 m!1173353))

(declare-fun m!1173357 () Bool)

(assert (=> b!1277827 m!1173357))

(declare-fun m!1173359 () Bool)

(assert (=> b!1277827 m!1173359))

(assert (=> b!1277827 m!1173353))

(declare-fun m!1173361 () Bool)

(assert (=> b!1277827 m!1173361))

(declare-fun m!1173363 () Bool)

(assert (=> bm!62677 m!1173363))

(assert (=> b!1277791 d!140489))

(declare-fun d!140491 () Bool)

(declare-fun e!729819 () Bool)

(assert (=> d!140491 e!729819))

(declare-fun res!849057 () Bool)

(assert (=> d!140491 (=> res!849057 e!729819)))

(declare-fun lt!575760 () Bool)

(assert (=> d!140491 (= res!849057 (not lt!575760))))

(declare-fun lt!575761 () Bool)

(assert (=> d!140491 (= lt!575760 lt!575761)))

(declare-fun lt!575758 () Unit!42375)

(declare-fun e!729818 () Unit!42375)

(assert (=> d!140491 (= lt!575758 e!729818)))

(declare-fun c!123996 () Bool)

(assert (=> d!140491 (= c!123996 lt!575761)))

(declare-fun containsKey!713 (List!28726 (_ BitVec 64)) Bool)

(assert (=> d!140491 (= lt!575761 (containsKey!713 (toList!9619 (getCurrentListMap!4703 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(assert (=> d!140491 (= (contains!7729 (getCurrentListMap!4703 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053) lt!575760)))

(declare-fun b!1277836 () Bool)

(declare-fun lt!575759 () Unit!42375)

(assert (=> b!1277836 (= e!729818 lt!575759)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!459 (List!28726 (_ BitVec 64)) Unit!42375)

(assert (=> b!1277836 (= lt!575759 (lemmaContainsKeyImpliesGetValueByKeyDefined!459 (toList!9619 (getCurrentListMap!4703 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(declare-datatypes ((Option!743 0))(
  ( (Some!742 (v!19401 V!49707)) (None!741) )
))
(declare-fun isDefined!498 (Option!743) Bool)

(declare-fun getValueByKey!691 (List!28726 (_ BitVec 64)) Option!743)

(assert (=> b!1277836 (isDefined!498 (getValueByKey!691 (toList!9619 (getCurrentListMap!4703 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(declare-fun b!1277837 () Bool)

(declare-fun Unit!42377 () Unit!42375)

(assert (=> b!1277837 (= e!729818 Unit!42377)))

(declare-fun b!1277838 () Bool)

(assert (=> b!1277838 (= e!729819 (isDefined!498 (getValueByKey!691 (toList!9619 (getCurrentListMap!4703 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053)))))

(assert (= (and d!140491 c!123996) b!1277836))

(assert (= (and d!140491 (not c!123996)) b!1277837))

(assert (= (and d!140491 (not res!849057)) b!1277838))

(declare-fun m!1173365 () Bool)

(assert (=> d!140491 m!1173365))

(declare-fun m!1173367 () Bool)

(assert (=> b!1277836 m!1173367))

(declare-fun m!1173369 () Bool)

(assert (=> b!1277836 m!1173369))

(assert (=> b!1277836 m!1173369))

(declare-fun m!1173371 () Bool)

(assert (=> b!1277836 m!1173371))

(assert (=> b!1277838 m!1173369))

(assert (=> b!1277838 m!1173369))

(assert (=> b!1277838 m!1173371))

(assert (=> b!1277787 d!140491))

(declare-fun b!1277881 () Bool)

(declare-fun e!729850 () ListLongMap!19207)

(declare-fun call!62697 () ListLongMap!19207)

(assert (=> b!1277881 (= e!729850 call!62697)))

(declare-fun c!124014 () Bool)

(declare-fun c!124012 () Bool)

(declare-fun call!62699 () ListLongMap!19207)

(declare-fun call!62701 () ListLongMap!19207)

(declare-fun bm!62692 () Bool)

(declare-fun call!62698 () ListLongMap!19207)

(declare-fun call!62695 () ListLongMap!19207)

(declare-fun +!4271 (ListLongMap!19207 tuple2!21550) ListLongMap!19207)

(assert (=> bm!62692 (= call!62698 (+!4271 (ite c!124012 call!62701 (ite c!124014 call!62699 call!62695)) (ite (or c!124012 c!124014) (tuple2!21551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1129) (tuple2!21551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1129))))))

(declare-fun b!1277882 () Bool)

(declare-fun res!849080 () Bool)

(declare-fun e!729857 () Bool)

(assert (=> b!1277882 (=> (not res!849080) (not e!729857))))

(declare-fun e!729848 () Bool)

(assert (=> b!1277882 (= res!849080 e!729848)))

(declare-fun res!849078 () Bool)

(assert (=> b!1277882 (=> res!849078 e!729848)))

(declare-fun e!729851 () Bool)

(assert (=> b!1277882 (= res!849078 (not e!729851))))

(declare-fun res!849079 () Bool)

(assert (=> b!1277882 (=> (not res!849079) (not e!729851))))

(assert (=> b!1277882 (= res!849079 (bvslt #b00000000000000000000000000000000 (size!41059 _keys!1427)))))

(declare-fun b!1277883 () Bool)

(assert (=> b!1277883 (= e!729851 (validKeyInArray!0 (select (arr!40509 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277884 () Bool)

(declare-fun e!729855 () Bool)

(declare-fun e!729856 () Bool)

(assert (=> b!1277884 (= e!729855 e!729856)))

(declare-fun res!849076 () Bool)

(declare-fun call!62696 () Bool)

(assert (=> b!1277884 (= res!849076 call!62696)))

(assert (=> b!1277884 (=> (not res!849076) (not e!729856))))

(declare-fun b!1277885 () Bool)

(declare-fun lt!575822 () ListLongMap!19207)

(declare-fun e!729854 () Bool)

(declare-fun apply!1008 (ListLongMap!19207 (_ BitVec 64)) V!49707)

(declare-fun get!20651 (ValueCell!15828 V!49707) V!49707)

(declare-fun dynLambda!3406 (Int (_ BitVec 64)) V!49707)

(assert (=> b!1277885 (= e!729854 (= (apply!1008 lt!575822 (select (arr!40509 _keys!1427) #b00000000000000000000000000000000)) (get!20651 (select (arr!40508 _values!1187) #b00000000000000000000000000000000) (dynLambda!3406 defaultEntry!1195 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1277885 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41058 _values!1187)))))

(assert (=> b!1277885 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41059 _keys!1427)))))

(declare-fun b!1277886 () Bool)

(assert (=> b!1277886 (= e!729856 (= (apply!1008 lt!575822 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1129))))

(declare-fun bm!62693 () Bool)

(assert (=> bm!62693 (= call!62699 call!62701)))

(declare-fun b!1277887 () Bool)

(declare-fun e!729853 () Bool)

(assert (=> b!1277887 (= e!729857 e!729853)))

(declare-fun c!124010 () Bool)

(assert (=> b!1277887 (= c!124010 (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1277888 () Bool)

(declare-fun e!729849 () Unit!42375)

(declare-fun lt!575817 () Unit!42375)

(assert (=> b!1277888 (= e!729849 lt!575817)))

(declare-fun lt!575806 () ListLongMap!19207)

(declare-fun getCurrentListMapNoExtraKeys!5901 (array!83998 array!83996 (_ BitVec 32) (_ BitVec 32) V!49707 V!49707 (_ BitVec 32) Int) ListLongMap!19207)

(assert (=> b!1277888 (= lt!575806 (getCurrentListMapNoExtraKeys!5901 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!575809 () (_ BitVec 64))

(assert (=> b!1277888 (= lt!575809 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!575821 () (_ BitVec 64))

(assert (=> b!1277888 (= lt!575821 (select (arr!40509 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!575816 () Unit!42375)

(declare-fun addStillContains!1096 (ListLongMap!19207 (_ BitVec 64) V!49707 (_ BitVec 64)) Unit!42375)

(assert (=> b!1277888 (= lt!575816 (addStillContains!1096 lt!575806 lt!575809 zeroValue!1129 lt!575821))))

(assert (=> b!1277888 (contains!7729 (+!4271 lt!575806 (tuple2!21551 lt!575809 zeroValue!1129)) lt!575821)))

(declare-fun lt!575814 () Unit!42375)

(assert (=> b!1277888 (= lt!575814 lt!575816)))

(declare-fun lt!575824 () ListLongMap!19207)

(assert (=> b!1277888 (= lt!575824 (getCurrentListMapNoExtraKeys!5901 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!575827 () (_ BitVec 64))

(assert (=> b!1277888 (= lt!575827 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!575820 () (_ BitVec 64))

(assert (=> b!1277888 (= lt!575820 (select (arr!40509 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!575807 () Unit!42375)

(declare-fun addApplyDifferent!550 (ListLongMap!19207 (_ BitVec 64) V!49707 (_ BitVec 64)) Unit!42375)

(assert (=> b!1277888 (= lt!575807 (addApplyDifferent!550 lt!575824 lt!575827 minValue!1129 lt!575820))))

(assert (=> b!1277888 (= (apply!1008 (+!4271 lt!575824 (tuple2!21551 lt!575827 minValue!1129)) lt!575820) (apply!1008 lt!575824 lt!575820))))

(declare-fun lt!575825 () Unit!42375)

(assert (=> b!1277888 (= lt!575825 lt!575807)))

(declare-fun lt!575819 () ListLongMap!19207)

(assert (=> b!1277888 (= lt!575819 (getCurrentListMapNoExtraKeys!5901 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!575826 () (_ BitVec 64))

(assert (=> b!1277888 (= lt!575826 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!575808 () (_ BitVec 64))

(assert (=> b!1277888 (= lt!575808 (select (arr!40509 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!575815 () Unit!42375)

(assert (=> b!1277888 (= lt!575815 (addApplyDifferent!550 lt!575819 lt!575826 zeroValue!1129 lt!575808))))

(assert (=> b!1277888 (= (apply!1008 (+!4271 lt!575819 (tuple2!21551 lt!575826 zeroValue!1129)) lt!575808) (apply!1008 lt!575819 lt!575808))))

(declare-fun lt!575811 () Unit!42375)

(assert (=> b!1277888 (= lt!575811 lt!575815)))

(declare-fun lt!575818 () ListLongMap!19207)

(assert (=> b!1277888 (= lt!575818 (getCurrentListMapNoExtraKeys!5901 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!575812 () (_ BitVec 64))

(assert (=> b!1277888 (= lt!575812 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!575823 () (_ BitVec 64))

(assert (=> b!1277888 (= lt!575823 (select (arr!40509 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> b!1277888 (= lt!575817 (addApplyDifferent!550 lt!575818 lt!575812 minValue!1129 lt!575823))))

(assert (=> b!1277888 (= (apply!1008 (+!4271 lt!575818 (tuple2!21551 lt!575812 minValue!1129)) lt!575823) (apply!1008 lt!575818 lt!575823))))

(declare-fun d!140493 () Bool)

(assert (=> d!140493 e!729857))

(declare-fun res!849082 () Bool)

(assert (=> d!140493 (=> (not res!849082) (not e!729857))))

(assert (=> d!140493 (= res!849082 (or (bvsge #b00000000000000000000000000000000 (size!41059 _keys!1427)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41059 _keys!1427)))))))

(declare-fun lt!575813 () ListLongMap!19207)

(assert (=> d!140493 (= lt!575822 lt!575813)))

(declare-fun lt!575810 () Unit!42375)

(assert (=> d!140493 (= lt!575810 e!729849)))

(declare-fun c!124011 () Bool)

(declare-fun e!729847 () Bool)

(assert (=> d!140493 (= c!124011 e!729847)))

(declare-fun res!849077 () Bool)

(assert (=> d!140493 (=> (not res!849077) (not e!729847))))

(assert (=> d!140493 (= res!849077 (bvslt #b00000000000000000000000000000000 (size!41059 _keys!1427)))))

(declare-fun e!729846 () ListLongMap!19207)

(assert (=> d!140493 (= lt!575813 e!729846)))

(assert (=> d!140493 (= c!124012 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140493 (validMask!0 mask!1805)))

(assert (=> d!140493 (= (getCurrentListMap!4703 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) lt!575822)))

(declare-fun b!1277889 () Bool)

(declare-fun e!729858 () ListLongMap!19207)

(assert (=> b!1277889 (= e!729858 call!62697)))

(declare-fun b!1277890 () Bool)

(declare-fun res!849084 () Bool)

(assert (=> b!1277890 (=> (not res!849084) (not e!729857))))

(assert (=> b!1277890 (= res!849084 e!729855)))

(declare-fun c!124009 () Bool)

(assert (=> b!1277890 (= c!124009 (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62694 () Bool)

(declare-fun call!62700 () Bool)

(assert (=> bm!62694 (= call!62700 (contains!7729 lt!575822 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1277891 () Bool)

(assert (=> b!1277891 (= e!729847 (validKeyInArray!0 (select (arr!40509 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun bm!62695 () Bool)

(assert (=> bm!62695 (= call!62695 call!62699)))

(declare-fun b!1277892 () Bool)

(assert (=> b!1277892 (= e!729853 (not call!62700))))

(declare-fun b!1277893 () Bool)

(assert (=> b!1277893 (= e!729848 e!729854)))

(declare-fun res!849083 () Bool)

(assert (=> b!1277893 (=> (not res!849083) (not e!729854))))

(assert (=> b!1277893 (= res!849083 (contains!7729 lt!575822 (select (arr!40509 _keys!1427) #b00000000000000000000000000000000)))))

(assert (=> b!1277893 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41059 _keys!1427)))))

(declare-fun bm!62696 () Bool)

(assert (=> bm!62696 (= call!62696 (contains!7729 lt!575822 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1277894 () Bool)

(assert (=> b!1277894 (= e!729855 (not call!62696))))

(declare-fun b!1277895 () Bool)

(assert (=> b!1277895 (= e!729846 (+!4271 call!62698 (tuple2!21551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1129)))))

(declare-fun b!1277896 () Bool)

(assert (=> b!1277896 (= e!729846 e!729850)))

(assert (=> b!1277896 (= c!124014 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62697 () Bool)

(assert (=> bm!62697 (= call!62697 call!62698)))

(declare-fun b!1277897 () Bool)

(declare-fun e!729852 () Bool)

(assert (=> b!1277897 (= e!729852 (= (apply!1008 lt!575822 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1129))))

(declare-fun bm!62698 () Bool)

(assert (=> bm!62698 (= call!62701 (getCurrentListMapNoExtraKeys!5901 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1277898 () Bool)

(declare-fun Unit!42378 () Unit!42375)

(assert (=> b!1277898 (= e!729849 Unit!42378)))

(declare-fun b!1277899 () Bool)

(assert (=> b!1277899 (= e!729853 e!729852)))

(declare-fun res!849081 () Bool)

(assert (=> b!1277899 (= res!849081 call!62700)))

(assert (=> b!1277899 (=> (not res!849081) (not e!729852))))

(declare-fun b!1277900 () Bool)

(assert (=> b!1277900 (= e!729858 call!62695)))

(declare-fun b!1277901 () Bool)

(declare-fun c!124013 () Bool)

(assert (=> b!1277901 (= c!124013 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1277901 (= e!729850 e!729858)))

(assert (= (and d!140493 c!124012) b!1277895))

(assert (= (and d!140493 (not c!124012)) b!1277896))

(assert (= (and b!1277896 c!124014) b!1277881))

(assert (= (and b!1277896 (not c!124014)) b!1277901))

(assert (= (and b!1277901 c!124013) b!1277889))

(assert (= (and b!1277901 (not c!124013)) b!1277900))

(assert (= (or b!1277889 b!1277900) bm!62695))

(assert (= (or b!1277881 bm!62695) bm!62693))

(assert (= (or b!1277881 b!1277889) bm!62697))

(assert (= (or b!1277895 bm!62693) bm!62698))

(assert (= (or b!1277895 bm!62697) bm!62692))

(assert (= (and d!140493 res!849077) b!1277891))

(assert (= (and d!140493 c!124011) b!1277888))

(assert (= (and d!140493 (not c!124011)) b!1277898))

(assert (= (and d!140493 res!849082) b!1277882))

(assert (= (and b!1277882 res!849079) b!1277883))

(assert (= (and b!1277882 (not res!849078)) b!1277893))

(assert (= (and b!1277893 res!849083) b!1277885))

(assert (= (and b!1277882 res!849080) b!1277890))

(assert (= (and b!1277890 c!124009) b!1277884))

(assert (= (and b!1277890 (not c!124009)) b!1277894))

(assert (= (and b!1277884 res!849076) b!1277886))

(assert (= (or b!1277884 b!1277894) bm!62696))

(assert (= (and b!1277890 res!849084) b!1277887))

(assert (= (and b!1277887 c!124010) b!1277899))

(assert (= (and b!1277887 (not c!124010)) b!1277892))

(assert (= (and b!1277899 res!849081) b!1277897))

(assert (= (or b!1277899 b!1277892) bm!62694))

(declare-fun b_lambda!23091 () Bool)

(assert (=> (not b_lambda!23091) (not b!1277885)))

(declare-fun t!42269 () Bool)

(declare-fun tb!11343 () Bool)

(assert (=> (and start!108208 (= defaultEntry!1195 defaultEntry!1195) t!42269) tb!11343))

(declare-fun result!23669 () Bool)

(assert (=> tb!11343 (= result!23669 tp_is_empty!33453)))

(assert (=> b!1277885 t!42269))

(declare-fun b_and!45965 () Bool)

(assert (= b_and!45961 (and (=> t!42269 result!23669) b_and!45965)))

(declare-fun m!1173373 () Bool)

(assert (=> b!1277897 m!1173373))

(declare-fun m!1173375 () Bool)

(assert (=> bm!62694 m!1173375))

(declare-fun m!1173377 () Bool)

(assert (=> bm!62696 m!1173377))

(declare-fun m!1173379 () Bool)

(assert (=> b!1277888 m!1173379))

(declare-fun m!1173381 () Bool)

(assert (=> b!1277888 m!1173381))

(declare-fun m!1173383 () Bool)

(assert (=> b!1277888 m!1173383))

(declare-fun m!1173385 () Bool)

(assert (=> b!1277888 m!1173385))

(assert (=> b!1277888 m!1173383))

(declare-fun m!1173387 () Bool)

(assert (=> b!1277888 m!1173387))

(declare-fun m!1173389 () Bool)

(assert (=> b!1277888 m!1173389))

(declare-fun m!1173391 () Bool)

(assert (=> b!1277888 m!1173391))

(declare-fun m!1173393 () Bool)

(assert (=> b!1277888 m!1173393))

(declare-fun m!1173395 () Bool)

(assert (=> b!1277888 m!1173395))

(assert (=> b!1277888 m!1173395))

(declare-fun m!1173397 () Bool)

(assert (=> b!1277888 m!1173397))

(declare-fun m!1173399 () Bool)

(assert (=> b!1277888 m!1173399))

(declare-fun m!1173401 () Bool)

(assert (=> b!1277888 m!1173401))

(declare-fun m!1173403 () Bool)

(assert (=> b!1277888 m!1173403))

(declare-fun m!1173405 () Bool)

(assert (=> b!1277888 m!1173405))

(declare-fun m!1173407 () Bool)

(assert (=> b!1277888 m!1173407))

(assert (=> b!1277888 m!1173401))

(assert (=> b!1277888 m!1173379))

(declare-fun m!1173409 () Bool)

(assert (=> b!1277888 m!1173409))

(assert (=> b!1277888 m!1173353))

(assert (=> b!1277891 m!1173353))

(assert (=> b!1277891 m!1173353))

(assert (=> b!1277891 m!1173355))

(assert (=> b!1277893 m!1173353))

(assert (=> b!1277893 m!1173353))

(declare-fun m!1173411 () Bool)

(assert (=> b!1277893 m!1173411))

(declare-fun m!1173413 () Bool)

(assert (=> b!1277886 m!1173413))

(assert (=> bm!62698 m!1173407))

(declare-fun m!1173415 () Bool)

(assert (=> b!1277885 m!1173415))

(declare-fun m!1173417 () Bool)

(assert (=> b!1277885 m!1173417))

(assert (=> b!1277885 m!1173353))

(assert (=> b!1277885 m!1173353))

(declare-fun m!1173419 () Bool)

(assert (=> b!1277885 m!1173419))

(assert (=> b!1277885 m!1173417))

(assert (=> b!1277885 m!1173415))

(declare-fun m!1173421 () Bool)

(assert (=> b!1277885 m!1173421))

(assert (=> b!1277883 m!1173353))

(assert (=> b!1277883 m!1173353))

(assert (=> b!1277883 m!1173355))

(assert (=> d!140493 m!1173329))

(declare-fun m!1173423 () Bool)

(assert (=> b!1277895 m!1173423))

(declare-fun m!1173425 () Bool)

(assert (=> bm!62692 m!1173425))

(assert (=> b!1277787 d!140493))

(declare-fun bm!62701 () Bool)

(declare-fun call!62704 () Bool)

(declare-fun c!124017 () Bool)

(assert (=> bm!62701 (= call!62704 (arrayNoDuplicates!0 _keys!1427 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124017 (Cons!28723 (select (arr!40509 _keys!1427) #b00000000000000000000000000000000) Nil!28724) Nil!28724)))))

(declare-fun b!1277914 () Bool)

(declare-fun e!729869 () Bool)

(assert (=> b!1277914 (= e!729869 call!62704)))

(declare-fun b!1277915 () Bool)

(declare-fun e!729870 () Bool)

(declare-fun contains!7731 (List!28727 (_ BitVec 64)) Bool)

(assert (=> b!1277915 (= e!729870 (contains!7731 Nil!28724 (select (arr!40509 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277916 () Bool)

(declare-fun e!729867 () Bool)

(assert (=> b!1277916 (= e!729867 e!729869)))

(assert (=> b!1277916 (= c!124017 (validKeyInArray!0 (select (arr!40509 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun d!140495 () Bool)

(declare-fun res!849091 () Bool)

(declare-fun e!729868 () Bool)

(assert (=> d!140495 (=> res!849091 e!729868)))

(assert (=> d!140495 (= res!849091 (bvsge #b00000000000000000000000000000000 (size!41059 _keys!1427)))))

(assert (=> d!140495 (= (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28724) e!729868)))

(declare-fun b!1277917 () Bool)

(assert (=> b!1277917 (= e!729869 call!62704)))

(declare-fun b!1277918 () Bool)

(assert (=> b!1277918 (= e!729868 e!729867)))

(declare-fun res!849092 () Bool)

(assert (=> b!1277918 (=> (not res!849092) (not e!729867))))

(assert (=> b!1277918 (= res!849092 (not e!729870))))

(declare-fun res!849093 () Bool)

(assert (=> b!1277918 (=> (not res!849093) (not e!729870))))

(assert (=> b!1277918 (= res!849093 (validKeyInArray!0 (select (arr!40509 _keys!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!140495 (not res!849091)) b!1277918))

(assert (= (and b!1277918 res!849093) b!1277915))

(assert (= (and b!1277918 res!849092) b!1277916))

(assert (= (and b!1277916 c!124017) b!1277914))

(assert (= (and b!1277916 (not c!124017)) b!1277917))

(assert (= (or b!1277914 b!1277917) bm!62701))

(assert (=> bm!62701 m!1173353))

(declare-fun m!1173427 () Bool)

(assert (=> bm!62701 m!1173427))

(assert (=> b!1277915 m!1173353))

(assert (=> b!1277915 m!1173353))

(declare-fun m!1173429 () Bool)

(assert (=> b!1277915 m!1173429))

(assert (=> b!1277916 m!1173353))

(assert (=> b!1277916 m!1173353))

(assert (=> b!1277916 m!1173355))

(assert (=> b!1277918 m!1173353))

(assert (=> b!1277918 m!1173353))

(assert (=> b!1277918 m!1173355))

(assert (=> b!1277790 d!140495))

(declare-fun b!1277926 () Bool)

(declare-fun e!729875 () Bool)

(assert (=> b!1277926 (= e!729875 tp_is_empty!33453)))

(declare-fun b!1277925 () Bool)

(declare-fun e!729876 () Bool)

(assert (=> b!1277925 (= e!729876 tp_is_empty!33453)))

(declare-fun condMapEmpty!51719 () Bool)

(declare-fun mapDefault!51719 () ValueCell!15828)

(assert (=> mapNonEmpty!51713 (= condMapEmpty!51719 (= mapRest!51713 ((as const (Array (_ BitVec 32) ValueCell!15828)) mapDefault!51719)))))

(declare-fun mapRes!51719 () Bool)

(assert (=> mapNonEmpty!51713 (= tp!98665 (and e!729875 mapRes!51719))))

(declare-fun mapIsEmpty!51719 () Bool)

(assert (=> mapIsEmpty!51719 mapRes!51719))

(declare-fun mapNonEmpty!51719 () Bool)

(declare-fun tp!98675 () Bool)

(assert (=> mapNonEmpty!51719 (= mapRes!51719 (and tp!98675 e!729876))))

(declare-fun mapKey!51719 () (_ BitVec 32))

(declare-fun mapValue!51719 () ValueCell!15828)

(declare-fun mapRest!51719 () (Array (_ BitVec 32) ValueCell!15828))

(assert (=> mapNonEmpty!51719 (= mapRest!51713 (store mapRest!51719 mapKey!51719 mapValue!51719))))

(assert (= (and mapNonEmpty!51713 condMapEmpty!51719) mapIsEmpty!51719))

(assert (= (and mapNonEmpty!51713 (not condMapEmpty!51719)) mapNonEmpty!51719))

(assert (= (and mapNonEmpty!51719 ((_ is ValueCellFull!15828) mapValue!51719)) b!1277925))

(assert (= (and mapNonEmpty!51713 ((_ is ValueCellFull!15828) mapDefault!51719)) b!1277926))

(declare-fun m!1173431 () Bool)

(assert (=> mapNonEmpty!51719 m!1173431))

(declare-fun b_lambda!23093 () Bool)

(assert (= b_lambda!23091 (or (and start!108208 b_free!27903) b_lambda!23093)))

(check-sat (not b_lambda!23093) (not d!140493) (not b!1277915) (not b!1277893) (not bm!62701) (not b!1277916) (not bm!62698) (not b!1277883) (not bm!62692) (not bm!62694) (not d!140491) (not b!1277897) (not b!1277891) (not b!1277895) (not b!1277886) (not b!1277826) (not b!1277918) (not b!1277836) (not mapNonEmpty!51719) (not b!1277885) (not bm!62696) (not bm!62677) (not b_next!27903) (not b!1277827) b_and!45965 tp_is_empty!33453 (not b!1277838) (not b!1277888))
(check-sat b_and!45965 (not b_next!27903))
