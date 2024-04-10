; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76692 () Bool)

(assert start!76692)

(declare-fun b!897782 () Bool)

(declare-fun b_free!15995 () Bool)

(declare-fun b_next!15995 () Bool)

(assert (=> b!897782 (= b_free!15995 (not b_next!15995))))

(declare-fun tp!56041 () Bool)

(declare-fun b_and!26287 () Bool)

(assert (=> b!897782 (= tp!56041 b_and!26287)))

(declare-fun res!606795 () Bool)

(declare-fun e!502090 () Bool)

(assert (=> start!76692 (=> (not res!606795) (not e!502090))))

(declare-datatypes ((array!52676 0))(
  ( (array!52677 (arr!25319 (Array (_ BitVec 32) (_ BitVec 64))) (size!25774 (_ BitVec 32))) )
))
(declare-datatypes ((V!29395 0))(
  ( (V!29396 (val!9212 Int)) )
))
(declare-datatypes ((ValueCell!8680 0))(
  ( (ValueCellFull!8680 (v!11702 V!29395)) (EmptyCell!8680) )
))
(declare-datatypes ((array!52678 0))(
  ( (array!52679 (arr!25320 (Array (_ BitVec 32) ValueCell!8680)) (size!25775 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4376 0))(
  ( (LongMapFixedSize!4377 (defaultEntry!5400 Int) (mask!26103 (_ BitVec 32)) (extraKeys!5112 (_ BitVec 32)) (zeroValue!5216 V!29395) (minValue!5216 V!29395) (_size!2243 (_ BitVec 32)) (_keys!10164 array!52676) (_values!5403 array!52678) (_vacant!2243 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4376)

(declare-fun valid!1685 (LongMapFixedSize!4376) Bool)

(assert (=> start!76692 (= res!606795 (valid!1685 thiss!1181))))

(assert (=> start!76692 e!502090))

(declare-fun e!502092 () Bool)

(assert (=> start!76692 e!502092))

(assert (=> start!76692 true))

(declare-fun b!897772 () Bool)

(declare-fun e!502089 () Bool)

(declare-fun e!502086 () Bool)

(assert (=> b!897772 (= e!502089 e!502086)))

(declare-fun res!606796 () Bool)

(assert (=> b!897772 (=> res!606796 e!502086)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897772 (= res!606796 (not (validMask!0 (mask!26103 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897772 (arrayContainsKey!0 (_keys!10164 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!8915 0))(
  ( (MissingZero!8915 (index!38031 (_ BitVec 32))) (Found!8915 (index!38032 (_ BitVec 32))) (Intermediate!8915 (undefined!9727 Bool) (index!38033 (_ BitVec 32)) (x!76496 (_ BitVec 32))) (Undefined!8915) (MissingVacant!8915 (index!38034 (_ BitVec 32))) )
))
(declare-fun lt!405301 () SeekEntryResult!8915)

(declare-datatypes ((Unit!30520 0))(
  ( (Unit!30521) )
))
(declare-fun lt!405300 () Unit!30520)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52676 (_ BitVec 64) (_ BitVec 32)) Unit!30520)

(assert (=> b!897772 (= lt!405300 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10164 thiss!1181) key!785 (index!38032 lt!405301)))))

(declare-fun mapIsEmpty!29127 () Bool)

(declare-fun mapRes!29127 () Bool)

(assert (=> mapIsEmpty!29127 mapRes!29127))

(declare-fun b!897773 () Bool)

(declare-fun res!606794 () Bool)

(assert (=> b!897773 (=> res!606794 e!502086)))

(assert (=> b!897773 (= res!606794 (or (not (= (size!25775 (_values!5403 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26103 thiss!1181)))) (not (= (size!25774 (_keys!10164 thiss!1181)) (size!25775 (_values!5403 thiss!1181)))) (bvslt (mask!26103 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5112 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5112 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!897774 () Bool)

(assert (=> b!897774 (= e!502090 (not e!502089))))

(declare-fun res!606798 () Bool)

(assert (=> b!897774 (=> res!606798 e!502089)))

(assert (=> b!897774 (= res!606798 (not (is-Found!8915 lt!405301)))))

(declare-fun e!502088 () Bool)

(assert (=> b!897774 e!502088))

(declare-fun res!606792 () Bool)

(assert (=> b!897774 (=> res!606792 e!502088)))

(assert (=> b!897774 (= res!606792 (not (is-Found!8915 lt!405301)))))

(declare-fun lt!405299 () Unit!30520)

(declare-fun lemmaSeekEntryGivesInRangeIndex!85 (array!52676 array!52678 (_ BitVec 32) (_ BitVec 32) V!29395 V!29395 (_ BitVec 64)) Unit!30520)

(assert (=> b!897774 (= lt!405299 (lemmaSeekEntryGivesInRangeIndex!85 (_keys!10164 thiss!1181) (_values!5403 thiss!1181) (mask!26103 thiss!1181) (extraKeys!5112 thiss!1181) (zeroValue!5216 thiss!1181) (minValue!5216 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52676 (_ BitVec 32)) SeekEntryResult!8915)

(assert (=> b!897774 (= lt!405301 (seekEntry!0 key!785 (_keys!10164 thiss!1181) (mask!26103 thiss!1181)))))

(declare-fun b!897775 () Bool)

(declare-datatypes ((List!17831 0))(
  ( (Nil!17828) (Cons!17827 (h!18969 (_ BitVec 64)) (t!25170 List!17831)) )
))
(declare-fun arrayNoDuplicates!0 (array!52676 (_ BitVec 32) List!17831) Bool)

(assert (=> b!897775 (= e!502086 (arrayNoDuplicates!0 (_keys!10164 thiss!1181) #b00000000000000000000000000000000 Nil!17828))))

(declare-fun b!897776 () Bool)

(declare-fun e!502087 () Bool)

(declare-fun tp_is_empty!18323 () Bool)

(assert (=> b!897776 (= e!502087 tp_is_empty!18323)))

(declare-fun b!897777 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897777 (= e!502088 (inRange!0 (index!38032 lt!405301) (mask!26103 thiss!1181)))))

(declare-fun b!897778 () Bool)

(declare-fun res!606793 () Bool)

(assert (=> b!897778 (=> res!606793 e!502086)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52676 (_ BitVec 32)) Bool)

(assert (=> b!897778 (= res!606793 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10164 thiss!1181) (mask!26103 thiss!1181))))))

(declare-fun b!897779 () Bool)

(declare-fun res!606797 () Bool)

(assert (=> b!897779 (=> (not res!606797) (not e!502090))))

(assert (=> b!897779 (= res!606797 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!29127 () Bool)

(declare-fun tp!56042 () Bool)

(declare-fun e!502091 () Bool)

(assert (=> mapNonEmpty!29127 (= mapRes!29127 (and tp!56042 e!502091))))

(declare-fun mapValue!29127 () ValueCell!8680)

(declare-fun mapRest!29127 () (Array (_ BitVec 32) ValueCell!8680))

(declare-fun mapKey!29127 () (_ BitVec 32))

(assert (=> mapNonEmpty!29127 (= (arr!25320 (_values!5403 thiss!1181)) (store mapRest!29127 mapKey!29127 mapValue!29127))))

(declare-fun b!897780 () Bool)

(declare-fun e!502094 () Bool)

(assert (=> b!897780 (= e!502094 (and e!502087 mapRes!29127))))

(declare-fun condMapEmpty!29127 () Bool)

(declare-fun mapDefault!29127 () ValueCell!8680)

