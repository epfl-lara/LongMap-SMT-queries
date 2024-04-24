; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40306 () Bool)

(assert start!40306)

(declare-fun b!442751 () Bool)

(declare-fun res!262292 () Bool)

(declare-fun e!260573 () Bool)

(assert (=> b!442751 (=> (not res!262292) (not e!260573))))

(declare-datatypes ((array!27252 0))(
  ( (array!27253 (arr!13074 (Array (_ BitVec 32) (_ BitVec 64))) (size!13426 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27252)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16731 0))(
  ( (V!16732 (val!5904 Int)) )
))
(declare-datatypes ((ValueCell!5516 0))(
  ( (ValueCellFull!5516 (v!8156 V!16731)) (EmptyCell!5516) )
))
(declare-datatypes ((array!27254 0))(
  ( (array!27255 (arr!13075 (Array (_ BitVec 32) ValueCell!5516)) (size!13427 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27254)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!442751 (= res!262292 (and (= (size!13427 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13426 _keys!709) (size!13427 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442752 () Bool)

(declare-fun res!262291 () Bool)

(assert (=> b!442752 (=> (not res!262291) (not e!260573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442752 (= res!262291 (validMask!0 mask!1025))))

(declare-fun b!442753 () Bool)

(declare-fun res!262287 () Bool)

(assert (=> b!442753 (=> (not res!262287) (not e!260573))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442753 (= res!262287 (validKeyInArray!0 k0!794))))

(declare-fun b!442754 () Bool)

(declare-fun res!262288 () Bool)

(assert (=> b!442754 (=> (not res!262288) (not e!260573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27252 (_ BitVec 32)) Bool)

(assert (=> b!442754 (= res!262288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19203 () Bool)

(declare-fun mapRes!19203 () Bool)

(assert (=> mapIsEmpty!19203 mapRes!19203))

(declare-fun b!442756 () Bool)

(declare-fun res!262289 () Bool)

(assert (=> b!442756 (=> (not res!262289) (not e!260573))))

(declare-fun arrayContainsKey!0 (array!27252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442756 (= res!262289 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!442757 () Bool)

(declare-fun res!262290 () Bool)

(assert (=> b!442757 (=> (not res!262290) (not e!260573))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442757 (= res!262290 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13426 _keys!709))))))

(declare-fun b!442758 () Bool)

(declare-fun e!260571 () Bool)

(declare-fun tp_is_empty!11719 () Bool)

(assert (=> b!442758 (= e!260571 tp_is_empty!11719)))

(declare-fun mapNonEmpty!19203 () Bool)

(declare-fun tp!37185 () Bool)

(assert (=> mapNonEmpty!19203 (= mapRes!19203 (and tp!37185 e!260571))))

(declare-fun mapValue!19203 () ValueCell!5516)

(declare-fun mapRest!19203 () (Array (_ BitVec 32) ValueCell!5516))

(declare-fun mapKey!19203 () (_ BitVec 32))

(assert (=> mapNonEmpty!19203 (= (arr!13075 _values!549) (store mapRest!19203 mapKey!19203 mapValue!19203))))

(declare-fun b!442759 () Bool)

(declare-fun e!260574 () Bool)

(declare-fun e!260572 () Bool)

(assert (=> b!442759 (= e!260574 (and e!260572 mapRes!19203))))

(declare-fun condMapEmpty!19203 () Bool)

(declare-fun mapDefault!19203 () ValueCell!5516)

(assert (=> b!442759 (= condMapEmpty!19203 (= (arr!13075 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5516)) mapDefault!19203)))))

(declare-fun b!442760 () Bool)

(declare-fun e!260576 () Bool)

(assert (=> b!442760 (= e!260576 false)))

(declare-fun lt!203265 () Bool)

(declare-fun lt!203264 () array!27252)

(declare-datatypes ((List!7748 0))(
  ( (Nil!7745) (Cons!7744 (h!8600 (_ BitVec 64)) (t!13498 List!7748)) )
))
(declare-fun arrayNoDuplicates!0 (array!27252 (_ BitVec 32) List!7748) Bool)

(assert (=> b!442760 (= lt!203265 (arrayNoDuplicates!0 lt!203264 #b00000000000000000000000000000000 Nil!7745))))

(declare-fun b!442761 () Bool)

(assert (=> b!442761 (= e!260572 tp_is_empty!11719)))

(declare-fun b!442755 () Bool)

(declare-fun res!262283 () Bool)

(assert (=> b!442755 (=> (not res!262283) (not e!260573))))

(assert (=> b!442755 (= res!262283 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7745))))

(declare-fun res!262286 () Bool)

(assert (=> start!40306 (=> (not res!262286) (not e!260573))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40306 (= res!262286 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13426 _keys!709))))))

(assert (=> start!40306 e!260573))

(assert (=> start!40306 true))

(declare-fun array_inv!9550 (array!27254) Bool)

(assert (=> start!40306 (and (array_inv!9550 _values!549) e!260574)))

(declare-fun array_inv!9551 (array!27252) Bool)

(assert (=> start!40306 (array_inv!9551 _keys!709)))

(declare-fun b!442762 () Bool)

(assert (=> b!442762 (= e!260573 e!260576)))

(declare-fun res!262285 () Bool)

(assert (=> b!442762 (=> (not res!262285) (not e!260576))))

(assert (=> b!442762 (= res!262285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203264 mask!1025))))

(assert (=> b!442762 (= lt!203264 (array!27253 (store (arr!13074 _keys!709) i!563 k0!794) (size!13426 _keys!709)))))

(declare-fun b!442763 () Bool)

(declare-fun res!262284 () Bool)

(assert (=> b!442763 (=> (not res!262284) (not e!260573))))

(assert (=> b!442763 (= res!262284 (or (= (select (arr!13074 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13074 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40306 res!262286) b!442752))

(assert (= (and b!442752 res!262291) b!442751))

(assert (= (and b!442751 res!262292) b!442754))

(assert (= (and b!442754 res!262288) b!442755))

(assert (= (and b!442755 res!262283) b!442757))

(assert (= (and b!442757 res!262290) b!442753))

(assert (= (and b!442753 res!262287) b!442763))

(assert (= (and b!442763 res!262284) b!442756))

(assert (= (and b!442756 res!262289) b!442762))

(assert (= (and b!442762 res!262285) b!442760))

(assert (= (and b!442759 condMapEmpty!19203) mapIsEmpty!19203))

(assert (= (and b!442759 (not condMapEmpty!19203)) mapNonEmpty!19203))

(get-info :version)

(assert (= (and mapNonEmpty!19203 ((_ is ValueCellFull!5516) mapValue!19203)) b!442758))

(assert (= (and b!442759 ((_ is ValueCellFull!5516) mapDefault!19203)) b!442761))

(assert (= start!40306 b!442759))

(declare-fun m!429531 () Bool)

(assert (=> b!442760 m!429531))

(declare-fun m!429533 () Bool)

(assert (=> b!442755 m!429533))

(declare-fun m!429535 () Bool)

(assert (=> b!442756 m!429535))

(declare-fun m!429537 () Bool)

(assert (=> b!442762 m!429537))

(declare-fun m!429539 () Bool)

(assert (=> b!442762 m!429539))

(declare-fun m!429541 () Bool)

(assert (=> start!40306 m!429541))

(declare-fun m!429543 () Bool)

(assert (=> start!40306 m!429543))

(declare-fun m!429545 () Bool)

(assert (=> b!442753 m!429545))

(declare-fun m!429547 () Bool)

(assert (=> b!442763 m!429547))

(declare-fun m!429549 () Bool)

(assert (=> mapNonEmpty!19203 m!429549))

(declare-fun m!429551 () Bool)

(assert (=> b!442754 m!429551))

(declare-fun m!429553 () Bool)

(assert (=> b!442752 m!429553))

(check-sat (not b!442762) (not b!442752) (not start!40306) tp_is_empty!11719 (not b!442753) (not b!442756) (not mapNonEmpty!19203) (not b!442755) (not b!442760) (not b!442754))
(check-sat)
