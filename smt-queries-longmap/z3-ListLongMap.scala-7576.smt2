; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95770 () Bool)

(assert start!95770)

(declare-fun b_free!22429 () Bool)

(declare-fun b_next!22429 () Bool)

(assert (=> start!95770 (= b_free!22429 (not b_next!22429))))

(declare-fun tp!79135 () Bool)

(declare-fun b_and!35507 () Bool)

(assert (=> start!95770 (= tp!79135 b_and!35507)))

(declare-fun b!1083210 () Bool)

(declare-fun e!618948 () Bool)

(declare-fun e!618950 () Bool)

(assert (=> b!1083210 (= e!618948 e!618950)))

(declare-fun res!722127 () Bool)

(assert (=> b!1083210 (=> (not res!722127) (not e!618950))))

(declare-datatypes ((array!69730 0))(
  ( (array!69731 (arr!33539 (Array (_ BitVec 32) (_ BitVec 64))) (size!34077 (_ BitVec 32))) )
))
(declare-fun lt!479842 () array!69730)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69730 (_ BitVec 32)) Bool)

(assert (=> b!1083210 (= res!722127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479842 mask!1414))))

(declare-fun _keys!1070 () array!69730)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083210 (= lt!479842 (array!69731 (store (arr!33539 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34077 _keys!1070)))))

(declare-fun b!1083211 () Bool)

(declare-fun res!722121 () Bool)

(assert (=> b!1083211 (=> (not res!722121) (not e!618948))))

(assert (=> b!1083211 (= res!722121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083212 () Bool)

(declare-fun e!618947 () Bool)

(declare-fun tp_is_empty!26431 () Bool)

(assert (=> b!1083212 (= e!618947 tp_is_empty!26431)))

(declare-fun b!1083213 () Bool)

(declare-fun res!722124 () Bool)

(assert (=> b!1083213 (=> (not res!722124) (not e!618948))))

(assert (=> b!1083213 (= res!722124 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34077 _keys!1070))))))

(declare-fun b!1083214 () Bool)

(declare-fun res!722119 () Bool)

(assert (=> b!1083214 (=> (not res!722119) (not e!618948))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1083214 (= res!722119 (= (select (arr!33539 _keys!1070) i!650) k0!904))))

(declare-fun b!1083215 () Bool)

(declare-fun res!722120 () Bool)

