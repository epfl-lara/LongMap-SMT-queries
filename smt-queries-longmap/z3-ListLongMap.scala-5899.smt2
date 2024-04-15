; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76216 () Bool)

(assert start!76216)

(declare-fun b!894836 () Bool)

(declare-fun b_free!15895 () Bool)

(declare-fun b_next!15895 () Bool)

(assert (=> b!894836 (= b_free!15895 (not b_next!15895))))

(declare-fun tp!55687 () Bool)

(declare-fun b_and!26161 () Bool)

(assert (=> b!894836 (= tp!55687 b_and!26161)))

(declare-fun res!605463 () Bool)

(declare-fun e!499905 () Bool)

(assert (=> start!76216 (=> (not res!605463) (not e!499905))))

(declare-datatypes ((array!52427 0))(
  ( (array!52428 (arr!25211 (Array (_ BitVec 32) (_ BitVec 64))) (size!25661 (_ BitVec 32))) )
))
(declare-datatypes ((V!29263 0))(
  ( (V!29264 (val!9162 Int)) )
))
(declare-datatypes ((ValueCell!8630 0))(
  ( (ValueCellFull!8630 (v!11649 V!29263)) (EmptyCell!8630) )
))
(declare-datatypes ((array!52429 0))(
  ( (array!52430 (arr!25212 (Array (_ BitVec 32) ValueCell!8630)) (size!25662 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4276 0))(
  ( (LongMapFixedSize!4277 (defaultEntry!5350 Int) (mask!25926 (_ BitVec 32)) (extraKeys!5046 (_ BitVec 32)) (zeroValue!5150 V!29263) (minValue!5150 V!29263) (_size!2193 (_ BitVec 32)) (_keys!10052 array!52427) (_values!5337 array!52429) (_vacant!2193 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4276)

(declare-fun valid!1659 (LongMapFixedSize!4276) Bool)

(assert (=> start!76216 (= res!605463 (valid!1659 thiss!1181))))

(assert (=> start!76216 e!499905))

(declare-fun e!499908 () Bool)

(assert (=> start!76216 e!499908))

(assert (=> start!76216 true))

(declare-fun b!894834 () Bool)

(declare-fun e!499904 () Bool)

(declare-fun tp_is_empty!18223 () Bool)

(assert (=> b!894834 (= e!499904 tp_is_empty!18223)))

(declare-fun b!894835 () Bool)

(declare-fun e!499903 () Bool)

(assert (=> b!894835 (= e!499903 (and (= (size!25662 (_values!5337 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25926 thiss!1181))) (= (size!25661 (_keys!10052 thiss!1181)) (size!25662 (_values!5337 thiss!1181))) (bvsge (mask!25926 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5046 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun e!499907 () Bool)

(declare-fun array_inv!19848 (array!52427) Bool)

(declare-fun array_inv!19849 (array!52429) Bool)

(assert (=> b!894836 (= e!499908 (and tp!55687 tp_is_empty!18223 (array_inv!19848 (_keys!10052 thiss!1181)) (array_inv!19849 (_values!5337 thiss!1181)) e!499907))))

(declare-fun mapIsEmpty!28922 () Bool)

(declare-fun mapRes!28922 () Bool)

(assert (=> mapIsEmpty!28922 mapRes!28922))

(declare-fun b!894837 () Bool)

(assert (=> b!894837 (= e!499907 (and e!499904 mapRes!28922))))

(declare-fun condMapEmpty!28922 () Bool)

(declare-fun mapDefault!28922 () ValueCell!8630)

(assert (=> b!894837 (= condMapEmpty!28922 (= (arr!25212 (_values!5337 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8630)) mapDefault!28922)))))

(declare-fun b!894838 () Bool)

(declare-fun e!499906 () Bool)

(assert (=> b!894838 (= e!499906 tp_is_empty!18223)))

(declare-fun b!894839 () Bool)

(declare-fun res!605462 () Bool)

(assert (=> b!894839 (=> (not res!605462) (not e!499905))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!894839 (= res!605462 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!28922 () Bool)

(declare-fun tp!55688 () Bool)

(assert (=> mapNonEmpty!28922 (= mapRes!28922 (and tp!55688 e!499906))))

(declare-fun mapKey!28922 () (_ BitVec 32))

(declare-fun mapValue!28922 () ValueCell!8630)

(declare-fun mapRest!28922 () (Array (_ BitVec 32) ValueCell!8630))

(assert (=> mapNonEmpty!28922 (= (arr!25212 (_values!5337 thiss!1181)) (store mapRest!28922 mapKey!28922 mapValue!28922))))

(declare-fun b!894840 () Bool)

(assert (=> b!894840 (= e!499905 e!499903)))

(declare-fun res!605464 () Bool)

(assert (=> b!894840 (=> (not res!605464) (not e!499903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!894840 (= res!605464 (validMask!0 (mask!25926 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8879 0))(
  ( (MissingZero!8879 (index!37887 (_ BitVec 32))) (Found!8879 (index!37888 (_ BitVec 32))) (Intermediate!8879 (undefined!9691 Bool) (index!37889 (_ BitVec 32)) (x!76136 (_ BitVec 32))) (Undefined!8879) (MissingVacant!8879 (index!37890 (_ BitVec 32))) )
))
(declare-fun lt!404195 () SeekEntryResult!8879)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52427 (_ BitVec 32)) SeekEntryResult!8879)

(assert (=> b!894840 (= lt!404195 (seekEntry!0 key!785 (_keys!10052 thiss!1181) (mask!25926 thiss!1181)))))

(assert (= (and start!76216 res!605463) b!894839))

(assert (= (and b!894839 res!605462) b!894840))

(assert (= (and b!894840 res!605464) b!894835))

(assert (= (and b!894837 condMapEmpty!28922) mapIsEmpty!28922))

(assert (= (and b!894837 (not condMapEmpty!28922)) mapNonEmpty!28922))

(get-info :version)

(assert (= (and mapNonEmpty!28922 ((_ is ValueCellFull!8630) mapValue!28922)) b!894838))

(assert (= (and b!894837 ((_ is ValueCellFull!8630) mapDefault!28922)) b!894834))

(assert (= b!894836 b!894837))

(assert (= start!76216 b!894836))

(declare-fun m!832083 () Bool)

(assert (=> start!76216 m!832083))

(declare-fun m!832085 () Bool)

(assert (=> b!894836 m!832085))

(declare-fun m!832087 () Bool)

(assert (=> b!894836 m!832087))

(declare-fun m!832089 () Bool)

(assert (=> mapNonEmpty!28922 m!832089))

(declare-fun m!832091 () Bool)

(assert (=> b!894840 m!832091))

(declare-fun m!832093 () Bool)

(assert (=> b!894840 m!832093))

(check-sat tp_is_empty!18223 (not start!76216) (not b!894840) (not b!894836) b_and!26161 (not mapNonEmpty!28922) (not b_next!15895))
(check-sat b_and!26161 (not b_next!15895))
(get-model)

(declare-fun d!110533 () Bool)

(assert (=> d!110533 (= (array_inv!19848 (_keys!10052 thiss!1181)) (bvsge (size!25661 (_keys!10052 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894836 d!110533))

(declare-fun d!110535 () Bool)

(assert (=> d!110535 (= (array_inv!19849 (_values!5337 thiss!1181)) (bvsge (size!25662 (_values!5337 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894836 d!110535))

(declare-fun d!110537 () Bool)

(declare-fun res!605489 () Bool)

(declare-fun e!499953 () Bool)

(assert (=> d!110537 (=> (not res!605489) (not e!499953))))

(declare-fun simpleValid!304 (LongMapFixedSize!4276) Bool)

(assert (=> d!110537 (= res!605489 (simpleValid!304 thiss!1181))))

(assert (=> d!110537 (= (valid!1659 thiss!1181) e!499953)))

(declare-fun b!894889 () Bool)

(declare-fun res!605490 () Bool)

(assert (=> b!894889 (=> (not res!605490) (not e!499953))))

(declare-fun arrayCountValidKeys!0 (array!52427 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894889 (= res!605490 (= (arrayCountValidKeys!0 (_keys!10052 thiss!1181) #b00000000000000000000000000000000 (size!25661 (_keys!10052 thiss!1181))) (_size!2193 thiss!1181)))))

(declare-fun b!894890 () Bool)

(declare-fun res!605491 () Bool)

(assert (=> b!894890 (=> (not res!605491) (not e!499953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52427 (_ BitVec 32)) Bool)

(assert (=> b!894890 (= res!605491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10052 thiss!1181) (mask!25926 thiss!1181)))))

(declare-fun b!894891 () Bool)

(declare-datatypes ((List!17819 0))(
  ( (Nil!17816) (Cons!17815 (h!18950 (_ BitVec 64)) (t!25149 List!17819)) )
))
(declare-fun arrayNoDuplicates!0 (array!52427 (_ BitVec 32) List!17819) Bool)

(assert (=> b!894891 (= e!499953 (arrayNoDuplicates!0 (_keys!10052 thiss!1181) #b00000000000000000000000000000000 Nil!17816))))

(assert (= (and d!110537 res!605489) b!894889))

(assert (= (and b!894889 res!605490) b!894890))

(assert (= (and b!894890 res!605491) b!894891))

(declare-fun m!832119 () Bool)

(assert (=> d!110537 m!832119))

(declare-fun m!832121 () Bool)

(assert (=> b!894889 m!832121))

(declare-fun m!832123 () Bool)

(assert (=> b!894890 m!832123))

(declare-fun m!832125 () Bool)

(assert (=> b!894891 m!832125))

(assert (=> start!76216 d!110537))

(declare-fun d!110539 () Bool)

(assert (=> d!110539 (= (validMask!0 (mask!25926 thiss!1181)) (and (or (= (mask!25926 thiss!1181) #b00000000000000000000000000000111) (= (mask!25926 thiss!1181) #b00000000000000000000000000001111) (= (mask!25926 thiss!1181) #b00000000000000000000000000011111) (= (mask!25926 thiss!1181) #b00000000000000000000000000111111) (= (mask!25926 thiss!1181) #b00000000000000000000000001111111) (= (mask!25926 thiss!1181) #b00000000000000000000000011111111) (= (mask!25926 thiss!1181) #b00000000000000000000000111111111) (= (mask!25926 thiss!1181) #b00000000000000000000001111111111) (= (mask!25926 thiss!1181) #b00000000000000000000011111111111) (= (mask!25926 thiss!1181) #b00000000000000000000111111111111) (= (mask!25926 thiss!1181) #b00000000000000000001111111111111) (= (mask!25926 thiss!1181) #b00000000000000000011111111111111) (= (mask!25926 thiss!1181) #b00000000000000000111111111111111) (= (mask!25926 thiss!1181) #b00000000000000001111111111111111) (= (mask!25926 thiss!1181) #b00000000000000011111111111111111) (= (mask!25926 thiss!1181) #b00000000000000111111111111111111) (= (mask!25926 thiss!1181) #b00000000000001111111111111111111) (= (mask!25926 thiss!1181) #b00000000000011111111111111111111) (= (mask!25926 thiss!1181) #b00000000000111111111111111111111) (= (mask!25926 thiss!1181) #b00000000001111111111111111111111) (= (mask!25926 thiss!1181) #b00000000011111111111111111111111) (= (mask!25926 thiss!1181) #b00000000111111111111111111111111) (= (mask!25926 thiss!1181) #b00000001111111111111111111111111) (= (mask!25926 thiss!1181) #b00000011111111111111111111111111) (= (mask!25926 thiss!1181) #b00000111111111111111111111111111) (= (mask!25926 thiss!1181) #b00001111111111111111111111111111) (= (mask!25926 thiss!1181) #b00011111111111111111111111111111) (= (mask!25926 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25926 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!894840 d!110539))

(declare-fun b!894904 () Bool)

(declare-fun e!499961 () SeekEntryResult!8879)

(declare-fun lt!404210 () SeekEntryResult!8879)

(assert (=> b!894904 (= e!499961 (MissingZero!8879 (index!37889 lt!404210)))))

(declare-fun b!894905 () Bool)

(declare-fun e!499962 () SeekEntryResult!8879)

(assert (=> b!894905 (= e!499962 (Found!8879 (index!37889 lt!404210)))))

(declare-fun b!894906 () Bool)

(declare-fun e!499960 () SeekEntryResult!8879)

(assert (=> b!894906 (= e!499960 Undefined!8879)))

(declare-fun b!894907 () Bool)

(declare-fun lt!404212 () SeekEntryResult!8879)

(assert (=> b!894907 (= e!499961 (ite ((_ is MissingVacant!8879) lt!404212) (MissingZero!8879 (index!37890 lt!404212)) lt!404212))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52427 (_ BitVec 32)) SeekEntryResult!8879)

(assert (=> b!894907 (= lt!404212 (seekKeyOrZeroReturnVacant!0 (x!76136 lt!404210) (index!37889 lt!404210) (index!37889 lt!404210) key!785 (_keys!10052 thiss!1181) (mask!25926 thiss!1181)))))

(declare-fun d!110541 () Bool)

(declare-fun lt!404211 () SeekEntryResult!8879)

(assert (=> d!110541 (and (or ((_ is MissingVacant!8879) lt!404211) (not ((_ is Found!8879) lt!404211)) (and (bvsge (index!37888 lt!404211) #b00000000000000000000000000000000) (bvslt (index!37888 lt!404211) (size!25661 (_keys!10052 thiss!1181))))) (not ((_ is MissingVacant!8879) lt!404211)) (or (not ((_ is Found!8879) lt!404211)) (= (select (arr!25211 (_keys!10052 thiss!1181)) (index!37888 lt!404211)) key!785)))))

(assert (=> d!110541 (= lt!404211 e!499960)))

(declare-fun c!94439 () Bool)

(assert (=> d!110541 (= c!94439 (and ((_ is Intermediate!8879) lt!404210) (undefined!9691 lt!404210)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52427 (_ BitVec 32)) SeekEntryResult!8879)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110541 (= lt!404210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25926 thiss!1181)) key!785 (_keys!10052 thiss!1181) (mask!25926 thiss!1181)))))

(assert (=> d!110541 (validMask!0 (mask!25926 thiss!1181))))

(assert (=> d!110541 (= (seekEntry!0 key!785 (_keys!10052 thiss!1181) (mask!25926 thiss!1181)) lt!404211)))

(declare-fun b!894908 () Bool)

(assert (=> b!894908 (= e!499960 e!499962)))

(declare-fun lt!404213 () (_ BitVec 64))

(assert (=> b!894908 (= lt!404213 (select (arr!25211 (_keys!10052 thiss!1181)) (index!37889 lt!404210)))))

(declare-fun c!94438 () Bool)

(assert (=> b!894908 (= c!94438 (= lt!404213 key!785))))

(declare-fun b!894909 () Bool)

(declare-fun c!94440 () Bool)

(assert (=> b!894909 (= c!94440 (= lt!404213 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894909 (= e!499962 e!499961)))

(assert (= (and d!110541 c!94439) b!894906))

(assert (= (and d!110541 (not c!94439)) b!894908))

(assert (= (and b!894908 c!94438) b!894905))

(assert (= (and b!894908 (not c!94438)) b!894909))

(assert (= (and b!894909 c!94440) b!894904))

(assert (= (and b!894909 (not c!94440)) b!894907))

(declare-fun m!832127 () Bool)

(assert (=> b!894907 m!832127))

(declare-fun m!832129 () Bool)

(assert (=> d!110541 m!832129))

(declare-fun m!832131 () Bool)

(assert (=> d!110541 m!832131))

(assert (=> d!110541 m!832131))

(declare-fun m!832133 () Bool)

(assert (=> d!110541 m!832133))

(assert (=> d!110541 m!832091))

(declare-fun m!832135 () Bool)

(assert (=> b!894908 m!832135))

(assert (=> b!894840 d!110541))

(declare-fun b!894916 () Bool)

(declare-fun e!499967 () Bool)

(assert (=> b!894916 (= e!499967 tp_is_empty!18223)))

(declare-fun b!894917 () Bool)

(declare-fun e!499968 () Bool)

(assert (=> b!894917 (= e!499968 tp_is_empty!18223)))

(declare-fun condMapEmpty!28931 () Bool)

(declare-fun mapDefault!28931 () ValueCell!8630)

(assert (=> mapNonEmpty!28922 (= condMapEmpty!28931 (= mapRest!28922 ((as const (Array (_ BitVec 32) ValueCell!8630)) mapDefault!28931)))))

(declare-fun mapRes!28931 () Bool)

(assert (=> mapNonEmpty!28922 (= tp!55688 (and e!499968 mapRes!28931))))

(declare-fun mapNonEmpty!28931 () Bool)

(declare-fun tp!55703 () Bool)

(assert (=> mapNonEmpty!28931 (= mapRes!28931 (and tp!55703 e!499967))))

(declare-fun mapKey!28931 () (_ BitVec 32))

(declare-fun mapValue!28931 () ValueCell!8630)

(declare-fun mapRest!28931 () (Array (_ BitVec 32) ValueCell!8630))

(assert (=> mapNonEmpty!28931 (= mapRest!28922 (store mapRest!28931 mapKey!28931 mapValue!28931))))

(declare-fun mapIsEmpty!28931 () Bool)

(assert (=> mapIsEmpty!28931 mapRes!28931))

(assert (= (and mapNonEmpty!28922 condMapEmpty!28931) mapIsEmpty!28931))

(assert (= (and mapNonEmpty!28922 (not condMapEmpty!28931)) mapNonEmpty!28931))

(assert (= (and mapNonEmpty!28931 ((_ is ValueCellFull!8630) mapValue!28931)) b!894916))

(assert (= (and mapNonEmpty!28922 ((_ is ValueCellFull!8630) mapDefault!28931)) b!894917))

(declare-fun m!832137 () Bool)

(assert (=> mapNonEmpty!28931 m!832137))

(check-sat tp_is_empty!18223 (not b!894890) (not b!894889) (not d!110541) (not b!894891) (not b_next!15895) (not mapNonEmpty!28931) b_and!26161 (not b!894907) (not d!110537))
(check-sat b_and!26161 (not b_next!15895))
(get-model)

(declare-fun b!894930 () Bool)

(declare-fun c!94447 () Bool)

(declare-fun lt!404219 () (_ BitVec 64))

(assert (=> b!894930 (= c!94447 (= lt!404219 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!499975 () SeekEntryResult!8879)

(declare-fun e!499977 () SeekEntryResult!8879)

(assert (=> b!894930 (= e!499975 e!499977)))

(declare-fun b!894932 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894932 (= e!499977 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76136 lt!404210) #b00000000000000000000000000000001) (nextIndex!0 (index!37889 lt!404210) (x!76136 lt!404210) (mask!25926 thiss!1181)) (index!37889 lt!404210) key!785 (_keys!10052 thiss!1181) (mask!25926 thiss!1181)))))

(declare-fun b!894933 () Bool)

(declare-fun e!499976 () SeekEntryResult!8879)

(assert (=> b!894933 (= e!499976 Undefined!8879)))

(declare-fun b!894934 () Bool)

(assert (=> b!894934 (= e!499976 e!499975)))

(declare-fun c!94448 () Bool)

(assert (=> b!894934 (= c!94448 (= lt!404219 key!785))))

(declare-fun b!894935 () Bool)

(assert (=> b!894935 (= e!499975 (Found!8879 (index!37889 lt!404210)))))

(declare-fun b!894931 () Bool)

(assert (=> b!894931 (= e!499977 (MissingVacant!8879 (index!37889 lt!404210)))))

(declare-fun d!110543 () Bool)

(declare-fun lt!404218 () SeekEntryResult!8879)

(assert (=> d!110543 (and (or ((_ is Undefined!8879) lt!404218) (not ((_ is Found!8879) lt!404218)) (and (bvsge (index!37888 lt!404218) #b00000000000000000000000000000000) (bvslt (index!37888 lt!404218) (size!25661 (_keys!10052 thiss!1181))))) (or ((_ is Undefined!8879) lt!404218) ((_ is Found!8879) lt!404218) (not ((_ is MissingVacant!8879) lt!404218)) (not (= (index!37890 lt!404218) (index!37889 lt!404210))) (and (bvsge (index!37890 lt!404218) #b00000000000000000000000000000000) (bvslt (index!37890 lt!404218) (size!25661 (_keys!10052 thiss!1181))))) (or ((_ is Undefined!8879) lt!404218) (ite ((_ is Found!8879) lt!404218) (= (select (arr!25211 (_keys!10052 thiss!1181)) (index!37888 lt!404218)) key!785) (and ((_ is MissingVacant!8879) lt!404218) (= (index!37890 lt!404218) (index!37889 lt!404210)) (= (select (arr!25211 (_keys!10052 thiss!1181)) (index!37890 lt!404218)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!110543 (= lt!404218 e!499976)))

(declare-fun c!94449 () Bool)

(assert (=> d!110543 (= c!94449 (bvsge (x!76136 lt!404210) #b01111111111111111111111111111110))))

(assert (=> d!110543 (= lt!404219 (select (arr!25211 (_keys!10052 thiss!1181)) (index!37889 lt!404210)))))

(assert (=> d!110543 (validMask!0 (mask!25926 thiss!1181))))

(assert (=> d!110543 (= (seekKeyOrZeroReturnVacant!0 (x!76136 lt!404210) (index!37889 lt!404210) (index!37889 lt!404210) key!785 (_keys!10052 thiss!1181) (mask!25926 thiss!1181)) lt!404218)))

(assert (= (and d!110543 c!94449) b!894933))

(assert (= (and d!110543 (not c!94449)) b!894934))

(assert (= (and b!894934 c!94448) b!894935))

(assert (= (and b!894934 (not c!94448)) b!894930))

(assert (= (and b!894930 c!94447) b!894931))

(assert (= (and b!894930 (not c!94447)) b!894932))

(declare-fun m!832139 () Bool)

(assert (=> b!894932 m!832139))

(assert (=> b!894932 m!832139))

(declare-fun m!832141 () Bool)

(assert (=> b!894932 m!832141))

(declare-fun m!832143 () Bool)

(assert (=> d!110543 m!832143))

(declare-fun m!832145 () Bool)

(assert (=> d!110543 m!832145))

(assert (=> d!110543 m!832135))

(assert (=> d!110543 m!832091))

(assert (=> b!894907 d!110543))

(declare-fun b!894947 () Bool)

(declare-fun e!499980 () Bool)

(assert (=> b!894947 (= e!499980 (and (bvsge (extraKeys!5046 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5046 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2193 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!894944 () Bool)

(declare-fun res!605501 () Bool)

(assert (=> b!894944 (=> (not res!605501) (not e!499980))))

(assert (=> b!894944 (= res!605501 (and (= (size!25662 (_values!5337 thiss!1181)) (bvadd (mask!25926 thiss!1181) #b00000000000000000000000000000001)) (= (size!25661 (_keys!10052 thiss!1181)) (size!25662 (_values!5337 thiss!1181))) (bvsge (_size!2193 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2193 thiss!1181) (bvadd (mask!25926 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun d!110545 () Bool)

(declare-fun res!605500 () Bool)

(assert (=> d!110545 (=> (not res!605500) (not e!499980))))

(assert (=> d!110545 (= res!605500 (validMask!0 (mask!25926 thiss!1181)))))

(assert (=> d!110545 (= (simpleValid!304 thiss!1181) e!499980)))

(declare-fun b!894945 () Bool)

(declare-fun res!605503 () Bool)

(assert (=> b!894945 (=> (not res!605503) (not e!499980))))

(declare-fun size!25667 (LongMapFixedSize!4276) (_ BitVec 32))

(assert (=> b!894945 (= res!605503 (bvsge (size!25667 thiss!1181) (_size!2193 thiss!1181)))))

(declare-fun b!894946 () Bool)

(declare-fun res!605502 () Bool)

(assert (=> b!894946 (=> (not res!605502) (not e!499980))))

(assert (=> b!894946 (= res!605502 (= (size!25667 thiss!1181) (bvadd (_size!2193 thiss!1181) (bvsdiv (bvadd (extraKeys!5046 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!110545 res!605500) b!894944))

(assert (= (and b!894944 res!605501) b!894945))

(assert (= (and b!894945 res!605503) b!894946))

(assert (= (and b!894946 res!605502) b!894947))

(assert (=> d!110545 m!832091))

(declare-fun m!832147 () Bool)

(assert (=> b!894945 m!832147))

(assert (=> b!894946 m!832147))

(assert (=> d!110537 d!110545))

(declare-fun b!894958 () Bool)

(declare-fun e!499991 () Bool)

(declare-fun call!39713 () Bool)

(assert (=> b!894958 (= e!499991 call!39713)))

(declare-fun b!894960 () Bool)

(declare-fun e!499989 () Bool)

(declare-fun e!499992 () Bool)

(assert (=> b!894960 (= e!499989 e!499992)))

(declare-fun res!605511 () Bool)

(assert (=> b!894960 (=> (not res!605511) (not e!499992))))

(declare-fun e!499990 () Bool)

(assert (=> b!894960 (= res!605511 (not e!499990))))

(declare-fun res!605512 () Bool)

(assert (=> b!894960 (=> (not res!605512) (not e!499990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!894960 (= res!605512 (validKeyInArray!0 (select (arr!25211 (_keys!10052 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894961 () Bool)

(assert (=> b!894961 (= e!499992 e!499991)))

(declare-fun c!94452 () Bool)

(assert (=> b!894961 (= c!94452 (validKeyInArray!0 (select (arr!25211 (_keys!10052 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894962 () Bool)

(declare-fun contains!4366 (List!17819 (_ BitVec 64)) Bool)

(assert (=> b!894962 (= e!499990 (contains!4366 Nil!17816 (select (arr!25211 (_keys!10052 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39710 () Bool)

(assert (=> bm!39710 (= call!39713 (arrayNoDuplicates!0 (_keys!10052 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94452 (Cons!17815 (select (arr!25211 (_keys!10052 thiss!1181)) #b00000000000000000000000000000000) Nil!17816) Nil!17816)))))

(declare-fun d!110547 () Bool)

(declare-fun res!605510 () Bool)

(assert (=> d!110547 (=> res!605510 e!499989)))

(assert (=> d!110547 (= res!605510 (bvsge #b00000000000000000000000000000000 (size!25661 (_keys!10052 thiss!1181))))))

(assert (=> d!110547 (= (arrayNoDuplicates!0 (_keys!10052 thiss!1181) #b00000000000000000000000000000000 Nil!17816) e!499989)))

(declare-fun b!894959 () Bool)

(assert (=> b!894959 (= e!499991 call!39713)))

(assert (= (and d!110547 (not res!605510)) b!894960))

(assert (= (and b!894960 res!605512) b!894962))

(assert (= (and b!894960 res!605511) b!894961))

(assert (= (and b!894961 c!94452) b!894959))

(assert (= (and b!894961 (not c!94452)) b!894958))

(assert (= (or b!894959 b!894958) bm!39710))

(declare-fun m!832149 () Bool)

(assert (=> b!894960 m!832149))

(assert (=> b!894960 m!832149))

(declare-fun m!832151 () Bool)

(assert (=> b!894960 m!832151))

(assert (=> b!894961 m!832149))

(assert (=> b!894961 m!832149))

(assert (=> b!894961 m!832151))

(assert (=> b!894962 m!832149))

(assert (=> b!894962 m!832149))

(declare-fun m!832153 () Bool)

(assert (=> b!894962 m!832153))

(assert (=> bm!39710 m!832149))

(declare-fun m!832155 () Bool)

(assert (=> bm!39710 m!832155))

(assert (=> b!894891 d!110547))

(declare-fun b!894981 () Bool)

(declare-fun lt!404225 () SeekEntryResult!8879)

(assert (=> b!894981 (and (bvsge (index!37889 lt!404225) #b00000000000000000000000000000000) (bvslt (index!37889 lt!404225) (size!25661 (_keys!10052 thiss!1181))))))

(declare-fun e!500004 () Bool)

(assert (=> b!894981 (= e!500004 (= (select (arr!25211 (_keys!10052 thiss!1181)) (index!37889 lt!404225)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894982 () Bool)

(declare-fun e!500005 () Bool)

(assert (=> b!894982 (= e!500005 (bvsge (x!76136 lt!404225) #b01111111111111111111111111111110))))

(declare-fun d!110549 () Bool)

(assert (=> d!110549 e!500005))

(declare-fun c!94461 () Bool)

(assert (=> d!110549 (= c!94461 (and ((_ is Intermediate!8879) lt!404225) (undefined!9691 lt!404225)))))

(declare-fun e!500003 () SeekEntryResult!8879)

(assert (=> d!110549 (= lt!404225 e!500003)))

(declare-fun c!94460 () Bool)

(assert (=> d!110549 (= c!94460 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!404224 () (_ BitVec 64))

(assert (=> d!110549 (= lt!404224 (select (arr!25211 (_keys!10052 thiss!1181)) (toIndex!0 key!785 (mask!25926 thiss!1181))))))

(assert (=> d!110549 (validMask!0 (mask!25926 thiss!1181))))

(assert (=> d!110549 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25926 thiss!1181)) key!785 (_keys!10052 thiss!1181) (mask!25926 thiss!1181)) lt!404225)))

(declare-fun b!894983 () Bool)

(declare-fun e!500006 () Bool)

(assert (=> b!894983 (= e!500005 e!500006)))

(declare-fun res!605521 () Bool)

(assert (=> b!894983 (= res!605521 (and ((_ is Intermediate!8879) lt!404225) (not (undefined!9691 lt!404225)) (bvslt (x!76136 lt!404225) #b01111111111111111111111111111110) (bvsge (x!76136 lt!404225) #b00000000000000000000000000000000) (bvsge (x!76136 lt!404225) #b00000000000000000000000000000000)))))

(assert (=> b!894983 (=> (not res!605521) (not e!500006))))

(declare-fun b!894984 () Bool)

(assert (=> b!894984 (and (bvsge (index!37889 lt!404225) #b00000000000000000000000000000000) (bvslt (index!37889 lt!404225) (size!25661 (_keys!10052 thiss!1181))))))

(declare-fun res!605519 () Bool)

(assert (=> b!894984 (= res!605519 (= (select (arr!25211 (_keys!10052 thiss!1181)) (index!37889 lt!404225)) key!785))))

(assert (=> b!894984 (=> res!605519 e!500004)))

(assert (=> b!894984 (= e!500006 e!500004)))

(declare-fun b!894985 () Bool)

(declare-fun e!500007 () SeekEntryResult!8879)

(assert (=> b!894985 (= e!500007 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25926 thiss!1181)) #b00000000000000000000000000000000 (mask!25926 thiss!1181)) key!785 (_keys!10052 thiss!1181) (mask!25926 thiss!1181)))))

(declare-fun b!894986 () Bool)

(assert (=> b!894986 (and (bvsge (index!37889 lt!404225) #b00000000000000000000000000000000) (bvslt (index!37889 lt!404225) (size!25661 (_keys!10052 thiss!1181))))))

(declare-fun res!605520 () Bool)

(assert (=> b!894986 (= res!605520 (= (select (arr!25211 (_keys!10052 thiss!1181)) (index!37889 lt!404225)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894986 (=> res!605520 e!500004)))

(declare-fun b!894987 () Bool)

(assert (=> b!894987 (= e!500007 (Intermediate!8879 false (toIndex!0 key!785 (mask!25926 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!894988 () Bool)

(assert (=> b!894988 (= e!500003 (Intermediate!8879 true (toIndex!0 key!785 (mask!25926 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!894989 () Bool)

(assert (=> b!894989 (= e!500003 e!500007)))

(declare-fun c!94459 () Bool)

(assert (=> b!894989 (= c!94459 (or (= lt!404224 key!785) (= (bvadd lt!404224 lt!404224) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110549 c!94460) b!894988))

(assert (= (and d!110549 (not c!94460)) b!894989))

(assert (= (and b!894989 c!94459) b!894987))

(assert (= (and b!894989 (not c!94459)) b!894985))

(assert (= (and d!110549 c!94461) b!894982))

(assert (= (and d!110549 (not c!94461)) b!894983))

(assert (= (and b!894983 res!605521) b!894984))

(assert (= (and b!894984 (not res!605519)) b!894986))

(assert (= (and b!894986 (not res!605520)) b!894981))

(assert (=> d!110549 m!832131))

(declare-fun m!832157 () Bool)

(assert (=> d!110549 m!832157))

(assert (=> d!110549 m!832091))

(declare-fun m!832159 () Bool)

(assert (=> b!894986 m!832159))

(assert (=> b!894985 m!832131))

(declare-fun m!832161 () Bool)

(assert (=> b!894985 m!832161))

(assert (=> b!894985 m!832161))

(declare-fun m!832163 () Bool)

(assert (=> b!894985 m!832163))

(assert (=> b!894984 m!832159))

(assert (=> b!894981 m!832159))

(assert (=> d!110541 d!110549))

(declare-fun d!110551 () Bool)

(declare-fun lt!404231 () (_ BitVec 32))

(declare-fun lt!404230 () (_ BitVec 32))

(assert (=> d!110551 (= lt!404231 (bvmul (bvxor lt!404230 (bvlshr lt!404230 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110551 (= lt!404230 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110551 (and (bvsge (mask!25926 thiss!1181) #b00000000000000000000000000000000) (let ((res!605522 (let ((h!18951 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76154 (bvmul (bvxor h!18951 (bvlshr h!18951 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76154 (bvlshr x!76154 #b00000000000000000000000000001101)) (mask!25926 thiss!1181)))))) (and (bvslt res!605522 (bvadd (mask!25926 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605522 #b00000000000000000000000000000000))))))

(assert (=> d!110551 (= (toIndex!0 key!785 (mask!25926 thiss!1181)) (bvand (bvxor lt!404231 (bvlshr lt!404231 #b00000000000000000000000000001101)) (mask!25926 thiss!1181)))))

(assert (=> d!110541 d!110551))

(assert (=> d!110541 d!110539))

(declare-fun b!894998 () Bool)

(declare-fun e!500014 () Bool)

(declare-fun call!39716 () Bool)

(assert (=> b!894998 (= e!500014 call!39716)))

(declare-fun b!894999 () Bool)

(declare-fun e!500016 () Bool)

(assert (=> b!894999 (= e!500016 call!39716)))

(declare-fun d!110553 () Bool)

(declare-fun res!605528 () Bool)

(declare-fun e!500015 () Bool)

(assert (=> d!110553 (=> res!605528 e!500015)))

(assert (=> d!110553 (= res!605528 (bvsge #b00000000000000000000000000000000 (size!25661 (_keys!10052 thiss!1181))))))

(assert (=> d!110553 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10052 thiss!1181) (mask!25926 thiss!1181)) e!500015)))

(declare-fun b!895000 () Bool)

(assert (=> b!895000 (= e!500015 e!500016)))

(declare-fun c!94464 () Bool)

(assert (=> b!895000 (= c!94464 (validKeyInArray!0 (select (arr!25211 (_keys!10052 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39713 () Bool)

(assert (=> bm!39713 (= call!39716 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10052 thiss!1181) (mask!25926 thiss!1181)))))

(declare-fun b!895001 () Bool)

(assert (=> b!895001 (= e!500016 e!500014)))

(declare-fun lt!404239 () (_ BitVec 64))

(assert (=> b!895001 (= lt!404239 (select (arr!25211 (_keys!10052 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30402 0))(
  ( (Unit!30403) )
))
(declare-fun lt!404240 () Unit!30402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52427 (_ BitVec 64) (_ BitVec 32)) Unit!30402)

(assert (=> b!895001 (= lt!404240 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10052 thiss!1181) lt!404239 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!895001 (arrayContainsKey!0 (_keys!10052 thiss!1181) lt!404239 #b00000000000000000000000000000000)))

(declare-fun lt!404238 () Unit!30402)

(assert (=> b!895001 (= lt!404238 lt!404240)))

(declare-fun res!605527 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52427 (_ BitVec 32)) SeekEntryResult!8879)

(assert (=> b!895001 (= res!605527 (= (seekEntryOrOpen!0 (select (arr!25211 (_keys!10052 thiss!1181)) #b00000000000000000000000000000000) (_keys!10052 thiss!1181) (mask!25926 thiss!1181)) (Found!8879 #b00000000000000000000000000000000)))))

(assert (=> b!895001 (=> (not res!605527) (not e!500014))))

(assert (= (and d!110553 (not res!605528)) b!895000))

(assert (= (and b!895000 c!94464) b!895001))

(assert (= (and b!895000 (not c!94464)) b!894999))

(assert (= (and b!895001 res!605527) b!894998))

(assert (= (or b!894998 b!894999) bm!39713))

(assert (=> b!895000 m!832149))

(assert (=> b!895000 m!832149))

(assert (=> b!895000 m!832151))

(declare-fun m!832165 () Bool)

(assert (=> bm!39713 m!832165))

(assert (=> b!895001 m!832149))

(declare-fun m!832167 () Bool)

(assert (=> b!895001 m!832167))

(declare-fun m!832169 () Bool)

(assert (=> b!895001 m!832169))

(assert (=> b!895001 m!832149))

(declare-fun m!832171 () Bool)

(assert (=> b!895001 m!832171))

(assert (=> b!894890 d!110553))

(declare-fun bm!39716 () Bool)

(declare-fun call!39719 () (_ BitVec 32))

(assert (=> bm!39716 (= call!39719 (arrayCountValidKeys!0 (_keys!10052 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25661 (_keys!10052 thiss!1181))))))

(declare-fun b!895010 () Bool)

(declare-fun e!500022 () (_ BitVec 32))

(declare-fun e!500021 () (_ BitVec 32))

(assert (=> b!895010 (= e!500022 e!500021)))

(declare-fun c!94469 () Bool)

(assert (=> b!895010 (= c!94469 (validKeyInArray!0 (select (arr!25211 (_keys!10052 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895012 () Bool)

(assert (=> b!895012 (= e!500021 call!39719)))

(declare-fun b!895013 () Bool)

(assert (=> b!895013 (= e!500021 (bvadd #b00000000000000000000000000000001 call!39719))))

(declare-fun b!895011 () Bool)

(assert (=> b!895011 (= e!500022 #b00000000000000000000000000000000)))

(declare-fun d!110555 () Bool)

(declare-fun lt!404243 () (_ BitVec 32))

(assert (=> d!110555 (and (bvsge lt!404243 #b00000000000000000000000000000000) (bvsle lt!404243 (bvsub (size!25661 (_keys!10052 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110555 (= lt!404243 e!500022)))

(declare-fun c!94470 () Bool)

(assert (=> d!110555 (= c!94470 (bvsge #b00000000000000000000000000000000 (size!25661 (_keys!10052 thiss!1181))))))

(assert (=> d!110555 (and (bvsle #b00000000000000000000000000000000 (size!25661 (_keys!10052 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25661 (_keys!10052 thiss!1181)) (size!25661 (_keys!10052 thiss!1181))))))

(assert (=> d!110555 (= (arrayCountValidKeys!0 (_keys!10052 thiss!1181) #b00000000000000000000000000000000 (size!25661 (_keys!10052 thiss!1181))) lt!404243)))

(assert (= (and d!110555 c!94470) b!895011))

(assert (= (and d!110555 (not c!94470)) b!895010))

(assert (= (and b!895010 c!94469) b!895013))

(assert (= (and b!895010 (not c!94469)) b!895012))

(assert (= (or b!895013 b!895012) bm!39716))

(declare-fun m!832173 () Bool)

(assert (=> bm!39716 m!832173))

(assert (=> b!895010 m!832149))

(assert (=> b!895010 m!832149))

(assert (=> b!895010 m!832151))

(assert (=> b!894889 d!110555))

(declare-fun b!895014 () Bool)

(declare-fun e!500023 () Bool)

(assert (=> b!895014 (= e!500023 tp_is_empty!18223)))

(declare-fun b!895015 () Bool)

(declare-fun e!500024 () Bool)

(assert (=> b!895015 (= e!500024 tp_is_empty!18223)))

(declare-fun condMapEmpty!28932 () Bool)

(declare-fun mapDefault!28932 () ValueCell!8630)

(assert (=> mapNonEmpty!28931 (= condMapEmpty!28932 (= mapRest!28931 ((as const (Array (_ BitVec 32) ValueCell!8630)) mapDefault!28932)))))

(declare-fun mapRes!28932 () Bool)

(assert (=> mapNonEmpty!28931 (= tp!55703 (and e!500024 mapRes!28932))))

(declare-fun mapNonEmpty!28932 () Bool)

(declare-fun tp!55704 () Bool)

(assert (=> mapNonEmpty!28932 (= mapRes!28932 (and tp!55704 e!500023))))

(declare-fun mapRest!28932 () (Array (_ BitVec 32) ValueCell!8630))

(declare-fun mapKey!28932 () (_ BitVec 32))

(declare-fun mapValue!28932 () ValueCell!8630)

(assert (=> mapNonEmpty!28932 (= mapRest!28931 (store mapRest!28932 mapKey!28932 mapValue!28932))))

(declare-fun mapIsEmpty!28932 () Bool)

(assert (=> mapIsEmpty!28932 mapRes!28932))

(assert (= (and mapNonEmpty!28931 condMapEmpty!28932) mapIsEmpty!28932))

(assert (= (and mapNonEmpty!28931 (not condMapEmpty!28932)) mapNonEmpty!28932))

(assert (= (and mapNonEmpty!28932 ((_ is ValueCellFull!8630) mapValue!28932)) b!895014))

(assert (= (and mapNonEmpty!28931 ((_ is ValueCellFull!8630) mapDefault!28932)) b!895015))

(declare-fun m!832175 () Bool)

(assert (=> mapNonEmpty!28932 m!832175))

(check-sat (not b!895001) (not b!894961) tp_is_empty!18223 (not b!894945) (not d!110545) (not d!110543) (not d!110549) (not b!895000) (not b!894932) (not bm!39716) (not b!894960) (not b_next!15895) (not mapNonEmpty!28932) (not bm!39713) (not b!894962) b_and!26161 (not b!894985) (not bm!39710) (not b!895010) (not b!894946))
(check-sat b_and!26161 (not b_next!15895))
