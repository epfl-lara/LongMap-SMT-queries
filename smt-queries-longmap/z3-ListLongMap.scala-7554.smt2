; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95880 () Bool)

(assert start!95880)

(declare-fun b_free!22297 () Bool)

(declare-fun b_next!22297 () Bool)

(assert (=> start!95880 (= b_free!22297 (not b_next!22297))))

(declare-fun tp!78739 () Bool)

(declare-fun b_and!35285 () Bool)

(assert (=> start!95880 (= tp!78739 b_and!35285)))

(declare-fun mapNonEmpty!41203 () Bool)

(declare-fun mapRes!41203 () Bool)

(declare-fun tp!78740 () Bool)

(declare-fun e!618705 () Bool)

(assert (=> mapNonEmpty!41203 (= mapRes!41203 (and tp!78740 e!618705))))

(declare-datatypes ((V!40193 0))(
  ( (V!40194 (val!13206 Int)) )
))
(declare-datatypes ((ValueCell!12440 0))(
  ( (ValueCellFull!12440 (v!15823 V!40193)) (EmptyCell!12440) )
))
(declare-datatypes ((array!69583 0))(
  ( (array!69584 (arr!33459 (Array (_ BitVec 32) ValueCell!12440)) (size!33996 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69583)

(declare-fun mapRest!41203 () (Array (_ BitVec 32) ValueCell!12440))

(declare-fun mapKey!41203 () (_ BitVec 32))

(declare-fun mapValue!41203 () ValueCell!12440)

(assert (=> mapNonEmpty!41203 (= (arr!33459 _values!874) (store mapRest!41203 mapKey!41203 mapValue!41203))))

(declare-fun mapIsEmpty!41203 () Bool)

(assert (=> mapIsEmpty!41203 mapRes!41203))

(declare-fun b!1082188 () Bool)

(declare-fun e!618707 () Bool)

(declare-datatypes ((array!69585 0))(
  ( (array!69586 (arr!33460 (Array (_ BitVec 32) (_ BitVec 64))) (size!33997 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69585)

(assert (=> b!1082188 (= e!618707 (not (bvsle #b00000000000000000000000000000000 (size!33997 _keys!1070))))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40193)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16724 0))(
  ( (tuple2!16725 (_1!8373 (_ BitVec 64)) (_2!8373 V!40193)) )
))
(declare-datatypes ((List!23315 0))(
  ( (Nil!23312) (Cons!23311 (h!24529 tuple2!16724) (t!32666 List!23315)) )
))
(declare-datatypes ((ListLongMap!14701 0))(
  ( (ListLongMap!14702 (toList!7366 List!23315)) )
))
(declare-fun lt!479640 () ListLongMap!14701)

(declare-fun zeroValue!831 () V!40193)

(declare-fun getCurrentListMapNoExtraKeys!3943 (array!69585 array!69583 (_ BitVec 32) (_ BitVec 32) V!40193 V!40193 (_ BitVec 32) Int) ListLongMap!14701)

(assert (=> b!1082188 (= lt!479640 (getCurrentListMapNoExtraKeys!3943 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082188 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35523 0))(
  ( (Unit!35524) )
))
(declare-fun lt!479638 () Unit!35523)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69585 (_ BitVec 64) (_ BitVec 32)) Unit!35523)

(assert (=> b!1082188 (= lt!479638 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082189 () Bool)

(declare-fun res!720933 () Bool)

(declare-fun e!618706 () Bool)

(assert (=> b!1082189 (=> (not res!720933) (not e!618706))))

(assert (=> b!1082189 (= res!720933 (and (= (size!33996 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33997 _keys!1070) (size!33996 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082190 () Bool)

(declare-fun res!720934 () Bool)

(assert (=> b!1082190 (=> (not res!720934) (not e!618706))))

(assert (=> b!1082190 (= res!720934 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33997 _keys!1070))))))

(declare-fun b!1082191 () Bool)

(declare-fun res!720931 () Bool)

(assert (=> b!1082191 (=> (not res!720931) (not e!618706))))

(declare-datatypes ((List!23316 0))(
  ( (Nil!23313) (Cons!23312 (h!24530 (_ BitVec 64)) (t!32667 List!23316)) )
))
(declare-fun arrayNoDuplicates!0 (array!69585 (_ BitVec 32) List!23316) Bool)

(assert (=> b!1082191 (= res!720931 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23313))))

(declare-fun b!1082192 () Bool)

(declare-fun e!618710 () Bool)

(declare-fun tp_is_empty!26299 () Bool)

(assert (=> b!1082192 (= e!618710 tp_is_empty!26299)))

(declare-fun res!720930 () Bool)

(assert (=> start!95880 (=> (not res!720930) (not e!618706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95880 (= res!720930 (validMask!0 mask!1414))))

(assert (=> start!95880 e!618706))

(assert (=> start!95880 tp!78739))

(assert (=> start!95880 true))

(assert (=> start!95880 tp_is_empty!26299))

(declare-fun array_inv!25872 (array!69585) Bool)

(assert (=> start!95880 (array_inv!25872 _keys!1070)))

(declare-fun e!618708 () Bool)

(declare-fun array_inv!25873 (array!69583) Bool)

(assert (=> start!95880 (and (array_inv!25873 _values!874) e!618708)))

(declare-fun b!1082193 () Bool)

(assert (=> b!1082193 (= e!618708 (and e!618710 mapRes!41203))))

(declare-fun condMapEmpty!41203 () Bool)

(declare-fun mapDefault!41203 () ValueCell!12440)

(assert (=> b!1082193 (= condMapEmpty!41203 (= (arr!33459 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12440)) mapDefault!41203)))))

(declare-fun b!1082194 () Bool)

(assert (=> b!1082194 (= e!618706 e!618707)))

(declare-fun res!720935 () Bool)

(assert (=> b!1082194 (=> (not res!720935) (not e!618707))))

(declare-fun lt!479639 () array!69585)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69585 (_ BitVec 32)) Bool)

(assert (=> b!1082194 (= res!720935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479639 mask!1414))))

(assert (=> b!1082194 (= lt!479639 (array!69586 (store (arr!33460 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33997 _keys!1070)))))

(declare-fun b!1082195 () Bool)

(declare-fun res!720929 () Bool)

(assert (=> b!1082195 (=> (not res!720929) (not e!618706))))

(assert (=> b!1082195 (= res!720929 (= (select (arr!33460 _keys!1070) i!650) k0!904))))

(declare-fun b!1082196 () Bool)

(assert (=> b!1082196 (= e!618705 tp_is_empty!26299)))

(declare-fun b!1082197 () Bool)

(declare-fun res!720932 () Bool)

(assert (=> b!1082197 (=> (not res!720932) (not e!618706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082197 (= res!720932 (validKeyInArray!0 k0!904))))

(declare-fun b!1082198 () Bool)

(declare-fun res!720936 () Bool)

(assert (=> b!1082198 (=> (not res!720936) (not e!618706))))

(assert (=> b!1082198 (= res!720936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082199 () Bool)

(declare-fun res!720928 () Bool)

(assert (=> b!1082199 (=> (not res!720928) (not e!618707))))

(assert (=> b!1082199 (= res!720928 (arrayNoDuplicates!0 lt!479639 #b00000000000000000000000000000000 Nil!23313))))

(assert (= (and start!95880 res!720930) b!1082189))

(assert (= (and b!1082189 res!720933) b!1082198))

(assert (= (and b!1082198 res!720936) b!1082191))

(assert (= (and b!1082191 res!720931) b!1082190))

(assert (= (and b!1082190 res!720934) b!1082197))

(assert (= (and b!1082197 res!720932) b!1082195))

(assert (= (and b!1082195 res!720929) b!1082194))

(assert (= (and b!1082194 res!720935) b!1082199))

(assert (= (and b!1082199 res!720928) b!1082188))

(assert (= (and b!1082193 condMapEmpty!41203) mapIsEmpty!41203))

(assert (= (and b!1082193 (not condMapEmpty!41203)) mapNonEmpty!41203))

(get-info :version)

(assert (= (and mapNonEmpty!41203 ((_ is ValueCellFull!12440) mapValue!41203)) b!1082196))

(assert (= (and b!1082193 ((_ is ValueCellFull!12440) mapDefault!41203)) b!1082192))

(assert (= start!95880 b!1082193))

(declare-fun m!1000397 () Bool)

(assert (=> b!1082198 m!1000397))

(declare-fun m!1000399 () Bool)

(assert (=> start!95880 m!1000399))

(declare-fun m!1000401 () Bool)

(assert (=> start!95880 m!1000401))

(declare-fun m!1000403 () Bool)

(assert (=> start!95880 m!1000403))

(declare-fun m!1000405 () Bool)

(assert (=> b!1082199 m!1000405))

(declare-fun m!1000407 () Bool)

(assert (=> b!1082194 m!1000407))

(declare-fun m!1000409 () Bool)

(assert (=> b!1082194 m!1000409))

(declare-fun m!1000411 () Bool)

(assert (=> b!1082191 m!1000411))

(declare-fun m!1000413 () Bool)

(assert (=> b!1082188 m!1000413))

(declare-fun m!1000415 () Bool)

(assert (=> b!1082188 m!1000415))

(declare-fun m!1000417 () Bool)

(assert (=> b!1082188 m!1000417))

(declare-fun m!1000419 () Bool)

(assert (=> mapNonEmpty!41203 m!1000419))

(declare-fun m!1000421 () Bool)

(assert (=> b!1082197 m!1000421))

(declare-fun m!1000423 () Bool)

(assert (=> b!1082195 m!1000423))

(check-sat (not b!1082197) tp_is_empty!26299 (not b_next!22297) (not b!1082194) (not b!1082199) (not mapNonEmpty!41203) b_and!35285 (not b!1082198) (not b!1082191) (not b!1082188) (not start!95880))
(check-sat b_and!35285 (not b_next!22297))
