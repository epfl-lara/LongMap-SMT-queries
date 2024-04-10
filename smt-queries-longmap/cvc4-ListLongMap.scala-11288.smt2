; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131592 () Bool)

(assert start!131592)

(declare-fun b!1541555 () Bool)

(declare-fun e!857404 () Bool)

(declare-fun tp_is_empty!37625 () Bool)

(assert (=> b!1541555 (= e!857404 tp_is_empty!37625)))

(declare-fun b!1541556 () Bool)

(declare-fun e!857400 () Bool)

(declare-fun mapRes!58126 () Bool)

(assert (=> b!1541556 (= e!857400 (and e!857404 mapRes!58126))))

(declare-fun condMapEmpty!58126 () Bool)

(declare-datatypes ((V!58609 0))(
  ( (V!58610 (val!18890 Int)) )
))
(declare-datatypes ((ValueCell!17902 0))(
  ( (ValueCellFull!17902 (v!21690 V!58609)) (EmptyCell!17902) )
))
(declare-datatypes ((array!102484 0))(
  ( (array!102485 (arr!49449 (Array (_ BitVec 32) ValueCell!17902)) (size!49999 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102484)

(declare-fun mapDefault!58126 () ValueCell!17902)

