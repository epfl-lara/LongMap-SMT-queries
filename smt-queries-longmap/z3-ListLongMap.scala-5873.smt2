; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75750 () Bool)

(assert start!75750)

(declare-fun b!890829 () Bool)

(declare-fun b_free!15739 () Bool)

(declare-fun b_next!15739 () Bool)

(assert (=> b!890829 (= b_free!15739 (not b_next!15739))))

(declare-fun tp!55186 () Bool)

(declare-fun b_and!25953 () Bool)

(assert (=> b!890829 (= tp!55186 b_and!25953)))

(declare-fun b!890820 () Bool)

(declare-fun res!603610 () Bool)

(declare-fun e!496993 () Bool)

(assert (=> b!890820 (=> (not res!603610) (not e!496993))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890820 (= res!603610 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890821 () Bool)

(declare-fun res!603607 () Bool)

(declare-fun e!496986 () Bool)

(assert (=> b!890821 (=> res!603607 e!496986)))

(declare-datatypes ((array!52097 0))(
  ( (array!52098 (arr!25055 (Array (_ BitVec 32) (_ BitVec 64))) (size!25501 (_ BitVec 32))) )
))
(declare-datatypes ((V!29055 0))(
  ( (V!29056 (val!9084 Int)) )
))
(declare-datatypes ((ValueCell!8552 0))(
  ( (ValueCellFull!8552 (v!11556 V!29055)) (EmptyCell!8552) )
))
(declare-datatypes ((array!52099 0))(
  ( (array!52100 (arr!25056 (Array (_ BitVec 32) ValueCell!8552)) (size!25502 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4120 0))(
  ( (LongMapFixedSize!4121 (defaultEntry!5257 Int) (mask!25737 (_ BitVec 32)) (extraKeys!4951 (_ BitVec 32)) (zeroValue!5055 V!29055) (minValue!5055 V!29055) (_size!2115 (_ BitVec 32)) (_keys!9935 array!52097) (_values!5242 array!52099) (_vacant!2115 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4120)

(assert (=> b!890821 (= res!603607 (or (not (= (size!25502 (_values!5242 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25737 thiss!1181)))) (not (= (size!25501 (_keys!9935 thiss!1181)) (size!25502 (_values!5242 thiss!1181)))) (bvslt (mask!25737 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4951 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4951 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890822 () Bool)

(declare-fun res!603606 () Bool)

(assert (=> b!890822 (=> res!603606 e!496986)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52097 (_ BitVec 32)) Bool)

(assert (=> b!890822 (= res!603606 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9935 thiss!1181) (mask!25737 thiss!1181))))))

(declare-fun b!890823 () Bool)

(declare-fun e!496991 () Bool)

(declare-fun tp_is_empty!18067 () Bool)

(assert (=> b!890823 (= e!496991 tp_is_empty!18067)))

(declare-fun b!890824 () Bool)

(declare-fun e!496990 () Bool)

(assert (=> b!890824 (= e!496993 (not e!496990))))

(declare-fun res!603609 () Bool)

(assert (=> b!890824 (=> res!603609 e!496990)))

(declare-datatypes ((SeekEntryResult!8817 0))(
  ( (MissingZero!8817 (index!37639 (_ BitVec 32))) (Found!8817 (index!37640 (_ BitVec 32))) (Intermediate!8817 (undefined!9629 Bool) (index!37641 (_ BitVec 32)) (x!75708 (_ BitVec 32))) (Undefined!8817) (MissingVacant!8817 (index!37642 (_ BitVec 32))) )
))
(declare-fun lt!402287 () SeekEntryResult!8817)

(get-info :version)

(assert (=> b!890824 (= res!603609 (not ((_ is Found!8817) lt!402287)))))

(declare-fun e!496988 () Bool)

(assert (=> b!890824 e!496988))

(declare-fun res!603611 () Bool)

(assert (=> b!890824 (=> res!603611 e!496988)))

(assert (=> b!890824 (= res!603611 (not ((_ is Found!8817) lt!402287)))))

(declare-datatypes ((Unit!30270 0))(
  ( (Unit!30271) )
))
(declare-fun lt!402288 () Unit!30270)

(declare-fun lemmaSeekEntryGivesInRangeIndex!25 (array!52097 array!52099 (_ BitVec 32) (_ BitVec 32) V!29055 V!29055 (_ BitVec 64)) Unit!30270)

(assert (=> b!890824 (= lt!402288 (lemmaSeekEntryGivesInRangeIndex!25 (_keys!9935 thiss!1181) (_values!5242 thiss!1181) (mask!25737 thiss!1181) (extraKeys!4951 thiss!1181) (zeroValue!5055 thiss!1181) (minValue!5055 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52097 (_ BitVec 32)) SeekEntryResult!8817)

(assert (=> b!890824 (= lt!402287 (seekEntry!0 key!785 (_keys!9935 thiss!1181) (mask!25737 thiss!1181)))))

(declare-fun b!890826 () Bool)

(assert (=> b!890826 (= e!496990 e!496986)))

(declare-fun res!603608 () Bool)

(assert (=> b!890826 (=> res!603608 e!496986)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890826 (= res!603608 (not (validMask!0 (mask!25737 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890826 (arrayContainsKey!0 (_keys!9935 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402290 () Unit!30270)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52097 (_ BitVec 64) (_ BitVec 32)) Unit!30270)

(assert (=> b!890826 (= lt!402290 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9935 thiss!1181) key!785 (index!37640 lt!402287)))))

(declare-fun b!890827 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890827 (= e!496988 (inRange!0 (index!37640 lt!402287) (mask!25737 thiss!1181)))))

(declare-fun mapIsEmpty!28655 () Bool)

(declare-fun mapRes!28655 () Bool)

(assert (=> mapIsEmpty!28655 mapRes!28655))

(declare-fun mapNonEmpty!28655 () Bool)

(declare-fun tp!55187 () Bool)

(assert (=> mapNonEmpty!28655 (= mapRes!28655 (and tp!55187 e!496991))))

(declare-fun mapValue!28655 () ValueCell!8552)

(declare-fun mapKey!28655 () (_ BitVec 32))

(declare-fun mapRest!28655 () (Array (_ BitVec 32) ValueCell!8552))

(assert (=> mapNonEmpty!28655 (= (arr!25056 (_values!5242 thiss!1181)) (store mapRest!28655 mapKey!28655 mapValue!28655))))

(declare-fun b!890828 () Bool)

(assert (=> b!890828 (= e!496986 true)))

(declare-fun lt!402289 () Bool)

(declare-datatypes ((List!17741 0))(
  ( (Nil!17738) (Cons!17737 (h!18868 (_ BitVec 64)) (t!25031 List!17741)) )
))
(declare-fun arrayNoDuplicates!0 (array!52097 (_ BitVec 32) List!17741) Bool)

(assert (=> b!890828 (= lt!402289 (arrayNoDuplicates!0 (_keys!9935 thiss!1181) #b00000000000000000000000000000000 Nil!17738))))

(declare-fun b!890825 () Bool)

(declare-fun e!496989 () Bool)

(declare-fun e!496992 () Bool)

(assert (=> b!890825 (= e!496989 (and e!496992 mapRes!28655))))

(declare-fun condMapEmpty!28655 () Bool)

(declare-fun mapDefault!28655 () ValueCell!8552)

(assert (=> b!890825 (= condMapEmpty!28655 (= (arr!25056 (_values!5242 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8552)) mapDefault!28655)))))

(declare-fun res!603612 () Bool)

(assert (=> start!75750 (=> (not res!603612) (not e!496993))))

(declare-fun valid!1604 (LongMapFixedSize!4120) Bool)

(assert (=> start!75750 (= res!603612 (valid!1604 thiss!1181))))

(assert (=> start!75750 e!496993))

(declare-fun e!496994 () Bool)

(assert (=> start!75750 e!496994))

(assert (=> start!75750 true))

(declare-fun array_inv!19740 (array!52097) Bool)

(declare-fun array_inv!19741 (array!52099) Bool)

(assert (=> b!890829 (= e!496994 (and tp!55186 tp_is_empty!18067 (array_inv!19740 (_keys!9935 thiss!1181)) (array_inv!19741 (_values!5242 thiss!1181)) e!496989))))

(declare-fun b!890830 () Bool)

(assert (=> b!890830 (= e!496992 tp_is_empty!18067)))

(assert (= (and start!75750 res!603612) b!890820))

(assert (= (and b!890820 res!603610) b!890824))

(assert (= (and b!890824 (not res!603611)) b!890827))

(assert (= (and b!890824 (not res!603609)) b!890826))

(assert (= (and b!890826 (not res!603608)) b!890821))

(assert (= (and b!890821 (not res!603607)) b!890822))

(assert (= (and b!890822 (not res!603606)) b!890828))

(assert (= (and b!890825 condMapEmpty!28655) mapIsEmpty!28655))

(assert (= (and b!890825 (not condMapEmpty!28655)) mapNonEmpty!28655))

(assert (= (and mapNonEmpty!28655 ((_ is ValueCellFull!8552) mapValue!28655)) b!890823))

(assert (= (and b!890825 ((_ is ValueCellFull!8552) mapDefault!28655)) b!890830))

(assert (= b!890829 b!890825))

(assert (= start!75750 b!890829))

(declare-fun m!828679 () Bool)

(assert (=> b!890828 m!828679))

(declare-fun m!828681 () Bool)

(assert (=> start!75750 m!828681))

(declare-fun m!828683 () Bool)

(assert (=> b!890827 m!828683))

(declare-fun m!828685 () Bool)

(assert (=> b!890829 m!828685))

(declare-fun m!828687 () Bool)

(assert (=> b!890829 m!828687))

(declare-fun m!828689 () Bool)

(assert (=> mapNonEmpty!28655 m!828689))

(declare-fun m!828691 () Bool)

(assert (=> b!890826 m!828691))

(declare-fun m!828693 () Bool)

(assert (=> b!890826 m!828693))

(declare-fun m!828695 () Bool)

(assert (=> b!890826 m!828695))

(declare-fun m!828697 () Bool)

(assert (=> b!890822 m!828697))

(declare-fun m!828699 () Bool)

(assert (=> b!890824 m!828699))

(declare-fun m!828701 () Bool)

(assert (=> b!890824 m!828701))

(check-sat (not b!890827) (not b_next!15739) (not start!75750) (not b!890822) (not mapNonEmpty!28655) (not b!890829) (not b!890828) b_and!25953 tp_is_empty!18067 (not b!890824) (not b!890826))
(check-sat b_and!25953 (not b_next!15739))
