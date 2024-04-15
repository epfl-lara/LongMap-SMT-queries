; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36774 () Bool)

(assert start!36774)

(declare-fun b!367127 () Bool)

(declare-fun res!205560 () Bool)

(declare-fun e!224673 () Bool)

(assert (=> b!367127 (=> (not res!205560) (not e!224673))))

(declare-datatypes ((array!21067 0))(
  ( (array!21068 (arr!10002 (Array (_ BitVec 32) (_ BitVec 64))) (size!10355 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21067)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367127 (= res!205560 (or (= (select (arr!10002 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10002 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!205559 () Bool)

(assert (=> start!36774 (=> (not res!205559) (not e!224673))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36774 (= res!205559 (validMask!0 mask!970))))

(assert (=> start!36774 e!224673))

(assert (=> start!36774 true))

(declare-datatypes ((V!12523 0))(
  ( (V!12524 (val!4326 Int)) )
))
(declare-datatypes ((ValueCell!3938 0))(
  ( (ValueCellFull!3938 (v!6517 V!12523)) (EmptyCell!3938) )
))
(declare-datatypes ((array!21069 0))(
  ( (array!21070 (arr!10003 (Array (_ BitVec 32) ValueCell!3938)) (size!10356 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21069)

(declare-fun e!224675 () Bool)

(declare-fun array_inv!7412 (array!21069) Bool)

(assert (=> start!36774 (and (array_inv!7412 _values!506) e!224675)))

(declare-fun array_inv!7413 (array!21067) Bool)

(assert (=> start!36774 (array_inv!7413 _keys!658)))

(declare-fun b!367128 () Bool)

(declare-fun e!224670 () Bool)

(declare-fun mapRes!14409 () Bool)

(assert (=> b!367128 (= e!224675 (and e!224670 mapRes!14409))))

(declare-fun condMapEmpty!14409 () Bool)

(declare-fun mapDefault!14409 () ValueCell!3938)

(assert (=> b!367128 (= condMapEmpty!14409 (= (arr!10003 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3938)) mapDefault!14409)))))

(declare-fun b!367129 () Bool)

(declare-fun res!205558 () Bool)

(assert (=> b!367129 (=> (not res!205558) (not e!224673))))

(declare-datatypes ((List!5531 0))(
  ( (Nil!5528) (Cons!5527 (h!6383 (_ BitVec 64)) (t!10672 List!5531)) )
))
(declare-fun arrayNoDuplicates!0 (array!21067 (_ BitVec 32) List!5531) Bool)

(assert (=> b!367129 (= res!205558 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5528))))

(declare-fun b!367130 () Bool)

(declare-fun res!205557 () Bool)

(assert (=> b!367130 (=> (not res!205557) (not e!224673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21067 (_ BitVec 32)) Bool)

(assert (=> b!367130 (= res!205557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367131 () Bool)

(declare-fun res!205561 () Bool)

(assert (=> b!367131 (=> (not res!205561) (not e!224673))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367131 (= res!205561 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!14409 () Bool)

(assert (=> mapIsEmpty!14409 mapRes!14409))

(declare-fun b!367132 () Bool)

(declare-fun e!224674 () Bool)

(assert (=> b!367132 (= e!224673 e!224674)))

(declare-fun res!205564 () Bool)

(assert (=> b!367132 (=> (not res!205564) (not e!224674))))

(declare-fun lt!169143 () array!21067)

(assert (=> b!367132 (= res!205564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169143 mask!970))))

(assert (=> b!367132 (= lt!169143 (array!21068 (store (arr!10002 _keys!658) i!548 k0!778) (size!10355 _keys!658)))))

(declare-fun b!367133 () Bool)

(declare-fun e!224672 () Bool)

(declare-fun tp_is_empty!8563 () Bool)

(assert (=> b!367133 (= e!224672 tp_is_empty!8563)))

(declare-fun mapNonEmpty!14409 () Bool)

(declare-fun tp!28485 () Bool)

(assert (=> mapNonEmpty!14409 (= mapRes!14409 (and tp!28485 e!224672))))

(declare-fun mapValue!14409 () ValueCell!3938)

(declare-fun mapRest!14409 () (Array (_ BitVec 32) ValueCell!3938))

(declare-fun mapKey!14409 () (_ BitVec 32))

(assert (=> mapNonEmpty!14409 (= (arr!10003 _values!506) (store mapRest!14409 mapKey!14409 mapValue!14409))))

(declare-fun b!367134 () Bool)

(declare-fun res!205563 () Bool)

(assert (=> b!367134 (=> (not res!205563) (not e!224673))))

(declare-fun arrayContainsKey!0 (array!21067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367134 (= res!205563 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367135 () Bool)

(declare-fun res!205565 () Bool)

(assert (=> b!367135 (=> (not res!205565) (not e!224673))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367135 (= res!205565 (and (= (size!10356 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10355 _keys!658) (size!10356 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367136 () Bool)

(assert (=> b!367136 (= e!224670 tp_is_empty!8563)))

(declare-fun b!367137 () Bool)

(declare-fun res!205562 () Bool)

(assert (=> b!367137 (=> (not res!205562) (not e!224673))))

(assert (=> b!367137 (= res!205562 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10355 _keys!658))))))

(declare-fun b!367138 () Bool)

(assert (=> b!367138 (= e!224674 false)))

(declare-fun lt!169142 () Bool)

(assert (=> b!367138 (= lt!169142 (arrayNoDuplicates!0 lt!169143 #b00000000000000000000000000000000 Nil!5528))))

(assert (= (and start!36774 res!205559) b!367135))

(assert (= (and b!367135 res!205565) b!367130))

(assert (= (and b!367130 res!205557) b!367129))

(assert (= (and b!367129 res!205558) b!367137))

(assert (= (and b!367137 res!205562) b!367131))

(assert (= (and b!367131 res!205561) b!367127))

(assert (= (and b!367127 res!205560) b!367134))

(assert (= (and b!367134 res!205563) b!367132))

(assert (= (and b!367132 res!205564) b!367138))

(assert (= (and b!367128 condMapEmpty!14409) mapIsEmpty!14409))

(assert (= (and b!367128 (not condMapEmpty!14409)) mapNonEmpty!14409))

(get-info :version)

(assert (= (and mapNonEmpty!14409 ((_ is ValueCellFull!3938) mapValue!14409)) b!367133))

(assert (= (and b!367128 ((_ is ValueCellFull!3938) mapDefault!14409)) b!367136))

(assert (= start!36774 b!367128))

(declare-fun m!363671 () Bool)

(assert (=> b!367138 m!363671))

(declare-fun m!363673 () Bool)

(assert (=> b!367129 m!363673))

(declare-fun m!363675 () Bool)

(assert (=> b!367127 m!363675))

(declare-fun m!363677 () Bool)

(assert (=> mapNonEmpty!14409 m!363677))

(declare-fun m!363679 () Bool)

(assert (=> b!367130 m!363679))

(declare-fun m!363681 () Bool)

(assert (=> b!367131 m!363681))

(declare-fun m!363683 () Bool)

(assert (=> start!36774 m!363683))

(declare-fun m!363685 () Bool)

(assert (=> start!36774 m!363685))

(declare-fun m!363687 () Bool)

(assert (=> start!36774 m!363687))

(declare-fun m!363689 () Bool)

(assert (=> b!367132 m!363689))

(declare-fun m!363691 () Bool)

(assert (=> b!367132 m!363691))

(declare-fun m!363693 () Bool)

(assert (=> b!367134 m!363693))

(check-sat (not mapNonEmpty!14409) (not b!367138) (not b!367130) (not start!36774) tp_is_empty!8563 (not b!367134) (not b!367132) (not b!367129) (not b!367131))
(check-sat)
