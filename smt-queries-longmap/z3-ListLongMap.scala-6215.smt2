; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79406 () Bool)

(assert start!79406)

(declare-fun b_free!17611 () Bool)

(declare-fun b_next!17611 () Bool)

(assert (=> start!79406 (= b_free!17611 (not b_next!17611))))

(declare-fun tp!61277 () Bool)

(declare-fun b_and!28755 () Bool)

(assert (=> start!79406 (= tp!61277 b_and!28755)))

(declare-fun b!933272 () Bool)

(declare-fun e!524031 () Bool)

(declare-fun tp_is_empty!20119 () Bool)

(assert (=> b!933272 (= e!524031 tp_is_empty!20119)))

(declare-fun mapIsEmpty!31938 () Bool)

(declare-fun mapRes!31938 () Bool)

(assert (=> mapIsEmpty!31938 mapRes!31938))

(declare-fun b!933273 () Bool)

(declare-fun e!524034 () Bool)

(assert (=> b!933273 (= e!524034 (not true))))

(declare-datatypes ((array!56139 0))(
  ( (array!56140 (arr!27014 (Array (_ BitVec 32) (_ BitVec 64))) (size!27475 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56139)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!19060 0))(
  ( (Nil!19057) (Cons!19056 (h!20202 (_ BitVec 64)) (t!27206 List!19060)) )
))
(declare-fun arrayNoDuplicates!0 (array!56139 (_ BitVec 32) List!19060) Bool)

(assert (=> b!933273 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19057)))

(declare-datatypes ((Unit!31412 0))(
  ( (Unit!31413) )
))
(declare-fun lt!420203 () Unit!31412)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56139 (_ BitVec 32) (_ BitVec 32)) Unit!31412)

(assert (=> b!933273 (= lt!420203 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!31791 0))(
  ( (V!31792 (val!10110 Int)) )
))
(declare-datatypes ((tuple2!13310 0))(
  ( (tuple2!13311 (_1!6666 (_ BitVec 64)) (_2!6666 V!31791)) )
))
(declare-datatypes ((List!19061 0))(
  ( (Nil!19058) (Cons!19057 (h!20203 tuple2!13310) (t!27207 List!19061)) )
))
(declare-datatypes ((ListLongMap!11997 0))(
  ( (ListLongMap!11998 (toList!6014 List!19061)) )
))
(declare-fun lt!420205 () ListLongMap!11997)

(declare-fun lt!420206 () tuple2!13310)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5011 (ListLongMap!11997 (_ BitVec 64)) Bool)

(declare-fun +!2821 (ListLongMap!11997 tuple2!13310) ListLongMap!11997)

(assert (=> b!933273 (contains!5011 (+!2821 lt!420205 lt!420206) k0!1099)))

(declare-fun lt!420204 () (_ BitVec 64))

(declare-fun lt!420207 () V!31791)

(declare-fun lt!420201 () Unit!31412)

(declare-fun addStillContains!510 (ListLongMap!11997 (_ BitVec 64) V!31791 (_ BitVec 64)) Unit!31412)

