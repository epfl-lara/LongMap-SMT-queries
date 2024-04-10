; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41440 () Bool)

(assert start!41440)

(declare-fun b_free!11119 () Bool)

(declare-fun b_next!11119 () Bool)

(assert (=> start!41440 (= b_free!11119 (not b_next!11119))))

(declare-fun tp!39352 () Bool)

(declare-fun b_and!19455 () Bool)

(assert (=> start!41440 (= tp!39352 b_and!19455)))

(declare-fun b!463023 () Bool)

(declare-fun res!276881 () Bool)

(declare-fun e!270291 () Bool)

(assert (=> b!463023 (=> (not res!276881) (not e!270291))))

(declare-datatypes ((array!28891 0))(
  ( (array!28892 (arr!13878 (Array (_ BitVec 32) (_ BitVec 64))) (size!14230 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28891)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28891 (_ BitVec 32)) Bool)

(assert (=> b!463023 (= res!276881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463024 () Bool)

(declare-fun e!270294 () Bool)

(declare-fun tp_is_empty!12547 () Bool)

(assert (=> b!463024 (= e!270294 tp_is_empty!12547)))

(declare-fun b!463025 () Bool)

(declare-fun e!270293 () Bool)

(assert (=> b!463025 (= e!270293 tp_is_empty!12547)))

(declare-fun b!463026 () Bool)

(declare-fun res!276880 () Bool)

(assert (=> b!463026 (=> (not res!276880) (not e!270291))))

(declare-datatypes ((List!8370 0))(
  ( (Nil!8367) (Cons!8366 (h!9222 (_ BitVec 64)) (t!14314 List!8370)) )
))
(declare-fun arrayNoDuplicates!0 (array!28891 (_ BitVec 32) List!8370) Bool)

(assert (=> b!463026 (= res!276880 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8367))))

(declare-fun b!463027 () Bool)

(declare-fun e!270290 () Bool)

(declare-fun mapRes!20494 () Bool)

(assert (=> b!463027 (= e!270290 (and e!270293 mapRes!20494))))

(declare-fun condMapEmpty!20494 () Bool)

(declare-datatypes ((V!17835 0))(
  ( (V!17836 (val!6318 Int)) )
))
(declare-datatypes ((ValueCell!5930 0))(
  ( (ValueCellFull!5930 (v!8605 V!17835)) (EmptyCell!5930) )
))
(declare-datatypes ((array!28893 0))(
  ( (array!28894 (arr!13879 (Array (_ BitVec 32) ValueCell!5930)) (size!14231 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28893)

(declare-fun mapDefault!20494 () ValueCell!5930)

