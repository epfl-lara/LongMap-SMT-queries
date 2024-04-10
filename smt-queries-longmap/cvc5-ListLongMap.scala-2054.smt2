; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35492 () Bool)

(assert start!35492)

(declare-fun b!355700 () Bool)

(declare-fun e!217885 () Bool)

(declare-fun e!217884 () Bool)

(declare-fun mapRes!13425 () Bool)

(assert (=> b!355700 (= e!217885 (and e!217884 mapRes!13425))))

(declare-fun condMapEmpty!13425 () Bool)

(declare-datatypes ((V!11571 0))(
  ( (V!11572 (val!4017 Int)) )
))
(declare-datatypes ((ValueCell!3629 0))(
  ( (ValueCellFull!3629 (v!6211 V!11571)) (EmptyCell!3629) )
))
(declare-datatypes ((array!19469 0))(
  ( (array!19470 (arr!9228 (Array (_ BitVec 32) ValueCell!3629)) (size!9580 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19469)

(declare-fun mapDefault!13425 () ValueCell!3629)

