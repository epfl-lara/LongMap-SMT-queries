; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23216 () Bool)

(assert start!23216)

(declare-fun b!243703 () Bool)

(declare-fun b_free!6527 () Bool)

(declare-fun b_next!6527 () Bool)

(assert (=> b!243703 (= b_free!6527 (not b_next!6527))))

(declare-fun tp!22803 () Bool)

(declare-fun b_and!13509 () Bool)

(assert (=> b!243703 (= tp!22803 b_and!13509)))

(declare-fun b!243679 () Bool)

(declare-fun res!119459 () Bool)

(declare-fun e!158153 () Bool)

(assert (=> b!243679 (=> (not res!119459) (not e!158153))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!243679 (= res!119459 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!243680 () Bool)

(declare-fun res!119465 () Bool)

(declare-fun e!158149 () Bool)

(assert (=> b!243680 (=> (not res!119465) (not e!158149))))

(declare-fun call!22724 () Bool)

(assert (=> b!243680 (= res!119465 call!22724)))

(declare-fun e!158143 () Bool)

(assert (=> b!243680 (= e!158143 e!158149)))

(declare-fun b!243681 () Bool)

(declare-fun c!40676 () Bool)

(declare-datatypes ((SeekEntryResult!1074 0))(
  ( (MissingZero!1074 (index!6466 (_ BitVec 32))) (Found!1074 (index!6467 (_ BitVec 32))) (Intermediate!1074 (undefined!1886 Bool) (index!6468 (_ BitVec 32)) (x!24334 (_ BitVec 32))) (Undefined!1074) (MissingVacant!1074 (index!6469 (_ BitVec 32))) )
))
(declare-fun lt!122259 () SeekEntryResult!1074)

(assert (=> b!243681 (= c!40676 (is-MissingVacant!1074 lt!122259))))

(declare-fun e!158147 () Bool)

(assert (=> b!243681 (= e!158143 e!158147)))

(declare-fun b!243682 () Bool)

(assert (=> b!243682 (= e!158147 (is-Undefined!1074 lt!122259))))

(declare-fun bm!22721 () Bool)

(declare-fun call!22725 () Bool)

(declare-datatypes ((V!8165 0))(
  ( (V!8166 (val!3239 Int)) )
))
(declare-datatypes ((ValueCell!2851 0))(
  ( (ValueCellFull!2851 (v!5286 V!8165)) (EmptyCell!2851) )
))
(declare-datatypes ((array!12069 0))(
  ( (array!12070 (arr!5730 (Array (_ BitVec 32) ValueCell!2851)) (size!6072 (_ BitVec 32))) )
))
(declare-datatypes ((array!12071 0))(
  ( (array!12072 (arr!5731 (Array (_ BitVec 32) (_ BitVec 64))) (size!6073 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3602 0))(
  ( (LongMapFixedSize!3603 (defaultEntry!4514 Int) (mask!10607 (_ BitVec 32)) (extraKeys!4251 (_ BitVec 32)) (zeroValue!4355 V!8165) (minValue!4355 V!8165) (_size!1850 (_ BitVec 32)) (_keys!6625 array!12071) (_values!4497 array!12069) (_vacant!1850 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3602)

(declare-fun arrayContainsKey!0 (array!12071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22721 (= call!22725 (arrayContainsKey!0 (_keys!6625 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243683 () Bool)

(declare-fun res!119463 () Bool)

(declare-fun e!158137 () Bool)

(assert (=> b!243683 (=> (not res!119463) (not e!158137))))

(declare-datatypes ((List!3649 0))(
  ( (Nil!3646) (Cons!3645 (h!4302 (_ BitVec 64)) (t!8656 List!3649)) )
))
(declare-fun noDuplicate!98 (List!3649) Bool)

(assert (=> b!243683 (= res!119463 (noDuplicate!98 Nil!3646))))

(declare-fun b!243684 () Bool)

(declare-datatypes ((Unit!7518 0))(
  ( (Unit!7519) )
))
(declare-fun e!158142 () Unit!7518)

(declare-fun Unit!7520 () Unit!7518)

(assert (=> b!243684 (= e!158142 Unit!7520)))

(declare-fun lt!122262 () Unit!7518)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!361 (array!12071 array!12069 (_ BitVec 32) (_ BitVec 32) V!8165 V!8165 (_ BitVec 64) Int) Unit!7518)

(assert (=> b!243684 (= lt!122262 (lemmaInListMapThenSeekEntryOrOpenFindsIt!361 (_keys!6625 thiss!1504) (_values!4497 thiss!1504) (mask!10607 thiss!1504) (extraKeys!4251 thiss!1504) (zeroValue!4355 thiss!1504) (minValue!4355 thiss!1504) key!932 (defaultEntry!4514 thiss!1504)))))

(assert (=> b!243684 false))

(declare-fun mapNonEmpty!10834 () Bool)

(declare-fun mapRes!10834 () Bool)

(declare-fun tp!22804 () Bool)

(declare-fun e!158141 () Bool)

(assert (=> mapNonEmpty!10834 (= mapRes!10834 (and tp!22804 e!158141))))

(declare-fun mapValue!10834 () ValueCell!2851)

(declare-fun mapRest!10834 () (Array (_ BitVec 32) ValueCell!2851))

(declare-fun mapKey!10834 () (_ BitVec 32))

(assert (=> mapNonEmpty!10834 (= (arr!5730 (_values!4497 thiss!1504)) (store mapRest!10834 mapKey!10834 mapValue!10834))))

(declare-fun b!243685 () Bool)

(declare-fun e!158152 () Bool)

(declare-fun e!158144 () Bool)

(assert (=> b!243685 (= e!158152 (and e!158144 mapRes!10834))))

(declare-fun condMapEmpty!10834 () Bool)

(declare-fun mapDefault!10834 () ValueCell!2851)

