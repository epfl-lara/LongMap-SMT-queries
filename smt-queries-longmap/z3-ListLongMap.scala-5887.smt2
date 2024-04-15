; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75834 () Bool)

(assert start!75834)

(declare-fun b!892345 () Bool)

(declare-fun b_free!15823 () Bool)

(declare-fun b_next!15823 () Bool)

(assert (=> b!892345 (= b_free!15823 (not b_next!15823))))

(declare-fun tp!55438 () Bool)

(declare-fun b_and!26043 () Bool)

(assert (=> b!892345 (= tp!55438 b_and!26043)))

(declare-fun b!892344 () Bool)

(declare-fun e!498159 () Bool)

(declare-fun tp_is_empty!18151 () Bool)

(assert (=> b!892344 (= e!498159 tp_is_empty!18151)))

(declare-datatypes ((array!52265 0))(
  ( (array!52266 (arr!25139 (Array (_ BitVec 32) (_ BitVec 64))) (size!25585 (_ BitVec 32))) )
))
(declare-datatypes ((V!29167 0))(
  ( (V!29168 (val!9126 Int)) )
))
(declare-datatypes ((ValueCell!8594 0))(
  ( (ValueCellFull!8594 (v!11598 V!29167)) (EmptyCell!8594) )
))
(declare-datatypes ((array!52267 0))(
  ( (array!52268 (arr!25140 (Array (_ BitVec 32) ValueCell!8594)) (size!25586 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4204 0))(
  ( (LongMapFixedSize!4205 (defaultEntry!5299 Int) (mask!25807 (_ BitVec 32)) (extraKeys!4993 (_ BitVec 32)) (zeroValue!5097 V!29167) (minValue!5097 V!29167) (_size!2157 (_ BitVec 32)) (_keys!9977 array!52265) (_values!5284 array!52267) (_vacant!2157 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4204)

(declare-fun e!498158 () Bool)

(declare-fun e!498153 () Bool)

(declare-fun array_inv!19806 (array!52265) Bool)

(declare-fun array_inv!19807 (array!52267) Bool)

(assert (=> b!892345 (= e!498158 (and tp!55438 tp_is_empty!18151 (array_inv!19806 (_keys!9977 thiss!1181)) (array_inv!19807 (_values!5284 thiss!1181)) e!498153))))

(declare-fun b!892346 () Bool)

(declare-fun e!498164 () Bool)

(declare-fun e!498161 () Bool)

(assert (=> b!892346 (= e!498164 e!498161)))

(declare-fun c!93903 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!892346 (= c!93903 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!892347 () Bool)

(declare-fun e!498160 () Bool)

(assert (=> b!892347 (= e!498160 tp_is_empty!18151)))

(declare-fun mapIsEmpty!28781 () Bool)

(declare-fun mapRes!28781 () Bool)

(assert (=> mapIsEmpty!28781 mapRes!28781))

(declare-fun b!892348 () Bool)

(declare-fun e!498162 () Bool)

(declare-fun call!39507 () V!29167)

(assert (=> b!892348 (= e!498162 (= call!39507 (minValue!5097 thiss!1181)))))

(declare-fun b!892349 () Bool)

(declare-fun e!498154 () Bool)

(declare-datatypes ((SeekEntryResult!8855 0))(
  ( (MissingZero!8855 (index!37791 (_ BitVec 32))) (Found!8855 (index!37792 (_ BitVec 32))) (Intermediate!8855 (undefined!9667 Bool) (index!37793 (_ BitVec 32)) (x!75866 (_ BitVec 32))) (Undefined!8855) (MissingVacant!8855 (index!37794 (_ BitVec 32))) )
))
(declare-fun lt!403013 () SeekEntryResult!8855)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892349 (= e!498154 (inRange!0 (index!37792 lt!403013) (mask!25807 thiss!1181)))))

(declare-fun b!892350 () Bool)

(declare-fun get!13237 (ValueCell!8594 V!29167) V!29167)

(declare-fun dynLambda!1290 (Int (_ BitVec 64)) V!29167)

(assert (=> b!892350 (= e!498161 (= call!39507 (get!13237 (select (arr!25140 (_values!5284 thiss!1181)) (index!37792 lt!403013)) (dynLambda!1290 (defaultEntry!5299 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!892351 () Bool)

(assert (=> b!892351 (= e!498153 (and e!498160 mapRes!28781))))

(declare-fun condMapEmpty!28781 () Bool)

(declare-fun mapDefault!28781 () ValueCell!8594)

(assert (=> b!892351 (= condMapEmpty!28781 (= (arr!25140 (_values!5284 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8594)) mapDefault!28781)))))

(declare-fun res!604579 () Bool)

(declare-fun e!498156 () Bool)

(assert (=> start!75834 (=> (not res!604579) (not e!498156))))

(declare-fun valid!1631 (LongMapFixedSize!4204) Bool)

(assert (=> start!75834 (= res!604579 (valid!1631 thiss!1181))))

(assert (=> start!75834 e!498156))

(assert (=> start!75834 e!498158))

(assert (=> start!75834 true))

(declare-fun b!892352 () Bool)

(declare-fun res!604576 () Bool)

(assert (=> b!892352 (=> (not res!604576) (not e!498162))))

(assert (=> b!892352 (= res!604576 (not (= (bvand (extraKeys!4993 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!892352 (= e!498161 e!498162)))

(declare-fun b!892353 () Bool)

(declare-fun e!498157 () Bool)

(assert (=> b!892353 (= e!498156 (not e!498157))))

(declare-fun res!604580 () Bool)

(assert (=> b!892353 (=> res!604580 e!498157)))

(get-info :version)

(assert (=> b!892353 (= res!604580 (not ((_ is Found!8855) lt!403013)))))

(assert (=> b!892353 e!498154))

(declare-fun res!604577 () Bool)

(assert (=> b!892353 (=> res!604577 e!498154)))

(assert (=> b!892353 (= res!604577 (not ((_ is Found!8855) lt!403013)))))

(declare-datatypes ((Unit!30342 0))(
  ( (Unit!30343) )
))
(declare-fun lt!403014 () Unit!30342)

(declare-fun lemmaSeekEntryGivesInRangeIndex!55 (array!52265 array!52267 (_ BitVec 32) (_ BitVec 32) V!29167 V!29167 (_ BitVec 64)) Unit!30342)

(assert (=> b!892353 (= lt!403014 (lemmaSeekEntryGivesInRangeIndex!55 (_keys!9977 thiss!1181) (_values!5284 thiss!1181) (mask!25807 thiss!1181) (extraKeys!4993 thiss!1181) (zeroValue!5097 thiss!1181) (minValue!5097 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52265 (_ BitVec 32)) SeekEntryResult!8855)

(assert (=> b!892353 (= lt!403013 (seekEntry!0 key!785 (_keys!9977 thiss!1181) (mask!25807 thiss!1181)))))

(declare-fun b!892354 () Bool)

(declare-fun res!604578 () Bool)

(assert (=> b!892354 (=> (not res!604578) (not e!498156))))

(assert (=> b!892354 (= res!604578 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!28781 () Bool)

(declare-fun tp!55439 () Bool)

(assert (=> mapNonEmpty!28781 (= mapRes!28781 (and tp!55439 e!498159))))

(declare-fun mapKey!28781 () (_ BitVec 32))

(declare-fun mapRest!28781 () (Array (_ BitVec 32) ValueCell!8594))

(declare-fun mapValue!28781 () ValueCell!8594)

(assert (=> mapNonEmpty!28781 (= (arr!25140 (_values!5284 thiss!1181)) (store mapRest!28781 mapKey!28781 mapValue!28781))))

(declare-fun b!892355 () Bool)

(assert (=> b!892355 (= e!498157 true)))

(declare-fun lt!403018 () Bool)

(declare-fun contains!4337 (LongMapFixedSize!4204 (_ BitVec 64)) Bool)

(assert (=> b!892355 (= lt!403018 (contains!4337 thiss!1181 key!785))))

(assert (=> b!892355 e!498164))

(declare-fun c!93904 () Bool)

(assert (=> b!892355 (= c!93904 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!403015 () Unit!30342)

(declare-fun lemmaKeyInListMapThenSameValueInArray!5 (array!52265 array!52267 (_ BitVec 32) (_ BitVec 32) V!29167 V!29167 (_ BitVec 64) (_ BitVec 32) Int) Unit!30342)

(assert (=> b!892355 (= lt!403015 (lemmaKeyInListMapThenSameValueInArray!5 (_keys!9977 thiss!1181) (_values!5284 thiss!1181) (mask!25807 thiss!1181) (extraKeys!4993 thiss!1181) (zeroValue!5097 thiss!1181) (minValue!5097 thiss!1181) key!785 (index!37792 lt!403013) (defaultEntry!5299 thiss!1181)))))

(declare-datatypes ((tuple2!12016 0))(
  ( (tuple2!12017 (_1!6019 (_ BitVec 64)) (_2!6019 V!29167)) )
))
(declare-datatypes ((List!17794 0))(
  ( (Nil!17791) (Cons!17790 (h!18921 tuple2!12016) (t!25092 List!17794)) )
))
(declare-datatypes ((ListLongMap!10703 0))(
  ( (ListLongMap!10704 (toList!5367 List!17794)) )
))
(declare-fun lt!403016 () ListLongMap!10703)

(declare-fun contains!4338 (ListLongMap!10703 (_ BitVec 64)) Bool)

(assert (=> b!892355 (contains!4338 lt!403016 (select (arr!25139 (_keys!9977 thiss!1181)) (index!37792 lt!403013)))))

(declare-fun getCurrentListMap!2593 (array!52265 array!52267 (_ BitVec 32) (_ BitVec 32) V!29167 V!29167 (_ BitVec 32) Int) ListLongMap!10703)

(assert (=> b!892355 (= lt!403016 (getCurrentListMap!2593 (_keys!9977 thiss!1181) (_values!5284 thiss!1181) (mask!25807 thiss!1181) (extraKeys!4993 thiss!1181) (zeroValue!5097 thiss!1181) (minValue!5097 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5299 thiss!1181)))))

(declare-fun lt!403019 () Unit!30342)

(declare-fun lemmaValidKeyInArrayIsInListMap!229 (array!52265 array!52267 (_ BitVec 32) (_ BitVec 32) V!29167 V!29167 (_ BitVec 32) Int) Unit!30342)

(assert (=> b!892355 (= lt!403019 (lemmaValidKeyInArrayIsInListMap!229 (_keys!9977 thiss!1181) (_values!5284 thiss!1181) (mask!25807 thiss!1181) (extraKeys!4993 thiss!1181) (zeroValue!5097 thiss!1181) (minValue!5097 thiss!1181) (index!37792 lt!403013) (defaultEntry!5299 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892355 (arrayContainsKey!0 (_keys!9977 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403017 () Unit!30342)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52265 (_ BitVec 64) (_ BitVec 32)) Unit!30342)

(assert (=> b!892355 (= lt!403017 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9977 thiss!1181) key!785 (index!37792 lt!403013)))))

(declare-fun bm!39504 () Bool)

(declare-fun call!39508 () V!29167)

(declare-fun apply!399 (ListLongMap!10703 (_ BitVec 64)) V!29167)

(assert (=> bm!39504 (= call!39508 (apply!399 lt!403016 key!785))))

(declare-fun b!892356 () Bool)

(declare-fun e!498155 () Bool)

(assert (=> b!892356 (= e!498155 (= call!39508 (zeroValue!5097 thiss!1181)))))

(declare-fun b!892357 () Bool)

(assert (=> b!892357 (= e!498164 e!498155)))

(declare-fun res!604581 () Bool)

(assert (=> b!892357 (= res!604581 (not (= (bvand (extraKeys!4993 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!892357 (=> (not res!604581) (not e!498155))))

(declare-fun bm!39505 () Bool)

(assert (=> bm!39505 (= call!39507 call!39508)))

(assert (= (and start!75834 res!604579) b!892354))

(assert (= (and b!892354 res!604578) b!892353))

(assert (= (and b!892353 (not res!604577)) b!892349))

(assert (= (and b!892353 (not res!604580)) b!892355))

(assert (= (and b!892355 c!93904) b!892357))

(assert (= (and b!892355 (not c!93904)) b!892346))

(assert (= (and b!892357 res!604581) b!892356))

(assert (= (and b!892346 c!93903) b!892352))

(assert (= (and b!892346 (not c!93903)) b!892350))

(assert (= (and b!892352 res!604576) b!892348))

(assert (= (or b!892348 b!892350) bm!39505))

(assert (= (or b!892356 bm!39505) bm!39504))

(assert (= (and b!892351 condMapEmpty!28781) mapIsEmpty!28781))

(assert (= (and b!892351 (not condMapEmpty!28781)) mapNonEmpty!28781))

(assert (= (and mapNonEmpty!28781 ((_ is ValueCellFull!8594) mapValue!28781)) b!892344))

(assert (= (and b!892351 ((_ is ValueCellFull!8594) mapDefault!28781)) b!892347))

(assert (= b!892345 b!892351))

(assert (= start!75834 b!892345))

(declare-fun b_lambda!12871 () Bool)

(assert (=> (not b_lambda!12871) (not b!892350)))

(declare-fun t!25091 () Bool)

(declare-fun tb!5149 () Bool)

(assert (=> (and b!892345 (= (defaultEntry!5299 thiss!1181) (defaultEntry!5299 thiss!1181)) t!25091) tb!5149))

(declare-fun result!10017 () Bool)

(assert (=> tb!5149 (= result!10017 tp_is_empty!18151)))

(assert (=> b!892350 t!25091))

(declare-fun b_and!26045 () Bool)

(assert (= b_and!26043 (and (=> t!25091 result!10017) b_and!26045)))

(declare-fun m!830053 () Bool)

(assert (=> mapNonEmpty!28781 m!830053))

(declare-fun m!830055 () Bool)

(assert (=> b!892349 m!830055))

(declare-fun m!830057 () Bool)

(assert (=> b!892353 m!830057))

(declare-fun m!830059 () Bool)

(assert (=> b!892353 m!830059))

(declare-fun m!830061 () Bool)

(assert (=> bm!39504 m!830061))

(declare-fun m!830063 () Bool)

(assert (=> b!892350 m!830063))

(declare-fun m!830065 () Bool)

(assert (=> b!892350 m!830065))

(assert (=> b!892350 m!830063))

(assert (=> b!892350 m!830065))

(declare-fun m!830067 () Bool)

(assert (=> b!892350 m!830067))

(declare-fun m!830069 () Bool)

(assert (=> b!892355 m!830069))

(declare-fun m!830071 () Bool)

(assert (=> b!892355 m!830071))

(declare-fun m!830073 () Bool)

(assert (=> b!892355 m!830073))

(declare-fun m!830075 () Bool)

(assert (=> b!892355 m!830075))

(declare-fun m!830077 () Bool)

(assert (=> b!892355 m!830077))

(declare-fun m!830079 () Bool)

(assert (=> b!892355 m!830079))

(declare-fun m!830081 () Bool)

(assert (=> b!892355 m!830081))

(assert (=> b!892355 m!830075))

(declare-fun m!830083 () Bool)

(assert (=> b!892355 m!830083))

(declare-fun m!830085 () Bool)

(assert (=> b!892345 m!830085))

(declare-fun m!830087 () Bool)

(assert (=> b!892345 m!830087))

(declare-fun m!830089 () Bool)

(assert (=> start!75834 m!830089))

(check-sat (not b!892349) (not b_next!15823) (not b!892345) (not b!892353) b_and!26045 (not b!892355) (not b_lambda!12871) (not bm!39504) (not start!75834) (not mapNonEmpty!28781) tp_is_empty!18151 (not b!892350))
(check-sat b_and!26045 (not b_next!15823))
