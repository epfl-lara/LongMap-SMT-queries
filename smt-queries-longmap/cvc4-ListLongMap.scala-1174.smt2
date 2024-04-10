; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25240 () Bool)

(assert start!25240)

(declare-fun b!263000 () Bool)

(declare-fun b_free!6797 () Bool)

(declare-fun b_next!6797 () Bool)

(assert (=> b!263000 (= b_free!6797 (not b_next!6797))))

(declare-fun tp!23727 () Bool)

(declare-fun b_and!13939 () Bool)

(assert (=> b!263000 (= tp!23727 b_and!13939)))

(declare-datatypes ((V!8525 0))(
  ( (V!8526 (val!3374 Int)) )
))
(declare-datatypes ((tuple2!4980 0))(
  ( (tuple2!4981 (_1!2501 (_ BitVec 64)) (_2!2501 V!8525)) )
))
(declare-fun lt!133083 () tuple2!4980)

(declare-fun b!262983 () Bool)

(declare-fun e!170437 () Bool)

(declare-datatypes ((List!3854 0))(
  ( (Nil!3851) (Cons!3850 (h!4516 tuple2!4980) (t!8931 List!3854)) )
))
(declare-datatypes ((ListLongMap!3893 0))(
  ( (ListLongMap!3894 (toList!1962 List!3854)) )
))
(declare-fun lt!133079 () ListLongMap!3893)

(declare-datatypes ((ValueCell!2986 0))(
  ( (ValueCellFull!2986 (v!5505 V!8525)) (EmptyCell!2986) )
))
(declare-datatypes ((array!12679 0))(
  ( (array!12680 (arr!6000 (Array (_ BitVec 32) ValueCell!2986)) (size!6351 (_ BitVec 32))) )
))
(declare-datatypes ((array!12681 0))(
  ( (array!12682 (arr!6001 (Array (_ BitVec 32) (_ BitVec 64))) (size!6352 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3872 0))(
  ( (LongMapFixedSize!3873 (defaultEntry!4844 Int) (mask!11210 (_ BitVec 32)) (extraKeys!4581 (_ BitVec 32)) (zeroValue!4685 V!8525) (minValue!4685 V!8525) (_size!1985 (_ BitVec 32)) (_keys!7036 array!12681) (_values!4827 array!12679) (_vacant!1985 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3872)

(declare-fun +!711 (ListLongMap!3893 tuple2!4980) ListLongMap!3893)

(declare-fun map!2759 (LongMapFixedSize!3872) ListLongMap!3893)

(assert (=> b!262983 (= e!170437 (= lt!133079 (+!711 (map!2759 thiss!1504) lt!133083)))))

(declare-fun b!262985 () Bool)

(declare-fun e!170440 () Bool)

(declare-fun tp_is_empty!6659 () Bool)

(assert (=> b!262985 (= e!170440 tp_is_empty!6659)))

(declare-fun b!262986 () Bool)

(declare-fun e!170439 () Bool)

(declare-fun e!170445 () Bool)

(assert (=> b!262986 (= e!170439 e!170445)))

(declare-fun res!128449 () Bool)

(assert (=> b!262986 (=> (not res!128449) (not e!170445))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262986 (= res!128449 (inRange!0 index!297 (mask!11210 thiss!1504)))))

(declare-datatypes ((Unit!8195 0))(
  ( (Unit!8196) )
))
(declare-fun lt!133087 () Unit!8195)

(declare-fun e!170444 () Unit!8195)

(assert (=> b!262986 (= lt!133087 e!170444)))

(declare-fun c!44836 () Bool)

(declare-fun lt!133069 () ListLongMap!3893)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1913 (ListLongMap!3893 (_ BitVec 64)) Bool)

(assert (=> b!262986 (= c!44836 (contains!1913 lt!133069 key!932))))

(declare-fun getCurrentListMap!1490 (array!12681 array!12679 (_ BitVec 32) (_ BitVec 32) V!8525 V!8525 (_ BitVec 32) Int) ListLongMap!3893)

(assert (=> b!262986 (= lt!133069 (getCurrentListMap!1490 (_keys!7036 thiss!1504) (_values!4827 thiss!1504) (mask!11210 thiss!1504) (extraKeys!4581 thiss!1504) (zeroValue!4685 thiss!1504) (minValue!4685 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4844 thiss!1504)))))

(declare-fun b!262987 () Bool)

(declare-fun e!170435 () Bool)

(declare-datatypes ((SeekEntryResult!1201 0))(
  ( (MissingZero!1201 (index!6974 (_ BitVec 32))) (Found!1201 (index!6975 (_ BitVec 32))) (Intermediate!1201 (undefined!2013 Bool) (index!6976 (_ BitVec 32)) (x!25243 (_ BitVec 32))) (Undefined!1201) (MissingVacant!1201 (index!6977 (_ BitVec 32))) )
))
(declare-fun lt!133071 () SeekEntryResult!1201)

(assert (=> b!262987 (= e!170435 (is-Undefined!1201 lt!133071))))

(declare-fun b!262988 () Bool)

(declare-fun e!170441 () Unit!8195)

(declare-fun Unit!8197 () Unit!8195)

(assert (=> b!262988 (= e!170441 Unit!8197)))

(declare-fun b!262989 () Bool)

(declare-fun res!128448 () Bool)

(declare-fun e!170438 () Bool)

(assert (=> b!262989 (=> (not res!128448) (not e!170438))))

(assert (=> b!262989 (= res!128448 (= (select (arr!6001 (_keys!7036 thiss!1504)) (index!6974 lt!133071)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262990 () Bool)

(declare-fun Unit!8198 () Unit!8195)

(assert (=> b!262990 (= e!170444 Unit!8198)))

(declare-fun lt!133074 () Unit!8195)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!456 (array!12681 array!12679 (_ BitVec 32) (_ BitVec 32) V!8525 V!8525 (_ BitVec 64) Int) Unit!8195)

(assert (=> b!262990 (= lt!133074 (lemmaInListMapThenSeekEntryOrOpenFindsIt!456 (_keys!7036 thiss!1504) (_values!4827 thiss!1504) (mask!11210 thiss!1504) (extraKeys!4581 thiss!1504) (zeroValue!4685 thiss!1504) (minValue!4685 thiss!1504) key!932 (defaultEntry!4844 thiss!1504)))))

(assert (=> b!262990 false))

(declare-fun b!262991 () Bool)

(declare-fun e!170436 () Bool)

(declare-fun mapRes!11353 () Bool)

(assert (=> b!262991 (= e!170436 (and e!170440 mapRes!11353))))

(declare-fun condMapEmpty!11353 () Bool)

(declare-fun mapDefault!11353 () ValueCell!2986)

