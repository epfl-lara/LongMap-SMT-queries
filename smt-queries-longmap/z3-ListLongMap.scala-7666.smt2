; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96310 () Bool)

(assert start!96310)

(declare-fun b!1094402 () Bool)

(declare-fun res!730361 () Bool)

(declare-fun e!624823 () Bool)

(assert (=> b!1094402 (=> (not res!730361) (not e!624823))))

(declare-datatypes ((array!70768 0))(
  ( (array!70769 (arr!34058 (Array (_ BitVec 32) (_ BitVec 64))) (size!34596 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70768)

(declare-datatypes ((List!23854 0))(
  ( (Nil!23851) (Cons!23850 (h!25059 (_ BitVec 64)) (t!33852 List!23854)) )
))
(declare-fun arrayNoDuplicates!0 (array!70768 (_ BitVec 32) List!23854) Bool)

(assert (=> b!1094402 (= res!730361 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23851))))

(declare-fun b!1094403 () Bool)

(declare-fun res!730363 () Bool)

(assert (=> b!1094403 (=> (not res!730363) (not e!624823))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70768 (_ BitVec 32)) Bool)

(assert (=> b!1094403 (= res!730363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094404 () Bool)

(declare-fun res!730362 () Bool)

(assert (=> b!1094404 (=> (not res!730362) (not e!624823))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094404 (= res!730362 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34596 _keys!1070))))))

(declare-fun b!1094405 () Bool)

(declare-fun res!730365 () Bool)

(assert (=> b!1094405 (=> (not res!730365) (not e!624823))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094405 (= res!730365 (validKeyInArray!0 k0!904))))

(declare-fun res!730364 () Bool)

(assert (=> start!96310 (=> (not res!730364) (not e!624823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96310 (= res!730364 (validMask!0 mask!1414))))

(assert (=> start!96310 e!624823))

(assert (=> start!96310 true))

(declare-fun array_inv!26282 (array!70768) Bool)

(assert (=> start!96310 (array_inv!26282 _keys!1070)))

(declare-datatypes ((V!41089 0))(
  ( (V!41090 (val!13542 Int)) )
))
(declare-datatypes ((ValueCell!12776 0))(
  ( (ValueCellFull!12776 (v!16162 V!41089)) (EmptyCell!12776) )
))
(declare-datatypes ((array!70770 0))(
  ( (array!70771 (arr!34059 (Array (_ BitVec 32) ValueCell!12776)) (size!34597 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70770)

(declare-fun e!624820 () Bool)

(declare-fun array_inv!26283 (array!70770) Bool)

(assert (=> start!96310 (and (array_inv!26283 _values!874) e!624820)))

(declare-fun b!1094406 () Bool)

(declare-fun e!624822 () Bool)

(declare-fun mapRes!42211 () Bool)

(assert (=> b!1094406 (= e!624820 (and e!624822 mapRes!42211))))

(declare-fun condMapEmpty!42211 () Bool)

(declare-fun mapDefault!42211 () ValueCell!12776)

(assert (=> b!1094406 (= condMapEmpty!42211 (= (arr!34059 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12776)) mapDefault!42211)))))

(declare-fun b!1094407 () Bool)

(declare-fun e!624821 () Bool)

(declare-fun tp_is_empty!26971 () Bool)

(assert (=> b!1094407 (= e!624821 tp_is_empty!26971)))

(declare-fun b!1094408 () Bool)

(declare-fun res!730359 () Bool)

(assert (=> b!1094408 (=> (not res!730359) (not e!624823))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094408 (= res!730359 (and (= (size!34597 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34596 _keys!1070) (size!34597 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42211 () Bool)

(declare-fun tp!80726 () Bool)

(assert (=> mapNonEmpty!42211 (= mapRes!42211 (and tp!80726 e!624821))))

(declare-fun mapValue!42211 () ValueCell!12776)

(declare-fun mapRest!42211 () (Array (_ BitVec 32) ValueCell!12776))

(declare-fun mapKey!42211 () (_ BitVec 32))

(assert (=> mapNonEmpty!42211 (= (arr!34059 _values!874) (store mapRest!42211 mapKey!42211 mapValue!42211))))

(declare-fun b!1094409 () Bool)

(assert (=> b!1094409 (= e!624822 tp_is_empty!26971)))

(declare-fun b!1094410 () Bool)

(declare-fun res!730360 () Bool)

(assert (=> b!1094410 (=> (not res!730360) (not e!624823))))

(assert (=> b!1094410 (= res!730360 (= (select (arr!34058 _keys!1070) i!650) k0!904))))

(declare-fun b!1094411 () Bool)

(assert (=> b!1094411 (= e!624823 false)))

(declare-fun lt!489467 () Bool)

(assert (=> b!1094411 (= lt!489467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!70769 (store (arr!34058 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34596 _keys!1070)) mask!1414))))

(declare-fun mapIsEmpty!42211 () Bool)

(assert (=> mapIsEmpty!42211 mapRes!42211))

(assert (= (and start!96310 res!730364) b!1094408))

(assert (= (and b!1094408 res!730359) b!1094403))

(assert (= (and b!1094403 res!730363) b!1094402))

(assert (= (and b!1094402 res!730361) b!1094404))

(assert (= (and b!1094404 res!730362) b!1094405))

(assert (= (and b!1094405 res!730365) b!1094410))

(assert (= (and b!1094410 res!730360) b!1094411))

(assert (= (and b!1094406 condMapEmpty!42211) mapIsEmpty!42211))

(assert (= (and b!1094406 (not condMapEmpty!42211)) mapNonEmpty!42211))

(get-info :version)

(assert (= (and mapNonEmpty!42211 ((_ is ValueCellFull!12776) mapValue!42211)) b!1094407))

(assert (= (and b!1094406 ((_ is ValueCellFull!12776) mapDefault!42211)) b!1094409))

(assert (= start!96310 b!1094406))

(declare-fun m!1013831 () Bool)

(assert (=> b!1094410 m!1013831))

(declare-fun m!1013833 () Bool)

(assert (=> b!1094403 m!1013833))

(declare-fun m!1013835 () Bool)

(assert (=> start!96310 m!1013835))

(declare-fun m!1013837 () Bool)

(assert (=> start!96310 m!1013837))

(declare-fun m!1013839 () Bool)

(assert (=> start!96310 m!1013839))

(declare-fun m!1013841 () Bool)

(assert (=> b!1094405 m!1013841))

(declare-fun m!1013843 () Bool)

(assert (=> b!1094402 m!1013843))

(declare-fun m!1013845 () Bool)

(assert (=> b!1094411 m!1013845))

(declare-fun m!1013847 () Bool)

(assert (=> b!1094411 m!1013847))

(declare-fun m!1013849 () Bool)

(assert (=> mapNonEmpty!42211 m!1013849))

(check-sat (not start!96310) (not b!1094402) (not b!1094403) tp_is_empty!26971 (not b!1094411) (not mapNonEmpty!42211) (not b!1094405))
(check-sat)
