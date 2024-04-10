; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73384 () Bool)

(assert start!73384)

(declare-fun b_free!14299 () Bool)

(declare-fun b_next!14299 () Bool)

(assert (=> start!73384 (= b_free!14299 (not b_next!14299))))

(declare-fun tp!50400 () Bool)

(declare-fun b_and!23655 () Bool)

(assert (=> start!73384 (= tp!50400 b_and!23655)))

(declare-fun b!856506 () Bool)

(declare-fun res!581751 () Bool)

(declare-fun e!477433 () Bool)

(assert (=> b!856506 (=> (not res!581751) (not e!477433))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49062 0))(
  ( (array!49063 (arr!23562 (Array (_ BitVec 32) (_ BitVec 64))) (size!24002 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49062)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!856506 (= res!581751 (and (= (select (arr!23562 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!856507 () Bool)

(declare-fun res!581749 () Bool)

(assert (=> b!856507 (=> (not res!581749) (not e!477433))))

(declare-datatypes ((List!16708 0))(
  ( (Nil!16705) (Cons!16704 (h!17835 (_ BitVec 64)) (t!23349 List!16708)) )
))
(declare-fun arrayNoDuplicates!0 (array!49062 (_ BitVec 32) List!16708) Bool)

(assert (=> b!856507 (= res!581749 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16705))))

(declare-fun b!856508 () Bool)

(declare-fun e!477435 () Bool)

(assert (=> b!856508 (= e!477435 (not true))))

(declare-datatypes ((V!26961 0))(
  ( (V!26962 (val!8265 Int)) )
))
(declare-fun v!557 () V!26961)

(declare-datatypes ((ValueCell!7778 0))(
  ( (ValueCellFull!7778 (v!10690 V!26961)) (EmptyCell!7778) )
))
(declare-datatypes ((array!49064 0))(
  ( (array!49065 (arr!23563 (Array (_ BitVec 32) ValueCell!7778)) (size!24003 (_ BitVec 32))) )
))
(declare-fun lt!385978 () array!49064)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun _values!688 () array!49064)

(declare-fun minValue!654 () V!26961)

(declare-fun zeroValue!654 () V!26961)

(declare-datatypes ((tuple2!10898 0))(
  ( (tuple2!10899 (_1!5460 (_ BitVec 64)) (_2!5460 V!26961)) )
))
(declare-datatypes ((List!16709 0))(
  ( (Nil!16706) (Cons!16705 (h!17836 tuple2!10898) (t!23350 List!16709)) )
))
(declare-datatypes ((ListLongMap!9667 0))(
  ( (ListLongMap!9668 (toList!4849 List!16709)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2830 (array!49062 array!49064 (_ BitVec 32) (_ BitVec 32) V!26961 V!26961 (_ BitVec 32) Int) ListLongMap!9667)

(declare-fun +!2205 (ListLongMap!9667 tuple2!10898) ListLongMap!9667)

(assert (=> b!856508 (= (getCurrentListMapNoExtraKeys!2830 _keys!868 lt!385978 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2205 (getCurrentListMapNoExtraKeys!2830 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10899 k!854 v!557)))))

(declare-datatypes ((Unit!29197 0))(
  ( (Unit!29198) )
))
(declare-fun lt!385981 () Unit!29197)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!426 (array!49062 array!49064 (_ BitVec 32) (_ BitVec 32) V!26961 V!26961 (_ BitVec 32) (_ BitVec 64) V!26961 (_ BitVec 32) Int) Unit!29197)

(assert (=> b!856508 (= lt!385981 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!426 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856509 () Bool)

(declare-fun res!581753 () Bool)

(assert (=> b!856509 (=> (not res!581753) (not e!477433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49062 (_ BitVec 32)) Bool)

(assert (=> b!856509 (= res!581753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856510 () Bool)

(declare-fun e!477432 () Bool)

(declare-fun e!477434 () Bool)

(declare-fun mapRes!26252 () Bool)

(assert (=> b!856510 (= e!477432 (and e!477434 mapRes!26252))))

(declare-fun condMapEmpty!26252 () Bool)

(declare-fun mapDefault!26252 () ValueCell!7778)

