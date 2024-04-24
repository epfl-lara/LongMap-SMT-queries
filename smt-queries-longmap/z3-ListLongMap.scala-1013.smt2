; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21682 () Bool)

(assert start!21682)

(declare-fun b!217704 () Bool)

(declare-fun b_free!5827 () Bool)

(declare-fun b_next!5827 () Bool)

(assert (=> b!217704 (= b_free!5827 (not b_next!5827))))

(declare-fun tp!20615 () Bool)

(declare-fun b_and!12731 () Bool)

(assert (=> b!217704 (= tp!20615 b_and!12731)))

(declare-fun e!141616 () Bool)

(declare-fun tp_is_empty!5689 () Bool)

(declare-fun e!141617 () Bool)

(declare-datatypes ((V!7233 0))(
  ( (V!7234 (val!2889 Int)) )
))
(declare-datatypes ((ValueCell!2501 0))(
  ( (ValueCellFull!2501 (v!4908 V!7233)) (EmptyCell!2501) )
))
(declare-datatypes ((array!10615 0))(
  ( (array!10616 (arr!5029 (Array (_ BitVec 32) ValueCell!2501)) (size!5361 (_ BitVec 32))) )
))
(declare-datatypes ((array!10617 0))(
  ( (array!10618 (arr!5030 (Array (_ BitVec 32) (_ BitVec 64))) (size!5362 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2902 0))(
  ( (LongMapFixedSize!2903 (defaultEntry!4101 Int) (mask!9862 (_ BitVec 32)) (extraKeys!3838 (_ BitVec 32)) (zeroValue!3942 V!7233) (minValue!3942 V!7233) (_size!1500 (_ BitVec 32)) (_keys!6150 array!10617) (_values!4084 array!10615) (_vacant!1500 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2902)

(declare-fun array_inv!3307 (array!10617) Bool)

(declare-fun array_inv!3308 (array!10615) Bool)

(assert (=> b!217704 (= e!141617 (and tp!20615 tp_is_empty!5689 (array_inv!3307 (_keys!6150 thiss!1504)) (array_inv!3308 (_values!4084 thiss!1504)) e!141616))))

(declare-fun res!106633 () Bool)

(declare-fun e!141619 () Bool)

(assert (=> start!21682 (=> (not res!106633) (not e!141619))))

(declare-fun valid!1193 (LongMapFixedSize!2902) Bool)

(assert (=> start!21682 (= res!106633 (valid!1193 thiss!1504))))

(assert (=> start!21682 e!141619))

(assert (=> start!21682 e!141617))

(assert (=> start!21682 true))

(declare-fun b!217705 () Bool)

(declare-fun res!106635 () Bool)

(declare-fun e!141618 () Bool)

(assert (=> b!217705 (=> (not res!106635) (not e!141618))))

(assert (=> b!217705 (= res!106635 (and (= (size!5361 (_values!4084 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9862 thiss!1504))) (= (size!5362 (_keys!6150 thiss!1504)) (size!5361 (_values!4084 thiss!1504))) (bvsge (mask!9862 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3838 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3838 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217706 () Bool)

(declare-fun res!106630 () Bool)

(assert (=> b!217706 (=> (not res!106630) (not e!141618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217706 (= res!106630 (validMask!0 (mask!9862 thiss!1504)))))

(declare-fun mapIsEmpty!9696 () Bool)

(declare-fun mapRes!9696 () Bool)

(assert (=> mapIsEmpty!9696 mapRes!9696))

(declare-fun b!217707 () Bool)

(declare-fun res!106632 () Bool)

(assert (=> b!217707 (=> (not res!106632) (not e!141618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10617 (_ BitVec 32)) Bool)

(assert (=> b!217707 (= res!106632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6150 thiss!1504) (mask!9862 thiss!1504)))))

(declare-fun mapNonEmpty!9696 () Bool)

(declare-fun tp!20616 () Bool)

(declare-fun e!141621 () Bool)

(assert (=> mapNonEmpty!9696 (= mapRes!9696 (and tp!20616 e!141621))))

(declare-fun mapValue!9696 () ValueCell!2501)

(declare-fun mapRest!9696 () (Array (_ BitVec 32) ValueCell!2501))

(declare-fun mapKey!9696 () (_ BitVec 32))

(assert (=> mapNonEmpty!9696 (= (arr!5029 (_values!4084 thiss!1504)) (store mapRest!9696 mapKey!9696 mapValue!9696))))

(declare-fun b!217708 () Bool)

(assert (=> b!217708 (= e!141618 false)))

(declare-fun lt!111445 () Bool)

(declare-datatypes ((List!3120 0))(
  ( (Nil!3117) (Cons!3116 (h!3763 (_ BitVec 64)) (t!8067 List!3120)) )
))
(declare-fun arrayNoDuplicates!0 (array!10617 (_ BitVec 32) List!3120) Bool)

(assert (=> b!217708 (= lt!111445 (arrayNoDuplicates!0 (_keys!6150 thiss!1504) #b00000000000000000000000000000000 Nil!3117))))

(declare-fun b!217709 () Bool)

(declare-fun res!106629 () Bool)

(assert (=> b!217709 (=> (not res!106629) (not e!141618))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4218 0))(
  ( (tuple2!4219 (_1!2120 (_ BitVec 64)) (_2!2120 V!7233)) )
))
(declare-datatypes ((List!3121 0))(
  ( (Nil!3118) (Cons!3117 (h!3764 tuple2!4218) (t!8068 List!3121)) )
))
(declare-datatypes ((ListLongMap!3133 0))(
  ( (ListLongMap!3134 (toList!1582 List!3121)) )
))
(declare-fun contains!1437 (ListLongMap!3133 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1114 (array!10617 array!10615 (_ BitVec 32) (_ BitVec 32) V!7233 V!7233 (_ BitVec 32) Int) ListLongMap!3133)

(assert (=> b!217709 (= res!106629 (not (contains!1437 (getCurrentListMap!1114 (_keys!6150 thiss!1504) (_values!4084 thiss!1504) (mask!9862 thiss!1504) (extraKeys!3838 thiss!1504) (zeroValue!3942 thiss!1504) (minValue!3942 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4101 thiss!1504)) key!932)))))

(declare-fun b!217710 () Bool)

(declare-fun e!141622 () Bool)

(assert (=> b!217710 (= e!141622 tp_is_empty!5689)))

(declare-fun b!217711 () Bool)

(assert (=> b!217711 (= e!141621 tp_is_empty!5689)))

(declare-fun b!217712 () Bool)

(assert (=> b!217712 (= e!141619 e!141618)))

(declare-fun res!106634 () Bool)

(assert (=> b!217712 (=> (not res!106634) (not e!141618))))

(declare-datatypes ((SeekEntryResult!752 0))(
  ( (MissingZero!752 (index!5178 (_ BitVec 32))) (Found!752 (index!5179 (_ BitVec 32))) (Intermediate!752 (undefined!1564 Bool) (index!5180 (_ BitVec 32)) (x!22744 (_ BitVec 32))) (Undefined!752) (MissingVacant!752 (index!5181 (_ BitVec 32))) )
))
(declare-fun lt!111446 () SeekEntryResult!752)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217712 (= res!106634 (or (= lt!111446 (MissingZero!752 index!297)) (= lt!111446 (MissingVacant!752 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10617 (_ BitVec 32)) SeekEntryResult!752)

(assert (=> b!217712 (= lt!111446 (seekEntryOrOpen!0 key!932 (_keys!6150 thiss!1504) (mask!9862 thiss!1504)))))

(declare-fun b!217713 () Bool)

(declare-fun res!106631 () Bool)

(assert (=> b!217713 (=> (not res!106631) (not e!141619))))

(assert (=> b!217713 (= res!106631 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217714 () Bool)

(assert (=> b!217714 (= e!141616 (and e!141622 mapRes!9696))))

(declare-fun condMapEmpty!9696 () Bool)

(declare-fun mapDefault!9696 () ValueCell!2501)

(assert (=> b!217714 (= condMapEmpty!9696 (= (arr!5029 (_values!4084 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2501)) mapDefault!9696)))))

(assert (= (and start!21682 res!106633) b!217713))

(assert (= (and b!217713 res!106631) b!217712))

(assert (= (and b!217712 res!106634) b!217709))

(assert (= (and b!217709 res!106629) b!217706))

(assert (= (and b!217706 res!106630) b!217705))

(assert (= (and b!217705 res!106635) b!217707))

(assert (= (and b!217707 res!106632) b!217708))

(assert (= (and b!217714 condMapEmpty!9696) mapIsEmpty!9696))

(assert (= (and b!217714 (not condMapEmpty!9696)) mapNonEmpty!9696))

(get-info :version)

(assert (= (and mapNonEmpty!9696 ((_ is ValueCellFull!2501) mapValue!9696)) b!217711))

(assert (= (and b!217714 ((_ is ValueCellFull!2501) mapDefault!9696)) b!217710))

(assert (= b!217704 b!217714))

(assert (= start!21682 b!217704))

(declare-fun m!244071 () Bool)

(assert (=> start!21682 m!244071))

(declare-fun m!244073 () Bool)

(assert (=> b!217704 m!244073))

(declare-fun m!244075 () Bool)

(assert (=> b!217704 m!244075))

(declare-fun m!244077 () Bool)

(assert (=> b!217708 m!244077))

(declare-fun m!244079 () Bool)

(assert (=> mapNonEmpty!9696 m!244079))

(declare-fun m!244081 () Bool)

(assert (=> b!217707 m!244081))

(declare-fun m!244083 () Bool)

(assert (=> b!217712 m!244083))

(declare-fun m!244085 () Bool)

(assert (=> b!217706 m!244085))

(declare-fun m!244087 () Bool)

(assert (=> b!217709 m!244087))

(assert (=> b!217709 m!244087))

(declare-fun m!244089 () Bool)

(assert (=> b!217709 m!244089))

(check-sat (not mapNonEmpty!9696) (not b!217706) tp_is_empty!5689 (not b!217704) b_and!12731 (not b_next!5827) (not b!217708) (not start!21682) (not b!217709) (not b!217707) (not b!217712))
(check-sat b_and!12731 (not b_next!5827))
