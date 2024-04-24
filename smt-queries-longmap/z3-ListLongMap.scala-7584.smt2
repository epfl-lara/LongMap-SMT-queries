; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96060 () Bool)

(assert start!96060)

(declare-fun b_free!22477 () Bool)

(declare-fun b_next!22477 () Bool)

(assert (=> start!96060 (= b_free!22477 (not b_next!22477))))

(declare-fun tp!79279 () Bool)

(declare-fun b_and!35639 () Bool)

(assert (=> start!96060 (= tp!79279 b_and!35639)))

(declare-fun mapNonEmpty!41473 () Bool)

(declare-fun mapRes!41473 () Bool)

(declare-fun tp!79280 () Bool)

(declare-fun e!620325 () Bool)

(assert (=> mapNonEmpty!41473 (= mapRes!41473 (and tp!79280 e!620325))))

(declare-fun mapKey!41473 () (_ BitVec 32))

(declare-datatypes ((V!40433 0))(
  ( (V!40434 (val!13296 Int)) )
))
(declare-datatypes ((ValueCell!12530 0))(
  ( (ValueCellFull!12530 (v!15913 V!40433)) (EmptyCell!12530) )
))
(declare-fun mapValue!41473 () ValueCell!12530)

(declare-datatypes ((array!69935 0))(
  ( (array!69936 (arr!33635 (Array (_ BitVec 32) ValueCell!12530)) (size!34172 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69935)

(declare-fun mapRest!41473 () (Array (_ BitVec 32) ValueCell!12530))

(assert (=> mapNonEmpty!41473 (= (arr!33635 _values!874) (store mapRest!41473 mapKey!41473 mapValue!41473))))

(declare-fun b!1085602 () Bool)

(declare-fun res!723366 () Bool)

(declare-fun e!620330 () Bool)

(assert (=> b!1085602 (=> (not res!723366) (not e!620330))))

(declare-datatypes ((array!69937 0))(
  ( (array!69938 (arr!33636 (Array (_ BitVec 32) (_ BitVec 64))) (size!34173 (_ BitVec 32))) )
))
(declare-fun lt!481103 () array!69937)

(declare-datatypes ((List!23455 0))(
  ( (Nil!23452) (Cons!23451 (h!24669 (_ BitVec 64)) (t!32982 List!23455)) )
))
(declare-fun arrayNoDuplicates!0 (array!69937 (_ BitVec 32) List!23455) Bool)

(assert (=> b!1085602 (= res!723366 (arrayNoDuplicates!0 lt!481103 #b00000000000000000000000000000000 Nil!23452))))

(declare-fun b!1085603 () Bool)

(declare-fun res!723364 () Bool)

(declare-fun e!620329 () Bool)

(assert (=> b!1085603 (=> (not res!723364) (not e!620329))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun _keys!1070 () array!69937)

(assert (=> b!1085603 (= res!723364 (= (select (arr!33636 _keys!1070) i!650) k0!904))))

(declare-fun b!1085604 () Bool)

(declare-fun res!723362 () Bool)

(assert (=> b!1085604 (=> (not res!723362) (not e!620329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085604 (= res!723362 (validKeyInArray!0 k0!904))))

(declare-fun b!1085605 () Bool)

(declare-fun tp_is_empty!26479 () Bool)

(assert (=> b!1085605 (= e!620325 tp_is_empty!26479)))

(declare-fun mapIsEmpty!41473 () Bool)

(assert (=> mapIsEmpty!41473 mapRes!41473))

(declare-fun b!1085606 () Bool)

(declare-fun res!723360 () Bool)

(assert (=> b!1085606 (=> (not res!723360) (not e!620329))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085606 (= res!723360 (and (= (size!34172 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34173 _keys!1070) (size!34172 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085607 () Bool)

(declare-fun res!723361 () Bool)

(assert (=> b!1085607 (=> (not res!723361) (not e!620329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69937 (_ BitVec 32)) Bool)

(assert (=> b!1085607 (= res!723361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085608 () Bool)

(assert (=> b!1085608 (= e!620329 e!620330)))

(declare-fun res!723359 () Bool)

(assert (=> b!1085608 (=> (not res!723359) (not e!620330))))

(assert (=> b!1085608 (= res!723359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481103 mask!1414))))

(assert (=> b!1085608 (= lt!481103 (array!69938 (store (arr!33636 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34173 _keys!1070)))))

(declare-fun b!1085609 () Bool)

(declare-fun res!723358 () Bool)

(assert (=> b!1085609 (=> (not res!723358) (not e!620329))))

(assert (=> b!1085609 (= res!723358 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34173 _keys!1070))))))

(declare-fun res!723363 () Bool)

(assert (=> start!96060 (=> (not res!723363) (not e!620329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96060 (= res!723363 (validMask!0 mask!1414))))

(assert (=> start!96060 e!620329))

(assert (=> start!96060 tp!79279))

(assert (=> start!96060 true))

(assert (=> start!96060 tp_is_empty!26479))

(declare-fun array_inv!26004 (array!69937) Bool)

(assert (=> start!96060 (array_inv!26004 _keys!1070)))

(declare-fun e!620326 () Bool)

(declare-fun array_inv!26005 (array!69935) Bool)

(assert (=> start!96060 (and (array_inv!26005 _values!874) e!620326)))

(declare-fun b!1085610 () Bool)

(assert (=> b!1085610 (= e!620330 (not true))))

(declare-datatypes ((tuple2!16858 0))(
  ( (tuple2!16859 (_1!8440 (_ BitVec 64)) (_2!8440 V!40433)) )
))
(declare-datatypes ((List!23456 0))(
  ( (Nil!23453) (Cons!23452 (h!24670 tuple2!16858) (t!32983 List!23456)) )
))
(declare-datatypes ((ListLongMap!14835 0))(
  ( (ListLongMap!14836 (toList!7433 List!23456)) )
))
(declare-fun lt!481104 () ListLongMap!14835)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40433)

(declare-fun zeroValue!831 () V!40433)

(declare-fun lt!481097 () array!69935)

(declare-fun getCurrentListMap!4205 (array!69937 array!69935 (_ BitVec 32) (_ BitVec 32) V!40433 V!40433 (_ BitVec 32) Int) ListLongMap!14835)

(assert (=> b!1085610 (= lt!481104 (getCurrentListMap!4205 lt!481103 lt!481097 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481100 () ListLongMap!14835)

(declare-fun lt!481101 () ListLongMap!14835)

(assert (=> b!1085610 (and (= lt!481100 lt!481101) (= lt!481101 lt!481100))))

(declare-fun lt!481099 () ListLongMap!14835)

(declare-fun -!745 (ListLongMap!14835 (_ BitVec 64)) ListLongMap!14835)

(assert (=> b!1085610 (= lt!481101 (-!745 lt!481099 k0!904))))

(declare-datatypes ((Unit!35657 0))(
  ( (Unit!35658) )
))
(declare-fun lt!481102 () Unit!35657)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!34 (array!69937 array!69935 (_ BitVec 32) (_ BitVec 32) V!40433 V!40433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35657)

(assert (=> b!1085610 (= lt!481102 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!34 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4010 (array!69937 array!69935 (_ BitVec 32) (_ BitVec 32) V!40433 V!40433 (_ BitVec 32) Int) ListLongMap!14835)

(assert (=> b!1085610 (= lt!481100 (getCurrentListMapNoExtraKeys!4010 lt!481103 lt!481097 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2131 (Int (_ BitVec 64)) V!40433)

(assert (=> b!1085610 (= lt!481097 (array!69936 (store (arr!33635 _values!874) i!650 (ValueCellFull!12530 (dynLambda!2131 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34172 _values!874)))))

(assert (=> b!1085610 (= lt!481099 (getCurrentListMapNoExtraKeys!4010 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085610 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481098 () Unit!35657)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69937 (_ BitVec 64) (_ BitVec 32)) Unit!35657)

(assert (=> b!1085610 (= lt!481098 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085611 () Bool)

(declare-fun res!723365 () Bool)

(assert (=> b!1085611 (=> (not res!723365) (not e!620329))))

(assert (=> b!1085611 (= res!723365 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23452))))

(declare-fun b!1085612 () Bool)

(declare-fun e!620327 () Bool)

(assert (=> b!1085612 (= e!620327 tp_is_empty!26479)))

(declare-fun b!1085613 () Bool)

(assert (=> b!1085613 (= e!620326 (and e!620327 mapRes!41473))))

(declare-fun condMapEmpty!41473 () Bool)

(declare-fun mapDefault!41473 () ValueCell!12530)

(assert (=> b!1085613 (= condMapEmpty!41473 (= (arr!33635 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12530)) mapDefault!41473)))))

(assert (= (and start!96060 res!723363) b!1085606))

(assert (= (and b!1085606 res!723360) b!1085607))

(assert (= (and b!1085607 res!723361) b!1085611))

(assert (= (and b!1085611 res!723365) b!1085609))

(assert (= (and b!1085609 res!723358) b!1085604))

(assert (= (and b!1085604 res!723362) b!1085603))

(assert (= (and b!1085603 res!723364) b!1085608))

(assert (= (and b!1085608 res!723359) b!1085602))

(assert (= (and b!1085602 res!723366) b!1085610))

(assert (= (and b!1085613 condMapEmpty!41473) mapIsEmpty!41473))

(assert (= (and b!1085613 (not condMapEmpty!41473)) mapNonEmpty!41473))

(get-info :version)

(assert (= (and mapNonEmpty!41473 ((_ is ValueCellFull!12530) mapValue!41473)) b!1085605))

(assert (= (and b!1085613 ((_ is ValueCellFull!12530) mapDefault!41473)) b!1085612))

(assert (= start!96060 b!1085613))

(declare-fun b_lambda!17157 () Bool)

(assert (=> (not b_lambda!17157) (not b!1085610)))

(declare-fun t!32981 () Bool)

(declare-fun tb!7347 () Bool)

(assert (=> (and start!96060 (= defaultEntry!882 defaultEntry!882) t!32981) tb!7347))

(declare-fun result!15221 () Bool)

(assert (=> tb!7347 (= result!15221 tp_is_empty!26479)))

(assert (=> b!1085610 t!32981))

(declare-fun b_and!35641 () Bool)

(assert (= b_and!35639 (and (=> t!32981 result!15221) b_and!35641)))

(declare-fun m!1003655 () Bool)

(assert (=> b!1085611 m!1003655))

(declare-fun m!1003657 () Bool)

(assert (=> b!1085607 m!1003657))

(declare-fun m!1003659 () Bool)

(assert (=> b!1085602 m!1003659))

(declare-fun m!1003661 () Bool)

(assert (=> b!1085604 m!1003661))

(declare-fun m!1003663 () Bool)

(assert (=> b!1085610 m!1003663))

(declare-fun m!1003665 () Bool)

(assert (=> b!1085610 m!1003665))

(declare-fun m!1003667 () Bool)

(assert (=> b!1085610 m!1003667))

(declare-fun m!1003669 () Bool)

(assert (=> b!1085610 m!1003669))

(declare-fun m!1003671 () Bool)

(assert (=> b!1085610 m!1003671))

(declare-fun m!1003673 () Bool)

(assert (=> b!1085610 m!1003673))

(declare-fun m!1003675 () Bool)

(assert (=> b!1085610 m!1003675))

(declare-fun m!1003677 () Bool)

(assert (=> b!1085610 m!1003677))

(declare-fun m!1003679 () Bool)

(assert (=> b!1085610 m!1003679))

(declare-fun m!1003681 () Bool)

(assert (=> b!1085603 m!1003681))

(declare-fun m!1003683 () Bool)

(assert (=> b!1085608 m!1003683))

(declare-fun m!1003685 () Bool)

(assert (=> b!1085608 m!1003685))

(declare-fun m!1003687 () Bool)

(assert (=> mapNonEmpty!41473 m!1003687))

(declare-fun m!1003689 () Bool)

(assert (=> start!96060 m!1003689))

(declare-fun m!1003691 () Bool)

(assert (=> start!96060 m!1003691))

(declare-fun m!1003693 () Bool)

(assert (=> start!96060 m!1003693))

(check-sat (not b!1085604) (not b!1085607) (not b_next!22477) tp_is_empty!26479 (not b!1085602) (not b!1085611) (not b!1085610) (not start!96060) (not b_lambda!17157) (not mapNonEmpty!41473) b_and!35641 (not b!1085608))
(check-sat b_and!35641 (not b_next!22477))
