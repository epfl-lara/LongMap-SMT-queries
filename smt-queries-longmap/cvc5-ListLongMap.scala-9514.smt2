; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112916 () Bool)

(assert start!112916)

(declare-fun b!1338771 () Bool)

(declare-fun e!762383 () Bool)

(declare-fun tp_is_empty!36997 () Bool)

(assert (=> b!1338771 (= e!762383 tp_is_empty!36997)))

(declare-fun b!1338772 () Bool)

(declare-fun res!888206 () Bool)

(declare-fun e!762380 () Bool)

(assert (=> b!1338772 (=> (not res!888206) (not e!762380))))

(declare-datatypes ((array!90854 0))(
  ( (array!90855 (arr!43886 (Array (_ BitVec 32) (_ BitVec 64))) (size!44436 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90854)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90854 (_ BitVec 32)) Bool)

(assert (=> b!1338772 (= res!888206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1338773 () Bool)

(declare-fun res!888208 () Bool)

(assert (=> b!1338773 (=> (not res!888208) (not e!762380))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54433 0))(
  ( (V!54434 (val!18573 Int)) )
))
(declare-datatypes ((ValueCell!17600 0))(
  ( (ValueCellFull!17600 (v!21220 V!54433)) (EmptyCell!17600) )
))
(declare-datatypes ((array!90856 0))(
  ( (array!90857 (arr!43887 (Array (_ BitVec 32) ValueCell!17600)) (size!44437 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90856)

(assert (=> b!1338773 (= res!888208 (and (= (size!44437 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44436 _keys!1571) (size!44437 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1338774 () Bool)

(declare-fun e!762381 () Bool)

(assert (=> b!1338774 (= e!762381 tp_is_empty!36997)))

(declare-fun res!888207 () Bool)

(assert (=> start!112916 (=> (not res!888207) (not e!762380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112916 (= res!888207 (validMask!0 mask!1977))))

(assert (=> start!112916 e!762380))

(assert (=> start!112916 true))

(declare-fun e!762382 () Bool)

(declare-fun array_inv!33093 (array!90856) Bool)

(assert (=> start!112916 (and (array_inv!33093 _values!1303) e!762382)))

(declare-fun array_inv!33094 (array!90854) Bool)

(assert (=> start!112916 (array_inv!33094 _keys!1571)))

(declare-fun b!1338775 () Bool)

(declare-fun mapRes!57193 () Bool)

(assert (=> b!1338775 (= e!762382 (and e!762383 mapRes!57193))))

(declare-fun condMapEmpty!57193 () Bool)

(declare-fun mapDefault!57193 () ValueCell!17600)

