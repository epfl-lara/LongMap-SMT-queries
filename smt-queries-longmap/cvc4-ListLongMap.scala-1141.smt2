; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23580 () Bool)

(assert start!23580)

(declare-fun b!247965 () Bool)

(declare-fun b_free!6599 () Bool)

(declare-fun b_next!6599 () Bool)

(assert (=> b!247965 (= b_free!6599 (not b_next!6599))))

(declare-fun tp!23045 () Bool)

(declare-fun b_and!13601 () Bool)

(assert (=> b!247965 (= tp!23045 b_and!13601)))

(declare-fun b!247952 () Bool)

(declare-fun e!160861 () Bool)

(declare-fun e!160859 () Bool)

(assert (=> b!247952 (= e!160861 e!160859)))

(declare-fun res!121522 () Bool)

(declare-fun call!23219 () Bool)

(assert (=> b!247952 (= res!121522 call!23219)))

(assert (=> b!247952 (=> (not res!121522) (not e!160859))))

(declare-fun b!247953 () Bool)

(declare-fun e!160857 () Bool)

(declare-datatypes ((V!8261 0))(
  ( (V!8262 (val!3275 Int)) )
))
(declare-datatypes ((ValueCell!2887 0))(
  ( (ValueCellFull!2887 (v!5333 V!8261)) (EmptyCell!2887) )
))
(declare-datatypes ((array!12229 0))(
  ( (array!12230 (arr!5802 (Array (_ BitVec 32) ValueCell!2887)) (size!6145 (_ BitVec 32))) )
))
(declare-datatypes ((array!12231 0))(
  ( (array!12232 (arr!5803 (Array (_ BitVec 32) (_ BitVec 64))) (size!6146 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3674 0))(
  ( (LongMapFixedSize!3675 (defaultEntry!4586 Int) (mask!10728 (_ BitVec 32)) (extraKeys!4323 (_ BitVec 32)) (zeroValue!4427 V!8261) (minValue!4427 V!8261) (_size!1886 (_ BitVec 32)) (_keys!6708 array!12231) (_values!4569 array!12229) (_vacant!1886 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3674)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12231 (_ BitVec 32)) Bool)

(assert (=> b!247953 (= e!160857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6708 thiss!1504) (mask!10728 thiss!1504)))))

(declare-fun b!247954 () Bool)

(declare-datatypes ((Unit!7678 0))(
  ( (Unit!7679) )
))
(declare-fun e!160860 () Unit!7678)

(declare-fun Unit!7680 () Unit!7678)

(assert (=> b!247954 (= e!160860 Unit!7680)))

(declare-fun lt!124157 () Unit!7678)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!387 (array!12231 array!12229 (_ BitVec 32) (_ BitVec 32) V!8261 V!8261 (_ BitVec 64) Int) Unit!7678)

(assert (=> b!247954 (= lt!124157 (lemmaInListMapThenSeekEntryOrOpenFindsIt!387 (_keys!6708 thiss!1504) (_values!4569 thiss!1504) (mask!10728 thiss!1504) (extraKeys!4323 thiss!1504) (zeroValue!4427 thiss!1504) (minValue!4427 thiss!1504) key!932 (defaultEntry!4586 thiss!1504)))))

(assert (=> b!247954 false))

(declare-fun b!247955 () Bool)

(declare-fun res!121523 () Bool)

(declare-fun e!160853 () Bool)

(assert (=> b!247955 (=> (not res!121523) (not e!160853))))

(assert (=> b!247955 (= res!121523 call!23219)))

(declare-fun e!160850 () Bool)

(assert (=> b!247955 (= e!160850 e!160853)))

(declare-fun b!247956 () Bool)

(declare-fun e!160855 () Bool)

(declare-fun e!160863 () Bool)

(assert (=> b!247956 (= e!160855 e!160863)))

(declare-fun res!121525 () Bool)

(assert (=> b!247956 (=> (not res!121525) (not e!160863))))

(declare-datatypes ((SeekEntryResult!1108 0))(
  ( (MissingZero!1108 (index!6602 (_ BitVec 32))) (Found!1108 (index!6603 (_ BitVec 32))) (Intermediate!1108 (undefined!1920 Bool) (index!6604 (_ BitVec 32)) (x!24552 (_ BitVec 32))) (Undefined!1108) (MissingVacant!1108 (index!6605 (_ BitVec 32))) )
))
(declare-fun lt!124152 () SeekEntryResult!1108)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!247956 (= res!121525 (or (= lt!124152 (MissingZero!1108 index!297)) (= lt!124152 (MissingVacant!1108 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12231 (_ BitVec 32)) SeekEntryResult!1108)

(assert (=> b!247956 (= lt!124152 (seekEntryOrOpen!0 key!932 (_keys!6708 thiss!1504) (mask!10728 thiss!1504)))))

(declare-fun mapNonEmpty!10967 () Bool)

(declare-fun mapRes!10967 () Bool)

(declare-fun tp!23044 () Bool)

(declare-fun e!160849 () Bool)

(assert (=> mapNonEmpty!10967 (= mapRes!10967 (and tp!23044 e!160849))))

(declare-fun mapKey!10967 () (_ BitVec 32))

(declare-fun mapValue!10967 () ValueCell!2887)

(declare-fun mapRest!10967 () (Array (_ BitVec 32) ValueCell!2887))

(assert (=> mapNonEmpty!10967 (= (arr!5802 (_values!4569 thiss!1504)) (store mapRest!10967 mapKey!10967 mapValue!10967))))

(declare-fun b!247957 () Bool)

(declare-fun res!121529 () Bool)

(assert (=> b!247957 (= res!121529 (= (select (arr!5803 (_keys!6708 thiss!1504)) (index!6605 lt!124152)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247957 (=> (not res!121529) (not e!160859))))

(declare-fun b!247958 () Bool)

(declare-fun e!160852 () Bool)

(declare-fun tp_is_empty!6461 () Bool)

(assert (=> b!247958 (= e!160852 tp_is_empty!6461)))

(declare-fun b!247959 () Bool)

(declare-fun call!23218 () Bool)

(assert (=> b!247959 (= e!160859 (not call!23218))))

(declare-fun res!121520 () Bool)

(assert (=> start!23580 (=> (not res!121520) (not e!160855))))

(declare-fun valid!1438 (LongMapFixedSize!3674) Bool)

(assert (=> start!23580 (= res!121520 (valid!1438 thiss!1504))))

(assert (=> start!23580 e!160855))

(declare-fun e!160854 () Bool)

(assert (=> start!23580 e!160854))

(assert (=> start!23580 true))

(declare-fun b!247960 () Bool)

(assert (=> b!247960 (= e!160849 tp_is_empty!6461)))

(declare-fun b!247961 () Bool)

(declare-fun e!160856 () Bool)

(assert (=> b!247961 (= e!160856 (and e!160852 mapRes!10967))))

(declare-fun condMapEmpty!10967 () Bool)

(declare-fun mapDefault!10967 () ValueCell!2887)

