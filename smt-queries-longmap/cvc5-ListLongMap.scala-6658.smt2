; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83920 () Bool)

(assert start!83920)

(declare-fun b!980791 () Bool)

(declare-fun e!552812 () Bool)

(declare-fun e!552810 () Bool)

(declare-fun mapRes!36113 () Bool)

(assert (=> b!980791 (= e!552812 (and e!552810 mapRes!36113))))

(declare-fun condMapEmpty!36113 () Bool)

(declare-datatypes ((V!35281 0))(
  ( (V!35282 (val!11412 Int)) )
))
(declare-datatypes ((ValueCell!10880 0))(
  ( (ValueCellFull!10880 (v!13974 V!35281)) (EmptyCell!10880) )
))
(declare-datatypes ((array!61453 0))(
  ( (array!61454 (arr!29584 (Array (_ BitVec 32) ValueCell!10880)) (size!30063 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61453)

(declare-fun mapDefault!36113 () ValueCell!10880)

