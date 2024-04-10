; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78722 () Bool)

(assert start!78722)

(declare-fun b_free!16935 () Bool)

(declare-fun b_next!16935 () Bool)

(assert (=> start!78722 (= b_free!16935 (not b_next!16935))))

(declare-fun tp!59246 () Bool)

(declare-fun b_and!27607 () Bool)

(assert (=> start!78722 (= tp!59246 b_and!27607)))

(declare-fun b!918247 () Bool)

(declare-fun res!619090 () Bool)

(declare-fun e!515482 () Bool)

(assert (=> b!918247 (=> (not res!619090) (not e!515482))))

(declare-datatypes ((array!54870 0))(
  ( (array!54871 (arr!26380 (Array (_ BitVec 32) (_ BitVec 64))) (size!26839 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54870)

(declare-datatypes ((List!18502 0))(
  ( (Nil!18499) (Cons!18498 (h!19644 (_ BitVec 64)) (t!26167 List!18502)) )
))
(declare-fun arrayNoDuplicates!0 (array!54870 (_ BitVec 32) List!18502) Bool)

(assert (=> b!918247 (= res!619090 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18499))))

(declare-fun b!918248 () Bool)

(declare-fun e!515479 () Bool)

(declare-fun tp_is_empty!19443 () Bool)

(assert (=> b!918248 (= e!515479 tp_is_empty!19443)))

(declare-fun b!918249 () Bool)

(declare-fun res!619092 () Bool)

(assert (=> b!918249 (=> (not res!619092) (not e!515482))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30889 0))(
  ( (V!30890 (val!9772 Int)) )
))
(declare-datatypes ((ValueCell!9240 0))(
  ( (ValueCellFull!9240 (v!12290 V!30889)) (EmptyCell!9240) )
))
(declare-datatypes ((array!54872 0))(
  ( (array!54873 (arr!26381 (Array (_ BitVec 32) ValueCell!9240)) (size!26840 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54872)

(assert (=> b!918249 (= res!619092 (and (= (size!26840 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26839 _keys!1487) (size!26840 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918250 () Bool)

(declare-fun res!619097 () Bool)

(declare-fun e!515478 () Bool)

(assert (=> b!918250 (=> (not res!619097) (not e!515478))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!30889)

(declare-datatypes ((tuple2!12696 0))(
  ( (tuple2!12697 (_1!6359 (_ BitVec 64)) (_2!6359 V!30889)) )
))
(declare-datatypes ((List!18503 0))(
  ( (Nil!18500) (Cons!18499 (h!19645 tuple2!12696) (t!26168 List!18503)) )
))
(declare-datatypes ((ListLongMap!11393 0))(
  ( (ListLongMap!11394 (toList!5712 List!18503)) )
))
(declare-fun lt!412191 () ListLongMap!11393)

(declare-fun apply!561 (ListLongMap!11393 (_ BitVec 64)) V!30889)

(assert (=> b!918250 (= res!619097 (= (apply!561 lt!412191 k0!1099) v!791))))

(declare-fun b!918251 () Bool)

(declare-fun e!515477 () Bool)

(assert (=> b!918251 (= e!515477 tp_is_empty!19443)))

(declare-fun b!918252 () Bool)

(declare-fun e!515480 () Bool)

(declare-fun mapRes!30921 () Bool)

(assert (=> b!918252 (= e!515480 (and e!515477 mapRes!30921))))

(declare-fun condMapEmpty!30921 () Bool)

(declare-fun mapDefault!30921 () ValueCell!9240)

(assert (=> b!918252 (= condMapEmpty!30921 (= (arr!26381 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9240)) mapDefault!30921)))))

(declare-fun b!918253 () Bool)

(declare-fun res!619091 () Bool)

(assert (=> b!918253 (=> (not res!619091) (not e!515478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918253 (= res!619091 (validKeyInArray!0 k0!1099))))

(declare-fun b!918254 () Bool)

(declare-fun e!515476 () Bool)

(assert (=> b!918254 (= e!515478 e!515476)))

(declare-fun res!619095 () Bool)

(assert (=> b!918254 (=> (not res!619095) (not e!515476))))

(declare-fun lt!412190 () (_ BitVec 64))

(assert (=> b!918254 (= res!619095 (validKeyInArray!0 lt!412190))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918254 (= lt!412190 (select (arr!26380 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!619093 () Bool)

(assert (=> start!78722 (=> (not res!619093) (not e!515482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78722 (= res!619093 (validMask!0 mask!1881))))

(assert (=> start!78722 e!515482))

(assert (=> start!78722 true))

(assert (=> start!78722 tp_is_empty!19443))

(declare-fun array_inv!20570 (array!54872) Bool)

(assert (=> start!78722 (and (array_inv!20570 _values!1231) e!515480)))

(assert (=> start!78722 tp!59246))

(declare-fun array_inv!20571 (array!54870) Bool)

(assert (=> start!78722 (array_inv!20571 _keys!1487)))

(declare-fun b!918255 () Bool)

(declare-fun res!619098 () Bool)

(assert (=> b!918255 (=> (not res!619098) (not e!515482))))

(assert (=> b!918255 (= res!619098 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26839 _keys!1487))))))

(declare-fun b!918256 () Bool)

(declare-fun res!619096 () Bool)

(assert (=> b!918256 (=> (not res!619096) (not e!515482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54870 (_ BitVec 32)) Bool)

(assert (=> b!918256 (= res!619096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!30921 () Bool)

(assert (=> mapIsEmpty!30921 mapRes!30921))

(declare-fun mapNonEmpty!30921 () Bool)

(declare-fun tp!59245 () Bool)

(assert (=> mapNonEmpty!30921 (= mapRes!30921 (and tp!59245 e!515479))))

(declare-fun mapKey!30921 () (_ BitVec 32))

(declare-fun mapValue!30921 () ValueCell!9240)

(declare-fun mapRest!30921 () (Array (_ BitVec 32) ValueCell!9240))

(assert (=> mapNonEmpty!30921 (= (arr!26381 _values!1231) (store mapRest!30921 mapKey!30921 mapValue!30921))))

(declare-fun b!918257 () Bool)

(declare-fun res!619094 () Bool)

(assert (=> b!918257 (=> (not res!619094) (not e!515478))))

(assert (=> b!918257 (= res!619094 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918258 () Bool)

(assert (=> b!918258 (= e!515482 e!515478)))

(declare-fun res!619099 () Bool)

(assert (=> b!918258 (=> (not res!619099) (not e!515478))))

(declare-fun contains!4760 (ListLongMap!11393 (_ BitVec 64)) Bool)

(assert (=> b!918258 (= res!619099 (contains!4760 lt!412191 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30889)

(declare-fun minValue!1173 () V!30889)

(declare-fun getCurrentListMap!2969 (array!54870 array!54872 (_ BitVec 32) (_ BitVec 32) V!30889 V!30889 (_ BitVec 32) Int) ListLongMap!11393)

(assert (=> b!918258 (= lt!412191 (getCurrentListMap!2969 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!918259 () Bool)

(assert (=> b!918259 (= e!515476 (not (bvsle from!1844 (size!26839 _keys!1487))))))

(declare-fun +!2625 (ListLongMap!11393 tuple2!12696) ListLongMap!11393)

(declare-fun get!13826 (ValueCell!9240 V!30889) V!30889)

(declare-fun dynLambda!1414 (Int (_ BitVec 64)) V!30889)

(assert (=> b!918259 (= (getCurrentListMap!2969 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2625 (getCurrentListMap!2969 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12697 lt!412190 (get!13826 (select (arr!26381 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1414 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30998 0))(
  ( (Unit!30999) )
))
(declare-fun lt!412192 () Unit!30998)

(declare-fun lemmaListMapRecursiveValidKeyArray!15 (array!54870 array!54872 (_ BitVec 32) (_ BitVec 32) V!30889 V!30889 (_ BitVec 32) Int) Unit!30998)

(assert (=> b!918259 (= lt!412192 (lemmaListMapRecursiveValidKeyArray!15 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!78722 res!619093) b!918249))

(assert (= (and b!918249 res!619092) b!918256))

(assert (= (and b!918256 res!619096) b!918247))

(assert (= (and b!918247 res!619090) b!918255))

(assert (= (and b!918255 res!619098) b!918258))

(assert (= (and b!918258 res!619099) b!918250))

(assert (= (and b!918250 res!619097) b!918257))

(assert (= (and b!918257 res!619094) b!918253))

(assert (= (and b!918253 res!619091) b!918254))

(assert (= (and b!918254 res!619095) b!918259))

(assert (= (and b!918252 condMapEmpty!30921) mapIsEmpty!30921))

(assert (= (and b!918252 (not condMapEmpty!30921)) mapNonEmpty!30921))

(get-info :version)

(assert (= (and mapNonEmpty!30921 ((_ is ValueCellFull!9240) mapValue!30921)) b!918248))

(assert (= (and b!918252 ((_ is ValueCellFull!9240) mapDefault!30921)) b!918251))

(assert (= start!78722 b!918252))

(declare-fun b_lambda!13437 () Bool)

(assert (=> (not b_lambda!13437) (not b!918259)))

(declare-fun t!26166 () Bool)

(declare-fun tb!5515 () Bool)

(assert (=> (and start!78722 (= defaultEntry!1235 defaultEntry!1235) t!26166) tb!5515))

(declare-fun result!10853 () Bool)

(assert (=> tb!5515 (= result!10853 tp_is_empty!19443)))

(assert (=> b!918259 t!26166))

(declare-fun b_and!27609 () Bool)

(assert (= b_and!27607 (and (=> t!26166 result!10853) b_and!27609)))

(declare-fun m!851933 () Bool)

(assert (=> b!918256 m!851933))

(declare-fun m!851935 () Bool)

(assert (=> b!918247 m!851935))

(declare-fun m!851937 () Bool)

(assert (=> b!918258 m!851937))

(declare-fun m!851939 () Bool)

(assert (=> b!918258 m!851939))

(declare-fun m!851941 () Bool)

(assert (=> b!918254 m!851941))

(declare-fun m!851943 () Bool)

(assert (=> b!918254 m!851943))

(declare-fun m!851945 () Bool)

(assert (=> mapNonEmpty!30921 m!851945))

(declare-fun m!851947 () Bool)

(assert (=> start!78722 m!851947))

(declare-fun m!851949 () Bool)

(assert (=> start!78722 m!851949))

(declare-fun m!851951 () Bool)

(assert (=> start!78722 m!851951))

(declare-fun m!851953 () Bool)

(assert (=> b!918250 m!851953))

(declare-fun m!851955 () Bool)

(assert (=> b!918259 m!851955))

(declare-fun m!851957 () Bool)

(assert (=> b!918259 m!851957))

(declare-fun m!851959 () Bool)

(assert (=> b!918259 m!851959))

(declare-fun m!851961 () Bool)

(assert (=> b!918259 m!851961))

(declare-fun m!851963 () Bool)

(assert (=> b!918259 m!851963))

(assert (=> b!918259 m!851961))

(declare-fun m!851965 () Bool)

(assert (=> b!918259 m!851965))

(assert (=> b!918259 m!851955))

(assert (=> b!918259 m!851957))

(declare-fun m!851967 () Bool)

(assert (=> b!918259 m!851967))

(declare-fun m!851969 () Bool)

(assert (=> b!918253 m!851969))

(check-sat (not b!918247) (not start!78722) (not b!918250) (not b!918253) (not b!918258) (not b_lambda!13437) (not b!918254) (not b!918259) b_and!27609 (not mapNonEmpty!30921) tp_is_empty!19443 (not b!918256) (not b_next!16935))
(check-sat b_and!27609 (not b_next!16935))
