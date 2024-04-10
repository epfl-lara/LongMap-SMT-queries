; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21920 () Bool)

(assert start!21920)

(declare-fun b!222844 () Bool)

(declare-fun b_free!5987 () Bool)

(declare-fun b_next!5987 () Bool)

(assert (=> b!222844 (= b_free!5987 (not b_next!5987))))

(declare-fun tp!21102 () Bool)

(declare-fun b_and!12885 () Bool)

(assert (=> b!222844 (= tp!21102 b_and!12885)))

(declare-fun b!222832 () Bool)

(declare-fun res!109439 () Bool)

(declare-datatypes ((V!7445 0))(
  ( (V!7446 (val!2969 Int)) )
))
(declare-datatypes ((ValueCell!2581 0))(
  ( (ValueCellFull!2581 (v!4989 V!7445)) (EmptyCell!2581) )
))
(declare-datatypes ((array!10941 0))(
  ( (array!10942 (arr!5190 (Array (_ BitVec 32) ValueCell!2581)) (size!5523 (_ BitVec 32))) )
))
(declare-datatypes ((array!10943 0))(
  ( (array!10944 (arr!5191 (Array (_ BitVec 32) (_ BitVec 64))) (size!5524 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3062 0))(
  ( (LongMapFixedSize!3063 (defaultEntry!4190 Int) (mask!10012 (_ BitVec 32)) (extraKeys!3927 (_ BitVec 32)) (zeroValue!4031 V!7445) (minValue!4031 V!7445) (_size!1580 (_ BitVec 32)) (_keys!6244 array!10943) (_values!4173 array!10941) (_vacant!1580 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3062)

(declare-datatypes ((SeekEntryResult!842 0))(
  ( (MissingZero!842 (index!5538 (_ BitVec 32))) (Found!842 (index!5539 (_ BitVec 32))) (Intermediate!842 (undefined!1654 Bool) (index!5540 (_ BitVec 32)) (x!23070 (_ BitVec 32))) (Undefined!842) (MissingVacant!842 (index!5541 (_ BitVec 32))) )
))
(declare-fun lt!112752 () SeekEntryResult!842)

(assert (=> b!222832 (= res!109439 (= (select (arr!5191 (_keys!6244 thiss!1504)) (index!5541 lt!112752)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!144810 () Bool)

(assert (=> b!222832 (=> (not res!109439) (not e!144810))))

(declare-fun b!222833 () Bool)

(declare-datatypes ((Unit!6687 0))(
  ( (Unit!6688) )
))
(declare-fun e!144807 () Unit!6687)

(declare-fun Unit!6689 () Unit!6687)

(assert (=> b!222833 (= e!144807 Unit!6689)))

(declare-fun lt!112753 () Unit!6687)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!65 (array!10943 array!10941 (_ BitVec 32) (_ BitVec 32) V!7445 V!7445 (_ BitVec 64) (_ BitVec 32) Int) Unit!6687)

(assert (=> b!222833 (= lt!112753 (lemmaArrayContainsKeyThenInListMap!65 (_keys!6244 thiss!1504) (_values!4173 thiss!1504) (mask!10012 thiss!1504) (extraKeys!3927 thiss!1504) (zeroValue!4031 thiss!1504) (minValue!4031 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4190 thiss!1504)))))

(assert (=> b!222833 false))

(declare-fun b!222834 () Bool)

(declare-fun res!109441 () Bool)

(declare-fun e!144811 () Bool)

(assert (=> b!222834 (=> (not res!109441) (not e!144811))))

(declare-datatypes ((List!3311 0))(
  ( (Nil!3308) (Cons!3307 (h!3955 (_ BitVec 64)) (t!8270 List!3311)) )
))
(declare-fun noDuplicate!73 (List!3311) Bool)

(assert (=> b!222834 (= res!109441 (noDuplicate!73 Nil!3308))))

(declare-fun b!222835 () Bool)

(declare-fun e!144816 () Bool)

(assert (=> b!222835 (= e!144816 e!144811)))

(declare-fun res!109436 () Bool)

(assert (=> b!222835 (=> (not res!109436) (not e!144811))))

(assert (=> b!222835 (= res!109436 (and (bvslt (size!5524 (_keys!6244 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5524 (_keys!6244 thiss!1504)))))))

(declare-fun lt!112751 () Unit!6687)

(assert (=> b!222835 (= lt!112751 e!144807)))

(declare-fun c!37018 () Bool)

(declare-fun arrayContainsKey!0 (array!10943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222835 (= c!37018 (arrayContainsKey!0 (_keys!6244 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222836 () Bool)

(declare-fun res!109437 () Bool)

(assert (=> b!222836 (=> (not res!109437) (not e!144811))))

(declare-fun contains!1531 (List!3311 (_ BitVec 64)) Bool)

(assert (=> b!222836 (= res!109437 (not (contains!1531 Nil!3308 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222837 () Bool)

(declare-fun e!144818 () Bool)

(declare-fun e!144820 () Bool)

(declare-fun mapRes!9943 () Bool)

(assert (=> b!222837 (= e!144818 (and e!144820 mapRes!9943))))

(declare-fun condMapEmpty!9943 () Bool)

(declare-fun mapDefault!9943 () ValueCell!2581)

