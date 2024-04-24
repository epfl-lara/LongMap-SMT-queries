; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133758 () Bool)

(assert start!133758)

(declare-fun res!1067140 () Bool)

(declare-fun e!870253 () Bool)

(assert (=> start!133758 (=> (not res!1067140) (not e!870253))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133758 (= res!1067140 (validMask!0 mask!947))))

(assert (=> start!133758 e!870253))

(assert (=> start!133758 true))

(declare-datatypes ((V!59497 0))(
  ( (V!59498 (val!19317 Int)) )
))
(declare-datatypes ((ValueCell!18203 0))(
  ( (ValueCellFull!18203 (v!22060 V!59497)) (EmptyCell!18203) )
))
(declare-datatypes ((array!103784 0))(
  ( (array!103785 (arr!50081 (Array (_ BitVec 32) ValueCell!18203)) (size!50632 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103784)

(declare-fun e!870251 () Bool)

(declare-fun array_inv!39193 (array!103784) Bool)

(assert (=> start!133758 (and (array_inv!39193 _values!487) e!870251)))

(declare-datatypes ((array!103786 0))(
  ( (array!103787 (arr!50082 (Array (_ BitVec 32) (_ BitVec 64))) (size!50633 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103786)

(declare-fun array_inv!39194 (array!103786) Bool)

(assert (=> start!133758 (array_inv!39194 _keys!637)))

(declare-fun b!1561652 () Bool)

(declare-fun e!870254 () Bool)

(declare-fun mapRes!59064 () Bool)

(assert (=> b!1561652 (= e!870251 (and e!870254 mapRes!59064))))

(declare-fun condMapEmpty!59064 () Bool)

(declare-fun mapDefault!59064 () ValueCell!18203)

(assert (=> b!1561652 (= condMapEmpty!59064 (= (arr!50081 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18203)) mapDefault!59064)))))

(declare-fun b!1561653 () Bool)

(assert (=> b!1561653 (= e!870253 (bvsgt #b00000000000000000000000000000000 (size!50633 _keys!637)))))

(declare-fun b!1561654 () Bool)

(declare-fun res!1067142 () Bool)

(assert (=> b!1561654 (=> (not res!1067142) (not e!870253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103786 (_ BitVec 32)) Bool)

(assert (=> b!1561654 (= res!1067142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561655 () Bool)

(declare-fun tp_is_empty!38467 () Bool)

(assert (=> b!1561655 (= e!870254 tp_is_empty!38467)))

(declare-fun mapIsEmpty!59064 () Bool)

(assert (=> mapIsEmpty!59064 mapRes!59064))

(declare-fun mapNonEmpty!59064 () Bool)

(declare-fun tp!112719 () Bool)

(declare-fun e!870252 () Bool)

(assert (=> mapNonEmpty!59064 (= mapRes!59064 (and tp!112719 e!870252))))

(declare-fun mapValue!59064 () ValueCell!18203)

(declare-fun mapRest!59064 () (Array (_ BitVec 32) ValueCell!18203))

(declare-fun mapKey!59064 () (_ BitVec 32))

(assert (=> mapNonEmpty!59064 (= (arr!50081 _values!487) (store mapRest!59064 mapKey!59064 mapValue!59064))))

(declare-fun b!1561656 () Bool)

(declare-fun res!1067141 () Bool)

(assert (=> b!1561656 (=> (not res!1067141) (not e!870253))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1561656 (= res!1067141 (and (= (size!50632 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50633 _keys!637) (size!50632 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561657 () Bool)

(assert (=> b!1561657 (= e!870252 tp_is_empty!38467)))

(assert (= (and start!133758 res!1067140) b!1561656))

(assert (= (and b!1561656 res!1067141) b!1561654))

(assert (= (and b!1561654 res!1067142) b!1561653))

(assert (= (and b!1561652 condMapEmpty!59064) mapIsEmpty!59064))

(assert (= (and b!1561652 (not condMapEmpty!59064)) mapNonEmpty!59064))

(get-info :version)

(assert (= (and mapNonEmpty!59064 ((_ is ValueCellFull!18203) mapValue!59064)) b!1561657))

(assert (= (and b!1561652 ((_ is ValueCellFull!18203) mapDefault!59064)) b!1561655))

(assert (= start!133758 b!1561652))

(declare-fun m!1437805 () Bool)

(assert (=> start!133758 m!1437805))

(declare-fun m!1437807 () Bool)

(assert (=> start!133758 m!1437807))

(declare-fun m!1437809 () Bool)

(assert (=> start!133758 m!1437809))

(declare-fun m!1437811 () Bool)

(assert (=> b!1561654 m!1437811))

(declare-fun m!1437813 () Bool)

(assert (=> mapNonEmpty!59064 m!1437813))

(check-sat (not b!1561654) (not start!133758) (not mapNonEmpty!59064) tp_is_empty!38467)
(check-sat)
(get-model)

(declare-fun b!1561702 () Bool)

(declare-fun e!870292 () Bool)

(declare-fun call!71985 () Bool)

(assert (=> b!1561702 (= e!870292 call!71985)))

(declare-fun b!1561703 () Bool)

(declare-fun e!870293 () Bool)

(assert (=> b!1561703 (= e!870293 e!870292)))

(declare-fun c!145015 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561703 (= c!145015 (validKeyInArray!0 (select (arr!50082 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!163603 () Bool)

(declare-fun res!1067166 () Bool)

(assert (=> d!163603 (=> res!1067166 e!870293)))

(assert (=> d!163603 (= res!1067166 (bvsge #b00000000000000000000000000000000 (size!50633 _keys!637)))))

(assert (=> d!163603 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!870293)))

(declare-fun b!1561704 () Bool)

(declare-fun e!870291 () Bool)

(assert (=> b!1561704 (= e!870291 call!71985)))

(declare-fun bm!71982 () Bool)

(assert (=> bm!71982 (= call!71985 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1561705 () Bool)

(assert (=> b!1561705 (= e!870292 e!870291)))

(declare-fun lt!671766 () (_ BitVec 64))

(assert (=> b!1561705 (= lt!671766 (select (arr!50082 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51805 0))(
  ( (Unit!51806) )
))
(declare-fun lt!671765 () Unit!51805)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103786 (_ BitVec 64) (_ BitVec 32)) Unit!51805)

(assert (=> b!1561705 (= lt!671765 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!671766 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1561705 (arrayContainsKey!0 _keys!637 lt!671766 #b00000000000000000000000000000000)))

(declare-fun lt!671767 () Unit!51805)

(assert (=> b!1561705 (= lt!671767 lt!671765)))

(declare-fun res!1067165 () Bool)

(declare-datatypes ((SeekEntryResult!13465 0))(
  ( (MissingZero!13465 (index!56258 (_ BitVec 32))) (Found!13465 (index!56259 (_ BitVec 32))) (Intermediate!13465 (undefined!14277 Bool) (index!56260 (_ BitVec 32)) (x!139750 (_ BitVec 32))) (Undefined!13465) (MissingVacant!13465 (index!56261 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103786 (_ BitVec 32)) SeekEntryResult!13465)

(assert (=> b!1561705 (= res!1067165 (= (seekEntryOrOpen!0 (select (arr!50082 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13465 #b00000000000000000000000000000000)))))

(assert (=> b!1561705 (=> (not res!1067165) (not e!870291))))

(assert (= (and d!163603 (not res!1067166)) b!1561703))

(assert (= (and b!1561703 c!145015) b!1561705))

(assert (= (and b!1561703 (not c!145015)) b!1561702))

(assert (= (and b!1561705 res!1067165) b!1561704))

(assert (= (or b!1561704 b!1561702) bm!71982))

(declare-fun m!1437835 () Bool)

(assert (=> b!1561703 m!1437835))

(assert (=> b!1561703 m!1437835))

(declare-fun m!1437837 () Bool)

(assert (=> b!1561703 m!1437837))

(declare-fun m!1437839 () Bool)

(assert (=> bm!71982 m!1437839))

(assert (=> b!1561705 m!1437835))

(declare-fun m!1437841 () Bool)

(assert (=> b!1561705 m!1437841))

(declare-fun m!1437843 () Bool)

(assert (=> b!1561705 m!1437843))

(assert (=> b!1561705 m!1437835))

(declare-fun m!1437845 () Bool)

(assert (=> b!1561705 m!1437845))

(assert (=> b!1561654 d!163603))

(declare-fun d!163605 () Bool)

(assert (=> d!163605 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133758 d!163605))

(declare-fun d!163607 () Bool)

(assert (=> d!163607 (= (array_inv!39193 _values!487) (bvsge (size!50632 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133758 d!163607))

(declare-fun d!163609 () Bool)

(assert (=> d!163609 (= (array_inv!39194 _keys!637) (bvsge (size!50633 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133758 d!163609))

(declare-fun b!1561713 () Bool)

(declare-fun e!870298 () Bool)

(assert (=> b!1561713 (= e!870298 tp_is_empty!38467)))

(declare-fun mapIsEmpty!59073 () Bool)

(declare-fun mapRes!59073 () Bool)

(assert (=> mapIsEmpty!59073 mapRes!59073))

(declare-fun condMapEmpty!59073 () Bool)

(declare-fun mapDefault!59073 () ValueCell!18203)

(assert (=> mapNonEmpty!59064 (= condMapEmpty!59073 (= mapRest!59064 ((as const (Array (_ BitVec 32) ValueCell!18203)) mapDefault!59073)))))

(assert (=> mapNonEmpty!59064 (= tp!112719 (and e!870298 mapRes!59073))))

(declare-fun mapNonEmpty!59073 () Bool)

(declare-fun tp!112728 () Bool)

(declare-fun e!870299 () Bool)

(assert (=> mapNonEmpty!59073 (= mapRes!59073 (and tp!112728 e!870299))))

(declare-fun mapValue!59073 () ValueCell!18203)

(declare-fun mapKey!59073 () (_ BitVec 32))

(declare-fun mapRest!59073 () (Array (_ BitVec 32) ValueCell!18203))

(assert (=> mapNonEmpty!59073 (= mapRest!59064 (store mapRest!59073 mapKey!59073 mapValue!59073))))

(declare-fun b!1561712 () Bool)

(assert (=> b!1561712 (= e!870299 tp_is_empty!38467)))

(assert (= (and mapNonEmpty!59064 condMapEmpty!59073) mapIsEmpty!59073))

(assert (= (and mapNonEmpty!59064 (not condMapEmpty!59073)) mapNonEmpty!59073))

(assert (= (and mapNonEmpty!59073 ((_ is ValueCellFull!18203) mapValue!59073)) b!1561712))

(assert (= (and mapNonEmpty!59064 ((_ is ValueCellFull!18203) mapDefault!59073)) b!1561713))

(declare-fun m!1437847 () Bool)

(assert (=> mapNonEmpty!59073 m!1437847))

(check-sat (not b!1561703) (not bm!71982) tp_is_empty!38467 (not b!1561705) (not mapNonEmpty!59073))
(check-sat)
