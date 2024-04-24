; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95862 () Bool)

(assert start!95862)

(declare-fun b_free!22279 () Bool)

(declare-fun b_next!22279 () Bool)

(assert (=> start!95862 (= b_free!22279 (not b_next!22279))))

(declare-fun tp!78685 () Bool)

(declare-fun b_and!35267 () Bool)

(assert (=> start!95862 (= tp!78685 b_and!35267)))

(declare-fun res!720688 () Bool)

(declare-fun e!618547 () Bool)

(assert (=> start!95862 (=> (not res!720688) (not e!618547))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95862 (= res!720688 (validMask!0 mask!1414))))

(assert (=> start!95862 e!618547))

(assert (=> start!95862 tp!78685))

(assert (=> start!95862 true))

(declare-fun tp_is_empty!26281 () Bool)

(assert (=> start!95862 tp_is_empty!26281))

(declare-datatypes ((array!69549 0))(
  ( (array!69550 (arr!33442 (Array (_ BitVec 32) (_ BitVec 64))) (size!33979 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69549)

(declare-fun array_inv!25860 (array!69549) Bool)

(assert (=> start!95862 (array_inv!25860 _keys!1070)))

(declare-datatypes ((V!40169 0))(
  ( (V!40170 (val!13197 Int)) )
))
(declare-datatypes ((ValueCell!12431 0))(
  ( (ValueCellFull!12431 (v!15814 V!40169)) (EmptyCell!12431) )
))
(declare-datatypes ((array!69551 0))(
  ( (array!69552 (arr!33443 (Array (_ BitVec 32) ValueCell!12431)) (size!33980 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69551)

(declare-fun e!618544 () Bool)

(declare-fun array_inv!25861 (array!69551) Bool)

(assert (=> start!95862 (and (array_inv!25861 _values!874) e!618544)))

(declare-fun b!1081864 () Bool)

(declare-fun e!618546 () Bool)

(assert (=> b!1081864 (= e!618546 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40169)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40169)

(declare-datatypes ((tuple2!16708 0))(
  ( (tuple2!16709 (_1!8365 (_ BitVec 64)) (_2!8365 V!40169)) )
))
(declare-datatypes ((List!23301 0))(
  ( (Nil!23298) (Cons!23297 (h!24515 tuple2!16708) (t!32652 List!23301)) )
))
(declare-datatypes ((ListLongMap!14685 0))(
  ( (ListLongMap!14686 (toList!7358 List!23301)) )
))
(declare-fun lt!479559 () ListLongMap!14685)

(declare-fun getCurrentListMapNoExtraKeys!3935 (array!69549 array!69551 (_ BitVec 32) (_ BitVec 32) V!40169 V!40169 (_ BitVec 32) Int) ListLongMap!14685)

(assert (=> b!1081864 (= lt!479559 (getCurrentListMapNoExtraKeys!3935 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081864 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35507 0))(
  ( (Unit!35508) )
))
(declare-fun lt!479557 () Unit!35507)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69549 (_ BitVec 64) (_ BitVec 32)) Unit!35507)

(assert (=> b!1081864 (= lt!479557 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081865 () Bool)

(declare-fun res!720690 () Bool)

(assert (=> b!1081865 (=> (not res!720690) (not e!618547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081865 (= res!720690 (validKeyInArray!0 k0!904))))

(declare-fun b!1081866 () Bool)

(declare-fun e!618548 () Bool)

(assert (=> b!1081866 (= e!618548 tp_is_empty!26281)))

(declare-fun b!1081867 () Bool)

(declare-fun e!618543 () Bool)

(declare-fun mapRes!41176 () Bool)

(assert (=> b!1081867 (= e!618544 (and e!618543 mapRes!41176))))

(declare-fun condMapEmpty!41176 () Bool)

(declare-fun mapDefault!41176 () ValueCell!12431)

(assert (=> b!1081867 (= condMapEmpty!41176 (= (arr!33443 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12431)) mapDefault!41176)))))

(declare-fun b!1081868 () Bool)

(assert (=> b!1081868 (= e!618547 e!618546)))

(declare-fun res!720686 () Bool)

(assert (=> b!1081868 (=> (not res!720686) (not e!618546))))

(declare-fun lt!479558 () array!69549)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69549 (_ BitVec 32)) Bool)

(assert (=> b!1081868 (= res!720686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479558 mask!1414))))

(assert (=> b!1081868 (= lt!479558 (array!69550 (store (arr!33442 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33979 _keys!1070)))))

(declare-fun b!1081869 () Bool)

(declare-fun res!720693 () Bool)

(assert (=> b!1081869 (=> (not res!720693) (not e!618547))))

(assert (=> b!1081869 (= res!720693 (and (= (size!33980 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33979 _keys!1070) (size!33980 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081870 () Bool)

(declare-fun res!720691 () Bool)

(assert (=> b!1081870 (=> (not res!720691) (not e!618547))))

(declare-datatypes ((List!23302 0))(
  ( (Nil!23299) (Cons!23298 (h!24516 (_ BitVec 64)) (t!32653 List!23302)) )
))
(declare-fun arrayNoDuplicates!0 (array!69549 (_ BitVec 32) List!23302) Bool)

(assert (=> b!1081870 (= res!720691 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23299))))

(declare-fun mapNonEmpty!41176 () Bool)

(declare-fun tp!78686 () Bool)

(assert (=> mapNonEmpty!41176 (= mapRes!41176 (and tp!78686 e!618548))))

(declare-fun mapValue!41176 () ValueCell!12431)

(declare-fun mapKey!41176 () (_ BitVec 32))

(declare-fun mapRest!41176 () (Array (_ BitVec 32) ValueCell!12431))

(assert (=> mapNonEmpty!41176 (= (arr!33443 _values!874) (store mapRest!41176 mapKey!41176 mapValue!41176))))

(declare-fun b!1081871 () Bool)

(declare-fun res!720687 () Bool)

(assert (=> b!1081871 (=> (not res!720687) (not e!618547))))

(assert (=> b!1081871 (= res!720687 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33979 _keys!1070))))))

(declare-fun b!1081872 () Bool)

(declare-fun res!720689 () Bool)

(assert (=> b!1081872 (=> (not res!720689) (not e!618547))))

(assert (=> b!1081872 (= res!720689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41176 () Bool)

(assert (=> mapIsEmpty!41176 mapRes!41176))

(declare-fun b!1081873 () Bool)

(declare-fun res!720692 () Bool)

(assert (=> b!1081873 (=> (not res!720692) (not e!618547))))

(assert (=> b!1081873 (= res!720692 (= (select (arr!33442 _keys!1070) i!650) k0!904))))

(declare-fun b!1081874 () Bool)

(assert (=> b!1081874 (= e!618543 tp_is_empty!26281)))

(declare-fun b!1081875 () Bool)

(declare-fun res!720685 () Bool)

(assert (=> b!1081875 (=> (not res!720685) (not e!618546))))

(assert (=> b!1081875 (= res!720685 (arrayNoDuplicates!0 lt!479558 #b00000000000000000000000000000000 Nil!23299))))

(assert (= (and start!95862 res!720688) b!1081869))

(assert (= (and b!1081869 res!720693) b!1081872))

(assert (= (and b!1081872 res!720689) b!1081870))

(assert (= (and b!1081870 res!720691) b!1081871))

(assert (= (and b!1081871 res!720687) b!1081865))

(assert (= (and b!1081865 res!720690) b!1081873))

(assert (= (and b!1081873 res!720692) b!1081868))

(assert (= (and b!1081868 res!720686) b!1081875))

(assert (= (and b!1081875 res!720685) b!1081864))

(assert (= (and b!1081867 condMapEmpty!41176) mapIsEmpty!41176))

(assert (= (and b!1081867 (not condMapEmpty!41176)) mapNonEmpty!41176))

(get-info :version)

(assert (= (and mapNonEmpty!41176 ((_ is ValueCellFull!12431) mapValue!41176)) b!1081866))

(assert (= (and b!1081867 ((_ is ValueCellFull!12431) mapDefault!41176)) b!1081874))

(assert (= start!95862 b!1081867))

(declare-fun m!1000145 () Bool)

(assert (=> start!95862 m!1000145))

(declare-fun m!1000147 () Bool)

(assert (=> start!95862 m!1000147))

(declare-fun m!1000149 () Bool)

(assert (=> start!95862 m!1000149))

(declare-fun m!1000151 () Bool)

(assert (=> b!1081864 m!1000151))

(declare-fun m!1000153 () Bool)

(assert (=> b!1081864 m!1000153))

(declare-fun m!1000155 () Bool)

(assert (=> b!1081864 m!1000155))

(declare-fun m!1000157 () Bool)

(assert (=> b!1081872 m!1000157))

(declare-fun m!1000159 () Bool)

(assert (=> b!1081870 m!1000159))

(declare-fun m!1000161 () Bool)

(assert (=> b!1081875 m!1000161))

(declare-fun m!1000163 () Bool)

(assert (=> mapNonEmpty!41176 m!1000163))

(declare-fun m!1000165 () Bool)

(assert (=> b!1081868 m!1000165))

(declare-fun m!1000167 () Bool)

(assert (=> b!1081868 m!1000167))

(declare-fun m!1000169 () Bool)

(assert (=> b!1081865 m!1000169))

(declare-fun m!1000171 () Bool)

(assert (=> b!1081873 m!1000171))

(check-sat (not b!1081864) tp_is_empty!26281 b_and!35267 (not b_next!22279) (not b!1081865) (not b!1081870) (not b!1081875) (not b!1081868) (not start!95862) (not b!1081872) (not mapNonEmpty!41176))
(check-sat b_and!35267 (not b_next!22279))
