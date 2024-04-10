; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12040 () Bool)

(assert start!12040)

(declare-fun b!101450 () Bool)

(declare-fun b_free!2461 () Bool)

(declare-fun b_next!2461 () Bool)

(assert (=> b!101450 (= b_free!2461 (not b_next!2461))))

(declare-fun tp!9688 () Bool)

(declare-fun b_and!6243 () Bool)

(assert (=> b!101450 (= tp!9688 b_and!6243)))

(declare-fun b!101447 () Bool)

(declare-fun b_free!2463 () Bool)

(declare-fun b_next!2463 () Bool)

(assert (=> b!101447 (= b_free!2463 (not b_next!2463))))

(declare-fun tp!9690 () Bool)

(declare-fun b_and!6245 () Bool)

(assert (=> b!101447 (= tp!9690 b_and!6245)))

(declare-fun b!101432 () Bool)

(declare-fun e!66029 () Bool)

(declare-fun e!66043 () Bool)

(assert (=> b!101432 (= e!66029 e!66043)))

(declare-fun res!50826 () Bool)

(assert (=> b!101432 (=> (not res!50826) (not e!66043))))

(declare-datatypes ((V!3177 0))(
  ( (V!3178 (val!1368 Int)) )
))
(declare-datatypes ((array!4279 0))(
  ( (array!4280 (arr!2031 (Array (_ BitVec 32) (_ BitVec 64))) (size!2284 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!980 0))(
  ( (ValueCellFull!980 (v!2841 V!3177)) (EmptyCell!980) )
))
(declare-datatypes ((array!4281 0))(
  ( (array!4282 (arr!2032 (Array (_ BitVec 32) ValueCell!980)) (size!2285 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!868 0))(
  ( (LongMapFixedSize!869 (defaultEntry!2535 Int) (mask!6658 (_ BitVec 32)) (extraKeys!2346 (_ BitVec 32)) (zeroValue!2413 V!3177) (minValue!2413 V!3177) (_size!483 (_ BitVec 32)) (_keys!4235 array!4279) (_values!2518 array!4281) (_vacant!483 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!668 0))(
  ( (Cell!669 (v!2842 LongMapFixedSize!868)) )
))
(declare-datatypes ((LongMap!668 0))(
  ( (LongMap!669 (underlying!345 Cell!668)) )
))
(declare-fun thiss!992 () LongMap!668)

(declare-datatypes ((tuple2!2362 0))(
  ( (tuple2!2363 (_1!1192 (_ BitVec 64)) (_2!1192 V!3177)) )
))
(declare-datatypes ((List!1590 0))(
  ( (Nil!1587) (Cons!1586 (h!2182 tuple2!2362) (t!5596 List!1590)) )
))
(declare-datatypes ((ListLongMap!1547 0))(
  ( (ListLongMap!1548 (toList!789 List!1590)) )
))
(declare-fun lt!51463 () ListLongMap!1547)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!51460 () ListLongMap!1547)

(assert (=> b!101432 (= res!50826 (and (= lt!51460 lt!51463) (not (= (select (arr!2031 (_keys!4235 (v!2842 (underlying!345 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2031 (_keys!4235 (v!2842 (underlying!345 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!868)

(declare-fun map!1266 (LongMapFixedSize!868) ListLongMap!1547)

(assert (=> b!101432 (= lt!51463 (map!1266 newMap!16))))

(declare-fun getCurrentListMap!479 (array!4279 array!4281 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 32) Int) ListLongMap!1547)

(assert (=> b!101432 (= lt!51460 (getCurrentListMap!479 (_keys!4235 (v!2842 (underlying!345 thiss!992))) (_values!2518 (v!2842 (underlying!345 thiss!992))) (mask!6658 (v!2842 (underlying!345 thiss!992))) (extraKeys!2346 (v!2842 (underlying!345 thiss!992))) (zeroValue!2413 (v!2842 (underlying!345 thiss!992))) (minValue!2413 (v!2842 (underlying!345 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2842 (underlying!345 thiss!992)))))))

(declare-fun b!101433 () Bool)

(declare-fun e!66036 () Bool)

(declare-fun tp_is_empty!2647 () Bool)

(assert (=> b!101433 (= e!66036 tp_is_empty!2647)))

(declare-fun b!101434 () Bool)

(declare-fun e!66033 () Bool)

(declare-datatypes ((List!1591 0))(
  ( (Nil!1588) (Cons!1587 (h!2183 (_ BitVec 64)) (t!5597 List!1591)) )
))
(declare-fun arrayNoDuplicates!0 (array!4279 (_ BitVec 32) List!1591) Bool)

(assert (=> b!101434 (= e!66033 (not (arrayNoDuplicates!0 (_keys!4235 (v!2842 (underlying!345 thiss!992))) #b00000000000000000000000000000000 Nil!1588)))))

(declare-fun res!50820 () Bool)

(assert (=> start!12040 (=> (not res!50820) (not e!66029))))

(declare-fun valid!395 (LongMap!668) Bool)

(assert (=> start!12040 (= res!50820 (valid!395 thiss!992))))

(assert (=> start!12040 e!66029))

(declare-fun e!66042 () Bool)

(assert (=> start!12040 e!66042))

(assert (=> start!12040 true))

(declare-fun e!66039 () Bool)

(assert (=> start!12040 e!66039))

(declare-fun mapIsEmpty!3815 () Bool)

(declare-fun mapRes!3816 () Bool)

(assert (=> mapIsEmpty!3815 mapRes!3816))

(declare-fun b!101435 () Bool)

(declare-datatypes ((Unit!3084 0))(
  ( (Unit!3085) )
))
(declare-fun e!66030 () Unit!3084)

(declare-fun Unit!3086 () Unit!3084)

(assert (=> b!101435 (= e!66030 Unit!3086)))

(declare-fun mapNonEmpty!3815 () Bool)

(declare-fun mapRes!3815 () Bool)

(declare-fun tp!9689 () Bool)

(assert (=> mapNonEmpty!3815 (= mapRes!3815 (and tp!9689 e!66036))))

(declare-fun mapValue!3816 () ValueCell!980)

(declare-fun mapKey!3816 () (_ BitVec 32))

(declare-fun mapRest!3816 () (Array (_ BitVec 32) ValueCell!980))

(assert (=> mapNonEmpty!3815 (= (arr!2032 (_values!2518 newMap!16)) (store mapRest!3816 mapKey!3816 mapValue!3816))))

(declare-fun b!101436 () Bool)

(declare-fun e!66032 () Bool)

(assert (=> b!101436 (= e!66032 tp_is_empty!2647)))

(declare-fun b!101437 () Bool)

(declare-fun e!66044 () Bool)

(assert (=> b!101437 (= e!66044 tp_is_empty!2647)))

(declare-fun b!101438 () Bool)

(declare-fun res!50822 () Bool)

(assert (=> b!101438 (=> (not res!50822) (not e!66029))))

(declare-fun valid!396 (LongMapFixedSize!868) Bool)

(assert (=> b!101438 (= res!50822 (valid!396 newMap!16))))

(declare-fun b!101439 () Bool)

(declare-fun res!50823 () Bool)

(assert (=> b!101439 (=> (not res!50823) (not e!66033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!101439 (= res!50823 (validMask!0 (mask!6658 (v!2842 (underlying!345 thiss!992)))))))

(declare-fun b!101440 () Bool)

(declare-fun res!50827 () Bool)

(assert (=> b!101440 (=> (not res!50827) (not e!66033))))

(assert (=> b!101440 (= res!50827 (and (= (size!2285 (_values!2518 (v!2842 (underlying!345 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6658 (v!2842 (underlying!345 thiss!992))))) (= (size!2284 (_keys!4235 (v!2842 (underlying!345 thiss!992)))) (size!2285 (_values!2518 (v!2842 (underlying!345 thiss!992))))) (bvsge (mask!6658 (v!2842 (underlying!345 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2346 (v!2842 (underlying!345 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2346 (v!2842 (underlying!345 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!101441 () Bool)

(declare-fun res!50825 () Bool)

(assert (=> b!101441 (=> (not res!50825) (not e!66029))))

(assert (=> b!101441 (= res!50825 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2284 (_keys!4235 (v!2842 (underlying!345 thiss!992)))))))))

(declare-fun mapIsEmpty!3816 () Bool)

(assert (=> mapIsEmpty!3816 mapRes!3815))

(declare-fun b!101442 () Bool)

(declare-fun Unit!3087 () Unit!3084)

(assert (=> b!101442 (= e!66030 Unit!3087)))

(declare-fun lt!51458 () Unit!3084)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!93 (array!4279 array!4281 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 64) (_ BitVec 32) Int) Unit!3084)

(assert (=> b!101442 (= lt!51458 (lemmaListMapContainsThenArrayContainsFrom!93 (_keys!4235 (v!2842 (underlying!345 thiss!992))) (_values!2518 (v!2842 (underlying!345 thiss!992))) (mask!6658 (v!2842 (underlying!345 thiss!992))) (extraKeys!2346 (v!2842 (underlying!345 thiss!992))) (zeroValue!2413 (v!2842 (underlying!345 thiss!992))) (minValue!2413 (v!2842 (underlying!345 thiss!992))) (select (arr!2031 (_keys!4235 (v!2842 (underlying!345 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2842 (underlying!345 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!101442 (arrayContainsKey!0 (_keys!4235 (v!2842 (underlying!345 thiss!992))) (select (arr!2031 (_keys!4235 (v!2842 (underlying!345 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!51461 () Unit!3084)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4279 (_ BitVec 32) (_ BitVec 32)) Unit!3084)

(assert (=> b!101442 (= lt!51461 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4235 (v!2842 (underlying!345 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> b!101442 (arrayNoDuplicates!0 (_keys!4235 (v!2842 (underlying!345 thiss!992))) from!355 Nil!1588)))

(declare-fun lt!51457 () Unit!3084)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4279 (_ BitVec 32) (_ BitVec 64) List!1591) Unit!3084)

(assert (=> b!101442 (= lt!51457 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4235 (v!2842 (underlying!345 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2031 (_keys!4235 (v!2842 (underlying!345 thiss!992)))) from!355) (Cons!1587 (select (arr!2031 (_keys!4235 (v!2842 (underlying!345 thiss!992)))) from!355) Nil!1588)))))

(assert (=> b!101442 false))

(declare-fun b!101443 () Bool)

(assert (=> b!101443 (= e!66043 e!66033)))

(declare-fun res!50824 () Bool)

(assert (=> b!101443 (=> (not res!50824) (not e!66033))))

(declare-datatypes ((tuple2!2364 0))(
  ( (tuple2!2365 (_1!1193 Bool) (_2!1193 LongMapFixedSize!868)) )
))
(declare-fun lt!51459 () tuple2!2364)

(assert (=> b!101443 (= res!50824 (and (_1!1193 lt!51459) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!51462 () Unit!3084)

(assert (=> b!101443 (= lt!51462 e!66030)))

(declare-fun c!17455 () Bool)

(declare-fun contains!812 (ListLongMap!1547 (_ BitVec 64)) Bool)

(assert (=> b!101443 (= c!17455 (contains!812 lt!51463 (select (arr!2031 (_keys!4235 (v!2842 (underlying!345 thiss!992)))) from!355)))))

(declare-fun update!146 (LongMapFixedSize!868 (_ BitVec 64) V!3177) tuple2!2364)

(declare-fun get!1301 (ValueCell!980 V!3177) V!3177)

(declare-fun dynLambda!374 (Int (_ BitVec 64)) V!3177)

(assert (=> b!101443 (= lt!51459 (update!146 newMap!16 (select (arr!2031 (_keys!4235 (v!2842 (underlying!345 thiss!992)))) from!355) (get!1301 (select (arr!2032 (_values!2518 (v!2842 (underlying!345 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2535 (v!2842 (underlying!345 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!101444 () Bool)

(declare-fun e!66038 () Bool)

(assert (=> b!101444 (= e!66038 tp_is_empty!2647)))

(declare-fun b!101445 () Bool)

(declare-fun e!66035 () Bool)

(assert (=> b!101445 (= e!66042 e!66035)))

(declare-fun b!101446 () Bool)

(declare-fun res!50828 () Bool)

(assert (=> b!101446 (=> (not res!50828) (not e!66033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4279 (_ BitVec 32)) Bool)

(assert (=> b!101446 (= res!50828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4235 (v!2842 (underlying!345 thiss!992))) (mask!6658 (v!2842 (underlying!345 thiss!992)))))))

(declare-fun e!66034 () Bool)

(declare-fun array_inv!1269 (array!4279) Bool)

(declare-fun array_inv!1270 (array!4281) Bool)

(assert (=> b!101447 (= e!66039 (and tp!9690 tp_is_empty!2647 (array_inv!1269 (_keys!4235 newMap!16)) (array_inv!1270 (_values!2518 newMap!16)) e!66034))))

(declare-fun b!101448 () Bool)

(assert (=> b!101448 (= e!66034 (and e!66038 mapRes!3815))))

(declare-fun condMapEmpty!3815 () Bool)

(declare-fun mapDefault!3815 () ValueCell!980)

