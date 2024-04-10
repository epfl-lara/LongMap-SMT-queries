; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8324 () Bool)

(assert start!8324)

(declare-fun b!54831 () Bool)

(declare-fun b_free!1813 () Bool)

(declare-fun b_next!1813 () Bool)

(assert (=> b!54831 (= b_free!1813 (not b_next!1813))))

(declare-fun tp!7541 () Bool)

(declare-fun b_and!3167 () Bool)

(assert (=> b!54831 (= tp!7541 b_and!3167)))

(declare-fun b!54824 () Bool)

(declare-fun b_free!1815 () Bool)

(declare-fun b_next!1815 () Bool)

(assert (=> b!54824 (= b_free!1815 (not b_next!1815))))

(declare-fun tp!7540 () Bool)

(declare-fun b_and!3169 () Bool)

(assert (=> b!54824 (= tp!7540 b_and!3169)))

(declare-fun b!54820 () Bool)

(declare-fun e!35889 () Bool)

(declare-fun e!35899 () Bool)

(assert (=> b!54820 (= e!35889 e!35899)))

(declare-fun res!30964 () Bool)

(assert (=> b!54820 (=> (not res!30964) (not e!35899))))

(declare-datatypes ((V!2745 0))(
  ( (V!2746 (val!1206 Int)) )
))
(declare-datatypes ((array!3569 0))(
  ( (array!3570 (arr!1707 (Array (_ BitVec 32) (_ BitVec 64))) (size!1936 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!818 0))(
  ( (ValueCellFull!818 (v!2298 V!2745)) (EmptyCell!818) )
))
(declare-datatypes ((array!3571 0))(
  ( (array!3572 (arr!1708 (Array (_ BitVec 32) ValueCell!818)) (size!1937 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!544 0))(
  ( (LongMapFixedSize!545 (defaultEntry!1986 Int) (mask!5837 (_ BitVec 32)) (extraKeys!1877 (_ BitVec 32)) (zeroValue!1904 V!2745) (minValue!1904 V!2745) (_size!321 (_ BitVec 32)) (_keys!3606 array!3569) (_values!1969 array!3571) (_vacant!321 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!360 0))(
  ( (Cell!361 (v!2299 LongMapFixedSize!544)) )
))
(declare-datatypes ((LongMap!360 0))(
  ( (LongMap!361 (underlying!191 Cell!360)) )
))
(declare-fun thiss!992 () LongMap!360)

(declare-datatypes ((tuple2!1942 0))(
  ( (tuple2!1943 (_1!982 (_ BitVec 64)) (_2!982 V!2745)) )
))
(declare-datatypes ((List!1383 0))(
  ( (Nil!1380) (Cons!1379 (h!1959 tuple2!1942) (t!4565 List!1383)) )
))
(declare-datatypes ((ListLongMap!1319 0))(
  ( (ListLongMap!1320 (toList!675 List!1383)) )
))
(declare-fun lt!21755 () ListLongMap!1319)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!648 (ListLongMap!1319 (_ BitVec 64)) Bool)

(assert (=> b!54820 (= res!30964 (contains!648 lt!21755 (select (arr!1707 (_keys!3606 (v!2299 (underlying!191 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!544)

(declare-datatypes ((tuple2!1944 0))(
  ( (tuple2!1945 (_1!983 Bool) (_2!983 LongMapFixedSize!544)) )
))
(declare-fun lt!21759 () tuple2!1944)

(declare-fun update!56 (LongMapFixedSize!544 (_ BitVec 64) V!2745) tuple2!1944)

(declare-fun get!1020 (ValueCell!818 V!2745) V!2745)

(declare-fun dynLambda!287 (Int (_ BitVec 64)) V!2745)

(assert (=> b!54820 (= lt!21759 (update!56 newMap!16 (select (arr!1707 (_keys!3606 (v!2299 (underlying!191 thiss!992)))) from!355) (get!1020 (select (arr!1708 (_values!1969 (v!2299 (underlying!191 thiss!992)))) from!355) (dynLambda!287 (defaultEntry!1986 (v!2299 (underlying!191 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!54821 () Bool)

(declare-fun e!35895 () Bool)

(declare-fun e!35896 () Bool)

(declare-fun mapRes!2640 () Bool)

(assert (=> b!54821 (= e!35895 (and e!35896 mapRes!2640))))

(declare-fun condMapEmpty!2640 () Bool)

(declare-fun mapDefault!2639 () ValueCell!818)

