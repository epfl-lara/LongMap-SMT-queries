; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39718 () Bool)

(assert start!39718)

(declare-fun b_free!9985 () Bool)

(declare-fun b_next!9985 () Bool)

(assert (=> start!39718 (= b_free!9985 (not b_next!9985))))

(declare-fun tp!35484 () Bool)

(declare-fun b_and!17641 () Bool)

(assert (=> start!39718 (= tp!35484 b_and!17641)))

(declare-fun b!427055 () Bool)

(declare-fun res!250405 () Bool)

(declare-fun e!253273 () Bool)

(assert (=> b!427055 (=> (not res!250405) (not e!253273))))

(declare-datatypes ((array!26113 0))(
  ( (array!26114 (arr!12506 (Array (_ BitVec 32) (_ BitVec 64))) (size!12858 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26113)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427055 (= res!250405 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!427056 () Bool)

(declare-fun e!253269 () Bool)

(assert (=> b!427056 (= e!253273 e!253269)))

(declare-fun res!250401 () Bool)

(assert (=> b!427056 (=> (not res!250401) (not e!253269))))

(declare-fun lt!195156 () array!26113)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26113 (_ BitVec 32)) Bool)

(assert (=> b!427056 (= res!250401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195156 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427056 (= lt!195156 (array!26114 (store (arr!12506 _keys!709) i!563 k!794) (size!12858 _keys!709)))))

(declare-fun b!427057 () Bool)

(declare-fun res!250399 () Bool)

(assert (=> b!427057 (=> (not res!250399) (not e!253273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427057 (= res!250399 (validKeyInArray!0 k!794))))

(declare-fun b!427058 () Bool)

(declare-fun e!253271 () Bool)

(declare-fun e!253275 () Bool)

(declare-fun mapRes!18327 () Bool)

(assert (=> b!427058 (= e!253271 (and e!253275 mapRes!18327))))

(declare-fun condMapEmpty!18327 () Bool)

(declare-datatypes ((V!15955 0))(
  ( (V!15956 (val!5613 Int)) )
))
(declare-datatypes ((ValueCell!5225 0))(
  ( (ValueCellFull!5225 (v!7860 V!15955)) (EmptyCell!5225) )
))
(declare-datatypes ((array!26115 0))(
  ( (array!26116 (arr!12507 (Array (_ BitVec 32) ValueCell!5225)) (size!12859 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26115)

(declare-fun mapDefault!18327 () ValueCell!5225)

