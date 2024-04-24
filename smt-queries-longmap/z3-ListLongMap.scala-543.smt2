; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14180 () Bool)

(assert start!14180)

(declare-fun b!131733 () Bool)

(declare-fun b_free!2905 () Bool)

(declare-fun b_next!2905 () Bool)

(assert (=> b!131733 (= b_free!2905 (not b_next!2905))))

(declare-fun tp!11153 () Bool)

(declare-fun b_and!8161 () Bool)

(assert (=> b!131733 (= tp!11153 b_and!8161)))

(declare-fun b!131735 () Bool)

(declare-fun b_free!2907 () Bool)

(declare-fun b_next!2907 () Bool)

(assert (=> b!131735 (= b_free!2907 (not b_next!2907))))

(declare-fun tp!11151 () Bool)

(declare-fun b_and!8163 () Bool)

(assert (=> b!131735 (= tp!11151 b_and!8163)))

(declare-fun b!131720 () Bool)

(declare-fun e!85889 () Bool)

(declare-fun e!85890 () Bool)

(assert (=> b!131720 (= e!85889 e!85890)))

(declare-fun b!131721 () Bool)

(declare-fun res!63448 () Bool)

(declare-fun e!85888 () Bool)

(assert (=> b!131721 (=> (not res!63448) (not e!85888))))

