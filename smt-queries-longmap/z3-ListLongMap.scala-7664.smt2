; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96306 () Bool)

(assert start!96306)

(declare-fun b!1094457 () Bool)

(declare-fun e!624842 () Bool)

(assert (=> b!1094457 (= e!624842 false)))

(declare-fun lt!489652 () Bool)

(declare-datatypes ((array!70837 0))(
  ( (array!70838 (arr!34092 (Array (_ BitVec 32) (_ BitVec 64))) (size!34628 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70837)

(declare-datatypes ((List!23817 0))(
  ( (Nil!23814) (Cons!23813 (h!25022 (_ BitVec 64)) (t!33824 List!23817)) )
))
(declare-fun arrayNoDuplicates!0 (array!70837 (_ BitVec 32) List!23817) Bool)

(assert (=> b!1094457 (= lt!489652 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23814))))

(declare-fun b!1094458 () Bool)

(declare-fun e!624839 () Bool)

(declare-fun e!624840 () Bool)

(declare-fun mapRes!42196 () Bool)

(assert (=> b!1094458 (= e!624839 (and e!624840 mapRes!42196))))

(declare-fun condMapEmpty!42196 () Bool)

(declare-datatypes ((V!41075 0))(
  ( (V!41076 (val!13537 Int)) )
))
(declare-datatypes ((ValueCell!12771 0))(
  ( (ValueCellFull!12771 (v!16158 V!41075)) (EmptyCell!12771) )
))
(declare-datatypes ((array!70839 0))(
  ( (array!70840 (arr!34093 (Array (_ BitVec 32) ValueCell!12771)) (size!34629 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70839)

(declare-fun mapDefault!42196 () ValueCell!12771)

(assert (=> b!1094458 (= condMapEmpty!42196 (= (arr!34093 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12771)) mapDefault!42196)))))

(declare-fun mapNonEmpty!42196 () Bool)

(declare-fun tp!80711 () Bool)

(declare-fun e!624841 () Bool)

(assert (=> mapNonEmpty!42196 (= mapRes!42196 (and tp!80711 e!624841))))

(declare-fun mapRest!42196 () (Array (_ BitVec 32) ValueCell!12771))

(declare-fun mapKey!42196 () (_ BitVec 32))

(declare-fun mapValue!42196 () ValueCell!12771)

(assert (=> mapNonEmpty!42196 (= (arr!34093 _values!874) (store mapRest!42196 mapKey!42196 mapValue!42196))))

(declare-fun res!730377 () Bool)

(assert (=> start!96306 (=> (not res!730377) (not e!624842))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96306 (= res!730377 (validMask!0 mask!1414))))

(assert (=> start!96306 e!624842))

(assert (=> start!96306 true))

(declare-fun array_inv!26272 (array!70839) Bool)

(assert (=> start!96306 (and (array_inv!26272 _values!874) e!624839)))

(declare-fun array_inv!26273 (array!70837) Bool)

(assert (=> start!96306 (array_inv!26273 _keys!1070)))

(declare-fun b!1094459 () Bool)

(declare-fun tp_is_empty!26961 () Bool)

(assert (=> b!1094459 (= e!624840 tp_is_empty!26961)))

(declare-fun b!1094460 () Bool)

(declare-fun res!730376 () Bool)

(assert (=> b!1094460 (=> (not res!730376) (not e!624842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70837 (_ BitVec 32)) Bool)

(assert (=> b!1094460 (= res!730376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094461 () Bool)

(assert (=> b!1094461 (= e!624841 tp_is_empty!26961)))

(declare-fun mapIsEmpty!42196 () Bool)

(assert (=> mapIsEmpty!42196 mapRes!42196))

(declare-fun b!1094462 () Bool)

(declare-fun res!730375 () Bool)

(assert (=> b!1094462 (=> (not res!730375) (not e!624842))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094462 (= res!730375 (and (= (size!34629 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34628 _keys!1070) (size!34629 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!96306 res!730377) b!1094462))

(assert (= (and b!1094462 res!730375) b!1094460))

(assert (= (and b!1094460 res!730376) b!1094457))

(assert (= (and b!1094458 condMapEmpty!42196) mapIsEmpty!42196))

(assert (= (and b!1094458 (not condMapEmpty!42196)) mapNonEmpty!42196))

(get-info :version)

(assert (= (and mapNonEmpty!42196 ((_ is ValueCellFull!12771) mapValue!42196)) b!1094461))

(assert (= (and b!1094458 ((_ is ValueCellFull!12771) mapDefault!42196)) b!1094459))

(assert (= start!96306 b!1094458))

(declare-fun m!1014397 () Bool)

(assert (=> b!1094457 m!1014397))

(declare-fun m!1014399 () Bool)

(assert (=> mapNonEmpty!42196 m!1014399))

(declare-fun m!1014401 () Bool)

(assert (=> start!96306 m!1014401))

(declare-fun m!1014403 () Bool)

(assert (=> start!96306 m!1014403))

(declare-fun m!1014405 () Bool)

(assert (=> start!96306 m!1014405))

(declare-fun m!1014407 () Bool)

(assert (=> b!1094460 m!1014407))

(check-sat tp_is_empty!26961 (not b!1094457) (not mapNonEmpty!42196) (not b!1094460) (not start!96306))
(check-sat)
