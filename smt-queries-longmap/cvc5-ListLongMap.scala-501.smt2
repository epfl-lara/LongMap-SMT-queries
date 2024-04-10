; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11496 () Bool)

(assert start!11496)

(declare-fun b!95583 () Bool)

(declare-fun b_free!2401 () Bool)

(declare-fun b_next!2401 () Bool)

(assert (=> b!95583 (= b_free!2401 (not b_next!2401))))

(declare-fun tp!9480 () Bool)

(declare-fun b_and!5839 () Bool)

(assert (=> b!95583 (= tp!9480 b_and!5839)))

(declare-fun b!95595 () Bool)

(declare-fun b_free!2403 () Bool)

(declare-fun b_next!2403 () Bool)

(assert (=> b!95595 (= b_free!2403 (not b_next!2403))))

(declare-fun tp!9478 () Bool)

(declare-fun b_and!5841 () Bool)

(assert (=> b!95595 (= tp!9478 b_and!5841)))

(declare-fun b!95577 () Bool)

(declare-fun e!62358 () Bool)

(declare-fun e!62350 () Bool)

(assert (=> b!95577 (= e!62358 e!62350)))

(declare-fun b!95578 () Bool)

(declare-fun res!48317 () Bool)

(declare-fun e!62353 () Bool)

