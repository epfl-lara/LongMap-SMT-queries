; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21628 () Bool)

(assert start!21628)

(declare-fun b!216619 () Bool)

(declare-fun b_free!5773 () Bool)

(declare-fun b_next!5773 () Bool)

(assert (=> b!216619 (= b_free!5773 (not b_next!5773))))

(declare-fun tp!20454 () Bool)

(declare-fun b_and!12637 () Bool)

(assert (=> b!216619 (= tp!20454 b_and!12637)))

(declare-fun e!140924 () Bool)

(declare-fun tp_is_empty!5635 () Bool)

(declare-datatypes ((V!7161 0))(
  ( (V!7162 (val!2862 Int)) )
))
(declare-datatypes ((ValueCell!2474 0))(
  ( (ValueCellFull!2474 (v!4874 V!7161)) (EmptyCell!2474) )
))
(declare-datatypes ((array!10501 0))(
  ( (array!10502 (arr!4971 (Array (_ BitVec 32) ValueCell!2474)) (size!5304 (_ BitVec 32))) )
))
(declare-datatypes ((array!10503 0))(
  ( (array!10504 (arr!4972 (Array (_ BitVec 32) (_ BitVec 64))) (size!5305 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2848 0))(
  ( (LongMapFixedSize!2849 (defaultEntry!4074 Int) (mask!9816 (_ BitVec 32)) (extraKeys!3811 (_ BitVec 32)) (zeroValue!3915 V!7161) (minValue!3915 V!7161) (_size!1473 (_ BitVec 32)) (_keys!6122 array!10503) (_values!4057 array!10501) (_vacant!1473 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2848)

(declare-fun e!140929 () Bool)

(declare-fun array_inv!3271 (array!10503) Bool)

(declare-fun array_inv!3272 (array!10501) Bool)

(assert (=> b!216619 (= e!140924 (and tp!20454 tp_is_empty!5635 (array_inv!3271 (_keys!6122 thiss!1504)) (array_inv!3272 (_values!4057 thiss!1504)) e!140929))))

(declare-fun b!216620 () Bool)

(declare-fun res!105948 () Bool)

(declare-fun e!140927 () Bool)

(assert (=> b!216620 (=> (not res!105948) (not e!140927))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4220 0))(
  ( (tuple2!4221 (_1!2121 (_ BitVec 64)) (_2!2121 V!7161)) )
))
(declare-datatypes ((List!3144 0))(
  ( (Nil!3141) (Cons!3140 (h!3787 tuple2!4220) (t!8090 List!3144)) )
))
(declare-datatypes ((ListLongMap!3123 0))(
  ( (ListLongMap!3124 (toList!1577 List!3144)) )
))
(declare-fun contains!1418 (ListLongMap!3123 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1086 (array!10503 array!10501 (_ BitVec 32) (_ BitVec 32) V!7161 V!7161 (_ BitVec 32) Int) ListLongMap!3123)

(assert (=> b!216620 (= res!105948 (contains!1418 (getCurrentListMap!1086 (_keys!6122 thiss!1504) (_values!4057 thiss!1504) (mask!9816 thiss!1504) (extraKeys!3811 thiss!1504) (zeroValue!3915 thiss!1504) (minValue!3915 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4074 thiss!1504)) key!932))))

(declare-fun res!105952 () Bool)

(declare-fun e!140930 () Bool)

(assert (=> start!21628 (=> (not res!105952) (not e!140930))))

(declare-fun valid!1173 (LongMapFixedSize!2848) Bool)

(assert (=> start!21628 (= res!105952 (valid!1173 thiss!1504))))

(assert (=> start!21628 e!140930))

(assert (=> start!21628 e!140924))

(assert (=> start!21628 true))

(declare-fun mapNonEmpty!9615 () Bool)

(declare-fun mapRes!9615 () Bool)

(declare-fun tp!20453 () Bool)

(declare-fun e!140928 () Bool)

(assert (=> mapNonEmpty!9615 (= mapRes!9615 (and tp!20453 e!140928))))

(declare-fun mapValue!9615 () ValueCell!2474)

(declare-fun mapRest!9615 () (Array (_ BitVec 32) ValueCell!2474))

(declare-fun mapKey!9615 () (_ BitVec 32))

(assert (=> mapNonEmpty!9615 (= (arr!4971 (_values!4057 thiss!1504)) (store mapRest!9615 mapKey!9615 mapValue!9615))))

(declare-fun b!216621 () Bool)

(declare-fun res!105946 () Bool)

(assert (=> b!216621 (=> (not res!105946) (not e!140930))))

(assert (=> b!216621 (= res!105946 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216622 () Bool)

(declare-fun res!105950 () Bool)

(assert (=> b!216622 (=> (not res!105950) (not e!140927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10503 (_ BitVec 32)) Bool)

(assert (=> b!216622 (= res!105950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6122 thiss!1504) (mask!9816 thiss!1504)))))

(declare-fun b!216623 () Bool)

(assert (=> b!216623 (= e!140927 false)))

(declare-fun lt!111044 () Bool)

(declare-datatypes ((List!3145 0))(
  ( (Nil!3142) (Cons!3141 (h!3788 (_ BitVec 64)) (t!8091 List!3145)) )
))
(declare-fun arrayNoDuplicates!0 (array!10503 (_ BitVec 32) List!3145) Bool)

(assert (=> b!216623 (= lt!111044 (arrayNoDuplicates!0 (_keys!6122 thiss!1504) #b00000000000000000000000000000000 Nil!3142))))

(declare-fun b!216624 () Bool)

(declare-fun res!105951 () Bool)

(assert (=> b!216624 (=> (not res!105951) (not e!140927))))

(assert (=> b!216624 (= res!105951 (and (= (size!5304 (_values!4057 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9816 thiss!1504))) (= (size!5305 (_keys!6122 thiss!1504)) (size!5304 (_values!4057 thiss!1504))) (bvsge (mask!9816 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3811 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3811 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216625 () Bool)

(declare-fun e!140925 () Bool)

(assert (=> b!216625 (= e!140925 tp_is_empty!5635)))

(declare-fun b!216626 () Bool)

(assert (=> b!216626 (= e!140928 tp_is_empty!5635)))

(declare-fun mapIsEmpty!9615 () Bool)

(assert (=> mapIsEmpty!9615 mapRes!9615))

(declare-fun b!216627 () Bool)

(assert (=> b!216627 (= e!140930 e!140927)))

(declare-fun res!105949 () Bool)

(assert (=> b!216627 (=> (not res!105949) (not e!140927))))

(declare-datatypes ((SeekEntryResult!745 0))(
  ( (MissingZero!745 (index!5150 (_ BitVec 32))) (Found!745 (index!5151 (_ BitVec 32))) (Intermediate!745 (undefined!1557 Bool) (index!5152 (_ BitVec 32)) (x!22664 (_ BitVec 32))) (Undefined!745) (MissingVacant!745 (index!5153 (_ BitVec 32))) )
))
(declare-fun lt!111043 () SeekEntryResult!745)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216627 (= res!105949 (or (= lt!111043 (MissingZero!745 index!297)) (= lt!111043 (MissingVacant!745 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10503 (_ BitVec 32)) SeekEntryResult!745)

(assert (=> b!216627 (= lt!111043 (seekEntryOrOpen!0 key!932 (_keys!6122 thiss!1504) (mask!9816 thiss!1504)))))

(declare-fun b!216628 () Bool)

(assert (=> b!216628 (= e!140929 (and e!140925 mapRes!9615))))

(declare-fun condMapEmpty!9615 () Bool)

(declare-fun mapDefault!9615 () ValueCell!2474)

(assert (=> b!216628 (= condMapEmpty!9615 (= (arr!4971 (_values!4057 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2474)) mapDefault!9615)))))

(declare-fun b!216629 () Bool)

(declare-fun res!105947 () Bool)

(assert (=> b!216629 (=> (not res!105947) (not e!140927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216629 (= res!105947 (validMask!0 (mask!9816 thiss!1504)))))

(assert (= (and start!21628 res!105952) b!216621))

(assert (= (and b!216621 res!105946) b!216627))

(assert (= (and b!216627 res!105949) b!216620))

(assert (= (and b!216620 res!105948) b!216629))

(assert (= (and b!216629 res!105947) b!216624))

(assert (= (and b!216624 res!105951) b!216622))

(assert (= (and b!216622 res!105950) b!216623))

(assert (= (and b!216628 condMapEmpty!9615) mapIsEmpty!9615))

(assert (= (and b!216628 (not condMapEmpty!9615)) mapNonEmpty!9615))

(get-info :version)

(assert (= (and mapNonEmpty!9615 ((_ is ValueCellFull!2474) mapValue!9615)) b!216626))

(assert (= (and b!216628 ((_ is ValueCellFull!2474) mapDefault!9615)) b!216625))

(assert (= b!216619 b!216628))

(assert (= start!21628 b!216619))

(declare-fun m!242733 () Bool)

(assert (=> start!21628 m!242733))

(declare-fun m!242735 () Bool)

(assert (=> b!216622 m!242735))

(declare-fun m!242737 () Bool)

(assert (=> b!216623 m!242737))

(declare-fun m!242739 () Bool)

(assert (=> mapNonEmpty!9615 m!242739))

(declare-fun m!242741 () Bool)

(assert (=> b!216619 m!242741))

(declare-fun m!242743 () Bool)

(assert (=> b!216619 m!242743))

(declare-fun m!242745 () Bool)

(assert (=> b!216620 m!242745))

(assert (=> b!216620 m!242745))

(declare-fun m!242747 () Bool)

(assert (=> b!216620 m!242747))

(declare-fun m!242749 () Bool)

(assert (=> b!216627 m!242749))

(declare-fun m!242751 () Bool)

(assert (=> b!216629 m!242751))

(check-sat tp_is_empty!5635 b_and!12637 (not b!216622) (not b!216629) (not b!216627) (not b!216620) (not b!216623) (not b!216619) (not mapNonEmpty!9615) (not b_next!5773) (not start!21628))
(check-sat b_and!12637 (not b_next!5773))
