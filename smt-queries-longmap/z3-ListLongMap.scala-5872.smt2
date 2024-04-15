; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75744 () Bool)

(assert start!75744)

(declare-fun b!890730 () Bool)

(declare-fun b_free!15733 () Bool)

(declare-fun b_next!15733 () Bool)

(assert (=> b!890730 (= b_free!15733 (not b_next!15733))))

(declare-fun tp!55169 () Bool)

(declare-fun b_and!25947 () Bool)

(assert (=> b!890730 (= tp!55169 b_and!25947)))

(declare-fun b!890721 () Bool)

(declare-fun res!603544 () Bool)

(declare-fun e!496909 () Bool)

(assert (=> b!890721 (=> res!603544 e!496909)))

(declare-datatypes ((array!52085 0))(
  ( (array!52086 (arr!25049 (Array (_ BitVec 32) (_ BitVec 64))) (size!25495 (_ BitVec 32))) )
))
(declare-datatypes ((V!29047 0))(
  ( (V!29048 (val!9081 Int)) )
))
(declare-datatypes ((ValueCell!8549 0))(
  ( (ValueCellFull!8549 (v!11553 V!29047)) (EmptyCell!8549) )
))
(declare-datatypes ((array!52087 0))(
  ( (array!52088 (arr!25050 (Array (_ BitVec 32) ValueCell!8549)) (size!25496 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4114 0))(
  ( (LongMapFixedSize!4115 (defaultEntry!5254 Int) (mask!25732 (_ BitVec 32)) (extraKeys!4948 (_ BitVec 32)) (zeroValue!5052 V!29047) (minValue!5052 V!29047) (_size!2112 (_ BitVec 32)) (_keys!9932 array!52085) (_values!5239 array!52087) (_vacant!2112 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4114)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52085 (_ BitVec 32)) Bool)

(assert (=> b!890721 (= res!603544 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9932 thiss!1181) (mask!25732 thiss!1181))))))

(declare-fun b!890722 () Bool)

(declare-fun e!496905 () Bool)

(declare-datatypes ((SeekEntryResult!8814 0))(
  ( (MissingZero!8814 (index!37627 (_ BitVec 32))) (Found!8814 (index!37628 (_ BitVec 32))) (Intermediate!8814 (undefined!9626 Bool) (index!37629 (_ BitVec 32)) (x!75697 (_ BitVec 32))) (Undefined!8814) (MissingVacant!8814 (index!37630 (_ BitVec 32))) )
))
(declare-fun lt!402254 () SeekEntryResult!8814)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890722 (= e!496905 (inRange!0 (index!37628 lt!402254) (mask!25732 thiss!1181)))))

(declare-fun b!890723 () Bool)

(declare-fun e!496911 () Bool)

(declare-fun e!496906 () Bool)

(assert (=> b!890723 (= e!496911 (not e!496906))))

(declare-fun res!603548 () Bool)

(assert (=> b!890723 (=> res!603548 e!496906)))

(get-info :version)

(assert (=> b!890723 (= res!603548 (not ((_ is Found!8814) lt!402254)))))

(assert (=> b!890723 e!496905))

(declare-fun res!603547 () Bool)

(assert (=> b!890723 (=> res!603547 e!496905)))

(assert (=> b!890723 (= res!603547 (not ((_ is Found!8814) lt!402254)))))

(declare-datatypes ((Unit!30266 0))(
  ( (Unit!30267) )
))
(declare-fun lt!402251 () Unit!30266)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!23 (array!52085 array!52087 (_ BitVec 32) (_ BitVec 32) V!29047 V!29047 (_ BitVec 64)) Unit!30266)

