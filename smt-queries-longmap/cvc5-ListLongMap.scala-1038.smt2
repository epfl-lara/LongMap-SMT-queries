; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21910 () Bool)

(assert start!21910)

(declare-fun b!222427 () Bool)

(declare-fun b_free!5977 () Bool)

(declare-fun b_next!5977 () Bool)

(assert (=> b!222427 (= b_free!5977 (not b_next!5977))))

(declare-fun tp!21072 () Bool)

(declare-fun b_and!12875 () Bool)

(assert (=> b!222427 (= tp!21072 b_and!12875)))

(declare-fun b!222412 () Bool)

(declare-datatypes ((Unit!6665 0))(
  ( (Unit!6666) )
))
(declare-fun e!144535 () Unit!6665)

(declare-fun Unit!6667 () Unit!6665)

(assert (=> b!222412 (= e!144535 Unit!6667)))

(declare-fun lt!112652 () Unit!6665)

(declare-datatypes ((V!7433 0))(
  ( (V!7434 (val!2964 Int)) )
))
(declare-datatypes ((ValueCell!2576 0))(
  ( (ValueCellFull!2576 (v!4984 V!7433)) (EmptyCell!2576) )
))
(declare-datatypes ((array!10921 0))(
  ( (array!10922 (arr!5180 (Array (_ BitVec 32) ValueCell!2576)) (size!5513 (_ BitVec 32))) )
))
(declare-datatypes ((array!10923 0))(
  ( (array!10924 (arr!5181 (Array (_ BitVec 32) (_ BitVec 64))) (size!5514 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3052 0))(
  ( (LongMapFixedSize!3053 (defaultEntry!4185 Int) (mask!10005 (_ BitVec 32)) (extraKeys!3922 (_ BitVec 32)) (zeroValue!4026 V!7433) (minValue!4026 V!7433) (_size!1575 (_ BitVec 32)) (_keys!6239 array!10923) (_values!4168 array!10921) (_vacant!1575 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3052)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!61 (array!10923 array!10921 (_ BitVec 32) (_ BitVec 32) V!7433 V!7433 (_ BitVec 64) (_ BitVec 32) Int) Unit!6665)

(assert (=> b!222412 (= lt!112652 (lemmaArrayContainsKeyThenInListMap!61 (_keys!6239 thiss!1504) (_values!4168 thiss!1504) (mask!10005 thiss!1504) (extraKeys!3922 thiss!1504) (zeroValue!4026 thiss!1504) (minValue!4026 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4185 thiss!1504)))))

(assert (=> b!222412 false))

(declare-fun b!222413 () Bool)

(declare-fun Unit!6668 () Unit!6665)

(assert (=> b!222413 (= e!144535 Unit!6668)))

(declare-fun mapNonEmpty!9928 () Bool)

(declare-fun mapRes!9928 () Bool)

(declare-fun tp!21073 () Bool)

(declare-fun e!144551 () Bool)

(assert (=> mapNonEmpty!9928 (= mapRes!9928 (and tp!21073 e!144551))))

(declare-fun mapValue!9928 () ValueCell!2576)

(declare-fun mapKey!9928 () (_ BitVec 32))

(declare-fun mapRest!9928 () (Array (_ BitVec 32) ValueCell!2576))

(assert (=> mapNonEmpty!9928 (= (arr!5180 (_values!4168 thiss!1504)) (store mapRest!9928 mapKey!9928 mapValue!9928))))

(declare-fun b!222414 () Bool)

(declare-fun e!144541 () Bool)

(assert (=> b!222414 (= e!144541 false)))

(declare-fun lt!112646 () Bool)

(declare-datatypes ((List!3304 0))(
  ( (Nil!3301) (Cons!3300 (h!3948 (_ BitVec 64)) (t!8263 List!3304)) )
))
(declare-fun arrayNoDuplicates!0 (array!10923 (_ BitVec 32) List!3304) Bool)

(assert (=> b!222414 (= lt!112646 (arrayNoDuplicates!0 (_keys!6239 thiss!1504) #b00000000000000000000000000000000 Nil!3301))))

(declare-fun b!222415 () Bool)

(declare-fun e!144547 () Bool)

(declare-fun tp_is_empty!5839 () Bool)

(assert (=> b!222415 (= e!144547 tp_is_empty!5839)))

(declare-fun mapIsEmpty!9928 () Bool)

(assert (=> mapIsEmpty!9928 mapRes!9928))

(declare-fun b!222416 () Bool)

(declare-fun res!109194 () Bool)

(assert (=> b!222416 (=> (not res!109194) (not e!144541))))

(declare-fun contains!1524 (List!3304 (_ BitVec 64)) Bool)

(assert (=> b!222416 (= res!109194 (not (contains!1524 Nil!3301 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222417 () Bool)

(declare-fun c!36957 () Bool)

(declare-datatypes ((SeekEntryResult!837 0))(
  ( (MissingZero!837 (index!5518 (_ BitVec 32))) (Found!837 (index!5519 (_ BitVec 32))) (Intermediate!837 (undefined!1649 Bool) (index!5520 (_ BitVec 32)) (x!23057 (_ BitVec 32))) (Undefined!837) (MissingVacant!837 (index!5521 (_ BitVec 32))) )
))
(declare-fun lt!112651 () SeekEntryResult!837)

(assert (=> b!222417 (= c!36957 (is-MissingVacant!837 lt!112651))))

(declare-fun e!144534 () Bool)

(declare-fun e!144546 () Bool)

(assert (=> b!222417 (= e!144534 e!144546)))

(declare-fun b!222418 () Bool)

(declare-fun e!144539 () Bool)

(assert (=> b!222418 (= e!144539 (contains!1524 Nil!3301 key!932))))

(declare-fun b!222419 () Bool)

(declare-fun e!144538 () Bool)

(declare-fun call!20766 () Bool)

(assert (=> b!222419 (= e!144538 (not call!20766))))

(declare-fun b!222420 () Bool)

(assert (=> b!222420 (= e!144551 tp_is_empty!5839)))

(declare-fun b!222421 () Bool)

(declare-fun e!144543 () Bool)

(declare-fun e!144536 () Bool)

(assert (=> b!222421 (= e!144543 e!144536)))

(declare-fun res!109193 () Bool)

(assert (=> b!222421 (=> (not res!109193) (not e!144536))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!222421 (= res!109193 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!222422 () Bool)

(declare-fun res!109187 () Bool)

(assert (=> b!222422 (= res!109187 (= (select (arr!5181 (_keys!6239 thiss!1504)) (index!5521 lt!112651)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!222422 (=> (not res!109187) (not e!144538))))

(declare-fun res!109192 () Bool)

(declare-fun e!144540 () Bool)

(assert (=> start!21910 (=> (not res!109192) (not e!144540))))

(declare-fun valid!1231 (LongMapFixedSize!3052) Bool)

(assert (=> start!21910 (= res!109192 (valid!1231 thiss!1504))))

(assert (=> start!21910 e!144540))

(declare-fun e!144537 () Bool)

(assert (=> start!21910 e!144537))

(assert (=> start!21910 true))

(declare-fun b!222423 () Bool)

(declare-fun res!109190 () Bool)

(assert (=> b!222423 (=> (not res!109190) (not e!144540))))

(assert (=> b!222423 (= res!109190 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!222424 () Bool)

(assert (=> b!222424 (= e!144546 (is-Undefined!837 lt!112651))))

(declare-fun b!222425 () Bool)

(declare-fun res!109195 () Bool)

(declare-fun e!144542 () Bool)

(assert (=> b!222425 (=> (not res!109195) (not e!144542))))

(declare-fun call!20765 () Bool)

(assert (=> b!222425 (= res!109195 call!20765)))

(assert (=> b!222425 (= e!144534 e!144542)))

(declare-fun b!222426 () Bool)

(declare-fun res!109188 () Bool)

(assert (=> b!222426 (=> (not res!109188) (not e!144542))))

(assert (=> b!222426 (= res!109188 (= (select (arr!5181 (_keys!6239 thiss!1504)) (index!5518 lt!112651)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!144545 () Bool)

(declare-fun array_inv!3429 (array!10923) Bool)

(declare-fun array_inv!3430 (array!10921) Bool)

(assert (=> b!222427 (= e!144537 (and tp!21072 tp_is_empty!5839 (array_inv!3429 (_keys!6239 thiss!1504)) (array_inv!3430 (_values!4168 thiss!1504)) e!144545))))

(declare-fun b!222428 () Bool)

(declare-fun e!144550 () Unit!6665)

(declare-fun Unit!6669 () Unit!6665)

(assert (=> b!222428 (= e!144550 Unit!6669)))

(declare-fun lt!112648 () Unit!6665)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!225 (array!10923 array!10921 (_ BitVec 32) (_ BitVec 32) V!7433 V!7433 (_ BitVec 64) Int) Unit!6665)

(assert (=> b!222428 (= lt!112648 (lemmaInListMapThenSeekEntryOrOpenFindsIt!225 (_keys!6239 thiss!1504) (_values!4168 thiss!1504) (mask!10005 thiss!1504) (extraKeys!3922 thiss!1504) (zeroValue!4026 thiss!1504) (minValue!4026 thiss!1504) key!932 (defaultEntry!4185 thiss!1504)))))

(assert (=> b!222428 false))

(declare-fun b!222429 () Bool)

(declare-fun res!109189 () Bool)

(assert (=> b!222429 (=> (not res!109189) (not e!144541))))

(assert (=> b!222429 (= res!109189 e!144543)))

(declare-fun res!109199 () Bool)

(assert (=> b!222429 (=> res!109199 e!144543)))

(assert (=> b!222429 (= res!109199 e!144539)))

(declare-fun res!109197 () Bool)

(assert (=> b!222429 (=> (not res!109197) (not e!144539))))

(assert (=> b!222429 (= res!109197 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!222430 () Bool)

(declare-fun lt!112650 () Unit!6665)

(assert (=> b!222430 (= e!144550 lt!112650)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!235 (array!10923 array!10921 (_ BitVec 32) (_ BitVec 32) V!7433 V!7433 (_ BitVec 64) Int) Unit!6665)

(assert (=> b!222430 (= lt!112650 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!235 (_keys!6239 thiss!1504) (_values!4168 thiss!1504) (mask!10005 thiss!1504) (extraKeys!3922 thiss!1504) (zeroValue!4026 thiss!1504) (minValue!4026 thiss!1504) key!932 (defaultEntry!4185 thiss!1504)))))

(declare-fun c!36959 () Bool)

(assert (=> b!222430 (= c!36959 (is-MissingZero!837 lt!112651))))

(assert (=> b!222430 e!144534))

(declare-fun b!222431 () Bool)

(declare-fun e!144548 () Bool)

(assert (=> b!222431 (= e!144548 e!144541)))

(declare-fun res!109186 () Bool)

(assert (=> b!222431 (=> (not res!109186) (not e!144541))))

(assert (=> b!222431 (= res!109186 (and (bvslt (size!5514 (_keys!6239 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5514 (_keys!6239 thiss!1504)))))))

(declare-fun lt!112647 () Unit!6665)

(assert (=> b!222431 (= lt!112647 e!144535)))

(declare-fun c!36958 () Bool)

(declare-fun arrayContainsKey!0 (array!10923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222431 (= c!36958 (arrayContainsKey!0 (_keys!6239 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222432 () Bool)

(assert (=> b!222432 (= e!144545 (and e!144547 mapRes!9928))))

(declare-fun condMapEmpty!9928 () Bool)

(declare-fun mapDefault!9928 () ValueCell!2576)

