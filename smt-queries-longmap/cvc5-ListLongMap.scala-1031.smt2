; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21868 () Bool)

(assert start!21868)

(declare-fun b!220865 () Bool)

(declare-fun b_free!5935 () Bool)

(declare-fun b_next!5935 () Bool)

(assert (=> b!220865 (= b_free!5935 (not b_next!5935))))

(declare-fun tp!20947 () Bool)

(declare-fun b_and!12833 () Bool)

(assert (=> b!220865 (= tp!20947 b_and!12833)))

(declare-fun b!220852 () Bool)

(declare-fun c!36741 () Bool)

(declare-datatypes ((SeekEntryResult!817 0))(
  ( (MissingZero!817 (index!5438 (_ BitVec 32))) (Found!817 (index!5439 (_ BitVec 32))) (Intermediate!817 (undefined!1629 Bool) (index!5440 (_ BitVec 32)) (x!22981 (_ BitVec 32))) (Undefined!817) (MissingVacant!817 (index!5441 (_ BitVec 32))) )
))
(declare-fun lt!112274 () SeekEntryResult!817)

(assert (=> b!220852 (= c!36741 (is-MissingVacant!817 lt!112274))))

(declare-fun e!143570 () Bool)

(declare-fun e!143579 () Bool)

(assert (=> b!220852 (= e!143570 e!143579)))

(declare-fun b!220853 () Bool)

(declare-fun e!143574 () Bool)

(declare-fun tp_is_empty!5797 () Bool)

(assert (=> b!220853 (= e!143574 tp_is_empty!5797)))

(declare-fun b!220854 () Bool)

(declare-fun res!108316 () Bool)

(declare-fun e!143575 () Bool)

(assert (=> b!220854 (=> (not res!108316) (not e!143575))))

