; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95652 () Bool)

(assert start!95652)

(declare-fun b_free!22305 () Bool)

(declare-fun b_next!22305 () Bool)

(assert (=> start!95652 (= b_free!22305 (not b_next!22305))))

(declare-fun tp!78763 () Bool)

(declare-fun b_and!35285 () Bool)

(assert (=> start!95652 (= tp!78763 b_and!35285)))

(declare-fun mapIsEmpty!41215 () Bool)

(declare-fun mapRes!41215 () Bool)

(assert (=> mapIsEmpty!41215 mapRes!41215))

(declare-fun b!1081007 () Bool)

(declare-fun e!617922 () Bool)

(declare-fun tp_is_empty!26307 () Bool)

(assert (=> b!1081007 (= e!617922 tp_is_empty!26307)))

(declare-fun b!1081008 () Bool)

(declare-fun res!720522 () Bool)

(declare-fun e!617925 () Bool)

(assert (=> b!1081008 (=> (not res!720522) (not e!617925))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69563 0))(
  ( (array!69564 (arr!33455 (Array (_ BitVec 32) (_ BitVec 64))) (size!33991 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69563)

(assert (=> b!1081008 (= res!720522 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33991 _keys!1070))))))

(declare-fun b!1081009 () Bool)

(declare-fun res!720515 () Bool)

(assert (=> b!1081009 (=> (not res!720515) (not e!617925))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69563 (_ BitVec 32)) Bool)

