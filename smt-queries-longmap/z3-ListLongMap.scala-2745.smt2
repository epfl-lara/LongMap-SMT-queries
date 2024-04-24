; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40294 () Bool)

(assert start!40294)

(declare-fun b!442568 () Bool)

(declare-fun e!260482 () Bool)

(declare-fun e!260480 () Bool)

(declare-fun mapRes!19185 () Bool)

(assert (=> b!442568 (= e!260482 (and e!260480 mapRes!19185))))

(declare-fun condMapEmpty!19185 () Bool)

(declare-datatypes ((V!16715 0))(
  ( (V!16716 (val!5898 Int)) )
))
(declare-datatypes ((ValueCell!5510 0))(
  ( (ValueCellFull!5510 (v!8150 V!16715)) (EmptyCell!5510) )
))
(declare-datatypes ((array!27230 0))(
  ( (array!27231 (arr!13063 (Array (_ BitVec 32) ValueCell!5510)) (size!13415 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27230)

(declare-fun mapDefault!19185 () ValueCell!5510)

(assert (=> b!442568 (= condMapEmpty!19185 (= (arr!13063 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5510)) mapDefault!19185)))))

(declare-fun b!442569 () Bool)

(declare-fun res!262155 () Bool)

(declare-fun e!260479 () Bool)

(assert (=> b!442569 (=> (not res!262155) (not e!260479))))

(declare-datatypes ((array!27232 0))(
  ( (array!27233 (arr!13064 (Array (_ BitVec 32) (_ BitVec 64))) (size!13416 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27232)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27232 (_ BitVec 32)) Bool)

(assert (=> b!442569 (= res!262155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442570 () Bool)

(declare-fun e!260481 () Bool)

(declare-fun tp_is_empty!11707 () Bool)

(assert (=> b!442570 (= e!260481 tp_is_empty!11707)))

(declare-fun b!442571 () Bool)

(declare-fun res!262154 () Bool)

(assert (=> b!442571 (=> (not res!262154) (not e!260479))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!442571 (= res!262154 (and (= (size!13415 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13416 _keys!709) (size!13415 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442572 () Bool)

(assert (=> b!442572 (= e!260480 tp_is_empty!11707)))

(declare-fun mapIsEmpty!19185 () Bool)

(assert (=> mapIsEmpty!19185 mapRes!19185))

(declare-fun res!262157 () Bool)

(assert (=> start!40294 (=> (not res!262157) (not e!260479))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40294 (= res!262157 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13416 _keys!709))))))

(assert (=> start!40294 e!260479))

(assert (=> start!40294 true))

(declare-fun array_inv!9544 (array!27230) Bool)

(assert (=> start!40294 (and (array_inv!9544 _values!549) e!260482)))

(declare-fun array_inv!9545 (array!27232) Bool)

(assert (=> start!40294 (array_inv!9545 _keys!709)))

(declare-fun b!442573 () Bool)

(declare-fun res!262156 () Bool)

(assert (=> b!442573 (=> (not res!262156) (not e!260479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442573 (= res!262156 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19185 () Bool)

(declare-fun tp!37167 () Bool)

(assert (=> mapNonEmpty!19185 (= mapRes!19185 (and tp!37167 e!260481))))

(declare-fun mapKey!19185 () (_ BitVec 32))

(declare-fun mapValue!19185 () ValueCell!5510)

(declare-fun mapRest!19185 () (Array (_ BitVec 32) ValueCell!5510))

(assert (=> mapNonEmpty!19185 (= (arr!13063 _values!549) (store mapRest!19185 mapKey!19185 mapValue!19185))))

(declare-fun b!442574 () Bool)

(assert (=> b!442574 (= e!260479 false)))

(declare-fun lt!203244 () Bool)

(declare-datatypes ((List!7743 0))(
  ( (Nil!7740) (Cons!7739 (h!8595 (_ BitVec 64)) (t!13493 List!7743)) )
))
(declare-fun arrayNoDuplicates!0 (array!27232 (_ BitVec 32) List!7743) Bool)

(assert (=> b!442574 (= lt!203244 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7740))))

(assert (= (and start!40294 res!262157) b!442573))

(assert (= (and b!442573 res!262156) b!442571))

(assert (= (and b!442571 res!262154) b!442569))

(assert (= (and b!442569 res!262155) b!442574))

(assert (= (and b!442568 condMapEmpty!19185) mapIsEmpty!19185))

(assert (= (and b!442568 (not condMapEmpty!19185)) mapNonEmpty!19185))

(get-info :version)

(assert (= (and mapNonEmpty!19185 ((_ is ValueCellFull!5510) mapValue!19185)) b!442570))

(assert (= (and b!442568 ((_ is ValueCellFull!5510) mapDefault!19185)) b!442572))

(assert (= start!40294 b!442568))

(declare-fun m!429429 () Bool)

(assert (=> b!442573 m!429429))

(declare-fun m!429431 () Bool)

(assert (=> b!442569 m!429431))

(declare-fun m!429433 () Bool)

(assert (=> b!442574 m!429433))

(declare-fun m!429435 () Bool)

(assert (=> start!40294 m!429435))

(declare-fun m!429437 () Bool)

(assert (=> start!40294 m!429437))

(declare-fun m!429439 () Bool)

(assert (=> mapNonEmpty!19185 m!429439))

(check-sat (not b!442573) (not b!442574) (not b!442569) (not mapNonEmpty!19185) (not start!40294) tp_is_empty!11707)
(check-sat)
