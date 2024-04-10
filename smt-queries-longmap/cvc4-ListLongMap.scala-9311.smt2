; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111306 () Bool)

(assert start!111306)

(declare-fun b!1317195 () Bool)

(declare-fun res!874262 () Bool)

(declare-fun e!751561 () Bool)

(assert (=> b!1317195 (=> (not res!874262) (not e!751561))))

(declare-datatypes ((array!88526 0))(
  ( (array!88527 (arr!42737 (Array (_ BitVec 32) (_ BitVec 64))) (size!43287 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88526)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88526 (_ BitVec 32)) Bool)

(assert (=> b!1317195 (= res!874262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317196 () Bool)

(declare-fun e!751562 () Bool)

(declare-fun tp_is_empty!35783 () Bool)

(assert (=> b!1317196 (= e!751562 tp_is_empty!35783)))

(declare-fun b!1317197 () Bool)

(assert (=> b!1317197 (= e!751561 false)))

(declare-fun lt!586329 () Bool)

(declare-datatypes ((List!30296 0))(
  ( (Nil!30293) (Cons!30292 (h!31501 (_ BitVec 64)) (t!43904 List!30296)) )
))
(declare-fun arrayNoDuplicates!0 (array!88526 (_ BitVec 32) List!30296) Bool)

(assert (=> b!1317197 (= lt!586329 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30293))))

(declare-fun b!1317198 () Bool)

(declare-fun e!751560 () Bool)

(assert (=> b!1317198 (= e!751560 tp_is_empty!35783)))

(declare-fun res!874261 () Bool)

(assert (=> start!111306 (=> (not res!874261) (not e!751561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111306 (= res!874261 (validMask!0 mask!2019))))

(assert (=> start!111306 e!751561))

(assert (=> start!111306 true))

(declare-datatypes ((V!52813 0))(
  ( (V!52814 (val!17966 Int)) )
))
(declare-datatypes ((ValueCell!16993 0))(
  ( (ValueCellFull!16993 (v!20596 V!52813)) (EmptyCell!16993) )
))
(declare-datatypes ((array!88528 0))(
  ( (array!88529 (arr!42738 (Array (_ BitVec 32) ValueCell!16993)) (size!43288 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88528)

(declare-fun e!751563 () Bool)

(declare-fun array_inv!32277 (array!88528) Bool)

(assert (=> start!111306 (and (array_inv!32277 _values!1337) e!751563)))

(declare-fun array_inv!32278 (array!88526) Bool)

(assert (=> start!111306 (array_inv!32278 _keys!1609)))

(declare-fun mapNonEmpty!55322 () Bool)

(declare-fun mapRes!55322 () Bool)

(declare-fun tp!105428 () Bool)

(assert (=> mapNonEmpty!55322 (= mapRes!55322 (and tp!105428 e!751562))))

(declare-fun mapKey!55322 () (_ BitVec 32))

(declare-fun mapValue!55322 () ValueCell!16993)

(declare-fun mapRest!55322 () (Array (_ BitVec 32) ValueCell!16993))

(assert (=> mapNonEmpty!55322 (= (arr!42738 _values!1337) (store mapRest!55322 mapKey!55322 mapValue!55322))))

(declare-fun mapIsEmpty!55322 () Bool)

(assert (=> mapIsEmpty!55322 mapRes!55322))

(declare-fun b!1317199 () Bool)

(assert (=> b!1317199 (= e!751563 (and e!751560 mapRes!55322))))

(declare-fun condMapEmpty!55322 () Bool)

(declare-fun mapDefault!55322 () ValueCell!16993)

