; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111300 () Bool)

(assert start!111300)

(declare-fun b!1317141 () Bool)

(declare-fun e!751515 () Bool)

(declare-fun tp_is_empty!35777 () Bool)

(assert (=> b!1317141 (= e!751515 tp_is_empty!35777)))

(declare-fun b!1317142 () Bool)

(declare-fun res!874235 () Bool)

(declare-fun e!751518 () Bool)

(assert (=> b!1317142 (=> (not res!874235) (not e!751518))))

(declare-datatypes ((array!88514 0))(
  ( (array!88515 (arr!42731 (Array (_ BitVec 32) (_ BitVec 64))) (size!43281 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88514)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88514 (_ BitVec 32)) Bool)

(assert (=> b!1317142 (= res!874235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317143 () Bool)

(declare-fun res!874234 () Bool)

(assert (=> b!1317143 (=> (not res!874234) (not e!751518))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52805 0))(
  ( (V!52806 (val!17963 Int)) )
))
(declare-datatypes ((ValueCell!16990 0))(
  ( (ValueCellFull!16990 (v!20593 V!52805)) (EmptyCell!16990) )
))
(declare-datatypes ((array!88516 0))(
  ( (array!88517 (arr!42732 (Array (_ BitVec 32) ValueCell!16990)) (size!43282 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88516)

(assert (=> b!1317143 (= res!874234 (and (= (size!43282 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43281 _keys!1609) (size!43282 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55313 () Bool)

(declare-fun mapRes!55313 () Bool)

(assert (=> mapIsEmpty!55313 mapRes!55313))

(declare-fun mapNonEmpty!55313 () Bool)

(declare-fun tp!105419 () Bool)

(assert (=> mapNonEmpty!55313 (= mapRes!55313 (and tp!105419 e!751515))))

(declare-fun mapKey!55313 () (_ BitVec 32))

(declare-fun mapRest!55313 () (Array (_ BitVec 32) ValueCell!16990))

(declare-fun mapValue!55313 () ValueCell!16990)

(assert (=> mapNonEmpty!55313 (= (arr!42732 _values!1337) (store mapRest!55313 mapKey!55313 mapValue!55313))))

(declare-fun b!1317144 () Bool)

(assert (=> b!1317144 (= e!751518 false)))

(declare-fun lt!586320 () Bool)

(declare-datatypes ((List!30294 0))(
  ( (Nil!30291) (Cons!30290 (h!31499 (_ BitVec 64)) (t!43902 List!30294)) )
))
(declare-fun arrayNoDuplicates!0 (array!88514 (_ BitVec 32) List!30294) Bool)

(assert (=> b!1317144 (= lt!586320 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30291))))

(declare-fun res!874233 () Bool)

(assert (=> start!111300 (=> (not res!874233) (not e!751518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111300 (= res!874233 (validMask!0 mask!2019))))

(assert (=> start!111300 e!751518))

(assert (=> start!111300 true))

(declare-fun e!751519 () Bool)

(declare-fun array_inv!32271 (array!88516) Bool)

(assert (=> start!111300 (and (array_inv!32271 _values!1337) e!751519)))

(declare-fun array_inv!32272 (array!88514) Bool)

(assert (=> start!111300 (array_inv!32272 _keys!1609)))

(declare-fun b!1317145 () Bool)

(declare-fun e!751516 () Bool)

(assert (=> b!1317145 (= e!751516 tp_is_empty!35777)))

(declare-fun b!1317146 () Bool)

(assert (=> b!1317146 (= e!751519 (and e!751516 mapRes!55313))))

(declare-fun condMapEmpty!55313 () Bool)

(declare-fun mapDefault!55313 () ValueCell!16990)

