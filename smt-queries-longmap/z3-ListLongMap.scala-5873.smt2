; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75936 () Bool)

(assert start!75936)

(declare-fun b!891964 () Bool)

(declare-fun b_free!15739 () Bool)

(declare-fun b_next!15739 () Bool)

(assert (=> b!891964 (= b_free!15739 (not b_next!15739))))

(declare-fun tp!55187 () Bool)

(declare-fun b_and!25989 () Bool)

(assert (=> b!891964 (= tp!55187 b_and!25989)))

(declare-fun b!891962 () Bool)

(declare-fun e!497722 () Bool)

(declare-fun tp_is_empty!18067 () Bool)

(assert (=> b!891962 (= e!497722 tp_is_empty!18067)))

(declare-fun b!891963 () Bool)

(declare-fun e!497719 () Bool)

(declare-fun e!497720 () Bool)

(assert (=> b!891963 (= e!497719 (not e!497720))))

(declare-fun res!604064 () Bool)

(assert (=> b!891963 (=> res!604064 e!497720)))

(declare-datatypes ((SeekEntryResult!8772 0))(
  ( (MissingZero!8772 (index!37459 (_ BitVec 32))) (Found!8772 (index!37460 (_ BitVec 32))) (Intermediate!8772 (undefined!9584 Bool) (index!37461 (_ BitVec 32)) (x!75682 (_ BitVec 32))) (Undefined!8772) (MissingVacant!8772 (index!37462 (_ BitVec 32))) )
))
(declare-fun lt!402887 () SeekEntryResult!8772)

(get-info :version)

(assert (=> b!891963 (= res!604064 (not ((_ is Found!8772) lt!402887)))))

(declare-fun e!497721 () Bool)

(assert (=> b!891963 e!497721))

(declare-fun res!604065 () Bool)

(assert (=> b!891963 (=> res!604065 e!497721)))

(assert (=> b!891963 (= res!604065 (not ((_ is Found!8772) lt!402887)))))

(declare-datatypes ((Unit!30314 0))(
  ( (Unit!30315) )
))
(declare-fun lt!402885 () Unit!30314)

