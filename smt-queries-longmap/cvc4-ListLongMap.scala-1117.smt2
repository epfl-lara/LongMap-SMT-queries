; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22952 () Bool)

(assert start!22952)

(declare-fun b!240061 () Bool)

(declare-fun b_free!6455 () Bool)

(declare-fun b_next!6455 () Bool)

(assert (=> b!240061 (= b_free!6455 (not b_next!6455))))

(declare-fun tp!22568 () Bool)

(declare-fun b_and!13421 () Bool)

(assert (=> b!240061 (= tp!22568 b_and!13421)))

(declare-fun mapNonEmpty!10707 () Bool)

(declare-fun mapRes!10707 () Bool)

(declare-fun tp!22569 () Bool)

(declare-fun e!155847 () Bool)

(assert (=> mapNonEmpty!10707 (= mapRes!10707 (and tp!22569 e!155847))))

(declare-fun mapKey!10707 () (_ BitVec 32))

(declare-datatypes ((V!8069 0))(
  ( (V!8070 (val!3203 Int)) )
))
(declare-datatypes ((ValueCell!2815 0))(
  ( (ValueCellFull!2815 (v!5241 V!8069)) (EmptyCell!2815) )
))
(declare-fun mapRest!10707 () (Array (_ BitVec 32) ValueCell!2815))

(declare-datatypes ((array!11913 0))(
  ( (array!11914 (arr!5658 (Array (_ BitVec 32) ValueCell!2815)) (size!5999 (_ BitVec 32))) )
))
(declare-datatypes ((array!11915 0))(
  ( (array!11916 (arr!5659 (Array (_ BitVec 32) (_ BitVec 64))) (size!6000 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3530 0))(
  ( (LongMapFixedSize!3531 (defaultEntry!4450 Int) (mask!10502 (_ BitVec 32)) (extraKeys!4187 (_ BitVec 32)) (zeroValue!4291 V!8069) (minValue!4291 V!8069) (_size!1814 (_ BitVec 32)) (_keys!6552 array!11915) (_values!4433 array!11913) (_vacant!1814 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3530)

(declare-fun mapValue!10707 () ValueCell!2815)

(assert (=> mapNonEmpty!10707 (= (arr!5658 (_values!4433 thiss!1504)) (store mapRest!10707 mapKey!10707 mapValue!10707))))

(declare-fun b!240045 () Bool)

(declare-fun res!117665 () Bool)

(declare-fun e!155844 () Bool)

(assert (=> b!240045 (=> (not res!117665) (not e!155844))))

(declare-fun call!22326 () Bool)

(assert (=> b!240045 (= res!117665 call!22326)))

(declare-fun e!155850 () Bool)

(assert (=> b!240045 (= e!155850 e!155844)))

(declare-fun b!240046 () Bool)

(declare-fun e!155840 () Bool)

(declare-fun call!22325 () Bool)

(assert (=> b!240046 (= e!155840 (not call!22325))))

(declare-fun b!240047 () Bool)

(declare-datatypes ((Unit!7379 0))(
  ( (Unit!7380) )
))
(declare-fun e!155841 () Unit!7379)

(declare-fun Unit!7381 () Unit!7379)

(assert (=> b!240047 (= e!155841 Unit!7381)))

(declare-fun lt!120907 () Unit!7379)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!335 (array!11915 array!11913 (_ BitVec 32) (_ BitVec 32) V!8069 V!8069 (_ BitVec 64) Int) Unit!7379)

(assert (=> b!240047 (= lt!120907 (lemmaInListMapThenSeekEntryOrOpenFindsIt!335 (_keys!6552 thiss!1504) (_values!4433 thiss!1504) (mask!10502 thiss!1504) (extraKeys!4187 thiss!1504) (zeroValue!4291 thiss!1504) (minValue!4291 thiss!1504) key!932 (defaultEntry!4450 thiss!1504)))))

(assert (=> b!240047 false))

(declare-fun b!240048 () Bool)

(declare-fun res!117674 () Bool)

(assert (=> b!240048 (=> (not res!117674) (not e!155844))))

(declare-datatypes ((SeekEntryResult!1041 0))(
  ( (MissingZero!1041 (index!6334 (_ BitVec 32))) (Found!1041 (index!6335 (_ BitVec 32))) (Intermediate!1041 (undefined!1853 Bool) (index!6336 (_ BitVec 32)) (x!24137 (_ BitVec 32))) (Undefined!1041) (MissingVacant!1041 (index!6337 (_ BitVec 32))) )
))
(declare-fun lt!120906 () SeekEntryResult!1041)

(assert (=> b!240048 (= res!117674 (= (select (arr!5659 (_keys!6552 thiss!1504)) (index!6334 lt!120906)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240049 () Bool)

(declare-fun e!155846 () Bool)

(declare-datatypes ((List!3604 0))(
  ( (Nil!3601) (Cons!3600 (h!4256 (_ BitVec 64)) (t!8599 List!3604)) )
))
(declare-fun arrayNoDuplicates!0 (array!11915 (_ BitVec 32) List!3604) Bool)

(assert (=> b!240049 (= e!155846 (not (arrayNoDuplicates!0 (_keys!6552 thiss!1504) #b00000000000000000000000000000000 Nil!3601)))))

(declare-fun bm!22322 () Bool)

(declare-fun c!40000 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22322 (= call!22326 (inRange!0 (ite c!40000 (index!6334 lt!120906) (index!6337 lt!120906)) (mask!10502 thiss!1504)))))

(declare-fun b!240050 () Bool)

(declare-fun e!155849 () Bool)

(assert (=> b!240050 (= e!155849 e!155840)))

(declare-fun res!117667 () Bool)

(assert (=> b!240050 (= res!117667 call!22326)))

(assert (=> b!240050 (=> (not res!117667) (not e!155840))))

(declare-fun b!240051 () Bool)

(declare-fun e!155848 () Bool)

(declare-fun e!155845 () Bool)

(assert (=> b!240051 (= e!155848 (and e!155845 mapRes!10707))))

(declare-fun condMapEmpty!10707 () Bool)

(declare-fun mapDefault!10707 () ValueCell!2815)

