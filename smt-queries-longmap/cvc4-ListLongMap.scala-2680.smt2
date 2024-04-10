; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39902 () Bool)

(assert start!39902)

(declare-fun b_free!10169 () Bool)

(declare-fun b_next!10169 () Bool)

(assert (=> start!39902 (= b_free!10169 (not b_next!10169))))

(declare-fun tp!36035 () Bool)

(declare-fun b_and!17997 () Bool)

(assert (=> start!39902 (= tp!36035 b_and!17997)))

(declare-fun b!432440 () Bool)

(declare-fun res!254380 () Bool)

(declare-fun e!255796 () Bool)

(assert (=> b!432440 (=> (not res!254380) (not e!255796))))

(declare-datatypes ((array!26475 0))(
  ( (array!26476 (arr!12687 (Array (_ BitVec 32) (_ BitVec 64))) (size!13039 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26475)

(declare-datatypes ((List!7544 0))(
  ( (Nil!7541) (Cons!7540 (h!8396 (_ BitVec 64)) (t!13162 List!7544)) )
))
(declare-fun arrayNoDuplicates!0 (array!26475 (_ BitVec 32) List!7544) Bool)

(assert (=> b!432440 (= res!254380 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7541))))

(declare-fun b!432441 () Bool)

(declare-datatypes ((Unit!12772 0))(
  ( (Unit!12773) )
))
(declare-fun e!255799 () Unit!12772)

(declare-fun Unit!12774 () Unit!12772)

(assert (=> b!432441 (= e!255799 Unit!12774)))

(declare-fun mapIsEmpty!18603 () Bool)

(declare-fun mapRes!18603 () Bool)

(assert (=> mapIsEmpty!18603 mapRes!18603))

(declare-fun b!432443 () Bool)

(declare-fun e!255794 () Bool)

(declare-fun e!255800 () Bool)

(assert (=> b!432443 (= e!255794 (and e!255800 mapRes!18603))))

(declare-fun condMapEmpty!18603 () Bool)

(declare-datatypes ((V!16199 0))(
  ( (V!16200 (val!5705 Int)) )
))
(declare-datatypes ((ValueCell!5317 0))(
  ( (ValueCellFull!5317 (v!7952 V!16199)) (EmptyCell!5317) )
))
(declare-datatypes ((array!26477 0))(
  ( (array!26478 (arr!12688 (Array (_ BitVec 32) ValueCell!5317)) (size!13040 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26477)

(declare-fun mapDefault!18603 () ValueCell!5317)

