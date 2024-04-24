; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3336 () Bool)

(assert start!3336)

(declare-fun b!20940 () Bool)

(declare-fun b_free!727 () Bool)

(declare-fun b_next!727 () Bool)

(assert (=> b!20940 (= b_free!727 (not b_next!727))))

(declare-fun tp!3414 () Bool)

(declare-fun b_and!1405 () Bool)

(assert (=> b!20940 (= tp!3414 b_and!1405)))

(declare-fun mapIsEmpty!964 () Bool)

(declare-fun mapRes!964 () Bool)

(assert (=> mapIsEmpty!964 mapRes!964))

(declare-fun mapNonEmpty!964 () Bool)

(declare-fun tp!3415 () Bool)

(declare-fun e!13656 () Bool)

(assert (=> mapNonEmpty!964 (= mapRes!964 (and tp!3415 e!13656))))

(declare-datatypes ((V!1147 0))(
  ( (V!1148 (val!522 Int)) )
))
(declare-datatypes ((ValueCell!296 0))(
  ( (ValueCellFull!296 (v!1563 V!1147)) (EmptyCell!296) )
))
(declare-fun mapRest!964 () (Array (_ BitVec 32) ValueCell!296))

(declare-fun mapKey!964 () (_ BitVec 32))

(declare-fun mapValue!964 () ValueCell!296)

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
  ( (Cell!179 (v!1564 LongMapFixedSize!178)) )
))
(declare-datatypes ((LongMap!178 0))(
  ( (LongMap!179 (underlying!100 Cell!178)) )
))
(declare-fun thiss!938 () LongMap!178)

(assert (=> mapNonEmpty!964 (= (arr!566 (_values!1704 (v!1564 (underlying!100 thiss!938)))) (store mapRest!964 mapKey!964 mapValue!964))))

(declare-fun b!20934 () Bool)

(declare-datatypes ((tuple2!892 0))(
  ( (tuple2!893 (_1!449 Bool) (_2!449 Cell!178)) )
))
(declare-fun e!13658 () tuple2!892)

(declare-fun e!13660 () tuple2!892)

(assert (=> b!20934 (= e!13658 e!13660)))

(declare-fun c!2362 () Bool)

(declare-fun lt!6413 () Bool)

