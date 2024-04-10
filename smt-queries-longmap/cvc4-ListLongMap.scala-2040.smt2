; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35412 () Bool)

(assert start!35412)

(declare-fun b!354494 () Bool)

(declare-fun e!217286 () Bool)

(declare-fun tp_is_empty!7865 () Bool)

(assert (=> b!354494 (= e!217286 tp_is_empty!7865)))

(declare-fun b!354495 () Bool)

(declare-fun res!196507 () Bool)

(declare-fun e!217284 () Bool)

(assert (=> b!354495 (=> (not res!196507) (not e!217284))))

(declare-datatypes ((array!19313 0))(
  ( (array!19314 (arr!9150 (Array (_ BitVec 32) (_ BitVec 64))) (size!9502 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19313)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19313 (_ BitVec 32)) Bool)

(assert (=> b!354495 (= res!196507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13305 () Bool)

(declare-fun mapRes!13305 () Bool)

(assert (=> mapIsEmpty!13305 mapRes!13305))

(declare-fun b!354496 () Bool)

(declare-fun e!217282 () Bool)

(assert (=> b!354496 (= e!217282 tp_is_empty!7865)))

(declare-fun b!354497 () Bool)

(declare-fun e!217283 () Bool)

(assert (=> b!354497 (= e!217283 (and e!217282 mapRes!13305))))

(declare-fun condMapEmpty!13305 () Bool)

(declare-datatypes ((V!11463 0))(
  ( (V!11464 (val!3977 Int)) )
))
(declare-datatypes ((ValueCell!3589 0))(
  ( (ValueCellFull!3589 (v!6171 V!11463)) (EmptyCell!3589) )
))
(declare-datatypes ((array!19315 0))(
  ( (array!19316 (arr!9151 (Array (_ BitVec 32) ValueCell!3589)) (size!9503 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19315)

(declare-fun mapDefault!13305 () ValueCell!3589)

