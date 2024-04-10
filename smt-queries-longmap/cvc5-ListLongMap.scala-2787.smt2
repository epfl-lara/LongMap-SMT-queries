; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40610 () Bool)

(assert start!40610)

(declare-fun b_free!10621 () Bool)

(declare-fun b_next!10621 () Bool)

(assert (=> start!40610 (= b_free!10621 (not b_next!10621))))

(declare-fun tp!37683 () Bool)

(declare-fun b_and!18629 () Bool)

(assert (=> start!40610 (= tp!37683 b_and!18629)))

(declare-fun mapIsEmpty!19572 () Bool)

(declare-fun mapRes!19572 () Bool)

(assert (=> mapIsEmpty!19572 mapRes!19572))

(declare-fun b!448142 () Bool)

(declare-fun res!266307 () Bool)

(declare-fun e!263010 () Bool)

(assert (=> b!448142 (=> (not res!266307) (not e!263010))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448142 (= res!266307 (bvsle from!863 i!563))))

(declare-fun b!448143 () Bool)

(assert (=> b!448143 (= e!263010 false)))

(declare-datatypes ((V!17051 0))(
  ( (V!17052 (val!6024 Int)) )
))
(declare-fun minValue!515 () V!17051)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!27725 0))(
  ( (array!27726 (arr!13308 (Array (_ BitVec 32) (_ BitVec 64))) (size!13660 (_ BitVec 32))) )
))
(declare-fun lt!204107 () array!27725)

(declare-fun v!412 () V!17051)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5636 0))(
  ( (ValueCellFull!5636 (v!8279 V!17051)) (EmptyCell!5636) )
))
(declare-datatypes ((array!27727 0))(
  ( (array!27728 (arr!13309 (Array (_ BitVec 32) ValueCell!5636)) (size!13661 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27727)

(declare-datatypes ((tuple2!7900 0))(
  ( (tuple2!7901 (_1!3961 (_ BitVec 64)) (_2!3961 V!17051)) )
))
(declare-datatypes ((List!7965 0))(
  ( (Nil!7962) (Cons!7961 (h!8817 tuple2!7900) (t!13727 List!7965)) )
))
(declare-datatypes ((ListLongMap!6813 0))(
  ( (ListLongMap!6814 (toList!3422 List!7965)) )
))
(declare-fun lt!204108 () ListLongMap!6813)

(declare-fun zeroValue!515 () V!17051)

(declare-fun getCurrentListMapNoExtraKeys!1608 (array!27725 array!27727 (_ BitVec 32) (_ BitVec 32) V!17051 V!17051 (_ BitVec 32) Int) ListLongMap!6813)

(assert (=> b!448143 (= lt!204108 (getCurrentListMapNoExtraKeys!1608 lt!204107 (array!27728 (store (arr!13309 _values!549) i!563 (ValueCellFull!5636 v!412)) (size!13661 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204106 () ListLongMap!6813)

(declare-fun _keys!709 () array!27725)

(assert (=> b!448143 (= lt!204106 (getCurrentListMapNoExtraKeys!1608 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448144 () Bool)

(declare-fun e!263007 () Bool)

(declare-fun tp_is_empty!11959 () Bool)

(assert (=> b!448144 (= e!263007 tp_is_empty!11959)))

(declare-fun res!266306 () Bool)

(declare-fun e!263008 () Bool)

(assert (=> start!40610 (=> (not res!266306) (not e!263008))))

(assert (=> start!40610 (= res!266306 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13660 _keys!709))))))

(assert (=> start!40610 e!263008))

(assert (=> start!40610 tp_is_empty!11959))

(assert (=> start!40610 tp!37683))

(assert (=> start!40610 true))

(declare-fun e!263011 () Bool)

(declare-fun array_inv!9642 (array!27727) Bool)

(assert (=> start!40610 (and (array_inv!9642 _values!549) e!263011)))

(declare-fun array_inv!9643 (array!27725) Bool)

(assert (=> start!40610 (array_inv!9643 _keys!709)))

(declare-fun b!448145 () Bool)

(declare-fun res!266300 () Bool)

(assert (=> b!448145 (=> (not res!266300) (not e!263010))))

(declare-datatypes ((List!7966 0))(
  ( (Nil!7963) (Cons!7962 (h!8818 (_ BitVec 64)) (t!13728 List!7966)) )
))
(declare-fun arrayNoDuplicates!0 (array!27725 (_ BitVec 32) List!7966) Bool)

(assert (=> b!448145 (= res!266300 (arrayNoDuplicates!0 lt!204107 #b00000000000000000000000000000000 Nil!7963))))

(declare-fun b!448146 () Bool)

(declare-fun res!266303 () Bool)

(assert (=> b!448146 (=> (not res!266303) (not e!263008))))

(assert (=> b!448146 (= res!266303 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7963))))

(declare-fun b!448147 () Bool)

(declare-fun res!266304 () Bool)

(assert (=> b!448147 (=> (not res!266304) (not e!263008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448147 (= res!266304 (validMask!0 mask!1025))))

(declare-fun b!448148 () Bool)

(declare-fun e!263012 () Bool)

(assert (=> b!448148 (= e!263012 tp_is_empty!11959)))

(declare-fun b!448149 () Bool)

(assert (=> b!448149 (= e!263008 e!263010)))

(declare-fun res!266297 () Bool)

(assert (=> b!448149 (=> (not res!266297) (not e!263010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27725 (_ BitVec 32)) Bool)

(assert (=> b!448149 (= res!266297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204107 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!448149 (= lt!204107 (array!27726 (store (arr!13308 _keys!709) i!563 k!794) (size!13660 _keys!709)))))

(declare-fun mapNonEmpty!19572 () Bool)

(declare-fun tp!37682 () Bool)

(assert (=> mapNonEmpty!19572 (= mapRes!19572 (and tp!37682 e!263007))))

(declare-fun mapKey!19572 () (_ BitVec 32))

(declare-fun mapRest!19572 () (Array (_ BitVec 32) ValueCell!5636))

(declare-fun mapValue!19572 () ValueCell!5636)

(assert (=> mapNonEmpty!19572 (= (arr!13309 _values!549) (store mapRest!19572 mapKey!19572 mapValue!19572))))

(declare-fun b!448150 () Bool)

(assert (=> b!448150 (= e!263011 (and e!263012 mapRes!19572))))

(declare-fun condMapEmpty!19572 () Bool)

(declare-fun mapDefault!19572 () ValueCell!5636)

