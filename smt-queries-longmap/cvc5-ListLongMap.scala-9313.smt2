; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111314 () Bool)

(assert start!111314)

(declare-fun mapIsEmpty!55334 () Bool)

(declare-fun mapRes!55334 () Bool)

(assert (=> mapIsEmpty!55334 mapRes!55334))

(declare-fun b!1317267 () Bool)

(declare-fun e!751620 () Bool)

(declare-fun tp_is_empty!35791 () Bool)

(assert (=> b!1317267 (= e!751620 tp_is_empty!35791)))

(declare-fun res!874298 () Bool)

(declare-fun e!751621 () Bool)

(assert (=> start!111314 (=> (not res!874298) (not e!751621))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111314 (= res!874298 (validMask!0 mask!2019))))

(assert (=> start!111314 e!751621))

(assert (=> start!111314 true))

(declare-datatypes ((V!52825 0))(
  ( (V!52826 (val!17970 Int)) )
))
(declare-datatypes ((ValueCell!16997 0))(
  ( (ValueCellFull!16997 (v!20600 V!52825)) (EmptyCell!16997) )
))
(declare-datatypes ((array!88540 0))(
  ( (array!88541 (arr!42744 (Array (_ BitVec 32) ValueCell!16997)) (size!43294 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88540)

(declare-fun e!751623 () Bool)

(declare-fun array_inv!32283 (array!88540) Bool)

(assert (=> start!111314 (and (array_inv!32283 _values!1337) e!751623)))

(declare-datatypes ((array!88542 0))(
  ( (array!88543 (arr!42745 (Array (_ BitVec 32) (_ BitVec 64))) (size!43295 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88542)

(declare-fun array_inv!32284 (array!88542) Bool)

(assert (=> start!111314 (array_inv!32284 _keys!1609)))

(declare-fun b!1317268 () Bool)

(declare-fun res!874297 () Bool)

(assert (=> b!1317268 (=> (not res!874297) (not e!751621))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317268 (= res!874297 (and (= (size!43294 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43295 _keys!1609) (size!43294 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317269 () Bool)

(assert (=> b!1317269 (= e!751621 false)))

(declare-fun lt!586341 () Bool)

(declare-datatypes ((List!30299 0))(
  ( (Nil!30296) (Cons!30295 (h!31504 (_ BitVec 64)) (t!43907 List!30299)) )
))
(declare-fun arrayNoDuplicates!0 (array!88542 (_ BitVec 32) List!30299) Bool)

(assert (=> b!1317269 (= lt!586341 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30296))))

(declare-fun b!1317270 () Bool)

(declare-fun e!751622 () Bool)

(assert (=> b!1317270 (= e!751622 tp_is_empty!35791)))

(declare-fun b!1317271 () Bool)

(assert (=> b!1317271 (= e!751623 (and e!751620 mapRes!55334))))

(declare-fun condMapEmpty!55334 () Bool)

(declare-fun mapDefault!55334 () ValueCell!16997)

