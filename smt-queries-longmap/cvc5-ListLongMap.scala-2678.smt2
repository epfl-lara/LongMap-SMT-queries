; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39886 () Bool)

(assert start!39886)

(declare-fun b_free!10153 () Bool)

(declare-fun b_next!10153 () Bool)

(assert (=> start!39886 (= b_free!10153 (not b_next!10153))))

(declare-fun tp!35987 () Bool)

(declare-fun b_and!17965 () Bool)

(assert (=> start!39886 (= tp!35987 b_and!17965)))

(declare-fun mapNonEmpty!18579 () Bool)

(declare-fun mapRes!18579 () Bool)

(declare-fun tp!35988 () Bool)

(declare-fun e!255560 () Bool)

(assert (=> mapNonEmpty!18579 (= mapRes!18579 (and tp!35988 e!255560))))

(declare-datatypes ((V!16179 0))(
  ( (V!16180 (val!5697 Int)) )
))
(declare-datatypes ((ValueCell!5309 0))(
  ( (ValueCellFull!5309 (v!7944 V!16179)) (EmptyCell!5309) )
))
(declare-fun mapValue!18579 () ValueCell!5309)

(declare-fun mapKey!18579 () (_ BitVec 32))

(declare-datatypes ((array!26445 0))(
  ( (array!26446 (arr!12672 (Array (_ BitVec 32) ValueCell!5309)) (size!13024 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26445)

(declare-fun mapRest!18579 () (Array (_ BitVec 32) ValueCell!5309))

(assert (=> mapNonEmpty!18579 (= (arr!12672 _values!549) (store mapRest!18579 mapKey!18579 mapValue!18579))))

(declare-fun b!431944 () Bool)

(declare-fun res!254017 () Bool)

(declare-fun e!255556 () Bool)

(assert (=> b!431944 (=> (not res!254017) (not e!255556))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431944 (= res!254017 (validMask!0 mask!1025))))

(declare-fun b!431945 () Bool)

(declare-fun e!255557 () Bool)

(declare-fun e!255552 () Bool)

(assert (=> b!431945 (= e!255557 (and e!255552 mapRes!18579))))

(declare-fun condMapEmpty!18579 () Bool)

(declare-fun mapDefault!18579 () ValueCell!5309)

