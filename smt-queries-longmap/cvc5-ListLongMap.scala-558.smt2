; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15190 () Bool)

(assert start!15190)

(declare-fun b!145854 () Bool)

(declare-fun b_free!3085 () Bool)

(declare-fun b_next!3085 () Bool)

(assert (=> b!145854 (= b_free!3085 (not b_next!3085))))

(declare-fun tp!11757 () Bool)

(declare-fun b_and!9087 () Bool)

(assert (=> b!145854 (= tp!11757 b_and!9087)))

(declare-fun b!145855 () Bool)

(declare-fun b_free!3087 () Bool)

(declare-fun b_next!3087 () Bool)

(assert (=> b!145855 (= b_free!3087 (not b_next!3087))))

(declare-fun tp!11758 () Bool)

(declare-fun b_and!9089 () Bool)

(assert (=> b!145855 (= tp!11758 b_and!9089)))

(declare-fun mapNonEmpty!4949 () Bool)

(declare-fun mapRes!4950 () Bool)

(declare-fun tp!11760 () Bool)

(declare-fun e!95058 () Bool)

(assert (=> mapNonEmpty!4949 (= mapRes!4950 (and tp!11760 e!95058))))

(declare-datatypes ((V!3593 0))(
  ( (V!3594 (val!1524 Int)) )
))
(declare-datatypes ((ValueCell!1136 0))(
  ( (ValueCellFull!1136 (v!3338 V!3593)) (EmptyCell!1136) )
))
(declare-fun mapRest!4949 () (Array (_ BitVec 32) ValueCell!1136))

