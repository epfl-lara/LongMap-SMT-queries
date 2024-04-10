; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111080 () Bool)

(assert start!111080)

(declare-fun b_free!29915 () Bool)

(declare-fun b_next!29915 () Bool)

(assert (=> start!111080 (= b_free!29915 (not b_next!29915))))

(declare-fun tp!105067 () Bool)

(declare-fun b_and!48123 () Bool)

(assert (=> start!111080 (= tp!105067 b_and!48123)))

(declare-fun b!1315154 () Bool)

(declare-fun res!873083 () Bool)

(declare-fun e!750223 () Bool)

(assert (=> b!1315154 (=> (not res!873083) (not e!750223))))

(declare-datatypes ((array!88254 0))(
  ( (array!88255 (arr!42607 (Array (_ BitVec 32) (_ BitVec 64))) (size!43157 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88254)

(declare-datatypes ((V!52629 0))(
  ( (V!52630 (val!17897 Int)) )
))
(declare-datatypes ((ValueCell!16924 0))(
  ( (ValueCellFull!16924 (v!20524 V!52629)) (EmptyCell!16924) )
))
(declare-datatypes ((array!88256 0))(
  ( (array!88257 (arr!42608 (Array (_ BitVec 32) ValueCell!16924)) (size!43158 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88256)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(assert (=> b!1315154 (= res!873083 (and (= (size!43158 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43157 _keys!1628) (size!43158 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315155 () Bool)

(declare-fun res!873084 () Bool)

(assert (=> b!1315155 (=> (not res!873084) (not e!750223))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315155 (= res!873084 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43157 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315156 () Bool)

(declare-fun res!873082 () Bool)

(assert (=> b!1315156 (=> (not res!873082) (not e!750223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88254 (_ BitVec 32)) Bool)

(assert (=> b!1315156 (= res!873082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315157 () Bool)

(assert (=> b!1315157 (= e!750223 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52629)

(declare-fun zeroValue!1296 () V!52629)

(declare-fun lt!585882 () Bool)

(declare-datatypes ((tuple2!23084 0))(
  ( (tuple2!23085 (_1!11553 (_ BitVec 64)) (_2!11553 V!52629)) )
))
(declare-datatypes ((List!30220 0))(
  ( (Nil!30217) (Cons!30216 (h!31425 tuple2!23084) (t!43826 List!30220)) )
))
(declare-datatypes ((ListLongMap!20741 0))(
  ( (ListLongMap!20742 (toList!10386 List!30220)) )
))
(declare-fun contains!8536 (ListLongMap!20741 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5399 (array!88254 array!88256 (_ BitVec 32) (_ BitVec 32) V!52629 V!52629 (_ BitVec 32) Int) ListLongMap!20741)

(assert (=> b!1315157 (= lt!585882 (contains!8536 (getCurrentListMap!5399 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapIsEmpty!55096 () Bool)

(declare-fun mapRes!55096 () Bool)

(assert (=> mapIsEmpty!55096 mapRes!55096))

(declare-fun b!1315159 () Bool)

(declare-fun e!750224 () Bool)

(declare-fun e!750226 () Bool)

(assert (=> b!1315159 (= e!750224 (and e!750226 mapRes!55096))))

(declare-fun condMapEmpty!55096 () Bool)

(declare-fun mapDefault!55096 () ValueCell!16924)

