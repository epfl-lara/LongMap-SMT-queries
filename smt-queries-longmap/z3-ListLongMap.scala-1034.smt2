; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21888 () Bool)

(assert start!21888)

(declare-fun b!221519 () Bool)

(declare-fun b_free!5955 () Bool)

(declare-fun b_next!5955 () Bool)

(assert (=> b!221519 (= b_free!5955 (not b_next!5955))))

(declare-fun tp!21006 () Bool)

(declare-fun b_and!12853 () Bool)

(assert (=> b!221519 (= tp!21006 b_and!12853)))

(declare-fun b!221512 () Bool)

(declare-fun e!143960 () Bool)

(declare-fun call!20699 () Bool)

(assert (=> b!221512 (= e!143960 (not call!20699))))

(declare-fun res!108681 () Bool)

(declare-fun e!143962 () Bool)

(assert (=> start!21888 (=> (not res!108681) (not e!143962))))

(declare-datatypes ((V!7403 0))(
  ( (V!7404 (val!2953 Int)) )
))
(declare-datatypes ((ValueCell!2565 0))(
  ( (ValueCellFull!2565 (v!4973 V!7403)) (EmptyCell!2565) )
))
(declare-datatypes ((array!10877 0))(
  ( (array!10878 (arr!5158 (Array (_ BitVec 32) ValueCell!2565)) (size!5491 (_ BitVec 32))) )
))
(declare-datatypes ((array!10879 0))(
  ( (array!10880 (arr!5159 (Array (_ BitVec 32) (_ BitVec 64))) (size!5492 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3030 0))(
  ( (LongMapFixedSize!3031 (defaultEntry!4174 Int) (mask!9986 (_ BitVec 32)) (extraKeys!3911 (_ BitVec 32)) (zeroValue!4015 V!7403) (minValue!4015 V!7403) (_size!1564 (_ BitVec 32)) (_keys!6228 array!10879) (_values!4157 array!10877) (_vacant!1564 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3030)

(declare-fun valid!1223 (LongMapFixedSize!3030) Bool)

(assert (=> start!21888 (= res!108681 (valid!1223 thiss!1504))))

(assert (=> start!21888 e!143962))

(declare-fun e!143966 () Bool)

(assert (=> start!21888 e!143966))

(assert (=> start!21888 true))

(declare-fun b!221513 () Bool)

(declare-fun res!108676 () Bool)

(declare-fun e!143965 () Bool)

(assert (=> b!221513 (=> (not res!108676) (not e!143965))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!221513 (= res!108676 (arrayContainsKey!0 (_keys!6228 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221514 () Bool)

(declare-fun e!143964 () Bool)

(declare-datatypes ((SeekEntryResult!826 0))(
  ( (MissingZero!826 (index!5474 (_ BitVec 32))) (Found!826 (index!5475 (_ BitVec 32))) (Intermediate!826 (undefined!1638 Bool) (index!5476 (_ BitVec 32)) (x!23014 (_ BitVec 32))) (Undefined!826) (MissingVacant!826 (index!5477 (_ BitVec 32))) )
))
(declare-fun lt!112426 () SeekEntryResult!826)

(get-info :version)

(assert (=> b!221514 (= e!143964 ((_ is Undefined!826) lt!112426))))

(declare-fun b!221515 () Bool)

(declare-fun res!108677 () Bool)

(assert (=> b!221515 (=> (not res!108677) (not e!143960))))

(assert (=> b!221515 (= res!108677 (= (select (arr!5159 (_keys!6228 thiss!1504)) (index!5474 lt!112426)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!221516 () Bool)

(declare-fun e!143961 () Bool)

(assert (=> b!221516 (= e!143964 e!143961)))

(declare-fun res!108675 () Bool)

(declare-fun call!20700 () Bool)

(assert (=> b!221516 (= res!108675 call!20700)))

(assert (=> b!221516 (=> (not res!108675) (not e!143961))))

(declare-fun b!221517 () Bool)

(declare-fun res!108678 () Bool)

(assert (=> b!221517 (=> (not res!108678) (not e!143962))))

(assert (=> b!221517 (= res!108678 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221518 () Bool)

(assert (=> b!221518 (= e!143965 false)))

(declare-fun lt!112427 () Bool)

(declare-datatypes ((List!3284 0))(
  ( (Nil!3281) (Cons!3280 (h!3928 (_ BitVec 64)) (t!8243 List!3284)) )
))
(declare-fun arrayNoDuplicates!0 (array!10879 (_ BitVec 32) List!3284) Bool)

(assert (=> b!221518 (= lt!112427 (arrayNoDuplicates!0 (_keys!6228 thiss!1504) #b00000000000000000000000000000000 Nil!3281))))

(declare-fun tp_is_empty!5817 () Bool)

(declare-fun e!143970 () Bool)

(declare-fun array_inv!3415 (array!10879) Bool)

(declare-fun array_inv!3416 (array!10877) Bool)

(assert (=> b!221519 (= e!143966 (and tp!21006 tp_is_empty!5817 (array_inv!3415 (_keys!6228 thiss!1504)) (array_inv!3416 (_values!4157 thiss!1504)) e!143970))))

(declare-fun b!221520 () Bool)

(declare-fun res!108683 () Bool)

(assert (=> b!221520 (=> (not res!108683) (not e!143965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!221520 (= res!108683 (validMask!0 (mask!9986 thiss!1504)))))

(declare-fun b!221521 () Bool)

(declare-fun res!108682 () Bool)

(assert (=> b!221521 (=> (not res!108682) (not e!143965))))

(assert (=> b!221521 (= res!108682 (and (= (size!5491 (_values!4157 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9986 thiss!1504))) (= (size!5492 (_keys!6228 thiss!1504)) (size!5491 (_values!4157 thiss!1504))) (bvsge (mask!9986 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3911 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3911 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!221522 () Bool)

(declare-datatypes ((Unit!6620 0))(
  ( (Unit!6621) )
))
(declare-fun e!143967 () Unit!6620)

(declare-fun lt!112424 () Unit!6620)

(assert (=> b!221522 (= e!143967 lt!112424)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!228 (array!10879 array!10877 (_ BitVec 32) (_ BitVec 32) V!7403 V!7403 (_ BitVec 64) Int) Unit!6620)

(assert (=> b!221522 (= lt!112424 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!228 (_keys!6228 thiss!1504) (_values!4157 thiss!1504) (mask!9986 thiss!1504) (extraKeys!3911 thiss!1504) (zeroValue!4015 thiss!1504) (minValue!4015 thiss!1504) key!932 (defaultEntry!4174 thiss!1504)))))

(declare-fun c!36831 () Bool)

(assert (=> b!221522 (= c!36831 ((_ is MissingZero!826) lt!112426))))

(declare-fun e!143972 () Bool)

(assert (=> b!221522 e!143972))

(declare-fun b!221523 () Bool)

(declare-fun res!108674 () Bool)

(assert (=> b!221523 (= res!108674 (= (select (arr!5159 (_keys!6228 thiss!1504)) (index!5477 lt!112426)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!221523 (=> (not res!108674) (not e!143961))))

(declare-fun b!221524 () Bool)

(declare-fun res!108679 () Bool)

(assert (=> b!221524 (=> (not res!108679) (not e!143965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10879 (_ BitVec 32)) Bool)

(assert (=> b!221524 (= res!108679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6228 thiss!1504) (mask!9986 thiss!1504)))))

(declare-fun b!221525 () Bool)

(declare-fun e!143968 () Bool)

(assert (=> b!221525 (= e!143968 e!143965)))

(declare-fun res!108680 () Bool)

(assert (=> b!221525 (=> (not res!108680) (not e!143965))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!221525 (= res!108680 (inRange!0 index!297 (mask!9986 thiss!1504)))))

(declare-fun lt!112423 () Unit!6620)

(assert (=> b!221525 (= lt!112423 e!143967)))

(declare-fun c!36829 () Bool)

(declare-datatypes ((tuple2!4382 0))(
  ( (tuple2!4383 (_1!2202 (_ BitVec 64)) (_2!2202 V!7403)) )
))
(declare-datatypes ((List!3285 0))(
  ( (Nil!3282) (Cons!3281 (h!3929 tuple2!4382) (t!8244 List!3285)) )
))
(declare-datatypes ((ListLongMap!3295 0))(
  ( (ListLongMap!3296 (toList!1663 List!3285)) )
))
(declare-fun contains!1506 (ListLongMap!3295 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1191 (array!10879 array!10877 (_ BitVec 32) (_ BitVec 32) V!7403 V!7403 (_ BitVec 32) Int) ListLongMap!3295)

(assert (=> b!221525 (= c!36829 (contains!1506 (getCurrentListMap!1191 (_keys!6228 thiss!1504) (_values!4157 thiss!1504) (mask!9986 thiss!1504) (extraKeys!3911 thiss!1504) (zeroValue!4015 thiss!1504) (minValue!4015 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4174 thiss!1504)) key!932))))

(declare-fun b!221526 () Bool)

(assert (=> b!221526 (= e!143961 (not call!20699))))

(declare-fun b!221527 () Bool)

(declare-fun e!143971 () Bool)

(declare-fun mapRes!9895 () Bool)

(assert (=> b!221527 (= e!143970 (and e!143971 mapRes!9895))))

(declare-fun condMapEmpty!9895 () Bool)

(declare-fun mapDefault!9895 () ValueCell!2565)

(assert (=> b!221527 (= condMapEmpty!9895 (= (arr!5158 (_values!4157 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2565)) mapDefault!9895)))))

(declare-fun b!221528 () Bool)

(assert (=> b!221528 (= e!143962 e!143968)))

(declare-fun res!108684 () Bool)

(assert (=> b!221528 (=> (not res!108684) (not e!143968))))

(assert (=> b!221528 (= res!108684 (or (= lt!112426 (MissingZero!826 index!297)) (= lt!112426 (MissingVacant!826 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10879 (_ BitVec 32)) SeekEntryResult!826)

(assert (=> b!221528 (= lt!112426 (seekEntryOrOpen!0 key!932 (_keys!6228 thiss!1504) (mask!9986 thiss!1504)))))

(declare-fun b!221529 () Bool)

(declare-fun c!36830 () Bool)

(assert (=> b!221529 (= c!36830 ((_ is MissingVacant!826) lt!112426))))

(assert (=> b!221529 (= e!143972 e!143964)))

(declare-fun b!221530 () Bool)

(declare-fun Unit!6622 () Unit!6620)

(assert (=> b!221530 (= e!143967 Unit!6622)))

(declare-fun lt!112425 () Unit!6620)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!217 (array!10879 array!10877 (_ BitVec 32) (_ BitVec 32) V!7403 V!7403 (_ BitVec 64) Int) Unit!6620)

(assert (=> b!221530 (= lt!112425 (lemmaInListMapThenSeekEntryOrOpenFindsIt!217 (_keys!6228 thiss!1504) (_values!4157 thiss!1504) (mask!9986 thiss!1504) (extraKeys!3911 thiss!1504) (zeroValue!4015 thiss!1504) (minValue!4015 thiss!1504) key!932 (defaultEntry!4174 thiss!1504)))))

(assert (=> b!221530 false))

(declare-fun bm!20696 () Bool)

(assert (=> bm!20696 (= call!20699 (arrayContainsKey!0 (_keys!6228 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221531 () Bool)

(declare-fun res!108685 () Bool)

(assert (=> b!221531 (=> (not res!108685) (not e!143960))))

(assert (=> b!221531 (= res!108685 call!20700)))

(assert (=> b!221531 (= e!143972 e!143960)))

(declare-fun mapNonEmpty!9895 () Bool)

(declare-fun tp!21007 () Bool)

(declare-fun e!143969 () Bool)

(assert (=> mapNonEmpty!9895 (= mapRes!9895 (and tp!21007 e!143969))))

(declare-fun mapValue!9895 () ValueCell!2565)

(declare-fun mapKey!9895 () (_ BitVec 32))

(declare-fun mapRest!9895 () (Array (_ BitVec 32) ValueCell!2565))

(assert (=> mapNonEmpty!9895 (= (arr!5158 (_values!4157 thiss!1504)) (store mapRest!9895 mapKey!9895 mapValue!9895))))

(declare-fun b!221532 () Bool)

(assert (=> b!221532 (= e!143971 tp_is_empty!5817)))

(declare-fun b!221533 () Bool)

(assert (=> b!221533 (= e!143969 tp_is_empty!5817)))

(declare-fun bm!20697 () Bool)

(assert (=> bm!20697 (= call!20700 (inRange!0 (ite c!36831 (index!5474 lt!112426) (index!5477 lt!112426)) (mask!9986 thiss!1504)))))

(declare-fun mapIsEmpty!9895 () Bool)

(assert (=> mapIsEmpty!9895 mapRes!9895))

(assert (= (and start!21888 res!108681) b!221517))

(assert (= (and b!221517 res!108678) b!221528))

(assert (= (and b!221528 res!108684) b!221525))

(assert (= (and b!221525 c!36829) b!221530))

(assert (= (and b!221525 (not c!36829)) b!221522))

(assert (= (and b!221522 c!36831) b!221531))

(assert (= (and b!221522 (not c!36831)) b!221529))

(assert (= (and b!221531 res!108685) b!221515))

(assert (= (and b!221515 res!108677) b!221512))

(assert (= (and b!221529 c!36830) b!221516))

(assert (= (and b!221529 (not c!36830)) b!221514))

(assert (= (and b!221516 res!108675) b!221523))

(assert (= (and b!221523 res!108674) b!221526))

(assert (= (or b!221531 b!221516) bm!20697))

(assert (= (or b!221512 b!221526) bm!20696))

(assert (= (and b!221525 res!108680) b!221513))

(assert (= (and b!221513 res!108676) b!221520))

(assert (= (and b!221520 res!108683) b!221521))

(assert (= (and b!221521 res!108682) b!221524))

(assert (= (and b!221524 res!108679) b!221518))

(assert (= (and b!221527 condMapEmpty!9895) mapIsEmpty!9895))

(assert (= (and b!221527 (not condMapEmpty!9895)) mapNonEmpty!9895))

(assert (= (and mapNonEmpty!9895 ((_ is ValueCellFull!2565) mapValue!9895)) b!221533))

(assert (= (and b!221527 ((_ is ValueCellFull!2565) mapDefault!9895)) b!221532))

(assert (= b!221519 b!221527))

(assert (= start!21888 b!221519))

(declare-fun m!246117 () Bool)

(assert (=> b!221525 m!246117))

(declare-fun m!246119 () Bool)

(assert (=> b!221525 m!246119))

(assert (=> b!221525 m!246119))

(declare-fun m!246121 () Bool)

(assert (=> b!221525 m!246121))

(declare-fun m!246123 () Bool)

(assert (=> mapNonEmpty!9895 m!246123))

(declare-fun m!246125 () Bool)

(assert (=> bm!20696 m!246125))

(declare-fun m!246127 () Bool)

(assert (=> b!221515 m!246127))

(declare-fun m!246129 () Bool)

(assert (=> b!221528 m!246129))

(declare-fun m!246131 () Bool)

(assert (=> b!221522 m!246131))

(declare-fun m!246133 () Bool)

(assert (=> bm!20697 m!246133))

(declare-fun m!246135 () Bool)

(assert (=> b!221524 m!246135))

(declare-fun m!246137 () Bool)

(assert (=> b!221518 m!246137))

(declare-fun m!246139 () Bool)

(assert (=> b!221523 m!246139))

(declare-fun m!246141 () Bool)

(assert (=> b!221520 m!246141))

(declare-fun m!246143 () Bool)

(assert (=> b!221519 m!246143))

(declare-fun m!246145 () Bool)

(assert (=> b!221519 m!246145))

(declare-fun m!246147 () Bool)

(assert (=> start!21888 m!246147))

(assert (=> b!221513 m!246125))

(declare-fun m!246149 () Bool)

(assert (=> b!221530 m!246149))

(check-sat tp_is_empty!5817 (not b!221520) (not b!221528) (not b!221518) (not b!221524) (not b!221513) b_and!12853 (not b!221530) (not b!221519) (not b!221522) (not bm!20696) (not b!221525) (not mapNonEmpty!9895) (not start!21888) (not b_next!5955) (not bm!20697))
(check-sat b_and!12853 (not b_next!5955))
