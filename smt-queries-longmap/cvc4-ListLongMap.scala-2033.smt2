; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35370 () Bool)

(assert start!35370)

(declare-fun b!354116 () Bool)

(declare-fun e!216969 () Bool)

(declare-fun tp_is_empty!7823 () Bool)

(assert (=> b!354116 (= e!216969 tp_is_empty!7823)))

(declare-fun mapIsEmpty!13242 () Bool)

(declare-fun mapRes!13242 () Bool)

(assert (=> mapIsEmpty!13242 mapRes!13242))

(declare-fun res!196316 () Bool)

(declare-fun e!216971 () Bool)

(assert (=> start!35370 (=> (not res!196316) (not e!216971))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35370 (= res!196316 (validMask!0 mask!1842))))

(assert (=> start!35370 e!216971))

(assert (=> start!35370 true))

(declare-datatypes ((V!11407 0))(
  ( (V!11408 (val!3956 Int)) )
))
(declare-datatypes ((ValueCell!3568 0))(
  ( (ValueCellFull!3568 (v!6150 V!11407)) (EmptyCell!3568) )
))
(declare-datatypes ((array!19235 0))(
  ( (array!19236 (arr!9111 (Array (_ BitVec 32) ValueCell!3568)) (size!9463 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19235)

(declare-fun e!216968 () Bool)

(declare-fun array_inv!6704 (array!19235) Bool)

(assert (=> start!35370 (and (array_inv!6704 _values!1208) e!216968)))

(declare-datatypes ((array!19237 0))(
  ( (array!19238 (arr!9112 (Array (_ BitVec 32) (_ BitVec 64))) (size!9464 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19237)

(declare-fun array_inv!6705 (array!19237) Bool)

(assert (=> start!35370 (array_inv!6705 _keys!1456)))

(declare-fun b!354117 () Bool)

(declare-fun e!216970 () Bool)

(assert (=> b!354117 (= e!216970 tp_is_empty!7823)))

(declare-fun b!354118 () Bool)

(assert (=> b!354118 (= e!216968 (and e!216970 mapRes!13242))))

(declare-fun condMapEmpty!13242 () Bool)

(declare-fun mapDefault!13242 () ValueCell!3568)

