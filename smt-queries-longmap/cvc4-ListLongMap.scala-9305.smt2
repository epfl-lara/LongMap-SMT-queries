; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111226 () Bool)

(assert start!111226)

(declare-fun mapNonEmpty!55253 () Bool)

(declare-fun mapRes!55253 () Bool)

(declare-fun tp!105359 () Bool)

(declare-fun e!751196 () Bool)

(assert (=> mapNonEmpty!55253 (= mapRes!55253 (and tp!105359 e!751196))))

(declare-datatypes ((V!52765 0))(
  ( (V!52766 (val!17948 Int)) )
))
(declare-datatypes ((ValueCell!16975 0))(
  ( (ValueCellFull!16975 (v!20577 V!52765)) (EmptyCell!16975) )
))
(declare-fun mapValue!55253 () ValueCell!16975)

(declare-datatypes ((array!88452 0))(
  ( (array!88453 (arr!42705 (Array (_ BitVec 32) ValueCell!16975)) (size!43255 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88452)

(declare-fun mapRest!55253 () (Array (_ BitVec 32) ValueCell!16975))

(declare-fun mapKey!55253 () (_ BitVec 32))

(assert (=> mapNonEmpty!55253 (= (arr!42705 _values!1337) (store mapRest!55253 mapKey!55253 mapValue!55253))))

(declare-fun res!874020 () Bool)

(declare-fun e!751197 () Bool)

(assert (=> start!111226 (=> (not res!874020) (not e!751197))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111226 (= res!874020 (validMask!0 mask!2019))))

(assert (=> start!111226 e!751197))

(assert (=> start!111226 true))

(declare-fun e!751198 () Bool)

(declare-fun array_inv!32255 (array!88452) Bool)

(assert (=> start!111226 (and (array_inv!32255 _values!1337) e!751198)))

(declare-datatypes ((array!88454 0))(
  ( (array!88455 (arr!42706 (Array (_ BitVec 32) (_ BitVec 64))) (size!43256 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88454)

(declare-fun array_inv!32256 (array!88454) Bool)

(assert (=> start!111226 (array_inv!32256 _keys!1609)))

(declare-fun b!1316729 () Bool)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1316729 (= e!751197 (and (= (size!43255 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43256 _keys!1609) (size!43255 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011) (= (size!43256 _keys!1609) (bvadd #b00000000000000000000000000000001 mask!2019)) (bvsgt #b00000000000000000000000000000000 (size!43256 _keys!1609))))))

(declare-fun b!1316730 () Bool)

(declare-fun tp_is_empty!35747 () Bool)

(assert (=> b!1316730 (= e!751196 tp_is_empty!35747)))

(declare-fun mapIsEmpty!55253 () Bool)

(assert (=> mapIsEmpty!55253 mapRes!55253))

(declare-fun b!1316731 () Bool)

(declare-fun e!751195 () Bool)

(assert (=> b!1316731 (= e!751198 (and e!751195 mapRes!55253))))

(declare-fun condMapEmpty!55253 () Bool)

(declare-fun mapDefault!55253 () ValueCell!16975)

