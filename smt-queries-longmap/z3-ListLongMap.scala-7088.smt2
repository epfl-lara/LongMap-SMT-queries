; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89690 () Bool)

(assert start!89690)

(declare-fun b!1028328 () Bool)

(declare-fun b_free!20583 () Bool)

(declare-fun b_next!20583 () Bool)

(assert (=> b!1028328 (= b_free!20583 (not b_next!20583))))

(declare-fun tp!72801 () Bool)

(declare-fun b_and!32867 () Bool)

(assert (=> b!1028328 (= tp!72801 b_and!32867)))

(declare-fun mapIsEmpty!37890 () Bool)

(declare-fun mapRes!37890 () Bool)

(assert (=> mapIsEmpty!37890 mapRes!37890))

(declare-fun b!1028325 () Bool)

(declare-fun e!580465 () Bool)

(declare-fun e!580464 () Bool)

(assert (=> b!1028325 (= e!580465 (and e!580464 mapRes!37890))))

(declare-fun condMapEmpty!37890 () Bool)

(declare-datatypes ((V!37277 0))(
  ( (V!37278 (val!12202 Int)) )
))
(declare-datatypes ((ValueCell!11448 0))(
  ( (ValueCellFull!11448 (v!14773 V!37277)) (EmptyCell!11448) )
))
(declare-datatypes ((array!64660 0))(
  ( (array!64661 (arr!31137 (Array (_ BitVec 32) (_ BitVec 64))) (size!31651 (_ BitVec 32))) )
))
(declare-datatypes ((array!64662 0))(
  ( (array!64663 (arr!31138 (Array (_ BitVec 32) ValueCell!11448)) (size!31652 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5490 0))(
  ( (LongMapFixedSize!5491 (defaultEntry!6103 Int) (mask!29838 (_ BitVec 32)) (extraKeys!5835 (_ BitVec 32)) (zeroValue!5939 V!37277) (minValue!5939 V!37277) (_size!2800 (_ BitVec 32)) (_keys!11257 array!64660) (_values!6126 array!64662) (_vacant!2800 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5490)

(declare-fun mapDefault!37890 () ValueCell!11448)

(assert (=> b!1028325 (= condMapEmpty!37890 (= (arr!31138 (_values!6126 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11448)) mapDefault!37890)))))

(declare-fun b!1028326 () Bool)

(declare-fun e!580459 () Bool)

(declare-fun e!580460 () Bool)

(assert (=> b!1028326 (= e!580459 e!580460)))

(declare-fun res!688104 () Bool)

(assert (=> b!1028326 (=> (not res!688104) (not e!580460))))

(declare-datatypes ((SeekEntryResult!9679 0))(
  ( (MissingZero!9679 (index!41087 (_ BitVec 32))) (Found!9679 (index!41088 (_ BitVec 32))) (Intermediate!9679 (undefined!10491 Bool) (index!41089 (_ BitVec 32)) (x!91509 (_ BitVec 32))) (Undefined!9679) (MissingVacant!9679 (index!41090 (_ BitVec 32))) )
))
(declare-fun lt!452945 () SeekEntryResult!9679)

(get-info :version)

(assert (=> b!1028326 (= res!688104 ((_ is Found!9679) lt!452945))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64660 (_ BitVec 32)) SeekEntryResult!9679)

(assert (=> b!1028326 (= lt!452945 (seekEntry!0 key!909 (_keys!11257 thiss!1427) (mask!29838 thiss!1427)))))

(declare-fun b!1028327 () Bool)

(declare-fun e!580466 () Bool)

(declare-datatypes ((Unit!33575 0))(
  ( (Unit!33576) )
))
(declare-datatypes ((tuple2!15542 0))(
  ( (tuple2!15543 (_1!7782 Unit!33575) (_2!7782 LongMapFixedSize!5490)) )
))
(declare-fun lt!452948 () tuple2!15542)

(assert (=> b!1028327 (= e!580466 (or (not (= (size!31652 (_values!6126 (_2!7782 lt!452948))) (bvadd #b00000000000000000000000000000001 (mask!29838 (_2!7782 lt!452948))))) (= (size!31651 (_keys!11257 (_2!7782 lt!452948))) (size!31652 (_values!6126 (_2!7782 lt!452948))))))))

(declare-fun tp_is_empty!24303 () Bool)

(declare-fun e!580463 () Bool)

(declare-fun array_inv!24103 (array!64660) Bool)

(declare-fun array_inv!24104 (array!64662) Bool)

(assert (=> b!1028328 (= e!580463 (and tp!72801 tp_is_empty!24303 (array_inv!24103 (_keys!11257 thiss!1427)) (array_inv!24104 (_values!6126 thiss!1427)) e!580465))))

(declare-fun res!688106 () Bool)

(assert (=> start!89690 (=> (not res!688106) (not e!580459))))

(declare-fun valid!2079 (LongMapFixedSize!5490) Bool)

(assert (=> start!89690 (= res!688106 (valid!2079 thiss!1427))))

(assert (=> start!89690 e!580459))

(assert (=> start!89690 e!580463))

(assert (=> start!89690 true))

(declare-fun mapNonEmpty!37890 () Bool)

(declare-fun tp!72802 () Bool)

(declare-fun e!580461 () Bool)

(assert (=> mapNonEmpty!37890 (= mapRes!37890 (and tp!72802 e!580461))))

(declare-fun mapKey!37890 () (_ BitVec 32))

(declare-fun mapValue!37890 () ValueCell!11448)

(declare-fun mapRest!37890 () (Array (_ BitVec 32) ValueCell!11448))

(assert (=> mapNonEmpty!37890 (= (arr!31138 (_values!6126 thiss!1427)) (store mapRest!37890 mapKey!37890 mapValue!37890))))

(declare-fun b!1028329 () Bool)

(assert (=> b!1028329 (= e!580461 tp_is_empty!24303)))

(declare-fun b!1028330 () Bool)

(declare-fun res!688107 () Bool)

(assert (=> b!1028330 (=> (not res!688107) (not e!580459))))

(assert (=> b!1028330 (= res!688107 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1028331 () Bool)

(assert (=> b!1028331 (= e!580464 tp_is_empty!24303)))

(declare-fun b!1028332 () Bool)

(assert (=> b!1028332 (= e!580460 (not e!580466))))

(declare-fun res!688105 () Bool)

(assert (=> b!1028332 (=> res!688105 e!580466)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1028332 (= res!688105 (not (validMask!0 (mask!29838 (_2!7782 lt!452948)))))))

(declare-fun lt!452946 () array!64662)

(declare-fun lt!452950 () array!64660)

(declare-fun Unit!33577 () Unit!33575)

(declare-fun Unit!33578 () Unit!33575)

(assert (=> b!1028332 (= lt!452948 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2800 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15543 Unit!33577 (LongMapFixedSize!5491 (defaultEntry!6103 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) (bvsub (_size!2800 thiss!1427) #b00000000000000000000000000000001) lt!452950 lt!452946 (bvadd #b00000000000000000000000000000001 (_vacant!2800 thiss!1427)))) (tuple2!15543 Unit!33578 (LongMapFixedSize!5491 (defaultEntry!6103 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) (bvsub (_size!2800 thiss!1427) #b00000000000000000000000000000001) lt!452950 lt!452946 (_vacant!2800 thiss!1427)))))))

(declare-datatypes ((tuple2!15544 0))(
  ( (tuple2!15545 (_1!7783 (_ BitVec 64)) (_2!7783 V!37277)) )
))
(declare-datatypes ((List!21815 0))(
  ( (Nil!21812) (Cons!21811 (h!23010 tuple2!15544) (t!30893 List!21815)) )
))
(declare-datatypes ((ListLongMap!13675 0))(
  ( (ListLongMap!13676 (toList!6853 List!21815)) )
))
(declare-fun -!480 (ListLongMap!13675 (_ BitVec 64)) ListLongMap!13675)

(declare-fun getCurrentListMap!3901 (array!64660 array!64662 (_ BitVec 32) (_ BitVec 32) V!37277 V!37277 (_ BitVec 32) Int) ListLongMap!13675)

(assert (=> b!1028332 (= (-!480 (getCurrentListMap!3901 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)) key!909) (getCurrentListMap!3901 lt!452950 lt!452946 (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(declare-fun dynLambda!1950 (Int (_ BitVec 64)) V!37277)

(assert (=> b!1028332 (= lt!452946 (array!64663 (store (arr!31138 (_values!6126 thiss!1427)) (index!41088 lt!452945) (ValueCellFull!11448 (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31652 (_values!6126 thiss!1427))))))

(declare-fun lt!452942 () Unit!33575)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!6 (array!64660 array!64662 (_ BitVec 32) (_ BitVec 32) V!37277 V!37277 (_ BitVec 32) (_ BitVec 64) Int) Unit!33575)

(assert (=> b!1028332 (= lt!452942 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!6 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) (index!41088 lt!452945) key!909 (defaultEntry!6103 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1028332 (not (arrayContainsKey!0 lt!452950 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!452949 () Unit!33575)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64660 (_ BitVec 32) (_ BitVec 64)) Unit!33575)

(assert (=> b!1028332 (= lt!452949 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11257 thiss!1427) (index!41088 lt!452945) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64660 (_ BitVec 32)) Bool)

(assert (=> b!1028332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452950 (mask!29838 thiss!1427))))

(declare-fun lt!452943 () Unit!33575)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64660 (_ BitVec 32) (_ BitVec 32)) Unit!33575)

(assert (=> b!1028332 (= lt!452943 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11257 thiss!1427) (index!41088 lt!452945) (mask!29838 thiss!1427)))))

(declare-datatypes ((List!21816 0))(
  ( (Nil!21813) (Cons!21812 (h!23011 (_ BitVec 64)) (t!30894 List!21816)) )
))
(declare-fun arrayNoDuplicates!0 (array!64660 (_ BitVec 32) List!21816) Bool)

(assert (=> b!1028332 (arrayNoDuplicates!0 lt!452950 #b00000000000000000000000000000000 Nil!21813)))

(declare-fun lt!452947 () Unit!33575)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64660 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21816) Unit!33575)

(assert (=> b!1028332 (= lt!452947 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11257 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41088 lt!452945) #b00000000000000000000000000000000 Nil!21813))))

(declare-fun arrayCountValidKeys!0 (array!64660 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028332 (= (arrayCountValidKeys!0 lt!452950 #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11257 thiss!1427) #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1028332 (= lt!452950 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))))))

(declare-fun lt!452944 () Unit!33575)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64660 (_ BitVec 32) (_ BitVec 64)) Unit!33575)

(assert (=> b!1028332 (= lt!452944 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11257 thiss!1427) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89690 res!688106) b!1028330))

(assert (= (and b!1028330 res!688107) b!1028326))

(assert (= (and b!1028326 res!688104) b!1028332))

(assert (= (and b!1028332 (not res!688105)) b!1028327))

(assert (= (and b!1028325 condMapEmpty!37890) mapIsEmpty!37890))

(assert (= (and b!1028325 (not condMapEmpty!37890)) mapNonEmpty!37890))

(assert (= (and mapNonEmpty!37890 ((_ is ValueCellFull!11448) mapValue!37890)) b!1028329))

(assert (= (and b!1028325 ((_ is ValueCellFull!11448) mapDefault!37890)) b!1028331))

(assert (= b!1028328 b!1028325))

(assert (= start!89690 b!1028328))

(declare-fun b_lambda!15785 () Bool)

(assert (=> (not b_lambda!15785) (not b!1028332)))

(declare-fun t!30892 () Bool)

(declare-fun tb!6901 () Bool)

(assert (=> (and b!1028328 (= (defaultEntry!6103 thiss!1427) (defaultEntry!6103 thiss!1427)) t!30892) tb!6901))

(declare-fun result!14121 () Bool)

(assert (=> tb!6901 (= result!14121 tp_is_empty!24303)))

(assert (=> b!1028332 t!30892))

(declare-fun b_and!32869 () Bool)

(assert (= b_and!32867 (and (=> t!30892 result!14121) b_and!32869)))

(declare-fun m!947143 () Bool)

(assert (=> b!1028328 m!947143))

(declare-fun m!947145 () Bool)

(assert (=> b!1028328 m!947145))

(declare-fun m!947147 () Bool)

(assert (=> b!1028332 m!947147))

(declare-fun m!947149 () Bool)

(assert (=> b!1028332 m!947149))

(declare-fun m!947151 () Bool)

(assert (=> b!1028332 m!947151))

(declare-fun m!947153 () Bool)

(assert (=> b!1028332 m!947153))

(declare-fun m!947155 () Bool)

(assert (=> b!1028332 m!947155))

(declare-fun m!947157 () Bool)

(assert (=> b!1028332 m!947157))

(declare-fun m!947159 () Bool)

(assert (=> b!1028332 m!947159))

(declare-fun m!947161 () Bool)

(assert (=> b!1028332 m!947161))

(assert (=> b!1028332 m!947159))

(declare-fun m!947163 () Bool)

(assert (=> b!1028332 m!947163))

(declare-fun m!947165 () Bool)

(assert (=> b!1028332 m!947165))

(declare-fun m!947167 () Bool)

(assert (=> b!1028332 m!947167))

(declare-fun m!947169 () Bool)

(assert (=> b!1028332 m!947169))

(declare-fun m!947171 () Bool)

(assert (=> b!1028332 m!947171))

(declare-fun m!947173 () Bool)

(assert (=> b!1028332 m!947173))

(declare-fun m!947175 () Bool)

(assert (=> b!1028332 m!947175))

(declare-fun m!947177 () Bool)

(assert (=> b!1028332 m!947177))

(declare-fun m!947179 () Bool)

(assert (=> b!1028332 m!947179))

(declare-fun m!947181 () Bool)

(assert (=> b!1028326 m!947181))

(declare-fun m!947183 () Bool)

(assert (=> start!89690 m!947183))

(declare-fun m!947185 () Bool)

(assert (=> mapNonEmpty!37890 m!947185))

(check-sat (not b_lambda!15785) tp_is_empty!24303 (not b!1028332) (not b!1028328) (not mapNonEmpty!37890) (not start!89690) (not b!1028326) (not b_next!20583) b_and!32869)
(check-sat b_and!32869 (not b_next!20583))
(get-model)

(declare-fun b_lambda!15789 () Bool)

(assert (= b_lambda!15785 (or (and b!1028328 b_free!20583) b_lambda!15789)))

(check-sat (not b_lambda!15789) tp_is_empty!24303 (not b!1028332) (not b!1028328) (not mapNonEmpty!37890) (not start!89690) (not b!1028326) (not b_next!20583) b_and!32869)
(check-sat b_and!32869 (not b_next!20583))
(get-model)

(declare-fun b!1028373 () Bool)

(declare-fun e!580497 () SeekEntryResult!9679)

(declare-fun e!580498 () SeekEntryResult!9679)

(assert (=> b!1028373 (= e!580497 e!580498)))

(declare-fun lt!452989 () (_ BitVec 64))

(declare-fun lt!452987 () SeekEntryResult!9679)

(assert (=> b!1028373 (= lt!452989 (select (arr!31137 (_keys!11257 thiss!1427)) (index!41089 lt!452987)))))

(declare-fun c!103753 () Bool)

(assert (=> b!1028373 (= c!103753 (= lt!452989 key!909))))

(declare-fun b!1028374 () Bool)

(declare-fun e!580499 () SeekEntryResult!9679)

(assert (=> b!1028374 (= e!580499 (MissingZero!9679 (index!41089 lt!452987)))))

(declare-fun d!122947 () Bool)

(declare-fun lt!452988 () SeekEntryResult!9679)

(assert (=> d!122947 (and (or ((_ is MissingVacant!9679) lt!452988) (not ((_ is Found!9679) lt!452988)) (and (bvsge (index!41088 lt!452988) #b00000000000000000000000000000000) (bvslt (index!41088 lt!452988) (size!31651 (_keys!11257 thiss!1427))))) (not ((_ is MissingVacant!9679) lt!452988)) (or (not ((_ is Found!9679) lt!452988)) (= (select (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452988)) key!909)))))

(assert (=> d!122947 (= lt!452988 e!580497)))

(declare-fun c!103754 () Bool)

(assert (=> d!122947 (= c!103754 (and ((_ is Intermediate!9679) lt!452987) (undefined!10491 lt!452987)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64660 (_ BitVec 32)) SeekEntryResult!9679)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!122947 (= lt!452987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29838 thiss!1427)) key!909 (_keys!11257 thiss!1427) (mask!29838 thiss!1427)))))

(assert (=> d!122947 (validMask!0 (mask!29838 thiss!1427))))

(assert (=> d!122947 (= (seekEntry!0 key!909 (_keys!11257 thiss!1427) (mask!29838 thiss!1427)) lt!452988)))

(declare-fun b!1028375 () Bool)

(declare-fun lt!452986 () SeekEntryResult!9679)

(assert (=> b!1028375 (= e!580499 (ite ((_ is MissingVacant!9679) lt!452986) (MissingZero!9679 (index!41090 lt!452986)) lt!452986))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64660 (_ BitVec 32)) SeekEntryResult!9679)

(assert (=> b!1028375 (= lt!452986 (seekKeyOrZeroReturnVacant!0 (x!91509 lt!452987) (index!41089 lt!452987) (index!41089 lt!452987) key!909 (_keys!11257 thiss!1427) (mask!29838 thiss!1427)))))

(declare-fun b!1028376 () Bool)

(declare-fun c!103755 () Bool)

(assert (=> b!1028376 (= c!103755 (= lt!452989 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1028376 (= e!580498 e!580499)))

(declare-fun b!1028377 () Bool)

(assert (=> b!1028377 (= e!580497 Undefined!9679)))

(declare-fun b!1028378 () Bool)

(assert (=> b!1028378 (= e!580498 (Found!9679 (index!41089 lt!452987)))))

(assert (= (and d!122947 c!103754) b!1028377))

(assert (= (and d!122947 (not c!103754)) b!1028373))

(assert (= (and b!1028373 c!103753) b!1028378))

(assert (= (and b!1028373 (not c!103753)) b!1028376))

(assert (= (and b!1028376 c!103755) b!1028374))

(assert (= (and b!1028376 (not c!103755)) b!1028375))

(declare-fun m!947231 () Bool)

(assert (=> b!1028373 m!947231))

(declare-fun m!947233 () Bool)

(assert (=> d!122947 m!947233))

(declare-fun m!947235 () Bool)

(assert (=> d!122947 m!947235))

(assert (=> d!122947 m!947235))

(declare-fun m!947237 () Bool)

(assert (=> d!122947 m!947237))

(declare-fun m!947239 () Bool)

(assert (=> d!122947 m!947239))

(declare-fun m!947241 () Bool)

(assert (=> b!1028375 m!947241))

(assert (=> b!1028326 d!122947))

(declare-fun d!122949 () Bool)

(declare-fun res!688126 () Bool)

(declare-fun e!580502 () Bool)

(assert (=> d!122949 (=> (not res!688126) (not e!580502))))

(declare-fun simpleValid!392 (LongMapFixedSize!5490) Bool)

(assert (=> d!122949 (= res!688126 (simpleValid!392 thiss!1427))))

(assert (=> d!122949 (= (valid!2079 thiss!1427) e!580502)))

(declare-fun b!1028385 () Bool)

(declare-fun res!688127 () Bool)

(assert (=> b!1028385 (=> (not res!688127) (not e!580502))))

(assert (=> b!1028385 (= res!688127 (= (arrayCountValidKeys!0 (_keys!11257 thiss!1427) #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))) (_size!2800 thiss!1427)))))

(declare-fun b!1028386 () Bool)

(declare-fun res!688128 () Bool)

(assert (=> b!1028386 (=> (not res!688128) (not e!580502))))

(assert (=> b!1028386 (= res!688128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11257 thiss!1427) (mask!29838 thiss!1427)))))

(declare-fun b!1028387 () Bool)

(assert (=> b!1028387 (= e!580502 (arrayNoDuplicates!0 (_keys!11257 thiss!1427) #b00000000000000000000000000000000 Nil!21813))))

(assert (= (and d!122949 res!688126) b!1028385))

(assert (= (and b!1028385 res!688127) b!1028386))

(assert (= (and b!1028386 res!688128) b!1028387))

(declare-fun m!947243 () Bool)

(assert (=> d!122949 m!947243))

(assert (=> b!1028385 m!947175))

(declare-fun m!947245 () Bool)

(assert (=> b!1028386 m!947245))

(declare-fun m!947247 () Bool)

(assert (=> b!1028387 m!947247))

(assert (=> start!89690 d!122949))

(declare-fun b!1028398 () Bool)

(declare-fun e!580513 () Bool)

(declare-fun call!43341 () Bool)

(assert (=> b!1028398 (= e!580513 call!43341)))

(declare-fun b!1028399 () Bool)

(declare-fun e!580512 () Bool)

(declare-fun e!580514 () Bool)

(assert (=> b!1028399 (= e!580512 e!580514)))

(declare-fun res!688137 () Bool)

(assert (=> b!1028399 (=> (not res!688137) (not e!580514))))

(declare-fun e!580511 () Bool)

(assert (=> b!1028399 (= res!688137 (not e!580511))))

(declare-fun res!688135 () Bool)

(assert (=> b!1028399 (=> (not res!688135) (not e!580511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1028399 (= res!688135 (validKeyInArray!0 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(declare-fun d!122951 () Bool)

(declare-fun res!688136 () Bool)

(assert (=> d!122951 (=> res!688136 e!580512)))

(assert (=> d!122951 (= res!688136 (bvsge #b00000000000000000000000000000000 (size!31651 lt!452950)))))

(assert (=> d!122951 (= (arrayNoDuplicates!0 lt!452950 #b00000000000000000000000000000000 Nil!21813) e!580512)))

(declare-fun b!1028400 () Bool)

(declare-fun contains!5967 (List!21816 (_ BitVec 64)) Bool)

(assert (=> b!1028400 (= e!580511 (contains!5967 Nil!21813 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(declare-fun bm!43338 () Bool)

(declare-fun c!103758 () Bool)

(assert (=> bm!43338 (= call!43341 (arrayNoDuplicates!0 lt!452950 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103758 (Cons!21812 (select (arr!31137 lt!452950) #b00000000000000000000000000000000) Nil!21813) Nil!21813)))))

(declare-fun b!1028401 () Bool)

(assert (=> b!1028401 (= e!580514 e!580513)))

(assert (=> b!1028401 (= c!103758 (validKeyInArray!0 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(declare-fun b!1028402 () Bool)

(assert (=> b!1028402 (= e!580513 call!43341)))

(assert (= (and d!122951 (not res!688136)) b!1028399))

(assert (= (and b!1028399 res!688135) b!1028400))

(assert (= (and b!1028399 res!688137) b!1028401))

(assert (= (and b!1028401 c!103758) b!1028402))

(assert (= (and b!1028401 (not c!103758)) b!1028398))

(assert (= (or b!1028402 b!1028398) bm!43338))

(declare-fun m!947249 () Bool)

(assert (=> b!1028399 m!947249))

(assert (=> b!1028399 m!947249))

(declare-fun m!947251 () Bool)

(assert (=> b!1028399 m!947251))

(assert (=> b!1028400 m!947249))

(assert (=> b!1028400 m!947249))

(declare-fun m!947253 () Bool)

(assert (=> b!1028400 m!947253))

(assert (=> bm!43338 m!947249))

(declare-fun m!947255 () Bool)

(assert (=> bm!43338 m!947255))

(assert (=> b!1028401 m!947249))

(assert (=> b!1028401 m!947249))

(assert (=> b!1028401 m!947251))

(assert (=> b!1028332 d!122951))

(declare-fun b!1028411 () Bool)

(declare-fun e!580522 () Bool)

(declare-fun call!43344 () Bool)

(assert (=> b!1028411 (= e!580522 call!43344)))

(declare-fun b!1028412 () Bool)

(declare-fun e!580523 () Bool)

(assert (=> b!1028412 (= e!580522 e!580523)))

(declare-fun lt!452998 () (_ BitVec 64))

(assert (=> b!1028412 (= lt!452998 (select (arr!31137 lt!452950) #b00000000000000000000000000000000))))

(declare-fun lt!452996 () Unit!33575)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64660 (_ BitVec 64) (_ BitVec 32)) Unit!33575)

(assert (=> b!1028412 (= lt!452996 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!452950 lt!452998 #b00000000000000000000000000000000))))

(assert (=> b!1028412 (arrayContainsKey!0 lt!452950 lt!452998 #b00000000000000000000000000000000)))

(declare-fun lt!452997 () Unit!33575)

(assert (=> b!1028412 (= lt!452997 lt!452996)))

(declare-fun res!688142 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64660 (_ BitVec 32)) SeekEntryResult!9679)

(assert (=> b!1028412 (= res!688142 (= (seekEntryOrOpen!0 (select (arr!31137 lt!452950) #b00000000000000000000000000000000) lt!452950 (mask!29838 thiss!1427)) (Found!9679 #b00000000000000000000000000000000)))))

(assert (=> b!1028412 (=> (not res!688142) (not e!580523))))

(declare-fun b!1028413 () Bool)

(assert (=> b!1028413 (= e!580523 call!43344)))

(declare-fun d!122953 () Bool)

(declare-fun res!688143 () Bool)

(declare-fun e!580521 () Bool)

(assert (=> d!122953 (=> res!688143 e!580521)))

(assert (=> d!122953 (= res!688143 (bvsge #b00000000000000000000000000000000 (size!31651 lt!452950)))))

(assert (=> d!122953 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452950 (mask!29838 thiss!1427)) e!580521)))

(declare-fun b!1028414 () Bool)

(assert (=> b!1028414 (= e!580521 e!580522)))

(declare-fun c!103761 () Bool)

(assert (=> b!1028414 (= c!103761 (validKeyInArray!0 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(declare-fun bm!43341 () Bool)

(assert (=> bm!43341 (= call!43344 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!452950 (mask!29838 thiss!1427)))))

(assert (= (and d!122953 (not res!688143)) b!1028414))

(assert (= (and b!1028414 c!103761) b!1028412))

(assert (= (and b!1028414 (not c!103761)) b!1028411))

(assert (= (and b!1028412 res!688142) b!1028413))

(assert (= (or b!1028413 b!1028411) bm!43341))

(assert (=> b!1028412 m!947249))

(declare-fun m!947257 () Bool)

(assert (=> b!1028412 m!947257))

(declare-fun m!947259 () Bool)

(assert (=> b!1028412 m!947259))

(assert (=> b!1028412 m!947249))

(declare-fun m!947261 () Bool)

(assert (=> b!1028412 m!947261))

(assert (=> b!1028414 m!947249))

(assert (=> b!1028414 m!947249))

(assert (=> b!1028414 m!947251))

(declare-fun m!947263 () Bool)

(assert (=> bm!43341 m!947263))

(assert (=> b!1028332 d!122953))

(declare-fun d!122955 () Bool)

(declare-fun e!580526 () Bool)

(assert (=> d!122955 e!580526))

(declare-fun res!688146 () Bool)

(assert (=> d!122955 (=> (not res!688146) (not e!580526))))

(assert (=> d!122955 (= res!688146 (and (bvsge (index!41088 lt!452945) #b00000000000000000000000000000000) (bvslt (index!41088 lt!452945) (size!31651 (_keys!11257 thiss!1427)))))))

(declare-fun lt!453001 () Unit!33575)

(declare-fun choose!53 (array!64660 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21816) Unit!33575)

(assert (=> d!122955 (= lt!453001 (choose!53 (_keys!11257 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41088 lt!452945) #b00000000000000000000000000000000 Nil!21813))))

(assert (=> d!122955 (bvslt (size!31651 (_keys!11257 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!122955 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11257 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41088 lt!452945) #b00000000000000000000000000000000 Nil!21813) lt!453001)))

(declare-fun b!1028417 () Bool)

(assert (=> b!1028417 (= e!580526 (arrayNoDuplicates!0 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) #b00000000000000000000000000000000 Nil!21813))))

(assert (= (and d!122955 res!688146) b!1028417))

(declare-fun m!947265 () Bool)

(assert (=> d!122955 m!947265))

(assert (=> b!1028417 m!947179))

(declare-fun m!947267 () Bool)

(assert (=> b!1028417 m!947267))

(assert (=> b!1028332 d!122955))

(declare-fun d!122957 () Bool)

(declare-fun res!688151 () Bool)

(declare-fun e!580531 () Bool)

(assert (=> d!122957 (=> res!688151 e!580531)))

(assert (=> d!122957 (= res!688151 (= (select (arr!31137 lt!452950) #b00000000000000000000000000000000) key!909))))

(assert (=> d!122957 (= (arrayContainsKey!0 lt!452950 key!909 #b00000000000000000000000000000000) e!580531)))

(declare-fun b!1028422 () Bool)

(declare-fun e!580532 () Bool)

(assert (=> b!1028422 (= e!580531 e!580532)))

(declare-fun res!688152 () Bool)

(assert (=> b!1028422 (=> (not res!688152) (not e!580532))))

(assert (=> b!1028422 (= res!688152 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31651 lt!452950)))))

(declare-fun b!1028423 () Bool)

(assert (=> b!1028423 (= e!580532 (arrayContainsKey!0 lt!452950 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!122957 (not res!688151)) b!1028422))

(assert (= (and b!1028422 res!688152) b!1028423))

(assert (=> d!122957 m!947249))

(declare-fun m!947269 () Bool)

(assert (=> b!1028423 m!947269))

(assert (=> b!1028332 d!122957))

(declare-fun b!1028435 () Bool)

(declare-fun e!580538 () Bool)

(assert (=> b!1028435 (= e!580538 (= (arrayCountValidKeys!0 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11257 thiss!1427) #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1028432 () Bool)

(declare-fun res!688163 () Bool)

(declare-fun e!580537 () Bool)

(assert (=> b!1028432 (=> (not res!688163) (not e!580537))))

(assert (=> b!1028432 (= res!688163 (validKeyInArray!0 (select (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945))))))

(declare-fun d!122959 () Bool)

(assert (=> d!122959 e!580538))

(declare-fun res!688161 () Bool)

(assert (=> d!122959 (=> (not res!688161) (not e!580538))))

(assert (=> d!122959 (= res!688161 (and (bvsge (index!41088 lt!452945) #b00000000000000000000000000000000) (bvslt (index!41088 lt!452945) (size!31651 (_keys!11257 thiss!1427)))))))

(declare-fun lt!453004 () Unit!33575)

(declare-fun choose!82 (array!64660 (_ BitVec 32) (_ BitVec 64)) Unit!33575)

(assert (=> d!122959 (= lt!453004 (choose!82 (_keys!11257 thiss!1427) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122959 e!580537))

(declare-fun res!688162 () Bool)

(assert (=> d!122959 (=> (not res!688162) (not e!580537))))

(assert (=> d!122959 (= res!688162 (and (bvsge (index!41088 lt!452945) #b00000000000000000000000000000000) (bvslt (index!41088 lt!452945) (size!31651 (_keys!11257 thiss!1427)))))))

(assert (=> d!122959 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11257 thiss!1427) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) lt!453004)))

(declare-fun b!1028433 () Bool)

(declare-fun res!688164 () Bool)

(assert (=> b!1028433 (=> (not res!688164) (not e!580537))))

(assert (=> b!1028433 (= res!688164 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028434 () Bool)

(assert (=> b!1028434 (= e!580537 (bvslt (size!31651 (_keys!11257 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!122959 res!688162) b!1028432))

(assert (= (and b!1028432 res!688163) b!1028433))

(assert (= (and b!1028433 res!688164) b!1028434))

(assert (= (and d!122959 res!688161) b!1028435))

(assert (=> b!1028435 m!947179))

(declare-fun m!947271 () Bool)

(assert (=> b!1028435 m!947271))

(assert (=> b!1028435 m!947175))

(declare-fun m!947273 () Bool)

(assert (=> b!1028432 m!947273))

(assert (=> b!1028432 m!947273))

(declare-fun m!947275 () Bool)

(assert (=> b!1028432 m!947275))

(declare-fun m!947277 () Bool)

(assert (=> d!122959 m!947277))

(declare-fun m!947279 () Bool)

(assert (=> b!1028433 m!947279))

(assert (=> b!1028332 d!122959))

(declare-fun d!122961 () Bool)

(declare-fun e!580541 () Bool)

(assert (=> d!122961 e!580541))

(declare-fun res!688167 () Bool)

(assert (=> d!122961 (=> (not res!688167) (not e!580541))))

(assert (=> d!122961 (= res!688167 (bvslt (index!41088 lt!452945) (size!31651 (_keys!11257 thiss!1427))))))

(declare-fun lt!453007 () Unit!33575)

(declare-fun choose!121 (array!64660 (_ BitVec 32) (_ BitVec 64)) Unit!33575)

(assert (=> d!122961 (= lt!453007 (choose!121 (_keys!11257 thiss!1427) (index!41088 lt!452945) key!909))))

(assert (=> d!122961 (bvsge (index!41088 lt!452945) #b00000000000000000000000000000000)))

(assert (=> d!122961 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11257 thiss!1427) (index!41088 lt!452945) key!909) lt!453007)))

(declare-fun b!1028438 () Bool)

(assert (=> b!1028438 (= e!580541 (not (arrayContainsKey!0 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!122961 res!688167) b!1028438))

(declare-fun m!947281 () Bool)

(assert (=> d!122961 m!947281))

(assert (=> b!1028438 m!947179))

(declare-fun m!947283 () Bool)

(assert (=> b!1028438 m!947283))

(assert (=> b!1028332 d!122961))

(declare-fun bm!43344 () Bool)

(declare-fun call!43347 () (_ BitVec 32))

(assert (=> bm!43344 (= call!43347 (arrayCountValidKeys!0 (_keys!11257 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31651 (_keys!11257 thiss!1427))))))

(declare-fun b!1028447 () Bool)

(declare-fun e!580546 () (_ BitVec 32))

(declare-fun e!580547 () (_ BitVec 32))

(assert (=> b!1028447 (= e!580546 e!580547)))

(declare-fun c!103766 () Bool)

(assert (=> b!1028447 (= c!103766 (validKeyInArray!0 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028448 () Bool)

(assert (=> b!1028448 (= e!580546 #b00000000000000000000000000000000)))

(declare-fun b!1028449 () Bool)

(assert (=> b!1028449 (= e!580547 call!43347)))

(declare-fun b!1028450 () Bool)

(assert (=> b!1028450 (= e!580547 (bvadd #b00000000000000000000000000000001 call!43347))))

(declare-fun d!122963 () Bool)

(declare-fun lt!453010 () (_ BitVec 32))

(assert (=> d!122963 (and (bvsge lt!453010 #b00000000000000000000000000000000) (bvsle lt!453010 (bvsub (size!31651 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!122963 (= lt!453010 e!580546)))

(declare-fun c!103767 () Bool)

(assert (=> d!122963 (= c!103767 (bvsge #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))))))

(assert (=> d!122963 (and (bvsle #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31651 (_keys!11257 thiss!1427)) (size!31651 (_keys!11257 thiss!1427))))))

(assert (=> d!122963 (= (arrayCountValidKeys!0 (_keys!11257 thiss!1427) #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))) lt!453010)))

(assert (= (and d!122963 c!103767) b!1028448))

(assert (= (and d!122963 (not c!103767)) b!1028447))

(assert (= (and b!1028447 c!103766) b!1028450))

(assert (= (and b!1028447 (not c!103766)) b!1028449))

(assert (= (or b!1028450 b!1028449) bm!43344))

(declare-fun m!947285 () Bool)

(assert (=> bm!43344 m!947285))

(declare-fun m!947287 () Bool)

(assert (=> b!1028447 m!947287))

(assert (=> b!1028447 m!947287))

(declare-fun m!947289 () Bool)

(assert (=> b!1028447 m!947289))

(assert (=> b!1028332 d!122963))

(declare-fun b!1028493 () Bool)

(declare-fun e!580579 () Bool)

(assert (=> b!1028493 (= e!580579 (validKeyInArray!0 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(declare-fun b!1028494 () Bool)

(declare-fun e!580575 () Bool)

(declare-fun lt!453073 () ListLongMap!13675)

(declare-fun apply!901 (ListLongMap!13675 (_ BitVec 64)) V!37277)

(assert (=> b!1028494 (= e!580575 (= (apply!901 lt!453073 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5939 thiss!1427)))))

(declare-fun b!1028495 () Bool)

(declare-fun c!103781 () Bool)

(assert (=> b!1028495 (= c!103781 (and (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!580584 () ListLongMap!13675)

(declare-fun e!580577 () ListLongMap!13675)

(assert (=> b!1028495 (= e!580584 e!580577)))

(declare-fun d!122965 () Bool)

(declare-fun e!580585 () Bool)

(assert (=> d!122965 e!580585))

(declare-fun res!688186 () Bool)

(assert (=> d!122965 (=> (not res!688186) (not e!580585))))

(assert (=> d!122965 (= res!688186 (or (bvsge #b00000000000000000000000000000000 (size!31651 lt!452950)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31651 lt!452950)))))))

(declare-fun lt!453065 () ListLongMap!13675)

(assert (=> d!122965 (= lt!453073 lt!453065)))

(declare-fun lt!453075 () Unit!33575)

(declare-fun e!580578 () Unit!33575)

(assert (=> d!122965 (= lt!453075 e!580578)))

(declare-fun c!103784 () Bool)

(declare-fun e!580574 () Bool)

(assert (=> d!122965 (= c!103784 e!580574)))

(declare-fun res!688194 () Bool)

(assert (=> d!122965 (=> (not res!688194) (not e!580574))))

(assert (=> d!122965 (= res!688194 (bvslt #b00000000000000000000000000000000 (size!31651 lt!452950)))))

(declare-fun e!580580 () ListLongMap!13675)

(assert (=> d!122965 (= lt!453065 e!580580)))

(declare-fun c!103783 () Bool)

(assert (=> d!122965 (= c!103783 (and (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!122965 (validMask!0 (mask!29838 thiss!1427))))

(assert (=> d!122965 (= (getCurrentListMap!3901 lt!452950 lt!452946 (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)) lt!453073)))

(declare-fun b!1028496 () Bool)

(declare-fun call!43364 () ListLongMap!13675)

(assert (=> b!1028496 (= e!580584 call!43364)))

(declare-fun b!1028497 () Bool)

(assert (=> b!1028497 (= e!580574 (validKeyInArray!0 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(declare-fun b!1028498 () Bool)

(assert (=> b!1028498 (= e!580580 e!580584)))

(declare-fun c!103782 () Bool)

(assert (=> b!1028498 (= c!103782 (and (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!43362 () ListLongMap!13675)

(declare-fun bm!43359 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3515 (array!64660 array!64662 (_ BitVec 32) (_ BitVec 32) V!37277 V!37277 (_ BitVec 32) Int) ListLongMap!13675)

(assert (=> bm!43359 (= call!43362 (getCurrentListMapNoExtraKeys!3515 lt!452950 lt!452946 (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(declare-fun bm!43360 () Bool)

(declare-fun call!43365 () ListLongMap!13675)

(assert (=> bm!43360 (= call!43364 call!43365)))

(declare-fun b!1028499 () Bool)

(assert (=> b!1028499 (= e!580577 call!43364)))

(declare-fun b!1028500 () Bool)

(declare-fun e!580586 () Bool)

(declare-fun call!43368 () Bool)

(assert (=> b!1028500 (= e!580586 (not call!43368))))

(declare-fun b!1028501 () Bool)

(declare-fun e!580582 () Bool)

(assert (=> b!1028501 (= e!580582 (= (apply!901 lt!453073 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5939 thiss!1427)))))

(declare-fun b!1028502 () Bool)

(assert (=> b!1028502 (= e!580585 e!580586)))

(declare-fun c!103785 () Bool)

(assert (=> b!1028502 (= c!103785 (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1028503 () Bool)

(declare-fun e!580583 () Bool)

(declare-fun e!580581 () Bool)

(assert (=> b!1028503 (= e!580583 e!580581)))

(declare-fun res!688189 () Bool)

(assert (=> b!1028503 (=> (not res!688189) (not e!580581))))

(declare-fun contains!5968 (ListLongMap!13675 (_ BitVec 64)) Bool)

(assert (=> b!1028503 (= res!688189 (contains!5968 lt!453073 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(assert (=> b!1028503 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31651 lt!452950)))))

(declare-fun b!1028504 () Bool)

(declare-fun +!3099 (ListLongMap!13675 tuple2!15544) ListLongMap!13675)

(assert (=> b!1028504 (= e!580580 (+!3099 call!43365 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))))

(declare-fun b!1028505 () Bool)

(declare-fun res!688188 () Bool)

(assert (=> b!1028505 (=> (not res!688188) (not e!580585))))

(declare-fun e!580576 () Bool)

(assert (=> b!1028505 (= res!688188 e!580576)))

(declare-fun c!103780 () Bool)

(assert (=> b!1028505 (= c!103780 (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1028506 () Bool)

(declare-fun res!688193 () Bool)

(assert (=> b!1028506 (=> (not res!688193) (not e!580585))))

(assert (=> b!1028506 (= res!688193 e!580583)))

(declare-fun res!688187 () Bool)

(assert (=> b!1028506 (=> res!688187 e!580583)))

(assert (=> b!1028506 (= res!688187 (not e!580579))))

(declare-fun res!688191 () Bool)

(assert (=> b!1028506 (=> (not res!688191) (not e!580579))))

(assert (=> b!1028506 (= res!688191 (bvslt #b00000000000000000000000000000000 (size!31651 lt!452950)))))

(declare-fun b!1028507 () Bool)

(declare-fun call!43367 () ListLongMap!13675)

(assert (=> b!1028507 (= e!580577 call!43367)))

(declare-fun b!1028508 () Bool)

(assert (=> b!1028508 (= e!580576 e!580582)))

(declare-fun res!688192 () Bool)

(declare-fun call!43363 () Bool)

(assert (=> b!1028508 (= res!688192 call!43363)))

(assert (=> b!1028508 (=> (not res!688192) (not e!580582))))

(declare-fun bm!43361 () Bool)

(assert (=> bm!43361 (= call!43368 (contains!5968 lt!453073 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43362 () Bool)

(declare-fun call!43366 () ListLongMap!13675)

(assert (=> bm!43362 (= call!43367 call!43366)))

(declare-fun b!1028509 () Bool)

(declare-fun get!16347 (ValueCell!11448 V!37277) V!37277)

(assert (=> b!1028509 (= e!580581 (= (apply!901 lt!453073 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)) (get!16347 (select (arr!31138 lt!452946) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028509 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31652 lt!452946)))))

(assert (=> b!1028509 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31651 lt!452950)))))

(declare-fun b!1028510 () Bool)

(declare-fun lt!453059 () Unit!33575)

(assert (=> b!1028510 (= e!580578 lt!453059)))

(declare-fun lt!453062 () ListLongMap!13675)

(assert (=> b!1028510 (= lt!453062 (getCurrentListMapNoExtraKeys!3515 lt!452950 lt!452946 (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(declare-fun lt!453063 () (_ BitVec 64))

(assert (=> b!1028510 (= lt!453063 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453070 () (_ BitVec 64))

(assert (=> b!1028510 (= lt!453070 (select (arr!31137 lt!452950) #b00000000000000000000000000000000))))

(declare-fun lt!453069 () Unit!33575)

(declare-fun addStillContains!620 (ListLongMap!13675 (_ BitVec 64) V!37277 (_ BitVec 64)) Unit!33575)

(assert (=> b!1028510 (= lt!453069 (addStillContains!620 lt!453062 lt!453063 (zeroValue!5939 thiss!1427) lt!453070))))

(assert (=> b!1028510 (contains!5968 (+!3099 lt!453062 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427))) lt!453070)))

(declare-fun lt!453068 () Unit!33575)

(assert (=> b!1028510 (= lt!453068 lt!453069)))

(declare-fun lt!453074 () ListLongMap!13675)

(assert (=> b!1028510 (= lt!453074 (getCurrentListMapNoExtraKeys!3515 lt!452950 lt!452946 (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(declare-fun lt!453072 () (_ BitVec 64))

(assert (=> b!1028510 (= lt!453072 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453055 () (_ BitVec 64))

(assert (=> b!1028510 (= lt!453055 (select (arr!31137 lt!452950) #b00000000000000000000000000000000))))

(declare-fun lt!453067 () Unit!33575)

(declare-fun addApplyDifferent!480 (ListLongMap!13675 (_ BitVec 64) V!37277 (_ BitVec 64)) Unit!33575)

(assert (=> b!1028510 (= lt!453067 (addApplyDifferent!480 lt!453074 lt!453072 (minValue!5939 thiss!1427) lt!453055))))

(assert (=> b!1028510 (= (apply!901 (+!3099 lt!453074 (tuple2!15545 lt!453072 (minValue!5939 thiss!1427))) lt!453055) (apply!901 lt!453074 lt!453055))))

(declare-fun lt!453076 () Unit!33575)

(assert (=> b!1028510 (= lt!453076 lt!453067)))

(declare-fun lt!453057 () ListLongMap!13675)

(assert (=> b!1028510 (= lt!453057 (getCurrentListMapNoExtraKeys!3515 lt!452950 lt!452946 (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(declare-fun lt!453058 () (_ BitVec 64))

(assert (=> b!1028510 (= lt!453058 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453056 () (_ BitVec 64))

(assert (=> b!1028510 (= lt!453056 (select (arr!31137 lt!452950) #b00000000000000000000000000000000))))

(declare-fun lt!453064 () Unit!33575)

(assert (=> b!1028510 (= lt!453064 (addApplyDifferent!480 lt!453057 lt!453058 (zeroValue!5939 thiss!1427) lt!453056))))

(assert (=> b!1028510 (= (apply!901 (+!3099 lt!453057 (tuple2!15545 lt!453058 (zeroValue!5939 thiss!1427))) lt!453056) (apply!901 lt!453057 lt!453056))))

(declare-fun lt!453071 () Unit!33575)

(assert (=> b!1028510 (= lt!453071 lt!453064)))

(declare-fun lt!453066 () ListLongMap!13675)

(assert (=> b!1028510 (= lt!453066 (getCurrentListMapNoExtraKeys!3515 lt!452950 lt!452946 (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(declare-fun lt!453060 () (_ BitVec 64))

(assert (=> b!1028510 (= lt!453060 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453061 () (_ BitVec 64))

(assert (=> b!1028510 (= lt!453061 (select (arr!31137 lt!452950) #b00000000000000000000000000000000))))

(assert (=> b!1028510 (= lt!453059 (addApplyDifferent!480 lt!453066 lt!453060 (minValue!5939 thiss!1427) lt!453061))))

(assert (=> b!1028510 (= (apply!901 (+!3099 lt!453066 (tuple2!15545 lt!453060 (minValue!5939 thiss!1427))) lt!453061) (apply!901 lt!453066 lt!453061))))

(declare-fun b!1028511 () Bool)

(assert (=> b!1028511 (= e!580586 e!580575)))

(declare-fun res!688190 () Bool)

(assert (=> b!1028511 (= res!688190 call!43368)))

(assert (=> b!1028511 (=> (not res!688190) (not e!580575))))

(declare-fun b!1028512 () Bool)

(assert (=> b!1028512 (= e!580576 (not call!43363))))

(declare-fun bm!43363 () Bool)

(assert (=> bm!43363 (= call!43363 (contains!5968 lt!453073 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43364 () Bool)

(assert (=> bm!43364 (= call!43365 (+!3099 (ite c!103783 call!43362 (ite c!103782 call!43366 call!43367)) (ite (or c!103783 c!103782) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))))))

(declare-fun bm!43365 () Bool)

(assert (=> bm!43365 (= call!43366 call!43362)))

(declare-fun b!1028513 () Bool)

(declare-fun Unit!33579 () Unit!33575)

(assert (=> b!1028513 (= e!580578 Unit!33579)))

(assert (= (and d!122965 c!103783) b!1028504))

(assert (= (and d!122965 (not c!103783)) b!1028498))

(assert (= (and b!1028498 c!103782) b!1028496))

(assert (= (and b!1028498 (not c!103782)) b!1028495))

(assert (= (and b!1028495 c!103781) b!1028499))

(assert (= (and b!1028495 (not c!103781)) b!1028507))

(assert (= (or b!1028499 b!1028507) bm!43362))

(assert (= (or b!1028496 bm!43362) bm!43365))

(assert (= (or b!1028496 b!1028499) bm!43360))

(assert (= (or b!1028504 bm!43365) bm!43359))

(assert (= (or b!1028504 bm!43360) bm!43364))

(assert (= (and d!122965 res!688194) b!1028497))

(assert (= (and d!122965 c!103784) b!1028510))

(assert (= (and d!122965 (not c!103784)) b!1028513))

(assert (= (and d!122965 res!688186) b!1028506))

(assert (= (and b!1028506 res!688191) b!1028493))

(assert (= (and b!1028506 (not res!688187)) b!1028503))

(assert (= (and b!1028503 res!688189) b!1028509))

(assert (= (and b!1028506 res!688193) b!1028505))

(assert (= (and b!1028505 c!103780) b!1028508))

(assert (= (and b!1028505 (not c!103780)) b!1028512))

(assert (= (and b!1028508 res!688192) b!1028501))

(assert (= (or b!1028508 b!1028512) bm!43363))

(assert (= (and b!1028505 res!688188) b!1028502))

(assert (= (and b!1028502 c!103785) b!1028511))

(assert (= (and b!1028502 (not c!103785)) b!1028500))

(assert (= (and b!1028511 res!688190) b!1028494))

(assert (= (or b!1028511 b!1028500) bm!43361))

(declare-fun b_lambda!15791 () Bool)

(assert (=> (not b_lambda!15791) (not b!1028509)))

(assert (=> b!1028509 t!30892))

(declare-fun b_and!32875 () Bool)

(assert (= b_and!32869 (and (=> t!30892 result!14121) b_and!32875)))

(declare-fun m!947291 () Bool)

(assert (=> b!1028510 m!947291))

(declare-fun m!947293 () Bool)

(assert (=> b!1028510 m!947293))

(declare-fun m!947295 () Bool)

(assert (=> b!1028510 m!947295))

(declare-fun m!947297 () Bool)

(assert (=> b!1028510 m!947297))

(declare-fun m!947299 () Bool)

(assert (=> b!1028510 m!947299))

(declare-fun m!947301 () Bool)

(assert (=> b!1028510 m!947301))

(declare-fun m!947303 () Bool)

(assert (=> b!1028510 m!947303))

(declare-fun m!947305 () Bool)

(assert (=> b!1028510 m!947305))

(declare-fun m!947307 () Bool)

(assert (=> b!1028510 m!947307))

(assert (=> b!1028510 m!947249))

(declare-fun m!947309 () Bool)

(assert (=> b!1028510 m!947309))

(declare-fun m!947311 () Bool)

(assert (=> b!1028510 m!947311))

(assert (=> b!1028510 m!947291))

(declare-fun m!947313 () Bool)

(assert (=> b!1028510 m!947313))

(declare-fun m!947315 () Bool)

(assert (=> b!1028510 m!947315))

(assert (=> b!1028510 m!947299))

(declare-fun m!947317 () Bool)

(assert (=> b!1028510 m!947317))

(declare-fun m!947319 () Bool)

(assert (=> b!1028510 m!947319))

(assert (=> b!1028510 m!947297))

(declare-fun m!947321 () Bool)

(assert (=> b!1028510 m!947321))

(assert (=> b!1028510 m!947293))

(assert (=> d!122965 m!947239))

(assert (=> b!1028493 m!947249))

(assert (=> b!1028493 m!947249))

(assert (=> b!1028493 m!947251))

(assert (=> b!1028509 m!947249))

(assert (=> b!1028509 m!947249))

(declare-fun m!947323 () Bool)

(assert (=> b!1028509 m!947323))

(declare-fun m!947325 () Bool)

(assert (=> b!1028509 m!947325))

(assert (=> b!1028509 m!947325))

(assert (=> b!1028509 m!947163))

(declare-fun m!947327 () Bool)

(assert (=> b!1028509 m!947327))

(assert (=> b!1028509 m!947163))

(declare-fun m!947329 () Bool)

(assert (=> b!1028501 m!947329))

(declare-fun m!947331 () Bool)

(assert (=> b!1028504 m!947331))

(declare-fun m!947333 () Bool)

(assert (=> bm!43363 m!947333))

(assert (=> b!1028497 m!947249))

(assert (=> b!1028497 m!947249))

(assert (=> b!1028497 m!947251))

(assert (=> b!1028503 m!947249))

(assert (=> b!1028503 m!947249))

(declare-fun m!947335 () Bool)

(assert (=> b!1028503 m!947335))

(declare-fun m!947337 () Bool)

(assert (=> b!1028494 m!947337))

(declare-fun m!947339 () Bool)

(assert (=> bm!43364 m!947339))

(declare-fun m!947341 () Bool)

(assert (=> bm!43361 m!947341))

(assert (=> bm!43359 m!947301))

(assert (=> b!1028332 d!122965))

(declare-fun bm!43366 () Bool)

(declare-fun call!43369 () (_ BitVec 32))

(assert (=> bm!43366 (= call!43369 (arrayCountValidKeys!0 lt!452950 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31651 (_keys!11257 thiss!1427))))))

(declare-fun b!1028514 () Bool)

(declare-fun e!580587 () (_ BitVec 32))

(declare-fun e!580588 () (_ BitVec 32))

(assert (=> b!1028514 (= e!580587 e!580588)))

(declare-fun c!103786 () Bool)

(assert (=> b!1028514 (= c!103786 (validKeyInArray!0 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(declare-fun b!1028515 () Bool)

(assert (=> b!1028515 (= e!580587 #b00000000000000000000000000000000)))

(declare-fun b!1028516 () Bool)

(assert (=> b!1028516 (= e!580588 call!43369)))

(declare-fun b!1028517 () Bool)

(assert (=> b!1028517 (= e!580588 (bvadd #b00000000000000000000000000000001 call!43369))))

(declare-fun d!122967 () Bool)

(declare-fun lt!453077 () (_ BitVec 32))

(assert (=> d!122967 (and (bvsge lt!453077 #b00000000000000000000000000000000) (bvsle lt!453077 (bvsub (size!31651 lt!452950) #b00000000000000000000000000000000)))))

(assert (=> d!122967 (= lt!453077 e!580587)))

(declare-fun c!103787 () Bool)

(assert (=> d!122967 (= c!103787 (bvsge #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))))))

(assert (=> d!122967 (and (bvsle #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31651 (_keys!11257 thiss!1427)) (size!31651 lt!452950)))))

(assert (=> d!122967 (= (arrayCountValidKeys!0 lt!452950 #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))) lt!453077)))

(assert (= (and d!122967 c!103787) b!1028515))

(assert (= (and d!122967 (not c!103787)) b!1028514))

(assert (= (and b!1028514 c!103786) b!1028517))

(assert (= (and b!1028514 (not c!103786)) b!1028516))

(assert (= (or b!1028517 b!1028516) bm!43366))

(declare-fun m!947343 () Bool)

(assert (=> bm!43366 m!947343))

(assert (=> b!1028514 m!947249))

(assert (=> b!1028514 m!947249))

(assert (=> b!1028514 m!947251))

(assert (=> b!1028332 d!122967))

(declare-fun b!1028518 () Bool)

(declare-fun e!580594 () Bool)

(assert (=> b!1028518 (= e!580594 (validKeyInArray!0 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028519 () Bool)

(declare-fun e!580590 () Bool)

(declare-fun lt!453096 () ListLongMap!13675)

(assert (=> b!1028519 (= e!580590 (= (apply!901 lt!453096 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5939 thiss!1427)))))

(declare-fun b!1028520 () Bool)

(declare-fun c!103789 () Bool)

(assert (=> b!1028520 (= c!103789 (and (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!580599 () ListLongMap!13675)

(declare-fun e!580592 () ListLongMap!13675)

(assert (=> b!1028520 (= e!580599 e!580592)))

(declare-fun d!122969 () Bool)

(declare-fun e!580600 () Bool)

(assert (=> d!122969 e!580600))

(declare-fun res!688195 () Bool)

(assert (=> d!122969 (=> (not res!688195) (not e!580600))))

(assert (=> d!122969 (= res!688195 (or (bvsge #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))))))))

(declare-fun lt!453088 () ListLongMap!13675)

(assert (=> d!122969 (= lt!453096 lt!453088)))

(declare-fun lt!453098 () Unit!33575)

(declare-fun e!580593 () Unit!33575)

(assert (=> d!122969 (= lt!453098 e!580593)))

(declare-fun c!103792 () Bool)

(declare-fun e!580589 () Bool)

(assert (=> d!122969 (= c!103792 e!580589)))

(declare-fun res!688203 () Bool)

(assert (=> d!122969 (=> (not res!688203) (not e!580589))))

(assert (=> d!122969 (= res!688203 (bvslt #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))))))

(declare-fun e!580595 () ListLongMap!13675)

(assert (=> d!122969 (= lt!453088 e!580595)))

(declare-fun c!103791 () Bool)

(assert (=> d!122969 (= c!103791 (and (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!122969 (validMask!0 (mask!29838 thiss!1427))))

(assert (=> d!122969 (= (getCurrentListMap!3901 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)) lt!453096)))

(declare-fun b!1028521 () Bool)

(declare-fun call!43372 () ListLongMap!13675)

(assert (=> b!1028521 (= e!580599 call!43372)))

(declare-fun b!1028522 () Bool)

(assert (=> b!1028522 (= e!580589 (validKeyInArray!0 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028523 () Bool)

(assert (=> b!1028523 (= e!580595 e!580599)))

(declare-fun c!103790 () Bool)

(assert (=> b!1028523 (= c!103790 (and (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43367 () Bool)

(declare-fun call!43370 () ListLongMap!13675)

(assert (=> bm!43367 (= call!43370 (getCurrentListMapNoExtraKeys!3515 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(declare-fun bm!43368 () Bool)

(declare-fun call!43373 () ListLongMap!13675)

(assert (=> bm!43368 (= call!43372 call!43373)))

(declare-fun b!1028524 () Bool)

(assert (=> b!1028524 (= e!580592 call!43372)))

(declare-fun b!1028525 () Bool)

(declare-fun e!580601 () Bool)

(declare-fun call!43376 () Bool)

(assert (=> b!1028525 (= e!580601 (not call!43376))))

(declare-fun b!1028526 () Bool)

(declare-fun e!580597 () Bool)

(assert (=> b!1028526 (= e!580597 (= (apply!901 lt!453096 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5939 thiss!1427)))))

(declare-fun b!1028527 () Bool)

(assert (=> b!1028527 (= e!580600 e!580601)))

(declare-fun c!103793 () Bool)

(assert (=> b!1028527 (= c!103793 (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1028528 () Bool)

(declare-fun e!580598 () Bool)

(declare-fun e!580596 () Bool)

(assert (=> b!1028528 (= e!580598 e!580596)))

(declare-fun res!688198 () Bool)

(assert (=> b!1028528 (=> (not res!688198) (not e!580596))))

(assert (=> b!1028528 (= res!688198 (contains!5968 lt!453096 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1028528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))))))

(declare-fun b!1028529 () Bool)

(assert (=> b!1028529 (= e!580595 (+!3099 call!43373 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))))

(declare-fun b!1028530 () Bool)

(declare-fun res!688197 () Bool)

(assert (=> b!1028530 (=> (not res!688197) (not e!580600))))

(declare-fun e!580591 () Bool)

(assert (=> b!1028530 (= res!688197 e!580591)))

(declare-fun c!103788 () Bool)

(assert (=> b!1028530 (= c!103788 (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1028531 () Bool)

(declare-fun res!688202 () Bool)

(assert (=> b!1028531 (=> (not res!688202) (not e!580600))))

(assert (=> b!1028531 (= res!688202 e!580598)))

(declare-fun res!688196 () Bool)

(assert (=> b!1028531 (=> res!688196 e!580598)))

(assert (=> b!1028531 (= res!688196 (not e!580594))))

(declare-fun res!688200 () Bool)

(assert (=> b!1028531 (=> (not res!688200) (not e!580594))))

(assert (=> b!1028531 (= res!688200 (bvslt #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))))))

(declare-fun b!1028532 () Bool)

(declare-fun call!43375 () ListLongMap!13675)

(assert (=> b!1028532 (= e!580592 call!43375)))

(declare-fun b!1028533 () Bool)

(assert (=> b!1028533 (= e!580591 e!580597)))

(declare-fun res!688201 () Bool)

(declare-fun call!43371 () Bool)

(assert (=> b!1028533 (= res!688201 call!43371)))

(assert (=> b!1028533 (=> (not res!688201) (not e!580597))))

(declare-fun bm!43369 () Bool)

(assert (=> bm!43369 (= call!43376 (contains!5968 lt!453096 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43370 () Bool)

(declare-fun call!43374 () ListLongMap!13675)

(assert (=> bm!43370 (= call!43375 call!43374)))

(declare-fun b!1028534 () Bool)

(assert (=> b!1028534 (= e!580596 (= (apply!901 lt!453096 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)) (get!16347 (select (arr!31138 (_values!6126 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028534 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31652 (_values!6126 thiss!1427))))))

(assert (=> b!1028534 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))))))

(declare-fun b!1028535 () Bool)

(declare-fun lt!453082 () Unit!33575)

(assert (=> b!1028535 (= e!580593 lt!453082)))

(declare-fun lt!453085 () ListLongMap!13675)

(assert (=> b!1028535 (= lt!453085 (getCurrentListMapNoExtraKeys!3515 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(declare-fun lt!453086 () (_ BitVec 64))

(assert (=> b!1028535 (= lt!453086 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453093 () (_ BitVec 64))

(assert (=> b!1028535 (= lt!453093 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453092 () Unit!33575)

(assert (=> b!1028535 (= lt!453092 (addStillContains!620 lt!453085 lt!453086 (zeroValue!5939 thiss!1427) lt!453093))))

(assert (=> b!1028535 (contains!5968 (+!3099 lt!453085 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427))) lt!453093)))

(declare-fun lt!453091 () Unit!33575)

(assert (=> b!1028535 (= lt!453091 lt!453092)))

(declare-fun lt!453097 () ListLongMap!13675)

(assert (=> b!1028535 (= lt!453097 (getCurrentListMapNoExtraKeys!3515 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(declare-fun lt!453095 () (_ BitVec 64))

(assert (=> b!1028535 (= lt!453095 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453078 () (_ BitVec 64))

(assert (=> b!1028535 (= lt!453078 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453090 () Unit!33575)

(assert (=> b!1028535 (= lt!453090 (addApplyDifferent!480 lt!453097 lt!453095 (minValue!5939 thiss!1427) lt!453078))))

(assert (=> b!1028535 (= (apply!901 (+!3099 lt!453097 (tuple2!15545 lt!453095 (minValue!5939 thiss!1427))) lt!453078) (apply!901 lt!453097 lt!453078))))

(declare-fun lt!453099 () Unit!33575)

(assert (=> b!1028535 (= lt!453099 lt!453090)))

(declare-fun lt!453080 () ListLongMap!13675)

(assert (=> b!1028535 (= lt!453080 (getCurrentListMapNoExtraKeys!3515 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(declare-fun lt!453081 () (_ BitVec 64))

(assert (=> b!1028535 (= lt!453081 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453079 () (_ BitVec 64))

(assert (=> b!1028535 (= lt!453079 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453087 () Unit!33575)

(assert (=> b!1028535 (= lt!453087 (addApplyDifferent!480 lt!453080 lt!453081 (zeroValue!5939 thiss!1427) lt!453079))))

(assert (=> b!1028535 (= (apply!901 (+!3099 lt!453080 (tuple2!15545 lt!453081 (zeroValue!5939 thiss!1427))) lt!453079) (apply!901 lt!453080 lt!453079))))

(declare-fun lt!453094 () Unit!33575)

(assert (=> b!1028535 (= lt!453094 lt!453087)))

(declare-fun lt!453089 () ListLongMap!13675)

(assert (=> b!1028535 (= lt!453089 (getCurrentListMapNoExtraKeys!3515 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(declare-fun lt!453083 () (_ BitVec 64))

(assert (=> b!1028535 (= lt!453083 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453084 () (_ BitVec 64))

(assert (=> b!1028535 (= lt!453084 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028535 (= lt!453082 (addApplyDifferent!480 lt!453089 lt!453083 (minValue!5939 thiss!1427) lt!453084))))

(assert (=> b!1028535 (= (apply!901 (+!3099 lt!453089 (tuple2!15545 lt!453083 (minValue!5939 thiss!1427))) lt!453084) (apply!901 lt!453089 lt!453084))))

(declare-fun b!1028536 () Bool)

(assert (=> b!1028536 (= e!580601 e!580590)))

(declare-fun res!688199 () Bool)

(assert (=> b!1028536 (= res!688199 call!43376)))

(assert (=> b!1028536 (=> (not res!688199) (not e!580590))))

(declare-fun b!1028537 () Bool)

(assert (=> b!1028537 (= e!580591 (not call!43371))))

(declare-fun bm!43371 () Bool)

(assert (=> bm!43371 (= call!43371 (contains!5968 lt!453096 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43372 () Bool)

(assert (=> bm!43372 (= call!43373 (+!3099 (ite c!103791 call!43370 (ite c!103790 call!43374 call!43375)) (ite (or c!103791 c!103790) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))))))

(declare-fun bm!43373 () Bool)

(assert (=> bm!43373 (= call!43374 call!43370)))

(declare-fun b!1028538 () Bool)

(declare-fun Unit!33580 () Unit!33575)

(assert (=> b!1028538 (= e!580593 Unit!33580)))

(assert (= (and d!122969 c!103791) b!1028529))

(assert (= (and d!122969 (not c!103791)) b!1028523))

(assert (= (and b!1028523 c!103790) b!1028521))

(assert (= (and b!1028523 (not c!103790)) b!1028520))

(assert (= (and b!1028520 c!103789) b!1028524))

(assert (= (and b!1028520 (not c!103789)) b!1028532))

(assert (= (or b!1028524 b!1028532) bm!43370))

(assert (= (or b!1028521 bm!43370) bm!43373))

(assert (= (or b!1028521 b!1028524) bm!43368))

(assert (= (or b!1028529 bm!43373) bm!43367))

(assert (= (or b!1028529 bm!43368) bm!43372))

(assert (= (and d!122969 res!688203) b!1028522))

(assert (= (and d!122969 c!103792) b!1028535))

(assert (= (and d!122969 (not c!103792)) b!1028538))

(assert (= (and d!122969 res!688195) b!1028531))

(assert (= (and b!1028531 res!688200) b!1028518))

(assert (= (and b!1028531 (not res!688196)) b!1028528))

(assert (= (and b!1028528 res!688198) b!1028534))

(assert (= (and b!1028531 res!688202) b!1028530))

(assert (= (and b!1028530 c!103788) b!1028533))

(assert (= (and b!1028530 (not c!103788)) b!1028537))

(assert (= (and b!1028533 res!688201) b!1028526))

(assert (= (or b!1028533 b!1028537) bm!43371))

(assert (= (and b!1028530 res!688197) b!1028527))

(assert (= (and b!1028527 c!103793) b!1028536))

(assert (= (and b!1028527 (not c!103793)) b!1028525))

(assert (= (and b!1028536 res!688199) b!1028519))

(assert (= (or b!1028536 b!1028525) bm!43369))

(declare-fun b_lambda!15793 () Bool)

(assert (=> (not b_lambda!15793) (not b!1028534)))

(assert (=> b!1028534 t!30892))

(declare-fun b_and!32877 () Bool)

(assert (= b_and!32875 (and (=> t!30892 result!14121) b_and!32877)))

(declare-fun m!947345 () Bool)

(assert (=> b!1028535 m!947345))

(declare-fun m!947347 () Bool)

(assert (=> b!1028535 m!947347))

(declare-fun m!947349 () Bool)

(assert (=> b!1028535 m!947349))

(declare-fun m!947351 () Bool)

(assert (=> b!1028535 m!947351))

(declare-fun m!947353 () Bool)

(assert (=> b!1028535 m!947353))

(declare-fun m!947355 () Bool)

(assert (=> b!1028535 m!947355))

(declare-fun m!947357 () Bool)

(assert (=> b!1028535 m!947357))

(declare-fun m!947359 () Bool)

(assert (=> b!1028535 m!947359))

(declare-fun m!947361 () Bool)

(assert (=> b!1028535 m!947361))

(assert (=> b!1028535 m!947287))

(declare-fun m!947363 () Bool)

(assert (=> b!1028535 m!947363))

(declare-fun m!947365 () Bool)

(assert (=> b!1028535 m!947365))

(assert (=> b!1028535 m!947345))

(declare-fun m!947367 () Bool)

(assert (=> b!1028535 m!947367))

(declare-fun m!947369 () Bool)

(assert (=> b!1028535 m!947369))

(assert (=> b!1028535 m!947353))

(declare-fun m!947371 () Bool)

(assert (=> b!1028535 m!947371))

(declare-fun m!947373 () Bool)

(assert (=> b!1028535 m!947373))

(assert (=> b!1028535 m!947351))

(declare-fun m!947375 () Bool)

(assert (=> b!1028535 m!947375))

(assert (=> b!1028535 m!947347))

(assert (=> d!122969 m!947239))

(assert (=> b!1028518 m!947287))

(assert (=> b!1028518 m!947287))

(assert (=> b!1028518 m!947289))

(assert (=> b!1028534 m!947287))

(assert (=> b!1028534 m!947287))

(declare-fun m!947377 () Bool)

(assert (=> b!1028534 m!947377))

(declare-fun m!947379 () Bool)

(assert (=> b!1028534 m!947379))

(assert (=> b!1028534 m!947379))

(assert (=> b!1028534 m!947163))

(declare-fun m!947381 () Bool)

(assert (=> b!1028534 m!947381))

(assert (=> b!1028534 m!947163))

(declare-fun m!947383 () Bool)

(assert (=> b!1028526 m!947383))

(declare-fun m!947385 () Bool)

(assert (=> b!1028529 m!947385))

(declare-fun m!947387 () Bool)

(assert (=> bm!43371 m!947387))

(assert (=> b!1028522 m!947287))

(assert (=> b!1028522 m!947287))

(assert (=> b!1028522 m!947289))

(assert (=> b!1028528 m!947287))

(assert (=> b!1028528 m!947287))

(declare-fun m!947389 () Bool)

(assert (=> b!1028528 m!947389))

(declare-fun m!947391 () Bool)

(assert (=> b!1028519 m!947391))

(declare-fun m!947393 () Bool)

(assert (=> bm!43372 m!947393))

(declare-fun m!947395 () Bool)

(assert (=> bm!43369 m!947395))

(assert (=> bm!43367 m!947355))

(assert (=> b!1028332 d!122969))

(declare-fun d!122971 () Bool)

(declare-fun lt!453102 () ListLongMap!13675)

(assert (=> d!122971 (not (contains!5968 lt!453102 key!909))))

(declare-fun removeStrictlySorted!51 (List!21815 (_ BitVec 64)) List!21815)

(assert (=> d!122971 (= lt!453102 (ListLongMap!13676 (removeStrictlySorted!51 (toList!6853 (getCurrentListMap!3901 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427))) key!909)))))

(assert (=> d!122971 (= (-!480 (getCurrentListMap!3901 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)) key!909) lt!453102)))

(declare-fun bs!30023 () Bool)

(assert (= bs!30023 d!122971))

(declare-fun m!947397 () Bool)

(assert (=> bs!30023 m!947397))

(declare-fun m!947399 () Bool)

(assert (=> bs!30023 m!947399))

(assert (=> b!1028332 d!122971))

(declare-fun d!122973 () Bool)

(declare-fun e!580604 () Bool)

(assert (=> d!122973 e!580604))

(declare-fun res!688206 () Bool)

(assert (=> d!122973 (=> (not res!688206) (not e!580604))))

(assert (=> d!122973 (= res!688206 (and (bvsge (index!41088 lt!452945) #b00000000000000000000000000000000) (bvslt (index!41088 lt!452945) (size!31651 (_keys!11257 thiss!1427)))))))

(declare-fun lt!453105 () Unit!33575)

(declare-fun choose!1685 (array!64660 array!64662 (_ BitVec 32) (_ BitVec 32) V!37277 V!37277 (_ BitVec 32) (_ BitVec 64) Int) Unit!33575)

(assert (=> d!122973 (= lt!453105 (choose!1685 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) (index!41088 lt!452945) key!909 (defaultEntry!6103 thiss!1427)))))

(assert (=> d!122973 (validMask!0 (mask!29838 thiss!1427))))

(assert (=> d!122973 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!6 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) (index!41088 lt!452945) key!909 (defaultEntry!6103 thiss!1427)) lt!453105)))

(declare-fun b!1028541 () Bool)

(assert (=> b!1028541 (= e!580604 (= (-!480 (getCurrentListMap!3901 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)) key!909) (getCurrentListMap!3901 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) (array!64663 (store (arr!31138 (_values!6126 thiss!1427)) (index!41088 lt!452945) (ValueCellFull!11448 (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31652 (_values!6126 thiss!1427))) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427))))))

(assert (=> b!1028541 (bvslt (index!41088 lt!452945) (size!31652 (_values!6126 thiss!1427)))))

(assert (= (and d!122973 res!688206) b!1028541))

(declare-fun b_lambda!15795 () Bool)

(assert (=> (not b_lambda!15795) (not b!1028541)))

(assert (=> b!1028541 t!30892))

(declare-fun b_and!32879 () Bool)

(assert (= b_and!32877 (and (=> t!30892 result!14121) b_and!32879)))

(declare-fun m!947401 () Bool)

(assert (=> d!122973 m!947401))

(assert (=> d!122973 m!947239))

(assert (=> b!1028541 m!947147))

(assert (=> b!1028541 m!947179))

(assert (=> b!1028541 m!947163))

(declare-fun m!947403 () Bool)

(assert (=> b!1028541 m!947403))

(assert (=> b!1028541 m!947159))

(assert (=> b!1028541 m!947161))

(assert (=> b!1028541 m!947159))

(assert (=> b!1028332 d!122973))

(declare-fun d!122975 () Bool)

(declare-fun e!580607 () Bool)

(assert (=> d!122975 e!580607))

(declare-fun res!688209 () Bool)

(assert (=> d!122975 (=> (not res!688209) (not e!580607))))

(assert (=> d!122975 (= res!688209 (and (bvsge (index!41088 lt!452945) #b00000000000000000000000000000000) (bvslt (index!41088 lt!452945) (size!31651 (_keys!11257 thiss!1427)))))))

(declare-fun lt!453108 () Unit!33575)

(declare-fun choose!25 (array!64660 (_ BitVec 32) (_ BitVec 32)) Unit!33575)

(assert (=> d!122975 (= lt!453108 (choose!25 (_keys!11257 thiss!1427) (index!41088 lt!452945) (mask!29838 thiss!1427)))))

(assert (=> d!122975 (validMask!0 (mask!29838 thiss!1427))))

(assert (=> d!122975 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11257 thiss!1427) (index!41088 lt!452945) (mask!29838 thiss!1427)) lt!453108)))

(declare-fun b!1028544 () Bool)

(assert (=> b!1028544 (= e!580607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) (mask!29838 thiss!1427)))))

(assert (= (and d!122975 res!688209) b!1028544))

(declare-fun m!947405 () Bool)

(assert (=> d!122975 m!947405))

(assert (=> d!122975 m!947239))

(assert (=> b!1028544 m!947179))

(declare-fun m!947407 () Bool)

(assert (=> b!1028544 m!947407))

(assert (=> b!1028332 d!122975))

(declare-fun d!122977 () Bool)

(assert (=> d!122977 (= (validMask!0 (mask!29838 (_2!7782 lt!452948))) (and (or (= (mask!29838 (_2!7782 lt!452948)) #b00000000000000000000000000000111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000000000000000000001111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000000000000000000011111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000000000000000000111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000000000000000001111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000000000000000011111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000000000000000111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000000000000001111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000000000000011111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000000000000111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000000000001111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000000000011111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000000000111111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000000001111111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000000011111111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000000111111111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000001111111111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000011111111111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000000111111111111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000001111111111111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000011111111111111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000000111111111111111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000001111111111111111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000011111111111111111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00000111111111111111111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00001111111111111111111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00011111111111111111111111111111) (= (mask!29838 (_2!7782 lt!452948)) #b00111111111111111111111111111111)) (bvsle (mask!29838 (_2!7782 lt!452948)) #b00111111111111111111111111111111)))))

(assert (=> b!1028332 d!122977))

(declare-fun d!122979 () Bool)

(assert (=> d!122979 (= (array_inv!24103 (_keys!11257 thiss!1427)) (bvsge (size!31651 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028328 d!122979))

(declare-fun d!122981 () Bool)

(assert (=> d!122981 (= (array_inv!24104 (_values!6126 thiss!1427)) (bvsge (size!31652 (_values!6126 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028328 d!122981))

(declare-fun condMapEmpty!37896 () Bool)

(declare-fun mapDefault!37896 () ValueCell!11448)

(assert (=> mapNonEmpty!37890 (= condMapEmpty!37896 (= mapRest!37890 ((as const (Array (_ BitVec 32) ValueCell!11448)) mapDefault!37896)))))

(declare-fun e!580613 () Bool)

(declare-fun mapRes!37896 () Bool)

(assert (=> mapNonEmpty!37890 (= tp!72802 (and e!580613 mapRes!37896))))

(declare-fun b!1028552 () Bool)

(assert (=> b!1028552 (= e!580613 tp_is_empty!24303)))

(declare-fun b!1028551 () Bool)

(declare-fun e!580612 () Bool)

(assert (=> b!1028551 (= e!580612 tp_is_empty!24303)))

(declare-fun mapNonEmpty!37896 () Bool)

(declare-fun tp!72811 () Bool)

(assert (=> mapNonEmpty!37896 (= mapRes!37896 (and tp!72811 e!580612))))

(declare-fun mapKey!37896 () (_ BitVec 32))

(declare-fun mapValue!37896 () ValueCell!11448)

(declare-fun mapRest!37896 () (Array (_ BitVec 32) ValueCell!11448))

(assert (=> mapNonEmpty!37896 (= mapRest!37890 (store mapRest!37896 mapKey!37896 mapValue!37896))))

(declare-fun mapIsEmpty!37896 () Bool)

(assert (=> mapIsEmpty!37896 mapRes!37896))

(assert (= (and mapNonEmpty!37890 condMapEmpty!37896) mapIsEmpty!37896))

(assert (= (and mapNonEmpty!37890 (not condMapEmpty!37896)) mapNonEmpty!37896))

(assert (= (and mapNonEmpty!37896 ((_ is ValueCellFull!11448) mapValue!37896)) b!1028551))

(assert (= (and mapNonEmpty!37890 ((_ is ValueCellFull!11448) mapDefault!37896)) b!1028552))

(declare-fun m!947409 () Bool)

(assert (=> mapNonEmpty!37896 m!947409))

(declare-fun b_lambda!15797 () Bool)

(assert (= b_lambda!15791 (or (and b!1028328 b_free!20583) b_lambda!15797)))

(declare-fun b_lambda!15799 () Bool)

(assert (= b_lambda!15795 (or (and b!1028328 b_free!20583) b_lambda!15799)))

(declare-fun b_lambda!15801 () Bool)

(assert (= b_lambda!15793 (or (and b!1028328 b_free!20583) b_lambda!15801)))

(check-sat (not b!1028438) (not bm!43341) (not bm!43361) (not bm!43372) (not d!122949) (not b!1028387) (not bm!43359) (not b!1028509) (not d!122975) (not b!1028433) (not b!1028501) (not b!1028526) (not d!122973) (not mapNonEmpty!37896) (not b_lambda!15789) tp_is_empty!24303 (not b_lambda!15797) (not bm!43363) (not b!1028528) (not b!1028534) (not bm!43369) (not b!1028385) (not bm!43371) (not b!1028522) (not b!1028518) (not b!1028504) (not bm!43367) (not b!1028544) (not bm!43364) (not d!122969) (not d!122955) (not b!1028493) (not d!122971) (not b!1028529) (not b!1028510) (not b!1028401) (not b_next!20583) (not d!122947) (not bm!43366) (not b!1028417) (not b_lambda!15801) b_and!32879 (not d!122961) (not b_lambda!15799) (not bm!43338) (not b!1028432) (not b!1028423) (not d!122959) (not b!1028519) (not b!1028447) (not d!122965) (not b!1028503) (not b!1028386) (not bm!43344) (not b!1028414) (not b!1028412) (not b!1028375) (not b!1028541) (not b!1028435) (not b!1028514) (not b!1028400) (not b!1028535) (not b!1028494) (not b!1028399) (not b!1028497))
(check-sat b_and!32879 (not b_next!20583))
(get-model)

(declare-fun d!122983 () Bool)

(declare-fun e!580619 () Bool)

(assert (=> d!122983 e!580619))

(declare-fun res!688212 () Bool)

(assert (=> d!122983 (=> res!688212 e!580619)))

(declare-fun lt!453119 () Bool)

(assert (=> d!122983 (= res!688212 (not lt!453119))))

(declare-fun lt!453118 () Bool)

(assert (=> d!122983 (= lt!453119 lt!453118)))

(declare-fun lt!453117 () Unit!33575)

(declare-fun e!580618 () Unit!33575)

(assert (=> d!122983 (= lt!453117 e!580618)))

(declare-fun c!103796 () Bool)

(assert (=> d!122983 (= c!103796 lt!453118)))

(declare-fun containsKey!560 (List!21815 (_ BitVec 64)) Bool)

(assert (=> d!122983 (= lt!453118 (containsKey!560 (toList!6853 lt!453102) key!909))))

(assert (=> d!122983 (= (contains!5968 lt!453102 key!909) lt!453119)))

(declare-fun b!1028559 () Bool)

(declare-fun lt!453120 () Unit!33575)

(assert (=> b!1028559 (= e!580618 lt!453120)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!393 (List!21815 (_ BitVec 64)) Unit!33575)

(assert (=> b!1028559 (= lt!453120 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6853 lt!453102) key!909))))

(declare-datatypes ((Option!636 0))(
  ( (Some!635 (v!14776 V!37277)) (None!634) )
))
(declare-fun isDefined!432 (Option!636) Bool)

(declare-fun getValueByKey!585 (List!21815 (_ BitVec 64)) Option!636)

(assert (=> b!1028559 (isDefined!432 (getValueByKey!585 (toList!6853 lt!453102) key!909))))

(declare-fun b!1028560 () Bool)

(declare-fun Unit!33581 () Unit!33575)

(assert (=> b!1028560 (= e!580618 Unit!33581)))

(declare-fun b!1028561 () Bool)

(assert (=> b!1028561 (= e!580619 (isDefined!432 (getValueByKey!585 (toList!6853 lt!453102) key!909)))))

(assert (= (and d!122983 c!103796) b!1028559))

(assert (= (and d!122983 (not c!103796)) b!1028560))

(assert (= (and d!122983 (not res!688212)) b!1028561))

(declare-fun m!947411 () Bool)

(assert (=> d!122983 m!947411))

(declare-fun m!947413 () Bool)

(assert (=> b!1028559 m!947413))

(declare-fun m!947415 () Bool)

(assert (=> b!1028559 m!947415))

(assert (=> b!1028559 m!947415))

(declare-fun m!947417 () Bool)

(assert (=> b!1028559 m!947417))

(assert (=> b!1028561 m!947415))

(assert (=> b!1028561 m!947415))

(assert (=> b!1028561 m!947417))

(assert (=> d!122971 d!122983))

(declare-fun b!1028572 () Bool)

(declare-fun e!580626 () Bool)

(declare-fun lt!453123 () List!21815)

(assert (=> b!1028572 (= e!580626 (not (containsKey!560 lt!453123 key!909)))))

(declare-fun b!1028573 () Bool)

(declare-fun e!580628 () List!21815)

(declare-fun $colon$colon!599 (List!21815 tuple2!15544) List!21815)

(assert (=> b!1028573 (= e!580628 ($colon$colon!599 (removeStrictlySorted!51 (t!30893 (toList!6853 (getCurrentListMap!3901 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))) key!909) (h!23010 (toList!6853 (getCurrentListMap!3901 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427))))))))

(declare-fun d!122985 () Bool)

(assert (=> d!122985 e!580626))

(declare-fun res!688215 () Bool)

(assert (=> d!122985 (=> (not res!688215) (not e!580626))))

(declare-fun isStrictlySorted!715 (List!21815) Bool)

(assert (=> d!122985 (= res!688215 (isStrictlySorted!715 lt!453123))))

(declare-fun e!580627 () List!21815)

(assert (=> d!122985 (= lt!453123 e!580627)))

(declare-fun c!103802 () Bool)

(assert (=> d!122985 (= c!103802 (and ((_ is Cons!21811) (toList!6853 (getCurrentListMap!3901 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))) (= (_1!7783 (h!23010 (toList!6853 (getCurrentListMap!3901 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427))))) key!909)))))

(assert (=> d!122985 (isStrictlySorted!715 (toList!6853 (getCurrentListMap!3901 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427))))))

(assert (=> d!122985 (= (removeStrictlySorted!51 (toList!6853 (getCurrentListMap!3901 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427))) key!909) lt!453123)))

(declare-fun b!1028574 () Bool)

(assert (=> b!1028574 (= e!580627 (t!30893 (toList!6853 (getCurrentListMap!3901 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))))

(declare-fun b!1028575 () Bool)

(assert (=> b!1028575 (= e!580627 e!580628)))

(declare-fun c!103801 () Bool)

(assert (=> b!1028575 (= c!103801 (and ((_ is Cons!21811) (toList!6853 (getCurrentListMap!3901 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))) (not (= (_1!7783 (h!23010 (toList!6853 (getCurrentListMap!3901 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427))))) key!909))))))

(declare-fun b!1028576 () Bool)

(assert (=> b!1028576 (= e!580628 Nil!21812)))

(assert (= (and d!122985 c!103802) b!1028574))

(assert (= (and d!122985 (not c!103802)) b!1028575))

(assert (= (and b!1028575 c!103801) b!1028573))

(assert (= (and b!1028575 (not c!103801)) b!1028576))

(assert (= (and d!122985 res!688215) b!1028572))

(declare-fun m!947419 () Bool)

(assert (=> b!1028572 m!947419))

(declare-fun m!947421 () Bool)

(assert (=> b!1028573 m!947421))

(assert (=> b!1028573 m!947421))

(declare-fun m!947423 () Bool)

(assert (=> b!1028573 m!947423))

(declare-fun m!947425 () Bool)

(assert (=> d!122985 m!947425))

(declare-fun m!947427 () Bool)

(assert (=> d!122985 m!947427))

(assert (=> d!122971 d!122985))

(declare-fun d!122987 () Bool)

(declare-fun res!688216 () Bool)

(declare-fun e!580629 () Bool)

(assert (=> d!122987 (=> res!688216 e!580629)))

(assert (=> d!122987 (= res!688216 (= (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!122987 (= (arrayContainsKey!0 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) key!909 #b00000000000000000000000000000000) e!580629)))

(declare-fun b!1028577 () Bool)

(declare-fun e!580630 () Bool)

(assert (=> b!1028577 (= e!580629 e!580630)))

(declare-fun res!688217 () Bool)

(assert (=> b!1028577 (=> (not res!688217) (not e!580630))))

(assert (=> b!1028577 (= res!688217 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31651 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))))))))

(declare-fun b!1028578 () Bool)

(assert (=> b!1028578 (= e!580630 (arrayContainsKey!0 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!122987 (not res!688216)) b!1028577))

(assert (= (and b!1028577 res!688217) b!1028578))

(declare-fun m!947429 () Bool)

(assert (=> d!122987 m!947429))

(declare-fun m!947431 () Bool)

(assert (=> b!1028578 m!947431))

(assert (=> b!1028438 d!122987))

(declare-fun d!122989 () Bool)

(declare-fun get!16348 (Option!636) V!37277)

(assert (=> d!122989 (= (apply!901 lt!453073 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16348 (getValueByKey!585 (toList!6853 lt!453073) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30024 () Bool)

(assert (= bs!30024 d!122989))

(declare-fun m!947433 () Bool)

(assert (=> bs!30024 m!947433))

(assert (=> bs!30024 m!947433))

(declare-fun m!947435 () Bool)

(assert (=> bs!30024 m!947435))

(assert (=> b!1028501 d!122989))

(declare-fun d!122991 () Bool)

(assert (=> d!122991 (= (apply!901 lt!453096 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16348 (getValueByKey!585 (toList!6853 lt!453096) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30025 () Bool)

(assert (= bs!30025 d!122991))

(declare-fun m!947437 () Bool)

(assert (=> bs!30025 m!947437))

(assert (=> bs!30025 m!947437))

(declare-fun m!947439 () Bool)

(assert (=> bs!30025 m!947439))

(assert (=> b!1028519 d!122991))

(declare-fun b!1028579 () Bool)

(declare-fun e!580633 () Bool)

(declare-fun call!43377 () Bool)

(assert (=> b!1028579 (= e!580633 call!43377)))

(declare-fun b!1028580 () Bool)

(declare-fun e!580632 () Bool)

(declare-fun e!580634 () Bool)

(assert (=> b!1028580 (= e!580632 e!580634)))

(declare-fun res!688220 () Bool)

(assert (=> b!1028580 (=> (not res!688220) (not e!580634))))

(declare-fun e!580631 () Bool)

(assert (=> b!1028580 (= res!688220 (not e!580631))))

(declare-fun res!688218 () Bool)

(assert (=> b!1028580 (=> (not res!688218) (not e!580631))))

(assert (=> b!1028580 (= res!688218 (validKeyInArray!0 (select (arr!31137 lt!452950) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!122993 () Bool)

(declare-fun res!688219 () Bool)

(assert (=> d!122993 (=> res!688219 e!580632)))

(assert (=> d!122993 (= res!688219 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31651 lt!452950)))))

(assert (=> d!122993 (= (arrayNoDuplicates!0 lt!452950 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103758 (Cons!21812 (select (arr!31137 lt!452950) #b00000000000000000000000000000000) Nil!21813) Nil!21813)) e!580632)))

(declare-fun b!1028581 () Bool)

(assert (=> b!1028581 (= e!580631 (contains!5967 (ite c!103758 (Cons!21812 (select (arr!31137 lt!452950) #b00000000000000000000000000000000) Nil!21813) Nil!21813) (select (arr!31137 lt!452950) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!43374 () Bool)

(declare-fun c!103803 () Bool)

(assert (=> bm!43374 (= call!43377 (arrayNoDuplicates!0 lt!452950 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!103803 (Cons!21812 (select (arr!31137 lt!452950) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!103758 (Cons!21812 (select (arr!31137 lt!452950) #b00000000000000000000000000000000) Nil!21813) Nil!21813)) (ite c!103758 (Cons!21812 (select (arr!31137 lt!452950) #b00000000000000000000000000000000) Nil!21813) Nil!21813))))))

(declare-fun b!1028582 () Bool)

(assert (=> b!1028582 (= e!580634 e!580633)))

(assert (=> b!1028582 (= c!103803 (validKeyInArray!0 (select (arr!31137 lt!452950) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1028583 () Bool)

(assert (=> b!1028583 (= e!580633 call!43377)))

(assert (= (and d!122993 (not res!688219)) b!1028580))

(assert (= (and b!1028580 res!688218) b!1028581))

(assert (= (and b!1028580 res!688220) b!1028582))

(assert (= (and b!1028582 c!103803) b!1028583))

(assert (= (and b!1028582 (not c!103803)) b!1028579))

(assert (= (or b!1028583 b!1028579) bm!43374))

(declare-fun m!947441 () Bool)

(assert (=> b!1028580 m!947441))

(assert (=> b!1028580 m!947441))

(declare-fun m!947443 () Bool)

(assert (=> b!1028580 m!947443))

(assert (=> b!1028581 m!947441))

(assert (=> b!1028581 m!947441))

(declare-fun m!947445 () Bool)

(assert (=> b!1028581 m!947445))

(assert (=> bm!43374 m!947441))

(declare-fun m!947447 () Bool)

(assert (=> bm!43374 m!947447))

(assert (=> b!1028582 m!947441))

(assert (=> b!1028582 m!947441))

(assert (=> b!1028582 m!947443))

(assert (=> bm!43338 d!122993))

(declare-fun d!122995 () Bool)

(declare-fun e!580636 () Bool)

(assert (=> d!122995 e!580636))

(declare-fun res!688221 () Bool)

(assert (=> d!122995 (=> res!688221 e!580636)))

(declare-fun lt!453126 () Bool)

(assert (=> d!122995 (= res!688221 (not lt!453126))))

(declare-fun lt!453125 () Bool)

(assert (=> d!122995 (= lt!453126 lt!453125)))

(declare-fun lt!453124 () Unit!33575)

(declare-fun e!580635 () Unit!33575)

(assert (=> d!122995 (= lt!453124 e!580635)))

(declare-fun c!103804 () Bool)

(assert (=> d!122995 (= c!103804 lt!453125)))

(assert (=> d!122995 (= lt!453125 (containsKey!560 (toList!6853 lt!453096) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122995 (= (contains!5968 lt!453096 #b0000000000000000000000000000000000000000000000000000000000000000) lt!453126)))

(declare-fun b!1028584 () Bool)

(declare-fun lt!453127 () Unit!33575)

(assert (=> b!1028584 (= e!580635 lt!453127)))

(assert (=> b!1028584 (= lt!453127 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6853 lt!453096) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1028584 (isDefined!432 (getValueByKey!585 (toList!6853 lt!453096) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028585 () Bool)

(declare-fun Unit!33582 () Unit!33575)

(assert (=> b!1028585 (= e!580635 Unit!33582)))

(declare-fun b!1028586 () Bool)

(assert (=> b!1028586 (= e!580636 (isDefined!432 (getValueByKey!585 (toList!6853 lt!453096) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122995 c!103804) b!1028584))

(assert (= (and d!122995 (not c!103804)) b!1028585))

(assert (= (and d!122995 (not res!688221)) b!1028586))

(declare-fun m!947449 () Bool)

(assert (=> d!122995 m!947449))

(declare-fun m!947451 () Bool)

(assert (=> b!1028584 m!947451))

(declare-fun m!947453 () Bool)

(assert (=> b!1028584 m!947453))

(assert (=> b!1028584 m!947453))

(declare-fun m!947455 () Bool)

(assert (=> b!1028584 m!947455))

(assert (=> b!1028586 m!947453))

(assert (=> b!1028586 m!947453))

(assert (=> b!1028586 m!947455))

(assert (=> bm!43371 d!122995))

(declare-fun d!122997 () Bool)

(declare-fun e!580638 () Bool)

(assert (=> d!122997 e!580638))

(declare-fun res!688222 () Bool)

(assert (=> d!122997 (=> res!688222 e!580638)))

(declare-fun lt!453130 () Bool)

(assert (=> d!122997 (= res!688222 (not lt!453130))))

(declare-fun lt!453129 () Bool)

(assert (=> d!122997 (= lt!453130 lt!453129)))

(declare-fun lt!453128 () Unit!33575)

(declare-fun e!580637 () Unit!33575)

(assert (=> d!122997 (= lt!453128 e!580637)))

(declare-fun c!103805 () Bool)

(assert (=> d!122997 (= c!103805 lt!453129)))

(assert (=> d!122997 (= lt!453129 (containsKey!560 (toList!6853 lt!453073) (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(assert (=> d!122997 (= (contains!5968 lt!453073 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)) lt!453130)))

(declare-fun b!1028587 () Bool)

(declare-fun lt!453131 () Unit!33575)

(assert (=> b!1028587 (= e!580637 lt!453131)))

(assert (=> b!1028587 (= lt!453131 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6853 lt!453073) (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(assert (=> b!1028587 (isDefined!432 (getValueByKey!585 (toList!6853 lt!453073) (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(declare-fun b!1028588 () Bool)

(declare-fun Unit!33583 () Unit!33575)

(assert (=> b!1028588 (= e!580637 Unit!33583)))

(declare-fun b!1028589 () Bool)

(assert (=> b!1028589 (= e!580638 (isDefined!432 (getValueByKey!585 (toList!6853 lt!453073) (select (arr!31137 lt!452950) #b00000000000000000000000000000000))))))

(assert (= (and d!122997 c!103805) b!1028587))

(assert (= (and d!122997 (not c!103805)) b!1028588))

(assert (= (and d!122997 (not res!688222)) b!1028589))

(assert (=> d!122997 m!947249))

(declare-fun m!947457 () Bool)

(assert (=> d!122997 m!947457))

(assert (=> b!1028587 m!947249))

(declare-fun m!947459 () Bool)

(assert (=> b!1028587 m!947459))

(assert (=> b!1028587 m!947249))

(declare-fun m!947461 () Bool)

(assert (=> b!1028587 m!947461))

(assert (=> b!1028587 m!947461))

(declare-fun m!947463 () Bool)

(assert (=> b!1028587 m!947463))

(assert (=> b!1028589 m!947249))

(assert (=> b!1028589 m!947461))

(assert (=> b!1028589 m!947461))

(assert (=> b!1028589 m!947463))

(assert (=> b!1028503 d!122997))

(declare-fun d!122999 () Bool)

(assert (=> d!122999 (not (arrayContainsKey!0 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!122999 true))

(declare-fun _$59!14 () Unit!33575)

(assert (=> d!122999 (= (choose!121 (_keys!11257 thiss!1427) (index!41088 lt!452945) key!909) _$59!14)))

(declare-fun bs!30026 () Bool)

(assert (= bs!30026 d!122999))

(assert (=> bs!30026 m!947179))

(assert (=> bs!30026 m!947283))

(assert (=> d!122961 d!122999))

(declare-fun d!123001 () Bool)

(assert (=> d!123001 (= (validMask!0 (mask!29838 thiss!1427)) (and (or (= (mask!29838 thiss!1427) #b00000000000000000000000000000111) (= (mask!29838 thiss!1427) #b00000000000000000000000000001111) (= (mask!29838 thiss!1427) #b00000000000000000000000000011111) (= (mask!29838 thiss!1427) #b00000000000000000000000000111111) (= (mask!29838 thiss!1427) #b00000000000000000000000001111111) (= (mask!29838 thiss!1427) #b00000000000000000000000011111111) (= (mask!29838 thiss!1427) #b00000000000000000000000111111111) (= (mask!29838 thiss!1427) #b00000000000000000000001111111111) (= (mask!29838 thiss!1427) #b00000000000000000000011111111111) (= (mask!29838 thiss!1427) #b00000000000000000000111111111111) (= (mask!29838 thiss!1427) #b00000000000000000001111111111111) (= (mask!29838 thiss!1427) #b00000000000000000011111111111111) (= (mask!29838 thiss!1427) #b00000000000000000111111111111111) (= (mask!29838 thiss!1427) #b00000000000000001111111111111111) (= (mask!29838 thiss!1427) #b00000000000000011111111111111111) (= (mask!29838 thiss!1427) #b00000000000000111111111111111111) (= (mask!29838 thiss!1427) #b00000000000001111111111111111111) (= (mask!29838 thiss!1427) #b00000000000011111111111111111111) (= (mask!29838 thiss!1427) #b00000000000111111111111111111111) (= (mask!29838 thiss!1427) #b00000000001111111111111111111111) (= (mask!29838 thiss!1427) #b00000000011111111111111111111111) (= (mask!29838 thiss!1427) #b00000000111111111111111111111111) (= (mask!29838 thiss!1427) #b00000001111111111111111111111111) (= (mask!29838 thiss!1427) #b00000011111111111111111111111111) (= (mask!29838 thiss!1427) #b00000111111111111111111111111111) (= (mask!29838 thiss!1427) #b00001111111111111111111111111111) (= (mask!29838 thiss!1427) #b00011111111111111111111111111111) (= (mask!29838 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29838 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!122969 d!123001))

(declare-fun d!123003 () Bool)

(declare-fun res!688233 () Bool)

(declare-fun e!580641 () Bool)

(assert (=> d!123003 (=> (not res!688233) (not e!580641))))

(assert (=> d!123003 (= res!688233 (validMask!0 (mask!29838 thiss!1427)))))

(assert (=> d!123003 (= (simpleValid!392 thiss!1427) e!580641)))

(declare-fun b!1028600 () Bool)

(declare-fun res!688234 () Bool)

(assert (=> b!1028600 (=> (not res!688234) (not e!580641))))

(declare-fun size!31655 (LongMapFixedSize!5490) (_ BitVec 32))

(assert (=> b!1028600 (= res!688234 (= (size!31655 thiss!1427) (bvadd (_size!2800 thiss!1427) (bvsdiv (bvadd (extraKeys!5835 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1028598 () Bool)

(declare-fun res!688231 () Bool)

(assert (=> b!1028598 (=> (not res!688231) (not e!580641))))

(assert (=> b!1028598 (= res!688231 (and (= (size!31652 (_values!6126 thiss!1427)) (bvadd (mask!29838 thiss!1427) #b00000000000000000000000000000001)) (= (size!31651 (_keys!11257 thiss!1427)) (size!31652 (_values!6126 thiss!1427))) (bvsge (_size!2800 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2800 thiss!1427) (bvadd (mask!29838 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1028599 () Bool)

(declare-fun res!688232 () Bool)

(assert (=> b!1028599 (=> (not res!688232) (not e!580641))))

(assert (=> b!1028599 (= res!688232 (bvsge (size!31655 thiss!1427) (_size!2800 thiss!1427)))))

(declare-fun b!1028601 () Bool)

(assert (=> b!1028601 (= e!580641 (and (bvsge (extraKeys!5835 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5835 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2800 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!123003 res!688233) b!1028598))

(assert (= (and b!1028598 res!688231) b!1028599))

(assert (= (and b!1028599 res!688232) b!1028600))

(assert (= (and b!1028600 res!688234) b!1028601))

(assert (=> d!123003 m!947239))

(declare-fun m!947465 () Bool)

(assert (=> b!1028600 m!947465))

(assert (=> b!1028599 m!947465))

(assert (=> d!122949 d!123003))

(declare-fun b!1028602 () Bool)

(declare-fun e!580643 () Bool)

(declare-fun call!43378 () Bool)

(assert (=> b!1028602 (= e!580643 call!43378)))

(declare-fun b!1028603 () Bool)

(declare-fun e!580644 () Bool)

(assert (=> b!1028603 (= e!580643 e!580644)))

(declare-fun lt!453134 () (_ BitVec 64))

(assert (=> b!1028603 (= lt!453134 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453132 () Unit!33575)

(assert (=> b!1028603 (= lt!453132 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11257 thiss!1427) lt!453134 #b00000000000000000000000000000000))))

(assert (=> b!1028603 (arrayContainsKey!0 (_keys!11257 thiss!1427) lt!453134 #b00000000000000000000000000000000)))

(declare-fun lt!453133 () Unit!33575)

(assert (=> b!1028603 (= lt!453133 lt!453132)))

(declare-fun res!688235 () Bool)

(assert (=> b!1028603 (= res!688235 (= (seekEntryOrOpen!0 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000) (_keys!11257 thiss!1427) (mask!29838 thiss!1427)) (Found!9679 #b00000000000000000000000000000000)))))

(assert (=> b!1028603 (=> (not res!688235) (not e!580644))))

(declare-fun b!1028604 () Bool)

(assert (=> b!1028604 (= e!580644 call!43378)))

(declare-fun d!123005 () Bool)

(declare-fun res!688236 () Bool)

(declare-fun e!580642 () Bool)

(assert (=> d!123005 (=> res!688236 e!580642)))

(assert (=> d!123005 (= res!688236 (bvsge #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))))))

(assert (=> d!123005 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11257 thiss!1427) (mask!29838 thiss!1427)) e!580642)))

(declare-fun b!1028605 () Bool)

(assert (=> b!1028605 (= e!580642 e!580643)))

(declare-fun c!103806 () Bool)

(assert (=> b!1028605 (= c!103806 (validKeyInArray!0 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43375 () Bool)

(assert (=> bm!43375 (= call!43378 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11257 thiss!1427) (mask!29838 thiss!1427)))))

(assert (= (and d!123005 (not res!688236)) b!1028605))

(assert (= (and b!1028605 c!103806) b!1028603))

(assert (= (and b!1028605 (not c!103806)) b!1028602))

(assert (= (and b!1028603 res!688235) b!1028604))

(assert (= (or b!1028604 b!1028602) bm!43375))

(assert (=> b!1028603 m!947287))

(declare-fun m!947467 () Bool)

(assert (=> b!1028603 m!947467))

(declare-fun m!947469 () Bool)

(assert (=> b!1028603 m!947469))

(assert (=> b!1028603 m!947287))

(declare-fun m!947471 () Bool)

(assert (=> b!1028603 m!947471))

(assert (=> b!1028605 m!947287))

(assert (=> b!1028605 m!947287))

(assert (=> b!1028605 m!947289))

(declare-fun m!947473 () Bool)

(assert (=> bm!43375 m!947473))

(assert (=> b!1028386 d!123005))

(declare-fun d!123007 () Bool)

(declare-fun e!580646 () Bool)

(assert (=> d!123007 e!580646))

(declare-fun res!688237 () Bool)

(assert (=> d!123007 (=> res!688237 e!580646)))

(declare-fun lt!453137 () Bool)

(assert (=> d!123007 (= res!688237 (not lt!453137))))

(declare-fun lt!453136 () Bool)

(assert (=> d!123007 (= lt!453137 lt!453136)))

(declare-fun lt!453135 () Unit!33575)

(declare-fun e!580645 () Unit!33575)

(assert (=> d!123007 (= lt!453135 e!580645)))

(declare-fun c!103807 () Bool)

(assert (=> d!123007 (= c!103807 lt!453136)))

(assert (=> d!123007 (= lt!453136 (containsKey!560 (toList!6853 lt!453073) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123007 (= (contains!5968 lt!453073 #b1000000000000000000000000000000000000000000000000000000000000000) lt!453137)))

(declare-fun b!1028606 () Bool)

(declare-fun lt!453138 () Unit!33575)

(assert (=> b!1028606 (= e!580645 lt!453138)))

(assert (=> b!1028606 (= lt!453138 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6853 lt!453073) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1028606 (isDefined!432 (getValueByKey!585 (toList!6853 lt!453073) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028607 () Bool)

(declare-fun Unit!33584 () Unit!33575)

(assert (=> b!1028607 (= e!580645 Unit!33584)))

(declare-fun b!1028608 () Bool)

(assert (=> b!1028608 (= e!580646 (isDefined!432 (getValueByKey!585 (toList!6853 lt!453073) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123007 c!103807) b!1028606))

(assert (= (and d!123007 (not c!103807)) b!1028607))

(assert (= (and d!123007 (not res!688237)) b!1028608))

(declare-fun m!947475 () Bool)

(assert (=> d!123007 m!947475))

(declare-fun m!947477 () Bool)

(assert (=> b!1028606 m!947477))

(declare-fun m!947479 () Bool)

(assert (=> b!1028606 m!947479))

(assert (=> b!1028606 m!947479))

(declare-fun m!947481 () Bool)

(assert (=> b!1028606 m!947481))

(assert (=> b!1028608 m!947479))

(assert (=> b!1028608 m!947479))

(assert (=> b!1028608 m!947481))

(assert (=> bm!43361 d!123007))

(assert (=> d!122965 d!123001))

(declare-fun d!123009 () Bool)

(declare-fun e!580648 () Bool)

(assert (=> d!123009 e!580648))

(declare-fun res!688238 () Bool)

(assert (=> d!123009 (=> res!688238 e!580648)))

(declare-fun lt!453141 () Bool)

(assert (=> d!123009 (= res!688238 (not lt!453141))))

(declare-fun lt!453140 () Bool)

(assert (=> d!123009 (= lt!453141 lt!453140)))

(declare-fun lt!453139 () Unit!33575)

(declare-fun e!580647 () Unit!33575)

(assert (=> d!123009 (= lt!453139 e!580647)))

(declare-fun c!103808 () Bool)

(assert (=> d!123009 (= c!103808 lt!453140)))

(assert (=> d!123009 (= lt!453140 (containsKey!560 (toList!6853 lt!453096) (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123009 (= (contains!5968 lt!453096 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)) lt!453141)))

(declare-fun b!1028609 () Bool)

(declare-fun lt!453142 () Unit!33575)

(assert (=> b!1028609 (= e!580647 lt!453142)))

(assert (=> b!1028609 (= lt!453142 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6853 lt!453096) (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1028609 (isDefined!432 (getValueByKey!585 (toList!6853 lt!453096) (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028610 () Bool)

(declare-fun Unit!33585 () Unit!33575)

(assert (=> b!1028610 (= e!580647 Unit!33585)))

(declare-fun b!1028611 () Bool)

(assert (=> b!1028611 (= e!580648 (isDefined!432 (getValueByKey!585 (toList!6853 lt!453096) (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!123009 c!103808) b!1028609))

(assert (= (and d!123009 (not c!103808)) b!1028610))

(assert (= (and d!123009 (not res!688238)) b!1028611))

(assert (=> d!123009 m!947287))

(declare-fun m!947483 () Bool)

(assert (=> d!123009 m!947483))

(assert (=> b!1028609 m!947287))

(declare-fun m!947485 () Bool)

(assert (=> b!1028609 m!947485))

(assert (=> b!1028609 m!947287))

(declare-fun m!947487 () Bool)

(assert (=> b!1028609 m!947487))

(assert (=> b!1028609 m!947487))

(declare-fun m!947489 () Bool)

(assert (=> b!1028609 m!947489))

(assert (=> b!1028611 m!947287))

(assert (=> b!1028611 m!947487))

(assert (=> b!1028611 m!947487))

(assert (=> b!1028611 m!947489))

(assert (=> b!1028528 d!123009))

(declare-fun d!123011 () Bool)

(assert (=> d!123011 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1028433 d!123011))

(declare-fun d!123013 () Bool)

(assert (=> d!123013 (= (validKeyInArray!0 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)) (and (not (= (select (arr!31137 lt!452950) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31137 lt!452950) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028493 d!123013))

(declare-fun d!123015 () Bool)

(declare-fun e!580651 () Bool)

(assert (=> d!123015 e!580651))

(declare-fun res!688243 () Bool)

(assert (=> d!123015 (=> (not res!688243) (not e!580651))))

(declare-fun lt!453152 () ListLongMap!13675)

(assert (=> d!123015 (= res!688243 (contains!5968 lt!453152 (_1!7783 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427)))))))

(declare-fun lt!453154 () List!21815)

(assert (=> d!123015 (= lt!453152 (ListLongMap!13676 lt!453154))))

(declare-fun lt!453151 () Unit!33575)

(declare-fun lt!453153 () Unit!33575)

(assert (=> d!123015 (= lt!453151 lt!453153)))

(assert (=> d!123015 (= (getValueByKey!585 lt!453154 (_1!7783 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!276 (List!21815 (_ BitVec 64) V!37277) Unit!33575)

(assert (=> d!123015 (= lt!453153 (lemmaContainsTupThenGetReturnValue!276 lt!453154 (_1!7783 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427)))))))

(declare-fun insertStrictlySorted!369 (List!21815 (_ BitVec 64) V!37277) List!21815)

(assert (=> d!123015 (= lt!453154 (insertStrictlySorted!369 (toList!6853 lt!453062) (_1!7783 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427)))))))

(assert (=> d!123015 (= (+!3099 lt!453062 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427))) lt!453152)))

(declare-fun b!1028616 () Bool)

(declare-fun res!688244 () Bool)

(assert (=> b!1028616 (=> (not res!688244) (not e!580651))))

(assert (=> b!1028616 (= res!688244 (= (getValueByKey!585 (toList!6853 lt!453152) (_1!7783 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427))))))))

(declare-fun b!1028617 () Bool)

(declare-fun contains!5969 (List!21815 tuple2!15544) Bool)

(assert (=> b!1028617 (= e!580651 (contains!5969 (toList!6853 lt!453152) (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427))))))

(assert (= (and d!123015 res!688243) b!1028616))

(assert (= (and b!1028616 res!688244) b!1028617))

(declare-fun m!947491 () Bool)

(assert (=> d!123015 m!947491))

(declare-fun m!947493 () Bool)

(assert (=> d!123015 m!947493))

(declare-fun m!947495 () Bool)

(assert (=> d!123015 m!947495))

(declare-fun m!947497 () Bool)

(assert (=> d!123015 m!947497))

(declare-fun m!947499 () Bool)

(assert (=> b!1028616 m!947499))

(declare-fun m!947501 () Bool)

(assert (=> b!1028617 m!947501))

(assert (=> b!1028510 d!123015))

(declare-fun b!1028642 () Bool)

(declare-fun e!580667 () Bool)

(assert (=> b!1028642 (= e!580667 (validKeyInArray!0 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(assert (=> b!1028642 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1028643 () Bool)

(declare-fun e!580669 () ListLongMap!13675)

(declare-fun e!580668 () ListLongMap!13675)

(assert (=> b!1028643 (= e!580669 e!580668)))

(declare-fun c!103818 () Bool)

(assert (=> b!1028643 (= c!103818 (validKeyInArray!0 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(declare-fun b!1028644 () Bool)

(declare-fun e!580671 () Bool)

(declare-fun e!580666 () Bool)

(assert (=> b!1028644 (= e!580671 e!580666)))

(declare-fun c!103820 () Bool)

(assert (=> b!1028644 (= c!103820 (bvslt #b00000000000000000000000000000000 (size!31651 lt!452950)))))

(declare-fun call!43381 () ListLongMap!13675)

(declare-fun bm!43378 () Bool)

(assert (=> bm!43378 (= call!43381 (getCurrentListMapNoExtraKeys!3515 lt!452950 lt!452946 (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6103 thiss!1427)))))

(declare-fun b!1028645 () Bool)

(declare-fun lt!453172 () ListLongMap!13675)

(declare-fun isEmpty!923 (ListLongMap!13675) Bool)

(assert (=> b!1028645 (= e!580666 (isEmpty!923 lt!453172))))

(declare-fun b!1028646 () Bool)

(assert (=> b!1028646 (= e!580666 (= lt!453172 (getCurrentListMapNoExtraKeys!3515 lt!452950 lt!452946 (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6103 thiss!1427))))))

(declare-fun b!1028647 () Bool)

(declare-fun lt!453170 () Unit!33575)

(declare-fun lt!453169 () Unit!33575)

(assert (=> b!1028647 (= lt!453170 lt!453169)))

(declare-fun lt!453171 () V!37277)

(declare-fun lt!453173 () (_ BitVec 64))

(declare-fun lt!453175 () (_ BitVec 64))

(declare-fun lt!453174 () ListLongMap!13675)

(assert (=> b!1028647 (not (contains!5968 (+!3099 lt!453174 (tuple2!15545 lt!453175 lt!453171)) lt!453173))))

(declare-fun addStillNotContains!239 (ListLongMap!13675 (_ BitVec 64) V!37277 (_ BitVec 64)) Unit!33575)

(assert (=> b!1028647 (= lt!453169 (addStillNotContains!239 lt!453174 lt!453175 lt!453171 lt!453173))))

(assert (=> b!1028647 (= lt!453173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1028647 (= lt!453171 (get!16347 (select (arr!31138 lt!452946) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1028647 (= lt!453175 (select (arr!31137 lt!452950) #b00000000000000000000000000000000))))

(assert (=> b!1028647 (= lt!453174 call!43381)))

(assert (=> b!1028647 (= e!580668 (+!3099 call!43381 (tuple2!15545 (select (arr!31137 lt!452950) #b00000000000000000000000000000000) (get!16347 (select (arr!31138 lt!452946) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1028648 () Bool)

(declare-fun res!688256 () Bool)

(declare-fun e!580670 () Bool)

(assert (=> b!1028648 (=> (not res!688256) (not e!580670))))

(assert (=> b!1028648 (= res!688256 (not (contains!5968 lt!453172 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!123017 () Bool)

(assert (=> d!123017 e!580670))

(declare-fun res!688255 () Bool)

(assert (=> d!123017 (=> (not res!688255) (not e!580670))))

(assert (=> d!123017 (= res!688255 (not (contains!5968 lt!453172 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123017 (= lt!453172 e!580669)))

(declare-fun c!103819 () Bool)

(assert (=> d!123017 (= c!103819 (bvsge #b00000000000000000000000000000000 (size!31651 lt!452950)))))

(assert (=> d!123017 (validMask!0 (mask!29838 thiss!1427))))

(assert (=> d!123017 (= (getCurrentListMapNoExtraKeys!3515 lt!452950 lt!452946 (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)) lt!453172)))

(declare-fun b!1028649 () Bool)

(assert (=> b!1028649 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31651 lt!452950)))))

(assert (=> b!1028649 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31652 lt!452946)))))

(declare-fun e!580672 () Bool)

(assert (=> b!1028649 (= e!580672 (= (apply!901 lt!453172 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)) (get!16347 (select (arr!31138 lt!452946) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1028650 () Bool)

(assert (=> b!1028650 (= e!580668 call!43381)))

(declare-fun b!1028651 () Bool)

(assert (=> b!1028651 (= e!580671 e!580672)))

(assert (=> b!1028651 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31651 lt!452950)))))

(declare-fun res!688253 () Bool)

(assert (=> b!1028651 (= res!688253 (contains!5968 lt!453172 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(assert (=> b!1028651 (=> (not res!688253) (not e!580672))))

(declare-fun b!1028652 () Bool)

(assert (=> b!1028652 (= e!580670 e!580671)))

(declare-fun c!103817 () Bool)

(assert (=> b!1028652 (= c!103817 e!580667)))

(declare-fun res!688254 () Bool)

(assert (=> b!1028652 (=> (not res!688254) (not e!580667))))

(assert (=> b!1028652 (= res!688254 (bvslt #b00000000000000000000000000000000 (size!31651 lt!452950)))))

(declare-fun b!1028653 () Bool)

(assert (=> b!1028653 (= e!580669 (ListLongMap!13676 Nil!21812))))

(assert (= (and d!123017 c!103819) b!1028653))

(assert (= (and d!123017 (not c!103819)) b!1028643))

(assert (= (and b!1028643 c!103818) b!1028647))

(assert (= (and b!1028643 (not c!103818)) b!1028650))

(assert (= (or b!1028647 b!1028650) bm!43378))

(assert (= (and d!123017 res!688255) b!1028648))

(assert (= (and b!1028648 res!688256) b!1028652))

(assert (= (and b!1028652 res!688254) b!1028642))

(assert (= (and b!1028652 c!103817) b!1028651))

(assert (= (and b!1028652 (not c!103817)) b!1028644))

(assert (= (and b!1028651 res!688253) b!1028649))

(assert (= (and b!1028644 c!103820) b!1028646))

(assert (= (and b!1028644 (not c!103820)) b!1028645))

(declare-fun b_lambda!15803 () Bool)

(assert (=> (not b_lambda!15803) (not b!1028647)))

(assert (=> b!1028647 t!30892))

(declare-fun b_and!32881 () Bool)

(assert (= b_and!32879 (and (=> t!30892 result!14121) b_and!32881)))

(declare-fun b_lambda!15805 () Bool)

(assert (=> (not b_lambda!15805) (not b!1028649)))

(assert (=> b!1028649 t!30892))

(declare-fun b_and!32883 () Bool)

(assert (= b_and!32881 (and (=> t!30892 result!14121) b_and!32883)))

(assert (=> b!1028643 m!947249))

(assert (=> b!1028643 m!947249))

(assert (=> b!1028643 m!947251))

(assert (=> b!1028651 m!947249))

(assert (=> b!1028651 m!947249))

(declare-fun m!947503 () Bool)

(assert (=> b!1028651 m!947503))

(declare-fun m!947505 () Bool)

(assert (=> bm!43378 m!947505))

(declare-fun m!947507 () Bool)

(assert (=> d!123017 m!947507))

(assert (=> d!123017 m!947239))

(assert (=> b!1028649 m!947249))

(assert (=> b!1028649 m!947249))

(declare-fun m!947509 () Bool)

(assert (=> b!1028649 m!947509))

(assert (=> b!1028649 m!947325))

(assert (=> b!1028649 m!947325))

(assert (=> b!1028649 m!947163))

(assert (=> b!1028649 m!947327))

(assert (=> b!1028649 m!947163))

(assert (=> b!1028647 m!947249))

(assert (=> b!1028647 m!947325))

(declare-fun m!947511 () Bool)

(assert (=> b!1028647 m!947511))

(declare-fun m!947513 () Bool)

(assert (=> b!1028647 m!947513))

(assert (=> b!1028647 m!947325))

(assert (=> b!1028647 m!947163))

(assert (=> b!1028647 m!947327))

(declare-fun m!947515 () Bool)

(assert (=> b!1028647 m!947515))

(declare-fun m!947517 () Bool)

(assert (=> b!1028647 m!947517))

(assert (=> b!1028647 m!947511))

(assert (=> b!1028647 m!947163))

(assert (=> b!1028642 m!947249))

(assert (=> b!1028642 m!947249))

(assert (=> b!1028642 m!947251))

(declare-fun m!947519 () Bool)

(assert (=> b!1028645 m!947519))

(declare-fun m!947521 () Bool)

(assert (=> b!1028648 m!947521))

(assert (=> b!1028646 m!947505))

(assert (=> b!1028510 d!123017))

(declare-fun d!123019 () Bool)

(declare-fun e!580674 () Bool)

(assert (=> d!123019 e!580674))

(declare-fun res!688257 () Bool)

(assert (=> d!123019 (=> res!688257 e!580674)))

(declare-fun lt!453178 () Bool)

(assert (=> d!123019 (= res!688257 (not lt!453178))))

(declare-fun lt!453177 () Bool)

(assert (=> d!123019 (= lt!453178 lt!453177)))

(declare-fun lt!453176 () Unit!33575)

(declare-fun e!580673 () Unit!33575)

(assert (=> d!123019 (= lt!453176 e!580673)))

(declare-fun c!103821 () Bool)

(assert (=> d!123019 (= c!103821 lt!453177)))

(assert (=> d!123019 (= lt!453177 (containsKey!560 (toList!6853 (+!3099 lt!453062 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427)))) lt!453070))))

(assert (=> d!123019 (= (contains!5968 (+!3099 lt!453062 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427))) lt!453070) lt!453178)))

(declare-fun b!1028654 () Bool)

(declare-fun lt!453179 () Unit!33575)

(assert (=> b!1028654 (= e!580673 lt!453179)))

(assert (=> b!1028654 (= lt!453179 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6853 (+!3099 lt!453062 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427)))) lt!453070))))

(assert (=> b!1028654 (isDefined!432 (getValueByKey!585 (toList!6853 (+!3099 lt!453062 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427)))) lt!453070))))

(declare-fun b!1028655 () Bool)

(declare-fun Unit!33586 () Unit!33575)

(assert (=> b!1028655 (= e!580673 Unit!33586)))

(declare-fun b!1028656 () Bool)

(assert (=> b!1028656 (= e!580674 (isDefined!432 (getValueByKey!585 (toList!6853 (+!3099 lt!453062 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427)))) lt!453070)))))

(assert (= (and d!123019 c!103821) b!1028654))

(assert (= (and d!123019 (not c!103821)) b!1028655))

(assert (= (and d!123019 (not res!688257)) b!1028656))

(declare-fun m!947523 () Bool)

(assert (=> d!123019 m!947523))

(declare-fun m!947525 () Bool)

(assert (=> b!1028654 m!947525))

(declare-fun m!947527 () Bool)

(assert (=> b!1028654 m!947527))

(assert (=> b!1028654 m!947527))

(declare-fun m!947529 () Bool)

(assert (=> b!1028654 m!947529))

(assert (=> b!1028656 m!947527))

(assert (=> b!1028656 m!947527))

(assert (=> b!1028656 m!947529))

(assert (=> b!1028510 d!123019))

(declare-fun d!123021 () Bool)

(declare-fun e!580675 () Bool)

(assert (=> d!123021 e!580675))

(declare-fun res!688258 () Bool)

(assert (=> d!123021 (=> (not res!688258) (not e!580675))))

(declare-fun lt!453181 () ListLongMap!13675)

(assert (=> d!123021 (= res!688258 (contains!5968 lt!453181 (_1!7783 (tuple2!15545 lt!453058 (zeroValue!5939 thiss!1427)))))))

(declare-fun lt!453183 () List!21815)

(assert (=> d!123021 (= lt!453181 (ListLongMap!13676 lt!453183))))

(declare-fun lt!453180 () Unit!33575)

(declare-fun lt!453182 () Unit!33575)

(assert (=> d!123021 (= lt!453180 lt!453182)))

(assert (=> d!123021 (= (getValueByKey!585 lt!453183 (_1!7783 (tuple2!15545 lt!453058 (zeroValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 lt!453058 (zeroValue!5939 thiss!1427)))))))

(assert (=> d!123021 (= lt!453182 (lemmaContainsTupThenGetReturnValue!276 lt!453183 (_1!7783 (tuple2!15545 lt!453058 (zeroValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 lt!453058 (zeroValue!5939 thiss!1427)))))))

(assert (=> d!123021 (= lt!453183 (insertStrictlySorted!369 (toList!6853 lt!453057) (_1!7783 (tuple2!15545 lt!453058 (zeroValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 lt!453058 (zeroValue!5939 thiss!1427)))))))

(assert (=> d!123021 (= (+!3099 lt!453057 (tuple2!15545 lt!453058 (zeroValue!5939 thiss!1427))) lt!453181)))

(declare-fun b!1028657 () Bool)

(declare-fun res!688259 () Bool)

(assert (=> b!1028657 (=> (not res!688259) (not e!580675))))

(assert (=> b!1028657 (= res!688259 (= (getValueByKey!585 (toList!6853 lt!453181) (_1!7783 (tuple2!15545 lt!453058 (zeroValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 lt!453058 (zeroValue!5939 thiss!1427))))))))

(declare-fun b!1028658 () Bool)

(assert (=> b!1028658 (= e!580675 (contains!5969 (toList!6853 lt!453181) (tuple2!15545 lt!453058 (zeroValue!5939 thiss!1427))))))

(assert (= (and d!123021 res!688258) b!1028657))

(assert (= (and b!1028657 res!688259) b!1028658))

(declare-fun m!947531 () Bool)

(assert (=> d!123021 m!947531))

(declare-fun m!947533 () Bool)

(assert (=> d!123021 m!947533))

(declare-fun m!947535 () Bool)

(assert (=> d!123021 m!947535))

(declare-fun m!947537 () Bool)

(assert (=> d!123021 m!947537))

(declare-fun m!947539 () Bool)

(assert (=> b!1028657 m!947539))

(declare-fun m!947541 () Bool)

(assert (=> b!1028658 m!947541))

(assert (=> b!1028510 d!123021))

(declare-fun d!123023 () Bool)

(assert (=> d!123023 (= (apply!901 lt!453057 lt!453056) (get!16348 (getValueByKey!585 (toList!6853 lt!453057) lt!453056)))))

(declare-fun bs!30027 () Bool)

(assert (= bs!30027 d!123023))

(declare-fun m!947543 () Bool)

(assert (=> bs!30027 m!947543))

(assert (=> bs!30027 m!947543))

(declare-fun m!947545 () Bool)

(assert (=> bs!30027 m!947545))

(assert (=> b!1028510 d!123023))

(declare-fun d!123025 () Bool)

(declare-fun e!580676 () Bool)

(assert (=> d!123025 e!580676))

(declare-fun res!688260 () Bool)

(assert (=> d!123025 (=> (not res!688260) (not e!580676))))

(declare-fun lt!453185 () ListLongMap!13675)

(assert (=> d!123025 (= res!688260 (contains!5968 lt!453185 (_1!7783 (tuple2!15545 lt!453072 (minValue!5939 thiss!1427)))))))

(declare-fun lt!453187 () List!21815)

(assert (=> d!123025 (= lt!453185 (ListLongMap!13676 lt!453187))))

(declare-fun lt!453184 () Unit!33575)

(declare-fun lt!453186 () Unit!33575)

(assert (=> d!123025 (= lt!453184 lt!453186)))

(assert (=> d!123025 (= (getValueByKey!585 lt!453187 (_1!7783 (tuple2!15545 lt!453072 (minValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 lt!453072 (minValue!5939 thiss!1427)))))))

(assert (=> d!123025 (= lt!453186 (lemmaContainsTupThenGetReturnValue!276 lt!453187 (_1!7783 (tuple2!15545 lt!453072 (minValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 lt!453072 (minValue!5939 thiss!1427)))))))

(assert (=> d!123025 (= lt!453187 (insertStrictlySorted!369 (toList!6853 lt!453074) (_1!7783 (tuple2!15545 lt!453072 (minValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 lt!453072 (minValue!5939 thiss!1427)))))))

(assert (=> d!123025 (= (+!3099 lt!453074 (tuple2!15545 lt!453072 (minValue!5939 thiss!1427))) lt!453185)))

(declare-fun b!1028659 () Bool)

(declare-fun res!688261 () Bool)

(assert (=> b!1028659 (=> (not res!688261) (not e!580676))))

(assert (=> b!1028659 (= res!688261 (= (getValueByKey!585 (toList!6853 lt!453185) (_1!7783 (tuple2!15545 lt!453072 (minValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 lt!453072 (minValue!5939 thiss!1427))))))))

(declare-fun b!1028660 () Bool)

(assert (=> b!1028660 (= e!580676 (contains!5969 (toList!6853 lt!453185) (tuple2!15545 lt!453072 (minValue!5939 thiss!1427))))))

(assert (= (and d!123025 res!688260) b!1028659))

(assert (= (and b!1028659 res!688261) b!1028660))

(declare-fun m!947547 () Bool)

(assert (=> d!123025 m!947547))

(declare-fun m!947549 () Bool)

(assert (=> d!123025 m!947549))

(declare-fun m!947551 () Bool)

(assert (=> d!123025 m!947551))

(declare-fun m!947553 () Bool)

(assert (=> d!123025 m!947553))

(declare-fun m!947555 () Bool)

(assert (=> b!1028659 m!947555))

(declare-fun m!947557 () Bool)

(assert (=> b!1028660 m!947557))

(assert (=> b!1028510 d!123025))

(declare-fun d!123027 () Bool)

(assert (=> d!123027 (= (apply!901 (+!3099 lt!453057 (tuple2!15545 lt!453058 (zeroValue!5939 thiss!1427))) lt!453056) (apply!901 lt!453057 lt!453056))))

(declare-fun lt!453190 () Unit!33575)

(declare-fun choose!1686 (ListLongMap!13675 (_ BitVec 64) V!37277 (_ BitVec 64)) Unit!33575)

(assert (=> d!123027 (= lt!453190 (choose!1686 lt!453057 lt!453058 (zeroValue!5939 thiss!1427) lt!453056))))

(declare-fun e!580679 () Bool)

(assert (=> d!123027 e!580679))

(declare-fun res!688264 () Bool)

(assert (=> d!123027 (=> (not res!688264) (not e!580679))))

(assert (=> d!123027 (= res!688264 (contains!5968 lt!453057 lt!453056))))

(assert (=> d!123027 (= (addApplyDifferent!480 lt!453057 lt!453058 (zeroValue!5939 thiss!1427) lt!453056) lt!453190)))

(declare-fun b!1028664 () Bool)

(assert (=> b!1028664 (= e!580679 (not (= lt!453056 lt!453058)))))

(assert (= (and d!123027 res!688264) b!1028664))

(assert (=> d!123027 m!947299))

(assert (=> d!123027 m!947317))

(declare-fun m!947559 () Bool)

(assert (=> d!123027 m!947559))

(assert (=> d!123027 m!947299))

(assert (=> d!123027 m!947315))

(declare-fun m!947561 () Bool)

(assert (=> d!123027 m!947561))

(assert (=> b!1028510 d!123027))

(declare-fun d!123029 () Bool)

(assert (=> d!123029 (= (apply!901 (+!3099 lt!453074 (tuple2!15545 lt!453072 (minValue!5939 thiss!1427))) lt!453055) (apply!901 lt!453074 lt!453055))))

(declare-fun lt!453191 () Unit!33575)

(assert (=> d!123029 (= lt!453191 (choose!1686 lt!453074 lt!453072 (minValue!5939 thiss!1427) lt!453055))))

(declare-fun e!580680 () Bool)

(assert (=> d!123029 e!580680))

(declare-fun res!688265 () Bool)

(assert (=> d!123029 (=> (not res!688265) (not e!580680))))

(assert (=> d!123029 (= res!688265 (contains!5968 lt!453074 lt!453055))))

(assert (=> d!123029 (= (addApplyDifferent!480 lt!453074 lt!453072 (minValue!5939 thiss!1427) lt!453055) lt!453191)))

(declare-fun b!1028665 () Bool)

(assert (=> b!1028665 (= e!580680 (not (= lt!453055 lt!453072)))))

(assert (= (and d!123029 res!688265) b!1028665))

(assert (=> d!123029 m!947297))

(assert (=> d!123029 m!947321))

(declare-fun m!947563 () Bool)

(assert (=> d!123029 m!947563))

(assert (=> d!123029 m!947297))

(assert (=> d!123029 m!947307))

(declare-fun m!947565 () Bool)

(assert (=> d!123029 m!947565))

(assert (=> b!1028510 d!123029))

(declare-fun d!123031 () Bool)

(assert (=> d!123031 (= (apply!901 lt!453074 lt!453055) (get!16348 (getValueByKey!585 (toList!6853 lt!453074) lt!453055)))))

(declare-fun bs!30028 () Bool)

(assert (= bs!30028 d!123031))

(declare-fun m!947567 () Bool)

(assert (=> bs!30028 m!947567))

(assert (=> bs!30028 m!947567))

(declare-fun m!947569 () Bool)

(assert (=> bs!30028 m!947569))

(assert (=> b!1028510 d!123031))

(declare-fun d!123033 () Bool)

(assert (=> d!123033 (= (apply!901 lt!453066 lt!453061) (get!16348 (getValueByKey!585 (toList!6853 lt!453066) lt!453061)))))

(declare-fun bs!30029 () Bool)

(assert (= bs!30029 d!123033))

(declare-fun m!947571 () Bool)

(assert (=> bs!30029 m!947571))

(assert (=> bs!30029 m!947571))

(declare-fun m!947573 () Bool)

(assert (=> bs!30029 m!947573))

(assert (=> b!1028510 d!123033))

(declare-fun d!123035 () Bool)

(assert (=> d!123035 (= (apply!901 (+!3099 lt!453066 (tuple2!15545 lt!453060 (minValue!5939 thiss!1427))) lt!453061) (apply!901 lt!453066 lt!453061))))

(declare-fun lt!453192 () Unit!33575)

(assert (=> d!123035 (= lt!453192 (choose!1686 lt!453066 lt!453060 (minValue!5939 thiss!1427) lt!453061))))

(declare-fun e!580681 () Bool)

(assert (=> d!123035 e!580681))

(declare-fun res!688266 () Bool)

(assert (=> d!123035 (=> (not res!688266) (not e!580681))))

(assert (=> d!123035 (= res!688266 (contains!5968 lt!453066 lt!453061))))

(assert (=> d!123035 (= (addApplyDifferent!480 lt!453066 lt!453060 (minValue!5939 thiss!1427) lt!453061) lt!453192)))

(declare-fun b!1028666 () Bool)

(assert (=> b!1028666 (= e!580681 (not (= lt!453061 lt!453060)))))

(assert (= (and d!123035 res!688266) b!1028666))

(assert (=> d!123035 m!947291))

(assert (=> d!123035 m!947313))

(declare-fun m!947575 () Bool)

(assert (=> d!123035 m!947575))

(assert (=> d!123035 m!947291))

(assert (=> d!123035 m!947319))

(declare-fun m!947577 () Bool)

(assert (=> d!123035 m!947577))

(assert (=> b!1028510 d!123035))

(declare-fun d!123037 () Bool)

(assert (=> d!123037 (= (apply!901 (+!3099 lt!453074 (tuple2!15545 lt!453072 (minValue!5939 thiss!1427))) lt!453055) (get!16348 (getValueByKey!585 (toList!6853 (+!3099 lt!453074 (tuple2!15545 lt!453072 (minValue!5939 thiss!1427)))) lt!453055)))))

(declare-fun bs!30030 () Bool)

(assert (= bs!30030 d!123037))

(declare-fun m!947579 () Bool)

(assert (=> bs!30030 m!947579))

(assert (=> bs!30030 m!947579))

(declare-fun m!947581 () Bool)

(assert (=> bs!30030 m!947581))

(assert (=> b!1028510 d!123037))

(declare-fun d!123039 () Bool)

(declare-fun e!580682 () Bool)

(assert (=> d!123039 e!580682))

(declare-fun res!688267 () Bool)

(assert (=> d!123039 (=> (not res!688267) (not e!580682))))

(declare-fun lt!453194 () ListLongMap!13675)

(assert (=> d!123039 (= res!688267 (contains!5968 lt!453194 (_1!7783 (tuple2!15545 lt!453060 (minValue!5939 thiss!1427)))))))

(declare-fun lt!453196 () List!21815)

(assert (=> d!123039 (= lt!453194 (ListLongMap!13676 lt!453196))))

(declare-fun lt!453193 () Unit!33575)

(declare-fun lt!453195 () Unit!33575)

(assert (=> d!123039 (= lt!453193 lt!453195)))

(assert (=> d!123039 (= (getValueByKey!585 lt!453196 (_1!7783 (tuple2!15545 lt!453060 (minValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 lt!453060 (minValue!5939 thiss!1427)))))))

(assert (=> d!123039 (= lt!453195 (lemmaContainsTupThenGetReturnValue!276 lt!453196 (_1!7783 (tuple2!15545 lt!453060 (minValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 lt!453060 (minValue!5939 thiss!1427)))))))

(assert (=> d!123039 (= lt!453196 (insertStrictlySorted!369 (toList!6853 lt!453066) (_1!7783 (tuple2!15545 lt!453060 (minValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 lt!453060 (minValue!5939 thiss!1427)))))))

(assert (=> d!123039 (= (+!3099 lt!453066 (tuple2!15545 lt!453060 (minValue!5939 thiss!1427))) lt!453194)))

(declare-fun b!1028667 () Bool)

(declare-fun res!688268 () Bool)

(assert (=> b!1028667 (=> (not res!688268) (not e!580682))))

(assert (=> b!1028667 (= res!688268 (= (getValueByKey!585 (toList!6853 lt!453194) (_1!7783 (tuple2!15545 lt!453060 (minValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 lt!453060 (minValue!5939 thiss!1427))))))))

(declare-fun b!1028668 () Bool)

(assert (=> b!1028668 (= e!580682 (contains!5969 (toList!6853 lt!453194) (tuple2!15545 lt!453060 (minValue!5939 thiss!1427))))))

(assert (= (and d!123039 res!688267) b!1028667))

(assert (= (and b!1028667 res!688268) b!1028668))

(declare-fun m!947583 () Bool)

(assert (=> d!123039 m!947583))

(declare-fun m!947585 () Bool)

(assert (=> d!123039 m!947585))

(declare-fun m!947587 () Bool)

(assert (=> d!123039 m!947587))

(declare-fun m!947589 () Bool)

(assert (=> d!123039 m!947589))

(declare-fun m!947591 () Bool)

(assert (=> b!1028667 m!947591))

(declare-fun m!947593 () Bool)

(assert (=> b!1028668 m!947593))

(assert (=> b!1028510 d!123039))

(declare-fun d!123041 () Bool)

(assert (=> d!123041 (= (apply!901 (+!3099 lt!453066 (tuple2!15545 lt!453060 (minValue!5939 thiss!1427))) lt!453061) (get!16348 (getValueByKey!585 (toList!6853 (+!3099 lt!453066 (tuple2!15545 lt!453060 (minValue!5939 thiss!1427)))) lt!453061)))))

(declare-fun bs!30031 () Bool)

(assert (= bs!30031 d!123041))

(declare-fun m!947595 () Bool)

(assert (=> bs!30031 m!947595))

(assert (=> bs!30031 m!947595))

(declare-fun m!947597 () Bool)

(assert (=> bs!30031 m!947597))

(assert (=> b!1028510 d!123041))

(declare-fun d!123043 () Bool)

(assert (=> d!123043 (= (apply!901 (+!3099 lt!453057 (tuple2!15545 lt!453058 (zeroValue!5939 thiss!1427))) lt!453056) (get!16348 (getValueByKey!585 (toList!6853 (+!3099 lt!453057 (tuple2!15545 lt!453058 (zeroValue!5939 thiss!1427)))) lt!453056)))))

(declare-fun bs!30032 () Bool)

(assert (= bs!30032 d!123043))

(declare-fun m!947599 () Bool)

(assert (=> bs!30032 m!947599))

(assert (=> bs!30032 m!947599))

(declare-fun m!947601 () Bool)

(assert (=> bs!30032 m!947601))

(assert (=> b!1028510 d!123043))

(declare-fun d!123045 () Bool)

(assert (=> d!123045 (contains!5968 (+!3099 lt!453062 (tuple2!15545 lt!453063 (zeroValue!5939 thiss!1427))) lt!453070)))

(declare-fun lt!453199 () Unit!33575)

(declare-fun choose!1687 (ListLongMap!13675 (_ BitVec 64) V!37277 (_ BitVec 64)) Unit!33575)

(assert (=> d!123045 (= lt!453199 (choose!1687 lt!453062 lt!453063 (zeroValue!5939 thiss!1427) lt!453070))))

(assert (=> d!123045 (contains!5968 lt!453062 lt!453070)))

(assert (=> d!123045 (= (addStillContains!620 lt!453062 lt!453063 (zeroValue!5939 thiss!1427) lt!453070) lt!453199)))

(declare-fun bs!30033 () Bool)

(assert (= bs!30033 d!123045))

(assert (=> bs!30033 m!947293))

(assert (=> bs!30033 m!947293))

(assert (=> bs!30033 m!947295))

(declare-fun m!947603 () Bool)

(assert (=> bs!30033 m!947603))

(declare-fun m!947605 () Bool)

(assert (=> bs!30033 m!947605))

(assert (=> b!1028510 d!123045))

(declare-fun bm!43379 () Bool)

(declare-fun call!43382 () (_ BitVec 32))

(assert (=> bm!43379 (= call!43382 (arrayCountValidKeys!0 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31651 (_keys!11257 thiss!1427))))))

(declare-fun b!1028670 () Bool)

(declare-fun e!580683 () (_ BitVec 32))

(declare-fun e!580684 () (_ BitVec 32))

(assert (=> b!1028670 (= e!580683 e!580684)))

(declare-fun c!103822 () Bool)

(assert (=> b!1028670 (= c!103822 (validKeyInArray!0 (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1028671 () Bool)

(assert (=> b!1028671 (= e!580683 #b00000000000000000000000000000000)))

(declare-fun b!1028672 () Bool)

(assert (=> b!1028672 (= e!580684 call!43382)))

(declare-fun b!1028673 () Bool)

(assert (=> b!1028673 (= e!580684 (bvadd #b00000000000000000000000000000001 call!43382))))

(declare-fun d!123047 () Bool)

(declare-fun lt!453200 () (_ BitVec 32))

(assert (=> d!123047 (and (bvsge lt!453200 #b00000000000000000000000000000000) (bvsle lt!453200 (bvsub (size!31651 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!123047 (= lt!453200 e!580683)))

(declare-fun c!103823 () Bool)

(assert (=> d!123047 (= c!103823 (bvsge #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))))))

(assert (=> d!123047 (and (bvsle #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31651 (_keys!11257 thiss!1427)) (size!31651 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))))))))

(assert (=> d!123047 (= (arrayCountValidKeys!0 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))) lt!453200)))

(assert (= (and d!123047 c!103823) b!1028671))

(assert (= (and d!123047 (not c!103823)) b!1028670))

(assert (= (and b!1028670 c!103822) b!1028673))

(assert (= (and b!1028670 (not c!103822)) b!1028672))

(assert (= (or b!1028673 b!1028672) bm!43379))

(declare-fun m!947607 () Bool)

(assert (=> bm!43379 m!947607))

(assert (=> b!1028670 m!947429))

(assert (=> b!1028670 m!947429))

(declare-fun m!947609 () Bool)

(assert (=> b!1028670 m!947609))

(assert (=> b!1028435 d!123047))

(assert (=> b!1028435 d!122963))

(declare-fun d!123049 () Bool)

(declare-fun res!688269 () Bool)

(declare-fun e!580685 () Bool)

(assert (=> d!123049 (=> res!688269 e!580685)))

(assert (=> d!123049 (= res!688269 (= (select (arr!31137 lt!452950) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!123049 (= (arrayContainsKey!0 lt!452950 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!580685)))

(declare-fun b!1028674 () Bool)

(declare-fun e!580686 () Bool)

(assert (=> b!1028674 (= e!580685 e!580686)))

(declare-fun res!688270 () Bool)

(assert (=> b!1028674 (=> (not res!688270) (not e!580686))))

(assert (=> b!1028674 (= res!688270 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31651 lt!452950)))))

(declare-fun b!1028675 () Bool)

(assert (=> b!1028675 (= e!580686 (arrayContainsKey!0 lt!452950 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!123049 (not res!688269)) b!1028674))

(assert (= (and b!1028674 res!688270) b!1028675))

(assert (=> d!123049 m!947441))

(declare-fun m!947611 () Bool)

(assert (=> b!1028675 m!947611))

(assert (=> b!1028423 d!123049))

(assert (=> b!1028497 d!123013))

(declare-fun d!123051 () Bool)

(declare-fun e!580687 () Bool)

(assert (=> d!123051 e!580687))

(declare-fun res!688271 () Bool)

(assert (=> d!123051 (=> (not res!688271) (not e!580687))))

(declare-fun lt!453202 () ListLongMap!13675)

(assert (=> d!123051 (= res!688271 (contains!5968 lt!453202 (_1!7783 (ite (or c!103783 c!103782) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))))))

(declare-fun lt!453204 () List!21815)

(assert (=> d!123051 (= lt!453202 (ListLongMap!13676 lt!453204))))

(declare-fun lt!453201 () Unit!33575)

(declare-fun lt!453203 () Unit!33575)

(assert (=> d!123051 (= lt!453201 lt!453203)))

(assert (=> d!123051 (= (getValueByKey!585 lt!453204 (_1!7783 (ite (or c!103783 c!103782) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))) (Some!635 (_2!7783 (ite (or c!103783 c!103782) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))))))

(assert (=> d!123051 (= lt!453203 (lemmaContainsTupThenGetReturnValue!276 lt!453204 (_1!7783 (ite (or c!103783 c!103782) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))) (_2!7783 (ite (or c!103783 c!103782) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))))))

(assert (=> d!123051 (= lt!453204 (insertStrictlySorted!369 (toList!6853 (ite c!103783 call!43362 (ite c!103782 call!43366 call!43367))) (_1!7783 (ite (or c!103783 c!103782) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))) (_2!7783 (ite (or c!103783 c!103782) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))))))

(assert (=> d!123051 (= (+!3099 (ite c!103783 call!43362 (ite c!103782 call!43366 call!43367)) (ite (or c!103783 c!103782) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))) lt!453202)))

(declare-fun b!1028676 () Bool)

(declare-fun res!688272 () Bool)

(assert (=> b!1028676 (=> (not res!688272) (not e!580687))))

(assert (=> b!1028676 (= res!688272 (= (getValueByKey!585 (toList!6853 lt!453202) (_1!7783 (ite (or c!103783 c!103782) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))) (Some!635 (_2!7783 (ite (or c!103783 c!103782) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))))))))

(declare-fun b!1028677 () Bool)

(assert (=> b!1028677 (= e!580687 (contains!5969 (toList!6853 lt!453202) (ite (or c!103783 c!103782) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))))))

(assert (= (and d!123051 res!688271) b!1028676))

(assert (= (and b!1028676 res!688272) b!1028677))

(declare-fun m!947613 () Bool)

(assert (=> d!123051 m!947613))

(declare-fun m!947615 () Bool)

(assert (=> d!123051 m!947615))

(declare-fun m!947617 () Bool)

(assert (=> d!123051 m!947617))

(declare-fun m!947619 () Bool)

(assert (=> d!123051 m!947619))

(declare-fun m!947621 () Bool)

(assert (=> b!1028676 m!947621))

(declare-fun m!947623 () Bool)

(assert (=> b!1028677 m!947623))

(assert (=> bm!43364 d!123051))

(declare-fun d!123053 () Bool)

(declare-fun e!580689 () Bool)

(assert (=> d!123053 e!580689))

(declare-fun res!688273 () Bool)

(assert (=> d!123053 (=> res!688273 e!580689)))

(declare-fun lt!453207 () Bool)

(assert (=> d!123053 (= res!688273 (not lt!453207))))

(declare-fun lt!453206 () Bool)

(assert (=> d!123053 (= lt!453207 lt!453206)))

(declare-fun lt!453205 () Unit!33575)

(declare-fun e!580688 () Unit!33575)

(assert (=> d!123053 (= lt!453205 e!580688)))

(declare-fun c!103824 () Bool)

(assert (=> d!123053 (= c!103824 lt!453206)))

(assert (=> d!123053 (= lt!453206 (containsKey!560 (toList!6853 lt!453096) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123053 (= (contains!5968 lt!453096 #b1000000000000000000000000000000000000000000000000000000000000000) lt!453207)))

(declare-fun b!1028678 () Bool)

(declare-fun lt!453208 () Unit!33575)

(assert (=> b!1028678 (= e!580688 lt!453208)))

(assert (=> b!1028678 (= lt!453208 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6853 lt!453096) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1028678 (isDefined!432 (getValueByKey!585 (toList!6853 lt!453096) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028679 () Bool)

(declare-fun Unit!33587 () Unit!33575)

(assert (=> b!1028679 (= e!580688 Unit!33587)))

(declare-fun b!1028680 () Bool)

(assert (=> b!1028680 (= e!580689 (isDefined!432 (getValueByKey!585 (toList!6853 lt!453096) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123053 c!103824) b!1028678))

(assert (= (and d!123053 (not c!103824)) b!1028679))

(assert (= (and d!123053 (not res!688273)) b!1028680))

(declare-fun m!947625 () Bool)

(assert (=> d!123053 m!947625))

(declare-fun m!947627 () Bool)

(assert (=> b!1028678 m!947627))

(assert (=> b!1028678 m!947437))

(assert (=> b!1028678 m!947437))

(declare-fun m!947629 () Bool)

(assert (=> b!1028678 m!947629))

(assert (=> b!1028680 m!947437))

(assert (=> b!1028680 m!947437))

(assert (=> b!1028680 m!947629))

(assert (=> bm!43369 d!123053))

(declare-fun d!123055 () Bool)

(assert (=> d!123055 (arrayContainsKey!0 lt!452950 lt!452998 #b00000000000000000000000000000000)))

(declare-fun lt!453211 () Unit!33575)

(declare-fun choose!13 (array!64660 (_ BitVec 64) (_ BitVec 32)) Unit!33575)

(assert (=> d!123055 (= lt!453211 (choose!13 lt!452950 lt!452998 #b00000000000000000000000000000000))))

(assert (=> d!123055 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!123055 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!452950 lt!452998 #b00000000000000000000000000000000) lt!453211)))

(declare-fun bs!30034 () Bool)

(assert (= bs!30034 d!123055))

(assert (=> bs!30034 m!947259))

(declare-fun m!947631 () Bool)

(assert (=> bs!30034 m!947631))

(assert (=> b!1028412 d!123055))

(declare-fun d!123057 () Bool)

(declare-fun res!688274 () Bool)

(declare-fun e!580690 () Bool)

(assert (=> d!123057 (=> res!688274 e!580690)))

(assert (=> d!123057 (= res!688274 (= (select (arr!31137 lt!452950) #b00000000000000000000000000000000) lt!452998))))

(assert (=> d!123057 (= (arrayContainsKey!0 lt!452950 lt!452998 #b00000000000000000000000000000000) e!580690)))

(declare-fun b!1028681 () Bool)

(declare-fun e!580691 () Bool)

(assert (=> b!1028681 (= e!580690 e!580691)))

(declare-fun res!688275 () Bool)

(assert (=> b!1028681 (=> (not res!688275) (not e!580691))))

(assert (=> b!1028681 (= res!688275 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31651 lt!452950)))))

(declare-fun b!1028682 () Bool)

(assert (=> b!1028682 (= e!580691 (arrayContainsKey!0 lt!452950 lt!452998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123057 (not res!688274)) b!1028681))

(assert (= (and b!1028681 res!688275) b!1028682))

(assert (=> d!123057 m!947249))

(declare-fun m!947633 () Bool)

(assert (=> b!1028682 m!947633))

(assert (=> b!1028412 d!123057))

(declare-fun b!1028695 () Bool)

(declare-fun c!103832 () Bool)

(declare-fun lt!453219 () (_ BitVec 64))

(assert (=> b!1028695 (= c!103832 (= lt!453219 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!580698 () SeekEntryResult!9679)

(declare-fun e!580699 () SeekEntryResult!9679)

(assert (=> b!1028695 (= e!580698 e!580699)))

(declare-fun b!1028696 () Bool)

(declare-fun lt!453220 () SeekEntryResult!9679)

(assert (=> b!1028696 (= e!580699 (seekKeyOrZeroReturnVacant!0 (x!91509 lt!453220) (index!41089 lt!453220) (index!41089 lt!453220) (select (arr!31137 lt!452950) #b00000000000000000000000000000000) lt!452950 (mask!29838 thiss!1427)))))

(declare-fun b!1028697 () Bool)

(declare-fun e!580700 () SeekEntryResult!9679)

(assert (=> b!1028697 (= e!580700 e!580698)))

(assert (=> b!1028697 (= lt!453219 (select (arr!31137 lt!452950) (index!41089 lt!453220)))))

(declare-fun c!103831 () Bool)

(assert (=> b!1028697 (= c!103831 (= lt!453219 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(declare-fun d!123059 () Bool)

(declare-fun lt!453218 () SeekEntryResult!9679)

(assert (=> d!123059 (and (or ((_ is Undefined!9679) lt!453218) (not ((_ is Found!9679) lt!453218)) (and (bvsge (index!41088 lt!453218) #b00000000000000000000000000000000) (bvslt (index!41088 lt!453218) (size!31651 lt!452950)))) (or ((_ is Undefined!9679) lt!453218) ((_ is Found!9679) lt!453218) (not ((_ is MissingZero!9679) lt!453218)) (and (bvsge (index!41087 lt!453218) #b00000000000000000000000000000000) (bvslt (index!41087 lt!453218) (size!31651 lt!452950)))) (or ((_ is Undefined!9679) lt!453218) ((_ is Found!9679) lt!453218) ((_ is MissingZero!9679) lt!453218) (not ((_ is MissingVacant!9679) lt!453218)) (and (bvsge (index!41090 lt!453218) #b00000000000000000000000000000000) (bvslt (index!41090 lt!453218) (size!31651 lt!452950)))) (or ((_ is Undefined!9679) lt!453218) (ite ((_ is Found!9679) lt!453218) (= (select (arr!31137 lt!452950) (index!41088 lt!453218)) (select (arr!31137 lt!452950) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9679) lt!453218) (= (select (arr!31137 lt!452950) (index!41087 lt!453218)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9679) lt!453218) (= (select (arr!31137 lt!452950) (index!41090 lt!453218)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!123059 (= lt!453218 e!580700)))

(declare-fun c!103833 () Bool)

(assert (=> d!123059 (= c!103833 (and ((_ is Intermediate!9679) lt!453220) (undefined!10491 lt!453220)))))

(assert (=> d!123059 (= lt!453220 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31137 lt!452950) #b00000000000000000000000000000000) (mask!29838 thiss!1427)) (select (arr!31137 lt!452950) #b00000000000000000000000000000000) lt!452950 (mask!29838 thiss!1427)))))

(assert (=> d!123059 (validMask!0 (mask!29838 thiss!1427))))

(assert (=> d!123059 (= (seekEntryOrOpen!0 (select (arr!31137 lt!452950) #b00000000000000000000000000000000) lt!452950 (mask!29838 thiss!1427)) lt!453218)))

(declare-fun b!1028698 () Bool)

(assert (=> b!1028698 (= e!580700 Undefined!9679)))

(declare-fun b!1028699 () Bool)

(assert (=> b!1028699 (= e!580699 (MissingZero!9679 (index!41089 lt!453220)))))

(declare-fun b!1028700 () Bool)

(assert (=> b!1028700 (= e!580698 (Found!9679 (index!41089 lt!453220)))))

(assert (= (and d!123059 c!103833) b!1028698))

(assert (= (and d!123059 (not c!103833)) b!1028697))

(assert (= (and b!1028697 c!103831) b!1028700))

(assert (= (and b!1028697 (not c!103831)) b!1028695))

(assert (= (and b!1028695 c!103832) b!1028699))

(assert (= (and b!1028695 (not c!103832)) b!1028696))

(assert (=> b!1028696 m!947249))

(declare-fun m!947635 () Bool)

(assert (=> b!1028696 m!947635))

(declare-fun m!947637 () Bool)

(assert (=> b!1028697 m!947637))

(declare-fun m!947639 () Bool)

(assert (=> d!123059 m!947639))

(declare-fun m!947641 () Bool)

(assert (=> d!123059 m!947641))

(declare-fun m!947643 () Bool)

(assert (=> d!123059 m!947643))

(assert (=> d!123059 m!947249))

(declare-fun m!947645 () Bool)

(assert (=> d!123059 m!947645))

(assert (=> d!123059 m!947249))

(assert (=> d!123059 m!947643))

(declare-fun m!947647 () Bool)

(assert (=> d!123059 m!947647))

(assert (=> d!123059 m!947239))

(assert (=> b!1028412 d!123059))

(assert (=> bm!43359 d!123017))

(assert (=> b!1028414 d!123013))

(declare-fun d!123061 () Bool)

(assert (=> d!123061 (= (arrayCountValidKeys!0 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11257 thiss!1427) #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!123061 true))

(declare-fun _$79!11 () Unit!33575)

(assert (=> d!123061 (= (choose!82 (_keys!11257 thiss!1427) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!11)))

(declare-fun bs!30035 () Bool)

(assert (= bs!30035 d!123061))

(assert (=> bs!30035 m!947179))

(assert (=> bs!30035 m!947271))

(assert (=> bs!30035 m!947175))

(assert (=> d!122959 d!123061))

(declare-fun bm!43380 () Bool)

(declare-fun call!43383 () (_ BitVec 32))

(assert (=> bm!43380 (= call!43383 (arrayCountValidKeys!0 lt!452950 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31651 (_keys!11257 thiss!1427))))))

(declare-fun b!1028701 () Bool)

(declare-fun e!580701 () (_ BitVec 32))

(declare-fun e!580702 () (_ BitVec 32))

(assert (=> b!1028701 (= e!580701 e!580702)))

(declare-fun c!103834 () Bool)

(assert (=> b!1028701 (= c!103834 (validKeyInArray!0 (select (arr!31137 lt!452950) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1028702 () Bool)

(assert (=> b!1028702 (= e!580701 #b00000000000000000000000000000000)))

(declare-fun b!1028703 () Bool)

(assert (=> b!1028703 (= e!580702 call!43383)))

(declare-fun b!1028704 () Bool)

(assert (=> b!1028704 (= e!580702 (bvadd #b00000000000000000000000000000001 call!43383))))

(declare-fun d!123063 () Bool)

(declare-fun lt!453221 () (_ BitVec 32))

(assert (=> d!123063 (and (bvsge lt!453221 #b00000000000000000000000000000000) (bvsle lt!453221 (bvsub (size!31651 lt!452950) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!123063 (= lt!453221 e!580701)))

(declare-fun c!103835 () Bool)

(assert (=> d!123063 (= c!103835 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31651 (_keys!11257 thiss!1427))))))

(assert (=> d!123063 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31651 (_keys!11257 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31651 (_keys!11257 thiss!1427)) (size!31651 lt!452950)))))

(assert (=> d!123063 (= (arrayCountValidKeys!0 lt!452950 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31651 (_keys!11257 thiss!1427))) lt!453221)))

(assert (= (and d!123063 c!103835) b!1028702))

(assert (= (and d!123063 (not c!103835)) b!1028701))

(assert (= (and b!1028701 c!103834) b!1028704))

(assert (= (and b!1028701 (not c!103834)) b!1028703))

(assert (= (or b!1028704 b!1028703) bm!43380))

(declare-fun m!947649 () Bool)

(assert (=> bm!43380 m!947649))

(assert (=> b!1028701 m!947441))

(assert (=> b!1028701 m!947441))

(assert (=> b!1028701 m!947443))

(assert (=> bm!43366 d!123063))

(declare-fun bm!43381 () Bool)

(declare-fun call!43384 () (_ BitVec 32))

(assert (=> bm!43381 (= call!43384 (arrayCountValidKeys!0 (_keys!11257 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31651 (_keys!11257 thiss!1427))))))

(declare-fun b!1028705 () Bool)

(declare-fun e!580703 () (_ BitVec 32))

(declare-fun e!580704 () (_ BitVec 32))

(assert (=> b!1028705 (= e!580703 e!580704)))

(declare-fun c!103836 () Bool)

(assert (=> b!1028705 (= c!103836 (validKeyInArray!0 (select (arr!31137 (_keys!11257 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1028706 () Bool)

(assert (=> b!1028706 (= e!580703 #b00000000000000000000000000000000)))

(declare-fun b!1028707 () Bool)

(assert (=> b!1028707 (= e!580704 call!43384)))

(declare-fun b!1028708 () Bool)

(assert (=> b!1028708 (= e!580704 (bvadd #b00000000000000000000000000000001 call!43384))))

(declare-fun d!123065 () Bool)

(declare-fun lt!453222 () (_ BitVec 32))

(assert (=> d!123065 (and (bvsge lt!453222 #b00000000000000000000000000000000) (bvsle lt!453222 (bvsub (size!31651 (_keys!11257 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!123065 (= lt!453222 e!580703)))

(declare-fun c!103837 () Bool)

(assert (=> d!123065 (= c!103837 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31651 (_keys!11257 thiss!1427))))))

(assert (=> d!123065 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31651 (_keys!11257 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31651 (_keys!11257 thiss!1427)) (size!31651 (_keys!11257 thiss!1427))))))

(assert (=> d!123065 (= (arrayCountValidKeys!0 (_keys!11257 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31651 (_keys!11257 thiss!1427))) lt!453222)))

(assert (= (and d!123065 c!103837) b!1028706))

(assert (= (and d!123065 (not c!103837)) b!1028705))

(assert (= (and b!1028705 c!103836) b!1028708))

(assert (= (and b!1028705 (not c!103836)) b!1028707))

(assert (= (or b!1028708 b!1028707) bm!43381))

(declare-fun m!947651 () Bool)

(assert (=> bm!43381 m!947651))

(declare-fun m!947653 () Bool)

(assert (=> b!1028705 m!947653))

(assert (=> b!1028705 m!947653))

(declare-fun m!947655 () Bool)

(assert (=> b!1028705 m!947655))

(assert (=> bm!43344 d!123065))

(assert (=> b!1028399 d!123013))

(declare-fun d!123067 () Bool)

(assert (=> d!123067 (= (apply!901 lt!453096 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)) (get!16348 (getValueByKey!585 (toList!6853 lt!453096) (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30036 () Bool)

(assert (= bs!30036 d!123067))

(assert (=> bs!30036 m!947287))

(assert (=> bs!30036 m!947487))

(assert (=> bs!30036 m!947487))

(declare-fun m!947657 () Bool)

(assert (=> bs!30036 m!947657))

(assert (=> b!1028534 d!123067))

(declare-fun d!123069 () Bool)

(declare-fun c!103840 () Bool)

(assert (=> d!123069 (= c!103840 ((_ is ValueCellFull!11448) (select (arr!31138 (_values!6126 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!580707 () V!37277)

(assert (=> d!123069 (= (get!16347 (select (arr!31138 (_values!6126 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!580707)))

(declare-fun b!1028713 () Bool)

(declare-fun get!16349 (ValueCell!11448 V!37277) V!37277)

(assert (=> b!1028713 (= e!580707 (get!16349 (select (arr!31138 (_values!6126 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028714 () Bool)

(declare-fun get!16350 (ValueCell!11448 V!37277) V!37277)

(assert (=> b!1028714 (= e!580707 (get!16350 (select (arr!31138 (_values!6126 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123069 c!103840) b!1028713))

(assert (= (and d!123069 (not c!103840)) b!1028714))

(assert (=> b!1028713 m!947379))

(assert (=> b!1028713 m!947163))

(declare-fun m!947659 () Bool)

(assert (=> b!1028713 m!947659))

(assert (=> b!1028714 m!947379))

(assert (=> b!1028714 m!947163))

(declare-fun m!947661 () Bool)

(assert (=> b!1028714 m!947661))

(assert (=> b!1028534 d!123069))

(declare-fun d!123071 () Bool)

(assert (=> d!123071 (= (validKeyInArray!0 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028518 d!123071))

(declare-fun b!1028715 () Bool)

(declare-fun e!580709 () Bool)

(declare-fun call!43385 () Bool)

(assert (=> b!1028715 (= e!580709 call!43385)))

(declare-fun b!1028716 () Bool)

(declare-fun e!580710 () Bool)

(assert (=> b!1028716 (= e!580709 e!580710)))

(declare-fun lt!453225 () (_ BitVec 64))

(assert (=> b!1028716 (= lt!453225 (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453223 () Unit!33575)

(assert (=> b!1028716 (= lt!453223 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) lt!453225 #b00000000000000000000000000000000))))

(assert (=> b!1028716 (arrayContainsKey!0 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) lt!453225 #b00000000000000000000000000000000)))

(declare-fun lt!453224 () Unit!33575)

(assert (=> b!1028716 (= lt!453224 lt!453223)))

(declare-fun res!688276 () Bool)

(assert (=> b!1028716 (= res!688276 (= (seekEntryOrOpen!0 (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000) (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) (mask!29838 thiss!1427)) (Found!9679 #b00000000000000000000000000000000)))))

(assert (=> b!1028716 (=> (not res!688276) (not e!580710))))

(declare-fun b!1028717 () Bool)

(assert (=> b!1028717 (= e!580710 call!43385)))

(declare-fun d!123073 () Bool)

(declare-fun res!688277 () Bool)

(declare-fun e!580708 () Bool)

(assert (=> d!123073 (=> res!688277 e!580708)))

(assert (=> d!123073 (= res!688277 (bvsge #b00000000000000000000000000000000 (size!31651 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))))))))

(assert (=> d!123073 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) (mask!29838 thiss!1427)) e!580708)))

(declare-fun b!1028718 () Bool)

(assert (=> b!1028718 (= e!580708 e!580709)))

(declare-fun c!103841 () Bool)

(assert (=> b!1028718 (= c!103841 (validKeyInArray!0 (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!43382 () Bool)

(assert (=> bm!43382 (= call!43385 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) (mask!29838 thiss!1427)))))

(assert (= (and d!123073 (not res!688277)) b!1028718))

(assert (= (and b!1028718 c!103841) b!1028716))

(assert (= (and b!1028718 (not c!103841)) b!1028715))

(assert (= (and b!1028716 res!688276) b!1028717))

(assert (= (or b!1028717 b!1028715) bm!43382))

(assert (=> b!1028716 m!947429))

(declare-fun m!947663 () Bool)

(assert (=> b!1028716 m!947663))

(declare-fun m!947665 () Bool)

(assert (=> b!1028716 m!947665))

(assert (=> b!1028716 m!947429))

(declare-fun m!947667 () Bool)

(assert (=> b!1028716 m!947667))

(assert (=> b!1028718 m!947429))

(assert (=> b!1028718 m!947429))

(assert (=> b!1028718 m!947609))

(declare-fun m!947669 () Bool)

(assert (=> bm!43382 m!947669))

(assert (=> b!1028544 d!123073))

(declare-fun d!123075 () Bool)

(assert (=> d!123075 (= (apply!901 (+!3099 lt!453080 (tuple2!15545 lt!453081 (zeroValue!5939 thiss!1427))) lt!453079) (apply!901 lt!453080 lt!453079))))

(declare-fun lt!453226 () Unit!33575)

(assert (=> d!123075 (= lt!453226 (choose!1686 lt!453080 lt!453081 (zeroValue!5939 thiss!1427) lt!453079))))

(declare-fun e!580711 () Bool)

(assert (=> d!123075 e!580711))

(declare-fun res!688278 () Bool)

(assert (=> d!123075 (=> (not res!688278) (not e!580711))))

(assert (=> d!123075 (= res!688278 (contains!5968 lt!453080 lt!453079))))

(assert (=> d!123075 (= (addApplyDifferent!480 lt!453080 lt!453081 (zeroValue!5939 thiss!1427) lt!453079) lt!453226)))

(declare-fun b!1028719 () Bool)

(assert (=> b!1028719 (= e!580711 (not (= lt!453079 lt!453081)))))

(assert (= (and d!123075 res!688278) b!1028719))

(assert (=> d!123075 m!947353))

(assert (=> d!123075 m!947371))

(declare-fun m!947671 () Bool)

(assert (=> d!123075 m!947671))

(assert (=> d!123075 m!947353))

(assert (=> d!123075 m!947369))

(declare-fun m!947673 () Bool)

(assert (=> d!123075 m!947673))

(assert (=> b!1028535 d!123075))

(declare-fun d!123077 () Bool)

(declare-fun e!580712 () Bool)

(assert (=> d!123077 e!580712))

(declare-fun res!688279 () Bool)

(assert (=> d!123077 (=> (not res!688279) (not e!580712))))

(declare-fun lt!453228 () ListLongMap!13675)

(assert (=> d!123077 (= res!688279 (contains!5968 lt!453228 (_1!7783 (tuple2!15545 lt!453083 (minValue!5939 thiss!1427)))))))

(declare-fun lt!453230 () List!21815)

(assert (=> d!123077 (= lt!453228 (ListLongMap!13676 lt!453230))))

(declare-fun lt!453227 () Unit!33575)

(declare-fun lt!453229 () Unit!33575)

(assert (=> d!123077 (= lt!453227 lt!453229)))

(assert (=> d!123077 (= (getValueByKey!585 lt!453230 (_1!7783 (tuple2!15545 lt!453083 (minValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 lt!453083 (minValue!5939 thiss!1427)))))))

(assert (=> d!123077 (= lt!453229 (lemmaContainsTupThenGetReturnValue!276 lt!453230 (_1!7783 (tuple2!15545 lt!453083 (minValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 lt!453083 (minValue!5939 thiss!1427)))))))

(assert (=> d!123077 (= lt!453230 (insertStrictlySorted!369 (toList!6853 lt!453089) (_1!7783 (tuple2!15545 lt!453083 (minValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 lt!453083 (minValue!5939 thiss!1427)))))))

(assert (=> d!123077 (= (+!3099 lt!453089 (tuple2!15545 lt!453083 (minValue!5939 thiss!1427))) lt!453228)))

(declare-fun b!1028720 () Bool)

(declare-fun res!688280 () Bool)

(assert (=> b!1028720 (=> (not res!688280) (not e!580712))))

(assert (=> b!1028720 (= res!688280 (= (getValueByKey!585 (toList!6853 lt!453228) (_1!7783 (tuple2!15545 lt!453083 (minValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 lt!453083 (minValue!5939 thiss!1427))))))))

(declare-fun b!1028721 () Bool)

(assert (=> b!1028721 (= e!580712 (contains!5969 (toList!6853 lt!453228) (tuple2!15545 lt!453083 (minValue!5939 thiss!1427))))))

(assert (= (and d!123077 res!688279) b!1028720))

(assert (= (and b!1028720 res!688280) b!1028721))

(declare-fun m!947675 () Bool)

(assert (=> d!123077 m!947675))

(declare-fun m!947677 () Bool)

(assert (=> d!123077 m!947677))

(declare-fun m!947679 () Bool)

(assert (=> d!123077 m!947679))

(declare-fun m!947681 () Bool)

(assert (=> d!123077 m!947681))

(declare-fun m!947683 () Bool)

(assert (=> b!1028720 m!947683))

(declare-fun m!947685 () Bool)

(assert (=> b!1028721 m!947685))

(assert (=> b!1028535 d!123077))

(declare-fun d!123079 () Bool)

(declare-fun e!580713 () Bool)

(assert (=> d!123079 e!580713))

(declare-fun res!688281 () Bool)

(assert (=> d!123079 (=> (not res!688281) (not e!580713))))

(declare-fun lt!453232 () ListLongMap!13675)

(assert (=> d!123079 (= res!688281 (contains!5968 lt!453232 (_1!7783 (tuple2!15545 lt!453095 (minValue!5939 thiss!1427)))))))

(declare-fun lt!453234 () List!21815)

(assert (=> d!123079 (= lt!453232 (ListLongMap!13676 lt!453234))))

(declare-fun lt!453231 () Unit!33575)

(declare-fun lt!453233 () Unit!33575)

(assert (=> d!123079 (= lt!453231 lt!453233)))

(assert (=> d!123079 (= (getValueByKey!585 lt!453234 (_1!7783 (tuple2!15545 lt!453095 (minValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 lt!453095 (minValue!5939 thiss!1427)))))))

(assert (=> d!123079 (= lt!453233 (lemmaContainsTupThenGetReturnValue!276 lt!453234 (_1!7783 (tuple2!15545 lt!453095 (minValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 lt!453095 (minValue!5939 thiss!1427)))))))

(assert (=> d!123079 (= lt!453234 (insertStrictlySorted!369 (toList!6853 lt!453097) (_1!7783 (tuple2!15545 lt!453095 (minValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 lt!453095 (minValue!5939 thiss!1427)))))))

(assert (=> d!123079 (= (+!3099 lt!453097 (tuple2!15545 lt!453095 (minValue!5939 thiss!1427))) lt!453232)))

(declare-fun b!1028722 () Bool)

(declare-fun res!688282 () Bool)

(assert (=> b!1028722 (=> (not res!688282) (not e!580713))))

(assert (=> b!1028722 (= res!688282 (= (getValueByKey!585 (toList!6853 lt!453232) (_1!7783 (tuple2!15545 lt!453095 (minValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 lt!453095 (minValue!5939 thiss!1427))))))))

(declare-fun b!1028723 () Bool)

(assert (=> b!1028723 (= e!580713 (contains!5969 (toList!6853 lt!453232) (tuple2!15545 lt!453095 (minValue!5939 thiss!1427))))))

(assert (= (and d!123079 res!688281) b!1028722))

(assert (= (and b!1028722 res!688282) b!1028723))

(declare-fun m!947687 () Bool)

(assert (=> d!123079 m!947687))

(declare-fun m!947689 () Bool)

(assert (=> d!123079 m!947689))

(declare-fun m!947691 () Bool)

(assert (=> d!123079 m!947691))

(declare-fun m!947693 () Bool)

(assert (=> d!123079 m!947693))

(declare-fun m!947695 () Bool)

(assert (=> b!1028722 m!947695))

(declare-fun m!947697 () Bool)

(assert (=> b!1028723 m!947697))

(assert (=> b!1028535 d!123079))

(declare-fun d!123081 () Bool)

(assert (=> d!123081 (= (apply!901 lt!453089 lt!453084) (get!16348 (getValueByKey!585 (toList!6853 lt!453089) lt!453084)))))

(declare-fun bs!30037 () Bool)

(assert (= bs!30037 d!123081))

(declare-fun m!947699 () Bool)

(assert (=> bs!30037 m!947699))

(assert (=> bs!30037 m!947699))

(declare-fun m!947701 () Bool)

(assert (=> bs!30037 m!947701))

(assert (=> b!1028535 d!123081))

(declare-fun b!1028724 () Bool)

(declare-fun e!580715 () Bool)

(assert (=> b!1028724 (= e!580715 (validKeyInArray!0 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1028724 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1028725 () Bool)

(declare-fun e!580717 () ListLongMap!13675)

(declare-fun e!580716 () ListLongMap!13675)

(assert (=> b!1028725 (= e!580717 e!580716)))

(declare-fun c!103843 () Bool)

(assert (=> b!1028725 (= c!103843 (validKeyInArray!0 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028726 () Bool)

(declare-fun e!580719 () Bool)

(declare-fun e!580714 () Bool)

(assert (=> b!1028726 (= e!580719 e!580714)))

(declare-fun c!103845 () Bool)

(assert (=> b!1028726 (= c!103845 (bvslt #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))))))

(declare-fun bm!43383 () Bool)

(declare-fun call!43386 () ListLongMap!13675)

(assert (=> bm!43383 (= call!43386 (getCurrentListMapNoExtraKeys!3515 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6103 thiss!1427)))))

(declare-fun b!1028727 () Bool)

(declare-fun lt!453238 () ListLongMap!13675)

(assert (=> b!1028727 (= e!580714 (isEmpty!923 lt!453238))))

(declare-fun b!1028728 () Bool)

(assert (=> b!1028728 (= e!580714 (= lt!453238 (getCurrentListMapNoExtraKeys!3515 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6103 thiss!1427))))))

(declare-fun b!1028729 () Bool)

(declare-fun lt!453236 () Unit!33575)

(declare-fun lt!453235 () Unit!33575)

(assert (=> b!1028729 (= lt!453236 lt!453235)))

(declare-fun lt!453240 () ListLongMap!13675)

(declare-fun lt!453237 () V!37277)

(declare-fun lt!453239 () (_ BitVec 64))

(declare-fun lt!453241 () (_ BitVec 64))

(assert (=> b!1028729 (not (contains!5968 (+!3099 lt!453240 (tuple2!15545 lt!453241 lt!453237)) lt!453239))))

(assert (=> b!1028729 (= lt!453235 (addStillNotContains!239 lt!453240 lt!453241 lt!453237 lt!453239))))

(assert (=> b!1028729 (= lt!453239 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1028729 (= lt!453237 (get!16347 (select (arr!31138 (_values!6126 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1028729 (= lt!453241 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028729 (= lt!453240 call!43386)))

(assert (=> b!1028729 (= e!580716 (+!3099 call!43386 (tuple2!15545 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000) (get!16347 (select (arr!31138 (_values!6126 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1028730 () Bool)

(declare-fun res!688286 () Bool)

(declare-fun e!580718 () Bool)

(assert (=> b!1028730 (=> (not res!688286) (not e!580718))))

(assert (=> b!1028730 (= res!688286 (not (contains!5968 lt!453238 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!123083 () Bool)

(assert (=> d!123083 e!580718))

(declare-fun res!688285 () Bool)

(assert (=> d!123083 (=> (not res!688285) (not e!580718))))

(assert (=> d!123083 (= res!688285 (not (contains!5968 lt!453238 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123083 (= lt!453238 e!580717)))

(declare-fun c!103844 () Bool)

(assert (=> d!123083 (= c!103844 (bvsge #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))))))

(assert (=> d!123083 (validMask!0 (mask!29838 thiss!1427))))

(assert (=> d!123083 (= (getCurrentListMapNoExtraKeys!3515 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)) lt!453238)))

(declare-fun b!1028731 () Bool)

(assert (=> b!1028731 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))))))

(assert (=> b!1028731 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31652 (_values!6126 thiss!1427))))))

(declare-fun e!580720 () Bool)

(assert (=> b!1028731 (= e!580720 (= (apply!901 lt!453238 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)) (get!16347 (select (arr!31138 (_values!6126 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1028732 () Bool)

(assert (=> b!1028732 (= e!580716 call!43386)))

(declare-fun b!1028733 () Bool)

(assert (=> b!1028733 (= e!580719 e!580720)))

(assert (=> b!1028733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))))))

(declare-fun res!688283 () Bool)

(assert (=> b!1028733 (= res!688283 (contains!5968 lt!453238 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1028733 (=> (not res!688283) (not e!580720))))

(declare-fun b!1028734 () Bool)

(assert (=> b!1028734 (= e!580718 e!580719)))

(declare-fun c!103842 () Bool)

(assert (=> b!1028734 (= c!103842 e!580715)))

(declare-fun res!688284 () Bool)

(assert (=> b!1028734 (=> (not res!688284) (not e!580715))))

(assert (=> b!1028734 (= res!688284 (bvslt #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))))))

(declare-fun b!1028735 () Bool)

(assert (=> b!1028735 (= e!580717 (ListLongMap!13676 Nil!21812))))

(assert (= (and d!123083 c!103844) b!1028735))

(assert (= (and d!123083 (not c!103844)) b!1028725))

(assert (= (and b!1028725 c!103843) b!1028729))

(assert (= (and b!1028725 (not c!103843)) b!1028732))

(assert (= (or b!1028729 b!1028732) bm!43383))

(assert (= (and d!123083 res!688285) b!1028730))

(assert (= (and b!1028730 res!688286) b!1028734))

(assert (= (and b!1028734 res!688284) b!1028724))

(assert (= (and b!1028734 c!103842) b!1028733))

(assert (= (and b!1028734 (not c!103842)) b!1028726))

(assert (= (and b!1028733 res!688283) b!1028731))

(assert (= (and b!1028726 c!103845) b!1028728))

(assert (= (and b!1028726 (not c!103845)) b!1028727))

(declare-fun b_lambda!15807 () Bool)

(assert (=> (not b_lambda!15807) (not b!1028729)))

(assert (=> b!1028729 t!30892))

(declare-fun b_and!32885 () Bool)

(assert (= b_and!32883 (and (=> t!30892 result!14121) b_and!32885)))

(declare-fun b_lambda!15809 () Bool)

(assert (=> (not b_lambda!15809) (not b!1028731)))

(assert (=> b!1028731 t!30892))

(declare-fun b_and!32887 () Bool)

(assert (= b_and!32885 (and (=> t!30892 result!14121) b_and!32887)))

(assert (=> b!1028725 m!947287))

(assert (=> b!1028725 m!947287))

(assert (=> b!1028725 m!947289))

(assert (=> b!1028733 m!947287))

(assert (=> b!1028733 m!947287))

(declare-fun m!947703 () Bool)

(assert (=> b!1028733 m!947703))

(declare-fun m!947705 () Bool)

(assert (=> bm!43383 m!947705))

(declare-fun m!947707 () Bool)

(assert (=> d!123083 m!947707))

(assert (=> d!123083 m!947239))

(assert (=> b!1028731 m!947287))

(assert (=> b!1028731 m!947287))

(declare-fun m!947709 () Bool)

(assert (=> b!1028731 m!947709))

(assert (=> b!1028731 m!947379))

(assert (=> b!1028731 m!947379))

(assert (=> b!1028731 m!947163))

(assert (=> b!1028731 m!947381))

(assert (=> b!1028731 m!947163))

(assert (=> b!1028729 m!947287))

(assert (=> b!1028729 m!947379))

(declare-fun m!947711 () Bool)

(assert (=> b!1028729 m!947711))

(declare-fun m!947713 () Bool)

(assert (=> b!1028729 m!947713))

(assert (=> b!1028729 m!947379))

(assert (=> b!1028729 m!947163))

(assert (=> b!1028729 m!947381))

(declare-fun m!947715 () Bool)

(assert (=> b!1028729 m!947715))

(declare-fun m!947717 () Bool)

(assert (=> b!1028729 m!947717))

(assert (=> b!1028729 m!947711))

(assert (=> b!1028729 m!947163))

(assert (=> b!1028724 m!947287))

(assert (=> b!1028724 m!947287))

(assert (=> b!1028724 m!947289))

(declare-fun m!947719 () Bool)

(assert (=> b!1028727 m!947719))

(declare-fun m!947721 () Bool)

(assert (=> b!1028730 m!947721))

(assert (=> b!1028728 m!947705))

(assert (=> b!1028535 d!123083))

(declare-fun d!123085 () Bool)

(declare-fun e!580721 () Bool)

(assert (=> d!123085 e!580721))

(declare-fun res!688287 () Bool)

(assert (=> d!123085 (=> (not res!688287) (not e!580721))))

(declare-fun lt!453243 () ListLongMap!13675)

(assert (=> d!123085 (= res!688287 (contains!5968 lt!453243 (_1!7783 (tuple2!15545 lt!453081 (zeroValue!5939 thiss!1427)))))))

(declare-fun lt!453245 () List!21815)

(assert (=> d!123085 (= lt!453243 (ListLongMap!13676 lt!453245))))

(declare-fun lt!453242 () Unit!33575)

(declare-fun lt!453244 () Unit!33575)

(assert (=> d!123085 (= lt!453242 lt!453244)))

(assert (=> d!123085 (= (getValueByKey!585 lt!453245 (_1!7783 (tuple2!15545 lt!453081 (zeroValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 lt!453081 (zeroValue!5939 thiss!1427)))))))

(assert (=> d!123085 (= lt!453244 (lemmaContainsTupThenGetReturnValue!276 lt!453245 (_1!7783 (tuple2!15545 lt!453081 (zeroValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 lt!453081 (zeroValue!5939 thiss!1427)))))))

(assert (=> d!123085 (= lt!453245 (insertStrictlySorted!369 (toList!6853 lt!453080) (_1!7783 (tuple2!15545 lt!453081 (zeroValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 lt!453081 (zeroValue!5939 thiss!1427)))))))

(assert (=> d!123085 (= (+!3099 lt!453080 (tuple2!15545 lt!453081 (zeroValue!5939 thiss!1427))) lt!453243)))

(declare-fun b!1028736 () Bool)

(declare-fun res!688288 () Bool)

(assert (=> b!1028736 (=> (not res!688288) (not e!580721))))

(assert (=> b!1028736 (= res!688288 (= (getValueByKey!585 (toList!6853 lt!453243) (_1!7783 (tuple2!15545 lt!453081 (zeroValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 lt!453081 (zeroValue!5939 thiss!1427))))))))

(declare-fun b!1028737 () Bool)

(assert (=> b!1028737 (= e!580721 (contains!5969 (toList!6853 lt!453243) (tuple2!15545 lt!453081 (zeroValue!5939 thiss!1427))))))

(assert (= (and d!123085 res!688287) b!1028736))

(assert (= (and b!1028736 res!688288) b!1028737))

(declare-fun m!947723 () Bool)

(assert (=> d!123085 m!947723))

(declare-fun m!947725 () Bool)

(assert (=> d!123085 m!947725))

(declare-fun m!947727 () Bool)

(assert (=> d!123085 m!947727))

(declare-fun m!947729 () Bool)

(assert (=> d!123085 m!947729))

(declare-fun m!947731 () Bool)

(assert (=> b!1028736 m!947731))

(declare-fun m!947733 () Bool)

(assert (=> b!1028737 m!947733))

(assert (=> b!1028535 d!123085))

(declare-fun d!123087 () Bool)

(assert (=> d!123087 (= (apply!901 lt!453097 lt!453078) (get!16348 (getValueByKey!585 (toList!6853 lt!453097) lt!453078)))))

(declare-fun bs!30038 () Bool)

(assert (= bs!30038 d!123087))

(declare-fun m!947735 () Bool)

(assert (=> bs!30038 m!947735))

(assert (=> bs!30038 m!947735))

(declare-fun m!947737 () Bool)

(assert (=> bs!30038 m!947737))

(assert (=> b!1028535 d!123087))

(declare-fun d!123089 () Bool)

(declare-fun e!580723 () Bool)

(assert (=> d!123089 e!580723))

(declare-fun res!688289 () Bool)

(assert (=> d!123089 (=> res!688289 e!580723)))

(declare-fun lt!453248 () Bool)

(assert (=> d!123089 (= res!688289 (not lt!453248))))

(declare-fun lt!453247 () Bool)

(assert (=> d!123089 (= lt!453248 lt!453247)))

(declare-fun lt!453246 () Unit!33575)

(declare-fun e!580722 () Unit!33575)

(assert (=> d!123089 (= lt!453246 e!580722)))

(declare-fun c!103846 () Bool)

(assert (=> d!123089 (= c!103846 lt!453247)))

(assert (=> d!123089 (= lt!453247 (containsKey!560 (toList!6853 (+!3099 lt!453085 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427)))) lt!453093))))

(assert (=> d!123089 (= (contains!5968 (+!3099 lt!453085 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427))) lt!453093) lt!453248)))

(declare-fun b!1028738 () Bool)

(declare-fun lt!453249 () Unit!33575)

(assert (=> b!1028738 (= e!580722 lt!453249)))

(assert (=> b!1028738 (= lt!453249 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6853 (+!3099 lt!453085 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427)))) lt!453093))))

(assert (=> b!1028738 (isDefined!432 (getValueByKey!585 (toList!6853 (+!3099 lt!453085 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427)))) lt!453093))))

(declare-fun b!1028739 () Bool)

(declare-fun Unit!33588 () Unit!33575)

(assert (=> b!1028739 (= e!580722 Unit!33588)))

(declare-fun b!1028740 () Bool)

(assert (=> b!1028740 (= e!580723 (isDefined!432 (getValueByKey!585 (toList!6853 (+!3099 lt!453085 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427)))) lt!453093)))))

(assert (= (and d!123089 c!103846) b!1028738))

(assert (= (and d!123089 (not c!103846)) b!1028739))

(assert (= (and d!123089 (not res!688289)) b!1028740))

(declare-fun m!947739 () Bool)

(assert (=> d!123089 m!947739))

(declare-fun m!947741 () Bool)

(assert (=> b!1028738 m!947741))

(declare-fun m!947743 () Bool)

(assert (=> b!1028738 m!947743))

(assert (=> b!1028738 m!947743))

(declare-fun m!947745 () Bool)

(assert (=> b!1028738 m!947745))

(assert (=> b!1028740 m!947743))

(assert (=> b!1028740 m!947743))

(assert (=> b!1028740 m!947745))

(assert (=> b!1028535 d!123089))

(declare-fun d!123091 () Bool)

(declare-fun e!580724 () Bool)

(assert (=> d!123091 e!580724))

(declare-fun res!688290 () Bool)

(assert (=> d!123091 (=> (not res!688290) (not e!580724))))

(declare-fun lt!453251 () ListLongMap!13675)

(assert (=> d!123091 (= res!688290 (contains!5968 lt!453251 (_1!7783 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427)))))))

(declare-fun lt!453253 () List!21815)

(assert (=> d!123091 (= lt!453251 (ListLongMap!13676 lt!453253))))

(declare-fun lt!453250 () Unit!33575)

(declare-fun lt!453252 () Unit!33575)

(assert (=> d!123091 (= lt!453250 lt!453252)))

(assert (=> d!123091 (= (getValueByKey!585 lt!453253 (_1!7783 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427)))))))

(assert (=> d!123091 (= lt!453252 (lemmaContainsTupThenGetReturnValue!276 lt!453253 (_1!7783 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427)))))))

(assert (=> d!123091 (= lt!453253 (insertStrictlySorted!369 (toList!6853 lt!453085) (_1!7783 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427)))))))

(assert (=> d!123091 (= (+!3099 lt!453085 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427))) lt!453251)))

(declare-fun b!1028741 () Bool)

(declare-fun res!688291 () Bool)

(assert (=> b!1028741 (=> (not res!688291) (not e!580724))))

(assert (=> b!1028741 (= res!688291 (= (getValueByKey!585 (toList!6853 lt!453251) (_1!7783 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427))))))))

(declare-fun b!1028742 () Bool)

(assert (=> b!1028742 (= e!580724 (contains!5969 (toList!6853 lt!453251) (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427))))))

(assert (= (and d!123091 res!688290) b!1028741))

(assert (= (and b!1028741 res!688291) b!1028742))

(declare-fun m!947747 () Bool)

(assert (=> d!123091 m!947747))

(declare-fun m!947749 () Bool)

(assert (=> d!123091 m!947749))

(declare-fun m!947751 () Bool)

(assert (=> d!123091 m!947751))

(declare-fun m!947753 () Bool)

(assert (=> d!123091 m!947753))

(declare-fun m!947755 () Bool)

(assert (=> b!1028741 m!947755))

(declare-fun m!947757 () Bool)

(assert (=> b!1028742 m!947757))

(assert (=> b!1028535 d!123091))

(declare-fun d!123093 () Bool)

(assert (=> d!123093 (contains!5968 (+!3099 lt!453085 (tuple2!15545 lt!453086 (zeroValue!5939 thiss!1427))) lt!453093)))

(declare-fun lt!453254 () Unit!33575)

(assert (=> d!123093 (= lt!453254 (choose!1687 lt!453085 lt!453086 (zeroValue!5939 thiss!1427) lt!453093))))

(assert (=> d!123093 (contains!5968 lt!453085 lt!453093)))

(assert (=> d!123093 (= (addStillContains!620 lt!453085 lt!453086 (zeroValue!5939 thiss!1427) lt!453093) lt!453254)))

(declare-fun bs!30039 () Bool)

(assert (= bs!30039 d!123093))

(assert (=> bs!30039 m!947347))

(assert (=> bs!30039 m!947347))

(assert (=> bs!30039 m!947349))

(declare-fun m!947759 () Bool)

(assert (=> bs!30039 m!947759))

(declare-fun m!947761 () Bool)

(assert (=> bs!30039 m!947761))

(assert (=> b!1028535 d!123093))

(declare-fun d!123095 () Bool)

(assert (=> d!123095 (= (apply!901 (+!3099 lt!453097 (tuple2!15545 lt!453095 (minValue!5939 thiss!1427))) lt!453078) (get!16348 (getValueByKey!585 (toList!6853 (+!3099 lt!453097 (tuple2!15545 lt!453095 (minValue!5939 thiss!1427)))) lt!453078)))))

(declare-fun bs!30040 () Bool)

(assert (= bs!30040 d!123095))

(declare-fun m!947763 () Bool)

(assert (=> bs!30040 m!947763))

(assert (=> bs!30040 m!947763))

(declare-fun m!947765 () Bool)

(assert (=> bs!30040 m!947765))

(assert (=> b!1028535 d!123095))

(declare-fun d!123097 () Bool)

(assert (=> d!123097 (= (apply!901 lt!453080 lt!453079) (get!16348 (getValueByKey!585 (toList!6853 lt!453080) lt!453079)))))

(declare-fun bs!30041 () Bool)

(assert (= bs!30041 d!123097))

(declare-fun m!947767 () Bool)

(assert (=> bs!30041 m!947767))

(assert (=> bs!30041 m!947767))

(declare-fun m!947769 () Bool)

(assert (=> bs!30041 m!947769))

(assert (=> b!1028535 d!123097))

(declare-fun d!123099 () Bool)

(assert (=> d!123099 (= (apply!901 (+!3099 lt!453080 (tuple2!15545 lt!453081 (zeroValue!5939 thiss!1427))) lt!453079) (get!16348 (getValueByKey!585 (toList!6853 (+!3099 lt!453080 (tuple2!15545 lt!453081 (zeroValue!5939 thiss!1427)))) lt!453079)))))

(declare-fun bs!30042 () Bool)

(assert (= bs!30042 d!123099))

(declare-fun m!947771 () Bool)

(assert (=> bs!30042 m!947771))

(assert (=> bs!30042 m!947771))

(declare-fun m!947773 () Bool)

(assert (=> bs!30042 m!947773))

(assert (=> b!1028535 d!123099))

(declare-fun d!123101 () Bool)

(assert (=> d!123101 (= (apply!901 (+!3099 lt!453089 (tuple2!15545 lt!453083 (minValue!5939 thiss!1427))) lt!453084) (get!16348 (getValueByKey!585 (toList!6853 (+!3099 lt!453089 (tuple2!15545 lt!453083 (minValue!5939 thiss!1427)))) lt!453084)))))

(declare-fun bs!30043 () Bool)

(assert (= bs!30043 d!123101))

(declare-fun m!947775 () Bool)

(assert (=> bs!30043 m!947775))

(assert (=> bs!30043 m!947775))

(declare-fun m!947777 () Bool)

(assert (=> bs!30043 m!947777))

(assert (=> b!1028535 d!123101))

(declare-fun d!123103 () Bool)

(assert (=> d!123103 (= (apply!901 (+!3099 lt!453089 (tuple2!15545 lt!453083 (minValue!5939 thiss!1427))) lt!453084) (apply!901 lt!453089 lt!453084))))

(declare-fun lt!453255 () Unit!33575)

(assert (=> d!123103 (= lt!453255 (choose!1686 lt!453089 lt!453083 (minValue!5939 thiss!1427) lt!453084))))

(declare-fun e!580725 () Bool)

(assert (=> d!123103 e!580725))

(declare-fun res!688292 () Bool)

(assert (=> d!123103 (=> (not res!688292) (not e!580725))))

(assert (=> d!123103 (= res!688292 (contains!5968 lt!453089 lt!453084))))

(assert (=> d!123103 (= (addApplyDifferent!480 lt!453089 lt!453083 (minValue!5939 thiss!1427) lt!453084) lt!453255)))

(declare-fun b!1028743 () Bool)

(assert (=> b!1028743 (= e!580725 (not (= lt!453084 lt!453083)))))

(assert (= (and d!123103 res!688292) b!1028743))

(assert (=> d!123103 m!947345))

(assert (=> d!123103 m!947367))

(declare-fun m!947779 () Bool)

(assert (=> d!123103 m!947779))

(assert (=> d!123103 m!947345))

(assert (=> d!123103 m!947373))

(declare-fun m!947781 () Bool)

(assert (=> d!123103 m!947781))

(assert (=> b!1028535 d!123103))

(declare-fun d!123105 () Bool)

(assert (=> d!123105 (= (apply!901 (+!3099 lt!453097 (tuple2!15545 lt!453095 (minValue!5939 thiss!1427))) lt!453078) (apply!901 lt!453097 lt!453078))))

(declare-fun lt!453256 () Unit!33575)

(assert (=> d!123105 (= lt!453256 (choose!1686 lt!453097 lt!453095 (minValue!5939 thiss!1427) lt!453078))))

(declare-fun e!580726 () Bool)

(assert (=> d!123105 e!580726))

(declare-fun res!688293 () Bool)

(assert (=> d!123105 (=> (not res!688293) (not e!580726))))

(assert (=> d!123105 (= res!688293 (contains!5968 lt!453097 lt!453078))))

(assert (=> d!123105 (= (addApplyDifferent!480 lt!453097 lt!453095 (minValue!5939 thiss!1427) lt!453078) lt!453256)))

(declare-fun b!1028744 () Bool)

(assert (=> b!1028744 (= e!580726 (not (= lt!453078 lt!453095)))))

(assert (= (and d!123105 res!688293) b!1028744))

(assert (=> d!123105 m!947351))

(assert (=> d!123105 m!947375))

(declare-fun m!947783 () Bool)

(assert (=> d!123105 m!947783))

(assert (=> d!123105 m!947351))

(assert (=> d!123105 m!947361))

(declare-fun m!947785 () Bool)

(assert (=> d!123105 m!947785))

(assert (=> b!1028535 d!123105))

(declare-fun d!123107 () Bool)

(declare-fun lt!453259 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!509 (List!21816) (InoxSet (_ BitVec 64)))

(assert (=> d!123107 (= lt!453259 (select (content!509 Nil!21813) (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(declare-fun e!580732 () Bool)

(assert (=> d!123107 (= lt!453259 e!580732)))

(declare-fun res!688298 () Bool)

(assert (=> d!123107 (=> (not res!688298) (not e!580732))))

(assert (=> d!123107 (= res!688298 ((_ is Cons!21812) Nil!21813))))

(assert (=> d!123107 (= (contains!5967 Nil!21813 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)) lt!453259)))

(declare-fun b!1028749 () Bool)

(declare-fun e!580731 () Bool)

(assert (=> b!1028749 (= e!580732 e!580731)))

(declare-fun res!688299 () Bool)

(assert (=> b!1028749 (=> res!688299 e!580731)))

(assert (=> b!1028749 (= res!688299 (= (h!23011 Nil!21813) (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(declare-fun b!1028750 () Bool)

(assert (=> b!1028750 (= e!580731 (contains!5967 (t!30894 Nil!21813) (select (arr!31137 lt!452950) #b00000000000000000000000000000000)))))

(assert (= (and d!123107 res!688298) b!1028749))

(assert (= (and b!1028749 (not res!688299)) b!1028750))

(declare-fun m!947787 () Bool)

(assert (=> d!123107 m!947787))

(assert (=> d!123107 m!947249))

(declare-fun m!947789 () Bool)

(assert (=> d!123107 m!947789))

(assert (=> b!1028750 m!947249))

(declare-fun m!947791 () Bool)

(assert (=> b!1028750 m!947791))

(assert (=> b!1028400 d!123107))

(assert (=> b!1028401 d!123013))

(declare-fun b!1028769 () Bool)

(declare-fun e!580747 () SeekEntryResult!9679)

(declare-fun e!580745 () SeekEntryResult!9679)

(assert (=> b!1028769 (= e!580747 e!580745)))

(declare-fun c!103853 () Bool)

(declare-fun lt!453265 () (_ BitVec 64))

(assert (=> b!1028769 (= c!103853 (or (= lt!453265 key!909) (= (bvadd lt!453265 lt!453265) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!123109 () Bool)

(declare-fun e!580743 () Bool)

(assert (=> d!123109 e!580743))

(declare-fun c!103855 () Bool)

(declare-fun lt!453264 () SeekEntryResult!9679)

(assert (=> d!123109 (= c!103855 (and ((_ is Intermediate!9679) lt!453264) (undefined!10491 lt!453264)))))

(assert (=> d!123109 (= lt!453264 e!580747)))

(declare-fun c!103854 () Bool)

(assert (=> d!123109 (= c!103854 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!123109 (= lt!453265 (select (arr!31137 (_keys!11257 thiss!1427)) (toIndex!0 key!909 (mask!29838 thiss!1427))))))

(assert (=> d!123109 (validMask!0 (mask!29838 thiss!1427))))

(assert (=> d!123109 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29838 thiss!1427)) key!909 (_keys!11257 thiss!1427) (mask!29838 thiss!1427)) lt!453264)))

(declare-fun b!1028770 () Bool)

(assert (=> b!1028770 (and (bvsge (index!41089 lt!453264) #b00000000000000000000000000000000) (bvslt (index!41089 lt!453264) (size!31651 (_keys!11257 thiss!1427))))))

(declare-fun res!688307 () Bool)

(assert (=> b!1028770 (= res!688307 (= (select (arr!31137 (_keys!11257 thiss!1427)) (index!41089 lt!453264)) key!909))))

(declare-fun e!580746 () Bool)

(assert (=> b!1028770 (=> res!688307 e!580746)))

(declare-fun e!580744 () Bool)

(assert (=> b!1028770 (= e!580744 e!580746)))

(declare-fun b!1028771 () Bool)

(assert (=> b!1028771 (= e!580743 (bvsge (x!91509 lt!453264) #b01111111111111111111111111111110))))

(declare-fun b!1028772 () Bool)

(assert (=> b!1028772 (= e!580745 (Intermediate!9679 false (toIndex!0 key!909 (mask!29838 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1028773 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028773 (= e!580745 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!29838 thiss!1427)) #b00000000000000000000000000000000 (mask!29838 thiss!1427)) key!909 (_keys!11257 thiss!1427) (mask!29838 thiss!1427)))))

(declare-fun b!1028774 () Bool)

(assert (=> b!1028774 (= e!580747 (Intermediate!9679 true (toIndex!0 key!909 (mask!29838 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1028775 () Bool)

(assert (=> b!1028775 (= e!580743 e!580744)))

(declare-fun res!688308 () Bool)

(assert (=> b!1028775 (= res!688308 (and ((_ is Intermediate!9679) lt!453264) (not (undefined!10491 lt!453264)) (bvslt (x!91509 lt!453264) #b01111111111111111111111111111110) (bvsge (x!91509 lt!453264) #b00000000000000000000000000000000) (bvsge (x!91509 lt!453264) #b00000000000000000000000000000000)))))

(assert (=> b!1028775 (=> (not res!688308) (not e!580744))))

(declare-fun b!1028776 () Bool)

(assert (=> b!1028776 (and (bvsge (index!41089 lt!453264) #b00000000000000000000000000000000) (bvslt (index!41089 lt!453264) (size!31651 (_keys!11257 thiss!1427))))))

(declare-fun res!688306 () Bool)

(assert (=> b!1028776 (= res!688306 (= (select (arr!31137 (_keys!11257 thiss!1427)) (index!41089 lt!453264)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1028776 (=> res!688306 e!580746)))

(declare-fun b!1028777 () Bool)

(assert (=> b!1028777 (and (bvsge (index!41089 lt!453264) #b00000000000000000000000000000000) (bvslt (index!41089 lt!453264) (size!31651 (_keys!11257 thiss!1427))))))

(assert (=> b!1028777 (= e!580746 (= (select (arr!31137 (_keys!11257 thiss!1427)) (index!41089 lt!453264)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!123109 c!103854) b!1028774))

(assert (= (and d!123109 (not c!103854)) b!1028769))

(assert (= (and b!1028769 c!103853) b!1028772))

(assert (= (and b!1028769 (not c!103853)) b!1028773))

(assert (= (and d!123109 c!103855) b!1028771))

(assert (= (and d!123109 (not c!103855)) b!1028775))

(assert (= (and b!1028775 res!688308) b!1028770))

(assert (= (and b!1028770 (not res!688307)) b!1028776))

(assert (= (and b!1028776 (not res!688306)) b!1028777))

(declare-fun m!947793 () Bool)

(assert (=> b!1028777 m!947793))

(assert (=> b!1028773 m!947235))

(declare-fun m!947795 () Bool)

(assert (=> b!1028773 m!947795))

(assert (=> b!1028773 m!947795))

(declare-fun m!947797 () Bool)

(assert (=> b!1028773 m!947797))

(assert (=> b!1028776 m!947793))

(assert (=> b!1028770 m!947793))

(assert (=> d!123109 m!947235))

(declare-fun m!947799 () Bool)

(assert (=> d!123109 m!947799))

(assert (=> d!123109 m!947239))

(assert (=> d!122947 d!123109))

(declare-fun d!123111 () Bool)

(declare-fun lt!453271 () (_ BitVec 32))

(declare-fun lt!453270 () (_ BitVec 32))

(assert (=> d!123111 (= lt!453271 (bvmul (bvxor lt!453270 (bvlshr lt!453270 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!123111 (= lt!453270 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!123111 (and (bvsge (mask!29838 thiss!1427) #b00000000000000000000000000000000) (let ((res!688309 (let ((h!23012 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!91540 (bvmul (bvxor h!23012 (bvlshr h!23012 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!91540 (bvlshr x!91540 #b00000000000000000000000000001101)) (mask!29838 thiss!1427)))))) (and (bvslt res!688309 (bvadd (mask!29838 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!688309 #b00000000000000000000000000000000))))))

(assert (=> d!123111 (= (toIndex!0 key!909 (mask!29838 thiss!1427)) (bvand (bvxor lt!453271 (bvlshr lt!453271 #b00000000000000000000000000001101)) (mask!29838 thiss!1427)))))

(assert (=> d!122947 d!123111))

(assert (=> d!122947 d!123001))

(declare-fun d!123113 () Bool)

(assert (=> d!123113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) (mask!29838 thiss!1427))))

(assert (=> d!123113 true))

(declare-fun _$44!12 () Unit!33575)

(assert (=> d!123113 (= (choose!25 (_keys!11257 thiss!1427) (index!41088 lt!452945) (mask!29838 thiss!1427)) _$44!12)))

(declare-fun bs!30044 () Bool)

(assert (= bs!30044 d!123113))

(assert (=> bs!30044 m!947179))

(assert (=> bs!30044 m!947407))

(assert (=> d!122975 d!123113))

(assert (=> d!122975 d!123001))

(assert (=> b!1028522 d!123071))

(declare-fun d!123115 () Bool)

(declare-fun e!580748 () Bool)

(assert (=> d!123115 e!580748))

(declare-fun res!688310 () Bool)

(assert (=> d!123115 (=> (not res!688310) (not e!580748))))

(declare-fun lt!453273 () ListLongMap!13675)

(assert (=> d!123115 (= res!688310 (contains!5968 lt!453273 (_1!7783 (ite (or c!103791 c!103790) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))))))

(declare-fun lt!453275 () List!21815)

(assert (=> d!123115 (= lt!453273 (ListLongMap!13676 lt!453275))))

(declare-fun lt!453272 () Unit!33575)

(declare-fun lt!453274 () Unit!33575)

(assert (=> d!123115 (= lt!453272 lt!453274)))

(assert (=> d!123115 (= (getValueByKey!585 lt!453275 (_1!7783 (ite (or c!103791 c!103790) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))) (Some!635 (_2!7783 (ite (or c!103791 c!103790) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))))))

(assert (=> d!123115 (= lt!453274 (lemmaContainsTupThenGetReturnValue!276 lt!453275 (_1!7783 (ite (or c!103791 c!103790) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))) (_2!7783 (ite (or c!103791 c!103790) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))))))

(assert (=> d!123115 (= lt!453275 (insertStrictlySorted!369 (toList!6853 (ite c!103791 call!43370 (ite c!103790 call!43374 call!43375))) (_1!7783 (ite (or c!103791 c!103790) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))) (_2!7783 (ite (or c!103791 c!103790) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))))))

(assert (=> d!123115 (= (+!3099 (ite c!103791 call!43370 (ite c!103790 call!43374 call!43375)) (ite (or c!103791 c!103790) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))) lt!453273)))

(declare-fun b!1028778 () Bool)

(declare-fun res!688311 () Bool)

(assert (=> b!1028778 (=> (not res!688311) (not e!580748))))

(assert (=> b!1028778 (= res!688311 (= (getValueByKey!585 (toList!6853 lt!453273) (_1!7783 (ite (or c!103791 c!103790) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))) (Some!635 (_2!7783 (ite (or c!103791 c!103790) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))))))))

(declare-fun b!1028779 () Bool)

(assert (=> b!1028779 (= e!580748 (contains!5969 (toList!6853 lt!453273) (ite (or c!103791 c!103790) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))))))

(assert (= (and d!123115 res!688310) b!1028778))

(assert (= (and b!1028778 res!688311) b!1028779))

(declare-fun m!947801 () Bool)

(assert (=> d!123115 m!947801))

(declare-fun m!947803 () Bool)

(assert (=> d!123115 m!947803))

(declare-fun m!947805 () Bool)

(assert (=> d!123115 m!947805))

(declare-fun m!947807 () Bool)

(assert (=> d!123115 m!947807))

(declare-fun m!947809 () Bool)

(assert (=> b!1028778 m!947809))

(declare-fun m!947811 () Bool)

(assert (=> b!1028779 m!947811))

(assert (=> bm!43372 d!123115))

(declare-fun d!123117 () Bool)

(declare-fun e!580749 () Bool)

(assert (=> d!123117 e!580749))

(declare-fun res!688312 () Bool)

(assert (=> d!123117 (=> (not res!688312) (not e!580749))))

(declare-fun lt!453277 () ListLongMap!13675)

(assert (=> d!123117 (= res!688312 (contains!5968 lt!453277 (_1!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))))))

(declare-fun lt!453279 () List!21815)

(assert (=> d!123117 (= lt!453277 (ListLongMap!13676 lt!453279))))

(declare-fun lt!453276 () Unit!33575)

(declare-fun lt!453278 () Unit!33575)

(assert (=> d!123117 (= lt!453276 lt!453278)))

(assert (=> d!123117 (= (getValueByKey!585 lt!453279 (_1!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))))))

(assert (=> d!123117 (= lt!453278 (lemmaContainsTupThenGetReturnValue!276 lt!453279 (_1!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))))))

(assert (=> d!123117 (= lt!453279 (insertStrictlySorted!369 (toList!6853 call!43365) (_1!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))))))

(assert (=> d!123117 (= (+!3099 call!43365 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))) lt!453277)))

(declare-fun b!1028780 () Bool)

(declare-fun res!688313 () Bool)

(assert (=> b!1028780 (=> (not res!688313) (not e!580749))))

(assert (=> b!1028780 (= res!688313 (= (getValueByKey!585 (toList!6853 lt!453277) (_1!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))))))

(declare-fun b!1028781 () Bool)

(assert (=> b!1028781 (= e!580749 (contains!5969 (toList!6853 lt!453277) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))))

(assert (= (and d!123117 res!688312) b!1028780))

(assert (= (and b!1028780 res!688313) b!1028781))

(declare-fun m!947813 () Bool)

(assert (=> d!123117 m!947813))

(declare-fun m!947815 () Bool)

(assert (=> d!123117 m!947815))

(declare-fun m!947817 () Bool)

(assert (=> d!123117 m!947817))

(declare-fun m!947819 () Bool)

(assert (=> d!123117 m!947819))

(declare-fun m!947821 () Bool)

(assert (=> b!1028780 m!947821))

(declare-fun m!947823 () Bool)

(assert (=> b!1028781 m!947823))

(assert (=> b!1028504 d!123117))

(assert (=> bm!43367 d!123083))

(assert (=> b!1028385 d!122963))

(declare-fun b!1028782 () Bool)

(declare-fun e!580752 () Bool)

(declare-fun call!43387 () Bool)

(assert (=> b!1028782 (= e!580752 call!43387)))

(declare-fun b!1028783 () Bool)

(declare-fun e!580751 () Bool)

(declare-fun e!580753 () Bool)

(assert (=> b!1028783 (= e!580751 e!580753)))

(declare-fun res!688316 () Bool)

(assert (=> b!1028783 (=> (not res!688316) (not e!580753))))

(declare-fun e!580750 () Bool)

(assert (=> b!1028783 (= res!688316 (not e!580750))))

(declare-fun res!688314 () Bool)

(assert (=> b!1028783 (=> (not res!688314) (not e!580750))))

(assert (=> b!1028783 (= res!688314 (validKeyInArray!0 (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!123119 () Bool)

(declare-fun res!688315 () Bool)

(assert (=> d!123119 (=> res!688315 e!580751)))

(assert (=> d!123119 (= res!688315 (bvsge #b00000000000000000000000000000000 (size!31651 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))))))))

(assert (=> d!123119 (= (arrayNoDuplicates!0 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) #b00000000000000000000000000000000 Nil!21813) e!580751)))

(declare-fun b!1028784 () Bool)

(assert (=> b!1028784 (= e!580750 (contains!5967 Nil!21813 (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun c!103856 () Bool)

(declare-fun bm!43384 () Bool)

(assert (=> bm!43384 (= call!43387 (arrayNoDuplicates!0 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103856 (Cons!21812 (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000) Nil!21813) Nil!21813)))))

(declare-fun b!1028785 () Bool)

(assert (=> b!1028785 (= e!580753 e!580752)))

(assert (=> b!1028785 (= c!103856 (validKeyInArray!0 (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1028786 () Bool)

(assert (=> b!1028786 (= e!580752 call!43387)))

(assert (= (and d!123119 (not res!688315)) b!1028783))

(assert (= (and b!1028783 res!688314) b!1028784))

(assert (= (and b!1028783 res!688316) b!1028785))

(assert (= (and b!1028785 c!103856) b!1028786))

(assert (= (and b!1028785 (not c!103856)) b!1028782))

(assert (= (or b!1028786 b!1028782) bm!43384))

(assert (=> b!1028783 m!947429))

(assert (=> b!1028783 m!947429))

(assert (=> b!1028783 m!947609))

(assert (=> b!1028784 m!947429))

(assert (=> b!1028784 m!947429))

(declare-fun m!947825 () Bool)

(assert (=> b!1028784 m!947825))

(assert (=> bm!43384 m!947429))

(declare-fun m!947827 () Bool)

(assert (=> bm!43384 m!947827))

(assert (=> b!1028785 m!947429))

(assert (=> b!1028785 m!947429))

(assert (=> b!1028785 m!947609))

(assert (=> b!1028417 d!123119))

(declare-fun d!123121 () Bool)

(assert (=> d!123121 (arrayNoDuplicates!0 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) #b00000000000000000000000000000000 Nil!21813)))

(assert (=> d!123121 true))

(declare-fun _$66!35 () Unit!33575)

(assert (=> d!123121 (= (choose!53 (_keys!11257 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41088 lt!452945) #b00000000000000000000000000000000 Nil!21813) _$66!35)))

(declare-fun bs!30045 () Bool)

(assert (= bs!30045 d!123121))

(assert (=> bs!30045 m!947179))

(assert (=> bs!30045 m!947267))

(assert (=> d!122955 d!123121))

(declare-fun b!1028787 () Bool)

(declare-fun e!580756 () Bool)

(declare-fun call!43388 () Bool)

(assert (=> b!1028787 (= e!580756 call!43388)))

(declare-fun b!1028788 () Bool)

(declare-fun e!580755 () Bool)

(declare-fun e!580757 () Bool)

(assert (=> b!1028788 (= e!580755 e!580757)))

(declare-fun res!688319 () Bool)

(assert (=> b!1028788 (=> (not res!688319) (not e!580757))))

(declare-fun e!580754 () Bool)

(assert (=> b!1028788 (= res!688319 (not e!580754))))

(declare-fun res!688317 () Bool)

(assert (=> b!1028788 (=> (not res!688317) (not e!580754))))

(assert (=> b!1028788 (= res!688317 (validKeyInArray!0 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123123 () Bool)

(declare-fun res!688318 () Bool)

(assert (=> d!123123 (=> res!688318 e!580755)))

(assert (=> d!123123 (= res!688318 (bvsge #b00000000000000000000000000000000 (size!31651 (_keys!11257 thiss!1427))))))

(assert (=> d!123123 (= (arrayNoDuplicates!0 (_keys!11257 thiss!1427) #b00000000000000000000000000000000 Nil!21813) e!580755)))

(declare-fun b!1028789 () Bool)

(assert (=> b!1028789 (= e!580754 (contains!5967 Nil!21813 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43385 () Bool)

(declare-fun c!103857 () Bool)

(assert (=> bm!43385 (= call!43388 (arrayNoDuplicates!0 (_keys!11257 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103857 (Cons!21812 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000) Nil!21813) Nil!21813)))))

(declare-fun b!1028790 () Bool)

(assert (=> b!1028790 (= e!580757 e!580756)))

(assert (=> b!1028790 (= c!103857 (validKeyInArray!0 (select (arr!31137 (_keys!11257 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028791 () Bool)

(assert (=> b!1028791 (= e!580756 call!43388)))

(assert (= (and d!123123 (not res!688318)) b!1028788))

(assert (= (and b!1028788 res!688317) b!1028789))

(assert (= (and b!1028788 res!688319) b!1028790))

(assert (= (and b!1028790 c!103857) b!1028791))

(assert (= (and b!1028790 (not c!103857)) b!1028787))

(assert (= (or b!1028791 b!1028787) bm!43385))

(assert (=> b!1028788 m!947287))

(assert (=> b!1028788 m!947287))

(assert (=> b!1028788 m!947289))

(assert (=> b!1028789 m!947287))

(assert (=> b!1028789 m!947287))

(declare-fun m!947829 () Bool)

(assert (=> b!1028789 m!947829))

(assert (=> bm!43385 m!947287))

(declare-fun m!947831 () Bool)

(assert (=> bm!43385 m!947831))

(assert (=> b!1028790 m!947287))

(assert (=> b!1028790 m!947287))

(assert (=> b!1028790 m!947289))

(assert (=> b!1028387 d!123123))

(declare-fun d!123125 () Bool)

(assert (=> d!123125 (= (apply!901 lt!453096 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16348 (getValueByKey!585 (toList!6853 lt!453096) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30046 () Bool)

(assert (= bs!30046 d!123125))

(assert (=> bs!30046 m!947453))

(assert (=> bs!30046 m!947453))

(declare-fun m!947833 () Bool)

(assert (=> bs!30046 m!947833))

(assert (=> b!1028526 d!123125))

(declare-fun d!123127 () Bool)

(assert (=> d!123127 (= (apply!901 lt!453073 (select (arr!31137 lt!452950) #b00000000000000000000000000000000)) (get!16348 (getValueByKey!585 (toList!6853 lt!453073) (select (arr!31137 lt!452950) #b00000000000000000000000000000000))))))

(declare-fun bs!30047 () Bool)

(assert (= bs!30047 d!123127))

(assert (=> bs!30047 m!947249))

(assert (=> bs!30047 m!947461))

(assert (=> bs!30047 m!947461))

(declare-fun m!947835 () Bool)

(assert (=> bs!30047 m!947835))

(assert (=> b!1028509 d!123127))

(declare-fun d!123129 () Bool)

(declare-fun c!103858 () Bool)

(assert (=> d!123129 (= c!103858 ((_ is ValueCellFull!11448) (select (arr!31138 lt!452946) #b00000000000000000000000000000000)))))

(declare-fun e!580758 () V!37277)

(assert (=> d!123129 (= (get!16347 (select (arr!31138 lt!452946) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!580758)))

(declare-fun b!1028792 () Bool)

(assert (=> b!1028792 (= e!580758 (get!16349 (select (arr!31138 lt!452946) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028793 () Bool)

(assert (=> b!1028793 (= e!580758 (get!16350 (select (arr!31138 lt!452946) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123129 c!103858) b!1028792))

(assert (= (and d!123129 (not c!103858)) b!1028793))

(assert (=> b!1028792 m!947325))

(assert (=> b!1028792 m!947163))

(declare-fun m!947837 () Bool)

(assert (=> b!1028792 m!947837))

(assert (=> b!1028793 m!947325))

(assert (=> b!1028793 m!947163))

(declare-fun m!947839 () Bool)

(assert (=> b!1028793 m!947839))

(assert (=> b!1028509 d!123129))

(declare-fun d!123131 () Bool)

(assert (=> d!123131 (= (validKeyInArray!0 (select (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945))) (and (not (= (select (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028432 d!123131))

(declare-fun b!1028806 () Bool)

(declare-fun e!580766 () SeekEntryResult!9679)

(assert (=> b!1028806 (= e!580766 (Found!9679 (index!41089 lt!452987)))))

(declare-fun b!1028807 () Bool)

(declare-fun e!580767 () SeekEntryResult!9679)

(assert (=> b!1028807 (= e!580767 (seekKeyOrZeroReturnVacant!0 (bvadd (x!91509 lt!452987) #b00000000000000000000000000000001) (nextIndex!0 (index!41089 lt!452987) (x!91509 lt!452987) (mask!29838 thiss!1427)) (index!41089 lt!452987) key!909 (_keys!11257 thiss!1427) (mask!29838 thiss!1427)))))

(declare-fun b!1028808 () Bool)

(declare-fun e!580765 () SeekEntryResult!9679)

(assert (=> b!1028808 (= e!580765 e!580766)))

(declare-fun c!103867 () Bool)

(declare-fun lt!453285 () (_ BitVec 64))

(assert (=> b!1028808 (= c!103867 (= lt!453285 key!909))))

(declare-fun d!123133 () Bool)

(declare-fun lt!453284 () SeekEntryResult!9679)

(assert (=> d!123133 (and (or ((_ is Undefined!9679) lt!453284) (not ((_ is Found!9679) lt!453284)) (and (bvsge (index!41088 lt!453284) #b00000000000000000000000000000000) (bvslt (index!41088 lt!453284) (size!31651 (_keys!11257 thiss!1427))))) (or ((_ is Undefined!9679) lt!453284) ((_ is Found!9679) lt!453284) (not ((_ is MissingVacant!9679) lt!453284)) (not (= (index!41090 lt!453284) (index!41089 lt!452987))) (and (bvsge (index!41090 lt!453284) #b00000000000000000000000000000000) (bvslt (index!41090 lt!453284) (size!31651 (_keys!11257 thiss!1427))))) (or ((_ is Undefined!9679) lt!453284) (ite ((_ is Found!9679) lt!453284) (= (select (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!453284)) key!909) (and ((_ is MissingVacant!9679) lt!453284) (= (index!41090 lt!453284) (index!41089 lt!452987)) (= (select (arr!31137 (_keys!11257 thiss!1427)) (index!41090 lt!453284)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!123133 (= lt!453284 e!580765)))

(declare-fun c!103866 () Bool)

(assert (=> d!123133 (= c!103866 (bvsge (x!91509 lt!452987) #b01111111111111111111111111111110))))

(assert (=> d!123133 (= lt!453285 (select (arr!31137 (_keys!11257 thiss!1427)) (index!41089 lt!452987)))))

(assert (=> d!123133 (validMask!0 (mask!29838 thiss!1427))))

(assert (=> d!123133 (= (seekKeyOrZeroReturnVacant!0 (x!91509 lt!452987) (index!41089 lt!452987) (index!41089 lt!452987) key!909 (_keys!11257 thiss!1427) (mask!29838 thiss!1427)) lt!453284)))

(declare-fun b!1028809 () Bool)

(declare-fun c!103865 () Bool)

(assert (=> b!1028809 (= c!103865 (= lt!453285 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1028809 (= e!580766 e!580767)))

(declare-fun b!1028810 () Bool)

(assert (=> b!1028810 (= e!580765 Undefined!9679)))

(declare-fun b!1028811 () Bool)

(assert (=> b!1028811 (= e!580767 (MissingVacant!9679 (index!41089 lt!452987)))))

(assert (= (and d!123133 c!103866) b!1028810))

(assert (= (and d!123133 (not c!103866)) b!1028808))

(assert (= (and b!1028808 c!103867) b!1028806))

(assert (= (and b!1028808 (not c!103867)) b!1028809))

(assert (= (and b!1028809 c!103865) b!1028811))

(assert (= (and b!1028809 (not c!103865)) b!1028807))

(declare-fun m!947841 () Bool)

(assert (=> b!1028807 m!947841))

(assert (=> b!1028807 m!947841))

(declare-fun m!947843 () Bool)

(assert (=> b!1028807 m!947843))

(declare-fun m!947845 () Bool)

(assert (=> d!123133 m!947845))

(declare-fun m!947847 () Bool)

(assert (=> d!123133 m!947847))

(assert (=> d!123133 m!947231))

(assert (=> d!123133 m!947239))

(assert (=> b!1028375 d!123133))

(declare-fun d!123135 () Bool)

(declare-fun e!580768 () Bool)

(assert (=> d!123135 e!580768))

(declare-fun res!688320 () Bool)

(assert (=> d!123135 (=> (not res!688320) (not e!580768))))

(declare-fun lt!453287 () ListLongMap!13675)

(assert (=> d!123135 (= res!688320 (contains!5968 lt!453287 (_1!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))))))

(declare-fun lt!453289 () List!21815)

(assert (=> d!123135 (= lt!453287 (ListLongMap!13676 lt!453289))))

(declare-fun lt!453286 () Unit!33575)

(declare-fun lt!453288 () Unit!33575)

(assert (=> d!123135 (= lt!453286 lt!453288)))

(assert (=> d!123135 (= (getValueByKey!585 lt!453289 (_1!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))))))

(assert (=> d!123135 (= lt!453288 (lemmaContainsTupThenGetReturnValue!276 lt!453289 (_1!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))))))

(assert (=> d!123135 (= lt!453289 (insertStrictlySorted!369 (toList!6853 call!43373) (_1!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))) (_2!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))))))

(assert (=> d!123135 (= (+!3099 call!43373 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))) lt!453287)))

(declare-fun b!1028812 () Bool)

(declare-fun res!688321 () Bool)

(assert (=> b!1028812 (=> (not res!688321) (not e!580768))))

(assert (=> b!1028812 (= res!688321 (= (getValueByKey!585 (toList!6853 lt!453287) (_1!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))) (Some!635 (_2!7783 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))))))

(declare-fun b!1028813 () Bool)

(assert (=> b!1028813 (= e!580768 (contains!5969 (toList!6853 lt!453287) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))))

(assert (= (and d!123135 res!688320) b!1028812))

(assert (= (and b!1028812 res!688321) b!1028813))

(declare-fun m!947849 () Bool)

(assert (=> d!123135 m!947849))

(declare-fun m!947851 () Bool)

(assert (=> d!123135 m!947851))

(declare-fun m!947853 () Bool)

(assert (=> d!123135 m!947853))

(declare-fun m!947855 () Bool)

(assert (=> d!123135 m!947855))

(declare-fun m!947857 () Bool)

(assert (=> b!1028812 m!947857))

(declare-fun m!947859 () Bool)

(assert (=> b!1028813 m!947859))

(assert (=> b!1028529 d!123135))

(declare-fun d!123137 () Bool)

(assert (=> d!123137 (= (-!480 (getCurrentListMap!3901 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)) key!909) (getCurrentListMap!3901 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) (array!64663 (store (arr!31138 (_values!6126 thiss!1427)) (index!41088 lt!452945) (ValueCellFull!11448 (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31652 (_values!6126 thiss!1427))) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(assert (=> d!123137 true))

(declare-fun _$9!38 () Unit!33575)

(assert (=> d!123137 (= (choose!1685 (_keys!11257 thiss!1427) (_values!6126 thiss!1427) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) (index!41088 lt!452945) key!909 (defaultEntry!6103 thiss!1427)) _$9!38)))

(declare-fun b_lambda!15811 () Bool)

(assert (=> (not b_lambda!15811) (not d!123137)))

(assert (=> d!123137 t!30892))

(declare-fun b_and!32889 () Bool)

(assert (= b_and!32887 (and (=> t!30892 result!14121) b_and!32889)))

(assert (=> d!123137 m!947403))

(assert (=> d!123137 m!947179))

(assert (=> d!123137 m!947159))

(assert (=> d!123137 m!947159))

(assert (=> d!123137 m!947161))

(assert (=> d!123137 m!947147))

(assert (=> d!123137 m!947163))

(assert (=> d!122973 d!123137))

(assert (=> d!122973 d!123001))

(declare-fun d!123139 () Bool)

(assert (=> d!123139 (= (apply!901 lt!453073 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16348 (getValueByKey!585 (toList!6853 lt!453073) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30048 () Bool)

(assert (= bs!30048 d!123139))

(assert (=> bs!30048 m!947479))

(assert (=> bs!30048 m!947479))

(declare-fun m!947861 () Bool)

(assert (=> bs!30048 m!947861))

(assert (=> b!1028494 d!123139))

(assert (=> b!1028541 d!122971))

(assert (=> b!1028541 d!122969))

(declare-fun b!1028814 () Bool)

(declare-fun e!580774 () Bool)

(assert (=> b!1028814 (= e!580774 (validKeyInArray!0 (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1028815 () Bool)

(declare-fun e!580770 () Bool)

(declare-fun lt!453308 () ListLongMap!13675)

(assert (=> b!1028815 (= e!580770 (= (apply!901 lt!453308 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5939 thiss!1427)))))

(declare-fun b!1028816 () Bool)

(declare-fun c!103869 () Bool)

(assert (=> b!1028816 (= c!103869 (and (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!580779 () ListLongMap!13675)

(declare-fun e!580772 () ListLongMap!13675)

(assert (=> b!1028816 (= e!580779 e!580772)))

(declare-fun d!123141 () Bool)

(declare-fun e!580780 () Bool)

(assert (=> d!123141 e!580780))

(declare-fun res!688322 () Bool)

(assert (=> d!123141 (=> (not res!688322) (not e!580780))))

(assert (=> d!123141 (= res!688322 (or (bvsge #b00000000000000000000000000000000 (size!31651 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31651 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))))))))))

(declare-fun lt!453300 () ListLongMap!13675)

(assert (=> d!123141 (= lt!453308 lt!453300)))

(declare-fun lt!453310 () Unit!33575)

(declare-fun e!580773 () Unit!33575)

(assert (=> d!123141 (= lt!453310 e!580773)))

(declare-fun c!103872 () Bool)

(declare-fun e!580769 () Bool)

(assert (=> d!123141 (= c!103872 e!580769)))

(declare-fun res!688330 () Bool)

(assert (=> d!123141 (=> (not res!688330) (not e!580769))))

(assert (=> d!123141 (= res!688330 (bvslt #b00000000000000000000000000000000 (size!31651 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))))))))

(declare-fun e!580775 () ListLongMap!13675)

(assert (=> d!123141 (= lt!453300 e!580775)))

(declare-fun c!103871 () Bool)

(assert (=> d!123141 (= c!103871 (and (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123141 (validMask!0 (mask!29838 thiss!1427))))

(assert (=> d!123141 (= (getCurrentListMap!3901 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) (array!64663 (store (arr!31138 (_values!6126 thiss!1427)) (index!41088 lt!452945) (ValueCellFull!11448 (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31652 (_values!6126 thiss!1427))) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)) lt!453308)))

(declare-fun b!1028817 () Bool)

(declare-fun call!43391 () ListLongMap!13675)

(assert (=> b!1028817 (= e!580779 call!43391)))

(declare-fun b!1028818 () Bool)

(assert (=> b!1028818 (= e!580769 (validKeyInArray!0 (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1028819 () Bool)

(assert (=> b!1028819 (= e!580775 e!580779)))

(declare-fun c!103870 () Bool)

(assert (=> b!1028819 (= c!103870 (and (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43386 () Bool)

(declare-fun call!43389 () ListLongMap!13675)

(assert (=> bm!43386 (= call!43389 (getCurrentListMapNoExtraKeys!3515 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) (array!64663 (store (arr!31138 (_values!6126 thiss!1427)) (index!41088 lt!452945) (ValueCellFull!11448 (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31652 (_values!6126 thiss!1427))) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(declare-fun bm!43387 () Bool)

(declare-fun call!43392 () ListLongMap!13675)

(assert (=> bm!43387 (= call!43391 call!43392)))

(declare-fun b!1028820 () Bool)

(assert (=> b!1028820 (= e!580772 call!43391)))

(declare-fun b!1028821 () Bool)

(declare-fun e!580781 () Bool)

(declare-fun call!43395 () Bool)

(assert (=> b!1028821 (= e!580781 (not call!43395))))

(declare-fun b!1028822 () Bool)

(declare-fun e!580777 () Bool)

(assert (=> b!1028822 (= e!580777 (= (apply!901 lt!453308 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5939 thiss!1427)))))

(declare-fun b!1028823 () Bool)

(assert (=> b!1028823 (= e!580780 e!580781)))

(declare-fun c!103873 () Bool)

(assert (=> b!1028823 (= c!103873 (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1028824 () Bool)

(declare-fun e!580778 () Bool)

(declare-fun e!580776 () Bool)

(assert (=> b!1028824 (= e!580778 e!580776)))

(declare-fun res!688325 () Bool)

(assert (=> b!1028824 (=> (not res!688325) (not e!580776))))

(assert (=> b!1028824 (= res!688325 (contains!5968 lt!453308 (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> b!1028824 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31651 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))))))))

(declare-fun b!1028825 () Bool)

(assert (=> b!1028825 (= e!580775 (+!3099 call!43392 (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427))))))

(declare-fun b!1028826 () Bool)

(declare-fun res!688324 () Bool)

(assert (=> b!1028826 (=> (not res!688324) (not e!580780))))

(declare-fun e!580771 () Bool)

(assert (=> b!1028826 (= res!688324 e!580771)))

(declare-fun c!103868 () Bool)

(assert (=> b!1028826 (= c!103868 (not (= (bvand (extraKeys!5835 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1028827 () Bool)

(declare-fun res!688329 () Bool)

(assert (=> b!1028827 (=> (not res!688329) (not e!580780))))

(assert (=> b!1028827 (= res!688329 e!580778)))

(declare-fun res!688323 () Bool)

(assert (=> b!1028827 (=> res!688323 e!580778)))

(assert (=> b!1028827 (= res!688323 (not e!580774))))

(declare-fun res!688327 () Bool)

(assert (=> b!1028827 (=> (not res!688327) (not e!580774))))

(assert (=> b!1028827 (= res!688327 (bvslt #b00000000000000000000000000000000 (size!31651 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))))))))

(declare-fun b!1028828 () Bool)

(declare-fun call!43394 () ListLongMap!13675)

(assert (=> b!1028828 (= e!580772 call!43394)))

(declare-fun b!1028829 () Bool)

(assert (=> b!1028829 (= e!580771 e!580777)))

(declare-fun res!688328 () Bool)

(declare-fun call!43390 () Bool)

(assert (=> b!1028829 (= res!688328 call!43390)))

(assert (=> b!1028829 (=> (not res!688328) (not e!580777))))

(declare-fun bm!43388 () Bool)

(assert (=> bm!43388 (= call!43395 (contains!5968 lt!453308 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43389 () Bool)

(declare-fun call!43393 () ListLongMap!13675)

(assert (=> bm!43389 (= call!43394 call!43393)))

(declare-fun b!1028830 () Bool)

(assert (=> b!1028830 (= e!580776 (= (apply!901 lt!453308 (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000)) (get!16347 (select (arr!31138 (array!64663 (store (arr!31138 (_values!6126 thiss!1427)) (index!41088 lt!452945) (ValueCellFull!11448 (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31652 (_values!6126 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31652 (array!64663 (store (arr!31138 (_values!6126 thiss!1427)) (index!41088 lt!452945) (ValueCellFull!11448 (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31652 (_values!6126 thiss!1427))))))))

(assert (=> b!1028830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31651 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))))))))

(declare-fun b!1028831 () Bool)

(declare-fun lt!453294 () Unit!33575)

(assert (=> b!1028831 (= e!580773 lt!453294)))

(declare-fun lt!453297 () ListLongMap!13675)

(assert (=> b!1028831 (= lt!453297 (getCurrentListMapNoExtraKeys!3515 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) (array!64663 (store (arr!31138 (_values!6126 thiss!1427)) (index!41088 lt!452945) (ValueCellFull!11448 (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31652 (_values!6126 thiss!1427))) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(declare-fun lt!453298 () (_ BitVec 64))

(assert (=> b!1028831 (= lt!453298 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453305 () (_ BitVec 64))

(assert (=> b!1028831 (= lt!453305 (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453304 () Unit!33575)

(assert (=> b!1028831 (= lt!453304 (addStillContains!620 lt!453297 lt!453298 (zeroValue!5939 thiss!1427) lt!453305))))

(assert (=> b!1028831 (contains!5968 (+!3099 lt!453297 (tuple2!15545 lt!453298 (zeroValue!5939 thiss!1427))) lt!453305)))

(declare-fun lt!453303 () Unit!33575)

(assert (=> b!1028831 (= lt!453303 lt!453304)))

(declare-fun lt!453309 () ListLongMap!13675)

(assert (=> b!1028831 (= lt!453309 (getCurrentListMapNoExtraKeys!3515 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) (array!64663 (store (arr!31138 (_values!6126 thiss!1427)) (index!41088 lt!452945) (ValueCellFull!11448 (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31652 (_values!6126 thiss!1427))) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(declare-fun lt!453307 () (_ BitVec 64))

(assert (=> b!1028831 (= lt!453307 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453290 () (_ BitVec 64))

(assert (=> b!1028831 (= lt!453290 (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453302 () Unit!33575)

(assert (=> b!1028831 (= lt!453302 (addApplyDifferent!480 lt!453309 lt!453307 (minValue!5939 thiss!1427) lt!453290))))

(assert (=> b!1028831 (= (apply!901 (+!3099 lt!453309 (tuple2!15545 lt!453307 (minValue!5939 thiss!1427))) lt!453290) (apply!901 lt!453309 lt!453290))))

(declare-fun lt!453311 () Unit!33575)

(assert (=> b!1028831 (= lt!453311 lt!453302)))

(declare-fun lt!453292 () ListLongMap!13675)

(assert (=> b!1028831 (= lt!453292 (getCurrentListMapNoExtraKeys!3515 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) (array!64663 (store (arr!31138 (_values!6126 thiss!1427)) (index!41088 lt!452945) (ValueCellFull!11448 (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31652 (_values!6126 thiss!1427))) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(declare-fun lt!453293 () (_ BitVec 64))

(assert (=> b!1028831 (= lt!453293 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453291 () (_ BitVec 64))

(assert (=> b!1028831 (= lt!453291 (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453299 () Unit!33575)

(assert (=> b!1028831 (= lt!453299 (addApplyDifferent!480 lt!453292 lt!453293 (zeroValue!5939 thiss!1427) lt!453291))))

(assert (=> b!1028831 (= (apply!901 (+!3099 lt!453292 (tuple2!15545 lt!453293 (zeroValue!5939 thiss!1427))) lt!453291) (apply!901 lt!453292 lt!453291))))

(declare-fun lt!453306 () Unit!33575)

(assert (=> b!1028831 (= lt!453306 lt!453299)))

(declare-fun lt!453301 () ListLongMap!13675)

(assert (=> b!1028831 (= lt!453301 (getCurrentListMapNoExtraKeys!3515 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427))) (array!64663 (store (arr!31138 (_values!6126 thiss!1427)) (index!41088 lt!452945) (ValueCellFull!11448 (dynLambda!1950 (defaultEntry!6103 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31652 (_values!6126 thiss!1427))) (mask!29838 thiss!1427) (extraKeys!5835 thiss!1427) (zeroValue!5939 thiss!1427) (minValue!5939 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6103 thiss!1427)))))

(declare-fun lt!453295 () (_ BitVec 64))

(assert (=> b!1028831 (= lt!453295 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453296 () (_ BitVec 64))

(assert (=> b!1028831 (= lt!453296 (select (arr!31137 (array!64661 (store (arr!31137 (_keys!11257 thiss!1427)) (index!41088 lt!452945) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31651 (_keys!11257 thiss!1427)))) #b00000000000000000000000000000000))))

(assert (=> b!1028831 (= lt!453294 (addApplyDifferent!480 lt!453301 lt!453295 (minValue!5939 thiss!1427) lt!453296))))

(assert (=> b!1028831 (= (apply!901 (+!3099 lt!453301 (tuple2!15545 lt!453295 (minValue!5939 thiss!1427))) lt!453296) (apply!901 lt!453301 lt!453296))))

(declare-fun b!1028832 () Bool)

(assert (=> b!1028832 (= e!580781 e!580770)))

(declare-fun res!688326 () Bool)

(assert (=> b!1028832 (= res!688326 call!43395)))

(assert (=> b!1028832 (=> (not res!688326) (not e!580770))))

(declare-fun b!1028833 () Bool)

(assert (=> b!1028833 (= e!580771 (not call!43390))))

(declare-fun bm!43390 () Bool)

(assert (=> bm!43390 (= call!43390 (contains!5968 lt!453308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43391 () Bool)

(assert (=> bm!43391 (= call!43392 (+!3099 (ite c!103871 call!43389 (ite c!103870 call!43393 call!43394)) (ite (or c!103871 c!103870) (tuple2!15545 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5939 thiss!1427)) (tuple2!15545 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5939 thiss!1427)))))))

(declare-fun bm!43392 () Bool)

(assert (=> bm!43392 (= call!43393 call!43389)))

(declare-fun b!1028834 () Bool)

(declare-fun Unit!33589 () Unit!33575)

(assert (=> b!1028834 (= e!580773 Unit!33589)))

(assert (= (and d!123141 c!103871) b!1028825))

(assert (= (and d!123141 (not c!103871)) b!1028819))

(assert (= (and b!1028819 c!103870) b!1028817))

(assert (= (and b!1028819 (not c!103870)) b!1028816))

(assert (= (and b!1028816 c!103869) b!1028820))

(assert (= (and b!1028816 (not c!103869)) b!1028828))

(assert (= (or b!1028820 b!1028828) bm!43389))

(assert (= (or b!1028817 bm!43389) bm!43392))

(assert (= (or b!1028817 b!1028820) bm!43387))

(assert (= (or b!1028825 bm!43392) bm!43386))

(assert (= (or b!1028825 bm!43387) bm!43391))

(assert (= (and d!123141 res!688330) b!1028818))

(assert (= (and d!123141 c!103872) b!1028831))

(assert (= (and d!123141 (not c!103872)) b!1028834))

(assert (= (and d!123141 res!688322) b!1028827))

(assert (= (and b!1028827 res!688327) b!1028814))

(assert (= (and b!1028827 (not res!688323)) b!1028824))

(assert (= (and b!1028824 res!688325) b!1028830))

(assert (= (and b!1028827 res!688329) b!1028826))

(assert (= (and b!1028826 c!103868) b!1028829))

(assert (= (and b!1028826 (not c!103868)) b!1028833))

(assert (= (and b!1028829 res!688328) b!1028822))

(assert (= (or b!1028829 b!1028833) bm!43390))

(assert (= (and b!1028826 res!688324) b!1028823))

(assert (= (and b!1028823 c!103873) b!1028832))

(assert (= (and b!1028823 (not c!103873)) b!1028821))

(assert (= (and b!1028832 res!688326) b!1028815))

(assert (= (or b!1028832 b!1028821) bm!43388))

(declare-fun b_lambda!15813 () Bool)

(assert (=> (not b_lambda!15813) (not b!1028830)))

(assert (=> b!1028830 t!30892))

(declare-fun b_and!32891 () Bool)

(assert (= b_and!32889 (and (=> t!30892 result!14121) b_and!32891)))

(declare-fun m!947863 () Bool)

(assert (=> b!1028831 m!947863))

(declare-fun m!947865 () Bool)

(assert (=> b!1028831 m!947865))

(declare-fun m!947867 () Bool)

(assert (=> b!1028831 m!947867))

(declare-fun m!947869 () Bool)

(assert (=> b!1028831 m!947869))

(declare-fun m!947871 () Bool)

(assert (=> b!1028831 m!947871))

(declare-fun m!947873 () Bool)

(assert (=> b!1028831 m!947873))

(declare-fun m!947875 () Bool)

(assert (=> b!1028831 m!947875))

(declare-fun m!947877 () Bool)

(assert (=> b!1028831 m!947877))

(declare-fun m!947879 () Bool)

(assert (=> b!1028831 m!947879))

(assert (=> b!1028831 m!947429))

(declare-fun m!947881 () Bool)

(assert (=> b!1028831 m!947881))

(declare-fun m!947883 () Bool)

(assert (=> b!1028831 m!947883))

(assert (=> b!1028831 m!947863))

(declare-fun m!947885 () Bool)

(assert (=> b!1028831 m!947885))

(declare-fun m!947887 () Bool)

(assert (=> b!1028831 m!947887))

(assert (=> b!1028831 m!947871))

(declare-fun m!947889 () Bool)

(assert (=> b!1028831 m!947889))

(declare-fun m!947891 () Bool)

(assert (=> b!1028831 m!947891))

(assert (=> b!1028831 m!947869))

(declare-fun m!947893 () Bool)

(assert (=> b!1028831 m!947893))

(assert (=> b!1028831 m!947865))

(assert (=> d!123141 m!947239))

(assert (=> b!1028814 m!947429))

(assert (=> b!1028814 m!947429))

(assert (=> b!1028814 m!947609))

(assert (=> b!1028830 m!947429))

(assert (=> b!1028830 m!947429))

(declare-fun m!947895 () Bool)

(assert (=> b!1028830 m!947895))

(declare-fun m!947897 () Bool)

(assert (=> b!1028830 m!947897))

(assert (=> b!1028830 m!947897))

(assert (=> b!1028830 m!947163))

(declare-fun m!947899 () Bool)

(assert (=> b!1028830 m!947899))

(assert (=> b!1028830 m!947163))

(declare-fun m!947901 () Bool)

(assert (=> b!1028822 m!947901))

(declare-fun m!947903 () Bool)

(assert (=> b!1028825 m!947903))

(declare-fun m!947905 () Bool)

(assert (=> bm!43390 m!947905))

(assert (=> b!1028818 m!947429))

(assert (=> b!1028818 m!947429))

(assert (=> b!1028818 m!947609))

(assert (=> b!1028824 m!947429))

(assert (=> b!1028824 m!947429))

(declare-fun m!947907 () Bool)

(assert (=> b!1028824 m!947907))

(declare-fun m!947909 () Bool)

(assert (=> b!1028815 m!947909))

(declare-fun m!947911 () Bool)

(assert (=> bm!43391 m!947911))

(declare-fun m!947913 () Bool)

(assert (=> bm!43388 m!947913))

(assert (=> bm!43386 m!947873))

(assert (=> b!1028541 d!123141))

(declare-fun d!123143 () Bool)

(declare-fun e!580783 () Bool)

(assert (=> d!123143 e!580783))

(declare-fun res!688331 () Bool)

(assert (=> d!123143 (=> res!688331 e!580783)))

(declare-fun lt!453314 () Bool)

(assert (=> d!123143 (= res!688331 (not lt!453314))))

(declare-fun lt!453313 () Bool)

(assert (=> d!123143 (= lt!453314 lt!453313)))

(declare-fun lt!453312 () Unit!33575)

(declare-fun e!580782 () Unit!33575)

(assert (=> d!123143 (= lt!453312 e!580782)))

(declare-fun c!103874 () Bool)

(assert (=> d!123143 (= c!103874 lt!453313)))

(assert (=> d!123143 (= lt!453313 (containsKey!560 (toList!6853 lt!453073) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123143 (= (contains!5968 lt!453073 #b0000000000000000000000000000000000000000000000000000000000000000) lt!453314)))

(declare-fun b!1028835 () Bool)

(declare-fun lt!453315 () Unit!33575)

(assert (=> b!1028835 (= e!580782 lt!453315)))

(assert (=> b!1028835 (= lt!453315 (lemmaContainsKeyImpliesGetValueByKeyDefined!393 (toList!6853 lt!453073) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1028835 (isDefined!432 (getValueByKey!585 (toList!6853 lt!453073) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028836 () Bool)

(declare-fun Unit!33590 () Unit!33575)

(assert (=> b!1028836 (= e!580782 Unit!33590)))

(declare-fun b!1028837 () Bool)

(assert (=> b!1028837 (= e!580783 (isDefined!432 (getValueByKey!585 (toList!6853 lt!453073) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123143 c!103874) b!1028835))

(assert (= (and d!123143 (not c!103874)) b!1028836))

(assert (= (and d!123143 (not res!688331)) b!1028837))

(declare-fun m!947915 () Bool)

(assert (=> d!123143 m!947915))

(declare-fun m!947917 () Bool)

(assert (=> b!1028835 m!947917))

(assert (=> b!1028835 m!947433))

(assert (=> b!1028835 m!947433))

(declare-fun m!947919 () Bool)

(assert (=> b!1028835 m!947919))

(assert (=> b!1028837 m!947433))

(assert (=> b!1028837 m!947433))

(assert (=> b!1028837 m!947919))

(assert (=> bm!43363 d!123143))

(declare-fun b!1028838 () Bool)

(declare-fun e!580785 () Bool)

(declare-fun call!43396 () Bool)

(assert (=> b!1028838 (= e!580785 call!43396)))

(declare-fun b!1028839 () Bool)

(declare-fun e!580786 () Bool)

(assert (=> b!1028839 (= e!580785 e!580786)))

(declare-fun lt!453318 () (_ BitVec 64))

(assert (=> b!1028839 (= lt!453318 (select (arr!31137 lt!452950) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!453316 () Unit!33575)

(assert (=> b!1028839 (= lt!453316 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!452950 lt!453318 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1028839 (arrayContainsKey!0 lt!452950 lt!453318 #b00000000000000000000000000000000)))

(declare-fun lt!453317 () Unit!33575)

(assert (=> b!1028839 (= lt!453317 lt!453316)))

(declare-fun res!688332 () Bool)

(assert (=> b!1028839 (= res!688332 (= (seekEntryOrOpen!0 (select (arr!31137 lt!452950) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!452950 (mask!29838 thiss!1427)) (Found!9679 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1028839 (=> (not res!688332) (not e!580786))))

(declare-fun b!1028840 () Bool)

(assert (=> b!1028840 (= e!580786 call!43396)))

(declare-fun d!123145 () Bool)

(declare-fun res!688333 () Bool)

(declare-fun e!580784 () Bool)

(assert (=> d!123145 (=> res!688333 e!580784)))

(assert (=> d!123145 (= res!688333 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31651 lt!452950)))))

(assert (=> d!123145 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!452950 (mask!29838 thiss!1427)) e!580784)))

(declare-fun b!1028841 () Bool)

(assert (=> b!1028841 (= e!580784 e!580785)))

(declare-fun c!103875 () Bool)

(assert (=> b!1028841 (= c!103875 (validKeyInArray!0 (select (arr!31137 lt!452950) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!43393 () Bool)

(assert (=> bm!43393 (= call!43396 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!452950 (mask!29838 thiss!1427)))))

(assert (= (and d!123145 (not res!688333)) b!1028841))

(assert (= (and b!1028841 c!103875) b!1028839))

(assert (= (and b!1028841 (not c!103875)) b!1028838))

(assert (= (and b!1028839 res!688332) b!1028840))

(assert (= (or b!1028840 b!1028838) bm!43393))

(assert (=> b!1028839 m!947441))

(declare-fun m!947921 () Bool)

(assert (=> b!1028839 m!947921))

(declare-fun m!947923 () Bool)

(assert (=> b!1028839 m!947923))

(assert (=> b!1028839 m!947441))

(declare-fun m!947925 () Bool)

(assert (=> b!1028839 m!947925))

(assert (=> b!1028841 m!947441))

(assert (=> b!1028841 m!947441))

(assert (=> b!1028841 m!947443))

(declare-fun m!947927 () Bool)

(assert (=> bm!43393 m!947927))

(assert (=> bm!43341 d!123145))

(assert (=> b!1028447 d!123071))

(assert (=> b!1028514 d!123013))

(declare-fun condMapEmpty!37897 () Bool)

(declare-fun mapDefault!37897 () ValueCell!11448)

(assert (=> mapNonEmpty!37896 (= condMapEmpty!37897 (= mapRest!37896 ((as const (Array (_ BitVec 32) ValueCell!11448)) mapDefault!37897)))))

(declare-fun e!580788 () Bool)

(declare-fun mapRes!37897 () Bool)

(assert (=> mapNonEmpty!37896 (= tp!72811 (and e!580788 mapRes!37897))))

(declare-fun b!1028843 () Bool)

(assert (=> b!1028843 (= e!580788 tp_is_empty!24303)))

(declare-fun b!1028842 () Bool)

(declare-fun e!580787 () Bool)

(assert (=> b!1028842 (= e!580787 tp_is_empty!24303)))

(declare-fun mapNonEmpty!37897 () Bool)

(declare-fun tp!72812 () Bool)

(assert (=> mapNonEmpty!37897 (= mapRes!37897 (and tp!72812 e!580787))))

(declare-fun mapValue!37897 () ValueCell!11448)

(declare-fun mapKey!37897 () (_ BitVec 32))

(declare-fun mapRest!37897 () (Array (_ BitVec 32) ValueCell!11448))

(assert (=> mapNonEmpty!37897 (= mapRest!37896 (store mapRest!37897 mapKey!37897 mapValue!37897))))

(declare-fun mapIsEmpty!37897 () Bool)

(assert (=> mapIsEmpty!37897 mapRes!37897))

(assert (= (and mapNonEmpty!37896 condMapEmpty!37897) mapIsEmpty!37897))

(assert (= (and mapNonEmpty!37896 (not condMapEmpty!37897)) mapNonEmpty!37897))

(assert (= (and mapNonEmpty!37897 ((_ is ValueCellFull!11448) mapValue!37897)) b!1028842))

(assert (= (and mapNonEmpty!37896 ((_ is ValueCellFull!11448) mapDefault!37897)) b!1028843))

(declare-fun m!947929 () Bool)

(assert (=> mapNonEmpty!37897 m!947929))

(declare-fun b_lambda!15815 () Bool)

(assert (= b_lambda!15811 (or (and b!1028328 b_free!20583) b_lambda!15815)))

(declare-fun b_lambda!15817 () Bool)

(assert (= b_lambda!15803 (or (and b!1028328 b_free!20583) b_lambda!15817)))

(declare-fun b_lambda!15819 () Bool)

(assert (= b_lambda!15809 (or (and b!1028328 b_free!20583) b_lambda!15819)))

(declare-fun b_lambda!15821 () Bool)

(assert (= b_lambda!15807 (or (and b!1028328 b_free!20583) b_lambda!15821)))

(declare-fun b_lambda!15823 () Bool)

(assert (= b_lambda!15805 (or (and b!1028328 b_free!20583) b_lambda!15823)))

(declare-fun b_lambda!15825 () Bool)

(assert (= b_lambda!15813 (or (and b!1028328 b_free!20583) b_lambda!15825)))

(check-sat (not b!1028675) (not b!1028616) (not b!1028793) (not b!1028676) (not d!122995) (not b!1028642) (not d!123095) (not d!123097) (not bm!43374) (not b!1028587) (not b!1028701) (not d!123045) (not b_lambda!15789) (not d!123033) (not b!1028573) (not d!122985) (not b!1028783) (not b!1028729) (not d!123041) (not b!1028736) (not b!1028696) (not b!1028831) tp_is_empty!24303 (not d!123117) (not d!123043) (not b!1028659) (not d!123081) (not b_lambda!15797) (not b!1028733) (not b!1028742) (not b!1028705) (not d!123105) (not b!1028670) (not b!1028822) (not d!123055) (not d!123079) (not b!1028589) (not d!123101) (not b!1028611) (not d!123093) (not b!1028646) (not d!123091) (not d!123115) (not b!1028720) (not b!1028818) (not b!1028714) (not b!1028725) (not bm!43382) (not d!122997) (not b!1028617) (not b_lambda!15819) (not d!123061) (not b!1028658) (not b!1028841) (not b!1028781) (not bm!43381) (not b!1028584) (not b!1028667) (not b!1028728) (not d!123107) (not d!123075) (not b!1028609) (not b!1028713) (not d!123017) (not b!1028724) (not b!1028581) (not d!123125) (not bm!43388) (not b!1028814) (not d!123113) (not b!1028718) (not b!1028582) (not b!1028649) (not d!123127) (not d!123023) (not b!1028656) (not b!1028723) (not b!1028657) b_and!32891 (not b!1028654) (not d!123139) (not b!1028837) (not b_lambda!15815) (not b!1028780) (not d!123031) (not b!1028580) (not b!1028731) (not b_lambda!15821) (not b!1028785) (not d!123035) (not b!1028824) (not d!123089) (not b!1028784) (not mapNonEmpty!37897) (not bm!43391) (not d!123029) (not d!123019) (not b_next!20583) (not d!123137) (not b!1028835) (not d!123051) (not b!1028789) (not b!1028645) (not b!1028600) (not d!122989) (not b!1028773) (not b!1028738) (not b!1028721) (not d!123053) (not b!1028825) (not d!123021) (not bm!43380) (not b_lambda!15801) (not b!1028660) (not b_lambda!15799) (not b!1028750) (not b!1028668) (not b!1028559) (not d!123027) (not d!122999) (not d!123007) (not d!123103) (not b!1028792) (not b!1028778) (not b!1028572) (not b!1028839) (not b!1028651) (not d!123025) (not b!1028807) (not d!123039) (not b!1028779) (not d!123121) (not bm!43379) (not b!1028727) (not bm!43378) (not bm!43383) (not bm!43386) (not b!1028730) (not d!123015) (not b!1028678) (not b!1028813) (not b!1028586) (not b!1028788) (not b!1028741) (not d!123083) (not b!1028578) (not b!1028812) (not b!1028682) (not d!123077) (not d!123087) (not d!123143) (not b!1028790) (not b!1028608) (not b!1028647) (not bm!43384) (not bm!43393) (not d!123009) (not bm!43385) (not d!122991) (not b!1028605) (not d!123133) (not b!1028648) (not b!1028603) (not b!1028599) (not d!123135) (not d!123003) (not bm!43375) (not bm!43390) (not b!1028643) (not b_lambda!15825) (not d!123059) (not d!123085) (not b_lambda!15823) (not d!123099) (not b!1028740) (not b!1028680) (not b_lambda!15817) (not d!123037) (not b!1028815) (not d!122983) (not d!123109) (not b!1028737) (not b!1028830) (not b!1028606) (not d!123141) (not b!1028716) (not b!1028561) (not b!1028677) (not d!123067) (not b!1028722))
(check-sat b_and!32891 (not b_next!20583))
