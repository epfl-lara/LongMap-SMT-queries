; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39056 () Bool)

(assert start!39056)

(declare-fun b_free!9323 () Bool)

(declare-fun b_next!9323 () Bool)

(assert (=> start!39056 (= b_free!9323 (not b_next!9323))))

(declare-fun tp!33497 () Bool)

(declare-fun b_and!16709 () Bool)

(assert (=> start!39056 (= tp!33497 b_and!16709)))

(declare-fun b!409872 () Bool)

(declare-fun res!237447 () Bool)

(declare-fun e!245780 () Bool)

(assert (=> b!409872 (=> (not res!237447) (not e!245780))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409872 (= res!237447 (bvsle from!863 i!563))))

(declare-fun b!409873 () Bool)

(declare-fun res!237444 () Bool)

(declare-fun e!245784 () Bool)

(assert (=> b!409873 (=> (not res!237444) (not e!245784))))

(declare-datatypes ((array!24823 0))(
  ( (array!24824 (arr!11861 (Array (_ BitVec 32) (_ BitVec 64))) (size!12213 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24823)

(declare-datatypes ((List!6871 0))(
  ( (Nil!6868) (Cons!6867 (h!7723 (_ BitVec 64)) (t!12045 List!6871)) )
))
(declare-fun arrayNoDuplicates!0 (array!24823 (_ BitVec 32) List!6871) Bool)

(assert (=> b!409873 (= res!237444 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6868))))

(declare-fun b!409874 () Bool)

(declare-fun res!237437 () Bool)

(assert (=> b!409874 (=> (not res!237437) (not e!245784))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24823 (_ BitVec 32)) Bool)

(assert (=> b!409874 (= res!237437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409875 () Bool)

(declare-fun res!237446 () Bool)

(assert (=> b!409875 (=> (not res!237446) (not e!245780))))

(declare-fun lt!189005 () array!24823)

(assert (=> b!409875 (= res!237446 (arrayNoDuplicates!0 lt!189005 #b00000000000000000000000000000000 Nil!6868))))

(declare-fun b!409876 () Bool)

(declare-fun e!245782 () Bool)

(declare-fun tp_is_empty!10475 () Bool)

(assert (=> b!409876 (= e!245782 tp_is_empty!10475)))

(declare-fun b!409877 () Bool)

(declare-fun res!237440 () Bool)

(assert (=> b!409877 (=> (not res!237440) (not e!245784))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15071 0))(
  ( (V!15072 (val!5282 Int)) )
))
(declare-datatypes ((ValueCell!4894 0))(
  ( (ValueCellFull!4894 (v!7529 V!15071)) (EmptyCell!4894) )
))
(declare-datatypes ((array!24825 0))(
  ( (array!24826 (arr!11862 (Array (_ BitVec 32) ValueCell!4894)) (size!12214 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24825)

(assert (=> b!409877 (= res!237440 (and (= (size!12214 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12213 _keys!709) (size!12214 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409878 () Bool)

(assert (=> b!409878 (= e!245780 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15071)

(declare-fun minValue!515 () V!15071)

(declare-datatypes ((tuple2!6848 0))(
  ( (tuple2!6849 (_1!3435 (_ BitVec 64)) (_2!3435 V!15071)) )
))
(declare-datatypes ((List!6872 0))(
  ( (Nil!6869) (Cons!6868 (h!7724 tuple2!6848) (t!12046 List!6872)) )
))
(declare-datatypes ((ListLongMap!5761 0))(
  ( (ListLongMap!5762 (toList!2896 List!6872)) )
))
(declare-fun lt!189004 () ListLongMap!5761)

(declare-fun getCurrentListMapNoExtraKeys!1104 (array!24823 array!24825 (_ BitVec 32) (_ BitVec 32) V!15071 V!15071 (_ BitVec 32) Int) ListLongMap!5761)

(assert (=> b!409878 (= lt!189004 (getCurrentListMapNoExtraKeys!1104 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!237442 () Bool)

(assert (=> start!39056 (=> (not res!237442) (not e!245784))))

(assert (=> start!39056 (= res!237442 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12213 _keys!709))))))

(assert (=> start!39056 e!245784))

(assert (=> start!39056 tp_is_empty!10475))

(assert (=> start!39056 tp!33497))

(assert (=> start!39056 true))

(declare-fun e!245783 () Bool)

(declare-fun array_inv!8658 (array!24825) Bool)

(assert (=> start!39056 (and (array_inv!8658 _values!549) e!245783)))

(declare-fun array_inv!8659 (array!24823) Bool)

(assert (=> start!39056 (array_inv!8659 _keys!709)))

(declare-fun b!409879 () Bool)

(declare-fun res!237439 () Bool)

(assert (=> b!409879 (=> (not res!237439) (not e!245784))))

(assert (=> b!409879 (= res!237439 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12213 _keys!709))))))

(declare-fun b!409880 () Bool)

(declare-fun res!237438 () Bool)

(assert (=> b!409880 (=> (not res!237438) (not e!245784))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409880 (= res!237438 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17334 () Bool)

(declare-fun mapRes!17334 () Bool)

(declare-fun tp!33498 () Bool)

(assert (=> mapNonEmpty!17334 (= mapRes!17334 (and tp!33498 e!245782))))

(declare-fun mapRest!17334 () (Array (_ BitVec 32) ValueCell!4894))

(declare-fun mapValue!17334 () ValueCell!4894)

(declare-fun mapKey!17334 () (_ BitVec 32))

(assert (=> mapNonEmpty!17334 (= (arr!11862 _values!549) (store mapRest!17334 mapKey!17334 mapValue!17334))))

(declare-fun b!409881 () Bool)

(declare-fun res!237445 () Bool)

(assert (=> b!409881 (=> (not res!237445) (not e!245784))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409881 (= res!237445 (validKeyInArray!0 k!794))))

(declare-fun b!409882 () Bool)

(declare-fun res!237443 () Bool)

(assert (=> b!409882 (=> (not res!237443) (not e!245784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409882 (= res!237443 (validMask!0 mask!1025))))

(declare-fun b!409883 () Bool)

(declare-fun res!237441 () Bool)

(assert (=> b!409883 (=> (not res!237441) (not e!245784))))

(assert (=> b!409883 (= res!237441 (or (= (select (arr!11861 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11861 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409884 () Bool)

(assert (=> b!409884 (= e!245784 e!245780)))

(declare-fun res!237436 () Bool)

(assert (=> b!409884 (=> (not res!237436) (not e!245780))))

(assert (=> b!409884 (= res!237436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189005 mask!1025))))

(assert (=> b!409884 (= lt!189005 (array!24824 (store (arr!11861 _keys!709) i!563 k!794) (size!12213 _keys!709)))))

(declare-fun b!409885 () Bool)

(declare-fun e!245781 () Bool)

(assert (=> b!409885 (= e!245783 (and e!245781 mapRes!17334))))

(declare-fun condMapEmpty!17334 () Bool)

(declare-fun mapDefault!17334 () ValueCell!4894)

