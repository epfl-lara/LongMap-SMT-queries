; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76480 () Bool)

(assert start!76480)

(declare-fun b!896496 () Bool)

(declare-fun b_free!15913 () Bool)

(declare-fun b_next!15913 () Bool)

(assert (=> b!896496 (= b_free!15913 (not b_next!15913))))

(declare-fun tp!55752 () Bool)

(declare-fun b_and!26215 () Bool)

(assert (=> b!896496 (= tp!55752 b_and!26215)))

(declare-fun b!896491 () Bool)

(declare-fun res!606121 () Bool)

(declare-fun e!500998 () Bool)

(assert (=> b!896491 (=> (not res!606121) (not e!500998))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!896491 (= res!606121 (not (= key!785 (bvneg key!785))))))

(declare-fun b!896492 () Bool)

(declare-fun e!501001 () Bool)

(declare-datatypes ((array!52525 0))(
  ( (array!52526 (arr!25252 (Array (_ BitVec 32) (_ BitVec 64))) (size!25703 (_ BitVec 32))) )
))
(declare-datatypes ((V!29287 0))(
  ( (V!29288 (val!9171 Int)) )
))
(declare-datatypes ((ValueCell!8639 0))(
  ( (ValueCellFull!8639 (v!11658 V!29287)) (EmptyCell!8639) )
))
(declare-datatypes ((array!52527 0))(
  ( (array!52528 (arr!25253 (Array (_ BitVec 32) ValueCell!8639)) (size!25704 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4294 0))(
  ( (LongMapFixedSize!4295 (defaultEntry!5359 Int) (mask!26006 (_ BitVec 32)) (extraKeys!5055 (_ BitVec 32)) (zeroValue!5159 V!29287) (minValue!5159 V!29287) (_size!2202 (_ BitVec 32)) (_keys!10104 array!52525) (_values!5346 array!52527) (_vacant!2202 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4294)

(declare-datatypes ((List!17766 0))(
  ( (Nil!17763) (Cons!17762 (h!18905 (_ BitVec 64)) (t!25097 List!17766)) )
))
(declare-fun arrayNoDuplicates!0 (array!52525 (_ BitVec 32) List!17766) Bool)

(assert (=> b!896492 (= e!501001 (not (arrayNoDuplicates!0 (_keys!10104 thiss!1181) #b00000000000000000000000000000000 Nil!17763)))))

(declare-fun b!896493 () Bool)

(declare-fun res!606120 () Bool)

(assert (=> b!896493 (=> (not res!606120) (not e!501001))))

(assert (=> b!896493 (= res!606120 (and (= (size!25704 (_values!5346 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26006 thiss!1181))) (= (size!25703 (_keys!10104 thiss!1181)) (size!25704 (_values!5346 thiss!1181))) (bvsge (mask!26006 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5055 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5055 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28960 () Bool)

(declare-fun mapRes!28960 () Bool)

(declare-fun tp!55753 () Bool)

(declare-fun e!501002 () Bool)

(assert (=> mapNonEmpty!28960 (= mapRes!28960 (and tp!55753 e!501002))))

(declare-fun mapValue!28960 () ValueCell!8639)

(declare-fun mapKey!28960 () (_ BitVec 32))

(declare-fun mapRest!28960 () (Array (_ BitVec 32) ValueCell!8639))

(assert (=> mapNonEmpty!28960 (= (arr!25253 (_values!5346 thiss!1181)) (store mapRest!28960 mapKey!28960 mapValue!28960))))

(declare-fun b!896494 () Bool)

(declare-fun res!606119 () Bool)

(assert (=> b!896494 (=> (not res!606119) (not e!501001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52525 (_ BitVec 32)) Bool)

(assert (=> b!896494 (= res!606119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10104 thiss!1181) (mask!26006 thiss!1181)))))

(declare-fun b!896495 () Bool)

(declare-fun e!500997 () Bool)

(declare-fun tp_is_empty!18241 () Bool)

(assert (=> b!896495 (= e!500997 tp_is_empty!18241)))

(declare-fun e!501000 () Bool)

(declare-fun e!500996 () Bool)

(declare-fun array_inv!19872 (array!52525) Bool)

(declare-fun array_inv!19873 (array!52527) Bool)

(assert (=> b!896496 (= e!501000 (and tp!55752 tp_is_empty!18241 (array_inv!19872 (_keys!10104 thiss!1181)) (array_inv!19873 (_values!5346 thiss!1181)) e!500996))))

(declare-fun b!896497 () Bool)

(assert (=> b!896497 (= e!500996 (and e!500997 mapRes!28960))))

(declare-fun condMapEmpty!28960 () Bool)

(declare-fun mapDefault!28960 () ValueCell!8639)

(assert (=> b!896497 (= condMapEmpty!28960 (= (arr!25253 (_values!5346 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8639)) mapDefault!28960)))))

(declare-fun res!606117 () Bool)

(assert (=> start!76480 (=> (not res!606117) (not e!500998))))

(declare-fun valid!1669 (LongMapFixedSize!4294) Bool)

(assert (=> start!76480 (= res!606117 (valid!1669 thiss!1181))))

(assert (=> start!76480 e!500998))

(assert (=> start!76480 e!501000))

(assert (=> start!76480 true))

(declare-fun mapIsEmpty!28960 () Bool)

(assert (=> mapIsEmpty!28960 mapRes!28960))

(declare-fun b!896498 () Bool)

(assert (=> b!896498 (= e!501002 tp_is_empty!18241)))

(declare-fun b!896499 () Bool)

(assert (=> b!896499 (= e!500998 e!501001)))

(declare-fun res!606118 () Bool)

(assert (=> b!896499 (=> (not res!606118) (not e!501001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!896499 (= res!606118 (validMask!0 (mask!26006 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8835 0))(
  ( (MissingZero!8835 (index!37711 (_ BitVec 32))) (Found!8835 (index!37712 (_ BitVec 32))) (Intermediate!8835 (undefined!9647 Bool) (index!37713 (_ BitVec 32)) (x!76177 (_ BitVec 32))) (Undefined!8835) (MissingVacant!8835 (index!37714 (_ BitVec 32))) )
))
(declare-fun lt!404924 () SeekEntryResult!8835)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52525 (_ BitVec 32)) SeekEntryResult!8835)

(assert (=> b!896499 (= lt!404924 (seekEntry!0 key!785 (_keys!10104 thiss!1181) (mask!26006 thiss!1181)))))

(assert (= (and start!76480 res!606117) b!896491))

(assert (= (and b!896491 res!606121) b!896499))

(assert (= (and b!896499 res!606118) b!896493))

(assert (= (and b!896493 res!606120) b!896494))

(assert (= (and b!896494 res!606119) b!896492))

(assert (= (and b!896497 condMapEmpty!28960) mapIsEmpty!28960))

(assert (= (and b!896497 (not condMapEmpty!28960)) mapNonEmpty!28960))

(get-info :version)

(assert (= (and mapNonEmpty!28960 ((_ is ValueCellFull!8639) mapValue!28960)) b!896498))

(assert (= (and b!896497 ((_ is ValueCellFull!8639) mapDefault!28960)) b!896495))

(assert (= b!896496 b!896497))

(assert (= start!76480 b!896496))

(declare-fun m!834395 () Bool)

(assert (=> b!896492 m!834395))

(declare-fun m!834397 () Bool)

(assert (=> b!896499 m!834397))

(declare-fun m!834399 () Bool)

(assert (=> b!896499 m!834399))

(declare-fun m!834401 () Bool)

(assert (=> b!896496 m!834401))

(declare-fun m!834403 () Bool)

(assert (=> b!896496 m!834403))

(declare-fun m!834405 () Bool)

(assert (=> b!896494 m!834405))

(declare-fun m!834407 () Bool)

(assert (=> start!76480 m!834407))

(declare-fun m!834409 () Bool)

(assert (=> mapNonEmpty!28960 m!834409))

(check-sat (not start!76480) b_and!26215 tp_is_empty!18241 (not b!896494) (not b_next!15913) (not b!896492) (not b!896496) (not b!896499) (not mapNonEmpty!28960))
(check-sat b_and!26215 (not b_next!15913))
(get-model)

(declare-fun d!111119 () Bool)

(assert (=> d!111119 (= (validMask!0 (mask!26006 thiss!1181)) (and (or (= (mask!26006 thiss!1181) #b00000000000000000000000000000111) (= (mask!26006 thiss!1181) #b00000000000000000000000000001111) (= (mask!26006 thiss!1181) #b00000000000000000000000000011111) (= (mask!26006 thiss!1181) #b00000000000000000000000000111111) (= (mask!26006 thiss!1181) #b00000000000000000000000001111111) (= (mask!26006 thiss!1181) #b00000000000000000000000011111111) (= (mask!26006 thiss!1181) #b00000000000000000000000111111111) (= (mask!26006 thiss!1181) #b00000000000000000000001111111111) (= (mask!26006 thiss!1181) #b00000000000000000000011111111111) (= (mask!26006 thiss!1181) #b00000000000000000000111111111111) (= (mask!26006 thiss!1181) #b00000000000000000001111111111111) (= (mask!26006 thiss!1181) #b00000000000000000011111111111111) (= (mask!26006 thiss!1181) #b00000000000000000111111111111111) (= (mask!26006 thiss!1181) #b00000000000000001111111111111111) (= (mask!26006 thiss!1181) #b00000000000000011111111111111111) (= (mask!26006 thiss!1181) #b00000000000000111111111111111111) (= (mask!26006 thiss!1181) #b00000000000001111111111111111111) (= (mask!26006 thiss!1181) #b00000000000011111111111111111111) (= (mask!26006 thiss!1181) #b00000000000111111111111111111111) (= (mask!26006 thiss!1181) #b00000000001111111111111111111111) (= (mask!26006 thiss!1181) #b00000000011111111111111111111111) (= (mask!26006 thiss!1181) #b00000000111111111111111111111111) (= (mask!26006 thiss!1181) #b00000001111111111111111111111111) (= (mask!26006 thiss!1181) #b00000011111111111111111111111111) (= (mask!26006 thiss!1181) #b00000111111111111111111111111111) (= (mask!26006 thiss!1181) #b00001111111111111111111111111111) (= (mask!26006 thiss!1181) #b00011111111111111111111111111111) (= (mask!26006 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26006 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!896499 d!111119))

(declare-fun b!896566 () Bool)

(declare-fun e!501051 () SeekEntryResult!8835)

(declare-fun lt!404940 () SeekEntryResult!8835)

(assert (=> b!896566 (= e!501051 (ite ((_ is MissingVacant!8835) lt!404940) (MissingZero!8835 (index!37714 lt!404940)) lt!404940))))

(declare-fun lt!404939 () SeekEntryResult!8835)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52525 (_ BitVec 32)) SeekEntryResult!8835)

(assert (=> b!896566 (= lt!404940 (seekKeyOrZeroReturnVacant!0 (x!76177 lt!404939) (index!37713 lt!404939) (index!37713 lt!404939) key!785 (_keys!10104 thiss!1181) (mask!26006 thiss!1181)))))

(declare-fun b!896567 () Bool)

(declare-fun c!94875 () Bool)

(declare-fun lt!404941 () (_ BitVec 64))

(assert (=> b!896567 (= c!94875 (= lt!404941 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501053 () SeekEntryResult!8835)

(assert (=> b!896567 (= e!501053 e!501051)))

(declare-fun b!896568 () Bool)

(assert (=> b!896568 (= e!501051 (MissingZero!8835 (index!37713 lt!404939)))))

(declare-fun d!111121 () Bool)

(declare-fun lt!404942 () SeekEntryResult!8835)

(assert (=> d!111121 (and (or ((_ is MissingVacant!8835) lt!404942) (not ((_ is Found!8835) lt!404942)) (and (bvsge (index!37712 lt!404942) #b00000000000000000000000000000000) (bvslt (index!37712 lt!404942) (size!25703 (_keys!10104 thiss!1181))))) (not ((_ is MissingVacant!8835) lt!404942)) (or (not ((_ is Found!8835) lt!404942)) (= (select (arr!25252 (_keys!10104 thiss!1181)) (index!37712 lt!404942)) key!785)))))

(declare-fun e!501052 () SeekEntryResult!8835)

(assert (=> d!111121 (= lt!404942 e!501052)))

(declare-fun c!94876 () Bool)

(assert (=> d!111121 (= c!94876 (and ((_ is Intermediate!8835) lt!404939) (undefined!9647 lt!404939)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52525 (_ BitVec 32)) SeekEntryResult!8835)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111121 (= lt!404939 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26006 thiss!1181)) key!785 (_keys!10104 thiss!1181) (mask!26006 thiss!1181)))))

(assert (=> d!111121 (validMask!0 (mask!26006 thiss!1181))))

(assert (=> d!111121 (= (seekEntry!0 key!785 (_keys!10104 thiss!1181) (mask!26006 thiss!1181)) lt!404942)))

(declare-fun b!896569 () Bool)

(assert (=> b!896569 (= e!501052 Undefined!8835)))

(declare-fun b!896570 () Bool)

(assert (=> b!896570 (= e!501052 e!501053)))

(assert (=> b!896570 (= lt!404941 (select (arr!25252 (_keys!10104 thiss!1181)) (index!37713 lt!404939)))))

(declare-fun c!94877 () Bool)

(assert (=> b!896570 (= c!94877 (= lt!404941 key!785))))

(declare-fun b!896571 () Bool)

(assert (=> b!896571 (= e!501053 (Found!8835 (index!37713 lt!404939)))))

(assert (= (and d!111121 c!94876) b!896569))

(assert (= (and d!111121 (not c!94876)) b!896570))

(assert (= (and b!896570 c!94877) b!896571))

(assert (= (and b!896570 (not c!94877)) b!896567))

(assert (= (and b!896567 c!94875) b!896568))

(assert (= (and b!896567 (not c!94875)) b!896566))

(declare-fun m!834443 () Bool)

(assert (=> b!896566 m!834443))

(declare-fun m!834445 () Bool)

(assert (=> d!111121 m!834445))

(declare-fun m!834447 () Bool)

(assert (=> d!111121 m!834447))

(assert (=> d!111121 m!834447))

(declare-fun m!834449 () Bool)

(assert (=> d!111121 m!834449))

(assert (=> d!111121 m!834397))

(declare-fun m!834451 () Bool)

(assert (=> b!896570 m!834451))

(assert (=> b!896499 d!111121))

(declare-fun b!896580 () Bool)

(declare-fun e!501060 () Bool)

(declare-fun e!501061 () Bool)

(assert (=> b!896580 (= e!501060 e!501061)))

(declare-fun c!94880 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!896580 (= c!94880 (validKeyInArray!0 (select (arr!25252 (_keys!10104 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39802 () Bool)

(declare-fun call!39805 () Bool)

(assert (=> bm!39802 (= call!39805 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10104 thiss!1181) (mask!26006 thiss!1181)))))

(declare-fun b!896581 () Bool)

(declare-fun e!501062 () Bool)

(assert (=> b!896581 (= e!501062 call!39805)))

(declare-fun b!896582 () Bool)

(assert (=> b!896582 (= e!501061 call!39805)))

(declare-fun b!896583 () Bool)

(assert (=> b!896583 (= e!501061 e!501062)))

(declare-fun lt!404949 () (_ BitVec 64))

(assert (=> b!896583 (= lt!404949 (select (arr!25252 (_keys!10104 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30450 0))(
  ( (Unit!30451) )
))
(declare-fun lt!404950 () Unit!30450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52525 (_ BitVec 64) (_ BitVec 32)) Unit!30450)

(assert (=> b!896583 (= lt!404950 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10104 thiss!1181) lt!404949 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896583 (arrayContainsKey!0 (_keys!10104 thiss!1181) lt!404949 #b00000000000000000000000000000000)))

(declare-fun lt!404951 () Unit!30450)

(assert (=> b!896583 (= lt!404951 lt!404950)))

(declare-fun res!606156 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52525 (_ BitVec 32)) SeekEntryResult!8835)

(assert (=> b!896583 (= res!606156 (= (seekEntryOrOpen!0 (select (arr!25252 (_keys!10104 thiss!1181)) #b00000000000000000000000000000000) (_keys!10104 thiss!1181) (mask!26006 thiss!1181)) (Found!8835 #b00000000000000000000000000000000)))))

(assert (=> b!896583 (=> (not res!606156) (not e!501062))))

(declare-fun d!111123 () Bool)

(declare-fun res!606157 () Bool)

(assert (=> d!111123 (=> res!606157 e!501060)))

(assert (=> d!111123 (= res!606157 (bvsge #b00000000000000000000000000000000 (size!25703 (_keys!10104 thiss!1181))))))

(assert (=> d!111123 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10104 thiss!1181) (mask!26006 thiss!1181)) e!501060)))

(assert (= (and d!111123 (not res!606157)) b!896580))

(assert (= (and b!896580 c!94880) b!896583))

(assert (= (and b!896580 (not c!94880)) b!896582))

(assert (= (and b!896583 res!606156) b!896581))

(assert (= (or b!896581 b!896582) bm!39802))

(declare-fun m!834453 () Bool)

(assert (=> b!896580 m!834453))

(assert (=> b!896580 m!834453))

(declare-fun m!834455 () Bool)

(assert (=> b!896580 m!834455))

(declare-fun m!834457 () Bool)

(assert (=> bm!39802 m!834457))

(assert (=> b!896583 m!834453))

(declare-fun m!834459 () Bool)

(assert (=> b!896583 m!834459))

(declare-fun m!834461 () Bool)

(assert (=> b!896583 m!834461))

(assert (=> b!896583 m!834453))

(declare-fun m!834463 () Bool)

(assert (=> b!896583 m!834463))

(assert (=> b!896494 d!111123))

(declare-fun b!896594 () Bool)

(declare-fun e!501073 () Bool)

(declare-fun e!501071 () Bool)

(assert (=> b!896594 (= e!501073 e!501071)))

(declare-fun c!94883 () Bool)

(assert (=> b!896594 (= c!94883 (validKeyInArray!0 (select (arr!25252 (_keys!10104 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111125 () Bool)

(declare-fun res!606165 () Bool)

(declare-fun e!501074 () Bool)

(assert (=> d!111125 (=> res!606165 e!501074)))

(assert (=> d!111125 (= res!606165 (bvsge #b00000000000000000000000000000000 (size!25703 (_keys!10104 thiss!1181))))))

(assert (=> d!111125 (= (arrayNoDuplicates!0 (_keys!10104 thiss!1181) #b00000000000000000000000000000000 Nil!17763) e!501074)))

(declare-fun b!896595 () Bool)

(declare-fun call!39808 () Bool)

(assert (=> b!896595 (= e!501071 call!39808)))

(declare-fun b!896596 () Bool)

(assert (=> b!896596 (= e!501071 call!39808)))

(declare-fun b!896597 () Bool)

(assert (=> b!896597 (= e!501074 e!501073)))

(declare-fun res!606166 () Bool)

(assert (=> b!896597 (=> (not res!606166) (not e!501073))))

(declare-fun e!501072 () Bool)

(assert (=> b!896597 (= res!606166 (not e!501072))))

(declare-fun res!606164 () Bool)

(assert (=> b!896597 (=> (not res!606164) (not e!501072))))

(assert (=> b!896597 (= res!606164 (validKeyInArray!0 (select (arr!25252 (_keys!10104 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39805 () Bool)

(assert (=> bm!39805 (= call!39808 (arrayNoDuplicates!0 (_keys!10104 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94883 (Cons!17762 (select (arr!25252 (_keys!10104 thiss!1181)) #b00000000000000000000000000000000) Nil!17763) Nil!17763)))))

(declare-fun b!896598 () Bool)

(declare-fun contains!4369 (List!17766 (_ BitVec 64)) Bool)

(assert (=> b!896598 (= e!501072 (contains!4369 Nil!17763 (select (arr!25252 (_keys!10104 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111125 (not res!606165)) b!896597))

(assert (= (and b!896597 res!606164) b!896598))

(assert (= (and b!896597 res!606166) b!896594))

(assert (= (and b!896594 c!94883) b!896596))

(assert (= (and b!896594 (not c!94883)) b!896595))

(assert (= (or b!896596 b!896595) bm!39805))

(assert (=> b!896594 m!834453))

(assert (=> b!896594 m!834453))

(assert (=> b!896594 m!834455))

(assert (=> b!896597 m!834453))

(assert (=> b!896597 m!834453))

(assert (=> b!896597 m!834455))

(assert (=> bm!39805 m!834453))

(declare-fun m!834465 () Bool)

(assert (=> bm!39805 m!834465))

(assert (=> b!896598 m!834453))

(assert (=> b!896598 m!834453))

(declare-fun m!834467 () Bool)

(assert (=> b!896598 m!834467))

(assert (=> b!896492 d!111125))

(declare-fun d!111127 () Bool)

(assert (=> d!111127 (= (array_inv!19872 (_keys!10104 thiss!1181)) (bvsge (size!25703 (_keys!10104 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896496 d!111127))

(declare-fun d!111129 () Bool)

(assert (=> d!111129 (= (array_inv!19873 (_values!5346 thiss!1181)) (bvsge (size!25704 (_values!5346 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896496 d!111129))

(declare-fun d!111131 () Bool)

(declare-fun res!606173 () Bool)

(declare-fun e!501077 () Bool)

(assert (=> d!111131 (=> (not res!606173) (not e!501077))))

(declare-fun simpleValid!307 (LongMapFixedSize!4294) Bool)

(assert (=> d!111131 (= res!606173 (simpleValid!307 thiss!1181))))

(assert (=> d!111131 (= (valid!1669 thiss!1181) e!501077)))

(declare-fun b!896605 () Bool)

(declare-fun res!606174 () Bool)

(assert (=> b!896605 (=> (not res!606174) (not e!501077))))

(declare-fun arrayCountValidKeys!0 (array!52525 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896605 (= res!606174 (= (arrayCountValidKeys!0 (_keys!10104 thiss!1181) #b00000000000000000000000000000000 (size!25703 (_keys!10104 thiss!1181))) (_size!2202 thiss!1181)))))

(declare-fun b!896606 () Bool)

(declare-fun res!606175 () Bool)

(assert (=> b!896606 (=> (not res!606175) (not e!501077))))

(assert (=> b!896606 (= res!606175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10104 thiss!1181) (mask!26006 thiss!1181)))))

(declare-fun b!896607 () Bool)

(assert (=> b!896607 (= e!501077 (arrayNoDuplicates!0 (_keys!10104 thiss!1181) #b00000000000000000000000000000000 Nil!17763))))

(assert (= (and d!111131 res!606173) b!896605))

(assert (= (and b!896605 res!606174) b!896606))

(assert (= (and b!896606 res!606175) b!896607))

(declare-fun m!834469 () Bool)

(assert (=> d!111131 m!834469))

(declare-fun m!834471 () Bool)

(assert (=> b!896605 m!834471))

(assert (=> b!896606 m!834405))

(assert (=> b!896607 m!834395))

(assert (=> start!76480 d!111131))

(declare-fun b!896614 () Bool)

(declare-fun e!501082 () Bool)

(assert (=> b!896614 (= e!501082 tp_is_empty!18241)))

(declare-fun mapIsEmpty!28969 () Bool)

(declare-fun mapRes!28969 () Bool)

(assert (=> mapIsEmpty!28969 mapRes!28969))

(declare-fun b!896615 () Bool)

(declare-fun e!501083 () Bool)

(assert (=> b!896615 (= e!501083 tp_is_empty!18241)))

(declare-fun condMapEmpty!28969 () Bool)

(declare-fun mapDefault!28969 () ValueCell!8639)

(assert (=> mapNonEmpty!28960 (= condMapEmpty!28969 (= mapRest!28960 ((as const (Array (_ BitVec 32) ValueCell!8639)) mapDefault!28969)))))

(assert (=> mapNonEmpty!28960 (= tp!55753 (and e!501083 mapRes!28969))))

(declare-fun mapNonEmpty!28969 () Bool)

(declare-fun tp!55768 () Bool)

(assert (=> mapNonEmpty!28969 (= mapRes!28969 (and tp!55768 e!501082))))

(declare-fun mapValue!28969 () ValueCell!8639)

(declare-fun mapKey!28969 () (_ BitVec 32))

(declare-fun mapRest!28969 () (Array (_ BitVec 32) ValueCell!8639))

(assert (=> mapNonEmpty!28969 (= mapRest!28960 (store mapRest!28969 mapKey!28969 mapValue!28969))))

(assert (= (and mapNonEmpty!28960 condMapEmpty!28969) mapIsEmpty!28969))

(assert (= (and mapNonEmpty!28960 (not condMapEmpty!28969)) mapNonEmpty!28969))

(assert (= (and mapNonEmpty!28969 ((_ is ValueCellFull!8639) mapValue!28969)) b!896614))

(assert (= (and mapNonEmpty!28960 ((_ is ValueCellFull!8639) mapDefault!28969)) b!896615))

(declare-fun m!834473 () Bool)

(assert (=> mapNonEmpty!28969 m!834473))

(check-sat (not bm!39802) (not b!896606) b_and!26215 (not b!896594) tp_is_empty!18241 (not b!896598) (not b!896580) (not b!896597) (not b!896607) (not b!896605) (not d!111121) (not d!111131) (not b!896566) (not b_next!15913) (not bm!39805) (not b!896583) (not mapNonEmpty!28969))
(check-sat b_and!26215 (not b_next!15913))
