; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110894 () Bool)

(assert start!110894)

(declare-fun b_free!29729 () Bool)

(declare-fun b_next!29729 () Bool)

(assert (=> start!110894 (= b_free!29729 (not b_next!29729))))

(declare-fun tp!104509 () Bool)

(declare-fun b_and!47937 () Bool)

(assert (=> start!110894 (= tp!104509 b_and!47937)))

(declare-fun b!1312859 () Bool)

(declare-fun res!871626 () Bool)

(declare-fun e!748832 () Bool)

(assert (=> b!1312859 (=> (not res!871626) (not e!748832))))

(declare-datatypes ((array!87900 0))(
  ( (array!87901 (arr!42430 (Array (_ BitVec 32) (_ BitVec 64))) (size!42980 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87900)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87900 (_ BitVec 32)) Bool)

(assert (=> b!1312859 (= res!871626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312860 () Bool)

(declare-fun e!748831 () Bool)

(declare-fun tp_is_empty!35459 () Bool)

(assert (=> b!1312860 (= e!748831 tp_is_empty!35459)))

(declare-fun b!1312861 () Bool)

(declare-fun e!748828 () Bool)

(declare-fun e!748830 () Bool)

(declare-fun mapRes!54817 () Bool)

(assert (=> b!1312861 (= e!748828 (and e!748830 mapRes!54817))))

(declare-fun condMapEmpty!54817 () Bool)

(declare-datatypes ((V!52381 0))(
  ( (V!52382 (val!17804 Int)) )
))
(declare-datatypes ((ValueCell!16831 0))(
  ( (ValueCellFull!16831 (v!20431 V!52381)) (EmptyCell!16831) )
))
(declare-datatypes ((array!87902 0))(
  ( (array!87903 (arr!42431 (Array (_ BitVec 32) ValueCell!16831)) (size!42981 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87902)

(declare-fun mapDefault!54817 () ValueCell!16831)

