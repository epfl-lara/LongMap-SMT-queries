; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13246 () Bool)

(assert start!13246)

(declare-fun b!116876 () Bool)

(declare-fun b_free!2773 () Bool)

(declare-fun b_next!2773 () Bool)

(assert (=> b!116876 (= b_free!2773 (not b_next!2773))))

(declare-fun tp!10696 () Bool)

(declare-fun b_and!7283 () Bool)

(assert (=> b!116876 (= tp!10696 b_and!7283)))

(declare-fun b!116881 () Bool)

(declare-fun b_free!2775 () Bool)

(declare-fun b_next!2775 () Bool)

(assert (=> b!116881 (= b_free!2775 (not b_next!2775))))

(declare-fun tp!10698 () Bool)

(declare-fun b_and!7285 () Bool)

(assert (=> b!116881 (= tp!10698 b_and!7285)))

(declare-fun b!116863 () Bool)

(declare-fun e!76375 () Bool)

(declare-fun e!76367 () Bool)

(assert (=> b!116863 (= e!76375 e!76367)))

(declare-fun res!57207 () Bool)

(assert (=> b!116863 (=> (not res!57207) (not e!76367))))

(declare-datatypes ((V!3385 0))(
  ( (V!3386 (val!1446 Int)) )
))
(declare-datatypes ((array!4615 0))(
  ( (array!4616 (arr!2187 (Array (_ BitVec 32) (_ BitVec 64))) (size!2448 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1058 0))(
  ( (ValueCellFull!1058 (v!3061 V!3385)) (EmptyCell!1058) )
))
(declare-datatypes ((array!4617 0))(
  ( (array!4618 (arr!2188 (Array (_ BitVec 32) ValueCell!1058)) (size!2449 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1024 0))(
  ( (LongMapFixedSize!1025 (defaultEntry!2725 Int) (mask!6947 (_ BitVec 32)) (extraKeys!2514 (_ BitVec 32)) (zeroValue!2592 V!3385) (minValue!2592 V!3385) (_size!561 (_ BitVec 32)) (_keys!4448 array!4615) (_values!2708 array!4617) (_vacant!561 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!822 0))(
  ( (Cell!823 (v!3062 LongMapFixedSize!1024)) )
))
(declare-datatypes ((LongMap!822 0))(
  ( (LongMap!823 (underlying!422 Cell!822)) )
))
(declare-fun thiss!992 () LongMap!822)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!116863 (= res!57207 (and (not (= (select (arr!2187 (_keys!4448 (v!3062 (underlying!422 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2187 (_keys!4448 (v!3062 (underlying!422 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!60614 () V!3385)

(declare-fun get!1414 (ValueCell!1058 V!3385) V!3385)

(declare-fun dynLambda!407 (Int (_ BitVec 64)) V!3385)

(assert (=> b!116863 (= lt!60614 (get!1414 (select (arr!2188 (_values!2708 (v!3062 (underlying!422 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2725 (v!3062 (underlying!422 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!116864 () Bool)

(declare-fun e!76380 () Bool)

(declare-fun tp_is_empty!2803 () Bool)

(assert (=> b!116864 (= e!76380 tp_is_empty!2803)))

(declare-fun b!116865 () Bool)

(declare-datatypes ((tuple2!2548 0))(
  ( (tuple2!2549 (_1!1285 Bool) (_2!1285 LongMapFixedSize!1024)) )
))
(declare-fun lt!60598 () tuple2!2548)

(declare-fun e!76372 () Bool)

(declare-datatypes ((tuple2!2550 0))(
  ( (tuple2!2551 (_1!1286 (_ BitVec 64)) (_2!1286 V!3385)) )
))
(declare-datatypes ((List!1685 0))(
  ( (Nil!1682) (Cons!1681 (h!2281 tuple2!2550) (t!5959 List!1685)) )
))
(declare-datatypes ((ListLongMap!1663 0))(
  ( (ListLongMap!1664 (toList!847 List!1685)) )
))
(declare-fun getCurrentListMap!528 (array!4615 array!4617 (_ BitVec 32) (_ BitVec 32) V!3385 V!3385 (_ BitVec 32) Int) ListLongMap!1663)

(declare-fun map!1367 (LongMapFixedSize!1024) ListLongMap!1663)

(assert (=> b!116865 (= e!76372 (not (= (getCurrentListMap!528 (_keys!4448 (v!3062 (underlying!422 thiss!992))) (_values!2708 (v!3062 (underlying!422 thiss!992))) (mask!6947 (v!3062 (underlying!422 thiss!992))) (extraKeys!2514 (v!3062 (underlying!422 thiss!992))) (zeroValue!2592 (v!3062 (underlying!422 thiss!992))) (minValue!2592 (v!3062 (underlying!422 thiss!992))) from!355 (defaultEntry!2725 (v!3062 (underlying!422 thiss!992)))) (map!1367 (_2!1285 lt!60598)))))))

(declare-fun lt!60611 () tuple2!2550)

(declare-fun lt!60604 () ListLongMap!1663)

(declare-fun lt!60609 () ListLongMap!1663)

(declare-fun lt!60607 () tuple2!2550)

(declare-fun +!165 (ListLongMap!1663 tuple2!2550) ListLongMap!1663)

(assert (=> b!116865 (= (+!165 lt!60604 lt!60611) (+!165 (+!165 lt!60609 lt!60611) lt!60607))))

(assert (=> b!116865 (= lt!60611 (tuple2!2551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2592 (v!3062 (underlying!422 thiss!992)))))))

(declare-datatypes ((Unit!3623 0))(
  ( (Unit!3624) )
))
(declare-fun lt!60608 () Unit!3623)

(declare-fun addCommutativeForDiffKeys!75 (ListLongMap!1663 (_ BitVec 64) V!3385 (_ BitVec 64) V!3385) Unit!3623)

(assert (=> b!116865 (= lt!60608 (addCommutativeForDiffKeys!75 lt!60609 (select (arr!2187 (_keys!4448 (v!3062 (underlying!422 thiss!992)))) from!355) lt!60614 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2592 (v!3062 (underlying!422 thiss!992)))))))

(declare-fun lt!60612 () ListLongMap!1663)

(assert (=> b!116865 (= lt!60612 lt!60604)))

(assert (=> b!116865 (= lt!60604 (+!165 lt!60609 lt!60607))))

(declare-fun lt!60601 () ListLongMap!1663)

(declare-fun lt!60605 () tuple2!2550)

(assert (=> b!116865 (= lt!60612 (+!165 lt!60601 lt!60605))))

(declare-fun lt!60602 () ListLongMap!1663)

(assert (=> b!116865 (= lt!60609 (+!165 lt!60602 lt!60605))))

(assert (=> b!116865 (= lt!60605 (tuple2!2551 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2592 (v!3062 (underlying!422 thiss!992)))))))

(assert (=> b!116865 (= lt!60601 (+!165 lt!60602 lt!60607))))

(assert (=> b!116865 (= lt!60607 (tuple2!2551 (select (arr!2187 (_keys!4448 (v!3062 (underlying!422 thiss!992)))) from!355) lt!60614))))

(declare-fun lt!60615 () Unit!3623)

(assert (=> b!116865 (= lt!60615 (addCommutativeForDiffKeys!75 lt!60602 (select (arr!2187 (_keys!4448 (v!3062 (underlying!422 thiss!992)))) from!355) lt!60614 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2592 (v!3062 (underlying!422 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!131 (array!4615 array!4617 (_ BitVec 32) (_ BitVec 32) V!3385 V!3385 (_ BitVec 32) Int) ListLongMap!1663)

(assert (=> b!116865 (= lt!60602 (getCurrentListMapNoExtraKeys!131 (_keys!4448 (v!3062 (underlying!422 thiss!992))) (_values!2708 (v!3062 (underlying!422 thiss!992))) (mask!6947 (v!3062 (underlying!422 thiss!992))) (extraKeys!2514 (v!3062 (underlying!422 thiss!992))) (zeroValue!2592 (v!3062 (underlying!422 thiss!992))) (minValue!2592 (v!3062 (underlying!422 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2725 (v!3062 (underlying!422 thiss!992)))))))

(declare-fun b!116866 () Bool)

(declare-fun e!76379 () Bool)

(declare-fun e!76378 () Bool)

(assert (=> b!116866 (= e!76379 e!76378)))

(declare-fun b!116867 () Bool)

(declare-fun e!76374 () Bool)

(declare-fun e!76377 () Bool)

(declare-fun mapRes!4356 () Bool)

(assert (=> b!116867 (= e!76374 (and e!76377 mapRes!4356))))

(declare-fun condMapEmpty!4355 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1024)

(declare-fun mapDefault!4355 () ValueCell!1058)

