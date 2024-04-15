; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95584 () Bool)

(assert start!95584)

(declare-fun b!1079737 () Bool)

(declare-fun res!719614 () Bool)

(declare-fun e!617274 () Bool)

(assert (=> b!1079737 (=> (not res!719614) (not e!617274))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((array!69374 0))(
  ( (array!69375 (arr!33361 (Array (_ BitVec 32) (_ BitVec 64))) (size!33899 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69374)

(declare-datatypes ((V!40121 0))(
  ( (V!40122 (val!13179 Int)) )
))
(declare-datatypes ((ValueCell!12413 0))(
  ( (ValueCellFull!12413 (v!15799 V!40121)) (EmptyCell!12413) )
))
(declare-datatypes ((array!69376 0))(
  ( (array!69377 (arr!33362 (Array (_ BitVec 32) ValueCell!12413)) (size!33900 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69376)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079737 (= res!719614 (and (= (size!33900 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33899 _keys!1070) (size!33900 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079738 () Bool)

(declare-fun e!617271 () Bool)

(assert (=> b!1079738 (= e!617274 e!617271)))

(declare-fun res!719612 () Bool)

(assert (=> b!1079738 (=> (not res!719612) (not e!617271))))

(declare-fun lt!478687 () array!69374)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69374 (_ BitVec 32)) Bool)

(assert (=> b!1079738 (= res!719612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478687 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079738 (= lt!478687 (array!69375 (store (arr!33361 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33899 _keys!1070)))))

(declare-fun mapNonEmpty!41122 () Bool)

(declare-fun mapRes!41122 () Bool)

(declare-fun tp!78584 () Bool)

(declare-fun e!617273 () Bool)

(assert (=> mapNonEmpty!41122 (= mapRes!41122 (and tp!78584 e!617273))))

(declare-fun mapRest!41122 () (Array (_ BitVec 32) ValueCell!12413))

(declare-fun mapValue!41122 () ValueCell!12413)

(declare-fun mapKey!41122 () (_ BitVec 32))

(assert (=> mapNonEmpty!41122 (= (arr!33362 _values!874) (store mapRest!41122 mapKey!41122 mapValue!41122))))

(declare-fun b!1079739 () Bool)

(declare-fun res!719608 () Bool)

(assert (=> b!1079739 (=> (not res!719608) (not e!617274))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1079739 (= res!719608 (= (select (arr!33361 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!41122 () Bool)

(assert (=> mapIsEmpty!41122 mapRes!41122))

(declare-fun b!1079740 () Bool)

(declare-fun res!719615 () Bool)

(assert (=> b!1079740 (=> (not res!719615) (not e!617274))))

(assert (=> b!1079740 (= res!719615 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33899 _keys!1070))))))

(declare-fun b!1079741 () Bool)

(declare-fun res!719609 () Bool)

(assert (=> b!1079741 (=> (not res!719609) (not e!617274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079741 (= res!719609 (validKeyInArray!0 k0!904))))

(declare-fun b!1079742 () Bool)

(declare-fun e!617275 () Bool)

(declare-fun e!617272 () Bool)

(assert (=> b!1079742 (= e!617275 (and e!617272 mapRes!41122))))

(declare-fun condMapEmpty!41122 () Bool)

(declare-fun mapDefault!41122 () ValueCell!12413)

(assert (=> b!1079742 (= condMapEmpty!41122 (= (arr!33362 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12413)) mapDefault!41122)))))

(declare-fun b!1079743 () Bool)

(assert (=> b!1079743 (= e!617271 (not (bvsle #b00000000000000000000000000000000 (size!33899 _keys!1070))))))

(declare-fun arrayContainsKey!0 (array!69374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079743 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35353 0))(
  ( (Unit!35354) )
))
(declare-fun lt!478688 () Unit!35353)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69374 (_ BitVec 64) (_ BitVec 32)) Unit!35353)

(assert (=> b!1079743 (= lt!478688 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!719613 () Bool)

(assert (=> start!95584 (=> (not res!719613) (not e!617274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95584 (= res!719613 (validMask!0 mask!1414))))

(assert (=> start!95584 e!617274))

(assert (=> start!95584 true))

(declare-fun array_inv!25796 (array!69374) Bool)

(assert (=> start!95584 (array_inv!25796 _keys!1070)))

(declare-fun array_inv!25797 (array!69376) Bool)

(assert (=> start!95584 (and (array_inv!25797 _values!874) e!617275)))

(declare-fun b!1079736 () Bool)

(declare-fun res!719611 () Bool)

(assert (=> b!1079736 (=> (not res!719611) (not e!617274))))

(assert (=> b!1079736 (= res!719611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079744 () Bool)

(declare-fun tp_is_empty!26245 () Bool)

(assert (=> b!1079744 (= e!617273 tp_is_empty!26245)))

(declare-fun b!1079745 () Bool)

(declare-fun res!719610 () Bool)

(assert (=> b!1079745 (=> (not res!719610) (not e!617271))))

(declare-datatypes ((List!23321 0))(
  ( (Nil!23318) (Cons!23317 (h!24526 (_ BitVec 64)) (t!32671 List!23321)) )
))
(declare-fun arrayNoDuplicates!0 (array!69374 (_ BitVec 32) List!23321) Bool)

(assert (=> b!1079745 (= res!719610 (arrayNoDuplicates!0 lt!478687 #b00000000000000000000000000000000 Nil!23318))))

(declare-fun b!1079746 () Bool)

(declare-fun res!719616 () Bool)

(assert (=> b!1079746 (=> (not res!719616) (not e!617274))))

(assert (=> b!1079746 (= res!719616 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23318))))

(declare-fun b!1079747 () Bool)

(assert (=> b!1079747 (= e!617272 tp_is_empty!26245)))

(assert (= (and start!95584 res!719613) b!1079737))

(assert (= (and b!1079737 res!719614) b!1079736))

(assert (= (and b!1079736 res!719611) b!1079746))

(assert (= (and b!1079746 res!719616) b!1079740))

(assert (= (and b!1079740 res!719615) b!1079741))

(assert (= (and b!1079741 res!719609) b!1079739))

(assert (= (and b!1079739 res!719608) b!1079738))

(assert (= (and b!1079738 res!719612) b!1079745))

(assert (= (and b!1079745 res!719610) b!1079743))

(assert (= (and b!1079742 condMapEmpty!41122) mapIsEmpty!41122))

(assert (= (and b!1079742 (not condMapEmpty!41122)) mapNonEmpty!41122))

(get-info :version)

(assert (= (and mapNonEmpty!41122 ((_ is ValueCellFull!12413) mapValue!41122)) b!1079744))

(assert (= (and b!1079742 ((_ is ValueCellFull!12413) mapDefault!41122)) b!1079747))

(assert (= start!95584 b!1079742))

(declare-fun m!997349 () Bool)

(assert (=> b!1079738 m!997349))

(declare-fun m!997351 () Bool)

(assert (=> b!1079738 m!997351))

(declare-fun m!997353 () Bool)

(assert (=> b!1079743 m!997353))

(declare-fun m!997355 () Bool)

(assert (=> b!1079743 m!997355))

(declare-fun m!997357 () Bool)

(assert (=> b!1079739 m!997357))

(declare-fun m!997359 () Bool)

(assert (=> b!1079736 m!997359))

(declare-fun m!997361 () Bool)

(assert (=> start!95584 m!997361))

(declare-fun m!997363 () Bool)

(assert (=> start!95584 m!997363))

(declare-fun m!997365 () Bool)

(assert (=> start!95584 m!997365))

(declare-fun m!997367 () Bool)

(assert (=> b!1079745 m!997367))

(declare-fun m!997369 () Bool)

(assert (=> b!1079741 m!997369))

(declare-fun m!997371 () Bool)

(assert (=> mapNonEmpty!41122 m!997371))

(declare-fun m!997373 () Bool)

(assert (=> b!1079746 m!997373))

(check-sat (not mapNonEmpty!41122) (not b!1079738) (not b!1079745) (not b!1079743) (not b!1079746) tp_is_empty!26245 (not b!1079741) (not start!95584) (not b!1079736))
(check-sat)
