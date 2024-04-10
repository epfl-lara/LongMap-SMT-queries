; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77232 () Bool)

(assert start!77232)

(declare-fun b!901194 () Bool)

(declare-fun b_free!16073 () Bool)

(declare-fun b_next!16073 () Bool)

(assert (=> b!901194 (= b_free!16073 (not b_next!16073))))

(declare-fun tp!56315 () Bool)

(declare-fun b_and!26399 () Bool)

(assert (=> b!901194 (= tp!56315 b_and!26399)))

(declare-fun b!901186 () Bool)

(declare-fun res!608510 () Bool)

(declare-fun e!504490 () Bool)

(assert (=> b!901186 (=> res!608510 e!504490)))

(declare-datatypes ((SeekEntryResult!8949 0))(
  ( (MissingZero!8949 (index!38167 (_ BitVec 32))) (Found!8949 (index!38168 (_ BitVec 32))) (Intermediate!8949 (undefined!9761 Bool) (index!38169 (_ BitVec 32)) (x!76780 (_ BitVec 32))) (Undefined!8949) (MissingVacant!8949 (index!38170 (_ BitVec 32))) )
))
(declare-fun lt!407265 () SeekEntryResult!8949)

(declare-datatypes ((array!52856 0))(
  ( (array!52857 (arr!25397 (Array (_ BitVec 32) (_ BitVec 64))) (size!25856 (_ BitVec 32))) )
))
(declare-datatypes ((V!29499 0))(
  ( (V!29500 (val!9251 Int)) )
))
(declare-datatypes ((ValueCell!8719 0))(
  ( (ValueCellFull!8719 (v!11750 V!29499)) (EmptyCell!8719) )
))
(declare-datatypes ((array!52858 0))(
  ( (array!52859 (arr!25398 (Array (_ BitVec 32) ValueCell!8719)) (size!25857 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4454 0))(
  ( (LongMapFixedSize!4455 (defaultEntry!5465 Int) (mask!26268 (_ BitVec 32)) (extraKeys!5193 (_ BitVec 32)) (zeroValue!5297 V!29499) (minValue!5297 V!29499) (_size!2282 (_ BitVec 32)) (_keys!10275 array!52856) (_values!5484 array!52858) (_vacant!2282 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4454)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!901186 (= res!608510 (not (inRange!0 (index!38168 lt!407265) (mask!26268 thiss!1181))))))

(declare-fun b!901187 () Bool)

(declare-fun res!608517 () Bool)

(assert (=> b!901187 (=> res!608517 e!504490)))

(declare-datatypes ((tuple2!12068 0))(
  ( (tuple2!12069 (_1!6045 (_ BitVec 64)) (_2!6045 V!29499)) )
))
(declare-datatypes ((List!17872 0))(
  ( (Nil!17869) (Cons!17868 (h!19014 tuple2!12068) (t!25229 List!17872)) )
))
(declare-datatypes ((ListLongMap!10765 0))(
  ( (ListLongMap!10766 (toList!5398 List!17872)) )
))
(declare-fun lt!407268 () ListLongMap!10765)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4437 (ListLongMap!10765 (_ BitVec 64)) Bool)

(assert (=> b!901187 (= res!608517 (not (contains!4437 lt!407268 key!785)))))

(declare-fun b!901188 () Bool)

(assert (=> b!901188 (= e!504490 (= (select (arr!25397 (_keys!10275 thiss!1181)) (index!38168 lt!407265)) key!785))))

(declare-fun b!901189 () Bool)

(declare-fun res!608518 () Bool)

(declare-fun e!504492 () Bool)

(assert (=> b!901189 (=> (not res!608518) (not e!504492))))

(assert (=> b!901189 (= res!608518 (not (= key!785 (bvneg key!785))))))

(declare-fun res!608514 () Bool)

(assert (=> start!77232 (=> (not res!608514) (not e!504492))))

(declare-fun valid!1709 (LongMapFixedSize!4454) Bool)

(assert (=> start!77232 (= res!608514 (valid!1709 thiss!1181))))

(assert (=> start!77232 e!504492))

(declare-fun e!504493 () Bool)

(assert (=> start!77232 e!504493))

(assert (=> start!77232 true))

(declare-fun b!901190 () Bool)

(declare-fun e!504487 () Bool)

(declare-fun e!504488 () Bool)

(declare-fun mapRes!29284 () Bool)

(assert (=> b!901190 (= e!504487 (and e!504488 mapRes!29284))))

(declare-fun condMapEmpty!29284 () Bool)

(declare-fun mapDefault!29284 () ValueCell!8719)

