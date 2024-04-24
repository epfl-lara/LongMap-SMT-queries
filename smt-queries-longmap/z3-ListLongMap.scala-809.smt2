; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19664 () Bool)

(assert start!19664)

(declare-fun b!192746 () Bool)

(declare-fun b_free!4693 () Bool)

(declare-fun b_next!4693 () Bool)

(assert (=> b!192746 (= b_free!4693 (not b_next!4693))))

(declare-fun tp!16937 () Bool)

(declare-fun b_and!11405 () Bool)

(assert (=> b!192746 (= tp!16937 b_and!11405)))

(declare-fun b!192738 () Bool)

(declare-datatypes ((Unit!5817 0))(
  ( (Unit!5818) )
))
(declare-fun e!126804 () Unit!5817)

(declare-fun lt!95881 () Unit!5817)

(assert (=> b!192738 (= e!126804 lt!95881)))

(declare-datatypes ((V!5601 0))(
  ( (V!5602 (val!2277 Int)) )
))
(declare-datatypes ((ValueCell!1889 0))(
  ( (ValueCellFull!1889 (v!4228 V!5601)) (EmptyCell!1889) )
))
(declare-datatypes ((array!8159 0))(
  ( (array!8160 (arr!3842 (Array (_ BitVec 32) (_ BitVec 64))) (size!4166 (_ BitVec 32))) )
))
(declare-datatypes ((array!8161 0))(
  ( (array!8162 (arr!3843 (Array (_ BitVec 32) ValueCell!1889)) (size!4167 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2686 0))(
  ( (LongMapFixedSize!2687 (defaultEntry!3931 Int) (mask!9170 (_ BitVec 32)) (extraKeys!3668 (_ BitVec 32)) (zeroValue!3772 V!5601) (minValue!3772 V!5601) (_size!1392 (_ BitVec 32)) (_keys!5917 array!8159) (_values!3914 array!8161) (_vacant!1392 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2686)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!177 (array!8159 array!8161 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 64) Int) Unit!5817)

(assert (=> b!192738 (= lt!95881 (lemmaInListMapThenSeekEntryOrOpenFindsIt!177 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) key!828 (defaultEntry!3931 thiss!1248)))))

(declare-fun res!91065 () Bool)

(declare-datatypes ((SeekEntryResult!671 0))(
  ( (MissingZero!671 (index!4854 (_ BitVec 32))) (Found!671 (index!4855 (_ BitVec 32))) (Intermediate!671 (undefined!1483 Bool) (index!4856 (_ BitVec 32)) (x!20595 (_ BitVec 32))) (Undefined!671) (MissingVacant!671 (index!4857 (_ BitVec 32))) )
))
(declare-fun lt!95883 () SeekEntryResult!671)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!192738 (= res!91065 (inRange!0 (index!4855 lt!95883) (mask!9170 thiss!1248)))))

(declare-fun e!126806 () Bool)

(assert (=> b!192738 (=> (not res!91065) (not e!126806))))

(assert (=> b!192738 e!126806))

(declare-fun b!192739 () Bool)

(declare-fun e!126809 () Bool)

(declare-fun tp_is_empty!4465 () Bool)

(assert (=> b!192739 (= e!126809 tp_is_empty!4465)))

(declare-fun mapIsEmpty!7718 () Bool)

(declare-fun mapRes!7718 () Bool)

(assert (=> mapIsEmpty!7718 mapRes!7718))

(declare-fun b!192740 () Bool)

(assert (=> b!192740 (= e!126806 (= (select (arr!3842 (_keys!5917 thiss!1248)) (index!4855 lt!95883)) key!828))))

(declare-fun b!192741 () Bool)

(declare-fun res!91067 () Bool)

(declare-fun e!126808 () Bool)

(assert (=> b!192741 (=> res!91067 e!126808)))

(assert (=> b!192741 (= res!91067 (or (not (= (size!4167 (_values!3914 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9170 thiss!1248)))) (not (= (size!4166 (_keys!5917 thiss!1248)) (size!4167 (_values!3914 thiss!1248)))) (bvslt (mask!9170 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3668 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3668 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!192742 () Bool)

(declare-fun e!126801 () Bool)

(declare-fun e!126810 () Bool)

(assert (=> b!192742 (= e!126801 e!126810)))

(declare-fun res!91069 () Bool)

(assert (=> b!192742 (=> (not res!91069) (not e!126810))))

(get-info :version)

(assert (=> b!192742 (= res!91069 (and (not ((_ is Undefined!671) lt!95883)) (not ((_ is MissingVacant!671) lt!95883)) (not ((_ is MissingZero!671) lt!95883)) ((_ is Found!671) lt!95883)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8159 (_ BitVec 32)) SeekEntryResult!671)

(assert (=> b!192742 (= lt!95883 (seekEntryOrOpen!0 key!828 (_keys!5917 thiss!1248) (mask!9170 thiss!1248)))))

(declare-fun b!192743 () Bool)

(declare-fun Unit!5819 () Unit!5817)

(assert (=> b!192743 (= e!126804 Unit!5819)))

(declare-fun lt!95879 () Unit!5817)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!173 (array!8159 array!8161 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 64) Int) Unit!5817)

(assert (=> b!192743 (= lt!95879 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!173 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) key!828 (defaultEntry!3931 thiss!1248)))))

(assert (=> b!192743 false))

(declare-fun b!192744 () Bool)

(assert (=> b!192744 (= e!126810 (not e!126808))))

(declare-fun res!91068 () Bool)

(assert (=> b!192744 (=> res!91068 e!126808)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!192744 (= res!91068 (not (validMask!0 (mask!9170 thiss!1248))))))

(declare-datatypes ((tuple2!3484 0))(
  ( (tuple2!3485 (_1!1753 (_ BitVec 64)) (_2!1753 V!5601)) )
))
(declare-datatypes ((List!2393 0))(
  ( (Nil!2390) (Cons!2389 (h!3030 tuple2!3484) (t!7303 List!2393)) )
))
(declare-datatypes ((ListLongMap!2405 0))(
  ( (ListLongMap!2406 (toList!1218 List!2393)) )
))
(declare-fun lt!95882 () ListLongMap!2405)

(declare-fun v!309 () V!5601)

(declare-fun +!311 (ListLongMap!2405 tuple2!3484) ListLongMap!2405)

(declare-fun getCurrentListMap!870 (array!8159 array!8161 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 32) Int) ListLongMap!2405)

(assert (=> b!192744 (= (+!311 lt!95882 (tuple2!3485 key!828 v!309)) (getCurrentListMap!870 (_keys!5917 thiss!1248) (array!8162 (store (arr!3843 (_values!3914 thiss!1248)) (index!4855 lt!95883) (ValueCellFull!1889 v!309)) (size!4167 (_values!3914 thiss!1248))) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!95880 () Unit!5817)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!115 (array!8159 array!8161 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 32) (_ BitVec 64) V!5601 Int) Unit!5817)

(assert (=> b!192744 (= lt!95880 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!115 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) (index!4855 lt!95883) key!828 v!309 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!95884 () Unit!5817)

(assert (=> b!192744 (= lt!95884 e!126804)))

(declare-fun c!34767 () Bool)

(declare-fun contains!1348 (ListLongMap!2405 (_ BitVec 64)) Bool)

(assert (=> b!192744 (= c!34767 (contains!1348 lt!95882 key!828))))

(assert (=> b!192744 (= lt!95882 (getCurrentListMap!870 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun b!192745 () Bool)

(declare-fun res!91064 () Bool)

(assert (=> b!192745 (=> (not res!91064) (not e!126801))))

(assert (=> b!192745 (= res!91064 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7718 () Bool)

(declare-fun tp!16936 () Bool)

(assert (=> mapNonEmpty!7718 (= mapRes!7718 (and tp!16936 e!126809))))

(declare-fun mapRest!7718 () (Array (_ BitVec 32) ValueCell!1889))

(declare-fun mapKey!7718 () (_ BitVec 32))

(declare-fun mapValue!7718 () ValueCell!1889)

(assert (=> mapNonEmpty!7718 (= (arr!3843 (_values!3914 thiss!1248)) (store mapRest!7718 mapKey!7718 mapValue!7718))))

(declare-fun res!91066 () Bool)

(assert (=> start!19664 (=> (not res!91066) (not e!126801))))

(declare-fun valid!1124 (LongMapFixedSize!2686) Bool)

(assert (=> start!19664 (= res!91066 (valid!1124 thiss!1248))))

(assert (=> start!19664 e!126801))

(declare-fun e!126803 () Bool)

(assert (=> start!19664 e!126803))

(assert (=> start!19664 true))

(assert (=> start!19664 tp_is_empty!4465))

(declare-fun e!126802 () Bool)

(declare-fun array_inv!2475 (array!8159) Bool)

(declare-fun array_inv!2476 (array!8161) Bool)

(assert (=> b!192746 (= e!126803 (and tp!16937 tp_is_empty!4465 (array_inv!2475 (_keys!5917 thiss!1248)) (array_inv!2476 (_values!3914 thiss!1248)) e!126802))))

(declare-fun b!192747 () Bool)

(declare-fun e!126807 () Bool)

(assert (=> b!192747 (= e!126807 tp_is_empty!4465)))

(declare-fun b!192748 () Bool)

(assert (=> b!192748 (= e!126802 (and e!126807 mapRes!7718))))

(declare-fun condMapEmpty!7718 () Bool)

(declare-fun mapDefault!7718 () ValueCell!1889)

(assert (=> b!192748 (= condMapEmpty!7718 (= (arr!3843 (_values!3914 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1889)) mapDefault!7718)))))

(declare-fun b!192749 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8159 (_ BitVec 32)) Bool)

(assert (=> b!192749 (= e!126808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5917 thiss!1248) (mask!9170 thiss!1248)))))

(assert (= (and start!19664 res!91066) b!192745))

(assert (= (and b!192745 res!91064) b!192742))

(assert (= (and b!192742 res!91069) b!192744))

(assert (= (and b!192744 c!34767) b!192738))

(assert (= (and b!192744 (not c!34767)) b!192743))

(assert (= (and b!192738 res!91065) b!192740))

(assert (= (and b!192744 (not res!91068)) b!192741))

(assert (= (and b!192741 (not res!91067)) b!192749))

(assert (= (and b!192748 condMapEmpty!7718) mapIsEmpty!7718))

(assert (= (and b!192748 (not condMapEmpty!7718)) mapNonEmpty!7718))

(assert (= (and mapNonEmpty!7718 ((_ is ValueCellFull!1889) mapValue!7718)) b!192739))

(assert (= (and b!192748 ((_ is ValueCellFull!1889) mapDefault!7718)) b!192747))

(assert (= b!192746 b!192748))

(assert (= start!19664 b!192746))

(declare-fun m!219709 () Bool)

(assert (=> b!192744 m!219709))

(declare-fun m!219711 () Bool)

(assert (=> b!192744 m!219711))

(declare-fun m!219713 () Bool)

(assert (=> b!192744 m!219713))

(declare-fun m!219715 () Bool)

(assert (=> b!192744 m!219715))

(declare-fun m!219717 () Bool)

(assert (=> b!192744 m!219717))

(declare-fun m!219719 () Bool)

(assert (=> b!192744 m!219719))

(declare-fun m!219721 () Bool)

(assert (=> b!192744 m!219721))

(declare-fun m!219723 () Bool)

(assert (=> b!192738 m!219723))

(declare-fun m!219725 () Bool)

(assert (=> b!192738 m!219725))

(declare-fun m!219727 () Bool)

(assert (=> b!192742 m!219727))

(declare-fun m!219729 () Bool)

(assert (=> start!19664 m!219729))

(declare-fun m!219731 () Bool)

(assert (=> b!192746 m!219731))

(declare-fun m!219733 () Bool)

(assert (=> b!192746 m!219733))

(declare-fun m!219735 () Bool)

(assert (=> mapNonEmpty!7718 m!219735))

(declare-fun m!219737 () Bool)

(assert (=> b!192740 m!219737))

(declare-fun m!219739 () Bool)

(assert (=> b!192743 m!219739))

(declare-fun m!219741 () Bool)

(assert (=> b!192749 m!219741))

(check-sat b_and!11405 (not start!19664) (not b!192742) (not b!192749) (not b!192746) (not b!192738) tp_is_empty!4465 (not b!192743) (not mapNonEmpty!7718) (not b!192744) (not b_next!4693))
(check-sat b_and!11405 (not b_next!4693))
(get-model)

(declare-fun d!56585 () Bool)

(declare-fun e!126873 () Bool)

(assert (=> d!56585 e!126873))

(declare-fun res!91111 () Bool)

(assert (=> d!56585 (=> (not res!91111) (not e!126873))))

(declare-fun lt!95925 () SeekEntryResult!671)

(assert (=> d!56585 (= res!91111 ((_ is Found!671) lt!95925))))

(assert (=> d!56585 (= lt!95925 (seekEntryOrOpen!0 key!828 (_keys!5917 thiss!1248) (mask!9170 thiss!1248)))))

(declare-fun lt!95926 () Unit!5817)

(declare-fun choose!1058 (array!8159 array!8161 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 64) Int) Unit!5817)

(assert (=> d!56585 (= lt!95926 (choose!1058 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) key!828 (defaultEntry!3931 thiss!1248)))))

(assert (=> d!56585 (validMask!0 (mask!9170 thiss!1248))))

(assert (=> d!56585 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!177 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) key!828 (defaultEntry!3931 thiss!1248)) lt!95926)))

(declare-fun b!192826 () Bool)

(declare-fun res!91110 () Bool)

(assert (=> b!192826 (=> (not res!91110) (not e!126873))))

(assert (=> b!192826 (= res!91110 (inRange!0 (index!4855 lt!95925) (mask!9170 thiss!1248)))))

(declare-fun b!192827 () Bool)

(assert (=> b!192827 (= e!126873 (= (select (arr!3842 (_keys!5917 thiss!1248)) (index!4855 lt!95925)) key!828))))

(assert (=> b!192827 (and (bvsge (index!4855 lt!95925) #b00000000000000000000000000000000) (bvslt (index!4855 lt!95925) (size!4166 (_keys!5917 thiss!1248))))))

(assert (= (and d!56585 res!91111) b!192826))

(assert (= (and b!192826 res!91110) b!192827))

(assert (=> d!56585 m!219727))

(declare-fun m!219811 () Bool)

(assert (=> d!56585 m!219811))

(assert (=> d!56585 m!219717))

(declare-fun m!219813 () Bool)

(assert (=> b!192826 m!219813))

(declare-fun m!219815 () Bool)

(assert (=> b!192827 m!219815))

(assert (=> b!192738 d!56585))

(declare-fun d!56587 () Bool)

(assert (=> d!56587 (= (inRange!0 (index!4855 lt!95883) (mask!9170 thiss!1248)) (and (bvsge (index!4855 lt!95883) #b00000000000000000000000000000000) (bvslt (index!4855 lt!95883) (bvadd (mask!9170 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!192738 d!56587))

(declare-fun b!192840 () Bool)

(declare-fun e!126882 () SeekEntryResult!671)

(assert (=> b!192840 (= e!126882 Undefined!671)))

(declare-fun lt!95935 () SeekEntryResult!671)

(declare-fun b!192841 () Bool)

(declare-fun e!126881 () SeekEntryResult!671)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8159 (_ BitVec 32)) SeekEntryResult!671)

(assert (=> b!192841 (= e!126881 (seekKeyOrZeroReturnVacant!0 (x!20595 lt!95935) (index!4856 lt!95935) (index!4856 lt!95935) key!828 (_keys!5917 thiss!1248) (mask!9170 thiss!1248)))))

(declare-fun b!192842 () Bool)

(declare-fun e!126880 () SeekEntryResult!671)

(assert (=> b!192842 (= e!126880 (Found!671 (index!4856 lt!95935)))))

(declare-fun b!192843 () Bool)

(assert (=> b!192843 (= e!126882 e!126880)))

(declare-fun lt!95933 () (_ BitVec 64))

(assert (=> b!192843 (= lt!95933 (select (arr!3842 (_keys!5917 thiss!1248)) (index!4856 lt!95935)))))

(declare-fun c!34781 () Bool)

(assert (=> b!192843 (= c!34781 (= lt!95933 key!828))))

(declare-fun d!56589 () Bool)

(declare-fun lt!95934 () SeekEntryResult!671)

(assert (=> d!56589 (and (or ((_ is Undefined!671) lt!95934) (not ((_ is Found!671) lt!95934)) (and (bvsge (index!4855 lt!95934) #b00000000000000000000000000000000) (bvslt (index!4855 lt!95934) (size!4166 (_keys!5917 thiss!1248))))) (or ((_ is Undefined!671) lt!95934) ((_ is Found!671) lt!95934) (not ((_ is MissingZero!671) lt!95934)) (and (bvsge (index!4854 lt!95934) #b00000000000000000000000000000000) (bvslt (index!4854 lt!95934) (size!4166 (_keys!5917 thiss!1248))))) (or ((_ is Undefined!671) lt!95934) ((_ is Found!671) lt!95934) ((_ is MissingZero!671) lt!95934) (not ((_ is MissingVacant!671) lt!95934)) (and (bvsge (index!4857 lt!95934) #b00000000000000000000000000000000) (bvslt (index!4857 lt!95934) (size!4166 (_keys!5917 thiss!1248))))) (or ((_ is Undefined!671) lt!95934) (ite ((_ is Found!671) lt!95934) (= (select (arr!3842 (_keys!5917 thiss!1248)) (index!4855 lt!95934)) key!828) (ite ((_ is MissingZero!671) lt!95934) (= (select (arr!3842 (_keys!5917 thiss!1248)) (index!4854 lt!95934)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!671) lt!95934) (= (select (arr!3842 (_keys!5917 thiss!1248)) (index!4857 lt!95934)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56589 (= lt!95934 e!126882)))

(declare-fun c!34782 () Bool)

(assert (=> d!56589 (= c!34782 (and ((_ is Intermediate!671) lt!95935) (undefined!1483 lt!95935)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8159 (_ BitVec 32)) SeekEntryResult!671)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56589 (= lt!95935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9170 thiss!1248)) key!828 (_keys!5917 thiss!1248) (mask!9170 thiss!1248)))))

(assert (=> d!56589 (validMask!0 (mask!9170 thiss!1248))))

(assert (=> d!56589 (= (seekEntryOrOpen!0 key!828 (_keys!5917 thiss!1248) (mask!9170 thiss!1248)) lt!95934)))

(declare-fun b!192844 () Bool)

(assert (=> b!192844 (= e!126881 (MissingZero!671 (index!4856 lt!95935)))))

(declare-fun b!192845 () Bool)

(declare-fun c!34780 () Bool)

(assert (=> b!192845 (= c!34780 (= lt!95933 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192845 (= e!126880 e!126881)))

(assert (= (and d!56589 c!34782) b!192840))

(assert (= (and d!56589 (not c!34782)) b!192843))

(assert (= (and b!192843 c!34781) b!192842))

(assert (= (and b!192843 (not c!34781)) b!192845))

(assert (= (and b!192845 c!34780) b!192844))

(assert (= (and b!192845 (not c!34780)) b!192841))

(declare-fun m!219817 () Bool)

(assert (=> b!192841 m!219817))

(declare-fun m!219819 () Bool)

(assert (=> b!192843 m!219819))

(declare-fun m!219821 () Bool)

(assert (=> d!56589 m!219821))

(assert (=> d!56589 m!219821))

(declare-fun m!219823 () Bool)

(assert (=> d!56589 m!219823))

(declare-fun m!219825 () Bool)

(assert (=> d!56589 m!219825))

(declare-fun m!219827 () Bool)

(assert (=> d!56589 m!219827))

(assert (=> d!56589 m!219717))

(declare-fun m!219829 () Bool)

(assert (=> d!56589 m!219829))

(assert (=> b!192742 d!56589))

(declare-fun d!56591 () Bool)

(assert (=> d!56591 (= (array_inv!2475 (_keys!5917 thiss!1248)) (bvsge (size!4166 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192746 d!56591))

(declare-fun d!56593 () Bool)

(assert (=> d!56593 (= (array_inv!2476 (_values!3914 thiss!1248)) (bvsge (size!4167 (_values!3914 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192746 d!56593))

(declare-fun d!56595 () Bool)

(declare-fun res!91118 () Bool)

(declare-fun e!126885 () Bool)

(assert (=> d!56595 (=> (not res!91118) (not e!126885))))

(declare-fun simpleValid!200 (LongMapFixedSize!2686) Bool)

(assert (=> d!56595 (= res!91118 (simpleValid!200 thiss!1248))))

(assert (=> d!56595 (= (valid!1124 thiss!1248) e!126885)))

(declare-fun b!192852 () Bool)

(declare-fun res!91119 () Bool)

(assert (=> b!192852 (=> (not res!91119) (not e!126885))))

(declare-fun arrayCountValidKeys!0 (array!8159 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!192852 (= res!91119 (= (arrayCountValidKeys!0 (_keys!5917 thiss!1248) #b00000000000000000000000000000000 (size!4166 (_keys!5917 thiss!1248))) (_size!1392 thiss!1248)))))

(declare-fun b!192853 () Bool)

(declare-fun res!91120 () Bool)

(assert (=> b!192853 (=> (not res!91120) (not e!126885))))

(assert (=> b!192853 (= res!91120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5917 thiss!1248) (mask!9170 thiss!1248)))))

(declare-fun b!192854 () Bool)

(declare-datatypes ((List!2395 0))(
  ( (Nil!2392) (Cons!2391 (h!3032 (_ BitVec 64)) (t!7307 List!2395)) )
))
(declare-fun arrayNoDuplicates!0 (array!8159 (_ BitVec 32) List!2395) Bool)

(assert (=> b!192854 (= e!126885 (arrayNoDuplicates!0 (_keys!5917 thiss!1248) #b00000000000000000000000000000000 Nil!2392))))

(assert (= (and d!56595 res!91118) b!192852))

(assert (= (and b!192852 res!91119) b!192853))

(assert (= (and b!192853 res!91120) b!192854))

(declare-fun m!219831 () Bool)

(assert (=> d!56595 m!219831))

(declare-fun m!219833 () Bool)

(assert (=> b!192852 m!219833))

(assert (=> b!192853 m!219741))

(declare-fun m!219835 () Bool)

(assert (=> b!192854 m!219835))

(assert (=> start!19664 d!56595))

(declare-fun b!192871 () Bool)

(declare-fun res!91130 () Bool)

(declare-fun e!126895 () Bool)

(assert (=> b!192871 (=> (not res!91130) (not e!126895))))

(declare-fun lt!95941 () SeekEntryResult!671)

(assert (=> b!192871 (= res!91130 (= (select (arr!3842 (_keys!5917 thiss!1248)) (index!4857 lt!95941)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192871 (and (bvsge (index!4857 lt!95941) #b00000000000000000000000000000000) (bvslt (index!4857 lt!95941) (size!4166 (_keys!5917 thiss!1248))))))

(declare-fun b!192872 () Bool)

(declare-fun e!126894 () Bool)

(assert (=> b!192872 (= e!126894 ((_ is Undefined!671) lt!95941))))

(declare-fun b!192873 () Bool)

(declare-fun call!19445 () Bool)

(assert (=> b!192873 (= e!126895 (not call!19445))))

(declare-fun b!192874 () Bool)

(declare-fun e!126897 () Bool)

(assert (=> b!192874 (= e!126897 e!126894)))

(declare-fun c!34788 () Bool)

(assert (=> b!192874 (= c!34788 ((_ is MissingVacant!671) lt!95941))))

(declare-fun b!192875 () Bool)

(assert (=> b!192875 (and (bvsge (index!4854 lt!95941) #b00000000000000000000000000000000) (bvslt (index!4854 lt!95941) (size!4166 (_keys!5917 thiss!1248))))))

(declare-fun res!91129 () Bool)

(assert (=> b!192875 (= res!91129 (= (select (arr!3842 (_keys!5917 thiss!1248)) (index!4854 lt!95941)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126896 () Bool)

(assert (=> b!192875 (=> (not res!91129) (not e!126896))))

(declare-fun d!56597 () Bool)

(assert (=> d!56597 e!126897))

(declare-fun c!34787 () Bool)

(assert (=> d!56597 (= c!34787 ((_ is MissingZero!671) lt!95941))))

(assert (=> d!56597 (= lt!95941 (seekEntryOrOpen!0 key!828 (_keys!5917 thiss!1248) (mask!9170 thiss!1248)))))

(declare-fun lt!95940 () Unit!5817)

(declare-fun choose!1059 (array!8159 array!8161 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 64) Int) Unit!5817)

(assert (=> d!56597 (= lt!95940 (choose!1059 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) key!828 (defaultEntry!3931 thiss!1248)))))

(assert (=> d!56597 (validMask!0 (mask!9170 thiss!1248))))

(assert (=> d!56597 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!173 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) key!828 (defaultEntry!3931 thiss!1248)) lt!95940)))

(declare-fun bm!19442 () Bool)

(declare-fun arrayContainsKey!0 (array!8159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19442 (= call!19445 (arrayContainsKey!0 (_keys!5917 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!192876 () Bool)

(assert (=> b!192876 (= e!126896 (not call!19445))))

(declare-fun b!192877 () Bool)

(assert (=> b!192877 (= e!126897 e!126896)))

(declare-fun res!91131 () Bool)

(declare-fun call!19446 () Bool)

(assert (=> b!192877 (= res!91131 call!19446)))

(assert (=> b!192877 (=> (not res!91131) (not e!126896))))

(declare-fun bm!19443 () Bool)

(assert (=> bm!19443 (= call!19446 (inRange!0 (ite c!34787 (index!4854 lt!95941) (index!4857 lt!95941)) (mask!9170 thiss!1248)))))

(declare-fun b!192878 () Bool)

(declare-fun res!91132 () Bool)

(assert (=> b!192878 (=> (not res!91132) (not e!126895))))

(assert (=> b!192878 (= res!91132 call!19446)))

(assert (=> b!192878 (= e!126894 e!126895)))

(assert (= (and d!56597 c!34787) b!192877))

(assert (= (and d!56597 (not c!34787)) b!192874))

(assert (= (and b!192877 res!91131) b!192875))

(assert (= (and b!192875 res!91129) b!192876))

(assert (= (and b!192874 c!34788) b!192878))

(assert (= (and b!192874 (not c!34788)) b!192872))

(assert (= (and b!192878 res!91132) b!192871))

(assert (= (and b!192871 res!91130) b!192873))

(assert (= (or b!192877 b!192878) bm!19443))

(assert (= (or b!192876 b!192873) bm!19442))

(assert (=> d!56597 m!219727))

(declare-fun m!219837 () Bool)

(assert (=> d!56597 m!219837))

(assert (=> d!56597 m!219717))

(declare-fun m!219839 () Bool)

(assert (=> bm!19443 m!219839))

(declare-fun m!219841 () Bool)

(assert (=> b!192871 m!219841))

(declare-fun m!219843 () Bool)

(assert (=> b!192875 m!219843))

(declare-fun m!219845 () Bool)

(assert (=> bm!19442 m!219845))

(assert (=> b!192743 d!56597))

(declare-fun b!192887 () Bool)

(declare-fun e!126906 () Bool)

(declare-fun e!126905 () Bool)

(assert (=> b!192887 (= e!126906 e!126905)))

(declare-fun lt!95948 () (_ BitVec 64))

(assert (=> b!192887 (= lt!95948 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95949 () Unit!5817)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8159 (_ BitVec 64) (_ BitVec 32)) Unit!5817)

(assert (=> b!192887 (= lt!95949 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5917 thiss!1248) lt!95948 #b00000000000000000000000000000000))))

(assert (=> b!192887 (arrayContainsKey!0 (_keys!5917 thiss!1248) lt!95948 #b00000000000000000000000000000000)))

(declare-fun lt!95950 () Unit!5817)

(assert (=> b!192887 (= lt!95950 lt!95949)))

(declare-fun res!91138 () Bool)

(assert (=> b!192887 (= res!91138 (= (seekEntryOrOpen!0 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000) (_keys!5917 thiss!1248) (mask!9170 thiss!1248)) (Found!671 #b00000000000000000000000000000000)))))

(assert (=> b!192887 (=> (not res!91138) (not e!126905))))

(declare-fun bm!19446 () Bool)

(declare-fun call!19449 () Bool)

(assert (=> bm!19446 (= call!19449 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5917 thiss!1248) (mask!9170 thiss!1248)))))

(declare-fun b!192888 () Bool)

(assert (=> b!192888 (= e!126906 call!19449)))

(declare-fun d!56599 () Bool)

(declare-fun res!91137 () Bool)

(declare-fun e!126904 () Bool)

(assert (=> d!56599 (=> res!91137 e!126904)))

(assert (=> d!56599 (= res!91137 (bvsge #b00000000000000000000000000000000 (size!4166 (_keys!5917 thiss!1248))))))

(assert (=> d!56599 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5917 thiss!1248) (mask!9170 thiss!1248)) e!126904)))

(declare-fun b!192889 () Bool)

(assert (=> b!192889 (= e!126904 e!126906)))

(declare-fun c!34791 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!192889 (= c!34791 (validKeyInArray!0 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192890 () Bool)

(assert (=> b!192890 (= e!126905 call!19449)))

(assert (= (and d!56599 (not res!91137)) b!192889))

(assert (= (and b!192889 c!34791) b!192887))

(assert (= (and b!192889 (not c!34791)) b!192888))

(assert (= (and b!192887 res!91138) b!192890))

(assert (= (or b!192890 b!192888) bm!19446))

(declare-fun m!219847 () Bool)

(assert (=> b!192887 m!219847))

(declare-fun m!219849 () Bool)

(assert (=> b!192887 m!219849))

(declare-fun m!219851 () Bool)

(assert (=> b!192887 m!219851))

(assert (=> b!192887 m!219847))

(declare-fun m!219853 () Bool)

(assert (=> b!192887 m!219853))

(declare-fun m!219855 () Bool)

(assert (=> bm!19446 m!219855))

(assert (=> b!192889 m!219847))

(assert (=> b!192889 m!219847))

(declare-fun m!219857 () Bool)

(assert (=> b!192889 m!219857))

(assert (=> b!192749 d!56599))

(declare-fun d!56601 () Bool)

(declare-fun e!126909 () Bool)

(assert (=> d!56601 e!126909))

(declare-fun res!91141 () Bool)

(assert (=> d!56601 (=> (not res!91141) (not e!126909))))

(assert (=> d!56601 (= res!91141 (and (bvsge (index!4855 lt!95883) #b00000000000000000000000000000000) (bvslt (index!4855 lt!95883) (size!4167 (_values!3914 thiss!1248)))))))

(declare-fun lt!95953 () Unit!5817)

(declare-fun choose!1060 (array!8159 array!8161 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 32) (_ BitVec 64) V!5601 Int) Unit!5817)

(assert (=> d!56601 (= lt!95953 (choose!1060 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) (index!4855 lt!95883) key!828 v!309 (defaultEntry!3931 thiss!1248)))))

(assert (=> d!56601 (validMask!0 (mask!9170 thiss!1248))))

(assert (=> d!56601 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!115 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) (index!4855 lt!95883) key!828 v!309 (defaultEntry!3931 thiss!1248)) lt!95953)))

(declare-fun b!192893 () Bool)

(assert (=> b!192893 (= e!126909 (= (+!311 (getCurrentListMap!870 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)) (tuple2!3485 key!828 v!309)) (getCurrentListMap!870 (_keys!5917 thiss!1248) (array!8162 (store (arr!3843 (_values!3914 thiss!1248)) (index!4855 lt!95883) (ValueCellFull!1889 v!309)) (size!4167 (_values!3914 thiss!1248))) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248))))))

(assert (= (and d!56601 res!91141) b!192893))

(declare-fun m!219859 () Bool)

(assert (=> d!56601 m!219859))

(assert (=> d!56601 m!219717))

(assert (=> b!192893 m!219713))

(assert (=> b!192893 m!219713))

(declare-fun m!219861 () Bool)

(assert (=> b!192893 m!219861))

(assert (=> b!192893 m!219711))

(assert (=> b!192893 m!219721))

(assert (=> b!192744 d!56601))

(declare-fun d!56603 () Bool)

(declare-fun e!126912 () Bool)

(assert (=> d!56603 e!126912))

(declare-fun res!91147 () Bool)

(assert (=> d!56603 (=> (not res!91147) (not e!126912))))

(declare-fun lt!95965 () ListLongMap!2405)

(assert (=> d!56603 (= res!91147 (contains!1348 lt!95965 (_1!1753 (tuple2!3485 key!828 v!309))))))

(declare-fun lt!95962 () List!2393)

(assert (=> d!56603 (= lt!95965 (ListLongMap!2406 lt!95962))))

(declare-fun lt!95963 () Unit!5817)

(declare-fun lt!95964 () Unit!5817)

(assert (=> d!56603 (= lt!95963 lt!95964)))

(declare-datatypes ((Option!248 0))(
  ( (Some!247 (v!4233 V!5601)) (None!246) )
))
(declare-fun getValueByKey!242 (List!2393 (_ BitVec 64)) Option!248)

(assert (=> d!56603 (= (getValueByKey!242 lt!95962 (_1!1753 (tuple2!3485 key!828 v!309))) (Some!247 (_2!1753 (tuple2!3485 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!129 (List!2393 (_ BitVec 64) V!5601) Unit!5817)

(assert (=> d!56603 (= lt!95964 (lemmaContainsTupThenGetReturnValue!129 lt!95962 (_1!1753 (tuple2!3485 key!828 v!309)) (_2!1753 (tuple2!3485 key!828 v!309))))))

(declare-fun insertStrictlySorted!132 (List!2393 (_ BitVec 64) V!5601) List!2393)

(assert (=> d!56603 (= lt!95962 (insertStrictlySorted!132 (toList!1218 lt!95882) (_1!1753 (tuple2!3485 key!828 v!309)) (_2!1753 (tuple2!3485 key!828 v!309))))))

(assert (=> d!56603 (= (+!311 lt!95882 (tuple2!3485 key!828 v!309)) lt!95965)))

(declare-fun b!192898 () Bool)

(declare-fun res!91146 () Bool)

(assert (=> b!192898 (=> (not res!91146) (not e!126912))))

(assert (=> b!192898 (= res!91146 (= (getValueByKey!242 (toList!1218 lt!95965) (_1!1753 (tuple2!3485 key!828 v!309))) (Some!247 (_2!1753 (tuple2!3485 key!828 v!309)))))))

(declare-fun b!192899 () Bool)

(declare-fun contains!1350 (List!2393 tuple2!3484) Bool)

(assert (=> b!192899 (= e!126912 (contains!1350 (toList!1218 lt!95965) (tuple2!3485 key!828 v!309)))))

(assert (= (and d!56603 res!91147) b!192898))

(assert (= (and b!192898 res!91146) b!192899))

(declare-fun m!219863 () Bool)

(assert (=> d!56603 m!219863))

(declare-fun m!219865 () Bool)

(assert (=> d!56603 m!219865))

(declare-fun m!219867 () Bool)

(assert (=> d!56603 m!219867))

(declare-fun m!219869 () Bool)

(assert (=> d!56603 m!219869))

(declare-fun m!219871 () Bool)

(assert (=> b!192898 m!219871))

(declare-fun m!219873 () Bool)

(assert (=> b!192899 m!219873))

(assert (=> b!192744 d!56603))

(declare-fun d!56605 () Bool)

(declare-fun e!126917 () Bool)

(assert (=> d!56605 e!126917))

(declare-fun res!91150 () Bool)

(assert (=> d!56605 (=> res!91150 e!126917)))

(declare-fun lt!95974 () Bool)

(assert (=> d!56605 (= res!91150 (not lt!95974))))

(declare-fun lt!95976 () Bool)

(assert (=> d!56605 (= lt!95974 lt!95976)))

(declare-fun lt!95977 () Unit!5817)

(declare-fun e!126918 () Unit!5817)

(assert (=> d!56605 (= lt!95977 e!126918)))

(declare-fun c!34794 () Bool)

(assert (=> d!56605 (= c!34794 lt!95976)))

(declare-fun containsKey!245 (List!2393 (_ BitVec 64)) Bool)

(assert (=> d!56605 (= lt!95976 (containsKey!245 (toList!1218 lt!95882) key!828))))

(assert (=> d!56605 (= (contains!1348 lt!95882 key!828) lt!95974)))

(declare-fun b!192906 () Bool)

(declare-fun lt!95975 () Unit!5817)

(assert (=> b!192906 (= e!126918 lt!95975)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!193 (List!2393 (_ BitVec 64)) Unit!5817)

(assert (=> b!192906 (= lt!95975 (lemmaContainsKeyImpliesGetValueByKeyDefined!193 (toList!1218 lt!95882) key!828))))

(declare-fun isDefined!194 (Option!248) Bool)

(assert (=> b!192906 (isDefined!194 (getValueByKey!242 (toList!1218 lt!95882) key!828))))

(declare-fun b!192907 () Bool)

(declare-fun Unit!5826 () Unit!5817)

(assert (=> b!192907 (= e!126918 Unit!5826)))

(declare-fun b!192908 () Bool)

(assert (=> b!192908 (= e!126917 (isDefined!194 (getValueByKey!242 (toList!1218 lt!95882) key!828)))))

(assert (= (and d!56605 c!34794) b!192906))

(assert (= (and d!56605 (not c!34794)) b!192907))

(assert (= (and d!56605 (not res!91150)) b!192908))

(declare-fun m!219875 () Bool)

(assert (=> d!56605 m!219875))

(declare-fun m!219877 () Bool)

(assert (=> b!192906 m!219877))

(declare-fun m!219879 () Bool)

(assert (=> b!192906 m!219879))

(assert (=> b!192906 m!219879))

(declare-fun m!219881 () Bool)

(assert (=> b!192906 m!219881))

(assert (=> b!192908 m!219879))

(assert (=> b!192908 m!219879))

(assert (=> b!192908 m!219881))

(assert (=> b!192744 d!56605))

(declare-fun b!192951 () Bool)

(declare-fun e!126951 () Unit!5817)

(declare-fun Unit!5827 () Unit!5817)

(assert (=> b!192951 (= e!126951 Unit!5827)))

(declare-fun b!192952 () Bool)

(declare-fun e!126952 () Bool)

(declare-fun lt!96043 () ListLongMap!2405)

(declare-fun apply!184 (ListLongMap!2405 (_ BitVec 64)) V!5601)

(declare-fun get!2231 (ValueCell!1889 V!5601) V!5601)

(declare-fun dynLambda!527 (Int (_ BitVec 64)) V!5601)

(assert (=> b!192952 (= e!126952 (= (apply!184 lt!96043 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000)) (get!2231 (select (arr!3843 (_values!3914 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!527 (defaultEntry!3931 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!192952 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4167 (_values!3914 thiss!1248))))))

(assert (=> b!192952 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4166 (_keys!5917 thiss!1248))))))

(declare-fun b!192953 () Bool)

(declare-fun e!126957 () Bool)

(declare-fun e!126955 () Bool)

(assert (=> b!192953 (= e!126957 e!126955)))

(declare-fun c!34808 () Bool)

(assert (=> b!192953 (= c!34808 (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19461 () Bool)

(declare-fun call!19467 () ListLongMap!2405)

(declare-fun call!19466 () ListLongMap!2405)

(assert (=> bm!19461 (= call!19467 call!19466)))

(declare-fun b!192954 () Bool)

(declare-fun e!126947 () Bool)

(declare-fun call!19464 () Bool)

(assert (=> b!192954 (= e!126947 (not call!19464))))

(declare-fun b!192955 () Bool)

(declare-fun e!126946 () ListLongMap!2405)

(declare-fun call!19469 () ListLongMap!2405)

(assert (=> b!192955 (= e!126946 call!19469)))

(declare-fun b!192957 () Bool)

(declare-fun e!126956 () Bool)

(assert (=> b!192957 (= e!126956 e!126952)))

(declare-fun res!91171 () Bool)

(assert (=> b!192957 (=> (not res!91171) (not e!126952))))

(assert (=> b!192957 (= res!91171 (contains!1348 lt!96043 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192957 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4166 (_keys!5917 thiss!1248))))))

(declare-fun b!192958 () Bool)

(declare-fun call!19470 () Bool)

(assert (=> b!192958 (= e!126955 (not call!19470))))

(declare-fun b!192959 () Bool)

(declare-fun e!126948 () Bool)

(assert (=> b!192959 (= e!126948 (validKeyInArray!0 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19462 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!215 (array!8159 array!8161 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 32) Int) ListLongMap!2405)

(assert (=> bm!19462 (= call!19466 (getCurrentListMapNoExtraKeys!215 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun bm!19463 () Bool)

(declare-fun call!19468 () ListLongMap!2405)

(assert (=> bm!19463 (= call!19469 call!19468)))

(declare-fun b!192960 () Bool)

(declare-fun e!126949 () Bool)

(assert (=> b!192960 (= e!126949 (= (apply!184 lt!96043 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3772 thiss!1248)))))

(declare-fun call!19465 () ListLongMap!2405)

(declare-fun c!34812 () Bool)

(declare-fun c!34809 () Bool)

(declare-fun bm!19464 () Bool)

(assert (=> bm!19464 (= call!19468 (+!311 (ite c!34809 call!19466 (ite c!34812 call!19467 call!19465)) (ite (or c!34809 c!34812) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3772 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3772 thiss!1248)))))))

(declare-fun bm!19465 () Bool)

(assert (=> bm!19465 (= call!19470 (contains!1348 lt!96043 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192961 () Bool)

(declare-fun lt!96042 () Unit!5817)

(assert (=> b!192961 (= e!126951 lt!96042)))

(declare-fun lt!96030 () ListLongMap!2405)

(assert (=> b!192961 (= lt!96030 (getCurrentListMapNoExtraKeys!215 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!96026 () (_ BitVec 64))

(assert (=> b!192961 (= lt!96026 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96023 () (_ BitVec 64))

(assert (=> b!192961 (= lt!96023 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96037 () Unit!5817)

(declare-fun addStillContains!160 (ListLongMap!2405 (_ BitVec 64) V!5601 (_ BitVec 64)) Unit!5817)

(assert (=> b!192961 (= lt!96037 (addStillContains!160 lt!96030 lt!96026 (zeroValue!3772 thiss!1248) lt!96023))))

(assert (=> b!192961 (contains!1348 (+!311 lt!96030 (tuple2!3485 lt!96026 (zeroValue!3772 thiss!1248))) lt!96023)))

(declare-fun lt!96039 () Unit!5817)

(assert (=> b!192961 (= lt!96039 lt!96037)))

(declare-fun lt!96022 () ListLongMap!2405)

(assert (=> b!192961 (= lt!96022 (getCurrentListMapNoExtraKeys!215 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!96028 () (_ BitVec 64))

(assert (=> b!192961 (= lt!96028 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96034 () (_ BitVec 64))

(assert (=> b!192961 (= lt!96034 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96033 () Unit!5817)

(declare-fun addApplyDifferent!160 (ListLongMap!2405 (_ BitVec 64) V!5601 (_ BitVec 64)) Unit!5817)

(assert (=> b!192961 (= lt!96033 (addApplyDifferent!160 lt!96022 lt!96028 (minValue!3772 thiss!1248) lt!96034))))

(assert (=> b!192961 (= (apply!184 (+!311 lt!96022 (tuple2!3485 lt!96028 (minValue!3772 thiss!1248))) lt!96034) (apply!184 lt!96022 lt!96034))))

(declare-fun lt!96031 () Unit!5817)

(assert (=> b!192961 (= lt!96031 lt!96033)))

(declare-fun lt!96040 () ListLongMap!2405)

(assert (=> b!192961 (= lt!96040 (getCurrentListMapNoExtraKeys!215 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!96041 () (_ BitVec 64))

(assert (=> b!192961 (= lt!96041 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96036 () (_ BitVec 64))

(assert (=> b!192961 (= lt!96036 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96029 () Unit!5817)

(assert (=> b!192961 (= lt!96029 (addApplyDifferent!160 lt!96040 lt!96041 (zeroValue!3772 thiss!1248) lt!96036))))

(assert (=> b!192961 (= (apply!184 (+!311 lt!96040 (tuple2!3485 lt!96041 (zeroValue!3772 thiss!1248))) lt!96036) (apply!184 lt!96040 lt!96036))))

(declare-fun lt!96038 () Unit!5817)

(assert (=> b!192961 (= lt!96038 lt!96029)))

(declare-fun lt!96024 () ListLongMap!2405)

(assert (=> b!192961 (= lt!96024 (getCurrentListMapNoExtraKeys!215 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!96035 () (_ BitVec 64))

(assert (=> b!192961 (= lt!96035 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96027 () (_ BitVec 64))

(assert (=> b!192961 (= lt!96027 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192961 (= lt!96042 (addApplyDifferent!160 lt!96024 lt!96035 (minValue!3772 thiss!1248) lt!96027))))

(assert (=> b!192961 (= (apply!184 (+!311 lt!96024 (tuple2!3485 lt!96035 (minValue!3772 thiss!1248))) lt!96027) (apply!184 lt!96024 lt!96027))))

(declare-fun b!192962 () Bool)

(declare-fun e!126945 () Bool)

(assert (=> b!192962 (= e!126945 (= (apply!184 lt!96043 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3772 thiss!1248)))))

(declare-fun b!192963 () Bool)

(declare-fun c!34811 () Bool)

(assert (=> b!192963 (= c!34811 (and (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!126953 () ListLongMap!2405)

(assert (=> b!192963 (= e!126953 e!126946)))

(declare-fun bm!19466 () Bool)

(assert (=> bm!19466 (= call!19465 call!19467)))

(declare-fun b!192956 () Bool)

(assert (=> b!192956 (= e!126953 call!19469)))

(declare-fun d!56607 () Bool)

(assert (=> d!56607 e!126957))

(declare-fun res!91174 () Bool)

(assert (=> d!56607 (=> (not res!91174) (not e!126957))))

(assert (=> d!56607 (= res!91174 (or (bvsge #b00000000000000000000000000000000 (size!4166 (_keys!5917 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4166 (_keys!5917 thiss!1248))))))))

(declare-fun lt!96032 () ListLongMap!2405)

(assert (=> d!56607 (= lt!96043 lt!96032)))

(declare-fun lt!96025 () Unit!5817)

(assert (=> d!56607 (= lt!96025 e!126951)))

(declare-fun c!34807 () Bool)

(declare-fun e!126950 () Bool)

(assert (=> d!56607 (= c!34807 e!126950)))

(declare-fun res!91169 () Bool)

(assert (=> d!56607 (=> (not res!91169) (not e!126950))))

(assert (=> d!56607 (= res!91169 (bvslt #b00000000000000000000000000000000 (size!4166 (_keys!5917 thiss!1248))))))

(declare-fun e!126954 () ListLongMap!2405)

(assert (=> d!56607 (= lt!96032 e!126954)))

(assert (=> d!56607 (= c!34809 (and (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56607 (validMask!0 (mask!9170 thiss!1248))))

(assert (=> d!56607 (= (getCurrentListMap!870 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)) lt!96043)))

(declare-fun b!192964 () Bool)

(assert (=> b!192964 (= e!126954 (+!311 call!19468 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3772 thiss!1248))))))

(declare-fun b!192965 () Bool)

(assert (=> b!192965 (= e!126946 call!19465)))

(declare-fun b!192966 () Bool)

(assert (=> b!192966 (= e!126947 e!126949)))

(declare-fun res!91170 () Bool)

(assert (=> b!192966 (= res!91170 call!19464)))

(assert (=> b!192966 (=> (not res!91170) (not e!126949))))

(declare-fun b!192967 () Bool)

(declare-fun res!91175 () Bool)

(assert (=> b!192967 (=> (not res!91175) (not e!126957))))

(assert (=> b!192967 (= res!91175 e!126947)))

(declare-fun c!34810 () Bool)

(assert (=> b!192967 (= c!34810 (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!192968 () Bool)

(declare-fun res!91173 () Bool)

(assert (=> b!192968 (=> (not res!91173) (not e!126957))))

(assert (=> b!192968 (= res!91173 e!126956)))

(declare-fun res!91176 () Bool)

(assert (=> b!192968 (=> res!91176 e!126956)))

(assert (=> b!192968 (= res!91176 (not e!126948))))

(declare-fun res!91172 () Bool)

(assert (=> b!192968 (=> (not res!91172) (not e!126948))))

(assert (=> b!192968 (= res!91172 (bvslt #b00000000000000000000000000000000 (size!4166 (_keys!5917 thiss!1248))))))

(declare-fun b!192969 () Bool)

(assert (=> b!192969 (= e!126950 (validKeyInArray!0 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192970 () Bool)

(assert (=> b!192970 (= e!126954 e!126953)))

(assert (=> b!192970 (= c!34812 (and (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!192971 () Bool)

(assert (=> b!192971 (= e!126955 e!126945)))

(declare-fun res!91177 () Bool)

(assert (=> b!192971 (= res!91177 call!19470)))

(assert (=> b!192971 (=> (not res!91177) (not e!126945))))

(declare-fun bm!19467 () Bool)

(assert (=> bm!19467 (= call!19464 (contains!1348 lt!96043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!56607 c!34809) b!192964))

(assert (= (and d!56607 (not c!34809)) b!192970))

(assert (= (and b!192970 c!34812) b!192956))

(assert (= (and b!192970 (not c!34812)) b!192963))

(assert (= (and b!192963 c!34811) b!192955))

(assert (= (and b!192963 (not c!34811)) b!192965))

(assert (= (or b!192955 b!192965) bm!19466))

(assert (= (or b!192956 bm!19466) bm!19461))

(assert (= (or b!192956 b!192955) bm!19463))

(assert (= (or b!192964 bm!19461) bm!19462))

(assert (= (or b!192964 bm!19463) bm!19464))

(assert (= (and d!56607 res!91169) b!192969))

(assert (= (and d!56607 c!34807) b!192961))

(assert (= (and d!56607 (not c!34807)) b!192951))

(assert (= (and d!56607 res!91174) b!192968))

(assert (= (and b!192968 res!91172) b!192959))

(assert (= (and b!192968 (not res!91176)) b!192957))

(assert (= (and b!192957 res!91171) b!192952))

(assert (= (and b!192968 res!91173) b!192967))

(assert (= (and b!192967 c!34810) b!192966))

(assert (= (and b!192967 (not c!34810)) b!192954))

(assert (= (and b!192966 res!91170) b!192960))

(assert (= (or b!192966 b!192954) bm!19467))

(assert (= (and b!192967 res!91175) b!192953))

(assert (= (and b!192953 c!34808) b!192971))

(assert (= (and b!192953 (not c!34808)) b!192958))

(assert (= (and b!192971 res!91177) b!192962))

(assert (= (or b!192971 b!192958) bm!19465))

(declare-fun b_lambda!7469 () Bool)

(assert (=> (not b_lambda!7469) (not b!192952)))

(declare-fun t!7306 () Bool)

(declare-fun tb!2871 () Bool)

(assert (=> (and b!192746 (= (defaultEntry!3931 thiss!1248) (defaultEntry!3931 thiss!1248)) t!7306) tb!2871))

(declare-fun result!4907 () Bool)

(assert (=> tb!2871 (= result!4907 tp_is_empty!4465)))

(assert (=> b!192952 t!7306))

(declare-fun b_and!11411 () Bool)

(assert (= b_and!11405 (and (=> t!7306 result!4907) b_and!11411)))

(assert (=> d!56607 m!219717))

(assert (=> b!192959 m!219847))

(assert (=> b!192959 m!219847))

(assert (=> b!192959 m!219857))

(declare-fun m!219883 () Bool)

(assert (=> b!192961 m!219883))

(declare-fun m!219885 () Bool)

(assert (=> b!192961 m!219885))

(declare-fun m!219887 () Bool)

(assert (=> b!192961 m!219887))

(declare-fun m!219889 () Bool)

(assert (=> b!192961 m!219889))

(declare-fun m!219891 () Bool)

(assert (=> b!192961 m!219891))

(declare-fun m!219893 () Bool)

(assert (=> b!192961 m!219893))

(declare-fun m!219895 () Bool)

(assert (=> b!192961 m!219895))

(declare-fun m!219897 () Bool)

(assert (=> b!192961 m!219897))

(declare-fun m!219899 () Bool)

(assert (=> b!192961 m!219899))

(assert (=> b!192961 m!219897))

(declare-fun m!219901 () Bool)

(assert (=> b!192961 m!219901))

(declare-fun m!219903 () Bool)

(assert (=> b!192961 m!219903))

(declare-fun m!219905 () Bool)

(assert (=> b!192961 m!219905))

(assert (=> b!192961 m!219891))

(declare-fun m!219907 () Bool)

(assert (=> b!192961 m!219907))

(assert (=> b!192961 m!219887))

(declare-fun m!219909 () Bool)

(assert (=> b!192961 m!219909))

(declare-fun m!219911 () Bool)

(assert (=> b!192961 m!219911))

(assert (=> b!192961 m!219893))

(declare-fun m!219913 () Bool)

(assert (=> b!192961 m!219913))

(assert (=> b!192961 m!219847))

(declare-fun m!219915 () Bool)

(assert (=> b!192962 m!219915))

(assert (=> bm!19462 m!219905))

(assert (=> b!192957 m!219847))

(assert (=> b!192957 m!219847))

(declare-fun m!219917 () Bool)

(assert (=> b!192957 m!219917))

(assert (=> b!192969 m!219847))

(assert (=> b!192969 m!219847))

(assert (=> b!192969 m!219857))

(declare-fun m!219919 () Bool)

(assert (=> b!192960 m!219919))

(declare-fun m!219921 () Bool)

(assert (=> bm!19464 m!219921))

(declare-fun m!219923 () Bool)

(assert (=> b!192952 m!219923))

(declare-fun m!219925 () Bool)

(assert (=> b!192952 m!219925))

(declare-fun m!219927 () Bool)

(assert (=> b!192952 m!219927))

(assert (=> b!192952 m!219925))

(assert (=> b!192952 m!219923))

(assert (=> b!192952 m!219847))

(declare-fun m!219929 () Bool)

(assert (=> b!192952 m!219929))

(assert (=> b!192952 m!219847))

(declare-fun m!219931 () Bool)

(assert (=> bm!19467 m!219931))

(declare-fun m!219933 () Bool)

(assert (=> bm!19465 m!219933))

(declare-fun m!219935 () Bool)

(assert (=> b!192964 m!219935))

(assert (=> b!192744 d!56607))

(declare-fun b!192974 () Bool)

(declare-fun e!126964 () Unit!5817)

(declare-fun Unit!5828 () Unit!5817)

(assert (=> b!192974 (= e!126964 Unit!5828)))

(declare-fun lt!96065 () ListLongMap!2405)

(declare-fun e!126965 () Bool)

(declare-fun b!192975 () Bool)

(assert (=> b!192975 (= e!126965 (= (apply!184 lt!96065 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000)) (get!2231 (select (arr!3843 (array!8162 (store (arr!3843 (_values!3914 thiss!1248)) (index!4855 lt!95883) (ValueCellFull!1889 v!309)) (size!4167 (_values!3914 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!527 (defaultEntry!3931 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!192975 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4167 (array!8162 (store (arr!3843 (_values!3914 thiss!1248)) (index!4855 lt!95883) (ValueCellFull!1889 v!309)) (size!4167 (_values!3914 thiss!1248))))))))

(assert (=> b!192975 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4166 (_keys!5917 thiss!1248))))))

(declare-fun b!192976 () Bool)

(declare-fun e!126970 () Bool)

(declare-fun e!126968 () Bool)

(assert (=> b!192976 (= e!126970 e!126968)))

(declare-fun c!34814 () Bool)

(assert (=> b!192976 (= c!34814 (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19468 () Bool)

(declare-fun call!19474 () ListLongMap!2405)

(declare-fun call!19473 () ListLongMap!2405)

(assert (=> bm!19468 (= call!19474 call!19473)))

(declare-fun b!192977 () Bool)

(declare-fun e!126960 () Bool)

(declare-fun call!19471 () Bool)

(assert (=> b!192977 (= e!126960 (not call!19471))))

(declare-fun b!192978 () Bool)

(declare-fun e!126959 () ListLongMap!2405)

(declare-fun call!19476 () ListLongMap!2405)

(assert (=> b!192978 (= e!126959 call!19476)))

(declare-fun b!192980 () Bool)

(declare-fun e!126969 () Bool)

(assert (=> b!192980 (= e!126969 e!126965)))

(declare-fun res!91180 () Bool)

(assert (=> b!192980 (=> (not res!91180) (not e!126965))))

(assert (=> b!192980 (= res!91180 (contains!1348 lt!96065 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192980 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4166 (_keys!5917 thiss!1248))))))

(declare-fun b!192981 () Bool)

(declare-fun call!19477 () Bool)

(assert (=> b!192981 (= e!126968 (not call!19477))))

(declare-fun b!192982 () Bool)

(declare-fun e!126961 () Bool)

(assert (=> b!192982 (= e!126961 (validKeyInArray!0 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19469 () Bool)

(assert (=> bm!19469 (= call!19473 (getCurrentListMapNoExtraKeys!215 (_keys!5917 thiss!1248) (array!8162 (store (arr!3843 (_values!3914 thiss!1248)) (index!4855 lt!95883) (ValueCellFull!1889 v!309)) (size!4167 (_values!3914 thiss!1248))) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun bm!19470 () Bool)

(declare-fun call!19475 () ListLongMap!2405)

(assert (=> bm!19470 (= call!19476 call!19475)))

(declare-fun b!192983 () Bool)

(declare-fun e!126962 () Bool)

(assert (=> b!192983 (= e!126962 (= (apply!184 lt!96065 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3772 thiss!1248)))))

(declare-fun c!34818 () Bool)

(declare-fun call!19472 () ListLongMap!2405)

(declare-fun c!34815 () Bool)

(declare-fun bm!19471 () Bool)

(assert (=> bm!19471 (= call!19475 (+!311 (ite c!34815 call!19473 (ite c!34818 call!19474 call!19472)) (ite (or c!34815 c!34818) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3772 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3772 thiss!1248)))))))

(declare-fun bm!19472 () Bool)

(assert (=> bm!19472 (= call!19477 (contains!1348 lt!96065 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192984 () Bool)

(declare-fun lt!96064 () Unit!5817)

(assert (=> b!192984 (= e!126964 lt!96064)))

(declare-fun lt!96052 () ListLongMap!2405)

(assert (=> b!192984 (= lt!96052 (getCurrentListMapNoExtraKeys!215 (_keys!5917 thiss!1248) (array!8162 (store (arr!3843 (_values!3914 thiss!1248)) (index!4855 lt!95883) (ValueCellFull!1889 v!309)) (size!4167 (_values!3914 thiss!1248))) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!96048 () (_ BitVec 64))

(assert (=> b!192984 (= lt!96048 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96045 () (_ BitVec 64))

(assert (=> b!192984 (= lt!96045 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96059 () Unit!5817)

(assert (=> b!192984 (= lt!96059 (addStillContains!160 lt!96052 lt!96048 (zeroValue!3772 thiss!1248) lt!96045))))

(assert (=> b!192984 (contains!1348 (+!311 lt!96052 (tuple2!3485 lt!96048 (zeroValue!3772 thiss!1248))) lt!96045)))

(declare-fun lt!96061 () Unit!5817)

(assert (=> b!192984 (= lt!96061 lt!96059)))

(declare-fun lt!96044 () ListLongMap!2405)

(assert (=> b!192984 (= lt!96044 (getCurrentListMapNoExtraKeys!215 (_keys!5917 thiss!1248) (array!8162 (store (arr!3843 (_values!3914 thiss!1248)) (index!4855 lt!95883) (ValueCellFull!1889 v!309)) (size!4167 (_values!3914 thiss!1248))) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!96050 () (_ BitVec 64))

(assert (=> b!192984 (= lt!96050 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96056 () (_ BitVec 64))

(assert (=> b!192984 (= lt!96056 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96055 () Unit!5817)

(assert (=> b!192984 (= lt!96055 (addApplyDifferent!160 lt!96044 lt!96050 (minValue!3772 thiss!1248) lt!96056))))

(assert (=> b!192984 (= (apply!184 (+!311 lt!96044 (tuple2!3485 lt!96050 (minValue!3772 thiss!1248))) lt!96056) (apply!184 lt!96044 lt!96056))))

(declare-fun lt!96053 () Unit!5817)

(assert (=> b!192984 (= lt!96053 lt!96055)))

(declare-fun lt!96062 () ListLongMap!2405)

(assert (=> b!192984 (= lt!96062 (getCurrentListMapNoExtraKeys!215 (_keys!5917 thiss!1248) (array!8162 (store (arr!3843 (_values!3914 thiss!1248)) (index!4855 lt!95883) (ValueCellFull!1889 v!309)) (size!4167 (_values!3914 thiss!1248))) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!96063 () (_ BitVec 64))

(assert (=> b!192984 (= lt!96063 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96058 () (_ BitVec 64))

(assert (=> b!192984 (= lt!96058 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96051 () Unit!5817)

(assert (=> b!192984 (= lt!96051 (addApplyDifferent!160 lt!96062 lt!96063 (zeroValue!3772 thiss!1248) lt!96058))))

(assert (=> b!192984 (= (apply!184 (+!311 lt!96062 (tuple2!3485 lt!96063 (zeroValue!3772 thiss!1248))) lt!96058) (apply!184 lt!96062 lt!96058))))

(declare-fun lt!96060 () Unit!5817)

(assert (=> b!192984 (= lt!96060 lt!96051)))

(declare-fun lt!96046 () ListLongMap!2405)

(assert (=> b!192984 (= lt!96046 (getCurrentListMapNoExtraKeys!215 (_keys!5917 thiss!1248) (array!8162 (store (arr!3843 (_values!3914 thiss!1248)) (index!4855 lt!95883) (ValueCellFull!1889 v!309)) (size!4167 (_values!3914 thiss!1248))) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)))))

(declare-fun lt!96057 () (_ BitVec 64))

(assert (=> b!192984 (= lt!96057 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96049 () (_ BitVec 64))

(assert (=> b!192984 (= lt!96049 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192984 (= lt!96064 (addApplyDifferent!160 lt!96046 lt!96057 (minValue!3772 thiss!1248) lt!96049))))

(assert (=> b!192984 (= (apply!184 (+!311 lt!96046 (tuple2!3485 lt!96057 (minValue!3772 thiss!1248))) lt!96049) (apply!184 lt!96046 lt!96049))))

(declare-fun b!192985 () Bool)

(declare-fun e!126958 () Bool)

(assert (=> b!192985 (= e!126958 (= (apply!184 lt!96065 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3772 thiss!1248)))))

(declare-fun b!192986 () Bool)

(declare-fun c!34817 () Bool)

(assert (=> b!192986 (= c!34817 (and (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!126966 () ListLongMap!2405)

(assert (=> b!192986 (= e!126966 e!126959)))

(declare-fun bm!19473 () Bool)

(assert (=> bm!19473 (= call!19472 call!19474)))

(declare-fun b!192979 () Bool)

(assert (=> b!192979 (= e!126966 call!19476)))

(declare-fun d!56609 () Bool)

(assert (=> d!56609 e!126970))

(declare-fun res!91183 () Bool)

(assert (=> d!56609 (=> (not res!91183) (not e!126970))))

(assert (=> d!56609 (= res!91183 (or (bvsge #b00000000000000000000000000000000 (size!4166 (_keys!5917 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4166 (_keys!5917 thiss!1248))))))))

(declare-fun lt!96054 () ListLongMap!2405)

(assert (=> d!56609 (= lt!96065 lt!96054)))

(declare-fun lt!96047 () Unit!5817)

(assert (=> d!56609 (= lt!96047 e!126964)))

(declare-fun c!34813 () Bool)

(declare-fun e!126963 () Bool)

(assert (=> d!56609 (= c!34813 e!126963)))

(declare-fun res!91178 () Bool)

(assert (=> d!56609 (=> (not res!91178) (not e!126963))))

(assert (=> d!56609 (= res!91178 (bvslt #b00000000000000000000000000000000 (size!4166 (_keys!5917 thiss!1248))))))

(declare-fun e!126967 () ListLongMap!2405)

(assert (=> d!56609 (= lt!96054 e!126967)))

(assert (=> d!56609 (= c!34815 (and (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56609 (validMask!0 (mask!9170 thiss!1248))))

(assert (=> d!56609 (= (getCurrentListMap!870 (_keys!5917 thiss!1248) (array!8162 (store (arr!3843 (_values!3914 thiss!1248)) (index!4855 lt!95883) (ValueCellFull!1889 v!309)) (size!4167 (_values!3914 thiss!1248))) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3931 thiss!1248)) lt!96065)))

(declare-fun b!192987 () Bool)

(assert (=> b!192987 (= e!126967 (+!311 call!19475 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3772 thiss!1248))))))

(declare-fun b!192988 () Bool)

(assert (=> b!192988 (= e!126959 call!19472)))

(declare-fun b!192989 () Bool)

(assert (=> b!192989 (= e!126960 e!126962)))

(declare-fun res!91179 () Bool)

(assert (=> b!192989 (= res!91179 call!19471)))

(assert (=> b!192989 (=> (not res!91179) (not e!126962))))

(declare-fun b!192990 () Bool)

(declare-fun res!91184 () Bool)

(assert (=> b!192990 (=> (not res!91184) (not e!126970))))

(assert (=> b!192990 (= res!91184 e!126960)))

(declare-fun c!34816 () Bool)

(assert (=> b!192990 (= c!34816 (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!192991 () Bool)

(declare-fun res!91182 () Bool)

(assert (=> b!192991 (=> (not res!91182) (not e!126970))))

(assert (=> b!192991 (= res!91182 e!126969)))

(declare-fun res!91185 () Bool)

(assert (=> b!192991 (=> res!91185 e!126969)))

(assert (=> b!192991 (= res!91185 (not e!126961))))

(declare-fun res!91181 () Bool)

(assert (=> b!192991 (=> (not res!91181) (not e!126961))))

(assert (=> b!192991 (= res!91181 (bvslt #b00000000000000000000000000000000 (size!4166 (_keys!5917 thiss!1248))))))

(declare-fun b!192992 () Bool)

(assert (=> b!192992 (= e!126963 (validKeyInArray!0 (select (arr!3842 (_keys!5917 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192993 () Bool)

(assert (=> b!192993 (= e!126967 e!126966)))

(assert (=> b!192993 (= c!34818 (and (not (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3668 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!192994 () Bool)

(assert (=> b!192994 (= e!126968 e!126958)))

(declare-fun res!91186 () Bool)

(assert (=> b!192994 (= res!91186 call!19477)))

(assert (=> b!192994 (=> (not res!91186) (not e!126958))))

(declare-fun bm!19474 () Bool)

(assert (=> bm!19474 (= call!19471 (contains!1348 lt!96065 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!56609 c!34815) b!192987))

(assert (= (and d!56609 (not c!34815)) b!192993))

(assert (= (and b!192993 c!34818) b!192979))

(assert (= (and b!192993 (not c!34818)) b!192986))

(assert (= (and b!192986 c!34817) b!192978))

(assert (= (and b!192986 (not c!34817)) b!192988))

(assert (= (or b!192978 b!192988) bm!19473))

(assert (= (or b!192979 bm!19473) bm!19468))

(assert (= (or b!192979 b!192978) bm!19470))

(assert (= (or b!192987 bm!19468) bm!19469))

(assert (= (or b!192987 bm!19470) bm!19471))

(assert (= (and d!56609 res!91178) b!192992))

(assert (= (and d!56609 c!34813) b!192984))

(assert (= (and d!56609 (not c!34813)) b!192974))

(assert (= (and d!56609 res!91183) b!192991))

(assert (= (and b!192991 res!91181) b!192982))

(assert (= (and b!192991 (not res!91185)) b!192980))

(assert (= (and b!192980 res!91180) b!192975))

(assert (= (and b!192991 res!91182) b!192990))

(assert (= (and b!192990 c!34816) b!192989))

(assert (= (and b!192990 (not c!34816)) b!192977))

(assert (= (and b!192989 res!91179) b!192983))

(assert (= (or b!192989 b!192977) bm!19474))

(assert (= (and b!192990 res!91184) b!192976))

(assert (= (and b!192976 c!34814) b!192994))

(assert (= (and b!192976 (not c!34814)) b!192981))

(assert (= (and b!192994 res!91186) b!192985))

(assert (= (or b!192994 b!192981) bm!19472))

(declare-fun b_lambda!7471 () Bool)

(assert (=> (not b_lambda!7471) (not b!192975)))

(assert (=> b!192975 t!7306))

(declare-fun b_and!11413 () Bool)

(assert (= b_and!11411 (and (=> t!7306 result!4907) b_and!11413)))

(assert (=> d!56609 m!219717))

(assert (=> b!192982 m!219847))

(assert (=> b!192982 m!219847))

(assert (=> b!192982 m!219857))

(declare-fun m!219937 () Bool)

(assert (=> b!192984 m!219937))

(declare-fun m!219939 () Bool)

(assert (=> b!192984 m!219939))

(declare-fun m!219941 () Bool)

(assert (=> b!192984 m!219941))

(declare-fun m!219943 () Bool)

(assert (=> b!192984 m!219943))

(declare-fun m!219945 () Bool)

(assert (=> b!192984 m!219945))

(declare-fun m!219947 () Bool)

(assert (=> b!192984 m!219947))

(declare-fun m!219949 () Bool)

(assert (=> b!192984 m!219949))

(declare-fun m!219951 () Bool)

(assert (=> b!192984 m!219951))

(declare-fun m!219953 () Bool)

(assert (=> b!192984 m!219953))

(assert (=> b!192984 m!219951))

(declare-fun m!219955 () Bool)

(assert (=> b!192984 m!219955))

(declare-fun m!219957 () Bool)

(assert (=> b!192984 m!219957))

(declare-fun m!219959 () Bool)

(assert (=> b!192984 m!219959))

(assert (=> b!192984 m!219945))

(declare-fun m!219961 () Bool)

(assert (=> b!192984 m!219961))

(assert (=> b!192984 m!219941))

(declare-fun m!219963 () Bool)

(assert (=> b!192984 m!219963))

(declare-fun m!219965 () Bool)

(assert (=> b!192984 m!219965))

(assert (=> b!192984 m!219947))

(declare-fun m!219967 () Bool)

(assert (=> b!192984 m!219967))

(assert (=> b!192984 m!219847))

(declare-fun m!219969 () Bool)

(assert (=> b!192985 m!219969))

(assert (=> bm!19469 m!219959))

(assert (=> b!192980 m!219847))

(assert (=> b!192980 m!219847))

(declare-fun m!219971 () Bool)

(assert (=> b!192980 m!219971))

(assert (=> b!192992 m!219847))

(assert (=> b!192992 m!219847))

(assert (=> b!192992 m!219857))

(declare-fun m!219973 () Bool)

(assert (=> b!192983 m!219973))

(declare-fun m!219975 () Bool)

(assert (=> bm!19471 m!219975))

(declare-fun m!219977 () Bool)

(assert (=> b!192975 m!219977))

(assert (=> b!192975 m!219925))

(declare-fun m!219979 () Bool)

(assert (=> b!192975 m!219979))

(assert (=> b!192975 m!219925))

(assert (=> b!192975 m!219977))

(assert (=> b!192975 m!219847))

(declare-fun m!219981 () Bool)

(assert (=> b!192975 m!219981))

(assert (=> b!192975 m!219847))

(declare-fun m!219983 () Bool)

(assert (=> bm!19474 m!219983))

(declare-fun m!219985 () Bool)

(assert (=> bm!19472 m!219985))

(declare-fun m!219987 () Bool)

(assert (=> b!192987 m!219987))

(assert (=> b!192744 d!56609))

(declare-fun d!56611 () Bool)

(assert (=> d!56611 (= (validMask!0 (mask!9170 thiss!1248)) (and (or (= (mask!9170 thiss!1248) #b00000000000000000000000000000111) (= (mask!9170 thiss!1248) #b00000000000000000000000000001111) (= (mask!9170 thiss!1248) #b00000000000000000000000000011111) (= (mask!9170 thiss!1248) #b00000000000000000000000000111111) (= (mask!9170 thiss!1248) #b00000000000000000000000001111111) (= (mask!9170 thiss!1248) #b00000000000000000000000011111111) (= (mask!9170 thiss!1248) #b00000000000000000000000111111111) (= (mask!9170 thiss!1248) #b00000000000000000000001111111111) (= (mask!9170 thiss!1248) #b00000000000000000000011111111111) (= (mask!9170 thiss!1248) #b00000000000000000000111111111111) (= (mask!9170 thiss!1248) #b00000000000000000001111111111111) (= (mask!9170 thiss!1248) #b00000000000000000011111111111111) (= (mask!9170 thiss!1248) #b00000000000000000111111111111111) (= (mask!9170 thiss!1248) #b00000000000000001111111111111111) (= (mask!9170 thiss!1248) #b00000000000000011111111111111111) (= (mask!9170 thiss!1248) #b00000000000000111111111111111111) (= (mask!9170 thiss!1248) #b00000000000001111111111111111111) (= (mask!9170 thiss!1248) #b00000000000011111111111111111111) (= (mask!9170 thiss!1248) #b00000000000111111111111111111111) (= (mask!9170 thiss!1248) #b00000000001111111111111111111111) (= (mask!9170 thiss!1248) #b00000000011111111111111111111111) (= (mask!9170 thiss!1248) #b00000000111111111111111111111111) (= (mask!9170 thiss!1248) #b00000001111111111111111111111111) (= (mask!9170 thiss!1248) #b00000011111111111111111111111111) (= (mask!9170 thiss!1248) #b00000111111111111111111111111111) (= (mask!9170 thiss!1248) #b00001111111111111111111111111111) (= (mask!9170 thiss!1248) #b00011111111111111111111111111111) (= (mask!9170 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9170 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!192744 d!56611))

(declare-fun b!193001 () Bool)

(declare-fun e!126975 () Bool)

(assert (=> b!193001 (= e!126975 tp_is_empty!4465)))

(declare-fun condMapEmpty!7727 () Bool)

(declare-fun mapDefault!7727 () ValueCell!1889)

(assert (=> mapNonEmpty!7718 (= condMapEmpty!7727 (= mapRest!7718 ((as const (Array (_ BitVec 32) ValueCell!1889)) mapDefault!7727)))))

(declare-fun e!126976 () Bool)

(declare-fun mapRes!7727 () Bool)

(assert (=> mapNonEmpty!7718 (= tp!16936 (and e!126976 mapRes!7727))))

(declare-fun mapIsEmpty!7727 () Bool)

(assert (=> mapIsEmpty!7727 mapRes!7727))

(declare-fun mapNonEmpty!7727 () Bool)

(declare-fun tp!16952 () Bool)

(assert (=> mapNonEmpty!7727 (= mapRes!7727 (and tp!16952 e!126975))))

(declare-fun mapKey!7727 () (_ BitVec 32))

(declare-fun mapValue!7727 () ValueCell!1889)

(declare-fun mapRest!7727 () (Array (_ BitVec 32) ValueCell!1889))

(assert (=> mapNonEmpty!7727 (= mapRest!7718 (store mapRest!7727 mapKey!7727 mapValue!7727))))

(declare-fun b!193002 () Bool)

(assert (=> b!193002 (= e!126976 tp_is_empty!4465)))

(assert (= (and mapNonEmpty!7718 condMapEmpty!7727) mapIsEmpty!7727))

(assert (= (and mapNonEmpty!7718 (not condMapEmpty!7727)) mapNonEmpty!7727))

(assert (= (and mapNonEmpty!7727 ((_ is ValueCellFull!1889) mapValue!7727)) b!193001))

(assert (= (and mapNonEmpty!7718 ((_ is ValueCellFull!1889) mapDefault!7727)) b!193002))

(declare-fun m!219989 () Bool)

(assert (=> mapNonEmpty!7727 m!219989))

(declare-fun b_lambda!7473 () Bool)

(assert (= b_lambda!7471 (or (and b!192746 b_free!4693) b_lambda!7473)))

(declare-fun b_lambda!7475 () Bool)

(assert (= b_lambda!7469 (or (and b!192746 b_free!4693) b_lambda!7475)))

(check-sat (not b!192992) (not b!192898) (not d!56607) (not b!192893) (not b!192984) (not b_lambda!7473) (not b!192961) (not b!192957) (not b!192887) tp_is_empty!4465 (not bm!19464) (not b!192906) (not b_next!4693) (not b!192852) (not d!56589) (not b!192959) (not bm!19442) (not d!56609) (not b!192985) (not d!56595) (not b!192980) (not bm!19469) (not bm!19467) (not b!192841) (not bm!19462) (not b!192908) (not b!192826) (not bm!19474) (not b!192952) (not d!56585) (not b!192889) (not d!56597) (not bm!19472) (not d!56605) (not b!192962) (not b!192975) (not d!56601) (not b!192899) (not b!192969) (not mapNonEmpty!7727) (not b!192964) (not b!192987) (not bm!19443) (not bm!19465) (not b!192982) b_and!11413 (not bm!19471) (not bm!19446) (not b!192960) (not b!192853) (not b_lambda!7475) (not d!56603) (not b!192983) (not b!192854))
(check-sat b_and!11413 (not b_next!4693))
