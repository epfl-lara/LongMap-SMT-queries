; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33742 () Bool)

(assert start!33742)

(declare-fun b_free!6977 () Bool)

(declare-fun b_next!6977 () Bool)

(assert (=> start!33742 (= b_free!6977 (not b_next!6977))))

(declare-fun tp!24435 () Bool)

(declare-fun b_and!14157 () Bool)

(assert (=> start!33742 (= tp!24435 b_and!14157)))

(declare-fun b!335625 () Bool)

(declare-fun e!206022 () Bool)

(assert (=> b!335625 (= e!206022 (not true))))

(declare-datatypes ((V!10215 0))(
  ( (V!10216 (val!3509 Int)) )
))
(declare-datatypes ((tuple2!5100 0))(
  ( (tuple2!5101 (_1!2561 (_ BitVec 64)) (_2!2561 V!10215)) )
))
(declare-datatypes ((List!4718 0))(
  ( (Nil!4715) (Cons!4714 (h!5570 tuple2!5100) (t!9806 List!4718)) )
))
(declare-datatypes ((ListLongMap!4013 0))(
  ( (ListLongMap!4014 (toList!2022 List!4718)) )
))
(declare-fun lt!159899 () ListLongMap!4013)

(declare-datatypes ((array!17451 0))(
  ( (array!17452 (arr!8256 (Array (_ BitVec 32) (_ BitVec 64))) (size!8608 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17451)

(declare-datatypes ((SeekEntryResult!3193 0))(
  ( (MissingZero!3193 (index!14951 (_ BitVec 32))) (Found!3193 (index!14952 (_ BitVec 32))) (Intermediate!3193 (undefined!4005 Bool) (index!14953 (_ BitVec 32)) (x!33447 (_ BitVec 32))) (Undefined!3193) (MissingVacant!3193 (index!14954 (_ BitVec 32))) )
))
(declare-fun lt!159901 () SeekEntryResult!3193)

(declare-fun contains!2066 (ListLongMap!4013 (_ BitVec 64)) Bool)

(assert (=> b!335625 (contains!2066 lt!159899 (select (arr!8256 _keys!1895) (index!14952 lt!159901)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10215)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3121 0))(
  ( (ValueCellFull!3121 (v!5671 V!10215)) (EmptyCell!3121) )
))
(declare-datatypes ((array!17453 0))(
  ( (array!17454 (arr!8257 (Array (_ BitVec 32) ValueCell!3121)) (size!8609 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17453)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10215)

(declare-datatypes ((Unit!10449 0))(
  ( (Unit!10450) )
))
(declare-fun lt!159898 () Unit!10449)

(declare-fun lemmaValidKeyInArrayIsInListMap!171 (array!17451 array!17453 (_ BitVec 32) (_ BitVec 32) V!10215 V!10215 (_ BitVec 32) Int) Unit!10449)

(assert (=> b!335625 (= lt!159898 (lemmaValidKeyInArrayIsInListMap!171 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14952 lt!159901) defaultEntry!1528))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335625 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159900 () Unit!10449)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17451 (_ BitVec 64) (_ BitVec 32)) Unit!10449)

(assert (=> b!335625 (= lt!159900 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14952 lt!159901)))))

(declare-fun b!335626 () Bool)

(declare-fun e!206028 () Bool)

(declare-fun e!206024 () Bool)

(declare-fun mapRes!11790 () Bool)

(assert (=> b!335626 (= e!206028 (and e!206024 mapRes!11790))))

(declare-fun condMapEmpty!11790 () Bool)

(declare-fun mapDefault!11790 () ValueCell!3121)

