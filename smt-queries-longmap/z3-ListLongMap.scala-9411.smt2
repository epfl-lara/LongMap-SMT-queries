; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112046 () Bool)

(assert start!112046)

(declare-fun res!880849 () Bool)

(declare-fun e!756658 () Bool)

(assert (=> start!112046 (=> (not res!880849) (not e!756658))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112046 (= res!880849 (validMask!0 mask!1998))))

(assert (=> start!112046 e!756658))

(assert (=> start!112046 true))

(declare-datatypes ((V!53611 0))(
  ( (V!53612 (val!18265 Int)) )
))
(declare-datatypes ((ValueCell!17292 0))(
  ( (ValueCellFull!17292 (v!20901 V!53611)) (EmptyCell!17292) )
))
(declare-datatypes ((array!89668 0))(
  ( (array!89669 (arr!43303 (Array (_ BitVec 32) ValueCell!17292)) (size!43853 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89668)

(declare-fun e!756661 () Bool)

(declare-fun array_inv!32685 (array!89668) Bool)

(assert (=> start!112046 (and (array_inv!32685 _values!1320) e!756661)))

(declare-datatypes ((array!89670 0))(
  ( (array!89671 (arr!43304 (Array (_ BitVec 32) (_ BitVec 64))) (size!43854 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89670)

(declare-fun array_inv!32686 (array!89670) Bool)

(assert (=> start!112046 (array_inv!32686 _keys!1590)))

(declare-fun b!1327425 () Bool)

(declare-fun e!756659 () Bool)

(declare-fun tp_is_empty!36381 () Bool)

(assert (=> b!1327425 (= e!756659 tp_is_empty!36381)))

(declare-fun mapNonEmpty!56236 () Bool)

(declare-fun mapRes!56236 () Bool)

(declare-fun tp!107143 () Bool)

(assert (=> mapNonEmpty!56236 (= mapRes!56236 (and tp!107143 e!756659))))

(declare-fun mapKey!56236 () (_ BitVec 32))

(declare-fun mapRest!56236 () (Array (_ BitVec 32) ValueCell!17292))

(declare-fun mapValue!56236 () ValueCell!17292)

(assert (=> mapNonEmpty!56236 (= (arr!43303 _values!1320) (store mapRest!56236 mapKey!56236 mapValue!56236))))

(declare-fun b!1327426 () Bool)

(declare-fun e!756662 () Bool)

(assert (=> b!1327426 (= e!756661 (and e!756662 mapRes!56236))))

(declare-fun condMapEmpty!56236 () Bool)

(declare-fun mapDefault!56236 () ValueCell!17292)

(assert (=> b!1327426 (= condMapEmpty!56236 (= (arr!43303 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17292)) mapDefault!56236)))))

(declare-fun b!1327427 () Bool)

(assert (=> b!1327427 (= e!756662 tp_is_empty!36381)))

(declare-fun b!1327428 () Bool)

(assert (=> b!1327428 (= e!756658 (and (bvsle #b00000000000000000000000000000000 (size!43854 _keys!1590)) (bvsge (size!43854 _keys!1590) #b01111111111111111111111111111111)))))

(declare-fun b!1327429 () Bool)

(declare-fun res!880847 () Bool)

(assert (=> b!1327429 (=> (not res!880847) (not e!756658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89670 (_ BitVec 32)) Bool)

(assert (=> b!1327429 (= res!880847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56236 () Bool)

(assert (=> mapIsEmpty!56236 mapRes!56236))

(declare-fun b!1327430 () Bool)

(declare-fun res!880848 () Bool)

(assert (=> b!1327430 (=> (not res!880848) (not e!756658))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327430 (= res!880848 (and (= (size!43853 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43854 _keys!1590) (size!43853 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112046 res!880849) b!1327430))

(assert (= (and b!1327430 res!880848) b!1327429))

(assert (= (and b!1327429 res!880847) b!1327428))

(assert (= (and b!1327426 condMapEmpty!56236) mapIsEmpty!56236))

(assert (= (and b!1327426 (not condMapEmpty!56236)) mapNonEmpty!56236))

(get-info :version)

(assert (= (and mapNonEmpty!56236 ((_ is ValueCellFull!17292) mapValue!56236)) b!1327425))

(assert (= (and b!1327426 ((_ is ValueCellFull!17292) mapDefault!56236)) b!1327427))

(assert (= start!112046 b!1327426))

(declare-fun m!1216753 () Bool)

(assert (=> start!112046 m!1216753))

(declare-fun m!1216755 () Bool)

(assert (=> start!112046 m!1216755))

(declare-fun m!1216757 () Bool)

(assert (=> start!112046 m!1216757))

(declare-fun m!1216759 () Bool)

(assert (=> mapNonEmpty!56236 m!1216759))

(declare-fun m!1216761 () Bool)

(assert (=> b!1327429 m!1216761))

(check-sat (not b!1327429) (not start!112046) (not mapNonEmpty!56236) tp_is_empty!36381)
(check-sat)
(get-model)

(declare-fun d!143317 () Bool)

(declare-fun res!880864 () Bool)

(declare-fun e!756684 () Bool)

(assert (=> d!143317 (=> res!880864 e!756684)))

(assert (=> d!143317 (= res!880864 (bvsge #b00000000000000000000000000000000 (size!43854 _keys!1590)))))

(assert (=> d!143317 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!756684)))

(declare-fun b!1327457 () Bool)

(declare-fun e!756686 () Bool)

(assert (=> b!1327457 (= e!756684 e!756686)))

(declare-fun c!125895 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1327457 (= c!125895 (validKeyInArray!0 (select (arr!43304 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun bm!64813 () Bool)

(declare-fun call!64816 () Bool)

(assert (=> bm!64813 (= call!64816 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1327458 () Bool)

(declare-fun e!756685 () Bool)

(assert (=> b!1327458 (= e!756686 e!756685)))

(declare-fun lt!590711 () (_ BitVec 64))

(assert (=> b!1327458 (= lt!590711 (select (arr!43304 _keys!1590) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43733 0))(
  ( (Unit!43734) )
))
(declare-fun lt!590710 () Unit!43733)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89670 (_ BitVec 64) (_ BitVec 32)) Unit!43733)

(assert (=> b!1327458 (= lt!590710 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!590711 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1327458 (arrayContainsKey!0 _keys!1590 lt!590711 #b00000000000000000000000000000000)))

(declare-fun lt!590712 () Unit!43733)

(assert (=> b!1327458 (= lt!590712 lt!590710)))

(declare-fun res!880863 () Bool)

(declare-datatypes ((SeekEntryResult!10044 0))(
  ( (MissingZero!10044 (index!42547 (_ BitVec 32))) (Found!10044 (index!42548 (_ BitVec 32))) (Intermediate!10044 (undefined!10856 Bool) (index!42549 (_ BitVec 32)) (x!118356 (_ BitVec 32))) (Undefined!10044) (MissingVacant!10044 (index!42550 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89670 (_ BitVec 32)) SeekEntryResult!10044)

(assert (=> b!1327458 (= res!880863 (= (seekEntryOrOpen!0 (select (arr!43304 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10044 #b00000000000000000000000000000000)))))

(assert (=> b!1327458 (=> (not res!880863) (not e!756685))))

(declare-fun b!1327459 () Bool)

(assert (=> b!1327459 (= e!756685 call!64816)))

(declare-fun b!1327460 () Bool)

(assert (=> b!1327460 (= e!756686 call!64816)))

(assert (= (and d!143317 (not res!880864)) b!1327457))

(assert (= (and b!1327457 c!125895) b!1327458))

(assert (= (and b!1327457 (not c!125895)) b!1327460))

(assert (= (and b!1327458 res!880863) b!1327459))

(assert (= (or b!1327459 b!1327460) bm!64813))

(declare-fun m!1216773 () Bool)

(assert (=> b!1327457 m!1216773))

(assert (=> b!1327457 m!1216773))

(declare-fun m!1216775 () Bool)

(assert (=> b!1327457 m!1216775))

(declare-fun m!1216777 () Bool)

(assert (=> bm!64813 m!1216777))

(assert (=> b!1327458 m!1216773))

(declare-fun m!1216779 () Bool)

(assert (=> b!1327458 m!1216779))

(declare-fun m!1216781 () Bool)

(assert (=> b!1327458 m!1216781))

(assert (=> b!1327458 m!1216773))

(declare-fun m!1216783 () Bool)

(assert (=> b!1327458 m!1216783))

(assert (=> b!1327429 d!143317))

(declare-fun d!143319 () Bool)

(assert (=> d!143319 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112046 d!143319))

(declare-fun d!143321 () Bool)

(assert (=> d!143321 (= (array_inv!32685 _values!1320) (bvsge (size!43853 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112046 d!143321))

(declare-fun d!143323 () Bool)

(assert (=> d!143323 (= (array_inv!32686 _keys!1590) (bvsge (size!43854 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112046 d!143323))

(declare-fun mapIsEmpty!56242 () Bool)

(declare-fun mapRes!56242 () Bool)

(assert (=> mapIsEmpty!56242 mapRes!56242))

(declare-fun b!1327468 () Bool)

(declare-fun e!756691 () Bool)

(assert (=> b!1327468 (= e!756691 tp_is_empty!36381)))

(declare-fun condMapEmpty!56242 () Bool)

(declare-fun mapDefault!56242 () ValueCell!17292)

(assert (=> mapNonEmpty!56236 (= condMapEmpty!56242 (= mapRest!56236 ((as const (Array (_ BitVec 32) ValueCell!17292)) mapDefault!56242)))))

(assert (=> mapNonEmpty!56236 (= tp!107143 (and e!756691 mapRes!56242))))

(declare-fun b!1327467 () Bool)

(declare-fun e!756692 () Bool)

(assert (=> b!1327467 (= e!756692 tp_is_empty!36381)))

(declare-fun mapNonEmpty!56242 () Bool)

(declare-fun tp!107149 () Bool)

(assert (=> mapNonEmpty!56242 (= mapRes!56242 (and tp!107149 e!756692))))

(declare-fun mapRest!56242 () (Array (_ BitVec 32) ValueCell!17292))

(declare-fun mapValue!56242 () ValueCell!17292)

(declare-fun mapKey!56242 () (_ BitVec 32))

(assert (=> mapNonEmpty!56242 (= mapRest!56236 (store mapRest!56242 mapKey!56242 mapValue!56242))))

(assert (= (and mapNonEmpty!56236 condMapEmpty!56242) mapIsEmpty!56242))

(assert (= (and mapNonEmpty!56236 (not condMapEmpty!56242)) mapNonEmpty!56242))

(assert (= (and mapNonEmpty!56242 ((_ is ValueCellFull!17292) mapValue!56242)) b!1327467))

(assert (= (and mapNonEmpty!56236 ((_ is ValueCellFull!17292) mapDefault!56242)) b!1327468))

(declare-fun m!1216785 () Bool)

(assert (=> mapNonEmpty!56242 m!1216785))

(check-sat (not b!1327458) (not bm!64813) (not b!1327457) (not mapNonEmpty!56242) tp_is_empty!36381)
(check-sat)
