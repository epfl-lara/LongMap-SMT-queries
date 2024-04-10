; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23084 () Bool)

(assert start!23084)

(declare-fun b!241976 () Bool)

(declare-fun b_free!6499 () Bool)

(declare-fun b_next!6499 () Bool)

(assert (=> b!241976 (= b_free!6499 (not b_next!6499))))

(declare-fun tp!22707 () Bool)

(declare-fun b_and!13473 () Bool)

(assert (=> b!241976 (= tp!22707 b_and!13473)))

(declare-fun b!241959 () Bool)

(declare-fun c!40362 () Bool)

(declare-datatypes ((SeekEntryResult!1061 0))(
  ( (MissingZero!1061 (index!6414 (_ BitVec 32))) (Found!1061 (index!6415 (_ BitVec 32))) (Intermediate!1061 (undefined!1873 Bool) (index!6416 (_ BitVec 32)) (x!24249 (_ BitVec 32))) (Undefined!1061) (MissingVacant!1061 (index!6417 (_ BitVec 32))) )
))
(declare-fun lt!121579 () SeekEntryResult!1061)

(assert (=> b!241959 (= c!40362 (is-MissingVacant!1061 lt!121579))))

(declare-fun e!157029 () Bool)

(declare-fun e!157040 () Bool)

(assert (=> b!241959 (= e!157029 e!157040)))

(declare-fun b!241960 () Bool)

(declare-fun res!118577 () Bool)

(declare-fun e!157033 () Bool)

(assert (=> b!241960 (=> (not res!118577) (not e!157033))))

