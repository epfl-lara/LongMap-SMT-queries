; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39082 () Bool)

(assert start!39082)

(declare-fun b_free!9349 () Bool)

(declare-fun b_next!9349 () Bool)

(assert (=> start!39082 (= b_free!9349 (not b_next!9349))))

(declare-fun tp!33576 () Bool)

(declare-fun b_and!16735 () Bool)

(assert (=> start!39082 (= tp!33576 b_and!16735)))

(declare-fun b!410457 () Bool)

(declare-fun res!237915 () Bool)

(declare-fun e!246017 () Bool)

(assert (=> b!410457 (=> (not res!237915) (not e!246017))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410457 (= res!237915 (validKeyInArray!0 k!794))))

(declare-fun b!410458 () Bool)

(declare-fun res!237904 () Bool)

(declare-fun e!246013 () Bool)

(assert (=> b!410458 (=> (not res!237904) (not e!246013))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410458 (= res!237904 (bvsle from!863 i!563))))

(declare-fun b!410459 () Bool)

(declare-fun res!237907 () Bool)

(assert (=> b!410459 (=> (not res!237907) (not e!246017))))

(declare-datatypes ((array!24871 0))(
  ( (array!24872 (arr!11885 (Array (_ BitVec 32) (_ BitVec 64))) (size!12237 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24871)

(assert (=> b!410459 (= res!237907 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12237 _keys!709))))))

(declare-fun b!410460 () Bool)

(declare-fun res!237911 () Bool)

(assert (=> b!410460 (=> (not res!237911) (not e!246017))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15107 0))(
  ( (V!15108 (val!5295 Int)) )
))
(declare-datatypes ((ValueCell!4907 0))(
  ( (ValueCellFull!4907 (v!7542 V!15107)) (EmptyCell!4907) )
))
(declare-datatypes ((array!24873 0))(
  ( (array!24874 (arr!11886 (Array (_ BitVec 32) ValueCell!4907)) (size!12238 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24873)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!410460 (= res!237911 (and (= (size!12238 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12237 _keys!709) (size!12238 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410461 () Bool)

(assert (=> b!410461 (= e!246017 e!246013)))

(declare-fun res!237913 () Bool)

(assert (=> b!410461 (=> (not res!237913) (not e!246013))))

(declare-fun lt!189085 () array!24871)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24871 (_ BitVec 32)) Bool)

(assert (=> b!410461 (= res!237913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189085 mask!1025))))

(assert (=> b!410461 (= lt!189085 (array!24872 (store (arr!11885 _keys!709) i!563 k!794) (size!12237 _keys!709)))))

(declare-fun res!237906 () Bool)

(assert (=> start!39082 (=> (not res!237906) (not e!246017))))

(assert (=> start!39082 (= res!237906 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12237 _keys!709))))))

(assert (=> start!39082 e!246017))

(declare-fun tp_is_empty!10501 () Bool)

(assert (=> start!39082 tp_is_empty!10501))

(assert (=> start!39082 tp!33576))

(assert (=> start!39082 true))

(declare-fun e!246018 () Bool)

(declare-fun array_inv!8674 (array!24873) Bool)

(assert (=> start!39082 (and (array_inv!8674 _values!549) e!246018)))

(declare-fun array_inv!8675 (array!24871) Bool)

(assert (=> start!39082 (array_inv!8675 _keys!709)))

(declare-fun b!410462 () Bool)

(assert (=> b!410462 (= e!246013 false)))

(declare-fun minValue!515 () V!15107)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15107)

(declare-datatypes ((tuple2!6866 0))(
  ( (tuple2!6867 (_1!3444 (_ BitVec 64)) (_2!3444 V!15107)) )
))
(declare-datatypes ((List!6891 0))(
  ( (Nil!6888) (Cons!6887 (h!7743 tuple2!6866) (t!12065 List!6891)) )
))
(declare-datatypes ((ListLongMap!5779 0))(
  ( (ListLongMap!5780 (toList!2905 List!6891)) )
))
(declare-fun lt!189084 () ListLongMap!5779)

(declare-fun v!412 () V!15107)

(declare-fun getCurrentListMapNoExtraKeys!1113 (array!24871 array!24873 (_ BitVec 32) (_ BitVec 32) V!15107 V!15107 (_ BitVec 32) Int) ListLongMap!5779)

(assert (=> b!410462 (= lt!189084 (getCurrentListMapNoExtraKeys!1113 lt!189085 (array!24874 (store (arr!11886 _values!549) i!563 (ValueCellFull!4907 v!412)) (size!12238 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189086 () ListLongMap!5779)

(assert (=> b!410462 (= lt!189086 (getCurrentListMapNoExtraKeys!1113 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410463 () Bool)

(declare-fun res!237910 () Bool)

(assert (=> b!410463 (=> (not res!237910) (not e!246013))))

(declare-datatypes ((List!6892 0))(
  ( (Nil!6889) (Cons!6888 (h!7744 (_ BitVec 64)) (t!12066 List!6892)) )
))
(declare-fun arrayNoDuplicates!0 (array!24871 (_ BitVec 32) List!6892) Bool)

(assert (=> b!410463 (= res!237910 (arrayNoDuplicates!0 lt!189085 #b00000000000000000000000000000000 Nil!6889))))

(declare-fun b!410464 () Bool)

(declare-fun res!237912 () Bool)

(assert (=> b!410464 (=> (not res!237912) (not e!246017))))

(assert (=> b!410464 (= res!237912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410465 () Bool)

(declare-fun e!246014 () Bool)

(assert (=> b!410465 (= e!246014 tp_is_empty!10501)))

(declare-fun b!410466 () Bool)

(declare-fun res!237909 () Bool)

(assert (=> b!410466 (=> (not res!237909) (not e!246017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410466 (= res!237909 (validMask!0 mask!1025))))

(declare-fun b!410467 () Bool)

(declare-fun res!237914 () Bool)

(assert (=> b!410467 (=> (not res!237914) (not e!246017))))

(assert (=> b!410467 (= res!237914 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6889))))

(declare-fun b!410468 () Bool)

(declare-fun e!246015 () Bool)

(assert (=> b!410468 (= e!246015 tp_is_empty!10501)))

(declare-fun b!410469 () Bool)

(declare-fun res!237905 () Bool)

(assert (=> b!410469 (=> (not res!237905) (not e!246017))))

(declare-fun arrayContainsKey!0 (array!24871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410469 (= res!237905 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17373 () Bool)

(declare-fun mapRes!17373 () Bool)

(assert (=> mapIsEmpty!17373 mapRes!17373))

(declare-fun b!410470 () Bool)

(declare-fun res!237908 () Bool)

(assert (=> b!410470 (=> (not res!237908) (not e!246017))))

(assert (=> b!410470 (= res!237908 (or (= (select (arr!11885 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11885 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410471 () Bool)

(assert (=> b!410471 (= e!246018 (and e!246014 mapRes!17373))))

(declare-fun condMapEmpty!17373 () Bool)

(declare-fun mapDefault!17373 () ValueCell!4907)

