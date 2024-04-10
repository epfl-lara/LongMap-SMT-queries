; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21884 () Bool)

(assert start!21884)

(declare-fun b!221399 () Bool)

(declare-fun b_free!5951 () Bool)

(declare-fun b_next!5951 () Bool)

(assert (=> b!221399 (= b_free!5951 (not b_next!5951))))

(declare-fun tp!20994 () Bool)

(declare-fun b_and!12849 () Bool)

(assert (=> b!221399 (= tp!20994 b_and!12849)))

(declare-fun b!221380 () Bool)

(declare-fun e!143882 () Bool)

(declare-fun e!143885 () Bool)

(assert (=> b!221380 (= e!143882 e!143885)))

(declare-fun res!108613 () Bool)

(declare-fun call!20687 () Bool)

(assert (=> b!221380 (= res!108613 call!20687)))

(assert (=> b!221380 (=> (not res!108613) (not e!143885))))

(declare-fun b!221381 () Bool)

(declare-fun res!108603 () Bool)

(declare-fun e!143893 () Bool)

(assert (=> b!221381 (=> (not res!108603) (not e!143893))))

(declare-datatypes ((V!7397 0))(
  ( (V!7398 (val!2951 Int)) )
))
(declare-datatypes ((ValueCell!2563 0))(
  ( (ValueCellFull!2563 (v!4971 V!7397)) (EmptyCell!2563) )
))
(declare-datatypes ((array!10869 0))(
  ( (array!10870 (arr!5154 (Array (_ BitVec 32) ValueCell!2563)) (size!5487 (_ BitVec 32))) )
))
(declare-datatypes ((array!10871 0))(
  ( (array!10872 (arr!5155 (Array (_ BitVec 32) (_ BitVec 64))) (size!5488 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3026 0))(
  ( (LongMapFixedSize!3027 (defaultEntry!4172 Int) (mask!9982 (_ BitVec 32)) (extraKeys!3909 (_ BitVec 32)) (zeroValue!4013 V!7397) (minValue!4013 V!7397) (_size!1562 (_ BitVec 32)) (_keys!6226 array!10871) (_values!4155 array!10869) (_vacant!1562 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3026)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10871 (_ BitVec 32)) Bool)

(assert (=> b!221381 (= res!108603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6226 thiss!1504) (mask!9982 thiss!1504)))))

(declare-fun mapIsEmpty!9889 () Bool)

(declare-fun mapRes!9889 () Bool)

(assert (=> mapIsEmpty!9889 mapRes!9889))

(declare-fun b!221383 () Bool)

(declare-datatypes ((Unit!6614 0))(
  ( (Unit!6615) )
))
(declare-fun e!143889 () Unit!6614)

(declare-fun Unit!6616 () Unit!6614)

(assert (=> b!221383 (= e!143889 Unit!6616)))

(declare-fun lt!112395 () Unit!6614)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!215 (array!10871 array!10869 (_ BitVec 32) (_ BitVec 32) V!7397 V!7397 (_ BitVec 64) Int) Unit!6614)

(assert (=> b!221383 (= lt!112395 (lemmaInListMapThenSeekEntryOrOpenFindsIt!215 (_keys!6226 thiss!1504) (_values!4155 thiss!1504) (mask!9982 thiss!1504) (extraKeys!3909 thiss!1504) (zeroValue!4013 thiss!1504) (minValue!4013 thiss!1504) key!932 (defaultEntry!4172 thiss!1504)))))

(assert (=> b!221383 false))

(declare-fun b!221384 () Bool)

(assert (=> b!221384 (= e!143893 false)))

(declare-fun lt!112397 () Bool)

(declare-datatypes ((List!3280 0))(
  ( (Nil!3277) (Cons!3276 (h!3924 (_ BitVec 64)) (t!8239 List!3280)) )
))
(declare-fun arrayNoDuplicates!0 (array!10871 (_ BitVec 32) List!3280) Bool)

(assert (=> b!221384 (= lt!112397 (arrayNoDuplicates!0 (_keys!6226 thiss!1504) #b00000000000000000000000000000000 Nil!3277))))

(declare-fun b!221385 () Bool)

(declare-fun e!143894 () Bool)

(declare-fun call!20688 () Bool)

(assert (=> b!221385 (= e!143894 (not call!20688))))

(declare-fun b!221386 () Bool)

(declare-fun res!108610 () Bool)

(declare-fun e!143890 () Bool)

(assert (=> b!221386 (=> (not res!108610) (not e!143890))))

(assert (=> b!221386 (= res!108610 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221387 () Bool)

(declare-fun e!143891 () Bool)

(declare-fun tp_is_empty!5813 () Bool)

(assert (=> b!221387 (= e!143891 tp_is_empty!5813)))

(declare-fun b!221388 () Bool)

(declare-fun res!108611 () Bool)

(assert (=> b!221388 (=> (not res!108611) (not e!143893))))

(declare-fun arrayContainsKey!0 (array!10871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!221388 (= res!108611 (arrayContainsKey!0 (_keys!6226 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221389 () Bool)

(declare-datatypes ((SeekEntryResult!824 0))(
  ( (MissingZero!824 (index!5466 (_ BitVec 32))) (Found!824 (index!5467 (_ BitVec 32))) (Intermediate!824 (undefined!1636 Bool) (index!5468 (_ BitVec 32)) (x!23004 (_ BitVec 32))) (Undefined!824) (MissingVacant!824 (index!5469 (_ BitVec 32))) )
))
(declare-fun lt!112393 () SeekEntryResult!824)

(assert (=> b!221389 (= e!143882 (is-Undefined!824 lt!112393))))

(declare-fun bm!20684 () Bool)

(assert (=> bm!20684 (= call!20688 (arrayContainsKey!0 (_keys!6226 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!9889 () Bool)

(declare-fun tp!20995 () Bool)

(declare-fun e!143888 () Bool)

(assert (=> mapNonEmpty!9889 (= mapRes!9889 (and tp!20995 e!143888))))

(declare-fun mapRest!9889 () (Array (_ BitVec 32) ValueCell!2563))

(declare-fun mapValue!9889 () ValueCell!2563)

(declare-fun mapKey!9889 () (_ BitVec 32))

(assert (=> mapNonEmpty!9889 (= (arr!5154 (_values!4155 thiss!1504)) (store mapRest!9889 mapKey!9889 mapValue!9889))))

(declare-fun c!36813 () Bool)

(declare-fun bm!20685 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20685 (= call!20687 (inRange!0 (ite c!36813 (index!5466 lt!112393) (index!5469 lt!112393)) (mask!9982 thiss!1504)))))

(declare-fun b!221390 () Bool)

(declare-fun lt!112396 () Unit!6614)

(assert (=> b!221390 (= e!143889 lt!112396)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!226 (array!10871 array!10869 (_ BitVec 32) (_ BitVec 32) V!7397 V!7397 (_ BitVec 64) Int) Unit!6614)

(assert (=> b!221390 (= lt!112396 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!226 (_keys!6226 thiss!1504) (_values!4155 thiss!1504) (mask!9982 thiss!1504) (extraKeys!3909 thiss!1504) (zeroValue!4013 thiss!1504) (minValue!4013 thiss!1504) key!932 (defaultEntry!4172 thiss!1504)))))

(assert (=> b!221390 (= c!36813 (is-MissingZero!824 lt!112393))))

(declare-fun e!143886 () Bool)

(assert (=> b!221390 e!143886))

(declare-fun b!221391 () Bool)

(declare-fun res!108606 () Bool)

(assert (=> b!221391 (= res!108606 (= (select (arr!5155 (_keys!6226 thiss!1504)) (index!5469 lt!112393)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!221391 (=> (not res!108606) (not e!143885))))

(declare-fun b!221392 () Bool)

(declare-fun e!143883 () Bool)

(assert (=> b!221392 (= e!143883 e!143893)))

(declare-fun res!108612 () Bool)

(assert (=> b!221392 (=> (not res!108612) (not e!143893))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!221392 (= res!108612 (inRange!0 index!297 (mask!9982 thiss!1504)))))

(declare-fun lt!112394 () Unit!6614)

(assert (=> b!221392 (= lt!112394 e!143889)))

(declare-fun c!36812 () Bool)

(declare-datatypes ((tuple2!4378 0))(
  ( (tuple2!4379 (_1!2200 (_ BitVec 64)) (_2!2200 V!7397)) )
))
(declare-datatypes ((List!3281 0))(
  ( (Nil!3278) (Cons!3277 (h!3925 tuple2!4378) (t!8240 List!3281)) )
))
(declare-datatypes ((ListLongMap!3291 0))(
  ( (ListLongMap!3292 (toList!1661 List!3281)) )
))
(declare-fun contains!1504 (ListLongMap!3291 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1189 (array!10871 array!10869 (_ BitVec 32) (_ BitVec 32) V!7397 V!7397 (_ BitVec 32) Int) ListLongMap!3291)

(assert (=> b!221392 (= c!36812 (contains!1504 (getCurrentListMap!1189 (_keys!6226 thiss!1504) (_values!4155 thiss!1504) (mask!9982 thiss!1504) (extraKeys!3909 thiss!1504) (zeroValue!4013 thiss!1504) (minValue!4013 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4172 thiss!1504)) key!932))))

(declare-fun b!221382 () Bool)

(declare-fun res!108607 () Bool)

(assert (=> b!221382 (=> (not res!108607) (not e!143893))))

(assert (=> b!221382 (= res!108607 (and (= (size!5487 (_values!4155 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9982 thiss!1504))) (= (size!5488 (_keys!6226 thiss!1504)) (size!5487 (_values!4155 thiss!1504))) (bvsge (mask!9982 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3909 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3909 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!108608 () Bool)

(assert (=> start!21884 (=> (not res!108608) (not e!143890))))

(declare-fun valid!1221 (LongMapFixedSize!3026) Bool)

(assert (=> start!21884 (= res!108608 (valid!1221 thiss!1504))))

(assert (=> start!21884 e!143890))

(declare-fun e!143884 () Bool)

(assert (=> start!21884 e!143884))

(assert (=> start!21884 true))

(declare-fun b!221393 () Bool)

(assert (=> b!221393 (= e!143890 e!143883)))

(declare-fun res!108609 () Bool)

(assert (=> b!221393 (=> (not res!108609) (not e!143883))))

(assert (=> b!221393 (= res!108609 (or (= lt!112393 (MissingZero!824 index!297)) (= lt!112393 (MissingVacant!824 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10871 (_ BitVec 32)) SeekEntryResult!824)

(assert (=> b!221393 (= lt!112393 (seekEntryOrOpen!0 key!932 (_keys!6226 thiss!1504) (mask!9982 thiss!1504)))))

(declare-fun b!221394 () Bool)

(assert (=> b!221394 (= e!143888 tp_is_empty!5813)))

(declare-fun b!221395 () Bool)

(declare-fun c!36811 () Bool)

(assert (=> b!221395 (= c!36811 (is-MissingVacant!824 lt!112393))))

(assert (=> b!221395 (= e!143886 e!143882)))

(declare-fun b!221396 () Bool)

(declare-fun res!108602 () Bool)

(assert (=> b!221396 (=> (not res!108602) (not e!143893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!221396 (= res!108602 (validMask!0 (mask!9982 thiss!1504)))))

(declare-fun b!221397 () Bool)

(declare-fun e!143887 () Bool)

(assert (=> b!221397 (= e!143887 (and e!143891 mapRes!9889))))

(declare-fun condMapEmpty!9889 () Bool)

(declare-fun mapDefault!9889 () ValueCell!2563)

