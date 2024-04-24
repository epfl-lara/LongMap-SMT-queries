; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79532 () Bool)

(assert start!79532)

(declare-fun b_free!17551 () Bool)

(declare-fun b_next!17551 () Bool)

(assert (=> start!79532 (= b_free!17551 (not b_next!17551))))

(declare-fun tp!61097 () Bool)

(declare-fun b_and!28671 () Bool)

(assert (=> start!79532 (= tp!61097 b_and!28671)))

(declare-fun b!933184 () Bool)

(declare-fun res!628213 () Bool)

(declare-fun e!524136 () Bool)

(assert (=> b!933184 (=> (not res!628213) (not e!524136))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31711 0))(
  ( (V!31712 (val!10080 Int)) )
))
(declare-fun v!791 () V!31711)

(declare-datatypes ((tuple2!13194 0))(
  ( (tuple2!13195 (_1!6608 (_ BitVec 64)) (_2!6608 V!31711)) )
))
(declare-datatypes ((List!18977 0))(
  ( (Nil!18974) (Cons!18973 (h!20125 tuple2!13194) (t!27064 List!18977)) )
))
(declare-datatypes ((ListLongMap!11893 0))(
  ( (ListLongMap!11894 (toList!5962 List!18977)) )
))
(declare-fun lt!420184 () ListLongMap!11893)

(declare-fun apply!790 (ListLongMap!11893 (_ BitVec 64)) V!31711)

(assert (=> b!933184 (= res!628213 (= (apply!790 lt!420184 k0!1099) v!791))))

(declare-fun mapNonEmpty!31848 () Bool)

(declare-fun mapRes!31848 () Bool)

(declare-fun tp!61098 () Bool)

(declare-fun e!524132 () Bool)

(assert (=> mapNonEmpty!31848 (= mapRes!31848 (and tp!61098 e!524132))))

(declare-fun mapKey!31848 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9548 0))(
  ( (ValueCellFull!9548 (v!12596 V!31711)) (EmptyCell!9548) )
))
(declare-fun mapValue!31848 () ValueCell!9548)

