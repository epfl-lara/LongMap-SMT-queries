; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36778 () Bool)

(assert start!36778)

(declare-fun b!367218 () Bool)

(declare-fun e!224758 () Bool)

(declare-fun tp_is_empty!8553 () Bool)

(assert (=> b!367218 (= e!224758 tp_is_empty!8553)))

(declare-fun b!367219 () Bool)

(declare-fun res!205553 () Bool)

(declare-fun e!224759 () Bool)

(assert (=> b!367219 (=> (not res!205553) (not e!224759))))

(declare-datatypes ((array!21065 0))(
  ( (array!21066 (arr!10001 (Array (_ BitVec 32) (_ BitVec 64))) (size!10353 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21065)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367219 (= res!205553 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367220 () Bool)

(declare-fun res!205551 () Bool)

(assert (=> b!367220 (=> (not res!205551) (not e!224759))))

(declare-datatypes ((List!5563 0))(
  ( (Nil!5560) (Cons!5559 (h!6415 (_ BitVec 64)) (t!10713 List!5563)) )
))
(declare-fun arrayNoDuplicates!0 (array!21065 (_ BitVec 32) List!5563) Bool)

(assert (=> b!367220 (= res!205551 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5560))))

(declare-fun b!367221 () Bool)

(declare-fun res!205558 () Bool)

(assert (=> b!367221 (=> (not res!205558) (not e!224759))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367221 (= res!205558 (or (= (select (arr!10001 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10001 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367222 () Bool)

(declare-fun res!205554 () Bool)

(assert (=> b!367222 (=> (not res!205554) (not e!224759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367222 (= res!205554 (validKeyInArray!0 k0!778))))

(declare-fun b!367223 () Bool)

(declare-fun e!224754 () Bool)

(assert (=> b!367223 (= e!224754 tp_is_empty!8553)))

(declare-fun b!367224 () Bool)

(declare-fun e!224756 () Bool)

(assert (=> b!367224 (= e!224756 false)))

(declare-fun lt!169347 () Bool)

(declare-fun lt!169346 () array!21065)

(assert (=> b!367224 (= lt!169347 (arrayNoDuplicates!0 lt!169346 #b00000000000000000000000000000000 Nil!5560))))

(declare-fun mapIsEmpty!14394 () Bool)

(declare-fun mapRes!14394 () Bool)

(assert (=> mapIsEmpty!14394 mapRes!14394))

(declare-fun res!205555 () Bool)

(assert (=> start!36778 (=> (not res!205555) (not e!224759))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36778 (= res!205555 (validMask!0 mask!970))))

(assert (=> start!36778 e!224759))

(assert (=> start!36778 true))

(declare-datatypes ((V!12509 0))(
  ( (V!12510 (val!4321 Int)) )
))
(declare-datatypes ((ValueCell!3933 0))(
  ( (ValueCellFull!3933 (v!6518 V!12509)) (EmptyCell!3933) )
))
(declare-datatypes ((array!21067 0))(
  ( (array!21068 (arr!10002 (Array (_ BitVec 32) ValueCell!3933)) (size!10354 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21067)

(declare-fun e!224757 () Bool)

(declare-fun array_inv!7394 (array!21067) Bool)

(assert (=> start!36778 (and (array_inv!7394 _values!506) e!224757)))

(declare-fun array_inv!7395 (array!21065) Bool)

(assert (=> start!36778 (array_inv!7395 _keys!658)))

(declare-fun mapNonEmpty!14394 () Bool)

(declare-fun tp!28470 () Bool)

(assert (=> mapNonEmpty!14394 (= mapRes!14394 (and tp!28470 e!224754))))

(declare-fun mapRest!14394 () (Array (_ BitVec 32) ValueCell!3933))

(declare-fun mapKey!14394 () (_ BitVec 32))

(declare-fun mapValue!14394 () ValueCell!3933)

(assert (=> mapNonEmpty!14394 (= (arr!10002 _values!506) (store mapRest!14394 mapKey!14394 mapValue!14394))))

(declare-fun b!367225 () Bool)

(declare-fun res!205559 () Bool)

(assert (=> b!367225 (=> (not res!205559) (not e!224759))))

(assert (=> b!367225 (= res!205559 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10353 _keys!658))))))

(declare-fun b!367226 () Bool)

(declare-fun res!205557 () Bool)

(assert (=> b!367226 (=> (not res!205557) (not e!224759))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367226 (= res!205557 (and (= (size!10354 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10353 _keys!658) (size!10354 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367227 () Bool)

(assert (=> b!367227 (= e!224759 e!224756)))

(declare-fun res!205552 () Bool)

(assert (=> b!367227 (=> (not res!205552) (not e!224756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21065 (_ BitVec 32)) Bool)

(assert (=> b!367227 (= res!205552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169346 mask!970))))

(assert (=> b!367227 (= lt!169346 (array!21066 (store (arr!10001 _keys!658) i!548 k0!778) (size!10353 _keys!658)))))

(declare-fun b!367228 () Bool)

(declare-fun res!205556 () Bool)

(assert (=> b!367228 (=> (not res!205556) (not e!224759))))

(assert (=> b!367228 (= res!205556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367229 () Bool)

(assert (=> b!367229 (= e!224757 (and e!224758 mapRes!14394))))

(declare-fun condMapEmpty!14394 () Bool)

(declare-fun mapDefault!14394 () ValueCell!3933)

(assert (=> b!367229 (= condMapEmpty!14394 (= (arr!10002 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3933)) mapDefault!14394)))))

(assert (= (and start!36778 res!205555) b!367226))

(assert (= (and b!367226 res!205557) b!367228))

(assert (= (and b!367228 res!205556) b!367220))

(assert (= (and b!367220 res!205551) b!367225))

(assert (= (and b!367225 res!205559) b!367222))

(assert (= (and b!367222 res!205554) b!367221))

(assert (= (and b!367221 res!205558) b!367219))

(assert (= (and b!367219 res!205553) b!367227))

(assert (= (and b!367227 res!205552) b!367224))

(assert (= (and b!367229 condMapEmpty!14394) mapIsEmpty!14394))

(assert (= (and b!367229 (not condMapEmpty!14394)) mapNonEmpty!14394))

(get-info :version)

(assert (= (and mapNonEmpty!14394 ((_ is ValueCellFull!3933) mapValue!14394)) b!367223))

(assert (= (and b!367229 ((_ is ValueCellFull!3933) mapDefault!14394)) b!367218))

(assert (= start!36778 b!367229))

(declare-fun m!364275 () Bool)

(assert (=> mapNonEmpty!14394 m!364275))

(declare-fun m!364277 () Bool)

(assert (=> b!367228 m!364277))

(declare-fun m!364279 () Bool)

(assert (=> b!367220 m!364279))

(declare-fun m!364281 () Bool)

(assert (=> b!367222 m!364281))

(declare-fun m!364283 () Bool)

(assert (=> b!367219 m!364283))

(declare-fun m!364285 () Bool)

(assert (=> start!36778 m!364285))

(declare-fun m!364287 () Bool)

(assert (=> start!36778 m!364287))

(declare-fun m!364289 () Bool)

(assert (=> start!36778 m!364289))

(declare-fun m!364291 () Bool)

(assert (=> b!367221 m!364291))

(declare-fun m!364293 () Bool)

(assert (=> b!367224 m!364293))

(declare-fun m!364295 () Bool)

(assert (=> b!367227 m!364295))

(declare-fun m!364297 () Bool)

(assert (=> b!367227 m!364297))

(check-sat (not b!367228) (not b!367219) tp_is_empty!8553 (not b!367227) (not b!367222) (not mapNonEmpty!14394) (not b!367220) (not start!36778) (not b!367224))
(check-sat)