(declare-datatypes ((array!52153 0))(
  ( (array!52154 (arr!25078 (Array (_ BitVec 32) (_ BitVec 64))) (size!25523 (_ BitVec 32))) )
))
(declare-datatypes ((V!29055 0))(
  ( (V!29056 (val!9084 Int)) )
))
(declare-datatypes ((ValueCell!8552 0))(
  ( (ValueCellFull!8552 (v!11559 V!29055)) (EmptyCell!8552) )
))
(declare-datatypes ((array!52155 0))(
  ( (array!52156 (arr!25079 (Array (_ BitVec 32) ValueCell!8552)) (size!25524 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4120 0))(
  ( (LongMapFixedSize!4121 (defaultEntry!5257 Int) (mask!25787 (_ BitVec 32)) (extraKeys!4951 (_ BitVec 32)) (zeroValue!5055 V!29055) (minValue!5055 V!29055) (_size!2115 (_ BitVec 32)) (_keys!9968 array!52153) (_values!5242 array!52155) (_vacant!2115 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4120)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!27 (array!52153 array!52155 (_ BitVec 32) (_ BitVec 32) V!29055 V!29055 (_ BitVec 64)) Unit!30314)

(assert (=> b!891963 (= lt!402885 (lemmaSeekEntryGivesInRangeIndex!27 (_keys!9968 thiss!1181) (_values!5242 thiss!1181) (mask!25787 thiss!1181) (extraKeys!4951 thiss!1181) (zeroValue!5055 thiss!1181) (minValue!5055 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52153 (_ BitVec 32)) SeekEntryResult!8772)

(assert (=> b!891963 (= lt!402887 (seekEntry!0 key!785 (_keys!9968 thiss!1181) (mask!25787 thiss!1181)))))

(declare-fun e!497723 () Bool)

(declare-fun e!497724 () Bool)

(declare-fun array_inv!19758 (array!52153) Bool)

(declare-fun array_inv!19759 (array!52155) Bool)

(assert (=> b!891964 (= e!497724 (and tp!55187 tp_is_empty!18067 (array_inv!19758 (_keys!9968 thiss!1181)) (array_inv!19759 (_values!5242 thiss!1181)) e!497723))))

(declare-fun b!891965 () Bool)

(declare-fun res!604060 () Bool)

(declare-fun e!497716 () Bool)

(assert (=> b!891965 (=> res!604060 e!497716)))

(assert (=> b!891965 (= res!604060 (or (not (= (size!25524 (_values!5242 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25787 thiss!1181)))) (not (= (size!25523 (_keys!9968 thiss!1181)) (size!25524 (_values!5242 thiss!1181)))) (bvslt (mask!25787 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4951 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4951 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891966 () Bool)

(declare-fun mapRes!28655 () Bool)

(assert (=> b!891966 (= e!497723 (and e!497722 mapRes!28655))))

(declare-fun condMapEmpty!28655 () Bool)

(declare-fun mapDefault!28655 () ValueCell!8552)

(assert (=> b!891966 (= condMapEmpty!28655 (= (arr!25079 (_values!5242 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8552)) mapDefault!28655)))))

(declare-fun b!891967 () Bool)

(declare-fun e!497718 () Bool)

(assert (=> b!891967 (= e!497718 tp_is_empty!18067)))

(declare-fun b!891968 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891968 (= e!497721 (inRange!0 (index!37460 lt!402887) (mask!25787 thiss!1181)))))

(declare-fun b!891969 () Bool)

(assert (=> b!891969 (= e!497716 true)))

(declare-fun lt!402886 () Bool)

(declare-datatypes ((List!17687 0))(
  ( (Nil!17684) (Cons!17683 (h!18820 (_ BitVec 64)) (t!24978 List!17687)) )
))
(declare-fun arrayNoDuplicates!0 (array!52153 (_ BitVec 32) List!17687) Bool)

(assert (=> b!891969 (= lt!402886 (arrayNoDuplicates!0 (_keys!9968 thiss!1181) #b00000000000000000000000000000000 Nil!17684))))

(declare-fun mapNonEmpty!28655 () Bool)

(declare-fun tp!55186 () Bool)

(assert (=> mapNonEmpty!28655 (= mapRes!28655 (and tp!55186 e!497718))))

(declare-fun mapKey!28655 () (_ BitVec 32))

(declare-fun mapRest!28655 () (Array (_ BitVec 32) ValueCell!8552))

(declare-fun mapValue!28655 () ValueCell!8552)

(assert (=> mapNonEmpty!28655 (= (arr!25079 (_values!5242 thiss!1181)) (store mapRest!28655 mapKey!28655 mapValue!28655))))

(declare-fun b!891970 () Bool)

(declare-fun res!604061 () Bool)

(assert (=> b!891970 (=> res!604061 e!497716)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52153 (_ BitVec 32)) Bool)

(assert (=> b!891970 (= res!604061 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9968 thiss!1181) (mask!25787 thiss!1181))))))

(declare-fun mapIsEmpty!28655 () Bool)

(assert (=> mapIsEmpty!28655 mapRes!28655))

(declare-fun b!891972 () Bool)

(declare-fun res!604063 () Bool)

(assert (=> b!891972 (=> (not res!604063) (not e!497719))))

(assert (=> b!891972 (= res!604063 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891971 () Bool)

(assert (=> b!891971 (= e!497720 e!497716)))

(declare-fun res!604062 () Bool)

(assert (=> b!891971 (=> res!604062 e!497716)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891971 (= res!604062 (not (validMask!0 (mask!25787 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891971 (arrayContainsKey!0 (_keys!9968 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402884 () Unit!30314)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52153 (_ BitVec 64) (_ BitVec 32)) Unit!30314)

(assert (=> b!891971 (= lt!402884 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9968 thiss!1181) key!785 (index!37460 lt!402887)))))

(declare-fun res!604066 () Bool)

(assert (=> start!75936 (=> (not res!604066) (not e!497719))))

(declare-fun valid!1609 (LongMapFixedSize!4120) Bool)

(assert (=> start!75936 (= res!604066 (valid!1609 thiss!1181))))

(assert (=> start!75936 e!497719))

(assert (=> start!75936 e!497724))

(assert (=> start!75936 true))

(assert (= (and start!75936 res!604066) b!891972))

(assert (= (and b!891972 res!604063) b!891963))

(assert (= (and b!891963 (not res!604065)) b!891968))

(assert (= (and b!891963 (not res!604064)) b!891971))

(assert (= (and b!891971 (not res!604062)) b!891965))

(assert (= (and b!891965 (not res!604060)) b!891970))

(assert (= (and b!891970 (not res!604061)) b!891969))

(assert (= (and b!891966 condMapEmpty!28655) mapIsEmpty!28655))

(assert (= (and b!891966 (not condMapEmpty!28655)) mapNonEmpty!28655))

(assert (= (and mapNonEmpty!28655 ((_ is ValueCellFull!8552) mapValue!28655)) b!891967))

(assert (= (and b!891966 ((_ is ValueCellFull!8552) mapDefault!28655)) b!891962))

(assert (= b!891964 b!891966))

(assert (= start!75936 b!891964))

(declare-fun m!830731 () Bool)

(assert (=> b!891964 m!830731))

(declare-fun m!830733 () Bool)

(assert (=> b!891964 m!830733))

(declare-fun m!830735 () Bool)

(assert (=> b!891968 m!830735))

(declare-fun m!830737 () Bool)

(assert (=> b!891971 m!830737))

(declare-fun m!830739 () Bool)

(assert (=> b!891971 m!830739))

(declare-fun m!830741 () Bool)

(assert (=> b!891971 m!830741))

(declare-fun m!830743 () Bool)

(assert (=> mapNonEmpty!28655 m!830743))

(declare-fun m!830745 () Bool)

(assert (=> b!891963 m!830745))

(declare-fun m!830747 () Bool)

(assert (=> b!891963 m!830747))

(declare-fun m!830749 () Bool)

(assert (=> b!891969 m!830749))

(declare-fun m!830751 () Bool)

(assert (=> start!75936 m!830751))

(declare-fun m!830753 () Bool)

(assert (=> b!891970 m!830753))

(check-sat (not b!891970) (not mapNonEmpty!28655) b_and!25989 tp_is_empty!18067 (not b!891964) (not b!891963) (not start!75936) (not b_next!15739) (not b!891969) (not b!891968) (not b!891971))
(check-sat b_and!25989 (not b_next!15739))
