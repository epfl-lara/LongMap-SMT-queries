; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12044 () Bool)

(assert start!12044)

(declare-fun b!101579 () Bool)

(declare-fun b_free!2469 () Bool)

(declare-fun b_next!2469 () Bool)

(assert (=> b!101579 (= b_free!2469 (not b_next!2469))))

(declare-fun tp!9712 () Bool)

(declare-fun b_and!6259 () Bool)

(assert (=> b!101579 (= tp!9712 b_and!6259)))

(declare-fun b!101567 () Bool)

(declare-fun b_free!2471 () Bool)

(declare-fun b_next!2471 () Bool)

(assert (=> b!101567 (= b_free!2471 (not b_next!2471))))

(declare-fun tp!9711 () Bool)

(declare-fun b_and!6261 () Bool)

(assert (=> b!101567 (= tp!9711 b_and!6261)))

(declare-fun mapIsEmpty!3827 () Bool)

(declare-fun mapRes!3828 () Bool)

(assert (=> mapIsEmpty!3827 mapRes!3828))

(declare-fun mapIsEmpty!3828 () Bool)

(declare-fun mapRes!3827 () Bool)

(assert (=> mapIsEmpty!3828 mapRes!3827))

(declare-fun b!101562 () Bool)

(declare-fun res!50874 () Bool)

(declare-fun e!66135 () Bool)

(assert (=> b!101562 (=> (not res!50874) (not e!66135))))

