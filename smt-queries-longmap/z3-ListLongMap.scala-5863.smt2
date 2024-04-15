; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75690 () Bool)

(assert start!75690)

(declare-fun b!889897 () Bool)

(declare-fun b_free!15679 () Bool)

(declare-fun b_next!15679 () Bool)

(assert (=> b!889897 (= b_free!15679 (not b_next!15679))))

(declare-fun tp!55007 () Bool)

(declare-fun b_and!25893 () Bool)

(assert (=> b!889897 (= tp!55007 b_and!25893)))

(declare-fun b!889894 () Bool)

(declare-fun e!496211 () Bool)

(declare-fun e!496214 () Bool)

(declare-fun mapRes!28565 () Bool)

(assert (=> b!889894 (= e!496211 (and e!496214 mapRes!28565))))

(declare-fun condMapEmpty!28565 () Bool)

(declare-datatypes ((array!51977 0))(
  ( (array!51978 (arr!24995 (Array (_ BitVec 32) (_ BitVec 64))) (size!25441 (_ BitVec 32))) )
))
(declare-datatypes ((V!28975 0))(
  ( (V!28976 (val!9054 Int)) )
))
(declare-datatypes ((ValueCell!8522 0))(
  ( (ValueCellFull!8522 (v!11526 V!28975)) (EmptyCell!8522) )
))
(declare-datatypes ((array!51979 0))(
  ( (array!51980 (arr!24996 (Array (_ BitVec 32) ValueCell!8522)) (size!25442 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4060 0))(
  ( (LongMapFixedSize!4061 (defaultEntry!5227 Int) (mask!25687 (_ BitVec 32)) (extraKeys!4921 (_ BitVec 32)) (zeroValue!5025 V!28975) (minValue!5025 V!28975) (_size!2085 (_ BitVec 32)) (_keys!9905 array!51977) (_values!5212 array!51979) (_vacant!2085 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4060)

(declare-fun mapDefault!28565 () ValueCell!8522)

(assert (=> b!889894 (= condMapEmpty!28565 (= (arr!24996 (_values!5212 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8522)) mapDefault!28565)))))

(declare-fun mapIsEmpty!28565 () Bool)

(assert (=> mapIsEmpty!28565 mapRes!28565))

(declare-fun res!603041 () Bool)

(declare-fun e!496210 () Bool)

(assert (=> start!75690 (=> (not res!603041) (not e!496210))))

(declare-fun valid!1587 (LongMapFixedSize!4060) Bool)

(assert (=> start!75690 (= res!603041 (valid!1587 thiss!1181))))

(assert (=> start!75690 e!496210))

(declare-fun e!496212 () Bool)

(assert (=> start!75690 e!496212))

(assert (=> start!75690 true))

(declare-fun mapNonEmpty!28565 () Bool)

(declare-fun tp!55006 () Bool)

(declare-fun e!496208 () Bool)

(assert (=> mapNonEmpty!28565 (= mapRes!28565 (and tp!55006 e!496208))))

(declare-fun mapRest!28565 () (Array (_ BitVec 32) ValueCell!8522))

(declare-fun mapValue!28565 () ValueCell!8522)

(declare-fun mapKey!28565 () (_ BitVec 32))

(assert (=> mapNonEmpty!28565 (= (arr!24996 (_values!5212 thiss!1181)) (store mapRest!28565 mapKey!28565 mapValue!28565))))

(declare-fun b!889895 () Bool)

(declare-fun res!603042 () Bool)

(assert (=> b!889895 (=> (not res!603042) (not e!496210))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889895 (= res!603042 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889896 () Bool)

(declare-fun tp_is_empty!18007 () Bool)

(assert (=> b!889896 (= e!496214 tp_is_empty!18007)))

(declare-fun array_inv!19704 (array!51977) Bool)

(declare-fun array_inv!19705 (array!51979) Bool)

(assert (=> b!889897 (= e!496212 (and tp!55007 tp_is_empty!18007 (array_inv!19704 (_keys!9905 thiss!1181)) (array_inv!19705 (_values!5212 thiss!1181)) e!496211))))

(declare-fun b!889898 () Bool)

(assert (=> b!889898 (= e!496210 (not true))))

(declare-fun e!496213 () Bool)

(assert (=> b!889898 e!496213))

(declare-fun res!603040 () Bool)

(assert (=> b!889898 (=> res!603040 e!496213)))

(declare-datatypes ((SeekEntryResult!8792 0))(
  ( (MissingZero!8792 (index!37539 (_ BitVec 32))) (Found!8792 (index!37540 (_ BitVec 32))) (Intermediate!8792 (undefined!9604 Bool) (index!37541 (_ BitVec 32)) (x!75603 (_ BitVec 32))) (Undefined!8792) (MissingVacant!8792 (index!37542 (_ BitVec 32))) )
))
(declare-fun lt!401960 () SeekEntryResult!8792)

(get-info :version)

(assert (=> b!889898 (= res!603040 (not ((_ is Found!8792) lt!401960)))))

(declare-datatypes ((Unit!30228 0))(
  ( (Unit!30229) )
))
(declare-fun lt!401959 () Unit!30228)

(declare-fun lemmaSeekEntryGivesInRangeIndex!5 (array!51977 array!51979 (_ BitVec 32) (_ BitVec 32) V!28975 V!28975 (_ BitVec 64)) Unit!30228)

(assert (=> b!889898 (= lt!401959 (lemmaSeekEntryGivesInRangeIndex!5 (_keys!9905 thiss!1181) (_values!5212 thiss!1181) (mask!25687 thiss!1181) (extraKeys!4921 thiss!1181) (zeroValue!5025 thiss!1181) (minValue!5025 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51977 (_ BitVec 32)) SeekEntryResult!8792)

(assert (=> b!889898 (= lt!401960 (seekEntry!0 key!785 (_keys!9905 thiss!1181) (mask!25687 thiss!1181)))))

(declare-fun b!889899 () Bool)

(assert (=> b!889899 (= e!496208 tp_is_empty!18007)))

(declare-fun b!889900 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!889900 (= e!496213 (inRange!0 (index!37540 lt!401960) (mask!25687 thiss!1181)))))

(assert (= (and start!75690 res!603041) b!889895))

(assert (= (and b!889895 res!603042) b!889898))

(assert (= (and b!889898 (not res!603040)) b!889900))

(assert (= (and b!889894 condMapEmpty!28565) mapIsEmpty!28565))

(assert (= (and b!889894 (not condMapEmpty!28565)) mapNonEmpty!28565))

(assert (= (and mapNonEmpty!28565 ((_ is ValueCellFull!8522) mapValue!28565)) b!889899))

(assert (= (and b!889894 ((_ is ValueCellFull!8522) mapDefault!28565)) b!889896))

(assert (= b!889897 b!889894))

(assert (= start!75690 b!889897))

(declare-fun m!828019 () Bool)

(assert (=> b!889900 m!828019))

(declare-fun m!828021 () Bool)

(assert (=> b!889898 m!828021))

(declare-fun m!828023 () Bool)

(assert (=> b!889898 m!828023))

(declare-fun m!828025 () Bool)

(assert (=> mapNonEmpty!28565 m!828025))

(declare-fun m!828027 () Bool)

(assert (=> b!889897 m!828027))

(declare-fun m!828029 () Bool)

(assert (=> b!889897 m!828029))

(declare-fun m!828031 () Bool)

(assert (=> start!75690 m!828031))

(check-sat (not mapNonEmpty!28565) (not b!889900) (not b_next!15679) b_and!25893 tp_is_empty!18007 (not start!75690) (not b!889897) (not b!889898))
(check-sat b_and!25893 (not b_next!15679))
