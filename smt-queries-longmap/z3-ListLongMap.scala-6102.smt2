; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78702 () Bool)

(assert start!78702)

(declare-fun b_free!16933 () Bool)

(declare-fun b_next!16933 () Bool)

(assert (=> start!78702 (= b_free!16933 (not b_next!16933))))

(declare-fun tp!59240 () Bool)

(declare-fun b_and!27577 () Bool)

(assert (=> start!78702 (= tp!59240 b_and!27577)))

(declare-fun b!917967 () Bool)

(declare-fun e!515307 () Bool)

(declare-fun e!515311 () Bool)

(assert (=> b!917967 (= e!515307 e!515311)))

(declare-fun res!618957 () Bool)

(assert (=> b!917967 (=> (not res!618957) (not e!515311))))

(declare-datatypes ((V!30887 0))(
  ( (V!30888 (val!9771 Int)) )
))
(declare-datatypes ((tuple2!12738 0))(
  ( (tuple2!12739 (_1!6380 (_ BitVec 64)) (_2!6380 V!30887)) )
))
(declare-datatypes ((List!18527 0))(
  ( (Nil!18524) (Cons!18523 (h!19669 tuple2!12738) (t!26181 List!18527)) )
))
(declare-datatypes ((ListLongMap!11425 0))(
  ( (ListLongMap!11426 (toList!5728 List!18527)) )
))
(declare-fun lt!411945 () ListLongMap!11425)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4729 (ListLongMap!11425 (_ BitVec 64)) Bool)

(assert (=> b!917967 (= res!618957 (contains!4729 lt!411945 k0!1099))))

