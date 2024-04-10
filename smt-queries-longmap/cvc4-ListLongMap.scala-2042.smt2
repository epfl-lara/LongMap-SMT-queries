; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35424 () Bool)

(assert start!35424)

(declare-fun mapIsEmpty!13323 () Bool)

(declare-fun mapRes!13323 () Bool)

(assert (=> mapIsEmpty!13323 mapRes!13323))

(declare-fun b!354602 () Bool)

(declare-fun e!217375 () Bool)

(declare-fun tp_is_empty!7877 () Bool)

(assert (=> b!354602 (= e!217375 tp_is_empty!7877)))

(declare-fun b!354603 () Bool)

(declare-fun res!196560 () Bool)

(declare-fun e!217376 () Bool)

(assert (=> b!354603 (=> (not res!196560) (not e!217376))))

(declare-datatypes ((array!19335 0))(
  ( (array!19336 (arr!9161 (Array (_ BitVec 32) (_ BitVec 64))) (size!9513 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19335)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19335 (_ BitVec 32)) Bool)

(assert (=> b!354603 (= res!196560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354604 () Bool)

(declare-fun e!217373 () Bool)

(assert (=> b!354604 (= e!217373 (and e!217375 mapRes!13323))))

(declare-fun condMapEmpty!13323 () Bool)

(declare-datatypes ((V!11479 0))(
  ( (V!11480 (val!3983 Int)) )
))
(declare-datatypes ((ValueCell!3595 0))(
  ( (ValueCellFull!3595 (v!6177 V!11479)) (EmptyCell!3595) )
))
(declare-datatypes ((array!19337 0))(
  ( (array!19338 (arr!9162 (Array (_ BitVec 32) ValueCell!3595)) (size!9514 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19337)

(declare-fun mapDefault!13323 () ValueCell!3595)

