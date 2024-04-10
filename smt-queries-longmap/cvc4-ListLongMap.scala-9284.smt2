; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111056 () Bool)

(assert start!111056)

(declare-fun b_free!29891 () Bool)

(declare-fun b_next!29891 () Bool)

(assert (=> start!111056 (= b_free!29891 (not b_next!29891))))

(declare-fun tp!104994 () Bool)

(declare-fun b_and!48099 () Bool)

(assert (=> start!111056 (= tp!104994 b_and!48099)))

(declare-fun b!1314866 () Bool)

(declare-fun e!750043 () Bool)

(declare-fun e!750044 () Bool)

(declare-fun mapRes!55060 () Bool)

(assert (=> b!1314866 (= e!750043 (and e!750044 mapRes!55060))))

(declare-fun condMapEmpty!55060 () Bool)

(declare-datatypes ((V!52597 0))(
  ( (V!52598 (val!17885 Int)) )
))
(declare-datatypes ((ValueCell!16912 0))(
  ( (ValueCellFull!16912 (v!20512 V!52597)) (EmptyCell!16912) )
))
(declare-datatypes ((array!88208 0))(
  ( (array!88209 (arr!42584 (Array (_ BitVec 32) ValueCell!16912)) (size!43134 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88208)

(declare-fun mapDefault!55060 () ValueCell!16912)