(declare-datatypes ((V!7377 0))(
  ( (V!7378 (val!2943 Int)) )
))
(declare-datatypes ((ValueCell!2555 0))(
  ( (ValueCellFull!2555 (v!4963 V!7377)) (EmptyCell!2555) )
))
(declare-datatypes ((array!10837 0))(
  ( (array!10838 (arr!5138 (Array (_ BitVec 32) ValueCell!2555)) (size!5471 (_ BitVec 32))) )
))
(declare-datatypes ((array!10839 0))(
  ( (array!10840 (arr!5139 (Array (_ BitVec 32) (_ BitVec 64))) (size!5472 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3010 0))(
  ( (LongMapFixedSize!3011 (defaultEntry!4164 Int) (mask!9970 (_ BitVec 32)) (extraKeys!3901 (_ BitVec 32)) (zeroValue!4005 V!7377) (minValue!4005 V!7377) (_size!1554 (_ BitVec 32)) (_keys!6218 array!10839) (_values!4147 array!10837) (_vacant!1554 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3010)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!220854 (= res!108316 (arrayContainsKey!0 (_keys!6218 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220855 () Bool)

(declare-fun res!108315 () Bool)

(assert (=> b!220855 (=> (not res!108315) (not e!143575))))

(assert (=> b!220855 (= res!108315 (and (= (size!5471 (_values!4147 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9970 thiss!1504))) (= (size!5472 (_keys!6218 thiss!1504)) (size!5471 (_values!4147 thiss!1504))) (bvsge (mask!9970 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3901 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3901 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!220856 () Bool)

(assert (=> b!220856 (= e!143575 false)))

(declare-fun lt!112276 () Bool)

(declare-datatypes ((List!3269 0))(
  ( (Nil!3266) (Cons!3265 (h!3913 (_ BitVec 64)) (t!8228 List!3269)) )
))
(declare-fun arrayNoDuplicates!0 (array!10839 (_ BitVec 32) List!3269) Bool)

(assert (=> b!220856 (= lt!112276 (arrayNoDuplicates!0 (_keys!6218 thiss!1504) #b00000000000000000000000000000000 Nil!3266))))

(declare-fun mapIsEmpty!9865 () Bool)

(declare-fun mapRes!9865 () Bool)

(assert (=> mapIsEmpty!9865 mapRes!9865))

(declare-fun b!220857 () Bool)

(declare-fun res!108320 () Bool)

(assert (=> b!220857 (=> (not res!108320) (not e!143575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10839 (_ BitVec 32)) Bool)

(assert (=> b!220857 (= res!108320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6218 thiss!1504) (mask!9970 thiss!1504)))))

(declare-fun b!220858 () Bool)

(declare-datatypes ((Unit!6591 0))(
  ( (Unit!6592) )
))
(declare-fun e!143582 () Unit!6591)

(declare-fun Unit!6593 () Unit!6591)

(assert (=> b!220858 (= e!143582 Unit!6593)))

(declare-fun lt!112273 () Unit!6591)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!208 (array!10839 array!10837 (_ BitVec 32) (_ BitVec 32) V!7377 V!7377 (_ BitVec 64) Int) Unit!6591)

(assert (=> b!220858 (= lt!112273 (lemmaInListMapThenSeekEntryOrOpenFindsIt!208 (_keys!6218 thiss!1504) (_values!4147 thiss!1504) (mask!9970 thiss!1504) (extraKeys!3901 thiss!1504) (zeroValue!4005 thiss!1504) (minValue!4005 thiss!1504) key!932 (defaultEntry!4164 thiss!1504)))))

(assert (=> b!220858 false))

(declare-fun b!220859 () Bool)

(declare-fun e!143580 () Bool)

(assert (=> b!220859 (= e!143580 e!143575)))

(declare-fun res!108317 () Bool)

(assert (=> b!220859 (=> (not res!108317) (not e!143575))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!220859 (= res!108317 (inRange!0 index!297 (mask!9970 thiss!1504)))))

(declare-fun lt!112277 () Unit!6591)

(assert (=> b!220859 (= lt!112277 e!143582)))

(declare-fun c!36739 () Bool)

(declare-datatypes ((tuple2!4366 0))(
  ( (tuple2!4367 (_1!2194 (_ BitVec 64)) (_2!2194 V!7377)) )
))
(declare-datatypes ((List!3270 0))(
  ( (Nil!3267) (Cons!3266 (h!3914 tuple2!4366) (t!8229 List!3270)) )
))
(declare-datatypes ((ListLongMap!3279 0))(
  ( (ListLongMap!3280 (toList!1655 List!3270)) )
))
(declare-fun contains!1498 (ListLongMap!3279 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1183 (array!10839 array!10837 (_ BitVec 32) (_ BitVec 32) V!7377 V!7377 (_ BitVec 32) Int) ListLongMap!3279)

(assert (=> b!220859 (= c!36739 (contains!1498 (getCurrentListMap!1183 (_keys!6218 thiss!1504) (_values!4147 thiss!1504) (mask!9970 thiss!1504) (extraKeys!3901 thiss!1504) (zeroValue!4005 thiss!1504) (minValue!4005 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4164 thiss!1504)) key!932))))

(declare-fun b!220860 () Bool)

(declare-fun res!108324 () Bool)

(declare-fun e!143572 () Bool)

(assert (=> b!220860 (=> (not res!108324) (not e!143572))))

(assert (=> b!220860 (= res!108324 (= (select (arr!5139 (_keys!6218 thiss!1504)) (index!5438 lt!112274)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220861 () Bool)

(declare-fun e!143576 () Bool)

(assert (=> b!220861 (= e!143576 tp_is_empty!5797)))

(declare-fun b!220862 () Bool)

(declare-fun e!143573 () Bool)

(declare-fun call!20639 () Bool)

(assert (=> b!220862 (= e!143573 (not call!20639))))

(declare-fun bm!20636 () Bool)

(declare-fun call!20640 () Bool)

(declare-fun c!36740 () Bool)

(assert (=> bm!20636 (= call!20640 (inRange!0 (ite c!36740 (index!5438 lt!112274) (index!5441 lt!112274)) (mask!9970 thiss!1504)))))

(declare-fun b!220863 () Bool)

(declare-fun res!108322 () Bool)

(declare-fun e!143571 () Bool)

(assert (=> b!220863 (=> (not res!108322) (not e!143571))))

(assert (=> b!220863 (= res!108322 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220864 () Bool)

(declare-fun res!108323 () Bool)

(assert (=> b!220864 (= res!108323 (= (select (arr!5139 (_keys!6218 thiss!1504)) (index!5441 lt!112274)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!220864 (=> (not res!108323) (not e!143573))))

(declare-fun bm!20637 () Bool)

(assert (=> bm!20637 (= call!20639 (arrayContainsKey!0 (_keys!6218 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun e!143577 () Bool)

(declare-fun e!143581 () Bool)

(declare-fun array_inv!3399 (array!10839) Bool)

(declare-fun array_inv!3400 (array!10837) Bool)

(assert (=> b!220865 (= e!143577 (and tp!20947 tp_is_empty!5797 (array_inv!3399 (_keys!6218 thiss!1504)) (array_inv!3400 (_values!4147 thiss!1504)) e!143581))))

(declare-fun b!220866 () Bool)

(declare-fun res!108318 () Bool)

(assert (=> b!220866 (=> (not res!108318) (not e!143575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220866 (= res!108318 (validMask!0 (mask!9970 thiss!1504)))))

(declare-fun res!108325 () Bool)

(assert (=> start!21868 (=> (not res!108325) (not e!143571))))

(declare-fun valid!1214 (LongMapFixedSize!3010) Bool)

(assert (=> start!21868 (= res!108325 (valid!1214 thiss!1504))))

(assert (=> start!21868 e!143571))

(assert (=> start!21868 e!143577))

(assert (=> start!21868 true))

(declare-fun mapNonEmpty!9865 () Bool)

(declare-fun tp!20946 () Bool)

(assert (=> mapNonEmpty!9865 (= mapRes!9865 (and tp!20946 e!143576))))

(declare-fun mapValue!9865 () ValueCell!2555)

(declare-fun mapRest!9865 () (Array (_ BitVec 32) ValueCell!2555))

(declare-fun mapKey!9865 () (_ BitVec 32))

(assert (=> mapNonEmpty!9865 (= (arr!5138 (_values!4147 thiss!1504)) (store mapRest!9865 mapKey!9865 mapValue!9865))))

(declare-fun b!220867 () Bool)

(assert (=> b!220867 (= e!143571 e!143580)))

(declare-fun res!108321 () Bool)

(assert (=> b!220867 (=> (not res!108321) (not e!143580))))

(assert (=> b!220867 (= res!108321 (or (= lt!112274 (MissingZero!817 index!297)) (= lt!112274 (MissingVacant!817 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10839 (_ BitVec 32)) SeekEntryResult!817)

(assert (=> b!220867 (= lt!112274 (seekEntryOrOpen!0 key!932 (_keys!6218 thiss!1504) (mask!9970 thiss!1504)))))

(declare-fun b!220868 () Bool)

(assert (=> b!220868 (= e!143572 (not call!20639))))

(declare-fun b!220869 () Bool)

(declare-fun res!108319 () Bool)

(assert (=> b!220869 (=> (not res!108319) (not e!143572))))

(assert (=> b!220869 (= res!108319 call!20640)))

(assert (=> b!220869 (= e!143570 e!143572)))

(declare-fun b!220870 () Bool)

(assert (=> b!220870 (= e!143579 (is-Undefined!817 lt!112274))))

(declare-fun b!220871 () Bool)

(assert (=> b!220871 (= e!143581 (and e!143574 mapRes!9865))))

(declare-fun condMapEmpty!9865 () Bool)

(declare-fun mapDefault!9865 () ValueCell!2555)

