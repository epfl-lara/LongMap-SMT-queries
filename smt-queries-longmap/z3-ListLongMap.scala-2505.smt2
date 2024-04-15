; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38834 () Bool)

(assert start!38834)

(declare-fun mapNonEmpty!17022 () Bool)

(declare-fun mapRes!17022 () Bool)

(declare-fun tp!33141 () Bool)

(declare-fun e!243738 () Bool)

(assert (=> mapNonEmpty!17022 (= mapRes!17022 (and tp!33141 e!243738))))

(declare-datatypes ((V!14795 0))(
  ( (V!14796 (val!5178 Int)) )
))
(declare-datatypes ((ValueCell!4790 0))(
  ( (ValueCellFull!4790 (v!7419 V!14795)) (EmptyCell!4790) )
))
(declare-fun mapRest!17022 () (Array (_ BitVec 32) ValueCell!4790))

(declare-datatypes ((array!24409 0))(
  ( (array!24410 (arr!11654 (Array (_ BitVec 32) ValueCell!4790)) (size!12007 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24409)

(declare-fun mapKey!17022 () (_ BitVec 32))

(declare-fun mapValue!17022 () ValueCell!4790)

(assert (=> mapNonEmpty!17022 (= (arr!11654 _values!549) (store mapRest!17022 mapKey!17022 mapValue!17022))))

(declare-fun b!405457 () Bool)

(declare-fun e!243733 () Bool)

(assert (=> b!405457 (= e!243733 false)))

(declare-fun lt!188147 () Bool)

(declare-datatypes ((array!24411 0))(
  ( (array!24412 (arr!11655 (Array (_ BitVec 32) (_ BitVec 64))) (size!12008 (_ BitVec 32))) )
))
(declare-fun lt!188146 () array!24411)

(declare-datatypes ((List!6751 0))(
  ( (Nil!6748) (Cons!6747 (h!7603 (_ BitVec 64)) (t!11916 List!6751)) )
))
(declare-fun arrayNoDuplicates!0 (array!24411 (_ BitVec 32) List!6751) Bool)

(assert (=> b!405457 (= lt!188147 (arrayNoDuplicates!0 lt!188146 #b00000000000000000000000000000000 Nil!6748))))

(declare-fun b!405458 () Bool)

(declare-fun e!243737 () Bool)

(assert (=> b!405458 (= e!243737 e!243733)))

(declare-fun res!234106 () Bool)

(assert (=> b!405458 (=> (not res!234106) (not e!243733))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24411 (_ BitVec 32)) Bool)

(assert (=> b!405458 (= res!234106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188146 mask!1025))))

(declare-fun _keys!709 () array!24411)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405458 (= lt!188146 (array!24412 (store (arr!11655 _keys!709) i!563 k0!794) (size!12008 _keys!709)))))

(declare-fun b!405459 () Bool)

(declare-fun res!234103 () Bool)

(assert (=> b!405459 (=> (not res!234103) (not e!243737))))

(assert (=> b!405459 (= res!234103 (or (= (select (arr!11655 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11655 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17022 () Bool)

(assert (=> mapIsEmpty!17022 mapRes!17022))

(declare-fun b!405460 () Bool)

(declare-fun e!243735 () Bool)

(declare-fun tp_is_empty!10267 () Bool)

(assert (=> b!405460 (= e!243735 tp_is_empty!10267)))

(declare-fun res!234105 () Bool)

(assert (=> start!38834 (=> (not res!234105) (not e!243737))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38834 (= res!234105 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12008 _keys!709))))))

(assert (=> start!38834 e!243737))

(assert (=> start!38834 true))

(declare-fun e!243734 () Bool)

(declare-fun array_inv!8552 (array!24409) Bool)

(assert (=> start!38834 (and (array_inv!8552 _values!549) e!243734)))

(declare-fun array_inv!8553 (array!24411) Bool)

(assert (=> start!38834 (array_inv!8553 _keys!709)))

(declare-fun b!405461 () Bool)

(declare-fun res!234099 () Bool)

(assert (=> b!405461 (=> (not res!234099) (not e!243737))))

(assert (=> b!405461 (= res!234099 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6748))))

(declare-fun b!405462 () Bool)

(declare-fun res!234108 () Bool)

(assert (=> b!405462 (=> (not res!234108) (not e!243737))))

(declare-fun arrayContainsKey!0 (array!24411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405462 (= res!234108 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!405463 () Bool)

(declare-fun res!234107 () Bool)

(assert (=> b!405463 (=> (not res!234107) (not e!243737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405463 (= res!234107 (validMask!0 mask!1025))))

(declare-fun b!405464 () Bool)

(declare-fun res!234104 () Bool)

(assert (=> b!405464 (=> (not res!234104) (not e!243737))))

(assert (=> b!405464 (= res!234104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405465 () Bool)

(declare-fun res!234101 () Bool)

(assert (=> b!405465 (=> (not res!234101) (not e!243737))))

(assert (=> b!405465 (= res!234101 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12008 _keys!709))))))

(declare-fun b!405466 () Bool)

(declare-fun res!234100 () Bool)

(assert (=> b!405466 (=> (not res!234100) (not e!243737))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405466 (= res!234100 (and (= (size!12007 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12008 _keys!709) (size!12007 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405467 () Bool)

(declare-fun res!234102 () Bool)

(assert (=> b!405467 (=> (not res!234102) (not e!243737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405467 (= res!234102 (validKeyInArray!0 k0!794))))

(declare-fun b!405468 () Bool)

(assert (=> b!405468 (= e!243734 (and e!243735 mapRes!17022))))

(declare-fun condMapEmpty!17022 () Bool)

(declare-fun mapDefault!17022 () ValueCell!4790)

(assert (=> b!405468 (= condMapEmpty!17022 (= (arr!11654 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4790)) mapDefault!17022)))))

(declare-fun b!405469 () Bool)

(assert (=> b!405469 (= e!243738 tp_is_empty!10267)))

(assert (= (and start!38834 res!234105) b!405463))

(assert (= (and b!405463 res!234107) b!405466))

(assert (= (and b!405466 res!234100) b!405464))

(assert (= (and b!405464 res!234104) b!405461))

(assert (= (and b!405461 res!234099) b!405465))

(assert (= (and b!405465 res!234101) b!405467))

(assert (= (and b!405467 res!234102) b!405459))

(assert (= (and b!405459 res!234103) b!405462))

(assert (= (and b!405462 res!234108) b!405458))

(assert (= (and b!405458 res!234106) b!405457))

(assert (= (and b!405468 condMapEmpty!17022) mapIsEmpty!17022))

(assert (= (and b!405468 (not condMapEmpty!17022)) mapNonEmpty!17022))

(get-info :version)

(assert (= (and mapNonEmpty!17022 ((_ is ValueCellFull!4790) mapValue!17022)) b!405469))

(assert (= (and b!405468 ((_ is ValueCellFull!4790) mapDefault!17022)) b!405460))

(assert (= start!38834 b!405468))

(declare-fun m!397347 () Bool)

(assert (=> b!405467 m!397347))

(declare-fun m!397349 () Bool)

(assert (=> b!405464 m!397349))

(declare-fun m!397351 () Bool)

(assert (=> start!38834 m!397351))

(declare-fun m!397353 () Bool)

(assert (=> start!38834 m!397353))

(declare-fun m!397355 () Bool)

(assert (=> mapNonEmpty!17022 m!397355))

(declare-fun m!397357 () Bool)

(assert (=> b!405463 m!397357))

(declare-fun m!397359 () Bool)

(assert (=> b!405461 m!397359))

(declare-fun m!397361 () Bool)

(assert (=> b!405462 m!397361))

(declare-fun m!397363 () Bool)

(assert (=> b!405457 m!397363))

(declare-fun m!397365 () Bool)

(assert (=> b!405459 m!397365))

(declare-fun m!397367 () Bool)

(assert (=> b!405458 m!397367))

(declare-fun m!397369 () Bool)

(assert (=> b!405458 m!397369))

(check-sat (not b!405463) (not b!405462) (not mapNonEmpty!17022) tp_is_empty!10267 (not b!405467) (not b!405458) (not b!405457) (not b!405464) (not start!38834) (not b!405461))
(check-sat)
