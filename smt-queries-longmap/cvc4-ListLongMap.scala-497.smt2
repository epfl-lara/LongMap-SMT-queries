; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11268 () Bool)

(assert start!11268)

(declare-fun b!92931 () Bool)

(declare-fun b_free!2361 () Bool)

(declare-fun b_next!2361 () Bool)

(assert (=> b!92931 (= b_free!2361 (not b_next!2361))))

(declare-fun tp!9341 () Bool)

(declare-fun b_and!5651 () Bool)

(assert (=> b!92931 (= tp!9341 b_and!5651)))

(declare-fun b!92917 () Bool)

(declare-fun b_free!2363 () Bool)

(declare-fun b_next!2363 () Bool)

(assert (=> b!92917 (= b_free!2363 (not b_next!2363))))

(declare-fun tp!9342 () Bool)

(declare-fun b_and!5653 () Bool)

(assert (=> b!92917 (= tp!9342 b_and!5653)))

(declare-fun mapIsEmpty!3619 () Bool)

(declare-fun mapRes!3620 () Bool)

(assert (=> mapIsEmpty!3619 mapRes!3620))

(declare-fun b!92913 () Bool)

(declare-fun e!60625 () Bool)

(declare-fun e!60623 () Bool)

(assert (=> b!92913 (= e!60625 e!60623)))

(declare-fun res!47214 () Bool)

(declare-fun e!60633 () Bool)

(assert (=> start!11268 (=> (not res!47214) (not e!60633))))

(declare-datatypes ((V!3109 0))(
  ( (V!3110 (val!1343 Int)) )
))
(declare-datatypes ((array!4165 0))(
  ( (array!4166 (arr!1981 (Array (_ BitVec 32) (_ BitVec 64))) (size!2229 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!955 0))(
  ( (ValueCellFull!955 (v!2741 V!3109)) (EmptyCell!955) )
))
(declare-datatypes ((array!4167 0))(
  ( (array!4168 (arr!1982 (Array (_ BitVec 32) ValueCell!955)) (size!2230 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!818 0))(
  ( (LongMapFixedSize!819 (defaultEntry!2423 Int) (mask!6491 (_ BitVec 32)) (extraKeys!2252 (_ BitVec 32)) (zeroValue!2310 V!3109) (minValue!2310 V!3109) (_size!458 (_ BitVec 32)) (_keys!4105 array!4165) (_values!2406 array!4167) (_vacant!458 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!618 0))(
  ( (Cell!619 (v!2742 LongMapFixedSize!818)) )
))
(declare-datatypes ((LongMap!618 0))(
  ( (LongMap!619 (underlying!320 Cell!618)) )
))
(declare-fun thiss!992 () LongMap!618)

(declare-fun valid!363 (LongMap!618) Bool)

(assert (=> start!11268 (= res!47214 (valid!363 thiss!992))))

(assert (=> start!11268 e!60633))

(assert (=> start!11268 e!60625))

(assert (=> start!11268 true))

(declare-fun e!60622 () Bool)

(assert (=> start!11268 e!60622))

(declare-fun b!92914 () Bool)

(declare-fun e!60621 () Bool)

(declare-fun tp_is_empty!2597 () Bool)

(assert (=> b!92914 (= e!60621 tp_is_empty!2597)))

(declare-fun b!92915 () Bool)

(declare-fun e!60629 () Bool)

(declare-fun e!60632 () Bool)

(assert (=> b!92915 (= e!60629 e!60632)))

(declare-fun res!47212 () Bool)

(assert (=> b!92915 (=> res!47212 e!60632)))

(declare-datatypes ((tuple2!2290 0))(
  ( (tuple2!2291 (_1!1156 Bool) (_2!1156 LongMapFixedSize!818)) )
))
(declare-fun lt!45783 () tuple2!2290)

(assert (=> b!92915 (= res!47212 (not (_1!1156 lt!45783)))))

(declare-fun lt!45776 () tuple2!2290)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun repackFrom!11 (LongMap!618 LongMapFixedSize!818 (_ BitVec 32)) tuple2!2290)

(assert (=> b!92915 (= lt!45783 (repackFrom!11 thiss!992 (_2!1156 lt!45776) (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!92916 () Bool)

(declare-fun e!60626 () Bool)

(declare-fun e!60627 () Bool)

(assert (=> b!92916 (= e!60626 e!60627)))

(declare-fun res!47210 () Bool)

(assert (=> b!92916 (=> (not res!47210) (not e!60627))))

(assert (=> b!92916 (= res!47210 (and (not (= (select (arr!1981 (_keys!4105 (v!2742 (underlying!320 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1981 (_keys!4105 (v!2742 (underlying!320 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!45792 () V!3109)

(declare-fun get!1248 (ValueCell!955 V!3109) V!3109)

(declare-fun dynLambda!358 (Int (_ BitVec 64)) V!3109)

(assert (=> b!92916 (= lt!45792 (get!1248 (select (arr!1982 (_values!2406 (v!2742 (underlying!320 thiss!992)))) from!355) (dynLambda!358 (defaultEntry!2423 (v!2742 (underlying!320 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!60624 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!818)

(declare-fun array_inv!1229 (array!4165) Bool)

(declare-fun array_inv!1230 (array!4167) Bool)

(assert (=> b!92917 (= e!60622 (and tp!9342 tp_is_empty!2597 (array_inv!1229 (_keys!4105 newMap!16)) (array_inv!1230 (_values!2406 newMap!16)) e!60624))))

(declare-fun mapNonEmpty!3619 () Bool)

(declare-fun tp!9343 () Bool)

(assert (=> mapNonEmpty!3619 (= mapRes!3620 (and tp!9343 e!60621))))

(declare-fun mapKey!3619 () (_ BitVec 32))

(declare-fun mapRest!3619 () (Array (_ BitVec 32) ValueCell!955))

(declare-fun mapValue!3619 () ValueCell!955)

(assert (=> mapNonEmpty!3619 (= (arr!1982 (_values!2406 (v!2742 (underlying!320 thiss!992)))) (store mapRest!3619 mapKey!3619 mapValue!3619))))

(declare-fun b!92918 () Bool)

(declare-fun e!60620 () Bool)

(assert (=> b!92918 (= e!60623 e!60620)))

(declare-fun b!92919 () Bool)

(declare-fun e!60635 () Bool)

(declare-fun mapRes!3619 () Bool)

(assert (=> b!92919 (= e!60624 (and e!60635 mapRes!3619))))

(declare-fun condMapEmpty!3620 () Bool)

(declare-fun mapDefault!3620 () ValueCell!955)

