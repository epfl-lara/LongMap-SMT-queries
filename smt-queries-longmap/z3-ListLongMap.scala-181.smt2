; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3628 () Bool)

(assert start!3628)

(declare-fun b!24981 () Bool)

(declare-fun b_free!763 () Bool)

(declare-fun b_next!763 () Bool)

(assert (=> b!24981 (= b_free!763 (not b_next!763))))

(declare-fun tp!3540 () Bool)

(declare-fun b_and!1547 () Bool)

(assert (=> b!24981 (= tp!3540 b_and!1547)))

(declare-fun b!24979 () Bool)

(declare-fun e!16152 () Bool)

(declare-fun tp_is_empty!1027 () Bool)

(assert (=> b!24979 (= e!16152 tp_is_empty!1027)))

(declare-fun b!24980 () Bool)

(declare-fun e!16154 () Bool)

(declare-fun e!16147 () Bool)

(assert (=> b!24980 (= e!16154 e!16147)))

(declare-fun e!16153 () Bool)

(declare-datatypes ((V!1195 0))(
  ( (V!1196 (val!540 Int)) )
))
(declare-datatypes ((ValueCell!314 0))(
  ( (ValueCellFull!314 (v!1617 V!1195)) (EmptyCell!314) )
))
(declare-datatypes ((array!1275 0))(
  ( (array!1276 (arr!602 (Array (_ BitVec 32) ValueCell!314)) (size!703 (_ BitVec 32))) )
))
(declare-datatypes ((array!1277 0))(
  ( (array!1278 (arr!603 (Array (_ BitVec 32) (_ BitVec 64))) (size!704 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!214 0))(
  ( (LongMapFixedSize!215 (defaultEntry!1764 Int) (mask!4763 (_ BitVec 32)) (extraKeys!1657 (_ BitVec 32)) (zeroValue!1684 V!1195) (minValue!1684 V!1195) (_size!154 (_ BitVec 32)) (_keys!3190 array!1277) (_values!1749 array!1275) (_vacant!154 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!214 0))(
  ( (Cell!215 (v!1618 LongMapFixedSize!214)) )
))
(declare-datatypes ((LongMap!214 0))(
  ( (LongMap!215 (underlying!118 Cell!214)) )
))
(declare-fun thiss!938 () LongMap!214)

(declare-fun array_inv!425 (array!1277) Bool)

(declare-fun array_inv!426 (array!1275) Bool)

(assert (=> b!24981 (= e!16147 (and tp!3540 tp_is_empty!1027 (array_inv!425 (_keys!3190 (v!1618 (underlying!118 thiss!938)))) (array_inv!426 (_values!1749 (v!1618 (underlying!118 thiss!938)))) e!16153))))

(declare-fun b!24982 () Bool)

(declare-datatypes ((tuple2!976 0))(
  ( (tuple2!977 (_1!497 Bool) (_2!497 Cell!214)) )
))
(declare-fun e!16150 () tuple2!976)

(declare-datatypes ((tuple2!978 0))(
  ( (tuple2!979 (_1!498 Bool) (_2!498 LongMapFixedSize!214)) )
))
(declare-fun lt!9642 () tuple2!978)

(assert (=> b!24982 (= e!16150 (tuple2!977 (_1!498 lt!9642) (Cell!215 (_2!498 lt!9642))))))

(declare-fun call!2214 () tuple2!978)

(assert (=> b!24982 (= lt!9642 call!2214)))

(declare-fun mapIsEmpty!1036 () Bool)

(declare-fun mapRes!1036 () Bool)

(assert (=> mapIsEmpty!1036 mapRes!1036))

(declare-fun b!24983 () Bool)

(declare-fun c!3428 () Bool)

(declare-fun lt!9643 () Bool)

(assert (=> b!24983 (= c!3428 (and (not (= (bvand (extraKeys!1657 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!9643))))

(declare-fun e!16145 () tuple2!976)

(assert (=> b!24983 (= e!16145 e!16150)))

(declare-fun b!24984 () Bool)

(declare-fun e!16148 () Bool)

(assert (=> b!24984 (= e!16148 e!16154)))

(declare-fun b!24985 () Bool)

(declare-fun e!16144 () Bool)

(assert (=> b!24985 (= e!16144 tp_is_empty!1027)))

(declare-fun mapNonEmpty!1036 () Bool)

(declare-fun tp!3541 () Bool)

(assert (=> mapNonEmpty!1036 (= mapRes!1036 (and tp!3541 e!16152))))

(declare-fun mapKey!1036 () (_ BitVec 32))

(declare-fun mapRest!1036 () (Array (_ BitVec 32) ValueCell!314))

(declare-fun mapValue!1036 () ValueCell!314)

(assert (=> mapNonEmpty!1036 (= (arr!602 (_values!1749 (v!1618 (underlying!118 thiss!938)))) (store mapRest!1036 mapKey!1036 mapValue!1036))))

(declare-fun b!24986 () Bool)

(declare-fun e!16143 () tuple2!976)

(declare-fun lt!9645 () tuple2!978)

(declare-fun lt!9647 () tuple2!978)

(assert (=> b!24986 (= e!16143 (tuple2!977 (and (_1!498 lt!9645) (_1!498 lt!9647)) (Cell!215 (_2!498 lt!9647))))))

(declare-fun call!2213 () tuple2!978)

(assert (=> b!24986 (= lt!9645 call!2213)))

(declare-fun update!43 (LongMapFixedSize!214 (_ BitVec 64) V!1195) tuple2!978)

(assert (=> b!24986 (= lt!9647 (update!43 (_2!498 lt!9645) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1684 (v!1618 (underlying!118 thiss!938)))))))

(declare-fun c!3427 () Bool)

(declare-fun bm!2210 () Bool)

(declare-fun lt!9646 () LongMapFixedSize!214)

(declare-fun c!3426 () Bool)

(assert (=> bm!2210 (= call!2213 (update!43 lt!9646 (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938))))))))

(declare-fun b!24988 () Bool)

(assert (=> b!24988 (= e!16143 e!16145)))

(assert (=> b!24988 (= c!3427 (and (not lt!9643) (= (bvand (extraKeys!1657 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!24989 () Bool)

(declare-fun e!16149 () Bool)

(declare-fun e!16146 () Bool)

(assert (=> b!24989 (= e!16149 e!16146)))

(declare-fun res!15138 () Bool)

(assert (=> b!24989 (=> (not res!15138) (not e!16146))))

(assert (=> b!24989 (= res!15138 (_1!497 e!16143))))

(assert (=> b!24989 (= c!3426 (and (not lt!9643) (not (= (bvand (extraKeys!1657 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!24989 (= lt!9643 (= (bvand (extraKeys!1657 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!40 ((_ BitVec 32) Int) LongMapFixedSize!214)

(declare-fun computeNewMask!35 (LongMap!214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!24989 (= lt!9646 (getNewLongMapFixedSize!40 (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) (defaultEntry!1764 (v!1618 (underlying!118 thiss!938)))))))

(declare-fun b!24990 () Bool)

(assert (=> b!24990 (= e!16146 (and (= (size!704 (_keys!3190 (v!1618 (underlying!118 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4763 (v!1618 (underlying!118 thiss!938))))) (bvslt (bvsub (size!704 (_keys!3190 (v!1618 (underlying!118 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!24991 () Bool)

(declare-fun lt!9644 () tuple2!978)

(assert (=> b!24991 (= lt!9644 call!2214)))

(assert (=> b!24991 (= e!16145 (tuple2!977 (_1!498 lt!9644) (Cell!215 (_2!498 lt!9644))))))

(declare-fun bm!2211 () Bool)

(assert (=> bm!2211 (= call!2214 call!2213)))

(declare-fun b!24992 () Bool)

(assert (=> b!24992 (= e!16153 (and e!16144 mapRes!1036))))

(declare-fun condMapEmpty!1036 () Bool)

(declare-fun mapDefault!1036 () ValueCell!314)

(assert (=> b!24992 (= condMapEmpty!1036 (= (arr!602 (_values!1749 (v!1618 (underlying!118 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!314)) mapDefault!1036)))))

(declare-fun b!24993 () Bool)

(declare-fun res!15140 () Bool)

(assert (=> b!24993 (=> (not res!15140) (not e!16146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!24993 (= res!15140 (validMask!0 (mask!4763 (v!1618 (underlying!118 thiss!938)))))))

(declare-fun res!15139 () Bool)

(assert (=> start!3628 (=> (not res!15139) (not e!16149))))

(declare-fun valid!122 (LongMap!214) Bool)

(assert (=> start!3628 (= res!15139 (valid!122 thiss!938))))

(assert (=> start!3628 e!16149))

(assert (=> start!3628 e!16148))

(declare-fun b!24987 () Bool)

(assert (=> b!24987 (= e!16150 (tuple2!977 true (Cell!215 lt!9646)))))

(assert (= (and start!3628 res!15139) b!24989))

(assert (= (and b!24989 c!3426) b!24986))

(assert (= (and b!24989 (not c!3426)) b!24988))

(assert (= (and b!24988 c!3427) b!24991))

(assert (= (and b!24988 (not c!3427)) b!24983))

(assert (= (and b!24983 c!3428) b!24982))

(assert (= (and b!24983 (not c!3428)) b!24987))

(assert (= (or b!24991 b!24982) bm!2211))

(assert (= (or b!24986 bm!2211) bm!2210))

(assert (= (and b!24989 res!15138) b!24993))

(assert (= (and b!24993 res!15140) b!24990))

(assert (= (and b!24992 condMapEmpty!1036) mapIsEmpty!1036))

(assert (= (and b!24992 (not condMapEmpty!1036)) mapNonEmpty!1036))

(get-info :version)

(assert (= (and mapNonEmpty!1036 ((_ is ValueCellFull!314) mapValue!1036)) b!24979))

(assert (= (and b!24992 ((_ is ValueCellFull!314) mapDefault!1036)) b!24985))

(assert (= b!24981 b!24992))

(assert (= b!24980 b!24981))

(assert (= b!24984 b!24980))

(assert (= start!3628 b!24984))

(declare-fun m!20125 () Bool)

(assert (=> b!24981 m!20125))

(declare-fun m!20127 () Bool)

(assert (=> b!24981 m!20127))

(declare-fun m!20129 () Bool)

(assert (=> start!3628 m!20129))

(declare-fun m!20131 () Bool)

(assert (=> mapNonEmpty!1036 m!20131))

(declare-fun m!20133 () Bool)

(assert (=> bm!2210 m!20133))

(declare-fun m!20135 () Bool)

(assert (=> b!24993 m!20135))

(declare-fun m!20137 () Bool)

(assert (=> b!24989 m!20137))

(assert (=> b!24989 m!20137))

(declare-fun m!20139 () Bool)

(assert (=> b!24989 m!20139))

(declare-fun m!20141 () Bool)

(assert (=> b!24986 m!20141))

(check-sat tp_is_empty!1027 (not bm!2210) (not b_next!763) (not mapNonEmpty!1036) b_and!1547 (not b!24993) (not start!3628) (not b!24981) (not b!24986) (not b!24989))
(check-sat b_and!1547 (not b_next!763))
(get-model)

(declare-fun b!25160 () Bool)

(declare-fun e!16285 () Bool)

(declare-datatypes ((SeekEntryResult!55 0))(
  ( (MissingZero!55 (index!2342 (_ BitVec 32))) (Found!55 (index!2343 (_ BitVec 32))) (Intermediate!55 (undefined!867 Bool) (index!2344 (_ BitVec 32)) (x!5909 (_ BitVec 32))) (Undefined!55) (MissingVacant!55 (index!2345 (_ BitVec 32))) )
))
(declare-fun lt!9738 () SeekEntryResult!55)

(assert (=> b!25160 (= e!16285 (= (select (arr!603 (_keys!3190 (_2!498 lt!9645))) (index!2343 lt!9738)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!9759 () SeekEntryResult!55)

(declare-fun c!3478 () Bool)

(declare-fun bm!2272 () Bool)

(declare-fun call!2292 () tuple2!978)

(declare-fun updateHelperNewKey!11 (LongMapFixedSize!214 (_ BitVec 64) V!1195 (_ BitVec 32)) tuple2!978)

(assert (=> bm!2272 (= call!2292 (updateHelperNewKey!11 (_2!498 lt!9645) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1684 (v!1618 (underlying!118 thiss!938))) (ite c!3478 (index!2345 lt!9759) (index!2342 lt!9759))))))

(declare-fun b!25161 () Bool)

(declare-fun res!15198 () Bool)

(declare-fun call!2282 () Bool)

(assert (=> b!25161 (= res!15198 call!2282)))

(declare-fun e!16280 () Bool)

(assert (=> b!25161 (=> (not res!15198) (not e!16280))))

(declare-fun b!25162 () Bool)

(declare-fun c!3482 () Bool)

(declare-fun lt!9746 () SeekEntryResult!55)

(assert (=> b!25162 (= c!3482 ((_ is MissingVacant!55) lt!9746))))

(declare-fun e!16271 () Bool)

(declare-fun e!16268 () Bool)

(assert (=> b!25162 (= e!16271 e!16268)))

(declare-fun b!25163 () Bool)

(declare-fun res!15187 () Bool)

(declare-fun call!2296 () Bool)

(assert (=> b!25163 (= res!15187 call!2296)))

(assert (=> b!25163 (=> (not res!15187) (not e!16285))))

(declare-fun b!25164 () Bool)

(declare-datatypes ((Unit!601 0))(
  ( (Unit!602) )
))
(declare-fun e!16270 () Unit!601)

(declare-fun lt!9747 () Unit!601)

(assert (=> b!25164 (= e!16270 lt!9747)))

(declare-fun call!2281 () Unit!601)

(assert (=> b!25164 (= lt!9747 call!2281)))

(declare-fun call!2287 () SeekEntryResult!55)

(assert (=> b!25164 (= lt!9746 call!2287)))

(declare-fun c!3479 () Bool)

(assert (=> b!25164 (= c!3479 ((_ is MissingZero!55) lt!9746))))

(assert (=> b!25164 e!16271))

(declare-fun b!25165 () Bool)

(declare-fun Unit!603 () Unit!601)

(assert (=> b!25165 (= e!16270 Unit!603)))

(declare-fun lt!9754 () Unit!601)

(declare-fun call!2297 () Unit!601)

(assert (=> b!25165 (= lt!9754 call!2297)))

(declare-fun lt!9756 () SeekEntryResult!55)

(assert (=> b!25165 (= lt!9756 call!2287)))

(declare-fun res!15200 () Bool)

(assert (=> b!25165 (= res!15200 ((_ is Found!55) lt!9756))))

(assert (=> b!25165 (=> (not res!15200) (not e!16280))))

(assert (=> b!25165 e!16280))

(declare-fun lt!9762 () Unit!601)

(assert (=> b!25165 (= lt!9762 lt!9754)))

(assert (=> b!25165 false))

(declare-fun b!25166 () Bool)

(declare-fun lt!9744 () Unit!601)

(assert (=> b!25166 (= lt!9744 e!16270)))

(declare-fun c!3481 () Bool)

(declare-fun call!2285 () Bool)

(assert (=> b!25166 (= c!3481 call!2285)))

(declare-fun e!16277 () tuple2!978)

(assert (=> b!25166 (= e!16277 (tuple2!979 false (_2!498 lt!9645)))))

(declare-fun b!25167 () Bool)

(declare-fun e!16269 () Bool)

(declare-fun call!2289 () Bool)

(assert (=> b!25167 (= e!16269 (not call!2289))))

(declare-fun b!25168 () Bool)

(declare-fun lt!9743 () Unit!601)

(declare-fun lt!9760 () Unit!601)

(assert (=> b!25168 (= lt!9743 lt!9760)))

(declare-datatypes ((tuple2!984 0))(
  ( (tuple2!985 (_1!501 (_ BitVec 64)) (_2!501 V!1195)) )
))
(declare-datatypes ((List!566 0))(
  ( (Nil!563) (Cons!562 (h!1129 tuple2!984) (t!3245 List!566)) )
))
(declare-datatypes ((ListLongMap!565 0))(
  ( (ListLongMap!566 (toList!298 List!566)) )
))
(declare-fun call!2279 () ListLongMap!565)

(declare-fun call!2295 () ListLongMap!565)

(assert (=> b!25168 (= call!2279 call!2295)))

(declare-fun lt!9750 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!11 (array!1277 array!1275 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1195 V!1195 V!1195 Int) Unit!601)

(assert (=> b!25168 (= lt!9760 (lemmaChangeLongMinValueKeyThenAddPairToListMap!11 (_keys!3190 (_2!498 lt!9645)) (_values!1749 (_2!498 lt!9645)) (mask!4763 (_2!498 lt!9645)) (extraKeys!1657 (_2!498 lt!9645)) lt!9750 (zeroValue!1684 (_2!498 lt!9645)) (minValue!1684 (_2!498 lt!9645)) (minValue!1684 (v!1618 (underlying!118 thiss!938))) (defaultEntry!1764 (_2!498 lt!9645))))))

(assert (=> b!25168 (= lt!9750 (bvor (extraKeys!1657 (_2!498 lt!9645)) #b00000000000000000000000000000010))))

(declare-fun e!16283 () tuple2!978)

(assert (=> b!25168 (= e!16283 (tuple2!979 true (LongMapFixedSize!215 (defaultEntry!1764 (_2!498 lt!9645)) (mask!4763 (_2!498 lt!9645)) (bvor (extraKeys!1657 (_2!498 lt!9645)) #b00000000000000000000000000000010) (zeroValue!1684 (_2!498 lt!9645)) (minValue!1684 (v!1618 (underlying!118 thiss!938))) (_size!154 (_2!498 lt!9645)) (_keys!3190 (_2!498 lt!9645)) (_values!1749 (_2!498 lt!9645)) (_vacant!154 (_2!498 lt!9645)))))))

(declare-fun bm!2273 () Bool)

(declare-fun call!2276 () Bool)

(assert (=> bm!2273 (= call!2276 call!2282)))

(declare-fun b!25169 () Bool)

(declare-fun e!16267 () Bool)

(declare-fun call!2277 () Bool)

(assert (=> b!25169 (= e!16267 (not call!2277))))

(declare-fun b!25170 () Bool)

(declare-fun e!16286 () Bool)

(declare-fun lt!9757 () SeekEntryResult!55)

(assert (=> b!25170 (= e!16286 ((_ is Undefined!55) lt!9757))))

(declare-fun b!25171 () Bool)

(declare-fun res!15199 () Bool)

(assert (=> b!25171 (=> (not res!15199) (not e!16269))))

(assert (=> b!25171 (= res!15199 (= (select (arr!603 (_keys!3190 (_2!498 lt!9645))) (index!2342 lt!9757)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25172 () Bool)

(declare-fun lt!9745 () Unit!601)

(declare-fun lt!9748 () Unit!601)

(assert (=> b!25172 (= lt!9745 lt!9748)))

(assert (=> b!25172 call!2285))

(declare-fun lt!9751 () array!1275)

(declare-fun lemmaValidKeyInArrayIsInListMap!11 (array!1277 array!1275 (_ BitVec 32) (_ BitVec 32) V!1195 V!1195 (_ BitVec 32) Int) Unit!601)

(assert (=> b!25172 (= lt!9748 (lemmaValidKeyInArrayIsInListMap!11 (_keys!3190 (_2!498 lt!9645)) lt!9751 (mask!4763 (_2!498 lt!9645)) (extraKeys!1657 (_2!498 lt!9645)) (zeroValue!1684 (_2!498 lt!9645)) (minValue!1684 (_2!498 lt!9645)) (index!2343 lt!9759) (defaultEntry!1764 (_2!498 lt!9645))))))

(assert (=> b!25172 (= lt!9751 (array!1276 (store (arr!602 (_values!1749 (_2!498 lt!9645))) (index!2343 lt!9759) (ValueCellFull!314 (minValue!1684 (v!1618 (underlying!118 thiss!938))))) (size!703 (_values!1749 (_2!498 lt!9645)))))))

(declare-fun lt!9741 () Unit!601)

(declare-fun lt!9740 () Unit!601)

(assert (=> b!25172 (= lt!9741 lt!9740)))

(declare-fun call!2275 () ListLongMap!565)

(declare-fun getCurrentListMap!128 (array!1277 array!1275 (_ BitVec 32) (_ BitVec 32) V!1195 V!1195 (_ BitVec 32) Int) ListLongMap!565)

(assert (=> b!25172 (= call!2275 (getCurrentListMap!128 (_keys!3190 (_2!498 lt!9645)) (array!1276 (store (arr!602 (_values!1749 (_2!498 lt!9645))) (index!2343 lt!9759) (ValueCellFull!314 (minValue!1684 (v!1618 (underlying!118 thiss!938))))) (size!703 (_values!1749 (_2!498 lt!9645)))) (mask!4763 (_2!498 lt!9645)) (extraKeys!1657 (_2!498 lt!9645)) (zeroValue!1684 (_2!498 lt!9645)) (minValue!1684 (_2!498 lt!9645)) #b00000000000000000000000000000000 (defaultEntry!1764 (_2!498 lt!9645))))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!11 (array!1277 array!1275 (_ BitVec 32) (_ BitVec 32) V!1195 V!1195 (_ BitVec 32) (_ BitVec 64) V!1195 Int) Unit!601)

(assert (=> b!25172 (= lt!9740 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!11 (_keys!3190 (_2!498 lt!9645)) (_values!1749 (_2!498 lt!9645)) (mask!4763 (_2!498 lt!9645)) (extraKeys!1657 (_2!498 lt!9645)) (zeroValue!1684 (_2!498 lt!9645)) (minValue!1684 (_2!498 lt!9645)) (index!2343 lt!9759) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1684 (v!1618 (underlying!118 thiss!938))) (defaultEntry!1764 (_2!498 lt!9645))))))

(declare-fun lt!9749 () Unit!601)

(declare-fun e!16284 () Unit!601)

(assert (=> b!25172 (= lt!9749 e!16284)))

(declare-fun c!3475 () Bool)

(declare-fun call!2288 () ListLongMap!565)

(declare-fun contains!232 (ListLongMap!565 (_ BitVec 64)) Bool)

(assert (=> b!25172 (= c!3475 (contains!232 call!2288 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!16272 () tuple2!978)

(assert (=> b!25172 (= e!16272 (tuple2!979 true (LongMapFixedSize!215 (defaultEntry!1764 (_2!498 lt!9645)) (mask!4763 (_2!498 lt!9645)) (extraKeys!1657 (_2!498 lt!9645)) (zeroValue!1684 (_2!498 lt!9645)) (minValue!1684 (_2!498 lt!9645)) (_size!154 (_2!498 lt!9645)) (_keys!3190 (_2!498 lt!9645)) (array!1276 (store (arr!602 (_values!1749 (_2!498 lt!9645))) (index!2343 lt!9759) (ValueCellFull!314 (minValue!1684 (v!1618 (underlying!118 thiss!938))))) (size!703 (_values!1749 (_2!498 lt!9645)))) (_vacant!154 (_2!498 lt!9645)))))))

(declare-fun bm!2274 () Bool)

(assert (=> bm!2274 (= call!2279 call!2275)))

(declare-fun d!4745 () Bool)

(declare-fun e!16273 () Bool)

(assert (=> d!4745 e!16273))

(declare-fun res!15196 () Bool)

(assert (=> d!4745 (=> (not res!15196) (not e!16273))))

(declare-fun lt!9742 () tuple2!978)

(declare-fun valid!123 (LongMapFixedSize!214) Bool)

(assert (=> d!4745 (= res!15196 (valid!123 (_2!498 lt!9742)))))

(declare-fun e!16274 () tuple2!978)

(assert (=> d!4745 (= lt!9742 e!16274)))

(declare-fun c!3472 () Bool)

(assert (=> d!4745 (= c!3472 (= #b1000000000000000000000000000000000000000000000000000000000000000 (bvneg #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4745 (valid!123 (_2!498 lt!9645))))

(assert (=> d!4745 (= (update!43 (_2!498 lt!9645) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1684 (v!1618 (underlying!118 thiss!938)))) lt!9742)))

(declare-fun bm!2275 () Bool)

(declare-fun call!2283 () ListLongMap!565)

(declare-fun map!411 (LongMapFixedSize!214) ListLongMap!565)

(assert (=> bm!2275 (= call!2283 (map!411 (_2!498 lt!9742)))))

(declare-fun c!3480 () Bool)

(declare-fun c!3471 () Bool)

(declare-fun call!2278 () ListLongMap!565)

(declare-fun lt!9739 () (_ BitVec 32))

(declare-fun bm!2276 () Bool)

(assert (=> bm!2276 (= call!2278 (getCurrentListMap!128 (_keys!3190 (_2!498 lt!9645)) (ite (or c!3472 c!3480) (_values!1749 (_2!498 lt!9645)) lt!9751) (mask!4763 (_2!498 lt!9645)) (ite c!3472 (ite c!3471 lt!9739 lt!9750) (extraKeys!1657 (_2!498 lt!9645))) (ite (and c!3472 c!3471) (minValue!1684 (v!1618 (underlying!118 thiss!938))) (zeroValue!1684 (_2!498 lt!9645))) (ite c!3472 (ite c!3471 (minValue!1684 (_2!498 lt!9645)) (minValue!1684 (v!1618 (underlying!118 thiss!938)))) (minValue!1684 (_2!498 lt!9645))) #b00000000000000000000000000000000 (defaultEntry!1764 (_2!498 lt!9645))))))

(declare-fun b!25173 () Bool)

(assert (=> b!25173 (= e!16274 e!16277)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1277 (_ BitVec 32)) SeekEntryResult!55)

(assert (=> b!25173 (= lt!9759 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3190 (_2!498 lt!9645)) (mask!4763 (_2!498 lt!9645))))))

(assert (=> b!25173 (= c!3480 ((_ is Undefined!55) lt!9759))))

(declare-fun bm!2277 () Bool)

(declare-fun call!2291 () Bool)

(assert (=> bm!2277 (= call!2291 call!2296)))

(declare-fun b!25174 () Bool)

(declare-fun e!16275 () Bool)

(assert (=> b!25174 (= e!16275 (not call!2277))))

(declare-fun b!25175 () Bool)

(declare-fun e!16279 () tuple2!978)

(assert (=> b!25175 (= e!16279 e!16272)))

(declare-fun c!3477 () Bool)

(assert (=> b!25175 (= c!3477 ((_ is MissingZero!55) lt!9759))))

(declare-fun bm!2278 () Bool)

(declare-fun call!2294 () ListLongMap!565)

(assert (=> bm!2278 (= call!2294 call!2278)))

(declare-fun bm!2279 () Bool)

(declare-fun call!2290 () Bool)

(assert (=> bm!2279 (= call!2289 call!2290)))

(declare-fun call!2286 () ListLongMap!565)

(declare-fun bm!2280 () Bool)

(declare-fun +!45 (ListLongMap!565 tuple2!984) ListLongMap!565)

(assert (=> bm!2280 (= call!2275 (+!45 (ite c!3472 call!2286 call!2288) (ite c!3472 (ite c!3471 (tuple2!985 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1684 (v!1618 (underlying!118 thiss!938)))) (tuple2!985 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1684 (v!1618 (underlying!118 thiss!938))))) (tuple2!985 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1684 (v!1618 (underlying!118 thiss!938)))))))))

(declare-fun b!25176 () Bool)

(declare-fun lt!9753 () Unit!601)

(assert (=> b!25176 (= e!16284 lt!9753)))

(assert (=> b!25176 (= lt!9753 call!2297)))

(declare-fun call!2284 () SeekEntryResult!55)

(assert (=> b!25176 (= lt!9738 call!2284)))

(declare-fun res!15195 () Bool)

(assert (=> b!25176 (= res!15195 ((_ is Found!55) lt!9738))))

(assert (=> b!25176 (=> (not res!15195) (not e!16285))))

(assert (=> b!25176 e!16285))

(declare-fun b!25177 () Bool)

(declare-fun res!15190 () Bool)

(assert (=> b!25177 (= res!15190 (= (select (arr!603 (_keys!3190 (_2!498 lt!9645))) (index!2345 lt!9757)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!16282 () Bool)

(assert (=> b!25177 (=> (not res!15190) (not e!16282))))

(declare-fun bm!2281 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!11 (array!1277 array!1275 (_ BitVec 32) (_ BitVec 32) V!1195 V!1195 (_ BitVec 64) Int) Unit!601)

(assert (=> bm!2281 (= call!2281 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!11 (_keys!3190 (_2!498 lt!9645)) (_values!1749 (_2!498 lt!9645)) (mask!4763 (_2!498 lt!9645)) (extraKeys!1657 (_2!498 lt!9645)) (zeroValue!1684 (_2!498 lt!9645)) (minValue!1684 (_2!498 lt!9645)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1764 (_2!498 lt!9645))))))

(declare-fun bm!2282 () Bool)

(declare-fun call!2293 () SeekEntryResult!55)

(assert (=> bm!2282 (= call!2284 call!2293)))

(declare-fun b!25178 () Bool)

(declare-fun lt!9752 () Unit!601)

(declare-fun lt!9763 () Unit!601)

(assert (=> b!25178 (= lt!9752 lt!9763)))

(assert (=> b!25178 (= call!2279 call!2295)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!11 (array!1277 array!1275 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1195 V!1195 V!1195 Int) Unit!601)

(assert (=> b!25178 (= lt!9763 (lemmaChangeZeroKeyThenAddPairToListMap!11 (_keys!3190 (_2!498 lt!9645)) (_values!1749 (_2!498 lt!9645)) (mask!4763 (_2!498 lt!9645)) (extraKeys!1657 (_2!498 lt!9645)) lt!9739 (zeroValue!1684 (_2!498 lt!9645)) (minValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (_2!498 lt!9645)) (defaultEntry!1764 (_2!498 lt!9645))))))

(assert (=> b!25178 (= lt!9739 (bvor (extraKeys!1657 (_2!498 lt!9645)) #b00000000000000000000000000000001))))

(assert (=> b!25178 (= e!16283 (tuple2!979 true (LongMapFixedSize!215 (defaultEntry!1764 (_2!498 lt!9645)) (mask!4763 (_2!498 lt!9645)) (bvor (extraKeys!1657 (_2!498 lt!9645)) #b00000000000000000000000000000001) (minValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (_2!498 lt!9645)) (_size!154 (_2!498 lt!9645)) (_keys!3190 (_2!498 lt!9645)) (_values!1749 (_2!498 lt!9645)) (_vacant!154 (_2!498 lt!9645)))))))

(declare-fun bm!2283 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!11 (array!1277 array!1275 (_ BitVec 32) (_ BitVec 32) V!1195 V!1195 (_ BitVec 64) Int) Unit!601)

(assert (=> bm!2283 (= call!2297 (lemmaInListMapThenSeekEntryOrOpenFindsIt!11 (_keys!3190 (_2!498 lt!9645)) (_values!1749 (_2!498 lt!9645)) (mask!4763 (_2!498 lt!9645)) (extraKeys!1657 (_2!498 lt!9645)) (zeroValue!1684 (_2!498 lt!9645)) (minValue!1684 (_2!498 lt!9645)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1764 (_2!498 lt!9645))))))

(declare-fun bm!2284 () Bool)

(assert (=> bm!2284 (= call!2288 (getCurrentListMap!128 (_keys!3190 (_2!498 lt!9645)) (_values!1749 (_2!498 lt!9645)) (mask!4763 (_2!498 lt!9645)) (extraKeys!1657 (_2!498 lt!9645)) (zeroValue!1684 (_2!498 lt!9645)) (minValue!1684 (_2!498 lt!9645)) #b00000000000000000000000000000000 (defaultEntry!1764 (_2!498 lt!9645))))))

(declare-fun b!25179 () Bool)

(declare-fun lt!9758 () tuple2!978)

(assert (=> b!25179 (= e!16279 (tuple2!979 (_1!498 lt!9758) (_2!498 lt!9758)))))

(assert (=> b!25179 (= lt!9758 call!2292)))

(declare-fun bm!2285 () Bool)

(assert (=> bm!2285 (= call!2286 call!2288)))

(declare-fun bm!2286 () Bool)

(declare-fun arrayContainsKey!0 (array!1277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!2286 (= call!2290 (arrayContainsKey!0 (_keys!3190 (_2!498 lt!9645)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!25180 () Bool)

(declare-fun res!15197 () Bool)

(assert (=> b!25180 (=> (not res!15197) (not e!16275))))

(assert (=> b!25180 (= res!15197 (= (select (arr!603 (_keys!3190 (_2!498 lt!9645))) (index!2342 lt!9746)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25181 () Bool)

(assert (=> b!25181 (= c!3478 ((_ is MissingVacant!55) lt!9759))))

(assert (=> b!25181 (= e!16277 e!16279)))

(declare-fun bm!2287 () Bool)

(assert (=> bm!2287 (= call!2285 (contains!232 call!2294 (ite c!3480 #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!603 (_keys!3190 (_2!498 lt!9645))) (index!2343 lt!9759)))))))

(declare-fun b!25182 () Bool)

(declare-fun lt!9755 () tuple2!978)

(assert (=> b!25182 (= lt!9755 call!2292)))

(assert (=> b!25182 (= e!16272 (tuple2!979 (_1!498 lt!9755) (_2!498 lt!9755)))))

(declare-fun b!25183 () Bool)

(declare-fun c!3473 () Bool)

(assert (=> b!25183 (= c!3473 ((_ is MissingVacant!55) lt!9757))))

(declare-fun e!16276 () Bool)

(assert (=> b!25183 (= e!16276 e!16286)))

(declare-fun b!25184 () Bool)

(assert (=> b!25184 (= e!16282 (not call!2289))))

(declare-fun bm!2288 () Bool)

(assert (=> bm!2288 (= call!2293 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3190 (_2!498 lt!9645)) (mask!4763 (_2!498 lt!9645))))))

(declare-fun b!25185 () Bool)

(declare-fun e!16281 () Bool)

(declare-fun call!2298 () ListLongMap!565)

(assert (=> b!25185 (= e!16281 (= call!2283 call!2298))))

(declare-fun bm!2289 () Bool)

(assert (=> bm!2289 (= call!2298 (map!411 (_2!498 lt!9645)))))

(declare-fun bm!2290 () Bool)

(declare-fun call!2280 () Bool)

(assert (=> bm!2290 (= call!2296 call!2280)))

(declare-fun bm!2291 () Bool)

(assert (=> bm!2291 (= call!2282 call!2280)))

(declare-fun b!25186 () Bool)

(declare-fun res!15194 () Bool)

(assert (=> b!25186 (=> (not res!15194) (not e!16269))))

(assert (=> b!25186 (= res!15194 call!2291)))

(assert (=> b!25186 (= e!16276 e!16269)))

(declare-fun bm!2292 () Bool)

(assert (=> bm!2292 (= call!2277 call!2290)))

(declare-fun b!25187 () Bool)

(assert (=> b!25187 (= e!16286 e!16282)))

(declare-fun res!15188 () Bool)

(assert (=> b!25187 (= res!15188 call!2291)))

(assert (=> b!25187 (=> (not res!15188) (not e!16282))))

(declare-fun b!25188 () Bool)

(assert (=> b!25188 (= e!16273 e!16281)))

(declare-fun c!3476 () Bool)

(assert (=> b!25188 (= c!3476 (_1!498 lt!9742))))

(declare-fun b!25189 () Bool)

(declare-fun res!15191 () Bool)

(assert (=> b!25189 (= res!15191 (= (select (arr!603 (_keys!3190 (_2!498 lt!9645))) (index!2345 lt!9746)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25189 (=> (not res!15191) (not e!16267))))

(declare-fun bm!2293 () Bool)

(assert (=> bm!2293 (= call!2287 call!2293)))

(declare-fun b!25190 () Bool)

(declare-fun e!16278 () Bool)

(assert (=> b!25190 (= e!16281 e!16278)))

(declare-fun res!15193 () Bool)

(assert (=> b!25190 (= res!15193 (contains!232 call!2283 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25190 (=> (not res!15193) (not e!16278))))

(declare-fun b!25191 () Bool)

(assert (=> b!25191 (= e!16268 e!16267)))

(declare-fun res!15189 () Bool)

(assert (=> b!25191 (= res!15189 call!2276)))

(assert (=> b!25191 (=> (not res!15189) (not e!16267))))

(declare-fun b!25192 () Bool)

(declare-fun res!15192 () Bool)

(assert (=> b!25192 (=> (not res!15192) (not e!16275))))

(assert (=> b!25192 (= res!15192 call!2276)))

(assert (=> b!25192 (= e!16271 e!16275)))

(declare-fun bm!2294 () Bool)

(assert (=> bm!2294 (= call!2295 call!2278)))

(declare-fun b!25193 () Bool)

(assert (=> b!25193 (= e!16268 ((_ is Undefined!55) lt!9746))))

(declare-fun b!25194 () Bool)

(declare-fun Unit!604 () Unit!601)

(assert (=> b!25194 (= e!16284 Unit!604)))

(declare-fun lt!9764 () Unit!601)

(assert (=> b!25194 (= lt!9764 call!2281)))

(assert (=> b!25194 (= lt!9757 call!2284)))

(declare-fun c!3474 () Bool)

(assert (=> b!25194 (= c!3474 ((_ is MissingZero!55) lt!9757))))

(assert (=> b!25194 e!16276))

(declare-fun lt!9761 () Unit!601)

(assert (=> b!25194 (= lt!9761 lt!9764)))

(assert (=> b!25194 false))

(declare-fun b!25195 () Bool)

(assert (=> b!25195 (= e!16274 e!16283)))

(assert (=> b!25195 (= c!3471 (= #b1000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2295 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2295 (= call!2280 (inRange!0 (ite c!3480 (ite c!3481 (index!2343 lt!9756) (ite c!3479 (index!2342 lt!9746) (index!2345 lt!9746))) (ite c!3475 (index!2343 lt!9738) (ite c!3474 (index!2342 lt!9757) (index!2345 lt!9757)))) (mask!4763 (_2!498 lt!9645))))))

(declare-fun b!25196 () Bool)

(assert (=> b!25196 (= e!16278 (= call!2283 (+!45 call!2298 (tuple2!985 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1684 (v!1618 (underlying!118 thiss!938)))))))))

(declare-fun b!25197 () Bool)

(assert (=> b!25197 (= e!16280 (= (select (arr!603 (_keys!3190 (_2!498 lt!9645))) (index!2343 lt!9756)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!4745 c!3472) b!25195))

(assert (= (and d!4745 (not c!3472)) b!25173))

(assert (= (and b!25195 c!3471) b!25178))

(assert (= (and b!25195 (not c!3471)) b!25168))

(assert (= (or b!25178 b!25168) bm!2294))

(assert (= (or b!25178 b!25168) bm!2285))

(assert (= (or b!25178 b!25168) bm!2274))

(assert (= (and b!25173 c!3480) b!25166))

(assert (= (and b!25173 (not c!3480)) b!25181))

(assert (= (and b!25166 c!3481) b!25165))

(assert (= (and b!25166 (not c!3481)) b!25164))

(assert (= (and b!25165 res!15200) b!25161))

(assert (= (and b!25161 res!15198) b!25197))

(assert (= (and b!25164 c!3479) b!25192))

(assert (= (and b!25164 (not c!3479)) b!25162))

(assert (= (and b!25192 res!15192) b!25180))

(assert (= (and b!25180 res!15197) b!25174))

(assert (= (and b!25162 c!3482) b!25191))

(assert (= (and b!25162 (not c!3482)) b!25193))

(assert (= (and b!25191 res!15189) b!25189))

(assert (= (and b!25189 res!15191) b!25169))

(assert (= (or b!25192 b!25191) bm!2273))

(assert (= (or b!25174 b!25169) bm!2292))

(assert (= (or b!25161 bm!2273) bm!2291))

(assert (= (or b!25165 b!25164) bm!2293))

(assert (= (and b!25181 c!3478) b!25179))

(assert (= (and b!25181 (not c!3478)) b!25175))

(assert (= (and b!25175 c!3477) b!25182))

(assert (= (and b!25175 (not c!3477)) b!25172))

(assert (= (and b!25172 c!3475) b!25176))

(assert (= (and b!25172 (not c!3475)) b!25194))

(assert (= (and b!25176 res!15195) b!25163))

(assert (= (and b!25163 res!15187) b!25160))

(assert (= (and b!25194 c!3474) b!25186))

(assert (= (and b!25194 (not c!3474)) b!25183))

(assert (= (and b!25186 res!15194) b!25171))

(assert (= (and b!25171 res!15199) b!25167))

(assert (= (and b!25183 c!3473) b!25187))

(assert (= (and b!25183 (not c!3473)) b!25170))

(assert (= (and b!25187 res!15188) b!25177))

(assert (= (and b!25177 res!15190) b!25184))

(assert (= (or b!25186 b!25187) bm!2277))

(assert (= (or b!25167 b!25184) bm!2279))

(assert (= (or b!25163 bm!2277) bm!2290))

(assert (= (or b!25176 b!25194) bm!2282))

(assert (= (or b!25179 b!25182) bm!2272))

(assert (= (or b!25165 b!25176) bm!2283))

(assert (= (or b!25166 b!25172) bm!2278))

(assert (= (or bm!2291 bm!2290) bm!2295))

(assert (= (or bm!2292 bm!2279) bm!2286))

(assert (= (or b!25164 b!25194) bm!2281))

(assert (= (or bm!2293 bm!2282) bm!2288))

(assert (= (or b!25166 b!25172) bm!2287))

(assert (= (or bm!2285 b!25172) bm!2284))

(assert (= (or bm!2294 bm!2278) bm!2276))

(assert (= (or bm!2274 b!25172) bm!2280))

(assert (= (and d!4745 res!15196) b!25188))

(assert (= (and b!25188 c!3476) b!25190))

(assert (= (and b!25188 (not c!3476)) b!25185))

(assert (= (and b!25190 res!15193) b!25196))

(assert (= (or b!25196 b!25185) bm!2289))

(assert (= (or b!25190 b!25196 b!25185) bm!2275))

(declare-fun m!20179 () Bool)

(assert (=> bm!2283 m!20179))

(declare-fun m!20181 () Bool)

(assert (=> bm!2286 m!20181))

(declare-fun m!20183 () Bool)

(assert (=> bm!2275 m!20183))

(declare-fun m!20185 () Bool)

(assert (=> bm!2288 m!20185))

(declare-fun m!20187 () Bool)

(assert (=> bm!2276 m!20187))

(declare-fun m!20189 () Bool)

(assert (=> b!25190 m!20189))

(declare-fun m!20191 () Bool)

(assert (=> b!25168 m!20191))

(declare-fun m!20193 () Bool)

(assert (=> d!4745 m!20193))

(declare-fun m!20195 () Bool)

(assert (=> d!4745 m!20195))

(declare-fun m!20197 () Bool)

(assert (=> b!25196 m!20197))

(assert (=> b!25173 m!20185))

(declare-fun m!20199 () Bool)

(assert (=> b!25180 m!20199))

(declare-fun m!20201 () Bool)

(assert (=> bm!2272 m!20201))

(declare-fun m!20203 () Bool)

(assert (=> bm!2280 m!20203))

(declare-fun m!20205 () Bool)

(assert (=> b!25189 m!20205))

(declare-fun m!20207 () Bool)

(assert (=> b!25172 m!20207))

(declare-fun m!20209 () Bool)

(assert (=> b!25172 m!20209))

(declare-fun m!20211 () Bool)

(assert (=> b!25172 m!20211))

(declare-fun m!20213 () Bool)

(assert (=> b!25172 m!20213))

(declare-fun m!20215 () Bool)

(assert (=> b!25172 m!20215))

(declare-fun m!20217 () Bool)

(assert (=> bm!2295 m!20217))

(declare-fun m!20219 () Bool)

(assert (=> b!25178 m!20219))

(declare-fun m!20221 () Bool)

(assert (=> bm!2281 m!20221))

(declare-fun m!20223 () Bool)

(assert (=> bm!2284 m!20223))

(declare-fun m!20225 () Bool)

(assert (=> b!25177 m!20225))

(declare-fun m!20227 () Bool)

(assert (=> b!25171 m!20227))

(declare-fun m!20229 () Bool)

(assert (=> b!25160 m!20229))

(declare-fun m!20231 () Bool)

(assert (=> bm!2287 m!20231))

(declare-fun m!20233 () Bool)

(assert (=> bm!2287 m!20233))

(declare-fun m!20235 () Bool)

(assert (=> bm!2289 m!20235))

(declare-fun m!20237 () Bool)

(assert (=> b!25197 m!20237))

(assert (=> b!24986 d!4745))

(declare-fun b!25210 () Bool)

(declare-fun e!16295 () Bool)

(declare-fun lt!9819 () tuple2!984)

(declare-fun lt!9817 () (_ BitVec 32))

(assert (=> b!25210 (= e!16295 (ite (= (_1!501 lt!9819) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!9817 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!9817 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!25211 () Bool)

(declare-fun e!16294 () Unit!601)

(declare-fun Unit!605 () Unit!601)

(assert (=> b!25211 (= e!16294 Unit!605)))

(declare-fun lt!9826 () LongMapFixedSize!214)

(declare-fun head!829 (List!566) tuple2!984)

(assert (=> b!25211 (= lt!9819 (head!829 (toList!298 (map!411 lt!9826))))))

(declare-fun lt!9823 () array!1277)

(assert (=> b!25211 (= lt!9823 (array!1278 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!25211 (= lt!9817 #b00000000000000000000000000000000)))

(declare-fun lt!9814 () Unit!601)

(declare-fun lemmaKeyInListMapIsInArray!98 (array!1277 array!1275 (_ BitVec 32) (_ BitVec 32) V!1195 V!1195 (_ BitVec 64) Int) Unit!601)

(declare-fun dynLambda!141 (Int (_ BitVec 64)) V!1195)

(assert (=> b!25211 (= lt!9814 (lemmaKeyInListMapIsInArray!98 lt!9823 (array!1276 ((as const (Array (_ BitVec 32) ValueCell!314)) EmptyCell!314) (bvadd (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) lt!9817 (dynLambda!141 (defaultEntry!1764 (v!1618 (underlying!118 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!141 (defaultEntry!1764 (v!1618 (underlying!118 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!501 lt!9819) (defaultEntry!1764 (v!1618 (underlying!118 thiss!938)))))))

(declare-fun c!3487 () Bool)

(assert (=> b!25211 (= c!3487 (and (not (= (_1!501 lt!9819) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!501 lt!9819) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!25211 e!16295))

(declare-fun lt!9829 () Unit!601)

(assert (=> b!25211 (= lt!9829 lt!9814)))

(declare-fun lt!9831 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1277 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!25211 (= lt!9831 (arrayScanForKey!0 (array!1278 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) #b00000000000000000000000000000001)) (_1!501 lt!9819) #b00000000000000000000000000000000))))

(assert (=> b!25211 false))

(declare-fun b!25212 () Bool)

(declare-fun e!16293 () Bool)

(declare-fun lt!9820 () LongMapFixedSize!214)

(assert (=> b!25212 (= e!16293 (= (map!411 lt!9820) (ListLongMap!566 Nil!563)))))

(declare-fun b!25213 () Bool)

(declare-fun res!15206 () Bool)

(assert (=> b!25213 (=> (not res!15206) (not e!16293))))

(assert (=> b!25213 (= res!15206 (= (mask!4763 lt!9820) (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938))))))))

(declare-fun b!25214 () Bool)

(declare-fun Unit!606 () Unit!601)

(assert (=> b!25214 (= e!16294 Unit!606)))

(declare-fun b!25215 () Bool)

(assert (=> b!25215 (= e!16295 (arrayContainsKey!0 lt!9823 (_1!501 lt!9819) #b00000000000000000000000000000000))))

(declare-fun d!4747 () Bool)

(assert (=> d!4747 e!16293))

(declare-fun res!15205 () Bool)

(assert (=> d!4747 (=> (not res!15205) (not e!16293))))

(assert (=> d!4747 (= res!15205 (valid!123 lt!9820))))

(assert (=> d!4747 (= lt!9820 lt!9826)))

(declare-fun lt!9813 () Unit!601)

(assert (=> d!4747 (= lt!9813 e!16294)))

(declare-fun c!3488 () Bool)

(assert (=> d!4747 (= c!3488 (not (= (map!411 lt!9826) (ListLongMap!566 Nil!563))))))

(declare-fun lt!9830 () Unit!601)

(declare-fun lt!9815 () Unit!601)

(assert (=> d!4747 (= lt!9830 lt!9815)))

(declare-fun lt!9825 () array!1277)

(declare-fun lt!9821 () (_ BitVec 32))

(declare-datatypes ((List!567 0))(
  ( (Nil!564) (Cons!563 (h!1130 (_ BitVec 64)) (t!3246 List!567)) )
))
(declare-fun lt!9832 () List!567)

(declare-fun arrayNoDuplicates!0 (array!1277 (_ BitVec 32) List!567) Bool)

(assert (=> d!4747 (arrayNoDuplicates!0 lt!9825 lt!9821 lt!9832)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1277 (_ BitVec 32) (_ BitVec 32) List!567) Unit!601)

(assert (=> d!4747 (= lt!9815 (lemmaArrayNoDuplicatesInAll0Array!0 lt!9825 lt!9821 (bvadd (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) #b00000000000000000000000000000001) lt!9832))))

(assert (=> d!4747 (= lt!9832 Nil!564)))

(assert (=> d!4747 (= lt!9821 #b00000000000000000000000000000000)))

(assert (=> d!4747 (= lt!9825 (array!1278 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!9816 () Unit!601)

(declare-fun lt!9828 () Unit!601)

(assert (=> d!4747 (= lt!9816 lt!9828)))

(declare-fun lt!9822 () (_ BitVec 32))

(declare-fun lt!9812 () array!1277)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1277 (_ BitVec 32)) Bool)

(assert (=> d!4747 (arrayForallSeekEntryOrOpenFound!0 lt!9822 lt!9812 (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1277 (_ BitVec 32) (_ BitVec 32)) Unit!601)

(assert (=> d!4747 (= lt!9828 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!9812 (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) lt!9822))))

(assert (=> d!4747 (= lt!9822 #b00000000000000000000000000000000)))

(assert (=> d!4747 (= lt!9812 (array!1278 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!9824 () Unit!601)

(declare-fun lt!9818 () Unit!601)

(assert (=> d!4747 (= lt!9824 lt!9818)))

(declare-fun lt!9833 () array!1277)

(declare-fun lt!9827 () (_ BitVec 32))

(declare-fun lt!9811 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1277 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!4747 (= (arrayCountValidKeys!0 lt!9833 lt!9827 lt!9811) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1277 (_ BitVec 32) (_ BitVec 32)) Unit!601)

(assert (=> d!4747 (= lt!9818 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!9833 lt!9827 lt!9811))))

(assert (=> d!4747 (= lt!9811 (bvadd (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!4747 (= lt!9827 #b00000000000000000000000000000000)))

(assert (=> d!4747 (= lt!9833 (array!1278 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!4747 (= lt!9826 (LongMapFixedSize!215 (defaultEntry!1764 (v!1618 (underlying!118 thiss!938))) (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!141 (defaultEntry!1764 (v!1618 (underlying!118 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!141 (defaultEntry!1764 (v!1618 (underlying!118 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1278 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) #b00000000000000000000000000000001)) (array!1276 ((as const (Array (_ BitVec 32) ValueCell!314)) EmptyCell!314) (bvadd (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!4747 (validMask!0 (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))))))

(assert (=> d!4747 (= (getNewLongMapFixedSize!40 (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) (defaultEntry!1764 (v!1618 (underlying!118 thiss!938)))) lt!9820)))

(assert (= (and d!4747 c!3488) b!25211))

(assert (= (and d!4747 (not c!3488)) b!25214))

(assert (= (and b!25211 c!3487) b!25215))

(assert (= (and b!25211 (not c!3487)) b!25210))

(assert (= (and d!4747 res!15205) b!25213))

(assert (= (and b!25213 res!15206) b!25212))

(declare-fun b_lambda!1647 () Bool)

(assert (=> (not b_lambda!1647) (not b!25211)))

(declare-fun t!3244 () Bool)

(declare-fun tb!665 () Bool)

(assert (=> (and b!24981 (= (defaultEntry!1764 (v!1618 (underlying!118 thiss!938))) (defaultEntry!1764 (v!1618 (underlying!118 thiss!938)))) t!3244) tb!665))

(declare-fun result!1105 () Bool)

(assert (=> tb!665 (= result!1105 tp_is_empty!1027)))

(assert (=> b!25211 t!3244))

(declare-fun b_and!1553 () Bool)

(assert (= b_and!1547 (and (=> t!3244 result!1105) b_and!1553)))

(declare-fun b_lambda!1649 () Bool)

(assert (=> (not b_lambda!1649) (not d!4747)))

(assert (=> d!4747 t!3244))

(declare-fun b_and!1555 () Bool)

(assert (= b_and!1553 (and (=> t!3244 result!1105) b_and!1555)))

(declare-fun m!20239 () Bool)

(assert (=> b!25211 m!20239))

(declare-fun m!20241 () Bool)

(assert (=> b!25211 m!20241))

(declare-fun m!20243 () Bool)

(assert (=> b!25211 m!20243))

(declare-fun m!20245 () Bool)

(assert (=> b!25211 m!20245))

(assert (=> b!25211 m!20137))

(assert (=> b!25211 m!20245))

(assert (=> b!25211 m!20245))

(declare-fun m!20247 () Bool)

(assert (=> b!25211 m!20247))

(declare-fun m!20249 () Bool)

(assert (=> b!25212 m!20249))

(declare-fun m!20251 () Bool)

(assert (=> b!25215 m!20251))

(declare-fun m!20253 () Bool)

(assert (=> d!4747 m!20253))

(assert (=> d!4747 m!20137))

(declare-fun m!20255 () Bool)

(assert (=> d!4747 m!20255))

(declare-fun m!20257 () Bool)

(assert (=> d!4747 m!20257))

(assert (=> d!4747 m!20243))

(declare-fun m!20259 () Bool)

(assert (=> d!4747 m!20259))

(assert (=> d!4747 m!20137))

(declare-fun m!20261 () Bool)

(assert (=> d!4747 m!20261))

(declare-fun m!20263 () Bool)

(assert (=> d!4747 m!20263))

(assert (=> d!4747 m!20137))

(declare-fun m!20265 () Bool)

(assert (=> d!4747 m!20265))

(declare-fun m!20267 () Bool)

(assert (=> d!4747 m!20267))

(assert (=> d!4747 m!20245))

(assert (=> b!24989 d!4747))

(declare-fun d!4749 () Bool)

(declare-fun e!16300 () Bool)

(assert (=> d!4749 e!16300))

(declare-fun res!15209 () Bool)

(assert (=> d!4749 (=> (not res!15209) (not e!16300))))

(declare-fun lt!9838 () (_ BitVec 32))

(assert (=> d!4749 (= res!15209 (validMask!0 lt!9838))))

(declare-datatypes ((tuple2!986 0))(
  ( (tuple2!987 (_1!502 Unit!601) (_2!502 (_ BitVec 32))) )
))
(declare-fun e!16301 () tuple2!986)

(assert (=> d!4749 (= lt!9838 (_2!502 e!16301))))

(declare-fun c!3491 () Bool)

(declare-fun lt!9839 () tuple2!986)

(assert (=> d!4749 (= c!3491 (and (bvsgt (_2!502 lt!9839) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!154 (v!1618 (underlying!118 thiss!938)))) (_2!502 lt!9839)) (bvsge (bvadd (bvand (bvashr (_2!502 lt!9839) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!154 (v!1618 (underlying!118 thiss!938))))))))

(declare-fun Unit!607 () Unit!601)

(declare-fun Unit!608 () Unit!601)

(assert (=> d!4749 (= lt!9839 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!154 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))))) (mask!4763 (v!1618 (underlying!118 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!154 (v!1618 (underlying!118 thiss!938)))) (mask!4763 (v!1618 (underlying!118 thiss!938))))) (tuple2!987 Unit!607 (bvand (bvadd (bvshl (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!987 Unit!608 (mask!4763 (v!1618 (underlying!118 thiss!938))))))))

(assert (=> d!4749 (validMask!0 (mask!4763 (v!1618 (underlying!118 thiss!938))))))

(assert (=> d!4749 (= (computeNewMask!35 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) lt!9838)))

(declare-fun b!25224 () Bool)

(declare-fun computeNewMaskWhile!15 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!986)

(assert (=> b!25224 (= e!16301 (computeNewMaskWhile!15 (_size!154 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (mask!4763 (v!1618 (underlying!118 thiss!938))) (_2!502 lt!9839)))))

(declare-fun b!25225 () Bool)

(declare-fun Unit!609 () Unit!601)

(assert (=> b!25225 (= e!16301 (tuple2!987 Unit!609 (_2!502 lt!9839)))))

(declare-fun b!25226 () Bool)

(assert (=> b!25226 (= e!16300 (bvsle (_size!154 (v!1618 (underlying!118 thiss!938))) (bvadd lt!9838 #b00000000000000000000000000000001)))))

(assert (= (and d!4749 c!3491) b!25224))

(assert (= (and d!4749 (not c!3491)) b!25225))

(assert (= (and d!4749 res!15209) b!25226))

(declare-fun m!20269 () Bool)

(assert (=> d!4749 m!20269))

(assert (=> d!4749 m!20135))

(declare-fun m!20271 () Bool)

(assert (=> b!25224 m!20271))

(assert (=> b!24989 d!4749))

(declare-fun d!4751 () Bool)

(assert (=> d!4751 (= (validMask!0 (mask!4763 (v!1618 (underlying!118 thiss!938)))) (and (or (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000000000000111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000000000001111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000000000011111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000000000111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000000001111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000000011111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000000111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000001111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000011111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000000001111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000000011111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000000111111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000001111111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000011111111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000000111111111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000001111111111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000011111111111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000000111111111111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000001111111111111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000011111111111111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000000111111111111111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000001111111111111111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000011111111111111111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00000111111111111111111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00001111111111111111111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00011111111111111111111111111111) (= (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4763 (v!1618 (underlying!118 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!24993 d!4751))

(declare-fun d!4753 () Bool)

(assert (=> d!4753 (= (array_inv!425 (_keys!3190 (v!1618 (underlying!118 thiss!938)))) (bvsge (size!704 (_keys!3190 (v!1618 (underlying!118 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!24981 d!4753))

(declare-fun d!4755 () Bool)

(assert (=> d!4755 (= (array_inv!426 (_values!1749 (v!1618 (underlying!118 thiss!938)))) (bvsge (size!703 (_values!1749 (v!1618 (underlying!118 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!24981 d!4755))

(declare-fun d!4757 () Bool)

(assert (=> d!4757 (= (valid!122 thiss!938) (valid!123 (v!1618 (underlying!118 thiss!938))))))

(declare-fun bs!1048 () Bool)

(assert (= bs!1048 d!4757))

(declare-fun m!20273 () Bool)

(assert (=> bs!1048 m!20273))

(assert (=> start!3628 d!4757))

(declare-fun lt!9840 () SeekEntryResult!55)

(declare-fun e!16320 () Bool)

(declare-fun b!25227 () Bool)

(assert (=> b!25227 (= e!16320 (= (select (arr!603 (_keys!3190 lt!9646)) (index!2343 lt!9840)) (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun c!3499 () Bool)

(declare-fun call!2316 () tuple2!978)

(declare-fun lt!9861 () SeekEntryResult!55)

(declare-fun bm!2296 () Bool)

(assert (=> bm!2296 (= call!2316 (updateHelperNewKey!11 lt!9646 (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938)))) (ite c!3499 (index!2345 lt!9861) (index!2342 lt!9861))))))

(declare-fun b!25228 () Bool)

(declare-fun res!15221 () Bool)

(declare-fun call!2306 () Bool)

(assert (=> b!25228 (= res!15221 call!2306)))

(declare-fun e!16315 () Bool)

(assert (=> b!25228 (=> (not res!15221) (not e!16315))))

(declare-fun b!25229 () Bool)

(declare-fun c!3503 () Bool)

(declare-fun lt!9848 () SeekEntryResult!55)

(assert (=> b!25229 (= c!3503 ((_ is MissingVacant!55) lt!9848))))

(declare-fun e!16306 () Bool)

(declare-fun e!16303 () Bool)

(assert (=> b!25229 (= e!16306 e!16303)))

(declare-fun b!25230 () Bool)

(declare-fun res!15210 () Bool)

(declare-fun call!2320 () Bool)

(assert (=> b!25230 (= res!15210 call!2320)))

(assert (=> b!25230 (=> (not res!15210) (not e!16320))))

(declare-fun b!25231 () Bool)

(declare-fun e!16305 () Unit!601)

(declare-fun lt!9849 () Unit!601)

(assert (=> b!25231 (= e!16305 lt!9849)))

(declare-fun call!2305 () Unit!601)

(assert (=> b!25231 (= lt!9849 call!2305)))

(declare-fun call!2311 () SeekEntryResult!55)

(assert (=> b!25231 (= lt!9848 call!2311)))

(declare-fun c!3500 () Bool)

(assert (=> b!25231 (= c!3500 ((_ is MissingZero!55) lt!9848))))

(assert (=> b!25231 e!16306))

(declare-fun b!25232 () Bool)

(declare-fun Unit!610 () Unit!601)

(assert (=> b!25232 (= e!16305 Unit!610)))

(declare-fun lt!9856 () Unit!601)

(declare-fun call!2321 () Unit!601)

(assert (=> b!25232 (= lt!9856 call!2321)))

(declare-fun lt!9858 () SeekEntryResult!55)

(assert (=> b!25232 (= lt!9858 call!2311)))

(declare-fun res!15223 () Bool)

(assert (=> b!25232 (= res!15223 ((_ is Found!55) lt!9858))))

(assert (=> b!25232 (=> (not res!15223) (not e!16315))))

(assert (=> b!25232 e!16315))

(declare-fun lt!9864 () Unit!601)

(assert (=> b!25232 (= lt!9864 lt!9856)))

(assert (=> b!25232 false))

(declare-fun b!25233 () Bool)

(declare-fun lt!9846 () Unit!601)

(assert (=> b!25233 (= lt!9846 e!16305)))

(declare-fun c!3502 () Bool)

(declare-fun call!2309 () Bool)

(assert (=> b!25233 (= c!3502 call!2309)))

(declare-fun e!16312 () tuple2!978)

(assert (=> b!25233 (= e!16312 (tuple2!979 false lt!9646))))

(declare-fun b!25234 () Bool)

(declare-fun e!16304 () Bool)

(declare-fun call!2313 () Bool)

(assert (=> b!25234 (= e!16304 (not call!2313))))

(declare-fun b!25235 () Bool)

(declare-fun lt!9845 () Unit!601)

(declare-fun lt!9862 () Unit!601)

(assert (=> b!25235 (= lt!9845 lt!9862)))

(declare-fun call!2303 () ListLongMap!565)

(declare-fun call!2319 () ListLongMap!565)

(assert (=> b!25235 (= call!2303 call!2319)))

(declare-fun lt!9852 () (_ BitVec 32))

(assert (=> b!25235 (= lt!9862 (lemmaChangeLongMinValueKeyThenAddPairToListMap!11 (_keys!3190 lt!9646) (_values!1749 lt!9646) (mask!4763 lt!9646) (extraKeys!1657 lt!9646) lt!9852 (zeroValue!1684 lt!9646) (minValue!1684 lt!9646) (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938)))) (defaultEntry!1764 lt!9646)))))

(assert (=> b!25235 (= lt!9852 (bvor (extraKeys!1657 lt!9646) #b00000000000000000000000000000010))))

(declare-fun e!16318 () tuple2!978)

(assert (=> b!25235 (= e!16318 (tuple2!979 true (LongMapFixedSize!215 (defaultEntry!1764 lt!9646) (mask!4763 lt!9646) (bvor (extraKeys!1657 lt!9646) #b00000000000000000000000000000010) (zeroValue!1684 lt!9646) (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938)))) (_size!154 lt!9646) (_keys!3190 lt!9646) (_values!1749 lt!9646) (_vacant!154 lt!9646))))))

(declare-fun bm!2297 () Bool)

(declare-fun call!2300 () Bool)

(assert (=> bm!2297 (= call!2300 call!2306)))

(declare-fun b!25236 () Bool)

(declare-fun e!16302 () Bool)

(declare-fun call!2301 () Bool)

(assert (=> b!25236 (= e!16302 (not call!2301))))

(declare-fun b!25237 () Bool)

(declare-fun e!16321 () Bool)

(declare-fun lt!9859 () SeekEntryResult!55)

(assert (=> b!25237 (= e!16321 ((_ is Undefined!55) lt!9859))))

(declare-fun b!25238 () Bool)

(declare-fun res!15222 () Bool)

(assert (=> b!25238 (=> (not res!15222) (not e!16304))))

(assert (=> b!25238 (= res!15222 (= (select (arr!603 (_keys!3190 lt!9646)) (index!2342 lt!9859)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25239 () Bool)

(declare-fun lt!9847 () Unit!601)

(declare-fun lt!9850 () Unit!601)

(assert (=> b!25239 (= lt!9847 lt!9850)))

(assert (=> b!25239 call!2309))

(declare-fun lt!9853 () array!1275)

(assert (=> b!25239 (= lt!9850 (lemmaValidKeyInArrayIsInListMap!11 (_keys!3190 lt!9646) lt!9853 (mask!4763 lt!9646) (extraKeys!1657 lt!9646) (zeroValue!1684 lt!9646) (minValue!1684 lt!9646) (index!2343 lt!9861) (defaultEntry!1764 lt!9646)))))

(assert (=> b!25239 (= lt!9853 (array!1276 (store (arr!602 (_values!1749 lt!9646)) (index!2343 lt!9861) (ValueCellFull!314 (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938)))))) (size!703 (_values!1749 lt!9646))))))

(declare-fun lt!9843 () Unit!601)

(declare-fun lt!9842 () Unit!601)

(assert (=> b!25239 (= lt!9843 lt!9842)))

(declare-fun call!2299 () ListLongMap!565)

(assert (=> b!25239 (= call!2299 (getCurrentListMap!128 (_keys!3190 lt!9646) (array!1276 (store (arr!602 (_values!1749 lt!9646)) (index!2343 lt!9861) (ValueCellFull!314 (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938)))))) (size!703 (_values!1749 lt!9646))) (mask!4763 lt!9646) (extraKeys!1657 lt!9646) (zeroValue!1684 lt!9646) (minValue!1684 lt!9646) #b00000000000000000000000000000000 (defaultEntry!1764 lt!9646)))))

(assert (=> b!25239 (= lt!9842 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!11 (_keys!3190 lt!9646) (_values!1749 lt!9646) (mask!4763 lt!9646) (extraKeys!1657 lt!9646) (zeroValue!1684 lt!9646) (minValue!1684 lt!9646) (index!2343 lt!9861) (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938)))) (defaultEntry!1764 lt!9646)))))

(declare-fun lt!9851 () Unit!601)

(declare-fun e!16319 () Unit!601)

(assert (=> b!25239 (= lt!9851 e!16319)))

(declare-fun c!3496 () Bool)

(declare-fun call!2312 () ListLongMap!565)

(assert (=> b!25239 (= c!3496 (contains!232 call!2312 (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!16307 () tuple2!978)

(assert (=> b!25239 (= e!16307 (tuple2!979 true (LongMapFixedSize!215 (defaultEntry!1764 lt!9646) (mask!4763 lt!9646) (extraKeys!1657 lt!9646) (zeroValue!1684 lt!9646) (minValue!1684 lt!9646) (_size!154 lt!9646) (_keys!3190 lt!9646) (array!1276 (store (arr!602 (_values!1749 lt!9646)) (index!2343 lt!9861) (ValueCellFull!314 (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938)))))) (size!703 (_values!1749 lt!9646))) (_vacant!154 lt!9646))))))

(declare-fun bm!2298 () Bool)

(assert (=> bm!2298 (= call!2303 call!2299)))

(declare-fun d!4759 () Bool)

(declare-fun e!16308 () Bool)

(assert (=> d!4759 e!16308))

(declare-fun res!15219 () Bool)

(assert (=> d!4759 (=> (not res!15219) (not e!16308))))

(declare-fun lt!9844 () tuple2!978)

(assert (=> d!4759 (= res!15219 (valid!123 (_2!498 lt!9844)))))

(declare-fun e!16309 () tuple2!978)

(assert (=> d!4759 (= lt!9844 e!16309)))

(declare-fun c!3493 () Bool)

(assert (=> d!4759 (= c!3493 (= (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvneg (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!4759 (valid!123 lt!9646)))

(assert (=> d!4759 (= (update!43 lt!9646 (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938))))) lt!9844)))

(declare-fun bm!2299 () Bool)

(declare-fun call!2307 () ListLongMap!565)

(assert (=> bm!2299 (= call!2307 (map!411 (_2!498 lt!9844)))))

(declare-fun lt!9841 () (_ BitVec 32))

(declare-fun bm!2300 () Bool)

(declare-fun call!2302 () ListLongMap!565)

(declare-fun c!3501 () Bool)

(declare-fun c!3492 () Bool)

(assert (=> bm!2300 (= call!2302 (getCurrentListMap!128 (_keys!3190 lt!9646) (ite (or c!3493 c!3501) (_values!1749 lt!9646) lt!9853) (mask!4763 lt!9646) (ite c!3493 (ite c!3492 lt!9841 lt!9852) (extraKeys!1657 lt!9646)) (ite (and c!3493 c!3492) (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938)))) (zeroValue!1684 lt!9646)) (ite c!3493 (ite c!3492 (minValue!1684 lt!9646) (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938))))) (minValue!1684 lt!9646)) #b00000000000000000000000000000000 (defaultEntry!1764 lt!9646)))))

(declare-fun b!25240 () Bool)

(assert (=> b!25240 (= e!16309 e!16312)))

(assert (=> b!25240 (= lt!9861 (seekEntryOrOpen!0 (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3190 lt!9646) (mask!4763 lt!9646)))))

(assert (=> b!25240 (= c!3501 ((_ is Undefined!55) lt!9861))))

(declare-fun bm!2301 () Bool)

(declare-fun call!2315 () Bool)

(assert (=> bm!2301 (= call!2315 call!2320)))

(declare-fun b!25241 () Bool)

(declare-fun e!16310 () Bool)

(assert (=> b!25241 (= e!16310 (not call!2301))))

(declare-fun b!25242 () Bool)

(declare-fun e!16314 () tuple2!978)

(assert (=> b!25242 (= e!16314 e!16307)))

(declare-fun c!3498 () Bool)

(assert (=> b!25242 (= c!3498 ((_ is MissingZero!55) lt!9861))))

(declare-fun bm!2302 () Bool)

(declare-fun call!2318 () ListLongMap!565)

(assert (=> bm!2302 (= call!2318 call!2302)))

(declare-fun bm!2303 () Bool)

(declare-fun call!2314 () Bool)

(assert (=> bm!2303 (= call!2313 call!2314)))

(declare-fun bm!2304 () Bool)

(declare-fun call!2310 () ListLongMap!565)

(assert (=> bm!2304 (= call!2299 (+!45 (ite c!3493 call!2310 call!2312) (ite c!3493 (ite c!3492 (tuple2!985 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938))))) (tuple2!985 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938)))))) (tuple2!985 (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938))))))))))

(declare-fun b!25243 () Bool)

(declare-fun lt!9855 () Unit!601)

(assert (=> b!25243 (= e!16319 lt!9855)))

(assert (=> b!25243 (= lt!9855 call!2321)))

(declare-fun call!2308 () SeekEntryResult!55)

(assert (=> b!25243 (= lt!9840 call!2308)))

(declare-fun res!15218 () Bool)

(assert (=> b!25243 (= res!15218 ((_ is Found!55) lt!9840))))

(assert (=> b!25243 (=> (not res!15218) (not e!16320))))

(assert (=> b!25243 e!16320))

(declare-fun b!25244 () Bool)

(declare-fun res!15213 () Bool)

(assert (=> b!25244 (= res!15213 (= (select (arr!603 (_keys!3190 lt!9646)) (index!2345 lt!9859)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!16317 () Bool)

(assert (=> b!25244 (=> (not res!15213) (not e!16317))))

(declare-fun bm!2305 () Bool)

(assert (=> bm!2305 (= call!2305 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!11 (_keys!3190 lt!9646) (_values!1749 lt!9646) (mask!4763 lt!9646) (extraKeys!1657 lt!9646) (zeroValue!1684 lt!9646) (minValue!1684 lt!9646) (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1764 lt!9646)))))

(declare-fun bm!2306 () Bool)

(declare-fun call!2317 () SeekEntryResult!55)

(assert (=> bm!2306 (= call!2308 call!2317)))

(declare-fun b!25245 () Bool)

(declare-fun lt!9854 () Unit!601)

(declare-fun lt!9865 () Unit!601)

(assert (=> b!25245 (= lt!9854 lt!9865)))

(assert (=> b!25245 (= call!2303 call!2319)))

(assert (=> b!25245 (= lt!9865 (lemmaChangeZeroKeyThenAddPairToListMap!11 (_keys!3190 lt!9646) (_values!1749 lt!9646) (mask!4763 lt!9646) (extraKeys!1657 lt!9646) lt!9841 (zeroValue!1684 lt!9646) (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938)))) (minValue!1684 lt!9646) (defaultEntry!1764 lt!9646)))))

(assert (=> b!25245 (= lt!9841 (bvor (extraKeys!1657 lt!9646) #b00000000000000000000000000000001))))

(assert (=> b!25245 (= e!16318 (tuple2!979 true (LongMapFixedSize!215 (defaultEntry!1764 lt!9646) (mask!4763 lt!9646) (bvor (extraKeys!1657 lt!9646) #b00000000000000000000000000000001) (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938)))) (minValue!1684 lt!9646) (_size!154 lt!9646) (_keys!3190 lt!9646) (_values!1749 lt!9646) (_vacant!154 lt!9646))))))

(declare-fun bm!2307 () Bool)

(assert (=> bm!2307 (= call!2321 (lemmaInListMapThenSeekEntryOrOpenFindsIt!11 (_keys!3190 lt!9646) (_values!1749 lt!9646) (mask!4763 lt!9646) (extraKeys!1657 lt!9646) (zeroValue!1684 lt!9646) (minValue!1684 lt!9646) (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1764 lt!9646)))))

(declare-fun bm!2308 () Bool)

(assert (=> bm!2308 (= call!2312 (getCurrentListMap!128 (_keys!3190 lt!9646) (_values!1749 lt!9646) (mask!4763 lt!9646) (extraKeys!1657 lt!9646) (zeroValue!1684 lt!9646) (minValue!1684 lt!9646) #b00000000000000000000000000000000 (defaultEntry!1764 lt!9646)))))

(declare-fun b!25246 () Bool)

(declare-fun lt!9860 () tuple2!978)

(assert (=> b!25246 (= e!16314 (tuple2!979 (_1!498 lt!9860) (_2!498 lt!9860)))))

(assert (=> b!25246 (= lt!9860 call!2316)))

(declare-fun bm!2309 () Bool)

(assert (=> bm!2309 (= call!2310 call!2312)))

(declare-fun bm!2310 () Bool)

(assert (=> bm!2310 (= call!2314 (arrayContainsKey!0 (_keys!3190 lt!9646) (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000))))

(declare-fun b!25247 () Bool)

(declare-fun res!15220 () Bool)

(assert (=> b!25247 (=> (not res!15220) (not e!16310))))

(assert (=> b!25247 (= res!15220 (= (select (arr!603 (_keys!3190 lt!9646)) (index!2342 lt!9848)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25248 () Bool)

(assert (=> b!25248 (= c!3499 ((_ is MissingVacant!55) lt!9861))))

(assert (=> b!25248 (= e!16312 e!16314)))

(declare-fun bm!2311 () Bool)

(assert (=> bm!2311 (= call!2309 (contains!232 call!2318 (ite c!3501 (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (select (arr!603 (_keys!3190 lt!9646)) (index!2343 lt!9861)))))))

(declare-fun b!25249 () Bool)

(declare-fun lt!9857 () tuple2!978)

(assert (=> b!25249 (= lt!9857 call!2316)))

(assert (=> b!25249 (= e!16307 (tuple2!979 (_1!498 lt!9857) (_2!498 lt!9857)))))

(declare-fun b!25250 () Bool)

(declare-fun c!3494 () Bool)

(assert (=> b!25250 (= c!3494 ((_ is MissingVacant!55) lt!9859))))

(declare-fun e!16311 () Bool)

(assert (=> b!25250 (= e!16311 e!16321)))

(declare-fun b!25251 () Bool)

(assert (=> b!25251 (= e!16317 (not call!2313))))

(declare-fun bm!2312 () Bool)

(assert (=> bm!2312 (= call!2317 (seekEntryOrOpen!0 (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3190 lt!9646) (mask!4763 lt!9646)))))

(declare-fun b!25252 () Bool)

(declare-fun e!16316 () Bool)

(declare-fun call!2322 () ListLongMap!565)

(assert (=> b!25252 (= e!16316 (= call!2307 call!2322))))

(declare-fun bm!2313 () Bool)

(assert (=> bm!2313 (= call!2322 (map!411 lt!9646))))

(declare-fun bm!2314 () Bool)

(declare-fun call!2304 () Bool)

(assert (=> bm!2314 (= call!2320 call!2304)))

(declare-fun bm!2315 () Bool)

(assert (=> bm!2315 (= call!2306 call!2304)))

(declare-fun b!25253 () Bool)

(declare-fun res!15217 () Bool)

(assert (=> b!25253 (=> (not res!15217) (not e!16304))))

(assert (=> b!25253 (= res!15217 call!2315)))

(assert (=> b!25253 (= e!16311 e!16304)))

(declare-fun bm!2316 () Bool)

(assert (=> bm!2316 (= call!2301 call!2314)))

(declare-fun b!25254 () Bool)

(assert (=> b!25254 (= e!16321 e!16317)))

(declare-fun res!15211 () Bool)

(assert (=> b!25254 (= res!15211 call!2315)))

(assert (=> b!25254 (=> (not res!15211) (not e!16317))))

(declare-fun b!25255 () Bool)

(assert (=> b!25255 (= e!16308 e!16316)))

(declare-fun c!3497 () Bool)

(assert (=> b!25255 (= c!3497 (_1!498 lt!9844))))

(declare-fun b!25256 () Bool)

(declare-fun res!15214 () Bool)

(assert (=> b!25256 (= res!15214 (= (select (arr!603 (_keys!3190 lt!9646)) (index!2345 lt!9848)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25256 (=> (not res!15214) (not e!16302))))

(declare-fun bm!2317 () Bool)

(assert (=> bm!2317 (= call!2311 call!2317)))

(declare-fun b!25257 () Bool)

(declare-fun e!16313 () Bool)

(assert (=> b!25257 (= e!16316 e!16313)))

(declare-fun res!15216 () Bool)

(assert (=> b!25257 (= res!15216 (contains!232 call!2307 (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25257 (=> (not res!15216) (not e!16313))))

(declare-fun b!25258 () Bool)

(assert (=> b!25258 (= e!16303 e!16302)))

(declare-fun res!15212 () Bool)

(assert (=> b!25258 (= res!15212 call!2300)))

(assert (=> b!25258 (=> (not res!15212) (not e!16302))))

(declare-fun b!25259 () Bool)

(declare-fun res!15215 () Bool)

(assert (=> b!25259 (=> (not res!15215) (not e!16310))))

(assert (=> b!25259 (= res!15215 call!2300)))

(assert (=> b!25259 (= e!16306 e!16310)))

(declare-fun bm!2318 () Bool)

(assert (=> bm!2318 (= call!2319 call!2302)))

(declare-fun b!25260 () Bool)

(assert (=> b!25260 (= e!16303 ((_ is Undefined!55) lt!9848))))

(declare-fun b!25261 () Bool)

(declare-fun Unit!611 () Unit!601)

(assert (=> b!25261 (= e!16319 Unit!611)))

(declare-fun lt!9866 () Unit!601)

(assert (=> b!25261 (= lt!9866 call!2305)))

(assert (=> b!25261 (= lt!9859 call!2308)))

(declare-fun c!3495 () Bool)

(assert (=> b!25261 (= c!3495 ((_ is MissingZero!55) lt!9859))))

(assert (=> b!25261 e!16311))

(declare-fun lt!9863 () Unit!601)

(assert (=> b!25261 (= lt!9863 lt!9866)))

(assert (=> b!25261 false))

(declare-fun b!25262 () Bool)

(assert (=> b!25262 (= e!16309 e!16318)))

(assert (=> b!25262 (= c!3492 (= (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2319 () Bool)

(assert (=> bm!2319 (= call!2304 (inRange!0 (ite c!3501 (ite c!3502 (index!2343 lt!9858) (ite c!3500 (index!2342 lt!9848) (index!2345 lt!9848))) (ite c!3496 (index!2343 lt!9840) (ite c!3495 (index!2342 lt!9859) (index!2345 lt!9859)))) (mask!4763 lt!9646)))))

(declare-fun b!25263 () Bool)

(assert (=> b!25263 (= e!16313 (= call!2307 (+!45 call!2322 (tuple2!985 (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3426 c!3427) (zeroValue!1684 (v!1618 (underlying!118 thiss!938))) (minValue!1684 (v!1618 (underlying!118 thiss!938))))))))))

(declare-fun b!25264 () Bool)

(assert (=> b!25264 (= e!16315 (= (select (arr!603 (_keys!3190 lt!9646)) (index!2343 lt!9858)) (ite (or c!3426 c!3427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!4759 c!3493) b!25262))

(assert (= (and d!4759 (not c!3493)) b!25240))

(assert (= (and b!25262 c!3492) b!25245))

(assert (= (and b!25262 (not c!3492)) b!25235))

(assert (= (or b!25245 b!25235) bm!2318))

(assert (= (or b!25245 b!25235) bm!2309))

(assert (= (or b!25245 b!25235) bm!2298))

(assert (= (and b!25240 c!3501) b!25233))

(assert (= (and b!25240 (not c!3501)) b!25248))

(assert (= (and b!25233 c!3502) b!25232))

(assert (= (and b!25233 (not c!3502)) b!25231))

(assert (= (and b!25232 res!15223) b!25228))

(assert (= (and b!25228 res!15221) b!25264))

(assert (= (and b!25231 c!3500) b!25259))

(assert (= (and b!25231 (not c!3500)) b!25229))

(assert (= (and b!25259 res!15215) b!25247))

(assert (= (and b!25247 res!15220) b!25241))

(assert (= (and b!25229 c!3503) b!25258))

(assert (= (and b!25229 (not c!3503)) b!25260))

(assert (= (and b!25258 res!15212) b!25256))

(assert (= (and b!25256 res!15214) b!25236))

(assert (= (or b!25259 b!25258) bm!2297))

(assert (= (or b!25241 b!25236) bm!2316))

(assert (= (or b!25228 bm!2297) bm!2315))

(assert (= (or b!25232 b!25231) bm!2317))

(assert (= (and b!25248 c!3499) b!25246))

(assert (= (and b!25248 (not c!3499)) b!25242))

(assert (= (and b!25242 c!3498) b!25249))

(assert (= (and b!25242 (not c!3498)) b!25239))

(assert (= (and b!25239 c!3496) b!25243))

(assert (= (and b!25239 (not c!3496)) b!25261))

(assert (= (and b!25243 res!15218) b!25230))

(assert (= (and b!25230 res!15210) b!25227))

(assert (= (and b!25261 c!3495) b!25253))

(assert (= (and b!25261 (not c!3495)) b!25250))

(assert (= (and b!25253 res!15217) b!25238))

(assert (= (and b!25238 res!15222) b!25234))

(assert (= (and b!25250 c!3494) b!25254))

(assert (= (and b!25250 (not c!3494)) b!25237))

(assert (= (and b!25254 res!15211) b!25244))

(assert (= (and b!25244 res!15213) b!25251))

(assert (= (or b!25253 b!25254) bm!2301))

(assert (= (or b!25234 b!25251) bm!2303))

(assert (= (or b!25230 bm!2301) bm!2314))

(assert (= (or b!25243 b!25261) bm!2306))

(assert (= (or b!25246 b!25249) bm!2296))

(assert (= (or b!25232 b!25243) bm!2307))

(assert (= (or b!25233 b!25239) bm!2302))

(assert (= (or bm!2315 bm!2314) bm!2319))

(assert (= (or bm!2316 bm!2303) bm!2310))

(assert (= (or b!25231 b!25261) bm!2305))

(assert (= (or bm!2317 bm!2306) bm!2312))

(assert (= (or b!25233 b!25239) bm!2311))

(assert (= (or bm!2309 b!25239) bm!2308))

(assert (= (or bm!2318 bm!2302) bm!2300))

(assert (= (or bm!2298 b!25239) bm!2304))

(assert (= (and d!4759 res!15219) b!25255))

(assert (= (and b!25255 c!3497) b!25257))

(assert (= (and b!25255 (not c!3497)) b!25252))

(assert (= (and b!25257 res!15216) b!25263))

(assert (= (or b!25263 b!25252) bm!2313))

(assert (= (or b!25257 b!25263 b!25252) bm!2299))

(declare-fun m!20275 () Bool)

(assert (=> bm!2307 m!20275))

(declare-fun m!20277 () Bool)

(assert (=> bm!2310 m!20277))

(declare-fun m!20279 () Bool)

(assert (=> bm!2299 m!20279))

(declare-fun m!20281 () Bool)

(assert (=> bm!2312 m!20281))

(declare-fun m!20283 () Bool)

(assert (=> bm!2300 m!20283))

(declare-fun m!20285 () Bool)

(assert (=> b!25257 m!20285))

(declare-fun m!20287 () Bool)

(assert (=> b!25235 m!20287))

(declare-fun m!20289 () Bool)

(assert (=> d!4759 m!20289))

(declare-fun m!20291 () Bool)

(assert (=> d!4759 m!20291))

(declare-fun m!20293 () Bool)

(assert (=> b!25263 m!20293))

(assert (=> b!25240 m!20281))

(declare-fun m!20295 () Bool)

(assert (=> b!25247 m!20295))

(declare-fun m!20297 () Bool)

(assert (=> bm!2296 m!20297))

(declare-fun m!20299 () Bool)

(assert (=> bm!2304 m!20299))

(declare-fun m!20301 () Bool)

(assert (=> b!25256 m!20301))

(declare-fun m!20303 () Bool)

(assert (=> b!25239 m!20303))

(declare-fun m!20305 () Bool)

(assert (=> b!25239 m!20305))

(declare-fun m!20307 () Bool)

(assert (=> b!25239 m!20307))

(declare-fun m!20309 () Bool)

(assert (=> b!25239 m!20309))

(declare-fun m!20311 () Bool)

(assert (=> b!25239 m!20311))

(declare-fun m!20313 () Bool)

(assert (=> bm!2319 m!20313))

(declare-fun m!20315 () Bool)

(assert (=> b!25245 m!20315))

(declare-fun m!20317 () Bool)

(assert (=> bm!2305 m!20317))

(declare-fun m!20319 () Bool)

(assert (=> bm!2308 m!20319))

(declare-fun m!20321 () Bool)

(assert (=> b!25244 m!20321))

(declare-fun m!20323 () Bool)

(assert (=> b!25238 m!20323))

(declare-fun m!20325 () Bool)

(assert (=> b!25227 m!20325))

(declare-fun m!20327 () Bool)

(assert (=> bm!2311 m!20327))

(declare-fun m!20329 () Bool)

(assert (=> bm!2311 m!20329))

(declare-fun m!20331 () Bool)

(assert (=> bm!2313 m!20331))

(declare-fun m!20333 () Bool)

(assert (=> b!25264 m!20333))

(assert (=> bm!2210 d!4759))

(declare-fun mapIsEmpty!1045 () Bool)

(declare-fun mapRes!1045 () Bool)

(assert (=> mapIsEmpty!1045 mapRes!1045))

(declare-fun b!25272 () Bool)

(declare-fun e!16326 () Bool)

(assert (=> b!25272 (= e!16326 tp_is_empty!1027)))

(declare-fun condMapEmpty!1045 () Bool)

(declare-fun mapDefault!1045 () ValueCell!314)

(assert (=> mapNonEmpty!1036 (= condMapEmpty!1045 (= mapRest!1036 ((as const (Array (_ BitVec 32) ValueCell!314)) mapDefault!1045)))))

(assert (=> mapNonEmpty!1036 (= tp!3541 (and e!16326 mapRes!1045))))

(declare-fun b!25271 () Bool)

(declare-fun e!16327 () Bool)

(assert (=> b!25271 (= e!16327 tp_is_empty!1027)))

(declare-fun mapNonEmpty!1045 () Bool)

(declare-fun tp!3556 () Bool)

(assert (=> mapNonEmpty!1045 (= mapRes!1045 (and tp!3556 e!16327))))

(declare-fun mapRest!1045 () (Array (_ BitVec 32) ValueCell!314))

(declare-fun mapValue!1045 () ValueCell!314)

(declare-fun mapKey!1045 () (_ BitVec 32))

(assert (=> mapNonEmpty!1045 (= mapRest!1036 (store mapRest!1045 mapKey!1045 mapValue!1045))))

(assert (= (and mapNonEmpty!1036 condMapEmpty!1045) mapIsEmpty!1045))

(assert (= (and mapNonEmpty!1036 (not condMapEmpty!1045)) mapNonEmpty!1045))

(assert (= (and mapNonEmpty!1045 ((_ is ValueCellFull!314) mapValue!1045)) b!25271))

(assert (= (and mapNonEmpty!1036 ((_ is ValueCellFull!314) mapDefault!1045)) b!25272))

(declare-fun m!20335 () Bool)

(assert (=> mapNonEmpty!1045 m!20335))

(declare-fun b_lambda!1651 () Bool)

(assert (= b_lambda!1649 (or (and b!24981 b_free!763) b_lambda!1651)))

(declare-fun b_lambda!1653 () Bool)

(assert (= b_lambda!1647 (or (and b!24981 b_free!763) b_lambda!1653)))

(check-sat (not b!25168) (not bm!2305) (not bm!2311) (not b!25245) (not b!25240) (not bm!2304) (not bm!2276) (not bm!2299) (not b!25215) (not bm!2308) (not b!25263) (not b!25172) (not bm!2284) tp_is_empty!1027 (not b!25178) (not bm!2275) (not d!4747) (not b!25235) (not bm!2287) (not bm!2295) (not b_next!763) (not d!4757) (not d!4759) (not bm!2310) (not b!25173) (not b_lambda!1651) b_and!1555 (not mapNonEmpty!1045) (not d!4745) (not bm!2288) (not bm!2272) (not bm!2319) (not b!25239) (not b!25212) (not bm!2296) (not b!25224) (not b!25257) (not bm!2286) (not b!25190) (not b!25196) (not b!25211) (not bm!2280) (not bm!2289) (not bm!2300) (not d!4749) (not bm!2312) (not bm!2307) (not bm!2313) (not bm!2283) (not bm!2281) (not b_lambda!1653))
(check-sat b_and!1555 (not b_next!763))
