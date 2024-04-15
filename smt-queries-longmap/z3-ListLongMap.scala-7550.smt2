; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95614 () Bool)

(assert start!95614)

(declare-fun b_free!22273 () Bool)

(declare-fun b_next!22273 () Bool)

(assert (=> start!95614 (= b_free!22273 (not b_next!22273))))

(declare-fun tp!78668 () Bool)

(declare-fun b_and!35225 () Bool)

(assert (=> start!95614 (= tp!78668 b_and!35225)))

(declare-fun b!1080276 () Bool)

(declare-fun e!617541 () Bool)

(declare-fun tp_is_empty!26275 () Bool)

(assert (=> b!1080276 (= e!617541 tp_is_empty!26275)))

(declare-fun b!1080277 () Bool)

(declare-fun e!617546 () Bool)

(declare-fun e!617542 () Bool)

(declare-fun mapRes!41167 () Bool)

(assert (=> b!1080277 (= e!617546 (and e!617542 mapRes!41167))))

(declare-fun condMapEmpty!41167 () Bool)

(declare-datatypes ((V!40161 0))(
  ( (V!40162 (val!13194 Int)) )
))
(declare-datatypes ((ValueCell!12428 0))(
  ( (ValueCellFull!12428 (v!15814 V!40161)) (EmptyCell!12428) )
))
(declare-datatypes ((array!69432 0))(
  ( (array!69433 (arr!33390 (Array (_ BitVec 32) ValueCell!12428)) (size!33928 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69432)

(declare-fun mapDefault!41167 () ValueCell!12428)

(assert (=> b!1080277 (= condMapEmpty!41167 (= (arr!33390 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12428)) mapDefault!41167)))))

(declare-fun b!1080278 () Bool)

(declare-fun res!720021 () Bool)

(declare-fun e!617543 () Bool)

(assert (=> b!1080278 (=> (not res!720021) (not e!617543))))

(declare-datatypes ((array!69434 0))(
  ( (array!69435 (arr!33391 (Array (_ BitVec 32) (_ BitVec 64))) (size!33929 (_ BitVec 32))) )
))
(declare-fun lt!478817 () array!69434)

(declare-datatypes ((List!23342 0))(
  ( (Nil!23339) (Cons!23338 (h!24547 (_ BitVec 64)) (t!32692 List!23342)) )
))
(declare-fun arrayNoDuplicates!0 (array!69434 (_ BitVec 32) List!23342) Bool)

(assert (=> b!1080278 (= res!720021 (arrayNoDuplicates!0 lt!478817 #b00000000000000000000000000000000 Nil!23339))))

(declare-fun b!1080279 () Bool)

(declare-fun res!720017 () Bool)

(declare-fun e!617544 () Bool)

(assert (=> b!1080279 (=> (not res!720017) (not e!617544))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun _keys!1070 () array!69434)

(assert (=> b!1080279 (= res!720017 (and (= (size!33928 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33929 _keys!1070) (size!33928 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080280 () Bool)

(assert (=> b!1080280 (= e!617544 e!617543)))

(declare-fun res!720019 () Bool)

(assert (=> b!1080280 (=> (not res!720019) (not e!617543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69434 (_ BitVec 32)) Bool)

(assert (=> b!1080280 (= res!720019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478817 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080280 (= lt!478817 (array!69435 (store (arr!33391 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33929 _keys!1070)))))

(declare-fun b!1080281 () Bool)

(declare-fun res!720013 () Bool)

(assert (=> b!1080281 (=> (not res!720013) (not e!617544))))

(assert (=> b!1080281 (= res!720013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080282 () Bool)

(declare-fun res!720016 () Bool)

(assert (=> b!1080282 (=> (not res!720016) (not e!617544))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080282 (= res!720016 (validKeyInArray!0 k0!904))))

(declare-fun b!1080283 () Bool)

(assert (=> b!1080283 (= e!617543 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!16782 0))(
  ( (tuple2!16783 (_1!8402 (_ BitVec 64)) (_2!8402 V!40161)) )
))
(declare-datatypes ((List!23343 0))(
  ( (Nil!23340) (Cons!23339 (h!24548 tuple2!16782) (t!32693 List!23343)) )
))
(declare-datatypes ((ListLongMap!14751 0))(
  ( (ListLongMap!14752 (toList!7391 List!23343)) )
))
(declare-fun lt!478816 () ListLongMap!14751)

(declare-fun minValue!831 () V!40161)

(declare-fun zeroValue!831 () V!40161)

(declare-fun getCurrentListMapNoExtraKeys!3954 (array!69434 array!69432 (_ BitVec 32) (_ BitVec 32) V!40161 V!40161 (_ BitVec 32) Int) ListLongMap!14751)

(assert (=> b!1080283 (= lt!478816 (getCurrentListMapNoExtraKeys!3954 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080283 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35375 0))(
  ( (Unit!35376) )
))
(declare-fun lt!478815 () Unit!35375)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69434 (_ BitVec 64) (_ BitVec 32)) Unit!35375)

(assert (=> b!1080283 (= lt!478815 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!720020 () Bool)

(assert (=> start!95614 (=> (not res!720020) (not e!617544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95614 (= res!720020 (validMask!0 mask!1414))))

(assert (=> start!95614 e!617544))

(assert (=> start!95614 tp!78668))

(assert (=> start!95614 true))

(assert (=> start!95614 tp_is_empty!26275))

(declare-fun array_inv!25814 (array!69434) Bool)

(assert (=> start!95614 (array_inv!25814 _keys!1070)))

(declare-fun array_inv!25815 (array!69432) Bool)

(assert (=> start!95614 (and (array_inv!25815 _values!874) e!617546)))

(declare-fun mapIsEmpty!41167 () Bool)

(assert (=> mapIsEmpty!41167 mapRes!41167))

(declare-fun b!1080284 () Bool)

(assert (=> b!1080284 (= e!617542 tp_is_empty!26275)))

(declare-fun b!1080285 () Bool)

(declare-fun res!720018 () Bool)

(assert (=> b!1080285 (=> (not res!720018) (not e!617544))))

(assert (=> b!1080285 (= res!720018 (= (select (arr!33391 _keys!1070) i!650) k0!904))))

(declare-fun b!1080286 () Bool)

(declare-fun res!720014 () Bool)

(assert (=> b!1080286 (=> (not res!720014) (not e!617544))))

(assert (=> b!1080286 (= res!720014 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23339))))

(declare-fun mapNonEmpty!41167 () Bool)

(declare-fun tp!78667 () Bool)

(assert (=> mapNonEmpty!41167 (= mapRes!41167 (and tp!78667 e!617541))))

(declare-fun mapRest!41167 () (Array (_ BitVec 32) ValueCell!12428))

(declare-fun mapValue!41167 () ValueCell!12428)

(declare-fun mapKey!41167 () (_ BitVec 32))

(assert (=> mapNonEmpty!41167 (= (arr!33390 _values!874) (store mapRest!41167 mapKey!41167 mapValue!41167))))

(declare-fun b!1080287 () Bool)

(declare-fun res!720015 () Bool)

(assert (=> b!1080287 (=> (not res!720015) (not e!617544))))

(assert (=> b!1080287 (= res!720015 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33929 _keys!1070))))))

(assert (= (and start!95614 res!720020) b!1080279))

(assert (= (and b!1080279 res!720017) b!1080281))

(assert (= (and b!1080281 res!720013) b!1080286))

(assert (= (and b!1080286 res!720014) b!1080287))

(assert (= (and b!1080287 res!720015) b!1080282))

(assert (= (and b!1080282 res!720016) b!1080285))

(assert (= (and b!1080285 res!720018) b!1080280))

(assert (= (and b!1080280 res!720019) b!1080278))

(assert (= (and b!1080278 res!720021) b!1080283))

(assert (= (and b!1080277 condMapEmpty!41167) mapIsEmpty!41167))

(assert (= (and b!1080277 (not condMapEmpty!41167)) mapNonEmpty!41167))

(get-info :version)

(assert (= (and mapNonEmpty!41167 ((_ is ValueCellFull!12428) mapValue!41167)) b!1080276))

(assert (= (and b!1080277 ((_ is ValueCellFull!12428) mapDefault!41167)) b!1080284))

(assert (= start!95614 b!1080277))

(declare-fun m!997763 () Bool)

(assert (=> b!1080286 m!997763))

(declare-fun m!997765 () Bool)

(assert (=> b!1080285 m!997765))

(declare-fun m!997767 () Bool)

(assert (=> mapNonEmpty!41167 m!997767))

(declare-fun m!997769 () Bool)

(assert (=> b!1080278 m!997769))

(declare-fun m!997771 () Bool)

(assert (=> b!1080282 m!997771))

(declare-fun m!997773 () Bool)

(assert (=> b!1080281 m!997773))

(declare-fun m!997775 () Bool)

(assert (=> start!95614 m!997775))

(declare-fun m!997777 () Bool)

(assert (=> start!95614 m!997777))

(declare-fun m!997779 () Bool)

(assert (=> start!95614 m!997779))

(declare-fun m!997781 () Bool)

(assert (=> b!1080283 m!997781))

(declare-fun m!997783 () Bool)

(assert (=> b!1080283 m!997783))

(declare-fun m!997785 () Bool)

(assert (=> b!1080283 m!997785))

(declare-fun m!997787 () Bool)

(assert (=> b!1080280 m!997787))

(declare-fun m!997789 () Bool)

(assert (=> b!1080280 m!997789))

(check-sat (not start!95614) (not b!1080282) (not b_next!22273) (not b!1080286) (not b!1080280) (not mapNonEmpty!41167) (not b!1080278) b_and!35225 tp_is_empty!26275 (not b!1080283) (not b!1080281))
(check-sat b_and!35225 (not b_next!22273))
