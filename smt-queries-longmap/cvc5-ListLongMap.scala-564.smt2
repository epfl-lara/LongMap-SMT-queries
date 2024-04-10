; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15262 () Bool)

(assert start!15262)

(declare-fun b!147289 () Bool)

(declare-fun b_free!3157 () Bool)

(declare-fun b_next!3157 () Bool)

(assert (=> b!147289 (= b_free!3157 (not b_next!3157))))

(declare-fun tp!11979 () Bool)

(declare-fun b_and!9251 () Bool)

(assert (=> b!147289 (= tp!11979 b_and!9251)))

(declare-fun b!147273 () Bool)

(declare-fun b_free!3159 () Bool)

(declare-fun b_next!3159 () Bool)

(assert (=> b!147273 (= b_free!3159 (not b_next!3159))))

(declare-fun tp!11977 () Bool)

(declare-fun b_and!9253 () Bool)

(assert (=> b!147273 (= tp!11977 b_and!9253)))

(declare-fun mapIsEmpty!5061 () Bool)

(declare-fun mapRes!5062 () Bool)

(assert (=> mapIsEmpty!5061 mapRes!5062))

(declare-fun b!147272 () Bool)

(declare-fun e!96194 () Bool)

(declare-fun e!96185 () Bool)

(assert (=> b!147272 (= e!96194 e!96185)))

(declare-fun res!69994 () Bool)

(assert (=> b!147272 (=> (not res!69994) (not e!96185))))

(declare-datatypes ((V!3641 0))(
  ( (V!3642 (val!1542 Int)) )
))
(declare-datatypes ((tuple2!2786 0))(
  ( (tuple2!2787 (_1!1404 (_ BitVec 64)) (_2!1404 V!3641)) )
))
(declare-datatypes ((List!1789 0))(
  ( (Nil!1786) (Cons!1785 (h!2393 tuple2!2786) (t!6530 List!1789)) )
))
(declare-datatypes ((ListLongMap!1791 0))(
  ( (ListLongMap!1792 (toList!911 List!1789)) )
))
(declare-fun lt!77717 () ListLongMap!1791)

(declare-fun lt!77712 () ListLongMap!1791)

(assert (=> b!147272 (= res!69994 (= lt!77717 lt!77712))))

(declare-datatypes ((array!5037 0))(
  ( (array!5038 (arr!2379 (Array (_ BitVec 32) (_ BitVec 64))) (size!2655 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1154 0))(
  ( (ValueCellFull!1154 (v!3375 V!3641)) (EmptyCell!1154) )
))
(declare-datatypes ((array!5039 0))(
  ( (array!5040 (arr!2380 (Array (_ BitVec 32) ValueCell!1154)) (size!2656 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1216 0))(
  ( (LongMapFixedSize!1217 (defaultEntry!3027 Int) (mask!7411 (_ BitVec 32)) (extraKeys!2772 (_ BitVec 32)) (zeroValue!2872 V!3641) (minValue!2872 V!3641) (_size!657 (_ BitVec 32)) (_keys!4796 array!5037) (_values!3010 array!5039) (_vacant!657 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1216)

(declare-fun map!1483 (LongMapFixedSize!1216) ListLongMap!1791)

(assert (=> b!147272 (= lt!77712 (map!1483 newMap!16))))

(declare-datatypes ((Cell!998 0))(
  ( (Cell!999 (v!3376 LongMapFixedSize!1216)) )
))
(declare-datatypes ((LongMap!998 0))(
  ( (LongMap!999 (underlying!510 Cell!998)) )
))
(declare-fun thiss!992 () LongMap!998)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!579 (array!5037 array!5039 (_ BitVec 32) (_ BitVec 32) V!3641 V!3641 (_ BitVec 32) Int) ListLongMap!1791)

(assert (=> b!147272 (= lt!77717 (getCurrentListMap!579 (_keys!4796 (v!3376 (underlying!510 thiss!992))) (_values!3010 (v!3376 (underlying!510 thiss!992))) (mask!7411 (v!3376 (underlying!510 thiss!992))) (extraKeys!2772 (v!3376 (underlying!510 thiss!992))) (zeroValue!2872 (v!3376 (underlying!510 thiss!992))) (minValue!2872 (v!3376 (underlying!510 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3027 (v!3376 (underlying!510 thiss!992)))))))

(declare-fun tp_is_empty!2995 () Bool)

(declare-fun e!96191 () Bool)

(declare-fun e!96183 () Bool)

(declare-fun array_inv!1495 (array!5037) Bool)

(declare-fun array_inv!1496 (array!5039) Bool)

(assert (=> b!147273 (= e!96191 (and tp!11977 tp_is_empty!2995 (array_inv!1495 (_keys!4796 newMap!16)) (array_inv!1496 (_values!3010 newMap!16)) e!96183))))

(declare-fun b!147274 () Bool)

(declare-fun res!69995 () Bool)

(assert (=> b!147274 (=> (not res!69995) (not e!96194))))

(assert (=> b!147274 (= res!69995 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7411 newMap!16)) (_size!657 (v!3376 (underlying!510 thiss!992)))))))

(declare-fun b!147276 () Bool)

(declare-fun e!96188 () Bool)

(declare-fun e!96190 () Bool)

(assert (=> b!147276 (= e!96188 e!96190)))

(declare-fun b!147277 () Bool)

(declare-datatypes ((Unit!4654 0))(
  ( (Unit!4655) )
))
(declare-fun e!96182 () Unit!4654)

(declare-fun Unit!4656 () Unit!4654)

(assert (=> b!147277 (= e!96182 Unit!4656)))

(declare-fun b!147278 () Bool)

(declare-fun e!96193 () Bool)

(assert (=> b!147278 (= e!96185 e!96193)))

(declare-fun res!69990 () Bool)

(assert (=> b!147278 (=> (not res!69990) (not e!96193))))

(assert (=> b!147278 (= res!69990 (and (not (= (select (arr!2379 (_keys!4796 (v!3376 (underlying!510 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2379 (_keys!4796 (v!3376 (underlying!510 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!77715 () V!3641)

(declare-fun get!1587 (ValueCell!1154 V!3641) V!3641)

(declare-fun dynLambda!463 (Int (_ BitVec 64)) V!3641)

(assert (=> b!147278 (= lt!77715 (get!1587 (select (arr!2380 (_values!3010 (v!3376 (underlying!510 thiss!992)))) from!355) (dynLambda!463 (defaultEntry!3027 (v!3376 (underlying!510 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!147279 () Bool)

(declare-fun e!96186 () Bool)

(assert (=> b!147279 (= e!96183 (and e!96186 mapRes!5062))))

(declare-fun condMapEmpty!5061 () Bool)

(declare-fun mapDefault!5061 () ValueCell!1154)

