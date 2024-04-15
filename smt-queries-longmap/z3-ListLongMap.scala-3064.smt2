; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43212 () Bool)

(assert start!43212)

(declare-fun b!478749 () Bool)

(declare-fun res!285628 () Bool)

(declare-fun e!281586 () Bool)

(assert (=> b!478749 (=> (not res!285628) (not e!281586))))

(declare-datatypes ((array!30895 0))(
  ( (array!30896 (arr!14855 (Array (_ BitVec 32) (_ BitVec 64))) (size!15214 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30895)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30895 (_ BitVec 32)) Bool)

(assert (=> b!478749 (= res!285628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478750 () Bool)

(declare-fun e!281585 () Bool)

(declare-fun tp_is_empty!13615 () Bool)

(assert (=> b!478750 (= e!281585 tp_is_empty!13615)))

(declare-fun mapIsEmpty!22117 () Bool)

(declare-fun mapRes!22117 () Bool)

(assert (=> mapIsEmpty!22117 mapRes!22117))

(declare-fun mapNonEmpty!22117 () Bool)

(declare-fun tp!42592 () Bool)

(assert (=> mapNonEmpty!22117 (= mapRes!22117 (and tp!42592 e!281585))))

(declare-datatypes ((V!19225 0))(
  ( (V!19226 (val!6855 Int)) )
))
(declare-datatypes ((ValueCell!6446 0))(
  ( (ValueCellFull!6446 (v!9138 V!19225)) (EmptyCell!6446) )
))
(declare-fun mapRest!22117 () (Array (_ BitVec 32) ValueCell!6446))

(declare-fun mapKey!22117 () (_ BitVec 32))

(declare-fun mapValue!22117 () ValueCell!6446)

(declare-datatypes ((array!30897 0))(
  ( (array!30898 (arr!14856 (Array (_ BitVec 32) ValueCell!6446)) (size!15215 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30897)

(assert (=> mapNonEmpty!22117 (= (arr!14856 _values!1516) (store mapRest!22117 mapKey!22117 mapValue!22117))))

(declare-fun res!285629 () Bool)

(assert (=> start!43212 (=> (not res!285629) (not e!281586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43212 (= res!285629 (validMask!0 mask!2352))))

(assert (=> start!43212 e!281586))

(assert (=> start!43212 true))

(declare-fun e!281587 () Bool)

(declare-fun array_inv!10806 (array!30897) Bool)

(assert (=> start!43212 (and (array_inv!10806 _values!1516) e!281587)))

(declare-fun array_inv!10807 (array!30895) Bool)

(assert (=> start!43212 (array_inv!10807 _keys!1874)))

(declare-fun b!478751 () Bool)

(assert (=> b!478751 (= e!281586 false)))

(declare-fun lt!217573 () Bool)

(declare-datatypes ((List!9121 0))(
  ( (Nil!9118) (Cons!9117 (h!9973 (_ BitVec 64)) (t!15318 List!9121)) )
))
(declare-fun arrayNoDuplicates!0 (array!30895 (_ BitVec 32) List!9121) Bool)

(assert (=> b!478751 (= lt!217573 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9118))))

(declare-fun b!478752 () Bool)

(declare-fun e!281589 () Bool)

(assert (=> b!478752 (= e!281587 (and e!281589 mapRes!22117))))

(declare-fun condMapEmpty!22117 () Bool)

(declare-fun mapDefault!22117 () ValueCell!6446)

(assert (=> b!478752 (= condMapEmpty!22117 (= (arr!14856 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6446)) mapDefault!22117)))))

(declare-fun b!478753 () Bool)

(declare-fun res!285630 () Bool)

(assert (=> b!478753 (=> (not res!285630) (not e!281586))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478753 (= res!285630 (and (= (size!15215 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15214 _keys!1874) (size!15215 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478754 () Bool)

(assert (=> b!478754 (= e!281589 tp_is_empty!13615)))

(assert (= (and start!43212 res!285629) b!478753))

(assert (= (and b!478753 res!285630) b!478749))

(assert (= (and b!478749 res!285628) b!478751))

(assert (= (and b!478752 condMapEmpty!22117) mapIsEmpty!22117))

(assert (= (and b!478752 (not condMapEmpty!22117)) mapNonEmpty!22117))

(get-info :version)

(assert (= (and mapNonEmpty!22117 ((_ is ValueCellFull!6446) mapValue!22117)) b!478750))

(assert (= (and b!478752 ((_ is ValueCellFull!6446) mapDefault!22117)) b!478754))

(assert (= start!43212 b!478752))

(declare-fun m!460359 () Bool)

(assert (=> b!478749 m!460359))

(declare-fun m!460361 () Bool)

(assert (=> mapNonEmpty!22117 m!460361))

(declare-fun m!460363 () Bool)

(assert (=> start!43212 m!460363))

(declare-fun m!460365 () Bool)

(assert (=> start!43212 m!460365))

(declare-fun m!460367 () Bool)

(assert (=> start!43212 m!460367))

(declare-fun m!460369 () Bool)

(assert (=> b!478751 m!460369))

(check-sat (not mapNonEmpty!22117) (not b!478751) (not b!478749) tp_is_empty!13615 (not start!43212))
(check-sat)
