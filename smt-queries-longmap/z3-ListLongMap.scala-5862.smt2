; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75870 () Bool)

(assert start!75870)

(declare-fun b!890979 () Bool)

(declare-fun b_free!15673 () Bool)

(declare-fun b_next!15673 () Bool)

(assert (=> b!890979 (= b_free!15673 (not b_next!15673))))

(declare-fun tp!54988 () Bool)

(declare-fun b_and!25923 () Bool)

(assert (=> b!890979 (= tp!54988 b_and!25923)))

(declare-fun res!603468 () Bool)

(declare-fun e!496879 () Bool)

(assert (=> start!75870 (=> (not res!603468) (not e!496879))))

(declare-datatypes ((array!52021 0))(
  ( (array!52022 (arr!25012 (Array (_ BitVec 32) (_ BitVec 64))) (size!25457 (_ BitVec 32))) )
))
(declare-datatypes ((V!28967 0))(
  ( (V!28968 (val!9051 Int)) )
))
(declare-datatypes ((ValueCell!8519 0))(
  ( (ValueCellFull!8519 (v!11526 V!28967)) (EmptyCell!8519) )
))
(declare-datatypes ((array!52023 0))(
  ( (array!52024 (arr!25013 (Array (_ BitVec 32) ValueCell!8519)) (size!25458 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4054 0))(
  ( (LongMapFixedSize!4055 (defaultEntry!5224 Int) (mask!25732 (_ BitVec 32)) (extraKeys!4918 (_ BitVec 32)) (zeroValue!5022 V!28967) (minValue!5022 V!28967) (_size!2082 (_ BitVec 32)) (_keys!9935 array!52021) (_values!5209 array!52023) (_vacant!2082 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4054)

(declare-fun valid!1586 (LongMapFixedSize!4054) Bool)

(assert (=> start!75870 (= res!603468 (valid!1586 thiss!1181))))

(assert (=> start!75870 e!496879))

(declare-fun e!496877 () Bool)

(assert (=> start!75870 e!496877))

(assert (=> start!75870 true))

(declare-fun b!890973 () Bool)

(declare-fun e!496880 () Bool)

(declare-fun e!496878 () Bool)

(declare-fun mapRes!28556 () Bool)

(assert (=> b!890973 (= e!496880 (and e!496878 mapRes!28556))))

(declare-fun condMapEmpty!28556 () Bool)

(declare-fun mapDefault!28556 () ValueCell!8519)

(assert (=> b!890973 (= condMapEmpty!28556 (= (arr!25013 (_values!5209 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8519)) mapDefault!28556)))))

(declare-fun mapNonEmpty!28556 () Bool)

(declare-fun tp!54989 () Bool)

(declare-fun e!496875 () Bool)

(assert (=> mapNonEmpty!28556 (= mapRes!28556 (and tp!54989 e!496875))))

(declare-fun mapRest!28556 () (Array (_ BitVec 32) ValueCell!8519))

(declare-fun mapKey!28556 () (_ BitVec 32))

(declare-fun mapValue!28556 () ValueCell!8519)

(assert (=> mapNonEmpty!28556 (= (arr!25013 (_values!5209 thiss!1181)) (store mapRest!28556 mapKey!28556 mapValue!28556))))

(declare-fun b!890974 () Bool)

(assert (=> b!890974 (= e!496879 (not true))))

(declare-fun e!496881 () Bool)

(assert (=> b!890974 e!496881))

(declare-fun res!603467 () Bool)

(assert (=> b!890974 (=> res!603467 e!496881)))

(declare-datatypes ((SeekEntryResult!8744 0))(
  ( (MissingZero!8744 (index!37347 (_ BitVec 32))) (Found!8744 (index!37348 (_ BitVec 32))) (Intermediate!8744 (undefined!9556 Bool) (index!37349 (_ BitVec 32)) (x!75566 (_ BitVec 32))) (Undefined!8744) (MissingVacant!8744 (index!37350 (_ BitVec 32))) )
))
(declare-fun lt!402539 () SeekEntryResult!8744)

(get-info :version)

(assert (=> b!890974 (= res!603467 (not ((_ is Found!8744) lt!402539)))))

(declare-datatypes ((Unit!30264 0))(
  ( (Unit!30265) )
))
(declare-fun lt!402538 () Unit!30264)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!4 (array!52021 array!52023 (_ BitVec 32) (_ BitVec 32) V!28967 V!28967 (_ BitVec 64)) Unit!30264)

(assert (=> b!890974 (= lt!402538 (lemmaSeekEntryGivesInRangeIndex!4 (_keys!9935 thiss!1181) (_values!5209 thiss!1181) (mask!25732 thiss!1181) (extraKeys!4918 thiss!1181) (zeroValue!5022 thiss!1181) (minValue!5022 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52021 (_ BitVec 32)) SeekEntryResult!8744)

(assert (=> b!890974 (= lt!402539 (seekEntry!0 key!785 (_keys!9935 thiss!1181) (mask!25732 thiss!1181)))))

(declare-fun b!890975 () Bool)

(declare-fun tp_is_empty!18001 () Bool)

(assert (=> b!890975 (= e!496878 tp_is_empty!18001)))

(declare-fun mapIsEmpty!28556 () Bool)

(assert (=> mapIsEmpty!28556 mapRes!28556))

(declare-fun b!890976 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890976 (= e!496881 (inRange!0 (index!37348 lt!402539) (mask!25732 thiss!1181)))))

(declare-fun b!890977 () Bool)

(declare-fun res!603469 () Bool)

(assert (=> b!890977 (=> (not res!603469) (not e!496879))))

(assert (=> b!890977 (= res!603469 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890978 () Bool)

(assert (=> b!890978 (= e!496875 tp_is_empty!18001)))

(declare-fun array_inv!19716 (array!52021) Bool)

(declare-fun array_inv!19717 (array!52023) Bool)

(assert (=> b!890979 (= e!496877 (and tp!54988 tp_is_empty!18001 (array_inv!19716 (_keys!9935 thiss!1181)) (array_inv!19717 (_values!5209 thiss!1181)) e!496880))))

(assert (= (and start!75870 res!603468) b!890977))

(assert (= (and b!890977 res!603469) b!890974))

(assert (= (and b!890974 (not res!603467)) b!890976))

(assert (= (and b!890973 condMapEmpty!28556) mapIsEmpty!28556))

(assert (= (and b!890973 (not condMapEmpty!28556)) mapNonEmpty!28556))

(assert (= (and mapNonEmpty!28556 ((_ is ValueCellFull!8519) mapValue!28556)) b!890978))

(assert (= (and b!890973 ((_ is ValueCellFull!8519) mapDefault!28556)) b!890975))

(assert (= b!890979 b!890973))

(assert (= start!75870 b!890979))

(declare-fun m!830029 () Bool)

(assert (=> start!75870 m!830029))

(declare-fun m!830031 () Bool)

(assert (=> mapNonEmpty!28556 m!830031))

(declare-fun m!830033 () Bool)

(assert (=> b!890979 m!830033))

(declare-fun m!830035 () Bool)

(assert (=> b!890979 m!830035))

(declare-fun m!830037 () Bool)

(assert (=> b!890976 m!830037))

(declare-fun m!830039 () Bool)

(assert (=> b!890974 m!830039))

(declare-fun m!830041 () Bool)

(assert (=> b!890974 m!830041))

(check-sat (not start!75870) (not mapNonEmpty!28556) b_and!25923 (not b!890974) (not b!890979) (not b!890976) (not b_next!15673) tp_is_empty!18001)
(check-sat b_and!25923 (not b_next!15673))
