; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80458 () Bool)

(assert start!80458)

(declare-fun b!945013 () Bool)

(declare-fun b_free!18091 () Bool)

(declare-fun b_next!18091 () Bool)

(assert (=> b!945013 (= b_free!18091 (not b_next!18091))))

(declare-fun tp!62787 () Bool)

(declare-fun b_and!29485 () Bool)

(assert (=> b!945013 (= tp!62787 b_and!29485)))

(declare-fun b!945008 () Bool)

(declare-fun e!531474 () Bool)

(declare-fun e!531477 () Bool)

(declare-fun mapRes!32728 () Bool)

(assert (=> b!945008 (= e!531474 (and e!531477 mapRes!32728))))

(declare-fun condMapEmpty!32728 () Bool)

(declare-datatypes ((V!32431 0))(
  ( (V!32432 (val!10350 Int)) )
))
(declare-datatypes ((ValueCell!9818 0))(
  ( (ValueCellFull!9818 (v!12882 V!32431)) (EmptyCell!9818) )
))
(declare-datatypes ((array!57133 0))(
  ( (array!57134 (arr!27491 (Array (_ BitVec 32) ValueCell!9818)) (size!27960 (_ BitVec 32))) )
))
(declare-datatypes ((array!57135 0))(
  ( (array!57136 (arr!27492 (Array (_ BitVec 32) (_ BitVec 64))) (size!27961 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4786 0))(
  ( (LongMapFixedSize!4787 (defaultEntry!5689 Int) (mask!27347 (_ BitVec 32)) (extraKeys!5421 (_ BitVec 32)) (zeroValue!5525 V!32431) (minValue!5525 V!32431) (_size!2448 (_ BitVec 32)) (_keys!10563 array!57135) (_values!5712 array!57133) (_vacant!2448 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4786)

(declare-fun mapDefault!32728 () ValueCell!9818)

(assert (=> b!945008 (= condMapEmpty!32728 (= (arr!27491 (_values!5712 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9818)) mapDefault!32728)))))

(declare-fun b!945009 () Bool)

(declare-fun tp_is_empty!20599 () Bool)

(assert (=> b!945009 (= e!531477 tp_is_empty!20599)))

(declare-fun b!945010 () Bool)

(declare-fun e!531476 () Bool)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13554 0))(
  ( (tuple2!13555 (_1!6788 (_ BitVec 64)) (_2!6788 V!32431)) )
))
(declare-datatypes ((List!19293 0))(
  ( (Nil!19290) (Cons!19289 (h!20440 tuple2!13554) (t!27603 List!19293)) )
))
(declare-datatypes ((ListLongMap!12241 0))(
  ( (ListLongMap!12242 (toList!6136 List!19293)) )
))
(declare-fun contains!5152 (ListLongMap!12241 (_ BitVec 64)) Bool)

(declare-fun map!13018 (LongMapFixedSize!4786) ListLongMap!12241)

(assert (=> b!945010 (= e!531476 (not (= (not (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (contains!5152 (map!13018 thiss!1141) key!756))))))

(declare-fun mapNonEmpty!32728 () Bool)

(declare-fun tp!62788 () Bool)

(declare-fun e!531475 () Bool)

(assert (=> mapNonEmpty!32728 (= mapRes!32728 (and tp!62788 e!531475))))

(declare-fun mapRest!32728 () (Array (_ BitVec 32) ValueCell!9818))

(declare-fun mapValue!32728 () ValueCell!9818)

(declare-fun mapKey!32728 () (_ BitVec 32))

(assert (=> mapNonEmpty!32728 (= (arr!27491 (_values!5712 thiss!1141)) (store mapRest!32728 mapKey!32728 mapValue!32728))))

(declare-fun mapIsEmpty!32728 () Bool)

(assert (=> mapIsEmpty!32728 mapRes!32728))

(declare-fun b!945011 () Bool)

(declare-fun res!634795 () Bool)

(assert (=> b!945011 (=> (not res!634795) (not e!531476))))

(assert (=> b!945011 (= res!634795 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!945012 () Bool)

(assert (=> b!945012 (= e!531475 tp_is_empty!20599)))

(declare-fun e!531478 () Bool)

(declare-fun array_inv!21408 (array!57135) Bool)

(declare-fun array_inv!21409 (array!57133) Bool)

(assert (=> b!945013 (= e!531478 (and tp!62787 tp_is_empty!20599 (array_inv!21408 (_keys!10563 thiss!1141)) (array_inv!21409 (_values!5712 thiss!1141)) e!531474))))

(declare-fun res!634794 () Bool)

(assert (=> start!80458 (=> (not res!634794) (not e!531476))))

(declare-fun valid!1828 (LongMapFixedSize!4786) Bool)

(assert (=> start!80458 (= res!634794 (valid!1828 thiss!1141))))

(assert (=> start!80458 e!531476))

(assert (=> start!80458 e!531478))

(assert (=> start!80458 true))

(assert (= (and start!80458 res!634794) b!945011))

(assert (= (and b!945011 res!634795) b!945010))

(assert (= (and b!945008 condMapEmpty!32728) mapIsEmpty!32728))

(assert (= (and b!945008 (not condMapEmpty!32728)) mapNonEmpty!32728))

(get-info :version)

(assert (= (and mapNonEmpty!32728 ((_ is ValueCellFull!9818) mapValue!32728)) b!945012))

(assert (= (and b!945008 ((_ is ValueCellFull!9818) mapDefault!32728)) b!945009))

(assert (= b!945013 b!945008))

(assert (= start!80458 b!945013))

(declare-fun m!878365 () Bool)

(assert (=> b!945010 m!878365))

(assert (=> b!945010 m!878365))

(declare-fun m!878367 () Bool)

(assert (=> b!945010 m!878367))

(declare-fun m!878369 () Bool)

(assert (=> mapNonEmpty!32728 m!878369))

(declare-fun m!878371 () Bool)

(assert (=> b!945013 m!878371))

(declare-fun m!878373 () Bool)

(assert (=> b!945013 m!878373))

(declare-fun m!878375 () Bool)

(assert (=> start!80458 m!878375))

(check-sat (not b!945013) (not b!945010) (not b_next!18091) (not start!80458) tp_is_empty!20599 b_and!29485 (not mapNonEmpty!32728))
(check-sat b_and!29485 (not b_next!18091))
(get-model)

(declare-fun d!114177 () Bool)

(declare-fun e!531521 () Bool)

(assert (=> d!114177 e!531521))

(declare-fun res!634810 () Bool)

(assert (=> d!114177 (=> res!634810 e!531521)))

(declare-fun lt!425704 () Bool)

(assert (=> d!114177 (= res!634810 (not lt!425704))))

(declare-fun lt!425705 () Bool)

(assert (=> d!114177 (= lt!425704 lt!425705)))

(declare-datatypes ((Unit!31760 0))(
  ( (Unit!31761) )
))
(declare-fun lt!425707 () Unit!31760)

(declare-fun e!531520 () Unit!31760)

(assert (=> d!114177 (= lt!425707 e!531520)))

(declare-fun c!98319 () Bool)

(assert (=> d!114177 (= c!98319 lt!425705)))

(declare-fun containsKey!454 (List!19293 (_ BitVec 64)) Bool)

(assert (=> d!114177 (= lt!425705 (containsKey!454 (toList!6136 (map!13018 thiss!1141)) key!756))))

(assert (=> d!114177 (= (contains!5152 (map!13018 thiss!1141) key!756) lt!425704)))

(declare-fun b!945056 () Bool)

(declare-fun lt!425706 () Unit!31760)

(assert (=> b!945056 (= e!531520 lt!425706)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!349 (List!19293 (_ BitVec 64)) Unit!31760)

(assert (=> b!945056 (= lt!425706 (lemmaContainsKeyImpliesGetValueByKeyDefined!349 (toList!6136 (map!13018 thiss!1141)) key!756))))

(declare-datatypes ((Option!496 0))(
  ( (Some!495 (v!12885 V!32431)) (None!494) )
))
(declare-fun isDefined!362 (Option!496) Bool)

(declare-fun getValueByKey!490 (List!19293 (_ BitVec 64)) Option!496)

(assert (=> b!945056 (isDefined!362 (getValueByKey!490 (toList!6136 (map!13018 thiss!1141)) key!756))))

(declare-fun b!945057 () Bool)

(declare-fun Unit!31762 () Unit!31760)

(assert (=> b!945057 (= e!531520 Unit!31762)))

(declare-fun b!945058 () Bool)

(assert (=> b!945058 (= e!531521 (isDefined!362 (getValueByKey!490 (toList!6136 (map!13018 thiss!1141)) key!756)))))

(assert (= (and d!114177 c!98319) b!945056))

(assert (= (and d!114177 (not c!98319)) b!945057))

(assert (= (and d!114177 (not res!634810)) b!945058))

(declare-fun m!878401 () Bool)

(assert (=> d!114177 m!878401))

(declare-fun m!878403 () Bool)

(assert (=> b!945056 m!878403))

(declare-fun m!878405 () Bool)

(assert (=> b!945056 m!878405))

(assert (=> b!945056 m!878405))

(declare-fun m!878407 () Bool)

(assert (=> b!945056 m!878407))

(assert (=> b!945058 m!878405))

(assert (=> b!945058 m!878405))

(assert (=> b!945058 m!878407))

(assert (=> b!945010 d!114177))

(declare-fun d!114179 () Bool)

(declare-fun getCurrentListMap!3299 (array!57135 array!57133 (_ BitVec 32) (_ BitVec 32) V!32431 V!32431 (_ BitVec 32) Int) ListLongMap!12241)

(assert (=> d!114179 (= (map!13018 thiss!1141) (getCurrentListMap!3299 (_keys!10563 thiss!1141) (_values!5712 thiss!1141) (mask!27347 thiss!1141) (extraKeys!5421 thiss!1141) (zeroValue!5525 thiss!1141) (minValue!5525 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5689 thiss!1141)))))

(declare-fun bs!26542 () Bool)

(assert (= bs!26542 d!114179))

(declare-fun m!878409 () Bool)

(assert (=> bs!26542 m!878409))

(assert (=> b!945010 d!114179))

(declare-fun d!114181 () Bool)

(declare-fun res!634817 () Bool)

(declare-fun e!531524 () Bool)

(assert (=> d!114181 (=> (not res!634817) (not e!531524))))

(declare-fun simpleValid!350 (LongMapFixedSize!4786) Bool)

(assert (=> d!114181 (= res!634817 (simpleValid!350 thiss!1141))))

(assert (=> d!114181 (= (valid!1828 thiss!1141) e!531524)))

(declare-fun b!945065 () Bool)

(declare-fun res!634818 () Bool)

(assert (=> b!945065 (=> (not res!634818) (not e!531524))))

(declare-fun arrayCountValidKeys!0 (array!57135 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945065 (= res!634818 (= (arrayCountValidKeys!0 (_keys!10563 thiss!1141) #b00000000000000000000000000000000 (size!27961 (_keys!10563 thiss!1141))) (_size!2448 thiss!1141)))))

(declare-fun b!945066 () Bool)

(declare-fun res!634819 () Bool)

(assert (=> b!945066 (=> (not res!634819) (not e!531524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57135 (_ BitVec 32)) Bool)

(assert (=> b!945066 (= res!634819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10563 thiss!1141) (mask!27347 thiss!1141)))))

(declare-fun b!945067 () Bool)

(declare-datatypes ((List!19295 0))(
  ( (Nil!19292) (Cons!19291 (h!20442 (_ BitVec 64)) (t!27605 List!19295)) )
))
(declare-fun arrayNoDuplicates!0 (array!57135 (_ BitVec 32) List!19295) Bool)

(assert (=> b!945067 (= e!531524 (arrayNoDuplicates!0 (_keys!10563 thiss!1141) #b00000000000000000000000000000000 Nil!19292))))

(assert (= (and d!114181 res!634817) b!945065))

(assert (= (and b!945065 res!634818) b!945066))

(assert (= (and b!945066 res!634819) b!945067))

(declare-fun m!878411 () Bool)

(assert (=> d!114181 m!878411))

(declare-fun m!878413 () Bool)

(assert (=> b!945065 m!878413))

(declare-fun m!878415 () Bool)

(assert (=> b!945066 m!878415))

(declare-fun m!878417 () Bool)

(assert (=> b!945067 m!878417))

(assert (=> start!80458 d!114181))

(declare-fun d!114183 () Bool)

(assert (=> d!114183 (= (array_inv!21408 (_keys!10563 thiss!1141)) (bvsge (size!27961 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945013 d!114183))

(declare-fun d!114185 () Bool)

(assert (=> d!114185 (= (array_inv!21409 (_values!5712 thiss!1141)) (bvsge (size!27960 (_values!5712 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945013 d!114185))

(declare-fun condMapEmpty!32737 () Bool)

(declare-fun mapDefault!32737 () ValueCell!9818)

(assert (=> mapNonEmpty!32728 (= condMapEmpty!32737 (= mapRest!32728 ((as const (Array (_ BitVec 32) ValueCell!9818)) mapDefault!32737)))))

(declare-fun e!531529 () Bool)

(declare-fun mapRes!32737 () Bool)

(assert (=> mapNonEmpty!32728 (= tp!62788 (and e!531529 mapRes!32737))))

(declare-fun b!945074 () Bool)

(declare-fun e!531530 () Bool)

(assert (=> b!945074 (= e!531530 tp_is_empty!20599)))

(declare-fun mapIsEmpty!32737 () Bool)

(assert (=> mapIsEmpty!32737 mapRes!32737))

(declare-fun b!945075 () Bool)

(assert (=> b!945075 (= e!531529 tp_is_empty!20599)))

(declare-fun mapNonEmpty!32737 () Bool)

(declare-fun tp!62803 () Bool)

(assert (=> mapNonEmpty!32737 (= mapRes!32737 (and tp!62803 e!531530))))

(declare-fun mapRest!32737 () (Array (_ BitVec 32) ValueCell!9818))

(declare-fun mapValue!32737 () ValueCell!9818)

(declare-fun mapKey!32737 () (_ BitVec 32))

(assert (=> mapNonEmpty!32737 (= mapRest!32728 (store mapRest!32737 mapKey!32737 mapValue!32737))))

(assert (= (and mapNonEmpty!32728 condMapEmpty!32737) mapIsEmpty!32737))

(assert (= (and mapNonEmpty!32728 (not condMapEmpty!32737)) mapNonEmpty!32737))

(assert (= (and mapNonEmpty!32737 ((_ is ValueCellFull!9818) mapValue!32737)) b!945074))

(assert (= (and mapNonEmpty!32728 ((_ is ValueCellFull!9818) mapDefault!32737)) b!945075))

(declare-fun m!878419 () Bool)

(assert (=> mapNonEmpty!32737 m!878419))

(check-sat (not mapNonEmpty!32737) (not b!945058) (not b!945056) b_and!29485 tp_is_empty!20599 (not b!945066) (not d!114179) (not b!945065) (not d!114181) (not b_next!18091) (not b!945067) (not d!114177))
(check-sat b_and!29485 (not b_next!18091))
(get-model)

(declare-fun d!114187 () Bool)

(declare-fun res!634824 () Bool)

(declare-fun e!531535 () Bool)

(assert (=> d!114187 (=> res!634824 e!531535)))

(assert (=> d!114187 (= res!634824 (and ((_ is Cons!19289) (toList!6136 (map!13018 thiss!1141))) (= (_1!6788 (h!20440 (toList!6136 (map!13018 thiss!1141)))) key!756)))))

(assert (=> d!114187 (= (containsKey!454 (toList!6136 (map!13018 thiss!1141)) key!756) e!531535)))

(declare-fun b!945080 () Bool)

(declare-fun e!531536 () Bool)

(assert (=> b!945080 (= e!531535 e!531536)))

(declare-fun res!634825 () Bool)

(assert (=> b!945080 (=> (not res!634825) (not e!531536))))

(assert (=> b!945080 (= res!634825 (and (or (not ((_ is Cons!19289) (toList!6136 (map!13018 thiss!1141)))) (bvsle (_1!6788 (h!20440 (toList!6136 (map!13018 thiss!1141)))) key!756)) ((_ is Cons!19289) (toList!6136 (map!13018 thiss!1141))) (bvslt (_1!6788 (h!20440 (toList!6136 (map!13018 thiss!1141)))) key!756)))))

(declare-fun b!945081 () Bool)

(assert (=> b!945081 (= e!531536 (containsKey!454 (t!27603 (toList!6136 (map!13018 thiss!1141))) key!756))))

(assert (= (and d!114187 (not res!634824)) b!945080))

(assert (= (and b!945080 res!634825) b!945081))

(declare-fun m!878421 () Bool)

(assert (=> b!945081 m!878421))

(assert (=> d!114177 d!114187))

(declare-fun b!945090 () Bool)

(declare-fun e!531542 () (_ BitVec 32))

(declare-fun call!41005 () (_ BitVec 32))

(assert (=> b!945090 (= e!531542 call!41005)))

(declare-fun bm!41002 () Bool)

(assert (=> bm!41002 (= call!41005 (arrayCountValidKeys!0 (_keys!10563 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27961 (_keys!10563 thiss!1141))))))

(declare-fun d!114189 () Bool)

(declare-fun lt!425710 () (_ BitVec 32))

(assert (=> d!114189 (and (bvsge lt!425710 #b00000000000000000000000000000000) (bvsle lt!425710 (bvsub (size!27961 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!531541 () (_ BitVec 32))

(assert (=> d!114189 (= lt!425710 e!531541)))

(declare-fun c!98325 () Bool)

(assert (=> d!114189 (= c!98325 (bvsge #b00000000000000000000000000000000 (size!27961 (_keys!10563 thiss!1141))))))

(assert (=> d!114189 (and (bvsle #b00000000000000000000000000000000 (size!27961 (_keys!10563 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27961 (_keys!10563 thiss!1141)) (size!27961 (_keys!10563 thiss!1141))))))

(assert (=> d!114189 (= (arrayCountValidKeys!0 (_keys!10563 thiss!1141) #b00000000000000000000000000000000 (size!27961 (_keys!10563 thiss!1141))) lt!425710)))

(declare-fun b!945091 () Bool)

(assert (=> b!945091 (= e!531541 #b00000000000000000000000000000000)))

(declare-fun b!945092 () Bool)

(assert (=> b!945092 (= e!531542 (bvadd #b00000000000000000000000000000001 call!41005))))

(declare-fun b!945093 () Bool)

(assert (=> b!945093 (= e!531541 e!531542)))

(declare-fun c!98324 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!945093 (= c!98324 (validKeyInArray!0 (select (arr!27492 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114189 c!98325) b!945091))

(assert (= (and d!114189 (not c!98325)) b!945093))

(assert (= (and b!945093 c!98324) b!945092))

(assert (= (and b!945093 (not c!98324)) b!945090))

(assert (= (or b!945092 b!945090) bm!41002))

(declare-fun m!878423 () Bool)

(assert (=> bm!41002 m!878423))

(declare-fun m!878425 () Bool)

(assert (=> b!945093 m!878425))

(assert (=> b!945093 m!878425))

(declare-fun m!878427 () Bool)

(assert (=> b!945093 m!878427))

(assert (=> b!945065 d!114189))

(declare-fun b!945103 () Bool)

(declare-fun res!634836 () Bool)

(declare-fun e!531545 () Bool)

(assert (=> b!945103 (=> (not res!634836) (not e!531545))))

(declare-fun size!27966 (LongMapFixedSize!4786) (_ BitVec 32))

(assert (=> b!945103 (= res!634836 (bvsge (size!27966 thiss!1141) (_size!2448 thiss!1141)))))

(declare-fun b!945104 () Bool)

(declare-fun res!634837 () Bool)

(assert (=> b!945104 (=> (not res!634837) (not e!531545))))

(assert (=> b!945104 (= res!634837 (= (size!27966 thiss!1141) (bvadd (_size!2448 thiss!1141) (bvsdiv (bvadd (extraKeys!5421 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!945105 () Bool)

(assert (=> b!945105 (= e!531545 (and (bvsge (extraKeys!5421 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5421 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2448 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun d!114191 () Bool)

(declare-fun res!634834 () Bool)

(assert (=> d!114191 (=> (not res!634834) (not e!531545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114191 (= res!634834 (validMask!0 (mask!27347 thiss!1141)))))

(assert (=> d!114191 (= (simpleValid!350 thiss!1141) e!531545)))

(declare-fun b!945102 () Bool)

(declare-fun res!634835 () Bool)

(assert (=> b!945102 (=> (not res!634835) (not e!531545))))

(assert (=> b!945102 (= res!634835 (and (= (size!27960 (_values!5712 thiss!1141)) (bvadd (mask!27347 thiss!1141) #b00000000000000000000000000000001)) (= (size!27961 (_keys!10563 thiss!1141)) (size!27960 (_values!5712 thiss!1141))) (bvsge (_size!2448 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2448 thiss!1141) (bvadd (mask!27347 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!114191 res!634834) b!945102))

(assert (= (and b!945102 res!634835) b!945103))

(assert (= (and b!945103 res!634836) b!945104))

(assert (= (and b!945104 res!634837) b!945105))

(declare-fun m!878429 () Bool)

(assert (=> b!945103 m!878429))

(assert (=> b!945104 m!878429))

(declare-fun m!878431 () Bool)

(assert (=> d!114191 m!878431))

(assert (=> d!114181 d!114191))

(declare-fun b!945114 () Bool)

(declare-fun e!531554 () Bool)

(declare-fun call!41008 () Bool)

(assert (=> b!945114 (= e!531554 call!41008)))

(declare-fun b!945116 () Bool)

(declare-fun e!531552 () Bool)

(assert (=> b!945116 (= e!531552 call!41008)))

(declare-fun bm!41005 () Bool)

(assert (=> bm!41005 (= call!41008 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10563 thiss!1141) (mask!27347 thiss!1141)))))

(declare-fun b!945117 () Bool)

(declare-fun e!531553 () Bool)

(assert (=> b!945117 (= e!531553 e!531552)))

(declare-fun c!98328 () Bool)

(assert (=> b!945117 (= c!98328 (validKeyInArray!0 (select (arr!27492 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114193 () Bool)

(declare-fun res!634843 () Bool)

(assert (=> d!114193 (=> res!634843 e!531553)))

(assert (=> d!114193 (= res!634843 (bvsge #b00000000000000000000000000000000 (size!27961 (_keys!10563 thiss!1141))))))

(assert (=> d!114193 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10563 thiss!1141) (mask!27347 thiss!1141)) e!531553)))

(declare-fun b!945115 () Bool)

(assert (=> b!945115 (= e!531552 e!531554)))

(declare-fun lt!425718 () (_ BitVec 64))

(assert (=> b!945115 (= lt!425718 (select (arr!27492 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425717 () Unit!31760)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57135 (_ BitVec 64) (_ BitVec 32)) Unit!31760)

(assert (=> b!945115 (= lt!425717 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10563 thiss!1141) lt!425718 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945115 (arrayContainsKey!0 (_keys!10563 thiss!1141) lt!425718 #b00000000000000000000000000000000)))

(declare-fun lt!425719 () Unit!31760)

(assert (=> b!945115 (= lt!425719 lt!425717)))

(declare-fun res!634842 () Bool)

(declare-datatypes ((SeekEntryResult!9078 0))(
  ( (MissingZero!9078 (index!38683 (_ BitVec 32))) (Found!9078 (index!38684 (_ BitVec 32))) (Intermediate!9078 (undefined!9890 Bool) (index!38685 (_ BitVec 32)) (x!81212 (_ BitVec 32))) (Undefined!9078) (MissingVacant!9078 (index!38686 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57135 (_ BitVec 32)) SeekEntryResult!9078)

(assert (=> b!945115 (= res!634842 (= (seekEntryOrOpen!0 (select (arr!27492 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000) (_keys!10563 thiss!1141) (mask!27347 thiss!1141)) (Found!9078 #b00000000000000000000000000000000)))))

(assert (=> b!945115 (=> (not res!634842) (not e!531554))))

(assert (= (and d!114193 (not res!634843)) b!945117))

(assert (= (and b!945117 c!98328) b!945115))

(assert (= (and b!945117 (not c!98328)) b!945116))

(assert (= (and b!945115 res!634842) b!945114))

(assert (= (or b!945114 b!945116) bm!41005))

(declare-fun m!878433 () Bool)

(assert (=> bm!41005 m!878433))

(assert (=> b!945117 m!878425))

(assert (=> b!945117 m!878425))

(assert (=> b!945117 m!878427))

(assert (=> b!945115 m!878425))

(declare-fun m!878435 () Bool)

(assert (=> b!945115 m!878435))

(declare-fun m!878437 () Bool)

(assert (=> b!945115 m!878437))

(assert (=> b!945115 m!878425))

(declare-fun m!878439 () Bool)

(assert (=> b!945115 m!878439))

(assert (=> b!945066 d!114193))

(declare-fun d!114195 () Bool)

(assert (=> d!114195 (isDefined!362 (getValueByKey!490 (toList!6136 (map!13018 thiss!1141)) key!756))))

(declare-fun lt!425722 () Unit!31760)

(declare-fun choose!1579 (List!19293 (_ BitVec 64)) Unit!31760)

(assert (=> d!114195 (= lt!425722 (choose!1579 (toList!6136 (map!13018 thiss!1141)) key!756))))

(declare-fun e!531557 () Bool)

(assert (=> d!114195 e!531557))

(declare-fun res!634846 () Bool)

(assert (=> d!114195 (=> (not res!634846) (not e!531557))))

(declare-fun isStrictlySorted!503 (List!19293) Bool)

(assert (=> d!114195 (= res!634846 (isStrictlySorted!503 (toList!6136 (map!13018 thiss!1141))))))

(assert (=> d!114195 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!349 (toList!6136 (map!13018 thiss!1141)) key!756) lt!425722)))

(declare-fun b!945120 () Bool)

(assert (=> b!945120 (= e!531557 (containsKey!454 (toList!6136 (map!13018 thiss!1141)) key!756))))

(assert (= (and d!114195 res!634846) b!945120))

(assert (=> d!114195 m!878405))

(assert (=> d!114195 m!878405))

(assert (=> d!114195 m!878407))

(declare-fun m!878441 () Bool)

(assert (=> d!114195 m!878441))

(declare-fun m!878443 () Bool)

(assert (=> d!114195 m!878443))

(assert (=> b!945120 m!878401))

(assert (=> b!945056 d!114195))

(declare-fun d!114197 () Bool)

(declare-fun isEmpty!708 (Option!496) Bool)

(assert (=> d!114197 (= (isDefined!362 (getValueByKey!490 (toList!6136 (map!13018 thiss!1141)) key!756)) (not (isEmpty!708 (getValueByKey!490 (toList!6136 (map!13018 thiss!1141)) key!756))))))

(declare-fun bs!26543 () Bool)

(assert (= bs!26543 d!114197))

(assert (=> bs!26543 m!878405))

(declare-fun m!878445 () Bool)

(assert (=> bs!26543 m!878445))

(assert (=> b!945056 d!114197))

(declare-fun b!945129 () Bool)

(declare-fun e!531562 () Option!496)

(assert (=> b!945129 (= e!531562 (Some!495 (_2!6788 (h!20440 (toList!6136 (map!13018 thiss!1141))))))))

(declare-fun d!114199 () Bool)

(declare-fun c!98333 () Bool)

(assert (=> d!114199 (= c!98333 (and ((_ is Cons!19289) (toList!6136 (map!13018 thiss!1141))) (= (_1!6788 (h!20440 (toList!6136 (map!13018 thiss!1141)))) key!756)))))

(assert (=> d!114199 (= (getValueByKey!490 (toList!6136 (map!13018 thiss!1141)) key!756) e!531562)))

(declare-fun b!945132 () Bool)

(declare-fun e!531563 () Option!496)

(assert (=> b!945132 (= e!531563 None!494)))

(declare-fun b!945131 () Bool)

(assert (=> b!945131 (= e!531563 (getValueByKey!490 (t!27603 (toList!6136 (map!13018 thiss!1141))) key!756))))

(declare-fun b!945130 () Bool)

(assert (=> b!945130 (= e!531562 e!531563)))

(declare-fun c!98334 () Bool)

(assert (=> b!945130 (= c!98334 (and ((_ is Cons!19289) (toList!6136 (map!13018 thiss!1141))) (not (= (_1!6788 (h!20440 (toList!6136 (map!13018 thiss!1141)))) key!756))))))

(assert (= (and d!114199 c!98333) b!945129))

(assert (= (and d!114199 (not c!98333)) b!945130))

(assert (= (and b!945130 c!98334) b!945131))

(assert (= (and b!945130 (not c!98334)) b!945132))

(declare-fun m!878447 () Bool)

(assert (=> b!945131 m!878447))

(assert (=> b!945056 d!114199))

(assert (=> b!945058 d!114197))

(assert (=> b!945058 d!114199))

(declare-fun b!945143 () Bool)

(declare-fun e!531573 () Bool)

(declare-fun call!41011 () Bool)

(assert (=> b!945143 (= e!531573 call!41011)))

(declare-fun b!945144 () Bool)

(assert (=> b!945144 (= e!531573 call!41011)))

(declare-fun b!945145 () Bool)

(declare-fun e!531572 () Bool)

(declare-fun contains!5154 (List!19295 (_ BitVec 64)) Bool)

(assert (=> b!945145 (= e!531572 (contains!5154 Nil!19292 (select (arr!27492 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41008 () Bool)

(declare-fun c!98337 () Bool)

(assert (=> bm!41008 (= call!41011 (arrayNoDuplicates!0 (_keys!10563 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98337 (Cons!19291 (select (arr!27492 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000) Nil!19292) Nil!19292)))))

(declare-fun d!114201 () Bool)

(declare-fun res!634853 () Bool)

(declare-fun e!531575 () Bool)

(assert (=> d!114201 (=> res!634853 e!531575)))

(assert (=> d!114201 (= res!634853 (bvsge #b00000000000000000000000000000000 (size!27961 (_keys!10563 thiss!1141))))))

(assert (=> d!114201 (= (arrayNoDuplicates!0 (_keys!10563 thiss!1141) #b00000000000000000000000000000000 Nil!19292) e!531575)))

(declare-fun b!945146 () Bool)

(declare-fun e!531574 () Bool)

(assert (=> b!945146 (= e!531575 e!531574)))

(declare-fun res!634854 () Bool)

(assert (=> b!945146 (=> (not res!634854) (not e!531574))))

(assert (=> b!945146 (= res!634854 (not e!531572))))

(declare-fun res!634855 () Bool)

(assert (=> b!945146 (=> (not res!634855) (not e!531572))))

(assert (=> b!945146 (= res!634855 (validKeyInArray!0 (select (arr!27492 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!945147 () Bool)

(assert (=> b!945147 (= e!531574 e!531573)))

(assert (=> b!945147 (= c!98337 (validKeyInArray!0 (select (arr!27492 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114201 (not res!634853)) b!945146))

(assert (= (and b!945146 res!634855) b!945145))

(assert (= (and b!945146 res!634854) b!945147))

(assert (= (and b!945147 c!98337) b!945143))

(assert (= (and b!945147 (not c!98337)) b!945144))

(assert (= (or b!945143 b!945144) bm!41008))

(assert (=> b!945145 m!878425))

(assert (=> b!945145 m!878425))

(declare-fun m!878449 () Bool)

(assert (=> b!945145 m!878449))

(assert (=> bm!41008 m!878425))

(declare-fun m!878451 () Bool)

(assert (=> bm!41008 m!878451))

(assert (=> b!945146 m!878425))

(assert (=> b!945146 m!878425))

(assert (=> b!945146 m!878427))

(assert (=> b!945147 m!878425))

(assert (=> b!945147 m!878425))

(assert (=> b!945147 m!878427))

(assert (=> b!945067 d!114201))

(declare-fun d!114203 () Bool)

(declare-fun e!531602 () Bool)

(assert (=> d!114203 e!531602))

(declare-fun res!634877 () Bool)

(assert (=> d!114203 (=> (not res!634877) (not e!531602))))

(assert (=> d!114203 (= res!634877 (or (bvsge #b00000000000000000000000000000000 (size!27961 (_keys!10563 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27961 (_keys!10563 thiss!1141))))))))

(declare-fun lt!425774 () ListLongMap!12241)

(declare-fun lt!425770 () ListLongMap!12241)

(assert (=> d!114203 (= lt!425774 lt!425770)))

(declare-fun lt!425768 () Unit!31760)

(declare-fun e!531613 () Unit!31760)

(assert (=> d!114203 (= lt!425768 e!531613)))

(declare-fun c!98355 () Bool)

(declare-fun e!531604 () Bool)

(assert (=> d!114203 (= c!98355 e!531604)))

(declare-fun res!634874 () Bool)

(assert (=> d!114203 (=> (not res!634874) (not e!531604))))

(assert (=> d!114203 (= res!634874 (bvslt #b00000000000000000000000000000000 (size!27961 (_keys!10563 thiss!1141))))))

(declare-fun e!531611 () ListLongMap!12241)

(assert (=> d!114203 (= lt!425770 e!531611)))

(declare-fun c!98353 () Bool)

(assert (=> d!114203 (= c!98353 (and (not (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114203 (validMask!0 (mask!27347 thiss!1141))))

(assert (=> d!114203 (= (getCurrentListMap!3299 (_keys!10563 thiss!1141) (_values!5712 thiss!1141) (mask!27347 thiss!1141) (extraKeys!5421 thiss!1141) (zeroValue!5525 thiss!1141) (minValue!5525 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5689 thiss!1141)) lt!425774)))

(declare-fun b!945190 () Bool)

(assert (=> b!945190 (= e!531604 (validKeyInArray!0 (select (arr!27492 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41023 () Bool)

(declare-fun call!41030 () ListLongMap!12241)

(declare-fun call!41027 () ListLongMap!12241)

(assert (=> bm!41023 (= call!41030 call!41027)))

(declare-fun bm!41024 () Bool)

(declare-fun call!41029 () ListLongMap!12241)

(declare-fun call!41028 () ListLongMap!12241)

(assert (=> bm!41024 (= call!41029 call!41028)))

(declare-fun b!945191 () Bool)

(declare-fun +!2871 (ListLongMap!12241 tuple2!13554) ListLongMap!12241)

(assert (=> b!945191 (= e!531611 (+!2871 call!41028 (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5525 thiss!1141))))))

(declare-fun b!945192 () Bool)

(declare-fun res!634881 () Bool)

(assert (=> b!945192 (=> (not res!634881) (not e!531602))))

(declare-fun e!531606 () Bool)

(assert (=> b!945192 (= res!634881 e!531606)))

(declare-fun res!634879 () Bool)

(assert (=> b!945192 (=> res!634879 e!531606)))

(declare-fun e!531610 () Bool)

(assert (=> b!945192 (= res!634879 (not e!531610))))

(declare-fun res!634876 () Bool)

(assert (=> b!945192 (=> (not res!634876) (not e!531610))))

(assert (=> b!945192 (= res!634876 (bvslt #b00000000000000000000000000000000 (size!27961 (_keys!10563 thiss!1141))))))

(declare-fun b!945193 () Bool)

(declare-fun e!531612 () Bool)

(declare-fun apply!861 (ListLongMap!12241 (_ BitVec 64)) V!32431)

(declare-fun get!14454 (ValueCell!9818 V!32431) V!32431)

(declare-fun dynLambda!1627 (Int (_ BitVec 64)) V!32431)

(assert (=> b!945193 (= e!531612 (= (apply!861 lt!425774 (select (arr!27492 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000)) (get!14454 (select (arr!27491 (_values!5712 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1627 (defaultEntry!5689 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!945193 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27960 (_values!5712 thiss!1141))))))

(assert (=> b!945193 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27961 (_keys!10563 thiss!1141))))))

(declare-fun b!945194 () Bool)

(declare-fun e!531609 () ListLongMap!12241)

(assert (=> b!945194 (= e!531611 e!531609)))

(declare-fun c!98350 () Bool)

(assert (=> b!945194 (= c!98350 (and (not (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!945195 () Bool)

(assert (=> b!945195 (= e!531609 call!41029)))

(declare-fun bm!41025 () Bool)

(declare-fun call!41026 () Bool)

(assert (=> bm!41025 (= call!41026 (contains!5152 lt!425774 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!41032 () ListLongMap!12241)

(declare-fun bm!41026 () Bool)

(assert (=> bm!41026 (= call!41028 (+!2871 (ite c!98353 call!41032 (ite c!98350 call!41027 call!41030)) (ite (or c!98353 c!98350) (tuple2!13555 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5525 thiss!1141)) (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5525 thiss!1141)))))))

(declare-fun b!945196 () Bool)

(declare-fun lt!425782 () Unit!31760)

(assert (=> b!945196 (= e!531613 lt!425782)))

(declare-fun lt!425788 () ListLongMap!12241)

(declare-fun getCurrentListMapNoExtraKeys!3343 (array!57135 array!57133 (_ BitVec 32) (_ BitVec 32) V!32431 V!32431 (_ BitVec 32) Int) ListLongMap!12241)

(assert (=> b!945196 (= lt!425788 (getCurrentListMapNoExtraKeys!3343 (_keys!10563 thiss!1141) (_values!5712 thiss!1141) (mask!27347 thiss!1141) (extraKeys!5421 thiss!1141) (zeroValue!5525 thiss!1141) (minValue!5525 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5689 thiss!1141)))))

(declare-fun lt!425767 () (_ BitVec 64))

(assert (=> b!945196 (= lt!425767 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425785 () (_ BitVec 64))

(assert (=> b!945196 (= lt!425785 (select (arr!27492 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425772 () Unit!31760)

(declare-fun addStillContains!560 (ListLongMap!12241 (_ BitVec 64) V!32431 (_ BitVec 64)) Unit!31760)

(assert (=> b!945196 (= lt!425772 (addStillContains!560 lt!425788 lt!425767 (zeroValue!5525 thiss!1141) lt!425785))))

(assert (=> b!945196 (contains!5152 (+!2871 lt!425788 (tuple2!13555 lt!425767 (zeroValue!5525 thiss!1141))) lt!425785)))

(declare-fun lt!425775 () Unit!31760)

(assert (=> b!945196 (= lt!425775 lt!425772)))

(declare-fun lt!425776 () ListLongMap!12241)

(assert (=> b!945196 (= lt!425776 (getCurrentListMapNoExtraKeys!3343 (_keys!10563 thiss!1141) (_values!5712 thiss!1141) (mask!27347 thiss!1141) (extraKeys!5421 thiss!1141) (zeroValue!5525 thiss!1141) (minValue!5525 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5689 thiss!1141)))))

(declare-fun lt!425778 () (_ BitVec 64))

(assert (=> b!945196 (= lt!425778 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425781 () (_ BitVec 64))

(assert (=> b!945196 (= lt!425781 (select (arr!27492 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425780 () Unit!31760)

(declare-fun addApplyDifferent!440 (ListLongMap!12241 (_ BitVec 64) V!32431 (_ BitVec 64)) Unit!31760)

(assert (=> b!945196 (= lt!425780 (addApplyDifferent!440 lt!425776 lt!425778 (minValue!5525 thiss!1141) lt!425781))))

(assert (=> b!945196 (= (apply!861 (+!2871 lt!425776 (tuple2!13555 lt!425778 (minValue!5525 thiss!1141))) lt!425781) (apply!861 lt!425776 lt!425781))))

(declare-fun lt!425779 () Unit!31760)

(assert (=> b!945196 (= lt!425779 lt!425780)))

(declare-fun lt!425784 () ListLongMap!12241)

(assert (=> b!945196 (= lt!425784 (getCurrentListMapNoExtraKeys!3343 (_keys!10563 thiss!1141) (_values!5712 thiss!1141) (mask!27347 thiss!1141) (extraKeys!5421 thiss!1141) (zeroValue!5525 thiss!1141) (minValue!5525 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5689 thiss!1141)))))

(declare-fun lt!425786 () (_ BitVec 64))

(assert (=> b!945196 (= lt!425786 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425773 () (_ BitVec 64))

(assert (=> b!945196 (= lt!425773 (select (arr!27492 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425787 () Unit!31760)

(assert (=> b!945196 (= lt!425787 (addApplyDifferent!440 lt!425784 lt!425786 (zeroValue!5525 thiss!1141) lt!425773))))

(assert (=> b!945196 (= (apply!861 (+!2871 lt!425784 (tuple2!13555 lt!425786 (zeroValue!5525 thiss!1141))) lt!425773) (apply!861 lt!425784 lt!425773))))

(declare-fun lt!425777 () Unit!31760)

(assert (=> b!945196 (= lt!425777 lt!425787)))

(declare-fun lt!425771 () ListLongMap!12241)

(assert (=> b!945196 (= lt!425771 (getCurrentListMapNoExtraKeys!3343 (_keys!10563 thiss!1141) (_values!5712 thiss!1141) (mask!27347 thiss!1141) (extraKeys!5421 thiss!1141) (zeroValue!5525 thiss!1141) (minValue!5525 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5689 thiss!1141)))))

(declare-fun lt!425783 () (_ BitVec 64))

(assert (=> b!945196 (= lt!425783 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425769 () (_ BitVec 64))

(assert (=> b!945196 (= lt!425769 (select (arr!27492 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945196 (= lt!425782 (addApplyDifferent!440 lt!425771 lt!425783 (minValue!5525 thiss!1141) lt!425769))))

(assert (=> b!945196 (= (apply!861 (+!2871 lt!425771 (tuple2!13555 lt!425783 (minValue!5525 thiss!1141))) lt!425769) (apply!861 lt!425771 lt!425769))))

(declare-fun b!945197 () Bool)

(declare-fun Unit!31763 () Unit!31760)

(assert (=> b!945197 (= e!531613 Unit!31763)))

(declare-fun b!945198 () Bool)

(declare-fun e!531607 () ListLongMap!12241)

(assert (=> b!945198 (= e!531607 call!41030)))

(declare-fun b!945199 () Bool)

(declare-fun e!531614 () Bool)

(assert (=> b!945199 (= e!531614 (= (apply!861 lt!425774 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5525 thiss!1141)))))

(declare-fun b!945200 () Bool)

(assert (=> b!945200 (= e!531610 (validKeyInArray!0 (select (arr!27492 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41027 () Bool)

(assert (=> bm!41027 (= call!41032 (getCurrentListMapNoExtraKeys!3343 (_keys!10563 thiss!1141) (_values!5712 thiss!1141) (mask!27347 thiss!1141) (extraKeys!5421 thiss!1141) (zeroValue!5525 thiss!1141) (minValue!5525 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5689 thiss!1141)))))

(declare-fun b!945201 () Bool)

(declare-fun e!531608 () Bool)

(assert (=> b!945201 (= e!531608 (not call!41026))))

(declare-fun b!945202 () Bool)

(declare-fun e!531605 () Bool)

(declare-fun call!41031 () Bool)

(assert (=> b!945202 (= e!531605 (not call!41031))))

(declare-fun b!945203 () Bool)

(assert (=> b!945203 (= e!531602 e!531608)))

(declare-fun c!98354 () Bool)

(assert (=> b!945203 (= c!98354 (not (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!945204 () Bool)

(declare-fun e!531603 () Bool)

(assert (=> b!945204 (= e!531605 e!531603)))

(declare-fun res!634875 () Bool)

(assert (=> b!945204 (= res!634875 call!41031)))

(assert (=> b!945204 (=> (not res!634875) (not e!531603))))

(declare-fun b!945205 () Bool)

(assert (=> b!945205 (= e!531603 (= (apply!861 lt!425774 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5525 thiss!1141)))))

(declare-fun b!945206 () Bool)

(declare-fun res!634880 () Bool)

(assert (=> b!945206 (=> (not res!634880) (not e!531602))))

(assert (=> b!945206 (= res!634880 e!531605)))

(declare-fun c!98352 () Bool)

(assert (=> b!945206 (= c!98352 (not (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!945207 () Bool)

(declare-fun c!98351 () Bool)

(assert (=> b!945207 (= c!98351 (and (not (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!945207 (= e!531609 e!531607)))

(declare-fun b!945208 () Bool)

(assert (=> b!945208 (= e!531608 e!531614)))

(declare-fun res!634882 () Bool)

(assert (=> b!945208 (= res!634882 call!41026)))

(assert (=> b!945208 (=> (not res!634882) (not e!531614))))

(declare-fun b!945209 () Bool)

(assert (=> b!945209 (= e!531606 e!531612)))

(declare-fun res!634878 () Bool)

(assert (=> b!945209 (=> (not res!634878) (not e!531612))))

(assert (=> b!945209 (= res!634878 (contains!5152 lt!425774 (select (arr!27492 (_keys!10563 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!945209 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27961 (_keys!10563 thiss!1141))))))

(declare-fun bm!41028 () Bool)

(assert (=> bm!41028 (= call!41027 call!41032)))

(declare-fun bm!41029 () Bool)

(assert (=> bm!41029 (= call!41031 (contains!5152 lt!425774 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!945210 () Bool)

(assert (=> b!945210 (= e!531607 call!41029)))

(assert (= (and d!114203 c!98353) b!945191))

(assert (= (and d!114203 (not c!98353)) b!945194))

(assert (= (and b!945194 c!98350) b!945195))

(assert (= (and b!945194 (not c!98350)) b!945207))

(assert (= (and b!945207 c!98351) b!945210))

(assert (= (and b!945207 (not c!98351)) b!945198))

(assert (= (or b!945210 b!945198) bm!41023))

(assert (= (or b!945195 bm!41023) bm!41028))

(assert (= (or b!945195 b!945210) bm!41024))

(assert (= (or b!945191 bm!41028) bm!41027))

(assert (= (or b!945191 bm!41024) bm!41026))

(assert (= (and d!114203 res!634874) b!945190))

(assert (= (and d!114203 c!98355) b!945196))

(assert (= (and d!114203 (not c!98355)) b!945197))

(assert (= (and d!114203 res!634877) b!945192))

(assert (= (and b!945192 res!634876) b!945200))

(assert (= (and b!945192 (not res!634879)) b!945209))

(assert (= (and b!945209 res!634878) b!945193))

(assert (= (and b!945192 res!634881) b!945206))

(assert (= (and b!945206 c!98352) b!945204))

(assert (= (and b!945206 (not c!98352)) b!945202))

(assert (= (and b!945204 res!634875) b!945205))

(assert (= (or b!945204 b!945202) bm!41029))

(assert (= (and b!945206 res!634880) b!945203))

(assert (= (and b!945203 c!98354) b!945208))

(assert (= (and b!945203 (not c!98354)) b!945201))

(assert (= (and b!945208 res!634882) b!945199))

(assert (= (or b!945208 b!945201) bm!41025))

(declare-fun b_lambda!14277 () Bool)

(assert (=> (not b_lambda!14277) (not b!945193)))

(declare-fun t!27607 () Bool)

(declare-fun tb!6163 () Bool)

(assert (=> (and b!945013 (= (defaultEntry!5689 thiss!1141) (defaultEntry!5689 thiss!1141)) t!27607) tb!6163))

(declare-fun result!12201 () Bool)

(assert (=> tb!6163 (= result!12201 tp_is_empty!20599)))

(assert (=> b!945193 t!27607))

(declare-fun b_and!29491 () Bool)

(assert (= b_and!29485 (and (=> t!27607 result!12201) b_and!29491)))

(assert (=> b!945200 m!878425))

(assert (=> b!945200 m!878425))

(assert (=> b!945200 m!878427))

(declare-fun m!878453 () Bool)

(assert (=> b!945199 m!878453))

(declare-fun m!878455 () Bool)

(assert (=> bm!41027 m!878455))

(declare-fun m!878457 () Bool)

(assert (=> bm!41026 m!878457))

(declare-fun m!878459 () Bool)

(assert (=> bm!41025 m!878459))

(declare-fun m!878461 () Bool)

(assert (=> b!945191 m!878461))

(declare-fun m!878463 () Bool)

(assert (=> bm!41029 m!878463))

(assert (=> b!945209 m!878425))

(assert (=> b!945209 m!878425))

(declare-fun m!878465 () Bool)

(assert (=> b!945209 m!878465))

(assert (=> b!945190 m!878425))

(assert (=> b!945190 m!878425))

(assert (=> b!945190 m!878427))

(assert (=> b!945193 m!878425))

(declare-fun m!878467 () Bool)

(assert (=> b!945193 m!878467))

(declare-fun m!878469 () Bool)

(assert (=> b!945193 m!878469))

(assert (=> b!945193 m!878425))

(declare-fun m!878471 () Bool)

(assert (=> b!945193 m!878471))

(assert (=> b!945193 m!878469))

(assert (=> b!945193 m!878467))

(declare-fun m!878473 () Bool)

(assert (=> b!945193 m!878473))

(declare-fun m!878475 () Bool)

(assert (=> b!945196 m!878475))

(assert (=> b!945196 m!878455))

(declare-fun m!878477 () Bool)

(assert (=> b!945196 m!878477))

(declare-fun m!878479 () Bool)

(assert (=> b!945196 m!878479))

(declare-fun m!878481 () Bool)

(assert (=> b!945196 m!878481))

(assert (=> b!945196 m!878425))

(declare-fun m!878483 () Bool)

(assert (=> b!945196 m!878483))

(declare-fun m!878485 () Bool)

(assert (=> b!945196 m!878485))

(declare-fun m!878487 () Bool)

(assert (=> b!945196 m!878487))

(declare-fun m!878489 () Bool)

(assert (=> b!945196 m!878489))

(declare-fun m!878491 () Bool)

(assert (=> b!945196 m!878491))

(declare-fun m!878493 () Bool)

(assert (=> b!945196 m!878493))

(assert (=> b!945196 m!878483))

(declare-fun m!878495 () Bool)

(assert (=> b!945196 m!878495))

(assert (=> b!945196 m!878485))

(declare-fun m!878497 () Bool)

(assert (=> b!945196 m!878497))

(assert (=> b!945196 m!878491))

(declare-fun m!878499 () Bool)

(assert (=> b!945196 m!878499))

(declare-fun m!878501 () Bool)

(assert (=> b!945196 m!878501))

(assert (=> b!945196 m!878475))

(declare-fun m!878503 () Bool)

(assert (=> b!945196 m!878503))

(declare-fun m!878505 () Bool)

(assert (=> b!945205 m!878505))

(assert (=> d!114203 m!878431))

(assert (=> d!114179 d!114203))

(declare-fun condMapEmpty!32738 () Bool)

(declare-fun mapDefault!32738 () ValueCell!9818)

(assert (=> mapNonEmpty!32737 (= condMapEmpty!32738 (= mapRest!32737 ((as const (Array (_ BitVec 32) ValueCell!9818)) mapDefault!32738)))))

(declare-fun e!531615 () Bool)

(declare-fun mapRes!32738 () Bool)

(assert (=> mapNonEmpty!32737 (= tp!62803 (and e!531615 mapRes!32738))))

(declare-fun b!945213 () Bool)

(declare-fun e!531616 () Bool)

(assert (=> b!945213 (= e!531616 tp_is_empty!20599)))

(declare-fun mapIsEmpty!32738 () Bool)

(assert (=> mapIsEmpty!32738 mapRes!32738))

(declare-fun b!945214 () Bool)

(assert (=> b!945214 (= e!531615 tp_is_empty!20599)))

(declare-fun mapNonEmpty!32738 () Bool)

(declare-fun tp!62804 () Bool)

(assert (=> mapNonEmpty!32738 (= mapRes!32738 (and tp!62804 e!531616))))

(declare-fun mapRest!32738 () (Array (_ BitVec 32) ValueCell!9818))

(declare-fun mapValue!32738 () ValueCell!9818)

(declare-fun mapKey!32738 () (_ BitVec 32))

(assert (=> mapNonEmpty!32738 (= mapRest!32737 (store mapRest!32738 mapKey!32738 mapValue!32738))))

(assert (= (and mapNonEmpty!32737 condMapEmpty!32738) mapIsEmpty!32738))

(assert (= (and mapNonEmpty!32737 (not condMapEmpty!32738)) mapNonEmpty!32738))

(assert (= (and mapNonEmpty!32738 ((_ is ValueCellFull!9818) mapValue!32738)) b!945213))

(assert (= (and mapNonEmpty!32737 ((_ is ValueCellFull!9818) mapDefault!32738)) b!945214))

(declare-fun m!878507 () Bool)

(assert (=> mapNonEmpty!32738 m!878507))

(declare-fun b_lambda!14279 () Bool)

(assert (= b_lambda!14277 (or (and b!945013 b_free!18091) b_lambda!14279)))

(check-sat (not b_lambda!14279) (not b!945145) (not b!945193) (not mapNonEmpty!32738) (not bm!41027) b_and!29491 (not b!945103) (not b!945209) (not b!945115) (not d!114203) (not d!114191) (not b!945131) (not b!945081) (not bm!41029) (not b!945147) (not d!114197) (not b!945146) (not bm!41002) (not b!945199) (not b!945200) (not bm!41026) (not b!945205) (not b_next!18091) (not b!945093) (not b!945191) (not d!114195) (not b!945117) (not b!945196) (not b!945120) (not bm!41025) (not bm!41008) (not bm!41005) (not b!945104) (not b!945190) tp_is_empty!20599)
(check-sat b_and!29491 (not b_next!18091))
