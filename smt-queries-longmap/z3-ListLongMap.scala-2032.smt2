; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35334 () Bool)

(assert start!35334)

(declare-fun b!353702 () Bool)

(declare-fun res!196116 () Bool)

(declare-fun e!216693 () Bool)

(assert (=> b!353702 (=> (not res!196116) (not e!216693))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353702 (= res!196116 (validKeyInArray!0 k0!1077))))

(declare-fun b!353703 () Bool)

(declare-fun res!196117 () Bool)

(assert (=> b!353703 (=> (not res!196117) (not e!216693))))

(declare-datatypes ((array!19199 0))(
  ( (array!19200 (arr!9094 (Array (_ BitVec 32) (_ BitVec 64))) (size!9447 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19199)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19199 (_ BitVec 32)) Bool)

(assert (=> b!353703 (= res!196117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!353704 () Bool)

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!353704 (= e!216693 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9447 _keys!1456)) (bvsge (size!9447 _keys!1456) #b01111111111111111111111111111111)))))

(declare-fun b!353705 () Bool)

(declare-fun e!216691 () Bool)

(declare-fun e!216690 () Bool)

(declare-fun mapRes!13224 () Bool)

(assert (=> b!353705 (= e!216691 (and e!216690 mapRes!13224))))

(declare-fun condMapEmpty!13224 () Bool)

(declare-datatypes ((V!11395 0))(
  ( (V!11396 (val!3951 Int)) )
))
(declare-datatypes ((ValueCell!3563 0))(
  ( (ValueCellFull!3563 (v!6139 V!11395)) (EmptyCell!3563) )
))
(declare-datatypes ((array!19201 0))(
  ( (array!19202 (arr!9095 (Array (_ BitVec 32) ValueCell!3563)) (size!9448 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19201)

(declare-fun mapDefault!13224 () ValueCell!3563)

(assert (=> b!353705 (= condMapEmpty!13224 (= (arr!9095 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3563)) mapDefault!13224)))))

(declare-fun res!196113 () Bool)

(assert (=> start!35334 (=> (not res!196113) (not e!216693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35334 (= res!196113 (validMask!0 mask!1842))))

(assert (=> start!35334 e!216693))

(assert (=> start!35334 true))

(declare-fun array_inv!6734 (array!19199) Bool)

(assert (=> start!35334 (array_inv!6734 _keys!1456)))

(declare-fun array_inv!6735 (array!19201) Bool)

(assert (=> start!35334 (and (array_inv!6735 _values!1208) e!216691)))

(declare-fun b!353706 () Bool)

(declare-fun res!196114 () Bool)

(assert (=> b!353706 (=> (not res!196114) (not e!216693))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353706 (= res!196114 (and (= (size!9448 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9447 _keys!1456) (size!9448 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13224 () Bool)

(declare-fun tp!27120 () Bool)

(declare-fun e!216692 () Bool)

(assert (=> mapNonEmpty!13224 (= mapRes!13224 (and tp!27120 e!216692))))

(declare-fun mapRest!13224 () (Array (_ BitVec 32) ValueCell!3563))

(declare-fun mapValue!13224 () ValueCell!3563)

(declare-fun mapKey!13224 () (_ BitVec 32))

(assert (=> mapNonEmpty!13224 (= (arr!9095 _values!1208) (store mapRest!13224 mapKey!13224 mapValue!13224))))

(declare-fun mapIsEmpty!13224 () Bool)

(assert (=> mapIsEmpty!13224 mapRes!13224))

(declare-fun b!353707 () Bool)

(declare-fun tp_is_empty!7813 () Bool)

(assert (=> b!353707 (= e!216690 tp_is_empty!7813)))

(declare-fun b!353708 () Bool)

(assert (=> b!353708 (= e!216692 tp_is_empty!7813)))

(declare-fun b!353709 () Bool)

(declare-fun res!196115 () Bool)

(assert (=> b!353709 (=> (not res!196115) (not e!216693))))

(declare-datatypes ((List!5256 0))(
  ( (Nil!5253) (Cons!5252 (h!6108 (_ BitVec 64)) (t!10397 List!5256)) )
))
(declare-fun arrayNoDuplicates!0 (array!19199 (_ BitVec 32) List!5256) Bool)

(assert (=> b!353709 (= res!196115 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5253))))

(assert (= (and start!35334 res!196113) b!353706))

(assert (= (and b!353706 res!196114) b!353703))

(assert (= (and b!353703 res!196117) b!353709))

(assert (= (and b!353709 res!196115) b!353702))

(assert (= (and b!353702 res!196116) b!353704))

(assert (= (and b!353705 condMapEmpty!13224) mapIsEmpty!13224))

(assert (= (and b!353705 (not condMapEmpty!13224)) mapNonEmpty!13224))

(get-info :version)

(assert (= (and mapNonEmpty!13224 ((_ is ValueCellFull!3563) mapValue!13224)) b!353708))

(assert (= (and b!353705 ((_ is ValueCellFull!3563) mapDefault!13224)) b!353707))

(assert (= start!35334 b!353705))

(declare-fun m!352425 () Bool)

(assert (=> mapNonEmpty!13224 m!352425))

(declare-fun m!352427 () Bool)

(assert (=> start!35334 m!352427))

(declare-fun m!352429 () Bool)

(assert (=> start!35334 m!352429))

(declare-fun m!352431 () Bool)

(assert (=> start!35334 m!352431))

(declare-fun m!352433 () Bool)

(assert (=> b!353703 m!352433))

(declare-fun m!352435 () Bool)

(assert (=> b!353702 m!352435))

(declare-fun m!352437 () Bool)

(assert (=> b!353709 m!352437))

(check-sat tp_is_empty!7813 (not mapNonEmpty!13224) (not b!353703) (not start!35334) (not b!353702) (not b!353709))
(check-sat)
(get-model)

(declare-fun b!353766 () Bool)

(declare-fun e!216730 () Bool)

(declare-fun e!216732 () Bool)

(assert (=> b!353766 (= e!216730 e!216732)))

(declare-fun c!53633 () Bool)

(assert (=> b!353766 (= c!53633 (validKeyInArray!0 (select (arr!9094 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun d!71467 () Bool)

(declare-fun res!196153 () Bool)

(assert (=> d!71467 (=> res!196153 e!216730)))

(assert (=> d!71467 (= res!196153 (bvsge #b00000000000000000000000000000000 (size!9447 _keys!1456)))))

(assert (=> d!71467 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!216730)))

(declare-fun b!353767 () Bool)

(declare-fun e!216731 () Bool)

(declare-fun call!27131 () Bool)

(assert (=> b!353767 (= e!216731 call!27131)))

(declare-fun b!353768 () Bool)

(assert (=> b!353768 (= e!216732 call!27131)))

(declare-fun bm!27128 () Bool)

(assert (=> bm!27128 (= call!27131 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(declare-fun b!353769 () Bool)

(assert (=> b!353769 (= e!216732 e!216731)))

(declare-fun lt!165406 () (_ BitVec 64))

(assert (=> b!353769 (= lt!165406 (select (arr!9094 _keys!1456) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10912 0))(
  ( (Unit!10913) )
))
(declare-fun lt!165405 () Unit!10912)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19199 (_ BitVec 64) (_ BitVec 32)) Unit!10912)

(assert (=> b!353769 (= lt!165405 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!165406 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353769 (arrayContainsKey!0 _keys!1456 lt!165406 #b00000000000000000000000000000000)))

(declare-fun lt!165404 () Unit!10912)

(assert (=> b!353769 (= lt!165404 lt!165405)))

(declare-fun res!196152 () Bool)

(declare-datatypes ((SeekEntryResult!3485 0))(
  ( (MissingZero!3485 (index!16119 (_ BitVec 32))) (Found!3485 (index!16120 (_ BitVec 32))) (Intermediate!3485 (undefined!4297 Bool) (index!16121 (_ BitVec 32)) (x!35240 (_ BitVec 32))) (Undefined!3485) (MissingVacant!3485 (index!16122 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19199 (_ BitVec 32)) SeekEntryResult!3485)

(assert (=> b!353769 (= res!196152 (= (seekEntryOrOpen!0 (select (arr!9094 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3485 #b00000000000000000000000000000000)))))

(assert (=> b!353769 (=> (not res!196152) (not e!216731))))

(assert (= (and d!71467 (not res!196153)) b!353766))

(assert (= (and b!353766 c!53633) b!353769))

(assert (= (and b!353766 (not c!53633)) b!353768))

(assert (= (and b!353769 res!196152) b!353767))

(assert (= (or b!353767 b!353768) bm!27128))

(declare-fun m!352467 () Bool)

(assert (=> b!353766 m!352467))

(assert (=> b!353766 m!352467))

(declare-fun m!352469 () Bool)

(assert (=> b!353766 m!352469))

(declare-fun m!352471 () Bool)

(assert (=> bm!27128 m!352471))

(assert (=> b!353769 m!352467))

(declare-fun m!352473 () Bool)

(assert (=> b!353769 m!352473))

(declare-fun m!352475 () Bool)

(assert (=> b!353769 m!352475))

(assert (=> b!353769 m!352467))

(declare-fun m!352477 () Bool)

(assert (=> b!353769 m!352477))

(assert (=> b!353703 d!71467))

(declare-fun d!71469 () Bool)

(assert (=> d!71469 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35334 d!71469))

(declare-fun d!71471 () Bool)

(assert (=> d!71471 (= (array_inv!6734 _keys!1456) (bvsge (size!9447 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35334 d!71471))

(declare-fun d!71473 () Bool)

(assert (=> d!71473 (= (array_inv!6735 _values!1208) (bvsge (size!9448 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35334 d!71473))

(declare-fun d!71475 () Bool)

(assert (=> d!71475 (= (validKeyInArray!0 k0!1077) (and (not (= k0!1077 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1077 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!353702 d!71475))

(declare-fun bm!27131 () Bool)

(declare-fun call!27134 () Bool)

(declare-fun c!53636 () Bool)

(assert (=> bm!27131 (= call!27134 (arrayNoDuplicates!0 _keys!1456 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53636 (Cons!5252 (select (arr!9094 _keys!1456) #b00000000000000000000000000000000) Nil!5253) Nil!5253)))))

(declare-fun b!353780 () Bool)

(declare-fun e!216744 () Bool)

(declare-fun e!216742 () Bool)

(assert (=> b!353780 (= e!216744 e!216742)))

(assert (=> b!353780 (= c!53636 (validKeyInArray!0 (select (arr!9094 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!353781 () Bool)

(declare-fun e!216743 () Bool)

(declare-fun contains!2373 (List!5256 (_ BitVec 64)) Bool)

(assert (=> b!353781 (= e!216743 (contains!2373 Nil!5253 (select (arr!9094 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun d!71477 () Bool)

(declare-fun res!196160 () Bool)

(declare-fun e!216741 () Bool)

(assert (=> d!71477 (=> res!196160 e!216741)))

(assert (=> d!71477 (= res!196160 (bvsge #b00000000000000000000000000000000 (size!9447 _keys!1456)))))

(assert (=> d!71477 (= (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5253) e!216741)))

(declare-fun b!353782 () Bool)

(assert (=> b!353782 (= e!216741 e!216744)))

(declare-fun res!196161 () Bool)

(assert (=> b!353782 (=> (not res!196161) (not e!216744))))

(assert (=> b!353782 (= res!196161 (not e!216743))))

(declare-fun res!196162 () Bool)

(assert (=> b!353782 (=> (not res!196162) (not e!216743))))

(assert (=> b!353782 (= res!196162 (validKeyInArray!0 (select (arr!9094 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!353783 () Bool)

(assert (=> b!353783 (= e!216742 call!27134)))

(declare-fun b!353784 () Bool)

(assert (=> b!353784 (= e!216742 call!27134)))

(assert (= (and d!71477 (not res!196160)) b!353782))

(assert (= (and b!353782 res!196162) b!353781))

(assert (= (and b!353782 res!196161) b!353780))

(assert (= (and b!353780 c!53636) b!353784))

(assert (= (and b!353780 (not c!53636)) b!353783))

(assert (= (or b!353784 b!353783) bm!27131))

(assert (=> bm!27131 m!352467))

(declare-fun m!352479 () Bool)

(assert (=> bm!27131 m!352479))

(assert (=> b!353780 m!352467))

(assert (=> b!353780 m!352467))

(assert (=> b!353780 m!352469))

(assert (=> b!353781 m!352467))

(assert (=> b!353781 m!352467))

(declare-fun m!352481 () Bool)

(assert (=> b!353781 m!352481))

(assert (=> b!353782 m!352467))

(assert (=> b!353782 m!352467))

(assert (=> b!353782 m!352469))

(assert (=> b!353709 d!71477))

(declare-fun b!353792 () Bool)

(declare-fun e!216749 () Bool)

(assert (=> b!353792 (= e!216749 tp_is_empty!7813)))

(declare-fun mapNonEmpty!13233 () Bool)

(declare-fun mapRes!13233 () Bool)

(declare-fun tp!27129 () Bool)

(declare-fun e!216750 () Bool)

(assert (=> mapNonEmpty!13233 (= mapRes!13233 (and tp!27129 e!216750))))

(declare-fun mapValue!13233 () ValueCell!3563)

(declare-fun mapKey!13233 () (_ BitVec 32))

(declare-fun mapRest!13233 () (Array (_ BitVec 32) ValueCell!3563))

(assert (=> mapNonEmpty!13233 (= mapRest!13224 (store mapRest!13233 mapKey!13233 mapValue!13233))))

(declare-fun mapIsEmpty!13233 () Bool)

(assert (=> mapIsEmpty!13233 mapRes!13233))

(declare-fun condMapEmpty!13233 () Bool)

(declare-fun mapDefault!13233 () ValueCell!3563)

(assert (=> mapNonEmpty!13224 (= condMapEmpty!13233 (= mapRest!13224 ((as const (Array (_ BitVec 32) ValueCell!3563)) mapDefault!13233)))))

(assert (=> mapNonEmpty!13224 (= tp!27120 (and e!216749 mapRes!13233))))

(declare-fun b!353791 () Bool)

(assert (=> b!353791 (= e!216750 tp_is_empty!7813)))

(assert (= (and mapNonEmpty!13224 condMapEmpty!13233) mapIsEmpty!13233))

(assert (= (and mapNonEmpty!13224 (not condMapEmpty!13233)) mapNonEmpty!13233))

(assert (= (and mapNonEmpty!13233 ((_ is ValueCellFull!3563) mapValue!13233)) b!353791))

(assert (= (and mapNonEmpty!13224 ((_ is ValueCellFull!3563) mapDefault!13233)) b!353792))

(declare-fun m!352483 () Bool)

(assert (=> mapNonEmpty!13233 m!352483))

(check-sat (not b!353782) (not b!353780) (not bm!27131) (not b!353781) (not bm!27128) (not b!353766) (not mapNonEmpty!13233) (not b!353769) tp_is_empty!7813)
(check-sat)
