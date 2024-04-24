; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95892 () Bool)

(assert start!95892)

(declare-fun b_free!22309 () Bool)

(declare-fun b_next!22309 () Bool)

(assert (=> start!95892 (= b_free!22309 (not b_next!22309))))

(declare-fun tp!78775 () Bool)

(declare-fun b_and!35303 () Bool)

(assert (=> start!95892 (= tp!78775 b_and!35303)))

(declare-fun b!1082410 () Bool)

(declare-fun res!721096 () Bool)

(declare-fun e!618816 () Bool)

(assert (=> b!1082410 (=> (not res!721096) (not e!618816))))

(declare-datatypes ((array!69607 0))(
  ( (array!69608 (arr!33471 (Array (_ BitVec 32) (_ BitVec 64))) (size!34008 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69607)

(declare-datatypes ((List!23326 0))(
  ( (Nil!23323) (Cons!23322 (h!24540 (_ BitVec 64)) (t!32685 List!23326)) )
))
(declare-fun arrayNoDuplicates!0 (array!69607 (_ BitVec 32) List!23326) Bool)

(assert (=> b!1082410 (= res!721096 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23323))))

(declare-fun b!1082411 () Bool)

(declare-fun res!721091 () Bool)

(assert (=> b!1082411 (=> (not res!721091) (not e!618816))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082411 (= res!721091 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34008 _keys!1070))))))

(declare-fun b!1082412 () Bool)

(declare-fun e!618813 () Bool)

(declare-fun tp_is_empty!26311 () Bool)

(assert (=> b!1082412 (= e!618813 tp_is_empty!26311)))

(declare-fun b!1082413 () Bool)

(declare-fun res!721098 () Bool)

(assert (=> b!1082413 (=> (not res!721098) (not e!618816))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082413 (= res!721098 (validKeyInArray!0 k0!904))))

(declare-fun b!1082414 () Bool)

(declare-fun e!618817 () Bool)

(declare-fun mapRes!41221 () Bool)

(assert (=> b!1082414 (= e!618817 (and e!618813 mapRes!41221))))

(declare-fun condMapEmpty!41221 () Bool)

