; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11500 () Bool)

(assert start!11500)

(declare-fun b!95709 () Bool)

(declare-fun b_free!2409 () Bool)

(declare-fun b_next!2409 () Bool)

(assert (=> b!95709 (= b_free!2409 (not b_next!2409))))

(declare-fun tp!9502 () Bool)

(declare-fun b_and!5855 () Bool)

(assert (=> b!95709 (= tp!9502 b_and!5855)))

(declare-fun b!95698 () Bool)

(declare-fun b_free!2411 () Bool)

(declare-fun b_next!2411 () Bool)

(assert (=> b!95698 (= b_free!2411 (not b_next!2411))))

(declare-fun tp!9504 () Bool)

(declare-fun b_and!5857 () Bool)

(assert (=> b!95698 (= tp!9504 b_and!5857)))

(declare-fun res!48359 () Bool)

(declare-fun e!62447 () Bool)

(assert (=> start!11500 (=> (not res!48359) (not e!62447))))

(declare-datatypes ((V!3141 0))(
  ( (V!3142 (val!1355 Int)) )
))
(declare-datatypes ((array!4219 0))(
  ( (array!4220 (arr!2005 (Array (_ BitVec 32) (_ BitVec 64))) (size!2254 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!967 0))(
  ( (ValueCellFull!967 (v!2779 V!3141)) (EmptyCell!967) )
))
(declare-datatypes ((array!4221 0))(
  ( (array!4222 (arr!2006 (Array (_ BitVec 32) ValueCell!967)) (size!2255 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!842 0))(
  ( (LongMapFixedSize!843 (defaultEntry!2458 Int) (mask!6543 (_ BitVec 32)) (extraKeys!2283 (_ BitVec 32)) (zeroValue!2343 V!3141) (minValue!2343 V!3141) (_size!470 (_ BitVec 32)) (_keys!4144 array!4219) (_values!2441 array!4221) (_vacant!470 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!642 0))(
  ( (Cell!643 (v!2780 LongMapFixedSize!842)) )
))
(declare-datatypes ((LongMap!642 0))(
  ( (LongMap!643 (underlying!332 Cell!642)) )
))
(declare-fun thiss!992 () LongMap!642)

(declare-fun valid!380 (LongMap!642) Bool)

(assert (=> start!11500 (= res!48359 (valid!380 thiss!992))))

(assert (=> start!11500 e!62447))

(declare-fun e!62455 () Bool)

(assert (=> start!11500 e!62455))

(assert (=> start!11500 true))

(declare-fun e!62444 () Bool)

(assert (=> start!11500 e!62444))

(declare-fun b!95695 () Bool)

(declare-fun e!62453 () Bool)

(declare-fun e!62451 () Bool)

(assert (=> b!95695 (= e!62453 e!62451)))

(declare-fun res!48358 () Bool)

(assert (=> b!95695 (=> (not res!48358) (not e!62451))))

(declare-datatypes ((tuple2!2326 0))(
  ( (tuple2!2327 (_1!1174 Bool) (_2!1174 LongMapFixedSize!842)) )
))
(declare-fun lt!47660 () tuple2!2326)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!95695 (= res!48358 (and (_1!1174 lt!47660) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2868 0))(
  ( (Unit!2869) )
))
(declare-fun lt!47661 () Unit!2868)

(declare-fun e!62448 () Unit!2868)

(assert (=> b!95695 (= lt!47661 e!62448)))

(declare-fun c!16069 () Bool)

(declare-datatypes ((tuple2!2328 0))(
  ( (tuple2!2329 (_1!1175 (_ BitVec 64)) (_2!1175 V!3141)) )
))
(declare-datatypes ((List!1575 0))(
  ( (Nil!1572) (Cons!1571 (h!2164 tuple2!2328) (t!5501 List!1575)) )
))
(declare-datatypes ((ListLongMap!1529 0))(
  ( (ListLongMap!1530 (toList!780 List!1575)) )
))
(declare-fun lt!47662 () ListLongMap!1529)

(declare-fun contains!795 (ListLongMap!1529 (_ BitVec 64)) Bool)

(assert (=> b!95695 (= c!16069 (contains!795 lt!47662 (select (arr!2005 (_keys!4144 (v!2780 (underlying!332 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!842)

(declare-fun update!137 (LongMapFixedSize!842 (_ BitVec 64) V!3141) tuple2!2326)

(declare-fun get!1270 (ValueCell!967 V!3141) V!3141)

(declare-fun dynLambda!365 (Int (_ BitVec 64)) V!3141)

(assert (=> b!95695 (= lt!47660 (update!137 newMap!16 (select (arr!2005 (_keys!4144 (v!2780 (underlying!332 thiss!992)))) from!355) (get!1270 (select (arr!2006 (_values!2441 (v!2780 (underlying!332 thiss!992)))) from!355) (dynLambda!365 (defaultEntry!2458 (v!2780 (underlying!332 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!95696 () Bool)

(declare-fun e!62450 () Bool)

(declare-fun tp_is_empty!2621 () Bool)

(assert (=> b!95696 (= e!62450 tp_is_empty!2621)))

(declare-fun mapIsEmpty!3707 () Bool)

(declare-fun mapRes!3708 () Bool)

(assert (=> mapIsEmpty!3707 mapRes!3708))

(declare-fun b!95697 () Bool)

(declare-fun res!48355 () Bool)

(assert (=> b!95697 (=> (not res!48355) (not e!62451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!95697 (= res!48355 (validMask!0 (mask!6543 (v!2780 (underlying!332 thiss!992)))))))

(declare-fun e!62457 () Bool)

(declare-fun array_inv!1251 (array!4219) Bool)

(declare-fun array_inv!1252 (array!4221) Bool)

(assert (=> b!95698 (= e!62444 (and tp!9504 tp_is_empty!2621 (array_inv!1251 (_keys!4144 newMap!16)) (array_inv!1252 (_values!2441 newMap!16)) e!62457))))

(declare-fun b!95699 () Bool)

(declare-fun e!62445 () Bool)

(assert (=> b!95699 (= e!62445 tp_is_empty!2621)))

(declare-fun b!95700 () Bool)

(assert (=> b!95700 (= e!62451 (and (= (size!2255 (_values!2441 (v!2780 (underlying!332 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6543 (v!2780 (underlying!332 thiss!992))))) (not (= (size!2254 (_keys!4144 (v!2780 (underlying!332 thiss!992)))) (size!2255 (_values!2441 (v!2780 (underlying!332 thiss!992))))))))))

(declare-fun b!95701 () Bool)

(declare-fun res!48357 () Bool)

(assert (=> b!95701 (=> (not res!48357) (not e!62447))))

(assert (=> b!95701 (= res!48357 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2254 (_keys!4144 (v!2780 (underlying!332 thiss!992)))))))))

(declare-fun b!95702 () Bool)

(declare-fun e!62449 () Bool)

(assert (=> b!95702 (= e!62449 tp_is_empty!2621)))

(declare-fun b!95703 () Bool)

(declare-fun Unit!2870 () Unit!2868)

(assert (=> b!95703 (= e!62448 Unit!2870)))

(declare-fun lt!47663 () Unit!2868)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!87 (array!4219 array!4221 (_ BitVec 32) (_ BitVec 32) V!3141 V!3141 (_ BitVec 64) (_ BitVec 32) Int) Unit!2868)

(assert (=> b!95703 (= lt!47663 (lemmaListMapContainsThenArrayContainsFrom!87 (_keys!4144 (v!2780 (underlying!332 thiss!992))) (_values!2441 (v!2780 (underlying!332 thiss!992))) (mask!6543 (v!2780 (underlying!332 thiss!992))) (extraKeys!2283 (v!2780 (underlying!332 thiss!992))) (zeroValue!2343 (v!2780 (underlying!332 thiss!992))) (minValue!2343 (v!2780 (underlying!332 thiss!992))) (select (arr!2005 (_keys!4144 (v!2780 (underlying!332 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2458 (v!2780 (underlying!332 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!95703 (arrayContainsKey!0 (_keys!4144 (v!2780 (underlying!332 thiss!992))) (select (arr!2005 (_keys!4144 (v!2780 (underlying!332 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!47665 () Unit!2868)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4219 (_ BitVec 32) (_ BitVec 32)) Unit!2868)

(assert (=> b!95703 (= lt!47665 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4144 (v!2780 (underlying!332 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1576 0))(
  ( (Nil!1573) (Cons!1572 (h!2165 (_ BitVec 64)) (t!5502 List!1576)) )
))
(declare-fun arrayNoDuplicates!0 (array!4219 (_ BitVec 32) List!1576) Bool)

(assert (=> b!95703 (arrayNoDuplicates!0 (_keys!4144 (v!2780 (underlying!332 thiss!992))) from!355 Nil!1573)))

(declare-fun lt!47666 () Unit!2868)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4219 (_ BitVec 32) (_ BitVec 64) List!1576) Unit!2868)

(assert (=> b!95703 (= lt!47666 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4144 (v!2780 (underlying!332 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2005 (_keys!4144 (v!2780 (underlying!332 thiss!992)))) from!355) (Cons!1572 (select (arr!2005 (_keys!4144 (v!2780 (underlying!332 thiss!992)))) from!355) Nil!1573)))))

(assert (=> b!95703 false))

(declare-fun b!95704 () Bool)

(declare-fun res!48353 () Bool)

(assert (=> b!95704 (=> (not res!48353) (not e!62447))))

(assert (=> b!95704 (= res!48353 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6543 newMap!16)) (_size!470 (v!2780 (underlying!332 thiss!992)))))))

(declare-fun b!95705 () Bool)

(assert (=> b!95705 (= e!62447 e!62453)))

(declare-fun res!48354 () Bool)

(assert (=> b!95705 (=> (not res!48354) (not e!62453))))

(declare-fun lt!47664 () ListLongMap!1529)

(assert (=> b!95705 (= res!48354 (and (= lt!47664 lt!47662) (not (= (select (arr!2005 (_keys!4144 (v!2780 (underlying!332 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2005 (_keys!4144 (v!2780 (underlying!332 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1248 (LongMapFixedSize!842) ListLongMap!1529)

(assert (=> b!95705 (= lt!47662 (map!1248 newMap!16))))

(declare-fun getCurrentListMap!471 (array!4219 array!4221 (_ BitVec 32) (_ BitVec 32) V!3141 V!3141 (_ BitVec 32) Int) ListLongMap!1529)

(assert (=> b!95705 (= lt!47664 (getCurrentListMap!471 (_keys!4144 (v!2780 (underlying!332 thiss!992))) (_values!2441 (v!2780 (underlying!332 thiss!992))) (mask!6543 (v!2780 (underlying!332 thiss!992))) (extraKeys!2283 (v!2780 (underlying!332 thiss!992))) (zeroValue!2343 (v!2780 (underlying!332 thiss!992))) (minValue!2343 (v!2780 (underlying!332 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2458 (v!2780 (underlying!332 thiss!992)))))))

(declare-fun mapIsEmpty!3708 () Bool)

(declare-fun mapRes!3707 () Bool)

(assert (=> mapIsEmpty!3708 mapRes!3707))

(declare-fun b!95706 () Bool)

(declare-fun e!62454 () Bool)

(assert (=> b!95706 (= e!62454 (and e!62449 mapRes!3708))))

(declare-fun condMapEmpty!3708 () Bool)

(declare-fun mapDefault!3707 () ValueCell!967)

