; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73666 () Bool)

(assert start!73666)

(declare-fun b_free!14581 () Bool)

(declare-fun b_next!14581 () Bool)

(assert (=> start!73666 (= b_free!14581 (not b_next!14581))))

(declare-fun tp!51247 () Bool)

(declare-fun b_and!24141 () Bool)

(assert (=> start!73666 (= tp!51247 b_and!24141)))

(declare-fun b!862775 () Bool)

(declare-fun e!480676 () Bool)

(declare-fun e!480668 () Bool)

(assert (=> b!862775 (= e!480676 e!480668)))

(declare-fun res!586285 () Bool)

(assert (=> b!862775 (=> res!586285 e!480668)))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49598 0))(
  ( (array!49599 (arr!23830 (Array (_ BitVec 32) (_ BitVec 64))) (size!24270 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49598)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!862775 (= res!586285 (= k!854 (select (arr!23830 _keys!868) from!1053)))))

(assert (=> b!862775 (not (= (select (arr!23830 _keys!868) from!1053) k!854))))

(declare-datatypes ((Unit!29477 0))(
  ( (Unit!29478) )
))
(declare-fun lt!389598 () Unit!29477)

(declare-fun e!480671 () Unit!29477)

(assert (=> b!862775 (= lt!389598 e!480671)))

(declare-fun c!92092 () Bool)

(assert (=> b!862775 (= c!92092 (= (select (arr!23830 _keys!868) from!1053) k!854))))

(declare-datatypes ((V!27337 0))(
  ( (V!27338 (val!8406 Int)) )
))
(declare-datatypes ((tuple2!11122 0))(
  ( (tuple2!11123 (_1!5572 (_ BitVec 64)) (_2!5572 V!27337)) )
))
(declare-datatypes ((List!16931 0))(
  ( (Nil!16928) (Cons!16927 (h!18058 tuple2!11122) (t!23778 List!16931)) )
))
(declare-datatypes ((ListLongMap!9891 0))(
  ( (ListLongMap!9892 (toList!4961 List!16931)) )
))
(declare-fun lt!389599 () ListLongMap!9891)

(declare-fun lt!389597 () ListLongMap!9891)

(assert (=> b!862775 (= lt!389599 lt!389597)))

(declare-fun lt!389595 () ListLongMap!9891)

(declare-fun lt!389608 () tuple2!11122)

(declare-fun +!2310 (ListLongMap!9891 tuple2!11122) ListLongMap!9891)

(assert (=> b!862775 (= lt!389597 (+!2310 lt!389595 lt!389608))))

(declare-fun lt!389601 () V!27337)

(assert (=> b!862775 (= lt!389608 (tuple2!11123 (select (arr!23830 _keys!868) from!1053) lt!389601))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7919 0))(
  ( (ValueCellFull!7919 (v!10831 V!27337)) (EmptyCell!7919) )
))
(declare-datatypes ((array!49600 0))(
  ( (array!49601 (arr!23831 (Array (_ BitVec 32) ValueCell!7919)) (size!24271 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49600)

(declare-fun get!12579 (ValueCell!7919 V!27337) V!27337)

(declare-fun dynLambda!1141 (Int (_ BitVec 64)) V!27337)

(assert (=> b!862775 (= lt!389601 (get!12579 (select (arr!23831 _values!688) from!1053) (dynLambda!1141 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!862776 () Bool)

(declare-fun e!480673 () Bool)

(declare-fun e!480672 () Bool)

(assert (=> b!862776 (= e!480673 e!480672)))

(declare-fun res!586290 () Bool)

(assert (=> b!862776 (=> (not res!586290) (not e!480672))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!862776 (= res!586290 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!389603 () array!49600)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27337)

(declare-fun zeroValue!654 () V!27337)

(declare-fun getCurrentListMapNoExtraKeys!2937 (array!49598 array!49600 (_ BitVec 32) (_ BitVec 32) V!27337 V!27337 (_ BitVec 32) Int) ListLongMap!9891)

(assert (=> b!862776 (= lt!389599 (getCurrentListMapNoExtraKeys!2937 _keys!868 lt!389603 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27337)

(assert (=> b!862776 (= lt!389603 (array!49601 (store (arr!23831 _values!688) i!612 (ValueCellFull!7919 v!557)) (size!24271 _values!688)))))

(declare-fun lt!389593 () ListLongMap!9891)

(assert (=> b!862776 (= lt!389593 (getCurrentListMapNoExtraKeys!2937 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862777 () Bool)

(declare-fun e!480674 () Bool)

(declare-fun tp_is_empty!16717 () Bool)

(assert (=> b!862777 (= e!480674 tp_is_empty!16717)))

(declare-fun b!862778 () Bool)

(declare-fun res!586289 () Bool)

(assert (=> b!862778 (=> (not res!586289) (not e!480673))))

(assert (=> b!862778 (= res!586289 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24270 _keys!868))))))

(declare-fun res!586286 () Bool)

(assert (=> start!73666 (=> (not res!586286) (not e!480673))))

(assert (=> start!73666 (= res!586286 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24270 _keys!868))))))

(assert (=> start!73666 e!480673))

(assert (=> start!73666 tp_is_empty!16717))

(assert (=> start!73666 true))

(assert (=> start!73666 tp!51247))

(declare-fun array_inv!18854 (array!49598) Bool)

(assert (=> start!73666 (array_inv!18854 _keys!868)))

(declare-fun e!480675 () Bool)

(declare-fun array_inv!18855 (array!49600) Bool)

(assert (=> start!73666 (and (array_inv!18855 _values!688) e!480675)))

(declare-fun b!862779 () Bool)

(declare-fun Unit!29479 () Unit!29477)

(assert (=> b!862779 (= e!480671 Unit!29479)))

(declare-fun b!862780 () Bool)

(declare-fun res!586295 () Bool)

(assert (=> b!862780 (=> (not res!586295) (not e!480673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862780 (= res!586295 (validMask!0 mask!1196))))

(declare-fun b!862781 () Bool)

(declare-fun e!480669 () Bool)

(assert (=> b!862781 (= e!480669 tp_is_empty!16717)))

(declare-fun mapNonEmpty!26675 () Bool)

(declare-fun mapRes!26675 () Bool)

(declare-fun tp!51246 () Bool)

(assert (=> mapNonEmpty!26675 (= mapRes!26675 (and tp!51246 e!480674))))

(declare-fun mapKey!26675 () (_ BitVec 32))

(declare-fun mapValue!26675 () ValueCell!7919)

(declare-fun mapRest!26675 () (Array (_ BitVec 32) ValueCell!7919))

(assert (=> mapNonEmpty!26675 (= (arr!23831 _values!688) (store mapRest!26675 mapKey!26675 mapValue!26675))))

(declare-fun b!862782 () Bool)

(declare-fun Unit!29480 () Unit!29477)

(assert (=> b!862782 (= e!480671 Unit!29480)))

(declare-fun lt!389600 () Unit!29477)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49598 (_ BitVec 32) (_ BitVec 32)) Unit!29477)

(assert (=> b!862782 (= lt!389600 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16932 0))(
  ( (Nil!16929) (Cons!16928 (h!18059 (_ BitVec 64)) (t!23779 List!16932)) )
))
(declare-fun arrayNoDuplicates!0 (array!49598 (_ BitVec 32) List!16932) Bool)

(assert (=> b!862782 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16929)))

(declare-fun lt!389607 () Unit!29477)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49598 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29477)

(assert (=> b!862782 (= lt!389607 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862782 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389605 () Unit!29477)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49598 (_ BitVec 64) (_ BitVec 32) List!16932) Unit!29477)

(assert (=> b!862782 (= lt!389605 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16929))))

(assert (=> b!862782 false))

(declare-fun b!862783 () Bool)

(declare-fun res!586292 () Bool)

(assert (=> b!862783 (=> (not res!586292) (not e!480673))))

(assert (=> b!862783 (= res!586292 (and (= (select (arr!23830 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!862784 () Bool)

(assert (=> b!862784 (= e!480672 (not e!480676))))

(declare-fun res!586291 () Bool)

(assert (=> b!862784 (=> res!586291 e!480676)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862784 (= res!586291 (not (validKeyInArray!0 (select (arr!23830 _keys!868) from!1053))))))

(declare-fun lt!389606 () ListLongMap!9891)

(assert (=> b!862784 (= lt!389606 lt!389595)))

(declare-fun lt!389604 () ListLongMap!9891)

(declare-fun lt!389594 () tuple2!11122)

(assert (=> b!862784 (= lt!389595 (+!2310 lt!389604 lt!389594))))

(assert (=> b!862784 (= lt!389606 (getCurrentListMapNoExtraKeys!2937 _keys!868 lt!389603 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862784 (= lt!389594 (tuple2!11123 k!854 v!557))))

(assert (=> b!862784 (= lt!389604 (getCurrentListMapNoExtraKeys!2937 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389602 () Unit!29477)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!519 (array!49598 array!49600 (_ BitVec 32) (_ BitVec 32) V!27337 V!27337 (_ BitVec 32) (_ BitVec 64) V!27337 (_ BitVec 32) Int) Unit!29477)

(assert (=> b!862784 (= lt!389602 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!519 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862785 () Bool)

(declare-fun res!586288 () Bool)

(assert (=> b!862785 (=> (not res!586288) (not e!480673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49598 (_ BitVec 32)) Bool)

(assert (=> b!862785 (= res!586288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862786 () Bool)

(declare-fun res!586294 () Bool)

(assert (=> b!862786 (=> (not res!586294) (not e!480673))))

(assert (=> b!862786 (= res!586294 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16929))))

(declare-fun b!862787 () Bool)

(assert (=> b!862787 (= e!480675 (and e!480669 mapRes!26675))))

(declare-fun condMapEmpty!26675 () Bool)

(declare-fun mapDefault!26675 () ValueCell!7919)

