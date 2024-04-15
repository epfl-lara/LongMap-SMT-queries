; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78418 () Bool)

(assert start!78418)

(declare-fun mapNonEmpty!30537 () Bool)

(declare-fun mapRes!30537 () Bool)

(declare-fun tp!58605 () Bool)

(declare-fun e!513137 () Bool)

(assert (=> mapNonEmpty!30537 (= mapRes!30537 (and tp!58605 e!513137))))

(declare-datatypes ((V!30559 0))(
  ( (V!30560 (val!9648 Int)) )
))
(declare-datatypes ((ValueCell!9116 0))(
  ( (ValueCellFull!9116 (v!12164 V!30559)) (EmptyCell!9116) )
))
(declare-fun mapRest!30537 () (Array (_ BitVec 32) ValueCell!9116))

(declare-fun mapKey!30537 () (_ BitVec 32))

(declare-datatypes ((array!54385 0))(
  ( (array!54386 (arr!26142 (Array (_ BitVec 32) ValueCell!9116)) (size!26603 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54385)

(declare-fun mapValue!30537 () ValueCell!9116)

(assert (=> mapNonEmpty!30537 (= (arr!26142 _values!1231) (store mapRest!30537 mapKey!30537 mapValue!30537))))

(declare-fun b!914584 () Bool)

(declare-fun tp_is_empty!19195 () Bool)

(assert (=> b!914584 (= e!513137 tp_is_empty!19195)))

(declare-fun b!914585 () Bool)

(declare-fun e!513135 () Bool)

(declare-datatypes ((array!54387 0))(
  ( (array!54388 (arr!26143 (Array (_ BitVec 32) (_ BitVec 64))) (size!26604 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54387)

(assert (=> b!914585 (= e!513135 (bvsgt #b00000000000000000000000000000000 (size!26604 _keys!1487)))))

(declare-fun b!914586 () Bool)

(declare-fun res!616779 () Bool)

(assert (=> b!914586 (=> (not res!616779) (not e!513135))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54387 (_ BitVec 32)) Bool)

(assert (=> b!914586 (= res!616779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!914587 () Bool)

(declare-fun e!513138 () Bool)

(declare-fun e!513139 () Bool)

(assert (=> b!914587 (= e!513138 (and e!513139 mapRes!30537))))

(declare-fun condMapEmpty!30537 () Bool)

(declare-fun mapDefault!30537 () ValueCell!9116)

(assert (=> b!914587 (= condMapEmpty!30537 (= (arr!26142 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9116)) mapDefault!30537)))))

(declare-fun b!914588 () Bool)

(declare-fun res!616777 () Bool)

(assert (=> b!914588 (=> (not res!616777) (not e!513135))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!914588 (= res!616777 (and (= (size!26603 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26604 _keys!1487) (size!26603 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30537 () Bool)

(assert (=> mapIsEmpty!30537 mapRes!30537))

(declare-fun b!914583 () Bool)

(assert (=> b!914583 (= e!513139 tp_is_empty!19195)))

(declare-fun res!616778 () Bool)

(assert (=> start!78418 (=> (not res!616778) (not e!513135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78418 (= res!616778 (validMask!0 mask!1881))))

(assert (=> start!78418 e!513135))

(assert (=> start!78418 true))

(declare-fun array_inv!20496 (array!54385) Bool)

(assert (=> start!78418 (and (array_inv!20496 _values!1231) e!513138)))

(declare-fun array_inv!20497 (array!54387) Bool)

(assert (=> start!78418 (array_inv!20497 _keys!1487)))

(assert (= (and start!78418 res!616778) b!914588))

(assert (= (and b!914588 res!616777) b!914586))

(assert (= (and b!914586 res!616779) b!914585))

(assert (= (and b!914587 condMapEmpty!30537) mapIsEmpty!30537))

(assert (= (and b!914587 (not condMapEmpty!30537)) mapNonEmpty!30537))

(get-info :version)

(assert (= (and mapNonEmpty!30537 ((_ is ValueCellFull!9116) mapValue!30537)) b!914584))

(assert (= (and b!914587 ((_ is ValueCellFull!9116) mapDefault!30537)) b!914583))

(assert (= start!78418 b!914587))

(declare-fun m!848663 () Bool)

(assert (=> mapNonEmpty!30537 m!848663))

(declare-fun m!848665 () Bool)

(assert (=> b!914586 m!848665))

(declare-fun m!848667 () Bool)

(assert (=> start!78418 m!848667))

(declare-fun m!848669 () Bool)

(assert (=> start!78418 m!848669))

(declare-fun m!848671 () Bool)

(assert (=> start!78418 m!848671))

(check-sat (not start!78418) (not b!914586) (not mapNonEmpty!30537) tp_is_empty!19195)
(check-sat)
(get-model)

(declare-fun d!112507 () Bool)

(assert (=> d!112507 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!78418 d!112507))

(declare-fun d!112509 () Bool)

(assert (=> d!112509 (= (array_inv!20496 _values!1231) (bvsge (size!26603 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!78418 d!112509))

(declare-fun d!112511 () Bool)

(assert (=> d!112511 (= (array_inv!20497 _keys!1487) (bvsge (size!26604 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!78418 d!112511))

(declare-fun d!112513 () Bool)

(declare-fun res!616803 () Bool)

(declare-fun e!513176 () Bool)

(assert (=> d!112513 (=> res!616803 e!513176)))

(assert (=> d!112513 (= res!616803 (bvsge #b00000000000000000000000000000000 (size!26604 _keys!1487)))))

(assert (=> d!112513 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!513176)))

(declare-fun b!914633 () Bool)

(declare-fun e!513178 () Bool)

(assert (=> b!914633 (= e!513176 e!513178)))

(declare-fun c!95977 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!914633 (= c!95977 (validKeyInArray!0 (select (arr!26143 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!914634 () Bool)

(declare-fun call!40514 () Bool)

(assert (=> b!914634 (= e!513178 call!40514)))

(declare-fun b!914635 () Bool)

(declare-fun e!513177 () Bool)

(assert (=> b!914635 (= e!513177 call!40514)))

(declare-fun b!914636 () Bool)

(assert (=> b!914636 (= e!513178 e!513177)))

(declare-fun lt!411356 () (_ BitVec 64))

(assert (=> b!914636 (= lt!411356 (select (arr!26143 _keys!1487) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30878 0))(
  ( (Unit!30879) )
))
(declare-fun lt!411357 () Unit!30878)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54387 (_ BitVec 64) (_ BitVec 32)) Unit!30878)

(assert (=> b!914636 (= lt!411357 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!411356 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!914636 (arrayContainsKey!0 _keys!1487 lt!411356 #b00000000000000000000000000000000)))

(declare-fun lt!411358 () Unit!30878)

(assert (=> b!914636 (= lt!411358 lt!411357)))

(declare-fun res!616802 () Bool)

(declare-datatypes ((SeekEntryResult!8972 0))(
  ( (MissingZero!8972 (index!38259 (_ BitVec 32))) (Found!8972 (index!38260 (_ BitVec 32))) (Intermediate!8972 (undefined!9784 Bool) (index!38261 (_ BitVec 32)) (x!78252 (_ BitVec 32))) (Undefined!8972) (MissingVacant!8972 (index!38262 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54387 (_ BitVec 32)) SeekEntryResult!8972)

(assert (=> b!914636 (= res!616802 (= (seekEntryOrOpen!0 (select (arr!26143 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8972 #b00000000000000000000000000000000)))))

(assert (=> b!914636 (=> (not res!616802) (not e!513177))))

(declare-fun bm!40511 () Bool)

(assert (=> bm!40511 (= call!40514 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(assert (= (and d!112513 (not res!616803)) b!914633))

(assert (= (and b!914633 c!95977) b!914636))

(assert (= (and b!914633 (not c!95977)) b!914634))

(assert (= (and b!914636 res!616802) b!914635))

(assert (= (or b!914635 b!914634) bm!40511))

(declare-fun m!848693 () Bool)

(assert (=> b!914633 m!848693))

(assert (=> b!914633 m!848693))

(declare-fun m!848695 () Bool)

(assert (=> b!914633 m!848695))

(assert (=> b!914636 m!848693))

(declare-fun m!848697 () Bool)

(assert (=> b!914636 m!848697))

(declare-fun m!848699 () Bool)

(assert (=> b!914636 m!848699))

(assert (=> b!914636 m!848693))

(declare-fun m!848701 () Bool)

(assert (=> b!914636 m!848701))

(declare-fun m!848703 () Bool)

(assert (=> bm!40511 m!848703))

(assert (=> b!914586 d!112513))

(declare-fun condMapEmpty!30546 () Bool)

(declare-fun mapDefault!30546 () ValueCell!9116)

(assert (=> mapNonEmpty!30537 (= condMapEmpty!30546 (= mapRest!30537 ((as const (Array (_ BitVec 32) ValueCell!9116)) mapDefault!30546)))))

(declare-fun e!513183 () Bool)

(declare-fun mapRes!30546 () Bool)

(assert (=> mapNonEmpty!30537 (= tp!58605 (and e!513183 mapRes!30546))))

(declare-fun b!914644 () Bool)

(assert (=> b!914644 (= e!513183 tp_is_empty!19195)))

(declare-fun mapNonEmpty!30546 () Bool)

(declare-fun tp!58614 () Bool)

(declare-fun e!513184 () Bool)

(assert (=> mapNonEmpty!30546 (= mapRes!30546 (and tp!58614 e!513184))))

(declare-fun mapValue!30546 () ValueCell!9116)

(declare-fun mapKey!30546 () (_ BitVec 32))

(declare-fun mapRest!30546 () (Array (_ BitVec 32) ValueCell!9116))

(assert (=> mapNonEmpty!30546 (= mapRest!30537 (store mapRest!30546 mapKey!30546 mapValue!30546))))

(declare-fun mapIsEmpty!30546 () Bool)

(assert (=> mapIsEmpty!30546 mapRes!30546))

(declare-fun b!914643 () Bool)

(assert (=> b!914643 (= e!513184 tp_is_empty!19195)))

(assert (= (and mapNonEmpty!30537 condMapEmpty!30546) mapIsEmpty!30546))

(assert (= (and mapNonEmpty!30537 (not condMapEmpty!30546)) mapNonEmpty!30546))

(assert (= (and mapNonEmpty!30546 ((_ is ValueCellFull!9116) mapValue!30546)) b!914643))

(assert (= (and mapNonEmpty!30537 ((_ is ValueCellFull!9116) mapDefault!30546)) b!914644))

(declare-fun m!848705 () Bool)

(assert (=> mapNonEmpty!30546 m!848705))

(check-sat (not mapNonEmpty!30546) (not b!914633) tp_is_empty!19195 (not bm!40511) (not b!914636))
(check-sat)
