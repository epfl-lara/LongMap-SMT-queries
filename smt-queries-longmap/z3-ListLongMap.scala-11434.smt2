; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133340 () Bool)

(assert start!133340)

(declare-fun b!1559146 () Bool)

(declare-fun e!868734 () Bool)

(declare-fun tp_is_empty!38485 () Bool)

(assert (=> b!1559146 (= e!868734 tp_is_empty!38485)))

(declare-fun b!1559147 () Bool)

(declare-fun e!868731 () Bool)

(assert (=> b!1559147 (= e!868731 tp_is_empty!38485)))

(declare-fun b!1559148 () Bool)

(declare-fun res!1066273 () Bool)

(declare-fun e!868736 () Bool)

(assert (=> b!1559148 (=> (not res!1066273) (not e!868736))))

(declare-datatypes ((array!103618 0))(
  ( (array!103619 (arr!50003 (Array (_ BitVec 32) (_ BitVec 64))) (size!50555 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103618)

(assert (=> b!1559148 (= res!1066273 (and (bvsle #b00000000000000000000000000000000 (size!50555 _keys!637)) (bvslt (size!50555 _keys!637) #b01111111111111111111111111111111)))))

(declare-fun res!1066272 () Bool)

(assert (=> start!133340 (=> (not res!1066272) (not e!868736))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133340 (= res!1066272 (validMask!0 mask!947))))

(assert (=> start!133340 e!868736))

(assert (=> start!133340 true))

(declare-datatypes ((V!59521 0))(
  ( (V!59522 (val!19326 Int)) )
))
(declare-datatypes ((ValueCell!18212 0))(
  ( (ValueCellFull!18212 (v!22073 V!59521)) (EmptyCell!18212) )
))
(declare-datatypes ((array!103620 0))(
  ( (array!103621 (arr!50004 (Array (_ BitVec 32) ValueCell!18212)) (size!50556 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103620)

(declare-fun e!868732 () Bool)

(declare-fun array_inv!39073 (array!103620) Bool)

(assert (=> start!133340 (and (array_inv!39073 _values!487) e!868732)))

(declare-fun array_inv!39074 (array!103618) Bool)

(assert (=> start!133340 (array_inv!39074 _keys!637)))

(declare-fun b!1559149 () Bool)

(declare-fun res!1066275 () Bool)

(assert (=> b!1559149 (=> (not res!1066275) (not e!868736))))

(declare-datatypes ((List!36393 0))(
  ( (Nil!36390) (Cons!36389 (h!37836 (_ BitVec 64)) (t!51118 List!36393)) )
))
(declare-fun noDuplicate!2665 (List!36393) Bool)

(assert (=> b!1559149 (= res!1066275 (noDuplicate!2665 Nil!36390))))

(declare-fun b!1559150 () Bool)

(declare-fun res!1066271 () Bool)

(assert (=> b!1559150 (=> (not res!1066271) (not e!868736))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559150 (= res!1066271 (and (= (size!50556 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50555 _keys!637) (size!50556 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559151 () Bool)

(declare-fun e!868735 () Bool)

(assert (=> b!1559151 (= e!868736 e!868735)))

(declare-fun res!1066274 () Bool)

(assert (=> b!1559151 (=> res!1066274 e!868735)))

(declare-fun contains!10177 (List!36393 (_ BitVec 64)) Bool)

(assert (=> b!1559151 (= res!1066274 (contains!10177 Nil!36390 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!59100 () Bool)

(declare-fun mapRes!59100 () Bool)

(assert (=> mapIsEmpty!59100 mapRes!59100))

(declare-fun b!1559152 () Bool)

(declare-fun res!1066276 () Bool)

(assert (=> b!1559152 (=> (not res!1066276) (not e!868736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103618 (_ BitVec 32)) Bool)

(assert (=> b!1559152 (= res!1066276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559153 () Bool)

(assert (=> b!1559153 (= e!868732 (and e!868731 mapRes!59100))))

(declare-fun condMapEmpty!59100 () Bool)

(declare-fun mapDefault!59100 () ValueCell!18212)

(assert (=> b!1559153 (= condMapEmpty!59100 (= (arr!50004 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18212)) mapDefault!59100)))))

(declare-fun mapNonEmpty!59100 () Bool)

(declare-fun tp!112756 () Bool)

(assert (=> mapNonEmpty!59100 (= mapRes!59100 (and tp!112756 e!868734))))

(declare-fun mapValue!59100 () ValueCell!18212)

(declare-fun mapKey!59100 () (_ BitVec 32))

(declare-fun mapRest!59100 () (Array (_ BitVec 32) ValueCell!18212))

(assert (=> mapNonEmpty!59100 (= (arr!50004 _values!487) (store mapRest!59100 mapKey!59100 mapValue!59100))))

(declare-fun b!1559154 () Bool)

(assert (=> b!1559154 (= e!868735 (contains!10177 Nil!36390 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!133340 res!1066272) b!1559150))

(assert (= (and b!1559150 res!1066271) b!1559152))

(assert (= (and b!1559152 res!1066276) b!1559148))

(assert (= (and b!1559148 res!1066273) b!1559149))

(assert (= (and b!1559149 res!1066275) b!1559151))

(assert (= (and b!1559151 (not res!1066274)) b!1559154))

(assert (= (and b!1559153 condMapEmpty!59100) mapIsEmpty!59100))

(assert (= (and b!1559153 (not condMapEmpty!59100)) mapNonEmpty!59100))

(get-info :version)

(assert (= (and mapNonEmpty!59100 ((_ is ValueCellFull!18212) mapValue!59100)) b!1559146))

(assert (= (and b!1559153 ((_ is ValueCellFull!18212) mapDefault!59100)) b!1559147))

(assert (= start!133340 b!1559153))

(declare-fun m!1434797 () Bool)

(assert (=> b!1559151 m!1434797))

(declare-fun m!1434799 () Bool)

(assert (=> start!133340 m!1434799))

(declare-fun m!1434801 () Bool)

(assert (=> start!133340 m!1434801))

(declare-fun m!1434803 () Bool)

(assert (=> start!133340 m!1434803))

(declare-fun m!1434805 () Bool)

(assert (=> b!1559154 m!1434805))

(declare-fun m!1434807 () Bool)

(assert (=> mapNonEmpty!59100 m!1434807))

(declare-fun m!1434809 () Bool)

(assert (=> b!1559152 m!1434809))

(declare-fun m!1434811 () Bool)

(assert (=> b!1559149 m!1434811))

(check-sat (not b!1559151) (not b!1559154) (not b!1559149) (not start!133340) (not b!1559152) (not mapNonEmpty!59100) tp_is_empty!38485)
(check-sat)
(get-model)

(declare-fun d!162681 () Bool)

(declare-fun res!1066317 () Bool)

(declare-fun e!868777 () Bool)

(assert (=> d!162681 (=> res!1066317 e!868777)))

(assert (=> d!162681 (= res!1066317 ((_ is Nil!36390) Nil!36390))))

(assert (=> d!162681 (= (noDuplicate!2665 Nil!36390) e!868777)))

(declare-fun b!1559213 () Bool)

(declare-fun e!868778 () Bool)

(assert (=> b!1559213 (= e!868777 e!868778)))

(declare-fun res!1066318 () Bool)

(assert (=> b!1559213 (=> (not res!1066318) (not e!868778))))

(assert (=> b!1559213 (= res!1066318 (not (contains!10177 (t!51118 Nil!36390) (h!37836 Nil!36390))))))

(declare-fun b!1559214 () Bool)

(assert (=> b!1559214 (= e!868778 (noDuplicate!2665 (t!51118 Nil!36390)))))

(assert (= (and d!162681 (not res!1066317)) b!1559213))

(assert (= (and b!1559213 res!1066318) b!1559214))

(declare-fun m!1434845 () Bool)

(assert (=> b!1559213 m!1434845))

(declare-fun m!1434847 () Bool)

(assert (=> b!1559214 m!1434847))

(assert (=> b!1559149 d!162681))

(declare-fun d!162683 () Bool)

(assert (=> d!162683 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133340 d!162683))

(declare-fun d!162685 () Bool)

(assert (=> d!162685 (= (array_inv!39073 _values!487) (bvsge (size!50556 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133340 d!162685))

(declare-fun d!162687 () Bool)

(assert (=> d!162687 (= (array_inv!39074 _keys!637) (bvsge (size!50555 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133340 d!162687))

(declare-fun b!1559223 () Bool)

(declare-fun e!868786 () Bool)

(declare-fun call!71809 () Bool)

(assert (=> b!1559223 (= e!868786 call!71809)))

(declare-fun bm!71806 () Bool)

(assert (=> bm!71806 (= call!71809 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1559224 () Bool)

(declare-fun e!868787 () Bool)

(assert (=> b!1559224 (= e!868787 call!71809)))

(declare-fun d!162689 () Bool)

(declare-fun res!1066324 () Bool)

(declare-fun e!868785 () Bool)

(assert (=> d!162689 (=> res!1066324 e!868785)))

(assert (=> d!162689 (= res!1066324 (bvsge #b00000000000000000000000000000000 (size!50555 _keys!637)))))

(assert (=> d!162689 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!868785)))

(declare-fun b!1559225 () Bool)

(assert (=> b!1559225 (= e!868785 e!868787)))

(declare-fun c!144135 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1559225 (= c!144135 (validKeyInArray!0 (select (arr!50003 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1559226 () Bool)

(assert (=> b!1559226 (= e!868787 e!868786)))

(declare-fun lt!670600 () (_ BitVec 64))

(assert (=> b!1559226 (= lt!670600 (select (arr!50003 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51716 0))(
  ( (Unit!51717) )
))
(declare-fun lt!670599 () Unit!51716)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103618 (_ BitVec 64) (_ BitVec 32)) Unit!51716)

(assert (=> b!1559226 (= lt!670599 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!670600 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1559226 (arrayContainsKey!0 _keys!637 lt!670600 #b00000000000000000000000000000000)))

(declare-fun lt!670598 () Unit!51716)

(assert (=> b!1559226 (= lt!670598 lt!670599)))

(declare-fun res!1066323 () Bool)

(declare-datatypes ((SeekEntryResult!13520 0))(
  ( (MissingZero!13520 (index!56478 (_ BitVec 32))) (Found!13520 (index!56479 (_ BitVec 32))) (Intermediate!13520 (undefined!14332 Bool) (index!56480 (_ BitVec 32)) (x!139781 (_ BitVec 32))) (Undefined!13520) (MissingVacant!13520 (index!56481 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103618 (_ BitVec 32)) SeekEntryResult!13520)

(assert (=> b!1559226 (= res!1066323 (= (seekEntryOrOpen!0 (select (arr!50003 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13520 #b00000000000000000000000000000000)))))

(assert (=> b!1559226 (=> (not res!1066323) (not e!868786))))

(assert (= (and d!162689 (not res!1066324)) b!1559225))

(assert (= (and b!1559225 c!144135) b!1559226))

(assert (= (and b!1559225 (not c!144135)) b!1559224))

(assert (= (and b!1559226 res!1066323) b!1559223))

(assert (= (or b!1559223 b!1559224) bm!71806))

(declare-fun m!1434849 () Bool)

(assert (=> bm!71806 m!1434849))

(declare-fun m!1434851 () Bool)

(assert (=> b!1559225 m!1434851))

(assert (=> b!1559225 m!1434851))

(declare-fun m!1434853 () Bool)

(assert (=> b!1559225 m!1434853))

(assert (=> b!1559226 m!1434851))

(declare-fun m!1434855 () Bool)

(assert (=> b!1559226 m!1434855))

(declare-fun m!1434857 () Bool)

(assert (=> b!1559226 m!1434857))

(assert (=> b!1559226 m!1434851))

(declare-fun m!1434859 () Bool)

(assert (=> b!1559226 m!1434859))

(assert (=> b!1559152 d!162689))

(declare-fun d!162691 () Bool)

(declare-fun lt!670603 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!796 (List!36393) (InoxSet (_ BitVec 64)))

(assert (=> d!162691 (= lt!670603 (select (content!796 Nil!36390) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!868792 () Bool)

(assert (=> d!162691 (= lt!670603 e!868792)))

(declare-fun res!1066330 () Bool)

(assert (=> d!162691 (=> (not res!1066330) (not e!868792))))

(assert (=> d!162691 (= res!1066330 ((_ is Cons!36389) Nil!36390))))

(assert (=> d!162691 (= (contains!10177 Nil!36390 #b0000000000000000000000000000000000000000000000000000000000000000) lt!670603)))

(declare-fun b!1559231 () Bool)

(declare-fun e!868793 () Bool)

(assert (=> b!1559231 (= e!868792 e!868793)))

(declare-fun res!1066329 () Bool)

(assert (=> b!1559231 (=> res!1066329 e!868793)))

(assert (=> b!1559231 (= res!1066329 (= (h!37836 Nil!36390) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559232 () Bool)

(assert (=> b!1559232 (= e!868793 (contains!10177 (t!51118 Nil!36390) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!162691 res!1066330) b!1559231))

(assert (= (and b!1559231 (not res!1066329)) b!1559232))

(declare-fun m!1434861 () Bool)

(assert (=> d!162691 m!1434861))

(declare-fun m!1434863 () Bool)

(assert (=> d!162691 m!1434863))

(declare-fun m!1434865 () Bool)

(assert (=> b!1559232 m!1434865))

(assert (=> b!1559151 d!162691))

(declare-fun d!162693 () Bool)

(declare-fun lt!670604 () Bool)

(assert (=> d!162693 (= lt!670604 (select (content!796 Nil!36390) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!868794 () Bool)

(assert (=> d!162693 (= lt!670604 e!868794)))

(declare-fun res!1066332 () Bool)

(assert (=> d!162693 (=> (not res!1066332) (not e!868794))))

(assert (=> d!162693 (= res!1066332 ((_ is Cons!36389) Nil!36390))))

(assert (=> d!162693 (= (contains!10177 Nil!36390 #b1000000000000000000000000000000000000000000000000000000000000000) lt!670604)))

(declare-fun b!1559233 () Bool)

(declare-fun e!868795 () Bool)

(assert (=> b!1559233 (= e!868794 e!868795)))

(declare-fun res!1066331 () Bool)

(assert (=> b!1559233 (=> res!1066331 e!868795)))

(assert (=> b!1559233 (= res!1066331 (= (h!37836 Nil!36390) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559234 () Bool)

(assert (=> b!1559234 (= e!868795 (contains!10177 (t!51118 Nil!36390) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!162693 res!1066332) b!1559233))

(assert (= (and b!1559233 (not res!1066331)) b!1559234))

(assert (=> d!162693 m!1434861))

(declare-fun m!1434867 () Bool)

(assert (=> d!162693 m!1434867))

(declare-fun m!1434869 () Bool)

(assert (=> b!1559234 m!1434869))

(assert (=> b!1559154 d!162693))

(declare-fun b!1559241 () Bool)

(declare-fun e!868800 () Bool)

(assert (=> b!1559241 (= e!868800 tp_is_empty!38485)))

(declare-fun condMapEmpty!59109 () Bool)

(declare-fun mapDefault!59109 () ValueCell!18212)

(assert (=> mapNonEmpty!59100 (= condMapEmpty!59109 (= mapRest!59100 ((as const (Array (_ BitVec 32) ValueCell!18212)) mapDefault!59109)))))

(declare-fun e!868801 () Bool)

(declare-fun mapRes!59109 () Bool)

(assert (=> mapNonEmpty!59100 (= tp!112756 (and e!868801 mapRes!59109))))

(declare-fun mapIsEmpty!59109 () Bool)

(assert (=> mapIsEmpty!59109 mapRes!59109))

(declare-fun mapNonEmpty!59109 () Bool)

(declare-fun tp!112765 () Bool)

(assert (=> mapNonEmpty!59109 (= mapRes!59109 (and tp!112765 e!868800))))

(declare-fun mapValue!59109 () ValueCell!18212)

(declare-fun mapRest!59109 () (Array (_ BitVec 32) ValueCell!18212))

(declare-fun mapKey!59109 () (_ BitVec 32))

(assert (=> mapNonEmpty!59109 (= mapRest!59100 (store mapRest!59109 mapKey!59109 mapValue!59109))))

(declare-fun b!1559242 () Bool)

(assert (=> b!1559242 (= e!868801 tp_is_empty!38485)))

(assert (= (and mapNonEmpty!59100 condMapEmpty!59109) mapIsEmpty!59109))

(assert (= (and mapNonEmpty!59100 (not condMapEmpty!59109)) mapNonEmpty!59109))

(assert (= (and mapNonEmpty!59109 ((_ is ValueCellFull!18212) mapValue!59109)) b!1559241))

(assert (= (and mapNonEmpty!59100 ((_ is ValueCellFull!18212) mapDefault!59109)) b!1559242))

(declare-fun m!1434871 () Bool)

(assert (=> mapNonEmpty!59109 m!1434871))

(check-sat (not d!162693) (not b!1559226) (not b!1559214) (not b!1559232) (not bm!71806) tp_is_empty!38485 (not d!162691) (not mapNonEmpty!59109) (not b!1559234) (not b!1559225) (not b!1559213))
(check-sat)
