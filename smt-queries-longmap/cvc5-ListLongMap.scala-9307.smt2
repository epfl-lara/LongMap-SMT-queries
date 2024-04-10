; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111248 () Bool)

(assert start!111248)

(declare-fun b!1316827 () Bool)

(declare-fun res!874062 () Bool)

(declare-fun e!751277 () Bool)

(assert (=> b!1316827 (=> (not res!874062) (not e!751277))))

(declare-datatypes ((array!88470 0))(
  ( (array!88471 (arr!42712 (Array (_ BitVec 32) (_ BitVec 64))) (size!43262 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88470)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52777 0))(
  ( (V!52778 (val!17952 Int)) )
))
(declare-datatypes ((ValueCell!16979 0))(
  ( (ValueCellFull!16979 (v!20581 V!52777)) (EmptyCell!16979) )
))
(declare-datatypes ((array!88472 0))(
  ( (array!88473 (arr!42713 (Array (_ BitVec 32) ValueCell!16979)) (size!43263 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88472)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1316827 (= res!874062 (and (= (size!43263 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43262 _keys!1609) (size!43263 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1316828 () Bool)

(declare-fun e!751280 () Bool)

(declare-fun tp_is_empty!35755 () Bool)

(assert (=> b!1316828 (= e!751280 tp_is_empty!35755)))

(declare-fun res!874060 () Bool)

(assert (=> start!111248 (=> (not res!874060) (not e!751277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111248 (= res!874060 (validMask!0 mask!2019))))

(assert (=> start!111248 e!751277))

(assert (=> start!111248 true))

(declare-fun e!751278 () Bool)

(declare-fun array_inv!32259 (array!88472) Bool)

(assert (=> start!111248 (and (array_inv!32259 _values!1337) e!751278)))

(declare-fun array_inv!32260 (array!88470) Bool)

(assert (=> start!111248 (array_inv!32260 _keys!1609)))

(declare-fun b!1316829 () Bool)

(declare-fun res!874061 () Bool)

(assert (=> b!1316829 (=> (not res!874061) (not e!751277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88470 (_ BitVec 32)) Bool)

(assert (=> b!1316829 (= res!874061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55271 () Bool)

(declare-fun mapRes!55271 () Bool)

(assert (=> mapIsEmpty!55271 mapRes!55271))

(declare-fun mapNonEmpty!55271 () Bool)

(declare-fun tp!105377 () Bool)

(assert (=> mapNonEmpty!55271 (= mapRes!55271 (and tp!105377 e!751280))))

(declare-fun mapKey!55271 () (_ BitVec 32))

(declare-fun mapValue!55271 () ValueCell!16979)

(declare-fun mapRest!55271 () (Array (_ BitVec 32) ValueCell!16979))

(assert (=> mapNonEmpty!55271 (= (arr!42713 _values!1337) (store mapRest!55271 mapKey!55271 mapValue!55271))))

(declare-fun b!1316830 () Bool)

(declare-fun e!751276 () Bool)

(assert (=> b!1316830 (= e!751276 tp_is_empty!35755)))

(declare-fun b!1316831 () Bool)

(assert (=> b!1316831 (= e!751277 (and (bvsle #b00000000000000000000000000000000 (size!43262 _keys!1609)) (bvsge (size!43262 _keys!1609) #b01111111111111111111111111111111)))))

(declare-fun b!1316832 () Bool)

(assert (=> b!1316832 (= e!751278 (and e!751276 mapRes!55271))))

(declare-fun condMapEmpty!55271 () Bool)

(declare-fun mapDefault!55271 () ValueCell!16979)

