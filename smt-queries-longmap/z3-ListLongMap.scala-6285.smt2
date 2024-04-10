; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80390 () Bool)

(assert start!80390)

(declare-fun b!944181 () Bool)

(declare-fun b_free!18033 () Bool)

(declare-fun b_next!18033 () Bool)

(assert (=> b!944181 (= b_free!18033 (not b_next!18033))))

(declare-fun tp!62608 () Bool)

(declare-fun b_and!29451 () Bool)

(assert (=> b!944181 (= tp!62608 b_and!29451)))

(declare-fun mapNonEmpty!32637 () Bool)

(declare-fun mapRes!32637 () Bool)

(declare-fun tp!62609 () Bool)

(declare-fun e!530927 () Bool)

(assert (=> mapNonEmpty!32637 (= mapRes!32637 (and tp!62609 e!530927))))

(declare-datatypes ((V!32353 0))(
  ( (V!32354 (val!10321 Int)) )
))
(declare-datatypes ((ValueCell!9789 0))(
  ( (ValueCellFull!9789 (v!12853 V!32353)) (EmptyCell!9789) )
))
(declare-datatypes ((array!57050 0))(
  ( (array!57051 (arr!27450 (Array (_ BitVec 32) ValueCell!9789)) (size!27916 (_ BitVec 32))) )
))
(declare-datatypes ((array!57052 0))(
  ( (array!57053 (arr!27451 (Array (_ BitVec 32) (_ BitVec 64))) (size!27917 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4728 0))(
  ( (LongMapFixedSize!4729 (defaultEntry!5659 Int) (mask!27303 (_ BitVec 32)) (extraKeys!5391 (_ BitVec 32)) (zeroValue!5495 V!32353) (minValue!5495 V!32353) (_size!2419 (_ BitVec 32)) (_keys!10537 array!57052) (_values!5682 array!57050) (_vacant!2419 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4728)

(declare-fun mapRest!32637 () (Array (_ BitVec 32) ValueCell!9789))

(declare-fun mapValue!32637 () ValueCell!9789)

(declare-fun mapKey!32637 () (_ BitVec 32))

(assert (=> mapNonEmpty!32637 (= (arr!27450 (_values!5682 thiss!1141)) (store mapRest!32637 mapKey!32637 mapValue!32637))))

(declare-fun b!944175 () Bool)

(declare-fun tp_is_empty!20541 () Bool)

(assert (=> b!944175 (= e!530927 tp_is_empty!20541)))

(declare-fun res!634291 () Bool)

(declare-fun e!530926 () Bool)

(assert (=> start!80390 (=> (not res!634291) (not e!530926))))

(declare-fun valid!1807 (LongMapFixedSize!4728) Bool)

(assert (=> start!80390 (= res!634291 (valid!1807 thiss!1141))))

(assert (=> start!80390 e!530926))

(declare-fun e!530923 () Bool)

(assert (=> start!80390 e!530923))

(assert (=> start!80390 true))

(declare-fun b!944176 () Bool)

(declare-fun e!530924 () Bool)

(assert (=> b!944176 (= e!530924 true)))

(declare-fun lt!425548 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57052 (_ BitVec 32)) Bool)

(assert (=> b!944176 (= lt!425548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10537 thiss!1141) (mask!27303 thiss!1141)))))

(declare-fun b!944177 () Bool)

(declare-fun res!634288 () Bool)

(assert (=> b!944177 (=> (not res!634288) (not e!530926))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13462 0))(
  ( (tuple2!13463 (_1!6742 (_ BitVec 64)) (_2!6742 V!32353)) )
))
(declare-datatypes ((List!19265 0))(
  ( (Nil!19262) (Cons!19261 (h!20412 tuple2!13462) (t!27582 List!19265)) )
))
(declare-datatypes ((ListLongMap!12159 0))(
  ( (ListLongMap!12160 (toList!6095 List!19265)) )
))
(declare-fun contains!5167 (ListLongMap!12159 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3329 (array!57052 array!57050 (_ BitVec 32) (_ BitVec 32) V!32353 V!32353 (_ BitVec 32) Int) ListLongMap!12159)

(assert (=> b!944177 (= res!634288 (contains!5167 (getCurrentListMap!3329 (_keys!10537 thiss!1141) (_values!5682 thiss!1141) (mask!27303 thiss!1141) (extraKeys!5391 thiss!1141) (zeroValue!5495 thiss!1141) (minValue!5495 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5659 thiss!1141)) key!756))))

(declare-fun b!944178 () Bool)

(declare-fun e!530928 () Bool)

(assert (=> b!944178 (= e!530928 tp_is_empty!20541)))

(declare-fun mapIsEmpty!32637 () Bool)

(assert (=> mapIsEmpty!32637 mapRes!32637))

(declare-fun b!944179 () Bool)

(declare-fun e!530929 () Bool)

(assert (=> b!944179 (= e!530929 (and e!530928 mapRes!32637))))

(declare-fun condMapEmpty!32637 () Bool)

(declare-fun mapDefault!32637 () ValueCell!9789)

(assert (=> b!944179 (= condMapEmpty!32637 (= (arr!27450 (_values!5682 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9789)) mapDefault!32637)))))

(declare-fun b!944180 () Bool)

(declare-fun res!634290 () Bool)

(assert (=> b!944180 (=> (not res!634290) (not e!530926))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9061 0))(
  ( (MissingZero!9061 (index!38615 (_ BitVec 32))) (Found!9061 (index!38616 (_ BitVec 32))) (Intermediate!9061 (undefined!9873 Bool) (index!38617 (_ BitVec 32)) (x!81088 (_ BitVec 32))) (Undefined!9061) (MissingVacant!9061 (index!38618 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57052 (_ BitVec 32)) SeekEntryResult!9061)

(assert (=> b!944180 (= res!634290 (not ((_ is Found!9061) (seekEntry!0 key!756 (_keys!10537 thiss!1141) (mask!27303 thiss!1141)))))))

(declare-fun array_inv!21328 (array!57052) Bool)

(declare-fun array_inv!21329 (array!57050) Bool)

(assert (=> b!944181 (= e!530923 (and tp!62608 tp_is_empty!20541 (array_inv!21328 (_keys!10537 thiss!1141)) (array_inv!21329 (_values!5682 thiss!1141)) e!530929))))

(declare-fun b!944182 () Bool)

(declare-fun res!634293 () Bool)

(assert (=> b!944182 (=> (not res!634293) (not e!530926))))

(assert (=> b!944182 (= res!634293 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944183 () Bool)

(assert (=> b!944183 (= e!530926 (not e!530924))))

(declare-fun res!634292 () Bool)

(assert (=> b!944183 (=> res!634292 e!530924)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944183 (= res!634292 (not (validMask!0 (mask!27303 thiss!1141))))))

(declare-fun lt!425550 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57052 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944183 (= lt!425550 (arrayScanForKey!0 (_keys!10537 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944183 (arrayContainsKey!0 (_keys!10537 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31836 0))(
  ( (Unit!31837) )
))
(declare-fun lt!425549 () Unit!31836)

(declare-fun lemmaKeyInListMapIsInArray!298 (array!57052 array!57050 (_ BitVec 32) (_ BitVec 32) V!32353 V!32353 (_ BitVec 64) Int) Unit!31836)

(assert (=> b!944183 (= lt!425549 (lemmaKeyInListMapIsInArray!298 (_keys!10537 thiss!1141) (_values!5682 thiss!1141) (mask!27303 thiss!1141) (extraKeys!5391 thiss!1141) (zeroValue!5495 thiss!1141) (minValue!5495 thiss!1141) key!756 (defaultEntry!5659 thiss!1141)))))

(declare-fun b!944184 () Bool)

(declare-fun res!634289 () Bool)

(assert (=> b!944184 (=> res!634289 e!530924)))

(assert (=> b!944184 (= res!634289 (or (not (= (size!27917 (_keys!10537 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27303 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27917 (_keys!10537 thiss!1141))) (bvslt lt!425550 #b00000000000000000000000000000000) (bvsgt lt!425550 (size!27917 (_keys!10537 thiss!1141)))))))

(assert (= (and start!80390 res!634291) b!944182))

(assert (= (and b!944182 res!634293) b!944180))

(assert (= (and b!944180 res!634290) b!944177))

(assert (= (and b!944177 res!634288) b!944183))

(assert (= (and b!944183 (not res!634292)) b!944184))

(assert (= (and b!944184 (not res!634289)) b!944176))

(assert (= (and b!944179 condMapEmpty!32637) mapIsEmpty!32637))

(assert (= (and b!944179 (not condMapEmpty!32637)) mapNonEmpty!32637))

(assert (= (and mapNonEmpty!32637 ((_ is ValueCellFull!9789) mapValue!32637)) b!944175))

(assert (= (and b!944179 ((_ is ValueCellFull!9789) mapDefault!32637)) b!944178))

(assert (= b!944181 b!944179))

(assert (= start!80390 b!944181))

(declare-fun m!878229 () Bool)

(assert (=> b!944183 m!878229))

(declare-fun m!878231 () Bool)

(assert (=> b!944183 m!878231))

(declare-fun m!878233 () Bool)

(assert (=> b!944183 m!878233))

(declare-fun m!878235 () Bool)

(assert (=> b!944183 m!878235))

(declare-fun m!878237 () Bool)

(assert (=> start!80390 m!878237))

(declare-fun m!878239 () Bool)

(assert (=> b!944176 m!878239))

(declare-fun m!878241 () Bool)

(assert (=> mapNonEmpty!32637 m!878241))

(declare-fun m!878243 () Bool)

(assert (=> b!944177 m!878243))

(assert (=> b!944177 m!878243))

(declare-fun m!878245 () Bool)

(assert (=> b!944177 m!878245))

(declare-fun m!878247 () Bool)

(assert (=> b!944180 m!878247))

(declare-fun m!878249 () Bool)

(assert (=> b!944181 m!878249))

(declare-fun m!878251 () Bool)

(assert (=> b!944181 m!878251))

(check-sat (not b!944176) (not b_next!18033) (not b!944183) (not b!944177) (not b!944180) tp_is_empty!20541 (not b!944181) (not mapNonEmpty!32637) b_and!29451 (not start!80390))
(check-sat b_and!29451 (not b_next!18033))
