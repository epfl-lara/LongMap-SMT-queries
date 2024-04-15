; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38780 () Bool)

(assert start!38780)

(declare-fun b!404404 () Bool)

(declare-fun e!243250 () Bool)

(declare-fun tp_is_empty!10213 () Bool)

(assert (=> b!404404 (= e!243250 tp_is_empty!10213)))

(declare-fun b!404405 () Bool)

(declare-fun res!233297 () Bool)

(declare-fun e!243251 () Bool)

(assert (=> b!404405 (=> (not res!233297) (not e!243251))))

(declare-datatypes ((array!24303 0))(
  ( (array!24304 (arr!11601 (Array (_ BitVec 32) (_ BitVec 64))) (size!11954 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24303)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404405 (= res!233297 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404406 () Bool)

(declare-fun e!243249 () Bool)

(assert (=> b!404406 (= e!243251 e!243249)))

(declare-fun res!233298 () Bool)

(assert (=> b!404406 (=> (not res!233298) (not e!243249))))

(declare-fun lt!187984 () array!24303)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24303 (_ BitVec 32)) Bool)

(assert (=> b!404406 (= res!233298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187984 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404406 (= lt!187984 (array!24304 (store (arr!11601 _keys!709) i!563 k0!794) (size!11954 _keys!709)))))

(declare-fun b!404407 () Bool)

(declare-fun res!233291 () Bool)

(assert (=> b!404407 (=> (not res!233291) (not e!243251))))

(assert (=> b!404407 (= res!233291 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11954 _keys!709))))))

(declare-fun res!233293 () Bool)

(assert (=> start!38780 (=> (not res!233293) (not e!243251))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38780 (= res!233293 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11954 _keys!709))))))

(assert (=> start!38780 e!243251))

(assert (=> start!38780 true))

