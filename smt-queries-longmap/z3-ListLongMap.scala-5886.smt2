; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76014 () Bool)

(assert start!76014)

(declare-fun b!893355 () Bool)

(declare-fun b_free!15817 () Bool)

(declare-fun b_next!15817 () Bool)

(assert (=> b!893355 (= b_free!15817 (not b_next!15817))))

(declare-fun tp!55421 () Bool)

(declare-fun b_and!26067 () Bool)

(assert (=> b!893355 (= tp!55421 b_and!26067)))

(declare-fun mapNonEmpty!28772 () Bool)

(declare-fun mapRes!28772 () Bool)

(declare-fun tp!55420 () Bool)

(declare-fun e!498775 () Bool)

(assert (=> mapNonEmpty!28772 (= mapRes!28772 (and tp!55420 e!498775))))

(declare-datatypes ((array!52309 0))(
  ( (array!52310 (arr!25156 (Array (_ BitVec 32) (_ BitVec 64))) (size!25601 (_ BitVec 32))) )
))
(declare-datatypes ((V!29159 0))(
  ( (V!29160 (val!9123 Int)) )
))
(declare-datatypes ((ValueCell!8591 0))(
  ( (ValueCellFull!8591 (v!11598 V!29159)) (EmptyCell!8591) )
))
(declare-datatypes ((array!52311 0))(
  ( (array!52312 (arr!25157 (Array (_ BitVec 32) ValueCell!8591)) (size!25602 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4198 0))(
  ( (LongMapFixedSize!4199 (defaultEntry!5296 Int) (mask!25852 (_ BitVec 32)) (extraKeys!4990 (_ BitVec 32)) (zeroValue!5094 V!29159) (minValue!5094 V!29159) (_size!2154 (_ BitVec 32)) (_keys!10007 array!52309) (_values!5281 array!52311) (_vacant!2154 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4198)

(declare-fun mapKey!28772 () (_ BitVec 32))

(declare-fun mapValue!28772 () ValueCell!8591)

(declare-fun mapRest!28772 () (Array (_ BitVec 32) ValueCell!8591))

(assert (=> mapNonEmpty!28772 (= (arr!25157 (_values!5281 thiss!1181)) (store mapRest!28772 mapKey!28772 mapValue!28772))))

(declare-fun b!893354 () Bool)

(declare-fun e!498776 () Bool)

(declare-fun e!498777 () Bool)

(assert (=> b!893354 (= e!498776 (not e!498777))))

(declare-fun res!604980 () Bool)

(assert (=> b!893354 (=> res!604980 e!498777)))

(declare-datatypes ((SeekEntryResult!8805 0))(
  ( (MissingZero!8805 (index!37591 (_ BitVec 32))) (Found!8805 (index!37592 (_ BitVec 32))) (Intermediate!8805 (undefined!9617 Bool) (index!37593 (_ BitVec 32)) (x!75821 (_ BitVec 32))) (Undefined!8805) (MissingVacant!8805 (index!37594 (_ BitVec 32))) )
))
(declare-fun lt!403559 () SeekEntryResult!8805)

(get-info :version)

(assert (=> b!893354 (= res!604980 (not ((_ is Found!8805) lt!403559)))))

(declare-fun e!498785 () Bool)

(assert (=> b!893354 e!498785))

(declare-fun res!604977 () Bool)

(assert (=> b!893354 (=> res!604977 e!498785)))

(assert (=> b!893354 (= res!604977 (not ((_ is Found!8805) lt!403559)))))

(declare-datatypes ((Unit!30378 0))(
  ( (Unit!30379) )
))
(declare-fun lt!403555 () Unit!30378)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!55 (array!52309 array!52311 (_ BitVec 32) (_ BitVec 32) V!29159 V!29159 (_ BitVec 64)) Unit!30378)

(assert (=> b!893354 (= lt!403555 (lemmaSeekEntryGivesInRangeIndex!55 (_keys!10007 thiss!1181) (_values!5281 thiss!1181) (mask!25852 thiss!1181) (extraKeys!4990 thiss!1181) (zeroValue!5094 thiss!1181) (minValue!5094 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52309 (_ BitVec 32)) SeekEntryResult!8805)

(assert (=> b!893354 (= lt!403559 (seekEntry!0 key!785 (_keys!10007 thiss!1181) (mask!25852 thiss!1181)))))

(declare-fun e!498786 () Bool)

(declare-fun tp_is_empty!18145 () Bool)

(declare-fun e!498779 () Bool)

(declare-fun array_inv!19808 (array!52309) Bool)

(declare-fun array_inv!19809 (array!52311) Bool)

(assert (=> b!893355 (= e!498779 (and tp!55421 tp_is_empty!18145 (array_inv!19808 (_keys!10007 thiss!1181)) (array_inv!19809 (_values!5281 thiss!1181)) e!498786))))

(declare-fun res!604979 () Bool)

(assert (=> start!76014 (=> (not res!604979) (not e!498776))))

(declare-fun valid!1635 (LongMapFixedSize!4198) Bool)

(assert (=> start!76014 (= res!604979 (valid!1635 thiss!1181))))

(assert (=> start!76014 e!498776))

(assert (=> start!76014 e!498779))

(assert (=> start!76014 true))

(declare-fun b!893356 () Bool)

(declare-fun res!604978 () Bool)

(assert (=> b!893356 (=> (not res!604978) (not e!498776))))

(assert (=> b!893356 (= res!604978 (not (= key!785 (bvneg key!785))))))

(declare-fun b!893357 () Bool)

(declare-fun e!498780 () Bool)

(assert (=> b!893357 (= e!498780 tp_is_empty!18145)))

(declare-fun b!893358 () Bool)

(declare-fun res!604981 () Bool)

(declare-fun e!498783 () Bool)

(assert (=> b!893358 (=> (not res!604981) (not e!498783))))

(assert (=> b!893358 (= res!604981 (not (= (bvand (extraKeys!4990 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!498778 () Bool)

(assert (=> b!893358 (= e!498778 e!498783)))

(declare-fun b!893359 () Bool)

(declare-fun call!39561 () V!29159)

(assert (=> b!893359 (= e!498783 (= call!39561 (minValue!5094 thiss!1181)))))

(declare-fun bm!39557 () Bool)

(declare-fun call!39560 () V!29159)

(assert (=> bm!39557 (= call!39561 call!39560)))

(declare-fun b!893360 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!893360 (= e!498785 (inRange!0 (index!37592 lt!403559) (mask!25852 thiss!1181)))))

(declare-fun b!893361 () Bool)

(assert (=> b!893361 (= e!498775 tp_is_empty!18145)))

(declare-fun b!893362 () Bool)

(declare-fun e!498781 () Bool)

(assert (=> b!893362 (= e!498781 e!498778)))

(declare-fun c!94233 () Bool)

(assert (=> b!893362 (= c!94233 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893363 () Bool)

(declare-fun e!498782 () Bool)

(assert (=> b!893363 (= e!498782 (= call!39560 (zeroValue!5094 thiss!1181)))))

(declare-fun b!893364 () Bool)

(assert (=> b!893364 (= e!498781 e!498782)))

(declare-fun res!604976 () Bool)

(assert (=> b!893364 (= res!604976 (not (= (bvand (extraKeys!4990 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!893364 (=> (not res!604976) (not e!498782))))

(declare-fun mapIsEmpty!28772 () Bool)

(assert (=> mapIsEmpty!28772 mapRes!28772))

(declare-fun b!893365 () Bool)

(assert (=> b!893365 (= e!498777 true)))

(assert (=> b!893365 e!498781))

(declare-fun c!94232 () Bool)

(assert (=> b!893365 (= c!94232 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!403558 () Unit!30378)

(declare-fun lemmaKeyInListMapThenSameValueInArray!3 (array!52309 array!52311 (_ BitVec 32) (_ BitVec 32) V!29159 V!29159 (_ BitVec 64) (_ BitVec 32) Int) Unit!30378)

(assert (=> b!893365 (= lt!403558 (lemmaKeyInListMapThenSameValueInArray!3 (_keys!10007 thiss!1181) (_values!5281 thiss!1181) (mask!25852 thiss!1181) (extraKeys!4990 thiss!1181) (zeroValue!5094 thiss!1181) (minValue!5094 thiss!1181) key!785 (index!37592 lt!403559) (defaultEntry!5296 thiss!1181)))))

(declare-datatypes ((tuple2!11914 0))(
  ( (tuple2!11915 (_1!5968 (_ BitVec 64)) (_2!5968 V!29159)) )
))
(declare-datatypes ((List!17738 0))(
  ( (Nil!17735) (Cons!17734 (h!18871 tuple2!11914) (t!25031 List!17738)) )
))
(declare-datatypes ((ListLongMap!10613 0))(
  ( (ListLongMap!10614 (toList!5322 List!17738)) )
))
(declare-fun lt!403557 () ListLongMap!10613)

(declare-fun contains!4335 (ListLongMap!10613 (_ BitVec 64)) Bool)

(assert (=> b!893365 (contains!4335 lt!403557 (select (arr!25156 (_keys!10007 thiss!1181)) (index!37592 lt!403559)))))

(declare-fun getCurrentListMap!2599 (array!52309 array!52311 (_ BitVec 32) (_ BitVec 32) V!29159 V!29159 (_ BitVec 32) Int) ListLongMap!10613)

(assert (=> b!893365 (= lt!403557 (getCurrentListMap!2599 (_keys!10007 thiss!1181) (_values!5281 thiss!1181) (mask!25852 thiss!1181) (extraKeys!4990 thiss!1181) (zeroValue!5094 thiss!1181) (minValue!5094 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5296 thiss!1181)))))

(declare-fun lt!403554 () Unit!30378)

(declare-fun lemmaValidKeyInArrayIsInListMap!229 (array!52309 array!52311 (_ BitVec 32) (_ BitVec 32) V!29159 V!29159 (_ BitVec 32) Int) Unit!30378)

(assert (=> b!893365 (= lt!403554 (lemmaValidKeyInArrayIsInListMap!229 (_keys!10007 thiss!1181) (_values!5281 thiss!1181) (mask!25852 thiss!1181) (extraKeys!4990 thiss!1181) (zeroValue!5094 thiss!1181) (minValue!5094 thiss!1181) (index!37592 lt!403559) (defaultEntry!5296 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!893365 (arrayContainsKey!0 (_keys!10007 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403556 () Unit!30378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52309 (_ BitVec 64) (_ BitVec 32)) Unit!30378)

(assert (=> b!893365 (= lt!403556 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10007 thiss!1181) key!785 (index!37592 lt!403559)))))

(declare-fun b!893366 () Bool)

(assert (=> b!893366 (= e!498786 (and e!498780 mapRes!28772))))

(declare-fun condMapEmpty!28772 () Bool)

(declare-fun mapDefault!28772 () ValueCell!8591)

(assert (=> b!893366 (= condMapEmpty!28772 (= (arr!25157 (_values!5281 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8591)) mapDefault!28772)))))

(declare-fun b!893367 () Bool)

(declare-fun get!13253 (ValueCell!8591 V!29159) V!29159)

(declare-fun dynLambda!1306 (Int (_ BitVec 64)) V!29159)

(assert (=> b!893367 (= e!498778 (= call!39561 (get!13253 (select (arr!25157 (_values!5281 thiss!1181)) (index!37592 lt!403559)) (dynLambda!1306 (defaultEntry!5296 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!39558 () Bool)

(declare-fun apply!397 (ListLongMap!10613 (_ BitVec 64)) V!29159)

(assert (=> bm!39558 (= call!39560 (apply!397 lt!403557 key!785))))

(assert (= (and start!76014 res!604979) b!893356))

(assert (= (and b!893356 res!604978) b!893354))

(assert (= (and b!893354 (not res!604977)) b!893360))

(assert (= (and b!893354 (not res!604980)) b!893365))

(assert (= (and b!893365 c!94232) b!893364))

(assert (= (and b!893365 (not c!94232)) b!893362))

(assert (= (and b!893364 res!604976) b!893363))

(assert (= (and b!893362 c!94233) b!893358))

(assert (= (and b!893362 (not c!94233)) b!893367))

(assert (= (and b!893358 res!604981) b!893359))

(assert (= (or b!893359 b!893367) bm!39557))

(assert (= (or b!893363 bm!39557) bm!39558))

(assert (= (and b!893366 condMapEmpty!28772) mapIsEmpty!28772))

(assert (= (and b!893366 (not condMapEmpty!28772)) mapNonEmpty!28772))

(assert (= (and mapNonEmpty!28772 ((_ is ValueCellFull!8591) mapValue!28772)) b!893361))

(assert (= (and b!893366 ((_ is ValueCellFull!8591) mapDefault!28772)) b!893357))

(assert (= b!893355 b!893366))

(assert (= start!76014 b!893355))

(declare-fun b_lambda!12897 () Bool)

(assert (=> (not b_lambda!12897) (not b!893367)))

(declare-fun t!25030 () Bool)

(declare-fun tb!5143 () Bool)

(assert (=> (and b!893355 (= (defaultEntry!5296 thiss!1181) (defaultEntry!5296 thiss!1181)) t!25030) tb!5143))

(declare-fun result!10005 () Bool)

(assert (=> tb!5143 (= result!10005 tp_is_empty!18145)))

(assert (=> b!893367 t!25030))

(declare-fun b_and!26069 () Bool)

(assert (= b_and!26067 (and (=> t!25030 result!10005) b_and!26069)))

(declare-fun m!831997 () Bool)

(assert (=> b!893360 m!831997))

(declare-fun m!831999 () Bool)

(assert (=> b!893365 m!831999))

(declare-fun m!832001 () Bool)

(assert (=> b!893365 m!832001))

(declare-fun m!832003 () Bool)

(assert (=> b!893365 m!832003))

(declare-fun m!832005 () Bool)

(assert (=> b!893365 m!832005))

(declare-fun m!832007 () Bool)

(assert (=> b!893365 m!832007))

(declare-fun m!832009 () Bool)

(assert (=> b!893365 m!832009))

(assert (=> b!893365 m!831999))

(declare-fun m!832011 () Bool)

(assert (=> b!893365 m!832011))

(declare-fun m!832013 () Bool)

(assert (=> b!893354 m!832013))

(declare-fun m!832015 () Bool)

(assert (=> b!893354 m!832015))

(declare-fun m!832017 () Bool)

(assert (=> mapNonEmpty!28772 m!832017))

(declare-fun m!832019 () Bool)

(assert (=> start!76014 m!832019))

(declare-fun m!832021 () Bool)

(assert (=> b!893355 m!832021))

(declare-fun m!832023 () Bool)

(assert (=> b!893355 m!832023))

(declare-fun m!832025 () Bool)

(assert (=> b!893367 m!832025))

(declare-fun m!832027 () Bool)

(assert (=> b!893367 m!832027))

(assert (=> b!893367 m!832025))

(assert (=> b!893367 m!832027))

(declare-fun m!832029 () Bool)

(assert (=> b!893367 m!832029))

(declare-fun m!832031 () Bool)

(assert (=> bm!39558 m!832031))

(check-sat (not b!893367) (not b!893365) (not b!893360) b_and!26069 (not mapNonEmpty!28772) (not start!76014) (not b_lambda!12897) (not b!893355) (not bm!39558) (not b!893354) (not b_next!15817) tp_is_empty!18145)
(check-sat b_and!26069 (not b_next!15817))
