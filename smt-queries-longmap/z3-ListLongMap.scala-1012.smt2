; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21676 () Bool)

(assert start!21676)

(declare-fun b!217614 () Bool)

(declare-fun b_free!5821 () Bool)

(declare-fun b_next!5821 () Bool)

(assert (=> b!217614 (= b_free!5821 (not b_next!5821))))

(declare-fun tp!20598 () Bool)

(declare-fun b_and!12725 () Bool)

(assert (=> b!217614 (= tp!20598 b_and!12725)))

(declare-fun mapNonEmpty!9687 () Bool)

(declare-fun mapRes!9687 () Bool)

(declare-fun tp!20597 () Bool)

(declare-fun e!141556 () Bool)

(assert (=> mapNonEmpty!9687 (= mapRes!9687 (and tp!20597 e!141556))))

(declare-datatypes ((V!7225 0))(
  ( (V!7226 (val!2886 Int)) )
))
(declare-datatypes ((ValueCell!2498 0))(
  ( (ValueCellFull!2498 (v!4905 V!7225)) (EmptyCell!2498) )
))
(declare-fun mapValue!9687 () ValueCell!2498)

(declare-fun mapRest!9687 () (Array (_ BitVec 32) ValueCell!2498))

(declare-datatypes ((array!10603 0))(
  ( (array!10604 (arr!5023 (Array (_ BitVec 32) ValueCell!2498)) (size!5355 (_ BitVec 32))) )
))
(declare-datatypes ((array!10605 0))(
  ( (array!10606 (arr!5024 (Array (_ BitVec 32) (_ BitVec 64))) (size!5356 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2896 0))(
  ( (LongMapFixedSize!2897 (defaultEntry!4098 Int) (mask!9857 (_ BitVec 32)) (extraKeys!3835 (_ BitVec 32)) (zeroValue!3939 V!7225) (minValue!3939 V!7225) (_size!1497 (_ BitVec 32)) (_keys!6147 array!10605) (_values!4081 array!10603) (_vacant!1497 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2896)

(declare-fun mapKey!9687 () (_ BitVec 32))

(assert (=> mapNonEmpty!9687 (= (arr!5023 (_values!4081 thiss!1504)) (store mapRest!9687 mapKey!9687 mapValue!9687))))

(declare-fun b!217605 () Bool)

(declare-fun res!106572 () Bool)

(declare-fun e!141558 () Bool)

(assert (=> b!217605 (=> (not res!106572) (not e!141558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217605 (= res!106572 (validMask!0 (mask!9857 thiss!1504)))))

(declare-fun mapIsEmpty!9687 () Bool)

(assert (=> mapIsEmpty!9687 mapRes!9687))

(declare-fun b!217606 () Bool)

(declare-fun res!106571 () Bool)

(assert (=> b!217606 (=> (not res!106571) (not e!141558))))

(assert (=> b!217606 (= res!106571 (and (= (size!5355 (_values!4081 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9857 thiss!1504))) (= (size!5356 (_keys!6147 thiss!1504)) (size!5355 (_values!4081 thiss!1504))) (bvsge (mask!9857 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3835 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3835 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217607 () Bool)

(declare-fun res!106567 () Bool)

(assert (=> b!217607 (=> (not res!106567) (not e!141558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10605 (_ BitVec 32)) Bool)

(assert (=> b!217607 (= res!106567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6147 thiss!1504) (mask!9857 thiss!1504)))))

(declare-fun b!217608 () Bool)

(declare-fun e!141557 () Bool)

(assert (=> b!217608 (= e!141557 e!141558)))

(declare-fun res!106568 () Bool)

(assert (=> b!217608 (=> (not res!106568) (not e!141558))))

(declare-datatypes ((SeekEntryResult!750 0))(
  ( (MissingZero!750 (index!5170 (_ BitVec 32))) (Found!750 (index!5171 (_ BitVec 32))) (Intermediate!750 (undefined!1562 Bool) (index!5172 (_ BitVec 32)) (x!22734 (_ BitVec 32))) (Undefined!750) (MissingVacant!750 (index!5173 (_ BitVec 32))) )
))
(declare-fun lt!111427 () SeekEntryResult!750)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217608 (= res!106568 (or (= lt!111427 (MissingZero!750 index!297)) (= lt!111427 (MissingVacant!750 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10605 (_ BitVec 32)) SeekEntryResult!750)

(assert (=> b!217608 (= lt!111427 (seekEntryOrOpen!0 key!932 (_keys!6147 thiss!1504) (mask!9857 thiss!1504)))))

(declare-fun b!217609 () Bool)

(declare-fun res!106566 () Bool)

(assert (=> b!217609 (=> (not res!106566) (not e!141558))))

(declare-datatypes ((tuple2!4212 0))(
  ( (tuple2!4213 (_1!2117 (_ BitVec 64)) (_2!2117 V!7225)) )
))
(declare-datatypes ((List!3115 0))(
  ( (Nil!3112) (Cons!3111 (h!3758 tuple2!4212) (t!8062 List!3115)) )
))
(declare-datatypes ((ListLongMap!3127 0))(
  ( (ListLongMap!3128 (toList!1579 List!3115)) )
))
(declare-fun contains!1434 (ListLongMap!3127 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1111 (array!10605 array!10603 (_ BitVec 32) (_ BitVec 32) V!7225 V!7225 (_ BitVec 32) Int) ListLongMap!3127)

(assert (=> b!217609 (= res!106566 (not (contains!1434 (getCurrentListMap!1111 (_keys!6147 thiss!1504) (_values!4081 thiss!1504) (mask!9857 thiss!1504) (extraKeys!3835 thiss!1504) (zeroValue!3939 thiss!1504) (minValue!3939 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4098 thiss!1504)) key!932)))))

(declare-fun b!217610 () Bool)

(declare-fun res!106569 () Bool)

(assert (=> b!217610 (=> (not res!106569) (not e!141557))))

(assert (=> b!217610 (= res!106569 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217611 () Bool)

(assert (=> b!217611 (= e!141558 false)))

(declare-fun lt!111428 () Bool)

(declare-datatypes ((List!3116 0))(
  ( (Nil!3113) (Cons!3112 (h!3759 (_ BitVec 64)) (t!8063 List!3116)) )
))
(declare-fun arrayNoDuplicates!0 (array!10605 (_ BitVec 32) List!3116) Bool)

(assert (=> b!217611 (= lt!111428 (arrayNoDuplicates!0 (_keys!6147 thiss!1504) #b00000000000000000000000000000000 Nil!3113))))

(declare-fun b!217612 () Bool)

(declare-fun e!141554 () Bool)

(declare-fun tp_is_empty!5683 () Bool)

(assert (=> b!217612 (= e!141554 tp_is_empty!5683)))

(declare-fun e!141559 () Bool)

(declare-fun e!141555 () Bool)

(declare-fun array_inv!3301 (array!10605) Bool)

(declare-fun array_inv!3302 (array!10603) Bool)

(assert (=> b!217614 (= e!141559 (and tp!20598 tp_is_empty!5683 (array_inv!3301 (_keys!6147 thiss!1504)) (array_inv!3302 (_values!4081 thiss!1504)) e!141555))))

(declare-fun b!217615 () Bool)

(assert (=> b!217615 (= e!141556 tp_is_empty!5683)))

(declare-fun b!217613 () Bool)

(assert (=> b!217613 (= e!141555 (and e!141554 mapRes!9687))))

(declare-fun condMapEmpty!9687 () Bool)

(declare-fun mapDefault!9687 () ValueCell!2498)

(assert (=> b!217613 (= condMapEmpty!9687 (= (arr!5023 (_values!4081 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2498)) mapDefault!9687)))))

(declare-fun res!106570 () Bool)

(assert (=> start!21676 (=> (not res!106570) (not e!141557))))

(declare-fun valid!1190 (LongMapFixedSize!2896) Bool)

(assert (=> start!21676 (= res!106570 (valid!1190 thiss!1504))))

(assert (=> start!21676 e!141557))

(assert (=> start!21676 e!141559))

(assert (=> start!21676 true))

(assert (= (and start!21676 res!106570) b!217610))

(assert (= (and b!217610 res!106569) b!217608))

(assert (= (and b!217608 res!106568) b!217609))

(assert (= (and b!217609 res!106566) b!217605))

(assert (= (and b!217605 res!106572) b!217606))

(assert (= (and b!217606 res!106571) b!217607))

(assert (= (and b!217607 res!106567) b!217611))

(assert (= (and b!217613 condMapEmpty!9687) mapIsEmpty!9687))

(assert (= (and b!217613 (not condMapEmpty!9687)) mapNonEmpty!9687))

(get-info :version)

(assert (= (and mapNonEmpty!9687 ((_ is ValueCellFull!2498) mapValue!9687)) b!217615))

(assert (= (and b!217613 ((_ is ValueCellFull!2498) mapDefault!9687)) b!217612))

(assert (= b!217614 b!217613))

(assert (= start!21676 b!217614))

(declare-fun m!244011 () Bool)

(assert (=> b!217608 m!244011))

(declare-fun m!244013 () Bool)

(assert (=> b!217614 m!244013))

(declare-fun m!244015 () Bool)

(assert (=> b!217614 m!244015))

(declare-fun m!244017 () Bool)

(assert (=> b!217607 m!244017))

(declare-fun m!244019 () Bool)

(assert (=> mapNonEmpty!9687 m!244019))

(declare-fun m!244021 () Bool)

(assert (=> start!21676 m!244021))

(declare-fun m!244023 () Bool)

(assert (=> b!217609 m!244023))

(assert (=> b!217609 m!244023))

(declare-fun m!244025 () Bool)

(assert (=> b!217609 m!244025))

(declare-fun m!244027 () Bool)

(assert (=> b!217605 m!244027))

(declare-fun m!244029 () Bool)

(assert (=> b!217611 m!244029))

(check-sat (not b!217609) (not start!21676) (not b!217605) (not mapNonEmpty!9687) (not b!217611) (not b!217608) tp_is_empty!5683 (not b!217614) b_and!12725 (not b!217607) (not b_next!5821))
(check-sat b_and!12725 (not b_next!5821))
