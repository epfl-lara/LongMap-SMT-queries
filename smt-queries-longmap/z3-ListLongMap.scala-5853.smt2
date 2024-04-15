; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75630 () Bool)

(assert start!75630)

(declare-fun b!889124 () Bool)

(declare-fun b_free!15619 () Bool)

(declare-fun b_next!15619 () Bool)

(assert (=> b!889124 (= b_free!15619 (not b_next!15619))))

(declare-fun tp!54827 () Bool)

(declare-fun b_and!25833 () Bool)

(assert (=> b!889124 (= tp!54827 b_and!25833)))

(declare-fun e!495584 () Bool)

(declare-datatypes ((array!51857 0))(
  ( (array!51858 (arr!24935 (Array (_ BitVec 32) (_ BitVec 64))) (size!25381 (_ BitVec 32))) )
))
(declare-datatypes ((V!28895 0))(
  ( (V!28896 (val!9024 Int)) )
))
(declare-datatypes ((ValueCell!8492 0))(
  ( (ValueCellFull!8492 (v!11496 V!28895)) (EmptyCell!8492) )
))
(declare-datatypes ((array!51859 0))(
  ( (array!51860 (arr!24936 (Array (_ BitVec 32) ValueCell!8492)) (size!25382 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4000 0))(
  ( (LongMapFixedSize!4001 (defaultEntry!5197 Int) (mask!25637 (_ BitVec 32)) (extraKeys!4891 (_ BitVec 32)) (zeroValue!4995 V!28895) (minValue!4995 V!28895) (_size!2055 (_ BitVec 32)) (_keys!9875 array!51857) (_values!5182 array!51859) (_vacant!2055 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4000)

(declare-fun tp_is_empty!17947 () Bool)

(declare-fun e!495580 () Bool)

(declare-fun array_inv!19660 (array!51857) Bool)

(declare-fun array_inv!19661 (array!51859) Bool)

(assert (=> b!889124 (= e!495580 (and tp!54827 tp_is_empty!17947 (array_inv!19660 (_keys!9875 thiss!1181)) (array_inv!19661 (_values!5182 thiss!1181)) e!495584))))

(declare-fun b!889125 () Bool)

(declare-fun res!602632 () Bool)

(declare-fun e!495582 () Bool)

(assert (=> b!889125 (=> (not res!602632) (not e!495582))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889125 (= res!602632 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889126 () Bool)

(declare-fun e!495583 () Bool)

(assert (=> b!889126 (= e!495582 e!495583)))

(declare-fun res!602633 () Bool)

(assert (=> b!889126 (=> (not res!602633) (not e!495583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889126 (= res!602633 (validMask!0 (mask!25637 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8770 0))(
  ( (MissingZero!8770 (index!37451 (_ BitVec 32))) (Found!8770 (index!37452 (_ BitVec 32))) (Intermediate!8770 (undefined!9582 Bool) (index!37453 (_ BitVec 32)) (x!75501 (_ BitVec 32))) (Undefined!8770) (MissingVacant!8770 (index!37454 (_ BitVec 32))) )
))
(declare-fun lt!401780 () SeekEntryResult!8770)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51857 (_ BitVec 32)) SeekEntryResult!8770)

(assert (=> b!889126 (= lt!401780 (seekEntry!0 key!785 (_keys!9875 thiss!1181) (mask!25637 thiss!1181)))))

(declare-fun b!889127 () Bool)

(declare-fun res!602634 () Bool)

(assert (=> b!889127 (=> (not res!602634) (not e!495583))))

(assert (=> b!889127 (= res!602634 (and (= (size!25382 (_values!5182 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25637 thiss!1181))) (= (size!25381 (_keys!9875 thiss!1181)) (size!25382 (_values!5182 thiss!1181))) (bvsge (mask!25637 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4891 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4891 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!889128 () Bool)

(declare-fun res!602630 () Bool)

(assert (=> b!889128 (=> (not res!602630) (not e!495583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51857 (_ BitVec 32)) Bool)

(assert (=> b!889128 (= res!602630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9875 thiss!1181) (mask!25637 thiss!1181)))))

(declare-fun b!889129 () Bool)

(declare-fun e!495578 () Bool)

(declare-fun mapRes!28475 () Bool)

(assert (=> b!889129 (= e!495584 (and e!495578 mapRes!28475))))

(declare-fun condMapEmpty!28475 () Bool)

(declare-fun mapDefault!28475 () ValueCell!8492)

(assert (=> b!889129 (= condMapEmpty!28475 (= (arr!24936 (_values!5182 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8492)) mapDefault!28475)))))

(declare-fun b!889130 () Bool)

(declare-fun e!495581 () Bool)

(assert (=> b!889130 (= e!495581 tp_is_empty!17947)))

(declare-fun res!602631 () Bool)

(assert (=> start!75630 (=> (not res!602631) (not e!495582))))

(declare-fun valid!1566 (LongMapFixedSize!4000) Bool)

(assert (=> start!75630 (= res!602631 (valid!1566 thiss!1181))))

(assert (=> start!75630 e!495582))

(assert (=> start!75630 e!495580))

(assert (=> start!75630 true))

(declare-fun b!889131 () Bool)

(assert (=> b!889131 (= e!495583 false)))

(declare-fun lt!401779 () Bool)

(declare-datatypes ((List!17710 0))(
  ( (Nil!17707) (Cons!17706 (h!18837 (_ BitVec 64)) (t!25000 List!17710)) )
))
(declare-fun arrayNoDuplicates!0 (array!51857 (_ BitVec 32) List!17710) Bool)

(assert (=> b!889131 (= lt!401779 (arrayNoDuplicates!0 (_keys!9875 thiss!1181) #b00000000000000000000000000000000 Nil!17707))))

(declare-fun mapNonEmpty!28475 () Bool)

(declare-fun tp!54826 () Bool)

(assert (=> mapNonEmpty!28475 (= mapRes!28475 (and tp!54826 e!495581))))

(declare-fun mapRest!28475 () (Array (_ BitVec 32) ValueCell!8492))

(declare-fun mapKey!28475 () (_ BitVec 32))

(declare-fun mapValue!28475 () ValueCell!8492)

(assert (=> mapNonEmpty!28475 (= (arr!24936 (_values!5182 thiss!1181)) (store mapRest!28475 mapKey!28475 mapValue!28475))))

(declare-fun b!889132 () Bool)

(assert (=> b!889132 (= e!495578 tp_is_empty!17947)))

(declare-fun mapIsEmpty!28475 () Bool)

(assert (=> mapIsEmpty!28475 mapRes!28475))

(assert (= (and start!75630 res!602631) b!889125))

(assert (= (and b!889125 res!602632) b!889126))

(assert (= (and b!889126 res!602633) b!889127))

(assert (= (and b!889127 res!602634) b!889128))

(assert (= (and b!889128 res!602630) b!889131))

(assert (= (and b!889129 condMapEmpty!28475) mapIsEmpty!28475))

(assert (= (and b!889129 (not condMapEmpty!28475)) mapNonEmpty!28475))

(get-info :version)

(assert (= (and mapNonEmpty!28475 ((_ is ValueCellFull!8492) mapValue!28475)) b!889130))

(assert (= (and b!889129 ((_ is ValueCellFull!8492) mapDefault!28475)) b!889132))

(assert (= b!889124 b!889129))

(assert (= start!75630 b!889124))

(declare-fun m!827551 () Bool)

(assert (=> b!889126 m!827551))

(declare-fun m!827553 () Bool)

(assert (=> b!889126 m!827553))

(declare-fun m!827555 () Bool)

(assert (=> start!75630 m!827555))

(declare-fun m!827557 () Bool)

(assert (=> b!889131 m!827557))

(declare-fun m!827559 () Bool)

(assert (=> b!889128 m!827559))

(declare-fun m!827561 () Bool)

(assert (=> mapNonEmpty!28475 m!827561))

(declare-fun m!827563 () Bool)

(assert (=> b!889124 m!827563))

(declare-fun m!827565 () Bool)

(assert (=> b!889124 m!827565))

(check-sat (not mapNonEmpty!28475) (not b!889124) (not start!75630) (not b_next!15619) (not b!889128) tp_is_empty!17947 b_and!25833 (not b!889131) (not b!889126))
(check-sat b_and!25833 (not b_next!15619))
