; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79408 () Bool)

(assert start!79408)

(declare-fun b_free!17595 () Bool)

(declare-fun b_next!17595 () Bool)

(assert (=> start!79408 (= b_free!17595 (not b_next!17595))))

(declare-fun tp!61228 () Bool)

(declare-fun b_and!28749 () Bool)

(assert (=> start!79408 (= tp!61228 b_and!28749)))

(declare-fun b!933183 () Bool)

(declare-fun e!524016 () Bool)

(declare-fun e!524014 () Bool)

(assert (=> b!933183 (= e!524016 e!524014)))

(declare-fun res!628532 () Bool)

(assert (=> b!933183 (=> (not res!628532) (not e!524014))))

(declare-fun lt!420270 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933183 (= res!628532 (validKeyInArray!0 lt!420270))))

(declare-datatypes ((array!56142 0))(
  ( (array!56143 (arr!27015 (Array (_ BitVec 32) (_ BitVec 64))) (size!27474 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56142)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933183 (= lt!420270 (select (arr!27015 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933184 () Bool)

(declare-fun e!524013 () Bool)

(assert (=> b!933184 (= e!524013 e!524016)))

(declare-fun res!628529 () Bool)

(assert (=> b!933184 (=> (not res!628529) (not e!524016))))

(declare-datatypes ((V!31769 0))(
  ( (V!31770 (val!10102 Int)) )
))
(declare-datatypes ((tuple2!13242 0))(
  ( (tuple2!13243 (_1!6632 (_ BitVec 64)) (_2!6632 V!31769)) )
))
(declare-datatypes ((List!19023 0))(
  ( (Nil!19020) (Cons!19019 (h!20165 tuple2!13242) (t!27162 List!19023)) )
))
(declare-datatypes ((ListLongMap!11939 0))(
  ( (ListLongMap!11940 (toList!5985 List!19023)) )
))
(declare-fun lt!420269 () ListLongMap!11939)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5034 (ListLongMap!11939 (_ BitVec 64)) Bool)

(assert (=> b!933184 (= res!628529 (contains!5034 lt!420269 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9570 0))(
  ( (ValueCellFull!9570 (v!12621 V!31769)) (EmptyCell!9570) )
))
(declare-datatypes ((array!56144 0))(
  ( (array!56145 (arr!27016 (Array (_ BitVec 32) ValueCell!9570)) (size!27475 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56144)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31769)

(declare-fun minValue!1173 () V!31769)

(declare-fun getCurrentListMap!3223 (array!56142 array!56144 (_ BitVec 32) (_ BitVec 32) V!31769 V!31769 (_ BitVec 32) Int) ListLongMap!11939)

(assert (=> b!933184 (= lt!420269 (getCurrentListMap!3223 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933185 () Bool)

(assert (=> b!933185 (= e!524014 (not true))))

(declare-datatypes ((List!19024 0))(
  ( (Nil!19021) (Cons!19020 (h!20166 (_ BitVec 64)) (t!27163 List!19024)) )
))
(declare-fun arrayNoDuplicates!0 (array!56142 (_ BitVec 32) List!19024) Bool)

(assert (=> b!933185 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19021)))

(declare-datatypes ((Unit!31489 0))(
  ( (Unit!31490) )
))
(declare-fun lt!420273 () Unit!31489)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56142 (_ BitVec 32) (_ BitVec 32)) Unit!31489)

(assert (=> b!933185 (= lt!420273 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420274 () tuple2!13242)

(declare-fun +!2787 (ListLongMap!11939 tuple2!13242) ListLongMap!11939)

(assert (=> b!933185 (contains!5034 (+!2787 lt!420269 lt!420274) k0!1099)))

(declare-fun lt!420271 () Unit!31489)

(declare-fun lt!420272 () V!31769)

(declare-fun addStillContains!506 (ListLongMap!11939 (_ BitVec 64) V!31769 (_ BitVec 64)) Unit!31489)

(assert (=> b!933185 (= lt!420271 (addStillContains!506 lt!420269 lt!420270 lt!420272 k0!1099))))

(assert (=> b!933185 (= (getCurrentListMap!3223 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2787 (getCurrentListMap!3223 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420274))))

(assert (=> b!933185 (= lt!420274 (tuple2!13243 lt!420270 lt!420272))))

(declare-fun get!14211 (ValueCell!9570 V!31769) V!31769)

(declare-fun dynLambda!1576 (Int (_ BitVec 64)) V!31769)

(assert (=> b!933185 (= lt!420272 (get!14211 (select (arr!27016 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1576 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420275 () Unit!31489)

(declare-fun lemmaListMapRecursiveValidKeyArray!177 (array!56142 array!56144 (_ BitVec 32) (_ BitVec 32) V!31769 V!31769 (_ BitVec 32) Int) Unit!31489)

(assert (=> b!933185 (= lt!420275 (lemmaListMapRecursiveValidKeyArray!177 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933186 () Bool)

(declare-fun e!524015 () Bool)

(declare-fun tp_is_empty!20103 () Bool)

(assert (=> b!933186 (= e!524015 tp_is_empty!20103)))

(declare-fun mapIsEmpty!31914 () Bool)

(declare-fun mapRes!31914 () Bool)

(assert (=> mapIsEmpty!31914 mapRes!31914))

(declare-fun b!933187 () Bool)

(declare-fun res!628531 () Bool)

(assert (=> b!933187 (=> (not res!628531) (not e!524016))))

(assert (=> b!933187 (= res!628531 (validKeyInArray!0 k0!1099))))

(declare-fun b!933188 () Bool)

(declare-fun res!628527 () Bool)

(assert (=> b!933188 (=> (not res!628527) (not e!524013))))

(assert (=> b!933188 (= res!628527 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19021))))

(declare-fun b!933189 () Bool)

(declare-fun res!628525 () Bool)

(assert (=> b!933189 (=> (not res!628525) (not e!524013))))

(assert (=> b!933189 (= res!628525 (and (= (size!27475 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27474 _keys!1487) (size!27475 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933190 () Bool)

(declare-fun res!628534 () Bool)

(assert (=> b!933190 (=> (not res!628534) (not e!524013))))

(assert (=> b!933190 (= res!628534 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27474 _keys!1487))))))

(declare-fun b!933191 () Bool)

(declare-fun res!628526 () Bool)

(assert (=> b!933191 (=> (not res!628526) (not e!524016))))

(assert (=> b!933191 (= res!628526 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933192 () Bool)

(declare-fun res!628530 () Bool)

(assert (=> b!933192 (=> (not res!628530) (not e!524016))))

(declare-fun v!791 () V!31769)

(declare-fun apply!798 (ListLongMap!11939 (_ BitVec 64)) V!31769)

(assert (=> b!933192 (= res!628530 (= (apply!798 lt!420269 k0!1099) v!791))))

(declare-fun b!933193 () Bool)

(declare-fun e!524010 () Bool)

(assert (=> b!933193 (= e!524010 tp_is_empty!20103)))

(declare-fun b!933194 () Bool)

(declare-fun res!628533 () Bool)

(assert (=> b!933194 (=> (not res!628533) (not e!524013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56142 (_ BitVec 32)) Bool)

(assert (=> b!933194 (= res!628533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!628528 () Bool)

(assert (=> start!79408 (=> (not res!628528) (not e!524013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79408 (= res!628528 (validMask!0 mask!1881))))

(assert (=> start!79408 e!524013))

(assert (=> start!79408 true))

(assert (=> start!79408 tp_is_empty!20103))

(declare-fun e!524011 () Bool)

(declare-fun array_inv!21028 (array!56144) Bool)

(assert (=> start!79408 (and (array_inv!21028 _values!1231) e!524011)))

(assert (=> start!79408 tp!61228))

(declare-fun array_inv!21029 (array!56142) Bool)

(assert (=> start!79408 (array_inv!21029 _keys!1487)))

(declare-fun b!933195 () Bool)

(assert (=> b!933195 (= e!524011 (and e!524010 mapRes!31914))))

(declare-fun condMapEmpty!31914 () Bool)

(declare-fun mapDefault!31914 () ValueCell!9570)

(assert (=> b!933195 (= condMapEmpty!31914 (= (arr!27016 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9570)) mapDefault!31914)))))

(declare-fun mapNonEmpty!31914 () Bool)

(declare-fun tp!61229 () Bool)

(assert (=> mapNonEmpty!31914 (= mapRes!31914 (and tp!61229 e!524015))))

(declare-fun mapValue!31914 () ValueCell!9570)

(declare-fun mapKey!31914 () (_ BitVec 32))

(declare-fun mapRest!31914 () (Array (_ BitVec 32) ValueCell!9570))

(assert (=> mapNonEmpty!31914 (= (arr!27016 _values!1231) (store mapRest!31914 mapKey!31914 mapValue!31914))))

(assert (= (and start!79408 res!628528) b!933189))

(assert (= (and b!933189 res!628525) b!933194))

(assert (= (and b!933194 res!628533) b!933188))

(assert (= (and b!933188 res!628527) b!933190))

(assert (= (and b!933190 res!628534) b!933184))

(assert (= (and b!933184 res!628529) b!933192))

(assert (= (and b!933192 res!628530) b!933191))

(assert (= (and b!933191 res!628526) b!933187))

(assert (= (and b!933187 res!628531) b!933183))

(assert (= (and b!933183 res!628532) b!933185))

(assert (= (and b!933195 condMapEmpty!31914) mapIsEmpty!31914))

(assert (= (and b!933195 (not condMapEmpty!31914)) mapNonEmpty!31914))

(get-info :version)

(assert (= (and mapNonEmpty!31914 ((_ is ValueCellFull!9570) mapValue!31914)) b!933186))

(assert (= (and b!933195 ((_ is ValueCellFull!9570) mapDefault!31914)) b!933193))

(assert (= start!79408 b!933195))

(declare-fun b_lambda!13929 () Bool)

(assert (=> (not b_lambda!13929) (not b!933185)))

(declare-fun t!27161 () Bool)

(declare-fun tb!5989 () Bool)

(assert (=> (and start!79408 (= defaultEntry!1235 defaultEntry!1235) t!27161) tb!5989))

(declare-fun result!11803 () Bool)

(assert (=> tb!5989 (= result!11803 tp_is_empty!20103)))

(assert (=> b!933185 t!27161))

(declare-fun b_and!28751 () Bool)

(assert (= b_and!28749 (and (=> t!27161 result!11803) b_and!28751)))

(declare-fun m!867271 () Bool)

(assert (=> b!933183 m!867271))

(declare-fun m!867273 () Bool)

(assert (=> b!933183 m!867273))

(declare-fun m!867275 () Bool)

(assert (=> b!933184 m!867275))

(declare-fun m!867277 () Bool)

(assert (=> b!933184 m!867277))

(declare-fun m!867279 () Bool)

(assert (=> b!933185 m!867279))

(declare-fun m!867281 () Bool)

(assert (=> b!933185 m!867281))

(declare-fun m!867283 () Bool)

(assert (=> b!933185 m!867283))

(declare-fun m!867285 () Bool)

(assert (=> b!933185 m!867285))

(declare-fun m!867287 () Bool)

(assert (=> b!933185 m!867287))

(assert (=> b!933185 m!867283))

(assert (=> b!933185 m!867285))

(declare-fun m!867289 () Bool)

(assert (=> b!933185 m!867289))

(declare-fun m!867291 () Bool)

(assert (=> b!933185 m!867291))

(declare-fun m!867293 () Bool)

(assert (=> b!933185 m!867293))

(declare-fun m!867295 () Bool)

(assert (=> b!933185 m!867295))

(assert (=> b!933185 m!867279))

(declare-fun m!867297 () Bool)

(assert (=> b!933185 m!867297))

(declare-fun m!867299 () Bool)

(assert (=> b!933185 m!867299))

(assert (=> b!933185 m!867287))

(declare-fun m!867301 () Bool)

(assert (=> b!933185 m!867301))

(declare-fun m!867303 () Bool)

(assert (=> mapNonEmpty!31914 m!867303))

(declare-fun m!867305 () Bool)

(assert (=> b!933194 m!867305))

(declare-fun m!867307 () Bool)

(assert (=> b!933192 m!867307))

(declare-fun m!867309 () Bool)

(assert (=> b!933187 m!867309))

(declare-fun m!867311 () Bool)

(assert (=> start!79408 m!867311))

(declare-fun m!867313 () Bool)

(assert (=> start!79408 m!867313))

(declare-fun m!867315 () Bool)

(assert (=> start!79408 m!867315))

(declare-fun m!867317 () Bool)

(assert (=> b!933188 m!867317))

(check-sat (not b!933188) (not b_lambda!13929) (not b!933192) (not b_next!17595) (not start!79408) (not mapNonEmpty!31914) (not b!933194) (not b!933183) (not b!933184) (not b!933187) (not b!933185) b_and!28751 tp_is_empty!20103)
(check-sat b_and!28751 (not b_next!17595))
