; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72964 () Bool)

(assert start!72964)

(declare-fun b_free!13879 () Bool)

(declare-fun b_next!13879 () Bool)

(assert (=> start!72964 (= b_free!13879 (not b_next!13879))))

(declare-fun tp!49140 () Bool)

(declare-fun b_and!22965 () Bool)

(assert (=> start!72964 (= tp!49140 b_and!22965)))

(declare-fun b!847420 () Bool)

(declare-fun e!472876 () Bool)

(declare-fun tp_is_empty!16015 () Bool)

(assert (=> b!847420 (= e!472876 tp_is_empty!16015)))

(declare-fun b!847421 () Bool)

(declare-fun res!575769 () Bool)

(declare-fun e!472873 () Bool)

(assert (=> b!847421 (=> (not res!575769) (not e!472873))))

(declare-datatypes ((array!48240 0))(
  ( (array!48241 (arr!23151 (Array (_ BitVec 32) (_ BitVec 64))) (size!23591 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48240)

(declare-datatypes ((List!16379 0))(
  ( (Nil!16376) (Cons!16375 (h!17506 (_ BitVec 64)) (t!22750 List!16379)) )
))
(declare-fun arrayNoDuplicates!0 (array!48240 (_ BitVec 32) List!16379) Bool)

(assert (=> b!847421 (= res!575769 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16376))))

(declare-fun b!847422 () Bool)

(declare-fun res!575776 () Bool)

(assert (=> b!847422 (=> (not res!575776) (not e!472873))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48240 (_ BitVec 32)) Bool)

(assert (=> b!847422 (= res!575776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847423 () Bool)

(declare-fun e!472874 () Bool)

(assert (=> b!847423 (= e!472873 e!472874)))

(declare-fun res!575775 () Bool)

(assert (=> b!847423 (=> (not res!575775) (not e!472874))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847423 (= res!575775 (= from!1053 i!612))))

(declare-datatypes ((V!26401 0))(
  ( (V!26402 (val!8055 Int)) )
))
(declare-datatypes ((ValueCell!7568 0))(
  ( (ValueCellFull!7568 (v!10480 V!26401)) (EmptyCell!7568) )
))
(declare-datatypes ((array!48242 0))(
  ( (array!48243 (arr!23152 (Array (_ BitVec 32) ValueCell!7568)) (size!23592 (_ BitVec 32))) )
))
(declare-fun lt!381732 () array!48242)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10520 0))(
  ( (tuple2!10521 (_1!5271 (_ BitVec 64)) (_2!5271 V!26401)) )
))
(declare-datatypes ((List!16380 0))(
  ( (Nil!16377) (Cons!16376 (h!17507 tuple2!10520) (t!22751 List!16380)) )
))
(declare-datatypes ((ListLongMap!9289 0))(
  ( (ListLongMap!9290 (toList!4660 List!16380)) )
))
(declare-fun lt!381731 () ListLongMap!9289)

(declare-fun minValue!654 () V!26401)

(declare-fun zeroValue!654 () V!26401)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2644 (array!48240 array!48242 (_ BitVec 32) (_ BitVec 32) V!26401 V!26401 (_ BitVec 32) Int) ListLongMap!9289)

(assert (=> b!847423 (= lt!381731 (getCurrentListMapNoExtraKeys!2644 _keys!868 lt!381732 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26401)

(declare-fun _values!688 () array!48242)

(assert (=> b!847423 (= lt!381732 (array!48243 (store (arr!23152 _values!688) i!612 (ValueCellFull!7568 v!557)) (size!23592 _values!688)))))

(declare-fun lt!381733 () ListLongMap!9289)

(assert (=> b!847423 (= lt!381733 (getCurrentListMapNoExtraKeys!2644 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847424 () Bool)

(declare-fun res!575774 () Bool)

(assert (=> b!847424 (=> (not res!575774) (not e!472873))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!847424 (= res!575774 (and (= (select (arr!23151 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!847425 () Bool)

(declare-fun e!472870 () Bool)

(declare-fun e!472875 () Bool)

(declare-fun mapRes!25622 () Bool)

(assert (=> b!847425 (= e!472870 (and e!472875 mapRes!25622))))

(declare-fun condMapEmpty!25622 () Bool)

(declare-fun mapDefault!25622 () ValueCell!7568)