(declare-datatypes ((V!8129 0))(
  ( (V!8130 (val!3225 Int)) )
))
(declare-datatypes ((ValueCell!2837 0))(
  ( (ValueCellFull!2837 (v!5265 V!8129)) (EmptyCell!2837) )
))
(declare-datatypes ((array!12005 0))(
  ( (array!12006 (arr!5702 (Array (_ BitVec 32) ValueCell!2837)) (size!6044 (_ BitVec 32))) )
))
(declare-datatypes ((array!12007 0))(
  ( (array!12008 (arr!5703 (Array (_ BitVec 32) (_ BitVec 64))) (size!6045 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3574 0))(
  ( (LongMapFixedSize!3575 (defaultEntry!4484 Int) (mask!10561 (_ BitVec 32)) (extraKeys!4221 (_ BitVec 32)) (zeroValue!4325 V!8129) (minValue!4325 V!8129) (_size!1836 (_ BitVec 32)) (_keys!6591 array!12007) (_values!4467 array!12005) (_vacant!1836 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3574)

(assert (=> b!241960 (= res!118577 (= (select (arr!5703 (_keys!6591 thiss!1504)) (index!6414 lt!121579)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241961 () Bool)

(declare-fun e!157030 () Bool)

(declare-fun e!157041 () Bool)

(assert (=> b!241961 (= e!157030 e!157041)))

(declare-fun res!118570 () Bool)

(assert (=> b!241961 (=> (not res!118570) (not e!157041))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!241961 (= res!118570 (inRange!0 index!297 (mask!10561 thiss!1504)))))

(declare-datatypes ((Unit!7456 0))(
  ( (Unit!7457) )
))
(declare-fun lt!121580 () Unit!7456)

(declare-fun e!157036 () Unit!7456)

(assert (=> b!241961 (= lt!121580 e!157036)))

(declare-fun c!40361 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4750 0))(
  ( (tuple2!4751 (_1!2386 (_ BitVec 64)) (_2!2386 V!8129)) )
))
(declare-datatypes ((List!3628 0))(
  ( (Nil!3625) (Cons!3624 (h!4281 tuple2!4750) (t!8627 List!3628)) )
))
(declare-datatypes ((ListLongMap!3663 0))(
  ( (ListLongMap!3664 (toList!1847 List!3628)) )
))
(declare-fun contains!1737 (ListLongMap!3663 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1375 (array!12007 array!12005 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 32) Int) ListLongMap!3663)

(assert (=> b!241961 (= c!40361 (contains!1737 (getCurrentListMap!1375 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)) key!932))))

(declare-fun b!241962 () Bool)

(declare-fun Unit!7458 () Unit!7456)

(assert (=> b!241962 (= e!157036 Unit!7458)))

(declare-fun lt!121577 () Unit!7456)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!352 (array!12007 array!12005 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 64) Int) Unit!7456)

(assert (=> b!241962 (= lt!121577 (lemmaInListMapThenSeekEntryOrOpenFindsIt!352 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 (defaultEntry!4484 thiss!1504)))))

(assert (=> b!241962 false))

(declare-fun bm!22526 () Bool)

(declare-fun call!22530 () Bool)

(declare-fun arrayContainsKey!0 (array!12007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22526 (= call!22530 (arrayContainsKey!0 (_keys!6591 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241963 () Bool)

(declare-fun e!157038 () Unit!7456)

(declare-fun Unit!7459 () Unit!7456)

(assert (=> b!241963 (= e!157038 Unit!7459)))

(declare-fun b!241964 () Bool)

(declare-fun e!157042 () Bool)

(assert (=> b!241964 (= e!157042 e!157030)))

(declare-fun res!118573 () Bool)

(assert (=> b!241964 (=> (not res!118573) (not e!157030))))

(assert (=> b!241964 (= res!118573 (or (= lt!121579 (MissingZero!1061 index!297)) (= lt!121579 (MissingVacant!1061 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12007 (_ BitVec 32)) SeekEntryResult!1061)

(assert (=> b!241964 (= lt!121579 (seekEntryOrOpen!0 key!932 (_keys!6591 thiss!1504) (mask!10561 thiss!1504)))))

(declare-fun bm!22527 () Bool)

(declare-fun c!40360 () Bool)

(declare-fun call!22529 () Bool)

(assert (=> bm!22527 (= call!22529 (inRange!0 (ite c!40360 (index!6414 lt!121579) (index!6417 lt!121579)) (mask!10561 thiss!1504)))))

(declare-fun b!241965 () Bool)

(declare-fun res!118574 () Bool)

(assert (=> b!241965 (=> (not res!118574) (not e!157033))))

(assert (=> b!241965 (= res!118574 call!22529)))

(assert (=> b!241965 (= e!157029 e!157033)))

(declare-fun b!241966 () Bool)

(declare-fun e!157037 () Bool)

(declare-datatypes ((List!3629 0))(
  ( (Nil!3626) (Cons!3625 (h!4282 (_ BitVec 64)) (t!8628 List!3629)) )
))
(declare-fun noDuplicate!87 (List!3629) Bool)

(assert (=> b!241966 (= e!157037 (not (noDuplicate!87 Nil!3626)))))

(declare-fun b!241967 () Bool)

(declare-fun e!157032 () Bool)

(declare-fun tp_is_empty!6361 () Bool)

(assert (=> b!241967 (= e!157032 tp_is_empty!6361)))

(declare-fun b!241968 () Bool)

(assert (=> b!241968 (= e!157040 (is-Undefined!1061 lt!121579))))

(declare-fun b!241969 () Bool)

(assert (=> b!241969 (= e!157033 (not call!22530))))

(declare-fun mapNonEmpty!10780 () Bool)

(declare-fun mapRes!10780 () Bool)

(declare-fun tp!22708 () Bool)

(assert (=> mapNonEmpty!10780 (= mapRes!10780 (and tp!22708 e!157032))))

(declare-fun mapValue!10780 () ValueCell!2837)

(declare-fun mapKey!10780 () (_ BitVec 32))

(declare-fun mapRest!10780 () (Array (_ BitVec 32) ValueCell!2837))

(assert (=> mapNonEmpty!10780 (= (arr!5702 (_values!4467 thiss!1504)) (store mapRest!10780 mapKey!10780 mapValue!10780))))

(declare-fun mapIsEmpty!10780 () Bool)

(assert (=> mapIsEmpty!10780 mapRes!10780))

(declare-fun b!241970 () Bool)

(declare-fun e!157034 () Bool)

(assert (=> b!241970 (= e!157034 (not call!22530))))

(declare-fun b!241971 () Bool)

(declare-fun lt!121576 () Unit!7456)

(assert (=> b!241971 (= e!157036 lt!121576)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!361 (array!12007 array!12005 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 64) Int) Unit!7456)

(assert (=> b!241971 (= lt!121576 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!361 (_keys!6591 thiss!1504) (_values!4467 thiss!1504) (mask!10561 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 (defaultEntry!4484 thiss!1504)))))

(assert (=> b!241971 (= c!40360 (is-MissingZero!1061 lt!121579))))

(assert (=> b!241971 e!157029))

(declare-fun b!241972 () Bool)

(declare-fun res!118571 () Bool)

(assert (=> b!241972 (= res!118571 (= (select (arr!5703 (_keys!6591 thiss!1504)) (index!6417 lt!121579)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241972 (=> (not res!118571) (not e!157034))))

(declare-fun b!241973 () Bool)

(declare-fun e!157035 () Bool)

(declare-fun e!157039 () Bool)

(assert (=> b!241973 (= e!157035 (and e!157039 mapRes!10780))))

(declare-fun condMapEmpty!10780 () Bool)

(declare-fun mapDefault!10780 () ValueCell!2837)

