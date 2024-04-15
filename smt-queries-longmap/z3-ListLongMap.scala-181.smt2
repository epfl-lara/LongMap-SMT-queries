; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3622 () Bool)

(assert start!3622)

(declare-fun b!24993 () Bool)

(declare-fun b_free!763 () Bool)

(declare-fun b_next!763 () Bool)

(assert (=> b!24993 (= b_free!763 (not b_next!763))))

(declare-fun tp!3540 () Bool)

(declare-fun b_and!1551 () Bool)

(assert (=> b!24993 (= tp!3540 b_and!1551)))

(declare-fun b!24989 () Bool)

(declare-datatypes ((V!1195 0))(
  ( (V!1196 (val!540 Int)) )
))
(declare-datatypes ((array!1275 0))(
  ( (array!1276 (arr!602 (Array (_ BitVec 32) (_ BitVec 64))) (size!703 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!314 0))(
  ( (ValueCellFull!314 (v!1616 V!1195)) (EmptyCell!314) )
))
(declare-datatypes ((array!1277 0))(
  ( (array!1278 (arr!603 (Array (_ BitVec 32) ValueCell!314)) (size!704 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!214 0))(
  ( (LongMapFixedSize!215 (defaultEntry!1764 Int) (mask!4763 (_ BitVec 32)) (extraKeys!1657 (_ BitVec 32)) (zeroValue!1684 V!1195) (minValue!1684 V!1195) (_size!154 (_ BitVec 32)) (_keys!3190 array!1275) (_values!1749 array!1277) (_vacant!154 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!214 0))(
  ( (Cell!215 (v!1617 LongMapFixedSize!214)) )
))
(declare-datatypes ((tuple2!974 0))(
  ( (tuple2!975 (_1!495 Bool) (_2!495 Cell!214)) )
))
(declare-fun e!16148 () tuple2!974)

(declare-datatypes ((tuple2!976 0))(
  ( (tuple2!977 (_1!496 Bool) (_2!496 LongMapFixedSize!214)) )
))
(declare-fun lt!9683 () tuple2!976)

(assert (=> b!24989 (= e!16148 (tuple2!975 (_1!496 lt!9683) (Cell!215 (_2!496 lt!9683))))))

(declare-fun call!2227 () tuple2!976)

(assert (=> b!24989 (= lt!9683 call!2227)))

(declare-fun bm!2224 () Bool)

(declare-fun call!2228 () tuple2!976)

(assert (=> bm!2224 (= call!2227 call!2228)))

(declare-fun b!24990 () Bool)

(declare-fun e!16151 () Bool)

(declare-datatypes ((LongMap!214 0))(
  ( (LongMap!215 (underlying!118 Cell!214)) )
))
(declare-fun thiss!938 () LongMap!214)

(assert (=> b!24990 (= e!16151 (and (= (size!703 (_keys!3190 (v!1617 (underlying!118 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4763 (v!1617 (underlying!118 thiss!938))))) (bvslt (bvsub (size!703 (_keys!3190 (v!1617 (underlying!118 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!1036 () Bool)

(declare-fun mapRes!1036 () Bool)

(declare-fun tp!3541 () Bool)

(declare-fun e!16149 () Bool)

(assert (=> mapNonEmpty!1036 (= mapRes!1036 (and tp!3541 e!16149))))

(declare-fun mapRest!1036 () (Array (_ BitVec 32) ValueCell!314))

(declare-fun mapKey!1036 () (_ BitVec 32))

(declare-fun mapValue!1036 () ValueCell!314)

(assert (=> mapNonEmpty!1036 (= (arr!603 (_values!1749 (v!1617 (underlying!118 thiss!938)))) (store mapRest!1036 mapKey!1036 mapValue!1036))))

(declare-fun mapIsEmpty!1036 () Bool)

(assert (=> mapIsEmpty!1036 mapRes!1036))

(declare-fun lt!9686 () LongMapFixedSize!214)

(declare-fun c!3429 () Bool)

(declare-fun bm!2225 () Bool)

(declare-fun c!3428 () Bool)

(declare-fun lt!9682 () tuple2!976)

(declare-fun update!39 (LongMapFixedSize!214 (_ BitVec 64) V!1195) tuple2!976)

(assert (=> bm!2225 (= call!2228 (update!39 (ite c!3429 (_2!496 lt!9682) lt!9686) (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938)))))))))

(declare-fun b!24992 () Bool)

(assert (=> b!24992 (= e!16148 (tuple2!975 true (Cell!215 lt!9686)))))

(declare-fun e!16156 () Bool)

(declare-fun e!16159 () Bool)

(declare-fun tp_is_empty!1027 () Bool)

(declare-fun array_inv!423 (array!1275) Bool)

(declare-fun array_inv!424 (array!1277) Bool)

(assert (=> b!24993 (= e!16156 (and tp!3540 tp_is_empty!1027 (array_inv!423 (_keys!3190 (v!1617 (underlying!118 thiss!938)))) (array_inv!424 (_values!1749 (v!1617 (underlying!118 thiss!938)))) e!16159))))

(declare-fun b!24994 () Bool)

(assert (=> b!24994 (= e!16149 tp_is_empty!1027)))

(declare-fun b!24995 () Bool)

(declare-fun c!3427 () Bool)

(declare-fun lt!9684 () Bool)

(assert (=> b!24995 (= c!3427 (and (not (= (bvand (extraKeys!1657 (v!1617 (underlying!118 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!9684))))

(declare-fun e!16150 () tuple2!974)

(assert (=> b!24995 (= e!16150 e!16148)))

(declare-fun b!24996 () Bool)

(declare-fun e!16152 () Bool)

(assert (=> b!24996 (= e!16152 e!16156)))

(declare-fun b!24997 () Bool)

(declare-fun e!16158 () Bool)

(assert (=> b!24997 (= e!16159 (and e!16158 mapRes!1036))))

(declare-fun condMapEmpty!1036 () Bool)

(declare-fun mapDefault!1036 () ValueCell!314)

(assert (=> b!24997 (= condMapEmpty!1036 (= (arr!603 (_values!1749 (v!1617 (underlying!118 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!314)) mapDefault!1036)))))

(declare-fun b!24998 () Bool)

(assert (=> b!24998 (= e!16158 tp_is_empty!1027)))

(declare-fun b!24999 () Bool)

(declare-fun lt!9687 () tuple2!976)

(assert (=> b!24999 (= lt!9687 call!2227)))

(assert (=> b!24999 (= e!16150 (tuple2!975 (_1!496 lt!9687) (Cell!215 (_2!496 lt!9687))))))

(declare-fun b!25000 () Bool)

(declare-fun e!16155 () Bool)

(assert (=> b!25000 (= e!16155 e!16151)))

(declare-fun res!15147 () Bool)

(assert (=> b!25000 (=> (not res!15147) (not e!16151))))

(declare-fun e!16153 () tuple2!974)

(assert (=> b!25000 (= res!15147 (_1!495 e!16153))))

(assert (=> b!25000 (= c!3429 (and (not lt!9684) (not (= (bvand (extraKeys!1657 (v!1617 (underlying!118 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!25000 (= lt!9684 (= (bvand (extraKeys!1657 (v!1617 (underlying!118 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!35 ((_ BitVec 32) Int) LongMapFixedSize!214)

(declare-fun computeNewMask!32 (LongMap!214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!25000 (= lt!9686 (getNewLongMapFixedSize!35 (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))) (defaultEntry!1764 (v!1617 (underlying!118 thiss!938)))))))

(declare-fun res!15146 () Bool)

(assert (=> start!3622 (=> (not res!15146) (not e!16155))))

(declare-fun valid!117 (LongMap!214) Bool)

(assert (=> start!3622 (= res!15146 (valid!117 thiss!938))))

(assert (=> start!3622 e!16155))

(declare-fun e!16154 () Bool)

(assert (=> start!3622 e!16154))

(declare-fun b!24991 () Bool)

(declare-fun res!15148 () Bool)

(assert (=> b!24991 (=> (not res!15148) (not e!16151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!24991 (= res!15148 (validMask!0 (mask!4763 (v!1617 (underlying!118 thiss!938)))))))

(declare-fun b!25001 () Bool)

(declare-fun lt!9685 () tuple2!976)

(assert (=> b!25001 (= e!16153 (tuple2!975 (and (_1!496 lt!9682) (_1!496 lt!9685)) (Cell!215 (_2!496 lt!9685))))))

(assert (=> b!25001 (= lt!9682 (update!39 lt!9686 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1684 (v!1617 (underlying!118 thiss!938)))))))

(assert (=> b!25001 (= lt!9685 call!2228)))

(declare-fun b!25002 () Bool)

(assert (=> b!25002 (= e!16154 e!16152)))

(declare-fun b!25003 () Bool)

(assert (=> b!25003 (= e!16153 e!16150)))

(assert (=> b!25003 (= c!3428 (and (not lt!9684) (= (bvand (extraKeys!1657 (v!1617 (underlying!118 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!3622 res!15146) b!25000))

(assert (= (and b!25000 c!3429) b!25001))

(assert (= (and b!25000 (not c!3429)) b!25003))

(assert (= (and b!25003 c!3428) b!24999))

(assert (= (and b!25003 (not c!3428)) b!24995))

(assert (= (and b!24995 c!3427) b!24989))

(assert (= (and b!24995 (not c!3427)) b!24992))

(assert (= (or b!24999 b!24989) bm!2224))

(assert (= (or b!25001 bm!2224) bm!2225))

(assert (= (and b!25000 res!15147) b!24991))

(assert (= (and b!24991 res!15148) b!24990))

(assert (= (and b!24997 condMapEmpty!1036) mapIsEmpty!1036))

(assert (= (and b!24997 (not condMapEmpty!1036)) mapNonEmpty!1036))

(get-info :version)

(assert (= (and mapNonEmpty!1036 ((_ is ValueCellFull!314) mapValue!1036)) b!24994))

(assert (= (and b!24997 ((_ is ValueCellFull!314) mapDefault!1036)) b!24998))

(assert (= b!24993 b!24997))

(assert (= b!24996 b!24993))

(assert (= b!25002 b!24996))

(assert (= start!3622 b!25002))

(declare-fun m!20207 () Bool)

(assert (=> b!24993 m!20207))

(declare-fun m!20209 () Bool)

(assert (=> b!24993 m!20209))

(declare-fun m!20211 () Bool)

(assert (=> start!3622 m!20211))

(declare-fun m!20213 () Bool)

(assert (=> mapNonEmpty!1036 m!20213))

(declare-fun m!20215 () Bool)

(assert (=> b!25000 m!20215))

(assert (=> b!25000 m!20215))

(declare-fun m!20217 () Bool)

(assert (=> b!25000 m!20217))

(declare-fun m!20219 () Bool)

(assert (=> bm!2225 m!20219))

(declare-fun m!20221 () Bool)

(assert (=> b!24991 m!20221))

(declare-fun m!20223 () Bool)

(assert (=> b!25001 m!20223))

(check-sat (not b!24993) (not bm!2225) (not b_next!763) (not start!3622) (not b!25001) (not b!25000) (not mapNonEmpty!1036) b_and!1551 tp_is_empty!1027 (not b!24991))
(check-sat b_and!1551 (not b_next!763))
(get-model)

(declare-fun b!25106 () Bool)

(declare-fun res!15171 () Bool)

(declare-fun e!16239 () Bool)

(assert (=> b!25106 (=> (not res!15171) (not e!16239))))

(declare-fun lt!9790 () LongMapFixedSize!214)

(assert (=> b!25106 (= res!15171 (= (mask!4763 lt!9790) (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938))))))))

(declare-fun b!25107 () Bool)

(declare-fun e!16240 () Bool)

(declare-datatypes ((tuple2!986 0))(
  ( (tuple2!987 (_1!501 (_ BitVec 64)) (_2!501 V!1195)) )
))
(declare-fun lt!9785 () tuple2!986)

(declare-fun lt!9773 () (_ BitVec 32))

(assert (=> b!25107 (= e!16240 (ite (= (_1!501 lt!9785) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!9773 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!9773 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun d!4743 () Bool)

(assert (=> d!4743 e!16239))

(declare-fun res!15172 () Bool)

(assert (=> d!4743 (=> (not res!15172) (not e!16239))))

(declare-fun valid!118 (LongMapFixedSize!214) Bool)

(assert (=> d!4743 (= res!15172 (valid!118 lt!9790))))

(declare-fun lt!9786 () LongMapFixedSize!214)

(assert (=> d!4743 (= lt!9790 lt!9786)))

(declare-datatypes ((Unit!600 0))(
  ( (Unit!601) )
))
(declare-fun lt!9777 () Unit!600)

(declare-fun e!16238 () Unit!600)

(assert (=> d!4743 (= lt!9777 e!16238)))

(declare-fun c!3453 () Bool)

(declare-datatypes ((List!567 0))(
  ( (Nil!564) (Cons!563 (h!1130 tuple2!986) (t!3245 List!567)) )
))
(declare-datatypes ((ListLongMap!567 0))(
  ( (ListLongMap!568 (toList!299 List!567)) )
))
(declare-fun map!411 (LongMapFixedSize!214) ListLongMap!567)

(assert (=> d!4743 (= c!3453 (not (= (map!411 lt!9786) (ListLongMap!568 Nil!564))))))

(declare-fun lt!9784 () Unit!600)

(declare-fun lt!9778 () Unit!600)

(assert (=> d!4743 (= lt!9784 lt!9778)))

(declare-fun lt!9789 () array!1275)

(declare-fun lt!9791 () (_ BitVec 32))

(declare-datatypes ((List!568 0))(
  ( (Nil!565) (Cons!564 (h!1131 (_ BitVec 64)) (t!3246 List!568)) )
))
(declare-fun lt!9779 () List!568)

(declare-fun arrayNoDuplicates!0 (array!1275 (_ BitVec 32) List!568) Bool)

(assert (=> d!4743 (arrayNoDuplicates!0 lt!9789 lt!9791 lt!9779)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1275 (_ BitVec 32) (_ BitVec 32) List!568) Unit!600)

(assert (=> d!4743 (= lt!9778 (lemmaArrayNoDuplicatesInAll0Array!0 lt!9789 lt!9791 (bvadd (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))) #b00000000000000000000000000000001) lt!9779))))

(assert (=> d!4743 (= lt!9779 Nil!565)))

(assert (=> d!4743 (= lt!9791 #b00000000000000000000000000000000)))

(assert (=> d!4743 (= lt!9789 (array!1276 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!9781 () Unit!600)

(declare-fun lt!9782 () Unit!600)

(assert (=> d!4743 (= lt!9781 lt!9782)))

(declare-fun lt!9775 () (_ BitVec 32))

(declare-fun lt!9787 () array!1275)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1275 (_ BitVec 32)) Bool)

(assert (=> d!4743 (arrayForallSeekEntryOrOpenFound!0 lt!9775 lt!9787 (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1275 (_ BitVec 32) (_ BitVec 32)) Unit!600)

(assert (=> d!4743 (= lt!9782 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!9787 (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))) lt!9775))))

(assert (=> d!4743 (= lt!9775 #b00000000000000000000000000000000)))

(assert (=> d!4743 (= lt!9787 (array!1276 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!9774 () Unit!600)

(declare-fun lt!9772 () Unit!600)

(assert (=> d!4743 (= lt!9774 lt!9772)))

(declare-fun lt!9776 () array!1275)

(declare-fun lt!9788 () (_ BitVec 32))

(declare-fun lt!9783 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1275 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!4743 (= (arrayCountValidKeys!0 lt!9776 lt!9788 lt!9783) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1275 (_ BitVec 32) (_ BitVec 32)) Unit!600)

(assert (=> d!4743 (= lt!9772 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!9776 lt!9788 lt!9783))))

(assert (=> d!4743 (= lt!9783 (bvadd (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!4743 (= lt!9788 #b00000000000000000000000000000000)))

(assert (=> d!4743 (= lt!9776 (array!1276 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!144 (Int (_ BitVec 64)) V!1195)

(assert (=> d!4743 (= lt!9786 (LongMapFixedSize!215 (defaultEntry!1764 (v!1617 (underlying!118 thiss!938))) (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!144 (defaultEntry!1764 (v!1617 (underlying!118 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!144 (defaultEntry!1764 (v!1617 (underlying!118 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1276 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))) #b00000000000000000000000000000001)) (array!1278 ((as const (Array (_ BitVec 32) ValueCell!314)) EmptyCell!314) (bvadd (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!4743 (validMask!0 (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))))))

(assert (=> d!4743 (= (getNewLongMapFixedSize!35 (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))) (defaultEntry!1764 (v!1617 (underlying!118 thiss!938)))) lt!9790)))

(declare-fun b!25108 () Bool)

(declare-fun lt!9771 () array!1275)

(declare-fun arrayContainsKey!0 (array!1275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!25108 (= e!16240 (arrayContainsKey!0 lt!9771 (_1!501 lt!9785) #b00000000000000000000000000000000))))

(declare-fun b!25109 () Bool)

(declare-fun Unit!602 () Unit!600)

(assert (=> b!25109 (= e!16238 Unit!602)))

(declare-fun b!25110 () Bool)

(assert (=> b!25110 (= e!16239 (= (map!411 lt!9790) (ListLongMap!568 Nil!564)))))

(declare-fun b!25111 () Bool)

(declare-fun Unit!603 () Unit!600)

(assert (=> b!25111 (= e!16238 Unit!603)))

(declare-fun head!831 (List!567) tuple2!986)

(assert (=> b!25111 (= lt!9785 (head!831 (toList!299 (map!411 lt!9786))))))

(assert (=> b!25111 (= lt!9771 (array!1276 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!25111 (= lt!9773 #b00000000000000000000000000000000)))

(declare-fun lt!9770 () Unit!600)

(declare-fun lemmaKeyInListMapIsInArray!98 (array!1275 array!1277 (_ BitVec 32) (_ BitVec 32) V!1195 V!1195 (_ BitVec 64) Int) Unit!600)

(assert (=> b!25111 (= lt!9770 (lemmaKeyInListMapIsInArray!98 lt!9771 (array!1278 ((as const (Array (_ BitVec 32) ValueCell!314)) EmptyCell!314) (bvadd (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))) lt!9773 (dynLambda!144 (defaultEntry!1764 (v!1617 (underlying!118 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!144 (defaultEntry!1764 (v!1617 (underlying!118 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!501 lt!9785) (defaultEntry!1764 (v!1617 (underlying!118 thiss!938)))))))

(declare-fun c!3452 () Bool)

(assert (=> b!25111 (= c!3452 (and (not (= (_1!501 lt!9785) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!501 lt!9785) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!25111 e!16240))

(declare-fun lt!9780 () Unit!600)

(assert (=> b!25111 (= lt!9780 lt!9770)))

(declare-fun lt!9792 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1275 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!25111 (= lt!9792 (arrayScanForKey!0 (array!1276 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))) #b00000000000000000000000000000001)) (_1!501 lt!9785) #b00000000000000000000000000000000))))

(assert (=> b!25111 false))

(assert (= (and d!4743 c!3453) b!25111))

(assert (= (and d!4743 (not c!3453)) b!25109))

(assert (= (and b!25111 c!3452) b!25108))

(assert (= (and b!25111 (not c!3452)) b!25107))

(assert (= (and d!4743 res!15172) b!25106))

(assert (= (and b!25106 res!15171) b!25110))

(declare-fun b_lambda!1651 () Bool)

(assert (=> (not b_lambda!1651) (not d!4743)))

(declare-fun t!3244 () Bool)

(declare-fun tb!665 () Bool)

(assert (=> (and b!24993 (= (defaultEntry!1764 (v!1617 (underlying!118 thiss!938))) (defaultEntry!1764 (v!1617 (underlying!118 thiss!938)))) t!3244) tb!665))

(declare-fun result!1105 () Bool)

(assert (=> tb!665 (= result!1105 tp_is_empty!1027)))

(assert (=> d!4743 t!3244))

(declare-fun b_and!1557 () Bool)

(assert (= b_and!1551 (and (=> t!3244 result!1105) b_and!1557)))

(declare-fun b_lambda!1653 () Bool)

(assert (=> (not b_lambda!1653) (not b!25111)))

(assert (=> b!25111 t!3244))

(declare-fun b_and!1559 () Bool)

(assert (= b_and!1557 (and (=> t!3244 result!1105) b_and!1559)))

(declare-fun m!20261 () Bool)

(assert (=> d!4743 m!20261))

(declare-fun m!20263 () Bool)

(assert (=> d!4743 m!20263))

(declare-fun m!20265 () Bool)

(assert (=> d!4743 m!20265))

(assert (=> d!4743 m!20215))

(declare-fun m!20267 () Bool)

(assert (=> d!4743 m!20267))

(declare-fun m!20269 () Bool)

(assert (=> d!4743 m!20269))

(declare-fun m!20271 () Bool)

(assert (=> d!4743 m!20271))

(assert (=> d!4743 m!20215))

(declare-fun m!20273 () Bool)

(assert (=> d!4743 m!20273))

(declare-fun m!20275 () Bool)

(assert (=> d!4743 m!20275))

(declare-fun m!20277 () Bool)

(assert (=> d!4743 m!20277))

(assert (=> d!4743 m!20215))

(declare-fun m!20279 () Bool)

(assert (=> d!4743 m!20279))

(declare-fun m!20281 () Bool)

(assert (=> b!25108 m!20281))

(declare-fun m!20283 () Bool)

(assert (=> b!25110 m!20283))

(assert (=> b!25111 m!20269))

(assert (=> b!25111 m!20277))

(assert (=> b!25111 m!20215))

(assert (=> b!25111 m!20277))

(assert (=> b!25111 m!20277))

(declare-fun m!20285 () Bool)

(assert (=> b!25111 m!20285))

(declare-fun m!20287 () Bool)

(assert (=> b!25111 m!20287))

(declare-fun m!20289 () Bool)

(assert (=> b!25111 m!20289))

(assert (=> b!25000 d!4743))

(declare-fun d!4745 () Bool)

(declare-fun e!16245 () Bool)

(assert (=> d!4745 e!16245))

(declare-fun res!15175 () Bool)

(assert (=> d!4745 (=> (not res!15175) (not e!16245))))

(declare-fun lt!9797 () (_ BitVec 32))

(assert (=> d!4745 (= res!15175 (validMask!0 lt!9797))))

(declare-datatypes ((tuple2!988 0))(
  ( (tuple2!989 (_1!502 Unit!600) (_2!502 (_ BitVec 32))) )
))
(declare-fun e!16246 () tuple2!988)

(assert (=> d!4745 (= lt!9797 (_2!502 e!16246))))

(declare-fun c!3456 () Bool)

(declare-fun lt!9798 () tuple2!988)

(assert (=> d!4745 (= c!3456 (and (bvsgt (_2!502 lt!9798) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!154 (v!1617 (underlying!118 thiss!938)))) (_2!502 lt!9798)) (bvsge (bvadd (bvand (bvashr (_2!502 lt!9798) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!154 (v!1617 (underlying!118 thiss!938))))))))

(declare-fun Unit!604 () Unit!600)

(declare-fun Unit!605 () Unit!600)

(assert (=> d!4745 (= lt!9798 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!154 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))))) (mask!4763 (v!1617 (underlying!118 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!154 (v!1617 (underlying!118 thiss!938)))) (mask!4763 (v!1617 (underlying!118 thiss!938))))) (tuple2!989 Unit!604 (bvand (bvadd (bvshl (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!989 Unit!605 (mask!4763 (v!1617 (underlying!118 thiss!938))))))))

(assert (=> d!4745 (validMask!0 (mask!4763 (v!1617 (underlying!118 thiss!938))))))

(assert (=> d!4745 (= (computeNewMask!32 thiss!938 (mask!4763 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (_size!154 (v!1617 (underlying!118 thiss!938)))) lt!9797)))

(declare-fun b!25120 () Bool)

(declare-fun computeNewMaskWhile!15 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!988)

(assert (=> b!25120 (= e!16246 (computeNewMaskWhile!15 (_size!154 (v!1617 (underlying!118 thiss!938))) (_vacant!154 (v!1617 (underlying!118 thiss!938))) (mask!4763 (v!1617 (underlying!118 thiss!938))) (_2!502 lt!9798)))))

(declare-fun b!25121 () Bool)

(declare-fun Unit!606 () Unit!600)

(assert (=> b!25121 (= e!16246 (tuple2!989 Unit!606 (_2!502 lt!9798)))))

(declare-fun b!25122 () Bool)

(assert (=> b!25122 (= e!16245 (bvsle (_size!154 (v!1617 (underlying!118 thiss!938))) (bvadd lt!9797 #b00000000000000000000000000000001)))))

(assert (= (and d!4745 c!3456) b!25120))

(assert (= (and d!4745 (not c!3456)) b!25121))

(assert (= (and d!4745 res!15175) b!25122))

(declare-fun m!20291 () Bool)

(assert (=> d!4745 m!20291))

(assert (=> d!4745 m!20221))

(declare-fun m!20293 () Bool)

(assert (=> b!25120 m!20293))

(assert (=> b!25000 d!4745))

(declare-fun d!4747 () Bool)

(assert (=> d!4747 (= (validMask!0 (mask!4763 (v!1617 (underlying!118 thiss!938)))) (and (or (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000000000000000000111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000000000000000001111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000000000000000011111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000000000000000111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000000000000001111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000000000000011111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000000000000111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000000000001111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000000000011111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000000000111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000000001111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000000011111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000000111111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000001111111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000011111111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000000111111111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000001111111111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000011111111111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000000111111111111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000001111111111111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000011111111111111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000000111111111111111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000001111111111111111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000011111111111111111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00000111111111111111111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00001111111111111111111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00011111111111111111111111111111) (= (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4763 (v!1617 (underlying!118 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!24991 d!4747))

(declare-fun d!4749 () Bool)

(assert (=> d!4749 (= (array_inv!423 (_keys!3190 (v!1617 (underlying!118 thiss!938)))) (bvsge (size!703 (_keys!3190 (v!1617 (underlying!118 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!24993 d!4749))

(declare-fun d!4751 () Bool)

(assert (=> d!4751 (= (array_inv!424 (_values!1749 (v!1617 (underlying!118 thiss!938)))) (bvsge (size!704 (_values!1749 (v!1617 (underlying!118 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!24993 d!4751))

(declare-fun d!4753 () Bool)

(assert (=> d!4753 (= (valid!117 thiss!938) (valid!118 (v!1617 (underlying!118 thiss!938))))))

(declare-fun bs!1048 () Bool)

(assert (= bs!1048 d!4753))

(declare-fun m!20295 () Bool)

(assert (=> bs!1048 m!20295))

(assert (=> start!3622 d!4753))

(declare-fun bm!2286 () Bool)

(declare-fun call!2308 () Bool)

(declare-fun call!2312 () Bool)

(assert (=> bm!2286 (= call!2308 call!2312)))

(declare-fun b!25207 () Bool)

(declare-fun res!15207 () Bool)

(declare-fun e!16309 () Bool)

(assert (=> b!25207 (=> (not res!15207) (not e!16309))))

(declare-datatypes ((SeekEntryResult!56 0))(
  ( (MissingZero!56 (index!2346 (_ BitVec 32))) (Found!56 (index!2347 (_ BitVec 32))) (Intermediate!56 (undefined!868 Bool) (index!2348 (_ BitVec 32)) (x!5910 (_ BitVec 32))) (Undefined!56) (MissingVacant!56 (index!2349 (_ BitVec 32))) )
))
(declare-fun lt!9866 () SeekEntryResult!56)

(assert (=> b!25207 (= res!15207 (= (select (arr!602 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686))) (index!2346 lt!9866)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2287 () Bool)

(declare-fun call!2305 () SeekEntryResult!56)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1275 (_ BitVec 32)) SeekEntryResult!56)

(assert (=> bm!2287 (= call!2305 (seekEntryOrOpen!0 (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686)) (mask!4763 (ite c!3429 (_2!496 lt!9682) lt!9686))))))

(declare-fun b!25208 () Bool)

(declare-fun e!16291 () Bool)

(declare-fun lt!9877 () SeekEntryResult!56)

(assert (=> b!25208 (= e!16291 ((_ is Undefined!56) lt!9877))))

(declare-fun b!25209 () Bool)

(declare-fun e!16307 () Unit!600)

(declare-fun lt!9856 () Unit!600)

(assert (=> b!25209 (= e!16307 lt!9856)))

(declare-fun call!2300 () Unit!600)

(assert (=> b!25209 (= lt!9856 call!2300)))

(declare-fun call!2311 () SeekEntryResult!56)

(assert (=> b!25209 (= lt!9866 call!2311)))

(declare-fun c!3493 () Bool)

(assert (=> b!25209 (= c!3493 ((_ is MissingZero!56) lt!9866))))

(declare-fun e!16297 () Bool)

(assert (=> b!25209 e!16297))

(declare-fun b!25210 () Bool)

(declare-fun e!16304 () Bool)

(declare-fun call!2310 () Bool)

(assert (=> b!25210 (= e!16304 (not call!2310))))

(declare-fun b!25211 () Bool)

(declare-fun res!15217 () Bool)

(declare-fun e!16311 () Bool)

(assert (=> b!25211 (=> (not res!15217) (not e!16311))))

(assert (=> b!25211 (= res!15217 (= (select (arr!602 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686))) (index!2346 lt!9877)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2288 () Bool)

(declare-fun call!2295 () ListLongMap!567)

(assert (=> bm!2288 (= call!2295 (map!411 (ite c!3429 (_2!496 lt!9682) lt!9686)))))

(declare-fun call!2301 () Unit!600)

(declare-fun bm!2289 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!11 (array!1275 array!1277 (_ BitVec 32) (_ BitVec 32) V!1195 V!1195 (_ BitVec 64) Int) Unit!600)

(assert (=> bm!2289 (= call!2301 (lemmaInListMapThenSeekEntryOrOpenFindsIt!11 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686)) (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686)) (mask!4763 (ite c!3429 (_2!496 lt!9682) lt!9686)) (extraKeys!1657 (ite c!3429 (_2!496 lt!9682) lt!9686)) (zeroValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (minValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1764 (ite c!3429 (_2!496 lt!9682) lt!9686))))))

(declare-fun b!25212 () Bool)

(declare-fun res!15211 () Bool)

(assert (=> b!25212 (= res!15211 (= (select (arr!602 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686))) (index!2349 lt!9866)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!16312 () Bool)

(assert (=> b!25212 (=> (not res!15211) (not e!16312))))

(declare-fun b!25213 () Bool)

(declare-fun e!16303 () tuple2!976)

(declare-fun e!16306 () tuple2!976)

(assert (=> b!25213 (= e!16303 e!16306)))

(declare-fun c!3497 () Bool)

(assert (=> b!25213 (= c!3497 (= (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25214 () Bool)

(declare-fun e!16301 () tuple2!976)

(assert (=> b!25214 (= e!16303 e!16301)))

(declare-fun lt!9864 () SeekEntryResult!56)

(assert (=> b!25214 (= lt!9864 (seekEntryOrOpen!0 (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686)) (mask!4763 (ite c!3429 (_2!496 lt!9682) lt!9686))))))

(declare-fun c!3496 () Bool)

(assert (=> b!25214 (= c!3496 ((_ is Undefined!56) lt!9864))))

(declare-fun d!4755 () Bool)

(declare-fun e!16294 () Bool)

(assert (=> d!4755 e!16294))

(declare-fun res!15206 () Bool)

(assert (=> d!4755 (=> (not res!15206) (not e!16294))))

(declare-fun lt!9857 () tuple2!976)

(assert (=> d!4755 (= res!15206 (valid!118 (_2!496 lt!9857)))))

(assert (=> d!4755 (= lt!9857 e!16303)))

(declare-fun c!3491 () Bool)

(assert (=> d!4755 (= c!3491 (= (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!4755 (valid!118 (ite c!3429 (_2!496 lt!9682) lt!9686))))

(assert (=> d!4755 (= (update!39 (ite c!3429 (_2!496 lt!9682) lt!9686) (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938)))))) lt!9857)))

(declare-fun e!16292 () Bool)

(declare-fun lt!9861 () SeekEntryResult!56)

(declare-fun b!25215 () Bool)

(assert (=> b!25215 (= e!16292 (= (select (arr!602 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686))) (index!2347 lt!9861)) (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!25216 () Bool)

(declare-fun call!2307 () Bool)

(assert (=> b!25216 (= e!16309 (not call!2307))))

(declare-fun bm!2290 () Bool)

(declare-fun call!2309 () ListLongMap!567)

(declare-fun call!2289 () ListLongMap!567)

(assert (=> bm!2290 (= call!2309 call!2289)))

(declare-fun bm!2291 () Bool)

(declare-fun call!2292 () tuple2!976)

(declare-fun c!3498 () Bool)

(declare-fun updateHelperNewKey!11 (LongMapFixedSize!214 (_ BitVec 64) V!1195 (_ BitVec 32)) tuple2!976)

(assert (=> bm!2291 (= call!2292 (updateHelperNewKey!11 (ite c!3429 (_2!496 lt!9682) lt!9686) (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938))))) (ite c!3498 (index!2349 lt!9864) (index!2346 lt!9864))))))

(declare-fun bm!2292 () Bool)

(declare-fun e!16295 () ListLongMap!567)

(declare-fun call!2290 () ListLongMap!567)

(declare-fun +!46 (ListLongMap!567 tuple2!986) ListLongMap!567)

(assert (=> bm!2292 (= call!2290 (+!46 e!16295 (ite c!3491 (ite c!3497 (tuple2!987 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938)))))) (tuple2!987 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938))))))) (tuple2!987 (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938)))))))))))

(declare-fun c!3495 () Bool)

(assert (=> bm!2292 (= c!3495 c!3491)))

(declare-fun call!2299 () ListLongMap!567)

(declare-fun lt!9878 () array!1277)

(declare-fun bm!2293 () Bool)

(declare-fun lt!9874 () (_ BitVec 32))

(declare-fun getCurrentListMap!130 (array!1275 array!1277 (_ BitVec 32) (_ BitVec 32) V!1195 V!1195 (_ BitVec 32) Int) ListLongMap!567)

(assert (=> bm!2293 (= call!2299 (getCurrentListMap!130 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686)) (ite c!3491 (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686)) lt!9878) (mask!4763 (ite c!3429 (_2!496 lt!9682) lt!9686)) (ite (and c!3491 c!3497) lt!9874 (extraKeys!1657 (ite c!3429 (_2!496 lt!9682) lt!9686))) (ite (and c!3491 c!3497) (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938))))) (zeroValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686))) (minValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) #b00000000000000000000000000000000 (defaultEntry!1764 (ite c!3429 (_2!496 lt!9682) lt!9686))))))

(declare-fun b!25217 () Bool)

(declare-fun lt!9876 () tuple2!976)

(assert (=> b!25217 (= lt!9876 call!2292)))

(declare-fun e!16308 () tuple2!976)

(assert (=> b!25217 (= e!16308 (tuple2!977 (_1!496 lt!9876) (_2!496 lt!9876)))))

(declare-fun b!25218 () Bool)

(declare-fun c!3494 () Bool)

(assert (=> b!25218 (= c!3494 ((_ is MissingVacant!56) lt!9866))))

(declare-fun e!16298 () Bool)

(assert (=> b!25218 (= e!16297 e!16298)))

(declare-fun b!25219 () Bool)

(declare-fun e!16299 () Unit!600)

(declare-fun lt!9855 () Unit!600)

(assert (=> b!25219 (= e!16299 lt!9855)))

(assert (=> b!25219 (= lt!9855 call!2301)))

(declare-fun lt!9862 () SeekEntryResult!56)

(declare-fun call!2298 () SeekEntryResult!56)

(assert (=> b!25219 (= lt!9862 call!2298)))

(declare-fun res!15209 () Bool)

(assert (=> b!25219 (= res!15209 ((_ is Found!56) lt!9862))))

(declare-fun e!16296 () Bool)

(assert (=> b!25219 (=> (not res!15209) (not e!16296))))

(assert (=> b!25219 e!16296))

(declare-fun b!25220 () Bool)

(declare-fun e!16310 () Bool)

(declare-fun call!2294 () ListLongMap!567)

(assert (=> b!25220 (= e!16310 (= call!2294 call!2295))))

(declare-fun bm!2294 () Bool)

(declare-fun call!2291 () ListLongMap!567)

(assert (=> bm!2294 (= call!2291 call!2290)))

(declare-fun b!25221 () Bool)

(declare-fun res!15205 () Bool)

(assert (=> b!25221 (=> (not res!15205) (not e!16309))))

(declare-fun call!2296 () Bool)

(assert (=> b!25221 (= res!15205 call!2296)))

(assert (=> b!25221 (= e!16297 e!16309)))

(declare-fun b!25222 () Bool)

(declare-fun lt!9879 () Unit!600)

(declare-fun lt!9870 () Unit!600)

(assert (=> b!25222 (= lt!9879 lt!9870)))

(declare-fun call!2302 () Bool)

(assert (=> b!25222 call!2302))

(declare-fun lemmaValidKeyInArrayIsInListMap!11 (array!1275 array!1277 (_ BitVec 32) (_ BitVec 32) V!1195 V!1195 (_ BitVec 32) Int) Unit!600)

(assert (=> b!25222 (= lt!9870 (lemmaValidKeyInArrayIsInListMap!11 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686)) lt!9878 (mask!4763 (ite c!3429 (_2!496 lt!9682) lt!9686)) (extraKeys!1657 (ite c!3429 (_2!496 lt!9682) lt!9686)) (zeroValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (minValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (index!2347 lt!9864) (defaultEntry!1764 (ite c!3429 (_2!496 lt!9682) lt!9686))))))

(assert (=> b!25222 (= lt!9878 (array!1278 (store (arr!603 (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686))) (index!2347 lt!9864) (ValueCellFull!314 (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938))))))) (size!704 (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686)))))))

(declare-fun lt!9869 () Unit!600)

(declare-fun lt!9868 () Unit!600)

(assert (=> b!25222 (= lt!9869 lt!9868)))

(declare-fun call!2306 () ListLongMap!567)

(assert (=> b!25222 (= call!2290 call!2306)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!11 (array!1275 array!1277 (_ BitVec 32) (_ BitVec 32) V!1195 V!1195 (_ BitVec 32) (_ BitVec 64) V!1195 Int) Unit!600)

(assert (=> b!25222 (= lt!9868 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!11 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686)) (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686)) (mask!4763 (ite c!3429 (_2!496 lt!9682) lt!9686)) (extraKeys!1657 (ite c!3429 (_2!496 lt!9682) lt!9686)) (zeroValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (minValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (index!2347 lt!9864) (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938))))) (defaultEntry!1764 (ite c!3429 (_2!496 lt!9682) lt!9686))))))

(declare-fun lt!9871 () Unit!600)

(assert (=> b!25222 (= lt!9871 e!16299)))

(declare-fun c!3486 () Bool)

(declare-fun contains!233 (ListLongMap!567 (_ BitVec 64)) Bool)

(assert (=> b!25222 (= c!3486 (contains!233 (getCurrentListMap!130 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686)) (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686)) (mask!4763 (ite c!3429 (_2!496 lt!9682) lt!9686)) (extraKeys!1657 (ite c!3429 (_2!496 lt!9682) lt!9686)) (zeroValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (minValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) #b00000000000000000000000000000000 (defaultEntry!1764 (ite c!3429 (_2!496 lt!9682) lt!9686))) (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!25222 (= e!16308 (tuple2!977 true (LongMapFixedSize!215 (defaultEntry!1764 (ite c!3429 (_2!496 lt!9682) lt!9686)) (mask!4763 (ite c!3429 (_2!496 lt!9682) lt!9686)) (extraKeys!1657 (ite c!3429 (_2!496 lt!9682) lt!9686)) (zeroValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (minValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (_size!154 (ite c!3429 (_2!496 lt!9682) lt!9686)) (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686)) (array!1278 (store (arr!603 (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686))) (index!2347 lt!9864) (ValueCellFull!314 (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938))))))) (size!704 (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686)))) (_vacant!154 (ite c!3429 (_2!496 lt!9682) lt!9686)))))))

(declare-fun call!2304 () Bool)

(declare-fun bm!2295 () Bool)

(assert (=> bm!2295 (= call!2304 (arrayContainsKey!0 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686)) (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun b!25223 () Bool)

(declare-fun lt!9863 () Unit!600)

(assert (=> b!25223 (= lt!9863 e!16307)))

(declare-fun c!3490 () Bool)

(assert (=> b!25223 (= c!3490 call!2302)))

(assert (=> b!25223 (= e!16301 (tuple2!977 false (ite c!3429 (_2!496 lt!9682) lt!9686)))))

(declare-fun b!25224 () Bool)

(declare-fun lt!9853 () Unit!600)

(declare-fun lt!9860 () Unit!600)

(assert (=> b!25224 (= lt!9853 lt!9860)))

(declare-fun call!2297 () ListLongMap!567)

(assert (=> b!25224 (= call!2291 call!2297)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!11 (array!1275 array!1277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1195 V!1195 V!1195 Int) Unit!600)

(assert (=> b!25224 (= lt!9860 (lemmaChangeZeroKeyThenAddPairToListMap!11 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686)) (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686)) (mask!4763 (ite c!3429 (_2!496 lt!9682) lt!9686)) (extraKeys!1657 (ite c!3429 (_2!496 lt!9682) lt!9686)) lt!9874 (zeroValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938))))) (minValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (defaultEntry!1764 (ite c!3429 (_2!496 lt!9682) lt!9686))))))

(assert (=> b!25224 (= lt!9874 (bvor (extraKeys!1657 (ite c!3429 (_2!496 lt!9682) lt!9686)) #b00000000000000000000000000000001))))

(assert (=> b!25224 (= e!16306 (tuple2!977 true (LongMapFixedSize!215 (defaultEntry!1764 (ite c!3429 (_2!496 lt!9682) lt!9686)) (mask!4763 (ite c!3429 (_2!496 lt!9682) lt!9686)) (bvor (extraKeys!1657 (ite c!3429 (_2!496 lt!9682) lt!9686)) #b00000000000000000000000000000001) (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938))))) (minValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (_size!154 (ite c!3429 (_2!496 lt!9682) lt!9686)) (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686)) (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686)) (_vacant!154 (ite c!3429 (_2!496 lt!9682) lt!9686)))))))

(declare-fun b!25225 () Bool)

(assert (=> b!25225 (= e!16311 (not call!2310))))

(declare-fun bm!2296 () Bool)

(declare-fun c!3487 () Bool)

(assert (=> bm!2296 (= c!3487 c!3496)))

(declare-fun e!16293 () ListLongMap!567)

(assert (=> bm!2296 (= call!2302 (contains!233 e!16293 (ite c!3496 (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (select (arr!602 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686))) (index!2347 lt!9864)))))))

(declare-fun lt!9872 () (_ BitVec 32))

(declare-fun bm!2297 () Bool)

(assert (=> bm!2297 (= call!2289 (getCurrentListMap!130 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686)) (ite (or c!3491 c!3496) (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686)) (array!1278 (store (arr!603 (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686))) (index!2347 lt!9864) (ValueCellFull!314 (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938))))))) (size!704 (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686))))) (mask!4763 (ite c!3429 (_2!496 lt!9682) lt!9686)) (ite c!3491 (ite c!3497 (extraKeys!1657 (ite c!3429 (_2!496 lt!9682) lt!9686)) lt!9872) (extraKeys!1657 (ite c!3429 (_2!496 lt!9682) lt!9686))) (zeroValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (ite c!3491 (ite c!3497 (minValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938)))))) (minValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686))) #b00000000000000000000000000000000 (defaultEntry!1764 (ite c!3429 (_2!496 lt!9682) lt!9686))))))

(declare-fun b!25226 () Bool)

(declare-fun Unit!607 () Unit!600)

(assert (=> b!25226 (= e!16299 Unit!607)))

(declare-fun lt!9873 () Unit!600)

(assert (=> b!25226 (= lt!9873 call!2300)))

(assert (=> b!25226 (= lt!9877 call!2298)))

(declare-fun c!3489 () Bool)

(assert (=> b!25226 (= c!3489 ((_ is MissingZero!56) lt!9877))))

(declare-fun e!16305 () Bool)

(assert (=> b!25226 e!16305))

(declare-fun lt!9875 () Unit!600)

(assert (=> b!25226 (= lt!9875 lt!9873)))

(assert (=> b!25226 false))

(declare-fun b!25227 () Bool)

(declare-fun e!16302 () tuple2!976)

(assert (=> b!25227 (= e!16302 e!16308)))

(declare-fun c!3488 () Bool)

(assert (=> b!25227 (= c!3488 ((_ is MissingZero!56) lt!9864))))

(declare-fun b!25228 () Bool)

(declare-fun lt!9865 () Unit!600)

(declare-fun lt!9854 () Unit!600)

(assert (=> b!25228 (= lt!9865 lt!9854)))

(assert (=> b!25228 (= call!2291 call!2309)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!11 (array!1275 array!1277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1195 V!1195 V!1195 Int) Unit!600)

(assert (=> b!25228 (= lt!9854 (lemmaChangeLongMinValueKeyThenAddPairToListMap!11 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686)) (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686)) (mask!4763 (ite c!3429 (_2!496 lt!9682) lt!9686)) (extraKeys!1657 (ite c!3429 (_2!496 lt!9682) lt!9686)) lt!9872 (zeroValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (minValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938))))) (defaultEntry!1764 (ite c!3429 (_2!496 lt!9682) lt!9686))))))

(assert (=> b!25228 (= lt!9872 (bvor (extraKeys!1657 (ite c!3429 (_2!496 lt!9682) lt!9686)) #b00000000000000000000000000000010))))

(assert (=> b!25228 (= e!16306 (tuple2!977 true (LongMapFixedSize!215 (defaultEntry!1764 (ite c!3429 (_2!496 lt!9682) lt!9686)) (mask!4763 (ite c!3429 (_2!496 lt!9682) lt!9686)) (bvor (extraKeys!1657 (ite c!3429 (_2!496 lt!9682) lt!9686)) #b00000000000000000000000000000010) (zeroValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938))))) (_size!154 (ite c!3429 (_2!496 lt!9682) lt!9686)) (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686)) (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686)) (_vacant!154 (ite c!3429 (_2!496 lt!9682) lt!9686)))))))

(declare-fun bm!2298 () Bool)

(assert (=> bm!2298 (= call!2307 call!2304)))

(declare-fun b!25229 () Bool)

(assert (=> b!25229 (= c!3498 ((_ is MissingVacant!56) lt!9864))))

(assert (=> b!25229 (= e!16301 e!16302)))

(declare-fun b!25230 () Bool)

(declare-fun c!3492 () Bool)

(assert (=> b!25230 (= c!3492 ((_ is MissingVacant!56) lt!9877))))

(assert (=> b!25230 (= e!16305 e!16291)))

(declare-fun bm!2299 () Bool)

(assert (=> bm!2299 (= call!2298 call!2305)))

(declare-fun b!25231 () Bool)

(declare-fun Unit!608 () Unit!600)

(assert (=> b!25231 (= e!16307 Unit!608)))

(declare-fun lt!9858 () Unit!600)

(assert (=> b!25231 (= lt!9858 call!2301)))

(assert (=> b!25231 (= lt!9861 call!2311)))

(declare-fun res!15212 () Bool)

(assert (=> b!25231 (= res!15212 ((_ is Found!56) lt!9861))))

(assert (=> b!25231 (=> (not res!15212) (not e!16292))))

(assert (=> b!25231 e!16292))

(declare-fun lt!9867 () Unit!600)

(assert (=> b!25231 (= lt!9867 lt!9858)))

(assert (=> b!25231 false))

(declare-fun bm!2300 () Bool)

(assert (=> bm!2300 (= call!2311 call!2305)))

(declare-fun bm!2301 () Bool)

(assert (=> bm!2301 (= call!2296 call!2308)))

(declare-fun bm!2302 () Bool)

(assert (=> bm!2302 (= call!2306 call!2289)))

(declare-fun b!25232 () Bool)

(assert (=> b!25232 (= e!16293 call!2306)))

(declare-fun b!25233 () Bool)

(declare-fun e!16300 () Bool)

(assert (=> b!25233 (= e!16310 e!16300)))

(declare-fun res!15204 () Bool)

(assert (=> b!25233 (= res!15204 (contains!233 call!2294 (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!25233 (=> (not res!15204) (not e!16300))))

(declare-fun b!25234 () Bool)

(assert (=> b!25234 (= e!16291 e!16304)))

(declare-fun res!15215 () Bool)

(declare-fun call!2293 () Bool)

(assert (=> b!25234 (= res!15215 call!2293)))

(assert (=> b!25234 (=> (not res!15215) (not e!16304))))

(declare-fun b!25235 () Bool)

(declare-fun res!15216 () Bool)

(assert (=> b!25235 (= res!15216 call!2308)))

(assert (=> b!25235 (=> (not res!15216) (not e!16292))))

(declare-fun b!25236 () Bool)

(declare-fun res!15210 () Bool)

(assert (=> b!25236 (=> (not res!15210) (not e!16311))))

(assert (=> b!25236 (= res!15210 call!2293)))

(assert (=> b!25236 (= e!16305 e!16311)))

(declare-fun b!25237 () Bool)

(assert (=> b!25237 (= e!16296 (= (select (arr!602 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686))) (index!2347 lt!9862)) (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!25238 () Bool)

(assert (=> b!25238 (= e!16295 (getCurrentListMap!130 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686)) (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686)) (mask!4763 (ite c!3429 (_2!496 lt!9682) lt!9686)) (extraKeys!1657 (ite c!3429 (_2!496 lt!9682) lt!9686)) (zeroValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (minValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) #b00000000000000000000000000000000 (defaultEntry!1764 (ite c!3429 (_2!496 lt!9682) lt!9686))))))

(declare-fun bm!2303 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!11 (array!1275 array!1277 (_ BitVec 32) (_ BitVec 32) V!1195 V!1195 (_ BitVec 64) Int) Unit!600)

(assert (=> bm!2303 (= call!2300 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!11 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686)) (_values!1749 (ite c!3429 (_2!496 lt!9682) lt!9686)) (mask!4763 (ite c!3429 (_2!496 lt!9682) lt!9686)) (extraKeys!1657 (ite c!3429 (_2!496 lt!9682) lt!9686)) (zeroValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (minValue!1684 (ite c!3429 (_2!496 lt!9682) lt!9686)) (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1764 (ite c!3429 (_2!496 lt!9682) lt!9686))))))

(declare-fun b!25239 () Bool)

(declare-fun res!15208 () Bool)

(declare-fun call!2303 () Bool)

(assert (=> b!25239 (= res!15208 call!2303)))

(assert (=> b!25239 (=> (not res!15208) (not e!16296))))

(declare-fun bm!2304 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2304 (= call!2312 (inRange!0 (ite c!3496 (ite c!3490 (index!2347 lt!9861) (ite c!3493 (index!2346 lt!9866) (index!2349 lt!9866))) (ite c!3486 (index!2347 lt!9862) (ite c!3489 (index!2346 lt!9877) (index!2349 lt!9877)))) (mask!4763 (ite c!3429 (_2!496 lt!9682) lt!9686))))))

(declare-fun b!25240 () Bool)

(assert (=> b!25240 (= e!16312 (not call!2307))))

(declare-fun b!25241 () Bool)

(assert (=> b!25241 (= e!16300 (= call!2294 (+!46 call!2295 (tuple2!987 (ite c!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!3429 (minValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3428 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 (v!1617 (underlying!118 thiss!938)))))))))))

(declare-fun b!25242 () Bool)

(assert (=> b!25242 (= e!16293 call!2299)))

(declare-fun bm!2305 () Bool)

(assert (=> bm!2305 (= call!2293 call!2303)))

(declare-fun bm!2306 () Bool)

(assert (=> bm!2306 (= call!2303 call!2312)))

(declare-fun bm!2307 () Bool)

(assert (=> bm!2307 (= call!2294 (map!411 (_2!496 lt!9857)))))

(declare-fun b!25243 () Bool)

(assert (=> b!25243 (= e!16294 e!16310)))

(declare-fun c!3485 () Bool)

(assert (=> b!25243 (= c!3485 (_1!496 lt!9857))))

(declare-fun bm!2308 () Bool)

(assert (=> bm!2308 (= call!2310 call!2304)))

(declare-fun bm!2309 () Bool)

(assert (=> bm!2309 (= call!2297 call!2299)))

(declare-fun res!15213 () Bool)

(declare-fun b!25244 () Bool)

(assert (=> b!25244 (= res!15213 (= (select (arr!602 (_keys!3190 (ite c!3429 (_2!496 lt!9682) lt!9686))) (index!2349 lt!9877)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25244 (=> (not res!15213) (not e!16304))))

(declare-fun b!25245 () Bool)

(assert (=> b!25245 (= e!16295 (ite c!3497 call!2309 call!2297))))

(declare-fun b!25246 () Bool)

(declare-fun lt!9859 () tuple2!976)

(assert (=> b!25246 (= e!16302 (tuple2!977 (_1!496 lt!9859) (_2!496 lt!9859)))))

(assert (=> b!25246 (= lt!9859 call!2292)))

(declare-fun b!25247 () Bool)

(assert (=> b!25247 (= e!16298 e!16312)))

(declare-fun res!15214 () Bool)

(assert (=> b!25247 (= res!15214 call!2296)))

(assert (=> b!25247 (=> (not res!15214) (not e!16312))))

(declare-fun b!25248 () Bool)

(assert (=> b!25248 (= e!16298 ((_ is Undefined!56) lt!9866))))

(assert (= (and d!4755 c!3491) b!25213))

(assert (= (and d!4755 (not c!3491)) b!25214))

(assert (= (and b!25213 c!3497) b!25224))

(assert (= (and b!25213 (not c!3497)) b!25228))

(assert (= (or b!25224 b!25228) bm!2290))

(assert (= (or b!25224 b!25228) bm!2309))

(assert (= (or b!25224 b!25228) bm!2294))

(assert (= (and b!25214 c!3496) b!25223))

(assert (= (and b!25214 (not c!3496)) b!25229))

(assert (= (and b!25223 c!3490) b!25231))

(assert (= (and b!25223 (not c!3490)) b!25209))

(assert (= (and b!25231 res!15212) b!25235))

(assert (= (and b!25235 res!15216) b!25215))

(assert (= (and b!25209 c!3493) b!25221))

(assert (= (and b!25209 (not c!3493)) b!25218))

(assert (= (and b!25221 res!15205) b!25207))

(assert (= (and b!25207 res!15207) b!25216))

(assert (= (and b!25218 c!3494) b!25247))

(assert (= (and b!25218 (not c!3494)) b!25248))

(assert (= (and b!25247 res!15214) b!25212))

(assert (= (and b!25212 res!15211) b!25240))

(assert (= (or b!25221 b!25247) bm!2301))

(assert (= (or b!25216 b!25240) bm!2298))

(assert (= (or b!25235 bm!2301) bm!2286))

(assert (= (or b!25231 b!25209) bm!2300))

(assert (= (and b!25229 c!3498) b!25246))

(assert (= (and b!25229 (not c!3498)) b!25227))

(assert (= (and b!25227 c!3488) b!25217))

(assert (= (and b!25227 (not c!3488)) b!25222))

(assert (= (and b!25222 c!3486) b!25219))

(assert (= (and b!25222 (not c!3486)) b!25226))

(assert (= (and b!25219 res!15209) b!25239))

(assert (= (and b!25239 res!15208) b!25237))

(assert (= (and b!25226 c!3489) b!25236))

(assert (= (and b!25226 (not c!3489)) b!25230))

(assert (= (and b!25236 res!15210) b!25211))

(assert (= (and b!25211 res!15217) b!25225))

(assert (= (and b!25230 c!3492) b!25234))

(assert (= (and b!25230 (not c!3492)) b!25208))

(assert (= (and b!25234 res!15215) b!25244))

(assert (= (and b!25244 res!15213) b!25210))

(assert (= (or b!25236 b!25234) bm!2305))

(assert (= (or b!25225 b!25210) bm!2308))

(assert (= (or b!25239 bm!2305) bm!2306))

(assert (= (or b!25219 b!25226) bm!2299))

(assert (= (or b!25246 b!25217) bm!2291))

(assert (= (or bm!2286 bm!2306) bm!2304))

(assert (= (or b!25209 b!25226) bm!2303))

(assert (= (or b!25223 b!25222) bm!2302))

(assert (= (or bm!2300 bm!2299) bm!2287))

(assert (= (or b!25231 b!25219) bm!2289))

(assert (= (or bm!2298 bm!2308) bm!2295))

(assert (= (or b!25223 b!25222) bm!2296))

(assert (= (and bm!2296 c!3487) b!25232))

(assert (= (and bm!2296 (not c!3487)) b!25242))

(assert (= (or bm!2290 bm!2302) bm!2297))

(assert (= (or bm!2309 b!25242) bm!2293))

(assert (= (or bm!2294 b!25222) bm!2292))

(assert (= (and bm!2292 c!3495) b!25245))

(assert (= (and bm!2292 (not c!3495)) b!25238))

(assert (= (and d!4755 res!15206) b!25243))

(assert (= (and b!25243 c!3485) b!25233))

(assert (= (and b!25243 (not c!3485)) b!25220))

(assert (= (and b!25233 res!15204) b!25241))

(assert (= (or b!25233 b!25241 b!25220) bm!2307))

(assert (= (or b!25241 b!25220) bm!2288))

(declare-fun m!20297 () Bool)

(assert (=> b!25244 m!20297))

(declare-fun m!20299 () Bool)

(assert (=> bm!2287 m!20299))

(declare-fun m!20301 () Bool)

(assert (=> b!25224 m!20301))

(declare-fun m!20303 () Bool)

(assert (=> bm!2293 m!20303))

(declare-fun m!20305 () Bool)

(assert (=> b!25207 m!20305))

(declare-fun m!20307 () Bool)

(assert (=> bm!2296 m!20307))

(declare-fun m!20309 () Bool)

(assert (=> bm!2296 m!20309))

(declare-fun m!20311 () Bool)

(assert (=> b!25237 m!20311))

(declare-fun m!20313 () Bool)

(assert (=> bm!2288 m!20313))

(declare-fun m!20315 () Bool)

(assert (=> bm!2307 m!20315))

(declare-fun m!20317 () Bool)

(assert (=> b!25228 m!20317))

(declare-fun m!20319 () Bool)

(assert (=> d!4755 m!20319))

(declare-fun m!20321 () Bool)

(assert (=> d!4755 m!20321))

(declare-fun m!20323 () Bool)

(assert (=> b!25233 m!20323))

(declare-fun m!20325 () Bool)

(assert (=> b!25241 m!20325))

(declare-fun m!20327 () Bool)

(assert (=> b!25212 m!20327))

(declare-fun m!20329 () Bool)

(assert (=> b!25238 m!20329))

(declare-fun m!20331 () Bool)

(assert (=> bm!2295 m!20331))

(declare-fun m!20333 () Bool)

(assert (=> bm!2297 m!20333))

(declare-fun m!20335 () Bool)

(assert (=> bm!2297 m!20335))

(declare-fun m!20337 () Bool)

(assert (=> bm!2292 m!20337))

(declare-fun m!20339 () Bool)

(assert (=> bm!2291 m!20339))

(declare-fun m!20341 () Bool)

(assert (=> bm!2289 m!20341))

(declare-fun m!20343 () Bool)

(assert (=> b!25215 m!20343))

(assert (=> b!25222 m!20329))

(assert (=> b!25222 m!20333))

(declare-fun m!20345 () Bool)

(assert (=> b!25222 m!20345))

(declare-fun m!20347 () Bool)

(assert (=> b!25222 m!20347))

(assert (=> b!25222 m!20329))

(declare-fun m!20349 () Bool)

(assert (=> b!25222 m!20349))

(declare-fun m!20351 () Bool)

(assert (=> bm!2303 m!20351))

(declare-fun m!20353 () Bool)

(assert (=> bm!2304 m!20353))

(assert (=> b!25214 m!20299))

(declare-fun m!20355 () Bool)

(assert (=> b!25211 m!20355))

(assert (=> bm!2225 d!4755))

(declare-fun bm!2310 () Bool)

(declare-fun call!2332 () Bool)

(declare-fun call!2336 () Bool)

(assert (=> bm!2310 (= call!2332 call!2336)))

(declare-fun b!25249 () Bool)

(declare-fun res!15221 () Bool)

(declare-fun e!16331 () Bool)

(assert (=> b!25249 (=> (not res!15221) (not e!16331))))

(declare-fun lt!9893 () SeekEntryResult!56)

(assert (=> b!25249 (= res!15221 (= (select (arr!602 (_keys!3190 lt!9686)) (index!2346 lt!9893)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2311 () Bool)

(declare-fun call!2329 () SeekEntryResult!56)

(assert (=> bm!2311 (= call!2329 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3190 lt!9686) (mask!4763 lt!9686)))))

(declare-fun b!25250 () Bool)

(declare-fun e!16313 () Bool)

(declare-fun lt!9904 () SeekEntryResult!56)

(assert (=> b!25250 (= e!16313 ((_ is Undefined!56) lt!9904))))

(declare-fun b!25251 () Bool)

(declare-fun e!16329 () Unit!600)

(declare-fun lt!9883 () Unit!600)

(assert (=> b!25251 (= e!16329 lt!9883)))

(declare-fun call!2324 () Unit!600)

(assert (=> b!25251 (= lt!9883 call!2324)))

(declare-fun call!2335 () SeekEntryResult!56)

(assert (=> b!25251 (= lt!9893 call!2335)))

(declare-fun c!3507 () Bool)

(assert (=> b!25251 (= c!3507 ((_ is MissingZero!56) lt!9893))))

(declare-fun e!16319 () Bool)

(assert (=> b!25251 e!16319))

(declare-fun b!25252 () Bool)

(declare-fun e!16326 () Bool)

(declare-fun call!2334 () Bool)

(assert (=> b!25252 (= e!16326 (not call!2334))))

(declare-fun b!25253 () Bool)

(declare-fun res!15231 () Bool)

(declare-fun e!16333 () Bool)

(assert (=> b!25253 (=> (not res!15231) (not e!16333))))

(assert (=> b!25253 (= res!15231 (= (select (arr!602 (_keys!3190 lt!9686)) (index!2346 lt!9904)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2312 () Bool)

(declare-fun call!2319 () ListLongMap!567)

(assert (=> bm!2312 (= call!2319 (map!411 lt!9686))))

(declare-fun bm!2313 () Bool)

(declare-fun call!2325 () Unit!600)

(assert (=> bm!2313 (= call!2325 (lemmaInListMapThenSeekEntryOrOpenFindsIt!11 (_keys!3190 lt!9686) (_values!1749 lt!9686) (mask!4763 lt!9686) (extraKeys!1657 lt!9686) (zeroValue!1684 lt!9686) (minValue!1684 lt!9686) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1764 lt!9686)))))

(declare-fun b!25254 () Bool)

(declare-fun res!15225 () Bool)

(assert (=> b!25254 (= res!15225 (= (select (arr!602 (_keys!3190 lt!9686)) (index!2349 lt!9893)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!16334 () Bool)

(assert (=> b!25254 (=> (not res!15225) (not e!16334))))

(declare-fun b!25255 () Bool)

(declare-fun e!16325 () tuple2!976)

(declare-fun e!16328 () tuple2!976)

(assert (=> b!25255 (= e!16325 e!16328)))

(declare-fun c!3511 () Bool)

(assert (=> b!25255 (= c!3511 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25256 () Bool)

(declare-fun e!16323 () tuple2!976)

(assert (=> b!25256 (= e!16325 e!16323)))

(declare-fun lt!9891 () SeekEntryResult!56)

(assert (=> b!25256 (= lt!9891 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3190 lt!9686) (mask!4763 lt!9686)))))

(declare-fun c!3510 () Bool)

(assert (=> b!25256 (= c!3510 ((_ is Undefined!56) lt!9891))))

(declare-fun d!4757 () Bool)

(declare-fun e!16316 () Bool)

(assert (=> d!4757 e!16316))

(declare-fun res!15220 () Bool)

(assert (=> d!4757 (=> (not res!15220) (not e!16316))))

(declare-fun lt!9884 () tuple2!976)

(assert (=> d!4757 (= res!15220 (valid!118 (_2!496 lt!9884)))))

(assert (=> d!4757 (= lt!9884 e!16325)))

(declare-fun c!3505 () Bool)

(assert (=> d!4757 (= c!3505 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4757 (valid!118 lt!9686)))

(assert (=> d!4757 (= (update!39 lt!9686 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1684 (v!1617 (underlying!118 thiss!938)))) lt!9884)))

(declare-fun b!25257 () Bool)

(declare-fun e!16314 () Bool)

(declare-fun lt!9888 () SeekEntryResult!56)

(assert (=> b!25257 (= e!16314 (= (select (arr!602 (_keys!3190 lt!9686)) (index!2347 lt!9888)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25258 () Bool)

(declare-fun call!2331 () Bool)

(assert (=> b!25258 (= e!16331 (not call!2331))))

(declare-fun bm!2314 () Bool)

(declare-fun call!2333 () ListLongMap!567)

(declare-fun call!2313 () ListLongMap!567)

(assert (=> bm!2314 (= call!2333 call!2313)))

(declare-fun c!3512 () Bool)

(declare-fun bm!2315 () Bool)

(declare-fun call!2316 () tuple2!976)

(assert (=> bm!2315 (= call!2316 (updateHelperNewKey!11 lt!9686 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (ite c!3512 (index!2349 lt!9891) (index!2346 lt!9891))))))

(declare-fun e!16317 () ListLongMap!567)

(declare-fun bm!2316 () Bool)

(declare-fun call!2314 () ListLongMap!567)

(assert (=> bm!2316 (= call!2314 (+!46 e!16317 (ite c!3505 (ite c!3511 (tuple2!987 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1684 (v!1617 (underlying!118 thiss!938)))) (tuple2!987 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))))) (tuple2!987 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1684 (v!1617 (underlying!118 thiss!938)))))))))

(declare-fun c!3509 () Bool)

(assert (=> bm!2316 (= c!3509 c!3505)))

(declare-fun call!2323 () ListLongMap!567)

(declare-fun lt!9901 () (_ BitVec 32))

(declare-fun bm!2317 () Bool)

(declare-fun lt!9905 () array!1277)

(assert (=> bm!2317 (= call!2323 (getCurrentListMap!130 (_keys!3190 lt!9686) (ite c!3505 (_values!1749 lt!9686) lt!9905) (mask!4763 lt!9686) (ite (and c!3505 c!3511) lt!9901 (extraKeys!1657 lt!9686)) (ite (and c!3505 c!3511) (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (zeroValue!1684 lt!9686)) (minValue!1684 lt!9686) #b00000000000000000000000000000000 (defaultEntry!1764 lt!9686)))))

(declare-fun b!25259 () Bool)

(declare-fun lt!9903 () tuple2!976)

(assert (=> b!25259 (= lt!9903 call!2316)))

(declare-fun e!16330 () tuple2!976)

(assert (=> b!25259 (= e!16330 (tuple2!977 (_1!496 lt!9903) (_2!496 lt!9903)))))

(declare-fun b!25260 () Bool)

(declare-fun c!3508 () Bool)

(assert (=> b!25260 (= c!3508 ((_ is MissingVacant!56) lt!9893))))

(declare-fun e!16320 () Bool)

(assert (=> b!25260 (= e!16319 e!16320)))

(declare-fun b!25261 () Bool)

(declare-fun e!16321 () Unit!600)

(declare-fun lt!9882 () Unit!600)

(assert (=> b!25261 (= e!16321 lt!9882)))

(assert (=> b!25261 (= lt!9882 call!2325)))

(declare-fun lt!9889 () SeekEntryResult!56)

(declare-fun call!2322 () SeekEntryResult!56)

(assert (=> b!25261 (= lt!9889 call!2322)))

(declare-fun res!15223 () Bool)

(assert (=> b!25261 (= res!15223 ((_ is Found!56) lt!9889))))

(declare-fun e!16318 () Bool)

(assert (=> b!25261 (=> (not res!15223) (not e!16318))))

(assert (=> b!25261 e!16318))

(declare-fun b!25262 () Bool)

(declare-fun e!16332 () Bool)

(declare-fun call!2318 () ListLongMap!567)

(assert (=> b!25262 (= e!16332 (= call!2318 call!2319))))

(declare-fun bm!2318 () Bool)

(declare-fun call!2315 () ListLongMap!567)

(assert (=> bm!2318 (= call!2315 call!2314)))

(declare-fun b!25263 () Bool)

(declare-fun res!15219 () Bool)

(assert (=> b!25263 (=> (not res!15219) (not e!16331))))

(declare-fun call!2320 () Bool)

(assert (=> b!25263 (= res!15219 call!2320)))

(assert (=> b!25263 (= e!16319 e!16331)))

(declare-fun b!25264 () Bool)

(declare-fun lt!9906 () Unit!600)

(declare-fun lt!9897 () Unit!600)

(assert (=> b!25264 (= lt!9906 lt!9897)))

(declare-fun call!2326 () Bool)

(assert (=> b!25264 call!2326))

(assert (=> b!25264 (= lt!9897 (lemmaValidKeyInArrayIsInListMap!11 (_keys!3190 lt!9686) lt!9905 (mask!4763 lt!9686) (extraKeys!1657 lt!9686) (zeroValue!1684 lt!9686) (minValue!1684 lt!9686) (index!2347 lt!9891) (defaultEntry!1764 lt!9686)))))

(assert (=> b!25264 (= lt!9905 (array!1278 (store (arr!603 (_values!1749 lt!9686)) (index!2347 lt!9891) (ValueCellFull!314 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))))) (size!704 (_values!1749 lt!9686))))))

(declare-fun lt!9896 () Unit!600)

(declare-fun lt!9895 () Unit!600)

(assert (=> b!25264 (= lt!9896 lt!9895)))

(declare-fun call!2330 () ListLongMap!567)

(assert (=> b!25264 (= call!2314 call!2330)))

(assert (=> b!25264 (= lt!9895 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!11 (_keys!3190 lt!9686) (_values!1749 lt!9686) (mask!4763 lt!9686) (extraKeys!1657 lt!9686) (zeroValue!1684 lt!9686) (minValue!1684 lt!9686) (index!2347 lt!9891) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (defaultEntry!1764 lt!9686)))))

(declare-fun lt!9898 () Unit!600)

(assert (=> b!25264 (= lt!9898 e!16321)))

(declare-fun c!3500 () Bool)

(assert (=> b!25264 (= c!3500 (contains!233 (getCurrentListMap!130 (_keys!3190 lt!9686) (_values!1749 lt!9686) (mask!4763 lt!9686) (extraKeys!1657 lt!9686) (zeroValue!1684 lt!9686) (minValue!1684 lt!9686) #b00000000000000000000000000000000 (defaultEntry!1764 lt!9686)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25264 (= e!16330 (tuple2!977 true (LongMapFixedSize!215 (defaultEntry!1764 lt!9686) (mask!4763 lt!9686) (extraKeys!1657 lt!9686) (zeroValue!1684 lt!9686) (minValue!1684 lt!9686) (_size!154 lt!9686) (_keys!3190 lt!9686) (array!1278 (store (arr!603 (_values!1749 lt!9686)) (index!2347 lt!9891) (ValueCellFull!314 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))))) (size!704 (_values!1749 lt!9686))) (_vacant!154 lt!9686))))))

(declare-fun bm!2319 () Bool)

(declare-fun call!2328 () Bool)

(assert (=> bm!2319 (= call!2328 (arrayContainsKey!0 (_keys!3190 lt!9686) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!25265 () Bool)

(declare-fun lt!9890 () Unit!600)

(assert (=> b!25265 (= lt!9890 e!16329)))

(declare-fun c!3504 () Bool)

(assert (=> b!25265 (= c!3504 call!2326)))

(assert (=> b!25265 (= e!16323 (tuple2!977 false lt!9686))))

(declare-fun b!25266 () Bool)

(declare-fun lt!9880 () Unit!600)

(declare-fun lt!9887 () Unit!600)

(assert (=> b!25266 (= lt!9880 lt!9887)))

(declare-fun call!2321 () ListLongMap!567)

(assert (=> b!25266 (= call!2315 call!2321)))

(assert (=> b!25266 (= lt!9887 (lemmaChangeZeroKeyThenAddPairToListMap!11 (_keys!3190 lt!9686) (_values!1749 lt!9686) (mask!4763 lt!9686) (extraKeys!1657 lt!9686) lt!9901 (zeroValue!1684 lt!9686) (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 lt!9686) (defaultEntry!1764 lt!9686)))))

(assert (=> b!25266 (= lt!9901 (bvor (extraKeys!1657 lt!9686) #b00000000000000000000000000000001))))

(assert (=> b!25266 (= e!16328 (tuple2!977 true (LongMapFixedSize!215 (defaultEntry!1764 lt!9686) (mask!4763 lt!9686) (bvor (extraKeys!1657 lt!9686) #b00000000000000000000000000000001) (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (minValue!1684 lt!9686) (_size!154 lt!9686) (_keys!3190 lt!9686) (_values!1749 lt!9686) (_vacant!154 lt!9686))))))

(declare-fun b!25267 () Bool)

(assert (=> b!25267 (= e!16333 (not call!2334))))

(declare-fun bm!2320 () Bool)

(declare-fun c!3501 () Bool)

(assert (=> bm!2320 (= c!3501 c!3510)))

(declare-fun e!16315 () ListLongMap!567)

(assert (=> bm!2320 (= call!2326 (contains!233 e!16315 (ite c!3510 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!602 (_keys!3190 lt!9686)) (index!2347 lt!9891)))))))

(declare-fun bm!2321 () Bool)

(declare-fun lt!9899 () (_ BitVec 32))

(assert (=> bm!2321 (= call!2313 (getCurrentListMap!130 (_keys!3190 lt!9686) (ite (or c!3505 c!3510) (_values!1749 lt!9686) (array!1278 (store (arr!603 (_values!1749 lt!9686)) (index!2347 lt!9891) (ValueCellFull!314 (zeroValue!1684 (v!1617 (underlying!118 thiss!938))))) (size!704 (_values!1749 lt!9686)))) (mask!4763 lt!9686) (ite c!3505 (ite c!3511 (extraKeys!1657 lt!9686) lt!9899) (extraKeys!1657 lt!9686)) (zeroValue!1684 lt!9686) (ite c!3505 (ite c!3511 (minValue!1684 lt!9686) (zeroValue!1684 (v!1617 (underlying!118 thiss!938)))) (minValue!1684 lt!9686)) #b00000000000000000000000000000000 (defaultEntry!1764 lt!9686)))))

(declare-fun b!25268 () Bool)

(declare-fun Unit!609 () Unit!600)

(assert (=> b!25268 (= e!16321 Unit!609)))

(declare-fun lt!9900 () Unit!600)

(assert (=> b!25268 (= lt!9900 call!2324)))

(assert (=> b!25268 (= lt!9904 call!2322)))

(declare-fun c!3503 () Bool)

(assert (=> b!25268 (= c!3503 ((_ is MissingZero!56) lt!9904))))

(declare-fun e!16327 () Bool)

(assert (=> b!25268 e!16327))

(declare-fun lt!9902 () Unit!600)

(assert (=> b!25268 (= lt!9902 lt!9900)))

(assert (=> b!25268 false))

(declare-fun b!25269 () Bool)

(declare-fun e!16324 () tuple2!976)

(assert (=> b!25269 (= e!16324 e!16330)))

(declare-fun c!3502 () Bool)

(assert (=> b!25269 (= c!3502 ((_ is MissingZero!56) lt!9891))))

(declare-fun b!25270 () Bool)

(declare-fun lt!9892 () Unit!600)

(declare-fun lt!9881 () Unit!600)

(assert (=> b!25270 (= lt!9892 lt!9881)))

(assert (=> b!25270 (= call!2315 call!2333)))

(assert (=> b!25270 (= lt!9881 (lemmaChangeLongMinValueKeyThenAddPairToListMap!11 (_keys!3190 lt!9686) (_values!1749 lt!9686) (mask!4763 lt!9686) (extraKeys!1657 lt!9686) lt!9899 (zeroValue!1684 lt!9686) (minValue!1684 lt!9686) (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (defaultEntry!1764 lt!9686)))))

(assert (=> b!25270 (= lt!9899 (bvor (extraKeys!1657 lt!9686) #b00000000000000000000000000000010))))

(assert (=> b!25270 (= e!16328 (tuple2!977 true (LongMapFixedSize!215 (defaultEntry!1764 lt!9686) (mask!4763 lt!9686) (bvor (extraKeys!1657 lt!9686) #b00000000000000000000000000000010) (zeroValue!1684 lt!9686) (zeroValue!1684 (v!1617 (underlying!118 thiss!938))) (_size!154 lt!9686) (_keys!3190 lt!9686) (_values!1749 lt!9686) (_vacant!154 lt!9686))))))

(declare-fun bm!2322 () Bool)

(assert (=> bm!2322 (= call!2331 call!2328)))

(declare-fun b!25271 () Bool)

(assert (=> b!25271 (= c!3512 ((_ is MissingVacant!56) lt!9891))))

(assert (=> b!25271 (= e!16323 e!16324)))

(declare-fun b!25272 () Bool)

(declare-fun c!3506 () Bool)

(assert (=> b!25272 (= c!3506 ((_ is MissingVacant!56) lt!9904))))

(assert (=> b!25272 (= e!16327 e!16313)))

(declare-fun bm!2323 () Bool)

(assert (=> bm!2323 (= call!2322 call!2329)))

(declare-fun b!25273 () Bool)

(declare-fun Unit!610 () Unit!600)

(assert (=> b!25273 (= e!16329 Unit!610)))

(declare-fun lt!9885 () Unit!600)

(assert (=> b!25273 (= lt!9885 call!2325)))

(assert (=> b!25273 (= lt!9888 call!2335)))

(declare-fun res!15226 () Bool)

(assert (=> b!25273 (= res!15226 ((_ is Found!56) lt!9888))))

(assert (=> b!25273 (=> (not res!15226) (not e!16314))))

(assert (=> b!25273 e!16314))

(declare-fun lt!9894 () Unit!600)

(assert (=> b!25273 (= lt!9894 lt!9885)))

(assert (=> b!25273 false))

(declare-fun bm!2324 () Bool)

(assert (=> bm!2324 (= call!2335 call!2329)))

(declare-fun bm!2325 () Bool)

(assert (=> bm!2325 (= call!2320 call!2332)))

(declare-fun bm!2326 () Bool)

(assert (=> bm!2326 (= call!2330 call!2313)))

(declare-fun b!25274 () Bool)

(assert (=> b!25274 (= e!16315 call!2330)))

(declare-fun b!25275 () Bool)

(declare-fun e!16322 () Bool)

(assert (=> b!25275 (= e!16332 e!16322)))

(declare-fun res!15218 () Bool)

(assert (=> b!25275 (= res!15218 (contains!233 call!2318 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25275 (=> (not res!15218) (not e!16322))))

(declare-fun b!25276 () Bool)

(assert (=> b!25276 (= e!16313 e!16326)))

(declare-fun res!15229 () Bool)

(declare-fun call!2317 () Bool)

(assert (=> b!25276 (= res!15229 call!2317)))

(assert (=> b!25276 (=> (not res!15229) (not e!16326))))

(declare-fun b!25277 () Bool)

(declare-fun res!15230 () Bool)

(assert (=> b!25277 (= res!15230 call!2332)))

(assert (=> b!25277 (=> (not res!15230) (not e!16314))))

(declare-fun b!25278 () Bool)

(declare-fun res!15224 () Bool)

(assert (=> b!25278 (=> (not res!15224) (not e!16333))))

(assert (=> b!25278 (= res!15224 call!2317)))

(assert (=> b!25278 (= e!16327 e!16333)))

(declare-fun b!25279 () Bool)

(assert (=> b!25279 (= e!16318 (= (select (arr!602 (_keys!3190 lt!9686)) (index!2347 lt!9889)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25280 () Bool)

(assert (=> b!25280 (= e!16317 (getCurrentListMap!130 (_keys!3190 lt!9686) (_values!1749 lt!9686) (mask!4763 lt!9686) (extraKeys!1657 lt!9686) (zeroValue!1684 lt!9686) (minValue!1684 lt!9686) #b00000000000000000000000000000000 (defaultEntry!1764 lt!9686)))))

(declare-fun bm!2327 () Bool)

(assert (=> bm!2327 (= call!2324 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!11 (_keys!3190 lt!9686) (_values!1749 lt!9686) (mask!4763 lt!9686) (extraKeys!1657 lt!9686) (zeroValue!1684 lt!9686) (minValue!1684 lt!9686) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1764 lt!9686)))))

(declare-fun b!25281 () Bool)

(declare-fun res!15222 () Bool)

(declare-fun call!2327 () Bool)

(assert (=> b!25281 (= res!15222 call!2327)))

(assert (=> b!25281 (=> (not res!15222) (not e!16318))))

(declare-fun bm!2328 () Bool)

(assert (=> bm!2328 (= call!2336 (inRange!0 (ite c!3510 (ite c!3504 (index!2347 lt!9888) (ite c!3507 (index!2346 lt!9893) (index!2349 lt!9893))) (ite c!3500 (index!2347 lt!9889) (ite c!3503 (index!2346 lt!9904) (index!2349 lt!9904)))) (mask!4763 lt!9686)))))

(declare-fun b!25282 () Bool)

(assert (=> b!25282 (= e!16334 (not call!2331))))

(declare-fun b!25283 () Bool)

(assert (=> b!25283 (= e!16322 (= call!2318 (+!46 call!2319 (tuple2!987 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1684 (v!1617 (underlying!118 thiss!938)))))))))

(declare-fun b!25284 () Bool)

(assert (=> b!25284 (= e!16315 call!2323)))

(declare-fun bm!2329 () Bool)

(assert (=> bm!2329 (= call!2317 call!2327)))

(declare-fun bm!2330 () Bool)

(assert (=> bm!2330 (= call!2327 call!2336)))

(declare-fun bm!2331 () Bool)

(assert (=> bm!2331 (= call!2318 (map!411 (_2!496 lt!9884)))))

(declare-fun b!25285 () Bool)

(assert (=> b!25285 (= e!16316 e!16332)))

(declare-fun c!3499 () Bool)

(assert (=> b!25285 (= c!3499 (_1!496 lt!9884))))

(declare-fun bm!2332 () Bool)

(assert (=> bm!2332 (= call!2334 call!2328)))

(declare-fun bm!2333 () Bool)

(assert (=> bm!2333 (= call!2321 call!2323)))

(declare-fun b!25286 () Bool)

(declare-fun res!15227 () Bool)

(assert (=> b!25286 (= res!15227 (= (select (arr!602 (_keys!3190 lt!9686)) (index!2349 lt!9904)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25286 (=> (not res!15227) (not e!16326))))

(declare-fun b!25287 () Bool)

(assert (=> b!25287 (= e!16317 (ite c!3511 call!2333 call!2321))))

(declare-fun b!25288 () Bool)

(declare-fun lt!9886 () tuple2!976)

(assert (=> b!25288 (= e!16324 (tuple2!977 (_1!496 lt!9886) (_2!496 lt!9886)))))

(assert (=> b!25288 (= lt!9886 call!2316)))

(declare-fun b!25289 () Bool)

(assert (=> b!25289 (= e!16320 e!16334)))

(declare-fun res!15228 () Bool)

(assert (=> b!25289 (= res!15228 call!2320)))

(assert (=> b!25289 (=> (not res!15228) (not e!16334))))

(declare-fun b!25290 () Bool)

(assert (=> b!25290 (= e!16320 ((_ is Undefined!56) lt!9893))))

(assert (= (and d!4757 c!3505) b!25255))

(assert (= (and d!4757 (not c!3505)) b!25256))

(assert (= (and b!25255 c!3511) b!25266))

(assert (= (and b!25255 (not c!3511)) b!25270))

(assert (= (or b!25266 b!25270) bm!2314))

(assert (= (or b!25266 b!25270) bm!2333))

(assert (= (or b!25266 b!25270) bm!2318))

(assert (= (and b!25256 c!3510) b!25265))

(assert (= (and b!25256 (not c!3510)) b!25271))

(assert (= (and b!25265 c!3504) b!25273))

(assert (= (and b!25265 (not c!3504)) b!25251))

(assert (= (and b!25273 res!15226) b!25277))

(assert (= (and b!25277 res!15230) b!25257))

(assert (= (and b!25251 c!3507) b!25263))

(assert (= (and b!25251 (not c!3507)) b!25260))

(assert (= (and b!25263 res!15219) b!25249))

(assert (= (and b!25249 res!15221) b!25258))

(assert (= (and b!25260 c!3508) b!25289))

(assert (= (and b!25260 (not c!3508)) b!25290))

(assert (= (and b!25289 res!15228) b!25254))

(assert (= (and b!25254 res!15225) b!25282))

(assert (= (or b!25263 b!25289) bm!2325))

(assert (= (or b!25258 b!25282) bm!2322))

(assert (= (or b!25277 bm!2325) bm!2310))

(assert (= (or b!25273 b!25251) bm!2324))

(assert (= (and b!25271 c!3512) b!25288))

(assert (= (and b!25271 (not c!3512)) b!25269))

(assert (= (and b!25269 c!3502) b!25259))

(assert (= (and b!25269 (not c!3502)) b!25264))

(assert (= (and b!25264 c!3500) b!25261))

(assert (= (and b!25264 (not c!3500)) b!25268))

(assert (= (and b!25261 res!15223) b!25281))

(assert (= (and b!25281 res!15222) b!25279))

(assert (= (and b!25268 c!3503) b!25278))

(assert (= (and b!25268 (not c!3503)) b!25272))

(assert (= (and b!25278 res!15224) b!25253))

(assert (= (and b!25253 res!15231) b!25267))

(assert (= (and b!25272 c!3506) b!25276))

(assert (= (and b!25272 (not c!3506)) b!25250))

(assert (= (and b!25276 res!15229) b!25286))

(assert (= (and b!25286 res!15227) b!25252))

(assert (= (or b!25278 b!25276) bm!2329))

(assert (= (or b!25267 b!25252) bm!2332))

(assert (= (or b!25281 bm!2329) bm!2330))

(assert (= (or b!25261 b!25268) bm!2323))

(assert (= (or b!25288 b!25259) bm!2315))

(assert (= (or bm!2310 bm!2330) bm!2328))

(assert (= (or b!25251 b!25268) bm!2327))

(assert (= (or b!25265 b!25264) bm!2326))

(assert (= (or bm!2324 bm!2323) bm!2311))

(assert (= (or b!25273 b!25261) bm!2313))

(assert (= (or bm!2322 bm!2332) bm!2319))

(assert (= (or b!25265 b!25264) bm!2320))

(assert (= (and bm!2320 c!3501) b!25274))

(assert (= (and bm!2320 (not c!3501)) b!25284))

(assert (= (or bm!2314 bm!2326) bm!2321))

(assert (= (or bm!2333 b!25284) bm!2317))

(assert (= (or bm!2318 b!25264) bm!2316))

(assert (= (and bm!2316 c!3509) b!25287))

(assert (= (and bm!2316 (not c!3509)) b!25280))

(assert (= (and d!4757 res!15220) b!25285))

(assert (= (and b!25285 c!3499) b!25275))

(assert (= (and b!25285 (not c!3499)) b!25262))

(assert (= (and b!25275 res!15218) b!25283))

(assert (= (or b!25275 b!25283 b!25262) bm!2331))

(assert (= (or b!25283 b!25262) bm!2312))

(declare-fun m!20357 () Bool)

(assert (=> b!25286 m!20357))

(declare-fun m!20359 () Bool)

(assert (=> bm!2311 m!20359))

(declare-fun m!20361 () Bool)

(assert (=> b!25266 m!20361))

(declare-fun m!20363 () Bool)

(assert (=> bm!2317 m!20363))

(declare-fun m!20365 () Bool)

(assert (=> b!25249 m!20365))

(declare-fun m!20367 () Bool)

(assert (=> bm!2320 m!20367))

(declare-fun m!20369 () Bool)

(assert (=> bm!2320 m!20369))

(declare-fun m!20371 () Bool)

(assert (=> b!25279 m!20371))

(declare-fun m!20373 () Bool)

(assert (=> bm!2312 m!20373))

(declare-fun m!20375 () Bool)

(assert (=> bm!2331 m!20375))

(declare-fun m!20377 () Bool)

(assert (=> b!25270 m!20377))

(declare-fun m!20379 () Bool)

(assert (=> d!4757 m!20379))

(declare-fun m!20381 () Bool)

(assert (=> d!4757 m!20381))

(declare-fun m!20383 () Bool)

(assert (=> b!25275 m!20383))

(declare-fun m!20385 () Bool)

(assert (=> b!25283 m!20385))

(declare-fun m!20387 () Bool)

(assert (=> b!25254 m!20387))

(declare-fun m!20389 () Bool)

(assert (=> b!25280 m!20389))

(declare-fun m!20391 () Bool)

(assert (=> bm!2319 m!20391))

(declare-fun m!20393 () Bool)

(assert (=> bm!2321 m!20393))

(declare-fun m!20395 () Bool)

(assert (=> bm!2321 m!20395))

(declare-fun m!20397 () Bool)

(assert (=> bm!2316 m!20397))

(declare-fun m!20399 () Bool)

(assert (=> bm!2315 m!20399))

(declare-fun m!20401 () Bool)

(assert (=> bm!2313 m!20401))

(declare-fun m!20403 () Bool)

(assert (=> b!25257 m!20403))

(assert (=> b!25264 m!20389))

(assert (=> b!25264 m!20393))

(declare-fun m!20405 () Bool)

(assert (=> b!25264 m!20405))

(declare-fun m!20407 () Bool)

(assert (=> b!25264 m!20407))

(assert (=> b!25264 m!20389))

(declare-fun m!20409 () Bool)

(assert (=> b!25264 m!20409))

(declare-fun m!20411 () Bool)

(assert (=> bm!2327 m!20411))

(declare-fun m!20413 () Bool)

(assert (=> bm!2328 m!20413))

(assert (=> b!25256 m!20359))

(declare-fun m!20415 () Bool)

(assert (=> b!25253 m!20415))

(assert (=> b!25001 d!4757))

(declare-fun mapIsEmpty!1045 () Bool)

(declare-fun mapRes!1045 () Bool)

(assert (=> mapIsEmpty!1045 mapRes!1045))

(declare-fun condMapEmpty!1045 () Bool)

(declare-fun mapDefault!1045 () ValueCell!314)

(assert (=> mapNonEmpty!1036 (= condMapEmpty!1045 (= mapRest!1036 ((as const (Array (_ BitVec 32) ValueCell!314)) mapDefault!1045)))))

(declare-fun e!16340 () Bool)

(assert (=> mapNonEmpty!1036 (= tp!3541 (and e!16340 mapRes!1045))))

(declare-fun b!25297 () Bool)

(declare-fun e!16339 () Bool)

(assert (=> b!25297 (= e!16339 tp_is_empty!1027)))

(declare-fun mapNonEmpty!1045 () Bool)

(declare-fun tp!3556 () Bool)

(assert (=> mapNonEmpty!1045 (= mapRes!1045 (and tp!3556 e!16339))))

(declare-fun mapValue!1045 () ValueCell!314)

(declare-fun mapKey!1045 () (_ BitVec 32))

(declare-fun mapRest!1045 () (Array (_ BitVec 32) ValueCell!314))

(assert (=> mapNonEmpty!1045 (= mapRest!1036 (store mapRest!1045 mapKey!1045 mapValue!1045))))

(declare-fun b!25298 () Bool)

(assert (=> b!25298 (= e!16340 tp_is_empty!1027)))

(assert (= (and mapNonEmpty!1036 condMapEmpty!1045) mapIsEmpty!1045))

(assert (= (and mapNonEmpty!1036 (not condMapEmpty!1045)) mapNonEmpty!1045))

(assert (= (and mapNonEmpty!1045 ((_ is ValueCellFull!314) mapValue!1045)) b!25297))

(assert (= (and mapNonEmpty!1036 ((_ is ValueCellFull!314) mapDefault!1045)) b!25298))

(declare-fun m!20417 () Bool)

(assert (=> mapNonEmpty!1045 m!20417))

(declare-fun b_lambda!1655 () Bool)

(assert (= b_lambda!1651 (or (and b!24993 b_free!763) b_lambda!1655)))

(declare-fun b_lambda!1657 () Bool)

(assert (= b_lambda!1653 (or (and b!24993 b_free!763) b_lambda!1657)))

(check-sat (not bm!2320) (not b!25228) b_and!1559 (not b!25214) (not b!25256) (not bm!2291) (not b!25108) (not b_lambda!1657) (not b!25110) (not d!4755) (not d!4743) (not b!25233) (not bm!2287) (not bm!2307) (not b!25222) (not bm!2289) (not b!25266) (not b!25280) (not bm!2293) (not bm!2312) (not mapNonEmpty!1045) (not bm!2315) (not bm!2303) (not b!25283) (not b!25264) (not b!25111) (not b!25224) (not d!4757) (not b!25238) (not bm!2321) (not d!4753) (not bm!2319) (not bm!2311) (not b!25275) (not b!25270) (not bm!2295) (not bm!2313) (not bm!2331) (not bm!2316) (not b!25241) (not bm!2297) (not b!25120) (not bm!2317) (not bm!2288) (not b_next!763) (not bm!2304) (not b_lambda!1655) (not bm!2296) (not bm!2292) (not bm!2328) (not d!4745) tp_is_empty!1027 (not bm!2327))
(check-sat b_and!1559 (not b_next!763))
