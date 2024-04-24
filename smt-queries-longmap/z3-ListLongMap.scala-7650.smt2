; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96456 () Bool)

(assert start!96456)

(declare-fun b_free!22873 () Bool)

(declare-fun b_next!22873 () Bool)

(assert (=> start!96456 (= b_free!22873 (not b_next!22873))))

(declare-fun tp!80468 () Bool)

(declare-fun b_and!36431 () Bool)

(assert (=> start!96456 (= tp!80468 b_and!36431)))

(declare-fun b!1094188 () Bool)

(declare-fun res!729769 () Bool)

(declare-fun e!624926 () Bool)

(assert (=> b!1094188 (=> (not res!729769) (not e!624926))))

(declare-datatypes ((array!70695 0))(
  ( (array!70696 (arr!34015 (Array (_ BitVec 32) (_ BitVec 64))) (size!34552 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70695)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70695 (_ BitVec 32)) Bool)

(assert (=> b!1094188 (= res!729769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094189 () Bool)

(declare-fun res!729766 () Bool)

(assert (=> b!1094189 (=> (not res!729766) (not e!624926))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40961 0))(
  ( (V!40962 (val!13494 Int)) )
))
(declare-datatypes ((ValueCell!12728 0))(
  ( (ValueCellFull!12728 (v!16111 V!40961)) (EmptyCell!12728) )
))
(declare-datatypes ((array!70697 0))(
  ( (array!70698 (arr!34016 (Array (_ BitVec 32) ValueCell!12728)) (size!34553 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70697)

(assert (=> b!1094189 (= res!729766 (and (= (size!34553 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34552 _keys!1070) (size!34553 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094190 () Bool)

(declare-fun e!624929 () Bool)

(assert (=> b!1094190 (= e!624929 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40961)

(declare-datatypes ((tuple2!17170 0))(
  ( (tuple2!17171 (_1!8596 (_ BitVec 64)) (_2!8596 V!40961)) )
))
(declare-datatypes ((List!23762 0))(
  ( (Nil!23759) (Cons!23758 (h!24976 tuple2!17170) (t!33685 List!23762)) )
))
(declare-datatypes ((ListLongMap!15147 0))(
  ( (ListLongMap!15148 (toList!7589 List!23762)) )
))
(declare-fun lt!489094 () ListLongMap!15147)

(declare-fun zeroValue!831 () V!40961)

(declare-fun getCurrentListMap!4337 (array!70695 array!70697 (_ BitVec 32) (_ BitVec 32) V!40961 V!40961 (_ BitVec 32) Int) ListLongMap!15147)

(assert (=> b!1094190 (= lt!489094 (getCurrentListMap!4337 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489095 () ListLongMap!15147)

(declare-fun lt!489091 () array!70697)

(declare-fun lt!489096 () array!70695)

(assert (=> b!1094190 (= lt!489095 (getCurrentListMap!4337 lt!489096 lt!489091 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489093 () ListLongMap!15147)

(declare-fun lt!489097 () ListLongMap!15147)

(assert (=> b!1094190 (and (= lt!489093 lt!489097) (= lt!489097 lt!489093))))

(declare-fun lt!489099 () ListLongMap!15147)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!894 (ListLongMap!15147 (_ BitVec 64)) ListLongMap!15147)

(assert (=> b!1094190 (= lt!489097 (-!894 lt!489099 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35955 0))(
  ( (Unit!35956) )
))
(declare-fun lt!489098 () Unit!35955)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!166 (array!70695 array!70697 (_ BitVec 32) (_ BitVec 32) V!40961 V!40961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35955)

(assert (=> b!1094190 (= lt!489098 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!166 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4142 (array!70695 array!70697 (_ BitVec 32) (_ BitVec 32) V!40961 V!40961 (_ BitVec 32) Int) ListLongMap!15147)

(assert (=> b!1094190 (= lt!489093 (getCurrentListMapNoExtraKeys!4142 lt!489096 lt!489091 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2263 (Int (_ BitVec 64)) V!40961)

(assert (=> b!1094190 (= lt!489091 (array!70698 (store (arr!34016 _values!874) i!650 (ValueCellFull!12728 (dynLambda!2263 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34553 _values!874)))))

(assert (=> b!1094190 (= lt!489099 (getCurrentListMapNoExtraKeys!4142 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094190 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489092 () Unit!35955)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70695 (_ BitVec 64) (_ BitVec 32)) Unit!35955)

(assert (=> b!1094190 (= lt!489092 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!42067 () Bool)

(declare-fun mapRes!42067 () Bool)

(declare-fun tp!80467 () Bool)

(declare-fun e!624925 () Bool)

(assert (=> mapNonEmpty!42067 (= mapRes!42067 (and tp!80467 e!624925))))

(declare-fun mapKey!42067 () (_ BitVec 32))

(declare-fun mapRest!42067 () (Array (_ BitVec 32) ValueCell!12728))

(declare-fun mapValue!42067 () ValueCell!12728)

(assert (=> mapNonEmpty!42067 (= (arr!34016 _values!874) (store mapRest!42067 mapKey!42067 mapValue!42067))))

(declare-fun b!1094191 () Bool)

(declare-fun res!729770 () Bool)

(assert (=> b!1094191 (=> (not res!729770) (not e!624926))))

(assert (=> b!1094191 (= res!729770 (= (select (arr!34015 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!42067 () Bool)

(assert (=> mapIsEmpty!42067 mapRes!42067))

(declare-fun b!1094192 () Bool)

(declare-fun res!729772 () Bool)

(assert (=> b!1094192 (=> (not res!729772) (not e!624926))))

(declare-datatypes ((List!23763 0))(
  ( (Nil!23760) (Cons!23759 (h!24977 (_ BitVec 64)) (t!33686 List!23763)) )
))
(declare-fun arrayNoDuplicates!0 (array!70695 (_ BitVec 32) List!23763) Bool)

(assert (=> b!1094192 (= res!729772 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23760))))

(declare-fun b!1094193 () Bool)

(declare-fun tp_is_empty!26875 () Bool)

(assert (=> b!1094193 (= e!624925 tp_is_empty!26875)))

(declare-fun b!1094194 () Bool)

(assert (=> b!1094194 (= e!624926 e!624929)))

(declare-fun res!729774 () Bool)

(assert (=> b!1094194 (=> (not res!729774) (not e!624929))))

(assert (=> b!1094194 (= res!729774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489096 mask!1414))))

(assert (=> b!1094194 (= lt!489096 (array!70696 (store (arr!34015 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34552 _keys!1070)))))

(declare-fun res!729773 () Bool)

(assert (=> start!96456 (=> (not res!729773) (not e!624926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96456 (= res!729773 (validMask!0 mask!1414))))

(assert (=> start!96456 e!624926))

(assert (=> start!96456 tp!80468))

(assert (=> start!96456 true))

(assert (=> start!96456 tp_is_empty!26875))

(declare-fun array_inv!26254 (array!70695) Bool)

(assert (=> start!96456 (array_inv!26254 _keys!1070)))

(declare-fun e!624927 () Bool)

(declare-fun array_inv!26255 (array!70697) Bool)

(assert (=> start!96456 (and (array_inv!26255 _values!874) e!624927)))

(declare-fun b!1094195 () Bool)

(declare-fun res!729771 () Bool)

(assert (=> b!1094195 (=> (not res!729771) (not e!624926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094195 (= res!729771 (validKeyInArray!0 k0!904))))

(declare-fun b!1094196 () Bool)

(declare-fun e!624924 () Bool)

(assert (=> b!1094196 (= e!624924 tp_is_empty!26875)))

(declare-fun b!1094197 () Bool)

(declare-fun res!729767 () Bool)

(assert (=> b!1094197 (=> (not res!729767) (not e!624929))))

(assert (=> b!1094197 (= res!729767 (arrayNoDuplicates!0 lt!489096 #b00000000000000000000000000000000 Nil!23760))))

(declare-fun b!1094198 () Bool)

(assert (=> b!1094198 (= e!624927 (and e!624924 mapRes!42067))))

(declare-fun condMapEmpty!42067 () Bool)

(declare-fun mapDefault!42067 () ValueCell!12728)

(assert (=> b!1094198 (= condMapEmpty!42067 (= (arr!34016 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12728)) mapDefault!42067)))))

(declare-fun b!1094199 () Bool)

(declare-fun res!729768 () Bool)

(assert (=> b!1094199 (=> (not res!729768) (not e!624926))))

(assert (=> b!1094199 (= res!729768 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34552 _keys!1070))))))

(assert (= (and start!96456 res!729773) b!1094189))

(assert (= (and b!1094189 res!729766) b!1094188))

(assert (= (and b!1094188 res!729769) b!1094192))

(assert (= (and b!1094192 res!729772) b!1094199))

(assert (= (and b!1094199 res!729768) b!1094195))

(assert (= (and b!1094195 res!729771) b!1094191))

(assert (= (and b!1094191 res!729770) b!1094194))

(assert (= (and b!1094194 res!729774) b!1094197))

(assert (= (and b!1094197 res!729767) b!1094190))

(assert (= (and b!1094198 condMapEmpty!42067) mapIsEmpty!42067))

(assert (= (and b!1094198 (not condMapEmpty!42067)) mapNonEmpty!42067))

(get-info :version)

(assert (= (and mapNonEmpty!42067 ((_ is ValueCellFull!12728) mapValue!42067)) b!1094193))

(assert (= (and b!1094198 ((_ is ValueCellFull!12728) mapDefault!42067)) b!1094196))

(assert (= start!96456 b!1094198))

(declare-fun b_lambda!17553 () Bool)

(assert (=> (not b_lambda!17553) (not b!1094190)))

(declare-fun t!33684 () Bool)

(declare-fun tb!7743 () Bool)

(assert (=> (and start!96456 (= defaultEntry!882 defaultEntry!882) t!33684) tb!7743))

(declare-fun result!16013 () Bool)

(assert (=> tb!7743 (= result!16013 tp_is_empty!26875)))

(assert (=> b!1094190 t!33684))

(declare-fun b_and!36433 () Bool)

(assert (= b_and!36431 (and (=> t!33684 result!16013) b_and!36433)))

(declare-fun m!1014341 () Bool)

(assert (=> b!1094191 m!1014341))

(declare-fun m!1014343 () Bool)

(assert (=> mapNonEmpty!42067 m!1014343))

(declare-fun m!1014345 () Bool)

(assert (=> b!1094194 m!1014345))

(declare-fun m!1014347 () Bool)

(assert (=> b!1094194 m!1014347))

(declare-fun m!1014349 () Bool)

(assert (=> b!1094195 m!1014349))

(declare-fun m!1014351 () Bool)

(assert (=> start!96456 m!1014351))

(declare-fun m!1014353 () Bool)

(assert (=> start!96456 m!1014353))

(declare-fun m!1014355 () Bool)

(assert (=> start!96456 m!1014355))

(declare-fun m!1014357 () Bool)

(assert (=> b!1094197 m!1014357))

(declare-fun m!1014359 () Bool)

(assert (=> b!1094192 m!1014359))

(declare-fun m!1014361 () Bool)

(assert (=> b!1094188 m!1014361))

(declare-fun m!1014363 () Bool)

(assert (=> b!1094190 m!1014363))

(declare-fun m!1014365 () Bool)

(assert (=> b!1094190 m!1014365))

(declare-fun m!1014367 () Bool)

(assert (=> b!1094190 m!1014367))

(declare-fun m!1014369 () Bool)

(assert (=> b!1094190 m!1014369))

(declare-fun m!1014371 () Bool)

(assert (=> b!1094190 m!1014371))

(declare-fun m!1014373 () Bool)

(assert (=> b!1094190 m!1014373))

(declare-fun m!1014375 () Bool)

(assert (=> b!1094190 m!1014375))

(declare-fun m!1014377 () Bool)

(assert (=> b!1094190 m!1014377))

(declare-fun m!1014379 () Bool)

(assert (=> b!1094190 m!1014379))

(declare-fun m!1014381 () Bool)

(assert (=> b!1094190 m!1014381))

(check-sat (not b!1094197) (not b_lambda!17553) (not b!1094188) tp_is_empty!26875 (not b_next!22873) (not b!1094192) b_and!36433 (not b!1094195) (not start!96456) (not mapNonEmpty!42067) (not b!1094194) (not b!1094190))
(check-sat b_and!36433 (not b_next!22873))
