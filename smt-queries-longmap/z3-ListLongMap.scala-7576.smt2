; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95778 () Bool)

(assert start!95778)

(declare-fun b_free!22431 () Bool)

(declare-fun b_next!22431 () Bool)

(assert (=> start!95778 (= b_free!22431 (not b_next!22431))))

(declare-fun tp!79142 () Bool)

(declare-fun b_and!35537 () Bool)

(assert (=> start!95778 (= tp!79142 b_and!35537)))

(declare-fun b!1083401 () Bool)

(declare-fun e!619060 () Bool)

(declare-fun e!619059 () Bool)

(assert (=> b!1083401 (= e!619060 e!619059)))

(declare-fun res!722215 () Bool)

(assert (=> b!1083401 (=> (not res!722215) (not e!619059))))

(declare-datatypes ((array!69809 0))(
  ( (array!69810 (arr!33578 (Array (_ BitVec 32) (_ BitVec 64))) (size!34114 (_ BitVec 32))) )
))
(declare-fun lt!480058 () array!69809)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69809 (_ BitVec 32)) Bool)

(assert (=> b!1083401 (= res!722215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480058 mask!1414))))

(declare-fun _keys!1070 () array!69809)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083401 (= lt!480058 (array!69810 (store (arr!33578 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34114 _keys!1070)))))

(declare-fun b!1083402 () Bool)

(declare-fun res!722219 () Bool)

(assert (=> b!1083402 (=> (not res!722219) (not e!619060))))

(declare-datatypes ((List!23406 0))(
  ( (Nil!23403) (Cons!23402 (h!24611 (_ BitVec 64)) (t!32895 List!23406)) )
))
(declare-fun arrayNoDuplicates!0 (array!69809 (_ BitVec 32) List!23406) Bool)

(assert (=> b!1083402 (= res!722219 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23403))))

(declare-fun b!1083403 () Bool)

(declare-fun res!722220 () Bool)

(assert (=> b!1083403 (=> (not res!722220) (not e!619060))))

