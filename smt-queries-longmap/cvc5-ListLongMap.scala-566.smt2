; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15448 () Bool)

(assert start!15448)

(declare-fun b!153411 () Bool)

(declare-fun b_free!3181 () Bool)

(declare-fun b_next!3181 () Bool)

(assert (=> b!153411 (= b_free!3181 (not b_next!3181))))

(declare-fun tp!12061 () Bool)

(declare-fun b_and!9531 () Bool)

(assert (=> b!153411 (= tp!12061 b_and!9531)))

(declare-fun b!153416 () Bool)

(declare-fun b_free!3183 () Bool)

(declare-fun b_next!3183 () Bool)

(assert (=> b!153416 (= b_free!3183 (not b_next!3183))))

(declare-fun tp!12060 () Bool)

(declare-fun b_and!9533 () Bool)

(assert (=> b!153416 (= tp!12060 b_and!9533)))

(declare-fun b!153408 () Bool)

(declare-fun e!100151 () Bool)

(declare-fun e!100150 () Bool)

(assert (=> b!153408 (= e!100151 e!100150)))

(declare-fun res!72529 () Bool)

(assert (=> b!153408 (=> (not res!72529) (not e!100150))))

(declare-datatypes ((V!3657 0))(
  ( (V!3658 (val!1548 Int)) )
))
(declare-datatypes ((tuple2!2806 0))(
  ( (tuple2!2807 (_1!1414 (_ BitVec 64)) (_2!1414 V!3657)) )
))
(declare-datatypes ((List!1798 0))(
  ( (Nil!1795) (Cons!1794 (h!2403 tuple2!2806) (t!6580 List!1798)) )
))
(declare-datatypes ((ListLongMap!1803 0))(
  ( (ListLongMap!1804 (toList!917 List!1798)) )
))
(declare-fun lt!80625 () ListLongMap!1803)

(declare-fun lt!80624 () ListLongMap!1803)

