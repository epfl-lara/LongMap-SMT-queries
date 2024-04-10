; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12512 () Bool)

(assert start!12512)

(declare-fun b!107346 () Bool)

(declare-fun b_free!2533 () Bool)

(declare-fun b_next!2533 () Bool)

(assert (=> b!107346 (= b_free!2533 (not b_next!2533))))

(declare-fun tp!9929 () Bool)

(declare-fun b_and!6611 () Bool)

(assert (=> b!107346 (= tp!9929 b_and!6611)))

(declare-fun b!107333 () Bool)

(declare-fun b_free!2535 () Bool)

(declare-fun b_next!2535 () Bool)

(assert (=> b!107333 (= b_free!2535 (not b_next!2535))))

(declare-fun tp!9931 () Bool)

(declare-fun b_and!6613 () Bool)

(assert (=> b!107333 (= tp!9931 b_and!6613)))

(declare-fun b!107329 () Bool)

(declare-fun e!69833 () Bool)

(declare-fun tp_is_empty!2683 () Bool)

(assert (=> b!107329 (= e!69833 tp_is_empty!2683)))

(declare-fun b!107330 () Bool)

(declare-datatypes ((Unit!3310 0))(
  ( (Unit!3311) )
))
(declare-fun e!69841 () Unit!3310)

(declare-fun Unit!3312 () Unit!3310)

(assert (=> b!107330 (= e!69841 Unit!3312)))

(declare-fun lt!55036 () Unit!3310)

(declare-datatypes ((V!3225 0))(
  ( (V!3226 (val!1386 Int)) )
))
(declare-datatypes ((array!4359 0))(
  ( (array!4360 (arr!2067 (Array (_ BitVec 32) (_ BitVec 64))) (size!2323 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!998 0))(
  ( (ValueCellFull!998 (v!2905 V!3225)) (EmptyCell!998) )
))
(declare-datatypes ((array!4361 0))(
  ( (array!4362 (arr!2068 (Array (_ BitVec 32) ValueCell!998)) (size!2324 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!904 0))(
  ( (LongMapFixedSize!905 (defaultEntry!2602 Int) (mask!6758 (_ BitVec 32)) (extraKeys!2403 (_ BitVec 32)) (zeroValue!2475 V!3225) (minValue!2475 V!3225) (_size!501 (_ BitVec 32)) (_keys!4312 array!4359) (_values!2585 array!4361) (_vacant!501 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!704 0))(
  ( (Cell!705 (v!2906 LongMapFixedSize!904)) )
))
(declare-datatypes ((LongMap!704 0))(
  ( (LongMap!705 (underlying!363 Cell!704)) )
))
(declare-fun thiss!992 () LongMap!704)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!107 (array!4359 array!4361 (_ BitVec 32) (_ BitVec 32) V!3225 V!3225 (_ BitVec 64) (_ BitVec 32) Int) Unit!3310)

(assert (=> b!107330 (= lt!55036 (lemmaListMapContainsThenArrayContainsFrom!107 (_keys!4312 (v!2906 (underlying!363 thiss!992))) (_values!2585 (v!2906 (underlying!363 thiss!992))) (mask!6758 (v!2906 (underlying!363 thiss!992))) (extraKeys!2403 (v!2906 (underlying!363 thiss!992))) (zeroValue!2475 (v!2906 (underlying!363 thiss!992))) (minValue!2475 (v!2906 (underlying!363 thiss!992))) (select (arr!2067 (_keys!4312 (v!2906 (underlying!363 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2602 (v!2906 (underlying!363 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!107330 (arrayContainsKey!0 (_keys!4312 (v!2906 (underlying!363 thiss!992))) (select (arr!2067 (_keys!4312 (v!2906 (underlying!363 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!55042 () Unit!3310)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4359 (_ BitVec 32) (_ BitVec 32)) Unit!3310)

(assert (=> b!107330 (= lt!55042 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4312 (v!2906 (underlying!363 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1620 0))(
  ( (Nil!1617) (Cons!1616 (h!2214 (_ BitVec 64)) (t!5720 List!1620)) )
))
(declare-fun arrayNoDuplicates!0 (array!4359 (_ BitVec 32) List!1620) Bool)

(assert (=> b!107330 (arrayNoDuplicates!0 (_keys!4312 (v!2906 (underlying!363 thiss!992))) from!355 Nil!1617)))

(declare-fun lt!55038 () Unit!3310)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4359 (_ BitVec 32) (_ BitVec 64) List!1620) Unit!3310)

(assert (=> b!107330 (= lt!55038 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4312 (v!2906 (underlying!363 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2067 (_keys!4312 (v!2906 (underlying!363 thiss!992)))) from!355) (Cons!1616 (select (arr!2067 (_keys!4312 (v!2906 (underlying!363 thiss!992)))) from!355) Nil!1617)))))

(assert (=> b!107330 false))

(declare-fun mapIsEmpty!3949 () Bool)

(declare-fun mapRes!3950 () Bool)

(assert (=> mapIsEmpty!3949 mapRes!3950))

(declare-fun b!107331 () Bool)

(declare-fun e!69840 () Bool)

(declare-fun mapRes!3949 () Bool)

(assert (=> b!107331 (= e!69840 (and e!69833 mapRes!3949))))

(declare-fun condMapEmpty!3949 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!904)

(declare-fun mapDefault!3949 () ValueCell!998)

