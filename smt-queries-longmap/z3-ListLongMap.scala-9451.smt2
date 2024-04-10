; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112316 () Bool)

(assert start!112316)

(declare-fun b_free!30711 () Bool)

(declare-fun b_next!30711 () Bool)

(assert (=> start!112316 (= b_free!30711 (not b_next!30711))))

(declare-fun tp!107769 () Bool)

(declare-fun b_and!49477 () Bool)

(assert (=> start!112316 (= tp!107769 b_and!49477)))

(declare-fun b!1331071 () Bool)

(declare-fun e!758536 () Bool)

(assert (=> b!1331071 (= e!758536 (not true))))

(declare-datatypes ((V!53931 0))(
  ( (V!53932 (val!18385 Int)) )
))
(declare-datatypes ((tuple2!23680 0))(
  ( (tuple2!23681 (_1!11851 (_ BitVec 64)) (_2!11851 V!53931)) )
))
(declare-datatypes ((List!30829 0))(
  ( (Nil!30826) (Cons!30825 (h!32034 tuple2!23680) (t!44953 List!30829)) )
))
(declare-datatypes ((ListLongMap!21337 0))(
  ( (ListLongMap!21338 (toList!10684 List!30829)) )
))
(declare-fun lt!591394 () ListLongMap!21337)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8848 (ListLongMap!21337 (_ BitVec 64)) Bool)