(declare-datatypes ((array!5063 0))(
  ( (array!5064 (arr!2391 (Array (_ BitVec 32) (_ BitVec 64))) (size!2668 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1160 0))(
  ( (ValueCellFull!1160 (v!3398 V!3657)) (EmptyCell!1160) )
))
(declare-datatypes ((array!5065 0))(
  ( (array!5066 (arr!2392 (Array (_ BitVec 32) ValueCell!1160)) (size!2669 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1228 0))(
  ( (LongMapFixedSize!1229 (defaultEntry!3053 Int) (mask!7451 (_ BitVec 32)) (extraKeys!2794 (_ BitVec 32)) (zeroValue!2896 V!3657) (minValue!2896 V!3657) (_size!663 (_ BitVec 32)) (_keys!4826 array!5063) (_values!3036 array!5065) (_vacant!663 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1010 0))(
  ( (Cell!1011 (v!3399 LongMapFixedSize!1228)) )
))
(declare-datatypes ((LongMap!1010 0))(
  ( (LongMap!1011 (underlying!516 Cell!1010)) )
))
(declare-fun thiss!992 () LongMap!1010)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!153408 (= res!72529 (and (= lt!80625 lt!80624) (not (= (select (arr!2391 (_keys!4826 (v!3399 (underlying!516 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2391 (_keys!4826 (v!3399 (underlying!516 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1228)

(declare-fun map!1491 (LongMapFixedSize!1228) ListLongMap!1803)

(assert (=> b!153408 (= lt!80624 (map!1491 newMap!16))))

(declare-fun getCurrentListMap!583 (array!5063 array!5065 (_ BitVec 32) (_ BitVec 32) V!3657 V!3657 (_ BitVec 32) Int) ListLongMap!1803)

(assert (=> b!153408 (= lt!80625 (getCurrentListMap!583 (_keys!4826 (v!3399 (underlying!516 thiss!992))) (_values!3036 (v!3399 (underlying!516 thiss!992))) (mask!7451 (v!3399 (underlying!516 thiss!992))) (extraKeys!2794 (v!3399 (underlying!516 thiss!992))) (zeroValue!2896 (v!3399 (underlying!516 thiss!992))) (minValue!2896 (v!3399 (underlying!516 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3053 (v!3399 (underlying!516 thiss!992)))))))

(declare-fun b!153409 () Bool)

(declare-fun res!72528 () Bool)

(assert (=> b!153409 (=> (not res!72528) (not e!100151))))

(assert (=> b!153409 (= res!72528 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2668 (_keys!4826 (v!3399 (underlying!516 thiss!992)))))))))

(declare-fun b!153410 () Bool)

(declare-fun e!100154 () Bool)

(declare-fun tp_is_empty!3007 () Bool)

(assert (=> b!153410 (= e!100154 tp_is_empty!3007)))

(declare-fun e!100145 () Bool)

(declare-fun e!100146 () Bool)

(declare-fun array_inv!1507 (array!5063) Bool)

(declare-fun array_inv!1508 (array!5065) Bool)

(assert (=> b!153411 (= e!100146 (and tp!12061 tp_is_empty!3007 (array_inv!1507 (_keys!4826 (v!3399 (underlying!516 thiss!992)))) (array_inv!1508 (_values!3036 (v!3399 (underlying!516 thiss!992)))) e!100145))))

(declare-fun b!153412 () Bool)

(declare-fun res!72531 () Bool)

(assert (=> b!153412 (=> (not res!72531) (not e!100151))))

(assert (=> b!153412 (= res!72531 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7451 newMap!16)) (_size!663 (v!3399 (underlying!516 thiss!992)))))))

(declare-fun mapIsEmpty!5107 () Bool)

(declare-fun mapRes!5108 () Bool)

(assert (=> mapIsEmpty!5107 mapRes!5108))

(declare-fun mapNonEmpty!5107 () Bool)

(declare-fun mapRes!5107 () Bool)

(declare-fun tp!12062 () Bool)

(declare-fun e!100153 () Bool)

(assert (=> mapNonEmpty!5107 (= mapRes!5107 (and tp!12062 e!100153))))

(declare-fun mapRest!5108 () (Array (_ BitVec 32) ValueCell!1160))

(declare-fun mapValue!5107 () ValueCell!1160)

(declare-fun mapKey!5108 () (_ BitVec 32))

(assert (=> mapNonEmpty!5107 (= (arr!2392 (_values!3036 newMap!16)) (store mapRest!5108 mapKey!5108 mapValue!5107))))

(declare-fun mapIsEmpty!5108 () Bool)

(assert (=> mapIsEmpty!5108 mapRes!5107))

(declare-fun b!153414 () Bool)

(declare-fun e!100148 () Bool)

(assert (=> b!153414 (= e!100148 tp_is_empty!3007)))

(declare-fun b!153415 () Bool)

(declare-fun e!100147 () Bool)

(assert (=> b!153415 (= e!100147 tp_is_empty!3007)))

(declare-fun e!100140 () Bool)

(declare-fun e!100142 () Bool)

(assert (=> b!153416 (= e!100142 (and tp!12060 tp_is_empty!3007 (array_inv!1507 (_keys!4826 newMap!16)) (array_inv!1508 (_values!3036 newMap!16)) e!100140))))

(declare-fun b!153417 () Bool)

(declare-fun e!100152 () Bool)

(declare-fun e!100149 () Bool)

(assert (=> b!153417 (= e!100152 e!100149)))

(declare-fun b!153418 () Bool)

(assert (=> b!153418 (= e!100150 false)))

(declare-datatypes ((Unit!4886 0))(
  ( (Unit!4887) )
))
(declare-fun lt!80623 () Unit!4886)

(declare-fun e!100143 () Unit!4886)

(assert (=> b!153418 (= lt!80623 e!100143)))

(declare-fun c!29454 () Bool)

(declare-fun contains!964 (ListLongMap!1803 (_ BitVec 64)) Bool)

(assert (=> b!153418 (= c!29454 (contains!964 lt!80624 (select (arr!2391 (_keys!4826 (v!3399 (underlying!516 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2808 0))(
  ( (tuple2!2809 (_1!1415 Bool) (_2!1415 LongMapFixedSize!1228)) )
))
(declare-fun lt!80621 () tuple2!2808)

(declare-fun update!235 (LongMapFixedSize!1228 (_ BitVec 64) V!3657) tuple2!2808)

(declare-fun get!1598 (ValueCell!1160 V!3657) V!3657)

(declare-fun dynLambda!467 (Int (_ BitVec 64)) V!3657)

(assert (=> b!153418 (= lt!80621 (update!235 newMap!16 (select (arr!2391 (_keys!4826 (v!3399 (underlying!516 thiss!992)))) from!355) (get!1598 (select (arr!2392 (_values!3036 (v!3399 (underlying!516 thiss!992)))) from!355) (dynLambda!467 (defaultEntry!3053 (v!3399 (underlying!516 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!153419 () Bool)

(assert (=> b!153419 (= e!100140 (and e!100154 mapRes!5107))))

(declare-fun condMapEmpty!5108 () Bool)

(declare-fun mapDefault!5107 () ValueCell!1160)