(assert (=> b!1081009 (= res!720515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081010 () Bool)

(declare-fun res!720520 () Bool)

(assert (=> b!1081010 (=> (not res!720520) (not e!617925))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40203 0))(
  ( (V!40204 (val!13210 Int)) )
))
(declare-datatypes ((ValueCell!12444 0))(
  ( (ValueCellFull!12444 (v!15831 V!40203)) (EmptyCell!12444) )
))
(declare-datatypes ((array!69565 0))(
  ( (array!69566 (arr!33456 (Array (_ BitVec 32) ValueCell!12444)) (size!33992 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69565)

(assert (=> b!1081010 (= res!720520 (and (= (size!33992 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33991 _keys!1070) (size!33992 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081011 () Bool)

(declare-fun res!720517 () Bool)

(assert (=> b!1081011 (=> (not res!720517) (not e!617925))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081011 (= res!720517 (validKeyInArray!0 k0!904))))

(declare-fun b!1081012 () Bool)

(declare-fun e!617927 () Bool)

(assert (=> b!1081012 (= e!617927 (not true))))

(declare-datatypes ((tuple2!16732 0))(
  ( (tuple2!16733 (_1!8377 (_ BitVec 64)) (_2!8377 V!40203)) )
))
(declare-datatypes ((List!23313 0))(
  ( (Nil!23310) (Cons!23309 (h!24518 tuple2!16732) (t!32676 List!23313)) )
))
(declare-datatypes ((ListLongMap!14701 0))(
  ( (ListLongMap!14702 (toList!7366 List!23313)) )
))
(declare-fun lt!479166 () ListLongMap!14701)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40203)

(declare-fun lt!479164 () array!69563)

(declare-fun zeroValue!831 () V!40203)

(declare-fun getCurrentListMapNoExtraKeys!3914 (array!69563 array!69565 (_ BitVec 32) (_ BitVec 32) V!40203 V!40203 (_ BitVec 32) Int) ListLongMap!14701)

(declare-fun dynLambda!2051 (Int (_ BitVec 64)) V!40203)

(assert (=> b!1081012 (= lt!479166 (getCurrentListMapNoExtraKeys!3914 lt!479164 (array!69566 (store (arr!33456 _values!874) i!650 (ValueCellFull!12444 (dynLambda!2051 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!33992 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479167 () ListLongMap!14701)

(assert (=> b!1081012 (= lt!479167 (getCurrentListMapNoExtraKeys!3914 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081012 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35552 0))(
  ( (Unit!35553) )
))
(declare-fun lt!479165 () Unit!35552)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69563 (_ BitVec 64) (_ BitVec 32)) Unit!35552)

(assert (=> b!1081012 (= lt!479165 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41215 () Bool)

(declare-fun tp!78764 () Bool)

(declare-fun e!617923 () Bool)

(assert (=> mapNonEmpty!41215 (= mapRes!41215 (and tp!78764 e!617923))))

(declare-fun mapRest!41215 () (Array (_ BitVec 32) ValueCell!12444))

(declare-fun mapKey!41215 () (_ BitVec 32))

(declare-fun mapValue!41215 () ValueCell!12444)

(assert (=> mapNonEmpty!41215 (= (arr!33456 _values!874) (store mapRest!41215 mapKey!41215 mapValue!41215))))

(declare-fun b!1081013 () Bool)

(assert (=> b!1081013 (= e!617923 tp_is_empty!26307)))

(declare-fun b!1081014 () Bool)

(declare-fun res!720518 () Bool)

(assert (=> b!1081014 (=> (not res!720518) (not e!617925))))

(assert (=> b!1081014 (= res!720518 (= (select (arr!33455 _keys!1070) i!650) k0!904))))

(declare-fun b!1081016 () Bool)

(declare-fun res!720514 () Bool)

(assert (=> b!1081016 (=> (not res!720514) (not e!617925))))

(declare-datatypes ((List!23314 0))(
  ( (Nil!23311) (Cons!23310 (h!24519 (_ BitVec 64)) (t!32677 List!23314)) )
))
(declare-fun arrayNoDuplicates!0 (array!69563 (_ BitVec 32) List!23314) Bool)

(assert (=> b!1081016 (= res!720514 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23311))))

(declare-fun res!720519 () Bool)

(assert (=> start!95652 (=> (not res!720519) (not e!617925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95652 (= res!720519 (validMask!0 mask!1414))))

(assert (=> start!95652 e!617925))

(assert (=> start!95652 tp!78763))

(assert (=> start!95652 true))

(assert (=> start!95652 tp_is_empty!26307))

(declare-fun array_inv!25830 (array!69563) Bool)

(assert (=> start!95652 (array_inv!25830 _keys!1070)))

(declare-fun e!617926 () Bool)

(declare-fun array_inv!25831 (array!69565) Bool)

(assert (=> start!95652 (and (array_inv!25831 _values!874) e!617926)))

(declare-fun b!1081015 () Bool)

(declare-fun res!720521 () Bool)

(assert (=> b!1081015 (=> (not res!720521) (not e!617927))))

(assert (=> b!1081015 (= res!720521 (arrayNoDuplicates!0 lt!479164 #b00000000000000000000000000000000 Nil!23311))))

(declare-fun b!1081017 () Bool)

(assert (=> b!1081017 (= e!617925 e!617927)))

(declare-fun res!720516 () Bool)

(assert (=> b!1081017 (=> (not res!720516) (not e!617927))))

(assert (=> b!1081017 (= res!720516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479164 mask!1414))))

(assert (=> b!1081017 (= lt!479164 (array!69564 (store (arr!33455 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33991 _keys!1070)))))

(declare-fun b!1081018 () Bool)

(assert (=> b!1081018 (= e!617926 (and e!617922 mapRes!41215))))

(declare-fun condMapEmpty!41215 () Bool)

(declare-fun mapDefault!41215 () ValueCell!12444)

(assert (=> b!1081018 (= condMapEmpty!41215 (= (arr!33456 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12444)) mapDefault!41215)))))

(assert (= (and start!95652 res!720519) b!1081010))

(assert (= (and b!1081010 res!720520) b!1081009))

(assert (= (and b!1081009 res!720515) b!1081016))

(assert (= (and b!1081016 res!720514) b!1081008))

(assert (= (and b!1081008 res!720522) b!1081011))

(assert (= (and b!1081011 res!720517) b!1081014))

(assert (= (and b!1081014 res!720518) b!1081017))

(assert (= (and b!1081017 res!720516) b!1081015))

(assert (= (and b!1081015 res!720521) b!1081012))

(assert (= (and b!1081018 condMapEmpty!41215) mapIsEmpty!41215))

(assert (= (and b!1081018 (not condMapEmpty!41215)) mapNonEmpty!41215))

(get-info :version)

(assert (= (and mapNonEmpty!41215 ((_ is ValueCellFull!12444) mapValue!41215)) b!1081013))

(assert (= (and b!1081018 ((_ is ValueCellFull!12444) mapDefault!41215)) b!1081007))

(assert (= start!95652 b!1081018))

(declare-fun b_lambda!16975 () Bool)

(assert (=> (not b_lambda!16975) (not b!1081012)))

(declare-fun t!32675 () Bool)

(declare-fun tb!7183 () Bool)

(assert (=> (and start!95652 (= defaultEntry!882 defaultEntry!882) t!32675) tb!7183))

(declare-fun result!14885 () Bool)

(assert (=> tb!7183 (= result!14885 tp_is_empty!26307)))

(assert (=> b!1081012 t!32675))

(declare-fun b_and!35287 () Bool)

(assert (= b_and!35285 (and (=> t!32675 result!14885) b_and!35287)))

(declare-fun m!998843 () Bool)

(assert (=> b!1081014 m!998843))

(declare-fun m!998845 () Bool)

(assert (=> start!95652 m!998845))

(declare-fun m!998847 () Bool)

(assert (=> start!95652 m!998847))

(declare-fun m!998849 () Bool)

(assert (=> start!95652 m!998849))

(declare-fun m!998851 () Bool)

(assert (=> b!1081015 m!998851))

(declare-fun m!998853 () Bool)

(assert (=> b!1081016 m!998853))

(declare-fun m!998855 () Bool)

(assert (=> b!1081009 m!998855))

(declare-fun m!998857 () Bool)

(assert (=> mapNonEmpty!41215 m!998857))

(declare-fun m!998859 () Bool)

(assert (=> b!1081011 m!998859))

(declare-fun m!998861 () Bool)

(assert (=> b!1081017 m!998861))

(declare-fun m!998863 () Bool)

(assert (=> b!1081017 m!998863))

(declare-fun m!998865 () Bool)

(assert (=> b!1081012 m!998865))

(declare-fun m!998867 () Bool)

(assert (=> b!1081012 m!998867))

(declare-fun m!998869 () Bool)

(assert (=> b!1081012 m!998869))

(declare-fun m!998871 () Bool)

(assert (=> b!1081012 m!998871))

(declare-fun m!998873 () Bool)

(assert (=> b!1081012 m!998873))

(declare-fun m!998875 () Bool)

(assert (=> b!1081012 m!998875))

(check-sat (not b!1081011) (not mapNonEmpty!41215) (not b_next!22305) (not start!95652) (not b!1081017) tp_is_empty!26307 (not b!1081015) (not b!1081016) b_and!35287 (not b!1081012) (not b_lambda!16975) (not b!1081009))
(check-sat b_and!35287 (not b_next!22305))
