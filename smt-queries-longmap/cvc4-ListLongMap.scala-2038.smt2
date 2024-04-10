; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35400 () Bool)

(assert start!35400)

(declare-fun b!354386 () Bool)

(declare-fun e!217196 () Bool)

(declare-fun e!217192 () Bool)

(declare-fun mapRes!13287 () Bool)

(assert (=> b!354386 (= e!217196 (and e!217192 mapRes!13287))))

(declare-fun condMapEmpty!13287 () Bool)

(declare-datatypes ((V!11447 0))(
  ( (V!11448 (val!3971 Int)) )
))
(declare-datatypes ((ValueCell!3583 0))(
  ( (ValueCellFull!3583 (v!6165 V!11447)) (EmptyCell!3583) )
))
(declare-datatypes ((array!19291 0))(
  ( (array!19292 (arr!9139 (Array (_ BitVec 32) ValueCell!3583)) (size!9491 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19291)

(declare-fun mapDefault!13287 () ValueCell!3583)

