; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75864 () Bool)

(assert start!75864)

(declare-fun b!890915 () Bool)

(declare-fun b_free!15667 () Bool)

(declare-fun b_next!15667 () Bool)

(assert (=> b!890915 (= b_free!15667 (not b_next!15667))))

(declare-fun tp!54970 () Bool)

(declare-fun b_and!25917 () Bool)

(assert (=> b!890915 (= tp!54970 b_and!25917)))

(declare-fun b!890910 () Bool)

(declare-fun e!496814 () Bool)

(declare-fun tp_is_empty!17995 () Bool)

(assert (=> b!890910 (= e!496814 tp_is_empty!17995)))

(declare-fun b!890911 () Bool)

(declare-fun e!496818 () Bool)

(declare-fun e!496813 () Bool)

(declare-fun mapRes!28547 () Bool)

(assert (=> b!890911 (= e!496818 (and e!496813 mapRes!28547))))

(declare-fun condMapEmpty!28547 () Bool)

(declare-datatypes ((array!52009 0))(
  ( (array!52010 (arr!25006 (Array (_ BitVec 32) (_ BitVec 64))) (size!25451 (_ BitVec 32))) )
))
(declare-datatypes ((V!28959 0))(
  ( (V!28960 (val!9048 Int)) )
))
(declare-datatypes ((ValueCell!8516 0))(
  ( (ValueCellFull!8516 (v!11523 V!28959)) (EmptyCell!8516) )
))
(declare-datatypes ((array!52011 0))(
  ( (array!52012 (arr!25007 (Array (_ BitVec 32) ValueCell!8516)) (size!25452 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4048 0))(
  ( (LongMapFixedSize!4049 (defaultEntry!5221 Int) (mask!25727 (_ BitVec 32)) (extraKeys!4915 (_ BitVec 32)) (zeroValue!5019 V!28959) (minValue!5019 V!28959) (_size!2079 (_ BitVec 32)) (_keys!9932 array!52009) (_values!5206 array!52011) (_vacant!2079 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4048)

(declare-fun mapDefault!28547 () ValueCell!8516)

(assert (=> b!890911 (= condMapEmpty!28547 (= (arr!25007 (_values!5206 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8516)) mapDefault!28547)))))

(declare-fun b!890912 () Bool)

(declare-fun e!496816 () Bool)

(declare-datatypes ((SeekEntryResult!8743 0))(
  ( (MissingZero!8743 (index!37343 (_ BitVec 32))) (Found!8743 (index!37344 (_ BitVec 32))) (Intermediate!8743 (undefined!9555 Bool) (index!37345 (_ BitVec 32)) (x!75557 (_ BitVec 32))) (Undefined!8743) (MissingVacant!8743 (index!37346 (_ BitVec 32))) )
))
(declare-fun lt!402520 () SeekEntryResult!8743)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890912 (= e!496816 (inRange!0 (index!37344 lt!402520) (mask!25727 thiss!1181)))))

(declare-fun mapNonEmpty!28547 () Bool)

(declare-fun tp!54971 () Bool)

(assert (=> mapNonEmpty!28547 (= mapRes!28547 (and tp!54971 e!496814))))

(declare-fun mapRest!28547 () (Array (_ BitVec 32) ValueCell!8516))

(declare-fun mapValue!28547 () ValueCell!8516)

(declare-fun mapKey!28547 () (_ BitVec 32))

(assert (=> mapNonEmpty!28547 (= (arr!25007 (_values!5206 thiss!1181)) (store mapRest!28547 mapKey!28547 mapValue!28547))))

(declare-fun b!890913 () Bool)

(declare-fun res!603441 () Bool)

(declare-fun e!496817 () Bool)

(assert (=> b!890913 (=> (not res!603441) (not e!496817))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890913 (= res!603441 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890914 () Bool)

(assert (=> b!890914 (= e!496817 (not true))))

(assert (=> b!890914 e!496816))

(declare-fun res!603442 () Bool)

(assert (=> b!890914 (=> res!603442 e!496816)))

(get-info :version)

(assert (=> b!890914 (= res!603442 (not ((_ is Found!8743) lt!402520)))))

(declare-datatypes ((Unit!30262 0))(
  ( (Unit!30263) )
))
(declare-fun lt!402521 () Unit!30262)

(declare-fun lemmaSeekEntryGivesInRangeIndex!3 (array!52009 array!52011 (_ BitVec 32) (_ BitVec 32) V!28959 V!28959 (_ BitVec 64)) Unit!30262)

(assert (=> b!890914 (= lt!402521 (lemmaSeekEntryGivesInRangeIndex!3 (_keys!9932 thiss!1181) (_values!5206 thiss!1181) (mask!25727 thiss!1181) (extraKeys!4915 thiss!1181) (zeroValue!5019 thiss!1181) (minValue!5019 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52009 (_ BitVec 32)) SeekEntryResult!8743)

(assert (=> b!890914 (= lt!402520 (seekEntry!0 key!785 (_keys!9932 thiss!1181) (mask!25727 thiss!1181)))))

(declare-fun e!496812 () Bool)

(declare-fun array_inv!19714 (array!52009) Bool)

(declare-fun array_inv!19715 (array!52011) Bool)

(assert (=> b!890915 (= e!496812 (and tp!54970 tp_is_empty!17995 (array_inv!19714 (_keys!9932 thiss!1181)) (array_inv!19715 (_values!5206 thiss!1181)) e!496818))))

(declare-fun b!890916 () Bool)

(assert (=> b!890916 (= e!496813 tp_is_empty!17995)))

(declare-fun res!603440 () Bool)

(assert (=> start!75864 (=> (not res!603440) (not e!496817))))

(declare-fun valid!1585 (LongMapFixedSize!4048) Bool)

(assert (=> start!75864 (= res!603440 (valid!1585 thiss!1181))))

(assert (=> start!75864 e!496817))

(assert (=> start!75864 e!496812))

(assert (=> start!75864 true))

(declare-fun mapIsEmpty!28547 () Bool)

(assert (=> mapIsEmpty!28547 mapRes!28547))

(assert (= (and start!75864 res!603440) b!890913))

(assert (= (and b!890913 res!603441) b!890914))

(assert (= (and b!890914 (not res!603442)) b!890912))

(assert (= (and b!890911 condMapEmpty!28547) mapIsEmpty!28547))

(assert (= (and b!890911 (not condMapEmpty!28547)) mapNonEmpty!28547))

(assert (= (and mapNonEmpty!28547 ((_ is ValueCellFull!8516) mapValue!28547)) b!890910))

(assert (= (and b!890911 ((_ is ValueCellFull!8516) mapDefault!28547)) b!890916))

(assert (= b!890915 b!890911))

(assert (= start!75864 b!890915))

(declare-fun m!829987 () Bool)

(assert (=> mapNonEmpty!28547 m!829987))

(declare-fun m!829989 () Bool)

(assert (=> b!890915 m!829989))

(declare-fun m!829991 () Bool)

(assert (=> b!890915 m!829991))

(declare-fun m!829993 () Bool)

(assert (=> b!890914 m!829993))

(declare-fun m!829995 () Bool)

(assert (=> b!890914 m!829995))

(declare-fun m!829997 () Bool)

(assert (=> b!890912 m!829997))

(declare-fun m!829999 () Bool)

(assert (=> start!75864 m!829999))

(check-sat (not b_next!15667) b_and!25917 (not start!75864) (not b!890912) (not b!890914) (not b!890915) tp_is_empty!17995 (not mapNonEmpty!28547))
(check-sat b_and!25917 (not b_next!15667))
