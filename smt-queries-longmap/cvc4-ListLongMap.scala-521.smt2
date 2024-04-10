; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13120 () Bool)

(assert start!13120)

(declare-fun b!114899 () Bool)

(declare-fun b_free!2649 () Bool)

(declare-fun b_next!2649 () Bool)

(assert (=> b!114899 (= b_free!2649 (not b_next!2649))))

(declare-fun tp!10311 () Bool)

(declare-fun b_and!7103 () Bool)

(assert (=> b!114899 (= tp!10311 b_and!7103)))

(declare-fun b!114898 () Bool)

(declare-fun b_free!2651 () Bool)

(declare-fun b_next!2651 () Bool)

(assert (=> b!114898 (= b_free!2651 (not b_next!2651))))

(declare-fun tp!10312 () Bool)

(declare-fun b_and!7105 () Bool)

(assert (=> b!114898 (= tp!10312 b_and!7105)))

(declare-fun b!114887 () Bool)

(declare-datatypes ((Unit!3590 0))(
  ( (Unit!3591) )
))
(declare-fun e!74801 () Unit!3590)

(declare-fun Unit!3592 () Unit!3590)

(assert (=> b!114887 (= e!74801 Unit!3592)))

(declare-fun lt!59893 () Unit!3590)

(declare-datatypes ((V!3301 0))(
  ( (V!3302 (val!1415 Int)) )
))
(declare-datatypes ((array!4485 0))(
  ( (array!4486 (arr!2125 (Array (_ BitVec 32) (_ BitVec 64))) (size!2385 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1027 0))(
  ( (ValueCellFull!1027 (v!2999 V!3301)) (EmptyCell!1027) )
))
(declare-datatypes ((array!4487 0))(
  ( (array!4488 (arr!2126 (Array (_ BitVec 32) ValueCell!1027)) (size!2386 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!962 0))(
  ( (LongMapFixedSize!963 (defaultEntry!2690 Int) (mask!6888 (_ BitVec 32)) (extraKeys!2479 (_ BitVec 32)) (zeroValue!2557 V!3301) (minValue!2557 V!3301) (_size!530 (_ BitVec 32)) (_keys!4412 array!4485) (_values!2673 array!4487) (_vacant!530 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!762 0))(
  ( (Cell!763 (v!3000 LongMapFixedSize!962)) )
))
(declare-datatypes ((LongMap!762 0))(
  ( (LongMap!763 (underlying!392 Cell!762)) )
))
(declare-fun thiss!992 () LongMap!762)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!123 (array!4485 array!4487 (_ BitVec 32) (_ BitVec 32) V!3301 V!3301 (_ BitVec 64) (_ BitVec 32) Int) Unit!3590)

(assert (=> b!114887 (= lt!59893 (lemmaListMapContainsThenArrayContainsFrom!123 (_keys!4412 (v!3000 (underlying!392 thiss!992))) (_values!2673 (v!3000 (underlying!392 thiss!992))) (mask!6888 (v!3000 (underlying!392 thiss!992))) (extraKeys!2479 (v!3000 (underlying!392 thiss!992))) (zeroValue!2557 (v!3000 (underlying!392 thiss!992))) (minValue!2557 (v!3000 (underlying!392 thiss!992))) (select (arr!2125 (_keys!4412 (v!3000 (underlying!392 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2690 (v!3000 (underlying!392 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!114887 (arrayContainsKey!0 (_keys!4412 (v!3000 (underlying!392 thiss!992))) (select (arr!2125 (_keys!4412 (v!3000 (underlying!392 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59892 () Unit!3590)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4485 (_ BitVec 32) (_ BitVec 32)) Unit!3590)

(assert (=> b!114887 (= lt!59892 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4412 (v!3000 (underlying!392 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1658 0))(
  ( (Nil!1655) (Cons!1654 (h!2254 (_ BitVec 64)) (t!5900 List!1658)) )
))
(declare-fun arrayNoDuplicates!0 (array!4485 (_ BitVec 32) List!1658) Bool)

(assert (=> b!114887 (arrayNoDuplicates!0 (_keys!4412 (v!3000 (underlying!392 thiss!992))) from!355 Nil!1655)))

(declare-fun lt!59890 () Unit!3590)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4485 (_ BitVec 32) (_ BitVec 64) List!1658) Unit!3590)

(assert (=> b!114887 (= lt!59890 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4412 (v!3000 (underlying!392 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2125 (_keys!4412 (v!3000 (underlying!392 thiss!992)))) from!355) (Cons!1654 (select (arr!2125 (_keys!4412 (v!3000 (underlying!392 thiss!992)))) from!355) Nil!1655)))))

(assert (=> b!114887 false))

(declare-fun b!114888 () Bool)

(declare-fun e!74793 () Bool)

(declare-fun e!74802 () Bool)

(assert (=> b!114888 (= e!74793 e!74802)))

(declare-fun res!56488 () Bool)

(declare-fun e!74792 () Bool)

(assert (=> start!13120 (=> (not res!56488) (not e!74792))))

(declare-fun valid!454 (LongMap!762) Bool)

(assert (=> start!13120 (= res!56488 (valid!454 thiss!992))))

(assert (=> start!13120 e!74792))

(declare-fun e!74788 () Bool)

(assert (=> start!13120 e!74788))

(assert (=> start!13120 true))

(declare-fun e!74798 () Bool)

(assert (=> start!13120 e!74798))

(declare-fun b!114889 () Bool)

(declare-fun e!74797 () Bool)

(declare-fun e!74789 () Bool)

(declare-fun mapRes!4156 () Bool)

(assert (=> b!114889 (= e!74797 (and e!74789 mapRes!4156))))

(declare-fun condMapEmpty!4155 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!962)

(declare-fun mapDefault!4156 () ValueCell!1027)

