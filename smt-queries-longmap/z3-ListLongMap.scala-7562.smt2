; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95686 () Bool)

(assert start!95686)

(declare-fun b_free!22345 () Bool)

(declare-fun b_next!22345 () Bool)

(assert (=> start!95686 (= b_free!22345 (not b_next!22345))))

(declare-fun tp!78884 () Bool)

(declare-fun b_and!35339 () Bool)

(assert (=> start!95686 (= tp!78884 b_and!35339)))

(declare-fun b!1081614 () Bool)

(declare-fun e!618191 () Bool)

(assert (=> b!1081614 (= e!618191 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40257 0))(
  ( (V!40258 (val!13230 Int)) )
))
(declare-datatypes ((ValueCell!12464 0))(
  ( (ValueCellFull!12464 (v!15850 V!40257)) (EmptyCell!12464) )
))
(declare-datatypes ((array!69568 0))(
  ( (array!69569 (arr!33458 (Array (_ BitVec 32) ValueCell!12464)) (size!33996 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69568)

(declare-fun minValue!831 () V!40257)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69570 0))(
  ( (array!69571 (arr!33459 (Array (_ BitVec 32) (_ BitVec 64))) (size!33997 (_ BitVec 32))) )
))
(declare-fun lt!479207 () array!69570)

(declare-fun zeroValue!831 () V!40257)

(declare-datatypes ((tuple2!16822 0))(
  ( (tuple2!16823 (_1!8422 (_ BitVec 64)) (_2!8422 V!40257)) )
))
(declare-datatypes ((List!23385 0))(
  ( (Nil!23382) (Cons!23381 (h!24590 tuple2!16822) (t!32779 List!23385)) )
))
(declare-datatypes ((ListLongMap!14791 0))(
  ( (ListLongMap!14792 (toList!7411 List!23385)) )
))
(declare-fun lt!479204 () ListLongMap!14791)

(declare-fun getCurrentListMapNoExtraKeys!3974 (array!69570 array!69568 (_ BitVec 32) (_ BitVec 32) V!40257 V!40257 (_ BitVec 32) Int) ListLongMap!14791)

(declare-fun dynLambda!2045 (Int (_ BitVec 64)) V!40257)

(assert (=> b!1081614 (= lt!479204 (getCurrentListMapNoExtraKeys!3974 lt!479207 (array!69569 (store (arr!33458 _values!874) i!650 (ValueCellFull!12464 (dynLambda!2045 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!33996 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun _keys!1070 () array!69570)

(declare-fun lt!479205 () ListLongMap!14791)

(assert (=> b!1081614 (= lt!479205 (getCurrentListMapNoExtraKeys!3974 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081614 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35415 0))(
  ( (Unit!35416) )
))
(declare-fun lt!479206 () Unit!35415)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69570 (_ BitVec 64) (_ BitVec 32)) Unit!35415)

(assert (=> b!1081614 (= lt!479206 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081615 () Bool)

(declare-fun res!720987 () Bool)

(declare-fun e!618194 () Bool)

(assert (=> b!1081615 (=> (not res!720987) (not e!618194))))

(assert (=> b!1081615 (= res!720987 (and (= (size!33996 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33997 _keys!1070) (size!33996 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081616 () Bool)

(declare-fun res!720992 () Bool)

(assert (=> b!1081616 (=> (not res!720992) (not e!618194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69570 (_ BitVec 32)) Bool)

(assert (=> b!1081616 (= res!720992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!720990 () Bool)

(assert (=> start!95686 (=> (not res!720990) (not e!618194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95686 (= res!720990 (validMask!0 mask!1414))))

(assert (=> start!95686 e!618194))

(assert (=> start!95686 tp!78884))

(assert (=> start!95686 true))

(declare-fun tp_is_empty!26347 () Bool)

(assert (=> start!95686 tp_is_empty!26347))

(declare-fun array_inv!25862 (array!69570) Bool)

(assert (=> start!95686 (array_inv!25862 _keys!1070)))

(declare-fun e!618193 () Bool)

(declare-fun array_inv!25863 (array!69568) Bool)

(assert (=> start!95686 (and (array_inv!25863 _values!874) e!618193)))

(declare-fun b!1081617 () Bool)

(declare-fun e!618190 () Bool)

(assert (=> b!1081617 (= e!618190 tp_is_empty!26347)))

(declare-fun b!1081618 () Bool)

(declare-fun res!720993 () Bool)

(assert (=> b!1081618 (=> (not res!720993) (not e!618194))))

(assert (=> b!1081618 (= res!720993 (= (select (arr!33459 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41275 () Bool)

(declare-fun mapRes!41275 () Bool)

(declare-fun tp!78883 () Bool)

(assert (=> mapNonEmpty!41275 (= mapRes!41275 (and tp!78883 e!618190))))

(declare-fun mapRest!41275 () (Array (_ BitVec 32) ValueCell!12464))

(declare-fun mapValue!41275 () ValueCell!12464)

(declare-fun mapKey!41275 () (_ BitVec 32))

(assert (=> mapNonEmpty!41275 (= (arr!33458 _values!874) (store mapRest!41275 mapKey!41275 mapValue!41275))))

(declare-fun b!1081619 () Bool)

(declare-fun res!720988 () Bool)

(assert (=> b!1081619 (=> (not res!720988) (not e!618191))))

(declare-datatypes ((List!23386 0))(
  ( (Nil!23383) (Cons!23382 (h!24591 (_ BitVec 64)) (t!32780 List!23386)) )
))
(declare-fun arrayNoDuplicates!0 (array!69570 (_ BitVec 32) List!23386) Bool)

(assert (=> b!1081619 (= res!720988 (arrayNoDuplicates!0 lt!479207 #b00000000000000000000000000000000 Nil!23383))))

(declare-fun mapIsEmpty!41275 () Bool)

(assert (=> mapIsEmpty!41275 mapRes!41275))

(declare-fun b!1081620 () Bool)

(declare-fun res!720991 () Bool)

(assert (=> b!1081620 (=> (not res!720991) (not e!618194))))

(assert (=> b!1081620 (= res!720991 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33997 _keys!1070))))))

(declare-fun b!1081621 () Bool)

(assert (=> b!1081621 (= e!618194 e!618191)))

(declare-fun res!720989 () Bool)

(assert (=> b!1081621 (=> (not res!720989) (not e!618191))))

(assert (=> b!1081621 (= res!720989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479207 mask!1414))))

(assert (=> b!1081621 (= lt!479207 (array!69571 (store (arr!33459 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33997 _keys!1070)))))

(declare-fun b!1081622 () Bool)

(declare-fun res!720985 () Bool)

(assert (=> b!1081622 (=> (not res!720985) (not e!618194))))

(assert (=> b!1081622 (= res!720985 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23383))))

(declare-fun b!1081623 () Bool)

(declare-fun e!618189 () Bool)

(assert (=> b!1081623 (= e!618193 (and e!618189 mapRes!41275))))

(declare-fun condMapEmpty!41275 () Bool)

(declare-fun mapDefault!41275 () ValueCell!12464)

(assert (=> b!1081623 (= condMapEmpty!41275 (= (arr!33458 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12464)) mapDefault!41275)))))

(declare-fun b!1081624 () Bool)

(declare-fun res!720986 () Bool)

(assert (=> b!1081624 (=> (not res!720986) (not e!618194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081624 (= res!720986 (validKeyInArray!0 k0!904))))

(declare-fun b!1081625 () Bool)

(assert (=> b!1081625 (= e!618189 tp_is_empty!26347)))

(assert (= (and start!95686 res!720990) b!1081615))

(assert (= (and b!1081615 res!720987) b!1081616))

(assert (= (and b!1081616 res!720992) b!1081622))

(assert (= (and b!1081622 res!720985) b!1081620))

(assert (= (and b!1081620 res!720991) b!1081624))

(assert (= (and b!1081624 res!720986) b!1081618))

(assert (= (and b!1081618 res!720993) b!1081621))

(assert (= (and b!1081621 res!720989) b!1081619))

(assert (= (and b!1081619 res!720988) b!1081614))

(assert (= (and b!1081623 condMapEmpty!41275) mapIsEmpty!41275))

(assert (= (and b!1081623 (not condMapEmpty!41275)) mapNonEmpty!41275))

(get-info :version)

(assert (= (and mapNonEmpty!41275 ((_ is ValueCellFull!12464) mapValue!41275)) b!1081617))

(assert (= (and b!1081623 ((_ is ValueCellFull!12464) mapDefault!41275)) b!1081625))

(assert (= start!95686 b!1081623))

(declare-fun b_lambda!16993 () Bool)

(assert (=> (not b_lambda!16993) (not b!1081614)))

(declare-fun t!32778 () Bool)

(declare-fun tb!7215 () Bool)

(assert (=> (and start!95686 (= defaultEntry!882 defaultEntry!882) t!32778) tb!7215))

(declare-fun result!14957 () Bool)

(assert (=> tb!7215 (= result!14957 tp_is_empty!26347)))

(assert (=> b!1081614 t!32778))

(declare-fun b_and!35341 () Bool)

(assert (= b_and!35339 (and (=> t!32778 result!14957) b_and!35341)))

(declare-fun m!998897 () Bool)

(assert (=> b!1081618 m!998897))

(declare-fun m!998899 () Bool)

(assert (=> b!1081621 m!998899))

(declare-fun m!998901 () Bool)

(assert (=> b!1081621 m!998901))

(declare-fun m!998903 () Bool)

(assert (=> start!95686 m!998903))

(declare-fun m!998905 () Bool)

(assert (=> start!95686 m!998905))

(declare-fun m!998907 () Bool)

(assert (=> start!95686 m!998907))

(declare-fun m!998909 () Bool)

(assert (=> mapNonEmpty!41275 m!998909))

(declare-fun m!998911 () Bool)

(assert (=> b!1081616 m!998911))

(declare-fun m!998913 () Bool)

(assert (=> b!1081624 m!998913))

(declare-fun m!998915 () Bool)

(assert (=> b!1081622 m!998915))

(declare-fun m!998917 () Bool)

(assert (=> b!1081619 m!998917))

(declare-fun m!998919 () Bool)

(assert (=> b!1081614 m!998919))

(declare-fun m!998921 () Bool)

(assert (=> b!1081614 m!998921))

(declare-fun m!998923 () Bool)

(assert (=> b!1081614 m!998923))

(declare-fun m!998925 () Bool)

(assert (=> b!1081614 m!998925))

(declare-fun m!998927 () Bool)

(assert (=> b!1081614 m!998927))

(declare-fun m!998929 () Bool)

(assert (=> b!1081614 m!998929))

(check-sat (not start!95686) (not b_next!22345) (not b!1081624) (not b!1081621) (not b!1081619) b_and!35341 (not b_lambda!16993) (not b!1081622) (not mapNonEmpty!41275) (not b!1081616) tp_is_empty!26347 (not b!1081614))
(check-sat b_and!35341 (not b_next!22345))
