; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10680 () Bool)

(assert start!10680)

(declare-fun b!85385 () Bool)

(declare-fun b_free!2241 () Bool)

(declare-fun b_next!2241 () Bool)

(assert (=> b!85385 (= b_free!2241 (not b_next!2241))))

(declare-fun tp!8949 () Bool)

(declare-fun b_and!5179 () Bool)

(assert (=> b!85385 (= tp!8949 b_and!5179)))

(declare-fun b!85394 () Bool)

(declare-fun b_free!2243 () Bool)

(declare-fun b_next!2243 () Bool)

(assert (=> b!85394 (= b_free!2243 (not b_next!2243))))

(declare-fun tp!8950 () Bool)

(declare-fun b_and!5181 () Bool)

(assert (=> b!85394 (= tp!8950 b_and!5181)))

(declare-fun res!43996 () Bool)

(declare-fun e!55705 () Bool)

(assert (=> start!10680 (=> (not res!43996) (not e!55705))))

(declare-datatypes ((V!3029 0))(
  ( (V!3030 (val!1313 Int)) )
))
(declare-datatypes ((array!4033 0))(
  ( (array!4034 (arr!1921 (Array (_ BitVec 32) (_ BitVec 64))) (size!2165 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!925 0))(
  ( (ValueCellFull!925 (v!2646 V!3029)) (EmptyCell!925) )
))
(declare-datatypes ((array!4035 0))(
  ( (array!4036 (arr!1922 (Array (_ BitVec 32) ValueCell!925)) (size!2166 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!758 0))(
  ( (LongMapFixedSize!759 (defaultEntry!2339 Int) (mask!6367 (_ BitVec 32)) (extraKeys!2178 (_ BitVec 32)) (zeroValue!2231 V!3029) (minValue!2231 V!3029) (_size!428 (_ BitVec 32)) (_keys!4011 array!4033) (_values!2322 array!4035) (_vacant!428 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!558 0))(
  ( (Cell!559 (v!2647 LongMapFixedSize!758)) )
))
(declare-datatypes ((LongMap!558 0))(
  ( (LongMap!559 (underlying!290 Cell!558)) )
))
(declare-fun thiss!992 () LongMap!558)

(declare-fun valid!325 (LongMap!558) Bool)

(assert (=> start!10680 (= res!43996 (valid!325 thiss!992))))

(assert (=> start!10680 e!55705))

(declare-fun e!55703 () Bool)

(assert (=> start!10680 e!55703))

(assert (=> start!10680 true))

(declare-fun e!55708 () Bool)

(assert (=> start!10680 e!55708))

(declare-fun b!85379 () Bool)

(declare-fun e!55720 () Bool)

(declare-fun e!55718 () Bool)

(assert (=> b!85379 (= e!55720 (not e!55718))))

(declare-fun res!44001 () Bool)

(assert (=> b!85379 (=> res!44001 e!55718)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!85379 (= res!44001 (not (validMask!0 (mask!6367 (v!2647 (underlying!290 thiss!992))))))))

(declare-datatypes ((tuple2!2200 0))(
  ( (tuple2!2201 (_1!1111 (_ BitVec 64)) (_2!1111 V!3029)) )
))
(declare-fun lt!40377 () tuple2!2200)

(declare-datatypes ((List!1521 0))(
  ( (Nil!1518) (Cons!1517 (h!2108 tuple2!2200) (t!5246 List!1521)) )
))
(declare-datatypes ((ListLongMap!1463 0))(
  ( (ListLongMap!1464 (toList!747 List!1521)) )
))
(declare-fun lt!40374 () ListLongMap!1463)

(declare-fun lt!40380 () tuple2!2200)

(declare-fun lt!40385 () ListLongMap!1463)

(declare-fun +!111 (ListLongMap!1463 tuple2!2200) ListLongMap!1463)

(assert (=> b!85379 (= (+!111 lt!40385 lt!40380) (+!111 (+!111 lt!40374 lt!40380) lt!40377))))

(assert (=> b!85379 (= lt!40380 (tuple2!2201 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2231 (v!2647 (underlying!290 thiss!992)))))))

(declare-datatypes ((Unit!2521 0))(
  ( (Unit!2522) )
))
(declare-fun lt!40369 () Unit!2521)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!40370 () V!3029)

(declare-fun addCommutativeForDiffKeys!30 (ListLongMap!1463 (_ BitVec 64) V!3029 (_ BitVec 64) V!3029) Unit!2521)

(assert (=> b!85379 (= lt!40369 (addCommutativeForDiffKeys!30 lt!40374 (select (arr!1921 (_keys!4011 (v!2647 (underlying!290 thiss!992)))) from!355) lt!40370 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2231 (v!2647 (underlying!290 thiss!992)))))))

(declare-fun lt!40382 () ListLongMap!1463)

(assert (=> b!85379 (= lt!40382 lt!40385)))

(assert (=> b!85379 (= lt!40385 (+!111 lt!40374 lt!40377))))

(declare-fun lt!40381 () ListLongMap!1463)

(declare-fun lt!40386 () tuple2!2200)

(assert (=> b!85379 (= lt!40382 (+!111 lt!40381 lt!40386))))

(declare-fun lt!40376 () ListLongMap!1463)

(assert (=> b!85379 (= lt!40374 (+!111 lt!40376 lt!40386))))

(assert (=> b!85379 (= lt!40386 (tuple2!2201 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2231 (v!2647 (underlying!290 thiss!992)))))))

(assert (=> b!85379 (= lt!40381 (+!111 lt!40376 lt!40377))))

(assert (=> b!85379 (= lt!40377 (tuple2!2201 (select (arr!1921 (_keys!4011 (v!2647 (underlying!290 thiss!992)))) from!355) lt!40370))))

(declare-fun lt!40372 () Unit!2521)

(assert (=> b!85379 (= lt!40372 (addCommutativeForDiffKeys!30 lt!40376 (select (arr!1921 (_keys!4011 (v!2647 (underlying!290 thiss!992)))) from!355) lt!40370 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2231 (v!2647 (underlying!290 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!76 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) V!3029 V!3029 (_ BitVec 32) Int) ListLongMap!1463)

(assert (=> b!85379 (= lt!40376 (getCurrentListMapNoExtraKeys!76 (_keys!4011 (v!2647 (underlying!290 thiss!992))) (_values!2322 (v!2647 (underlying!290 thiss!992))) (mask!6367 (v!2647 (underlying!290 thiss!992))) (extraKeys!2178 (v!2647 (underlying!290 thiss!992))) (zeroValue!2231 (v!2647 (underlying!290 thiss!992))) (minValue!2231 (v!2647 (underlying!290 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2339 (v!2647 (underlying!290 thiss!992)))))))

(declare-fun mapNonEmpty!3405 () Bool)

(declare-fun mapRes!3405 () Bool)

(declare-fun tp!8948 () Bool)

(declare-fun e!55707 () Bool)

(assert (=> mapNonEmpty!3405 (= mapRes!3405 (and tp!8948 e!55707))))

(declare-fun newMap!16 () LongMapFixedSize!758)

(declare-fun mapRest!3406 () (Array (_ BitVec 32) ValueCell!925))

(declare-fun mapValue!3406 () ValueCell!925)

(declare-fun mapKey!3406 () (_ BitVec 32))

(assert (=> mapNonEmpty!3405 (= (arr!1922 (_values!2322 newMap!16)) (store mapRest!3406 mapKey!3406 mapValue!3406))))

(declare-fun b!85380 () Bool)

(declare-fun e!55716 () Bool)

(assert (=> b!85380 (= e!55705 e!55716)))

(declare-fun res!44002 () Bool)

(assert (=> b!85380 (=> (not res!44002) (not e!55716))))

(declare-fun lt!40383 () ListLongMap!1463)

(declare-fun lt!40384 () ListLongMap!1463)

(assert (=> b!85380 (= res!44002 (= lt!40383 lt!40384))))

(declare-fun map!1189 (LongMapFixedSize!758) ListLongMap!1463)

(assert (=> b!85380 (= lt!40384 (map!1189 newMap!16))))

(declare-fun getCurrentListMap!440 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) V!3029 V!3029 (_ BitVec 32) Int) ListLongMap!1463)

(assert (=> b!85380 (= lt!40383 (getCurrentListMap!440 (_keys!4011 (v!2647 (underlying!290 thiss!992))) (_values!2322 (v!2647 (underlying!290 thiss!992))) (mask!6367 (v!2647 (underlying!290 thiss!992))) (extraKeys!2178 (v!2647 (underlying!290 thiss!992))) (zeroValue!2231 (v!2647 (underlying!290 thiss!992))) (minValue!2231 (v!2647 (underlying!290 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2339 (v!2647 (underlying!290 thiss!992)))))))

(declare-fun b!85381 () Bool)

(declare-fun e!55710 () Bool)

(assert (=> b!85381 (= e!55703 e!55710)))

(declare-fun b!85382 () Bool)

(declare-fun e!55709 () Bool)

(declare-fun e!55706 () Bool)

(declare-fun mapRes!3406 () Bool)

(assert (=> b!85382 (= e!55709 (and e!55706 mapRes!3406))))

(declare-fun condMapEmpty!3406 () Bool)

(declare-fun mapDefault!3405 () ValueCell!925)

