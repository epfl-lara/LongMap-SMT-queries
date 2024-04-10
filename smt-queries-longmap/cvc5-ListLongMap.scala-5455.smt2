; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72514 () Bool)

(assert start!72514)

(declare-fun b_free!13699 () Bool)

(declare-fun b_next!13699 () Bool)

(assert (=> start!72514 (= b_free!13699 (not b_next!13699))))

(declare-fun tp!48195 () Bool)

(declare-fun b_and!22785 () Bool)

(assert (=> start!72514 (= tp!48195 b_and!22785)))

(declare-fun b!841442 () Bool)

(declare-fun e!469407 () Bool)

(declare-fun tp_is_empty!15565 () Bool)

(assert (=> b!841442 (= e!469407 tp_is_empty!15565)))

(declare-fun b!841443 () Bool)

(declare-fun res!571982 () Bool)

(declare-fun e!469406 () Bool)

(assert (=> b!841443 (=> (not res!571982) (not e!469406))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841443 (= res!571982 (validKeyInArray!0 k!854))))

(declare-fun b!841444 () Bool)

(declare-fun res!571983 () Bool)

(assert (=> b!841444 (=> (not res!571983) (not e!469406))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47408 0))(
  ( (array!47409 (arr!22735 (Array (_ BitVec 32) (_ BitVec 64))) (size!23175 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47408)

(declare-datatypes ((V!25801 0))(
  ( (V!25802 (val!7830 Int)) )
))
(declare-datatypes ((ValueCell!7343 0))(
  ( (ValueCellFull!7343 (v!10255 V!25801)) (EmptyCell!7343) )
))
(declare-datatypes ((array!47410 0))(
  ( (array!47411 (arr!22736 (Array (_ BitVec 32) ValueCell!7343)) (size!23176 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47410)

(assert (=> b!841444 (= res!571983 (and (= (size!23176 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23175 _keys!868) (size!23176 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841445 () Bool)

(declare-fun e!469403 () Bool)

(assert (=> b!841445 (= e!469403 tp_is_empty!15565)))

(declare-fun b!841446 () Bool)

(declare-fun res!571981 () Bool)

(assert (=> b!841446 (=> (not res!571981) (not e!469406))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!841446 (= res!571981 (and (= (select (arr!22735 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23175 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!24947 () Bool)

(declare-fun mapRes!24947 () Bool)

(assert (=> mapIsEmpty!24947 mapRes!24947))

(declare-fun b!841447 () Bool)

(declare-fun e!469405 () Bool)

(assert (=> b!841447 (= e!469405 (and e!469403 mapRes!24947))))

(declare-fun condMapEmpty!24947 () Bool)

(declare-fun mapDefault!24947 () ValueCell!7343)

