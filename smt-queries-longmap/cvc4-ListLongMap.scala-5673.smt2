; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73826 () Bool)

(assert start!73826)

(declare-fun b_free!14741 () Bool)

(declare-fun b_next!14741 () Bool)

(assert (=> start!73826 (= b_free!14741 (not b_next!14741))))

(declare-fun tp!51726 () Bool)

(declare-fun b_and!24461 () Bool)

(assert (=> start!73826 (= tp!51726 b_and!24461)))

(declare-fun b!866775 () Bool)

(declare-fun res!588927 () Bool)

(declare-fun e!482832 () Bool)

(assert (=> b!866775 (=> (not res!588927) (not e!482832))))

(declare-datatypes ((array!49914 0))(
  ( (array!49915 (arr!23988 (Array (_ BitVec 32) (_ BitVec 64))) (size!24428 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49914)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49914 (_ BitVec 32)) Bool)

(assert (=> b!866775 (= res!588927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866776 () Bool)

(declare-fun e!482836 () Bool)

(declare-fun e!482831 () Bool)

(assert (=> b!866776 (= e!482836 (not e!482831))))

(declare-fun res!588925 () Bool)

(assert (=> b!866776 (=> res!588925 e!482831)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866776 (= res!588925 (not (validKeyInArray!0 (select (arr!23988 _keys!868) from!1053))))))

(declare-datatypes ((V!27549 0))(
  ( (V!27550 (val!8486 Int)) )
))
(declare-datatypes ((tuple2!11254 0))(
  ( (tuple2!11255 (_1!5638 (_ BitVec 64)) (_2!5638 V!27549)) )
))
(declare-datatypes ((List!17054 0))(
  ( (Nil!17051) (Cons!17050 (h!18181 tuple2!11254) (t!24061 List!17054)) )
))
(declare-datatypes ((ListLongMap!10023 0))(
  ( (ListLongMap!10024 (toList!5027 List!17054)) )
))
(declare-fun lt!393440 () ListLongMap!10023)

(declare-fun lt!393439 () ListLongMap!10023)

(assert (=> b!866776 (= lt!393440 lt!393439)))

(declare-fun lt!393437 () ListLongMap!10023)

(declare-fun lt!393434 () tuple2!11254)

(declare-fun +!2373 (ListLongMap!10023 tuple2!11254) ListLongMap!10023)

(assert (=> b!866776 (= lt!393439 (+!2373 lt!393437 lt!393434))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7999 0))(
  ( (ValueCellFull!7999 (v!10911 V!27549)) (EmptyCell!7999) )
))
(declare-datatypes ((array!49916 0))(
  ( (array!49917 (arr!23989 (Array (_ BitVec 32) ValueCell!7999)) (size!24429 (_ BitVec 32))) )
))
(declare-fun lt!393435 () array!49916)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27549)

(declare-fun zeroValue!654 () V!27549)

(declare-fun getCurrentListMapNoExtraKeys!2997 (array!49914 array!49916 (_ BitVec 32) (_ BitVec 32) V!27549 V!27549 (_ BitVec 32) Int) ListLongMap!10023)

(assert (=> b!866776 (= lt!393440 (getCurrentListMapNoExtraKeys!2997 _keys!868 lt!393435 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!27549)

(assert (=> b!866776 (= lt!393434 (tuple2!11255 k!854 v!557))))

(declare-fun _values!688 () array!49916)

(assert (=> b!866776 (= lt!393437 (getCurrentListMapNoExtraKeys!2997 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29715 0))(
  ( (Unit!29716) )
))
(declare-fun lt!393433 () Unit!29715)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!571 (array!49914 array!49916 (_ BitVec 32) (_ BitVec 32) V!27549 V!27549 (_ BitVec 32) (_ BitVec 64) V!27549 (_ BitVec 32) Int) Unit!29715)

(assert (=> b!866776 (= lt!393433 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!571 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866777 () Bool)

(declare-fun e!482834 () Bool)

(assert (=> b!866777 (= e!482834 true)))

(declare-fun lt!393448 () ListLongMap!10023)

(declare-fun lt!393445 () tuple2!11254)

(assert (=> b!866777 (= lt!393448 (+!2373 (+!2373 lt!393437 lt!393445) lt!393434))))

(declare-fun lt!393436 () Unit!29715)

(declare-fun lt!393444 () V!27549)

(declare-fun addCommutativeForDiffKeys!541 (ListLongMap!10023 (_ BitVec 64) V!27549 (_ BitVec 64) V!27549) Unit!29715)

(assert (=> b!866777 (= lt!393436 (addCommutativeForDiffKeys!541 lt!393437 k!854 v!557 (select (arr!23988 _keys!868) from!1053) lt!393444))))

(declare-fun b!866778 () Bool)

(declare-fun res!588935 () Bool)

(assert (=> b!866778 (=> (not res!588935) (not e!482832))))

(declare-datatypes ((List!17055 0))(
  ( (Nil!17052) (Cons!17051 (h!18182 (_ BitVec 64)) (t!24062 List!17055)) )
))
(declare-fun arrayNoDuplicates!0 (array!49914 (_ BitVec 32) List!17055) Bool)

(assert (=> b!866778 (= res!588935 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17052))))

(declare-fun b!866779 () Bool)

(declare-fun res!588928 () Bool)

(assert (=> b!866779 (=> (not res!588928) (not e!482832))))

(assert (=> b!866779 (= res!588928 (and (= (size!24429 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24428 _keys!868) (size!24429 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866780 () Bool)

(declare-fun res!588933 () Bool)

(assert (=> b!866780 (=> (not res!588933) (not e!482832))))

(assert (=> b!866780 (= res!588933 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24428 _keys!868))))))

(declare-fun b!866781 () Bool)

(declare-fun res!588929 () Bool)

(assert (=> b!866781 (=> (not res!588929) (not e!482832))))

(assert (=> b!866781 (= res!588929 (and (= (select (arr!23988 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!588934 () Bool)

(assert (=> start!73826 (=> (not res!588934) (not e!482832))))

(assert (=> start!73826 (= res!588934 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24428 _keys!868))))))

(assert (=> start!73826 e!482832))

(declare-fun tp_is_empty!16877 () Bool)

(assert (=> start!73826 tp_is_empty!16877))

(assert (=> start!73826 true))

(assert (=> start!73826 tp!51726))

(declare-fun array_inv!18958 (array!49914) Bool)

(assert (=> start!73826 (array_inv!18958 _keys!868)))

(declare-fun e!482835 () Bool)

(declare-fun array_inv!18959 (array!49916) Bool)

(assert (=> start!73826 (and (array_inv!18959 _values!688) e!482835)))

(declare-fun b!866782 () Bool)

(declare-fun e!482828 () Bool)

(assert (=> b!866782 (= e!482828 tp_is_empty!16877)))

(declare-fun b!866783 () Bool)

(declare-fun e!482830 () Bool)

(declare-fun mapRes!26915 () Bool)

(assert (=> b!866783 (= e!482835 (and e!482830 mapRes!26915))))

(declare-fun condMapEmpty!26915 () Bool)

(declare-fun mapDefault!26915 () ValueCell!7999)

