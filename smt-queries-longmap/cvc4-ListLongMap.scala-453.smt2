; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8334 () Bool)

(assert start!8334)

(declare-fun b!55086 () Bool)

(declare-fun b_free!1833 () Bool)

(declare-fun b_next!1833 () Bool)

(assert (=> b!55086 (= b_free!1833 (not b_next!1833))))

(declare-fun tp!7602 () Bool)

(declare-fun b_and!3207 () Bool)

(assert (=> b!55086 (= tp!7602 b_and!3207)))

(declare-fun b!55085 () Bool)

(declare-fun b_free!1835 () Bool)

(declare-fun b_next!1835 () Bool)

(assert (=> b!55085 (= b_free!1835 (not b_next!1835))))

(declare-fun tp!7599 () Bool)

(declare-fun b_and!3209 () Bool)

(assert (=> b!55085 (= tp!7599 b_and!3209)))

(declare-fun tp_is_empty!2333 () Bool)

(declare-datatypes ((V!2757 0))(
  ( (V!2758 (val!1211 Int)) )
))
(declare-datatypes ((array!3589 0))(
  ( (array!3590 (arr!1717 (Array (_ BitVec 32) (_ BitVec 64))) (size!1946 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!823 0))(
  ( (ValueCellFull!823 (v!2308 V!2757)) (EmptyCell!823) )
))
(declare-datatypes ((array!3591 0))(
  ( (array!3592 (arr!1718 (Array (_ BitVec 32) ValueCell!823)) (size!1947 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!554 0))(
  ( (LongMapFixedSize!555 (defaultEntry!1991 Int) (mask!5844 (_ BitVec 32)) (extraKeys!1882 (_ BitVec 32)) (zeroValue!1909 V!2757) (minValue!1909 V!2757) (_size!326 (_ BitVec 32)) (_keys!3611 array!3589) (_values!1974 array!3591) (_vacant!326 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!554)

(declare-fun e!36134 () Bool)

(declare-fun e!36140 () Bool)

(declare-fun array_inv!1063 (array!3589) Bool)

(declare-fun array_inv!1064 (array!3591) Bool)

(assert (=> b!55085 (= e!36140 (and tp!7599 tp_is_empty!2333 (array_inv!1063 (_keys!3611 newMap!16)) (array_inv!1064 (_values!1974 newMap!16)) e!36134))))

(declare-fun mapNonEmpty!2669 () Bool)

(declare-fun mapRes!2669 () Bool)

(declare-fun tp!7601 () Bool)

(declare-fun e!36135 () Bool)

(assert (=> mapNonEmpty!2669 (= mapRes!2669 (and tp!7601 e!36135))))

(declare-fun mapKey!2669 () (_ BitVec 32))

(declare-fun mapRest!2669 () (Array (_ BitVec 32) ValueCell!823))

(declare-fun mapValue!2670 () ValueCell!823)

(assert (=> mapNonEmpty!2669 (= (arr!1718 (_values!1974 newMap!16)) (store mapRest!2669 mapKey!2669 mapValue!2670))))

(declare-fun e!36138 () Bool)

(declare-fun e!36143 () Bool)

(declare-datatypes ((Cell!370 0))(
  ( (Cell!371 (v!2309 LongMapFixedSize!554)) )
))
(declare-datatypes ((LongMap!370 0))(
  ( (LongMap!371 (underlying!196 Cell!370)) )
))
(declare-fun thiss!992 () LongMap!370)

(assert (=> b!55086 (= e!36143 (and tp!7602 tp_is_empty!2333 (array_inv!1063 (_keys!3611 (v!2309 (underlying!196 thiss!992)))) (array_inv!1064 (_values!1974 (v!2309 (underlying!196 thiss!992)))) e!36138))))

(declare-fun b!55087 () Bool)

(declare-fun e!36136 () Bool)

(declare-fun e!36141 () Bool)

(assert (=> b!55087 (= e!36136 e!36141)))

(declare-fun b!55088 () Bool)

(declare-fun res!31065 () Bool)

(declare-fun e!36129 () Bool)

(assert (=> b!55088 (=> (not res!31065) (not e!36129))))

(declare-fun valid!218 (LongMapFixedSize!554) Bool)

(assert (=> b!55088 (= res!31065 (valid!218 newMap!16))))

(declare-fun mapNonEmpty!2670 () Bool)

(declare-fun mapRes!2670 () Bool)

(declare-fun tp!7600 () Bool)

(declare-fun e!36137 () Bool)

(assert (=> mapNonEmpty!2670 (= mapRes!2670 (and tp!7600 e!36137))))

(declare-fun mapRest!2670 () (Array (_ BitVec 32) ValueCell!823))

(declare-fun mapValue!2669 () ValueCell!823)

(declare-fun mapKey!2670 () (_ BitVec 32))

(assert (=> mapNonEmpty!2670 (= (arr!1718 (_values!1974 (v!2309 (underlying!196 thiss!992)))) (store mapRest!2670 mapKey!2670 mapValue!2669))))

(declare-fun b!55089 () Bool)

(assert (=> b!55089 (= e!36141 e!36143)))

(declare-fun b!55090 () Bool)

(assert (=> b!55090 (= e!36137 tp_is_empty!2333)))

(declare-fun b!55091 () Bool)

(declare-fun e!36130 () Bool)

(assert (=> b!55091 (= e!36130 tp_is_empty!2333)))

(declare-fun res!31070 () Bool)

(assert (=> start!8334 (=> (not res!31070) (not e!36129))))

(declare-fun valid!219 (LongMap!370) Bool)

(assert (=> start!8334 (= res!31070 (valid!219 thiss!992))))

(assert (=> start!8334 e!36129))

(assert (=> start!8334 e!36136))

(assert (=> start!8334 true))

(assert (=> start!8334 e!36140))

(declare-fun b!55092 () Bool)

(declare-fun e!36133 () Bool)

(assert (=> b!55092 (= e!36133 tp_is_empty!2333)))

(declare-fun b!55093 () Bool)

(declare-fun res!31069 () Bool)

(assert (=> b!55093 (=> (not res!31069) (not e!36129))))

(assert (=> b!55093 (= res!31069 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5844 newMap!16)) (_size!326 (v!2309 (underlying!196 thiss!992)))))))

(declare-fun b!55094 () Bool)

(declare-fun e!36132 () Bool)

(declare-fun e!36131 () Bool)

(assert (=> b!55094 (= e!36132 e!36131)))

(declare-fun res!31064 () Bool)

(assert (=> b!55094 (=> (not res!31064) (not e!36131))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!1954 0))(
  ( (tuple2!1955 (_1!988 (_ BitVec 64)) (_2!988 V!2757)) )
))
(declare-datatypes ((List!1389 0))(
  ( (Nil!1386) (Cons!1385 (h!1965 tuple2!1954) (t!4591 List!1389)) )
))
(declare-datatypes ((ListLongMap!1325 0))(
  ( (ListLongMap!1326 (toList!678 List!1389)) )
))
(declare-fun lt!21834 () ListLongMap!1325)

(declare-fun contains!651 (ListLongMap!1325 (_ BitVec 64)) Bool)

(assert (=> b!55094 (= res!31064 (contains!651 lt!21834 (select (arr!1717 (_keys!3611 (v!2309 (underlying!196 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1956 0))(
  ( (tuple2!1957 (_1!989 Bool) (_2!989 LongMapFixedSize!554)) )
))
(declare-fun lt!21832 () tuple2!1956)

(declare-fun update!59 (LongMapFixedSize!554 (_ BitVec 64) V!2757) tuple2!1956)

(declare-fun get!1025 (ValueCell!823 V!2757) V!2757)

(declare-fun dynLambda!290 (Int (_ BitVec 64)) V!2757)

(assert (=> b!55094 (= lt!21832 (update!59 newMap!16 (select (arr!1717 (_keys!3611 (v!2309 (underlying!196 thiss!992)))) from!355) (get!1025 (select (arr!1718 (_values!1974 (v!2309 (underlying!196 thiss!992)))) from!355) (dynLambda!290 (defaultEntry!1991 (v!2309 (underlying!196 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!55095 () Bool)

(declare-fun res!31068 () Bool)

(assert (=> b!55095 (=> (not res!31068) (not e!36129))))

(assert (=> b!55095 (= res!31068 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1946 (_keys!3611 (v!2309 (underlying!196 thiss!992)))))))))

(declare-fun b!55096 () Bool)

(assert (=> b!55096 (= e!36134 (and e!36133 mapRes!2669))))

(declare-fun condMapEmpty!2669 () Bool)

(declare-fun mapDefault!2669 () ValueCell!823)

