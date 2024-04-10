; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75698 () Bool)

(assert start!75698)

(declare-fun b!890033 () Bool)

(declare-fun b_free!15669 () Bool)

(declare-fun b_next!15669 () Bool)

(assert (=> b!890033 (= b_free!15669 (not b_next!15669))))

(declare-fun tp!54976 () Bool)

(declare-fun b_and!25909 () Bool)

(assert (=> b!890033 (= tp!54976 b_and!25909)))

(declare-fun b!890028 () Bool)

(declare-fun e!496254 () Bool)

(declare-fun tp_is_empty!17997 () Bool)

(assert (=> b!890028 (= e!496254 tp_is_empty!17997)))

(declare-fun mapIsEmpty!28550 () Bool)

(declare-fun mapRes!28550 () Bool)

(assert (=> mapIsEmpty!28550 mapRes!28550))

(declare-fun mapNonEmpty!28550 () Bool)

(declare-fun tp!54975 () Bool)

(declare-fun e!496252 () Bool)

(assert (=> mapNonEmpty!28550 (= mapRes!28550 (and tp!54975 e!496252))))

(declare-datatypes ((V!28961 0))(
  ( (V!28962 (val!9049 Int)) )
))
(declare-datatypes ((ValueCell!8517 0))(
  ( (ValueCellFull!8517 (v!11527 V!28961)) (EmptyCell!8517) )
))
(declare-fun mapRest!28550 () (Array (_ BitVec 32) ValueCell!8517))

(declare-fun mapValue!28550 () ValueCell!8517)

(declare-datatypes ((array!51974 0))(
  ( (array!51975 (arr!24993 (Array (_ BitVec 32) (_ BitVec 64))) (size!25437 (_ BitVec 32))) )
))
(declare-datatypes ((array!51976 0))(
  ( (array!51977 (arr!24994 (Array (_ BitVec 32) ValueCell!8517)) (size!25438 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4050 0))(
  ( (LongMapFixedSize!4051 (defaultEntry!5222 Int) (mask!25685 (_ BitVec 32)) (extraKeys!4916 (_ BitVec 32)) (zeroValue!5020 V!28961) (minValue!5020 V!28961) (_size!2080 (_ BitVec 32)) (_keys!9905 array!51974) (_values!5207 array!51976) (_vacant!2080 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4050)

(declare-fun mapKey!28550 () (_ BitVec 32))

(assert (=> mapNonEmpty!28550 (= (arr!24994 (_values!5207 thiss!1181)) (store mapRest!28550 mapKey!28550 mapValue!28550))))

(declare-fun b!890029 () Bool)

(declare-fun e!496251 () Bool)

(assert (=> b!890029 (= e!496251 (not true))))

(declare-fun e!496256 () Bool)

(assert (=> b!890029 e!496256))

(declare-fun res!603106 () Bool)

(assert (=> b!890029 (=> res!603106 e!496256)))

(declare-datatypes ((SeekEntryResult!8788 0))(
  ( (MissingZero!8788 (index!37523 (_ BitVec 32))) (Found!8788 (index!37524 (_ BitVec 32))) (Intermediate!8788 (undefined!9600 Bool) (index!37525 (_ BitVec 32)) (x!75588 (_ BitVec 32))) (Undefined!8788) (MissingVacant!8788 (index!37526 (_ BitVec 32))) )
))
(declare-fun lt!402166 () SeekEntryResult!8788)

(get-info :version)

(assert (=> b!890029 (= res!603106 (not ((_ is Found!8788) lt!402166)))))

(declare-datatypes ((Unit!30282 0))(
  ( (Unit!30283) )
))
(declare-fun lt!402165 () Unit!30282)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!3 (array!51974 array!51976 (_ BitVec 32) (_ BitVec 32) V!28961 V!28961 (_ BitVec 64)) Unit!30282)

(assert (=> b!890029 (= lt!402165 (lemmaSeekEntryGivesInRangeIndex!3 (_keys!9905 thiss!1181) (_values!5207 thiss!1181) (mask!25685 thiss!1181) (extraKeys!4916 thiss!1181) (zeroValue!5020 thiss!1181) (minValue!5020 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51974 (_ BitVec 32)) SeekEntryResult!8788)

(assert (=> b!890029 (= lt!402166 (seekEntry!0 key!785 (_keys!9905 thiss!1181) (mask!25685 thiss!1181)))))

(declare-fun res!603107 () Bool)

(assert (=> start!75698 (=> (not res!603107) (not e!496251))))

(declare-fun valid!1572 (LongMapFixedSize!4050) Bool)

(assert (=> start!75698 (= res!603107 (valid!1572 thiss!1181))))

(assert (=> start!75698 e!496251))

(declare-fun e!496257 () Bool)

(assert (=> start!75698 e!496257))

(assert (=> start!75698 true))

(declare-fun b!890030 () Bool)

(declare-fun res!603105 () Bool)

(assert (=> b!890030 (=> (not res!603105) (not e!496251))))

(assert (=> b!890030 (= res!603105 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890031 () Bool)

(declare-fun e!496253 () Bool)

(assert (=> b!890031 (= e!496253 (and e!496254 mapRes!28550))))

(declare-fun condMapEmpty!28550 () Bool)

(declare-fun mapDefault!28550 () ValueCell!8517)

(assert (=> b!890031 (= condMapEmpty!28550 (= (arr!24994 (_values!5207 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8517)) mapDefault!28550)))))

(declare-fun b!890032 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890032 (= e!496256 (inRange!0 (index!37524 lt!402166) (mask!25685 thiss!1181)))))

(declare-fun array_inv!19654 (array!51974) Bool)

(declare-fun array_inv!19655 (array!51976) Bool)

(assert (=> b!890033 (= e!496257 (and tp!54976 tp_is_empty!17997 (array_inv!19654 (_keys!9905 thiss!1181)) (array_inv!19655 (_values!5207 thiss!1181)) e!496253))))

(declare-fun b!890034 () Bool)

(assert (=> b!890034 (= e!496252 tp_is_empty!17997)))

(assert (= (and start!75698 res!603107) b!890030))

(assert (= (and b!890030 res!603105) b!890029))

(assert (= (and b!890029 (not res!603106)) b!890032))

(assert (= (and b!890031 condMapEmpty!28550) mapIsEmpty!28550))

(assert (= (and b!890031 (not condMapEmpty!28550)) mapNonEmpty!28550))

(assert (= (and mapNonEmpty!28550 ((_ is ValueCellFull!8517) mapValue!28550)) b!890034))

(assert (= (and b!890031 ((_ is ValueCellFull!8517) mapDefault!28550)) b!890028))

(assert (= b!890033 b!890031))

(assert (= start!75698 b!890033))

(declare-fun m!828707 () Bool)

(assert (=> start!75698 m!828707))

(declare-fun m!828709 () Bool)

(assert (=> b!890032 m!828709))

(declare-fun m!828711 () Bool)

(assert (=> mapNonEmpty!28550 m!828711))

(declare-fun m!828713 () Bool)

(assert (=> b!890033 m!828713))

(declare-fun m!828715 () Bool)

(assert (=> b!890033 m!828715))

(declare-fun m!828717 () Bool)

(assert (=> b!890029 m!828717))

(declare-fun m!828719 () Bool)

(assert (=> b!890029 m!828719))

(check-sat (not b!890032) (not mapNonEmpty!28550) (not start!75698) (not b!890029) (not b_next!15669) tp_is_empty!17997 (not b!890033) b_and!25909)
(check-sat b_and!25909 (not b_next!15669))
