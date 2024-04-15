; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38426 () Bool)

(assert start!38426)

(declare-fun b!396205 () Bool)

(declare-fun res!227337 () Bool)

(declare-fun e!239737 () Bool)

(assert (=> b!396205 (=> (not res!227337) (not e!239737))))

(declare-datatypes ((array!23617 0))(
  ( (array!23618 (arr!11258 (Array (_ BitVec 32) (_ BitVec 64))) (size!11611 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23617)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23617 (_ BitVec 32)) Bool)

(assert (=> b!396205 (= res!227337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396206 () Bool)

(declare-fun e!239738 () Bool)

(assert (=> b!396206 (= e!239738 false)))

(declare-fun lt!186923 () Bool)

(declare-fun lt!186922 () array!23617)

(declare-datatypes ((List!6488 0))(
  ( (Nil!6485) (Cons!6484 (h!7340 (_ BitVec 64)) (t!11653 List!6488)) )
))
(declare-fun arrayNoDuplicates!0 (array!23617 (_ BitVec 32) List!6488) Bool)

(assert (=> b!396206 (= lt!186923 (arrayNoDuplicates!0 lt!186922 #b00000000000000000000000000000000 Nil!6485))))

(declare-fun b!396207 () Bool)

(declare-fun res!227336 () Bool)

(assert (=> b!396207 (=> (not res!227336) (not e!239737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396207 (= res!227336 (validMask!0 mask!1025))))

(declare-fun b!396208 () Bool)

(declare-fun e!239742 () Bool)

(declare-fun tp_is_empty!9859 () Bool)

(assert (=> b!396208 (= e!239742 tp_is_empty!9859)))

(declare-fun b!396209 () Bool)

(declare-fun res!227340 () Bool)

(assert (=> b!396209 (=> (not res!227340) (not e!239737))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396209 (= res!227340 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16410 () Bool)

(declare-fun mapRes!16410 () Bool)

(declare-fun tp!32205 () Bool)

(declare-fun e!239741 () Bool)

(assert (=> mapNonEmpty!16410 (= mapRes!16410 (and tp!32205 e!239741))))

(declare-datatypes ((V!14251 0))(
  ( (V!14252 (val!4974 Int)) )
))
(declare-datatypes ((ValueCell!4586 0))(
  ( (ValueCellFull!4586 (v!7215 V!14251)) (EmptyCell!4586) )
))
(declare-datatypes ((array!23619 0))(
  ( (array!23620 (arr!11259 (Array (_ BitVec 32) ValueCell!4586)) (size!11612 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23619)

(declare-fun mapRest!16410 () (Array (_ BitVec 32) ValueCell!4586))

(declare-fun mapValue!16410 () ValueCell!4586)

(declare-fun mapKey!16410 () (_ BitVec 32))

(assert (=> mapNonEmpty!16410 (= (arr!11259 _values!549) (store mapRest!16410 mapKey!16410 mapValue!16410))))

(declare-fun res!227331 () Bool)

(assert (=> start!38426 (=> (not res!227331) (not e!239737))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38426 (= res!227331 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11611 _keys!709))))))

(assert (=> start!38426 e!239737))

(assert (=> start!38426 true))

(declare-fun e!239740 () Bool)

(declare-fun array_inv!8260 (array!23619) Bool)

(assert (=> start!38426 (and (array_inv!8260 _values!549) e!239740)))

(declare-fun array_inv!8261 (array!23617) Bool)

(assert (=> start!38426 (array_inv!8261 _keys!709)))

(declare-fun b!396210 () Bool)

(declare-fun res!227333 () Bool)

(assert (=> b!396210 (=> (not res!227333) (not e!239737))))

(assert (=> b!396210 (= res!227333 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6485))))

(declare-fun mapIsEmpty!16410 () Bool)

(assert (=> mapIsEmpty!16410 mapRes!16410))

(declare-fun b!396211 () Bool)

(declare-fun res!227338 () Bool)

(assert (=> b!396211 (=> (not res!227338) (not e!239737))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396211 (= res!227338 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11611 _keys!709))))))

(declare-fun b!396212 () Bool)

(assert (=> b!396212 (= e!239740 (and e!239742 mapRes!16410))))

(declare-fun condMapEmpty!16410 () Bool)

(declare-fun mapDefault!16410 () ValueCell!4586)

(assert (=> b!396212 (= condMapEmpty!16410 (= (arr!11259 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4586)) mapDefault!16410)))))

(declare-fun b!396213 () Bool)

(declare-fun res!227332 () Bool)

(assert (=> b!396213 (=> (not res!227332) (not e!239737))))

(assert (=> b!396213 (= res!227332 (or (= (select (arr!11258 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11258 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396214 () Bool)

(declare-fun res!227334 () Bool)

(assert (=> b!396214 (=> (not res!227334) (not e!239737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396214 (= res!227334 (validKeyInArray!0 k0!794))))

(declare-fun b!396215 () Bool)

(declare-fun res!227339 () Bool)

(assert (=> b!396215 (=> (not res!227339) (not e!239737))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396215 (= res!227339 (and (= (size!11612 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11611 _keys!709) (size!11612 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396216 () Bool)

(assert (=> b!396216 (= e!239737 e!239738)))

(declare-fun res!227335 () Bool)

(assert (=> b!396216 (=> (not res!227335) (not e!239738))))

(assert (=> b!396216 (= res!227335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186922 mask!1025))))

(assert (=> b!396216 (= lt!186922 (array!23618 (store (arr!11258 _keys!709) i!563 k0!794) (size!11611 _keys!709)))))

(declare-fun b!396217 () Bool)

(assert (=> b!396217 (= e!239741 tp_is_empty!9859)))

(assert (= (and start!38426 res!227331) b!396207))

(assert (= (and b!396207 res!227336) b!396215))

(assert (= (and b!396215 res!227339) b!396205))

(assert (= (and b!396205 res!227337) b!396210))

(assert (= (and b!396210 res!227333) b!396211))

(assert (= (and b!396211 res!227338) b!396214))

(assert (= (and b!396214 res!227334) b!396213))

(assert (= (and b!396213 res!227332) b!396209))

(assert (= (and b!396209 res!227340) b!396216))

(assert (= (and b!396216 res!227335) b!396206))

(assert (= (and b!396212 condMapEmpty!16410) mapIsEmpty!16410))

(assert (= (and b!396212 (not condMapEmpty!16410)) mapNonEmpty!16410))

(get-info :version)

(assert (= (and mapNonEmpty!16410 ((_ is ValueCellFull!4586) mapValue!16410)) b!396217))

(assert (= (and b!396212 ((_ is ValueCellFull!4586) mapDefault!16410)) b!396208))

(assert (= start!38426 b!396212))

(declare-fun m!391371 () Bool)

(assert (=> b!396210 m!391371))

(declare-fun m!391373 () Bool)

(assert (=> start!38426 m!391373))

(declare-fun m!391375 () Bool)

(assert (=> start!38426 m!391375))

(declare-fun m!391377 () Bool)

(assert (=> mapNonEmpty!16410 m!391377))

(declare-fun m!391379 () Bool)

(assert (=> b!396207 m!391379))

(declare-fun m!391381 () Bool)

(assert (=> b!396206 m!391381))

(declare-fun m!391383 () Bool)

(assert (=> b!396209 m!391383))

(declare-fun m!391385 () Bool)

(assert (=> b!396205 m!391385))

(declare-fun m!391387 () Bool)

(assert (=> b!396213 m!391387))

(declare-fun m!391389 () Bool)

(assert (=> b!396214 m!391389))

(declare-fun m!391391 () Bool)

(assert (=> b!396216 m!391391))

(declare-fun m!391393 () Bool)

(assert (=> b!396216 m!391393))

(check-sat (not mapNonEmpty!16410) (not b!396209) (not b!396207) (not b!396210) (not b!396214) (not b!396216) (not b!396205) (not b!396206) (not start!38426) tp_is_empty!9859)
(check-sat)
