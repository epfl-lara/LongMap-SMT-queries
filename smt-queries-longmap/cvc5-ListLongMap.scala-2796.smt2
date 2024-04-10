; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40664 () Bool)

(assert start!40664)

(declare-fun b_free!10675 () Bool)

(declare-fun b_next!10675 () Bool)

(assert (=> start!40664 (= b_free!10675 (not b_next!10675))))

(declare-fun tp!37845 () Bool)

(declare-fun b_and!18683 () Bool)

(assert (=> start!40664 (= tp!37845 b_and!18683)))

(declare-fun mapNonEmpty!19653 () Bool)

(declare-fun mapRes!19653 () Bool)

(declare-fun tp!37844 () Bool)

(declare-fun e!263497 () Bool)

(assert (=> mapNonEmpty!19653 (= mapRes!19653 (and tp!37844 e!263497))))

(declare-datatypes ((V!17123 0))(
  ( (V!17124 (val!6051 Int)) )
))
(declare-datatypes ((ValueCell!5663 0))(
  ( (ValueCellFull!5663 (v!8306 V!17123)) (EmptyCell!5663) )
))
(declare-fun mapRest!19653 () (Array (_ BitVec 32) ValueCell!5663))

(declare-datatypes ((array!27833 0))(
  ( (array!27834 (arr!13362 (Array (_ BitVec 32) ValueCell!5663)) (size!13714 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27833)

(declare-fun mapKey!19653 () (_ BitVec 32))

(declare-fun mapValue!19653 () ValueCell!5663)

(assert (=> mapNonEmpty!19653 (= (arr!13362 _values!549) (store mapRest!19653 mapKey!19653 mapValue!19653))))

(declare-fun b!449357 () Bool)

(declare-fun e!263493 () Bool)

(declare-fun e!263496 () Bool)

(assert (=> b!449357 (= e!263493 e!263496)))

(declare-fun res!267275 () Bool)

(assert (=> b!449357 (=> (not res!267275) (not e!263496))))

(declare-datatypes ((array!27835 0))(
  ( (array!27836 (arr!13363 (Array (_ BitVec 32) (_ BitVec 64))) (size!13715 (_ BitVec 32))) )
))
(declare-fun lt!204351 () array!27835)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27835 (_ BitVec 32)) Bool)

(assert (=> b!449357 (= res!267275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204351 mask!1025))))

(declare-fun _keys!709 () array!27835)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449357 (= lt!204351 (array!27836 (store (arr!13363 _keys!709) i!563 k!794) (size!13715 _keys!709)))))

(declare-fun b!449358 () Bool)

(declare-fun tp_is_empty!12013 () Bool)

(assert (=> b!449358 (= e!263497 tp_is_empty!12013)))

(declare-fun b!449360 () Bool)

(assert (=> b!449360 (= e!263496 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17123)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17123)

(declare-datatypes ((tuple2!7946 0))(
  ( (tuple2!7947 (_1!3984 (_ BitVec 64)) (_2!3984 V!17123)) )
))
(declare-datatypes ((List!8011 0))(
  ( (Nil!8008) (Cons!8007 (h!8863 tuple2!7946) (t!13773 List!8011)) )
))
(declare-datatypes ((ListLongMap!6859 0))(
  ( (ListLongMap!6860 (toList!3445 List!8011)) )
))
(declare-fun lt!204350 () ListLongMap!6859)

(declare-fun v!412 () V!17123)

(declare-fun getCurrentListMapNoExtraKeys!1631 (array!27835 array!27833 (_ BitVec 32) (_ BitVec 32) V!17123 V!17123 (_ BitVec 32) Int) ListLongMap!6859)

(assert (=> b!449360 (= lt!204350 (getCurrentListMapNoExtraKeys!1631 lt!204351 (array!27834 (store (arr!13362 _values!549) i!563 (ValueCellFull!5663 v!412)) (size!13714 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204349 () ListLongMap!6859)

(assert (=> b!449360 (= lt!204349 (getCurrentListMapNoExtraKeys!1631 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!19653 () Bool)

(assert (=> mapIsEmpty!19653 mapRes!19653))

(declare-fun b!449361 () Bool)

(declare-fun res!267268 () Bool)

(assert (=> b!449361 (=> (not res!267268) (not e!263493))))

(assert (=> b!449361 (= res!267268 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13715 _keys!709))))))

(declare-fun b!449362 () Bool)

(declare-fun res!267276 () Bool)

(assert (=> b!449362 (=> (not res!267276) (not e!263493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449362 (= res!267276 (validKeyInArray!0 k!794))))

(declare-fun b!449363 () Bool)

(declare-fun res!267274 () Bool)

(assert (=> b!449363 (=> (not res!267274) (not e!263493))))

(assert (=> b!449363 (= res!267274 (or (= (select (arr!13363 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13363 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449364 () Bool)

(declare-fun e!263498 () Bool)

(assert (=> b!449364 (= e!263498 tp_is_empty!12013)))

(declare-fun b!449365 () Bool)

(declare-fun res!267273 () Bool)

(assert (=> b!449365 (=> (not res!267273) (not e!263493))))

(assert (=> b!449365 (= res!267273 (and (= (size!13714 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13715 _keys!709) (size!13714 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449366 () Bool)

(declare-fun res!267272 () Bool)

(assert (=> b!449366 (=> (not res!267272) (not e!263493))))

(declare-datatypes ((List!8012 0))(
  ( (Nil!8009) (Cons!8008 (h!8864 (_ BitVec 64)) (t!13774 List!8012)) )
))
(declare-fun arrayNoDuplicates!0 (array!27835 (_ BitVec 32) List!8012) Bool)

(assert (=> b!449366 (= res!267272 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8009))))

(declare-fun b!449367 () Bool)

(declare-fun res!267270 () Bool)

(assert (=> b!449367 (=> (not res!267270) (not e!263493))))

(assert (=> b!449367 (= res!267270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449368 () Bool)

(declare-fun res!267277 () Bool)

(assert (=> b!449368 (=> (not res!267277) (not e!263496))))

(assert (=> b!449368 (= res!267277 (arrayNoDuplicates!0 lt!204351 #b00000000000000000000000000000000 Nil!8009))))

(declare-fun b!449369 () Bool)

(declare-fun e!263495 () Bool)

(assert (=> b!449369 (= e!263495 (and e!263498 mapRes!19653))))

(declare-fun condMapEmpty!19653 () Bool)

(declare-fun mapDefault!19653 () ValueCell!5663)

