; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38790 () Bool)

(assert start!38790)

(declare-fun b!404597 () Bool)

(declare-fun res!233364 () Bool)

(declare-fun e!243387 () Bool)

(assert (=> b!404597 (=> (not res!233364) (not e!243387))))

(declare-datatypes ((array!24313 0))(
  ( (array!24314 (arr!11606 (Array (_ BitVec 32) (_ BitVec 64))) (size!11958 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24313)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24313 (_ BitVec 32)) Bool)

(assert (=> b!404597 (= res!233364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404598 () Bool)

(declare-fun res!233365 () Bool)

(assert (=> b!404598 (=> (not res!233365) (not e!243387))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14717 0))(
  ( (V!14718 (val!5149 Int)) )
))
(declare-datatypes ((ValueCell!4761 0))(
  ( (ValueCellFull!4761 (v!7396 V!14717)) (EmptyCell!4761) )
))
(declare-datatypes ((array!24315 0))(
  ( (array!24316 (arr!11607 (Array (_ BitVec 32) ValueCell!4761)) (size!11959 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24315)

(assert (=> b!404598 (= res!233365 (and (= (size!11959 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11958 _keys!709) (size!11959 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404599 () Bool)

(declare-fun res!233360 () Bool)

(assert (=> b!404599 (=> (not res!233360) (not e!243387))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404599 (= res!233360 (validKeyInArray!0 k0!794))))

(declare-fun b!404600 () Bool)

(declare-fun res!233366 () Bool)

(assert (=> b!404600 (=> (not res!233366) (not e!243387))))

(declare-datatypes ((List!6756 0))(
  ( (Nil!6753) (Cons!6752 (h!7608 (_ BitVec 64)) (t!11930 List!6756)) )
))
(declare-fun arrayNoDuplicates!0 (array!24313 (_ BitVec 32) List!6756) Bool)

(assert (=> b!404600 (= res!233366 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6753))))

(declare-fun b!404601 () Bool)

(declare-fun res!233358 () Bool)

(assert (=> b!404601 (=> (not res!233358) (not e!243387))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404601 (= res!233358 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11958 _keys!709))))))

(declare-fun b!404602 () Bool)

(declare-fun res!233359 () Bool)

(assert (=> b!404602 (=> (not res!233359) (not e!243387))))

(declare-fun arrayContainsKey!0 (array!24313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404602 (= res!233359 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404603 () Bool)

(declare-fun res!233363 () Bool)

(assert (=> b!404603 (=> (not res!233363) (not e!243387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404603 (= res!233363 (validMask!0 mask!1025))))

(declare-fun b!404604 () Bool)

(declare-fun e!243386 () Bool)

(declare-fun tp_is_empty!10209 () Bool)

(assert (=> b!404604 (= e!243386 tp_is_empty!10209)))

(declare-fun b!404605 () Bool)

(declare-fun e!243389 () Bool)

(declare-fun e!243385 () Bool)

(declare-fun mapRes!16935 () Bool)

(assert (=> b!404605 (= e!243389 (and e!243385 mapRes!16935))))

(declare-fun condMapEmpty!16935 () Bool)

(declare-fun mapDefault!16935 () ValueCell!4761)

(assert (=> b!404605 (= condMapEmpty!16935 (= (arr!11607 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4761)) mapDefault!16935)))))

(declare-fun b!404606 () Bool)

(declare-fun e!243388 () Bool)

(assert (=> b!404606 (= e!243387 e!243388)))

(declare-fun res!233361 () Bool)

(assert (=> b!404606 (=> (not res!233361) (not e!243388))))

(declare-fun lt!188206 () array!24313)

(assert (=> b!404606 (= res!233361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188206 mask!1025))))

(assert (=> b!404606 (= lt!188206 (array!24314 (store (arr!11606 _keys!709) i!563 k0!794) (size!11958 _keys!709)))))

(declare-fun mapNonEmpty!16935 () Bool)

(declare-fun tp!33054 () Bool)

(assert (=> mapNonEmpty!16935 (= mapRes!16935 (and tp!33054 e!243386))))

(declare-fun mapKey!16935 () (_ BitVec 32))

(declare-fun mapValue!16935 () ValueCell!4761)

(declare-fun mapRest!16935 () (Array (_ BitVec 32) ValueCell!4761))

(assert (=> mapNonEmpty!16935 (= (arr!11607 _values!549) (store mapRest!16935 mapKey!16935 mapValue!16935))))

(declare-fun mapIsEmpty!16935 () Bool)

(assert (=> mapIsEmpty!16935 mapRes!16935))

(declare-fun b!404607 () Bool)

(declare-fun res!233362 () Bool)

(assert (=> b!404607 (=> (not res!233362) (not e!243387))))

(assert (=> b!404607 (= res!233362 (or (= (select (arr!11606 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11606 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404608 () Bool)

(assert (=> b!404608 (= e!243385 tp_is_empty!10209)))

(declare-fun b!404609 () Bool)

(assert (=> b!404609 (= e!243388 false)))

(declare-fun lt!188207 () Bool)

(assert (=> b!404609 (= lt!188207 (arrayNoDuplicates!0 lt!188206 #b00000000000000000000000000000000 Nil!6753))))

(declare-fun res!233367 () Bool)

(assert (=> start!38790 (=> (not res!233367) (not e!243387))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38790 (= res!233367 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11958 _keys!709))))))

(assert (=> start!38790 e!243387))

(assert (=> start!38790 true))

(declare-fun array_inv!8484 (array!24315) Bool)

(assert (=> start!38790 (and (array_inv!8484 _values!549) e!243389)))

(declare-fun array_inv!8485 (array!24313) Bool)

(assert (=> start!38790 (array_inv!8485 _keys!709)))

(assert (= (and start!38790 res!233367) b!404603))

(assert (= (and b!404603 res!233363) b!404598))

(assert (= (and b!404598 res!233365) b!404597))

(assert (= (and b!404597 res!233364) b!404600))

(assert (= (and b!404600 res!233366) b!404601))

(assert (= (and b!404601 res!233358) b!404599))

(assert (= (and b!404599 res!233360) b!404607))

(assert (= (and b!404607 res!233362) b!404602))

(assert (= (and b!404602 res!233359) b!404606))

(assert (= (and b!404606 res!233361) b!404609))

(assert (= (and b!404605 condMapEmpty!16935) mapIsEmpty!16935))

(assert (= (and b!404605 (not condMapEmpty!16935)) mapNonEmpty!16935))

(get-info :version)

(assert (= (and mapNonEmpty!16935 ((_ is ValueCellFull!4761) mapValue!16935)) b!404604))

(assert (= (and b!404605 ((_ is ValueCellFull!4761) mapDefault!16935)) b!404608))

(assert (= start!38790 b!404605))

(declare-fun m!397375 () Bool)

(assert (=> b!404602 m!397375))

(declare-fun m!397377 () Bool)

(assert (=> b!404597 m!397377))

(declare-fun m!397379 () Bool)

(assert (=> b!404600 m!397379))

(declare-fun m!397381 () Bool)

(assert (=> mapNonEmpty!16935 m!397381))

(declare-fun m!397383 () Bool)

(assert (=> b!404599 m!397383))

(declare-fun m!397385 () Bool)

(assert (=> start!38790 m!397385))

(declare-fun m!397387 () Bool)

(assert (=> start!38790 m!397387))

(declare-fun m!397389 () Bool)

(assert (=> b!404609 m!397389))

(declare-fun m!397391 () Bool)

(assert (=> b!404606 m!397391))

(declare-fun m!397393 () Bool)

(assert (=> b!404606 m!397393))

(declare-fun m!397395 () Bool)

(assert (=> b!404603 m!397395))

(declare-fun m!397397 () Bool)

(assert (=> b!404607 m!397397))

(check-sat (not b!404606) tp_is_empty!10209 (not b!404603) (not start!38790) (not b!404609) (not b!404599) (not b!404602) (not mapNonEmpty!16935) (not b!404597) (not b!404600))
(check-sat)
