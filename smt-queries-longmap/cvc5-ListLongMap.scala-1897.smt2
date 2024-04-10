; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33872 () Bool)

(assert start!33872)

(declare-fun b_free!7051 () Bool)

(declare-fun b_next!7051 () Bool)

(assert (=> start!33872 (= b_free!7051 (not b_next!7051))))

(declare-fun tp!24665 () Bool)

(declare-fun b_and!14237 () Bool)

(assert (=> start!33872 (= tp!24665 b_and!14237)))

(declare-fun b!337161 () Bool)

(declare-fun e!206911 () Bool)

(declare-fun tp_is_empty!7003 () Bool)

(assert (=> b!337161 (= e!206911 tp_is_empty!7003)))

(declare-fun b!337162 () Bool)

(declare-fun res!186198 () Bool)

(declare-fun e!206914 () Bool)

(assert (=> b!337162 (=> (not res!186198) (not e!206914))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337162 (= res!186198 (validKeyInArray!0 k!1348))))

(declare-fun b!337163 () Bool)

(declare-fun e!206913 () Bool)

(assert (=> b!337163 (= e!206913 tp_is_empty!7003)))

(declare-fun b!337164 () Bool)

(declare-fun e!206916 () Bool)

(assert (=> b!337164 (= e!206914 e!206916)))

(declare-fun res!186197 () Bool)

(assert (=> b!337164 (=> (not res!186197) (not e!206916))))

(declare-datatypes ((SeekEntryResult!3218 0))(
  ( (MissingZero!3218 (index!15051 (_ BitVec 32))) (Found!3218 (index!15052 (_ BitVec 32))) (Intermediate!3218 (undefined!4030 Bool) (index!15053 (_ BitVec 32)) (x!33606 (_ BitVec 32))) (Undefined!3218) (MissingVacant!3218 (index!15054 (_ BitVec 32))) )
))
(declare-fun lt!160383 () SeekEntryResult!3218)

(assert (=> b!337164 (= res!186197 (and (not (is-Found!3218 lt!160383)) (is-MissingZero!3218 lt!160383)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!17601 0))(
  ( (array!17602 (arr!8328 (Array (_ BitVec 32) (_ BitVec 64))) (size!8680 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17601)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17601 (_ BitVec 32)) SeekEntryResult!3218)

(assert (=> b!337164 (= lt!160383 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!337165 () Bool)

(declare-fun res!186200 () Bool)

(assert (=> b!337165 (=> (not res!186200) (not e!206914))))

(declare-datatypes ((V!10315 0))(
  ( (V!10316 (val!3546 Int)) )
))
(declare-fun zeroValue!1467 () V!10315)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3158 0))(
  ( (ValueCellFull!3158 (v!5711 V!10315)) (EmptyCell!3158) )
))
(declare-datatypes ((array!17603 0))(
  ( (array!17604 (arr!8329 (Array (_ BitVec 32) ValueCell!3158)) (size!8681 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17603)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10315)

(declare-datatypes ((tuple2!5150 0))(
  ( (tuple2!5151 (_1!2586 (_ BitVec 64)) (_2!2586 V!10315)) )
))
(declare-datatypes ((List!4766 0))(
  ( (Nil!4763) (Cons!4762 (h!5618 tuple2!5150) (t!9860 List!4766)) )
))
(declare-datatypes ((ListLongMap!4063 0))(
  ( (ListLongMap!4064 (toList!2047 List!4766)) )
))
(declare-fun contains!2094 (ListLongMap!4063 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1568 (array!17601 array!17603 (_ BitVec 32) (_ BitVec 32) V!10315 V!10315 (_ BitVec 32) Int) ListLongMap!4063)

(assert (=> b!337165 (= res!186200 (not (contains!2094 (getCurrentListMap!1568 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!337166 () Bool)

(declare-fun e!206912 () Bool)

(declare-fun mapRes!11910 () Bool)

(assert (=> b!337166 (= e!206912 (and e!206911 mapRes!11910))))

(declare-fun condMapEmpty!11910 () Bool)

(declare-fun mapDefault!11910 () ValueCell!3158)

