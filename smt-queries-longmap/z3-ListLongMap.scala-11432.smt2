; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133772 () Bool)

(assert start!133772)

(declare-fun mapIsEmpty!59076 () Bool)

(declare-fun mapRes!59076 () Bool)

(assert (=> mapIsEmpty!59076 mapRes!59076))

(declare-fun b!1561727 () Bool)

(declare-fun e!870312 () Bool)

(declare-fun tp_is_empty!38473 () Bool)

(assert (=> b!1561727 (= e!870312 tp_is_empty!38473)))

(declare-fun b!1561728 () Bool)

(declare-fun e!870311 () Bool)

(declare-fun e!870310 () Bool)

(assert (=> b!1561728 (= e!870311 (and e!870310 mapRes!59076))))

(declare-fun condMapEmpty!59076 () Bool)

(declare-datatypes ((V!59505 0))(
  ( (V!59506 (val!19320 Int)) )
))
(declare-datatypes ((ValueCell!18206 0))(
  ( (ValueCellFull!18206 (v!22063 V!59505)) (EmptyCell!18206) )
))
(declare-datatypes ((array!103798 0))(
  ( (array!103799 (arr!50087 (Array (_ BitVec 32) ValueCell!18206)) (size!50638 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103798)

(declare-fun mapDefault!59076 () ValueCell!18206)

(assert (=> b!1561728 (= condMapEmpty!59076 (= (arr!50087 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18206)) mapDefault!59076)))))

(declare-fun b!1561729 () Bool)

(declare-fun res!1067174 () Bool)

(declare-fun e!870314 () Bool)

(assert (=> b!1561729 (=> (not res!1067174) (not e!870314))))

(declare-datatypes ((array!103800 0))(
  ( (array!103801 (arr!50088 (Array (_ BitVec 32) (_ BitVec 64))) (size!50639 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103800)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103800 (_ BitVec 32)) Bool)

(assert (=> b!1561729 (= res!1067174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59076 () Bool)

(declare-fun tp!112731 () Bool)

(assert (=> mapNonEmpty!59076 (= mapRes!59076 (and tp!112731 e!870312))))

(declare-fun mapRest!59076 () (Array (_ BitVec 32) ValueCell!18206))

(declare-fun mapKey!59076 () (_ BitVec 32))

(declare-fun mapValue!59076 () ValueCell!18206)

(assert (=> mapNonEmpty!59076 (= (arr!50087 _values!487) (store mapRest!59076 mapKey!59076 mapValue!59076))))

(declare-fun b!1561730 () Bool)

(assert (=> b!1561730 (= e!870314 (and (bvsle #b00000000000000000000000000000000 (size!50639 _keys!637)) (bvsge (size!50639 _keys!637) #b01111111111111111111111111111111)))))

(declare-fun b!1561731 () Bool)

(assert (=> b!1561731 (= e!870310 tp_is_empty!38473)))

(declare-fun b!1561726 () Bool)

(declare-fun res!1067173 () Bool)

(assert (=> b!1561726 (=> (not res!1067173) (not e!870314))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1561726 (= res!1067173 (and (= (size!50638 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50639 _keys!637) (size!50638 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1067175 () Bool)

(assert (=> start!133772 (=> (not res!1067175) (not e!870314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133772 (= res!1067175 (validMask!0 mask!947))))

(assert (=> start!133772 e!870314))

(assert (=> start!133772 true))

(declare-fun array_inv!39195 (array!103798) Bool)

(assert (=> start!133772 (and (array_inv!39195 _values!487) e!870311)))

(declare-fun array_inv!39196 (array!103800) Bool)

(assert (=> start!133772 (array_inv!39196 _keys!637)))

(assert (= (and start!133772 res!1067175) b!1561726))

(assert (= (and b!1561726 res!1067173) b!1561729))

(assert (= (and b!1561729 res!1067174) b!1561730))

(assert (= (and b!1561728 condMapEmpty!59076) mapIsEmpty!59076))

(assert (= (and b!1561728 (not condMapEmpty!59076)) mapNonEmpty!59076))

(get-info :version)

(assert (= (and mapNonEmpty!59076 ((_ is ValueCellFull!18206) mapValue!59076)) b!1561727))

(assert (= (and b!1561728 ((_ is ValueCellFull!18206) mapDefault!59076)) b!1561731))

(assert (= start!133772 b!1561728))

(declare-fun m!1437849 () Bool)

(assert (=> b!1561729 m!1437849))

(declare-fun m!1437851 () Bool)

(assert (=> mapNonEmpty!59076 m!1437851))

(declare-fun m!1437853 () Bool)

(assert (=> start!133772 m!1437853))

(declare-fun m!1437855 () Bool)

(assert (=> start!133772 m!1437855))

(declare-fun m!1437857 () Bool)

(assert (=> start!133772 m!1437857))

(check-sat (not b!1561729) (not start!133772) (not mapNonEmpty!59076) tp_is_empty!38473)
(check-sat)
(get-model)

(declare-fun b!1561776 () Bool)

(declare-fun e!870351 () Bool)

(declare-fun call!71988 () Bool)

(assert (=> b!1561776 (= e!870351 call!71988)))

(declare-fun b!1561777 () Bool)

(declare-fun e!870353 () Bool)

(assert (=> b!1561777 (= e!870353 call!71988)))

(declare-fun d!163613 () Bool)

(declare-fun res!1067199 () Bool)

(declare-fun e!870352 () Bool)

(assert (=> d!163613 (=> res!1067199 e!870352)))

(assert (=> d!163613 (= res!1067199 (bvsge #b00000000000000000000000000000000 (size!50639 _keys!637)))))

(assert (=> d!163613 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!870352)))

(declare-fun b!1561778 () Bool)

(assert (=> b!1561778 (= e!870352 e!870353)))

(declare-fun c!145018 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561778 (= c!145018 (validKeyInArray!0 (select (arr!50088 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1561779 () Bool)

(assert (=> b!1561779 (= e!870353 e!870351)))

(declare-fun lt!671776 () (_ BitVec 64))

(assert (=> b!1561779 (= lt!671776 (select (arr!50088 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51807 0))(
  ( (Unit!51808) )
))
(declare-fun lt!671775 () Unit!51807)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103800 (_ BitVec 64) (_ BitVec 32)) Unit!51807)

(assert (=> b!1561779 (= lt!671775 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!671776 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1561779 (arrayContainsKey!0 _keys!637 lt!671776 #b00000000000000000000000000000000)))

(declare-fun lt!671774 () Unit!51807)

(assert (=> b!1561779 (= lt!671774 lt!671775)))

(declare-fun res!1067198 () Bool)

(declare-datatypes ((SeekEntryResult!13466 0))(
  ( (MissingZero!13466 (index!56262 (_ BitVec 32))) (Found!13466 (index!56263 (_ BitVec 32))) (Intermediate!13466 (undefined!14278 Bool) (index!56264 (_ BitVec 32)) (x!139761 (_ BitVec 32))) (Undefined!13466) (MissingVacant!13466 (index!56265 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103800 (_ BitVec 32)) SeekEntryResult!13466)

(assert (=> b!1561779 (= res!1067198 (= (seekEntryOrOpen!0 (select (arr!50088 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13466 #b00000000000000000000000000000000)))))

(assert (=> b!1561779 (=> (not res!1067198) (not e!870351))))

(declare-fun bm!71985 () Bool)

(assert (=> bm!71985 (= call!71988 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(assert (= (and d!163613 (not res!1067199)) b!1561778))

(assert (= (and b!1561778 c!145018) b!1561779))

(assert (= (and b!1561778 (not c!145018)) b!1561777))

(assert (= (and b!1561779 res!1067198) b!1561776))

(assert (= (or b!1561776 b!1561777) bm!71985))

(declare-fun m!1437879 () Bool)

(assert (=> b!1561778 m!1437879))

(assert (=> b!1561778 m!1437879))

(declare-fun m!1437881 () Bool)

(assert (=> b!1561778 m!1437881))

(assert (=> b!1561779 m!1437879))

(declare-fun m!1437883 () Bool)

(assert (=> b!1561779 m!1437883))

(declare-fun m!1437885 () Bool)

(assert (=> b!1561779 m!1437885))

(assert (=> b!1561779 m!1437879))

(declare-fun m!1437887 () Bool)

(assert (=> b!1561779 m!1437887))

(declare-fun m!1437889 () Bool)

(assert (=> bm!71985 m!1437889))

(assert (=> b!1561729 d!163613))

(declare-fun d!163615 () Bool)

(assert (=> d!163615 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133772 d!163615))

(declare-fun d!163617 () Bool)

(assert (=> d!163617 (= (array_inv!39195 _values!487) (bvsge (size!50638 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133772 d!163617))

(declare-fun d!163619 () Bool)

(assert (=> d!163619 (= (array_inv!39196 _keys!637) (bvsge (size!50639 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133772 d!163619))

(declare-fun condMapEmpty!59085 () Bool)

(declare-fun mapDefault!59085 () ValueCell!18206)

(assert (=> mapNonEmpty!59076 (= condMapEmpty!59085 (= mapRest!59076 ((as const (Array (_ BitVec 32) ValueCell!18206)) mapDefault!59085)))))

(declare-fun e!870359 () Bool)

(declare-fun mapRes!59085 () Bool)

(assert (=> mapNonEmpty!59076 (= tp!112731 (and e!870359 mapRes!59085))))

(declare-fun mapIsEmpty!59085 () Bool)

(assert (=> mapIsEmpty!59085 mapRes!59085))

(declare-fun b!1561787 () Bool)

(assert (=> b!1561787 (= e!870359 tp_is_empty!38473)))

(declare-fun mapNonEmpty!59085 () Bool)

(declare-fun tp!112740 () Bool)

(declare-fun e!870358 () Bool)

(assert (=> mapNonEmpty!59085 (= mapRes!59085 (and tp!112740 e!870358))))

(declare-fun mapKey!59085 () (_ BitVec 32))

(declare-fun mapValue!59085 () ValueCell!18206)

(declare-fun mapRest!59085 () (Array (_ BitVec 32) ValueCell!18206))

(assert (=> mapNonEmpty!59085 (= mapRest!59076 (store mapRest!59085 mapKey!59085 mapValue!59085))))

(declare-fun b!1561786 () Bool)

(assert (=> b!1561786 (= e!870358 tp_is_empty!38473)))

(assert (= (and mapNonEmpty!59076 condMapEmpty!59085) mapIsEmpty!59085))

(assert (= (and mapNonEmpty!59076 (not condMapEmpty!59085)) mapNonEmpty!59085))

(assert (= (and mapNonEmpty!59085 ((_ is ValueCellFull!18206) mapValue!59085)) b!1561786))

(assert (= (and mapNonEmpty!59076 ((_ is ValueCellFull!18206) mapDefault!59085)) b!1561787))

(declare-fun m!1437891 () Bool)

(assert (=> mapNonEmpty!59085 m!1437891))

(check-sat (not mapNonEmpty!59085) tp_is_empty!38473 (not b!1561778) (not bm!71985) (not b!1561779))
(check-sat)
