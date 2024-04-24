; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36834 () Bool)

(assert start!36834)

(declare-fun b_free!7975 () Bool)

(declare-fun b_next!7975 () Bool)

(assert (=> start!36834 (= b_free!7975 (not b_next!7975))))

(declare-fun tp!28640 () Bool)

(declare-fun b_and!15231 () Bool)

(assert (=> start!36834 (= tp!28640 b_and!15231)))

(declare-fun b!368503 () Bool)

(declare-fun res!206571 () Bool)

(declare-fun e!225352 () Bool)

(assert (=> b!368503 (=> (not res!206571) (not e!225352))))

(declare-datatypes ((array!21182 0))(
  ( (array!21183 (arr!10059 (Array (_ BitVec 32) (_ BitVec 64))) (size!10411 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21182)

(declare-datatypes ((List!5512 0))(
  ( (Nil!5509) (Cons!5508 (h!6364 (_ BitVec 64)) (t!10654 List!5512)) )
))
(declare-fun arrayNoDuplicates!0 (array!21182 (_ BitVec 32) List!5512) Bool)

(assert (=> b!368503 (= res!206571 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5509))))

(declare-fun b!368504 () Bool)

(declare-fun res!206568 () Bool)

(assert (=> b!368504 (=> (not res!206568) (not e!225352))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368504 (= res!206568 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10411 _keys!658))))))

(declare-fun b!368505 () Bool)

(declare-fun res!206567 () Bool)

(assert (=> b!368505 (=> (not res!206567) (not e!225352))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21182 (_ BitVec 32)) Bool)

