; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72968 () Bool)

(assert start!72968)

(declare-fun b_free!13883 () Bool)

(declare-fun b_next!13883 () Bool)

(assert (=> start!72968 (= b_free!13883 (not b_next!13883))))

(declare-fun tp!49153 () Bool)

(declare-fun b_and!22969 () Bool)

(assert (=> start!72968 (= tp!49153 b_and!22969)))

(declare-fun b!847504 () Bool)

(declare-fun e!472915 () Bool)

(declare-fun tp_is_empty!16019 () Bool)

(assert (=> b!847504 (= e!472915 tp_is_empty!16019)))

(declare-fun b!847505 () Bool)

(declare-fun res!575823 () Bool)

(declare-fun e!472917 () Bool)

(assert (=> b!847505 (=> (not res!575823) (not e!472917))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847505 (= res!575823 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!25628 () Bool)

(declare-fun mapRes!25628 () Bool)

(declare-fun tp!49152 () Bool)

(declare-fun e!472918 () Bool)

(assert (=> mapNonEmpty!25628 (= mapRes!25628 (and tp!49152 e!472918))))

(declare-datatypes ((V!26405 0))(
  ( (V!26406 (val!8057 Int)) )
))
(declare-datatypes ((ValueCell!7570 0))(
  ( (ValueCellFull!7570 (v!10482 V!26405)) (EmptyCell!7570) )
))
(declare-fun mapRest!25628 () (Array (_ BitVec 32) ValueCell!7570))

(declare-datatypes ((array!48248 0))(
  ( (array!48249 (arr!23155 (Array (_ BitVec 32) ValueCell!7570)) (size!23595 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48248)

(declare-fun mapKey!25628 () (_ BitVec 32))

(declare-fun mapValue!25628 () ValueCell!7570)

(assert (=> mapNonEmpty!25628 (= (arr!23155 _values!688) (store mapRest!25628 mapKey!25628 mapValue!25628))))

(declare-fun b!847507 () Bool)

(declare-fun res!575831 () Bool)

(assert (=> b!847507 (=> (not res!575831) (not e!472917))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48250 0))(
  ( (array!48251 (arr!23156 (Array (_ BitVec 32) (_ BitVec 64))) (size!23596 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48250)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!847507 (= res!575831 (and (= (select (arr!23156 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!847508 () Bool)

(declare-fun res!575825 () Bool)

(assert (=> b!847508 (=> (not res!575825) (not e!472917))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847508 (= res!575825 (validMask!0 mask!1196))))

(declare-fun b!847509 () Bool)

(declare-fun e!472914 () Bool)

(declare-datatypes ((tuple2!10524 0))(
  ( (tuple2!10525 (_1!5273 (_ BitVec 64)) (_2!5273 V!26405)) )
))
(declare-datatypes ((List!16383 0))(
  ( (Nil!16380) (Cons!16379 (h!17510 tuple2!10524) (t!22754 List!16383)) )
))
(declare-datatypes ((ListLongMap!9293 0))(
  ( (ListLongMap!9294 (toList!4662 List!16383)) )
))
(declare-fun call!37504 () ListLongMap!9293)

(declare-fun call!37505 () ListLongMap!9293)

(assert (=> b!847509 (= e!472914 (= call!37504 call!37505))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26405)

(declare-fun zeroValue!654 () V!26405)

(declare-fun bm!37501 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2646 (array!48250 array!48248 (_ BitVec 32) (_ BitVec 32) V!26405 V!26405 (_ BitVec 32) Int) ListLongMap!9293)

(assert (=> bm!37501 (= call!37505 (getCurrentListMapNoExtraKeys!2646 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847510 () Bool)

(declare-fun res!575829 () Bool)

(assert (=> b!847510 (=> (not res!575829) (not e!472917))))

(assert (=> b!847510 (= res!575829 (and (= (size!23595 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23596 _keys!868) (size!23595 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847511 () Bool)

(assert (=> b!847511 (= e!472918 tp_is_empty!16019)))

(declare-fun mapIsEmpty!25628 () Bool)

(assert (=> mapIsEmpty!25628 mapRes!25628))

(declare-fun b!847512 () Bool)

(declare-fun e!472916 () Bool)

(assert (=> b!847512 (= e!472916 (and e!472915 mapRes!25628))))

(declare-fun condMapEmpty!25628 () Bool)

(declare-fun mapDefault!25628 () ValueCell!7570)

