; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37928 () Bool)

(assert start!37928)

(declare-fun b_free!8941 () Bool)

(declare-fun b_next!8941 () Bool)

(assert (=> start!37928 (= b_free!8941 (not b_next!8941))))

(declare-fun tp!31586 () Bool)

(declare-fun b_and!16231 () Bool)

(assert (=> start!37928 (= tp!31586 b_and!16231)))

(declare-fun b!389982 () Bool)

(declare-fun res!223108 () Bool)

(declare-fun e!236260 () Bool)

(assert (=> b!389982 (=> (not res!223108) (not e!236260))))

(declare-datatypes ((array!23123 0))(
  ( (array!23124 (arr!11026 (Array (_ BitVec 32) (_ BitVec 64))) (size!11378 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23123)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389982 (= res!223108 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!389983 () Bool)

(declare-fun res!223098 () Bool)

(assert (=> b!389983 (=> (not res!223098) (not e!236260))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13923 0))(
  ( (V!13924 (val!4851 Int)) )
))
(declare-datatypes ((ValueCell!4463 0))(
  ( (ValueCellFull!4463 (v!7064 V!13923)) (EmptyCell!4463) )
))
(declare-datatypes ((array!23125 0))(
  ( (array!23126 (arr!11027 (Array (_ BitVec 32) ValueCell!4463)) (size!11379 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23125)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!389983 (= res!223098 (and (= (size!11379 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11378 _keys!658) (size!11379 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!389984 () Bool)

(declare-fun e!236261 () Bool)

(declare-fun tp_is_empty!9613 () Bool)

(assert (=> b!389984 (= e!236261 tp_is_empty!9613)))

(declare-fun b!389985 () Bool)

(declare-fun e!236256 () Bool)

(assert (=> b!389985 (= e!236260 e!236256)))

(declare-fun res!223106 () Bool)

(assert (=> b!389985 (=> (not res!223106) (not e!236256))))

(declare-fun lt!183618 () array!23123)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23123 (_ BitVec 32)) Bool)

(assert (=> b!389985 (= res!223106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183618 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!389985 (= lt!183618 (array!23124 (store (arr!11026 _keys!658) i!548 k!778) (size!11378 _keys!658)))))

(declare-fun b!389986 () Bool)

(declare-fun res!223104 () Bool)

(assert (=> b!389986 (=> (not res!223104) (not e!236260))))

(declare-datatypes ((List!6379 0))(
  ( (Nil!6376) (Cons!6375 (h!7231 (_ BitVec 64)) (t!11537 List!6379)) )
))
(declare-fun arrayNoDuplicates!0 (array!23123 (_ BitVec 32) List!6379) Bool)

(assert (=> b!389986 (= res!223104 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6376))))

(declare-fun b!389987 () Bool)

(declare-fun e!236262 () Bool)

(declare-fun e!236257 () Bool)

(declare-fun mapRes!15996 () Bool)

(assert (=> b!389987 (= e!236262 (and e!236257 mapRes!15996))))

(declare-fun condMapEmpty!15996 () Bool)

(declare-fun mapDefault!15996 () ValueCell!4463)

