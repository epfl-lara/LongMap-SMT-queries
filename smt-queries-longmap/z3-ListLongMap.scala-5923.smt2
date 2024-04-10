; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77052 () Bool)

(assert start!77052)

(declare-fun b!899875 () Bool)

(declare-fun b_free!16041 () Bool)

(declare-fun b_next!16041 () Bool)

(assert (=> b!899875 (= b_free!16041 (not b_next!16041))))

(declare-fun tp!56207 () Bool)

(declare-fun b_and!26355 () Bool)

(assert (=> b!899875 (= tp!56207 b_and!26355)))

(declare-fun b!899870 () Bool)

(declare-fun e!503584 () Bool)

(declare-datatypes ((array!52784 0))(
  ( (array!52785 (arr!25365 (Array (_ BitVec 32) (_ BitVec 64))) (size!25823 (_ BitVec 32))) )
))
(declare-datatypes ((V!29457 0))(
  ( (V!29458 (val!9235 Int)) )
))
(declare-datatypes ((ValueCell!8703 0))(
  ( (ValueCellFull!8703 (v!11730 V!29457)) (EmptyCell!8703) )
))
(declare-datatypes ((array!52786 0))(
  ( (array!52787 (arr!25366 (Array (_ BitVec 32) ValueCell!8703)) (size!25824 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4422 0))(
  ( (LongMapFixedSize!4423 (defaultEntry!5439 Int) (mask!26208 (_ BitVec 32)) (extraKeys!5162 (_ BitVec 32)) (zeroValue!5266 V!29457) (minValue!5266 V!29457) (_size!2266 (_ BitVec 32)) (_keys!10234 array!52784) (_values!5453 array!52786) (_vacant!2266 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4422)

(assert (=> b!899870 (= e!503584 (or (not (= (size!25824 (_values!5453 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26208 thiss!1181)))) (not (= (size!25823 (_keys!10234 thiss!1181)) (size!25824 (_values!5453 thiss!1181)))) (bvslt (mask!26208 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5162 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5162 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29223 () Bool)

(declare-fun mapRes!29223 () Bool)

(declare-fun tp!56206 () Bool)

(declare-fun e!503585 () Bool)

(assert (=> mapNonEmpty!29223 (= mapRes!29223 (and tp!56206 e!503585))))

(declare-fun mapRest!29223 () (Array (_ BitVec 32) ValueCell!8703))

(declare-fun mapKey!29223 () (_ BitVec 32))

(declare-fun mapValue!29223 () ValueCell!8703)

(assert (=> mapNonEmpty!29223 (= (arr!25366 (_values!5453 thiss!1181)) (store mapRest!29223 mapKey!29223 mapValue!29223))))

(declare-fun b!899871 () Bool)

(declare-fun tp_is_empty!18369 () Bool)

(assert (=> b!899871 (= e!503585 tp_is_empty!18369)))

(declare-fun res!607811 () Bool)

(declare-fun e!503580 () Bool)

(assert (=> start!77052 (=> (not res!607811) (not e!503580))))

(declare-fun valid!1698 (LongMapFixedSize!4422) Bool)

(assert (=> start!77052 (= res!607811 (valid!1698 thiss!1181))))

(assert (=> start!77052 e!503580))

(declare-fun e!503581 () Bool)

(assert (=> start!77052 e!503581))

(assert (=> start!77052 true))

(declare-fun b!899872 () Bool)

(declare-fun e!503582 () Bool)

(assert (=> b!899872 (= e!503582 e!503584)))

(declare-fun res!607815 () Bool)

(assert (=> b!899872 (=> res!607815 e!503584)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!899872 (= res!607815 (not (validMask!0 (mask!26208 thiss!1181))))))

(declare-datatypes ((SeekEntryResult!8935 0))(
  ( (MissingZero!8935 (index!38111 (_ BitVec 32))) (Found!8935 (index!38112 (_ BitVec 32))) (Intermediate!8935 (undefined!9747 Bool) (index!38113 (_ BitVec 32)) (x!76678 (_ BitVec 32))) (Undefined!8935) (MissingVacant!8935 (index!38114 (_ BitVec 32))) )
))
(declare-fun lt!406498 () SeekEntryResult!8935)

(declare-datatypes ((tuple2!12048 0))(
  ( (tuple2!12049 (_1!6035 (_ BitVec 64)) (_2!6035 V!29457)) )
))
(declare-datatypes ((List!17851 0))(
  ( (Nil!17848) (Cons!17847 (h!18992 tuple2!12048) (t!25200 List!17851)) )
))
(declare-datatypes ((ListLongMap!10745 0))(
  ( (ListLongMap!10746 (toList!5388 List!17851)) )
))
(declare-fun contains!4423 (ListLongMap!10745 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2662 (array!52784 array!52786 (_ BitVec 32) (_ BitVec 32) V!29457 V!29457 (_ BitVec 32) Int) ListLongMap!10745)

(assert (=> b!899872 (contains!4423 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498)))))

(declare-datatypes ((Unit!30576 0))(
  ( (Unit!30577) )
))
(declare-fun lt!406495 () Unit!30576)

(declare-fun lemmaValidKeyInArrayIsInListMap!251 (array!52784 array!52786 (_ BitVec 32) (_ BitVec 32) V!29457 V!29457 (_ BitVec 32) Int) Unit!30576)

(assert (=> b!899872 (= lt!406495 (lemmaValidKeyInArrayIsInListMap!251 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) (index!38112 lt!406498) (defaultEntry!5439 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!899872 (arrayContainsKey!0 (_keys!10234 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406497 () Unit!30576)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52784 (_ BitVec 64) (_ BitVec 32)) Unit!30576)

(assert (=> b!899872 (= lt!406497 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10234 thiss!1181) key!785 (index!38112 lt!406498)))))

(declare-fun b!899873 () Bool)

(declare-fun e!503583 () Bool)

(declare-fun e!503588 () Bool)

(assert (=> b!899873 (= e!503583 (and e!503588 mapRes!29223))))

(declare-fun condMapEmpty!29223 () Bool)

(declare-fun mapDefault!29223 () ValueCell!8703)

(assert (=> b!899873 (= condMapEmpty!29223 (= (arr!25366 (_values!5453 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8703)) mapDefault!29223)))))

(declare-fun mapIsEmpty!29223 () Bool)

(assert (=> mapIsEmpty!29223 mapRes!29223))

(declare-fun b!899874 () Bool)

(declare-fun res!607813 () Bool)

(assert (=> b!899874 (=> (not res!607813) (not e!503580))))

(assert (=> b!899874 (= res!607813 (not (= key!785 (bvneg key!785))))))

(declare-fun array_inv!19902 (array!52784) Bool)

(declare-fun array_inv!19903 (array!52786) Bool)

(assert (=> b!899875 (= e!503581 (and tp!56207 tp_is_empty!18369 (array_inv!19902 (_keys!10234 thiss!1181)) (array_inv!19903 (_values!5453 thiss!1181)) e!503583))))

(declare-fun b!899876 () Bool)

(assert (=> b!899876 (= e!503588 tp_is_empty!18369)))

(declare-fun b!899877 () Bool)

(assert (=> b!899877 (= e!503580 (not e!503582))))

(declare-fun res!607814 () Bool)

(assert (=> b!899877 (=> res!607814 e!503582)))

(get-info :version)

(assert (=> b!899877 (= res!607814 (not ((_ is Found!8935) lt!406498)))))

(declare-fun e!503586 () Bool)

(assert (=> b!899877 e!503586))

(declare-fun res!607812 () Bool)

(assert (=> b!899877 (=> res!607812 e!503586)))

(assert (=> b!899877 (= res!607812 (not ((_ is Found!8935) lt!406498)))))

(declare-fun lt!406496 () Unit!30576)

(declare-fun lemmaSeekEntryGivesInRangeIndex!99 (array!52784 array!52786 (_ BitVec 32) (_ BitVec 32) V!29457 V!29457 (_ BitVec 64)) Unit!30576)

(assert (=> b!899877 (= lt!406496 (lemmaSeekEntryGivesInRangeIndex!99 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52784 (_ BitVec 32)) SeekEntryResult!8935)

(assert (=> b!899877 (= lt!406498 (seekEntry!0 key!785 (_keys!10234 thiss!1181) (mask!26208 thiss!1181)))))

(declare-fun b!899878 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!899878 (= e!503586 (inRange!0 (index!38112 lt!406498) (mask!26208 thiss!1181)))))

(assert (= (and start!77052 res!607811) b!899874))

(assert (= (and b!899874 res!607813) b!899877))

(assert (= (and b!899877 (not res!607812)) b!899878))

(assert (= (and b!899877 (not res!607814)) b!899872))

(assert (= (and b!899872 (not res!607815)) b!899870))

(assert (= (and b!899873 condMapEmpty!29223) mapIsEmpty!29223))

(assert (= (and b!899873 (not condMapEmpty!29223)) mapNonEmpty!29223))

(assert (= (and mapNonEmpty!29223 ((_ is ValueCellFull!8703) mapValue!29223)) b!899871))

(assert (= (and b!899873 ((_ is ValueCellFull!8703) mapDefault!29223)) b!899876))

(assert (= b!899875 b!899873))

(assert (= start!77052 b!899875))

(declare-fun m!836349 () Bool)

(assert (=> start!77052 m!836349))

(declare-fun m!836351 () Bool)

(assert (=> b!899877 m!836351))

(declare-fun m!836353 () Bool)

(assert (=> b!899877 m!836353))

(declare-fun m!836355 () Bool)

(assert (=> b!899878 m!836355))

(declare-fun m!836357 () Bool)

(assert (=> mapNonEmpty!29223 m!836357))

(declare-fun m!836359 () Bool)

(assert (=> b!899875 m!836359))

(declare-fun m!836361 () Bool)

(assert (=> b!899875 m!836361))

(declare-fun m!836363 () Bool)

(assert (=> b!899872 m!836363))

(declare-fun m!836365 () Bool)

(assert (=> b!899872 m!836365))

(declare-fun m!836367 () Bool)

(assert (=> b!899872 m!836367))

(declare-fun m!836369 () Bool)

(assert (=> b!899872 m!836369))

(assert (=> b!899872 m!836365))

(declare-fun m!836371 () Bool)

(assert (=> b!899872 m!836371))

(declare-fun m!836373 () Bool)

(assert (=> b!899872 m!836373))

(assert (=> b!899872 m!836363))

(declare-fun m!836375 () Bool)

(assert (=> b!899872 m!836375))

(check-sat tp_is_empty!18369 (not b_next!16041) b_and!26355 (not start!77052) (not b!899878) (not b!899875) (not b!899872) (not mapNonEmpty!29223) (not b!899877))
(check-sat b_and!26355 (not b_next!16041))
(get-model)

(declare-fun d!111595 () Bool)

(assert (=> d!111595 (= (array_inv!19902 (_keys!10234 thiss!1181)) (bvsge (size!25823 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899875 d!111595))

(declare-fun d!111597 () Bool)

(assert (=> d!111597 (= (array_inv!19903 (_values!5453 thiss!1181)) (bvsge (size!25824 (_values!5453 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899875 d!111597))

(declare-fun d!111599 () Bool)

(assert (=> d!111599 (= (validMask!0 (mask!26208 thiss!1181)) (and (or (= (mask!26208 thiss!1181) #b00000000000000000000000000000111) (= (mask!26208 thiss!1181) #b00000000000000000000000000001111) (= (mask!26208 thiss!1181) #b00000000000000000000000000011111) (= (mask!26208 thiss!1181) #b00000000000000000000000000111111) (= (mask!26208 thiss!1181) #b00000000000000000000000001111111) (= (mask!26208 thiss!1181) #b00000000000000000000000011111111) (= (mask!26208 thiss!1181) #b00000000000000000000000111111111) (= (mask!26208 thiss!1181) #b00000000000000000000001111111111) (= (mask!26208 thiss!1181) #b00000000000000000000011111111111) (= (mask!26208 thiss!1181) #b00000000000000000000111111111111) (= (mask!26208 thiss!1181) #b00000000000000000001111111111111) (= (mask!26208 thiss!1181) #b00000000000000000011111111111111) (= (mask!26208 thiss!1181) #b00000000000000000111111111111111) (= (mask!26208 thiss!1181) #b00000000000000001111111111111111) (= (mask!26208 thiss!1181) #b00000000000000011111111111111111) (= (mask!26208 thiss!1181) #b00000000000000111111111111111111) (= (mask!26208 thiss!1181) #b00000000000001111111111111111111) (= (mask!26208 thiss!1181) #b00000000000011111111111111111111) (= (mask!26208 thiss!1181) #b00000000000111111111111111111111) (= (mask!26208 thiss!1181) #b00000000001111111111111111111111) (= (mask!26208 thiss!1181) #b00000000011111111111111111111111) (= (mask!26208 thiss!1181) #b00000000111111111111111111111111) (= (mask!26208 thiss!1181) #b00000001111111111111111111111111) (= (mask!26208 thiss!1181) #b00000011111111111111111111111111) (= (mask!26208 thiss!1181) #b00000111111111111111111111111111) (= (mask!26208 thiss!1181) #b00001111111111111111111111111111) (= (mask!26208 thiss!1181) #b00011111111111111111111111111111) (= (mask!26208 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26208 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!899872 d!111599))

(declare-fun d!111601 () Bool)

(assert (=> d!111601 (arrayContainsKey!0 (_keys!10234 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406513 () Unit!30576)

(declare-fun choose!13 (array!52784 (_ BitVec 64) (_ BitVec 32)) Unit!30576)

(assert (=> d!111601 (= lt!406513 (choose!13 (_keys!10234 thiss!1181) key!785 (index!38112 lt!406498)))))

(assert (=> d!111601 (bvsge (index!38112 lt!406498) #b00000000000000000000000000000000)))

(assert (=> d!111601 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10234 thiss!1181) key!785 (index!38112 lt!406498)) lt!406513)))

(declare-fun bs!25269 () Bool)

(assert (= bs!25269 d!111601))

(assert (=> bs!25269 m!836371))

(declare-fun m!836405 () Bool)

(assert (=> bs!25269 m!836405))

(assert (=> b!899872 d!111601))

(declare-fun d!111603 () Bool)

(declare-fun res!607835 () Bool)

(declare-fun e!503620 () Bool)

(assert (=> d!111603 (=> res!607835 e!503620)))

(assert (=> d!111603 (= res!607835 (= (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111603 (= (arrayContainsKey!0 (_keys!10234 thiss!1181) key!785 #b00000000000000000000000000000000) e!503620)))

(declare-fun b!899910 () Bool)

(declare-fun e!503621 () Bool)

(assert (=> b!899910 (= e!503620 e!503621)))

(declare-fun res!607836 () Bool)

(assert (=> b!899910 (=> (not res!607836) (not e!503621))))

(assert (=> b!899910 (= res!607836 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25823 (_keys!10234 thiss!1181))))))

(declare-fun b!899911 () Bool)

(assert (=> b!899911 (= e!503621 (arrayContainsKey!0 (_keys!10234 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111603 (not res!607835)) b!899910))

(assert (= (and b!899910 res!607836) b!899911))

(declare-fun m!836407 () Bool)

(assert (=> d!111603 m!836407))

(declare-fun m!836409 () Bool)

(assert (=> b!899911 m!836409))

(assert (=> b!899872 d!111603))

(declare-fun d!111605 () Bool)

(declare-fun e!503624 () Bool)

(assert (=> d!111605 e!503624))

(declare-fun res!607839 () Bool)

(assert (=> d!111605 (=> (not res!607839) (not e!503624))))

(assert (=> d!111605 (= res!607839 (and (bvsge (index!38112 lt!406498) #b00000000000000000000000000000000) (bvslt (index!38112 lt!406498) (size!25823 (_keys!10234 thiss!1181)))))))

(declare-fun lt!406516 () Unit!30576)

(declare-fun choose!1507 (array!52784 array!52786 (_ BitVec 32) (_ BitVec 32) V!29457 V!29457 (_ BitVec 32) Int) Unit!30576)

(assert (=> d!111605 (= lt!406516 (choose!1507 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) (index!38112 lt!406498) (defaultEntry!5439 thiss!1181)))))

(assert (=> d!111605 (validMask!0 (mask!26208 thiss!1181))))

(assert (=> d!111605 (= (lemmaValidKeyInArrayIsInListMap!251 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) (index!38112 lt!406498) (defaultEntry!5439 thiss!1181)) lt!406516)))

(declare-fun b!899914 () Bool)

(assert (=> b!899914 (= e!503624 (contains!4423 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498))))))

(assert (= (and d!111605 res!607839) b!899914))

(declare-fun m!836411 () Bool)

(assert (=> d!111605 m!836411))

(assert (=> d!111605 m!836373))

(assert (=> b!899914 m!836363))

(assert (=> b!899914 m!836365))

(assert (=> b!899914 m!836363))

(assert (=> b!899914 m!836365))

(assert (=> b!899914 m!836367))

(assert (=> b!899872 d!111605))

(declare-fun b!899957 () Bool)

(declare-fun e!503662 () ListLongMap!10745)

(declare-fun call!39994 () ListLongMap!10745)

(assert (=> b!899957 (= e!503662 call!39994)))

(declare-fun b!899958 () Bool)

(declare-fun e!503658 () ListLongMap!10745)

(assert (=> b!899958 (= e!503658 call!39994)))

(declare-fun bm!39988 () Bool)

(declare-fun call!39997 () ListLongMap!10745)

(declare-fun getCurrentListMapNoExtraKeys!3282 (array!52784 array!52786 (_ BitVec 32) (_ BitVec 32) V!29457 V!29457 (_ BitVec 32) Int) ListLongMap!10745)

(assert (=> bm!39988 (= call!39997 (getCurrentListMapNoExtraKeys!3282 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)))))

(declare-fun b!899959 () Bool)

(declare-fun e!503652 () Bool)

(declare-fun e!503653 () Bool)

(assert (=> b!899959 (= e!503652 e!503653)))

(declare-fun res!607858 () Bool)

(declare-fun call!39992 () Bool)

(assert (=> b!899959 (= res!607858 call!39992)))

(assert (=> b!899959 (=> (not res!607858) (not e!503653))))

(declare-fun b!899960 () Bool)

(declare-fun call!39995 () ListLongMap!10745)

(assert (=> b!899960 (= e!503662 call!39995)))

(declare-fun b!899961 () Bool)

(declare-fun e!503654 () ListLongMap!10745)

(declare-fun call!39993 () ListLongMap!10745)

(declare-fun +!2595 (ListLongMap!10745 tuple2!12048) ListLongMap!10745)

(assert (=> b!899961 (= e!503654 (+!2595 call!39993 (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181))))))

(declare-fun b!899962 () Bool)

(declare-fun e!503655 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!899962 (= e!503655 (validKeyInArray!0 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899963 () Bool)

(assert (=> b!899963 (= e!503654 e!503658)))

(declare-fun c!95245 () Bool)

(assert (=> b!899963 (= c!95245 (and (not (= (bvand (extraKeys!5162 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5162 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!899965 () Bool)

(declare-fun e!503663 () Unit!30576)

(declare-fun Unit!30578 () Unit!30576)

(assert (=> b!899965 (= e!503663 Unit!30578)))

(declare-fun b!899966 () Bool)

(declare-fun e!503659 () Bool)

(declare-fun lt!406565 () ListLongMap!10745)

(declare-fun apply!414 (ListLongMap!10745 (_ BitVec 64)) V!29457)

(assert (=> b!899966 (= e!503659 (= (apply!414 lt!406565 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5266 thiss!1181)))))

(declare-fun b!899967 () Bool)

(declare-fun e!503651 () Bool)

(declare-fun e!503661 () Bool)

(assert (=> b!899967 (= e!503651 e!503661)))

(declare-fun res!607865 () Bool)

(assert (=> b!899967 (=> (not res!607865) (not e!503661))))

(assert (=> b!899967 (= res!607865 (contains!4423 lt!406565 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899967 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))))))

(declare-fun bm!39989 () Bool)

(assert (=> bm!39989 (= call!39994 call!39993)))

(declare-fun b!899968 () Bool)

(declare-fun lt!406581 () Unit!30576)

(assert (=> b!899968 (= e!503663 lt!406581)))

(declare-fun lt!406580 () ListLongMap!10745)

(assert (=> b!899968 (= lt!406580 (getCurrentListMapNoExtraKeys!3282 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)))))

(declare-fun lt!406575 () (_ BitVec 64))

(assert (=> b!899968 (= lt!406575 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406572 () (_ BitVec 64))

(assert (=> b!899968 (= lt!406572 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406563 () Unit!30576)

(declare-fun addStillContains!336 (ListLongMap!10745 (_ BitVec 64) V!29457 (_ BitVec 64)) Unit!30576)

(assert (=> b!899968 (= lt!406563 (addStillContains!336 lt!406580 lt!406575 (zeroValue!5266 thiss!1181) lt!406572))))

(assert (=> b!899968 (contains!4423 (+!2595 lt!406580 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181))) lt!406572)))

(declare-fun lt!406578 () Unit!30576)

(assert (=> b!899968 (= lt!406578 lt!406563)))

(declare-fun lt!406571 () ListLongMap!10745)

(assert (=> b!899968 (= lt!406571 (getCurrentListMapNoExtraKeys!3282 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)))))

(declare-fun lt!406577 () (_ BitVec 64))

(assert (=> b!899968 (= lt!406577 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406574 () (_ BitVec 64))

(assert (=> b!899968 (= lt!406574 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406561 () Unit!30576)

(declare-fun addApplyDifferent!336 (ListLongMap!10745 (_ BitVec 64) V!29457 (_ BitVec 64)) Unit!30576)

(assert (=> b!899968 (= lt!406561 (addApplyDifferent!336 lt!406571 lt!406577 (minValue!5266 thiss!1181) lt!406574))))

(assert (=> b!899968 (= (apply!414 (+!2595 lt!406571 (tuple2!12049 lt!406577 (minValue!5266 thiss!1181))) lt!406574) (apply!414 lt!406571 lt!406574))))

(declare-fun lt!406567 () Unit!30576)

(assert (=> b!899968 (= lt!406567 lt!406561)))

(declare-fun lt!406579 () ListLongMap!10745)

(assert (=> b!899968 (= lt!406579 (getCurrentListMapNoExtraKeys!3282 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)))))

(declare-fun lt!406582 () (_ BitVec 64))

(assert (=> b!899968 (= lt!406582 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406569 () (_ BitVec 64))

(assert (=> b!899968 (= lt!406569 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406564 () Unit!30576)

(assert (=> b!899968 (= lt!406564 (addApplyDifferent!336 lt!406579 lt!406582 (zeroValue!5266 thiss!1181) lt!406569))))

(assert (=> b!899968 (= (apply!414 (+!2595 lt!406579 (tuple2!12049 lt!406582 (zeroValue!5266 thiss!1181))) lt!406569) (apply!414 lt!406579 lt!406569))))

(declare-fun lt!406568 () Unit!30576)

(assert (=> b!899968 (= lt!406568 lt!406564)))

(declare-fun lt!406573 () ListLongMap!10745)

(assert (=> b!899968 (= lt!406573 (getCurrentListMapNoExtraKeys!3282 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)))))

(declare-fun lt!406576 () (_ BitVec 64))

(assert (=> b!899968 (= lt!406576 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406566 () (_ BitVec 64))

(assert (=> b!899968 (= lt!406566 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899968 (= lt!406581 (addApplyDifferent!336 lt!406573 lt!406576 (minValue!5266 thiss!1181) lt!406566))))

(assert (=> b!899968 (= (apply!414 (+!2595 lt!406573 (tuple2!12049 lt!406576 (minValue!5266 thiss!1181))) lt!406566) (apply!414 lt!406573 lt!406566))))

(declare-fun b!899969 () Bool)

(declare-fun e!503656 () Bool)

(assert (=> b!899969 (= e!503656 e!503659)))

(declare-fun res!607866 () Bool)

(declare-fun call!39991 () Bool)

(assert (=> b!899969 (= res!607866 call!39991)))

(assert (=> b!899969 (=> (not res!607866) (not e!503659))))

(declare-fun b!899970 () Bool)

(declare-fun get!13343 (ValueCell!8703 V!29457) V!29457)

(declare-fun dynLambda!1308 (Int (_ BitVec 64)) V!29457)

(assert (=> b!899970 (= e!503661 (= (apply!414 lt!406565 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)) (get!13343 (select (arr!25366 (_values!5453 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1308 (defaultEntry!5439 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!899970 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25824 (_values!5453 thiss!1181))))))

(assert (=> b!899970 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))))))

(declare-fun bm!39990 () Bool)

(assert (=> bm!39990 (= call!39992 (contains!4423 lt!406565 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899971 () Bool)

(declare-fun res!607864 () Bool)

(declare-fun e!503657 () Bool)

(assert (=> b!899971 (=> (not res!607864) (not e!503657))))

(assert (=> b!899971 (= res!607864 e!503652)))

(declare-fun c!95246 () Bool)

(assert (=> b!899971 (= c!95246 (not (= (bvand (extraKeys!5162 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!899972 () Bool)

(assert (=> b!899972 (= e!503652 (not call!39992))))

(declare-fun b!899973 () Bool)

(assert (=> b!899973 (= e!503656 (not call!39991))))

(declare-fun bm!39991 () Bool)

(declare-fun call!39996 () ListLongMap!10745)

(assert (=> bm!39991 (= call!39995 call!39996)))

(declare-fun bm!39992 () Bool)

(assert (=> bm!39992 (= call!39996 call!39997)))

(declare-fun b!899974 () Bool)

(declare-fun c!95242 () Bool)

(assert (=> b!899974 (= c!95242 (and (not (= (bvand (extraKeys!5162 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5162 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!899974 (= e!503658 e!503662)))

(declare-fun b!899975 () Bool)

(assert (=> b!899975 (= e!503657 e!503656)))

(declare-fun c!95243 () Bool)

(assert (=> b!899975 (= c!95243 (not (= (bvand (extraKeys!5162 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39993 () Bool)

(assert (=> bm!39993 (= call!39991 (contains!4423 lt!406565 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!111607 () Bool)

(assert (=> d!111607 e!503657))

(declare-fun res!607862 () Bool)

(assert (=> d!111607 (=> (not res!607862) (not e!503657))))

(assert (=> d!111607 (= res!607862 (or (bvsge #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))))))))

(declare-fun lt!406570 () ListLongMap!10745)

(assert (=> d!111607 (= lt!406565 lt!406570)))

(declare-fun lt!406562 () Unit!30576)

(assert (=> d!111607 (= lt!406562 e!503663)))

(declare-fun c!95244 () Bool)

(declare-fun e!503660 () Bool)

(assert (=> d!111607 (= c!95244 e!503660)))

(declare-fun res!607860 () Bool)

(assert (=> d!111607 (=> (not res!607860) (not e!503660))))

(assert (=> d!111607 (= res!607860 (bvslt #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))))))

(assert (=> d!111607 (= lt!406570 e!503654)))

(declare-fun c!95241 () Bool)

(assert (=> d!111607 (= c!95241 (and (not (= (bvand (extraKeys!5162 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5162 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111607 (validMask!0 (mask!26208 thiss!1181))))

(assert (=> d!111607 (= (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)) lt!406565)))

(declare-fun b!899964 () Bool)

(assert (=> b!899964 (= e!503653 (= (apply!414 lt!406565 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5266 thiss!1181)))))

(declare-fun bm!39994 () Bool)

(assert (=> bm!39994 (= call!39993 (+!2595 (ite c!95241 call!39997 (ite c!95245 call!39996 call!39995)) (ite (or c!95241 c!95245) (tuple2!12049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5266 thiss!1181)) (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181)))))))

(declare-fun b!899976 () Bool)

(assert (=> b!899976 (= e!503660 (validKeyInArray!0 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899977 () Bool)

(declare-fun res!607863 () Bool)

(assert (=> b!899977 (=> (not res!607863) (not e!503657))))

(assert (=> b!899977 (= res!607863 e!503651)))

(declare-fun res!607861 () Bool)

(assert (=> b!899977 (=> res!607861 e!503651)))

(assert (=> b!899977 (= res!607861 (not e!503655))))

(declare-fun res!607859 () Bool)

(assert (=> b!899977 (=> (not res!607859) (not e!503655))))

(assert (=> b!899977 (= res!607859 (bvslt #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))))))

(assert (= (and d!111607 c!95241) b!899961))

(assert (= (and d!111607 (not c!95241)) b!899963))

(assert (= (and b!899963 c!95245) b!899958))

(assert (= (and b!899963 (not c!95245)) b!899974))

(assert (= (and b!899974 c!95242) b!899957))

(assert (= (and b!899974 (not c!95242)) b!899960))

(assert (= (or b!899957 b!899960) bm!39991))

(assert (= (or b!899958 bm!39991) bm!39992))

(assert (= (or b!899958 b!899957) bm!39989))

(assert (= (or b!899961 bm!39992) bm!39988))

(assert (= (or b!899961 bm!39989) bm!39994))

(assert (= (and d!111607 res!607860) b!899976))

(assert (= (and d!111607 c!95244) b!899968))

(assert (= (and d!111607 (not c!95244)) b!899965))

(assert (= (and d!111607 res!607862) b!899977))

(assert (= (and b!899977 res!607859) b!899962))

(assert (= (and b!899977 (not res!607861)) b!899967))

(assert (= (and b!899967 res!607865) b!899970))

(assert (= (and b!899977 res!607863) b!899971))

(assert (= (and b!899971 c!95246) b!899959))

(assert (= (and b!899971 (not c!95246)) b!899972))

(assert (= (and b!899959 res!607858) b!899964))

(assert (= (or b!899959 b!899972) bm!39990))

(assert (= (and b!899971 res!607864) b!899975))

(assert (= (and b!899975 c!95243) b!899969))

(assert (= (and b!899975 (not c!95243)) b!899973))

(assert (= (and b!899969 res!607866) b!899966))

(assert (= (or b!899969 b!899973) bm!39993))

(declare-fun b_lambda!13003 () Bool)

(assert (=> (not b_lambda!13003) (not b!899970)))

(declare-fun t!25202 () Bool)

(declare-fun tb!5201 () Bool)

(assert (=> (and b!899875 (= (defaultEntry!5439 thiss!1181) (defaultEntry!5439 thiss!1181)) t!25202) tb!5201))

(declare-fun result!10175 () Bool)

(assert (=> tb!5201 (= result!10175 tp_is_empty!18369)))

(assert (=> b!899970 t!25202))

(declare-fun b_and!26359 () Bool)

(assert (= b_and!26355 (and (=> t!25202 result!10175) b_and!26359)))

(assert (=> b!899962 m!836407))

(assert (=> b!899962 m!836407))

(declare-fun m!836413 () Bool)

(assert (=> b!899962 m!836413))

(declare-fun m!836415 () Bool)

(assert (=> b!899966 m!836415))

(assert (=> b!899967 m!836407))

(assert (=> b!899967 m!836407))

(declare-fun m!836417 () Bool)

(assert (=> b!899967 m!836417))

(assert (=> b!899976 m!836407))

(assert (=> b!899976 m!836407))

(assert (=> b!899976 m!836413))

(declare-fun m!836419 () Bool)

(assert (=> bm!39990 m!836419))

(declare-fun m!836421 () Bool)

(assert (=> bm!39988 m!836421))

(declare-fun m!836423 () Bool)

(assert (=> bm!39993 m!836423))

(assert (=> d!111607 m!836373))

(declare-fun m!836425 () Bool)

(assert (=> b!899961 m!836425))

(declare-fun m!836427 () Bool)

(assert (=> b!899964 m!836427))

(declare-fun m!836429 () Bool)

(assert (=> b!899968 m!836429))

(declare-fun m!836431 () Bool)

(assert (=> b!899968 m!836431))

(assert (=> b!899968 m!836429))

(declare-fun m!836433 () Bool)

(assert (=> b!899968 m!836433))

(declare-fun m!836435 () Bool)

(assert (=> b!899968 m!836435))

(declare-fun m!836437 () Bool)

(assert (=> b!899968 m!836437))

(declare-fun m!836439 () Bool)

(assert (=> b!899968 m!836439))

(declare-fun m!836441 () Bool)

(assert (=> b!899968 m!836441))

(declare-fun m!836443 () Bool)

(assert (=> b!899968 m!836443))

(assert (=> b!899968 m!836435))

(declare-fun m!836445 () Bool)

(assert (=> b!899968 m!836445))

(declare-fun m!836447 () Bool)

(assert (=> b!899968 m!836447))

(declare-fun m!836449 () Bool)

(assert (=> b!899968 m!836449))

(assert (=> b!899968 m!836439))

(declare-fun m!836451 () Bool)

(assert (=> b!899968 m!836451))

(declare-fun m!836453 () Bool)

(assert (=> b!899968 m!836453))

(declare-fun m!836455 () Bool)

(assert (=> b!899968 m!836455))

(assert (=> b!899968 m!836421))

(assert (=> b!899968 m!836447))

(assert (=> b!899968 m!836407))

(declare-fun m!836457 () Bool)

(assert (=> b!899968 m!836457))

(declare-fun m!836459 () Bool)

(assert (=> b!899970 m!836459))

(declare-fun m!836461 () Bool)

(assert (=> b!899970 m!836461))

(assert (=> b!899970 m!836459))

(declare-fun m!836463 () Bool)

(assert (=> b!899970 m!836463))

(assert (=> b!899970 m!836461))

(assert (=> b!899970 m!836407))

(assert (=> b!899970 m!836407))

(declare-fun m!836465 () Bool)

(assert (=> b!899970 m!836465))

(declare-fun m!836467 () Bool)

(assert (=> bm!39994 m!836467))

(assert (=> b!899872 d!111607))

(declare-fun d!111609 () Bool)

(declare-fun e!503668 () Bool)

(assert (=> d!111609 e!503668))

(declare-fun res!607869 () Bool)

(assert (=> d!111609 (=> res!607869 e!503668)))

(declare-fun lt!406592 () Bool)

(assert (=> d!111609 (= res!607869 (not lt!406592))))

(declare-fun lt!406594 () Bool)

(assert (=> d!111609 (= lt!406592 lt!406594)))

(declare-fun lt!406593 () Unit!30576)

(declare-fun e!503669 () Unit!30576)

(assert (=> d!111609 (= lt!406593 e!503669)))

(declare-fun c!95249 () Bool)

(assert (=> d!111609 (= c!95249 lt!406594)))

(declare-fun containsKey!429 (List!17851 (_ BitVec 64)) Bool)

(assert (=> d!111609 (= lt!406594 (containsKey!429 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498))))))

(assert (=> d!111609 (= (contains!4423 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498))) lt!406592)))

(declare-fun b!899986 () Bool)

(declare-fun lt!406591 () Unit!30576)

(assert (=> b!899986 (= e!503669 lt!406591)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!325 (List!17851 (_ BitVec 64)) Unit!30576)

(assert (=> b!899986 (= lt!406591 (lemmaContainsKeyImpliesGetValueByKeyDefined!325 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498))))))

(declare-datatypes ((Option!466 0))(
  ( (Some!465 (v!11732 V!29457)) (None!464) )
))
(declare-fun isDefined!334 (Option!466) Bool)

(declare-fun getValueByKey!460 (List!17851 (_ BitVec 64)) Option!466)

(assert (=> b!899986 (isDefined!334 (getValueByKey!460 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498))))))

(declare-fun b!899987 () Bool)

(declare-fun Unit!30579 () Unit!30576)

(assert (=> b!899987 (= e!503669 Unit!30579)))

(declare-fun b!899988 () Bool)

(assert (=> b!899988 (= e!503668 (isDefined!334 (getValueByKey!460 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498)))))))

(assert (= (and d!111609 c!95249) b!899986))

(assert (= (and d!111609 (not c!95249)) b!899987))

(assert (= (and d!111609 (not res!607869)) b!899988))

(assert (=> d!111609 m!836365))

(declare-fun m!836469 () Bool)

(assert (=> d!111609 m!836469))

(assert (=> b!899986 m!836365))

(declare-fun m!836471 () Bool)

(assert (=> b!899986 m!836471))

(assert (=> b!899986 m!836365))

(declare-fun m!836473 () Bool)

(assert (=> b!899986 m!836473))

(assert (=> b!899986 m!836473))

(declare-fun m!836475 () Bool)

(assert (=> b!899986 m!836475))

(assert (=> b!899988 m!836365))

(assert (=> b!899988 m!836473))

(assert (=> b!899988 m!836473))

(assert (=> b!899988 m!836475))

(assert (=> b!899872 d!111609))

(declare-fun d!111611 () Bool)

(declare-fun e!503672 () Bool)

(assert (=> d!111611 e!503672))

(declare-fun res!607872 () Bool)

(assert (=> d!111611 (=> res!607872 e!503672)))

(declare-fun lt!406600 () SeekEntryResult!8935)

(assert (=> d!111611 (= res!607872 (not ((_ is Found!8935) lt!406600)))))

(assert (=> d!111611 (= lt!406600 (seekEntry!0 key!785 (_keys!10234 thiss!1181) (mask!26208 thiss!1181)))))

(declare-fun lt!406599 () Unit!30576)

(declare-fun choose!1508 (array!52784 array!52786 (_ BitVec 32) (_ BitVec 32) V!29457 V!29457 (_ BitVec 64)) Unit!30576)

(assert (=> d!111611 (= lt!406599 (choose!1508 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) key!785))))

(assert (=> d!111611 (validMask!0 (mask!26208 thiss!1181))))

(assert (=> d!111611 (= (lemmaSeekEntryGivesInRangeIndex!99 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) key!785) lt!406599)))

(declare-fun b!899991 () Bool)

(assert (=> b!899991 (= e!503672 (inRange!0 (index!38112 lt!406600) (mask!26208 thiss!1181)))))

(assert (= (and d!111611 (not res!607872)) b!899991))

(assert (=> d!111611 m!836353))

(declare-fun m!836477 () Bool)

(assert (=> d!111611 m!836477))

(assert (=> d!111611 m!836373))

(declare-fun m!836479 () Bool)

(assert (=> b!899991 m!836479))

(assert (=> b!899877 d!111611))

(declare-fun b!900004 () Bool)

(declare-fun e!503679 () SeekEntryResult!8935)

(declare-fun lt!406609 () SeekEntryResult!8935)

(assert (=> b!900004 (= e!503679 (Found!8935 (index!38113 lt!406609)))))

(declare-fun d!111613 () Bool)

(declare-fun lt!406610 () SeekEntryResult!8935)

(assert (=> d!111613 (and (or ((_ is MissingVacant!8935) lt!406610) (not ((_ is Found!8935) lt!406610)) (and (bvsge (index!38112 lt!406610) #b00000000000000000000000000000000) (bvslt (index!38112 lt!406610) (size!25823 (_keys!10234 thiss!1181))))) (not ((_ is MissingVacant!8935) lt!406610)) (or (not ((_ is Found!8935) lt!406610)) (= (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406610)) key!785)))))

(declare-fun e!503681 () SeekEntryResult!8935)

(assert (=> d!111613 (= lt!406610 e!503681)))

(declare-fun c!95258 () Bool)

(assert (=> d!111613 (= c!95258 (and ((_ is Intermediate!8935) lt!406609) (undefined!9747 lt!406609)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52784 (_ BitVec 32)) SeekEntryResult!8935)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111613 (= lt!406609 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26208 thiss!1181)) key!785 (_keys!10234 thiss!1181) (mask!26208 thiss!1181)))))

(assert (=> d!111613 (validMask!0 (mask!26208 thiss!1181))))

(assert (=> d!111613 (= (seekEntry!0 key!785 (_keys!10234 thiss!1181) (mask!26208 thiss!1181)) lt!406610)))

(declare-fun b!900005 () Bool)

(assert (=> b!900005 (= e!503681 Undefined!8935)))

(declare-fun b!900006 () Bool)

(declare-fun e!503680 () SeekEntryResult!8935)

(declare-fun lt!406612 () SeekEntryResult!8935)

(assert (=> b!900006 (= e!503680 (ite ((_ is MissingVacant!8935) lt!406612) (MissingZero!8935 (index!38114 lt!406612)) lt!406612))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52784 (_ BitVec 32)) SeekEntryResult!8935)

(assert (=> b!900006 (= lt!406612 (seekKeyOrZeroReturnVacant!0 (x!76678 lt!406609) (index!38113 lt!406609) (index!38113 lt!406609) key!785 (_keys!10234 thiss!1181) (mask!26208 thiss!1181)))))

(declare-fun b!900007 () Bool)

(assert (=> b!900007 (= e!503681 e!503679)))

(declare-fun lt!406611 () (_ BitVec 64))

(assert (=> b!900007 (= lt!406611 (select (arr!25365 (_keys!10234 thiss!1181)) (index!38113 lt!406609)))))

(declare-fun c!95257 () Bool)

(assert (=> b!900007 (= c!95257 (= lt!406611 key!785))))

(declare-fun b!900008 () Bool)

(assert (=> b!900008 (= e!503680 (MissingZero!8935 (index!38113 lt!406609)))))

(declare-fun b!900009 () Bool)

(declare-fun c!95256 () Bool)

(assert (=> b!900009 (= c!95256 (= lt!406611 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900009 (= e!503679 e!503680)))

(assert (= (and d!111613 c!95258) b!900005))

(assert (= (and d!111613 (not c!95258)) b!900007))

(assert (= (and b!900007 c!95257) b!900004))

(assert (= (and b!900007 (not c!95257)) b!900009))

(assert (= (and b!900009 c!95256) b!900008))

(assert (= (and b!900009 (not c!95256)) b!900006))

(declare-fun m!836481 () Bool)

(assert (=> d!111613 m!836481))

(declare-fun m!836483 () Bool)

(assert (=> d!111613 m!836483))

(assert (=> d!111613 m!836483))

(declare-fun m!836485 () Bool)

(assert (=> d!111613 m!836485))

(assert (=> d!111613 m!836373))

(declare-fun m!836487 () Bool)

(assert (=> b!900006 m!836487))

(declare-fun m!836489 () Bool)

(assert (=> b!900007 m!836489))

(assert (=> b!899877 d!111613))

(declare-fun d!111615 () Bool)

(declare-fun res!607879 () Bool)

(declare-fun e!503684 () Bool)

(assert (=> d!111615 (=> (not res!607879) (not e!503684))))

(declare-fun simpleValid!328 (LongMapFixedSize!4422) Bool)

(assert (=> d!111615 (= res!607879 (simpleValid!328 thiss!1181))))

(assert (=> d!111615 (= (valid!1698 thiss!1181) e!503684)))

(declare-fun b!900016 () Bool)

(declare-fun res!607880 () Bool)

(assert (=> b!900016 (=> (not res!607880) (not e!503684))))

(declare-fun arrayCountValidKeys!0 (array!52784 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!900016 (= res!607880 (= (arrayCountValidKeys!0 (_keys!10234 thiss!1181) #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))) (_size!2266 thiss!1181)))))

(declare-fun b!900017 () Bool)

(declare-fun res!607881 () Bool)

(assert (=> b!900017 (=> (not res!607881) (not e!503684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52784 (_ BitVec 32)) Bool)

(assert (=> b!900017 (= res!607881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10234 thiss!1181) (mask!26208 thiss!1181)))))

(declare-fun b!900018 () Bool)

(declare-datatypes ((List!17852 0))(
  ( (Nil!17849) (Cons!17848 (h!18993 (_ BitVec 64)) (t!25203 List!17852)) )
))
(declare-fun arrayNoDuplicates!0 (array!52784 (_ BitVec 32) List!17852) Bool)

(assert (=> b!900018 (= e!503684 (arrayNoDuplicates!0 (_keys!10234 thiss!1181) #b00000000000000000000000000000000 Nil!17849))))

(assert (= (and d!111615 res!607879) b!900016))

(assert (= (and b!900016 res!607880) b!900017))

(assert (= (and b!900017 res!607881) b!900018))

(declare-fun m!836491 () Bool)

(assert (=> d!111615 m!836491))

(declare-fun m!836493 () Bool)

(assert (=> b!900016 m!836493))

(declare-fun m!836495 () Bool)

(assert (=> b!900017 m!836495))

(declare-fun m!836497 () Bool)

(assert (=> b!900018 m!836497))

(assert (=> start!77052 d!111615))

(declare-fun d!111617 () Bool)

(assert (=> d!111617 (= (inRange!0 (index!38112 lt!406498) (mask!26208 thiss!1181)) (and (bvsge (index!38112 lt!406498) #b00000000000000000000000000000000) (bvslt (index!38112 lt!406498) (bvadd (mask!26208 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!899878 d!111617))

(declare-fun condMapEmpty!29229 () Bool)

(declare-fun mapDefault!29229 () ValueCell!8703)

(assert (=> mapNonEmpty!29223 (= condMapEmpty!29229 (= mapRest!29223 ((as const (Array (_ BitVec 32) ValueCell!8703)) mapDefault!29229)))))

(declare-fun e!503690 () Bool)

(declare-fun mapRes!29229 () Bool)

(assert (=> mapNonEmpty!29223 (= tp!56206 (and e!503690 mapRes!29229))))

(declare-fun mapIsEmpty!29229 () Bool)

(assert (=> mapIsEmpty!29229 mapRes!29229))

(declare-fun b!900026 () Bool)

(assert (=> b!900026 (= e!503690 tp_is_empty!18369)))

(declare-fun b!900025 () Bool)

(declare-fun e!503689 () Bool)

(assert (=> b!900025 (= e!503689 tp_is_empty!18369)))

(declare-fun mapNonEmpty!29229 () Bool)

(declare-fun tp!56216 () Bool)

(assert (=> mapNonEmpty!29229 (= mapRes!29229 (and tp!56216 e!503689))))

(declare-fun mapValue!29229 () ValueCell!8703)

(declare-fun mapRest!29229 () (Array (_ BitVec 32) ValueCell!8703))

(declare-fun mapKey!29229 () (_ BitVec 32))

(assert (=> mapNonEmpty!29229 (= mapRest!29223 (store mapRest!29229 mapKey!29229 mapValue!29229))))

(assert (= (and mapNonEmpty!29223 condMapEmpty!29229) mapIsEmpty!29229))

(assert (= (and mapNonEmpty!29223 (not condMapEmpty!29229)) mapNonEmpty!29229))

(assert (= (and mapNonEmpty!29229 ((_ is ValueCellFull!8703) mapValue!29229)) b!900025))

(assert (= (and mapNonEmpty!29223 ((_ is ValueCellFull!8703) mapDefault!29229)) b!900026))

(declare-fun m!836499 () Bool)

(assert (=> mapNonEmpty!29229 m!836499))

(declare-fun b_lambda!13005 () Bool)

(assert (= b_lambda!13003 (or (and b!899875 b_free!16041) b_lambda!13005)))

(check-sat (not b_next!16041) (not b!900018) (not b!899962) (not b!899976) (not d!111605) (not b!900016) (not b!899968) (not b!899986) (not b!899988) (not d!111609) (not b_lambda!13005) (not mapNonEmpty!29229) (not b!900006) (not d!111601) (not b!899964) tp_is_empty!18369 (not b!899967) (not b!899970) (not bm!39994) (not bm!39990) (not d!111611) (not b!900017) (not d!111613) (not d!111607) (not b!899966) (not bm!39993) (not bm!39988) b_and!26359 (not d!111615) (not b!899961) (not b!899911) (not b!899991) (not b!899914))
(check-sat b_and!26359 (not b_next!16041))
(get-model)

(assert (=> d!111611 d!111613))

(declare-fun d!111619 () Bool)

(declare-fun e!503693 () Bool)

(assert (=> d!111619 e!503693))

(declare-fun res!607884 () Bool)

(assert (=> d!111619 (=> res!607884 e!503693)))

(declare-fun lt!406615 () SeekEntryResult!8935)

(assert (=> d!111619 (= res!607884 (not ((_ is Found!8935) lt!406615)))))

(assert (=> d!111619 (= lt!406615 (seekEntry!0 key!785 (_keys!10234 thiss!1181) (mask!26208 thiss!1181)))))

(assert (=> d!111619 true))

(declare-fun _$36!375 () Unit!30576)

(assert (=> d!111619 (= (choose!1508 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) key!785) _$36!375)))

(declare-fun b!900029 () Bool)

(assert (=> b!900029 (= e!503693 (inRange!0 (index!38112 lt!406615) (mask!26208 thiss!1181)))))

(assert (= (and d!111619 (not res!607884)) b!900029))

(assert (=> d!111619 m!836353))

(declare-fun m!836501 () Bool)

(assert (=> b!900029 m!836501))

(assert (=> d!111611 d!111619))

(assert (=> d!111611 d!111599))

(declare-fun b!900042 () Bool)

(declare-fun e!503701 () SeekEntryResult!8935)

(assert (=> b!900042 (= e!503701 (MissingVacant!8935 (index!38113 lt!406609)))))

(declare-fun b!900043 () Bool)

(declare-fun c!95266 () Bool)

(declare-fun lt!406620 () (_ BitVec 64))

(assert (=> b!900043 (= c!95266 (= lt!406620 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!503702 () SeekEntryResult!8935)

(assert (=> b!900043 (= e!503702 e!503701)))

(declare-fun b!900045 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!900045 (= e!503701 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76678 lt!406609) #b00000000000000000000000000000001) (nextIndex!0 (index!38113 lt!406609) (x!76678 lt!406609) (mask!26208 thiss!1181)) (index!38113 lt!406609) key!785 (_keys!10234 thiss!1181) (mask!26208 thiss!1181)))))

(declare-fun b!900046 () Bool)

(declare-fun e!503700 () SeekEntryResult!8935)

(assert (=> b!900046 (= e!503700 e!503702)))

(declare-fun c!95267 () Bool)

(assert (=> b!900046 (= c!95267 (= lt!406620 key!785))))

(declare-fun b!900047 () Bool)

(assert (=> b!900047 (= e!503702 (Found!8935 (index!38113 lt!406609)))))

(declare-fun b!900044 () Bool)

(assert (=> b!900044 (= e!503700 Undefined!8935)))

(declare-fun d!111621 () Bool)

(declare-fun lt!406621 () SeekEntryResult!8935)

(assert (=> d!111621 (and (or ((_ is Undefined!8935) lt!406621) (not ((_ is Found!8935) lt!406621)) (and (bvsge (index!38112 lt!406621) #b00000000000000000000000000000000) (bvslt (index!38112 lt!406621) (size!25823 (_keys!10234 thiss!1181))))) (or ((_ is Undefined!8935) lt!406621) ((_ is Found!8935) lt!406621) (not ((_ is MissingVacant!8935) lt!406621)) (not (= (index!38114 lt!406621) (index!38113 lt!406609))) (and (bvsge (index!38114 lt!406621) #b00000000000000000000000000000000) (bvslt (index!38114 lt!406621) (size!25823 (_keys!10234 thiss!1181))))) (or ((_ is Undefined!8935) lt!406621) (ite ((_ is Found!8935) lt!406621) (= (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406621)) key!785) (and ((_ is MissingVacant!8935) lt!406621) (= (index!38114 lt!406621) (index!38113 lt!406609)) (= (select (arr!25365 (_keys!10234 thiss!1181)) (index!38114 lt!406621)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!111621 (= lt!406621 e!503700)))

(declare-fun c!95265 () Bool)

(assert (=> d!111621 (= c!95265 (bvsge (x!76678 lt!406609) #b01111111111111111111111111111110))))

(assert (=> d!111621 (= lt!406620 (select (arr!25365 (_keys!10234 thiss!1181)) (index!38113 lt!406609)))))

(assert (=> d!111621 (validMask!0 (mask!26208 thiss!1181))))

(assert (=> d!111621 (= (seekKeyOrZeroReturnVacant!0 (x!76678 lt!406609) (index!38113 lt!406609) (index!38113 lt!406609) key!785 (_keys!10234 thiss!1181) (mask!26208 thiss!1181)) lt!406621)))

(assert (= (and d!111621 c!95265) b!900044))

(assert (= (and d!111621 (not c!95265)) b!900046))

(assert (= (and b!900046 c!95267) b!900047))

(assert (= (and b!900046 (not c!95267)) b!900043))

(assert (= (and b!900043 c!95266) b!900042))

(assert (= (and b!900043 (not c!95266)) b!900045))

(declare-fun m!836503 () Bool)

(assert (=> b!900045 m!836503))

(assert (=> b!900045 m!836503))

(declare-fun m!836505 () Bool)

(assert (=> b!900045 m!836505))

(declare-fun m!836507 () Bool)

(assert (=> d!111621 m!836507))

(declare-fun m!836509 () Bool)

(assert (=> d!111621 m!836509))

(assert (=> d!111621 m!836489))

(assert (=> d!111621 m!836373))

(assert (=> b!900006 d!111621))

(declare-fun d!111623 () Bool)

(declare-fun res!607889 () Bool)

(declare-fun e!503707 () Bool)

(assert (=> d!111623 (=> res!607889 e!503707)))

(assert (=> d!111623 (= res!607889 (and ((_ is Cons!17847) (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)))) (= (_1!6035 (h!18992 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498)))))))

(assert (=> d!111623 (= (containsKey!429 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498))) e!503707)))

(declare-fun b!900052 () Bool)

(declare-fun e!503708 () Bool)

(assert (=> b!900052 (= e!503707 e!503708)))

(declare-fun res!607890 () Bool)

(assert (=> b!900052 (=> (not res!607890) (not e!503708))))

(assert (=> b!900052 (= res!607890 (and (or (not ((_ is Cons!17847) (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))))) (bvsle (_1!6035 (h!18992 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498)))) ((_ is Cons!17847) (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)))) (bvslt (_1!6035 (h!18992 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498)))))))

(declare-fun b!900053 () Bool)

(assert (=> b!900053 (= e!503708 (containsKey!429 (t!25200 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498))))))

(assert (= (and d!111623 (not res!607889)) b!900052))

(assert (= (and b!900052 res!607890) b!900053))

(assert (=> b!900053 m!836365))

(declare-fun m!836511 () Bool)

(assert (=> b!900053 m!836511))

(assert (=> d!111609 d!111623))

(declare-fun d!111625 () Bool)

(declare-fun e!503709 () Bool)

(assert (=> d!111625 e!503709))

(declare-fun res!607891 () Bool)

(assert (=> d!111625 (=> res!607891 e!503709)))

(declare-fun lt!406623 () Bool)

(assert (=> d!111625 (= res!607891 (not lt!406623))))

(declare-fun lt!406625 () Bool)

(assert (=> d!111625 (= lt!406623 lt!406625)))

(declare-fun lt!406624 () Unit!30576)

(declare-fun e!503710 () Unit!30576)

(assert (=> d!111625 (= lt!406624 e!503710)))

(declare-fun c!95268 () Bool)

(assert (=> d!111625 (= c!95268 lt!406625)))

(assert (=> d!111625 (= lt!406625 (containsKey!429 (toList!5388 lt!406565) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111625 (= (contains!4423 lt!406565 #b0000000000000000000000000000000000000000000000000000000000000000) lt!406623)))

(declare-fun b!900054 () Bool)

(declare-fun lt!406622 () Unit!30576)

(assert (=> b!900054 (= e!503710 lt!406622)))

(assert (=> b!900054 (= lt!406622 (lemmaContainsKeyImpliesGetValueByKeyDefined!325 (toList!5388 lt!406565) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900054 (isDefined!334 (getValueByKey!460 (toList!5388 lt!406565) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900055 () Bool)

(declare-fun Unit!30580 () Unit!30576)

(assert (=> b!900055 (= e!503710 Unit!30580)))

(declare-fun b!900056 () Bool)

(assert (=> b!900056 (= e!503709 (isDefined!334 (getValueByKey!460 (toList!5388 lt!406565) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111625 c!95268) b!900054))

(assert (= (and d!111625 (not c!95268)) b!900055))

(assert (= (and d!111625 (not res!607891)) b!900056))

(declare-fun m!836513 () Bool)

(assert (=> d!111625 m!836513))

(declare-fun m!836515 () Bool)

(assert (=> b!900054 m!836515))

(declare-fun m!836517 () Bool)

(assert (=> b!900054 m!836517))

(assert (=> b!900054 m!836517))

(declare-fun m!836519 () Bool)

(assert (=> b!900054 m!836519))

(assert (=> b!900056 m!836517))

(assert (=> b!900056 m!836517))

(assert (=> b!900056 m!836519))

(assert (=> bm!39990 d!111625))

(assert (=> d!111607 d!111599))

(declare-fun d!111627 () Bool)

(assert (=> d!111627 (contains!4423 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498)))))

(assert (=> d!111627 true))

(declare-fun _$16!187 () Unit!30576)

(assert (=> d!111627 (= (choose!1507 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) (index!38112 lt!406498) (defaultEntry!5439 thiss!1181)) _$16!187)))

(declare-fun bs!25270 () Bool)

(assert (= bs!25270 d!111627))

(assert (=> bs!25270 m!836363))

(assert (=> bs!25270 m!836365))

(assert (=> bs!25270 m!836363))

(assert (=> bs!25270 m!836365))

(assert (=> bs!25270 m!836367))

(assert (=> d!111605 d!111627))

(assert (=> d!111605 d!111599))

(declare-fun d!111629 () Bool)

(assert (=> d!111629 (= (apply!414 (+!2595 lt!406579 (tuple2!12049 lt!406582 (zeroValue!5266 thiss!1181))) lt!406569) (apply!414 lt!406579 lt!406569))))

(declare-fun lt!406628 () Unit!30576)

(declare-fun choose!1509 (ListLongMap!10745 (_ BitVec 64) V!29457 (_ BitVec 64)) Unit!30576)

(assert (=> d!111629 (= lt!406628 (choose!1509 lt!406579 lt!406582 (zeroValue!5266 thiss!1181) lt!406569))))

(declare-fun e!503713 () Bool)

(assert (=> d!111629 e!503713))

(declare-fun res!607894 () Bool)

(assert (=> d!111629 (=> (not res!607894) (not e!503713))))

(assert (=> d!111629 (= res!607894 (contains!4423 lt!406579 lt!406569))))

(assert (=> d!111629 (= (addApplyDifferent!336 lt!406579 lt!406582 (zeroValue!5266 thiss!1181) lt!406569) lt!406628)))

(declare-fun b!900060 () Bool)

(assert (=> b!900060 (= e!503713 (not (= lt!406569 lt!406582)))))

(assert (= (and d!111629 res!607894) b!900060))

(assert (=> d!111629 m!836441))

(declare-fun m!836521 () Bool)

(assert (=> d!111629 m!836521))

(assert (=> d!111629 m!836429))

(declare-fun m!836523 () Bool)

(assert (=> d!111629 m!836523))

(assert (=> d!111629 m!836429))

(assert (=> d!111629 m!836433))

(assert (=> b!899968 d!111629))

(declare-fun d!111631 () Bool)

(declare-fun get!13344 (Option!466) V!29457)

(assert (=> d!111631 (= (apply!414 lt!406571 lt!406574) (get!13344 (getValueByKey!460 (toList!5388 lt!406571) lt!406574)))))

(declare-fun bs!25271 () Bool)

(assert (= bs!25271 d!111631))

(declare-fun m!836525 () Bool)

(assert (=> bs!25271 m!836525))

(assert (=> bs!25271 m!836525))

(declare-fun m!836527 () Bool)

(assert (=> bs!25271 m!836527))

(assert (=> b!899968 d!111631))

(declare-fun d!111633 () Bool)

(assert (=> d!111633 (= (apply!414 (+!2595 lt!406573 (tuple2!12049 lt!406576 (minValue!5266 thiss!1181))) lt!406566) (get!13344 (getValueByKey!460 (toList!5388 (+!2595 lt!406573 (tuple2!12049 lt!406576 (minValue!5266 thiss!1181)))) lt!406566)))))

(declare-fun bs!25272 () Bool)

(assert (= bs!25272 d!111633))

(declare-fun m!836529 () Bool)

(assert (=> bs!25272 m!836529))

(assert (=> bs!25272 m!836529))

(declare-fun m!836531 () Bool)

(assert (=> bs!25272 m!836531))

(assert (=> b!899968 d!111633))

(declare-fun d!111635 () Bool)

(declare-fun e!503716 () Bool)

(assert (=> d!111635 e!503716))

(declare-fun res!607900 () Bool)

(assert (=> d!111635 (=> (not res!607900) (not e!503716))))

(declare-fun lt!406639 () ListLongMap!10745)

(assert (=> d!111635 (= res!607900 (contains!4423 lt!406639 (_1!6035 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181)))))))

(declare-fun lt!406640 () List!17851)

(assert (=> d!111635 (= lt!406639 (ListLongMap!10746 lt!406640))))

(declare-fun lt!406638 () Unit!30576)

(declare-fun lt!406637 () Unit!30576)

(assert (=> d!111635 (= lt!406638 lt!406637)))

(assert (=> d!111635 (= (getValueByKey!460 lt!406640 (_1!6035 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181)))) (Some!465 (_2!6035 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!251 (List!17851 (_ BitVec 64) V!29457) Unit!30576)

(assert (=> d!111635 (= lt!406637 (lemmaContainsTupThenGetReturnValue!251 lt!406640 (_1!6035 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181))) (_2!6035 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181)))))))

(declare-fun insertStrictlySorted!308 (List!17851 (_ BitVec 64) V!29457) List!17851)

(assert (=> d!111635 (= lt!406640 (insertStrictlySorted!308 (toList!5388 lt!406580) (_1!6035 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181))) (_2!6035 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181)))))))

(assert (=> d!111635 (= (+!2595 lt!406580 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181))) lt!406639)))

(declare-fun b!900065 () Bool)

(declare-fun res!607899 () Bool)

(assert (=> b!900065 (=> (not res!607899) (not e!503716))))

(assert (=> b!900065 (= res!607899 (= (getValueByKey!460 (toList!5388 lt!406639) (_1!6035 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181)))) (Some!465 (_2!6035 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181))))))))

(declare-fun b!900066 () Bool)

(declare-fun contains!4424 (List!17851 tuple2!12048) Bool)

(assert (=> b!900066 (= e!503716 (contains!4424 (toList!5388 lt!406639) (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181))))))

(assert (= (and d!111635 res!607900) b!900065))

(assert (= (and b!900065 res!607899) b!900066))

(declare-fun m!836533 () Bool)

(assert (=> d!111635 m!836533))

(declare-fun m!836535 () Bool)

(assert (=> d!111635 m!836535))

(declare-fun m!836537 () Bool)

(assert (=> d!111635 m!836537))

(declare-fun m!836539 () Bool)

(assert (=> d!111635 m!836539))

(declare-fun m!836541 () Bool)

(assert (=> b!900065 m!836541))

(declare-fun m!836543 () Bool)

(assert (=> b!900066 m!836543))

(assert (=> b!899968 d!111635))

(declare-fun d!111637 () Bool)

(assert (=> d!111637 (= (apply!414 lt!406573 lt!406566) (get!13344 (getValueByKey!460 (toList!5388 lt!406573) lt!406566)))))

(declare-fun bs!25273 () Bool)

(assert (= bs!25273 d!111637))

(declare-fun m!836545 () Bool)

(assert (=> bs!25273 m!836545))

(assert (=> bs!25273 m!836545))

(declare-fun m!836547 () Bool)

(assert (=> bs!25273 m!836547))

(assert (=> b!899968 d!111637))

(declare-fun d!111639 () Bool)

(declare-fun e!503717 () Bool)

(assert (=> d!111639 e!503717))

(declare-fun res!607902 () Bool)

(assert (=> d!111639 (=> (not res!607902) (not e!503717))))

(declare-fun lt!406643 () ListLongMap!10745)

(assert (=> d!111639 (= res!607902 (contains!4423 lt!406643 (_1!6035 (tuple2!12049 lt!406577 (minValue!5266 thiss!1181)))))))

(declare-fun lt!406644 () List!17851)

(assert (=> d!111639 (= lt!406643 (ListLongMap!10746 lt!406644))))

(declare-fun lt!406642 () Unit!30576)

(declare-fun lt!406641 () Unit!30576)

(assert (=> d!111639 (= lt!406642 lt!406641)))

(assert (=> d!111639 (= (getValueByKey!460 lt!406644 (_1!6035 (tuple2!12049 lt!406577 (minValue!5266 thiss!1181)))) (Some!465 (_2!6035 (tuple2!12049 lt!406577 (minValue!5266 thiss!1181)))))))

(assert (=> d!111639 (= lt!406641 (lemmaContainsTupThenGetReturnValue!251 lt!406644 (_1!6035 (tuple2!12049 lt!406577 (minValue!5266 thiss!1181))) (_2!6035 (tuple2!12049 lt!406577 (minValue!5266 thiss!1181)))))))

(assert (=> d!111639 (= lt!406644 (insertStrictlySorted!308 (toList!5388 lt!406571) (_1!6035 (tuple2!12049 lt!406577 (minValue!5266 thiss!1181))) (_2!6035 (tuple2!12049 lt!406577 (minValue!5266 thiss!1181)))))))

(assert (=> d!111639 (= (+!2595 lt!406571 (tuple2!12049 lt!406577 (minValue!5266 thiss!1181))) lt!406643)))

(declare-fun b!900067 () Bool)

(declare-fun res!607901 () Bool)

(assert (=> b!900067 (=> (not res!607901) (not e!503717))))

(assert (=> b!900067 (= res!607901 (= (getValueByKey!460 (toList!5388 lt!406643) (_1!6035 (tuple2!12049 lt!406577 (minValue!5266 thiss!1181)))) (Some!465 (_2!6035 (tuple2!12049 lt!406577 (minValue!5266 thiss!1181))))))))

(declare-fun b!900068 () Bool)

(assert (=> b!900068 (= e!503717 (contains!4424 (toList!5388 lt!406643) (tuple2!12049 lt!406577 (minValue!5266 thiss!1181))))))

(assert (= (and d!111639 res!607902) b!900067))

(assert (= (and b!900067 res!607901) b!900068))

(declare-fun m!836549 () Bool)

(assert (=> d!111639 m!836549))

(declare-fun m!836551 () Bool)

(assert (=> d!111639 m!836551))

(declare-fun m!836553 () Bool)

(assert (=> d!111639 m!836553))

(declare-fun m!836555 () Bool)

(assert (=> d!111639 m!836555))

(declare-fun m!836557 () Bool)

(assert (=> b!900067 m!836557))

(declare-fun m!836559 () Bool)

(assert (=> b!900068 m!836559))

(assert (=> b!899968 d!111639))

(declare-fun d!111641 () Bool)

(assert (=> d!111641 (contains!4423 (+!2595 lt!406580 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181))) lt!406572)))

(declare-fun lt!406647 () Unit!30576)

(declare-fun choose!1510 (ListLongMap!10745 (_ BitVec 64) V!29457 (_ BitVec 64)) Unit!30576)

(assert (=> d!111641 (= lt!406647 (choose!1510 lt!406580 lt!406575 (zeroValue!5266 thiss!1181) lt!406572))))

(assert (=> d!111641 (contains!4423 lt!406580 lt!406572)))

(assert (=> d!111641 (= (addStillContains!336 lt!406580 lt!406575 (zeroValue!5266 thiss!1181) lt!406572) lt!406647)))

(declare-fun bs!25274 () Bool)

(assert (= bs!25274 d!111641))

(assert (=> bs!25274 m!836447))

(assert (=> bs!25274 m!836447))

(assert (=> bs!25274 m!836449))

(declare-fun m!836561 () Bool)

(assert (=> bs!25274 m!836561))

(declare-fun m!836563 () Bool)

(assert (=> bs!25274 m!836563))

(assert (=> b!899968 d!111641))

(declare-fun b!900094 () Bool)

(declare-fun e!503732 () Bool)

(declare-fun e!503734 () Bool)

(assert (=> b!900094 (= e!503732 e!503734)))

(declare-fun c!95278 () Bool)

(assert (=> b!900094 (= c!95278 (bvslt #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))))))

(declare-fun d!111643 () Bool)

(declare-fun e!503733 () Bool)

(assert (=> d!111643 e!503733))

(declare-fun res!607913 () Bool)

(assert (=> d!111643 (=> (not res!607913) (not e!503733))))

(declare-fun lt!406666 () ListLongMap!10745)

(assert (=> d!111643 (= res!607913 (not (contains!4423 lt!406666 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!503736 () ListLongMap!10745)

(assert (=> d!111643 (= lt!406666 e!503736)))

(declare-fun c!95277 () Bool)

(assert (=> d!111643 (= c!95277 (bvsge #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))))))

(assert (=> d!111643 (validMask!0 (mask!26208 thiss!1181))))

(assert (=> d!111643 (= (getCurrentListMapNoExtraKeys!3282 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)) lt!406666)))

(declare-fun bm!39997 () Bool)

(declare-fun call!40000 () ListLongMap!10745)

(assert (=> bm!39997 (= call!40000 (getCurrentListMapNoExtraKeys!3282 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5439 thiss!1181)))))

(declare-fun b!900095 () Bool)

(assert (=> b!900095 (= e!503733 e!503732)))

(declare-fun c!95280 () Bool)

(declare-fun e!503737 () Bool)

(assert (=> b!900095 (= c!95280 e!503737)))

(declare-fun res!607914 () Bool)

(assert (=> b!900095 (=> (not res!607914) (not e!503737))))

(assert (=> b!900095 (= res!607914 (bvslt #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))))))

(declare-fun b!900096 () Bool)

(declare-fun e!503735 () ListLongMap!10745)

(assert (=> b!900096 (= e!503736 e!503735)))

(declare-fun c!95279 () Bool)

(assert (=> b!900096 (= c!95279 (validKeyInArray!0 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900097 () Bool)

(declare-fun e!503738 () Bool)

(assert (=> b!900097 (= e!503732 e!503738)))

(assert (=> b!900097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))))))

(declare-fun res!607912 () Bool)

(assert (=> b!900097 (= res!607912 (contains!4423 lt!406666 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900097 (=> (not res!607912) (not e!503738))))

(declare-fun b!900098 () Bool)

(assert (=> b!900098 (= e!503737 (validKeyInArray!0 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900098 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!900099 () Bool)

(declare-fun isEmpty!690 (ListLongMap!10745) Bool)

(assert (=> b!900099 (= e!503734 (isEmpty!690 lt!406666))))

(declare-fun b!900100 () Bool)

(assert (=> b!900100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))))))

(assert (=> b!900100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25824 (_values!5453 thiss!1181))))))

(assert (=> b!900100 (= e!503738 (= (apply!414 lt!406666 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)) (get!13343 (select (arr!25366 (_values!5453 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1308 (defaultEntry!5439 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!900101 () Bool)

(assert (=> b!900101 (= e!503736 (ListLongMap!10746 Nil!17848))))

(declare-fun b!900102 () Bool)

(declare-fun lt!406662 () Unit!30576)

(declare-fun lt!406664 () Unit!30576)

(assert (=> b!900102 (= lt!406662 lt!406664)))

(declare-fun lt!406663 () V!29457)

(declare-fun lt!406667 () (_ BitVec 64))

(declare-fun lt!406668 () ListLongMap!10745)

(declare-fun lt!406665 () (_ BitVec 64))

(assert (=> b!900102 (not (contains!4423 (+!2595 lt!406668 (tuple2!12049 lt!406665 lt!406663)) lt!406667))))

(declare-fun addStillNotContains!217 (ListLongMap!10745 (_ BitVec 64) V!29457 (_ BitVec 64)) Unit!30576)

(assert (=> b!900102 (= lt!406664 (addStillNotContains!217 lt!406668 lt!406665 lt!406663 lt!406667))))

(assert (=> b!900102 (= lt!406667 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!900102 (= lt!406663 (get!13343 (select (arr!25366 (_values!5453 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1308 (defaultEntry!5439 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!900102 (= lt!406665 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900102 (= lt!406668 call!40000)))

(assert (=> b!900102 (= e!503735 (+!2595 call!40000 (tuple2!12049 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000) (get!13343 (select (arr!25366 (_values!5453 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1308 (defaultEntry!5439 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!900103 () Bool)

(assert (=> b!900103 (= e!503735 call!40000)))

(declare-fun b!900104 () Bool)

(declare-fun res!607911 () Bool)

(assert (=> b!900104 (=> (not res!607911) (not e!503733))))

(assert (=> b!900104 (= res!607911 (not (contains!4423 lt!406666 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!900105 () Bool)

(assert (=> b!900105 (= e!503734 (= lt!406666 (getCurrentListMapNoExtraKeys!3282 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5439 thiss!1181))))))

(assert (= (and d!111643 c!95277) b!900101))

(assert (= (and d!111643 (not c!95277)) b!900096))

(assert (= (and b!900096 c!95279) b!900102))

(assert (= (and b!900096 (not c!95279)) b!900103))

(assert (= (or b!900102 b!900103) bm!39997))

(assert (= (and d!111643 res!607913) b!900104))

(assert (= (and b!900104 res!607911) b!900095))

(assert (= (and b!900095 res!607914) b!900098))

(assert (= (and b!900095 c!95280) b!900097))

(assert (= (and b!900095 (not c!95280)) b!900094))

(assert (= (and b!900097 res!607912) b!900100))

(assert (= (and b!900094 c!95278) b!900105))

(assert (= (and b!900094 (not c!95278)) b!900099))

(declare-fun b_lambda!13007 () Bool)

(assert (=> (not b_lambda!13007) (not b!900100)))

(assert (=> b!900100 t!25202))

(declare-fun b_and!26361 () Bool)

(assert (= b_and!26359 (and (=> t!25202 result!10175) b_and!26361)))

(declare-fun b_lambda!13009 () Bool)

(assert (=> (not b_lambda!13009) (not b!900102)))

(assert (=> b!900102 t!25202))

(declare-fun b_and!26363 () Bool)

(assert (= b_and!26361 (and (=> t!25202 result!10175) b_and!26363)))

(declare-fun m!836565 () Bool)

(assert (=> bm!39997 m!836565))

(assert (=> b!900105 m!836565))

(declare-fun m!836567 () Bool)

(assert (=> b!900102 m!836567))

(assert (=> b!900102 m!836407))

(assert (=> b!900102 m!836567))

(declare-fun m!836569 () Bool)

(assert (=> b!900102 m!836569))

(declare-fun m!836571 () Bool)

(assert (=> b!900102 m!836571))

(assert (=> b!900102 m!836461))

(assert (=> b!900102 m!836459))

(assert (=> b!900102 m!836463))

(declare-fun m!836573 () Bool)

(assert (=> b!900102 m!836573))

(assert (=> b!900102 m!836461))

(assert (=> b!900102 m!836459))

(assert (=> b!900096 m!836407))

(assert (=> b!900096 m!836407))

(assert (=> b!900096 m!836413))

(declare-fun m!836575 () Bool)

(assert (=> d!111643 m!836575))

(assert (=> d!111643 m!836373))

(assert (=> b!900098 m!836407))

(assert (=> b!900098 m!836407))

(assert (=> b!900098 m!836413))

(assert (=> b!900097 m!836407))

(assert (=> b!900097 m!836407))

(declare-fun m!836577 () Bool)

(assert (=> b!900097 m!836577))

(assert (=> b!900100 m!836407))

(assert (=> b!900100 m!836461))

(assert (=> b!900100 m!836459))

(assert (=> b!900100 m!836463))

(assert (=> b!900100 m!836407))

(declare-fun m!836579 () Bool)

(assert (=> b!900100 m!836579))

(assert (=> b!900100 m!836461))

(assert (=> b!900100 m!836459))

(declare-fun m!836581 () Bool)

(assert (=> b!900104 m!836581))

(declare-fun m!836583 () Bool)

(assert (=> b!900099 m!836583))

(assert (=> b!899968 d!111643))

(declare-fun d!111645 () Bool)

(assert (=> d!111645 (= (apply!414 (+!2595 lt!406573 (tuple2!12049 lt!406576 (minValue!5266 thiss!1181))) lt!406566) (apply!414 lt!406573 lt!406566))))

(declare-fun lt!406669 () Unit!30576)

(assert (=> d!111645 (= lt!406669 (choose!1509 lt!406573 lt!406576 (minValue!5266 thiss!1181) lt!406566))))

(declare-fun e!503739 () Bool)

(assert (=> d!111645 e!503739))

(declare-fun res!607915 () Bool)

(assert (=> d!111645 (=> (not res!607915) (not e!503739))))

(assert (=> d!111645 (= res!607915 (contains!4423 lt!406573 lt!406566))))

(assert (=> d!111645 (= (addApplyDifferent!336 lt!406573 lt!406576 (minValue!5266 thiss!1181) lt!406566) lt!406669)))

(declare-fun b!900106 () Bool)

(assert (=> b!900106 (= e!503739 (not (= lt!406566 lt!406576)))))

(assert (= (and d!111645 res!607915) b!900106))

(assert (=> d!111645 m!836455))

(declare-fun m!836585 () Bool)

(assert (=> d!111645 m!836585))

(assert (=> d!111645 m!836435))

(declare-fun m!836587 () Bool)

(assert (=> d!111645 m!836587))

(assert (=> d!111645 m!836435))

(assert (=> d!111645 m!836437))

(assert (=> b!899968 d!111645))

(declare-fun d!111647 () Bool)

(assert (=> d!111647 (= (apply!414 lt!406579 lt!406569) (get!13344 (getValueByKey!460 (toList!5388 lt!406579) lt!406569)))))

(declare-fun bs!25275 () Bool)

(assert (= bs!25275 d!111647))

(declare-fun m!836589 () Bool)

(assert (=> bs!25275 m!836589))

(assert (=> bs!25275 m!836589))

(declare-fun m!836591 () Bool)

(assert (=> bs!25275 m!836591))

(assert (=> b!899968 d!111647))

(declare-fun d!111649 () Bool)

(assert (=> d!111649 (= (apply!414 (+!2595 lt!406571 (tuple2!12049 lt!406577 (minValue!5266 thiss!1181))) lt!406574) (apply!414 lt!406571 lt!406574))))

(declare-fun lt!406670 () Unit!30576)

(assert (=> d!111649 (= lt!406670 (choose!1509 lt!406571 lt!406577 (minValue!5266 thiss!1181) lt!406574))))

(declare-fun e!503740 () Bool)

(assert (=> d!111649 e!503740))

(declare-fun res!607916 () Bool)

(assert (=> d!111649 (=> (not res!607916) (not e!503740))))

(assert (=> d!111649 (= res!607916 (contains!4423 lt!406571 lt!406574))))

(assert (=> d!111649 (= (addApplyDifferent!336 lt!406571 lt!406577 (minValue!5266 thiss!1181) lt!406574) lt!406670)))

(declare-fun b!900107 () Bool)

(assert (=> b!900107 (= e!503740 (not (= lt!406574 lt!406577)))))

(assert (= (and d!111649 res!607916) b!900107))

(assert (=> d!111649 m!836445))

(declare-fun m!836593 () Bool)

(assert (=> d!111649 m!836593))

(assert (=> d!111649 m!836439))

(declare-fun m!836595 () Bool)

(assert (=> d!111649 m!836595))

(assert (=> d!111649 m!836439))

(assert (=> d!111649 m!836451))

(assert (=> b!899968 d!111649))

(declare-fun d!111651 () Bool)

(declare-fun e!503741 () Bool)

(assert (=> d!111651 e!503741))

(declare-fun res!607917 () Bool)

(assert (=> d!111651 (=> res!607917 e!503741)))

(declare-fun lt!406672 () Bool)

(assert (=> d!111651 (= res!607917 (not lt!406672))))

(declare-fun lt!406674 () Bool)

(assert (=> d!111651 (= lt!406672 lt!406674)))

(declare-fun lt!406673 () Unit!30576)

(declare-fun e!503742 () Unit!30576)

(assert (=> d!111651 (= lt!406673 e!503742)))

(declare-fun c!95281 () Bool)

(assert (=> d!111651 (= c!95281 lt!406674)))

(assert (=> d!111651 (= lt!406674 (containsKey!429 (toList!5388 (+!2595 lt!406580 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181)))) lt!406572))))

(assert (=> d!111651 (= (contains!4423 (+!2595 lt!406580 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181))) lt!406572) lt!406672)))

(declare-fun b!900108 () Bool)

(declare-fun lt!406671 () Unit!30576)

(assert (=> b!900108 (= e!503742 lt!406671)))

(assert (=> b!900108 (= lt!406671 (lemmaContainsKeyImpliesGetValueByKeyDefined!325 (toList!5388 (+!2595 lt!406580 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181)))) lt!406572))))

(assert (=> b!900108 (isDefined!334 (getValueByKey!460 (toList!5388 (+!2595 lt!406580 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181)))) lt!406572))))

(declare-fun b!900109 () Bool)

(declare-fun Unit!30581 () Unit!30576)

(assert (=> b!900109 (= e!503742 Unit!30581)))

(declare-fun b!900110 () Bool)

(assert (=> b!900110 (= e!503741 (isDefined!334 (getValueByKey!460 (toList!5388 (+!2595 lt!406580 (tuple2!12049 lt!406575 (zeroValue!5266 thiss!1181)))) lt!406572)))))

(assert (= (and d!111651 c!95281) b!900108))

(assert (= (and d!111651 (not c!95281)) b!900109))

(assert (= (and d!111651 (not res!607917)) b!900110))

(declare-fun m!836597 () Bool)

(assert (=> d!111651 m!836597))

(declare-fun m!836599 () Bool)

(assert (=> b!900108 m!836599))

(declare-fun m!836601 () Bool)

(assert (=> b!900108 m!836601))

(assert (=> b!900108 m!836601))

(declare-fun m!836603 () Bool)

(assert (=> b!900108 m!836603))

(assert (=> b!900110 m!836601))

(assert (=> b!900110 m!836601))

(assert (=> b!900110 m!836603))

(assert (=> b!899968 d!111651))

(declare-fun d!111653 () Bool)

(declare-fun e!503743 () Bool)

(assert (=> d!111653 e!503743))

(declare-fun res!607919 () Bool)

(assert (=> d!111653 (=> (not res!607919) (not e!503743))))

(declare-fun lt!406677 () ListLongMap!10745)

(assert (=> d!111653 (= res!607919 (contains!4423 lt!406677 (_1!6035 (tuple2!12049 lt!406576 (minValue!5266 thiss!1181)))))))

(declare-fun lt!406678 () List!17851)

(assert (=> d!111653 (= lt!406677 (ListLongMap!10746 lt!406678))))

(declare-fun lt!406676 () Unit!30576)

(declare-fun lt!406675 () Unit!30576)

(assert (=> d!111653 (= lt!406676 lt!406675)))

(assert (=> d!111653 (= (getValueByKey!460 lt!406678 (_1!6035 (tuple2!12049 lt!406576 (minValue!5266 thiss!1181)))) (Some!465 (_2!6035 (tuple2!12049 lt!406576 (minValue!5266 thiss!1181)))))))

(assert (=> d!111653 (= lt!406675 (lemmaContainsTupThenGetReturnValue!251 lt!406678 (_1!6035 (tuple2!12049 lt!406576 (minValue!5266 thiss!1181))) (_2!6035 (tuple2!12049 lt!406576 (minValue!5266 thiss!1181)))))))

(assert (=> d!111653 (= lt!406678 (insertStrictlySorted!308 (toList!5388 lt!406573) (_1!6035 (tuple2!12049 lt!406576 (minValue!5266 thiss!1181))) (_2!6035 (tuple2!12049 lt!406576 (minValue!5266 thiss!1181)))))))

(assert (=> d!111653 (= (+!2595 lt!406573 (tuple2!12049 lt!406576 (minValue!5266 thiss!1181))) lt!406677)))

(declare-fun b!900111 () Bool)

(declare-fun res!607918 () Bool)

(assert (=> b!900111 (=> (not res!607918) (not e!503743))))

(assert (=> b!900111 (= res!607918 (= (getValueByKey!460 (toList!5388 lt!406677) (_1!6035 (tuple2!12049 lt!406576 (minValue!5266 thiss!1181)))) (Some!465 (_2!6035 (tuple2!12049 lt!406576 (minValue!5266 thiss!1181))))))))

(declare-fun b!900112 () Bool)

(assert (=> b!900112 (= e!503743 (contains!4424 (toList!5388 lt!406677) (tuple2!12049 lt!406576 (minValue!5266 thiss!1181))))))

(assert (= (and d!111653 res!607919) b!900111))

(assert (= (and b!900111 res!607918) b!900112))

(declare-fun m!836605 () Bool)

(assert (=> d!111653 m!836605))

(declare-fun m!836607 () Bool)

(assert (=> d!111653 m!836607))

(declare-fun m!836609 () Bool)

(assert (=> d!111653 m!836609))

(declare-fun m!836611 () Bool)

(assert (=> d!111653 m!836611))

(declare-fun m!836613 () Bool)

(assert (=> b!900111 m!836613))

(declare-fun m!836615 () Bool)

(assert (=> b!900112 m!836615))

(assert (=> b!899968 d!111653))

(declare-fun d!111655 () Bool)

(assert (=> d!111655 (= (apply!414 (+!2595 lt!406571 (tuple2!12049 lt!406577 (minValue!5266 thiss!1181))) lt!406574) (get!13344 (getValueByKey!460 (toList!5388 (+!2595 lt!406571 (tuple2!12049 lt!406577 (minValue!5266 thiss!1181)))) lt!406574)))))

(declare-fun bs!25276 () Bool)

(assert (= bs!25276 d!111655))

(declare-fun m!836617 () Bool)

(assert (=> bs!25276 m!836617))

(assert (=> bs!25276 m!836617))

(declare-fun m!836619 () Bool)

(assert (=> bs!25276 m!836619))

(assert (=> b!899968 d!111655))

(declare-fun d!111657 () Bool)

(declare-fun e!503744 () Bool)

(assert (=> d!111657 e!503744))

(declare-fun res!607921 () Bool)

(assert (=> d!111657 (=> (not res!607921) (not e!503744))))

(declare-fun lt!406681 () ListLongMap!10745)

(assert (=> d!111657 (= res!607921 (contains!4423 lt!406681 (_1!6035 (tuple2!12049 lt!406582 (zeroValue!5266 thiss!1181)))))))

(declare-fun lt!406682 () List!17851)

(assert (=> d!111657 (= lt!406681 (ListLongMap!10746 lt!406682))))

(declare-fun lt!406680 () Unit!30576)

(declare-fun lt!406679 () Unit!30576)

(assert (=> d!111657 (= lt!406680 lt!406679)))

(assert (=> d!111657 (= (getValueByKey!460 lt!406682 (_1!6035 (tuple2!12049 lt!406582 (zeroValue!5266 thiss!1181)))) (Some!465 (_2!6035 (tuple2!12049 lt!406582 (zeroValue!5266 thiss!1181)))))))

(assert (=> d!111657 (= lt!406679 (lemmaContainsTupThenGetReturnValue!251 lt!406682 (_1!6035 (tuple2!12049 lt!406582 (zeroValue!5266 thiss!1181))) (_2!6035 (tuple2!12049 lt!406582 (zeroValue!5266 thiss!1181)))))))

(assert (=> d!111657 (= lt!406682 (insertStrictlySorted!308 (toList!5388 lt!406579) (_1!6035 (tuple2!12049 lt!406582 (zeroValue!5266 thiss!1181))) (_2!6035 (tuple2!12049 lt!406582 (zeroValue!5266 thiss!1181)))))))

(assert (=> d!111657 (= (+!2595 lt!406579 (tuple2!12049 lt!406582 (zeroValue!5266 thiss!1181))) lt!406681)))

(declare-fun b!900113 () Bool)

(declare-fun res!607920 () Bool)

(assert (=> b!900113 (=> (not res!607920) (not e!503744))))

(assert (=> b!900113 (= res!607920 (= (getValueByKey!460 (toList!5388 lt!406681) (_1!6035 (tuple2!12049 lt!406582 (zeroValue!5266 thiss!1181)))) (Some!465 (_2!6035 (tuple2!12049 lt!406582 (zeroValue!5266 thiss!1181))))))))

(declare-fun b!900114 () Bool)

(assert (=> b!900114 (= e!503744 (contains!4424 (toList!5388 lt!406681) (tuple2!12049 lt!406582 (zeroValue!5266 thiss!1181))))))

(assert (= (and d!111657 res!607921) b!900113))

(assert (= (and b!900113 res!607920) b!900114))

(declare-fun m!836621 () Bool)

(assert (=> d!111657 m!836621))

(declare-fun m!836623 () Bool)

(assert (=> d!111657 m!836623))

(declare-fun m!836625 () Bool)

(assert (=> d!111657 m!836625))

(declare-fun m!836627 () Bool)

(assert (=> d!111657 m!836627))

(declare-fun m!836629 () Bool)

(assert (=> b!900113 m!836629))

(declare-fun m!836631 () Bool)

(assert (=> b!900114 m!836631))

(assert (=> b!899968 d!111657))

(declare-fun d!111659 () Bool)

(assert (=> d!111659 (= (apply!414 (+!2595 lt!406579 (tuple2!12049 lt!406582 (zeroValue!5266 thiss!1181))) lt!406569) (get!13344 (getValueByKey!460 (toList!5388 (+!2595 lt!406579 (tuple2!12049 lt!406582 (zeroValue!5266 thiss!1181)))) lt!406569)))))

(declare-fun bs!25277 () Bool)

(assert (= bs!25277 d!111659))

(declare-fun m!836633 () Bool)

(assert (=> bs!25277 m!836633))

(assert (=> bs!25277 m!836633))

(declare-fun m!836635 () Bool)

(assert (=> bs!25277 m!836635))

(assert (=> b!899968 d!111659))

(assert (=> b!899914 d!111609))

(assert (=> b!899914 d!111607))

(assert (=> d!111601 d!111603))

(declare-fun d!111661 () Bool)

(assert (=> d!111661 (arrayContainsKey!0 (_keys!10234 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111661 true))

(declare-fun _$60!427 () Unit!30576)

(assert (=> d!111661 (= (choose!13 (_keys!10234 thiss!1181) key!785 (index!38112 lt!406498)) _$60!427)))

(declare-fun bs!25278 () Bool)

(assert (= bs!25278 d!111661))

(assert (=> bs!25278 m!836371))

(assert (=> d!111601 d!111661))

(declare-fun d!111663 () Bool)

(assert (=> d!111663 (= (apply!414 lt!406565 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)) (get!13344 (getValueByKey!460 (toList!5388 lt!406565) (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25279 () Bool)

(assert (= bs!25279 d!111663))

(assert (=> bs!25279 m!836407))

(declare-fun m!836637 () Bool)

(assert (=> bs!25279 m!836637))

(assert (=> bs!25279 m!836637))

(declare-fun m!836639 () Bool)

(assert (=> bs!25279 m!836639))

(assert (=> b!899970 d!111663))

(declare-fun d!111665 () Bool)

(declare-fun c!95284 () Bool)

(assert (=> d!111665 (= c!95284 ((_ is ValueCellFull!8703) (select (arr!25366 (_values!5453 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!503747 () V!29457)

(assert (=> d!111665 (= (get!13343 (select (arr!25366 (_values!5453 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1308 (defaultEntry!5439 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!503747)))

(declare-fun b!900119 () Bool)

(declare-fun get!13345 (ValueCell!8703 V!29457) V!29457)

(assert (=> b!900119 (= e!503747 (get!13345 (select (arr!25366 (_values!5453 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1308 (defaultEntry!5439 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!900120 () Bool)

(declare-fun get!13346 (ValueCell!8703 V!29457) V!29457)

(assert (=> b!900120 (= e!503747 (get!13346 (select (arr!25366 (_values!5453 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1308 (defaultEntry!5439 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111665 c!95284) b!900119))

(assert (= (and d!111665 (not c!95284)) b!900120))

(assert (=> b!900119 m!836461))

(assert (=> b!900119 m!836459))

(declare-fun m!836641 () Bool)

(assert (=> b!900119 m!836641))

(assert (=> b!900120 m!836461))

(assert (=> b!900120 m!836459))

(declare-fun m!836643 () Bool)

(assert (=> b!900120 m!836643))

(assert (=> b!899970 d!111665))

(declare-fun d!111667 () Bool)

(declare-fun res!607927 () Bool)

(declare-fun e!503755 () Bool)

(assert (=> d!111667 (=> res!607927 e!503755)))

(assert (=> d!111667 (= res!607927 (bvsge #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))))))

(assert (=> d!111667 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10234 thiss!1181) (mask!26208 thiss!1181)) e!503755)))

(declare-fun b!900129 () Bool)

(declare-fun e!503756 () Bool)

(declare-fun call!40003 () Bool)

(assert (=> b!900129 (= e!503756 call!40003)))

(declare-fun b!900130 () Bool)

(declare-fun e!503754 () Bool)

(assert (=> b!900130 (= e!503754 call!40003)))

(declare-fun bm!40000 () Bool)

(assert (=> bm!40000 (= call!40003 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10234 thiss!1181) (mask!26208 thiss!1181)))))

(declare-fun b!900131 () Bool)

(assert (=> b!900131 (= e!503755 e!503754)))

(declare-fun c!95287 () Bool)

(assert (=> b!900131 (= c!95287 (validKeyInArray!0 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900132 () Bool)

(assert (=> b!900132 (= e!503754 e!503756)))

(declare-fun lt!406689 () (_ BitVec 64))

(assert (=> b!900132 (= lt!406689 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406690 () Unit!30576)

(assert (=> b!900132 (= lt!406690 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10234 thiss!1181) lt!406689 #b00000000000000000000000000000000))))

(assert (=> b!900132 (arrayContainsKey!0 (_keys!10234 thiss!1181) lt!406689 #b00000000000000000000000000000000)))

(declare-fun lt!406691 () Unit!30576)

(assert (=> b!900132 (= lt!406691 lt!406690)))

(declare-fun res!607926 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52784 (_ BitVec 32)) SeekEntryResult!8935)

(assert (=> b!900132 (= res!607926 (= (seekEntryOrOpen!0 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000) (_keys!10234 thiss!1181) (mask!26208 thiss!1181)) (Found!8935 #b00000000000000000000000000000000)))))

(assert (=> b!900132 (=> (not res!607926) (not e!503756))))

(assert (= (and d!111667 (not res!607927)) b!900131))

(assert (= (and b!900131 c!95287) b!900132))

(assert (= (and b!900131 (not c!95287)) b!900130))

(assert (= (and b!900132 res!607926) b!900129))

(assert (= (or b!900129 b!900130) bm!40000))

(declare-fun m!836645 () Bool)

(assert (=> bm!40000 m!836645))

(assert (=> b!900131 m!836407))

(assert (=> b!900131 m!836407))

(assert (=> b!900131 m!836413))

(assert (=> b!900132 m!836407))

(declare-fun m!836647 () Bool)

(assert (=> b!900132 m!836647))

(declare-fun m!836649 () Bool)

(assert (=> b!900132 m!836649))

(assert (=> b!900132 m!836407))

(declare-fun m!836651 () Bool)

(assert (=> b!900132 m!836651))

(assert (=> b!900017 d!111667))

(declare-fun d!111669 () Bool)

(declare-fun e!503757 () Bool)

(assert (=> d!111669 e!503757))

(declare-fun res!607928 () Bool)

(assert (=> d!111669 (=> res!607928 e!503757)))

(declare-fun lt!406693 () Bool)

(assert (=> d!111669 (= res!607928 (not lt!406693))))

(declare-fun lt!406695 () Bool)

(assert (=> d!111669 (= lt!406693 lt!406695)))

(declare-fun lt!406694 () Unit!30576)

(declare-fun e!503758 () Unit!30576)

(assert (=> d!111669 (= lt!406694 e!503758)))

(declare-fun c!95288 () Bool)

(assert (=> d!111669 (= c!95288 lt!406695)))

(assert (=> d!111669 (= lt!406695 (containsKey!429 (toList!5388 lt!406565) (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111669 (= (contains!4423 lt!406565 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)) lt!406693)))

(declare-fun b!900133 () Bool)

(declare-fun lt!406692 () Unit!30576)

(assert (=> b!900133 (= e!503758 lt!406692)))

(assert (=> b!900133 (= lt!406692 (lemmaContainsKeyImpliesGetValueByKeyDefined!325 (toList!5388 lt!406565) (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900133 (isDefined!334 (getValueByKey!460 (toList!5388 lt!406565) (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900134 () Bool)

(declare-fun Unit!30582 () Unit!30576)

(assert (=> b!900134 (= e!503758 Unit!30582)))

(declare-fun b!900135 () Bool)

(assert (=> b!900135 (= e!503757 (isDefined!334 (getValueByKey!460 (toList!5388 lt!406565) (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!111669 c!95288) b!900133))

(assert (= (and d!111669 (not c!95288)) b!900134))

(assert (= (and d!111669 (not res!607928)) b!900135))

(assert (=> d!111669 m!836407))

(declare-fun m!836653 () Bool)

(assert (=> d!111669 m!836653))

(assert (=> b!900133 m!836407))

(declare-fun m!836655 () Bool)

(assert (=> b!900133 m!836655))

(assert (=> b!900133 m!836407))

(assert (=> b!900133 m!836637))

(assert (=> b!900133 m!836637))

(declare-fun m!836657 () Bool)

(assert (=> b!900133 m!836657))

(assert (=> b!900135 m!836407))

(assert (=> b!900135 m!836637))

(assert (=> b!900135 m!836637))

(assert (=> b!900135 m!836657))

(assert (=> b!899967 d!111669))

(declare-fun b!900146 () Bool)

(declare-fun e!503769 () Bool)

(declare-fun call!40006 () Bool)

(assert (=> b!900146 (= e!503769 call!40006)))

(declare-fun d!111671 () Bool)

(declare-fun res!607937 () Bool)

(declare-fun e!503767 () Bool)

(assert (=> d!111671 (=> res!607937 e!503767)))

(assert (=> d!111671 (= res!607937 (bvsge #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))))))

(assert (=> d!111671 (= (arrayNoDuplicates!0 (_keys!10234 thiss!1181) #b00000000000000000000000000000000 Nil!17849) e!503767)))

(declare-fun b!900147 () Bool)

(assert (=> b!900147 (= e!503769 call!40006)))

(declare-fun b!900148 () Bool)

(declare-fun e!503770 () Bool)

(declare-fun contains!4425 (List!17852 (_ BitVec 64)) Bool)

(assert (=> b!900148 (= e!503770 (contains!4425 Nil!17849 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900149 () Bool)

(declare-fun e!503768 () Bool)

(assert (=> b!900149 (= e!503768 e!503769)))

(declare-fun c!95291 () Bool)

(assert (=> b!900149 (= c!95291 (validKeyInArray!0 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900150 () Bool)

(assert (=> b!900150 (= e!503767 e!503768)))

(declare-fun res!607935 () Bool)

(assert (=> b!900150 (=> (not res!607935) (not e!503768))))

(assert (=> b!900150 (= res!607935 (not e!503770))))

(declare-fun res!607936 () Bool)

(assert (=> b!900150 (=> (not res!607936) (not e!503770))))

(assert (=> b!900150 (= res!607936 (validKeyInArray!0 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40003 () Bool)

(assert (=> bm!40003 (= call!40006 (arrayNoDuplicates!0 (_keys!10234 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95291 (Cons!17848 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000) Nil!17849) Nil!17849)))))

(assert (= (and d!111671 (not res!607937)) b!900150))

(assert (= (and b!900150 res!607936) b!900148))

(assert (= (and b!900150 res!607935) b!900149))

(assert (= (and b!900149 c!95291) b!900147))

(assert (= (and b!900149 (not c!95291)) b!900146))

(assert (= (or b!900147 b!900146) bm!40003))

(assert (=> b!900148 m!836407))

(assert (=> b!900148 m!836407))

(declare-fun m!836659 () Bool)

(assert (=> b!900148 m!836659))

(assert (=> b!900149 m!836407))

(assert (=> b!900149 m!836407))

(assert (=> b!900149 m!836413))

(assert (=> b!900150 m!836407))

(assert (=> b!900150 m!836407))

(assert (=> b!900150 m!836413))

(assert (=> bm!40003 m!836407))

(declare-fun m!836661 () Bool)

(assert (=> bm!40003 m!836661))

(assert (=> b!900018 d!111671))

(declare-fun d!111673 () Bool)

(assert (=> d!111673 (isDefined!334 (getValueByKey!460 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498))))))

(declare-fun lt!406698 () Unit!30576)

(declare-fun choose!1511 (List!17851 (_ BitVec 64)) Unit!30576)

(assert (=> d!111673 (= lt!406698 (choose!1511 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498))))))

(declare-fun e!503773 () Bool)

(assert (=> d!111673 e!503773))

(declare-fun res!607940 () Bool)

(assert (=> d!111673 (=> (not res!607940) (not e!503773))))

(declare-fun isStrictlySorted!500 (List!17851) Bool)

(assert (=> d!111673 (= res!607940 (isStrictlySorted!500 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)))))))

(assert (=> d!111673 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!325 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498))) lt!406698)))

(declare-fun b!900153 () Bool)

(assert (=> b!900153 (= e!503773 (containsKey!429 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498))))))

(assert (= (and d!111673 res!607940) b!900153))

(assert (=> d!111673 m!836365))

(assert (=> d!111673 m!836473))

(assert (=> d!111673 m!836473))

(assert (=> d!111673 m!836475))

(assert (=> d!111673 m!836365))

(declare-fun m!836663 () Bool)

(assert (=> d!111673 m!836663))

(declare-fun m!836665 () Bool)

(assert (=> d!111673 m!836665))

(assert (=> b!900153 m!836365))

(assert (=> b!900153 m!836469))

(assert (=> b!899986 d!111673))

(declare-fun d!111675 () Bool)

(declare-fun isEmpty!691 (Option!466) Bool)

(assert (=> d!111675 (= (isDefined!334 (getValueByKey!460 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498)))) (not (isEmpty!691 (getValueByKey!460 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498))))))))

(declare-fun bs!25280 () Bool)

(assert (= bs!25280 d!111675))

(assert (=> bs!25280 m!836473))

(declare-fun m!836667 () Bool)

(assert (=> bs!25280 m!836667))

(assert (=> b!899986 d!111675))

(declare-fun b!900164 () Bool)

(declare-fun e!503779 () Option!466)

(assert (=> b!900164 (= e!503779 (getValueByKey!460 (t!25200 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498))))))

(declare-fun d!111677 () Bool)

(declare-fun c!95296 () Bool)

(assert (=> d!111677 (= c!95296 (and ((_ is Cons!17847) (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)))) (= (_1!6035 (h!18992 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498)))))))

(declare-fun e!503778 () Option!466)

(assert (=> d!111677 (= (getValueByKey!460 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498))) e!503778)))

(declare-fun b!900165 () Bool)

(assert (=> b!900165 (= e!503779 None!464)))

(declare-fun b!900162 () Bool)

(assert (=> b!900162 (= e!503778 (Some!465 (_2!6035 (h!18992 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)))))))))

(declare-fun b!900163 () Bool)

(assert (=> b!900163 (= e!503778 e!503779)))

(declare-fun c!95297 () Bool)

(assert (=> b!900163 (= c!95297 (and ((_ is Cons!17847) (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181)))) (not (= (_1!6035 (h!18992 (toList!5388 (getCurrentListMap!2662 (_keys!10234 thiss!1181) (_values!5453 thiss!1181) (mask!26208 thiss!1181) (extraKeys!5162 thiss!1181) (zeroValue!5266 thiss!1181) (minValue!5266 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5439 thiss!1181))))) (select (arr!25365 (_keys!10234 thiss!1181)) (index!38112 lt!406498))))))))

(assert (= (and d!111677 c!95296) b!900162))

(assert (= (and d!111677 (not c!95296)) b!900163))

(assert (= (and b!900163 c!95297) b!900164))

(assert (= (and b!900163 (not c!95297)) b!900165))

(assert (=> b!900164 m!836365))

(declare-fun m!836669 () Bool)

(assert (=> b!900164 m!836669))

(assert (=> b!899986 d!111677))

(declare-fun d!111679 () Bool)

(assert (=> d!111679 (= (apply!414 lt!406565 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13344 (getValueByKey!460 (toList!5388 lt!406565) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25281 () Bool)

(assert (= bs!25281 d!111679))

(assert (=> bs!25281 m!836517))

(assert (=> bs!25281 m!836517))

(declare-fun m!836671 () Bool)

(assert (=> bs!25281 m!836671))

(assert (=> b!899964 d!111679))

(declare-fun b!900175 () Bool)

(declare-fun res!607952 () Bool)

(declare-fun e!503782 () Bool)

(assert (=> b!900175 (=> (not res!607952) (not e!503782))))

(declare-fun size!25827 (LongMapFixedSize!4422) (_ BitVec 32))

(assert (=> b!900175 (= res!607952 (bvsge (size!25827 thiss!1181) (_size!2266 thiss!1181)))))

(declare-fun b!900176 () Bool)

(declare-fun res!607950 () Bool)

(assert (=> b!900176 (=> (not res!607950) (not e!503782))))

(assert (=> b!900176 (= res!607950 (= (size!25827 thiss!1181) (bvadd (_size!2266 thiss!1181) (bvsdiv (bvadd (extraKeys!5162 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!111681 () Bool)

(declare-fun res!607951 () Bool)

(assert (=> d!111681 (=> (not res!607951) (not e!503782))))

(assert (=> d!111681 (= res!607951 (validMask!0 (mask!26208 thiss!1181)))))

(assert (=> d!111681 (= (simpleValid!328 thiss!1181) e!503782)))

(declare-fun b!900177 () Bool)

(assert (=> b!900177 (= e!503782 (and (bvsge (extraKeys!5162 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5162 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2266 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!900174 () Bool)

(declare-fun res!607949 () Bool)

(assert (=> b!900174 (=> (not res!607949) (not e!503782))))

(assert (=> b!900174 (= res!607949 (and (= (size!25824 (_values!5453 thiss!1181)) (bvadd (mask!26208 thiss!1181) #b00000000000000000000000000000001)) (= (size!25823 (_keys!10234 thiss!1181)) (size!25824 (_values!5453 thiss!1181))) (bvsge (_size!2266 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2266 thiss!1181) (bvadd (mask!26208 thiss!1181) #b00000000000000000000000000000001))))))

(assert (= (and d!111681 res!607951) b!900174))

(assert (= (and b!900174 res!607949) b!900175))

(assert (= (and b!900175 res!607952) b!900176))

(assert (= (and b!900176 res!607950) b!900177))

(declare-fun m!836673 () Bool)

(assert (=> b!900175 m!836673))

(assert (=> b!900176 m!836673))

(assert (=> d!111681 m!836373))

(assert (=> d!111615 d!111681))

(declare-fun b!900186 () Bool)

(declare-fun e!503788 () (_ BitVec 32))

(assert (=> b!900186 (= e!503788 #b00000000000000000000000000000000)))

(declare-fun b!900187 () Bool)

(declare-fun e!503787 () (_ BitVec 32))

(declare-fun call!40009 () (_ BitVec 32))

(assert (=> b!900187 (= e!503787 (bvadd #b00000000000000000000000000000001 call!40009))))

(declare-fun b!900188 () Bool)

(assert (=> b!900188 (= e!503787 call!40009)))

(declare-fun d!111683 () Bool)

(declare-fun lt!406701 () (_ BitVec 32))

(assert (=> d!111683 (and (bvsge lt!406701 #b00000000000000000000000000000000) (bvsle lt!406701 (bvsub (size!25823 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111683 (= lt!406701 e!503788)))

(declare-fun c!95303 () Bool)

(assert (=> d!111683 (= c!95303 (bvsge #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))))))

(assert (=> d!111683 (and (bvsle #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25823 (_keys!10234 thiss!1181)) (size!25823 (_keys!10234 thiss!1181))))))

(assert (=> d!111683 (= (arrayCountValidKeys!0 (_keys!10234 thiss!1181) #b00000000000000000000000000000000 (size!25823 (_keys!10234 thiss!1181))) lt!406701)))

(declare-fun bm!40006 () Bool)

(assert (=> bm!40006 (= call!40009 (arrayCountValidKeys!0 (_keys!10234 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25823 (_keys!10234 thiss!1181))))))

(declare-fun b!900189 () Bool)

(assert (=> b!900189 (= e!503788 e!503787)))

(declare-fun c!95302 () Bool)

(assert (=> b!900189 (= c!95302 (validKeyInArray!0 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111683 c!95303) b!900186))

(assert (= (and d!111683 (not c!95303)) b!900189))

(assert (= (and b!900189 c!95302) b!900187))

(assert (= (and b!900189 (not c!95302)) b!900188))

(assert (= (or b!900187 b!900188) bm!40006))

(declare-fun m!836675 () Bool)

(assert (=> bm!40006 m!836675))

(assert (=> b!900189 m!836407))

(assert (=> b!900189 m!836407))

(assert (=> b!900189 m!836413))

(assert (=> b!900016 d!111683))

(assert (=> b!899988 d!111675))

(assert (=> b!899988 d!111677))

(declare-fun d!111685 () Bool)

(assert (=> d!111685 (= (apply!414 lt!406565 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13344 (getValueByKey!460 (toList!5388 lt!406565) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25282 () Bool)

(assert (= bs!25282 d!111685))

(declare-fun m!836677 () Bool)

(assert (=> bs!25282 m!836677))

(assert (=> bs!25282 m!836677))

(declare-fun m!836679 () Bool)

(assert (=> bs!25282 m!836679))

(assert (=> b!899966 d!111685))

(declare-fun d!111687 () Bool)

(declare-fun e!503789 () Bool)

(assert (=> d!111687 e!503789))

(declare-fun res!607954 () Bool)

(assert (=> d!111687 (=> (not res!607954) (not e!503789))))

(declare-fun lt!406704 () ListLongMap!10745)

(assert (=> d!111687 (= res!607954 (contains!4423 lt!406704 (_1!6035 (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181)))))))

(declare-fun lt!406705 () List!17851)

(assert (=> d!111687 (= lt!406704 (ListLongMap!10746 lt!406705))))

(declare-fun lt!406703 () Unit!30576)

(declare-fun lt!406702 () Unit!30576)

(assert (=> d!111687 (= lt!406703 lt!406702)))

(assert (=> d!111687 (= (getValueByKey!460 lt!406705 (_1!6035 (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181)))) (Some!465 (_2!6035 (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181)))))))

(assert (=> d!111687 (= lt!406702 (lemmaContainsTupThenGetReturnValue!251 lt!406705 (_1!6035 (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181))) (_2!6035 (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181)))))))

(assert (=> d!111687 (= lt!406705 (insertStrictlySorted!308 (toList!5388 call!39993) (_1!6035 (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181))) (_2!6035 (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181)))))))

(assert (=> d!111687 (= (+!2595 call!39993 (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181))) lt!406704)))

(declare-fun b!900190 () Bool)

(declare-fun res!607953 () Bool)

(assert (=> b!900190 (=> (not res!607953) (not e!503789))))

(assert (=> b!900190 (= res!607953 (= (getValueByKey!460 (toList!5388 lt!406704) (_1!6035 (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181)))) (Some!465 (_2!6035 (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181))))))))

(declare-fun b!900191 () Bool)

(assert (=> b!900191 (= e!503789 (contains!4424 (toList!5388 lt!406704) (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181))))))

(assert (= (and d!111687 res!607954) b!900190))

(assert (= (and b!900190 res!607953) b!900191))

(declare-fun m!836681 () Bool)

(assert (=> d!111687 m!836681))

(declare-fun m!836683 () Bool)

(assert (=> d!111687 m!836683))

(declare-fun m!836685 () Bool)

(assert (=> d!111687 m!836685))

(declare-fun m!836687 () Bool)

(assert (=> d!111687 m!836687))

(declare-fun m!836689 () Bool)

(assert (=> b!900190 m!836689))

(declare-fun m!836691 () Bool)

(assert (=> b!900191 m!836691))

(assert (=> b!899961 d!111687))

(declare-fun d!111689 () Bool)

(assert (=> d!111689 (= (validKeyInArray!0 (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25365 (_keys!10234 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!899962 d!111689))

(declare-fun d!111691 () Bool)

(declare-fun res!607955 () Bool)

(declare-fun e!503790 () Bool)

(assert (=> d!111691 (=> res!607955 e!503790)))

(assert (=> d!111691 (= res!607955 (= (select (arr!25365 (_keys!10234 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111691 (= (arrayContainsKey!0 (_keys!10234 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!503790)))

(declare-fun b!900192 () Bool)

(declare-fun e!503791 () Bool)

(assert (=> b!900192 (= e!503790 e!503791)))

(declare-fun res!607956 () Bool)

(assert (=> b!900192 (=> (not res!607956) (not e!503791))))

(assert (=> b!900192 (= res!607956 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25823 (_keys!10234 thiss!1181))))))

(declare-fun b!900193 () Bool)

(assert (=> b!900193 (= e!503791 (arrayContainsKey!0 (_keys!10234 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111691 (not res!607955)) b!900192))

(assert (= (and b!900192 res!607956) b!900193))

(declare-fun m!836693 () Bool)

(assert (=> d!111691 m!836693))

(declare-fun m!836695 () Bool)

(assert (=> b!900193 m!836695))

(assert (=> b!899911 d!111691))

(declare-fun b!900212 () Bool)

(declare-fun e!503802 () SeekEntryResult!8935)

(assert (=> b!900212 (= e!503802 (Intermediate!8935 true (toIndex!0 key!785 (mask!26208 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!900213 () Bool)

(declare-fun lt!406711 () SeekEntryResult!8935)

(assert (=> b!900213 (and (bvsge (index!38113 lt!406711) #b00000000000000000000000000000000) (bvslt (index!38113 lt!406711) (size!25823 (_keys!10234 thiss!1181))))))

(declare-fun res!607964 () Bool)

(assert (=> b!900213 (= res!607964 (= (select (arr!25365 (_keys!10234 thiss!1181)) (index!38113 lt!406711)) key!785))))

(declare-fun e!503805 () Bool)

(assert (=> b!900213 (=> res!607964 e!503805)))

(declare-fun e!503803 () Bool)

(assert (=> b!900213 (= e!503803 e!503805)))

(declare-fun b!900214 () Bool)

(declare-fun e!503804 () SeekEntryResult!8935)

(assert (=> b!900214 (= e!503804 (Intermediate!8935 false (toIndex!0 key!785 (mask!26208 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!900215 () Bool)

(assert (=> b!900215 (= e!503802 e!503804)))

(declare-fun c!95312 () Bool)

(declare-fun lt!406710 () (_ BitVec 64))

(assert (=> b!900215 (= c!95312 (or (= lt!406710 key!785) (= (bvadd lt!406710 lt!406710) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!111693 () Bool)

(declare-fun e!503806 () Bool)

(assert (=> d!111693 e!503806))

(declare-fun c!95311 () Bool)

(assert (=> d!111693 (= c!95311 (and ((_ is Intermediate!8935) lt!406711) (undefined!9747 lt!406711)))))

(assert (=> d!111693 (= lt!406711 e!503802)))

(declare-fun c!95310 () Bool)

(assert (=> d!111693 (= c!95310 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!111693 (= lt!406710 (select (arr!25365 (_keys!10234 thiss!1181)) (toIndex!0 key!785 (mask!26208 thiss!1181))))))

(assert (=> d!111693 (validMask!0 (mask!26208 thiss!1181))))

(assert (=> d!111693 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26208 thiss!1181)) key!785 (_keys!10234 thiss!1181) (mask!26208 thiss!1181)) lt!406711)))

(declare-fun b!900216 () Bool)

(assert (=> b!900216 (and (bvsge (index!38113 lt!406711) #b00000000000000000000000000000000) (bvslt (index!38113 lt!406711) (size!25823 (_keys!10234 thiss!1181))))))

(assert (=> b!900216 (= e!503805 (= (select (arr!25365 (_keys!10234 thiss!1181)) (index!38113 lt!406711)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900217 () Bool)

(assert (=> b!900217 (and (bvsge (index!38113 lt!406711) #b00000000000000000000000000000000) (bvslt (index!38113 lt!406711) (size!25823 (_keys!10234 thiss!1181))))))

(declare-fun res!607963 () Bool)

(assert (=> b!900217 (= res!607963 (= (select (arr!25365 (_keys!10234 thiss!1181)) (index!38113 lt!406711)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900217 (=> res!607963 e!503805)))

(declare-fun b!900218 () Bool)

(assert (=> b!900218 (= e!503804 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26208 thiss!1181)) #b00000000000000000000000000000000 (mask!26208 thiss!1181)) key!785 (_keys!10234 thiss!1181) (mask!26208 thiss!1181)))))

(declare-fun b!900219 () Bool)

(assert (=> b!900219 (= e!503806 e!503803)))

(declare-fun res!607965 () Bool)

(assert (=> b!900219 (= res!607965 (and ((_ is Intermediate!8935) lt!406711) (not (undefined!9747 lt!406711)) (bvslt (x!76678 lt!406711) #b01111111111111111111111111111110) (bvsge (x!76678 lt!406711) #b00000000000000000000000000000000) (bvsge (x!76678 lt!406711) #b00000000000000000000000000000000)))))

(assert (=> b!900219 (=> (not res!607965) (not e!503803))))

(declare-fun b!900220 () Bool)

(assert (=> b!900220 (= e!503806 (bvsge (x!76678 lt!406711) #b01111111111111111111111111111110))))

(assert (= (and d!111693 c!95310) b!900212))

(assert (= (and d!111693 (not c!95310)) b!900215))

(assert (= (and b!900215 c!95312) b!900214))

(assert (= (and b!900215 (not c!95312)) b!900218))

(assert (= (and d!111693 c!95311) b!900220))

(assert (= (and d!111693 (not c!95311)) b!900219))

(assert (= (and b!900219 res!607965) b!900213))

(assert (= (and b!900213 (not res!607964)) b!900217))

(assert (= (and b!900217 (not res!607963)) b!900216))

(declare-fun m!836697 () Bool)

(assert (=> b!900213 m!836697))

(assert (=> b!900218 m!836483))

(declare-fun m!836699 () Bool)

(assert (=> b!900218 m!836699))

(assert (=> b!900218 m!836699))

(declare-fun m!836701 () Bool)

(assert (=> b!900218 m!836701))

(assert (=> b!900216 m!836697))

(assert (=> b!900217 m!836697))

(assert (=> d!111693 m!836483))

(declare-fun m!836703 () Bool)

(assert (=> d!111693 m!836703))

(assert (=> d!111693 m!836373))

(assert (=> d!111613 d!111693))

(declare-fun d!111695 () Bool)

(declare-fun lt!406717 () (_ BitVec 32))

(declare-fun lt!406716 () (_ BitVec 32))

(assert (=> d!111695 (= lt!406717 (bvmul (bvxor lt!406716 (bvlshr lt!406716 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111695 (= lt!406716 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111695 (and (bvsge (mask!26208 thiss!1181) #b00000000000000000000000000000000) (let ((res!607966 (let ((h!18994 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76696 (bvmul (bvxor h!18994 (bvlshr h!18994 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76696 (bvlshr x!76696 #b00000000000000000000000000001101)) (mask!26208 thiss!1181)))))) (and (bvslt res!607966 (bvadd (mask!26208 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!607966 #b00000000000000000000000000000000))))))

(assert (=> d!111695 (= (toIndex!0 key!785 (mask!26208 thiss!1181)) (bvand (bvxor lt!406717 (bvlshr lt!406717 #b00000000000000000000000000001101)) (mask!26208 thiss!1181)))))

(assert (=> d!111613 d!111695))

(assert (=> d!111613 d!111599))

(declare-fun d!111697 () Bool)

(declare-fun e!503807 () Bool)

(assert (=> d!111697 e!503807))

(declare-fun res!607967 () Bool)

(assert (=> d!111697 (=> res!607967 e!503807)))

(declare-fun lt!406719 () Bool)

(assert (=> d!111697 (= res!607967 (not lt!406719))))

(declare-fun lt!406721 () Bool)

(assert (=> d!111697 (= lt!406719 lt!406721)))

(declare-fun lt!406720 () Unit!30576)

(declare-fun e!503808 () Unit!30576)

(assert (=> d!111697 (= lt!406720 e!503808)))

(declare-fun c!95313 () Bool)

(assert (=> d!111697 (= c!95313 lt!406721)))

(assert (=> d!111697 (= lt!406721 (containsKey!429 (toList!5388 lt!406565) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111697 (= (contains!4423 lt!406565 #b1000000000000000000000000000000000000000000000000000000000000000) lt!406719)))

(declare-fun b!900221 () Bool)

(declare-fun lt!406718 () Unit!30576)

(assert (=> b!900221 (= e!503808 lt!406718)))

(assert (=> b!900221 (= lt!406718 (lemmaContainsKeyImpliesGetValueByKeyDefined!325 (toList!5388 lt!406565) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900221 (isDefined!334 (getValueByKey!460 (toList!5388 lt!406565) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900222 () Bool)

(declare-fun Unit!30583 () Unit!30576)

(assert (=> b!900222 (= e!503808 Unit!30583)))

(declare-fun b!900223 () Bool)

(assert (=> b!900223 (= e!503807 (isDefined!334 (getValueByKey!460 (toList!5388 lt!406565) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111697 c!95313) b!900221))

(assert (= (and d!111697 (not c!95313)) b!900222))

(assert (= (and d!111697 (not res!607967)) b!900223))

(declare-fun m!836705 () Bool)

(assert (=> d!111697 m!836705))

(declare-fun m!836707 () Bool)

(assert (=> b!900221 m!836707))

(assert (=> b!900221 m!836677))

(assert (=> b!900221 m!836677))

(declare-fun m!836709 () Bool)

(assert (=> b!900221 m!836709))

(assert (=> b!900223 m!836677))

(assert (=> b!900223 m!836677))

(assert (=> b!900223 m!836709))

(assert (=> bm!39993 d!111697))

(declare-fun d!111699 () Bool)

(declare-fun e!503809 () Bool)

(assert (=> d!111699 e!503809))

(declare-fun res!607969 () Bool)

(assert (=> d!111699 (=> (not res!607969) (not e!503809))))

(declare-fun lt!406724 () ListLongMap!10745)

(assert (=> d!111699 (= res!607969 (contains!4423 lt!406724 (_1!6035 (ite (or c!95241 c!95245) (tuple2!12049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5266 thiss!1181)) (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181))))))))

(declare-fun lt!406725 () List!17851)

(assert (=> d!111699 (= lt!406724 (ListLongMap!10746 lt!406725))))

(declare-fun lt!406723 () Unit!30576)

(declare-fun lt!406722 () Unit!30576)

(assert (=> d!111699 (= lt!406723 lt!406722)))

(assert (=> d!111699 (= (getValueByKey!460 lt!406725 (_1!6035 (ite (or c!95241 c!95245) (tuple2!12049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5266 thiss!1181)) (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181))))) (Some!465 (_2!6035 (ite (or c!95241 c!95245) (tuple2!12049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5266 thiss!1181)) (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181))))))))

(assert (=> d!111699 (= lt!406722 (lemmaContainsTupThenGetReturnValue!251 lt!406725 (_1!6035 (ite (or c!95241 c!95245) (tuple2!12049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5266 thiss!1181)) (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181)))) (_2!6035 (ite (or c!95241 c!95245) (tuple2!12049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5266 thiss!1181)) (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181))))))))

(assert (=> d!111699 (= lt!406725 (insertStrictlySorted!308 (toList!5388 (ite c!95241 call!39997 (ite c!95245 call!39996 call!39995))) (_1!6035 (ite (or c!95241 c!95245) (tuple2!12049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5266 thiss!1181)) (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181)))) (_2!6035 (ite (or c!95241 c!95245) (tuple2!12049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5266 thiss!1181)) (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181))))))))

(assert (=> d!111699 (= (+!2595 (ite c!95241 call!39997 (ite c!95245 call!39996 call!39995)) (ite (or c!95241 c!95245) (tuple2!12049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5266 thiss!1181)) (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181)))) lt!406724)))

(declare-fun b!900224 () Bool)

(declare-fun res!607968 () Bool)

(assert (=> b!900224 (=> (not res!607968) (not e!503809))))

(assert (=> b!900224 (= res!607968 (= (getValueByKey!460 (toList!5388 lt!406724) (_1!6035 (ite (or c!95241 c!95245) (tuple2!12049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5266 thiss!1181)) (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181))))) (Some!465 (_2!6035 (ite (or c!95241 c!95245) (tuple2!12049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5266 thiss!1181)) (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181)))))))))

(declare-fun b!900225 () Bool)

(assert (=> b!900225 (= e!503809 (contains!4424 (toList!5388 lt!406724) (ite (or c!95241 c!95245) (tuple2!12049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5266 thiss!1181)) (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5266 thiss!1181)))))))

(assert (= (and d!111699 res!607969) b!900224))

(assert (= (and b!900224 res!607968) b!900225))

(declare-fun m!836711 () Bool)

(assert (=> d!111699 m!836711))

(declare-fun m!836713 () Bool)

(assert (=> d!111699 m!836713))

(declare-fun m!836715 () Bool)

(assert (=> d!111699 m!836715))

(declare-fun m!836717 () Bool)

(assert (=> d!111699 m!836717))

(declare-fun m!836719 () Bool)

(assert (=> b!900224 m!836719))

(declare-fun m!836721 () Bool)

(assert (=> b!900225 m!836721))

(assert (=> bm!39994 d!111699))

(assert (=> b!899976 d!111689))

(declare-fun d!111701 () Bool)

(assert (=> d!111701 (= (inRange!0 (index!38112 lt!406600) (mask!26208 thiss!1181)) (and (bvsge (index!38112 lt!406600) #b00000000000000000000000000000000) (bvslt (index!38112 lt!406600) (bvadd (mask!26208 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!899991 d!111701))

(assert (=> bm!39988 d!111643))

(declare-fun condMapEmpty!29230 () Bool)

(declare-fun mapDefault!29230 () ValueCell!8703)

(assert (=> mapNonEmpty!29229 (= condMapEmpty!29230 (= mapRest!29229 ((as const (Array (_ BitVec 32) ValueCell!8703)) mapDefault!29230)))))

(declare-fun e!503811 () Bool)

(declare-fun mapRes!29230 () Bool)

(assert (=> mapNonEmpty!29229 (= tp!56216 (and e!503811 mapRes!29230))))

(declare-fun mapIsEmpty!29230 () Bool)

(assert (=> mapIsEmpty!29230 mapRes!29230))

(declare-fun b!900227 () Bool)

(assert (=> b!900227 (= e!503811 tp_is_empty!18369)))

(declare-fun b!900226 () Bool)

(declare-fun e!503810 () Bool)

(assert (=> b!900226 (= e!503810 tp_is_empty!18369)))

(declare-fun mapNonEmpty!29230 () Bool)

(declare-fun tp!56217 () Bool)

(assert (=> mapNonEmpty!29230 (= mapRes!29230 (and tp!56217 e!503810))))

(declare-fun mapValue!29230 () ValueCell!8703)

(declare-fun mapKey!29230 () (_ BitVec 32))

(declare-fun mapRest!29230 () (Array (_ BitVec 32) ValueCell!8703))

(assert (=> mapNonEmpty!29230 (= mapRest!29229 (store mapRest!29230 mapKey!29230 mapValue!29230))))

(assert (= (and mapNonEmpty!29229 condMapEmpty!29230) mapIsEmpty!29230))

(assert (= (and mapNonEmpty!29229 (not condMapEmpty!29230)) mapNonEmpty!29230))

(assert (= (and mapNonEmpty!29230 ((_ is ValueCellFull!8703) mapValue!29230)) b!900226))

(assert (= (and mapNonEmpty!29229 ((_ is ValueCellFull!8703) mapDefault!29230)) b!900227))

(declare-fun m!836723 () Bool)

(assert (=> mapNonEmpty!29230 m!836723))

(declare-fun b_lambda!13011 () Bool)

(assert (= b_lambda!13009 (or (and b!899875 b_free!16041) b_lambda!13011)))

(declare-fun b_lambda!13013 () Bool)

(assert (= b_lambda!13007 (or (and b!899875 b_free!16041) b_lambda!13013)))

(check-sat (not b!900113) (not b!900066) (not d!111631) (not b!900135) (not d!111625) (not b!900132) (not b!900045) (not b!900111) tp_is_empty!18369 (not d!111659) (not d!111699) (not b!900056) (not b_next!16041) (not d!111649) (not d!111693) (not b!900150) (not b!900029) (not b!900120) (not d!111675) (not b!900119) (not d!111627) (not b!900225) (not b!900054) (not d!111621) (not d!111637) (not d!111647) (not b!900224) (not d!111619) b_and!26363 (not b!900148) (not b!900065) (not b!900112) (not b!900098) (not b_lambda!13011) (not b!900218) (not b!900099) (not bm!40006) (not b!900190) (not b!900108) (not b!900193) (not b!900149) (not b!900067) (not d!111635) (not d!111645) (not b!900110) (not bm!40003) (not b!900189) (not b!900114) (not b!900053) (not d!111673) (not b!900176) (not b!900191) (not d!111687) (not bm!40000) (not d!111661) (not d!111669) (not d!111681) (not b!900175) (not b!900105) (not b!900131) (not b!900133) (not d!111633) (not mapNonEmpty!29230) (not d!111655) (not b!900096) (not b!900104) (not d!111651) (not b_lambda!13013) (not d!111663) (not b!900153) (not b!900102) (not b!900097) (not d!111639) (not b!900100) (not d!111697) (not b!900068) (not d!111657) (not b_lambda!13005) (not d!111641) (not d!111679) (not b!900164) (not bm!39997) (not b!900223) (not b!900221) (not d!111653) (not d!111629) (not d!111643) (not d!111685))
(check-sat b_and!26363 (not b_next!16041))
