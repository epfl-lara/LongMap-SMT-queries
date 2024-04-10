; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40214 () Bool)

(assert start!40214)

(declare-fun b_free!10481 () Bool)

(declare-fun b_next!10481 () Bool)

(assert (=> start!40214 (= b_free!10481 (not b_next!10481))))

(declare-fun tp!36972 () Bool)

(declare-fun b_and!18449 () Bool)

(assert (=> start!40214 (= tp!36972 b_and!18449)))

(declare-fun b!440900 () Bool)

(declare-fun res!260882 () Bool)

(declare-fun e!259694 () Bool)

(assert (=> b!440900 (=> (not res!260882) (not e!259694))))

(declare-datatypes ((array!27079 0))(
  ( (array!27080 (arr!12989 (Array (_ BitVec 32) (_ BitVec 64))) (size!13341 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27079)

(declare-datatypes ((List!7789 0))(
  ( (Nil!7786) (Cons!7785 (h!8641 (_ BitVec 64)) (t!13545 List!7789)) )
))
(declare-fun arrayNoDuplicates!0 (array!27079 (_ BitVec 32) List!7789) Bool)

(assert (=> b!440900 (= res!260882 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7786))))

(declare-fun b!440901 () Bool)

(declare-fun res!260871 () Bool)

(assert (=> b!440901 (=> (not res!260871) (not e!259694))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440901 (= res!260871 (or (= (select (arr!12989 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12989 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!260873 () Bool)

(assert (=> start!40214 (=> (not res!260873) (not e!259694))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40214 (= res!260873 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13341 _keys!709))))))

(assert (=> start!40214 e!259694))

(declare-fun tp_is_empty!11633 () Bool)

(assert (=> start!40214 tp_is_empty!11633))

(assert (=> start!40214 tp!36972))

(assert (=> start!40214 true))

(declare-datatypes ((V!16615 0))(
  ( (V!16616 (val!5861 Int)) )
))
(declare-datatypes ((ValueCell!5473 0))(
  ( (ValueCellFull!5473 (v!8108 V!16615)) (EmptyCell!5473) )
))
(declare-datatypes ((array!27081 0))(
  ( (array!27082 (arr!12990 (Array (_ BitVec 32) ValueCell!5473)) (size!13342 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27081)

(declare-fun e!259695 () Bool)

(declare-fun array_inv!9426 (array!27081) Bool)

(assert (=> start!40214 (and (array_inv!9426 _values!549) e!259695)))

(declare-fun array_inv!9427 (array!27079) Bool)

(assert (=> start!40214 (array_inv!9427 _keys!709)))

(declare-fun b!440902 () Bool)

(declare-fun res!260880 () Bool)

(declare-fun e!259692 () Bool)

(assert (=> b!440902 (=> (not res!260880) (not e!259692))))

(assert (=> b!440902 (= res!260880 (bvsle from!863 i!563))))

(declare-fun b!440903 () Bool)

(declare-fun e!259697 () Bool)

(assert (=> b!440903 (= e!259697 (not true))))

(declare-fun minValue!515 () V!16615)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!202726 () array!27079)

(declare-fun zeroValue!515 () V!16615)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!202727 () array!27081)

(declare-fun v!412 () V!16615)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7794 0))(
  ( (tuple2!7795 (_1!3908 (_ BitVec 64)) (_2!3908 V!16615)) )
))
(declare-datatypes ((List!7790 0))(
  ( (Nil!7787) (Cons!7786 (h!8642 tuple2!7794) (t!13546 List!7790)) )
))
(declare-datatypes ((ListLongMap!6707 0))(
  ( (ListLongMap!6708 (toList!3369 List!7790)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1558 (array!27079 array!27081 (_ BitVec 32) (_ BitVec 32) V!16615 V!16615 (_ BitVec 32) Int) ListLongMap!6707)

(declare-fun +!1505 (ListLongMap!6707 tuple2!7794) ListLongMap!6707)

(assert (=> b!440903 (= (getCurrentListMapNoExtraKeys!1558 lt!202726 lt!202727 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1505 (getCurrentListMapNoExtraKeys!1558 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7795 k!794 v!412)))))

(declare-datatypes ((Unit!13114 0))(
  ( (Unit!13115) )
))
(declare-fun lt!202730 () Unit!13114)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!674 (array!27079 array!27081 (_ BitVec 32) (_ BitVec 32) V!16615 V!16615 (_ BitVec 32) (_ BitVec 64) V!16615 (_ BitVec 32) Int) Unit!13114)

(assert (=> b!440903 (= lt!202730 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!674 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!19071 () Bool)

(declare-fun mapRes!19071 () Bool)

(declare-fun tp!36971 () Bool)

(declare-fun e!259696 () Bool)

(assert (=> mapNonEmpty!19071 (= mapRes!19071 (and tp!36971 e!259696))))

(declare-fun mapRest!19071 () (Array (_ BitVec 32) ValueCell!5473))

(declare-fun mapValue!19071 () ValueCell!5473)

(declare-fun mapKey!19071 () (_ BitVec 32))

(assert (=> mapNonEmpty!19071 (= (arr!12990 _values!549) (store mapRest!19071 mapKey!19071 mapValue!19071))))

(declare-fun b!440904 () Bool)

(declare-fun res!260878 () Bool)

(assert (=> b!440904 (=> (not res!260878) (not e!259694))))

(assert (=> b!440904 (= res!260878 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13341 _keys!709))))))

(declare-fun b!440905 () Bool)

(assert (=> b!440905 (= e!259692 e!259697)))

(declare-fun res!260881 () Bool)

(assert (=> b!440905 (=> (not res!260881) (not e!259697))))

(assert (=> b!440905 (= res!260881 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202729 () ListLongMap!6707)

(assert (=> b!440905 (= lt!202729 (getCurrentListMapNoExtraKeys!1558 lt!202726 lt!202727 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!440905 (= lt!202727 (array!27082 (store (arr!12990 _values!549) i!563 (ValueCellFull!5473 v!412)) (size!13342 _values!549)))))

(declare-fun lt!202728 () ListLongMap!6707)

(assert (=> b!440905 (= lt!202728 (getCurrentListMapNoExtraKeys!1558 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!19071 () Bool)

(assert (=> mapIsEmpty!19071 mapRes!19071))

(declare-fun b!440906 () Bool)

(assert (=> b!440906 (= e!259694 e!259692)))

(declare-fun res!260883 () Bool)

(assert (=> b!440906 (=> (not res!260883) (not e!259692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27079 (_ BitVec 32)) Bool)

(assert (=> b!440906 (= res!260883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202726 mask!1025))))

(assert (=> b!440906 (= lt!202726 (array!27080 (store (arr!12989 _keys!709) i!563 k!794) (size!13341 _keys!709)))))

(declare-fun b!440907 () Bool)

(declare-fun res!260879 () Bool)

(assert (=> b!440907 (=> (not res!260879) (not e!259694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440907 (= res!260879 (validMask!0 mask!1025))))

(declare-fun b!440908 () Bool)

(declare-fun e!259698 () Bool)

(assert (=> b!440908 (= e!259695 (and e!259698 mapRes!19071))))

(declare-fun condMapEmpty!19071 () Bool)

(declare-fun mapDefault!19071 () ValueCell!5473)

