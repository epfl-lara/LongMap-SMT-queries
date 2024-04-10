; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11116 () Bool)

(assert start!11116)

(declare-fun b!91025 () Bool)

(declare-fun b_free!2325 () Bool)

(declare-fun b_next!2325 () Bool)

(assert (=> b!91025 (= b_free!2325 (not b_next!2325))))

(declare-fun tp!9224 () Bool)

(declare-fun b_and!5515 () Bool)

(assert (=> b!91025 (= tp!9224 b_and!5515)))

(declare-fun b!91037 () Bool)

(declare-fun b_free!2327 () Bool)

(declare-fun b_next!2327 () Bool)

(assert (=> b!91037 (= b_free!2327 (not b_next!2327))))

(declare-fun tp!9226 () Bool)

(declare-fun b_and!5517 () Bool)

(assert (=> b!91037 (= tp!9226 b_and!5517)))

(declare-fun res!46390 () Bool)

(declare-fun e!59383 () Bool)

(assert (=> start!11116 (=> (not res!46390) (not e!59383))))

(declare-datatypes ((V!3085 0))(
  ( (V!3086 (val!1334 Int)) )
))
(declare-datatypes ((array!4125 0))(
  ( (array!4126 (arr!1963 (Array (_ BitVec 32) (_ BitVec 64))) (size!2210 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!946 0))(
  ( (ValueCellFull!946 (v!2714 V!3085)) (EmptyCell!946) )
))
(declare-datatypes ((array!4127 0))(
  ( (array!4128 (arr!1964 (Array (_ BitVec 32) ValueCell!946)) (size!2211 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!800 0))(
  ( (LongMapFixedSize!801 (defaultEntry!2401 Int) (mask!6459 (_ BitVec 32)) (extraKeys!2232 (_ BitVec 32)) (zeroValue!2289 V!3085) (minValue!2289 V!3085) (_size!449 (_ BitVec 32)) (_keys!4081 array!4125) (_values!2384 array!4127) (_vacant!449 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!600 0))(
  ( (Cell!601 (v!2715 LongMapFixedSize!800)) )
))
(declare-datatypes ((LongMap!600 0))(
  ( (LongMap!601 (underlying!311 Cell!600)) )
))
(declare-fun thiss!992 () LongMap!600)

(declare-fun valid!351 (LongMap!600) Bool)

(assert (=> start!11116 (= res!46390 (valid!351 thiss!992))))

(assert (=> start!11116 e!59383))

(declare-fun e!59388 () Bool)

(assert (=> start!11116 e!59388))

(assert (=> start!11116 true))

(declare-fun e!59380 () Bool)

(assert (=> start!11116 e!59380))

(declare-fun tp_is_empty!2579 () Bool)

(declare-fun e!59396 () Bool)

(declare-fun e!59379 () Bool)

(declare-fun array_inv!1217 (array!4125) Bool)

(declare-fun array_inv!1218 (array!4127) Bool)

(assert (=> b!91025 (= e!59379 (and tp!9224 tp_is_empty!2579 (array_inv!1217 (_keys!4081 (v!2715 (underlying!311 thiss!992)))) (array_inv!1218 (_values!2384 (v!2715 (underlying!311 thiss!992)))) e!59396))))

(declare-fun b!91026 () Bool)

(declare-fun e!59393 () Bool)

(declare-fun e!59384 () Bool)

(assert (=> b!91026 (= e!59393 e!59384)))

(declare-fun res!46392 () Bool)

(assert (=> b!91026 (=> (not res!46392) (not e!59384))))

(declare-datatypes ((tuple2!2258 0))(
  ( (tuple2!2259 (_1!1140 Bool) (_2!1140 LongMapFixedSize!800)) )
))
(declare-fun lt!44291 () tuple2!2258)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!91026 (= res!46392 (and (_1!1140 lt!44291) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2710 0))(
  ( (Unit!2711) )
))
(declare-fun lt!44282 () Unit!2710)

(declare-fun e!59385 () Unit!2710)

(assert (=> b!91026 (= lt!44282 e!59385)))

(declare-datatypes ((tuple2!2260 0))(
  ( (tuple2!2261 (_1!1141 (_ BitVec 64)) (_2!1141 V!3085)) )
))
(declare-datatypes ((List!1549 0))(
  ( (Nil!1546) (Cons!1545 (h!2137 tuple2!2260) (t!5375 List!1549)) )
))
(declare-datatypes ((ListLongMap!1495 0))(
  ( (ListLongMap!1496 (toList!763 List!1549)) )
))
(declare-fun lt!44283 () ListLongMap!1495)

(declare-fun c!15089 () Bool)

(declare-fun contains!774 (ListLongMap!1495 (_ BitVec 64)) Bool)

(assert (=> b!91026 (= c!15089 (contains!774 lt!44283 (select (arr!1963 (_keys!4081 (v!2715 (underlying!311 thiss!992)))) from!355)))))

(declare-fun lt!44289 () V!3085)

(declare-fun newMap!16 () LongMapFixedSize!800)

(declare-fun update!125 (LongMapFixedSize!800 (_ BitVec 64) V!3085) tuple2!2258)

(assert (=> b!91026 (= lt!44291 (update!125 newMap!16 (select (arr!1963 (_keys!4081 (v!2715 (underlying!311 thiss!992)))) from!355) lt!44289))))

(declare-fun b!91027 () Bool)

(declare-fun e!59387 () Bool)

(assert (=> b!91027 (= e!59388 e!59387)))

(declare-fun b!91028 () Bool)

(declare-fun e!59391 () Bool)

(assert (=> b!91028 (= e!59384 (not e!59391))))

(declare-fun res!46384 () Bool)

(assert (=> b!91028 (=> res!46384 e!59391)))

(declare-fun getCurrentListMap!455 (array!4125 array!4127 (_ BitVec 32) (_ BitVec 32) V!3085 V!3085 (_ BitVec 32) Int) ListLongMap!1495)

(declare-fun map!1218 (LongMapFixedSize!800) ListLongMap!1495)

(assert (=> b!91028 (= res!46384 (not (= (getCurrentListMap!455 (_keys!4081 (v!2715 (underlying!311 thiss!992))) (_values!2384 (v!2715 (underlying!311 thiss!992))) (mask!6459 (v!2715 (underlying!311 thiss!992))) (extraKeys!2232 (v!2715 (underlying!311 thiss!992))) (zeroValue!2289 (v!2715 (underlying!311 thiss!992))) (minValue!2289 (v!2715 (underlying!311 thiss!992))) from!355 (defaultEntry!2401 (v!2715 (underlying!311 thiss!992)))) (map!1218 (_2!1140 lt!44291)))))))

(declare-fun lt!44290 () tuple2!2260)

(declare-fun lt!44293 () ListLongMap!1495)

(declare-fun lt!44286 () ListLongMap!1495)

(declare-fun lt!44287 () tuple2!2260)

(declare-fun +!125 (ListLongMap!1495 tuple2!2260) ListLongMap!1495)

(assert (=> b!91028 (= (+!125 lt!44286 lt!44287) (+!125 (+!125 lt!44293 lt!44287) lt!44290))))

(assert (=> b!91028 (= lt!44287 (tuple2!2261 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2289 (v!2715 (underlying!311 thiss!992)))))))

(declare-fun lt!44288 () Unit!2710)

(declare-fun addCommutativeForDiffKeys!44 (ListLongMap!1495 (_ BitVec 64) V!3085 (_ BitVec 64) V!3085) Unit!2710)

(assert (=> b!91028 (= lt!44288 (addCommutativeForDiffKeys!44 lt!44293 (select (arr!1963 (_keys!4081 (v!2715 (underlying!311 thiss!992)))) from!355) lt!44289 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2289 (v!2715 (underlying!311 thiss!992)))))))

(declare-fun lt!44280 () ListLongMap!1495)

(assert (=> b!91028 (= lt!44280 lt!44286)))

(assert (=> b!91028 (= lt!44286 (+!125 lt!44293 lt!44290))))

(declare-fun lt!44278 () ListLongMap!1495)

(declare-fun lt!44295 () tuple2!2260)

(assert (=> b!91028 (= lt!44280 (+!125 lt!44278 lt!44295))))

(declare-fun lt!44294 () ListLongMap!1495)

(assert (=> b!91028 (= lt!44293 (+!125 lt!44294 lt!44295))))

(assert (=> b!91028 (= lt!44295 (tuple2!2261 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2289 (v!2715 (underlying!311 thiss!992)))))))

(assert (=> b!91028 (= lt!44278 (+!125 lt!44294 lt!44290))))

(assert (=> b!91028 (= lt!44290 (tuple2!2261 (select (arr!1963 (_keys!4081 (v!2715 (underlying!311 thiss!992)))) from!355) lt!44289))))

(declare-fun lt!44292 () Unit!2710)

(assert (=> b!91028 (= lt!44292 (addCommutativeForDiffKeys!44 lt!44294 (select (arr!1963 (_keys!4081 (v!2715 (underlying!311 thiss!992)))) from!355) lt!44289 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2289 (v!2715 (underlying!311 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!90 (array!4125 array!4127 (_ BitVec 32) (_ BitVec 32) V!3085 V!3085 (_ BitVec 32) Int) ListLongMap!1495)

(assert (=> b!91028 (= lt!44294 (getCurrentListMapNoExtraKeys!90 (_keys!4081 (v!2715 (underlying!311 thiss!992))) (_values!2384 (v!2715 (underlying!311 thiss!992))) (mask!6459 (v!2715 (underlying!311 thiss!992))) (extraKeys!2232 (v!2715 (underlying!311 thiss!992))) (zeroValue!2289 (v!2715 (underlying!311 thiss!992))) (minValue!2289 (v!2715 (underlying!311 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2401 (v!2715 (underlying!311 thiss!992)))))))

(declare-fun b!91029 () Bool)

(declare-fun e!59381 () Bool)

(declare-fun e!59382 () Bool)

(declare-fun mapRes!3556 () Bool)

(assert (=> b!91029 (= e!59381 (and e!59382 mapRes!3556))))

(declare-fun condMapEmpty!3556 () Bool)

(declare-fun mapDefault!3556 () ValueCell!946)

