; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80102 () Bool)

(assert start!80102)

(declare-fun b!941406 () Bool)

(declare-fun b_free!17917 () Bool)

(declare-fun b_next!17917 () Bool)

(assert (=> b!941406 (= b_free!17917 (not b_next!17917))))

(declare-fun tp!62238 () Bool)

(declare-fun b_and!29303 () Bool)

(assert (=> b!941406 (= tp!62238 b_and!29303)))

(declare-fun b!941404 () Bool)

(declare-fun res!632847 () Bool)

(declare-fun e!529244 () Bool)

(assert (=> b!941404 (=> (not res!632847) (not e!529244))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32199 0))(
  ( (V!32200 (val!10263 Int)) )
))
(declare-datatypes ((ValueCell!9731 0))(
  ( (ValueCellFull!9731 (v!12793 V!32199)) (EmptyCell!9731) )
))
(declare-datatypes ((array!56769 0))(
  ( (array!56770 (arr!27317 (Array (_ BitVec 32) ValueCell!9731)) (size!27782 (_ BitVec 32))) )
))
(declare-datatypes ((array!56771 0))(
  ( (array!56772 (arr!27318 (Array (_ BitVec 32) (_ BitVec 64))) (size!27783 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4612 0))(
  ( (LongMapFixedSize!4613 (defaultEntry!5597 Int) (mask!27167 (_ BitVec 32)) (extraKeys!5329 (_ BitVec 32)) (zeroValue!5433 V!32199) (minValue!5433 V!32199) (_size!2361 (_ BitVec 32)) (_keys!10451 array!56771) (_values!5620 array!56769) (_vacant!2361 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4612)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9023 0))(
  ( (MissingZero!9023 (index!38463 (_ BitVec 32))) (Found!9023 (index!38464 (_ BitVec 32))) (Intermediate!9023 (undefined!9835 Bool) (index!38465 (_ BitVec 32)) (x!80809 (_ BitVec 32))) (Undefined!9023) (MissingVacant!9023 (index!38466 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56771 (_ BitVec 32)) SeekEntryResult!9023)

(assert (=> b!941404 (= res!632847 (not ((_ is Found!9023) (seekEntry!0 key!756 (_keys!10451 thiss!1141) (mask!27167 thiss!1141)))))))

(declare-fun b!941405 () Bool)

(assert (=> b!941405 (= e!529244 (and (= (size!27782 (_values!5620 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27167 thiss!1141))) (= (size!27783 (_keys!10451 thiss!1141)) (size!27782 (_values!5620 thiss!1141))) (bvslt (mask!27167 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun e!529249 () Bool)

(declare-fun tp_is_empty!20425 () Bool)

(declare-fun e!529248 () Bool)

(declare-fun array_inv!21298 (array!56771) Bool)

(declare-fun array_inv!21299 (array!56769) Bool)

(assert (=> b!941406 (= e!529248 (and tp!62238 tp_is_empty!20425 (array_inv!21298 (_keys!10451 thiss!1141)) (array_inv!21299 (_values!5620 thiss!1141)) e!529249))))

(declare-fun b!941407 () Bool)

(declare-fun res!632845 () Bool)

(assert (=> b!941407 (=> (not res!632845) (not e!529244))))

(assert (=> b!941407 (= res!632845 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32439 () Bool)

(declare-fun mapRes!32439 () Bool)

(declare-fun tp!62237 () Bool)

(declare-fun e!529247 () Bool)

(assert (=> mapNonEmpty!32439 (= mapRes!32439 (and tp!62237 e!529247))))

(declare-fun mapValue!32439 () ValueCell!9731)

(declare-fun mapKey!32439 () (_ BitVec 32))

(declare-fun mapRest!32439 () (Array (_ BitVec 32) ValueCell!9731))

(assert (=> mapNonEmpty!32439 (= (arr!27317 (_values!5620 thiss!1141)) (store mapRest!32439 mapKey!32439 mapValue!32439))))

(declare-fun res!632848 () Bool)

(assert (=> start!80102 (=> (not res!632848) (not e!529244))))

(declare-fun valid!1776 (LongMapFixedSize!4612) Bool)

(assert (=> start!80102 (= res!632848 (valid!1776 thiss!1141))))

(assert (=> start!80102 e!529244))

(assert (=> start!80102 e!529248))

(assert (=> start!80102 true))

(declare-fun b!941408 () Bool)

(declare-fun e!529246 () Bool)

(assert (=> b!941408 (= e!529246 tp_is_empty!20425)))

(declare-fun mapIsEmpty!32439 () Bool)

(assert (=> mapIsEmpty!32439 mapRes!32439))

(declare-fun b!941409 () Bool)

(assert (=> b!941409 (= e!529247 tp_is_empty!20425)))

(declare-fun b!941410 () Bool)

(declare-fun res!632846 () Bool)

(assert (=> b!941410 (=> (not res!632846) (not e!529244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941410 (= res!632846 (validMask!0 (mask!27167 thiss!1141)))))

(declare-fun b!941411 () Bool)

(assert (=> b!941411 (= e!529249 (and e!529246 mapRes!32439))))

(declare-fun condMapEmpty!32439 () Bool)

(declare-fun mapDefault!32439 () ValueCell!9731)

(assert (=> b!941411 (= condMapEmpty!32439 (= (arr!27317 (_values!5620 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9731)) mapDefault!32439)))))

(assert (= (and start!80102 res!632848) b!941407))

(assert (= (and b!941407 res!632845) b!941404))

(assert (= (and b!941404 res!632847) b!941410))

(assert (= (and b!941410 res!632846) b!941405))

(assert (= (and b!941411 condMapEmpty!32439) mapIsEmpty!32439))

(assert (= (and b!941411 (not condMapEmpty!32439)) mapNonEmpty!32439))

(assert (= (and mapNonEmpty!32439 ((_ is ValueCellFull!9731) mapValue!32439)) b!941409))

(assert (= (and b!941411 ((_ is ValueCellFull!9731) mapDefault!32439)) b!941408))

(assert (= b!941406 b!941411))

(assert (= start!80102 b!941406))

(declare-fun m!875865 () Bool)

(assert (=> start!80102 m!875865))

(declare-fun m!875867 () Bool)

(assert (=> b!941404 m!875867))

(declare-fun m!875869 () Bool)

(assert (=> b!941406 m!875869))

(declare-fun m!875871 () Bool)

(assert (=> b!941406 m!875871))

(declare-fun m!875873 () Bool)

(assert (=> b!941410 m!875873))

(declare-fun m!875875 () Bool)

(assert (=> mapNonEmpty!32439 m!875875))

(check-sat tp_is_empty!20425 (not start!80102) (not b!941404) (not mapNonEmpty!32439) b_and!29303 (not b!941406) (not b!941410) (not b_next!17917))
(check-sat b_and!29303 (not b_next!17917))
(get-model)

(declare-fun d!113897 () Bool)

(assert (=> d!113897 (= (array_inv!21298 (_keys!10451 thiss!1141)) (bvsge (size!27783 (_keys!10451 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941406 d!113897))

(declare-fun d!113899 () Bool)

(assert (=> d!113899 (= (array_inv!21299 (_values!5620 thiss!1141)) (bvsge (size!27782 (_values!5620 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941406 d!113899))

(declare-fun d!113901 () Bool)

(declare-fun res!632879 () Bool)

(declare-fun e!529288 () Bool)

(assert (=> d!113901 (=> (not res!632879) (not e!529288))))

(declare-fun simpleValid!342 (LongMapFixedSize!4612) Bool)

(assert (=> d!113901 (= res!632879 (simpleValid!342 thiss!1141))))

(assert (=> d!113901 (= (valid!1776 thiss!1141) e!529288)))

(declare-fun b!941466 () Bool)

(declare-fun res!632880 () Bool)

(assert (=> b!941466 (=> (not res!632880) (not e!529288))))

(declare-fun arrayCountValidKeys!0 (array!56771 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941466 (= res!632880 (= (arrayCountValidKeys!0 (_keys!10451 thiss!1141) #b00000000000000000000000000000000 (size!27783 (_keys!10451 thiss!1141))) (_size!2361 thiss!1141)))))

(declare-fun b!941467 () Bool)

(declare-fun res!632881 () Bool)

(assert (=> b!941467 (=> (not res!632881) (not e!529288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56771 (_ BitVec 32)) Bool)

(assert (=> b!941467 (= res!632881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10451 thiss!1141) (mask!27167 thiss!1141)))))

(declare-fun b!941468 () Bool)

(declare-datatypes ((List!19218 0))(
  ( (Nil!19215) (Cons!19214 (h!20362 (_ BitVec 64)) (t!27524 List!19218)) )
))
(declare-fun arrayNoDuplicates!0 (array!56771 (_ BitVec 32) List!19218) Bool)

(assert (=> b!941468 (= e!529288 (arrayNoDuplicates!0 (_keys!10451 thiss!1141) #b00000000000000000000000000000000 Nil!19215))))

(assert (= (and d!113901 res!632879) b!941466))

(assert (= (and b!941466 res!632880) b!941467))

(assert (= (and b!941467 res!632881) b!941468))

(declare-fun m!875901 () Bool)

(assert (=> d!113901 m!875901))

(declare-fun m!875903 () Bool)

(assert (=> b!941466 m!875903))

(declare-fun m!875905 () Bool)

(assert (=> b!941467 m!875905))

(declare-fun m!875907 () Bool)

(assert (=> b!941468 m!875907))

(assert (=> start!80102 d!113901))

(declare-fun d!113903 () Bool)

(assert (=> d!113903 (= (validMask!0 (mask!27167 thiss!1141)) (and (or (= (mask!27167 thiss!1141) #b00000000000000000000000000000111) (= (mask!27167 thiss!1141) #b00000000000000000000000000001111) (= (mask!27167 thiss!1141) #b00000000000000000000000000011111) (= (mask!27167 thiss!1141) #b00000000000000000000000000111111) (= (mask!27167 thiss!1141) #b00000000000000000000000001111111) (= (mask!27167 thiss!1141) #b00000000000000000000000011111111) (= (mask!27167 thiss!1141) #b00000000000000000000000111111111) (= (mask!27167 thiss!1141) #b00000000000000000000001111111111) (= (mask!27167 thiss!1141) #b00000000000000000000011111111111) (= (mask!27167 thiss!1141) #b00000000000000000000111111111111) (= (mask!27167 thiss!1141) #b00000000000000000001111111111111) (= (mask!27167 thiss!1141) #b00000000000000000011111111111111) (= (mask!27167 thiss!1141) #b00000000000000000111111111111111) (= (mask!27167 thiss!1141) #b00000000000000001111111111111111) (= (mask!27167 thiss!1141) #b00000000000000011111111111111111) (= (mask!27167 thiss!1141) #b00000000000000111111111111111111) (= (mask!27167 thiss!1141) #b00000000000001111111111111111111) (= (mask!27167 thiss!1141) #b00000000000011111111111111111111) (= (mask!27167 thiss!1141) #b00000000000111111111111111111111) (= (mask!27167 thiss!1141) #b00000000001111111111111111111111) (= (mask!27167 thiss!1141) #b00000000011111111111111111111111) (= (mask!27167 thiss!1141) #b00000000111111111111111111111111) (= (mask!27167 thiss!1141) #b00000001111111111111111111111111) (= (mask!27167 thiss!1141) #b00000011111111111111111111111111) (= (mask!27167 thiss!1141) #b00000111111111111111111111111111) (= (mask!27167 thiss!1141) #b00001111111111111111111111111111) (= (mask!27167 thiss!1141) #b00011111111111111111111111111111) (= (mask!27167 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27167 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!941410 d!113903))

(declare-fun b!941481 () Bool)

(declare-fun e!529296 () SeekEntryResult!9023)

(declare-fun lt!424790 () SeekEntryResult!9023)

(assert (=> b!941481 (= e!529296 (MissingZero!9023 (index!38465 lt!424790)))))

(declare-fun b!941482 () Bool)

(declare-fun lt!424793 () SeekEntryResult!9023)

(assert (=> b!941482 (= e!529296 (ite ((_ is MissingVacant!9023) lt!424793) (MissingZero!9023 (index!38466 lt!424793)) lt!424793))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56771 (_ BitVec 32)) SeekEntryResult!9023)

(assert (=> b!941482 (= lt!424793 (seekKeyOrZeroReturnVacant!0 (x!80809 lt!424790) (index!38465 lt!424790) (index!38465 lt!424790) key!756 (_keys!10451 thiss!1141) (mask!27167 thiss!1141)))))

(declare-fun d!113905 () Bool)

(declare-fun lt!424791 () SeekEntryResult!9023)

(assert (=> d!113905 (and (or ((_ is MissingVacant!9023) lt!424791) (not ((_ is Found!9023) lt!424791)) (and (bvsge (index!38464 lt!424791) #b00000000000000000000000000000000) (bvslt (index!38464 lt!424791) (size!27783 (_keys!10451 thiss!1141))))) (not ((_ is MissingVacant!9023) lt!424791)) (or (not ((_ is Found!9023) lt!424791)) (= (select (arr!27318 (_keys!10451 thiss!1141)) (index!38464 lt!424791)) key!756)))))

(declare-fun e!529295 () SeekEntryResult!9023)

(assert (=> d!113905 (= lt!424791 e!529295)))

(declare-fun c!98056 () Bool)

(assert (=> d!113905 (= c!98056 (and ((_ is Intermediate!9023) lt!424790) (undefined!9835 lt!424790)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56771 (_ BitVec 32)) SeekEntryResult!9023)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!113905 (= lt!424790 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27167 thiss!1141)) key!756 (_keys!10451 thiss!1141) (mask!27167 thiss!1141)))))

(assert (=> d!113905 (validMask!0 (mask!27167 thiss!1141))))

(assert (=> d!113905 (= (seekEntry!0 key!756 (_keys!10451 thiss!1141) (mask!27167 thiss!1141)) lt!424791)))

(declare-fun b!941483 () Bool)

(declare-fun e!529297 () SeekEntryResult!9023)

(assert (=> b!941483 (= e!529295 e!529297)))

(declare-fun lt!424792 () (_ BitVec 64))

(assert (=> b!941483 (= lt!424792 (select (arr!27318 (_keys!10451 thiss!1141)) (index!38465 lt!424790)))))

(declare-fun c!98055 () Bool)

(assert (=> b!941483 (= c!98055 (= lt!424792 key!756))))

(declare-fun b!941484 () Bool)

(declare-fun c!98057 () Bool)

(assert (=> b!941484 (= c!98057 (= lt!424792 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!941484 (= e!529297 e!529296)))

(declare-fun b!941485 () Bool)

(assert (=> b!941485 (= e!529295 Undefined!9023)))

(declare-fun b!941486 () Bool)

(assert (=> b!941486 (= e!529297 (Found!9023 (index!38465 lt!424790)))))

(assert (= (and d!113905 c!98056) b!941485))

(assert (= (and d!113905 (not c!98056)) b!941483))

(assert (= (and b!941483 c!98055) b!941486))

(assert (= (and b!941483 (not c!98055)) b!941484))

(assert (= (and b!941484 c!98057) b!941481))

(assert (= (and b!941484 (not c!98057)) b!941482))

(declare-fun m!875909 () Bool)

(assert (=> b!941482 m!875909))

(declare-fun m!875911 () Bool)

(assert (=> d!113905 m!875911))

(declare-fun m!875913 () Bool)

(assert (=> d!113905 m!875913))

(assert (=> d!113905 m!875913))

(declare-fun m!875915 () Bool)

(assert (=> d!113905 m!875915))

(assert (=> d!113905 m!875873))

(declare-fun m!875917 () Bool)

(assert (=> b!941483 m!875917))

(assert (=> b!941404 d!113905))

(declare-fun b!941494 () Bool)

(declare-fun e!529302 () Bool)

(assert (=> b!941494 (= e!529302 tp_is_empty!20425)))

(declare-fun mapIsEmpty!32448 () Bool)

(declare-fun mapRes!32448 () Bool)

(assert (=> mapIsEmpty!32448 mapRes!32448))

(declare-fun b!941493 () Bool)

(declare-fun e!529303 () Bool)

(assert (=> b!941493 (= e!529303 tp_is_empty!20425)))

(declare-fun mapNonEmpty!32448 () Bool)

(declare-fun tp!62253 () Bool)

(assert (=> mapNonEmpty!32448 (= mapRes!32448 (and tp!62253 e!529303))))

(declare-fun mapRest!32448 () (Array (_ BitVec 32) ValueCell!9731))

(declare-fun mapValue!32448 () ValueCell!9731)

(declare-fun mapKey!32448 () (_ BitVec 32))

(assert (=> mapNonEmpty!32448 (= mapRest!32439 (store mapRest!32448 mapKey!32448 mapValue!32448))))

(declare-fun condMapEmpty!32448 () Bool)

(declare-fun mapDefault!32448 () ValueCell!9731)

(assert (=> mapNonEmpty!32439 (= condMapEmpty!32448 (= mapRest!32439 ((as const (Array (_ BitVec 32) ValueCell!9731)) mapDefault!32448)))))

(assert (=> mapNonEmpty!32439 (= tp!62237 (and e!529302 mapRes!32448))))

(assert (= (and mapNonEmpty!32439 condMapEmpty!32448) mapIsEmpty!32448))

(assert (= (and mapNonEmpty!32439 (not condMapEmpty!32448)) mapNonEmpty!32448))

(assert (= (and mapNonEmpty!32448 ((_ is ValueCellFull!9731) mapValue!32448)) b!941493))

(assert (= (and mapNonEmpty!32439 ((_ is ValueCellFull!9731) mapDefault!32448)) b!941494))

(declare-fun m!875919 () Bool)

(assert (=> mapNonEmpty!32448 m!875919))

(check-sat (not b!941467) tp_is_empty!20425 (not b!941468) (not d!113901) (not d!113905) b_and!29303 (not b!941482) (not b!941466) (not mapNonEmpty!32448) (not b_next!17917))
(check-sat b_and!29303 (not b_next!17917))
