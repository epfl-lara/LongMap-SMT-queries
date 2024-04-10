; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110786 () Bool)

(assert start!110786)

(declare-fun b_free!29621 () Bool)

(declare-fun b_next!29621 () Bool)

(assert (=> start!110786 (= b_free!29621 (not b_next!29621))))

(declare-fun tp!104185 () Bool)

(declare-fun b_and!47829 () Bool)

(assert (=> start!110786 (= tp!104185 b_and!47829)))

(declare-fun b!1311239 () Bool)

(declare-fun e!748022 () Bool)

(declare-fun tp_is_empty!35351 () Bool)

(assert (=> b!1311239 (= e!748022 tp_is_empty!35351)))

(declare-fun b!1311240 () Bool)

(declare-fun e!748019 () Bool)

(assert (=> b!1311240 (= e!748019 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87690 0))(
  ( (array!87691 (arr!42325 (Array (_ BitVec 32) (_ BitVec 64))) (size!42875 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87690)

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52237 0))(
  ( (V!52238 (val!17750 Int)) )
))
(declare-fun minValue!1296 () V!52237)

(declare-datatypes ((ValueCell!16777 0))(
  ( (ValueCellFull!16777 (v!20377 V!52237)) (EmptyCell!16777) )
))
(declare-datatypes ((array!87692 0))(
  ( (array!87693 (arr!42326 (Array (_ BitVec 32) ValueCell!16777)) (size!42876 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87692)

(declare-fun zeroValue!1296 () V!52237)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun lt!585450 () Bool)

(declare-datatypes ((tuple2!22874 0))(
  ( (tuple2!22875 (_1!11448 (_ BitVec 64)) (_2!11448 V!52237)) )
))
(declare-datatypes ((List!30015 0))(
  ( (Nil!30012) (Cons!30011 (h!31220 tuple2!22874) (t!43621 List!30015)) )
))
(declare-datatypes ((ListLongMap!20531 0))(
  ( (ListLongMap!20532 (toList!10281 List!30015)) )
))
(declare-fun contains!8431 (ListLongMap!20531 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5294 (array!87690 array!87692 (_ BitVec 32) (_ BitVec 32) V!52237 V!52237 (_ BitVec 32) Int) ListLongMap!20531)

(assert (=> b!1311240 (= lt!585450 (contains!8431 (getCurrentListMap!5294 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1311241 () Bool)

(declare-fun res!870491 () Bool)

(assert (=> b!1311241 (=> (not res!870491) (not e!748019))))

(declare-datatypes ((List!30016 0))(
  ( (Nil!30013) (Cons!30012 (h!31221 (_ BitVec 64)) (t!43622 List!30016)) )
))
(declare-fun arrayNoDuplicates!0 (array!87690 (_ BitVec 32) List!30016) Bool)

(assert (=> b!1311241 (= res!870491 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30013))))

(declare-fun b!1311242 () Bool)

(declare-fun res!870488 () Bool)

(assert (=> b!1311242 (=> (not res!870488) (not e!748019))))

(assert (=> b!1311242 (= res!870488 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42875 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311243 () Bool)

(declare-fun res!870490 () Bool)

(assert (=> b!1311243 (=> (not res!870490) (not e!748019))))

(assert (=> b!1311243 (= res!870490 (and (= (size!42876 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42875 _keys!1628) (size!42876 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!870492 () Bool)

(assert (=> start!110786 (=> (not res!870492) (not e!748019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110786 (= res!870492 (validMask!0 mask!2040))))

(assert (=> start!110786 e!748019))

(assert (=> start!110786 tp!104185))

(declare-fun array_inv!31983 (array!87690) Bool)

(assert (=> start!110786 (array_inv!31983 _keys!1628)))

(assert (=> start!110786 true))

(assert (=> start!110786 tp_is_empty!35351))

(declare-fun e!748020 () Bool)

(declare-fun array_inv!31984 (array!87692) Bool)

(assert (=> start!110786 (and (array_inv!31984 _values!1354) e!748020)))

(declare-fun b!1311244 () Bool)

(declare-fun e!748018 () Bool)

(declare-fun mapRes!54655 () Bool)

(assert (=> b!1311244 (= e!748020 (and e!748018 mapRes!54655))))

(declare-fun condMapEmpty!54655 () Bool)

(declare-fun mapDefault!54655 () ValueCell!16777)

