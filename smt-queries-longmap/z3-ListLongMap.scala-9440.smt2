; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112248 () Bool)

(assert start!112248)

(declare-fun b_free!30643 () Bool)

(declare-fun b_next!30643 () Bool)

(assert (=> start!112248 (= b_free!30643 (not b_next!30643))))

(declare-fun tp!107567 () Bool)

(declare-fun b_and!49323 () Bool)

(assert (=> start!112248 (= tp!107567 b_and!49323)))

(declare-fun res!882314 () Bool)

(declare-fun e!757992 () Bool)

(assert (=> start!112248 (=> (not res!882314) (not e!757992))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112248 (= res!882314 (validMask!0 mask!1998))))

(assert (=> start!112248 e!757992))

(declare-datatypes ((V!53841 0))(
  ( (V!53842 (val!18351 Int)) )
))
(declare-datatypes ((ValueCell!17378 0))(
  ( (ValueCellFull!17378 (v!20987 V!53841)) (EmptyCell!17378) )
))
(declare-datatypes ((array!89929 0))(
  ( (array!89930 (arr!43431 (Array (_ BitVec 32) ValueCell!17378)) (size!43983 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89929)

(declare-fun e!757990 () Bool)

(declare-fun array_inv!32939 (array!89929) Bool)

(assert (=> start!112248 (and (array_inv!32939 _values!1320) e!757990)))

(assert (=> start!112248 true))

(declare-datatypes ((array!89931 0))(
  ( (array!89932 (arr!43432 (Array (_ BitVec 32) (_ BitVec 64))) (size!43984 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89931)

(declare-fun array_inv!32940 (array!89931) Bool)

(assert (=> start!112248 (array_inv!32940 _keys!1590)))

(assert (=> start!112248 tp!107567))

(declare-fun tp_is_empty!36553 () Bool)

(assert (=> start!112248 tp_is_empty!36553))

(declare-fun b!1329709 () Bool)

(declare-fun res!882312 () Bool)

(assert (=> b!1329709 (=> (not res!882312) (not e!757992))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329709 (= res!882312 (validKeyInArray!0 (select (arr!43432 _keys!1590) from!1980)))))

(declare-fun b!1329710 () Bool)

(declare-fun res!882311 () Bool)

(assert (=> b!1329710 (=> (not res!882311) (not e!757992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89931 (_ BitVec 32)) Bool)

(assert (=> b!1329710 (= res!882311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329711 () Bool)

(declare-fun res!882310 () Bool)

(assert (=> b!1329711 (=> (not res!882310) (not e!757992))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1329711 (= res!882310 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43984 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329712 () Bool)

(declare-fun e!757991 () Bool)

(assert (=> b!1329712 (= e!757991 tp_is_empty!36553)))

(declare-fun b!1329713 () Bool)

(declare-fun res!882309 () Bool)

(assert (=> b!1329713 (=> (not res!882309) (not e!757992))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53841)

(declare-fun zeroValue!1262 () V!53841)

(declare-datatypes ((tuple2!23690 0))(
  ( (tuple2!23691 (_1!11856 (_ BitVec 64)) (_2!11856 V!53841)) )
))
(declare-datatypes ((List!30838 0))(
  ( (Nil!30835) (Cons!30834 (h!32043 tuple2!23690) (t!44886 List!30838)) )
))
(declare-datatypes ((ListLongMap!21347 0))(
  ( (ListLongMap!21348 (toList!10689 List!30838)) )
))
(declare-fun contains!8781 (ListLongMap!21347 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5557 (array!89931 array!89929 (_ BitVec 32) (_ BitVec 32) V!53841 V!53841 (_ BitVec 32) Int) ListLongMap!21347)

(assert (=> b!1329713 (= res!882309 (contains!8781 (getCurrentListMap!5557 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329714 () Bool)

(declare-fun mapRes!56503 () Bool)

(assert (=> b!1329714 (= e!757990 (and e!757991 mapRes!56503))))

(declare-fun condMapEmpty!56503 () Bool)

(declare-fun mapDefault!56503 () ValueCell!17378)

(assert (=> b!1329714 (= condMapEmpty!56503 (= (arr!43431 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17378)) mapDefault!56503)))))

(declare-fun b!1329715 () Bool)

(declare-fun res!882313 () Bool)

(assert (=> b!1329715 (=> (not res!882313) (not e!757992))))

(declare-datatypes ((List!30839 0))(
  ( (Nil!30836) (Cons!30835 (h!32044 (_ BitVec 64)) (t!44887 List!30839)) )
))
(declare-fun arrayNoDuplicates!0 (array!89931 (_ BitVec 32) List!30839) Bool)

(assert (=> b!1329715 (= res!882313 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30836))))

(declare-fun b!1329716 () Bool)

(assert (=> b!1329716 (= e!757992 (not true))))

(declare-fun lt!590824 () ListLongMap!21347)

(assert (=> b!1329716 (contains!8781 lt!590824 k0!1153)))

(declare-datatypes ((Unit!43560 0))(
  ( (Unit!43561) )
))
(declare-fun lt!590823 () Unit!43560)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!230 ((_ BitVec 64) (_ BitVec 64) V!53841 ListLongMap!21347) Unit!43560)

(assert (=> b!1329716 (= lt!590823 (lemmaInListMapAfterAddingDiffThenInBefore!230 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590824))))

(declare-fun +!4674 (ListLongMap!21347 tuple2!23690) ListLongMap!21347)

(declare-fun getCurrentListMapNoExtraKeys!6312 (array!89931 array!89929 (_ BitVec 32) (_ BitVec 32) V!53841 V!53841 (_ BitVec 32) Int) ListLongMap!21347)

(declare-fun get!21885 (ValueCell!17378 V!53841) V!53841)

(declare-fun dynLambda!3604 (Int (_ BitVec 64)) V!53841)

(assert (=> b!1329716 (= lt!590824 (+!4674 (getCurrentListMapNoExtraKeys!6312 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23691 (select (arr!43432 _keys!1590) from!1980) (get!21885 (select (arr!43431 _values!1320) from!1980) (dynLambda!3604 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329717 () Bool)

(declare-fun res!882308 () Bool)

(assert (=> b!1329717 (=> (not res!882308) (not e!757992))))

(assert (=> b!1329717 (= res!882308 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!56503 () Bool)

(assert (=> mapIsEmpty!56503 mapRes!56503))

(declare-fun b!1329718 () Bool)

(declare-fun res!882315 () Bool)

(assert (=> b!1329718 (=> (not res!882315) (not e!757992))))

(assert (=> b!1329718 (= res!882315 (not (= (select (arr!43432 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1329719 () Bool)

(declare-fun e!757989 () Bool)

(assert (=> b!1329719 (= e!757989 tp_is_empty!36553)))

(declare-fun b!1329720 () Bool)

(declare-fun res!882316 () Bool)

(assert (=> b!1329720 (=> (not res!882316) (not e!757992))))

(assert (=> b!1329720 (= res!882316 (and (= (size!43983 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43984 _keys!1590) (size!43983 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56503 () Bool)

(declare-fun tp!107566 () Bool)

(assert (=> mapNonEmpty!56503 (= mapRes!56503 (and tp!107566 e!757989))))

(declare-fun mapRest!56503 () (Array (_ BitVec 32) ValueCell!17378))

(declare-fun mapKey!56503 () (_ BitVec 32))

(declare-fun mapValue!56503 () ValueCell!17378)

(assert (=> mapNonEmpty!56503 (= (arr!43431 _values!1320) (store mapRest!56503 mapKey!56503 mapValue!56503))))

(assert (= (and start!112248 res!882314) b!1329720))

(assert (= (and b!1329720 res!882316) b!1329710))

(assert (= (and b!1329710 res!882311) b!1329715))

(assert (= (and b!1329715 res!882313) b!1329711))

(assert (= (and b!1329711 res!882310) b!1329713))

(assert (= (and b!1329713 res!882309) b!1329718))

(assert (= (and b!1329718 res!882315) b!1329709))

(assert (= (and b!1329709 res!882312) b!1329717))

(assert (= (and b!1329717 res!882308) b!1329716))

(assert (= (and b!1329714 condMapEmpty!56503) mapIsEmpty!56503))

(assert (= (and b!1329714 (not condMapEmpty!56503)) mapNonEmpty!56503))

(get-info :version)

(assert (= (and mapNonEmpty!56503 ((_ is ValueCellFull!17378) mapValue!56503)) b!1329719))

(assert (= (and b!1329714 ((_ is ValueCellFull!17378) mapDefault!56503)) b!1329712))

(assert (= start!112248 b!1329714))

(declare-fun b_lambda!23893 () Bool)

(assert (=> (not b_lambda!23893) (not b!1329716)))

(declare-fun t!44885 () Bool)

(declare-fun tb!11851 () Bool)

(assert (=> (and start!112248 (= defaultEntry!1323 defaultEntry!1323) t!44885) tb!11851))

(declare-fun result!24781 () Bool)

(assert (=> tb!11851 (= result!24781 tp_is_empty!36553)))

(assert (=> b!1329716 t!44885))

(declare-fun b_and!49325 () Bool)

(assert (= b_and!49323 (and (=> t!44885 result!24781) b_and!49325)))

(declare-fun m!1217985 () Bool)

(assert (=> b!1329715 m!1217985))

(declare-fun m!1217987 () Bool)

(assert (=> b!1329710 m!1217987))

(declare-fun m!1217989 () Bool)

(assert (=> b!1329709 m!1217989))

(assert (=> b!1329709 m!1217989))

(declare-fun m!1217991 () Bool)

(assert (=> b!1329709 m!1217991))

(assert (=> b!1329718 m!1217989))

(declare-fun m!1217993 () Bool)

(assert (=> mapNonEmpty!56503 m!1217993))

(declare-fun m!1217995 () Bool)

(assert (=> start!112248 m!1217995))

(declare-fun m!1217997 () Bool)

(assert (=> start!112248 m!1217997))

(declare-fun m!1217999 () Bool)

(assert (=> start!112248 m!1217999))

(declare-fun m!1218001 () Bool)

(assert (=> b!1329713 m!1218001))

(assert (=> b!1329713 m!1218001))

(declare-fun m!1218003 () Bool)

(assert (=> b!1329713 m!1218003))

(declare-fun m!1218005 () Bool)

(assert (=> b!1329716 m!1218005))

(declare-fun m!1218007 () Bool)

(assert (=> b!1329716 m!1218007))

(declare-fun m!1218009 () Bool)

(assert (=> b!1329716 m!1218009))

(assert (=> b!1329716 m!1218007))

(declare-fun m!1218011 () Bool)

(assert (=> b!1329716 m!1218011))

(declare-fun m!1218013 () Bool)

(assert (=> b!1329716 m!1218013))

(assert (=> b!1329716 m!1218009))

(assert (=> b!1329716 m!1217989))

(declare-fun m!1218015 () Bool)

(assert (=> b!1329716 m!1218015))

(assert (=> b!1329716 m!1218013))

(declare-fun m!1218017 () Bool)

(assert (=> b!1329716 m!1218017))

(check-sat (not b!1329710) tp_is_empty!36553 (not mapNonEmpty!56503) (not b_lambda!23893) (not b_next!30643) (not b!1329716) b_and!49325 (not b!1329713) (not b!1329715) (not b!1329709) (not start!112248))
(check-sat b_and!49325 (not b_next!30643))
