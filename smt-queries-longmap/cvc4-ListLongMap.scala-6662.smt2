; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83948 () Bool)

(assert start!83948)

(declare-fun b!981043 () Bool)

(declare-fun e!553021 () Bool)

(declare-fun tp_is_empty!22751 () Bool)

(assert (=> b!981043 (= e!553021 tp_is_empty!22751)))

(declare-fun b!981044 () Bool)

(declare-fun e!553019 () Bool)

(declare-fun mapRes!36155 () Bool)

(assert (=> b!981044 (= e!553019 (and e!553021 mapRes!36155))))

(declare-fun condMapEmpty!36155 () Bool)

(declare-datatypes ((V!35317 0))(
  ( (V!35318 (val!11426 Int)) )
))
(declare-datatypes ((ValueCell!10894 0))(
  ( (ValueCellFull!10894 (v!13988 V!35317)) (EmptyCell!10894) )
))
(declare-datatypes ((array!61503 0))(
  ( (array!61504 (arr!29609 (Array (_ BitVec 32) ValueCell!10894)) (size!30088 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61503)

(declare-fun mapDefault!36155 () ValueCell!10894)

