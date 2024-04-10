; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75704 () Bool)

(assert start!75704)

(declare-fun b!890094 () Bool)

(declare-fun b_free!15675 () Bool)

(declare-fun b_next!15675 () Bool)

(assert (=> b!890094 (= b_free!15675 (not b_next!15675))))

(declare-fun tp!54993 () Bool)

(declare-fun b_and!25915 () Bool)

(assert (=> b!890094 (= tp!54993 b_and!25915)))

(declare-fun b!890091 () Bool)

(declare-fun e!496318 () Bool)

(assert (=> b!890091 (= e!496318 (not true))))

(declare-fun e!496317 () Bool)

(assert (=> b!890091 e!496317))

(declare-fun res!603133 () Bool)

(assert (=> b!890091 (=> res!603133 e!496317)))

(declare-datatypes ((SeekEntryResult!8791 0))(
  ( (MissingZero!8791 (index!37535 (_ BitVec 32))) (Found!8791 (index!37536 (_ BitVec 32))) (Intermediate!8791 (undefined!9603 Bool) (index!37537 (_ BitVec 32)) (x!75599 (_ BitVec 32))) (Undefined!8791) (MissingVacant!8791 (index!37538 (_ BitVec 32))) )
))
(declare-fun lt!402183 () SeekEntryResult!8791)

(get-info :version)

(assert (=> b!890091 (= res!603133 (not ((_ is Found!8791) lt!402183)))))

(declare-datatypes ((Unit!30286 0))(
  ( (Unit!30287) )
))
(declare-fun lt!402184 () Unit!30286)

(declare-datatypes ((array!51986 0))(
  ( (array!51987 (arr!24999 (Array (_ BitVec 32) (_ BitVec 64))) (size!25443 (_ BitVec 32))) )
))
(declare-datatypes ((V!28969 0))(
  ( (V!28970 (val!9052 Int)) )
))
(declare-datatypes ((ValueCell!8520 0))(
  ( (ValueCellFull!8520 (v!11530 V!28969)) (EmptyCell!8520) )
))
(declare-datatypes ((array!51988 0))(
  ( (array!51989 (arr!25000 (Array (_ BitVec 32) ValueCell!8520)) (size!25444 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4056 0))(
  ( (LongMapFixedSize!4057 (defaultEntry!5225 Int) (mask!25690 (_ BitVec 32)) (extraKeys!4919 (_ BitVec 32)) (zeroValue!5023 V!28969) (minValue!5023 V!28969) (_size!2083 (_ BitVec 32)) (_keys!9908 array!51986) (_values!5210 array!51988) (_vacant!2083 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4056)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!5 (array!51986 array!51988 (_ BitVec 32) (_ BitVec 32) V!28969 V!28969 (_ BitVec 64)) Unit!30286)

(assert (=> b!890091 (= lt!402184 (lemmaSeekEntryGivesInRangeIndex!5 (_keys!9908 thiss!1181) (_values!5210 thiss!1181) (mask!25690 thiss!1181) (extraKeys!4919 thiss!1181) (zeroValue!5023 thiss!1181) (minValue!5023 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51986 (_ BitVec 32)) SeekEntryResult!8791)

(assert (=> b!890091 (= lt!402183 (seekEntry!0 key!785 (_keys!9908 thiss!1181) (mask!25690 thiss!1181)))))

(declare-fun b!890092 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890092 (= e!496317 (inRange!0 (index!37536 lt!402183) (mask!25690 thiss!1181)))))

(declare-fun b!890093 () Bool)

(declare-fun e!496319 () Bool)

(declare-fun e!496315 () Bool)

(declare-fun mapRes!28559 () Bool)

(assert (=> b!890093 (= e!496319 (and e!496315 mapRes!28559))))

(declare-fun condMapEmpty!28559 () Bool)

(declare-fun mapDefault!28559 () ValueCell!8520)

(assert (=> b!890093 (= condMapEmpty!28559 (= (arr!25000 (_values!5210 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8520)) mapDefault!28559)))))

(declare-fun tp_is_empty!18003 () Bool)

(declare-fun e!496314 () Bool)

(declare-fun array_inv!19658 (array!51986) Bool)

(declare-fun array_inv!19659 (array!51988) Bool)

(assert (=> b!890094 (= e!496314 (and tp!54993 tp_is_empty!18003 (array_inv!19658 (_keys!9908 thiss!1181)) (array_inv!19659 (_values!5210 thiss!1181)) e!496319))))

(declare-fun b!890095 () Bool)

(declare-fun e!496316 () Bool)

(assert (=> b!890095 (= e!496316 tp_is_empty!18003)))

(declare-fun b!890096 () Bool)

(assert (=> b!890096 (= e!496315 tp_is_empty!18003)))

(declare-fun b!890097 () Bool)

(declare-fun res!603132 () Bool)

(assert (=> b!890097 (=> (not res!603132) (not e!496318))))

(assert (=> b!890097 (= res!603132 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!28559 () Bool)

(declare-fun tp!54994 () Bool)

(assert (=> mapNonEmpty!28559 (= mapRes!28559 (and tp!54994 e!496316))))

(declare-fun mapRest!28559 () (Array (_ BitVec 32) ValueCell!8520))

(declare-fun mapValue!28559 () ValueCell!8520)

(declare-fun mapKey!28559 () (_ BitVec 32))

(assert (=> mapNonEmpty!28559 (= (arr!25000 (_values!5210 thiss!1181)) (store mapRest!28559 mapKey!28559 mapValue!28559))))

(declare-fun mapIsEmpty!28559 () Bool)

(assert (=> mapIsEmpty!28559 mapRes!28559))

(declare-fun res!603134 () Bool)

(assert (=> start!75704 (=> (not res!603134) (not e!496318))))

(declare-fun valid!1575 (LongMapFixedSize!4056) Bool)

(assert (=> start!75704 (= res!603134 (valid!1575 thiss!1181))))

(assert (=> start!75704 e!496318))

(assert (=> start!75704 e!496314))

(assert (=> start!75704 true))

(assert (= (and start!75704 res!603134) b!890097))

(assert (= (and b!890097 res!603132) b!890091))

(assert (= (and b!890091 (not res!603133)) b!890092))

(assert (= (and b!890093 condMapEmpty!28559) mapIsEmpty!28559))

(assert (= (and b!890093 (not condMapEmpty!28559)) mapNonEmpty!28559))

(assert (= (and mapNonEmpty!28559 ((_ is ValueCellFull!8520) mapValue!28559)) b!890095))

(assert (= (and b!890093 ((_ is ValueCellFull!8520) mapDefault!28559)) b!890096))

(assert (= b!890094 b!890093))

(assert (= start!75704 b!890094))

(declare-fun m!828749 () Bool)

(assert (=> b!890092 m!828749))

(declare-fun m!828751 () Bool)

(assert (=> start!75704 m!828751))

(declare-fun m!828753 () Bool)

(assert (=> mapNonEmpty!28559 m!828753))

(declare-fun m!828755 () Bool)

(assert (=> b!890091 m!828755))

(declare-fun m!828757 () Bool)

(assert (=> b!890091 m!828757))

(declare-fun m!828759 () Bool)

(assert (=> b!890094 m!828759))

(declare-fun m!828761 () Bool)

(assert (=> b!890094 m!828761))

(check-sat (not b!890091) b_and!25915 tp_is_empty!18003 (not start!75704) (not b!890094) (not mapNonEmpty!28559) (not b!890092) (not b_next!15675))
(check-sat b_and!25915 (not b_next!15675))