(assert (=> b!1331071 (contains!8848 lt!591394 k0!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((Unit!43809 0))(
  ( (Unit!43810) )
))
(declare-fun lt!591391 () Unit!43809)

(declare-fun lt!591393 () V!53931)

(declare-datatypes ((array!90124 0))(
  ( (array!90125 (arr!43528 (Array (_ BitVec 32) (_ BitVec 64))) (size!44078 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90124)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!267 ((_ BitVec 64) (_ BitVec 64) V!53931 ListLongMap!21337) Unit!43809)

(assert (=> b!1331071 (= lt!591391 (lemmaInListMapAfterAddingDiffThenInBefore!267 k0!1153 (select (arr!43528 _keys!1590) from!1980) lt!591393 lt!591394))))

(declare-fun lt!591392 () ListLongMap!21337)

(assert (=> b!1331071 (contains!8848 lt!591392 k0!1153)))

(declare-fun lt!591390 () Unit!43809)

(declare-fun minValue!1262 () V!53931)

(assert (=> b!1331071 (= lt!591390 (lemmaInListMapAfterAddingDiffThenInBefore!267 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591392))))

(declare-fun +!4680 (ListLongMap!21337 tuple2!23680) ListLongMap!21337)

(assert (=> b!1331071 (= lt!591392 (+!4680 lt!591394 (tuple2!23681 (select (arr!43528 _keys!1590) from!1980) lt!591393)))))

(declare-datatypes ((ValueCell!17412 0))(
  ( (ValueCellFull!17412 (v!21022 V!53931)) (EmptyCell!17412) )
))
(declare-datatypes ((array!90126 0))(
  ( (array!90127 (arr!43529 (Array (_ BitVec 32) ValueCell!17412)) (size!44079 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90126)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21946 (ValueCell!17412 V!53931) V!53931)

(declare-fun dynLambda!3619 (Int (_ BitVec 64)) V!53931)

(assert (=> b!1331071 (= lt!591393 (get!21946 (select (arr!43529 _values!1320) from!1980) (dynLambda!3619 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53931)

(declare-fun getCurrentListMapNoExtraKeys!6318 (array!90124 array!90126 (_ BitVec 32) (_ BitVec 32) V!53931 V!53931 (_ BitVec 32) Int) ListLongMap!21337)

(assert (=> b!1331071 (= lt!591394 (getCurrentListMapNoExtraKeys!6318 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331072 () Bool)

(declare-fun res!883260 () Bool)

(assert (=> b!1331072 (=> (not res!883260) (not e!758536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90124 (_ BitVec 32)) Bool)

(assert (=> b!1331072 (= res!883260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331073 () Bool)

(declare-fun res!883256 () Bool)

(assert (=> b!1331073 (=> (not res!883256) (not e!758536))))

(assert (=> b!1331073 (= res!883256 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331074 () Bool)

(declare-fun res!883258 () Bool)

(assert (=> b!1331074 (=> (not res!883258) (not e!758536))))

(assert (=> b!1331074 (= res!883258 (not (= (select (arr!43528 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331075 () Bool)

(declare-fun e!758533 () Bool)

(declare-fun tp_is_empty!36621 () Bool)

(assert (=> b!1331075 (= e!758533 tp_is_empty!36621)))

(declare-fun b!1331076 () Bool)

(declare-fun e!758535 () Bool)

(declare-fun mapRes!56605 () Bool)

(assert (=> b!1331076 (= e!758535 (and e!758533 mapRes!56605))))

(declare-fun condMapEmpty!56605 () Bool)

(declare-fun mapDefault!56605 () ValueCell!17412)

(assert (=> b!1331076 (= condMapEmpty!56605 (= (arr!43529 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17412)) mapDefault!56605)))))

(declare-fun b!1331077 () Bool)

(declare-fun e!758532 () Bool)

(assert (=> b!1331077 (= e!758532 tp_is_empty!36621)))

(declare-fun b!1331078 () Bool)

(declare-fun res!883259 () Bool)

(assert (=> b!1331078 (=> (not res!883259) (not e!758536))))

(assert (=> b!1331078 (= res!883259 (and (= (size!44079 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44078 _keys!1590) (size!44079 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331079 () Bool)

(declare-fun res!883261 () Bool)

(assert (=> b!1331079 (=> (not res!883261) (not e!758536))))

(declare-datatypes ((List!30830 0))(
  ( (Nil!30827) (Cons!30826 (h!32035 (_ BitVec 64)) (t!44954 List!30830)) )
))
(declare-fun arrayNoDuplicates!0 (array!90124 (_ BitVec 32) List!30830) Bool)

(assert (=> b!1331079 (= res!883261 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30827))))

(declare-fun mapIsEmpty!56605 () Bool)

(assert (=> mapIsEmpty!56605 mapRes!56605))

(declare-fun b!1331080 () Bool)

(declare-fun res!883262 () Bool)

(assert (=> b!1331080 (=> (not res!883262) (not e!758536))))

(assert (=> b!1331080 (= res!883262 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44078 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56605 () Bool)

(declare-fun tp!107770 () Bool)

(assert (=> mapNonEmpty!56605 (= mapRes!56605 (and tp!107770 e!758532))))

(declare-fun mapRest!56605 () (Array (_ BitVec 32) ValueCell!17412))

(declare-fun mapValue!56605 () ValueCell!17412)

(declare-fun mapKey!56605 () (_ BitVec 32))

(assert (=> mapNonEmpty!56605 (= (arr!43529 _values!1320) (store mapRest!56605 mapKey!56605 mapValue!56605))))

(declare-fun res!883257 () Bool)

(assert (=> start!112316 (=> (not res!883257) (not e!758536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112316 (= res!883257 (validMask!0 mask!1998))))

(assert (=> start!112316 e!758536))

(declare-fun array_inv!32831 (array!90126) Bool)

(assert (=> start!112316 (and (array_inv!32831 _values!1320) e!758535)))

(assert (=> start!112316 true))

(declare-fun array_inv!32832 (array!90124) Bool)

(assert (=> start!112316 (array_inv!32832 _keys!1590)))

(assert (=> start!112316 tp!107769))

(assert (=> start!112316 tp_is_empty!36621))

(declare-fun b!1331081 () Bool)

(declare-fun res!883263 () Bool)

(assert (=> b!1331081 (=> (not res!883263) (not e!758536))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331081 (= res!883263 (validKeyInArray!0 (select (arr!43528 _keys!1590) from!1980)))))

(declare-fun b!1331082 () Bool)

(declare-fun res!883255 () Bool)

(assert (=> b!1331082 (=> (not res!883255) (not e!758536))))

(declare-fun getCurrentListMap!5669 (array!90124 array!90126 (_ BitVec 32) (_ BitVec 32) V!53931 V!53931 (_ BitVec 32) Int) ListLongMap!21337)

(assert (=> b!1331082 (= res!883255 (contains!8848 (getCurrentListMap!5669 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112316 res!883257) b!1331078))

(assert (= (and b!1331078 res!883259) b!1331072))

(assert (= (and b!1331072 res!883260) b!1331079))

(assert (= (and b!1331079 res!883261) b!1331080))

(assert (= (and b!1331080 res!883262) b!1331082))

(assert (= (and b!1331082 res!883255) b!1331074))

(assert (= (and b!1331074 res!883258) b!1331081))

(assert (= (and b!1331081 res!883263) b!1331073))

(assert (= (and b!1331073 res!883256) b!1331071))

(assert (= (and b!1331076 condMapEmpty!56605) mapIsEmpty!56605))

(assert (= (and b!1331076 (not condMapEmpty!56605)) mapNonEmpty!56605))

(get-info :version)

(assert (= (and mapNonEmpty!56605 ((_ is ValueCellFull!17412) mapValue!56605)) b!1331077))

(assert (= (and b!1331076 ((_ is ValueCellFull!17412) mapDefault!56605)) b!1331075))

(assert (= start!112316 b!1331076))

(declare-fun b_lambda!23971 () Bool)

(assert (=> (not b_lambda!23971) (not b!1331071)))

(declare-fun t!44952 () Bool)

(declare-fun tb!11927 () Bool)

(assert (=> (and start!112316 (= defaultEntry!1323 defaultEntry!1323) t!44952) tb!11927))

(declare-fun result!24925 () Bool)

(assert (=> tb!11927 (= result!24925 tp_is_empty!36621)))

(assert (=> b!1331071 t!44952))

(declare-fun b_and!49479 () Bool)

(assert (= b_and!49477 (and (=> t!44952 result!24925) b_and!49479)))

(declare-fun m!1219733 () Bool)

(assert (=> b!1331074 m!1219733))

(assert (=> b!1331081 m!1219733))

(assert (=> b!1331081 m!1219733))

(declare-fun m!1219735 () Bool)

(assert (=> b!1331081 m!1219735))

(declare-fun m!1219737 () Bool)

(assert (=> start!112316 m!1219737))

(declare-fun m!1219739 () Bool)

(assert (=> start!112316 m!1219739))

(declare-fun m!1219741 () Bool)

(assert (=> start!112316 m!1219741))

(declare-fun m!1219743 () Bool)

(assert (=> b!1331079 m!1219743))

(declare-fun m!1219745 () Bool)

(assert (=> b!1331071 m!1219745))

(declare-fun m!1219747 () Bool)

(assert (=> b!1331071 m!1219747))

(declare-fun m!1219749 () Bool)

(assert (=> b!1331071 m!1219749))

(declare-fun m!1219751 () Bool)

(assert (=> b!1331071 m!1219751))

(assert (=> b!1331071 m!1219749))

(declare-fun m!1219753 () Bool)

(assert (=> b!1331071 m!1219753))

(declare-fun m!1219755 () Bool)

(assert (=> b!1331071 m!1219755))

(assert (=> b!1331071 m!1219733))

(declare-fun m!1219757 () Bool)

(assert (=> b!1331071 m!1219757))

(assert (=> b!1331071 m!1219751))

(assert (=> b!1331071 m!1219733))

(declare-fun m!1219759 () Bool)

(assert (=> b!1331071 m!1219759))

(declare-fun m!1219761 () Bool)

(assert (=> b!1331071 m!1219761))

(declare-fun m!1219763 () Bool)

(assert (=> mapNonEmpty!56605 m!1219763))

(declare-fun m!1219765 () Bool)

(assert (=> b!1331072 m!1219765))

(declare-fun m!1219767 () Bool)

(assert (=> b!1331082 m!1219767))

(assert (=> b!1331082 m!1219767))

(declare-fun m!1219769 () Bool)

(assert (=> b!1331082 m!1219769))

(check-sat tp_is_empty!36621 (not start!112316) (not b!1331079) (not b_next!30711) (not b!1331071) b_and!49479 (not b!1331072) (not b_lambda!23971) (not b!1331081) (not mapNonEmpty!56605) (not b!1331082))
(check-sat b_and!49479 (not b_next!30711))
