; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95902 () Bool)

(assert start!95902)

(declare-fun b_free!22561 () Bool)

(declare-fun b_next!22561 () Bool)

(assert (=> start!95902 (= b_free!22561 (not b_next!22561))))

(declare-fun tp!79532 () Bool)

(declare-fun b_and!35771 () Bool)

(assert (=> start!95902 (= tp!79532 b_and!35771)))

(declare-fun res!724109 () Bool)

(declare-fun e!620330 () Bool)

(assert (=> start!95902 (=> (not res!724109) (not e!620330))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95902 (= res!724109 (validMask!0 mask!1414))))

(assert (=> start!95902 e!620330))

(assert (=> start!95902 tp!79532))

(assert (=> start!95902 true))

(declare-fun tp_is_empty!26563 () Bool)

(assert (=> start!95902 tp_is_empty!26563))

(declare-datatypes ((array!69984 0))(
  ( (array!69985 (arr!33666 (Array (_ BitVec 32) (_ BitVec 64))) (size!34204 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69984)

(declare-fun array_inv!26016 (array!69984) Bool)

(assert (=> start!95902 (array_inv!26016 _keys!1070)))

(declare-datatypes ((V!40545 0))(
  ( (V!40546 (val!13338 Int)) )
))
(declare-datatypes ((ValueCell!12572 0))(
  ( (ValueCellFull!12572 (v!15958 V!40545)) (EmptyCell!12572) )
))
(declare-datatypes ((array!69986 0))(
  ( (array!69987 (arr!33667 (Array (_ BitVec 32) ValueCell!12572)) (size!34205 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69986)

(declare-fun e!620327 () Bool)

(declare-fun array_inv!26017 (array!69986) Bool)

(assert (=> start!95902 (and (array_inv!26017 _values!874) e!620327)))

(declare-fun mapIsEmpty!41599 () Bool)

(declare-fun mapRes!41599 () Bool)

(assert (=> mapIsEmpty!41599 mapRes!41599))

(declare-fun b!1085920 () Bool)

(declare-fun e!620333 () Bool)

(assert (=> b!1085920 (= e!620333 tp_is_empty!26563)))

(declare-fun b!1085921 () Bool)

(assert (=> b!1085921 (= e!620327 (and e!620333 mapRes!41599))))

(declare-fun condMapEmpty!41599 () Bool)

(declare-fun mapDefault!41599 () ValueCell!12572)

(assert (=> b!1085921 (= condMapEmpty!41599 (= (arr!33667 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12572)) mapDefault!41599)))))

(declare-fun b!1085922 () Bool)

(declare-fun res!724106 () Bool)

(assert (=> b!1085922 (=> (not res!724106) (not e!620330))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085922 (= res!724106 (and (= (size!34205 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34204 _keys!1070) (size!34205 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085923 () Bool)

(declare-fun res!724112 () Bool)

(assert (=> b!1085923 (=> (not res!724112) (not e!620330))))

(declare-datatypes ((List!23542 0))(
  ( (Nil!23539) (Cons!23538 (h!24747 (_ BitVec 64)) (t!33152 List!23542)) )
))
(declare-fun arrayNoDuplicates!0 (array!69984 (_ BitVec 32) List!23542) Bool)

(assert (=> b!1085923 (= res!724112 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23539))))

(declare-fun b!1085924 () Bool)

(declare-fun e!620326 () Bool)

(assert (=> b!1085924 (= e!620326 true)))

(declare-datatypes ((tuple2!16970 0))(
  ( (tuple2!16971 (_1!8496 (_ BitVec 64)) (_2!8496 V!40545)) )
))
(declare-datatypes ((List!23543 0))(
  ( (Nil!23540) (Cons!23539 (h!24748 tuple2!16970) (t!33153 List!23543)) )
))
(declare-datatypes ((ListLongMap!14939 0))(
  ( (ListLongMap!14940 (toList!7485 List!23543)) )
))
(declare-fun lt!482218 () ListLongMap!14939)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!482228 () tuple2!16970)

(declare-fun lt!482227 () ListLongMap!14939)

(declare-fun -!764 (ListLongMap!14939 (_ BitVec 64)) ListLongMap!14939)

(declare-fun +!3293 (ListLongMap!14939 tuple2!16970) ListLongMap!14939)

(assert (=> b!1085924 (= (-!764 lt!482227 k0!904) (+!3293 lt!482218 lt!482228))))

(declare-fun minValue!831 () V!40545)

(declare-datatypes ((Unit!35563 0))(
  ( (Unit!35564) )
))
(declare-fun lt!482225 () Unit!35563)

(declare-fun lt!482224 () ListLongMap!14939)

(declare-fun addRemoveCommutativeForDiffKeys!22 (ListLongMap!14939 (_ BitVec 64) V!40545 (_ BitVec 64)) Unit!35563)

(assert (=> b!1085924 (= lt!482225 (addRemoveCommutativeForDiffKeys!22 lt!482224 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1085925 () Bool)

(declare-fun res!724104 () Bool)

(assert (=> b!1085925 (=> (not res!724104) (not e!620330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69984 (_ BitVec 32)) Bool)

(assert (=> b!1085925 (= res!724104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41599 () Bool)

(declare-fun tp!79531 () Bool)

(declare-fun e!620331 () Bool)

(assert (=> mapNonEmpty!41599 (= mapRes!41599 (and tp!79531 e!620331))))

(declare-fun mapValue!41599 () ValueCell!12572)

(declare-fun mapRest!41599 () (Array (_ BitVec 32) ValueCell!12572))

(declare-fun mapKey!41599 () (_ BitVec 32))

(assert (=> mapNonEmpty!41599 (= (arr!33667 _values!874) (store mapRest!41599 mapKey!41599 mapValue!41599))))

(declare-fun b!1085926 () Bool)

(declare-fun res!724110 () Bool)

(declare-fun e!620332 () Bool)

(assert (=> b!1085926 (=> (not res!724110) (not e!620332))))

(declare-fun lt!482230 () array!69984)

(assert (=> b!1085926 (= res!724110 (arrayNoDuplicates!0 lt!482230 #b00000000000000000000000000000000 Nil!23539))))

(declare-fun b!1085927 () Bool)

(declare-fun e!620329 () Bool)

(assert (=> b!1085927 (= e!620332 (not e!620329))))

(declare-fun res!724111 () Bool)

(assert (=> b!1085927 (=> res!724111 e!620329)))

(assert (=> b!1085927 (= res!724111 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40545)

(declare-fun lt!482221 () ListLongMap!14939)

(declare-fun getCurrentListMap!4173 (array!69984 array!69986 (_ BitVec 32) (_ BitVec 32) V!40545 V!40545 (_ BitVec 32) Int) ListLongMap!14939)

(assert (=> b!1085927 (= lt!482221 (getCurrentListMap!4173 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482233 () array!69986)

(declare-fun lt!482229 () ListLongMap!14939)

(assert (=> b!1085927 (= lt!482229 (getCurrentListMap!4173 lt!482230 lt!482233 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482226 () ListLongMap!14939)

(declare-fun lt!482234 () ListLongMap!14939)

(assert (=> b!1085927 (and (= lt!482226 lt!482234) (= lt!482234 lt!482226))))

(declare-fun lt!482219 () ListLongMap!14939)

(assert (=> b!1085927 (= lt!482234 (-!764 lt!482219 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!482220 () Unit!35563)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!57 (array!69984 array!69986 (_ BitVec 32) (_ BitVec 32) V!40545 V!40545 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35563)

(assert (=> b!1085927 (= lt!482220 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!57 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4043 (array!69984 array!69986 (_ BitVec 32) (_ BitVec 32) V!40545 V!40545 (_ BitVec 32) Int) ListLongMap!14939)

(assert (=> b!1085927 (= lt!482226 (getCurrentListMapNoExtraKeys!4043 lt!482230 lt!482233 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2114 (Int (_ BitVec 64)) V!40545)

(assert (=> b!1085927 (= lt!482233 (array!69987 (store (arr!33667 _values!874) i!650 (ValueCellFull!12572 (dynLambda!2114 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34205 _values!874)))))

(assert (=> b!1085927 (= lt!482219 (getCurrentListMapNoExtraKeys!4043 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69984 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085927 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482222 () Unit!35563)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69984 (_ BitVec 64) (_ BitVec 32)) Unit!35563)

(assert (=> b!1085927 (= lt!482222 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085928 () Bool)

(assert (=> b!1085928 (= e!620329 e!620326)))

(declare-fun res!724103 () Bool)

(assert (=> b!1085928 (=> res!724103 e!620326)))

(assert (=> b!1085928 (= res!724103 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!482232 () ListLongMap!14939)

(assert (=> b!1085928 (= lt!482218 lt!482232)))

(assert (=> b!1085928 (= lt!482218 (-!764 lt!482224 k0!904))))

(declare-fun lt!482223 () Unit!35563)

(assert (=> b!1085928 (= lt!482223 (addRemoveCommutativeForDiffKeys!22 lt!482219 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1085928 (= lt!482229 (+!3293 lt!482232 lt!482228))))

(declare-fun lt!482231 () tuple2!16970)

(assert (=> b!1085928 (= lt!482232 (+!3293 lt!482234 lt!482231))))

(assert (=> b!1085928 (= lt!482221 lt!482227)))

(assert (=> b!1085928 (= lt!482227 (+!3293 lt!482224 lt!482228))))

(assert (=> b!1085928 (= lt!482224 (+!3293 lt!482219 lt!482231))))

(assert (=> b!1085928 (= lt!482229 (+!3293 (+!3293 lt!482226 lt!482231) lt!482228))))

(assert (=> b!1085928 (= lt!482228 (tuple2!16971 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085928 (= lt!482231 (tuple2!16971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085929 () Bool)

(declare-fun res!724113 () Bool)

(assert (=> b!1085929 (=> (not res!724113) (not e!620330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085929 (= res!724113 (validKeyInArray!0 k0!904))))

(declare-fun b!1085930 () Bool)

(declare-fun res!724105 () Bool)

(assert (=> b!1085930 (=> (not res!724105) (not e!620330))))

(assert (=> b!1085930 (= res!724105 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34204 _keys!1070))))))

(declare-fun b!1085931 () Bool)

(assert (=> b!1085931 (= e!620331 tp_is_empty!26563)))

(declare-fun b!1085932 () Bool)

(assert (=> b!1085932 (= e!620330 e!620332)))

(declare-fun res!724107 () Bool)

(assert (=> b!1085932 (=> (not res!724107) (not e!620332))))

(assert (=> b!1085932 (= res!724107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482230 mask!1414))))

(assert (=> b!1085932 (= lt!482230 (array!69985 (store (arr!33666 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34204 _keys!1070)))))

(declare-fun b!1085933 () Bool)

(declare-fun res!724108 () Bool)

(assert (=> b!1085933 (=> (not res!724108) (not e!620330))))

(assert (=> b!1085933 (= res!724108 (= (select (arr!33666 _keys!1070) i!650) k0!904))))

(assert (= (and start!95902 res!724109) b!1085922))

(assert (= (and b!1085922 res!724106) b!1085925))

(assert (= (and b!1085925 res!724104) b!1085923))

(assert (= (and b!1085923 res!724112) b!1085930))

(assert (= (and b!1085930 res!724105) b!1085929))

(assert (= (and b!1085929 res!724113) b!1085933))

(assert (= (and b!1085933 res!724108) b!1085932))

(assert (= (and b!1085932 res!724107) b!1085926))

(assert (= (and b!1085926 res!724110) b!1085927))

(assert (= (and b!1085927 (not res!724111)) b!1085928))

(assert (= (and b!1085928 (not res!724103)) b!1085924))

(assert (= (and b!1085921 condMapEmpty!41599) mapIsEmpty!41599))

(assert (= (and b!1085921 (not condMapEmpty!41599)) mapNonEmpty!41599))

(get-info :version)

(assert (= (and mapNonEmpty!41599 ((_ is ValueCellFull!12572) mapValue!41599)) b!1085931))

(assert (= (and b!1085921 ((_ is ValueCellFull!12572) mapDefault!41599)) b!1085920))

(assert (= start!95902 b!1085921))

(declare-fun b_lambda!17209 () Bool)

(assert (=> (not b_lambda!17209) (not b!1085927)))

(declare-fun t!33151 () Bool)

(declare-fun tb!7431 () Bool)

(assert (=> (and start!95902 (= defaultEntry!882 defaultEntry!882) t!33151) tb!7431))

(declare-fun result!15389 () Bool)

(assert (=> tb!7431 (= result!15389 tp_is_empty!26563)))

(assert (=> b!1085927 t!33151))

(declare-fun b_and!35773 () Bool)

(assert (= b_and!35771 (and (=> t!33151 result!15389) b_and!35773)))

(declare-fun m!1003781 () Bool)

(assert (=> b!1085926 m!1003781))

(declare-fun m!1003783 () Bool)

(assert (=> b!1085927 m!1003783))

(declare-fun m!1003785 () Bool)

(assert (=> b!1085927 m!1003785))

(declare-fun m!1003787 () Bool)

(assert (=> b!1085927 m!1003787))

(declare-fun m!1003789 () Bool)

(assert (=> b!1085927 m!1003789))

(declare-fun m!1003791 () Bool)

(assert (=> b!1085927 m!1003791))

(declare-fun m!1003793 () Bool)

(assert (=> b!1085927 m!1003793))

(declare-fun m!1003795 () Bool)

(assert (=> b!1085927 m!1003795))

(declare-fun m!1003797 () Bool)

(assert (=> b!1085927 m!1003797))

(declare-fun m!1003799 () Bool)

(assert (=> b!1085927 m!1003799))

(declare-fun m!1003801 () Bool)

(assert (=> b!1085927 m!1003801))

(declare-fun m!1003803 () Bool)

(assert (=> b!1085929 m!1003803))

(declare-fun m!1003805 () Bool)

(assert (=> start!95902 m!1003805))

(declare-fun m!1003807 () Bool)

(assert (=> start!95902 m!1003807))

(declare-fun m!1003809 () Bool)

(assert (=> start!95902 m!1003809))

(declare-fun m!1003811 () Bool)

(assert (=> mapNonEmpty!41599 m!1003811))

(declare-fun m!1003813 () Bool)

(assert (=> b!1085923 m!1003813))

(declare-fun m!1003815 () Bool)

(assert (=> b!1085924 m!1003815))

(declare-fun m!1003817 () Bool)

(assert (=> b!1085924 m!1003817))

(declare-fun m!1003819 () Bool)

(assert (=> b!1085924 m!1003819))

(declare-fun m!1003821 () Bool)

(assert (=> b!1085933 m!1003821))

(declare-fun m!1003823 () Bool)

(assert (=> b!1085925 m!1003823))

(declare-fun m!1003825 () Bool)

(assert (=> b!1085928 m!1003825))

(declare-fun m!1003827 () Bool)

(assert (=> b!1085928 m!1003827))

(declare-fun m!1003829 () Bool)

(assert (=> b!1085928 m!1003829))

(declare-fun m!1003831 () Bool)

(assert (=> b!1085928 m!1003831))

(declare-fun m!1003833 () Bool)

(assert (=> b!1085928 m!1003833))

(declare-fun m!1003835 () Bool)

(assert (=> b!1085928 m!1003835))

(assert (=> b!1085928 m!1003831))

(declare-fun m!1003837 () Bool)

(assert (=> b!1085928 m!1003837))

(declare-fun m!1003839 () Bool)

(assert (=> b!1085928 m!1003839))

(declare-fun m!1003841 () Bool)

(assert (=> b!1085932 m!1003841))

(declare-fun m!1003843 () Bool)

(assert (=> b!1085932 m!1003843))

(check-sat (not b_next!22561) (not b!1085923) (not b!1085932) b_and!35773 (not start!95902) (not b!1085927) tp_is_empty!26563 (not b_lambda!17209) (not b!1085926) (not b!1085925) (not b!1085928) (not b!1085924) (not b!1085929) (not mapNonEmpty!41599))
(check-sat b_and!35773 (not b_next!22561))