(declare-datatypes ((array!56113 0))(
  ( (array!56114 (arr!26996 (Array (_ BitVec 32) ValueCell!9548)) (size!27456 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56113)

(declare-fun mapRest!31848 () (Array (_ BitVec 32) ValueCell!9548))

(assert (=> mapNonEmpty!31848 (= (arr!26996 _values!1231) (store mapRest!31848 mapKey!31848 mapValue!31848))))

(declare-fun mapIsEmpty!31848 () Bool)

(assert (=> mapIsEmpty!31848 mapRes!31848))

(declare-fun res!628214 () Bool)

(declare-fun e!524130 () Bool)

(assert (=> start!79532 (=> (not res!628214) (not e!524130))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79532 (= res!628214 (validMask!0 mask!1881))))

(assert (=> start!79532 e!524130))

(assert (=> start!79532 true))

(declare-fun tp_is_empty!20059 () Bool)

(assert (=> start!79532 tp_is_empty!20059))

(declare-fun e!524135 () Bool)

(declare-fun array_inv!21096 (array!56113) Bool)

(assert (=> start!79532 (and (array_inv!21096 _values!1231) e!524135)))

(assert (=> start!79532 tp!61097))

(declare-datatypes ((array!56115 0))(
  ( (array!56116 (arr!26997 (Array (_ BitVec 32) (_ BitVec 64))) (size!27457 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56115)

(declare-fun array_inv!21097 (array!56115) Bool)

(assert (=> start!79532 (array_inv!21097 _keys!1487)))

(declare-fun b!933185 () Bool)

(declare-fun res!628217 () Bool)

(assert (=> b!933185 (=> (not res!628217) (not e!524136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933185 (= res!628217 (validKeyInArray!0 k0!1099))))

(declare-fun b!933186 () Bool)

(declare-fun res!628216 () Bool)

(assert (=> b!933186 (=> (not res!628216) (not e!524130))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933186 (= res!628216 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27457 _keys!1487))))))

(declare-fun b!933187 () Bool)

(declare-fun e!524134 () Bool)

(assert (=> b!933187 (= e!524134 (not (or (bvsge (size!27457 _keys!1487) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!27457 _keys!1487)) (bvsle (bvsub from!1844 #b00000000000000000000000000000001) (size!27457 _keys!1487)))))))

(declare-fun lt!420186 () tuple2!13194)

(declare-fun contains!5027 (ListLongMap!11893 (_ BitVec 64)) Bool)

(declare-fun +!2791 (ListLongMap!11893 tuple2!13194) ListLongMap!11893)

(assert (=> b!933187 (contains!5027 (+!2791 lt!420184 lt!420186) k0!1099)))

(declare-fun lt!420187 () V!31711)

(declare-fun lt!420189 () (_ BitVec 64))

(declare-datatypes ((Unit!31452 0))(
  ( (Unit!31453) )
))
(declare-fun lt!420188 () Unit!31452)

(declare-fun addStillContains!494 (ListLongMap!11893 (_ BitVec 64) V!31711 (_ BitVec 64)) Unit!31452)

(assert (=> b!933187 (= lt!420188 (addStillContains!494 lt!420184 lt!420189 lt!420187 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31711)

(declare-fun minValue!1173 () V!31711)

(declare-fun getCurrentListMap!3204 (array!56115 array!56113 (_ BitVec 32) (_ BitVec 32) V!31711 V!31711 (_ BitVec 32) Int) ListLongMap!11893)

(assert (=> b!933187 (= (getCurrentListMap!3204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2791 (getCurrentListMap!3204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420186))))

(assert (=> b!933187 (= lt!420186 (tuple2!13195 lt!420189 lt!420187))))

(declare-fun get!14213 (ValueCell!9548 V!31711) V!31711)

(declare-fun dynLambda!1588 (Int (_ BitVec 64)) V!31711)

(assert (=> b!933187 (= lt!420187 (get!14213 (select (arr!26996 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1588 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420185 () Unit!31452)

(declare-fun lemmaListMapRecursiveValidKeyArray!171 (array!56115 array!56113 (_ BitVec 32) (_ BitVec 32) V!31711 V!31711 (_ BitVec 32) Int) Unit!31452)

(assert (=> b!933187 (= lt!420185 (lemmaListMapRecursiveValidKeyArray!171 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933188 () Bool)

(assert (=> b!933188 (= e!524136 e!524134)))

(declare-fun res!628211 () Bool)

(assert (=> b!933188 (=> (not res!628211) (not e!524134))))

(assert (=> b!933188 (= res!628211 (validKeyInArray!0 lt!420189))))

(assert (=> b!933188 (= lt!420189 (select (arr!26997 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933189 () Bool)

(declare-fun e!524131 () Bool)

(assert (=> b!933189 (= e!524135 (and e!524131 mapRes!31848))))

(declare-fun condMapEmpty!31848 () Bool)

(declare-fun mapDefault!31848 () ValueCell!9548)

(assert (=> b!933189 (= condMapEmpty!31848 (= (arr!26996 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9548)) mapDefault!31848)))))

(declare-fun b!933190 () Bool)

(declare-fun res!628210 () Bool)

(assert (=> b!933190 (=> (not res!628210) (not e!524136))))

(assert (=> b!933190 (= res!628210 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933191 () Bool)

(assert (=> b!933191 (= e!524131 tp_is_empty!20059)))

(declare-fun b!933192 () Bool)

(declare-fun res!628209 () Bool)

(assert (=> b!933192 (=> (not res!628209) (not e!524130))))

(declare-datatypes ((List!18978 0))(
  ( (Nil!18975) (Cons!18974 (h!20126 (_ BitVec 64)) (t!27065 List!18978)) )
))
(declare-fun arrayNoDuplicates!0 (array!56115 (_ BitVec 32) List!18978) Bool)

(assert (=> b!933192 (= res!628209 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18975))))

(declare-fun b!933193 () Bool)

(declare-fun res!628218 () Bool)

(assert (=> b!933193 (=> (not res!628218) (not e!524130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56115 (_ BitVec 32)) Bool)

(assert (=> b!933193 (= res!628218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933194 () Bool)

(declare-fun res!628215 () Bool)

(assert (=> b!933194 (=> (not res!628215) (not e!524130))))

(assert (=> b!933194 (= res!628215 (and (= (size!27456 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27457 _keys!1487) (size!27456 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933195 () Bool)

(assert (=> b!933195 (= e!524130 e!524136)))

(declare-fun res!628212 () Bool)

(assert (=> b!933195 (=> (not res!628212) (not e!524136))))

(assert (=> b!933195 (= res!628212 (contains!5027 lt!420184 k0!1099))))

(assert (=> b!933195 (= lt!420184 (getCurrentListMap!3204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933196 () Bool)

(assert (=> b!933196 (= e!524132 tp_is_empty!20059)))

(assert (= (and start!79532 res!628214) b!933194))

(assert (= (and b!933194 res!628215) b!933193))

(assert (= (and b!933193 res!628218) b!933192))

(assert (= (and b!933192 res!628209) b!933186))

(assert (= (and b!933186 res!628216) b!933195))

(assert (= (and b!933195 res!628212) b!933184))

(assert (= (and b!933184 res!628213) b!933190))

(assert (= (and b!933190 res!628210) b!933185))

(assert (= (and b!933185 res!628217) b!933188))

(assert (= (and b!933188 res!628211) b!933187))

(assert (= (and b!933189 condMapEmpty!31848) mapIsEmpty!31848))

(assert (= (and b!933189 (not condMapEmpty!31848)) mapNonEmpty!31848))

(get-info :version)

(assert (= (and mapNonEmpty!31848 ((_ is ValueCellFull!9548) mapValue!31848)) b!933196))

(assert (= (and b!933189 ((_ is ValueCellFull!9548) mapDefault!31848)) b!933191))

(assert (= start!79532 b!933189))

(declare-fun b_lambda!13899 () Bool)

(assert (=> (not b_lambda!13899) (not b!933187)))

(declare-fun t!27063 () Bool)

(declare-fun tb!5937 () Bool)

(assert (=> (and start!79532 (= defaultEntry!1235 defaultEntry!1235) t!27063) tb!5937))

(declare-fun result!11707 () Bool)

(assert (=> tb!5937 (= result!11707 tp_is_empty!20059)))

(assert (=> b!933187 t!27063))

(declare-fun b_and!28673 () Bool)

(assert (= b_and!28671 (and (=> t!27063 result!11707) b_and!28673)))

(declare-fun m!867533 () Bool)

(assert (=> b!933184 m!867533))

(declare-fun m!867535 () Bool)

(assert (=> b!933185 m!867535))

(declare-fun m!867537 () Bool)

(assert (=> b!933188 m!867537))

(declare-fun m!867539 () Bool)

(assert (=> b!933188 m!867539))

(declare-fun m!867541 () Bool)

(assert (=> b!933195 m!867541))

(declare-fun m!867543 () Bool)

(assert (=> b!933195 m!867543))

(declare-fun m!867545 () Bool)

(assert (=> b!933193 m!867545))

(declare-fun m!867547 () Bool)

(assert (=> b!933187 m!867547))

(declare-fun m!867549 () Bool)

(assert (=> b!933187 m!867549))

(declare-fun m!867551 () Bool)

(assert (=> b!933187 m!867551))

(assert (=> b!933187 m!867549))

(assert (=> b!933187 m!867551))

(declare-fun m!867553 () Bool)

(assert (=> b!933187 m!867553))

(declare-fun m!867555 () Bool)

(assert (=> b!933187 m!867555))

(declare-fun m!867557 () Bool)

(assert (=> b!933187 m!867557))

(declare-fun m!867559 () Bool)

(assert (=> b!933187 m!867559))

(assert (=> b!933187 m!867547))

(declare-fun m!867561 () Bool)

(assert (=> b!933187 m!867561))

(declare-fun m!867563 () Bool)

(assert (=> b!933187 m!867563))

(assert (=> b!933187 m!867557))

(declare-fun m!867565 () Bool)

(assert (=> b!933187 m!867565))

(declare-fun m!867567 () Bool)

(assert (=> b!933192 m!867567))

(declare-fun m!867569 () Bool)

(assert (=> start!79532 m!867569))

(declare-fun m!867571 () Bool)

(assert (=> start!79532 m!867571))

(declare-fun m!867573 () Bool)

(assert (=> start!79532 m!867573))

(declare-fun m!867575 () Bool)

(assert (=> mapNonEmpty!31848 m!867575))

(check-sat (not mapNonEmpty!31848) (not b!933187) (not b!933184) (not b!933188) (not b!933185) (not b!933192) (not b!933193) (not start!79532) tp_is_empty!20059 (not b_next!17551) b_and!28673 (not b!933195) (not b_lambda!13899))
(check-sat b_and!28673 (not b_next!17551))
