; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75678 () Bool)

(assert start!75678)

(declare-fun b!889771 () Bool)

(declare-fun b_free!15667 () Bool)

(declare-fun b_next!15667 () Bool)

(assert (=> b!889771 (= b_free!15667 (not b_next!15667))))

(declare-fun tp!54971 () Bool)

(declare-fun b_and!25881 () Bool)

(assert (=> b!889771 (= tp!54971 b_and!25881)))

(declare-fun b!889768 () Bool)

(declare-fun e!496084 () Bool)

(declare-fun tp_is_empty!17995 () Bool)

(assert (=> b!889768 (= e!496084 tp_is_empty!17995)))

(declare-fun b!889769 () Bool)

(declare-fun e!496083 () Bool)

(assert (=> b!889769 (= e!496083 tp_is_empty!17995)))

(declare-fun b!889770 () Bool)

(declare-fun e!496082 () Bool)

(declare-fun mapRes!28547 () Bool)

(assert (=> b!889770 (= e!496082 (and e!496083 mapRes!28547))))

(declare-fun condMapEmpty!28547 () Bool)

(declare-datatypes ((array!51953 0))(
  ( (array!51954 (arr!24983 (Array (_ BitVec 32) (_ BitVec 64))) (size!25429 (_ BitVec 32))) )
))
(declare-datatypes ((V!28959 0))(
  ( (V!28960 (val!9048 Int)) )
))
(declare-datatypes ((ValueCell!8516 0))(
  ( (ValueCellFull!8516 (v!11520 V!28959)) (EmptyCell!8516) )
))
(declare-datatypes ((array!51955 0))(
  ( (array!51956 (arr!24984 (Array (_ BitVec 32) ValueCell!8516)) (size!25430 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4048 0))(
  ( (LongMapFixedSize!4049 (defaultEntry!5221 Int) (mask!25677 (_ BitVec 32)) (extraKeys!4915 (_ BitVec 32)) (zeroValue!5019 V!28959) (minValue!5019 V!28959) (_size!2079 (_ BitVec 32)) (_keys!9899 array!51953) (_values!5206 array!51955) (_vacant!2079 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4048)

(declare-fun mapDefault!28547 () ValueCell!8516)

(assert (=> b!889770 (= condMapEmpty!28547 (= (arr!24984 (_values!5206 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8516)) mapDefault!28547)))))

(declare-fun e!496085 () Bool)

(declare-fun array_inv!19698 (array!51953) Bool)

(declare-fun array_inv!19699 (array!51955) Bool)

(assert (=> b!889771 (= e!496085 (and tp!54971 tp_is_empty!17995 (array_inv!19698 (_keys!9899 thiss!1181)) (array_inv!19699 (_values!5206 thiss!1181)) e!496082))))

(declare-fun b!889772 () Bool)

(declare-fun e!496088 () Bool)

(declare-datatypes ((SeekEntryResult!8789 0))(
  ( (MissingZero!8789 (index!37527 (_ BitVec 32))) (Found!8789 (index!37528 (_ BitVec 32))) (Intermediate!8789 (undefined!9601 Bool) (index!37529 (_ BitVec 32)) (x!75584 (_ BitVec 32))) (Undefined!8789) (MissingVacant!8789 (index!37530 (_ BitVec 32))) )
))
(declare-fun lt!401924 () SeekEntryResult!8789)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!889772 (= e!496088 (inRange!0 (index!37528 lt!401924) (mask!25677 thiss!1181)))))

(declare-fun b!889773 () Bool)

(declare-fun res!602986 () Bool)

(declare-fun e!496086 () Bool)

(assert (=> b!889773 (=> (not res!602986) (not e!496086))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889773 (= res!602986 (not (= key!785 (bvneg key!785))))))

(declare-fun res!602988 () Bool)

(assert (=> start!75678 (=> (not res!602988) (not e!496086))))

(declare-fun valid!1583 (LongMapFixedSize!4048) Bool)

(assert (=> start!75678 (= res!602988 (valid!1583 thiss!1181))))

(assert (=> start!75678 e!496086))

(assert (=> start!75678 e!496085))

(assert (=> start!75678 true))

(declare-fun b!889774 () Bool)

(assert (=> b!889774 (= e!496086 (not true))))

(assert (=> b!889774 e!496088))

(declare-fun res!602987 () Bool)

(assert (=> b!889774 (=> res!602987 e!496088)))

(get-info :version)

(assert (=> b!889774 (= res!602987 (not ((_ is Found!8789) lt!401924)))))

(declare-datatypes ((Unit!30224 0))(
  ( (Unit!30225) )
))
(declare-fun lt!401923 () Unit!30224)

(declare-fun lemmaSeekEntryGivesInRangeIndex!3 (array!51953 array!51955 (_ BitVec 32) (_ BitVec 32) V!28959 V!28959 (_ BitVec 64)) Unit!30224)

(assert (=> b!889774 (= lt!401923 (lemmaSeekEntryGivesInRangeIndex!3 (_keys!9899 thiss!1181) (_values!5206 thiss!1181) (mask!25677 thiss!1181) (extraKeys!4915 thiss!1181) (zeroValue!5019 thiss!1181) (minValue!5019 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51953 (_ BitVec 32)) SeekEntryResult!8789)

(assert (=> b!889774 (= lt!401924 (seekEntry!0 key!785 (_keys!9899 thiss!1181) (mask!25677 thiss!1181)))))

(declare-fun mapNonEmpty!28547 () Bool)

(declare-fun tp!54970 () Bool)

(assert (=> mapNonEmpty!28547 (= mapRes!28547 (and tp!54970 e!496084))))

(declare-fun mapValue!28547 () ValueCell!8516)

(declare-fun mapRest!28547 () (Array (_ BitVec 32) ValueCell!8516))

(declare-fun mapKey!28547 () (_ BitVec 32))

(assert (=> mapNonEmpty!28547 (= (arr!24984 (_values!5206 thiss!1181)) (store mapRest!28547 mapKey!28547 mapValue!28547))))

(declare-fun mapIsEmpty!28547 () Bool)

(assert (=> mapIsEmpty!28547 mapRes!28547))

(assert (= (and start!75678 res!602988) b!889773))

(assert (= (and b!889773 res!602986) b!889774))

(assert (= (and b!889774 (not res!602987)) b!889772))

(assert (= (and b!889770 condMapEmpty!28547) mapIsEmpty!28547))

(assert (= (and b!889770 (not condMapEmpty!28547)) mapNonEmpty!28547))

(assert (= (and mapNonEmpty!28547 ((_ is ValueCellFull!8516) mapValue!28547)) b!889768))

(assert (= (and b!889770 ((_ is ValueCellFull!8516) mapDefault!28547)) b!889769))

(assert (= b!889771 b!889770))

(assert (= start!75678 b!889771))

(declare-fun m!827935 () Bool)

(assert (=> mapNonEmpty!28547 m!827935))

(declare-fun m!827937 () Bool)

(assert (=> b!889772 m!827937))

(declare-fun m!827939 () Bool)

(assert (=> b!889771 m!827939))

(declare-fun m!827941 () Bool)

(assert (=> b!889771 m!827941))

(declare-fun m!827943 () Bool)

(assert (=> start!75678 m!827943))

(declare-fun m!827945 () Bool)

(assert (=> b!889774 m!827945))

(declare-fun m!827947 () Bool)

(assert (=> b!889774 m!827947))

(check-sat (not start!75678) (not b!889772) (not mapNonEmpty!28547) tp_is_empty!17995 b_and!25881 (not b!889774) (not b_next!15667) (not b!889771))
(check-sat b_and!25881 (not b_next!15667))
