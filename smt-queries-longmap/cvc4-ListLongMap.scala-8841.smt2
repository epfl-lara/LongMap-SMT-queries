; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107274 () Bool)

(assert start!107274)

(declare-fun b!1271489 () Bool)

(declare-fun e!725055 () Bool)

(declare-fun e!725054 () Bool)

(declare-fun mapRes!51025 () Bool)

(assert (=> b!1271489 (= e!725055 (and e!725054 mapRes!51025))))

(declare-fun condMapEmpty!51025 () Bool)

(declare-datatypes ((V!49143 0))(
  ( (V!49144 (val!16556 Int)) )
))
(declare-datatypes ((ValueCell!15628 0))(
  ( (ValueCellFull!15628 (v!19193 V!49143)) (EmptyCell!15628) )
))
(declare-datatypes ((array!83176 0))(
  ( (array!83177 (arr!40125 (Array (_ BitVec 32) ValueCell!15628)) (size!40661 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83176)

(declare-fun mapDefault!51025 () ValueCell!15628)

