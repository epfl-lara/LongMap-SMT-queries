; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37224 () Bool)

(assert start!37224)

(declare-fun b_free!8351 () Bool)

(declare-fun b_next!8351 () Bool)

(assert (=> start!37224 (= b_free!8351 (not b_next!8351))))

(declare-fun tp!29768 () Bool)

(declare-fun b_and!15593 () Bool)

(assert (=> start!37224 (= tp!29768 b_and!15593)))

(declare-fun b!376342 () Bool)

(declare-fun res!212670 () Bool)

(declare-fun e!229209 () Bool)

(assert (=> b!376342 (=> (not res!212670) (not e!229209))))

(declare-datatypes ((array!21927 0))(
  ( (array!21928 (arr!10432 (Array (_ BitVec 32) (_ BitVec 64))) (size!10784 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21927)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376342 (= res!212670 (or (= (select (arr!10432 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10432 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376343 () Bool)

(declare-fun e!229211 () Bool)

(declare-fun e!229213 () Bool)

(assert (=> b!376343 (= e!229211 e!229213)))

(declare-fun res!212677 () Bool)

(assert (=> b!376343 (=> res!212677 e!229213)))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!376343 (= res!212677 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13103 0))(
  ( (V!13104 (val!4544 Int)) )
))
(declare-datatypes ((tuple2!6048 0))(
  ( (tuple2!6049 (_1!3035 (_ BitVec 64)) (_2!3035 V!13103)) )
))
(declare-datatypes ((List!5890 0))(
  ( (Nil!5887) (Cons!5886 (h!6742 tuple2!6048) (t!11040 List!5890)) )
))
(declare-datatypes ((ListLongMap!4961 0))(
  ( (ListLongMap!4962 (toList!2496 List!5890)) )
))
(declare-fun lt!174546 () ListLongMap!4961)

(declare-fun lt!174545 () ListLongMap!4961)

(assert (=> b!376343 (= lt!174546 lt!174545)))

(declare-fun lt!174555 () ListLongMap!4961)

(declare-fun lt!174547 () tuple2!6048)

(declare-fun +!842 (ListLongMap!4961 tuple2!6048) ListLongMap!4961)

(assert (=> b!376343 (= lt!174545 (+!842 lt!174555 lt!174547))))

(declare-fun lt!174548 () ListLongMap!4961)

(declare-fun lt!174550 () ListLongMap!4961)

(assert (=> b!376343 (= lt!174548 lt!174550)))

(declare-fun lt!174543 () ListLongMap!4961)

(assert (=> b!376343 (= lt!174550 (+!842 lt!174543 lt!174547))))

(declare-fun lt!174544 () ListLongMap!4961)

(assert (=> b!376343 (= lt!174546 (+!842 lt!174544 lt!174547))))

(declare-fun zeroValue!472 () V!13103)

(assert (=> b!376343 (= lt!174547 (tuple2!6049 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376344 () Bool)

(declare-fun e!229214 () Bool)

(declare-fun tp_is_empty!8999 () Bool)

(assert (=> b!376344 (= e!229214 tp_is_empty!8999)))

(declare-fun mapNonEmpty!15063 () Bool)

(declare-fun mapRes!15063 () Bool)

(declare-fun tp!29769 () Bool)

(declare-fun e!229212 () Bool)

(assert (=> mapNonEmpty!15063 (= mapRes!15063 (and tp!29769 e!229212))))

(declare-datatypes ((ValueCell!4156 0))(
  ( (ValueCellFull!4156 (v!6741 V!13103)) (EmptyCell!4156) )
))
(declare-datatypes ((array!21929 0))(
  ( (array!21930 (arr!10433 (Array (_ BitVec 32) ValueCell!4156)) (size!10785 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21929)

(declare-fun mapValue!15063 () ValueCell!4156)

(declare-fun mapKey!15063 () (_ BitVec 32))

(declare-fun mapRest!15063 () (Array (_ BitVec 32) ValueCell!4156))

(assert (=> mapNonEmpty!15063 (= (arr!10433 _values!506) (store mapRest!15063 mapKey!15063 mapValue!15063))))

(declare-fun mapIsEmpty!15063 () Bool)

(assert (=> mapIsEmpty!15063 mapRes!15063))

(declare-fun b!376345 () Bool)

(declare-fun res!212668 () Bool)

(declare-fun e!229207 () Bool)

(assert (=> b!376345 (=> (not res!212668) (not e!229207))))

(declare-fun lt!174553 () array!21927)

(declare-datatypes ((List!5891 0))(
  ( (Nil!5888) (Cons!5887 (h!6743 (_ BitVec 64)) (t!11041 List!5891)) )
))
(declare-fun arrayNoDuplicates!0 (array!21927 (_ BitVec 32) List!5891) Bool)

(assert (=> b!376345 (= res!212668 (arrayNoDuplicates!0 lt!174553 #b00000000000000000000000000000000 Nil!5888))))

(declare-fun b!376346 () Bool)

(declare-fun res!212673 () Bool)

(assert (=> b!376346 (=> (not res!212673) (not e!229209))))

(assert (=> b!376346 (= res!212673 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10784 _keys!658))))))

(declare-fun b!376347 () Bool)

(declare-fun res!212671 () Bool)

(assert (=> b!376347 (=> (not res!212671) (not e!229209))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!376347 (= res!212671 (and (= (size!10785 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10784 _keys!658) (size!10785 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376348 () Bool)

(assert (=> b!376348 (= e!229209 e!229207)))

(declare-fun res!212672 () Bool)

(assert (=> b!376348 (=> (not res!212672) (not e!229207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21927 (_ BitVec 32)) Bool)

(assert (=> b!376348 (= res!212672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174553 mask!970))))

(assert (=> b!376348 (= lt!174553 (array!21928 (store (arr!10432 _keys!658) i!548 k!778) (size!10784 _keys!658)))))

(declare-fun res!212669 () Bool)

(assert (=> start!37224 (=> (not res!212669) (not e!229209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37224 (= res!212669 (validMask!0 mask!970))))

(assert (=> start!37224 e!229209))

(declare-fun e!229210 () Bool)

(declare-fun array_inv!7688 (array!21929) Bool)

(assert (=> start!37224 (and (array_inv!7688 _values!506) e!229210)))

(assert (=> start!37224 tp!29768))

(assert (=> start!37224 true))

(assert (=> start!37224 tp_is_empty!8999))

(declare-fun array_inv!7689 (array!21927) Bool)

(assert (=> start!37224 (array_inv!7689 _keys!658)))

(declare-fun b!376341 () Bool)

(declare-fun res!212675 () Bool)

(assert (=> b!376341 (=> (not res!212675) (not e!229209))))

(assert (=> b!376341 (= res!212675 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5888))))

(declare-fun b!376349 () Bool)

(assert (=> b!376349 (= e!229213 true)))

(declare-fun lt!174552 () tuple2!6048)

(assert (=> b!376349 (= lt!174545 (+!842 lt!174550 lt!174552))))

(declare-fun v!373 () V!13103)

(declare-datatypes ((Unit!11590 0))(
  ( (Unit!11591) )
))
(declare-fun lt!174549 () Unit!11590)

(declare-fun addCommutativeForDiffKeys!257 (ListLongMap!4961 (_ BitVec 64) V!13103 (_ BitVec 64) V!13103) Unit!11590)

(assert (=> b!376349 (= lt!174549 (addCommutativeForDiffKeys!257 lt!174543 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376350 () Bool)

(declare-fun res!212674 () Bool)

(assert (=> b!376350 (=> (not res!212674) (not e!229209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376350 (= res!212674 (validKeyInArray!0 k!778))))

(declare-fun b!376351 () Bool)

(assert (=> b!376351 (= e!229207 (not e!229211))))

(declare-fun res!212678 () Bool)

(assert (=> b!376351 (=> res!212678 e!229211)))

(assert (=> b!376351 (= res!212678 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13103)

(declare-fun getCurrentListMap!1930 (array!21927 array!21929 (_ BitVec 32) (_ BitVec 32) V!13103 V!13103 (_ BitVec 32) Int) ListLongMap!4961)

(assert (=> b!376351 (= lt!174548 (getCurrentListMap!1930 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174551 () array!21929)

(assert (=> b!376351 (= lt!174546 (getCurrentListMap!1930 lt!174553 lt!174551 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376351 (and (= lt!174544 lt!174555) (= lt!174555 lt!174544))))

(assert (=> b!376351 (= lt!174555 (+!842 lt!174543 lt!174552))))

(assert (=> b!376351 (= lt!174552 (tuple2!6049 k!778 v!373))))

(declare-fun lt!174554 () Unit!11590)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!88 (array!21927 array!21929 (_ BitVec 32) (_ BitVec 32) V!13103 V!13103 (_ BitVec 32) (_ BitVec 64) V!13103 (_ BitVec 32) Int) Unit!11590)

(assert (=> b!376351 (= lt!174554 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!88 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!764 (array!21927 array!21929 (_ BitVec 32) (_ BitVec 32) V!13103 V!13103 (_ BitVec 32) Int) ListLongMap!4961)

(assert (=> b!376351 (= lt!174544 (getCurrentListMapNoExtraKeys!764 lt!174553 lt!174551 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376351 (= lt!174551 (array!21930 (store (arr!10433 _values!506) i!548 (ValueCellFull!4156 v!373)) (size!10785 _values!506)))))

(assert (=> b!376351 (= lt!174543 (getCurrentListMapNoExtraKeys!764 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376352 () Bool)

(declare-fun res!212676 () Bool)

(assert (=> b!376352 (=> (not res!212676) (not e!229209))))

(declare-fun arrayContainsKey!0 (array!21927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376352 (= res!212676 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!376353 () Bool)

(declare-fun res!212667 () Bool)

(assert (=> b!376353 (=> (not res!212667) (not e!229209))))

(assert (=> b!376353 (= res!212667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376354 () Bool)

(assert (=> b!376354 (= e!229210 (and e!229214 mapRes!15063))))

(declare-fun condMapEmpty!15063 () Bool)

(declare-fun mapDefault!15063 () ValueCell!4156)

