; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96444 () Bool)

(assert start!96444)

(declare-fun b_free!23029 () Bool)

(declare-fun b_next!23029 () Bool)

(assert (=> start!96444 (= b_free!23029 (not b_next!23029))))

(declare-fun tp!81014 () Bool)

(declare-fun b_and!36695 () Bool)

(assert (=> start!96444 (= tp!81014 b_and!36695)))

(declare-fun b!1096483 () Bool)

(declare-fun e!625860 () Bool)

(declare-fun e!625863 () Bool)

(assert (=> b!1096483 (= e!625860 e!625863)))

(declare-fun res!731841 () Bool)

(assert (=> b!1096483 (=> (not res!731841) (not e!625863))))

(declare-datatypes ((array!70980 0))(
  ( (array!70981 (arr!34162 (Array (_ BitVec 32) (_ BitVec 64))) (size!34700 (_ BitVec 32))) )
))
(declare-fun lt!490011 () array!70980)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70980 (_ BitVec 32)) Bool)

(assert (=> b!1096483 (= res!731841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490011 mask!1414))))

(declare-fun _keys!1070 () array!70980)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096483 (= lt!490011 (array!70981 (store (arr!34162 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34700 _keys!1070)))))

(declare-fun b!1096484 () Bool)

(declare-fun e!625861 () Bool)

(declare-fun tp_is_empty!27079 () Bool)

(assert (=> b!1096484 (= e!625861 tp_is_empty!27079)))

(declare-fun mapNonEmpty!42379 () Bool)

(declare-fun mapRes!42379 () Bool)

(declare-fun tp!81013 () Bool)

(declare-fun e!625864 () Bool)

(assert (=> mapNonEmpty!42379 (= mapRes!42379 (and tp!81013 e!625864))))

