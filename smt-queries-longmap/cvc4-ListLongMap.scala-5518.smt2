; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72896 () Bool)

(assert start!72896)

(declare-fun b_free!13811 () Bool)

(declare-fun b_next!13811 () Bool)

(assert (=> start!72896 (= b_free!13811 (not b_next!13811))))

(declare-fun tp!48937 () Bool)

(declare-fun b_and!22897 () Bool)

(assert (=> start!72896 (= tp!48937 b_and!22897)))

(declare-fun b!846265 () Bool)

(declare-fun res!574946 () Bool)

(declare-fun e!472339 () Bool)

(assert (=> b!846265 (=> (not res!574946) (not e!472339))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48108 0))(
  ( (array!48109 (arr!23085 (Array (_ BitVec 32) (_ BitVec 64))) (size!23525 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48108)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!846265 (= res!574946 (and (= (select (arr!23085 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!846266 () Bool)

(declare-fun res!574944 () Bool)

(assert (=> b!846266 (=> (not res!574944) (not e!472339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846266 (= res!574944 (validKeyInArray!0 k!854))))

(declare-fun b!846267 () Bool)

(declare-fun res!574947 () Bool)

(assert (=> b!846267 (=> (not res!574947) (not e!472339))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846267 (= res!574947 (validMask!0 mask!1196))))

(declare-fun b!846268 () Bool)

(declare-fun e!472338 () Bool)

(declare-fun tp_is_empty!15947 () Bool)

(assert (=> b!846268 (= e!472338 tp_is_empty!15947)))

(declare-fun mapIsEmpty!25520 () Bool)

(declare-fun mapRes!25520 () Bool)

(assert (=> mapIsEmpty!25520 mapRes!25520))

(declare-fun res!574949 () Bool)

(assert (=> start!72896 (=> (not res!574949) (not e!472339))))

(assert (=> start!72896 (= res!574949 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23525 _keys!868))))))

(assert (=> start!72896 e!472339))

(assert (=> start!72896 tp_is_empty!15947))

(assert (=> start!72896 true))

(assert (=> start!72896 tp!48937))

(declare-fun array_inv!18342 (array!48108) Bool)

(assert (=> start!72896 (array_inv!18342 _keys!868)))

(declare-datatypes ((V!26309 0))(
  ( (V!26310 (val!8021 Int)) )
))
(declare-datatypes ((ValueCell!7534 0))(
  ( (ValueCellFull!7534 (v!10446 V!26309)) (EmptyCell!7534) )
))
(declare-datatypes ((array!48110 0))(
  ( (array!48111 (arr!23086 (Array (_ BitVec 32) ValueCell!7534)) (size!23526 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48110)

(declare-fun e!472340 () Bool)

(declare-fun array_inv!18343 (array!48110) Bool)

(assert (=> start!72896 (and (array_inv!18343 _values!688) e!472340)))

(declare-fun b!846269 () Bool)

(declare-fun res!574945 () Bool)

(assert (=> b!846269 (=> (not res!574945) (not e!472339))))

(assert (=> b!846269 (= res!574945 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23525 _keys!868))))))

(declare-fun b!846270 () Bool)

(assert (=> b!846270 (= e!472339 false)))

(declare-fun v!557 () V!26309)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10476 0))(
  ( (tuple2!10477 (_1!5249 (_ BitVec 64)) (_2!5249 V!26309)) )
))
(declare-datatypes ((List!16337 0))(
  ( (Nil!16334) (Cons!16333 (h!17464 tuple2!10476) (t!22708 List!16337)) )
))
(declare-datatypes ((ListLongMap!9245 0))(
  ( (ListLongMap!9246 (toList!4638 List!16337)) )
))
(declare-fun lt!381504 () ListLongMap!9245)

(declare-fun minValue!654 () V!26309)

(declare-fun zeroValue!654 () V!26309)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2623 (array!48108 array!48110 (_ BitVec 32) (_ BitVec 32) V!26309 V!26309 (_ BitVec 32) Int) ListLongMap!9245)

(assert (=> b!846270 (= lt!381504 (getCurrentListMapNoExtraKeys!2623 _keys!868 (array!48111 (store (arr!23086 _values!688) i!612 (ValueCellFull!7534 v!557)) (size!23526 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381505 () ListLongMap!9245)

(assert (=> b!846270 (= lt!381505 (getCurrentListMapNoExtraKeys!2623 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846271 () Bool)

(declare-fun e!472341 () Bool)

(assert (=> b!846271 (= e!472341 tp_is_empty!15947)))

(declare-fun b!846272 () Bool)

(declare-fun res!574948 () Bool)

(assert (=> b!846272 (=> (not res!574948) (not e!472339))))

(declare-datatypes ((List!16338 0))(
  ( (Nil!16335) (Cons!16334 (h!17465 (_ BitVec 64)) (t!22709 List!16338)) )
))
(declare-fun arrayNoDuplicates!0 (array!48108 (_ BitVec 32) List!16338) Bool)

(assert (=> b!846272 (= res!574948 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16335))))

(declare-fun b!846273 () Bool)

(assert (=> b!846273 (= e!472340 (and e!472341 mapRes!25520))))

(declare-fun condMapEmpty!25520 () Bool)

(declare-fun mapDefault!25520 () ValueCell!7534)