(declare-datatypes ((V!3181 0))(
  ( (V!3182 (val!1370 Int)) )
))
(declare-datatypes ((array!4287 0))(
  ( (array!4288 (arr!2035 (Array (_ BitVec 32) (_ BitVec 64))) (size!2288 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!982 0))(
  ( (ValueCellFull!982 (v!2845 V!3181)) (EmptyCell!982) )
))
(declare-datatypes ((array!4289 0))(
  ( (array!4290 (arr!2036 (Array (_ BitVec 32) ValueCell!982)) (size!2289 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!872 0))(
  ( (LongMapFixedSize!873 (defaultEntry!2537 Int) (mask!6660 (_ BitVec 32)) (extraKeys!2348 (_ BitVec 32)) (zeroValue!2415 V!3181) (minValue!2415 V!3181) (_size!485 (_ BitVec 32)) (_keys!4237 array!4287) (_values!2520 array!4289) (_vacant!485 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!672 0))(
  ( (Cell!673 (v!2846 LongMapFixedSize!872)) )
))
(declare-datatypes ((LongMap!672 0))(
  ( (LongMap!673 (underlying!347 Cell!672)) )
))
(declare-fun thiss!992 () LongMap!672)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!101562 (= res!50874 (validMask!0 (mask!6660 (v!2846 (underlying!347 thiss!992)))))))

(declare-fun b!101563 () Bool)

(declare-datatypes ((Unit!3092 0))(
  ( (Unit!3093) )
))
(declare-fun e!66139 () Unit!3092)

(declare-fun Unit!3094 () Unit!3092)

(assert (=> b!101563 (= e!66139 Unit!3094)))

(declare-fun lt!51504 () Unit!3092)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!95 (array!4287 array!4289 (_ BitVec 32) (_ BitVec 32) V!3181 V!3181 (_ BitVec 64) (_ BitVec 32) Int) Unit!3092)

(assert (=> b!101563 (= lt!51504 (lemmaListMapContainsThenArrayContainsFrom!95 (_keys!4237 (v!2846 (underlying!347 thiss!992))) (_values!2520 (v!2846 (underlying!347 thiss!992))) (mask!6660 (v!2846 (underlying!347 thiss!992))) (extraKeys!2348 (v!2846 (underlying!347 thiss!992))) (zeroValue!2415 (v!2846 (underlying!347 thiss!992))) (minValue!2415 (v!2846 (underlying!347 thiss!992))) (select (arr!2035 (_keys!4237 (v!2846 (underlying!347 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2537 (v!2846 (underlying!347 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!101563 (arrayContainsKey!0 (_keys!4237 (v!2846 (underlying!347 thiss!992))) (select (arr!2035 (_keys!4237 (v!2846 (underlying!347 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!51501 () Unit!3092)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4287 (_ BitVec 32) (_ BitVec 32)) Unit!3092)

(assert (=> b!101563 (= lt!51501 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4237 (v!2846 (underlying!347 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1594 0))(
  ( (Nil!1591) (Cons!1590 (h!2186 (_ BitVec 64)) (t!5608 List!1594)) )
))
(declare-fun arrayNoDuplicates!0 (array!4287 (_ BitVec 32) List!1594) Bool)

(assert (=> b!101563 (arrayNoDuplicates!0 (_keys!4237 (v!2846 (underlying!347 thiss!992))) from!355 Nil!1591)))

(declare-fun lt!51502 () Unit!3092)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4287 (_ BitVec 32) (_ BitVec 64) List!1594) Unit!3092)

(assert (=> b!101563 (= lt!51502 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4237 (v!2846 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2035 (_keys!4237 (v!2846 (underlying!347 thiss!992)))) from!355) (Cons!1590 (select (arr!2035 (_keys!4237 (v!2846 (underlying!347 thiss!992)))) from!355) Nil!1591)))))

(assert (=> b!101563 false))

(declare-fun b!101564 () Bool)

(declare-fun res!50875 () Bool)

(assert (=> b!101564 (=> (not res!50875) (not e!66135))))

(assert (=> b!101564 (= res!50875 (and (= (size!2289 (_values!2520 (v!2846 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6660 (v!2846 (underlying!347 thiss!992))))) (= (size!2288 (_keys!4237 (v!2846 (underlying!347 thiss!992)))) (size!2289 (_values!2520 (v!2846 (underlying!347 thiss!992))))) (bvsge (mask!6660 (v!2846 (underlying!347 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2348 (v!2846 (underlying!347 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2348 (v!2846 (underlying!347 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!101565 () Bool)

(declare-fun e!66129 () Bool)

(declare-fun tp_is_empty!2651 () Bool)

(assert (=> b!101565 (= e!66129 tp_is_empty!2651)))

(declare-fun mapNonEmpty!3827 () Bool)

(declare-fun tp!9713 () Bool)

(declare-fun e!66137 () Bool)

(assert (=> mapNonEmpty!3827 (= mapRes!3827 (and tp!9713 e!66137))))

(declare-fun mapKey!3827 () (_ BitVec 32))

(declare-fun mapValue!3827 () ValueCell!982)

(declare-fun mapRest!3827 () (Array (_ BitVec 32) ValueCell!982))

(assert (=> mapNonEmpty!3827 (= (arr!2036 (_values!2520 (v!2846 (underlying!347 thiss!992)))) (store mapRest!3827 mapKey!3827 mapValue!3827))))

(declare-fun b!101566 () Bool)

(declare-fun Unit!3095 () Unit!3092)

(assert (=> b!101566 (= e!66139 Unit!3095)))

(declare-fun e!66132 () Bool)

(declare-fun e!66126 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!872)

(declare-fun array_inv!1273 (array!4287) Bool)

(declare-fun array_inv!1274 (array!4289) Bool)

(assert (=> b!101567 (= e!66132 (and tp!9711 tp_is_empty!2651 (array_inv!1273 (_keys!4237 newMap!16)) (array_inv!1274 (_values!2520 newMap!16)) e!66126))))

(declare-fun b!101568 () Bool)

(declare-fun e!66140 () Bool)

(assert (=> b!101568 (= e!66140 tp_is_empty!2651)))

(declare-fun b!101569 () Bool)

(declare-fun res!50882 () Bool)

(declare-fun e!66130 () Bool)

(assert (=> b!101569 (=> (not res!50882) (not e!66130))))

(assert (=> b!101569 (= res!50882 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2288 (_keys!4237 (v!2846 (underlying!347 thiss!992)))))))))

(declare-fun b!101570 () Bool)

(declare-fun res!50876 () Bool)

(assert (=> b!101570 (=> (not res!50876) (not e!66135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4287 (_ BitVec 32)) Bool)

(assert (=> b!101570 (= res!50876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4237 (v!2846 (underlying!347 thiss!992))) (mask!6660 (v!2846 (underlying!347 thiss!992)))))))

(declare-fun b!101571 () Bool)

(declare-fun e!66136 () Bool)

(assert (=> b!101571 (= e!66136 tp_is_empty!2651)))

(declare-fun b!101572 () Bool)

(assert (=> b!101572 (= e!66137 tp_is_empty!2651)))

(declare-fun b!101573 () Bool)

(declare-fun res!50878 () Bool)

(assert (=> b!101573 (=> (not res!50878) (not e!66130))))

(declare-fun valid!399 (LongMapFixedSize!872) Bool)

(assert (=> b!101573 (= res!50878 (valid!399 newMap!16))))

(declare-fun res!50880 () Bool)

(assert (=> start!12044 (=> (not res!50880) (not e!66130))))

(declare-fun valid!400 (LongMap!672) Bool)

(assert (=> start!12044 (= res!50880 (valid!400 thiss!992))))

(assert (=> start!12044 e!66130))

(declare-fun e!66125 () Bool)

(assert (=> start!12044 e!66125))

(assert (=> start!12044 true))

(assert (=> start!12044 e!66132))

(declare-fun b!101574 () Bool)

(declare-fun e!66134 () Bool)

(declare-fun e!66133 () Bool)

(assert (=> b!101574 (= e!66134 e!66133)))

(declare-fun b!101575 () Bool)

(assert (=> b!101575 (= e!66126 (and e!66140 mapRes!3828))))

(declare-fun condMapEmpty!3827 () Bool)

(declare-fun mapDefault!3828 () ValueCell!982)

