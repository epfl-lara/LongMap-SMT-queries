; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75656 () Bool)

(assert start!75656)

(declare-fun b!889472 () Bool)

(declare-fun b_free!15627 () Bool)

(declare-fun b_next!15627 () Bool)

(assert (=> b!889472 (= b_free!15627 (not b_next!15627))))

(declare-fun tp!54849 () Bool)

(declare-fun b_and!25867 () Bool)

(assert (=> b!889472 (= tp!54849 b_and!25867)))

(declare-fun mapIsEmpty!28487 () Bool)

(declare-fun mapRes!28487 () Bool)

(assert (=> mapIsEmpty!28487 mapRes!28487))

(declare-fun b!889471 () Bool)

(declare-fun e!495813 () Bool)

(declare-fun tp_is_empty!17955 () Bool)

(assert (=> b!889471 (= e!495813 tp_is_empty!17955)))

(declare-fun e!495812 () Bool)

(declare-fun e!495815 () Bool)

(declare-datatypes ((array!51890 0))(
  ( (array!51891 (arr!24951 (Array (_ BitVec 32) (_ BitVec 64))) (size!25395 (_ BitVec 32))) )
))
(declare-datatypes ((V!28905 0))(
  ( (V!28906 (val!9028 Int)) )
))
(declare-datatypes ((ValueCell!8496 0))(
  ( (ValueCellFull!8496 (v!11506 V!28905)) (EmptyCell!8496) )
))
(declare-datatypes ((array!51892 0))(
  ( (array!51893 (arr!24952 (Array (_ BitVec 32) ValueCell!8496)) (size!25396 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4008 0))(
  ( (LongMapFixedSize!4009 (defaultEntry!5201 Int) (mask!25650 (_ BitVec 32)) (extraKeys!4895 (_ BitVec 32)) (zeroValue!4999 V!28905) (minValue!4999 V!28905) (_size!2059 (_ BitVec 32)) (_keys!9884 array!51890) (_values!5186 array!51892) (_vacant!2059 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4008)

(declare-fun array_inv!19628 (array!51890) Bool)

(declare-fun array_inv!19629 (array!51892) Bool)

(assert (=> b!889472 (= e!495815 (and tp!54849 tp_is_empty!17955 (array_inv!19628 (_keys!9884 thiss!1181)) (array_inv!19629 (_values!5186 thiss!1181)) e!495812))))

(declare-fun res!602801 () Bool)

(declare-fun e!495814 () Bool)

(assert (=> start!75656 (=> (not res!602801) (not e!495814))))

(declare-fun valid!1560 (LongMapFixedSize!4008) Bool)

(assert (=> start!75656 (= res!602801 (valid!1560 thiss!1181))))

(assert (=> start!75656 e!495814))

(assert (=> start!75656 e!495815))

(assert (=> start!75656 true))

(declare-fun b!889473 () Bool)

(assert (=> b!889473 (= e!495812 (and e!495813 mapRes!28487))))

(declare-fun condMapEmpty!28487 () Bool)

(declare-fun mapDefault!28487 () ValueCell!8496)

(assert (=> b!889473 (= condMapEmpty!28487 (= (arr!24952 (_values!5186 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8496)) mapDefault!28487)))))

(declare-fun b!889474 () Bool)

(declare-fun res!602803 () Bool)

(assert (=> b!889474 (=> (not res!602803) (not e!495814))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889474 (= res!602803 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889475 () Bool)

(declare-fun e!495811 () Bool)

(assert (=> b!889475 (= e!495814 e!495811)))

(declare-fun res!602804 () Bool)

(assert (=> b!889475 (=> (not res!602804) (not e!495811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889475 (= res!602804 (validMask!0 (mask!25650 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8775 0))(
  ( (MissingZero!8775 (index!37471 (_ BitVec 32))) (Found!8775 (index!37472 (_ BitVec 32))) (Intermediate!8775 (undefined!9587 Bool) (index!37473 (_ BitVec 32)) (x!75519 (_ BitVec 32))) (Undefined!8775) (MissingVacant!8775 (index!37474 (_ BitVec 32))) )
))
(declare-fun lt!402040 () SeekEntryResult!8775)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51890 (_ BitVec 32)) SeekEntryResult!8775)

(assert (=> b!889475 (= lt!402040 (seekEntry!0 key!785 (_keys!9884 thiss!1181) (mask!25650 thiss!1181)))))

(declare-fun mapNonEmpty!28487 () Bool)

(declare-fun tp!54850 () Bool)

(declare-fun e!495810 () Bool)

(assert (=> mapNonEmpty!28487 (= mapRes!28487 (and tp!54850 e!495810))))

(declare-fun mapKey!28487 () (_ BitVec 32))

(declare-fun mapValue!28487 () ValueCell!8496)

(declare-fun mapRest!28487 () (Array (_ BitVec 32) ValueCell!8496))

(assert (=> mapNonEmpty!28487 (= (arr!24952 (_values!5186 thiss!1181)) (store mapRest!28487 mapKey!28487 mapValue!28487))))

(declare-fun b!889476 () Bool)

(assert (=> b!889476 (= e!495810 tp_is_empty!17955)))

(declare-fun b!889477 () Bool)

(declare-fun res!602800 () Bool)

(assert (=> b!889477 (=> (not res!602800) (not e!495811))))

(assert (=> b!889477 (= res!602800 (and (= (size!25396 (_values!5186 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25650 thiss!1181))) (= (size!25395 (_keys!9884 thiss!1181)) (size!25396 (_values!5186 thiss!1181))) (bvsge (mask!25650 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4895 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4895 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!889478 () Bool)

(assert (=> b!889478 (= e!495811 false)))

(declare-fun lt!402039 () Bool)

(declare-datatypes ((List!17703 0))(
  ( (Nil!17700) (Cons!17699 (h!18830 (_ BitVec 64)) (t!25002 List!17703)) )
))
(declare-fun arrayNoDuplicates!0 (array!51890 (_ BitVec 32) List!17703) Bool)

(assert (=> b!889478 (= lt!402039 (arrayNoDuplicates!0 (_keys!9884 thiss!1181) #b00000000000000000000000000000000 Nil!17700))))

(declare-fun b!889479 () Bool)

(declare-fun res!602802 () Bool)

(assert (=> b!889479 (=> (not res!602802) (not e!495811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51890 (_ BitVec 32)) Bool)

(assert (=> b!889479 (= res!602802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9884 thiss!1181) (mask!25650 thiss!1181)))))

(assert (= (and start!75656 res!602801) b!889474))

(assert (= (and b!889474 res!602803) b!889475))

(assert (= (and b!889475 res!602804) b!889477))

(assert (= (and b!889477 res!602800) b!889479))

(assert (= (and b!889479 res!602802) b!889478))

(assert (= (and b!889473 condMapEmpty!28487) mapIsEmpty!28487))

(assert (= (and b!889473 (not condMapEmpty!28487)) mapNonEmpty!28487))

(get-info :version)

(assert (= (and mapNonEmpty!28487 ((_ is ValueCellFull!8496) mapValue!28487)) b!889476))

(assert (= (and b!889473 ((_ is ValueCellFull!8496) mapDefault!28487)) b!889471))

(assert (= b!889472 b!889473))

(assert (= start!75656 b!889472))

(declare-fun m!828373 () Bool)

(assert (=> b!889475 m!828373))

(declare-fun m!828375 () Bool)

(assert (=> b!889475 m!828375))

(declare-fun m!828377 () Bool)

(assert (=> b!889478 m!828377))

(declare-fun m!828379 () Bool)

(assert (=> mapNonEmpty!28487 m!828379))

(declare-fun m!828381 () Bool)

(assert (=> b!889472 m!828381))

(declare-fun m!828383 () Bool)

(assert (=> b!889472 m!828383))

(declare-fun m!828385 () Bool)

(assert (=> b!889479 m!828385))

(declare-fun m!828387 () Bool)

(assert (=> start!75656 m!828387))

(check-sat (not b_next!15627) tp_is_empty!17955 (not b!889478) (not b!889472) (not start!75656) (not b!889475) (not mapNonEmpty!28487) (not b!889479) b_and!25867)
(check-sat b_and!25867 (not b_next!15627))