(declare-datatypes ((array!54849 0))(
  ( (array!54850 (arr!26370 (Array (_ BitVec 32) (_ BitVec 64))) (size!26831 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54849)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9239 0))(
  ( (ValueCellFull!9239 (v!12288 V!30887)) (EmptyCell!9239) )
))
(declare-datatypes ((array!54851 0))(
  ( (array!54852 (arr!26371 (Array (_ BitVec 32) ValueCell!9239)) (size!26832 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54851)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30887)

(declare-fun minValue!1173 () V!30887)

(declare-fun getCurrentListMap!2921 (array!54849 array!54851 (_ BitVec 32) (_ BitVec 32) V!30887 V!30887 (_ BitVec 32) Int) ListLongMap!11425)

(assert (=> b!917967 (= lt!411945 (getCurrentListMap!2921 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917968 () Bool)

(declare-fun res!618952 () Bool)

(assert (=> b!917968 (=> (not res!618952) (not e!515307))))

(assert (=> b!917968 (= res!618952 (and (= (size!26832 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26831 _keys!1487) (size!26832 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917969 () Bool)

(declare-fun e!515308 () Bool)

(declare-fun e!515309 () Bool)

(declare-fun mapRes!30918 () Bool)

(assert (=> b!917969 (= e!515308 (and e!515309 mapRes!30918))))

(declare-fun condMapEmpty!30918 () Bool)

(declare-fun mapDefault!30918 () ValueCell!9239)

(assert (=> b!917969 (= condMapEmpty!30918 (= (arr!26371 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9239)) mapDefault!30918)))))

(declare-fun res!618954 () Bool)

(assert (=> start!78702 (=> (not res!618954) (not e!515307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78702 (= res!618954 (validMask!0 mask!1881))))

(assert (=> start!78702 e!515307))

(assert (=> start!78702 true))

(declare-fun tp_is_empty!19441 () Bool)

(assert (=> start!78702 tp_is_empty!19441))

(declare-fun array_inv!20636 (array!54851) Bool)

(assert (=> start!78702 (and (array_inv!20636 _values!1231) e!515308)))

(assert (=> start!78702 tp!59240))

(declare-fun array_inv!20637 (array!54849) Bool)

(assert (=> start!78702 (array_inv!20637 _keys!1487)))

(declare-fun b!917970 () Bool)

(declare-fun res!618956 () Bool)

(assert (=> b!917970 (=> (not res!618956) (not e!515311))))

(declare-fun v!791 () V!30887)

(declare-fun apply!563 (ListLongMap!11425 (_ BitVec 64)) V!30887)

(assert (=> b!917970 (= res!618956 (= (apply!563 lt!411945 k0!1099) v!791))))

(declare-fun b!917971 () Bool)

(declare-fun e!515310 () Bool)

(assert (=> b!917971 (= e!515311 e!515310)))

(declare-fun res!618959 () Bool)

(assert (=> b!917971 (=> (not res!618959) (not e!515310))))

(declare-fun lt!411946 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917971 (= res!618959 (validKeyInArray!0 lt!411946))))

(assert (=> b!917971 (= lt!411946 (select (arr!26370 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!917972 () Bool)

(assert (=> b!917972 (= e!515310 (not (bvsle from!1844 (size!26831 _keys!1487))))))

(declare-fun +!2651 (ListLongMap!11425 tuple2!12738) ListLongMap!11425)

(declare-fun get!13824 (ValueCell!9239 V!30887) V!30887)

(declare-fun dynLambda!1407 (Int (_ BitVec 64)) V!30887)

(assert (=> b!917972 (= (getCurrentListMap!2921 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2651 (getCurrentListMap!2921 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12739 lt!411946 (get!13824 (select (arr!26371 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1407 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30914 0))(
  ( (Unit!30915) )
))
(declare-fun lt!411947 () Unit!30914)

(declare-fun lemmaListMapRecursiveValidKeyArray!15 (array!54849 array!54851 (_ BitVec 32) (_ BitVec 32) V!30887 V!30887 (_ BitVec 32) Int) Unit!30914)

(assert (=> b!917972 (= lt!411947 (lemmaListMapRecursiveValidKeyArray!15 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!917973 () Bool)

(declare-fun res!618951 () Bool)

(assert (=> b!917973 (=> (not res!618951) (not e!515311))))

(assert (=> b!917973 (= res!618951 (validKeyInArray!0 k0!1099))))

(declare-fun b!917974 () Bool)

(declare-fun e!515312 () Bool)

(assert (=> b!917974 (= e!515312 tp_is_empty!19441)))

(declare-fun mapIsEmpty!30918 () Bool)

(assert (=> mapIsEmpty!30918 mapRes!30918))

(declare-fun b!917975 () Bool)

(declare-fun res!618953 () Bool)

(assert (=> b!917975 (=> (not res!618953) (not e!515307))))

(assert (=> b!917975 (= res!618953 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26831 _keys!1487))))))

(declare-fun b!917976 () Bool)

(declare-fun res!618950 () Bool)

(assert (=> b!917976 (=> (not res!618950) (not e!515307))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54849 (_ BitVec 32)) Bool)

(assert (=> b!917976 (= res!618950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917977 () Bool)

(assert (=> b!917977 (= e!515309 tp_is_empty!19441)))

(declare-fun mapNonEmpty!30918 () Bool)

(declare-fun tp!59241 () Bool)

(assert (=> mapNonEmpty!30918 (= mapRes!30918 (and tp!59241 e!515312))))

(declare-fun mapKey!30918 () (_ BitVec 32))

(declare-fun mapValue!30918 () ValueCell!9239)

(declare-fun mapRest!30918 () (Array (_ BitVec 32) ValueCell!9239))

(assert (=> mapNonEmpty!30918 (= (arr!26371 _values!1231) (store mapRest!30918 mapKey!30918 mapValue!30918))))

(declare-fun b!917978 () Bool)

(declare-fun res!618955 () Bool)

(assert (=> b!917978 (=> (not res!618955) (not e!515307))))

(declare-datatypes ((List!18528 0))(
  ( (Nil!18525) (Cons!18524 (h!19670 (_ BitVec 64)) (t!26182 List!18528)) )
))
(declare-fun arrayNoDuplicates!0 (array!54849 (_ BitVec 32) List!18528) Bool)

(assert (=> b!917978 (= res!618955 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18525))))

(declare-fun b!917979 () Bool)

(declare-fun res!618958 () Bool)

(assert (=> b!917979 (=> (not res!618958) (not e!515311))))

(assert (=> b!917979 (= res!618958 (bvsgt from!1844 #b00000000000000000000000000000000))))

(assert (= (and start!78702 res!618954) b!917968))

(assert (= (and b!917968 res!618952) b!917976))

(assert (= (and b!917976 res!618950) b!917978))

(assert (= (and b!917978 res!618955) b!917975))

(assert (= (and b!917975 res!618953) b!917967))

(assert (= (and b!917967 res!618957) b!917970))

(assert (= (and b!917970 res!618956) b!917979))

(assert (= (and b!917979 res!618958) b!917973))

(assert (= (and b!917973 res!618951) b!917971))

(assert (= (and b!917971 res!618959) b!917972))

(assert (= (and b!917969 condMapEmpty!30918) mapIsEmpty!30918))

(assert (= (and b!917969 (not condMapEmpty!30918)) mapNonEmpty!30918))

(get-info :version)

(assert (= (and mapNonEmpty!30918 ((_ is ValueCellFull!9239) mapValue!30918)) b!917974))

(assert (= (and b!917969 ((_ is ValueCellFull!9239) mapDefault!30918)) b!917977))

(assert (= start!78702 b!917969))

(declare-fun b_lambda!13417 () Bool)

(assert (=> (not b_lambda!13417) (not b!917972)))

(declare-fun t!26180 () Bool)

(declare-fun tb!5505 () Bool)

(assert (=> (and start!78702 (= defaultEntry!1235 defaultEntry!1235) t!26180) tb!5505))

(declare-fun result!10841 () Bool)

(assert (=> tb!5505 (= result!10841 tp_is_empty!19441)))

(assert (=> b!917972 t!26180))

(declare-fun b_and!27579 () Bool)

(assert (= b_and!27577 (and (=> t!26180 result!10841) b_and!27579)))

(declare-fun m!851137 () Bool)

(assert (=> b!917972 m!851137))

(declare-fun m!851139 () Bool)

(assert (=> b!917972 m!851139))

(declare-fun m!851141 () Bool)

(assert (=> b!917972 m!851141))

(declare-fun m!851143 () Bool)

(assert (=> b!917972 m!851143))

(assert (=> b!917972 m!851141))

(assert (=> b!917972 m!851143))

(declare-fun m!851145 () Bool)

(assert (=> b!917972 m!851145))

(declare-fun m!851147 () Bool)

(assert (=> b!917972 m!851147))

(assert (=> b!917972 m!851137))

(declare-fun m!851149 () Bool)

(assert (=> b!917972 m!851149))

(declare-fun m!851151 () Bool)

(assert (=> start!78702 m!851151))

(declare-fun m!851153 () Bool)

(assert (=> start!78702 m!851153))

(declare-fun m!851155 () Bool)

(assert (=> start!78702 m!851155))

(declare-fun m!851157 () Bool)

(assert (=> b!917971 m!851157))

(declare-fun m!851159 () Bool)

(assert (=> b!917971 m!851159))

(declare-fun m!851161 () Bool)

(assert (=> b!917978 m!851161))

(declare-fun m!851163 () Bool)

(assert (=> b!917973 m!851163))

(declare-fun m!851165 () Bool)

(assert (=> b!917970 m!851165))

(declare-fun m!851167 () Bool)

(assert (=> b!917967 m!851167))

(declare-fun m!851169 () Bool)

(assert (=> b!917967 m!851169))

(declare-fun m!851171 () Bool)

(assert (=> b!917976 m!851171))

(declare-fun m!851173 () Bool)

(assert (=> mapNonEmpty!30918 m!851173))

(check-sat b_and!27579 (not b!917971) (not b!917972) (not b!917978) (not start!78702) (not b!917967) (not b!917973) (not b!917976) tp_is_empty!19441 (not b_lambda!13417) (not b_next!16933) (not b!917970) (not mapNonEmpty!30918))
(check-sat b_and!27579 (not b_next!16933))
