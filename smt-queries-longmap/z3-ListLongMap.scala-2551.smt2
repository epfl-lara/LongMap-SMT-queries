; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39110 () Bool)

(assert start!39110)

(declare-fun b_free!9391 () Bool)

(declare-fun b_next!9391 () Bool)

(assert (=> start!39110 (= b_free!9391 (not b_next!9391))))

(declare-fun tp!33702 () Bool)

(declare-fun b_and!16791 () Bool)

(assert (=> start!39110 (= tp!33702 b_and!16791)))

(declare-fun b!411353 () Bool)

(declare-fun e!246362 () Bool)

(declare-fun tp_is_empty!10543 () Bool)

(assert (=> b!411353 (= e!246362 tp_is_empty!10543)))

(declare-fun b!411354 () Bool)

(declare-fun res!238659 () Bool)

(declare-fun e!246360 () Bool)

(assert (=> b!411354 (=> (not res!238659) (not e!246360))))

(declare-datatypes ((array!24950 0))(
  ( (array!24951 (arr!11924 (Array (_ BitVec 32) (_ BitVec 64))) (size!12276 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24950)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411354 (= res!238659 (or (= (select (arr!11924 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11924 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411355 () Bool)

(declare-fun e!246364 () Bool)

(assert (=> b!411355 (= e!246364 tp_is_empty!10543)))

(declare-fun b!411356 () Bool)

(declare-fun res!238658 () Bool)

(assert (=> b!411356 (=> (not res!238658) (not e!246360))))

(assert (=> b!411356 (= res!238658 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12276 _keys!709))))))

(declare-fun b!411357 () Bool)

(declare-fun e!246363 () Bool)

(assert (=> b!411357 (= e!246360 e!246363)))

(declare-fun res!238664 () Bool)

(assert (=> b!411357 (=> (not res!238664) (not e!246363))))

(declare-fun lt!189292 () array!24950)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24950 (_ BitVec 32)) Bool)

(assert (=> b!411357 (= res!238664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189292 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!411357 (= lt!189292 (array!24951 (store (arr!11924 _keys!709) i!563 k0!794) (size!12276 _keys!709)))))

(declare-fun b!411358 () Bool)

(assert (=> b!411358 (= e!246363 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15163 0))(
  ( (V!15164 (val!5316 Int)) )
))
(declare-datatypes ((tuple2!6768 0))(
  ( (tuple2!6769 (_1!3395 (_ BitVec 64)) (_2!3395 V!15163)) )
))
(declare-datatypes ((List!6786 0))(
  ( (Nil!6783) (Cons!6782 (h!7638 tuple2!6768) (t!11952 List!6786)) )
))
(declare-datatypes ((ListLongMap!5683 0))(
  ( (ListLongMap!5684 (toList!2857 List!6786)) )
))
(declare-fun lt!189293 () ListLongMap!5683)

(declare-fun minValue!515 () V!15163)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4928 0))(
  ( (ValueCellFull!4928 (v!7564 V!15163)) (EmptyCell!4928) )
))
(declare-datatypes ((array!24952 0))(
  ( (array!24953 (arr!11925 (Array (_ BitVec 32) ValueCell!4928)) (size!12277 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24952)

(declare-fun zeroValue!515 () V!15163)

(declare-fun v!412 () V!15163)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1109 (array!24950 array!24952 (_ BitVec 32) (_ BitVec 32) V!15163 V!15163 (_ BitVec 32) Int) ListLongMap!5683)

(assert (=> b!411358 (= lt!189293 (getCurrentListMapNoExtraKeys!1109 lt!189292 (array!24953 (store (arr!11925 _values!549) i!563 (ValueCellFull!4928 v!412)) (size!12277 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189294 () ListLongMap!5683)

(assert (=> b!411358 (= lt!189294 (getCurrentListMapNoExtraKeys!1109 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411359 () Bool)

(declare-fun res!238661 () Bool)

(assert (=> b!411359 (=> (not res!238661) (not e!246360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411359 (= res!238661 (validKeyInArray!0 k0!794))))

(declare-fun b!411360 () Bool)

(declare-fun res!238665 () Bool)

(assert (=> b!411360 (=> (not res!238665) (not e!246360))))

(assert (=> b!411360 (= res!238665 (and (= (size!12277 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12276 _keys!709) (size!12277 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!238657 () Bool)

(assert (=> start!39110 (=> (not res!238657) (not e!246360))))

(assert (=> start!39110 (= res!238657 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12276 _keys!709))))))

(assert (=> start!39110 e!246360))

(assert (=> start!39110 tp_is_empty!10543))

(assert (=> start!39110 tp!33702))

(assert (=> start!39110 true))

(declare-fun e!246359 () Bool)

(declare-fun array_inv!8778 (array!24952) Bool)

(assert (=> start!39110 (and (array_inv!8778 _values!549) e!246359)))

(declare-fun array_inv!8779 (array!24950) Bool)

(assert (=> start!39110 (array_inv!8779 _keys!709)))

(declare-fun b!411361 () Bool)

(declare-fun res!238668 () Bool)

(assert (=> b!411361 (=> (not res!238668) (not e!246363))))

(declare-datatypes ((List!6787 0))(
  ( (Nil!6784) (Cons!6783 (h!7639 (_ BitVec 64)) (t!11953 List!6787)) )
))
(declare-fun arrayNoDuplicates!0 (array!24950 (_ BitVec 32) List!6787) Bool)

(assert (=> b!411361 (= res!238668 (arrayNoDuplicates!0 lt!189292 #b00000000000000000000000000000000 Nil!6784))))

(declare-fun b!411362 () Bool)

(declare-fun res!238662 () Bool)

(assert (=> b!411362 (=> (not res!238662) (not e!246360))))

(declare-fun arrayContainsKey!0 (array!24950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411362 (= res!238662 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411363 () Bool)

(declare-fun res!238666 () Bool)

(assert (=> b!411363 (=> (not res!238666) (not e!246360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411363 (= res!238666 (validMask!0 mask!1025))))

(declare-fun b!411364 () Bool)

(declare-fun mapRes!17436 () Bool)

(assert (=> b!411364 (= e!246359 (and e!246364 mapRes!17436))))

(declare-fun condMapEmpty!17436 () Bool)

(declare-fun mapDefault!17436 () ValueCell!4928)

(assert (=> b!411364 (= condMapEmpty!17436 (= (arr!11925 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4928)) mapDefault!17436)))))

(declare-fun mapNonEmpty!17436 () Bool)

(declare-fun tp!33701 () Bool)

(assert (=> mapNonEmpty!17436 (= mapRes!17436 (and tp!33701 e!246362))))

(declare-fun mapRest!17436 () (Array (_ BitVec 32) ValueCell!4928))

(declare-fun mapValue!17436 () ValueCell!4928)

(declare-fun mapKey!17436 () (_ BitVec 32))

(assert (=> mapNonEmpty!17436 (= (arr!11925 _values!549) (store mapRest!17436 mapKey!17436 mapValue!17436))))

(declare-fun b!411365 () Bool)

(declare-fun res!238667 () Bool)

(assert (=> b!411365 (=> (not res!238667) (not e!246363))))

(assert (=> b!411365 (= res!238667 (bvsle from!863 i!563))))

(declare-fun b!411366 () Bool)

(declare-fun res!238660 () Bool)

(assert (=> b!411366 (=> (not res!238660) (not e!246360))))

(assert (=> b!411366 (= res!238660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411367 () Bool)

(declare-fun res!238663 () Bool)

(assert (=> b!411367 (=> (not res!238663) (not e!246360))))

(assert (=> b!411367 (= res!238663 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6784))))

(declare-fun mapIsEmpty!17436 () Bool)

(assert (=> mapIsEmpty!17436 mapRes!17436))

(assert (= (and start!39110 res!238657) b!411363))

(assert (= (and b!411363 res!238666) b!411360))

(assert (= (and b!411360 res!238665) b!411366))

(assert (= (and b!411366 res!238660) b!411367))

(assert (= (and b!411367 res!238663) b!411356))

(assert (= (and b!411356 res!238658) b!411359))

(assert (= (and b!411359 res!238661) b!411354))

(assert (= (and b!411354 res!238659) b!411362))

(assert (= (and b!411362 res!238662) b!411357))

(assert (= (and b!411357 res!238664) b!411361))

(assert (= (and b!411361 res!238668) b!411365))

(assert (= (and b!411365 res!238667) b!411358))

(assert (= (and b!411364 condMapEmpty!17436) mapIsEmpty!17436))

(assert (= (and b!411364 (not condMapEmpty!17436)) mapNonEmpty!17436))

(get-info :version)

(assert (= (and mapNonEmpty!17436 ((_ is ValueCellFull!4928) mapValue!17436)) b!411353))

(assert (= (and b!411364 ((_ is ValueCellFull!4928) mapDefault!17436)) b!411355))

(assert (= start!39110 b!411364))

(declare-fun m!401793 () Bool)

(assert (=> b!411366 m!401793))

(declare-fun m!401795 () Bool)

(assert (=> mapNonEmpty!17436 m!401795))

(declare-fun m!401797 () Bool)

(assert (=> start!39110 m!401797))

(declare-fun m!401799 () Bool)

(assert (=> start!39110 m!401799))

(declare-fun m!401801 () Bool)

(assert (=> b!411361 m!401801))

(declare-fun m!401803 () Bool)

(assert (=> b!411362 m!401803))

(declare-fun m!401805 () Bool)

(assert (=> b!411359 m!401805))

(declare-fun m!401807 () Bool)

(assert (=> b!411358 m!401807))

(declare-fun m!401809 () Bool)

(assert (=> b!411358 m!401809))

(declare-fun m!401811 () Bool)

(assert (=> b!411358 m!401811))

(declare-fun m!401813 () Bool)

(assert (=> b!411367 m!401813))

(declare-fun m!401815 () Bool)

(assert (=> b!411357 m!401815))

(declare-fun m!401817 () Bool)

(assert (=> b!411357 m!401817))

(declare-fun m!401819 () Bool)

(assert (=> b!411363 m!401819))

(declare-fun m!401821 () Bool)

(assert (=> b!411354 m!401821))

(check-sat (not start!39110) (not b!411366) (not b!411362) tp_is_empty!10543 (not b_next!9391) (not b!411363) (not mapNonEmpty!17436) b_and!16791 (not b!411367) (not b!411357) (not b!411358) (not b!411359) (not b!411361))
(check-sat b_and!16791 (not b_next!9391))
