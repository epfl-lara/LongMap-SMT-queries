; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73450 () Bool)

(assert start!73450)

(declare-fun b_free!14365 () Bool)

(declare-fun b_next!14365 () Bool)

(assert (=> start!73450 (= b_free!14365 (not b_next!14365))))

(declare-fun tp!50599 () Bool)

(declare-fun b_and!23721 () Bool)

(assert (=> start!73450 (= tp!50599 b_and!23721)))

(declare-fun b!857694 () Bool)

(declare-fun e!478027 () Bool)

(assert (=> b!857694 (= e!478027 (not true))))

(declare-datatypes ((V!27049 0))(
  ( (V!27050 (val!8298 Int)) )
))
(declare-fun v!557 () V!27049)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49192 0))(
  ( (array!49193 (arr!23627 (Array (_ BitVec 32) (_ BitVec 64))) (size!24067 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49192)

(declare-datatypes ((ValueCell!7811 0))(
  ( (ValueCellFull!7811 (v!10723 V!27049)) (EmptyCell!7811) )
))
(declare-datatypes ((array!49194 0))(
  ( (array!49195 (arr!23628 (Array (_ BitVec 32) ValueCell!7811)) (size!24068 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49194)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!386374 () array!49194)

(declare-fun minValue!654 () V!27049)

(declare-fun zeroValue!654 () V!27049)

(declare-datatypes ((tuple2!10948 0))(
  ( (tuple2!10949 (_1!5485 (_ BitVec 64)) (_2!5485 V!27049)) )
))
(declare-datatypes ((List!16756 0))(
  ( (Nil!16753) (Cons!16752 (h!17883 tuple2!10948) (t!23397 List!16756)) )
))
(declare-datatypes ((ListLongMap!9717 0))(
  ( (ListLongMap!9718 (toList!4874 List!16756)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2855 (array!49192 array!49194 (_ BitVec 32) (_ BitVec 32) V!27049 V!27049 (_ BitVec 32) Int) ListLongMap!9717)

(declare-fun +!2228 (ListLongMap!9717 tuple2!10948) ListLongMap!9717)

(assert (=> b!857694 (= (getCurrentListMapNoExtraKeys!2855 _keys!868 lt!386374 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2228 (getCurrentListMapNoExtraKeys!2855 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10949 k!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29243 0))(
  ( (Unit!29244) )
))
(declare-fun lt!386375 () Unit!29243)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!449 (array!49192 array!49194 (_ BitVec 32) (_ BitVec 32) V!27049 V!27049 (_ BitVec 32) (_ BitVec 64) V!27049 (_ BitVec 32) Int) Unit!29243)

(assert (=> b!857694 (= lt!386375 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!449 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857695 () Bool)

(declare-fun e!478028 () Bool)

(declare-fun tp_is_empty!16501 () Bool)

(assert (=> b!857695 (= e!478028 tp_is_empty!16501)))

(declare-fun res!582641 () Bool)

(declare-fun e!478026 () Bool)

(assert (=> start!73450 (=> (not res!582641) (not e!478026))))

(assert (=> start!73450 (= res!582641 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24067 _keys!868))))))

(assert (=> start!73450 e!478026))

(assert (=> start!73450 tp_is_empty!16501))

(assert (=> start!73450 true))

(assert (=> start!73450 tp!50599))

(declare-fun array_inv!18712 (array!49192) Bool)

(assert (=> start!73450 (array_inv!18712 _keys!868)))

(declare-fun e!478030 () Bool)

(declare-fun array_inv!18713 (array!49194) Bool)

(assert (=> start!73450 (and (array_inv!18713 _values!688) e!478030)))

(declare-fun b!857696 () Bool)

(declare-fun res!582636 () Bool)

(assert (=> b!857696 (=> (not res!582636) (not e!478026))))

(assert (=> b!857696 (= res!582636 (and (= (select (arr!23627 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!857697 () Bool)

(declare-fun res!582638 () Bool)

(assert (=> b!857697 (=> (not res!582638) (not e!478026))))

(assert (=> b!857697 (= res!582638 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24067 _keys!868))))))

(declare-fun b!857698 () Bool)

(declare-fun res!582642 () Bool)

(assert (=> b!857698 (=> (not res!582642) (not e!478026))))

(declare-datatypes ((List!16757 0))(
  ( (Nil!16754) (Cons!16753 (h!17884 (_ BitVec 64)) (t!23398 List!16757)) )
))
(declare-fun arrayNoDuplicates!0 (array!49192 (_ BitVec 32) List!16757) Bool)

(assert (=> b!857698 (= res!582642 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16754))))

(declare-fun b!857699 () Bool)

(declare-fun res!582640 () Bool)

(assert (=> b!857699 (=> (not res!582640) (not e!478026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49192 (_ BitVec 32)) Bool)

(assert (=> b!857699 (= res!582640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857700 () Bool)

(declare-fun mapRes!26351 () Bool)

(assert (=> b!857700 (= e!478030 (and e!478028 mapRes!26351))))

(declare-fun condMapEmpty!26351 () Bool)

(declare-fun mapDefault!26351 () ValueCell!7811)

