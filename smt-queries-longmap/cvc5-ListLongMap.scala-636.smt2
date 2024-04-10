; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16164 () Bool)

(assert start!16164)

(declare-fun b!161114 () Bool)

(declare-fun b_free!3625 () Bool)

(declare-fun b_next!3625 () Bool)

(assert (=> b!161114 (= b_free!3625 (not b_next!3625))))

(declare-fun tp!13444 () Bool)

(declare-fun b_and!10039 () Bool)

(assert (=> b!161114 (= tp!13444 b_and!10039)))

(declare-fun b!161112 () Bool)

(declare-fun e!105273 () Bool)

(declare-fun tp_is_empty!3427 () Bool)

(assert (=> b!161112 (= e!105273 tp_is_empty!3427)))

(declare-fun b!161113 () Bool)

(declare-fun e!105274 () Bool)

(assert (=> b!161113 (= e!105274 tp_is_empty!3427)))

(declare-fun mapNonEmpty!5828 () Bool)

(declare-fun mapRes!5828 () Bool)

(declare-fun tp!13445 () Bool)

(assert (=> mapNonEmpty!5828 (= mapRes!5828 (and tp!13445 e!105273))))

(declare-fun mapKey!5828 () (_ BitVec 32))

(declare-datatypes ((V!4217 0))(
  ( (V!4218 (val!1758 Int)) )
))
(declare-datatypes ((ValueCell!1370 0))(
  ( (ValueCellFull!1370 (v!3623 V!4217)) (EmptyCell!1370) )
))
(declare-fun mapValue!5828 () ValueCell!1370)

(declare-datatypes ((array!5933 0))(
  ( (array!5934 (arr!2811 (Array (_ BitVec 32) (_ BitVec 64))) (size!3095 (_ BitVec 32))) )
))
(declare-datatypes ((array!5935 0))(
  ( (array!5936 (arr!2812 (Array (_ BitVec 32) ValueCell!1370)) (size!3096 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1648 0))(
  ( (LongMapFixedSize!1649 (defaultEntry!3266 Int) (mask!7850 (_ BitVec 32)) (extraKeys!3007 (_ BitVec 32)) (zeroValue!3109 V!4217) (minValue!3109 V!4217) (_size!873 (_ BitVec 32)) (_keys!5067 array!5933) (_values!3249 array!5935) (_vacant!873 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1648)

(declare-fun mapRest!5828 () (Array (_ BitVec 32) ValueCell!1370))

(assert (=> mapNonEmpty!5828 (= (arr!2812 (_values!3249 thiss!1248)) (store mapRest!5828 mapKey!5828 mapValue!5828))))

(declare-fun e!105272 () Bool)

(declare-fun e!105275 () Bool)

(declare-fun array_inv!1795 (array!5933) Bool)

(declare-fun array_inv!1796 (array!5935) Bool)

(assert (=> b!161114 (= e!105272 (and tp!13444 tp_is_empty!3427 (array_inv!1795 (_keys!5067 thiss!1248)) (array_inv!1796 (_values!3249 thiss!1248)) e!105275))))

(declare-fun b!161115 () Bool)

(declare-fun res!76400 () Bool)

(declare-fun e!105276 () Bool)

(assert (=> b!161115 (=> (not res!76400) (not e!105276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5933 (_ BitVec 32)) Bool)

(assert (=> b!161115 (= res!76400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5067 thiss!1248) (mask!7850 thiss!1248)))))

(declare-fun res!76394 () Bool)

(assert (=> start!16164 (=> (not res!76394) (not e!105276))))

(declare-fun valid!758 (LongMapFixedSize!1648) Bool)

(assert (=> start!16164 (= res!76394 (valid!758 thiss!1248))))

(assert (=> start!16164 e!105276))

(assert (=> start!16164 e!105272))

(assert (=> start!16164 true))

(declare-fun b!161116 () Bool)

(declare-fun res!76396 () Bool)

(assert (=> b!161116 (=> (not res!76396) (not e!105276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!161116 (= res!76396 (validMask!0 (mask!7850 thiss!1248)))))

(declare-fun b!161117 () Bool)

(declare-fun res!76397 () Bool)

(assert (=> b!161117 (=> (not res!76397) (not e!105276))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!346 0))(
  ( (MissingZero!346 (index!3552 (_ BitVec 32))) (Found!346 (index!3553 (_ BitVec 32))) (Intermediate!346 (undefined!1158 Bool) (index!3554 (_ BitVec 32)) (x!17778 (_ BitVec 32))) (Undefined!346) (MissingVacant!346 (index!3555 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5933 (_ BitVec 32)) SeekEntryResult!346)

(assert (=> b!161117 (= res!76397 (is-Undefined!346 (seekEntryOrOpen!0 key!828 (_keys!5067 thiss!1248) (mask!7850 thiss!1248))))))

(declare-fun b!161118 () Bool)

(declare-fun res!76395 () Bool)

(assert (=> b!161118 (=> (not res!76395) (not e!105276))))

(assert (=> b!161118 (= res!76395 (and (= (size!3096 (_values!3249 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7850 thiss!1248))) (= (size!3095 (_keys!5067 thiss!1248)) (size!3096 (_values!3249 thiss!1248))) (bvsge (mask!7850 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3007 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3007 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!161119 () Bool)

(declare-fun res!76399 () Bool)

(assert (=> b!161119 (=> (not res!76399) (not e!105276))))

(declare-datatypes ((tuple2!2948 0))(
  ( (tuple2!2949 (_1!1485 (_ BitVec 64)) (_2!1485 V!4217)) )
))
(declare-datatypes ((List!1968 0))(
  ( (Nil!1965) (Cons!1964 (h!2577 tuple2!2948) (t!6770 List!1968)) )
))
(declare-datatypes ((ListLongMap!1935 0))(
  ( (ListLongMap!1936 (toList!983 List!1968)) )
))
(declare-fun contains!1019 (ListLongMap!1935 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!647 (array!5933 array!5935 (_ BitVec 32) (_ BitVec 32) V!4217 V!4217 (_ BitVec 32) Int) ListLongMap!1935)

(assert (=> b!161119 (= res!76399 (not (contains!1019 (getCurrentListMap!647 (_keys!5067 thiss!1248) (_values!3249 thiss!1248) (mask!7850 thiss!1248) (extraKeys!3007 thiss!1248) (zeroValue!3109 thiss!1248) (minValue!3109 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3266 thiss!1248)) key!828)))))

(declare-fun mapIsEmpty!5828 () Bool)

(assert (=> mapIsEmpty!5828 mapRes!5828))

(declare-fun b!161120 () Bool)

(assert (=> b!161120 (= e!105275 (and e!105274 mapRes!5828))))

(declare-fun condMapEmpty!5828 () Bool)

(declare-fun mapDefault!5828 () ValueCell!1370)

