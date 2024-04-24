; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79592 () Bool)

(assert start!79592)

(declare-fun b_free!17611 () Bool)

(declare-fun b_next!17611 () Bool)

(assert (=> start!79592 (= b_free!17611 (not b_next!17611))))

(declare-fun tp!61278 () Bool)

(declare-fun b_and!28791 () Bool)

(assert (=> start!79592 (= tp!61278 b_and!28791)))

(declare-fun b!934414 () Bool)

(declare-fun e!524760 () Bool)

(declare-fun e!524762 () Bool)

(assert (=> b!934414 (= e!524760 e!524762)))

(declare-fun res!629109 () Bool)

(assert (=> b!934414 (=> (not res!629109) (not e!524762))))

(declare-fun lt!420799 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934414 (= res!629109 (validKeyInArray!0 lt!420799))))

(declare-datatypes ((array!56229 0))(
  ( (array!56230 (arr!27054 (Array (_ BitVec 32) (_ BitVec 64))) (size!27514 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56229)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!934414 (= lt!420799 (select (arr!27054 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!31938 () Bool)

(declare-fun mapRes!31938 () Bool)

(declare-fun tp!61277 () Bool)

(declare-fun e!524765 () Bool)

(assert (=> mapNonEmpty!31938 (= mapRes!31938 (and tp!61277 e!524765))))

(declare-datatypes ((V!31791 0))(
  ( (V!31792 (val!10110 Int)) )
))
(declare-datatypes ((ValueCell!9578 0))(
  ( (ValueCellFull!9578 (v!12626 V!31791)) (EmptyCell!9578) )
))
(declare-fun mapValue!31938 () ValueCell!9578)

(declare-datatypes ((array!56231 0))(
  ( (array!56232 (arr!27055 (Array (_ BitVec 32) ValueCell!9578)) (size!27515 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56231)

(declare-fun mapKey!31938 () (_ BitVec 32))

(declare-fun mapRest!31938 () (Array (_ BitVec 32) ValueCell!9578))

(assert (=> mapNonEmpty!31938 (= (arr!27055 _values!1231) (store mapRest!31938 mapKey!31938 mapValue!31938))))

(declare-fun mapIsEmpty!31938 () Bool)

(assert (=> mapIsEmpty!31938 mapRes!31938))

(declare-fun b!934415 () Bool)

(declare-fun tp_is_empty!20119 () Bool)

(assert (=> b!934415 (= e!524765 tp_is_empty!20119)))

(declare-fun b!934417 () Bool)

(assert (=> b!934417 (= e!524762 (not true))))

(declare-datatypes ((List!19026 0))(
  ( (Nil!19023) (Cons!19022 (h!20174 (_ BitVec 64)) (t!27173 List!19026)) )
))
(declare-fun arrayNoDuplicates!0 (array!56229 (_ BitVec 32) List!19026) Bool)

(assert (=> b!934417 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19023)))

(declare-datatypes ((Unit!31494 0))(
  ( (Unit!31495) )
))
(declare-fun lt!420798 () Unit!31494)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56229 (_ BitVec 32) (_ BitVec 32)) Unit!31494)

(assert (=> b!934417 (= lt!420798 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13242 0))(
  ( (tuple2!13243 (_1!6632 (_ BitVec 64)) (_2!6632 V!31791)) )
))
(declare-datatypes ((List!19027 0))(
  ( (Nil!19024) (Cons!19023 (h!20175 tuple2!13242) (t!27174 List!19027)) )
))
(declare-datatypes ((ListLongMap!11941 0))(
  ( (ListLongMap!11942 (toList!5986 List!19027)) )
))
(declare-fun lt!420803 () ListLongMap!11941)

(declare-fun lt!420800 () tuple2!13242)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5050 (ListLongMap!11941 (_ BitVec 64)) Bool)

(declare-fun +!2812 (ListLongMap!11941 tuple2!13242) ListLongMap!11941)

(assert (=> b!934417 (contains!5050 (+!2812 lt!420803 lt!420800) k0!1099)))

(declare-fun lt!420802 () Unit!31494)

(declare-fun lt!420804 () V!31791)

(declare-fun addStillContains!515 (ListLongMap!11941 (_ BitVec 64) V!31791 (_ BitVec 64)) Unit!31494)

(assert (=> b!934417 (= lt!420802 (addStillContains!515 lt!420803 lt!420799 lt!420804 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31791)

(declare-fun minValue!1173 () V!31791)

(declare-fun getCurrentListMap!3227 (array!56229 array!56231 (_ BitVec 32) (_ BitVec 32) V!31791 V!31791 (_ BitVec 32) Int) ListLongMap!11941)

(assert (=> b!934417 (= (getCurrentListMap!3227 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2812 (getCurrentListMap!3227 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420800))))

(assert (=> b!934417 (= lt!420800 (tuple2!13243 lt!420799 lt!420804))))

(declare-fun get!14254 (ValueCell!9578 V!31791) V!31791)

(declare-fun dynLambda!1609 (Int (_ BitVec 64)) V!31791)

(assert (=> b!934417 (= lt!420804 (get!14254 (select (arr!27055 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1609 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420801 () Unit!31494)

(declare-fun lemmaListMapRecursiveValidKeyArray!192 (array!56229 array!56231 (_ BitVec 32) (_ BitVec 32) V!31791 V!31791 (_ BitVec 32) Int) Unit!31494)

(assert (=> b!934417 (= lt!420801 (lemmaListMapRecursiveValidKeyArray!192 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!934418 () Bool)

(declare-fun e!524761 () Bool)

(assert (=> b!934418 (= e!524761 e!524760)))

(declare-fun res!629116 () Bool)

(assert (=> b!934418 (=> (not res!629116) (not e!524760))))

(assert (=> b!934418 (= res!629116 (contains!5050 lt!420803 k0!1099))))

(assert (=> b!934418 (= lt!420803 (getCurrentListMap!3227 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934419 () Bool)

(declare-fun res!629114 () Bool)

(assert (=> b!934419 (=> (not res!629114) (not e!524760))))

(assert (=> b!934419 (= res!629114 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934420 () Bool)

(declare-fun res!629113 () Bool)

(assert (=> b!934420 (=> (not res!629113) (not e!524761))))

(assert (=> b!934420 (= res!629113 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19023))))

(declare-fun b!934421 () Bool)

(declare-fun res!629111 () Bool)

(assert (=> b!934421 (=> (not res!629111) (not e!524760))))

(assert (=> b!934421 (= res!629111 (validKeyInArray!0 k0!1099))))

(declare-fun b!934422 () Bool)

(declare-fun res!629112 () Bool)

(assert (=> b!934422 (=> (not res!629112) (not e!524760))))

(declare-fun v!791 () V!31791)

(declare-fun apply!812 (ListLongMap!11941 (_ BitVec 64)) V!31791)

(assert (=> b!934422 (= res!629112 (= (apply!812 lt!420803 k0!1099) v!791))))

(declare-fun b!934423 () Bool)

(declare-fun e!524763 () Bool)

(assert (=> b!934423 (= e!524763 tp_is_empty!20119)))

(declare-fun b!934424 () Bool)

(declare-fun res!629117 () Bool)

(assert (=> b!934424 (=> (not res!629117) (not e!524761))))

(assert (=> b!934424 (= res!629117 (and (= (size!27515 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27514 _keys!1487) (size!27515 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!934416 () Bool)

(declare-fun res!629118 () Bool)

(assert (=> b!934416 (=> (not res!629118) (not e!524761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56229 (_ BitVec 32)) Bool)

(assert (=> b!934416 (= res!629118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!629110 () Bool)

(assert (=> start!79592 (=> (not res!629110) (not e!524761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79592 (= res!629110 (validMask!0 mask!1881))))

(assert (=> start!79592 e!524761))

(assert (=> start!79592 true))

(assert (=> start!79592 tp_is_empty!20119))

(declare-fun e!524764 () Bool)

(declare-fun array_inv!21146 (array!56231) Bool)

(assert (=> start!79592 (and (array_inv!21146 _values!1231) e!524764)))

(assert (=> start!79592 tp!61278))

(declare-fun array_inv!21147 (array!56229) Bool)

(assert (=> start!79592 (array_inv!21147 _keys!1487)))

(declare-fun b!934425 () Bool)

(declare-fun res!629115 () Bool)

(assert (=> b!934425 (=> (not res!629115) (not e!524761))))

(assert (=> b!934425 (= res!629115 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27514 _keys!1487))))))

(declare-fun b!934426 () Bool)

(assert (=> b!934426 (= e!524764 (and e!524763 mapRes!31938))))

(declare-fun condMapEmpty!31938 () Bool)

(declare-fun mapDefault!31938 () ValueCell!9578)

(assert (=> b!934426 (= condMapEmpty!31938 (= (arr!27055 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9578)) mapDefault!31938)))))

(assert (= (and start!79592 res!629110) b!934424))

(assert (= (and b!934424 res!629117) b!934416))

(assert (= (and b!934416 res!629118) b!934420))

(assert (= (and b!934420 res!629113) b!934425))

(assert (= (and b!934425 res!629115) b!934418))

(assert (= (and b!934418 res!629116) b!934422))

(assert (= (and b!934422 res!629112) b!934419))

(assert (= (and b!934419 res!629114) b!934421))

(assert (= (and b!934421 res!629111) b!934414))

(assert (= (and b!934414 res!629109) b!934417))

(assert (= (and b!934426 condMapEmpty!31938) mapIsEmpty!31938))

(assert (= (and b!934426 (not condMapEmpty!31938)) mapNonEmpty!31938))

(get-info :version)

(assert (= (and mapNonEmpty!31938 ((_ is ValueCellFull!9578) mapValue!31938)) b!934415))

(assert (= (and b!934426 ((_ is ValueCellFull!9578) mapDefault!31938)) b!934423))

(assert (= start!79592 b!934426))

(declare-fun b_lambda!13959 () Bool)

(assert (=> (not b_lambda!13959) (not b!934417)))

(declare-fun t!27172 () Bool)

(declare-fun tb!5997 () Bool)

(assert (=> (and start!79592 (= defaultEntry!1235 defaultEntry!1235) t!27172) tb!5997))

(declare-fun result!11827 () Bool)

(assert (=> tb!5997 (= result!11827 tp_is_empty!20119)))

(assert (=> b!934417 t!27172))

(declare-fun b_and!28793 () Bool)

(assert (= b_and!28791 (and (=> t!27172 result!11827) b_and!28793)))

(declare-fun m!868949 () Bool)

(assert (=> b!934414 m!868949))

(declare-fun m!868951 () Bool)

(assert (=> b!934414 m!868951))

(declare-fun m!868953 () Bool)

(assert (=> b!934422 m!868953))

(declare-fun m!868955 () Bool)

(assert (=> b!934417 m!868955))

(declare-fun m!868957 () Bool)

(assert (=> b!934417 m!868957))

(declare-fun m!868959 () Bool)

(assert (=> b!934417 m!868959))

(declare-fun m!868961 () Bool)

(assert (=> b!934417 m!868961))

(declare-fun m!868963 () Bool)

(assert (=> b!934417 m!868963))

(assert (=> b!934417 m!868959))

(declare-fun m!868965 () Bool)

(assert (=> b!934417 m!868965))

(declare-fun m!868967 () Bool)

(assert (=> b!934417 m!868967))

(declare-fun m!868969 () Bool)

(assert (=> b!934417 m!868969))

(declare-fun m!868971 () Bool)

(assert (=> b!934417 m!868971))

(assert (=> b!934417 m!868965))

(declare-fun m!868973 () Bool)

(assert (=> b!934417 m!868973))

(assert (=> b!934417 m!868955))

(declare-fun m!868975 () Bool)

(assert (=> b!934417 m!868975))

(declare-fun m!868977 () Bool)

(assert (=> b!934417 m!868977))

(assert (=> b!934417 m!868961))

(declare-fun m!868979 () Bool)

(assert (=> b!934421 m!868979))

(declare-fun m!868981 () Bool)

(assert (=> start!79592 m!868981))

(declare-fun m!868983 () Bool)

(assert (=> start!79592 m!868983))

(declare-fun m!868985 () Bool)

(assert (=> start!79592 m!868985))

(declare-fun m!868987 () Bool)

(assert (=> mapNonEmpty!31938 m!868987))

(declare-fun m!868989 () Bool)

(assert (=> b!934418 m!868989))

(declare-fun m!868991 () Bool)

(assert (=> b!934418 m!868991))

(declare-fun m!868993 () Bool)

(assert (=> b!934420 m!868993))

(declare-fun m!868995 () Bool)

(assert (=> b!934416 m!868995))

(check-sat (not b_next!17611) (not b!934418) (not b!934414) (not start!79592) (not b!934420) b_and!28793 (not b!934421) (not b!934422) (not b!934417) tp_is_empty!20119 (not mapNonEmpty!31938) (not b_lambda!13959) (not b!934416))
(check-sat b_and!28793 (not b_next!17611))
