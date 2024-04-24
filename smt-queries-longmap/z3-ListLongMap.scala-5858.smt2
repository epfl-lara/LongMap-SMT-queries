; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75846 () Bool)

(assert start!75846)

(declare-fun b!890671 () Bool)

(declare-fun b_free!15649 () Bool)

(declare-fun b_next!15649 () Bool)

(assert (=> b!890671 (= b_free!15649 (not b_next!15649))))

(declare-fun tp!54917 () Bool)

(declare-fun b_and!25899 () Bool)

(assert (=> b!890671 (= tp!54917 b_and!25899)))

(declare-fun e!496623 () Bool)

(declare-fun e!496629 () Bool)

(declare-datatypes ((array!51973 0))(
  ( (array!51974 (arr!24988 (Array (_ BitVec 32) (_ BitVec 64))) (size!25433 (_ BitVec 32))) )
))
(declare-datatypes ((V!28935 0))(
  ( (V!28936 (val!9039 Int)) )
))
(declare-datatypes ((ValueCell!8507 0))(
  ( (ValueCellFull!8507 (v!11514 V!28935)) (EmptyCell!8507) )
))
(declare-datatypes ((array!51975 0))(
  ( (array!51976 (arr!24989 (Array (_ BitVec 32) ValueCell!8507)) (size!25434 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4030 0))(
  ( (LongMapFixedSize!4031 (defaultEntry!5212 Int) (mask!25712 (_ BitVec 32)) (extraKeys!4906 (_ BitVec 32)) (zeroValue!5010 V!28935) (minValue!5010 V!28935) (_size!2070 (_ BitVec 32)) (_keys!9923 array!51973) (_values!5197 array!51975) (_vacant!2070 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4030)

(declare-fun tp_is_empty!17977 () Bool)

(declare-fun array_inv!19698 (array!51973) Bool)

(declare-fun array_inv!19699 (array!51975) Bool)

(assert (=> b!890671 (= e!496629 (and tp!54917 tp_is_empty!17977 (array_inv!19698 (_keys!9923 thiss!1181)) (array_inv!19699 (_values!5197 thiss!1181)) e!496623))))

(declare-fun res!603312 () Bool)

(declare-fun e!496625 () Bool)

(assert (=> start!75846 (=> (not res!603312) (not e!496625))))

(declare-fun valid!1581 (LongMapFixedSize!4030) Bool)

(assert (=> start!75846 (= res!603312 (valid!1581 thiss!1181))))

(assert (=> start!75846 e!496625))

(assert (=> start!75846 e!496629))

(assert (=> start!75846 true))

(declare-fun b!890672 () Bool)

(declare-fun e!496628 () Bool)

(assert (=> b!890672 (= e!496628 false)))

(declare-fun lt!402466 () Bool)

(declare-datatypes ((List!17664 0))(
  ( (Nil!17661) (Cons!17660 (h!18797 (_ BitVec 64)) (t!24955 List!17664)) )
))
(declare-fun arrayNoDuplicates!0 (array!51973 (_ BitVec 32) List!17664) Bool)

(assert (=> b!890672 (= lt!402466 (arrayNoDuplicates!0 (_keys!9923 thiss!1181) #b00000000000000000000000000000000 Nil!17661))))

(declare-fun b!890673 () Bool)

(declare-fun e!496627 () Bool)

(declare-fun mapRes!28520 () Bool)

(assert (=> b!890673 (= e!496623 (and e!496627 mapRes!28520))))

(declare-fun condMapEmpty!28520 () Bool)

(declare-fun mapDefault!28520 () ValueCell!8507)

(assert (=> b!890673 (= condMapEmpty!28520 (= (arr!24989 (_values!5197 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8507)) mapDefault!28520)))))

(declare-fun mapNonEmpty!28520 () Bool)

(declare-fun tp!54916 () Bool)

(declare-fun e!496626 () Bool)

(assert (=> mapNonEmpty!28520 (= mapRes!28520 (and tp!54916 e!496626))))

(declare-fun mapRest!28520 () (Array (_ BitVec 32) ValueCell!8507))

(declare-fun mapKey!28520 () (_ BitVec 32))

(declare-fun mapValue!28520 () ValueCell!8507)

(assert (=> mapNonEmpty!28520 (= (arr!24989 (_values!5197 thiss!1181)) (store mapRest!28520 mapKey!28520 mapValue!28520))))

(declare-fun b!890674 () Bool)

(assert (=> b!890674 (= e!496625 e!496628)))

(declare-fun res!603311 () Bool)

(assert (=> b!890674 (=> (not res!603311) (not e!496628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890674 (= res!603311 (validMask!0 (mask!25712 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8736 0))(
  ( (MissingZero!8736 (index!37315 (_ BitVec 32))) (Found!8736 (index!37316 (_ BitVec 32))) (Intermediate!8736 (undefined!9548 Bool) (index!37317 (_ BitVec 32)) (x!75526 (_ BitVec 32))) (Undefined!8736) (MissingVacant!8736 (index!37318 (_ BitVec 32))) )
))
(declare-fun lt!402467 () SeekEntryResult!8736)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51973 (_ BitVec 32)) SeekEntryResult!8736)

(assert (=> b!890674 (= lt!402467 (seekEntry!0 key!785 (_keys!9923 thiss!1181) (mask!25712 thiss!1181)))))

(declare-fun b!890675 () Bool)

(assert (=> b!890675 (= e!496626 tp_is_empty!17977)))

(declare-fun b!890676 () Bool)

(declare-fun res!603309 () Bool)

(assert (=> b!890676 (=> (not res!603309) (not e!496628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51973 (_ BitVec 32)) Bool)

(assert (=> b!890676 (= res!603309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9923 thiss!1181) (mask!25712 thiss!1181)))))

(declare-fun b!890677 () Bool)

(declare-fun res!603313 () Bool)

(assert (=> b!890677 (=> (not res!603313) (not e!496625))))

(assert (=> b!890677 (= res!603313 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890678 () Bool)

(assert (=> b!890678 (= e!496627 tp_is_empty!17977)))

(declare-fun mapIsEmpty!28520 () Bool)

(assert (=> mapIsEmpty!28520 mapRes!28520))

(declare-fun b!890679 () Bool)

(declare-fun res!603310 () Bool)

(assert (=> b!890679 (=> (not res!603310) (not e!496628))))

(assert (=> b!890679 (= res!603310 (and (= (size!25434 (_values!5197 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25712 thiss!1181))) (= (size!25433 (_keys!9923 thiss!1181)) (size!25434 (_values!5197 thiss!1181))) (bvsge (mask!25712 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4906 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4906 thiss!1181) #b00000000000000000000000000000011)))))

(assert (= (and start!75846 res!603312) b!890677))

(assert (= (and b!890677 res!603313) b!890674))

(assert (= (and b!890674 res!603311) b!890679))

(assert (= (and b!890679 res!603310) b!890676))

(assert (= (and b!890676 res!603309) b!890672))

(assert (= (and b!890673 condMapEmpty!28520) mapIsEmpty!28520))

(assert (= (and b!890673 (not condMapEmpty!28520)) mapNonEmpty!28520))

(get-info :version)

(assert (= (and mapNonEmpty!28520 ((_ is ValueCellFull!8507) mapValue!28520)) b!890675))

(assert (= (and b!890673 ((_ is ValueCellFull!8507) mapDefault!28520)) b!890678))

(assert (= b!890671 b!890673))

(assert (= start!75846 b!890671))

(declare-fun m!829843 () Bool)

(assert (=> b!890674 m!829843))

(declare-fun m!829845 () Bool)

(assert (=> b!890674 m!829845))

(declare-fun m!829847 () Bool)

(assert (=> start!75846 m!829847))

(declare-fun m!829849 () Bool)

(assert (=> b!890676 m!829849))

(declare-fun m!829851 () Bool)

(assert (=> b!890672 m!829851))

(declare-fun m!829853 () Bool)

(assert (=> b!890671 m!829853))

(declare-fun m!829855 () Bool)

(assert (=> b!890671 m!829855))

(declare-fun m!829857 () Bool)

(assert (=> mapNonEmpty!28520 m!829857))

(check-sat (not b!890676) (not mapNonEmpty!28520) (not b!890671) b_and!25899 (not start!75846) (not b!890674) (not b_next!15649) (not b!890672) tp_is_empty!17977)
(check-sat b_and!25899 (not b_next!15649))