(assert (=> b!1083215 (=> (not res!722120) (not e!618948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083215 (= res!722120 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!41401 () Bool)

(declare-fun mapRes!41401 () Bool)

(assert (=> mapIsEmpty!41401 mapRes!41401))

(declare-fun b!1083216 () Bool)

(declare-fun res!722122 () Bool)

(assert (=> b!1083216 (=> (not res!722122) (not e!618950))))

(declare-datatypes ((List!23445 0))(
  ( (Nil!23442) (Cons!23441 (h!24650 (_ BitVec 64)) (t!32923 List!23445)) )
))
(declare-fun arrayNoDuplicates!0 (array!69730 (_ BitVec 32) List!23445) Bool)

(assert (=> b!1083216 (= res!722122 (arrayNoDuplicates!0 lt!479842 #b00000000000000000000000000000000 Nil!23442))))

(declare-fun res!722126 () Bool)

(assert (=> start!95770 (=> (not res!722126) (not e!618948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95770 (= res!722126 (validMask!0 mask!1414))))

(assert (=> start!95770 e!618948))

(assert (=> start!95770 tp!79135))

(assert (=> start!95770 true))

(assert (=> start!95770 tp_is_empty!26431))

(declare-fun array_inv!25928 (array!69730) Bool)

(assert (=> start!95770 (array_inv!25928 _keys!1070)))

(declare-datatypes ((V!40369 0))(
  ( (V!40370 (val!13272 Int)) )
))
(declare-datatypes ((ValueCell!12506 0))(
  ( (ValueCellFull!12506 (v!15892 V!40369)) (EmptyCell!12506) )
))
(declare-datatypes ((array!69732 0))(
  ( (array!69733 (arr!33540 (Array (_ BitVec 32) ValueCell!12506)) (size!34078 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69732)

(declare-fun e!618945 () Bool)

(declare-fun array_inv!25929 (array!69732) Bool)

(assert (=> start!95770 (and (array_inv!25929 _values!874) e!618945)))

(declare-fun b!1083217 () Bool)

(declare-fun res!722125 () Bool)

(assert (=> b!1083217 (=> (not res!722125) (not e!618948))))

(assert (=> b!1083217 (= res!722125 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23442))))

(declare-fun b!1083218 () Bool)

(assert (=> b!1083218 (= e!618950 (not true))))

(declare-datatypes ((tuple2!16876 0))(
  ( (tuple2!16877 (_1!8449 (_ BitVec 64)) (_2!8449 V!40369)) )
))
(declare-datatypes ((List!23446 0))(
  ( (Nil!23443) (Cons!23442 (h!24651 tuple2!16876) (t!32924 List!23446)) )
))
(declare-datatypes ((ListLongMap!14845 0))(
  ( (ListLongMap!14846 (toList!7438 List!23446)) )
))
(declare-fun lt!479843 () ListLongMap!14845)

(declare-fun lt!479840 () ListLongMap!14845)

(assert (=> b!1083218 (and (= lt!479843 lt!479840) (= lt!479840 lt!479843))))

(declare-fun lt!479838 () ListLongMap!14845)

(declare-fun -!717 (ListLongMap!14845 (_ BitVec 64)) ListLongMap!14845)

(assert (=> b!1083218 (= lt!479840 (-!717 lt!479838 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40369)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((Unit!35469 0))(
  ( (Unit!35470) )
))
(declare-fun lt!479839 () Unit!35469)

(declare-fun zeroValue!831 () V!40369)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!15 (array!69730 array!69732 (_ BitVec 32) (_ BitVec 32) V!40369 V!40369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35469)

(assert (=> b!1083218 (= lt!479839 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!15 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4001 (array!69730 array!69732 (_ BitVec 32) (_ BitVec 32) V!40369 V!40369 (_ BitVec 32) Int) ListLongMap!14845)

(declare-fun dynLambda!2072 (Int (_ BitVec 64)) V!40369)

(assert (=> b!1083218 (= lt!479843 (getCurrentListMapNoExtraKeys!4001 lt!479842 (array!69733 (store (arr!33540 _values!874) i!650 (ValueCellFull!12506 (dynLambda!2072 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34078 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1083218 (= lt!479838 (getCurrentListMapNoExtraKeys!4001 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083218 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479841 () Unit!35469)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69730 (_ BitVec 64) (_ BitVec 32)) Unit!35469)

(assert (=> b!1083218 (= lt!479841 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083219 () Bool)

(declare-fun e!618946 () Bool)

(assert (=> b!1083219 (= e!618946 tp_is_empty!26431)))

(declare-fun mapNonEmpty!41401 () Bool)

(declare-fun tp!79136 () Bool)

(assert (=> mapNonEmpty!41401 (= mapRes!41401 (and tp!79136 e!618946))))

(declare-fun mapRest!41401 () (Array (_ BitVec 32) ValueCell!12506))

(declare-fun mapKey!41401 () (_ BitVec 32))

(declare-fun mapValue!41401 () ValueCell!12506)

(assert (=> mapNonEmpty!41401 (= (arr!33540 _values!874) (store mapRest!41401 mapKey!41401 mapValue!41401))))

(declare-fun b!1083220 () Bool)

(declare-fun res!722123 () Bool)

(assert (=> b!1083220 (=> (not res!722123) (not e!618948))))

(assert (=> b!1083220 (= res!722123 (and (= (size!34078 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34077 _keys!1070) (size!34078 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083221 () Bool)

(assert (=> b!1083221 (= e!618945 (and e!618947 mapRes!41401))))

(declare-fun condMapEmpty!41401 () Bool)

(declare-fun mapDefault!41401 () ValueCell!12506)

(assert (=> b!1083221 (= condMapEmpty!41401 (= (arr!33540 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12506)) mapDefault!41401)))))

(assert (= (and start!95770 res!722126) b!1083220))

(assert (= (and b!1083220 res!722123) b!1083211))

(assert (= (and b!1083211 res!722121) b!1083217))

(assert (= (and b!1083217 res!722125) b!1083213))

(assert (= (and b!1083213 res!722124) b!1083215))

(assert (= (and b!1083215 res!722120) b!1083214))

(assert (= (and b!1083214 res!722119) b!1083210))

(assert (= (and b!1083210 res!722127) b!1083216))

(assert (= (and b!1083216 res!722122) b!1083218))

(assert (= (and b!1083221 condMapEmpty!41401) mapIsEmpty!41401))

(assert (= (and b!1083221 (not condMapEmpty!41401)) mapNonEmpty!41401))

(get-info :version)

(assert (= (and mapNonEmpty!41401 ((_ is ValueCellFull!12506) mapValue!41401)) b!1083219))

(assert (= (and b!1083221 ((_ is ValueCellFull!12506) mapDefault!41401)) b!1083212))

(assert (= start!95770 b!1083221))

(declare-fun b_lambda!17077 () Bool)

(assert (=> (not b_lambda!17077) (not b!1083218)))

(declare-fun t!32922 () Bool)

(declare-fun tb!7299 () Bool)

(assert (=> (and start!95770 (= defaultEntry!882 defaultEntry!882) t!32922) tb!7299))

(declare-fun result!15125 () Bool)

(assert (=> tb!7299 (= result!15125 tp_is_empty!26431)))

(assert (=> b!1083218 t!32922))

(declare-fun b_and!35509 () Bool)

(assert (= b_and!35507 (and (=> t!32922 result!15125) b_and!35509)))

(declare-fun m!1000409 () Bool)

(assert (=> start!95770 m!1000409))

(declare-fun m!1000411 () Bool)

(assert (=> start!95770 m!1000411))

(declare-fun m!1000413 () Bool)

(assert (=> start!95770 m!1000413))

(declare-fun m!1000415 () Bool)

(assert (=> b!1083214 m!1000415))

(declare-fun m!1000417 () Bool)

(assert (=> b!1083216 m!1000417))

(declare-fun m!1000419 () Bool)

(assert (=> b!1083211 m!1000419))

(declare-fun m!1000421 () Bool)

(assert (=> b!1083218 m!1000421))

(declare-fun m!1000423 () Bool)

(assert (=> b!1083218 m!1000423))

(declare-fun m!1000425 () Bool)

(assert (=> b!1083218 m!1000425))

(declare-fun m!1000427 () Bool)

(assert (=> b!1083218 m!1000427))

(declare-fun m!1000429 () Bool)

(assert (=> b!1083218 m!1000429))

(declare-fun m!1000431 () Bool)

(assert (=> b!1083218 m!1000431))

(declare-fun m!1000433 () Bool)

(assert (=> b!1083218 m!1000433))

(declare-fun m!1000435 () Bool)

(assert (=> b!1083218 m!1000435))

(declare-fun m!1000437 () Bool)

(assert (=> b!1083210 m!1000437))

(declare-fun m!1000439 () Bool)

(assert (=> b!1083210 m!1000439))

(declare-fun m!1000441 () Bool)

(assert (=> b!1083215 m!1000441))

(declare-fun m!1000443 () Bool)

(assert (=> mapNonEmpty!41401 m!1000443))

(declare-fun m!1000445 () Bool)

(assert (=> b!1083217 m!1000445))

(check-sat (not b_next!22429) (not b!1083216) (not start!95770) (not b_lambda!17077) (not b!1083218) tp_is_empty!26431 (not b!1083215) (not mapNonEmpty!41401) (not b!1083211) (not b!1083217) (not b!1083210) b_and!35509)
(check-sat b_and!35509 (not b_next!22429))
