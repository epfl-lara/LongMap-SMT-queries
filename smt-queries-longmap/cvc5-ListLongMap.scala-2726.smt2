; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40174 () Bool)

(assert start!40174)

(declare-fun b_free!10441 () Bool)

(declare-fun b_next!10441 () Bool)

(assert (=> start!40174 (= b_free!10441 (not b_next!10441))))

(declare-fun tp!36852 () Bool)

(declare-fun b_and!18409 () Bool)

(assert (=> start!40174 (= tp!36852 b_and!18409)))

(declare-fun b!439940 () Bool)

(declare-fun e!259276 () Bool)

(declare-fun e!259272 () Bool)

(assert (=> b!439940 (= e!259276 e!259272)))

(declare-fun res!260103 () Bool)

(assert (=> b!439940 (=> (not res!260103) (not e!259272))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439940 (= res!260103 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16563 0))(
  ( (V!16564 (val!5841 Int)) )
))
(declare-fun minValue!515 () V!16563)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5453 0))(
  ( (ValueCellFull!5453 (v!8088 V!16563)) (EmptyCell!5453) )
))
(declare-datatypes ((array!27001 0))(
  ( (array!27002 (arr!12950 (Array (_ BitVec 32) ValueCell!5453)) (size!13302 (_ BitVec 32))) )
))
(declare-fun lt!202427 () array!27001)

(declare-fun zeroValue!515 () V!16563)

(declare-datatypes ((array!27003 0))(
  ( (array!27004 (arr!12951 (Array (_ BitVec 32) (_ BitVec 64))) (size!13303 (_ BitVec 32))) )
))
(declare-fun lt!202430 () array!27003)

(declare-datatypes ((tuple2!7758 0))(
  ( (tuple2!7759 (_1!3890 (_ BitVec 64)) (_2!3890 V!16563)) )
))
(declare-datatypes ((List!7756 0))(
  ( (Nil!7753) (Cons!7752 (h!8608 tuple2!7758) (t!13512 List!7756)) )
))
(declare-datatypes ((ListLongMap!6671 0))(
  ( (ListLongMap!6672 (toList!3351 List!7756)) )
))
(declare-fun lt!202429 () ListLongMap!6671)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1540 (array!27003 array!27001 (_ BitVec 32) (_ BitVec 32) V!16563 V!16563 (_ BitVec 32) Int) ListLongMap!6671)

