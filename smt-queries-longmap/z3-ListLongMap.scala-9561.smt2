; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113230 () Bool)

(assert start!113230)

(declare-fun b_free!31281 () Bool)

(declare-fun b_next!31281 () Bool)

(assert (=> start!113230 (= b_free!31281 (not b_next!31281))))

(declare-fun tp!109648 () Bool)

(declare-fun b_and!50469 () Bool)

(assert (=> start!113230 (= tp!109648 b_and!50469)))

(declare-fun b!1343233 () Bool)

(declare-fun res!891192 () Bool)

(declare-fun e!764587 () Bool)

(assert (=> b!1343233 (=> (not res!891192) (not e!764587))))

(declare-datatypes ((array!91408 0))(
  ( (array!91409 (arr!44160 (Array (_ BitVec 32) (_ BitVec 64))) (size!44710 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91408)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91408 (_ BitVec 32)) Bool)

(assert (=> b!1343233 (= res!891192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343234 () Bool)

(declare-fun res!891194 () Bool)

(assert (=> b!1343234 (=> (not res!891194) (not e!764587))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343234 (= res!891194 (validKeyInArray!0 (select (arr!44160 _keys!1571) from!1960)))))

(declare-fun res!891193 () Bool)

(assert (=> start!113230 (=> (not res!891193) (not e!764587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113230 (= res!891193 (validMask!0 mask!1977))))

(assert (=> start!113230 e!764587))

(declare-fun tp_is_empty!37281 () Bool)

(assert (=> start!113230 tp_is_empty!37281))

(assert (=> start!113230 true))

(declare-fun array_inv!33287 (array!91408) Bool)

(assert (=> start!113230 (array_inv!33287 _keys!1571)))

(declare-datatypes ((V!54811 0))(
  ( (V!54812 (val!18715 Int)) )
))
(declare-datatypes ((ValueCell!17742 0))(
  ( (ValueCellFull!17742 (v!21363 V!54811)) (EmptyCell!17742) )
))
(declare-datatypes ((array!91410 0))(
  ( (array!91411 (arr!44161 (Array (_ BitVec 32) ValueCell!17742)) (size!44711 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91410)

(declare-fun e!764586 () Bool)

(declare-fun array_inv!33288 (array!91410) Bool)

(assert (=> start!113230 (and (array_inv!33288 _values!1303) e!764586)))

(assert (=> start!113230 tp!109648))

(declare-fun mapIsEmpty!57628 () Bool)

(declare-fun mapRes!57628 () Bool)

(assert (=> mapIsEmpty!57628 mapRes!57628))

(declare-fun b!1343235 () Bool)

(declare-fun e!764585 () Bool)

(assert (=> b!1343235 (= e!764585 tp_is_empty!37281)))

(declare-fun b!1343236 () Bool)

(declare-fun e!764584 () Bool)

(assert (=> b!1343236 (= e!764586 (and e!764584 mapRes!57628))))

(declare-fun condMapEmpty!57628 () Bool)

(declare-fun mapDefault!57628 () ValueCell!17742)

(assert (=> b!1343236 (= condMapEmpty!57628 (= (arr!44161 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17742)) mapDefault!57628)))))

(declare-fun b!1343237 () Bool)

(declare-fun res!891190 () Bool)

(assert (=> b!1343237 (=> (not res!891190) (not e!764587))))

(declare-datatypes ((List!31266 0))(
  ( (Nil!31263) (Cons!31262 (h!32471 (_ BitVec 64)) (t!45758 List!31266)) )
))
(declare-fun arrayNoDuplicates!0 (array!91408 (_ BitVec 32) List!31266) Bool)

(assert (=> b!1343237 (= res!891190 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31263))))

(declare-fun b!1343238 () Bool)

(declare-fun res!891195 () Bool)

(assert (=> b!1343238 (=> (not res!891195) (not e!764587))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1343238 (= res!891195 (and (= (size!44711 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44710 _keys!1571) (size!44711 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343239 () Bool)

(declare-fun res!891191 () Bool)

(assert (=> b!1343239 (=> (not res!891191) (not e!764587))))

(assert (=> b!1343239 (= res!891191 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343240 () Bool)

(declare-fun res!891198 () Bool)

(assert (=> b!1343240 (=> (not res!891198) (not e!764587))))

(declare-fun minValue!1245 () V!54811)

(declare-fun zeroValue!1245 () V!54811)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24108 0))(
  ( (tuple2!24109 (_1!12065 (_ BitVec 64)) (_2!12065 V!54811)) )
))
(declare-datatypes ((List!31267 0))(
  ( (Nil!31264) (Cons!31263 (h!32472 tuple2!24108) (t!45759 List!31267)) )
))
(declare-datatypes ((ListLongMap!21765 0))(
  ( (ListLongMap!21766 (toList!10898 List!31267)) )
))
(declare-fun contains!9074 (ListLongMap!21765 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5859 (array!91408 array!91410 (_ BitVec 32) (_ BitVec 32) V!54811 V!54811 (_ BitVec 32) Int) ListLongMap!21765)

(assert (=> b!1343240 (= res!891198 (contains!9074 (getCurrentListMap!5859 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343241 () Bool)

(declare-fun res!891196 () Bool)

(assert (=> b!1343241 (=> (not res!891196) (not e!764587))))

(assert (=> b!1343241 (= res!891196 (not (= (select (arr!44160 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343242 () Bool)

(declare-fun res!891197 () Bool)

(assert (=> b!1343242 (=> (not res!891197) (not e!764587))))

(assert (=> b!1343242 (= res!891197 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44710 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57628 () Bool)

(declare-fun tp!109647 () Bool)

(assert (=> mapNonEmpty!57628 (= mapRes!57628 (and tp!109647 e!764585))))

(declare-fun mapKey!57628 () (_ BitVec 32))

(declare-fun mapValue!57628 () ValueCell!17742)

(declare-fun mapRest!57628 () (Array (_ BitVec 32) ValueCell!17742))

(assert (=> mapNonEmpty!57628 (= (arr!44161 _values!1303) (store mapRest!57628 mapKey!57628 mapValue!57628))))

(declare-fun b!1343243 () Bool)

(assert (=> b!1343243 (= e!764584 tp_is_empty!37281)))

(declare-fun b!1343244 () Bool)

(assert (=> b!1343244 (= e!764587 (not true))))

(declare-fun lt!594830 () ListLongMap!21765)

(declare-fun +!4806 (ListLongMap!21765 tuple2!24108) ListLongMap!21765)

(assert (=> b!1343244 (contains!9074 (+!4806 lt!594830 (tuple2!24109 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44089 0))(
  ( (Unit!44090) )
))
(declare-fun lt!594826 () Unit!44089)

(declare-fun addStillContains!1199 (ListLongMap!21765 (_ BitVec 64) V!54811 (_ BitVec 64)) Unit!44089)

(assert (=> b!1343244 (= lt!594826 (addStillContains!1199 lt!594830 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1343244 (contains!9074 lt!594830 k0!1142)))

(declare-fun lt!594831 () Unit!44089)

(declare-fun lt!594827 () V!54811)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!375 ((_ BitVec 64) (_ BitVec 64) V!54811 ListLongMap!21765) Unit!44089)

(assert (=> b!1343244 (= lt!594831 (lemmaInListMapAfterAddingDiffThenInBefore!375 k0!1142 (select (arr!44160 _keys!1571) from!1960) lt!594827 lt!594830))))

(declare-fun lt!594828 () ListLongMap!21765)

(assert (=> b!1343244 (contains!9074 lt!594828 k0!1142)))

(declare-fun lt!594829 () Unit!44089)

(assert (=> b!1343244 (= lt!594829 (lemmaInListMapAfterAddingDiffThenInBefore!375 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594828))))

(assert (=> b!1343244 (= lt!594828 (+!4806 lt!594830 (tuple2!24109 (select (arr!44160 _keys!1571) from!1960) lt!594827)))))

(declare-fun get!22305 (ValueCell!17742 V!54811) V!54811)

(declare-fun dynLambda!3745 (Int (_ BitVec 64)) V!54811)

(assert (=> b!1343244 (= lt!594827 (get!22305 (select (arr!44161 _values!1303) from!1960) (dynLambda!3745 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6448 (array!91408 array!91410 (_ BitVec 32) (_ BitVec 32) V!54811 V!54811 (_ BitVec 32) Int) ListLongMap!21765)

(assert (=> b!1343244 (= lt!594830 (getCurrentListMapNoExtraKeys!6448 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(assert (= (and start!113230 res!891193) b!1343238))

(assert (= (and b!1343238 res!891195) b!1343233))

(assert (= (and b!1343233 res!891192) b!1343237))

(assert (= (and b!1343237 res!891190) b!1343242))

(assert (= (and b!1343242 res!891197) b!1343240))

(assert (= (and b!1343240 res!891198) b!1343241))

(assert (= (and b!1343241 res!891196) b!1343234))

(assert (= (and b!1343234 res!891194) b!1343239))

(assert (= (and b!1343239 res!891191) b!1343244))

(assert (= (and b!1343236 condMapEmpty!57628) mapIsEmpty!57628))

(assert (= (and b!1343236 (not condMapEmpty!57628)) mapNonEmpty!57628))

(get-info :version)

(assert (= (and mapNonEmpty!57628 ((_ is ValueCellFull!17742) mapValue!57628)) b!1343235))

(assert (= (and b!1343236 ((_ is ValueCellFull!17742) mapDefault!57628)) b!1343243))

(assert (= start!113230 b!1343236))

(declare-fun b_lambda!24457 () Bool)

(assert (=> (not b_lambda!24457) (not b!1343244)))

(declare-fun t!45757 () Bool)

(declare-fun tb!12295 () Bool)

(assert (=> (and start!113230 (= defaultEntry!1306 defaultEntry!1306) t!45757) tb!12295))

(declare-fun result!25681 () Bool)

(assert (=> tb!12295 (= result!25681 tp_is_empty!37281)))

(assert (=> b!1343244 t!45757))

(declare-fun b_and!50471 () Bool)

(assert (= b_and!50469 (and (=> t!45757 result!25681) b_and!50471)))

(declare-fun m!1230915 () Bool)

(assert (=> mapNonEmpty!57628 m!1230915))

(declare-fun m!1230917 () Bool)

(assert (=> b!1343244 m!1230917))

(declare-fun m!1230919 () Bool)

(assert (=> b!1343244 m!1230919))

(declare-fun m!1230921 () Bool)

(assert (=> b!1343244 m!1230921))

(declare-fun m!1230923 () Bool)

(assert (=> b!1343244 m!1230923))

(assert (=> b!1343244 m!1230919))

(declare-fun m!1230925 () Bool)

(assert (=> b!1343244 m!1230925))

(declare-fun m!1230927 () Bool)

(assert (=> b!1343244 m!1230927))

(declare-fun m!1230929 () Bool)

(assert (=> b!1343244 m!1230929))

(declare-fun m!1230931 () Bool)

(assert (=> b!1343244 m!1230931))

(declare-fun m!1230933 () Bool)

(assert (=> b!1343244 m!1230933))

(declare-fun m!1230935 () Bool)

(assert (=> b!1343244 m!1230935))

(assert (=> b!1343244 m!1230935))

(declare-fun m!1230937 () Bool)

(assert (=> b!1343244 m!1230937))

(declare-fun m!1230939 () Bool)

(assert (=> b!1343244 m!1230939))

(assert (=> b!1343244 m!1230921))

(assert (=> b!1343244 m!1230925))

(declare-fun m!1230941 () Bool)

(assert (=> b!1343244 m!1230941))

(declare-fun m!1230943 () Bool)

(assert (=> b!1343240 m!1230943))

(assert (=> b!1343240 m!1230943))

(declare-fun m!1230945 () Bool)

(assert (=> b!1343240 m!1230945))

(declare-fun m!1230947 () Bool)

(assert (=> b!1343237 m!1230947))

(declare-fun m!1230949 () Bool)

(assert (=> b!1343233 m!1230949))

(assert (=> b!1343241 m!1230935))

(assert (=> b!1343234 m!1230935))

(assert (=> b!1343234 m!1230935))

(declare-fun m!1230951 () Bool)

(assert (=> b!1343234 m!1230951))

(declare-fun m!1230953 () Bool)

(assert (=> start!113230 m!1230953))

(declare-fun m!1230955 () Bool)

(assert (=> start!113230 m!1230955))

(declare-fun m!1230957 () Bool)

(assert (=> start!113230 m!1230957))

(check-sat (not b!1343244) (not b!1343237) (not b!1343240) (not b_lambda!24457) b_and!50471 (not b!1343233) (not b_next!31281) (not b!1343234) (not start!113230) (not mapNonEmpty!57628) tp_is_empty!37281)
(check-sat b_and!50471 (not b_next!31281))
