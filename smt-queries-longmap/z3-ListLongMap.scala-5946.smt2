; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77494 () Bool)

(assert start!77494)

(declare-fun b!903033 () Bool)

(declare-fun res!609314 () Bool)

(declare-fun e!505893 () Bool)

(assert (=> b!903033 (=> (not res!609314) (not e!505893))))

(declare-datatypes ((array!53072 0))(
  ( (array!53073 (arr!25496 (Array (_ BitVec 32) (_ BitVec 64))) (size!25955 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53072)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53072 (_ BitVec 32)) Bool)

(assert (=> b!903033 (= res!609314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903034 () Bool)

(declare-fun e!505891 () Bool)

(declare-fun tp_is_empty!18507 () Bool)

(assert (=> b!903034 (= e!505891 tp_is_empty!18507)))

(declare-fun b!903035 () Bool)

(declare-fun res!609317 () Bool)

(assert (=> b!903035 (=> (not res!609317) (not e!505893))))

(declare-datatypes ((V!29641 0))(
  ( (V!29642 (val!9304 Int)) )
))
(declare-datatypes ((ValueCell!8772 0))(
  ( (ValueCellFull!8772 (v!11809 V!29641)) (EmptyCell!8772) )
))
(declare-datatypes ((array!53074 0))(
  ( (array!53075 (arr!25497 (Array (_ BitVec 32) ValueCell!8772)) (size!25956 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53074)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903035 (= res!609317 (and (= (size!25956 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25955 _keys!1386) (size!25956 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609316 () Bool)

(assert (=> start!77494 (=> (not res!609316) (not e!505893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77494 (= res!609316 (validMask!0 mask!1756))))

(assert (=> start!77494 e!505893))

(assert (=> start!77494 true))

(declare-fun e!505890 () Bool)

(declare-fun array_inv!19986 (array!53074) Bool)

(assert (=> start!77494 (and (array_inv!19986 _values!1152) e!505890)))

(declare-fun array_inv!19987 (array!53072) Bool)

(assert (=> start!77494 (array_inv!19987 _keys!1386)))

(declare-fun b!903036 () Bool)

(declare-fun mapRes!29470 () Bool)

(assert (=> b!903036 (= e!505890 (and e!505891 mapRes!29470))))

(declare-fun condMapEmpty!29470 () Bool)

(declare-fun mapDefault!29470 () ValueCell!8772)

(assert (=> b!903036 (= condMapEmpty!29470 (= (arr!25497 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8772)) mapDefault!29470)))))

(declare-fun b!903037 () Bool)

(declare-fun e!505889 () Bool)

(assert (=> b!903037 (= e!505889 tp_is_empty!18507)))

(declare-fun b!903038 () Bool)

(assert (=> b!903038 (= e!505893 (bvsgt #b00000000000000000000000000000000 (size!25955 _keys!1386)))))

(declare-fun mapIsEmpty!29470 () Bool)

(assert (=> mapIsEmpty!29470 mapRes!29470))

(declare-fun b!903039 () Bool)

(declare-fun res!609315 () Bool)

(assert (=> b!903039 (=> (not res!609315) (not e!505893))))

(declare-datatypes ((List!17903 0))(
  ( (Nil!17900) (Cons!17899 (h!19045 (_ BitVec 64)) (t!25286 List!17903)) )
))
(declare-fun arrayNoDuplicates!0 (array!53072 (_ BitVec 32) List!17903) Bool)

(assert (=> b!903039 (= res!609315 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17900))))

(declare-fun mapNonEmpty!29470 () Bool)

(declare-fun tp!56529 () Bool)

(assert (=> mapNonEmpty!29470 (= mapRes!29470 (and tp!56529 e!505889))))

(declare-fun mapRest!29470 () (Array (_ BitVec 32) ValueCell!8772))

(declare-fun mapKey!29470 () (_ BitVec 32))

(declare-fun mapValue!29470 () ValueCell!8772)

(assert (=> mapNonEmpty!29470 (= (arr!25497 _values!1152) (store mapRest!29470 mapKey!29470 mapValue!29470))))

(assert (= (and start!77494 res!609316) b!903035))

(assert (= (and b!903035 res!609317) b!903033))

(assert (= (and b!903033 res!609314) b!903039))

(assert (= (and b!903039 res!609315) b!903038))

(assert (= (and b!903036 condMapEmpty!29470) mapIsEmpty!29470))

(assert (= (and b!903036 (not condMapEmpty!29470)) mapNonEmpty!29470))

(get-info :version)

(assert (= (and mapNonEmpty!29470 ((_ is ValueCellFull!8772) mapValue!29470)) b!903037))

(assert (= (and b!903036 ((_ is ValueCellFull!8772) mapDefault!29470)) b!903034))

(assert (= start!77494 b!903036))

(declare-fun m!838831 () Bool)

(assert (=> b!903033 m!838831))

(declare-fun m!838833 () Bool)

(assert (=> start!77494 m!838833))

(declare-fun m!838835 () Bool)

(assert (=> start!77494 m!838835))

(declare-fun m!838837 () Bool)

(assert (=> start!77494 m!838837))

(declare-fun m!838839 () Bool)

(assert (=> b!903039 m!838839))

(declare-fun m!838841 () Bool)

(assert (=> mapNonEmpty!29470 m!838841))

(check-sat (not b!903033) (not start!77494) (not b!903039) tp_is_empty!18507 (not mapNonEmpty!29470))
(check-sat)
(get-model)

(declare-fun d!111993 () Bool)

(assert (=> d!111993 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77494 d!111993))

(declare-fun d!111995 () Bool)

(assert (=> d!111995 (= (array_inv!19986 _values!1152) (bvsge (size!25956 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77494 d!111995))

(declare-fun d!111997 () Bool)

(assert (=> d!111997 (= (array_inv!19987 _keys!1386) (bvsge (size!25955 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77494 d!111997))

(declare-fun b!903069 () Bool)

(declare-fun e!505917 () Bool)

(declare-fun call!40249 () Bool)

(assert (=> b!903069 (= e!505917 call!40249)))

(declare-fun d!111999 () Bool)

(declare-fun res!609334 () Bool)

(declare-fun e!505916 () Bool)

(assert (=> d!111999 (=> res!609334 e!505916)))

(assert (=> d!111999 (= res!609334 (bvsge #b00000000000000000000000000000000 (size!25955 _keys!1386)))))

(assert (=> d!111999 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!505916)))

(declare-fun b!903070 () Bool)

(declare-fun e!505915 () Bool)

(assert (=> b!903070 (= e!505917 e!505915)))

(declare-fun lt!407958 () (_ BitVec 64))

(assert (=> b!903070 (= lt!407958 (select (arr!25496 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30646 0))(
  ( (Unit!30647) )
))
(declare-fun lt!407956 () Unit!30646)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!53072 (_ BitVec 64) (_ BitVec 32)) Unit!30646)

(assert (=> b!903070 (= lt!407956 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!407958 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!53072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903070 (arrayContainsKey!0 _keys!1386 lt!407958 #b00000000000000000000000000000000)))

(declare-fun lt!407957 () Unit!30646)

(assert (=> b!903070 (= lt!407957 lt!407956)))

(declare-fun res!609335 () Bool)

(declare-datatypes ((SeekEntryResult!8962 0))(
  ( (MissingZero!8962 (index!38219 (_ BitVec 32))) (Found!8962 (index!38220 (_ BitVec 32))) (Intermediate!8962 (undefined!9774 Bool) (index!38221 (_ BitVec 32)) (x!77007 (_ BitVec 32))) (Undefined!8962) (MissingVacant!8962 (index!38222 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!53072 (_ BitVec 32)) SeekEntryResult!8962)

(assert (=> b!903070 (= res!609335 (= (seekEntryOrOpen!0 (select (arr!25496 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8962 #b00000000000000000000000000000000)))))

(assert (=> b!903070 (=> (not res!609335) (not e!505915))))

(declare-fun bm!40246 () Bool)

(assert (=> bm!40246 (= call!40249 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!903071 () Bool)

(assert (=> b!903071 (= e!505915 call!40249)))

(declare-fun b!903072 () Bool)

(assert (=> b!903072 (= e!505916 e!505917)))

(declare-fun c!95645 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!903072 (= c!95645 (validKeyInArray!0 (select (arr!25496 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!111999 (not res!609334)) b!903072))

(assert (= (and b!903072 c!95645) b!903070))

(assert (= (and b!903072 (not c!95645)) b!903069))

(assert (= (and b!903070 res!609335) b!903071))

(assert (= (or b!903071 b!903069) bm!40246))

(declare-fun m!838855 () Bool)

(assert (=> b!903070 m!838855))

(declare-fun m!838857 () Bool)

(assert (=> b!903070 m!838857))

(declare-fun m!838859 () Bool)

(assert (=> b!903070 m!838859))

(assert (=> b!903070 m!838855))

(declare-fun m!838861 () Bool)

(assert (=> b!903070 m!838861))

(declare-fun m!838863 () Bool)

(assert (=> bm!40246 m!838863))

(assert (=> b!903072 m!838855))

(assert (=> b!903072 m!838855))

(declare-fun m!838865 () Bool)

(assert (=> b!903072 m!838865))

(assert (=> b!903033 d!111999))

(declare-fun d!112001 () Bool)

(declare-fun res!609344 () Bool)

(declare-fun e!505926 () Bool)

(assert (=> d!112001 (=> res!609344 e!505926)))

(assert (=> d!112001 (= res!609344 (bvsge #b00000000000000000000000000000000 (size!25955 _keys!1386)))))

(assert (=> d!112001 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17900) e!505926)))

(declare-fun b!903083 () Bool)

(declare-fun e!505927 () Bool)

(assert (=> b!903083 (= e!505926 e!505927)))

(declare-fun res!609342 () Bool)

(assert (=> b!903083 (=> (not res!609342) (not e!505927))))

(declare-fun e!505929 () Bool)

(assert (=> b!903083 (= res!609342 (not e!505929))))

(declare-fun res!609343 () Bool)

(assert (=> b!903083 (=> (not res!609343) (not e!505929))))

(assert (=> b!903083 (= res!609343 (validKeyInArray!0 (select (arr!25496 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!903084 () Bool)

(declare-fun e!505928 () Bool)

(declare-fun call!40252 () Bool)

(assert (=> b!903084 (= e!505928 call!40252)))

(declare-fun b!903085 () Bool)

(assert (=> b!903085 (= e!505928 call!40252)))

(declare-fun b!903086 () Bool)

(declare-fun contains!4453 (List!17903 (_ BitVec 64)) Bool)

(assert (=> b!903086 (= e!505929 (contains!4453 Nil!17900 (select (arr!25496 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!903087 () Bool)

(assert (=> b!903087 (= e!505927 e!505928)))

(declare-fun c!95648 () Bool)

(assert (=> b!903087 (= c!95648 (validKeyInArray!0 (select (arr!25496 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40249 () Bool)

(assert (=> bm!40249 (= call!40252 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95648 (Cons!17899 (select (arr!25496 _keys!1386) #b00000000000000000000000000000000) Nil!17900) Nil!17900)))))

(assert (= (and d!112001 (not res!609344)) b!903083))

(assert (= (and b!903083 res!609343) b!903086))

(assert (= (and b!903083 res!609342) b!903087))

(assert (= (and b!903087 c!95648) b!903084))

(assert (= (and b!903087 (not c!95648)) b!903085))

(assert (= (or b!903084 b!903085) bm!40249))

(assert (=> b!903083 m!838855))

(assert (=> b!903083 m!838855))

(assert (=> b!903083 m!838865))

(assert (=> b!903086 m!838855))

(assert (=> b!903086 m!838855))

(declare-fun m!838867 () Bool)

(assert (=> b!903086 m!838867))

(assert (=> b!903087 m!838855))

(assert (=> b!903087 m!838855))

(assert (=> b!903087 m!838865))

(assert (=> bm!40249 m!838855))

(declare-fun m!838869 () Bool)

(assert (=> bm!40249 m!838869))

(assert (=> b!903039 d!112001))

(declare-fun mapIsEmpty!29476 () Bool)

(declare-fun mapRes!29476 () Bool)

(assert (=> mapIsEmpty!29476 mapRes!29476))

(declare-fun condMapEmpty!29476 () Bool)

(declare-fun mapDefault!29476 () ValueCell!8772)

(assert (=> mapNonEmpty!29470 (= condMapEmpty!29476 (= mapRest!29470 ((as const (Array (_ BitVec 32) ValueCell!8772)) mapDefault!29476)))))

(declare-fun e!505934 () Bool)

(assert (=> mapNonEmpty!29470 (= tp!56529 (and e!505934 mapRes!29476))))

(declare-fun b!903094 () Bool)

(declare-fun e!505935 () Bool)

(assert (=> b!903094 (= e!505935 tp_is_empty!18507)))

(declare-fun b!903095 () Bool)

(assert (=> b!903095 (= e!505934 tp_is_empty!18507)))

(declare-fun mapNonEmpty!29476 () Bool)

(declare-fun tp!56535 () Bool)

(assert (=> mapNonEmpty!29476 (= mapRes!29476 (and tp!56535 e!505935))))

(declare-fun mapValue!29476 () ValueCell!8772)

(declare-fun mapRest!29476 () (Array (_ BitVec 32) ValueCell!8772))

(declare-fun mapKey!29476 () (_ BitVec 32))

(assert (=> mapNonEmpty!29476 (= mapRest!29470 (store mapRest!29476 mapKey!29476 mapValue!29476))))

(assert (= (and mapNonEmpty!29470 condMapEmpty!29476) mapIsEmpty!29476))

(assert (= (and mapNonEmpty!29470 (not condMapEmpty!29476)) mapNonEmpty!29476))

(assert (= (and mapNonEmpty!29476 ((_ is ValueCellFull!8772) mapValue!29476)) b!903094))

(assert (= (and mapNonEmpty!29470 ((_ is ValueCellFull!8772) mapDefault!29476)) b!903095))

(declare-fun m!838871 () Bool)

(assert (=> mapNonEmpty!29476 m!838871))

(check-sat (not b!903086) (not b!903070) (not b!903087) (not bm!40246) (not b!903072) (not b!903083) (not bm!40249) (not mapNonEmpty!29476) tp_is_empty!18507)
(check-sat)
