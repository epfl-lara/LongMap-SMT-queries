; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16306 () Bool)

(assert start!16306)

(declare-fun b!162727 () Bool)

(declare-fun b_free!3763 () Bool)

(declare-fun b_next!3763 () Bool)

(assert (=> b!162727 (= b_free!3763 (not b_next!3763))))

(declare-fun tp!13859 () Bool)

(declare-fun b_and!10191 () Bool)

(assert (=> b!162727 (= tp!13859 b_and!10191)))

(declare-fun b!162726 () Bool)

(declare-fun res!77064 () Bool)

(declare-fun e!106706 () Bool)

(assert (=> b!162726 (=> (not res!77064) (not e!106706))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162726 (= res!77064 (not (= key!828 (bvneg key!828))))))

(declare-fun e!106701 () Bool)

(declare-datatypes ((V!4401 0))(
  ( (V!4402 (val!1827 Int)) )
))
(declare-datatypes ((ValueCell!1439 0))(
  ( (ValueCellFull!1439 (v!3693 V!4401)) (EmptyCell!1439) )
))
(declare-datatypes ((array!6195 0))(
  ( (array!6196 (arr!2942 (Array (_ BitVec 32) (_ BitVec 64))) (size!3226 (_ BitVec 32))) )
))
(declare-datatypes ((array!6197 0))(
  ( (array!6198 (arr!2943 (Array (_ BitVec 32) ValueCell!1439)) (size!3227 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1786 0))(
  ( (LongMapFixedSize!1787 (defaultEntry!3335 Int) (mask!7965 (_ BitVec 32)) (extraKeys!3076 (_ BitVec 32)) (zeroValue!3178 V!4401) (minValue!3178 V!4401) (_size!942 (_ BitVec 32)) (_keys!5136 array!6195) (_values!3318 array!6197) (_vacant!942 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1786)

(declare-fun tp_is_empty!3565 () Bool)

(declare-fun e!106703 () Bool)

(declare-fun array_inv!1889 (array!6195) Bool)

(declare-fun array_inv!1890 (array!6197) Bool)

(assert (=> b!162727 (= e!106701 (and tp!13859 tp_is_empty!3565 (array_inv!1889 (_keys!5136 thiss!1248)) (array_inv!1890 (_values!3318 thiss!1248)) e!106703))))

(declare-fun b!162728 () Bool)

(declare-fun e!106702 () Bool)

(declare-fun mapRes!6035 () Bool)

(assert (=> b!162728 (= e!106703 (and e!106702 mapRes!6035))))

(declare-fun condMapEmpty!6035 () Bool)

(declare-fun mapDefault!6035 () ValueCell!1439)

(assert (=> b!162728 (= condMapEmpty!6035 (= (arr!2943 (_values!3318 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1439)) mapDefault!6035)))))

(declare-fun b!162729 () Bool)

(declare-fun e!106707 () Bool)

(assert (=> b!162729 (= e!106707 tp_is_empty!3565)))

(declare-fun b!162730 () Bool)

(declare-fun e!106705 () Bool)

(assert (=> b!162730 (= e!106706 e!106705)))

(declare-fun res!77065 () Bool)

(assert (=> b!162730 (=> (not res!77065) (not e!106705))))

(declare-datatypes ((SeekEntryResult!390 0))(
  ( (MissingZero!390 (index!3728 (_ BitVec 32))) (Found!390 (index!3729 (_ BitVec 32))) (Intermediate!390 (undefined!1202 Bool) (index!3730 (_ BitVec 32)) (x!18006 (_ BitVec 32))) (Undefined!390) (MissingVacant!390 (index!3731 (_ BitVec 32))) )
))
(declare-fun lt!82580 () SeekEntryResult!390)

(get-info :version)

(assert (=> b!162730 (= res!77065 (and (not ((_ is Undefined!390) lt!82580)) (not ((_ is MissingVacant!390) lt!82580)) ((_ is MissingZero!390) lt!82580)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6195 (_ BitVec 32)) SeekEntryResult!390)

(assert (=> b!162730 (= lt!82580 (seekEntryOrOpen!0 key!828 (_keys!5136 thiss!1248) (mask!7965 thiss!1248)))))

(declare-fun b!162731 () Bool)

(assert (=> b!162731 (= e!106705 false)))

(declare-fun lt!82581 () Bool)

(declare-fun v!309 () V!4401)

(declare-fun valid!826 (LongMapFixedSize!1786) Bool)

(declare-datatypes ((tuple2!2970 0))(
  ( (tuple2!2971 (_1!1496 Bool) (_2!1496 LongMapFixedSize!1786)) )
))
(declare-fun updateHelperNewKey!89 (LongMapFixedSize!1786 (_ BitVec 64) V!4401 (_ BitVec 32)) tuple2!2970)

(assert (=> b!162731 (= lt!82581 (valid!826 (_2!1496 (updateHelperNewKey!89 thiss!1248 key!828 v!309 (index!3728 lt!82580)))))))

(declare-fun b!162732 () Bool)

(assert (=> b!162732 (= e!106702 tp_is_empty!3565)))

(declare-fun res!77066 () Bool)

(assert (=> start!16306 (=> (not res!77066) (not e!106706))))

(assert (=> start!16306 (= res!77066 (valid!826 thiss!1248))))

(assert (=> start!16306 e!106706))

(assert (=> start!16306 e!106701))

(assert (=> start!16306 true))

(assert (=> start!16306 tp_is_empty!3565))

(declare-fun mapIsEmpty!6035 () Bool)

(assert (=> mapIsEmpty!6035 mapRes!6035))

(declare-fun mapNonEmpty!6035 () Bool)

(declare-fun tp!13858 () Bool)

(assert (=> mapNonEmpty!6035 (= mapRes!6035 (and tp!13858 e!106707))))

(declare-fun mapRest!6035 () (Array (_ BitVec 32) ValueCell!1439))

(declare-fun mapKey!6035 () (_ BitVec 32))

(declare-fun mapValue!6035 () ValueCell!1439)

(assert (=> mapNonEmpty!6035 (= (arr!2943 (_values!3318 thiss!1248)) (store mapRest!6035 mapKey!6035 mapValue!6035))))

(assert (= (and start!16306 res!77066) b!162726))

(assert (= (and b!162726 res!77064) b!162730))

(assert (= (and b!162730 res!77065) b!162731))

(assert (= (and b!162728 condMapEmpty!6035) mapIsEmpty!6035))

(assert (= (and b!162728 (not condMapEmpty!6035)) mapNonEmpty!6035))

(assert (= (and mapNonEmpty!6035 ((_ is ValueCellFull!1439) mapValue!6035)) b!162729))

(assert (= (and b!162728 ((_ is ValueCellFull!1439) mapDefault!6035)) b!162732))

(assert (= b!162727 b!162728))

(assert (= start!16306 b!162727))

(declare-fun m!193895 () Bool)

(assert (=> b!162730 m!193895))

(declare-fun m!193897 () Bool)

(assert (=> start!16306 m!193897))

(declare-fun m!193899 () Bool)

(assert (=> mapNonEmpty!6035 m!193899))

(declare-fun m!193901 () Bool)

(assert (=> b!162727 m!193901))

(declare-fun m!193903 () Bool)

(assert (=> b!162727 m!193903))

(declare-fun m!193905 () Bool)

(assert (=> b!162731 m!193905))

(declare-fun m!193907 () Bool)

(assert (=> b!162731 m!193907))

(check-sat (not b_next!3763) (not b!162730) tp_is_empty!3565 (not start!16306) (not b!162727) (not b!162731) b_and!10191 (not mapNonEmpty!6035))
(check-sat b_and!10191 (not b_next!3763))
