; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40420 () Bool)

(assert start!40420)

(declare-fun b!444536 () Bool)

(declare-fun res!263613 () Bool)

(declare-fun e!261418 () Bool)

(assert (=> b!444536 (=> (not res!263613) (not e!261418))))

(declare-datatypes ((array!27419 0))(
  ( (array!27420 (arr!13157 (Array (_ BitVec 32) (_ BitVec 64))) (size!13509 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27419)

(declare-datatypes ((List!7875 0))(
  ( (Nil!7872) (Cons!7871 (h!8727 (_ BitVec 64)) (t!13633 List!7875)) )
))
(declare-fun arrayNoDuplicates!0 (array!27419 (_ BitVec 32) List!7875) Bool)

(assert (=> b!444536 (= res!263613 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7872))))

(declare-fun b!444537 () Bool)

(declare-fun res!263620 () Bool)

(assert (=> b!444537 (=> (not res!263620) (not e!261418))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444537 (= res!263620 (or (= (select (arr!13157 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13157 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19335 () Bool)

(declare-fun mapRes!19335 () Bool)

(assert (=> mapIsEmpty!19335 mapRes!19335))

(declare-fun b!444538 () Bool)

(declare-fun res!263618 () Bool)

(assert (=> b!444538 (=> (not res!263618) (not e!261418))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16845 0))(
  ( (V!16846 (val!5947 Int)) )
))
(declare-datatypes ((ValueCell!5559 0))(
  ( (ValueCellFull!5559 (v!8198 V!16845)) (EmptyCell!5559) )
))
(declare-datatypes ((array!27421 0))(
  ( (array!27422 (arr!13158 (Array (_ BitVec 32) ValueCell!5559)) (size!13510 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27421)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!444538 (= res!263618 (and (= (size!13510 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13509 _keys!709) (size!13510 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444539 () Bool)

(declare-fun e!261422 () Bool)

(declare-fun e!261420 () Bool)

(assert (=> b!444539 (= e!261422 (and e!261420 mapRes!19335))))

(declare-fun condMapEmpty!19335 () Bool)

(declare-fun mapDefault!19335 () ValueCell!5559)

(assert (=> b!444539 (= condMapEmpty!19335 (= (arr!13158 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5559)) mapDefault!19335)))))

(declare-fun res!263619 () Bool)

(assert (=> start!40420 (=> (not res!263619) (not e!261418))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40420 (= res!263619 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13509 _keys!709))))))

(assert (=> start!40420 e!261418))

(assert (=> start!40420 true))

(declare-fun array_inv!9544 (array!27421) Bool)

(assert (=> start!40420 (and (array_inv!9544 _values!549) e!261422)))

(declare-fun array_inv!9545 (array!27419) Bool)

(assert (=> start!40420 (array_inv!9545 _keys!709)))

(declare-fun b!444540 () Bool)

(declare-fun res!263614 () Bool)

(assert (=> b!444540 (=> (not res!263614) (not e!261418))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444540 (= res!263614 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444541 () Bool)

(declare-fun res!263617 () Bool)

(assert (=> b!444541 (=> (not res!263617) (not e!261418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444541 (= res!263617 (validMask!0 mask!1025))))

(declare-fun b!444542 () Bool)

(declare-fun res!263615 () Bool)

(assert (=> b!444542 (=> (not res!263615) (not e!261418))))

(assert (=> b!444542 (= res!263615 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13509 _keys!709))))))

(declare-fun b!444543 () Bool)

(declare-fun res!263612 () Bool)

(assert (=> b!444543 (=> (not res!263612) (not e!261418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27419 (_ BitVec 32)) Bool)

(assert (=> b!444543 (= res!263612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19335 () Bool)

(declare-fun tp!37317 () Bool)

(declare-fun e!261421 () Bool)

(assert (=> mapNonEmpty!19335 (= mapRes!19335 (and tp!37317 e!261421))))

(declare-fun mapValue!19335 () ValueCell!5559)

(declare-fun mapRest!19335 () (Array (_ BitVec 32) ValueCell!5559))

(declare-fun mapKey!19335 () (_ BitVec 32))

(assert (=> mapNonEmpty!19335 (= (arr!13158 _values!549) (store mapRest!19335 mapKey!19335 mapValue!19335))))

(declare-fun b!444544 () Bool)

(declare-fun tp_is_empty!11805 () Bool)

(assert (=> b!444544 (= e!261421 tp_is_empty!11805)))

(declare-fun b!444545 () Bool)

(declare-fun res!263616 () Bool)

(assert (=> b!444545 (=> (not res!263616) (not e!261418))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444545 (= res!263616 (validKeyInArray!0 k0!794))))

(declare-fun b!444546 () Bool)

(assert (=> b!444546 (= e!261420 tp_is_empty!11805)))

(declare-fun b!444547 () Bool)

(declare-fun e!261419 () Bool)

(assert (=> b!444547 (= e!261418 e!261419)))

(declare-fun res!263611 () Bool)

(assert (=> b!444547 (=> (not res!263611) (not e!261419))))

(declare-fun lt!203507 () array!27419)

(assert (=> b!444547 (= res!263611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203507 mask!1025))))

(assert (=> b!444547 (= lt!203507 (array!27420 (store (arr!13157 _keys!709) i!563 k0!794) (size!13509 _keys!709)))))

(declare-fun b!444548 () Bool)

(assert (=> b!444548 (= e!261419 false)))

(declare-fun lt!203506 () Bool)

(assert (=> b!444548 (= lt!203506 (arrayNoDuplicates!0 lt!203507 #b00000000000000000000000000000000 Nil!7872))))

(assert (= (and start!40420 res!263619) b!444541))

(assert (= (and b!444541 res!263617) b!444538))

(assert (= (and b!444538 res!263618) b!444543))

(assert (= (and b!444543 res!263612) b!444536))

(assert (= (and b!444536 res!263613) b!444542))

(assert (= (and b!444542 res!263615) b!444545))

(assert (= (and b!444545 res!263616) b!444537))

(assert (= (and b!444537 res!263620) b!444540))

(assert (= (and b!444540 res!263614) b!444547))

(assert (= (and b!444547 res!263611) b!444548))

(assert (= (and b!444539 condMapEmpty!19335) mapIsEmpty!19335))

(assert (= (and b!444539 (not condMapEmpty!19335)) mapNonEmpty!19335))

(get-info :version)

(assert (= (and mapNonEmpty!19335 ((_ is ValueCellFull!5559) mapValue!19335)) b!444544))

(assert (= (and b!444539 ((_ is ValueCellFull!5559) mapDefault!19335)) b!444546))

(assert (= start!40420 b!444539))

(declare-fun m!430381 () Bool)

(assert (=> b!444545 m!430381))

(declare-fun m!430383 () Bool)

(assert (=> mapNonEmpty!19335 m!430383))

(declare-fun m!430385 () Bool)

(assert (=> start!40420 m!430385))

(declare-fun m!430387 () Bool)

(assert (=> start!40420 m!430387))

(declare-fun m!430389 () Bool)

(assert (=> b!444537 m!430389))

(declare-fun m!430391 () Bool)

(assert (=> b!444540 m!430391))

(declare-fun m!430393 () Bool)

(assert (=> b!444536 m!430393))

(declare-fun m!430395 () Bool)

(assert (=> b!444543 m!430395))

(declare-fun m!430397 () Bool)

(assert (=> b!444547 m!430397))

(declare-fun m!430399 () Bool)

(assert (=> b!444547 m!430399))

(declare-fun m!430401 () Bool)

(assert (=> b!444548 m!430401))

(declare-fun m!430403 () Bool)

(assert (=> b!444541 m!430403))

(check-sat (not b!444545) (not start!40420) (not b!444547) (not b!444536) (not b!444541) (not b!444540) (not b!444543) tp_is_empty!11805 (not mapNonEmpty!19335) (not b!444548))
(check-sat)
