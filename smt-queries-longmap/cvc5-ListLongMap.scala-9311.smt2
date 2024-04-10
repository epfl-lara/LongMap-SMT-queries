; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111302 () Bool)

(assert start!111302)

(declare-fun res!874242 () Bool)

(declare-fun e!751530 () Bool)

(assert (=> start!111302 (=> (not res!874242) (not e!751530))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111302 (= res!874242 (validMask!0 mask!2019))))

(assert (=> start!111302 e!751530))

(assert (=> start!111302 true))

(declare-datatypes ((V!52809 0))(
  ( (V!52810 (val!17964 Int)) )
))
(declare-datatypes ((ValueCell!16991 0))(
  ( (ValueCellFull!16991 (v!20594 V!52809)) (EmptyCell!16991) )
))
(declare-datatypes ((array!88518 0))(
  ( (array!88519 (arr!42733 (Array (_ BitVec 32) ValueCell!16991)) (size!43283 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88518)

(declare-fun e!751534 () Bool)

(declare-fun array_inv!32273 (array!88518) Bool)

(assert (=> start!111302 (and (array_inv!32273 _values!1337) e!751534)))

(declare-datatypes ((array!88520 0))(
  ( (array!88521 (arr!42734 (Array (_ BitVec 32) (_ BitVec 64))) (size!43284 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88520)

(declare-fun array_inv!32274 (array!88520) Bool)

(assert (=> start!111302 (array_inv!32274 _keys!1609)))

(declare-fun b!1317159 () Bool)

(declare-fun e!751531 () Bool)

(declare-fun tp_is_empty!35779 () Bool)

(assert (=> b!1317159 (= e!751531 tp_is_empty!35779)))

(declare-fun mapNonEmpty!55316 () Bool)

(declare-fun mapRes!55316 () Bool)

(declare-fun tp!105422 () Bool)

(assert (=> mapNonEmpty!55316 (= mapRes!55316 (and tp!105422 e!751531))))

(declare-fun mapKey!55316 () (_ BitVec 32))

(declare-fun mapRest!55316 () (Array (_ BitVec 32) ValueCell!16991))

(declare-fun mapValue!55316 () ValueCell!16991)

(assert (=> mapNonEmpty!55316 (= (arr!42733 _values!1337) (store mapRest!55316 mapKey!55316 mapValue!55316))))

(declare-fun b!1317160 () Bool)

(declare-fun res!874244 () Bool)

(assert (=> b!1317160 (=> (not res!874244) (not e!751530))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317160 (= res!874244 (and (= (size!43283 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43284 _keys!1609) (size!43283 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317161 () Bool)

(declare-fun res!874243 () Bool)

(assert (=> b!1317161 (=> (not res!874243) (not e!751530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88520 (_ BitVec 32)) Bool)

(assert (=> b!1317161 (= res!874243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317162 () Bool)

(declare-fun e!751533 () Bool)

(assert (=> b!1317162 (= e!751534 (and e!751533 mapRes!55316))))

(declare-fun condMapEmpty!55316 () Bool)

(declare-fun mapDefault!55316 () ValueCell!16991)

