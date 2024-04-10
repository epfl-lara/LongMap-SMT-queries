; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38880 () Bool)

(assert start!38880)

(declare-fun b!406352 () Bool)

(declare-fun e!244195 () Bool)

(declare-fun e!244196 () Bool)

(assert (=> b!406352 (= e!244195 e!244196)))

(declare-fun res!234711 () Bool)

(assert (=> b!406352 (=> (not res!234711) (not e!244196))))

(declare-datatypes ((array!24489 0))(
  ( (array!24490 (arr!11694 (Array (_ BitVec 32) (_ BitVec 64))) (size!12046 (_ BitVec 32))) )
))
(declare-fun lt!188476 () array!24489)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24489 (_ BitVec 32)) Bool)

(assert (=> b!406352 (= res!234711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188476 mask!1025))))

(declare-fun _keys!709 () array!24489)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406352 (= lt!188476 (array!24490 (store (arr!11694 _keys!709) i!563 k0!794) (size!12046 _keys!709)))))

(declare-fun b!406353 () Bool)

(declare-fun e!244200 () Bool)

(declare-fun tp_is_empty!10299 () Bool)

(assert (=> b!406353 (= e!244200 tp_is_empty!10299)))

(declare-fun b!406354 () Bool)

(assert (=> b!406354 (= e!244196 false)))

(declare-fun lt!188477 () Bool)

(declare-datatypes ((List!6792 0))(
  ( (Nil!6789) (Cons!6788 (h!7644 (_ BitVec 64)) (t!11966 List!6792)) )
))
(declare-fun arrayNoDuplicates!0 (array!24489 (_ BitVec 32) List!6792) Bool)

