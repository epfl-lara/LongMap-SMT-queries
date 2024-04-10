; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15208 () Bool)

(assert start!15208)

(declare-fun b!146367 () Bool)

(declare-fun b_free!3121 () Bool)

(declare-fun b_next!3121 () Bool)

(assert (=> b!146367 (= b_free!3121 (not b_next!3121))))

(declare-fun tp!11865 () Bool)

(declare-fun b_and!9159 () Bool)

(assert (=> b!146367 (= tp!11865 b_and!9159)))

(declare-fun b!146369 () Bool)

(declare-fun b_free!3123 () Bool)

(declare-fun b_next!3123 () Bool)

(assert (=> b!146369 (= b_free!3123 (not b_next!3123))))

(declare-fun tp!11866 () Bool)

(declare-fun b_and!9161 () Bool)

(assert (=> b!146369 (= tp!11866 b_and!9161)))

(declare-fun b!146352 () Bool)

(declare-fun res!69638 () Bool)

(declare-fun e!95493 () Bool)

(assert (=> b!146352 (=> (not res!69638) (not e!95493))))

(declare-datatypes ((V!3617 0))(
  ( (V!3618 (val!1533 Int)) )
))
(declare-datatypes ((array!4999 0))(
  ( (array!5000 (arr!2361 (Array (_ BitVec 32) (_ BitVec 64))) (size!2637 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1145 0))(
  ( (ValueCellFull!1145 (v!3355 V!3617)) (EmptyCell!1145) )
))
(declare-datatypes ((array!5001 0))(
  ( (array!5002 (arr!2362 (Array (_ BitVec 32) ValueCell!1145)) (size!2638 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1198 0))(
  ( (LongMapFixedSize!1199 (defaultEntry!3015 Int) (mask!7393 (_ BitVec 32)) (extraKeys!2760 (_ BitVec 32)) (zeroValue!2860 V!3617) (minValue!2860 V!3617) (_size!648 (_ BitVec 32)) (_keys!4784 array!4999) (_values!2998 array!5001) (_vacant!648 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1198)

(declare-fun valid!582 (LongMapFixedSize!1198) Bool)

(assert (=> b!146352 (= res!69638 (valid!582 newMap!16))))

(declare-fun res!69639 () Bool)

(assert (=> start!15208 (=> (not res!69639) (not e!95493))))

(declare-datatypes ((Cell!980 0))(
  ( (Cell!981 (v!3356 LongMapFixedSize!1198)) )
))
(declare-datatypes ((LongMap!980 0))(
  ( (LongMap!981 (underlying!501 Cell!980)) )
))
(declare-fun thiss!992 () LongMap!980)

(declare-fun valid!583 (LongMap!980) Bool)

(assert (=> start!15208 (= res!69639 (valid!583 thiss!992))))

(assert (=> start!15208 e!95493))

(declare-fun e!95485 () Bool)

(assert (=> start!15208 e!95485))

(assert (=> start!15208 true))

(declare-fun e!95490 () Bool)

(assert (=> start!15208 e!95490))

(declare-fun mapIsEmpty!5003 () Bool)

(declare-fun mapRes!5003 () Bool)

(assert (=> mapIsEmpty!5003 mapRes!5003))

(declare-fun b!146353 () Bool)

(declare-datatypes ((Unit!4623 0))(
  ( (Unit!4624) )
))
(declare-fun e!95496 () Unit!4623)

(declare-fun Unit!4625 () Unit!4623)

(assert (=> b!146353 (= e!95496 Unit!4625)))

(declare-fun lt!76969 () Unit!4623)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!154 (array!4999 array!5001 (_ BitVec 32) (_ BitVec 32) V!3617 V!3617 (_ BitVec 64) (_ BitVec 32) Int) Unit!4623)

(assert (=> b!146353 (= lt!76969 (lemmaListMapContainsThenArrayContainsFrom!154 (_keys!4784 (v!3356 (underlying!501 thiss!992))) (_values!2998 (v!3356 (underlying!501 thiss!992))) (mask!7393 (v!3356 (underlying!501 thiss!992))) (extraKeys!2760 (v!3356 (underlying!501 thiss!992))) (zeroValue!2860 (v!3356 (underlying!501 thiss!992))) (minValue!2860 (v!3356 (underlying!501 thiss!992))) (select (arr!2361 (_keys!4784 (v!3356 (underlying!501 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3015 (v!3356 (underlying!501 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!146353 (arrayContainsKey!0 (_keys!4784 (v!3356 (underlying!501 thiss!992))) (select (arr!2361 (_keys!4784 (v!3356 (underlying!501 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76980 () Unit!4623)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4999 (_ BitVec 32) (_ BitVec 32)) Unit!4623)

(assert (=> b!146353 (= lt!76980 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4784 (v!3356 (underlying!501 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1779 0))(
  ( (Nil!1776) (Cons!1775 (h!2383 (_ BitVec 64)) (t!6484 List!1779)) )
))
(declare-fun arrayNoDuplicates!0 (array!4999 (_ BitVec 32) List!1779) Bool)

(assert (=> b!146353 (arrayNoDuplicates!0 (_keys!4784 (v!3356 (underlying!501 thiss!992))) from!355 Nil!1776)))

(declare-fun lt!76984 () Unit!4623)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4999 (_ BitVec 32) (_ BitVec 64) List!1779) Unit!4623)

(assert (=> b!146353 (= lt!76984 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4784 (v!3356 (underlying!501 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2361 (_keys!4784 (v!3356 (underlying!501 thiss!992)))) from!355) (Cons!1775 (select (arr!2361 (_keys!4784 (v!3356 (underlying!501 thiss!992)))) from!355) Nil!1776)))))

(assert (=> b!146353 false))

(declare-fun b!146354 () Bool)

(declare-fun e!95494 () Bool)

(declare-fun e!95492 () Bool)

(assert (=> b!146354 (= e!95494 e!95492)))

(declare-fun b!146355 () Bool)

(assert (=> b!146355 (= e!95485 e!95494)))

(declare-fun b!146356 () Bool)

(declare-fun e!95495 () Bool)

(declare-fun e!95497 () Bool)

(assert (=> b!146356 (= e!95495 e!95497)))

(declare-fun res!69636 () Bool)

(assert (=> b!146356 (=> (not res!69636) (not e!95497))))

(assert (=> b!146356 (= res!69636 (and (not (= (select (arr!2361 (_keys!4784 (v!3356 (underlying!501 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2361 (_keys!4784 (v!3356 (underlying!501 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!76975 () V!3617)

(declare-fun get!1573 (ValueCell!1145 V!3617) V!3617)

(declare-fun dynLambda!457 (Int (_ BitVec 64)) V!3617)

(assert (=> b!146356 (= lt!76975 (get!1573 (select (arr!2362 (_values!2998 (v!3356 (underlying!501 thiss!992)))) from!355) (dynLambda!457 (defaultEntry!3015 (v!3356 (underlying!501 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!5004 () Bool)

(declare-fun mapRes!5004 () Bool)

(assert (=> mapIsEmpty!5004 mapRes!5004))

(declare-fun b!146357 () Bool)

(declare-fun e!95489 () Bool)

(declare-fun e!95488 () Bool)

(assert (=> b!146357 (= e!95489 (and e!95488 mapRes!5003))))

(declare-fun condMapEmpty!5003 () Bool)

(declare-fun mapDefault!5004 () ValueCell!1145)

