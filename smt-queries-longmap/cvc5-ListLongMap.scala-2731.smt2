; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40204 () Bool)

(assert start!40204)

(declare-fun b_free!10471 () Bool)

(declare-fun b_next!10471 () Bool)

(assert (=> start!40204 (= b_free!10471 (not b_next!10471))))

(declare-fun tp!36941 () Bool)

(declare-fun b_and!18439 () Bool)

(assert (=> start!40204 (= tp!36941 b_and!18439)))

(declare-fun b!440660 () Bool)

(declare-fun res!260681 () Bool)

(declare-fun e!259592 () Bool)

(assert (=> b!440660 (=> (not res!260681) (not e!259592))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440660 (= res!260681 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!19056 () Bool)

(declare-fun mapRes!19056 () Bool)

(declare-fun tp!36942 () Bool)

(declare-fun e!259589 () Bool)

(assert (=> mapNonEmpty!19056 (= mapRes!19056 (and tp!36942 e!259589))))

(declare-fun mapKey!19056 () (_ BitVec 32))

(declare-datatypes ((V!16603 0))(
  ( (V!16604 (val!5856 Int)) )
))
(declare-datatypes ((ValueCell!5468 0))(
  ( (ValueCellFull!5468 (v!8103 V!16603)) (EmptyCell!5468) )
))
(declare-datatypes ((array!27059 0))(
  ( (array!27060 (arr!12979 (Array (_ BitVec 32) ValueCell!5468)) (size!13331 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27059)

(declare-fun mapRest!19056 () (Array (_ BitVec 32) ValueCell!5468))

(declare-fun mapValue!19056 () ValueCell!5468)

(assert (=> mapNonEmpty!19056 (= (arr!12979 _values!549) (store mapRest!19056 mapKey!19056 mapValue!19056))))

(declare-fun b!440661 () Bool)

(declare-fun e!259588 () Bool)

(declare-fun e!259591 () Bool)

(assert (=> b!440661 (= e!259588 e!259591)))

(declare-fun res!260686 () Bool)

(assert (=> b!440661 (=> (not res!260686) (not e!259591))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440661 (= res!260686 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16603)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16603)

(declare-datatypes ((array!27061 0))(
  ( (array!27062 (arr!12980 (Array (_ BitVec 32) (_ BitVec 64))) (size!13332 (_ BitVec 32))) )
))
(declare-fun lt!202651 () array!27061)

(declare-datatypes ((tuple2!7784 0))(
  ( (tuple2!7785 (_1!3903 (_ BitVec 64)) (_2!3903 V!16603)) )
))
(declare-datatypes ((List!7781 0))(
  ( (Nil!7778) (Cons!7777 (h!8633 tuple2!7784) (t!13537 List!7781)) )
))
(declare-datatypes ((ListLongMap!6697 0))(
  ( (ListLongMap!6698 (toList!3364 List!7781)) )
))
(declare-fun lt!202655 () ListLongMap!6697)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!202652 () array!27059)

(declare-fun getCurrentListMapNoExtraKeys!1553 (array!27061 array!27059 (_ BitVec 32) (_ BitVec 32) V!16603 V!16603 (_ BitVec 32) Int) ListLongMap!6697)

(assert (=> b!440661 (= lt!202655 (getCurrentListMapNoExtraKeys!1553 lt!202651 lt!202652 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16603)

(assert (=> b!440661 (= lt!202652 (array!27060 (store (arr!12979 _values!549) i!563 (ValueCellFull!5468 v!412)) (size!13331 _values!549)))))

(declare-fun lt!202654 () ListLongMap!6697)

(declare-fun _keys!709 () array!27061)

(assert (=> b!440661 (= lt!202654 (getCurrentListMapNoExtraKeys!1553 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440662 () Bool)

(declare-fun res!260684 () Bool)

(assert (=> b!440662 (=> (not res!260684) (not e!259592))))

(declare-datatypes ((List!7782 0))(
  ( (Nil!7779) (Cons!7778 (h!8634 (_ BitVec 64)) (t!13538 List!7782)) )
))
(declare-fun arrayNoDuplicates!0 (array!27061 (_ BitVec 32) List!7782) Bool)

(assert (=> b!440662 (= res!260684 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7779))))

(declare-fun b!440663 () Bool)

(declare-fun res!260682 () Bool)

(assert (=> b!440663 (=> (not res!260682) (not e!259592))))

(assert (=> b!440663 (= res!260682 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13332 _keys!709))))))

(declare-fun b!440664 () Bool)

(declare-fun res!260680 () Bool)

(assert (=> b!440664 (=> (not res!260680) (not e!259588))))

(assert (=> b!440664 (= res!260680 (bvsle from!863 i!563))))

(declare-fun b!440665 () Bool)

(declare-fun tp_is_empty!11623 () Bool)

(assert (=> b!440665 (= e!259589 tp_is_empty!11623)))

(declare-fun b!440666 () Bool)

(declare-fun e!259587 () Bool)

(declare-fun e!259590 () Bool)

(assert (=> b!440666 (= e!259587 (and e!259590 mapRes!19056))))

(declare-fun condMapEmpty!19056 () Bool)

(declare-fun mapDefault!19056 () ValueCell!5468)

