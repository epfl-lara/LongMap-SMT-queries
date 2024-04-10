; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8268 () Bool)

(assert start!8268)

(declare-fun b!53081 () Bool)

(declare-fun b_free!1701 () Bool)

(declare-fun b_next!1701 () Bool)

(assert (=> b!53081 (= b_free!1701 (not b_next!1701))))

(declare-fun tp!7206 () Bool)

(declare-fun b_and!2943 () Bool)

(assert (=> b!53081 (= tp!7206 b_and!2943)))

(declare-fun b!53084 () Bool)

(declare-fun b_free!1703 () Bool)

(declare-fun b_next!1703 () Bool)

(assert (=> b!53084 (= b_free!1703 (not b_next!1703))))

(declare-fun tp!7203 () Bool)

(declare-fun b_and!2945 () Bool)

(assert (=> b!53084 (= tp!7203 b_and!2945)))

(declare-fun mapIsEmpty!2471 () Bool)

(declare-fun mapRes!2471 () Bool)

(assert (=> mapIsEmpty!2471 mapRes!2471))

(declare-fun b!53080 () Bool)

(declare-fun e!34609 () Bool)

(declare-fun tp_is_empty!2267 () Bool)

(assert (=> b!53080 (= e!34609 tp_is_empty!2267)))

(declare-datatypes ((V!2669 0))(
  ( (V!2670 (val!1178 Int)) )
))
(declare-datatypes ((array!3457 0))(
  ( (array!3458 (arr!1651 (Array (_ BitVec 32) (_ BitVec 64))) (size!1880 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!790 0))(
  ( (ValueCellFull!790 (v!2245 V!2669)) (EmptyCell!790) )
))
(declare-datatypes ((array!3459 0))(
  ( (array!3460 (arr!1652 (Array (_ BitVec 32) ValueCell!790)) (size!1881 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!488 0))(
  ( (LongMapFixedSize!489 (defaultEntry!1958 Int) (mask!5789 (_ BitVec 32)) (extraKeys!1849 (_ BitVec 32)) (zeroValue!1876 V!2669) (minValue!1876 V!2669) (_size!293 (_ BitVec 32)) (_keys!3578 array!3457) (_values!1941 array!3459) (_vacant!293 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!310 0))(
  ( (Cell!311 (v!2246 LongMapFixedSize!488)) )
))
(declare-datatypes ((LongMap!310 0))(
  ( (LongMap!311 (underlying!166 Cell!310)) )
))
(declare-fun thiss!992 () LongMap!310)

(declare-fun e!34617 () Bool)

(declare-fun e!34621 () Bool)

(declare-fun array_inv!1023 (array!3457) Bool)

(declare-fun array_inv!1024 (array!3459) Bool)

(assert (=> b!53081 (= e!34621 (and tp!7206 tp_is_empty!2267 (array_inv!1023 (_keys!3578 (v!2246 (underlying!166 thiss!992)))) (array_inv!1024 (_values!1941 (v!2246 (underlying!166 thiss!992)))) e!34617))))

(declare-fun b!53082 () Bool)

(declare-fun e!34614 () Bool)

(declare-fun e!34622 () Bool)

(assert (=> b!53082 (= e!34614 e!34622)))

(declare-fun res!30118 () Bool)

(assert (=> b!53082 (=> (not res!30118) (not e!34622))))

(declare-datatypes ((tuple2!1876 0))(
  ( (tuple2!1877 (_1!949 (_ BitVec 64)) (_2!949 V!2669)) )
))
(declare-datatypes ((List!1353 0))(
  ( (Nil!1350) (Cons!1349 (h!1929 tuple2!1876) (t!4423 List!1353)) )
))
(declare-datatypes ((ListLongMap!1281 0))(
  ( (ListLongMap!1282 (toList!656 List!1353)) )
))
(declare-fun lt!21399 () ListLongMap!1281)

(declare-fun lt!21402 () ListLongMap!1281)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!53082 (= res!30118 (and (= lt!21402 lt!21399) (not (= (select (arr!1651 (_keys!3578 (v!2246 (underlying!166 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1651 (_keys!3578 (v!2246 (underlying!166 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!488)

(declare-fun map!1027 (LongMapFixedSize!488) ListLongMap!1281)

(assert (=> b!53082 (= lt!21399 (map!1027 newMap!16))))

(declare-fun getCurrentListMap!368 (array!3457 array!3459 (_ BitVec 32) (_ BitVec 32) V!2669 V!2669 (_ BitVec 32) Int) ListLongMap!1281)

(assert (=> b!53082 (= lt!21402 (getCurrentListMap!368 (_keys!3578 (v!2246 (underlying!166 thiss!992))) (_values!1941 (v!2246 (underlying!166 thiss!992))) (mask!5789 (v!2246 (underlying!166 thiss!992))) (extraKeys!1849 (v!2246 (underlying!166 thiss!992))) (zeroValue!1876 (v!2246 (underlying!166 thiss!992))) (minValue!1876 (v!2246 (underlying!166 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1958 (v!2246 (underlying!166 thiss!992)))))))

(declare-fun b!53083 () Bool)

(declare-fun e!34611 () Bool)

(assert (=> b!53083 (= e!34611 tp_is_empty!2267)))

(declare-fun e!34608 () Bool)

(declare-fun e!34613 () Bool)

(assert (=> b!53084 (= e!34613 (and tp!7203 tp_is_empty!2267 (array_inv!1023 (_keys!3578 newMap!16)) (array_inv!1024 (_values!1941 newMap!16)) e!34608))))

(declare-fun b!53085 () Bool)

(declare-fun e!34612 () Bool)

(assert (=> b!53085 (= e!34612 tp_is_empty!2267)))

(declare-fun b!53086 () Bool)

(declare-fun e!34610 () Bool)

(assert (=> b!53086 (= e!34610 tp_is_empty!2267)))

(declare-fun b!53087 () Bool)

(declare-fun res!30119 () Bool)

(declare-fun e!34619 () Bool)

(assert (=> b!53087 (=> (not res!30119) (not e!34619))))

(assert (=> b!53087 (= res!30119 (and (= (size!1881 (_values!1941 (v!2246 (underlying!166 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5789 (v!2246 (underlying!166 thiss!992))))) (= (size!1880 (_keys!3578 (v!2246 (underlying!166 thiss!992)))) (size!1881 (_values!1941 (v!2246 (underlying!166 thiss!992))))) (bvsge (mask!5789 (v!2246 (underlying!166 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1849 (v!2246 (underlying!166 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1849 (v!2246 (underlying!166 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!53088 () Bool)

(assert (=> b!53088 (= e!34619 false)))

(declare-fun lt!21401 () Bool)

(declare-fun contains!631 (ListLongMap!1281 (_ BitVec 64)) Bool)

(assert (=> b!53088 (= lt!21401 (contains!631 lt!21402 (select (arr!1651 (_keys!3578 (v!2246 (underlying!166 thiss!992)))) from!355)))))

(declare-fun b!53089 () Bool)

(declare-fun mapRes!2472 () Bool)

(assert (=> b!53089 (= e!34617 (and e!34610 mapRes!2472))))

(declare-fun condMapEmpty!2471 () Bool)

(declare-fun mapDefault!2471 () ValueCell!790)

