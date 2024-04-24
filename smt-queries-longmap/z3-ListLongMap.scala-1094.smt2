; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22428 () Bool)

(assert start!22428)

(declare-fun b!234713 () Bool)

(declare-fun b_free!6313 () Bool)

(declare-fun b_next!6313 () Bool)

(assert (=> b!234713 (= b_free!6313 (not b_next!6313))))

(declare-fun tp!22099 () Bool)

(declare-fun b_and!13247 () Bool)

(assert (=> b!234713 (= tp!22099 b_and!13247)))

(declare-fun b!234705 () Bool)

(declare-fun e!152440 () Bool)

(declare-fun tp_is_empty!6175 () Bool)

(assert (=> b!234705 (= e!152440 tp_is_empty!6175)))

(declare-fun b!234706 () Bool)

(declare-fun e!152435 () Bool)

(declare-fun mapRes!10450 () Bool)

(assert (=> b!234706 (= e!152435 (and e!152440 mapRes!10450))))

(declare-fun condMapEmpty!10450 () Bool)

(declare-datatypes ((V!7881 0))(
  ( (V!7882 (val!3132 Int)) )
))
(declare-datatypes ((ValueCell!2744 0))(
  ( (ValueCellFull!2744 (v!5158 V!7881)) (EmptyCell!2744) )
))
(declare-datatypes ((array!11601 0))(
  ( (array!11602 (arr!5515 (Array (_ BitVec 32) ValueCell!2744)) (size!5851 (_ BitVec 32))) )
))
(declare-datatypes ((array!11603 0))(
  ( (array!11604 (arr!5516 (Array (_ BitVec 32) (_ BitVec 64))) (size!5852 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3388 0))(
  ( (LongMapFixedSize!3389 (defaultEntry!4361 Int) (mask!10315 (_ BitVec 32)) (extraKeys!4098 (_ BitVec 32)) (zeroValue!4202 V!7881) (minValue!4202 V!7881) (_size!1743 (_ BitVec 32)) (_keys!6429 array!11603) (_values!4344 array!11601) (_vacant!1743 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3388)

(declare-fun mapDefault!10450 () ValueCell!2744)

(assert (=> b!234706 (= condMapEmpty!10450 (= (arr!5515 (_values!4344 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2744)) mapDefault!10450)))))

(declare-fun b!234707 () Bool)

(declare-fun res!115112 () Bool)

(declare-fun e!152438 () Bool)

(assert (=> b!234707 (=> (not res!115112) (not e!152438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!234707 (= res!115112 (validMask!0 (mask!10315 thiss!1504)))))

(declare-fun res!115110 () Bool)

(declare-fun e!152437 () Bool)

(assert (=> start!22428 (=> (not res!115110) (not e!152437))))

(declare-fun valid!1352 (LongMapFixedSize!3388) Bool)

(assert (=> start!22428 (= res!115110 (valid!1352 thiss!1504))))

(assert (=> start!22428 e!152437))

(declare-fun e!152436 () Bool)

(assert (=> start!22428 e!152436))

(assert (=> start!22428 true))

(declare-fun b!234708 () Bool)

(assert (=> b!234708 (= e!152438 (and (= (size!5851 (_values!4344 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10315 thiss!1504))) (= (size!5852 (_keys!6429 thiss!1504)) (size!5851 (_values!4344 thiss!1504))) (bvsge (mask!10315 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4098 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4098 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!234709 () Bool)

(declare-fun res!115113 () Bool)

(assert (=> b!234709 (=> (not res!115113) (not e!152438))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4550 0))(
  ( (tuple2!4551 (_1!2286 (_ BitVec 64)) (_2!2286 V!7881)) )
))
(declare-datatypes ((List!3451 0))(
  ( (Nil!3448) (Cons!3447 (h!4098 tuple2!4550) (t!8412 List!3451)) )
))
(declare-datatypes ((ListLongMap!3465 0))(
  ( (ListLongMap!3466 (toList!1748 List!3451)) )
))
(declare-fun contains!1636 (ListLongMap!3465 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1280 (array!11603 array!11601 (_ BitVec 32) (_ BitVec 32) V!7881 V!7881 (_ BitVec 32) Int) ListLongMap!3465)

(assert (=> b!234709 (= res!115113 (contains!1636 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)) key!932))))

(declare-fun b!234710 () Bool)

(declare-fun res!115114 () Bool)

(assert (=> b!234710 (=> (not res!115114) (not e!152437))))

(assert (=> b!234710 (= res!115114 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234711 () Bool)

(assert (=> b!234711 (= e!152437 e!152438)))

(declare-fun res!115111 () Bool)

(assert (=> b!234711 (=> (not res!115111) (not e!152438))))

(declare-datatypes ((SeekEntryResult!954 0))(
  ( (MissingZero!954 (index!5986 (_ BitVec 32))) (Found!954 (index!5987 (_ BitVec 32))) (Intermediate!954 (undefined!1766 Bool) (index!5988 (_ BitVec 32)) (x!23696 (_ BitVec 32))) (Undefined!954) (MissingVacant!954 (index!5989 (_ BitVec 32))) )
))
(declare-fun lt!118777 () SeekEntryResult!954)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!234711 (= res!115111 (or (= lt!118777 (MissingZero!954 index!297)) (= lt!118777 (MissingVacant!954 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11603 (_ BitVec 32)) SeekEntryResult!954)

(assert (=> b!234711 (= lt!118777 (seekEntryOrOpen!0 key!932 (_keys!6429 thiss!1504) (mask!10315 thiss!1504)))))

(declare-fun b!234712 () Bool)

(declare-fun e!152439 () Bool)

(assert (=> b!234712 (= e!152439 tp_is_empty!6175)))

(declare-fun mapNonEmpty!10450 () Bool)

(declare-fun tp!22098 () Bool)

(assert (=> mapNonEmpty!10450 (= mapRes!10450 (and tp!22098 e!152439))))

(declare-fun mapValue!10450 () ValueCell!2744)

(declare-fun mapKey!10450 () (_ BitVec 32))

(declare-fun mapRest!10450 () (Array (_ BitVec 32) ValueCell!2744))

(assert (=> mapNonEmpty!10450 (= (arr!5515 (_values!4344 thiss!1504)) (store mapRest!10450 mapKey!10450 mapValue!10450))))

(declare-fun mapIsEmpty!10450 () Bool)

(assert (=> mapIsEmpty!10450 mapRes!10450))

(declare-fun array_inv!3617 (array!11603) Bool)

(declare-fun array_inv!3618 (array!11601) Bool)

(assert (=> b!234713 (= e!152436 (and tp!22099 tp_is_empty!6175 (array_inv!3617 (_keys!6429 thiss!1504)) (array_inv!3618 (_values!4344 thiss!1504)) e!152435))))

(assert (= (and start!22428 res!115110) b!234710))

(assert (= (and b!234710 res!115114) b!234711))

(assert (= (and b!234711 res!115111) b!234709))

(assert (= (and b!234709 res!115113) b!234707))

(assert (= (and b!234707 res!115112) b!234708))

(assert (= (and b!234706 condMapEmpty!10450) mapIsEmpty!10450))

(assert (= (and b!234706 (not condMapEmpty!10450)) mapNonEmpty!10450))

(get-info :version)

(assert (= (and mapNonEmpty!10450 ((_ is ValueCellFull!2744) mapValue!10450)) b!234712))

(assert (= (and b!234706 ((_ is ValueCellFull!2744) mapDefault!10450)) b!234705))

(assert (= b!234713 b!234706))

(assert (= start!22428 b!234713))

(declare-fun m!256111 () Bool)

(assert (=> b!234711 m!256111))

(declare-fun m!256113 () Bool)

(assert (=> start!22428 m!256113))

(declare-fun m!256115 () Bool)

(assert (=> b!234709 m!256115))

(assert (=> b!234709 m!256115))

(declare-fun m!256117 () Bool)

(assert (=> b!234709 m!256117))

(declare-fun m!256119 () Bool)

(assert (=> mapNonEmpty!10450 m!256119))

(declare-fun m!256121 () Bool)

(assert (=> b!234713 m!256121))

(declare-fun m!256123 () Bool)

(assert (=> b!234713 m!256123))

(declare-fun m!256125 () Bool)

(assert (=> b!234707 m!256125))

(check-sat (not b!234707) (not mapNonEmpty!10450) (not b!234711) (not start!22428) (not b!234713) b_and!13247 (not b_next!6313) (not b!234709) tp_is_empty!6175)
(check-sat b_and!13247 (not b_next!6313))
(get-model)

(declare-fun d!59239 () Bool)

(assert (=> d!59239 (= (validMask!0 (mask!10315 thiss!1504)) (and (or (= (mask!10315 thiss!1504) #b00000000000000000000000000000111) (= (mask!10315 thiss!1504) #b00000000000000000000000000001111) (= (mask!10315 thiss!1504) #b00000000000000000000000000011111) (= (mask!10315 thiss!1504) #b00000000000000000000000000111111) (= (mask!10315 thiss!1504) #b00000000000000000000000001111111) (= (mask!10315 thiss!1504) #b00000000000000000000000011111111) (= (mask!10315 thiss!1504) #b00000000000000000000000111111111) (= (mask!10315 thiss!1504) #b00000000000000000000001111111111) (= (mask!10315 thiss!1504) #b00000000000000000000011111111111) (= (mask!10315 thiss!1504) #b00000000000000000000111111111111) (= (mask!10315 thiss!1504) #b00000000000000000001111111111111) (= (mask!10315 thiss!1504) #b00000000000000000011111111111111) (= (mask!10315 thiss!1504) #b00000000000000000111111111111111) (= (mask!10315 thiss!1504) #b00000000000000001111111111111111) (= (mask!10315 thiss!1504) #b00000000000000011111111111111111) (= (mask!10315 thiss!1504) #b00000000000000111111111111111111) (= (mask!10315 thiss!1504) #b00000000000001111111111111111111) (= (mask!10315 thiss!1504) #b00000000000011111111111111111111) (= (mask!10315 thiss!1504) #b00000000000111111111111111111111) (= (mask!10315 thiss!1504) #b00000000001111111111111111111111) (= (mask!10315 thiss!1504) #b00000000011111111111111111111111) (= (mask!10315 thiss!1504) #b00000000111111111111111111111111) (= (mask!10315 thiss!1504) #b00000001111111111111111111111111) (= (mask!10315 thiss!1504) #b00000011111111111111111111111111) (= (mask!10315 thiss!1504) #b00000111111111111111111111111111) (= (mask!10315 thiss!1504) #b00001111111111111111111111111111) (= (mask!10315 thiss!1504) #b00011111111111111111111111111111) (= (mask!10315 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10315 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!234707 d!59239))

(declare-fun d!59241 () Bool)

(declare-fun res!115151 () Bool)

(declare-fun e!152486 () Bool)

(assert (=> d!59241 (=> (not res!115151) (not e!152486))))

(declare-fun simpleValid!231 (LongMapFixedSize!3388) Bool)

(assert (=> d!59241 (= res!115151 (simpleValid!231 thiss!1504))))

(assert (=> d!59241 (= (valid!1352 thiss!1504) e!152486)))

(declare-fun b!234774 () Bool)

(declare-fun res!115152 () Bool)

(assert (=> b!234774 (=> (not res!115152) (not e!152486))))

(declare-fun arrayCountValidKeys!0 (array!11603 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!234774 (= res!115152 (= (arrayCountValidKeys!0 (_keys!6429 thiss!1504) #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))) (_size!1743 thiss!1504)))))

(declare-fun b!234775 () Bool)

(declare-fun res!115153 () Bool)

(assert (=> b!234775 (=> (not res!115153) (not e!152486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11603 (_ BitVec 32)) Bool)

(assert (=> b!234775 (= res!115153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6429 thiss!1504) (mask!10315 thiss!1504)))))

(declare-fun b!234776 () Bool)

(declare-datatypes ((List!3452 0))(
  ( (Nil!3449) (Cons!3448 (h!4099 (_ BitVec 64)) (t!8415 List!3452)) )
))
(declare-fun arrayNoDuplicates!0 (array!11603 (_ BitVec 32) List!3452) Bool)

(assert (=> b!234776 (= e!152486 (arrayNoDuplicates!0 (_keys!6429 thiss!1504) #b00000000000000000000000000000000 Nil!3449))))

(assert (= (and d!59241 res!115151) b!234774))

(assert (= (and b!234774 res!115152) b!234775))

(assert (= (and b!234775 res!115153) b!234776))

(declare-fun m!256159 () Bool)

(assert (=> d!59241 m!256159))

(declare-fun m!256161 () Bool)

(assert (=> b!234774 m!256161))

(declare-fun m!256163 () Bool)

(assert (=> b!234775 m!256163))

(declare-fun m!256165 () Bool)

(assert (=> b!234776 m!256165))

(assert (=> start!22428 d!59241))

(declare-fun d!59243 () Bool)

(declare-fun e!152491 () Bool)

(assert (=> d!59243 e!152491))

(declare-fun res!115156 () Bool)

(assert (=> d!59243 (=> res!115156 e!152491)))

(declare-fun lt!118795 () Bool)

(assert (=> d!59243 (= res!115156 (not lt!118795))))

(declare-fun lt!118792 () Bool)

(assert (=> d!59243 (= lt!118795 lt!118792)))

(declare-datatypes ((Unit!7231 0))(
  ( (Unit!7232) )
))
(declare-fun lt!118793 () Unit!7231)

(declare-fun e!152492 () Unit!7231)

(assert (=> d!59243 (= lt!118793 e!152492)))

(declare-fun c!39106 () Bool)

(assert (=> d!59243 (= c!39106 lt!118792)))

(declare-fun containsKey!258 (List!3451 (_ BitVec 64)) Bool)

(assert (=> d!59243 (= lt!118792 (containsKey!258 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932))))

(assert (=> d!59243 (= (contains!1636 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)) key!932) lt!118795)))

(declare-fun b!234783 () Bool)

(declare-fun lt!118794 () Unit!7231)

(assert (=> b!234783 (= e!152492 lt!118794)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!206 (List!3451 (_ BitVec 64)) Unit!7231)

(assert (=> b!234783 (= lt!118794 (lemmaContainsKeyImpliesGetValueByKeyDefined!206 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932))))

(declare-datatypes ((Option!273 0))(
  ( (Some!272 (v!5161 V!7881)) (None!271) )
))
(declare-fun isDefined!207 (Option!273) Bool)

(declare-fun getValueByKey!267 (List!3451 (_ BitVec 64)) Option!273)

(assert (=> b!234783 (isDefined!207 (getValueByKey!267 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932))))

(declare-fun b!234784 () Bool)

(declare-fun Unit!7233 () Unit!7231)

(assert (=> b!234784 (= e!152492 Unit!7233)))

(declare-fun b!234785 () Bool)

(assert (=> b!234785 (= e!152491 (isDefined!207 (getValueByKey!267 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932)))))

(assert (= (and d!59243 c!39106) b!234783))

(assert (= (and d!59243 (not c!39106)) b!234784))

(assert (= (and d!59243 (not res!115156)) b!234785))

(declare-fun m!256167 () Bool)

(assert (=> d!59243 m!256167))

(declare-fun m!256169 () Bool)

(assert (=> b!234783 m!256169))

(declare-fun m!256171 () Bool)

(assert (=> b!234783 m!256171))

(assert (=> b!234783 m!256171))

(declare-fun m!256173 () Bool)

(assert (=> b!234783 m!256173))

(assert (=> b!234785 m!256171))

(assert (=> b!234785 m!256171))

(assert (=> b!234785 m!256173))

(assert (=> b!234709 d!59243))

(declare-fun b!234828 () Bool)

(declare-fun e!152519 () ListLongMap!3465)

(declare-fun call!21827 () ListLongMap!3465)

(assert (=> b!234828 (= e!152519 call!21827)))

(declare-fun bm!21819 () Bool)

(declare-fun call!21828 () ListLongMap!3465)

(assert (=> bm!21819 (= call!21827 call!21828)))

(declare-fun b!234829 () Bool)

(declare-fun e!152525 () Bool)

(declare-fun lt!118855 () ListLongMap!3465)

(declare-fun apply!208 (ListLongMap!3465 (_ BitVec 64)) V!7881)

(assert (=> b!234829 (= e!152525 (= (apply!208 lt!118855 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4202 thiss!1504)))))

(declare-fun b!234830 () Bool)

(declare-fun e!152531 () Bool)

(declare-fun call!21822 () Bool)

(assert (=> b!234830 (= e!152531 (not call!21822))))

(declare-fun bm!21820 () Bool)

(declare-fun call!21825 () ListLongMap!3465)

(declare-fun getCurrentListMapNoExtraKeys!524 (array!11603 array!11601 (_ BitVec 32) (_ BitVec 32) V!7881 V!7881 (_ BitVec 32) Int) ListLongMap!3465)

(assert (=> bm!21820 (= call!21825 (getCurrentListMapNoExtraKeys!524 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))))

(declare-fun b!234831 () Bool)

(declare-fun e!152530 () ListLongMap!3465)

(declare-fun +!635 (ListLongMap!3465 tuple2!4550) ListLongMap!3465)

(assert (=> b!234831 (= e!152530 (+!635 call!21828 (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))))

(declare-fun b!234832 () Bool)

(declare-fun e!152522 () Bool)

(assert (=> b!234832 (= e!152522 e!152525)))

(declare-fun res!115181 () Bool)

(declare-fun call!21824 () Bool)

(assert (=> b!234832 (= res!115181 call!21824)))

(assert (=> b!234832 (=> (not res!115181) (not e!152525))))

(declare-fun b!234833 () Bool)

(declare-fun e!152529 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!234833 (= e!152529 (validKeyInArray!0 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234834 () Bool)

(declare-fun c!39122 () Bool)

(assert (=> b!234834 (= c!39122 (and (not (= (bvand (extraKeys!4098 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4098 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!152528 () ListLongMap!3465)

(assert (=> b!234834 (= e!152528 e!152519)))

(declare-fun bm!21821 () Bool)

(declare-fun call!21826 () ListLongMap!3465)

(declare-fun call!21823 () ListLongMap!3465)

(assert (=> bm!21821 (= call!21826 call!21823)))

(declare-fun c!39124 () Bool)

(declare-fun c!39123 () Bool)

(declare-fun bm!21822 () Bool)

(assert (=> bm!21822 (= call!21828 (+!635 (ite c!39123 call!21825 (ite c!39124 call!21823 call!21826)) (ite (or c!39123 c!39124) (tuple2!4551 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))))))

(declare-fun bm!21823 () Bool)

(assert (=> bm!21823 (= call!21824 (contains!1636 lt!118855 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234836 () Bool)

(declare-fun e!152527 () Unit!7231)

(declare-fun lt!118840 () Unit!7231)

(assert (=> b!234836 (= e!152527 lt!118840)))

(declare-fun lt!118845 () ListLongMap!3465)

(assert (=> b!234836 (= lt!118845 (getCurrentListMapNoExtraKeys!524 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))))

(declare-fun lt!118859 () (_ BitVec 64))

(assert (=> b!234836 (= lt!118859 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118856 () (_ BitVec 64))

(assert (=> b!234836 (= lt!118856 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118850 () Unit!7231)

(declare-fun addStillContains!184 (ListLongMap!3465 (_ BitVec 64) V!7881 (_ BitVec 64)) Unit!7231)

(assert (=> b!234836 (= lt!118850 (addStillContains!184 lt!118845 lt!118859 (zeroValue!4202 thiss!1504) lt!118856))))

(assert (=> b!234836 (contains!1636 (+!635 lt!118845 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504))) lt!118856)))

(declare-fun lt!118841 () Unit!7231)

(assert (=> b!234836 (= lt!118841 lt!118850)))

(declare-fun lt!118858 () ListLongMap!3465)

(assert (=> b!234836 (= lt!118858 (getCurrentListMapNoExtraKeys!524 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))))

(declare-fun lt!118843 () (_ BitVec 64))

(assert (=> b!234836 (= lt!118843 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118854 () (_ BitVec 64))

(assert (=> b!234836 (= lt!118854 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118853 () Unit!7231)

(declare-fun addApplyDifferent!184 (ListLongMap!3465 (_ BitVec 64) V!7881 (_ BitVec 64)) Unit!7231)

(assert (=> b!234836 (= lt!118853 (addApplyDifferent!184 lt!118858 lt!118843 (minValue!4202 thiss!1504) lt!118854))))

(assert (=> b!234836 (= (apply!208 (+!635 lt!118858 (tuple2!4551 lt!118843 (minValue!4202 thiss!1504))) lt!118854) (apply!208 lt!118858 lt!118854))))

(declare-fun lt!118847 () Unit!7231)

(assert (=> b!234836 (= lt!118847 lt!118853)))

(declare-fun lt!118842 () ListLongMap!3465)

(assert (=> b!234836 (= lt!118842 (getCurrentListMapNoExtraKeys!524 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))))

(declare-fun lt!118844 () (_ BitVec 64))

(assert (=> b!234836 (= lt!118844 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118848 () (_ BitVec 64))

(assert (=> b!234836 (= lt!118848 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118852 () Unit!7231)

(assert (=> b!234836 (= lt!118852 (addApplyDifferent!184 lt!118842 lt!118844 (zeroValue!4202 thiss!1504) lt!118848))))

(assert (=> b!234836 (= (apply!208 (+!635 lt!118842 (tuple2!4551 lt!118844 (zeroValue!4202 thiss!1504))) lt!118848) (apply!208 lt!118842 lt!118848))))

(declare-fun lt!118851 () Unit!7231)

(assert (=> b!234836 (= lt!118851 lt!118852)))

(declare-fun lt!118860 () ListLongMap!3465)

(assert (=> b!234836 (= lt!118860 (getCurrentListMapNoExtraKeys!524 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))))

(declare-fun lt!118861 () (_ BitVec 64))

(assert (=> b!234836 (= lt!118861 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118857 () (_ BitVec 64))

(assert (=> b!234836 (= lt!118857 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234836 (= lt!118840 (addApplyDifferent!184 lt!118860 lt!118861 (minValue!4202 thiss!1504) lt!118857))))

(assert (=> b!234836 (= (apply!208 (+!635 lt!118860 (tuple2!4551 lt!118861 (minValue!4202 thiss!1504))) lt!118857) (apply!208 lt!118860 lt!118857))))

(declare-fun b!234837 () Bool)

(declare-fun Unit!7234 () Unit!7231)

(assert (=> b!234837 (= e!152527 Unit!7234)))

(declare-fun b!234838 () Bool)

(declare-fun e!152520 () Bool)

(assert (=> b!234838 (= e!152520 e!152522)))

(declare-fun c!39121 () Bool)

(assert (=> b!234838 (= c!39121 (not (= (bvand (extraKeys!4098 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!234839 () Bool)

(declare-fun e!152526 () Bool)

(declare-fun get!2840 (ValueCell!2744 V!7881) V!7881)

(declare-fun dynLambda!551 (Int (_ BitVec 64)) V!7881)

(assert (=> b!234839 (= e!152526 (= (apply!208 lt!118855 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)) (get!2840 (select (arr!5515 (_values!4344 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4361 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!234839 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5851 (_values!4344 thiss!1504))))))

(assert (=> b!234839 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))))))

(declare-fun b!234840 () Bool)

(assert (=> b!234840 (= e!152519 call!21826)))

(declare-fun b!234841 () Bool)

(declare-fun e!152521 () Bool)

(assert (=> b!234841 (= e!152531 e!152521)))

(declare-fun res!115177 () Bool)

(assert (=> b!234841 (= res!115177 call!21822)))

(assert (=> b!234841 (=> (not res!115177) (not e!152521))))

(declare-fun b!234842 () Bool)

(declare-fun e!152524 () Bool)

(assert (=> b!234842 (= e!152524 (validKeyInArray!0 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234843 () Bool)

(declare-fun res!115176 () Bool)

(assert (=> b!234843 (=> (not res!115176) (not e!152520))))

(assert (=> b!234843 (= res!115176 e!152531)))

(declare-fun c!39120 () Bool)

(assert (=> b!234843 (= c!39120 (not (= (bvand (extraKeys!4098 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!234844 () Bool)

(declare-fun e!152523 () Bool)

(assert (=> b!234844 (= e!152523 e!152526)))

(declare-fun res!115182 () Bool)

(assert (=> b!234844 (=> (not res!115182) (not e!152526))))

(assert (=> b!234844 (= res!115182 (contains!1636 lt!118855 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234844 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))))))

(declare-fun b!234845 () Bool)

(declare-fun res!115178 () Bool)

(assert (=> b!234845 (=> (not res!115178) (not e!152520))))

(assert (=> b!234845 (= res!115178 e!152523)))

(declare-fun res!115183 () Bool)

(assert (=> b!234845 (=> res!115183 e!152523)))

(assert (=> b!234845 (= res!115183 (not e!152524))))

(declare-fun res!115179 () Bool)

(assert (=> b!234845 (=> (not res!115179) (not e!152524))))

(assert (=> b!234845 (= res!115179 (bvslt #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))))))

(declare-fun b!234846 () Bool)

(assert (=> b!234846 (= e!152528 call!21827)))

(declare-fun bm!21824 () Bool)

(assert (=> bm!21824 (= call!21823 call!21825)))

(declare-fun bm!21825 () Bool)

(assert (=> bm!21825 (= call!21822 (contains!1636 lt!118855 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!59245 () Bool)

(assert (=> d!59245 e!152520))

(declare-fun res!115180 () Bool)

(assert (=> d!59245 (=> (not res!115180) (not e!152520))))

(assert (=> d!59245 (= res!115180 (or (bvsge #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))))))))

(declare-fun lt!118849 () ListLongMap!3465)

(assert (=> d!59245 (= lt!118855 lt!118849)))

(declare-fun lt!118846 () Unit!7231)

(assert (=> d!59245 (= lt!118846 e!152527)))

(declare-fun c!39119 () Bool)

(assert (=> d!59245 (= c!39119 e!152529)))

(declare-fun res!115175 () Bool)

(assert (=> d!59245 (=> (not res!115175) (not e!152529))))

(assert (=> d!59245 (= res!115175 (bvslt #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))))))

(assert (=> d!59245 (= lt!118849 e!152530)))

(assert (=> d!59245 (= c!39123 (and (not (= (bvand (extraKeys!4098 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4098 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59245 (validMask!0 (mask!10315 thiss!1504))))

(assert (=> d!59245 (= (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)) lt!118855)))

(declare-fun b!234835 () Bool)

(assert (=> b!234835 (= e!152530 e!152528)))

(assert (=> b!234835 (= c!39124 (and (not (= (bvand (extraKeys!4098 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4098 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!234847 () Bool)

(assert (=> b!234847 (= e!152522 (not call!21824))))

(declare-fun b!234848 () Bool)

(assert (=> b!234848 (= e!152521 (= (apply!208 lt!118855 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4202 thiss!1504)))))

(assert (= (and d!59245 c!39123) b!234831))

(assert (= (and d!59245 (not c!39123)) b!234835))

(assert (= (and b!234835 c!39124) b!234846))

(assert (= (and b!234835 (not c!39124)) b!234834))

(assert (= (and b!234834 c!39122) b!234828))

(assert (= (and b!234834 (not c!39122)) b!234840))

(assert (= (or b!234828 b!234840) bm!21821))

(assert (= (or b!234846 bm!21821) bm!21824))

(assert (= (or b!234846 b!234828) bm!21819))

(assert (= (or b!234831 bm!21824) bm!21820))

(assert (= (or b!234831 bm!21819) bm!21822))

(assert (= (and d!59245 res!115175) b!234833))

(assert (= (and d!59245 c!39119) b!234836))

(assert (= (and d!59245 (not c!39119)) b!234837))

(assert (= (and d!59245 res!115180) b!234845))

(assert (= (and b!234845 res!115179) b!234842))

(assert (= (and b!234845 (not res!115183)) b!234844))

(assert (= (and b!234844 res!115182) b!234839))

(assert (= (and b!234845 res!115178) b!234843))

(assert (= (and b!234843 c!39120) b!234841))

(assert (= (and b!234843 (not c!39120)) b!234830))

(assert (= (and b!234841 res!115177) b!234848))

(assert (= (or b!234841 b!234830) bm!21825))

(assert (= (and b!234843 res!115176) b!234838))

(assert (= (and b!234838 c!39121) b!234832))

(assert (= (and b!234838 (not c!39121)) b!234847))

(assert (= (and b!234832 res!115181) b!234829))

(assert (= (or b!234832 b!234847) bm!21823))

(declare-fun b_lambda!7909 () Bool)

(assert (=> (not b_lambda!7909) (not b!234839)))

(declare-fun t!8414 () Bool)

(declare-fun tb!2921 () Bool)

(assert (=> (and b!234713 (= (defaultEntry!4361 thiss!1504) (defaultEntry!4361 thiss!1504)) t!8414) tb!2921))

(declare-fun result!5101 () Bool)

(assert (=> tb!2921 (= result!5101 tp_is_empty!6175)))

(assert (=> b!234839 t!8414))

(declare-fun b_and!13253 () Bool)

(assert (= b_and!13247 (and (=> t!8414 result!5101) b_and!13253)))

(declare-fun m!256175 () Bool)

(assert (=> b!234839 m!256175))

(declare-fun m!256177 () Bool)

(assert (=> b!234839 m!256177))

(assert (=> b!234839 m!256175))

(declare-fun m!256179 () Bool)

(assert (=> b!234839 m!256179))

(assert (=> b!234839 m!256177))

(declare-fun m!256181 () Bool)

(assert (=> b!234839 m!256181))

(declare-fun m!256183 () Bool)

(assert (=> b!234839 m!256183))

(assert (=> b!234839 m!256181))

(assert (=> d!59245 m!256125))

(declare-fun m!256185 () Bool)

(assert (=> b!234831 m!256185))

(assert (=> b!234833 m!256175))

(assert (=> b!234833 m!256175))

(declare-fun m!256187 () Bool)

(assert (=> b!234833 m!256187))

(assert (=> b!234844 m!256175))

(assert (=> b!234844 m!256175))

(declare-fun m!256189 () Bool)

(assert (=> b!234844 m!256189))

(declare-fun m!256191 () Bool)

(assert (=> bm!21820 m!256191))

(declare-fun m!256193 () Bool)

(assert (=> b!234829 m!256193))

(declare-fun m!256195 () Bool)

(assert (=> bm!21825 m!256195))

(assert (=> b!234836 m!256175))

(declare-fun m!256197 () Bool)

(assert (=> b!234836 m!256197))

(declare-fun m!256199 () Bool)

(assert (=> b!234836 m!256199))

(declare-fun m!256201 () Bool)

(assert (=> b!234836 m!256201))

(declare-fun m!256203 () Bool)

(assert (=> b!234836 m!256203))

(assert (=> b!234836 m!256191))

(declare-fun m!256205 () Bool)

(assert (=> b!234836 m!256205))

(declare-fun m!256207 () Bool)

(assert (=> b!234836 m!256207))

(declare-fun m!256209 () Bool)

(assert (=> b!234836 m!256209))

(assert (=> b!234836 m!256201))

(declare-fun m!256211 () Bool)

(assert (=> b!234836 m!256211))

(assert (=> b!234836 m!256197))

(declare-fun m!256213 () Bool)

(assert (=> b!234836 m!256213))

(declare-fun m!256215 () Bool)

(assert (=> b!234836 m!256215))

(declare-fun m!256217 () Bool)

(assert (=> b!234836 m!256217))

(assert (=> b!234836 m!256217))

(declare-fun m!256219 () Bool)

(assert (=> b!234836 m!256219))

(declare-fun m!256221 () Bool)

(assert (=> b!234836 m!256221))

(declare-fun m!256223 () Bool)

(assert (=> b!234836 m!256223))

(assert (=> b!234836 m!256223))

(declare-fun m!256225 () Bool)

(assert (=> b!234836 m!256225))

(declare-fun m!256227 () Bool)

(assert (=> bm!21823 m!256227))

(declare-fun m!256229 () Bool)

(assert (=> b!234848 m!256229))

(assert (=> b!234842 m!256175))

(assert (=> b!234842 m!256175))

(assert (=> b!234842 m!256187))

(declare-fun m!256231 () Bool)

(assert (=> bm!21822 m!256231))

(assert (=> b!234709 d!59245))

(declare-fun d!59247 () Bool)

(assert (=> d!59247 (= (array_inv!3617 (_keys!6429 thiss!1504)) (bvsge (size!5852 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234713 d!59247))

(declare-fun d!59249 () Bool)

(assert (=> d!59249 (= (array_inv!3618 (_values!4344 thiss!1504)) (bvsge (size!5851 (_values!4344 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234713 d!59249))

(declare-fun b!234863 () Bool)

(declare-fun e!152538 () SeekEntryResult!954)

(declare-fun lt!118869 () SeekEntryResult!954)

(assert (=> b!234863 (= e!152538 (Found!954 (index!5988 lt!118869)))))

(declare-fun b!234864 () Bool)

(declare-fun e!152539 () SeekEntryResult!954)

(assert (=> b!234864 (= e!152539 e!152538)))

(declare-fun lt!118868 () (_ BitVec 64))

(assert (=> b!234864 (= lt!118868 (select (arr!5516 (_keys!6429 thiss!1504)) (index!5988 lt!118869)))))

(declare-fun c!39131 () Bool)

(assert (=> b!234864 (= c!39131 (= lt!118868 key!932))))

(declare-fun b!234865 () Bool)

(declare-fun c!39133 () Bool)

(assert (=> b!234865 (= c!39133 (= lt!118868 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!152540 () SeekEntryResult!954)

(assert (=> b!234865 (= e!152538 e!152540)))

(declare-fun b!234866 () Bool)

(assert (=> b!234866 (= e!152540 (MissingZero!954 (index!5988 lt!118869)))))

(declare-fun d!59251 () Bool)

(declare-fun lt!118870 () SeekEntryResult!954)

(assert (=> d!59251 (and (or ((_ is Undefined!954) lt!118870) (not ((_ is Found!954) lt!118870)) (and (bvsge (index!5987 lt!118870) #b00000000000000000000000000000000) (bvslt (index!5987 lt!118870) (size!5852 (_keys!6429 thiss!1504))))) (or ((_ is Undefined!954) lt!118870) ((_ is Found!954) lt!118870) (not ((_ is MissingZero!954) lt!118870)) (and (bvsge (index!5986 lt!118870) #b00000000000000000000000000000000) (bvslt (index!5986 lt!118870) (size!5852 (_keys!6429 thiss!1504))))) (or ((_ is Undefined!954) lt!118870) ((_ is Found!954) lt!118870) ((_ is MissingZero!954) lt!118870) (not ((_ is MissingVacant!954) lt!118870)) (and (bvsge (index!5989 lt!118870) #b00000000000000000000000000000000) (bvslt (index!5989 lt!118870) (size!5852 (_keys!6429 thiss!1504))))) (or ((_ is Undefined!954) lt!118870) (ite ((_ is Found!954) lt!118870) (= (select (arr!5516 (_keys!6429 thiss!1504)) (index!5987 lt!118870)) key!932) (ite ((_ is MissingZero!954) lt!118870) (= (select (arr!5516 (_keys!6429 thiss!1504)) (index!5986 lt!118870)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!954) lt!118870) (= (select (arr!5516 (_keys!6429 thiss!1504)) (index!5989 lt!118870)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59251 (= lt!118870 e!152539)))

(declare-fun c!39132 () Bool)

(assert (=> d!59251 (= c!39132 (and ((_ is Intermediate!954) lt!118869) (undefined!1766 lt!118869)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11603 (_ BitVec 32)) SeekEntryResult!954)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59251 (= lt!118869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10315 thiss!1504)) key!932 (_keys!6429 thiss!1504) (mask!10315 thiss!1504)))))

(assert (=> d!59251 (validMask!0 (mask!10315 thiss!1504))))

(assert (=> d!59251 (= (seekEntryOrOpen!0 key!932 (_keys!6429 thiss!1504) (mask!10315 thiss!1504)) lt!118870)))

(declare-fun b!234867 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11603 (_ BitVec 32)) SeekEntryResult!954)

(assert (=> b!234867 (= e!152540 (seekKeyOrZeroReturnVacant!0 (x!23696 lt!118869) (index!5988 lt!118869) (index!5988 lt!118869) key!932 (_keys!6429 thiss!1504) (mask!10315 thiss!1504)))))

(declare-fun b!234868 () Bool)

(assert (=> b!234868 (= e!152539 Undefined!954)))

(assert (= (and d!59251 c!39132) b!234868))

(assert (= (and d!59251 (not c!39132)) b!234864))

(assert (= (and b!234864 c!39131) b!234863))

(assert (= (and b!234864 (not c!39131)) b!234865))

(assert (= (and b!234865 c!39133) b!234866))

(assert (= (and b!234865 (not c!39133)) b!234867))

(declare-fun m!256233 () Bool)

(assert (=> b!234864 m!256233))

(declare-fun m!256235 () Bool)

(assert (=> d!59251 m!256235))

(assert (=> d!59251 m!256125))

(declare-fun m!256237 () Bool)

(assert (=> d!59251 m!256237))

(declare-fun m!256239 () Bool)

(assert (=> d!59251 m!256239))

(declare-fun m!256241 () Bool)

(assert (=> d!59251 m!256241))

(assert (=> d!59251 m!256241))

(declare-fun m!256243 () Bool)

(assert (=> d!59251 m!256243))

(declare-fun m!256245 () Bool)

(assert (=> b!234867 m!256245))

(assert (=> b!234711 d!59251))

(declare-fun mapNonEmpty!10459 () Bool)

(declare-fun mapRes!10459 () Bool)

(declare-fun tp!22114 () Bool)

(declare-fun e!152545 () Bool)

(assert (=> mapNonEmpty!10459 (= mapRes!10459 (and tp!22114 e!152545))))

(declare-fun mapValue!10459 () ValueCell!2744)

(declare-fun mapRest!10459 () (Array (_ BitVec 32) ValueCell!2744))

(declare-fun mapKey!10459 () (_ BitVec 32))

(assert (=> mapNonEmpty!10459 (= mapRest!10450 (store mapRest!10459 mapKey!10459 mapValue!10459))))

(declare-fun b!234876 () Bool)

(declare-fun e!152546 () Bool)

(assert (=> b!234876 (= e!152546 tp_is_empty!6175)))

(declare-fun b!234875 () Bool)

(assert (=> b!234875 (= e!152545 tp_is_empty!6175)))

(declare-fun condMapEmpty!10459 () Bool)

(declare-fun mapDefault!10459 () ValueCell!2744)

(assert (=> mapNonEmpty!10450 (= condMapEmpty!10459 (= mapRest!10450 ((as const (Array (_ BitVec 32) ValueCell!2744)) mapDefault!10459)))))

(assert (=> mapNonEmpty!10450 (= tp!22098 (and e!152546 mapRes!10459))))

(declare-fun mapIsEmpty!10459 () Bool)

(assert (=> mapIsEmpty!10459 mapRes!10459))

(assert (= (and mapNonEmpty!10450 condMapEmpty!10459) mapIsEmpty!10459))

(assert (= (and mapNonEmpty!10450 (not condMapEmpty!10459)) mapNonEmpty!10459))

(assert (= (and mapNonEmpty!10459 ((_ is ValueCellFull!2744) mapValue!10459)) b!234875))

(assert (= (and mapNonEmpty!10450 ((_ is ValueCellFull!2744) mapDefault!10459)) b!234876))

(declare-fun m!256247 () Bool)

(assert (=> mapNonEmpty!10459 m!256247))

(declare-fun b_lambda!7911 () Bool)

(assert (= b_lambda!7909 (or (and b!234713 b_free!6313) b_lambda!7911)))

(check-sat (not d!59245) (not b!234836) (not b!234848) (not mapNonEmpty!10459) (not b_lambda!7911) (not b!234844) (not b!234783) (not bm!21825) (not b!234833) (not d!59243) (not d!59241) (not b!234829) tp_is_empty!6175 (not b!234776) (not b!234842) (not b!234785) (not b_next!6313) (not bm!21822) (not d!59251) (not b!234775) (not b!234774) (not bm!21820) (not bm!21823) (not b!234839) (not b!234867) (not b!234831) b_and!13253)
(check-sat b_and!13253 (not b_next!6313))
(get-model)

(declare-fun d!59253 () Bool)

(declare-fun e!152547 () Bool)

(assert (=> d!59253 e!152547))

(declare-fun res!115184 () Bool)

(assert (=> d!59253 (=> res!115184 e!152547)))

(declare-fun lt!118874 () Bool)

(assert (=> d!59253 (= res!115184 (not lt!118874))))

(declare-fun lt!118871 () Bool)

(assert (=> d!59253 (= lt!118874 lt!118871)))

(declare-fun lt!118872 () Unit!7231)

(declare-fun e!152548 () Unit!7231)

(assert (=> d!59253 (= lt!118872 e!152548)))

(declare-fun c!39134 () Bool)

(assert (=> d!59253 (= c!39134 lt!118871)))

(assert (=> d!59253 (= lt!118871 (containsKey!258 (toList!1748 lt!118855) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59253 (= (contains!1636 lt!118855 #b0000000000000000000000000000000000000000000000000000000000000000) lt!118874)))

(declare-fun b!234877 () Bool)

(declare-fun lt!118873 () Unit!7231)

(assert (=> b!234877 (= e!152548 lt!118873)))

(assert (=> b!234877 (= lt!118873 (lemmaContainsKeyImpliesGetValueByKeyDefined!206 (toList!1748 lt!118855) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234877 (isDefined!207 (getValueByKey!267 (toList!1748 lt!118855) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234878 () Bool)

(declare-fun Unit!7235 () Unit!7231)

(assert (=> b!234878 (= e!152548 Unit!7235)))

(declare-fun b!234879 () Bool)

(assert (=> b!234879 (= e!152547 (isDefined!207 (getValueByKey!267 (toList!1748 lt!118855) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59253 c!39134) b!234877))

(assert (= (and d!59253 (not c!39134)) b!234878))

(assert (= (and d!59253 (not res!115184)) b!234879))

(declare-fun m!256249 () Bool)

(assert (=> d!59253 m!256249))

(declare-fun m!256251 () Bool)

(assert (=> b!234877 m!256251))

(declare-fun m!256253 () Bool)

(assert (=> b!234877 m!256253))

(assert (=> b!234877 m!256253))

(declare-fun m!256255 () Bool)

(assert (=> b!234877 m!256255))

(assert (=> b!234879 m!256253))

(assert (=> b!234879 m!256253))

(assert (=> b!234879 m!256255))

(assert (=> bm!21825 d!59253))

(declare-fun bm!21828 () Bool)

(declare-fun call!21831 () Bool)

(declare-fun c!39137 () Bool)

(assert (=> bm!21828 (= call!21831 (arrayNoDuplicates!0 (_keys!6429 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39137 (Cons!3448 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000) Nil!3449) Nil!3449)))))

(declare-fun b!234890 () Bool)

(declare-fun e!152559 () Bool)

(assert (=> b!234890 (= e!152559 call!21831)))

(declare-fun b!234891 () Bool)

(declare-fun e!152557 () Bool)

(assert (=> b!234891 (= e!152557 e!152559)))

(assert (=> b!234891 (= c!39137 (validKeyInArray!0 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234892 () Bool)

(declare-fun e!152558 () Bool)

(assert (=> b!234892 (= e!152558 e!152557)))

(declare-fun res!115191 () Bool)

(assert (=> b!234892 (=> (not res!115191) (not e!152557))))

(declare-fun e!152560 () Bool)

(assert (=> b!234892 (= res!115191 (not e!152560))))

(declare-fun res!115193 () Bool)

(assert (=> b!234892 (=> (not res!115193) (not e!152560))))

(assert (=> b!234892 (= res!115193 (validKeyInArray!0 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234893 () Bool)

(assert (=> b!234893 (= e!152559 call!21831)))

(declare-fun d!59255 () Bool)

(declare-fun res!115192 () Bool)

(assert (=> d!59255 (=> res!115192 e!152558)))

(assert (=> d!59255 (= res!115192 (bvsge #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))))))

(assert (=> d!59255 (= (arrayNoDuplicates!0 (_keys!6429 thiss!1504) #b00000000000000000000000000000000 Nil!3449) e!152558)))

(declare-fun b!234894 () Bool)

(declare-fun contains!1637 (List!3452 (_ BitVec 64)) Bool)

(assert (=> b!234894 (= e!152560 (contains!1637 Nil!3449 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59255 (not res!115192)) b!234892))

(assert (= (and b!234892 res!115193) b!234894))

(assert (= (and b!234892 res!115191) b!234891))

(assert (= (and b!234891 c!39137) b!234893))

(assert (= (and b!234891 (not c!39137)) b!234890))

(assert (= (or b!234893 b!234890) bm!21828))

(assert (=> bm!21828 m!256175))

(declare-fun m!256257 () Bool)

(assert (=> bm!21828 m!256257))

(assert (=> b!234891 m!256175))

(assert (=> b!234891 m!256175))

(assert (=> b!234891 m!256187))

(assert (=> b!234892 m!256175))

(assert (=> b!234892 m!256175))

(assert (=> b!234892 m!256187))

(assert (=> b!234894 m!256175))

(assert (=> b!234894 m!256175))

(declare-fun m!256259 () Bool)

(assert (=> b!234894 m!256259))

(assert (=> b!234776 d!59255))

(declare-fun b!234919 () Bool)

(declare-fun e!152576 () ListLongMap!3465)

(declare-fun e!152578 () ListLongMap!3465)

(assert (=> b!234919 (= e!152576 e!152578)))

(declare-fun c!39147 () Bool)

(assert (=> b!234919 (= c!39147 (validKeyInArray!0 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234920 () Bool)

(declare-fun res!115204 () Bool)

(declare-fun e!152577 () Bool)

(assert (=> b!234920 (=> (not res!115204) (not e!152577))))

(declare-fun lt!118891 () ListLongMap!3465)

(assert (=> b!234920 (= res!115204 (not (contains!1636 lt!118891 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234921 () Bool)

(declare-fun lt!118895 () Unit!7231)

(declare-fun lt!118890 () Unit!7231)

(assert (=> b!234921 (= lt!118895 lt!118890)))

(declare-fun lt!118893 () V!7881)

(declare-fun lt!118894 () ListLongMap!3465)

(declare-fun lt!118892 () (_ BitVec 64))

(declare-fun lt!118889 () (_ BitVec 64))

(assert (=> b!234921 (not (contains!1636 (+!635 lt!118894 (tuple2!4551 lt!118889 lt!118893)) lt!118892))))

(declare-fun addStillNotContains!116 (ListLongMap!3465 (_ BitVec 64) V!7881 (_ BitVec 64)) Unit!7231)

(assert (=> b!234921 (= lt!118890 (addStillNotContains!116 lt!118894 lt!118889 lt!118893 lt!118892))))

(assert (=> b!234921 (= lt!118892 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!234921 (= lt!118893 (get!2840 (select (arr!5515 (_values!4344 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4361 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234921 (= lt!118889 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!21834 () ListLongMap!3465)

(assert (=> b!234921 (= lt!118894 call!21834)))

(assert (=> b!234921 (= e!152578 (+!635 call!21834 (tuple2!4551 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000) (get!2840 (select (arr!5515 (_values!4344 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4361 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!234922 () Bool)

(declare-fun e!152575 () Bool)

(declare-fun isEmpty!516 (ListLongMap!3465) Bool)

(assert (=> b!234922 (= e!152575 (isEmpty!516 lt!118891))))

(declare-fun b!234923 () Bool)

(declare-fun e!152579 () Bool)

(assert (=> b!234923 (= e!152577 e!152579)))

(declare-fun c!39148 () Bool)

(declare-fun e!152580 () Bool)

(assert (=> b!234923 (= c!39148 e!152580)))

(declare-fun res!115202 () Bool)

(assert (=> b!234923 (=> (not res!115202) (not e!152580))))

(assert (=> b!234923 (= res!115202 (bvslt #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))))))

(declare-fun b!234924 () Bool)

(assert (=> b!234924 (= e!152578 call!21834)))

(declare-fun b!234925 () Bool)

(assert (=> b!234925 (= e!152579 e!152575)))

(declare-fun c!39149 () Bool)

(assert (=> b!234925 (= c!39149 (bvslt #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))))))

(declare-fun bm!21831 () Bool)

(assert (=> bm!21831 (= call!21834 (getCurrentListMapNoExtraKeys!524 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4361 thiss!1504)))))

(declare-fun b!234926 () Bool)

(declare-fun e!152581 () Bool)

(assert (=> b!234926 (= e!152579 e!152581)))

(assert (=> b!234926 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))))))

(declare-fun res!115203 () Bool)

(assert (=> b!234926 (= res!115203 (contains!1636 lt!118891 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234926 (=> (not res!115203) (not e!152581))))

(declare-fun b!234927 () Bool)

(assert (=> b!234927 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))))))

(assert (=> b!234927 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5851 (_values!4344 thiss!1504))))))

(assert (=> b!234927 (= e!152581 (= (apply!208 lt!118891 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)) (get!2840 (select (arr!5515 (_values!4344 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4361 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234928 () Bool)

(assert (=> b!234928 (= e!152576 (ListLongMap!3466 Nil!3448))))

(declare-fun b!234929 () Bool)

(assert (=> b!234929 (= e!152575 (= lt!118891 (getCurrentListMapNoExtraKeys!524 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4361 thiss!1504))))))

(declare-fun d!59257 () Bool)

(assert (=> d!59257 e!152577))

(declare-fun res!115205 () Bool)

(assert (=> d!59257 (=> (not res!115205) (not e!152577))))

(assert (=> d!59257 (= res!115205 (not (contains!1636 lt!118891 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59257 (= lt!118891 e!152576)))

(declare-fun c!39146 () Bool)

(assert (=> d!59257 (= c!39146 (bvsge #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))))))

(assert (=> d!59257 (validMask!0 (mask!10315 thiss!1504))))

(assert (=> d!59257 (= (getCurrentListMapNoExtraKeys!524 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)) lt!118891)))

(declare-fun b!234930 () Bool)

(assert (=> b!234930 (= e!152580 (validKeyInArray!0 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234930 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!59257 c!39146) b!234928))

(assert (= (and d!59257 (not c!39146)) b!234919))

(assert (= (and b!234919 c!39147) b!234921))

(assert (= (and b!234919 (not c!39147)) b!234924))

(assert (= (or b!234921 b!234924) bm!21831))

(assert (= (and d!59257 res!115205) b!234920))

(assert (= (and b!234920 res!115204) b!234923))

(assert (= (and b!234923 res!115202) b!234930))

(assert (= (and b!234923 c!39148) b!234926))

(assert (= (and b!234923 (not c!39148)) b!234925))

(assert (= (and b!234926 res!115203) b!234927))

(assert (= (and b!234925 c!39149) b!234929))

(assert (= (and b!234925 (not c!39149)) b!234922))

(declare-fun b_lambda!7913 () Bool)

(assert (=> (not b_lambda!7913) (not b!234921)))

(assert (=> b!234921 t!8414))

(declare-fun b_and!13255 () Bool)

(assert (= b_and!13253 (and (=> t!8414 result!5101) b_and!13255)))

(declare-fun b_lambda!7915 () Bool)

(assert (=> (not b_lambda!7915) (not b!234927)))

(assert (=> b!234927 t!8414))

(declare-fun b_and!13257 () Bool)

(assert (= b_and!13255 (and (=> t!8414 result!5101) b_and!13257)))

(assert (=> b!234919 m!256175))

(assert (=> b!234919 m!256175))

(assert (=> b!234919 m!256187))

(declare-fun m!256261 () Bool)

(assert (=> d!59257 m!256261))

(assert (=> d!59257 m!256125))

(declare-fun m!256263 () Bool)

(assert (=> b!234929 m!256263))

(assert (=> b!234927 m!256177))

(assert (=> b!234927 m!256181))

(assert (=> b!234927 m!256183))

(assert (=> b!234927 m!256175))

(assert (=> b!234927 m!256177))

(assert (=> b!234927 m!256175))

(declare-fun m!256265 () Bool)

(assert (=> b!234927 m!256265))

(assert (=> b!234927 m!256181))

(assert (=> b!234930 m!256175))

(assert (=> b!234930 m!256175))

(assert (=> b!234930 m!256187))

(assert (=> bm!21831 m!256263))

(declare-fun m!256267 () Bool)

(assert (=> b!234921 m!256267))

(declare-fun m!256269 () Bool)

(assert (=> b!234921 m!256269))

(declare-fun m!256271 () Bool)

(assert (=> b!234921 m!256271))

(assert (=> b!234921 m!256177))

(assert (=> b!234921 m!256181))

(assert (=> b!234921 m!256183))

(declare-fun m!256273 () Bool)

(assert (=> b!234921 m!256273))

(assert (=> b!234921 m!256175))

(assert (=> b!234921 m!256177))

(assert (=> b!234921 m!256269))

(assert (=> b!234921 m!256181))

(assert (=> b!234926 m!256175))

(assert (=> b!234926 m!256175))

(declare-fun m!256275 () Bool)

(assert (=> b!234926 m!256275))

(declare-fun m!256277 () Bool)

(assert (=> b!234920 m!256277))

(declare-fun m!256279 () Bool)

(assert (=> b!234922 m!256279))

(assert (=> bm!21820 d!59257))

(declare-fun d!59259 () Bool)

(declare-fun lt!118901 () SeekEntryResult!954)

(assert (=> d!59259 (and (or ((_ is Undefined!954) lt!118901) (not ((_ is Found!954) lt!118901)) (and (bvsge (index!5987 lt!118901) #b00000000000000000000000000000000) (bvslt (index!5987 lt!118901) (size!5852 (_keys!6429 thiss!1504))))) (or ((_ is Undefined!954) lt!118901) ((_ is Found!954) lt!118901) (not ((_ is MissingVacant!954) lt!118901)) (not (= (index!5989 lt!118901) (index!5988 lt!118869))) (and (bvsge (index!5989 lt!118901) #b00000000000000000000000000000000) (bvslt (index!5989 lt!118901) (size!5852 (_keys!6429 thiss!1504))))) (or ((_ is Undefined!954) lt!118901) (ite ((_ is Found!954) lt!118901) (= (select (arr!5516 (_keys!6429 thiss!1504)) (index!5987 lt!118901)) key!932) (and ((_ is MissingVacant!954) lt!118901) (= (index!5989 lt!118901) (index!5988 lt!118869)) (= (select (arr!5516 (_keys!6429 thiss!1504)) (index!5989 lt!118901)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!152589 () SeekEntryResult!954)

(assert (=> d!59259 (= lt!118901 e!152589)))

(declare-fun c!39156 () Bool)

(assert (=> d!59259 (= c!39156 (bvsge (x!23696 lt!118869) #b01111111111111111111111111111110))))

(declare-fun lt!118900 () (_ BitVec 64))

(assert (=> d!59259 (= lt!118900 (select (arr!5516 (_keys!6429 thiss!1504)) (index!5988 lt!118869)))))

(assert (=> d!59259 (validMask!0 (mask!10315 thiss!1504))))

(assert (=> d!59259 (= (seekKeyOrZeroReturnVacant!0 (x!23696 lt!118869) (index!5988 lt!118869) (index!5988 lt!118869) key!932 (_keys!6429 thiss!1504) (mask!10315 thiss!1504)) lt!118901)))

(declare-fun b!234943 () Bool)

(declare-fun e!152588 () SeekEntryResult!954)

(assert (=> b!234943 (= e!152588 (MissingVacant!954 (index!5988 lt!118869)))))

(declare-fun b!234944 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!234944 (= e!152588 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23696 lt!118869) #b00000000000000000000000000000001) (nextIndex!0 (index!5988 lt!118869) (bvadd (x!23696 lt!118869) #b00000000000000000000000000000001) (mask!10315 thiss!1504)) (index!5988 lt!118869) key!932 (_keys!6429 thiss!1504) (mask!10315 thiss!1504)))))

(declare-fun b!234945 () Bool)

(declare-fun e!152590 () SeekEntryResult!954)

(assert (=> b!234945 (= e!152590 (Found!954 (index!5988 lt!118869)))))

(declare-fun b!234946 () Bool)

(assert (=> b!234946 (= e!152589 e!152590)))

(declare-fun c!39157 () Bool)

(assert (=> b!234946 (= c!39157 (= lt!118900 key!932))))

(declare-fun b!234947 () Bool)

(declare-fun c!39158 () Bool)

(assert (=> b!234947 (= c!39158 (= lt!118900 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234947 (= e!152590 e!152588)))

(declare-fun b!234948 () Bool)

(assert (=> b!234948 (= e!152589 Undefined!954)))

(assert (= (and d!59259 c!39156) b!234948))

(assert (= (and d!59259 (not c!39156)) b!234946))

(assert (= (and b!234946 c!39157) b!234945))

(assert (= (and b!234946 (not c!39157)) b!234947))

(assert (= (and b!234947 c!39158) b!234943))

(assert (= (and b!234947 (not c!39158)) b!234944))

(declare-fun m!256281 () Bool)

(assert (=> d!59259 m!256281))

(declare-fun m!256283 () Bool)

(assert (=> d!59259 m!256283))

(assert (=> d!59259 m!256233))

(assert (=> d!59259 m!256125))

(declare-fun m!256285 () Bool)

(assert (=> b!234944 m!256285))

(assert (=> b!234944 m!256285))

(declare-fun m!256287 () Bool)

(assert (=> b!234944 m!256287))

(assert (=> b!234867 d!59259))

(declare-fun d!59261 () Bool)

(declare-fun e!152593 () Bool)

(assert (=> d!59261 e!152593))

(declare-fun res!115210 () Bool)

(assert (=> d!59261 (=> (not res!115210) (not e!152593))))

(declare-fun lt!118910 () ListLongMap!3465)

(assert (=> d!59261 (= res!115210 (contains!1636 lt!118910 (_1!2286 (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))))))

(declare-fun lt!118912 () List!3451)

(assert (=> d!59261 (= lt!118910 (ListLongMap!3466 lt!118912))))

(declare-fun lt!118911 () Unit!7231)

(declare-fun lt!118913 () Unit!7231)

(assert (=> d!59261 (= lt!118911 lt!118913)))

(assert (=> d!59261 (= (getValueByKey!267 lt!118912 (_1!2286 (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))) (Some!272 (_2!2286 (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!151 (List!3451 (_ BitVec 64) V!7881) Unit!7231)

(assert (=> d!59261 (= lt!118913 (lemmaContainsTupThenGetReturnValue!151 lt!118912 (_1!2286 (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))) (_2!2286 (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))))))

(declare-fun insertStrictlySorted!154 (List!3451 (_ BitVec 64) V!7881) List!3451)

(assert (=> d!59261 (= lt!118912 (insertStrictlySorted!154 (toList!1748 call!21828) (_1!2286 (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))) (_2!2286 (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))))))

(assert (=> d!59261 (= (+!635 call!21828 (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))) lt!118910)))

(declare-fun b!234953 () Bool)

(declare-fun res!115211 () Bool)

(assert (=> b!234953 (=> (not res!115211) (not e!152593))))

(assert (=> b!234953 (= res!115211 (= (getValueByKey!267 (toList!1748 lt!118910) (_1!2286 (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))) (Some!272 (_2!2286 (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))))))

(declare-fun b!234954 () Bool)

(declare-fun contains!1638 (List!3451 tuple2!4550) Bool)

(assert (=> b!234954 (= e!152593 (contains!1638 (toList!1748 lt!118910) (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))))

(assert (= (and d!59261 res!115210) b!234953))

(assert (= (and b!234953 res!115211) b!234954))

(declare-fun m!256289 () Bool)

(assert (=> d!59261 m!256289))

(declare-fun m!256291 () Bool)

(assert (=> d!59261 m!256291))

(declare-fun m!256293 () Bool)

(assert (=> d!59261 m!256293))

(declare-fun m!256295 () Bool)

(assert (=> d!59261 m!256295))

(declare-fun m!256297 () Bool)

(assert (=> b!234953 m!256297))

(declare-fun m!256299 () Bool)

(assert (=> b!234954 m!256299))

(assert (=> b!234831 d!59261))

(declare-fun d!59263 () Bool)

(declare-fun get!2841 (Option!273) V!7881)

(assert (=> d!59263 (= (apply!208 lt!118855 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)) (get!2841 (getValueByKey!267 (toList!1748 lt!118855) (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8714 () Bool)

(assert (= bs!8714 d!59263))

(assert (=> bs!8714 m!256175))

(declare-fun m!256301 () Bool)

(assert (=> bs!8714 m!256301))

(assert (=> bs!8714 m!256301))

(declare-fun m!256303 () Bool)

(assert (=> bs!8714 m!256303))

(assert (=> b!234839 d!59263))

(declare-fun d!59265 () Bool)

(declare-fun c!39161 () Bool)

(assert (=> d!59265 (= c!39161 ((_ is ValueCellFull!2744) (select (arr!5515 (_values!4344 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!152596 () V!7881)

(assert (=> d!59265 (= (get!2840 (select (arr!5515 (_values!4344 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4361 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!152596)))

(declare-fun b!234959 () Bool)

(declare-fun get!2842 (ValueCell!2744 V!7881) V!7881)

(assert (=> b!234959 (= e!152596 (get!2842 (select (arr!5515 (_values!4344 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4361 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234960 () Bool)

(declare-fun get!2843 (ValueCell!2744 V!7881) V!7881)

(assert (=> b!234960 (= e!152596 (get!2843 (select (arr!5515 (_values!4344 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4361 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59265 c!39161) b!234959))

(assert (= (and d!59265 (not c!39161)) b!234960))

(assert (=> b!234959 m!256177))

(assert (=> b!234959 m!256181))

(declare-fun m!256305 () Bool)

(assert (=> b!234959 m!256305))

(assert (=> b!234960 m!256177))

(assert (=> b!234960 m!256181))

(declare-fun m!256307 () Bool)

(assert (=> b!234960 m!256307))

(assert (=> b!234839 d!59265))

(declare-fun d!59267 () Bool)

(assert (=> d!59267 (= (apply!208 lt!118855 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2841 (getValueByKey!267 (toList!1748 lt!118855) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8715 () Bool)

(assert (= bs!8715 d!59267))

(assert (=> bs!8715 m!256253))

(assert (=> bs!8715 m!256253))

(declare-fun m!256309 () Bool)

(assert (=> bs!8715 m!256309))

(assert (=> b!234848 d!59267))

(declare-fun d!59269 () Bool)

(assert (=> d!59269 (isDefined!207 (getValueByKey!267 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932))))

(declare-fun lt!118916 () Unit!7231)

(declare-fun choose!1108 (List!3451 (_ BitVec 64)) Unit!7231)

(assert (=> d!59269 (= lt!118916 (choose!1108 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932))))

(declare-fun e!152599 () Bool)

(assert (=> d!59269 e!152599))

(declare-fun res!115214 () Bool)

(assert (=> d!59269 (=> (not res!115214) (not e!152599))))

(declare-fun isStrictlySorted!349 (List!3451) Bool)

(assert (=> d!59269 (= res!115214 (isStrictlySorted!349 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))))))

(assert (=> d!59269 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!206 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932) lt!118916)))

(declare-fun b!234963 () Bool)

(assert (=> b!234963 (= e!152599 (containsKey!258 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932))))

(assert (= (and d!59269 res!115214) b!234963))

(assert (=> d!59269 m!256171))

(assert (=> d!59269 m!256171))

(assert (=> d!59269 m!256173))

(declare-fun m!256311 () Bool)

(assert (=> d!59269 m!256311))

(declare-fun m!256313 () Bool)

(assert (=> d!59269 m!256313))

(assert (=> b!234963 m!256167))

(assert (=> b!234783 d!59269))

(declare-fun d!59271 () Bool)

(declare-fun isEmpty!517 (Option!273) Bool)

(assert (=> d!59271 (= (isDefined!207 (getValueByKey!267 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932)) (not (isEmpty!517 (getValueByKey!267 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932))))))

(declare-fun bs!8716 () Bool)

(assert (= bs!8716 d!59271))

(assert (=> bs!8716 m!256171))

(declare-fun m!256315 () Bool)

(assert (=> bs!8716 m!256315))

(assert (=> b!234783 d!59271))

(declare-fun b!234975 () Bool)

(declare-fun e!152605 () Option!273)

(assert (=> b!234975 (= e!152605 None!271)))

(declare-fun d!59273 () Bool)

(declare-fun c!39166 () Bool)

(assert (=> d!59273 (= c!39166 (and ((_ is Cons!3447) (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))) (= (_1!2286 (h!4098 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))))) key!932)))))

(declare-fun e!152604 () Option!273)

(assert (=> d!59273 (= (getValueByKey!267 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932) e!152604)))

(declare-fun b!234974 () Bool)

(assert (=> b!234974 (= e!152605 (getValueByKey!267 (t!8412 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))) key!932))))

(declare-fun b!234972 () Bool)

(assert (=> b!234972 (= e!152604 (Some!272 (_2!2286 (h!4098 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))))))))

(declare-fun b!234973 () Bool)

(assert (=> b!234973 (= e!152604 e!152605)))

(declare-fun c!39167 () Bool)

(assert (=> b!234973 (= c!39167 (and ((_ is Cons!3447) (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))) (not (= (_1!2286 (h!4098 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))))) key!932))))))

(assert (= (and d!59273 c!39166) b!234972))

(assert (= (and d!59273 (not c!39166)) b!234973))

(assert (= (and b!234973 c!39167) b!234974))

(assert (= (and b!234973 (not c!39167)) b!234975))

(declare-fun m!256317 () Bool)

(assert (=> b!234974 m!256317))

(assert (=> b!234783 d!59273))

(declare-fun d!59275 () Bool)

(declare-fun res!115224 () Bool)

(declare-fun e!152608 () Bool)

(assert (=> d!59275 (=> (not res!115224) (not e!152608))))

(assert (=> d!59275 (= res!115224 (validMask!0 (mask!10315 thiss!1504)))))

(assert (=> d!59275 (= (simpleValid!231 thiss!1504) e!152608)))

(declare-fun b!234984 () Bool)

(declare-fun res!115223 () Bool)

(assert (=> b!234984 (=> (not res!115223) (not e!152608))))

(assert (=> b!234984 (= res!115223 (and (= (size!5851 (_values!4344 thiss!1504)) (bvadd (mask!10315 thiss!1504) #b00000000000000000000000000000001)) (= (size!5852 (_keys!6429 thiss!1504)) (size!5851 (_values!4344 thiss!1504))) (bvsge (_size!1743 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1743 thiss!1504) (bvadd (mask!10315 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!234987 () Bool)

(assert (=> b!234987 (= e!152608 (and (bvsge (extraKeys!4098 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4098 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1743 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!234985 () Bool)

(declare-fun res!115226 () Bool)

(assert (=> b!234985 (=> (not res!115226) (not e!152608))))

(declare-fun size!5857 (LongMapFixedSize!3388) (_ BitVec 32))

(assert (=> b!234985 (= res!115226 (bvsge (size!5857 thiss!1504) (_size!1743 thiss!1504)))))

(declare-fun b!234986 () Bool)

(declare-fun res!115225 () Bool)

(assert (=> b!234986 (=> (not res!115225) (not e!152608))))

(assert (=> b!234986 (= res!115225 (= (size!5857 thiss!1504) (bvadd (_size!1743 thiss!1504) (bvsdiv (bvadd (extraKeys!4098 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!59275 res!115224) b!234984))

(assert (= (and b!234984 res!115223) b!234985))

(assert (= (and b!234985 res!115226) b!234986))

(assert (= (and b!234986 res!115225) b!234987))

(assert (=> d!59275 m!256125))

(declare-fun m!256319 () Bool)

(assert (=> b!234985 m!256319))

(assert (=> b!234986 m!256319))

(assert (=> d!59241 d!59275))

(declare-fun d!59277 () Bool)

(declare-fun e!152609 () Bool)

(assert (=> d!59277 e!152609))

(declare-fun res!115227 () Bool)

(assert (=> d!59277 (=> res!115227 e!152609)))

(declare-fun lt!118920 () Bool)

(assert (=> d!59277 (= res!115227 (not lt!118920))))

(declare-fun lt!118917 () Bool)

(assert (=> d!59277 (= lt!118920 lt!118917)))

(declare-fun lt!118918 () Unit!7231)

(declare-fun e!152610 () Unit!7231)

(assert (=> d!59277 (= lt!118918 e!152610)))

(declare-fun c!39168 () Bool)

(assert (=> d!59277 (= c!39168 lt!118917)))

(assert (=> d!59277 (= lt!118917 (containsKey!258 (toList!1748 lt!118855) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59277 (= (contains!1636 lt!118855 #b1000000000000000000000000000000000000000000000000000000000000000) lt!118920)))

(declare-fun b!234988 () Bool)

(declare-fun lt!118919 () Unit!7231)

(assert (=> b!234988 (= e!152610 lt!118919)))

(assert (=> b!234988 (= lt!118919 (lemmaContainsKeyImpliesGetValueByKeyDefined!206 (toList!1748 lt!118855) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234988 (isDefined!207 (getValueByKey!267 (toList!1748 lt!118855) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234989 () Bool)

(declare-fun Unit!7236 () Unit!7231)

(assert (=> b!234989 (= e!152610 Unit!7236)))

(declare-fun b!234990 () Bool)

(assert (=> b!234990 (= e!152609 (isDefined!207 (getValueByKey!267 (toList!1748 lt!118855) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59277 c!39168) b!234988))

(assert (= (and d!59277 (not c!39168)) b!234989))

(assert (= (and d!59277 (not res!115227)) b!234990))

(declare-fun m!256321 () Bool)

(assert (=> d!59277 m!256321))

(declare-fun m!256323 () Bool)

(assert (=> b!234988 m!256323))

(declare-fun m!256325 () Bool)

(assert (=> b!234988 m!256325))

(assert (=> b!234988 m!256325))

(declare-fun m!256327 () Bool)

(assert (=> b!234988 m!256327))

(assert (=> b!234990 m!256325))

(assert (=> b!234990 m!256325))

(assert (=> b!234990 m!256327))

(assert (=> bm!21823 d!59277))

(declare-fun bm!21834 () Bool)

(declare-fun call!21837 () (_ BitVec 32))

(assert (=> bm!21834 (= call!21837 (arrayCountValidKeys!0 (_keys!6429 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5852 (_keys!6429 thiss!1504))))))

(declare-fun b!234999 () Bool)

(declare-fun e!152616 () (_ BitVec 32))

(assert (=> b!234999 (= e!152616 call!21837)))

(declare-fun b!235000 () Bool)

(declare-fun e!152615 () (_ BitVec 32))

(assert (=> b!235000 (= e!152615 e!152616)))

(declare-fun c!39173 () Bool)

(assert (=> b!235000 (= c!39173 (validKeyInArray!0 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59279 () Bool)

(declare-fun lt!118923 () (_ BitVec 32))

(assert (=> d!59279 (and (bvsge lt!118923 #b00000000000000000000000000000000) (bvsle lt!118923 (bvsub (size!5852 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59279 (= lt!118923 e!152615)))

(declare-fun c!39174 () Bool)

(assert (=> d!59279 (= c!39174 (bvsge #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))))))

(assert (=> d!59279 (and (bvsle #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5852 (_keys!6429 thiss!1504)) (size!5852 (_keys!6429 thiss!1504))))))

(assert (=> d!59279 (= (arrayCountValidKeys!0 (_keys!6429 thiss!1504) #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))) lt!118923)))

(declare-fun b!235001 () Bool)

(assert (=> b!235001 (= e!152615 #b00000000000000000000000000000000)))

(declare-fun b!235002 () Bool)

(assert (=> b!235002 (= e!152616 (bvadd #b00000000000000000000000000000001 call!21837))))

(assert (= (and d!59279 c!39174) b!235001))

(assert (= (and d!59279 (not c!39174)) b!235000))

(assert (= (and b!235000 c!39173) b!235002))

(assert (= (and b!235000 (not c!39173)) b!234999))

(assert (= (or b!235002 b!234999) bm!21834))

(declare-fun m!256329 () Bool)

(assert (=> bm!21834 m!256329))

(assert (=> b!235000 m!256175))

(assert (=> b!235000 m!256175))

(assert (=> b!235000 m!256187))

(assert (=> b!234774 d!59279))

(declare-fun d!59281 () Bool)

(assert (=> d!59281 (= (apply!208 lt!118855 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2841 (getValueByKey!267 (toList!1748 lt!118855) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8717 () Bool)

(assert (= bs!8717 d!59281))

(assert (=> bs!8717 m!256325))

(assert (=> bs!8717 m!256325))

(declare-fun m!256331 () Bool)

(assert (=> bs!8717 m!256331))

(assert (=> b!234829 d!59281))

(declare-fun d!59283 () Bool)

(declare-fun e!152617 () Bool)

(assert (=> d!59283 e!152617))

(declare-fun res!115228 () Bool)

(assert (=> d!59283 (=> (not res!115228) (not e!152617))))

(declare-fun lt!118924 () ListLongMap!3465)

(assert (=> d!59283 (= res!115228 (contains!1636 lt!118924 (_1!2286 (tuple2!4551 lt!118844 (zeroValue!4202 thiss!1504)))))))

(declare-fun lt!118926 () List!3451)

(assert (=> d!59283 (= lt!118924 (ListLongMap!3466 lt!118926))))

(declare-fun lt!118925 () Unit!7231)

(declare-fun lt!118927 () Unit!7231)

(assert (=> d!59283 (= lt!118925 lt!118927)))

(assert (=> d!59283 (= (getValueByKey!267 lt!118926 (_1!2286 (tuple2!4551 lt!118844 (zeroValue!4202 thiss!1504)))) (Some!272 (_2!2286 (tuple2!4551 lt!118844 (zeroValue!4202 thiss!1504)))))))

(assert (=> d!59283 (= lt!118927 (lemmaContainsTupThenGetReturnValue!151 lt!118926 (_1!2286 (tuple2!4551 lt!118844 (zeroValue!4202 thiss!1504))) (_2!2286 (tuple2!4551 lt!118844 (zeroValue!4202 thiss!1504)))))))

(assert (=> d!59283 (= lt!118926 (insertStrictlySorted!154 (toList!1748 lt!118842) (_1!2286 (tuple2!4551 lt!118844 (zeroValue!4202 thiss!1504))) (_2!2286 (tuple2!4551 lt!118844 (zeroValue!4202 thiss!1504)))))))

(assert (=> d!59283 (= (+!635 lt!118842 (tuple2!4551 lt!118844 (zeroValue!4202 thiss!1504))) lt!118924)))

(declare-fun b!235003 () Bool)

(declare-fun res!115229 () Bool)

(assert (=> b!235003 (=> (not res!115229) (not e!152617))))

(assert (=> b!235003 (= res!115229 (= (getValueByKey!267 (toList!1748 lt!118924) (_1!2286 (tuple2!4551 lt!118844 (zeroValue!4202 thiss!1504)))) (Some!272 (_2!2286 (tuple2!4551 lt!118844 (zeroValue!4202 thiss!1504))))))))

(declare-fun b!235004 () Bool)

(assert (=> b!235004 (= e!152617 (contains!1638 (toList!1748 lt!118924) (tuple2!4551 lt!118844 (zeroValue!4202 thiss!1504))))))

(assert (= (and d!59283 res!115228) b!235003))

(assert (= (and b!235003 res!115229) b!235004))

(declare-fun m!256333 () Bool)

(assert (=> d!59283 m!256333))

(declare-fun m!256335 () Bool)

(assert (=> d!59283 m!256335))

(declare-fun m!256337 () Bool)

(assert (=> d!59283 m!256337))

(declare-fun m!256339 () Bool)

(assert (=> d!59283 m!256339))

(declare-fun m!256341 () Bool)

(assert (=> b!235003 m!256341))

(declare-fun m!256343 () Bool)

(assert (=> b!235004 m!256343))

(assert (=> b!234836 d!59283))

(declare-fun d!59285 () Bool)

(assert (=> d!59285 (= (apply!208 lt!118842 lt!118848) (get!2841 (getValueByKey!267 (toList!1748 lt!118842) lt!118848)))))

(declare-fun bs!8718 () Bool)

(assert (= bs!8718 d!59285))

(declare-fun m!256345 () Bool)

(assert (=> bs!8718 m!256345))

(assert (=> bs!8718 m!256345))

(declare-fun m!256347 () Bool)

(assert (=> bs!8718 m!256347))

(assert (=> b!234836 d!59285))

(declare-fun d!59287 () Bool)

(assert (=> d!59287 (= (apply!208 (+!635 lt!118842 (tuple2!4551 lt!118844 (zeroValue!4202 thiss!1504))) lt!118848) (get!2841 (getValueByKey!267 (toList!1748 (+!635 lt!118842 (tuple2!4551 lt!118844 (zeroValue!4202 thiss!1504)))) lt!118848)))))

(declare-fun bs!8719 () Bool)

(assert (= bs!8719 d!59287))

(declare-fun m!256349 () Bool)

(assert (=> bs!8719 m!256349))

(assert (=> bs!8719 m!256349))

(declare-fun m!256351 () Bool)

(assert (=> bs!8719 m!256351))

(assert (=> b!234836 d!59287))

(declare-fun d!59289 () Bool)

(assert (=> d!59289 (= (apply!208 (+!635 lt!118842 (tuple2!4551 lt!118844 (zeroValue!4202 thiss!1504))) lt!118848) (apply!208 lt!118842 lt!118848))))

(declare-fun lt!118930 () Unit!7231)

(declare-fun choose!1109 (ListLongMap!3465 (_ BitVec 64) V!7881 (_ BitVec 64)) Unit!7231)

(assert (=> d!59289 (= lt!118930 (choose!1109 lt!118842 lt!118844 (zeroValue!4202 thiss!1504) lt!118848))))

(declare-fun e!152620 () Bool)

(assert (=> d!59289 e!152620))

(declare-fun res!115232 () Bool)

(assert (=> d!59289 (=> (not res!115232) (not e!152620))))

(assert (=> d!59289 (= res!115232 (contains!1636 lt!118842 lt!118848))))

(assert (=> d!59289 (= (addApplyDifferent!184 lt!118842 lt!118844 (zeroValue!4202 thiss!1504) lt!118848) lt!118930)))

(declare-fun b!235008 () Bool)

(assert (=> b!235008 (= e!152620 (not (= lt!118848 lt!118844)))))

(assert (= (and d!59289 res!115232) b!235008))

(assert (=> d!59289 m!256223))

(assert (=> d!59289 m!256225))

(declare-fun m!256353 () Bool)

(assert (=> d!59289 m!256353))

(assert (=> d!59289 m!256213))

(assert (=> d!59289 m!256223))

(declare-fun m!256355 () Bool)

(assert (=> d!59289 m!256355))

(assert (=> b!234836 d!59289))

(declare-fun d!59291 () Bool)

(declare-fun e!152621 () Bool)

(assert (=> d!59291 e!152621))

(declare-fun res!115233 () Bool)

(assert (=> d!59291 (=> res!115233 e!152621)))

(declare-fun lt!118934 () Bool)

(assert (=> d!59291 (= res!115233 (not lt!118934))))

(declare-fun lt!118931 () Bool)

(assert (=> d!59291 (= lt!118934 lt!118931)))

(declare-fun lt!118932 () Unit!7231)

(declare-fun e!152622 () Unit!7231)

(assert (=> d!59291 (= lt!118932 e!152622)))

(declare-fun c!39175 () Bool)

(assert (=> d!59291 (= c!39175 lt!118931)))

(assert (=> d!59291 (= lt!118931 (containsKey!258 (toList!1748 (+!635 lt!118845 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504)))) lt!118856))))

(assert (=> d!59291 (= (contains!1636 (+!635 lt!118845 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504))) lt!118856) lt!118934)))

(declare-fun b!235009 () Bool)

(declare-fun lt!118933 () Unit!7231)

(assert (=> b!235009 (= e!152622 lt!118933)))

(assert (=> b!235009 (= lt!118933 (lemmaContainsKeyImpliesGetValueByKeyDefined!206 (toList!1748 (+!635 lt!118845 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504)))) lt!118856))))

(assert (=> b!235009 (isDefined!207 (getValueByKey!267 (toList!1748 (+!635 lt!118845 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504)))) lt!118856))))

(declare-fun b!235010 () Bool)

(declare-fun Unit!7237 () Unit!7231)

(assert (=> b!235010 (= e!152622 Unit!7237)))

(declare-fun b!235011 () Bool)

(assert (=> b!235011 (= e!152621 (isDefined!207 (getValueByKey!267 (toList!1748 (+!635 lt!118845 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504)))) lt!118856)))))

(assert (= (and d!59291 c!39175) b!235009))

(assert (= (and d!59291 (not c!39175)) b!235010))

(assert (= (and d!59291 (not res!115233)) b!235011))

(declare-fun m!256357 () Bool)

(assert (=> d!59291 m!256357))

(declare-fun m!256359 () Bool)

(assert (=> b!235009 m!256359))

(declare-fun m!256361 () Bool)

(assert (=> b!235009 m!256361))

(assert (=> b!235009 m!256361))

(declare-fun m!256363 () Bool)

(assert (=> b!235009 m!256363))

(assert (=> b!235011 m!256361))

(assert (=> b!235011 m!256361))

(assert (=> b!235011 m!256363))

(assert (=> b!234836 d!59291))

(declare-fun d!59293 () Bool)

(assert (=> d!59293 (= (apply!208 (+!635 lt!118858 (tuple2!4551 lt!118843 (minValue!4202 thiss!1504))) lt!118854) (get!2841 (getValueByKey!267 (toList!1748 (+!635 lt!118858 (tuple2!4551 lt!118843 (minValue!4202 thiss!1504)))) lt!118854)))))

(declare-fun bs!8720 () Bool)

(assert (= bs!8720 d!59293))

(declare-fun m!256365 () Bool)

(assert (=> bs!8720 m!256365))

(assert (=> bs!8720 m!256365))

(declare-fun m!256367 () Bool)

(assert (=> bs!8720 m!256367))

(assert (=> b!234836 d!59293))

(declare-fun d!59295 () Bool)

(assert (=> d!59295 (= (apply!208 (+!635 lt!118860 (tuple2!4551 lt!118861 (minValue!4202 thiss!1504))) lt!118857) (get!2841 (getValueByKey!267 (toList!1748 (+!635 lt!118860 (tuple2!4551 lt!118861 (minValue!4202 thiss!1504)))) lt!118857)))))

(declare-fun bs!8721 () Bool)

(assert (= bs!8721 d!59295))

(declare-fun m!256369 () Bool)

(assert (=> bs!8721 m!256369))

(assert (=> bs!8721 m!256369))

(declare-fun m!256371 () Bool)

(assert (=> bs!8721 m!256371))

(assert (=> b!234836 d!59295))

(declare-fun d!59297 () Bool)

(declare-fun e!152623 () Bool)

(assert (=> d!59297 e!152623))

(declare-fun res!115234 () Bool)

(assert (=> d!59297 (=> (not res!115234) (not e!152623))))

(declare-fun lt!118935 () ListLongMap!3465)

(assert (=> d!59297 (= res!115234 (contains!1636 lt!118935 (_1!2286 (tuple2!4551 lt!118861 (minValue!4202 thiss!1504)))))))

(declare-fun lt!118937 () List!3451)

(assert (=> d!59297 (= lt!118935 (ListLongMap!3466 lt!118937))))

(declare-fun lt!118936 () Unit!7231)

(declare-fun lt!118938 () Unit!7231)

(assert (=> d!59297 (= lt!118936 lt!118938)))

(assert (=> d!59297 (= (getValueByKey!267 lt!118937 (_1!2286 (tuple2!4551 lt!118861 (minValue!4202 thiss!1504)))) (Some!272 (_2!2286 (tuple2!4551 lt!118861 (minValue!4202 thiss!1504)))))))

(assert (=> d!59297 (= lt!118938 (lemmaContainsTupThenGetReturnValue!151 lt!118937 (_1!2286 (tuple2!4551 lt!118861 (minValue!4202 thiss!1504))) (_2!2286 (tuple2!4551 lt!118861 (minValue!4202 thiss!1504)))))))

(assert (=> d!59297 (= lt!118937 (insertStrictlySorted!154 (toList!1748 lt!118860) (_1!2286 (tuple2!4551 lt!118861 (minValue!4202 thiss!1504))) (_2!2286 (tuple2!4551 lt!118861 (minValue!4202 thiss!1504)))))))

(assert (=> d!59297 (= (+!635 lt!118860 (tuple2!4551 lt!118861 (minValue!4202 thiss!1504))) lt!118935)))

(declare-fun b!235012 () Bool)

(declare-fun res!115235 () Bool)

(assert (=> b!235012 (=> (not res!115235) (not e!152623))))

(assert (=> b!235012 (= res!115235 (= (getValueByKey!267 (toList!1748 lt!118935) (_1!2286 (tuple2!4551 lt!118861 (minValue!4202 thiss!1504)))) (Some!272 (_2!2286 (tuple2!4551 lt!118861 (minValue!4202 thiss!1504))))))))

(declare-fun b!235013 () Bool)

(assert (=> b!235013 (= e!152623 (contains!1638 (toList!1748 lt!118935) (tuple2!4551 lt!118861 (minValue!4202 thiss!1504))))))

(assert (= (and d!59297 res!115234) b!235012))

(assert (= (and b!235012 res!115235) b!235013))

(declare-fun m!256373 () Bool)

(assert (=> d!59297 m!256373))

(declare-fun m!256375 () Bool)

(assert (=> d!59297 m!256375))

(declare-fun m!256377 () Bool)

(assert (=> d!59297 m!256377))

(declare-fun m!256379 () Bool)

(assert (=> d!59297 m!256379))

(declare-fun m!256381 () Bool)

(assert (=> b!235012 m!256381))

(declare-fun m!256383 () Bool)

(assert (=> b!235013 m!256383))

(assert (=> b!234836 d!59297))

(declare-fun d!59299 () Bool)

(assert (=> d!59299 (= (apply!208 lt!118858 lt!118854) (get!2841 (getValueByKey!267 (toList!1748 lt!118858) lt!118854)))))

(declare-fun bs!8722 () Bool)

(assert (= bs!8722 d!59299))

(declare-fun m!256385 () Bool)

(assert (=> bs!8722 m!256385))

(assert (=> bs!8722 m!256385))

(declare-fun m!256387 () Bool)

(assert (=> bs!8722 m!256387))

(assert (=> b!234836 d!59299))

(declare-fun d!59301 () Bool)

(assert (=> d!59301 (contains!1636 (+!635 lt!118845 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504))) lt!118856)))

(declare-fun lt!118941 () Unit!7231)

(declare-fun choose!1110 (ListLongMap!3465 (_ BitVec 64) V!7881 (_ BitVec 64)) Unit!7231)

(assert (=> d!59301 (= lt!118941 (choose!1110 lt!118845 lt!118859 (zeroValue!4202 thiss!1504) lt!118856))))

(assert (=> d!59301 (contains!1636 lt!118845 lt!118856)))

(assert (=> d!59301 (= (addStillContains!184 lt!118845 lt!118859 (zeroValue!4202 thiss!1504) lt!118856) lt!118941)))

(declare-fun bs!8723 () Bool)

(assert (= bs!8723 d!59301))

(assert (=> bs!8723 m!256201))

(assert (=> bs!8723 m!256201))

(assert (=> bs!8723 m!256203))

(declare-fun m!256389 () Bool)

(assert (=> bs!8723 m!256389))

(declare-fun m!256391 () Bool)

(assert (=> bs!8723 m!256391))

(assert (=> b!234836 d!59301))

(assert (=> b!234836 d!59257))

(declare-fun d!59303 () Bool)

(assert (=> d!59303 (= (apply!208 (+!635 lt!118860 (tuple2!4551 lt!118861 (minValue!4202 thiss!1504))) lt!118857) (apply!208 lt!118860 lt!118857))))

(declare-fun lt!118942 () Unit!7231)

(assert (=> d!59303 (= lt!118942 (choose!1109 lt!118860 lt!118861 (minValue!4202 thiss!1504) lt!118857))))

(declare-fun e!152624 () Bool)

(assert (=> d!59303 e!152624))

(declare-fun res!115236 () Bool)

(assert (=> d!59303 (=> (not res!115236) (not e!152624))))

(assert (=> d!59303 (= res!115236 (contains!1636 lt!118860 lt!118857))))

(assert (=> d!59303 (= (addApplyDifferent!184 lt!118860 lt!118861 (minValue!4202 thiss!1504) lt!118857) lt!118942)))

(declare-fun b!235015 () Bool)

(assert (=> b!235015 (= e!152624 (not (= lt!118857 lt!118861)))))

(assert (= (and d!59303 res!115236) b!235015))

(assert (=> d!59303 m!256197))

(assert (=> d!59303 m!256199))

(declare-fun m!256393 () Bool)

(assert (=> d!59303 m!256393))

(assert (=> d!59303 m!256207))

(assert (=> d!59303 m!256197))

(declare-fun m!256395 () Bool)

(assert (=> d!59303 m!256395))

(assert (=> b!234836 d!59303))

(declare-fun d!59305 () Bool)

(declare-fun e!152625 () Bool)

(assert (=> d!59305 e!152625))

(declare-fun res!115237 () Bool)

(assert (=> d!59305 (=> (not res!115237) (not e!152625))))

(declare-fun lt!118943 () ListLongMap!3465)

(assert (=> d!59305 (= res!115237 (contains!1636 lt!118943 (_1!2286 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504)))))))

(declare-fun lt!118945 () List!3451)

(assert (=> d!59305 (= lt!118943 (ListLongMap!3466 lt!118945))))

(declare-fun lt!118944 () Unit!7231)

(declare-fun lt!118946 () Unit!7231)

(assert (=> d!59305 (= lt!118944 lt!118946)))

(assert (=> d!59305 (= (getValueByKey!267 lt!118945 (_1!2286 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504)))) (Some!272 (_2!2286 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504)))))))

(assert (=> d!59305 (= lt!118946 (lemmaContainsTupThenGetReturnValue!151 lt!118945 (_1!2286 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504))) (_2!2286 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504)))))))

(assert (=> d!59305 (= lt!118945 (insertStrictlySorted!154 (toList!1748 lt!118845) (_1!2286 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504))) (_2!2286 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504)))))))

(assert (=> d!59305 (= (+!635 lt!118845 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504))) lt!118943)))

(declare-fun b!235016 () Bool)

(declare-fun res!115238 () Bool)

(assert (=> b!235016 (=> (not res!115238) (not e!152625))))

(assert (=> b!235016 (= res!115238 (= (getValueByKey!267 (toList!1748 lt!118943) (_1!2286 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504)))) (Some!272 (_2!2286 (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504))))))))

(declare-fun b!235017 () Bool)

(assert (=> b!235017 (= e!152625 (contains!1638 (toList!1748 lt!118943) (tuple2!4551 lt!118859 (zeroValue!4202 thiss!1504))))))

(assert (= (and d!59305 res!115237) b!235016))

(assert (= (and b!235016 res!115238) b!235017))

(declare-fun m!256397 () Bool)

(assert (=> d!59305 m!256397))

(declare-fun m!256399 () Bool)

(assert (=> d!59305 m!256399))

(declare-fun m!256401 () Bool)

(assert (=> d!59305 m!256401))

(declare-fun m!256403 () Bool)

(assert (=> d!59305 m!256403))

(declare-fun m!256405 () Bool)

(assert (=> b!235016 m!256405))

(declare-fun m!256407 () Bool)

(assert (=> b!235017 m!256407))

(assert (=> b!234836 d!59305))

(declare-fun d!59307 () Bool)

(assert (=> d!59307 (= (apply!208 lt!118860 lt!118857) (get!2841 (getValueByKey!267 (toList!1748 lt!118860) lt!118857)))))

(declare-fun bs!8724 () Bool)

(assert (= bs!8724 d!59307))

(declare-fun m!256409 () Bool)

(assert (=> bs!8724 m!256409))

(assert (=> bs!8724 m!256409))

(declare-fun m!256411 () Bool)

(assert (=> bs!8724 m!256411))

(assert (=> b!234836 d!59307))

(declare-fun d!59309 () Bool)

(declare-fun e!152626 () Bool)

(assert (=> d!59309 e!152626))

(declare-fun res!115239 () Bool)

(assert (=> d!59309 (=> (not res!115239) (not e!152626))))

(declare-fun lt!118947 () ListLongMap!3465)

(assert (=> d!59309 (= res!115239 (contains!1636 lt!118947 (_1!2286 (tuple2!4551 lt!118843 (minValue!4202 thiss!1504)))))))

(declare-fun lt!118949 () List!3451)

(assert (=> d!59309 (= lt!118947 (ListLongMap!3466 lt!118949))))

(declare-fun lt!118948 () Unit!7231)

(declare-fun lt!118950 () Unit!7231)

(assert (=> d!59309 (= lt!118948 lt!118950)))

(assert (=> d!59309 (= (getValueByKey!267 lt!118949 (_1!2286 (tuple2!4551 lt!118843 (minValue!4202 thiss!1504)))) (Some!272 (_2!2286 (tuple2!4551 lt!118843 (minValue!4202 thiss!1504)))))))

(assert (=> d!59309 (= lt!118950 (lemmaContainsTupThenGetReturnValue!151 lt!118949 (_1!2286 (tuple2!4551 lt!118843 (minValue!4202 thiss!1504))) (_2!2286 (tuple2!4551 lt!118843 (minValue!4202 thiss!1504)))))))

(assert (=> d!59309 (= lt!118949 (insertStrictlySorted!154 (toList!1748 lt!118858) (_1!2286 (tuple2!4551 lt!118843 (minValue!4202 thiss!1504))) (_2!2286 (tuple2!4551 lt!118843 (minValue!4202 thiss!1504)))))))

(assert (=> d!59309 (= (+!635 lt!118858 (tuple2!4551 lt!118843 (minValue!4202 thiss!1504))) lt!118947)))

(declare-fun b!235018 () Bool)

(declare-fun res!115240 () Bool)

(assert (=> b!235018 (=> (not res!115240) (not e!152626))))

(assert (=> b!235018 (= res!115240 (= (getValueByKey!267 (toList!1748 lt!118947) (_1!2286 (tuple2!4551 lt!118843 (minValue!4202 thiss!1504)))) (Some!272 (_2!2286 (tuple2!4551 lt!118843 (minValue!4202 thiss!1504))))))))

(declare-fun b!235019 () Bool)

(assert (=> b!235019 (= e!152626 (contains!1638 (toList!1748 lt!118947) (tuple2!4551 lt!118843 (minValue!4202 thiss!1504))))))

(assert (= (and d!59309 res!115239) b!235018))

(assert (= (and b!235018 res!115240) b!235019))

(declare-fun m!256413 () Bool)

(assert (=> d!59309 m!256413))

(declare-fun m!256415 () Bool)

(assert (=> d!59309 m!256415))

(declare-fun m!256417 () Bool)

(assert (=> d!59309 m!256417))

(declare-fun m!256419 () Bool)

(assert (=> d!59309 m!256419))

(declare-fun m!256421 () Bool)

(assert (=> b!235018 m!256421))

(declare-fun m!256423 () Bool)

(assert (=> b!235019 m!256423))

(assert (=> b!234836 d!59309))

(declare-fun d!59311 () Bool)

(assert (=> d!59311 (= (apply!208 (+!635 lt!118858 (tuple2!4551 lt!118843 (minValue!4202 thiss!1504))) lt!118854) (apply!208 lt!118858 lt!118854))))

(declare-fun lt!118951 () Unit!7231)

(assert (=> d!59311 (= lt!118951 (choose!1109 lt!118858 lt!118843 (minValue!4202 thiss!1504) lt!118854))))

(declare-fun e!152627 () Bool)

(assert (=> d!59311 e!152627))

(declare-fun res!115241 () Bool)

(assert (=> d!59311 (=> (not res!115241) (not e!152627))))

(assert (=> d!59311 (= res!115241 (contains!1636 lt!118858 lt!118854))))

(assert (=> d!59311 (= (addApplyDifferent!184 lt!118858 lt!118843 (minValue!4202 thiss!1504) lt!118854) lt!118951)))

(declare-fun b!235020 () Bool)

(assert (=> b!235020 (= e!152627 (not (= lt!118854 lt!118843)))))

(assert (= (and d!59311 res!115241) b!235020))

(assert (=> d!59311 m!256217))

(assert (=> d!59311 m!256219))

(declare-fun m!256425 () Bool)

(assert (=> d!59311 m!256425))

(assert (=> d!59311 m!256221))

(assert (=> d!59311 m!256217))

(declare-fun m!256427 () Bool)

(assert (=> d!59311 m!256427))

(assert (=> b!234836 d!59311))

(declare-fun b!235029 () Bool)

(declare-fun e!152634 () Bool)

(declare-fun e!152636 () Bool)

(assert (=> b!235029 (= e!152634 e!152636)))

(declare-fun c!39178 () Bool)

(assert (=> b!235029 (= c!39178 (validKeyInArray!0 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21837 () Bool)

(declare-fun call!21840 () Bool)

(assert (=> bm!21837 (= call!21840 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6429 thiss!1504) (mask!10315 thiss!1504)))))

(declare-fun b!235030 () Bool)

(declare-fun e!152635 () Bool)

(assert (=> b!235030 (= e!152636 e!152635)))

(declare-fun lt!118960 () (_ BitVec 64))

(assert (=> b!235030 (= lt!118960 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118959 () Unit!7231)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11603 (_ BitVec 64) (_ BitVec 32)) Unit!7231)

(assert (=> b!235030 (= lt!118959 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6429 thiss!1504) lt!118960 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!235030 (arrayContainsKey!0 (_keys!6429 thiss!1504) lt!118960 #b00000000000000000000000000000000)))

(declare-fun lt!118958 () Unit!7231)

(assert (=> b!235030 (= lt!118958 lt!118959)))

(declare-fun res!115246 () Bool)

(assert (=> b!235030 (= res!115246 (= (seekEntryOrOpen!0 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000) (_keys!6429 thiss!1504) (mask!10315 thiss!1504)) (Found!954 #b00000000000000000000000000000000)))))

(assert (=> b!235030 (=> (not res!115246) (not e!152635))))

(declare-fun b!235031 () Bool)

(assert (=> b!235031 (= e!152636 call!21840)))

(declare-fun d!59313 () Bool)

(declare-fun res!115247 () Bool)

(assert (=> d!59313 (=> res!115247 e!152634)))

(assert (=> d!59313 (= res!115247 (bvsge #b00000000000000000000000000000000 (size!5852 (_keys!6429 thiss!1504))))))

(assert (=> d!59313 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6429 thiss!1504) (mask!10315 thiss!1504)) e!152634)))

(declare-fun b!235032 () Bool)

(assert (=> b!235032 (= e!152635 call!21840)))

(assert (= (and d!59313 (not res!115247)) b!235029))

(assert (= (and b!235029 c!39178) b!235030))

(assert (= (and b!235029 (not c!39178)) b!235031))

(assert (= (and b!235030 res!115246) b!235032))

(assert (= (or b!235032 b!235031) bm!21837))

(assert (=> b!235029 m!256175))

(assert (=> b!235029 m!256175))

(assert (=> b!235029 m!256187))

(declare-fun m!256429 () Bool)

(assert (=> bm!21837 m!256429))

(assert (=> b!235030 m!256175))

(declare-fun m!256431 () Bool)

(assert (=> b!235030 m!256431))

(declare-fun m!256433 () Bool)

(assert (=> b!235030 m!256433))

(assert (=> b!235030 m!256175))

(declare-fun m!256435 () Bool)

(assert (=> b!235030 m!256435))

(assert (=> b!234775 d!59313))

(declare-fun d!59315 () Bool)

(declare-fun res!115252 () Bool)

(declare-fun e!152641 () Bool)

(assert (=> d!59315 (=> res!115252 e!152641)))

(assert (=> d!59315 (= res!115252 (and ((_ is Cons!3447) (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))) (= (_1!2286 (h!4098 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))))) key!932)))))

(assert (=> d!59315 (= (containsKey!258 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932) e!152641)))

(declare-fun b!235037 () Bool)

(declare-fun e!152642 () Bool)

(assert (=> b!235037 (= e!152641 e!152642)))

(declare-fun res!115253 () Bool)

(assert (=> b!235037 (=> (not res!115253) (not e!152642))))

(assert (=> b!235037 (= res!115253 (and (or (not ((_ is Cons!3447) (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))))) (bvsle (_1!2286 (h!4098 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))))) key!932)) ((_ is Cons!3447) (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))) (bvslt (_1!2286 (h!4098 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))))) key!932)))))

(declare-fun b!235038 () Bool)

(assert (=> b!235038 (= e!152642 (containsKey!258 (t!8412 (toList!1748 (getCurrentListMap!1280 (_keys!6429 thiss!1504) (_values!4344 thiss!1504) (mask!10315 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))) key!932))))

(assert (= (and d!59315 (not res!115252)) b!235037))

(assert (= (and b!235037 res!115253) b!235038))

(declare-fun m!256437 () Bool)

(assert (=> b!235038 m!256437))

(assert (=> d!59243 d!59315))

(declare-fun d!59317 () Bool)

(declare-fun e!152643 () Bool)

(assert (=> d!59317 e!152643))

(declare-fun res!115254 () Bool)

(assert (=> d!59317 (=> (not res!115254) (not e!152643))))

(declare-fun lt!118961 () ListLongMap!3465)

(assert (=> d!59317 (= res!115254 (contains!1636 lt!118961 (_1!2286 (ite (or c!39123 c!39124) (tuple2!4551 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))))))

(declare-fun lt!118963 () List!3451)

(assert (=> d!59317 (= lt!118961 (ListLongMap!3466 lt!118963))))

(declare-fun lt!118962 () Unit!7231)

(declare-fun lt!118964 () Unit!7231)

(assert (=> d!59317 (= lt!118962 lt!118964)))

(assert (=> d!59317 (= (getValueByKey!267 lt!118963 (_1!2286 (ite (or c!39123 c!39124) (tuple2!4551 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))) (Some!272 (_2!2286 (ite (or c!39123 c!39124) (tuple2!4551 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))))))

(assert (=> d!59317 (= lt!118964 (lemmaContainsTupThenGetReturnValue!151 lt!118963 (_1!2286 (ite (or c!39123 c!39124) (tuple2!4551 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))) (_2!2286 (ite (or c!39123 c!39124) (tuple2!4551 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))))))

(assert (=> d!59317 (= lt!118963 (insertStrictlySorted!154 (toList!1748 (ite c!39123 call!21825 (ite c!39124 call!21823 call!21826))) (_1!2286 (ite (or c!39123 c!39124) (tuple2!4551 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))) (_2!2286 (ite (or c!39123 c!39124) (tuple2!4551 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))))))

(assert (=> d!59317 (= (+!635 (ite c!39123 call!21825 (ite c!39124 call!21823 call!21826)) (ite (or c!39123 c!39124) (tuple2!4551 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))) lt!118961)))

(declare-fun b!235039 () Bool)

(declare-fun res!115255 () Bool)

(assert (=> b!235039 (=> (not res!115255) (not e!152643))))

(assert (=> b!235039 (= res!115255 (= (getValueByKey!267 (toList!1748 lt!118961) (_1!2286 (ite (or c!39123 c!39124) (tuple2!4551 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))) (Some!272 (_2!2286 (ite (or c!39123 c!39124) (tuple2!4551 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))))))))

(declare-fun b!235040 () Bool)

(assert (=> b!235040 (= e!152643 (contains!1638 (toList!1748 lt!118961) (ite (or c!39123 c!39124) (tuple2!4551 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))))))

(assert (= (and d!59317 res!115254) b!235039))

(assert (= (and b!235039 res!115255) b!235040))

(declare-fun m!256439 () Bool)

(assert (=> d!59317 m!256439))

(declare-fun m!256441 () Bool)

(assert (=> d!59317 m!256441))

(declare-fun m!256443 () Bool)

(assert (=> d!59317 m!256443))

(declare-fun m!256445 () Bool)

(assert (=> d!59317 m!256445))

(declare-fun m!256447 () Bool)

(assert (=> b!235039 m!256447))

(declare-fun m!256449 () Bool)

(assert (=> b!235040 m!256449))

(assert (=> bm!21822 d!59317))

(declare-fun d!59319 () Bool)

(declare-fun e!152644 () Bool)

(assert (=> d!59319 e!152644))

(declare-fun res!115256 () Bool)

(assert (=> d!59319 (=> res!115256 e!152644)))

(declare-fun lt!118968 () Bool)

(assert (=> d!59319 (= res!115256 (not lt!118968))))

(declare-fun lt!118965 () Bool)

(assert (=> d!59319 (= lt!118968 lt!118965)))

(declare-fun lt!118966 () Unit!7231)

(declare-fun e!152645 () Unit!7231)

(assert (=> d!59319 (= lt!118966 e!152645)))

(declare-fun c!39179 () Bool)

(assert (=> d!59319 (= c!39179 lt!118965)))

(assert (=> d!59319 (= lt!118965 (containsKey!258 (toList!1748 lt!118855) (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59319 (= (contains!1636 lt!118855 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)) lt!118968)))

(declare-fun b!235041 () Bool)

(declare-fun lt!118967 () Unit!7231)

(assert (=> b!235041 (= e!152645 lt!118967)))

(assert (=> b!235041 (= lt!118967 (lemmaContainsKeyImpliesGetValueByKeyDefined!206 (toList!1748 lt!118855) (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!235041 (isDefined!207 (getValueByKey!267 (toList!1748 lt!118855) (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235042 () Bool)

(declare-fun Unit!7238 () Unit!7231)

(assert (=> b!235042 (= e!152645 Unit!7238)))

(declare-fun b!235043 () Bool)

(assert (=> b!235043 (= e!152644 (isDefined!207 (getValueByKey!267 (toList!1748 lt!118855) (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59319 c!39179) b!235041))

(assert (= (and d!59319 (not c!39179)) b!235042))

(assert (= (and d!59319 (not res!115256)) b!235043))

(assert (=> d!59319 m!256175))

(declare-fun m!256451 () Bool)

(assert (=> d!59319 m!256451))

(assert (=> b!235041 m!256175))

(declare-fun m!256453 () Bool)

(assert (=> b!235041 m!256453))

(assert (=> b!235041 m!256175))

(assert (=> b!235041 m!256301))

(assert (=> b!235041 m!256301))

(declare-fun m!256455 () Bool)

(assert (=> b!235041 m!256455))

(assert (=> b!235043 m!256175))

(assert (=> b!235043 m!256301))

(assert (=> b!235043 m!256301))

(assert (=> b!235043 m!256455))

(assert (=> b!234844 d!59319))

(declare-fun b!235062 () Bool)

(declare-fun lt!118973 () SeekEntryResult!954)

(assert (=> b!235062 (and (bvsge (index!5988 lt!118973) #b00000000000000000000000000000000) (bvslt (index!5988 lt!118973) (size!5852 (_keys!6429 thiss!1504))))))

(declare-fun res!115263 () Bool)

(assert (=> b!235062 (= res!115263 (= (select (arr!5516 (_keys!6429 thiss!1504)) (index!5988 lt!118973)) key!932))))

(declare-fun e!152657 () Bool)

(assert (=> b!235062 (=> res!115263 e!152657)))

(declare-fun e!152658 () Bool)

(assert (=> b!235062 (= e!152658 e!152657)))

(declare-fun b!235063 () Bool)

(declare-fun e!152659 () SeekEntryResult!954)

(assert (=> b!235063 (= e!152659 (Intermediate!954 true (toIndex!0 key!932 (mask!10315 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!235064 () Bool)

(declare-fun e!152656 () SeekEntryResult!954)

(assert (=> b!235064 (= e!152656 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10315 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!10315 thiss!1504)) key!932 (_keys!6429 thiss!1504) (mask!10315 thiss!1504)))))

(declare-fun b!235065 () Bool)

(declare-fun e!152660 () Bool)

(assert (=> b!235065 (= e!152660 (bvsge (x!23696 lt!118973) #b01111111111111111111111111111110))))

(declare-fun b!235066 () Bool)

(assert (=> b!235066 (= e!152659 e!152656)))

(declare-fun c!39188 () Bool)

(declare-fun lt!118974 () (_ BitVec 64))

(assert (=> b!235066 (= c!39188 (or (= lt!118974 key!932) (= (bvadd lt!118974 lt!118974) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!59321 () Bool)

(assert (=> d!59321 e!152660))

(declare-fun c!39187 () Bool)

(assert (=> d!59321 (= c!39187 (and ((_ is Intermediate!954) lt!118973) (undefined!1766 lt!118973)))))

(assert (=> d!59321 (= lt!118973 e!152659)))

(declare-fun c!39186 () Bool)

(assert (=> d!59321 (= c!39186 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!59321 (= lt!118974 (select (arr!5516 (_keys!6429 thiss!1504)) (toIndex!0 key!932 (mask!10315 thiss!1504))))))

(assert (=> d!59321 (validMask!0 (mask!10315 thiss!1504))))

(assert (=> d!59321 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10315 thiss!1504)) key!932 (_keys!6429 thiss!1504) (mask!10315 thiss!1504)) lt!118973)))

(declare-fun b!235067 () Bool)

(assert (=> b!235067 (and (bvsge (index!5988 lt!118973) #b00000000000000000000000000000000) (bvslt (index!5988 lt!118973) (size!5852 (_keys!6429 thiss!1504))))))

(declare-fun res!115264 () Bool)

(assert (=> b!235067 (= res!115264 (= (select (arr!5516 (_keys!6429 thiss!1504)) (index!5988 lt!118973)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!235067 (=> res!115264 e!152657)))

(declare-fun b!235068 () Bool)

(assert (=> b!235068 (= e!152660 e!152658)))

(declare-fun res!115265 () Bool)

(assert (=> b!235068 (= res!115265 (and ((_ is Intermediate!954) lt!118973) (not (undefined!1766 lt!118973)) (bvslt (x!23696 lt!118973) #b01111111111111111111111111111110) (bvsge (x!23696 lt!118973) #b00000000000000000000000000000000) (bvsge (x!23696 lt!118973) #b00000000000000000000000000000000)))))

(assert (=> b!235068 (=> (not res!115265) (not e!152658))))

(declare-fun b!235069 () Bool)

(assert (=> b!235069 (= e!152656 (Intermediate!954 false (toIndex!0 key!932 (mask!10315 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!235070 () Bool)

(assert (=> b!235070 (and (bvsge (index!5988 lt!118973) #b00000000000000000000000000000000) (bvslt (index!5988 lt!118973) (size!5852 (_keys!6429 thiss!1504))))))

(assert (=> b!235070 (= e!152657 (= (select (arr!5516 (_keys!6429 thiss!1504)) (index!5988 lt!118973)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59321 c!39186) b!235063))

(assert (= (and d!59321 (not c!39186)) b!235066))

(assert (= (and b!235066 c!39188) b!235069))

(assert (= (and b!235066 (not c!39188)) b!235064))

(assert (= (and d!59321 c!39187) b!235065))

(assert (= (and d!59321 (not c!39187)) b!235068))

(assert (= (and b!235068 res!115265) b!235062))

(assert (= (and b!235062 (not res!115263)) b!235067))

(assert (= (and b!235067 (not res!115264)) b!235070))

(declare-fun m!256457 () Bool)

(assert (=> b!235067 m!256457))

(assert (=> d!59321 m!256241))

(declare-fun m!256459 () Bool)

(assert (=> d!59321 m!256459))

(assert (=> d!59321 m!256125))

(assert (=> b!235070 m!256457))

(assert (=> b!235062 m!256457))

(assert (=> b!235064 m!256241))

(declare-fun m!256461 () Bool)

(assert (=> b!235064 m!256461))

(assert (=> b!235064 m!256461))

(declare-fun m!256463 () Bool)

(assert (=> b!235064 m!256463))

(assert (=> d!59251 d!59321))

(declare-fun d!59323 () Bool)

(declare-fun lt!118980 () (_ BitVec 32))

(declare-fun lt!118979 () (_ BitVec 32))

(assert (=> d!59323 (= lt!118980 (bvmul (bvxor lt!118979 (bvlshr lt!118979 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59323 (= lt!118979 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59323 (and (bvsge (mask!10315 thiss!1504) #b00000000000000000000000000000000) (let ((res!115266 (let ((h!4100 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23715 (bvmul (bvxor h!4100 (bvlshr h!4100 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23715 (bvlshr x!23715 #b00000000000000000000000000001101)) (mask!10315 thiss!1504)))))) (and (bvslt res!115266 (bvadd (mask!10315 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!115266 #b00000000000000000000000000000000))))))

(assert (=> d!59323 (= (toIndex!0 key!932 (mask!10315 thiss!1504)) (bvand (bvxor lt!118980 (bvlshr lt!118980 #b00000000000000000000000000001101)) (mask!10315 thiss!1504)))))

(assert (=> d!59251 d!59323))

(assert (=> d!59251 d!59239))

(declare-fun d!59325 () Bool)

(assert (=> d!59325 (= (validKeyInArray!0 (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5516 (_keys!6429 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!234833 d!59325))

(assert (=> d!59245 d!59239))

(assert (=> b!234785 d!59271))

(assert (=> b!234785 d!59273))

(assert (=> b!234842 d!59325))

(declare-fun mapNonEmpty!10460 () Bool)

(declare-fun mapRes!10460 () Bool)

(declare-fun tp!22115 () Bool)

(declare-fun e!152661 () Bool)

(assert (=> mapNonEmpty!10460 (= mapRes!10460 (and tp!22115 e!152661))))

(declare-fun mapValue!10460 () ValueCell!2744)

(declare-fun mapRest!10460 () (Array (_ BitVec 32) ValueCell!2744))

(declare-fun mapKey!10460 () (_ BitVec 32))

(assert (=> mapNonEmpty!10460 (= mapRest!10459 (store mapRest!10460 mapKey!10460 mapValue!10460))))

(declare-fun b!235072 () Bool)

(declare-fun e!152662 () Bool)

(assert (=> b!235072 (= e!152662 tp_is_empty!6175)))

(declare-fun b!235071 () Bool)

(assert (=> b!235071 (= e!152661 tp_is_empty!6175)))

(declare-fun condMapEmpty!10460 () Bool)

(declare-fun mapDefault!10460 () ValueCell!2744)

(assert (=> mapNonEmpty!10459 (= condMapEmpty!10460 (= mapRest!10459 ((as const (Array (_ BitVec 32) ValueCell!2744)) mapDefault!10460)))))

(assert (=> mapNonEmpty!10459 (= tp!22114 (and e!152662 mapRes!10460))))

(declare-fun mapIsEmpty!10460 () Bool)

(assert (=> mapIsEmpty!10460 mapRes!10460))

(assert (= (and mapNonEmpty!10459 condMapEmpty!10460) mapIsEmpty!10460))

(assert (= (and mapNonEmpty!10459 (not condMapEmpty!10460)) mapNonEmpty!10460))

(assert (= (and mapNonEmpty!10460 ((_ is ValueCellFull!2744) mapValue!10460)) b!235071))

(assert (= (and mapNonEmpty!10459 ((_ is ValueCellFull!2744) mapDefault!10460)) b!235072))

(declare-fun m!256465 () Bool)

(assert (=> mapNonEmpty!10460 m!256465))

(declare-fun b_lambda!7917 () Bool)

(assert (= b_lambda!7913 (or (and b!234713 b_free!6313) b_lambda!7917)))

(declare-fun b_lambda!7919 () Bool)

(assert (= b_lambda!7915 (or (and b!234713 b_free!6313) b_lambda!7919)))

(check-sat (not b!235013) (not b!234985) (not b!235039) (not b!234930) (not d!59299) (not b!234877) (not b!234954) (not b!234927) (not b!235040) (not b!235016) (not d!59257) (not b!234929) (not b!235029) (not d!59301) (not b!234960) (not d!59309) (not d!59311) (not b!235011) (not d!59305) (not bm!21837) (not b!234921) (not b!235004) (not d!59259) (not b!235009) tp_is_empty!6175 (not d!59303) (not bm!21831) (not b!235038) (not d!59293) (not b!235041) (not d!59267) (not b!234894) (not d!59319) (not b!234922) (not d!59269) (not d!59263) (not d!59291) (not d!59295) (not b!234926) (not b!234920) (not b!234959) (not b_lambda!7911) (not d!59283) (not b!235017) (not b!234891) (not b!234944) (not d!59271) (not d!59307) (not d!59289) (not b!234879) b_and!13257 (not b_next!6313) (not b!234974) (not b!234990) (not b!234988) (not d!59253) (not d!59281) (not d!59321) (not d!59317) (not b!234963) (not d!59275) (not bm!21834) (not b!234986) (not b!235012) (not b!235030) (not d!59277) (not d!59287) (not b!235043) (not b!235003) (not b!234892) (not d!59297) (not b!235000) (not d!59261) (not mapNonEmpty!10460) (not b!234919) (not b!235064) (not b!235018) (not b_lambda!7919) (not b!235019) (not b!234953) (not d!59285) (not b_lambda!7917) (not bm!21828))
(check-sat b_and!13257 (not b_next!6313))
