; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12150 () Bool)

(assert start!12150)

(declare-fun b!102763 () Bool)

(declare-fun b_free!2505 () Bool)

(declare-fun b_next!2505 () Bool)

(assert (=> b!102763 (= b_free!2505 (not b_next!2505))))

(declare-fun tp!9825 () Bool)

(declare-fun b_and!6359 () Bool)

(assert (=> b!102763 (= tp!9825 b_and!6359)))

(declare-fun b!102754 () Bool)

(declare-fun b_free!2507 () Bool)

(declare-fun b_next!2507 () Bool)

(assert (=> b!102754 (= b_free!2507 (not b_next!2507))))

(declare-fun tp!9826 () Bool)

(declare-fun b_and!6361 () Bool)

(assert (=> b!102754 (= tp!9826 b_and!6361)))

(declare-fun b!102753 () Bool)

(declare-fun e!66958 () Bool)

(declare-fun tp_is_empty!2669 () Bool)

(assert (=> b!102753 (= e!66958 tp_is_empty!2669)))

(declare-fun mapIsEmpty!3887 () Bool)

(declare-fun mapRes!3887 () Bool)

(assert (=> mapIsEmpty!3887 mapRes!3887))

(declare-fun mapNonEmpty!3887 () Bool)

(declare-fun tp!9827 () Bool)

(declare-fun e!66952 () Bool)

(assert (=> mapNonEmpty!3887 (= mapRes!3887 (and tp!9827 e!66952))))

