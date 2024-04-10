; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39120 () Bool)

(assert start!39120)

(declare-fun b_free!9387 () Bool)

(declare-fun b_next!9387 () Bool)

(assert (=> start!39120 (= b_free!9387 (not b_next!9387))))

(declare-fun tp!33689 () Bool)

(declare-fun b_and!16773 () Bool)

(assert (=> start!39120 (= tp!33689 b_and!16773)))

(declare-fun b!411312 () Bool)

(declare-fun e!246358 () Bool)

(declare-fun tp_is_empty!10539 () Bool)

(assert (=> b!411312 (= e!246358 tp_is_empty!10539)))

(declare-fun b!411313 () Bool)

(declare-fun e!246355 () Bool)

(assert (=> b!411313 (= e!246355 tp_is_empty!10539)))

(declare-fun b!411314 () Bool)

(declare-fun res!238588 () Bool)

(declare-fun e!246356 () Bool)

(assert (=> b!411314 (=> (not res!238588) (not e!246356))))

(declare-datatypes ((array!24939 0))(
  ( (array!24940 (arr!11919 (Array (_ BitVec 32) (_ BitVec 64))) (size!12271 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24939)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411314 (= res!238588 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411315 () Bool)

(declare-fun res!238589 () Bool)

(declare-fun e!246360 () Bool)

(assert (=> b!411315 (=> (not res!238589) (not e!246360))))

(declare-fun lt!189257 () array!24939)

(declare-datatypes ((List!6918 0))(
  ( (Nil!6915) (Cons!6914 (h!7770 (_ BitVec 64)) (t!12092 List!6918)) )
))
(declare-fun arrayNoDuplicates!0 (array!24939 (_ BitVec 32) List!6918) Bool)

(assert (=> b!411315 (= res!238589 (arrayNoDuplicates!0 lt!189257 #b00000000000000000000000000000000 Nil!6915))))

(declare-fun mapNonEmpty!17430 () Bool)

(declare-fun mapRes!17430 () Bool)

(declare-fun tp!33690 () Bool)

(assert (=> mapNonEmpty!17430 (= mapRes!17430 (and tp!33690 e!246358))))

(declare-datatypes ((V!15157 0))(
  ( (V!15158 (val!5314 Int)) )
))
(declare-datatypes ((ValueCell!4926 0))(
  ( (ValueCellFull!4926 (v!7561 V!15157)) (EmptyCell!4926) )
))
(declare-datatypes ((array!24941 0))(
  ( (array!24942 (arr!11920 (Array (_ BitVec 32) ValueCell!4926)) (size!12272 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24941)

(declare-fun mapValue!17430 () ValueCell!4926)

(declare-fun mapRest!17430 () (Array (_ BitVec 32) ValueCell!4926))

(declare-fun mapKey!17430 () (_ BitVec 32))

(assert (=> mapNonEmpty!17430 (= (arr!11920 _values!549) (store mapRest!17430 mapKey!17430 mapValue!17430))))

(declare-fun mapIsEmpty!17430 () Bool)

(assert (=> mapIsEmpty!17430 mapRes!17430))

(declare-fun b!411316 () Bool)

(declare-fun res!238598 () Bool)

(assert (=> b!411316 (=> (not res!238598) (not e!246356))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411316 (= res!238598 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12271 _keys!709))))))

(declare-fun b!411317 () Bool)

(declare-fun res!238599 () Bool)

(assert (=> b!411317 (=> (not res!238599) (not e!246356))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!411317 (= res!238599 (and (= (size!12272 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12271 _keys!709) (size!12272 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411318 () Bool)

(declare-fun e!246359 () Bool)

(assert (=> b!411318 (= e!246359 (and e!246355 mapRes!17430))))

(declare-fun condMapEmpty!17430 () Bool)

(declare-fun mapDefault!17430 () ValueCell!4926)

(assert (=> b!411318 (= condMapEmpty!17430 (= (arr!11920 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4926)) mapDefault!17430)))))

(declare-fun b!411319 () Bool)

(assert (=> b!411319 (= e!246360 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15157)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6894 0))(
  ( (tuple2!6895 (_1!3458 (_ BitVec 64)) (_2!3458 V!15157)) )
))
(declare-datatypes ((List!6919 0))(
  ( (Nil!6916) (Cons!6915 (h!7771 tuple2!6894) (t!12093 List!6919)) )
))
(declare-datatypes ((ListLongMap!5807 0))(
  ( (ListLongMap!5808 (toList!2919 List!6919)) )
))
(declare-fun lt!189255 () ListLongMap!5807)

(declare-fun zeroValue!515 () V!15157)

(declare-fun v!412 () V!15157)

(declare-fun getCurrentListMapNoExtraKeys!1127 (array!24939 array!24941 (_ BitVec 32) (_ BitVec 32) V!15157 V!15157 (_ BitVec 32) Int) ListLongMap!5807)

(assert (=> b!411319 (= lt!189255 (getCurrentListMapNoExtraKeys!1127 lt!189257 (array!24942 (store (arr!11920 _values!549) i!563 (ValueCellFull!4926 v!412)) (size!12272 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189256 () ListLongMap!5807)

(assert (=> b!411319 (= lt!189256 (getCurrentListMapNoExtraKeys!1127 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!238591 () Bool)

(assert (=> start!39120 (=> (not res!238591) (not e!246356))))

(assert (=> start!39120 (= res!238591 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12271 _keys!709))))))

(assert (=> start!39120 e!246356))

(assert (=> start!39120 tp_is_empty!10539))

(assert (=> start!39120 tp!33689))

(assert (=> start!39120 true))

(declare-fun array_inv!8696 (array!24941) Bool)

(assert (=> start!39120 (and (array_inv!8696 _values!549) e!246359)))

(declare-fun array_inv!8697 (array!24939) Bool)

(assert (=> start!39120 (array_inv!8697 _keys!709)))

(declare-fun b!411320 () Bool)

(declare-fun res!238593 () Bool)

(assert (=> b!411320 (=> (not res!238593) (not e!246356))))

(assert (=> b!411320 (= res!238593 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6915))))

(declare-fun b!411321 () Bool)

(declare-fun res!238596 () Bool)

(assert (=> b!411321 (=> (not res!238596) (not e!246356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411321 (= res!238596 (validKeyInArray!0 k0!794))))

(declare-fun b!411322 () Bool)

(declare-fun res!238594 () Bool)

(assert (=> b!411322 (=> (not res!238594) (not e!246356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411322 (= res!238594 (validMask!0 mask!1025))))

(declare-fun b!411323 () Bool)

(declare-fun res!238595 () Bool)

(assert (=> b!411323 (=> (not res!238595) (not e!246360))))

(assert (=> b!411323 (= res!238595 (bvsle from!863 i!563))))

(declare-fun b!411324 () Bool)

(declare-fun res!238597 () Bool)

(assert (=> b!411324 (=> (not res!238597) (not e!246356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24939 (_ BitVec 32)) Bool)

(assert (=> b!411324 (= res!238597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411325 () Bool)

(assert (=> b!411325 (= e!246356 e!246360)))

(declare-fun res!238590 () Bool)

(assert (=> b!411325 (=> (not res!238590) (not e!246360))))

(assert (=> b!411325 (= res!238590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189257 mask!1025))))

(assert (=> b!411325 (= lt!189257 (array!24940 (store (arr!11919 _keys!709) i!563 k0!794) (size!12271 _keys!709)))))

(declare-fun b!411326 () Bool)

(declare-fun res!238592 () Bool)

(assert (=> b!411326 (=> (not res!238592) (not e!246356))))

(assert (=> b!411326 (= res!238592 (or (= (select (arr!11919 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11919 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39120 res!238591) b!411322))

(assert (= (and b!411322 res!238594) b!411317))

(assert (= (and b!411317 res!238599) b!411324))

(assert (= (and b!411324 res!238597) b!411320))

(assert (= (and b!411320 res!238593) b!411316))

(assert (= (and b!411316 res!238598) b!411321))

(assert (= (and b!411321 res!238596) b!411326))

(assert (= (and b!411326 res!238592) b!411314))

(assert (= (and b!411314 res!238588) b!411325))

(assert (= (and b!411325 res!238590) b!411315))

(assert (= (and b!411315 res!238589) b!411323))

(assert (= (and b!411323 res!238595) b!411319))

(assert (= (and b!411318 condMapEmpty!17430) mapIsEmpty!17430))

(assert (= (and b!411318 (not condMapEmpty!17430)) mapNonEmpty!17430))

(get-info :version)

(assert (= (and mapNonEmpty!17430 ((_ is ValueCellFull!4926) mapValue!17430)) b!411312))

(assert (= (and b!411318 ((_ is ValueCellFull!4926) mapDefault!17430)) b!411313))

(assert (= start!39120 b!411318))

(declare-fun m!401503 () Bool)

(assert (=> b!411322 m!401503))

(declare-fun m!401505 () Bool)

(assert (=> b!411326 m!401505))

(declare-fun m!401507 () Bool)

(assert (=> b!411321 m!401507))

(declare-fun m!401509 () Bool)

(assert (=> b!411314 m!401509))

(declare-fun m!401511 () Bool)

(assert (=> b!411315 m!401511))

(declare-fun m!401513 () Bool)

(assert (=> b!411319 m!401513))

(declare-fun m!401515 () Bool)

(assert (=> b!411319 m!401515))

(declare-fun m!401517 () Bool)

(assert (=> b!411319 m!401517))

(declare-fun m!401519 () Bool)

(assert (=> b!411320 m!401519))

(declare-fun m!401521 () Bool)

(assert (=> b!411325 m!401521))

(declare-fun m!401523 () Bool)

(assert (=> b!411325 m!401523))

(declare-fun m!401525 () Bool)

(assert (=> start!39120 m!401525))

(declare-fun m!401527 () Bool)

(assert (=> start!39120 m!401527))

(declare-fun m!401529 () Bool)

(assert (=> b!411324 m!401529))

(declare-fun m!401531 () Bool)

(assert (=> mapNonEmpty!17430 m!401531))

(check-sat (not b!411319) (not b!411320) (not b_next!9387) (not b!411315) (not b!411325) b_and!16773 tp_is_empty!10539 (not b!411321) (not start!39120) (not mapNonEmpty!17430) (not b!411314) (not b!411322) (not b!411324))
(check-sat b_and!16773 (not b_next!9387))
