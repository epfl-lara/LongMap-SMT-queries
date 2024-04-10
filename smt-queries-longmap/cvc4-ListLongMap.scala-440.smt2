; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8256 () Bool)

(assert start!8256)

(declare-fun b!52707 () Bool)

(declare-fun b_free!1677 () Bool)

(declare-fun b_next!1677 () Bool)

(assert (=> b!52707 (= b_free!1677 (not b_next!1677))))

(declare-fun tp!7133 () Bool)

(declare-fun b_and!2895 () Bool)

(assert (=> b!52707 (= tp!7133 b_and!2895)))

(declare-fun b!52691 () Bool)

(declare-fun b_free!1679 () Bool)

(declare-fun b_next!1679 () Bool)

(assert (=> b!52691 (= b_free!1679 (not b_next!1679))))

(declare-fun tp!7132 () Bool)

(declare-fun b_and!2897 () Bool)

(assert (=> b!52691 (= tp!7132 b_and!2897)))

(declare-fun b!52690 () Bool)

(declare-fun res!29920 () Bool)

(declare-fun e!34340 () Bool)

(assert (=> b!52690 (=> (not res!29920) (not e!34340))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!2653 0))(
  ( (V!2654 (val!1172 Int)) )
))
(declare-datatypes ((array!3433 0))(
  ( (array!3434 (arr!1639 (Array (_ BitVec 32) (_ BitVec 64))) (size!1868 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!784 0))(
  ( (ValueCellFull!784 (v!2233 V!2653)) (EmptyCell!784) )
))
(declare-datatypes ((array!3435 0))(
  ( (array!3436 (arr!1640 (Array (_ BitVec 32) ValueCell!784)) (size!1869 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!476 0))(
  ( (LongMapFixedSize!477 (defaultEntry!1952 Int) (mask!5779 (_ BitVec 32)) (extraKeys!1843 (_ BitVec 32)) (zeroValue!1870 V!2653) (minValue!1870 V!2653) (_size!287 (_ BitVec 32)) (_keys!3572 array!3433) (_values!1935 array!3435) (_vacant!287 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!298 0))(
  ( (Cell!299 (v!2234 LongMapFixedSize!476)) )
))
(declare-datatypes ((LongMap!298 0))(
  ( (LongMap!299 (underlying!160 Cell!298)) )
))
(declare-fun thiss!992 () LongMap!298)

(assert (=> b!52690 (= res!29920 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1868 (_keys!3572 (v!2234 (underlying!160 thiss!992)))))))))

(declare-fun res!29918 () Bool)

(assert (=> start!8256 (=> (not res!29918) (not e!34340))))

(declare-fun valid!175 (LongMap!298) Bool)

(assert (=> start!8256 (= res!29918 (valid!175 thiss!992))))

(assert (=> start!8256 e!34340))

(declare-fun e!34345 () Bool)

(assert (=> start!8256 e!34345))

(assert (=> start!8256 true))

(declare-fun e!34347 () Bool)

(assert (=> start!8256 e!34347))

(declare-fun tp_is_empty!2255 () Bool)

(declare-fun e!34344 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!476)

(declare-fun array_inv!1013 (array!3433) Bool)

(declare-fun array_inv!1014 (array!3435) Bool)

(assert (=> b!52691 (= e!34347 (and tp!7132 tp_is_empty!2255 (array_inv!1013 (_keys!3572 newMap!16)) (array_inv!1014 (_values!1935 newMap!16)) e!34344))))

(declare-fun b!52692 () Bool)

(declare-fun e!34346 () Bool)

(declare-fun e!34341 () Bool)

(assert (=> b!52692 (= e!34346 e!34341)))

(declare-fun res!29923 () Bool)

(assert (=> b!52692 (=> (not res!29923) (not e!34341))))

(declare-datatypes ((tuple2!1856 0))(
  ( (tuple2!1857 (_1!939 (_ BitVec 64)) (_2!939 V!2653)) )
))
(declare-datatypes ((List!1344 0))(
  ( (Nil!1341) (Cons!1340 (h!1920 tuple2!1856) (t!4390 List!1344)) )
))
(declare-datatypes ((ListLongMap!1269 0))(
  ( (ListLongMap!1270 (toList!650 List!1344)) )
))
(declare-fun lt!21327 () ListLongMap!1269)

(declare-fun contains!626 (ListLongMap!1269 (_ BitVec 64)) Bool)

(assert (=> b!52692 (= res!29923 (contains!626 lt!21327 (select (arr!1639 (_keys!3572 (v!2234 (underlying!160 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1858 0))(
  ( (tuple2!1859 (_1!940 Bool) (_2!940 LongMapFixedSize!476)) )
))
(declare-fun lt!21329 () tuple2!1858)

(declare-fun update!38 (LongMapFixedSize!476 (_ BitVec 64) V!2653) tuple2!1858)

(declare-fun get!978 (ValueCell!784 V!2653) V!2653)

(declare-fun dynLambda!269 (Int (_ BitVec 64)) V!2653)

(assert (=> b!52692 (= lt!21329 (update!38 newMap!16 (select (arr!1639 (_keys!3572 (v!2234 (underlying!160 thiss!992)))) from!355) (get!978 (select (arr!1640 (_values!1935 (v!2234 (underlying!160 thiss!992)))) from!355) (dynLambda!269 (defaultEntry!1952 (v!2234 (underlying!160 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!52693 () Bool)

(declare-fun res!29924 () Bool)

(assert (=> b!52693 (=> (not res!29924) (not e!34341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!52693 (= res!29924 (validMask!0 (mask!5779 (v!2234 (underlying!160 thiss!992)))))))

(declare-fun b!52694 () Bool)

(declare-fun res!29919 () Bool)

(assert (=> b!52694 (=> (not res!29919) (not e!34340))))

(declare-fun valid!176 (LongMapFixedSize!476) Bool)

(assert (=> b!52694 (= res!29919 (valid!176 newMap!16))))

(declare-fun b!52695 () Bool)

(declare-fun e!34351 () Bool)

(declare-fun e!34342 () Bool)

(declare-fun mapRes!2436 () Bool)

(assert (=> b!52695 (= e!34351 (and e!34342 mapRes!2436))))

(declare-fun condMapEmpty!2435 () Bool)

(declare-fun mapDefault!2436 () ValueCell!784)

