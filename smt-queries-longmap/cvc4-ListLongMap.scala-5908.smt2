; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76450 () Bool)

(assert start!76450)

(declare-fun b!896455 () Bool)

(declare-fun b_free!15953 () Bool)

(declare-fun b_next!15953 () Bool)

(assert (=> b!896455 (= b_free!15953 (not b_next!15953))))

(declare-fun tp!55890 () Bool)

(declare-fun b_and!26245 () Bool)

(assert (=> b!896455 (= tp!55890 b_and!26245)))

(declare-fun b!896449 () Bool)

(declare-fun e!501079 () Bool)

(declare-fun tp_is_empty!18281 () Bool)

(assert (=> b!896449 (= e!501079 tp_is_empty!18281)))

(declare-fun mapNonEmpty!29039 () Bool)

(declare-fun mapRes!29039 () Bool)

(declare-fun tp!55891 () Bool)

(declare-fun e!501084 () Bool)

(assert (=> mapNonEmpty!29039 (= mapRes!29039 (and tp!55891 e!501084))))

(declare-datatypes ((V!29339 0))(
  ( (V!29340 (val!9191 Int)) )
))
(declare-datatypes ((ValueCell!8659 0))(
  ( (ValueCellFull!8659 (v!11681 V!29339)) (EmptyCell!8659) )
))
(declare-fun mapRest!29039 () (Array (_ BitVec 32) ValueCell!8659))

(declare-datatypes ((array!52578 0))(
  ( (array!52579 (arr!25277 (Array (_ BitVec 32) (_ BitVec 64))) (size!25728 (_ BitVec 32))) )
))
(declare-datatypes ((array!52580 0))(
  ( (array!52581 (arr!25278 (Array (_ BitVec 32) ValueCell!8659)) (size!25729 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4334 0))(
  ( (LongMapFixedSize!4335 (defaultEntry!5379 Int) (mask!26019 (_ BitVec 32)) (extraKeys!5080 (_ BitVec 32)) (zeroValue!5184 V!29339) (minValue!5184 V!29339) (_size!2222 (_ BitVec 32)) (_keys!10112 array!52578) (_values!5371 array!52580) (_vacant!2222 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4334)

(declare-fun mapValue!29039 () ValueCell!8659)

(declare-fun mapKey!29039 () (_ BitVec 32))

(assert (=> mapNonEmpty!29039 (= (arr!25278 (_values!5371 thiss!1181)) (store mapRest!29039 mapKey!29039 mapValue!29039))))

(declare-fun b!896450 () Bool)

(declare-fun e!501081 () Bool)

(declare-datatypes ((SeekEntryResult!8898 0))(
  ( (MissingZero!8898 (index!37963 (_ BitVec 32))) (Found!8898 (index!37964 (_ BitVec 32))) (Intermediate!8898 (undefined!9710 Bool) (index!37965 (_ BitVec 32)) (x!76331 (_ BitVec 32))) (Undefined!8898) (MissingVacant!8898 (index!37966 (_ BitVec 32))) )
))
(declare-fun lt!404823 () SeekEntryResult!8898)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896450 (= e!501081 (inRange!0 (index!37964 lt!404823) (mask!26019 thiss!1181)))))

(declare-fun res!606156 () Bool)

(declare-fun e!501078 () Bool)

(assert (=> start!76450 (=> (not res!606156) (not e!501078))))

(declare-fun valid!1672 (LongMapFixedSize!4334) Bool)

(assert (=> start!76450 (= res!606156 (valid!1672 thiss!1181))))

(assert (=> start!76450 e!501078))

(declare-fun e!501083 () Bool)

(assert (=> start!76450 e!501083))

(assert (=> start!76450 true))

(declare-fun b!896451 () Bool)

(declare-fun e!501082 () Bool)

(assert (=> b!896451 (= e!501078 (not e!501082))))

(declare-fun res!606155 () Bool)

(assert (=> b!896451 (=> res!606155 e!501082)))

(assert (=> b!896451 (= res!606155 (not (is-Found!8898 lt!404823)))))

(assert (=> b!896451 e!501081))

(declare-fun res!606154 () Bool)

(assert (=> b!896451 (=> res!606154 e!501081)))

(assert (=> b!896451 (= res!606154 (not (is-Found!8898 lt!404823)))))

(declare-datatypes ((Unit!30486 0))(
  ( (Unit!30487) )
))
(declare-fun lt!404822 () Unit!30486)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!71 (array!52578 array!52580 (_ BitVec 32) (_ BitVec 32) V!29339 V!29339 (_ BitVec 64)) Unit!30486)

(assert (=> b!896451 (= lt!404822 (lemmaSeekEntryGivesInRangeIndex!71 (_keys!10112 thiss!1181) (_values!5371 thiss!1181) (mask!26019 thiss!1181) (extraKeys!5080 thiss!1181) (zeroValue!5184 thiss!1181) (minValue!5184 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52578 (_ BitVec 32)) SeekEntryResult!8898)

(assert (=> b!896451 (= lt!404823 (seekEntry!0 key!785 (_keys!10112 thiss!1181) (mask!26019 thiss!1181)))))

(declare-fun b!896452 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!896452 (= e!501082 (validMask!0 (mask!26019 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896452 (arrayContainsKey!0 (_keys!10112 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404824 () Unit!30486)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52578 (_ BitVec 64) (_ BitVec 32)) Unit!30486)

(assert (=> b!896452 (= lt!404824 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10112 thiss!1181) key!785 (index!37964 lt!404823)))))

(declare-fun b!896453 () Bool)

(declare-fun res!606153 () Bool)

(assert (=> b!896453 (=> (not res!606153) (not e!501078))))

(assert (=> b!896453 (= res!606153 (not (= key!785 (bvneg key!785))))))

(declare-fun b!896454 () Bool)

(assert (=> b!896454 (= e!501084 tp_is_empty!18281)))

(declare-fun e!501085 () Bool)

(declare-fun array_inv!19842 (array!52578) Bool)

(declare-fun array_inv!19843 (array!52580) Bool)

(assert (=> b!896455 (= e!501083 (and tp!55890 tp_is_empty!18281 (array_inv!19842 (_keys!10112 thiss!1181)) (array_inv!19843 (_values!5371 thiss!1181)) e!501085))))

(declare-fun b!896456 () Bool)

(assert (=> b!896456 (= e!501085 (and e!501079 mapRes!29039))))

(declare-fun condMapEmpty!29039 () Bool)

(declare-fun mapDefault!29039 () ValueCell!8659)

