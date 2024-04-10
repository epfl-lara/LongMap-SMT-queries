; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73912 () Bool)

(assert start!73912)

(declare-fun b_free!14827 () Bool)

(declare-fun b_next!14827 () Bool)

(assert (=> start!73912 (= b_free!14827 (not b_next!14827))))

(declare-fun tp!51984 () Bool)

(declare-fun b_and!24579 () Bool)

(assert (=> start!73912 (= tp!51984 b_and!24579)))

(declare-fun mapNonEmpty!27044 () Bool)

(declare-fun mapRes!27044 () Bool)

(declare-fun tp!51985 () Bool)

(declare-fun e!483745 () Bool)

(assert (=> mapNonEmpty!27044 (= mapRes!27044 (and tp!51985 e!483745))))

(declare-datatypes ((V!27665 0))(
  ( (V!27666 (val!8529 Int)) )
))
(declare-datatypes ((ValueCell!8042 0))(
  ( (ValueCellFull!8042 (v!10954 V!27665)) (EmptyCell!8042) )
))
(declare-fun mapValue!27044 () ValueCell!8042)

(declare-fun mapKey!27044 () (_ BitVec 32))

(declare-fun mapRest!27044 () (Array (_ BitVec 32) ValueCell!8042))

(declare-datatypes ((array!50078 0))(
  ( (array!50079 (arr!24070 (Array (_ BitVec 32) ValueCell!8042)) (size!24510 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50078)

(assert (=> mapNonEmpty!27044 (= (arr!24070 _values!688) (store mapRest!27044 mapKey!27044 mapValue!27044))))

(declare-fun b!868539 () Bool)

(declare-fun e!483742 () Bool)

(declare-fun e!483741 () Bool)

(assert (=> b!868539 (= e!483742 e!483741)))

(declare-fun res!590180 () Bool)

(assert (=> b!868539 (=> (not res!590180) (not e!483741))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!868539 (= res!590180 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11322 0))(
  ( (tuple2!11323 (_1!5672 (_ BitVec 64)) (_2!5672 V!27665)) )
))
(declare-datatypes ((List!17117 0))(
  ( (Nil!17114) (Cons!17113 (h!18244 tuple2!11322) (t!24154 List!17117)) )
))
(declare-datatypes ((ListLongMap!10091 0))(
  ( (ListLongMap!10092 (toList!5061 List!17117)) )
))
(declare-fun lt!394503 () ListLongMap!10091)

(declare-fun lt!394501 () array!50078)

(declare-datatypes ((array!50080 0))(
  ( (array!50081 (arr!24071 (Array (_ BitVec 32) (_ BitVec 64))) (size!24511 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50080)

(declare-fun minValue!654 () V!27665)

(declare-fun zeroValue!654 () V!27665)

(declare-fun getCurrentListMapNoExtraKeys!3030 (array!50080 array!50078 (_ BitVec 32) (_ BitVec 32) V!27665 V!27665 (_ BitVec 32) Int) ListLongMap!10091)

(assert (=> b!868539 (= lt!394503 (getCurrentListMapNoExtraKeys!3030 _keys!868 lt!394501 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27665)

(assert (=> b!868539 (= lt!394501 (array!50079 (store (arr!24070 _values!688) i!612 (ValueCellFull!8042 v!557)) (size!24510 _values!688)))))

(declare-fun lt!394502 () ListLongMap!10091)

(assert (=> b!868539 (= lt!394502 (getCurrentListMapNoExtraKeys!3030 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868540 () Bool)

(declare-fun res!590178 () Bool)

(assert (=> b!868540 (=> (not res!590178) (not e!483742))))

(assert (=> b!868540 (= res!590178 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24511 _keys!868))))))

(declare-fun b!868541 () Bool)

(declare-fun res!590185 () Bool)

(assert (=> b!868541 (=> (not res!590185) (not e!483742))))

(declare-datatypes ((List!17118 0))(
  ( (Nil!17115) (Cons!17114 (h!18245 (_ BitVec 64)) (t!24155 List!17118)) )
))
(declare-fun arrayNoDuplicates!0 (array!50080 (_ BitVec 32) List!17118) Bool)

(assert (=> b!868541 (= res!590185 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17115))))

(declare-fun b!868542 () Bool)

(declare-fun e!483744 () Bool)

(declare-fun tp_is_empty!16963 () Bool)

(assert (=> b!868542 (= e!483744 tp_is_empty!16963)))

(declare-fun b!868543 () Bool)

(declare-fun res!590181 () Bool)

(assert (=> b!868543 (=> (not res!590181) (not e!483742))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868543 (= res!590181 (validKeyInArray!0 k!854))))

(declare-fun b!868544 () Bool)

(declare-fun res!590186 () Bool)

(assert (=> b!868544 (=> (not res!590186) (not e!483742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50080 (_ BitVec 32)) Bool)

(assert (=> b!868544 (= res!590186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868545 () Bool)

(declare-fun res!590184 () Bool)

(assert (=> b!868545 (=> (not res!590184) (not e!483742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868545 (= res!590184 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27044 () Bool)

(assert (=> mapIsEmpty!27044 mapRes!27044))

(declare-fun b!868546 () Bool)

(assert (=> b!868546 (= e!483745 tp_is_empty!16963)))

(declare-fun b!868547 () Bool)

(assert (=> b!868547 (= e!483741 (not true))))

(declare-fun +!2403 (ListLongMap!10091 tuple2!11322) ListLongMap!10091)

(assert (=> b!868547 (= (getCurrentListMapNoExtraKeys!3030 _keys!868 lt!394501 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2403 (getCurrentListMapNoExtraKeys!3030 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11323 k!854 v!557)))))

(declare-datatypes ((Unit!29804 0))(
  ( (Unit!29805) )
))
(declare-fun lt!394504 () Unit!29804)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!597 (array!50080 array!50078 (_ BitVec 32) (_ BitVec 32) V!27665 V!27665 (_ BitVec 32) (_ BitVec 64) V!27665 (_ BitVec 32) Int) Unit!29804)

(assert (=> b!868547 (= lt!394504 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!597 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868549 () Bool)

(declare-fun res!590182 () Bool)

(assert (=> b!868549 (=> (not res!590182) (not e!483742))))

(assert (=> b!868549 (= res!590182 (and (= (size!24510 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24511 _keys!868) (size!24510 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868550 () Bool)

(declare-fun e!483740 () Bool)

(assert (=> b!868550 (= e!483740 (and e!483744 mapRes!27044))))

(declare-fun condMapEmpty!27044 () Bool)

(declare-fun mapDefault!27044 () ValueCell!8042)

