; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95680 () Bool)

(assert start!95680)

(declare-fun b_free!22339 () Bool)

(declare-fun b_next!22339 () Bool)

(assert (=> start!95680 (= b_free!22339 (not b_next!22339))))

(declare-fun tp!78865 () Bool)

(declare-fun b_and!35327 () Bool)

(assert (=> start!95680 (= tp!78865 b_and!35327)))

(declare-fun b!1081500 () Bool)

(declare-fun res!720910 () Bool)

(declare-fun e!618137 () Bool)

(assert (=> b!1081500 (=> (not res!720910) (not e!618137))))

(declare-datatypes ((array!69558 0))(
  ( (array!69559 (arr!33453 (Array (_ BitVec 32) (_ BitVec 64))) (size!33991 (_ BitVec 32))) )
))
(declare-fun lt!479169 () array!69558)

(declare-datatypes ((List!23383 0))(
  ( (Nil!23380) (Cons!23379 (h!24588 (_ BitVec 64)) (t!32771 List!23383)) )
))
(declare-fun arrayNoDuplicates!0 (array!69558 (_ BitVec 32) List!23383) Bool)

(assert (=> b!1081500 (= res!720910 (arrayNoDuplicates!0 lt!479169 #b00000000000000000000000000000000 Nil!23380))))

(declare-fun b!1081501 () Bool)

(declare-fun res!720907 () Bool)

(declare-fun e!618138 () Bool)

(assert (=> b!1081501 (=> (not res!720907) (not e!618138))))

(declare-fun _keys!1070 () array!69558)

(assert (=> b!1081501 (= res!720907 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23380))))

(declare-fun b!1081502 () Bool)

(declare-fun res!720909 () Bool)

(assert (=> b!1081502 (=> (not res!720909) (not e!618138))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40249 0))(
  ( (V!40250 (val!13227 Int)) )
))
(declare-datatypes ((ValueCell!12461 0))(
  ( (ValueCellFull!12461 (v!15847 V!40249)) (EmptyCell!12461) )
))
(declare-datatypes ((array!69560 0))(
  ( (array!69561 (arr!33454 (Array (_ BitVec 32) ValueCell!12461)) (size!33992 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69560)

(assert (=> b!1081502 (= res!720909 (and (= (size!33992 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33991 _keys!1070) (size!33992 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081503 () Bool)

(declare-fun e!618139 () Bool)

(declare-fun tp_is_empty!26341 () Bool)

(assert (=> b!1081503 (= e!618139 tp_is_empty!26341)))

(declare-fun res!720908 () Bool)

(assert (=> start!95680 (=> (not res!720908) (not e!618138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95680 (= res!720908 (validMask!0 mask!1414))))

(assert (=> start!95680 e!618138))

(assert (=> start!95680 tp!78865))

(assert (=> start!95680 true))

(assert (=> start!95680 tp_is_empty!26341))

(declare-fun array_inv!25860 (array!69558) Bool)

(assert (=> start!95680 (array_inv!25860 _keys!1070)))

(declare-fun e!618135 () Bool)

(declare-fun array_inv!25861 (array!69560) Bool)

(assert (=> start!95680 (and (array_inv!25861 _values!874) e!618135)))

(declare-fun b!1081504 () Bool)

(assert (=> b!1081504 (= e!618137 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40249)

(declare-datatypes ((tuple2!16820 0))(
  ( (tuple2!16821 (_1!8421 (_ BitVec 64)) (_2!8421 V!40249)) )
))
(declare-datatypes ((List!23384 0))(
  ( (Nil!23381) (Cons!23380 (h!24589 tuple2!16820) (t!32772 List!23384)) )
))
(declare-datatypes ((ListLongMap!14789 0))(
  ( (ListLongMap!14790 (toList!7410 List!23384)) )
))
(declare-fun lt!479168 () ListLongMap!14789)

(declare-fun zeroValue!831 () V!40249)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3973 (array!69558 array!69560 (_ BitVec 32) (_ BitVec 32) V!40249 V!40249 (_ BitVec 32) Int) ListLongMap!14789)

(declare-fun dynLambda!2044 (Int (_ BitVec 64)) V!40249)

(assert (=> b!1081504 (= lt!479168 (getCurrentListMapNoExtraKeys!3973 lt!479169 (array!69561 (store (arr!33454 _values!874) i!650 (ValueCellFull!12461 (dynLambda!2044 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!33992 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479170 () ListLongMap!14789)

(assert (=> b!1081504 (= lt!479170 (getCurrentListMapNoExtraKeys!3973 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081504 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35413 0))(
  ( (Unit!35414) )
))
(declare-fun lt!479171 () Unit!35413)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69558 (_ BitVec 64) (_ BitVec 32)) Unit!35413)

(assert (=> b!1081504 (= lt!479171 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081505 () Bool)

(declare-fun res!720912 () Bool)

(assert (=> b!1081505 (=> (not res!720912) (not e!618138))))

(assert (=> b!1081505 (= res!720912 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33991 _keys!1070))))))

(declare-fun mapIsEmpty!41266 () Bool)

(declare-fun mapRes!41266 () Bool)

(assert (=> mapIsEmpty!41266 mapRes!41266))

(declare-fun b!1081506 () Bool)

(declare-fun res!720905 () Bool)

(assert (=> b!1081506 (=> (not res!720905) (not e!618138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081506 (= res!720905 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41266 () Bool)

(declare-fun tp!78866 () Bool)

(declare-fun e!618136 () Bool)

(assert (=> mapNonEmpty!41266 (= mapRes!41266 (and tp!78866 e!618136))))

(declare-fun mapRest!41266 () (Array (_ BitVec 32) ValueCell!12461))

(declare-fun mapKey!41266 () (_ BitVec 32))

(declare-fun mapValue!41266 () ValueCell!12461)

(assert (=> mapNonEmpty!41266 (= (arr!33454 _values!874) (store mapRest!41266 mapKey!41266 mapValue!41266))))

(declare-fun b!1081507 () Bool)

(assert (=> b!1081507 (= e!618138 e!618137)))

(declare-fun res!720904 () Bool)

(assert (=> b!1081507 (=> (not res!720904) (not e!618137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69558 (_ BitVec 32)) Bool)

(assert (=> b!1081507 (= res!720904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479169 mask!1414))))

(assert (=> b!1081507 (= lt!479169 (array!69559 (store (arr!33453 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33991 _keys!1070)))))

(declare-fun b!1081508 () Bool)

(declare-fun res!720906 () Bool)

(assert (=> b!1081508 (=> (not res!720906) (not e!618138))))

(assert (=> b!1081508 (= res!720906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081509 () Bool)

(assert (=> b!1081509 (= e!618136 tp_is_empty!26341)))

(declare-fun b!1081510 () Bool)

(declare-fun res!720911 () Bool)

(assert (=> b!1081510 (=> (not res!720911) (not e!618138))))

(assert (=> b!1081510 (= res!720911 (= (select (arr!33453 _keys!1070) i!650) k0!904))))

(declare-fun b!1081511 () Bool)

(assert (=> b!1081511 (= e!618135 (and e!618139 mapRes!41266))))

(declare-fun condMapEmpty!41266 () Bool)

(declare-fun mapDefault!41266 () ValueCell!12461)

(assert (=> b!1081511 (= condMapEmpty!41266 (= (arr!33454 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12461)) mapDefault!41266)))))

(assert (= (and start!95680 res!720908) b!1081502))

(assert (= (and b!1081502 res!720909) b!1081508))

(assert (= (and b!1081508 res!720906) b!1081501))

(assert (= (and b!1081501 res!720907) b!1081505))

(assert (= (and b!1081505 res!720912) b!1081506))

(assert (= (and b!1081506 res!720905) b!1081510))

(assert (= (and b!1081510 res!720911) b!1081507))

(assert (= (and b!1081507 res!720904) b!1081500))

(assert (= (and b!1081500 res!720910) b!1081504))

(assert (= (and b!1081511 condMapEmpty!41266) mapIsEmpty!41266))

(assert (= (and b!1081511 (not condMapEmpty!41266)) mapNonEmpty!41266))

(get-info :version)

(assert (= (and mapNonEmpty!41266 ((_ is ValueCellFull!12461) mapValue!41266)) b!1081509))

(assert (= (and b!1081511 ((_ is ValueCellFull!12461) mapDefault!41266)) b!1081503))

(assert (= start!95680 b!1081511))

(declare-fun b_lambda!16987 () Bool)

(assert (=> (not b_lambda!16987) (not b!1081504)))

(declare-fun t!32770 () Bool)

(declare-fun tb!7209 () Bool)

(assert (=> (and start!95680 (= defaultEntry!882 defaultEntry!882) t!32770) tb!7209))

(declare-fun result!14945 () Bool)

(assert (=> tb!7209 (= result!14945 tp_is_empty!26341)))

(assert (=> b!1081504 t!32770))

(declare-fun b_and!35329 () Bool)

(assert (= b_and!35327 (and (=> t!32770 result!14945) b_and!35329)))

(declare-fun m!998795 () Bool)

(assert (=> b!1081510 m!998795))

(declare-fun m!998797 () Bool)

(assert (=> mapNonEmpty!41266 m!998797))

(declare-fun m!998799 () Bool)

(assert (=> b!1081504 m!998799))

(declare-fun m!998801 () Bool)

(assert (=> b!1081504 m!998801))

(declare-fun m!998803 () Bool)

(assert (=> b!1081504 m!998803))

(declare-fun m!998805 () Bool)

(assert (=> b!1081504 m!998805))

(declare-fun m!998807 () Bool)

(assert (=> b!1081504 m!998807))

(declare-fun m!998809 () Bool)

(assert (=> b!1081504 m!998809))

(declare-fun m!998811 () Bool)

(assert (=> b!1081507 m!998811))

(declare-fun m!998813 () Bool)

(assert (=> b!1081507 m!998813))

(declare-fun m!998815 () Bool)

(assert (=> start!95680 m!998815))

(declare-fun m!998817 () Bool)

(assert (=> start!95680 m!998817))

(declare-fun m!998819 () Bool)

(assert (=> start!95680 m!998819))

(declare-fun m!998821 () Bool)

(assert (=> b!1081501 m!998821))

(declare-fun m!998823 () Bool)

(assert (=> b!1081508 m!998823))

(declare-fun m!998825 () Bool)

(assert (=> b!1081500 m!998825))

(declare-fun m!998827 () Bool)

(assert (=> b!1081506 m!998827))

(check-sat (not b!1081507) (not b_next!22339) (not b!1081508) tp_is_empty!26341 (not mapNonEmpty!41266) (not b!1081506) b_and!35329 (not b!1081504) (not b_lambda!16987) (not b!1081501) (not start!95680) (not b!1081500))
(check-sat b_and!35329 (not b_next!22339))