(assert (=> b!890723 (= lt!402251 (lemmaSeekEntryGivesInRangeIndex!23 (_keys!9932 thiss!1181) (_values!5239 thiss!1181) (mask!25732 thiss!1181) (extraKeys!4948 thiss!1181) (zeroValue!5052 thiss!1181) (minValue!5052 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52085 (_ BitVec 32)) SeekEntryResult!8814)

(assert (=> b!890723 (= lt!402254 (seekEntry!0 key!785 (_keys!9932 thiss!1181) (mask!25732 thiss!1181)))))

(declare-fun b!890724 () Bool)

(declare-fun e!496910 () Bool)

(declare-fun e!496913 () Bool)

(declare-fun mapRes!28646 () Bool)

(assert (=> b!890724 (= e!496910 (and e!496913 mapRes!28646))))

(declare-fun condMapEmpty!28646 () Bool)

(declare-fun mapDefault!28646 () ValueCell!8549)

(assert (=> b!890724 (= condMapEmpty!28646 (= (arr!25050 (_values!5239 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8549)) mapDefault!28646)))))

(declare-fun b!890725 () Bool)

(declare-fun tp_is_empty!18061 () Bool)

(assert (=> b!890725 (= e!496913 tp_is_empty!18061)))

(declare-fun b!890727 () Bool)

(declare-fun res!603546 () Bool)

(assert (=> b!890727 (=> res!603546 e!496909)))

(assert (=> b!890727 (= res!603546 (or (not (= (size!25496 (_values!5239 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25732 thiss!1181)))) (not (= (size!25495 (_keys!9932 thiss!1181)) (size!25496 (_values!5239 thiss!1181)))) (bvslt (mask!25732 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4948 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4948 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890728 () Bool)

(assert (=> b!890728 (= e!496909 true)))

(declare-fun lt!402252 () Bool)

(declare-datatypes ((List!17739 0))(
  ( (Nil!17736) (Cons!17735 (h!18866 (_ BitVec 64)) (t!25029 List!17739)) )
))
(declare-fun arrayNoDuplicates!0 (array!52085 (_ BitVec 32) List!17739) Bool)

(assert (=> b!890728 (= lt!402252 (arrayNoDuplicates!0 (_keys!9932 thiss!1181) #b00000000000000000000000000000000 Nil!17736))))

(declare-fun b!890729 () Bool)

(assert (=> b!890729 (= e!496906 e!496909)))

(declare-fun res!603543 () Bool)

(assert (=> b!890729 (=> res!603543 e!496909)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890729 (= res!603543 (not (validMask!0 (mask!25732 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890729 (arrayContainsKey!0 (_keys!9932 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402253 () Unit!30266)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52085 (_ BitVec 64) (_ BitVec 32)) Unit!30266)

(assert (=> b!890729 (= lt!402253 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9932 thiss!1181) key!785 (index!37628 lt!402254)))))

(declare-fun e!496912 () Bool)

(declare-fun array_inv!19736 (array!52085) Bool)

(declare-fun array_inv!19737 (array!52087) Bool)

(assert (=> b!890730 (= e!496912 (and tp!55169 tp_is_empty!18061 (array_inv!19736 (_keys!9932 thiss!1181)) (array_inv!19737 (_values!5239 thiss!1181)) e!496910))))

(declare-fun mapNonEmpty!28646 () Bool)

(declare-fun tp!55168 () Bool)

(declare-fun e!496907 () Bool)

(assert (=> mapNonEmpty!28646 (= mapRes!28646 (and tp!55168 e!496907))))

(declare-fun mapRest!28646 () (Array (_ BitVec 32) ValueCell!8549))

(declare-fun mapValue!28646 () ValueCell!8549)

(declare-fun mapKey!28646 () (_ BitVec 32))

(assert (=> mapNonEmpty!28646 (= (arr!25050 (_values!5239 thiss!1181)) (store mapRest!28646 mapKey!28646 mapValue!28646))))

(declare-fun res!603549 () Bool)

(assert (=> start!75744 (=> (not res!603549) (not e!496911))))

(declare-fun valid!1601 (LongMapFixedSize!4114) Bool)

(assert (=> start!75744 (= res!603549 (valid!1601 thiss!1181))))

(assert (=> start!75744 e!496911))

(assert (=> start!75744 e!496912))

(assert (=> start!75744 true))

(declare-fun b!890726 () Bool)

(assert (=> b!890726 (= e!496907 tp_is_empty!18061)))

(declare-fun b!890731 () Bool)

(declare-fun res!603545 () Bool)

(assert (=> b!890731 (=> (not res!603545) (not e!496911))))

(assert (=> b!890731 (= res!603545 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!28646 () Bool)

(assert (=> mapIsEmpty!28646 mapRes!28646))

(assert (= (and start!75744 res!603549) b!890731))

(assert (= (and b!890731 res!603545) b!890723))

(assert (= (and b!890723 (not res!603547)) b!890722))

(assert (= (and b!890723 (not res!603548)) b!890729))

(assert (= (and b!890729 (not res!603543)) b!890727))

(assert (= (and b!890727 (not res!603546)) b!890721))

(assert (= (and b!890721 (not res!603544)) b!890728))

(assert (= (and b!890724 condMapEmpty!28646) mapIsEmpty!28646))

(assert (= (and b!890724 (not condMapEmpty!28646)) mapNonEmpty!28646))

(assert (= (and mapNonEmpty!28646 ((_ is ValueCellFull!8549) mapValue!28646)) b!890726))

(assert (= (and b!890724 ((_ is ValueCellFull!8549) mapDefault!28646)) b!890725))

(assert (= b!890730 b!890724))

(assert (= start!75744 b!890730))

(declare-fun m!828607 () Bool)

(assert (=> start!75744 m!828607))

(declare-fun m!828609 () Bool)

(assert (=> b!890729 m!828609))

(declare-fun m!828611 () Bool)

(assert (=> b!890729 m!828611))

(declare-fun m!828613 () Bool)

(assert (=> b!890729 m!828613))

(declare-fun m!828615 () Bool)

(assert (=> b!890730 m!828615))

(declare-fun m!828617 () Bool)

(assert (=> b!890730 m!828617))

(declare-fun m!828619 () Bool)

(assert (=> mapNonEmpty!28646 m!828619))

(declare-fun m!828621 () Bool)

(assert (=> b!890723 m!828621))

(declare-fun m!828623 () Bool)

(assert (=> b!890723 m!828623))

(declare-fun m!828625 () Bool)

(assert (=> b!890728 m!828625))

(declare-fun m!828627 () Bool)

(assert (=> b!890722 m!828627))

(declare-fun m!828629 () Bool)

(assert (=> b!890721 m!828629))

(check-sat (not b_next!15733) (not b!890723) (not start!75744) b_and!25947 (not b!890728) (not b!890729) (not b!890721) (not b!890730) tp_is_empty!18061 (not b!890722) (not mapNonEmpty!28646))
(check-sat b_and!25947 (not b_next!15733))
