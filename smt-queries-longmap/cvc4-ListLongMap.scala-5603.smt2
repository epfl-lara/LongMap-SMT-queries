; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73406 () Bool)

(assert start!73406)

(declare-fun b_free!14321 () Bool)

(declare-fun b_next!14321 () Bool)

(assert (=> start!73406 (= b_free!14321 (not b_next!14321))))

(declare-fun tp!50466 () Bool)

(declare-fun b_and!23677 () Bool)

(assert (=> start!73406 (= tp!50466 b_and!23677)))

(declare-fun b!856902 () Bool)

(declare-fun res!582049 () Bool)

(declare-fun e!477632 () Bool)

(assert (=> b!856902 (=> (not res!582049) (not e!477632))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856902 (= res!582049 (validKeyInArray!0 k!854))))

(declare-fun b!856903 () Bool)

(declare-fun res!582046 () Bool)

(assert (=> b!856903 (=> (not res!582046) (not e!477632))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49106 0))(
  ( (array!49107 (arr!23584 (Array (_ BitVec 32) (_ BitVec 64))) (size!24024 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49106)

(assert (=> b!856903 (= res!582046 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24024 _keys!868))))))

(declare-fun b!856904 () Bool)

(declare-fun res!582044 () Bool)

(assert (=> b!856904 (=> (not res!582044) (not e!477632))))

(declare-datatypes ((List!16725 0))(
  ( (Nil!16722) (Cons!16721 (h!17852 (_ BitVec 64)) (t!23366 List!16725)) )
))
(declare-fun arrayNoDuplicates!0 (array!49106 (_ BitVec 32) List!16725) Bool)

(assert (=> b!856904 (= res!582044 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16722))))

(declare-fun mapNonEmpty!26285 () Bool)

(declare-fun mapRes!26285 () Bool)

(declare-fun tp!50467 () Bool)

(declare-fun e!477629 () Bool)

(assert (=> mapNonEmpty!26285 (= mapRes!26285 (and tp!50467 e!477629))))

(declare-fun mapKey!26285 () (_ BitVec 32))

(declare-datatypes ((V!26989 0))(
  ( (V!26990 (val!8276 Int)) )
))
(declare-datatypes ((ValueCell!7789 0))(
  ( (ValueCellFull!7789 (v!10701 V!26989)) (EmptyCell!7789) )
))
(declare-fun mapValue!26285 () ValueCell!7789)

(declare-datatypes ((array!49108 0))(
  ( (array!49109 (arr!23585 (Array (_ BitVec 32) ValueCell!7789)) (size!24025 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49108)

(declare-fun mapRest!26285 () (Array (_ BitVec 32) ValueCell!7789))

(assert (=> mapNonEmpty!26285 (= (arr!23585 _values!688) (store mapRest!26285 mapKey!26285 mapValue!26285))))

(declare-fun b!856905 () Bool)

(declare-fun e!477633 () Bool)

(assert (=> b!856905 (= e!477633 (not true))))

(declare-fun v!557 () V!26989)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!386111 () array!49108)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26989)

(declare-fun zeroValue!654 () V!26989)

(declare-datatypes ((tuple2!10916 0))(
  ( (tuple2!10917 (_1!5469 (_ BitVec 64)) (_2!5469 V!26989)) )
))
(declare-datatypes ((List!16726 0))(
  ( (Nil!16723) (Cons!16722 (h!17853 tuple2!10916) (t!23367 List!16726)) )
))
(declare-datatypes ((ListLongMap!9685 0))(
  ( (ListLongMap!9686 (toList!4858 List!16726)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2839 (array!49106 array!49108 (_ BitVec 32) (_ BitVec 32) V!26989 V!26989 (_ BitVec 32) Int) ListLongMap!9685)

(declare-fun +!2212 (ListLongMap!9685 tuple2!10916) ListLongMap!9685)

(assert (=> b!856905 (= (getCurrentListMapNoExtraKeys!2839 _keys!868 lt!386111 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2212 (getCurrentListMapNoExtraKeys!2839 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10917 k!854 v!557)))))

(declare-datatypes ((Unit!29211 0))(
  ( (Unit!29212) )
))
(declare-fun lt!386113 () Unit!29211)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!433 (array!49106 array!49108 (_ BitVec 32) (_ BitVec 32) V!26989 V!26989 (_ BitVec 32) (_ BitVec 64) V!26989 (_ BitVec 32) Int) Unit!29211)

(assert (=> b!856905 (= lt!386113 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!433 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856906 () Bool)

(declare-fun res!582043 () Bool)

(assert (=> b!856906 (=> (not res!582043) (not e!477632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49106 (_ BitVec 32)) Bool)

(assert (=> b!856906 (= res!582043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856907 () Bool)

(declare-fun res!582050 () Bool)

(assert (=> b!856907 (=> (not res!582050) (not e!477632))))

(assert (=> b!856907 (= res!582050 (and (= (size!24025 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24024 _keys!868) (size!24025 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856908 () Bool)

(declare-fun e!477630 () Bool)

(declare-fun e!477634 () Bool)

(assert (=> b!856908 (= e!477630 (and e!477634 mapRes!26285))))

(declare-fun condMapEmpty!26285 () Bool)

(declare-fun mapDefault!26285 () ValueCell!7789)

