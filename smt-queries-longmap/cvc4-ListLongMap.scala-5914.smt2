; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76666 () Bool)

(assert start!76666)

(declare-fun b!897621 () Bool)

(declare-fun b_free!15989 () Bool)

(declare-fun b_next!15989 () Bool)

(assert (=> b!897621 (= b_free!15989 (not b_next!15989))))

(declare-fun tp!56020 () Bool)

(declare-fun b_and!26281 () Bool)

(assert (=> b!897621 (= tp!56020 b_and!26281)))

(declare-fun b!897618 () Bool)

(declare-fun res!606707 () Bool)

(declare-fun e!501974 () Bool)

(assert (=> b!897618 (=> (not res!606707) (not e!501974))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!897618 (= res!606707 (not (= key!785 (bvneg key!785))))))

(declare-fun b!897619 () Bool)

(declare-fun e!501969 () Bool)

(declare-fun tp_is_empty!18317 () Bool)

(assert (=> b!897619 (= e!501969 tp_is_empty!18317)))

(declare-fun mapIsEmpty!29115 () Bool)

(declare-fun mapRes!29115 () Bool)

(assert (=> mapIsEmpty!29115 mapRes!29115))

(declare-fun b!897620 () Bool)

(declare-fun e!501975 () Bool)

(declare-datatypes ((SeekEntryResult!8912 0))(
  ( (MissingZero!8912 (index!38019 (_ BitVec 32))) (Found!8912 (index!38020 (_ BitVec 32))) (Intermediate!8912 (undefined!9724 Bool) (index!38021 (_ BitVec 32)) (x!76477 (_ BitVec 32))) (Undefined!8912) (MissingVacant!8912 (index!38022 (_ BitVec 32))) )
))
(declare-fun lt!405244 () SeekEntryResult!8912)

(declare-datatypes ((array!52662 0))(
  ( (array!52663 (arr!25313 (Array (_ BitVec 32) (_ BitVec 64))) (size!25768 (_ BitVec 32))) )
))
(declare-datatypes ((V!29387 0))(
  ( (V!29388 (val!9209 Int)) )
))
(declare-datatypes ((ValueCell!8677 0))(
  ( (ValueCellFull!8677 (v!11699 V!29387)) (EmptyCell!8677) )
))
(declare-datatypes ((array!52664 0))(
  ( (array!52665 (arr!25314 (Array (_ BitVec 32) ValueCell!8677)) (size!25769 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4370 0))(
  ( (LongMapFixedSize!4371 (defaultEntry!5397 Int) (mask!26093 (_ BitVec 32)) (extraKeys!5108 (_ BitVec 32)) (zeroValue!5212 V!29387) (minValue!5212 V!29387) (_size!2240 (_ BitVec 32)) (_keys!10158 array!52662) (_values!5399 array!52664) (_vacant!2240 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4370)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897620 (= e!501975 (inRange!0 (index!38020 lt!405244) (mask!26093 thiss!1181)))))

(declare-fun e!501972 () Bool)

(declare-fun e!501970 () Bool)

(declare-fun array_inv!19868 (array!52662) Bool)

(declare-fun array_inv!19869 (array!52664) Bool)

(assert (=> b!897621 (= e!501972 (and tp!56020 tp_is_empty!18317 (array_inv!19868 (_keys!10158 thiss!1181)) (array_inv!19869 (_values!5399 thiss!1181)) e!501970))))

(declare-fun b!897622 () Bool)

(declare-fun res!606711 () Bool)

(declare-fun e!501976 () Bool)

(assert (=> b!897622 (=> res!606711 e!501976)))

(assert (=> b!897622 (= res!606711 (or (not (= (size!25769 (_values!5399 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26093 thiss!1181)))) (not (= (size!25768 (_keys!10158 thiss!1181)) (size!25769 (_values!5399 thiss!1181)))) (bvslt (mask!26093 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5108 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5108 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!897623 () Bool)

(declare-fun e!501973 () Bool)

(assert (=> b!897623 (= e!501973 e!501976)))

(declare-fun res!606708 () Bool)

(assert (=> b!897623 (=> res!606708 e!501976)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897623 (= res!606708 (not (validMask!0 (mask!26093 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897623 (arrayContainsKey!0 (_keys!10158 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30514 0))(
  ( (Unit!30515) )
))
(declare-fun lt!405243 () Unit!30514)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52662 (_ BitVec 64) (_ BitVec 32)) Unit!30514)

(assert (=> b!897623 (= lt!405243 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10158 thiss!1181) key!785 (index!38020 lt!405244)))))

(declare-fun b!897624 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52662 (_ BitVec 32)) Bool)

(assert (=> b!897624 (= e!501976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10158 thiss!1181) (mask!26093 thiss!1181)))))

(declare-fun b!897625 () Bool)

(assert (=> b!897625 (= e!501974 (not e!501973))))

(declare-fun res!606709 () Bool)

(assert (=> b!897625 (=> res!606709 e!501973)))

(assert (=> b!897625 (= res!606709 (not (is-Found!8912 lt!405244)))))

(assert (=> b!897625 e!501975))

(declare-fun res!606710 () Bool)

(assert (=> b!897625 (=> res!606710 e!501975)))

(assert (=> b!897625 (= res!606710 (not (is-Found!8912 lt!405244)))))

(declare-fun lt!405242 () Unit!30514)

(declare-fun lemmaSeekEntryGivesInRangeIndex!82 (array!52662 array!52664 (_ BitVec 32) (_ BitVec 32) V!29387 V!29387 (_ BitVec 64)) Unit!30514)

(assert (=> b!897625 (= lt!405242 (lemmaSeekEntryGivesInRangeIndex!82 (_keys!10158 thiss!1181) (_values!5399 thiss!1181) (mask!26093 thiss!1181) (extraKeys!5108 thiss!1181) (zeroValue!5212 thiss!1181) (minValue!5212 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52662 (_ BitVec 32)) SeekEntryResult!8912)

(assert (=> b!897625 (= lt!405244 (seekEntry!0 key!785 (_keys!10158 thiss!1181) (mask!26093 thiss!1181)))))

(declare-fun mapNonEmpty!29115 () Bool)

(declare-fun tp!56021 () Bool)

(declare-fun e!501977 () Bool)

(assert (=> mapNonEmpty!29115 (= mapRes!29115 (and tp!56021 e!501977))))

(declare-fun mapValue!29115 () ValueCell!8677)

(declare-fun mapKey!29115 () (_ BitVec 32))

(declare-fun mapRest!29115 () (Array (_ BitVec 32) ValueCell!8677))

(assert (=> mapNonEmpty!29115 (= (arr!25314 (_values!5399 thiss!1181)) (store mapRest!29115 mapKey!29115 mapValue!29115))))

(declare-fun b!897626 () Bool)

(assert (=> b!897626 (= e!501977 tp_is_empty!18317)))

(declare-fun b!897627 () Bool)

(assert (=> b!897627 (= e!501970 (and e!501969 mapRes!29115))))

(declare-fun condMapEmpty!29115 () Bool)

(declare-fun mapDefault!29115 () ValueCell!8677)

