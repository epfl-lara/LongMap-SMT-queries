; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112018 () Bool)

(assert start!112018)

(declare-fun b!1327215 () Bool)

(declare-fun e!756501 () Bool)

(declare-fun e!756502 () Bool)

(declare-fun mapRes!56209 () Bool)

(assert (=> b!1327215 (= e!756501 (and e!756502 mapRes!56209))))

(declare-fun condMapEmpty!56209 () Bool)

(declare-datatypes ((V!53593 0))(
  ( (V!53594 (val!18258 Int)) )
))
(declare-datatypes ((ValueCell!17285 0))(
  ( (ValueCellFull!17285 (v!20893 V!53593)) (EmptyCell!17285) )
))
(declare-datatypes ((array!89573 0))(
  ( (array!89574 (arr!43258 (Array (_ BitVec 32) ValueCell!17285)) (size!43810 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89573)

(declare-fun mapDefault!56209 () ValueCell!17285)

(assert (=> b!1327215 (= condMapEmpty!56209 (= (arr!43258 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17285)) mapDefault!56209)))))

(declare-fun b!1327216 () Bool)

(declare-fun tp_is_empty!36367 () Bool)

(assert (=> b!1327216 (= e!756502 tp_is_empty!36367)))

(declare-fun res!880763 () Bool)

(declare-fun e!756499 () Bool)

(assert (=> start!112018 (=> (not res!880763) (not e!756499))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112018 (= res!880763 (validMask!0 mask!1998))))

(assert (=> start!112018 e!756499))

(assert (=> start!112018 true))

(declare-fun array_inv!32821 (array!89573) Bool)

(assert (=> start!112018 (and (array_inv!32821 _values!1320) e!756501)))

(declare-datatypes ((array!89575 0))(
  ( (array!89576 (arr!43259 (Array (_ BitVec 32) (_ BitVec 64))) (size!43811 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89575)

(declare-fun array_inv!32822 (array!89575) Bool)

(assert (=> start!112018 (array_inv!32822 _keys!1590)))

(declare-fun mapNonEmpty!56209 () Bool)

(declare-fun tp!107117 () Bool)

(declare-fun e!756503 () Bool)

(assert (=> mapNonEmpty!56209 (= mapRes!56209 (and tp!107117 e!756503))))

(declare-fun mapKey!56209 () (_ BitVec 32))

(declare-fun mapValue!56209 () ValueCell!17285)

(declare-fun mapRest!56209 () (Array (_ BitVec 32) ValueCell!17285))

(assert (=> mapNonEmpty!56209 (= (arr!43258 _values!1320) (store mapRest!56209 mapKey!56209 mapValue!56209))))

(declare-fun mapIsEmpty!56209 () Bool)

(assert (=> mapIsEmpty!56209 mapRes!56209))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun b!1327217 () Bool)

(assert (=> b!1327217 (= e!756499 (and (= (size!43810 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43811 _keys!1590) (size!43810 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011) (= (size!43811 _keys!1590) (bvadd #b00000000000000000000000000000001 mask!1998)) (bvsgt #b00000000000000000000000000000000 (size!43811 _keys!1590))))))

(declare-fun b!1327218 () Bool)

(assert (=> b!1327218 (= e!756503 tp_is_empty!36367)))

(assert (= (and start!112018 res!880763) b!1327217))

(assert (= (and b!1327215 condMapEmpty!56209) mapIsEmpty!56209))

(assert (= (and b!1327215 (not condMapEmpty!56209)) mapNonEmpty!56209))

(get-info :version)

(assert (= (and mapNonEmpty!56209 ((_ is ValueCellFull!17285) mapValue!56209)) b!1327218))

(assert (= (and b!1327215 ((_ is ValueCellFull!17285) mapDefault!56209)) b!1327216))

(assert (= start!112018 b!1327215))

(declare-fun m!1216157 () Bool)

(assert (=> start!112018 m!1216157))

(declare-fun m!1216159 () Bool)

(assert (=> start!112018 m!1216159))

(declare-fun m!1216161 () Bool)

(assert (=> start!112018 m!1216161))

(declare-fun m!1216163 () Bool)

(assert (=> mapNonEmpty!56209 m!1216163))

(check-sat (not start!112018) (not mapNonEmpty!56209) tp_is_empty!36367)
(check-sat)
(get-model)

(declare-fun d!143183 () Bool)

(assert (=> d!143183 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112018 d!143183))

(declare-fun d!143185 () Bool)

(assert (=> d!143185 (= (array_inv!32821 _values!1320) (bvsge (size!43810 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112018 d!143185))

(declare-fun d!143187 () Bool)

(assert (=> d!143187 (= (array_inv!32822 _keys!1590) (bvsge (size!43811 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112018 d!143187))

(declare-fun mapNonEmpty!56218 () Bool)

(declare-fun mapRes!56218 () Bool)

(declare-fun tp!107126 () Bool)

(declare-fun e!756538 () Bool)

(assert (=> mapNonEmpty!56218 (= mapRes!56218 (and tp!107126 e!756538))))

(declare-fun mapValue!56218 () ValueCell!17285)

(declare-fun mapRest!56218 () (Array (_ BitVec 32) ValueCell!17285))

(declare-fun mapKey!56218 () (_ BitVec 32))

(assert (=> mapNonEmpty!56218 (= mapRest!56209 (store mapRest!56218 mapKey!56218 mapValue!56218))))

(declare-fun b!1327250 () Bool)

(declare-fun e!756539 () Bool)

(assert (=> b!1327250 (= e!756539 tp_is_empty!36367)))

(declare-fun mapIsEmpty!56218 () Bool)

(assert (=> mapIsEmpty!56218 mapRes!56218))

(declare-fun b!1327249 () Bool)

(assert (=> b!1327249 (= e!756538 tp_is_empty!36367)))

(declare-fun condMapEmpty!56218 () Bool)

(declare-fun mapDefault!56218 () ValueCell!17285)

(assert (=> mapNonEmpty!56209 (= condMapEmpty!56218 (= mapRest!56209 ((as const (Array (_ BitVec 32) ValueCell!17285)) mapDefault!56218)))))

(assert (=> mapNonEmpty!56209 (= tp!107117 (and e!756539 mapRes!56218))))

(assert (= (and mapNonEmpty!56209 condMapEmpty!56218) mapIsEmpty!56218))

(assert (= (and mapNonEmpty!56209 (not condMapEmpty!56218)) mapNonEmpty!56218))

(assert (= (and mapNonEmpty!56218 ((_ is ValueCellFull!17285) mapValue!56218)) b!1327249))

(assert (= (and mapNonEmpty!56209 ((_ is ValueCellFull!17285) mapDefault!56218)) b!1327250))

(declare-fun m!1216181 () Bool)

(assert (=> mapNonEmpty!56218 m!1216181))

(check-sat (not mapNonEmpty!56218) tp_is_empty!36367)
(check-sat)
