; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13822 () Bool)

(assert start!13822)

(declare-fun b!127542 () Bool)

(declare-fun b_free!2865 () Bool)

(declare-fun b_next!2865 () Bool)

(assert (=> b!127542 (= b_free!2865 (not b_next!2865))))

(declare-fun tp!11012 () Bool)

(declare-fun b_and!7867 () Bool)

(assert (=> b!127542 (= tp!11012 b_and!7867)))

(declare-fun b!127540 () Bool)

(declare-fun b_free!2867 () Bool)

(declare-fun b_next!2867 () Bool)

(assert (=> b!127540 (= b_free!2867 (not b_next!2867))))

(declare-fun tp!11010 () Bool)

(declare-fun b_and!7869 () Bool)

(assert (=> b!127540 (= tp!11010 b_and!7869)))

(declare-fun b!127538 () Bool)

(declare-fun res!61656 () Bool)

(declare-fun e!83284 () Bool)

(assert (=> b!127538 (=> (not res!61656) (not e!83284))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3445 0))(
  ( (V!3446 (val!1469 Int)) )
))
(declare-datatypes ((array!4717 0))(
  ( (array!4718 (arr!2233 (Array (_ BitVec 32) (_ BitVec 64))) (size!2498 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1081 0))(
  ( (ValueCellFull!1081 (v!3141 V!3445)) (EmptyCell!1081) )
))
(declare-datatypes ((array!4719 0))(
  ( (array!4720 (arr!2234 (Array (_ BitVec 32) ValueCell!1081)) (size!2499 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1070 0))(
  ( (LongMapFixedSize!1071 (defaultEntry!2803 Int) (mask!7069 (_ BitVec 32)) (extraKeys!2580 (_ BitVec 32)) (zeroValue!2664 V!3445) (minValue!2664 V!3445) (_size!584 (_ BitVec 32)) (_keys!4540 array!4717) (_values!2786 array!4719) (_vacant!584 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!864 0))(
  ( (Cell!865 (v!3142 LongMapFixedSize!1070)) )
))
(declare-datatypes ((LongMap!864 0))(
  ( (LongMap!865 (underlying!443 Cell!864)) )
))
(declare-fun thiss!992 () LongMap!864)

(assert (=> b!127538 (= res!61656 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2498 (_keys!4540 (v!3142 (underlying!443 thiss!992)))))))))

(declare-fun b!127539 () Bool)

(declare-fun res!61653 () Bool)

(assert (=> b!127539 (=> (not res!61653) (not e!83284))))

(declare-fun newMap!16 () LongMapFixedSize!1070)

(declare-fun valid!511 (LongMapFixedSize!1070) Bool)

(assert (=> b!127539 (= res!61653 (valid!511 newMap!16))))

(declare-fun e!83288 () Bool)

(declare-fun tp_is_empty!2849 () Bool)

(declare-fun e!83289 () Bool)

(declare-fun array_inv!1405 (array!4717) Bool)

(declare-fun array_inv!1406 (array!4719) Bool)

(assert (=> b!127540 (= e!83288 (and tp!11010 tp_is_empty!2849 (array_inv!1405 (_keys!4540 newMap!16)) (array_inv!1406 (_values!2786 newMap!16)) e!83289))))

(declare-fun b!127541 () Bool)

(declare-fun e!83292 () Bool)

(assert (=> b!127541 (= e!83292 tp_is_empty!2849)))

(declare-fun e!83285 () Bool)

(declare-fun e!83286 () Bool)

(assert (=> b!127542 (= e!83286 (and tp!11012 tp_is_empty!2849 (array_inv!1405 (_keys!4540 (v!3142 (underlying!443 thiss!992)))) (array_inv!1406 (_values!2786 (v!3142 (underlying!443 thiss!992)))) e!83285))))

(declare-fun b!127543 () Bool)

(declare-fun res!61652 () Bool)

(declare-fun e!83294 () Bool)

(assert (=> b!127543 (=> (not res!61652) (not e!83294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!127543 (= res!61652 (validMask!0 (mask!7069 (v!3142 (underlying!443 thiss!992)))))))

(declare-fun b!127544 () Bool)

(declare-fun e!83297 () Bool)

(assert (=> b!127544 (= e!83297 tp_is_empty!2849)))

(declare-fun mapIsEmpty!4531 () Bool)

(declare-fun mapRes!4531 () Bool)

(assert (=> mapIsEmpty!4531 mapRes!4531))

(declare-fun mapIsEmpty!4532 () Bool)

(declare-fun mapRes!4532 () Bool)

(assert (=> mapIsEmpty!4532 mapRes!4532))

(declare-fun b!127545 () Bool)

(declare-fun e!83293 () Bool)

(assert (=> b!127545 (= e!83293 e!83286)))

(declare-fun b!127546 () Bool)

(declare-fun e!83296 () Bool)

(assert (=> b!127546 (= e!83296 e!83294)))

(declare-fun res!61655 () Bool)

(assert (=> b!127546 (=> (not res!61655) (not e!83294))))

(declare-datatypes ((tuple2!2592 0))(
  ( (tuple2!2593 (_1!1307 (_ BitVec 64)) (_2!1307 V!3445)) )
))
(declare-datatypes ((List!1703 0))(
  ( (Nil!1700) (Cons!1699 (h!2302 tuple2!2592) (t!6074 List!1703)) )
))
(declare-datatypes ((ListLongMap!1689 0))(
  ( (ListLongMap!1690 (toList!860 List!1703)) )
))
(declare-fun lt!65974 () ListLongMap!1689)

(declare-fun contains!883 (ListLongMap!1689 (_ BitVec 64)) Bool)

(assert (=> b!127546 (= res!61655 (contains!883 lt!65974 (select (arr!2233 (_keys!4540 (v!3142 (underlying!443 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2594 0))(
  ( (tuple2!2595 (_1!1308 Bool) (_2!1308 LongMapFixedSize!1070)) )
))
(declare-fun lt!65973 () tuple2!2594)

(declare-fun update!186 (LongMapFixedSize!1070 (_ BitVec 64) V!3445) tuple2!2594)

(declare-fun get!1452 (ValueCell!1081 V!3445) V!3445)

(declare-fun dynLambda!417 (Int (_ BitVec 64)) V!3445)

(assert (=> b!127546 (= lt!65973 (update!186 newMap!16 (select (arr!2233 (_keys!4540 (v!3142 (underlying!443 thiss!992)))) from!355) (get!1452 (select (arr!2234 (_values!2786 (v!3142 (underlying!443 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2803 (v!3142 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!127547 () Bool)

(assert (=> b!127547 (= e!83294 (and (= (size!2499 (_values!2786 (v!3142 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7069 (v!3142 (underlying!443 thiss!992))))) (= (size!2498 (_keys!4540 (v!3142 (underlying!443 thiss!992)))) (size!2499 (_values!2786 (v!3142 (underlying!443 thiss!992))))) (bvslt (mask!7069 (v!3142 (underlying!443 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!127548 () Bool)

(declare-fun res!61654 () Bool)

(assert (=> b!127548 (=> (not res!61654) (not e!83284))))

(assert (=> b!127548 (= res!61654 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7069 newMap!16)) (_size!584 (v!3142 (underlying!443 thiss!992)))))))

(declare-fun b!127549 () Bool)

(assert (=> b!127549 (= e!83285 (and e!83292 mapRes!4532))))

(declare-fun condMapEmpty!4531 () Bool)

(declare-fun mapDefault!4531 () ValueCell!1081)

