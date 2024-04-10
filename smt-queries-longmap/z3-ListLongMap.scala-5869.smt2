; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75746 () Bool)

(assert start!75746)

(declare-fun b!890697 () Bool)

(declare-fun b_free!15717 () Bool)

(declare-fun b_next!15717 () Bool)

(assert (=> b!890697 (= b_free!15717 (not b_next!15717))))

(declare-fun tp!55119 () Bool)

(declare-fun b_and!25957 () Bool)

(assert (=> b!890697 (= tp!55119 b_and!25957)))

(declare-fun b!890696 () Bool)

(declare-fun res!603491 () Bool)

(declare-fun e!496844 () Bool)

(assert (=> b!890696 (=> res!603491 e!496844)))

(declare-datatypes ((array!52070 0))(
  ( (array!52071 (arr!25041 (Array (_ BitVec 32) (_ BitVec 64))) (size!25485 (_ BitVec 32))) )
))
(declare-datatypes ((V!29025 0))(
  ( (V!29026 (val!9073 Int)) )
))
(declare-datatypes ((ValueCell!8541 0))(
  ( (ValueCellFull!8541 (v!11551 V!29025)) (EmptyCell!8541) )
))
(declare-datatypes ((array!52072 0))(
  ( (array!52073 (arr!25042 (Array (_ BitVec 32) ValueCell!8541)) (size!25486 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4098 0))(
  ( (LongMapFixedSize!4099 (defaultEntry!5246 Int) (mask!25725 (_ BitVec 32)) (extraKeys!4940 (_ BitVec 32)) (zeroValue!5044 V!29025) (minValue!5044 V!29025) (_size!2104 (_ BitVec 32)) (_keys!9929 array!52070) (_values!5231 array!52072) (_vacant!2104 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4098)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52070 (_ BitVec 32)) Bool)

(assert (=> b!890696 (= res!603491 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9929 thiss!1181) (mask!25725 thiss!1181))))))

(declare-fun res!603488 () Bool)

(declare-fun e!496838 () Bool)

(assert (=> start!75746 (=> (not res!603488) (not e!496838))))

(declare-fun valid!1591 (LongMapFixedSize!4098) Bool)

(assert (=> start!75746 (= res!603488 (valid!1591 thiss!1181))))

(assert (=> start!75746 e!496838))

(declare-fun e!496840 () Bool)

(assert (=> start!75746 e!496840))

(assert (=> start!75746 true))

(declare-fun tp_is_empty!18045 () Bool)

(declare-fun e!496845 () Bool)

(declare-fun array_inv!19684 (array!52070) Bool)

(declare-fun array_inv!19685 (array!52072) Bool)

(assert (=> b!890697 (= e!496840 (and tp!55119 tp_is_empty!18045 (array_inv!19684 (_keys!9929 thiss!1181)) (array_inv!19685 (_values!5231 thiss!1181)) e!496845))))

(declare-fun b!890698 () Bool)

(declare-fun e!496841 () Bool)

(assert (=> b!890698 (= e!496841 tp_is_empty!18045)))

(declare-fun b!890699 () Bool)

(declare-fun e!496842 () Bool)

(declare-datatypes ((SeekEntryResult!8806 0))(
  ( (MissingZero!8806 (index!37595 (_ BitVec 32))) (Found!8806 (index!37596 (_ BitVec 32))) (Intermediate!8806 (undefined!9618 Bool) (index!37597 (_ BitVec 32)) (x!75670 (_ BitVec 32))) (Undefined!8806) (MissingVacant!8806 (index!37598 (_ BitVec 32))) )
))
(declare-fun lt!402392 () SeekEntryResult!8806)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890699 (= e!496842 (inRange!0 (index!37596 lt!402392) (mask!25725 thiss!1181)))))

(declare-fun b!890700 () Bool)

(declare-fun res!603487 () Bool)

