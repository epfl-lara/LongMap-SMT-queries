; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72436 () Bool)

(assert start!72436)

(declare-fun b_free!13621 () Bool)

(declare-fun b_next!13621 () Bool)

(assert (=> start!72436 (= b_free!13621 (not b_next!13621))))

(declare-fun tp!47961 () Bool)

(declare-fun b_and!22707 () Bool)

(assert (=> start!72436 (= tp!47961 b_and!22707)))

(declare-fun b!839921 () Bool)

(declare-fun e!468705 () Bool)

(declare-fun tp_is_empty!15487 () Bool)

(assert (=> b!839921 (= e!468705 tp_is_empty!15487)))

(declare-fun b!839922 () Bool)

(declare-fun res!571044 () Bool)

(declare-fun e!468702 () Bool)

(assert (=> b!839922 (=> (not res!571044) (not e!468702))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47256 0))(
  ( (array!47257 (arr!22659 (Array (_ BitVec 32) (_ BitVec 64))) (size!23099 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47256)

(assert (=> b!839922 (= res!571044 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23099 _keys!868))))))

(declare-fun b!839923 () Bool)

(declare-fun res!571048 () Bool)

(assert (=> b!839923 (=> (not res!571048) (not e!468702))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!25697 0))(
  ( (V!25698 (val!7791 Int)) )
))
(declare-datatypes ((ValueCell!7304 0))(
  ( (ValueCellFull!7304 (v!10216 V!25697)) (EmptyCell!7304) )
))
(declare-datatypes ((array!47258 0))(
  ( (array!47259 (arr!22660 (Array (_ BitVec 32) ValueCell!7304)) (size!23100 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47258)

(assert (=> b!839923 (= res!571048 (and (= (size!23100 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23099 _keys!868) (size!23100 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839924 () Bool)

(assert (=> b!839924 (= e!468702 (not true))))

(declare-fun e!468703 () Bool)

(assert (=> b!839924 e!468703))

(declare-fun c!91291 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!839924 (= c!91291 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25697)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28845 0))(
  ( (Unit!28846) )
))
(declare-fun lt!380797 () Unit!28845)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!25697)

(declare-fun zeroValue!654 () V!25697)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!268 (array!47256 array!47258 (_ BitVec 32) (_ BitVec 32) V!25697 V!25697 (_ BitVec 32) (_ BitVec 64) V!25697 (_ BitVec 32) Int) Unit!28845)

(assert (=> b!839924 (= lt!380797 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!268 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839925 () Bool)

(declare-datatypes ((tuple2!10320 0))(
  ( (tuple2!10321 (_1!5171 (_ BitVec 64)) (_2!5171 V!25697)) )
))
(declare-datatypes ((List!16116 0))(
  ( (Nil!16113) (Cons!16112 (h!17243 tuple2!10320) (t!22487 List!16116)) )
))
(declare-datatypes ((ListLongMap!9089 0))(
  ( (ListLongMap!9090 (toList!4560 List!16116)) )
))
(declare-fun call!37096 () ListLongMap!9089)

(declare-fun call!37097 () ListLongMap!9089)

(declare-fun +!2030 (ListLongMap!9089 tuple2!10320) ListLongMap!9089)

(assert (=> b!839925 (= e!468703 (= call!37097 (+!2030 call!37096 (tuple2!10321 k!854 v!557))))))

(declare-fun b!839926 () Bool)

(declare-fun e!468701 () Bool)

(assert (=> b!839926 (= e!468701 tp_is_empty!15487)))

(declare-fun b!839927 () Bool)

(declare-fun res!571047 () Bool)

(assert (=> b!839927 (=> (not res!571047) (not e!468702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47256 (_ BitVec 32)) Bool)

(assert (=> b!839927 (= res!571047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839928 () Bool)

(declare-fun res!571045 () Bool)

(assert (=> b!839928 (=> (not res!571045) (not e!468702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839928 (= res!571045 (validKeyInArray!0 k!854))))

(declare-fun b!839929 () Bool)

(declare-fun e!468704 () Bool)

(declare-fun mapRes!24830 () Bool)

(assert (=> b!839929 (= e!468704 (and e!468705 mapRes!24830))))

(declare-fun condMapEmpty!24830 () Bool)

(declare-fun mapDefault!24830 () ValueCell!7304)

