; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23790 () Bool)

(assert start!23790)

(declare-fun b!249683 () Bool)

(declare-fun b_free!6619 () Bool)

(declare-fun b_next!6619 () Bool)

(assert (=> b!249683 (= b_free!6619 (not b_next!6619))))

(declare-fun tp!23118 () Bool)

(declare-fun b_and!13633 () Bool)

(assert (=> b!249683 (= tp!23118 b_and!13633)))

(declare-fun mapNonEmpty!11010 () Bool)

(declare-fun mapRes!11010 () Bool)

(declare-fun tp!23117 () Bool)

(declare-fun e!161932 () Bool)

(assert (=> mapNonEmpty!11010 (= mapRes!11010 (and tp!23117 e!161932))))

(declare-datatypes ((V!8289 0))(
  ( (V!8290 (val!3285 Int)) )
))
(declare-datatypes ((ValueCell!2897 0))(
  ( (ValueCellFull!2897 (v!5348 V!8289)) (EmptyCell!2897) )
))
(declare-datatypes ((array!12277 0))(
  ( (array!12278 (arr!5822 (Array (_ BitVec 32) ValueCell!2897)) (size!6166 (_ BitVec 32))) )
))
(declare-datatypes ((array!12279 0))(
  ( (array!12280 (arr!5823 (Array (_ BitVec 32) (_ BitVec 64))) (size!6167 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3694 0))(
  ( (LongMapFixedSize!3695 (defaultEntry!4616 Int) (mask!10788 (_ BitVec 32)) (extraKeys!4353 (_ BitVec 32)) (zeroValue!4457 V!8289) (minValue!4457 V!8289) (_size!1896 (_ BitVec 32)) (_keys!6748 array!12279) (_values!4599 array!12277) (_vacant!1896 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3694)

(declare-fun mapValue!11010 () ValueCell!2897)

(declare-fun mapRest!11010 () (Array (_ BitVec 32) ValueCell!2897))

(declare-fun mapKey!11010 () (_ BitVec 32))

(assert (=> mapNonEmpty!11010 (= (arr!5822 (_values!4599 thiss!1504)) (store mapRest!11010 mapKey!11010 mapValue!11010))))

(declare-fun call!23445 () Bool)

(declare-fun bm!23442 () Bool)

(declare-fun c!41907 () Bool)

(declare-datatypes ((SeekEntryResult!1118 0))(
  ( (MissingZero!1118 (index!6642 (_ BitVec 32))) (Found!1118 (index!6643 (_ BitVec 32))) (Intermediate!1118 (undefined!1930 Bool) (index!6644 (_ BitVec 32)) (x!24642 (_ BitVec 32))) (Undefined!1118) (MissingVacant!1118 (index!6645 (_ BitVec 32))) )
))
(declare-fun lt!125067 () SeekEntryResult!1118)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23442 (= call!23445 (inRange!0 (ite c!41907 (index!6642 lt!125067) (index!6645 lt!125067)) (mask!10788 thiss!1504)))))

(declare-fun b!249677 () Bool)

(declare-datatypes ((Unit!7730 0))(
  ( (Unit!7731) )
))
(declare-fun e!161937 () Unit!7730)

(declare-fun Unit!7732 () Unit!7730)

(assert (=> b!249677 (= e!161937 Unit!7732)))

(declare-fun lt!125073 () Unit!7730)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!395 (array!12279 array!12277 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 64) Int) Unit!7730)

(assert (=> b!249677 (= lt!125073 (lemmaInListMapThenSeekEntryOrOpenFindsIt!395 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)))))

(assert (=> b!249677 false))

(declare-fun b!249678 () Bool)

(declare-fun e!161940 () Bool)

(declare-fun call!23446 () Bool)

(assert (=> b!249678 (= e!161940 (not call!23446))))

(declare-fun b!249679 () Bool)

(declare-fun e!161941 () Bool)

(assert (=> b!249679 (= e!161941 (not call!23446))))

(declare-fun b!249680 () Bool)

(declare-fun e!161944 () Bool)

(declare-fun e!161938 () Bool)

(assert (=> b!249680 (= e!161944 (not e!161938))))

(declare-fun res!122317 () Bool)

(assert (=> b!249680 (=> res!122317 e!161938)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!249680 (= res!122317 (not (validMask!0 (mask!10788 thiss!1504))))))

(declare-fun lt!125075 () array!12279)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12279 (_ BitVec 32)) Bool)

(assert (=> b!249680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125075 (mask!10788 thiss!1504))))

(declare-fun lt!125071 () Unit!7730)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12279 (_ BitVec 32) (_ BitVec 32)) Unit!7730)

