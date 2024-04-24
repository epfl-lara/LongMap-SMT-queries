; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75834 () Bool)

(assert start!75834)

(declare-fun b!890513 () Bool)

(declare-fun b_free!15637 () Bool)

(declare-fun b_next!15637 () Bool)

(assert (=> b!890513 (= b_free!15637 (not b_next!15637))))

(declare-fun tp!54880 () Bool)

(declare-fun b_and!25887 () Bool)

(assert (=> b!890513 (= tp!54880 b_and!25887)))

(declare-fun b!890509 () Bool)

(declare-fun res!603223 () Bool)

(declare-fun e!496497 () Bool)

(assert (=> b!890509 (=> (not res!603223) (not e!496497))))

(declare-datatypes ((array!51949 0))(
  ( (array!51950 (arr!24976 (Array (_ BitVec 32) (_ BitVec 64))) (size!25421 (_ BitVec 32))) )
))
(declare-datatypes ((V!28919 0))(
  ( (V!28920 (val!9033 Int)) )
))
(declare-datatypes ((ValueCell!8501 0))(
  ( (ValueCellFull!8501 (v!11508 V!28919)) (EmptyCell!8501) )
))
(declare-datatypes ((array!51951 0))(
  ( (array!51952 (arr!24977 (Array (_ BitVec 32) ValueCell!8501)) (size!25422 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4018 0))(
  ( (LongMapFixedSize!4019 (defaultEntry!5206 Int) (mask!25702 (_ BitVec 32)) (extraKeys!4900 (_ BitVec 32)) (zeroValue!5004 V!28919) (minValue!5004 V!28919) (_size!2064 (_ BitVec 32)) (_keys!9917 array!51949) (_values!5191 array!51951) (_vacant!2064 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4018)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51949 (_ BitVec 32)) Bool)

(assert (=> b!890509 (= res!603223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9917 thiss!1181) (mask!25702 thiss!1181)))))

(declare-fun b!890510 () Bool)

(declare-fun res!603221 () Bool)

(assert (=> b!890510 (=> (not res!603221) (not e!496497))))

(assert (=> b!890510 (= res!603221 (and (= (size!25422 (_values!5191 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25702 thiss!1181))) (= (size!25421 (_keys!9917 thiss!1181)) (size!25422 (_values!5191 thiss!1181))) (bvsge (mask!25702 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4900 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4900 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890511 () Bool)

(declare-fun e!496499 () Bool)

(assert (=> b!890511 (= e!496499 e!496497)))

(declare-fun res!603220 () Bool)

(assert (=> b!890511 (=> (not res!603220) (not e!496497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890511 (= res!603220 (validMask!0 (mask!25702 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8732 0))(
  ( (MissingZero!8732 (index!37299 (_ BitVec 32))) (Found!8732 (index!37300 (_ BitVec 32))) (Intermediate!8732 (undefined!9544 Bool) (index!37301 (_ BitVec 32)) (x!75506 (_ BitVec 32))) (Undefined!8732) (MissingVacant!8732 (index!37302 (_ BitVec 32))) )
))
(declare-fun lt!402430 () SeekEntryResult!8732)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51949 (_ BitVec 32)) SeekEntryResult!8732)

(assert (=> b!890511 (= lt!402430 (seekEntry!0 key!785 (_keys!9917 thiss!1181) (mask!25702 thiss!1181)))))

(declare-fun b!890512 () Bool)

(declare-fun res!603219 () Bool)

(assert (=> b!890512 (=> (not res!603219) (not e!496499))))

(assert (=> b!890512 (= res!603219 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!28502 () Bool)

(declare-fun mapRes!28502 () Bool)

(declare-fun tp!54881 () Bool)

(declare-fun e!496498 () Bool)

(assert (=> mapNonEmpty!28502 (= mapRes!28502 (and tp!54881 e!496498))))

(declare-fun mapKey!28502 () (_ BitVec 32))

(declare-fun mapValue!28502 () ValueCell!8501)

(declare-fun mapRest!28502 () (Array (_ BitVec 32) ValueCell!8501))

(assert (=> mapNonEmpty!28502 (= (arr!24977 (_values!5191 thiss!1181)) (store mapRest!28502 mapKey!28502 mapValue!28502))))

(declare-fun tp_is_empty!17965 () Bool)

(declare-fun e!496501 () Bool)

(declare-fun e!496503 () Bool)

(declare-fun array_inv!19688 (array!51949) Bool)

(declare-fun array_inv!19689 (array!51951) Bool)

(assert (=> b!890513 (= e!496503 (and tp!54880 tp_is_empty!17965 (array_inv!19688 (_keys!9917 thiss!1181)) (array_inv!19689 (_values!5191 thiss!1181)) e!496501))))

(declare-fun b!890514 () Bool)

(assert (=> b!890514 (= e!496497 false)))

(declare-fun lt!402431 () Bool)

(declare-datatypes ((List!17661 0))(
  ( (Nil!17658) (Cons!17657 (h!18794 (_ BitVec 64)) (t!24952 List!17661)) )
))
(declare-fun arrayNoDuplicates!0 (array!51949 (_ BitVec 32) List!17661) Bool)

(assert (=> b!890514 (= lt!402431 (arrayNoDuplicates!0 (_keys!9917 thiss!1181) #b00000000000000000000000000000000 Nil!17658))))

(declare-fun b!890515 () Bool)

(assert (=> b!890515 (= e!496498 tp_is_empty!17965)))

(declare-fun b!890516 () Bool)

(declare-fun e!496500 () Bool)

(assert (=> b!890516 (= e!496501 (and e!496500 mapRes!28502))))

(declare-fun condMapEmpty!28502 () Bool)

(declare-fun mapDefault!28502 () ValueCell!8501)

(assert (=> b!890516 (= condMapEmpty!28502 (= (arr!24977 (_values!5191 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8501)) mapDefault!28502)))))

(declare-fun b!890517 () Bool)

(assert (=> b!890517 (= e!496500 tp_is_empty!17965)))

(declare-fun mapIsEmpty!28502 () Bool)

(assert (=> mapIsEmpty!28502 mapRes!28502))

(declare-fun res!603222 () Bool)

(assert (=> start!75834 (=> (not res!603222) (not e!496499))))

(declare-fun valid!1577 (LongMapFixedSize!4018) Bool)

(assert (=> start!75834 (= res!603222 (valid!1577 thiss!1181))))

(assert (=> start!75834 e!496499))

(assert (=> start!75834 e!496503))

(assert (=> start!75834 true))

(assert (= (and start!75834 res!603222) b!890512))

(assert (= (and b!890512 res!603219) b!890511))

(assert (= (and b!890511 res!603220) b!890510))

(assert (= (and b!890510 res!603221) b!890509))

(assert (= (and b!890509 res!603223) b!890514))

(assert (= (and b!890516 condMapEmpty!28502) mapIsEmpty!28502))

(assert (= (and b!890516 (not condMapEmpty!28502)) mapNonEmpty!28502))

(get-info :version)

(assert (= (and mapNonEmpty!28502 ((_ is ValueCellFull!8501) mapValue!28502)) b!890515))

(assert (= (and b!890516 ((_ is ValueCellFull!8501) mapDefault!28502)) b!890517))

(assert (= b!890513 b!890516))

(assert (= start!75834 b!890513))

(declare-fun m!829747 () Bool)

(assert (=> b!890513 m!829747))

(declare-fun m!829749 () Bool)

(assert (=> b!890513 m!829749))

(declare-fun m!829751 () Bool)

(assert (=> b!890514 m!829751))

(declare-fun m!829753 () Bool)

(assert (=> start!75834 m!829753))

(declare-fun m!829755 () Bool)

(assert (=> b!890509 m!829755))

(declare-fun m!829757 () Bool)

(assert (=> b!890511 m!829757))

(declare-fun m!829759 () Bool)

(assert (=> b!890511 m!829759))

(declare-fun m!829761 () Bool)

(assert (=> mapNonEmpty!28502 m!829761))

(check-sat tp_is_empty!17965 (not mapNonEmpty!28502) b_and!25887 (not b!890511) (not start!75834) (not b!890513) (not b_next!15637) (not b!890514) (not b!890509))
(check-sat b_and!25887 (not b_next!15637))
