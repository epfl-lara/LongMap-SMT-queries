; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40210 () Bool)

(assert start!40210)

(declare-fun b_free!10477 () Bool)

(declare-fun b_next!10477 () Bool)

(assert (=> start!40210 (= b_free!10477 (not b_next!10477))))

(declare-fun tp!36959 () Bool)

(declare-fun b_and!18445 () Bool)

(assert (=> start!40210 (= tp!36959 b_and!18445)))

(declare-fun mapIsEmpty!19065 () Bool)

(declare-fun mapRes!19065 () Bool)

(assert (=> mapIsEmpty!19065 mapRes!19065))

(declare-fun b!440804 () Bool)

(declare-fun res!260802 () Bool)

(declare-fun e!259652 () Bool)

(assert (=> b!440804 (=> (not res!260802) (not e!259652))))

(declare-datatypes ((array!27071 0))(
  ( (array!27072 (arr!12985 (Array (_ BitVec 32) (_ BitVec 64))) (size!13337 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27071)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27071 (_ BitVec 32)) Bool)

(assert (=> b!440804 (= res!260802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440805 () Bool)

(declare-fun e!259650 () Bool)

(declare-fun tp_is_empty!11629 () Bool)

(assert (=> b!440805 (= e!259650 tp_is_empty!11629)))

(declare-fun b!440806 () Bool)

(declare-fun res!260798 () Bool)

(assert (=> b!440806 (=> (not res!260798) (not e!259652))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440806 (= res!260798 (validKeyInArray!0 k!794))))

(declare-fun b!440807 () Bool)

(declare-fun e!259655 () Bool)

(assert (=> b!440807 (= e!259655 (not true))))

(declare-datatypes ((V!16611 0))(
  ( (V!16612 (val!5859 Int)) )
))
(declare-datatypes ((ValueCell!5471 0))(
  ( (ValueCellFull!5471 (v!8106 V!16611)) (EmptyCell!5471) )
))
(declare-datatypes ((array!27073 0))(
  ( (array!27074 (arr!12986 (Array (_ BitVec 32) ValueCell!5471)) (size!13338 (_ BitVec 32))) )
))
(declare-fun lt!202699 () array!27073)

(declare-fun minValue!515 () V!16611)

(declare-fun defaultEntry!557 () Int)

(declare-fun _values!549 () array!27073)

(declare-fun zeroValue!515 () V!16611)

(declare-fun v!412 () V!16611)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!202697 () array!27071)

(declare-datatypes ((tuple2!7790 0))(
  ( (tuple2!7791 (_1!3906 (_ BitVec 64)) (_2!3906 V!16611)) )
))
(declare-datatypes ((List!7786 0))(
  ( (Nil!7783) (Cons!7782 (h!8638 tuple2!7790) (t!13542 List!7786)) )
))
(declare-datatypes ((ListLongMap!6703 0))(
  ( (ListLongMap!6704 (toList!3367 List!7786)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1556 (array!27071 array!27073 (_ BitVec 32) (_ BitVec 32) V!16611 V!16611 (_ BitVec 32) Int) ListLongMap!6703)

(declare-fun +!1503 (ListLongMap!6703 tuple2!7790) ListLongMap!6703)

(assert (=> b!440807 (= (getCurrentListMapNoExtraKeys!1556 lt!202697 lt!202699 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1503 (getCurrentListMapNoExtraKeys!1556 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7791 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13110 0))(
  ( (Unit!13111) )
))
(declare-fun lt!202698 () Unit!13110)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!672 (array!27071 array!27073 (_ BitVec 32) (_ BitVec 32) V!16611 V!16611 (_ BitVec 32) (_ BitVec 64) V!16611 (_ BitVec 32) Int) Unit!13110)

(assert (=> b!440807 (= lt!202698 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!672 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440808 () Bool)

(declare-fun res!260793 () Bool)

(assert (=> b!440808 (=> (not res!260793) (not e!259652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440808 (= res!260793 (validMask!0 mask!1025))))

(declare-fun b!440809 () Bool)

(declare-fun e!259654 () Bool)

(assert (=> b!440809 (= e!259654 e!259655)))

(declare-fun res!260805 () Bool)

(assert (=> b!440809 (=> (not res!260805) (not e!259655))))

(assert (=> b!440809 (= res!260805 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202696 () ListLongMap!6703)

(assert (=> b!440809 (= lt!202696 (getCurrentListMapNoExtraKeys!1556 lt!202697 lt!202699 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!440809 (= lt!202699 (array!27074 (store (arr!12986 _values!549) i!563 (ValueCellFull!5471 v!412)) (size!13338 _values!549)))))

(declare-fun lt!202700 () ListLongMap!6703)

(assert (=> b!440809 (= lt!202700 (getCurrentListMapNoExtraKeys!1556 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440811 () Bool)

(declare-fun e!259651 () Bool)

(assert (=> b!440811 (= e!259651 (and e!259650 mapRes!19065))))

(declare-fun condMapEmpty!19065 () Bool)

(declare-fun mapDefault!19065 () ValueCell!5471)