(assert (=> b!249680 (= lt!125071 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6748 thiss!1504) index!297 (mask!10788 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12279 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!249680 (= (arrayCountValidKeys!0 lt!125075 #b00000000000000000000000000000000 (size!6167 (_keys!6748 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6748 thiss!1504) #b00000000000000000000000000000000 (size!6167 (_keys!6748 thiss!1504)))))))

(declare-fun lt!125069 () Unit!7730)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12279 (_ BitVec 32) (_ BitVec 64)) Unit!7730)

(assert (=> b!249680 (= lt!125069 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6748 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3717 0))(
  ( (Nil!3714) (Cons!3713 (h!4372 (_ BitVec 64)) (t!8748 List!3717)) )
))
(declare-fun arrayNoDuplicates!0 (array!12279 (_ BitVec 32) List!3717) Bool)

(assert (=> b!249680 (arrayNoDuplicates!0 lt!125075 #b00000000000000000000000000000000 Nil!3714)))

(assert (=> b!249680 (= lt!125075 (array!12280 (store (arr!5823 (_keys!6748 thiss!1504)) index!297 key!932) (size!6167 (_keys!6748 thiss!1504))))))

(declare-fun lt!125070 () Unit!7730)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12279 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3717) Unit!7730)

(assert (=> b!249680 (= lt!125070 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6748 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3714))))

(declare-fun lt!125074 () Unit!7730)

(declare-fun e!161939 () Unit!7730)

(assert (=> b!249680 (= lt!125074 e!161939)))

(declare-fun c!41906 () Bool)

(declare-fun arrayContainsKey!0 (array!12279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!249680 (= c!41906 (arrayContainsKey!0 (_keys!6748 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249681 () Bool)

(declare-fun res!122320 () Bool)

(assert (=> b!249681 (= res!122320 (= (select (arr!5823 (_keys!6748 thiss!1504)) (index!6645 lt!125067)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249681 (=> (not res!122320) (not e!161940))))

(declare-fun b!249682 () Bool)

(declare-fun Unit!7733 () Unit!7730)

(assert (=> b!249682 (= e!161939 Unit!7733)))

(declare-fun e!161933 () Bool)

(declare-fun e!161935 () Bool)

(declare-fun tp_is_empty!6481 () Bool)

(declare-fun array_inv!3843 (array!12279) Bool)

(declare-fun array_inv!3844 (array!12277) Bool)

(assert (=> b!249683 (= e!161935 (and tp!23118 tp_is_empty!6481 (array_inv!3843 (_keys!6748 thiss!1504)) (array_inv!3844 (_values!4599 thiss!1504)) e!161933))))

(declare-fun b!249684 () Bool)

(declare-fun e!161943 () Bool)

(assert (=> b!249684 (= e!161943 tp_is_empty!6481)))

(declare-fun b!249685 () Bool)

(declare-fun res!122316 () Bool)

(assert (=> b!249685 (=> (not res!122316) (not e!161941))))

(assert (=> b!249685 (= res!122316 (= (select (arr!5823 (_keys!6748 thiss!1504)) (index!6642 lt!125067)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249686 () Bool)

(assert (=> b!249686 (= e!161938 (or (not (= (size!6166 (_values!4599 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10788 thiss!1504)))) (= (size!6167 (_keys!6748 thiss!1504)) (size!6166 (_values!4599 thiss!1504)))))))

(declare-fun b!249687 () Bool)

(assert (=> b!249687 (= e!161932 tp_is_empty!6481)))

(declare-fun b!249688 () Bool)

(declare-fun e!161945 () Bool)

(assert (=> b!249688 (= e!161945 e!161944)))

(declare-fun res!122319 () Bool)

(assert (=> b!249688 (=> (not res!122319) (not e!161944))))

(assert (=> b!249688 (= res!122319 (inRange!0 index!297 (mask!10788 thiss!1504)))))

(declare-fun lt!125068 () Unit!7730)

(assert (=> b!249688 (= lt!125068 e!161937)))

(declare-fun c!41904 () Bool)

(declare-datatypes ((tuple2!4836 0))(
  ( (tuple2!4837 (_1!2429 (_ BitVec 64)) (_2!2429 V!8289)) )
))
(declare-datatypes ((List!3718 0))(
  ( (Nil!3715) (Cons!3714 (h!4373 tuple2!4836) (t!8749 List!3718)) )
))
(declare-datatypes ((ListLongMap!3749 0))(
  ( (ListLongMap!3750 (toList!1890 List!3718)) )
))
(declare-fun contains!1809 (ListLongMap!3749 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1418 (array!12279 array!12277 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 32) Int) ListLongMap!3749)

(assert (=> b!249688 (= c!41904 (contains!1809 (getCurrentListMap!1418 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) key!932))))

(declare-fun b!249689 () Bool)

(assert (=> b!249689 (= e!161933 (and e!161943 mapRes!11010))))

(declare-fun condMapEmpty!11010 () Bool)

(declare-fun mapDefault!11010 () ValueCell!2897)