(declare-datatypes ((V!3473 0))(
  ( (V!3474 (val!1479 Int)) )
))
(declare-datatypes ((array!4749 0))(
  ( (array!4750 (arr!2246 (Array (_ BitVec 32) (_ BitVec 64))) (size!2514 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1091 0))(
  ( (ValueCellFull!1091 (v!3186 V!3473)) (EmptyCell!1091) )
))
(declare-datatypes ((array!4751 0))(
  ( (array!4752 (arr!2247 (Array (_ BitVec 32) ValueCell!1091)) (size!2515 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1090 0))(
  ( (LongMapFixedSize!1091 (defaultEntry!2853 Int) (mask!7147 (_ BitVec 32)) (extraKeys!2620 (_ BitVec 32)) (zeroValue!2709 V!3473) (minValue!2709 V!3473) (_size!594 (_ BitVec 32)) (_keys!4600 array!4749) (_values!2836 array!4751) (_vacant!594 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!882 0))(
  ( (Cell!883 (v!3187 LongMapFixedSize!1090)) )
))
(declare-datatypes ((LongMap!882 0))(
  ( (LongMap!883 (underlying!452 Cell!882)) )
))
(declare-fun thiss!992 () LongMap!882)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4749 (_ BitVec 32)) Bool)

(assert (=> b!131721 (= res!63448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4600 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!131722 () Bool)

(declare-fun e!85897 () Bool)

(declare-fun e!85898 () Bool)

(declare-fun mapRes!4614 () Bool)

(assert (=> b!131722 (= e!85897 (and e!85898 mapRes!4614))))

(declare-fun condMapEmpty!4613 () Bool)

(declare-fun mapDefault!4613 () ValueCell!1091)

(assert (=> b!131722 (= condMapEmpty!4613 (= (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1091)) mapDefault!4613)))))

(declare-fun b!131723 () Bool)

(declare-fun e!85885 () Bool)

(declare-fun e!85899 () Bool)

(assert (=> b!131723 (= e!85885 e!85899)))

(declare-fun res!63444 () Bool)

(assert (=> b!131723 (=> (not res!63444) (not e!85899))))

(declare-datatypes ((tuple2!2560 0))(
  ( (tuple2!2561 (_1!1291 (_ BitVec 64)) (_2!1291 V!3473)) )
))
(declare-datatypes ((List!1691 0))(
  ( (Nil!1688) (Cons!1687 (h!2292 tuple2!2560) (t!6118 List!1691)) )
))
(declare-datatypes ((ListLongMap!1651 0))(
  ( (ListLongMap!1652 (toList!841 List!1691)) )
))
(declare-fun lt!68664 () ListLongMap!1651)

(declare-fun lt!68663 () ListLongMap!1651)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!131723 (= res!63444 (and (= lt!68664 lt!68663) (not (= (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1090)

(declare-fun map!1395 (LongMapFixedSize!1090) ListLongMap!1651)

(assert (=> b!131723 (= lt!68663 (map!1395 newMap!16))))

(declare-fun getCurrentListMap!517 (array!4749 array!4751 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 32) Int) ListLongMap!1651)

(assert (=> b!131723 (= lt!68664 (getCurrentListMap!517 (_keys!4600 (v!3187 (underlying!452 thiss!992))) (_values!2836 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992))) (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) (zeroValue!2709 (v!3187 (underlying!452 thiss!992))) (minValue!2709 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2853 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!131724 () Bool)

(declare-fun res!63451 () Bool)

(assert (=> b!131724 (=> (not res!63451) (not e!85885))))

(assert (=> b!131724 (= res!63451 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7147 newMap!16)) (_size!594 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun res!63449 () Bool)

(assert (=> start!14180 (=> (not res!63449) (not e!85885))))

(declare-fun valid!539 (LongMap!882) Bool)

(assert (=> start!14180 (= res!63449 (valid!539 thiss!992))))

(assert (=> start!14180 e!85885))

(declare-fun e!85886 () Bool)

(assert (=> start!14180 e!85886))

(assert (=> start!14180 true))

(declare-fun e!85894 () Bool)

(assert (=> start!14180 e!85894))

(declare-fun b!131725 () Bool)

(declare-fun e!85895 () Bool)

(declare-fun tp_is_empty!2869 () Bool)

(assert (=> b!131725 (= e!85895 tp_is_empty!2869)))

(declare-fun b!131726 () Bool)

(declare-fun res!63450 () Bool)

(assert (=> b!131726 (=> (not res!63450) (not e!85885))))

(declare-fun valid!540 (LongMapFixedSize!1090) Bool)

(assert (=> b!131726 (= res!63450 (valid!540 newMap!16))))

(declare-fun b!131727 () Bool)

(declare-fun e!85893 () Bool)

(assert (=> b!131727 (= e!85893 tp_is_empty!2869)))

(declare-fun b!131728 () Bool)

(declare-fun res!63446 () Bool)

(assert (=> b!131728 (=> (not res!63446) (not e!85888))))

(assert (=> b!131728 (= res!63446 (and (= (size!2515 (_values!2836 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7147 (v!3187 (underlying!452 thiss!992))))) (= (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (size!2515 (_values!2836 (v!3187 (underlying!452 thiss!992))))) (bvsge (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!131729 () Bool)

(declare-fun res!63445 () Bool)

(assert (=> b!131729 (=> (not res!63445) (not e!85888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!131729 (= res!63445 (validMask!0 (mask!7147 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun mapIsEmpty!4613 () Bool)

(assert (=> mapIsEmpty!4613 mapRes!4614))

(declare-fun b!131730 () Bool)

(declare-datatypes ((List!1692 0))(
  ( (Nil!1689) (Cons!1688 (h!2293 (_ BitVec 64)) (t!6119 List!1692)) )
))
(declare-fun arrayNoDuplicates!0 (array!4749 (_ BitVec 32) List!1692) Bool)

(assert (=> b!131730 (= e!85888 (not (arrayNoDuplicates!0 (_keys!4600 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000000 Nil!1689)))))

(declare-fun b!131731 () Bool)

(declare-fun e!85887 () Bool)

(assert (=> b!131731 (= e!85887 tp_is_empty!2869)))

(declare-fun b!131732 () Bool)

(declare-fun e!85896 () Bool)

(declare-fun mapRes!4613 () Bool)

(assert (=> b!131732 (= e!85896 (and e!85893 mapRes!4613))))

(declare-fun condMapEmpty!4614 () Bool)

(declare-fun mapDefault!4614 () ValueCell!1091)

(assert (=> b!131732 (= condMapEmpty!4614 (= (arr!2247 (_values!2836 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1091)) mapDefault!4614)))))

(declare-fun array_inv!1405 (array!4749) Bool)

(declare-fun array_inv!1406 (array!4751) Bool)

(assert (=> b!131733 (= e!85890 (and tp!11153 tp_is_empty!2869 (array_inv!1405 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (array_inv!1406 (_values!2836 (v!3187 (underlying!452 thiss!992)))) e!85897))))

(declare-fun b!131734 () Bool)

(assert (=> b!131734 (= e!85899 e!85888)))

(declare-fun res!63447 () Bool)

(assert (=> b!131734 (=> (not res!63447) (not e!85888))))

(declare-fun contains!881 (ListLongMap!1651 (_ BitVec 64)) Bool)

(assert (=> b!131734 (= res!63447 (contains!881 lt!68663 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2562 0))(
  ( (tuple2!2563 (_1!1292 Bool) (_2!1292 LongMapFixedSize!1090)) )
))
(declare-fun lt!68665 () tuple2!2562)

(declare-fun update!195 (LongMapFixedSize!1090 (_ BitVec 64) V!3473) tuple2!2562)

(declare-fun get!1483 (ValueCell!1091 V!3473) V!3473)

(declare-fun dynLambda!425 (Int (_ BitVec 64)) V!3473)

(assert (=> b!131734 (= lt!68665 (update!195 newMap!16 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131735 (= e!85894 (and tp!11151 tp_is_empty!2869 (array_inv!1405 (_keys!4600 newMap!16)) (array_inv!1406 (_values!2836 newMap!16)) e!85896))))

(declare-fun mapIsEmpty!4614 () Bool)

(assert (=> mapIsEmpty!4614 mapRes!4613))

(declare-fun b!131736 () Bool)

(assert (=> b!131736 (= e!85886 e!85889)))

(declare-fun b!131737 () Bool)

(assert (=> b!131737 (= e!85898 tp_is_empty!2869)))

(declare-fun mapNonEmpty!4613 () Bool)

(declare-fun tp!11154 () Bool)

(assert (=> mapNonEmpty!4613 (= mapRes!4613 (and tp!11154 e!85895))))

(declare-fun mapKey!4614 () (_ BitVec 32))

(declare-fun mapRest!4614 () (Array (_ BitVec 32) ValueCell!1091))

(declare-fun mapValue!4614 () ValueCell!1091)

(assert (=> mapNonEmpty!4613 (= (arr!2247 (_values!2836 newMap!16)) (store mapRest!4614 mapKey!4614 mapValue!4614))))

(declare-fun b!131738 () Bool)

(declare-fun res!63452 () Bool)

(assert (=> b!131738 (=> (not res!63452) (not e!85885))))

(assert (=> b!131738 (= res!63452 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992)))))))))

(declare-fun mapNonEmpty!4614 () Bool)

(declare-fun tp!11152 () Bool)

(assert (=> mapNonEmpty!4614 (= mapRes!4614 (and tp!11152 e!85887))))

(declare-fun mapValue!4613 () ValueCell!1091)

(declare-fun mapKey!4613 () (_ BitVec 32))

(declare-fun mapRest!4613 () (Array (_ BitVec 32) ValueCell!1091))

(assert (=> mapNonEmpty!4614 (= (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) (store mapRest!4613 mapKey!4613 mapValue!4613))))

(assert (= (and start!14180 res!63449) b!131738))

(assert (= (and b!131738 res!63452) b!131726))

(assert (= (and b!131726 res!63450) b!131724))

(assert (= (and b!131724 res!63451) b!131723))

(assert (= (and b!131723 res!63444) b!131734))

(assert (= (and b!131734 res!63447) b!131729))

(assert (= (and b!131729 res!63445) b!131728))

(assert (= (and b!131728 res!63446) b!131721))

(assert (= (and b!131721 res!63448) b!131730))

(assert (= (and b!131722 condMapEmpty!4613) mapIsEmpty!4613))

(assert (= (and b!131722 (not condMapEmpty!4613)) mapNonEmpty!4614))

(get-info :version)

(assert (= (and mapNonEmpty!4614 ((_ is ValueCellFull!1091) mapValue!4613)) b!131731))

(assert (= (and b!131722 ((_ is ValueCellFull!1091) mapDefault!4613)) b!131737))

(assert (= b!131733 b!131722))

(assert (= b!131720 b!131733))

(assert (= b!131736 b!131720))

(assert (= start!14180 b!131736))

(assert (= (and b!131732 condMapEmpty!4614) mapIsEmpty!4614))

(assert (= (and b!131732 (not condMapEmpty!4614)) mapNonEmpty!4613))

(assert (= (and mapNonEmpty!4613 ((_ is ValueCellFull!1091) mapValue!4614)) b!131725))

(assert (= (and b!131732 ((_ is ValueCellFull!1091) mapDefault!4614)) b!131727))

(assert (= b!131735 b!131732))

(assert (= start!14180 b!131735))

(declare-fun b_lambda!5881 () Bool)

(assert (=> (not b_lambda!5881) (not b!131734)))

(declare-fun t!6115 () Bool)

(declare-fun tb!2389 () Bool)

(assert (=> (and b!131733 (= (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) (defaultEntry!2853 (v!3187 (underlying!452 thiss!992)))) t!6115) tb!2389))

(declare-fun result!3949 () Bool)

(assert (=> tb!2389 (= result!3949 tp_is_empty!2869)))

(assert (=> b!131734 t!6115))

(declare-fun b_and!8165 () Bool)

(assert (= b_and!8161 (and (=> t!6115 result!3949) b_and!8165)))

(declare-fun t!6117 () Bool)

(declare-fun tb!2391 () Bool)

(assert (=> (and b!131735 (= (defaultEntry!2853 newMap!16) (defaultEntry!2853 (v!3187 (underlying!452 thiss!992)))) t!6117) tb!2391))

(declare-fun result!3953 () Bool)

(assert (= result!3953 result!3949))

(assert (=> b!131734 t!6117))

(declare-fun b_and!8167 () Bool)

(assert (= b_and!8163 (and (=> t!6117 result!3953) b_and!8167)))

(declare-fun m!155535 () Bool)

(assert (=> start!14180 m!155535))

(declare-fun m!155537 () Bool)

(assert (=> b!131721 m!155537))

(declare-fun m!155539 () Bool)

(assert (=> b!131730 m!155539))

(declare-fun m!155541 () Bool)

(assert (=> mapNonEmpty!4613 m!155541))

(declare-fun m!155543 () Bool)

(assert (=> b!131723 m!155543))

(declare-fun m!155545 () Bool)

(assert (=> b!131723 m!155545))

(declare-fun m!155547 () Bool)

(assert (=> b!131723 m!155547))

(declare-fun m!155549 () Bool)

(assert (=> mapNonEmpty!4614 m!155549))

(declare-fun m!155551 () Bool)

(assert (=> b!131726 m!155551))

(declare-fun m!155553 () Bool)

(assert (=> b!131734 m!155553))

(declare-fun m!155555 () Bool)

(assert (=> b!131734 m!155555))

(declare-fun m!155557 () Bool)

(assert (=> b!131734 m!155557))

(assert (=> b!131734 m!155543))

(declare-fun m!155559 () Bool)

(assert (=> b!131734 m!155559))

(assert (=> b!131734 m!155543))

(assert (=> b!131734 m!155555))

(assert (=> b!131734 m!155543))

(assert (=> b!131734 m!155557))

(declare-fun m!155561 () Bool)

(assert (=> b!131734 m!155561))

(assert (=> b!131734 m!155553))

(declare-fun m!155563 () Bool)

(assert (=> b!131729 m!155563))

(declare-fun m!155565 () Bool)

(assert (=> b!131733 m!155565))

(declare-fun m!155567 () Bool)

(assert (=> b!131733 m!155567))

(declare-fun m!155569 () Bool)

(assert (=> b!131735 m!155569))

(declare-fun m!155571 () Bool)

(assert (=> b!131735 m!155571))

(check-sat (not b!131730) (not b!131729) (not b!131734) (not b!131735) b_and!8167 tp_is_empty!2869 (not b_lambda!5881) (not b_next!2905) (not b!131726) b_and!8165 (not mapNonEmpty!4614) (not b_next!2907) (not b!131723) (not mapNonEmpty!4613) (not start!14180) (not b!131721) (not b!131733))
(check-sat b_and!8165 b_and!8167 (not b_next!2905) (not b_next!2907))
(get-model)

(declare-fun b_lambda!5887 () Bool)

(assert (= b_lambda!5881 (or (and b!131733 b_free!2905) (and b!131735 b_free!2907 (= (defaultEntry!2853 newMap!16) (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))))) b_lambda!5887)))

(check-sat (not b_lambda!5887) (not b!131730) (not b!131729) (not b!131734) (not b!131735) b_and!8167 tp_is_empty!2869 (not b_next!2905) (not b!131726) b_and!8165 (not mapNonEmpty!4614) (not b_next!2907) (not b!131723) (not mapNonEmpty!4613) (not start!14180) (not b!131721) (not b!131733))
(check-sat b_and!8165 b_and!8167 (not b_next!2905) (not b_next!2907))
(get-model)

(declare-fun b!131869 () Bool)

(declare-fun e!85998 () Bool)

(declare-fun call!14387 () Bool)

(assert (=> b!131869 (= e!85998 call!14387)))

(declare-fun bm!14384 () Bool)

(declare-fun c!24364 () Bool)

(assert (=> bm!14384 (= call!14387 (arrayNoDuplicates!0 (_keys!4600 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!24364 (Cons!1688 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) Nil!1689) Nil!1689)))))

(declare-fun b!131870 () Bool)

(declare-fun e!86000 () Bool)

(declare-fun contains!882 (List!1692 (_ BitVec 64)) Bool)

(assert (=> b!131870 (= e!86000 (contains!882 Nil!1689 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!131871 () Bool)

(declare-fun e!85999 () Bool)

(assert (=> b!131871 (= e!85999 e!85998)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!131871 (= c!24364 (validKeyInArray!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!40263 () Bool)

(declare-fun res!63515 () Bool)

(declare-fun e!86001 () Bool)

(assert (=> d!40263 (=> res!63515 e!86001)))

(assert (=> d!40263 (= res!63515 (bvsge #b00000000000000000000000000000000 (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> d!40263 (= (arrayNoDuplicates!0 (_keys!4600 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000000 Nil!1689) e!86001)))

(declare-fun b!131872 () Bool)

(assert (=> b!131872 (= e!86001 e!85999)))

(declare-fun res!63513 () Bool)

(assert (=> b!131872 (=> (not res!63513) (not e!85999))))

(assert (=> b!131872 (= res!63513 (not e!86000))))

(declare-fun res!63514 () Bool)

(assert (=> b!131872 (=> (not res!63514) (not e!86000))))

(assert (=> b!131872 (= res!63514 (validKeyInArray!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!131873 () Bool)

(assert (=> b!131873 (= e!85998 call!14387)))

(assert (= (and d!40263 (not res!63515)) b!131872))

(assert (= (and b!131872 res!63514) b!131870))

(assert (= (and b!131872 res!63513) b!131871))

(assert (= (and b!131871 c!24364) b!131873))

(assert (= (and b!131871 (not c!24364)) b!131869))

(assert (= (or b!131873 b!131869) bm!14384))

(declare-fun m!155649 () Bool)

(assert (=> bm!14384 m!155649))

(declare-fun m!155651 () Bool)

(assert (=> bm!14384 m!155651))

(assert (=> b!131870 m!155649))

(assert (=> b!131870 m!155649))

(declare-fun m!155653 () Bool)

(assert (=> b!131870 m!155653))

(assert (=> b!131871 m!155649))

(assert (=> b!131871 m!155649))

(declare-fun m!155655 () Bool)

(assert (=> b!131871 m!155655))

(assert (=> b!131872 m!155649))

(assert (=> b!131872 m!155649))

(assert (=> b!131872 m!155655))

(assert (=> b!131730 d!40263))

(declare-fun d!40265 () Bool)

(declare-fun res!63522 () Bool)

(declare-fun e!86004 () Bool)

(assert (=> d!40265 (=> (not res!63522) (not e!86004))))

(declare-fun simpleValid!91 (LongMapFixedSize!1090) Bool)

(assert (=> d!40265 (= res!63522 (simpleValid!91 newMap!16))))

(assert (=> d!40265 (= (valid!540 newMap!16) e!86004)))

(declare-fun b!131880 () Bool)

(declare-fun res!63523 () Bool)

(assert (=> b!131880 (=> (not res!63523) (not e!86004))))

(declare-fun arrayCountValidKeys!0 (array!4749 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!131880 (= res!63523 (= (arrayCountValidKeys!0 (_keys!4600 newMap!16) #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))) (_size!594 newMap!16)))))

(declare-fun b!131881 () Bool)

(declare-fun res!63524 () Bool)

(assert (=> b!131881 (=> (not res!63524) (not e!86004))))

(assert (=> b!131881 (= res!63524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4600 newMap!16) (mask!7147 newMap!16)))))

(declare-fun b!131882 () Bool)

(assert (=> b!131882 (= e!86004 (arrayNoDuplicates!0 (_keys!4600 newMap!16) #b00000000000000000000000000000000 Nil!1689))))

(assert (= (and d!40265 res!63522) b!131880))

(assert (= (and b!131880 res!63523) b!131881))

(assert (= (and b!131881 res!63524) b!131882))

(declare-fun m!155657 () Bool)

(assert (=> d!40265 m!155657))

(declare-fun m!155659 () Bool)

(assert (=> b!131880 m!155659))

(declare-fun m!155661 () Bool)

(assert (=> b!131881 m!155661))

(declare-fun m!155663 () Bool)

(assert (=> b!131882 m!155663))

(assert (=> b!131726 d!40265))

(declare-fun d!40267 () Bool)

(assert (=> d!40267 (= (array_inv!1405 (_keys!4600 newMap!16)) (bvsge (size!2514 (_keys!4600 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!131735 d!40267))

(declare-fun d!40269 () Bool)

(assert (=> d!40269 (= (array_inv!1406 (_values!2836 newMap!16)) (bvsge (size!2515 (_values!2836 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!131735 d!40269))

(declare-fun bm!14387 () Bool)

(declare-fun call!14390 () Bool)

(assert (=> bm!14387 (= call!14390 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4600 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!131891 () Bool)

(declare-fun e!86013 () Bool)

(declare-fun e!86012 () Bool)

(assert (=> b!131891 (= e!86013 e!86012)))

(declare-fun lt!68690 () (_ BitVec 64))

(assert (=> b!131891 (= lt!68690 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4122 0))(
  ( (Unit!4123) )
))
(declare-fun lt!68692 () Unit!4122)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4749 (_ BitVec 64) (_ BitVec 32)) Unit!4122)

(assert (=> b!131891 (= lt!68692 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4600 (v!3187 (underlying!452 thiss!992))) lt!68690 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!4749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131891 (arrayContainsKey!0 (_keys!4600 (v!3187 (underlying!452 thiss!992))) lt!68690 #b00000000000000000000000000000000)))

(declare-fun lt!68691 () Unit!4122)

(assert (=> b!131891 (= lt!68691 lt!68692)))

(declare-fun res!63530 () Bool)

(declare-datatypes ((SeekEntryResult!268 0))(
  ( (MissingZero!268 (index!3231 (_ BitVec 32))) (Found!268 (index!3232 (_ BitVec 32))) (Intermediate!268 (undefined!1080 Bool) (index!3233 (_ BitVec 32)) (x!15496 (_ BitVec 32))) (Undefined!268) (MissingVacant!268 (index!3234 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4749 (_ BitVec 32)) SeekEntryResult!268)

(assert (=> b!131891 (= res!63530 (= (seekEntryOrOpen!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) (_keys!4600 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992)))) (Found!268 #b00000000000000000000000000000000)))))

(assert (=> b!131891 (=> (not res!63530) (not e!86012))))

(declare-fun d!40271 () Bool)

(declare-fun res!63529 () Bool)

(declare-fun e!86011 () Bool)

(assert (=> d!40271 (=> res!63529 e!86011)))

(assert (=> d!40271 (= res!63529 (bvsge #b00000000000000000000000000000000 (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> d!40271 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4600 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992)))) e!86011)))

(declare-fun b!131892 () Bool)

(assert (=> b!131892 (= e!86011 e!86013)))

(declare-fun c!24367 () Bool)

(assert (=> b!131892 (= c!24367 (validKeyInArray!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!131893 () Bool)

(assert (=> b!131893 (= e!86012 call!14390)))

(declare-fun b!131894 () Bool)

(assert (=> b!131894 (= e!86013 call!14390)))

(assert (= (and d!40271 (not res!63529)) b!131892))

(assert (= (and b!131892 c!24367) b!131891))

(assert (= (and b!131892 (not c!24367)) b!131894))

(assert (= (and b!131891 res!63530) b!131893))

(assert (= (or b!131893 b!131894) bm!14387))

(declare-fun m!155665 () Bool)

(assert (=> bm!14387 m!155665))

(assert (=> b!131891 m!155649))

(declare-fun m!155667 () Bool)

(assert (=> b!131891 m!155667))

(declare-fun m!155669 () Bool)

(assert (=> b!131891 m!155669))

(assert (=> b!131891 m!155649))

(declare-fun m!155671 () Bool)

(assert (=> b!131891 m!155671))

(assert (=> b!131892 m!155649))

(assert (=> b!131892 m!155649))

(assert (=> b!131892 m!155655))

(assert (=> b!131721 d!40271))

(declare-fun d!40273 () Bool)

(assert (=> d!40273 (= (map!1395 newMap!16) (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun bs!5484 () Bool)

(assert (= bs!5484 d!40273))

(declare-fun m!155673 () Bool)

(assert (=> bs!5484 m!155673))

(assert (=> b!131723 d!40273))

(declare-fun bm!14402 () Bool)

(declare-fun call!14411 () ListLongMap!1651)

(declare-fun call!14410 () ListLongMap!1651)

(assert (=> bm!14402 (= call!14411 call!14410)))

(declare-fun b!131937 () Bool)

(declare-fun e!86051 () Bool)

(declare-fun lt!68742 () ListLongMap!1651)

(declare-fun apply!115 (ListLongMap!1651 (_ BitVec 64)) V!3473)

(assert (=> b!131937 (= e!86051 (= (apply!115 lt!68742 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun bm!14403 () Bool)

(declare-fun call!14406 () ListLongMap!1651)

(declare-fun call!14409 () ListLongMap!1651)

(assert (=> bm!14403 (= call!14406 call!14409)))

(declare-fun b!131938 () Bool)

(declare-fun c!24382 () Bool)

(assert (=> b!131938 (= c!24382 (and (not (= (bvand (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!86043 () ListLongMap!1651)

(declare-fun e!86045 () ListLongMap!1651)

(assert (=> b!131938 (= e!86043 e!86045)))

(declare-fun b!131939 () Bool)

(declare-fun e!86041 () ListLongMap!1651)

(assert (=> b!131939 (= e!86041 e!86043)))

(declare-fun c!24381 () Bool)

(assert (=> b!131939 (= c!24381 (and (not (= (bvand (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131940 () Bool)

(assert (=> b!131940 (= e!86045 call!14411)))

(declare-fun b!131941 () Bool)

(declare-fun res!63556 () Bool)

(declare-fun e!86044 () Bool)

(assert (=> b!131941 (=> (not res!63556) (not e!86044))))

(declare-fun e!86052 () Bool)

(assert (=> b!131941 (= res!63556 e!86052)))

(declare-fun c!24383 () Bool)

(assert (=> b!131941 (= c!24383 (not (= (bvand (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!14404 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!135 (array!4749 array!4751 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 32) Int) ListLongMap!1651)

(assert (=> bm!14404 (= call!14409 (getCurrentListMapNoExtraKeys!135 (_keys!4600 (v!3187 (underlying!452 thiss!992))) (_values!2836 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992))) (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) (zeroValue!2709 (v!3187 (underlying!452 thiss!992))) (minValue!2709 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2853 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun bm!14405 () Bool)

(declare-fun call!14407 () Bool)

(assert (=> bm!14405 (= call!14407 (contains!881 lt!68742 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131942 () Bool)

(declare-fun +!168 (ListLongMap!1651 tuple2!2560) ListLongMap!1651)

(assert (=> b!131942 (= e!86041 (+!168 call!14410 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun b!131943 () Bool)

(declare-fun e!86047 () Bool)

(assert (=> b!131943 (= e!86047 (validKeyInArray!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!131944 () Bool)

(declare-fun call!14408 () Bool)

(assert (=> b!131944 (= e!86052 (not call!14408))))

(declare-fun b!131945 () Bool)

(declare-fun e!86042 () Bool)

(assert (=> b!131945 (= e!86042 (not call!14407))))

(declare-fun b!131946 () Bool)

(assert (=> b!131946 (= e!86044 e!86042)))

(declare-fun c!24385 () Bool)

(assert (=> b!131946 (= c!24385 (not (= (bvand (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14406 () Bool)

(assert (=> bm!14406 (= call!14408 (contains!881 lt!68742 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!40275 () Bool)

(assert (=> d!40275 e!86044))

(declare-fun res!63550 () Bool)

(assert (=> d!40275 (=> (not res!63550) (not e!86044))))

(assert (=> d!40275 (= res!63550 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))))))

(declare-fun lt!68756 () ListLongMap!1651)

(assert (=> d!40275 (= lt!68742 lt!68756)))

(declare-fun lt!68738 () Unit!4122)

(declare-fun e!86048 () Unit!4122)

(assert (=> d!40275 (= lt!68738 e!86048)))

(declare-fun c!24384 () Bool)

(declare-fun e!86040 () Bool)

(assert (=> d!40275 (= c!24384 e!86040)))

(declare-fun res!63553 () Bool)

(assert (=> d!40275 (=> (not res!63553) (not e!86040))))

(assert (=> d!40275 (= res!63553 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> d!40275 (= lt!68756 e!86041)))

(declare-fun c!24380 () Bool)

(assert (=> d!40275 (= c!24380 (and (not (= (bvand (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40275 (validMask!0 (mask!7147 (v!3187 (underlying!452 thiss!992))))))

(assert (=> d!40275 (= (getCurrentListMap!517 (_keys!4600 (v!3187 (underlying!452 thiss!992))) (_values!2836 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992))) (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) (zeroValue!2709 (v!3187 (underlying!452 thiss!992))) (minValue!2709 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2853 (v!3187 (underlying!452 thiss!992)))) lt!68742)))

(declare-fun b!131947 () Bool)

(declare-fun Unit!4124 () Unit!4122)

(assert (=> b!131947 (= e!86048 Unit!4124)))

(declare-fun b!131948 () Bool)

(declare-fun e!86046 () Bool)

(declare-fun e!86049 () Bool)

(assert (=> b!131948 (= e!86046 e!86049)))

(declare-fun res!63557 () Bool)

(assert (=> b!131948 (=> (not res!63557) (not e!86049))))

(assert (=> b!131948 (= res!63557 (contains!881 lt!68742 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131948 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun b!131949 () Bool)

(declare-fun e!86050 () Bool)

(assert (=> b!131949 (= e!86050 (= (apply!115 lt!68742 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2709 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!131950 () Bool)

(assert (=> b!131950 (= e!86052 e!86051)))

(declare-fun res!63555 () Bool)

(assert (=> b!131950 (= res!63555 call!14408)))

(assert (=> b!131950 (=> (not res!63555) (not e!86051))))

(declare-fun bm!14407 () Bool)

(declare-fun call!14405 () ListLongMap!1651)

(assert (=> bm!14407 (= call!14405 call!14406)))

(declare-fun b!131951 () Bool)

(assert (=> b!131951 (= e!86043 call!14411)))

(declare-fun b!131952 () Bool)

(assert (=> b!131952 (= e!86045 call!14405)))

(declare-fun b!131953 () Bool)

(assert (=> b!131953 (= e!86042 e!86050)))

(declare-fun res!63551 () Bool)

(assert (=> b!131953 (= res!63551 call!14407)))

(assert (=> b!131953 (=> (not res!63551) (not e!86050))))

(declare-fun b!131954 () Bool)

(declare-fun lt!68752 () Unit!4122)

(assert (=> b!131954 (= e!86048 lt!68752)))

(declare-fun lt!68757 () ListLongMap!1651)

(assert (=> b!131954 (= lt!68757 (getCurrentListMapNoExtraKeys!135 (_keys!4600 (v!3187 (underlying!452 thiss!992))) (_values!2836 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992))) (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) (zeroValue!2709 (v!3187 (underlying!452 thiss!992))) (minValue!2709 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2853 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun lt!68755 () (_ BitVec 64))

(assert (=> b!131954 (= lt!68755 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68758 () (_ BitVec 64))

(assert (=> b!131954 (= lt!68758 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68743 () Unit!4122)

(declare-fun addStillContains!91 (ListLongMap!1651 (_ BitVec 64) V!3473 (_ BitVec 64)) Unit!4122)

(assert (=> b!131954 (= lt!68743 (addStillContains!91 lt!68757 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))) lt!68758))))

(assert (=> b!131954 (contains!881 (+!168 lt!68757 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!68758)))

(declare-fun lt!68744 () Unit!4122)

(assert (=> b!131954 (= lt!68744 lt!68743)))

(declare-fun lt!68746 () ListLongMap!1651)

(assert (=> b!131954 (= lt!68746 (getCurrentListMapNoExtraKeys!135 (_keys!4600 (v!3187 (underlying!452 thiss!992))) (_values!2836 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992))) (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) (zeroValue!2709 (v!3187 (underlying!452 thiss!992))) (minValue!2709 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2853 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun lt!68739 () (_ BitVec 64))

(assert (=> b!131954 (= lt!68739 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68747 () (_ BitVec 64))

(assert (=> b!131954 (= lt!68747 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68740 () Unit!4122)

(declare-fun addApplyDifferent!91 (ListLongMap!1651 (_ BitVec 64) V!3473 (_ BitVec 64)) Unit!4122)

(assert (=> b!131954 (= lt!68740 (addApplyDifferent!91 lt!68746 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992))) lt!68747))))

(assert (=> b!131954 (= (apply!115 (+!168 lt!68746 (tuple2!2561 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!68747) (apply!115 lt!68746 lt!68747))))

(declare-fun lt!68741 () Unit!4122)

(assert (=> b!131954 (= lt!68741 lt!68740)))

(declare-fun lt!68751 () ListLongMap!1651)

(assert (=> b!131954 (= lt!68751 (getCurrentListMapNoExtraKeys!135 (_keys!4600 (v!3187 (underlying!452 thiss!992))) (_values!2836 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992))) (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) (zeroValue!2709 (v!3187 (underlying!452 thiss!992))) (minValue!2709 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2853 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun lt!68737 () (_ BitVec 64))

(assert (=> b!131954 (= lt!68737 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68748 () (_ BitVec 64))

(assert (=> b!131954 (= lt!68748 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68745 () Unit!4122)

(assert (=> b!131954 (= lt!68745 (addApplyDifferent!91 lt!68751 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))) lt!68748))))

(assert (=> b!131954 (= (apply!115 (+!168 lt!68751 (tuple2!2561 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!68748) (apply!115 lt!68751 lt!68748))))

(declare-fun lt!68750 () Unit!4122)

(assert (=> b!131954 (= lt!68750 lt!68745)))

(declare-fun lt!68753 () ListLongMap!1651)

(assert (=> b!131954 (= lt!68753 (getCurrentListMapNoExtraKeys!135 (_keys!4600 (v!3187 (underlying!452 thiss!992))) (_values!2836 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992))) (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) (zeroValue!2709 (v!3187 (underlying!452 thiss!992))) (minValue!2709 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2853 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun lt!68754 () (_ BitVec 64))

(assert (=> b!131954 (= lt!68754 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68749 () (_ BitVec 64))

(assert (=> b!131954 (= lt!68749 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!131954 (= lt!68752 (addApplyDifferent!91 lt!68753 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992))) lt!68749))))

(assert (=> b!131954 (= (apply!115 (+!168 lt!68753 (tuple2!2561 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!68749) (apply!115 lt!68753 lt!68749))))

(declare-fun bm!14408 () Bool)

(assert (=> bm!14408 (= call!14410 (+!168 (ite c!24380 call!14409 (ite c!24381 call!14406 call!14405)) (ite (or c!24380 c!24381) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(declare-fun b!131955 () Bool)

(declare-fun res!63554 () Bool)

(assert (=> b!131955 (=> (not res!63554) (not e!86044))))

(assert (=> b!131955 (= res!63554 e!86046)))

(declare-fun res!63549 () Bool)

(assert (=> b!131955 (=> res!63549 e!86046)))

(assert (=> b!131955 (= res!63549 (not e!86047))))

(declare-fun res!63552 () Bool)

(assert (=> b!131955 (=> (not res!63552) (not e!86047))))

(assert (=> b!131955 (= res!63552 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun b!131956 () Bool)

(assert (=> b!131956 (= e!86040 (validKeyInArray!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!131957 () Bool)

(assert (=> b!131957 (= e!86049 (= (apply!115 lt!68742 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131957 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2515 (_values!2836 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> b!131957 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))))

(assert (= (and d!40275 c!24380) b!131942))

(assert (= (and d!40275 (not c!24380)) b!131939))

(assert (= (and b!131939 c!24381) b!131951))

(assert (= (and b!131939 (not c!24381)) b!131938))

(assert (= (and b!131938 c!24382) b!131940))

(assert (= (and b!131938 (not c!24382)) b!131952))

(assert (= (or b!131940 b!131952) bm!14407))

(assert (= (or b!131951 bm!14407) bm!14403))

(assert (= (or b!131951 b!131940) bm!14402))

(assert (= (or b!131942 bm!14403) bm!14404))

(assert (= (or b!131942 bm!14402) bm!14408))

(assert (= (and d!40275 res!63553) b!131956))

(assert (= (and d!40275 c!24384) b!131954))

(assert (= (and d!40275 (not c!24384)) b!131947))

(assert (= (and d!40275 res!63550) b!131955))

(assert (= (and b!131955 res!63552) b!131943))

(assert (= (and b!131955 (not res!63549)) b!131948))

(assert (= (and b!131948 res!63557) b!131957))

(assert (= (and b!131955 res!63554) b!131941))

(assert (= (and b!131941 c!24383) b!131950))

(assert (= (and b!131941 (not c!24383)) b!131944))

(assert (= (and b!131950 res!63555) b!131937))

(assert (= (or b!131950 b!131944) bm!14406))

(assert (= (and b!131941 res!63556) b!131946))

(assert (= (and b!131946 c!24385) b!131953))

(assert (= (and b!131946 (not c!24385)) b!131945))

(assert (= (and b!131953 res!63551) b!131949))

(assert (= (or b!131953 b!131945) bm!14405))

(declare-fun b_lambda!5889 () Bool)

(assert (=> (not b_lambda!5889) (not b!131957)))

(assert (=> b!131957 t!6115))

(declare-fun b_and!8185 () Bool)

(assert (= b_and!8165 (and (=> t!6115 result!3949) b_and!8185)))

(assert (=> b!131957 t!6117))

(declare-fun b_and!8187 () Bool)

(assert (= b_and!8167 (and (=> t!6117 result!3953) b_and!8187)))

(declare-fun m!155675 () Bool)

(assert (=> b!131954 m!155675))

(declare-fun m!155677 () Bool)

(assert (=> b!131954 m!155677))

(declare-fun m!155679 () Bool)

(assert (=> b!131954 m!155679))

(declare-fun m!155681 () Bool)

(assert (=> b!131954 m!155681))

(declare-fun m!155683 () Bool)

(assert (=> b!131954 m!155683))

(declare-fun m!155685 () Bool)

(assert (=> b!131954 m!155685))

(declare-fun m!155687 () Bool)

(assert (=> b!131954 m!155687))

(assert (=> b!131954 m!155685))

(declare-fun m!155689 () Bool)

(assert (=> b!131954 m!155689))

(assert (=> b!131954 m!155677))

(declare-fun m!155691 () Bool)

(assert (=> b!131954 m!155691))

(assert (=> b!131954 m!155681))

(declare-fun m!155693 () Bool)

(assert (=> b!131954 m!155693))

(declare-fun m!155695 () Bool)

(assert (=> b!131954 m!155695))

(assert (=> b!131954 m!155695))

(declare-fun m!155697 () Bool)

(assert (=> b!131954 m!155697))

(declare-fun m!155699 () Bool)

(assert (=> b!131954 m!155699))

(declare-fun m!155701 () Bool)

(assert (=> b!131954 m!155701))

(declare-fun m!155703 () Bool)

(assert (=> b!131954 m!155703))

(declare-fun m!155705 () Bool)

(assert (=> b!131954 m!155705))

(declare-fun m!155707 () Bool)

(assert (=> b!131954 m!155707))

(declare-fun m!155709 () Bool)

(assert (=> bm!14405 m!155709))

(assert (=> bm!14404 m!155707))

(declare-fun m!155711 () Bool)

(assert (=> b!131957 m!155711))

(assert (=> b!131957 m!155687))

(assert (=> b!131957 m!155687))

(declare-fun m!155713 () Bool)

(assert (=> b!131957 m!155713))

(assert (=> b!131957 m!155555))

(assert (=> b!131957 m!155711))

(assert (=> b!131957 m!155555))

(declare-fun m!155715 () Bool)

(assert (=> b!131957 m!155715))

(declare-fun m!155717 () Bool)

(assert (=> b!131949 m!155717))

(assert (=> b!131956 m!155687))

(assert (=> b!131956 m!155687))

(declare-fun m!155719 () Bool)

(assert (=> b!131956 m!155719))

(assert (=> d!40275 m!155563))

(declare-fun m!155721 () Bool)

(assert (=> b!131942 m!155721))

(declare-fun m!155723 () Bool)

(assert (=> bm!14408 m!155723))

(assert (=> b!131943 m!155687))

(assert (=> b!131943 m!155687))

(assert (=> b!131943 m!155719))

(assert (=> b!131948 m!155687))

(assert (=> b!131948 m!155687))

(declare-fun m!155725 () Bool)

(assert (=> b!131948 m!155725))

(declare-fun m!155727 () Bool)

(assert (=> b!131937 m!155727))

(declare-fun m!155729 () Bool)

(assert (=> bm!14406 m!155729))

(assert (=> b!131723 d!40275))

(declare-fun d!40277 () Bool)

(assert (=> d!40277 (= (array_inv!1405 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvsge (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!131733 d!40277))

(declare-fun d!40279 () Bool)

(assert (=> d!40279 (= (array_inv!1406 (_values!2836 (v!3187 (underlying!452 thiss!992)))) (bvsge (size!2515 (_values!2836 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!131733 d!40279))

(declare-fun d!40281 () Bool)

(assert (=> d!40281 (= (valid!539 thiss!992) (valid!540 (v!3187 (underlying!452 thiss!992))))))

(declare-fun bs!5485 () Bool)

(assert (= bs!5485 d!40281))

(declare-fun m!155731 () Bool)

(assert (=> bs!5485 m!155731))

(assert (=> start!14180 d!40281))

(declare-fun d!40283 () Bool)

(declare-fun e!86058 () Bool)

(assert (=> d!40283 e!86058))

(declare-fun res!63560 () Bool)

(assert (=> d!40283 (=> res!63560 e!86058)))

(declare-fun lt!68768 () Bool)

(assert (=> d!40283 (= res!63560 (not lt!68768))))

(declare-fun lt!68769 () Bool)

(assert (=> d!40283 (= lt!68768 lt!68769)))

(declare-fun lt!68770 () Unit!4122)

(declare-fun e!86057 () Unit!4122)

(assert (=> d!40283 (= lt!68770 e!86057)))

(declare-fun c!24388 () Bool)

(assert (=> d!40283 (= c!24388 lt!68769)))

(declare-fun containsKey!175 (List!1691 (_ BitVec 64)) Bool)

(assert (=> d!40283 (= lt!68769 (containsKey!175 (toList!841 lt!68663) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> d!40283 (= (contains!881 lt!68663 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)) lt!68768)))

(declare-fun b!131964 () Bool)

(declare-fun lt!68767 () Unit!4122)

(assert (=> b!131964 (= e!86057 lt!68767)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!123 (List!1691 (_ BitVec 64)) Unit!4122)

(assert (=> b!131964 (= lt!68767 (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!841 lt!68663) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-datatypes ((Option!178 0))(
  ( (Some!177 (v!3192 V!3473)) (None!176) )
))
(declare-fun isDefined!124 (Option!178) Bool)

(declare-fun getValueByKey!172 (List!1691 (_ BitVec 64)) Option!178)

(assert (=> b!131964 (isDefined!124 (getValueByKey!172 (toList!841 lt!68663) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun b!131965 () Bool)

(declare-fun Unit!4125 () Unit!4122)

(assert (=> b!131965 (= e!86057 Unit!4125)))

(declare-fun b!131966 () Bool)

(assert (=> b!131966 (= e!86058 (isDefined!124 (getValueByKey!172 (toList!841 lt!68663) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355))))))

(assert (= (and d!40283 c!24388) b!131964))

(assert (= (and d!40283 (not c!24388)) b!131965))

(assert (= (and d!40283 (not res!63560)) b!131966))

(assert (=> d!40283 m!155543))

(declare-fun m!155733 () Bool)

(assert (=> d!40283 m!155733))

(assert (=> b!131964 m!155543))

(declare-fun m!155735 () Bool)

(assert (=> b!131964 m!155735))

(assert (=> b!131964 m!155543))

(declare-fun m!155737 () Bool)

(assert (=> b!131964 m!155737))

(assert (=> b!131964 m!155737))

(declare-fun m!155739 () Bool)

(assert (=> b!131964 m!155739))

(assert (=> b!131966 m!155543))

(assert (=> b!131966 m!155737))

(assert (=> b!131966 m!155737))

(assert (=> b!131966 m!155739))

(assert (=> b!131734 d!40283))

(declare-fun b!132047 () Bool)

(declare-fun e!86103 () Bool)

(declare-fun call!14466 () ListLongMap!1651)

(declare-fun call!14469 () ListLongMap!1651)

(assert (=> b!132047 (= e!86103 (= call!14466 call!14469))))

(declare-fun b!132048 () Bool)

(declare-fun lt!68827 () Unit!4122)

(declare-fun e!86117 () Unit!4122)

(assert (=> b!132048 (= lt!68827 e!86117)))

(declare-fun c!24426 () Bool)

(declare-fun call!14475 () Bool)

(assert (=> b!132048 (= c!24426 call!14475)))

(declare-fun e!86120 () tuple2!2562)

(assert (=> b!132048 (= e!86120 (tuple2!2563 false newMap!16))))

(declare-fun bm!14457 () Bool)

(declare-fun call!14477 () ListLongMap!1651)

(declare-fun call!14464 () ListLongMap!1651)

(assert (=> bm!14457 (= call!14477 call!14464)))

(declare-fun b!132049 () Bool)

(declare-fun lt!68831 () Unit!4122)

(declare-fun lt!68843 () Unit!4122)

(assert (=> b!132049 (= lt!68831 lt!68843)))

(declare-fun call!14473 () ListLongMap!1651)

(assert (=> b!132049 (= call!14473 call!14477)))

(declare-fun lt!68825 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!60 (array!4749 array!4751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 V!3473 Int) Unit!4122)

(assert (=> b!132049 (= lt!68843 (lemmaChangeZeroKeyThenAddPairToListMap!60 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) lt!68825 (zeroValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2709 newMap!16) (defaultEntry!2853 newMap!16)))))

(assert (=> b!132049 (= lt!68825 (bvor (extraKeys!2620 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!86110 () tuple2!2562)

(assert (=> b!132049 (= e!86110 (tuple2!2563 true (LongMapFixedSize!1091 (defaultEntry!2853 newMap!16) (mask!7147 newMap!16) (bvor (extraKeys!2620 newMap!16) #b00000000000000000000000000000001) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2709 newMap!16) (_size!594 newMap!16) (_keys!4600 newMap!16) (_values!2836 newMap!16) (_vacant!594 newMap!16))))))

(declare-fun bm!14458 () Bool)

(declare-fun call!14460 () Bool)

(declare-fun call!14480 () Bool)

(assert (=> bm!14458 (= call!14460 call!14480)))

(declare-fun bm!14459 () Bool)

(declare-fun call!14481 () Bool)

(assert (=> bm!14459 (= call!14481 call!14480)))

(declare-fun b!132050 () Bool)

(declare-fun c!24419 () Bool)

(declare-fun lt!68835 () SeekEntryResult!268)

(assert (=> b!132050 (= c!24419 ((_ is MissingVacant!268) lt!68835))))

(declare-fun e!86109 () tuple2!2562)

(assert (=> b!132050 (= e!86120 e!86109)))

(declare-fun b!132051 () Bool)

(declare-fun e!86104 () Bool)

(assert (=> b!132051 (= e!86104 (not call!14460))))

(declare-fun call!14467 () ListLongMap!1651)

(declare-fun bm!14460 () Bool)

(declare-fun c!24415 () Bool)

(assert (=> bm!14460 (= call!14475 (contains!881 call!14467 (ite c!24415 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (select (arr!2246 (_keys!4600 newMap!16)) (index!3232 lt!68835)))))))

(declare-fun b!132052 () Bool)

(declare-fun e!86119 () ListLongMap!1651)

(assert (=> b!132052 (= e!86119 (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun b!132053 () Bool)

(declare-fun e!86106 () Bool)

(assert (=> b!132053 (= e!86106 e!86103)))

(declare-fun c!24427 () Bool)

(declare-fun lt!68837 () tuple2!2562)

(assert (=> b!132053 (= c!24427 (_1!1292 lt!68837))))

(declare-fun b!132054 () Bool)

(declare-fun res!63600 () Bool)

(declare-fun call!14482 () Bool)

(assert (=> b!132054 (= res!63600 call!14482)))

(declare-fun e!86112 () Bool)

(assert (=> b!132054 (=> (not res!63600) (not e!86112))))

(declare-fun b!132055 () Bool)

(declare-fun e!86116 () Bool)

(declare-fun e!86102 () Bool)

(assert (=> b!132055 (= e!86116 e!86102)))

(declare-fun res!63597 () Bool)

(declare-fun call!14462 () Bool)

(assert (=> b!132055 (= res!63597 call!14462)))

(assert (=> b!132055 (=> (not res!63597) (not e!86102))))

(declare-fun c!24423 () Bool)

(declare-fun call!14474 () ListLongMap!1651)

(declare-fun c!24420 () Bool)

(declare-fun bm!14461 () Bool)

(assert (=> bm!14461 (= call!14474 (+!168 e!86119 (ite c!24420 (ite c!24423 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!24418 () Bool)

(assert (=> bm!14461 (= c!24418 c!24420)))

(declare-fun lt!68847 () SeekEntryResult!268)

(declare-fun e!86113 () Bool)

(declare-fun b!132056 () Bool)

(assert (=> b!132056 (= e!86113 (= (select (arr!2246 (_keys!4600 newMap!16)) (index!3232 lt!68847)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun b!132057 () Bool)

(declare-fun res!63591 () Bool)

(declare-fun lt!68844 () SeekEntryResult!268)

(assert (=> b!132057 (= res!63591 (= (select (arr!2246 (_keys!4600 newMap!16)) (index!3234 lt!68844)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132057 (=> (not res!63591) (not e!86102))))

(declare-fun bm!14462 () Bool)

(declare-fun call!14465 () Bool)

(declare-fun call!14461 () Bool)

(assert (=> bm!14462 (= call!14465 call!14461)))

(declare-fun bm!14463 () Bool)

(assert (=> bm!14463 (= call!14462 call!14482)))

(declare-fun b!132058 () Bool)

(declare-fun lt!68848 () Unit!4122)

(declare-fun lt!68836 () Unit!4122)

(assert (=> b!132058 (= lt!68848 lt!68836)))

(assert (=> b!132058 call!14475))

(declare-fun lt!68829 () array!4751)

(declare-fun lemmaValidKeyInArrayIsInListMap!120 (array!4749 array!4751 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 32) Int) Unit!4122)

(assert (=> b!132058 (= lt!68836 (lemmaValidKeyInArrayIsInListMap!120 (_keys!4600 newMap!16) lt!68829 (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (index!3232 lt!68835) (defaultEntry!2853 newMap!16)))))

(assert (=> b!132058 (= lt!68829 (array!4752 (store (arr!2247 (_values!2836 newMap!16)) (index!3232 lt!68835) (ValueCellFull!1091 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2515 (_values!2836 newMap!16))))))

(declare-fun lt!68839 () Unit!4122)

(declare-fun lt!68833 () Unit!4122)

(assert (=> b!132058 (= lt!68839 lt!68833)))

(assert (=> b!132058 (= call!14474 call!14464)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!60 (array!4749 array!4751 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 32) (_ BitVec 64) V!3473 Int) Unit!4122)

(assert (=> b!132058 (= lt!68833 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!60 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (index!3232 lt!68835) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68850 () Unit!4122)

(declare-fun e!86105 () Unit!4122)

(assert (=> b!132058 (= lt!68850 e!86105)))

(declare-fun c!24416 () Bool)

(assert (=> b!132058 (= c!24416 (contains!881 (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun e!86118 () tuple2!2562)

(assert (=> b!132058 (= e!86118 (tuple2!2563 true (LongMapFixedSize!1091 (defaultEntry!2853 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (_size!594 newMap!16) (_keys!4600 newMap!16) (array!4752 (store (arr!2247 (_values!2836 newMap!16)) (index!3232 lt!68835) (ValueCellFull!1091 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2515 (_values!2836 newMap!16))) (_vacant!594 newMap!16))))))

(declare-fun b!132059 () Bool)

(declare-fun e!86115 () Bool)

(declare-fun e!86107 () Bool)

(assert (=> b!132059 (= e!86115 e!86107)))

(declare-fun res!63590 () Bool)

(declare-fun call!14476 () Bool)

(assert (=> b!132059 (= res!63590 call!14476)))

(assert (=> b!132059 (=> (not res!63590) (not e!86107))))

(declare-fun b!132060 () Bool)

(declare-fun lt!68851 () tuple2!2562)

(declare-fun call!14479 () tuple2!2562)

(assert (=> b!132060 (= lt!68851 call!14479)))

(assert (=> b!132060 (= e!86118 (tuple2!2563 (_1!1292 lt!68851) (_2!1292 lt!68851)))))

(declare-fun b!132061 () Bool)

(declare-fun call!14483 () ListLongMap!1651)

(assert (=> b!132061 (= e!86119 call!14483)))

(declare-fun b!132062 () Bool)

(declare-fun e!86121 () Bool)

(assert (=> b!132062 (= e!86103 e!86121)))

(declare-fun res!63592 () Bool)

(assert (=> b!132062 (= res!63592 (contains!881 call!14466 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> b!132062 (=> (not res!63592) (not e!86121))))

(declare-fun bm!14464 () Bool)

(declare-fun updateHelperNewKey!60 (LongMapFixedSize!1090 (_ BitVec 64) V!3473 (_ BitVec 32)) tuple2!2562)

(assert (=> bm!14464 (= call!14479 (updateHelperNewKey!60 newMap!16 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835))))))

(declare-fun lt!68826 () (_ BitVec 32))

(declare-fun bm!14465 () Bool)

(assert (=> bm!14465 (= call!14464 (getCurrentListMap!517 (_keys!4600 newMap!16) (ite c!24420 (_values!2836 newMap!16) (array!4752 (store (arr!2247 (_values!2836 newMap!16)) (index!3232 lt!68835) (ValueCellFull!1091 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2515 (_values!2836 newMap!16)))) (mask!7147 newMap!16) (ite c!24420 (ite c!24423 lt!68825 lt!68826) (extraKeys!2620 newMap!16)) (ite (and c!24420 c!24423) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) (ite c!24420 (ite c!24423 (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun bm!14466 () Bool)

(assert (=> bm!14466 (= call!14476 call!14465)))

(declare-fun b!132063 () Bool)

(declare-fun Unit!4126 () Unit!4122)

(assert (=> b!132063 (= e!86117 Unit!4126)))

(declare-fun lt!68845 () Unit!4122)

(declare-fun call!14478 () Unit!4122)

(assert (=> b!132063 (= lt!68845 call!14478)))

(declare-fun lt!68832 () SeekEntryResult!268)

(declare-fun call!14463 () SeekEntryResult!268)

(assert (=> b!132063 (= lt!68832 call!14463)))

(declare-fun res!63598 () Bool)

(assert (=> b!132063 (= res!63598 ((_ is Found!268) lt!68832))))

(assert (=> b!132063 (=> (not res!63598) (not e!86112))))

(assert (=> b!132063 e!86112))

(declare-fun lt!68830 () Unit!4122)

(assert (=> b!132063 (= lt!68830 lt!68845)))

(assert (=> b!132063 false))

(declare-fun b!132064 () Bool)

(assert (=> b!132064 (= e!86102 (not call!14481))))

(declare-fun b!132065 () Bool)

(assert (=> b!132065 (= e!86112 (= (select (arr!2246 (_keys!4600 newMap!16)) (index!3232 lt!68832)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun b!132066 () Bool)

(declare-fun e!86114 () tuple2!2562)

(assert (=> b!132066 (= e!86114 e!86120)))

(assert (=> b!132066 (= lt!68835 (seekEntryOrOpen!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4600 newMap!16) (mask!7147 newMap!16)))))

(assert (=> b!132066 (= c!24415 ((_ is Undefined!268) lt!68835))))

(declare-fun bm!14467 () Bool)

(assert (=> bm!14467 (= call!14466 (map!1395 (_2!1292 lt!68837)))))

(declare-fun b!132067 () Bool)

(declare-fun res!63594 () Bool)

(declare-fun lt!68846 () SeekEntryResult!268)

(assert (=> b!132067 (= res!63594 (= (select (arr!2246 (_keys!4600 newMap!16)) (index!3234 lt!68846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132067 (=> (not res!63594) (not e!86107))))

(declare-fun bm!14468 () Bool)

(assert (=> bm!14468 (= call!14480 (arrayContainsKey!0 (_keys!4600 newMap!16) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!132068 () Bool)

(assert (=> b!132068 (= e!86107 (not call!14460))))

(declare-fun b!132069 () Bool)

(declare-fun res!63595 () Bool)

(declare-fun e!86101 () Bool)

(assert (=> b!132069 (=> (not res!63595) (not e!86101))))

(assert (=> b!132069 (= res!63595 call!14462)))

(declare-fun e!86108 () Bool)

(assert (=> b!132069 (= e!86108 e!86101)))

(declare-fun call!14470 () SeekEntryResult!268)

(declare-fun bm!14469 () Bool)

(assert (=> bm!14469 (= call!14470 (seekEntryOrOpen!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4600 newMap!16) (mask!7147 newMap!16)))))

(declare-fun b!132070 () Bool)

(declare-fun c!24422 () Bool)

(assert (=> b!132070 (= c!24422 ((_ is MissingVacant!268) lt!68844))))

(assert (=> b!132070 (= e!86108 e!86116)))

(declare-fun b!132071 () Bool)

(assert (=> b!132071 (= e!86116 ((_ is Undefined!268) lt!68844))))

(declare-fun d!40285 () Bool)

(assert (=> d!40285 e!86106))

(declare-fun res!63593 () Bool)

(assert (=> d!40285 (=> (not res!63593) (not e!86106))))

(assert (=> d!40285 (= res!63593 (valid!540 (_2!1292 lt!68837)))))

(assert (=> d!40285 (= lt!68837 e!86114)))

(assert (=> d!40285 (= c!24420 (= (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (bvneg (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355))))))

(assert (=> d!40285 (valid!540 newMap!16)))

(assert (=> d!40285 (= (update!195 newMap!16 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!68837)))

(declare-fun b!132072 () Bool)

(declare-fun lt!68828 () Unit!4122)

(assert (=> b!132072 (= e!86105 lt!68828)))

(assert (=> b!132072 (= lt!68828 call!14478)))

(declare-fun call!14471 () SeekEntryResult!268)

(assert (=> b!132072 (= lt!68847 call!14471)))

(declare-fun res!63602 () Bool)

(assert (=> b!132072 (= res!63602 ((_ is Found!268) lt!68847))))

(assert (=> b!132072 (=> (not res!63602) (not e!86113))))

(assert (=> b!132072 e!86113))

(declare-fun bm!14470 () Bool)

(assert (=> bm!14470 (= call!14469 (map!1395 newMap!16))))

(declare-fun bm!14471 () Bool)

(declare-fun call!14472 () Unit!4122)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!60 (array!4749 array!4751 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 64) Int) Unit!4122)

(assert (=> bm!14471 (= call!14472 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!60 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (defaultEntry!2853 newMap!16)))))

(declare-fun b!132073 () Bool)

(declare-fun res!63589 () Bool)

(assert (=> b!132073 (=> (not res!63589) (not e!86101))))

(assert (=> b!132073 (= res!63589 (= (select (arr!2246 (_keys!4600 newMap!16)) (index!3231 lt!68844)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14472 () Bool)

(declare-fun c!24421 () Bool)

(declare-fun c!24417 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!14472 (= call!14461 (inRange!0 (ite c!24415 (ite c!24426 (index!3232 lt!68832) (ite c!24421 (index!3231 lt!68844) (index!3234 lt!68844))) (ite c!24416 (index!3232 lt!68847) (ite c!24417 (index!3231 lt!68846) (index!3234 lt!68846)))) (mask!7147 newMap!16)))))

(declare-fun b!132074 () Bool)

(declare-fun res!63601 () Bool)

(assert (=> b!132074 (= res!63601 call!14465)))

(assert (=> b!132074 (=> (not res!63601) (not e!86113))))

(declare-fun bm!14473 () Bool)

(declare-fun call!14468 () ListLongMap!1651)

(assert (=> bm!14473 (= call!14483 call!14468)))

(declare-fun bm!14474 () Bool)

(assert (=> bm!14474 (= call!14482 call!14461)))

(declare-fun b!132075 () Bool)

(assert (=> b!132075 (= e!86101 (not call!14481))))

(declare-fun b!132076 () Bool)

(declare-fun lt!68838 () Unit!4122)

(declare-fun lt!68842 () Unit!4122)

(assert (=> b!132076 (= lt!68838 lt!68842)))

(assert (=> b!132076 (= call!14473 call!14477)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!60 (array!4749 array!4751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 V!3473 Int) Unit!4122)

(assert (=> b!132076 (= lt!68842 (lemmaChangeLongMinValueKeyThenAddPairToListMap!60 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) lt!68826 (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2853 newMap!16)))))

(assert (=> b!132076 (= lt!68826 (bvor (extraKeys!2620 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!132076 (= e!86110 (tuple2!2563 true (LongMapFixedSize!1091 (defaultEntry!2853 newMap!16) (mask!7147 newMap!16) (bvor (extraKeys!2620 newMap!16) #b00000000000000000000000000000010) (zeroValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!594 newMap!16) (_keys!4600 newMap!16) (_values!2836 newMap!16) (_vacant!594 newMap!16))))))

(declare-fun b!132077 () Bool)

(assert (=> b!132077 (= e!86114 e!86110)))

(assert (=> b!132077 (= c!24423 (= (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14475 () Bool)

(assert (=> bm!14475 (= call!14468 (getCurrentListMap!517 (_keys!4600 newMap!16) (ite (or c!24420 c!24415) (_values!2836 newMap!16) lt!68829) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun b!132078 () Bool)

(declare-fun lt!68834 () tuple2!2562)

(assert (=> b!132078 (= e!86109 (tuple2!2563 (_1!1292 lt!68834) (_2!1292 lt!68834)))))

(assert (=> b!132078 (= lt!68834 call!14479)))

(declare-fun b!132079 () Bool)

(assert (=> b!132079 (= e!86121 (= call!14466 (+!168 call!14469 (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!132080 () Bool)

(declare-fun Unit!4127 () Unit!4122)

(assert (=> b!132080 (= e!86105 Unit!4127)))

(declare-fun lt!68840 () Unit!4122)

(assert (=> b!132080 (= lt!68840 call!14472)))

(assert (=> b!132080 (= lt!68846 call!14471)))

(assert (=> b!132080 (= c!24417 ((_ is MissingZero!268) lt!68846))))

(declare-fun e!86111 () Bool)

(assert (=> b!132080 e!86111))

(declare-fun lt!68841 () Unit!4122)

(assert (=> b!132080 (= lt!68841 lt!68840)))

(assert (=> b!132080 false))

(declare-fun b!132081 () Bool)

(declare-fun c!24424 () Bool)

(assert (=> b!132081 (= c!24424 ((_ is MissingVacant!268) lt!68846))))

(assert (=> b!132081 (= e!86111 e!86115)))

(declare-fun bm!14476 () Bool)

(assert (=> bm!14476 (= call!14473 call!14474)))

(declare-fun bm!14477 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!60 (array!4749 array!4751 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 64) Int) Unit!4122)

(assert (=> bm!14477 (= call!14478 (lemmaInListMapThenSeekEntryOrOpenFindsIt!60 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (defaultEntry!2853 newMap!16)))))

(declare-fun b!132082 () Bool)

(declare-fun res!63596 () Bool)

(assert (=> b!132082 (=> (not res!63596) (not e!86104))))

(assert (=> b!132082 (= res!63596 call!14476)))

(assert (=> b!132082 (= e!86111 e!86104)))

(declare-fun bm!14478 () Bool)

(assert (=> bm!14478 (= call!14463 call!14470)))

(declare-fun bm!14479 () Bool)

(assert (=> bm!14479 (= call!14467 call!14468)))

(declare-fun b!132083 () Bool)

(declare-fun res!63599 () Bool)

(assert (=> b!132083 (=> (not res!63599) (not e!86104))))

(assert (=> b!132083 (= res!63599 (= (select (arr!2246 (_keys!4600 newMap!16)) (index!3231 lt!68846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132084 () Bool)

(assert (=> b!132084 (= e!86109 e!86118)))

(declare-fun c!24425 () Bool)

(assert (=> b!132084 (= c!24425 ((_ is MissingZero!268) lt!68835))))

(declare-fun bm!14480 () Bool)

(assert (=> bm!14480 (= call!14471 call!14470)))

(declare-fun b!132085 () Bool)

(assert (=> b!132085 (= e!86115 ((_ is Undefined!268) lt!68846))))

(declare-fun b!132086 () Bool)

(declare-fun lt!68849 () Unit!4122)

(assert (=> b!132086 (= e!86117 lt!68849)))

(assert (=> b!132086 (= lt!68849 call!14472)))

(assert (=> b!132086 (= lt!68844 call!14463)))

(assert (=> b!132086 (= c!24421 ((_ is MissingZero!268) lt!68844))))

(assert (=> b!132086 e!86108))

(assert (= (and d!40285 c!24420) b!132077))

(assert (= (and d!40285 (not c!24420)) b!132066))

(assert (= (and b!132077 c!24423) b!132049))

(assert (= (and b!132077 (not c!24423)) b!132076))

(assert (= (or b!132049 b!132076) bm!14457))

(assert (= (or b!132049 b!132076) bm!14473))

(assert (= (or b!132049 b!132076) bm!14476))

(assert (= (and b!132066 c!24415) b!132048))

(assert (= (and b!132066 (not c!24415)) b!132050))

(assert (= (and b!132048 c!24426) b!132063))

(assert (= (and b!132048 (not c!24426)) b!132086))

(assert (= (and b!132063 res!63598) b!132054))

(assert (= (and b!132054 res!63600) b!132065))

(assert (= (and b!132086 c!24421) b!132069))

(assert (= (and b!132086 (not c!24421)) b!132070))

(assert (= (and b!132069 res!63595) b!132073))

(assert (= (and b!132073 res!63589) b!132075))

(assert (= (and b!132070 c!24422) b!132055))

(assert (= (and b!132070 (not c!24422)) b!132071))

(assert (= (and b!132055 res!63597) b!132057))

(assert (= (and b!132057 res!63591) b!132064))

(assert (= (or b!132069 b!132055) bm!14463))

(assert (= (or b!132075 b!132064) bm!14459))

(assert (= (or b!132054 bm!14463) bm!14474))

(assert (= (or b!132063 b!132086) bm!14478))

(assert (= (and b!132050 c!24419) b!132078))

(assert (= (and b!132050 (not c!24419)) b!132084))

(assert (= (and b!132084 c!24425) b!132060))

(assert (= (and b!132084 (not c!24425)) b!132058))

(assert (= (and b!132058 c!24416) b!132072))

(assert (= (and b!132058 (not c!24416)) b!132080))

(assert (= (and b!132072 res!63602) b!132074))

(assert (= (and b!132074 res!63601) b!132056))

(assert (= (and b!132080 c!24417) b!132082))

(assert (= (and b!132080 (not c!24417)) b!132081))

(assert (= (and b!132082 res!63596) b!132083))

(assert (= (and b!132083 res!63599) b!132051))

(assert (= (and b!132081 c!24424) b!132059))

(assert (= (and b!132081 (not c!24424)) b!132085))

(assert (= (and b!132059 res!63590) b!132067))

(assert (= (and b!132067 res!63594) b!132068))

(assert (= (or b!132082 b!132059) bm!14466))

(assert (= (or b!132051 b!132068) bm!14458))

(assert (= (or b!132074 bm!14466) bm!14462))

(assert (= (or b!132072 b!132080) bm!14480))

(assert (= (or b!132078 b!132060) bm!14464))

(assert (= (or b!132086 b!132080) bm!14471))

(assert (= (or bm!14478 bm!14480) bm!14469))

(assert (= (or bm!14474 bm!14462) bm!14472))

(assert (= (or bm!14459 bm!14458) bm!14468))

(assert (= (or b!132048 b!132058) bm!14479))

(assert (= (or b!132063 b!132072) bm!14477))

(assert (= (or b!132048 b!132058) bm!14460))

(assert (= (or bm!14473 bm!14479) bm!14475))

(assert (= (or bm!14457 b!132058) bm!14465))

(assert (= (or bm!14476 b!132058) bm!14461))

(assert (= (and bm!14461 c!24418) b!132061))

(assert (= (and bm!14461 (not c!24418)) b!132052))

(assert (= (and d!40285 res!63593) b!132053))

(assert (= (and b!132053 c!24427) b!132062))

(assert (= (and b!132053 (not c!24427)) b!132047))

(assert (= (and b!132062 res!63592) b!132079))

(assert (= (or b!132079 b!132047) bm!14470))

(assert (= (or b!132062 b!132079 b!132047) bm!14467))

(assert (=> bm!14477 m!155543))

(declare-fun m!155741 () Bool)

(assert (=> bm!14477 m!155741))

(declare-fun m!155743 () Bool)

(assert (=> d!40285 m!155743))

(assert (=> d!40285 m!155551))

(declare-fun m!155745 () Bool)

(assert (=> bm!14475 m!155745))

(assert (=> bm!14468 m!155543))

(declare-fun m!155747 () Bool)

(assert (=> bm!14468 m!155747))

(assert (=> b!132058 m!155673))

(assert (=> b!132058 m!155673))

(assert (=> b!132058 m!155543))

(declare-fun m!155749 () Bool)

(assert (=> b!132058 m!155749))

(assert (=> b!132058 m!155543))

(assert (=> b!132058 m!155557))

(declare-fun m!155751 () Bool)

(assert (=> b!132058 m!155751))

(declare-fun m!155753 () Bool)

(assert (=> b!132058 m!155753))

(declare-fun m!155755 () Bool)

(assert (=> b!132058 m!155755))

(declare-fun m!155757 () Bool)

(assert (=> bm!14472 m!155757))

(declare-fun m!155759 () Bool)

(assert (=> b!132079 m!155759))

(declare-fun m!155761 () Bool)

(assert (=> b!132056 m!155761))

(declare-fun m!155763 () Bool)

(assert (=> bm!14461 m!155763))

(declare-fun m!155765 () Bool)

(assert (=> b!132067 m!155765))

(assert (=> b!132076 m!155557))

(declare-fun m!155767 () Bool)

(assert (=> b!132076 m!155767))

(assert (=> bm!14465 m!155755))

(declare-fun m!155769 () Bool)

(assert (=> bm!14465 m!155769))

(declare-fun m!155771 () Bool)

(assert (=> b!132083 m!155771))

(assert (=> b!132052 m!155673))

(assert (=> b!132049 m!155557))

(declare-fun m!155773 () Bool)

(assert (=> b!132049 m!155773))

(declare-fun m!155775 () Bool)

(assert (=> bm!14460 m!155775))

(declare-fun m!155777 () Bool)

(assert (=> bm!14460 m!155777))

(declare-fun m!155779 () Bool)

(assert (=> bm!14467 m!155779))

(declare-fun m!155781 () Bool)

(assert (=> b!132057 m!155781))

(assert (=> bm!14469 m!155543))

(declare-fun m!155783 () Bool)

(assert (=> bm!14469 m!155783))

(assert (=> b!132062 m!155543))

(declare-fun m!155785 () Bool)

(assert (=> b!132062 m!155785))

(assert (=> bm!14471 m!155543))

(declare-fun m!155787 () Bool)

(assert (=> bm!14471 m!155787))

(assert (=> b!132066 m!155543))

(assert (=> b!132066 m!155783))

(assert (=> bm!14470 m!155545))

(assert (=> bm!14464 m!155543))

(assert (=> bm!14464 m!155557))

(declare-fun m!155789 () Bool)

(assert (=> bm!14464 m!155789))

(declare-fun m!155791 () Bool)

(assert (=> b!132065 m!155791))

(declare-fun m!155793 () Bool)

(assert (=> b!132073 m!155793))

(assert (=> b!131734 d!40285))

(declare-fun d!40287 () Bool)

(declare-fun c!24430 () Bool)

(assert (=> d!40287 (= c!24430 ((_ is ValueCellFull!1091) (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun e!86124 () V!3473)

(assert (=> d!40287 (= (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!86124)))

(declare-fun b!132091 () Bool)

(declare-fun get!1484 (ValueCell!1091 V!3473) V!3473)

(assert (=> b!132091 (= e!86124 (get!1484 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!132092 () Bool)

(declare-fun get!1485 (ValueCell!1091 V!3473) V!3473)

(assert (=> b!132092 (= e!86124 (get!1485 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40287 c!24430) b!132091))

(assert (= (and d!40287 (not c!24430)) b!132092))

(assert (=> b!132091 m!155553))

(assert (=> b!132091 m!155555))

(declare-fun m!155795 () Bool)

(assert (=> b!132091 m!155795))

(assert (=> b!132092 m!155553))

(assert (=> b!132092 m!155555))

(declare-fun m!155797 () Bool)

(assert (=> b!132092 m!155797))

(assert (=> b!131734 d!40287))

(declare-fun d!40289 () Bool)

(assert (=> d!40289 (= (validMask!0 (mask!7147 (v!3187 (underlying!452 thiss!992)))) (and (or (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000001111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000011111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000001111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000011111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000001111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000011111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000000001111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000000011111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000000111111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000001111111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000011111111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000000111111111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000001111111111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000011111111111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000000111111111111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000001111111111111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000011111111111111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000000111111111111111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000001111111111111111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000011111111111111111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00000111111111111111111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00001111111111111111111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00011111111111111111111111111111) (= (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7147 (v!3187 (underlying!452 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!131729 d!40289))

(declare-fun b!132100 () Bool)

(declare-fun e!86129 () Bool)

(assert (=> b!132100 (= e!86129 tp_is_empty!2869)))

(declare-fun mapNonEmpty!4629 () Bool)

(declare-fun mapRes!4629 () Bool)

(declare-fun tp!11181 () Bool)

(declare-fun e!86130 () Bool)

(assert (=> mapNonEmpty!4629 (= mapRes!4629 (and tp!11181 e!86130))))

(declare-fun mapRest!4629 () (Array (_ BitVec 32) ValueCell!1091))

(declare-fun mapValue!4629 () ValueCell!1091)

(declare-fun mapKey!4629 () (_ BitVec 32))

(assert (=> mapNonEmpty!4629 (= mapRest!4613 (store mapRest!4629 mapKey!4629 mapValue!4629))))

(declare-fun b!132099 () Bool)

(assert (=> b!132099 (= e!86130 tp_is_empty!2869)))

(declare-fun mapIsEmpty!4629 () Bool)

(assert (=> mapIsEmpty!4629 mapRes!4629))

(declare-fun condMapEmpty!4629 () Bool)

(declare-fun mapDefault!4629 () ValueCell!1091)

(assert (=> mapNonEmpty!4614 (= condMapEmpty!4629 (= mapRest!4613 ((as const (Array (_ BitVec 32) ValueCell!1091)) mapDefault!4629)))))

(assert (=> mapNonEmpty!4614 (= tp!11152 (and e!86129 mapRes!4629))))

(assert (= (and mapNonEmpty!4614 condMapEmpty!4629) mapIsEmpty!4629))

(assert (= (and mapNonEmpty!4614 (not condMapEmpty!4629)) mapNonEmpty!4629))

(assert (= (and mapNonEmpty!4629 ((_ is ValueCellFull!1091) mapValue!4629)) b!132099))

(assert (= (and mapNonEmpty!4614 ((_ is ValueCellFull!1091) mapDefault!4629)) b!132100))

(declare-fun m!155799 () Bool)

(assert (=> mapNonEmpty!4629 m!155799))

(declare-fun b!132102 () Bool)

(declare-fun e!86131 () Bool)

(assert (=> b!132102 (= e!86131 tp_is_empty!2869)))

(declare-fun mapNonEmpty!4630 () Bool)

(declare-fun mapRes!4630 () Bool)

(declare-fun tp!11182 () Bool)

(declare-fun e!86132 () Bool)

(assert (=> mapNonEmpty!4630 (= mapRes!4630 (and tp!11182 e!86132))))

(declare-fun mapRest!4630 () (Array (_ BitVec 32) ValueCell!1091))

(declare-fun mapValue!4630 () ValueCell!1091)

(declare-fun mapKey!4630 () (_ BitVec 32))

(assert (=> mapNonEmpty!4630 (= mapRest!4614 (store mapRest!4630 mapKey!4630 mapValue!4630))))

(declare-fun b!132101 () Bool)

(assert (=> b!132101 (= e!86132 tp_is_empty!2869)))

(declare-fun mapIsEmpty!4630 () Bool)

(assert (=> mapIsEmpty!4630 mapRes!4630))

(declare-fun condMapEmpty!4630 () Bool)

(declare-fun mapDefault!4630 () ValueCell!1091)

(assert (=> mapNonEmpty!4613 (= condMapEmpty!4630 (= mapRest!4614 ((as const (Array (_ BitVec 32) ValueCell!1091)) mapDefault!4630)))))

(assert (=> mapNonEmpty!4613 (= tp!11154 (and e!86131 mapRes!4630))))

(assert (= (and mapNonEmpty!4613 condMapEmpty!4630) mapIsEmpty!4630))

(assert (= (and mapNonEmpty!4613 (not condMapEmpty!4630)) mapNonEmpty!4630))

(assert (= (and mapNonEmpty!4630 ((_ is ValueCellFull!1091) mapValue!4630)) b!132101))

(assert (= (and mapNonEmpty!4613 ((_ is ValueCellFull!1091) mapDefault!4630)) b!132102))

(declare-fun m!155801 () Bool)

(assert (=> mapNonEmpty!4630 m!155801))

(declare-fun b_lambda!5891 () Bool)

(assert (= b_lambda!5889 (or (and b!131733 b_free!2905) (and b!131735 b_free!2907 (= (defaultEntry!2853 newMap!16) (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))))) b_lambda!5891)))

(check-sat (not bm!14472) (not b!131881) (not b!131949) (not b_lambda!5891) (not bm!14469) (not b!132066) (not b_lambda!5887) (not b!131942) (not b!131892) b_and!8185 (not b!132049) (not bm!14460) (not mapNonEmpty!4630) (not b!131880) (not bm!14387) (not bm!14405) (not d!40281) (not d!40265) (not b!132076) (not b!132079) (not b!132062) (not bm!14406) (not bm!14461) (not b!131954) (not bm!14471) (not mapNonEmpty!4629) (not b!132052) (not b!131948) (not bm!14404) (not b!132058) (not b!131891) (not bm!14470) tp_is_empty!2869 (not bm!14464) (not bm!14465) (not b!131943) (not b_next!2905) b_and!8187 (not d!40275) (not b!131870) (not bm!14467) (not bm!14384) (not b!131937) (not bm!14408) (not b!131964) (not d!40283) (not b!131956) (not bm!14468) (not bm!14477) (not b!131871) (not b!132091) (not b!131882) (not d!40273) (not b!131957) (not b!131872) (not b!132092) (not bm!14475) (not b!131966) (not d!40285) (not b_next!2907))
(check-sat b_and!8185 b_and!8187 (not b_next!2905) (not b_next!2907))
(get-model)

(declare-fun d!40291 () Bool)

(assert (=> d!40291 (= (get!1484 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3186 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> b!132091 d!40291))

(declare-fun d!40293 () Bool)

(declare-fun isEmpty!413 (Option!178) Bool)

(assert (=> d!40293 (= (isDefined!124 (getValueByKey!172 (toList!841 lt!68663) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355))) (not (isEmpty!413 (getValueByKey!172 (toList!841 lt!68663) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))))

(declare-fun bs!5486 () Bool)

(assert (= bs!5486 d!40293))

(assert (=> bs!5486 m!155737))

(declare-fun m!155803 () Bool)

(assert (=> bs!5486 m!155803))

(assert (=> b!131966 d!40293))

(declare-fun b!132111 () Bool)

(declare-fun e!86137 () Option!178)

(assert (=> b!132111 (= e!86137 (Some!177 (_2!1291 (h!2292 (toList!841 lt!68663)))))))

(declare-fun b!132114 () Bool)

(declare-fun e!86138 () Option!178)

(assert (=> b!132114 (= e!86138 None!176)))

(declare-fun b!132112 () Bool)

(assert (=> b!132112 (= e!86137 e!86138)))

(declare-fun c!24436 () Bool)

(assert (=> b!132112 (= c!24436 (and ((_ is Cons!1687) (toList!841 lt!68663)) (not (= (_1!1291 (h!2292 (toList!841 lt!68663))) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))))

(declare-fun b!132113 () Bool)

(assert (=> b!132113 (= e!86138 (getValueByKey!172 (t!6118 (toList!841 lt!68663)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun c!24435 () Bool)

(declare-fun d!40295 () Bool)

(assert (=> d!40295 (= c!24435 (and ((_ is Cons!1687) (toList!841 lt!68663)) (= (_1!1291 (h!2292 (toList!841 lt!68663))) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355))))))

(assert (=> d!40295 (= (getValueByKey!172 (toList!841 lt!68663) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)) e!86137)))

(assert (= (and d!40295 c!24435) b!132111))

(assert (= (and d!40295 (not c!24435)) b!132112))

(assert (= (and b!132112 c!24436) b!132113))

(assert (= (and b!132112 (not c!24436)) b!132114))

(assert (=> b!132113 m!155543))

(declare-fun m!155805 () Bool)

(assert (=> b!132113 m!155805))

(assert (=> b!131966 d!40295))

(declare-fun b!132127 () Bool)

(declare-fun c!24445 () Bool)

(declare-fun lt!68860 () (_ BitVec 64))

(assert (=> b!132127 (= c!24445 (= lt!68860 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!86145 () SeekEntryResult!268)

(declare-fun e!86146 () SeekEntryResult!268)

(assert (=> b!132127 (= e!86145 e!86146)))

(declare-fun d!40297 () Bool)

(declare-fun lt!68858 () SeekEntryResult!268)

(assert (=> d!40297 (and (or ((_ is Undefined!268) lt!68858) (not ((_ is Found!268) lt!68858)) (and (bvsge (index!3232 lt!68858) #b00000000000000000000000000000000) (bvslt (index!3232 lt!68858) (size!2514 (_keys!4600 newMap!16))))) (or ((_ is Undefined!268) lt!68858) ((_ is Found!268) lt!68858) (not ((_ is MissingZero!268) lt!68858)) (and (bvsge (index!3231 lt!68858) #b00000000000000000000000000000000) (bvslt (index!3231 lt!68858) (size!2514 (_keys!4600 newMap!16))))) (or ((_ is Undefined!268) lt!68858) ((_ is Found!268) lt!68858) ((_ is MissingZero!268) lt!68858) (not ((_ is MissingVacant!268) lt!68858)) (and (bvsge (index!3234 lt!68858) #b00000000000000000000000000000000) (bvslt (index!3234 lt!68858) (size!2514 (_keys!4600 newMap!16))))) (or ((_ is Undefined!268) lt!68858) (ite ((_ is Found!268) lt!68858) (= (select (arr!2246 (_keys!4600 newMap!16)) (index!3232 lt!68858)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)) (ite ((_ is MissingZero!268) lt!68858) (= (select (arr!2246 (_keys!4600 newMap!16)) (index!3231 lt!68858)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!268) lt!68858) (= (select (arr!2246 (_keys!4600 newMap!16)) (index!3234 lt!68858)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!86147 () SeekEntryResult!268)

(assert (=> d!40297 (= lt!68858 e!86147)))

(declare-fun c!24444 () Bool)

(declare-fun lt!68859 () SeekEntryResult!268)

(assert (=> d!40297 (= c!24444 (and ((_ is Intermediate!268) lt!68859) (undefined!1080 lt!68859)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4749 (_ BitVec 32)) SeekEntryResult!268)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!40297 (= lt!68859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (mask!7147 newMap!16)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4600 newMap!16) (mask!7147 newMap!16)))))

(assert (=> d!40297 (validMask!0 (mask!7147 newMap!16))))

(assert (=> d!40297 (= (seekEntryOrOpen!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4600 newMap!16) (mask!7147 newMap!16)) lt!68858)))

(declare-fun b!132128 () Bool)

(assert (=> b!132128 (= e!86147 e!86145)))

(assert (=> b!132128 (= lt!68860 (select (arr!2246 (_keys!4600 newMap!16)) (index!3233 lt!68859)))))

(declare-fun c!24443 () Bool)

(assert (=> b!132128 (= c!24443 (= lt!68860 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun b!132129 () Bool)

(assert (=> b!132129 (= e!86145 (Found!268 (index!3233 lt!68859)))))

(declare-fun b!132130 () Bool)

(assert (=> b!132130 (= e!86147 Undefined!268)))

(declare-fun b!132131 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4749 (_ BitVec 32)) SeekEntryResult!268)

(assert (=> b!132131 (= e!86146 (seekKeyOrZeroReturnVacant!0 (x!15496 lt!68859) (index!3233 lt!68859) (index!3233 lt!68859) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4600 newMap!16) (mask!7147 newMap!16)))))

(declare-fun b!132132 () Bool)

(assert (=> b!132132 (= e!86146 (MissingZero!268 (index!3233 lt!68859)))))

(assert (= (and d!40297 c!24444) b!132130))

(assert (= (and d!40297 (not c!24444)) b!132128))

(assert (= (and b!132128 c!24443) b!132129))

(assert (= (and b!132128 (not c!24443)) b!132127))

(assert (= (and b!132127 c!24445) b!132132))

(assert (= (and b!132127 (not c!24445)) b!132131))

(declare-fun m!155807 () Bool)

(assert (=> d!40297 m!155807))

(assert (=> d!40297 m!155543))

(declare-fun m!155809 () Bool)

(assert (=> d!40297 m!155809))

(declare-fun m!155811 () Bool)

(assert (=> d!40297 m!155811))

(assert (=> d!40297 m!155543))

(assert (=> d!40297 m!155807))

(declare-fun m!155813 () Bool)

(assert (=> d!40297 m!155813))

(declare-fun m!155815 () Bool)

(assert (=> d!40297 m!155815))

(declare-fun m!155817 () Bool)

(assert (=> d!40297 m!155817))

(declare-fun m!155819 () Bool)

(assert (=> b!132128 m!155819))

(assert (=> b!132131 m!155543))

(declare-fun m!155821 () Bool)

(assert (=> b!132131 m!155821))

(assert (=> b!132066 d!40297))

(declare-fun d!40299 () Bool)

(declare-fun e!86149 () Bool)

(assert (=> d!40299 e!86149))

(declare-fun res!63603 () Bool)

(assert (=> d!40299 (=> res!63603 e!86149)))

(declare-fun lt!68862 () Bool)

(assert (=> d!40299 (= res!63603 (not lt!68862))))

(declare-fun lt!68863 () Bool)

(assert (=> d!40299 (= lt!68862 lt!68863)))

(declare-fun lt!68864 () Unit!4122)

(declare-fun e!86148 () Unit!4122)

(assert (=> d!40299 (= lt!68864 e!86148)))

(declare-fun c!24446 () Bool)

(assert (=> d!40299 (= c!24446 lt!68863)))

(assert (=> d!40299 (= lt!68863 (containsKey!175 (toList!841 call!14467) (ite c!24415 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (select (arr!2246 (_keys!4600 newMap!16)) (index!3232 lt!68835)))))))

(assert (=> d!40299 (= (contains!881 call!14467 (ite c!24415 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (select (arr!2246 (_keys!4600 newMap!16)) (index!3232 lt!68835)))) lt!68862)))

(declare-fun b!132133 () Bool)

(declare-fun lt!68861 () Unit!4122)

(assert (=> b!132133 (= e!86148 lt!68861)))

(assert (=> b!132133 (= lt!68861 (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!841 call!14467) (ite c!24415 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (select (arr!2246 (_keys!4600 newMap!16)) (index!3232 lt!68835)))))))

(assert (=> b!132133 (isDefined!124 (getValueByKey!172 (toList!841 call!14467) (ite c!24415 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (select (arr!2246 (_keys!4600 newMap!16)) (index!3232 lt!68835)))))))

(declare-fun b!132134 () Bool)

(declare-fun Unit!4128 () Unit!4122)

(assert (=> b!132134 (= e!86148 Unit!4128)))

(declare-fun b!132135 () Bool)

(assert (=> b!132135 (= e!86149 (isDefined!124 (getValueByKey!172 (toList!841 call!14467) (ite c!24415 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (select (arr!2246 (_keys!4600 newMap!16)) (index!3232 lt!68835))))))))

(assert (= (and d!40299 c!24446) b!132133))

(assert (= (and d!40299 (not c!24446)) b!132134))

(assert (= (and d!40299 (not res!63603)) b!132135))

(declare-fun m!155823 () Bool)

(assert (=> d!40299 m!155823))

(declare-fun m!155825 () Bool)

(assert (=> b!132133 m!155825))

(declare-fun m!155827 () Bool)

(assert (=> b!132133 m!155827))

(assert (=> b!132133 m!155827))

(declare-fun m!155829 () Bool)

(assert (=> b!132133 m!155829))

(assert (=> b!132135 m!155827))

(assert (=> b!132135 m!155827))

(assert (=> b!132135 m!155829))

(assert (=> bm!14460 d!40299))

(declare-fun d!40301 () Bool)

(declare-fun e!86151 () Bool)

(assert (=> d!40301 e!86151))

(declare-fun res!63604 () Bool)

(assert (=> d!40301 (=> res!63604 e!86151)))

(declare-fun lt!68866 () Bool)

(assert (=> d!40301 (= res!63604 (not lt!68866))))

(declare-fun lt!68867 () Bool)

(assert (=> d!40301 (= lt!68866 lt!68867)))

(declare-fun lt!68868 () Unit!4122)

(declare-fun e!86150 () Unit!4122)

(assert (=> d!40301 (= lt!68868 e!86150)))

(declare-fun c!24447 () Bool)

(assert (=> d!40301 (= c!24447 lt!68867)))

(assert (=> d!40301 (= lt!68867 (containsKey!175 (toList!841 lt!68742) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!40301 (= (contains!881 lt!68742 #b1000000000000000000000000000000000000000000000000000000000000000) lt!68866)))

(declare-fun b!132136 () Bool)

(declare-fun lt!68865 () Unit!4122)

(assert (=> b!132136 (= e!86150 lt!68865)))

(assert (=> b!132136 (= lt!68865 (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!841 lt!68742) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132136 (isDefined!124 (getValueByKey!172 (toList!841 lt!68742) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132137 () Bool)

(declare-fun Unit!4129 () Unit!4122)

(assert (=> b!132137 (= e!86150 Unit!4129)))

(declare-fun b!132138 () Bool)

(assert (=> b!132138 (= e!86151 (isDefined!124 (getValueByKey!172 (toList!841 lt!68742) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40301 c!24447) b!132136))

(assert (= (and d!40301 (not c!24447)) b!132137))

(assert (= (and d!40301 (not res!63604)) b!132138))

(declare-fun m!155831 () Bool)

(assert (=> d!40301 m!155831))

(declare-fun m!155833 () Bool)

(assert (=> b!132136 m!155833))

(declare-fun m!155835 () Bool)

(assert (=> b!132136 m!155835))

(assert (=> b!132136 m!155835))

(declare-fun m!155837 () Bool)

(assert (=> b!132136 m!155837))

(assert (=> b!132138 m!155835))

(assert (=> b!132138 m!155835))

(assert (=> b!132138 m!155837))

(assert (=> bm!14405 d!40301))

(declare-fun d!40303 () Bool)

(assert (=> d!40303 (isDefined!124 (getValueByKey!172 (toList!841 lt!68663) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun lt!68871 () Unit!4122)

(declare-fun choose!815 (List!1691 (_ BitVec 64)) Unit!4122)

(assert (=> d!40303 (= lt!68871 (choose!815 (toList!841 lt!68663) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun e!86154 () Bool)

(assert (=> d!40303 e!86154))

(declare-fun res!63607 () Bool)

(assert (=> d!40303 (=> (not res!63607) (not e!86154))))

(declare-fun isStrictlySorted!308 (List!1691) Bool)

(assert (=> d!40303 (= res!63607 (isStrictlySorted!308 (toList!841 lt!68663)))))

(assert (=> d!40303 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!841 lt!68663) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)) lt!68871)))

(declare-fun b!132141 () Bool)

(assert (=> b!132141 (= e!86154 (containsKey!175 (toList!841 lt!68663) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (= (and d!40303 res!63607) b!132141))

(assert (=> d!40303 m!155543))

(assert (=> d!40303 m!155737))

(assert (=> d!40303 m!155737))

(assert (=> d!40303 m!155739))

(assert (=> d!40303 m!155543))

(declare-fun m!155839 () Bool)

(assert (=> d!40303 m!155839))

(declare-fun m!155841 () Bool)

(assert (=> d!40303 m!155841))

(assert (=> b!132141 m!155543))

(assert (=> b!132141 m!155733))

(assert (=> b!131964 d!40303))

(assert (=> b!131964 d!40293))

(assert (=> b!131964 d!40295))

(declare-fun d!40305 () Bool)

(assert (=> d!40305 (= (validKeyInArray!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131943 d!40305))

(declare-fun bm!14481 () Bool)

(declare-fun call!14490 () ListLongMap!1651)

(declare-fun call!14489 () ListLongMap!1651)

(assert (=> bm!14481 (= call!14490 call!14489)))

(declare-fun b!132142 () Bool)

(declare-fun e!86166 () Bool)

(declare-fun lt!68877 () ListLongMap!1651)

(assert (=> b!132142 (= e!86166 (= (apply!115 lt!68877 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2709 newMap!16)))))

(declare-fun bm!14482 () Bool)

(declare-fun call!14485 () ListLongMap!1651)

(declare-fun call!14488 () ListLongMap!1651)

(assert (=> bm!14482 (= call!14485 call!14488)))

(declare-fun b!132143 () Bool)

(declare-fun c!24450 () Bool)

(assert (=> b!132143 (= c!24450 (and (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!86158 () ListLongMap!1651)

(declare-fun e!86160 () ListLongMap!1651)

(assert (=> b!132143 (= e!86158 e!86160)))

(declare-fun b!132144 () Bool)

(declare-fun e!86156 () ListLongMap!1651)

(assert (=> b!132144 (= e!86156 e!86158)))

(declare-fun c!24449 () Bool)

(assert (=> b!132144 (= c!24449 (and (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!132145 () Bool)

(assert (=> b!132145 (= e!86160 call!14490)))

(declare-fun b!132146 () Bool)

(declare-fun res!63615 () Bool)

(declare-fun e!86159 () Bool)

(assert (=> b!132146 (=> (not res!63615) (not e!86159))))

(declare-fun e!86167 () Bool)

(assert (=> b!132146 (= res!63615 e!86167)))

(declare-fun c!24451 () Bool)

(assert (=> b!132146 (= c!24451 (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!14483 () Bool)

(assert (=> bm!14483 (= call!14488 (getCurrentListMapNoExtraKeys!135 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun bm!14484 () Bool)

(declare-fun call!14486 () Bool)

(assert (=> bm!14484 (= call!14486 (contains!881 lt!68877 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132147 () Bool)

(assert (=> b!132147 (= e!86156 (+!168 call!14489 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 newMap!16))))))

(declare-fun b!132148 () Bool)

(declare-fun e!86162 () Bool)

(assert (=> b!132148 (= e!86162 (validKeyInArray!0 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!132149 () Bool)

(declare-fun call!14487 () Bool)

(assert (=> b!132149 (= e!86167 (not call!14487))))

(declare-fun b!132150 () Bool)

(declare-fun e!86157 () Bool)

(assert (=> b!132150 (= e!86157 (not call!14486))))

(declare-fun b!132151 () Bool)

(assert (=> b!132151 (= e!86159 e!86157)))

(declare-fun c!24453 () Bool)

(assert (=> b!132151 (= c!24453 (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14485 () Bool)

(assert (=> bm!14485 (= call!14487 (contains!881 lt!68877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!40307 () Bool)

(assert (=> d!40307 e!86159))

(declare-fun res!63609 () Bool)

(assert (=> d!40307 (=> (not res!63609) (not e!86159))))

(assert (=> d!40307 (= res!63609 (or (bvsge #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))))

(declare-fun lt!68891 () ListLongMap!1651)

(assert (=> d!40307 (= lt!68877 lt!68891)))

(declare-fun lt!68873 () Unit!4122)

(declare-fun e!86163 () Unit!4122)

(assert (=> d!40307 (= lt!68873 e!86163)))

(declare-fun c!24452 () Bool)

(declare-fun e!86155 () Bool)

(assert (=> d!40307 (= c!24452 e!86155)))

(declare-fun res!63612 () Bool)

(assert (=> d!40307 (=> (not res!63612) (not e!86155))))

(assert (=> d!40307 (= res!63612 (bvslt #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))

(assert (=> d!40307 (= lt!68891 e!86156)))

(declare-fun c!24448 () Bool)

(assert (=> d!40307 (= c!24448 (and (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40307 (validMask!0 (mask!7147 newMap!16))))

(assert (=> d!40307 (= (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) lt!68877)))

(declare-fun b!132152 () Bool)

(declare-fun Unit!4130 () Unit!4122)

(assert (=> b!132152 (= e!86163 Unit!4130)))

(declare-fun b!132153 () Bool)

(declare-fun e!86161 () Bool)

(declare-fun e!86164 () Bool)

(assert (=> b!132153 (= e!86161 e!86164)))

(declare-fun res!63616 () Bool)

(assert (=> b!132153 (=> (not res!63616) (not e!86164))))

(assert (=> b!132153 (= res!63616 (contains!881 lt!68877 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!132153 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))

(declare-fun b!132154 () Bool)

(declare-fun e!86165 () Bool)

(assert (=> b!132154 (= e!86165 (= (apply!115 lt!68877 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2709 newMap!16)))))

(declare-fun b!132155 () Bool)

(assert (=> b!132155 (= e!86167 e!86166)))

(declare-fun res!63614 () Bool)

(assert (=> b!132155 (= res!63614 call!14487)))

(assert (=> b!132155 (=> (not res!63614) (not e!86166))))

(declare-fun bm!14486 () Bool)

(declare-fun call!14484 () ListLongMap!1651)

(assert (=> bm!14486 (= call!14484 call!14485)))

(declare-fun b!132156 () Bool)

(assert (=> b!132156 (= e!86158 call!14490)))

(declare-fun b!132157 () Bool)

(assert (=> b!132157 (= e!86160 call!14484)))

(declare-fun b!132158 () Bool)

(assert (=> b!132158 (= e!86157 e!86165)))

(declare-fun res!63610 () Bool)

(assert (=> b!132158 (= res!63610 call!14486)))

(assert (=> b!132158 (=> (not res!63610) (not e!86165))))

(declare-fun b!132159 () Bool)

(declare-fun lt!68887 () Unit!4122)

(assert (=> b!132159 (= e!86163 lt!68887)))

(declare-fun lt!68892 () ListLongMap!1651)

(assert (=> b!132159 (= lt!68892 (getCurrentListMapNoExtraKeys!135 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68890 () (_ BitVec 64))

(assert (=> b!132159 (= lt!68890 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68893 () (_ BitVec 64))

(assert (=> b!132159 (= lt!68893 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68878 () Unit!4122)

(assert (=> b!132159 (= lt!68878 (addStillContains!91 lt!68892 lt!68890 (zeroValue!2709 newMap!16) lt!68893))))

(assert (=> b!132159 (contains!881 (+!168 lt!68892 (tuple2!2561 lt!68890 (zeroValue!2709 newMap!16))) lt!68893)))

(declare-fun lt!68879 () Unit!4122)

(assert (=> b!132159 (= lt!68879 lt!68878)))

(declare-fun lt!68881 () ListLongMap!1651)

(assert (=> b!132159 (= lt!68881 (getCurrentListMapNoExtraKeys!135 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68874 () (_ BitVec 64))

(assert (=> b!132159 (= lt!68874 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68882 () (_ BitVec 64))

(assert (=> b!132159 (= lt!68882 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68875 () Unit!4122)

(assert (=> b!132159 (= lt!68875 (addApplyDifferent!91 lt!68881 lt!68874 (minValue!2709 newMap!16) lt!68882))))

(assert (=> b!132159 (= (apply!115 (+!168 lt!68881 (tuple2!2561 lt!68874 (minValue!2709 newMap!16))) lt!68882) (apply!115 lt!68881 lt!68882))))

(declare-fun lt!68876 () Unit!4122)

(assert (=> b!132159 (= lt!68876 lt!68875)))

(declare-fun lt!68886 () ListLongMap!1651)

(assert (=> b!132159 (= lt!68886 (getCurrentListMapNoExtraKeys!135 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68872 () (_ BitVec 64))

(assert (=> b!132159 (= lt!68872 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68883 () (_ BitVec 64))

(assert (=> b!132159 (= lt!68883 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68880 () Unit!4122)

(assert (=> b!132159 (= lt!68880 (addApplyDifferent!91 lt!68886 lt!68872 (zeroValue!2709 newMap!16) lt!68883))))

(assert (=> b!132159 (= (apply!115 (+!168 lt!68886 (tuple2!2561 lt!68872 (zeroValue!2709 newMap!16))) lt!68883) (apply!115 lt!68886 lt!68883))))

(declare-fun lt!68885 () Unit!4122)

(assert (=> b!132159 (= lt!68885 lt!68880)))

(declare-fun lt!68888 () ListLongMap!1651)

(assert (=> b!132159 (= lt!68888 (getCurrentListMapNoExtraKeys!135 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68889 () (_ BitVec 64))

(assert (=> b!132159 (= lt!68889 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68884 () (_ BitVec 64))

(assert (=> b!132159 (= lt!68884 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!132159 (= lt!68887 (addApplyDifferent!91 lt!68888 lt!68889 (minValue!2709 newMap!16) lt!68884))))

(assert (=> b!132159 (= (apply!115 (+!168 lt!68888 (tuple2!2561 lt!68889 (minValue!2709 newMap!16))) lt!68884) (apply!115 lt!68888 lt!68884))))

(declare-fun bm!14487 () Bool)

(assert (=> bm!14487 (= call!14489 (+!168 (ite c!24448 call!14488 (ite c!24449 call!14485 call!14484)) (ite (or c!24448 c!24449) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 newMap!16)))))))

(declare-fun b!132160 () Bool)

(declare-fun res!63613 () Bool)

(assert (=> b!132160 (=> (not res!63613) (not e!86159))))

(assert (=> b!132160 (= res!63613 e!86161)))

(declare-fun res!63608 () Bool)

(assert (=> b!132160 (=> res!63608 e!86161)))

(assert (=> b!132160 (= res!63608 (not e!86162))))

(declare-fun res!63611 () Bool)

(assert (=> b!132160 (=> (not res!63611) (not e!86162))))

(assert (=> b!132160 (= res!63611 (bvslt #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))

(declare-fun b!132161 () Bool)

(assert (=> b!132161 (= e!86155 (validKeyInArray!0 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!132162 () Bool)

(assert (=> b!132162 (= e!86164 (= (apply!115 lt!68877 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)) (get!1483 (select (arr!2247 (_values!2836 newMap!16)) #b00000000000000000000000000000000) (dynLambda!425 (defaultEntry!2853 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!132162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2515 (_values!2836 newMap!16))))))

(assert (=> b!132162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))

(assert (= (and d!40307 c!24448) b!132147))

(assert (= (and d!40307 (not c!24448)) b!132144))

(assert (= (and b!132144 c!24449) b!132156))

(assert (= (and b!132144 (not c!24449)) b!132143))

(assert (= (and b!132143 c!24450) b!132145))

(assert (= (and b!132143 (not c!24450)) b!132157))

(assert (= (or b!132145 b!132157) bm!14486))

(assert (= (or b!132156 bm!14486) bm!14482))

(assert (= (or b!132156 b!132145) bm!14481))

(assert (= (or b!132147 bm!14482) bm!14483))

(assert (= (or b!132147 bm!14481) bm!14487))

(assert (= (and d!40307 res!63612) b!132161))

(assert (= (and d!40307 c!24452) b!132159))

(assert (= (and d!40307 (not c!24452)) b!132152))

(assert (= (and d!40307 res!63609) b!132160))

(assert (= (and b!132160 res!63611) b!132148))

(assert (= (and b!132160 (not res!63608)) b!132153))

(assert (= (and b!132153 res!63616) b!132162))

(assert (= (and b!132160 res!63613) b!132146))

(assert (= (and b!132146 c!24451) b!132155))

(assert (= (and b!132146 (not c!24451)) b!132149))

(assert (= (and b!132155 res!63614) b!132142))

(assert (= (or b!132155 b!132149) bm!14485))

(assert (= (and b!132146 res!63615) b!132151))

(assert (= (and b!132151 c!24453) b!132158))

(assert (= (and b!132151 (not c!24453)) b!132150))

(assert (= (and b!132158 res!63610) b!132154))

(assert (= (or b!132158 b!132150) bm!14484))

(declare-fun b_lambda!5893 () Bool)

(assert (=> (not b_lambda!5893) (not b!132162)))

(declare-fun t!6129 () Bool)

(declare-fun tb!2401 () Bool)

(assert (=> (and b!131733 (= (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) (defaultEntry!2853 newMap!16)) t!6129) tb!2401))

(declare-fun result!3969 () Bool)

(assert (=> tb!2401 (= result!3969 tp_is_empty!2869)))

(assert (=> b!132162 t!6129))

(declare-fun b_and!8189 () Bool)

(assert (= b_and!8185 (and (=> t!6129 result!3969) b_and!8189)))

(declare-fun t!6131 () Bool)

(declare-fun tb!2403 () Bool)

(assert (=> (and b!131735 (= (defaultEntry!2853 newMap!16) (defaultEntry!2853 newMap!16)) t!6131) tb!2403))

(declare-fun result!3971 () Bool)

(assert (= result!3971 result!3969))

(assert (=> b!132162 t!6131))

(declare-fun b_and!8191 () Bool)

(assert (= b_and!8187 (and (=> t!6131 result!3971) b_and!8191)))

(declare-fun m!155843 () Bool)

(assert (=> b!132159 m!155843))

(declare-fun m!155845 () Bool)

(assert (=> b!132159 m!155845))

(declare-fun m!155847 () Bool)

(assert (=> b!132159 m!155847))

(declare-fun m!155849 () Bool)

(assert (=> b!132159 m!155849))

(declare-fun m!155851 () Bool)

(assert (=> b!132159 m!155851))

(declare-fun m!155853 () Bool)

(assert (=> b!132159 m!155853))

(declare-fun m!155855 () Bool)

(assert (=> b!132159 m!155855))

(assert (=> b!132159 m!155853))

(declare-fun m!155857 () Bool)

(assert (=> b!132159 m!155857))

(assert (=> b!132159 m!155845))

(declare-fun m!155859 () Bool)

(assert (=> b!132159 m!155859))

(assert (=> b!132159 m!155849))

(declare-fun m!155861 () Bool)

(assert (=> b!132159 m!155861))

(declare-fun m!155863 () Bool)

(assert (=> b!132159 m!155863))

(assert (=> b!132159 m!155863))

(declare-fun m!155865 () Bool)

(assert (=> b!132159 m!155865))

(declare-fun m!155867 () Bool)

(assert (=> b!132159 m!155867))

(declare-fun m!155869 () Bool)

(assert (=> b!132159 m!155869))

(declare-fun m!155871 () Bool)

(assert (=> b!132159 m!155871))

(declare-fun m!155873 () Bool)

(assert (=> b!132159 m!155873))

(declare-fun m!155875 () Bool)

(assert (=> b!132159 m!155875))

(declare-fun m!155877 () Bool)

(assert (=> bm!14484 m!155877))

(assert (=> bm!14483 m!155875))

(declare-fun m!155879 () Bool)

(assert (=> b!132162 m!155879))

(assert (=> b!132162 m!155855))

(assert (=> b!132162 m!155855))

(declare-fun m!155881 () Bool)

(assert (=> b!132162 m!155881))

(declare-fun m!155883 () Bool)

(assert (=> b!132162 m!155883))

(assert (=> b!132162 m!155879))

(assert (=> b!132162 m!155883))

(declare-fun m!155885 () Bool)

(assert (=> b!132162 m!155885))

(declare-fun m!155887 () Bool)

(assert (=> b!132154 m!155887))

(assert (=> b!132161 m!155855))

(assert (=> b!132161 m!155855))

(declare-fun m!155889 () Bool)

(assert (=> b!132161 m!155889))

(assert (=> d!40307 m!155815))

(declare-fun m!155891 () Bool)

(assert (=> b!132147 m!155891))

(declare-fun m!155893 () Bool)

(assert (=> bm!14487 m!155893))

(assert (=> b!132148 m!155855))

(assert (=> b!132148 m!155855))

(assert (=> b!132148 m!155889))

(assert (=> b!132153 m!155855))

(assert (=> b!132153 m!155855))

(declare-fun m!155895 () Bool)

(assert (=> b!132153 m!155895))

(declare-fun m!155897 () Bool)

(assert (=> b!132142 m!155897))

(declare-fun m!155899 () Bool)

(assert (=> bm!14485 m!155899))

(assert (=> d!40273 d!40307))

(declare-fun d!40309 () Bool)

(declare-fun get!1486 (Option!178) V!3473)

(assert (=> d!40309 (= (apply!115 lt!68742 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1486 (getValueByKey!172 (toList!841 lt!68742) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5487 () Bool)

(assert (= bs!5487 d!40309))

(assert (=> bs!5487 m!155687))

(declare-fun m!155901 () Bool)

(assert (=> bs!5487 m!155901))

(assert (=> bs!5487 m!155901))

(declare-fun m!155903 () Bool)

(assert (=> bs!5487 m!155903))

(assert (=> b!131957 d!40309))

(declare-fun d!40311 () Bool)

(declare-fun c!24454 () Bool)

(assert (=> d!40311 (= c!24454 ((_ is ValueCellFull!1091) (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!86168 () V!3473)

(assert (=> d!40311 (= (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!86168)))

(declare-fun b!132163 () Bool)

(assert (=> b!132163 (= e!86168 (get!1484 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!132164 () Bool)

(assert (=> b!132164 (= e!86168 (get!1485 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40311 c!24454) b!132163))

(assert (= (and d!40311 (not c!24454)) b!132164))

(assert (=> b!132163 m!155711))

(assert (=> b!132163 m!155555))

(declare-fun m!155905 () Bool)

(assert (=> b!132163 m!155905))

(assert (=> b!132164 m!155711))

(assert (=> b!132164 m!155555))

(declare-fun m!155907 () Bool)

(assert (=> b!132164 m!155907))

(assert (=> b!131957 d!40311))

(declare-fun b!132199 () Bool)

(declare-fun res!63639 () Bool)

(declare-fun call!14500 () Bool)

(assert (=> b!132199 (= res!63639 call!14500)))

(declare-fun e!86190 () Bool)

(assert (=> b!132199 (=> (not res!63639) (not e!86190))))

(declare-fun e!86191 () Bool)

(declare-fun b!132200 () Bool)

(declare-fun lt!68956 () tuple2!2562)

(assert (=> b!132200 (= e!86191 (= (map!1395 (_2!1292 lt!68956)) (+!168 (map!1395 newMap!16) (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!132201 () Bool)

(declare-fun c!24466 () Bool)

(declare-fun lt!68973 () SeekEntryResult!268)

(assert (=> b!132201 (= c!24466 ((_ is MissingVacant!268) lt!68973))))

(declare-fun e!86185 () Bool)

(declare-fun e!86187 () Bool)

(assert (=> b!132201 (= e!86185 e!86187)))

(declare-fun bm!14496 () Bool)

(declare-fun call!14499 () SeekEntryResult!268)

(assert (=> bm!14496 (= call!14499 (seekEntryOrOpen!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4600 newMap!16) (mask!7147 newMap!16)))))

(declare-fun b!132202 () Bool)

(declare-fun e!86189 () Unit!4122)

(declare-fun lt!68975 () Unit!4122)

(assert (=> b!132202 (= e!86189 lt!68975)))

(assert (=> b!132202 (= lt!68975 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!60 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (defaultEntry!2853 newMap!16)))))

(assert (=> b!132202 (= lt!68973 call!14499)))

(declare-fun c!24463 () Bool)

(assert (=> b!132202 (= c!24463 ((_ is MissingZero!268) lt!68973))))

(assert (=> b!132202 e!86185))

(declare-fun bm!14497 () Bool)

(declare-fun call!14501 () Bool)

(assert (=> bm!14497 (= call!14501 call!14500)))

(declare-fun call!14502 () Bool)

(declare-fun bm!14498 () Bool)

(assert (=> bm!14498 (= call!14502 (arrayContainsKey!0 (_keys!4600 newMap!16) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!132203 () Bool)

(declare-fun e!86188 () Bool)

(assert (=> b!132203 (= e!86188 (not call!14502))))

(declare-fun b!132204 () Bool)

(declare-fun res!63643 () Bool)

(assert (=> b!132204 (=> (not res!63643) (not e!86188))))

(assert (=> b!132204 (= res!63643 call!14501)))

(assert (=> b!132204 (= e!86185 e!86188)))

(declare-fun lt!68983 () SeekEntryResult!268)

(declare-fun b!132205 () Bool)

(assert (=> b!132205 (= e!86190 (= (select (arr!2246 (_keys!4600 newMap!16)) (index!3232 lt!68983)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun b!132206 () Bool)

(declare-fun e!86192 () Bool)

(assert (=> b!132206 (= e!86187 e!86192)))

(declare-fun res!63637 () Bool)

(assert (=> b!132206 (= res!63637 call!14501)))

(assert (=> b!132206 (=> (not res!63637) (not e!86192))))

(declare-fun b!132207 () Bool)

(declare-fun res!63636 () Bool)

(assert (=> b!132207 (=> (not res!63636) (not e!86188))))

(assert (=> b!132207 (= res!63636 (= (select (arr!2246 (_keys!4600 newMap!16)) (index!3231 lt!68973)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132208 () Bool)

(declare-fun res!63641 () Bool)

(assert (=> b!132208 (=> (not res!63641) (not e!86191))))

(assert (=> b!132208 (= res!63641 (contains!881 (map!1395 (_2!1292 lt!68956)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun b!132209 () Bool)

(declare-fun Unit!4131 () Unit!4122)

(assert (=> b!132209 (= e!86189 Unit!4131)))

(declare-fun lt!68982 () Unit!4122)

(assert (=> b!132209 (= lt!68982 (lemmaInListMapThenSeekEntryOrOpenFindsIt!60 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (defaultEntry!2853 newMap!16)))))

(assert (=> b!132209 (= lt!68983 call!14499)))

(declare-fun res!63635 () Bool)

(assert (=> b!132209 (= res!63635 ((_ is Found!268) lt!68983))))

(assert (=> b!132209 (=> (not res!63635) (not e!86190))))

(assert (=> b!132209 e!86190))

(declare-fun lt!68980 () Unit!4122)

(assert (=> b!132209 (= lt!68980 lt!68982)))

(assert (=> b!132209 false))

(declare-fun b!132210 () Bool)

(assert (=> b!132210 (= e!86187 ((_ is Undefined!268) lt!68973))))

(declare-fun bm!14499 () Bool)

(declare-fun c!24465 () Bool)

(assert (=> bm!14499 (= call!14500 (inRange!0 (ite c!24465 (index!3232 lt!68983) (ite c!24463 (index!3231 lt!68973) (index!3234 lt!68973))) (mask!7147 newMap!16)))))

(declare-fun b!132211 () Bool)

(declare-fun res!63642 () Bool)

(assert (=> b!132211 (=> (not res!63642) (not e!86191))))

(assert (=> b!132211 (= res!63642 (valid!540 (_2!1292 lt!68956)))))

(declare-fun b!132212 () Bool)

(declare-fun e!86186 () Unit!4122)

(declare-fun Unit!4132 () Unit!4122)

(assert (=> b!132212 (= e!86186 Unit!4132)))

(declare-fun b!132213 () Bool)

(declare-fun res!63640 () Bool)

(assert (=> b!132213 (= res!63640 (= (select (arr!2246 (_keys!4600 newMap!16)) (index!3234 lt!68973)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132213 (=> (not res!63640) (not e!86192))))

(declare-fun d!40313 () Bool)

(assert (=> d!40313 e!86191))

(declare-fun res!63638 () Bool)

(assert (=> d!40313 (=> (not res!63638) (not e!86191))))

(assert (=> d!40313 (= res!63638 (_1!1292 lt!68956))))

(assert (=> d!40313 (= lt!68956 (tuple2!2563 true (LongMapFixedSize!1091 (defaultEntry!2853 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (bvadd (_size!594 newMap!16) #b00000000000000000000000000000001) (array!4750 (store (arr!2246 (_keys!4600 newMap!16)) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)) (size!2514 (_keys!4600 newMap!16))) (array!4752 (store (arr!2247 (_values!2836 newMap!16)) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (ValueCellFull!1091 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2515 (_values!2836 newMap!16))) (_vacant!594 newMap!16))))))

(declare-fun lt!68981 () Unit!4122)

(declare-fun lt!68976 () Unit!4122)

(assert (=> d!40313 (= lt!68981 lt!68976)))

(declare-fun lt!68967 () array!4749)

(declare-fun lt!68974 () array!4751)

(assert (=> d!40313 (contains!881 (getCurrentListMap!517 lt!68967 lt!68974 (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (select (store (arr!2246 (_keys!4600 newMap!16)) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835))))))

(assert (=> d!40313 (= lt!68976 (lemmaValidKeyInArrayIsInListMap!120 lt!68967 lt!68974 (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (defaultEntry!2853 newMap!16)))))

(assert (=> d!40313 (= lt!68974 (array!4752 (store (arr!2247 (_values!2836 newMap!16)) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (ValueCellFull!1091 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2515 (_values!2836 newMap!16))))))

(assert (=> d!40313 (= lt!68967 (array!4750 (store (arr!2246 (_keys!4600 newMap!16)) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)) (size!2514 (_keys!4600 newMap!16))))))

(declare-fun lt!68958 () Unit!4122)

(declare-fun lt!68961 () Unit!4122)

(assert (=> d!40313 (= lt!68958 lt!68961)))

(declare-fun lt!68971 () array!4749)

(assert (=> d!40313 (= (arrayCountValidKeys!0 lt!68971 (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (bvadd (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4749 (_ BitVec 32)) Unit!4122)

(assert (=> d!40313 (= lt!68961 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!68971 (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835))))))

(assert (=> d!40313 (= lt!68971 (array!4750 (store (arr!2246 (_keys!4600 newMap!16)) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)) (size!2514 (_keys!4600 newMap!16))))))

(declare-fun lt!68970 () Unit!4122)

(declare-fun lt!68968 () Unit!4122)

(assert (=> d!40313 (= lt!68970 lt!68968)))

(declare-fun lt!68979 () array!4749)

(assert (=> d!40313 (arrayContainsKey!0 lt!68979 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!40313 (= lt!68968 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!68979 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835))))))

(assert (=> d!40313 (= lt!68979 (array!4750 (store (arr!2246 (_keys!4600 newMap!16)) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)) (size!2514 (_keys!4600 newMap!16))))))

(declare-fun lt!68960 () Unit!4122)

(declare-fun lt!68957 () Unit!4122)

(assert (=> d!40313 (= lt!68960 lt!68957)))

(assert (=> d!40313 (= (+!168 (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!517 (array!4750 (store (arr!2246 (_keys!4600 newMap!16)) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)) (size!2514 (_keys!4600 newMap!16))) (array!4752 (store (arr!2247 (_values!2836 newMap!16)) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (ValueCellFull!1091 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2515 (_values!2836 newMap!16))) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!41 (array!4749 array!4751 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 32) (_ BitVec 64) V!3473 Int) Unit!4122)

(assert (=> d!40313 (= lt!68957 (lemmaAddValidKeyToArrayThenAddPairToListMap!41 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68962 () Unit!4122)

(declare-fun lt!68966 () Unit!4122)

(assert (=> d!40313 (= lt!68962 lt!68966)))

(assert (=> d!40313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4750 (store (arr!2246 (_keys!4600 newMap!16)) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)) (size!2514 (_keys!4600 newMap!16))) (mask!7147 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4749 (_ BitVec 32) (_ BitVec 32)) Unit!4122)

(assert (=> d!40313 (= lt!68966 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4600 newMap!16) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (mask!7147 newMap!16)))))

(declare-fun lt!68963 () Unit!4122)

(declare-fun lt!68955 () Unit!4122)

(assert (=> d!40313 (= lt!68963 lt!68955)))

(assert (=> d!40313 (= (arrayCountValidKeys!0 (array!4750 (store (arr!2246 (_keys!4600 newMap!16)) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)) (size!2514 (_keys!4600 newMap!16))) #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4600 newMap!16) #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4749 (_ BitVec 32) (_ BitVec 64)) Unit!4122)

(assert (=> d!40313 (= lt!68955 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4600 newMap!16) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun lt!68964 () Unit!4122)

(declare-fun lt!68977 () Unit!4122)

(assert (=> d!40313 (= lt!68964 lt!68977)))

(declare-fun lt!68972 () List!1692)

(declare-fun lt!68969 () (_ BitVec 32))

(assert (=> d!40313 (arrayNoDuplicates!0 (array!4750 (store (arr!2246 (_keys!4600 newMap!16)) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)) (size!2514 (_keys!4600 newMap!16))) lt!68969 lt!68972)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4749 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1692) Unit!4122)

(assert (=> d!40313 (= lt!68977 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4600 newMap!16) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835)) lt!68969 lt!68972))))

(assert (=> d!40313 (= lt!68972 Nil!1689)))

(assert (=> d!40313 (= lt!68969 #b00000000000000000000000000000000)))

(declare-fun lt!68978 () Unit!4122)

(assert (=> d!40313 (= lt!68978 e!86186)))

(declare-fun c!24464 () Bool)

(assert (=> d!40313 (= c!24464 (arrayContainsKey!0 (_keys!4600 newMap!16) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!68959 () Unit!4122)

(assert (=> d!40313 (= lt!68959 e!86189)))

(assert (=> d!40313 (= c!24465 (contains!881 (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> d!40313 (valid!540 newMap!16)))

(assert (=> d!40313 (= (updateHelperNewKey!60 newMap!16 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!24419 (index!3234 lt!68835) (index!3231 lt!68835))) lt!68956)))

(declare-fun b!132214 () Bool)

(declare-fun Unit!4133 () Unit!4122)

(assert (=> b!132214 (= e!86186 Unit!4133)))

(declare-fun lt!68965 () Unit!4122)

(declare-fun lemmaArrayContainsKeyThenInListMap!41 (array!4749 array!4751 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 64) (_ BitVec 32) Int) Unit!4122)

(assert (=> b!132214 (= lt!68965 (lemmaArrayContainsKeyThenInListMap!41 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(assert (=> b!132214 (contains!881 (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355))))

(declare-fun lt!68954 () Unit!4122)

(assert (=> b!132214 (= lt!68954 lt!68965)))

(assert (=> b!132214 false))

(declare-fun b!132215 () Bool)

(assert (=> b!132215 (= e!86192 (not call!14502))))

(assert (= (and d!40313 c!24465) b!132209))

(assert (= (and d!40313 (not c!24465)) b!132202))

(assert (= (and b!132209 res!63635) b!132199))

(assert (= (and b!132199 res!63639) b!132205))

(assert (= (and b!132202 c!24463) b!132204))

(assert (= (and b!132202 (not c!24463)) b!132201))

(assert (= (and b!132204 res!63643) b!132207))

(assert (= (and b!132207 res!63636) b!132203))

(assert (= (and b!132201 c!24466) b!132206))

(assert (= (and b!132201 (not c!24466)) b!132210))

(assert (= (and b!132206 res!63637) b!132213))

(assert (= (and b!132213 res!63640) b!132215))

(assert (= (or b!132204 b!132206) bm!14497))

(assert (= (or b!132203 b!132215) bm!14498))

(assert (= (or b!132199 bm!14497) bm!14499))

(assert (= (or b!132209 b!132202) bm!14496))

(assert (= (and d!40313 c!24464) b!132214))

(assert (= (and d!40313 (not c!24464)) b!132212))

(assert (= (and d!40313 res!63638) b!132211))

(assert (= (and b!132211 res!63642) b!132208))

(assert (= (and b!132208 res!63641) b!132200))

(assert (=> b!132202 m!155543))

(assert (=> b!132202 m!155787))

(declare-fun m!155909 () Bool)

(assert (=> b!132207 m!155909))

(declare-fun m!155911 () Bool)

(assert (=> bm!14499 m!155911))

(declare-fun m!155913 () Bool)

(assert (=> b!132200 m!155913))

(assert (=> b!132200 m!155545))

(assert (=> b!132200 m!155545))

(declare-fun m!155915 () Bool)

(assert (=> b!132200 m!155915))

(assert (=> b!132214 m!155543))

(declare-fun m!155917 () Bool)

(assert (=> b!132214 m!155917))

(assert (=> b!132214 m!155673))

(assert (=> b!132214 m!155673))

(assert (=> b!132214 m!155543))

(assert (=> b!132214 m!155749))

(declare-fun m!155919 () Bool)

(assert (=> b!132205 m!155919))

(assert (=> bm!14498 m!155543))

(assert (=> bm!14498 m!155747))

(declare-fun m!155921 () Bool)

(assert (=> b!132211 m!155921))

(declare-fun m!155923 () Bool)

(assert (=> b!132213 m!155923))

(assert (=> bm!14496 m!155543))

(assert (=> bm!14496 m!155783))

(assert (=> b!132209 m!155543))

(assert (=> b!132209 m!155741))

(assert (=> b!132208 m!155913))

(assert (=> b!132208 m!155913))

(assert (=> b!132208 m!155543))

(declare-fun m!155925 () Bool)

(assert (=> b!132208 m!155925))

(declare-fun m!155927 () Bool)

(assert (=> d!40313 m!155927))

(assert (=> d!40313 m!155543))

(declare-fun m!155929 () Bool)

(assert (=> d!40313 m!155929))

(assert (=> d!40313 m!155543))

(assert (=> d!40313 m!155557))

(declare-fun m!155931 () Bool)

(assert (=> d!40313 m!155931))

(declare-fun m!155933 () Bool)

(assert (=> d!40313 m!155933))

(assert (=> d!40313 m!155543))

(assert (=> d!40313 m!155747))

(declare-fun m!155935 () Bool)

(assert (=> d!40313 m!155935))

(declare-fun m!155937 () Bool)

(assert (=> d!40313 m!155937))

(declare-fun m!155939 () Bool)

(assert (=> d!40313 m!155939))

(assert (=> d!40313 m!155673))

(declare-fun m!155941 () Bool)

(assert (=> d!40313 m!155941))

(declare-fun m!155943 () Bool)

(assert (=> d!40313 m!155943))

(assert (=> d!40313 m!155935))

(assert (=> d!40313 m!155673))

(assert (=> d!40313 m!155543))

(assert (=> d!40313 m!155749))

(declare-fun m!155945 () Bool)

(assert (=> d!40313 m!155945))

(declare-fun m!155947 () Bool)

(assert (=> d!40313 m!155947))

(assert (=> d!40313 m!155659))

(declare-fun m!155949 () Bool)

(assert (=> d!40313 m!155949))

(assert (=> d!40313 m!155543))

(declare-fun m!155951 () Bool)

(assert (=> d!40313 m!155951))

(assert (=> d!40313 m!155543))

(declare-fun m!155953 () Bool)

(assert (=> d!40313 m!155953))

(declare-fun m!155955 () Bool)

(assert (=> d!40313 m!155955))

(assert (=> d!40313 m!155673))

(declare-fun m!155957 () Bool)

(assert (=> d!40313 m!155957))

(assert (=> d!40313 m!155551))

(declare-fun m!155959 () Bool)

(assert (=> d!40313 m!155959))

(assert (=> d!40313 m!155937))

(assert (=> d!40313 m!155543))

(declare-fun m!155961 () Bool)

(assert (=> d!40313 m!155961))

(assert (=> d!40313 m!155543))

(declare-fun m!155963 () Bool)

(assert (=> d!40313 m!155963))

(assert (=> bm!14464 d!40313))

(declare-fun d!40315 () Bool)

(assert (=> d!40315 (= (inRange!0 (ite c!24415 (ite c!24426 (index!3232 lt!68832) (ite c!24421 (index!3231 lt!68844) (index!3234 lt!68844))) (ite c!24416 (index!3232 lt!68847) (ite c!24417 (index!3231 lt!68846) (index!3234 lt!68846)))) (mask!7147 newMap!16)) (and (bvsge (ite c!24415 (ite c!24426 (index!3232 lt!68832) (ite c!24421 (index!3231 lt!68844) (index!3234 lt!68844))) (ite c!24416 (index!3232 lt!68847) (ite c!24417 (index!3231 lt!68846) (index!3234 lt!68846)))) #b00000000000000000000000000000000) (bvslt (ite c!24415 (ite c!24426 (index!3232 lt!68832) (ite c!24421 (index!3231 lt!68844) (index!3234 lt!68844))) (ite c!24416 (index!3232 lt!68847) (ite c!24417 (index!3231 lt!68846) (index!3234 lt!68846)))) (bvadd (mask!7147 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!14472 d!40315))

(declare-fun d!40317 () Bool)

(assert (=> d!40317 (= (apply!115 lt!68742 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1486 (getValueByKey!172 (toList!841 lt!68742) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5488 () Bool)

(assert (= bs!5488 d!40317))

(declare-fun m!155965 () Bool)

(assert (=> bs!5488 m!155965))

(assert (=> bs!5488 m!155965))

(declare-fun m!155967 () Bool)

(assert (=> bs!5488 m!155967))

(assert (=> b!131937 d!40317))

(declare-fun d!40319 () Bool)

(declare-fun res!63644 () Bool)

(declare-fun e!86193 () Bool)

(assert (=> d!40319 (=> (not res!63644) (not e!86193))))

(assert (=> d!40319 (= res!63644 (simpleValid!91 (_2!1292 lt!68837)))))

(assert (=> d!40319 (= (valid!540 (_2!1292 lt!68837)) e!86193)))

(declare-fun b!132216 () Bool)

(declare-fun res!63645 () Bool)

(assert (=> b!132216 (=> (not res!63645) (not e!86193))))

(assert (=> b!132216 (= res!63645 (= (arrayCountValidKeys!0 (_keys!4600 (_2!1292 lt!68837)) #b00000000000000000000000000000000 (size!2514 (_keys!4600 (_2!1292 lt!68837)))) (_size!594 (_2!1292 lt!68837))))))

(declare-fun b!132217 () Bool)

(declare-fun res!63646 () Bool)

(assert (=> b!132217 (=> (not res!63646) (not e!86193))))

(assert (=> b!132217 (= res!63646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4600 (_2!1292 lt!68837)) (mask!7147 (_2!1292 lt!68837))))))

(declare-fun b!132218 () Bool)

(assert (=> b!132218 (= e!86193 (arrayNoDuplicates!0 (_keys!4600 (_2!1292 lt!68837)) #b00000000000000000000000000000000 Nil!1689))))

(assert (= (and d!40319 res!63644) b!132216))

(assert (= (and b!132216 res!63645) b!132217))

(assert (= (and b!132217 res!63646) b!132218))

(declare-fun m!155969 () Bool)

(assert (=> d!40319 m!155969))

(declare-fun m!155971 () Bool)

(assert (=> b!132216 m!155971))

(declare-fun m!155973 () Bool)

(assert (=> b!132217 m!155973))

(declare-fun m!155975 () Bool)

(assert (=> b!132218 m!155975))

(assert (=> d!40285 d!40319))

(assert (=> d!40285 d!40265))

(declare-fun d!40321 () Bool)

(assert (=> d!40321 (= (validKeyInArray!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131871 d!40321))

(assert (=> bm!14470 d!40273))

(declare-fun d!40323 () Bool)

(declare-fun e!86196 () Bool)

(assert (=> d!40323 e!86196))

(declare-fun res!63649 () Bool)

(assert (=> d!40323 (=> (not res!63649) (not e!86196))))

(assert (=> d!40323 (= res!63649 (and (bvsge (index!3232 lt!68835) #b00000000000000000000000000000000) (bvslt (index!3232 lt!68835) (size!2514 (_keys!4600 newMap!16)))))))

(declare-fun lt!68986 () Unit!4122)

(declare-fun choose!816 (array!4749 array!4751 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 32) Int) Unit!4122)

(assert (=> d!40323 (= lt!68986 (choose!816 (_keys!4600 newMap!16) lt!68829 (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (index!3232 lt!68835) (defaultEntry!2853 newMap!16)))))

(assert (=> d!40323 (validMask!0 (mask!7147 newMap!16))))

(assert (=> d!40323 (= (lemmaValidKeyInArrayIsInListMap!120 (_keys!4600 newMap!16) lt!68829 (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (index!3232 lt!68835) (defaultEntry!2853 newMap!16)) lt!68986)))

(declare-fun b!132221 () Bool)

(assert (=> b!132221 (= e!86196 (contains!881 (getCurrentListMap!517 (_keys!4600 newMap!16) lt!68829 (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (select (arr!2246 (_keys!4600 newMap!16)) (index!3232 lt!68835))))))

(assert (= (and d!40323 res!63649) b!132221))

(declare-fun m!155977 () Bool)

(assert (=> d!40323 m!155977))

(assert (=> d!40323 m!155815))

(declare-fun m!155979 () Bool)

(assert (=> b!132221 m!155979))

(assert (=> b!132221 m!155775))

(assert (=> b!132221 m!155979))

(assert (=> b!132221 m!155775))

(declare-fun m!155981 () Bool)

(assert (=> b!132221 m!155981))

(assert (=> b!132058 d!40323))

(declare-fun d!40325 () Bool)

(declare-fun e!86199 () Bool)

(assert (=> d!40325 e!86199))

(declare-fun res!63652 () Bool)

(assert (=> d!40325 (=> (not res!63652) (not e!86199))))

(assert (=> d!40325 (= res!63652 (and (bvsge (index!3232 lt!68835) #b00000000000000000000000000000000) (bvslt (index!3232 lt!68835) (size!2515 (_values!2836 newMap!16)))))))

(declare-fun lt!68989 () Unit!4122)

(declare-fun choose!817 (array!4749 array!4751 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 32) (_ BitVec 64) V!3473 Int) Unit!4122)

(assert (=> d!40325 (= lt!68989 (choose!817 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (index!3232 lt!68835) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2853 newMap!16)))))

(assert (=> d!40325 (validMask!0 (mask!7147 newMap!16))))

(assert (=> d!40325 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!60 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (index!3232 lt!68835) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2853 newMap!16)) lt!68989)))

(declare-fun b!132224 () Bool)

(assert (=> b!132224 (= e!86199 (= (+!168 (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!517 (_keys!4600 newMap!16) (array!4752 (store (arr!2247 (_values!2836 newMap!16)) (index!3232 lt!68835) (ValueCellFull!1091 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2515 (_values!2836 newMap!16))) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16))))))

(assert (= (and d!40325 res!63652) b!132224))

(assert (=> d!40325 m!155543))

(assert (=> d!40325 m!155557))

(declare-fun m!155983 () Bool)

(assert (=> d!40325 m!155983))

(assert (=> d!40325 m!155815))

(assert (=> b!132224 m!155673))

(assert (=> b!132224 m!155673))

(assert (=> b!132224 m!155957))

(assert (=> b!132224 m!155755))

(declare-fun m!155985 () Bool)

(assert (=> b!132224 m!155985))

(assert (=> b!132058 d!40325))

(declare-fun d!40327 () Bool)

(declare-fun e!86201 () Bool)

(assert (=> d!40327 e!86201))

(declare-fun res!63653 () Bool)

(assert (=> d!40327 (=> res!63653 e!86201)))

(declare-fun lt!68991 () Bool)

(assert (=> d!40327 (= res!63653 (not lt!68991))))

(declare-fun lt!68992 () Bool)

(assert (=> d!40327 (= lt!68991 lt!68992)))

(declare-fun lt!68993 () Unit!4122)

(declare-fun e!86200 () Unit!4122)

(assert (=> d!40327 (= lt!68993 e!86200)))

(declare-fun c!24467 () Bool)

(assert (=> d!40327 (= c!24467 lt!68992)))

(assert (=> d!40327 (= lt!68992 (containsKey!175 (toList!841 (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16))) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> d!40327 (= (contains!881 (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)) lt!68991)))

(declare-fun b!132225 () Bool)

(declare-fun lt!68990 () Unit!4122)

(assert (=> b!132225 (= e!86200 lt!68990)))

(assert (=> b!132225 (= lt!68990 (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!841 (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16))) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> b!132225 (isDefined!124 (getValueByKey!172 (toList!841 (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16))) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun b!132226 () Bool)

(declare-fun Unit!4134 () Unit!4122)

(assert (=> b!132226 (= e!86200 Unit!4134)))

(declare-fun b!132227 () Bool)

(assert (=> b!132227 (= e!86201 (isDefined!124 (getValueByKey!172 (toList!841 (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16))) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355))))))

(assert (= (and d!40327 c!24467) b!132225))

(assert (= (and d!40327 (not c!24467)) b!132226))

(assert (= (and d!40327 (not res!63653)) b!132227))

(assert (=> d!40327 m!155543))

(declare-fun m!155987 () Bool)

(assert (=> d!40327 m!155987))

(assert (=> b!132225 m!155543))

(declare-fun m!155989 () Bool)

(assert (=> b!132225 m!155989))

(assert (=> b!132225 m!155543))

(declare-fun m!155991 () Bool)

(assert (=> b!132225 m!155991))

(assert (=> b!132225 m!155991))

(declare-fun m!155993 () Bool)

(assert (=> b!132225 m!155993))

(assert (=> b!132227 m!155543))

(assert (=> b!132227 m!155991))

(assert (=> b!132227 m!155991))

(assert (=> b!132227 m!155993))

(assert (=> b!132058 d!40327))

(assert (=> b!132058 d!40307))

(assert (=> bm!14469 d!40297))

(declare-fun b!132228 () Bool)

(declare-fun e!86202 () Bool)

(declare-fun call!14503 () Bool)

(assert (=> b!132228 (= e!86202 call!14503)))

(declare-fun bm!14500 () Bool)

(declare-fun c!24468 () Bool)

(assert (=> bm!14500 (= call!14503 (arrayNoDuplicates!0 (_keys!4600 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!24468 (Cons!1688 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!24364 (Cons!1688 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) Nil!1689) Nil!1689)) (ite c!24364 (Cons!1688 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) Nil!1689) Nil!1689))))))

(declare-fun b!132229 () Bool)

(declare-fun e!86204 () Bool)

(assert (=> b!132229 (= e!86204 (contains!882 (ite c!24364 (Cons!1688 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) Nil!1689) Nil!1689) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!132230 () Bool)

(declare-fun e!86203 () Bool)

(assert (=> b!132230 (= e!86203 e!86202)))

(assert (=> b!132230 (= c!24468 (validKeyInArray!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!40329 () Bool)

(declare-fun res!63656 () Bool)

(declare-fun e!86205 () Bool)

(assert (=> d!40329 (=> res!63656 e!86205)))

(assert (=> d!40329 (= res!63656 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> d!40329 (= (arrayNoDuplicates!0 (_keys!4600 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!24364 (Cons!1688 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) Nil!1689) Nil!1689)) e!86205)))

(declare-fun b!132231 () Bool)

(assert (=> b!132231 (= e!86205 e!86203)))

(declare-fun res!63654 () Bool)

(assert (=> b!132231 (=> (not res!63654) (not e!86203))))

(assert (=> b!132231 (= res!63654 (not e!86204))))

(declare-fun res!63655 () Bool)

(assert (=> b!132231 (=> (not res!63655) (not e!86204))))

(assert (=> b!132231 (= res!63655 (validKeyInArray!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!132232 () Bool)

(assert (=> b!132232 (= e!86202 call!14503)))

(assert (= (and d!40329 (not res!63656)) b!132231))

(assert (= (and b!132231 res!63655) b!132229))

(assert (= (and b!132231 res!63654) b!132230))

(assert (= (and b!132230 c!24468) b!132232))

(assert (= (and b!132230 (not c!24468)) b!132228))

(assert (= (or b!132232 b!132228) bm!14500))

(declare-fun m!155995 () Bool)

(assert (=> bm!14500 m!155995))

(declare-fun m!155997 () Bool)

(assert (=> bm!14500 m!155997))

(assert (=> b!132229 m!155995))

(assert (=> b!132229 m!155995))

(declare-fun m!155999 () Bool)

(assert (=> b!132229 m!155999))

(assert (=> b!132230 m!155995))

(assert (=> b!132230 m!155995))

(declare-fun m!156001 () Bool)

(assert (=> b!132230 m!156001))

(assert (=> b!132231 m!155995))

(assert (=> b!132231 m!155995))

(assert (=> b!132231 m!156001))

(assert (=> bm!14384 d!40329))

(declare-fun d!40331 () Bool)

(declare-fun e!86207 () Bool)

(assert (=> d!40331 e!86207))

(declare-fun res!63657 () Bool)

(assert (=> d!40331 (=> res!63657 e!86207)))

(declare-fun lt!68995 () Bool)

(assert (=> d!40331 (= res!63657 (not lt!68995))))

(declare-fun lt!68996 () Bool)

(assert (=> d!40331 (= lt!68995 lt!68996)))

(declare-fun lt!68997 () Unit!4122)

(declare-fun e!86206 () Unit!4122)

(assert (=> d!40331 (= lt!68997 e!86206)))

(declare-fun c!24469 () Bool)

(assert (=> d!40331 (= c!24469 lt!68996)))

(assert (=> d!40331 (= lt!68996 (containsKey!175 (toList!841 lt!68742) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!40331 (= (contains!881 lt!68742 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!68995)))

(declare-fun b!132233 () Bool)

(declare-fun lt!68994 () Unit!4122)

(assert (=> b!132233 (= e!86206 lt!68994)))

(assert (=> b!132233 (= lt!68994 (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!841 lt!68742) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!132233 (isDefined!124 (getValueByKey!172 (toList!841 lt!68742) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!132234 () Bool)

(declare-fun Unit!4135 () Unit!4122)

(assert (=> b!132234 (= e!86206 Unit!4135)))

(declare-fun b!132235 () Bool)

(assert (=> b!132235 (= e!86207 (isDefined!124 (getValueByKey!172 (toList!841 lt!68742) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!40331 c!24469) b!132233))

(assert (= (and d!40331 (not c!24469)) b!132234))

(assert (= (and d!40331 (not res!63657)) b!132235))

(assert (=> d!40331 m!155687))

(declare-fun m!156003 () Bool)

(assert (=> d!40331 m!156003))

(assert (=> b!132233 m!155687))

(declare-fun m!156005 () Bool)

(assert (=> b!132233 m!156005))

(assert (=> b!132233 m!155687))

(assert (=> b!132233 m!155901))

(assert (=> b!132233 m!155901))

(declare-fun m!156007 () Bool)

(assert (=> b!132233 m!156007))

(assert (=> b!132235 m!155687))

(assert (=> b!132235 m!155901))

(assert (=> b!132235 m!155901))

(assert (=> b!132235 m!156007))

(assert (=> b!131948 d!40331))

(declare-fun d!40333 () Bool)

(assert (=> d!40333 (arrayContainsKey!0 (_keys!4600 (v!3187 (underlying!452 thiss!992))) lt!68690 #b00000000000000000000000000000000)))

(declare-fun lt!69000 () Unit!4122)

(declare-fun choose!13 (array!4749 (_ BitVec 64) (_ BitVec 32)) Unit!4122)

(assert (=> d!40333 (= lt!69000 (choose!13 (_keys!4600 (v!3187 (underlying!452 thiss!992))) lt!68690 #b00000000000000000000000000000000))))

(assert (=> d!40333 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!40333 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4600 (v!3187 (underlying!452 thiss!992))) lt!68690 #b00000000000000000000000000000000) lt!69000)))

(declare-fun bs!5489 () Bool)

(assert (= bs!5489 d!40333))

(assert (=> bs!5489 m!155669))

(declare-fun m!156009 () Bool)

(assert (=> bs!5489 m!156009))

(assert (=> b!131891 d!40333))

(declare-fun d!40335 () Bool)

(declare-fun res!63662 () Bool)

(declare-fun e!86212 () Bool)

(assert (=> d!40335 (=> res!63662 e!86212)))

(assert (=> d!40335 (= res!63662 (= (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) lt!68690))))

(assert (=> d!40335 (= (arrayContainsKey!0 (_keys!4600 (v!3187 (underlying!452 thiss!992))) lt!68690 #b00000000000000000000000000000000) e!86212)))

(declare-fun b!132240 () Bool)

(declare-fun e!86213 () Bool)

(assert (=> b!132240 (= e!86212 e!86213)))

(declare-fun res!63663 () Bool)

(assert (=> b!132240 (=> (not res!63663) (not e!86213))))

(assert (=> b!132240 (= res!63663 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun b!132241 () Bool)

(assert (=> b!132241 (= e!86213 (arrayContainsKey!0 (_keys!4600 (v!3187 (underlying!452 thiss!992))) lt!68690 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!40335 (not res!63662)) b!132240))

(assert (= (and b!132240 res!63663) b!132241))

(assert (=> d!40335 m!155649))

(declare-fun m!156011 () Bool)

(assert (=> b!132241 m!156011))

(assert (=> b!131891 d!40335))

(declare-fun b!132242 () Bool)

(declare-fun c!24472 () Bool)

(declare-fun lt!69003 () (_ BitVec 64))

(assert (=> b!132242 (= c!24472 (= lt!69003 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!86214 () SeekEntryResult!268)

(declare-fun e!86215 () SeekEntryResult!268)

(assert (=> b!132242 (= e!86214 e!86215)))

(declare-fun d!40337 () Bool)

(declare-fun lt!69001 () SeekEntryResult!268)

(assert (=> d!40337 (and (or ((_ is Undefined!268) lt!69001) (not ((_ is Found!268) lt!69001)) (and (bvsge (index!3232 lt!69001) #b00000000000000000000000000000000) (bvslt (index!3232 lt!69001) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))) (or ((_ is Undefined!268) lt!69001) ((_ is Found!268) lt!69001) (not ((_ is MissingZero!268) lt!69001)) (and (bvsge (index!3231 lt!69001) #b00000000000000000000000000000000) (bvslt (index!3231 lt!69001) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))) (or ((_ is Undefined!268) lt!69001) ((_ is Found!268) lt!69001) ((_ is MissingZero!268) lt!69001) (not ((_ is MissingVacant!268) lt!69001)) (and (bvsge (index!3234 lt!69001) #b00000000000000000000000000000000) (bvslt (index!3234 lt!69001) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))) (or ((_ is Undefined!268) lt!69001) (ite ((_ is Found!268) lt!69001) (= (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (index!3232 lt!69001)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!268) lt!69001) (= (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (index!3231 lt!69001)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!268) lt!69001) (= (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (index!3234 lt!69001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!86216 () SeekEntryResult!268)

(assert (=> d!40337 (= lt!69001 e!86216)))

(declare-fun c!24471 () Bool)

(declare-fun lt!69002 () SeekEntryResult!268)

(assert (=> d!40337 (= c!24471 (and ((_ is Intermediate!268) lt!69002) (undefined!1080 lt!69002)))))

(assert (=> d!40337 (= lt!69002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) (mask!7147 (v!3187 (underlying!452 thiss!992)))) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) (_keys!4600 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992)))))))

(assert (=> d!40337 (validMask!0 (mask!7147 (v!3187 (underlying!452 thiss!992))))))

(assert (=> d!40337 (= (seekEntryOrOpen!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) (_keys!4600 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992)))) lt!69001)))

(declare-fun b!132243 () Bool)

(assert (=> b!132243 (= e!86216 e!86214)))

(assert (=> b!132243 (= lt!69003 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (index!3233 lt!69002)))))

(declare-fun c!24470 () Bool)

(assert (=> b!132243 (= c!24470 (= lt!69003 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!132244 () Bool)

(assert (=> b!132244 (= e!86214 (Found!268 (index!3233 lt!69002)))))

(declare-fun b!132245 () Bool)

(assert (=> b!132245 (= e!86216 Undefined!268)))

(declare-fun b!132246 () Bool)

(assert (=> b!132246 (= e!86215 (seekKeyOrZeroReturnVacant!0 (x!15496 lt!69002) (index!3233 lt!69002) (index!3233 lt!69002) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000) (_keys!4600 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!132247 () Bool)

(assert (=> b!132247 (= e!86215 (MissingZero!268 (index!3233 lt!69002)))))

(assert (= (and d!40337 c!24471) b!132245))

(assert (= (and d!40337 (not c!24471)) b!132243))

(assert (= (and b!132243 c!24470) b!132244))

(assert (= (and b!132243 (not c!24470)) b!132242))

(assert (= (and b!132242 c!24472) b!132247))

(assert (= (and b!132242 (not c!24472)) b!132246))

(declare-fun m!156013 () Bool)

(assert (=> d!40337 m!156013))

(assert (=> d!40337 m!155649))

(declare-fun m!156015 () Bool)

(assert (=> d!40337 m!156015))

(declare-fun m!156017 () Bool)

(assert (=> d!40337 m!156017))

(assert (=> d!40337 m!155649))

(assert (=> d!40337 m!156013))

(declare-fun m!156019 () Bool)

(assert (=> d!40337 m!156019))

(assert (=> d!40337 m!155563))

(declare-fun m!156021 () Bool)

(assert (=> d!40337 m!156021))

(declare-fun m!156023 () Bool)

(assert (=> b!132243 m!156023))

(assert (=> b!132246 m!155649))

(declare-fun m!156025 () Bool)

(assert (=> b!132246 m!156025))

(assert (=> b!131891 d!40337))

(assert (=> d!40275 d!40289))

(declare-fun d!40339 () Bool)

(declare-fun lt!69006 () (_ BitVec 32))

(assert (=> d!40339 (and (bvsge lt!69006 #b00000000000000000000000000000000) (bvsle lt!69006 (bvsub (size!2514 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!86221 () (_ BitVec 32))

(assert (=> d!40339 (= lt!69006 e!86221)))

(declare-fun c!24478 () Bool)

(assert (=> d!40339 (= c!24478 (bvsge #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))

(assert (=> d!40339 (and (bvsle #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2514 (_keys!4600 newMap!16)) (size!2514 (_keys!4600 newMap!16))))))

(assert (=> d!40339 (= (arrayCountValidKeys!0 (_keys!4600 newMap!16) #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))) lt!69006)))

(declare-fun b!132256 () Bool)

(declare-fun e!86222 () (_ BitVec 32))

(declare-fun call!14506 () (_ BitVec 32))

(assert (=> b!132256 (= e!86222 (bvadd #b00000000000000000000000000000001 call!14506))))

(declare-fun bm!14503 () Bool)

(assert (=> bm!14503 (= call!14506 (arrayCountValidKeys!0 (_keys!4600 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2514 (_keys!4600 newMap!16))))))

(declare-fun b!132257 () Bool)

(assert (=> b!132257 (= e!86222 call!14506)))

(declare-fun b!132258 () Bool)

(assert (=> b!132258 (= e!86221 #b00000000000000000000000000000000)))

(declare-fun b!132259 () Bool)

(assert (=> b!132259 (= e!86221 e!86222)))

(declare-fun c!24477 () Bool)

(assert (=> b!132259 (= c!24477 (validKeyInArray!0 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!40339 c!24478) b!132258))

(assert (= (and d!40339 (not c!24478)) b!132259))

(assert (= (and b!132259 c!24477) b!132256))

(assert (= (and b!132259 (not c!24477)) b!132257))

(assert (= (or b!132256 b!132257) bm!14503))

(declare-fun m!156027 () Bool)

(assert (=> bm!14503 m!156027))

(assert (=> b!132259 m!155855))

(assert (=> b!132259 m!155855))

(assert (=> b!132259 m!155889))

(assert (=> b!131880 d!40339))

(declare-fun d!40341 () Bool)

(declare-fun e!86224 () Bool)

(assert (=> d!40341 e!86224))

(declare-fun res!63664 () Bool)

(assert (=> d!40341 (=> res!63664 e!86224)))

(declare-fun lt!69008 () Bool)

(assert (=> d!40341 (= res!63664 (not lt!69008))))

(declare-fun lt!69009 () Bool)

(assert (=> d!40341 (= lt!69008 lt!69009)))

(declare-fun lt!69010 () Unit!4122)

(declare-fun e!86223 () Unit!4122)

(assert (=> d!40341 (= lt!69010 e!86223)))

(declare-fun c!24479 () Bool)

(assert (=> d!40341 (= c!24479 lt!69009)))

(assert (=> d!40341 (= lt!69009 (containsKey!175 (toList!841 lt!68742) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!40341 (= (contains!881 lt!68742 #b0000000000000000000000000000000000000000000000000000000000000000) lt!69008)))

(declare-fun b!132260 () Bool)

(declare-fun lt!69007 () Unit!4122)

(assert (=> b!132260 (= e!86223 lt!69007)))

(assert (=> b!132260 (= lt!69007 (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!841 lt!68742) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132260 (isDefined!124 (getValueByKey!172 (toList!841 lt!68742) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132261 () Bool)

(declare-fun Unit!4136 () Unit!4122)

(assert (=> b!132261 (= e!86223 Unit!4136)))

(declare-fun b!132262 () Bool)

(assert (=> b!132262 (= e!86224 (isDefined!124 (getValueByKey!172 (toList!841 lt!68742) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40341 c!24479) b!132260))

(assert (= (and d!40341 (not c!24479)) b!132261))

(assert (= (and d!40341 (not res!63664)) b!132262))

(declare-fun m!156029 () Bool)

(assert (=> d!40341 m!156029))

(declare-fun m!156031 () Bool)

(assert (=> b!132260 m!156031))

(assert (=> b!132260 m!155965))

(assert (=> b!132260 m!155965))

(declare-fun m!156033 () Bool)

(assert (=> b!132260 m!156033))

(assert (=> b!132262 m!155965))

(assert (=> b!132262 m!155965))

(assert (=> b!132262 m!156033))

(assert (=> bm!14406 d!40341))

(declare-fun b!132263 () Bool)

(declare-fun e!86225 () Bool)

(declare-fun call!14507 () Bool)

(assert (=> b!132263 (= e!86225 call!14507)))

(declare-fun bm!14504 () Bool)

(declare-fun c!24480 () Bool)

(assert (=> bm!14504 (= call!14507 (arrayNoDuplicates!0 (_keys!4600 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!24480 (Cons!1688 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000) Nil!1689) Nil!1689)))))

(declare-fun b!132264 () Bool)

(declare-fun e!86227 () Bool)

(assert (=> b!132264 (= e!86227 (contains!882 Nil!1689 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!132265 () Bool)

(declare-fun e!86226 () Bool)

(assert (=> b!132265 (= e!86226 e!86225)))

(assert (=> b!132265 (= c!24480 (validKeyInArray!0 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!40343 () Bool)

(declare-fun res!63667 () Bool)

(declare-fun e!86228 () Bool)

(assert (=> d!40343 (=> res!63667 e!86228)))

(assert (=> d!40343 (= res!63667 (bvsge #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))

(assert (=> d!40343 (= (arrayNoDuplicates!0 (_keys!4600 newMap!16) #b00000000000000000000000000000000 Nil!1689) e!86228)))

(declare-fun b!132266 () Bool)

(assert (=> b!132266 (= e!86228 e!86226)))

(declare-fun res!63665 () Bool)

(assert (=> b!132266 (=> (not res!63665) (not e!86226))))

(assert (=> b!132266 (= res!63665 (not e!86227))))

(declare-fun res!63666 () Bool)

(assert (=> b!132266 (=> (not res!63666) (not e!86227))))

(assert (=> b!132266 (= res!63666 (validKeyInArray!0 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!132267 () Bool)

(assert (=> b!132267 (= e!86225 call!14507)))

(assert (= (and d!40343 (not res!63667)) b!132266))

(assert (= (and b!132266 res!63666) b!132264))

(assert (= (and b!132266 res!63665) b!132265))

(assert (= (and b!132265 c!24480) b!132267))

(assert (= (and b!132265 (not c!24480)) b!132263))

(assert (= (or b!132267 b!132263) bm!14504))

(assert (=> bm!14504 m!155855))

(declare-fun m!156035 () Bool)

(assert (=> bm!14504 m!156035))

(assert (=> b!132264 m!155855))

(assert (=> b!132264 m!155855))

(declare-fun m!156037 () Bool)

(assert (=> b!132264 m!156037))

(assert (=> b!132265 m!155855))

(assert (=> b!132265 m!155855))

(assert (=> b!132265 m!155889))

(assert (=> b!132266 m!155855))

(assert (=> b!132266 m!155855))

(assert (=> b!132266 m!155889))

(assert (=> b!131882 d!40343))

(declare-fun bm!14505 () Bool)

(declare-fun call!14514 () ListLongMap!1651)

(declare-fun call!14513 () ListLongMap!1651)

(assert (=> bm!14505 (= call!14514 call!14513)))

(declare-fun b!132268 () Bool)

(declare-fun e!86240 () Bool)

(declare-fun lt!69016 () ListLongMap!1651)

(assert (=> b!132268 (= e!86240 (= (apply!115 lt!69016 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2709 newMap!16)))))

(declare-fun bm!14506 () Bool)

(declare-fun call!14509 () ListLongMap!1651)

(declare-fun call!14512 () ListLongMap!1651)

(assert (=> bm!14506 (= call!14509 call!14512)))

(declare-fun b!132269 () Bool)

(declare-fun c!24483 () Bool)

(assert (=> b!132269 (= c!24483 (and (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!86232 () ListLongMap!1651)

(declare-fun e!86234 () ListLongMap!1651)

(assert (=> b!132269 (= e!86232 e!86234)))

(declare-fun b!132270 () Bool)

(declare-fun e!86230 () ListLongMap!1651)

(assert (=> b!132270 (= e!86230 e!86232)))

(declare-fun c!24482 () Bool)

(assert (=> b!132270 (= c!24482 (and (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!132271 () Bool)

(assert (=> b!132271 (= e!86234 call!14514)))

(declare-fun b!132272 () Bool)

(declare-fun res!63675 () Bool)

(declare-fun e!86233 () Bool)

(assert (=> b!132272 (=> (not res!63675) (not e!86233))))

(declare-fun e!86241 () Bool)

(assert (=> b!132272 (= res!63675 e!86241)))

(declare-fun c!24484 () Bool)

(assert (=> b!132272 (= c!24484 (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!14507 () Bool)

(assert (=> bm!14507 (= call!14512 (getCurrentListMapNoExtraKeys!135 (_keys!4600 newMap!16) (ite (or c!24420 c!24415) (_values!2836 newMap!16) lt!68829) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun bm!14508 () Bool)

(declare-fun call!14510 () Bool)

(assert (=> bm!14508 (= call!14510 (contains!881 lt!69016 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132273 () Bool)

(assert (=> b!132273 (= e!86230 (+!168 call!14513 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 newMap!16))))))

(declare-fun b!132274 () Bool)

(declare-fun e!86236 () Bool)

(assert (=> b!132274 (= e!86236 (validKeyInArray!0 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!132275 () Bool)

(declare-fun call!14511 () Bool)

(assert (=> b!132275 (= e!86241 (not call!14511))))

(declare-fun b!132276 () Bool)

(declare-fun e!86231 () Bool)

(assert (=> b!132276 (= e!86231 (not call!14510))))

(declare-fun b!132277 () Bool)

(assert (=> b!132277 (= e!86233 e!86231)))

(declare-fun c!24486 () Bool)

(assert (=> b!132277 (= c!24486 (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14509 () Bool)

(assert (=> bm!14509 (= call!14511 (contains!881 lt!69016 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!40345 () Bool)

(assert (=> d!40345 e!86233))

(declare-fun res!63669 () Bool)

(assert (=> d!40345 (=> (not res!63669) (not e!86233))))

(assert (=> d!40345 (= res!63669 (or (bvsge #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))))

(declare-fun lt!69030 () ListLongMap!1651)

(assert (=> d!40345 (= lt!69016 lt!69030)))

(declare-fun lt!69012 () Unit!4122)

(declare-fun e!86237 () Unit!4122)

(assert (=> d!40345 (= lt!69012 e!86237)))

(declare-fun c!24485 () Bool)

(declare-fun e!86229 () Bool)

(assert (=> d!40345 (= c!24485 e!86229)))

(declare-fun res!63672 () Bool)

(assert (=> d!40345 (=> (not res!63672) (not e!86229))))

(assert (=> d!40345 (= res!63672 (bvslt #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))

(assert (=> d!40345 (= lt!69030 e!86230)))

(declare-fun c!24481 () Bool)

(assert (=> d!40345 (= c!24481 (and (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40345 (validMask!0 (mask!7147 newMap!16))))

(assert (=> d!40345 (= (getCurrentListMap!517 (_keys!4600 newMap!16) (ite (or c!24420 c!24415) (_values!2836 newMap!16) lt!68829) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) lt!69016)))

(declare-fun b!132278 () Bool)

(declare-fun Unit!4137 () Unit!4122)

(assert (=> b!132278 (= e!86237 Unit!4137)))

(declare-fun b!132279 () Bool)

(declare-fun e!86235 () Bool)

(declare-fun e!86238 () Bool)

(assert (=> b!132279 (= e!86235 e!86238)))

(declare-fun res!63676 () Bool)

(assert (=> b!132279 (=> (not res!63676) (not e!86238))))

(assert (=> b!132279 (= res!63676 (contains!881 lt!69016 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!132279 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))

(declare-fun b!132280 () Bool)

(declare-fun e!86239 () Bool)

(assert (=> b!132280 (= e!86239 (= (apply!115 lt!69016 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2709 newMap!16)))))

(declare-fun b!132281 () Bool)

(assert (=> b!132281 (= e!86241 e!86240)))

(declare-fun res!63674 () Bool)

(assert (=> b!132281 (= res!63674 call!14511)))

(assert (=> b!132281 (=> (not res!63674) (not e!86240))))

(declare-fun bm!14510 () Bool)

(declare-fun call!14508 () ListLongMap!1651)

(assert (=> bm!14510 (= call!14508 call!14509)))

(declare-fun b!132282 () Bool)

(assert (=> b!132282 (= e!86232 call!14514)))

(declare-fun b!132283 () Bool)

(assert (=> b!132283 (= e!86234 call!14508)))

(declare-fun b!132284 () Bool)

(assert (=> b!132284 (= e!86231 e!86239)))

(declare-fun res!63670 () Bool)

(assert (=> b!132284 (= res!63670 call!14510)))

(assert (=> b!132284 (=> (not res!63670) (not e!86239))))

(declare-fun b!132285 () Bool)

(declare-fun lt!69026 () Unit!4122)

(assert (=> b!132285 (= e!86237 lt!69026)))

(declare-fun lt!69031 () ListLongMap!1651)

(assert (=> b!132285 (= lt!69031 (getCurrentListMapNoExtraKeys!135 (_keys!4600 newMap!16) (ite (or c!24420 c!24415) (_values!2836 newMap!16) lt!68829) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!69029 () (_ BitVec 64))

(assert (=> b!132285 (= lt!69029 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!69032 () (_ BitVec 64))

(assert (=> b!132285 (= lt!69032 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!69017 () Unit!4122)

(assert (=> b!132285 (= lt!69017 (addStillContains!91 lt!69031 lt!69029 (zeroValue!2709 newMap!16) lt!69032))))

(assert (=> b!132285 (contains!881 (+!168 lt!69031 (tuple2!2561 lt!69029 (zeroValue!2709 newMap!16))) lt!69032)))

(declare-fun lt!69018 () Unit!4122)

(assert (=> b!132285 (= lt!69018 lt!69017)))

(declare-fun lt!69020 () ListLongMap!1651)

(assert (=> b!132285 (= lt!69020 (getCurrentListMapNoExtraKeys!135 (_keys!4600 newMap!16) (ite (or c!24420 c!24415) (_values!2836 newMap!16) lt!68829) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!69013 () (_ BitVec 64))

(assert (=> b!132285 (= lt!69013 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!69021 () (_ BitVec 64))

(assert (=> b!132285 (= lt!69021 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!69014 () Unit!4122)

(assert (=> b!132285 (= lt!69014 (addApplyDifferent!91 lt!69020 lt!69013 (minValue!2709 newMap!16) lt!69021))))

(assert (=> b!132285 (= (apply!115 (+!168 lt!69020 (tuple2!2561 lt!69013 (minValue!2709 newMap!16))) lt!69021) (apply!115 lt!69020 lt!69021))))

(declare-fun lt!69015 () Unit!4122)

(assert (=> b!132285 (= lt!69015 lt!69014)))

(declare-fun lt!69025 () ListLongMap!1651)

(assert (=> b!132285 (= lt!69025 (getCurrentListMapNoExtraKeys!135 (_keys!4600 newMap!16) (ite (or c!24420 c!24415) (_values!2836 newMap!16) lt!68829) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!69011 () (_ BitVec 64))

(assert (=> b!132285 (= lt!69011 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!69022 () (_ BitVec 64))

(assert (=> b!132285 (= lt!69022 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!69019 () Unit!4122)

(assert (=> b!132285 (= lt!69019 (addApplyDifferent!91 lt!69025 lt!69011 (zeroValue!2709 newMap!16) lt!69022))))

(assert (=> b!132285 (= (apply!115 (+!168 lt!69025 (tuple2!2561 lt!69011 (zeroValue!2709 newMap!16))) lt!69022) (apply!115 lt!69025 lt!69022))))

(declare-fun lt!69024 () Unit!4122)

(assert (=> b!132285 (= lt!69024 lt!69019)))

(declare-fun lt!69027 () ListLongMap!1651)

(assert (=> b!132285 (= lt!69027 (getCurrentListMapNoExtraKeys!135 (_keys!4600 newMap!16) (ite (or c!24420 c!24415) (_values!2836 newMap!16) lt!68829) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!69028 () (_ BitVec 64))

(assert (=> b!132285 (= lt!69028 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!69023 () (_ BitVec 64))

(assert (=> b!132285 (= lt!69023 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!132285 (= lt!69026 (addApplyDifferent!91 lt!69027 lt!69028 (minValue!2709 newMap!16) lt!69023))))

(assert (=> b!132285 (= (apply!115 (+!168 lt!69027 (tuple2!2561 lt!69028 (minValue!2709 newMap!16))) lt!69023) (apply!115 lt!69027 lt!69023))))

(declare-fun bm!14511 () Bool)

(assert (=> bm!14511 (= call!14513 (+!168 (ite c!24481 call!14512 (ite c!24482 call!14509 call!14508)) (ite (or c!24481 c!24482) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 newMap!16)))))))

(declare-fun b!132286 () Bool)

(declare-fun res!63673 () Bool)

(assert (=> b!132286 (=> (not res!63673) (not e!86233))))

(assert (=> b!132286 (= res!63673 e!86235)))

(declare-fun res!63668 () Bool)

(assert (=> b!132286 (=> res!63668 e!86235)))

(assert (=> b!132286 (= res!63668 (not e!86236))))

(declare-fun res!63671 () Bool)

(assert (=> b!132286 (=> (not res!63671) (not e!86236))))

(assert (=> b!132286 (= res!63671 (bvslt #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))

(declare-fun b!132287 () Bool)

(assert (=> b!132287 (= e!86229 (validKeyInArray!0 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!132288 () Bool)

(assert (=> b!132288 (= e!86238 (= (apply!115 lt!69016 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)) (get!1483 (select (arr!2247 (ite (or c!24420 c!24415) (_values!2836 newMap!16) lt!68829)) #b00000000000000000000000000000000) (dynLambda!425 (defaultEntry!2853 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!132288 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2515 (ite (or c!24420 c!24415) (_values!2836 newMap!16) lt!68829))))))

(assert (=> b!132288 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))

(assert (= (and d!40345 c!24481) b!132273))

(assert (= (and d!40345 (not c!24481)) b!132270))

(assert (= (and b!132270 c!24482) b!132282))

(assert (= (and b!132270 (not c!24482)) b!132269))

(assert (= (and b!132269 c!24483) b!132271))

(assert (= (and b!132269 (not c!24483)) b!132283))

(assert (= (or b!132271 b!132283) bm!14510))

(assert (= (or b!132282 bm!14510) bm!14506))

(assert (= (or b!132282 b!132271) bm!14505))

(assert (= (or b!132273 bm!14506) bm!14507))

(assert (= (or b!132273 bm!14505) bm!14511))

(assert (= (and d!40345 res!63672) b!132287))

(assert (= (and d!40345 c!24485) b!132285))

(assert (= (and d!40345 (not c!24485)) b!132278))

(assert (= (and d!40345 res!63669) b!132286))

(assert (= (and b!132286 res!63671) b!132274))

(assert (= (and b!132286 (not res!63668)) b!132279))

(assert (= (and b!132279 res!63676) b!132288))

(assert (= (and b!132286 res!63673) b!132272))

(assert (= (and b!132272 c!24484) b!132281))

(assert (= (and b!132272 (not c!24484)) b!132275))

(assert (= (and b!132281 res!63674) b!132268))

(assert (= (or b!132281 b!132275) bm!14509))

(assert (= (and b!132272 res!63675) b!132277))

(assert (= (and b!132277 c!24486) b!132284))

(assert (= (and b!132277 (not c!24486)) b!132276))

(assert (= (and b!132284 res!63670) b!132280))

(assert (= (or b!132284 b!132276) bm!14508))

(declare-fun b_lambda!5895 () Bool)

(assert (=> (not b_lambda!5895) (not b!132288)))

(assert (=> b!132288 t!6129))

(declare-fun b_and!8193 () Bool)

(assert (= b_and!8189 (and (=> t!6129 result!3969) b_and!8193)))

(assert (=> b!132288 t!6131))

(declare-fun b_and!8195 () Bool)

(assert (= b_and!8191 (and (=> t!6131 result!3971) b_and!8195)))

(declare-fun m!156039 () Bool)

(assert (=> b!132285 m!156039))

(declare-fun m!156041 () Bool)

(assert (=> b!132285 m!156041))

(declare-fun m!156043 () Bool)

(assert (=> b!132285 m!156043))

(declare-fun m!156045 () Bool)

(assert (=> b!132285 m!156045))

(declare-fun m!156047 () Bool)

(assert (=> b!132285 m!156047))

(declare-fun m!156049 () Bool)

(assert (=> b!132285 m!156049))

(assert (=> b!132285 m!155855))

(assert (=> b!132285 m!156049))

(declare-fun m!156051 () Bool)

(assert (=> b!132285 m!156051))

(assert (=> b!132285 m!156041))

(declare-fun m!156053 () Bool)

(assert (=> b!132285 m!156053))

(assert (=> b!132285 m!156045))

(declare-fun m!156055 () Bool)

(assert (=> b!132285 m!156055))

(declare-fun m!156057 () Bool)

(assert (=> b!132285 m!156057))

(assert (=> b!132285 m!156057))

(declare-fun m!156059 () Bool)

(assert (=> b!132285 m!156059))

(declare-fun m!156061 () Bool)

(assert (=> b!132285 m!156061))

(declare-fun m!156063 () Bool)

(assert (=> b!132285 m!156063))

(declare-fun m!156065 () Bool)

(assert (=> b!132285 m!156065))

(declare-fun m!156067 () Bool)

(assert (=> b!132285 m!156067))

(declare-fun m!156069 () Bool)

(assert (=> b!132285 m!156069))

(declare-fun m!156071 () Bool)

(assert (=> bm!14508 m!156071))

(assert (=> bm!14507 m!156069))

(declare-fun m!156073 () Bool)

(assert (=> b!132288 m!156073))

(assert (=> b!132288 m!155855))

(assert (=> b!132288 m!155855))

(declare-fun m!156075 () Bool)

(assert (=> b!132288 m!156075))

(assert (=> b!132288 m!155883))

(assert (=> b!132288 m!156073))

(assert (=> b!132288 m!155883))

(declare-fun m!156077 () Bool)

(assert (=> b!132288 m!156077))

(declare-fun m!156079 () Bool)

(assert (=> b!132280 m!156079))

(assert (=> b!132287 m!155855))

(assert (=> b!132287 m!155855))

(assert (=> b!132287 m!155889))

(assert (=> d!40345 m!155815))

(declare-fun m!156081 () Bool)

(assert (=> b!132273 m!156081))

(declare-fun m!156083 () Bool)

(assert (=> bm!14511 m!156083))

(assert (=> b!132274 m!155855))

(assert (=> b!132274 m!155855))

(assert (=> b!132274 m!155889))

(assert (=> b!132279 m!155855))

(assert (=> b!132279 m!155855))

(declare-fun m!156085 () Bool)

(assert (=> b!132279 m!156085))

(declare-fun m!156087 () Bool)

(assert (=> b!132268 m!156087))

(declare-fun m!156089 () Bool)

(assert (=> bm!14509 m!156089))

(assert (=> bm!14475 d!40345))

(declare-fun d!40347 () Bool)

(assert (=> d!40347 (= (get!1485 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132092 d!40347))

(declare-fun b!132299 () Bool)

(declare-fun res!63687 () Bool)

(declare-fun e!86244 () Bool)

(assert (=> b!132299 (=> (not res!63687) (not e!86244))))

(declare-fun size!2520 (LongMapFixedSize!1090) (_ BitVec 32))

(assert (=> b!132299 (= res!63687 (= (size!2520 newMap!16) (bvadd (_size!594 newMap!16) (bvsdiv (bvadd (extraKeys!2620 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!40349 () Bool)

(declare-fun res!63688 () Bool)

(assert (=> d!40349 (=> (not res!63688) (not e!86244))))

(assert (=> d!40349 (= res!63688 (validMask!0 (mask!7147 newMap!16)))))

(assert (=> d!40349 (= (simpleValid!91 newMap!16) e!86244)))

(declare-fun b!132297 () Bool)

(declare-fun res!63686 () Bool)

(assert (=> b!132297 (=> (not res!63686) (not e!86244))))

(assert (=> b!132297 (= res!63686 (and (= (size!2515 (_values!2836 newMap!16)) (bvadd (mask!7147 newMap!16) #b00000000000000000000000000000001)) (= (size!2514 (_keys!4600 newMap!16)) (size!2515 (_values!2836 newMap!16))) (bvsge (_size!594 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!594 newMap!16) (bvadd (mask!7147 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!132298 () Bool)

(declare-fun res!63685 () Bool)

(assert (=> b!132298 (=> (not res!63685) (not e!86244))))

(assert (=> b!132298 (= res!63685 (bvsge (size!2520 newMap!16) (_size!594 newMap!16)))))

(declare-fun b!132300 () Bool)

(assert (=> b!132300 (= e!86244 (and (bvsge (extraKeys!2620 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2620 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!594 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!40349 res!63688) b!132297))

(assert (= (and b!132297 res!63686) b!132298))

(assert (= (and b!132298 res!63685) b!132299))

(assert (= (and b!132299 res!63687) b!132300))

(declare-fun m!156091 () Bool)

(assert (=> b!132299 m!156091))

(assert (=> d!40349 m!155815))

(assert (=> b!132298 m!156091))

(assert (=> d!40265 d!40349))

(declare-fun d!40351 () Bool)

(assert (=> d!40351 (= (+!168 (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) lt!68825 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!69035 () Unit!4122)

(declare-fun choose!818 (array!4749 array!4751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 V!3473 Int) Unit!4122)

(assert (=> d!40351 (= lt!69035 (choose!818 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) lt!68825 (zeroValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2709 newMap!16) (defaultEntry!2853 newMap!16)))))

(assert (=> d!40351 (validMask!0 (mask!7147 newMap!16))))

(assert (=> d!40351 (= (lemmaChangeZeroKeyThenAddPairToListMap!60 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) lt!68825 (zeroValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2709 newMap!16) (defaultEntry!2853 newMap!16)) lt!69035)))

(declare-fun bs!5490 () Bool)

(assert (= bs!5490 d!40351))

(assert (=> bs!5490 m!155815))

(assert (=> bs!5490 m!155557))

(declare-fun m!156093 () Bool)

(assert (=> bs!5490 m!156093))

(assert (=> bs!5490 m!155673))

(declare-fun m!156095 () Bool)

(assert (=> bs!5490 m!156095))

(assert (=> bs!5490 m!155557))

(declare-fun m!156097 () Bool)

(assert (=> bs!5490 m!156097))

(assert (=> bs!5490 m!155673))

(assert (=> b!132049 d!40351))

(declare-fun d!40353 () Bool)

(declare-fun e!86247 () Bool)

(assert (=> d!40353 e!86247))

(declare-fun res!63693 () Bool)

(assert (=> d!40353 (=> (not res!63693) (not e!86247))))

(declare-fun lt!69047 () ListLongMap!1651)

(assert (=> d!40353 (= res!63693 (contains!881 lt!69047 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(declare-fun lt!69045 () List!1691)

(assert (=> d!40353 (= lt!69047 (ListLongMap!1652 lt!69045))))

(declare-fun lt!69046 () Unit!4122)

(declare-fun lt!69044 () Unit!4122)

(assert (=> d!40353 (= lt!69046 lt!69044)))

(assert (=> d!40353 (= (getValueByKey!172 lt!69045 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))) (Some!177 (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!87 (List!1691 (_ BitVec 64) V!3473) Unit!4122)

(assert (=> d!40353 (= lt!69044 (lemmaContainsTupThenGetReturnValue!87 lt!69045 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992))))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(declare-fun insertStrictlySorted!90 (List!1691 (_ BitVec 64) V!3473) List!1691)

(assert (=> d!40353 (= lt!69045 (insertStrictlySorted!90 (toList!841 call!14410) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992))))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40353 (= (+!168 call!14410 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!69047)))

(declare-fun b!132305 () Bool)

(declare-fun res!63694 () Bool)

(assert (=> b!132305 (=> (not res!63694) (not e!86247))))

(assert (=> b!132305 (= res!63694 (= (getValueByKey!172 (toList!841 lt!69047) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))) (Some!177 (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992))))))))))

(declare-fun b!132306 () Bool)

(declare-fun contains!883 (List!1691 tuple2!2560) Bool)

(assert (=> b!132306 (= e!86247 (contains!883 (toList!841 lt!69047) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992))))))))

(assert (= (and d!40353 res!63693) b!132305))

(assert (= (and b!132305 res!63694) b!132306))

(declare-fun m!156099 () Bool)

(assert (=> d!40353 m!156099))

(declare-fun m!156101 () Bool)

(assert (=> d!40353 m!156101))

(declare-fun m!156103 () Bool)

(assert (=> d!40353 m!156103))

(declare-fun m!156105 () Bool)

(assert (=> d!40353 m!156105))

(declare-fun m!156107 () Bool)

(assert (=> b!132305 m!156107))

(declare-fun m!156109 () Bool)

(assert (=> b!132306 m!156109))

(assert (=> b!131942 d!40353))

(declare-fun d!40355 () Bool)

(declare-fun res!63695 () Bool)

(declare-fun e!86248 () Bool)

(assert (=> d!40355 (=> (not res!63695) (not e!86248))))

(assert (=> d!40355 (= res!63695 (simpleValid!91 (v!3187 (underlying!452 thiss!992))))))

(assert (=> d!40355 (= (valid!540 (v!3187 (underlying!452 thiss!992))) e!86248)))

(declare-fun b!132307 () Bool)

(declare-fun res!63696 () Bool)

(assert (=> b!132307 (=> (not res!63696) (not e!86248))))

(assert (=> b!132307 (= res!63696 (= (arrayCountValidKeys!0 (_keys!4600 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000000 (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))) (_size!594 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!132308 () Bool)

(declare-fun res!63697 () Bool)

(assert (=> b!132308 (=> (not res!63697) (not e!86248))))

(assert (=> b!132308 (= res!63697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4600 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!132309 () Bool)

(assert (=> b!132309 (= e!86248 (arrayNoDuplicates!0 (_keys!4600 (v!3187 (underlying!452 thiss!992))) #b00000000000000000000000000000000 Nil!1689))))

(assert (= (and d!40355 res!63695) b!132307))

(assert (= (and b!132307 res!63696) b!132308))

(assert (= (and b!132308 res!63697) b!132309))

(declare-fun m!156111 () Bool)

(assert (=> d!40355 m!156111))

(declare-fun m!156113 () Bool)

(assert (=> b!132307 m!156113))

(assert (=> b!132308 m!155537))

(assert (=> b!132309 m!155539))

(assert (=> d!40281 d!40355))

(declare-fun d!40357 () Bool)

(assert (=> d!40357 (= (+!168 (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!517 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) lt!68826 (zeroValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!69050 () Unit!4122)

(declare-fun choose!819 (array!4749 array!4751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 V!3473 Int) Unit!4122)

(assert (=> d!40357 (= lt!69050 (choose!819 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) lt!68826 (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2853 newMap!16)))))

(assert (=> d!40357 (validMask!0 (mask!7147 newMap!16))))

(assert (=> d!40357 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!60 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) lt!68826 (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2853 newMap!16)) lt!69050)))

(declare-fun bs!5491 () Bool)

(assert (= bs!5491 d!40357))

(assert (=> bs!5491 m!155673))

(assert (=> bs!5491 m!155557))

(declare-fun m!156115 () Bool)

(assert (=> bs!5491 m!156115))

(assert (=> bs!5491 m!155815))

(assert (=> bs!5491 m!155557))

(declare-fun m!156117 () Bool)

(assert (=> bs!5491 m!156117))

(assert (=> bs!5491 m!155673))

(declare-fun m!156119 () Bool)

(assert (=> bs!5491 m!156119))

(assert (=> b!132076 d!40357))

(declare-fun d!40359 () Bool)

(declare-fun e!86250 () Bool)

(assert (=> d!40359 e!86250))

(declare-fun res!63698 () Bool)

(assert (=> d!40359 (=> res!63698 e!86250)))

(declare-fun lt!69052 () Bool)

(assert (=> d!40359 (= res!63698 (not lt!69052))))

(declare-fun lt!69053 () Bool)

(assert (=> d!40359 (= lt!69052 lt!69053)))

(declare-fun lt!69054 () Unit!4122)

(declare-fun e!86249 () Unit!4122)

(assert (=> d!40359 (= lt!69054 e!86249)))

(declare-fun c!24487 () Bool)

(assert (=> d!40359 (= c!24487 lt!69053)))

(assert (=> d!40359 (= lt!69053 (containsKey!175 (toList!841 call!14466) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> d!40359 (= (contains!881 call!14466 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)) lt!69052)))

(declare-fun b!132310 () Bool)

(declare-fun lt!69051 () Unit!4122)

(assert (=> b!132310 (= e!86249 lt!69051)))

(assert (=> b!132310 (= lt!69051 (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!841 call!14466) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> b!132310 (isDefined!124 (getValueByKey!172 (toList!841 call!14466) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(declare-fun b!132311 () Bool)

(declare-fun Unit!4138 () Unit!4122)

(assert (=> b!132311 (= e!86249 Unit!4138)))

(declare-fun b!132312 () Bool)

(assert (=> b!132312 (= e!86250 (isDefined!124 (getValueByKey!172 (toList!841 call!14466) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355))))))

(assert (= (and d!40359 c!24487) b!132310))

(assert (= (and d!40359 (not c!24487)) b!132311))

(assert (= (and d!40359 (not res!63698)) b!132312))

(assert (=> d!40359 m!155543))

(declare-fun m!156121 () Bool)

(assert (=> d!40359 m!156121))

(assert (=> b!132310 m!155543))

(declare-fun m!156123 () Bool)

(assert (=> b!132310 m!156123))

(assert (=> b!132310 m!155543))

(declare-fun m!156125 () Bool)

(assert (=> b!132310 m!156125))

(assert (=> b!132310 m!156125))

(declare-fun m!156127 () Bool)

(assert (=> b!132310 m!156127))

(assert (=> b!132312 m!155543))

(assert (=> b!132312 m!156125))

(assert (=> b!132312 m!156125))

(assert (=> b!132312 m!156127))

(assert (=> b!132062 d!40359))

(declare-fun d!40361 () Bool)

(declare-fun e!86271 () Bool)

(assert (=> d!40361 e!86271))

(declare-fun res!63707 () Bool)

(assert (=> d!40361 (=> (not res!63707) (not e!86271))))

(declare-fun lt!69073 () ListLongMap!1651)

(assert (=> d!40361 (= res!63707 (not (contains!881 lt!69073 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!86269 () ListLongMap!1651)

(assert (=> d!40361 (= lt!69073 e!86269)))

(declare-fun c!24499 () Bool)

(assert (=> d!40361 (= c!24499 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> d!40361 (validMask!0 (mask!7147 (v!3187 (underlying!452 thiss!992))))))

(assert (=> d!40361 (= (getCurrentListMapNoExtraKeys!135 (_keys!4600 (v!3187 (underlying!452 thiss!992))) (_values!2836 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992))) (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) (zeroValue!2709 (v!3187 (underlying!452 thiss!992))) (minValue!2709 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2853 (v!3187 (underlying!452 thiss!992)))) lt!69073)))

(declare-fun b!132337 () Bool)

(assert (=> b!132337 (= e!86269 (ListLongMap!1652 Nil!1688))))

(declare-fun b!132338 () Bool)

(declare-fun e!86266 () Bool)

(assert (=> b!132338 (= e!86266 (validKeyInArray!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!132338 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!132339 () Bool)

(declare-fun e!86267 () Bool)

(declare-fun e!86268 () Bool)

(assert (=> b!132339 (= e!86267 e!86268)))

(assert (=> b!132339 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun res!63709 () Bool)

(assert (=> b!132339 (= res!63709 (contains!881 lt!69073 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!132339 (=> (not res!63709) (not e!86268))))

(declare-fun b!132340 () Bool)

(declare-fun e!86270 () ListLongMap!1651)

(assert (=> b!132340 (= e!86269 e!86270)))

(declare-fun c!24498 () Bool)

(assert (=> b!132340 (= c!24498 (validKeyInArray!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!132341 () Bool)

(declare-fun call!14517 () ListLongMap!1651)

(assert (=> b!132341 (= e!86270 call!14517)))

(declare-fun b!132342 () Bool)

(declare-fun e!86265 () Bool)

(assert (=> b!132342 (= e!86267 e!86265)))

(declare-fun c!24497 () Bool)

(assert (=> b!132342 (= c!24497 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun b!132343 () Bool)

(assert (=> b!132343 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> b!132343 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2515 (_values!2836 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> b!132343 (= e!86268 (= (apply!115 lt!69073 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!14514 () Bool)

(assert (=> bm!14514 (= call!14517 (getCurrentListMapNoExtraKeys!135 (_keys!4600 (v!3187 (underlying!452 thiss!992))) (_values!2836 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992))) (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) (zeroValue!2709 (v!3187 (underlying!452 thiss!992))) (minValue!2709 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2853 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!132344 () Bool)

(declare-fun res!63708 () Bool)

(assert (=> b!132344 (=> (not res!63708) (not e!86271))))

(assert (=> b!132344 (= res!63708 (not (contains!881 lt!69073 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!132345 () Bool)

(declare-fun lt!69071 () Unit!4122)

(declare-fun lt!69074 () Unit!4122)

(assert (=> b!132345 (= lt!69071 lt!69074)))

(declare-fun lt!69070 () (_ BitVec 64))

(declare-fun lt!69069 () (_ BitVec 64))

(declare-fun lt!69072 () ListLongMap!1651)

(declare-fun lt!69075 () V!3473)

(assert (=> b!132345 (not (contains!881 (+!168 lt!69072 (tuple2!2561 lt!69069 lt!69075)) lt!69070))))

(declare-fun addStillNotContains!62 (ListLongMap!1651 (_ BitVec 64) V!3473 (_ BitVec 64)) Unit!4122)

(assert (=> b!132345 (= lt!69074 (addStillNotContains!62 lt!69072 lt!69069 lt!69075 lt!69070))))

(assert (=> b!132345 (= lt!69070 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!132345 (= lt!69075 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132345 (= lt!69069 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!132345 (= lt!69072 call!14517)))

(assert (=> b!132345 (= e!86270 (+!168 call!14517 (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!132346 () Bool)

(declare-fun isEmpty!414 (ListLongMap!1651) Bool)

(assert (=> b!132346 (= e!86265 (isEmpty!414 lt!69073))))

(declare-fun b!132347 () Bool)

(assert (=> b!132347 (= e!86265 (= lt!69073 (getCurrentListMapNoExtraKeys!135 (_keys!4600 (v!3187 (underlying!452 thiss!992))) (_values!2836 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992))) (extraKeys!2620 (v!3187 (underlying!452 thiss!992))) (zeroValue!2709 (v!3187 (underlying!452 thiss!992))) (minValue!2709 (v!3187 (underlying!452 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))))))))

(declare-fun b!132348 () Bool)

(assert (=> b!132348 (= e!86271 e!86267)))

(declare-fun c!24496 () Bool)

(assert (=> b!132348 (= c!24496 e!86266)))

(declare-fun res!63710 () Bool)

(assert (=> b!132348 (=> (not res!63710) (not e!86266))))

(assert (=> b!132348 (= res!63710 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))))

(assert (= (and d!40361 c!24499) b!132337))

(assert (= (and d!40361 (not c!24499)) b!132340))

(assert (= (and b!132340 c!24498) b!132345))

(assert (= (and b!132340 (not c!24498)) b!132341))

(assert (= (or b!132345 b!132341) bm!14514))

(assert (= (and d!40361 res!63707) b!132344))

(assert (= (and b!132344 res!63708) b!132348))

(assert (= (and b!132348 res!63710) b!132338))

(assert (= (and b!132348 c!24496) b!132339))

(assert (= (and b!132348 (not c!24496)) b!132342))

(assert (= (and b!132339 res!63709) b!132343))

(assert (= (and b!132342 c!24497) b!132347))

(assert (= (and b!132342 (not c!24497)) b!132346))

(declare-fun b_lambda!5897 () Bool)

(assert (=> (not b_lambda!5897) (not b!132343)))

(assert (=> b!132343 t!6115))

(declare-fun b_and!8197 () Bool)

(assert (= b_and!8193 (and (=> t!6115 result!3949) b_and!8197)))

(assert (=> b!132343 t!6117))

(declare-fun b_and!8199 () Bool)

(assert (= b_and!8195 (and (=> t!6117 result!3953) b_and!8199)))

(declare-fun b_lambda!5899 () Bool)

(assert (=> (not b_lambda!5899) (not b!132345)))

(assert (=> b!132345 t!6115))

(declare-fun b_and!8201 () Bool)

(assert (= b_and!8197 (and (=> t!6115 result!3949) b_and!8201)))

(assert (=> b!132345 t!6117))

(declare-fun b_and!8203 () Bool)

(assert (= b_and!8199 (and (=> t!6117 result!3953) b_and!8203)))

(assert (=> b!132345 m!155711))

(assert (=> b!132345 m!155555))

(declare-fun m!156129 () Bool)

(assert (=> b!132345 m!156129))

(declare-fun m!156131 () Bool)

(assert (=> b!132345 m!156131))

(declare-fun m!156133 () Bool)

(assert (=> b!132345 m!156133))

(declare-fun m!156135 () Bool)

(assert (=> b!132345 m!156135))

(assert (=> b!132345 m!156133))

(assert (=> b!132345 m!155711))

(assert (=> b!132345 m!155555))

(assert (=> b!132345 m!155715))

(assert (=> b!132345 m!155687))

(assert (=> b!132338 m!155687))

(assert (=> b!132338 m!155687))

(assert (=> b!132338 m!155719))

(declare-fun m!156137 () Bool)

(assert (=> d!40361 m!156137))

(assert (=> d!40361 m!155563))

(declare-fun m!156139 () Bool)

(assert (=> b!132346 m!156139))

(assert (=> b!132339 m!155687))

(assert (=> b!132339 m!155687))

(declare-fun m!156141 () Bool)

(assert (=> b!132339 m!156141))

(declare-fun m!156143 () Bool)

(assert (=> bm!14514 m!156143))

(assert (=> b!132343 m!155711))

(assert (=> b!132343 m!155555))

(assert (=> b!132343 m!155687))

(declare-fun m!156145 () Bool)

(assert (=> b!132343 m!156145))

(assert (=> b!132343 m!155711))

(assert (=> b!132343 m!155555))

(assert (=> b!132343 m!155715))

(assert (=> b!132343 m!155687))

(assert (=> b!132340 m!155687))

(assert (=> b!132340 m!155687))

(assert (=> b!132340 m!155719))

(declare-fun m!156147 () Bool)

(assert (=> b!132344 m!156147))

(assert (=> b!132347 m!156143))

(assert (=> bm!14404 d!40361))

(declare-fun bm!14515 () Bool)

(declare-fun call!14524 () ListLongMap!1651)

(declare-fun call!14523 () ListLongMap!1651)

(assert (=> bm!14515 (= call!14524 call!14523)))

(declare-fun b!132349 () Bool)

(declare-fun e!86283 () Bool)

(declare-fun lt!69081 () ListLongMap!1651)

(assert (=> b!132349 (= e!86283 (= (apply!115 lt!69081 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!24420 c!24423) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16))))))

(declare-fun bm!14516 () Bool)

(declare-fun call!14519 () ListLongMap!1651)

(declare-fun call!14522 () ListLongMap!1651)

(assert (=> bm!14516 (= call!14519 call!14522)))

(declare-fun c!24502 () Bool)

(declare-fun b!132350 () Bool)

(assert (=> b!132350 (= c!24502 (and (not (= (bvand (ite c!24420 (ite c!24423 lt!68825 lt!68826) (extraKeys!2620 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!24420 (ite c!24423 lt!68825 lt!68826) (extraKeys!2620 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!86275 () ListLongMap!1651)

(declare-fun e!86277 () ListLongMap!1651)

(assert (=> b!132350 (= e!86275 e!86277)))

(declare-fun b!132351 () Bool)

(declare-fun e!86273 () ListLongMap!1651)

(assert (=> b!132351 (= e!86273 e!86275)))

(declare-fun c!24501 () Bool)

(assert (=> b!132351 (= c!24501 (and (not (= (bvand (ite c!24420 (ite c!24423 lt!68825 lt!68826) (extraKeys!2620 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!24420 (ite c!24423 lt!68825 lt!68826) (extraKeys!2620 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!132352 () Bool)

(assert (=> b!132352 (= e!86277 call!14524)))

(declare-fun b!132353 () Bool)

(declare-fun res!63718 () Bool)

(declare-fun e!86276 () Bool)

(assert (=> b!132353 (=> (not res!63718) (not e!86276))))

(declare-fun e!86284 () Bool)

(assert (=> b!132353 (= res!63718 e!86284)))

(declare-fun c!24503 () Bool)

(assert (=> b!132353 (= c!24503 (not (= (bvand (ite c!24420 (ite c!24423 lt!68825 lt!68826) (extraKeys!2620 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!14517 () Bool)

(assert (=> bm!14517 (= call!14522 (getCurrentListMapNoExtraKeys!135 (_keys!4600 newMap!16) (ite c!24420 (_values!2836 newMap!16) (array!4752 (store (arr!2247 (_values!2836 newMap!16)) (index!3232 lt!68835) (ValueCellFull!1091 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2515 (_values!2836 newMap!16)))) (mask!7147 newMap!16) (ite c!24420 (ite c!24423 lt!68825 lt!68826) (extraKeys!2620 newMap!16)) (ite (and c!24420 c!24423) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) (ite c!24420 (ite c!24423 (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun bm!14518 () Bool)

(declare-fun call!14520 () Bool)

(assert (=> bm!14518 (= call!14520 (contains!881 lt!69081 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132354 () Bool)

(assert (=> b!132354 (= e!86273 (+!168 call!14523 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!24420 (ite c!24423 (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)))))))

(declare-fun b!132355 () Bool)

(declare-fun e!86279 () Bool)

(assert (=> b!132355 (= e!86279 (validKeyInArray!0 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!132356 () Bool)

(declare-fun call!14521 () Bool)

(assert (=> b!132356 (= e!86284 (not call!14521))))

(declare-fun b!132357 () Bool)

(declare-fun e!86274 () Bool)

(assert (=> b!132357 (= e!86274 (not call!14520))))

(declare-fun b!132358 () Bool)

(assert (=> b!132358 (= e!86276 e!86274)))

(declare-fun c!24505 () Bool)

(assert (=> b!132358 (= c!24505 (not (= (bvand (ite c!24420 (ite c!24423 lt!68825 lt!68826) (extraKeys!2620 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14519 () Bool)

(assert (=> bm!14519 (= call!14521 (contains!881 lt!69081 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!40363 () Bool)

(assert (=> d!40363 e!86276))

(declare-fun res!63712 () Bool)

(assert (=> d!40363 (=> (not res!63712) (not e!86276))))

(assert (=> d!40363 (= res!63712 (or (bvsge #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))))

(declare-fun lt!69095 () ListLongMap!1651)

(assert (=> d!40363 (= lt!69081 lt!69095)))

(declare-fun lt!69077 () Unit!4122)

(declare-fun e!86280 () Unit!4122)

(assert (=> d!40363 (= lt!69077 e!86280)))

(declare-fun c!24504 () Bool)

(declare-fun e!86272 () Bool)

(assert (=> d!40363 (= c!24504 e!86272)))

(declare-fun res!63715 () Bool)

(assert (=> d!40363 (=> (not res!63715) (not e!86272))))

(assert (=> d!40363 (= res!63715 (bvslt #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))

(assert (=> d!40363 (= lt!69095 e!86273)))

(declare-fun c!24500 () Bool)

(assert (=> d!40363 (= c!24500 (and (not (= (bvand (ite c!24420 (ite c!24423 lt!68825 lt!68826) (extraKeys!2620 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!24420 (ite c!24423 lt!68825 lt!68826) (extraKeys!2620 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40363 (validMask!0 (mask!7147 newMap!16))))

(assert (=> d!40363 (= (getCurrentListMap!517 (_keys!4600 newMap!16) (ite c!24420 (_values!2836 newMap!16) (array!4752 (store (arr!2247 (_values!2836 newMap!16)) (index!3232 lt!68835) (ValueCellFull!1091 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2515 (_values!2836 newMap!16)))) (mask!7147 newMap!16) (ite c!24420 (ite c!24423 lt!68825 lt!68826) (extraKeys!2620 newMap!16)) (ite (and c!24420 c!24423) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) (ite c!24420 (ite c!24423 (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) lt!69081)))

(declare-fun b!132359 () Bool)

(declare-fun Unit!4139 () Unit!4122)

(assert (=> b!132359 (= e!86280 Unit!4139)))

(declare-fun b!132360 () Bool)

(declare-fun e!86278 () Bool)

(declare-fun e!86281 () Bool)

(assert (=> b!132360 (= e!86278 e!86281)))

(declare-fun res!63719 () Bool)

(assert (=> b!132360 (=> (not res!63719) (not e!86281))))

(assert (=> b!132360 (= res!63719 (contains!881 lt!69081 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!132360 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))

(declare-fun b!132361 () Bool)

(declare-fun e!86282 () Bool)

(assert (=> b!132361 (= e!86282 (= (apply!115 lt!69081 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!24420 (ite c!24423 (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16))))))

(declare-fun b!132362 () Bool)

(assert (=> b!132362 (= e!86284 e!86283)))

(declare-fun res!63717 () Bool)

(assert (=> b!132362 (= res!63717 call!14521)))

(assert (=> b!132362 (=> (not res!63717) (not e!86283))))

(declare-fun bm!14520 () Bool)

(declare-fun call!14518 () ListLongMap!1651)

(assert (=> bm!14520 (= call!14518 call!14519)))

(declare-fun b!132363 () Bool)

(assert (=> b!132363 (= e!86275 call!14524)))

(declare-fun b!132364 () Bool)

(assert (=> b!132364 (= e!86277 call!14518)))

(declare-fun b!132365 () Bool)

(assert (=> b!132365 (= e!86274 e!86282)))

(declare-fun res!63713 () Bool)

(assert (=> b!132365 (= res!63713 call!14520)))

(assert (=> b!132365 (=> (not res!63713) (not e!86282))))

(declare-fun b!132366 () Bool)

(declare-fun lt!69091 () Unit!4122)

(assert (=> b!132366 (= e!86280 lt!69091)))

(declare-fun lt!69096 () ListLongMap!1651)

(assert (=> b!132366 (= lt!69096 (getCurrentListMapNoExtraKeys!135 (_keys!4600 newMap!16) (ite c!24420 (_values!2836 newMap!16) (array!4752 (store (arr!2247 (_values!2836 newMap!16)) (index!3232 lt!68835) (ValueCellFull!1091 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2515 (_values!2836 newMap!16)))) (mask!7147 newMap!16) (ite c!24420 (ite c!24423 lt!68825 lt!68826) (extraKeys!2620 newMap!16)) (ite (and c!24420 c!24423) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) (ite c!24420 (ite c!24423 (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!69094 () (_ BitVec 64))

(assert (=> b!132366 (= lt!69094 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!69097 () (_ BitVec 64))

(assert (=> b!132366 (= lt!69097 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!69082 () Unit!4122)

(assert (=> b!132366 (= lt!69082 (addStillContains!91 lt!69096 lt!69094 (ite (and c!24420 c!24423) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) lt!69097))))

(assert (=> b!132366 (contains!881 (+!168 lt!69096 (tuple2!2561 lt!69094 (ite (and c!24420 c!24423) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)))) lt!69097)))

(declare-fun lt!69083 () Unit!4122)

(assert (=> b!132366 (= lt!69083 lt!69082)))

(declare-fun lt!69085 () ListLongMap!1651)

(assert (=> b!132366 (= lt!69085 (getCurrentListMapNoExtraKeys!135 (_keys!4600 newMap!16) (ite c!24420 (_values!2836 newMap!16) (array!4752 (store (arr!2247 (_values!2836 newMap!16)) (index!3232 lt!68835) (ValueCellFull!1091 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2515 (_values!2836 newMap!16)))) (mask!7147 newMap!16) (ite c!24420 (ite c!24423 lt!68825 lt!68826) (extraKeys!2620 newMap!16)) (ite (and c!24420 c!24423) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) (ite c!24420 (ite c!24423 (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!69078 () (_ BitVec 64))

(assert (=> b!132366 (= lt!69078 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!69086 () (_ BitVec 64))

(assert (=> b!132366 (= lt!69086 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!69079 () Unit!4122)

(assert (=> b!132366 (= lt!69079 (addApplyDifferent!91 lt!69085 lt!69078 (ite c!24420 (ite c!24423 (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) lt!69086))))

(assert (=> b!132366 (= (apply!115 (+!168 lt!69085 (tuple2!2561 lt!69078 (ite c!24420 (ite c!24423 (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)))) lt!69086) (apply!115 lt!69085 lt!69086))))

(declare-fun lt!69080 () Unit!4122)

(assert (=> b!132366 (= lt!69080 lt!69079)))

(declare-fun lt!69090 () ListLongMap!1651)

(assert (=> b!132366 (= lt!69090 (getCurrentListMapNoExtraKeys!135 (_keys!4600 newMap!16) (ite c!24420 (_values!2836 newMap!16) (array!4752 (store (arr!2247 (_values!2836 newMap!16)) (index!3232 lt!68835) (ValueCellFull!1091 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2515 (_values!2836 newMap!16)))) (mask!7147 newMap!16) (ite c!24420 (ite c!24423 lt!68825 lt!68826) (extraKeys!2620 newMap!16)) (ite (and c!24420 c!24423) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) (ite c!24420 (ite c!24423 (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!69076 () (_ BitVec 64))

(assert (=> b!132366 (= lt!69076 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!69087 () (_ BitVec 64))

(assert (=> b!132366 (= lt!69087 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!69084 () Unit!4122)

(assert (=> b!132366 (= lt!69084 (addApplyDifferent!91 lt!69090 lt!69076 (ite (and c!24420 c!24423) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) lt!69087))))

(assert (=> b!132366 (= (apply!115 (+!168 lt!69090 (tuple2!2561 lt!69076 (ite (and c!24420 c!24423) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)))) lt!69087) (apply!115 lt!69090 lt!69087))))

(declare-fun lt!69089 () Unit!4122)

(assert (=> b!132366 (= lt!69089 lt!69084)))

(declare-fun lt!69092 () ListLongMap!1651)

(assert (=> b!132366 (= lt!69092 (getCurrentListMapNoExtraKeys!135 (_keys!4600 newMap!16) (ite c!24420 (_values!2836 newMap!16) (array!4752 (store (arr!2247 (_values!2836 newMap!16)) (index!3232 lt!68835) (ValueCellFull!1091 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2515 (_values!2836 newMap!16)))) (mask!7147 newMap!16) (ite c!24420 (ite c!24423 lt!68825 lt!68826) (extraKeys!2620 newMap!16)) (ite (and c!24420 c!24423) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) (ite c!24420 (ite c!24423 (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!69093 () (_ BitVec 64))

(assert (=> b!132366 (= lt!69093 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!69088 () (_ BitVec 64))

(assert (=> b!132366 (= lt!69088 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!132366 (= lt!69091 (addApplyDifferent!91 lt!69092 lt!69093 (ite c!24420 (ite c!24423 (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) lt!69088))))

(assert (=> b!132366 (= (apply!115 (+!168 lt!69092 (tuple2!2561 lt!69093 (ite c!24420 (ite c!24423 (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)))) lt!69088) (apply!115 lt!69092 lt!69088))))

(declare-fun bm!14521 () Bool)

(assert (=> bm!14521 (= call!14523 (+!168 (ite c!24500 call!14522 (ite c!24501 call!14519 call!14518)) (ite (or c!24500 c!24501) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!24420 c!24423) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!24420 (ite c!24423 (minValue!2709 newMap!16) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16))))))))

(declare-fun b!132367 () Bool)

(declare-fun res!63716 () Bool)

(assert (=> b!132367 (=> (not res!63716) (not e!86276))))

(assert (=> b!132367 (= res!63716 e!86278)))

(declare-fun res!63711 () Bool)

(assert (=> b!132367 (=> res!63711 e!86278)))

(assert (=> b!132367 (= res!63711 (not e!86279))))

(declare-fun res!63714 () Bool)

(assert (=> b!132367 (=> (not res!63714) (not e!86279))))

(assert (=> b!132367 (= res!63714 (bvslt #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))

(declare-fun b!132368 () Bool)

(assert (=> b!132368 (= e!86272 (validKeyInArray!0 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!132369 () Bool)

(assert (=> b!132369 (= e!86281 (= (apply!115 lt!69081 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)) (get!1483 (select (arr!2247 (ite c!24420 (_values!2836 newMap!16) (array!4752 (store (arr!2247 (_values!2836 newMap!16)) (index!3232 lt!68835) (ValueCellFull!1091 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2515 (_values!2836 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!425 (defaultEntry!2853 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!132369 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2515 (ite c!24420 (_values!2836 newMap!16) (array!4752 (store (arr!2247 (_values!2836 newMap!16)) (index!3232 lt!68835) (ValueCellFull!1091 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2515 (_values!2836 newMap!16)))))))))

(assert (=> b!132369 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))

(assert (= (and d!40363 c!24500) b!132354))

(assert (= (and d!40363 (not c!24500)) b!132351))

(assert (= (and b!132351 c!24501) b!132363))

(assert (= (and b!132351 (not c!24501)) b!132350))

(assert (= (and b!132350 c!24502) b!132352))

(assert (= (and b!132350 (not c!24502)) b!132364))

(assert (= (or b!132352 b!132364) bm!14520))

(assert (= (or b!132363 bm!14520) bm!14516))

(assert (= (or b!132363 b!132352) bm!14515))

(assert (= (or b!132354 bm!14516) bm!14517))

(assert (= (or b!132354 bm!14515) bm!14521))

(assert (= (and d!40363 res!63715) b!132368))

(assert (= (and d!40363 c!24504) b!132366))

(assert (= (and d!40363 (not c!24504)) b!132359))

(assert (= (and d!40363 res!63712) b!132367))

(assert (= (and b!132367 res!63714) b!132355))

(assert (= (and b!132367 (not res!63711)) b!132360))

(assert (= (and b!132360 res!63719) b!132369))

(assert (= (and b!132367 res!63716) b!132353))

(assert (= (and b!132353 c!24503) b!132362))

(assert (= (and b!132353 (not c!24503)) b!132356))

(assert (= (and b!132362 res!63717) b!132349))

(assert (= (or b!132362 b!132356) bm!14519))

(assert (= (and b!132353 res!63718) b!132358))

(assert (= (and b!132358 c!24505) b!132365))

(assert (= (and b!132358 (not c!24505)) b!132357))

(assert (= (and b!132365 res!63713) b!132361))

(assert (= (or b!132365 b!132357) bm!14518))

(declare-fun b_lambda!5901 () Bool)

(assert (=> (not b_lambda!5901) (not b!132369)))

(assert (=> b!132369 t!6129))

(declare-fun b_and!8205 () Bool)

(assert (= b_and!8201 (and (=> t!6129 result!3969) b_and!8205)))

(assert (=> b!132369 t!6131))

(declare-fun b_and!8207 () Bool)

(assert (= b_and!8203 (and (=> t!6131 result!3971) b_and!8207)))

(declare-fun m!156149 () Bool)

(assert (=> b!132366 m!156149))

(declare-fun m!156151 () Bool)

(assert (=> b!132366 m!156151))

(declare-fun m!156153 () Bool)

(assert (=> b!132366 m!156153))

(declare-fun m!156155 () Bool)

(assert (=> b!132366 m!156155))

(declare-fun m!156157 () Bool)

(assert (=> b!132366 m!156157))

(declare-fun m!156159 () Bool)

(assert (=> b!132366 m!156159))

(assert (=> b!132366 m!155855))

(assert (=> b!132366 m!156159))

(declare-fun m!156161 () Bool)

(assert (=> b!132366 m!156161))

(assert (=> b!132366 m!156151))

(declare-fun m!156163 () Bool)

(assert (=> b!132366 m!156163))

(assert (=> b!132366 m!156155))

(declare-fun m!156165 () Bool)

(assert (=> b!132366 m!156165))

(declare-fun m!156167 () Bool)

(assert (=> b!132366 m!156167))

(assert (=> b!132366 m!156167))

(declare-fun m!156169 () Bool)

(assert (=> b!132366 m!156169))

(declare-fun m!156171 () Bool)

(assert (=> b!132366 m!156171))

(declare-fun m!156173 () Bool)

(assert (=> b!132366 m!156173))

(declare-fun m!156175 () Bool)

(assert (=> b!132366 m!156175))

(declare-fun m!156177 () Bool)

(assert (=> b!132366 m!156177))

(declare-fun m!156179 () Bool)

(assert (=> b!132366 m!156179))

(declare-fun m!156181 () Bool)

(assert (=> bm!14518 m!156181))

(assert (=> bm!14517 m!156179))

(declare-fun m!156183 () Bool)

(assert (=> b!132369 m!156183))

(assert (=> b!132369 m!155855))

(assert (=> b!132369 m!155855))

(declare-fun m!156185 () Bool)

(assert (=> b!132369 m!156185))

(assert (=> b!132369 m!155883))

(assert (=> b!132369 m!156183))

(assert (=> b!132369 m!155883))

(declare-fun m!156187 () Bool)

(assert (=> b!132369 m!156187))

(declare-fun m!156189 () Bool)

(assert (=> b!132361 m!156189))

(assert (=> b!132368 m!155855))

(assert (=> b!132368 m!155855))

(assert (=> b!132368 m!155889))

(assert (=> d!40363 m!155815))

(declare-fun m!156191 () Bool)

(assert (=> b!132354 m!156191))

(declare-fun m!156193 () Bool)

(assert (=> bm!14521 m!156193))

(assert (=> b!132355 m!155855))

(assert (=> b!132355 m!155855))

(assert (=> b!132355 m!155889))

(assert (=> b!132360 m!155855))

(assert (=> b!132360 m!155855))

(declare-fun m!156195 () Bool)

(assert (=> b!132360 m!156195))

(declare-fun m!156197 () Bool)

(assert (=> b!132349 m!156197))

(declare-fun m!156199 () Bool)

(assert (=> bm!14519 m!156199))

(assert (=> bm!14465 d!40363))

(declare-fun d!40365 () Bool)

(declare-fun e!86285 () Bool)

(assert (=> d!40365 e!86285))

(declare-fun res!63720 () Bool)

(assert (=> d!40365 (=> (not res!63720) (not e!86285))))

(declare-fun lt!69101 () ListLongMap!1651)

(assert (=> d!40365 (= res!63720 (contains!881 lt!69101 (_1!1291 (ite (or c!24380 c!24381) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992))))))))))

(declare-fun lt!69099 () List!1691)

(assert (=> d!40365 (= lt!69101 (ListLongMap!1652 lt!69099))))

(declare-fun lt!69100 () Unit!4122)

(declare-fun lt!69098 () Unit!4122)

(assert (=> d!40365 (= lt!69100 lt!69098)))

(assert (=> d!40365 (= (getValueByKey!172 lt!69099 (_1!1291 (ite (or c!24380 c!24381) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992))))))) (Some!177 (_2!1291 (ite (or c!24380 c!24381) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992))))))))))

(assert (=> d!40365 (= lt!69098 (lemmaContainsTupThenGetReturnValue!87 lt!69099 (_1!1291 (ite (or c!24380 c!24381) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))) (_2!1291 (ite (or c!24380 c!24381) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992))))))))))

(assert (=> d!40365 (= lt!69099 (insertStrictlySorted!90 (toList!841 (ite c!24380 call!14409 (ite c!24381 call!14406 call!14405))) (_1!1291 (ite (or c!24380 c!24381) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))) (_2!1291 (ite (or c!24380 c!24381) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992))))))))))

(assert (=> d!40365 (= (+!168 (ite c!24380 call!14409 (ite c!24381 call!14406 call!14405)) (ite (or c!24380 c!24381) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))) lt!69101)))

(declare-fun b!132370 () Bool)

(declare-fun res!63721 () Bool)

(assert (=> b!132370 (=> (not res!63721) (not e!86285))))

(assert (=> b!132370 (= res!63721 (= (getValueByKey!172 (toList!841 lt!69101) (_1!1291 (ite (or c!24380 c!24381) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992))))))) (Some!177 (_2!1291 (ite (or c!24380 c!24381) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))))))))

(declare-fun b!132371 () Bool)

(assert (=> b!132371 (= e!86285 (contains!883 (toList!841 lt!69101) (ite (or c!24380 c!24381) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(assert (= (and d!40365 res!63720) b!132370))

(assert (= (and b!132370 res!63721) b!132371))

(declare-fun m!156201 () Bool)

(assert (=> d!40365 m!156201))

(declare-fun m!156203 () Bool)

(assert (=> d!40365 m!156203))

(declare-fun m!156205 () Bool)

(assert (=> d!40365 m!156205))

(declare-fun m!156207 () Bool)

(assert (=> d!40365 m!156207))

(declare-fun m!156209 () Bool)

(assert (=> b!132370 m!156209))

(declare-fun m!156211 () Bool)

(assert (=> b!132371 m!156211))

(assert (=> bm!14408 d!40365))

(assert (=> b!131956 d!40305))

(declare-fun d!40367 () Bool)

(declare-fun e!86286 () Bool)

(assert (=> d!40367 e!86286))

(declare-fun res!63722 () Bool)

(assert (=> d!40367 (=> (not res!63722) (not e!86286))))

(declare-fun lt!69105 () ListLongMap!1651)

(assert (=> d!40367 (= res!63722 (contains!881 lt!69105 (_1!1291 (tuple2!2561 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(declare-fun lt!69103 () List!1691)

(assert (=> d!40367 (= lt!69105 (ListLongMap!1652 lt!69103))))

(declare-fun lt!69104 () Unit!4122)

(declare-fun lt!69102 () Unit!4122)

(assert (=> d!40367 (= lt!69104 lt!69102)))

(assert (=> d!40367 (= (getValueByKey!172 lt!69103 (_1!1291 (tuple2!2561 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))) (Some!177 (_2!1291 (tuple2!2561 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40367 (= lt!69102 (lemmaContainsTupThenGetReturnValue!87 lt!69103 (_1!1291 (tuple2!2561 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992))))) (_2!1291 (tuple2!2561 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40367 (= lt!69103 (insertStrictlySorted!90 (toList!841 lt!68746) (_1!1291 (tuple2!2561 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992))))) (_2!1291 (tuple2!2561 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40367 (= (+!168 lt!68746 (tuple2!2561 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!69105)))

(declare-fun b!132372 () Bool)

(declare-fun res!63723 () Bool)

(assert (=> b!132372 (=> (not res!63723) (not e!86286))))

(assert (=> b!132372 (= res!63723 (= (getValueByKey!172 (toList!841 lt!69105) (_1!1291 (tuple2!2561 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))) (Some!177 (_2!1291 (tuple2!2561 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992))))))))))

(declare-fun b!132373 () Bool)

(assert (=> b!132373 (= e!86286 (contains!883 (toList!841 lt!69105) (tuple2!2561 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992))))))))

(assert (= (and d!40367 res!63722) b!132372))

(assert (= (and b!132372 res!63723) b!132373))

(declare-fun m!156213 () Bool)

(assert (=> d!40367 m!156213))

(declare-fun m!156215 () Bool)

(assert (=> d!40367 m!156215))

(declare-fun m!156217 () Bool)

(assert (=> d!40367 m!156217))

(declare-fun m!156219 () Bool)

(assert (=> d!40367 m!156219))

(declare-fun m!156221 () Bool)

(assert (=> b!132372 m!156221))

(declare-fun m!156223 () Bool)

(assert (=> b!132373 m!156223))

(assert (=> b!131954 d!40367))

(declare-fun d!40369 () Bool)

(declare-fun e!86287 () Bool)

(assert (=> d!40369 e!86287))

(declare-fun res!63724 () Bool)

(assert (=> d!40369 (=> (not res!63724) (not e!86287))))

(declare-fun lt!69109 () ListLongMap!1651)

(assert (=> d!40369 (= res!63724 (contains!881 lt!69109 (_1!1291 (tuple2!2561 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(declare-fun lt!69107 () List!1691)

(assert (=> d!40369 (= lt!69109 (ListLongMap!1652 lt!69107))))

(declare-fun lt!69108 () Unit!4122)

(declare-fun lt!69106 () Unit!4122)

(assert (=> d!40369 (= lt!69108 lt!69106)))

(assert (=> d!40369 (= (getValueByKey!172 lt!69107 (_1!1291 (tuple2!2561 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))) (Some!177 (_2!1291 (tuple2!2561 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40369 (= lt!69106 (lemmaContainsTupThenGetReturnValue!87 lt!69107 (_1!1291 (tuple2!2561 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992))))) (_2!1291 (tuple2!2561 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40369 (= lt!69107 (insertStrictlySorted!90 (toList!841 lt!68753) (_1!1291 (tuple2!2561 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992))))) (_2!1291 (tuple2!2561 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40369 (= (+!168 lt!68753 (tuple2!2561 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!69109)))

(declare-fun b!132374 () Bool)

(declare-fun res!63725 () Bool)

(assert (=> b!132374 (=> (not res!63725) (not e!86287))))

(assert (=> b!132374 (= res!63725 (= (getValueByKey!172 (toList!841 lt!69109) (_1!1291 (tuple2!2561 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))) (Some!177 (_2!1291 (tuple2!2561 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992))))))))))

(declare-fun b!132375 () Bool)

(assert (=> b!132375 (= e!86287 (contains!883 (toList!841 lt!69109) (tuple2!2561 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992))))))))

(assert (= (and d!40369 res!63724) b!132374))

(assert (= (and b!132374 res!63725) b!132375))

(declare-fun m!156225 () Bool)

(assert (=> d!40369 m!156225))

(declare-fun m!156227 () Bool)

(assert (=> d!40369 m!156227))

(declare-fun m!156229 () Bool)

(assert (=> d!40369 m!156229))

(declare-fun m!156231 () Bool)

(assert (=> d!40369 m!156231))

(declare-fun m!156233 () Bool)

(assert (=> b!132374 m!156233))

(declare-fun m!156235 () Bool)

(assert (=> b!132375 m!156235))

(assert (=> b!131954 d!40369))

(declare-fun d!40371 () Bool)

(declare-fun e!86288 () Bool)

(assert (=> d!40371 e!86288))

(declare-fun res!63726 () Bool)

(assert (=> d!40371 (=> (not res!63726) (not e!86288))))

(declare-fun lt!69113 () ListLongMap!1651)

(assert (=> d!40371 (= res!63726 (contains!881 lt!69113 (_1!1291 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(declare-fun lt!69111 () List!1691)

(assert (=> d!40371 (= lt!69113 (ListLongMap!1652 lt!69111))))

(declare-fun lt!69112 () Unit!4122)

(declare-fun lt!69110 () Unit!4122)

(assert (=> d!40371 (= lt!69112 lt!69110)))

(assert (=> d!40371 (= (getValueByKey!172 lt!69111 (_1!1291 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))) (Some!177 (_2!1291 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40371 (= lt!69110 (lemmaContainsTupThenGetReturnValue!87 lt!69111 (_1!1291 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))))) (_2!1291 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40371 (= lt!69111 (insertStrictlySorted!90 (toList!841 lt!68757) (_1!1291 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))))) (_2!1291 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40371 (= (+!168 lt!68757 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!69113)))

(declare-fun b!132376 () Bool)

(declare-fun res!63727 () Bool)

(assert (=> b!132376 (=> (not res!63727) (not e!86288))))

(assert (=> b!132376 (= res!63727 (= (getValueByKey!172 (toList!841 lt!69113) (_1!1291 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))) (Some!177 (_2!1291 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))))))))))

(declare-fun b!132377 () Bool)

(assert (=> b!132377 (= e!86288 (contains!883 (toList!841 lt!69113) (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))))))))

(assert (= (and d!40371 res!63726) b!132376))

(assert (= (and b!132376 res!63727) b!132377))

(declare-fun m!156237 () Bool)

(assert (=> d!40371 m!156237))

(declare-fun m!156239 () Bool)

(assert (=> d!40371 m!156239))

(declare-fun m!156241 () Bool)

(assert (=> d!40371 m!156241))

(declare-fun m!156243 () Bool)

(assert (=> d!40371 m!156243))

(declare-fun m!156245 () Bool)

(assert (=> b!132376 m!156245))

(declare-fun m!156247 () Bool)

(assert (=> b!132377 m!156247))

(assert (=> b!131954 d!40371))

(assert (=> b!131954 d!40361))

(declare-fun d!40373 () Bool)

(assert (=> d!40373 (= (apply!115 (+!168 lt!68753 (tuple2!2561 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!68749) (apply!115 lt!68753 lt!68749))))

(declare-fun lt!69116 () Unit!4122)

(declare-fun choose!820 (ListLongMap!1651 (_ BitVec 64) V!3473 (_ BitVec 64)) Unit!4122)

(assert (=> d!40373 (= lt!69116 (choose!820 lt!68753 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992))) lt!68749))))

(declare-fun e!86291 () Bool)

(assert (=> d!40373 e!86291))

(declare-fun res!63730 () Bool)

(assert (=> d!40373 (=> (not res!63730) (not e!86291))))

(assert (=> d!40373 (= res!63730 (contains!881 lt!68753 lt!68749))))

(assert (=> d!40373 (= (addApplyDifferent!91 lt!68753 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992))) lt!68749) lt!69116)))

(declare-fun b!132381 () Bool)

(assert (=> b!132381 (= e!86291 (not (= lt!68749 lt!68754)))))

(assert (= (and d!40373 res!63730) b!132381))

(assert (=> d!40373 m!155699))

(declare-fun m!156249 () Bool)

(assert (=> d!40373 m!156249))

(assert (=> d!40373 m!155685))

(assert (=> d!40373 m!155685))

(assert (=> d!40373 m!155689))

(declare-fun m!156251 () Bool)

(assert (=> d!40373 m!156251))

(assert (=> b!131954 d!40373))

(declare-fun d!40375 () Bool)

(assert (=> d!40375 (= (apply!115 (+!168 lt!68751 (tuple2!2561 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!68748) (get!1486 (getValueByKey!172 (toList!841 (+!168 lt!68751 (tuple2!2561 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))) lt!68748)))))

(declare-fun bs!5492 () Bool)

(assert (= bs!5492 d!40375))

(declare-fun m!156253 () Bool)

(assert (=> bs!5492 m!156253))

(assert (=> bs!5492 m!156253))

(declare-fun m!156255 () Bool)

(assert (=> bs!5492 m!156255))

(assert (=> b!131954 d!40375))

(declare-fun d!40377 () Bool)

(assert (=> d!40377 (= (apply!115 lt!68753 lt!68749) (get!1486 (getValueByKey!172 (toList!841 lt!68753) lt!68749)))))

(declare-fun bs!5493 () Bool)

(assert (= bs!5493 d!40377))

(declare-fun m!156257 () Bool)

(assert (=> bs!5493 m!156257))

(assert (=> bs!5493 m!156257))

(declare-fun m!156259 () Bool)

(assert (=> bs!5493 m!156259))

(assert (=> b!131954 d!40377))

(declare-fun d!40379 () Bool)

(assert (=> d!40379 (= (apply!115 (+!168 lt!68746 (tuple2!2561 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!68747) (apply!115 lt!68746 lt!68747))))

(declare-fun lt!69117 () Unit!4122)

(assert (=> d!40379 (= lt!69117 (choose!820 lt!68746 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992))) lt!68747))))

(declare-fun e!86292 () Bool)

(assert (=> d!40379 e!86292))

(declare-fun res!63731 () Bool)

(assert (=> d!40379 (=> (not res!63731) (not e!86292))))

(assert (=> d!40379 (= res!63731 (contains!881 lt!68746 lt!68747))))

(assert (=> d!40379 (= (addApplyDifferent!91 lt!68746 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992))) lt!68747) lt!69117)))

(declare-fun b!132382 () Bool)

(assert (=> b!132382 (= e!86292 (not (= lt!68747 lt!68739)))))

(assert (= (and d!40379 res!63731) b!132382))

(assert (=> d!40379 m!155675))

(declare-fun m!156261 () Bool)

(assert (=> d!40379 m!156261))

(assert (=> d!40379 m!155677))

(assert (=> d!40379 m!155677))

(assert (=> d!40379 m!155679))

(declare-fun m!156263 () Bool)

(assert (=> d!40379 m!156263))

(assert (=> b!131954 d!40379))

(declare-fun d!40381 () Bool)

(assert (=> d!40381 (= (apply!115 lt!68751 lt!68748) (get!1486 (getValueByKey!172 (toList!841 lt!68751) lt!68748)))))

(declare-fun bs!5494 () Bool)

(assert (= bs!5494 d!40381))

(declare-fun m!156265 () Bool)

(assert (=> bs!5494 m!156265))

(assert (=> bs!5494 m!156265))

(declare-fun m!156267 () Bool)

(assert (=> bs!5494 m!156267))

(assert (=> b!131954 d!40381))

(declare-fun d!40383 () Bool)

(assert (=> d!40383 (contains!881 (+!168 lt!68757 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!68758)))

(declare-fun lt!69120 () Unit!4122)

(declare-fun choose!821 (ListLongMap!1651 (_ BitVec 64) V!3473 (_ BitVec 64)) Unit!4122)

(assert (=> d!40383 (= lt!69120 (choose!821 lt!68757 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))) lt!68758))))

(assert (=> d!40383 (contains!881 lt!68757 lt!68758)))

(assert (=> d!40383 (= (addStillContains!91 lt!68757 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))) lt!68758) lt!69120)))

(declare-fun bs!5495 () Bool)

(assert (= bs!5495 d!40383))

(assert (=> bs!5495 m!155681))

(assert (=> bs!5495 m!155681))

(assert (=> bs!5495 m!155683))

(declare-fun m!156269 () Bool)

(assert (=> bs!5495 m!156269))

(declare-fun m!156271 () Bool)

(assert (=> bs!5495 m!156271))

(assert (=> b!131954 d!40383))

(declare-fun d!40385 () Bool)

(assert (=> d!40385 (= (apply!115 (+!168 lt!68746 (tuple2!2561 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!68747) (get!1486 (getValueByKey!172 (toList!841 (+!168 lt!68746 (tuple2!2561 lt!68739 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))) lt!68747)))))

(declare-fun bs!5496 () Bool)

(assert (= bs!5496 d!40385))

(declare-fun m!156273 () Bool)

(assert (=> bs!5496 m!156273))

(assert (=> bs!5496 m!156273))

(declare-fun m!156275 () Bool)

(assert (=> bs!5496 m!156275))

(assert (=> b!131954 d!40385))

(declare-fun d!40387 () Bool)

(assert (=> d!40387 (= (apply!115 (+!168 lt!68751 (tuple2!2561 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!68748) (apply!115 lt!68751 lt!68748))))

(declare-fun lt!69121 () Unit!4122)

(assert (=> d!40387 (= lt!69121 (choose!820 lt!68751 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))) lt!68748))))

(declare-fun e!86293 () Bool)

(assert (=> d!40387 e!86293))

(declare-fun res!63732 () Bool)

(assert (=> d!40387 (=> (not res!63732) (not e!86293))))

(assert (=> d!40387 (= res!63732 (contains!881 lt!68751 lt!68748))))

(assert (=> d!40387 (= (addApplyDifferent!91 lt!68751 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))) lt!68748) lt!69121)))

(declare-fun b!132384 () Bool)

(assert (=> b!132384 (= e!86293 (not (= lt!68748 lt!68737)))))

(assert (= (and d!40387 res!63732) b!132384))

(assert (=> d!40387 m!155691))

(declare-fun m!156277 () Bool)

(assert (=> d!40387 m!156277))

(assert (=> d!40387 m!155695))

(assert (=> d!40387 m!155695))

(assert (=> d!40387 m!155697))

(declare-fun m!156279 () Bool)

(assert (=> d!40387 m!156279))

(assert (=> b!131954 d!40387))

(declare-fun d!40389 () Bool)

(assert (=> d!40389 (= (apply!115 (+!168 lt!68753 (tuple2!2561 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!68749) (get!1486 (getValueByKey!172 (toList!841 (+!168 lt!68753 (tuple2!2561 lt!68754 (minValue!2709 (v!3187 (underlying!452 thiss!992)))))) lt!68749)))))

(declare-fun bs!5497 () Bool)

(assert (= bs!5497 d!40389))

(declare-fun m!156281 () Bool)

(assert (=> bs!5497 m!156281))

(assert (=> bs!5497 m!156281))

(declare-fun m!156283 () Bool)

(assert (=> bs!5497 m!156283))

(assert (=> b!131954 d!40389))

(declare-fun d!40391 () Bool)

(declare-fun e!86295 () Bool)

(assert (=> d!40391 e!86295))

(declare-fun res!63733 () Bool)

(assert (=> d!40391 (=> res!63733 e!86295)))

(declare-fun lt!69123 () Bool)

(assert (=> d!40391 (= res!63733 (not lt!69123))))

(declare-fun lt!69124 () Bool)

(assert (=> d!40391 (= lt!69123 lt!69124)))

(declare-fun lt!69125 () Unit!4122)

(declare-fun e!86294 () Unit!4122)

(assert (=> d!40391 (= lt!69125 e!86294)))

(declare-fun c!24506 () Bool)

(assert (=> d!40391 (= c!24506 lt!69124)))

(assert (=> d!40391 (= lt!69124 (containsKey!175 (toList!841 (+!168 lt!68757 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))) lt!68758))))

(assert (=> d!40391 (= (contains!881 (+!168 lt!68757 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!68758) lt!69123)))

(declare-fun b!132385 () Bool)

(declare-fun lt!69122 () Unit!4122)

(assert (=> b!132385 (= e!86294 lt!69122)))

(assert (=> b!132385 (= lt!69122 (lemmaContainsKeyImpliesGetValueByKeyDefined!123 (toList!841 (+!168 lt!68757 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))) lt!68758))))

(assert (=> b!132385 (isDefined!124 (getValueByKey!172 (toList!841 (+!168 lt!68757 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))) lt!68758))))

(declare-fun b!132386 () Bool)

(declare-fun Unit!4140 () Unit!4122)

(assert (=> b!132386 (= e!86294 Unit!4140)))

(declare-fun b!132387 () Bool)

(assert (=> b!132387 (= e!86295 (isDefined!124 (getValueByKey!172 (toList!841 (+!168 lt!68757 (tuple2!2561 lt!68755 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))) lt!68758)))))

(assert (= (and d!40391 c!24506) b!132385))

(assert (= (and d!40391 (not c!24506)) b!132386))

(assert (= (and d!40391 (not res!63733)) b!132387))

(declare-fun m!156285 () Bool)

(assert (=> d!40391 m!156285))

(declare-fun m!156287 () Bool)

(assert (=> b!132385 m!156287))

(declare-fun m!156289 () Bool)

(assert (=> b!132385 m!156289))

(assert (=> b!132385 m!156289))

(declare-fun m!156291 () Bool)

(assert (=> b!132385 m!156291))

(assert (=> b!132387 m!156289))

(assert (=> b!132387 m!156289))

(assert (=> b!132387 m!156291))

(assert (=> b!131954 d!40391))

(declare-fun d!40393 () Bool)

(declare-fun e!86296 () Bool)

(assert (=> d!40393 e!86296))

(declare-fun res!63734 () Bool)

(assert (=> d!40393 (=> (not res!63734) (not e!86296))))

(declare-fun lt!69129 () ListLongMap!1651)

(assert (=> d!40393 (= res!63734 (contains!881 lt!69129 (_1!1291 (tuple2!2561 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(declare-fun lt!69127 () List!1691)

(assert (=> d!40393 (= lt!69129 (ListLongMap!1652 lt!69127))))

(declare-fun lt!69128 () Unit!4122)

(declare-fun lt!69126 () Unit!4122)

(assert (=> d!40393 (= lt!69128 lt!69126)))

(assert (=> d!40393 (= (getValueByKey!172 lt!69127 (_1!1291 (tuple2!2561 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))) (Some!177 (_2!1291 (tuple2!2561 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40393 (= lt!69126 (lemmaContainsTupThenGetReturnValue!87 lt!69127 (_1!1291 (tuple2!2561 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))))) (_2!1291 (tuple2!2561 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40393 (= lt!69127 (insertStrictlySorted!90 (toList!841 lt!68751) (_1!1291 (tuple2!2561 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))))) (_2!1291 (tuple2!2561 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))))))

(assert (=> d!40393 (= (+!168 lt!68751 (tuple2!2561 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))))) lt!69129)))

(declare-fun b!132388 () Bool)

(declare-fun res!63735 () Bool)

(assert (=> b!132388 (=> (not res!63735) (not e!86296))))

(assert (=> b!132388 (= res!63735 (= (getValueByKey!172 (toList!841 lt!69129) (_1!1291 (tuple2!2561 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992)))))) (Some!177 (_2!1291 (tuple2!2561 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))))))))))

(declare-fun b!132389 () Bool)

(assert (=> b!132389 (= e!86296 (contains!883 (toList!841 lt!69129) (tuple2!2561 lt!68737 (zeroValue!2709 (v!3187 (underlying!452 thiss!992))))))))

(assert (= (and d!40393 res!63734) b!132388))

(assert (= (and b!132388 res!63735) b!132389))

(declare-fun m!156293 () Bool)

(assert (=> d!40393 m!156293))

(declare-fun m!156295 () Bool)

(assert (=> d!40393 m!156295))

(declare-fun m!156297 () Bool)

(assert (=> d!40393 m!156297))

(declare-fun m!156299 () Bool)

(assert (=> d!40393 m!156299))

(declare-fun m!156301 () Bool)

(assert (=> b!132388 m!156301))

(declare-fun m!156303 () Bool)

(assert (=> b!132389 m!156303))

(assert (=> b!131954 d!40393))

(declare-fun d!40395 () Bool)

(assert (=> d!40395 (= (apply!115 lt!68746 lt!68747) (get!1486 (getValueByKey!172 (toList!841 lt!68746) lt!68747)))))

(declare-fun bs!5498 () Bool)

(assert (= bs!5498 d!40395))

(declare-fun m!156305 () Bool)

(assert (=> bs!5498 m!156305))

(assert (=> bs!5498 m!156305))

(declare-fun m!156307 () Bool)

(assert (=> bs!5498 m!156307))

(assert (=> b!131954 d!40395))

(assert (=> b!131872 d!40321))

(declare-fun b!132406 () Bool)

(declare-fun e!86305 () Bool)

(declare-fun lt!69134 () SeekEntryResult!268)

(assert (=> b!132406 (= e!86305 ((_ is Undefined!268) lt!69134))))

(declare-fun call!14529 () Bool)

(declare-fun c!24512 () Bool)

(declare-fun bm!14526 () Bool)

(assert (=> bm!14526 (= call!14529 (inRange!0 (ite c!24512 (index!3231 lt!69134) (index!3234 lt!69134)) (mask!7147 newMap!16)))))

(declare-fun d!40397 () Bool)

(declare-fun e!86307 () Bool)

(assert (=> d!40397 e!86307))

(assert (=> d!40397 (= c!24512 ((_ is MissingZero!268) lt!69134))))

(assert (=> d!40397 (= lt!69134 (seekEntryOrOpen!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4600 newMap!16) (mask!7147 newMap!16)))))

(declare-fun lt!69135 () Unit!4122)

(declare-fun choose!822 (array!4749 array!4751 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 64) Int) Unit!4122)

(assert (=> d!40397 (= lt!69135 (choose!822 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (defaultEntry!2853 newMap!16)))))

(assert (=> d!40397 (validMask!0 (mask!7147 newMap!16))))

(assert (=> d!40397 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!60 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (defaultEntry!2853 newMap!16)) lt!69135)))

(declare-fun b!132407 () Bool)

(declare-fun e!86308 () Bool)

(declare-fun call!14530 () Bool)

(assert (=> b!132407 (= e!86308 (not call!14530))))

(declare-fun b!132408 () Bool)

(declare-fun e!86306 () Bool)

(assert (=> b!132408 (= e!86306 (not call!14530))))

(declare-fun b!132409 () Bool)

(assert (=> b!132409 (and (bvsge (index!3231 lt!69134) #b00000000000000000000000000000000) (bvslt (index!3231 lt!69134) (size!2514 (_keys!4600 newMap!16))))))

(declare-fun res!63744 () Bool)

(assert (=> b!132409 (= res!63744 (= (select (arr!2246 (_keys!4600 newMap!16)) (index!3231 lt!69134)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132409 (=> (not res!63744) (not e!86308))))

(declare-fun b!132410 () Bool)

(assert (=> b!132410 (= e!86307 e!86308)))

(declare-fun res!63747 () Bool)

(assert (=> b!132410 (= res!63747 call!14529)))

(assert (=> b!132410 (=> (not res!63747) (not e!86308))))

(declare-fun bm!14527 () Bool)

(assert (=> bm!14527 (= call!14530 (arrayContainsKey!0 (_keys!4600 newMap!16) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!132411 () Bool)

(assert (=> b!132411 (= e!86307 e!86305)))

(declare-fun c!24511 () Bool)

(assert (=> b!132411 (= c!24511 ((_ is MissingVacant!268) lt!69134))))

(declare-fun b!132412 () Bool)

(declare-fun res!63746 () Bool)

(assert (=> b!132412 (=> (not res!63746) (not e!86306))))

(assert (=> b!132412 (= res!63746 (= (select (arr!2246 (_keys!4600 newMap!16)) (index!3234 lt!69134)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132412 (and (bvsge (index!3234 lt!69134) #b00000000000000000000000000000000) (bvslt (index!3234 lt!69134) (size!2514 (_keys!4600 newMap!16))))))

(declare-fun b!132413 () Bool)

(declare-fun res!63745 () Bool)

(assert (=> b!132413 (=> (not res!63745) (not e!86306))))

(assert (=> b!132413 (= res!63745 call!14529)))

(assert (=> b!132413 (= e!86305 e!86306)))

(assert (= (and d!40397 c!24512) b!132410))

(assert (= (and d!40397 (not c!24512)) b!132411))

(assert (= (and b!132410 res!63747) b!132409))

(assert (= (and b!132409 res!63744) b!132407))

(assert (= (and b!132411 c!24511) b!132413))

(assert (= (and b!132411 (not c!24511)) b!132406))

(assert (= (and b!132413 res!63745) b!132412))

(assert (= (and b!132412 res!63746) b!132408))

(assert (= (or b!132410 b!132413) bm!14526))

(assert (= (or b!132407 b!132408) bm!14527))

(declare-fun m!156309 () Bool)

(assert (=> b!132412 m!156309))

(declare-fun m!156311 () Bool)

(assert (=> b!132409 m!156311))

(declare-fun m!156313 () Bool)

(assert (=> bm!14526 m!156313))

(assert (=> d!40397 m!155543))

(assert (=> d!40397 m!155783))

(assert (=> d!40397 m!155543))

(declare-fun m!156315 () Bool)

(assert (=> d!40397 m!156315))

(assert (=> d!40397 m!155815))

(assert (=> bm!14527 m!155543))

(assert (=> bm!14527 m!155747))

(assert (=> bm!14471 d!40397))

(assert (=> b!131892 d!40321))

(declare-fun d!40399 () Bool)

(declare-fun lt!69138 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!132 (List!1692) (InoxSet (_ BitVec 64)))

(assert (=> d!40399 (= lt!69138 (select (content!132 Nil!1689) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!86313 () Bool)

(assert (=> d!40399 (= lt!69138 e!86313)))

(declare-fun res!63752 () Bool)

(assert (=> d!40399 (=> (not res!63752) (not e!86313))))

(assert (=> d!40399 (= res!63752 ((_ is Cons!1688) Nil!1689))))

(assert (=> d!40399 (= (contains!882 Nil!1689 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)) lt!69138)))

(declare-fun b!132418 () Bool)

(declare-fun e!86314 () Bool)

(assert (=> b!132418 (= e!86313 e!86314)))

(declare-fun res!63753 () Bool)

(assert (=> b!132418 (=> res!63753 e!86314)))

(assert (=> b!132418 (= res!63753 (= (h!2293 Nil!1689) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!132419 () Bool)

(assert (=> b!132419 (= e!86314 (contains!882 (t!6119 Nil!1689) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!40399 res!63752) b!132418))

(assert (= (and b!132418 (not res!63753)) b!132419))

(declare-fun m!156317 () Bool)

(assert (=> d!40399 m!156317))

(assert (=> d!40399 m!155649))

(declare-fun m!156319 () Bool)

(assert (=> d!40399 m!156319))

(assert (=> b!132419 m!155649))

(declare-fun m!156321 () Bool)

(assert (=> b!132419 m!156321))

(assert (=> b!131870 d!40399))

(declare-fun d!40401 () Bool)

(assert (=> d!40401 (= (apply!115 lt!68742 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1486 (getValueByKey!172 (toList!841 lt!68742) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5499 () Bool)

(assert (= bs!5499 d!40401))

(assert (=> bs!5499 m!155835))

(assert (=> bs!5499 m!155835))

(declare-fun m!156323 () Bool)

(assert (=> bs!5499 m!156323))

(assert (=> b!131949 d!40401))

(declare-fun d!40403 () Bool)

(declare-fun res!63758 () Bool)

(declare-fun e!86319 () Bool)

(assert (=> d!40403 (=> res!63758 e!86319)))

(assert (=> d!40403 (= res!63758 (and ((_ is Cons!1687) (toList!841 lt!68663)) (= (_1!1291 (h!2292 (toList!841 lt!68663))) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355))))))

(assert (=> d!40403 (= (containsKey!175 (toList!841 lt!68663) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)) e!86319)))

(declare-fun b!132424 () Bool)

(declare-fun e!86320 () Bool)

(assert (=> b!132424 (= e!86319 e!86320)))

(declare-fun res!63759 () Bool)

(assert (=> b!132424 (=> (not res!63759) (not e!86320))))

(assert (=> b!132424 (= res!63759 (and (or (not ((_ is Cons!1687) (toList!841 lt!68663))) (bvsle (_1!1291 (h!2292 (toList!841 lt!68663))) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355))) ((_ is Cons!1687) (toList!841 lt!68663)) (bvslt (_1!1291 (h!2292 (toList!841 lt!68663))) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355))))))

(declare-fun b!132425 () Bool)

(assert (=> b!132425 (= e!86320 (containsKey!175 (t!6118 (toList!841 lt!68663)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (= (and d!40403 (not res!63758)) b!132424))

(assert (= (and b!132424 res!63759) b!132425))

(assert (=> b!132425 m!155543))

(declare-fun m!156325 () Bool)

(assert (=> b!132425 m!156325))

(assert (=> d!40283 d!40403))

(declare-fun d!40405 () Bool)

(declare-fun e!86323 () Bool)

(assert (=> d!40405 e!86323))

(declare-fun res!63765 () Bool)

(assert (=> d!40405 (=> (not res!63765) (not e!86323))))

(declare-fun lt!69143 () SeekEntryResult!268)

(assert (=> d!40405 (= res!63765 ((_ is Found!268) lt!69143))))

(assert (=> d!40405 (= lt!69143 (seekEntryOrOpen!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (_keys!4600 newMap!16) (mask!7147 newMap!16)))))

(declare-fun lt!69144 () Unit!4122)

(declare-fun choose!823 (array!4749 array!4751 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 64) Int) Unit!4122)

(assert (=> d!40405 (= lt!69144 (choose!823 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (defaultEntry!2853 newMap!16)))))

(assert (=> d!40405 (validMask!0 (mask!7147 newMap!16))))

(assert (=> d!40405 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!60 (_keys!4600 newMap!16) (_values!2836 newMap!16) (mask!7147 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (defaultEntry!2853 newMap!16)) lt!69144)))

(declare-fun b!132430 () Bool)

(declare-fun res!63764 () Bool)

(assert (=> b!132430 (=> (not res!63764) (not e!86323))))

(assert (=> b!132430 (= res!63764 (inRange!0 (index!3232 lt!69143) (mask!7147 newMap!16)))))

(declare-fun b!132431 () Bool)

(assert (=> b!132431 (= e!86323 (= (select (arr!2246 (_keys!4600 newMap!16)) (index!3232 lt!69143)) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> b!132431 (and (bvsge (index!3232 lt!69143) #b00000000000000000000000000000000) (bvslt (index!3232 lt!69143) (size!2514 (_keys!4600 newMap!16))))))

(assert (= (and d!40405 res!63765) b!132430))

(assert (= (and b!132430 res!63764) b!132431))

(assert (=> d!40405 m!155543))

(assert (=> d!40405 m!155783))

(assert (=> d!40405 m!155543))

(declare-fun m!156327 () Bool)

(assert (=> d!40405 m!156327))

(assert (=> d!40405 m!155815))

(declare-fun m!156329 () Bool)

(assert (=> b!132430 m!156329))

(declare-fun m!156331 () Bool)

(assert (=> b!132431 m!156331))

(assert (=> bm!14477 d!40405))

(declare-fun bm!14528 () Bool)

(declare-fun call!14531 () Bool)

(assert (=> bm!14528 (= call!14531 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4600 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992)))))))

(declare-fun b!132432 () Bool)

(declare-fun e!86326 () Bool)

(declare-fun e!86325 () Bool)

(assert (=> b!132432 (= e!86326 e!86325)))

(declare-fun lt!69145 () (_ BitVec 64))

(assert (=> b!132432 (= lt!69145 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!69147 () Unit!4122)

(assert (=> b!132432 (= lt!69147 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4600 (v!3187 (underlying!452 thiss!992))) lt!69145 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!132432 (arrayContainsKey!0 (_keys!4600 (v!3187 (underlying!452 thiss!992))) lt!69145 #b00000000000000000000000000000000)))

(declare-fun lt!69146 () Unit!4122)

(assert (=> b!132432 (= lt!69146 lt!69147)))

(declare-fun res!63767 () Bool)

(assert (=> b!132432 (= res!63767 (= (seekEntryOrOpen!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4600 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992)))) (Found!268 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!132432 (=> (not res!63767) (not e!86325))))

(declare-fun d!40407 () Bool)

(declare-fun res!63766 () Bool)

(declare-fun e!86324 () Bool)

(assert (=> d!40407 (=> res!63766 e!86324)))

(assert (=> d!40407 (= res!63766 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2514 (_keys!4600 (v!3187 (underlying!452 thiss!992))))))))

(assert (=> d!40407 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4600 (v!3187 (underlying!452 thiss!992))) (mask!7147 (v!3187 (underlying!452 thiss!992)))) e!86324)))

(declare-fun b!132433 () Bool)

(assert (=> b!132433 (= e!86324 e!86326)))

(declare-fun c!24513 () Bool)

(assert (=> b!132433 (= c!24513 (validKeyInArray!0 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!132434 () Bool)

(assert (=> b!132434 (= e!86325 call!14531)))

(declare-fun b!132435 () Bool)

(assert (=> b!132435 (= e!86326 call!14531)))

(assert (= (and d!40407 (not res!63766)) b!132433))

(assert (= (and b!132433 c!24513) b!132432))

(assert (= (and b!132433 (not c!24513)) b!132435))

(assert (= (and b!132432 res!63767) b!132434))

(assert (= (or b!132434 b!132435) bm!14528))

(declare-fun m!156333 () Bool)

(assert (=> bm!14528 m!156333))

(assert (=> b!132432 m!155995))

(declare-fun m!156335 () Bool)

(assert (=> b!132432 m!156335))

(declare-fun m!156337 () Bool)

(assert (=> b!132432 m!156337))

(assert (=> b!132432 m!155995))

(declare-fun m!156339 () Bool)

(assert (=> b!132432 m!156339))

(assert (=> b!132433 m!155995))

(assert (=> b!132433 m!155995))

(assert (=> b!132433 m!156001))

(assert (=> bm!14387 d!40407))

(declare-fun d!40409 () Bool)

(declare-fun e!86327 () Bool)

(assert (=> d!40409 e!86327))

(declare-fun res!63768 () Bool)

(assert (=> d!40409 (=> (not res!63768) (not e!86327))))

(declare-fun lt!69151 () ListLongMap!1651)

(assert (=> d!40409 (= res!63768 (contains!881 lt!69151 (_1!1291 (ite c!24420 (ite c!24423 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!69149 () List!1691)

(assert (=> d!40409 (= lt!69151 (ListLongMap!1652 lt!69149))))

(declare-fun lt!69150 () Unit!4122)

(declare-fun lt!69148 () Unit!4122)

(assert (=> d!40409 (= lt!69150 lt!69148)))

(assert (=> d!40409 (= (getValueByKey!172 lt!69149 (_1!1291 (ite c!24420 (ite c!24423 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!177 (_2!1291 (ite c!24420 (ite c!24423 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!40409 (= lt!69148 (lemmaContainsTupThenGetReturnValue!87 lt!69149 (_1!1291 (ite c!24420 (ite c!24423 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1291 (ite c!24420 (ite c!24423 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!40409 (= lt!69149 (insertStrictlySorted!90 (toList!841 e!86119) (_1!1291 (ite c!24420 (ite c!24423 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1291 (ite c!24420 (ite c!24423 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!40409 (= (+!168 e!86119 (ite c!24420 (ite c!24423 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!69151)))

(declare-fun b!132436 () Bool)

(declare-fun res!63769 () Bool)

(assert (=> b!132436 (=> (not res!63769) (not e!86327))))

(assert (=> b!132436 (= res!63769 (= (getValueByKey!172 (toList!841 lt!69151) (_1!1291 (ite c!24420 (ite c!24423 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!177 (_2!1291 (ite c!24420 (ite c!24423 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!132437 () Bool)

(assert (=> b!132437 (= e!86327 (contains!883 (toList!841 lt!69151) (ite c!24420 (ite c!24423 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!40409 res!63768) b!132436))

(assert (= (and b!132436 res!63769) b!132437))

(declare-fun m!156341 () Bool)

(assert (=> d!40409 m!156341))

(declare-fun m!156343 () Bool)

(assert (=> d!40409 m!156343))

(declare-fun m!156345 () Bool)

(assert (=> d!40409 m!156345))

(declare-fun m!156347 () Bool)

(assert (=> d!40409 m!156347))

(declare-fun m!156349 () Bool)

(assert (=> b!132436 m!156349))

(declare-fun m!156351 () Bool)

(assert (=> b!132437 m!156351))

(assert (=> bm!14461 d!40409))

(declare-fun d!40411 () Bool)

(declare-fun e!86328 () Bool)

(assert (=> d!40411 e!86328))

(declare-fun res!63770 () Bool)

(assert (=> d!40411 (=> (not res!63770) (not e!86328))))

(declare-fun lt!69155 () ListLongMap!1651)

(assert (=> d!40411 (= res!63770 (contains!881 lt!69155 (_1!1291 (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!69153 () List!1691)

(assert (=> d!40411 (= lt!69155 (ListLongMap!1652 lt!69153))))

(declare-fun lt!69154 () Unit!4122)

(declare-fun lt!69152 () Unit!4122)

(assert (=> d!40411 (= lt!69154 lt!69152)))

(assert (=> d!40411 (= (getValueByKey!172 lt!69153 (_1!1291 (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!177 (_2!1291 (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40411 (= lt!69152 (lemmaContainsTupThenGetReturnValue!87 lt!69153 (_1!1291 (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40411 (= lt!69153 (insertStrictlySorted!90 (toList!841 call!14469) (_1!1291 (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40411 (= (+!168 call!14469 (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!69155)))

(declare-fun b!132438 () Bool)

(declare-fun res!63771 () Bool)

(assert (=> b!132438 (=> (not res!63771) (not e!86328))))

(assert (=> b!132438 (= res!63771 (= (getValueByKey!172 (toList!841 lt!69155) (_1!1291 (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!177 (_2!1291 (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!132439 () Bool)

(assert (=> b!132439 (= e!86328 (contains!883 (toList!841 lt!69155) (tuple2!2561 (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (get!1483 (select (arr!2247 (_values!2836 (v!3187 (underlying!452 thiss!992)))) from!355) (dynLambda!425 (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!40411 res!63770) b!132438))

(assert (= (and b!132438 res!63771) b!132439))

(declare-fun m!156353 () Bool)

(assert (=> d!40411 m!156353))

(declare-fun m!156355 () Bool)

(assert (=> d!40411 m!156355))

(declare-fun m!156357 () Bool)

(assert (=> d!40411 m!156357))

(declare-fun m!156359 () Bool)

(assert (=> d!40411 m!156359))

(declare-fun m!156361 () Bool)

(assert (=> b!132438 m!156361))

(declare-fun m!156363 () Bool)

(assert (=> b!132439 m!156363))

(assert (=> b!132079 d!40411))

(declare-fun d!40413 () Bool)

(assert (=> d!40413 (= (map!1395 (_2!1292 lt!68837)) (getCurrentListMap!517 (_keys!4600 (_2!1292 lt!68837)) (_values!2836 (_2!1292 lt!68837)) (mask!7147 (_2!1292 lt!68837)) (extraKeys!2620 (_2!1292 lt!68837)) (zeroValue!2709 (_2!1292 lt!68837)) (minValue!2709 (_2!1292 lt!68837)) #b00000000000000000000000000000000 (defaultEntry!2853 (_2!1292 lt!68837))))))

(declare-fun bs!5500 () Bool)

(assert (= bs!5500 d!40413))

(declare-fun m!156365 () Bool)

(assert (=> bs!5500 m!156365))

(assert (=> bm!14467 d!40413))

(declare-fun bm!14529 () Bool)

(declare-fun call!14532 () Bool)

(assert (=> bm!14529 (= call!14532 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4600 newMap!16) (mask!7147 newMap!16)))))

(declare-fun b!132440 () Bool)

(declare-fun e!86331 () Bool)

(declare-fun e!86330 () Bool)

(assert (=> b!132440 (= e!86331 e!86330)))

(declare-fun lt!69156 () (_ BitVec 64))

(assert (=> b!132440 (= lt!69156 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!69158 () Unit!4122)

(assert (=> b!132440 (= lt!69158 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4600 newMap!16) lt!69156 #b00000000000000000000000000000000))))

(assert (=> b!132440 (arrayContainsKey!0 (_keys!4600 newMap!16) lt!69156 #b00000000000000000000000000000000)))

(declare-fun lt!69157 () Unit!4122)

(assert (=> b!132440 (= lt!69157 lt!69158)))

(declare-fun res!63773 () Bool)

(assert (=> b!132440 (= res!63773 (= (seekEntryOrOpen!0 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000) (_keys!4600 newMap!16) (mask!7147 newMap!16)) (Found!268 #b00000000000000000000000000000000)))))

(assert (=> b!132440 (=> (not res!63773) (not e!86330))))

(declare-fun d!40415 () Bool)

(declare-fun res!63772 () Bool)

(declare-fun e!86329 () Bool)

(assert (=> d!40415 (=> res!63772 e!86329)))

(assert (=> d!40415 (= res!63772 (bvsge #b00000000000000000000000000000000 (size!2514 (_keys!4600 newMap!16))))))

(assert (=> d!40415 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4600 newMap!16) (mask!7147 newMap!16)) e!86329)))

(declare-fun b!132441 () Bool)

(assert (=> b!132441 (= e!86329 e!86331)))

(declare-fun c!24514 () Bool)

(assert (=> b!132441 (= c!24514 (validKeyInArray!0 (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!132442 () Bool)

(assert (=> b!132442 (= e!86330 call!14532)))

(declare-fun b!132443 () Bool)

(assert (=> b!132443 (= e!86331 call!14532)))

(assert (= (and d!40415 (not res!63772)) b!132441))

(assert (= (and b!132441 c!24514) b!132440))

(assert (= (and b!132441 (not c!24514)) b!132443))

(assert (= (and b!132440 res!63773) b!132442))

(assert (= (or b!132442 b!132443) bm!14529))

(declare-fun m!156367 () Bool)

(assert (=> bm!14529 m!156367))

(assert (=> b!132440 m!155855))

(declare-fun m!156369 () Bool)

(assert (=> b!132440 m!156369))

(declare-fun m!156371 () Bool)

(assert (=> b!132440 m!156371))

(assert (=> b!132440 m!155855))

(declare-fun m!156373 () Bool)

(assert (=> b!132440 m!156373))

(assert (=> b!132441 m!155855))

(assert (=> b!132441 m!155855))

(assert (=> b!132441 m!155889))

(assert (=> b!131881 d!40415))

(assert (=> b!132052 d!40307))

(declare-fun d!40417 () Bool)

(declare-fun res!63774 () Bool)

(declare-fun e!86332 () Bool)

(assert (=> d!40417 (=> res!63774 e!86332)))

(assert (=> d!40417 (= res!63774 (= (select (arr!2246 (_keys!4600 newMap!16)) #b00000000000000000000000000000000) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355)))))

(assert (=> d!40417 (= (arrayContainsKey!0 (_keys!4600 newMap!16) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) #b00000000000000000000000000000000) e!86332)))

(declare-fun b!132444 () Bool)

(declare-fun e!86333 () Bool)

(assert (=> b!132444 (= e!86332 e!86333)))

(declare-fun res!63775 () Bool)

(assert (=> b!132444 (=> (not res!63775) (not e!86333))))

(assert (=> b!132444 (= res!63775 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2514 (_keys!4600 newMap!16))))))

(declare-fun b!132445 () Bool)

(assert (=> b!132445 (= e!86333 (arrayContainsKey!0 (_keys!4600 newMap!16) (select (arr!2246 (_keys!4600 (v!3187 (underlying!452 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!40417 (not res!63774)) b!132444))

(assert (= (and b!132444 res!63775) b!132445))

(assert (=> d!40417 m!155855))

(assert (=> b!132445 m!155543))

(declare-fun m!156375 () Bool)

(assert (=> b!132445 m!156375))

(assert (=> bm!14468 d!40417))

(declare-fun b!132447 () Bool)

(declare-fun e!86334 () Bool)

(assert (=> b!132447 (= e!86334 tp_is_empty!2869)))

(declare-fun mapNonEmpty!4631 () Bool)

(declare-fun mapRes!4631 () Bool)

(declare-fun tp!11183 () Bool)

(declare-fun e!86335 () Bool)

(assert (=> mapNonEmpty!4631 (= mapRes!4631 (and tp!11183 e!86335))))

(declare-fun mapRest!4631 () (Array (_ BitVec 32) ValueCell!1091))

(declare-fun mapKey!4631 () (_ BitVec 32))

(declare-fun mapValue!4631 () ValueCell!1091)

(assert (=> mapNonEmpty!4631 (= mapRest!4629 (store mapRest!4631 mapKey!4631 mapValue!4631))))

(declare-fun b!132446 () Bool)

(assert (=> b!132446 (= e!86335 tp_is_empty!2869)))

(declare-fun mapIsEmpty!4631 () Bool)

(assert (=> mapIsEmpty!4631 mapRes!4631))

(declare-fun condMapEmpty!4631 () Bool)

(declare-fun mapDefault!4631 () ValueCell!1091)

(assert (=> mapNonEmpty!4629 (= condMapEmpty!4631 (= mapRest!4629 ((as const (Array (_ BitVec 32) ValueCell!1091)) mapDefault!4631)))))

(assert (=> mapNonEmpty!4629 (= tp!11181 (and e!86334 mapRes!4631))))

(assert (= (and mapNonEmpty!4629 condMapEmpty!4631) mapIsEmpty!4631))

(assert (= (and mapNonEmpty!4629 (not condMapEmpty!4631)) mapNonEmpty!4631))

(assert (= (and mapNonEmpty!4631 ((_ is ValueCellFull!1091) mapValue!4631)) b!132446))

(assert (= (and mapNonEmpty!4629 ((_ is ValueCellFull!1091) mapDefault!4631)) b!132447))

(declare-fun m!156377 () Bool)

(assert (=> mapNonEmpty!4631 m!156377))

(declare-fun b!132449 () Bool)

(declare-fun e!86336 () Bool)

(assert (=> b!132449 (= e!86336 tp_is_empty!2869)))

(declare-fun mapNonEmpty!4632 () Bool)

(declare-fun mapRes!4632 () Bool)

(declare-fun tp!11184 () Bool)

(declare-fun e!86337 () Bool)

(assert (=> mapNonEmpty!4632 (= mapRes!4632 (and tp!11184 e!86337))))

(declare-fun mapValue!4632 () ValueCell!1091)

(declare-fun mapRest!4632 () (Array (_ BitVec 32) ValueCell!1091))

(declare-fun mapKey!4632 () (_ BitVec 32))

(assert (=> mapNonEmpty!4632 (= mapRest!4630 (store mapRest!4632 mapKey!4632 mapValue!4632))))

(declare-fun b!132448 () Bool)

(assert (=> b!132448 (= e!86337 tp_is_empty!2869)))

(declare-fun mapIsEmpty!4632 () Bool)

(assert (=> mapIsEmpty!4632 mapRes!4632))

(declare-fun condMapEmpty!4632 () Bool)

(declare-fun mapDefault!4632 () ValueCell!1091)

(assert (=> mapNonEmpty!4630 (= condMapEmpty!4632 (= mapRest!4630 ((as const (Array (_ BitVec 32) ValueCell!1091)) mapDefault!4632)))))

(assert (=> mapNonEmpty!4630 (= tp!11182 (and e!86336 mapRes!4632))))

(assert (= (and mapNonEmpty!4630 condMapEmpty!4632) mapIsEmpty!4632))

(assert (= (and mapNonEmpty!4630 (not condMapEmpty!4632)) mapNonEmpty!4632))

(assert (= (and mapNonEmpty!4632 ((_ is ValueCellFull!1091) mapValue!4632)) b!132448))

(assert (= (and mapNonEmpty!4630 ((_ is ValueCellFull!1091) mapDefault!4632)) b!132449))

(declare-fun m!156379 () Bool)

(assert (=> mapNonEmpty!4632 m!156379))

(declare-fun b_lambda!5903 () Bool)

(assert (= b_lambda!5895 (or (and b!131733 b_free!2905 (= (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) (defaultEntry!2853 newMap!16))) (and b!131735 b_free!2907) b_lambda!5903)))

(declare-fun b_lambda!5905 () Bool)

(assert (= b_lambda!5899 (or (and b!131733 b_free!2905) (and b!131735 b_free!2907 (= (defaultEntry!2853 newMap!16) (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))))) b_lambda!5905)))

(declare-fun b_lambda!5907 () Bool)

(assert (= b_lambda!5893 (or (and b!131733 b_free!2905 (= (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) (defaultEntry!2853 newMap!16))) (and b!131735 b_free!2907) b_lambda!5907)))

(declare-fun b_lambda!5909 () Bool)

(assert (= b_lambda!5901 (or (and b!131733 b_free!2905 (= (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))) (defaultEntry!2853 newMap!16))) (and b!131735 b_free!2907) b_lambda!5909)))

(declare-fun b_lambda!5911 () Bool)

(assert (= b_lambda!5897 (or (and b!131733 b_free!2905) (and b!131735 b_free!2907 (= (defaultEntry!2853 newMap!16) (defaultEntry!2853 (v!3187 (underlying!452 thiss!992))))) b_lambda!5911)))

(check-sat (not b!132113) (not d!40361) (not b_lambda!5887) (not d!40383) (not b!132305) (not bm!14504) (not b!132202) (not b!132224) (not b!132264) (not b!132235) (not b!132309) (not b!132285) (not b!132355) (not b!132372) (not d!40377) (not d!40351) (not d!40299) (not b!132436) (not b!132430) (not d!40387) (not d!40325) (not b!132153) (not b!132241) (not d!40303) (not b!132387) (not b!132200) (not b!132273) (not b!132214) (not b!132389) (not b!132376) (not b!132268) (not d!40337) (not b!132266) (not b!132375) (not b!132338) (not d!40345) (not b!132437) (not b!132344) (not b!132147) (not b!132217) (not b_lambda!5909) (not bm!14500) (not b!132343) (not b!132265) (not d!40381) (not b!132299) (not d!40395) (not b!132164) (not b!132346) (not d!40391) (not b!132141) (not d!40323) (not b!132366) (not d!40341) (not b!132135) (not b!132368) (not b!132354) (not bm!14499) (not d!40353) (not d!40319) (not bm!14511) (not b!132260) (not d!40363) (not b!132216) (not b!132361) (not b!132433) (not b!132288) (not b!132162) (not d!40373) (not b!132345) (not bm!14485) (not bm!14517) (not b!132262) (not bm!14529) (not d!40359) (not bm!14519) tp_is_empty!2869 (not b!132310) (not b!132230) (not d!40365) (not b!132274) (not b!132218) (not d!40297) (not b!132339) (not d!40385) (not b_lambda!5911) (not b!132385) (not b!132308) (not b!132287) (not b!132371) (not d!40389) (not bm!14509) (not b!132211) (not b!132425) (not b!132279) (not b!132131) (not b!132159) (not b_next!2905) (not bm!14521) (not d!40405) (not d!40301) (not bm!14503) (not b!132208) (not d!40397) (not d!40413) (not b!132138) (not b!132388) (not b!132445) (not bm!14514) (not d!40331) (not bm!14484) (not d!40309) (not b!132148) (not d!40409) (not b!132259) (not b!132360) (not b!132438) (not d!40293) (not b!132246) (not b!132154) (not b!132370) (not b!132221) (not d!40371) (not b!132209) (not d!40357) (not d!40399) (not bm!14496) (not b!132441) (not b!132298) (not d!40327) (not b!132231) (not b!132307) (not b!132419) (not b_lambda!5905) (not bm!14508) (not b!132136) (not d!40317) (not d!40367) (not b!132432) (not b!132373) (not d!40307) (not b!132312) (not b!132306) (not b!132439) b_and!8205 (not bm!14507) (not b!132225) (not d!40411) (not b!132133) (not b!132440) (not d!40349) (not b!132369) (not d!40401) (not b!132374) (not d!40313) (not mapNonEmpty!4632) (not mapNonEmpty!4631) (not d!40375) (not b_lambda!5891) (not b!132229) (not b!132377) (not bm!14487) (not b!132340) (not bm!14498) (not b!132163) (not bm!14483) (not bm!14527) (not b!132227) (not bm!14528) (not d!40379) (not b_lambda!5907) (not b!132347) (not b!132349) b_and!8207 (not b_next!2907) (not bm!14526) (not d!40393) (not b!132142) (not d!40369) (not bm!14518) (not b!132233) (not b!132161) (not b!132280) (not d!40333) (not d!40355) (not b_lambda!5903))
(check-sat b_and!8205 b_and!8207 (not b_next!2905) (not b_next!2907))
