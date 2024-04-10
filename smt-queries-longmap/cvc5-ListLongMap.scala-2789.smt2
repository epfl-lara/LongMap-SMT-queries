; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40622 () Bool)

(assert start!40622)

(declare-fun b_free!10633 () Bool)

(declare-fun b_next!10633 () Bool)

(assert (=> start!40622 (= b_free!10633 (not b_next!10633))))

(declare-fun tp!37719 () Bool)

(declare-fun b_and!18641 () Bool)

(assert (=> start!40622 (= tp!37719 b_and!18641)))

(declare-fun mapNonEmpty!19590 () Bool)

(declare-fun mapRes!19590 () Bool)

(declare-fun tp!37718 () Bool)

(declare-fun e!263115 () Bool)

(assert (=> mapNonEmpty!19590 (= mapRes!19590 (and tp!37718 e!263115))))

(declare-fun mapKey!19590 () (_ BitVec 32))

(declare-datatypes ((V!17067 0))(
  ( (V!17068 (val!6030 Int)) )
))
(declare-datatypes ((ValueCell!5642 0))(
  ( (ValueCellFull!5642 (v!8285 V!17067)) (EmptyCell!5642) )
))
(declare-datatypes ((array!27749 0))(
  ( (array!27750 (arr!13320 (Array (_ BitVec 32) ValueCell!5642)) (size!13672 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27749)

(declare-fun mapRest!19590 () (Array (_ BitVec 32) ValueCell!5642))

(declare-fun mapValue!19590 () ValueCell!5642)

(assert (=> mapNonEmpty!19590 (= (arr!13320 _values!549) (store mapRest!19590 mapKey!19590 mapValue!19590))))

(declare-fun mapIsEmpty!19590 () Bool)

(assert (=> mapIsEmpty!19590 mapRes!19590))

(declare-fun res!266513 () Bool)

(declare-fun e!263120 () Bool)

(assert (=> start!40622 (=> (not res!266513) (not e!263120))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27751 0))(
  ( (array!27752 (arr!13321 (Array (_ BitVec 32) (_ BitVec 64))) (size!13673 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27751)

(assert (=> start!40622 (= res!266513 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13673 _keys!709))))))

(assert (=> start!40622 e!263120))

(declare-fun tp_is_empty!11971 () Bool)

(assert (=> start!40622 tp_is_empty!11971))

(assert (=> start!40622 tp!37719))

(assert (=> start!40622 true))

(declare-fun e!263116 () Bool)

(declare-fun array_inv!9650 (array!27749) Bool)

(assert (=> start!40622 (and (array_inv!9650 _values!549) e!263116)))

(declare-fun array_inv!9651 (array!27751) Bool)

(assert (=> start!40622 (array_inv!9651 _keys!709)))

(declare-fun b!448412 () Bool)

(declare-fun res!266519 () Bool)

(assert (=> b!448412 (=> (not res!266519) (not e!263120))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448412 (= res!266519 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13673 _keys!709))))))

(declare-fun b!448413 () Bool)

(declare-fun e!263118 () Bool)

(assert (=> b!448413 (= e!263118 false)))

(declare-fun minValue!515 () V!17067)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17067)

(declare-fun v!412 () V!17067)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!204160 () array!27751)

(declare-datatypes ((tuple2!7910 0))(
  ( (tuple2!7911 (_1!3966 (_ BitVec 64)) (_2!3966 V!17067)) )
))
(declare-datatypes ((List!7975 0))(
  ( (Nil!7972) (Cons!7971 (h!8827 tuple2!7910) (t!13737 List!7975)) )
))
(declare-datatypes ((ListLongMap!6823 0))(
  ( (ListLongMap!6824 (toList!3427 List!7975)) )
))
(declare-fun lt!204161 () ListLongMap!6823)

(declare-fun getCurrentListMapNoExtraKeys!1613 (array!27751 array!27749 (_ BitVec 32) (_ BitVec 32) V!17067 V!17067 (_ BitVec 32) Int) ListLongMap!6823)

(assert (=> b!448413 (= lt!204161 (getCurrentListMapNoExtraKeys!1613 lt!204160 (array!27750 (store (arr!13320 _values!549) i!563 (ValueCellFull!5642 v!412)) (size!13672 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204162 () ListLongMap!6823)

(assert (=> b!448413 (= lt!204162 (getCurrentListMapNoExtraKeys!1613 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448414 () Bool)

(declare-fun res!266516 () Bool)

(assert (=> b!448414 (=> (not res!266516) (not e!263118))))

(assert (=> b!448414 (= res!266516 (bvsle from!863 i!563))))

(declare-fun b!448415 () Bool)

(declare-fun e!263117 () Bool)

(assert (=> b!448415 (= e!263116 (and e!263117 mapRes!19590))))

(declare-fun condMapEmpty!19590 () Bool)

(declare-fun mapDefault!19590 () ValueCell!5642)