(declare-datatypes ((V!14723 0))(
  ( (V!14724 (val!5151 Int)) )
))
(declare-datatypes ((ValueCell!4763 0))(
  ( (ValueCellFull!4763 (v!7392 V!14723)) (EmptyCell!4763) )
))
(declare-datatypes ((array!24305 0))(
  ( (array!24306 (arr!11602 (Array (_ BitVec 32) ValueCell!4763)) (size!11955 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24305)

(declare-fun e!243252 () Bool)

(declare-fun array_inv!8516 (array!24305) Bool)

(assert (=> start!38780 (and (array_inv!8516 _values!549) e!243252)))

(declare-fun array_inv!8517 (array!24303) Bool)

(assert (=> start!38780 (array_inv!8517 _keys!709)))

(declare-fun b!404408 () Bool)

(declare-fun mapRes!16941 () Bool)

(assert (=> b!404408 (= e!243252 (and e!243250 mapRes!16941))))

(declare-fun condMapEmpty!16941 () Bool)

(declare-fun mapDefault!16941 () ValueCell!4763)

(assert (=> b!404408 (= condMapEmpty!16941 (= (arr!11602 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4763)) mapDefault!16941)))))

(declare-fun b!404409 () Bool)

(declare-fun res!233292 () Bool)

(assert (=> b!404409 (=> (not res!233292) (not e!243251))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404409 (= res!233292 (and (= (size!11955 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11954 _keys!709) (size!11955 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404410 () Bool)

(assert (=> b!404410 (= e!243249 false)))

(declare-fun lt!187985 () Bool)

(declare-datatypes ((List!6730 0))(
  ( (Nil!6727) (Cons!6726 (h!7582 (_ BitVec 64)) (t!11895 List!6730)) )
))
(declare-fun arrayNoDuplicates!0 (array!24303 (_ BitVec 32) List!6730) Bool)

(assert (=> b!404410 (= lt!187985 (arrayNoDuplicates!0 lt!187984 #b00000000000000000000000000000000 Nil!6727))))

(declare-fun b!404411 () Bool)

(declare-fun res!233289 () Bool)

(assert (=> b!404411 (=> (not res!233289) (not e!243251))))

(assert (=> b!404411 (= res!233289 (or (= (select (arr!11601 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11601 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404412 () Bool)

(declare-fun res!233295 () Bool)

(assert (=> b!404412 (=> (not res!233295) (not e!243251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404412 (= res!233295 (validMask!0 mask!1025))))

(declare-fun b!404413 () Bool)

(declare-fun res!233294 () Bool)

(assert (=> b!404413 (=> (not res!233294) (not e!243251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404413 (= res!233294 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!16941 () Bool)

(declare-fun tp!33060 () Bool)

(declare-fun e!243248 () Bool)

(assert (=> mapNonEmpty!16941 (= mapRes!16941 (and tp!33060 e!243248))))

(declare-fun mapValue!16941 () ValueCell!4763)

(declare-fun mapKey!16941 () (_ BitVec 32))

(declare-fun mapRest!16941 () (Array (_ BitVec 32) ValueCell!4763))

(assert (=> mapNonEmpty!16941 (= (arr!11602 _values!549) (store mapRest!16941 mapKey!16941 mapValue!16941))))

(declare-fun b!404414 () Bool)

(assert (=> b!404414 (= e!243248 tp_is_empty!10213)))

(declare-fun mapIsEmpty!16941 () Bool)

(assert (=> mapIsEmpty!16941 mapRes!16941))

(declare-fun b!404415 () Bool)

(declare-fun res!233290 () Bool)

(assert (=> b!404415 (=> (not res!233290) (not e!243251))))

(assert (=> b!404415 (= res!233290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404416 () Bool)

(declare-fun res!233296 () Bool)

(assert (=> b!404416 (=> (not res!233296) (not e!243251))))

(assert (=> b!404416 (= res!233296 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6727))))

(assert (= (and start!38780 res!233293) b!404412))

(assert (= (and b!404412 res!233295) b!404409))

(assert (= (and b!404409 res!233292) b!404415))

(assert (= (and b!404415 res!233290) b!404416))

(assert (= (and b!404416 res!233296) b!404407))

(assert (= (and b!404407 res!233291) b!404413))

(assert (= (and b!404413 res!233294) b!404411))

(assert (= (and b!404411 res!233289) b!404405))

(assert (= (and b!404405 res!233297) b!404406))

(assert (= (and b!404406 res!233298) b!404410))

(assert (= (and b!404408 condMapEmpty!16941) mapIsEmpty!16941))

(assert (= (and b!404408 (not condMapEmpty!16941)) mapNonEmpty!16941))

(get-info :version)

(assert (= (and mapNonEmpty!16941 ((_ is ValueCellFull!4763) mapValue!16941)) b!404414))

(assert (= (and b!404408 ((_ is ValueCellFull!4763) mapDefault!16941)) b!404404))

(assert (= start!38780 b!404408))

(declare-fun m!396699 () Bool)

(assert (=> b!404413 m!396699))

(declare-fun m!396701 () Bool)

(assert (=> start!38780 m!396701))

(declare-fun m!396703 () Bool)

(assert (=> start!38780 m!396703))

(declare-fun m!396705 () Bool)

(assert (=> b!404415 m!396705))

(declare-fun m!396707 () Bool)

(assert (=> b!404412 m!396707))

(declare-fun m!396709 () Bool)

(assert (=> b!404406 m!396709))

(declare-fun m!396711 () Bool)

(assert (=> b!404406 m!396711))

(declare-fun m!396713 () Bool)

(assert (=> b!404411 m!396713))

(declare-fun m!396715 () Bool)

(assert (=> b!404410 m!396715))

(declare-fun m!396717 () Bool)

(assert (=> b!404405 m!396717))

(declare-fun m!396719 () Bool)

(assert (=> mapNonEmpty!16941 m!396719))

(declare-fun m!396721 () Bool)

(assert (=> b!404416 m!396721))

(check-sat tp_is_empty!10213 (not b!404415) (not b!404412) (not start!38780) (not mapNonEmpty!16941) (not b!404416) (not b!404413) (not b!404410) (not b!404406) (not b!404405))
(check-sat)
