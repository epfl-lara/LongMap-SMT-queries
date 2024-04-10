; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21832 () Bool)

(assert start!21832)

(declare-fun b!219684 () Bool)

(declare-fun b_free!5899 () Bool)

(declare-fun b_next!5899 () Bool)

(assert (=> b!219684 (= b_free!5899 (not b_next!5899))))

(declare-fun tp!20839 () Bool)

(declare-fun b_and!12797 () Bool)

(assert (=> b!219684 (= tp!20839 b_and!12797)))

(declare-fun b!219664 () Bool)

(declare-fun res!107676 () Bool)

(declare-fun e!142877 () Bool)

(assert (=> b!219664 (=> (not res!107676) (not e!142877))))

(declare-datatypes ((V!7329 0))(
  ( (V!7330 (val!2925 Int)) )
))
(declare-datatypes ((ValueCell!2537 0))(
  ( (ValueCellFull!2537 (v!4945 V!7329)) (EmptyCell!2537) )
))
(declare-datatypes ((array!10765 0))(
  ( (array!10766 (arr!5102 (Array (_ BitVec 32) ValueCell!2537)) (size!5435 (_ BitVec 32))) )
))
(declare-datatypes ((array!10767 0))(
  ( (array!10768 (arr!5103 (Array (_ BitVec 32) (_ BitVec 64))) (size!5436 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2974 0))(
  ( (LongMapFixedSize!2975 (defaultEntry!4146 Int) (mask!9940 (_ BitVec 32)) (extraKeys!3883 (_ BitVec 32)) (zeroValue!3987 V!7329) (minValue!3987 V!7329) (_size!1536 (_ BitVec 32)) (_keys!6200 array!10767) (_values!4129 array!10765) (_vacant!1536 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2974)

(declare-datatypes ((SeekEntryResult!800 0))(
  ( (MissingZero!800 (index!5370 (_ BitVec 32))) (Found!800 (index!5371 (_ BitVec 32))) (Intermediate!800 (undefined!1612 Bool) (index!5372 (_ BitVec 32)) (x!22916 (_ BitVec 32))) (Undefined!800) (MissingVacant!800 (index!5373 (_ BitVec 32))) )
))
(declare-fun lt!112006 () SeekEntryResult!800)

(assert (=> b!219664 (= res!107676 (= (select (arr!5103 (_keys!6200 thiss!1504)) (index!5370 lt!112006)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219666 () Bool)

(declare-fun e!142874 () Bool)

(assert (=> b!219666 (= e!142874 false)))

(declare-fun lt!112004 () Bool)

(declare-datatypes ((List!3244 0))(
  ( (Nil!3241) (Cons!3240 (h!3888 (_ BitVec 64)) (t!8203 List!3244)) )
))
(declare-fun arrayNoDuplicates!0 (array!10767 (_ BitVec 32) List!3244) Bool)

(assert (=> b!219666 (= lt!112004 (arrayNoDuplicates!0 (_keys!6200 thiss!1504) #b00000000000000000000000000000000 Nil!3241))))

(declare-fun b!219667 () Bool)

(declare-fun c!36579 () Bool)

(assert (=> b!219667 (= c!36579 (is-MissingVacant!800 lt!112006))))

(declare-fun e!142869 () Bool)

(declare-fun e!142876 () Bool)

(assert (=> b!219667 (= e!142869 e!142876)))

(declare-fun b!219668 () Bool)

(declare-fun e!142878 () Bool)

(assert (=> b!219668 (= e!142878 e!142874)))

(declare-fun res!107669 () Bool)

(assert (=> b!219668 (=> (not res!107669) (not e!142874))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!219668 (= res!107669 (inRange!0 index!297 (mask!9940 thiss!1504)))))

(declare-datatypes ((Unit!6549 0))(
  ( (Unit!6550) )
))
(declare-fun lt!112007 () Unit!6549)

(declare-fun e!142872 () Unit!6549)

(assert (=> b!219668 (= lt!112007 e!142872)))

(declare-fun c!36578 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4342 0))(
  ( (tuple2!4343 (_1!2182 (_ BitVec 64)) (_2!2182 V!7329)) )
))
(declare-datatypes ((List!3245 0))(
  ( (Nil!3242) (Cons!3241 (h!3889 tuple2!4342) (t!8204 List!3245)) )
))
(declare-datatypes ((ListLongMap!3255 0))(
  ( (ListLongMap!3256 (toList!1643 List!3245)) )
))
(declare-fun contains!1486 (ListLongMap!3255 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1171 (array!10767 array!10765 (_ BitVec 32) (_ BitVec 32) V!7329 V!7329 (_ BitVec 32) Int) ListLongMap!3255)

(assert (=> b!219668 (= c!36578 (contains!1486 (getCurrentListMap!1171 (_keys!6200 thiss!1504) (_values!4129 thiss!1504) (mask!9940 thiss!1504) (extraKeys!3883 thiss!1504) (zeroValue!3987 thiss!1504) (minValue!3987 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4146 thiss!1504)) key!932))))

(declare-fun b!219669 () Bool)

(declare-fun e!142873 () Bool)

(declare-fun call!20531 () Bool)

(assert (=> b!219669 (= e!142873 (not call!20531))))

(declare-fun b!219670 () Bool)

(declare-fun res!107675 () Bool)

(assert (=> b!219670 (=> (not res!107675) (not e!142877))))

(declare-fun call!20532 () Bool)

(assert (=> b!219670 (= res!107675 call!20532)))

(assert (=> b!219670 (= e!142869 e!142877)))

(declare-fun b!219671 () Bool)

(declare-fun e!142879 () Bool)

(declare-fun tp_is_empty!5761 () Bool)

(assert (=> b!219671 (= e!142879 tp_is_empty!5761)))

(declare-fun bm!20528 () Bool)

(declare-fun arrayContainsKey!0 (array!10767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20528 (= call!20531 (arrayContainsKey!0 (_keys!6200 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219672 () Bool)

(declare-fun res!107677 () Bool)

(assert (=> b!219672 (=> (not res!107677) (not e!142874))))

(assert (=> b!219672 (= res!107677 (and (= (size!5435 (_values!4129 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9940 thiss!1504))) (= (size!5436 (_keys!6200 thiss!1504)) (size!5435 (_values!4129 thiss!1504))) (bvsge (mask!9940 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3883 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3883 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!219673 () Bool)

(assert (=> b!219673 (= e!142876 e!142873)))

(declare-fun res!107666 () Bool)

(assert (=> b!219673 (= res!107666 call!20532)))

(assert (=> b!219673 (=> (not res!107666) (not e!142873))))

(declare-fun b!219674 () Bool)

(assert (=> b!219674 (= e!142877 (not call!20531))))

(declare-fun b!219675 () Bool)

(declare-fun res!107670 () Bool)

(declare-fun e!142875 () Bool)

(assert (=> b!219675 (=> (not res!107670) (not e!142875))))

(assert (=> b!219675 (= res!107670 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!9811 () Bool)

(declare-fun mapRes!9811 () Bool)

(declare-fun tp!20838 () Bool)

(assert (=> mapNonEmpty!9811 (= mapRes!9811 (and tp!20838 e!142879))))

(declare-fun mapValue!9811 () ValueCell!2537)

(declare-fun mapKey!9811 () (_ BitVec 32))

(declare-fun mapRest!9811 () (Array (_ BitVec 32) ValueCell!2537))

(assert (=> mapNonEmpty!9811 (= (arr!5102 (_values!4129 thiss!1504)) (store mapRest!9811 mapKey!9811 mapValue!9811))))

(declare-fun b!219676 () Bool)

(declare-fun Unit!6551 () Unit!6549)

(assert (=> b!219676 (= e!142872 Unit!6551)))

(declare-fun lt!112003 () Unit!6549)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!196 (array!10767 array!10765 (_ BitVec 32) (_ BitVec 32) V!7329 V!7329 (_ BitVec 64) Int) Unit!6549)

(assert (=> b!219676 (= lt!112003 (lemmaInListMapThenSeekEntryOrOpenFindsIt!196 (_keys!6200 thiss!1504) (_values!4129 thiss!1504) (mask!9940 thiss!1504) (extraKeys!3883 thiss!1504) (zeroValue!3987 thiss!1504) (minValue!3987 thiss!1504) key!932 (defaultEntry!4146 thiss!1504)))))

(assert (=> b!219676 false))

(declare-fun res!107668 () Bool)

(assert (=> start!21832 (=> (not res!107668) (not e!142875))))

(declare-fun valid!1203 (LongMapFixedSize!2974) Bool)

(assert (=> start!21832 (= res!107668 (valid!1203 thiss!1504))))

(assert (=> start!21832 e!142875))

(declare-fun e!142870 () Bool)

(assert (=> start!21832 e!142870))

(assert (=> start!21832 true))

(declare-fun b!219665 () Bool)

(declare-fun res!107672 () Bool)

(assert (=> b!219665 (=> (not res!107672) (not e!142874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!219665 (= res!107672 (validMask!0 (mask!9940 thiss!1504)))))

(declare-fun b!219677 () Bool)

(assert (=> b!219677 (= e!142876 (is-Undefined!800 lt!112006))))

(declare-fun b!219678 () Bool)

(declare-fun res!107673 () Bool)

(assert (=> b!219678 (=> (not res!107673) (not e!142874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10767 (_ BitVec 32)) Bool)

(assert (=> b!219678 (= res!107673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6200 thiss!1504) (mask!9940 thiss!1504)))))

(declare-fun b!219679 () Bool)

(declare-fun lt!112005 () Unit!6549)

(assert (=> b!219679 (= e!142872 lt!112005)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!208 (array!10767 array!10765 (_ BitVec 32) (_ BitVec 32) V!7329 V!7329 (_ BitVec 64) Int) Unit!6549)

(assert (=> b!219679 (= lt!112005 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!208 (_keys!6200 thiss!1504) (_values!4129 thiss!1504) (mask!9940 thiss!1504) (extraKeys!3883 thiss!1504) (zeroValue!3987 thiss!1504) (minValue!3987 thiss!1504) key!932 (defaultEntry!4146 thiss!1504)))))

(declare-fun c!36577 () Bool)

(assert (=> b!219679 (= c!36577 (is-MissingZero!800 lt!112006))))

(assert (=> b!219679 e!142869))

(declare-fun mapIsEmpty!9811 () Bool)

(assert (=> mapIsEmpty!9811 mapRes!9811))

(declare-fun b!219680 () Bool)

(assert (=> b!219680 (= e!142875 e!142878)))

(declare-fun res!107671 () Bool)

(assert (=> b!219680 (=> (not res!107671) (not e!142878))))

(assert (=> b!219680 (= res!107671 (or (= lt!112006 (MissingZero!800 index!297)) (= lt!112006 (MissingVacant!800 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10767 (_ BitVec 32)) SeekEntryResult!800)

(assert (=> b!219680 (= lt!112006 (seekEntryOrOpen!0 key!932 (_keys!6200 thiss!1504) (mask!9940 thiss!1504)))))

(declare-fun b!219681 () Bool)

(declare-fun e!142868 () Bool)

(declare-fun e!142880 () Bool)

(assert (=> b!219681 (= e!142868 (and e!142880 mapRes!9811))))

(declare-fun condMapEmpty!9811 () Bool)

(declare-fun mapDefault!9811 () ValueCell!2537)

