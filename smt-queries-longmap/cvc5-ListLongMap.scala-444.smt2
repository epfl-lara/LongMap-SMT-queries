; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8276 () Bool)

(assert start!8276)

(declare-fun b!53342 () Bool)

(declare-fun b_free!1717 () Bool)

(declare-fun b_next!1717 () Bool)

(assert (=> b!53342 (= b_free!1717 (not b_next!1717))))

(declare-fun tp!7251 () Bool)

(declare-fun b_and!2975 () Bool)

(assert (=> b!53342 (= tp!7251 b_and!2975)))

(declare-fun b!53357 () Bool)

(declare-fun b_free!1719 () Bool)

(declare-fun b_next!1719 () Bool)

(assert (=> b!53357 (= b_free!1719 (not b_next!1719))))

(declare-fun tp!7252 () Bool)

(declare-fun b_and!2977 () Bool)

(assert (=> b!53357 (= tp!7252 b_and!2977)))

(declare-fun b!53340 () Bool)

(declare-fun e!34793 () Bool)

(declare-fun tp_is_empty!2275 () Bool)

(assert (=> b!53340 (= e!34793 tp_is_empty!2275)))

(declare-fun b!53341 () Bool)

(declare-fun res!30257 () Bool)

(declare-fun e!34802 () Bool)

(assert (=> b!53341 (=> (not res!30257) (not e!34802))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!2681 0))(
  ( (V!2682 (val!1182 Int)) )
))
(declare-datatypes ((array!3473 0))(
  ( (array!3474 (arr!1659 (Array (_ BitVec 32) (_ BitVec 64))) (size!1888 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!794 0))(
  ( (ValueCellFull!794 (v!2252 V!2681)) (EmptyCell!794) )
))
(declare-datatypes ((array!3475 0))(
  ( (array!3476 (arr!1660 (Array (_ BitVec 32) ValueCell!794)) (size!1889 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!496 0))(
  ( (LongMapFixedSize!497 (defaultEntry!1962 Int) (mask!5797 (_ BitVec 32)) (extraKeys!1853 (_ BitVec 32)) (zeroValue!1880 V!2681) (minValue!1880 V!2681) (_size!297 (_ BitVec 32)) (_keys!3582 array!3473) (_values!1945 array!3475) (_vacant!297 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!316 0))(
  ( (Cell!317 (v!2253 LongMapFixedSize!496)) )
))
(declare-datatypes ((LongMap!316 0))(
  ( (LongMap!317 (underlying!169 Cell!316)) )
))
(declare-fun thiss!992 () LongMap!316)

(assert (=> b!53341 (= res!30257 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1888 (_keys!3582 (v!2253 (underlying!169 thiss!992)))))))))

(declare-fun e!34798 () Bool)

(declare-fun e!34792 () Bool)

(declare-fun array_inv!1027 (array!3473) Bool)

(declare-fun array_inv!1028 (array!3475) Bool)

(assert (=> b!53342 (= e!34792 (and tp!7251 tp_is_empty!2275 (array_inv!1027 (_keys!3582 (v!2253 (underlying!169 thiss!992)))) (array_inv!1028 (_values!1945 (v!2253 (underlying!169 thiss!992)))) e!34798))))

(declare-fun b!53343 () Bool)

(declare-fun e!34791 () Bool)

(assert (=> b!53343 (= e!34791 false)))

(declare-datatypes ((tuple2!1882 0))(
  ( (tuple2!1883 (_1!952 (_ BitVec 64)) (_2!952 V!2681)) )
))
(declare-datatypes ((List!1356 0))(
  ( (Nil!1353) (Cons!1352 (h!1932 tuple2!1882) (t!4442 List!1356)) )
))
(declare-datatypes ((ListLongMap!1285 0))(
  ( (ListLongMap!1286 (toList!658 List!1356)) )
))
(declare-fun lt!21449 () ListLongMap!1285)

(declare-fun lt!21450 () Bool)

(declare-fun contains!633 (ListLongMap!1285 (_ BitVec 64)) Bool)

(assert (=> b!53343 (= lt!21450 (contains!633 lt!21449 (select (arr!1659 (_keys!3582 (v!2253 (underlying!169 thiss!992)))) from!355)))))

(declare-fun b!53344 () Bool)

(declare-fun res!30250 () Bool)

(assert (=> b!53344 (=> (not res!30250) (not e!34802))))

(declare-fun newMap!16 () LongMapFixedSize!496)

(assert (=> b!53344 (= res!30250 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5797 newMap!16)) (_size!297 (v!2253 (underlying!169 thiss!992)))))))

(declare-fun b!53345 () Bool)

(declare-fun res!30248 () Bool)

(assert (=> b!53345 (=> (not res!30248) (not e!34791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53345 (= res!30248 (validMask!0 (mask!5797 (v!2253 (underlying!169 thiss!992)))))))

(declare-fun b!53346 () Bool)

(declare-fun e!34800 () Bool)

(declare-fun mapRes!2496 () Bool)

(assert (=> b!53346 (= e!34798 (and e!34800 mapRes!2496))))

(declare-fun condMapEmpty!2495 () Bool)

(declare-fun mapDefault!2495 () ValueCell!794)