(assert (=> b!439940 (= lt!202429 (getCurrentListMapNoExtraKeys!1540 lt!202430 lt!202427 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27001)

(declare-fun v!412 () V!16563)

(assert (=> b!439940 (= lt!202427 (array!27002 (store (arr!12950 _values!549) i!563 (ValueCellFull!5453 v!412)) (size!13302 _values!549)))))

(declare-fun lt!202428 () ListLongMap!6671)

(declare-fun _keys!709 () array!27003)

(assert (=> b!439940 (= lt!202428 (getCurrentListMapNoExtraKeys!1540 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439941 () Bool)

(declare-fun e!259273 () Bool)

(declare-fun tp_is_empty!11593 () Bool)

(assert (=> b!439941 (= e!259273 tp_is_empty!11593)))

(declare-fun b!439942 () Bool)

(declare-fun e!259275 () Bool)

(assert (=> b!439942 (= e!259275 e!259276)))

(declare-fun res!260100 () Bool)

(assert (=> b!439942 (=> (not res!260100) (not e!259276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27003 (_ BitVec 32)) Bool)

(assert (=> b!439942 (= res!260100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202430 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!439942 (= lt!202430 (array!27004 (store (arr!12951 _keys!709) i!563 k!794) (size!13303 _keys!709)))))

(declare-fun b!439943 () Bool)

(declare-fun res!260098 () Bool)

(assert (=> b!439943 (=> (not res!260098) (not e!259276))))

(assert (=> b!439943 (= res!260098 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19011 () Bool)

(declare-fun mapRes!19011 () Bool)

(assert (=> mapIsEmpty!19011 mapRes!19011))

(declare-fun b!439944 () Bool)

(assert (=> b!439944 (= e!259272 (not true))))

(declare-fun +!1491 (ListLongMap!6671 tuple2!7758) ListLongMap!6671)

(assert (=> b!439944 (= (getCurrentListMapNoExtraKeys!1540 lt!202430 lt!202427 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1491 (getCurrentListMapNoExtraKeys!1540 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7759 k!794 v!412)))))

(declare-datatypes ((Unit!13086 0))(
  ( (Unit!13087) )
))
(declare-fun lt!202426 () Unit!13086)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!660 (array!27003 array!27001 (_ BitVec 32) (_ BitVec 32) V!16563 V!16563 (_ BitVec 32) (_ BitVec 64) V!16563 (_ BitVec 32) Int) Unit!13086)

(assert (=> b!439944 (= lt!202426 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!660 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!260099 () Bool)

(assert (=> start!40174 (=> (not res!260099) (not e!259275))))

(assert (=> start!40174 (= res!260099 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13303 _keys!709))))))

(assert (=> start!40174 e!259275))

(assert (=> start!40174 tp_is_empty!11593))

(assert (=> start!40174 tp!36852))

(assert (=> start!40174 true))

(declare-fun e!259277 () Bool)

(declare-fun array_inv!9402 (array!27001) Bool)

(assert (=> start!40174 (and (array_inv!9402 _values!549) e!259277)))

(declare-fun array_inv!9403 (array!27003) Bool)

(assert (=> start!40174 (array_inv!9403 _keys!709)))

(declare-fun b!439945 () Bool)

(declare-fun res!260092 () Bool)

(assert (=> b!439945 (=> (not res!260092) (not e!259275))))

(assert (=> b!439945 (= res!260092 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13303 _keys!709))))))

(declare-fun b!439946 () Bool)

(declare-fun res!260091 () Bool)

(assert (=> b!439946 (=> (not res!260091) (not e!259275))))

(declare-datatypes ((List!7757 0))(
  ( (Nil!7754) (Cons!7753 (h!8609 (_ BitVec 64)) (t!13513 List!7757)) )
))
(declare-fun arrayNoDuplicates!0 (array!27003 (_ BitVec 32) List!7757) Bool)

(assert (=> b!439946 (= res!260091 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7754))))

(declare-fun b!439947 () Bool)

(declare-fun res!260093 () Bool)

(assert (=> b!439947 (=> (not res!260093) (not e!259275))))

(assert (=> b!439947 (= res!260093 (and (= (size!13302 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13303 _keys!709) (size!13302 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439948 () Bool)

(declare-fun res!260102 () Bool)

(assert (=> b!439948 (=> (not res!260102) (not e!259275))))

(assert (=> b!439948 (= res!260102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439949 () Bool)

(declare-fun res!260095 () Bool)

(assert (=> b!439949 (=> (not res!260095) (not e!259275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439949 (= res!260095 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!19011 () Bool)

(declare-fun tp!36851 () Bool)

(assert (=> mapNonEmpty!19011 (= mapRes!19011 (and tp!36851 e!259273))))

(declare-fun mapValue!19011 () ValueCell!5453)

(declare-fun mapRest!19011 () (Array (_ BitVec 32) ValueCell!5453))

(declare-fun mapKey!19011 () (_ BitVec 32))

(assert (=> mapNonEmpty!19011 (= (arr!12950 _values!549) (store mapRest!19011 mapKey!19011 mapValue!19011))))

(declare-fun b!439950 () Bool)

(declare-fun res!260101 () Bool)

(assert (=> b!439950 (=> (not res!260101) (not e!259275))))

(assert (=> b!439950 (= res!260101 (or (= (select (arr!12951 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12951 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439951 () Bool)

(declare-fun res!260096 () Bool)

(assert (=> b!439951 (=> (not res!260096) (not e!259275))))

(declare-fun arrayContainsKey!0 (array!27003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439951 (= res!260096 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!439952 () Bool)

(declare-fun e!259278 () Bool)

(assert (=> b!439952 (= e!259278 tp_is_empty!11593)))

(declare-fun b!439953 () Bool)

(declare-fun res!260097 () Bool)

(assert (=> b!439953 (=> (not res!260097) (not e!259275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439953 (= res!260097 (validMask!0 mask!1025))))

(declare-fun b!439954 () Bool)

(assert (=> b!439954 (= e!259277 (and e!259278 mapRes!19011))))

(declare-fun condMapEmpty!19011 () Bool)

(declare-fun mapDefault!19011 () ValueCell!5453)

