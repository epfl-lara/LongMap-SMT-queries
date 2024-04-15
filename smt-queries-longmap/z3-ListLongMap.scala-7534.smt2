; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95502 () Bool)

(assert start!95502)

(declare-fun mapIsEmpty!41020 () Bool)

(declare-fun mapRes!41020 () Bool)

(assert (=> mapIsEmpty!41020 mapRes!41020))

(declare-fun b!1078498 () Bool)

(declare-fun res!718692 () Bool)

(declare-fun e!616638 () Bool)

(assert (=> b!1078498 (=> (not res!718692) (not e!616638))))

(declare-datatypes ((array!69242 0))(
  ( (array!69243 (arr!33296 (Array (_ BitVec 32) (_ BitVec 64))) (size!33834 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69242)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69242 (_ BitVec 32)) Bool)

(assert (=> b!1078498 (= res!718692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41020 () Bool)

(declare-fun tp!78482 () Bool)

(declare-fun e!616639 () Bool)

(assert (=> mapNonEmpty!41020 (= mapRes!41020 (and tp!78482 e!616639))))

(declare-datatypes ((V!40033 0))(
  ( (V!40034 (val!13146 Int)) )
))
(declare-datatypes ((ValueCell!12380 0))(
  ( (ValueCellFull!12380 (v!15766 V!40033)) (EmptyCell!12380) )
))
(declare-fun mapValue!41020 () ValueCell!12380)

(declare-fun mapRest!41020 () (Array (_ BitVec 32) ValueCell!12380))

(declare-datatypes ((array!69244 0))(
  ( (array!69245 (arr!33297 (Array (_ BitVec 32) ValueCell!12380)) (size!33835 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69244)

(declare-fun mapKey!41020 () (_ BitVec 32))

(assert (=> mapNonEmpty!41020 (= (arr!33297 _values!874) (store mapRest!41020 mapKey!41020 mapValue!41020))))

(declare-fun b!1078499 () Bool)

(declare-fun e!616642 () Bool)

(declare-fun e!616637 () Bool)

(assert (=> b!1078499 (= e!616642 (and e!616637 mapRes!41020))))

(declare-fun condMapEmpty!41020 () Bool)

(declare-fun mapDefault!41020 () ValueCell!12380)

(assert (=> b!1078499 (= condMapEmpty!41020 (= (arr!33297 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12380)) mapDefault!41020)))))

(declare-fun b!1078500 () Bool)

(declare-fun e!616640 () Bool)

(assert (=> b!1078500 (= e!616640 (not true))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078500 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35309 0))(
  ( (Unit!35310) )
))
(declare-fun lt!478474 () Unit!35309)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69242 (_ BitVec 64) (_ BitVec 32)) Unit!35309)

(assert (=> b!1078500 (= lt!478474 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1078501 () Bool)

(declare-fun res!718699 () Bool)

(assert (=> b!1078501 (=> (not res!718699) (not e!616638))))

(assert (=> b!1078501 (= res!718699 (= (select (arr!33296 _keys!1070) i!650) k0!904))))

(declare-fun b!1078502 () Bool)

(declare-fun tp_is_empty!26179 () Bool)

(assert (=> b!1078502 (= e!616639 tp_is_empty!26179)))

(declare-fun b!1078503 () Bool)

(declare-fun res!718695 () Bool)

(assert (=> b!1078503 (=> (not res!718695) (not e!616638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078503 (= res!718695 (validKeyInArray!0 k0!904))))

(declare-fun b!1078504 () Bool)

(assert (=> b!1078504 (= e!616638 e!616640)))

(declare-fun res!718697 () Bool)

(assert (=> b!1078504 (=> (not res!718697) (not e!616640))))

(declare-fun lt!478475 () array!69242)

(assert (=> b!1078504 (= res!718697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478475 mask!1414))))

(assert (=> b!1078504 (= lt!478475 (array!69243 (store (arr!33296 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33834 _keys!1070)))))

(declare-fun b!1078505 () Bool)

(declare-fun res!718693 () Bool)

(assert (=> b!1078505 (=> (not res!718693) (not e!616640))))

(declare-datatypes ((List!23295 0))(
  ( (Nil!23292) (Cons!23291 (h!24500 (_ BitVec 64)) (t!32645 List!23295)) )
))
(declare-fun arrayNoDuplicates!0 (array!69242 (_ BitVec 32) List!23295) Bool)

(assert (=> b!1078505 (= res!718693 (arrayNoDuplicates!0 lt!478475 #b00000000000000000000000000000000 Nil!23292))))

(declare-fun res!718696 () Bool)

(assert (=> start!95502 (=> (not res!718696) (not e!616638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95502 (= res!718696 (validMask!0 mask!1414))))

(assert (=> start!95502 e!616638))

(assert (=> start!95502 true))

(declare-fun array_inv!25746 (array!69242) Bool)

(assert (=> start!95502 (array_inv!25746 _keys!1070)))

(declare-fun array_inv!25747 (array!69244) Bool)

(assert (=> start!95502 (and (array_inv!25747 _values!874) e!616642)))

(declare-fun b!1078506 () Bool)

(declare-fun res!718691 () Bool)

(assert (=> b!1078506 (=> (not res!718691) (not e!616638))))

(assert (=> b!1078506 (= res!718691 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23292))))

(declare-fun b!1078507 () Bool)

(declare-fun res!718698 () Bool)

(assert (=> b!1078507 (=> (not res!718698) (not e!616638))))

(assert (=> b!1078507 (= res!718698 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33834 _keys!1070))))))

(declare-fun b!1078508 () Bool)

(assert (=> b!1078508 (= e!616637 tp_is_empty!26179)))

(declare-fun b!1078509 () Bool)

(declare-fun res!718694 () Bool)

(assert (=> b!1078509 (=> (not res!718694) (not e!616638))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078509 (= res!718694 (and (= (size!33835 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33834 _keys!1070) (size!33835 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95502 res!718696) b!1078509))

(assert (= (and b!1078509 res!718694) b!1078498))

(assert (= (and b!1078498 res!718692) b!1078506))

(assert (= (and b!1078506 res!718691) b!1078507))

(assert (= (and b!1078507 res!718698) b!1078503))

(assert (= (and b!1078503 res!718695) b!1078501))

(assert (= (and b!1078501 res!718699) b!1078504))

(assert (= (and b!1078504 res!718697) b!1078505))

(assert (= (and b!1078505 res!718693) b!1078500))

(assert (= (and b!1078499 condMapEmpty!41020) mapIsEmpty!41020))

(assert (= (and b!1078499 (not condMapEmpty!41020)) mapNonEmpty!41020))

(get-info :version)

(assert (= (and mapNonEmpty!41020 ((_ is ValueCellFull!12380) mapValue!41020)) b!1078502))

(assert (= (and b!1078499 ((_ is ValueCellFull!12380) mapDefault!41020)) b!1078508))

(assert (= start!95502 b!1078499))

(declare-fun m!996453 () Bool)

(assert (=> start!95502 m!996453))

(declare-fun m!996455 () Bool)

(assert (=> start!95502 m!996455))

(declare-fun m!996457 () Bool)

(assert (=> start!95502 m!996457))

(declare-fun m!996459 () Bool)

(assert (=> b!1078498 m!996459))

(declare-fun m!996461 () Bool)

(assert (=> b!1078505 m!996461))

(declare-fun m!996463 () Bool)

(assert (=> b!1078501 m!996463))

(declare-fun m!996465 () Bool)

(assert (=> mapNonEmpty!41020 m!996465))

(declare-fun m!996467 () Bool)

(assert (=> b!1078506 m!996467))

(declare-fun m!996469 () Bool)

(assert (=> b!1078503 m!996469))

(declare-fun m!996471 () Bool)

(assert (=> b!1078500 m!996471))

(declare-fun m!996473 () Bool)

(assert (=> b!1078500 m!996473))

(declare-fun m!996475 () Bool)

(assert (=> b!1078504 m!996475))

(declare-fun m!996477 () Bool)

(assert (=> b!1078504 m!996477))

(check-sat (not start!95502) (not b!1078505) (not mapNonEmpty!41020) (not b!1078506) (not b!1078500) (not b!1078504) tp_is_empty!26179 (not b!1078503) (not b!1078498))
(check-sat)