(assert (=> b!95578 (=> (not res!48317) (not e!62353))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3137 0))(
  ( (V!3138 (val!1353 Int)) )
))
(declare-datatypes ((array!4211 0))(
  ( (array!4212 (arr!2001 (Array (_ BitVec 32) (_ BitVec 64))) (size!2250 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!965 0))(
  ( (ValueCellFull!965 (v!2775 V!3137)) (EmptyCell!965) )
))
(declare-datatypes ((array!4213 0))(
  ( (array!4214 (arr!2002 (Array (_ BitVec 32) ValueCell!965)) (size!2251 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!838 0))(
  ( (LongMapFixedSize!839 (defaultEntry!2456 Int) (mask!6541 (_ BitVec 32)) (extraKeys!2281 (_ BitVec 32)) (zeroValue!2341 V!3137) (minValue!2341 V!3137) (_size!468 (_ BitVec 32)) (_keys!4142 array!4211) (_values!2439 array!4213) (_vacant!468 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!638 0))(
  ( (Cell!639 (v!2776 LongMapFixedSize!838)) )
))
(declare-datatypes ((LongMap!638 0))(
  ( (LongMap!639 (underlying!330 Cell!638)) )
))
(declare-fun thiss!992 () LongMap!638)

(assert (=> b!95578 (= res!48317 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2250 (_keys!4142 (v!2776 (underlying!330 thiss!992)))))))))

(declare-fun b!95579 () Bool)

(declare-fun e!62362 () Bool)

(declare-fun tp_is_empty!2617 () Bool)

(assert (=> b!95579 (= e!62362 tp_is_empty!2617)))

(declare-fun mapNonEmpty!3695 () Bool)

(declare-fun mapRes!3695 () Bool)

(declare-fun tp!9479 () Bool)

(declare-fun e!62349 () Bool)

(assert (=> mapNonEmpty!3695 (= mapRes!3695 (and tp!9479 e!62349))))

(declare-fun mapRest!3696 () (Array (_ BitVec 32) ValueCell!965))

(declare-fun mapValue!3695 () ValueCell!965)

(declare-fun mapKey!3696 () (_ BitVec 32))

(declare-fun newMap!16 () LongMapFixedSize!838)

(assert (=> mapNonEmpty!3695 (= (arr!2002 (_values!2439 newMap!16)) (store mapRest!3696 mapKey!3696 mapValue!3695))))

(declare-fun b!95580 () Bool)

(declare-fun e!62348 () Bool)

(declare-fun e!62352 () Bool)

(assert (=> b!95580 (= e!62348 e!62352)))

(declare-fun res!48313 () Bool)

(assert (=> b!95580 (=> (not res!48313) (not e!62352))))

(declare-datatypes ((tuple2!2318 0))(
  ( (tuple2!2319 (_1!1170 Bool) (_2!1170 LongMapFixedSize!838)) )
))
(declare-fun lt!47621 () tuple2!2318)

(assert (=> b!95580 (= res!48313 (and (_1!1170 lt!47621) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2862 0))(
  ( (Unit!2863) )
))
(declare-fun lt!47623 () Unit!2862)

(declare-fun e!62360 () Unit!2862)

(assert (=> b!95580 (= lt!47623 e!62360)))

(declare-datatypes ((tuple2!2320 0))(
  ( (tuple2!2321 (_1!1171 (_ BitVec 64)) (_2!1171 V!3137)) )
))
(declare-datatypes ((List!1572 0))(
  ( (Nil!1569) (Cons!1568 (h!2161 tuple2!2320) (t!5490 List!1572)) )
))
(declare-datatypes ((ListLongMap!1525 0))(
  ( (ListLongMap!1526 (toList!778 List!1572)) )
))
(declare-fun lt!47620 () ListLongMap!1525)

(declare-fun c!16063 () Bool)

(declare-fun contains!793 (ListLongMap!1525 (_ BitVec 64)) Bool)

(assert (=> b!95580 (= c!16063 (contains!793 lt!47620 (select (arr!2001 (_keys!4142 (v!2776 (underlying!330 thiss!992)))) from!355)))))

(declare-fun update!135 (LongMapFixedSize!838 (_ BitVec 64) V!3137) tuple2!2318)

(declare-fun get!1268 (ValueCell!965 V!3137) V!3137)

(declare-fun dynLambda!363 (Int (_ BitVec 64)) V!3137)

(assert (=> b!95580 (= lt!47621 (update!135 newMap!16 (select (arr!2001 (_keys!4142 (v!2776 (underlying!330 thiss!992)))) from!355) (get!1268 (select (arr!2002 (_values!2439 (v!2776 (underlying!330 thiss!992)))) from!355) (dynLambda!363 (defaultEntry!2456 (v!2776 (underlying!330 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!3695 () Bool)

(assert (=> mapIsEmpty!3695 mapRes!3695))

(declare-fun b!95581 () Bool)

(declare-fun e!62359 () Bool)

(assert (=> b!95581 (= e!62359 tp_is_empty!2617)))

(declare-fun b!95582 () Bool)

(declare-fun e!62355 () Bool)

(assert (=> b!95582 (= e!62355 tp_is_empty!2617)))

(declare-fun e!62357 () Bool)

(declare-fun array_inv!1247 (array!4211) Bool)

(declare-fun array_inv!1248 (array!4213) Bool)

(assert (=> b!95583 (= e!62350 (and tp!9480 tp_is_empty!2617 (array_inv!1247 (_keys!4142 (v!2776 (underlying!330 thiss!992)))) (array_inv!1248 (_values!2439 (v!2776 (underlying!330 thiss!992)))) e!62357))))

(declare-fun b!95584 () Bool)

(assert (=> b!95584 (= e!62349 tp_is_empty!2617)))

(declare-fun b!95585 () Bool)

(declare-fun res!48314 () Bool)

(assert (=> b!95585 (=> (not res!48314) (not e!62353))))

(declare-fun valid!377 (LongMapFixedSize!838) Bool)

(assert (=> b!95585 (= res!48314 (valid!377 newMap!16))))

(declare-fun b!95586 () Bool)

(declare-fun res!48311 () Bool)

(assert (=> b!95586 (=> (not res!48311) (not e!62352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!95586 (= res!48311 (validMask!0 (mask!6541 (v!2776 (underlying!330 thiss!992)))))))

(declare-fun b!95587 () Bool)

(declare-fun e!62356 () Bool)

(assert (=> b!95587 (= e!62356 (and e!62362 mapRes!3695))))

(declare-fun condMapEmpty!3695 () Bool)

(declare-fun mapDefault!3695 () ValueCell!965)

