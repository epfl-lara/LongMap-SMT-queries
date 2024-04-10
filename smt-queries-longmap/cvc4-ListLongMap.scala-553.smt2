; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14712 () Bool)

(assert start!14712)

(declare-fun b!139345 () Bool)

(declare-fun b_free!3033 () Bool)

(declare-fun b_next!3033 () Bool)

(assert (=> b!139345 (= b_free!3033 (not b_next!3033))))

(declare-fun tp!11571 () Bool)

(declare-fun b_and!8703 () Bool)

(assert (=> b!139345 (= tp!11571 b_and!8703)))

(declare-fun b!139344 () Bool)

(declare-fun b_free!3035 () Bool)

(declare-fun b_next!3035 () Bool)

(assert (=> b!139344 (= b_free!3035 (not b_next!3035))))

(declare-fun tp!11569 () Bool)

(declare-fun b_and!8705 () Bool)

(assert (=> b!139344 (= tp!11569 b_and!8705)))

(declare-fun b!139335 () Bool)

(declare-fun e!90915 () Bool)

(declare-fun tp_is_empty!2933 () Bool)

(assert (=> b!139335 (= e!90915 tp_is_empty!2933)))

(declare-fun mapIsEmpty!4839 () Bool)

(declare-fun mapRes!4840 () Bool)

(assert (=> mapIsEmpty!4839 mapRes!4840))

(declare-fun b!139336 () Bool)

(declare-fun e!90918 () Bool)

(declare-datatypes ((V!3557 0))(
  ( (V!3558 (val!1511 Int)) )
))
(declare-datatypes ((array!4901 0))(
  ( (array!4902 (arr!2317 (Array (_ BitVec 32) (_ BitVec 64))) (size!2589 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1123 0))(
  ( (ValueCellFull!1123 (v!3281 V!3557)) (EmptyCell!1123) )
))
(declare-datatypes ((array!4903 0))(
  ( (array!4904 (arr!2318 (Array (_ BitVec 32) ValueCell!1123)) (size!2590 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1154 0))(
  ( (LongMapFixedSize!1155 (defaultEntry!2941 Int) (mask!7281 (_ BitVec 32)) (extraKeys!2696 (_ BitVec 32)) (zeroValue!2791 V!3557) (minValue!2791 V!3557) (_size!626 (_ BitVec 32)) (_keys!4700 array!4901) (_values!2924 array!4903) (_vacant!626 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!940 0))(
  ( (Cell!941 (v!3282 LongMapFixedSize!1154)) )
))
(declare-datatypes ((LongMap!940 0))(
  ( (LongMap!941 (underlying!481 Cell!940)) )
))
(declare-fun thiss!992 () LongMap!940)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!139336 (= e!90918 (not (or (bvsge (size!2589 (_keys!4700 (v!3282 (underlying!481 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2589 (_keys!4700 (v!3282 (underlying!481 thiss!992))))))))))

(declare-datatypes ((List!1747 0))(
  ( (Nil!1744) (Cons!1743 (h!2350 (_ BitVec 64)) (t!6335 List!1747)) )
))
(declare-fun arrayNoDuplicates!0 (array!4901 (_ BitVec 32) List!1747) Bool)

(assert (=> b!139336 (arrayNoDuplicates!0 (_keys!4700 (v!3282 (underlying!481 thiss!992))) from!355 Nil!1744)))

(declare-datatypes ((Unit!4375 0))(
  ( (Unit!4376) )
))
(declare-fun lt!72841 () Unit!4375)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4901 (_ BitVec 32) (_ BitVec 32)) Unit!4375)

(assert (=> b!139336 (= lt!72841 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4700 (v!3282 (underlying!481 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139336 (arrayContainsKey!0 (_keys!4700 (v!3282 (underlying!481 thiss!992))) (select (arr!2317 (_keys!4700 (v!3282 (underlying!481 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!72842 () Unit!4375)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!140 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) V!3557 V!3557 (_ BitVec 64) (_ BitVec 32) Int) Unit!4375)

(assert (=> b!139336 (= lt!72842 (lemmaListMapContainsThenArrayContainsFrom!140 (_keys!4700 (v!3282 (underlying!481 thiss!992))) (_values!2924 (v!3282 (underlying!481 thiss!992))) (mask!7281 (v!3282 (underlying!481 thiss!992))) (extraKeys!2696 (v!3282 (underlying!481 thiss!992))) (zeroValue!2791 (v!3282 (underlying!481 thiss!992))) (minValue!2791 (v!3282 (underlying!481 thiss!992))) (select (arr!2317 (_keys!4700 (v!3282 (underlying!481 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2941 (v!3282 (underlying!481 thiss!992)))))))

(declare-fun b!139337 () Bool)

(declare-fun e!90914 () Bool)

(declare-fun e!90922 () Bool)

(declare-fun mapRes!4839 () Bool)

(assert (=> b!139337 (= e!90914 (and e!90922 mapRes!4839))))

(declare-fun condMapEmpty!4840 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1154)

(declare-fun mapDefault!4840 () ValueCell!1123)

