; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22070 () Bool)

(assert start!22070)

(declare-fun b!228660 () Bool)

(declare-fun b_free!6137 () Bool)

(declare-fun b_next!6137 () Bool)

(assert (=> b!228660 (= b_free!6137 (not b_next!6137))))

(declare-fun tp!21553 () Bool)

(declare-fun b_and!13035 () Bool)

(assert (=> b!228660 (= tp!21553 b_and!13035)))

(declare-fun b!228642 () Bool)

(declare-fun res!112546 () Bool)

(declare-fun e!148336 () Bool)

(assert (=> b!228642 (=> res!112546 e!148336)))

(declare-datatypes ((V!7645 0))(
  ( (V!7646 (val!3044 Int)) )
))
(declare-datatypes ((ValueCell!2656 0))(
  ( (ValueCellFull!2656 (v!5064 V!7645)) (EmptyCell!2656) )
))
(declare-datatypes ((array!11241 0))(
  ( (array!11242 (arr!5340 (Array (_ BitVec 32) ValueCell!2656)) (size!5673 (_ BitVec 32))) )
))
(declare-datatypes ((array!11243 0))(
  ( (array!11244 (arr!5341 (Array (_ BitVec 32) (_ BitVec 64))) (size!5674 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3212 0))(
  ( (LongMapFixedSize!3213 (defaultEntry!4265 Int) (mask!10137 (_ BitVec 32)) (extraKeys!4002 (_ BitVec 32)) (zeroValue!4106 V!7645) (minValue!4106 V!7645) (_size!1655 (_ BitVec 32)) (_keys!6319 array!11243) (_values!4248 array!11241) (_vacant!1655 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3212)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11243 (_ BitVec 32)) Bool)

(assert (=> b!228642 (= res!112546 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6319 thiss!1504) (mask!10137 thiss!1504))))))

(declare-fun b!228644 () Bool)

(declare-datatypes ((Unit!6958 0))(
  ( (Unit!6959) )
))
(declare-fun e!148348 () Unit!6958)

(declare-fun Unit!6960 () Unit!6958)

(assert (=> b!228644 (= e!148348 Unit!6960)))

(declare-fun lt!115025 () Unit!6958)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!274 (array!11243 array!11241 (_ BitVec 32) (_ BitVec 32) V!7645 V!7645 (_ BitVec 64) Int) Unit!6958)

(assert (=> b!228644 (= lt!115025 (lemmaInListMapThenSeekEntryOrOpenFindsIt!274 (_keys!6319 thiss!1504) (_values!4248 thiss!1504) (mask!10137 thiss!1504) (extraKeys!4002 thiss!1504) (zeroValue!4106 thiss!1504) (minValue!4106 thiss!1504) key!932 (defaultEntry!4265 thiss!1504)))))

(assert (=> b!228644 false))

(declare-fun b!228645 () Bool)

(declare-fun c!37920 () Bool)

(declare-datatypes ((SeekEntryResult!910 0))(
  ( (MissingZero!910 (index!5810 (_ BitVec 32))) (Found!910 (index!5811 (_ BitVec 32))) (Intermediate!910 (undefined!1722 Bool) (index!5812 (_ BitVec 32)) (x!23338 (_ BitVec 32))) (Undefined!910) (MissingVacant!910 (index!5813 (_ BitVec 32))) )
))
(declare-fun lt!115029 () SeekEntryResult!910)

(assert (=> b!228645 (= c!37920 (is-MissingVacant!910 lt!115029))))

(declare-fun e!148337 () Bool)

(declare-fun e!148346 () Bool)

(assert (=> b!228645 (= e!148337 e!148346)))

(declare-fun bm!21242 () Bool)

(declare-fun call!21246 () Bool)

(declare-fun c!37919 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21242 (= call!21246 (inRange!0 (ite c!37919 (index!5810 lt!115029) (index!5813 lt!115029)) (mask!10137 thiss!1504)))))

(declare-fun mapIsEmpty!10168 () Bool)

(declare-fun mapRes!10168 () Bool)

(assert (=> mapIsEmpty!10168 mapRes!10168))

(declare-fun b!228646 () Bool)

(declare-fun e!148335 () Bool)

(declare-fun e!148349 () Bool)

(assert (=> b!228646 (= e!148335 (and e!148349 mapRes!10168))))

(declare-fun condMapEmpty!10168 () Bool)

(declare-fun mapDefault!10168 () ValueCell!2656)