(declare-datatypes ((array!4963 0))(
  ( (array!4964 (arr!2343 (Array (_ BitVec 32) (_ BitVec 64))) (size!2619 (_ BitVec 32))) )
))
(declare-datatypes ((array!4965 0))(
  ( (array!4966 (arr!2344 (Array (_ BitVec 32) ValueCell!1136)) (size!2620 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1180 0))(
  ( (LongMapFixedSize!1181 (defaultEntry!3006 Int) (mask!7378 (_ BitVec 32)) (extraKeys!2751 (_ BitVec 32)) (zeroValue!2851 V!3593) (minValue!2851 V!3593) (_size!639 (_ BitVec 32)) (_keys!4775 array!4963) (_values!2989 array!4965) (_vacant!639 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1180)

(declare-fun mapValue!4949 () ValueCell!1136)

(declare-fun mapKey!4949 () (_ BitVec 32))

(assert (=> mapNonEmpty!4949 (= (arr!2344 (_values!2989 newMap!16)) (store mapRest!4949 mapKey!4949 mapValue!4949))))

(declare-fun b!145849 () Bool)

(declare-fun e!95051 () Bool)

(declare-fun e!95045 () Bool)

(assert (=> b!145849 (= e!95051 e!95045)))

(declare-fun res!69461 () Bool)

(assert (=> b!145849 (=> (not res!69461) (not e!95045))))

(declare-datatypes ((Cell!964 0))(
  ( (Cell!965 (v!3339 LongMapFixedSize!1180)) )
))
(declare-datatypes ((LongMap!964 0))(
  ( (LongMap!965 (underlying!493 Cell!964)) )
))
(declare-fun thiss!992 () LongMap!964)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2742 0))(
  ( (tuple2!2743 (_1!1382 (_ BitVec 64)) (_2!1382 V!3593)) )
))
(declare-datatypes ((List!1768 0))(
  ( (Nil!1765) (Cons!1764 (h!2372 tuple2!2742) (t!6437 List!1768)) )
))
(declare-datatypes ((ListLongMap!1767 0))(
  ( (ListLongMap!1768 (toList!899 List!1768)) )
))
(declare-fun lt!76710 () ListLongMap!1767)

(declare-fun contains!947 (ListLongMap!1767 (_ BitVec 64)) Bool)

(assert (=> b!145849 (= res!69461 (contains!947 lt!76710 (select (arr!2343 (_keys!4775 (v!3339 (underlying!493 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2744 0))(
  ( (tuple2!2745 (_1!1383 Bool) (_2!1383 LongMapFixedSize!1180)) )
))
(declare-fun lt!76713 () tuple2!2744)

(declare-fun update!222 (LongMapFixedSize!1180 (_ BitVec 64) V!3593) tuple2!2744)

(declare-fun get!1563 (ValueCell!1136 V!3593) V!3593)

(declare-fun dynLambda!453 (Int (_ BitVec 64)) V!3593)

(assert (=> b!145849 (= lt!76713 (update!222 newMap!16 (select (arr!2343 (_keys!4775 (v!3339 (underlying!493 thiss!992)))) from!355) (get!1563 (select (arr!2344 (_values!2989 (v!3339 (underlying!493 thiss!992)))) from!355) (dynLambda!453 (defaultEntry!3006 (v!3339 (underlying!493 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!145850 () Bool)

(assert (=> b!145850 (= e!95045 (not true))))

(assert (=> b!145850 false))

(declare-datatypes ((Unit!4608 0))(
  ( (Unit!4609) )
))
(declare-fun lt!76715 () Unit!4608)

(declare-datatypes ((List!1769 0))(
  ( (Nil!1766) (Cons!1765 (h!2373 (_ BitVec 64)) (t!6438 List!1769)) )
))
(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4963 (_ BitVec 32) (_ BitVec 64) List!1769) Unit!4608)

(assert (=> b!145850 (= lt!76715 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4775 (v!3339 (underlying!493 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2343 (_keys!4775 (v!3339 (underlying!493 thiss!992)))) from!355) (Cons!1765 (select (arr!2343 (_keys!4775 (v!3339 (underlying!493 thiss!992)))) from!355) Nil!1766)))))

(declare-fun arrayNoDuplicates!0 (array!4963 (_ BitVec 32) List!1769) Bool)

(assert (=> b!145850 (arrayNoDuplicates!0 (_keys!4775 (v!3339 (underlying!493 thiss!992))) from!355 Nil!1766)))

(declare-fun lt!76714 () Unit!4608)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4963 (_ BitVec 32) (_ BitVec 32)) Unit!4608)

(assert (=> b!145850 (= lt!76714 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4775 (v!3339 (underlying!493 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145850 (arrayContainsKey!0 (_keys!4775 (v!3339 (underlying!493 thiss!992))) (select (arr!2343 (_keys!4775 (v!3339 (underlying!493 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76711 () Unit!4608)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!149 (array!4963 array!4965 (_ BitVec 32) (_ BitVec 32) V!3593 V!3593 (_ BitVec 64) (_ BitVec 32) Int) Unit!4608)

(assert (=> b!145850 (= lt!76711 (lemmaListMapContainsThenArrayContainsFrom!149 (_keys!4775 (v!3339 (underlying!493 thiss!992))) (_values!2989 (v!3339 (underlying!493 thiss!992))) (mask!7378 (v!3339 (underlying!493 thiss!992))) (extraKeys!2751 (v!3339 (underlying!493 thiss!992))) (zeroValue!2851 (v!3339 (underlying!493 thiss!992))) (minValue!2851 (v!3339 (underlying!493 thiss!992))) (select (arr!2343 (_keys!4775 (v!3339 (underlying!493 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3006 (v!3339 (underlying!493 thiss!992)))))))

(declare-fun b!145851 () Bool)

(declare-fun res!69459 () Bool)

(declare-fun e!95050 () Bool)

(assert (=> b!145851 (=> (not res!69459) (not e!95050))))

(assert (=> b!145851 (= res!69459 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2619 (_keys!4775 (v!3339 (underlying!493 thiss!992)))))))))

(declare-fun b!145852 () Bool)

(declare-fun e!95052 () Bool)

(declare-fun e!95055 () Bool)

(declare-fun mapRes!4949 () Bool)

(assert (=> b!145852 (= e!95052 (and e!95055 mapRes!4949))))

(declare-fun condMapEmpty!4949 () Bool)

(declare-fun mapDefault!4949 () ValueCell!1136)

