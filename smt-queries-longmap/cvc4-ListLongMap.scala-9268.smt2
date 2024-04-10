; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110960 () Bool)

(assert start!110960)

(declare-fun b_free!29795 () Bool)

(declare-fun b_next!29795 () Bool)

(assert (=> start!110960 (= b_free!29795 (not b_next!29795))))

(declare-fun tp!104707 () Bool)

(declare-fun b_and!48003 () Bool)

(assert (=> start!110960 (= tp!104707 b_and!48003)))

(declare-fun b!1313678 () Bool)

(declare-fun res!872145 () Bool)

(declare-fun e!749326 () Bool)

(assert (=> b!1313678 (=> (not res!872145) (not e!749326))))

(declare-datatypes ((array!88026 0))(
  ( (array!88027 (arr!42493 (Array (_ BitVec 32) (_ BitVec 64))) (size!43043 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88026)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52469 0))(
  ( (V!52470 (val!17837 Int)) )
))
(declare-datatypes ((ValueCell!16864 0))(
  ( (ValueCellFull!16864 (v!20464 V!52469)) (EmptyCell!16864) )
))
(declare-datatypes ((array!88028 0))(
  ( (array!88029 (arr!42494 (Array (_ BitVec 32) ValueCell!16864)) (size!43044 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88028)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313678 (= res!872145 (and (= (size!43044 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43043 _keys!1628) (size!43044 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!872148 () Bool)

(assert (=> start!110960 (=> (not res!872148) (not e!749326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110960 (= res!872148 (validMask!0 mask!2040))))

(assert (=> start!110960 e!749326))

(assert (=> start!110960 tp!104707))

(declare-fun array_inv!32097 (array!88026) Bool)

(assert (=> start!110960 (array_inv!32097 _keys!1628)))

(assert (=> start!110960 true))

(declare-fun tp_is_empty!35525 () Bool)

(assert (=> start!110960 tp_is_empty!35525))

(declare-fun e!749327 () Bool)

(declare-fun array_inv!32098 (array!88028) Bool)

(assert (=> start!110960 (and (array_inv!32098 _values!1354) e!749327)))

(declare-fun b!1313679 () Bool)

(declare-fun e!749325 () Bool)

(assert (=> b!1313679 (= e!749325 tp_is_empty!35525)))

(declare-fun b!1313680 () Bool)

(declare-fun res!872144 () Bool)

(assert (=> b!1313680 (=> (not res!872144) (not e!749326))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313680 (= res!872144 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43043 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313681 () Bool)

(declare-fun e!749324 () Bool)

(assert (=> b!1313681 (= e!749324 tp_is_empty!35525)))

(declare-fun b!1313682 () Bool)

(declare-fun mapRes!54916 () Bool)

(assert (=> b!1313682 (= e!749327 (and e!749324 mapRes!54916))))

(declare-fun condMapEmpty!54916 () Bool)

(declare-fun mapDefault!54916 () ValueCell!16864)

