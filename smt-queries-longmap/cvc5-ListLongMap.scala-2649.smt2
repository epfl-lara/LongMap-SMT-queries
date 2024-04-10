; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39712 () Bool)

(assert start!39712)

(declare-fun b_free!9979 () Bool)

(declare-fun b_next!9979 () Bool)

(assert (=> start!39712 (= b_free!9979 (not b_next!9979))))

(declare-fun tp!35466 () Bool)

(declare-fun b_and!17635 () Bool)

(assert (=> start!39712 (= tp!35466 b_and!17635)))

(declare-fun b!426911 () Bool)

(declare-fun res!250283 () Bool)

(declare-fun e!253211 () Bool)

(assert (=> b!426911 (=> (not res!250283) (not e!253211))))

(declare-datatypes ((array!26101 0))(
  ( (array!26102 (arr!12500 (Array (_ BitVec 32) (_ BitVec 64))) (size!12852 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26101)

(declare-datatypes ((List!7388 0))(
  ( (Nil!7385) (Cons!7384 (h!8240 (_ BitVec 64)) (t!12832 List!7388)) )
))
(declare-fun arrayNoDuplicates!0 (array!26101 (_ BitVec 32) List!7388) Bool)

(assert (=> b!426911 (= res!250283 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7385))))

(declare-fun b!426912 () Bool)

(declare-fun res!250287 () Bool)

(assert (=> b!426912 (=> (not res!250287) (not e!253211))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426912 (= res!250287 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12852 _keys!709))))))

(declare-fun b!426913 () Bool)

(declare-fun e!253208 () Bool)

(assert (=> b!426913 (= e!253211 e!253208)))

(declare-fun res!250285 () Bool)

(assert (=> b!426913 (=> (not res!250285) (not e!253208))))

(declare-fun lt!195109 () array!26101)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26101 (_ BitVec 32)) Bool)

(assert (=> b!426913 (= res!250285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195109 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!426913 (= lt!195109 (array!26102 (store (arr!12500 _keys!709) i!563 k!794) (size!12852 _keys!709)))))

(declare-fun b!426914 () Bool)

(declare-fun e!253212 () Bool)

(declare-fun e!253210 () Bool)

(declare-fun mapRes!18318 () Bool)

(assert (=> b!426914 (= e!253212 (and e!253210 mapRes!18318))))

(declare-fun condMapEmpty!18318 () Bool)

(declare-datatypes ((V!15947 0))(
  ( (V!15948 (val!5610 Int)) )
))
(declare-datatypes ((ValueCell!5222 0))(
  ( (ValueCellFull!5222 (v!7857 V!15947)) (EmptyCell!5222) )
))
(declare-datatypes ((array!26103 0))(
  ( (array!26104 (arr!12501 (Array (_ BitVec 32) ValueCell!5222)) (size!12853 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26103)

(declare-fun mapDefault!18318 () ValueCell!5222)

