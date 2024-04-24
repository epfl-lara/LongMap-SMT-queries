; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21956 () Bool)

(assert start!21956)

(declare-fun b!224443 () Bool)

(declare-fun b_free!6019 () Bool)

(declare-fun b_next!6019 () Bool)

(assert (=> b!224443 (= b_free!6019 (not b_next!6019))))

(declare-fun tp!21198 () Bool)

(declare-fun b_and!12931 () Bool)

(assert (=> b!224443 (= tp!21198 b_and!12931)))

(declare-fun b!224420 () Bool)

(declare-fun res!110412 () Bool)

(declare-fun e!145696 () Bool)

(assert (=> b!224420 (=> (not res!110412) (not e!145696))))

(declare-datatypes ((List!3242 0))(
  ( (Nil!3239) (Cons!3238 (h!3886 (_ BitVec 64)) (t!8193 List!3242)) )
))
(declare-fun contains!1528 (List!3242 (_ BitVec 64)) Bool)

(assert (=> b!224420 (= res!110412 (not (contains!1528 Nil!3239 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!224421 () Bool)

(declare-fun e!145700 () Bool)

(declare-fun tp_is_empty!5881 () Bool)

(assert (=> b!224421 (= e!145700 tp_is_empty!5881)))

(declare-fun b!224423 () Bool)

(declare-datatypes ((Unit!6713 0))(
  ( (Unit!6714) )
))
(declare-fun e!145701 () Unit!6713)

(declare-fun Unit!6715 () Unit!6713)

(assert (=> b!224423 (= e!145701 Unit!6715)))

(declare-fun lt!113199 () Unit!6713)

(declare-datatypes ((V!7489 0))(
  ( (V!7490 (val!2985 Int)) )
))
(declare-datatypes ((ValueCell!2597 0))(
  ( (ValueCellFull!2597 (v!5006 V!7489)) (EmptyCell!2597) )
))
(declare-datatypes ((array!11003 0))(
  ( (array!11004 (arr!5221 (Array (_ BitVec 32) ValueCell!2597)) (size!5554 (_ BitVec 32))) )
))
(declare-datatypes ((array!11005 0))(
  ( (array!11006 (arr!5222 (Array (_ BitVec 32) (_ BitVec 64))) (size!5555 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3094 0))(
  ( (LongMapFixedSize!3095 (defaultEntry!4206 Int) (mask!10040 (_ BitVec 32)) (extraKeys!3943 (_ BitVec 32)) (zeroValue!4047 V!7489) (minValue!4047 V!7489) (_size!1596 (_ BitVec 32)) (_keys!6260 array!11005) (_values!4189 array!11003) (_vacant!1596 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3094)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!236 (array!11005 array!11003 (_ BitVec 32) (_ BitVec 32) V!7489 V!7489 (_ BitVec 64) Int) Unit!6713)

(assert (=> b!224423 (= lt!113199 (lemmaInListMapThenSeekEntryOrOpenFindsIt!236 (_keys!6260 thiss!1504) (_values!4189 thiss!1504) (mask!10040 thiss!1504) (extraKeys!3943 thiss!1504) (zeroValue!4047 thiss!1504) (minValue!4047 thiss!1504) key!932 (defaultEntry!4206 thiss!1504)))))

(assert (=> b!224423 false))

(declare-fun b!224424 () Bool)

(declare-fun res!110430 () Bool)

(assert (=> b!224424 (=> (not res!110430) (not e!145696))))

(declare-fun arrayNoDuplicates!0 (array!11005 (_ BitVec 32) List!3242) Bool)

(assert (=> b!224424 (= res!110430 (arrayNoDuplicates!0 (_keys!6260 thiss!1504) #b00000000000000000000000000000000 Nil!3239))))

(declare-fun b!224425 () Bool)

(declare-fun e!145708 () Bool)

(declare-fun e!145698 () Bool)

(assert (=> b!224425 (= e!145708 e!145698)))

(declare-fun res!110413 () Bool)

(declare-fun call!20879 () Bool)

(assert (=> b!224425 (= res!110413 call!20879)))

(assert (=> b!224425 (=> (not res!110413) (not e!145698))))

(declare-fun b!224426 () Bool)

(declare-fun call!20880 () Bool)

(assert (=> b!224426 (= e!145698 (not call!20880))))

(declare-fun b!224427 () Bool)

(declare-fun e!145699 () Bool)

(assert (=> b!224427 (= e!145699 tp_is_empty!5881)))

(declare-fun b!224428 () Bool)

(assert (=> b!224428 (= e!145696 false)))

(declare-fun lt!113194 () Bool)

(assert (=> b!224428 (= lt!113194 (contains!1528 Nil!3239 key!932))))

(declare-fun b!224429 () Bool)

(declare-fun e!145695 () Bool)

(assert (=> b!224429 (= e!145695 (not call!20880))))

(declare-fun b!224430 () Bool)

(declare-fun res!110424 () Bool)

(assert (=> b!224430 (=> (not res!110424) (not e!145695))))

(assert (=> b!224430 (= res!110424 call!20879)))

(declare-fun e!145707 () Bool)

(assert (=> b!224430 (= e!145707 e!145695)))

(declare-fun b!224431 () Bool)

(declare-datatypes ((SeekEntryResult!829 0))(
  ( (MissingZero!829 (index!5486 (_ BitVec 32))) (Found!829 (index!5487 (_ BitVec 32))) (Intermediate!829 (undefined!1641 Bool) (index!5488 (_ BitVec 32)) (x!23105 (_ BitVec 32))) (Undefined!829) (MissingVacant!829 (index!5489 (_ BitVec 32))) )
))
(declare-fun lt!113193 () SeekEntryResult!829)

(get-info :version)

(assert (=> b!224431 (= e!145708 ((_ is Undefined!829) lt!113193))))

(declare-fun b!224432 () Bool)

(declare-fun res!110421 () Bool)

(assert (=> b!224432 (=> (not res!110421) (not e!145696))))

(declare-fun e!145705 () Bool)

(assert (=> b!224432 (= res!110421 e!145705)))

(declare-fun res!110419 () Bool)

(assert (=> b!224432 (=> res!110419 e!145705)))

(declare-fun e!145692 () Bool)

(assert (=> b!224432 (= res!110419 e!145692)))

(declare-fun res!110429 () Bool)

(assert (=> b!224432 (=> (not res!110429) (not e!145692))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!224432 (= res!110429 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!224433 () Bool)

(declare-fun res!110427 () Bool)

(assert (=> b!224433 (=> (not res!110427) (not e!145696))))

(assert (=> b!224433 (= res!110427 (not (contains!1528 Nil!3239 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!224434 () Bool)

(declare-fun c!37222 () Bool)

(assert (=> b!224434 (= c!37222 ((_ is MissingVacant!829) lt!113193))))

(assert (=> b!224434 (= e!145707 e!145708)))

(declare-fun b!224435 () Bool)

(declare-fun e!145697 () Bool)

(declare-fun mapRes!9991 () Bool)

(assert (=> b!224435 (= e!145697 (and e!145699 mapRes!9991))))

(declare-fun condMapEmpty!9991 () Bool)

(declare-fun mapDefault!9991 () ValueCell!2597)

(assert (=> b!224435 (= condMapEmpty!9991 (= (arr!5221 (_values!4189 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2597)) mapDefault!9991)))))

(declare-fun b!224436 () Bool)

(declare-fun res!110423 () Bool)

(assert (=> b!224436 (=> (not res!110423) (not e!145696))))

(declare-fun lt!113195 () Bool)

(assert (=> b!224436 (= res!110423 (not lt!113195))))

(declare-fun b!224437 () Bool)

(declare-fun res!110425 () Bool)

(declare-fun e!145703 () Bool)

(assert (=> b!224437 (=> (not res!110425) (not e!145703))))

(assert (=> b!224437 (= res!110425 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!224438 () Bool)

(declare-fun e!145702 () Unit!6713)

(declare-fun Unit!6716 () Unit!6713)

(assert (=> b!224438 (= e!145702 Unit!6716)))

(declare-fun lt!113198 () Unit!6713)

(declare-fun lemmaArrayContainsKeyThenInListMap!73 (array!11005 array!11003 (_ BitVec 32) (_ BitVec 32) V!7489 V!7489 (_ BitVec 64) (_ BitVec 32) Int) Unit!6713)

(assert (=> b!224438 (= lt!113198 (lemmaArrayContainsKeyThenInListMap!73 (_keys!6260 thiss!1504) (_values!4189 thiss!1504) (mask!10040 thiss!1504) (extraKeys!3943 thiss!1504) (zeroValue!4047 thiss!1504) (minValue!4047 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4206 thiss!1504)))))

(assert (=> b!224438 false))

(declare-fun b!224439 () Bool)

(declare-fun e!145704 () Bool)

(assert (=> b!224439 (= e!145705 e!145704)))

(declare-fun res!110420 () Bool)

(assert (=> b!224439 (=> (not res!110420) (not e!145704))))

(assert (=> b!224439 (= res!110420 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!224440 () Bool)

(declare-fun e!145709 () Bool)

(declare-fun e!145693 () Bool)

(assert (=> b!224440 (= e!145709 e!145693)))

(declare-fun res!110426 () Bool)

(assert (=> b!224440 (=> (not res!110426) (not e!145693))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224440 (= res!110426 (inRange!0 index!297 (mask!10040 thiss!1504)))))

(declare-fun lt!113197 () Unit!6713)

(assert (=> b!224440 (= lt!113197 e!145701)))

(declare-fun c!37224 () Bool)

(declare-datatypes ((tuple2!4338 0))(
  ( (tuple2!4339 (_1!2180 (_ BitVec 64)) (_2!2180 V!7489)) )
))
(declare-datatypes ((List!3243 0))(
  ( (Nil!3240) (Cons!3239 (h!3887 tuple2!4338) (t!8194 List!3243)) )
))
(declare-datatypes ((ListLongMap!3253 0))(
  ( (ListLongMap!3254 (toList!1642 List!3243)) )
))
(declare-fun contains!1529 (ListLongMap!3253 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1174 (array!11005 array!11003 (_ BitVec 32) (_ BitVec 32) V!7489 V!7489 (_ BitVec 32) Int) ListLongMap!3253)

(assert (=> b!224440 (= c!37224 (contains!1529 (getCurrentListMap!1174 (_keys!6260 thiss!1504) (_values!4189 thiss!1504) (mask!10040 thiss!1504) (extraKeys!3943 thiss!1504) (zeroValue!4047 thiss!1504) (minValue!4047 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4206 thiss!1504)) key!932))))

(declare-fun bm!20876 () Bool)

(declare-fun arrayContainsKey!0 (array!11005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20876 (= call!20880 (arrayContainsKey!0 (_keys!6260 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!9991 () Bool)

(declare-fun tp!21199 () Bool)

(assert (=> mapNonEmpty!9991 (= mapRes!9991 (and tp!21199 e!145700))))

(declare-fun mapRest!9991 () (Array (_ BitVec 32) ValueCell!2597))

(declare-fun mapValue!9991 () ValueCell!2597)

(declare-fun mapKey!9991 () (_ BitVec 32))

(assert (=> mapNonEmpty!9991 (= (arr!5221 (_values!4189 thiss!1504)) (store mapRest!9991 mapKey!9991 mapValue!9991))))

(declare-fun b!224441 () Bool)

(assert (=> b!224441 (= e!145692 (contains!1528 Nil!3239 key!932))))

(declare-fun b!224442 () Bool)

(declare-fun lt!113196 () Unit!6713)

(assert (=> b!224442 (= e!145701 lt!113196)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!227 (array!11005 array!11003 (_ BitVec 32) (_ BitVec 32) V!7489 V!7489 (_ BitVec 64) Int) Unit!6713)

(assert (=> b!224442 (= lt!113196 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!227 (_keys!6260 thiss!1504) (_values!4189 thiss!1504) (mask!10040 thiss!1504) (extraKeys!3943 thiss!1504) (zeroValue!4047 thiss!1504) (minValue!4047 thiss!1504) key!932 (defaultEntry!4206 thiss!1504)))))

(declare-fun c!37225 () Bool)

(assert (=> b!224442 (= c!37225 ((_ is MissingZero!829) lt!113193))))

(assert (=> b!224442 e!145707))

(declare-fun res!110431 () Bool)

(assert (=> start!21956 (=> (not res!110431) (not e!145703))))

(declare-fun valid!1253 (LongMapFixedSize!3094) Bool)

(assert (=> start!21956 (= res!110431 (valid!1253 thiss!1504))))

(assert (=> start!21956 e!145703))

(declare-fun e!145706 () Bool)

(assert (=> start!21956 e!145706))

(assert (=> start!21956 true))

(declare-fun b!224422 () Bool)

(declare-fun res!110416 () Bool)

(assert (=> b!224422 (= res!110416 (= (select (arr!5222 (_keys!6260 thiss!1504)) (index!5489 lt!113193)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!224422 (=> (not res!110416) (not e!145698))))

(declare-fun bm!20877 () Bool)

(assert (=> bm!20877 (= call!20879 (inRange!0 (ite c!37225 (index!5486 lt!113193) (index!5489 lt!113193)) (mask!10040 thiss!1504)))))

(declare-fun array_inv!3431 (array!11005) Bool)

(declare-fun array_inv!3432 (array!11003) Bool)

(assert (=> b!224443 (= e!145706 (and tp!21198 tp_is_empty!5881 (array_inv!3431 (_keys!6260 thiss!1504)) (array_inv!3432 (_values!4189 thiss!1504)) e!145697))))

(declare-fun b!224444 () Bool)

(assert (=> b!224444 (= e!145703 e!145709)))

(declare-fun res!110418 () Bool)

(assert (=> b!224444 (=> (not res!110418) (not e!145709))))

(assert (=> b!224444 (= res!110418 (or (= lt!113193 (MissingZero!829 index!297)) (= lt!113193 (MissingVacant!829 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11005 (_ BitVec 32)) SeekEntryResult!829)

(assert (=> b!224444 (= lt!113193 (seekEntryOrOpen!0 key!932 (_keys!6260 thiss!1504) (mask!10040 thiss!1504)))))

(declare-fun b!224445 () Bool)

(declare-fun res!110415 () Bool)

(assert (=> b!224445 (=> (not res!110415) (not e!145696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!224445 (= res!110415 (validKeyInArray!0 key!932))))

(declare-fun b!224446 () Bool)

(declare-fun res!110422 () Bool)

(assert (=> b!224446 (=> (not res!110422) (not e!145695))))

(assert (=> b!224446 (= res!110422 (= (select (arr!5222 (_keys!6260 thiss!1504)) (index!5486 lt!113193)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!9991 () Bool)

(assert (=> mapIsEmpty!9991 mapRes!9991))

(declare-fun b!224447 () Bool)

(declare-fun res!110414 () Bool)

(assert (=> b!224447 (=> (not res!110414) (not e!145696))))

(declare-fun noDuplicate!83 (List!3242) Bool)

(assert (=> b!224447 (= res!110414 (noDuplicate!83 Nil!3239))))

(declare-fun b!224448 () Bool)

(declare-fun Unit!6717 () Unit!6713)

(assert (=> b!224448 (= e!145702 Unit!6717)))

(declare-fun b!224449 () Bool)

(assert (=> b!224449 (= e!145704 (not (contains!1528 Nil!3239 key!932)))))

(declare-fun b!224450 () Bool)

(declare-fun res!110417 () Bool)

(assert (=> b!224450 (=> (not res!110417) (not e!145696))))

(assert (=> b!224450 (= res!110417 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5555 (_keys!6260 thiss!1504)))))))

(declare-fun b!224451 () Bool)

(assert (=> b!224451 (= e!145693 e!145696)))

(declare-fun res!110428 () Bool)

(assert (=> b!224451 (=> (not res!110428) (not e!145696))))

(assert (=> b!224451 (= res!110428 (and (bvslt (size!5555 (_keys!6260 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5555 (_keys!6260 thiss!1504)))))))

(declare-fun lt!113200 () Unit!6713)

(assert (=> b!224451 (= lt!113200 e!145702)))

(declare-fun c!37223 () Bool)

(assert (=> b!224451 (= c!37223 lt!113195)))

(assert (=> b!224451 (= lt!113195 (arrayContainsKey!0 (_keys!6260 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!21956 res!110431) b!224437))

(assert (= (and b!224437 res!110425) b!224444))

(assert (= (and b!224444 res!110418) b!224440))

(assert (= (and b!224440 c!37224) b!224423))

(assert (= (and b!224440 (not c!37224)) b!224442))

(assert (= (and b!224442 c!37225) b!224430))

(assert (= (and b!224442 (not c!37225)) b!224434))

(assert (= (and b!224430 res!110424) b!224446))

(assert (= (and b!224446 res!110422) b!224429))

(assert (= (and b!224434 c!37222) b!224425))

(assert (= (and b!224434 (not c!37222)) b!224431))

(assert (= (and b!224425 res!110413) b!224422))

(assert (= (and b!224422 res!110416) b!224426))

(assert (= (or b!224430 b!224425) bm!20877))

(assert (= (or b!224429 b!224426) bm!20876))

(assert (= (and b!224440 res!110426) b!224451))

(assert (= (and b!224451 c!37223) b!224438))

(assert (= (and b!224451 (not c!37223)) b!224448))

(assert (= (and b!224451 res!110428) b!224447))

(assert (= (and b!224447 res!110414) b!224420))

(assert (= (and b!224420 res!110412) b!224433))

(assert (= (and b!224433 res!110427) b!224432))

(assert (= (and b!224432 res!110429) b!224441))

(assert (= (and b!224432 (not res!110419)) b!224439))

(assert (= (and b!224439 res!110420) b!224449))

(assert (= (and b!224432 res!110421) b!224424))

(assert (= (and b!224424 res!110430) b!224450))

(assert (= (and b!224450 res!110417) b!224445))

(assert (= (and b!224445 res!110415) b!224436))

(assert (= (and b!224436 res!110423) b!224428))

(assert (= (and b!224435 condMapEmpty!9991) mapIsEmpty!9991))

(assert (= (and b!224435 (not condMapEmpty!9991)) mapNonEmpty!9991))

(assert (= (and mapNonEmpty!9991 ((_ is ValueCellFull!2597) mapValue!9991)) b!224421))

(assert (= (and b!224435 ((_ is ValueCellFull!2597) mapDefault!9991)) b!224427))

(assert (= b!224443 b!224435))

(assert (= start!21956 b!224443))

(declare-fun m!247597 () Bool)

(assert (=> mapNonEmpty!9991 m!247597))

(declare-fun m!247599 () Bool)

(assert (=> b!224423 m!247599))

(declare-fun m!247601 () Bool)

(assert (=> b!224451 m!247601))

(declare-fun m!247603 () Bool)

(assert (=> b!224442 m!247603))

(declare-fun m!247605 () Bool)

(assert (=> b!224445 m!247605))

(declare-fun m!247607 () Bool)

(assert (=> b!224441 m!247607))

(declare-fun m!247609 () Bool)

(assert (=> b!224444 m!247609))

(declare-fun m!247611 () Bool)

(assert (=> b!224424 m!247611))

(assert (=> b!224449 m!247607))

(declare-fun m!247613 () Bool)

(assert (=> start!21956 m!247613))

(declare-fun m!247615 () Bool)

(assert (=> b!224443 m!247615))

(declare-fun m!247617 () Bool)

(assert (=> b!224443 m!247617))

(declare-fun m!247619 () Bool)

(assert (=> b!224433 m!247619))

(assert (=> bm!20876 m!247601))

(declare-fun m!247621 () Bool)

(assert (=> b!224447 m!247621))

(declare-fun m!247623 () Bool)

(assert (=> b!224446 m!247623))

(declare-fun m!247625 () Bool)

(assert (=> b!224440 m!247625))

(declare-fun m!247627 () Bool)

(assert (=> b!224440 m!247627))

(assert (=> b!224440 m!247627))

(declare-fun m!247629 () Bool)

(assert (=> b!224440 m!247629))

(declare-fun m!247631 () Bool)

(assert (=> b!224420 m!247631))

(assert (=> b!224428 m!247607))

(declare-fun m!247633 () Bool)

(assert (=> b!224422 m!247633))

(declare-fun m!247635 () Bool)

(assert (=> bm!20877 m!247635))

(declare-fun m!247637 () Bool)

(assert (=> b!224438 m!247637))

(check-sat (not b!224423) (not b!224441) (not b!224420) (not b!224438) (not mapNonEmpty!9991) (not b!224451) (not b!224447) (not bm!20877) (not b!224424) (not b!224433) (not b!224444) (not b!224440) (not b_next!6019) (not start!21956) (not bm!20876) (not b!224443) tp_is_empty!5881 (not b!224442) (not b!224445) b_and!12931 (not b!224428) (not b!224449))
(check-sat b_and!12931 (not b_next!6019))
