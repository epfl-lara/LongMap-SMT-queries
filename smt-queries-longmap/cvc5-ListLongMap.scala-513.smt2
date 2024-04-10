; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12518 () Bool)

(assert start!12518)

(declare-fun b!107528 () Bool)

(declare-fun b_free!2545 () Bool)

(declare-fun b_next!2545 () Bool)

(assert (=> b!107528 (= b_free!2545 (not b_next!2545))))

(declare-fun tp!9966 () Bool)

(declare-fun b_and!6635 () Bool)

(assert (=> b!107528 (= tp!9966 b_and!6635)))

(declare-fun b!107530 () Bool)

(declare-fun b_free!2547 () Bool)

(declare-fun b_next!2547 () Bool)

(assert (=> b!107530 (= b_free!2547 (not b_next!2547))))

(declare-fun tp!9968 () Bool)

(declare-fun b_and!6637 () Bool)

(assert (=> b!107530 (= tp!9968 b_and!6637)))

(declare-fun mapIsEmpty!3967 () Bool)

(declare-fun mapRes!3968 () Bool)

(assert (=> mapIsEmpty!3967 mapRes!3968))

(declare-fun b!107515 () Bool)

(declare-fun res!53384 () Bool)

(declare-fun e!69986 () Bool)

(assert (=> b!107515 (=> (not res!53384) (not e!69986))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3233 0))(
  ( (V!3234 (val!1389 Int)) )
))
(declare-datatypes ((array!4371 0))(
  ( (array!4372 (arr!2073 (Array (_ BitVec 32) (_ BitVec 64))) (size!2329 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1001 0))(
  ( (ValueCellFull!1001 (v!2911 V!3233)) (EmptyCell!1001) )
))
(declare-datatypes ((array!4373 0))(
  ( (array!4374 (arr!2074 (Array (_ BitVec 32) ValueCell!1001)) (size!2330 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!910 0))(
  ( (LongMapFixedSize!911 (defaultEntry!2605 Int) (mask!6763 (_ BitVec 32)) (extraKeys!2406 (_ BitVec 32)) (zeroValue!2478 V!3233) (minValue!2478 V!3233) (_size!504 (_ BitVec 32)) (_keys!4315 array!4371) (_values!2588 array!4373) (_vacant!504 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!710 0))(
  ( (Cell!711 (v!2912 LongMapFixedSize!910)) )
))
(declare-datatypes ((LongMap!710 0))(
  ( (LongMap!711 (underlying!366 Cell!710)) )
))
(declare-fun thiss!992 () LongMap!710)

(assert (=> b!107515 (= res!53384 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2329 (_keys!4315 (v!2912 (underlying!366 thiss!992)))))))))

(declare-fun b!107516 () Bool)

(declare-fun res!53378 () Bool)

(assert (=> b!107516 (=> (not res!53378) (not e!69986))))

(declare-fun newMap!16 () LongMapFixedSize!910)

(assert (=> b!107516 (= res!53378 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6763 newMap!16)) (_size!504 (v!2912 (underlying!366 thiss!992)))))))

(declare-fun b!107517 () Bool)

(declare-fun e!69993 () Bool)

(declare-fun e!69988 () Bool)

(assert (=> b!107517 (= e!69993 e!69988)))

(declare-fun res!53383 () Bool)

(assert (=> b!107517 (=> (not res!53383) (not e!69988))))

(declare-datatypes ((tuple2!2424 0))(
  ( (tuple2!2425 (_1!1223 Bool) (_2!1223 LongMapFixedSize!910)) )
))
(declare-fun lt!55147 () tuple2!2424)