(declare-datatypes ((V!41233 0))(
  ( (V!41234 (val!13596 Int)) )
))
(declare-datatypes ((ValueCell!12830 0))(
  ( (ValueCellFull!12830 (v!16216 V!41233)) (EmptyCell!12830) )
))
(declare-datatypes ((array!70982 0))(
  ( (array!70983 (arr!34163 (Array (_ BitVec 32) ValueCell!12830)) (size!34701 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70982)

(declare-fun mapKey!42379 () (_ BitVec 32))

(declare-fun mapRest!42379 () (Array (_ BitVec 32) ValueCell!12830))

(declare-fun mapValue!42379 () ValueCell!12830)

(assert (=> mapNonEmpty!42379 (= (arr!34163 _values!874) (store mapRest!42379 mapKey!42379 mapValue!42379))))

(declare-fun b!1096485 () Bool)

(assert (=> b!1096485 (= e!625863 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17326 0))(
  ( (tuple2!17327 (_1!8674 (_ BitVec 64)) (_2!8674 V!41233)) )
))
(declare-datatypes ((List!23918 0))(
  ( (Nil!23915) (Cons!23914 (h!25123 tuple2!17326) (t!33984 List!23918)) )
))
(declare-datatypes ((ListLongMap!15295 0))(
  ( (ListLongMap!15296 (toList!7663 List!23918)) )
))
(declare-fun lt!490013 () ListLongMap!15295)

(declare-fun zeroValue!831 () V!41233)

(declare-fun minValue!831 () V!41233)

(declare-fun getCurrentListMapNoExtraKeys!4196 (array!70980 array!70982 (_ BitVec 32) (_ BitVec 32) V!41233 V!41233 (_ BitVec 32) Int) ListLongMap!15295)

(declare-fun dynLambda!2265 (Int (_ BitVec 64)) V!41233)

(assert (=> b!1096485 (= lt!490013 (getCurrentListMapNoExtraKeys!4196 lt!490011 (array!70983 (store (arr!34163 _values!874) i!650 (ValueCellFull!12830 (dynLambda!2265 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34701 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490010 () ListLongMap!15295)

(assert (=> b!1096485 (= lt!490010 (getCurrentListMapNoExtraKeys!4196 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!70980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096485 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35913 0))(
  ( (Unit!35914) )
))
(declare-fun lt!490012 () Unit!35913)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70980 (_ BitVec 64) (_ BitVec 32)) Unit!35913)

(assert (=> b!1096485 (= lt!490012 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096486 () Bool)

(declare-fun res!731842 () Bool)

(assert (=> b!1096486 (=> (not res!731842) (not e!625860))))

(declare-datatypes ((List!23919 0))(
  ( (Nil!23916) (Cons!23915 (h!25124 (_ BitVec 64)) (t!33985 List!23919)) )
))
(declare-fun arrayNoDuplicates!0 (array!70980 (_ BitVec 32) List!23919) Bool)

(assert (=> b!1096486 (= res!731842 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23916))))

(declare-fun b!1096487 () Bool)

(assert (=> b!1096487 (= e!625864 tp_is_empty!27079)))

(declare-fun res!731840 () Bool)

(assert (=> start!96444 (=> (not res!731840) (not e!625860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96444 (= res!731840 (validMask!0 mask!1414))))

(assert (=> start!96444 e!625860))

(assert (=> start!96444 tp!81014))

(assert (=> start!96444 true))

(assert (=> start!96444 tp_is_empty!27079))

(declare-fun array_inv!26356 (array!70980) Bool)

(assert (=> start!96444 (array_inv!26356 _keys!1070)))

(declare-fun e!625859 () Bool)

(declare-fun array_inv!26357 (array!70982) Bool)

(assert (=> start!96444 (and (array_inv!26357 _values!874) e!625859)))

(declare-fun b!1096488 () Bool)

(declare-fun res!731844 () Bool)

(assert (=> b!1096488 (=> (not res!731844) (not e!625860))))

(assert (=> b!1096488 (= res!731844 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34700 _keys!1070))))))

(declare-fun mapIsEmpty!42379 () Bool)

(assert (=> mapIsEmpty!42379 mapRes!42379))

(declare-fun b!1096489 () Bool)

(declare-fun res!731846 () Bool)

(assert (=> b!1096489 (=> (not res!731846) (not e!625860))))

(assert (=> b!1096489 (= res!731846 (and (= (size!34701 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34700 _keys!1070) (size!34701 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096490 () Bool)

(declare-fun res!731847 () Bool)

(assert (=> b!1096490 (=> (not res!731847) (not e!625860))))

(assert (=> b!1096490 (= res!731847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096491 () Bool)

(declare-fun res!731848 () Bool)

(assert (=> b!1096491 (=> (not res!731848) (not e!625863))))

(assert (=> b!1096491 (= res!731848 (arrayNoDuplicates!0 lt!490011 #b00000000000000000000000000000000 Nil!23916))))

(declare-fun b!1096492 () Bool)

(declare-fun res!731843 () Bool)

(assert (=> b!1096492 (=> (not res!731843) (not e!625860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096492 (= res!731843 (validKeyInArray!0 k0!904))))

(declare-fun b!1096493 () Bool)

(declare-fun res!731845 () Bool)

(assert (=> b!1096493 (=> (not res!731845) (not e!625860))))

(assert (=> b!1096493 (= res!731845 (= (select (arr!34162 _keys!1070) i!650) k0!904))))

(declare-fun b!1096494 () Bool)

(assert (=> b!1096494 (= e!625859 (and e!625861 mapRes!42379))))

(declare-fun condMapEmpty!42379 () Bool)

(declare-fun mapDefault!42379 () ValueCell!12830)

(assert (=> b!1096494 (= condMapEmpty!42379 (= (arr!34163 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12830)) mapDefault!42379)))))

(assert (= (and start!96444 res!731840) b!1096489))

(assert (= (and b!1096489 res!731846) b!1096490))

(assert (= (and b!1096490 res!731847) b!1096486))

(assert (= (and b!1096486 res!731842) b!1096488))

(assert (= (and b!1096488 res!731844) b!1096492))

(assert (= (and b!1096492 res!731843) b!1096493))

(assert (= (and b!1096493 res!731845) b!1096483))

(assert (= (and b!1096483 res!731841) b!1096491))

(assert (= (and b!1096491 res!731848) b!1096485))

(assert (= (and b!1096494 condMapEmpty!42379) mapIsEmpty!42379))

(assert (= (and b!1096494 (not condMapEmpty!42379)) mapNonEmpty!42379))

(get-info :version)

(assert (= (and mapNonEmpty!42379 ((_ is ValueCellFull!12830) mapValue!42379)) b!1096487))

(assert (= (and b!1096494 ((_ is ValueCellFull!12830) mapDefault!42379)) b!1096484))

(assert (= start!96444 b!1096494))

(declare-fun b_lambda!17665 () Bool)

(assert (=> (not b_lambda!17665) (not b!1096485)))

(declare-fun t!33983 () Bool)

(declare-fun tb!7887 () Bool)

(assert (=> (and start!96444 (= defaultEntry!882 defaultEntry!882) t!33983) tb!7887))

(declare-fun result!16305 () Bool)

(assert (=> tb!7887 (= result!16305 tp_is_empty!27079)))

(assert (=> b!1096485 t!33983))

(declare-fun b_and!36697 () Bool)

(assert (= b_and!36695 (and (=> t!33983 result!16305) b_and!36697)))

(declare-fun m!1015521 () Bool)

(assert (=> b!1096483 m!1015521))

(declare-fun m!1015523 () Bool)

(assert (=> b!1096483 m!1015523))

(declare-fun m!1015525 () Bool)

(assert (=> b!1096493 m!1015525))

(declare-fun m!1015527 () Bool)

(assert (=> start!96444 m!1015527))

(declare-fun m!1015529 () Bool)

(assert (=> start!96444 m!1015529))

(declare-fun m!1015531 () Bool)

(assert (=> start!96444 m!1015531))

(declare-fun m!1015533 () Bool)

(assert (=> mapNonEmpty!42379 m!1015533))

(declare-fun m!1015535 () Bool)

(assert (=> b!1096492 m!1015535))

(declare-fun m!1015537 () Bool)

(assert (=> b!1096490 m!1015537))

(declare-fun m!1015539 () Bool)

(assert (=> b!1096486 m!1015539))

(declare-fun m!1015541 () Bool)

(assert (=> b!1096485 m!1015541))

(declare-fun m!1015543 () Bool)

(assert (=> b!1096485 m!1015543))

(declare-fun m!1015545 () Bool)

(assert (=> b!1096485 m!1015545))

(declare-fun m!1015547 () Bool)

(assert (=> b!1096485 m!1015547))

(declare-fun m!1015549 () Bool)

(assert (=> b!1096485 m!1015549))

(declare-fun m!1015551 () Bool)

(assert (=> b!1096485 m!1015551))

(declare-fun m!1015553 () Bool)

(assert (=> b!1096491 m!1015553))

(check-sat tp_is_empty!27079 (not mapNonEmpty!42379) (not b!1096485) b_and!36697 (not start!96444) (not b!1096492) (not b_lambda!17665) (not b!1096486) (not b_next!23029) (not b!1096490) (not b!1096483) (not b!1096491))
(check-sat b_and!36697 (not b_next!23029))
