; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95662 () Bool)

(assert start!95662)

(declare-fun b_free!22321 () Bool)

(declare-fun b_next!22321 () Bool)

(assert (=> start!95662 (= b_free!22321 (not b_next!22321))))

(declare-fun tp!78811 () Bool)

(declare-fun b_and!35291 () Bool)

(assert (=> start!95662 (= tp!78811 b_and!35291)))

(declare-fun b!1081158 () Bool)

(declare-fun res!720662 () Bool)

(declare-fun e!617975 () Bool)

(assert (=> b!1081158 (=> (not res!720662) (not e!617975))))

(declare-datatypes ((array!69526 0))(
  ( (array!69527 (arr!33437 (Array (_ BitVec 32) (_ BitVec 64))) (size!33975 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69526)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081158 (= res!720662 (= (select (arr!33437 _keys!1070) i!650) k0!904))))

(declare-fun b!1081159 () Bool)

(declare-fun e!617976 () Bool)

(assert (=> b!1081159 (= e!617976 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40225 0))(
  ( (V!40226 (val!13218 Int)) )
))
(declare-datatypes ((ValueCell!12452 0))(
  ( (ValueCellFull!12452 (v!15838 V!40225)) (EmptyCell!12452) )
))
(declare-datatypes ((array!69528 0))(
  ( (array!69529 (arr!33438 (Array (_ BitVec 32) ValueCell!12452)) (size!33976 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69528)

(declare-fun minValue!831 () V!40225)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!479063 () array!69526)

(declare-fun zeroValue!831 () V!40225)

(declare-datatypes ((tuple2!16810 0))(
  ( (tuple2!16811 (_1!8416 (_ BitVec 64)) (_2!8416 V!40225)) )
))
(declare-datatypes ((List!23373 0))(
  ( (Nil!23370) (Cons!23369 (h!24578 tuple2!16810) (t!32743 List!23373)) )
))
(declare-datatypes ((ListLongMap!14779 0))(
  ( (ListLongMap!14780 (toList!7405 List!23373)) )
))
(declare-fun lt!479061 () ListLongMap!14779)

(declare-fun getCurrentListMapNoExtraKeys!3968 (array!69526 array!69528 (_ BitVec 32) (_ BitVec 32) V!40225 V!40225 (_ BitVec 32) Int) ListLongMap!14779)

(declare-fun dynLambda!2039 (Int (_ BitVec 64)) V!40225)

(assert (=> b!1081159 (= lt!479061 (getCurrentListMapNoExtraKeys!3968 lt!479063 (array!69529 (store (arr!33438 _values!874) i!650 (ValueCellFull!12452 (dynLambda!2039 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!33976 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479062 () ListLongMap!14779)

(assert (=> b!1081159 (= lt!479062 (getCurrentListMapNoExtraKeys!3968 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081159 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35403 0))(
  ( (Unit!35404) )
))
(declare-fun lt!479060 () Unit!35403)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69526 (_ BitVec 64) (_ BitVec 32)) Unit!35403)

(assert (=> b!1081159 (= lt!479060 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081160 () Bool)

(assert (=> b!1081160 (= e!617975 e!617976)))

(declare-fun res!720669 () Bool)

(assert (=> b!1081160 (=> (not res!720669) (not e!617976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69526 (_ BitVec 32)) Bool)

(assert (=> b!1081160 (= res!720669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479063 mask!1414))))

(assert (=> b!1081160 (= lt!479063 (array!69527 (store (arr!33437 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33975 _keys!1070)))))

(declare-fun res!720668 () Bool)

(assert (=> start!95662 (=> (not res!720668) (not e!617975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95662 (= res!720668 (validMask!0 mask!1414))))

(assert (=> start!95662 e!617975))

(assert (=> start!95662 tp!78811))

(assert (=> start!95662 true))

(declare-fun tp_is_empty!26323 () Bool)

(assert (=> start!95662 tp_is_empty!26323))

(declare-fun array_inv!25848 (array!69526) Bool)

(assert (=> start!95662 (array_inv!25848 _keys!1070)))

(declare-fun e!617974 () Bool)

(declare-fun array_inv!25849 (array!69528) Bool)

(assert (=> start!95662 (and (array_inv!25849 _values!874) e!617974)))

(declare-fun b!1081161 () Bool)

(declare-fun e!617978 () Bool)

(assert (=> b!1081161 (= e!617978 tp_is_empty!26323)))

(declare-fun b!1081162 () Bool)

(declare-fun res!720663 () Bool)

(assert (=> b!1081162 (=> (not res!720663) (not e!617975))))

(assert (=> b!1081162 (= res!720663 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33975 _keys!1070))))))

(declare-fun b!1081163 () Bool)

(declare-fun mapRes!41239 () Bool)

(assert (=> b!1081163 (= e!617974 (and e!617978 mapRes!41239))))

(declare-fun condMapEmpty!41239 () Bool)

(declare-fun mapDefault!41239 () ValueCell!12452)

(assert (=> b!1081163 (= condMapEmpty!41239 (= (arr!33438 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12452)) mapDefault!41239)))))

(declare-fun b!1081164 () Bool)

(declare-fun res!720664 () Bool)

(assert (=> b!1081164 (=> (not res!720664) (not e!617975))))

(declare-datatypes ((List!23374 0))(
  ( (Nil!23371) (Cons!23370 (h!24579 (_ BitVec 64)) (t!32744 List!23374)) )
))
(declare-fun arrayNoDuplicates!0 (array!69526 (_ BitVec 32) List!23374) Bool)

(assert (=> b!1081164 (= res!720664 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23371))))

(declare-fun mapIsEmpty!41239 () Bool)

(assert (=> mapIsEmpty!41239 mapRes!41239))

(declare-fun b!1081165 () Bool)

(declare-fun res!720666 () Bool)

(assert (=> b!1081165 (=> (not res!720666) (not e!617976))))

(assert (=> b!1081165 (= res!720666 (arrayNoDuplicates!0 lt!479063 #b00000000000000000000000000000000 Nil!23371))))

(declare-fun b!1081166 () Bool)

(declare-fun res!720661 () Bool)

(assert (=> b!1081166 (=> (not res!720661) (not e!617975))))

(assert (=> b!1081166 (= res!720661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41239 () Bool)

(declare-fun tp!78812 () Bool)

(declare-fun e!617977 () Bool)

(assert (=> mapNonEmpty!41239 (= mapRes!41239 (and tp!78812 e!617977))))

(declare-fun mapKey!41239 () (_ BitVec 32))

(declare-fun mapRest!41239 () (Array (_ BitVec 32) ValueCell!12452))

(declare-fun mapValue!41239 () ValueCell!12452)

(assert (=> mapNonEmpty!41239 (= (arr!33438 _values!874) (store mapRest!41239 mapKey!41239 mapValue!41239))))

(declare-fun b!1081167 () Bool)

(declare-fun res!720665 () Bool)

(assert (=> b!1081167 (=> (not res!720665) (not e!617975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081167 (= res!720665 (validKeyInArray!0 k0!904))))

(declare-fun b!1081168 () Bool)

(assert (=> b!1081168 (= e!617977 tp_is_empty!26323)))

(declare-fun b!1081169 () Bool)

(declare-fun res!720667 () Bool)

(assert (=> b!1081169 (=> (not res!720667) (not e!617975))))

(assert (=> b!1081169 (= res!720667 (and (= (size!33976 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33975 _keys!1070) (size!33976 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95662 res!720668) b!1081169))

(assert (= (and b!1081169 res!720667) b!1081166))

(assert (= (and b!1081166 res!720661) b!1081164))

(assert (= (and b!1081164 res!720664) b!1081162))

(assert (= (and b!1081162 res!720663) b!1081167))

(assert (= (and b!1081167 res!720665) b!1081158))

(assert (= (and b!1081158 res!720662) b!1081160))

(assert (= (and b!1081160 res!720669) b!1081165))

(assert (= (and b!1081165 res!720666) b!1081159))

(assert (= (and b!1081163 condMapEmpty!41239) mapIsEmpty!41239))

(assert (= (and b!1081163 (not condMapEmpty!41239)) mapNonEmpty!41239))

(get-info :version)

(assert (= (and mapNonEmpty!41239 ((_ is ValueCellFull!12452) mapValue!41239)) b!1081168))

(assert (= (and b!1081163 ((_ is ValueCellFull!12452) mapDefault!41239)) b!1081161))

(assert (= start!95662 b!1081163))

(declare-fun b_lambda!16969 () Bool)

(assert (=> (not b_lambda!16969) (not b!1081159)))

(declare-fun t!32742 () Bool)

(declare-fun tb!7191 () Bool)

(assert (=> (and start!95662 (= defaultEntry!882 defaultEntry!882) t!32742) tb!7191))

(declare-fun result!14909 () Bool)

(assert (=> tb!7191 (= result!14909 tp_is_empty!26323)))

(assert (=> b!1081159 t!32742))

(declare-fun b_and!35293 () Bool)

(assert (= b_and!35291 (and (=> t!32742 result!14909) b_and!35293)))

(declare-fun m!998489 () Bool)

(assert (=> mapNonEmpty!41239 m!998489))

(declare-fun m!998491 () Bool)

(assert (=> b!1081158 m!998491))

(declare-fun m!998493 () Bool)

(assert (=> b!1081165 m!998493))

(declare-fun m!998495 () Bool)

(assert (=> b!1081167 m!998495))

(declare-fun m!998497 () Bool)

(assert (=> start!95662 m!998497))

(declare-fun m!998499 () Bool)

(assert (=> start!95662 m!998499))

(declare-fun m!998501 () Bool)

(assert (=> start!95662 m!998501))

(declare-fun m!998503 () Bool)

(assert (=> b!1081164 m!998503))

(declare-fun m!998505 () Bool)

(assert (=> b!1081159 m!998505))

(declare-fun m!998507 () Bool)

(assert (=> b!1081159 m!998507))

(declare-fun m!998509 () Bool)

(assert (=> b!1081159 m!998509))

(declare-fun m!998511 () Bool)

(assert (=> b!1081159 m!998511))

(declare-fun m!998513 () Bool)

(assert (=> b!1081159 m!998513))

(declare-fun m!998515 () Bool)

(assert (=> b!1081159 m!998515))

(declare-fun m!998517 () Bool)

(assert (=> b!1081160 m!998517))

(declare-fun m!998519 () Bool)

(assert (=> b!1081160 m!998519))

(declare-fun m!998521 () Bool)

(assert (=> b!1081166 m!998521))

(check-sat (not b!1081160) (not b!1081164) (not b!1081166) tp_is_empty!26323 (not b_lambda!16969) (not b_next!22321) (not b!1081165) b_and!35293 (not b!1081167) (not mapNonEmpty!41239) (not b!1081159) (not start!95662))
(check-sat b_and!35293 (not b_next!22321))
