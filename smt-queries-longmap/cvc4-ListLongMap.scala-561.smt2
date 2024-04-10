; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15212 () Bool)

(assert start!15212)

(declare-fun b!146476 () Bool)

(declare-fun b_free!3129 () Bool)

(declare-fun b_next!3129 () Bool)

(assert (=> b!146476 (= b_free!3129 (not b_next!3129))))

(declare-fun tp!11891 () Bool)

(declare-fun b_and!9175 () Bool)

(assert (=> b!146476 (= tp!11891 b_and!9175)))

(declare-fun b!146495 () Bool)

(declare-fun b_free!3131 () Bool)

(declare-fun b_next!3131 () Bool)

(assert (=> b!146495 (= b_free!3131 (not b_next!3131))))

(declare-fun tp!11890 () Bool)

(declare-fun b_and!9177 () Bool)

(assert (=> b!146495 (= tp!11890 b_and!9177)))

(declare-fun mapNonEmpty!5015 () Bool)

(declare-fun mapRes!5015 () Bool)

(declare-fun tp!11892 () Bool)

(declare-fun e!95605 () Bool)

(assert (=> mapNonEmpty!5015 (= mapRes!5015 (and tp!11892 e!95605))))

(declare-datatypes ((V!3621 0))(
  ( (V!3622 (val!1535 Int)) )
))
(declare-datatypes ((array!5007 0))(
  ( (array!5008 (arr!2365 (Array (_ BitVec 32) (_ BitVec 64))) (size!2641 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1147 0))(
  ( (ValueCellFull!1147 (v!3359 V!3621)) (EmptyCell!1147) )
))
(declare-datatypes ((array!5009 0))(
  ( (array!5010 (arr!2366 (Array (_ BitVec 32) ValueCell!1147)) (size!2642 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1202 0))(
  ( (LongMapFixedSize!1203 (defaultEntry!3017 Int) (mask!7395 (_ BitVec 32)) (extraKeys!2762 (_ BitVec 32)) (zeroValue!2862 V!3621) (minValue!2862 V!3621) (_size!650 (_ BitVec 32)) (_keys!4786 array!5007) (_values!3000 array!5009) (_vacant!650 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!984 0))(
  ( (Cell!985 (v!3360 LongMapFixedSize!1202)) )
))
(declare-datatypes ((LongMap!984 0))(
  ( (LongMap!985 (underlying!503 Cell!984)) )
))
(declare-fun thiss!992 () LongMap!984)

(declare-fun mapRest!5015 () (Array (_ BitVec 32) ValueCell!1147))

(declare-fun mapKey!5015 () (_ BitVec 32))

(declare-fun mapValue!5016 () ValueCell!1147)

(assert (=> mapNonEmpty!5015 (= (arr!2366 (_values!3000 (v!3360 (underlying!503 thiss!992)))) (store mapRest!5015 mapKey!5015 mapValue!5016))))

(declare-fun e!95598 () Bool)

(declare-fun e!95607 () Bool)

(declare-fun tp_is_empty!2981 () Bool)

(declare-fun array_inv!1487 (array!5007) Bool)

(declare-fun array_inv!1488 (array!5009) Bool)

(assert (=> b!146476 (= e!95598 (and tp!11891 tp_is_empty!2981 (array_inv!1487 (_keys!4786 (v!3360 (underlying!503 thiss!992)))) (array_inv!1488 (_values!3000 (v!3360 (underlying!503 thiss!992)))) e!95607))))

(declare-fun res!69684 () Bool)

(declare-fun e!95593 () Bool)

(assert (=> start!15212 (=> (not res!69684) (not e!95593))))

(declare-fun valid!586 (LongMap!984) Bool)

(assert (=> start!15212 (= res!69684 (valid!586 thiss!992))))

(assert (=> start!15212 e!95593))

(declare-fun e!95595 () Bool)

(assert (=> start!15212 e!95595))

(assert (=> start!15212 true))

(declare-fun e!95596 () Bool)

(assert (=> start!15212 e!95596))

(declare-fun b!146477 () Bool)

(assert (=> b!146477 (= e!95605 tp_is_empty!2981)))

(declare-fun b!146478 () Bool)

(declare-fun e!95600 () Bool)

(assert (=> b!146478 (= e!95600 e!95598)))

(declare-fun b!146479 () Bool)

(declare-fun e!95597 () Bool)

(assert (=> b!146479 (= e!95597 tp_is_empty!2981)))

(declare-fun b!146480 () Bool)

(declare-datatypes ((Unit!4630 0))(
  ( (Unit!4631) )
))
(declare-fun e!95603 () Unit!4630)

(declare-fun Unit!4632 () Unit!4630)

(assert (=> b!146480 (= e!95603 Unit!4632)))

(declare-fun b!146481 () Bool)

(declare-fun e!95608 () Bool)

(assert (=> b!146481 (= e!95608 tp_is_empty!2981)))

(declare-fun b!146482 () Bool)

(declare-fun e!95592 () Bool)

(assert (=> b!146482 (= e!95593 e!95592)))

(declare-fun res!69687 () Bool)

(assert (=> b!146482 (=> (not res!69687) (not e!95592))))

(declare-datatypes ((tuple2!2766 0))(
  ( (tuple2!2767 (_1!1394 (_ BitVec 64)) (_2!1394 V!3621)) )
))
(declare-datatypes ((List!1782 0))(
  ( (Nil!1779) (Cons!1778 (h!2386 tuple2!2766) (t!6495 List!1782)) )
))
(declare-datatypes ((ListLongMap!1781 0))(
  ( (ListLongMap!1782 (toList!906 List!1782)) )
))
(declare-fun lt!77088 () ListLongMap!1781)

(declare-fun lt!77084 () ListLongMap!1781)

(assert (=> b!146482 (= res!69687 (= lt!77088 lt!77084))))

(declare-fun newMap!16 () LongMapFixedSize!1202)

(declare-fun map!1472 (LongMapFixedSize!1202) ListLongMap!1781)

(assert (=> b!146482 (= lt!77084 (map!1472 newMap!16))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!575 (array!5007 array!5009 (_ BitVec 32) (_ BitVec 32) V!3621 V!3621 (_ BitVec 32) Int) ListLongMap!1781)

(assert (=> b!146482 (= lt!77088 (getCurrentListMap!575 (_keys!4786 (v!3360 (underlying!503 thiss!992))) (_values!3000 (v!3360 (underlying!503 thiss!992))) (mask!7395 (v!3360 (underlying!503 thiss!992))) (extraKeys!2762 (v!3360 (underlying!503 thiss!992))) (zeroValue!2862 (v!3360 (underlying!503 thiss!992))) (minValue!2862 (v!3360 (underlying!503 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3017 (v!3360 (underlying!503 thiss!992)))))))

(declare-fun b!146483 () Bool)

(declare-fun e!95591 () Bool)

(assert (=> b!146483 (= e!95591 (bvslt (bvsub from!355 #b00000000000000000000000000000001) from!355))))

(declare-fun b!146484 () Bool)

(declare-fun e!95594 () Bool)

(assert (=> b!146484 (= e!95592 e!95594)))

(declare-fun res!69685 () Bool)

(assert (=> b!146484 (=> (not res!69685) (not e!95594))))

(assert (=> b!146484 (= res!69685 (and (not (= (select (arr!2365 (_keys!4786 (v!3360 (underlying!503 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2365 (_keys!4786 (v!3360 (underlying!503 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!77081 () V!3621)

(declare-fun get!1575 (ValueCell!1147 V!3621) V!3621)

(declare-fun dynLambda!459 (Int (_ BitVec 64)) V!3621)

(assert (=> b!146484 (= lt!77081 (get!1575 (select (arr!2366 (_values!3000 (v!3360 (underlying!503 thiss!992)))) from!355) (dynLambda!459 (defaultEntry!3017 (v!3360 (underlying!503 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!146485 () Bool)

(declare-fun res!69683 () Bool)

(assert (=> b!146485 (=> (not res!69683) (not e!95593))))

(assert (=> b!146485 (= res!69683 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2641 (_keys!4786 (v!3360 (underlying!503 thiss!992)))))))))

(declare-fun b!146486 () Bool)

(declare-fun e!95602 () Bool)

(assert (=> b!146486 (= e!95602 (not e!95591))))

(declare-fun res!69686 () Bool)

(assert (=> b!146486 (=> res!69686 e!95591)))

(declare-datatypes ((tuple2!2768 0))(
  ( (tuple2!2769 (_1!1395 Bool) (_2!1395 LongMapFixedSize!1202)) )
))
(declare-fun lt!77092 () tuple2!2768)

(assert (=> b!146486 (= res!69686 (not (= (getCurrentListMap!575 (_keys!4786 (v!3360 (underlying!503 thiss!992))) (_values!3000 (v!3360 (underlying!503 thiss!992))) (mask!7395 (v!3360 (underlying!503 thiss!992))) (extraKeys!2762 (v!3360 (underlying!503 thiss!992))) (zeroValue!2862 (v!3360 (underlying!503 thiss!992))) (minValue!2862 (v!3360 (underlying!503 thiss!992))) from!355 (defaultEntry!3017 (v!3360 (underlying!503 thiss!992)))) (map!1472 (_2!1395 lt!77092)))))))

(declare-fun lt!77091 () tuple2!2766)

(declare-fun lt!77078 () ListLongMap!1781)

(declare-fun lt!77087 () ListLongMap!1781)

(declare-fun lt!77083 () tuple2!2766)

(declare-fun +!186 (ListLongMap!1781 tuple2!2766) ListLongMap!1781)

(assert (=> b!146486 (= (+!186 lt!77087 lt!77091) (+!186 (+!186 lt!77078 lt!77091) lt!77083))))

(assert (=> b!146486 (= lt!77091 (tuple2!2767 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2862 (v!3360 (underlying!503 thiss!992)))))))

(declare-fun lt!77082 () Unit!4630)

(declare-fun addCommutativeForDiffKeys!79 (ListLongMap!1781 (_ BitVec 64) V!3621 (_ BitVec 64) V!3621) Unit!4630)

(assert (=> b!146486 (= lt!77082 (addCommutativeForDiffKeys!79 lt!77078 (select (arr!2365 (_keys!4786 (v!3360 (underlying!503 thiss!992)))) from!355) lt!77081 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2862 (v!3360 (underlying!503 thiss!992)))))))

(declare-fun lt!77080 () ListLongMap!1781)

(assert (=> b!146486 (= lt!77080 lt!77087)))

(assert (=> b!146486 (= lt!77087 (+!186 lt!77078 lt!77083))))

(declare-fun lt!77079 () ListLongMap!1781)

(declare-fun lt!77076 () tuple2!2766)

(assert (=> b!146486 (= lt!77080 (+!186 lt!77079 lt!77076))))

(declare-fun lt!77077 () ListLongMap!1781)

(assert (=> b!146486 (= lt!77078 (+!186 lt!77077 lt!77076))))

(assert (=> b!146486 (= lt!77076 (tuple2!2767 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2862 (v!3360 (underlying!503 thiss!992)))))))

(assert (=> b!146486 (= lt!77079 (+!186 lt!77077 lt!77083))))

(assert (=> b!146486 (= lt!77083 (tuple2!2767 (select (arr!2365 (_keys!4786 (v!3360 (underlying!503 thiss!992)))) from!355) lt!77081))))

(declare-fun lt!77090 () Unit!4630)

(assert (=> b!146486 (= lt!77090 (addCommutativeForDiffKeys!79 lt!77077 (select (arr!2365 (_keys!4786 (v!3360 (underlying!503 thiss!992)))) from!355) lt!77081 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2862 (v!3360 (underlying!503 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!154 (array!5007 array!5009 (_ BitVec 32) (_ BitVec 32) V!3621 V!3621 (_ BitVec 32) Int) ListLongMap!1781)

(assert (=> b!146486 (= lt!77077 (getCurrentListMapNoExtraKeys!154 (_keys!4786 (v!3360 (underlying!503 thiss!992))) (_values!3000 (v!3360 (underlying!503 thiss!992))) (mask!7395 (v!3360 (underlying!503 thiss!992))) (extraKeys!2762 (v!3360 (underlying!503 thiss!992))) (zeroValue!2862 (v!3360 (underlying!503 thiss!992))) (minValue!2862 (v!3360 (underlying!503 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3017 (v!3360 (underlying!503 thiss!992)))))))

(declare-fun mapNonEmpty!5016 () Bool)

(declare-fun mapRes!5016 () Bool)

(declare-fun tp!11889 () Bool)

(assert (=> mapNonEmpty!5016 (= mapRes!5016 (and tp!11889 e!95608))))

(declare-fun mapKey!5016 () (_ BitVec 32))

(declare-fun mapValue!5015 () ValueCell!1147)

(declare-fun mapRest!5016 () (Array (_ BitVec 32) ValueCell!1147))

(assert (=> mapNonEmpty!5016 (= (arr!2366 (_values!3000 newMap!16)) (store mapRest!5016 mapKey!5016 mapValue!5015))))

(declare-fun b!146487 () Bool)

(assert (=> b!146487 (= e!95595 e!95600)))

(declare-fun b!146488 () Bool)

(declare-fun e!95606 () Bool)

(declare-fun e!95604 () Bool)

(assert (=> b!146488 (= e!95606 (and e!95604 mapRes!5016))))

(declare-fun condMapEmpty!5015 () Bool)

(declare-fun mapDefault!5016 () ValueCell!1147)

