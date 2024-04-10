; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40614 () Bool)

(assert start!40614)

(declare-fun b_free!10625 () Bool)

(declare-fun b_next!10625 () Bool)

(assert (=> start!40614 (= b_free!10625 (not b_next!10625))))

(declare-fun tp!37695 () Bool)

(declare-fun b_and!18633 () Bool)

(assert (=> start!40614 (= tp!37695 b_and!18633)))

(declare-fun mapIsEmpty!19578 () Bool)

(declare-fun mapRes!19578 () Bool)

(assert (=> mapIsEmpty!19578 mapRes!19578))

(declare-fun b!448232 () Bool)

(declare-fun e!263045 () Bool)

(assert (=> b!448232 (= e!263045 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17055 0))(
  ( (V!17056 (val!6026 Int)) )
))
(declare-fun minValue!515 () V!17055)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5638 0))(
  ( (ValueCellFull!5638 (v!8281 V!17055)) (EmptyCell!5638) )
))
(declare-datatypes ((array!27733 0))(
  ( (array!27734 (arr!13312 (Array (_ BitVec 32) ValueCell!5638)) (size!13664 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27733)

(declare-fun zeroValue!515 () V!17055)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17055)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!27735 0))(
  ( (array!27736 (arr!13313 (Array (_ BitVec 32) (_ BitVec 64))) (size!13665 (_ BitVec 32))) )
))
(declare-fun lt!204125 () array!27735)

(declare-datatypes ((tuple2!7904 0))(
  ( (tuple2!7905 (_1!3963 (_ BitVec 64)) (_2!3963 V!17055)) )
))
(declare-datatypes ((List!7969 0))(
  ( (Nil!7966) (Cons!7965 (h!8821 tuple2!7904) (t!13731 List!7969)) )
))
(declare-datatypes ((ListLongMap!6817 0))(
  ( (ListLongMap!6818 (toList!3424 List!7969)) )
))
(declare-fun lt!204124 () ListLongMap!6817)

(declare-fun getCurrentListMapNoExtraKeys!1610 (array!27735 array!27733 (_ BitVec 32) (_ BitVec 32) V!17055 V!17055 (_ BitVec 32) Int) ListLongMap!6817)

(assert (=> b!448232 (= lt!204124 (getCurrentListMapNoExtraKeys!1610 lt!204125 (array!27734 (store (arr!13312 _values!549) i!563 (ValueCellFull!5638 v!412)) (size!13664 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204126 () ListLongMap!6817)

(declare-fun _keys!709 () array!27735)

(assert (=> b!448232 (= lt!204126 (getCurrentListMapNoExtraKeys!1610 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448233 () Bool)

(declare-fun res!266377 () Bool)

(declare-fun e!263044 () Bool)

(assert (=> b!448233 (=> (not res!266377) (not e!263044))))

(assert (=> b!448233 (= res!266377 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13665 _keys!709))))))

(declare-fun b!448234 () Bool)

(declare-fun res!266368 () Bool)

(assert (=> b!448234 (=> (not res!266368) (not e!263044))))

(assert (=> b!448234 (= res!266368 (or (= (select (arr!13313 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13313 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448236 () Bool)

(declare-fun res!266371 () Bool)

(assert (=> b!448236 (=> (not res!266371) (not e!263045))))

(declare-datatypes ((List!7970 0))(
  ( (Nil!7967) (Cons!7966 (h!8822 (_ BitVec 64)) (t!13732 List!7970)) )
))
(declare-fun arrayNoDuplicates!0 (array!27735 (_ BitVec 32) List!7970) Bool)

(assert (=> b!448236 (= res!266371 (arrayNoDuplicates!0 lt!204125 #b00000000000000000000000000000000 Nil!7967))))

(declare-fun b!448237 () Bool)

(assert (=> b!448237 (= e!263044 e!263045)))

(declare-fun res!266375 () Bool)

(assert (=> b!448237 (=> (not res!266375) (not e!263045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27735 (_ BitVec 32)) Bool)

(assert (=> b!448237 (= res!266375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204125 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!448237 (= lt!204125 (array!27736 (store (arr!13313 _keys!709) i!563 k!794) (size!13665 _keys!709)))))

(declare-fun b!448238 () Bool)

(declare-fun res!266376 () Bool)

(assert (=> b!448238 (=> (not res!266376) (not e!263044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448238 (= res!266376 (validMask!0 mask!1025))))

(declare-fun b!448239 () Bool)

(declare-fun res!266374 () Bool)

(assert (=> b!448239 (=> (not res!266374) (not e!263044))))

(assert (=> b!448239 (= res!266374 (and (= (size!13664 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13665 _keys!709) (size!13664 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448240 () Bool)

(declare-fun res!266370 () Bool)

(assert (=> b!448240 (=> (not res!266370) (not e!263044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448240 (= res!266370 (validKeyInArray!0 k!794))))

(declare-fun b!448241 () Bool)

(declare-fun res!266379 () Bool)

(assert (=> b!448241 (=> (not res!266379) (not e!263045))))

(assert (=> b!448241 (= res!266379 (bvsle from!863 i!563))))

(declare-fun b!448242 () Bool)

(declare-fun res!266378 () Bool)

(assert (=> b!448242 (=> (not res!266378) (not e!263044))))

(assert (=> b!448242 (= res!266378 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7967))))

(declare-fun b!448243 () Bool)

(declare-fun e!263046 () Bool)

(declare-fun e!263048 () Bool)

(assert (=> b!448243 (= e!263046 (and e!263048 mapRes!19578))))

(declare-fun condMapEmpty!19578 () Bool)

(declare-fun mapDefault!19578 () ValueCell!5638)

