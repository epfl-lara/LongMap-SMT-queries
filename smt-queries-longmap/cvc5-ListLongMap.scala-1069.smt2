; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22096 () Bool)

(assert start!22096)

(declare-fun b!229553 () Bool)

(declare-fun b_free!6163 () Bool)

(declare-fun b_next!6163 () Bool)

(assert (=> b!229553 (= b_free!6163 (not b_next!6163))))

(declare-fun tp!21631 () Bool)

(declare-fun b_and!13061 () Bool)

(assert (=> b!229553 (= tp!21631 b_and!13061)))

(declare-fun b!229539 () Bool)

(declare-fun e!148930 () Bool)

(declare-fun tp_is_empty!6025 () Bool)

(assert (=> b!229539 (= e!148930 tp_is_empty!6025)))

(declare-fun bm!21320 () Bool)

(declare-fun call!21323 () Bool)

(declare-datatypes ((V!7681 0))(
  ( (V!7682 (val!3057 Int)) )
))
(declare-datatypes ((ValueCell!2669 0))(
  ( (ValueCellFull!2669 (v!5077 V!7681)) (EmptyCell!2669) )
))
(declare-datatypes ((array!11293 0))(
  ( (array!11294 (arr!5366 (Array (_ BitVec 32) ValueCell!2669)) (size!5699 (_ BitVec 32))) )
))
(declare-datatypes ((array!11295 0))(
  ( (array!11296 (arr!5367 (Array (_ BitVec 32) (_ BitVec 64))) (size!5700 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3238 0))(
  ( (LongMapFixedSize!3239 (defaultEntry!4278 Int) (mask!10160 (_ BitVec 32)) (extraKeys!4015 (_ BitVec 32)) (zeroValue!4119 V!7681) (minValue!4119 V!7681) (_size!1668 (_ BitVec 32)) (_keys!6332 array!11295) (_values!4261 array!11293) (_vacant!1668 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3238)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21320 (= call!21323 (arrayContainsKey!0 (_keys!6332 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229541 () Bool)

(declare-fun res!112969 () Bool)

(declare-fun e!148924 () Bool)

(assert (=> b!229541 (=> (not res!112969) (not e!148924))))

(declare-fun call!21324 () Bool)

(assert (=> b!229541 (= res!112969 call!21324)))

(declare-fun e!148931 () Bool)

(assert (=> b!229541 (= e!148931 e!148924)))

(declare-fun b!229542 () Bool)

(declare-fun res!112973 () Bool)

(declare-fun e!148921 () Bool)

(assert (=> b!229542 (=> res!112973 e!148921)))

(assert (=> b!229542 (= res!112973 (or (not (= (size!5699 (_values!4261 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10160 thiss!1504)))) (not (= (size!5700 (_keys!6332 thiss!1504)) (size!5699 (_values!4261 thiss!1504)))) (bvslt (mask!10160 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4015 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4015 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!229543 () Bool)

(declare-fun res!112970 () Bool)

(declare-fun e!148929 () Bool)

(assert (=> b!229543 (=> (not res!112970) (not e!148929))))

(assert (=> b!229543 (= res!112970 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10207 () Bool)

(declare-fun mapRes!10207 () Bool)

(declare-fun tp!21630 () Bool)

(declare-fun e!148922 () Bool)

(assert (=> mapNonEmpty!10207 (= mapRes!10207 (and tp!21630 e!148922))))

(declare-fun mapValue!10207 () ValueCell!2669)

(declare-fun mapRest!10207 () (Array (_ BitVec 32) ValueCell!2669))

(declare-fun mapKey!10207 () (_ BitVec 32))

(assert (=> mapNonEmpty!10207 (= (arr!5366 (_values!4261 thiss!1504)) (store mapRest!10207 mapKey!10207 mapValue!10207))))

(declare-fun b!229544 () Bool)

(declare-fun e!148933 () Bool)

(declare-datatypes ((SeekEntryResult!923 0))(
  ( (MissingZero!923 (index!5862 (_ BitVec 32))) (Found!923 (index!5863 (_ BitVec 32))) (Intermediate!923 (undefined!1735 Bool) (index!5864 (_ BitVec 32)) (x!23391 (_ BitVec 32))) (Undefined!923) (MissingVacant!923 (index!5865 (_ BitVec 32))) )
))
(declare-fun lt!115460 () SeekEntryResult!923)

(assert (=> b!229544 (= e!148933 (is-Undefined!923 lt!115460))))

(declare-fun res!112965 () Bool)

(assert (=> start!22096 (=> (not res!112965) (not e!148929))))

(declare-fun valid!1291 (LongMapFixedSize!3238) Bool)

(assert (=> start!22096 (= res!112965 (valid!1291 thiss!1504))))

(assert (=> start!22096 e!148929))

(declare-fun e!148925 () Bool)

(assert (=> start!22096 e!148925))

(assert (=> start!22096 true))

(declare-fun b!229540 () Bool)

(declare-fun res!112975 () Bool)

(assert (=> b!229540 (=> (not res!112975) (not e!148924))))

(assert (=> b!229540 (= res!112975 (= (select (arr!5367 (_keys!6332 thiss!1504)) (index!5862 lt!115460)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!229545 () Bool)

(assert (=> b!229545 (= e!148921 true)))

(declare-fun lt!115458 () Bool)

(declare-datatypes ((List!3434 0))(
  ( (Nil!3431) (Cons!3430 (h!4078 (_ BitVec 64)) (t!8393 List!3434)) )
))
(declare-fun arrayNoDuplicates!0 (array!11295 (_ BitVec 32) List!3434) Bool)

(assert (=> b!229545 (= lt!115458 (arrayNoDuplicates!0 (_keys!6332 thiss!1504) #b00000000000000000000000000000000 Nil!3431))))

(declare-fun mapIsEmpty!10207 () Bool)

(assert (=> mapIsEmpty!10207 mapRes!10207))

(declare-fun b!229546 () Bool)

(declare-fun e!148920 () Bool)

(assert (=> b!229546 (= e!148920 (and e!148930 mapRes!10207))))

(declare-fun condMapEmpty!10207 () Bool)

(declare-fun mapDefault!10207 () ValueCell!2669)

