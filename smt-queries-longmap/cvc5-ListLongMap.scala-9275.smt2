; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110998 () Bool)

(assert start!110998)

(declare-fun b_free!29833 () Bool)

(declare-fun b_next!29833 () Bool)

(assert (=> start!110998 (= b_free!29833 (not b_next!29833))))

(declare-fun tp!104821 () Bool)

(declare-fun b_and!48041 () Bool)

(assert (=> start!110998 (= tp!104821 b_and!48041)))

(declare-fun res!872432 () Bool)

(declare-fun e!749611 () Bool)

(assert (=> start!110998 (=> (not res!872432) (not e!749611))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110998 (= res!872432 (validMask!0 mask!2040))))

(assert (=> start!110998 e!749611))

(assert (=> start!110998 tp!104821))

(declare-datatypes ((array!88098 0))(
  ( (array!88099 (arr!42529 (Array (_ BitVec 32) (_ BitVec 64))) (size!43079 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88098)

(declare-fun array_inv!32127 (array!88098) Bool)

(assert (=> start!110998 (array_inv!32127 _keys!1628)))

(assert (=> start!110998 true))

(declare-fun tp_is_empty!35563 () Bool)

(assert (=> start!110998 tp_is_empty!35563))

(declare-datatypes ((V!52521 0))(
  ( (V!52522 (val!17856 Int)) )
))
(declare-datatypes ((ValueCell!16883 0))(
  ( (ValueCellFull!16883 (v!20483 V!52521)) (EmptyCell!16883) )
))
(declare-datatypes ((array!88100 0))(
  ( (array!88101 (arr!42530 (Array (_ BitVec 32) ValueCell!16883)) (size!43080 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88100)

(declare-fun e!749612 () Bool)

(declare-fun array_inv!32128 (array!88100) Bool)

(assert (=> start!110998 (and (array_inv!32128 _values!1354) e!749612)))

(declare-fun b!1314134 () Bool)

(declare-fun res!872431 () Bool)

(assert (=> b!1314134 (=> (not res!872431) (not e!749611))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314134 (= res!872431 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43079 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54973 () Bool)

(declare-fun mapRes!54973 () Bool)

(declare-fun tp!104820 () Bool)

(declare-fun e!749609 () Bool)

(assert (=> mapNonEmpty!54973 (= mapRes!54973 (and tp!104820 e!749609))))

(declare-fun mapValue!54973 () ValueCell!16883)

(declare-fun mapKey!54973 () (_ BitVec 32))

(declare-fun mapRest!54973 () (Array (_ BitVec 32) ValueCell!16883))

(assert (=> mapNonEmpty!54973 (= (arr!42530 _values!1354) (store mapRest!54973 mapKey!54973 mapValue!54973))))

(declare-fun b!1314135 () Bool)

(declare-fun res!872433 () Bool)

(assert (=> b!1314135 (=> (not res!872433) (not e!749611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88098 (_ BitVec 32)) Bool)

(assert (=> b!1314135 (= res!872433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314136 () Bool)

(declare-fun res!872430 () Bool)

(assert (=> b!1314136 (=> (not res!872430) (not e!749611))))

(declare-datatypes ((List!30160 0))(
  ( (Nil!30157) (Cons!30156 (h!31365 (_ BitVec 64)) (t!43766 List!30160)) )
))
(declare-fun arrayNoDuplicates!0 (array!88098 (_ BitVec 32) List!30160) Bool)

(assert (=> b!1314136 (= res!872430 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30157))))

(declare-fun b!1314137 () Bool)

(declare-fun e!749608 () Bool)

(assert (=> b!1314137 (= e!749612 (and e!749608 mapRes!54973))))

(declare-fun condMapEmpty!54973 () Bool)

(declare-fun mapDefault!54973 () ValueCell!16883)

