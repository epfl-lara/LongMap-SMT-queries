; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43108 () Bool)

(assert start!43108)

(declare-fun res!285373 () Bool)

(declare-fun e!281137 () Bool)

(assert (=> start!43108 (=> (not res!285373) (not e!281137))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43108 (= res!285373 (validMask!0 mask!2352))))

(assert (=> start!43108 e!281137))

(assert (=> start!43108 true))

(declare-datatypes ((V!19137 0))(
  ( (V!19138 (val!6822 Int)) )
))
(declare-datatypes ((ValueCell!6413 0))(
  ( (ValueCellFull!6413 (v!9111 V!19137)) (EmptyCell!6413) )
))
(declare-datatypes ((array!30758 0))(
  ( (array!30759 (arr!14790 (Array (_ BitVec 32) ValueCell!6413)) (size!15148 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30758)

(declare-fun e!281140 () Bool)

(declare-fun array_inv!10752 (array!30758) Bool)

(assert (=> start!43108 (and (array_inv!10752 _values!1516) e!281140)))

(declare-datatypes ((array!30760 0))(
  ( (array!30761 (arr!14791 (Array (_ BitVec 32) (_ BitVec 64))) (size!15149 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30760)

(declare-fun array_inv!10753 (array!30760) Bool)

(assert (=> start!43108 (array_inv!10753 _keys!1874)))

(declare-fun b!478229 () Bool)

(assert (=> b!478229 (= e!281137 (bvsgt #b00000000000000000000000000000000 (size!15149 _keys!1874)))))

(declare-fun b!478230 () Bool)

(declare-fun res!285375 () Bool)

(assert (=> b!478230 (=> (not res!285375) (not e!281137))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478230 (= res!285375 (and (= (size!15148 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15149 _keys!1874) (size!15148 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478231 () Bool)

(declare-fun e!281136 () Bool)

(declare-fun mapRes!22006 () Bool)

(assert (=> b!478231 (= e!281140 (and e!281136 mapRes!22006))))

(declare-fun condMapEmpty!22006 () Bool)

(declare-fun mapDefault!22006 () ValueCell!6413)

(assert (=> b!478231 (= condMapEmpty!22006 (= (arr!14790 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6413)) mapDefault!22006)))))

(declare-fun b!478232 () Bool)

(declare-fun res!285374 () Bool)

(assert (=> b!478232 (=> (not res!285374) (not e!281137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30760 (_ BitVec 32)) Bool)

(assert (=> b!478232 (= res!285374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22006 () Bool)

(assert (=> mapIsEmpty!22006 mapRes!22006))

(declare-fun b!478233 () Bool)

(declare-fun tp_is_empty!13549 () Bool)

(assert (=> b!478233 (= e!281136 tp_is_empty!13549)))

(declare-fun mapNonEmpty!22006 () Bool)

(declare-fun tp!42481 () Bool)

(declare-fun e!281138 () Bool)

(assert (=> mapNonEmpty!22006 (= mapRes!22006 (and tp!42481 e!281138))))

(declare-fun mapRest!22006 () (Array (_ BitVec 32) ValueCell!6413))

(declare-fun mapValue!22006 () ValueCell!6413)

(declare-fun mapKey!22006 () (_ BitVec 32))

(assert (=> mapNonEmpty!22006 (= (arr!14790 _values!1516) (store mapRest!22006 mapKey!22006 mapValue!22006))))

(declare-fun b!478234 () Bool)

(assert (=> b!478234 (= e!281138 tp_is_empty!13549)))

(assert (= (and start!43108 res!285373) b!478230))

(assert (= (and b!478230 res!285375) b!478232))

(assert (= (and b!478232 res!285374) b!478229))

(assert (= (and b!478231 condMapEmpty!22006) mapIsEmpty!22006))

(assert (= (and b!478231 (not condMapEmpty!22006)) mapNonEmpty!22006))

(get-info :version)

(assert (= (and mapNonEmpty!22006 ((_ is ValueCellFull!6413) mapValue!22006)) b!478234))

(assert (= (and b!478231 ((_ is ValueCellFull!6413) mapDefault!22006)) b!478233))

(assert (= start!43108 b!478231))

(declare-fun m!460805 () Bool)

(assert (=> start!43108 m!460805))

(declare-fun m!460807 () Bool)

(assert (=> start!43108 m!460807))

(declare-fun m!460809 () Bool)

(assert (=> start!43108 m!460809))

(declare-fun m!460811 () Bool)

(assert (=> b!478232 m!460811))

(declare-fun m!460813 () Bool)

(assert (=> mapNonEmpty!22006 m!460813))

(check-sat (not start!43108) (not b!478232) (not mapNonEmpty!22006) tp_is_empty!13549)
(check-sat)
(get-model)

(declare-fun d!76617 () Bool)

(assert (=> d!76617 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43108 d!76617))

(declare-fun d!76619 () Bool)

(assert (=> d!76619 (= (array_inv!10752 _values!1516) (bvsge (size!15148 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43108 d!76619))

(declare-fun d!76621 () Bool)

(assert (=> d!76621 (= (array_inv!10753 _keys!1874) (bvsge (size!15149 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43108 d!76621))

(declare-fun b!478279 () Bool)

(declare-fun e!281178 () Bool)

(declare-fun e!281179 () Bool)

(assert (=> b!478279 (= e!281178 e!281179)))

(declare-fun c!57634 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!478279 (= c!57634 (validKeyInArray!0 (select (arr!14791 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!478280 () Bool)

(declare-fun call!30818 () Bool)

(assert (=> b!478280 (= e!281179 call!30818)))

(declare-fun bm!30815 () Bool)

(assert (=> bm!30815 (= call!30818 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!478281 () Bool)

(declare-fun e!281177 () Bool)

(assert (=> b!478281 (= e!281179 e!281177)))

(declare-fun lt!217722 () (_ BitVec 64))

(assert (=> b!478281 (= lt!217722 (select (arr!14791 _keys!1874) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14029 0))(
  ( (Unit!14030) )
))
(declare-fun lt!217721 () Unit!14029)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30760 (_ BitVec 64) (_ BitVec 32)) Unit!14029)

(assert (=> b!478281 (= lt!217721 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217722 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!478281 (arrayContainsKey!0 _keys!1874 lt!217722 #b00000000000000000000000000000000)))

(declare-fun lt!217720 () Unit!14029)

(assert (=> b!478281 (= lt!217720 lt!217721)))

(declare-fun res!285399 () Bool)

(declare-datatypes ((SeekEntryResult!3512 0))(
  ( (MissingZero!3512 (index!16227 (_ BitVec 32))) (Found!3512 (index!16228 (_ BitVec 32))) (Intermediate!3512 (undefined!4324 Bool) (index!16229 (_ BitVec 32)) (x!44829 (_ BitVec 32))) (Undefined!3512) (MissingVacant!3512 (index!16230 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30760 (_ BitVec 32)) SeekEntryResult!3512)

(assert (=> b!478281 (= res!285399 (= (seekEntryOrOpen!0 (select (arr!14791 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3512 #b00000000000000000000000000000000)))))

(assert (=> b!478281 (=> (not res!285399) (not e!281177))))

(declare-fun d!76623 () Bool)

(declare-fun res!285398 () Bool)

(assert (=> d!76623 (=> res!285398 e!281178)))

(assert (=> d!76623 (= res!285398 (bvsge #b00000000000000000000000000000000 (size!15149 _keys!1874)))))

(assert (=> d!76623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!281178)))

(declare-fun b!478282 () Bool)

(assert (=> b!478282 (= e!281177 call!30818)))

(assert (= (and d!76623 (not res!285398)) b!478279))

(assert (= (and b!478279 c!57634) b!478281))

(assert (= (and b!478279 (not c!57634)) b!478280))

(assert (= (and b!478281 res!285399) b!478282))

(assert (= (or b!478282 b!478280) bm!30815))

(declare-fun m!460835 () Bool)

(assert (=> b!478279 m!460835))

(assert (=> b!478279 m!460835))

(declare-fun m!460837 () Bool)

(assert (=> b!478279 m!460837))

(declare-fun m!460839 () Bool)

(assert (=> bm!30815 m!460839))

(assert (=> b!478281 m!460835))

(declare-fun m!460841 () Bool)

(assert (=> b!478281 m!460841))

(declare-fun m!460843 () Bool)

(assert (=> b!478281 m!460843))

(assert (=> b!478281 m!460835))

(declare-fun m!460845 () Bool)

(assert (=> b!478281 m!460845))

(assert (=> b!478232 d!76623))

(declare-fun b!478290 () Bool)

(declare-fun e!281184 () Bool)

(assert (=> b!478290 (= e!281184 tp_is_empty!13549)))

(declare-fun condMapEmpty!22015 () Bool)

(declare-fun mapDefault!22015 () ValueCell!6413)

(assert (=> mapNonEmpty!22006 (= condMapEmpty!22015 (= mapRest!22006 ((as const (Array (_ BitVec 32) ValueCell!6413)) mapDefault!22015)))))

(declare-fun mapRes!22015 () Bool)

(assert (=> mapNonEmpty!22006 (= tp!42481 (and e!281184 mapRes!22015))))

(declare-fun mapIsEmpty!22015 () Bool)

(assert (=> mapIsEmpty!22015 mapRes!22015))

(declare-fun mapNonEmpty!22015 () Bool)

(declare-fun tp!42490 () Bool)

(declare-fun e!281185 () Bool)

(assert (=> mapNonEmpty!22015 (= mapRes!22015 (and tp!42490 e!281185))))

(declare-fun mapKey!22015 () (_ BitVec 32))

(declare-fun mapValue!22015 () ValueCell!6413)

(declare-fun mapRest!22015 () (Array (_ BitVec 32) ValueCell!6413))

(assert (=> mapNonEmpty!22015 (= mapRest!22006 (store mapRest!22015 mapKey!22015 mapValue!22015))))

(declare-fun b!478289 () Bool)

(assert (=> b!478289 (= e!281185 tp_is_empty!13549)))

(assert (= (and mapNonEmpty!22006 condMapEmpty!22015) mapIsEmpty!22015))

(assert (= (and mapNonEmpty!22006 (not condMapEmpty!22015)) mapNonEmpty!22015))

(assert (= (and mapNonEmpty!22015 ((_ is ValueCellFull!6413) mapValue!22015)) b!478289))

(assert (= (and mapNonEmpty!22006 ((_ is ValueCellFull!6413) mapDefault!22015)) b!478290))

(declare-fun m!460847 () Bool)

(assert (=> mapNonEmpty!22015 m!460847))

(check-sat (not b!478281) tp_is_empty!13549 (not mapNonEmpty!22015) (not bm!30815) (not b!478279))
(check-sat)