(assert (=> b!20934 (= c!2362 (and (not lt!6413) (= (bvand (extraKeys!1618 (v!1564 (underlying!100 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!20935 () Bool)

(declare-fun res!13607 () Bool)

(declare-fun e!13665 () Bool)

(assert (=> b!20935 (=> (not res!13607) (not e!13665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!20935 (= res!13607 (validMask!0 (mask!4684 (v!1564 (underlying!100 thiss!938)))))))

(declare-fun b!20936 () Bool)

(declare-fun e!13659 () Bool)

(declare-fun e!13654 () Bool)

(assert (=> b!20936 (= e!13659 e!13654)))

(declare-fun b!20937 () Bool)

(declare-fun tp_is_empty!991 () Bool)

(assert (=> b!20937 (= e!13656 tp_is_empty!991)))

(declare-fun bm!1224 () Bool)

(declare-datatypes ((tuple2!894 0))(
  ( (tuple2!895 (_1!450 Bool) (_2!450 LongMapFixedSize!178)) )
))
(declare-fun call!1227 () tuple2!894)

(declare-fun call!1228 () tuple2!894)

(assert (=> bm!1224 (= call!1227 call!1228)))

(declare-fun b!20939 () Bool)

(declare-fun c!2361 () Bool)

(assert (=> b!20939 (= c!2361 (and (not (= (bvand (extraKeys!1618 (v!1564 (underlying!100 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!6413))))

(declare-fun e!13663 () tuple2!892)

(assert (=> b!20939 (= e!13660 e!13663)))

(declare-fun e!13664 () Bool)

(declare-fun e!13661 () Bool)

(declare-fun array_inv!405 (array!1195) Bool)

(declare-fun array_inv!406 (array!1193) Bool)

(assert (=> b!20940 (= e!13664 (and tp!3414 tp_is_empty!991 (array_inv!405 (_keys!3136 (v!1564 (underlying!100 thiss!938)))) (array_inv!406 (_values!1704 (v!1564 (underlying!100 thiss!938)))) e!13661))))

(declare-fun b!20941 () Bool)

(declare-fun e!13657 () Bool)

(assert (=> b!20941 (= e!13661 (and e!13657 mapRes!964))))

(declare-fun condMapEmpty!964 () Bool)

(declare-fun mapDefault!964 () ValueCell!296)

(assert (=> b!20941 (= condMapEmpty!964 (= (arr!566 (_values!1704 (v!1564 (underlying!100 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!296)) mapDefault!964)))))

(declare-fun b!20942 () Bool)

(declare-fun res!13608 () Bool)

(assert (=> b!20942 (=> (not res!13608) (not e!13665))))

(declare-fun lt!6408 () tuple2!892)

(declare-fun valid!105 (LongMapFixedSize!178) Bool)

(assert (=> b!20942 (= res!13608 (valid!105 (v!1564 (_2!449 lt!6408))))))

(declare-fun bm!1225 () Bool)

(declare-fun c!2360 () Bool)

(declare-fun lt!6414 () LongMapFixedSize!178)

(declare-fun update!28 (LongMapFixedSize!178 (_ BitVec 64) V!1147) tuple2!894)

(assert (=> bm!1225 (= call!1228 (update!28 lt!6414 (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938))))))))

(declare-fun b!20943 () Bool)

(declare-fun lt!6410 () tuple2!894)

(assert (=> b!20943 (= lt!6410 call!1227)))

(assert (=> b!20943 (= e!13660 (tuple2!893 (_1!450 lt!6410) (Cell!179 (_2!450 lt!6410))))))

(declare-fun b!20944 () Bool)

(declare-fun lt!6412 () tuple2!894)

(assert (=> b!20944 (= e!13663 (tuple2!893 (_1!450 lt!6412) (Cell!179 (_2!450 lt!6412))))))

(assert (=> b!20944 (= lt!6412 call!1227)))

(declare-fun b!20945 () Bool)

(declare-fun res!13605 () Bool)

(assert (=> b!20945 (=> (not res!13605) (not e!13665))))

(assert (=> b!20945 (= res!13605 (and (= (size!660 (_keys!3136 (v!1564 (underlying!100 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4684 (v!1564 (underlying!100 thiss!938))))) (bvsge (bvsub (size!660 (_keys!3136 (v!1564 (underlying!100 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (size!660 (_keys!3136 (v!1564 (underlying!100 thiss!938)))) #b00000000000000000000000000000001) (size!660 (_keys!3136 (v!1564 (underlying!100 thiss!938)))))))))

(declare-fun b!20946 () Bool)

(assert (=> b!20946 (= e!13663 (tuple2!893 true (Cell!179 lt!6414)))))

(declare-fun b!20947 () Bool)

(assert (=> b!20947 (= e!13665 (bvslt (bvadd #b00000000000000000000000000000001 (mask!4684 (v!1564 (_2!449 lt!6408)))) (_size!129 (v!1564 (underlying!100 thiss!938)))))))

(declare-fun b!20948 () Bool)

(declare-fun e!13662 () Bool)

(assert (=> b!20948 (= e!13662 e!13665)))

(declare-fun res!13606 () Bool)

(assert (=> b!20948 (=> (not res!13606) (not e!13665))))

(assert (=> b!20948 (= res!13606 (_1!449 lt!6408))))

(assert (=> b!20948 (= lt!6408 e!13658)))

(assert (=> b!20948 (= c!2360 (and (not lt!6413) (not (= (bvand (extraKeys!1618 (v!1564 (underlying!100 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!20948 (= lt!6413 (= (bvand (extraKeys!1618 (v!1564 (underlying!100 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!28 ((_ BitVec 32) Int) LongMapFixedSize!178)

(declare-fun computeNewMask!23 (LongMap!178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20948 (= lt!6414 (getNewLongMapFixedSize!28 (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))) (defaultEntry!1714 (v!1564 (underlying!100 thiss!938)))))))

(declare-fun b!20949 () Bool)

(assert (=> b!20949 (= e!13654 e!13664)))

(declare-fun b!20950 () Bool)

(assert (=> b!20950 (= e!13657 tp_is_empty!991)))

(declare-fun res!13609 () Bool)

(assert (=> start!3336 (=> (not res!13609) (not e!13662))))

(declare-fun valid!106 (LongMap!178) Bool)

(assert (=> start!3336 (= res!13609 (valid!106 thiss!938))))

(assert (=> start!3336 e!13662))

(assert (=> start!3336 e!13659))

(declare-fun b!20938 () Bool)

(declare-fun lt!6409 () tuple2!894)

(declare-fun lt!6411 () tuple2!894)

(assert (=> b!20938 (= e!13658 (tuple2!893 (and (_1!450 lt!6409) (_1!450 lt!6411)) (Cell!179 (_2!450 lt!6411))))))

(assert (=> b!20938 (= lt!6409 call!1228)))

(assert (=> b!20938 (= lt!6411 (update!28 (_2!450 lt!6409) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1642 (v!1564 (underlying!100 thiss!938)))))))

(assert (= (and start!3336 res!13609) b!20948))

(assert (= (and b!20948 c!2360) b!20938))

(assert (= (and b!20948 (not c!2360)) b!20934))

(assert (= (and b!20934 c!2362) b!20943))

(assert (= (and b!20934 (not c!2362)) b!20939))

(assert (= (and b!20939 c!2361) b!20944))

(assert (= (and b!20939 (not c!2361)) b!20946))

(assert (= (or b!20943 b!20944) bm!1224))

(assert (= (or b!20938 bm!1224) bm!1225))

(assert (= (and b!20948 res!13606) b!20935))

(assert (= (and b!20935 res!13607) b!20945))

(assert (= (and b!20945 res!13605) b!20942))

(assert (= (and b!20942 res!13608) b!20947))

(assert (= (and b!20941 condMapEmpty!964) mapIsEmpty!964))

(assert (= (and b!20941 (not condMapEmpty!964)) mapNonEmpty!964))

(get-info :version)

(assert (= (and mapNonEmpty!964 ((_ is ValueCellFull!296) mapValue!964)) b!20937))

(assert (= (and b!20941 ((_ is ValueCellFull!296) mapDefault!964)) b!20950))

(assert (= b!20940 b!20941))

(assert (= b!20949 b!20940))

(assert (= b!20936 b!20949))

(assert (= start!3336 b!20936))

(declare-fun m!14617 () Bool)

(assert (=> b!20948 m!14617))

(assert (=> b!20948 m!14617))

(declare-fun m!14619 () Bool)

(assert (=> b!20948 m!14619))

(declare-fun m!14621 () Bool)

(assert (=> b!20935 m!14621))

(declare-fun m!14623 () Bool)

(assert (=> mapNonEmpty!964 m!14623))

(declare-fun m!14625 () Bool)

(assert (=> b!20938 m!14625))

(declare-fun m!14627 () Bool)

(assert (=> b!20942 m!14627))

(declare-fun m!14629 () Bool)

(assert (=> b!20940 m!14629))

(declare-fun m!14631 () Bool)

(assert (=> b!20940 m!14631))

(declare-fun m!14633 () Bool)

(assert (=> bm!1225 m!14633))

(declare-fun m!14635 () Bool)

(assert (=> start!3336 m!14635))

(check-sat (not start!3336) (not b!20940) b_and!1405 (not bm!1225) (not b!20935) (not b!20942) (not b!20938) tp_is_empty!991 (not mapNonEmpty!964) (not b!20948) (not b_next!727))
(check-sat b_and!1405 (not b_next!727))
(get-model)

(declare-fun d!3685 () Bool)

(declare-fun res!13646 () Bool)

(declare-fun e!13740 () Bool)

(assert (=> d!3685 (=> (not res!13646) (not e!13740))))

(declare-fun simpleValid!18 (LongMapFixedSize!178) Bool)

(assert (=> d!3685 (= res!13646 (simpleValid!18 (v!1564 (_2!449 lt!6408))))))

(assert (=> d!3685 (= (valid!105 (v!1564 (_2!449 lt!6408))) e!13740)))

(declare-fun b!21059 () Bool)

(declare-fun res!13647 () Bool)

(assert (=> b!21059 (=> (not res!13647) (not e!13740))))

(declare-fun arrayCountValidKeys!0 (array!1195 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!21059 (= res!13647 (= (arrayCountValidKeys!0 (_keys!3136 (v!1564 (_2!449 lt!6408))) #b00000000000000000000000000000000 (size!660 (_keys!3136 (v!1564 (_2!449 lt!6408))))) (_size!129 (v!1564 (_2!449 lt!6408)))))))

(declare-fun b!21060 () Bool)

(declare-fun res!13648 () Bool)

(assert (=> b!21060 (=> (not res!13648) (not e!13740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1195 (_ BitVec 32)) Bool)

(assert (=> b!21060 (= res!13648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3136 (v!1564 (_2!449 lt!6408))) (mask!4684 (v!1564 (_2!449 lt!6408)))))))

(declare-fun b!21061 () Bool)

(declare-datatypes ((List!556 0))(
  ( (Nil!553) (Cons!552 (h!1118 (_ BitVec 64)) (t!3207 List!556)) )
))
(declare-fun arrayNoDuplicates!0 (array!1195 (_ BitVec 32) List!556) Bool)

(assert (=> b!21061 (= e!13740 (arrayNoDuplicates!0 (_keys!3136 (v!1564 (_2!449 lt!6408))) #b00000000000000000000000000000000 Nil!553))))

(assert (= (and d!3685 res!13646) b!21059))

(assert (= (and b!21059 res!13647) b!21060))

(assert (= (and b!21060 res!13648) b!21061))

(declare-fun m!14677 () Bool)

(assert (=> d!3685 m!14677))

(declare-fun m!14679 () Bool)

(assert (=> b!21059 m!14679))

(declare-fun m!14681 () Bool)

(assert (=> b!21060 m!14681))

(declare-fun m!14683 () Bool)

(assert (=> b!21061 m!14683))

(assert (=> b!20942 d!3685))

(declare-fun d!3687 () Bool)

(assert (=> d!3687 (= (array_inv!405 (_keys!3136 (v!1564 (underlying!100 thiss!938)))) (bvsge (size!660 (_keys!3136 (v!1564 (underlying!100 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20940 d!3687))

(declare-fun d!3689 () Bool)

(assert (=> d!3689 (= (array_inv!406 (_values!1704 (v!1564 (underlying!100 thiss!938)))) (bvsge (size!659 (_values!1704 (v!1564 (underlying!100 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20940 d!3689))

(declare-fun d!3691 () Bool)

(assert (=> d!3691 (= (validMask!0 (mask!4684 (v!1564 (underlying!100 thiss!938)))) (and (or (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000000000000000000111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000000000000000001111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000000000000000011111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000000000000000111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000000000000001111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000000000000011111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000000000000111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000000000001111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000000000011111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000000000111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000000001111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000000011111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000000111111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000001111111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000011111111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000111111111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000001111111111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000011111111111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000111111111111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000001111111111111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000011111111111111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000111111111111111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000001111111111111111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000011111111111111111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000111111111111111111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00001111111111111111111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00011111111111111111111111111111) (= (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!20935 d!3691))

(declare-fun d!3693 () Bool)

(assert (=> d!3693 (= (valid!106 thiss!938) (valid!105 (v!1564 (underlying!100 thiss!938))))))

(declare-fun bs!903 () Bool)

(assert (= bs!903 d!3693))

(declare-fun m!14685 () Bool)

(assert (=> bs!903 m!14685))

(assert (=> start!3336 d!3693))

(declare-fun d!3695 () Bool)

(declare-fun e!13749 () Bool)

(assert (=> d!3695 e!13749))

(declare-fun res!13653 () Bool)

(assert (=> d!3695 (=> (not res!13653) (not e!13749))))

(declare-fun lt!6503 () LongMapFixedSize!178)

(assert (=> d!3695 (= res!13653 (valid!105 lt!6503))))

(declare-fun lt!6509 () LongMapFixedSize!178)

(assert (=> d!3695 (= lt!6503 lt!6509)))

(declare-datatypes ((Unit!451 0))(
  ( (Unit!452) )
))
(declare-fun lt!6523 () Unit!451)

(declare-fun e!13747 () Unit!451)

(assert (=> d!3695 (= lt!6523 e!13747)))

(declare-fun c!2385 () Bool)

(declare-datatypes ((tuple2!904 0))(
  ( (tuple2!905 (_1!455 (_ BitVec 64)) (_2!455 V!1147)) )
))
(declare-datatypes ((List!557 0))(
  ( (Nil!554) (Cons!553 (h!1119 tuple2!904) (t!3208 List!557)) )
))
(declare-datatypes ((ListLongMap!555 0))(
  ( (ListLongMap!556 (toList!293 List!557)) )
))
(declare-fun map!394 (LongMapFixedSize!178) ListLongMap!555)

(assert (=> d!3695 (= c!2385 (not (= (map!394 lt!6509) (ListLongMap!556 Nil!554))))))

(declare-fun lt!6521 () Unit!451)

(declare-fun lt!6504 () Unit!451)

(assert (=> d!3695 (= lt!6521 lt!6504)))

(declare-fun lt!6525 () array!1195)

(declare-fun lt!6508 () (_ BitVec 32))

(declare-fun lt!6505 () List!556)

(assert (=> d!3695 (arrayNoDuplicates!0 lt!6525 lt!6508 lt!6505)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1195 (_ BitVec 32) (_ BitVec 32) List!556) Unit!451)

(assert (=> d!3695 (= lt!6504 (lemmaArrayNoDuplicatesInAll0Array!0 lt!6525 lt!6508 (bvadd (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))) #b00000000000000000000000000000001) lt!6505))))

(assert (=> d!3695 (= lt!6505 Nil!553)))

(assert (=> d!3695 (= lt!6508 #b00000000000000000000000000000000)))

(assert (=> d!3695 (= lt!6525 (array!1196 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6510 () Unit!451)

(declare-fun lt!6517 () Unit!451)

(assert (=> d!3695 (= lt!6510 lt!6517)))

(declare-fun lt!6513 () (_ BitVec 32))

(declare-fun lt!6511 () array!1195)

(assert (=> d!3695 (arrayForallSeekEntryOrOpenFound!0 lt!6513 lt!6511 (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1195 (_ BitVec 32) (_ BitVec 32)) Unit!451)

(assert (=> d!3695 (= lt!6517 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!6511 (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))) lt!6513))))

(assert (=> d!3695 (= lt!6513 #b00000000000000000000000000000000)))

(assert (=> d!3695 (= lt!6511 (array!1196 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6515 () Unit!451)

(declare-fun lt!6507 () Unit!451)

(assert (=> d!3695 (= lt!6515 lt!6507)))

(declare-fun lt!6519 () array!1195)

(declare-fun lt!6520 () (_ BitVec 32))

(declare-fun lt!6512 () (_ BitVec 32))

(assert (=> d!3695 (= (arrayCountValidKeys!0 lt!6519 lt!6520 lt!6512) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1195 (_ BitVec 32) (_ BitVec 32)) Unit!451)

(assert (=> d!3695 (= lt!6507 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!6519 lt!6520 lt!6512))))

(assert (=> d!3695 (= lt!6512 (bvadd (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3695 (= lt!6520 #b00000000000000000000000000000000)))

(assert (=> d!3695 (= lt!6519 (array!1196 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!136 (Int (_ BitVec 64)) V!1147)

(assert (=> d!3695 (= lt!6509 (LongMapFixedSize!179 (defaultEntry!1714 (v!1564 (underlying!100 thiss!938))) (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!136 (defaultEntry!1714 (v!1564 (underlying!100 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!136 (defaultEntry!1714 (v!1564 (underlying!100 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1196 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))) #b00000000000000000000000000000001)) (array!1194 ((as const (Array (_ BitVec 32) ValueCell!296)) EmptyCell!296) (bvadd (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3695 (validMask!0 (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))))))

(assert (=> d!3695 (= (getNewLongMapFixedSize!28 (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))) (defaultEntry!1714 (v!1564 (underlying!100 thiss!938)))) lt!6503)))

(declare-fun b!21074 () Bool)

(declare-fun res!13654 () Bool)

(assert (=> b!21074 (=> (not res!13654) (not e!13749))))

(assert (=> b!21074 (= res!13654 (= (mask!4684 lt!6503) (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938))))))))

(declare-fun b!21075 () Bool)

(declare-fun Unit!453 () Unit!451)

(assert (=> b!21075 (= e!13747 Unit!453)))

(declare-fun b!21076 () Bool)

(declare-fun e!13748 () Bool)

(declare-fun lt!6524 () tuple2!904)

(declare-fun lt!6522 () (_ BitVec 32))

(assert (=> b!21076 (= e!13748 (ite (= (_1!455 lt!6524) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!6522 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!6522 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!21077 () Bool)

(declare-fun Unit!454 () Unit!451)

(assert (=> b!21077 (= e!13747 Unit!454)))

(declare-fun head!824 (List!557) tuple2!904)

(assert (=> b!21077 (= lt!6524 (head!824 (toList!293 (map!394 lt!6509))))))

(declare-fun lt!6514 () array!1195)

(assert (=> b!21077 (= lt!6514 (array!1196 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!21077 (= lt!6522 #b00000000000000000000000000000000)))

(declare-fun lt!6518 () Unit!451)

(declare-fun lemmaKeyInListMapIsInArray!93 (array!1195 array!1193 (_ BitVec 32) (_ BitVec 32) V!1147 V!1147 (_ BitVec 64) Int) Unit!451)

(assert (=> b!21077 (= lt!6518 (lemmaKeyInListMapIsInArray!93 lt!6514 (array!1194 ((as const (Array (_ BitVec 32) ValueCell!296)) EmptyCell!296) (bvadd (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))) lt!6522 (dynLambda!136 (defaultEntry!1714 (v!1564 (underlying!100 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!136 (defaultEntry!1714 (v!1564 (underlying!100 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!455 lt!6524) (defaultEntry!1714 (v!1564 (underlying!100 thiss!938)))))))

(declare-fun c!2386 () Bool)

(assert (=> b!21077 (= c!2386 (and (not (= (_1!455 lt!6524) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!455 lt!6524) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!21077 e!13748))

(declare-fun lt!6506 () Unit!451)

(assert (=> b!21077 (= lt!6506 lt!6518)))

(declare-fun lt!6516 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1195 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!21077 (= lt!6516 (arrayScanForKey!0 (array!1196 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))) #b00000000000000000000000000000001)) (_1!455 lt!6524) #b00000000000000000000000000000000))))

(assert (=> b!21077 false))

(declare-fun b!21078 () Bool)

(declare-fun arrayContainsKey!0 (array!1195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!21078 (= e!13748 (arrayContainsKey!0 lt!6514 (_1!455 lt!6524) #b00000000000000000000000000000000))))

(declare-fun b!21079 () Bool)

(assert (=> b!21079 (= e!13749 (= (map!394 lt!6503) (ListLongMap!556 Nil!554)))))

(assert (= (and d!3695 c!2385) b!21077))

(assert (= (and d!3695 (not c!2385)) b!21075))

(assert (= (and b!21077 c!2386) b!21078))

(assert (= (and b!21077 (not c!2386)) b!21076))

(assert (= (and d!3695 res!13653) b!21074))

(assert (= (and b!21074 res!13654) b!21079))

(declare-fun b_lambda!1501 () Bool)

(assert (=> (not b_lambda!1501) (not d!3695)))

(declare-fun t!3206 () Bool)

(declare-fun tb!637 () Bool)

(assert (=> (and b!20940 (= (defaultEntry!1714 (v!1564 (underlying!100 thiss!938))) (defaultEntry!1714 (v!1564 (underlying!100 thiss!938)))) t!3206) tb!637))

(declare-fun result!1057 () Bool)

(assert (=> tb!637 (= result!1057 tp_is_empty!991)))

(assert (=> d!3695 t!3206))

(declare-fun b_and!1411 () Bool)

(assert (= b_and!1405 (and (=> t!3206 result!1057) b_and!1411)))

(declare-fun b_lambda!1503 () Bool)

(assert (=> (not b_lambda!1503) (not b!21077)))

(assert (=> b!21077 t!3206))

(declare-fun b_and!1413 () Bool)

(assert (= b_and!1411 (and (=> t!3206 result!1057) b_and!1413)))

(assert (=> d!3695 m!14617))

(declare-fun m!14687 () Bool)

(assert (=> d!3695 m!14687))

(declare-fun m!14689 () Bool)

(assert (=> d!3695 m!14689))

(declare-fun m!14691 () Bool)

(assert (=> d!3695 m!14691))

(assert (=> d!3695 m!14617))

(declare-fun m!14693 () Bool)

(assert (=> d!3695 m!14693))

(declare-fun m!14695 () Bool)

(assert (=> d!3695 m!14695))

(declare-fun m!14697 () Bool)

(assert (=> d!3695 m!14697))

(declare-fun m!14699 () Bool)

(assert (=> d!3695 m!14699))

(assert (=> d!3695 m!14617))

(declare-fun m!14701 () Bool)

(assert (=> d!3695 m!14701))

(declare-fun m!14703 () Bool)

(assert (=> d!3695 m!14703))

(declare-fun m!14705 () Bool)

(assert (=> d!3695 m!14705))

(assert (=> b!21077 m!14689))

(assert (=> b!21077 m!14617))

(assert (=> b!21077 m!14689))

(assert (=> b!21077 m!14689))

(declare-fun m!14707 () Bool)

(assert (=> b!21077 m!14707))

(declare-fun m!14709 () Bool)

(assert (=> b!21077 m!14709))

(declare-fun m!14711 () Bool)

(assert (=> b!21077 m!14711))

(assert (=> b!21077 m!14703))

(declare-fun m!14713 () Bool)

(assert (=> b!21078 m!14713))

(declare-fun m!14715 () Bool)

(assert (=> b!21079 m!14715))

(assert (=> b!20948 d!3695))

(declare-fun d!3697 () Bool)

(declare-fun e!13754 () Bool)

(assert (=> d!3697 e!13754))

(declare-fun res!13657 () Bool)

(assert (=> d!3697 (=> (not res!13657) (not e!13754))))

(declare-fun lt!6531 () (_ BitVec 32))

(assert (=> d!3697 (= res!13657 (validMask!0 lt!6531))))

(declare-datatypes ((tuple2!906 0))(
  ( (tuple2!907 (_1!456 Unit!451) (_2!456 (_ BitVec 32))) )
))
(declare-fun e!13755 () tuple2!906)

(assert (=> d!3697 (= lt!6531 (_2!456 e!13755))))

(declare-fun c!2389 () Bool)

(declare-fun lt!6530 () tuple2!906)

(assert (=> d!3697 (= c!2389 (and (bvsgt (_2!456 lt!6530) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!129 (v!1564 (underlying!100 thiss!938)))) (_2!456 lt!6530)) (bvsge (bvadd (bvand (bvashr (_2!456 lt!6530) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!129 (v!1564 (underlying!100 thiss!938))))))))

(declare-fun Unit!455 () Unit!451)

(declare-fun Unit!456 () Unit!451)

(assert (=> d!3697 (= lt!6530 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!129 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))))) (mask!4684 (v!1564 (underlying!100 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!129 (v!1564 (underlying!100 thiss!938)))) (mask!4684 (v!1564 (underlying!100 thiss!938))))) (tuple2!907 Unit!455 (bvand (bvadd (bvshl (mask!4684 (v!1564 (underlying!100 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!907 Unit!456 (mask!4684 (v!1564 (underlying!100 thiss!938))))))))

(assert (=> d!3697 (validMask!0 (mask!4684 (v!1564 (underlying!100 thiss!938))))))

(assert (=> d!3697 (= (computeNewMask!23 thiss!938 (mask!4684 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (_size!129 (v!1564 (underlying!100 thiss!938)))) lt!6531)))

(declare-fun b!21088 () Bool)

(declare-fun computeNewMaskWhile!10 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!906)

(assert (=> b!21088 (= e!13755 (computeNewMaskWhile!10 (_size!129 (v!1564 (underlying!100 thiss!938))) (_vacant!129 (v!1564 (underlying!100 thiss!938))) (mask!4684 (v!1564 (underlying!100 thiss!938))) (_2!456 lt!6530)))))

(declare-fun b!21089 () Bool)

(declare-fun Unit!457 () Unit!451)

(assert (=> b!21089 (= e!13755 (tuple2!907 Unit!457 (_2!456 lt!6530)))))

(declare-fun b!21090 () Bool)

(assert (=> b!21090 (= e!13754 (bvsle (_size!129 (v!1564 (underlying!100 thiss!938))) (bvadd lt!6531 #b00000000000000000000000000000001)))))

(assert (= (and d!3697 c!2389) b!21088))

(assert (= (and d!3697 (not c!2389)) b!21089))

(assert (= (and d!3697 res!13657) b!21090))

(declare-fun m!14717 () Bool)

(assert (=> d!3697 m!14717))

(assert (=> d!3697 m!14621))

(declare-fun m!14719 () Bool)

(assert (=> b!21088 m!14719))

(assert (=> b!20948 d!3697))

(declare-fun bm!1286 () Bool)

(declare-fun call!1306 () Bool)

(declare-fun call!1289 () Bool)

(assert (=> bm!1286 (= call!1306 call!1289)))

(declare-fun b!21171 () Bool)

(declare-fun res!13696 () Bool)

(declare-fun e!13798 () Bool)

(assert (=> b!21171 (=> (not res!13696) (not e!13798))))

(declare-fun call!1298 () Bool)

(assert (=> b!21171 (= res!13696 call!1298)))

(declare-fun e!13812 () Bool)

(assert (=> b!21171 (= e!13812 e!13798)))

(declare-fun c!2416 () Bool)

(declare-fun call!1302 () ListLongMap!555)

(declare-fun bm!1287 () Bool)

(declare-fun lt!6610 () array!1193)

(declare-fun c!2418 () Bool)

(declare-fun getCurrentListMap!123 (array!1195 array!1193 (_ BitVec 32) (_ BitVec 32) V!1147 V!1147 (_ BitVec 32) Int) ListLongMap!555)

(assert (=> bm!1287 (= call!1302 (getCurrentListMap!123 (_keys!3136 lt!6414) (ite (or c!2416 c!2418) (_values!1704 lt!6414) lt!6610) (mask!4684 lt!6414) (extraKeys!1618 lt!6414) (zeroValue!1642 lt!6414) (minValue!1642 lt!6414) #b00000000000000000000000000000000 (defaultEntry!1714 lt!6414)))))

(declare-fun b!21172 () Bool)

(declare-fun lt!6612 () Unit!451)

(declare-fun lt!6593 () Unit!451)

(assert (=> b!21172 (= lt!6612 lt!6593)))

(declare-fun call!1291 () ListLongMap!555)

(declare-fun call!1294 () ListLongMap!555)

(assert (=> b!21172 (= call!1291 call!1294)))

(declare-fun lt!6602 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!6 (array!1195 array!1193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1147 V!1147 V!1147 Int) Unit!451)

(assert (=> b!21172 (= lt!6593 (lemmaChangeLongMinValueKeyThenAddPairToListMap!6 (_keys!3136 lt!6414) (_values!1704 lt!6414) (mask!4684 lt!6414) (extraKeys!1618 lt!6414) lt!6602 (zeroValue!1642 lt!6414) (minValue!1642 lt!6414) (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938)))) (defaultEntry!1714 lt!6414)))))

(assert (=> b!21172 (= lt!6602 (bvor (extraKeys!1618 lt!6414) #b00000000000000000000000000000010))))

(declare-fun e!13802 () tuple2!894)

(assert (=> b!21172 (= e!13802 (tuple2!895 true (LongMapFixedSize!179 (defaultEntry!1714 lt!6414) (mask!4684 lt!6414) (bvor (extraKeys!1618 lt!6414) #b00000000000000000000000000000010) (zeroValue!1642 lt!6414) (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938)))) (_size!129 lt!6414) (_keys!3136 lt!6414) (_values!1704 lt!6414) (_vacant!129 lt!6414))))))

(declare-fun bm!1288 () Bool)

(declare-fun call!1299 () ListLongMap!555)

(assert (=> bm!1288 (= call!1291 call!1299)))

(declare-fun b!21173 () Bool)

(declare-fun res!13699 () Bool)

(declare-fun call!1293 () Bool)

(assert (=> b!21173 (= res!13699 call!1293)))

(declare-fun e!13814 () Bool)

(assert (=> b!21173 (=> (not res!13699) (not e!13814))))

(declare-fun b!21174 () Bool)

(declare-fun c!2419 () Bool)

(declare-datatypes ((SeekEntryResult!50 0))(
  ( (MissingZero!50 (index!2320 (_ BitVec 32))) (Found!50 (index!2321 (_ BitVec 32))) (Intermediate!50 (undefined!862 Bool) (index!2322 (_ BitVec 32)) (x!5113 (_ BitVec 32))) (Undefined!50) (MissingVacant!50 (index!2323 (_ BitVec 32))) )
))
(declare-fun lt!6587 () SeekEntryResult!50)

(assert (=> b!21174 (= c!2419 ((_ is MissingVacant!50) lt!6587))))

(declare-fun e!13818 () Bool)

(assert (=> b!21174 (= e!13812 e!13818)))

(declare-fun b!21175 () Bool)

(declare-fun lt!6607 () tuple2!894)

(declare-fun call!1309 () tuple2!894)

(assert (=> b!21175 (= lt!6607 call!1309)))

(declare-fun e!13811 () tuple2!894)

(assert (=> b!21175 (= e!13811 (tuple2!895 (_1!450 lt!6607) (_2!450 lt!6607)))))

(declare-fun b!21176 () Bool)

(declare-fun e!13801 () tuple2!894)

(declare-fun lt!6609 () tuple2!894)

(assert (=> b!21176 (= e!13801 (tuple2!895 (_1!450 lt!6609) (_2!450 lt!6609)))))

(assert (=> b!21176 (= lt!6609 call!1309)))

(declare-fun bm!1290 () Bool)

(declare-fun call!1290 () ListLongMap!555)

(assert (=> bm!1290 (= call!1294 call!1290)))

(declare-fun b!21177 () Bool)

(declare-fun e!13804 () Bool)

(assert (=> b!21177 (= e!13804 (not call!1306))))

(declare-fun b!21178 () Bool)

(declare-fun e!13810 () Bool)

(declare-fun e!13800 () Bool)

(assert (=> b!21178 (= e!13810 e!13800)))

(declare-fun c!2422 () Bool)

(declare-fun lt!6608 () tuple2!894)

(assert (=> b!21178 (= c!2422 (_1!450 lt!6608))))

(declare-fun bm!1291 () Bool)

(declare-fun call!1311 () SeekEntryResult!50)

(declare-fun call!1312 () SeekEntryResult!50)

(assert (=> bm!1291 (= call!1311 call!1312)))

(declare-fun b!21179 () Bool)

(declare-fun res!13687 () Bool)

(assert (=> b!21179 (=> (not res!13687) (not e!13798))))

(assert (=> b!21179 (= res!13687 (= (select (arr!567 (_keys!3136 lt!6414)) (index!2320 lt!6587)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1292 () Bool)

(declare-fun call!1292 () Bool)

(assert (=> bm!1292 (= call!1293 call!1292)))

(declare-fun bm!1293 () Bool)

(declare-fun call!1301 () ListLongMap!555)

(assert (=> bm!1293 (= call!1301 call!1302)))

(declare-fun b!21180 () Bool)

(declare-fun e!13808 () Bool)

(declare-fun call!1305 () Bool)

(assert (=> b!21180 (= e!13808 (not call!1305))))

(declare-fun b!21181 () Bool)

(declare-fun call!1304 () ListLongMap!555)

(declare-fun call!1296 () ListLongMap!555)

(assert (=> b!21181 (= e!13800 (= call!1304 call!1296))))

(declare-fun bm!1294 () Bool)

(assert (=> bm!1294 (= call!1304 (map!394 (_2!450 lt!6608)))))

(declare-fun b!21182 () Bool)

(assert (=> b!21182 (= e!13798 (not call!1305))))

(declare-fun b!21183 () Bool)

(declare-fun res!13690 () Bool)

(declare-fun e!13807 () Bool)

(assert (=> b!21183 (=> (not res!13690) (not e!13807))))

(declare-fun lt!6595 () SeekEntryResult!50)

(assert (=> b!21183 (= res!13690 (= (select (arr!567 (_keys!3136 lt!6414)) (index!2320 lt!6595)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1295 () Bool)

(declare-fun call!1303 () Bool)

(declare-fun call!1295 () Bool)

(assert (=> bm!1295 (= call!1303 call!1295)))

(declare-fun b!21184 () Bool)

(declare-fun res!13697 () Bool)

(assert (=> b!21184 (= res!13697 (= (select (arr!567 (_keys!3136 lt!6414)) (index!2323 lt!6587)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21184 (=> (not res!13697) (not e!13808))))

(declare-fun b!21185 () Bool)

(declare-fun e!13815 () Unit!451)

(declare-fun Unit!458 () Unit!451)

(assert (=> b!21185 (= e!13815 Unit!458)))

(declare-fun lt!6600 () Unit!451)

(declare-fun call!1297 () Unit!451)

(assert (=> b!21185 (= lt!6600 call!1297)))

(declare-fun lt!6603 () SeekEntryResult!50)

(declare-fun call!1308 () SeekEntryResult!50)

(assert (=> b!21185 (= lt!6603 call!1308)))

(declare-fun res!13686 () Bool)

(assert (=> b!21185 (= res!13686 ((_ is Found!50) lt!6603))))

(declare-fun e!13809 () Bool)

(assert (=> b!21185 (=> (not res!13686) (not e!13809))))

(assert (=> b!21185 e!13809))

(declare-fun lt!6599 () Unit!451)

(assert (=> b!21185 (= lt!6599 lt!6600)))

(assert (=> b!21185 false))

(declare-fun b!21186 () Bool)

(declare-fun lt!6597 () Unit!451)

(declare-fun lt!6594 () Unit!451)

(assert (=> b!21186 (= lt!6597 lt!6594)))

(declare-fun call!1307 () Bool)

(assert (=> b!21186 call!1307))

(declare-fun lt!6604 () SeekEntryResult!50)

(declare-fun lemmaValidKeyInArrayIsInListMap!6 (array!1195 array!1193 (_ BitVec 32) (_ BitVec 32) V!1147 V!1147 (_ BitVec 32) Int) Unit!451)

(assert (=> b!21186 (= lt!6594 (lemmaValidKeyInArrayIsInListMap!6 (_keys!3136 lt!6414) lt!6610 (mask!4684 lt!6414) (extraKeys!1618 lt!6414) (zeroValue!1642 lt!6414) (minValue!1642 lt!6414) (index!2321 lt!6604) (defaultEntry!1714 lt!6414)))))

(assert (=> b!21186 (= lt!6610 (array!1194 (store (arr!566 (_values!1704 lt!6414)) (index!2321 lt!6604) (ValueCellFull!296 (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938)))))) (size!659 (_values!1704 lt!6414))))))

(declare-fun lt!6601 () Unit!451)

(declare-fun lt!6606 () Unit!451)

(assert (=> b!21186 (= lt!6601 lt!6606)))

(assert (=> b!21186 (= call!1299 call!1290)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!6 (array!1195 array!1193 (_ BitVec 32) (_ BitVec 32) V!1147 V!1147 (_ BitVec 32) (_ BitVec 64) V!1147 Int) Unit!451)

(assert (=> b!21186 (= lt!6606 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!6 (_keys!3136 lt!6414) (_values!1704 lt!6414) (mask!4684 lt!6414) (extraKeys!1618 lt!6414) (zeroValue!1642 lt!6414) (minValue!1642 lt!6414) (index!2321 lt!6604) (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938)))) (defaultEntry!1714 lt!6414)))))

(declare-fun lt!6591 () Unit!451)

(declare-fun e!13805 () Unit!451)

(assert (=> b!21186 (= lt!6591 e!13805)))

(declare-fun c!2423 () Bool)

(declare-fun contains!223 (ListLongMap!555 (_ BitVec 64)) Bool)

(assert (=> b!21186 (= c!2423 (contains!223 (getCurrentListMap!123 (_keys!3136 lt!6414) (_values!1704 lt!6414) (mask!4684 lt!6414) (extraKeys!1618 lt!6414) (zeroValue!1642 lt!6414) (minValue!1642 lt!6414) #b00000000000000000000000000000000 (defaultEntry!1714 lt!6414)) (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21186 (= e!13811 (tuple2!895 true (LongMapFixedSize!179 (defaultEntry!1714 lt!6414) (mask!4684 lt!6414) (extraKeys!1618 lt!6414) (zeroValue!1642 lt!6414) (minValue!1642 lt!6414) (_size!129 lt!6414) (_keys!3136 lt!6414) (array!1194 (store (arr!566 (_values!1704 lt!6414)) (index!2321 lt!6604) (ValueCellFull!296 (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938)))))) (size!659 (_values!1704 lt!6414))) (_vacant!129 lt!6414))))))

(declare-fun b!21187 () Bool)

(assert (=> b!21187 (= e!13818 ((_ is Undefined!50) lt!6587))))

(declare-fun b!21188 () Bool)

(declare-fun c!2420 () Bool)

(assert (=> b!21188 (= c!2420 ((_ is MissingVacant!50) lt!6595))))

(declare-fun e!13816 () Bool)

(declare-fun e!13806 () Bool)

(assert (=> b!21188 (= e!13816 e!13806)))

(declare-fun b!21189 () Bool)

(declare-fun e!13799 () tuple2!894)

(assert (=> b!21189 (= e!13799 e!13802)))

(declare-fun c!2424 () Bool)

(assert (=> b!21189 (= c!2424 (= (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21190 () Bool)

(assert (=> b!21190 (= e!13801 e!13811)))

(declare-fun c!2421 () Bool)

(assert (=> b!21190 (= c!2421 ((_ is MissingZero!50) lt!6604))))

(declare-fun b!21191 () Bool)

(declare-fun lt!6596 () Unit!451)

(assert (=> b!21191 (= e!13815 lt!6596)))

(declare-fun call!1310 () Unit!451)

(assert (=> b!21191 (= lt!6596 call!1310)))

(assert (=> b!21191 (= lt!6595 call!1308)))

(declare-fun c!2417 () Bool)

(assert (=> b!21191 (= c!2417 ((_ is MissingZero!50) lt!6595))))

(assert (=> b!21191 e!13816))

(declare-fun bm!1296 () Bool)

(declare-fun c!2428 () Bool)

(declare-fun c!2426 () Bool)

(declare-fun lt!6586 () SeekEntryResult!50)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1296 (= call!1292 (inRange!0 (ite c!2418 (ite c!2426 (index!2321 lt!6603) (ite c!2417 (index!2320 lt!6595) (index!2323 lt!6595))) (ite c!2423 (index!2321 lt!6586) (ite c!2428 (index!2320 lt!6587) (index!2323 lt!6587)))) (mask!4684 lt!6414)))))

(declare-fun d!3699 () Bool)

(assert (=> d!3699 e!13810))

(declare-fun res!13691 () Bool)

(assert (=> d!3699 (=> (not res!13691) (not e!13810))))

(assert (=> d!3699 (= res!13691 (valid!105 (_2!450 lt!6608)))))

(assert (=> d!3699 (= lt!6608 e!13799)))

(assert (=> d!3699 (= c!2416 (= (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvneg (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3699 (valid!105 lt!6414)))

(assert (=> d!3699 (= (update!28 lt!6414 (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938))))) lt!6608)))

(declare-fun bm!1289 () Bool)

(assert (=> bm!1289 (= call!1298 call!1293)))

(declare-fun bm!1297 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1195 (_ BitVec 32)) SeekEntryResult!50)

(assert (=> bm!1297 (= call!1312 (seekEntryOrOpen!0 (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3136 lt!6414) (mask!4684 lt!6414)))))

(declare-fun bm!1298 () Bool)

(assert (=> bm!1298 (= call!1308 call!1312)))

(declare-fun b!21192 () Bool)

(declare-fun res!13689 () Bool)

(assert (=> b!21192 (= res!13689 call!1295)))

(assert (=> b!21192 (=> (not res!13689) (not e!13809))))

(declare-fun b!21193 () Bool)

(declare-fun c!2425 () Bool)

(assert (=> b!21193 (= c!2425 ((_ is MissingVacant!50) lt!6604))))

(declare-fun e!13813 () tuple2!894)

(assert (=> b!21193 (= e!13813 e!13801)))

(declare-fun bm!1299 () Bool)

(declare-fun call!1300 () ListLongMap!555)

(assert (=> bm!1299 (= call!1300 call!1302)))

(declare-fun b!21194 () Bool)

(declare-fun res!13693 () Bool)

(assert (=> b!21194 (= res!13693 (= (select (arr!567 (_keys!3136 lt!6414)) (index!2323 lt!6595)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21194 (=> (not res!13693) (not e!13804))))

(declare-fun b!21195 () Bool)

(declare-fun res!13688 () Bool)

(assert (=> b!21195 (=> (not res!13688) (not e!13807))))

(assert (=> b!21195 (= res!13688 call!1303)))

(assert (=> b!21195 (= e!13816 e!13807)))

(declare-fun bm!1300 () Bool)

(declare-fun updateHelperNewKey!6 (LongMapFixedSize!178 (_ BitVec 64) V!1147 (_ BitVec 32)) tuple2!894)

(assert (=> bm!1300 (= call!1309 (updateHelperNewKey!6 lt!6414 (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938)))) (ite c!2425 (index!2323 lt!6604) (index!2320 lt!6604))))))

(declare-fun b!21196 () Bool)

(assert (=> b!21196 (= e!13807 (not call!1306))))

(declare-fun b!21197 () Bool)

(declare-fun Unit!459 () Unit!451)

(assert (=> b!21197 (= e!13805 Unit!459)))

(declare-fun lt!6598 () Unit!451)

(assert (=> b!21197 (= lt!6598 call!1310)))

(assert (=> b!21197 (= lt!6587 call!1311)))

(assert (=> b!21197 (= c!2428 ((_ is MissingZero!50) lt!6587))))

(assert (=> b!21197 e!13812))

(declare-fun lt!6611 () Unit!451)

(assert (=> b!21197 (= lt!6611 lt!6598)))

(assert (=> b!21197 false))

(declare-fun b!21198 () Bool)

(assert (=> b!21198 (= e!13814 (= (select (arr!567 (_keys!3136 lt!6414)) (index!2321 lt!6586)) (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!21199 () Bool)

(assert (=> b!21199 (= e!13806 e!13804)))

(declare-fun res!13695 () Bool)

(assert (=> b!21199 (= res!13695 call!1303)))

(assert (=> b!21199 (=> (not res!13695) (not e!13804))))

(declare-fun bm!1301 () Bool)

(assert (=> bm!1301 (= call!1307 (contains!223 call!1300 (ite c!2418 (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (select (arr!567 (_keys!3136 lt!6414)) (index!2321 lt!6604)))))))

(declare-fun bm!1302 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!6 (array!1195 array!1193 (_ BitVec 32) (_ BitVec 32) V!1147 V!1147 (_ BitVec 64) Int) Unit!451)

(assert (=> bm!1302 (= call!1297 (lemmaInListMapThenSeekEntryOrOpenFindsIt!6 (_keys!3136 lt!6414) (_values!1704 lt!6414) (mask!4684 lt!6414) (extraKeys!1618 lt!6414) (zeroValue!1642 lt!6414) (minValue!1642 lt!6414) (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1714 lt!6414)))))

(declare-fun bm!1303 () Bool)

(assert (=> bm!1303 (= call!1305 call!1289)))

(declare-fun bm!1304 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!6 (array!1195 array!1193 (_ BitVec 32) (_ BitVec 32) V!1147 V!1147 (_ BitVec 64) Int) Unit!451)

(assert (=> bm!1304 (= call!1310 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!6 (_keys!3136 lt!6414) (_values!1704 lt!6414) (mask!4684 lt!6414) (extraKeys!1618 lt!6414) (zeroValue!1642 lt!6414) (minValue!1642 lt!6414) (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1714 lt!6414)))))

(declare-fun b!21200 () Bool)

(declare-fun e!13803 () ListLongMap!555)

(assert (=> b!21200 (= e!13803 (getCurrentListMap!123 (_keys!3136 lt!6414) (_values!1704 lt!6414) (mask!4684 lt!6414) (extraKeys!1618 lt!6414) (zeroValue!1642 lt!6414) (minValue!1642 lt!6414) #b00000000000000000000000000000000 (defaultEntry!1714 lt!6414)))))

(declare-fun b!21201 () Bool)

(declare-fun lt!6605 () Unit!451)

(assert (=> b!21201 (= e!13805 lt!6605)))

(assert (=> b!21201 (= lt!6605 call!1297)))

(assert (=> b!21201 (= lt!6586 call!1311)))

(declare-fun res!13692 () Bool)

(assert (=> b!21201 (= res!13692 ((_ is Found!50) lt!6586))))

(assert (=> b!21201 (=> (not res!13692) (not e!13814))))

(assert (=> b!21201 e!13814))

(declare-fun b!21202 () Bool)

(declare-fun e!13817 () Bool)

(assert (=> b!21202 (= e!13800 e!13817)))

(declare-fun res!13698 () Bool)

(assert (=> b!21202 (= res!13698 (contains!223 call!1304 (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21202 (=> (not res!13698) (not e!13817))))

(declare-fun b!21203 () Bool)

(assert (=> b!21203 (= e!13818 e!13808)))

(declare-fun res!13694 () Bool)

(assert (=> b!21203 (= res!13694 call!1298)))

(assert (=> b!21203 (=> (not res!13694) (not e!13808))))

(declare-fun b!21204 () Bool)

(assert (=> b!21204 (= e!13803 call!1301)))

(declare-fun b!21205 () Bool)

(assert (=> b!21205 (= e!13809 (= (select (arr!567 (_keys!3136 lt!6414)) (index!2321 lt!6603)) (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!1305 () Bool)

(assert (=> bm!1305 (= call!1295 call!1292)))

(declare-fun lt!6592 () (_ BitVec 32))

(declare-fun bm!1306 () Bool)

(assert (=> bm!1306 (= call!1290 (getCurrentListMap!123 (_keys!3136 lt!6414) (ite c!2416 (_values!1704 lt!6414) (array!1194 (store (arr!566 (_values!1704 lt!6414)) (index!2321 lt!6604) (ValueCellFull!296 (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938)))))) (size!659 (_values!1704 lt!6414)))) (mask!4684 lt!6414) (ite c!2416 (ite c!2424 lt!6592 lt!6602) (extraKeys!1618 lt!6414)) (ite (and c!2416 c!2424) (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938)))) (zeroValue!1642 lt!6414)) (ite c!2416 (ite c!2424 (minValue!1642 lt!6414) (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938))))) (minValue!1642 lt!6414)) #b00000000000000000000000000000000 (defaultEntry!1714 lt!6414)))))

(declare-fun b!21206 () Bool)

(assert (=> b!21206 (= e!13799 e!13813)))

(assert (=> b!21206 (= lt!6604 (seekEntryOrOpen!0 (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3136 lt!6414) (mask!4684 lt!6414)))))

(assert (=> b!21206 (= c!2418 ((_ is Undefined!50) lt!6604))))

(declare-fun b!21207 () Bool)

(declare-fun lt!6589 () Unit!451)

(declare-fun lt!6590 () Unit!451)

(assert (=> b!21207 (= lt!6589 lt!6590)))

(assert (=> b!21207 (= call!1291 call!1294)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!6 (array!1195 array!1193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1147 V!1147 V!1147 Int) Unit!451)

(assert (=> b!21207 (= lt!6590 (lemmaChangeZeroKeyThenAddPairToListMap!6 (_keys!3136 lt!6414) (_values!1704 lt!6414) (mask!4684 lt!6414) (extraKeys!1618 lt!6414) lt!6592 (zeroValue!1642 lt!6414) (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938)))) (minValue!1642 lt!6414) (defaultEntry!1714 lt!6414)))))

(assert (=> b!21207 (= lt!6592 (bvor (extraKeys!1618 lt!6414) #b00000000000000000000000000000001))))

(assert (=> b!21207 (= e!13802 (tuple2!895 true (LongMapFixedSize!179 (defaultEntry!1714 lt!6414) (mask!4684 lt!6414) (bvor (extraKeys!1618 lt!6414) #b00000000000000000000000000000001) (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938)))) (minValue!1642 lt!6414) (_size!129 lt!6414) (_keys!3136 lt!6414) (_values!1704 lt!6414) (_vacant!129 lt!6414))))))

(declare-fun b!21208 () Bool)

(assert (=> b!21208 (= e!13806 ((_ is Undefined!50) lt!6595))))

(declare-fun b!21209 () Bool)

(declare-fun +!40 (ListLongMap!555 tuple2!904) ListLongMap!555)

(assert (=> b!21209 (= e!13817 (= call!1304 (+!40 call!1296 (tuple2!905 (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938))))))))))

(declare-fun bm!1307 () Bool)

(assert (=> bm!1307 (= call!1299 (+!40 e!13803 (ite c!2416 (ite c!2424 (tuple2!905 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938))))) (tuple2!905 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938)))))) (tuple2!905 (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2360 c!2362) (zeroValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (v!1564 (underlying!100 thiss!938))))))))))

(declare-fun c!2427 () Bool)

(assert (=> bm!1307 (= c!2427 c!2416)))

(declare-fun bm!1308 () Bool)

(assert (=> bm!1308 (= call!1289 (arrayContainsKey!0 (_keys!3136 lt!6414) (ite (or c!2360 c!2362) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000))))

(declare-fun b!21210 () Bool)

(declare-fun lt!6588 () Unit!451)

(assert (=> b!21210 (= lt!6588 e!13815)))

(assert (=> b!21210 (= c!2426 call!1307)))

(assert (=> b!21210 (= e!13813 (tuple2!895 false lt!6414))))

(declare-fun bm!1309 () Bool)

(assert (=> bm!1309 (= call!1296 (map!394 lt!6414))))

(assert (= (and d!3699 c!2416) b!21189))

(assert (= (and d!3699 (not c!2416)) b!21206))

(assert (= (and b!21189 c!2424) b!21207))

(assert (= (and b!21189 (not c!2424)) b!21172))

(assert (= (or b!21207 b!21172) bm!1290))

(assert (= (or b!21207 b!21172) bm!1293))

(assert (= (or b!21207 b!21172) bm!1288))

(assert (= (and b!21206 c!2418) b!21210))

(assert (= (and b!21206 (not c!2418)) b!21193))

(assert (= (and b!21210 c!2426) b!21185))

(assert (= (and b!21210 (not c!2426)) b!21191))

(assert (= (and b!21185 res!13686) b!21192))

(assert (= (and b!21192 res!13689) b!21205))

(assert (= (and b!21191 c!2417) b!21195))

(assert (= (and b!21191 (not c!2417)) b!21188))

(assert (= (and b!21195 res!13688) b!21183))

(assert (= (and b!21183 res!13690) b!21196))

(assert (= (and b!21188 c!2420) b!21199))

(assert (= (and b!21188 (not c!2420)) b!21208))

(assert (= (and b!21199 res!13695) b!21194))

(assert (= (and b!21194 res!13693) b!21177))

(assert (= (or b!21195 b!21199) bm!1295))

(assert (= (or b!21196 b!21177) bm!1286))

(assert (= (or b!21192 bm!1295) bm!1305))

(assert (= (or b!21185 b!21191) bm!1298))

(assert (= (and b!21193 c!2425) b!21176))

(assert (= (and b!21193 (not c!2425)) b!21190))

(assert (= (and b!21190 c!2421) b!21175))

(assert (= (and b!21190 (not c!2421)) b!21186))

(assert (= (and b!21186 c!2423) b!21201))

(assert (= (and b!21186 (not c!2423)) b!21197))

(assert (= (and b!21201 res!13692) b!21173))

(assert (= (and b!21173 res!13699) b!21198))

(assert (= (and b!21197 c!2428) b!21171))

(assert (= (and b!21197 (not c!2428)) b!21174))

(assert (= (and b!21171 res!13696) b!21179))

(assert (= (and b!21179 res!13687) b!21182))

(assert (= (and b!21174 c!2419) b!21203))

(assert (= (and b!21174 (not c!2419)) b!21187))

(assert (= (and b!21203 res!13694) b!21184))

(assert (= (and b!21184 res!13697) b!21180))

(assert (= (or b!21171 b!21203) bm!1289))

(assert (= (or b!21182 b!21180) bm!1303))

(assert (= (or b!21173 bm!1289) bm!1292))

(assert (= (or b!21201 b!21197) bm!1291))

(assert (= (or b!21176 b!21175) bm!1300))

(assert (= (or b!21191 b!21197) bm!1304))

(assert (= (or bm!1286 bm!1303) bm!1308))

(assert (= (or b!21210 b!21186) bm!1299))

(assert (= (or bm!1305 bm!1292) bm!1296))

(assert (= (or bm!1298 bm!1291) bm!1297))

(assert (= (or b!21185 b!21201) bm!1302))

(assert (= (or b!21210 b!21186) bm!1301))

(assert (= (or bm!1290 b!21186) bm!1306))

(assert (= (or bm!1293 bm!1299) bm!1287))

(assert (= (or bm!1288 b!21186) bm!1307))

(assert (= (and bm!1307 c!2427) b!21204))

(assert (= (and bm!1307 (not c!2427)) b!21200))

(assert (= (and d!3699 res!13691) b!21178))

(assert (= (and b!21178 c!2422) b!21202))

(assert (= (and b!21178 (not c!2422)) b!21181))

(assert (= (and b!21202 res!13698) b!21209))

(assert (= (or b!21202 b!21209 b!21181) bm!1294))

(assert (= (or b!21209 b!21181) bm!1309))

(declare-fun m!14721 () Bool)

(assert (=> b!21205 m!14721))

(declare-fun m!14723 () Bool)

(assert (=> b!21186 m!14723))

(declare-fun m!14725 () Bool)

(assert (=> b!21186 m!14725))

(declare-fun m!14727 () Bool)

(assert (=> b!21186 m!14727))

(declare-fun m!14729 () Bool)

(assert (=> b!21186 m!14729))

(assert (=> b!21186 m!14723))

(declare-fun m!14731 () Bool)

(assert (=> b!21186 m!14731))

(declare-fun m!14733 () Bool)

(assert (=> bm!1296 m!14733))

(declare-fun m!14735 () Bool)

(assert (=> bm!1301 m!14735))

(declare-fun m!14737 () Bool)

(assert (=> bm!1301 m!14737))

(declare-fun m!14739 () Bool)

(assert (=> d!3699 m!14739))

(declare-fun m!14741 () Bool)

(assert (=> d!3699 m!14741))

(declare-fun m!14743 () Bool)

(assert (=> b!21183 m!14743))

(declare-fun m!14745 () Bool)

(assert (=> bm!1302 m!14745))

(declare-fun m!14747 () Bool)

(assert (=> b!21198 m!14747))

(declare-fun m!14749 () Bool)

(assert (=> bm!1300 m!14749))

(declare-fun m!14751 () Bool)

(assert (=> b!21207 m!14751))

(declare-fun m!14753 () Bool)

(assert (=> bm!1307 m!14753))

(assert (=> bm!1306 m!14727))

(declare-fun m!14755 () Bool)

(assert (=> bm!1306 m!14755))

(declare-fun m!14757 () Bool)

(assert (=> b!21202 m!14757))

(declare-fun m!14759 () Bool)

(assert (=> b!21172 m!14759))

(declare-fun m!14761 () Bool)

(assert (=> bm!1297 m!14761))

(declare-fun m!14763 () Bool)

(assert (=> b!21209 m!14763))

(declare-fun m!14765 () Bool)

(assert (=> bm!1304 m!14765))

(declare-fun m!14767 () Bool)

(assert (=> bm!1309 m!14767))

(declare-fun m!14769 () Bool)

(assert (=> bm!1294 m!14769))

(declare-fun m!14771 () Bool)

(assert (=> b!21179 m!14771))

(declare-fun m!14773 () Bool)

(assert (=> bm!1287 m!14773))

(assert (=> b!21200 m!14723))

(declare-fun m!14775 () Bool)

(assert (=> b!21184 m!14775))

(assert (=> b!21206 m!14761))

(declare-fun m!14777 () Bool)

(assert (=> b!21194 m!14777))

(declare-fun m!14779 () Bool)

(assert (=> bm!1308 m!14779))

(assert (=> bm!1225 d!3699))

(declare-fun bm!1310 () Bool)

(declare-fun call!1330 () Bool)

(declare-fun call!1313 () Bool)

(assert (=> bm!1310 (= call!1330 call!1313)))

(declare-fun b!21211 () Bool)

(declare-fun res!13710 () Bool)

(declare-fun e!13819 () Bool)

(assert (=> b!21211 (=> (not res!13710) (not e!13819))))

(declare-fun call!1322 () Bool)

(assert (=> b!21211 (= res!13710 call!1322)))

(declare-fun e!13833 () Bool)

(assert (=> b!21211 (= e!13833 e!13819)))

(declare-fun bm!1311 () Bool)

(declare-fun call!1326 () ListLongMap!555)

(declare-fun c!2431 () Bool)

(declare-fun lt!6637 () array!1193)

(declare-fun c!2429 () Bool)

(assert (=> bm!1311 (= call!1326 (getCurrentListMap!123 (_keys!3136 (_2!450 lt!6409)) (ite (or c!2429 c!2431) (_values!1704 (_2!450 lt!6409)) lt!6637) (mask!4684 (_2!450 lt!6409)) (extraKeys!1618 (_2!450 lt!6409)) (zeroValue!1642 (_2!450 lt!6409)) (minValue!1642 (_2!450 lt!6409)) #b00000000000000000000000000000000 (defaultEntry!1714 (_2!450 lt!6409))))))

(declare-fun b!21212 () Bool)

(declare-fun lt!6639 () Unit!451)

(declare-fun lt!6620 () Unit!451)

(assert (=> b!21212 (= lt!6639 lt!6620)))

(declare-fun call!1315 () ListLongMap!555)

(declare-fun call!1318 () ListLongMap!555)

(assert (=> b!21212 (= call!1315 call!1318)))

(declare-fun lt!6629 () (_ BitVec 32))

(assert (=> b!21212 (= lt!6620 (lemmaChangeLongMinValueKeyThenAddPairToListMap!6 (_keys!3136 (_2!450 lt!6409)) (_values!1704 (_2!450 lt!6409)) (mask!4684 (_2!450 lt!6409)) (extraKeys!1618 (_2!450 lt!6409)) lt!6629 (zeroValue!1642 (_2!450 lt!6409)) (minValue!1642 (_2!450 lt!6409)) (minValue!1642 (v!1564 (underlying!100 thiss!938))) (defaultEntry!1714 (_2!450 lt!6409))))))

(assert (=> b!21212 (= lt!6629 (bvor (extraKeys!1618 (_2!450 lt!6409)) #b00000000000000000000000000000010))))

(declare-fun e!13823 () tuple2!894)

(assert (=> b!21212 (= e!13823 (tuple2!895 true (LongMapFixedSize!179 (defaultEntry!1714 (_2!450 lt!6409)) (mask!4684 (_2!450 lt!6409)) (bvor (extraKeys!1618 (_2!450 lt!6409)) #b00000000000000000000000000000010) (zeroValue!1642 (_2!450 lt!6409)) (minValue!1642 (v!1564 (underlying!100 thiss!938))) (_size!129 (_2!450 lt!6409)) (_keys!3136 (_2!450 lt!6409)) (_values!1704 (_2!450 lt!6409)) (_vacant!129 (_2!450 lt!6409)))))))

(declare-fun bm!1312 () Bool)

(declare-fun call!1323 () ListLongMap!555)

(assert (=> bm!1312 (= call!1315 call!1323)))

(declare-fun b!21213 () Bool)

(declare-fun res!13713 () Bool)

(declare-fun call!1317 () Bool)

(assert (=> b!21213 (= res!13713 call!1317)))

(declare-fun e!13835 () Bool)

(assert (=> b!21213 (=> (not res!13713) (not e!13835))))

(declare-fun b!21214 () Bool)

(declare-fun c!2432 () Bool)

(declare-fun lt!6614 () SeekEntryResult!50)

(assert (=> b!21214 (= c!2432 ((_ is MissingVacant!50) lt!6614))))

(declare-fun e!13839 () Bool)

(assert (=> b!21214 (= e!13833 e!13839)))

(declare-fun b!21215 () Bool)

(declare-fun lt!6634 () tuple2!894)

(declare-fun call!1333 () tuple2!894)

(assert (=> b!21215 (= lt!6634 call!1333)))

(declare-fun e!13832 () tuple2!894)

(assert (=> b!21215 (= e!13832 (tuple2!895 (_1!450 lt!6634) (_2!450 lt!6634)))))

(declare-fun b!21216 () Bool)

(declare-fun e!13822 () tuple2!894)

(declare-fun lt!6636 () tuple2!894)

(assert (=> b!21216 (= e!13822 (tuple2!895 (_1!450 lt!6636) (_2!450 lt!6636)))))

(assert (=> b!21216 (= lt!6636 call!1333)))

(declare-fun bm!1314 () Bool)

(declare-fun call!1314 () ListLongMap!555)

(assert (=> bm!1314 (= call!1318 call!1314)))

(declare-fun b!21217 () Bool)

(declare-fun e!13825 () Bool)

(assert (=> b!21217 (= e!13825 (not call!1330))))

(declare-fun b!21218 () Bool)

(declare-fun e!13831 () Bool)

(declare-fun e!13821 () Bool)

(assert (=> b!21218 (= e!13831 e!13821)))

(declare-fun c!2435 () Bool)

(declare-fun lt!6635 () tuple2!894)

(assert (=> b!21218 (= c!2435 (_1!450 lt!6635))))

(declare-fun bm!1315 () Bool)

(declare-fun call!1335 () SeekEntryResult!50)

(declare-fun call!1336 () SeekEntryResult!50)

(assert (=> bm!1315 (= call!1335 call!1336)))

(declare-fun b!21219 () Bool)

(declare-fun res!13701 () Bool)

(assert (=> b!21219 (=> (not res!13701) (not e!13819))))

(assert (=> b!21219 (= res!13701 (= (select (arr!567 (_keys!3136 (_2!450 lt!6409))) (index!2320 lt!6614)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1316 () Bool)

(declare-fun call!1316 () Bool)

(assert (=> bm!1316 (= call!1317 call!1316)))

(declare-fun bm!1317 () Bool)

(declare-fun call!1325 () ListLongMap!555)

(assert (=> bm!1317 (= call!1325 call!1326)))

(declare-fun b!21220 () Bool)

(declare-fun e!13829 () Bool)

(declare-fun call!1329 () Bool)

(assert (=> b!21220 (= e!13829 (not call!1329))))

(declare-fun b!21221 () Bool)

(declare-fun call!1328 () ListLongMap!555)

(declare-fun call!1320 () ListLongMap!555)

(assert (=> b!21221 (= e!13821 (= call!1328 call!1320))))

(declare-fun bm!1318 () Bool)

(assert (=> bm!1318 (= call!1328 (map!394 (_2!450 lt!6635)))))

(declare-fun b!21222 () Bool)

(assert (=> b!21222 (= e!13819 (not call!1329))))

(declare-fun b!21223 () Bool)

(declare-fun res!13704 () Bool)

(declare-fun e!13828 () Bool)

(assert (=> b!21223 (=> (not res!13704) (not e!13828))))

(declare-fun lt!6622 () SeekEntryResult!50)

(assert (=> b!21223 (= res!13704 (= (select (arr!567 (_keys!3136 (_2!450 lt!6409))) (index!2320 lt!6622)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1319 () Bool)

(declare-fun call!1327 () Bool)

(declare-fun call!1319 () Bool)

(assert (=> bm!1319 (= call!1327 call!1319)))

(declare-fun b!21224 () Bool)

(declare-fun res!13711 () Bool)

(assert (=> b!21224 (= res!13711 (= (select (arr!567 (_keys!3136 (_2!450 lt!6409))) (index!2323 lt!6614)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21224 (=> (not res!13711) (not e!13829))))

(declare-fun b!21225 () Bool)

(declare-fun e!13836 () Unit!451)

(declare-fun Unit!460 () Unit!451)

(assert (=> b!21225 (= e!13836 Unit!460)))

(declare-fun lt!6627 () Unit!451)

(declare-fun call!1321 () Unit!451)

(assert (=> b!21225 (= lt!6627 call!1321)))

(declare-fun lt!6630 () SeekEntryResult!50)

(declare-fun call!1332 () SeekEntryResult!50)

(assert (=> b!21225 (= lt!6630 call!1332)))

(declare-fun res!13700 () Bool)

(assert (=> b!21225 (= res!13700 ((_ is Found!50) lt!6630))))

(declare-fun e!13830 () Bool)

(assert (=> b!21225 (=> (not res!13700) (not e!13830))))

(assert (=> b!21225 e!13830))

(declare-fun lt!6626 () Unit!451)

(assert (=> b!21225 (= lt!6626 lt!6627)))

(assert (=> b!21225 false))

(declare-fun b!21226 () Bool)

(declare-fun lt!6624 () Unit!451)

(declare-fun lt!6621 () Unit!451)

(assert (=> b!21226 (= lt!6624 lt!6621)))

(declare-fun call!1331 () Bool)

(assert (=> b!21226 call!1331))

(declare-fun lt!6631 () SeekEntryResult!50)

(assert (=> b!21226 (= lt!6621 (lemmaValidKeyInArrayIsInListMap!6 (_keys!3136 (_2!450 lt!6409)) lt!6637 (mask!4684 (_2!450 lt!6409)) (extraKeys!1618 (_2!450 lt!6409)) (zeroValue!1642 (_2!450 lt!6409)) (minValue!1642 (_2!450 lt!6409)) (index!2321 lt!6631) (defaultEntry!1714 (_2!450 lt!6409))))))

(assert (=> b!21226 (= lt!6637 (array!1194 (store (arr!566 (_values!1704 (_2!450 lt!6409))) (index!2321 lt!6631) (ValueCellFull!296 (minValue!1642 (v!1564 (underlying!100 thiss!938))))) (size!659 (_values!1704 (_2!450 lt!6409)))))))

(declare-fun lt!6628 () Unit!451)

(declare-fun lt!6633 () Unit!451)

(assert (=> b!21226 (= lt!6628 lt!6633)))

(assert (=> b!21226 (= call!1323 call!1314)))

(assert (=> b!21226 (= lt!6633 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!6 (_keys!3136 (_2!450 lt!6409)) (_values!1704 (_2!450 lt!6409)) (mask!4684 (_2!450 lt!6409)) (extraKeys!1618 (_2!450 lt!6409)) (zeroValue!1642 (_2!450 lt!6409)) (minValue!1642 (_2!450 lt!6409)) (index!2321 lt!6631) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1642 (v!1564 (underlying!100 thiss!938))) (defaultEntry!1714 (_2!450 lt!6409))))))

(declare-fun lt!6618 () Unit!451)

(declare-fun e!13826 () Unit!451)

(assert (=> b!21226 (= lt!6618 e!13826)))

(declare-fun c!2436 () Bool)

(assert (=> b!21226 (= c!2436 (contains!223 (getCurrentListMap!123 (_keys!3136 (_2!450 lt!6409)) (_values!1704 (_2!450 lt!6409)) (mask!4684 (_2!450 lt!6409)) (extraKeys!1618 (_2!450 lt!6409)) (zeroValue!1642 (_2!450 lt!6409)) (minValue!1642 (_2!450 lt!6409)) #b00000000000000000000000000000000 (defaultEntry!1714 (_2!450 lt!6409))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21226 (= e!13832 (tuple2!895 true (LongMapFixedSize!179 (defaultEntry!1714 (_2!450 lt!6409)) (mask!4684 (_2!450 lt!6409)) (extraKeys!1618 (_2!450 lt!6409)) (zeroValue!1642 (_2!450 lt!6409)) (minValue!1642 (_2!450 lt!6409)) (_size!129 (_2!450 lt!6409)) (_keys!3136 (_2!450 lt!6409)) (array!1194 (store (arr!566 (_values!1704 (_2!450 lt!6409))) (index!2321 lt!6631) (ValueCellFull!296 (minValue!1642 (v!1564 (underlying!100 thiss!938))))) (size!659 (_values!1704 (_2!450 lt!6409)))) (_vacant!129 (_2!450 lt!6409)))))))

(declare-fun b!21227 () Bool)

(assert (=> b!21227 (= e!13839 ((_ is Undefined!50) lt!6614))))

(declare-fun b!21228 () Bool)

(declare-fun c!2433 () Bool)

(assert (=> b!21228 (= c!2433 ((_ is MissingVacant!50) lt!6622))))

(declare-fun e!13837 () Bool)

(declare-fun e!13827 () Bool)

(assert (=> b!21228 (= e!13837 e!13827)))

(declare-fun b!21229 () Bool)

(declare-fun e!13820 () tuple2!894)

(assert (=> b!21229 (= e!13820 e!13823)))

(declare-fun c!2437 () Bool)

(assert (=> b!21229 (= c!2437 (= #b1000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21230 () Bool)

(assert (=> b!21230 (= e!13822 e!13832)))

(declare-fun c!2434 () Bool)

(assert (=> b!21230 (= c!2434 ((_ is MissingZero!50) lt!6631))))

(declare-fun b!21231 () Bool)

(declare-fun lt!6623 () Unit!451)

(assert (=> b!21231 (= e!13836 lt!6623)))

(declare-fun call!1334 () Unit!451)

(assert (=> b!21231 (= lt!6623 call!1334)))

(assert (=> b!21231 (= lt!6622 call!1332)))

(declare-fun c!2430 () Bool)

(assert (=> b!21231 (= c!2430 ((_ is MissingZero!50) lt!6622))))

(assert (=> b!21231 e!13837))

(declare-fun c!2439 () Bool)

(declare-fun bm!1320 () Bool)

(declare-fun lt!6613 () SeekEntryResult!50)

(declare-fun c!2441 () Bool)

(assert (=> bm!1320 (= call!1316 (inRange!0 (ite c!2431 (ite c!2439 (index!2321 lt!6630) (ite c!2430 (index!2320 lt!6622) (index!2323 lt!6622))) (ite c!2436 (index!2321 lt!6613) (ite c!2441 (index!2320 lt!6614) (index!2323 lt!6614)))) (mask!4684 (_2!450 lt!6409))))))

(declare-fun d!3701 () Bool)

(assert (=> d!3701 e!13831))

(declare-fun res!13705 () Bool)

(assert (=> d!3701 (=> (not res!13705) (not e!13831))))

(assert (=> d!3701 (= res!13705 (valid!105 (_2!450 lt!6635)))))

(assert (=> d!3701 (= lt!6635 e!13820)))

(assert (=> d!3701 (= c!2429 (= #b1000000000000000000000000000000000000000000000000000000000000000 (bvneg #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3701 (valid!105 (_2!450 lt!6409))))

(assert (=> d!3701 (= (update!28 (_2!450 lt!6409) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1642 (v!1564 (underlying!100 thiss!938)))) lt!6635)))

(declare-fun bm!1313 () Bool)

(assert (=> bm!1313 (= call!1322 call!1317)))

(declare-fun bm!1321 () Bool)

(assert (=> bm!1321 (= call!1336 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3136 (_2!450 lt!6409)) (mask!4684 (_2!450 lt!6409))))))

(declare-fun bm!1322 () Bool)

(assert (=> bm!1322 (= call!1332 call!1336)))

(declare-fun b!21232 () Bool)

(declare-fun res!13703 () Bool)

(assert (=> b!21232 (= res!13703 call!1319)))

(assert (=> b!21232 (=> (not res!13703) (not e!13830))))

(declare-fun b!21233 () Bool)

(declare-fun c!2438 () Bool)

(assert (=> b!21233 (= c!2438 ((_ is MissingVacant!50) lt!6631))))

(declare-fun e!13834 () tuple2!894)

(assert (=> b!21233 (= e!13834 e!13822)))

(declare-fun bm!1323 () Bool)

(declare-fun call!1324 () ListLongMap!555)

(assert (=> bm!1323 (= call!1324 call!1326)))

(declare-fun b!21234 () Bool)

(declare-fun res!13707 () Bool)

(assert (=> b!21234 (= res!13707 (= (select (arr!567 (_keys!3136 (_2!450 lt!6409))) (index!2323 lt!6622)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21234 (=> (not res!13707) (not e!13825))))

(declare-fun b!21235 () Bool)

(declare-fun res!13702 () Bool)

(assert (=> b!21235 (=> (not res!13702) (not e!13828))))

(assert (=> b!21235 (= res!13702 call!1327)))

(assert (=> b!21235 (= e!13837 e!13828)))

(declare-fun bm!1324 () Bool)

(assert (=> bm!1324 (= call!1333 (updateHelperNewKey!6 (_2!450 lt!6409) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1642 (v!1564 (underlying!100 thiss!938))) (ite c!2438 (index!2323 lt!6631) (index!2320 lt!6631))))))

(declare-fun b!21236 () Bool)

(assert (=> b!21236 (= e!13828 (not call!1330))))

(declare-fun b!21237 () Bool)

(declare-fun Unit!461 () Unit!451)

(assert (=> b!21237 (= e!13826 Unit!461)))

(declare-fun lt!6625 () Unit!451)

(assert (=> b!21237 (= lt!6625 call!1334)))

(assert (=> b!21237 (= lt!6614 call!1335)))

(assert (=> b!21237 (= c!2441 ((_ is MissingZero!50) lt!6614))))

(assert (=> b!21237 e!13833))

(declare-fun lt!6638 () Unit!451)

(assert (=> b!21237 (= lt!6638 lt!6625)))

(assert (=> b!21237 false))

(declare-fun b!21238 () Bool)

(assert (=> b!21238 (= e!13835 (= (select (arr!567 (_keys!3136 (_2!450 lt!6409))) (index!2321 lt!6613)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!21239 () Bool)

(assert (=> b!21239 (= e!13827 e!13825)))

(declare-fun res!13709 () Bool)

(assert (=> b!21239 (= res!13709 call!1327)))

(assert (=> b!21239 (=> (not res!13709) (not e!13825))))

(declare-fun bm!1325 () Bool)

(assert (=> bm!1325 (= call!1331 (contains!223 call!1324 (ite c!2431 #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!567 (_keys!3136 (_2!450 lt!6409))) (index!2321 lt!6631)))))))

(declare-fun bm!1326 () Bool)

(assert (=> bm!1326 (= call!1321 (lemmaInListMapThenSeekEntryOrOpenFindsIt!6 (_keys!3136 (_2!450 lt!6409)) (_values!1704 (_2!450 lt!6409)) (mask!4684 (_2!450 lt!6409)) (extraKeys!1618 (_2!450 lt!6409)) (zeroValue!1642 (_2!450 lt!6409)) (minValue!1642 (_2!450 lt!6409)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1714 (_2!450 lt!6409))))))

(declare-fun bm!1327 () Bool)

(assert (=> bm!1327 (= call!1329 call!1313)))

(declare-fun bm!1328 () Bool)

(assert (=> bm!1328 (= call!1334 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!6 (_keys!3136 (_2!450 lt!6409)) (_values!1704 (_2!450 lt!6409)) (mask!4684 (_2!450 lt!6409)) (extraKeys!1618 (_2!450 lt!6409)) (zeroValue!1642 (_2!450 lt!6409)) (minValue!1642 (_2!450 lt!6409)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1714 (_2!450 lt!6409))))))

(declare-fun b!21240 () Bool)

(declare-fun e!13824 () ListLongMap!555)

(assert (=> b!21240 (= e!13824 (getCurrentListMap!123 (_keys!3136 (_2!450 lt!6409)) (_values!1704 (_2!450 lt!6409)) (mask!4684 (_2!450 lt!6409)) (extraKeys!1618 (_2!450 lt!6409)) (zeroValue!1642 (_2!450 lt!6409)) (minValue!1642 (_2!450 lt!6409)) #b00000000000000000000000000000000 (defaultEntry!1714 (_2!450 lt!6409))))))

(declare-fun b!21241 () Bool)

(declare-fun lt!6632 () Unit!451)

(assert (=> b!21241 (= e!13826 lt!6632)))

(assert (=> b!21241 (= lt!6632 call!1321)))

(assert (=> b!21241 (= lt!6613 call!1335)))

(declare-fun res!13706 () Bool)

(assert (=> b!21241 (= res!13706 ((_ is Found!50) lt!6613))))

(assert (=> b!21241 (=> (not res!13706) (not e!13835))))

(assert (=> b!21241 e!13835))

(declare-fun b!21242 () Bool)

(declare-fun e!13838 () Bool)

(assert (=> b!21242 (= e!13821 e!13838)))

(declare-fun res!13712 () Bool)

(assert (=> b!21242 (= res!13712 (contains!223 call!1328 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!21242 (=> (not res!13712) (not e!13838))))

(declare-fun b!21243 () Bool)

(assert (=> b!21243 (= e!13839 e!13829)))

(declare-fun res!13708 () Bool)

(assert (=> b!21243 (= res!13708 call!1322)))

(assert (=> b!21243 (=> (not res!13708) (not e!13829))))

(declare-fun b!21244 () Bool)

(assert (=> b!21244 (= e!13824 call!1325)))

(declare-fun b!21245 () Bool)

(assert (=> b!21245 (= e!13830 (= (select (arr!567 (_keys!3136 (_2!450 lt!6409))) (index!2321 lt!6630)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1329 () Bool)

(assert (=> bm!1329 (= call!1319 call!1316)))

(declare-fun bm!1330 () Bool)

(declare-fun lt!6619 () (_ BitVec 32))

(assert (=> bm!1330 (= call!1314 (getCurrentListMap!123 (_keys!3136 (_2!450 lt!6409)) (ite c!2429 (_values!1704 (_2!450 lt!6409)) (array!1194 (store (arr!566 (_values!1704 (_2!450 lt!6409))) (index!2321 lt!6631) (ValueCellFull!296 (minValue!1642 (v!1564 (underlying!100 thiss!938))))) (size!659 (_values!1704 (_2!450 lt!6409))))) (mask!4684 (_2!450 lt!6409)) (ite c!2429 (ite c!2437 lt!6619 lt!6629) (extraKeys!1618 (_2!450 lt!6409))) (ite (and c!2429 c!2437) (minValue!1642 (v!1564 (underlying!100 thiss!938))) (zeroValue!1642 (_2!450 lt!6409))) (ite c!2429 (ite c!2437 (minValue!1642 (_2!450 lt!6409)) (minValue!1642 (v!1564 (underlying!100 thiss!938)))) (minValue!1642 (_2!450 lt!6409))) #b00000000000000000000000000000000 (defaultEntry!1714 (_2!450 lt!6409))))))

(declare-fun b!21246 () Bool)

(assert (=> b!21246 (= e!13820 e!13834)))

(assert (=> b!21246 (= lt!6631 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3136 (_2!450 lt!6409)) (mask!4684 (_2!450 lt!6409))))))

(assert (=> b!21246 (= c!2431 ((_ is Undefined!50) lt!6631))))

(declare-fun b!21247 () Bool)

(declare-fun lt!6616 () Unit!451)

(declare-fun lt!6617 () Unit!451)

(assert (=> b!21247 (= lt!6616 lt!6617)))

(assert (=> b!21247 (= call!1315 call!1318)))

(assert (=> b!21247 (= lt!6617 (lemmaChangeZeroKeyThenAddPairToListMap!6 (_keys!3136 (_2!450 lt!6409)) (_values!1704 (_2!450 lt!6409)) (mask!4684 (_2!450 lt!6409)) (extraKeys!1618 (_2!450 lt!6409)) lt!6619 (zeroValue!1642 (_2!450 lt!6409)) (minValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (_2!450 lt!6409)) (defaultEntry!1714 (_2!450 lt!6409))))))

(assert (=> b!21247 (= lt!6619 (bvor (extraKeys!1618 (_2!450 lt!6409)) #b00000000000000000000000000000001))))

(assert (=> b!21247 (= e!13823 (tuple2!895 true (LongMapFixedSize!179 (defaultEntry!1714 (_2!450 lt!6409)) (mask!4684 (_2!450 lt!6409)) (bvor (extraKeys!1618 (_2!450 lt!6409)) #b00000000000000000000000000000001) (minValue!1642 (v!1564 (underlying!100 thiss!938))) (minValue!1642 (_2!450 lt!6409)) (_size!129 (_2!450 lt!6409)) (_keys!3136 (_2!450 lt!6409)) (_values!1704 (_2!450 lt!6409)) (_vacant!129 (_2!450 lt!6409)))))))

(declare-fun b!21248 () Bool)

(assert (=> b!21248 (= e!13827 ((_ is Undefined!50) lt!6622))))

(declare-fun b!21249 () Bool)

(assert (=> b!21249 (= e!13838 (= call!1328 (+!40 call!1320 (tuple2!905 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1642 (v!1564 (underlying!100 thiss!938)))))))))

(declare-fun bm!1331 () Bool)

(assert (=> bm!1331 (= call!1323 (+!40 e!13824 (ite c!2429 (ite c!2437 (tuple2!905 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1642 (v!1564 (underlying!100 thiss!938)))) (tuple2!905 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1642 (v!1564 (underlying!100 thiss!938))))) (tuple2!905 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1642 (v!1564 (underlying!100 thiss!938)))))))))

(declare-fun c!2440 () Bool)

(assert (=> bm!1331 (= c!2440 c!2429)))

(declare-fun bm!1332 () Bool)

(assert (=> bm!1332 (= call!1313 (arrayContainsKey!0 (_keys!3136 (_2!450 lt!6409)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!21250 () Bool)

(declare-fun lt!6615 () Unit!451)

(assert (=> b!21250 (= lt!6615 e!13836)))

(assert (=> b!21250 (= c!2439 call!1331)))

(assert (=> b!21250 (= e!13834 (tuple2!895 false (_2!450 lt!6409)))))

(declare-fun bm!1333 () Bool)

(assert (=> bm!1333 (= call!1320 (map!394 (_2!450 lt!6409)))))

(assert (= (and d!3701 c!2429) b!21229))

(assert (= (and d!3701 (not c!2429)) b!21246))

(assert (= (and b!21229 c!2437) b!21247))

(assert (= (and b!21229 (not c!2437)) b!21212))

(assert (= (or b!21247 b!21212) bm!1314))

(assert (= (or b!21247 b!21212) bm!1317))

(assert (= (or b!21247 b!21212) bm!1312))

(assert (= (and b!21246 c!2431) b!21250))

(assert (= (and b!21246 (not c!2431)) b!21233))

(assert (= (and b!21250 c!2439) b!21225))

(assert (= (and b!21250 (not c!2439)) b!21231))

(assert (= (and b!21225 res!13700) b!21232))

(assert (= (and b!21232 res!13703) b!21245))

(assert (= (and b!21231 c!2430) b!21235))

(assert (= (and b!21231 (not c!2430)) b!21228))

(assert (= (and b!21235 res!13702) b!21223))

(assert (= (and b!21223 res!13704) b!21236))

(assert (= (and b!21228 c!2433) b!21239))

(assert (= (and b!21228 (not c!2433)) b!21248))

(assert (= (and b!21239 res!13709) b!21234))

(assert (= (and b!21234 res!13707) b!21217))

(assert (= (or b!21235 b!21239) bm!1319))

(assert (= (or b!21236 b!21217) bm!1310))

(assert (= (or b!21232 bm!1319) bm!1329))

(assert (= (or b!21225 b!21231) bm!1322))

(assert (= (and b!21233 c!2438) b!21216))

(assert (= (and b!21233 (not c!2438)) b!21230))

(assert (= (and b!21230 c!2434) b!21215))

(assert (= (and b!21230 (not c!2434)) b!21226))

(assert (= (and b!21226 c!2436) b!21241))

(assert (= (and b!21226 (not c!2436)) b!21237))

(assert (= (and b!21241 res!13706) b!21213))

(assert (= (and b!21213 res!13713) b!21238))

(assert (= (and b!21237 c!2441) b!21211))

(assert (= (and b!21237 (not c!2441)) b!21214))

(assert (= (and b!21211 res!13710) b!21219))

(assert (= (and b!21219 res!13701) b!21222))

(assert (= (and b!21214 c!2432) b!21243))

(assert (= (and b!21214 (not c!2432)) b!21227))

(assert (= (and b!21243 res!13708) b!21224))

(assert (= (and b!21224 res!13711) b!21220))

(assert (= (or b!21211 b!21243) bm!1313))

(assert (= (or b!21222 b!21220) bm!1327))

(assert (= (or b!21213 bm!1313) bm!1316))

(assert (= (or b!21241 b!21237) bm!1315))

(assert (= (or b!21216 b!21215) bm!1324))

(assert (= (or b!21231 b!21237) bm!1328))

(assert (= (or bm!1310 bm!1327) bm!1332))

(assert (= (or b!21250 b!21226) bm!1323))

(assert (= (or bm!1329 bm!1316) bm!1320))

(assert (= (or bm!1322 bm!1315) bm!1321))

(assert (= (or b!21225 b!21241) bm!1326))

(assert (= (or b!21250 b!21226) bm!1325))

(assert (= (or bm!1314 b!21226) bm!1330))

(assert (= (or bm!1317 bm!1323) bm!1311))

(assert (= (or bm!1312 b!21226) bm!1331))

(assert (= (and bm!1331 c!2440) b!21244))

(assert (= (and bm!1331 (not c!2440)) b!21240))

(assert (= (and d!3701 res!13705) b!21218))

(assert (= (and b!21218 c!2435) b!21242))

(assert (= (and b!21218 (not c!2435)) b!21221))

(assert (= (and b!21242 res!13712) b!21249))

(assert (= (or b!21242 b!21249 b!21221) bm!1318))

(assert (= (or b!21249 b!21221) bm!1333))

(declare-fun m!14781 () Bool)

(assert (=> b!21245 m!14781))

(declare-fun m!14783 () Bool)

(assert (=> b!21226 m!14783))

(declare-fun m!14785 () Bool)

(assert (=> b!21226 m!14785))

(declare-fun m!14787 () Bool)

(assert (=> b!21226 m!14787))

(declare-fun m!14789 () Bool)

(assert (=> b!21226 m!14789))

(assert (=> b!21226 m!14783))

(declare-fun m!14791 () Bool)

(assert (=> b!21226 m!14791))

(declare-fun m!14793 () Bool)

(assert (=> bm!1320 m!14793))

(declare-fun m!14795 () Bool)

(assert (=> bm!1325 m!14795))

(declare-fun m!14797 () Bool)

(assert (=> bm!1325 m!14797))

(declare-fun m!14799 () Bool)

(assert (=> d!3701 m!14799))

(declare-fun m!14801 () Bool)

(assert (=> d!3701 m!14801))

(declare-fun m!14803 () Bool)

(assert (=> b!21223 m!14803))

(declare-fun m!14805 () Bool)

(assert (=> bm!1326 m!14805))

(declare-fun m!14807 () Bool)

(assert (=> b!21238 m!14807))

(declare-fun m!14809 () Bool)

(assert (=> bm!1324 m!14809))

(declare-fun m!14811 () Bool)

(assert (=> b!21247 m!14811))

(declare-fun m!14813 () Bool)

(assert (=> bm!1331 m!14813))

(assert (=> bm!1330 m!14787))

(declare-fun m!14815 () Bool)

(assert (=> bm!1330 m!14815))

(declare-fun m!14817 () Bool)

(assert (=> b!21242 m!14817))

(declare-fun m!14819 () Bool)

(assert (=> b!21212 m!14819))

(declare-fun m!14821 () Bool)

(assert (=> bm!1321 m!14821))

(declare-fun m!14823 () Bool)

(assert (=> b!21249 m!14823))

(declare-fun m!14825 () Bool)

(assert (=> bm!1328 m!14825))

(declare-fun m!14827 () Bool)

(assert (=> bm!1333 m!14827))

(declare-fun m!14829 () Bool)

(assert (=> bm!1318 m!14829))

(declare-fun m!14831 () Bool)

(assert (=> b!21219 m!14831))

(declare-fun m!14833 () Bool)

(assert (=> bm!1311 m!14833))

(assert (=> b!21240 m!14783))

(declare-fun m!14835 () Bool)

(assert (=> b!21224 m!14835))

(assert (=> b!21246 m!14821))

(declare-fun m!14837 () Bool)

(assert (=> b!21234 m!14837))

(declare-fun m!14839 () Bool)

(assert (=> bm!1332 m!14839))

(assert (=> b!20938 d!3701))

(declare-fun mapNonEmpty!973 () Bool)

(declare-fun mapRes!973 () Bool)

(declare-fun tp!3430 () Bool)

(declare-fun e!13844 () Bool)

(assert (=> mapNonEmpty!973 (= mapRes!973 (and tp!3430 e!13844))))

(declare-fun mapRest!973 () (Array (_ BitVec 32) ValueCell!296))

(declare-fun mapValue!973 () ValueCell!296)

(declare-fun mapKey!973 () (_ BitVec 32))

(assert (=> mapNonEmpty!973 (= mapRest!964 (store mapRest!973 mapKey!973 mapValue!973))))

(declare-fun b!21258 () Bool)

(declare-fun e!13845 () Bool)

(assert (=> b!21258 (= e!13845 tp_is_empty!991)))

(declare-fun mapIsEmpty!973 () Bool)

(assert (=> mapIsEmpty!973 mapRes!973))

(declare-fun condMapEmpty!973 () Bool)

(declare-fun mapDefault!973 () ValueCell!296)

(assert (=> mapNonEmpty!964 (= condMapEmpty!973 (= mapRest!964 ((as const (Array (_ BitVec 32) ValueCell!296)) mapDefault!973)))))

(assert (=> mapNonEmpty!964 (= tp!3415 (and e!13845 mapRes!973))))

(declare-fun b!21257 () Bool)

(assert (=> b!21257 (= e!13844 tp_is_empty!991)))

(assert (= (and mapNonEmpty!964 condMapEmpty!973) mapIsEmpty!973))

(assert (= (and mapNonEmpty!964 (not condMapEmpty!973)) mapNonEmpty!973))

(assert (= (and mapNonEmpty!973 ((_ is ValueCellFull!296) mapValue!973)) b!21257))

(assert (= (and mapNonEmpty!964 ((_ is ValueCellFull!296) mapDefault!973)) b!21258))

(declare-fun m!14841 () Bool)

(assert (=> mapNonEmpty!973 m!14841))

(declare-fun b_lambda!1505 () Bool)

(assert (= b_lambda!1503 (or (and b!20940 b_free!727) b_lambda!1505)))

(declare-fun b_lambda!1507 () Bool)

(assert (= b_lambda!1501 (or (and b!20940 b_free!727) b_lambda!1507)))

(check-sat (not bm!1308) (not d!3693) (not bm!1328) (not b!21202) (not b!21088) (not d!3697) (not b!21226) (not bm!1320) tp_is_empty!991 (not bm!1287) (not b!21078) (not b!21247) (not b!21172) (not bm!1296) (not b!21077) (not bm!1294) (not d!3701) (not b_lambda!1505) (not d!3699) (not b!21246) (not bm!1330) (not bm!1324) (not bm!1297) (not b!21242) (not d!3685) (not bm!1304) (not bm!1302) (not b!21061) (not bm!1307) (not b!21212) (not bm!1332) (not bm!1309) (not bm!1306) (not b!21207) (not bm!1333) (not b!21249) (not b!21206) (not bm!1321) (not bm!1301) (not b!21240) (not b!21209) (not bm!1325) b_and!1413 (not bm!1318) (not d!3695) (not b!21079) (not b_next!727) (not bm!1300) (not b!21060) (not b_lambda!1507) (not bm!1326) (not b!21186) (not b!21059) (not mapNonEmpty!973) (not bm!1331) (not bm!1311) (not b!21200))
(check-sat b_and!1413 (not b_next!727))
