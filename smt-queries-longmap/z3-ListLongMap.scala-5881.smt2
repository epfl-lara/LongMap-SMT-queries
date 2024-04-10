; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75818 () Bool)

(assert start!75818)

(declare-fun b!891946 () Bool)

(declare-fun b_free!15789 () Bool)

(declare-fun b_next!15789 () Bool)

(assert (=> b!891946 (= b_free!15789 (not b_next!15789))))

(declare-fun tp!55336 () Bool)

(declare-fun b_and!26029 () Bool)

(assert (=> b!891946 (= tp!55336 b_and!26029)))

(declare-fun b!891943 () Bool)

(declare-fun e!497812 () Bool)

(declare-fun e!497809 () Bool)

(declare-fun mapRes!28730 () Bool)

(assert (=> b!891943 (= e!497812 (and e!497809 mapRes!28730))))

(declare-fun condMapEmpty!28730 () Bool)

(declare-datatypes ((array!52214 0))(
  ( (array!52215 (arr!25113 (Array (_ BitVec 32) (_ BitVec 64))) (size!25557 (_ BitVec 32))) )
))
(declare-datatypes ((V!29121 0))(
  ( (V!29122 (val!9109 Int)) )
))
(declare-datatypes ((ValueCell!8577 0))(
  ( (ValueCellFull!8577 (v!11587 V!29121)) (EmptyCell!8577) )
))
(declare-datatypes ((array!52216 0))(
  ( (array!52217 (arr!25114 (Array (_ BitVec 32) ValueCell!8577)) (size!25558 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4170 0))(
  ( (LongMapFixedSize!4171 (defaultEntry!5282 Int) (mask!25785 (_ BitVec 32)) (extraKeys!4976 (_ BitVec 32)) (zeroValue!5080 V!29121) (minValue!5080 V!29121) (_size!2140 (_ BitVec 32)) (_keys!9965 array!52214) (_values!5267 array!52216) (_vacant!2140 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4170)

(declare-fun mapDefault!28730 () ValueCell!8577)

(assert (=> b!891943 (= condMapEmpty!28730 (= (arr!25114 (_values!5267 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8577)) mapDefault!28730)))))

(declare-fun b!891944 () Bool)

(declare-fun e!497815 () Bool)

(declare-datatypes ((SeekEntryResult!8837 0))(
  ( (MissingZero!8837 (index!37719 (_ BitVec 32))) (Found!8837 (index!37720 (_ BitVec 32))) (Intermediate!8837 (undefined!9649 Bool) (index!37721 (_ BitVec 32)) (x!75797 (_ BitVec 32))) (Undefined!8837) (MissingVacant!8837 (index!37722 (_ BitVec 32))) )
))
(declare-fun lt!402945 () SeekEntryResult!8837)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891944 (= e!497815 (inRange!0 (index!37720 lt!402945) (mask!25785 thiss!1181)))))

(declare-fun b!891945 () Bool)

(declare-fun e!497813 () Bool)

(declare-fun tp_is_empty!18117 () Bool)

(assert (=> b!891945 (= e!497813 tp_is_empty!18117)))

(declare-fun mapNonEmpty!28730 () Bool)

(declare-fun tp!55335 () Bool)

(assert (=> mapNonEmpty!28730 (= mapRes!28730 (and tp!55335 e!497813))))

(declare-fun mapValue!28730 () ValueCell!8577)

(declare-fun mapRest!28730 () (Array (_ BitVec 32) ValueCell!8577))

(declare-fun mapKey!28730 () (_ BitVec 32))

(assert (=> mapNonEmpty!28730 (= (arr!25114 (_values!5267 thiss!1181)) (store mapRest!28730 mapKey!28730 mapValue!28730))))

(declare-fun res!604304 () Bool)

(declare-fun e!497817 () Bool)

(assert (=> start!75818 (=> (not res!604304) (not e!497817))))

(declare-fun valid!1615 (LongMapFixedSize!4170) Bool)

(assert (=> start!75818 (= res!604304 (valid!1615 thiss!1181))))

(assert (=> start!75818 e!497817))

(declare-fun e!497816 () Bool)

(assert (=> start!75818 e!497816))

(assert (=> start!75818 true))

(declare-fun array_inv!19730 (array!52214) Bool)

(declare-fun array_inv!19731 (array!52216) Bool)

(assert (=> b!891946 (= e!497816 (and tp!55336 tp_is_empty!18117 (array_inv!19730 (_keys!9965 thiss!1181)) (array_inv!19731 (_values!5267 thiss!1181)) e!497812))))

(declare-fun mapIsEmpty!28730 () Bool)

(assert (=> mapIsEmpty!28730 mapRes!28730))

(declare-fun b!891947 () Bool)

(declare-fun res!604305 () Bool)

(declare-fun e!497810 () Bool)

(assert (=> b!891947 (=> res!604305 e!497810)))

(declare-datatypes ((List!17766 0))(
  ( (Nil!17763) (Cons!17762 (h!18893 (_ BitVec 64)) (t!25065 List!17766)) )
))
(declare-fun arrayNoDuplicates!0 (array!52214 (_ BitVec 32) List!17766) Bool)

(assert (=> b!891947 (= res!604305 (not (arrayNoDuplicates!0 (_keys!9965 thiss!1181) #b00000000000000000000000000000000 Nil!17763)))))

(declare-fun b!891948 () Bool)

(assert (=> b!891948 (= e!497809 tp_is_empty!18117)))

(declare-fun b!891949 () Bool)

(declare-fun res!604302 () Bool)

(assert (=> b!891949 (=> res!604302 e!497810)))

(assert (=> b!891949 (= res!604302 (or (not (= (size!25558 (_values!5267 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25785 thiss!1181)))) (not (= (size!25557 (_keys!9965 thiss!1181)) (size!25558 (_values!5267 thiss!1181)))) (bvslt (mask!25785 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4976 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4976 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891950 () Bool)

(declare-fun res!604303 () Bool)

(assert (=> b!891950 (=> (not res!604303) (not e!497817))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!891950 (= res!604303 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891951 () Bool)

(assert (=> b!891951 (= e!497810 true)))

(declare-fun lt!402946 () Bool)

(declare-datatypes ((tuple2!11976 0))(
  ( (tuple2!11977 (_1!5999 (_ BitVec 64)) (_2!5999 V!29121)) )
))
(declare-datatypes ((List!17767 0))(
  ( (Nil!17764) (Cons!17763 (h!18894 tuple2!11976) (t!25066 List!17767)) )
))
(declare-datatypes ((ListLongMap!10673 0))(
  ( (ListLongMap!10674 (toList!5352 List!17767)) )
))
(declare-fun lt!402944 () ListLongMap!10673)

(declare-fun contains!4354 (ListLongMap!10673 (_ BitVec 64)) Bool)

(assert (=> b!891951 (= lt!402946 (contains!4354 lt!402944 key!785))))

(declare-fun b!891952 () Bool)

(declare-fun res!604307 () Bool)

(assert (=> b!891952 (=> res!604307 e!497810)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52214 (_ BitVec 32)) Bool)

(assert (=> b!891952 (= res!604307 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9965 thiss!1181) (mask!25785 thiss!1181))))))

(declare-fun b!891953 () Bool)

(declare-fun e!497811 () Bool)

(assert (=> b!891953 (= e!497811 e!497810)))

(declare-fun res!604301 () Bool)

(assert (=> b!891953 (=> res!604301 e!497810)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891953 (= res!604301 (not (validMask!0 (mask!25785 thiss!1181))))))

(assert (=> b!891953 (contains!4354 lt!402944 (select (arr!25113 (_keys!9965 thiss!1181)) (index!37720 lt!402945)))))

(declare-fun getCurrentListMap!2634 (array!52214 array!52216 (_ BitVec 32) (_ BitVec 32) V!29121 V!29121 (_ BitVec 32) Int) ListLongMap!10673)

(assert (=> b!891953 (= lt!402944 (getCurrentListMap!2634 (_keys!9965 thiss!1181) (_values!5267 thiss!1181) (mask!25785 thiss!1181) (extraKeys!4976 thiss!1181) (zeroValue!5080 thiss!1181) (minValue!5080 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5282 thiss!1181)))))

(declare-datatypes ((Unit!30370 0))(
  ( (Unit!30371) )
))
(declare-fun lt!402942 () Unit!30370)

(declare-fun lemmaValidKeyInArrayIsInListMap!223 (array!52214 array!52216 (_ BitVec 32) (_ BitVec 32) V!29121 V!29121 (_ BitVec 32) Int) Unit!30370)

(assert (=> b!891953 (= lt!402942 (lemmaValidKeyInArrayIsInListMap!223 (_keys!9965 thiss!1181) (_values!5267 thiss!1181) (mask!25785 thiss!1181) (extraKeys!4976 thiss!1181) (zeroValue!5080 thiss!1181) (minValue!5080 thiss!1181) (index!37720 lt!402945) (defaultEntry!5282 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891953 (arrayContainsKey!0 (_keys!9965 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402943 () Unit!30370)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52214 (_ BitVec 64) (_ BitVec 32)) Unit!30370)

(assert (=> b!891953 (= lt!402943 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9965 thiss!1181) key!785 (index!37720 lt!402945)))))

(declare-fun b!891954 () Bool)

(assert (=> b!891954 (= e!497817 (not e!497811))))

(declare-fun res!604300 () Bool)

(assert (=> b!891954 (=> res!604300 e!497811)))

(get-info :version)

(assert (=> b!891954 (= res!604300 (not ((_ is Found!8837) lt!402945)))))

(assert (=> b!891954 e!497815))

(declare-fun res!604306 () Bool)

(assert (=> b!891954 (=> res!604306 e!497815)))

(assert (=> b!891954 (= res!604306 (not ((_ is Found!8837) lt!402945)))))

(declare-fun lt!402941 () Unit!30370)

(declare-fun lemmaSeekEntryGivesInRangeIndex!38 (array!52214 array!52216 (_ BitVec 32) (_ BitVec 32) V!29121 V!29121 (_ BitVec 64)) Unit!30370)

(assert (=> b!891954 (= lt!402941 (lemmaSeekEntryGivesInRangeIndex!38 (_keys!9965 thiss!1181) (_values!5267 thiss!1181) (mask!25785 thiss!1181) (extraKeys!4976 thiss!1181) (zeroValue!5080 thiss!1181) (minValue!5080 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52214 (_ BitVec 32)) SeekEntryResult!8837)

(assert (=> b!891954 (= lt!402945 (seekEntry!0 key!785 (_keys!9965 thiss!1181) (mask!25785 thiss!1181)))))

(assert (= (and start!75818 res!604304) b!891950))

(assert (= (and b!891950 res!604303) b!891954))

(assert (= (and b!891954 (not res!604306)) b!891944))

(assert (= (and b!891954 (not res!604300)) b!891953))

(assert (= (and b!891953 (not res!604301)) b!891949))

(assert (= (and b!891949 (not res!604302)) b!891952))

(assert (= (and b!891952 (not res!604307)) b!891947))

(assert (= (and b!891947 (not res!604305)) b!891951))

(assert (= (and b!891943 condMapEmpty!28730) mapIsEmpty!28730))

(assert (= (and b!891943 (not condMapEmpty!28730)) mapNonEmpty!28730))

(assert (= (and mapNonEmpty!28730 ((_ is ValueCellFull!8577) mapValue!28730)) b!891945))

(assert (= (and b!891943 ((_ is ValueCellFull!8577) mapDefault!28730)) b!891948))

(assert (= b!891946 b!891943))

(assert (= start!75818 b!891946))

(declare-fun m!830227 () Bool)

(assert (=> b!891953 m!830227))

(declare-fun m!830229 () Bool)

(assert (=> b!891953 m!830229))

(declare-fun m!830231 () Bool)

(assert (=> b!891953 m!830231))

(declare-fun m!830233 () Bool)

(assert (=> b!891953 m!830233))

(assert (=> b!891953 m!830231))

(declare-fun m!830235 () Bool)

(assert (=> b!891953 m!830235))

(declare-fun m!830237 () Bool)

(assert (=> b!891953 m!830237))

(declare-fun m!830239 () Bool)

(assert (=> b!891953 m!830239))

(declare-fun m!830241 () Bool)

(assert (=> b!891947 m!830241))

(declare-fun m!830243 () Bool)

(assert (=> mapNonEmpty!28730 m!830243))

(declare-fun m!830245 () Bool)

(assert (=> b!891952 m!830245))

(declare-fun m!830247 () Bool)

(assert (=> b!891946 m!830247))

(declare-fun m!830249 () Bool)

(assert (=> b!891946 m!830249))

(declare-fun m!830251 () Bool)

(assert (=> start!75818 m!830251))

(declare-fun m!830253 () Bool)

(assert (=> b!891954 m!830253))

(declare-fun m!830255 () Bool)

(assert (=> b!891954 m!830255))

(declare-fun m!830257 () Bool)

(assert (=> b!891944 m!830257))

(declare-fun m!830259 () Bool)

(assert (=> b!891951 m!830259))

(check-sat (not b!891952) (not b!891946) (not b!891944) (not start!75818) (not b!891953) (not b!891954) (not b_next!15789) b_and!26029 (not mapNonEmpty!28730) (not b!891947) (not b!891951) tp_is_empty!18117)
(check-sat b_and!26029 (not b_next!15789))
