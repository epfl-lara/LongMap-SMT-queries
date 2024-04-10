; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76446 () Bool)

(assert start!76446)

(declare-fun b!896408 () Bool)

(declare-fun b_free!15949 () Bool)

(declare-fun b_next!15949 () Bool)

(assert (=> b!896408 (= b_free!15949 (not b_next!15949))))

(declare-fun tp!55879 () Bool)

(declare-fun b_and!26241 () Bool)

(assert (=> b!896408 (= tp!55879 b_and!26241)))

(declare-fun b!896401 () Bool)

(declare-fun e!501037 () Bool)

(declare-fun e!501034 () Bool)

(assert (=> b!896401 (= e!501037 (not e!501034))))

(declare-fun res!606132 () Bool)

(assert (=> b!896401 (=> res!606132 e!501034)))

(declare-datatypes ((SeekEntryResult!8896 0))(
  ( (MissingZero!8896 (index!37955 (_ BitVec 32))) (Found!8896 (index!37956 (_ BitVec 32))) (Intermediate!8896 (undefined!9708 Bool) (index!37957 (_ BitVec 32)) (x!76329 (_ BitVec 32))) (Undefined!8896) (MissingVacant!8896 (index!37958 (_ BitVec 32))) )
))
(declare-fun lt!404806 () SeekEntryResult!8896)

(assert (=> b!896401 (= res!606132 (not (is-Found!8896 lt!404806)))))

(declare-fun e!501036 () Bool)

(assert (=> b!896401 e!501036))

(declare-fun res!606131 () Bool)

(assert (=> b!896401 (=> res!606131 e!501036)))

(assert (=> b!896401 (= res!606131 (not (is-Found!8896 lt!404806)))))

(declare-datatypes ((Unit!30482 0))(
  ( (Unit!30483) )
))
(declare-fun lt!404804 () Unit!30482)

(declare-datatypes ((array!52570 0))(
  ( (array!52571 (arr!25273 (Array (_ BitVec 32) (_ BitVec 64))) (size!25724 (_ BitVec 32))) )
))
(declare-datatypes ((V!29335 0))(
  ( (V!29336 (val!9189 Int)) )
))
(declare-datatypes ((ValueCell!8657 0))(
  ( (ValueCellFull!8657 (v!11679 V!29335)) (EmptyCell!8657) )
))
(declare-datatypes ((array!52572 0))(
  ( (array!52573 (arr!25274 (Array (_ BitVec 32) ValueCell!8657)) (size!25725 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4330 0))(
  ( (LongMapFixedSize!4331 (defaultEntry!5377 Int) (mask!26017 (_ BitVec 32)) (extraKeys!5078 (_ BitVec 32)) (zeroValue!5182 V!29335) (minValue!5182 V!29335) (_size!2220 (_ BitVec 32)) (_keys!10110 array!52570) (_values!5369 array!52572) (_vacant!2220 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4330)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!69 (array!52570 array!52572 (_ BitVec 32) (_ BitVec 32) V!29335 V!29335 (_ BitVec 64)) Unit!30482)

(assert (=> b!896401 (= lt!404804 (lemmaSeekEntryGivesInRangeIndex!69 (_keys!10110 thiss!1181) (_values!5369 thiss!1181) (mask!26017 thiss!1181) (extraKeys!5078 thiss!1181) (zeroValue!5182 thiss!1181) (minValue!5182 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52570 (_ BitVec 32)) SeekEntryResult!8896)

(assert (=> b!896401 (= lt!404806 (seekEntry!0 key!785 (_keys!10110 thiss!1181) (mask!26017 thiss!1181)))))

(declare-fun b!896402 () Bool)

(declare-fun e!501032 () Bool)

(declare-fun e!501031 () Bool)

(declare-fun mapRes!29033 () Bool)

(assert (=> b!896402 (= e!501032 (and e!501031 mapRes!29033))))

(declare-fun condMapEmpty!29033 () Bool)

(declare-fun mapDefault!29033 () ValueCell!8657)

