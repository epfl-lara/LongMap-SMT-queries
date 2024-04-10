; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35778 () Bool)

(assert start!35778)

(declare-fun b!359390 () Bool)

(declare-fun e!220109 () Bool)

(declare-fun e!220110 () Bool)

(declare-fun mapRes!13854 () Bool)

(assert (=> b!359390 (= e!220109 (and e!220110 mapRes!13854))))

(declare-fun condMapEmpty!13854 () Bool)

(declare-datatypes ((V!11951 0))(
  ( (V!11952 (val!4160 Int)) )
))
(declare-datatypes ((ValueCell!3772 0))(
  ( (ValueCellFull!3772 (v!6354 V!11951)) (EmptyCell!3772) )
))
(declare-datatypes ((array!20021 0))(
  ( (array!20022 (arr!9504 (Array (_ BitVec 32) ValueCell!3772)) (size!9856 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20021)

(declare-fun mapDefault!13854 () ValueCell!3772)