(assert (=> b!1083403 (= res!722220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083404 () Bool)

(declare-fun res!722218 () Bool)

(assert (=> b!1083404 (=> (not res!722218) (not e!619060))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40371 0))(
  ( (V!40372 (val!13273 Int)) )
))
(declare-datatypes ((ValueCell!12507 0))(
  ( (ValueCellFull!12507 (v!15894 V!40371)) (EmptyCell!12507) )
))
(declare-datatypes ((array!69811 0))(
  ( (array!69812 (arr!33579 (Array (_ BitVec 32) ValueCell!12507)) (size!34115 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69811)

(assert (=> b!1083404 (= res!722218 (and (= (size!34115 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34114 _keys!1070) (size!34115 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41404 () Bool)

(declare-fun mapRes!41404 () Bool)

(declare-fun tp!79141 () Bool)

(declare-fun e!619061 () Bool)

(assert (=> mapNonEmpty!41404 (= mapRes!41404 (and tp!79141 e!619061))))

(declare-fun mapRest!41404 () (Array (_ BitVec 32) ValueCell!12507))

(declare-fun mapValue!41404 () ValueCell!12507)

(declare-fun mapKey!41404 () (_ BitVec 32))

(assert (=> mapNonEmpty!41404 (= (arr!33579 _values!874) (store mapRest!41404 mapKey!41404 mapValue!41404))))

(declare-fun res!722216 () Bool)

(assert (=> start!95778 (=> (not res!722216) (not e!619060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95778 (= res!722216 (validMask!0 mask!1414))))

(assert (=> start!95778 e!619060))

(assert (=> start!95778 tp!79142))

(assert (=> start!95778 true))

(declare-fun tp_is_empty!26433 () Bool)

(assert (=> start!95778 tp_is_empty!26433))

(declare-fun array_inv!25914 (array!69809) Bool)

(assert (=> start!95778 (array_inv!25914 _keys!1070)))

(declare-fun e!619058 () Bool)

(declare-fun array_inv!25915 (array!69811) Bool)

(assert (=> start!95778 (and (array_inv!25915 _values!874) e!619058)))

(declare-fun mapIsEmpty!41404 () Bool)

(assert (=> mapIsEmpty!41404 mapRes!41404))

(declare-fun b!1083405 () Bool)

(declare-fun res!722222 () Bool)

(assert (=> b!1083405 (=> (not res!722222) (not e!619059))))

(assert (=> b!1083405 (= res!722222 (arrayNoDuplicates!0 lt!480058 #b00000000000000000000000000000000 Nil!23403))))

(declare-fun b!1083406 () Bool)

(declare-fun res!722217 () Bool)

(assert (=> b!1083406 (=> (not res!722217) (not e!619060))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1083406 (= res!722217 (= (select (arr!33578 _keys!1070) i!650) k0!904))))

(declare-fun b!1083407 () Bool)

(declare-fun res!722223 () Bool)

(assert (=> b!1083407 (=> (not res!722223) (not e!619060))))

(assert (=> b!1083407 (= res!722223 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34114 _keys!1070))))))

(declare-fun b!1083408 () Bool)

(assert (=> b!1083408 (= e!619059 (not true))))

(declare-datatypes ((tuple2!16818 0))(
  ( (tuple2!16819 (_1!8420 (_ BitVec 64)) (_2!8420 V!40371)) )
))
(declare-datatypes ((List!23407 0))(
  ( (Nil!23404) (Cons!23403 (h!24612 tuple2!16818) (t!32896 List!23407)) )
))
(declare-datatypes ((ListLongMap!14787 0))(
  ( (ListLongMap!14788 (toList!7409 List!23407)) )
))
(declare-fun lt!480056 () ListLongMap!14787)

(declare-fun lt!480060 () ListLongMap!14787)

(assert (=> b!1083408 (and (= lt!480056 lt!480060) (= lt!480060 lt!480056))))

(declare-fun lt!480057 () ListLongMap!14787)

(declare-fun -!736 (ListLongMap!14787 (_ BitVec 64)) ListLongMap!14787)

(assert (=> b!1083408 (= lt!480060 (-!736 lt!480057 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40371)

(declare-datatypes ((Unit!35638 0))(
  ( (Unit!35639) )
))
(declare-fun lt!480061 () Unit!35638)

(declare-fun zeroValue!831 () V!40371)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!16 (array!69809 array!69811 (_ BitVec 32) (_ BitVec 32) V!40371 V!40371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35638)

(assert (=> b!1083408 (= lt!480061 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!16 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3957 (array!69809 array!69811 (_ BitVec 32) (_ BitVec 32) V!40371 V!40371 (_ BitVec 32) Int) ListLongMap!14787)

(declare-fun dynLambda!2094 (Int (_ BitVec 64)) V!40371)

(assert (=> b!1083408 (= lt!480056 (getCurrentListMapNoExtraKeys!3957 lt!480058 (array!69812 (store (arr!33579 _values!874) i!650 (ValueCellFull!12507 (dynLambda!2094 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34115 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1083408 (= lt!480057 (getCurrentListMapNoExtraKeys!3957 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083408 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480059 () Unit!35638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69809 (_ BitVec 64) (_ BitVec 32)) Unit!35638)

(assert (=> b!1083408 (= lt!480059 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083409 () Bool)

(declare-fun res!722221 () Bool)

(assert (=> b!1083409 (=> (not res!722221) (not e!619060))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083409 (= res!722221 (validKeyInArray!0 k0!904))))

(declare-fun b!1083410 () Bool)

(assert (=> b!1083410 (= e!619061 tp_is_empty!26433)))

(declare-fun b!1083411 () Bool)

(declare-fun e!619056 () Bool)

(assert (=> b!1083411 (= e!619056 tp_is_empty!26433)))

(declare-fun b!1083412 () Bool)

(assert (=> b!1083412 (= e!619058 (and e!619056 mapRes!41404))))

(declare-fun condMapEmpty!41404 () Bool)

(declare-fun mapDefault!41404 () ValueCell!12507)

(assert (=> b!1083412 (= condMapEmpty!41404 (= (arr!33579 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12507)) mapDefault!41404)))))

(assert (= (and start!95778 res!722216) b!1083404))

(assert (= (and b!1083404 res!722218) b!1083403))

(assert (= (and b!1083403 res!722220) b!1083402))

(assert (= (and b!1083402 res!722219) b!1083407))

(assert (= (and b!1083407 res!722223) b!1083409))

(assert (= (and b!1083409 res!722221) b!1083406))

(assert (= (and b!1083406 res!722217) b!1083401))

(assert (= (and b!1083401 res!722215) b!1083405))

(assert (= (and b!1083405 res!722222) b!1083408))

(assert (= (and b!1083412 condMapEmpty!41404) mapIsEmpty!41404))

(assert (= (and b!1083412 (not condMapEmpty!41404)) mapNonEmpty!41404))

(get-info :version)

(assert (= (and mapNonEmpty!41404 ((_ is ValueCellFull!12507) mapValue!41404)) b!1083410))

(assert (= (and b!1083412 ((_ is ValueCellFull!12507) mapDefault!41404)) b!1083411))

(assert (= start!95778 b!1083412))

(declare-fun b_lambda!17101 () Bool)

(assert (=> (not b_lambda!17101) (not b!1083408)))

(declare-fun t!32894 () Bool)

(declare-fun tb!7309 () Bool)

(assert (=> (and start!95778 (= defaultEntry!882 defaultEntry!882) t!32894) tb!7309))

(declare-fun result!15137 () Bool)

(assert (=> tb!7309 (= result!15137 tp_is_empty!26433)))

(assert (=> b!1083408 t!32894))

(declare-fun b_and!35539 () Bool)

(assert (= b_and!35537 (and (=> t!32894 result!15137) b_and!35539)))

(declare-fun m!1001073 () Bool)

(assert (=> b!1083409 m!1001073))

(declare-fun m!1001075 () Bool)

(assert (=> b!1083408 m!1001075))

(declare-fun m!1001077 () Bool)

(assert (=> b!1083408 m!1001077))

(declare-fun m!1001079 () Bool)

(assert (=> b!1083408 m!1001079))

(declare-fun m!1001081 () Bool)

(assert (=> b!1083408 m!1001081))

(declare-fun m!1001083 () Bool)

(assert (=> b!1083408 m!1001083))

(declare-fun m!1001085 () Bool)

(assert (=> b!1083408 m!1001085))

(declare-fun m!1001087 () Bool)

(assert (=> b!1083408 m!1001087))

(declare-fun m!1001089 () Bool)

(assert (=> b!1083408 m!1001089))

(declare-fun m!1001091 () Bool)

(assert (=> b!1083401 m!1001091))

(declare-fun m!1001093 () Bool)

(assert (=> b!1083401 m!1001093))

(declare-fun m!1001095 () Bool)

(assert (=> b!1083405 m!1001095))

(declare-fun m!1001097 () Bool)

(assert (=> b!1083403 m!1001097))

(declare-fun m!1001099 () Bool)

(assert (=> b!1083406 m!1001099))

(declare-fun m!1001101 () Bool)

(assert (=> mapNonEmpty!41404 m!1001101))

(declare-fun m!1001103 () Bool)

(assert (=> b!1083402 m!1001103))

(declare-fun m!1001105 () Bool)

(assert (=> start!95778 m!1001105))

(declare-fun m!1001107 () Bool)

(assert (=> start!95778 m!1001107))

(declare-fun m!1001109 () Bool)

(assert (=> start!95778 m!1001109))

(check-sat (not b!1083403) (not mapNonEmpty!41404) (not b!1083402) b_and!35539 (not b_next!22431) (not b!1083408) tp_is_empty!26433 (not b!1083401) (not b!1083405) (not b!1083409) (not start!95778) (not b_lambda!17101))
(check-sat b_and!35539 (not b_next!22431))
