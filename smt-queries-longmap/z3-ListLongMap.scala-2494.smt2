; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38784 () Bool)

(assert start!38784)

(declare-fun b!404480 () Bool)

(declare-fun e!243333 () Bool)

(assert (=> b!404480 (= e!243333 false)))

(declare-fun lt!188189 () Bool)

(declare-datatypes ((array!24301 0))(
  ( (array!24302 (arr!11600 (Array (_ BitVec 32) (_ BitVec 64))) (size!11952 (_ BitVec 32))) )
))
(declare-fun lt!188188 () array!24301)

(declare-datatypes ((List!6753 0))(
  ( (Nil!6750) (Cons!6749 (h!7605 (_ BitVec 64)) (t!11927 List!6753)) )
))
(declare-fun arrayNoDuplicates!0 (array!24301 (_ BitVec 32) List!6753) Bool)

(assert (=> b!404480 (= lt!188189 (arrayNoDuplicates!0 lt!188188 #b00000000000000000000000000000000 Nil!6750))))

(declare-fun b!404481 () Bool)

(declare-fun res!233271 () Bool)

(declare-fun e!243335 () Bool)

(assert (=> b!404481 (=> (not res!233271) (not e!243335))))

(declare-fun _keys!709 () array!24301)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404481 (= res!233271 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404482 () Bool)

(declare-fun res!233268 () Bool)

(assert (=> b!404482 (=> (not res!233268) (not e!243335))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14709 0))(
  ( (V!14710 (val!5146 Int)) )
))
(declare-datatypes ((ValueCell!4758 0))(
  ( (ValueCellFull!4758 (v!7393 V!14709)) (EmptyCell!4758) )
))
(declare-datatypes ((array!24303 0))(
  ( (array!24304 (arr!11601 (Array (_ BitVec 32) ValueCell!4758)) (size!11953 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24303)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!404482 (= res!233268 (and (= (size!11953 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11952 _keys!709) (size!11953 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16926 () Bool)

(declare-fun mapRes!16926 () Bool)

(assert (=> mapIsEmpty!16926 mapRes!16926))

(declare-fun b!404484 () Bool)

(declare-fun res!233277 () Bool)

(assert (=> b!404484 (=> (not res!233277) (not e!243335))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404484 (= res!233277 (or (= (select (arr!11600 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11600 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404485 () Bool)

(declare-fun res!233273 () Bool)

(assert (=> b!404485 (=> (not res!233273) (not e!243335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24301 (_ BitVec 32)) Bool)

(assert (=> b!404485 (= res!233273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404486 () Bool)

(declare-fun e!243334 () Bool)

(declare-fun e!243332 () Bool)

(assert (=> b!404486 (= e!243334 (and e!243332 mapRes!16926))))

(declare-fun condMapEmpty!16926 () Bool)

(declare-fun mapDefault!16926 () ValueCell!4758)

(assert (=> b!404486 (= condMapEmpty!16926 (= (arr!11601 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4758)) mapDefault!16926)))))

(declare-fun b!404487 () Bool)

(assert (=> b!404487 (= e!243335 e!243333)))

(declare-fun res!233272 () Bool)

(assert (=> b!404487 (=> (not res!233272) (not e!243333))))

(assert (=> b!404487 (= res!233272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188188 mask!1025))))

(assert (=> b!404487 (= lt!188188 (array!24302 (store (arr!11600 _keys!709) i!563 k0!794) (size!11952 _keys!709)))))

(declare-fun b!404488 () Bool)

(declare-fun res!233270 () Bool)

(assert (=> b!404488 (=> (not res!233270) (not e!243335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404488 (= res!233270 (validKeyInArray!0 k0!794))))

(declare-fun b!404489 () Bool)

(declare-fun tp_is_empty!10203 () Bool)

(assert (=> b!404489 (= e!243332 tp_is_empty!10203)))

(declare-fun b!404490 () Bool)

(declare-fun res!233269 () Bool)

(assert (=> b!404490 (=> (not res!233269) (not e!243335))))

(assert (=> b!404490 (= res!233269 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6750))))

(declare-fun b!404491 () Bool)

(declare-fun e!243331 () Bool)

(assert (=> b!404491 (= e!243331 tp_is_empty!10203)))

(declare-fun b!404483 () Bool)

(declare-fun res!233275 () Bool)

(assert (=> b!404483 (=> (not res!233275) (not e!243335))))

(assert (=> b!404483 (= res!233275 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11952 _keys!709))))))

(declare-fun res!233276 () Bool)

(assert (=> start!38784 (=> (not res!233276) (not e!243335))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38784 (= res!233276 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11952 _keys!709))))))

(assert (=> start!38784 e!243335))

(assert (=> start!38784 true))

(declare-fun array_inv!8482 (array!24303) Bool)

(assert (=> start!38784 (and (array_inv!8482 _values!549) e!243334)))

(declare-fun array_inv!8483 (array!24301) Bool)

(assert (=> start!38784 (array_inv!8483 _keys!709)))

(declare-fun b!404492 () Bool)

(declare-fun res!233274 () Bool)

(assert (=> b!404492 (=> (not res!233274) (not e!243335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404492 (= res!233274 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16926 () Bool)

(declare-fun tp!33045 () Bool)

(assert (=> mapNonEmpty!16926 (= mapRes!16926 (and tp!33045 e!243331))))

(declare-fun mapRest!16926 () (Array (_ BitVec 32) ValueCell!4758))

(declare-fun mapKey!16926 () (_ BitVec 32))

(declare-fun mapValue!16926 () ValueCell!4758)

(assert (=> mapNonEmpty!16926 (= (arr!11601 _values!549) (store mapRest!16926 mapKey!16926 mapValue!16926))))

(assert (= (and start!38784 res!233276) b!404492))

(assert (= (and b!404492 res!233274) b!404482))

(assert (= (and b!404482 res!233268) b!404485))

(assert (= (and b!404485 res!233273) b!404490))

(assert (= (and b!404490 res!233269) b!404483))

(assert (= (and b!404483 res!233275) b!404488))

(assert (= (and b!404488 res!233270) b!404484))

(assert (= (and b!404484 res!233277) b!404481))

(assert (= (and b!404481 res!233271) b!404487))

(assert (= (and b!404487 res!233272) b!404480))

(assert (= (and b!404486 condMapEmpty!16926) mapIsEmpty!16926))

(assert (= (and b!404486 (not condMapEmpty!16926)) mapNonEmpty!16926))

(get-info :version)

(assert (= (and mapNonEmpty!16926 ((_ is ValueCellFull!4758) mapValue!16926)) b!404491))

(assert (= (and b!404486 ((_ is ValueCellFull!4758) mapDefault!16926)) b!404489))

(assert (= start!38784 b!404486))

(declare-fun m!397303 () Bool)

(assert (=> b!404487 m!397303))

(declare-fun m!397305 () Bool)

(assert (=> b!404487 m!397305))

(declare-fun m!397307 () Bool)

(assert (=> b!404480 m!397307))

(declare-fun m!397309 () Bool)

(assert (=> start!38784 m!397309))

(declare-fun m!397311 () Bool)

(assert (=> start!38784 m!397311))

(declare-fun m!397313 () Bool)

(assert (=> b!404490 m!397313))

(declare-fun m!397315 () Bool)

(assert (=> b!404488 m!397315))

(declare-fun m!397317 () Bool)

(assert (=> b!404485 m!397317))

(declare-fun m!397319 () Bool)

(assert (=> b!404484 m!397319))

(declare-fun m!397321 () Bool)

(assert (=> mapNonEmpty!16926 m!397321))

(declare-fun m!397323 () Bool)

(assert (=> b!404492 m!397323))

(declare-fun m!397325 () Bool)

(assert (=> b!404481 m!397325))

(check-sat (not b!404481) (not b!404487) (not start!38784) tp_is_empty!10203 (not b!404490) (not b!404488) (not mapNonEmpty!16926) (not b!404480) (not b!404485) (not b!404492))
(check-sat)
