; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112242 () Bool)

(assert start!112242)

(declare-datatypes ((V!53593 0))(
  ( (V!53594 (val!18258 Int)) )
))
(declare-datatypes ((ValueCell!17285 0))(
  ( (ValueCellFull!17285 (v!20889 V!53593)) (EmptyCell!17285) )
))
(declare-datatypes ((array!89737 0))(
  ( (array!89738 (arr!43335 (Array (_ BitVec 32) ValueCell!17285)) (size!43886 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89737)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89739 0))(
  ( (array!89740 (arr!43336 (Array (_ BitVec 32) (_ BitVec 64))) (size!43887 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89739)

(declare-fun e!757379 () Bool)

(declare-fun b!1328584 () Bool)

(assert (=> b!1328584 (= e!757379 (and (= (size!43886 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43887 _keys!1590) (size!43886 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011) (= (size!43887 _keys!1590) (bvadd #b00000000000000000000000000000001 mask!1998)) (bvsgt #b00000000000000000000000000000000 (size!43887 _keys!1590))))))

(declare-fun b!1328585 () Bool)

(declare-fun e!757378 () Bool)

(declare-fun tp_is_empty!36367 () Bool)

(assert (=> b!1328585 (= e!757378 tp_is_empty!36367)))

(declare-fun mapIsEmpty!56209 () Bool)

(declare-fun mapRes!56209 () Bool)

(assert (=> mapIsEmpty!56209 mapRes!56209))

(declare-fun res!881310 () Bool)

(assert (=> start!112242 (=> (not res!881310) (not e!757379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112242 (= res!881310 (validMask!0 mask!1998))))

(assert (=> start!112242 e!757379))

(assert (=> start!112242 true))

(declare-fun e!757375 () Bool)

(declare-fun array_inv!32971 (array!89737) Bool)

(assert (=> start!112242 (and (array_inv!32971 _values!1320) e!757375)))

(declare-fun array_inv!32972 (array!89739) Bool)

(assert (=> start!112242 (array_inv!32972 _keys!1590)))

(declare-fun b!1328586 () Bool)

(declare-fun e!757377 () Bool)

(assert (=> b!1328586 (= e!757377 tp_is_empty!36367)))

(declare-fun b!1328587 () Bool)

(assert (=> b!1328587 (= e!757375 (and e!757378 mapRes!56209))))

(declare-fun condMapEmpty!56209 () Bool)

(declare-fun mapDefault!56209 () ValueCell!17285)

(assert (=> b!1328587 (= condMapEmpty!56209 (= (arr!43335 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17285)) mapDefault!56209)))))

(declare-fun mapNonEmpty!56209 () Bool)

(declare-fun tp!107116 () Bool)

(assert (=> mapNonEmpty!56209 (= mapRes!56209 (and tp!107116 e!757377))))

(declare-fun mapValue!56209 () ValueCell!17285)

(declare-fun mapKey!56209 () (_ BitVec 32))

(declare-fun mapRest!56209 () (Array (_ BitVec 32) ValueCell!17285))

(assert (=> mapNonEmpty!56209 (= (arr!43335 _values!1320) (store mapRest!56209 mapKey!56209 mapValue!56209))))

(assert (= (and start!112242 res!881310) b!1328584))

(assert (= (and b!1328587 condMapEmpty!56209) mapIsEmpty!56209))

(assert (= (and b!1328587 (not condMapEmpty!56209)) mapNonEmpty!56209))

(get-info :version)

(assert (= (and mapNonEmpty!56209 ((_ is ValueCellFull!17285) mapValue!56209)) b!1328586))

(assert (= (and b!1328587 ((_ is ValueCellFull!17285) mapDefault!56209)) b!1328585))

(assert (= start!112242 b!1328587))

(declare-fun m!1218271 () Bool)

(assert (=> start!112242 m!1218271))

(declare-fun m!1218273 () Bool)

(assert (=> start!112242 m!1218273))

(declare-fun m!1218275 () Bool)

(assert (=> start!112242 m!1218275))

(declare-fun m!1218277 () Bool)

(assert (=> mapNonEmpty!56209 m!1218277))

(check-sat (not start!112242) (not mapNonEmpty!56209) tp_is_empty!36367)
(check-sat)
(get-model)

(declare-fun d!143743 () Bool)

(assert (=> d!143743 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112242 d!143743))

(declare-fun d!143745 () Bool)

(assert (=> d!143745 (= (array_inv!32971 _values!1320) (bvsge (size!43886 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112242 d!143745))

(declare-fun d!143747 () Bool)

(assert (=> d!143747 (= (array_inv!32972 _keys!1590) (bvsge (size!43887 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112242 d!143747))

(declare-fun mapNonEmpty!56218 () Bool)

(declare-fun mapRes!56218 () Bool)

(declare-fun tp!107125 () Bool)

(declare-fun e!757414 () Bool)

(assert (=> mapNonEmpty!56218 (= mapRes!56218 (and tp!107125 e!757414))))

(declare-fun mapValue!56218 () ValueCell!17285)

(declare-fun mapKey!56218 () (_ BitVec 32))

(declare-fun mapRest!56218 () (Array (_ BitVec 32) ValueCell!17285))

(assert (=> mapNonEmpty!56218 (= mapRest!56209 (store mapRest!56218 mapKey!56218 mapValue!56218))))

(declare-fun b!1328619 () Bool)

(declare-fun e!757415 () Bool)

(assert (=> b!1328619 (= e!757415 tp_is_empty!36367)))

(declare-fun mapIsEmpty!56218 () Bool)

(assert (=> mapIsEmpty!56218 mapRes!56218))

(declare-fun condMapEmpty!56218 () Bool)

(declare-fun mapDefault!56218 () ValueCell!17285)

(assert (=> mapNonEmpty!56209 (= condMapEmpty!56218 (= mapRest!56209 ((as const (Array (_ BitVec 32) ValueCell!17285)) mapDefault!56218)))))

(assert (=> mapNonEmpty!56209 (= tp!107116 (and e!757415 mapRes!56218))))

(declare-fun b!1328618 () Bool)

(assert (=> b!1328618 (= e!757414 tp_is_empty!36367)))

(assert (= (and mapNonEmpty!56209 condMapEmpty!56218) mapIsEmpty!56218))

(assert (= (and mapNonEmpty!56209 (not condMapEmpty!56218)) mapNonEmpty!56218))

(assert (= (and mapNonEmpty!56218 ((_ is ValueCellFull!17285) mapValue!56218)) b!1328618))

(assert (= (and mapNonEmpty!56209 ((_ is ValueCellFull!17285) mapDefault!56218)) b!1328619))

(declare-fun m!1218295 () Bool)

(assert (=> mapNonEmpty!56218 m!1218295))

(check-sat (not mapNonEmpty!56218) tp_is_empty!36367)
(check-sat)
