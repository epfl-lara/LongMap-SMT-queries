; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96324 () Bool)

(assert start!96324)

(declare-fun b_free!22741 () Bool)

(declare-fun b_next!22741 () Bool)

(assert (=> start!96324 (= b_free!22741 (not b_next!22741))))

(declare-fun tp!80072 () Bool)

(declare-fun b_and!36167 () Bool)

(assert (=> start!96324 (= tp!80072 b_and!36167)))

(declare-fun b!1091378 () Bool)

(declare-fun res!727692 () Bool)

(declare-fun e!623441 () Bool)

(assert (=> b!1091378 (=> (not res!727692) (not e!623441))))

(declare-datatypes ((array!70445 0))(
  ( (array!70446 (arr!33890 (Array (_ BitVec 32) (_ BitVec 64))) (size!34427 (_ BitVec 32))) )
))
(declare-fun lt!486716 () array!70445)

(declare-datatypes ((List!23667 0))(
  ( (Nil!23664) (Cons!23663 (h!24881 (_ BitVec 64)) (t!33458 List!23667)) )
))
(declare-fun arrayNoDuplicates!0 (array!70445 (_ BitVec 32) List!23667) Bool)

(assert (=> b!1091378 (= res!727692 (arrayNoDuplicates!0 lt!486716 #b00000000000000000000000000000000 Nil!23664))))

(declare-fun b!1091379 () Bool)

(declare-fun e!623438 () Bool)

(assert (=> b!1091379 (= e!623441 (not e!623438))))

(declare-fun res!727685 () Bool)

(assert (=> b!1091379 (=> res!727685 e!623438)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091379 (= res!727685 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!40785 0))(
  ( (V!40786 (val!13428 Int)) )
))
(declare-datatypes ((tuple2!17076 0))(
  ( (tuple2!17077 (_1!8549 (_ BitVec 64)) (_2!8549 V!40785)) )
))
(declare-datatypes ((List!23668 0))(
  ( (Nil!23665) (Cons!23664 (h!24882 tuple2!17076) (t!33459 List!23668)) )
))
(declare-datatypes ((ListLongMap!15053 0))(
  ( (ListLongMap!15054 (toList!7542 List!23668)) )
))
(declare-fun lt!486711 () ListLongMap!15053)

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40785)

(declare-fun _keys!1070 () array!70445)

(declare-datatypes ((ValueCell!12662 0))(
  ( (ValueCellFull!12662 (v!16045 V!40785)) (EmptyCell!12662) )
))
(declare-datatypes ((array!70447 0))(
  ( (array!70448 (arr!33891 (Array (_ BitVec 32) ValueCell!12662)) (size!34428 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70447)

(declare-fun minValue!831 () V!40785)

(declare-fun getCurrentListMap!4295 (array!70445 array!70447 (_ BitVec 32) (_ BitVec 32) V!40785 V!40785 (_ BitVec 32) Int) ListLongMap!15053)

(assert (=> b!1091379 (= lt!486711 (getCurrentListMap!4295 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486717 () ListLongMap!15053)

(declare-fun lt!486713 () array!70447)

(assert (=> b!1091379 (= lt!486717 (getCurrentListMap!4295 lt!486716 lt!486713 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486712 () ListLongMap!15053)

(declare-fun lt!486709 () ListLongMap!15053)

(assert (=> b!1091379 (and (= lt!486712 lt!486709) (= lt!486709 lt!486712))))

(declare-fun lt!486707 () ListLongMap!15053)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!849 (ListLongMap!15053 (_ BitVec 64)) ListLongMap!15053)

(assert (=> b!1091379 (= lt!486709 (-!849 lt!486707 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35865 0))(
  ( (Unit!35866) )
))
(declare-fun lt!486710 () Unit!35865)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!124 (array!70445 array!70447 (_ BitVec 32) (_ BitVec 32) V!40785 V!40785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35865)

(assert (=> b!1091379 (= lt!486710 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!124 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4100 (array!70445 array!70447 (_ BitVec 32) (_ BitVec 32) V!40785 V!40785 (_ BitVec 32) Int) ListLongMap!15053)

(assert (=> b!1091379 (= lt!486712 (getCurrentListMapNoExtraKeys!4100 lt!486716 lt!486713 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2221 (Int (_ BitVec 64)) V!40785)

(assert (=> b!1091379 (= lt!486713 (array!70448 (store (arr!33891 _values!874) i!650 (ValueCellFull!12662 (dynLambda!2221 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34428 _values!874)))))

(assert (=> b!1091379 (= lt!486707 (getCurrentListMapNoExtraKeys!4100 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091379 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486708 () Unit!35865)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70445 (_ BitVec 64) (_ BitVec 32)) Unit!35865)

(assert (=> b!1091379 (= lt!486708 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1091380 () Bool)

(declare-fun res!727686 () Bool)

(declare-fun e!623440 () Bool)

(assert (=> b!1091380 (=> (not res!727686) (not e!623440))))

(assert (=> b!1091380 (= res!727686 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34427 _keys!1070))))))

(declare-fun b!1091381 () Bool)

(declare-fun res!727683 () Bool)

(assert (=> b!1091381 (=> (not res!727683) (not e!623440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70445 (_ BitVec 32)) Bool)

(assert (=> b!1091381 (= res!727683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41869 () Bool)

(declare-fun mapRes!41869 () Bool)

(assert (=> mapIsEmpty!41869 mapRes!41869))

(declare-fun b!1091382 () Bool)

(declare-fun e!623435 () Bool)

(declare-fun tp_is_empty!26743 () Bool)

(assert (=> b!1091382 (= e!623435 tp_is_empty!26743)))

(declare-fun b!1091383 () Bool)

(declare-fun res!727688 () Bool)

(assert (=> b!1091383 (=> (not res!727688) (not e!623440))))

(assert (=> b!1091383 (= res!727688 (and (= (size!34428 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34427 _keys!1070) (size!34428 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!727687 () Bool)

(assert (=> start!96324 (=> (not res!727687) (not e!623440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96324 (= res!727687 (validMask!0 mask!1414))))

(assert (=> start!96324 e!623440))

(assert (=> start!96324 tp!80072))

(assert (=> start!96324 true))

(assert (=> start!96324 tp_is_empty!26743))

(declare-fun array_inv!26188 (array!70445) Bool)

(assert (=> start!96324 (array_inv!26188 _keys!1070)))

(declare-fun e!623439 () Bool)

(declare-fun array_inv!26189 (array!70447) Bool)

(assert (=> start!96324 (and (array_inv!26189 _values!874) e!623439)))

(declare-fun b!1091384 () Bool)

(declare-fun res!727684 () Bool)

(assert (=> b!1091384 (=> (not res!727684) (not e!623440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091384 (= res!727684 (validKeyInArray!0 k0!904))))

(declare-fun b!1091385 () Bool)

(declare-fun e!623434 () Bool)

(assert (=> b!1091385 (= e!623434 true)))

(declare-fun lt!486706 () ListLongMap!15053)

(declare-fun lt!486714 () ListLongMap!15053)

(assert (=> b!1091385 (= (-!849 lt!486706 k0!904) lt!486714)))

(declare-fun lt!486715 () Unit!35865)

(declare-fun addRemoveCommutativeForDiffKeys!85 (ListLongMap!15053 (_ BitVec 64) V!40785 (_ BitVec 64)) Unit!35865)

(assert (=> b!1091385 (= lt!486715 (addRemoveCommutativeForDiffKeys!85 lt!486707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapNonEmpty!41869 () Bool)

(declare-fun tp!80071 () Bool)

(assert (=> mapNonEmpty!41869 (= mapRes!41869 (and tp!80071 e!623435))))

(declare-fun mapRest!41869 () (Array (_ BitVec 32) ValueCell!12662))

(declare-fun mapValue!41869 () ValueCell!12662)

(declare-fun mapKey!41869 () (_ BitVec 32))

(assert (=> mapNonEmpty!41869 (= (arr!33891 _values!874) (store mapRest!41869 mapKey!41869 mapValue!41869))))

(declare-fun b!1091386 () Bool)

(assert (=> b!1091386 (= e!623440 e!623441)))

(declare-fun res!727689 () Bool)

(assert (=> b!1091386 (=> (not res!727689) (not e!623441))))

(assert (=> b!1091386 (= res!727689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486716 mask!1414))))

(assert (=> b!1091386 (= lt!486716 (array!70446 (store (arr!33890 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34427 _keys!1070)))))

(declare-fun b!1091387 () Bool)

(declare-fun res!727691 () Bool)

(assert (=> b!1091387 (=> (not res!727691) (not e!623440))))

(assert (=> b!1091387 (= res!727691 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23664))))

(declare-fun b!1091388 () Bool)

(declare-fun res!727690 () Bool)

(assert (=> b!1091388 (=> (not res!727690) (not e!623440))))

(assert (=> b!1091388 (= res!727690 (= (select (arr!33890 _keys!1070) i!650) k0!904))))

(declare-fun b!1091389 () Bool)

(declare-fun e!623436 () Bool)

(assert (=> b!1091389 (= e!623439 (and e!623436 mapRes!41869))))

(declare-fun condMapEmpty!41869 () Bool)

(declare-fun mapDefault!41869 () ValueCell!12662)

(assert (=> b!1091389 (= condMapEmpty!41869 (= (arr!33891 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12662)) mapDefault!41869)))))

(declare-fun b!1091390 () Bool)

(assert (=> b!1091390 (= e!623438 e!623434)))

(declare-fun res!727682 () Bool)

(assert (=> b!1091390 (=> res!727682 e!623434)))

(assert (=> b!1091390 (= res!727682 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1091390 (= lt!486711 lt!486706)))

(declare-fun lt!486705 () tuple2!17076)

(declare-fun +!3360 (ListLongMap!15053 tuple2!17076) ListLongMap!15053)

(assert (=> b!1091390 (= lt!486706 (+!3360 lt!486707 lt!486705))))

(assert (=> b!1091390 (= lt!486717 lt!486714)))

(assert (=> b!1091390 (= lt!486714 (+!3360 lt!486709 lt!486705))))

(assert (=> b!1091390 (= lt!486717 (+!3360 lt!486712 lt!486705))))

(assert (=> b!1091390 (= lt!486705 (tuple2!17077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091391 () Bool)

(assert (=> b!1091391 (= e!623436 tp_is_empty!26743)))

(assert (= (and start!96324 res!727687) b!1091383))

(assert (= (and b!1091383 res!727688) b!1091381))

(assert (= (and b!1091381 res!727683) b!1091387))

(assert (= (and b!1091387 res!727691) b!1091380))

(assert (= (and b!1091380 res!727686) b!1091384))

(assert (= (and b!1091384 res!727684) b!1091388))

(assert (= (and b!1091388 res!727690) b!1091386))

(assert (= (and b!1091386 res!727689) b!1091378))

(assert (= (and b!1091378 res!727692) b!1091379))

(assert (= (and b!1091379 (not res!727685)) b!1091390))

(assert (= (and b!1091390 (not res!727682)) b!1091385))

(assert (= (and b!1091389 condMapEmpty!41869) mapIsEmpty!41869))

(assert (= (and b!1091389 (not condMapEmpty!41869)) mapNonEmpty!41869))

(get-info :version)

(assert (= (and mapNonEmpty!41869 ((_ is ValueCellFull!12662) mapValue!41869)) b!1091382))

(assert (= (and b!1091389 ((_ is ValueCellFull!12662) mapDefault!41869)) b!1091391))

(assert (= start!96324 b!1091389))

(declare-fun b_lambda!17421 () Bool)

(assert (=> (not b_lambda!17421) (not b!1091379)))

(declare-fun t!33457 () Bool)

(declare-fun tb!7611 () Bool)

(assert (=> (and start!96324 (= defaultEntry!882 defaultEntry!882) t!33457) tb!7611))

(declare-fun result!15749 () Bool)

(assert (=> tb!7611 (= result!15749 tp_is_empty!26743)))

(assert (=> b!1091379 t!33457))

(declare-fun b_and!36169 () Bool)

(assert (= b_and!36167 (and (=> t!33457 result!15749) b_and!36169)))

(declare-fun m!1011059 () Bool)

(assert (=> b!1091379 m!1011059))

(declare-fun m!1011061 () Bool)

(assert (=> b!1091379 m!1011061))

(declare-fun m!1011063 () Bool)

(assert (=> b!1091379 m!1011063))

(declare-fun m!1011065 () Bool)

(assert (=> b!1091379 m!1011065))

(declare-fun m!1011067 () Bool)

(assert (=> b!1091379 m!1011067))

(declare-fun m!1011069 () Bool)

(assert (=> b!1091379 m!1011069))

(declare-fun m!1011071 () Bool)

(assert (=> b!1091379 m!1011071))

(declare-fun m!1011073 () Bool)

(assert (=> b!1091379 m!1011073))

(declare-fun m!1011075 () Bool)

(assert (=> b!1091379 m!1011075))

(declare-fun m!1011077 () Bool)

(assert (=> b!1091379 m!1011077))

(declare-fun m!1011079 () Bool)

(assert (=> b!1091390 m!1011079))

(declare-fun m!1011081 () Bool)

(assert (=> b!1091390 m!1011081))

(declare-fun m!1011083 () Bool)

(assert (=> b!1091390 m!1011083))

(declare-fun m!1011085 () Bool)

(assert (=> b!1091384 m!1011085))

(declare-fun m!1011087 () Bool)

(assert (=> b!1091386 m!1011087))

(declare-fun m!1011089 () Bool)

(assert (=> b!1091386 m!1011089))

(declare-fun m!1011091 () Bool)

(assert (=> b!1091385 m!1011091))

(declare-fun m!1011093 () Bool)

(assert (=> b!1091385 m!1011093))

(declare-fun m!1011095 () Bool)

(assert (=> b!1091381 m!1011095))

(declare-fun m!1011097 () Bool)

(assert (=> b!1091387 m!1011097))

(declare-fun m!1011099 () Bool)

(assert (=> b!1091388 m!1011099))

(declare-fun m!1011101 () Bool)

(assert (=> start!96324 m!1011101))

(declare-fun m!1011103 () Bool)

(assert (=> start!96324 m!1011103))

(declare-fun m!1011105 () Bool)

(assert (=> start!96324 m!1011105))

(declare-fun m!1011107 () Bool)

(assert (=> mapNonEmpty!41869 m!1011107))

(declare-fun m!1011109 () Bool)

(assert (=> b!1091378 m!1011109))

(check-sat (not b_next!22741) (not b!1091381) tp_is_empty!26743 (not b!1091385) (not start!96324) (not b!1091378) b_and!36169 (not mapNonEmpty!41869) (not b!1091379) (not b_lambda!17421) (not b!1091384) (not b!1091390) (not b!1091387) (not b!1091386))
(check-sat b_and!36169 (not b_next!22741))
