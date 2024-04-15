; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18102 () Bool)

(assert start!18102)

(declare-fun b!180089 () Bool)

(declare-fun b_free!4453 () Bool)

(declare-fun b_next!4453 () Bool)

(assert (=> b!180089 (= b_free!4453 (not b_next!4453))))

(declare-fun tp!16092 () Bool)

(declare-fun b_and!10961 () Bool)

(assert (=> b!180089 (= tp!16092 b_and!10961)))

(declare-fun b!180079 () Bool)

(declare-fun res!85275 () Bool)

(declare-fun e!118620 () Bool)

(assert (=> b!180079 (=> (not res!85275) (not e!118620))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!180079 (= res!85275 (not (= key!828 (bvneg key!828))))))

(declare-fun b!180080 () Bool)

(declare-fun e!118616 () Bool)

(declare-fun tp_is_empty!4225 () Bool)

(assert (=> b!180080 (= e!118616 tp_is_empty!4225)))

(declare-fun b!180081 () Bool)

(declare-datatypes ((V!5281 0))(
  ( (V!5282 (val!2157 Int)) )
))
(declare-datatypes ((tuple2!3334 0))(
  ( (tuple2!3335 (_1!1678 (_ BitVec 64)) (_2!1678 V!5281)) )
))
(declare-datatypes ((List!2290 0))(
  ( (Nil!2287) (Cons!2286 (h!2911 tuple2!3334) (t!7129 List!2290)) )
))
(declare-datatypes ((ListLongMap!2249 0))(
  ( (ListLongMap!2250 (toList!1140 List!2290)) )
))
(declare-fun lt!88849 () ListLongMap!2249)

(declare-fun call!18186 () ListLongMap!2249)

(declare-fun v!309 () V!5281)

(declare-fun e!118614 () Bool)

(declare-fun +!263 (ListLongMap!2249 tuple2!3334) ListLongMap!2249)

(assert (=> b!180081 (= e!118614 (not (= lt!88849 (+!263 call!18186 (tuple2!3335 key!828 v!309)))))))

(declare-fun bm!18183 () Bool)

(declare-fun call!18187 () ListLongMap!2249)

