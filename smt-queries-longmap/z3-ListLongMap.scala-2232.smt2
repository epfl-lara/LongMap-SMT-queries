; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36840 () Bool)

(assert start!36840)

(declare-fun b_free!7981 () Bool)

(declare-fun b_next!7981 () Bool)

(assert (=> start!36840 (= b_free!7981 (not b_next!7981))))

(declare-fun tp!28658 () Bool)

(declare-fun b_and!15197 () Bool)

(assert (=> start!36840 (= tp!28658 b_and!15197)))

(declare-fun b!368398 () Bool)

(declare-fun e!225269 () Bool)

(declare-fun tp_is_empty!8629 () Bool)

(assert (=> b!368398 (= e!225269 tp_is_empty!8629)))

(declare-fun b!368399 () Bool)

(declare-fun res!206535 () Bool)

(declare-fun e!225267 () Bool)

(assert (=> b!368399 (=> (not res!206535) (not e!225267))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368399 (= res!206535 (validKeyInArray!0 k0!778))))

(declare-fun b!368400 () Bool)

(declare-fun res!206540 () Bool)

(assert (=> b!368400 (=> (not res!206540) (not e!225267))))

(declare-datatypes ((array!21195 0))(
  ( (array!21196 (arr!10066 (Array (_ BitVec 32) (_ BitVec 64))) (size!10419 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21195)

(declare-datatypes ((List!5576 0))(
  ( (Nil!5573) (Cons!5572 (h!6428 (_ BitVec 64)) (t!10717 List!5576)) )
))
(declare-fun arrayNoDuplicates!0 (array!21195 (_ BitVec 32) List!5576) Bool)

(assert (=> b!368400 (= res!206540 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5573))))

(declare-fun res!206539 () Bool)

(assert (=> start!36840 (=> (not res!206539) (not e!225267))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36840 (= res!206539 (validMask!0 mask!970))))

(assert (=> start!36840 e!225267))

(assert (=> start!36840 true))

(declare-datatypes ((V!12611 0))(
  ( (V!12612 (val!4359 Int)) )
))
(declare-datatypes ((ValueCell!3971 0))(
  ( (ValueCellFull!3971 (v!6550 V!12611)) (EmptyCell!3971) )
))
(declare-datatypes ((array!21197 0))(
  ( (array!21198 (arr!10067 (Array (_ BitVec 32) ValueCell!3971)) (size!10420 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21197)

(declare-fun e!225266 () Bool)

(declare-fun array_inv!7454 (array!21197) Bool)

(assert (=> start!36840 (and (array_inv!7454 _values!506) e!225266)))

(assert (=> start!36840 tp!28658))

(assert (=> start!36840 tp_is_empty!8629))

(declare-fun array_inv!7455 (array!21195) Bool)

(assert (=> start!36840 (array_inv!7455 _keys!658)))

(declare-fun b!368401 () Bool)

(declare-fun e!225264 () Bool)

(assert (=> b!368401 (= e!225267 e!225264)))

(declare-fun res!206538 () Bool)

(assert (=> b!368401 (=> (not res!206538) (not e!225264))))

(declare-fun lt!169332 () array!21195)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21195 (_ BitVec 32)) Bool)

(assert (=> b!368401 (= res!206538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169332 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368401 (= lt!169332 (array!21196 (store (arr!10066 _keys!658) i!548 k0!778) (size!10419 _keys!658)))))

(declare-fun mapIsEmpty!14508 () Bool)

(declare-fun mapRes!14508 () Bool)

(assert (=> mapIsEmpty!14508 mapRes!14508))

(declare-fun b!368402 () Bool)

(declare-fun res!206532 () Bool)

(assert (=> b!368402 (=> (not res!206532) (not e!225264))))

(assert (=> b!368402 (= res!206532 (arrayNoDuplicates!0 lt!169332 #b00000000000000000000000000000000 Nil!5573))))

(declare-fun b!368403 () Bool)

(assert (=> b!368403 (= e!225264 (bvsgt #b00000000000000000000000000000000 (size!10419 _keys!658)))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12611)

(declare-datatypes ((tuple2!5748 0))(
  ( (tuple2!5749 (_1!2885 (_ BitVec 64)) (_2!2885 V!12611)) )
))
(declare-datatypes ((List!5577 0))(
  ( (Nil!5574) (Cons!5573 (h!6429 tuple2!5748) (t!10718 List!5577)) )
))
(declare-datatypes ((ListLongMap!4651 0))(
  ( (ListLongMap!4652 (toList!2341 List!5577)) )
))
(declare-fun lt!169331 () ListLongMap!4651)

(declare-fun minValue!472 () V!12611)

(declare-fun getCurrentListMapNoExtraKeys!632 (array!21195 array!21197 (_ BitVec 32) (_ BitVec 32) V!12611 V!12611 (_ BitVec 32) Int) ListLongMap!4651)

(assert (=> b!368403 (= lt!169331 (getCurrentListMapNoExtraKeys!632 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14508 () Bool)

(declare-fun tp!28659 () Bool)

(assert (=> mapNonEmpty!14508 (= mapRes!14508 (and tp!28659 e!225269))))

(declare-fun mapRest!14508 () (Array (_ BitVec 32) ValueCell!3971))

(declare-fun mapKey!14508 () (_ BitVec 32))

(declare-fun mapValue!14508 () ValueCell!3971)

(assert (=> mapNonEmpty!14508 (= (arr!10067 _values!506) (store mapRest!14508 mapKey!14508 mapValue!14508))))

(declare-fun b!368404 () Bool)

(declare-fun res!206534 () Bool)

(assert (=> b!368404 (=> (not res!206534) (not e!225267))))

(assert (=> b!368404 (= res!206534 (and (= (size!10420 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10419 _keys!658) (size!10420 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368405 () Bool)

(declare-fun res!206533 () Bool)

(assert (=> b!368405 (=> (not res!206533) (not e!225267))))

(assert (=> b!368405 (= res!206533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368406 () Bool)

(declare-fun e!225265 () Bool)

(assert (=> b!368406 (= e!225265 tp_is_empty!8629)))

(declare-fun b!368407 () Bool)

(assert (=> b!368407 (= e!225266 (and e!225265 mapRes!14508))))

(declare-fun condMapEmpty!14508 () Bool)

(declare-fun mapDefault!14508 () ValueCell!3971)

(assert (=> b!368407 (= condMapEmpty!14508 (= (arr!10067 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3971)) mapDefault!14508)))))

(declare-fun b!368408 () Bool)

(declare-fun res!206536 () Bool)

(assert (=> b!368408 (=> (not res!206536) (not e!225267))))

(declare-fun arrayContainsKey!0 (array!21195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368408 (= res!206536 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368409 () Bool)

(declare-fun res!206537 () Bool)

(assert (=> b!368409 (=> (not res!206537) (not e!225267))))

(assert (=> b!368409 (= res!206537 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10419 _keys!658))))))

(declare-fun b!368410 () Bool)

(declare-fun res!206531 () Bool)

(assert (=> b!368410 (=> (not res!206531) (not e!225267))))

(assert (=> b!368410 (= res!206531 (or (= (select (arr!10066 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10066 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!36840 res!206539) b!368404))

(assert (= (and b!368404 res!206534) b!368405))

(assert (= (and b!368405 res!206533) b!368400))

(assert (= (and b!368400 res!206540) b!368409))

(assert (= (and b!368409 res!206537) b!368399))

(assert (= (and b!368399 res!206535) b!368410))

(assert (= (and b!368410 res!206531) b!368408))

(assert (= (and b!368408 res!206536) b!368401))

(assert (= (and b!368401 res!206538) b!368402))

(assert (= (and b!368402 res!206532) b!368403))

(assert (= (and b!368407 condMapEmpty!14508) mapIsEmpty!14508))

(assert (= (and b!368407 (not condMapEmpty!14508)) mapNonEmpty!14508))

(get-info :version)

(assert (= (and mapNonEmpty!14508 ((_ is ValueCellFull!3971) mapValue!14508)) b!368398))

(assert (= (and b!368407 ((_ is ValueCellFull!3971) mapDefault!14508)) b!368406))

(assert (= start!36840 b!368407))

(declare-fun m!364511 () Bool)

(assert (=> b!368402 m!364511))

(declare-fun m!364513 () Bool)

(assert (=> b!368401 m!364513))

(declare-fun m!364515 () Bool)

(assert (=> b!368401 m!364515))

(declare-fun m!364517 () Bool)

(assert (=> b!368400 m!364517))

(declare-fun m!364519 () Bool)

(assert (=> start!36840 m!364519))

(declare-fun m!364521 () Bool)

(assert (=> start!36840 m!364521))

(declare-fun m!364523 () Bool)

(assert (=> start!36840 m!364523))

(declare-fun m!364525 () Bool)

(assert (=> b!368405 m!364525))

(declare-fun m!364527 () Bool)

(assert (=> mapNonEmpty!14508 m!364527))

(declare-fun m!364529 () Bool)

(assert (=> b!368399 m!364529))

(declare-fun m!364531 () Bool)

(assert (=> b!368408 m!364531))

(declare-fun m!364533 () Bool)

(assert (=> b!368410 m!364533))

(declare-fun m!364535 () Bool)

(assert (=> b!368403 m!364535))

(check-sat (not b!368399) (not b!368405) tp_is_empty!8629 (not b!368400) (not b!368403) (not start!36840) (not b!368401) (not b_next!7981) (not b!368402) (not b!368408) (not mapNonEmpty!14508) b_and!15197)
(check-sat b_and!15197 (not b_next!7981))
