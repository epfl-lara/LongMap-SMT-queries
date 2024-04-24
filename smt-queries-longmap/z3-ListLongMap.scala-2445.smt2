; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38474 () Bool)

(assert start!38474)

(declare-fun b!397363 () Bool)

(declare-fun e!240315 () Bool)

(declare-fun e!240313 () Bool)

(assert (=> b!397363 (= e!240315 e!240313)))

(declare-fun res!228177 () Bool)

(assert (=> b!397363 (=> (not res!228177) (not e!240313))))

(declare-datatypes ((array!23712 0))(
  ( (array!23713 (arr!11305 (Array (_ BitVec 32) (_ BitVec 64))) (size!11657 (_ BitVec 32))) )
))
(declare-fun lt!187319 () array!23712)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23712 (_ BitVec 32)) Bool)

(assert (=> b!397363 (= res!228177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187319 mask!1025))))

(declare-fun _keys!709 () array!23712)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!397363 (= lt!187319 (array!23713 (store (arr!11305 _keys!709) i!563 k0!794) (size!11657 _keys!709)))))

(declare-fun b!397364 () Bool)

(declare-fun res!228182 () Bool)

(assert (=> b!397364 (=> (not res!228182) (not e!240315))))

(declare-fun arrayContainsKey!0 (array!23712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397364 (= res!228182 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16482 () Bool)

(declare-fun mapRes!16482 () Bool)

(declare-fun tp!32277 () Bool)

(declare-fun e!240316 () Bool)

(assert (=> mapNonEmpty!16482 (= mapRes!16482 (and tp!32277 e!240316))))

(declare-datatypes ((V!14315 0))(
  ( (V!14316 (val!4998 Int)) )
))
(declare-datatypes ((ValueCell!4610 0))(
  ( (ValueCellFull!4610 (v!7246 V!14315)) (EmptyCell!4610) )
))
(declare-fun mapRest!16482 () (Array (_ BitVec 32) ValueCell!4610))

(declare-fun mapValue!16482 () ValueCell!4610)

(declare-datatypes ((array!23714 0))(
  ( (array!23715 (arr!11306 (Array (_ BitVec 32) ValueCell!4610)) (size!11658 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23714)

(declare-fun mapKey!16482 () (_ BitVec 32))

(assert (=> mapNonEmpty!16482 (= (arr!11306 _values!549) (store mapRest!16482 mapKey!16482 mapValue!16482))))

(declare-fun b!397366 () Bool)

(declare-fun res!228179 () Bool)

(assert (=> b!397366 (=> (not res!228179) (not e!240315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397366 (= res!228179 (validKeyInArray!0 k0!794))))

(declare-fun b!397367 () Bool)

(declare-fun res!228183 () Bool)

(assert (=> b!397367 (=> (not res!228183) (not e!240315))))

(assert (=> b!397367 (= res!228183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397368 () Bool)

(declare-fun res!228178 () Bool)

(assert (=> b!397368 (=> (not res!228178) (not e!240315))))

(assert (=> b!397368 (= res!228178 (or (= (select (arr!11305 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11305 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397369 () Bool)

(declare-fun e!240311 () Bool)

(declare-fun tp_is_empty!9907 () Bool)

(assert (=> b!397369 (= e!240311 tp_is_empty!9907)))

(declare-fun b!397370 () Bool)

(declare-fun res!228186 () Bool)

(assert (=> b!397370 (=> (not res!228186) (not e!240315))))

(declare-datatypes ((List!6413 0))(
  ( (Nil!6410) (Cons!6409 (h!7265 (_ BitVec 64)) (t!11579 List!6413)) )
))
(declare-fun arrayNoDuplicates!0 (array!23712 (_ BitVec 32) List!6413) Bool)

(assert (=> b!397370 (= res!228186 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6410))))

(declare-fun b!397371 () Bool)

(declare-fun res!228181 () Bool)

(assert (=> b!397371 (=> (not res!228181) (not e!240315))))

(assert (=> b!397371 (= res!228181 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11657 _keys!709))))))

(declare-fun b!397372 () Bool)

(declare-fun e!240314 () Bool)

(assert (=> b!397372 (= e!240314 (and e!240311 mapRes!16482))))

(declare-fun condMapEmpty!16482 () Bool)

(declare-fun mapDefault!16482 () ValueCell!4610)

(assert (=> b!397372 (= condMapEmpty!16482 (= (arr!11306 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4610)) mapDefault!16482)))))

(declare-fun res!228185 () Bool)

(assert (=> start!38474 (=> (not res!228185) (not e!240315))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38474 (= res!228185 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11657 _keys!709))))))

(assert (=> start!38474 e!240315))

(assert (=> start!38474 true))

(declare-fun array_inv!8354 (array!23714) Bool)

(assert (=> start!38474 (and (array_inv!8354 _values!549) e!240314)))

(declare-fun array_inv!8355 (array!23712) Bool)

(assert (=> start!38474 (array_inv!8355 _keys!709)))

(declare-fun b!397365 () Bool)

(declare-fun res!228184 () Bool)

(assert (=> b!397365 (=> (not res!228184) (not e!240315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397365 (= res!228184 (validMask!0 mask!1025))))

(declare-fun b!397373 () Bool)

(assert (=> b!397373 (= e!240313 false)))

(declare-fun lt!187320 () Bool)

(assert (=> b!397373 (= lt!187320 (arrayNoDuplicates!0 lt!187319 #b00000000000000000000000000000000 Nil!6410))))

(declare-fun b!397374 () Bool)

(assert (=> b!397374 (= e!240316 tp_is_empty!9907)))

(declare-fun mapIsEmpty!16482 () Bool)

(assert (=> mapIsEmpty!16482 mapRes!16482))

(declare-fun b!397375 () Bool)

(declare-fun res!228180 () Bool)

(assert (=> b!397375 (=> (not res!228180) (not e!240315))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397375 (= res!228180 (and (= (size!11658 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11657 _keys!709) (size!11658 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38474 res!228185) b!397365))

(assert (= (and b!397365 res!228184) b!397375))

(assert (= (and b!397375 res!228180) b!397367))

(assert (= (and b!397367 res!228183) b!397370))

(assert (= (and b!397370 res!228186) b!397371))

(assert (= (and b!397371 res!228181) b!397366))

(assert (= (and b!397366 res!228179) b!397368))

(assert (= (and b!397368 res!228178) b!397364))

(assert (= (and b!397364 res!228182) b!397363))

(assert (= (and b!397363 res!228177) b!397373))

(assert (= (and b!397372 condMapEmpty!16482) mapIsEmpty!16482))

(assert (= (and b!397372 (not condMapEmpty!16482)) mapNonEmpty!16482))

(get-info :version)

(assert (= (and mapNonEmpty!16482 ((_ is ValueCellFull!4610) mapValue!16482)) b!397374))

(assert (= (and b!397372 ((_ is ValueCellFull!4610) mapDefault!16482)) b!397369))

(assert (= start!38474 b!397372))

(declare-fun m!392901 () Bool)

(assert (=> b!397370 m!392901))

(declare-fun m!392903 () Bool)

(assert (=> b!397367 m!392903))

(declare-fun m!392905 () Bool)

(assert (=> b!397368 m!392905))

(declare-fun m!392907 () Bool)

(assert (=> mapNonEmpty!16482 m!392907))

(declare-fun m!392909 () Bool)

(assert (=> b!397366 m!392909))

(declare-fun m!392911 () Bool)

(assert (=> b!397364 m!392911))

(declare-fun m!392913 () Bool)

(assert (=> b!397363 m!392913))

(declare-fun m!392915 () Bool)

(assert (=> b!397363 m!392915))

(declare-fun m!392917 () Bool)

(assert (=> start!38474 m!392917))

(declare-fun m!392919 () Bool)

(assert (=> start!38474 m!392919))

(declare-fun m!392921 () Bool)

(assert (=> b!397373 m!392921))

(declare-fun m!392923 () Bool)

(assert (=> b!397365 m!392923))

(check-sat (not b!397366) (not b!397365) tp_is_empty!9907 (not b!397370) (not b!397364) (not b!397367) (not b!397373) (not start!38474) (not mapNonEmpty!16482) (not b!397363))
(check-sat)
