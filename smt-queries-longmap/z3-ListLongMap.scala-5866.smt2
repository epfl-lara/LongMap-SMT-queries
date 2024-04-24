; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75894 () Bool)

(assert start!75894)

(declare-fun b!891273 () Bool)

(declare-fun b_free!15697 () Bool)

(declare-fun b_next!15697 () Bool)

(assert (=> b!891273 (= b_free!15697 (not b_next!15697))))

(declare-fun tp!55060 () Bool)

(declare-fun b_and!25947 () Bool)

(assert (=> b!891273 (= tp!55060 b_and!25947)))

(declare-fun b!891269 () Bool)

(declare-fun res!603624 () Bool)

(declare-fun e!497151 () Bool)

(assert (=> b!891269 (=> res!603624 e!497151)))

(declare-datatypes ((array!52069 0))(
  ( (array!52070 (arr!25036 (Array (_ BitVec 32) (_ BitVec 64))) (size!25481 (_ BitVec 32))) )
))
(declare-datatypes ((V!28999 0))(
  ( (V!29000 (val!9063 Int)) )
))
(declare-datatypes ((ValueCell!8531 0))(
  ( (ValueCellFull!8531 (v!11538 V!28999)) (EmptyCell!8531) )
))
(declare-datatypes ((array!52071 0))(
  ( (array!52072 (arr!25037 (Array (_ BitVec 32) ValueCell!8531)) (size!25482 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4078 0))(
  ( (LongMapFixedSize!4079 (defaultEntry!5236 Int) (mask!25752 (_ BitVec 32)) (extraKeys!4930 (_ BitVec 32)) (zeroValue!5034 V!28999) (minValue!5034 V!28999) (_size!2094 (_ BitVec 32)) (_keys!9947 array!52069) (_values!5221 array!52071) (_vacant!2094 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4078)

(assert (=> b!891269 (= res!603624 (or (not (= (size!25482 (_values!5221 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25752 thiss!1181)))) (not (= (size!25481 (_keys!9947 thiss!1181)) (size!25482 (_values!5221 thiss!1181)))) (bvslt (mask!25752 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4930 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4930 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891270 () Bool)

(declare-fun e!497150 () Bool)

(declare-fun tp_is_empty!18025 () Bool)

(assert (=> b!891270 (= e!497150 tp_is_empty!18025)))

(declare-fun b!891271 () Bool)

(declare-fun e!497155 () Bool)

(declare-fun mapRes!28592 () Bool)

(assert (=> b!891271 (= e!497155 (and e!497150 mapRes!28592))))

(declare-fun condMapEmpty!28592 () Bool)

(declare-fun mapDefault!28592 () ValueCell!8531)

(assert (=> b!891271 (= condMapEmpty!28592 (= (arr!25037 (_values!5221 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8531)) mapDefault!28592)))))

(declare-fun e!497152 () Bool)

(declare-fun array_inv!19728 (array!52069) Bool)

(declare-fun array_inv!19729 (array!52071) Bool)

(assert (=> b!891273 (= e!497152 (and tp!55060 tp_is_empty!18025 (array_inv!19728 (_keys!9947 thiss!1181)) (array_inv!19729 (_values!5221 thiss!1181)) e!497155))))

(declare-fun b!891274 () Bool)

(declare-fun e!497157 () Bool)

(assert (=> b!891274 (= e!497157 e!497151)))

(declare-fun res!603622 () Bool)

(assert (=> b!891274 (=> res!603622 e!497151)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891274 (= res!603622 (not (validMask!0 (mask!25752 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891274 (arrayContainsKey!0 (_keys!9947 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!8755 0))(
  ( (MissingZero!8755 (index!37391 (_ BitVec 32))) (Found!8755 (index!37392 (_ BitVec 32))) (Intermediate!8755 (undefined!9567 Bool) (index!37393 (_ BitVec 32)) (x!75609 (_ BitVec 32))) (Undefined!8755) (MissingVacant!8755 (index!37394 (_ BitVec 32))) )
))
(declare-fun lt!402633 () SeekEntryResult!8755)

(declare-datatypes ((Unit!30282 0))(
  ( (Unit!30283) )
))
(declare-fun lt!402634 () Unit!30282)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52069 (_ BitVec 64) (_ BitVec 32)) Unit!30282)

(assert (=> b!891274 (= lt!402634 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9947 thiss!1181) key!785 (index!37392 lt!402633)))))

(declare-fun b!891275 () Bool)

(declare-fun res!603623 () Bool)

(declare-fun e!497149 () Bool)

(assert (=> b!891275 (=> (not res!603623) (not e!497149))))

(assert (=> b!891275 (= res!603623 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891276 () Bool)

(declare-fun res!603621 () Bool)

(assert (=> b!891276 (=> res!603621 e!497151)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52069 (_ BitVec 32)) Bool)

(assert (=> b!891276 (= res!603621 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9947 thiss!1181) (mask!25752 thiss!1181))))))

(declare-fun mapNonEmpty!28592 () Bool)

(declare-fun tp!55061 () Bool)

(declare-fun e!497153 () Bool)

(assert (=> mapNonEmpty!28592 (= mapRes!28592 (and tp!55061 e!497153))))

(declare-fun mapValue!28592 () ValueCell!8531)

(declare-fun mapRest!28592 () (Array (_ BitVec 32) ValueCell!8531))

(declare-fun mapKey!28592 () (_ BitVec 32))

(assert (=> mapNonEmpty!28592 (= (arr!25037 (_values!5221 thiss!1181)) (store mapRest!28592 mapKey!28592 mapValue!28592))))

(declare-fun b!891277 () Bool)

(assert (=> b!891277 (= e!497151 true)))

(declare-fun lt!402635 () Bool)

(declare-datatypes ((List!17673 0))(
  ( (Nil!17670) (Cons!17669 (h!18806 (_ BitVec 64)) (t!24964 List!17673)) )
))
(declare-fun arrayNoDuplicates!0 (array!52069 (_ BitVec 32) List!17673) Bool)

(assert (=> b!891277 (= lt!402635 (arrayNoDuplicates!0 (_keys!9947 thiss!1181) #b00000000000000000000000000000000 Nil!17670))))

(declare-fun b!891278 () Bool)

(assert (=> b!891278 (= e!497149 (not e!497157))))

(declare-fun res!603625 () Bool)

(assert (=> b!891278 (=> res!603625 e!497157)))

(get-info :version)

(assert (=> b!891278 (= res!603625 (not ((_ is Found!8755) lt!402633)))))

(declare-fun e!497154 () Bool)

(assert (=> b!891278 e!497154))

(declare-fun res!603620 () Bool)

(assert (=> b!891278 (=> res!603620 e!497154)))

(assert (=> b!891278 (= res!603620 (not ((_ is Found!8755) lt!402633)))))

(declare-fun lt!402632 () Unit!30282)

(declare-fun lemmaSeekEntryGivesInRangeIndex!13 (array!52069 array!52071 (_ BitVec 32) (_ BitVec 32) V!28999 V!28999 (_ BitVec 64)) Unit!30282)

(assert (=> b!891278 (= lt!402632 (lemmaSeekEntryGivesInRangeIndex!13 (_keys!9947 thiss!1181) (_values!5221 thiss!1181) (mask!25752 thiss!1181) (extraKeys!4930 thiss!1181) (zeroValue!5034 thiss!1181) (minValue!5034 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52069 (_ BitVec 32)) SeekEntryResult!8755)

(assert (=> b!891278 (= lt!402633 (seekEntry!0 key!785 (_keys!9947 thiss!1181) (mask!25752 thiss!1181)))))

(declare-fun b!891279 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891279 (= e!497154 (inRange!0 (index!37392 lt!402633) (mask!25752 thiss!1181)))))

(declare-fun mapIsEmpty!28592 () Bool)

(assert (=> mapIsEmpty!28592 mapRes!28592))

(declare-fun res!603619 () Bool)

(assert (=> start!75894 (=> (not res!603619) (not e!497149))))

(declare-fun valid!1594 (LongMapFixedSize!4078) Bool)

(assert (=> start!75894 (= res!603619 (valid!1594 thiss!1181))))

(assert (=> start!75894 e!497149))

(assert (=> start!75894 e!497152))

(assert (=> start!75894 true))

(declare-fun b!891272 () Bool)

(assert (=> b!891272 (= e!497153 tp_is_empty!18025)))

(assert (= (and start!75894 res!603619) b!891275))

(assert (= (and b!891275 res!603623) b!891278))

(assert (= (and b!891278 (not res!603620)) b!891279))

(assert (= (and b!891278 (not res!603625)) b!891274))

(assert (= (and b!891274 (not res!603622)) b!891269))

(assert (= (and b!891269 (not res!603624)) b!891276))

(assert (= (and b!891276 (not res!603621)) b!891277))

(assert (= (and b!891271 condMapEmpty!28592) mapIsEmpty!28592))

(assert (= (and b!891271 (not condMapEmpty!28592)) mapNonEmpty!28592))

(assert (= (and mapNonEmpty!28592 ((_ is ValueCellFull!8531) mapValue!28592)) b!891272))

(assert (= (and b!891271 ((_ is ValueCellFull!8531) mapDefault!28592)) b!891270))

(assert (= b!891273 b!891271))

(assert (= start!75894 b!891273))

(declare-fun m!830227 () Bool)

(assert (=> b!891273 m!830227))

(declare-fun m!830229 () Bool)

(assert (=> b!891273 m!830229))

(declare-fun m!830231 () Bool)

(assert (=> mapNonEmpty!28592 m!830231))

(declare-fun m!830233 () Bool)

(assert (=> b!891278 m!830233))

(declare-fun m!830235 () Bool)

(assert (=> b!891278 m!830235))

(declare-fun m!830237 () Bool)

(assert (=> b!891277 m!830237))

(declare-fun m!830239 () Bool)

(assert (=> b!891276 m!830239))

(declare-fun m!830241 () Bool)

(assert (=> b!891279 m!830241))

(declare-fun m!830243 () Bool)

(assert (=> b!891274 m!830243))

(declare-fun m!830245 () Bool)

(assert (=> b!891274 m!830245))

(declare-fun m!830247 () Bool)

(assert (=> b!891274 m!830247))

(declare-fun m!830249 () Bool)

(assert (=> start!75894 m!830249))

(check-sat b_and!25947 (not b!891273) (not b!891276) (not b!891278) (not mapNonEmpty!28592) (not b_next!15697) (not b!891279) (not b!891274) (not b!891277) (not start!75894) tp_is_empty!18025)
(check-sat b_and!25947 (not b_next!15697))
