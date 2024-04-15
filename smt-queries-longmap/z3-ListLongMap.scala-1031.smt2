; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21872 () Bool)

(assert start!21872)

(declare-fun b!220711 () Bool)

(declare-fun b_free!5935 () Bool)

(declare-fun b_next!5935 () Bool)

(assert (=> b!220711 (= b_free!5935 (not b_next!5935))))

(declare-fun tp!20947 () Bool)

(declare-fun b_and!12807 () Bool)

(assert (=> b!220711 (= tp!20947 b_and!12807)))

(declare-fun b!220705 () Bool)

(declare-fun res!108226 () Bool)

(declare-datatypes ((V!7377 0))(
  ( (V!7378 (val!2943 Int)) )
))
(declare-datatypes ((ValueCell!2555 0))(
  ( (ValueCellFull!2555 (v!4957 V!7377)) (EmptyCell!2555) )
))
(declare-datatypes ((array!10829 0))(
  ( (array!10830 (arr!5133 (Array (_ BitVec 32) ValueCell!2555)) (size!5467 (_ BitVec 32))) )
))
(declare-datatypes ((array!10831 0))(
  ( (array!10832 (arr!5134 (Array (_ BitVec 32) (_ BitVec 64))) (size!5468 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3010 0))(
  ( (LongMapFixedSize!3011 (defaultEntry!4164 Int) (mask!9969 (_ BitVec 32)) (extraKeys!3901 (_ BitVec 32)) (zeroValue!4005 V!7377) (minValue!4005 V!7377) (_size!1554 (_ BitVec 32)) (_keys!6217 array!10831) (_values!4147 array!10829) (_vacant!1554 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3010)

(declare-datatypes ((SeekEntryResult!812 0))(
  ( (MissingZero!812 (index!5418 (_ BitVec 32))) (Found!812 (index!5419 (_ BitVec 32))) (Intermediate!812 (undefined!1624 Bool) (index!5420 (_ BitVec 32)) (x!22975 (_ BitVec 32))) (Undefined!812) (MissingVacant!812 (index!5421 (_ BitVec 32))) )
))
(declare-fun lt!112094 () SeekEntryResult!812)

(assert (=> b!220705 (= res!108226 (= (select (arr!5134 (_keys!6217 thiss!1504)) (index!5421 lt!112094)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143477 () Bool)

(assert (=> b!220705 (=> (not res!108226) (not e!143477))))

(declare-fun b!220706 () Bool)

(declare-fun res!108227 () Bool)

(declare-fun e!143479 () Bool)

(assert (=> b!220706 (=> (not res!108227) (not e!143479))))

(assert (=> b!220706 (= res!108227 (= (select (arr!5134 (_keys!6217 thiss!1504)) (index!5418 lt!112094)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220707 () Bool)

(declare-datatypes ((Unit!6545 0))(
  ( (Unit!6546) )
))
(declare-fun e!143471 () Unit!6545)

(declare-fun lt!112095 () Unit!6545)

(assert (=> b!220707 (= e!143471 lt!112095)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!203 (array!10831 array!10829 (_ BitVec 32) (_ BitVec 32) V!7377 V!7377 (_ BitVec 64) Int) Unit!6545)

(assert (=> b!220707 (= lt!112095 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!203 (_keys!6217 thiss!1504) (_values!4147 thiss!1504) (mask!9969 thiss!1504) (extraKeys!3901 thiss!1504) (zeroValue!4005 thiss!1504) (minValue!4005 thiss!1504) key!932 (defaultEntry!4164 thiss!1504)))))

(declare-fun c!36714 () Bool)

(get-info :version)

(assert (=> b!220707 (= c!36714 ((_ is MissingZero!812) lt!112094))))

(declare-fun e!143470 () Bool)

(assert (=> b!220707 e!143470))

(declare-fun b!220708 () Bool)

(declare-fun res!108220 () Bool)

(declare-fun e!143476 () Bool)

(assert (=> b!220708 (=> (not res!108220) (not e!143476))))

(assert (=> b!220708 (= res!108220 (and (= (size!5467 (_values!4147 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9969 thiss!1504))) (= (size!5468 (_keys!6217 thiss!1504)) (size!5467 (_values!4147 thiss!1504))) (bvsge (mask!9969 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3901 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3901 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!220709 () Bool)

(declare-fun e!143481 () Bool)

(assert (=> b!220709 (= e!143481 e!143477)))

(declare-fun res!108230 () Bool)

(declare-fun call!20616 () Bool)

(assert (=> b!220709 (= res!108230 call!20616)))

(assert (=> b!220709 (=> (not res!108230) (not e!143477))))

(declare-fun b!220710 () Bool)

(declare-fun Unit!6547 () Unit!6545)

(assert (=> b!220710 (= e!143471 Unit!6547)))

(declare-fun lt!112092 () Unit!6545)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!203 (array!10831 array!10829 (_ BitVec 32) (_ BitVec 32) V!7377 V!7377 (_ BitVec 64) Int) Unit!6545)

(assert (=> b!220710 (= lt!112092 (lemmaInListMapThenSeekEntryOrOpenFindsIt!203 (_keys!6217 thiss!1504) (_values!4147 thiss!1504) (mask!9969 thiss!1504) (extraKeys!3901 thiss!1504) (zeroValue!4005 thiss!1504) (minValue!4005 thiss!1504) key!932 (defaultEntry!4164 thiss!1504)))))

(assert (=> b!220710 false))

(declare-fun e!143475 () Bool)

(declare-fun e!143472 () Bool)

(declare-fun tp_is_empty!5797 () Bool)

(declare-fun array_inv!3381 (array!10831) Bool)

(declare-fun array_inv!3382 (array!10829) Bool)

(assert (=> b!220711 (= e!143472 (and tp!20947 tp_is_empty!5797 (array_inv!3381 (_keys!6217 thiss!1504)) (array_inv!3382 (_values!4147 thiss!1504)) e!143475))))

(declare-fun b!220713 () Bool)

(assert (=> b!220713 (= e!143476 false)))

(declare-fun lt!112096 () Bool)

(declare-datatypes ((List!3253 0))(
  ( (Nil!3250) (Cons!3249 (h!3897 (_ BitVec 64)) (t!8203 List!3253)) )
))
(declare-fun arrayNoDuplicates!0 (array!10831 (_ BitVec 32) List!3253) Bool)

(assert (=> b!220713 (= lt!112096 (arrayNoDuplicates!0 (_keys!6217 thiss!1504) #b00000000000000000000000000000000 Nil!3250))))

(declare-fun mapIsEmpty!9865 () Bool)

(declare-fun mapRes!9865 () Bool)

(assert (=> mapIsEmpty!9865 mapRes!9865))

(declare-fun b!220714 () Bool)

(declare-fun e!143480 () Bool)

(assert (=> b!220714 (= e!143480 tp_is_empty!5797)))

(declare-fun bm!20612 () Bool)

(declare-fun call!20615 () Bool)

(declare-fun arrayContainsKey!0 (array!10831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20612 (= call!20615 (arrayContainsKey!0 (_keys!6217 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220715 () Bool)

(assert (=> b!220715 (= e!143479 (not call!20615))))

(declare-fun b!220716 () Bool)

(declare-fun res!108229 () Bool)

(assert (=> b!220716 (=> (not res!108229) (not e!143476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10831 (_ BitVec 32)) Bool)

(assert (=> b!220716 (= res!108229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6217 thiss!1504) (mask!9969 thiss!1504)))))

(declare-fun b!220717 () Bool)

(assert (=> b!220717 (= e!143481 ((_ is Undefined!812) lt!112094))))

(declare-fun mapNonEmpty!9865 () Bool)

(declare-fun tp!20946 () Bool)

(assert (=> mapNonEmpty!9865 (= mapRes!9865 (and tp!20946 e!143480))))

(declare-fun mapValue!9865 () ValueCell!2555)

(declare-fun mapKey!9865 () (_ BitVec 32))

(declare-fun mapRest!9865 () (Array (_ BitVec 32) ValueCell!2555))

(assert (=> mapNonEmpty!9865 (= (arr!5133 (_values!4147 thiss!1504)) (store mapRest!9865 mapKey!9865 mapValue!9865))))

(declare-fun b!220718 () Bool)

(declare-fun res!108225 () Bool)

(assert (=> b!220718 (=> (not res!108225) (not e!143476))))

(assert (=> b!220718 (= res!108225 (arrayContainsKey!0 (_keys!6217 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220719 () Bool)

(declare-fun e!143469 () Bool)

(assert (=> b!220719 (= e!143469 tp_is_empty!5797)))

(declare-fun b!220720 () Bool)

(declare-fun e!143478 () Bool)

(declare-fun e!143473 () Bool)

(assert (=> b!220720 (= e!143478 e!143473)))

(declare-fun res!108219 () Bool)

(assert (=> b!220720 (=> (not res!108219) (not e!143473))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220720 (= res!108219 (or (= lt!112094 (MissingZero!812 index!297)) (= lt!112094 (MissingVacant!812 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10831 (_ BitVec 32)) SeekEntryResult!812)

(assert (=> b!220720 (= lt!112094 (seekEntryOrOpen!0 key!932 (_keys!6217 thiss!1504) (mask!9969 thiss!1504)))))

(declare-fun b!220721 () Bool)

(declare-fun res!108224 () Bool)

(assert (=> b!220721 (=> (not res!108224) (not e!143479))))

(assert (=> b!220721 (= res!108224 call!20616)))

(assert (=> b!220721 (= e!143470 e!143479)))

(declare-fun b!220722 () Bool)

(assert (=> b!220722 (= e!143475 (and e!143469 mapRes!9865))))

(declare-fun condMapEmpty!9865 () Bool)

(declare-fun mapDefault!9865 () ValueCell!2555)

(assert (=> b!220722 (= condMapEmpty!9865 (= (arr!5133 (_values!4147 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2555)) mapDefault!9865)))))

(declare-fun b!220723 () Bool)

(declare-fun res!108222 () Bool)

(assert (=> b!220723 (=> (not res!108222) (not e!143476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220723 (= res!108222 (validMask!0 (mask!9969 thiss!1504)))))

(declare-fun b!220724 () Bool)

(declare-fun res!108221 () Bool)

(assert (=> b!220724 (=> (not res!108221) (not e!143478))))

(assert (=> b!220724 (= res!108221 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!20613 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20613 (= call!20616 (inRange!0 (ite c!36714 (index!5418 lt!112094) (index!5421 lt!112094)) (mask!9969 thiss!1504)))))

(declare-fun res!108228 () Bool)

(assert (=> start!21872 (=> (not res!108228) (not e!143478))))

(declare-fun valid!1227 (LongMapFixedSize!3010) Bool)

(assert (=> start!21872 (= res!108228 (valid!1227 thiss!1504))))

(assert (=> start!21872 e!143478))

(assert (=> start!21872 e!143472))

(assert (=> start!21872 true))

(declare-fun b!220712 () Bool)

(declare-fun c!36713 () Bool)

(assert (=> b!220712 (= c!36713 ((_ is MissingVacant!812) lt!112094))))

(assert (=> b!220712 (= e!143470 e!143481)))

(declare-fun b!220725 () Bool)

(assert (=> b!220725 (= e!143477 (not call!20615))))

(declare-fun b!220726 () Bool)

(assert (=> b!220726 (= e!143473 e!143476)))

(declare-fun res!108223 () Bool)

(assert (=> b!220726 (=> (not res!108223) (not e!143476))))

(assert (=> b!220726 (= res!108223 (inRange!0 index!297 (mask!9969 thiss!1504)))))

(declare-fun lt!112093 () Unit!6545)

(assert (=> b!220726 (= lt!112093 e!143471)))

(declare-fun c!36715 () Bool)

(declare-datatypes ((tuple2!4332 0))(
  ( (tuple2!4333 (_1!2177 (_ BitVec 64)) (_2!2177 V!7377)) )
))
(declare-datatypes ((List!3254 0))(
  ( (Nil!3251) (Cons!3250 (h!3898 tuple2!4332) (t!8204 List!3254)) )
))
(declare-datatypes ((ListLongMap!3235 0))(
  ( (ListLongMap!3236 (toList!1633 List!3254)) )
))
(declare-fun contains!1476 (ListLongMap!3235 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1142 (array!10831 array!10829 (_ BitVec 32) (_ BitVec 32) V!7377 V!7377 (_ BitVec 32) Int) ListLongMap!3235)

(assert (=> b!220726 (= c!36715 (contains!1476 (getCurrentListMap!1142 (_keys!6217 thiss!1504) (_values!4147 thiss!1504) (mask!9969 thiss!1504) (extraKeys!3901 thiss!1504) (zeroValue!4005 thiss!1504) (minValue!4005 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4164 thiss!1504)) key!932))))

(assert (= (and start!21872 res!108228) b!220724))

(assert (= (and b!220724 res!108221) b!220720))

(assert (= (and b!220720 res!108219) b!220726))

(assert (= (and b!220726 c!36715) b!220710))

(assert (= (and b!220726 (not c!36715)) b!220707))

(assert (= (and b!220707 c!36714) b!220721))

(assert (= (and b!220707 (not c!36714)) b!220712))

(assert (= (and b!220721 res!108224) b!220706))

(assert (= (and b!220706 res!108227) b!220715))

(assert (= (and b!220712 c!36713) b!220709))

(assert (= (and b!220712 (not c!36713)) b!220717))

(assert (= (and b!220709 res!108230) b!220705))

(assert (= (and b!220705 res!108226) b!220725))

(assert (= (or b!220721 b!220709) bm!20613))

(assert (= (or b!220715 b!220725) bm!20612))

(assert (= (and b!220726 res!108223) b!220718))

(assert (= (and b!220718 res!108225) b!220723))

(assert (= (and b!220723 res!108222) b!220708))

(assert (= (and b!220708 res!108220) b!220716))

(assert (= (and b!220716 res!108229) b!220713))

(assert (= (and b!220722 condMapEmpty!9865) mapIsEmpty!9865))

(assert (= (and b!220722 (not condMapEmpty!9865)) mapNonEmpty!9865))

(assert (= (and mapNonEmpty!9865 ((_ is ValueCellFull!2555) mapValue!9865)) b!220714))

(assert (= (and b!220722 ((_ is ValueCellFull!2555) mapDefault!9865)) b!220719))

(assert (= b!220711 b!220722))

(assert (= start!21872 b!220711))

(declare-fun m!245161 () Bool)

(assert (=> b!220718 m!245161))

(declare-fun m!245163 () Bool)

(assert (=> b!220723 m!245163))

(declare-fun m!245165 () Bool)

(assert (=> b!220710 m!245165))

(declare-fun m!245167 () Bool)

(assert (=> b!220711 m!245167))

(declare-fun m!245169 () Bool)

(assert (=> b!220711 m!245169))

(declare-fun m!245171 () Bool)

(assert (=> b!220726 m!245171))

(declare-fun m!245173 () Bool)

(assert (=> b!220726 m!245173))

(assert (=> b!220726 m!245173))

(declare-fun m!245175 () Bool)

(assert (=> b!220726 m!245175))

(declare-fun m!245177 () Bool)

(assert (=> bm!20613 m!245177))

(declare-fun m!245179 () Bool)

(assert (=> start!21872 m!245179))

(declare-fun m!245181 () Bool)

(assert (=> b!220706 m!245181))

(declare-fun m!245183 () Bool)

(assert (=> b!220720 m!245183))

(declare-fun m!245185 () Bool)

(assert (=> mapNonEmpty!9865 m!245185))

(declare-fun m!245187 () Bool)

(assert (=> b!220716 m!245187))

(declare-fun m!245189 () Bool)

(assert (=> b!220713 m!245189))

(declare-fun m!245191 () Bool)

(assert (=> b!220705 m!245191))

(declare-fun m!245193 () Bool)

(assert (=> b!220707 m!245193))

(assert (=> bm!20612 m!245161))

(check-sat (not b!220720) (not mapNonEmpty!9865) (not b!220726) (not bm!20612) (not bm!20613) (not b!220707) (not b_next!5935) (not b!220711) (not b!220723) tp_is_empty!5797 (not b!220713) b_and!12807 (not start!21872) (not b!220718) (not b!220710) (not b!220716))
(check-sat b_and!12807 (not b_next!5935))
