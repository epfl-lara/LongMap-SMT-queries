; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36886 () Bool)

(assert start!36886)

(declare-fun b_free!8013 () Bool)

(declare-fun b_next!8013 () Bool)

(assert (=> start!36886 (= b_free!8013 (not b_next!8013))))

(declare-fun tp!28754 () Bool)

(declare-fun b_and!15255 () Bool)

(assert (=> start!36886 (= tp!28754 b_and!15255)))

(declare-fun b!369293 () Bool)

(declare-fun res!207146 () Bool)

(declare-fun e!225726 () Bool)

(assert (=> b!369293 (=> (not res!207146) (not e!225726))))

(declare-datatypes ((array!21273 0))(
  ( (array!21274 (arr!10105 (Array (_ BitVec 32) (_ BitVec 64))) (size!10457 (_ BitVec 32))) )
))
(declare-fun lt!169704 () array!21273)

(declare-datatypes ((List!5636 0))(
  ( (Nil!5633) (Cons!5632 (h!6488 (_ BitVec 64)) (t!10786 List!5636)) )
))
(declare-fun arrayNoDuplicates!0 (array!21273 (_ BitVec 32) List!5636) Bool)

(assert (=> b!369293 (= res!207146 (arrayNoDuplicates!0 lt!169704 #b00000000000000000000000000000000 Nil!5633))))

(declare-fun b!369294 () Bool)

(declare-fun res!207147 () Bool)

(declare-fun e!225727 () Bool)

(assert (=> b!369294 (=> (not res!207147) (not e!225727))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369294 (= res!207147 (validKeyInArray!0 k0!778))))

(declare-fun b!369295 () Bool)

(declare-fun res!207148 () Bool)

(assert (=> b!369295 (=> (not res!207148) (not e!225727))))

(declare-fun _keys!658 () array!21273)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21273 (_ BitVec 32)) Bool)

(assert (=> b!369295 (= res!207148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!207140 () Bool)

(assert (=> start!36886 (=> (not res!207140) (not e!225727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36886 (= res!207140 (validMask!0 mask!970))))

(assert (=> start!36886 e!225727))

(declare-datatypes ((V!12653 0))(
  ( (V!12654 (val!4375 Int)) )
))
(declare-datatypes ((ValueCell!3987 0))(
  ( (ValueCellFull!3987 (v!6572 V!12653)) (EmptyCell!3987) )
))
(declare-datatypes ((array!21275 0))(
  ( (array!21276 (arr!10106 (Array (_ BitVec 32) ValueCell!3987)) (size!10458 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21275)

(declare-fun e!225730 () Bool)

(declare-fun array_inv!7468 (array!21275) Bool)

(assert (=> start!36886 (and (array_inv!7468 _values!506) e!225730)))

(assert (=> start!36886 tp!28754))

(assert (=> start!36886 true))

(declare-fun tp_is_empty!8661 () Bool)

(assert (=> start!36886 tp_is_empty!8661))

(declare-fun array_inv!7469 (array!21273) Bool)

(assert (=> start!36886 (array_inv!7469 _keys!658)))

(declare-fun b!369296 () Bool)

(declare-fun res!207141 () Bool)

(assert (=> b!369296 (=> (not res!207141) (not e!225727))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!369296 (= res!207141 (and (= (size!10458 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10457 _keys!658) (size!10458 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14556 () Bool)

(declare-fun mapRes!14556 () Bool)

(assert (=> mapIsEmpty!14556 mapRes!14556))

(declare-fun b!369297 () Bool)

(declare-fun e!225731 () Bool)

(assert (=> b!369297 (= e!225730 (and e!225731 mapRes!14556))))

(declare-fun condMapEmpty!14556 () Bool)

(declare-fun mapDefault!14556 () ValueCell!3987)

(assert (=> b!369297 (= condMapEmpty!14556 (= (arr!10106 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3987)) mapDefault!14556)))))

(declare-fun b!369298 () Bool)

(declare-fun res!207144 () Bool)

(assert (=> b!369298 (=> (not res!207144) (not e!225727))))

(declare-fun arrayContainsKey!0 (array!21273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369298 (= res!207144 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369299 () Bool)

(declare-fun res!207149 () Bool)

(assert (=> b!369299 (=> (not res!207149) (not e!225727))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369299 (= res!207149 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10457 _keys!658))))))

(declare-fun b!369300 () Bool)

(declare-fun res!207143 () Bool)

(assert (=> b!369300 (=> (not res!207143) (not e!225727))))

(assert (=> b!369300 (= res!207143 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5633))))

(declare-fun b!369301 () Bool)

(assert (=> b!369301 (= e!225731 tp_is_empty!8661)))

(declare-fun b!369302 () Bool)

(assert (=> b!369302 (= e!225727 e!225726)))

(declare-fun res!207142 () Bool)

(assert (=> b!369302 (=> (not res!207142) (not e!225726))))

(assert (=> b!369302 (= res!207142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169704 mask!970))))

(assert (=> b!369302 (= lt!169704 (array!21274 (store (arr!10105 _keys!658) i!548 k0!778) (size!10457 _keys!658)))))

(declare-fun b!369303 () Bool)

(declare-fun res!207145 () Bool)

(assert (=> b!369303 (=> (not res!207145) (not e!225727))))

(assert (=> b!369303 (= res!207145 (or (= (select (arr!10105 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10105 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369304 () Bool)

(declare-fun e!225728 () Bool)

(assert (=> b!369304 (= e!225728 tp_is_empty!8661)))

(declare-fun b!369305 () Bool)

(assert (=> b!369305 (= e!225726 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5802 0))(
  ( (tuple2!5803 (_1!2912 (_ BitVec 64)) (_2!2912 V!12653)) )
))
(declare-datatypes ((List!5637 0))(
  ( (Nil!5634) (Cons!5633 (h!6489 tuple2!5802) (t!10787 List!5637)) )
))
(declare-datatypes ((ListLongMap!4715 0))(
  ( (ListLongMap!4716 (toList!2373 List!5637)) )
))
(declare-fun lt!169702 () ListLongMap!4715)

(declare-fun zeroValue!472 () V!12653)

(declare-fun v!373 () V!12653)

(declare-fun minValue!472 () V!12653)

(declare-fun getCurrentListMapNoExtraKeys!650 (array!21273 array!21275 (_ BitVec 32) (_ BitVec 32) V!12653 V!12653 (_ BitVec 32) Int) ListLongMap!4715)

(assert (=> b!369305 (= lt!169702 (getCurrentListMapNoExtraKeys!650 lt!169704 (array!21276 (store (arr!10106 _values!506) i!548 (ValueCellFull!3987 v!373)) (size!10458 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169703 () ListLongMap!4715)

(assert (=> b!369305 (= lt!169703 (getCurrentListMapNoExtraKeys!650 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14556 () Bool)

(declare-fun tp!28755 () Bool)

(assert (=> mapNonEmpty!14556 (= mapRes!14556 (and tp!28755 e!225728))))

(declare-fun mapKey!14556 () (_ BitVec 32))

(declare-fun mapRest!14556 () (Array (_ BitVec 32) ValueCell!3987))

(declare-fun mapValue!14556 () ValueCell!3987)

(assert (=> mapNonEmpty!14556 (= (arr!10106 _values!506) (store mapRest!14556 mapKey!14556 mapValue!14556))))

(assert (= (and start!36886 res!207140) b!369296))

(assert (= (and b!369296 res!207141) b!369295))

(assert (= (and b!369295 res!207148) b!369300))

(assert (= (and b!369300 res!207143) b!369299))

(assert (= (and b!369299 res!207149) b!369294))

(assert (= (and b!369294 res!207147) b!369303))

(assert (= (and b!369303 res!207145) b!369298))

(assert (= (and b!369298 res!207144) b!369302))

(assert (= (and b!369302 res!207142) b!369293))

(assert (= (and b!369293 res!207146) b!369305))

(assert (= (and b!369297 condMapEmpty!14556) mapIsEmpty!14556))

(assert (= (and b!369297 (not condMapEmpty!14556)) mapNonEmpty!14556))

(get-info :version)

(assert (= (and mapNonEmpty!14556 ((_ is ValueCellFull!3987) mapValue!14556)) b!369304))

(assert (= (and b!369297 ((_ is ValueCellFull!3987) mapDefault!14556)) b!369301))

(assert (= start!36886 b!369297))

(declare-fun m!365703 () Bool)

(assert (=> b!369293 m!365703))

(declare-fun m!365705 () Bool)

(assert (=> start!36886 m!365705))

(declare-fun m!365707 () Bool)

(assert (=> start!36886 m!365707))

(declare-fun m!365709 () Bool)

(assert (=> start!36886 m!365709))

(declare-fun m!365711 () Bool)

(assert (=> b!369298 m!365711))

(declare-fun m!365713 () Bool)

(assert (=> b!369305 m!365713))

(declare-fun m!365715 () Bool)

(assert (=> b!369305 m!365715))

(declare-fun m!365717 () Bool)

(assert (=> b!369305 m!365717))

(declare-fun m!365719 () Bool)

(assert (=> b!369295 m!365719))

(declare-fun m!365721 () Bool)

(assert (=> b!369300 m!365721))

(declare-fun m!365723 () Bool)

(assert (=> b!369303 m!365723))

(declare-fun m!365725 () Bool)

(assert (=> mapNonEmpty!14556 m!365725))

(declare-fun m!365727 () Bool)

(assert (=> b!369302 m!365727))

(declare-fun m!365729 () Bool)

(assert (=> b!369302 m!365729))

(declare-fun m!365731 () Bool)

(assert (=> b!369294 m!365731))

(check-sat (not b!369305) (not b!369294) (not b_next!8013) tp_is_empty!8661 (not b!369302) (not start!36886) (not b!369293) (not mapNonEmpty!14556) (not b!369300) b_and!15255 (not b!369298) (not b!369295))
(check-sat b_and!15255 (not b_next!8013))
