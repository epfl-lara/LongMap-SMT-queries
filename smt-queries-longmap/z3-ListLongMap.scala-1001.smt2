; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21608 () Bool)

(assert start!21608)

(declare-fun b!216511 () Bool)

(declare-fun b_free!5757 () Bool)

(declare-fun b_next!5757 () Bool)

(assert (=> b!216511 (= b_free!5757 (not b_next!5757))))

(declare-fun tp!20405 () Bool)

(declare-fun b_and!12647 () Bool)

(assert (=> b!216511 (= tp!20405 b_and!12647)))

(declare-fun b!216502 () Bool)

(declare-fun e!140858 () Bool)

(declare-fun e!140859 () Bool)

(declare-fun mapRes!9591 () Bool)

(assert (=> b!216502 (= e!140858 (and e!140859 mapRes!9591))))

(declare-fun condMapEmpty!9591 () Bool)

(declare-datatypes ((V!7139 0))(
  ( (V!7140 (val!2854 Int)) )
))
(declare-datatypes ((ValueCell!2466 0))(
  ( (ValueCellFull!2466 (v!4872 V!7139)) (EmptyCell!2466) )
))
(declare-datatypes ((array!10477 0))(
  ( (array!10478 (arr!4960 (Array (_ BitVec 32) ValueCell!2466)) (size!5292 (_ BitVec 32))) )
))
(declare-datatypes ((array!10479 0))(
  ( (array!10480 (arr!4961 (Array (_ BitVec 32) (_ BitVec 64))) (size!5293 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2832 0))(
  ( (LongMapFixedSize!2833 (defaultEntry!4066 Int) (mask!9803 (_ BitVec 32)) (extraKeys!3803 (_ BitVec 32)) (zeroValue!3907 V!7139) (minValue!3907 V!7139) (_size!1465 (_ BitVec 32)) (_keys!6115 array!10479) (_values!4049 array!10477) (_vacant!1465 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2832)

(declare-fun mapDefault!9591 () ValueCell!2466)

(assert (=> b!216502 (= condMapEmpty!9591 (= (arr!4960 (_values!4049 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2466)) mapDefault!9591)))))

(declare-fun b!216503 () Bool)

(declare-fun tp_is_empty!5619 () Bool)

(assert (=> b!216503 (= e!140859 tp_is_empty!5619)))

(declare-fun b!216504 () Bool)

(declare-fun res!105873 () Bool)

(declare-fun e!140861 () Bool)

(assert (=> b!216504 (=> (not res!105873) (not e!140861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10479 (_ BitVec 32)) Bool)

(assert (=> b!216504 (= res!105873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6115 thiss!1504) (mask!9803 thiss!1504)))))

(declare-fun mapNonEmpty!9591 () Bool)

(declare-fun tp!20406 () Bool)

(declare-fun e!140863 () Bool)

(assert (=> mapNonEmpty!9591 (= mapRes!9591 (and tp!20406 e!140863))))

(declare-fun mapRest!9591 () (Array (_ BitVec 32) ValueCell!2466))

(declare-fun mapValue!9591 () ValueCell!2466)

(declare-fun mapKey!9591 () (_ BitVec 32))

(assert (=> mapNonEmpty!9591 (= (arr!4960 (_values!4049 thiss!1504)) (store mapRest!9591 mapKey!9591 mapValue!9591))))

(declare-fun b!216505 () Bool)

(assert (=> b!216505 (= e!140863 tp_is_empty!5619)))

(declare-fun b!216506 () Bool)

(assert (=> b!216506 (= e!140861 false)))

(declare-fun lt!111177 () Bool)

(declare-datatypes ((List!3149 0))(
  ( (Nil!3146) (Cons!3145 (h!3792 (_ BitVec 64)) (t!8104 List!3149)) )
))
(declare-fun arrayNoDuplicates!0 (array!10479 (_ BitVec 32) List!3149) Bool)

(assert (=> b!216506 (= lt!111177 (arrayNoDuplicates!0 (_keys!6115 thiss!1504) #b00000000000000000000000000000000 Nil!3146))))

(declare-fun b!216507 () Bool)

(declare-fun res!105874 () Bool)

(assert (=> b!216507 (=> (not res!105874) (not e!140861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216507 (= res!105874 (validMask!0 (mask!9803 thiss!1504)))))

(declare-fun b!216508 () Bool)

(declare-fun res!105875 () Bool)

(declare-fun e!140857 () Bool)

(assert (=> b!216508 (=> (not res!105875) (not e!140857))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!216508 (= res!105875 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216510 () Bool)

(declare-fun res!105876 () Bool)

(assert (=> b!216510 (=> (not res!105876) (not e!140861))))

(declare-datatypes ((tuple2!4244 0))(
  ( (tuple2!4245 (_1!2133 (_ BitVec 64)) (_2!2133 V!7139)) )
))
(declare-datatypes ((List!3150 0))(
  ( (Nil!3147) (Cons!3146 (h!3793 tuple2!4244) (t!8105 List!3150)) )
))
(declare-datatypes ((ListLongMap!3157 0))(
  ( (ListLongMap!3158 (toList!1594 List!3150)) )
))
(declare-fun contains!1435 (ListLongMap!3157 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1122 (array!10479 array!10477 (_ BitVec 32) (_ BitVec 32) V!7139 V!7139 (_ BitVec 32) Int) ListLongMap!3157)

(assert (=> b!216510 (= res!105876 (contains!1435 (getCurrentListMap!1122 (_keys!6115 thiss!1504) (_values!4049 thiss!1504) (mask!9803 thiss!1504) (extraKeys!3803 thiss!1504) (zeroValue!3907 thiss!1504) (minValue!3907 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4066 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!9591 () Bool)

(assert (=> mapIsEmpty!9591 mapRes!9591))

(declare-fun b!216509 () Bool)

(assert (=> b!216509 (= e!140857 e!140861)))

(declare-fun res!105877 () Bool)

(assert (=> b!216509 (=> (not res!105877) (not e!140861))))

(declare-datatypes ((SeekEntryResult!746 0))(
  ( (MissingZero!746 (index!5154 (_ BitVec 32))) (Found!746 (index!5155 (_ BitVec 32))) (Intermediate!746 (undefined!1558 Bool) (index!5156 (_ BitVec 32)) (x!22642 (_ BitVec 32))) (Undefined!746) (MissingVacant!746 (index!5157 (_ BitVec 32))) )
))
(declare-fun lt!111176 () SeekEntryResult!746)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216509 (= res!105877 (or (= lt!111176 (MissingZero!746 index!297)) (= lt!111176 (MissingVacant!746 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10479 (_ BitVec 32)) SeekEntryResult!746)

(assert (=> b!216509 (= lt!111176 (seekEntryOrOpen!0 key!932 (_keys!6115 thiss!1504) (mask!9803 thiss!1504)))))

(declare-fun res!105878 () Bool)

(assert (=> start!21608 (=> (not res!105878) (not e!140857))))

(declare-fun valid!1151 (LongMapFixedSize!2832) Bool)

(assert (=> start!21608 (= res!105878 (valid!1151 thiss!1504))))

(assert (=> start!21608 e!140857))

(declare-fun e!140862 () Bool)

(assert (=> start!21608 e!140862))

(assert (=> start!21608 true))

(declare-fun array_inv!3281 (array!10479) Bool)

(declare-fun array_inv!3282 (array!10477) Bool)

(assert (=> b!216511 (= e!140862 (and tp!20405 tp_is_empty!5619 (array_inv!3281 (_keys!6115 thiss!1504)) (array_inv!3282 (_values!4049 thiss!1504)) e!140858))))

(declare-fun b!216512 () Bool)

(declare-fun res!105879 () Bool)

(assert (=> b!216512 (=> (not res!105879) (not e!140861))))

(assert (=> b!216512 (= res!105879 (and (= (size!5292 (_values!4049 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9803 thiss!1504))) (= (size!5293 (_keys!6115 thiss!1504)) (size!5292 (_values!4049 thiss!1504))) (bvsge (mask!9803 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3803 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3803 thiss!1504) #b00000000000000000000000000000011)))))

(assert (= (and start!21608 res!105878) b!216508))

(assert (= (and b!216508 res!105875) b!216509))

(assert (= (and b!216509 res!105877) b!216510))

(assert (= (and b!216510 res!105876) b!216507))

(assert (= (and b!216507 res!105874) b!216512))

(assert (= (and b!216512 res!105879) b!216504))

(assert (= (and b!216504 res!105873) b!216506))

(assert (= (and b!216502 condMapEmpty!9591) mapIsEmpty!9591))

(assert (= (and b!216502 (not condMapEmpty!9591)) mapNonEmpty!9591))

(get-info :version)

(assert (= (and mapNonEmpty!9591 ((_ is ValueCellFull!2466) mapValue!9591)) b!216505))

(assert (= (and b!216502 ((_ is ValueCellFull!2466) mapDefault!9591)) b!216503))

(assert (= b!216511 b!216502))

(assert (= start!21608 b!216511))

(declare-fun m!243189 () Bool)

(assert (=> b!216511 m!243189))

(declare-fun m!243191 () Bool)

(assert (=> b!216511 m!243191))

(declare-fun m!243193 () Bool)

(assert (=> b!216506 m!243193))

(declare-fun m!243195 () Bool)

(assert (=> b!216504 m!243195))

(declare-fun m!243197 () Bool)

(assert (=> start!21608 m!243197))

(declare-fun m!243199 () Bool)

(assert (=> b!216509 m!243199))

(declare-fun m!243201 () Bool)

(assert (=> b!216510 m!243201))

(assert (=> b!216510 m!243201))

(declare-fun m!243203 () Bool)

(assert (=> b!216510 m!243203))

(declare-fun m!243205 () Bool)

(assert (=> mapNonEmpty!9591 m!243205))

(declare-fun m!243207 () Bool)

(assert (=> b!216507 m!243207))

(check-sat (not b_next!5757) (not b!216504) (not b!216511) (not b!216509) (not b!216506) (not mapNonEmpty!9591) tp_is_empty!5619 b_and!12647 (not start!21608) (not b!216510) (not b!216507))
(check-sat b_and!12647 (not b_next!5757))
