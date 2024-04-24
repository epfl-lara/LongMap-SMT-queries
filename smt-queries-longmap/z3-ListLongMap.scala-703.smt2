; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16726 () Bool)

(assert start!16726)

(declare-fun b!167888 () Bool)

(declare-fun b_free!4027 () Bool)

(declare-fun b_next!4027 () Bool)

(assert (=> b!167888 (= b_free!4027 (not b_next!4027))))

(declare-fun tp!14681 () Bool)

(declare-fun b_and!10455 () Bool)

(assert (=> b!167888 (= tp!14681 b_and!10455)))

(declare-fun b!167886 () Bool)

(declare-fun e!110303 () Bool)

(declare-fun e!110302 () Bool)

(declare-fun mapRes!6462 () Bool)

(assert (=> b!167886 (= e!110303 (and e!110302 mapRes!6462))))

(declare-fun condMapEmpty!6462 () Bool)

(declare-datatypes ((V!4753 0))(
  ( (V!4754 (val!1959 Int)) )
))
(declare-datatypes ((ValueCell!1571 0))(
  ( (ValueCellFull!1571 (v!3825 V!4753)) (EmptyCell!1571) )
))
(declare-datatypes ((array!6741 0))(
  ( (array!6742 (arr!3206 (Array (_ BitVec 32) (_ BitVec 64))) (size!3494 (_ BitVec 32))) )
))
(declare-datatypes ((array!6743 0))(
  ( (array!6744 (arr!3207 (Array (_ BitVec 32) ValueCell!1571)) (size!3495 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2050 0))(
  ( (LongMapFixedSize!2051 (defaultEntry!3467 Int) (mask!8222 (_ BitVec 32)) (extraKeys!3208 (_ BitVec 32)) (zeroValue!3310 V!4753) (minValue!3310 V!4753) (_size!1074 (_ BitVec 32)) (_keys!5292 array!6741) (_values!3450 array!6743) (_vacant!1074 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2050)

(declare-fun mapDefault!6462 () ValueCell!1571)

(assert (=> b!167886 (= condMapEmpty!6462 (= (arr!3207 (_values!3450 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1571)) mapDefault!6462)))))

(declare-fun mapIsEmpty!6462 () Bool)

(assert (=> mapIsEmpty!6462 mapRes!6462))

(declare-fun b!167887 () Bool)

(declare-fun e!110300 () Bool)

(declare-fun tp_is_empty!3829 () Bool)

(assert (=> b!167887 (= e!110300 tp_is_empty!3829)))

(declare-fun e!110297 () Bool)

(declare-fun array_inv!2051 (array!6741) Bool)

(declare-fun array_inv!2052 (array!6743) Bool)

(assert (=> b!167888 (= e!110297 (and tp!14681 tp_is_empty!3829 (array_inv!2051 (_keys!5292 thiss!1248)) (array_inv!2052 (_values!3450 thiss!1248)) e!110303))))

(declare-fun res!79881 () Bool)

(declare-fun e!110301 () Bool)

(assert (=> start!16726 (=> (not res!79881) (not e!110301))))

(declare-fun valid!902 (LongMapFixedSize!2050) Bool)

(assert (=> start!16726 (= res!79881 (valid!902 thiss!1248))))

(assert (=> start!16726 e!110301))

(assert (=> start!16726 e!110297))

(assert (=> start!16726 true))

(assert (=> start!16726 tp_is_empty!3829))

(declare-fun b!167885 () Bool)

(declare-fun e!110298 () Bool)

(assert (=> b!167885 (= e!110298 true)))

(declare-fun lt!83964 () Bool)

(declare-datatypes ((List!2125 0))(
  ( (Nil!2122) (Cons!2121 (h!2738 (_ BitVec 64)) (t!6919 List!2125)) )
))
(declare-fun arrayNoDuplicates!0 (array!6741 (_ BitVec 32) List!2125) Bool)

(assert (=> b!167885 (= lt!83964 (arrayNoDuplicates!0 (_keys!5292 thiss!1248) #b00000000000000000000000000000000 Nil!2122))))

(declare-fun e!110299 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun b!167889 () Bool)

(declare-datatypes ((SeekEntryResult!481 0))(
  ( (MissingZero!481 (index!4092 (_ BitVec 32))) (Found!481 (index!4093 (_ BitVec 32))) (Intermediate!481 (undefined!1293 Bool) (index!4094 (_ BitVec 32)) (x!18557 (_ BitVec 32))) (Undefined!481) (MissingVacant!481 (index!4095 (_ BitVec 32))) )
))
(declare-fun lt!83963 () SeekEntryResult!481)

(assert (=> b!167889 (= e!110299 (= (select (arr!3206 (_keys!5292 thiss!1248)) (index!4093 lt!83963)) key!828))))

(declare-fun b!167890 () Bool)

(declare-fun res!79876 () Bool)

(assert (=> b!167890 (=> (not res!79876) (not e!110301))))

(assert (=> b!167890 (= res!79876 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167891 () Bool)

(assert (=> b!167891 (= e!110302 tp_is_empty!3829)))

(declare-fun b!167892 () Bool)

(declare-fun e!110294 () Bool)

(assert (=> b!167892 (= e!110301 e!110294)))

(declare-fun res!79879 () Bool)

(assert (=> b!167892 (=> (not res!79879) (not e!110294))))

(get-info :version)

(assert (=> b!167892 (= res!79879 (and (not ((_ is Undefined!481) lt!83963)) (not ((_ is MissingVacant!481) lt!83963)) (not ((_ is MissingZero!481) lt!83963)) ((_ is Found!481) lt!83963)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6741 (_ BitVec 32)) SeekEntryResult!481)

(assert (=> b!167892 (= lt!83963 (seekEntryOrOpen!0 key!828 (_keys!5292 thiss!1248) (mask!8222 thiss!1248)))))

(declare-fun b!167893 () Bool)

(declare-datatypes ((Unit!5157 0))(
  ( (Unit!5158) )
))
(declare-fun e!110295 () Unit!5157)

(declare-fun Unit!5159 () Unit!5157)

(assert (=> b!167893 (= e!110295 Unit!5159)))

(declare-fun lt!83966 () Unit!5157)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!107 (array!6741 array!6743 (_ BitVec 32) (_ BitVec 32) V!4753 V!4753 (_ BitVec 64) Int) Unit!5157)

(assert (=> b!167893 (= lt!83966 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!107 (_keys!5292 thiss!1248) (_values!3450 thiss!1248) (mask!8222 thiss!1248) (extraKeys!3208 thiss!1248) (zeroValue!3310 thiss!1248) (minValue!3310 thiss!1248) key!828 (defaultEntry!3467 thiss!1248)))))

(assert (=> b!167893 false))

(declare-fun b!167894 () Bool)

(assert (=> b!167894 (= e!110294 (not e!110298))))

(declare-fun res!79877 () Bool)

(assert (=> b!167894 (=> res!79877 e!110298)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167894 (= res!79877 (not (validMask!0 (mask!8222 thiss!1248))))))

(declare-datatypes ((tuple2!3110 0))(
  ( (tuple2!3111 (_1!1566 (_ BitVec 64)) (_2!1566 V!4753)) )
))
(declare-datatypes ((List!2126 0))(
  ( (Nil!2123) (Cons!2122 (h!2739 tuple2!3110) (t!6920 List!2126)) )
))
(declare-datatypes ((ListLongMap!2071 0))(
  ( (ListLongMap!2072 (toList!1051 List!2126)) )
))
(declare-fun lt!83961 () ListLongMap!2071)

(declare-fun v!309 () V!4753)

(declare-fun +!219 (ListLongMap!2071 tuple2!3110) ListLongMap!2071)

(declare-fun getCurrentListMap!713 (array!6741 array!6743 (_ BitVec 32) (_ BitVec 32) V!4753 V!4753 (_ BitVec 32) Int) ListLongMap!2071)

(assert (=> b!167894 (= (+!219 lt!83961 (tuple2!3111 key!828 v!309)) (getCurrentListMap!713 (_keys!5292 thiss!1248) (array!6744 (store (arr!3207 (_values!3450 thiss!1248)) (index!4093 lt!83963) (ValueCellFull!1571 v!309)) (size!3495 (_values!3450 thiss!1248))) (mask!8222 thiss!1248) (extraKeys!3208 thiss!1248) (zeroValue!3310 thiss!1248) (minValue!3310 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3467 thiss!1248)))))

(declare-fun lt!83967 () Unit!5157)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!77 (array!6741 array!6743 (_ BitVec 32) (_ BitVec 32) V!4753 V!4753 (_ BitVec 32) (_ BitVec 64) V!4753 Int) Unit!5157)

(assert (=> b!167894 (= lt!83967 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!77 (_keys!5292 thiss!1248) (_values!3450 thiss!1248) (mask!8222 thiss!1248) (extraKeys!3208 thiss!1248) (zeroValue!3310 thiss!1248) (minValue!3310 thiss!1248) (index!4093 lt!83963) key!828 v!309 (defaultEntry!3467 thiss!1248)))))

(declare-fun lt!83962 () Unit!5157)

(assert (=> b!167894 (= lt!83962 e!110295)))

(declare-fun c!30335 () Bool)

(declare-fun contains!1103 (ListLongMap!2071 (_ BitVec 64)) Bool)

(assert (=> b!167894 (= c!30335 (contains!1103 lt!83961 key!828))))

(assert (=> b!167894 (= lt!83961 (getCurrentListMap!713 (_keys!5292 thiss!1248) (_values!3450 thiss!1248) (mask!8222 thiss!1248) (extraKeys!3208 thiss!1248) (zeroValue!3310 thiss!1248) (minValue!3310 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3467 thiss!1248)))))

(declare-fun mapNonEmpty!6462 () Bool)

(declare-fun tp!14682 () Bool)

(assert (=> mapNonEmpty!6462 (= mapRes!6462 (and tp!14682 e!110300))))

(declare-fun mapValue!6462 () ValueCell!1571)

(declare-fun mapRest!6462 () (Array (_ BitVec 32) ValueCell!1571))

(declare-fun mapKey!6462 () (_ BitVec 32))

(assert (=> mapNonEmpty!6462 (= (arr!3207 (_values!3450 thiss!1248)) (store mapRest!6462 mapKey!6462 mapValue!6462))))

(declare-fun b!167895 () Bool)

(declare-fun lt!83965 () Unit!5157)

(assert (=> b!167895 (= e!110295 lt!83965)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!116 (array!6741 array!6743 (_ BitVec 32) (_ BitVec 32) V!4753 V!4753 (_ BitVec 64) Int) Unit!5157)

(assert (=> b!167895 (= lt!83965 (lemmaInListMapThenSeekEntryOrOpenFindsIt!116 (_keys!5292 thiss!1248) (_values!3450 thiss!1248) (mask!8222 thiss!1248) (extraKeys!3208 thiss!1248) (zeroValue!3310 thiss!1248) (minValue!3310 thiss!1248) key!828 (defaultEntry!3467 thiss!1248)))))

(declare-fun res!79875 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167895 (= res!79875 (inRange!0 (index!4093 lt!83963) (mask!8222 thiss!1248)))))

(assert (=> b!167895 (=> (not res!79875) (not e!110299))))

(assert (=> b!167895 e!110299))

(declare-fun b!167896 () Bool)

(declare-fun res!79878 () Bool)

(assert (=> b!167896 (=> res!79878 e!110298)))

(assert (=> b!167896 (= res!79878 (or (not (= (size!3495 (_values!3450 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8222 thiss!1248)))) (not (= (size!3494 (_keys!5292 thiss!1248)) (size!3495 (_values!3450 thiss!1248)))) (bvslt (mask!8222 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3208 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3208 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167897 () Bool)

(declare-fun res!79880 () Bool)

(assert (=> b!167897 (=> res!79880 e!110298)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6741 (_ BitVec 32)) Bool)

(assert (=> b!167897 (= res!79880 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5292 thiss!1248) (mask!8222 thiss!1248))))))

(assert (= (and start!16726 res!79881) b!167890))

(assert (= (and b!167890 res!79876) b!167892))

(assert (= (and b!167892 res!79879) b!167894))

(assert (= (and b!167894 c!30335) b!167895))

(assert (= (and b!167894 (not c!30335)) b!167893))

(assert (= (and b!167895 res!79875) b!167889))

(assert (= (and b!167894 (not res!79877)) b!167896))

(assert (= (and b!167896 (not res!79878)) b!167897))

(assert (= (and b!167897 (not res!79880)) b!167885))

(assert (= (and b!167886 condMapEmpty!6462) mapIsEmpty!6462))

(assert (= (and b!167886 (not condMapEmpty!6462)) mapNonEmpty!6462))

(assert (= (and mapNonEmpty!6462 ((_ is ValueCellFull!1571) mapValue!6462)) b!167887))

(assert (= (and b!167886 ((_ is ValueCellFull!1571) mapDefault!6462)) b!167891))

(assert (= b!167888 b!167886))

(assert (= start!16726 b!167888))

(declare-fun m!197141 () Bool)

(assert (=> mapNonEmpty!6462 m!197141))

(declare-fun m!197143 () Bool)

(assert (=> start!16726 m!197143))

(declare-fun m!197145 () Bool)

(assert (=> b!167895 m!197145))

(declare-fun m!197147 () Bool)

(assert (=> b!167895 m!197147))

(declare-fun m!197149 () Bool)

(assert (=> b!167888 m!197149))

(declare-fun m!197151 () Bool)

(assert (=> b!167888 m!197151))

(declare-fun m!197153 () Bool)

(assert (=> b!167889 m!197153))

(declare-fun m!197155 () Bool)

(assert (=> b!167893 m!197155))

(declare-fun m!197157 () Bool)

(assert (=> b!167897 m!197157))

(declare-fun m!197159 () Bool)

(assert (=> b!167894 m!197159))

(declare-fun m!197161 () Bool)

(assert (=> b!167894 m!197161))

(declare-fun m!197163 () Bool)

(assert (=> b!167894 m!197163))

(declare-fun m!197165 () Bool)

(assert (=> b!167894 m!197165))

(declare-fun m!197167 () Bool)

(assert (=> b!167894 m!197167))

(declare-fun m!197169 () Bool)

(assert (=> b!167894 m!197169))

(declare-fun m!197171 () Bool)

(assert (=> b!167894 m!197171))

(declare-fun m!197173 () Bool)

(assert (=> b!167885 m!197173))

(declare-fun m!197175 () Bool)

(assert (=> b!167892 m!197175))

(check-sat tp_is_empty!3829 (not b!167888) (not start!16726) (not b!167885) (not mapNonEmpty!6462) b_and!10455 (not b_next!4027) (not b!167892) (not b!167893) (not b!167894) (not b!167897) (not b!167895))
(check-sat b_and!10455 (not b_next!4027))
