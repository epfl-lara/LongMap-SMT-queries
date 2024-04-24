; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75984 () Bool)

(assert start!75984)

(declare-fun b!892810 () Bool)

(declare-fun b_free!15787 () Bool)

(declare-fun b_next!15787 () Bool)

(assert (=> b!892810 (= b_free!15787 (not b_next!15787))))

(declare-fun tp!55330 () Bool)

(declare-fun b_and!26037 () Bool)

(assert (=> b!892810 (= tp!55330 b_and!26037)))

(declare-fun res!604626 () Bool)

(declare-fun e!498371 () Bool)

(assert (=> start!75984 (=> (not res!604626) (not e!498371))))

(declare-datatypes ((array!52249 0))(
  ( (array!52250 (arr!25126 (Array (_ BitVec 32) (_ BitVec 64))) (size!25571 (_ BitVec 32))) )
))
(declare-datatypes ((V!29119 0))(
  ( (V!29120 (val!9108 Int)) )
))
(declare-datatypes ((ValueCell!8576 0))(
  ( (ValueCellFull!8576 (v!11583 V!29119)) (EmptyCell!8576) )
))
(declare-datatypes ((array!52251 0))(
  ( (array!52252 (arr!25127 (Array (_ BitVec 32) ValueCell!8576)) (size!25572 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4168 0))(
  ( (LongMapFixedSize!4169 (defaultEntry!5281 Int) (mask!25827 (_ BitVec 32)) (extraKeys!4975 (_ BitVec 32)) (zeroValue!5079 V!29119) (minValue!5079 V!29119) (_size!2139 (_ BitVec 32)) (_keys!9992 array!52249) (_values!5266 array!52251) (_vacant!2139 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4168)

(declare-fun valid!1625 (LongMapFixedSize!4168) Bool)

(assert (=> start!75984 (= res!604626 (valid!1625 thiss!1181))))

(assert (=> start!75984 e!498371))

(declare-fun e!498369 () Bool)

(assert (=> start!75984 e!498369))

(assert (=> start!75984 true))

(declare-fun e!498365 () Bool)

(declare-fun tp_is_empty!18115 () Bool)

(declare-fun array_inv!19790 (array!52249) Bool)

(declare-fun array_inv!19791 (array!52251) Bool)

(assert (=> b!892810 (= e!498369 (and tp!55330 tp_is_empty!18115 (array_inv!19790 (_keys!9992 thiss!1181)) (array_inv!19791 (_values!5266 thiss!1181)) e!498365))))

(declare-fun b!892811 () Bool)

(declare-fun e!498370 () Bool)

(declare-datatypes ((SeekEntryResult!8793 0))(
  ( (MissingZero!8793 (index!37543 (_ BitVec 32))) (Found!8793 (index!37544 (_ BitVec 32))) (Intermediate!8793 (undefined!9605 Bool) (index!37545 (_ BitVec 32)) (x!75767 (_ BitVec 32))) (Undefined!8793) (MissingVacant!8793 (index!37546 (_ BitVec 32))) )
))
(declare-fun lt!403284 () SeekEntryResult!8793)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892811 (= e!498370 (inRange!0 (index!37544 lt!403284) (mask!25827 thiss!1181)))))

(declare-fun b!892812 () Bool)

(declare-fun e!498367 () Bool)

(assert (=> b!892812 (= e!498367 true)))

(declare-fun lt!403285 () Bool)

(declare-datatypes ((tuple2!11894 0))(
  ( (tuple2!11895 (_1!5958 (_ BitVec 64)) (_2!5958 V!29119)) )
))
(declare-datatypes ((List!17719 0))(
  ( (Nil!17716) (Cons!17715 (h!18852 tuple2!11894) (t!25010 List!17719)) )
))
(declare-datatypes ((ListLongMap!10593 0))(
  ( (ListLongMap!10594 (toList!5312 List!17719)) )
))
(declare-fun lt!403287 () ListLongMap!10593)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4325 (ListLongMap!10593 (_ BitVec 64)) Bool)

(assert (=> b!892812 (= lt!403285 (contains!4325 lt!403287 key!785))))

(declare-fun mapNonEmpty!28727 () Bool)

(declare-fun mapRes!28727 () Bool)

(declare-fun tp!55331 () Bool)

(declare-fun e!498364 () Bool)

(assert (=> mapNonEmpty!28727 (= mapRes!28727 (and tp!55331 e!498364))))

(declare-fun mapKey!28727 () (_ BitVec 32))

(declare-fun mapRest!28727 () (Array (_ BitVec 32) ValueCell!8576))

(declare-fun mapValue!28727 () ValueCell!8576)

(assert (=> mapNonEmpty!28727 (= (arr!25127 (_values!5266 thiss!1181)) (store mapRest!28727 mapKey!28727 mapValue!28727))))

(declare-fun b!892813 () Bool)

(declare-fun e!498372 () Bool)

(assert (=> b!892813 (= e!498371 (not e!498372))))

(declare-fun res!604623 () Bool)

(assert (=> b!892813 (=> res!604623 e!498372)))

(get-info :version)

(assert (=> b!892813 (= res!604623 (not ((_ is Found!8793) lt!403284)))))

(assert (=> b!892813 e!498370))

(declare-fun res!604624 () Bool)

(assert (=> b!892813 (=> res!604624 e!498370)))

(assert (=> b!892813 (= res!604624 (not ((_ is Found!8793) lt!403284)))))

(declare-datatypes ((Unit!30356 0))(
  ( (Unit!30357) )
))
(declare-fun lt!403289 () Unit!30356)

(declare-fun lemmaSeekEntryGivesInRangeIndex!44 (array!52249 array!52251 (_ BitVec 32) (_ BitVec 32) V!29119 V!29119 (_ BitVec 64)) Unit!30356)

(assert (=> b!892813 (= lt!403289 (lemmaSeekEntryGivesInRangeIndex!44 (_keys!9992 thiss!1181) (_values!5266 thiss!1181) (mask!25827 thiss!1181) (extraKeys!4975 thiss!1181) (zeroValue!5079 thiss!1181) (minValue!5079 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52249 (_ BitVec 32)) SeekEntryResult!8793)

(assert (=> b!892813 (= lt!403284 (seekEntry!0 key!785 (_keys!9992 thiss!1181) (mask!25827 thiss!1181)))))

(declare-fun b!892814 () Bool)

(declare-fun res!604622 () Bool)

(assert (=> b!892814 (=> res!604622 e!498367)))

(assert (=> b!892814 (= res!604622 (or (not (= (size!25572 (_values!5266 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25827 thiss!1181)))) (not (= (size!25571 (_keys!9992 thiss!1181)) (size!25572 (_values!5266 thiss!1181)))) (bvslt (mask!25827 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4975 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4975 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!892815 () Bool)

(declare-fun e!498366 () Bool)

(assert (=> b!892815 (= e!498366 tp_is_empty!18115)))

(declare-fun b!892816 () Bool)

(assert (=> b!892816 (= e!498365 (and e!498366 mapRes!28727))))

(declare-fun condMapEmpty!28727 () Bool)

(declare-fun mapDefault!28727 () ValueCell!8576)

(assert (=> b!892816 (= condMapEmpty!28727 (= (arr!25127 (_values!5266 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8576)) mapDefault!28727)))))

(declare-fun b!892817 () Bool)

(declare-fun res!604625 () Bool)

(assert (=> b!892817 (=> res!604625 e!498367)))

(declare-datatypes ((List!17720 0))(
  ( (Nil!17717) (Cons!17716 (h!18853 (_ BitVec 64)) (t!25011 List!17720)) )
))
(declare-fun arrayNoDuplicates!0 (array!52249 (_ BitVec 32) List!17720) Bool)

(assert (=> b!892817 (= res!604625 (not (arrayNoDuplicates!0 (_keys!9992 thiss!1181) #b00000000000000000000000000000000 Nil!17717)))))

(declare-fun mapIsEmpty!28727 () Bool)

(assert (=> mapIsEmpty!28727 mapRes!28727))

(declare-fun b!892818 () Bool)

(assert (=> b!892818 (= e!498364 tp_is_empty!18115)))

(declare-fun b!892819 () Bool)

(assert (=> b!892819 (= e!498372 e!498367)))

(declare-fun res!604627 () Bool)

(assert (=> b!892819 (=> res!604627 e!498367)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892819 (= res!604627 (not (validMask!0 (mask!25827 thiss!1181))))))

(assert (=> b!892819 (contains!4325 lt!403287 (select (arr!25126 (_keys!9992 thiss!1181)) (index!37544 lt!403284)))))

(declare-fun getCurrentListMap!2589 (array!52249 array!52251 (_ BitVec 32) (_ BitVec 32) V!29119 V!29119 (_ BitVec 32) Int) ListLongMap!10593)

(assert (=> b!892819 (= lt!403287 (getCurrentListMap!2589 (_keys!9992 thiss!1181) (_values!5266 thiss!1181) (mask!25827 thiss!1181) (extraKeys!4975 thiss!1181) (zeroValue!5079 thiss!1181) (minValue!5079 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5281 thiss!1181)))))

(declare-fun lt!403286 () Unit!30356)

(declare-fun lemmaValidKeyInArrayIsInListMap!219 (array!52249 array!52251 (_ BitVec 32) (_ BitVec 32) V!29119 V!29119 (_ BitVec 32) Int) Unit!30356)

(assert (=> b!892819 (= lt!403286 (lemmaValidKeyInArrayIsInListMap!219 (_keys!9992 thiss!1181) (_values!5266 thiss!1181) (mask!25827 thiss!1181) (extraKeys!4975 thiss!1181) (zeroValue!5079 thiss!1181) (minValue!5079 thiss!1181) (index!37544 lt!403284) (defaultEntry!5281 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892819 (arrayContainsKey!0 (_keys!9992 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403288 () Unit!30356)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52249 (_ BitVec 64) (_ BitVec 32)) Unit!30356)

(assert (=> b!892819 (= lt!403288 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9992 thiss!1181) key!785 (index!37544 lt!403284)))))

(declare-fun b!892820 () Bool)

(declare-fun res!604620 () Bool)

(assert (=> b!892820 (=> res!604620 e!498367)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52249 (_ BitVec 32)) Bool)

(assert (=> b!892820 (= res!604620 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9992 thiss!1181) (mask!25827 thiss!1181))))))

(declare-fun b!892821 () Bool)

(declare-fun res!604621 () Bool)

(assert (=> b!892821 (=> (not res!604621) (not e!498371))))

(assert (=> b!892821 (= res!604621 (not (= key!785 (bvneg key!785))))))

(assert (= (and start!75984 res!604626) b!892821))

(assert (= (and b!892821 res!604621) b!892813))

(assert (= (and b!892813 (not res!604624)) b!892811))

(assert (= (and b!892813 (not res!604623)) b!892819))

(assert (= (and b!892819 (not res!604627)) b!892814))

(assert (= (and b!892814 (not res!604622)) b!892820))

(assert (= (and b!892820 (not res!604620)) b!892817))

(assert (= (and b!892817 (not res!604625)) b!892812))

(assert (= (and b!892816 condMapEmpty!28727) mapIsEmpty!28727))

(assert (= (and b!892816 (not condMapEmpty!28727)) mapNonEmpty!28727))

(assert (= (and mapNonEmpty!28727 ((_ is ValueCellFull!8576) mapValue!28727)) b!892818))

(assert (= (and b!892816 ((_ is ValueCellFull!8576) mapDefault!28727)) b!892815))

(assert (= b!892810 b!892816))

(assert (= start!75984 b!892810))

(declare-fun m!831487 () Bool)

(assert (=> b!892813 m!831487))

(declare-fun m!831489 () Bool)

(assert (=> b!892813 m!831489))

(declare-fun m!831491 () Bool)

(assert (=> mapNonEmpty!28727 m!831491))

(declare-fun m!831493 () Bool)

(assert (=> b!892820 m!831493))

(declare-fun m!831495 () Bool)

(assert (=> b!892817 m!831495))

(declare-fun m!831497 () Bool)

(assert (=> start!75984 m!831497))

(declare-fun m!831499 () Bool)

(assert (=> b!892812 m!831499))

(declare-fun m!831501 () Bool)

(assert (=> b!892819 m!831501))

(declare-fun m!831503 () Bool)

(assert (=> b!892819 m!831503))

(declare-fun m!831505 () Bool)

(assert (=> b!892819 m!831505))

(declare-fun m!831507 () Bool)

(assert (=> b!892819 m!831507))

(declare-fun m!831509 () Bool)

(assert (=> b!892819 m!831509))

(assert (=> b!892819 m!831507))

(declare-fun m!831511 () Bool)

(assert (=> b!892819 m!831511))

(declare-fun m!831513 () Bool)

(assert (=> b!892819 m!831513))

(declare-fun m!831515 () Bool)

(assert (=> b!892811 m!831515))

(declare-fun m!831517 () Bool)

(assert (=> b!892810 m!831517))

(declare-fun m!831519 () Bool)

(assert (=> b!892810 m!831519))

(check-sat tp_is_empty!18115 (not b!892810) (not mapNonEmpty!28727) (not b_next!15787) (not b!892820) (not start!75984) b_and!26037 (not b!892817) (not b!892813) (not b!892812) (not b!892811) (not b!892819))
(check-sat b_and!26037 (not b_next!15787))
