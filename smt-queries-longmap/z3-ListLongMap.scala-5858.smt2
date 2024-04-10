; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75680 () Bool)

(assert start!75680)

(declare-fun b!889803 () Bool)

(declare-fun b_free!15651 () Bool)

(declare-fun b_next!15651 () Bool)

(assert (=> b!889803 (= b_free!15651 (not b_next!15651))))

(declare-fun tp!54921 () Bool)

(declare-fun b_and!25891 () Bool)

(assert (=> b!889803 (= tp!54921 b_and!25891)))

(declare-fun b!889795 () Bool)

(declare-fun e!496068 () Bool)

(declare-fun e!496062 () Bool)

(declare-fun mapRes!28523 () Bool)

(assert (=> b!889795 (= e!496068 (and e!496062 mapRes!28523))))

(declare-fun condMapEmpty!28523 () Bool)

(declare-datatypes ((array!51938 0))(
  ( (array!51939 (arr!24975 (Array (_ BitVec 32) (_ BitVec 64))) (size!25419 (_ BitVec 32))) )
))
(declare-datatypes ((V!28937 0))(
  ( (V!28938 (val!9040 Int)) )
))
(declare-datatypes ((ValueCell!8508 0))(
  ( (ValueCellFull!8508 (v!11518 V!28937)) (EmptyCell!8508) )
))
(declare-datatypes ((array!51940 0))(
  ( (array!51941 (arr!24976 (Array (_ BitVec 32) ValueCell!8508)) (size!25420 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4032 0))(
  ( (LongMapFixedSize!4033 (defaultEntry!5213 Int) (mask!25670 (_ BitVec 32)) (extraKeys!4907 (_ BitVec 32)) (zeroValue!5011 V!28937) (minValue!5011 V!28937) (_size!2071 (_ BitVec 32)) (_keys!9896 array!51938) (_values!5198 array!51940) (_vacant!2071 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4032)

(declare-fun mapDefault!28523 () ValueCell!8508)

(assert (=> b!889795 (= condMapEmpty!28523 (= (arr!24976 (_values!5198 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8508)) mapDefault!28523)))))

(declare-fun b!889796 () Bool)

(declare-fun res!602981 () Bool)

(declare-fun e!496063 () Bool)

(assert (=> b!889796 (=> (not res!602981) (not e!496063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51938 (_ BitVec 32)) Bool)

(assert (=> b!889796 (= res!602981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9896 thiss!1181) (mask!25670 thiss!1181)))))

(declare-fun mapIsEmpty!28523 () Bool)

(assert (=> mapIsEmpty!28523 mapRes!28523))

(declare-fun b!889797 () Bool)

(assert (=> b!889797 (= e!496063 false)))

(declare-fun lt!402111 () Bool)

(declare-datatypes ((List!17711 0))(
  ( (Nil!17708) (Cons!17707 (h!18838 (_ BitVec 64)) (t!25010 List!17711)) )
))
(declare-fun arrayNoDuplicates!0 (array!51938 (_ BitVec 32) List!17711) Bool)

(assert (=> b!889797 (= lt!402111 (arrayNoDuplicates!0 (_keys!9896 thiss!1181) #b00000000000000000000000000000000 Nil!17708))))

(declare-fun res!602980 () Bool)

(declare-fun e!496066 () Bool)

(assert (=> start!75680 (=> (not res!602980) (not e!496066))))

(declare-fun valid!1567 (LongMapFixedSize!4032) Bool)

(assert (=> start!75680 (= res!602980 (valid!1567 thiss!1181))))

(assert (=> start!75680 e!496066))

(declare-fun e!496064 () Bool)

(assert (=> start!75680 e!496064))

(assert (=> start!75680 true))

(declare-fun b!889798 () Bool)

(assert (=> b!889798 (= e!496066 e!496063)))

(declare-fun res!602984 () Bool)

(assert (=> b!889798 (=> (not res!602984) (not e!496063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889798 (= res!602984 (validMask!0 (mask!25670 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8783 0))(
  ( (MissingZero!8783 (index!37503 (_ BitVec 32))) (Found!8783 (index!37504 (_ BitVec 32))) (Intermediate!8783 (undefined!9595 Bool) (index!37505 (_ BitVec 32)) (x!75559 (_ BitVec 32))) (Undefined!8783) (MissingVacant!8783 (index!37506 (_ BitVec 32))) )
))
(declare-fun lt!402112 () SeekEntryResult!8783)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51938 (_ BitVec 32)) SeekEntryResult!8783)

(assert (=> b!889798 (= lt!402112 (seekEntry!0 key!785 (_keys!9896 thiss!1181) (mask!25670 thiss!1181)))))

(declare-fun b!889799 () Bool)

(declare-fun res!602982 () Bool)

(assert (=> b!889799 (=> (not res!602982) (not e!496066))))

(assert (=> b!889799 (= res!602982 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!28523 () Bool)

(declare-fun tp!54922 () Bool)

(declare-fun e!496067 () Bool)

(assert (=> mapNonEmpty!28523 (= mapRes!28523 (and tp!54922 e!496067))))

(declare-fun mapRest!28523 () (Array (_ BitVec 32) ValueCell!8508))

(declare-fun mapValue!28523 () ValueCell!8508)

(declare-fun mapKey!28523 () (_ BitVec 32))

(assert (=> mapNonEmpty!28523 (= (arr!24976 (_values!5198 thiss!1181)) (store mapRest!28523 mapKey!28523 mapValue!28523))))

(declare-fun b!889800 () Bool)

(declare-fun tp_is_empty!17979 () Bool)

(assert (=> b!889800 (= e!496062 tp_is_empty!17979)))

(declare-fun b!889801 () Bool)

(declare-fun res!602983 () Bool)

(assert (=> b!889801 (=> (not res!602983) (not e!496063))))

(assert (=> b!889801 (= res!602983 (and (= (size!25420 (_values!5198 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25670 thiss!1181))) (= (size!25419 (_keys!9896 thiss!1181)) (size!25420 (_values!5198 thiss!1181))) (bvsge (mask!25670 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4907 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4907 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!889802 () Bool)

(assert (=> b!889802 (= e!496067 tp_is_empty!17979)))

(declare-fun array_inv!19642 (array!51938) Bool)

(declare-fun array_inv!19643 (array!51940) Bool)

(assert (=> b!889803 (= e!496064 (and tp!54921 tp_is_empty!17979 (array_inv!19642 (_keys!9896 thiss!1181)) (array_inv!19643 (_values!5198 thiss!1181)) e!496068))))

(assert (= (and start!75680 res!602980) b!889799))

(assert (= (and b!889799 res!602982) b!889798))

(assert (= (and b!889798 res!602984) b!889801))

(assert (= (and b!889801 res!602983) b!889796))

(assert (= (and b!889796 res!602981) b!889797))

(assert (= (and b!889795 condMapEmpty!28523) mapIsEmpty!28523))

(assert (= (and b!889795 (not condMapEmpty!28523)) mapNonEmpty!28523))

(get-info :version)

(assert (= (and mapNonEmpty!28523 ((_ is ValueCellFull!8508) mapValue!28523)) b!889802))

(assert (= (and b!889795 ((_ is ValueCellFull!8508) mapDefault!28523)) b!889800))

(assert (= b!889803 b!889795))

(assert (= start!75680 b!889803))

(declare-fun m!828565 () Bool)

(assert (=> b!889796 m!828565))

(declare-fun m!828567 () Bool)

(assert (=> b!889798 m!828567))

(declare-fun m!828569 () Bool)

(assert (=> b!889798 m!828569))

(declare-fun m!828571 () Bool)

(assert (=> mapNonEmpty!28523 m!828571))

(declare-fun m!828573 () Bool)

(assert (=> b!889797 m!828573))

(declare-fun m!828575 () Bool)

(assert (=> b!889803 m!828575))

(declare-fun m!828577 () Bool)

(assert (=> b!889803 m!828577))

(declare-fun m!828579 () Bool)

(assert (=> start!75680 m!828579))

(check-sat (not b!889796) (not b_next!15651) (not start!75680) (not b!889798) (not b!889803) b_and!25891 tp_is_empty!17979 (not mapNonEmpty!28523) (not b!889797))
(check-sat b_and!25891 (not b_next!15651))
