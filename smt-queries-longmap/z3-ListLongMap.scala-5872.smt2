; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75930 () Bool)

(assert start!75930)

(declare-fun b!891869 () Bool)

(declare-fun b_free!15733 () Bool)

(declare-fun b_next!15733 () Bool)

(assert (=> b!891869 (= b_free!15733 (not b_next!15733))))

(declare-fun tp!55168 () Bool)

(declare-fun b_and!25983 () Bool)

(assert (=> b!891869 (= tp!55168 b_and!25983)))

(declare-fun b!891863 () Bool)

(declare-fun e!497636 () Bool)

(declare-fun e!497643 () Bool)

(declare-fun mapRes!28646 () Bool)

(assert (=> b!891863 (= e!497636 (and e!497643 mapRes!28646))))

(declare-fun condMapEmpty!28646 () Bool)

(declare-datatypes ((array!52141 0))(
  ( (array!52142 (arr!25072 (Array (_ BitVec 32) (_ BitVec 64))) (size!25517 (_ BitVec 32))) )
))
(declare-datatypes ((V!29047 0))(
  ( (V!29048 (val!9081 Int)) )
))
(declare-datatypes ((ValueCell!8549 0))(
  ( (ValueCellFull!8549 (v!11556 V!29047)) (EmptyCell!8549) )
))
(declare-datatypes ((array!52143 0))(
  ( (array!52144 (arr!25073 (Array (_ BitVec 32) ValueCell!8549)) (size!25518 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4114 0))(
  ( (LongMapFixedSize!4115 (defaultEntry!5254 Int) (mask!25782 (_ BitVec 32)) (extraKeys!4948 (_ BitVec 32)) (zeroValue!5052 V!29047) (minValue!5052 V!29047) (_size!2112 (_ BitVec 32)) (_keys!9965 array!52141) (_values!5239 array!52143) (_vacant!2112 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4114)

(declare-fun mapDefault!28646 () ValueCell!8549)

(assert (=> b!891863 (= condMapEmpty!28646 (= (arr!25073 (_values!5239 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8549)) mapDefault!28646)))))

(declare-fun b!891864 () Bool)

(declare-fun e!497642 () Bool)

(declare-datatypes ((SeekEntryResult!8770 0))(
  ( (MissingZero!8770 (index!37451 (_ BitVec 32))) (Found!8770 (index!37452 (_ BitVec 32))) (Intermediate!8770 (undefined!9582 Bool) (index!37453 (_ BitVec 32)) (x!75672 (_ BitVec 32))) (Undefined!8770) (MissingVacant!8770 (index!37454 (_ BitVec 32))) )
))
(declare-fun lt!402848 () SeekEntryResult!8770)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891864 (= e!497642 (inRange!0 (index!37452 lt!402848) (mask!25782 thiss!1181)))))

(declare-fun b!891865 () Bool)

(declare-fun tp_is_empty!18061 () Bool)

(assert (=> b!891865 (= e!497643 tp_is_empty!18061)))

(declare-fun b!891866 () Bool)

(declare-fun e!497638 () Bool)

(assert (=> b!891866 (= e!497638 tp_is_empty!18061)))

(declare-fun mapNonEmpty!28646 () Bool)

(declare-fun tp!55169 () Bool)

(assert (=> mapNonEmpty!28646 (= mapRes!28646 (and tp!55169 e!497638))))

(declare-fun mapValue!28646 () ValueCell!8549)

(declare-fun mapKey!28646 () (_ BitVec 32))

(declare-fun mapRest!28646 () (Array (_ BitVec 32) ValueCell!8549))

(assert (=> mapNonEmpty!28646 (= (arr!25073 (_values!5239 thiss!1181)) (store mapRest!28646 mapKey!28646 mapValue!28646))))

(declare-fun b!891867 () Bool)

(declare-fun e!497635 () Bool)

(declare-fun e!497641 () Bool)

(assert (=> b!891867 (= e!497635 e!497641)))

(declare-fun res!604001 () Bool)

(assert (=> b!891867 (=> res!604001 e!497641)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891867 (= res!604001 (not (validMask!0 (mask!25782 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891867 (arrayContainsKey!0 (_keys!9965 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30310 0))(
  ( (Unit!30311) )
))
(declare-fun lt!402851 () Unit!30310)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52141 (_ BitVec 64) (_ BitVec 32)) Unit!30310)

(assert (=> b!891867 (= lt!402851 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9965 thiss!1181) key!785 (index!37452 lt!402848)))))

(declare-fun b!891868 () Bool)

(declare-fun res!604003 () Bool)

(assert (=> b!891868 (=> res!604003 e!497641)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52141 (_ BitVec 32)) Bool)

(assert (=> b!891868 (= res!604003 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9965 thiss!1181) (mask!25782 thiss!1181))))))

(declare-fun e!497639 () Bool)

(declare-fun array_inv!19756 (array!52141) Bool)

(declare-fun array_inv!19757 (array!52143) Bool)

(assert (=> b!891869 (= e!497639 (and tp!55168 tp_is_empty!18061 (array_inv!19756 (_keys!9965 thiss!1181)) (array_inv!19757 (_values!5239 thiss!1181)) e!497636))))

(declare-fun b!891870 () Bool)

(declare-fun res!603998 () Bool)

(assert (=> b!891870 (=> res!603998 e!497641)))

(assert (=> b!891870 (= res!603998 (or (not (= (size!25518 (_values!5239 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25782 thiss!1181)))) (not (= (size!25517 (_keys!9965 thiss!1181)) (size!25518 (_values!5239 thiss!1181)))) (bvslt (mask!25782 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4948 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4948 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun res!603997 () Bool)

(declare-fun e!497640 () Bool)

(assert (=> start!75930 (=> (not res!603997) (not e!497640))))

(declare-fun valid!1607 (LongMapFixedSize!4114) Bool)

(assert (=> start!75930 (= res!603997 (valid!1607 thiss!1181))))

(assert (=> start!75930 e!497640))

(assert (=> start!75930 e!497639))

(assert (=> start!75930 true))

(declare-fun b!891871 () Bool)

(assert (=> b!891871 (= e!497640 (not e!497635))))

(declare-fun res!603999 () Bool)

(assert (=> b!891871 (=> res!603999 e!497635)))

(get-info :version)

(assert (=> b!891871 (= res!603999 (not ((_ is Found!8770) lt!402848)))))

(assert (=> b!891871 e!497642))

(declare-fun res!604002 () Bool)

(assert (=> b!891871 (=> res!604002 e!497642)))

(assert (=> b!891871 (= res!604002 (not ((_ is Found!8770) lt!402848)))))

(declare-fun lt!402849 () Unit!30310)

(declare-fun lemmaSeekEntryGivesInRangeIndex!25 (array!52141 array!52143 (_ BitVec 32) (_ BitVec 32) V!29047 V!29047 (_ BitVec 64)) Unit!30310)

(assert (=> b!891871 (= lt!402849 (lemmaSeekEntryGivesInRangeIndex!25 (_keys!9965 thiss!1181) (_values!5239 thiss!1181) (mask!25782 thiss!1181) (extraKeys!4948 thiss!1181) (zeroValue!5052 thiss!1181) (minValue!5052 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52141 (_ BitVec 32)) SeekEntryResult!8770)

(assert (=> b!891871 (= lt!402848 (seekEntry!0 key!785 (_keys!9965 thiss!1181) (mask!25782 thiss!1181)))))

(declare-fun b!891872 () Bool)

(assert (=> b!891872 (= e!497641 true)))

(declare-fun lt!402850 () Bool)

(declare-datatypes ((List!17685 0))(
  ( (Nil!17682) (Cons!17681 (h!18818 (_ BitVec 64)) (t!24976 List!17685)) )
))
(declare-fun arrayNoDuplicates!0 (array!52141 (_ BitVec 32) List!17685) Bool)

(assert (=> b!891872 (= lt!402850 (arrayNoDuplicates!0 (_keys!9965 thiss!1181) #b00000000000000000000000000000000 Nil!17682))))

(declare-fun mapIsEmpty!28646 () Bool)

(assert (=> mapIsEmpty!28646 mapRes!28646))

(declare-fun b!891873 () Bool)

(declare-fun res!604000 () Bool)

(assert (=> b!891873 (=> (not res!604000) (not e!497640))))

(assert (=> b!891873 (= res!604000 (not (= key!785 (bvneg key!785))))))

(assert (= (and start!75930 res!603997) b!891873))

(assert (= (and b!891873 res!604000) b!891871))

(assert (= (and b!891871 (not res!604002)) b!891864))

(assert (= (and b!891871 (not res!603999)) b!891867))

(assert (= (and b!891867 (not res!604001)) b!891870))

(assert (= (and b!891870 (not res!603998)) b!891868))

(assert (= (and b!891868 (not res!604003)) b!891872))

(assert (= (and b!891863 condMapEmpty!28646) mapIsEmpty!28646))

(assert (= (and b!891863 (not condMapEmpty!28646)) mapNonEmpty!28646))

(assert (= (and mapNonEmpty!28646 ((_ is ValueCellFull!8549) mapValue!28646)) b!891866))

(assert (= (and b!891863 ((_ is ValueCellFull!8549) mapDefault!28646)) b!891865))

(assert (= b!891869 b!891863))

(assert (= start!75930 b!891869))

(declare-fun m!830659 () Bool)

(assert (=> b!891868 m!830659))

(declare-fun m!830661 () Bool)

(assert (=> b!891869 m!830661))

(declare-fun m!830663 () Bool)

(assert (=> b!891869 m!830663))

(declare-fun m!830665 () Bool)

(assert (=> start!75930 m!830665))

(declare-fun m!830667 () Bool)

(assert (=> b!891872 m!830667))

(declare-fun m!830669 () Bool)

(assert (=> b!891871 m!830669))

(declare-fun m!830671 () Bool)

(assert (=> b!891871 m!830671))

(declare-fun m!830673 () Bool)

(assert (=> b!891864 m!830673))

(declare-fun m!830675 () Bool)

(assert (=> b!891867 m!830675))

(declare-fun m!830677 () Bool)

(assert (=> b!891867 m!830677))

(declare-fun m!830679 () Bool)

(assert (=> b!891867 m!830679))

(declare-fun m!830681 () Bool)

(assert (=> mapNonEmpty!28646 m!830681))

(check-sat (not b!891869) (not b!891867) (not b!891864) (not start!75930) b_and!25983 (not b!891871) (not b!891868) (not b!891872) (not b_next!15733) tp_is_empty!18061 (not mapNonEmpty!28646))
(check-sat b_and!25983 (not b_next!15733))
