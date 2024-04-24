; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22562 () Bool)

(assert start!22562)

(declare-fun b!235886 () Bool)

(declare-fun b_free!6343 () Bool)

(declare-fun b_next!6343 () Bool)

(assert (=> b!235886 (= b_free!6343 (not b_next!6343))))

(declare-fun tp!22202 () Bool)

(declare-fun b_and!13289 () Bool)

(assert (=> b!235886 (= tp!22202 b_and!13289)))

(declare-fun b!235882 () Bool)

(declare-fun e!153177 () Bool)

(declare-fun e!153172 () Bool)

(declare-fun mapRes!10508 () Bool)

(assert (=> b!235882 (= e!153177 (and e!153172 mapRes!10508))))

(declare-fun condMapEmpty!10508 () Bool)

(declare-datatypes ((V!7921 0))(
  ( (V!7922 (val!3147 Int)) )
))
(declare-datatypes ((ValueCell!2759 0))(
  ( (ValueCellFull!2759 (v!5177 V!7921)) (EmptyCell!2759) )
))
(declare-datatypes ((array!11669 0))(
  ( (array!11670 (arr!5545 (Array (_ BitVec 32) ValueCell!2759)) (size!5882 (_ BitVec 32))) )
))
(declare-datatypes ((array!11671 0))(
  ( (array!11672 (arr!5546 (Array (_ BitVec 32) (_ BitVec 64))) (size!5883 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3418 0))(
  ( (LongMapFixedSize!3419 (defaultEntry!4381 Int) (mask!10360 (_ BitVec 32)) (extraKeys!4118 (_ BitVec 32)) (zeroValue!4222 V!7921) (minValue!4222 V!7921) (_size!1758 (_ BitVec 32)) (_keys!6459 array!11671) (_values!4364 array!11669) (_vacant!1758 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3418)

(declare-fun mapDefault!10508 () ValueCell!2759)

(assert (=> b!235882 (= condMapEmpty!10508 (= (arr!5545 (_values!4364 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2759)) mapDefault!10508)))))

(declare-fun mapIsEmpty!10508 () Bool)

(assert (=> mapIsEmpty!10508 mapRes!10508))

(declare-fun b!235883 () Bool)

(declare-fun res!115689 () Bool)

(declare-fun e!153178 () Bool)

(assert (=> b!235883 (=> (not res!115689) (not e!153178))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4570 0))(
  ( (tuple2!4571 (_1!2296 (_ BitVec 64)) (_2!2296 V!7921)) )
))
(declare-datatypes ((List!3470 0))(
  ( (Nil!3467) (Cons!3466 (h!4118 tuple2!4570) (t!8439 List!3470)) )
))
(declare-datatypes ((ListLongMap!3485 0))(
  ( (ListLongMap!3486 (toList!1758 List!3470)) )
))
(declare-fun contains!1650 (ListLongMap!3485 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1290 (array!11671 array!11669 (_ BitVec 32) (_ BitVec 32) V!7921 V!7921 (_ BitVec 32) Int) ListLongMap!3485)

(assert (=> b!235883 (= res!115689 (contains!1650 (getCurrentListMap!1290 (_keys!6459 thiss!1504) (_values!4364 thiss!1504) (mask!10360 thiss!1504) (extraKeys!4118 thiss!1504) (zeroValue!4222 thiss!1504) (minValue!4222 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4381 thiss!1504)) key!932))))

(declare-fun b!235884 () Bool)

(declare-datatypes ((SeekEntryResult!967 0))(
  ( (MissingZero!967 (index!6038 (_ BitVec 32))) (Found!967 (index!6039 (_ BitVec 32))) (Intermediate!967 (undefined!1779 Bool) (index!6040 (_ BitVec 32)) (x!23797 (_ BitVec 32))) (Undefined!967) (MissingVacant!967 (index!6041 (_ BitVec 32))) )
))
(declare-fun lt!119319 () SeekEntryResult!967)

(declare-fun e!153175 () Bool)

(assert (=> b!235884 (= e!153175 (= (select (arr!5546 (_keys!6459 thiss!1504)) (index!6039 lt!119319)) key!932))))

(declare-fun b!235885 () Bool)

(declare-fun tp_is_empty!6205 () Bool)

(assert (=> b!235885 (= e!153172 tp_is_empty!6205)))

(declare-fun b!235887 () Bool)

(declare-fun res!115685 () Bool)

(assert (=> b!235887 (=> (not res!115685) (not e!153175))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235887 (= res!115685 (inRange!0 (index!6039 lt!119319) (mask!10360 thiss!1504)))))

(declare-fun b!235888 () Bool)

(declare-fun e!153174 () Bool)

(assert (=> b!235888 (= e!153174 e!153178)))

(declare-fun res!115687 () Bool)

(assert (=> b!235888 (=> (not res!115687) (not e!153178))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235888 (= res!115687 (or (= lt!119319 (MissingZero!967 index!297)) (= lt!119319 (MissingVacant!967 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11671 (_ BitVec 32)) SeekEntryResult!967)

(assert (=> b!235888 (= lt!119319 (seekEntryOrOpen!0 key!932 (_keys!6459 thiss!1504) (mask!10360 thiss!1504)))))

(declare-fun b!235889 () Bool)

(declare-fun e!153171 () Bool)

(assert (=> b!235889 (= e!153171 tp_is_empty!6205)))

(declare-fun mapNonEmpty!10508 () Bool)

(declare-fun tp!22201 () Bool)

(assert (=> mapNonEmpty!10508 (= mapRes!10508 (and tp!22201 e!153171))))

(declare-fun mapRest!10508 () (Array (_ BitVec 32) ValueCell!2759))

(declare-fun mapValue!10508 () ValueCell!2759)

(declare-fun mapKey!10508 () (_ BitVec 32))

(assert (=> mapNonEmpty!10508 (= (arr!5545 (_values!4364 thiss!1504)) (store mapRest!10508 mapKey!10508 mapValue!10508))))

(declare-fun b!235890 () Bool)

(declare-fun res!115684 () Bool)

(assert (=> b!235890 (=> (not res!115684) (not e!153174))))

(assert (=> b!235890 (= res!115684 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235891 () Bool)

(assert (=> b!235891 (= e!153178 (not false))))

(assert (=> b!235891 e!153175))

(declare-fun res!115688 () Bool)

(assert (=> b!235891 (=> (not res!115688) (not e!153175))))

(get-info :version)

(assert (=> b!235891 (= res!115688 ((_ is Found!967) lt!119319))))

(declare-datatypes ((Unit!7251 0))(
  ( (Unit!7252) )
))
(declare-fun lt!119318 () Unit!7251)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!321 (array!11671 array!11669 (_ BitVec 32) (_ BitVec 32) V!7921 V!7921 (_ BitVec 64) Int) Unit!7251)

(assert (=> b!235891 (= lt!119318 (lemmaInListMapThenSeekEntryOrOpenFindsIt!321 (_keys!6459 thiss!1504) (_values!4364 thiss!1504) (mask!10360 thiss!1504) (extraKeys!4118 thiss!1504) (zeroValue!4222 thiss!1504) (minValue!4222 thiss!1504) key!932 (defaultEntry!4381 thiss!1504)))))

(declare-fun res!115686 () Bool)

(assert (=> start!22562 (=> (not res!115686) (not e!153174))))

(declare-fun valid!1364 (LongMapFixedSize!3418) Bool)

(assert (=> start!22562 (= res!115686 (valid!1364 thiss!1504))))

(assert (=> start!22562 e!153174))

(declare-fun e!153173 () Bool)

(assert (=> start!22562 e!153173))

(assert (=> start!22562 true))

(declare-fun array_inv!3647 (array!11671) Bool)

(declare-fun array_inv!3648 (array!11669) Bool)

(assert (=> b!235886 (= e!153173 (and tp!22202 tp_is_empty!6205 (array_inv!3647 (_keys!6459 thiss!1504)) (array_inv!3648 (_values!4364 thiss!1504)) e!153177))))

(assert (= (and start!22562 res!115686) b!235890))

(assert (= (and b!235890 res!115684) b!235888))

(assert (= (and b!235888 res!115687) b!235883))

(assert (= (and b!235883 res!115689) b!235891))

(assert (= (and b!235891 res!115688) b!235887))

(assert (= (and b!235887 res!115685) b!235884))

(assert (= (and b!235882 condMapEmpty!10508) mapIsEmpty!10508))

(assert (= (and b!235882 (not condMapEmpty!10508)) mapNonEmpty!10508))

(assert (= (and mapNonEmpty!10508 ((_ is ValueCellFull!2759) mapValue!10508)) b!235889))

(assert (= (and b!235882 ((_ is ValueCellFull!2759) mapDefault!10508)) b!235885))

(assert (= b!235886 b!235882))

(assert (= start!22562 b!235886))

(declare-fun m!256999 () Bool)

(assert (=> start!22562 m!256999))

(declare-fun m!257001 () Bool)

(assert (=> b!235884 m!257001))

(declare-fun m!257003 () Bool)

(assert (=> mapNonEmpty!10508 m!257003))

(declare-fun m!257005 () Bool)

(assert (=> b!235887 m!257005))

(declare-fun m!257007 () Bool)

(assert (=> b!235891 m!257007))

(declare-fun m!257009 () Bool)

(assert (=> b!235886 m!257009))

(declare-fun m!257011 () Bool)

(assert (=> b!235886 m!257011))

(declare-fun m!257013 () Bool)

(assert (=> b!235883 m!257013))

(assert (=> b!235883 m!257013))

(declare-fun m!257015 () Bool)

(assert (=> b!235883 m!257015))

(declare-fun m!257017 () Bool)

(assert (=> b!235888 m!257017))

(check-sat (not b_next!6343) b_and!13289 (not b!235887) (not b!235886) (not b!235883) (not mapNonEmpty!10508) (not start!22562) tp_is_empty!6205 (not b!235891) (not b!235888))
(check-sat b_and!13289 (not b_next!6343))
