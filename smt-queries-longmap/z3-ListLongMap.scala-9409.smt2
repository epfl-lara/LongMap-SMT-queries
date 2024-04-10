; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112020 () Bool)

(assert start!112020)

(declare-datatypes ((V!53595 0))(
  ( (V!53596 (val!18259 Int)) )
))
(declare-datatypes ((ValueCell!17286 0))(
  ( (ValueCellFull!17286 (v!20895 V!53595)) (EmptyCell!17286) )
))
(declare-datatypes ((array!89646 0))(
  ( (array!89647 (arr!43294 (Array (_ BitVec 32) ValueCell!17286)) (size!43844 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89646)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89648 0))(
  ( (array!89649 (arr!43295 (Array (_ BitVec 32) (_ BitVec 64))) (size!43845 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89648)

(declare-fun b!1327297 () Bool)

(declare-fun e!756548 () Bool)

(assert (=> b!1327297 (= e!756548 (and (= (size!43844 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43845 _keys!1590) (size!43844 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011) (= (size!43845 _keys!1590) (bvadd #b00000000000000000000000000000001 mask!1998)) (bvsgt #b00000000000000000000000000000000 (size!43845 _keys!1590))))))

(declare-fun b!1327298 () Bool)

(declare-fun e!756549 () Bool)

(declare-fun tp_is_empty!36369 () Bool)

(assert (=> b!1327298 (= e!756549 tp_is_empty!36369)))

(declare-fun b!1327299 () Bool)

(declare-fun e!756547 () Bool)

(declare-fun e!756551 () Bool)

(declare-fun mapRes!56212 () Bool)

(assert (=> b!1327299 (= e!756547 (and e!756551 mapRes!56212))))

(declare-fun condMapEmpty!56212 () Bool)

(declare-fun mapDefault!56212 () ValueCell!17286)

(assert (=> b!1327299 (= condMapEmpty!56212 (= (arr!43294 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17286)) mapDefault!56212)))))

(declare-fun res!880795 () Bool)

(assert (=> start!112020 (=> (not res!880795) (not e!756548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112020 (= res!880795 (validMask!0 mask!1998))))

(assert (=> start!112020 e!756548))

(assert (=> start!112020 true))

(declare-fun array_inv!32679 (array!89646) Bool)

(assert (=> start!112020 (and (array_inv!32679 _values!1320) e!756547)))

(declare-fun array_inv!32680 (array!89648) Bool)

(assert (=> start!112020 (array_inv!32680 _keys!1590)))

(declare-fun b!1327300 () Bool)

(assert (=> b!1327300 (= e!756551 tp_is_empty!36369)))

(declare-fun mapIsEmpty!56212 () Bool)

(assert (=> mapIsEmpty!56212 mapRes!56212))

(declare-fun mapNonEmpty!56212 () Bool)

(declare-fun tp!107119 () Bool)

(assert (=> mapNonEmpty!56212 (= mapRes!56212 (and tp!107119 e!756549))))

(declare-fun mapValue!56212 () ValueCell!17286)

(declare-fun mapRest!56212 () (Array (_ BitVec 32) ValueCell!17286))

(declare-fun mapKey!56212 () (_ BitVec 32))

(assert (=> mapNonEmpty!56212 (= (arr!43294 _values!1320) (store mapRest!56212 mapKey!56212 mapValue!56212))))

(assert (= (and start!112020 res!880795) b!1327297))

(assert (= (and b!1327299 condMapEmpty!56212) mapIsEmpty!56212))

(assert (= (and b!1327299 (not condMapEmpty!56212)) mapNonEmpty!56212))

(get-info :version)

(assert (= (and mapNonEmpty!56212 ((_ is ValueCellFull!17286) mapValue!56212)) b!1327298))

(assert (= (and b!1327299 ((_ is ValueCellFull!17286) mapDefault!56212)) b!1327300))

(assert (= start!112020 b!1327299))

(declare-fun m!1216681 () Bool)

(assert (=> start!112020 m!1216681))

(declare-fun m!1216683 () Bool)

(assert (=> start!112020 m!1216683))

(declare-fun m!1216685 () Bool)

(assert (=> start!112020 m!1216685))

(declare-fun m!1216687 () Bool)

(assert (=> mapNonEmpty!56212 m!1216687))

(check-sat (not start!112020) (not mapNonEmpty!56212) tp_is_empty!36369)
(check-sat)
(get-model)

(declare-fun d!143299 () Bool)

(assert (=> d!143299 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112020 d!143299))

(declare-fun d!143301 () Bool)

(assert (=> d!143301 (= (array_inv!32679 _values!1320) (bvsge (size!43844 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112020 d!143301))

(declare-fun d!143303 () Bool)

(assert (=> d!143303 (= (array_inv!32680 _keys!1590) (bvsge (size!43845 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112020 d!143303))

(declare-fun b!1327319 () Bool)

(declare-fun e!756572 () Bool)

(assert (=> b!1327319 (= e!756572 tp_is_empty!36369)))

(declare-fun condMapEmpty!56218 () Bool)

(declare-fun mapDefault!56218 () ValueCell!17286)

(assert (=> mapNonEmpty!56212 (= condMapEmpty!56218 (= mapRest!56212 ((as const (Array (_ BitVec 32) ValueCell!17286)) mapDefault!56218)))))

(declare-fun e!756571 () Bool)

(declare-fun mapRes!56218 () Bool)

(assert (=> mapNonEmpty!56212 (= tp!107119 (and e!756571 mapRes!56218))))

(declare-fun b!1327320 () Bool)

(assert (=> b!1327320 (= e!756571 tp_is_empty!36369)))

(declare-fun mapNonEmpty!56218 () Bool)

(declare-fun tp!107125 () Bool)

(assert (=> mapNonEmpty!56218 (= mapRes!56218 (and tp!107125 e!756572))))

(declare-fun mapValue!56218 () ValueCell!17286)

(declare-fun mapRest!56218 () (Array (_ BitVec 32) ValueCell!17286))

(declare-fun mapKey!56218 () (_ BitVec 32))

(assert (=> mapNonEmpty!56218 (= mapRest!56212 (store mapRest!56218 mapKey!56218 mapValue!56218))))

(declare-fun mapIsEmpty!56218 () Bool)

(assert (=> mapIsEmpty!56218 mapRes!56218))

(assert (= (and mapNonEmpty!56212 condMapEmpty!56218) mapIsEmpty!56218))

(assert (= (and mapNonEmpty!56212 (not condMapEmpty!56218)) mapNonEmpty!56218))

(assert (= (and mapNonEmpty!56218 ((_ is ValueCellFull!17286) mapValue!56218)) b!1327319))

(assert (= (and mapNonEmpty!56212 ((_ is ValueCellFull!17286) mapDefault!56218)) b!1327320))

(declare-fun m!1216697 () Bool)

(assert (=> mapNonEmpty!56218 m!1216697))

(check-sat (not mapNonEmpty!56218) tp_is_empty!36369)
(check-sat)
