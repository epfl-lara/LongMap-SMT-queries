; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40800 () Bool)

(assert start!40800)

(declare-fun b_free!10789 () Bool)

(declare-fun b_next!10789 () Bool)

(assert (=> start!40800 (= b_free!10789 (not b_next!10789))))

(declare-fun tp!38189 () Bool)

(declare-fun b_and!18865 () Bool)

(assert (=> start!40800 (= tp!38189 b_and!18865)))

(declare-fun mapNonEmpty!19827 () Bool)

(declare-fun mapRes!19827 () Bool)

(declare-fun tp!38190 () Bool)

(declare-fun e!265012 () Bool)

(assert (=> mapNonEmpty!19827 (= mapRes!19827 (and tp!38190 e!265012))))

(declare-datatypes ((V!17275 0))(
  ( (V!17276 (val!6108 Int)) )
))
(declare-datatypes ((ValueCell!5720 0))(
  ( (ValueCellFull!5720 (v!8367 V!17275)) (EmptyCell!5720) )
))
(declare-fun mapValue!19827 () ValueCell!5720)

(declare-datatypes ((array!28061 0))(
  ( (array!28062 (arr!13475 (Array (_ BitVec 32) ValueCell!5720)) (size!13827 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28061)

(declare-fun mapKey!19827 () (_ BitVec 32))

(declare-fun mapRest!19827 () (Array (_ BitVec 32) ValueCell!5720))

(assert (=> mapNonEmpty!19827 (= (arr!13475 _values!549) (store mapRest!19827 mapKey!19827 mapValue!19827))))

(declare-datatypes ((tuple2!8042 0))(
  ( (tuple2!8043 (_1!4032 (_ BitVec 64)) (_2!4032 V!17275)) )
))
(declare-datatypes ((List!8099 0))(
  ( (Nil!8096) (Cons!8095 (h!8951 tuple2!8042) (t!13911 List!8099)) )
))
(declare-datatypes ((ListLongMap!6955 0))(
  ( (ListLongMap!6956 (toList!3493 List!8099)) )
))
(declare-fun call!29980 () ListLongMap!6955)

(declare-fun call!29981 () ListLongMap!6955)

(declare-fun b!452648 () Bool)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun e!265006 () Bool)

(declare-fun v!412 () V!17275)

(declare-fun +!1569 (ListLongMap!6955 tuple2!8042) ListLongMap!6955)

(assert (=> b!452648 (= e!265006 (= call!29981 (+!1569 call!29980 (tuple2!8043 k!794 v!412))))))

(declare-fun b!452649 () Bool)

(declare-fun res!269643 () Bool)

(declare-fun e!265013 () Bool)

(assert (=> b!452649 (=> (not res!269643) (not e!265013))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452649 (= res!269643 (validMask!0 mask!1025))))

(declare-fun b!452650 () Bool)

(declare-fun res!269639 () Bool)

(assert (=> b!452650 (=> (not res!269639) (not e!265013))))

(declare-datatypes ((array!28063 0))(
  ( (array!28064 (arr!13476 (Array (_ BitVec 32) (_ BitVec 64))) (size!13828 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28063)

(declare-datatypes ((List!8100 0))(
  ( (Nil!8097) (Cons!8096 (h!8952 (_ BitVec 64)) (t!13912 List!8100)) )
))
(declare-fun arrayNoDuplicates!0 (array!28063 (_ BitVec 32) List!8100) Bool)

(assert (=> b!452650 (= res!269639 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8097))))

(declare-fun b!452651 () Bool)

(declare-fun res!269644 () Bool)

(assert (=> b!452651 (=> (not res!269644) (not e!265013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28063 (_ BitVec 32)) Bool)

(assert (=> b!452651 (= res!269644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452652 () Bool)

(declare-fun e!265008 () Bool)

(assert (=> b!452652 (= e!265008 true)))

(declare-fun lt!205354 () ListLongMap!6955)

(declare-fun lt!205364 () tuple2!8042)

(declare-fun lt!205359 () V!17275)

(assert (=> b!452652 (= (+!1569 lt!205354 lt!205364) (+!1569 (+!1569 lt!205354 (tuple2!8043 k!794 lt!205359)) lt!205364))))

(declare-fun lt!205358 () V!17275)

(assert (=> b!452652 (= lt!205364 (tuple2!8043 k!794 lt!205358))))

(declare-datatypes ((Unit!13234 0))(
  ( (Unit!13235) )
))
(declare-fun lt!205355 () Unit!13234)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!81 (ListLongMap!6955 (_ BitVec 64) V!17275 V!17275) Unit!13234)

(assert (=> b!452652 (= lt!205355 (addSameAsAddTwiceSameKeyDiffValues!81 lt!205354 k!794 lt!205359 lt!205358))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!205360 () V!17275)

(declare-fun get!6643 (ValueCell!5720 V!17275) V!17275)

(assert (=> b!452652 (= lt!205359 (get!6643 (select (arr!13475 _values!549) from!863) lt!205360))))

(declare-fun lt!205356 () ListLongMap!6955)

(declare-fun lt!205361 () array!28063)

(assert (=> b!452652 (= lt!205356 (+!1569 lt!205354 (tuple2!8043 (select (arr!13476 lt!205361) from!863) lt!205358)))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452652 (= lt!205358 (get!6643 (select (store (arr!13475 _values!549) i!563 (ValueCellFull!5720 v!412)) from!863) lt!205360))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!868 (Int (_ BitVec 64)) V!17275)

(assert (=> b!452652 (= lt!205360 (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!205362 () array!28061)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17275)

(declare-fun minValue!515 () V!17275)

(declare-fun getCurrentListMapNoExtraKeys!1676 (array!28063 array!28061 (_ BitVec 32) (_ BitVec 32) V!17275 V!17275 (_ BitVec 32) Int) ListLongMap!6955)

(assert (=> b!452652 (= lt!205354 (getCurrentListMapNoExtraKeys!1676 lt!205361 lt!205362 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!269640 () Bool)

(assert (=> start!40800 (=> (not res!269640) (not e!265013))))

(assert (=> start!40800 (= res!269640 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13828 _keys!709))))))

(assert (=> start!40800 e!265013))

(declare-fun tp_is_empty!12127 () Bool)

(assert (=> start!40800 tp_is_empty!12127))

(assert (=> start!40800 tp!38189))

(assert (=> start!40800 true))

(declare-fun e!265007 () Bool)

(declare-fun array_inv!9758 (array!28061) Bool)

(assert (=> start!40800 (and (array_inv!9758 _values!549) e!265007)))

(declare-fun array_inv!9759 (array!28063) Bool)

(assert (=> start!40800 (array_inv!9759 _keys!709)))

(declare-fun b!452653 () Bool)

(assert (=> b!452653 (= e!265012 tp_is_empty!12127)))

(declare-fun b!452654 () Bool)

(declare-fun res!269635 () Bool)

(assert (=> b!452654 (=> (not res!269635) (not e!265013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452654 (= res!269635 (validKeyInArray!0 k!794))))

(declare-fun b!452655 () Bool)

(declare-fun e!265009 () Bool)

(assert (=> b!452655 (= e!265013 e!265009)))

(declare-fun res!269633 () Bool)

(assert (=> b!452655 (=> (not res!269633) (not e!265009))))

(assert (=> b!452655 (= res!269633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205361 mask!1025))))

(assert (=> b!452655 (= lt!205361 (array!28064 (store (arr!13476 _keys!709) i!563 k!794) (size!13828 _keys!709)))))

(declare-fun mapIsEmpty!19827 () Bool)

(assert (=> mapIsEmpty!19827 mapRes!19827))

(declare-fun bm!29977 () Bool)

(declare-fun c!56132 () Bool)

(assert (=> bm!29977 (= call!29980 (getCurrentListMapNoExtraKeys!1676 (ite c!56132 _keys!709 lt!205361) (ite c!56132 _values!549 lt!205362) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452656 () Bool)

(declare-fun res!269642 () Bool)

(assert (=> b!452656 (=> (not res!269642) (not e!265009))))

(assert (=> b!452656 (= res!269642 (bvsle from!863 i!563))))

(declare-fun b!452657 () Bool)

(declare-fun e!265010 () Bool)

(assert (=> b!452657 (= e!265010 (not e!265008))))

(declare-fun res!269634 () Bool)

(assert (=> b!452657 (=> res!269634 e!265008)))

(assert (=> b!452657 (= res!269634 (validKeyInArray!0 (select (arr!13476 _keys!709) from!863)))))

(assert (=> b!452657 e!265006))

(assert (=> b!452657 (= c!56132 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!205357 () Unit!13234)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!731 (array!28063 array!28061 (_ BitVec 32) (_ BitVec 32) V!17275 V!17275 (_ BitVec 32) (_ BitVec 64) V!17275 (_ BitVec 32) Int) Unit!13234)

(assert (=> b!452657 (= lt!205357 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!731 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452658 () Bool)

(declare-fun res!269645 () Bool)

(assert (=> b!452658 (=> (not res!269645) (not e!265013))))

(declare-fun arrayContainsKey!0 (array!28063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452658 (= res!269645 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!452659 () Bool)

(declare-fun e!265011 () Bool)

(assert (=> b!452659 (= e!265011 tp_is_empty!12127)))

(declare-fun b!452660 () Bool)

(assert (=> b!452660 (= e!265007 (and e!265011 mapRes!19827))))

(declare-fun condMapEmpty!19827 () Bool)

(declare-fun mapDefault!19827 () ValueCell!5720)

