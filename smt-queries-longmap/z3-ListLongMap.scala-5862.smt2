; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75684 () Bool)

(assert start!75684)

(declare-fun b!889835 () Bool)

(declare-fun b_free!15673 () Bool)

(declare-fun b_next!15673 () Bool)

(assert (=> b!889835 (= b_free!15673 (not b_next!15673))))

(declare-fun tp!54988 () Bool)

(declare-fun b_and!25887 () Bool)

(assert (=> b!889835 (= tp!54988 b_and!25887)))

(declare-fun b!889832 () Bool)

(declare-fun res!603015 () Bool)

(declare-fun e!496150 () Bool)

(assert (=> b!889832 (=> (not res!603015) (not e!496150))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889832 (= res!603015 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!28556 () Bool)

(declare-fun mapRes!28556 () Bool)

(assert (=> mapIsEmpty!28556 mapRes!28556))

(declare-fun b!889833 () Bool)

(assert (=> b!889833 (= e!496150 (not true))))

(declare-fun e!496151 () Bool)

(assert (=> b!889833 e!496151))

(declare-fun res!603013 () Bool)

(assert (=> b!889833 (=> res!603013 e!496151)))

(declare-datatypes ((SeekEntryResult!8791 0))(
  ( (MissingZero!8791 (index!37535 (_ BitVec 32))) (Found!8791 (index!37536 (_ BitVec 32))) (Intermediate!8791 (undefined!9603 Bool) (index!37537 (_ BitVec 32)) (x!75594 (_ BitVec 32))) (Undefined!8791) (MissingVacant!8791 (index!37538 (_ BitVec 32))) )
))
(declare-fun lt!401942 () SeekEntryResult!8791)

(get-info :version)

(assert (=> b!889833 (= res!603013 (not ((_ is Found!8791) lt!401942)))))

(declare-datatypes ((Unit!30226 0))(
  ( (Unit!30227) )
))
(declare-fun lt!401941 () Unit!30226)

(declare-datatypes ((array!51965 0))(
  ( (array!51966 (arr!24989 (Array (_ BitVec 32) (_ BitVec 64))) (size!25435 (_ BitVec 32))) )
))
(declare-datatypes ((V!28967 0))(
  ( (V!28968 (val!9051 Int)) )
))
(declare-datatypes ((ValueCell!8519 0))(
  ( (ValueCellFull!8519 (v!11523 V!28967)) (EmptyCell!8519) )
))
(declare-datatypes ((array!51967 0))(
  ( (array!51968 (arr!24990 (Array (_ BitVec 32) ValueCell!8519)) (size!25436 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4054 0))(
  ( (LongMapFixedSize!4055 (defaultEntry!5224 Int) (mask!25682 (_ BitVec 32)) (extraKeys!4918 (_ BitVec 32)) (zeroValue!5022 V!28967) (minValue!5022 V!28967) (_size!2082 (_ BitVec 32)) (_keys!9902 array!51965) (_values!5209 array!51967) (_vacant!2082 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4054)

(declare-fun lemmaSeekEntryGivesInRangeIndex!4 (array!51965 array!51967 (_ BitVec 32) (_ BitVec 32) V!28967 V!28967 (_ BitVec 64)) Unit!30226)

(assert (=> b!889833 (= lt!401941 (lemmaSeekEntryGivesInRangeIndex!4 (_keys!9902 thiss!1181) (_values!5209 thiss!1181) (mask!25682 thiss!1181) (extraKeys!4918 thiss!1181) (zeroValue!5022 thiss!1181) (minValue!5022 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51965 (_ BitVec 32)) SeekEntryResult!8791)

(assert (=> b!889833 (= lt!401942 (seekEntry!0 key!785 (_keys!9902 thiss!1181) (mask!25682 thiss!1181)))))

(declare-fun mapNonEmpty!28556 () Bool)

(declare-fun tp!54989 () Bool)

(declare-fun e!496148 () Bool)

(assert (=> mapNonEmpty!28556 (= mapRes!28556 (and tp!54989 e!496148))))

(declare-fun mapKey!28556 () (_ BitVec 32))

(declare-fun mapRest!28556 () (Array (_ BitVec 32) ValueCell!8519))

(declare-fun mapValue!28556 () ValueCell!8519)

(assert (=> mapNonEmpty!28556 (= (arr!24990 (_values!5209 thiss!1181)) (store mapRest!28556 mapKey!28556 mapValue!28556))))

(declare-fun b!889834 () Bool)

(declare-fun e!496149 () Bool)

(declare-fun e!496147 () Bool)

(assert (=> b!889834 (= e!496149 (and e!496147 mapRes!28556))))

(declare-fun condMapEmpty!28556 () Bool)

(declare-fun mapDefault!28556 () ValueCell!8519)

(assert (=> b!889834 (= condMapEmpty!28556 (= (arr!24990 (_values!5209 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8519)) mapDefault!28556)))))

(declare-fun e!496146 () Bool)

(declare-fun tp_is_empty!18001 () Bool)

(declare-fun array_inv!19700 (array!51965) Bool)

(declare-fun array_inv!19701 (array!51967) Bool)

(assert (=> b!889835 (= e!496146 (and tp!54988 tp_is_empty!18001 (array_inv!19700 (_keys!9902 thiss!1181)) (array_inv!19701 (_values!5209 thiss!1181)) e!496149))))

(declare-fun b!889836 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!889836 (= e!496151 (inRange!0 (index!37536 lt!401942) (mask!25682 thiss!1181)))))

(declare-fun b!889837 () Bool)

(assert (=> b!889837 (= e!496147 tp_is_empty!18001)))

(declare-fun b!889831 () Bool)

(assert (=> b!889831 (= e!496148 tp_is_empty!18001)))

(declare-fun res!603014 () Bool)

(assert (=> start!75684 (=> (not res!603014) (not e!496150))))

(declare-fun valid!1584 (LongMapFixedSize!4054) Bool)

(assert (=> start!75684 (= res!603014 (valid!1584 thiss!1181))))

(assert (=> start!75684 e!496150))

(assert (=> start!75684 e!496146))

(assert (=> start!75684 true))

(assert (= (and start!75684 res!603014) b!889832))

(assert (= (and b!889832 res!603015) b!889833))

(assert (= (and b!889833 (not res!603013)) b!889836))

(assert (= (and b!889834 condMapEmpty!28556) mapIsEmpty!28556))

(assert (= (and b!889834 (not condMapEmpty!28556)) mapNonEmpty!28556))

(assert (= (and mapNonEmpty!28556 ((_ is ValueCellFull!8519) mapValue!28556)) b!889831))

(assert (= (and b!889834 ((_ is ValueCellFull!8519) mapDefault!28556)) b!889837))

(assert (= b!889835 b!889834))

(assert (= start!75684 b!889835))

(declare-fun m!827977 () Bool)

(assert (=> start!75684 m!827977))

(declare-fun m!827979 () Bool)

(assert (=> b!889833 m!827979))

(declare-fun m!827981 () Bool)

(assert (=> b!889833 m!827981))

(declare-fun m!827983 () Bool)

(assert (=> mapNonEmpty!28556 m!827983))

(declare-fun m!827985 () Bool)

(assert (=> b!889835 m!827985))

(declare-fun m!827987 () Bool)

(assert (=> b!889835 m!827987))

(declare-fun m!827989 () Bool)

(assert (=> b!889836 m!827989))

(check-sat (not b!889833) (not b!889835) (not start!75684) (not b_next!15673) (not b!889836) (not mapNonEmpty!28556) tp_is_empty!18001 b_and!25887)
(check-sat b_and!25887 (not b_next!15673))
