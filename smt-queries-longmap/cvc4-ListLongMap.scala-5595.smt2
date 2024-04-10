; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73358 () Bool)

(assert start!73358)

(declare-fun b_free!14273 () Bool)

(declare-fun b_next!14273 () Bool)

(assert (=> start!73358 (= b_free!14273 (not b_next!14273))))

(declare-fun tp!50323 () Bool)

(declare-fun b_and!23629 () Bool)

(assert (=> start!73358 (= tp!50323 b_and!23629)))

(declare-fun b!856038 () Bool)

(declare-fun e!477197 () Bool)

(assert (=> b!856038 (= e!477197 (not true))))

(declare-datatypes ((V!26925 0))(
  ( (V!26926 (val!8252 Int)) )
))
(declare-fun v!557 () V!26925)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7765 0))(
  ( (ValueCellFull!7765 (v!10677 V!26925)) (EmptyCell!7765) )
))
(declare-datatypes ((array!49012 0))(
  ( (array!49013 (arr!23537 (Array (_ BitVec 32) ValueCell!7765)) (size!23977 (_ BitVec 32))) )
))
(declare-fun lt!385824 () array!49012)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49014 0))(
  ( (array!49015 (arr!23538 (Array (_ BitVec 32) (_ BitVec 64))) (size!23978 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49014)

(declare-fun _values!688 () array!49012)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26925)

(declare-fun zeroValue!654 () V!26925)

(declare-datatypes ((tuple2!10876 0))(
  ( (tuple2!10877 (_1!5449 (_ BitVec 64)) (_2!5449 V!26925)) )
))
(declare-datatypes ((List!16688 0))(
  ( (Nil!16685) (Cons!16684 (h!17815 tuple2!10876) (t!23329 List!16688)) )
))
(declare-datatypes ((ListLongMap!9645 0))(
  ( (ListLongMap!9646 (toList!4838 List!16688)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2819 (array!49014 array!49012 (_ BitVec 32) (_ BitVec 32) V!26925 V!26925 (_ BitVec 32) Int) ListLongMap!9645)

(declare-fun +!2197 (ListLongMap!9645 tuple2!10876) ListLongMap!9645)

(assert (=> b!856038 (= (getCurrentListMapNoExtraKeys!2819 _keys!868 lt!385824 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2197 (getCurrentListMapNoExtraKeys!2819 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10877 k!854 v!557)))))

(declare-datatypes ((Unit!29181 0))(
  ( (Unit!29182) )
))
(declare-fun lt!385822 () Unit!29181)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!418 (array!49014 array!49012 (_ BitVec 32) (_ BitVec 32) V!26925 V!26925 (_ BitVec 32) (_ BitVec 64) V!26925 (_ BitVec 32) Int) Unit!29181)

(assert (=> b!856038 (= lt!385822 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!418 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856039 () Bool)

(declare-fun res!581396 () Bool)

(declare-fun e!477201 () Bool)

(assert (=> b!856039 (=> (not res!581396) (not e!477201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49014 (_ BitVec 32)) Bool)

(assert (=> b!856039 (= res!581396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856040 () Bool)

(declare-fun res!581401 () Bool)

(assert (=> b!856040 (=> (not res!581401) (not e!477201))))

(assert (=> b!856040 (= res!581401 (and (= (select (arr!23538 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26213 () Bool)

(declare-fun mapRes!26213 () Bool)

(assert (=> mapIsEmpty!26213 mapRes!26213))

(declare-fun b!856041 () Bool)

(assert (=> b!856041 (= e!477201 e!477197)))

(declare-fun res!581399 () Bool)

(assert (=> b!856041 (=> (not res!581399) (not e!477197))))

(assert (=> b!856041 (= res!581399 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385825 () ListLongMap!9645)

(assert (=> b!856041 (= lt!385825 (getCurrentListMapNoExtraKeys!2819 _keys!868 lt!385824 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!856041 (= lt!385824 (array!49013 (store (arr!23537 _values!688) i!612 (ValueCellFull!7765 v!557)) (size!23977 _values!688)))))

(declare-fun lt!385823 () ListLongMap!9645)

(assert (=> b!856041 (= lt!385823 (getCurrentListMapNoExtraKeys!2819 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856042 () Bool)

(declare-fun e!477202 () Bool)

(declare-fun tp_is_empty!16409 () Bool)

(assert (=> b!856042 (= e!477202 tp_is_empty!16409)))

(declare-fun b!856043 () Bool)

(declare-fun res!581400 () Bool)

(assert (=> b!856043 (=> (not res!581400) (not e!477201))))

(assert (=> b!856043 (= res!581400 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23978 _keys!868))))))

(declare-fun b!856044 () Bool)

(declare-fun res!581394 () Bool)

(assert (=> b!856044 (=> (not res!581394) (not e!477201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856044 (= res!581394 (validMask!0 mask!1196))))

(declare-fun b!856045 () Bool)

(declare-fun res!581395 () Bool)

(assert (=> b!856045 (=> (not res!581395) (not e!477201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856045 (= res!581395 (validKeyInArray!0 k!854))))

(declare-fun b!856046 () Bool)

(declare-fun e!477198 () Bool)

(assert (=> b!856046 (= e!477198 tp_is_empty!16409)))

(declare-fun b!856047 () Bool)

(declare-fun res!581402 () Bool)

(assert (=> b!856047 (=> (not res!581402) (not e!477201))))

(declare-datatypes ((List!16689 0))(
  ( (Nil!16686) (Cons!16685 (h!17816 (_ BitVec 64)) (t!23330 List!16689)) )
))
(declare-fun arrayNoDuplicates!0 (array!49014 (_ BitVec 32) List!16689) Bool)

(assert (=> b!856047 (= res!581402 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16686))))

(declare-fun b!856048 () Bool)

(declare-fun e!477200 () Bool)

(assert (=> b!856048 (= e!477200 (and e!477198 mapRes!26213))))

(declare-fun condMapEmpty!26213 () Bool)

(declare-fun mapDefault!26213 () ValueCell!7765)

