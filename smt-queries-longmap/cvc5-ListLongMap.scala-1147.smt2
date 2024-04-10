; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23920 () Bool)

(assert start!23920)

(declare-fun b!250715 () Bool)

(declare-fun b_free!6631 () Bool)

(declare-fun b_next!6631 () Bool)

(assert (=> b!250715 (= b_free!6631 (not b_next!6631))))

(declare-fun tp!23161 () Bool)

(declare-fun b_and!13653 () Bool)

(assert (=> b!250715 (= tp!23161 b_and!13653)))

(declare-fun b!250709 () Bool)

(declare-datatypes ((Unit!7757 0))(
  ( (Unit!7758) )
))
(declare-fun e!162601 () Unit!7757)

(declare-fun lt!125620 () Unit!7757)

(assert (=> b!250709 (= e!162601 lt!125620)))

(declare-datatypes ((V!8305 0))(
  ( (V!8306 (val!3291 Int)) )
))
(declare-datatypes ((ValueCell!2903 0))(
  ( (ValueCellFull!2903 (v!5357 V!8305)) (EmptyCell!2903) )
))
(declare-datatypes ((array!12305 0))(
  ( (array!12306 (arr!5834 (Array (_ BitVec 32) ValueCell!2903)) (size!6179 (_ BitVec 32))) )
))
(declare-datatypes ((array!12307 0))(
  ( (array!12308 (arr!5835 (Array (_ BitVec 32) (_ BitVec 64))) (size!6180 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3706 0))(
  ( (LongMapFixedSize!3707 (defaultEntry!4634 Int) (mask!10824 (_ BitVec 32)) (extraKeys!4371 (_ BitVec 32)) (zeroValue!4475 V!8305) (minValue!4475 V!8305) (_size!1902 (_ BitVec 32)) (_keys!6772 array!12307) (_values!4617 array!12305) (_vacant!1902 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3706)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!401 (array!12307 array!12305 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 64) Int) Unit!7757)

(assert (=> b!250709 (= lt!125620 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!401 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 (defaultEntry!4634 thiss!1504)))))

(declare-fun c!42143 () Bool)

(declare-datatypes ((SeekEntryResult!1123 0))(
  ( (MissingZero!1123 (index!6662 (_ BitVec 32))) (Found!1123 (index!6663 (_ BitVec 32))) (Intermediate!1123 (undefined!1935 Bool) (index!6664 (_ BitVec 32)) (x!24691 (_ BitVec 32))) (Undefined!1123) (MissingVacant!1123 (index!6665 (_ BitVec 32))) )
))
(declare-fun lt!125624 () SeekEntryResult!1123)

(assert (=> b!250709 (= c!42143 (is-MissingZero!1123 lt!125624))))

(declare-fun e!162602 () Bool)

(assert (=> b!250709 e!162602))

(declare-fun b!250710 () Bool)

(declare-fun e!162598 () Bool)

(declare-fun e!162599 () Bool)

(assert (=> b!250710 (= e!162598 e!162599)))

(declare-fun res!122782 () Bool)

(assert (=> b!250710 (=> (not res!122782) (not e!162599))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!250710 (= res!122782 (or (= lt!125624 (MissingZero!1123 index!297)) (= lt!125624 (MissingVacant!1123 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12307 (_ BitVec 32)) SeekEntryResult!1123)

(assert (=> b!250710 (= lt!125624 (seekEntryOrOpen!0 key!932 (_keys!6772 thiss!1504) (mask!10824 thiss!1504)))))

(declare-fun b!250711 () Bool)

(declare-fun e!162609 () Bool)

(declare-fun call!23573 () Bool)

(assert (=> b!250711 (= e!162609 (not call!23573))))

(declare-fun b!250712 () Bool)

(declare-fun e!162606 () Bool)

(declare-fun e!162604 () Bool)

(assert (=> b!250712 (= e!162606 e!162604)))

(declare-fun res!122784 () Bool)

(declare-fun call!23574 () Bool)

(assert (=> b!250712 (= res!122784 call!23574)))

(assert (=> b!250712 (=> (not res!122784) (not e!162604))))

(declare-fun b!250713 () Bool)

(declare-fun e!162608 () Bool)

(assert (=> b!250713 (= e!162599 e!162608)))

(declare-fun res!122783 () Bool)

(assert (=> b!250713 (=> (not res!122783) (not e!162608))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250713 (= res!122783 (inRange!0 index!297 (mask!10824 thiss!1504)))))

(declare-fun lt!125623 () Unit!7757)

(assert (=> b!250713 (= lt!125623 e!162601)))

(declare-fun c!42142 () Bool)

(declare-datatypes ((tuple2!4844 0))(
  ( (tuple2!4845 (_1!2433 (_ BitVec 64)) (_2!2433 V!8305)) )
))
(declare-datatypes ((List!3725 0))(
  ( (Nil!3722) (Cons!3721 (h!4381 tuple2!4844) (t!8760 List!3725)) )
))
(declare-datatypes ((ListLongMap!3757 0))(
  ( (ListLongMap!3758 (toList!1894 List!3725)) )
))
(declare-fun contains!1816 (ListLongMap!3757 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1422 (array!12307 array!12305 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 32) Int) ListLongMap!3757)

(assert (=> b!250713 (= c!42142 (contains!1816 (getCurrentListMap!1422 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!11035 () Bool)

(declare-fun mapRes!11035 () Bool)

(assert (=> mapIsEmpty!11035 mapRes!11035))

(declare-fun b!250714 () Bool)

(declare-fun e!162607 () Unit!7757)

(declare-fun Unit!7759 () Unit!7757)

(assert (=> b!250714 (= e!162607 Unit!7759)))

(declare-fun lt!125628 () Unit!7757)

(declare-fun lemmaArrayContainsKeyThenInListMap!201 (array!12307 array!12305 (_ BitVec 32) (_ BitVec 32) V!8305 V!8305 (_ BitVec 64) (_ BitVec 32) Int) Unit!7757)

(assert (=> b!250714 (= lt!125628 (lemmaArrayContainsKeyThenInListMap!201 (_keys!6772 thiss!1504) (_values!4617 thiss!1504) (mask!10824 thiss!1504) (extraKeys!4371 thiss!1504) (zeroValue!4475 thiss!1504) (minValue!4475 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4634 thiss!1504)))))

(assert (=> b!250714 false))

(declare-fun e!162605 () Bool)

(declare-fun e!162596 () Bool)

(declare-fun tp_is_empty!6493 () Bool)

(declare-fun array_inv!3851 (array!12307) Bool)

(declare-fun array_inv!3852 (array!12305) Bool)

(assert (=> b!250715 (= e!162605 (and tp!23161 tp_is_empty!6493 (array_inv!3851 (_keys!6772 thiss!1504)) (array_inv!3852 (_values!4617 thiss!1504)) e!162596))))

(declare-fun mapNonEmpty!11035 () Bool)

(declare-fun tp!23160 () Bool)

(declare-fun e!162600 () Bool)

(assert (=> mapNonEmpty!11035 (= mapRes!11035 (and tp!23160 e!162600))))

(declare-fun mapValue!11035 () ValueCell!2903)

(declare-fun mapRest!11035 () (Array (_ BitVec 32) ValueCell!2903))

(declare-fun mapKey!11035 () (_ BitVec 32))

(assert (=> mapNonEmpty!11035 (= (arr!5834 (_values!4617 thiss!1504)) (store mapRest!11035 mapKey!11035 mapValue!11035))))

(declare-fun b!250716 () Bool)

(assert (=> b!250716 (= e!162606 (is-Undefined!1123 lt!125624))))

(declare-fun b!250717 () Bool)

(assert (=> b!250717 (= e!162600 tp_is_empty!6493)))

(declare-fun b!250718 () Bool)

(declare-fun e!162610 () Bool)

(assert (=> b!250718 (= e!162610 tp_is_empty!6493)))

(declare-fun b!250719 () Bool)

(assert (=> b!250719 (= e!162596 (and e!162610 mapRes!11035))))

(declare-fun condMapEmpty!11035 () Bool)

(declare-fun mapDefault!11035 () ValueCell!2903)

