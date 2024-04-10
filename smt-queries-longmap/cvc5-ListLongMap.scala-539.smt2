; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13818 () Bool)

(assert start!13818)

(declare-fun b!127441 () Bool)

(declare-fun b_free!2857 () Bool)

(declare-fun b_next!2857 () Bool)

(assert (=> b!127441 (= b_free!2857 (not b_next!2857))))

(declare-fun tp!10985 () Bool)

(declare-fun b_and!7851 () Bool)

(assert (=> b!127441 (= tp!10985 b_and!7851)))

(declare-fun b!127446 () Bool)

(declare-fun b_free!2859 () Bool)

(declare-fun b_next!2859 () Bool)

(assert (=> b!127446 (= b_free!2859 (not b_next!2859))))

(declare-fun tp!10988 () Bool)

(declare-fun b_and!7853 () Bool)

(assert (=> b!127446 (= tp!10988 b_and!7853)))

(declare-fun res!61616 () Bool)

(declare-fun e!83206 () Bool)

(assert (=> start!13818 (=> (not res!61616) (not e!83206))))

(declare-datatypes ((V!3441 0))(
  ( (V!3442 (val!1467 Int)) )
))
(declare-datatypes ((array!4709 0))(
  ( (array!4710 (arr!2229 (Array (_ BitVec 32) (_ BitVec 64))) (size!2494 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1079 0))(
  ( (ValueCellFull!1079 (v!3137 V!3441)) (EmptyCell!1079) )
))
(declare-datatypes ((array!4711 0))(
  ( (array!4712 (arr!2230 (Array (_ BitVec 32) ValueCell!1079)) (size!2495 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1066 0))(
  ( (LongMapFixedSize!1067 (defaultEntry!2801 Int) (mask!7067 (_ BitVec 32)) (extraKeys!2578 (_ BitVec 32)) (zeroValue!2662 V!3441) (minValue!2662 V!3441) (_size!582 (_ BitVec 32)) (_keys!4538 array!4709) (_values!2784 array!4711) (_vacant!582 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!860 0))(
  ( (Cell!861 (v!3138 LongMapFixedSize!1066)) )
))
(declare-datatypes ((LongMap!860 0))(
  ( (LongMap!861 (underlying!441 Cell!860)) )
))
(declare-fun thiss!992 () LongMap!860)

(declare-fun valid!507 (LongMap!860) Bool)

(assert (=> start!13818 (= res!61616 (valid!507 thiss!992))))

(assert (=> start!13818 e!83206))

(declare-fun e!83196 () Bool)

(assert (=> start!13818 e!83196))

(assert (=> start!13818 true))

(declare-fun e!83203 () Bool)

(assert (=> start!13818 e!83203))

(declare-fun b!127432 () Bool)

(declare-fun e!83208 () Bool)

(declare-fun e!83205 () Bool)

(assert (=> b!127432 (= e!83208 e!83205)))

(declare-fun res!61612 () Bool)

(assert (=> b!127432 (=> (not res!61612) (not e!83205))))

(declare-datatypes ((tuple2!2584 0))(
  ( (tuple2!2585 (_1!1303 (_ BitVec 64)) (_2!1303 V!3441)) )
))
(declare-datatypes ((List!1701 0))(
  ( (Nil!1698) (Cons!1697 (h!2300 tuple2!2584) (t!6064 List!1701)) )
))
(declare-datatypes ((ListLongMap!1685 0))(
  ( (ListLongMap!1686 (toList!858 List!1701)) )
))
(declare-fun lt!65956 () ListLongMap!1685)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!881 (ListLongMap!1685 (_ BitVec 64)) Bool)

(assert (=> b!127432 (= res!61612 (contains!881 lt!65956 (select (arr!2229 (_keys!4538 (v!3138 (underlying!441 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2586 0))(
  ( (tuple2!2587 (_1!1304 Bool) (_2!1304 LongMapFixedSize!1066)) )
))
(declare-fun lt!65954 () tuple2!2586)

(declare-fun newMap!16 () LongMapFixedSize!1066)

(declare-fun update!184 (LongMapFixedSize!1066 (_ BitVec 64) V!3441) tuple2!2586)

(declare-fun get!1450 (ValueCell!1079 V!3441) V!3441)

(declare-fun dynLambda!415 (Int (_ BitVec 64)) V!3441)

(assert (=> b!127432 (= lt!65954 (update!184 newMap!16 (select (arr!2229 (_keys!4538 (v!3138 (underlying!441 thiss!992)))) from!355) (get!1450 (select (arr!2230 (_values!2784 (v!3138 (underlying!441 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2801 (v!3138 (underlying!441 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!4519 () Bool)

(declare-fun mapRes!4519 () Bool)

(assert (=> mapIsEmpty!4519 mapRes!4519))

(declare-fun b!127433 () Bool)

(declare-fun e!83197 () Bool)

(assert (=> b!127433 (= e!83196 e!83197)))

(declare-fun b!127434 () Bool)

(assert (=> b!127434 (= e!83206 e!83208)))

(declare-fun res!61611 () Bool)

(assert (=> b!127434 (=> (not res!61611) (not e!83208))))

(declare-fun lt!65955 () ListLongMap!1685)

(assert (=> b!127434 (= res!61611 (and (= lt!65955 lt!65956) (not (= (select (arr!2229 (_keys!4538 (v!3138 (underlying!441 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2229 (_keys!4538 (v!3138 (underlying!441 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1390 (LongMapFixedSize!1066) ListLongMap!1685)

(assert (=> b!127434 (= lt!65956 (map!1390 newMap!16))))

(declare-fun getCurrentListMap!537 (array!4709 array!4711 (_ BitVec 32) (_ BitVec 32) V!3441 V!3441 (_ BitVec 32) Int) ListLongMap!1685)

(assert (=> b!127434 (= lt!65955 (getCurrentListMap!537 (_keys!4538 (v!3138 (underlying!441 thiss!992))) (_values!2784 (v!3138 (underlying!441 thiss!992))) (mask!7067 (v!3138 (underlying!441 thiss!992))) (extraKeys!2578 (v!3138 (underlying!441 thiss!992))) (zeroValue!2662 (v!3138 (underlying!441 thiss!992))) (minValue!2662 (v!3138 (underlying!441 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2801 (v!3138 (underlying!441 thiss!992)))))))

(declare-fun b!127435 () Bool)

(declare-fun e!83207 () Bool)

(declare-fun tp_is_empty!2845 () Bool)

(assert (=> b!127435 (= e!83207 tp_is_empty!2845)))

(declare-fun b!127436 () Bool)

(declare-fun e!83202 () Bool)

(assert (=> b!127436 (= e!83197 e!83202)))

(declare-fun b!127437 () Bool)

(declare-fun e!83198 () Bool)

(assert (=> b!127437 (= e!83198 tp_is_empty!2845)))

(declare-fun b!127438 () Bool)

(declare-fun res!61610 () Bool)

(assert (=> b!127438 (=> (not res!61610) (not e!83206))))

(declare-fun valid!508 (LongMapFixedSize!1066) Bool)

(assert (=> b!127438 (= res!61610 (valid!508 newMap!16))))

(declare-fun mapNonEmpty!4519 () Bool)

(declare-fun tp!10986 () Bool)

(assert (=> mapNonEmpty!4519 (= mapRes!4519 (and tp!10986 e!83207))))

(declare-fun mapRest!4520 () (Array (_ BitVec 32) ValueCell!1079))

(declare-fun mapKey!4519 () (_ BitVec 32))

(declare-fun mapValue!4519 () ValueCell!1079)

(assert (=> mapNonEmpty!4519 (= (arr!2230 (_values!2784 newMap!16)) (store mapRest!4520 mapKey!4519 mapValue!4519))))

(declare-fun mapNonEmpty!4520 () Bool)

(declare-fun mapRes!4520 () Bool)

(declare-fun tp!10987 () Bool)

(declare-fun e!83194 () Bool)

(assert (=> mapNonEmpty!4520 (= mapRes!4520 (and tp!10987 e!83194))))

(declare-fun mapKey!4520 () (_ BitVec 32))

(declare-fun mapRest!4519 () (Array (_ BitVec 32) ValueCell!1079))

(declare-fun mapValue!4520 () ValueCell!1079)

(assert (=> mapNonEmpty!4520 (= (arr!2230 (_values!2784 (v!3138 (underlying!441 thiss!992)))) (store mapRest!4519 mapKey!4520 mapValue!4520))))

(declare-fun b!127439 () Bool)

(assert (=> b!127439 (= e!83205 (and (= (size!2495 (_values!2784 (v!3138 (underlying!441 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7067 (v!3138 (underlying!441 thiss!992))))) (= (size!2494 (_keys!4538 (v!3138 (underlying!441 thiss!992)))) (size!2495 (_values!2784 (v!3138 (underlying!441 thiss!992))))) (bvslt (mask!7067 (v!3138 (underlying!441 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!127440 () Bool)

(assert (=> b!127440 (= e!83194 tp_is_empty!2845)))

(declare-fun e!83195 () Bool)

(declare-fun array_inv!1401 (array!4709) Bool)

(declare-fun array_inv!1402 (array!4711) Bool)

(assert (=> b!127441 (= e!83202 (and tp!10985 tp_is_empty!2845 (array_inv!1401 (_keys!4538 (v!3138 (underlying!441 thiss!992)))) (array_inv!1402 (_values!2784 (v!3138 (underlying!441 thiss!992)))) e!83195))))

(declare-fun b!127442 () Bool)

(assert (=> b!127442 (= e!83195 (and e!83198 mapRes!4520))))

(declare-fun condMapEmpty!4520 () Bool)

(declare-fun mapDefault!4520 () ValueCell!1079)

