; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36750 () Bool)

(assert start!36750)

(declare-fun mapNonEmpty!14373 () Bool)

(declare-fun mapRes!14373 () Bool)

(declare-fun tp!28449 () Bool)

(declare-fun e!224456 () Bool)

(assert (=> mapNonEmpty!14373 (= mapRes!14373 (and tp!28449 e!224456))))

(declare-fun mapKey!14373 () (_ BitVec 32))

(declare-datatypes ((V!12491 0))(
  ( (V!12492 (val!4314 Int)) )
))
(declare-datatypes ((ValueCell!3926 0))(
  ( (ValueCellFull!3926 (v!6505 V!12491)) (EmptyCell!3926) )
))
(declare-fun mapRest!14373 () (Array (_ BitVec 32) ValueCell!3926))

(declare-fun mapValue!14373 () ValueCell!3926)

(declare-datatypes ((array!21023 0))(
  ( (array!21024 (arr!9980 (Array (_ BitVec 32) ValueCell!3926)) (size!10333 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21023)

(assert (=> mapNonEmpty!14373 (= (arr!9980 _values!506) (store mapRest!14373 mapKey!14373 mapValue!14373))))

(declare-fun b!366695 () Bool)

(declare-fun e!224455 () Bool)

(declare-fun tp_is_empty!8539 () Bool)

(assert (=> b!366695 (= e!224455 tp_is_empty!8539)))

(declare-fun res!205240 () Bool)

(declare-fun e!224459 () Bool)

(assert (=> start!36750 (=> (not res!205240) (not e!224459))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36750 (= res!205240 (validMask!0 mask!970))))

(assert (=> start!36750 e!224459))

(assert (=> start!36750 true))

(declare-fun e!224454 () Bool)

(declare-fun array_inv!7396 (array!21023) Bool)

(assert (=> start!36750 (and (array_inv!7396 _values!506) e!224454)))

(declare-datatypes ((array!21025 0))(
  ( (array!21026 (arr!9981 (Array (_ BitVec 32) (_ BitVec 64))) (size!10334 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21025)

(declare-fun array_inv!7397 (array!21025) Bool)

(assert (=> start!36750 (array_inv!7397 _keys!658)))

(declare-fun b!366696 () Bool)

(declare-fun res!205234 () Bool)

(assert (=> b!366696 (=> (not res!205234) (not e!224459))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366696 (= res!205234 (or (= (select (arr!9981 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9981 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366697 () Bool)

(assert (=> b!366697 (= e!224454 (and e!224455 mapRes!14373))))

(declare-fun condMapEmpty!14373 () Bool)

(declare-fun mapDefault!14373 () ValueCell!3926)

(assert (=> b!366697 (= condMapEmpty!14373 (= (arr!9980 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3926)) mapDefault!14373)))))

(declare-fun b!366698 () Bool)

(declare-fun res!205233 () Bool)

(assert (=> b!366698 (=> (not res!205233) (not e!224459))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366698 (= res!205233 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!14373 () Bool)

(assert (=> mapIsEmpty!14373 mapRes!14373))

(declare-fun b!366699 () Bool)

(declare-fun res!205237 () Bool)

(assert (=> b!366699 (=> (not res!205237) (not e!224459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21025 (_ BitVec 32)) Bool)

(assert (=> b!366699 (= res!205237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366700 () Bool)

(declare-fun res!205235 () Bool)

(assert (=> b!366700 (=> (not res!205235) (not e!224459))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366700 (= res!205235 (and (= (size!10333 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10334 _keys!658) (size!10333 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366701 () Bool)

(assert (=> b!366701 (= e!224456 tp_is_empty!8539)))

(declare-fun b!366702 () Bool)

(declare-fun res!205241 () Bool)

(assert (=> b!366702 (=> (not res!205241) (not e!224459))))

(declare-datatypes ((List!5522 0))(
  ( (Nil!5519) (Cons!5518 (h!6374 (_ BitVec 64)) (t!10663 List!5522)) )
))
(declare-fun arrayNoDuplicates!0 (array!21025 (_ BitVec 32) List!5522) Bool)

(assert (=> b!366702 (= res!205241 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5519))))

(declare-fun b!366703 () Bool)

(declare-fun e!224457 () Bool)

(assert (=> b!366703 (= e!224459 e!224457)))

(declare-fun res!205236 () Bool)

(assert (=> b!366703 (=> (not res!205236) (not e!224457))))

(declare-fun lt!169070 () array!21025)

(assert (=> b!366703 (= res!205236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169070 mask!970))))

(assert (=> b!366703 (= lt!169070 (array!21026 (store (arr!9981 _keys!658) i!548 k0!778) (size!10334 _keys!658)))))

(declare-fun b!366704 () Bool)

(assert (=> b!366704 (= e!224457 false)))

(declare-fun lt!169071 () Bool)

(assert (=> b!366704 (= lt!169071 (arrayNoDuplicates!0 lt!169070 #b00000000000000000000000000000000 Nil!5519))))

(declare-fun b!366705 () Bool)

(declare-fun res!205238 () Bool)

(assert (=> b!366705 (=> (not res!205238) (not e!224459))))

(declare-fun arrayContainsKey!0 (array!21025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366705 (= res!205238 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!366706 () Bool)

(declare-fun res!205239 () Bool)

(assert (=> b!366706 (=> (not res!205239) (not e!224459))))

(assert (=> b!366706 (= res!205239 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10334 _keys!658))))))

(assert (= (and start!36750 res!205240) b!366700))

(assert (= (and b!366700 res!205235) b!366699))

(assert (= (and b!366699 res!205237) b!366702))

(assert (= (and b!366702 res!205241) b!366706))

(assert (= (and b!366706 res!205239) b!366698))

(assert (= (and b!366698 res!205233) b!366696))

(assert (= (and b!366696 res!205234) b!366705))

(assert (= (and b!366705 res!205238) b!366703))

(assert (= (and b!366703 res!205236) b!366704))

(assert (= (and b!366697 condMapEmpty!14373) mapIsEmpty!14373))

(assert (= (and b!366697 (not condMapEmpty!14373)) mapNonEmpty!14373))

(get-info :version)

(assert (= (and mapNonEmpty!14373 ((_ is ValueCellFull!3926) mapValue!14373)) b!366701))

(assert (= (and b!366697 ((_ is ValueCellFull!3926) mapDefault!14373)) b!366695))

(assert (= start!36750 b!366697))

(declare-fun m!363383 () Bool)

(assert (=> b!366699 m!363383))

(declare-fun m!363385 () Bool)

(assert (=> start!36750 m!363385))

(declare-fun m!363387 () Bool)

(assert (=> start!36750 m!363387))

(declare-fun m!363389 () Bool)

(assert (=> start!36750 m!363389))

(declare-fun m!363391 () Bool)

(assert (=> b!366704 m!363391))

(declare-fun m!363393 () Bool)

(assert (=> b!366698 m!363393))

(declare-fun m!363395 () Bool)

(assert (=> b!366705 m!363395))

(declare-fun m!363397 () Bool)

(assert (=> b!366696 m!363397))

(declare-fun m!363399 () Bool)

(assert (=> mapNonEmpty!14373 m!363399))

(declare-fun m!363401 () Bool)

(assert (=> b!366702 m!363401))

(declare-fun m!363403 () Bool)

(assert (=> b!366703 m!363403))

(declare-fun m!363405 () Bool)

(assert (=> b!366703 m!363405))

(check-sat (not b!366698) (not b!366699) (not b!366704) (not b!366705) (not b!366702) (not b!366703) tp_is_empty!8539 (not mapNonEmpty!14373) (not start!36750))
(check-sat)
