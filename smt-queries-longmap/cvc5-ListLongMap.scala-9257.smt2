; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110890 () Bool)

(assert start!110890)

(declare-fun b_free!29725 () Bool)

(declare-fun b_next!29725 () Bool)

(assert (=> start!110890 (= b_free!29725 (not b_next!29725))))

(declare-fun tp!104496 () Bool)

(declare-fun b_and!47933 () Bool)

(assert (=> start!110890 (= tp!104496 b_and!47933)))

(declare-fun b!1312811 () Bool)

(declare-fun res!871595 () Bool)

(declare-fun e!748799 () Bool)

(assert (=> b!1312811 (=> (not res!871595) (not e!748799))))

(declare-datatypes ((array!87892 0))(
  ( (array!87893 (arr!42426 (Array (_ BitVec 32) (_ BitVec 64))) (size!42976 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87892)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((V!52377 0))(
  ( (V!52378 (val!17802 Int)) )
))
(declare-datatypes ((ValueCell!16829 0))(
  ( (ValueCellFull!16829 (v!20429 V!52377)) (EmptyCell!16829) )
))
(declare-datatypes ((array!87894 0))(
  ( (array!87895 (arr!42427 (Array (_ BitVec 32) ValueCell!16829)) (size!42977 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87894)

(assert (=> b!1312811 (= res!871595 (and (= (size!42977 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42976 _keys!1628) (size!42977 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312812 () Bool)

(declare-fun e!748800 () Bool)

(declare-fun e!748801 () Bool)

(declare-fun mapRes!54811 () Bool)

(assert (=> b!1312812 (= e!748800 (and e!748801 mapRes!54811))))

(declare-fun condMapEmpty!54811 () Bool)

(declare-fun mapDefault!54811 () ValueCell!16829)

