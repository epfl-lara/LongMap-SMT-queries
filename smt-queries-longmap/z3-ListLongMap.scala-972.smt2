; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21054 () Bool)

(assert start!21054)

(declare-fun b_free!5581 () Bool)

(declare-fun b_next!5581 () Bool)

(assert (=> start!21054 (= b_free!5581 (not b_next!5581))))

(declare-fun tp!19802 () Bool)

(declare-fun b_and!12373 () Bool)

(assert (=> start!21054 (= tp!19802 b_and!12373)))

(declare-fun b!211531 () Bool)

(declare-fun e!137672 () Bool)

(declare-fun tp_is_empty!5443 () Bool)

(assert (=> b!211531 (= e!137672 tp_is_empty!5443)))

(declare-fun b!211532 () Bool)

(declare-fun res!103312 () Bool)

(declare-fun e!137674 () Bool)

(assert (=> b!211532 (=> (not res!103312) (not e!137674))))

(declare-datatypes ((array!10077 0))(
  ( (array!10078 (arr!4782 (Array (_ BitVec 32) (_ BitVec 64))) (size!5108 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10077)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!211532 (= res!103312 (= (select (arr!4782 _keys!825) i!601) k0!843))))

(declare-fun b!211533 () Bool)

(declare-fun res!103310 () Bool)

(assert (=> b!211533 (=> (not res!103310) (not e!137674))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10077 (_ BitVec 32)) Bool)

(assert (=> b!211533 (= res!103310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-datatypes ((V!6905 0))(
  ( (V!6906 (val!2766 Int)) )
))
(declare-datatypes ((tuple2!4158 0))(
  ( (tuple2!4159 (_1!2090 (_ BitVec 64)) (_2!2090 V!6905)) )
))
(declare-fun lt!108714 () tuple2!4158)

(declare-fun e!137671 () Bool)

(declare-datatypes ((List!3066 0))(
  ( (Nil!3063) (Cons!3062 (h!3704 tuple2!4158) (t!8000 List!3066)) )
))
(declare-datatypes ((ListLongMap!3061 0))(
  ( (ListLongMap!3062 (toList!1546 List!3066)) )
))
(declare-fun lt!108712 () ListLongMap!3061)

(declare-fun b!211534 () Bool)

(declare-fun lt!108717 () ListLongMap!3061)

(declare-fun +!570 (ListLongMap!3061 tuple2!4158) ListLongMap!3061)

(assert (=> b!211534 (= e!137671 (= lt!108712 (+!570 lt!108717 lt!108714)))))

(declare-fun b!211535 () Bool)

(declare-fun res!103311 () Bool)

(assert (=> b!211535 (=> (not res!103311) (not e!137674))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2378 0))(
  ( (ValueCellFull!2378 (v!4754 V!6905)) (EmptyCell!2378) )
))
(declare-datatypes ((array!10079 0))(
  ( (array!10080 (arr!4783 (Array (_ BitVec 32) ValueCell!2378)) (size!5109 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10079)

(assert (=> b!211535 (= res!103311 (and (= (size!5109 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5108 _keys!825) (size!5109 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!211536 () Bool)

(declare-fun res!103314 () Bool)

(assert (=> b!211536 (=> (not res!103314) (not e!137674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!211536 (= res!103314 (validKeyInArray!0 k0!843))))

(declare-fun b!211537 () Bool)

(declare-fun res!103318 () Bool)

(assert (=> b!211537 (=> (not res!103318) (not e!137671))))

(declare-fun lt!108716 () ListLongMap!3061)

(declare-fun lt!108711 () ListLongMap!3061)

(assert (=> b!211537 (= res!103318 (= lt!108711 (+!570 lt!108716 lt!108714)))))

(declare-fun mapNonEmpty!9251 () Bool)

(declare-fun mapRes!9251 () Bool)

(declare-fun tp!19801 () Bool)

(assert (=> mapNonEmpty!9251 (= mapRes!9251 (and tp!19801 e!137672))))

(declare-fun mapRest!9251 () (Array (_ BitVec 32) ValueCell!2378))

(declare-fun mapKey!9251 () (_ BitVec 32))

(declare-fun mapValue!9251 () ValueCell!2378)

(assert (=> mapNonEmpty!9251 (= (arr!4783 _values!649) (store mapRest!9251 mapKey!9251 mapValue!9251))))

(declare-fun b!211538 () Bool)

(declare-fun res!103316 () Bool)

(assert (=> b!211538 (=> (not res!103316) (not e!137674))))

(declare-datatypes ((List!3067 0))(
  ( (Nil!3064) (Cons!3063 (h!3705 (_ BitVec 64)) (t!8001 List!3067)) )
))
(declare-fun arrayNoDuplicates!0 (array!10077 (_ BitVec 32) List!3067) Bool)

(assert (=> b!211538 (= res!103316 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3064))))

(declare-fun b!211539 () Bool)

(declare-fun e!137677 () Bool)

(assert (=> b!211539 (= e!137677 (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211539 e!137671))

(declare-fun res!103313 () Bool)

(assert (=> b!211539 (=> (not res!103313) (not e!137671))))

(declare-fun lt!108713 () ListLongMap!3061)

(assert (=> b!211539 (= res!103313 (= lt!108712 (+!570 lt!108713 lt!108714)))))

(declare-fun zeroValue!615 () V!6905)

(assert (=> b!211539 (= lt!108714 (tuple2!4159 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!103315 () Bool)

(assert (=> start!21054 (=> (not res!103315) (not e!137674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21054 (= res!103315 (validMask!0 mask!1149))))

(assert (=> start!21054 e!137674))

(declare-fun e!137675 () Bool)

(declare-fun array_inv!3139 (array!10079) Bool)

(assert (=> start!21054 (and (array_inv!3139 _values!649) e!137675)))

(assert (=> start!21054 true))

(assert (=> start!21054 tp_is_empty!5443))

(declare-fun array_inv!3140 (array!10077) Bool)

(assert (=> start!21054 (array_inv!3140 _keys!825)))

(assert (=> start!21054 tp!19802))

(declare-fun mapIsEmpty!9251 () Bool)

(assert (=> mapIsEmpty!9251 mapRes!9251))

(declare-fun b!211540 () Bool)

(declare-fun e!137676 () Bool)

(assert (=> b!211540 (= e!137676 tp_is_empty!5443)))

(declare-fun b!211541 () Bool)

(assert (=> b!211541 (= e!137674 (not e!137677))))

(declare-fun res!103317 () Bool)

(assert (=> b!211541 (=> res!103317 e!137677)))

(assert (=> b!211541 (= res!103317 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6905)

(declare-fun getCurrentListMap!1058 (array!10077 array!10079 (_ BitVec 32) (_ BitVec 32) V!6905 V!6905 (_ BitVec 32) Int) ListLongMap!3061)

(assert (=> b!211541 (= lt!108711 (getCurrentListMap!1058 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108710 () array!10079)

(assert (=> b!211541 (= lt!108712 (getCurrentListMap!1058 _keys!825 lt!108710 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211541 (and (= lt!108713 lt!108717) (= lt!108717 lt!108713))))

(declare-fun v!520 () V!6905)

(assert (=> b!211541 (= lt!108717 (+!570 lt!108716 (tuple2!4159 k0!843 v!520)))))

(declare-datatypes ((Unit!6388 0))(
  ( (Unit!6389) )
))
(declare-fun lt!108715 () Unit!6388)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!219 (array!10077 array!10079 (_ BitVec 32) (_ BitVec 32) V!6905 V!6905 (_ BitVec 32) (_ BitVec 64) V!6905 (_ BitVec 32) Int) Unit!6388)

(assert (=> b!211541 (= lt!108715 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!219 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!495 (array!10077 array!10079 (_ BitVec 32) (_ BitVec 32) V!6905 V!6905 (_ BitVec 32) Int) ListLongMap!3061)

(assert (=> b!211541 (= lt!108713 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108710 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211541 (= lt!108710 (array!10080 (store (arr!4783 _values!649) i!601 (ValueCellFull!2378 v!520)) (size!5109 _values!649)))))

(assert (=> b!211541 (= lt!108716 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211542 () Bool)

(assert (=> b!211542 (= e!137675 (and e!137676 mapRes!9251))))

(declare-fun condMapEmpty!9251 () Bool)

(declare-fun mapDefault!9251 () ValueCell!2378)

(assert (=> b!211542 (= condMapEmpty!9251 (= (arr!4783 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2378)) mapDefault!9251)))))

(declare-fun b!211543 () Bool)

(declare-fun res!103309 () Bool)

(assert (=> b!211543 (=> (not res!103309) (not e!137674))))

(assert (=> b!211543 (= res!103309 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5108 _keys!825))))))

(assert (= (and start!21054 res!103315) b!211535))

(assert (= (and b!211535 res!103311) b!211533))

(assert (= (and b!211533 res!103310) b!211538))

(assert (= (and b!211538 res!103316) b!211543))

(assert (= (and b!211543 res!103309) b!211536))

(assert (= (and b!211536 res!103314) b!211532))

(assert (= (and b!211532 res!103312) b!211541))

(assert (= (and b!211541 (not res!103317)) b!211539))

(assert (= (and b!211539 res!103313) b!211537))

(assert (= (and b!211537 res!103318) b!211534))

(assert (= (and b!211542 condMapEmpty!9251) mapIsEmpty!9251))

(assert (= (and b!211542 (not condMapEmpty!9251)) mapNonEmpty!9251))

(get-info :version)

(assert (= (and mapNonEmpty!9251 ((_ is ValueCellFull!2378) mapValue!9251)) b!211531))

(assert (= (and b!211542 ((_ is ValueCellFull!2378) mapDefault!9251)) b!211540))

(assert (= start!21054 b!211542))

(declare-fun m!238813 () Bool)

(assert (=> b!211537 m!238813))

(declare-fun m!238815 () Bool)

(assert (=> b!211534 m!238815))

(declare-fun m!238817 () Bool)

(assert (=> b!211533 m!238817))

(declare-fun m!238819 () Bool)

(assert (=> b!211541 m!238819))

(declare-fun m!238821 () Bool)

(assert (=> b!211541 m!238821))

(declare-fun m!238823 () Bool)

(assert (=> b!211541 m!238823))

(declare-fun m!238825 () Bool)

(assert (=> b!211541 m!238825))

(declare-fun m!238827 () Bool)

(assert (=> b!211541 m!238827))

(declare-fun m!238829 () Bool)

(assert (=> b!211541 m!238829))

(declare-fun m!238831 () Bool)

(assert (=> b!211541 m!238831))

(declare-fun m!238833 () Bool)

(assert (=> start!21054 m!238833))

(declare-fun m!238835 () Bool)

(assert (=> start!21054 m!238835))

(declare-fun m!238837 () Bool)

(assert (=> start!21054 m!238837))

(declare-fun m!238839 () Bool)

(assert (=> b!211536 m!238839))

(declare-fun m!238841 () Bool)

(assert (=> b!211538 m!238841))

(declare-fun m!238843 () Bool)

(assert (=> b!211539 m!238843))

(declare-fun m!238845 () Bool)

(assert (=> mapNonEmpty!9251 m!238845))

(declare-fun m!238847 () Bool)

(assert (=> b!211532 m!238847))

(check-sat (not b!211541) (not b!211536) (not b!211533) tp_is_empty!5443 (not b!211534) (not b!211538) (not b!211537) (not start!21054) (not b!211539) b_and!12373 (not b_next!5581) (not mapNonEmpty!9251))
(check-sat b_and!12373 (not b_next!5581))
(get-model)

(declare-fun d!57923 () Bool)

(declare-fun e!137722 () Bool)

(assert (=> d!57923 e!137722))

(declare-fun res!103383 () Bool)

(assert (=> d!57923 (=> (not res!103383) (not e!137722))))

(declare-fun lt!108776 () ListLongMap!3061)

(declare-fun contains!1385 (ListLongMap!3061 (_ BitVec 64)) Bool)

(assert (=> d!57923 (= res!103383 (contains!1385 lt!108776 (_1!2090 lt!108714)))))

(declare-fun lt!108774 () List!3066)

(assert (=> d!57923 (= lt!108776 (ListLongMap!3062 lt!108774))))

(declare-fun lt!108775 () Unit!6388)

(declare-fun lt!108777 () Unit!6388)

(assert (=> d!57923 (= lt!108775 lt!108777)))

(declare-datatypes ((Option!257 0))(
  ( (Some!256 (v!4760 V!6905)) (None!255) )
))
(declare-fun getValueByKey!251 (List!3066 (_ BitVec 64)) Option!257)

(assert (=> d!57923 (= (getValueByKey!251 lt!108774 (_1!2090 lt!108714)) (Some!256 (_2!2090 lt!108714)))))

(declare-fun lemmaContainsTupThenGetReturnValue!141 (List!3066 (_ BitVec 64) V!6905) Unit!6388)

(assert (=> d!57923 (= lt!108777 (lemmaContainsTupThenGetReturnValue!141 lt!108774 (_1!2090 lt!108714) (_2!2090 lt!108714)))))

(declare-fun insertStrictlySorted!144 (List!3066 (_ BitVec 64) V!6905) List!3066)

(assert (=> d!57923 (= lt!108774 (insertStrictlySorted!144 (toList!1546 lt!108713) (_1!2090 lt!108714) (_2!2090 lt!108714)))))

(assert (=> d!57923 (= (+!570 lt!108713 lt!108714) lt!108776)))

(declare-fun b!211626 () Bool)

(declare-fun res!103384 () Bool)

(assert (=> b!211626 (=> (not res!103384) (not e!137722))))

(assert (=> b!211626 (= res!103384 (= (getValueByKey!251 (toList!1546 lt!108776) (_1!2090 lt!108714)) (Some!256 (_2!2090 lt!108714))))))

(declare-fun b!211627 () Bool)

(declare-fun contains!1386 (List!3066 tuple2!4158) Bool)

(assert (=> b!211627 (= e!137722 (contains!1386 (toList!1546 lt!108776) lt!108714))))

(assert (= (and d!57923 res!103383) b!211626))

(assert (= (and b!211626 res!103384) b!211627))

(declare-fun m!238921 () Bool)

(assert (=> d!57923 m!238921))

(declare-fun m!238923 () Bool)

(assert (=> d!57923 m!238923))

(declare-fun m!238925 () Bool)

(assert (=> d!57923 m!238925))

(declare-fun m!238927 () Bool)

(assert (=> d!57923 m!238927))

(declare-fun m!238929 () Bool)

(assert (=> b!211626 m!238929))

(declare-fun m!238931 () Bool)

(assert (=> b!211627 m!238931))

(assert (=> b!211539 d!57923))

(declare-fun d!57925 () Bool)

(declare-fun e!137723 () Bool)

(assert (=> d!57925 e!137723))

(declare-fun res!103385 () Bool)

(assert (=> d!57925 (=> (not res!103385) (not e!137723))))

(declare-fun lt!108780 () ListLongMap!3061)

(assert (=> d!57925 (= res!103385 (contains!1385 lt!108780 (_1!2090 lt!108714)))))

(declare-fun lt!108778 () List!3066)

(assert (=> d!57925 (= lt!108780 (ListLongMap!3062 lt!108778))))

(declare-fun lt!108779 () Unit!6388)

(declare-fun lt!108781 () Unit!6388)

(assert (=> d!57925 (= lt!108779 lt!108781)))

(assert (=> d!57925 (= (getValueByKey!251 lt!108778 (_1!2090 lt!108714)) (Some!256 (_2!2090 lt!108714)))))

(assert (=> d!57925 (= lt!108781 (lemmaContainsTupThenGetReturnValue!141 lt!108778 (_1!2090 lt!108714) (_2!2090 lt!108714)))))

(assert (=> d!57925 (= lt!108778 (insertStrictlySorted!144 (toList!1546 lt!108716) (_1!2090 lt!108714) (_2!2090 lt!108714)))))

(assert (=> d!57925 (= (+!570 lt!108716 lt!108714) lt!108780)))

(declare-fun b!211628 () Bool)

(declare-fun res!103386 () Bool)

(assert (=> b!211628 (=> (not res!103386) (not e!137723))))

(assert (=> b!211628 (= res!103386 (= (getValueByKey!251 (toList!1546 lt!108780) (_1!2090 lt!108714)) (Some!256 (_2!2090 lt!108714))))))

(declare-fun b!211629 () Bool)

(assert (=> b!211629 (= e!137723 (contains!1386 (toList!1546 lt!108780) lt!108714))))

(assert (= (and d!57925 res!103385) b!211628))

(assert (= (and b!211628 res!103386) b!211629))

(declare-fun m!238933 () Bool)

(assert (=> d!57925 m!238933))

(declare-fun m!238935 () Bool)

(assert (=> d!57925 m!238935))

(declare-fun m!238937 () Bool)

(assert (=> d!57925 m!238937))

(declare-fun m!238939 () Bool)

(assert (=> d!57925 m!238939))

(declare-fun m!238941 () Bool)

(assert (=> b!211628 m!238941))

(declare-fun m!238943 () Bool)

(assert (=> b!211629 m!238943))

(assert (=> b!211537 d!57925))

(declare-fun d!57927 () Bool)

(assert (=> d!57927 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211536 d!57927))

(declare-fun d!57929 () Bool)

(declare-fun res!103391 () Bool)

(declare-fun e!137732 () Bool)

(assert (=> d!57929 (=> res!103391 e!137732)))

(assert (=> d!57929 (= res!103391 (bvsge #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(assert (=> d!57929 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!137732)))

(declare-fun bm!20016 () Bool)

(declare-fun call!20019 () Bool)

(assert (=> bm!20016 (= call!20019 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!211638 () Bool)

(declare-fun e!137730 () Bool)

(assert (=> b!211638 (= e!137730 call!20019)))

(declare-fun b!211639 () Bool)

(assert (=> b!211639 (= e!137732 e!137730)))

(declare-fun c!35706 () Bool)

(assert (=> b!211639 (= c!35706 (validKeyInArray!0 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211640 () Bool)

(declare-fun e!137731 () Bool)

(assert (=> b!211640 (= e!137730 e!137731)))

(declare-fun lt!108788 () (_ BitVec 64))

(assert (=> b!211640 (= lt!108788 (select (arr!4782 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108789 () Unit!6388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10077 (_ BitVec 64) (_ BitVec 32)) Unit!6388)

(assert (=> b!211640 (= lt!108789 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!108788 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!211640 (arrayContainsKey!0 _keys!825 lt!108788 #b00000000000000000000000000000000)))

(declare-fun lt!108790 () Unit!6388)

(assert (=> b!211640 (= lt!108790 lt!108789)))

(declare-fun res!103392 () Bool)

(declare-datatypes ((SeekEntryResult!711 0))(
  ( (MissingZero!711 (index!5014 (_ BitVec 32))) (Found!711 (index!5015 (_ BitVec 32))) (Intermediate!711 (undefined!1523 Bool) (index!5016 (_ BitVec 32)) (x!22126 (_ BitVec 32))) (Undefined!711) (MissingVacant!711 (index!5017 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10077 (_ BitVec 32)) SeekEntryResult!711)

(assert (=> b!211640 (= res!103392 (= (seekEntryOrOpen!0 (select (arr!4782 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!711 #b00000000000000000000000000000000)))))

(assert (=> b!211640 (=> (not res!103392) (not e!137731))))

(declare-fun b!211641 () Bool)

(assert (=> b!211641 (= e!137731 call!20019)))

(assert (= (and d!57929 (not res!103391)) b!211639))

(assert (= (and b!211639 c!35706) b!211640))

(assert (= (and b!211639 (not c!35706)) b!211638))

(assert (= (and b!211640 res!103392) b!211641))

(assert (= (or b!211641 b!211638) bm!20016))

(declare-fun m!238945 () Bool)

(assert (=> bm!20016 m!238945))

(declare-fun m!238947 () Bool)

(assert (=> b!211639 m!238947))

(assert (=> b!211639 m!238947))

(declare-fun m!238949 () Bool)

(assert (=> b!211639 m!238949))

(assert (=> b!211640 m!238947))

(declare-fun m!238951 () Bool)

(assert (=> b!211640 m!238951))

(declare-fun m!238953 () Bool)

(assert (=> b!211640 m!238953))

(assert (=> b!211640 m!238947))

(declare-fun m!238955 () Bool)

(assert (=> b!211640 m!238955))

(assert (=> b!211533 d!57929))

(declare-fun b!211666 () Bool)

(declare-fun res!103401 () Bool)

(declare-fun e!137753 () Bool)

(assert (=> b!211666 (=> (not res!103401) (not e!137753))))

(declare-fun lt!108807 () ListLongMap!3061)

(assert (=> b!211666 (= res!103401 (not (contains!1385 lt!108807 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!211667 () Bool)

(declare-fun e!137747 () Bool)

(assert (=> b!211667 (= e!137753 e!137747)))

(declare-fun c!35716 () Bool)

(declare-fun e!137750 () Bool)

(assert (=> b!211667 (= c!35716 e!137750)))

(declare-fun res!103404 () Bool)

(assert (=> b!211667 (=> (not res!103404) (not e!137750))))

(assert (=> b!211667 (= res!103404 (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(declare-fun b!211668 () Bool)

(declare-fun e!137751 () ListLongMap!3061)

(declare-fun call!20022 () ListLongMap!3061)

(assert (=> b!211668 (= e!137751 call!20022)))

(declare-fun b!211669 () Bool)

(declare-fun e!137749 () ListLongMap!3061)

(assert (=> b!211669 (= e!137749 (ListLongMap!3062 Nil!3063))))

(declare-fun b!211670 () Bool)

(assert (=> b!211670 (= e!137749 e!137751)))

(declare-fun c!35718 () Bool)

(assert (=> b!211670 (= c!35718 (validKeyInArray!0 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211671 () Bool)

(assert (=> b!211671 (= e!137750 (validKeyInArray!0 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211671 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!57931 () Bool)

(assert (=> d!57931 e!137753))

(declare-fun res!103403 () Bool)

(assert (=> d!57931 (=> (not res!103403) (not e!137753))))

(assert (=> d!57931 (= res!103403 (not (contains!1385 lt!108807 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57931 (= lt!108807 e!137749)))

(declare-fun c!35717 () Bool)

(assert (=> d!57931 (= c!35717 (bvsge #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(assert (=> d!57931 (validMask!0 mask!1149)))

(assert (=> d!57931 (= (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108710 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108807)))

(declare-fun b!211672 () Bool)

(declare-fun e!137752 () Bool)

(declare-fun isEmpty!500 (ListLongMap!3061) Bool)

(assert (=> b!211672 (= e!137752 (isEmpty!500 lt!108807))))

(declare-fun b!211673 () Bool)

(declare-fun lt!108811 () Unit!6388)

(declare-fun lt!108809 () Unit!6388)

(assert (=> b!211673 (= lt!108811 lt!108809)))

(declare-fun lt!108806 () (_ BitVec 64))

(declare-fun lt!108810 () ListLongMap!3061)

(declare-fun lt!108805 () V!6905)

(declare-fun lt!108808 () (_ BitVec 64))

(assert (=> b!211673 (not (contains!1385 (+!570 lt!108810 (tuple2!4159 lt!108806 lt!108805)) lt!108808))))

(declare-fun addStillNotContains!105 (ListLongMap!3061 (_ BitVec 64) V!6905 (_ BitVec 64)) Unit!6388)

(assert (=> b!211673 (= lt!108809 (addStillNotContains!105 lt!108810 lt!108806 lt!108805 lt!108808))))

(assert (=> b!211673 (= lt!108808 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!2559 (ValueCell!2378 V!6905) V!6905)

(declare-fun dynLambda!529 (Int (_ BitVec 64)) V!6905)

(assert (=> b!211673 (= lt!108805 (get!2559 (select (arr!4783 lt!108710) #b00000000000000000000000000000000) (dynLambda!529 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211673 (= lt!108806 (select (arr!4782 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211673 (= lt!108810 call!20022)))

(assert (=> b!211673 (= e!137751 (+!570 call!20022 (tuple2!4159 (select (arr!4782 _keys!825) #b00000000000000000000000000000000) (get!2559 (select (arr!4783 lt!108710) #b00000000000000000000000000000000) (dynLambda!529 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!211674 () Bool)

(assert (=> b!211674 (= e!137752 (= lt!108807 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108710 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211675 () Bool)

(assert (=> b!211675 (= e!137747 e!137752)))

(declare-fun c!35715 () Bool)

(assert (=> b!211675 (= c!35715 (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(declare-fun bm!20019 () Bool)

(assert (=> bm!20019 (= call!20022 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108710 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!211676 () Bool)

(assert (=> b!211676 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(assert (=> b!211676 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5109 lt!108710)))))

(declare-fun e!137748 () Bool)

(declare-fun apply!195 (ListLongMap!3061 (_ BitVec 64)) V!6905)

(assert (=> b!211676 (= e!137748 (= (apply!195 lt!108807 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)) (get!2559 (select (arr!4783 lt!108710) #b00000000000000000000000000000000) (dynLambda!529 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!211677 () Bool)

(assert (=> b!211677 (= e!137747 e!137748)))

(assert (=> b!211677 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(declare-fun res!103402 () Bool)

(assert (=> b!211677 (= res!103402 (contains!1385 lt!108807 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211677 (=> (not res!103402) (not e!137748))))

(assert (= (and d!57931 c!35717) b!211669))

(assert (= (and d!57931 (not c!35717)) b!211670))

(assert (= (and b!211670 c!35718) b!211673))

(assert (= (and b!211670 (not c!35718)) b!211668))

(assert (= (or b!211673 b!211668) bm!20019))

(assert (= (and d!57931 res!103403) b!211666))

(assert (= (and b!211666 res!103401) b!211667))

(assert (= (and b!211667 res!103404) b!211671))

(assert (= (and b!211667 c!35716) b!211677))

(assert (= (and b!211667 (not c!35716)) b!211675))

(assert (= (and b!211677 res!103402) b!211676))

(assert (= (and b!211675 c!35715) b!211674))

(assert (= (and b!211675 (not c!35715)) b!211672))

(declare-fun b_lambda!7665 () Bool)

(assert (=> (not b_lambda!7665) (not b!211673)))

(declare-fun t!8003 () Bool)

(declare-fun tb!2895 () Bool)

(assert (=> (and start!21054 (= defaultEntry!657 defaultEntry!657) t!8003) tb!2895))

(declare-fun result!4989 () Bool)

(assert (=> tb!2895 (= result!4989 tp_is_empty!5443)))

(assert (=> b!211673 t!8003))

(declare-fun b_and!12379 () Bool)

(assert (= b_and!12373 (and (=> t!8003 result!4989) b_and!12379)))

(declare-fun b_lambda!7667 () Bool)

(assert (=> (not b_lambda!7667) (not b!211676)))

(assert (=> b!211676 t!8003))

(declare-fun b_and!12381 () Bool)

(assert (= b_and!12379 (and (=> t!8003 result!4989) b_and!12381)))

(assert (=> b!211676 m!238947))

(assert (=> b!211676 m!238947))

(declare-fun m!238957 () Bool)

(assert (=> b!211676 m!238957))

(declare-fun m!238959 () Bool)

(assert (=> b!211676 m!238959))

(assert (=> b!211676 m!238959))

(declare-fun m!238961 () Bool)

(assert (=> b!211676 m!238961))

(declare-fun m!238963 () Bool)

(assert (=> b!211676 m!238963))

(assert (=> b!211676 m!238961))

(declare-fun m!238965 () Bool)

(assert (=> bm!20019 m!238965))

(declare-fun m!238967 () Bool)

(assert (=> b!211672 m!238967))

(declare-fun m!238969 () Bool)

(assert (=> d!57931 m!238969))

(assert (=> d!57931 m!238833))

(assert (=> b!211677 m!238947))

(assert (=> b!211677 m!238947))

(declare-fun m!238971 () Bool)

(assert (=> b!211677 m!238971))

(assert (=> b!211671 m!238947))

(assert (=> b!211671 m!238947))

(assert (=> b!211671 m!238949))

(assert (=> b!211673 m!238947))

(declare-fun m!238973 () Bool)

(assert (=> b!211673 m!238973))

(assert (=> b!211673 m!238959))

(declare-fun m!238975 () Bool)

(assert (=> b!211673 m!238975))

(declare-fun m!238977 () Bool)

(assert (=> b!211673 m!238977))

(assert (=> b!211673 m!238959))

(assert (=> b!211673 m!238961))

(assert (=> b!211673 m!238963))

(assert (=> b!211673 m!238961))

(assert (=> b!211673 m!238977))

(declare-fun m!238979 () Bool)

(assert (=> b!211673 m!238979))

(declare-fun m!238981 () Bool)

(assert (=> b!211666 m!238981))

(assert (=> b!211674 m!238965))

(assert (=> b!211670 m!238947))

(assert (=> b!211670 m!238947))

(assert (=> b!211670 m!238949))

(assert (=> b!211541 d!57931))

(declare-fun b!211680 () Bool)

(declare-fun res!103405 () Bool)

(declare-fun e!137760 () Bool)

(assert (=> b!211680 (=> (not res!103405) (not e!137760))))

(declare-fun lt!108814 () ListLongMap!3061)

(assert (=> b!211680 (= res!103405 (not (contains!1385 lt!108814 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!211681 () Bool)

(declare-fun e!137754 () Bool)

(assert (=> b!211681 (= e!137760 e!137754)))

(declare-fun c!35720 () Bool)

(declare-fun e!137757 () Bool)

(assert (=> b!211681 (= c!35720 e!137757)))

(declare-fun res!103408 () Bool)

(assert (=> b!211681 (=> (not res!103408) (not e!137757))))

(assert (=> b!211681 (= res!103408 (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(declare-fun b!211682 () Bool)

(declare-fun e!137758 () ListLongMap!3061)

(declare-fun call!20023 () ListLongMap!3061)

(assert (=> b!211682 (= e!137758 call!20023)))

(declare-fun b!211683 () Bool)

(declare-fun e!137756 () ListLongMap!3061)

(assert (=> b!211683 (= e!137756 (ListLongMap!3062 Nil!3063))))

(declare-fun b!211684 () Bool)

(assert (=> b!211684 (= e!137756 e!137758)))

(declare-fun c!35722 () Bool)

(assert (=> b!211684 (= c!35722 (validKeyInArray!0 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211685 () Bool)

(assert (=> b!211685 (= e!137757 (validKeyInArray!0 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211685 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!57933 () Bool)

(assert (=> d!57933 e!137760))

(declare-fun res!103407 () Bool)

(assert (=> d!57933 (=> (not res!103407) (not e!137760))))

(assert (=> d!57933 (= res!103407 (not (contains!1385 lt!108814 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57933 (= lt!108814 e!137756)))

(declare-fun c!35721 () Bool)

(assert (=> d!57933 (= c!35721 (bvsge #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(assert (=> d!57933 (validMask!0 mask!1149)))

(assert (=> d!57933 (= (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108814)))

(declare-fun b!211686 () Bool)

(declare-fun e!137759 () Bool)

(assert (=> b!211686 (= e!137759 (isEmpty!500 lt!108814))))

(declare-fun b!211687 () Bool)

(declare-fun lt!108818 () Unit!6388)

(declare-fun lt!108816 () Unit!6388)

(assert (=> b!211687 (= lt!108818 lt!108816)))

(declare-fun lt!108817 () ListLongMap!3061)

(declare-fun lt!108812 () V!6905)

(declare-fun lt!108813 () (_ BitVec 64))

(declare-fun lt!108815 () (_ BitVec 64))

(assert (=> b!211687 (not (contains!1385 (+!570 lt!108817 (tuple2!4159 lt!108813 lt!108812)) lt!108815))))

(assert (=> b!211687 (= lt!108816 (addStillNotContains!105 lt!108817 lt!108813 lt!108812 lt!108815))))

(assert (=> b!211687 (= lt!108815 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!211687 (= lt!108812 (get!2559 (select (arr!4783 _values!649) #b00000000000000000000000000000000) (dynLambda!529 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211687 (= lt!108813 (select (arr!4782 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211687 (= lt!108817 call!20023)))

(assert (=> b!211687 (= e!137758 (+!570 call!20023 (tuple2!4159 (select (arr!4782 _keys!825) #b00000000000000000000000000000000) (get!2559 (select (arr!4783 _values!649) #b00000000000000000000000000000000) (dynLambda!529 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!211688 () Bool)

(assert (=> b!211688 (= e!137759 (= lt!108814 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!211689 () Bool)

(assert (=> b!211689 (= e!137754 e!137759)))

(declare-fun c!35719 () Bool)

(assert (=> b!211689 (= c!35719 (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(declare-fun bm!20020 () Bool)

(assert (=> bm!20020 (= call!20023 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!211690 () Bool)

(assert (=> b!211690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(assert (=> b!211690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5109 _values!649)))))

(declare-fun e!137755 () Bool)

(assert (=> b!211690 (= e!137755 (= (apply!195 lt!108814 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)) (get!2559 (select (arr!4783 _values!649) #b00000000000000000000000000000000) (dynLambda!529 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!211691 () Bool)

(assert (=> b!211691 (= e!137754 e!137755)))

(assert (=> b!211691 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(declare-fun res!103406 () Bool)

(assert (=> b!211691 (= res!103406 (contains!1385 lt!108814 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211691 (=> (not res!103406) (not e!137755))))

(assert (= (and d!57933 c!35721) b!211683))

(assert (= (and d!57933 (not c!35721)) b!211684))

(assert (= (and b!211684 c!35722) b!211687))

(assert (= (and b!211684 (not c!35722)) b!211682))

(assert (= (or b!211687 b!211682) bm!20020))

(assert (= (and d!57933 res!103407) b!211680))

(assert (= (and b!211680 res!103405) b!211681))

(assert (= (and b!211681 res!103408) b!211685))

(assert (= (and b!211681 c!35720) b!211691))

(assert (= (and b!211681 (not c!35720)) b!211689))

(assert (= (and b!211691 res!103406) b!211690))

(assert (= (and b!211689 c!35719) b!211688))

(assert (= (and b!211689 (not c!35719)) b!211686))

(declare-fun b_lambda!7669 () Bool)

(assert (=> (not b_lambda!7669) (not b!211687)))

(assert (=> b!211687 t!8003))

(declare-fun b_and!12383 () Bool)

(assert (= b_and!12381 (and (=> t!8003 result!4989) b_and!12383)))

(declare-fun b_lambda!7671 () Bool)

(assert (=> (not b_lambda!7671) (not b!211690)))

(assert (=> b!211690 t!8003))

(declare-fun b_and!12385 () Bool)

(assert (= b_and!12383 (and (=> t!8003 result!4989) b_and!12385)))

(assert (=> b!211690 m!238947))

(assert (=> b!211690 m!238947))

(declare-fun m!238983 () Bool)

(assert (=> b!211690 m!238983))

(declare-fun m!238985 () Bool)

(assert (=> b!211690 m!238985))

(assert (=> b!211690 m!238985))

(assert (=> b!211690 m!238961))

(declare-fun m!238987 () Bool)

(assert (=> b!211690 m!238987))

(assert (=> b!211690 m!238961))

(declare-fun m!238989 () Bool)

(assert (=> bm!20020 m!238989))

(declare-fun m!238991 () Bool)

(assert (=> b!211686 m!238991))

(declare-fun m!238993 () Bool)

(assert (=> d!57933 m!238993))

(assert (=> d!57933 m!238833))

(assert (=> b!211691 m!238947))

(assert (=> b!211691 m!238947))

(declare-fun m!238995 () Bool)

(assert (=> b!211691 m!238995))

(assert (=> b!211685 m!238947))

(assert (=> b!211685 m!238947))

(assert (=> b!211685 m!238949))

(assert (=> b!211687 m!238947))

(declare-fun m!238997 () Bool)

(assert (=> b!211687 m!238997))

(assert (=> b!211687 m!238985))

(declare-fun m!238999 () Bool)

(assert (=> b!211687 m!238999))

(declare-fun m!239001 () Bool)

(assert (=> b!211687 m!239001))

(assert (=> b!211687 m!238985))

(assert (=> b!211687 m!238961))

(assert (=> b!211687 m!238987))

(assert (=> b!211687 m!238961))

(assert (=> b!211687 m!239001))

(declare-fun m!239003 () Bool)

(assert (=> b!211687 m!239003))

(declare-fun m!239005 () Bool)

(assert (=> b!211680 m!239005))

(assert (=> b!211688 m!238989))

(assert (=> b!211684 m!238947))

(assert (=> b!211684 m!238947))

(assert (=> b!211684 m!238949))

(assert (=> b!211541 d!57933))

(declare-fun b!211734 () Bool)

(declare-fun c!35736 () Bool)

(assert (=> b!211734 (= c!35736 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!137799 () ListLongMap!3061)

(declare-fun e!137788 () ListLongMap!3061)

(assert (=> b!211734 (= e!137799 e!137788)))

(declare-fun c!35737 () Bool)

(declare-fun bm!20035 () Bool)

(declare-fun c!35739 () Bool)

(declare-fun call!20043 () ListLongMap!3061)

(declare-fun call!20041 () ListLongMap!3061)

(declare-fun call!20044 () ListLongMap!3061)

(declare-fun call!20039 () ListLongMap!3061)

(assert (=> bm!20035 (= call!20041 (+!570 (ite c!35737 call!20043 (ite c!35739 call!20044 call!20039)) (ite (or c!35737 c!35739) (tuple2!4159 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4159 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!211736 () Bool)

(declare-fun e!137787 () ListLongMap!3061)

(assert (=> b!211736 (= e!137787 e!137799)))

(assert (=> b!211736 (= c!35739 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211737 () Bool)

(declare-fun res!103434 () Bool)

(declare-fun e!137796 () Bool)

(assert (=> b!211737 (=> (not res!103434) (not e!137796))))

(declare-fun e!137791 () Bool)

(assert (=> b!211737 (= res!103434 e!137791)))

(declare-fun c!35738 () Bool)

(assert (=> b!211737 (= c!35738 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!211738 () Bool)

(declare-fun e!137794 () Bool)

(assert (=> b!211738 (= e!137794 (validKeyInArray!0 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20036 () Bool)

(declare-fun call!20038 () Bool)

(declare-fun lt!108882 () ListLongMap!3061)

(assert (=> bm!20036 (= call!20038 (contains!1385 lt!108882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211739 () Bool)

(assert (=> b!211739 (= e!137787 (+!570 call!20041 (tuple2!4159 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!20037 () Bool)

(declare-fun call!20040 () ListLongMap!3061)

(assert (=> bm!20037 (= call!20040 call!20041)))

(declare-fun b!211740 () Bool)

(declare-fun res!103433 () Bool)

(assert (=> b!211740 (=> (not res!103433) (not e!137796))))

(declare-fun e!137792 () Bool)

(assert (=> b!211740 (= res!103433 e!137792)))

(declare-fun res!103435 () Bool)

(assert (=> b!211740 (=> res!103435 e!137792)))

(declare-fun e!137798 () Bool)

(assert (=> b!211740 (= res!103435 (not e!137798))))

(declare-fun res!103427 () Bool)

(assert (=> b!211740 (=> (not res!103427) (not e!137798))))

(assert (=> b!211740 (= res!103427 (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(declare-fun b!211741 () Bool)

(declare-fun e!137790 () Bool)

(declare-fun call!20042 () Bool)

(assert (=> b!211741 (= e!137790 (not call!20042))))

(declare-fun b!211742 () Bool)

(declare-fun e!137789 () Bool)

(assert (=> b!211742 (= e!137790 e!137789)))

(declare-fun res!103428 () Bool)

(assert (=> b!211742 (= res!103428 call!20042)))

(assert (=> b!211742 (=> (not res!103428) (not e!137789))))

(declare-fun b!211743 () Bool)

(declare-fun e!137795 () Unit!6388)

(declare-fun Unit!6390 () Unit!6388)

(assert (=> b!211743 (= e!137795 Unit!6390)))

(declare-fun d!57935 () Bool)

(assert (=> d!57935 e!137796))

(declare-fun res!103430 () Bool)

(assert (=> d!57935 (=> (not res!103430) (not e!137796))))

(assert (=> d!57935 (= res!103430 (or (bvsge #b00000000000000000000000000000000 (size!5108 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))))

(declare-fun lt!108865 () ListLongMap!3061)

(assert (=> d!57935 (= lt!108882 lt!108865)))

(declare-fun lt!108883 () Unit!6388)

(assert (=> d!57935 (= lt!108883 e!137795)))

(declare-fun c!35735 () Bool)

(assert (=> d!57935 (= c!35735 e!137794)))

(declare-fun res!103431 () Bool)

(assert (=> d!57935 (=> (not res!103431) (not e!137794))))

(assert (=> d!57935 (= res!103431 (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(assert (=> d!57935 (= lt!108865 e!137787)))

(assert (=> d!57935 (= c!35737 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57935 (validMask!0 mask!1149)))

(assert (=> d!57935 (= (getCurrentListMap!1058 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108882)))

(declare-fun b!211735 () Bool)

(declare-fun e!137797 () Bool)

(assert (=> b!211735 (= e!137792 e!137797)))

(declare-fun res!103429 () Bool)

(assert (=> b!211735 (=> (not res!103429) (not e!137797))))

(assert (=> b!211735 (= res!103429 (contains!1385 lt!108882 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211735 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(declare-fun b!211744 () Bool)

(declare-fun e!137793 () Bool)

(assert (=> b!211744 (= e!137791 e!137793)))

(declare-fun res!103432 () Bool)

(assert (=> b!211744 (= res!103432 call!20038)))

(assert (=> b!211744 (=> (not res!103432) (not e!137793))))

(declare-fun b!211745 () Bool)

(assert (=> b!211745 (= e!137789 (= (apply!195 lt!108882 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!211746 () Bool)

(declare-fun lt!108864 () Unit!6388)

(assert (=> b!211746 (= e!137795 lt!108864)))

(declare-fun lt!108867 () ListLongMap!3061)

(assert (=> b!211746 (= lt!108867 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108869 () (_ BitVec 64))

(assert (=> b!211746 (= lt!108869 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108873 () (_ BitVec 64))

(assert (=> b!211746 (= lt!108873 (select (arr!4782 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108874 () Unit!6388)

(declare-fun addStillContains!171 (ListLongMap!3061 (_ BitVec 64) V!6905 (_ BitVec 64)) Unit!6388)

(assert (=> b!211746 (= lt!108874 (addStillContains!171 lt!108867 lt!108869 zeroValue!615 lt!108873))))

(assert (=> b!211746 (contains!1385 (+!570 lt!108867 (tuple2!4159 lt!108869 zeroValue!615)) lt!108873)))

(declare-fun lt!108881 () Unit!6388)

(assert (=> b!211746 (= lt!108881 lt!108874)))

(declare-fun lt!108868 () ListLongMap!3061)

(assert (=> b!211746 (= lt!108868 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108880 () (_ BitVec 64))

(assert (=> b!211746 (= lt!108880 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108871 () (_ BitVec 64))

(assert (=> b!211746 (= lt!108871 (select (arr!4782 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108875 () Unit!6388)

(declare-fun addApplyDifferent!171 (ListLongMap!3061 (_ BitVec 64) V!6905 (_ BitVec 64)) Unit!6388)

(assert (=> b!211746 (= lt!108875 (addApplyDifferent!171 lt!108868 lt!108880 minValue!615 lt!108871))))

(assert (=> b!211746 (= (apply!195 (+!570 lt!108868 (tuple2!4159 lt!108880 minValue!615)) lt!108871) (apply!195 lt!108868 lt!108871))))

(declare-fun lt!108879 () Unit!6388)

(assert (=> b!211746 (= lt!108879 lt!108875)))

(declare-fun lt!108878 () ListLongMap!3061)

(assert (=> b!211746 (= lt!108878 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108866 () (_ BitVec 64))

(assert (=> b!211746 (= lt!108866 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108870 () (_ BitVec 64))

(assert (=> b!211746 (= lt!108870 (select (arr!4782 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108877 () Unit!6388)

(assert (=> b!211746 (= lt!108877 (addApplyDifferent!171 lt!108878 lt!108866 zeroValue!615 lt!108870))))

(assert (=> b!211746 (= (apply!195 (+!570 lt!108878 (tuple2!4159 lt!108866 zeroValue!615)) lt!108870) (apply!195 lt!108878 lt!108870))))

(declare-fun lt!108863 () Unit!6388)

(assert (=> b!211746 (= lt!108863 lt!108877)))

(declare-fun lt!108884 () ListLongMap!3061)

(assert (=> b!211746 (= lt!108884 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108876 () (_ BitVec 64))

(assert (=> b!211746 (= lt!108876 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108872 () (_ BitVec 64))

(assert (=> b!211746 (= lt!108872 (select (arr!4782 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211746 (= lt!108864 (addApplyDifferent!171 lt!108884 lt!108876 minValue!615 lt!108872))))

(assert (=> b!211746 (= (apply!195 (+!570 lt!108884 (tuple2!4159 lt!108876 minValue!615)) lt!108872) (apply!195 lt!108884 lt!108872))))

(declare-fun bm!20038 () Bool)

(assert (=> bm!20038 (= call!20039 call!20044)))

(declare-fun b!211747 () Bool)

(assert (=> b!211747 (= e!137791 (not call!20038))))

(declare-fun bm!20039 () Bool)

(assert (=> bm!20039 (= call!20042 (contains!1385 lt!108882 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211748 () Bool)

(assert (=> b!211748 (= e!137798 (validKeyInArray!0 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211749 () Bool)

(assert (=> b!211749 (= e!137788 call!20039)))

(declare-fun bm!20040 () Bool)

(assert (=> bm!20040 (= call!20044 call!20043)))

(declare-fun b!211750 () Bool)

(assert (=> b!211750 (= e!137797 (= (apply!195 lt!108882 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)) (get!2559 (select (arr!4783 _values!649) #b00000000000000000000000000000000) (dynLambda!529 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211750 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5109 _values!649)))))

(assert (=> b!211750 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(declare-fun b!211751 () Bool)

(assert (=> b!211751 (= e!137796 e!137790)))

(declare-fun c!35740 () Bool)

(assert (=> b!211751 (= c!35740 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211752 () Bool)

(assert (=> b!211752 (= e!137788 call!20040)))

(declare-fun b!211753 () Bool)

(assert (=> b!211753 (= e!137793 (= (apply!195 lt!108882 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!20041 () Bool)

(assert (=> bm!20041 (= call!20043 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211754 () Bool)

(assert (=> b!211754 (= e!137799 call!20040)))

(assert (= (and d!57935 c!35737) b!211739))

(assert (= (and d!57935 (not c!35737)) b!211736))

(assert (= (and b!211736 c!35739) b!211754))

(assert (= (and b!211736 (not c!35739)) b!211734))

(assert (= (and b!211734 c!35736) b!211752))

(assert (= (and b!211734 (not c!35736)) b!211749))

(assert (= (or b!211752 b!211749) bm!20038))

(assert (= (or b!211754 bm!20038) bm!20040))

(assert (= (or b!211754 b!211752) bm!20037))

(assert (= (or b!211739 bm!20040) bm!20041))

(assert (= (or b!211739 bm!20037) bm!20035))

(assert (= (and d!57935 res!103431) b!211738))

(assert (= (and d!57935 c!35735) b!211746))

(assert (= (and d!57935 (not c!35735)) b!211743))

(assert (= (and d!57935 res!103430) b!211740))

(assert (= (and b!211740 res!103427) b!211748))

(assert (= (and b!211740 (not res!103435)) b!211735))

(assert (= (and b!211735 res!103429) b!211750))

(assert (= (and b!211740 res!103433) b!211737))

(assert (= (and b!211737 c!35738) b!211744))

(assert (= (and b!211737 (not c!35738)) b!211747))

(assert (= (and b!211744 res!103432) b!211753))

(assert (= (or b!211744 b!211747) bm!20036))

(assert (= (and b!211737 res!103434) b!211751))

(assert (= (and b!211751 c!35740) b!211742))

(assert (= (and b!211751 (not c!35740)) b!211741))

(assert (= (and b!211742 res!103428) b!211745))

(assert (= (or b!211742 b!211741) bm!20039))

(declare-fun b_lambda!7673 () Bool)

(assert (=> (not b_lambda!7673) (not b!211750)))

(assert (=> b!211750 t!8003))

(declare-fun b_and!12387 () Bool)

(assert (= b_and!12385 (and (=> t!8003 result!4989) b_and!12387)))

(declare-fun m!239007 () Bool)

(assert (=> bm!20036 m!239007))

(declare-fun m!239009 () Bool)

(assert (=> b!211739 m!239009))

(assert (=> b!211735 m!238947))

(assert (=> b!211735 m!238947))

(declare-fun m!239011 () Bool)

(assert (=> b!211735 m!239011))

(declare-fun m!239013 () Bool)

(assert (=> bm!20035 m!239013))

(declare-fun m!239015 () Bool)

(assert (=> b!211746 m!239015))

(declare-fun m!239017 () Bool)

(assert (=> b!211746 m!239017))

(declare-fun m!239019 () Bool)

(assert (=> b!211746 m!239019))

(declare-fun m!239021 () Bool)

(assert (=> b!211746 m!239021))

(declare-fun m!239023 () Bool)

(assert (=> b!211746 m!239023))

(declare-fun m!239025 () Bool)

(assert (=> b!211746 m!239025))

(declare-fun m!239027 () Bool)

(assert (=> b!211746 m!239027))

(assert (=> b!211746 m!238827))

(declare-fun m!239029 () Bool)

(assert (=> b!211746 m!239029))

(assert (=> b!211746 m!239019))

(declare-fun m!239031 () Bool)

(assert (=> b!211746 m!239031))

(assert (=> b!211746 m!239021))

(declare-fun m!239033 () Bool)

(assert (=> b!211746 m!239033))

(assert (=> b!211746 m!238947))

(declare-fun m!239035 () Bool)

(assert (=> b!211746 m!239035))

(declare-fun m!239037 () Bool)

(assert (=> b!211746 m!239037))

(declare-fun m!239039 () Bool)

(assert (=> b!211746 m!239039))

(assert (=> b!211746 m!239023))

(declare-fun m!239041 () Bool)

(assert (=> b!211746 m!239041))

(assert (=> b!211746 m!239015))

(declare-fun m!239043 () Bool)

(assert (=> b!211746 m!239043))

(assert (=> d!57935 m!238833))

(assert (=> b!211738 m!238947))

(assert (=> b!211738 m!238947))

(assert (=> b!211738 m!238949))

(assert (=> b!211750 m!238985))

(assert (=> b!211750 m!238961))

(assert (=> b!211750 m!238987))

(assert (=> b!211750 m!238961))

(assert (=> b!211750 m!238947))

(assert (=> b!211750 m!238947))

(declare-fun m!239045 () Bool)

(assert (=> b!211750 m!239045))

(assert (=> b!211750 m!238985))

(declare-fun m!239047 () Bool)

(assert (=> b!211753 m!239047))

(declare-fun m!239049 () Bool)

(assert (=> b!211745 m!239049))

(assert (=> bm!20041 m!238827))

(assert (=> b!211748 m!238947))

(assert (=> b!211748 m!238947))

(assert (=> b!211748 m!238949))

(declare-fun m!239051 () Bool)

(assert (=> bm!20039 m!239051))

(assert (=> b!211541 d!57935))

(declare-fun b!211755 () Bool)

(declare-fun c!35742 () Bool)

(assert (=> b!211755 (= c!35742 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!137812 () ListLongMap!3061)

(declare-fun e!137801 () ListLongMap!3061)

(assert (=> b!211755 (= e!137812 e!137801)))

(declare-fun c!35743 () Bool)

(declare-fun bm!20042 () Bool)

(declare-fun call!20048 () ListLongMap!3061)

(declare-fun call!20050 () ListLongMap!3061)

(declare-fun call!20046 () ListLongMap!3061)

(declare-fun call!20051 () ListLongMap!3061)

(declare-fun c!35745 () Bool)

(assert (=> bm!20042 (= call!20048 (+!570 (ite c!35743 call!20050 (ite c!35745 call!20051 call!20046)) (ite (or c!35743 c!35745) (tuple2!4159 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4159 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!211757 () Bool)

(declare-fun e!137800 () ListLongMap!3061)

(assert (=> b!211757 (= e!137800 e!137812)))

(assert (=> b!211757 (= c!35745 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211758 () Bool)

(declare-fun res!103443 () Bool)

(declare-fun e!137809 () Bool)

(assert (=> b!211758 (=> (not res!103443) (not e!137809))))

(declare-fun e!137804 () Bool)

(assert (=> b!211758 (= res!103443 e!137804)))

(declare-fun c!35744 () Bool)

(assert (=> b!211758 (= c!35744 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!211759 () Bool)

(declare-fun e!137807 () Bool)

(assert (=> b!211759 (= e!137807 (validKeyInArray!0 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20043 () Bool)

(declare-fun call!20045 () Bool)

(declare-fun lt!108904 () ListLongMap!3061)

(assert (=> bm!20043 (= call!20045 (contains!1385 lt!108904 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211760 () Bool)

(assert (=> b!211760 (= e!137800 (+!570 call!20048 (tuple2!4159 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun bm!20044 () Bool)

(declare-fun call!20047 () ListLongMap!3061)

(assert (=> bm!20044 (= call!20047 call!20048)))

(declare-fun b!211761 () Bool)

(declare-fun res!103442 () Bool)

(assert (=> b!211761 (=> (not res!103442) (not e!137809))))

(declare-fun e!137805 () Bool)

(assert (=> b!211761 (= res!103442 e!137805)))

(declare-fun res!103444 () Bool)

(assert (=> b!211761 (=> res!103444 e!137805)))

(declare-fun e!137811 () Bool)

(assert (=> b!211761 (= res!103444 (not e!137811))))

(declare-fun res!103436 () Bool)

(assert (=> b!211761 (=> (not res!103436) (not e!137811))))

(assert (=> b!211761 (= res!103436 (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(declare-fun b!211762 () Bool)

(declare-fun e!137803 () Bool)

(declare-fun call!20049 () Bool)

(assert (=> b!211762 (= e!137803 (not call!20049))))

(declare-fun b!211763 () Bool)

(declare-fun e!137802 () Bool)

(assert (=> b!211763 (= e!137803 e!137802)))

(declare-fun res!103437 () Bool)

(assert (=> b!211763 (= res!103437 call!20049)))

(assert (=> b!211763 (=> (not res!103437) (not e!137802))))

(declare-fun b!211764 () Bool)

(declare-fun e!137808 () Unit!6388)

(declare-fun Unit!6391 () Unit!6388)

(assert (=> b!211764 (= e!137808 Unit!6391)))

(declare-fun d!57937 () Bool)

(assert (=> d!57937 e!137809))

(declare-fun res!103439 () Bool)

(assert (=> d!57937 (=> (not res!103439) (not e!137809))))

(assert (=> d!57937 (= res!103439 (or (bvsge #b00000000000000000000000000000000 (size!5108 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))))

(declare-fun lt!108887 () ListLongMap!3061)

(assert (=> d!57937 (= lt!108904 lt!108887)))

(declare-fun lt!108905 () Unit!6388)

(assert (=> d!57937 (= lt!108905 e!137808)))

(declare-fun c!35741 () Bool)

(assert (=> d!57937 (= c!35741 e!137807)))

(declare-fun res!103440 () Bool)

(assert (=> d!57937 (=> (not res!103440) (not e!137807))))

(assert (=> d!57937 (= res!103440 (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(assert (=> d!57937 (= lt!108887 e!137800)))

(assert (=> d!57937 (= c!35743 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57937 (validMask!0 mask!1149)))

(assert (=> d!57937 (= (getCurrentListMap!1058 _keys!825 lt!108710 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!108904)))

(declare-fun b!211756 () Bool)

(declare-fun e!137810 () Bool)

(assert (=> b!211756 (= e!137805 e!137810)))

(declare-fun res!103438 () Bool)

(assert (=> b!211756 (=> (not res!103438) (not e!137810))))

(assert (=> b!211756 (= res!103438 (contains!1385 lt!108904 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!211756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(declare-fun b!211765 () Bool)

(declare-fun e!137806 () Bool)

(assert (=> b!211765 (= e!137804 e!137806)))

(declare-fun res!103441 () Bool)

(assert (=> b!211765 (= res!103441 call!20045)))

(assert (=> b!211765 (=> (not res!103441) (not e!137806))))

(declare-fun b!211766 () Bool)

(assert (=> b!211766 (= e!137802 (= (apply!195 lt!108904 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!211767 () Bool)

(declare-fun lt!108886 () Unit!6388)

(assert (=> b!211767 (= e!137808 lt!108886)))

(declare-fun lt!108889 () ListLongMap!3061)

(assert (=> b!211767 (= lt!108889 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108710 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108891 () (_ BitVec 64))

(assert (=> b!211767 (= lt!108891 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108895 () (_ BitVec 64))

(assert (=> b!211767 (= lt!108895 (select (arr!4782 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108896 () Unit!6388)

(assert (=> b!211767 (= lt!108896 (addStillContains!171 lt!108889 lt!108891 zeroValue!615 lt!108895))))

(assert (=> b!211767 (contains!1385 (+!570 lt!108889 (tuple2!4159 lt!108891 zeroValue!615)) lt!108895)))

(declare-fun lt!108903 () Unit!6388)

(assert (=> b!211767 (= lt!108903 lt!108896)))

(declare-fun lt!108890 () ListLongMap!3061)

(assert (=> b!211767 (= lt!108890 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108710 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108902 () (_ BitVec 64))

(assert (=> b!211767 (= lt!108902 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108893 () (_ BitVec 64))

(assert (=> b!211767 (= lt!108893 (select (arr!4782 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108897 () Unit!6388)

(assert (=> b!211767 (= lt!108897 (addApplyDifferent!171 lt!108890 lt!108902 minValue!615 lt!108893))))

(assert (=> b!211767 (= (apply!195 (+!570 lt!108890 (tuple2!4159 lt!108902 minValue!615)) lt!108893) (apply!195 lt!108890 lt!108893))))

(declare-fun lt!108901 () Unit!6388)

(assert (=> b!211767 (= lt!108901 lt!108897)))

(declare-fun lt!108900 () ListLongMap!3061)

(assert (=> b!211767 (= lt!108900 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108710 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108888 () (_ BitVec 64))

(assert (=> b!211767 (= lt!108888 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108892 () (_ BitVec 64))

(assert (=> b!211767 (= lt!108892 (select (arr!4782 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!108899 () Unit!6388)

(assert (=> b!211767 (= lt!108899 (addApplyDifferent!171 lt!108900 lt!108888 zeroValue!615 lt!108892))))

(assert (=> b!211767 (= (apply!195 (+!570 lt!108900 (tuple2!4159 lt!108888 zeroValue!615)) lt!108892) (apply!195 lt!108900 lt!108892))))

(declare-fun lt!108885 () Unit!6388)

(assert (=> b!211767 (= lt!108885 lt!108899)))

(declare-fun lt!108906 () ListLongMap!3061)

(assert (=> b!211767 (= lt!108906 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108710 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108898 () (_ BitVec 64))

(assert (=> b!211767 (= lt!108898 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108894 () (_ BitVec 64))

(assert (=> b!211767 (= lt!108894 (select (arr!4782 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!211767 (= lt!108886 (addApplyDifferent!171 lt!108906 lt!108898 minValue!615 lt!108894))))

(assert (=> b!211767 (= (apply!195 (+!570 lt!108906 (tuple2!4159 lt!108898 minValue!615)) lt!108894) (apply!195 lt!108906 lt!108894))))

(declare-fun bm!20045 () Bool)

(assert (=> bm!20045 (= call!20046 call!20051)))

(declare-fun b!211768 () Bool)

(assert (=> b!211768 (= e!137804 (not call!20045))))

(declare-fun bm!20046 () Bool)

(assert (=> bm!20046 (= call!20049 (contains!1385 lt!108904 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!211769 () Bool)

(assert (=> b!211769 (= e!137811 (validKeyInArray!0 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211770 () Bool)

(assert (=> b!211770 (= e!137801 call!20046)))

(declare-fun bm!20047 () Bool)

(assert (=> bm!20047 (= call!20051 call!20050)))

(declare-fun b!211771 () Bool)

(assert (=> b!211771 (= e!137810 (= (apply!195 lt!108904 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)) (get!2559 (select (arr!4783 lt!108710) #b00000000000000000000000000000000) (dynLambda!529 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211771 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5109 lt!108710)))))

(assert (=> b!211771 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(declare-fun b!211772 () Bool)

(assert (=> b!211772 (= e!137809 e!137803)))

(declare-fun c!35746 () Bool)

(assert (=> b!211772 (= c!35746 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!211773 () Bool)

(assert (=> b!211773 (= e!137801 call!20047)))

(declare-fun b!211774 () Bool)

(assert (=> b!211774 (= e!137806 (= (apply!195 lt!108904 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun bm!20048 () Bool)

(assert (=> bm!20048 (= call!20050 (getCurrentListMapNoExtraKeys!495 _keys!825 lt!108710 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211775 () Bool)

(assert (=> b!211775 (= e!137812 call!20047)))

(assert (= (and d!57937 c!35743) b!211760))

(assert (= (and d!57937 (not c!35743)) b!211757))

(assert (= (and b!211757 c!35745) b!211775))

(assert (= (and b!211757 (not c!35745)) b!211755))

(assert (= (and b!211755 c!35742) b!211773))

(assert (= (and b!211755 (not c!35742)) b!211770))

(assert (= (or b!211773 b!211770) bm!20045))

(assert (= (or b!211775 bm!20045) bm!20047))

(assert (= (or b!211775 b!211773) bm!20044))

(assert (= (or b!211760 bm!20047) bm!20048))

(assert (= (or b!211760 bm!20044) bm!20042))

(assert (= (and d!57937 res!103440) b!211759))

(assert (= (and d!57937 c!35741) b!211767))

(assert (= (and d!57937 (not c!35741)) b!211764))

(assert (= (and d!57937 res!103439) b!211761))

(assert (= (and b!211761 res!103436) b!211769))

(assert (= (and b!211761 (not res!103444)) b!211756))

(assert (= (and b!211756 res!103438) b!211771))

(assert (= (and b!211761 res!103442) b!211758))

(assert (= (and b!211758 c!35744) b!211765))

(assert (= (and b!211758 (not c!35744)) b!211768))

(assert (= (and b!211765 res!103441) b!211774))

(assert (= (or b!211765 b!211768) bm!20043))

(assert (= (and b!211758 res!103443) b!211772))

(assert (= (and b!211772 c!35746) b!211763))

(assert (= (and b!211772 (not c!35746)) b!211762))

(assert (= (and b!211763 res!103437) b!211766))

(assert (= (or b!211763 b!211762) bm!20046))

(declare-fun b_lambda!7675 () Bool)

(assert (=> (not b_lambda!7675) (not b!211771)))

(assert (=> b!211771 t!8003))

(declare-fun b_and!12389 () Bool)

(assert (= b_and!12387 (and (=> t!8003 result!4989) b_and!12389)))

(declare-fun m!239053 () Bool)

(assert (=> bm!20043 m!239053))

(declare-fun m!239055 () Bool)

(assert (=> b!211760 m!239055))

(assert (=> b!211756 m!238947))

(assert (=> b!211756 m!238947))

(declare-fun m!239057 () Bool)

(assert (=> b!211756 m!239057))

(declare-fun m!239059 () Bool)

(assert (=> bm!20042 m!239059))

(declare-fun m!239061 () Bool)

(assert (=> b!211767 m!239061))

(declare-fun m!239063 () Bool)

(assert (=> b!211767 m!239063))

(declare-fun m!239065 () Bool)

(assert (=> b!211767 m!239065))

(declare-fun m!239067 () Bool)

(assert (=> b!211767 m!239067))

(declare-fun m!239069 () Bool)

(assert (=> b!211767 m!239069))

(declare-fun m!239071 () Bool)

(assert (=> b!211767 m!239071))

(declare-fun m!239073 () Bool)

(assert (=> b!211767 m!239073))

(assert (=> b!211767 m!238819))

(declare-fun m!239075 () Bool)

(assert (=> b!211767 m!239075))

(assert (=> b!211767 m!239065))

(declare-fun m!239077 () Bool)

(assert (=> b!211767 m!239077))

(assert (=> b!211767 m!239067))

(declare-fun m!239079 () Bool)

(assert (=> b!211767 m!239079))

(assert (=> b!211767 m!238947))

(declare-fun m!239081 () Bool)

(assert (=> b!211767 m!239081))

(declare-fun m!239083 () Bool)

(assert (=> b!211767 m!239083))

(declare-fun m!239085 () Bool)

(assert (=> b!211767 m!239085))

(assert (=> b!211767 m!239069))

(declare-fun m!239087 () Bool)

(assert (=> b!211767 m!239087))

(assert (=> b!211767 m!239061))

(declare-fun m!239089 () Bool)

(assert (=> b!211767 m!239089))

(assert (=> d!57937 m!238833))

(assert (=> b!211759 m!238947))

(assert (=> b!211759 m!238947))

(assert (=> b!211759 m!238949))

(assert (=> b!211771 m!238959))

(assert (=> b!211771 m!238961))

(assert (=> b!211771 m!238963))

(assert (=> b!211771 m!238961))

(assert (=> b!211771 m!238947))

(assert (=> b!211771 m!238947))

(declare-fun m!239091 () Bool)

(assert (=> b!211771 m!239091))

(assert (=> b!211771 m!238959))

(declare-fun m!239093 () Bool)

(assert (=> b!211774 m!239093))

(declare-fun m!239095 () Bool)

(assert (=> b!211766 m!239095))

(assert (=> bm!20048 m!238819))

(assert (=> b!211769 m!238947))

(assert (=> b!211769 m!238947))

(assert (=> b!211769 m!238949))

(declare-fun m!239097 () Bool)

(assert (=> bm!20046 m!239097))

(assert (=> b!211541 d!57937))

(declare-fun d!57939 () Bool)

(declare-fun e!137813 () Bool)

(assert (=> d!57939 e!137813))

(declare-fun res!103445 () Bool)

(assert (=> d!57939 (=> (not res!103445) (not e!137813))))

(declare-fun lt!108909 () ListLongMap!3061)

(assert (=> d!57939 (= res!103445 (contains!1385 lt!108909 (_1!2090 (tuple2!4159 k0!843 v!520))))))

(declare-fun lt!108907 () List!3066)

(assert (=> d!57939 (= lt!108909 (ListLongMap!3062 lt!108907))))

(declare-fun lt!108908 () Unit!6388)

(declare-fun lt!108910 () Unit!6388)

(assert (=> d!57939 (= lt!108908 lt!108910)))

(assert (=> d!57939 (= (getValueByKey!251 lt!108907 (_1!2090 (tuple2!4159 k0!843 v!520))) (Some!256 (_2!2090 (tuple2!4159 k0!843 v!520))))))

(assert (=> d!57939 (= lt!108910 (lemmaContainsTupThenGetReturnValue!141 lt!108907 (_1!2090 (tuple2!4159 k0!843 v!520)) (_2!2090 (tuple2!4159 k0!843 v!520))))))

(assert (=> d!57939 (= lt!108907 (insertStrictlySorted!144 (toList!1546 lt!108716) (_1!2090 (tuple2!4159 k0!843 v!520)) (_2!2090 (tuple2!4159 k0!843 v!520))))))

(assert (=> d!57939 (= (+!570 lt!108716 (tuple2!4159 k0!843 v!520)) lt!108909)))

(declare-fun b!211776 () Bool)

(declare-fun res!103446 () Bool)

(assert (=> b!211776 (=> (not res!103446) (not e!137813))))

(assert (=> b!211776 (= res!103446 (= (getValueByKey!251 (toList!1546 lt!108909) (_1!2090 (tuple2!4159 k0!843 v!520))) (Some!256 (_2!2090 (tuple2!4159 k0!843 v!520)))))))

(declare-fun b!211777 () Bool)

(assert (=> b!211777 (= e!137813 (contains!1386 (toList!1546 lt!108909) (tuple2!4159 k0!843 v!520)))))

(assert (= (and d!57939 res!103445) b!211776))

(assert (= (and b!211776 res!103446) b!211777))

(declare-fun m!239099 () Bool)

(assert (=> d!57939 m!239099))

(declare-fun m!239101 () Bool)

(assert (=> d!57939 m!239101))

(declare-fun m!239103 () Bool)

(assert (=> d!57939 m!239103))

(declare-fun m!239105 () Bool)

(assert (=> d!57939 m!239105))

(declare-fun m!239107 () Bool)

(assert (=> b!211776 m!239107))

(declare-fun m!239109 () Bool)

(assert (=> b!211777 m!239109))

(assert (=> b!211541 d!57939))

(declare-fun call!20057 () ListLongMap!3061)

(declare-fun bm!20053 () Bool)

(assert (=> bm!20053 (= call!20057 (getCurrentListMapNoExtraKeys!495 _keys!825 (array!10080 (store (arr!4783 _values!649) i!601 (ValueCellFull!2378 v!520)) (size!5109 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211784 () Bool)

(declare-fun e!137818 () Bool)

(declare-fun e!137819 () Bool)

(assert (=> b!211784 (= e!137818 e!137819)))

(declare-fun c!35749 () Bool)

(assert (=> b!211784 (= c!35749 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun b!211785 () Bool)

(declare-fun call!20056 () ListLongMap!3061)

(assert (=> b!211785 (= e!137819 (= call!20057 call!20056))))

(declare-fun b!211786 () Bool)

(assert (=> b!211786 (= e!137819 (= call!20057 (+!570 call!20056 (tuple2!4159 k0!843 v!520))))))

(declare-fun d!57941 () Bool)

(assert (=> d!57941 e!137818))

(declare-fun res!103449 () Bool)

(assert (=> d!57941 (=> (not res!103449) (not e!137818))))

(assert (=> d!57941 (= res!103449 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5109 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5109 _values!649))))))))

(declare-fun lt!108913 () Unit!6388)

(declare-fun choose!1086 (array!10077 array!10079 (_ BitVec 32) (_ BitVec 32) V!6905 V!6905 (_ BitVec 32) (_ BitVec 64) V!6905 (_ BitVec 32) Int) Unit!6388)

(assert (=> d!57941 (= lt!108913 (choose!1086 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!57941 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(assert (=> d!57941 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!219 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!108913)))

(declare-fun bm!20054 () Bool)

(assert (=> bm!20054 (= call!20056 (getCurrentListMapNoExtraKeys!495 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and d!57941 res!103449) b!211784))

(assert (= (and b!211784 c!35749) b!211786))

(assert (= (and b!211784 (not c!35749)) b!211785))

(assert (= (or b!211786 b!211785) bm!20053))

(assert (= (or b!211786 b!211785) bm!20054))

(assert (=> bm!20053 m!238829))

(declare-fun m!239111 () Bool)

(assert (=> bm!20053 m!239111))

(declare-fun m!239113 () Bool)

(assert (=> b!211786 m!239113))

(declare-fun m!239115 () Bool)

(assert (=> d!57941 m!239115))

(assert (=> bm!20054 m!238827))

(assert (=> b!211541 d!57941))

(declare-fun d!57943 () Bool)

(assert (=> d!57943 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21054 d!57943))

(declare-fun d!57945 () Bool)

(assert (=> d!57945 (= (array_inv!3139 _values!649) (bvsge (size!5109 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21054 d!57945))

(declare-fun d!57947 () Bool)

(assert (=> d!57947 (= (array_inv!3140 _keys!825) (bvsge (size!5108 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21054 d!57947))

(declare-fun d!57949 () Bool)

(declare-fun e!137820 () Bool)

(assert (=> d!57949 e!137820))

(declare-fun res!103450 () Bool)

(assert (=> d!57949 (=> (not res!103450) (not e!137820))))

(declare-fun lt!108916 () ListLongMap!3061)

(assert (=> d!57949 (= res!103450 (contains!1385 lt!108916 (_1!2090 lt!108714)))))

(declare-fun lt!108914 () List!3066)

(assert (=> d!57949 (= lt!108916 (ListLongMap!3062 lt!108914))))

(declare-fun lt!108915 () Unit!6388)

(declare-fun lt!108917 () Unit!6388)

(assert (=> d!57949 (= lt!108915 lt!108917)))

(assert (=> d!57949 (= (getValueByKey!251 lt!108914 (_1!2090 lt!108714)) (Some!256 (_2!2090 lt!108714)))))

(assert (=> d!57949 (= lt!108917 (lemmaContainsTupThenGetReturnValue!141 lt!108914 (_1!2090 lt!108714) (_2!2090 lt!108714)))))

(assert (=> d!57949 (= lt!108914 (insertStrictlySorted!144 (toList!1546 lt!108717) (_1!2090 lt!108714) (_2!2090 lt!108714)))))

(assert (=> d!57949 (= (+!570 lt!108717 lt!108714) lt!108916)))

(declare-fun b!211787 () Bool)

(declare-fun res!103451 () Bool)

(assert (=> b!211787 (=> (not res!103451) (not e!137820))))

(assert (=> b!211787 (= res!103451 (= (getValueByKey!251 (toList!1546 lt!108916) (_1!2090 lt!108714)) (Some!256 (_2!2090 lt!108714))))))

(declare-fun b!211788 () Bool)

(assert (=> b!211788 (= e!137820 (contains!1386 (toList!1546 lt!108916) lt!108714))))

(assert (= (and d!57949 res!103450) b!211787))

(assert (= (and b!211787 res!103451) b!211788))

(declare-fun m!239117 () Bool)

(assert (=> d!57949 m!239117))

(declare-fun m!239119 () Bool)

(assert (=> d!57949 m!239119))

(declare-fun m!239121 () Bool)

(assert (=> d!57949 m!239121))

(declare-fun m!239123 () Bool)

(assert (=> d!57949 m!239123))

(declare-fun m!239125 () Bool)

(assert (=> b!211787 m!239125))

(declare-fun m!239127 () Bool)

(assert (=> b!211788 m!239127))

(assert (=> b!211534 d!57949))

(declare-fun b!211799 () Bool)

(declare-fun e!137830 () Bool)

(declare-fun contains!1387 (List!3067 (_ BitVec 64)) Bool)

(assert (=> b!211799 (= e!137830 (contains!1387 Nil!3064 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!211800 () Bool)

(declare-fun e!137829 () Bool)

(declare-fun e!137832 () Bool)

(assert (=> b!211800 (= e!137829 e!137832)))

(declare-fun c!35752 () Bool)

(assert (=> b!211800 (= c!35752 (validKeyInArray!0 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20057 () Bool)

(declare-fun call!20060 () Bool)

(assert (=> bm!20057 (= call!20060 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35752 (Cons!3063 (select (arr!4782 _keys!825) #b00000000000000000000000000000000) Nil!3064) Nil!3064)))))

(declare-fun d!57951 () Bool)

(declare-fun res!103460 () Bool)

(declare-fun e!137831 () Bool)

(assert (=> d!57951 (=> res!103460 e!137831)))

(assert (=> d!57951 (= res!103460 (bvsge #b00000000000000000000000000000000 (size!5108 _keys!825)))))

(assert (=> d!57951 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3064) e!137831)))

(declare-fun b!211801 () Bool)

(assert (=> b!211801 (= e!137832 call!20060)))

(declare-fun b!211802 () Bool)

(assert (=> b!211802 (= e!137832 call!20060)))

(declare-fun b!211803 () Bool)

(assert (=> b!211803 (= e!137831 e!137829)))

(declare-fun res!103458 () Bool)

(assert (=> b!211803 (=> (not res!103458) (not e!137829))))

(assert (=> b!211803 (= res!103458 (not e!137830))))

(declare-fun res!103459 () Bool)

(assert (=> b!211803 (=> (not res!103459) (not e!137830))))

(assert (=> b!211803 (= res!103459 (validKeyInArray!0 (select (arr!4782 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57951 (not res!103460)) b!211803))

(assert (= (and b!211803 res!103459) b!211799))

(assert (= (and b!211803 res!103458) b!211800))

(assert (= (and b!211800 c!35752) b!211802))

(assert (= (and b!211800 (not c!35752)) b!211801))

(assert (= (or b!211802 b!211801) bm!20057))

(assert (=> b!211799 m!238947))

(assert (=> b!211799 m!238947))

(declare-fun m!239129 () Bool)

(assert (=> b!211799 m!239129))

(assert (=> b!211800 m!238947))

(assert (=> b!211800 m!238947))

(assert (=> b!211800 m!238949))

(assert (=> bm!20057 m!238947))

(declare-fun m!239131 () Bool)

(assert (=> bm!20057 m!239131))

(assert (=> b!211803 m!238947))

(assert (=> b!211803 m!238947))

(assert (=> b!211803 m!238949))

(assert (=> b!211538 d!57951))

(declare-fun condMapEmpty!9260 () Bool)

(declare-fun mapDefault!9260 () ValueCell!2378)

(assert (=> mapNonEmpty!9251 (= condMapEmpty!9260 (= mapRest!9251 ((as const (Array (_ BitVec 32) ValueCell!2378)) mapDefault!9260)))))

(declare-fun e!137838 () Bool)

(declare-fun mapRes!9260 () Bool)

(assert (=> mapNonEmpty!9251 (= tp!19801 (and e!137838 mapRes!9260))))

(declare-fun mapNonEmpty!9260 () Bool)

(declare-fun tp!19817 () Bool)

(declare-fun e!137837 () Bool)

(assert (=> mapNonEmpty!9260 (= mapRes!9260 (and tp!19817 e!137837))))

(declare-fun mapValue!9260 () ValueCell!2378)

(declare-fun mapRest!9260 () (Array (_ BitVec 32) ValueCell!2378))

(declare-fun mapKey!9260 () (_ BitVec 32))

(assert (=> mapNonEmpty!9260 (= mapRest!9251 (store mapRest!9260 mapKey!9260 mapValue!9260))))

(declare-fun mapIsEmpty!9260 () Bool)

(assert (=> mapIsEmpty!9260 mapRes!9260))

(declare-fun b!211811 () Bool)

(assert (=> b!211811 (= e!137838 tp_is_empty!5443)))

(declare-fun b!211810 () Bool)

(assert (=> b!211810 (= e!137837 tp_is_empty!5443)))

(assert (= (and mapNonEmpty!9251 condMapEmpty!9260) mapIsEmpty!9260))

(assert (= (and mapNonEmpty!9251 (not condMapEmpty!9260)) mapNonEmpty!9260))

(assert (= (and mapNonEmpty!9260 ((_ is ValueCellFull!2378) mapValue!9260)) b!211810))

(assert (= (and mapNonEmpty!9251 ((_ is ValueCellFull!2378) mapDefault!9260)) b!211811))

(declare-fun m!239133 () Bool)

(assert (=> mapNonEmpty!9260 m!239133))

(declare-fun b_lambda!7677 () Bool)

(assert (= b_lambda!7673 (or (and start!21054 b_free!5581) b_lambda!7677)))

(declare-fun b_lambda!7679 () Bool)

(assert (= b_lambda!7671 (or (and start!21054 b_free!5581) b_lambda!7679)))

(declare-fun b_lambda!7681 () Bool)

(assert (= b_lambda!7667 (or (and start!21054 b_free!5581) b_lambda!7681)))

(declare-fun b_lambda!7683 () Bool)

(assert (= b_lambda!7675 (or (and start!21054 b_free!5581) b_lambda!7683)))

(declare-fun b_lambda!7685 () Bool)

(assert (= b_lambda!7665 (or (and start!21054 b_free!5581) b_lambda!7685)))

(declare-fun b_lambda!7687 () Bool)

(assert (= b_lambda!7669 (or (and start!21054 b_free!5581) b_lambda!7687)))

(check-sat (not b!211769) (not d!57931) (not b!211776) (not bm!20046) (not bm!20035) (not b!211786) (not bm!20039) (not b!211788) (not b!211670) (not b!211800) (not b!211671) b_and!12389 (not d!57941) (not b!211766) (not b!211691) (not b_lambda!7683) (not b!211685) (not b!211739) (not b_lambda!7687) (not b!211666) (not b!211750) (not b!211672) (not d!57925) (not b!211760) (not b!211688) (not b!211803) (not b!211640) (not b!211629) (not b!211738) (not b_lambda!7685) (not mapNonEmpty!9260) (not b!211626) (not b!211686) (not d!57939) (not bm!20036) (not b_next!5581) (not bm!20016) (not b!211799) (not bm!20041) (not bm!20043) (not b!211628) (not b!211771) (not b!211687) (not bm!20053) (not d!57933) (not b_lambda!7681) (not b!211746) (not b!211745) (not b!211787) (not b!211753) (not b!211690) tp_is_empty!5443 (not b!211759) (not d!57949) (not b!211680) (not b!211774) (not b!211777) (not bm!20048) (not b!211756) (not bm!20042) (not b!211735) (not b!211674) (not bm!20054) (not d!57937) (not b!211684) (not bm!20019) (not bm!20057) (not b_lambda!7677) (not bm!20020) (not b_lambda!7679) (not b!211748) (not b!211676) (not b!211627) (not d!57923) (not b!211639) (not b!211677) (not d!57935) (not b!211767) (not b!211673))
(check-sat b_and!12389 (not b_next!5581))
