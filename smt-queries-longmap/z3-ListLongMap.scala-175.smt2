; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3330 () Bool)

(assert start!3330)

(declare-fun b!20929 () Bool)

(declare-fun b_free!727 () Bool)

(declare-fun b_next!727 () Bool)

(assert (=> b!20929 (= b_free!727 (not b_next!727))))

(declare-fun tp!3414 () Bool)

(declare-fun b_and!1405 () Bool)

(assert (=> b!20929 (= tp!3414 b_and!1405)))

(declare-fun res!13597 () Bool)

(declare-fun e!13656 () Bool)

(assert (=> start!3330 (=> (not res!13597) (not e!13656))))

(declare-datatypes ((V!1147 0))(
  ( (V!1148 (val!522 Int)) )
))
(declare-datatypes ((ValueCell!296 0))(
  ( (ValueCellFull!296 (v!1562 V!1147)) (EmptyCell!296) )
))
(declare-datatypes ((array!1193 0))(
  ( (array!1194 (arr!566 (Array (_ BitVec 32) ValueCell!296)) (size!659 (_ BitVec 32))) )
))
(declare-datatypes ((array!1195 0))(
  ( (array!1196 (arr!567 (Array (_ BitVec 32) (_ BitVec 64))) (size!660 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!178 0))(
  ( (LongMapFixedSize!179 (defaultEntry!1714 Int) (mask!4684 (_ BitVec 32)) (extraKeys!1618 (_ BitVec 32)) (zeroValue!1642 V!1147) (minValue!1642 V!1147) (_size!129 (_ BitVec 32)) (_keys!3136 array!1195) (_values!1704 array!1193) (_vacant!129 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!178 0))(
  ( (Cell!179 (v!1563 LongMapFixedSize!178)) )
))
(declare-datatypes ((LongMap!178 0))(
  ( (LongMap!179 (underlying!100 Cell!178)) )
))
(declare-fun thiss!938 () LongMap!178)

(declare-fun valid!98 (LongMap!178) Bool)

(assert (=> start!3330 (= res!13597 (valid!98 thiss!938))))

(assert (=> start!3330 e!13656))

(declare-fun e!13645 () Bool)

(assert (=> start!3330 e!13645))

(declare-fun b!20926 () Bool)

(declare-fun e!13652 () Bool)

(assert (=> b!20926 (= e!13645 e!13652)))

(declare-fun b!20927 () Bool)

(declare-datatypes ((tuple2!886 0))(
  ( (tuple2!887 (_1!446 Bool) (_2!446 Cell!178)) )
))
(declare-fun e!13655 () tuple2!886)

(declare-fun lt!6408 () LongMapFixedSize!178)

(assert (=> b!20927 (= e!13655 (tuple2!887 true (Cell!179 lt!6408)))))

(declare-fun bm!1224 () Bool)

(declare-datatypes ((tuple2!888 0))(
  ( (tuple2!889 (_1!447 Bool) (_2!447 LongMapFixedSize!178)) )
))
(declare-fun call!1228 () tuple2!888)

(declare-fun call!1227 () tuple2!888)

(assert (=> bm!1224 (= call!1228 call!1227)))

(declare-fun mapIsEmpty!964 () Bool)

(declare-fun mapRes!964 () Bool)

(assert (=> mapIsEmpty!964 mapRes!964))

(declare-fun b!20928 () Bool)

(declare-fun lt!6404 () tuple2!888)

(assert (=> b!20928 (= e!13655 (tuple2!887 (_1!447 lt!6404) (Cell!179 (_2!447 lt!6404))))))

(assert (=> b!20928 (= lt!6404 call!1228)))

(declare-fun e!13653 () Bool)

(declare-fun e!13650 () Bool)

(declare-fun tp_is_empty!991 () Bool)

(declare-fun array_inv!401 (array!1195) Bool)

(declare-fun array_inv!402 (array!1193) Bool)

(assert (=> b!20929 (= e!13653 (and tp!3414 tp_is_empty!991 (array_inv!401 (_keys!3136 (v!1563 (underlying!100 thiss!938)))) (array_inv!402 (_values!1704 (v!1563 (underlying!100 thiss!938)))) e!13650))))

(declare-fun b!20930 () Bool)

(declare-fun e!13654 () tuple2!886)

(declare-fun lt!6409 () tuple2!888)

(declare-fun lt!6406 () tuple2!888)

(assert (=> b!20930 (= e!13654 (tuple2!887 (and (_1!447 lt!6409) (_1!447 lt!6406)) (Cell!179 (_2!447 lt!6406))))))

(declare-fun update!26 (LongMapFixedSize!178 (_ BitVec 64) V!1147) tuple2!888)

(assert (=> b!20930 (= lt!6409 (update!26 lt!6408 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1642 (v!1563 (underlying!100 thiss!938)))))))

(assert (=> b!20930 (= lt!6406 call!1227)))

(declare-fun b!20931 () Bool)

(declare-fun e!13647 () Bool)

(assert (=> b!20931 (= e!13656 e!13647)))

(declare-fun res!13599 () Bool)

(assert (=> b!20931 (=> (not res!13599) (not e!13647))))

(declare-fun lt!6410 () tuple2!886)

(assert (=> b!20931 (= res!13599 (_1!446 lt!6410))))

(assert (=> b!20931 (= lt!6410 e!13654)))

(declare-fun c!2362 () Bool)

(declare-fun lt!6405 () Bool)

(assert (=> b!20931 (= c!2362 (and (not lt!6405) (not (= (bvand (extraKeys!1618 (v!1563 (underlying!100 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!20931 (= lt!6405 (= (bvand (extraKeys!1618 (v!1563 (underlying!100 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!24 ((_ BitVec 32) Int) LongMapFixedSize!178)

(declare-fun computeNewMask!21 (LongMap!178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20931 (= lt!6408 (getNewLongMapFixedSize!24 (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))) (defaultEntry!1714 (v!1563 (underlying!100 thiss!938)))))))

(declare-fun b!20932 () Bool)

(declare-fun c!2363 () Bool)

(assert (=> b!20932 (= c!2363 (and (not (= (bvand (extraKeys!1618 (v!1563 (underlying!100 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!6405))))

(declare-fun e!13648 () tuple2!886)

(assert (=> b!20932 (= e!13648 e!13655)))

(declare-fun c!2361 () Bool)

(declare-fun bm!1225 () Bool)

(assert (=> bm!1225 (= call!1227 (update!26 (ite c!2362 (_2!447 lt!6409) lt!6408) (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938)))))))))

(declare-fun b!20933 () Bool)

(declare-fun e!13649 () Bool)

(assert (=> b!20933 (= e!13649 tp_is_empty!991)))

(declare-fun b!20934 () Bool)

(declare-fun res!13598 () Bool)

(assert (=> b!20934 (=> (not res!13598) (not e!13647))))

(declare-fun valid!99 (LongMapFixedSize!178) Bool)

(assert (=> b!20934 (= res!13598 (valid!99 (v!1563 (_2!446 lt!6410))))))

(declare-fun b!20935 () Bool)

(declare-fun res!13596 () Bool)

(assert (=> b!20935 (=> (not res!13596) (not e!13647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!20935 (= res!13596 (validMask!0 (mask!4684 (v!1563 (underlying!100 thiss!938)))))))

(declare-fun b!20936 () Bool)

(assert (=> b!20936 (= e!13652 e!13653)))

(declare-fun b!20937 () Bool)

(declare-fun res!13595 () Bool)

(assert (=> b!20937 (=> (not res!13595) (not e!13647))))

(assert (=> b!20937 (= res!13595 (and (= (size!660 (_keys!3136 (v!1563 (underlying!100 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4684 (v!1563 (underlying!100 thiss!938))))) (bvsge (bvsub (size!660 (_keys!3136 (v!1563 (underlying!100 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (size!660 (_keys!3136 (v!1563 (underlying!100 thiss!938)))) #b00000000000000000000000000000001) (size!660 (_keys!3136 (v!1563 (underlying!100 thiss!938)))))))))

(declare-fun b!20938 () Bool)

(declare-fun e!13651 () Bool)

(assert (=> b!20938 (= e!13651 tp_is_empty!991)))

(declare-fun b!20939 () Bool)

(assert (=> b!20939 (= e!13647 (bvslt (bvadd #b00000000000000000000000000000001 (mask!4684 (v!1563 (_2!446 lt!6410)))) (_size!129 (v!1563 (underlying!100 thiss!938)))))))

(declare-fun b!20940 () Bool)

(assert (=> b!20940 (= e!13650 (and e!13649 mapRes!964))))

(declare-fun condMapEmpty!964 () Bool)

(declare-fun mapDefault!964 () ValueCell!296)

(assert (=> b!20940 (= condMapEmpty!964 (= (arr!566 (_values!1704 (v!1563 (underlying!100 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!296)) mapDefault!964)))))

(declare-fun b!20941 () Bool)

(declare-fun lt!6407 () tuple2!888)

(assert (=> b!20941 (= lt!6407 call!1228)))

(assert (=> b!20941 (= e!13648 (tuple2!887 (_1!447 lt!6407) (Cell!179 (_2!447 lt!6407))))))

(declare-fun b!20942 () Bool)

(assert (=> b!20942 (= e!13654 e!13648)))

(assert (=> b!20942 (= c!2361 (and (not lt!6405) (= (bvand (extraKeys!1618 (v!1563 (underlying!100 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!964 () Bool)

(declare-fun tp!3415 () Bool)

(assert (=> mapNonEmpty!964 (= mapRes!964 (and tp!3415 e!13651))))

(declare-fun mapRest!964 () (Array (_ BitVec 32) ValueCell!296))

(declare-fun mapKey!964 () (_ BitVec 32))

(declare-fun mapValue!964 () ValueCell!296)

(assert (=> mapNonEmpty!964 (= (arr!566 (_values!1704 (v!1563 (underlying!100 thiss!938)))) (store mapRest!964 mapKey!964 mapValue!964))))

(assert (= (and start!3330 res!13597) b!20931))

(assert (= (and b!20931 c!2362) b!20930))

(assert (= (and b!20931 (not c!2362)) b!20942))

(assert (= (and b!20942 c!2361) b!20941))

(assert (= (and b!20942 (not c!2361)) b!20932))

(assert (= (and b!20932 c!2363) b!20928))

(assert (= (and b!20932 (not c!2363)) b!20927))

(assert (= (or b!20941 b!20928) bm!1224))

(assert (= (or b!20930 bm!1224) bm!1225))

(assert (= (and b!20931 res!13599) b!20935))

(assert (= (and b!20935 res!13596) b!20937))

(assert (= (and b!20937 res!13595) b!20934))

(assert (= (and b!20934 res!13598) b!20939))

(assert (= (and b!20940 condMapEmpty!964) mapIsEmpty!964))

(assert (= (and b!20940 (not condMapEmpty!964)) mapNonEmpty!964))

(get-info :version)

(assert (= (and mapNonEmpty!964 ((_ is ValueCellFull!296) mapValue!964)) b!20938))

(assert (= (and b!20940 ((_ is ValueCellFull!296) mapDefault!964)) b!20933))

(assert (= b!20929 b!20940))

(assert (= b!20936 b!20929))

(assert (= b!20926 b!20936))

(assert (= start!3330 b!20926))

(declare-fun m!14603 () Bool)

(assert (=> mapNonEmpty!964 m!14603))

(declare-fun m!14605 () Bool)

(assert (=> b!20934 m!14605))

(declare-fun m!14607 () Bool)

(assert (=> bm!1225 m!14607))

(declare-fun m!14609 () Bool)

(assert (=> b!20930 m!14609))

(declare-fun m!14611 () Bool)

(assert (=> start!3330 m!14611))

(declare-fun m!14613 () Bool)

(assert (=> b!20929 m!14613))

(declare-fun m!14615 () Bool)

(assert (=> b!20929 m!14615))

(declare-fun m!14617 () Bool)

(assert (=> b!20931 m!14617))

(assert (=> b!20931 m!14617))

(declare-fun m!14619 () Bool)

(assert (=> b!20931 m!14619))

(declare-fun m!14621 () Bool)

(assert (=> b!20935 m!14621))

(check-sat (not mapNonEmpty!964) b_and!1405 (not b_next!727) (not b!20935) (not b!20929) (not b!20934) tp_is_empty!991 (not bm!1225) (not b!20930) (not b!20931) (not start!3330))
(check-sat b_and!1405 (not b_next!727))
(get-model)

(declare-fun d!3679 () Bool)

(declare-fun res!13636 () Bool)

(declare-fun e!13731 () Bool)

(assert (=> d!3679 (=> (not res!13636) (not e!13731))))

(declare-fun simpleValid!18 (LongMapFixedSize!178) Bool)

(assert (=> d!3679 (= res!13636 (simpleValid!18 (v!1563 (_2!446 lt!6410))))))

(assert (=> d!3679 (= (valid!99 (v!1563 (_2!446 lt!6410))) e!13731)))

(declare-fun b!21051 () Bool)

(declare-fun res!13637 () Bool)

(assert (=> b!21051 (=> (not res!13637) (not e!13731))))

(declare-fun arrayCountValidKeys!0 (array!1195 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!21051 (= res!13637 (= (arrayCountValidKeys!0 (_keys!3136 (v!1563 (_2!446 lt!6410))) #b00000000000000000000000000000000 (size!660 (_keys!3136 (v!1563 (_2!446 lt!6410))))) (_size!129 (v!1563 (_2!446 lt!6410)))))))

(declare-fun b!21052 () Bool)

(declare-fun res!13638 () Bool)

(assert (=> b!21052 (=> (not res!13638) (not e!13731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1195 (_ BitVec 32)) Bool)

(assert (=> b!21052 (= res!13638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3136 (v!1563 (_2!446 lt!6410))) (mask!4684 (v!1563 (_2!446 lt!6410)))))))

(declare-fun b!21053 () Bool)

(declare-datatypes ((List!555 0))(
  ( (Nil!552) (Cons!551 (h!1117 (_ BitVec 64)) (t!3205 List!555)) )
))
(declare-fun arrayNoDuplicates!0 (array!1195 (_ BitVec 32) List!555) Bool)

(assert (=> b!21053 (= e!13731 (arrayNoDuplicates!0 (_keys!3136 (v!1563 (_2!446 lt!6410))) #b00000000000000000000000000000000 Nil!552))))

(assert (= (and d!3679 res!13636) b!21051))

(assert (= (and b!21051 res!13637) b!21052))

(assert (= (and b!21052 res!13638) b!21053))

(declare-fun m!14663 () Bool)

(assert (=> d!3679 m!14663))

(declare-fun m!14665 () Bool)

(assert (=> b!21051 m!14665))

(declare-fun m!14667 () Bool)

(assert (=> b!21052 m!14667))

(declare-fun m!14669 () Bool)

(assert (=> b!21053 m!14669))

(assert (=> b!20934 d!3679))

(declare-fun b!21130 () Bool)

(declare-fun e!13790 () Bool)

(declare-fun call!1295 () Bool)

(assert (=> b!21130 (= e!13790 (not call!1295))))

(declare-fun b!21131 () Bool)

(declare-fun e!13787 () Bool)

(declare-fun e!13776 () Bool)

(assert (=> b!21131 (= e!13787 e!13776)))

(declare-fun c!2415 () Bool)

(declare-fun lt!6519 () tuple2!888)

(assert (=> b!21131 (= c!2415 (_1!447 lt!6519))))

(declare-fun bm!1286 () Bool)

(declare-fun call!1297 () Bool)

(declare-fun call!1296 () Bool)

(assert (=> bm!1286 (= call!1297 call!1296)))

(declare-fun bm!1287 () Bool)

(declare-datatypes ((SeekEntryResult!51 0))(
  ( (MissingZero!51 (index!2324 (_ BitVec 32))) (Found!51 (index!2325 (_ BitVec 32))) (Intermediate!51 (undefined!863 Bool) (index!2326 (_ BitVec 32)) (x!5114 (_ BitVec 32))) (Undefined!51) (MissingVacant!51 (index!2327 (_ BitVec 32))) )
))
(declare-fun call!1312 () SeekEntryResult!51)

(declare-fun call!1305 () SeekEntryResult!51)

(assert (=> bm!1287 (= call!1312 call!1305)))

(declare-fun b!21132 () Bool)

(declare-fun c!2409 () Bool)

(declare-fun lt!6514 () SeekEntryResult!51)

(assert (=> b!21132 (= c!2409 ((_ is MissingVacant!51) lt!6514))))

(declare-fun e!13772 () Bool)

(declare-fun e!13788 () Bool)

(assert (=> b!21132 (= e!13772 e!13788)))

(declare-fun b!21133 () Bool)

(declare-datatypes ((Unit!448 0))(
  ( (Unit!449) )
))
(declare-fun lt!6531 () Unit!448)

(declare-fun e!13777 () Unit!448)

(assert (=> b!21133 (= lt!6531 e!13777)))

(declare-fun c!2408 () Bool)

(declare-fun call!1302 () Bool)

(assert (=> b!21133 (= c!2408 call!1302)))

(declare-fun e!13786 () tuple2!888)

(assert (=> b!21133 (= e!13786 (tuple2!889 false lt!6408))))

(declare-fun b!21134 () Bool)

(declare-fun e!13775 () Bool)

(declare-fun lt!6511 () SeekEntryResult!51)

(assert (=> b!21134 (= e!13775 ((_ is Undefined!51) lt!6511))))

(declare-fun b!21135 () Bool)

(declare-fun lt!6515 () Unit!448)

(declare-fun lt!6528 () Unit!448)

(assert (=> b!21135 (= lt!6515 lt!6528)))

(assert (=> b!21135 call!1302))

(declare-fun lt!6521 () array!1193)

(declare-fun lt!6522 () SeekEntryResult!51)

(declare-fun lemmaValidKeyInArrayIsInListMap!6 (array!1195 array!1193 (_ BitVec 32) (_ BitVec 32) V!1147 V!1147 (_ BitVec 32) Int) Unit!448)

(assert (=> b!21135 (= lt!6528 (lemmaValidKeyInArrayIsInListMap!6 (_keys!3136 lt!6408) lt!6521 (mask!4684 lt!6408) (extraKeys!1618 lt!6408) (zeroValue!1642 lt!6408) (minValue!1642 lt!6408) (index!2325 lt!6522) (defaultEntry!1714 lt!6408)))))

(assert (=> b!21135 (= lt!6521 (array!1194 (store (arr!566 (_values!1704 lt!6408)) (index!2325 lt!6522) (ValueCellFull!296 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))))) (size!659 (_values!1704 lt!6408))))))

(declare-fun lt!6532 () Unit!448)

(declare-fun lt!6525 () Unit!448)

(assert (=> b!21135 (= lt!6532 lt!6525)))

(declare-datatypes ((tuple2!894 0))(
  ( (tuple2!895 (_1!450 (_ BitVec 64)) (_2!450 V!1147)) )
))
(declare-datatypes ((List!556 0))(
  ( (Nil!553) (Cons!552 (h!1118 tuple2!894) (t!3206 List!556)) )
))
(declare-datatypes ((ListLongMap!553 0))(
  ( (ListLongMap!554 (toList!292 List!556)) )
))
(declare-fun call!1298 () ListLongMap!553)

(declare-fun getCurrentListMap!123 (array!1195 array!1193 (_ BitVec 32) (_ BitVec 32) V!1147 V!1147 (_ BitVec 32) Int) ListLongMap!553)

(assert (=> b!21135 (= call!1298 (getCurrentListMap!123 (_keys!3136 lt!6408) (array!1194 (store (arr!566 (_values!1704 lt!6408)) (index!2325 lt!6522) (ValueCellFull!296 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))))) (size!659 (_values!1704 lt!6408))) (mask!4684 lt!6408) (extraKeys!1618 lt!6408) (zeroValue!1642 lt!6408) (minValue!1642 lt!6408) #b00000000000000000000000000000000 (defaultEntry!1714 lt!6408)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!6 (array!1195 array!1193 (_ BitVec 32) (_ BitVec 32) V!1147 V!1147 (_ BitVec 32) (_ BitVec 64) V!1147 Int) Unit!448)

(assert (=> b!21135 (= lt!6525 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!6 (_keys!3136 lt!6408) (_values!1704 lt!6408) (mask!4684 lt!6408) (extraKeys!1618 lt!6408) (zeroValue!1642 lt!6408) (minValue!1642 lt!6408) (index!2325 lt!6522) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (defaultEntry!1714 lt!6408)))))

(declare-fun lt!6508 () Unit!448)

(declare-fun e!13778 () Unit!448)

(assert (=> b!21135 (= lt!6508 e!13778)))

(declare-fun c!2412 () Bool)

(declare-fun call!1308 () ListLongMap!553)

(declare-fun contains!224 (ListLongMap!553 (_ BitVec 64)) Bool)

(assert (=> b!21135 (= c!2412 (contains!224 call!1308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!13780 () tuple2!888)

(assert (=> b!21135 (= e!13780 (tuple2!889 true (LongMapFixedSize!179 (defaultEntry!1714 lt!6408) (mask!4684 lt!6408) (extraKeys!1618 lt!6408) (zeroValue!1642 lt!6408) (minValue!1642 lt!6408) (_size!129 lt!6408) (_keys!3136 lt!6408) (array!1194 (store (arr!566 (_values!1704 lt!6408)) (index!2325 lt!6522) (ValueCellFull!296 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))))) (size!659 (_values!1704 lt!6408))) (_vacant!129 lt!6408))))))

(declare-fun bm!1288 () Bool)

(declare-fun c!2406 () Bool)

(declare-fun c!2413 () Bool)

(declare-fun call!1301 () ListLongMap!553)

(declare-fun +!41 (ListLongMap!553 tuple2!894) ListLongMap!553)

(assert (=> bm!1288 (= call!1298 (+!41 (ite c!2413 call!1301 call!1308) (ite c!2413 (ite c!2406 (tuple2!895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1642 (v!1563 (underlying!100 thiss!938)))) (tuple2!895 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))))) (tuple2!895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1642 (v!1563 (underlying!100 thiss!938)))))))))

(declare-fun b!21136 () Bool)

(declare-fun res!13669 () Bool)

(declare-fun e!13782 () Bool)

(assert (=> b!21136 (=> (not res!13669) (not e!13782))))

(declare-fun call!1294 () Bool)

(assert (=> b!21136 (= res!13669 call!1294)))

(declare-fun e!13779 () Bool)

(assert (=> b!21136 (= e!13779 e!13782)))

(declare-fun b!21137 () Bool)

(declare-fun lt!6512 () Unit!448)

(assert (=> b!21137 (= e!13778 lt!6512)))

(declare-fun call!1303 () Unit!448)

(assert (=> b!21137 (= lt!6512 call!1303)))

(declare-fun lt!6509 () SeekEntryResult!51)

(declare-fun call!1306 () SeekEntryResult!51)

(assert (=> b!21137 (= lt!6509 call!1306)))

(declare-fun res!13674 () Bool)

(assert (=> b!21137 (= res!13674 ((_ is Found!51) lt!6509))))

(declare-fun e!13791 () Bool)

(assert (=> b!21137 (=> (not res!13674) (not e!13791))))

(assert (=> b!21137 e!13791))

(declare-fun b!21138 () Bool)

(declare-fun lt!6527 () Unit!448)

(declare-fun lt!6507 () Unit!448)

(assert (=> b!21138 (= lt!6527 lt!6507)))

(declare-fun call!1307 () ListLongMap!553)

(declare-fun call!1309 () ListLongMap!553)

(assert (=> b!21138 (= call!1307 call!1309)))

(declare-fun lt!6533 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!6 (array!1195 array!1193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1147 V!1147 V!1147 Int) Unit!448)

(assert (=> b!21138 (= lt!6507 (lemmaChangeZeroKeyThenAddPairToListMap!6 (_keys!3136 lt!6408) (_values!1704 lt!6408) (mask!4684 lt!6408) (extraKeys!1618 lt!6408) lt!6533 (zeroValue!1642 lt!6408) (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 lt!6408) (defaultEntry!1714 lt!6408)))))

(assert (=> b!21138 (= lt!6533 (bvor (extraKeys!1618 lt!6408) #b00000000000000000000000000000001))))

(declare-fun e!13781 () tuple2!888)

(assert (=> b!21138 (= e!13781 (tuple2!889 true (LongMapFixedSize!179 (defaultEntry!1714 lt!6408) (mask!4684 lt!6408) (bvor (extraKeys!1618 lt!6408) #b00000000000000000000000000000001) (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 lt!6408) (_size!129 lt!6408) (_keys!3136 lt!6408) (_values!1704 lt!6408) (_vacant!129 lt!6408))))))

(declare-fun b!21139 () Bool)

(declare-fun res!13675 () Bool)

(assert (=> b!21139 (=> (not res!13675) (not e!13782))))

(assert (=> b!21139 (= res!13675 (= (select (arr!567 (_keys!3136 lt!6408)) (index!2324 lt!6511)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21140 () Bool)

(declare-fun call!1289 () Bool)

(assert (=> b!21140 (= e!13782 (not call!1289))))

(declare-fun b!21141 () Bool)

(declare-fun e!13774 () Bool)

(assert (=> b!21141 (= e!13776 e!13774)))

(declare-fun res!13670 () Bool)

(declare-fun call!1300 () ListLongMap!553)

(assert (=> b!21141 (= res!13670 (contains!224 call!1300 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21141 (=> (not res!13670) (not e!13774))))

(declare-fun b!21142 () Bool)

(declare-fun Unit!450 () Unit!448)

(assert (=> b!21142 (= e!13777 Unit!450)))

(declare-fun lt!6520 () Unit!448)

(assert (=> b!21142 (= lt!6520 call!1303)))

(declare-fun lt!6529 () SeekEntryResult!51)

(assert (=> b!21142 (= lt!6529 call!1312)))

(declare-fun res!13672 () Bool)

(assert (=> b!21142 (= res!13672 ((_ is Found!51) lt!6529))))

(declare-fun e!13773 () Bool)

(assert (=> b!21142 (=> (not res!13672) (not e!13773))))

(assert (=> b!21142 e!13773))

(declare-fun lt!6526 () Unit!448)

(assert (=> b!21142 (= lt!6526 lt!6520)))

(assert (=> b!21142 false))

(declare-fun bm!1289 () Bool)

(declare-fun call!1299 () Bool)

(assert (=> bm!1289 (= call!1299 call!1296)))

(declare-fun b!21143 () Bool)

(declare-fun e!13783 () Bool)

(assert (=> b!21143 (= e!13783 (not call!1289))))

(declare-fun b!21144 () Bool)

(declare-fun Unit!451 () Unit!448)

(assert (=> b!21144 (= e!13778 Unit!451)))

(declare-fun lt!6530 () Unit!448)

(declare-fun call!1311 () Unit!448)

(assert (=> b!21144 (= lt!6530 call!1311)))

(assert (=> b!21144 (= lt!6511 call!1306)))

(declare-fun c!2407 () Bool)

(assert (=> b!21144 (= c!2407 ((_ is MissingZero!51) lt!6511))))

(assert (=> b!21144 e!13779))

(declare-fun lt!6517 () Unit!448)

(assert (=> b!21144 (= lt!6517 lt!6530)))

(assert (=> b!21144 false))

(declare-fun b!21145 () Bool)

(declare-fun e!13785 () tuple2!888)

(assert (=> b!21145 (= e!13785 e!13780)))

(declare-fun c!2414 () Bool)

(assert (=> b!21145 (= c!2414 ((_ is MissingZero!51) lt!6522))))

(declare-fun b!21146 () Bool)

(declare-fun c!2416 () Bool)

(assert (=> b!21146 (= c!2416 ((_ is MissingVacant!51) lt!6522))))

(assert (=> b!21146 (= e!13786 e!13785)))

(declare-fun b!21147 () Bool)

(assert (=> b!21147 (= e!13773 (= (select (arr!567 (_keys!3136 lt!6408)) (index!2325 lt!6529)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1290 () Bool)

(assert (=> bm!1290 (= call!1309 call!1308)))

(declare-fun bm!1291 () Bool)

(declare-fun lt!6513 () (_ BitVec 32))

(assert (=> bm!1291 (= call!1308 (getCurrentListMap!123 (_keys!3136 lt!6408) (_values!1704 lt!6408) (mask!4684 lt!6408) (ite c!2413 (ite c!2406 lt!6533 lt!6513) (extraKeys!1618 lt!6408)) (ite (and c!2413 c!2406) (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (zeroValue!1642 lt!6408)) (ite c!2413 (ite c!2406 (minValue!1642 lt!6408) (zeroValue!1642 (v!1563 (underlying!100 thiss!938)))) (minValue!1642 lt!6408)) #b00000000000000000000000000000000 (defaultEntry!1714 lt!6408)))))

(declare-fun c!2417 () Bool)

(declare-fun c!2410 () Bool)

(declare-fun bm!1292 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1292 (= call!1296 (inRange!0 (ite c!2417 (ite c!2408 (index!2325 lt!6529) (ite c!2410 (index!2324 lt!6514) (index!2327 lt!6514))) (ite c!2412 (index!2325 lt!6509) (ite c!2407 (index!2324 lt!6511) (index!2327 lt!6511)))) (mask!4684 lt!6408)))))

(declare-fun b!21148 () Bool)

(declare-fun lt!6516 () Unit!448)

(declare-fun lt!6523 () Unit!448)

(assert (=> b!21148 (= lt!6516 lt!6523)))

(assert (=> b!21148 (= call!1307 call!1309)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!6 (array!1195 array!1193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1147 V!1147 V!1147 Int) Unit!448)

(assert (=> b!21148 (= lt!6523 (lemmaChangeLongMinValueKeyThenAddPairToListMap!6 (_keys!3136 lt!6408) (_values!1704 lt!6408) (mask!4684 lt!6408) (extraKeys!1618 lt!6408) lt!6513 (zeroValue!1642 lt!6408) (minValue!1642 lt!6408) (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (defaultEntry!1714 lt!6408)))))

(assert (=> b!21148 (= lt!6513 (bvor (extraKeys!1618 lt!6408) #b00000000000000000000000000000010))))

(assert (=> b!21148 (= e!13781 (tuple2!889 true (LongMapFixedSize!179 (defaultEntry!1714 lt!6408) (mask!4684 lt!6408) (bvor (extraKeys!1618 lt!6408) #b00000000000000000000000000000010) (zeroValue!1642 lt!6408) (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (_size!129 lt!6408) (_keys!3136 lt!6408) (_values!1704 lt!6408) (_vacant!129 lt!6408))))))

(declare-fun b!21149 () Bool)

(declare-fun call!1310 () ListLongMap!553)

(assert (=> b!21149 (= e!13776 (= call!1300 call!1310))))

(declare-fun bm!1293 () Bool)

(assert (=> bm!1293 (= call!1294 call!1299)))

(declare-fun b!21150 () Bool)

(declare-fun lt!6524 () tuple2!888)

(declare-fun call!1291 () tuple2!888)

(assert (=> b!21150 (= lt!6524 call!1291)))

(assert (=> b!21150 (= e!13780 (tuple2!889 (_1!447 lt!6524) (_2!447 lt!6524)))))

(declare-fun bm!1294 () Bool)

(declare-fun map!392 (LongMapFixedSize!178) ListLongMap!553)

(assert (=> bm!1294 (= call!1310 (map!392 lt!6408))))

(declare-fun b!21151 () Bool)

(declare-fun res!13676 () Bool)

(assert (=> b!21151 (= res!13676 (= (select (arr!567 (_keys!3136 lt!6408)) (index!2327 lt!6511)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21151 (=> (not res!13676) (not e!13783))))

(declare-fun bm!1295 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!6 (array!1195 array!1193 (_ BitVec 32) (_ BitVec 32) V!1147 V!1147 (_ BitVec 64) Int) Unit!448)

(assert (=> bm!1295 (= call!1303 (lemmaInListMapThenSeekEntryOrOpenFindsIt!6 (_keys!3136 lt!6408) (_values!1704 lt!6408) (mask!4684 lt!6408) (extraKeys!1618 lt!6408) (zeroValue!1642 lt!6408) (minValue!1642 lt!6408) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1714 lt!6408)))))

(declare-fun b!21152 () Bool)

(declare-fun e!13784 () Bool)

(assert (=> b!21152 (= e!13784 (not call!1295))))

(declare-fun bm!1296 () Bool)

(declare-fun call!1292 () Bool)

(declare-fun arrayContainsKey!0 (array!1195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!1296 (= call!1292 (arrayContainsKey!0 (_keys!3136 lt!6408) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!21153 () Bool)

(declare-fun e!13789 () tuple2!888)

(assert (=> b!21153 (= e!13789 e!13786)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1195 (_ BitVec 32)) SeekEntryResult!51)

(assert (=> b!21153 (= lt!6522 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3136 lt!6408) (mask!4684 lt!6408)))))

(assert (=> b!21153 (= c!2417 ((_ is Undefined!51) lt!6522))))

(declare-fun b!21154 () Bool)

(assert (=> b!21154 (= e!13788 ((_ is Undefined!51) lt!6514))))

(declare-fun bm!1297 () Bool)

(declare-fun call!1290 () Bool)

(assert (=> bm!1297 (= call!1290 call!1297)))

(declare-fun b!21155 () Bool)

(declare-fun lt!6518 () tuple2!888)

(assert (=> b!21155 (= e!13785 (tuple2!889 (_1!447 lt!6518) (_2!447 lt!6518)))))

(assert (=> b!21155 (= lt!6518 call!1291)))

(declare-fun bm!1298 () Bool)

(assert (=> bm!1298 (= call!1289 call!1292)))

(declare-fun bm!1299 () Bool)

(assert (=> bm!1299 (= call!1305 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3136 lt!6408) (mask!4684 lt!6408)))))

(declare-fun b!21156 () Bool)

(assert (=> b!21156 (= e!13789 e!13781)))

(assert (=> b!21156 (= c!2406 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1301 () Bool)

(declare-fun updateHelperNewKey!6 (LongMapFixedSize!178 (_ BitVec 64) V!1147 (_ BitVec 32)) tuple2!888)

(assert (=> bm!1301 (= call!1291 (updateHelperNewKey!6 lt!6408 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2416 (index!2327 lt!6522) (index!2324 lt!6522))))))

(declare-fun d!3681 () Bool)

(assert (=> d!3681 e!13787))

(declare-fun res!13671 () Bool)

(assert (=> d!3681 (=> (not res!13671) (not e!13787))))

(assert (=> d!3681 (= res!13671 (valid!99 (_2!447 lt!6519)))))

(assert (=> d!3681 (= lt!6519 e!13789)))

(assert (=> d!3681 (= c!2413 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3681 (valid!99 lt!6408)))

(assert (=> d!3681 (= (update!26 lt!6408 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1642 (v!1563 (underlying!100 thiss!938)))) lt!6519)))

(declare-fun bm!1300 () Bool)

(declare-fun call!1304 () ListLongMap!553)

(assert (=> bm!1300 (= call!1302 (contains!224 call!1304 (ite c!2417 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!567 (_keys!3136 lt!6408)) (index!2325 lt!6522)))))))

(declare-fun b!21157 () Bool)

(declare-fun res!13680 () Bool)

(assert (=> b!21157 (= res!13680 (= (select (arr!567 (_keys!3136 lt!6408)) (index!2327 lt!6514)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21157 (=> (not res!13680) (not e!13790))))

(declare-fun bm!1302 () Bool)

(declare-fun call!1293 () ListLongMap!553)

(assert (=> bm!1302 (= call!1304 call!1293)))

(declare-fun bm!1303 () Bool)

(assert (=> bm!1303 (= call!1295 call!1292)))

(declare-fun bm!1304 () Bool)

(assert (=> bm!1304 (= call!1307 call!1298)))

(declare-fun b!21158 () Bool)

(declare-fun res!13668 () Bool)

(assert (=> b!21158 (= res!13668 call!1299)))

(assert (=> b!21158 (=> (not res!13668) (not e!13791))))

(declare-fun bm!1305 () Bool)

(assert (=> bm!1305 (= call!1301 call!1293)))

(declare-fun bm!1306 () Bool)

(assert (=> bm!1306 (= call!1293 (getCurrentListMap!123 (_keys!3136 lt!6408) (ite (or c!2413 c!2417) (_values!1704 lt!6408) lt!6521) (mask!4684 lt!6408) (extraKeys!1618 lt!6408) (zeroValue!1642 lt!6408) (minValue!1642 lt!6408) #b00000000000000000000000000000000 (defaultEntry!1714 lt!6408)))))

(declare-fun bm!1307 () Bool)

(assert (=> bm!1307 (= call!1300 (map!392 (_2!447 lt!6519)))))

(declare-fun b!21159 () Bool)

(assert (=> b!21159 (= e!13791 (= (select (arr!567 (_keys!3136 lt!6408)) (index!2325 lt!6509)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21160 () Bool)

(assert (=> b!21160 (= e!13788 e!13790)))

(declare-fun res!13677 () Bool)

(assert (=> b!21160 (= res!13677 call!1290)))

(assert (=> b!21160 (=> (not res!13677) (not e!13790))))

(declare-fun bm!1308 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!6 (array!1195 array!1193 (_ BitVec 32) (_ BitVec 32) V!1147 V!1147 (_ BitVec 64) Int) Unit!448)

(assert (=> bm!1308 (= call!1311 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!6 (_keys!3136 lt!6408) (_values!1704 lt!6408) (mask!4684 lt!6408) (extraKeys!1618 lt!6408) (zeroValue!1642 lt!6408) (minValue!1642 lt!6408) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1714 lt!6408)))))

(declare-fun b!21161 () Bool)

(declare-fun res!13667 () Bool)

(assert (=> b!21161 (= res!13667 call!1297)))

(assert (=> b!21161 (=> (not res!13667) (not e!13773))))

(declare-fun b!21162 () Bool)

(declare-fun c!2411 () Bool)

(assert (=> b!21162 (= c!2411 ((_ is MissingVacant!51) lt!6511))))

(assert (=> b!21162 (= e!13779 e!13775)))

(declare-fun bm!1309 () Bool)

(assert (=> bm!1309 (= call!1306 call!1305)))

(declare-fun b!21163 () Bool)

(declare-fun lt!6510 () Unit!448)

(assert (=> b!21163 (= e!13777 lt!6510)))

(assert (=> b!21163 (= lt!6510 call!1311)))

(assert (=> b!21163 (= lt!6514 call!1312)))

(assert (=> b!21163 (= c!2410 ((_ is MissingZero!51) lt!6514))))

(assert (=> b!21163 e!13772))

(declare-fun b!21164 () Bool)

(declare-fun res!13679 () Bool)

(assert (=> b!21164 (=> (not res!13679) (not e!13784))))

(assert (=> b!21164 (= res!13679 (= (select (arr!567 (_keys!3136 lt!6408)) (index!2324 lt!6514)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21165 () Bool)

(assert (=> b!21165 (= e!13775 e!13783)))

(declare-fun res!13673 () Bool)

(assert (=> b!21165 (= res!13673 call!1294)))

(assert (=> b!21165 (=> (not res!13673) (not e!13783))))

(declare-fun b!21166 () Bool)

(declare-fun res!13678 () Bool)

(assert (=> b!21166 (=> (not res!13678) (not e!13784))))

(assert (=> b!21166 (= res!13678 call!1290)))

(assert (=> b!21166 (= e!13772 e!13784)))

(declare-fun b!21167 () Bool)

(assert (=> b!21167 (= e!13774 (= call!1300 (+!41 call!1310 (tuple2!895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1642 (v!1563 (underlying!100 thiss!938)))))))))

(assert (= (and d!3681 c!2413) b!21156))

(assert (= (and d!3681 (not c!2413)) b!21153))

(assert (= (and b!21156 c!2406) b!21138))

(assert (= (and b!21156 (not c!2406)) b!21148))

(assert (= (or b!21138 b!21148) bm!1290))

(assert (= (or b!21138 b!21148) bm!1305))

(assert (= (or b!21138 b!21148) bm!1304))

(assert (= (and b!21153 c!2417) b!21133))

(assert (= (and b!21153 (not c!2417)) b!21146))

(assert (= (and b!21133 c!2408) b!21142))

(assert (= (and b!21133 (not c!2408)) b!21163))

(assert (= (and b!21142 res!13672) b!21161))

(assert (= (and b!21161 res!13667) b!21147))

(assert (= (and b!21163 c!2410) b!21166))

(assert (= (and b!21163 (not c!2410)) b!21132))

(assert (= (and b!21166 res!13678) b!21164))

(assert (= (and b!21164 res!13679) b!21152))

(assert (= (and b!21132 c!2409) b!21160))

(assert (= (and b!21132 (not c!2409)) b!21154))

(assert (= (and b!21160 res!13677) b!21157))

(assert (= (and b!21157 res!13680) b!21130))

(assert (= (or b!21166 b!21160) bm!1297))

(assert (= (or b!21152 b!21130) bm!1303))

(assert (= (or b!21161 bm!1297) bm!1286))

(assert (= (or b!21142 b!21163) bm!1287))

(assert (= (and b!21146 c!2416) b!21155))

(assert (= (and b!21146 (not c!2416)) b!21145))

(assert (= (and b!21145 c!2414) b!21150))

(assert (= (and b!21145 (not c!2414)) b!21135))

(assert (= (and b!21135 c!2412) b!21137))

(assert (= (and b!21135 (not c!2412)) b!21144))

(assert (= (and b!21137 res!13674) b!21158))

(assert (= (and b!21158 res!13668) b!21159))

(assert (= (and b!21144 c!2407) b!21136))

(assert (= (and b!21144 (not c!2407)) b!21162))

(assert (= (and b!21136 res!13669) b!21139))

(assert (= (and b!21139 res!13675) b!21140))

(assert (= (and b!21162 c!2411) b!21165))

(assert (= (and b!21162 (not c!2411)) b!21134))

(assert (= (and b!21165 res!13673) b!21151))

(assert (= (and b!21151 res!13676) b!21143))

(assert (= (or b!21136 b!21165) bm!1293))

(assert (= (or b!21140 b!21143) bm!1298))

(assert (= (or b!21158 bm!1293) bm!1289))

(assert (= (or b!21137 b!21144) bm!1309))

(assert (= (or b!21155 b!21150) bm!1301))

(assert (= (or bm!1286 bm!1289) bm!1292))

(assert (= (or b!21133 b!21135) bm!1302))

(assert (= (or bm!1303 bm!1298) bm!1296))

(assert (= (or b!21142 b!21137) bm!1295))

(assert (= (or bm!1287 bm!1309) bm!1299))

(assert (= (or b!21163 b!21144) bm!1308))

(assert (= (or b!21133 b!21135) bm!1300))

(assert (= (or bm!1305 bm!1302) bm!1306))

(assert (= (or bm!1290 b!21135) bm!1291))

(assert (= (or bm!1304 b!21135) bm!1288))

(assert (= (and d!3681 res!13671) b!21131))

(assert (= (and b!21131 c!2415) b!21141))

(assert (= (and b!21131 (not c!2415)) b!21149))

(assert (= (and b!21141 res!13670) b!21167))

(assert (= (or b!21167 b!21149) bm!1294))

(assert (= (or b!21141 b!21167 b!21149) bm!1307))

(declare-fun m!14671 () Bool)

(assert (=> bm!1299 m!14671))

(declare-fun m!14673 () Bool)

(assert (=> b!21151 m!14673))

(declare-fun m!14675 () Bool)

(assert (=> bm!1307 m!14675))

(declare-fun m!14677 () Bool)

(assert (=> b!21141 m!14677))

(declare-fun m!14679 () Bool)

(assert (=> b!21164 m!14679))

(declare-fun m!14681 () Bool)

(assert (=> bm!1294 m!14681))

(declare-fun m!14683 () Bool)

(assert (=> bm!1300 m!14683))

(declare-fun m!14685 () Bool)

(assert (=> bm!1300 m!14685))

(declare-fun m!14687 () Bool)

(assert (=> bm!1292 m!14687))

(declare-fun m!14689 () Bool)

(assert (=> bm!1301 m!14689))

(declare-fun m!14691 () Bool)

(assert (=> bm!1295 m!14691))

(declare-fun m!14693 () Bool)

(assert (=> bm!1288 m!14693))

(declare-fun m!14695 () Bool)

(assert (=> bm!1291 m!14695))

(declare-fun m!14697 () Bool)

(assert (=> bm!1296 m!14697))

(declare-fun m!14699 () Bool)

(assert (=> b!21148 m!14699))

(declare-fun m!14701 () Bool)

(assert (=> b!21159 m!14701))

(declare-fun m!14703 () Bool)

(assert (=> b!21139 m!14703))

(declare-fun m!14705 () Bool)

(assert (=> b!21167 m!14705))

(declare-fun m!14707 () Bool)

(assert (=> b!21147 m!14707))

(declare-fun m!14709 () Bool)

(assert (=> d!3681 m!14709))

(declare-fun m!14711 () Bool)

(assert (=> d!3681 m!14711))

(declare-fun m!14713 () Bool)

(assert (=> b!21135 m!14713))

(declare-fun m!14715 () Bool)

(assert (=> b!21135 m!14715))

(declare-fun m!14717 () Bool)

(assert (=> b!21135 m!14717))

(declare-fun m!14719 () Bool)

(assert (=> b!21135 m!14719))

(declare-fun m!14721 () Bool)

(assert (=> b!21135 m!14721))

(declare-fun m!14723 () Bool)

(assert (=> b!21157 m!14723))

(declare-fun m!14725 () Bool)

(assert (=> bm!1306 m!14725))

(declare-fun m!14727 () Bool)

(assert (=> bm!1308 m!14727))

(declare-fun m!14729 () Bool)

(assert (=> b!21138 m!14729))

(assert (=> b!21153 m!14671))

(assert (=> b!20930 d!3681))

(declare-fun d!3683 () Bool)

(assert (=> d!3683 (= (validMask!0 (mask!4684 (v!1563 (underlying!100 thiss!938)))) (and (or (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000000000000000000111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000000000000000001111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000000000000000011111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000000000000000111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000000000000001111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000000000000011111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000000000000111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000000000001111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000000000011111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000000000111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000000001111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000000011111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000000111111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000001111111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000011111111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000111111111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000001111111111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000011111111111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000111111111111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000001111111111111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000011111111111111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000111111111111111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000001111111111111111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000011111111111111111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000111111111111111111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00001111111111111111111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00011111111111111111111111111111) (= (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!20935 d!3683))

(declare-fun b!21180 () Bool)

(declare-fun e!13799 () Unit!448)

(declare-fun Unit!452 () Unit!448)

(assert (=> b!21180 (= e!13799 Unit!452)))

(declare-fun b!21182 () Bool)

(declare-fun e!13798 () Bool)

(declare-fun lt!6596 () array!1195)

(declare-fun lt!6581 () tuple2!894)

(assert (=> b!21182 (= e!13798 (arrayContainsKey!0 lt!6596 (_1!450 lt!6581) #b00000000000000000000000000000000))))

(declare-fun b!21183 () Bool)

(declare-fun Unit!453 () Unit!448)

(assert (=> b!21183 (= e!13799 Unit!453)))

(declare-fun lt!6586 () LongMapFixedSize!178)

(declare-fun head!826 (List!556) tuple2!894)

(assert (=> b!21183 (= lt!6581 (head!826 (toList!292 (map!392 lt!6586))))))

(assert (=> b!21183 (= lt!6596 (array!1196 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6598 () (_ BitVec 32))

(assert (=> b!21183 (= lt!6598 #b00000000000000000000000000000000)))

(declare-fun lt!6587 () Unit!448)

(declare-fun lemmaKeyInListMapIsInArray!93 (array!1195 array!1193 (_ BitVec 32) (_ BitVec 32) V!1147 V!1147 (_ BitVec 64) Int) Unit!448)

(declare-fun dynLambda!139 (Int (_ BitVec 64)) V!1147)

(assert (=> b!21183 (= lt!6587 (lemmaKeyInListMapIsInArray!93 lt!6596 (array!1194 ((as const (Array (_ BitVec 32) ValueCell!296)) EmptyCell!296) (bvadd (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))) lt!6598 (dynLambda!139 (defaultEntry!1714 (v!1563 (underlying!100 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!139 (defaultEntry!1714 (v!1563 (underlying!100 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!450 lt!6581) (defaultEntry!1714 (v!1563 (underlying!100 thiss!938)))))))

(declare-fun c!2423 () Bool)

(assert (=> b!21183 (= c!2423 (and (not (= (_1!450 lt!6581) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!450 lt!6581) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21183 e!13798))

(declare-fun lt!6582 () Unit!448)

(assert (=> b!21183 (= lt!6582 lt!6587)))

(declare-fun lt!6584 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1195 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!21183 (= lt!6584 (arrayScanForKey!0 (array!1196 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))) #b00000000000000000000000000000001)) (_1!450 lt!6581) #b00000000000000000000000000000000))))

(assert (=> b!21183 false))

(declare-fun d!3685 () Bool)

(declare-fun e!13800 () Bool)

(assert (=> d!3685 e!13800))

(declare-fun res!13685 () Bool)

(assert (=> d!3685 (=> (not res!13685) (not e!13800))))

(declare-fun lt!6597 () LongMapFixedSize!178)

(assert (=> d!3685 (= res!13685 (valid!99 lt!6597))))

(assert (=> d!3685 (= lt!6597 lt!6586)))

(declare-fun lt!6601 () Unit!448)

(assert (=> d!3685 (= lt!6601 e!13799)))

(declare-fun c!2422 () Bool)

(assert (=> d!3685 (= c!2422 (not (= (map!392 lt!6586) (ListLongMap!554 Nil!553))))))

(declare-fun lt!6583 () Unit!448)

(declare-fun lt!6589 () Unit!448)

(assert (=> d!3685 (= lt!6583 lt!6589)))

(declare-fun lt!6588 () array!1195)

(declare-fun lt!6585 () (_ BitVec 32))

(declare-fun lt!6580 () List!555)

(assert (=> d!3685 (arrayNoDuplicates!0 lt!6588 lt!6585 lt!6580)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1195 (_ BitVec 32) (_ BitVec 32) List!555) Unit!448)

(assert (=> d!3685 (= lt!6589 (lemmaArrayNoDuplicatesInAll0Array!0 lt!6588 lt!6585 (bvadd (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))) #b00000000000000000000000000000001) lt!6580))))

(assert (=> d!3685 (= lt!6580 Nil!552)))

(assert (=> d!3685 (= lt!6585 #b00000000000000000000000000000000)))

(assert (=> d!3685 (= lt!6588 (array!1196 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6595 () Unit!448)

(declare-fun lt!6592 () Unit!448)

(assert (=> d!3685 (= lt!6595 lt!6592)))

(declare-fun lt!6602 () (_ BitVec 32))

(declare-fun lt!6593 () array!1195)

(assert (=> d!3685 (arrayForallSeekEntryOrOpenFound!0 lt!6602 lt!6593 (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1195 (_ BitVec 32) (_ BitVec 32)) Unit!448)

(assert (=> d!3685 (= lt!6592 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!6593 (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))) lt!6602))))

(assert (=> d!3685 (= lt!6602 #b00000000000000000000000000000000)))

(assert (=> d!3685 (= lt!6593 (array!1196 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6591 () Unit!448)

(declare-fun lt!6594 () Unit!448)

(assert (=> d!3685 (= lt!6591 lt!6594)))

(declare-fun lt!6600 () array!1195)

(declare-fun lt!6599 () (_ BitVec 32))

(declare-fun lt!6590 () (_ BitVec 32))

(assert (=> d!3685 (= (arrayCountValidKeys!0 lt!6600 lt!6599 lt!6590) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1195 (_ BitVec 32) (_ BitVec 32)) Unit!448)

(assert (=> d!3685 (= lt!6594 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!6600 lt!6599 lt!6590))))

(assert (=> d!3685 (= lt!6590 (bvadd (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3685 (= lt!6599 #b00000000000000000000000000000000)))

(assert (=> d!3685 (= lt!6600 (array!1196 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3685 (= lt!6586 (LongMapFixedSize!179 (defaultEntry!1714 (v!1563 (underlying!100 thiss!938))) (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!139 (defaultEntry!1714 (v!1563 (underlying!100 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!139 (defaultEntry!1714 (v!1563 (underlying!100 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1196 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))) #b00000000000000000000000000000001)) (array!1194 ((as const (Array (_ BitVec 32) ValueCell!296)) EmptyCell!296) (bvadd (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3685 (validMask!0 (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))))))

(assert (=> d!3685 (= (getNewLongMapFixedSize!24 (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))) (defaultEntry!1714 (v!1563 (underlying!100 thiss!938)))) lt!6597)))

(declare-fun b!21181 () Bool)

(declare-fun res!13686 () Bool)

(assert (=> b!21181 (=> (not res!13686) (not e!13800))))

(assert (=> b!21181 (= res!13686 (= (mask!4684 lt!6597) (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938))))))))

(declare-fun b!21184 () Bool)

(assert (=> b!21184 (= e!13798 (ite (= (_1!450 lt!6581) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!6598 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!6598 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!21185 () Bool)

(assert (=> b!21185 (= e!13800 (= (map!392 lt!6597) (ListLongMap!554 Nil!553)))))

(assert (= (and d!3685 c!2422) b!21183))

(assert (= (and d!3685 (not c!2422)) b!21180))

(assert (= (and b!21183 c!2423) b!21182))

(assert (= (and b!21183 (not c!2423)) b!21184))

(assert (= (and d!3685 res!13685) b!21181))

(assert (= (and b!21181 res!13686) b!21185))

(declare-fun b_lambda!1501 () Bool)

(assert (=> (not b_lambda!1501) (not b!21183)))

(declare-fun t!3204 () Bool)

(declare-fun tb!637 () Bool)

(assert (=> (and b!20929 (= (defaultEntry!1714 (v!1563 (underlying!100 thiss!938))) (defaultEntry!1714 (v!1563 (underlying!100 thiss!938)))) t!3204) tb!637))

(declare-fun result!1057 () Bool)

(assert (=> tb!637 (= result!1057 tp_is_empty!991)))

(assert (=> b!21183 t!3204))

(declare-fun b_and!1411 () Bool)

(assert (= b_and!1405 (and (=> t!3204 result!1057) b_and!1411)))

(declare-fun b_lambda!1503 () Bool)

(assert (=> (not b_lambda!1503) (not d!3685)))

(assert (=> d!3685 t!3204))

(declare-fun b_and!1413 () Bool)

(assert (= b_and!1411 (and (=> t!3204 result!1057) b_and!1413)))

(declare-fun m!14731 () Bool)

(assert (=> b!21182 m!14731))

(declare-fun m!14733 () Bool)

(assert (=> b!21183 m!14733))

(declare-fun m!14735 () Bool)

(assert (=> b!21183 m!14735))

(declare-fun m!14737 () Bool)

(assert (=> b!21183 m!14737))

(declare-fun m!14739 () Bool)

(assert (=> b!21183 m!14739))

(assert (=> b!21183 m!14617))

(assert (=> b!21183 m!14733))

(assert (=> b!21183 m!14733))

(declare-fun m!14741 () Bool)

(assert (=> b!21183 m!14741))

(assert (=> d!3685 m!14617))

(declare-fun m!14743 () Bool)

(assert (=> d!3685 m!14743))

(assert (=> d!3685 m!14733))

(declare-fun m!14745 () Bool)

(assert (=> d!3685 m!14745))

(declare-fun m!14747 () Bool)

(assert (=> d!3685 m!14747))

(declare-fun m!14749 () Bool)

(assert (=> d!3685 m!14749))

(declare-fun m!14751 () Bool)

(assert (=> d!3685 m!14751))

(assert (=> d!3685 m!14617))

(declare-fun m!14753 () Bool)

(assert (=> d!3685 m!14753))

(assert (=> d!3685 m!14739))

(declare-fun m!14755 () Bool)

(assert (=> d!3685 m!14755))

(assert (=> d!3685 m!14617))

(declare-fun m!14757 () Bool)

(assert (=> d!3685 m!14757))

(declare-fun m!14759 () Bool)

(assert (=> b!21185 m!14759))

(assert (=> b!20931 d!3685))

(declare-fun d!3687 () Bool)

(declare-fun e!13806 () Bool)

(assert (=> d!3687 e!13806))

(declare-fun res!13689 () Bool)

(assert (=> d!3687 (=> (not res!13689) (not e!13806))))

(declare-fun lt!6608 () (_ BitVec 32))

(assert (=> d!3687 (= res!13689 (validMask!0 lt!6608))))

(declare-datatypes ((tuple2!896 0))(
  ( (tuple2!897 (_1!451 Unit!448) (_2!451 (_ BitVec 32))) )
))
(declare-fun e!13805 () tuple2!896)

(assert (=> d!3687 (= lt!6608 (_2!451 e!13805))))

(declare-fun c!2426 () Bool)

(declare-fun lt!6607 () tuple2!896)

(assert (=> d!3687 (= c!2426 (and (bvsgt (_2!451 lt!6607) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!129 (v!1563 (underlying!100 thiss!938)))) (_2!451 lt!6607)) (bvsge (bvadd (bvand (bvashr (_2!451 lt!6607) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!129 (v!1563 (underlying!100 thiss!938))))))))

(declare-fun Unit!454 () Unit!448)

(declare-fun Unit!455 () Unit!448)

(assert (=> d!3687 (= lt!6607 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!129 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))))) (mask!4684 (v!1563 (underlying!100 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!129 (v!1563 (underlying!100 thiss!938)))) (mask!4684 (v!1563 (underlying!100 thiss!938))))) (tuple2!897 Unit!454 (bvand (bvadd (bvshl (mask!4684 (v!1563 (underlying!100 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!897 Unit!455 (mask!4684 (v!1563 (underlying!100 thiss!938))))))))

(assert (=> d!3687 (validMask!0 (mask!4684 (v!1563 (underlying!100 thiss!938))))))

(assert (=> d!3687 (= (computeNewMask!21 thiss!938 (mask!4684 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (_size!129 (v!1563 (underlying!100 thiss!938)))) lt!6608)))

(declare-fun b!21194 () Bool)

(declare-fun computeNewMaskWhile!10 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!896)

(assert (=> b!21194 (= e!13805 (computeNewMaskWhile!10 (_size!129 (v!1563 (underlying!100 thiss!938))) (_vacant!129 (v!1563 (underlying!100 thiss!938))) (mask!4684 (v!1563 (underlying!100 thiss!938))) (_2!451 lt!6607)))))

(declare-fun b!21195 () Bool)

(declare-fun Unit!456 () Unit!448)

(assert (=> b!21195 (= e!13805 (tuple2!897 Unit!456 (_2!451 lt!6607)))))

(declare-fun b!21196 () Bool)

(assert (=> b!21196 (= e!13806 (bvsle (_size!129 (v!1563 (underlying!100 thiss!938))) (bvadd lt!6608 #b00000000000000000000000000000001)))))

(assert (= (and d!3687 c!2426) b!21194))

(assert (= (and d!3687 (not c!2426)) b!21195))

(assert (= (and d!3687 res!13689) b!21196))

(declare-fun m!14761 () Bool)

(assert (=> d!3687 m!14761))

(assert (=> d!3687 m!14621))

(declare-fun m!14763 () Bool)

(assert (=> b!21194 m!14763))

(assert (=> b!20931 d!3687))

(declare-fun b!21197 () Bool)

(declare-fun e!13825 () Bool)

(declare-fun call!1319 () Bool)

(assert (=> b!21197 (= e!13825 (not call!1319))))

(declare-fun b!21198 () Bool)

(declare-fun e!13822 () Bool)

(declare-fun e!13811 () Bool)

(assert (=> b!21198 (= e!13822 e!13811)))

(declare-fun c!2436 () Bool)

(declare-fun lt!6621 () tuple2!888)

(assert (=> b!21198 (= c!2436 (_1!447 lt!6621))))

(declare-fun bm!1310 () Bool)

(declare-fun call!1321 () Bool)

(declare-fun call!1320 () Bool)

(assert (=> bm!1310 (= call!1321 call!1320)))

(declare-fun bm!1311 () Bool)

(declare-fun call!1336 () SeekEntryResult!51)

(declare-fun call!1329 () SeekEntryResult!51)

(assert (=> bm!1311 (= call!1336 call!1329)))

(declare-fun b!21199 () Bool)

(declare-fun c!2430 () Bool)

(declare-fun lt!6616 () SeekEntryResult!51)

(assert (=> b!21199 (= c!2430 ((_ is MissingVacant!51) lt!6616))))

(declare-fun e!13807 () Bool)

(declare-fun e!13823 () Bool)

(assert (=> b!21199 (= e!13807 e!13823)))

(declare-fun b!21200 () Bool)

(declare-fun lt!6633 () Unit!448)

(declare-fun e!13812 () Unit!448)

(assert (=> b!21200 (= lt!6633 e!13812)))

(declare-fun c!2429 () Bool)

(declare-fun call!1326 () Bool)

(assert (=> b!21200 (= c!2429 call!1326)))

(declare-fun e!13821 () tuple2!888)

(assert (=> b!21200 (= e!13821 (tuple2!889 false (ite c!2362 (_2!447 lt!6409) lt!6408)))))

(declare-fun b!21201 () Bool)

(declare-fun e!13810 () Bool)

(declare-fun lt!6613 () SeekEntryResult!51)

(assert (=> b!21201 (= e!13810 ((_ is Undefined!51) lt!6613))))

(declare-fun b!21202 () Bool)

(declare-fun lt!6617 () Unit!448)

(declare-fun lt!6630 () Unit!448)

(assert (=> b!21202 (= lt!6617 lt!6630)))

(assert (=> b!21202 call!1326))

(declare-fun lt!6624 () SeekEntryResult!51)

(declare-fun lt!6623 () array!1193)

(assert (=> b!21202 (= lt!6630 (lemmaValidKeyInArrayIsInListMap!6 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408)) lt!6623 (mask!4684 (ite c!2362 (_2!447 lt!6409) lt!6408)) (extraKeys!1618 (ite c!2362 (_2!447 lt!6409) lt!6408)) (zeroValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (minValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (index!2325 lt!6624) (defaultEntry!1714 (ite c!2362 (_2!447 lt!6409) lt!6408))))))

(assert (=> b!21202 (= lt!6623 (array!1194 (store (arr!566 (_values!1704 (ite c!2362 (_2!447 lt!6409) lt!6408))) (index!2325 lt!6624) (ValueCellFull!296 (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938))))))) (size!659 (_values!1704 (ite c!2362 (_2!447 lt!6409) lt!6408)))))))

(declare-fun lt!6634 () Unit!448)

(declare-fun lt!6627 () Unit!448)

(assert (=> b!21202 (= lt!6634 lt!6627)))

(declare-fun call!1322 () ListLongMap!553)

(assert (=> b!21202 (= call!1322 (getCurrentListMap!123 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408)) (array!1194 (store (arr!566 (_values!1704 (ite c!2362 (_2!447 lt!6409) lt!6408))) (index!2325 lt!6624) (ValueCellFull!296 (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938))))))) (size!659 (_values!1704 (ite c!2362 (_2!447 lt!6409) lt!6408)))) (mask!4684 (ite c!2362 (_2!447 lt!6409) lt!6408)) (extraKeys!1618 (ite c!2362 (_2!447 lt!6409) lt!6408)) (zeroValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (minValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) #b00000000000000000000000000000000 (defaultEntry!1714 (ite c!2362 (_2!447 lt!6409) lt!6408))))))

(assert (=> b!21202 (= lt!6627 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!6 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408)) (_values!1704 (ite c!2362 (_2!447 lt!6409) lt!6408)) (mask!4684 (ite c!2362 (_2!447 lt!6409) lt!6408)) (extraKeys!1618 (ite c!2362 (_2!447 lt!6409) lt!6408)) (zeroValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (minValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (index!2325 lt!6624) (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938))))) (defaultEntry!1714 (ite c!2362 (_2!447 lt!6409) lt!6408))))))

(declare-fun lt!6610 () Unit!448)

(declare-fun e!13813 () Unit!448)

(assert (=> b!21202 (= lt!6610 e!13813)))

(declare-fun call!1332 () ListLongMap!553)

(declare-fun c!2433 () Bool)

(assert (=> b!21202 (= c!2433 (contains!224 call!1332 (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!13815 () tuple2!888)

(assert (=> b!21202 (= e!13815 (tuple2!889 true (LongMapFixedSize!179 (defaultEntry!1714 (ite c!2362 (_2!447 lt!6409) lt!6408)) (mask!4684 (ite c!2362 (_2!447 lt!6409) lt!6408)) (extraKeys!1618 (ite c!2362 (_2!447 lt!6409) lt!6408)) (zeroValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (minValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (_size!129 (ite c!2362 (_2!447 lt!6409) lt!6408)) (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408)) (array!1194 (store (arr!566 (_values!1704 (ite c!2362 (_2!447 lt!6409) lt!6408))) (index!2325 lt!6624) (ValueCellFull!296 (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938))))))) (size!659 (_values!1704 (ite c!2362 (_2!447 lt!6409) lt!6408)))) (_vacant!129 (ite c!2362 (_2!447 lt!6409) lt!6408)))))))

(declare-fun c!2434 () Bool)

(declare-fun c!2427 () Bool)

(declare-fun bm!1312 () Bool)

(declare-fun call!1325 () ListLongMap!553)

(assert (=> bm!1312 (= call!1322 (+!41 (ite c!2434 call!1325 call!1332) (ite c!2434 (ite c!2427 (tuple2!895 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938)))))) (tuple2!895 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938))))))) (tuple2!895 (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938)))))))))))

(declare-fun b!21203 () Bool)

(declare-fun res!13692 () Bool)

(declare-fun e!13817 () Bool)

(assert (=> b!21203 (=> (not res!13692) (not e!13817))))

(declare-fun call!1318 () Bool)

(assert (=> b!21203 (= res!13692 call!1318)))

(declare-fun e!13814 () Bool)

(assert (=> b!21203 (= e!13814 e!13817)))

(declare-fun b!21204 () Bool)

(declare-fun lt!6614 () Unit!448)

(assert (=> b!21204 (= e!13813 lt!6614)))

(declare-fun call!1327 () Unit!448)

(assert (=> b!21204 (= lt!6614 call!1327)))

(declare-fun lt!6611 () SeekEntryResult!51)

(declare-fun call!1330 () SeekEntryResult!51)

(assert (=> b!21204 (= lt!6611 call!1330)))

(declare-fun res!13697 () Bool)

(assert (=> b!21204 (= res!13697 ((_ is Found!51) lt!6611))))

(declare-fun e!13826 () Bool)

(assert (=> b!21204 (=> (not res!13697) (not e!13826))))

(assert (=> b!21204 e!13826))

(declare-fun b!21205 () Bool)

(declare-fun lt!6629 () Unit!448)

(declare-fun lt!6609 () Unit!448)

(assert (=> b!21205 (= lt!6629 lt!6609)))

(declare-fun call!1331 () ListLongMap!553)

(declare-fun call!1333 () ListLongMap!553)

(assert (=> b!21205 (= call!1331 call!1333)))

(declare-fun lt!6635 () (_ BitVec 32))

(assert (=> b!21205 (= lt!6609 (lemmaChangeZeroKeyThenAddPairToListMap!6 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408)) (_values!1704 (ite c!2362 (_2!447 lt!6409) lt!6408)) (mask!4684 (ite c!2362 (_2!447 lt!6409) lt!6408)) (extraKeys!1618 (ite c!2362 (_2!447 lt!6409) lt!6408)) lt!6635 (zeroValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938))))) (minValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (defaultEntry!1714 (ite c!2362 (_2!447 lt!6409) lt!6408))))))

(assert (=> b!21205 (= lt!6635 (bvor (extraKeys!1618 (ite c!2362 (_2!447 lt!6409) lt!6408)) #b00000000000000000000000000000001))))

(declare-fun e!13816 () tuple2!888)

(assert (=> b!21205 (= e!13816 (tuple2!889 true (LongMapFixedSize!179 (defaultEntry!1714 (ite c!2362 (_2!447 lt!6409) lt!6408)) (mask!4684 (ite c!2362 (_2!447 lt!6409) lt!6408)) (bvor (extraKeys!1618 (ite c!2362 (_2!447 lt!6409) lt!6408)) #b00000000000000000000000000000001) (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938))))) (minValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (_size!129 (ite c!2362 (_2!447 lt!6409) lt!6408)) (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408)) (_values!1704 (ite c!2362 (_2!447 lt!6409) lt!6408)) (_vacant!129 (ite c!2362 (_2!447 lt!6409) lt!6408)))))))

(declare-fun b!21206 () Bool)

(declare-fun res!13698 () Bool)

(assert (=> b!21206 (=> (not res!13698) (not e!13817))))

(assert (=> b!21206 (= res!13698 (= (select (arr!567 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408))) (index!2324 lt!6613)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21207 () Bool)

(declare-fun call!1313 () Bool)

(assert (=> b!21207 (= e!13817 (not call!1313))))

(declare-fun b!21208 () Bool)

(declare-fun e!13809 () Bool)

(assert (=> b!21208 (= e!13811 e!13809)))

(declare-fun call!1324 () ListLongMap!553)

(declare-fun res!13693 () Bool)

(assert (=> b!21208 (= res!13693 (contains!224 call!1324 (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21208 (=> (not res!13693) (not e!13809))))

(declare-fun b!21209 () Bool)

(declare-fun Unit!457 () Unit!448)

(assert (=> b!21209 (= e!13812 Unit!457)))

(declare-fun lt!6622 () Unit!448)

(assert (=> b!21209 (= lt!6622 call!1327)))

(declare-fun lt!6631 () SeekEntryResult!51)

(assert (=> b!21209 (= lt!6631 call!1336)))

(declare-fun res!13695 () Bool)

(assert (=> b!21209 (= res!13695 ((_ is Found!51) lt!6631))))

(declare-fun e!13808 () Bool)

(assert (=> b!21209 (=> (not res!13695) (not e!13808))))

(assert (=> b!21209 e!13808))

(declare-fun lt!6628 () Unit!448)

(assert (=> b!21209 (= lt!6628 lt!6622)))

(assert (=> b!21209 false))

(declare-fun bm!1313 () Bool)

(declare-fun call!1323 () Bool)

(assert (=> bm!1313 (= call!1323 call!1320)))

(declare-fun b!21210 () Bool)

(declare-fun e!13818 () Bool)

(assert (=> b!21210 (= e!13818 (not call!1313))))

(declare-fun b!21211 () Bool)

(declare-fun Unit!458 () Unit!448)

(assert (=> b!21211 (= e!13813 Unit!458)))

(declare-fun lt!6632 () Unit!448)

(declare-fun call!1335 () Unit!448)

(assert (=> b!21211 (= lt!6632 call!1335)))

(assert (=> b!21211 (= lt!6613 call!1330)))

(declare-fun c!2428 () Bool)

(assert (=> b!21211 (= c!2428 ((_ is MissingZero!51) lt!6613))))

(assert (=> b!21211 e!13814))

(declare-fun lt!6619 () Unit!448)

(assert (=> b!21211 (= lt!6619 lt!6632)))

(assert (=> b!21211 false))

(declare-fun b!21212 () Bool)

(declare-fun e!13820 () tuple2!888)

(assert (=> b!21212 (= e!13820 e!13815)))

(declare-fun c!2435 () Bool)

(assert (=> b!21212 (= c!2435 ((_ is MissingZero!51) lt!6624))))

(declare-fun b!21213 () Bool)

(declare-fun c!2437 () Bool)

(assert (=> b!21213 (= c!2437 ((_ is MissingVacant!51) lt!6624))))

(assert (=> b!21213 (= e!13821 e!13820)))

(declare-fun b!21214 () Bool)

(assert (=> b!21214 (= e!13808 (= (select (arr!567 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408))) (index!2325 lt!6631)) (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!1314 () Bool)

(assert (=> bm!1314 (= call!1333 call!1332)))

(declare-fun lt!6615 () (_ BitVec 32))

(declare-fun bm!1315 () Bool)

(assert (=> bm!1315 (= call!1332 (getCurrentListMap!123 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408)) (_values!1704 (ite c!2362 (_2!447 lt!6409) lt!6408)) (mask!4684 (ite c!2362 (_2!447 lt!6409) lt!6408)) (ite c!2434 (ite c!2427 lt!6635 lt!6615) (extraKeys!1618 (ite c!2362 (_2!447 lt!6409) lt!6408))) (ite (and c!2434 c!2427) (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938))))) (zeroValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408))) (ite c!2434 (ite c!2427 (minValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938)))))) (minValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408))) #b00000000000000000000000000000000 (defaultEntry!1714 (ite c!2362 (_2!447 lt!6409) lt!6408))))))

(declare-fun c!2431 () Bool)

(declare-fun bm!1316 () Bool)

(declare-fun c!2438 () Bool)

(assert (=> bm!1316 (= call!1320 (inRange!0 (ite c!2438 (ite c!2429 (index!2325 lt!6631) (ite c!2431 (index!2324 lt!6616) (index!2327 lt!6616))) (ite c!2433 (index!2325 lt!6611) (ite c!2428 (index!2324 lt!6613) (index!2327 lt!6613)))) (mask!4684 (ite c!2362 (_2!447 lt!6409) lt!6408))))))

(declare-fun b!21215 () Bool)

(declare-fun lt!6618 () Unit!448)

(declare-fun lt!6625 () Unit!448)

(assert (=> b!21215 (= lt!6618 lt!6625)))

(assert (=> b!21215 (= call!1331 call!1333)))

(assert (=> b!21215 (= lt!6625 (lemmaChangeLongMinValueKeyThenAddPairToListMap!6 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408)) (_values!1704 (ite c!2362 (_2!447 lt!6409) lt!6408)) (mask!4684 (ite c!2362 (_2!447 lt!6409) lt!6408)) (extraKeys!1618 (ite c!2362 (_2!447 lt!6409) lt!6408)) lt!6615 (zeroValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (minValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938))))) (defaultEntry!1714 (ite c!2362 (_2!447 lt!6409) lt!6408))))))

(assert (=> b!21215 (= lt!6615 (bvor (extraKeys!1618 (ite c!2362 (_2!447 lt!6409) lt!6408)) #b00000000000000000000000000000010))))

(assert (=> b!21215 (= e!13816 (tuple2!889 true (LongMapFixedSize!179 (defaultEntry!1714 (ite c!2362 (_2!447 lt!6409) lt!6408)) (mask!4684 (ite c!2362 (_2!447 lt!6409) lt!6408)) (bvor (extraKeys!1618 (ite c!2362 (_2!447 lt!6409) lt!6408)) #b00000000000000000000000000000010) (zeroValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938))))) (_size!129 (ite c!2362 (_2!447 lt!6409) lt!6408)) (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408)) (_values!1704 (ite c!2362 (_2!447 lt!6409) lt!6408)) (_vacant!129 (ite c!2362 (_2!447 lt!6409) lt!6408)))))))

(declare-fun b!21216 () Bool)

(declare-fun call!1334 () ListLongMap!553)

(assert (=> b!21216 (= e!13811 (= call!1324 call!1334))))

(declare-fun bm!1317 () Bool)

(assert (=> bm!1317 (= call!1318 call!1323)))

(declare-fun b!21217 () Bool)

(declare-fun lt!6626 () tuple2!888)

(declare-fun call!1315 () tuple2!888)

(assert (=> b!21217 (= lt!6626 call!1315)))

(assert (=> b!21217 (= e!13815 (tuple2!889 (_1!447 lt!6626) (_2!447 lt!6626)))))

(declare-fun bm!1318 () Bool)

(assert (=> bm!1318 (= call!1334 (map!392 (ite c!2362 (_2!447 lt!6409) lt!6408)))))

(declare-fun b!21218 () Bool)

(declare-fun res!13699 () Bool)

(assert (=> b!21218 (= res!13699 (= (select (arr!567 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408))) (index!2327 lt!6613)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21218 (=> (not res!13699) (not e!13818))))

(declare-fun bm!1319 () Bool)

(assert (=> bm!1319 (= call!1327 (lemmaInListMapThenSeekEntryOrOpenFindsIt!6 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408)) (_values!1704 (ite c!2362 (_2!447 lt!6409) lt!6408)) (mask!4684 (ite c!2362 (_2!447 lt!6409) lt!6408)) (extraKeys!1618 (ite c!2362 (_2!447 lt!6409) lt!6408)) (zeroValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (minValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1714 (ite c!2362 (_2!447 lt!6409) lt!6408))))))

(declare-fun b!21219 () Bool)

(declare-fun e!13819 () Bool)

(assert (=> b!21219 (= e!13819 (not call!1319))))

(declare-fun bm!1320 () Bool)

(declare-fun call!1316 () Bool)

(assert (=> bm!1320 (= call!1316 (arrayContainsKey!0 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408)) (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun b!21220 () Bool)

(declare-fun e!13824 () tuple2!888)

(assert (=> b!21220 (= e!13824 e!13821)))

(assert (=> b!21220 (= lt!6624 (seekEntryOrOpen!0 (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408)) (mask!4684 (ite c!2362 (_2!447 lt!6409) lt!6408))))))

(assert (=> b!21220 (= c!2438 ((_ is Undefined!51) lt!6624))))

(declare-fun b!21221 () Bool)

(assert (=> b!21221 (= e!13823 ((_ is Undefined!51) lt!6616))))

(declare-fun bm!1321 () Bool)

(declare-fun call!1314 () Bool)

(assert (=> bm!1321 (= call!1314 call!1321)))

(declare-fun b!21222 () Bool)

(declare-fun lt!6620 () tuple2!888)

(assert (=> b!21222 (= e!13820 (tuple2!889 (_1!447 lt!6620) (_2!447 lt!6620)))))

(assert (=> b!21222 (= lt!6620 call!1315)))

(declare-fun bm!1322 () Bool)

(assert (=> bm!1322 (= call!1313 call!1316)))

(declare-fun bm!1323 () Bool)

(assert (=> bm!1323 (= call!1329 (seekEntryOrOpen!0 (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408)) (mask!4684 (ite c!2362 (_2!447 lt!6409) lt!6408))))))

(declare-fun b!21223 () Bool)

(assert (=> b!21223 (= e!13824 e!13816)))

(assert (=> b!21223 (= c!2427 (= (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1325 () Bool)

(assert (=> bm!1325 (= call!1315 (updateHelperNewKey!6 (ite c!2362 (_2!447 lt!6409) lt!6408) (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938))))) (ite c!2437 (index!2327 lt!6624) (index!2324 lt!6624))))))

(declare-fun d!3689 () Bool)

(assert (=> d!3689 e!13822))

(declare-fun res!13694 () Bool)

(assert (=> d!3689 (=> (not res!13694) (not e!13822))))

(assert (=> d!3689 (= res!13694 (valid!99 (_2!447 lt!6621)))))

(assert (=> d!3689 (= lt!6621 e!13824)))

(assert (=> d!3689 (= c!2434 (= (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!3689 (valid!99 (ite c!2362 (_2!447 lt!6409) lt!6408))))

(assert (=> d!3689 (= (update!26 (ite c!2362 (_2!447 lt!6409) lt!6408) (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938)))))) lt!6621)))

(declare-fun bm!1324 () Bool)

(declare-fun call!1328 () ListLongMap!553)

(assert (=> bm!1324 (= call!1326 (contains!224 call!1328 (ite c!2438 (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (select (arr!567 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408))) (index!2325 lt!6624)))))))

(declare-fun b!21224 () Bool)

(declare-fun res!13703 () Bool)

(assert (=> b!21224 (= res!13703 (= (select (arr!567 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408))) (index!2327 lt!6616)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21224 (=> (not res!13703) (not e!13825))))

(declare-fun bm!1326 () Bool)

(declare-fun call!1317 () ListLongMap!553)

(assert (=> bm!1326 (= call!1328 call!1317)))

(declare-fun bm!1327 () Bool)

(assert (=> bm!1327 (= call!1319 call!1316)))

(declare-fun bm!1328 () Bool)

(assert (=> bm!1328 (= call!1331 call!1322)))

(declare-fun b!21225 () Bool)

(declare-fun res!13691 () Bool)

(assert (=> b!21225 (= res!13691 call!1323)))

(assert (=> b!21225 (=> (not res!13691) (not e!13826))))

(declare-fun bm!1329 () Bool)

(assert (=> bm!1329 (= call!1325 call!1317)))

(declare-fun bm!1330 () Bool)

(assert (=> bm!1330 (= call!1317 (getCurrentListMap!123 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408)) (ite (or c!2434 c!2438) (_values!1704 (ite c!2362 (_2!447 lt!6409) lt!6408)) lt!6623) (mask!4684 (ite c!2362 (_2!447 lt!6409) lt!6408)) (extraKeys!1618 (ite c!2362 (_2!447 lt!6409) lt!6408)) (zeroValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (minValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) #b00000000000000000000000000000000 (defaultEntry!1714 (ite c!2362 (_2!447 lt!6409) lt!6408))))))

(declare-fun bm!1331 () Bool)

(assert (=> bm!1331 (= call!1324 (map!392 (_2!447 lt!6621)))))

(declare-fun b!21226 () Bool)

(assert (=> b!21226 (= e!13826 (= (select (arr!567 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408))) (index!2325 lt!6611)) (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!21227 () Bool)

(assert (=> b!21227 (= e!13823 e!13825)))

(declare-fun res!13700 () Bool)

(assert (=> b!21227 (= res!13700 call!1314)))

(assert (=> b!21227 (=> (not res!13700) (not e!13825))))

(declare-fun bm!1332 () Bool)

(assert (=> bm!1332 (= call!1335 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!6 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408)) (_values!1704 (ite c!2362 (_2!447 lt!6409) lt!6408)) (mask!4684 (ite c!2362 (_2!447 lt!6409) lt!6408)) (extraKeys!1618 (ite c!2362 (_2!447 lt!6409) lt!6408)) (zeroValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (minValue!1642 (ite c!2362 (_2!447 lt!6409) lt!6408)) (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1714 (ite c!2362 (_2!447 lt!6409) lt!6408))))))

(declare-fun b!21228 () Bool)

(declare-fun res!13690 () Bool)

(assert (=> b!21228 (= res!13690 call!1321)))

(assert (=> b!21228 (=> (not res!13690) (not e!13808))))

(declare-fun b!21229 () Bool)

(declare-fun c!2432 () Bool)

(assert (=> b!21229 (= c!2432 ((_ is MissingVacant!51) lt!6613))))

(assert (=> b!21229 (= e!13814 e!13810)))

(declare-fun bm!1333 () Bool)

(assert (=> bm!1333 (= call!1330 call!1329)))

(declare-fun b!21230 () Bool)

(declare-fun lt!6612 () Unit!448)

(assert (=> b!21230 (= e!13812 lt!6612)))

(assert (=> b!21230 (= lt!6612 call!1335)))

(assert (=> b!21230 (= lt!6616 call!1336)))

(assert (=> b!21230 (= c!2431 ((_ is MissingZero!51) lt!6616))))

(assert (=> b!21230 e!13807))

(declare-fun b!21231 () Bool)

(declare-fun res!13702 () Bool)

(assert (=> b!21231 (=> (not res!13702) (not e!13819))))

(assert (=> b!21231 (= res!13702 (= (select (arr!567 (_keys!3136 (ite c!2362 (_2!447 lt!6409) lt!6408))) (index!2324 lt!6616)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21232 () Bool)

(assert (=> b!21232 (= e!13810 e!13818)))

(declare-fun res!13696 () Bool)

(assert (=> b!21232 (= res!13696 call!1318)))

(assert (=> b!21232 (=> (not res!13696) (not e!13818))))

(declare-fun b!21233 () Bool)

(declare-fun res!13701 () Bool)

(assert (=> b!21233 (=> (not res!13701) (not e!13819))))

(assert (=> b!21233 (= res!13701 call!1314)))

(assert (=> b!21233 (= e!13807 e!13819)))

(declare-fun b!21234 () Bool)

(assert (=> b!21234 (= e!13809 (= call!1324 (+!41 call!1334 (tuple2!895 (ite c!2362 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2361 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2362 (minValue!1642 (v!1563 (underlying!100 thiss!938))) (ite c!2361 (zeroValue!1642 (v!1563 (underlying!100 thiss!938))) (minValue!1642 (v!1563 (underlying!100 thiss!938)))))))))))

(assert (= (and d!3689 c!2434) b!21223))

(assert (= (and d!3689 (not c!2434)) b!21220))

(assert (= (and b!21223 c!2427) b!21205))

(assert (= (and b!21223 (not c!2427)) b!21215))

(assert (= (or b!21205 b!21215) bm!1314))

(assert (= (or b!21205 b!21215) bm!1329))

(assert (= (or b!21205 b!21215) bm!1328))

(assert (= (and b!21220 c!2438) b!21200))

(assert (= (and b!21220 (not c!2438)) b!21213))

(assert (= (and b!21200 c!2429) b!21209))

(assert (= (and b!21200 (not c!2429)) b!21230))

(assert (= (and b!21209 res!13695) b!21228))

(assert (= (and b!21228 res!13690) b!21214))

(assert (= (and b!21230 c!2431) b!21233))

(assert (= (and b!21230 (not c!2431)) b!21199))

(assert (= (and b!21233 res!13701) b!21231))

(assert (= (and b!21231 res!13702) b!21219))

(assert (= (and b!21199 c!2430) b!21227))

(assert (= (and b!21199 (not c!2430)) b!21221))

(assert (= (and b!21227 res!13700) b!21224))

(assert (= (and b!21224 res!13703) b!21197))

(assert (= (or b!21233 b!21227) bm!1321))

(assert (= (or b!21219 b!21197) bm!1327))

(assert (= (or b!21228 bm!1321) bm!1310))

(assert (= (or b!21209 b!21230) bm!1311))

(assert (= (and b!21213 c!2437) b!21222))

(assert (= (and b!21213 (not c!2437)) b!21212))

(assert (= (and b!21212 c!2435) b!21217))

(assert (= (and b!21212 (not c!2435)) b!21202))

(assert (= (and b!21202 c!2433) b!21204))

(assert (= (and b!21202 (not c!2433)) b!21211))

(assert (= (and b!21204 res!13697) b!21225))

(assert (= (and b!21225 res!13691) b!21226))

(assert (= (and b!21211 c!2428) b!21203))

(assert (= (and b!21211 (not c!2428)) b!21229))

(assert (= (and b!21203 res!13692) b!21206))

(assert (= (and b!21206 res!13698) b!21207))

(assert (= (and b!21229 c!2432) b!21232))

(assert (= (and b!21229 (not c!2432)) b!21201))

(assert (= (and b!21232 res!13696) b!21218))

(assert (= (and b!21218 res!13699) b!21210))

(assert (= (or b!21203 b!21232) bm!1317))

(assert (= (or b!21207 b!21210) bm!1322))

(assert (= (or b!21225 bm!1317) bm!1313))

(assert (= (or b!21204 b!21211) bm!1333))

(assert (= (or b!21222 b!21217) bm!1325))

(assert (= (or bm!1310 bm!1313) bm!1316))

(assert (= (or b!21200 b!21202) bm!1326))

(assert (= (or bm!1327 bm!1322) bm!1320))

(assert (= (or b!21209 b!21204) bm!1319))

(assert (= (or bm!1311 bm!1333) bm!1323))

(assert (= (or b!21230 b!21211) bm!1332))

(assert (= (or b!21200 b!21202) bm!1324))

(assert (= (or bm!1329 bm!1326) bm!1330))

(assert (= (or bm!1314 b!21202) bm!1315))

(assert (= (or bm!1328 b!21202) bm!1312))

(assert (= (and d!3689 res!13694) b!21198))

(assert (= (and b!21198 c!2436) b!21208))

(assert (= (and b!21198 (not c!2436)) b!21216))

(assert (= (and b!21208 res!13693) b!21234))

(assert (= (or b!21234 b!21216) bm!1318))

(assert (= (or b!21208 b!21234 b!21216) bm!1331))

(declare-fun m!14765 () Bool)

(assert (=> bm!1323 m!14765))

(declare-fun m!14767 () Bool)

(assert (=> b!21218 m!14767))

(declare-fun m!14769 () Bool)

(assert (=> bm!1331 m!14769))

(declare-fun m!14771 () Bool)

(assert (=> b!21208 m!14771))

(declare-fun m!14773 () Bool)

(assert (=> b!21231 m!14773))

(declare-fun m!14775 () Bool)

(assert (=> bm!1318 m!14775))

(declare-fun m!14777 () Bool)

(assert (=> bm!1324 m!14777))

(declare-fun m!14779 () Bool)

(assert (=> bm!1324 m!14779))

(declare-fun m!14781 () Bool)

(assert (=> bm!1316 m!14781))

(declare-fun m!14783 () Bool)

(assert (=> bm!1325 m!14783))

(declare-fun m!14785 () Bool)

(assert (=> bm!1319 m!14785))

(declare-fun m!14787 () Bool)

(assert (=> bm!1312 m!14787))

(declare-fun m!14789 () Bool)

(assert (=> bm!1315 m!14789))

(declare-fun m!14791 () Bool)

(assert (=> bm!1320 m!14791))

(declare-fun m!14793 () Bool)

(assert (=> b!21215 m!14793))

(declare-fun m!14795 () Bool)

(assert (=> b!21226 m!14795))

(declare-fun m!14797 () Bool)

(assert (=> b!21206 m!14797))

(declare-fun m!14799 () Bool)

(assert (=> b!21234 m!14799))

(declare-fun m!14801 () Bool)

(assert (=> b!21214 m!14801))

(declare-fun m!14803 () Bool)

(assert (=> d!3689 m!14803))

(declare-fun m!14805 () Bool)

(assert (=> d!3689 m!14805))

(declare-fun m!14807 () Bool)

(assert (=> b!21202 m!14807))

(declare-fun m!14809 () Bool)

(assert (=> b!21202 m!14809))

(declare-fun m!14811 () Bool)

(assert (=> b!21202 m!14811))

(declare-fun m!14813 () Bool)

(assert (=> b!21202 m!14813))

(declare-fun m!14815 () Bool)

(assert (=> b!21202 m!14815))

(declare-fun m!14817 () Bool)

(assert (=> b!21224 m!14817))

(declare-fun m!14819 () Bool)

(assert (=> bm!1330 m!14819))

(declare-fun m!14821 () Bool)

(assert (=> bm!1332 m!14821))

(declare-fun m!14823 () Bool)

(assert (=> b!21205 m!14823))

(assert (=> b!21220 m!14765))

(assert (=> bm!1225 d!3689))

(declare-fun d!3691 () Bool)

(assert (=> d!3691 (= (valid!98 thiss!938) (valid!99 (v!1563 (underlying!100 thiss!938))))))

(declare-fun bs!903 () Bool)

(assert (= bs!903 d!3691))

(declare-fun m!14825 () Bool)

(assert (=> bs!903 m!14825))

(assert (=> start!3330 d!3691))

(declare-fun d!3693 () Bool)

(assert (=> d!3693 (= (array_inv!401 (_keys!3136 (v!1563 (underlying!100 thiss!938)))) (bvsge (size!660 (_keys!3136 (v!1563 (underlying!100 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20929 d!3693))

(declare-fun d!3695 () Bool)

(assert (=> d!3695 (= (array_inv!402 (_values!1704 (v!1563 (underlying!100 thiss!938)))) (bvsge (size!659 (_values!1704 (v!1563 (underlying!100 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20929 d!3695))

(declare-fun b!21242 () Bool)

(declare-fun e!13831 () Bool)

(assert (=> b!21242 (= e!13831 tp_is_empty!991)))

(declare-fun mapIsEmpty!973 () Bool)

(declare-fun mapRes!973 () Bool)

(assert (=> mapIsEmpty!973 mapRes!973))

(declare-fun condMapEmpty!973 () Bool)

(declare-fun mapDefault!973 () ValueCell!296)

(assert (=> mapNonEmpty!964 (= condMapEmpty!973 (= mapRest!964 ((as const (Array (_ BitVec 32) ValueCell!296)) mapDefault!973)))))

(assert (=> mapNonEmpty!964 (= tp!3415 (and e!13831 mapRes!973))))

(declare-fun mapNonEmpty!973 () Bool)

(declare-fun tp!3430 () Bool)

(declare-fun e!13832 () Bool)

(assert (=> mapNonEmpty!973 (= mapRes!973 (and tp!3430 e!13832))))

(declare-fun mapKey!973 () (_ BitVec 32))

(declare-fun mapRest!973 () (Array (_ BitVec 32) ValueCell!296))

(declare-fun mapValue!973 () ValueCell!296)

(assert (=> mapNonEmpty!973 (= mapRest!964 (store mapRest!973 mapKey!973 mapValue!973))))

(declare-fun b!21241 () Bool)

(assert (=> b!21241 (= e!13832 tp_is_empty!991)))

(assert (= (and mapNonEmpty!964 condMapEmpty!973) mapIsEmpty!973))

(assert (= (and mapNonEmpty!964 (not condMapEmpty!973)) mapNonEmpty!973))

(assert (= (and mapNonEmpty!973 ((_ is ValueCellFull!296) mapValue!973)) b!21241))

(assert (= (and mapNonEmpty!964 ((_ is ValueCellFull!296) mapDefault!973)) b!21242))

(declare-fun m!14827 () Bool)

(assert (=> mapNonEmpty!973 m!14827))

(declare-fun b_lambda!1505 () Bool)

(assert (= b_lambda!1503 (or (and b!20929 b_free!727) b_lambda!1505)))

(declare-fun b_lambda!1507 () Bool)

(assert (= b_lambda!1501 (or (and b!20929 b_free!727) b_lambda!1507)))

(check-sat (not b!21051) (not b_next!727) (not d!3685) (not b!21208) (not bm!1324) (not d!3689) (not b!21215) (not bm!1294) b_and!1413 (not bm!1312) (not bm!1316) (not d!3679) (not bm!1331) (not bm!1299) (not b!21138) (not bm!1288) (not bm!1295) (not mapNonEmpty!973) (not b!21185) (not bm!1306) (not b!21194) (not b_lambda!1507) (not d!3681) (not b!21167) (not bm!1292) (not b!21220) (not bm!1301) (not bm!1318) (not b!21148) (not bm!1308) (not b_lambda!1505) (not bm!1307) (not b!21052) (not d!3691) (not bm!1319) (not b!21234) (not b!21182) (not b!21053) (not b!21135) (not bm!1320) (not bm!1315) tp_is_empty!991 (not b!21183) (not b!21205) (not bm!1325) (not bm!1330) (not b!21153) (not bm!1291) (not b!21202) (not bm!1323) (not bm!1332) (not bm!1296) (not b!21141) (not bm!1300) (not d!3687))
(check-sat b_and!1413 (not b_next!727))
