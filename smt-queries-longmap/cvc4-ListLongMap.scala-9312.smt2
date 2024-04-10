; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111312 () Bool)

(assert start!111312)

(declare-fun res!874287 () Bool)

(declare-fun e!751608 () Bool)

(assert (=> start!111312 (=> (not res!874287) (not e!751608))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111312 (= res!874287 (validMask!0 mask!2019))))

(assert (=> start!111312 e!751608))

(assert (=> start!111312 true))

(declare-datatypes ((V!52821 0))(
  ( (V!52822 (val!17969 Int)) )
))
(declare-datatypes ((ValueCell!16996 0))(
  ( (ValueCellFull!16996 (v!20599 V!52821)) (EmptyCell!16996) )
))
(declare-datatypes ((array!88536 0))(
  ( (array!88537 (arr!42742 (Array (_ BitVec 32) ValueCell!16996)) (size!43292 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88536)

(declare-fun e!751606 () Bool)

(declare-fun array_inv!32281 (array!88536) Bool)

(assert (=> start!111312 (and (array_inv!32281 _values!1337) e!751606)))

(declare-datatypes ((array!88538 0))(
  ( (array!88539 (arr!42743 (Array (_ BitVec 32) (_ BitVec 64))) (size!43293 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88538)

(declare-fun array_inv!32282 (array!88538) Bool)

(assert (=> start!111312 (array_inv!32282 _keys!1609)))

(declare-fun mapNonEmpty!55331 () Bool)

(declare-fun mapRes!55331 () Bool)

(declare-fun tp!105437 () Bool)

(declare-fun e!751609 () Bool)

(assert (=> mapNonEmpty!55331 (= mapRes!55331 (and tp!105437 e!751609))))

(declare-fun mapValue!55331 () ValueCell!16996)

(declare-fun mapRest!55331 () (Array (_ BitVec 32) ValueCell!16996))

(declare-fun mapKey!55331 () (_ BitVec 32))

(assert (=> mapNonEmpty!55331 (= (arr!42742 _values!1337) (store mapRest!55331 mapKey!55331 mapValue!55331))))

(declare-fun b!1317249 () Bool)

(declare-fun tp_is_empty!35789 () Bool)

(assert (=> b!1317249 (= e!751609 tp_is_empty!35789)))

(declare-fun b!1317250 () Bool)

(declare-fun res!874288 () Bool)

(assert (=> b!1317250 (=> (not res!874288) (not e!751608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88538 (_ BitVec 32)) Bool)

(assert (=> b!1317250 (= res!874288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317251 () Bool)

(assert (=> b!1317251 (= e!751608 false)))

(declare-fun lt!586338 () Bool)

(declare-datatypes ((List!30298 0))(
  ( (Nil!30295) (Cons!30294 (h!31503 (_ BitVec 64)) (t!43906 List!30298)) )
))
(declare-fun arrayNoDuplicates!0 (array!88538 (_ BitVec 32) List!30298) Bool)

(assert (=> b!1317251 (= lt!586338 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30295))))

(declare-fun b!1317252 () Bool)

(declare-fun e!751607 () Bool)

(assert (=> b!1317252 (= e!751606 (and e!751607 mapRes!55331))))

(declare-fun condMapEmpty!55331 () Bool)

(declare-fun mapDefault!55331 () ValueCell!16996)

