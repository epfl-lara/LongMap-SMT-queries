; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36618 () Bool)

(assert start!36618)

(declare-fun b!365347 () Bool)

(declare-fun res!204295 () Bool)

(declare-fun e!223731 () Bool)

(assert (=> b!365347 (=> (not res!204295) (not e!223731))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12395 0))(
  ( (V!12396 (val!4278 Int)) )
))
(declare-datatypes ((ValueCell!3890 0))(
  ( (ValueCellFull!3890 (v!6468 V!12395)) (EmptyCell!3890) )
))
(declare-datatypes ((array!20873 0))(
  ( (array!20874 (arr!9909 (Array (_ BitVec 32) ValueCell!3890)) (size!10262 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20873)

(declare-datatypes ((array!20875 0))(
  ( (array!20876 (arr!9910 (Array (_ BitVec 32) (_ BitVec 64))) (size!10263 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20875)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!365347 (= res!204295 (and (= (size!10262 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10263 _keys!658) (size!10262 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!204300 () Bool)

(assert (=> start!36618 (=> (not res!204300) (not e!223731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36618 (= res!204300 (validMask!0 mask!970))))

(assert (=> start!36618 e!223731))

(assert (=> start!36618 true))

(declare-fun e!223730 () Bool)

(declare-fun array_inv!7348 (array!20873) Bool)

(assert (=> start!36618 (and (array_inv!7348 _values!506) e!223730)))

(declare-fun array_inv!7349 (array!20875) Bool)

(assert (=> start!36618 (array_inv!7349 _keys!658)))

(declare-fun b!365348 () Bool)

(declare-fun e!223732 () Bool)

(declare-fun tp_is_empty!8467 () Bool)

(assert (=> b!365348 (= e!223732 tp_is_empty!8467)))

(declare-fun b!365349 () Bool)

(declare-fun res!204298 () Bool)

(assert (=> b!365349 (=> (not res!204298) (not e!223731))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!365349 (= res!204298 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10263 _keys!658))))))

(declare-fun b!365350 () Bool)

(declare-fun e!223733 () Bool)

(declare-fun mapRes!14253 () Bool)

(assert (=> b!365350 (= e!223730 (and e!223733 mapRes!14253))))

(declare-fun condMapEmpty!14253 () Bool)

(declare-fun mapDefault!14253 () ValueCell!3890)

(assert (=> b!365350 (= condMapEmpty!14253 (= (arr!9909 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3890)) mapDefault!14253)))))

(declare-fun mapNonEmpty!14253 () Bool)

(declare-fun tp!28329 () Bool)

(assert (=> mapNonEmpty!14253 (= mapRes!14253 (and tp!28329 e!223732))))

(declare-fun mapRest!14253 () (Array (_ BitVec 32) ValueCell!3890))

(declare-fun mapKey!14253 () (_ BitVec 32))

(declare-fun mapValue!14253 () ValueCell!3890)

(assert (=> mapNonEmpty!14253 (= (arr!9909 _values!506) (store mapRest!14253 mapKey!14253 mapValue!14253))))

(declare-fun b!365351 () Bool)

(declare-fun res!204296 () Bool)

(assert (=> b!365351 (=> (not res!204296) (not e!223731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20875 (_ BitVec 32)) Bool)

(assert (=> b!365351 (= res!204296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365352 () Bool)

(assert (=> b!365352 (= e!223733 tp_is_empty!8467)))

(declare-fun b!365353 () Bool)

(declare-fun res!204297 () Bool)

(assert (=> b!365353 (=> (not res!204297) (not e!223731))))

(declare-datatypes ((List!5496 0))(
  ( (Nil!5493) (Cons!5492 (h!6348 (_ BitVec 64)) (t!10637 List!5496)) )
))
(declare-fun arrayNoDuplicates!0 (array!20875 (_ BitVec 32) List!5496) Bool)

(assert (=> b!365353 (= res!204297 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5493))))

(declare-fun b!365354 () Bool)

(assert (=> b!365354 (= e!223731 (and (or (= (select (arr!9910 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9910 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge #b00000000000000000000000000000000 (size!10263 _keys!658))))))

(declare-fun b!365355 () Bool)

(declare-fun res!204299 () Bool)

(assert (=> b!365355 (=> (not res!204299) (not e!223731))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365355 (= res!204299 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!14253 () Bool)

(assert (=> mapIsEmpty!14253 mapRes!14253))

(assert (= (and start!36618 res!204300) b!365347))

(assert (= (and b!365347 res!204295) b!365351))

(assert (= (and b!365351 res!204296) b!365353))

(assert (= (and b!365353 res!204297) b!365349))

(assert (= (and b!365349 res!204298) b!365355))

(assert (= (and b!365355 res!204299) b!365354))

(assert (= (and b!365350 condMapEmpty!14253) mapIsEmpty!14253))

(assert (= (and b!365350 (not condMapEmpty!14253)) mapNonEmpty!14253))

(get-info :version)

(assert (= (and mapNonEmpty!14253 ((_ is ValueCellFull!3890) mapValue!14253)) b!365348))

(assert (= (and b!365350 ((_ is ValueCellFull!3890) mapDefault!14253)) b!365352))

(assert (= start!36618 b!365350))

(declare-fun m!362543 () Bool)

(assert (=> b!365353 m!362543))

(declare-fun m!362545 () Bool)

(assert (=> mapNonEmpty!14253 m!362545))

(declare-fun m!362547 () Bool)

(assert (=> b!365354 m!362547))

(declare-fun m!362549 () Bool)

(assert (=> start!36618 m!362549))

(declare-fun m!362551 () Bool)

(assert (=> start!36618 m!362551))

(declare-fun m!362553 () Bool)

(assert (=> start!36618 m!362553))

(declare-fun m!362555 () Bool)

(assert (=> b!365355 m!362555))

(declare-fun m!362557 () Bool)

(assert (=> b!365351 m!362557))

(check-sat tp_is_empty!8467 (not start!36618) (not b!365355) (not b!365351) (not b!365353) (not mapNonEmpty!14253))
(check-sat)
