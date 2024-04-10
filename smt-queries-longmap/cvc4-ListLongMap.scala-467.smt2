; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8874 () Bool)

(assert start!8874)

(declare-fun b!62332 () Bool)

(declare-fun b_free!2001 () Bool)

(declare-fun b_next!2001 () Bool)

(assert (=> b!62332 (= b_free!2001 (not b_next!2001))))

(declare-fun tp!8133 () Bool)

(declare-fun b_and!3819 () Bool)

(assert (=> b!62332 (= tp!8133 b_and!3819)))

(declare-fun b!62331 () Bool)

(declare-fun b_free!2003 () Bool)

(declare-fun b_next!2003 () Bool)

(assert (=> b!62331 (= b_free!2003 (not b_next!2003))))

(declare-fun tp!8131 () Bool)

(declare-fun b_and!3821 () Bool)

(assert (=> b!62331 (= tp!8131 b_and!3821)))

(declare-fun b!62317 () Bool)

(declare-fun e!40940 () Bool)

(declare-fun e!40932 () Bool)

(assert (=> b!62317 (= e!40940 e!40932)))

(declare-fun res!34232 () Bool)

(assert (=> b!62317 (=> (not res!34232) (not e!40932))))

(declare-datatypes ((V!2869 0))(
  ( (V!2870 (val!1253 Int)) )
))
(declare-datatypes ((array!3765 0))(
  ( (array!3766 (arr!1801 (Array (_ BitVec 32) (_ BitVec 64))) (size!2033 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!865 0))(
  ( (ValueCellFull!865 (v!2420 V!2869)) (EmptyCell!865) )
))
(declare-datatypes ((array!3767 0))(
  ( (array!3768 (arr!1802 (Array (_ BitVec 32) ValueCell!865)) (size!2034 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!638 0))(
  ( (LongMapFixedSize!639 (defaultEntry!2089 Int) (mask!5995 (_ BitVec 32)) (extraKeys!1968 (_ BitVec 32)) (zeroValue!2001 V!2869) (minValue!2001 V!2869) (_size!368 (_ BitVec 32)) (_keys!3721 array!3765) (_values!2072 array!3767) (_vacant!368 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2042 0))(
  ( (tuple2!2043 (_1!1032 Bool) (_2!1032 LongMapFixedSize!638)) )
))
(declare-fun lt!25981 () tuple2!2042)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!62317 (= res!34232 (and (_1!1032 lt!25981) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!1697 0))(
  ( (Unit!1698) )
))
(declare-fun lt!25982 () Unit!1697)

(declare-fun e!40939 () Unit!1697)

(assert (=> b!62317 (= lt!25982 e!40939)))

(declare-datatypes ((Cell!446 0))(
  ( (Cell!447 (v!2421 LongMapFixedSize!638)) )
))
(declare-datatypes ((LongMap!446 0))(
  ( (LongMap!447 (underlying!234 Cell!446)) )
))
(declare-fun thiss!992 () LongMap!446)

(declare-datatypes ((tuple2!2044 0))(
  ( (tuple2!2045 (_1!1033 (_ BitVec 64)) (_2!1033 V!2869)) )
))
(declare-datatypes ((List!1441 0))(
  ( (Nil!1438) (Cons!1437 (h!2020 tuple2!2044) (t!4839 List!1441)) )
))
(declare-datatypes ((ListLongMap!1375 0))(
  ( (ListLongMap!1376 (toList!703 List!1441)) )
))
(declare-fun lt!25979 () ListLongMap!1375)

(declare-fun c!8278 () Bool)

(declare-fun contains!691 (ListLongMap!1375 (_ BitVec 64)) Bool)

(assert (=> b!62317 (= c!8278 (contains!691 lt!25979 (select (arr!1801 (_keys!3721 (v!2421 (underlying!234 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!638)

(declare-fun update!78 (LongMapFixedSize!638 (_ BitVec 64) V!2869) tuple2!2042)

(declare-fun get!1083 (ValueCell!865 V!2869) V!2869)

(declare-fun dynLambda!309 (Int (_ BitVec 64)) V!2869)

(assert (=> b!62317 (= lt!25981 (update!78 newMap!16 (select (arr!1801 (_keys!3721 (v!2421 (underlying!234 thiss!992)))) from!355) (get!1083 (select (arr!1802 (_values!2072 (v!2421 (underlying!234 thiss!992)))) from!355) (dynLambda!309 (defaultEntry!2089 (v!2421 (underlying!234 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!62318 () Bool)

(declare-fun e!40941 () Bool)

(declare-fun e!40936 () Bool)

(assert (=> b!62318 (= e!40941 e!40936)))

(declare-fun b!62319 () Bool)

(declare-fun e!40938 () Bool)

(declare-fun tp_is_empty!2417 () Bool)

(assert (=> b!62319 (= e!40938 tp_is_empty!2417)))

(declare-fun b!62320 () Bool)

(assert (=> b!62320 (= e!40932 (and (= (size!2034 (_values!2072 (v!2421 (underlying!234 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5995 (v!2421 (underlying!234 thiss!992))))) (= (size!2033 (_keys!3721 (v!2421 (underlying!234 thiss!992)))) (size!2034 (_values!2072 (v!2421 (underlying!234 thiss!992))))) (bvsge (mask!5995 (v!2421 (underlying!234 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1968 (v!2421 (underlying!234 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!1968 (v!2421 (underlying!234 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!62321 () Bool)

(declare-fun e!40929 () Bool)

(assert (=> b!62321 (= e!40929 tp_is_empty!2417)))

(declare-fun b!62323 () Bool)

(declare-fun e!40944 () Bool)

(declare-fun mapRes!2949 () Bool)

(assert (=> b!62323 (= e!40944 (and e!40938 mapRes!2949))))

(declare-fun condMapEmpty!2950 () Bool)

(declare-fun mapDefault!2949 () ValueCell!865)

