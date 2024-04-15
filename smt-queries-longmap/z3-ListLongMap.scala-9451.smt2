; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112314 () Bool)

(assert start!112314)

(declare-fun b_free!30709 () Bool)

(declare-fun b_next!30709 () Bool)

(assert (=> start!112314 (= b_free!30709 (not b_next!30709))))

(declare-fun tp!107765 () Bool)

(declare-fun b_and!49455 () Bool)

(assert (=> start!112314 (= tp!107765 b_and!49455)))

(declare-fun b!1330963 () Bool)

(declare-fun res!883207 () Bool)

(declare-fun e!758486 () Bool)

(assert (=> b!1330963 (=> (not res!883207) (not e!758486))))

(declare-datatypes ((V!53929 0))(
  ( (V!53930 (val!18384 Int)) )
))
(declare-datatypes ((ValueCell!17411 0))(
  ( (ValueCellFull!17411 (v!21020 V!53929)) (EmptyCell!17411) )
))
(declare-datatypes ((array!90057 0))(
  ( (array!90058 (arr!43495 (Array (_ BitVec 32) ValueCell!17411)) (size!44047 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90057)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90059 0))(
  ( (array!90060 (arr!43496 (Array (_ BitVec 32) (_ BitVec 64))) (size!44048 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90059)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53929)

(declare-fun zeroValue!1262 () V!53929)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23742 0))(
  ( (tuple2!23743 (_1!11882 (_ BitVec 64)) (_2!11882 V!53929)) )
))
(declare-datatypes ((List!30883 0))(
  ( (Nil!30880) (Cons!30879 (h!32088 tuple2!23742) (t!44997 List!30883)) )
))
(declare-datatypes ((ListLongMap!21399 0))(
  ( (ListLongMap!21400 (toList!10715 List!30883)) )
))
(declare-fun contains!8807 (ListLongMap!21399 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5579 (array!90059 array!90057 (_ BitVec 32) (_ BitVec 32) V!53929 V!53929 (_ BitVec 32) Int) ListLongMap!21399)

(assert (=> b!1330963 (= res!883207 (contains!8807 (getCurrentListMap!5579 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330964 () Bool)

(declare-fun res!883204 () Bool)

(assert (=> b!1330964 (=> (not res!883204) (not e!758486))))

(assert (=> b!1330964 (= res!883204 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330965 () Bool)

(declare-fun e!758485 () Bool)

(declare-fun e!758487 () Bool)

(declare-fun mapRes!56602 () Bool)

(assert (=> b!1330965 (= e!758485 (and e!758487 mapRes!56602))))

(declare-fun condMapEmpty!56602 () Bool)

(declare-fun mapDefault!56602 () ValueCell!17411)

(assert (=> b!1330965 (= condMapEmpty!56602 (= (arr!43495 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17411)) mapDefault!56602)))))

(declare-fun b!1330966 () Bool)

(declare-fun res!883200 () Bool)

(assert (=> b!1330966 (=> (not res!883200) (not e!758486))))

(declare-datatypes ((List!30884 0))(
  ( (Nil!30881) (Cons!30880 (h!32089 (_ BitVec 64)) (t!44998 List!30884)) )
))
(declare-fun arrayNoDuplicates!0 (array!90059 (_ BitVec 32) List!30884) Bool)

(assert (=> b!1330966 (= res!883200 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30881))))

(declare-fun mapIsEmpty!56602 () Bool)

(assert (=> mapIsEmpty!56602 mapRes!56602))

(declare-fun b!1330967 () Bool)

(assert (=> b!1330967 (= e!758486 (not true))))

(declare-fun lt!591190 () ListLongMap!21399)

(assert (=> b!1330967 (contains!8807 lt!591190 k0!1153)))

(declare-datatypes ((Unit!43604 0))(
  ( (Unit!43605) )
))
(declare-fun lt!591193 () Unit!43604)

(declare-fun lt!591189 () V!53929)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!252 ((_ BitVec 64) (_ BitVec 64) V!53929 ListLongMap!21399) Unit!43604)

(assert (=> b!1330967 (= lt!591193 (lemmaInListMapAfterAddingDiffThenInBefore!252 k0!1153 (select (arr!43496 _keys!1590) from!1980) lt!591189 lt!591190))))

(declare-fun lt!591191 () ListLongMap!21399)

(assert (=> b!1330967 (contains!8807 lt!591191 k0!1153)))

(declare-fun lt!591192 () Unit!43604)

(assert (=> b!1330967 (= lt!591192 (lemmaInListMapAfterAddingDiffThenInBefore!252 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591191))))

(declare-fun +!4696 (ListLongMap!21399 tuple2!23742) ListLongMap!21399)

(assert (=> b!1330967 (= lt!591191 (+!4696 lt!591190 (tuple2!23743 (select (arr!43496 _keys!1590) from!1980) lt!591189)))))

(declare-fun get!21929 (ValueCell!17411 V!53929) V!53929)

(declare-fun dynLambda!3626 (Int (_ BitVec 64)) V!53929)

(assert (=> b!1330967 (= lt!591189 (get!21929 (select (arr!43495 _values!1320) from!1980) (dynLambda!3626 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6334 (array!90059 array!90057 (_ BitVec 32) (_ BitVec 32) V!53929 V!53929 (_ BitVec 32) Int) ListLongMap!21399)

(assert (=> b!1330967 (= lt!591190 (getCurrentListMapNoExtraKeys!6334 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1330968 () Bool)

(declare-fun res!883206 () Bool)

(assert (=> b!1330968 (=> (not res!883206) (not e!758486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330968 (= res!883206 (validKeyInArray!0 (select (arr!43496 _keys!1590) from!1980)))))

(declare-fun b!1330969 () Bool)

(declare-fun res!883203 () Bool)

(assert (=> b!1330969 (=> (not res!883203) (not e!758486))))

(assert (=> b!1330969 (= res!883203 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44048 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330970 () Bool)

(declare-fun res!883201 () Bool)

(assert (=> b!1330970 (=> (not res!883201) (not e!758486))))

(assert (=> b!1330970 (= res!883201 (not (= (select (arr!43496 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330972 () Bool)

(declare-fun res!883205 () Bool)

(assert (=> b!1330972 (=> (not res!883205) (not e!758486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90059 (_ BitVec 32)) Bool)

(assert (=> b!1330972 (= res!883205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56602 () Bool)

(declare-fun tp!107764 () Bool)

(declare-fun e!758488 () Bool)

(assert (=> mapNonEmpty!56602 (= mapRes!56602 (and tp!107764 e!758488))))

(declare-fun mapKey!56602 () (_ BitVec 32))

(declare-fun mapRest!56602 () (Array (_ BitVec 32) ValueCell!17411))

(declare-fun mapValue!56602 () ValueCell!17411)

(assert (=> mapNonEmpty!56602 (= (arr!43495 _values!1320) (store mapRest!56602 mapKey!56602 mapValue!56602))))

(declare-fun b!1330973 () Bool)

(declare-fun res!883202 () Bool)

(assert (=> b!1330973 (=> (not res!883202) (not e!758486))))

(assert (=> b!1330973 (= res!883202 (and (= (size!44047 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44048 _keys!1590) (size!44047 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330974 () Bool)

(declare-fun tp_is_empty!36619 () Bool)

(assert (=> b!1330974 (= e!758488 tp_is_empty!36619)))

(declare-fun res!883199 () Bool)

(assert (=> start!112314 (=> (not res!883199) (not e!758486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112314 (= res!883199 (validMask!0 mask!1998))))

(assert (=> start!112314 e!758486))

(declare-fun array_inv!32989 (array!90057) Bool)

(assert (=> start!112314 (and (array_inv!32989 _values!1320) e!758485)))

(assert (=> start!112314 true))

(declare-fun array_inv!32990 (array!90059) Bool)

(assert (=> start!112314 (array_inv!32990 _keys!1590)))

(assert (=> start!112314 tp!107765))

(assert (=> start!112314 tp_is_empty!36619))

(declare-fun b!1330971 () Bool)

(assert (=> b!1330971 (= e!758487 tp_is_empty!36619)))

(assert (= (and start!112314 res!883199) b!1330973))

(assert (= (and b!1330973 res!883202) b!1330972))

(assert (= (and b!1330972 res!883205) b!1330966))

(assert (= (and b!1330966 res!883200) b!1330969))

(assert (= (and b!1330969 res!883203) b!1330963))

(assert (= (and b!1330963 res!883207) b!1330970))

(assert (= (and b!1330970 res!883201) b!1330968))

(assert (= (and b!1330968 res!883206) b!1330964))

(assert (= (and b!1330964 res!883204) b!1330967))

(assert (= (and b!1330965 condMapEmpty!56602) mapIsEmpty!56602))

(assert (= (and b!1330965 (not condMapEmpty!56602)) mapNonEmpty!56602))

(get-info :version)

(assert (= (and mapNonEmpty!56602 ((_ is ValueCellFull!17411) mapValue!56602)) b!1330974))

(assert (= (and b!1330965 ((_ is ValueCellFull!17411) mapDefault!56602)) b!1330971))

(assert (= start!112314 b!1330965))

(declare-fun b_lambda!23959 () Bool)

(assert (=> (not b_lambda!23959) (not b!1330967)))

(declare-fun t!44996 () Bool)

(declare-fun tb!11917 () Bool)

(assert (=> (and start!112314 (= defaultEntry!1323 defaultEntry!1323) t!44996) tb!11917))

(declare-fun result!24913 () Bool)

(assert (=> tb!11917 (= result!24913 tp_is_empty!36619)))

(assert (=> b!1330967 t!44996))

(declare-fun b_and!49457 () Bool)

(assert (= b_and!49455 (and (=> t!44996 result!24913) b_and!49457)))

(declare-fun m!1219179 () Bool)

(assert (=> start!112314 m!1219179))

(declare-fun m!1219181 () Bool)

(assert (=> start!112314 m!1219181))

(declare-fun m!1219183 () Bool)

(assert (=> start!112314 m!1219183))

(declare-fun m!1219185 () Bool)

(assert (=> b!1330970 m!1219185))

(declare-fun m!1219187 () Bool)

(assert (=> b!1330966 m!1219187))

(declare-fun m!1219189 () Bool)

(assert (=> b!1330972 m!1219189))

(assert (=> b!1330968 m!1219185))

(assert (=> b!1330968 m!1219185))

(declare-fun m!1219191 () Bool)

(assert (=> b!1330968 m!1219191))

(declare-fun m!1219193 () Bool)

(assert (=> b!1330967 m!1219193))

(declare-fun m!1219195 () Bool)

(assert (=> b!1330967 m!1219195))

(declare-fun m!1219197 () Bool)

(assert (=> b!1330967 m!1219197))

(assert (=> b!1330967 m!1219195))

(declare-fun m!1219199 () Bool)

(assert (=> b!1330967 m!1219199))

(declare-fun m!1219201 () Bool)

(assert (=> b!1330967 m!1219201))

(assert (=> b!1330967 m!1219185))

(declare-fun m!1219203 () Bool)

(assert (=> b!1330967 m!1219203))

(declare-fun m!1219205 () Bool)

(assert (=> b!1330967 m!1219205))

(assert (=> b!1330967 m!1219197))

(declare-fun m!1219207 () Bool)

(assert (=> b!1330967 m!1219207))

(declare-fun m!1219209 () Bool)

(assert (=> b!1330967 m!1219209))

(assert (=> b!1330967 m!1219185))

(declare-fun m!1219211 () Bool)

(assert (=> b!1330963 m!1219211))

(assert (=> b!1330963 m!1219211))

(declare-fun m!1219213 () Bool)

(assert (=> b!1330963 m!1219213))

(declare-fun m!1219215 () Bool)

(assert (=> mapNonEmpty!56602 m!1219215))

(check-sat (not b!1330963) (not b_next!30709) (not b!1330966) (not b_lambda!23959) (not b!1330967) (not b!1330968) (not start!112314) tp_is_empty!36619 b_and!49457 (not mapNonEmpty!56602) (not b!1330972))
(check-sat b_and!49457 (not b_next!30709))