(assert (=> b!406354 (= lt!188477 (arrayNoDuplicates!0 lt!188476 #b00000000000000000000000000000000 Nil!6789))))

(declare-fun mapIsEmpty!17070 () Bool)

(declare-fun mapRes!17070 () Bool)

(assert (=> mapIsEmpty!17070 mapRes!17070))

(declare-fun res!234713 () Bool)

(assert (=> start!38880 (=> (not res!234713) (not e!244195))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38880 (= res!234713 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12046 _keys!709))))))

(assert (=> start!38880 e!244195))

(assert (=> start!38880 true))

(declare-datatypes ((V!14837 0))(
  ( (V!14838 (val!5194 Int)) )
))
(declare-datatypes ((ValueCell!4806 0))(
  ( (ValueCellFull!4806 (v!7441 V!14837)) (EmptyCell!4806) )
))
(declare-datatypes ((array!24491 0))(
  ( (array!24492 (arr!11695 (Array (_ BitVec 32) ValueCell!4806)) (size!12047 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24491)

(declare-fun e!244198 () Bool)

(declare-fun array_inv!8540 (array!24491) Bool)

(assert (=> start!38880 (and (array_inv!8540 _values!549) e!244198)))

(declare-fun array_inv!8541 (array!24489) Bool)

(assert (=> start!38880 (array_inv!8541 _keys!709)))

(declare-fun b!406355 () Bool)

(declare-fun res!234714 () Bool)

(assert (=> b!406355 (=> (not res!234714) (not e!244195))))

(declare-fun arrayContainsKey!0 (array!24489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406355 (= res!234714 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406356 () Bool)

(declare-fun res!234717 () Bool)

(assert (=> b!406356 (=> (not res!234717) (not e!244195))))

(assert (=> b!406356 (= res!234717 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6789))))

(declare-fun b!406357 () Bool)

(declare-fun e!244199 () Bool)

(assert (=> b!406357 (= e!244199 tp_is_empty!10299)))

(declare-fun b!406358 () Bool)

(declare-fun res!234716 () Bool)

(assert (=> b!406358 (=> (not res!234716) (not e!244195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406358 (= res!234716 (validMask!0 mask!1025))))

(declare-fun b!406359 () Bool)

(declare-fun res!234710 () Bool)

(assert (=> b!406359 (=> (not res!234710) (not e!244195))))

(assert (=> b!406359 (= res!234710 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12046 _keys!709))))))

(declare-fun b!406360 () Bool)

(declare-fun res!234709 () Bool)

(assert (=> b!406360 (=> (not res!234709) (not e!244195))))

(assert (=> b!406360 (= res!234709 (or (= (select (arr!11694 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11694 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406361 () Bool)

(declare-fun res!234715 () Bool)

(assert (=> b!406361 (=> (not res!234715) (not e!244195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406361 (= res!234715 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!17070 () Bool)

(declare-fun tp!33189 () Bool)

(assert (=> mapNonEmpty!17070 (= mapRes!17070 (and tp!33189 e!244199))))

(declare-fun mapKey!17070 () (_ BitVec 32))

(declare-fun mapValue!17070 () ValueCell!4806)

(declare-fun mapRest!17070 () (Array (_ BitVec 32) ValueCell!4806))

(assert (=> mapNonEmpty!17070 (= (arr!11695 _values!549) (store mapRest!17070 mapKey!17070 mapValue!17070))))

(declare-fun b!406362 () Bool)

(assert (=> b!406362 (= e!244198 (and e!244200 mapRes!17070))))

(declare-fun condMapEmpty!17070 () Bool)

(declare-fun mapDefault!17070 () ValueCell!4806)

(assert (=> b!406362 (= condMapEmpty!17070 (= (arr!11695 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4806)) mapDefault!17070)))))

(declare-fun b!406363 () Bool)

(declare-fun res!234708 () Bool)

(assert (=> b!406363 (=> (not res!234708) (not e!244195))))

(assert (=> b!406363 (= res!234708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406364 () Bool)

(declare-fun res!234712 () Bool)

(assert (=> b!406364 (=> (not res!234712) (not e!244195))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406364 (= res!234712 (and (= (size!12047 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12046 _keys!709) (size!12047 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38880 res!234713) b!406358))

(assert (= (and b!406358 res!234716) b!406364))

(assert (= (and b!406364 res!234712) b!406363))

(assert (= (and b!406363 res!234708) b!406356))

(assert (= (and b!406356 res!234717) b!406359))

(assert (= (and b!406359 res!234710) b!406361))

(assert (= (and b!406361 res!234715) b!406360))

(assert (= (and b!406360 res!234709) b!406355))

(assert (= (and b!406355 res!234714) b!406352))

(assert (= (and b!406352 res!234711) b!406354))

(assert (= (and b!406362 condMapEmpty!17070) mapIsEmpty!17070))

(assert (= (and b!406362 (not condMapEmpty!17070)) mapNonEmpty!17070))

(get-info :version)

(assert (= (and mapNonEmpty!17070 ((_ is ValueCellFull!4806) mapValue!17070)) b!406357))

(assert (= (and b!406362 ((_ is ValueCellFull!4806) mapDefault!17070)) b!406353))

(assert (= start!38880 b!406362))

(declare-fun m!398455 () Bool)

(assert (=> b!406360 m!398455))

(declare-fun m!398457 () Bool)

(assert (=> b!406354 m!398457))

(declare-fun m!398459 () Bool)

(assert (=> b!406358 m!398459))

(declare-fun m!398461 () Bool)

(assert (=> start!38880 m!398461))

(declare-fun m!398463 () Bool)

(assert (=> start!38880 m!398463))

(declare-fun m!398465 () Bool)

(assert (=> b!406361 m!398465))

(declare-fun m!398467 () Bool)

(assert (=> b!406356 m!398467))

(declare-fun m!398469 () Bool)

(assert (=> b!406355 m!398469))

(declare-fun m!398471 () Bool)

(assert (=> mapNonEmpty!17070 m!398471))

(declare-fun m!398473 () Bool)

(assert (=> b!406363 m!398473))

(declare-fun m!398475 () Bool)

(assert (=> b!406352 m!398475))

(declare-fun m!398477 () Bool)

(assert (=> b!406352 m!398477))

(check-sat (not b!406354) tp_is_empty!10299 (not b!406355) (not b!406363) (not mapNonEmpty!17070) (not b!406356) (not b!406352) (not b!406361) (not b!406358) (not start!38880))
(check-sat)
