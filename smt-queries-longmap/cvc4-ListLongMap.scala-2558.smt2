; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39170 () Bool)

(assert start!39170)

(declare-fun b_free!9437 () Bool)

(declare-fun b_next!9437 () Bool)

(assert (=> start!39170 (= b_free!9437 (not b_next!9437))))

(declare-fun tp!33840 () Bool)

(declare-fun b_and!16823 () Bool)

(assert (=> start!39170 (= tp!33840 b_and!16823)))

(declare-fun b!412437 () Bool)

(declare-fun e!246810 () Bool)

(assert (=> b!412437 (= e!246810 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15223 0))(
  ( (V!15224 (val!5339 Int)) )
))
(declare-fun minValue!515 () V!15223)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6928 0))(
  ( (tuple2!6929 (_1!3475 (_ BitVec 64)) (_2!3475 V!15223)) )
))
(declare-datatypes ((List!6954 0))(
  ( (Nil!6951) (Cons!6950 (h!7806 tuple2!6928) (t!12128 List!6954)) )
))
(declare-datatypes ((ListLongMap!5841 0))(
  ( (ListLongMap!5842 (toList!2936 List!6954)) )
))
(declare-fun lt!189482 () ListLongMap!5841)

(declare-datatypes ((ValueCell!4951 0))(
  ( (ValueCellFull!4951 (v!7586 V!15223)) (EmptyCell!4951) )
))
(declare-datatypes ((array!25039 0))(
  ( (array!25040 (arr!11969 (Array (_ BitVec 32) ValueCell!4951)) (size!12321 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25039)

(declare-datatypes ((array!25041 0))(
  ( (array!25042 (arr!11970 (Array (_ BitVec 32) (_ BitVec 64))) (size!12322 (_ BitVec 32))) )
))
(declare-fun lt!189480 () array!25041)

(declare-fun zeroValue!515 () V!15223)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15223)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1144 (array!25041 array!25039 (_ BitVec 32) (_ BitVec 32) V!15223 V!15223 (_ BitVec 32) Int) ListLongMap!5841)

(assert (=> b!412437 (= lt!189482 (getCurrentListMapNoExtraKeys!1144 lt!189480 (array!25040 (store (arr!11969 _values!549) i!563 (ValueCellFull!4951 v!412)) (size!12321 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _keys!709 () array!25041)

(declare-fun lt!189481 () ListLongMap!5841)

(assert (=> b!412437 (= lt!189481 (getCurrentListMapNoExtraKeys!1144 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412438 () Bool)

(declare-fun e!246805 () Bool)

(declare-fun tp_is_empty!10589 () Bool)

(assert (=> b!412438 (= e!246805 tp_is_empty!10589)))

(declare-fun mapNonEmpty!17505 () Bool)

(declare-fun mapRes!17505 () Bool)

(declare-fun tp!33839 () Bool)

(declare-fun e!246807 () Bool)

(assert (=> mapNonEmpty!17505 (= mapRes!17505 (and tp!33839 e!246807))))

(declare-fun mapValue!17505 () ValueCell!4951)

(declare-fun mapKey!17505 () (_ BitVec 32))

(declare-fun mapRest!17505 () (Array (_ BitVec 32) ValueCell!4951))

(assert (=> mapNonEmpty!17505 (= (arr!11969 _values!549) (store mapRest!17505 mapKey!17505 mapValue!17505))))

(declare-fun b!412439 () Bool)

(declare-fun res!239491 () Bool)

(declare-fun e!246809 () Bool)

(assert (=> b!412439 (=> (not res!239491) (not e!246809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412439 (= res!239491 (validMask!0 mask!1025))))

(declare-fun b!412440 () Bool)

(declare-fun res!239498 () Bool)

(assert (=> b!412440 (=> (not res!239498) (not e!246809))))

(assert (=> b!412440 (= res!239498 (or (= (select (arr!11970 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11970 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412441 () Bool)

(declare-fun res!239494 () Bool)

(assert (=> b!412441 (=> (not res!239494) (not e!246809))))

(assert (=> b!412441 (= res!239494 (and (= (size!12321 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12322 _keys!709) (size!12321 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412442 () Bool)

(declare-fun res!239489 () Bool)

(assert (=> b!412442 (=> (not res!239489) (not e!246809))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412442 (= res!239489 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!412443 () Bool)

(declare-fun res!239492 () Bool)

(assert (=> b!412443 (=> (not res!239492) (not e!246809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412443 (= res!239492 (validKeyInArray!0 k!794))))

(declare-fun b!412444 () Bool)

(declare-fun res!239493 () Bool)

(assert (=> b!412444 (=> (not res!239493) (not e!246809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25041 (_ BitVec 32)) Bool)

(assert (=> b!412444 (= res!239493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412445 () Bool)

(assert (=> b!412445 (= e!246809 e!246810)))

(declare-fun res!239497 () Bool)

(assert (=> b!412445 (=> (not res!239497) (not e!246810))))

(assert (=> b!412445 (= res!239497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189480 mask!1025))))

(assert (=> b!412445 (= lt!189480 (array!25042 (store (arr!11970 _keys!709) i!563 k!794) (size!12322 _keys!709)))))

(declare-fun b!412446 () Bool)

(declare-fun res!239499 () Bool)

(assert (=> b!412446 (=> (not res!239499) (not e!246810))))

(declare-datatypes ((List!6955 0))(
  ( (Nil!6952) (Cons!6951 (h!7807 (_ BitVec 64)) (t!12129 List!6955)) )
))
(declare-fun arrayNoDuplicates!0 (array!25041 (_ BitVec 32) List!6955) Bool)

(assert (=> b!412446 (= res!239499 (arrayNoDuplicates!0 lt!189480 #b00000000000000000000000000000000 Nil!6952))))

(declare-fun mapIsEmpty!17505 () Bool)

(assert (=> mapIsEmpty!17505 mapRes!17505))

(declare-fun b!412447 () Bool)

(declare-fun res!239488 () Bool)

(assert (=> b!412447 (=> (not res!239488) (not e!246809))))

(assert (=> b!412447 (= res!239488 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12322 _keys!709))))))

(declare-fun b!412448 () Bool)

(assert (=> b!412448 (= e!246807 tp_is_empty!10589)))

(declare-fun res!239495 () Bool)

(assert (=> start!39170 (=> (not res!239495) (not e!246809))))

(assert (=> start!39170 (= res!239495 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12322 _keys!709))))))

(assert (=> start!39170 e!246809))

(assert (=> start!39170 tp_is_empty!10589))

(assert (=> start!39170 tp!33840))

(assert (=> start!39170 true))

(declare-fun e!246808 () Bool)

(declare-fun array_inv!8726 (array!25039) Bool)

(assert (=> start!39170 (and (array_inv!8726 _values!549) e!246808)))

(declare-fun array_inv!8727 (array!25041) Bool)

(assert (=> start!39170 (array_inv!8727 _keys!709)))

(declare-fun b!412449 () Bool)

(assert (=> b!412449 (= e!246808 (and e!246805 mapRes!17505))))

(declare-fun condMapEmpty!17505 () Bool)

(declare-fun mapDefault!17505 () ValueCell!4951)