(assert (=> b!933273 (= lt!420201 (addStillContains!510 lt!420205 lt!420204 lt!420207 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9578 0))(
  ( (ValueCellFull!9578 (v!12628 V!31791)) (EmptyCell!9578) )
))
(declare-datatypes ((array!56141 0))(
  ( (array!56142 (arr!27015 (Array (_ BitVec 32) ValueCell!9578)) (size!27476 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56141)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31791)

(declare-fun minValue!1173 () V!31791)

(declare-fun getCurrentListMap!3186 (array!56139 array!56141 (_ BitVec 32) (_ BitVec 32) V!31791 V!31791 (_ BitVec 32) Int) ListLongMap!11997)

(assert (=> b!933273 (= (getCurrentListMap!3186 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2821 (getCurrentListMap!3186 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420206))))

(assert (=> b!933273 (= lt!420206 (tuple2!13311 lt!420204 lt!420207))))

(declare-fun get!14223 (ValueCell!9578 V!31791) V!31791)

(declare-fun dynLambda!1577 (Int (_ BitVec 64)) V!31791)

(assert (=> b!933273 (= lt!420207 (get!14223 (select (arr!27015 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1577 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420202 () Unit!31412)

(declare-fun lemmaListMapRecursiveValidKeyArray!185 (array!56139 array!56141 (_ BitVec 32) (_ BitVec 32) V!31791 V!31791 (_ BitVec 32) Int) Unit!31412)

(assert (=> b!933273 (= lt!420202 (lemmaListMapRecursiveValidKeyArray!185 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933274 () Bool)

(declare-fun res!628660 () Bool)

(declare-fun e!524032 () Bool)

(assert (=> b!933274 (=> (not res!628660) (not e!524032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933274 (= res!628660 (validKeyInArray!0 k0!1099))))

(declare-fun res!628657 () Bool)

(declare-fun e!524033 () Bool)

(assert (=> start!79406 (=> (not res!628657) (not e!524033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79406 (= res!628657 (validMask!0 mask!1881))))

(assert (=> start!79406 e!524033))

(assert (=> start!79406 true))

(assert (=> start!79406 tp_is_empty!20119))

(declare-fun e!524030 () Bool)

(declare-fun array_inv!21094 (array!56141) Bool)

(assert (=> start!79406 (and (array_inv!21094 _values!1231) e!524030)))

(assert (=> start!79406 tp!61277))

(declare-fun array_inv!21095 (array!56139) Bool)

(assert (=> start!79406 (array_inv!21095 _keys!1487)))

(declare-fun b!933275 () Bool)

(declare-fun e!524036 () Bool)

(assert (=> b!933275 (= e!524036 tp_is_empty!20119)))

(declare-fun b!933276 () Bool)

(declare-fun res!628663 () Bool)

(assert (=> b!933276 (=> (not res!628663) (not e!524032))))

(declare-fun v!791 () V!31791)

(declare-fun apply!801 (ListLongMap!11997 (_ BitVec 64)) V!31791)

(assert (=> b!933276 (= res!628663 (= (apply!801 lt!420205 k0!1099) v!791))))

(declare-fun b!933277 () Bool)

(declare-fun res!628656 () Bool)

(assert (=> b!933277 (=> (not res!628656) (not e!524033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56139 (_ BitVec 32)) Bool)

(assert (=> b!933277 (= res!628656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933278 () Bool)

(declare-fun res!628659 () Bool)

(assert (=> b!933278 (=> (not res!628659) (not e!524033))))

(assert (=> b!933278 (= res!628659 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27475 _keys!1487))))))

(declare-fun b!933279 () Bool)

(declare-fun res!628655 () Bool)

(assert (=> b!933279 (=> (not res!628655) (not e!524032))))

(assert (=> b!933279 (= res!628655 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933280 () Bool)

(assert (=> b!933280 (= e!524030 (and e!524036 mapRes!31938))))

(declare-fun condMapEmpty!31938 () Bool)

(declare-fun mapDefault!31938 () ValueCell!9578)

(assert (=> b!933280 (= condMapEmpty!31938 (= (arr!27015 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9578)) mapDefault!31938)))))

(declare-fun b!933281 () Bool)

(declare-fun res!628664 () Bool)

(assert (=> b!933281 (=> (not res!628664) (not e!524033))))

(assert (=> b!933281 (= res!628664 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19057))))

(declare-fun mapNonEmpty!31938 () Bool)

(declare-fun tp!61278 () Bool)

(assert (=> mapNonEmpty!31938 (= mapRes!31938 (and tp!61278 e!524031))))

(declare-fun mapRest!31938 () (Array (_ BitVec 32) ValueCell!9578))

(declare-fun mapValue!31938 () ValueCell!9578)

(declare-fun mapKey!31938 () (_ BitVec 32))

(assert (=> mapNonEmpty!31938 (= (arr!27015 _values!1231) (store mapRest!31938 mapKey!31938 mapValue!31938))))

(declare-fun b!933282 () Bool)

(declare-fun res!628658 () Bool)

(assert (=> b!933282 (=> (not res!628658) (not e!524033))))

(assert (=> b!933282 (= res!628658 (and (= (size!27476 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27475 _keys!1487) (size!27476 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933283 () Bool)

(assert (=> b!933283 (= e!524033 e!524032)))

(declare-fun res!628661 () Bool)

(assert (=> b!933283 (=> (not res!628661) (not e!524032))))

(assert (=> b!933283 (= res!628661 (contains!5011 lt!420205 k0!1099))))

(assert (=> b!933283 (= lt!420205 (getCurrentListMap!3186 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933284 () Bool)

(assert (=> b!933284 (= e!524032 e!524034)))

(declare-fun res!628662 () Bool)

(assert (=> b!933284 (=> (not res!628662) (not e!524034))))

(assert (=> b!933284 (= res!628662 (validKeyInArray!0 lt!420204))))

(assert (=> b!933284 (= lt!420204 (select (arr!27014 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (= (and start!79406 res!628657) b!933282))

(assert (= (and b!933282 res!628658) b!933277))

(assert (= (and b!933277 res!628656) b!933281))

(assert (= (and b!933281 res!628664) b!933278))

(assert (= (and b!933278 res!628659) b!933283))

(assert (= (and b!933283 res!628661) b!933276))

(assert (= (and b!933276 res!628663) b!933279))

(assert (= (and b!933279 res!628655) b!933274))

(assert (= (and b!933274 res!628660) b!933284))

(assert (= (and b!933284 res!628662) b!933273))

(assert (= (and b!933280 condMapEmpty!31938) mapIsEmpty!31938))

(assert (= (and b!933280 (not condMapEmpty!31938)) mapNonEmpty!31938))

(get-info :version)

(assert (= (and mapNonEmpty!31938 ((_ is ValueCellFull!9578) mapValue!31938)) b!933272))

(assert (= (and b!933280 ((_ is ValueCellFull!9578) mapDefault!31938)) b!933275))

(assert (= start!79406 b!933280))

(declare-fun b_lambda!13927 () Bool)

(assert (=> (not b_lambda!13927) (not b!933273)))

(declare-fun t!27205 () Bool)

(declare-fun tb!5997 () Bool)

(assert (=> (and start!79406 (= defaultEntry!1235 defaultEntry!1235) t!27205) tb!5997))

(declare-fun result!11827 () Bool)

(assert (=> tb!5997 (= result!11827 tp_is_empty!20119)))

(assert (=> b!933273 t!27205))

(declare-fun b_and!28757 () Bool)

(assert (= b_and!28755 (and (=> t!27205 result!11827) b_and!28757)))

(declare-fun m!866897 () Bool)

(assert (=> b!933274 m!866897))

(declare-fun m!866899 () Bool)

(assert (=> b!933283 m!866899))

(declare-fun m!866901 () Bool)

(assert (=> b!933283 m!866901))

(declare-fun m!866903 () Bool)

(assert (=> start!79406 m!866903))

(declare-fun m!866905 () Bool)

(assert (=> start!79406 m!866905))

(declare-fun m!866907 () Bool)

(assert (=> start!79406 m!866907))

(declare-fun m!866909 () Bool)

(assert (=> b!933276 m!866909))

(declare-fun m!866911 () Bool)

(assert (=> b!933281 m!866911))

(declare-fun m!866913 () Bool)

(assert (=> b!933277 m!866913))

(declare-fun m!866915 () Bool)

(assert (=> b!933273 m!866915))

(declare-fun m!866917 () Bool)

(assert (=> b!933273 m!866917))

(assert (=> b!933273 m!866915))

(assert (=> b!933273 m!866917))

(declare-fun m!866919 () Bool)

(assert (=> b!933273 m!866919))

(declare-fun m!866921 () Bool)

(assert (=> b!933273 m!866921))

(declare-fun m!866923 () Bool)

(assert (=> b!933273 m!866923))

(assert (=> b!933273 m!866923))

(declare-fun m!866925 () Bool)

(assert (=> b!933273 m!866925))

(declare-fun m!866927 () Bool)

(assert (=> b!933273 m!866927))

(declare-fun m!866929 () Bool)

(assert (=> b!933273 m!866929))

(declare-fun m!866931 () Bool)

(assert (=> b!933273 m!866931))

(declare-fun m!866933 () Bool)

(assert (=> b!933273 m!866933))

(declare-fun m!866935 () Bool)

(assert (=> b!933273 m!866935))

(assert (=> b!933273 m!866927))

(declare-fun m!866937 () Bool)

(assert (=> b!933273 m!866937))

(declare-fun m!866939 () Bool)

(assert (=> b!933284 m!866939))

(declare-fun m!866941 () Bool)

(assert (=> b!933284 m!866941))

(declare-fun m!866943 () Bool)

(assert (=> mapNonEmpty!31938 m!866943))

(check-sat (not b_lambda!13927) (not b!933274) (not b_next!17611) (not b!933273) (not b!933281) (not start!79406) (not mapNonEmpty!31938) (not b!933277) (not b!933276) (not b!933284) (not b!933283) b_and!28757 tp_is_empty!20119)
(check-sat b_and!28757 (not b_next!17611))
