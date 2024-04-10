; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83788 () Bool)

(assert start!83788)

(declare-fun b_free!19597 () Bool)

(declare-fun b_next!19597 () Bool)

(assert (=> start!83788 (= b_free!19597 (not b_next!19597))))

(declare-fun tp!68232 () Bool)

(declare-fun b_and!31283 () Bool)

(assert (=> start!83788 (= tp!68232 b_and!31283)))

(declare-fun b!978525 () Bool)

(declare-fun e!551657 () Bool)

(declare-fun tp_is_empty!22591 () Bool)

(assert (=> b!978525 (= e!551657 tp_is_empty!22591)))

(declare-fun b!978526 () Bool)

(declare-fun e!551658 () Bool)

(declare-fun mapRes!35915 () Bool)

(assert (=> b!978526 (= e!551658 (and e!551657 mapRes!35915))))

(declare-fun condMapEmpty!35915 () Bool)

(declare-datatypes ((V!35105 0))(
  ( (V!35106 (val!11346 Int)) )
))
(declare-datatypes ((ValueCell!10814 0))(
  ( (ValueCellFull!10814 (v!13908 V!35105)) (EmptyCell!10814) )
))
(declare-datatypes ((array!61209 0))(
  ( (array!61210 (arr!29462 (Array (_ BitVec 32) ValueCell!10814)) (size!29941 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61209)

(declare-fun mapDefault!35915 () ValueCell!10814)

