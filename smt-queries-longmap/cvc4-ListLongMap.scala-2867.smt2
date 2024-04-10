; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41282 () Bool)

(assert start!41282)

(declare-fun b!461863 () Bool)

(declare-fun e!269392 () Bool)

(declare-fun e!269390 () Bool)

(declare-fun mapRes!20320 () Bool)

(assert (=> b!461863 (= e!269392 (and e!269390 mapRes!20320))))

(declare-fun condMapEmpty!20320 () Bool)

(declare-datatypes ((V!17695 0))(
  ( (V!17696 (val!6266 Int)) )
))
(declare-datatypes ((ValueCell!5878 0))(
  ( (ValueCellFull!5878 (v!8552 V!17695)) (EmptyCell!5878) )
))
(declare-datatypes ((array!28683 0))(
  ( (array!28684 (arr!13780 (Array (_ BitVec 32) ValueCell!5878)) (size!14132 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28683)

(declare-fun mapDefault!20320 () ValueCell!5878)

