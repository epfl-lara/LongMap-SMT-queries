; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75876 () Bool)

(assert start!75876)

(declare-fun b!891041 () Bool)

(declare-fun b_free!15679 () Bool)

(declare-fun b_next!15679 () Bool)

(assert (=> b!891041 (= b_free!15679 (not b_next!15679))))

(declare-fun tp!55007 () Bool)

(declare-fun b_and!25929 () Bool)

(assert (=> b!891041 (= tp!55007 b_and!25929)))

(declare-fun b!891036 () Bool)

(declare-fun e!496943 () Bool)

(declare-fun tp_is_empty!18007 () Bool)

(assert (=> b!891036 (= e!496943 tp_is_empty!18007)))

(declare-fun b!891037 () Bool)

(declare-fun res!603496 () Bool)

(declare-fun e!496938 () Bool)

(assert (=> b!891037 (=> (not res!603496) (not e!496938))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!891037 (= res!603496 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!28565 () Bool)

(declare-fun mapRes!28565 () Bool)

(declare-fun tp!55006 () Bool)

(assert (=> mapNonEmpty!28565 (= mapRes!28565 (and tp!55006 e!496943))))

(declare-fun mapKey!28565 () (_ BitVec 32))

(declare-datatypes ((array!52033 0))(
  ( (array!52034 (arr!25018 (Array (_ BitVec 32) (_ BitVec 64))) (size!25463 (_ BitVec 32))) )
))
(declare-datatypes ((V!28975 0))(
  ( (V!28976 (val!9054 Int)) )
))
(declare-datatypes ((ValueCell!8522 0))(
  ( (ValueCellFull!8522 (v!11529 V!28975)) (EmptyCell!8522) )
))
(declare-datatypes ((array!52035 0))(
  ( (array!52036 (arr!25019 (Array (_ BitVec 32) ValueCell!8522)) (size!25464 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4060 0))(
  ( (LongMapFixedSize!4061 (defaultEntry!5227 Int) (mask!25737 (_ BitVec 32)) (extraKeys!4921 (_ BitVec 32)) (zeroValue!5025 V!28975) (minValue!5025 V!28975) (_size!2085 (_ BitVec 32)) (_keys!9938 array!52033) (_values!5212 array!52035) (_vacant!2085 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4060)

(declare-fun mapRest!28565 () (Array (_ BitVec 32) ValueCell!8522))

(declare-fun mapValue!28565 () ValueCell!8522)

(assert (=> mapNonEmpty!28565 (= (arr!25019 (_values!5212 thiss!1181)) (store mapRest!28565 mapKey!28565 mapValue!28565))))

(declare-fun mapIsEmpty!28565 () Bool)

(assert (=> mapIsEmpty!28565 mapRes!28565))

(declare-fun b!891038 () Bool)

(declare-fun e!496941 () Bool)

(declare-fun e!496942 () Bool)

(assert (=> b!891038 (= e!496941 (and e!496942 mapRes!28565))))

(declare-fun condMapEmpty!28565 () Bool)

(declare-fun mapDefault!28565 () ValueCell!8522)

(assert (=> b!891038 (= condMapEmpty!28565 (= (arr!25019 (_values!5212 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8522)) mapDefault!28565)))))

(declare-fun b!891039 () Bool)

(assert (=> b!891039 (= e!496938 (not true))))

(declare-fun e!496940 () Bool)

(assert (=> b!891039 e!496940))

(declare-fun res!603494 () Bool)

(assert (=> b!891039 (=> res!603494 e!496940)))

(declare-datatypes ((SeekEntryResult!8747 0))(
  ( (MissingZero!8747 (index!37359 (_ BitVec 32))) (Found!8747 (index!37360 (_ BitVec 32))) (Intermediate!8747 (undefined!9559 Bool) (index!37361 (_ BitVec 32)) (x!75577 (_ BitVec 32))) (Undefined!8747) (MissingVacant!8747 (index!37362 (_ BitVec 32))) )
))
(declare-fun lt!402556 () SeekEntryResult!8747)

(get-info :version)

(assert (=> b!891039 (= res!603494 (not ((_ is Found!8747) lt!402556)))))

(declare-datatypes ((Unit!30268 0))(
  ( (Unit!30269) )
))
(declare-fun lt!402557 () Unit!30268)

(declare-fun lemmaSeekEntryGivesInRangeIndex!6 (array!52033 array!52035 (_ BitVec 32) (_ BitVec 32) V!28975 V!28975 (_ BitVec 64)) Unit!30268)

(assert (=> b!891039 (= lt!402557 (lemmaSeekEntryGivesInRangeIndex!6 (_keys!9938 thiss!1181) (_values!5212 thiss!1181) (mask!25737 thiss!1181) (extraKeys!4921 thiss!1181) (zeroValue!5025 thiss!1181) (minValue!5025 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52033 (_ BitVec 32)) SeekEntryResult!8747)

(assert (=> b!891039 (= lt!402556 (seekEntry!0 key!785 (_keys!9938 thiss!1181) (mask!25737 thiss!1181)))))

(declare-fun b!891040 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891040 (= e!496940 (inRange!0 (index!37360 lt!402556) (mask!25737 thiss!1181)))))

(declare-fun e!496944 () Bool)

(declare-fun array_inv!19718 (array!52033) Bool)

(declare-fun array_inv!19719 (array!52035) Bool)

(assert (=> b!891041 (= e!496944 (and tp!55007 tp_is_empty!18007 (array_inv!19718 (_keys!9938 thiss!1181)) (array_inv!19719 (_values!5212 thiss!1181)) e!496941))))

(declare-fun res!603495 () Bool)

(assert (=> start!75876 (=> (not res!603495) (not e!496938))))

(declare-fun valid!1589 (LongMapFixedSize!4060) Bool)

(assert (=> start!75876 (= res!603495 (valid!1589 thiss!1181))))

(assert (=> start!75876 e!496938))

(assert (=> start!75876 e!496944))

(assert (=> start!75876 true))

(declare-fun b!891042 () Bool)

(assert (=> b!891042 (= e!496942 tp_is_empty!18007)))

(assert (= (and start!75876 res!603495) b!891037))

(assert (= (and b!891037 res!603496) b!891039))

(assert (= (and b!891039 (not res!603494)) b!891040))

(assert (= (and b!891038 condMapEmpty!28565) mapIsEmpty!28565))

(assert (= (and b!891038 (not condMapEmpty!28565)) mapNonEmpty!28565))

(assert (= (and mapNonEmpty!28565 ((_ is ValueCellFull!8522) mapValue!28565)) b!891036))

(assert (= (and b!891038 ((_ is ValueCellFull!8522) mapDefault!28565)) b!891042))

(assert (= b!891041 b!891038))

(assert (= start!75876 b!891041))

(declare-fun m!830071 () Bool)

(assert (=> b!891040 m!830071))

(declare-fun m!830073 () Bool)

(assert (=> mapNonEmpty!28565 m!830073))

(declare-fun m!830075 () Bool)

(assert (=> b!891039 m!830075))

(declare-fun m!830077 () Bool)

(assert (=> b!891039 m!830077))

(declare-fun m!830079 () Bool)

(assert (=> b!891041 m!830079))

(declare-fun m!830081 () Bool)

(assert (=> b!891041 m!830081))

(declare-fun m!830083 () Bool)

(assert (=> start!75876 m!830083))

(check-sat (not b_next!15679) (not b!891040) (not mapNonEmpty!28565) (not start!75876) (not b!891041) b_and!25929 (not b!891039) tp_is_empty!18007)
(check-sat b_and!25929 (not b_next!15679))
