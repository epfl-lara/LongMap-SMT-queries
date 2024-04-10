; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72386 () Bool)

(assert start!72386)

(declare-fun b_free!13571 () Bool)

(declare-fun b_next!13571 () Bool)

(assert (=> start!72386 (= b_free!13571 (not b_next!13571))))

(declare-fun tp!47811 () Bool)

(declare-fun b_and!22657 () Bool)

(assert (=> start!72386 (= tp!47811 b_and!22657)))

(declare-fun b!838946 () Bool)

(declare-fun e!468252 () Bool)

(declare-fun tp_is_empty!15437 () Bool)

(assert (=> b!838946 (= e!468252 tp_is_empty!15437)))

(declare-fun b!838947 () Bool)

(declare-fun res!570443 () Bool)

(declare-fun e!468251 () Bool)

(assert (=> b!838947 (=> (not res!570443) (not e!468251))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47160 0))(
  ( (array!47161 (arr!22611 (Array (_ BitVec 32) (_ BitVec 64))) (size!23051 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47160)

(declare-datatypes ((V!25629 0))(
  ( (V!25630 (val!7766 Int)) )
))
(declare-datatypes ((ValueCell!7279 0))(
  ( (ValueCellFull!7279 (v!10191 V!25629)) (EmptyCell!7279) )
))
(declare-datatypes ((array!47162 0))(
  ( (array!47163 (arr!22612 (Array (_ BitVec 32) ValueCell!7279)) (size!23052 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47162)

(assert (=> b!838947 (= res!570443 (and (= (size!23052 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23051 _keys!868) (size!23052 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838948 () Bool)

(assert (=> b!838948 (= e!468251 (not true))))

(declare-fun e!468254 () Bool)

(assert (=> b!838948 e!468254))

(declare-fun c!91216 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!838948 (= c!91216 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25629)

(declare-fun defaultEntry!696 () Int)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!25629)

(declare-datatypes ((Unit!28813 0))(
  ( (Unit!28814) )
))
(declare-fun lt!380722 () Unit!28813)

(declare-fun zeroValue!654 () V!25629)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!252 (array!47160 array!47162 (_ BitVec 32) (_ BitVec 32) V!25629 V!25629 (_ BitVec 32) (_ BitVec 64) V!25629 (_ BitVec 32) Int) Unit!28813)

(assert (=> b!838948 (= lt!380722 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!252 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!570447 () Bool)

(assert (=> start!72386 (=> (not res!570447) (not e!468251))))

(assert (=> start!72386 (= res!570447 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23051 _keys!868))))))

(assert (=> start!72386 e!468251))

(assert (=> start!72386 tp_is_empty!15437))

(assert (=> start!72386 true))

(assert (=> start!72386 tp!47811))

(declare-fun array_inv!18014 (array!47160) Bool)

(assert (=> start!72386 (array_inv!18014 _keys!868)))

(declare-fun e!468255 () Bool)

(declare-fun array_inv!18015 (array!47162) Bool)

(assert (=> start!72386 (and (array_inv!18015 _values!688) e!468255)))

(declare-fun b!838949 () Bool)

(declare-fun res!570442 () Bool)

(assert (=> b!838949 (=> (not res!570442) (not e!468251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838949 (= res!570442 (validMask!0 mask!1196))))

(declare-fun b!838950 () Bool)

(declare-datatypes ((tuple2!10276 0))(
  ( (tuple2!10277 (_1!5149 (_ BitVec 64)) (_2!5149 V!25629)) )
))
(declare-datatypes ((List!16076 0))(
  ( (Nil!16073) (Cons!16072 (h!17203 tuple2!10276) (t!22447 List!16076)) )
))
(declare-datatypes ((ListLongMap!9045 0))(
  ( (ListLongMap!9046 (toList!4538 List!16076)) )
))
(declare-fun call!36946 () ListLongMap!9045)

(declare-fun call!36947 () ListLongMap!9045)

(assert (=> b!838950 (= e!468254 (= call!36946 call!36947))))

(declare-fun mapNonEmpty!24755 () Bool)

(declare-fun mapRes!24755 () Bool)

(declare-fun tp!47812 () Bool)

(assert (=> mapNonEmpty!24755 (= mapRes!24755 (and tp!47812 e!468252))))

(declare-fun mapValue!24755 () ValueCell!7279)

(declare-fun mapRest!24755 () (Array (_ BitVec 32) ValueCell!7279))

(declare-fun mapKey!24755 () (_ BitVec 32))

(assert (=> mapNonEmpty!24755 (= (arr!22612 _values!688) (store mapRest!24755 mapKey!24755 mapValue!24755))))

(declare-fun bm!36943 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2530 (array!47160 array!47162 (_ BitVec 32) (_ BitVec 32) V!25629 V!25629 (_ BitVec 32) Int) ListLongMap!9045)

(assert (=> bm!36943 (= call!36947 (getCurrentListMapNoExtraKeys!2530 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838951 () Bool)

(declare-fun res!570446 () Bool)

(assert (=> b!838951 (=> (not res!570446) (not e!468251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47160 (_ BitVec 32)) Bool)

(assert (=> b!838951 (= res!570446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!36944 () Bool)

(assert (=> bm!36944 (= call!36946 (getCurrentListMapNoExtraKeys!2530 _keys!868 (array!47163 (store (arr!22612 _values!688) i!612 (ValueCellFull!7279 v!557)) (size!23052 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838952 () Bool)

(declare-fun res!570445 () Bool)

(assert (=> b!838952 (=> (not res!570445) (not e!468251))))

(assert (=> b!838952 (= res!570445 (and (= (select (arr!22611 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23051 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!838953 () Bool)

(declare-fun res!570444 () Bool)

(assert (=> b!838953 (=> (not res!570444) (not e!468251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838953 (= res!570444 (validKeyInArray!0 k!854))))

(declare-fun b!838954 () Bool)

(declare-fun res!570448 () Bool)

(assert (=> b!838954 (=> (not res!570448) (not e!468251))))

(declare-datatypes ((List!16077 0))(
  ( (Nil!16074) (Cons!16073 (h!17204 (_ BitVec 64)) (t!22448 List!16077)) )
))
(declare-fun arrayNoDuplicates!0 (array!47160 (_ BitVec 32) List!16077) Bool)

(assert (=> b!838954 (= res!570448 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16074))))

(declare-fun b!838955 () Bool)

(declare-fun e!468256 () Bool)

(assert (=> b!838955 (= e!468256 tp_is_empty!15437)))

(declare-fun b!838956 () Bool)

(declare-fun +!2011 (ListLongMap!9045 tuple2!10276) ListLongMap!9045)

(assert (=> b!838956 (= e!468254 (= call!36946 (+!2011 call!36947 (tuple2!10277 k!854 v!557))))))

(declare-fun b!838957 () Bool)

(assert (=> b!838957 (= e!468255 (and e!468256 mapRes!24755))))

(declare-fun condMapEmpty!24755 () Bool)

(declare-fun mapDefault!24755 () ValueCell!7279)

