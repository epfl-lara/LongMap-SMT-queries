; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75696 () Bool)

(assert start!75696)

(declare-fun b!889963 () Bool)

(declare-fun b_free!15685 () Bool)

(declare-fun b_next!15685 () Bool)

(assert (=> b!889963 (= b_free!15685 (not b_next!15685))))

(declare-fun tp!55025 () Bool)

(declare-fun b_and!25899 () Bool)

(assert (=> b!889963 (= tp!55025 b_and!25899)))

(declare-fun mapNonEmpty!28574 () Bool)

(declare-fun mapRes!28574 () Bool)

(declare-fun tp!55024 () Bool)

(declare-fun e!496277 () Bool)

(assert (=> mapNonEmpty!28574 (= mapRes!28574 (and tp!55024 e!496277))))

(declare-datatypes ((array!51989 0))(
  ( (array!51990 (arr!25001 (Array (_ BitVec 32) (_ BitVec 64))) (size!25447 (_ BitVec 32))) )
))
(declare-datatypes ((V!28983 0))(
  ( (V!28984 (val!9057 Int)) )
))
(declare-datatypes ((ValueCell!8525 0))(
  ( (ValueCellFull!8525 (v!11529 V!28983)) (EmptyCell!8525) )
))
(declare-datatypes ((array!51991 0))(
  ( (array!51992 (arr!25002 (Array (_ BitVec 32) ValueCell!8525)) (size!25448 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4066 0))(
  ( (LongMapFixedSize!4067 (defaultEntry!5230 Int) (mask!25692 (_ BitVec 32)) (extraKeys!4924 (_ BitVec 32)) (zeroValue!5028 V!28983) (minValue!5028 V!28983) (_size!2088 (_ BitVec 32)) (_keys!9908 array!51989) (_values!5215 array!51991) (_vacant!2088 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4066)

(declare-fun mapValue!28574 () ValueCell!8525)

(declare-fun mapKey!28574 () (_ BitVec 32))

(declare-fun mapRest!28574 () (Array (_ BitVec 32) ValueCell!8525))

(assert (=> mapNonEmpty!28574 (= (arr!25002 (_values!5215 thiss!1181)) (store mapRest!28574 mapKey!28574 mapValue!28574))))

(declare-fun b!889957 () Bool)

(declare-fun e!496274 () Bool)

(declare-datatypes ((SeekEntryResult!8794 0))(
  ( (MissingZero!8794 (index!37547 (_ BitVec 32))) (Found!8794 (index!37548 (_ BitVec 32))) (Intermediate!8794 (undefined!9606 Bool) (index!37549 (_ BitVec 32)) (x!75613 (_ BitVec 32))) (Undefined!8794) (MissingVacant!8794 (index!37550 (_ BitVec 32))) )
))
(declare-fun lt!401977 () SeekEntryResult!8794)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!889957 (= e!496274 (inRange!0 (index!37548 lt!401977) (mask!25692 thiss!1181)))))

(declare-fun b!889958 () Bool)

(declare-fun e!496275 () Bool)

(assert (=> b!889958 (= e!496275 (not true))))

(assert (=> b!889958 e!496274))

(declare-fun res!603068 () Bool)

(assert (=> b!889958 (=> res!603068 e!496274)))

(get-info :version)

(assert (=> b!889958 (= res!603068 (not ((_ is Found!8794) lt!401977)))))

(declare-datatypes ((Unit!30232 0))(
  ( (Unit!30233) )
))
(declare-fun lt!401978 () Unit!30232)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!7 (array!51989 array!51991 (_ BitVec 32) (_ BitVec 32) V!28983 V!28983 (_ BitVec 64)) Unit!30232)

(assert (=> b!889958 (= lt!401978 (lemmaSeekEntryGivesInRangeIndex!7 (_keys!9908 thiss!1181) (_values!5215 thiss!1181) (mask!25692 thiss!1181) (extraKeys!4924 thiss!1181) (zeroValue!5028 thiss!1181) (minValue!5028 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51989 (_ BitVec 32)) SeekEntryResult!8794)

(assert (=> b!889958 (= lt!401977 (seekEntry!0 key!785 (_keys!9908 thiss!1181) (mask!25692 thiss!1181)))))

(declare-fun b!889959 () Bool)

(declare-fun tp_is_empty!18013 () Bool)

(assert (=> b!889959 (= e!496277 tp_is_empty!18013)))

(declare-fun b!889960 () Bool)

(declare-fun e!496273 () Bool)

(assert (=> b!889960 (= e!496273 tp_is_empty!18013)))

(declare-fun res!603069 () Bool)

(assert (=> start!75696 (=> (not res!603069) (not e!496275))))

(declare-fun valid!1589 (LongMapFixedSize!4066) Bool)

(assert (=> start!75696 (= res!603069 (valid!1589 thiss!1181))))

(assert (=> start!75696 e!496275))

(declare-fun e!496272 () Bool)

(assert (=> start!75696 e!496272))

(assert (=> start!75696 true))

(declare-fun b!889961 () Bool)

(declare-fun e!496276 () Bool)

(assert (=> b!889961 (= e!496276 (and e!496273 mapRes!28574))))

(declare-fun condMapEmpty!28574 () Bool)

(declare-fun mapDefault!28574 () ValueCell!8525)

(assert (=> b!889961 (= condMapEmpty!28574 (= (arr!25002 (_values!5215 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8525)) mapDefault!28574)))))

(declare-fun mapIsEmpty!28574 () Bool)

(assert (=> mapIsEmpty!28574 mapRes!28574))

(declare-fun b!889962 () Bool)

(declare-fun res!603067 () Bool)

(assert (=> b!889962 (=> (not res!603067) (not e!496275))))

(assert (=> b!889962 (= res!603067 (not (= key!785 (bvneg key!785))))))

(declare-fun array_inv!19708 (array!51989) Bool)

(declare-fun array_inv!19709 (array!51991) Bool)

(assert (=> b!889963 (= e!496272 (and tp!55025 tp_is_empty!18013 (array_inv!19708 (_keys!9908 thiss!1181)) (array_inv!19709 (_values!5215 thiss!1181)) e!496276))))

(assert (= (and start!75696 res!603069) b!889962))

(assert (= (and b!889962 res!603067) b!889958))

(assert (= (and b!889958 (not res!603068)) b!889957))

(assert (= (and b!889961 condMapEmpty!28574) mapIsEmpty!28574))

(assert (= (and b!889961 (not condMapEmpty!28574)) mapNonEmpty!28574))

(assert (= (and mapNonEmpty!28574 ((_ is ValueCellFull!8525) mapValue!28574)) b!889959))

(assert (= (and b!889961 ((_ is ValueCellFull!8525) mapDefault!28574)) b!889960))

(assert (= b!889963 b!889961))

(assert (= start!75696 b!889963))

(declare-fun m!828061 () Bool)

(assert (=> b!889957 m!828061))

(declare-fun m!828063 () Bool)

(assert (=> b!889958 m!828063))

(declare-fun m!828065 () Bool)

(assert (=> b!889958 m!828065))

(declare-fun m!828067 () Bool)

(assert (=> mapNonEmpty!28574 m!828067))

(declare-fun m!828069 () Bool)

(assert (=> b!889963 m!828069))

(declare-fun m!828071 () Bool)

(assert (=> b!889963 m!828071))

(declare-fun m!828073 () Bool)

(assert (=> start!75696 m!828073))

(check-sat (not mapNonEmpty!28574) (not b_next!15685) tp_is_empty!18013 (not b!889957) (not b!889958) b_and!25899 (not b!889963) (not start!75696))
(check-sat b_and!25899 (not b_next!15685))
