; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20548 () Bool)

(assert start!20548)

(declare-fun b_free!5207 () Bool)

(declare-fun b_next!5207 () Bool)

(assert (=> start!20548 (= b_free!5207 (not b_next!5207))))

(declare-fun tp!18652 () Bool)

(declare-fun b_and!11953 () Bool)

(assert (=> start!20548 (= tp!18652 b_and!11953)))

(declare-fun res!98448 () Bool)

(declare-fun e!133721 () Bool)

(assert (=> start!20548 (=> (not res!98448) (not e!133721))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20548 (= res!98448 (validMask!0 mask!1149))))

(assert (=> start!20548 e!133721))

(declare-datatypes ((V!6397 0))(
  ( (V!6398 (val!2576 Int)) )
))
(declare-datatypes ((ValueCell!2188 0))(
  ( (ValueCellFull!2188 (v!4546 V!6397)) (EmptyCell!2188) )
))
(declare-datatypes ((array!9343 0))(
  ( (array!9344 (arr!4422 (Array (_ BitVec 32) ValueCell!2188)) (size!4747 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9343)

(declare-fun e!133726 () Bool)

(declare-fun array_inv!2921 (array!9343) Bool)

(assert (=> start!20548 (and (array_inv!2921 _values!649) e!133726)))

(assert (=> start!20548 true))

(declare-fun tp_is_empty!5063 () Bool)

(assert (=> start!20548 tp_is_empty!5063))

(declare-datatypes ((array!9345 0))(
  ( (array!9346 (arr!4423 (Array (_ BitVec 32) (_ BitVec 64))) (size!4748 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9345)

(declare-fun array_inv!2922 (array!9345) Bool)

(assert (=> start!20548 (array_inv!2922 _keys!825)))

(assert (=> start!20548 tp!18652))

(declare-fun b!204363 () Bool)

(declare-fun res!98447 () Bool)

(assert (=> b!204363 (=> (not res!98447) (not e!133721))))

(declare-datatypes ((List!2807 0))(
  ( (Nil!2804) (Cons!2803 (h!3445 (_ BitVec 64)) (t!7738 List!2807)) )
))
(declare-fun arrayNoDuplicates!0 (array!9345 (_ BitVec 32) List!2807) Bool)

(assert (=> b!204363 (= res!98447 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2804))))

(declare-fun b!204364 () Bool)

(declare-fun e!133723 () Bool)

(assert (=> b!204364 (= e!133721 (not e!133723))))

(declare-fun res!98449 () Bool)

(assert (=> b!204364 (=> res!98449 e!133723)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204364 (= res!98449 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3908 0))(
  ( (tuple2!3909 (_1!1965 (_ BitVec 64)) (_2!1965 V!6397)) )
))
(declare-datatypes ((List!2808 0))(
  ( (Nil!2805) (Cons!2804 (h!3446 tuple2!3908) (t!7739 List!2808)) )
))
(declare-datatypes ((ListLongMap!2821 0))(
  ( (ListLongMap!2822 (toList!1426 List!2808)) )
))
(declare-fun lt!103549 () ListLongMap!2821)

(declare-fun zeroValue!615 () V!6397)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6397)

(declare-fun getCurrentListMap!999 (array!9345 array!9343 (_ BitVec 32) (_ BitVec 32) V!6397 V!6397 (_ BitVec 32) Int) ListLongMap!2821)

(assert (=> b!204364 (= lt!103549 (getCurrentListMap!999 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103551 () array!9343)

(declare-fun lt!103540 () ListLongMap!2821)

(assert (=> b!204364 (= lt!103540 (getCurrentListMap!999 _keys!825 lt!103551 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103547 () ListLongMap!2821)

(declare-fun lt!103550 () ListLongMap!2821)

(assert (=> b!204364 (and (= lt!103547 lt!103550) (= lt!103550 lt!103547))))

(declare-fun lt!103548 () ListLongMap!2821)

(declare-fun lt!103544 () tuple2!3908)

(declare-fun +!453 (ListLongMap!2821 tuple2!3908) ListLongMap!2821)

(assert (=> b!204364 (= lt!103550 (+!453 lt!103548 lt!103544))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6397)

(assert (=> b!204364 (= lt!103544 (tuple2!3909 k!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6198 0))(
  ( (Unit!6199) )
))
(declare-fun lt!103546 () Unit!6198)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!112 (array!9345 array!9343 (_ BitVec 32) (_ BitVec 32) V!6397 V!6397 (_ BitVec 32) (_ BitVec 64) V!6397 (_ BitVec 32) Int) Unit!6198)

(assert (=> b!204364 (= lt!103546 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!112 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!373 (array!9345 array!9343 (_ BitVec 32) (_ BitVec 32) V!6397 V!6397 (_ BitVec 32) Int) ListLongMap!2821)

(assert (=> b!204364 (= lt!103547 (getCurrentListMapNoExtraKeys!373 _keys!825 lt!103551 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204364 (= lt!103551 (array!9344 (store (arr!4422 _values!649) i!601 (ValueCellFull!2188 v!520)) (size!4747 _values!649)))))

(assert (=> b!204364 (= lt!103548 (getCurrentListMapNoExtraKeys!373 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204365 () Bool)

(declare-fun res!98453 () Bool)

(assert (=> b!204365 (=> (not res!98453) (not e!133721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9345 (_ BitVec 32)) Bool)

(assert (=> b!204365 (= res!98453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204366 () Bool)

(declare-fun res!98454 () Bool)

(assert (=> b!204366 (=> (not res!98454) (not e!133721))))

(assert (=> b!204366 (= res!98454 (= (select (arr!4423 _keys!825) i!601) k!843))))

(declare-fun mapIsEmpty!8663 () Bool)

(declare-fun mapRes!8663 () Bool)

(assert (=> mapIsEmpty!8663 mapRes!8663))

(declare-fun b!204367 () Bool)

(declare-fun e!133727 () Bool)

(assert (=> b!204367 (= e!133726 (and e!133727 mapRes!8663))))

(declare-fun condMapEmpty!8663 () Bool)

(declare-fun mapDefault!8663 () ValueCell!2188)

