; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112424 () Bool)

(assert start!112424)

(declare-fun b_free!30595 () Bool)

(declare-fun b_next!30595 () Bool)

(assert (=> start!112424 (= b_free!30595 (not b_next!30595))))

(declare-fun tp!107421 () Bool)

(declare-fun b_and!49247 () Bool)

(assert (=> start!112424 (= tp!107421 b_and!49247)))

(declare-fun res!882214 () Bool)

(declare-fun e!758509 () Bool)

(assert (=> start!112424 (=> (not res!882214) (not e!758509))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112424 (= res!882214 (validMask!0 mask!1998))))

(assert (=> start!112424 e!758509))

(declare-datatypes ((V!53777 0))(
  ( (V!53778 (val!18327 Int)) )
))
(declare-datatypes ((ValueCell!17354 0))(
  ( (ValueCellFull!17354 (v!20959 V!53777)) (EmptyCell!17354) )
))
(declare-datatypes ((array!90011 0))(
  ( (array!90012 (arr!43467 (Array (_ BitVec 32) ValueCell!17354)) (size!44018 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90011)

(declare-fun e!758507 () Bool)

(declare-fun array_inv!33079 (array!90011) Bool)

(assert (=> start!112424 (and (array_inv!33079 _values!1320) e!758507)))

(assert (=> start!112424 true))

(declare-datatypes ((array!90013 0))(
  ( (array!90014 (arr!43468 (Array (_ BitVec 32) (_ BitVec 64))) (size!44019 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90013)

(declare-fun array_inv!33080 (array!90013) Bool)

(assert (=> start!112424 (array_inv!33080 _keys!1590)))

(assert (=> start!112424 tp!107421))

(declare-fun tp_is_empty!36505 () Bool)

(assert (=> start!112424 tp_is_empty!36505))

(declare-fun b!1330166 () Bool)

(declare-fun res!882210 () Bool)

(assert (=> b!1330166 (=> (not res!882210) (not e!758509))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1330166 (= res!882210 (not (= (select (arr!43468 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330167 () Bool)

(declare-fun e!758505 () Bool)

(declare-fun mapRes!56431 () Bool)

(assert (=> b!1330167 (= e!758507 (and e!758505 mapRes!56431))))

(declare-fun condMapEmpty!56431 () Bool)

(declare-fun mapDefault!56431 () ValueCell!17354)

(assert (=> b!1330167 (= condMapEmpty!56431 (= (arr!43467 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17354)) mapDefault!56431)))))

(declare-fun b!1330168 () Bool)

(declare-fun res!882211 () Bool)

(assert (=> b!1330168 (=> (not res!882211) (not e!758509))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1330168 (= res!882211 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330169 () Bool)

(declare-fun res!882208 () Bool)

(assert (=> b!1330169 (=> (not res!882208) (not e!758509))))

(declare-datatypes ((List!30794 0))(
  ( (Nil!30791) (Cons!30790 (h!32008 (_ BitVec 64)) (t!44794 List!30794)) )
))
(declare-fun arrayNoDuplicates!0 (array!90013 (_ BitVec 32) List!30794) Bool)

(assert (=> b!1330169 (= res!882208 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30791))))

(declare-fun mapIsEmpty!56431 () Bool)

(assert (=> mapIsEmpty!56431 mapRes!56431))

(declare-fun b!1330170 () Bool)

(assert (=> b!1330170 (= e!758509 false)))

(declare-fun lt!591357 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53777)

(declare-fun zeroValue!1262 () V!53777)

(declare-datatypes ((tuple2!23618 0))(
  ( (tuple2!23619 (_1!11820 (_ BitVec 64)) (_2!11820 V!53777)) )
))
(declare-datatypes ((List!30795 0))(
  ( (Nil!30792) (Cons!30791 (h!32009 tuple2!23618) (t!44795 List!30795)) )
))
(declare-datatypes ((ListLongMap!21283 0))(
  ( (ListLongMap!21284 (toList!10657 List!30795)) )
))
(declare-fun contains!8833 (ListLongMap!21283 (_ BitVec 64)) Bool)

(declare-fun +!4680 (ListLongMap!21283 tuple2!23618) ListLongMap!21283)

(declare-fun getCurrentListMapNoExtraKeys!6324 (array!90013 array!90011 (_ BitVec 32) (_ BitVec 32) V!53777 V!53777 (_ BitVec 32) Int) ListLongMap!21283)

(declare-fun get!21911 (ValueCell!17354 V!53777) V!53777)

(declare-fun dynLambda!3634 (Int (_ BitVec 64)) V!53777)

(assert (=> b!1330170 (= lt!591357 (contains!8833 (+!4680 (+!4680 (getCurrentListMapNoExtraKeys!6324 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23619 (select (arr!43468 _keys!1590) from!1980) (get!21911 (select (arr!43467 _values!1320) from!1980) (dynLambda!3634 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153))))

(declare-fun b!1330171 () Bool)

(declare-fun e!758508 () Bool)

(assert (=> b!1330171 (= e!758508 tp_is_empty!36505)))

(declare-fun b!1330172 () Bool)

(declare-fun res!882212 () Bool)

(assert (=> b!1330172 (=> (not res!882212) (not e!758509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90013 (_ BitVec 32)) Bool)

(assert (=> b!1330172 (= res!882212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56431 () Bool)

(declare-fun tp!107422 () Bool)

(assert (=> mapNonEmpty!56431 (= mapRes!56431 (and tp!107422 e!758508))))

(declare-fun mapValue!56431 () ValueCell!17354)

(declare-fun mapKey!56431 () (_ BitVec 32))

(declare-fun mapRest!56431 () (Array (_ BitVec 32) ValueCell!17354))

(assert (=> mapNonEmpty!56431 (= (arr!43467 _values!1320) (store mapRest!56431 mapKey!56431 mapValue!56431))))

(declare-fun b!1330173 () Bool)

(declare-fun res!882207 () Bool)

(assert (=> b!1330173 (=> (not res!882207) (not e!758509))))

(assert (=> b!1330173 (= res!882207 (and (= (size!44018 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44019 _keys!1590) (size!44018 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330174 () Bool)

(declare-fun res!882215 () Bool)

(assert (=> b!1330174 (=> (not res!882215) (not e!758509))))

(declare-fun getCurrentListMap!5634 (array!90013 array!90011 (_ BitVec 32) (_ BitVec 32) V!53777 V!53777 (_ BitVec 32) Int) ListLongMap!21283)

(assert (=> b!1330174 (= res!882215 (contains!8833 (getCurrentListMap!5634 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330175 () Bool)

(assert (=> b!1330175 (= e!758505 tp_is_empty!36505)))

(declare-fun b!1330176 () Bool)

(declare-fun res!882213 () Bool)

(assert (=> b!1330176 (=> (not res!882213) (not e!758509))))

(assert (=> b!1330176 (= res!882213 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44019 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330177 () Bool)

(declare-fun res!882209 () Bool)

(assert (=> b!1330177 (=> (not res!882209) (not e!758509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330177 (= res!882209 (validKeyInArray!0 (select (arr!43468 _keys!1590) from!1980)))))

(assert (= (and start!112424 res!882214) b!1330173))

(assert (= (and b!1330173 res!882207) b!1330172))

(assert (= (and b!1330172 res!882212) b!1330169))

(assert (= (and b!1330169 res!882208) b!1330176))

(assert (= (and b!1330176 res!882213) b!1330174))

(assert (= (and b!1330174 res!882215) b!1330166))

(assert (= (and b!1330166 res!882210) b!1330177))

(assert (= (and b!1330177 res!882209) b!1330168))

(assert (= (and b!1330168 res!882211) b!1330170))

(assert (= (and b!1330167 condMapEmpty!56431) mapIsEmpty!56431))

(assert (= (and b!1330167 (not condMapEmpty!56431)) mapNonEmpty!56431))

(get-info :version)

(assert (= (and mapNonEmpty!56431 ((_ is ValueCellFull!17354) mapValue!56431)) b!1330171))

(assert (= (and b!1330167 ((_ is ValueCellFull!17354) mapDefault!56431)) b!1330175))

(assert (= start!112424 b!1330167))

(declare-fun b_lambda!23849 () Bool)

(assert (=> (not b_lambda!23849) (not b!1330170)))

(declare-fun t!44793 () Bool)

(declare-fun tb!11803 () Bool)

(assert (=> (and start!112424 (= defaultEntry!1323 defaultEntry!1323) t!44793) tb!11803))

(declare-fun result!24685 () Bool)

(assert (=> tb!11803 (= result!24685 tp_is_empty!36505)))

(assert (=> b!1330170 t!44793))

(declare-fun b_and!49249 () Bool)

(assert (= b_and!49247 (and (=> t!44793 result!24685) b_and!49249)))

(declare-fun m!1219283 () Bool)

(assert (=> b!1330172 m!1219283))

(declare-fun m!1219285 () Bool)

(assert (=> b!1330177 m!1219285))

(assert (=> b!1330177 m!1219285))

(declare-fun m!1219287 () Bool)

(assert (=> b!1330177 m!1219287))

(declare-fun m!1219289 () Bool)

(assert (=> b!1330170 m!1219289))

(declare-fun m!1219291 () Bool)

(assert (=> b!1330170 m!1219291))

(declare-fun m!1219293 () Bool)

(assert (=> b!1330170 m!1219293))

(declare-fun m!1219295 () Bool)

(assert (=> b!1330170 m!1219295))

(declare-fun m!1219297 () Bool)

(assert (=> b!1330170 m!1219297))

(assert (=> b!1330170 m!1219291))

(declare-fun m!1219299 () Bool)

(assert (=> b!1330170 m!1219299))

(assert (=> b!1330170 m!1219289))

(assert (=> b!1330170 m!1219293))

(assert (=> b!1330170 m!1219285))

(assert (=> b!1330170 m!1219295))

(assert (=> b!1330170 m!1219299))

(declare-fun m!1219301 () Bool)

(assert (=> b!1330170 m!1219301))

(declare-fun m!1219303 () Bool)

(assert (=> b!1330169 m!1219303))

(declare-fun m!1219305 () Bool)

(assert (=> b!1330174 m!1219305))

(assert (=> b!1330174 m!1219305))

(declare-fun m!1219307 () Bool)

(assert (=> b!1330174 m!1219307))

(assert (=> b!1330166 m!1219285))

(declare-fun m!1219309 () Bool)

(assert (=> mapNonEmpty!56431 m!1219309))

(declare-fun m!1219311 () Bool)

(assert (=> start!112424 m!1219311))

(declare-fun m!1219313 () Bool)

(assert (=> start!112424 m!1219313))

(declare-fun m!1219315 () Bool)

(assert (=> start!112424 m!1219315))

(check-sat (not b!1330174) (not b!1330177) (not b_next!30595) b_and!49249 (not b!1330172) (not start!112424) (not b!1330170) (not b_lambda!23849) tp_is_empty!36505 (not mapNonEmpty!56431) (not b!1330169))
(check-sat b_and!49249 (not b_next!30595))
