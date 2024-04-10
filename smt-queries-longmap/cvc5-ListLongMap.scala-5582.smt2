; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73276 () Bool)

(assert start!73276)

(declare-fun b_free!14191 () Bool)

(declare-fun b_next!14191 () Bool)

(assert (=> start!73276 (= b_free!14191 (not b_next!14191))))

(declare-fun tp!50076 () Bool)

(declare-fun b_and!23541 () Bool)

(assert (=> start!73276 (= tp!50076 b_and!23541)))

(declare-fun b!854643 () Bool)

(declare-fun e!476557 () Bool)

(declare-fun tp_is_empty!16327 () Bool)

(assert (=> b!854643 (= e!476557 tp_is_empty!16327)))

(declare-fun b!854644 () Bool)

(declare-fun res!580391 () Bool)

(declare-fun e!476554 () Bool)

(assert (=> b!854644 (=> (not res!580391) (not e!476554))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854644 (= res!580391 (validMask!0 mask!1196))))

(declare-fun b!854645 () Bool)

(declare-fun res!580389 () Bool)

(assert (=> b!854645 (=> (not res!580389) (not e!476554))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48852 0))(
  ( (array!48853 (arr!23457 (Array (_ BitVec 32) (_ BitVec 64))) (size!23897 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48852)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!854645 (= res!580389 (and (= (select (arr!23457 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!854646 () Bool)

(declare-fun res!580396 () Bool)

(assert (=> b!854646 (=> (not res!580396) (not e!476554))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26817 0))(
  ( (V!26818 (val!8211 Int)) )
))
(declare-datatypes ((ValueCell!7724 0))(
  ( (ValueCellFull!7724 (v!10636 V!26817)) (EmptyCell!7724) )
))
(declare-datatypes ((array!48854 0))(
  ( (array!48855 (arr!23458 (Array (_ BitVec 32) ValueCell!7724)) (size!23898 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48854)

(assert (=> b!854646 (= res!580396 (and (= (size!23898 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23897 _keys!868) (size!23898 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854647 () Bool)

(declare-fun res!580395 () Bool)

(assert (=> b!854647 (=> (not res!580395) (not e!476554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854647 (= res!580395 (validKeyInArray!0 k!854))))

(declare-fun b!854648 () Bool)

(declare-fun res!580397 () Bool)

(assert (=> b!854648 (=> (not res!580397) (not e!476554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48852 (_ BitVec 32)) Bool)

(assert (=> b!854648 (= res!580397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26090 () Bool)

(declare-fun mapRes!26090 () Bool)

(assert (=> mapIsEmpty!26090 mapRes!26090))

(declare-fun minValue!654 () V!26817)

(declare-fun zeroValue!654 () V!26817)

(declare-datatypes ((tuple2!10812 0))(
  ( (tuple2!10813 (_1!5417 (_ BitVec 64)) (_2!5417 V!26817)) )
))
(declare-datatypes ((List!16628 0))(
  ( (Nil!16625) (Cons!16624 (h!17755 tuple2!10812) (t!23265 List!16628)) )
))
(declare-datatypes ((ListLongMap!9581 0))(
  ( (ListLongMap!9582 (toList!4806 List!16628)) )
))
(declare-fun call!38429 () ListLongMap!9581)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!38425 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2787 (array!48852 array!48854 (_ BitVec 32) (_ BitVec 32) V!26817 V!26817 (_ BitVec 32) Int) ListLongMap!9581)

(assert (=> bm!38425 (= call!38429 (getCurrentListMapNoExtraKeys!2787 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!38428 () ListLongMap!9581)

(declare-fun b!854649 () Bool)

(declare-fun e!476558 () Bool)

(declare-fun v!557 () V!26817)

(declare-fun +!2193 (ListLongMap!9581 tuple2!10812) ListLongMap!9581)

(assert (=> b!854649 (= e!476558 (= call!38428 (+!2193 call!38429 (tuple2!10813 k!854 v!557))))))

(declare-fun b!854650 () Bool)

(declare-fun e!476553 () Bool)

(declare-fun e!476555 () Bool)

(assert (=> b!854650 (= e!476553 (not e!476555))))

(declare-fun res!580390 () Bool)

(assert (=> b!854650 (=> res!580390 e!476555)))

(assert (=> b!854650 (= res!580390 (not (validKeyInArray!0 (select (arr!23457 _keys!868) from!1053))))))

(assert (=> b!854650 e!476558))

(declare-fun c!91957 () Bool)

(assert (=> b!854650 (= c!91957 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29173 0))(
  ( (Unit!29174) )
))
(declare-fun lt!385512 () Unit!29173)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!415 (array!48852 array!48854 (_ BitVec 32) (_ BitVec 32) V!26817 V!26817 (_ BitVec 32) (_ BitVec 64) V!26817 (_ BitVec 32) Int) Unit!29173)

(assert (=> b!854650 (= lt!385512 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!415 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26090 () Bool)

(declare-fun tp!50077 () Bool)

(declare-fun e!476560 () Bool)

(assert (=> mapNonEmpty!26090 (= mapRes!26090 (and tp!50077 e!476560))))

(declare-fun mapKey!26090 () (_ BitVec 32))

(declare-fun mapRest!26090 () (Array (_ BitVec 32) ValueCell!7724))

(declare-fun mapValue!26090 () ValueCell!7724)

(assert (=> mapNonEmpty!26090 (= (arr!23458 _values!688) (store mapRest!26090 mapKey!26090 mapValue!26090))))

(declare-fun b!854651 () Bool)

(assert (=> b!854651 (= e!476558 (= call!38428 call!38429))))

(declare-fun b!854652 () Bool)

(declare-fun e!476559 () Bool)

(assert (=> b!854652 (= e!476559 (and e!476557 mapRes!26090))))

(declare-fun condMapEmpty!26090 () Bool)

(declare-fun mapDefault!26090 () ValueCell!7724)

