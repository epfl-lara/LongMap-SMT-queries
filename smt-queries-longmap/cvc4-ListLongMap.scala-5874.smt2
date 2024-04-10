; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75778 () Bool)

(assert start!75778)

(declare-fun b!891224 () Bool)

(declare-fun b_free!15749 () Bool)

(declare-fun b_next!15749 () Bool)

(assert (=> b!891224 (= b_free!15749 (not b_next!15749))))

(declare-fun tp!55216 () Bool)

(declare-fun b_and!25989 () Bool)

(assert (=> b!891224 (= tp!55216 b_and!25989)))

(declare-fun tp_is_empty!18077 () Bool)

(declare-datatypes ((array!52134 0))(
  ( (array!52135 (arr!25073 (Array (_ BitVec 32) (_ BitVec 64))) (size!25517 (_ BitVec 32))) )
))
(declare-datatypes ((V!29067 0))(
  ( (V!29068 (val!9089 Int)) )
))
(declare-datatypes ((ValueCell!8557 0))(
  ( (ValueCellFull!8557 (v!11567 V!29067)) (EmptyCell!8557) )
))
(declare-datatypes ((array!52136 0))(
  ( (array!52137 (arr!25074 (Array (_ BitVec 32) ValueCell!8557)) (size!25518 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4130 0))(
  ( (LongMapFixedSize!4131 (defaultEntry!5262 Int) (mask!25751 (_ BitVec 32)) (extraKeys!4956 (_ BitVec 32)) (zeroValue!5060 V!29067) (minValue!5060 V!29067) (_size!2120 (_ BitVec 32)) (_keys!9945 array!52134) (_values!5247 array!52136) (_vacant!2120 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4130)

(declare-fun e!497275 () Bool)

(declare-fun e!497274 () Bool)

(declare-fun array_inv!19704 (array!52134) Bool)

(declare-fun array_inv!19705 (array!52136) Bool)

(assert (=> b!891224 (= e!497274 (and tp!55216 tp_is_empty!18077 (array_inv!19704 (_keys!9945 thiss!1181)) (array_inv!19705 (_values!5247 thiss!1181)) e!497275))))

(declare-fun b!891225 () Bool)

(declare-fun e!497269 () Bool)

(assert (=> b!891225 (= e!497269 tp_is_empty!18077)))

(declare-fun mapNonEmpty!28670 () Bool)

(declare-fun mapRes!28670 () Bool)

(declare-fun tp!55215 () Bool)

(assert (=> mapNonEmpty!28670 (= mapRes!28670 (and tp!55215 e!497269))))

(declare-fun mapValue!28670 () ValueCell!8557)

(declare-fun mapRest!28670 () (Array (_ BitVec 32) ValueCell!8557))

(declare-fun mapKey!28670 () (_ BitVec 32))

(assert (=> mapNonEmpty!28670 (= (arr!25074 (_values!5247 thiss!1181)) (store mapRest!28670 mapKey!28670 mapValue!28670))))

(declare-fun b!891226 () Bool)

(declare-fun e!497272 () Bool)

(declare-datatypes ((SeekEntryResult!8819 0))(
  ( (MissingZero!8819 (index!37647 (_ BitVec 32))) (Found!8819 (index!37648 (_ BitVec 32))) (Intermediate!8819 (undefined!9631 Bool) (index!37649 (_ BitVec 32)) (x!75723 (_ BitVec 32))) (Undefined!8819) (MissingVacant!8819 (index!37650 (_ BitVec 32))) )
))
(declare-fun lt!402585 () SeekEntryResult!8819)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891226 (= e!497272 (inRange!0 (index!37648 lt!402585) (mask!25751 thiss!1181)))))

(declare-fun b!891227 () Bool)

(declare-fun e!497271 () Bool)

(declare-fun e!497277 () Bool)

(assert (=> b!891227 (= e!497271 e!497277)))

(declare-fun res!603821 () Bool)

(assert (=> b!891227 (=> res!603821 e!497277)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891227 (= res!603821 (not (validMask!0 (mask!25751 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891227 (arrayContainsKey!0 (_keys!9945 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30334 0))(
  ( (Unit!30335) )
))
(declare-fun lt!402584 () Unit!30334)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52134 (_ BitVec 64) (_ BitVec 32)) Unit!30334)

(assert (=> b!891227 (= lt!402584 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9945 thiss!1181) key!785 (index!37648 lt!402585)))))

(declare-fun b!891228 () Bool)

(assert (=> b!891228 (= e!497277 true)))

(declare-fun lt!402583 () Bool)

(declare-datatypes ((List!17736 0))(
  ( (Nil!17733) (Cons!17732 (h!18863 (_ BitVec 64)) (t!25035 List!17736)) )
))
(declare-fun arrayNoDuplicates!0 (array!52134 (_ BitVec 32) List!17736) Bool)

(assert (=> b!891228 (= lt!402583 (arrayNoDuplicates!0 (_keys!9945 thiss!1181) #b00000000000000000000000000000000 Nil!17733))))

(declare-fun b!891229 () Bool)

(declare-fun e!497273 () Bool)

(assert (=> b!891229 (= e!497273 (not e!497271))))

(declare-fun res!603824 () Bool)

(assert (=> b!891229 (=> res!603824 e!497271)))

(assert (=> b!891229 (= res!603824 (not (is-Found!8819 lt!402585)))))

(assert (=> b!891229 e!497272))

(declare-fun res!603827 () Bool)

(assert (=> b!891229 (=> res!603827 e!497272)))

(assert (=> b!891229 (= res!603827 (not (is-Found!8819 lt!402585)))))

(declare-fun lt!402586 () Unit!30334)

(declare-fun lemmaSeekEntryGivesInRangeIndex!24 (array!52134 array!52136 (_ BitVec 32) (_ BitVec 32) V!29067 V!29067 (_ BitVec 64)) Unit!30334)

(assert (=> b!891229 (= lt!402586 (lemmaSeekEntryGivesInRangeIndex!24 (_keys!9945 thiss!1181) (_values!5247 thiss!1181) (mask!25751 thiss!1181) (extraKeys!4956 thiss!1181) (zeroValue!5060 thiss!1181) (minValue!5060 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52134 (_ BitVec 32)) SeekEntryResult!8819)

(assert (=> b!891229 (= lt!402585 (seekEntry!0 key!785 (_keys!9945 thiss!1181) (mask!25751 thiss!1181)))))

(declare-fun b!891230 () Bool)

(declare-fun e!497270 () Bool)

(assert (=> b!891230 (= e!497270 tp_is_empty!18077)))

(declare-fun b!891231 () Bool)

(declare-fun res!603826 () Bool)

(assert (=> b!891231 (=> (not res!603826) (not e!497273))))

(assert (=> b!891231 (= res!603826 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891232 () Bool)

(declare-fun res!603822 () Bool)

(assert (=> b!891232 (=> res!603822 e!497277)))

(assert (=> b!891232 (= res!603822 (or (not (= (size!25518 (_values!5247 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25751 thiss!1181)))) (not (= (size!25517 (_keys!9945 thiss!1181)) (size!25518 (_values!5247 thiss!1181)))) (bvslt (mask!25751 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4956 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4956 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891233 () Bool)

(assert (=> b!891233 (= e!497275 (and e!497270 mapRes!28670))))

(declare-fun condMapEmpty!28670 () Bool)

(declare-fun mapDefault!28670 () ValueCell!8557)