(assert (=> b!107517 (= res!53383 (and (_1!1223 lt!55147) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3319 0))(
  ( (Unit!3320) )
))
(declare-fun lt!55145 () Unit!3319)

(declare-fun e!69995 () Unit!3319)

(assert (=> b!107517 (= lt!55145 e!69995)))

(declare-fun c!18846 () Bool)

(declare-datatypes ((tuple2!2426 0))(
  ( (tuple2!2427 (_1!1224 (_ BitVec 64)) (_2!1224 V!3233)) )
))
(declare-datatypes ((List!1624 0))(
  ( (Nil!1621) (Cons!1620 (h!2218 tuple2!2426) (t!5736 List!1624)) )
))
(declare-datatypes ((ListLongMap!1583 0))(
  ( (ListLongMap!1584 (toList!807 List!1624)) )
))
(declare-fun lt!55153 () ListLongMap!1583)

(declare-fun contains!833 (ListLongMap!1583 (_ BitVec 64)) Bool)

(assert (=> b!107517 (= c!18846 (contains!833 lt!55153 (select (arr!2073 (_keys!4315 (v!2912 (underlying!366 thiss!992)))) from!355)))))

(declare-fun lt!55155 () V!3233)

(declare-fun update!159 (LongMapFixedSize!910 (_ BitVec 64) V!3233) tuple2!2424)

(assert (=> b!107517 (= lt!55147 (update!159 newMap!16 (select (arr!2073 (_keys!4315 (v!2912 (underlying!366 thiss!992)))) from!355) lt!55155))))

(declare-fun b!107518 () Bool)

(declare-fun e!69990 () Bool)

(assert (=> b!107518 (= e!69986 e!69990)))

(declare-fun res!53377 () Bool)

(assert (=> b!107518 (=> (not res!53377) (not e!69990))))

(declare-fun lt!55144 () ListLongMap!1583)

(assert (=> b!107518 (= res!53377 (= lt!55144 lt!55153))))

(declare-fun map!1293 (LongMapFixedSize!910) ListLongMap!1583)

(assert (=> b!107518 (= lt!55153 (map!1293 newMap!16))))

(declare-fun getCurrentListMap!492 (array!4371 array!4373 (_ BitVec 32) (_ BitVec 32) V!3233 V!3233 (_ BitVec 32) Int) ListLongMap!1583)

(assert (=> b!107518 (= lt!55144 (getCurrentListMap!492 (_keys!4315 (v!2912 (underlying!366 thiss!992))) (_values!2588 (v!2912 (underlying!366 thiss!992))) (mask!6763 (v!2912 (underlying!366 thiss!992))) (extraKeys!2406 (v!2912 (underlying!366 thiss!992))) (zeroValue!2478 (v!2912 (underlying!366 thiss!992))) (minValue!2478 (v!2912 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2605 (v!2912 (underlying!366 thiss!992)))))))

(declare-fun b!107519 () Bool)

(assert (=> b!107519 (= e!69990 e!69993)))

(declare-fun res!53379 () Bool)

(assert (=> b!107519 (=> (not res!53379) (not e!69993))))

(assert (=> b!107519 (= res!53379 (and (not (= (select (arr!2073 (_keys!4315 (v!2912 (underlying!366 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2073 (_keys!4315 (v!2912 (underlying!366 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1340 (ValueCell!1001 V!3233) V!3233)

(declare-fun dynLambda!388 (Int (_ BitVec 64)) V!3233)

(assert (=> b!107519 (= lt!55155 (get!1340 (select (arr!2074 (_values!2588 (v!2912 (underlying!366 thiss!992)))) from!355) (dynLambda!388 (defaultEntry!2605 (v!2912 (underlying!366 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!107520 () Bool)

(declare-fun e!69998 () Bool)

(assert (=> b!107520 (= e!69988 (not e!69998))))

(declare-fun res!53382 () Bool)

(assert (=> b!107520 (=> res!53382 e!69998)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!107520 (= res!53382 (not (validMask!0 (mask!6763 (v!2912 (underlying!366 thiss!992))))))))

(declare-fun lt!55149 () ListLongMap!1583)

(declare-fun lt!55154 () tuple2!2426)

(declare-fun lt!55150 () tuple2!2426)

(declare-fun +!147 (ListLongMap!1583 tuple2!2426) ListLongMap!1583)

(assert (=> b!107520 (= (+!147 (+!147 lt!55149 lt!55154) lt!55150) (+!147 (+!147 lt!55149 lt!55150) lt!55154))))

(assert (=> b!107520 (= lt!55150 (tuple2!2427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2478 (v!2912 (underlying!366 thiss!992)))))))

(assert (=> b!107520 (= lt!55154 (tuple2!2427 (select (arr!2073 (_keys!4315 (v!2912 (underlying!366 thiss!992)))) from!355) lt!55155))))

(declare-fun lt!55152 () Unit!3319)

(declare-fun addCommutativeForDiffKeys!59 (ListLongMap!1583 (_ BitVec 64) V!3233 (_ BitVec 64) V!3233) Unit!3319)

(assert (=> b!107520 (= lt!55152 (addCommutativeForDiffKeys!59 lt!55149 (select (arr!2073 (_keys!4315 (v!2912 (underlying!366 thiss!992)))) from!355) lt!55155 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2478 (v!2912 (underlying!366 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!113 (array!4371 array!4373 (_ BitVec 32) (_ BitVec 32) V!3233 V!3233 (_ BitVec 32) Int) ListLongMap!1583)

(assert (=> b!107520 (= lt!55149 (getCurrentListMapNoExtraKeys!113 (_keys!4315 (v!2912 (underlying!366 thiss!992))) (_values!2588 (v!2912 (underlying!366 thiss!992))) (mask!6763 (v!2912 (underlying!366 thiss!992))) (extraKeys!2406 (v!2912 (underlying!366 thiss!992))) (zeroValue!2478 (v!2912 (underlying!366 thiss!992))) (minValue!2478 (v!2912 (underlying!366 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2605 (v!2912 (underlying!366 thiss!992)))))))

(declare-fun b!107521 () Bool)

(declare-fun e!69994 () Bool)

(declare-fun e!69992 () Bool)

(assert (=> b!107521 (= e!69994 e!69992)))

(declare-fun b!107522 () Bool)

(declare-fun res!53380 () Bool)

(assert (=> b!107522 (=> (not res!53380) (not e!69986))))

(declare-fun valid!425 (LongMapFixedSize!910) Bool)

(assert (=> b!107522 (= res!53380 (valid!425 newMap!16))))

(declare-fun b!107523 () Bool)

(declare-fun e!70003 () Bool)

(declare-fun tp_is_empty!2689 () Bool)

(assert (=> b!107523 (= e!70003 tp_is_empty!2689)))

(declare-fun mapNonEmpty!3967 () Bool)

(declare-fun mapRes!3967 () Bool)

(declare-fun tp!9965 () Bool)

(assert (=> mapNonEmpty!3967 (= mapRes!3967 (and tp!9965 e!70003))))

(declare-fun mapRest!3968 () (Array (_ BitVec 32) ValueCell!1001))

(declare-fun mapValue!3967 () ValueCell!1001)

(declare-fun mapKey!3968 () (_ BitVec 32))

(assert (=> mapNonEmpty!3967 (= (arr!2074 (_values!2588 newMap!16)) (store mapRest!3968 mapKey!3968 mapValue!3967))))

(declare-fun b!107524 () Bool)

(declare-fun e!69989 () Bool)

(declare-fun e!70000 () Bool)

(assert (=> b!107524 (= e!69989 (and e!70000 mapRes!3967))))

(declare-fun condMapEmpty!3968 () Bool)

(declare-fun mapDefault!3968 () ValueCell!1001)