(assert (=> b!368505 (= res!206567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368506 () Bool)

(declare-fun e!225354 () Bool)

(declare-fun tp_is_empty!8623 () Bool)

(assert (=> b!368506 (= e!225354 tp_is_empty!8623)))

(declare-fun b!368507 () Bool)

(declare-fun res!206574 () Bool)

(assert (=> b!368507 (=> (not res!206574) (not e!225352))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368507 (= res!206574 (validKeyInArray!0 k0!778))))

(declare-fun b!368508 () Bool)

(declare-fun res!206573 () Bool)

(assert (=> b!368508 (=> (not res!206573) (not e!225352))))

(assert (=> b!368508 (= res!206573 (or (= (select (arr!10059 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10059 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368509 () Bool)

(declare-fun e!225355 () Bool)

(assert (=> b!368509 (= e!225355 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12603 0))(
  ( (V!12604 (val!4356 Int)) )
))
(declare-datatypes ((ValueCell!3968 0))(
  ( (ValueCellFull!3968 (v!6554 V!12603)) (EmptyCell!3968) )
))
(declare-datatypes ((array!21184 0))(
  ( (array!21185 (arr!10060 (Array (_ BitVec 32) ValueCell!3968)) (size!10412 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21184)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12603)

(declare-datatypes ((tuple2!5690 0))(
  ( (tuple2!5691 (_1!2856 (_ BitVec 64)) (_2!2856 V!12603)) )
))
(declare-datatypes ((List!5513 0))(
  ( (Nil!5510) (Cons!5509 (h!6365 tuple2!5690) (t!10655 List!5513)) )
))
(declare-datatypes ((ListLongMap!4605 0))(
  ( (ListLongMap!4606 (toList!2318 List!5513)) )
))
(declare-fun lt!169566 () ListLongMap!4605)

(declare-fun minValue!472 () V!12603)

(declare-fun getCurrentListMapNoExtraKeys!627 (array!21182 array!21184 (_ BitVec 32) (_ BitVec 32) V!12603 V!12603 (_ BitVec 32) Int) ListLongMap!4605)

(assert (=> b!368509 (= lt!169566 (getCurrentListMapNoExtraKeys!627 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14499 () Bool)

(declare-fun mapRes!14499 () Bool)

(declare-fun tp!28641 () Bool)

(declare-fun e!225356 () Bool)

(assert (=> mapNonEmpty!14499 (= mapRes!14499 (and tp!28641 e!225356))))

(declare-fun mapKey!14499 () (_ BitVec 32))

(declare-fun mapValue!14499 () ValueCell!3968)

(declare-fun mapRest!14499 () (Array (_ BitVec 32) ValueCell!3968))

(assert (=> mapNonEmpty!14499 (= (arr!10060 _values!506) (store mapRest!14499 mapKey!14499 mapValue!14499))))

(declare-fun mapIsEmpty!14499 () Bool)

(assert (=> mapIsEmpty!14499 mapRes!14499))

(declare-fun res!206569 () Bool)

(assert (=> start!36834 (=> (not res!206569) (not e!225352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36834 (= res!206569 (validMask!0 mask!970))))

(assert (=> start!36834 e!225352))

(assert (=> start!36834 true))

(declare-fun e!225357 () Bool)

(declare-fun array_inv!7470 (array!21184) Bool)

(assert (=> start!36834 (and (array_inv!7470 _values!506) e!225357)))

(assert (=> start!36834 tp!28640))

(assert (=> start!36834 tp_is_empty!8623))

(declare-fun array_inv!7471 (array!21182) Bool)

(assert (=> start!36834 (array_inv!7471 _keys!658)))

(declare-fun b!368510 () Bool)

(assert (=> b!368510 (= e!225356 tp_is_empty!8623)))

(declare-fun b!368511 () Bool)

(declare-fun res!206572 () Bool)

(assert (=> b!368511 (=> (not res!206572) (not e!225355))))

(declare-fun lt!169567 () array!21182)

(assert (=> b!368511 (= res!206572 (arrayNoDuplicates!0 lt!169567 #b00000000000000000000000000000000 Nil!5509))))

(declare-fun b!368512 () Bool)

(declare-fun res!206576 () Bool)

(assert (=> b!368512 (=> (not res!206576) (not e!225352))))

(assert (=> b!368512 (= res!206576 (and (= (size!10412 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10411 _keys!658) (size!10412 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368513 () Bool)

(assert (=> b!368513 (= e!225357 (and e!225354 mapRes!14499))))

(declare-fun condMapEmpty!14499 () Bool)

(declare-fun mapDefault!14499 () ValueCell!3968)

(assert (=> b!368513 (= condMapEmpty!14499 (= (arr!10060 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3968)) mapDefault!14499)))))

(declare-fun b!368514 () Bool)

(assert (=> b!368514 (= e!225352 e!225355)))

(declare-fun res!206570 () Bool)

(assert (=> b!368514 (=> (not res!206570) (not e!225355))))

(assert (=> b!368514 (= res!206570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169567 mask!970))))

(assert (=> b!368514 (= lt!169567 (array!21183 (store (arr!10059 _keys!658) i!548 k0!778) (size!10411 _keys!658)))))

(declare-fun b!368515 () Bool)

(declare-fun res!206575 () Bool)

(assert (=> b!368515 (=> (not res!206575) (not e!225352))))

(declare-fun arrayContainsKey!0 (array!21182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368515 (= res!206575 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!36834 res!206569) b!368512))

(assert (= (and b!368512 res!206576) b!368505))

(assert (= (and b!368505 res!206567) b!368503))

(assert (= (and b!368503 res!206571) b!368504))

(assert (= (and b!368504 res!206568) b!368507))

(assert (= (and b!368507 res!206574) b!368508))

(assert (= (and b!368508 res!206573) b!368515))

(assert (= (and b!368515 res!206575) b!368514))

(assert (= (and b!368514 res!206570) b!368511))

(assert (= (and b!368511 res!206572) b!368509))

(assert (= (and b!368513 condMapEmpty!14499) mapIsEmpty!14499))

(assert (= (and b!368513 (not condMapEmpty!14499)) mapNonEmpty!14499))

(get-info :version)

(assert (= (and mapNonEmpty!14499 ((_ is ValueCellFull!3968) mapValue!14499)) b!368510))

(assert (= (and b!368513 ((_ is ValueCellFull!3968) mapDefault!14499)) b!368506))

(assert (= start!36834 b!368513))

(declare-fun m!365387 () Bool)

(assert (=> b!368503 m!365387))

(declare-fun m!365389 () Bool)

(assert (=> b!368511 m!365389))

(declare-fun m!365391 () Bool)

(assert (=> b!368505 m!365391))

(declare-fun m!365393 () Bool)

(assert (=> start!36834 m!365393))

(declare-fun m!365395 () Bool)

(assert (=> start!36834 m!365395))

(declare-fun m!365397 () Bool)

(assert (=> start!36834 m!365397))

(declare-fun m!365399 () Bool)

(assert (=> b!368515 m!365399))

(declare-fun m!365401 () Bool)

(assert (=> b!368509 m!365401))

(declare-fun m!365403 () Bool)

(assert (=> b!368507 m!365403))

(declare-fun m!365405 () Bool)

(assert (=> b!368514 m!365405))

(declare-fun m!365407 () Bool)

(assert (=> b!368514 m!365407))

(declare-fun m!365409 () Bool)

(assert (=> mapNonEmpty!14499 m!365409))

(declare-fun m!365411 () Bool)

(assert (=> b!368508 m!365411))

(check-sat (not b!368514) (not b!368509) (not b!368507) b_and!15231 (not b!368505) (not b!368511) (not b!368515) tp_is_empty!8623 (not start!36834) (not b!368503) (not b_next!7975) (not mapNonEmpty!14499))
(check-sat b_and!15231 (not b_next!7975))
