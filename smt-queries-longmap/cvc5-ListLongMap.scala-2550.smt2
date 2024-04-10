; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39118 () Bool)

(assert start!39118)

(declare-fun b_free!9385 () Bool)

(declare-fun b_next!9385 () Bool)

(assert (=> start!39118 (= b_free!9385 (not b_next!9385))))

(declare-fun tp!33683 () Bool)

(declare-fun b_and!16771 () Bool)

(assert (=> start!39118 (= tp!33683 b_and!16771)))

(declare-fun b!411267 () Bool)

(declare-fun res!238562 () Bool)

(declare-fun e!246338 () Bool)

(assert (=> b!411267 (=> (not res!238562) (not e!246338))))

(declare-datatypes ((array!24935 0))(
  ( (array!24936 (arr!11917 (Array (_ BitVec 32) (_ BitVec 64))) (size!12269 (_ BitVec 32))) )
))
(declare-fun lt!189246 () array!24935)

(declare-datatypes ((List!6916 0))(
  ( (Nil!6913) (Cons!6912 (h!7768 (_ BitVec 64)) (t!12090 List!6916)) )
))
(declare-fun arrayNoDuplicates!0 (array!24935 (_ BitVec 32) List!6916) Bool)

(assert (=> b!411267 (= res!238562 (arrayNoDuplicates!0 lt!189246 #b00000000000000000000000000000000 Nil!6913))))

(declare-fun b!411268 () Bool)

(declare-fun res!238555 () Bool)

(declare-fun e!246341 () Bool)

(assert (=> b!411268 (=> (not res!238555) (not e!246341))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!24935)

(assert (=> b!411268 (= res!238555 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12269 _keys!709))))))

(declare-fun b!411269 () Bool)

(assert (=> b!411269 (= e!246338 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15155 0))(
  ( (V!15156 (val!5313 Int)) )
))
(declare-fun minValue!515 () V!15155)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6892 0))(
  ( (tuple2!6893 (_1!3457 (_ BitVec 64)) (_2!3457 V!15155)) )
))
(declare-datatypes ((List!6917 0))(
  ( (Nil!6914) (Cons!6913 (h!7769 tuple2!6892) (t!12091 List!6917)) )
))
(declare-datatypes ((ListLongMap!5805 0))(
  ( (ListLongMap!5806 (toList!2918 List!6917)) )
))
(declare-fun lt!189248 () ListLongMap!5805)

(declare-datatypes ((ValueCell!4925 0))(
  ( (ValueCellFull!4925 (v!7560 V!15155)) (EmptyCell!4925) )
))
(declare-datatypes ((array!24937 0))(
  ( (array!24938 (arr!11918 (Array (_ BitVec 32) ValueCell!4925)) (size!12270 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24937)

(declare-fun zeroValue!515 () V!15155)

(declare-fun v!412 () V!15155)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1126 (array!24935 array!24937 (_ BitVec 32) (_ BitVec 32) V!15155 V!15155 (_ BitVec 32) Int) ListLongMap!5805)

(assert (=> b!411269 (= lt!189248 (getCurrentListMapNoExtraKeys!1126 lt!189246 (array!24938 (store (arr!11918 _values!549) i!563 (ValueCellFull!4925 v!412)) (size!12270 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189247 () ListLongMap!5805)

(assert (=> b!411269 (= lt!189247 (getCurrentListMapNoExtraKeys!1126 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411270 () Bool)

(declare-fun res!238556 () Bool)

(assert (=> b!411270 (=> (not res!238556) (not e!246341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24935 (_ BitVec 32)) Bool)

(assert (=> b!411270 (= res!238556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!238554 () Bool)

(assert (=> start!39118 (=> (not res!238554) (not e!246341))))

(assert (=> start!39118 (= res!238554 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12269 _keys!709))))))

(assert (=> start!39118 e!246341))

(declare-fun tp_is_empty!10537 () Bool)

(assert (=> start!39118 tp_is_empty!10537))

(assert (=> start!39118 tp!33683))

(assert (=> start!39118 true))

(declare-fun e!246342 () Bool)

(declare-fun array_inv!8694 (array!24937) Bool)

(assert (=> start!39118 (and (array_inv!8694 _values!549) e!246342)))

(declare-fun array_inv!8695 (array!24935) Bool)

(assert (=> start!39118 (array_inv!8695 _keys!709)))

(declare-fun b!411271 () Bool)

(declare-fun res!238557 () Bool)

(assert (=> b!411271 (=> (not res!238557) (not e!246341))))

(assert (=> b!411271 (= res!238557 (or (= (select (arr!11917 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11917 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411272 () Bool)

(declare-fun res!238561 () Bool)

(assert (=> b!411272 (=> (not res!238561) (not e!246341))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411272 (= res!238561 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!411273 () Bool)

(declare-fun e!246340 () Bool)

(declare-fun mapRes!17427 () Bool)

(assert (=> b!411273 (= e!246342 (and e!246340 mapRes!17427))))

(declare-fun condMapEmpty!17427 () Bool)

(declare-fun mapDefault!17427 () ValueCell!4925)

