; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73066 () Bool)

(assert start!73066)

(declare-fun b_free!13981 () Bool)

(declare-fun b_next!13981 () Bool)

(assert (=> start!73066 (= b_free!13981 (not b_next!13981))))

(declare-fun tp!49447 () Bool)

(declare-fun b_and!23121 () Bool)

(assert (=> start!73066 (= tp!49447 b_and!23121)))

(declare-fun mapNonEmpty!25775 () Bool)

(declare-fun mapRes!25775 () Bool)

(declare-fun tp!49446 () Bool)

(declare-fun e!474035 () Bool)

(assert (=> mapNonEmpty!25775 (= mapRes!25775 (and tp!49446 e!474035))))

(declare-datatypes ((V!26537 0))(
  ( (V!26538 (val!8106 Int)) )
))
(declare-datatypes ((ValueCell!7619 0))(
  ( (ValueCellFull!7619 (v!10531 V!26537)) (EmptyCell!7619) )
))
(declare-fun mapRest!25775 () (Array (_ BitVec 32) ValueCell!7619))

(declare-fun mapValue!25775 () ValueCell!7619)

(declare-fun mapKey!25775 () (_ BitVec 32))

(declare-datatypes ((array!48440 0))(
  ( (array!48441 (arr!23251 (Array (_ BitVec 32) ValueCell!7619)) (size!23691 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48440)

(assert (=> mapNonEmpty!25775 (= (arr!23251 _values!688) (store mapRest!25775 mapKey!25775 mapValue!25775))))

(declare-datatypes ((tuple2!10616 0))(
  ( (tuple2!10617 (_1!5319 (_ BitVec 64)) (_2!5319 V!26537)) )
))
(declare-datatypes ((List!16464 0))(
  ( (Nil!16461) (Cons!16460 (h!17591 tuple2!10616) (t!22891 List!16464)) )
))
(declare-datatypes ((ListLongMap!9385 0))(
  ( (ListLongMap!9386 (toList!4708 List!16464)) )
))
(declare-fun call!37798 () ListLongMap!9385)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37795 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48442 0))(
  ( (array!48443 (arr!23252 (Array (_ BitVec 32) (_ BitVec 64))) (size!23692 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48442)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26537)

(declare-fun zeroValue!654 () V!26537)

(declare-fun getCurrentListMapNoExtraKeys!2690 (array!48442 array!48440 (_ BitVec 32) (_ BitVec 32) V!26537 V!26537 (_ BitVec 32) Int) ListLongMap!9385)

(assert (=> bm!37795 (= call!37798 (getCurrentListMapNoExtraKeys!2690 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849708 () Bool)

(declare-fun e!474040 () Bool)

(declare-fun e!474037 () Bool)

(assert (=> b!849708 (= e!474040 (and e!474037 mapRes!25775))))

(declare-fun condMapEmpty!25775 () Bool)

(declare-fun mapDefault!25775 () ValueCell!7619)

