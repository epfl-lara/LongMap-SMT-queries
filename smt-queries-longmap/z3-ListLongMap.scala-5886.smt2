; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75848 () Bool)

(assert start!75848)

(declare-fun b!892507 () Bool)

(declare-fun b_free!15819 () Bool)

(declare-fun b_next!15819 () Bool)

(assert (=> b!892507 (= b_free!15819 (not b_next!15819))))

(declare-fun tp!55425 () Bool)

(declare-fun b_and!26061 () Bool)

(assert (=> b!892507 (= tp!55425 b_and!26061)))

(declare-fun b!892495 () Bool)

(declare-fun res!604655 () Bool)

(declare-fun e!498238 () Bool)

(assert (=> b!892495 (=> (not res!604655) (not e!498238))))

(declare-datatypes ((array!52274 0))(
  ( (array!52275 (arr!25143 (Array (_ BitVec 32) (_ BitVec 64))) (size!25587 (_ BitVec 32))) )
))
(declare-datatypes ((V!29161 0))(
  ( (V!29162 (val!9124 Int)) )
))
(declare-datatypes ((ValueCell!8592 0))(
  ( (ValueCellFull!8592 (v!11602 V!29161)) (EmptyCell!8592) )
))
(declare-datatypes ((array!52276 0))(
  ( (array!52277 (arr!25144 (Array (_ BitVec 32) ValueCell!8592)) (size!25588 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4200 0))(
  ( (LongMapFixedSize!4201 (defaultEntry!5297 Int) (mask!25810 (_ BitVec 32)) (extraKeys!4991 (_ BitVec 32)) (zeroValue!5095 V!29161) (minValue!5095 V!29161) (_size!2155 (_ BitVec 32)) (_keys!9980 array!52274) (_values!5282 array!52276) (_vacant!2155 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4200)

(assert (=> b!892495 (= res!604655 (not (= (bvand (extraKeys!4991 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!498237 () Bool)

(assert (=> b!892495 (= e!498237 e!498238)))

(declare-fun b!892496 () Bool)

(declare-fun e!498240 () Bool)

(declare-fun call!39522 () V!29161)

(assert (=> b!892496 (= e!498240 (= call!39522 (zeroValue!5095 thiss!1181)))))

(declare-fun call!39521 () V!29161)

(declare-fun b!892497 () Bool)

(declare-datatypes ((SeekEntryResult!8849 0))(
  ( (MissingZero!8849 (index!37767 (_ BitVec 32))) (Found!8849 (index!37768 (_ BitVec 32))) (Intermediate!8849 (undefined!9661 Bool) (index!37769 (_ BitVec 32)) (x!75853 (_ BitVec 32))) (Undefined!8849) (MissingVacant!8849 (index!37770 (_ BitVec 32))) )
))
(declare-fun lt!403212 () SeekEntryResult!8849)

(declare-fun get!13233 (ValueCell!8592 V!29161) V!29161)

(declare-fun dynLambda!1291 (Int (_ BitVec 64)) V!29161)

(assert (=> b!892497 (= e!498237 (= call!39521 (get!13233 (select (arr!25144 (_values!5282 thiss!1181)) (index!37768 lt!403212)) (dynLambda!1291 (defaultEntry!5297 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!892498 () Bool)

(declare-fun res!604654 () Bool)

(declare-fun e!498239 () Bool)

(assert (=> b!892498 (=> (not res!604654) (not e!498239))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!892498 (= res!604654 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892499 () Bool)

(assert (=> b!892499 (= e!498238 (= call!39521 (minValue!5095 thiss!1181)))))

(declare-fun res!604653 () Bool)

(assert (=> start!75848 (=> (not res!604653) (not e!498239))))

(declare-fun valid!1624 (LongMapFixedSize!4200) Bool)

(assert (=> start!75848 (= res!604653 (valid!1624 thiss!1181))))

(assert (=> start!75848 e!498239))

(declare-fun e!498234 () Bool)

(assert (=> start!75848 e!498234))

(assert (=> start!75848 true))

(declare-fun b!892500 () Bool)

(declare-fun e!498235 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892500 (= e!498235 (inRange!0 (index!37768 lt!403212) (mask!25810 thiss!1181)))))

(declare-fun b!892501 () Bool)

(declare-fun e!498232 () Bool)

(assert (=> b!892501 (= e!498232 e!498237)))

(declare-fun c!93957 () Bool)

(assert (=> b!892501 (= c!93957 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!892502 () Bool)

(assert (=> b!892502 (= e!498232 e!498240)))

(declare-fun res!604651 () Bool)

(assert (=> b!892502 (= res!604651 (not (= (bvand (extraKeys!4991 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!892502 (=> (not res!604651) (not e!498240))))

(declare-fun mapIsEmpty!28775 () Bool)

(declare-fun mapRes!28775 () Bool)

(assert (=> mapIsEmpty!28775 mapRes!28775))

(declare-fun b!892503 () Bool)

(declare-fun e!498229 () Bool)

(declare-fun tp_is_empty!18147 () Bool)

(assert (=> b!892503 (= e!498229 tp_is_empty!18147)))

(declare-fun mapNonEmpty!28775 () Bool)

(declare-fun tp!55426 () Bool)

(declare-fun e!498236 () Bool)

(assert (=> mapNonEmpty!28775 (= mapRes!28775 (and tp!55426 e!498236))))

(declare-fun mapKey!28775 () (_ BitVec 32))

(declare-fun mapRest!28775 () (Array (_ BitVec 32) ValueCell!8592))

(declare-fun mapValue!28775 () ValueCell!8592)

(assert (=> mapNonEmpty!28775 (= (arr!25144 (_values!5282 thiss!1181)) (store mapRest!28775 mapKey!28775 mapValue!28775))))

(declare-fun b!892504 () Bool)

(declare-fun e!498233 () Bool)

(assert (=> b!892504 (= e!498233 (and e!498229 mapRes!28775))))

(declare-fun condMapEmpty!28775 () Bool)

(declare-fun mapDefault!28775 () ValueCell!8592)

(assert (=> b!892504 (= condMapEmpty!28775 (= (arr!25144 (_values!5282 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8592)) mapDefault!28775)))))

(declare-fun bm!39518 () Bool)

(assert (=> bm!39518 (= call!39521 call!39522)))

(declare-fun b!892505 () Bool)

(declare-fun e!498230 () Bool)

(assert (=> b!892505 (= e!498230 true)))

(assert (=> b!892505 e!498232))

(declare-fun c!93956 () Bool)

(assert (=> b!892505 (= c!93956 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!30392 0))(
  ( (Unit!30393) )
))
(declare-fun lt!403214 () Unit!30392)

(declare-fun lemmaKeyInListMapThenSameValueInArray!4 (array!52274 array!52276 (_ BitVec 32) (_ BitVec 32) V!29161 V!29161 (_ BitVec 64) (_ BitVec 32) Int) Unit!30392)

(assert (=> b!892505 (= lt!403214 (lemmaKeyInListMapThenSameValueInArray!4 (_keys!9980 thiss!1181) (_values!5282 thiss!1181) (mask!25810 thiss!1181) (extraKeys!4991 thiss!1181) (zeroValue!5095 thiss!1181) (minValue!5095 thiss!1181) key!785 (index!37768 lt!403212) (defaultEntry!5297 thiss!1181)))))

(declare-datatypes ((tuple2!11998 0))(
  ( (tuple2!11999 (_1!6010 (_ BitVec 64)) (_2!6010 V!29161)) )
))
(declare-datatypes ((List!17786 0))(
  ( (Nil!17783) (Cons!17782 (h!18913 tuple2!11998) (t!25089 List!17786)) )
))
(declare-datatypes ((ListLongMap!10695 0))(
  ( (ListLongMap!10696 (toList!5363 List!17786)) )
))
(declare-fun lt!403213 () ListLongMap!10695)

(declare-fun contains!4365 (ListLongMap!10695 (_ BitVec 64)) Bool)

(assert (=> b!892505 (contains!4365 lt!403213 (select (arr!25143 (_keys!9980 thiss!1181)) (index!37768 lt!403212)))))

(declare-fun getCurrentListMap!2643 (array!52274 array!52276 (_ BitVec 32) (_ BitVec 32) V!29161 V!29161 (_ BitVec 32) Int) ListLongMap!10695)

(assert (=> b!892505 (= lt!403213 (getCurrentListMap!2643 (_keys!9980 thiss!1181) (_values!5282 thiss!1181) (mask!25810 thiss!1181) (extraKeys!4991 thiss!1181) (zeroValue!5095 thiss!1181) (minValue!5095 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5297 thiss!1181)))))

(declare-fun lt!403216 () Unit!30392)

(declare-fun lemmaValidKeyInArrayIsInListMap!232 (array!52274 array!52276 (_ BitVec 32) (_ BitVec 32) V!29161 V!29161 (_ BitVec 32) Int) Unit!30392)

(assert (=> b!892505 (= lt!403216 (lemmaValidKeyInArrayIsInListMap!232 (_keys!9980 thiss!1181) (_values!5282 thiss!1181) (mask!25810 thiss!1181) (extraKeys!4991 thiss!1181) (zeroValue!5095 thiss!1181) (minValue!5095 thiss!1181) (index!37768 lt!403212) (defaultEntry!5297 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892505 (arrayContainsKey!0 (_keys!9980 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403211 () Unit!30392)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52274 (_ BitVec 64) (_ BitVec 32)) Unit!30392)

(assert (=> b!892505 (= lt!403211 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9980 thiss!1181) key!785 (index!37768 lt!403212)))))

(declare-fun b!892506 () Bool)

(assert (=> b!892506 (= e!498239 (not e!498230))))

(declare-fun res!604652 () Bool)

(assert (=> b!892506 (=> res!604652 e!498230)))

(get-info :version)

(assert (=> b!892506 (= res!604652 (not ((_ is Found!8849) lt!403212)))))

(assert (=> b!892506 e!498235))

(declare-fun res!604650 () Bool)

(assert (=> b!892506 (=> res!604650 e!498235)))

(assert (=> b!892506 (= res!604650 (not ((_ is Found!8849) lt!403212)))))

(declare-fun lt!403215 () Unit!30392)

(declare-fun lemmaSeekEntryGivesInRangeIndex!48 (array!52274 array!52276 (_ BitVec 32) (_ BitVec 32) V!29161 V!29161 (_ BitVec 64)) Unit!30392)

(assert (=> b!892506 (= lt!403215 (lemmaSeekEntryGivesInRangeIndex!48 (_keys!9980 thiss!1181) (_values!5282 thiss!1181) (mask!25810 thiss!1181) (extraKeys!4991 thiss!1181) (zeroValue!5095 thiss!1181) (minValue!5095 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52274 (_ BitVec 32)) SeekEntryResult!8849)

(assert (=> b!892506 (= lt!403212 (seekEntry!0 key!785 (_keys!9980 thiss!1181) (mask!25810 thiss!1181)))))

(declare-fun array_inv!19746 (array!52274) Bool)

(declare-fun array_inv!19747 (array!52276) Bool)

(assert (=> b!892507 (= e!498234 (and tp!55425 tp_is_empty!18147 (array_inv!19746 (_keys!9980 thiss!1181)) (array_inv!19747 (_values!5282 thiss!1181)) e!498233))))

(declare-fun b!892508 () Bool)

(assert (=> b!892508 (= e!498236 tp_is_empty!18147)))

(declare-fun bm!39519 () Bool)

(declare-fun apply!401 (ListLongMap!10695 (_ BitVec 64)) V!29161)

(assert (=> bm!39519 (= call!39522 (apply!401 lt!403213 key!785))))

(assert (= (and start!75848 res!604653) b!892498))

(assert (= (and b!892498 res!604654) b!892506))

(assert (= (and b!892506 (not res!604650)) b!892500))

(assert (= (and b!892506 (not res!604652)) b!892505))

(assert (= (and b!892505 c!93956) b!892502))

(assert (= (and b!892505 (not c!93956)) b!892501))

(assert (= (and b!892502 res!604651) b!892496))

(assert (= (and b!892501 c!93957) b!892495))

(assert (= (and b!892501 (not c!93957)) b!892497))

(assert (= (and b!892495 res!604655) b!892499))

(assert (= (or b!892499 b!892497) bm!39518))

(assert (= (or b!892496 bm!39518) bm!39519))

(assert (= (and b!892504 condMapEmpty!28775) mapIsEmpty!28775))

(assert (= (and b!892504 (not condMapEmpty!28775)) mapNonEmpty!28775))

(assert (= (and mapNonEmpty!28775 ((_ is ValueCellFull!8592) mapValue!28775)) b!892508))

(assert (= (and b!892504 ((_ is ValueCellFull!8592) mapDefault!28775)) b!892503))

(assert (= b!892507 b!892504))

(assert (= start!75848 b!892507))

(declare-fun b_lambda!12885 () Bool)

(assert (=> (not b_lambda!12885) (not b!892497)))

(declare-fun t!25088 () Bool)

(declare-fun tb!5153 () Bool)

(assert (=> (and b!892507 (= (defaultEntry!5297 thiss!1181) (defaultEntry!5297 thiss!1181)) t!25088) tb!5153))

(declare-fun result!10017 () Bool)

(assert (=> tb!5153 (= result!10017 tp_is_empty!18147)))

(assert (=> b!892497 t!25088))

(declare-fun b_and!26063 () Bool)

(assert (= b_and!26061 (and (=> t!25088 result!10017) b_and!26063)))

(declare-fun m!830739 () Bool)

(assert (=> start!75848 m!830739))

(declare-fun m!830741 () Bool)

(assert (=> b!892497 m!830741))

(declare-fun m!830743 () Bool)

(assert (=> b!892497 m!830743))

(assert (=> b!892497 m!830741))

(assert (=> b!892497 m!830743))

(declare-fun m!830745 () Bool)

(assert (=> b!892497 m!830745))

(declare-fun m!830747 () Bool)

(assert (=> bm!39519 m!830747))

(declare-fun m!830749 () Bool)

(assert (=> b!892500 m!830749))

(declare-fun m!830751 () Bool)

(assert (=> mapNonEmpty!28775 m!830751))

(declare-fun m!830753 () Bool)

(assert (=> b!892507 m!830753))

(declare-fun m!830755 () Bool)

(assert (=> b!892507 m!830755))

(declare-fun m!830757 () Bool)

(assert (=> b!892505 m!830757))

(declare-fun m!830759 () Bool)

(assert (=> b!892505 m!830759))

(declare-fun m!830761 () Bool)

(assert (=> b!892505 m!830761))

(assert (=> b!892505 m!830759))

(declare-fun m!830763 () Bool)

(assert (=> b!892505 m!830763))

(declare-fun m!830765 () Bool)

(assert (=> b!892505 m!830765))

(declare-fun m!830767 () Bool)

(assert (=> b!892505 m!830767))

(declare-fun m!830769 () Bool)

(assert (=> b!892505 m!830769))

(declare-fun m!830771 () Bool)

(assert (=> b!892506 m!830771))

(declare-fun m!830773 () Bool)

(assert (=> b!892506 m!830773))

(check-sat b_and!26063 (not b!892506) (not b_next!15819) (not b!892505) (not start!75848) (not b!892500) (not b!892507) tp_is_empty!18147 (not b_lambda!12885) (not mapNonEmpty!28775) (not b!892497) (not bm!39519))
(check-sat b_and!26063 (not b_next!15819))
