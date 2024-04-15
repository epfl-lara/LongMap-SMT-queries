; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75636 () Bool)

(assert start!75636)

(declare-fun b!889213 () Bool)

(declare-fun b_free!15625 () Bool)

(declare-fun b_next!15625 () Bool)

(assert (=> b!889213 (= b_free!15625 (not b_next!15625))))

(declare-fun tp!54845 () Bool)

(declare-fun b_and!25839 () Bool)

(assert (=> b!889213 (= tp!54845 b_and!25839)))

(declare-fun b!889205 () Bool)

(declare-fun e!495641 () Bool)

(declare-fun tp_is_empty!17953 () Bool)

(assert (=> b!889205 (= e!495641 tp_is_empty!17953)))

(declare-fun res!602676 () Bool)

(declare-fun e!495644 () Bool)

(assert (=> start!75636 (=> (not res!602676) (not e!495644))))

(declare-datatypes ((array!51869 0))(
  ( (array!51870 (arr!24941 (Array (_ BitVec 32) (_ BitVec 64))) (size!25387 (_ BitVec 32))) )
))
(declare-datatypes ((V!28903 0))(
  ( (V!28904 (val!9027 Int)) )
))
(declare-datatypes ((ValueCell!8495 0))(
  ( (ValueCellFull!8495 (v!11499 V!28903)) (EmptyCell!8495) )
))
(declare-datatypes ((array!51871 0))(
  ( (array!51872 (arr!24942 (Array (_ BitVec 32) ValueCell!8495)) (size!25388 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4006 0))(
  ( (LongMapFixedSize!4007 (defaultEntry!5200 Int) (mask!25642 (_ BitVec 32)) (extraKeys!4894 (_ BitVec 32)) (zeroValue!4998 V!28903) (minValue!4998 V!28903) (_size!2058 (_ BitVec 32)) (_keys!9878 array!51869) (_values!5185 array!51871) (_vacant!2058 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4006)

(declare-fun valid!1569 (LongMapFixedSize!4006) Bool)

(assert (=> start!75636 (= res!602676 (valid!1569 thiss!1181))))

(assert (=> start!75636 e!495644))

(declare-fun e!495645 () Bool)

(assert (=> start!75636 e!495645))

(assert (=> start!75636 true))

(declare-fun b!889206 () Bool)

(declare-fun e!495646 () Bool)

(assert (=> b!889206 (= e!495644 e!495646)))

(declare-fun res!602677 () Bool)

(assert (=> b!889206 (=> (not res!602677) (not e!495646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889206 (= res!602677 (validMask!0 (mask!25642 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8773 0))(
  ( (MissingZero!8773 (index!37463 (_ BitVec 32))) (Found!8773 (index!37464 (_ BitVec 32))) (Intermediate!8773 (undefined!9585 Bool) (index!37465 (_ BitVec 32)) (x!75512 (_ BitVec 32))) (Undefined!8773) (MissingVacant!8773 (index!37466 (_ BitVec 32))) )
))
(declare-fun lt!401797 () SeekEntryResult!8773)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51869 (_ BitVec 32)) SeekEntryResult!8773)

(assert (=> b!889206 (= lt!401797 (seekEntry!0 key!785 (_keys!9878 thiss!1181) (mask!25642 thiss!1181)))))

(declare-fun b!889207 () Bool)

(declare-fun e!495642 () Bool)

(declare-fun mapRes!28484 () Bool)

(assert (=> b!889207 (= e!495642 (and e!495641 mapRes!28484))))

(declare-fun condMapEmpty!28484 () Bool)

(declare-fun mapDefault!28484 () ValueCell!8495)

(assert (=> b!889207 (= condMapEmpty!28484 (= (arr!24942 (_values!5185 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8495)) mapDefault!28484)))))

(declare-fun b!889208 () Bool)

(declare-fun res!602675 () Bool)

(assert (=> b!889208 (=> (not res!602675) (not e!495646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51869 (_ BitVec 32)) Bool)

(assert (=> b!889208 (= res!602675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9878 thiss!1181) (mask!25642 thiss!1181)))))

(declare-fun b!889209 () Bool)

(declare-fun res!602679 () Bool)

(assert (=> b!889209 (=> (not res!602679) (not e!495646))))

(assert (=> b!889209 (= res!602679 (and (= (size!25388 (_values!5185 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25642 thiss!1181))) (= (size!25387 (_keys!9878 thiss!1181)) (size!25388 (_values!5185 thiss!1181))) (bvsge (mask!25642 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4894 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4894 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28484 () Bool)

(assert (=> mapIsEmpty!28484 mapRes!28484))

(declare-fun b!889210 () Bool)

(declare-fun e!495647 () Bool)

(assert (=> b!889210 (= e!495647 tp_is_empty!17953)))

(declare-fun b!889211 () Bool)

(declare-fun res!602678 () Bool)

(assert (=> b!889211 (=> (not res!602678) (not e!495644))))

(assert (=> b!889211 (= res!602678 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!28484 () Bool)

(declare-fun tp!54844 () Bool)

(assert (=> mapNonEmpty!28484 (= mapRes!28484 (and tp!54844 e!495647))))

(declare-fun mapRest!28484 () (Array (_ BitVec 32) ValueCell!8495))

(declare-fun mapValue!28484 () ValueCell!8495)

(declare-fun mapKey!28484 () (_ BitVec 32))

(assert (=> mapNonEmpty!28484 (= (arr!24942 (_values!5185 thiss!1181)) (store mapRest!28484 mapKey!28484 mapValue!28484))))

(declare-fun b!889212 () Bool)

(assert (=> b!889212 (= e!495646 false)))

(declare-fun lt!401798 () Bool)

(declare-datatypes ((List!17713 0))(
  ( (Nil!17710) (Cons!17709 (h!18840 (_ BitVec 64)) (t!25003 List!17713)) )
))
(declare-fun arrayNoDuplicates!0 (array!51869 (_ BitVec 32) List!17713) Bool)

(assert (=> b!889212 (= lt!401798 (arrayNoDuplicates!0 (_keys!9878 thiss!1181) #b00000000000000000000000000000000 Nil!17710))))

(declare-fun array_inv!19664 (array!51869) Bool)

(declare-fun array_inv!19665 (array!51871) Bool)

(assert (=> b!889213 (= e!495645 (and tp!54845 tp_is_empty!17953 (array_inv!19664 (_keys!9878 thiss!1181)) (array_inv!19665 (_values!5185 thiss!1181)) e!495642))))

(assert (= (and start!75636 res!602676) b!889211))

(assert (= (and b!889211 res!602678) b!889206))

(assert (= (and b!889206 res!602677) b!889209))

(assert (= (and b!889209 res!602679) b!889208))

(assert (= (and b!889208 res!602675) b!889212))

(assert (= (and b!889207 condMapEmpty!28484) mapIsEmpty!28484))

(assert (= (and b!889207 (not condMapEmpty!28484)) mapNonEmpty!28484))

(get-info :version)

(assert (= (and mapNonEmpty!28484 ((_ is ValueCellFull!8495) mapValue!28484)) b!889210))

(assert (= (and b!889207 ((_ is ValueCellFull!8495) mapDefault!28484)) b!889205))

(assert (= b!889213 b!889207))

(assert (= start!75636 b!889213))

(declare-fun m!827599 () Bool)

(assert (=> start!75636 m!827599))

(declare-fun m!827601 () Bool)

(assert (=> mapNonEmpty!28484 m!827601))

(declare-fun m!827603 () Bool)

(assert (=> b!889213 m!827603))

(declare-fun m!827605 () Bool)

(assert (=> b!889213 m!827605))

(declare-fun m!827607 () Bool)

(assert (=> b!889206 m!827607))

(declare-fun m!827609 () Bool)

(assert (=> b!889206 m!827609))

(declare-fun m!827611 () Bool)

(assert (=> b!889212 m!827611))

(declare-fun m!827613 () Bool)

(assert (=> b!889208 m!827613))

(check-sat (not b!889208) (not b!889206) b_and!25839 (not b!889213) (not start!75636) (not b_next!15625) (not mapNonEmpty!28484) tp_is_empty!17953 (not b!889212))
(check-sat b_and!25839 (not b_next!15625))
