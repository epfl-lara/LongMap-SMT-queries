; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40136 () Bool)

(assert start!40136)

(declare-fun b_free!10403 () Bool)

(declare-fun b_next!10403 () Bool)

(assert (=> start!40136 (= b_free!10403 (not b_next!10403))))

(declare-fun tp!36737 () Bool)

(declare-fun b_and!18371 () Bool)

(assert (=> start!40136 (= tp!36737 b_and!18371)))

(declare-fun b!439028 () Bool)

(declare-fun e!258873 () Bool)

(declare-fun tp_is_empty!11555 () Bool)

(assert (=> b!439028 (= e!258873 tp_is_empty!11555)))

(declare-fun res!259358 () Bool)

(declare-fun e!258875 () Bool)

(assert (=> start!40136 (=> (not res!259358) (not e!258875))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26927 0))(
  ( (array!26928 (arr!12913 (Array (_ BitVec 32) (_ BitVec 64))) (size!13265 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26927)

(assert (=> start!40136 (= res!259358 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13265 _keys!709))))))

(assert (=> start!40136 e!258875))

(assert (=> start!40136 tp_is_empty!11555))

(assert (=> start!40136 tp!36737))

(assert (=> start!40136 true))

(declare-datatypes ((V!16511 0))(
  ( (V!16512 (val!5822 Int)) )
))
(declare-datatypes ((ValueCell!5434 0))(
  ( (ValueCellFull!5434 (v!8069 V!16511)) (EmptyCell!5434) )
))
(declare-datatypes ((array!26929 0))(
  ( (array!26930 (arr!12914 (Array (_ BitVec 32) ValueCell!5434)) (size!13266 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26929)

(declare-fun e!258877 () Bool)

(declare-fun array_inv!9380 (array!26929) Bool)

(assert (=> start!40136 (and (array_inv!9380 _values!549) e!258877)))

(declare-fun array_inv!9381 (array!26927) Bool)

(assert (=> start!40136 (array_inv!9381 _keys!709)))

(declare-fun mapIsEmpty!18954 () Bool)

(declare-fun mapRes!18954 () Bool)

(assert (=> mapIsEmpty!18954 mapRes!18954))

(declare-fun mapNonEmpty!18954 () Bool)

(declare-fun tp!36738 () Bool)

(assert (=> mapNonEmpty!18954 (= mapRes!18954 (and tp!36738 e!258873))))

(declare-fun mapRest!18954 () (Array (_ BitVec 32) ValueCell!5434))

(declare-fun mapValue!18954 () ValueCell!5434)

(declare-fun mapKey!18954 () (_ BitVec 32))

(assert (=> mapNonEmpty!18954 (= (arr!12914 _values!549) (store mapRest!18954 mapKey!18954 mapValue!18954))))

(declare-fun b!439029 () Bool)

(declare-fun res!259362 () Bool)

(assert (=> b!439029 (=> (not res!259362) (not e!258875))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439029 (= res!259362 (validKeyInArray!0 k!794))))

(declare-fun b!439030 () Bool)

(declare-fun res!259353 () Bool)

(assert (=> b!439030 (=> (not res!259353) (not e!258875))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!439030 (= res!259353 (and (= (size!13266 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13265 _keys!709) (size!13266 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439031 () Bool)

(declare-fun res!259354 () Bool)

(assert (=> b!439031 (=> (not res!259354) (not e!258875))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439031 (= res!259354 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13265 _keys!709))))))

(declare-fun b!439032 () Bool)

(declare-fun e!258878 () Bool)

(declare-fun e!258874 () Bool)

(assert (=> b!439032 (= e!258878 e!258874)))

(declare-fun res!259360 () Bool)

(assert (=> b!439032 (=> (not res!259360) (not e!258874))))

(assert (=> b!439032 (= res!259360 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!202144 () array!26929)

(declare-fun zeroValue!515 () V!16511)

(declare-datatypes ((tuple2!7728 0))(
  ( (tuple2!7729 (_1!3875 (_ BitVec 64)) (_2!3875 V!16511)) )
))
(declare-datatypes ((List!7725 0))(
  ( (Nil!7722) (Cons!7721 (h!8577 tuple2!7728) (t!13481 List!7725)) )
))
(declare-datatypes ((ListLongMap!6641 0))(
  ( (ListLongMap!6642 (toList!3336 List!7725)) )
))
(declare-fun lt!202145 () ListLongMap!6641)

(declare-fun minValue!515 () V!16511)

(declare-fun lt!202141 () array!26927)

(declare-fun getCurrentListMapNoExtraKeys!1525 (array!26927 array!26929 (_ BitVec 32) (_ BitVec 32) V!16511 V!16511 (_ BitVec 32) Int) ListLongMap!6641)

(assert (=> b!439032 (= lt!202145 (getCurrentListMapNoExtraKeys!1525 lt!202141 lt!202144 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16511)

(assert (=> b!439032 (= lt!202144 (array!26930 (store (arr!12914 _values!549) i!563 (ValueCellFull!5434 v!412)) (size!13266 _values!549)))))

(declare-fun lt!202143 () ListLongMap!6641)

(assert (=> b!439032 (= lt!202143 (getCurrentListMapNoExtraKeys!1525 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439033 () Bool)

(declare-fun res!259351 () Bool)

(assert (=> b!439033 (=> (not res!259351) (not e!258878))))

(declare-datatypes ((List!7726 0))(
  ( (Nil!7723) (Cons!7722 (h!8578 (_ BitVec 64)) (t!13482 List!7726)) )
))
(declare-fun arrayNoDuplicates!0 (array!26927 (_ BitVec 32) List!7726) Bool)

(assert (=> b!439033 (= res!259351 (arrayNoDuplicates!0 lt!202141 #b00000000000000000000000000000000 Nil!7723))))

(declare-fun b!439034 () Bool)

(declare-fun res!259356 () Bool)

(assert (=> b!439034 (=> (not res!259356) (not e!258875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439034 (= res!259356 (validMask!0 mask!1025))))

(declare-fun b!439035 () Bool)

(assert (=> b!439035 (= e!258875 e!258878)))

(declare-fun res!259352 () Bool)

(assert (=> b!439035 (=> (not res!259352) (not e!258878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26927 (_ BitVec 32)) Bool)

(assert (=> b!439035 (= res!259352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202141 mask!1025))))

(assert (=> b!439035 (= lt!202141 (array!26928 (store (arr!12913 _keys!709) i!563 k!794) (size!13265 _keys!709)))))

(declare-fun b!439036 () Bool)

(declare-fun res!259350 () Bool)

(assert (=> b!439036 (=> (not res!259350) (not e!258875))))

(assert (=> b!439036 (= res!259350 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7723))))

(declare-fun b!439037 () Bool)

(declare-fun res!259357 () Bool)

(assert (=> b!439037 (=> (not res!259357) (not e!258878))))

(assert (=> b!439037 (= res!259357 (bvsle from!863 i!563))))

(declare-fun b!439038 () Bool)

(declare-fun res!259355 () Bool)

(assert (=> b!439038 (=> (not res!259355) (not e!258875))))

(assert (=> b!439038 (= res!259355 (or (= (select (arr!12913 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12913 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439039 () Bool)

(declare-fun res!259361 () Bool)

(assert (=> b!439039 (=> (not res!259361) (not e!258875))))

(declare-fun arrayContainsKey!0 (array!26927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439039 (= res!259361 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!439040 () Bool)

(assert (=> b!439040 (= e!258874 (not true))))

(declare-fun +!1478 (ListLongMap!6641 tuple2!7728) ListLongMap!6641)

(assert (=> b!439040 (= (getCurrentListMapNoExtraKeys!1525 lt!202141 lt!202144 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1478 (getCurrentListMapNoExtraKeys!1525 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7729 k!794 v!412)))))

(declare-datatypes ((Unit!13060 0))(
  ( (Unit!13061) )
))
(declare-fun lt!202142 () Unit!13060)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!647 (array!26927 array!26929 (_ BitVec 32) (_ BitVec 32) V!16511 V!16511 (_ BitVec 32) (_ BitVec 64) V!16511 (_ BitVec 32) Int) Unit!13060)

(assert (=> b!439040 (= lt!202142 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!647 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439041 () Bool)

(declare-fun e!258876 () Bool)

(assert (=> b!439041 (= e!258876 tp_is_empty!11555)))

(declare-fun b!439042 () Bool)

(assert (=> b!439042 (= e!258877 (and e!258876 mapRes!18954))))

(declare-fun condMapEmpty!18954 () Bool)

(declare-fun mapDefault!18954 () ValueCell!5434)

