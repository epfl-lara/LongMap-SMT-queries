; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111050 () Bool)

(assert start!111050)

(declare-fun b_free!29885 () Bool)

(declare-fun b_next!29885 () Bool)

(assert (=> start!111050 (= b_free!29885 (not b_next!29885))))

(declare-fun tp!104977 () Bool)

(declare-fun b_and!48093 () Bool)

(assert (=> start!111050 (= tp!104977 b_and!48093)))

(declare-fun b!1314794 () Bool)

(declare-fun e!750002 () Bool)

(declare-fun e!750000 () Bool)

(declare-fun mapRes!55051 () Bool)

(assert (=> b!1314794 (= e!750002 (and e!750000 mapRes!55051))))

(declare-fun condMapEmpty!55051 () Bool)

(declare-datatypes ((V!52589 0))(
  ( (V!52590 (val!17882 Int)) )
))
(declare-datatypes ((ValueCell!16909 0))(
  ( (ValueCellFull!16909 (v!20509 V!52589)) (EmptyCell!16909) )
))
(declare-datatypes ((array!88198 0))(
  ( (array!88199 (arr!42579 (Array (_ BitVec 32) ValueCell!16909)) (size!43129 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88198)

(declare-fun mapDefault!55051 () ValueCell!16909)