(declare-datatypes ((V!40209 0))(
  ( (V!40210 (val!13212 Int)) )
))
(declare-datatypes ((ValueCell!12446 0))(
  ( (ValueCellFull!12446 (v!15829 V!40209)) (EmptyCell!12446) )
))
(declare-datatypes ((array!69609 0))(
  ( (array!69610 (arr!33472 (Array (_ BitVec 32) ValueCell!12446)) (size!34009 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69609)

(declare-fun mapDefault!41221 () ValueCell!12446)

(assert (=> b!1082414 (= condMapEmpty!41221 (= (arr!33472 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12446)) mapDefault!41221)))))

(declare-fun b!1082415 () Bool)

(declare-fun res!721094 () Bool)

(assert (=> b!1082415 (=> (not res!721094) (not e!618816))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69607 (_ BitVec 32)) Bool)

(assert (=> b!1082415 (= res!721094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082416 () Bool)

(declare-fun res!721097 () Bool)

(assert (=> b!1082416 (=> (not res!721097) (not e!618816))))

(assert (=> b!1082416 (= res!721097 (= (select (arr!33471 _keys!1070) i!650) k0!904))))

(declare-fun b!1082417 () Bool)

(declare-fun res!721095 () Bool)

(assert (=> b!1082417 (=> (not res!721095) (not e!618816))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1082417 (= res!721095 (and (= (size!34009 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34008 _keys!1070) (size!34009 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082418 () Bool)

(declare-fun e!618818 () Bool)

(assert (=> b!1082418 (= e!618818 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40209)

(declare-fun zeroValue!831 () V!40209)

(declare-fun lt!479704 () array!69607)

(declare-datatypes ((tuple2!16736 0))(
  ( (tuple2!16737 (_1!8379 (_ BitVec 64)) (_2!8379 V!40209)) )
))
(declare-datatypes ((List!23327 0))(
  ( (Nil!23324) (Cons!23323 (h!24541 tuple2!16736) (t!32686 List!23327)) )
))
(declare-datatypes ((ListLongMap!14713 0))(
  ( (ListLongMap!14714 (toList!7372 List!23327)) )
))
(declare-fun lt!479703 () ListLongMap!14713)

(declare-fun getCurrentListMapNoExtraKeys!3949 (array!69607 array!69609 (_ BitVec 32) (_ BitVec 32) V!40209 V!40209 (_ BitVec 32) Int) ListLongMap!14713)

(declare-fun dynLambda!2070 (Int (_ BitVec 64)) V!40209)

(assert (=> b!1082418 (= lt!479703 (getCurrentListMapNoExtraKeys!3949 lt!479704 (array!69610 (store (arr!33472 _values!874) i!650 (ValueCellFull!12446 (dynLambda!2070 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34009 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479705 () ListLongMap!14713)

(assert (=> b!1082418 (= lt!479705 (getCurrentListMapNoExtraKeys!3949 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082418 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35535 0))(
  ( (Unit!35536) )
))
(declare-fun lt!479706 () Unit!35535)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69607 (_ BitVec 64) (_ BitVec 32)) Unit!35535)

(assert (=> b!1082418 (= lt!479706 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!41221 () Bool)

(assert (=> mapIsEmpty!41221 mapRes!41221))

(declare-fun b!1082419 () Bool)

(declare-fun res!721092 () Bool)

(assert (=> b!1082419 (=> (not res!721092) (not e!618818))))

(assert (=> b!1082419 (= res!721092 (arrayNoDuplicates!0 lt!479704 #b00000000000000000000000000000000 Nil!23323))))

(declare-fun mapNonEmpty!41221 () Bool)

(declare-fun tp!78776 () Bool)

(declare-fun e!618815 () Bool)

(assert (=> mapNonEmpty!41221 (= mapRes!41221 (and tp!78776 e!618815))))

(declare-fun mapRest!41221 () (Array (_ BitVec 32) ValueCell!12446))

(declare-fun mapValue!41221 () ValueCell!12446)

(declare-fun mapKey!41221 () (_ BitVec 32))

(assert (=> mapNonEmpty!41221 (= (arr!33472 _values!874) (store mapRest!41221 mapKey!41221 mapValue!41221))))

(declare-fun b!1082420 () Bool)

(assert (=> b!1082420 (= e!618816 e!618818)))

(declare-fun res!721093 () Bool)

(assert (=> b!1082420 (=> (not res!721093) (not e!618818))))

(assert (=> b!1082420 (= res!721093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479704 mask!1414))))

(assert (=> b!1082420 (= lt!479704 (array!69608 (store (arr!33471 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34008 _keys!1070)))))

(declare-fun b!1082421 () Bool)

(assert (=> b!1082421 (= e!618815 tp_is_empty!26311)))

(declare-fun res!721090 () Bool)

(assert (=> start!95892 (=> (not res!721090) (not e!618816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95892 (= res!721090 (validMask!0 mask!1414))))

(assert (=> start!95892 e!618816))

(assert (=> start!95892 tp!78775))

(assert (=> start!95892 true))

(assert (=> start!95892 tp_is_empty!26311))

(declare-fun array_inv!25880 (array!69607) Bool)

(assert (=> start!95892 (array_inv!25880 _keys!1070)))

(declare-fun array_inv!25881 (array!69609) Bool)

(assert (=> start!95892 (and (array_inv!25881 _values!874) e!618817)))

(assert (= (and start!95892 res!721090) b!1082417))

(assert (= (and b!1082417 res!721095) b!1082415))

(assert (= (and b!1082415 res!721094) b!1082410))

(assert (= (and b!1082410 res!721096) b!1082411))

(assert (= (and b!1082411 res!721091) b!1082413))

(assert (= (and b!1082413 res!721098) b!1082416))

(assert (= (and b!1082416 res!721097) b!1082420))

(assert (= (and b!1082420 res!721093) b!1082419))

(assert (= (and b!1082419 res!721092) b!1082418))

(assert (= (and b!1082414 condMapEmpty!41221) mapIsEmpty!41221))

(assert (= (and b!1082414 (not condMapEmpty!41221)) mapNonEmpty!41221))

(get-info :version)

(assert (= (and mapNonEmpty!41221 ((_ is ValueCellFull!12446) mapValue!41221)) b!1082421))

(assert (= (and b!1082414 ((_ is ValueCellFull!12446) mapDefault!41221)) b!1082412))

(assert (= start!95892 b!1082414))

(declare-fun b_lambda!16989 () Bool)

(assert (=> (not b_lambda!16989) (not b!1082418)))

(declare-fun t!32684 () Bool)

(declare-fun tb!7179 () Bool)

(assert (=> (and start!95892 (= defaultEntry!882 defaultEntry!882) t!32684) tb!7179))

(declare-fun result!14885 () Bool)

(assert (=> tb!7179 (= result!14885 tp_is_empty!26311)))

(assert (=> b!1082418 t!32684))

(declare-fun b_and!35305 () Bool)

(assert (= b_and!35303 (and (=> t!32684 result!14885) b_and!35305)))

(declare-fun m!1000583 () Bool)

(assert (=> mapNonEmpty!41221 m!1000583))

(declare-fun m!1000585 () Bool)

(assert (=> b!1082419 m!1000585))

(declare-fun m!1000587 () Bool)

(assert (=> b!1082413 m!1000587))

(declare-fun m!1000589 () Bool)

(assert (=> b!1082416 m!1000589))

(declare-fun m!1000591 () Bool)

(assert (=> b!1082418 m!1000591))

(declare-fun m!1000593 () Bool)

(assert (=> b!1082418 m!1000593))

(declare-fun m!1000595 () Bool)

(assert (=> b!1082418 m!1000595))

(declare-fun m!1000597 () Bool)

(assert (=> b!1082418 m!1000597))

(declare-fun m!1000599 () Bool)

(assert (=> b!1082418 m!1000599))

(declare-fun m!1000601 () Bool)

(assert (=> b!1082418 m!1000601))

(declare-fun m!1000603 () Bool)

(assert (=> b!1082415 m!1000603))

(declare-fun m!1000605 () Bool)

(assert (=> start!95892 m!1000605))

(declare-fun m!1000607 () Bool)

(assert (=> start!95892 m!1000607))

(declare-fun m!1000609 () Bool)

(assert (=> start!95892 m!1000609))

(declare-fun m!1000611 () Bool)

(assert (=> b!1082420 m!1000611))

(declare-fun m!1000613 () Bool)

(assert (=> b!1082420 m!1000613))

(declare-fun m!1000615 () Bool)

(assert (=> b!1082410 m!1000615))

(check-sat b_and!35305 (not b_lambda!16989) (not start!95892) (not b!1082410) (not b!1082415) (not b!1082413) (not b_next!22309) (not b!1082419) (not b!1082418) (not b!1082420) (not mapNonEmpty!41221) tp_is_empty!26311)
(check-sat b_and!35305 (not b_next!22309))
