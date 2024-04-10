; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95686 () Bool)

(assert start!95686)

(declare-fun b_free!22339 () Bool)

(declare-fun b_next!22339 () Bool)

(assert (=> start!95686 (= b_free!22339 (not b_next!22339))))

(declare-fun tp!78865 () Bool)

(declare-fun b_and!35353 () Bool)

(assert (=> start!95686 (= tp!78865 b_and!35353)))

(declare-fun b!1081653 () Bool)

(declare-fun e!618231 () Bool)

(assert (=> b!1081653 (= e!618231 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40249 0))(
  ( (V!40250 (val!13227 Int)) )
))
(declare-datatypes ((ValueCell!12461 0))(
  ( (ValueCellFull!12461 (v!15848 V!40249)) (EmptyCell!12461) )
))
(declare-datatypes ((array!69629 0))(
  ( (array!69630 (arr!33488 (Array (_ BitVec 32) ValueCell!12461)) (size!34024 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69629)

(declare-fun minValue!831 () V!40249)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69631 0))(
  ( (array!69632 (arr!33489 (Array (_ BitVec 32) (_ BitVec 64))) (size!34025 (_ BitVec 32))) )
))
(declare-fun lt!479368 () array!69631)

(declare-datatypes ((tuple2!16760 0))(
  ( (tuple2!16761 (_1!8391 (_ BitVec 64)) (_2!8391 V!40249)) )
))
(declare-datatypes ((List!23339 0))(
  ( (Nil!23336) (Cons!23335 (h!24544 tuple2!16760) (t!32736 List!23339)) )
))
(declare-datatypes ((ListLongMap!14729 0))(
  ( (ListLongMap!14730 (toList!7380 List!23339)) )
))
(declare-fun lt!479369 () ListLongMap!14729)

(declare-fun zeroValue!831 () V!40249)

(declare-fun getCurrentListMapNoExtraKeys!3928 (array!69631 array!69629 (_ BitVec 32) (_ BitVec 32) V!40249 V!40249 (_ BitVec 32) Int) ListLongMap!14729)

(declare-fun dynLambda!2065 (Int (_ BitVec 64)) V!40249)

(assert (=> b!1081653 (= lt!479369 (getCurrentListMapNoExtraKeys!3928 lt!479368 (array!69630 (store (arr!33488 _values!874) i!650 (ValueCellFull!12461 (dynLambda!2065 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34024 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun _keys!1070 () array!69631)

(declare-fun lt!479370 () ListLongMap!14729)

(assert (=> b!1081653 (= lt!479370 (getCurrentListMapNoExtraKeys!3928 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081653 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35580 0))(
  ( (Unit!35581) )
))
(declare-fun lt!479371 () Unit!35580)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69631 (_ BitVec 64) (_ BitVec 32)) Unit!35580)

(assert (=> b!1081653 (= lt!479371 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1081654 () Bool)

(declare-fun res!720975 () Bool)

(assert (=> b!1081654 (=> (not res!720975) (not e!618231))))

(declare-datatypes ((List!23340 0))(
  ( (Nil!23337) (Cons!23336 (h!24545 (_ BitVec 64)) (t!32737 List!23340)) )
))
(declare-fun arrayNoDuplicates!0 (array!69631 (_ BitVec 32) List!23340) Bool)

(assert (=> b!1081654 (= res!720975 (arrayNoDuplicates!0 lt!479368 #b00000000000000000000000000000000 Nil!23337))))

(declare-fun b!1081655 () Bool)

(declare-fun res!720978 () Bool)

(declare-fun e!618232 () Bool)

(assert (=> b!1081655 (=> (not res!720978) (not e!618232))))

(assert (=> b!1081655 (= res!720978 (and (= (size!34024 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34025 _keys!1070) (size!34024 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081656 () Bool)

(declare-fun e!618228 () Bool)

(declare-fun tp_is_empty!26341 () Bool)

(assert (=> b!1081656 (= e!618228 tp_is_empty!26341)))

(declare-fun b!1081657 () Bool)

(assert (=> b!1081657 (= e!618232 e!618231)))

(declare-fun res!720981 () Bool)

(assert (=> b!1081657 (=> (not res!720981) (not e!618231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69631 (_ BitVec 32)) Bool)

(assert (=> b!1081657 (= res!720981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479368 mask!1414))))

(assert (=> b!1081657 (= lt!479368 (array!69632 (store (arr!33489 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34025 _keys!1070)))))

(declare-fun mapNonEmpty!41266 () Bool)

(declare-fun mapRes!41266 () Bool)

(declare-fun tp!78866 () Bool)

(declare-fun e!618233 () Bool)

(assert (=> mapNonEmpty!41266 (= mapRes!41266 (and tp!78866 e!618233))))

(declare-fun mapKey!41266 () (_ BitVec 32))

(declare-fun mapRest!41266 () (Array (_ BitVec 32) ValueCell!12461))

(declare-fun mapValue!41266 () ValueCell!12461)

(assert (=> mapNonEmpty!41266 (= (arr!33488 _values!874) (store mapRest!41266 mapKey!41266 mapValue!41266))))

(declare-fun res!720979 () Bool)

(assert (=> start!95686 (=> (not res!720979) (not e!618232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95686 (= res!720979 (validMask!0 mask!1414))))

(assert (=> start!95686 e!618232))

(assert (=> start!95686 tp!78865))

(assert (=> start!95686 true))

(assert (=> start!95686 tp_is_empty!26341))

(declare-fun array_inv!25852 (array!69631) Bool)

(assert (=> start!95686 (array_inv!25852 _keys!1070)))

(declare-fun e!618230 () Bool)

(declare-fun array_inv!25853 (array!69629) Bool)

(assert (=> start!95686 (and (array_inv!25853 _values!874) e!618230)))

(declare-fun b!1081658 () Bool)

(declare-fun res!720976 () Bool)

(assert (=> b!1081658 (=> (not res!720976) (not e!618232))))

(assert (=> b!1081658 (= res!720976 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34025 _keys!1070))))))

(declare-fun b!1081659 () Bool)

(declare-fun res!720977 () Bool)

(assert (=> b!1081659 (=> (not res!720977) (not e!618232))))

(assert (=> b!1081659 (= res!720977 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23337))))

(declare-fun b!1081660 () Bool)

(declare-fun res!720974 () Bool)

(assert (=> b!1081660 (=> (not res!720974) (not e!618232))))

(assert (=> b!1081660 (= res!720974 (= (select (arr!33489 _keys!1070) i!650) k!904))))

(declare-fun b!1081661 () Bool)

(assert (=> b!1081661 (= e!618230 (and e!618228 mapRes!41266))))

(declare-fun condMapEmpty!41266 () Bool)

(declare-fun mapDefault!41266 () ValueCell!12461)

