; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95478 () Bool)

(assert start!95478)

(declare-fun mapNonEmpty!40984 () Bool)

(declare-fun mapRes!40984 () Bool)

(declare-fun tp!78446 () Bool)

(declare-fun e!616426 () Bool)

(assert (=> mapNonEmpty!40984 (= mapRes!40984 (and tp!78446 e!616426))))

(declare-datatypes ((V!40001 0))(
  ( (V!40002 (val!13134 Int)) )
))
(declare-datatypes ((ValueCell!12368 0))(
  ( (ValueCellFull!12368 (v!15754 V!40001)) (EmptyCell!12368) )
))
(declare-datatypes ((array!69194 0))(
  ( (array!69195 (arr!33272 (Array (_ BitVec 32) ValueCell!12368)) (size!33810 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69194)

(declare-fun mapKey!40984 () (_ BitVec 32))

(declare-fun mapValue!40984 () ValueCell!12368)

(declare-fun mapRest!40984 () (Array (_ BitVec 32) ValueCell!12368))

(assert (=> mapNonEmpty!40984 (= (arr!33272 _values!874) (store mapRest!40984 mapKey!40984 mapValue!40984))))

(declare-fun b!1078100 () Bool)

(declare-fun res!718405 () Bool)

(declare-fun e!616424 () Bool)

(assert (=> b!1078100 (=> (not res!718405) (not e!616424))))

(declare-datatypes ((array!69196 0))(
  ( (array!69197 (arr!33273 (Array (_ BitVec 32) (_ BitVec 64))) (size!33811 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69196)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078100 (= res!718405 (= (select (arr!33273 _keys!1070) i!650) k0!904))))

(declare-fun b!1078101 () Bool)

(declare-fun res!718403 () Bool)

(assert (=> b!1078101 (=> (not res!718403) (not e!616424))))

(assert (=> b!1078101 (= res!718403 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33811 _keys!1070))))))

(declare-fun b!1078102 () Bool)

(declare-fun tp_is_empty!26155 () Bool)

(assert (=> b!1078102 (= e!616426 tp_is_empty!26155)))

(declare-fun res!718408 () Bool)

(assert (=> start!95478 (=> (not res!718408) (not e!616424))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95478 (= res!718408 (validMask!0 mask!1414))))

(assert (=> start!95478 e!616424))

(assert (=> start!95478 true))

(declare-fun array_inv!25726 (array!69196) Bool)

(assert (=> start!95478 (array_inv!25726 _keys!1070)))

(declare-fun e!616421 () Bool)

(declare-fun array_inv!25727 (array!69194) Bool)

(assert (=> start!95478 (and (array_inv!25727 _values!874) e!616421)))

(declare-fun b!1078103 () Bool)

(declare-fun e!616422 () Bool)

(assert (=> b!1078103 (= e!616424 e!616422)))

(declare-fun res!718401 () Bool)

(assert (=> b!1078103 (=> (not res!718401) (not e!616422))))

(declare-fun lt!478403 () array!69196)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69196 (_ BitVec 32)) Bool)

(assert (=> b!1078103 (= res!718401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478403 mask!1414))))

(assert (=> b!1078103 (= lt!478403 (array!69197 (store (arr!33273 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33811 _keys!1070)))))

(declare-fun b!1078104 () Bool)

(declare-fun res!718406 () Bool)

(assert (=> b!1078104 (=> (not res!718406) (not e!616424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078104 (= res!718406 (validKeyInArray!0 k0!904))))

(declare-fun b!1078105 () Bool)

(declare-fun e!616423 () Bool)

(assert (=> b!1078105 (= e!616423 tp_is_empty!26155)))

(declare-fun b!1078106 () Bool)

(assert (=> b!1078106 (= e!616422 false)))

(declare-fun lt!478402 () Bool)

(declare-datatypes ((List!23285 0))(
  ( (Nil!23282) (Cons!23281 (h!24490 (_ BitVec 64)) (t!32635 List!23285)) )
))
(declare-fun arrayNoDuplicates!0 (array!69196 (_ BitVec 32) List!23285) Bool)

(assert (=> b!1078106 (= lt!478402 (arrayNoDuplicates!0 lt!478403 #b00000000000000000000000000000000 Nil!23282))))

(declare-fun b!1078107 () Bool)

(declare-fun res!718407 () Bool)

(assert (=> b!1078107 (=> (not res!718407) (not e!616424))))

(assert (=> b!1078107 (= res!718407 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23282))))

(declare-fun b!1078108 () Bool)

(assert (=> b!1078108 (= e!616421 (and e!616423 mapRes!40984))))

(declare-fun condMapEmpty!40984 () Bool)

(declare-fun mapDefault!40984 () ValueCell!12368)

(assert (=> b!1078108 (= condMapEmpty!40984 (= (arr!33272 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12368)) mapDefault!40984)))))

(declare-fun b!1078109 () Bool)

(declare-fun res!718404 () Bool)

(assert (=> b!1078109 (=> (not res!718404) (not e!616424))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078109 (= res!718404 (and (= (size!33810 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33811 _keys!1070) (size!33810 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078110 () Bool)

(declare-fun res!718402 () Bool)

(assert (=> b!1078110 (=> (not res!718402) (not e!616424))))

(assert (=> b!1078110 (= res!718402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!40984 () Bool)

(assert (=> mapIsEmpty!40984 mapRes!40984))

(assert (= (and start!95478 res!718408) b!1078109))

(assert (= (and b!1078109 res!718404) b!1078110))

(assert (= (and b!1078110 res!718402) b!1078107))

(assert (= (and b!1078107 res!718407) b!1078101))

(assert (= (and b!1078101 res!718403) b!1078104))

(assert (= (and b!1078104 res!718406) b!1078100))

(assert (= (and b!1078100 res!718405) b!1078103))

(assert (= (and b!1078103 res!718401) b!1078106))

(assert (= (and b!1078108 condMapEmpty!40984) mapIsEmpty!40984))

(assert (= (and b!1078108 (not condMapEmpty!40984)) mapNonEmpty!40984))

(get-info :version)

(assert (= (and mapNonEmpty!40984 ((_ is ValueCellFull!12368) mapValue!40984)) b!1078102))

(assert (= (and b!1078108 ((_ is ValueCellFull!12368) mapDefault!40984)) b!1078105))

(assert (= start!95478 b!1078108))

(declare-fun m!996189 () Bool)

(assert (=> b!1078104 m!996189))

(declare-fun m!996191 () Bool)

(assert (=> mapNonEmpty!40984 m!996191))

(declare-fun m!996193 () Bool)

(assert (=> b!1078110 m!996193))

(declare-fun m!996195 () Bool)

(assert (=> start!95478 m!996195))

(declare-fun m!996197 () Bool)

(assert (=> start!95478 m!996197))

(declare-fun m!996199 () Bool)

(assert (=> start!95478 m!996199))

(declare-fun m!996201 () Bool)

(assert (=> b!1078103 m!996201))

(declare-fun m!996203 () Bool)

(assert (=> b!1078103 m!996203))

(declare-fun m!996205 () Bool)

(assert (=> b!1078107 m!996205))

(declare-fun m!996207 () Bool)

(assert (=> b!1078100 m!996207))

(declare-fun m!996209 () Bool)

(assert (=> b!1078106 m!996209))

(check-sat (not mapNonEmpty!40984) (not b!1078103) (not b!1078104) (not b!1078106) (not b!1078107) tp_is_empty!26155 (not start!95478) (not b!1078110))
(check-sat)