(declare-datatypes ((ValueCell!1769 0))(
  ( (ValueCellFull!1769 (v!4042 V!5281)) (EmptyCell!1769) )
))
(declare-datatypes ((array!7601 0))(
  ( (array!7602 (arr!3598 (Array (_ BitVec 32) (_ BitVec 64))) (size!3907 (_ BitVec 32))) )
))
(declare-datatypes ((array!7603 0))(
  ( (array!7604 (arr!3599 (Array (_ BitVec 32) ValueCell!1769)) (size!3908 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2446 0))(
  ( (LongMapFixedSize!2447 (defaultEntry!3699 Int) (mask!8696 (_ BitVec 32)) (extraKeys!3436 (_ BitVec 32)) (zeroValue!3540 V!5281) (minValue!3540 V!5281) (_size!1272 (_ BitVec 32)) (_keys!5590 array!7601) (_values!3682 array!7603) (_vacant!1272 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3336 0))(
  ( (tuple2!3337 (_1!1679 Bool) (_2!1679 LongMapFixedSize!2446)) )
))
(declare-fun lt!88847 () tuple2!3336)

(declare-fun map!1917 (LongMapFixedSize!2446) ListLongMap!2249)

(assert (=> bm!18183 (= call!18187 (map!1917 (_2!1679 lt!88847)))))

(declare-fun mapNonEmpty!7234 () Bool)

(declare-fun mapRes!7234 () Bool)

(declare-fun tp!16093 () Bool)

(assert (=> mapNonEmpty!7234 (= mapRes!7234 (and tp!16093 e!118616))))

(declare-fun mapRest!7234 () (Array (_ BitVec 32) ValueCell!1769))

(declare-fun mapKey!7234 () (_ BitVec 32))

(declare-fun thiss!1248 () LongMapFixedSize!2446)

(declare-fun mapValue!7234 () ValueCell!1769)

(assert (=> mapNonEmpty!7234 (= (arr!3599 (_values!3682 thiss!1248)) (store mapRest!7234 mapKey!7234 mapValue!7234))))

(declare-fun b!180082 () Bool)

(declare-fun e!118615 () Bool)

(assert (=> b!180082 (= e!118615 (not (= call!18187 call!18186)))))

(declare-fun mapIsEmpty!7234 () Bool)

(assert (=> mapIsEmpty!7234 mapRes!7234))

(declare-fun b!180083 () Bool)

(assert (=> b!180083 (= e!118615 e!118614)))

(assert (=> b!180083 (= lt!88849 call!18187)))

(declare-fun res!85276 () Bool)

(declare-fun contains!1222 (ListLongMap!2249 (_ BitVec 64)) Bool)

(assert (=> b!180083 (= res!85276 (not (contains!1222 lt!88849 key!828)))))

(assert (=> b!180083 (=> res!85276 e!118614)))

(declare-fun b!180084 () Bool)

(declare-fun e!118611 () Bool)

(declare-fun e!118617 () Bool)

(assert (=> b!180084 (= e!118611 (and e!118617 mapRes!7234))))

(declare-fun condMapEmpty!7234 () Bool)

(declare-fun mapDefault!7234 () ValueCell!1769)

(assert (=> b!180084 (= condMapEmpty!7234 (= (arr!3599 (_values!3682 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1769)) mapDefault!7234)))))

(declare-fun res!85274 () Bool)

(assert (=> start!18102 (=> (not res!85274) (not e!118620))))

(declare-fun valid!1036 (LongMapFixedSize!2446) Bool)

(assert (=> start!18102 (= res!85274 (valid!1036 thiss!1248))))

(assert (=> start!18102 e!118620))

(declare-fun e!118612 () Bool)

(assert (=> start!18102 e!118612))

(assert (=> start!18102 true))

(assert (=> start!18102 tp_is_empty!4225))

(declare-fun bm!18184 () Bool)

(assert (=> bm!18184 (= call!18186 (map!1917 thiss!1248))))

(declare-fun b!180085 () Bool)

(declare-fun e!118613 () Bool)

(assert (=> b!180085 (= e!118620 e!118613)))

(declare-fun res!85277 () Bool)

(assert (=> b!180085 (=> (not res!85277) (not e!118613))))

(declare-datatypes ((SeekEntryResult!600 0))(
  ( (MissingZero!600 (index!4569 (_ BitVec 32))) (Found!600 (index!4570 (_ BitVec 32))) (Intermediate!600 (undefined!1412 Bool) (index!4571 (_ BitVec 32)) (x!19711 (_ BitVec 32))) (Undefined!600) (MissingVacant!600 (index!4572 (_ BitVec 32))) )
))
(declare-fun lt!88848 () SeekEntryResult!600)

(get-info :version)

(assert (=> b!180085 (= res!85277 (and (not ((_ is Undefined!600) lt!88848)) (not ((_ is MissingVacant!600) lt!88848)) ((_ is MissingZero!600) lt!88848)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7601 (_ BitVec 32)) SeekEntryResult!600)

(assert (=> b!180085 (= lt!88848 (seekEntryOrOpen!0 key!828 (_keys!5590 thiss!1248) (mask!8696 thiss!1248)))))

(declare-fun b!180086 () Bool)

(assert (=> b!180086 (= e!118617 tp_is_empty!4225)))

(declare-fun b!180087 () Bool)

(declare-fun e!118618 () Bool)

(assert (=> b!180087 (= e!118618 e!118615)))

(declare-fun c!32256 () Bool)

(assert (=> b!180087 (= c!32256 (_1!1679 lt!88847))))

(declare-fun b!180088 () Bool)

(assert (=> b!180088 (= e!118613 e!118618)))

(declare-fun res!85273 () Bool)

(assert (=> b!180088 (=> res!85273 e!118618)))

(assert (=> b!180088 (= res!85273 (not (valid!1036 (_2!1679 lt!88847))))))

(declare-fun updateHelperNewKey!94 (LongMapFixedSize!2446 (_ BitVec 64) V!5281 (_ BitVec 32)) tuple2!3336)

(assert (=> b!180088 (= lt!88847 (updateHelperNewKey!94 thiss!1248 key!828 v!309 (index!4569 lt!88848)))))

(declare-fun array_inv!2327 (array!7601) Bool)

(declare-fun array_inv!2328 (array!7603) Bool)

(assert (=> b!180089 (= e!118612 (and tp!16092 tp_is_empty!4225 (array_inv!2327 (_keys!5590 thiss!1248)) (array_inv!2328 (_values!3682 thiss!1248)) e!118611))))

(assert (= (and start!18102 res!85274) b!180079))

(assert (= (and b!180079 res!85275) b!180085))

(assert (= (and b!180085 res!85277) b!180088))

(assert (= (and b!180088 (not res!85273)) b!180087))

(assert (= (and b!180087 c!32256) b!180083))

(assert (= (and b!180087 (not c!32256)) b!180082))

(assert (= (and b!180083 (not res!85276)) b!180081))

(assert (= (or b!180081 b!180082) bm!18184))

(assert (= (or b!180083 b!180082) bm!18183))

(assert (= (and b!180084 condMapEmpty!7234) mapIsEmpty!7234))

(assert (= (and b!180084 (not condMapEmpty!7234)) mapNonEmpty!7234))

(assert (= (and mapNonEmpty!7234 ((_ is ValueCellFull!1769) mapValue!7234)) b!180080))

(assert (= (and b!180084 ((_ is ValueCellFull!1769) mapDefault!7234)) b!180086))

(assert (= b!180089 b!180084))

(assert (= start!18102 b!180089))

(declare-fun m!207657 () Bool)

(assert (=> b!180085 m!207657))

(declare-fun m!207659 () Bool)

(assert (=> bm!18183 m!207659))

(declare-fun m!207661 () Bool)

(assert (=> b!180088 m!207661))

(declare-fun m!207663 () Bool)

(assert (=> b!180088 m!207663))

(declare-fun m!207665 () Bool)

(assert (=> b!180081 m!207665))

(declare-fun m!207667 () Bool)

(assert (=> b!180083 m!207667))

(declare-fun m!207669 () Bool)

(assert (=> bm!18184 m!207669))

(declare-fun m!207671 () Bool)

(assert (=> mapNonEmpty!7234 m!207671))

(declare-fun m!207673 () Bool)

(assert (=> b!180089 m!207673))

(declare-fun m!207675 () Bool)

(assert (=> b!180089 m!207675))

(declare-fun m!207677 () Bool)

(assert (=> start!18102 m!207677))

(check-sat (not b!180081) (not b_next!4453) (not b!180088) (not start!18102) b_and!10961 (not b!180085) (not bm!18184) (not b!180089) (not mapNonEmpty!7234) (not bm!18183) (not b!180083) tp_is_empty!4225)
(check-sat b_and!10961 (not b_next!4453))
(get-model)

(declare-fun d!54063 () Bool)

(assert (=> d!54063 (= (array_inv!2327 (_keys!5590 thiss!1248)) (bvsge (size!3907 (_keys!5590 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180089 d!54063))

(declare-fun d!54065 () Bool)

(assert (=> d!54065 (= (array_inv!2328 (_values!3682 thiss!1248)) (bvsge (size!3908 (_values!3682 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180089 d!54065))

(declare-fun d!54067 () Bool)

(declare-fun getCurrentListMap!775 (array!7601 array!7603 (_ BitVec 32) (_ BitVec 32) V!5281 V!5281 (_ BitVec 32) Int) ListLongMap!2249)

(assert (=> d!54067 (= (map!1917 (_2!1679 lt!88847)) (getCurrentListMap!775 (_keys!5590 (_2!1679 lt!88847)) (_values!3682 (_2!1679 lt!88847)) (mask!8696 (_2!1679 lt!88847)) (extraKeys!3436 (_2!1679 lt!88847)) (zeroValue!3540 (_2!1679 lt!88847)) (minValue!3540 (_2!1679 lt!88847)) #b00000000000000000000000000000000 (defaultEntry!3699 (_2!1679 lt!88847))))))

(declare-fun bs!7347 () Bool)

(assert (= bs!7347 d!54067))

(declare-fun m!207723 () Bool)

(assert (=> bs!7347 m!207723))

(assert (=> bm!18183 d!54067))

(declare-fun d!54069 () Bool)

(declare-fun res!85314 () Bool)

(declare-fun e!118683 () Bool)

(assert (=> d!54069 (=> (not res!85314) (not e!118683))))

(declare-fun simpleValid!164 (LongMapFixedSize!2446) Bool)

(assert (=> d!54069 (= res!85314 (simpleValid!164 thiss!1248))))

(assert (=> d!54069 (= (valid!1036 thiss!1248) e!118683)))

(declare-fun b!180162 () Bool)

(declare-fun res!85315 () Bool)

(assert (=> b!180162 (=> (not res!85315) (not e!118683))))

(declare-fun arrayCountValidKeys!0 (array!7601 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!180162 (= res!85315 (= (arrayCountValidKeys!0 (_keys!5590 thiss!1248) #b00000000000000000000000000000000 (size!3907 (_keys!5590 thiss!1248))) (_size!1272 thiss!1248)))))

(declare-fun b!180163 () Bool)

(declare-fun res!85316 () Bool)

(assert (=> b!180163 (=> (not res!85316) (not e!118683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7601 (_ BitVec 32)) Bool)

(assert (=> b!180163 (= res!85316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5590 thiss!1248) (mask!8696 thiss!1248)))))

(declare-fun b!180164 () Bool)

(declare-datatypes ((List!2293 0))(
  ( (Nil!2290) (Cons!2289 (h!2914 (_ BitVec 64)) (t!7132 List!2293)) )
))
(declare-fun arrayNoDuplicates!0 (array!7601 (_ BitVec 32) List!2293) Bool)

(assert (=> b!180164 (= e!118683 (arrayNoDuplicates!0 (_keys!5590 thiss!1248) #b00000000000000000000000000000000 Nil!2290))))

(assert (= (and d!54069 res!85314) b!180162))

(assert (= (and b!180162 res!85315) b!180163))

(assert (= (and b!180163 res!85316) b!180164))

(declare-fun m!207725 () Bool)

(assert (=> d!54069 m!207725))

(declare-fun m!207727 () Bool)

(assert (=> b!180162 m!207727))

(declare-fun m!207729 () Bool)

(assert (=> b!180163 m!207729))

(declare-fun m!207731 () Bool)

(assert (=> b!180164 m!207731))

(assert (=> start!18102 d!54069))

(declare-fun d!54071 () Bool)

(declare-fun res!85317 () Bool)

(declare-fun e!118684 () Bool)

(assert (=> d!54071 (=> (not res!85317) (not e!118684))))

(assert (=> d!54071 (= res!85317 (simpleValid!164 (_2!1679 lt!88847)))))

(assert (=> d!54071 (= (valid!1036 (_2!1679 lt!88847)) e!118684)))

(declare-fun b!180165 () Bool)

(declare-fun res!85318 () Bool)

(assert (=> b!180165 (=> (not res!85318) (not e!118684))))

(assert (=> b!180165 (= res!85318 (= (arrayCountValidKeys!0 (_keys!5590 (_2!1679 lt!88847)) #b00000000000000000000000000000000 (size!3907 (_keys!5590 (_2!1679 lt!88847)))) (_size!1272 (_2!1679 lt!88847))))))

(declare-fun b!180166 () Bool)

(declare-fun res!85319 () Bool)

(assert (=> b!180166 (=> (not res!85319) (not e!118684))))

(assert (=> b!180166 (= res!85319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5590 (_2!1679 lt!88847)) (mask!8696 (_2!1679 lt!88847))))))

(declare-fun b!180167 () Bool)

(assert (=> b!180167 (= e!118684 (arrayNoDuplicates!0 (_keys!5590 (_2!1679 lt!88847)) #b00000000000000000000000000000000 Nil!2290))))

(assert (= (and d!54071 res!85317) b!180165))

(assert (= (and b!180165 res!85318) b!180166))

(assert (= (and b!180166 res!85319) b!180167))

(declare-fun m!207733 () Bool)

(assert (=> d!54071 m!207733))

(declare-fun m!207735 () Bool)

(assert (=> b!180165 m!207735))

(declare-fun m!207737 () Bool)

(assert (=> b!180166 m!207737))

(declare-fun m!207739 () Bool)

(assert (=> b!180167 m!207739))

(assert (=> b!180088 d!54071))

(declare-fun lt!88930 () SeekEntryResult!600)

(declare-fun e!118703 () Bool)

(declare-fun b!180202 () Bool)

(assert (=> b!180202 (= e!118703 (= (select (arr!3598 (_keys!5590 thiss!1248)) (index!4570 lt!88930)) key!828))))

(declare-fun bm!18205 () Bool)

(declare-fun call!18208 () Bool)

(declare-fun call!18211 () Bool)

(assert (=> bm!18205 (= call!18208 call!18211)))

(declare-fun b!180203 () Bool)

(declare-fun res!85342 () Bool)

(declare-fun lt!88944 () SeekEntryResult!600)

(assert (=> b!180203 (= res!85342 (= (select (arr!3598 (_keys!5590 thiss!1248)) (index!4572 lt!88944)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118705 () Bool)

(assert (=> b!180203 (=> (not res!85342) (not e!118705))))

(declare-fun b!180204 () Bool)

(declare-fun lt!88953 () tuple2!3336)

(declare-fun e!118702 () Bool)

(assert (=> b!180204 (= e!118702 (= (map!1917 (_2!1679 lt!88953)) (+!263 (map!1917 thiss!1248) (tuple2!3335 key!828 v!309))))))

(declare-fun b!180205 () Bool)

(declare-datatypes ((Unit!5457 0))(
  ( (Unit!5458) )
))
(declare-fun e!118707 () Unit!5457)

(declare-fun Unit!5459 () Unit!5457)

(assert (=> b!180205 (= e!118707 Unit!5459)))

(declare-fun b!180206 () Bool)

(declare-fun res!85345 () Bool)

(assert (=> b!180206 (=> (not res!85345) (not e!118702))))

(assert (=> b!180206 (= res!85345 (valid!1036 (_2!1679 lt!88953)))))

(declare-fun b!180207 () Bool)

(declare-fun e!118708 () Unit!5457)

(declare-fun lt!88940 () Unit!5457)

(assert (=> b!180207 (= e!118708 lt!88940)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!136 (array!7601 array!7603 (_ BitVec 32) (_ BitVec 32) V!5281 V!5281 (_ BitVec 64) Int) Unit!5457)

(assert (=> b!180207 (= lt!88940 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!136 (_keys!5590 thiss!1248) (_values!3682 thiss!1248) (mask!8696 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) key!828 (defaultEntry!3699 thiss!1248)))))

(declare-fun call!18210 () SeekEntryResult!600)

(assert (=> b!180207 (= lt!88944 call!18210)))

(declare-fun c!32273 () Bool)

(assert (=> b!180207 (= c!32273 ((_ is MissingZero!600) lt!88944))))

(declare-fun e!118701 () Bool)

(assert (=> b!180207 e!118701))

(declare-fun b!180208 () Bool)

(declare-fun c!32271 () Bool)

(assert (=> b!180208 (= c!32271 ((_ is MissingVacant!600) lt!88944))))

(declare-fun e!118704 () Bool)

(assert (=> b!180208 (= e!118701 e!118704)))

(declare-fun b!180209 () Bool)

(declare-fun Unit!5460 () Unit!5457)

(assert (=> b!180209 (= e!118707 Unit!5460)))

(declare-fun lt!88948 () Unit!5457)

(declare-fun lemmaArrayContainsKeyThenInListMap!51 (array!7601 array!7603 (_ BitVec 32) (_ BitVec 32) V!5281 V!5281 (_ BitVec 64) (_ BitVec 32) Int) Unit!5457)

(assert (=> b!180209 (= lt!88948 (lemmaArrayContainsKeyThenInListMap!51 (_keys!5590 thiss!1248) (_values!3682 thiss!1248) (mask!8696 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) key!828 #b00000000000000000000000000000000 (defaultEntry!3699 thiss!1248)))))

(assert (=> b!180209 (contains!1222 (getCurrentListMap!775 (_keys!5590 thiss!1248) (_values!3682 thiss!1248) (mask!8696 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3699 thiss!1248)) key!828)))

(declare-fun lt!88929 () Unit!5457)

(assert (=> b!180209 (= lt!88929 lt!88948)))

(assert (=> b!180209 false))

(declare-fun d!54073 () Bool)

(assert (=> d!54073 e!118702))

(declare-fun res!85343 () Bool)

(assert (=> d!54073 (=> (not res!85343) (not e!118702))))

(assert (=> d!54073 (= res!85343 (_1!1679 lt!88953))))

(assert (=> d!54073 (= lt!88953 (tuple2!3337 true (LongMapFixedSize!2447 (defaultEntry!3699 thiss!1248) (mask!8696 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) (bvadd (_size!1272 thiss!1248) #b00000000000000000000000000000001) (array!7602 (store (arr!3598 (_keys!5590 thiss!1248)) (index!4569 lt!88848) key!828) (size!3907 (_keys!5590 thiss!1248))) (array!7604 (store (arr!3599 (_values!3682 thiss!1248)) (index!4569 lt!88848) (ValueCellFull!1769 v!309)) (size!3908 (_values!3682 thiss!1248))) (_vacant!1272 thiss!1248))))))

(declare-fun lt!88928 () Unit!5457)

(declare-fun lt!88955 () Unit!5457)

(assert (=> d!54073 (= lt!88928 lt!88955)))

(declare-fun lt!88957 () array!7603)

(declare-fun lt!88954 () array!7601)

(assert (=> d!54073 (contains!1222 (getCurrentListMap!775 lt!88954 lt!88957 (mask!8696 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3699 thiss!1248)) (select (store (arr!3598 (_keys!5590 thiss!1248)) (index!4569 lt!88848) key!828) (index!4569 lt!88848)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!142 (array!7601 array!7603 (_ BitVec 32) (_ BitVec 32) V!5281 V!5281 (_ BitVec 32) Int) Unit!5457)

(assert (=> d!54073 (= lt!88955 (lemmaValidKeyInArrayIsInListMap!142 lt!88954 lt!88957 (mask!8696 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) (index!4569 lt!88848) (defaultEntry!3699 thiss!1248)))))

(assert (=> d!54073 (= lt!88957 (array!7604 (store (arr!3599 (_values!3682 thiss!1248)) (index!4569 lt!88848) (ValueCellFull!1769 v!309)) (size!3908 (_values!3682 thiss!1248))))))

(assert (=> d!54073 (= lt!88954 (array!7602 (store (arr!3598 (_keys!5590 thiss!1248)) (index!4569 lt!88848) key!828) (size!3907 (_keys!5590 thiss!1248))))))

(declare-fun lt!88943 () Unit!5457)

(declare-fun lt!88956 () Unit!5457)

(assert (=> d!54073 (= lt!88943 lt!88956)))

(declare-fun lt!88951 () array!7601)

(assert (=> d!54073 (= (arrayCountValidKeys!0 lt!88951 (index!4569 lt!88848) (bvadd (index!4569 lt!88848) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!7601 (_ BitVec 32)) Unit!5457)

(assert (=> d!54073 (= lt!88956 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!88951 (index!4569 lt!88848)))))

(assert (=> d!54073 (= lt!88951 (array!7602 (store (arr!3598 (_keys!5590 thiss!1248)) (index!4569 lt!88848) key!828) (size!3907 (_keys!5590 thiss!1248))))))

(declare-fun lt!88938 () Unit!5457)

(declare-fun lt!88933 () Unit!5457)

(assert (=> d!54073 (= lt!88938 lt!88933)))

(declare-fun lt!88949 () array!7601)

(declare-fun arrayContainsKey!0 (array!7601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> d!54073 (arrayContainsKey!0 lt!88949 key!828 #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7601 (_ BitVec 64) (_ BitVec 32)) Unit!5457)

(assert (=> d!54073 (= lt!88933 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!88949 key!828 (index!4569 lt!88848)))))

(assert (=> d!54073 (= lt!88949 (array!7602 (store (arr!3598 (_keys!5590 thiss!1248)) (index!4569 lt!88848) key!828) (size!3907 (_keys!5590 thiss!1248))))))

(declare-fun lt!88936 () Unit!5457)

(declare-fun lt!88937 () Unit!5457)

(assert (=> d!54073 (= lt!88936 lt!88937)))

(assert (=> d!54073 (= (+!263 (getCurrentListMap!775 (_keys!5590 thiss!1248) (_values!3682 thiss!1248) (mask!8696 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3699 thiss!1248)) (tuple2!3335 key!828 v!309)) (getCurrentListMap!775 (array!7602 (store (arr!3598 (_keys!5590 thiss!1248)) (index!4569 lt!88848) key!828) (size!3907 (_keys!5590 thiss!1248))) (array!7604 (store (arr!3599 (_values!3682 thiss!1248)) (index!4569 lt!88848) (ValueCellFull!1769 v!309)) (size!3908 (_values!3682 thiss!1248))) (mask!8696 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3699 thiss!1248)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!51 (array!7601 array!7603 (_ BitVec 32) (_ BitVec 32) V!5281 V!5281 (_ BitVec 32) (_ BitVec 64) V!5281 Int) Unit!5457)

(assert (=> d!54073 (= lt!88937 (lemmaAddValidKeyToArrayThenAddPairToListMap!51 (_keys!5590 thiss!1248) (_values!3682 thiss!1248) (mask!8696 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) (index!4569 lt!88848) key!828 v!309 (defaultEntry!3699 thiss!1248)))))

(declare-fun lt!88950 () Unit!5457)

(declare-fun lt!88935 () Unit!5457)

(assert (=> d!54073 (= lt!88950 lt!88935)))

(assert (=> d!54073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!7602 (store (arr!3598 (_keys!5590 thiss!1248)) (index!4569 lt!88848) key!828) (size!3907 (_keys!5590 thiss!1248))) (mask!8696 thiss!1248))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!7601 (_ BitVec 32) (_ BitVec 32)) Unit!5457)

(assert (=> d!54073 (= lt!88935 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!828 (_keys!5590 thiss!1248) (index!4569 lt!88848) (mask!8696 thiss!1248)))))

(declare-fun lt!88939 () Unit!5457)

(declare-fun lt!88952 () Unit!5457)

(assert (=> d!54073 (= lt!88939 lt!88952)))

(assert (=> d!54073 (= (arrayCountValidKeys!0 (array!7602 (store (arr!3598 (_keys!5590 thiss!1248)) (index!4569 lt!88848) key!828) (size!3907 (_keys!5590 thiss!1248))) #b00000000000000000000000000000000 (size!3907 (_keys!5590 thiss!1248))) (bvadd (arrayCountValidKeys!0 (_keys!5590 thiss!1248) #b00000000000000000000000000000000 (size!3907 (_keys!5590 thiss!1248))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!7601 (_ BitVec 32) (_ BitVec 64)) Unit!5457)

(assert (=> d!54073 (= lt!88952 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!5590 thiss!1248) (index!4569 lt!88848) key!828))))

(declare-fun lt!88945 () Unit!5457)

(declare-fun lt!88942 () Unit!5457)

(assert (=> d!54073 (= lt!88945 lt!88942)))

(declare-fun lt!88947 () List!2293)

(declare-fun lt!88931 () (_ BitVec 32))

(assert (=> d!54073 (arrayNoDuplicates!0 (array!7602 (store (arr!3598 (_keys!5590 thiss!1248)) (index!4569 lt!88848) key!828) (size!3907 (_keys!5590 thiss!1248))) lt!88931 lt!88947)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!7601 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!2293) Unit!5457)

(assert (=> d!54073 (= lt!88942 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!5590 thiss!1248) key!828 (index!4569 lt!88848) lt!88931 lt!88947))))

(assert (=> d!54073 (= lt!88947 Nil!2290)))

(assert (=> d!54073 (= lt!88931 #b00000000000000000000000000000000)))

(declare-fun lt!88946 () Unit!5457)

(assert (=> d!54073 (= lt!88946 e!118707)))

(declare-fun c!32272 () Bool)

(assert (=> d!54073 (= c!32272 (arrayContainsKey!0 (_keys!5590 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun lt!88932 () Unit!5457)

(assert (=> d!54073 (= lt!88932 e!118708)))

(declare-fun c!32274 () Bool)

(assert (=> d!54073 (= c!32274 (contains!1222 (getCurrentListMap!775 (_keys!5590 thiss!1248) (_values!3682 thiss!1248) (mask!8696 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3699 thiss!1248)) key!828))))

(assert (=> d!54073 (valid!1036 thiss!1248)))

(assert (=> d!54073 (= (updateHelperNewKey!94 thiss!1248 key!828 v!309 (index!4569 lt!88848)) lt!88953)))

(declare-fun b!180210 () Bool)

(assert (=> b!180210 (= e!118704 e!118705)))

(declare-fun res!85338 () Bool)

(assert (=> b!180210 (= res!85338 call!18208)))

(assert (=> b!180210 (=> (not res!85338) (not e!118705))))

(declare-fun b!180211 () Bool)

(declare-fun res!85346 () Bool)

(declare-fun e!118706 () Bool)

(assert (=> b!180211 (=> (not res!85346) (not e!118706))))

(assert (=> b!180211 (= res!85346 call!18208)))

(assert (=> b!180211 (= e!118701 e!118706)))

(declare-fun bm!18206 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!18206 (= call!18211 (inRange!0 (ite c!32274 (index!4570 lt!88930) (ite c!32273 (index!4569 lt!88944) (index!4572 lt!88944))) (mask!8696 thiss!1248)))))

(declare-fun b!180212 () Bool)

(declare-fun res!85339 () Bool)

(assert (=> b!180212 (=> (not res!85339) (not e!118702))))

(assert (=> b!180212 (= res!85339 (contains!1222 (map!1917 (_2!1679 lt!88953)) key!828))))

(declare-fun b!180213 () Bool)

(assert (=> b!180213 (= e!118704 ((_ is Undefined!600) lt!88944))))

(declare-fun b!180214 () Bool)

(declare-fun Unit!5461 () Unit!5457)

(assert (=> b!180214 (= e!118708 Unit!5461)))

(declare-fun lt!88934 () Unit!5457)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!141 (array!7601 array!7603 (_ BitVec 32) (_ BitVec 32) V!5281 V!5281 (_ BitVec 64) Int) Unit!5457)

(assert (=> b!180214 (= lt!88934 (lemmaInListMapThenSeekEntryOrOpenFindsIt!141 (_keys!5590 thiss!1248) (_values!3682 thiss!1248) (mask!8696 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) key!828 (defaultEntry!3699 thiss!1248)))))

(assert (=> b!180214 (= lt!88930 call!18210)))

(declare-fun res!85344 () Bool)

(assert (=> b!180214 (= res!85344 ((_ is Found!600) lt!88930))))

(assert (=> b!180214 (=> (not res!85344) (not e!118703))))

(assert (=> b!180214 e!118703))

(declare-fun lt!88941 () Unit!5457)

(assert (=> b!180214 (= lt!88941 lt!88934)))

(assert (=> b!180214 false))

(declare-fun b!180215 () Bool)

(declare-fun call!18209 () Bool)

(assert (=> b!180215 (= e!118705 (not call!18209))))

(declare-fun b!180216 () Bool)

(declare-fun res!85341 () Bool)

(assert (=> b!180216 (= res!85341 call!18211)))

(assert (=> b!180216 (=> (not res!85341) (not e!118703))))

(declare-fun b!180217 () Bool)

(declare-fun res!85340 () Bool)

(assert (=> b!180217 (=> (not res!85340) (not e!118706))))

(assert (=> b!180217 (= res!85340 (= (select (arr!3598 (_keys!5590 thiss!1248)) (index!4569 lt!88944)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18207 () Bool)

(assert (=> bm!18207 (= call!18210 (seekEntryOrOpen!0 key!828 (_keys!5590 thiss!1248) (mask!8696 thiss!1248)))))

(declare-fun b!180218 () Bool)

(assert (=> b!180218 (= e!118706 (not call!18209))))

(declare-fun bm!18208 () Bool)

(assert (=> bm!18208 (= call!18209 (arrayContainsKey!0 (_keys!5590 thiss!1248) key!828 #b00000000000000000000000000000000))))

(assert (= (and d!54073 c!32274) b!180214))

(assert (= (and d!54073 (not c!32274)) b!180207))

(assert (= (and b!180214 res!85344) b!180216))

(assert (= (and b!180216 res!85341) b!180202))

(assert (= (and b!180207 c!32273) b!180211))

(assert (= (and b!180207 (not c!32273)) b!180208))

(assert (= (and b!180211 res!85346) b!180217))

(assert (= (and b!180217 res!85340) b!180218))

(assert (= (and b!180208 c!32271) b!180210))

(assert (= (and b!180208 (not c!32271)) b!180213))

(assert (= (and b!180210 res!85338) b!180203))

(assert (= (and b!180203 res!85342) b!180215))

(assert (= (or b!180211 b!180210) bm!18205))

(assert (= (or b!180218 b!180215) bm!18208))

(assert (= (or b!180216 bm!18205) bm!18206))

(assert (= (or b!180214 b!180207) bm!18207))

(assert (= (and d!54073 c!32272) b!180209))

(assert (= (and d!54073 (not c!32272)) b!180205))

(assert (= (and d!54073 res!85343) b!180206))

(assert (= (and b!180206 res!85345) b!180212))

(assert (= (and b!180212 res!85339) b!180204))

(declare-fun m!207741 () Bool)

(assert (=> b!180206 m!207741))

(declare-fun m!207743 () Bool)

(assert (=> b!180212 m!207743))

(assert (=> b!180212 m!207743))

(declare-fun m!207745 () Bool)

(assert (=> b!180212 m!207745))

(declare-fun m!207747 () Bool)

(assert (=> b!180202 m!207747))

(assert (=> bm!18207 m!207657))

(declare-fun m!207749 () Bool)

(assert (=> bm!18208 m!207749))

(declare-fun m!207751 () Bool)

(assert (=> b!180214 m!207751))

(assert (=> b!180204 m!207743))

(assert (=> b!180204 m!207669))

(assert (=> b!180204 m!207669))

(declare-fun m!207753 () Bool)

(assert (=> b!180204 m!207753))

(declare-fun m!207755 () Bool)

(assert (=> d!54073 m!207755))

(declare-fun m!207757 () Bool)

(assert (=> d!54073 m!207757))

(declare-fun m!207759 () Bool)

(assert (=> d!54073 m!207759))

(declare-fun m!207761 () Bool)

(assert (=> d!54073 m!207761))

(declare-fun m!207763 () Bool)

(assert (=> d!54073 m!207763))

(declare-fun m!207765 () Bool)

(assert (=> d!54073 m!207765))

(declare-fun m!207767 () Bool)

(assert (=> d!54073 m!207767))

(declare-fun m!207769 () Bool)

(assert (=> d!54073 m!207769))

(declare-fun m!207771 () Bool)

(assert (=> d!54073 m!207771))

(assert (=> d!54073 m!207767))

(assert (=> d!54073 m!207763))

(declare-fun m!207773 () Bool)

(assert (=> d!54073 m!207773))

(assert (=> d!54073 m!207759))

(declare-fun m!207775 () Bool)

(assert (=> d!54073 m!207775))

(declare-fun m!207777 () Bool)

(assert (=> d!54073 m!207777))

(declare-fun m!207779 () Bool)

(assert (=> d!54073 m!207779))

(declare-fun m!207781 () Bool)

(assert (=> d!54073 m!207781))

(assert (=> d!54073 m!207727))

(declare-fun m!207783 () Bool)

(assert (=> d!54073 m!207783))

(declare-fun m!207785 () Bool)

(assert (=> d!54073 m!207785))

(declare-fun m!207787 () Bool)

(assert (=> d!54073 m!207787))

(assert (=> d!54073 m!207677))

(declare-fun m!207789 () Bool)

(assert (=> d!54073 m!207789))

(declare-fun m!207791 () Bool)

(assert (=> d!54073 m!207791))

(declare-fun m!207793 () Bool)

(assert (=> d!54073 m!207793))

(declare-fun m!207795 () Bool)

(assert (=> d!54073 m!207795))

(assert (=> d!54073 m!207759))

(assert (=> d!54073 m!207749))

(declare-fun m!207797 () Bool)

(assert (=> bm!18206 m!207797))

(declare-fun m!207799 () Bool)

(assert (=> b!180203 m!207799))

(declare-fun m!207801 () Bool)

(assert (=> b!180217 m!207801))

(declare-fun m!207803 () Bool)

(assert (=> b!180207 m!207803))

(declare-fun m!207805 () Bool)

(assert (=> b!180209 m!207805))

(assert (=> b!180209 m!207759))

(assert (=> b!180209 m!207759))

(assert (=> b!180209 m!207761))

(assert (=> b!180088 d!54073))

(declare-fun b!180231 () Bool)

(declare-fun e!118715 () SeekEntryResult!600)

(declare-fun e!118716 () SeekEntryResult!600)

(assert (=> b!180231 (= e!118715 e!118716)))

(declare-fun lt!88964 () (_ BitVec 64))

(declare-fun lt!88966 () SeekEntryResult!600)

(assert (=> b!180231 (= lt!88964 (select (arr!3598 (_keys!5590 thiss!1248)) (index!4571 lt!88966)))))

(declare-fun c!32282 () Bool)

(assert (=> b!180231 (= c!32282 (= lt!88964 key!828))))

(declare-fun b!180232 () Bool)

(declare-fun c!32281 () Bool)

(assert (=> b!180232 (= c!32281 (= lt!88964 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118717 () SeekEntryResult!600)

(assert (=> b!180232 (= e!118716 e!118717)))

(declare-fun b!180233 () Bool)

(assert (=> b!180233 (= e!118716 (Found!600 (index!4571 lt!88966)))))

(declare-fun b!180234 () Bool)

(assert (=> b!180234 (= e!118715 Undefined!600)))

(declare-fun b!180235 () Bool)

(assert (=> b!180235 (= e!118717 (MissingZero!600 (index!4571 lt!88966)))))

(declare-fun d!54075 () Bool)

(declare-fun lt!88965 () SeekEntryResult!600)

(assert (=> d!54075 (and (or ((_ is Undefined!600) lt!88965) (not ((_ is Found!600) lt!88965)) (and (bvsge (index!4570 lt!88965) #b00000000000000000000000000000000) (bvslt (index!4570 lt!88965) (size!3907 (_keys!5590 thiss!1248))))) (or ((_ is Undefined!600) lt!88965) ((_ is Found!600) lt!88965) (not ((_ is MissingZero!600) lt!88965)) (and (bvsge (index!4569 lt!88965) #b00000000000000000000000000000000) (bvslt (index!4569 lt!88965) (size!3907 (_keys!5590 thiss!1248))))) (or ((_ is Undefined!600) lt!88965) ((_ is Found!600) lt!88965) ((_ is MissingZero!600) lt!88965) (not ((_ is MissingVacant!600) lt!88965)) (and (bvsge (index!4572 lt!88965) #b00000000000000000000000000000000) (bvslt (index!4572 lt!88965) (size!3907 (_keys!5590 thiss!1248))))) (or ((_ is Undefined!600) lt!88965) (ite ((_ is Found!600) lt!88965) (= (select (arr!3598 (_keys!5590 thiss!1248)) (index!4570 lt!88965)) key!828) (ite ((_ is MissingZero!600) lt!88965) (= (select (arr!3598 (_keys!5590 thiss!1248)) (index!4569 lt!88965)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!600) lt!88965) (= (select (arr!3598 (_keys!5590 thiss!1248)) (index!4572 lt!88965)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54075 (= lt!88965 e!118715)))

(declare-fun c!32283 () Bool)

(assert (=> d!54075 (= c!32283 (and ((_ is Intermediate!600) lt!88966) (undefined!1412 lt!88966)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7601 (_ BitVec 32)) SeekEntryResult!600)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54075 (= lt!88966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8696 thiss!1248)) key!828 (_keys!5590 thiss!1248) (mask!8696 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!54075 (validMask!0 (mask!8696 thiss!1248))))

(assert (=> d!54075 (= (seekEntryOrOpen!0 key!828 (_keys!5590 thiss!1248) (mask!8696 thiss!1248)) lt!88965)))

(declare-fun b!180236 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7601 (_ BitVec 32)) SeekEntryResult!600)

(assert (=> b!180236 (= e!118717 (seekKeyOrZeroReturnVacant!0 (x!19711 lt!88966) (index!4571 lt!88966) (index!4571 lt!88966) key!828 (_keys!5590 thiss!1248) (mask!8696 thiss!1248)))))

(assert (= (and d!54075 c!32283) b!180234))

(assert (= (and d!54075 (not c!32283)) b!180231))

(assert (= (and b!180231 c!32282) b!180233))

(assert (= (and b!180231 (not c!32282)) b!180232))

(assert (= (and b!180232 c!32281) b!180235))

(assert (= (and b!180232 (not c!32281)) b!180236))

(declare-fun m!207807 () Bool)

(assert (=> b!180231 m!207807))

(declare-fun m!207809 () Bool)

(assert (=> d!54075 m!207809))

(declare-fun m!207811 () Bool)

(assert (=> d!54075 m!207811))

(declare-fun m!207813 () Bool)

(assert (=> d!54075 m!207813))

(declare-fun m!207815 () Bool)

(assert (=> d!54075 m!207815))

(declare-fun m!207817 () Bool)

(assert (=> d!54075 m!207817))

(assert (=> d!54075 m!207813))

(declare-fun m!207819 () Bool)

(assert (=> d!54075 m!207819))

(declare-fun m!207821 () Bool)

(assert (=> b!180236 m!207821))

(assert (=> b!180085 d!54075))

(declare-fun d!54077 () Bool)

(assert (=> d!54077 (= (map!1917 thiss!1248) (getCurrentListMap!775 (_keys!5590 thiss!1248) (_values!3682 thiss!1248) (mask!8696 thiss!1248) (extraKeys!3436 thiss!1248) (zeroValue!3540 thiss!1248) (minValue!3540 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3699 thiss!1248)))))

(declare-fun bs!7348 () Bool)

(assert (= bs!7348 d!54077))

(assert (=> bs!7348 m!207759))

(assert (=> bm!18184 d!54077))

(declare-fun d!54079 () Bool)

(declare-fun e!118720 () Bool)

(assert (=> d!54079 e!118720))

(declare-fun res!85352 () Bool)

(assert (=> d!54079 (=> (not res!85352) (not e!118720))))

(declare-fun lt!88978 () ListLongMap!2249)

(assert (=> d!54079 (= res!85352 (contains!1222 lt!88978 (_1!1678 (tuple2!3335 key!828 v!309))))))

(declare-fun lt!88976 () List!2290)

(assert (=> d!54079 (= lt!88978 (ListLongMap!2250 lt!88976))))

(declare-fun lt!88975 () Unit!5457)

(declare-fun lt!88977 () Unit!5457)

(assert (=> d!54079 (= lt!88975 lt!88977)))

(declare-datatypes ((Option!209 0))(
  ( (Some!208 (v!4046 V!5281)) (None!207) )
))
(declare-fun getValueByKey!203 (List!2290 (_ BitVec 64)) Option!209)

(assert (=> d!54079 (= (getValueByKey!203 lt!88976 (_1!1678 (tuple2!3335 key!828 v!309))) (Some!208 (_2!1678 (tuple2!3335 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!109 (List!2290 (_ BitVec 64) V!5281) Unit!5457)

(assert (=> d!54079 (= lt!88977 (lemmaContainsTupThenGetReturnValue!109 lt!88976 (_1!1678 (tuple2!3335 key!828 v!309)) (_2!1678 (tuple2!3335 key!828 v!309))))))

(declare-fun insertStrictlySorted!112 (List!2290 (_ BitVec 64) V!5281) List!2290)

(assert (=> d!54079 (= lt!88976 (insertStrictlySorted!112 (toList!1140 call!18186) (_1!1678 (tuple2!3335 key!828 v!309)) (_2!1678 (tuple2!3335 key!828 v!309))))))

(assert (=> d!54079 (= (+!263 call!18186 (tuple2!3335 key!828 v!309)) lt!88978)))

(declare-fun b!180241 () Bool)

(declare-fun res!85351 () Bool)

(assert (=> b!180241 (=> (not res!85351) (not e!118720))))

(assert (=> b!180241 (= res!85351 (= (getValueByKey!203 (toList!1140 lt!88978) (_1!1678 (tuple2!3335 key!828 v!309))) (Some!208 (_2!1678 (tuple2!3335 key!828 v!309)))))))

(declare-fun b!180242 () Bool)

(declare-fun contains!1224 (List!2290 tuple2!3334) Bool)

(assert (=> b!180242 (= e!118720 (contains!1224 (toList!1140 lt!88978) (tuple2!3335 key!828 v!309)))))

(assert (= (and d!54079 res!85352) b!180241))

(assert (= (and b!180241 res!85351) b!180242))

(declare-fun m!207823 () Bool)

(assert (=> d!54079 m!207823))

(declare-fun m!207825 () Bool)

(assert (=> d!54079 m!207825))

(declare-fun m!207827 () Bool)

(assert (=> d!54079 m!207827))

(declare-fun m!207829 () Bool)

(assert (=> d!54079 m!207829))

(declare-fun m!207831 () Bool)

(assert (=> b!180241 m!207831))

(declare-fun m!207833 () Bool)

(assert (=> b!180242 m!207833))

(assert (=> b!180081 d!54079))

(declare-fun d!54081 () Bool)

(declare-fun e!118725 () Bool)

(assert (=> d!54081 e!118725))

(declare-fun res!85355 () Bool)

(assert (=> d!54081 (=> res!85355 e!118725)))

(declare-fun lt!88987 () Bool)

(assert (=> d!54081 (= res!85355 (not lt!88987))))

(declare-fun lt!88990 () Bool)

(assert (=> d!54081 (= lt!88987 lt!88990)))

(declare-fun lt!88988 () Unit!5457)

(declare-fun e!118726 () Unit!5457)

(assert (=> d!54081 (= lt!88988 e!118726)))

(declare-fun c!32286 () Bool)

(assert (=> d!54081 (= c!32286 lt!88990)))

(declare-fun containsKey!207 (List!2290 (_ BitVec 64)) Bool)

(assert (=> d!54081 (= lt!88990 (containsKey!207 (toList!1140 lt!88849) key!828))))

(assert (=> d!54081 (= (contains!1222 lt!88849 key!828) lt!88987)))

(declare-fun b!180249 () Bool)

(declare-fun lt!88989 () Unit!5457)

(assert (=> b!180249 (= e!118726 lt!88989)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!156 (List!2290 (_ BitVec 64)) Unit!5457)

(assert (=> b!180249 (= lt!88989 (lemmaContainsKeyImpliesGetValueByKeyDefined!156 (toList!1140 lt!88849) key!828))))

(declare-fun isDefined!157 (Option!209) Bool)

(assert (=> b!180249 (isDefined!157 (getValueByKey!203 (toList!1140 lt!88849) key!828))))

(declare-fun b!180250 () Bool)

(declare-fun Unit!5462 () Unit!5457)

(assert (=> b!180250 (= e!118726 Unit!5462)))

(declare-fun b!180251 () Bool)

(assert (=> b!180251 (= e!118725 (isDefined!157 (getValueByKey!203 (toList!1140 lt!88849) key!828)))))

(assert (= (and d!54081 c!32286) b!180249))

(assert (= (and d!54081 (not c!32286)) b!180250))

(assert (= (and d!54081 (not res!85355)) b!180251))

(declare-fun m!207835 () Bool)

(assert (=> d!54081 m!207835))

(declare-fun m!207837 () Bool)

(assert (=> b!180249 m!207837))

(declare-fun m!207839 () Bool)

(assert (=> b!180249 m!207839))

(assert (=> b!180249 m!207839))

(declare-fun m!207841 () Bool)

(assert (=> b!180249 m!207841))

(assert (=> b!180251 m!207839))

(assert (=> b!180251 m!207839))

(assert (=> b!180251 m!207841))

(assert (=> b!180083 d!54081))

(declare-fun condMapEmpty!7243 () Bool)

(declare-fun mapDefault!7243 () ValueCell!1769)

(assert (=> mapNonEmpty!7234 (= condMapEmpty!7243 (= mapRest!7234 ((as const (Array (_ BitVec 32) ValueCell!1769)) mapDefault!7243)))))

(declare-fun e!118731 () Bool)

(declare-fun mapRes!7243 () Bool)

(assert (=> mapNonEmpty!7234 (= tp!16093 (and e!118731 mapRes!7243))))

(declare-fun mapNonEmpty!7243 () Bool)

(declare-fun tp!16108 () Bool)

(declare-fun e!118732 () Bool)

(assert (=> mapNonEmpty!7243 (= mapRes!7243 (and tp!16108 e!118732))))

(declare-fun mapKey!7243 () (_ BitVec 32))

(declare-fun mapValue!7243 () ValueCell!1769)

(declare-fun mapRest!7243 () (Array (_ BitVec 32) ValueCell!1769))

(assert (=> mapNonEmpty!7243 (= mapRest!7234 (store mapRest!7243 mapKey!7243 mapValue!7243))))

(declare-fun mapIsEmpty!7243 () Bool)

(assert (=> mapIsEmpty!7243 mapRes!7243))

(declare-fun b!180259 () Bool)

(assert (=> b!180259 (= e!118731 tp_is_empty!4225)))

(declare-fun b!180258 () Bool)

(assert (=> b!180258 (= e!118732 tp_is_empty!4225)))

(assert (= (and mapNonEmpty!7234 condMapEmpty!7243) mapIsEmpty!7243))

(assert (= (and mapNonEmpty!7234 (not condMapEmpty!7243)) mapNonEmpty!7243))

(assert (= (and mapNonEmpty!7243 ((_ is ValueCellFull!1769) mapValue!7243)) b!180258))

(assert (= (and mapNonEmpty!7234 ((_ is ValueCellFull!1769) mapDefault!7243)) b!180259))

(declare-fun m!207843 () Bool)

(assert (=> mapNonEmpty!7243 m!207843))

(check-sat (not b!180241) (not b!180212) (not d!54073) (not mapNonEmpty!7243) (not b!180242) (not b!180206) (not b!180163) (not bm!18208) (not d!54077) (not b!180249) (not b!180167) (not d!54075) (not b!180166) (not d!54071) (not d!54081) (not b!180236) (not b!180251) (not b!180209) (not d!54069) (not b!180162) (not b_next!4453) (not bm!18206) (not bm!18207) (not b!180164) (not b!180214) b_and!10961 (not d!54067) (not b!180204) (not b!180165) tp_is_empty!4225 (not d!54079) (not b!180207))
(check-sat b_and!10961 (not b_next!4453))
