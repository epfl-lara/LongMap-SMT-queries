; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75648 () Bool)

(assert start!75648)

(declare-fun b!889372 () Bool)

(declare-fun b_free!15637 () Bool)

(declare-fun b_next!15637 () Bool)

(assert (=> b!889372 (= b_free!15637 (not b_next!15637))))

(declare-fun tp!54881 () Bool)

(declare-fun b_and!25851 () Bool)

(assert (=> b!889372 (= tp!54881 b_and!25851)))

(declare-fun mapIsEmpty!28502 () Bool)

(declare-fun mapRes!28502 () Bool)

(assert (=> mapIsEmpty!28502 mapRes!28502))

(declare-fun b!889367 () Bool)

(declare-fun res!602769 () Bool)

(declare-fun e!495770 () Bool)

(assert (=> b!889367 (=> (not res!602769) (not e!495770))))

(declare-datatypes ((array!51893 0))(
  ( (array!51894 (arr!24953 (Array (_ BitVec 32) (_ BitVec 64))) (size!25399 (_ BitVec 32))) )
))
(declare-datatypes ((V!28919 0))(
  ( (V!28920 (val!9033 Int)) )
))
(declare-datatypes ((ValueCell!8501 0))(
  ( (ValueCellFull!8501 (v!11505 V!28919)) (EmptyCell!8501) )
))
(declare-datatypes ((array!51895 0))(
  ( (array!51896 (arr!24954 (Array (_ BitVec 32) ValueCell!8501)) (size!25400 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4018 0))(
  ( (LongMapFixedSize!4019 (defaultEntry!5206 Int) (mask!25652 (_ BitVec 32)) (extraKeys!4900 (_ BitVec 32)) (zeroValue!5004 V!28919) (minValue!5004 V!28919) (_size!2064 (_ BitVec 32)) (_keys!9884 array!51893) (_values!5191 array!51895) (_vacant!2064 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4018)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51893 (_ BitVec 32)) Bool)

(assert (=> b!889367 (= res!602769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9884 thiss!1181) (mask!25652 thiss!1181)))))

(declare-fun b!889368 () Bool)

(declare-fun e!495767 () Bool)

(declare-fun tp_is_empty!17965 () Bool)

(assert (=> b!889368 (= e!495767 tp_is_empty!17965)))

(declare-fun b!889369 () Bool)

(declare-fun e!495769 () Bool)

(assert (=> b!889369 (= e!495769 e!495770)))

(declare-fun res!602768 () Bool)

(assert (=> b!889369 (=> (not res!602768) (not e!495770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889369 (= res!602768 (validMask!0 (mask!25652 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8778 0))(
  ( (MissingZero!8778 (index!37483 (_ BitVec 32))) (Found!8778 (index!37484 (_ BitVec 32))) (Intermediate!8778 (undefined!9590 Bool) (index!37485 (_ BitVec 32)) (x!75533 (_ BitVec 32))) (Undefined!8778) (MissingVacant!8778 (index!37486 (_ BitVec 32))) )
))
(declare-fun lt!401833 () SeekEntryResult!8778)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51893 (_ BitVec 32)) SeekEntryResult!8778)

(assert (=> b!889369 (= lt!401833 (seekEntry!0 key!785 (_keys!9884 thiss!1181) (mask!25652 thiss!1181)))))

(declare-fun b!889370 () Bool)

(declare-fun res!602767 () Bool)

(assert (=> b!889370 (=> (not res!602767) (not e!495769))))

(assert (=> b!889370 (= res!602767 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889371 () Bool)

(declare-fun res!602766 () Bool)

(assert (=> b!889371 (=> (not res!602766) (not e!495770))))

(assert (=> b!889371 (= res!602766 (and (= (size!25400 (_values!5191 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25652 thiss!1181))) (= (size!25399 (_keys!9884 thiss!1181)) (size!25400 (_values!5191 thiss!1181))) (bvsge (mask!25652 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4900 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4900 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28502 () Bool)

(declare-fun tp!54880 () Bool)

(declare-fun e!495768 () Bool)

(assert (=> mapNonEmpty!28502 (= mapRes!28502 (and tp!54880 e!495768))))

(declare-fun mapKey!28502 () (_ BitVec 32))

(declare-fun mapRest!28502 () (Array (_ BitVec 32) ValueCell!8501))

(declare-fun mapValue!28502 () ValueCell!8501)

(assert (=> mapNonEmpty!28502 (= (arr!24954 (_values!5191 thiss!1181)) (store mapRest!28502 mapKey!28502 mapValue!28502))))

(declare-fun b!889373 () Bool)

(assert (=> b!889373 (= e!495768 tp_is_empty!17965)))

(declare-fun b!889374 () Bool)

(declare-fun e!495772 () Bool)

(assert (=> b!889374 (= e!495772 (and e!495767 mapRes!28502))))

(declare-fun condMapEmpty!28502 () Bool)

(declare-fun mapDefault!28502 () ValueCell!8501)

(assert (=> b!889374 (= condMapEmpty!28502 (= (arr!24954 (_values!5191 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8501)) mapDefault!28502)))))

(declare-fun b!889375 () Bool)

(assert (=> b!889375 (= e!495770 false)))

(declare-fun lt!401834 () Bool)

(declare-datatypes ((List!17717 0))(
  ( (Nil!17714) (Cons!17713 (h!18844 (_ BitVec 64)) (t!25007 List!17717)) )
))
(declare-fun arrayNoDuplicates!0 (array!51893 (_ BitVec 32) List!17717) Bool)

(assert (=> b!889375 (= lt!401834 (arrayNoDuplicates!0 (_keys!9884 thiss!1181) #b00000000000000000000000000000000 Nil!17714))))

(declare-fun res!602765 () Bool)

(assert (=> start!75648 (=> (not res!602765) (not e!495769))))

(declare-fun valid!1573 (LongMapFixedSize!4018) Bool)

(assert (=> start!75648 (= res!602765 (valid!1573 thiss!1181))))

(assert (=> start!75648 e!495769))

(declare-fun e!495773 () Bool)

(assert (=> start!75648 e!495773))

(assert (=> start!75648 true))

(declare-fun array_inv!19674 (array!51893) Bool)

(declare-fun array_inv!19675 (array!51895) Bool)

(assert (=> b!889372 (= e!495773 (and tp!54881 tp_is_empty!17965 (array_inv!19674 (_keys!9884 thiss!1181)) (array_inv!19675 (_values!5191 thiss!1181)) e!495772))))

(assert (= (and start!75648 res!602765) b!889370))

(assert (= (and b!889370 res!602767) b!889369))

(assert (= (and b!889369 res!602768) b!889371))

(assert (= (and b!889371 res!602766) b!889367))

(assert (= (and b!889367 res!602769) b!889375))

(assert (= (and b!889374 condMapEmpty!28502) mapIsEmpty!28502))

(assert (= (and b!889374 (not condMapEmpty!28502)) mapNonEmpty!28502))

(get-info :version)

(assert (= (and mapNonEmpty!28502 ((_ is ValueCellFull!8501) mapValue!28502)) b!889373))

(assert (= (and b!889374 ((_ is ValueCellFull!8501) mapDefault!28502)) b!889368))

(assert (= b!889372 b!889374))

(assert (= start!75648 b!889372))

(declare-fun m!827695 () Bool)

(assert (=> b!889367 m!827695))

(declare-fun m!827697 () Bool)

(assert (=> b!889372 m!827697))

(declare-fun m!827699 () Bool)

(assert (=> b!889372 m!827699))

(declare-fun m!827701 () Bool)

(assert (=> mapNonEmpty!28502 m!827701))

(declare-fun m!827703 () Bool)

(assert (=> start!75648 m!827703))

(declare-fun m!827705 () Bool)

(assert (=> b!889375 m!827705))

(declare-fun m!827707 () Bool)

(assert (=> b!889369 m!827707))

(declare-fun m!827709 () Bool)

(assert (=> b!889369 m!827709))

(check-sat (not b!889372) (not b!889367) (not b_next!15637) (not b!889369) tp_is_empty!17965 (not mapNonEmpty!28502) b_and!25851 (not b!889375) (not start!75648))
(check-sat b_and!25851 (not b_next!15637))