(assert (=> b!890700 (=> (not res!603487) (not e!496838))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890700 (= res!603487 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890701 () Bool)

(declare-fun e!496837 () Bool)

(assert (=> b!890701 (= e!496838 (not e!496837))))

(declare-fun res!603490 () Bool)

(assert (=> b!890701 (=> res!603490 e!496837)))

(get-info :version)

(assert (=> b!890701 (= res!603490 (not ((_ is Found!8806) lt!402392)))))

(assert (=> b!890701 e!496842))

(declare-fun res!603485 () Bool)

(assert (=> b!890701 (=> res!603485 e!496842)))

(assert (=> b!890701 (= res!603485 (not ((_ is Found!8806) lt!402392)))))

(declare-datatypes ((Unit!30312 0))(
  ( (Unit!30313) )
))
(declare-fun lt!402394 () Unit!30312)

(declare-fun lemmaSeekEntryGivesInRangeIndex!16 (array!52070 array!52072 (_ BitVec 32) (_ BitVec 32) V!29025 V!29025 (_ BitVec 64)) Unit!30312)

(assert (=> b!890701 (= lt!402394 (lemmaSeekEntryGivesInRangeIndex!16 (_keys!9929 thiss!1181) (_values!5231 thiss!1181) (mask!25725 thiss!1181) (extraKeys!4940 thiss!1181) (zeroValue!5044 thiss!1181) (minValue!5044 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52070 (_ BitVec 32)) SeekEntryResult!8806)

(assert (=> b!890701 (= lt!402392 (seekEntry!0 key!785 (_keys!9929 thiss!1181) (mask!25725 thiss!1181)))))

(declare-fun b!890702 () Bool)

(declare-fun res!603489 () Bool)

(assert (=> b!890702 (=> res!603489 e!496844)))

(assert (=> b!890702 (= res!603489 (or (not (= (size!25486 (_values!5231 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25725 thiss!1181)))) (not (= (size!25485 (_keys!9929 thiss!1181)) (size!25486 (_values!5231 thiss!1181)))) (bvslt (mask!25725 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4940 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4940 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28622 () Bool)

(declare-fun mapRes!28622 () Bool)

(assert (=> mapIsEmpty!28622 mapRes!28622))

(declare-fun b!890703 () Bool)

(assert (=> b!890703 (= e!496837 e!496844)))

(declare-fun res!603486 () Bool)

(assert (=> b!890703 (=> res!603486 e!496844)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890703 (= res!603486 (not (validMask!0 (mask!25725 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890703 (arrayContainsKey!0 (_keys!9929 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402393 () Unit!30312)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52070 (_ BitVec 64) (_ BitVec 32)) Unit!30312)

(assert (=> b!890703 (= lt!402393 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9929 thiss!1181) key!785 (index!37596 lt!402392)))))

(declare-fun b!890704 () Bool)

(assert (=> b!890704 (= e!496845 (and e!496841 mapRes!28622))))

(declare-fun condMapEmpty!28622 () Bool)

(declare-fun mapDefault!28622 () ValueCell!8541)

(assert (=> b!890704 (= condMapEmpty!28622 (= (arr!25042 (_values!5231 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8541)) mapDefault!28622)))))

(declare-fun b!890705 () Bool)

(assert (=> b!890705 (= e!496844 true)))

(declare-fun lt!402391 () Bool)

(declare-datatypes ((List!17725 0))(
  ( (Nil!17722) (Cons!17721 (h!18852 (_ BitVec 64)) (t!25024 List!17725)) )
))
(declare-fun arrayNoDuplicates!0 (array!52070 (_ BitVec 32) List!17725) Bool)

(assert (=> b!890705 (= lt!402391 (arrayNoDuplicates!0 (_keys!9929 thiss!1181) #b00000000000000000000000000000000 Nil!17722))))

(declare-fun b!890706 () Bool)

(declare-fun e!496839 () Bool)

(assert (=> b!890706 (= e!496839 tp_is_empty!18045)))

(declare-fun mapNonEmpty!28622 () Bool)

(declare-fun tp!55120 () Bool)

(assert (=> mapNonEmpty!28622 (= mapRes!28622 (and tp!55120 e!496839))))

(declare-fun mapKey!28622 () (_ BitVec 32))

(declare-fun mapValue!28622 () ValueCell!8541)

(declare-fun mapRest!28622 () (Array (_ BitVec 32) ValueCell!8541))

(assert (=> mapNonEmpty!28622 (= (arr!25042 (_values!5231 thiss!1181)) (store mapRest!28622 mapKey!28622 mapValue!28622))))

(assert (= (and start!75746 res!603488) b!890700))

(assert (= (and b!890700 res!603487) b!890701))

(assert (= (and b!890701 (not res!603485)) b!890699))

(assert (= (and b!890701 (not res!603490)) b!890703))

(assert (= (and b!890703 (not res!603486)) b!890702))

(assert (= (and b!890702 (not res!603489)) b!890696))

(assert (= (and b!890696 (not res!603491)) b!890705))

(assert (= (and b!890704 condMapEmpty!28622) mapIsEmpty!28622))

(assert (= (and b!890704 (not condMapEmpty!28622)) mapNonEmpty!28622))

(assert (= (and mapNonEmpty!28622 ((_ is ValueCellFull!8541) mapValue!28622)) b!890706))

(assert (= (and b!890704 ((_ is ValueCellFull!8541) mapDefault!28622)) b!890698))

(assert (= b!890697 b!890704))

(assert (= start!75746 b!890697))

(declare-fun m!829173 () Bool)

(assert (=> b!890699 m!829173))

(declare-fun m!829175 () Bool)

(assert (=> b!890696 m!829175))

(declare-fun m!829177 () Bool)

(assert (=> b!890697 m!829177))

(declare-fun m!829179 () Bool)

(assert (=> b!890697 m!829179))

(declare-fun m!829181 () Bool)

(assert (=> b!890705 m!829181))

(declare-fun m!829183 () Bool)

(assert (=> start!75746 m!829183))

(declare-fun m!829185 () Bool)

(assert (=> b!890701 m!829185))

(declare-fun m!829187 () Bool)

(assert (=> b!890701 m!829187))

(declare-fun m!829189 () Bool)

(assert (=> b!890703 m!829189))

(declare-fun m!829191 () Bool)

(assert (=> b!890703 m!829191))

(declare-fun m!829193 () Bool)

(assert (=> b!890703 m!829193))

(declare-fun m!829195 () Bool)

(assert (=> mapNonEmpty!28622 m!829195))

(check-sat (not b!890701) tp_is_empty!18045 (not b!890705) (not b!890697) (not b!890703) (not b_next!15717) (not b!890696) (not b!890699) (not start!75746) (not mapNonEmpty!28622) b_and!25957)
(check-sat b_and!25957 (not b_next!15717))