(declare-datatypes ((V!3205 0))(
  ( (V!3206 (val!1379 Int)) )
))
(declare-datatypes ((array!4325 0))(
  ( (array!4326 (arr!2053 (Array (_ BitVec 32) (_ BitVec 64))) (size!2307 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!991 0))(
  ( (ValueCellFull!991 (v!2869 V!3205)) (EmptyCell!991) )
))
(declare-datatypes ((array!4327 0))(
  ( (array!4328 (arr!2054 (Array (_ BitVec 32) ValueCell!991)) (size!2308 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!890 0))(
  ( (LongMapFixedSize!891 (defaultEntry!2556 Int) (mask!6689 (_ BitVec 32)) (extraKeys!2365 (_ BitVec 32)) (zeroValue!2433 V!3205) (minValue!2433 V!3205) (_size!494 (_ BitVec 32)) (_keys!4258 array!4325) (_values!2539 array!4327) (_vacant!494 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!890)

(declare-fun mapValue!3888 () ValueCell!991)

(declare-fun mapRest!3888 () (Array (_ BitVec 32) ValueCell!991))

(declare-fun mapKey!3888 () (_ BitVec 32))

(assert (=> mapNonEmpty!3887 (= (arr!2054 (_values!2539 newMap!16)) (store mapRest!3888 mapKey!3888 mapValue!3888))))

(declare-fun e!66957 () Bool)

(declare-fun e!66955 () Bool)

(declare-fun array_inv!1291 (array!4325) Bool)

(declare-fun array_inv!1292 (array!4327) Bool)

(assert (=> b!102754 (= e!66955 (and tp!9826 tp_is_empty!2669 (array_inv!1291 (_keys!4258 newMap!16)) (array_inv!1292 (_values!2539 newMap!16)) e!66957))))

(declare-fun res!51378 () Bool)

(declare-fun e!66949 () Bool)

(assert (=> start!12150 (=> (not res!51378) (not e!66949))))

(declare-datatypes ((Cell!690 0))(
  ( (Cell!691 (v!2870 LongMapFixedSize!890)) )
))
(declare-datatypes ((LongMap!690 0))(
  ( (LongMap!691 (underlying!356 Cell!690)) )
))
(declare-fun thiss!992 () LongMap!690)

(declare-fun valid!415 (LongMap!690) Bool)

(assert (=> start!12150 (= res!51378 (valid!415 thiss!992))))

(assert (=> start!12150 e!66949))

(declare-fun e!66961 () Bool)

(assert (=> start!12150 e!66961))

(assert (=> start!12150 true))

(assert (=> start!12150 e!66955))

(declare-fun b!102755 () Bool)

(declare-fun e!66951 () Bool)

(declare-fun e!66946 () Bool)

(assert (=> b!102755 (= e!66951 e!66946)))

(declare-fun res!51373 () Bool)

(assert (=> b!102755 (=> (not res!51373) (not e!66946))))

(declare-datatypes ((tuple2!2394 0))(
  ( (tuple2!2395 (_1!1208 Bool) (_2!1208 LongMapFixedSize!890)) )
))
(declare-fun lt!52250 () tuple2!2394)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!102755 (= res!51373 (and (_1!1208 lt!52250) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3142 0))(
  ( (Unit!3143) )
))
(declare-fun lt!52246 () Unit!3142)

(declare-fun e!66953 () Unit!3142)

(assert (=> b!102755 (= lt!52246 e!66953)))

(declare-datatypes ((tuple2!2396 0))(
  ( (tuple2!2397 (_1!1209 (_ BitVec 64)) (_2!1209 V!3205)) )
))
(declare-datatypes ((List!1608 0))(
  ( (Nil!1605) (Cons!1604 (h!2200 tuple2!2396) (t!5662 List!1608)) )
))
(declare-datatypes ((ListLongMap!1565 0))(
  ( (ListLongMap!1566 (toList!798 List!1608)) )
))
(declare-fun lt!52251 () ListLongMap!1565)

(declare-fun c!17655 () Bool)

(declare-fun contains!821 (ListLongMap!1565 (_ BitVec 64)) Bool)

(assert (=> b!102755 (= c!17655 (contains!821 lt!52251 (select (arr!2053 (_keys!4258 (v!2870 (underlying!356 thiss!992)))) from!355)))))

(declare-fun lt!52249 () V!3205)

(declare-fun update!153 (LongMapFixedSize!890 (_ BitVec 64) V!3205) tuple2!2394)

(assert (=> b!102755 (= lt!52250 (update!153 newMap!16 (select (arr!2053 (_keys!4258 (v!2870 (underlying!356 thiss!992)))) from!355) lt!52249))))

(declare-fun b!102756 () Bool)

(declare-fun e!66960 () Bool)

(assert (=> b!102756 (= e!66960 e!66951)))

(declare-fun res!51374 () Bool)

(assert (=> b!102756 (=> (not res!51374) (not e!66951))))

(assert (=> b!102756 (= res!51374 (and (not (= (select (arr!2053 (_keys!4258 (v!2870 (underlying!356 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2053 (_keys!4258 (v!2870 (underlying!356 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1318 (ValueCell!991 V!3205) V!3205)

(declare-fun dynLambda!382 (Int (_ BitVec 64)) V!3205)

(assert (=> b!102756 (= lt!52249 (get!1318 (select (arr!2054 (_values!2539 (v!2870 (underlying!356 thiss!992)))) from!355) (dynLambda!382 (defaultEntry!2556 (v!2870 (underlying!356 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102757 () Bool)

(declare-fun res!51375 () Bool)

(assert (=> b!102757 (=> (not res!51375) (not e!66949))))

(assert (=> b!102757 (= res!51375 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2307 (_keys!4258 (v!2870 (underlying!356 thiss!992)))))))))

(declare-fun b!102758 () Bool)

(assert (=> b!102758 (= e!66952 tp_is_empty!2669)))

(declare-fun b!102759 () Bool)

(declare-fun res!51379 () Bool)

(assert (=> b!102759 (=> (not res!51379) (not e!66949))))

(declare-fun valid!416 (LongMapFixedSize!890) Bool)

(assert (=> b!102759 (= res!51379 (valid!416 newMap!16))))

(declare-fun b!102760 () Bool)

(declare-fun res!51376 () Bool)

(assert (=> b!102760 (=> (not res!51376) (not e!66949))))

(assert (=> b!102760 (= res!51376 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6689 newMap!16)) (_size!494 (v!2870 (underlying!356 thiss!992)))))))

(declare-fun b!102761 () Bool)

(declare-fun e!66947 () Bool)

(declare-fun e!66954 () Bool)

(declare-fun mapRes!3888 () Bool)

(assert (=> b!102761 (= e!66947 (and e!66954 mapRes!3888))))

(declare-fun condMapEmpty!3887 () Bool)

(declare-fun mapDefault!3888 () ValueCell!991)

