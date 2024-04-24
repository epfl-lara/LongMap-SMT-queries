; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75840 () Bool)

(assert start!75840)

(declare-fun b!890597 () Bool)

(declare-fun b_free!15643 () Bool)

(declare-fun b_next!15643 () Bool)

(assert (=> b!890597 (= b_free!15643 (not b_next!15643))))

(declare-fun tp!54898 () Bool)

(declare-fun b_and!25893 () Bool)

(assert (=> b!890597 (= tp!54898 b_and!25893)))

(declare-fun b!890590 () Bool)

(declare-fun e!496566 () Bool)

(declare-fun e!496562 () Bool)

(declare-fun mapRes!28511 () Bool)

(assert (=> b!890590 (= e!496566 (and e!496562 mapRes!28511))))

(declare-fun condMapEmpty!28511 () Bool)

(declare-datatypes ((array!51961 0))(
  ( (array!51962 (arr!24982 (Array (_ BitVec 32) (_ BitVec 64))) (size!25427 (_ BitVec 32))) )
))
(declare-datatypes ((V!28927 0))(
  ( (V!28928 (val!9036 Int)) )
))
(declare-datatypes ((ValueCell!8504 0))(
  ( (ValueCellFull!8504 (v!11511 V!28927)) (EmptyCell!8504) )
))
(declare-datatypes ((array!51963 0))(
  ( (array!51964 (arr!24983 (Array (_ BitVec 32) ValueCell!8504)) (size!25428 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4024 0))(
  ( (LongMapFixedSize!4025 (defaultEntry!5209 Int) (mask!25707 (_ BitVec 32)) (extraKeys!4903 (_ BitVec 32)) (zeroValue!5007 V!28927) (minValue!5007 V!28927) (_size!2067 (_ BitVec 32)) (_keys!9920 array!51961) (_values!5194 array!51963) (_vacant!2067 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4024)

(declare-fun mapDefault!28511 () ValueCell!8504)

(assert (=> b!890590 (= condMapEmpty!28511 (= (arr!24983 (_values!5194 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8504)) mapDefault!28511)))))

(declare-fun b!890591 () Bool)

(declare-fun e!496561 () Bool)

(declare-fun tp_is_empty!17971 () Bool)

(assert (=> b!890591 (= e!496561 tp_is_empty!17971)))

(declare-fun b!890592 () Bool)

(declare-fun res!603265 () Bool)

(declare-fun e!496560 () Bool)

(assert (=> b!890592 (=> (not res!603265) (not e!496560))))

(assert (=> b!890592 (= res!603265 (and (= (size!25428 (_values!5194 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25707 thiss!1181))) (= (size!25427 (_keys!9920 thiss!1181)) (size!25428 (_values!5194 thiss!1181))) (bvsge (mask!25707 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4903 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4903 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890593 () Bool)

(assert (=> b!890593 (= e!496560 false)))

(declare-fun lt!402449 () Bool)

(declare-datatypes ((List!17663 0))(
  ( (Nil!17660) (Cons!17659 (h!18796 (_ BitVec 64)) (t!24954 List!17663)) )
))
(declare-fun arrayNoDuplicates!0 (array!51961 (_ BitVec 32) List!17663) Bool)

(assert (=> b!890593 (= lt!402449 (arrayNoDuplicates!0 (_keys!9920 thiss!1181) #b00000000000000000000000000000000 Nil!17660))))

(declare-fun b!890594 () Bool)

(declare-fun res!603268 () Bool)

(assert (=> b!890594 (=> (not res!603268) (not e!496560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51961 (_ BitVec 32)) Bool)

(assert (=> b!890594 (= res!603268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9920 thiss!1181) (mask!25707 thiss!1181)))))

(declare-fun b!890595 () Bool)

(assert (=> b!890595 (= e!496562 tp_is_empty!17971)))

(declare-fun b!890596 () Bool)

(declare-fun res!603266 () Bool)

(declare-fun e!496563 () Bool)

(assert (=> b!890596 (=> (not res!603266) (not e!496563))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890596 (= res!603266 (not (= key!785 (bvneg key!785))))))

(declare-fun e!496564 () Bool)

(declare-fun array_inv!19694 (array!51961) Bool)

(declare-fun array_inv!19695 (array!51963) Bool)

(assert (=> b!890597 (= e!496564 (and tp!54898 tp_is_empty!17971 (array_inv!19694 (_keys!9920 thiss!1181)) (array_inv!19695 (_values!5194 thiss!1181)) e!496566))))

(declare-fun b!890598 () Bool)

(assert (=> b!890598 (= e!496563 e!496560)))

(declare-fun res!603267 () Bool)

(assert (=> b!890598 (=> (not res!603267) (not e!496560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890598 (= res!603267 (validMask!0 (mask!25707 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8735 0))(
  ( (MissingZero!8735 (index!37311 (_ BitVec 32))) (Found!8735 (index!37312 (_ BitVec 32))) (Intermediate!8735 (undefined!9547 Bool) (index!37313 (_ BitVec 32)) (x!75517 (_ BitVec 32))) (Undefined!8735) (MissingVacant!8735 (index!37314 (_ BitVec 32))) )
))
(declare-fun lt!402448 () SeekEntryResult!8735)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51961 (_ BitVec 32)) SeekEntryResult!8735)

(assert (=> b!890598 (= lt!402448 (seekEntry!0 key!785 (_keys!9920 thiss!1181) (mask!25707 thiss!1181)))))

(declare-fun mapIsEmpty!28511 () Bool)

(assert (=> mapIsEmpty!28511 mapRes!28511))

(declare-fun res!603264 () Bool)

(assert (=> start!75840 (=> (not res!603264) (not e!496563))))

(declare-fun valid!1580 (LongMapFixedSize!4024) Bool)

(assert (=> start!75840 (= res!603264 (valid!1580 thiss!1181))))

(assert (=> start!75840 e!496563))

(assert (=> start!75840 e!496564))

(assert (=> start!75840 true))

(declare-fun mapNonEmpty!28511 () Bool)

(declare-fun tp!54899 () Bool)

(assert (=> mapNonEmpty!28511 (= mapRes!28511 (and tp!54899 e!496561))))

(declare-fun mapKey!28511 () (_ BitVec 32))

(declare-fun mapRest!28511 () (Array (_ BitVec 32) ValueCell!8504))

(declare-fun mapValue!28511 () ValueCell!8504)

(assert (=> mapNonEmpty!28511 (= (arr!24983 (_values!5194 thiss!1181)) (store mapRest!28511 mapKey!28511 mapValue!28511))))

(assert (= (and start!75840 res!603264) b!890596))

(assert (= (and b!890596 res!603266) b!890598))

(assert (= (and b!890598 res!603267) b!890592))

(assert (= (and b!890592 res!603265) b!890594))

(assert (= (and b!890594 res!603268) b!890593))

(assert (= (and b!890590 condMapEmpty!28511) mapIsEmpty!28511))

(assert (= (and b!890590 (not condMapEmpty!28511)) mapNonEmpty!28511))

(get-info :version)

(assert (= (and mapNonEmpty!28511 ((_ is ValueCellFull!8504) mapValue!28511)) b!890591))

(assert (= (and b!890590 ((_ is ValueCellFull!8504) mapDefault!28511)) b!890595))

(assert (= b!890597 b!890590))

(assert (= start!75840 b!890597))

(declare-fun m!829795 () Bool)

(assert (=> b!890594 m!829795))

(declare-fun m!829797 () Bool)

(assert (=> start!75840 m!829797))

(declare-fun m!829799 () Bool)

(assert (=> b!890598 m!829799))

(declare-fun m!829801 () Bool)

(assert (=> b!890598 m!829801))

(declare-fun m!829803 () Bool)

(assert (=> b!890597 m!829803))

(declare-fun m!829805 () Bool)

(assert (=> b!890597 m!829805))

(declare-fun m!829807 () Bool)

(assert (=> mapNonEmpty!28511 m!829807))

(declare-fun m!829809 () Bool)

(assert (=> b!890593 m!829809))

(check-sat (not b!890598) (not b!890593) (not b!890597) (not b!890594) (not mapNonEmpty!28511) tp_is_empty!17971 b_and!25893 (not start!75840) (not b_next!15643))
(check-sat b_and!25893 (not b_next!15643))
