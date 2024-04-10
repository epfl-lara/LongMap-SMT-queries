; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33634 () Bool)

(assert start!33634)

(declare-fun b_free!6869 () Bool)

(declare-fun b_next!6869 () Bool)

(assert (=> start!33634 (= b_free!6869 (not b_next!6869))))

(declare-fun tp!24110 () Bool)

(declare-fun b_and!14049 () Bool)

(assert (=> start!33634 (= tp!24110 b_and!14049)))

(declare-fun b!333843 () Bool)

(declare-fun res!183941 () Bool)

(declare-fun e!204971 () Bool)

(assert (=> b!333843 (=> (not res!183941) (not e!204971))))

(declare-datatypes ((SeekEntryResult!3147 0))(
  ( (MissingZero!3147 (index!14767 (_ BitVec 32))) (Found!3147 (index!14768 (_ BitVec 32))) (Intermediate!3147 (undefined!3959 Bool) (index!14769 (_ BitVec 32)) (x!33257 (_ BitVec 32))) (Undefined!3147) (MissingVacant!3147 (index!14770 (_ BitVec 32))) )
))
(declare-fun lt!159415 () SeekEntryResult!3147)

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!17237 0))(
  ( (array!17238 (arr!8149 (Array (_ BitVec 32) (_ BitVec 64))) (size!8501 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17237)

(declare-fun arrayContainsKey!0 (array!17237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333843 (= res!183941 (arrayContainsKey!0 _keys!1895 k!1348 (index!14768 lt!159415)))))

(declare-fun b!333844 () Bool)

(declare-fun res!183944 () Bool)

(declare-fun e!204972 () Bool)

(assert (=> b!333844 (=> (not res!183944) (not e!204972))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17237 (_ BitVec 32)) Bool)

(assert (=> b!333844 (= res!183944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11628 () Bool)

(declare-fun mapRes!11628 () Bool)

(declare-fun tp!24111 () Bool)

(declare-fun e!204973 () Bool)

(assert (=> mapNonEmpty!11628 (= mapRes!11628 (and tp!24111 e!204973))))

(declare-datatypes ((V!10071 0))(
  ( (V!10072 (val!3455 Int)) )
))
(declare-datatypes ((ValueCell!3067 0))(
  ( (ValueCellFull!3067 (v!5617 V!10071)) (EmptyCell!3067) )
))
(declare-fun mapValue!11628 () ValueCell!3067)

(declare-fun mapKey!11628 () (_ BitVec 32))

(declare-fun mapRest!11628 () (Array (_ BitVec 32) ValueCell!3067))

(declare-datatypes ((array!17239 0))(
  ( (array!17240 (arr!8150 (Array (_ BitVec 32) ValueCell!3067)) (size!8502 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17239)

(assert (=> mapNonEmpty!11628 (= (arr!8150 _values!1525) (store mapRest!11628 mapKey!11628 mapValue!11628))))

(declare-fun b!333845 () Bool)

(declare-fun res!183946 () Bool)

(assert (=> b!333845 (=> (not res!183946) (not e!204972))))

(declare-fun zeroValue!1467 () V!10071)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10071)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5020 0))(
  ( (tuple2!5021 (_1!2521 (_ BitVec 64)) (_2!2521 V!10071)) )
))
(declare-datatypes ((List!4640 0))(
  ( (Nil!4637) (Cons!4636 (h!5492 tuple2!5020) (t!9728 List!4640)) )
))
(declare-datatypes ((ListLongMap!3933 0))(
  ( (ListLongMap!3934 (toList!1982 List!4640)) )
))
(declare-fun contains!2026 (ListLongMap!3933 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1510 (array!17237 array!17239 (_ BitVec 32) (_ BitVec 32) V!10071 V!10071 (_ BitVec 32) Int) ListLongMap!3933)

(assert (=> b!333845 (= res!183946 (not (contains!2026 (getCurrentListMap!1510 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!333846 () Bool)

(declare-fun res!183943 () Bool)

(assert (=> b!333846 (=> (not res!183943) (not e!204972))))

(declare-datatypes ((List!4641 0))(
  ( (Nil!4638) (Cons!4637 (h!5493 (_ BitVec 64)) (t!9729 List!4641)) )
))
(declare-fun arrayNoDuplicates!0 (array!17237 (_ BitVec 32) List!4641) Bool)

(assert (=> b!333846 (= res!183943 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4638))))

(declare-fun b!333848 () Bool)

(declare-fun tp_is_empty!6821 () Bool)

(assert (=> b!333848 (= e!204973 tp_is_empty!6821)))

(declare-fun b!333849 () Bool)

(declare-fun e!204974 () Bool)

(declare-fun e!204975 () Bool)

(assert (=> b!333849 (= e!204974 (and e!204975 mapRes!11628))))

(declare-fun condMapEmpty!11628 () Bool)

(declare-fun mapDefault!11628 () ValueCell!3067)

