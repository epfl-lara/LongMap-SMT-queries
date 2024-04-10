; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40198 () Bool)

(assert start!40198)

(declare-fun b_free!10465 () Bool)

(declare-fun b_next!10465 () Bool)

(assert (=> start!40198 (= b_free!10465 (not b_next!10465))))

(declare-fun tp!36923 () Bool)

(declare-fun b_and!18433 () Bool)

(assert (=> start!40198 (= tp!36923 b_and!18433)))

(declare-fun b!440516 () Bool)

(declare-fun res!260570 () Bool)

(declare-fun e!259530 () Bool)

(assert (=> b!440516 (=> (not res!260570) (not e!259530))))

(declare-datatypes ((array!27047 0))(
  ( (array!27048 (arr!12973 (Array (_ BitVec 32) (_ BitVec 64))) (size!13325 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27047)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440516 (= res!260570 (or (= (select (arr!12973 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12973 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440517 () Bool)

(declare-fun res!260566 () Bool)

(declare-fun e!259525 () Bool)

(assert (=> b!440517 (=> (not res!260566) (not e!259525))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!440517 (= res!260566 (bvsle from!863 i!563))))

(declare-fun b!440518 () Bool)

(declare-fun e!259528 () Bool)

(declare-fun tp_is_empty!11617 () Bool)

(assert (=> b!440518 (= e!259528 tp_is_empty!11617)))

(declare-fun b!440519 () Bool)

(assert (=> b!440519 (= e!259530 e!259525)))

(declare-fun res!260559 () Bool)

(assert (=> b!440519 (=> (not res!260559) (not e!259525))))

(declare-fun lt!202609 () array!27047)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27047 (_ BitVec 32)) Bool)

(assert (=> b!440519 (= res!260559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202609 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!440519 (= lt!202609 (array!27048 (store (arr!12973 _keys!709) i!563 k!794) (size!13325 _keys!709)))))

(declare-fun b!440520 () Bool)

(declare-fun e!259529 () Bool)

(assert (=> b!440520 (= e!259525 e!259529)))

(declare-fun res!260567 () Bool)

(assert (=> b!440520 (=> (not res!260567) (not e!259529))))

(assert (=> b!440520 (= res!260567 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16595 0))(
  ( (V!16596 (val!5853 Int)) )
))
(declare-fun minValue!515 () V!16595)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16595)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7780 0))(
  ( (tuple2!7781 (_1!3901 (_ BitVec 64)) (_2!3901 V!16595)) )
))
(declare-datatypes ((List!7777 0))(
  ( (Nil!7774) (Cons!7773 (h!8629 tuple2!7780) (t!13533 List!7777)) )
))
(declare-datatypes ((ListLongMap!6693 0))(
  ( (ListLongMap!6694 (toList!3362 List!7777)) )
))
(declare-fun lt!202607 () ListLongMap!6693)

(declare-datatypes ((ValueCell!5465 0))(
  ( (ValueCellFull!5465 (v!8100 V!16595)) (EmptyCell!5465) )
))
(declare-datatypes ((array!27049 0))(
  ( (array!27050 (arr!12974 (Array (_ BitVec 32) ValueCell!5465)) (size!13326 (_ BitVec 32))) )
))
(declare-fun lt!202608 () array!27049)

(declare-fun getCurrentListMapNoExtraKeys!1551 (array!27047 array!27049 (_ BitVec 32) (_ BitVec 32) V!16595 V!16595 (_ BitVec 32) Int) ListLongMap!6693)

(assert (=> b!440520 (= lt!202607 (getCurrentListMapNoExtraKeys!1551 lt!202609 lt!202608 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27049)

(declare-fun v!412 () V!16595)

(assert (=> b!440520 (= lt!202608 (array!27050 (store (arr!12974 _values!549) i!563 (ValueCellFull!5465 v!412)) (size!13326 _values!549)))))

(declare-fun lt!202610 () ListLongMap!6693)

(assert (=> b!440520 (= lt!202610 (getCurrentListMapNoExtraKeys!1551 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440521 () Bool)

(declare-fun res!260571 () Bool)

(assert (=> b!440521 (=> (not res!260571) (not e!259525))))

(declare-datatypes ((List!7778 0))(
  ( (Nil!7775) (Cons!7774 (h!8630 (_ BitVec 64)) (t!13534 List!7778)) )
))
(declare-fun arrayNoDuplicates!0 (array!27047 (_ BitVec 32) List!7778) Bool)

(assert (=> b!440521 (= res!260571 (arrayNoDuplicates!0 lt!202609 #b00000000000000000000000000000000 Nil!7775))))

(declare-fun b!440522 () Bool)

(declare-fun res!260562 () Bool)

(assert (=> b!440522 (=> (not res!260562) (not e!259530))))

(assert (=> b!440522 (= res!260562 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7775))))

(declare-fun mapIsEmpty!19047 () Bool)

(declare-fun mapRes!19047 () Bool)

(assert (=> mapIsEmpty!19047 mapRes!19047))

(declare-fun b!440523 () Bool)

(declare-fun e!259527 () Bool)

(declare-fun e!259526 () Bool)

(assert (=> b!440523 (= e!259527 (and e!259526 mapRes!19047))))

(declare-fun condMapEmpty!19047 () Bool)

(declare-fun mapDefault!19047 () ValueCell!5465)

