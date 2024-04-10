; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38260 () Bool)

(assert start!38260)

(declare-fun b!394763 () Bool)

(declare-fun e!238987 () Bool)

(declare-fun tp_is_empty!9769 () Bool)

(assert (=> b!394763 (= e!238987 tp_is_empty!9769)))

(declare-fun b!394764 () Bool)

(declare-fun e!238990 () Bool)

(declare-datatypes ((array!23443 0))(
  ( (array!23444 (arr!11178 (Array (_ BitVec 32) (_ BitVec 64))) (size!11530 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23443)

(assert (=> b!394764 (= e!238990 (and (bvsle #b00000000000000000000000000000000 (size!11530 _keys!709)) (bvsge (size!11530 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!16254 () Bool)

(declare-fun mapRes!16254 () Bool)

(assert (=> mapIsEmpty!16254 mapRes!16254))

(declare-fun b!394765 () Bool)

(declare-fun res!226283 () Bool)

(assert (=> b!394765 (=> (not res!226283) (not e!238990))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394765 (= res!226283 (validMask!0 mask!1025))))

(declare-fun b!394766 () Bool)

(declare-fun res!226281 () Bool)

(assert (=> b!394766 (=> (not res!226281) (not e!238990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23443 (_ BitVec 32)) Bool)

(assert (=> b!394766 (= res!226281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!394767 () Bool)

(declare-fun e!238989 () Bool)

(assert (=> b!394767 (= e!238989 (and e!238987 mapRes!16254))))

(declare-fun condMapEmpty!16254 () Bool)

(declare-datatypes ((V!14131 0))(
  ( (V!14132 (val!4929 Int)) )
))
(declare-datatypes ((ValueCell!4541 0))(
  ( (ValueCellFull!4541 (v!7174 V!14131)) (EmptyCell!4541) )
))
(declare-datatypes ((array!23445 0))(
  ( (array!23446 (arr!11179 (Array (_ BitVec 32) ValueCell!4541)) (size!11531 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23445)

(declare-fun mapDefault!16254 () ValueCell!4541)

