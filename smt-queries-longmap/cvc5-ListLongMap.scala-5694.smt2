; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73948 () Bool)

(assert start!73948)

(declare-fun b_free!14863 () Bool)

(declare-fun b_next!14863 () Bool)

(assert (=> start!73948 (= b_free!14863 (not b_next!14863))))

(declare-fun tp!52092 () Bool)

(declare-fun b_and!24615 () Bool)

(assert (=> start!73948 (= tp!52092 b_and!24615)))

(declare-fun b!869187 () Bool)

(declare-fun res!590665 () Bool)

(declare-fun e!484068 () Bool)

(assert (=> b!869187 (=> (not res!590665) (not e!484068))))

(declare-datatypes ((array!50146 0))(
  ( (array!50147 (arr!24104 (Array (_ BitVec 32) (_ BitVec 64))) (size!24544 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50146)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50146 (_ BitVec 32)) Bool)

(assert (=> b!869187 (= res!590665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869188 () Bool)

(declare-fun e!484069 () Bool)

(declare-fun tp_is_empty!16999 () Bool)

(assert (=> b!869188 (= e!484069 tp_is_empty!16999)))

(declare-fun b!869189 () Bool)

(declare-fun e!484064 () Bool)

(assert (=> b!869189 (= e!484064 tp_is_empty!16999)))

(declare-fun b!869190 () Bool)

(declare-fun res!590666 () Bool)

(assert (=> b!869190 (=> (not res!590666) (not e!484068))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869190 (= res!590666 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!27098 () Bool)

(declare-fun mapRes!27098 () Bool)

(assert (=> mapIsEmpty!27098 mapRes!27098))

(declare-fun b!869191 () Bool)

(declare-fun res!590671 () Bool)

(assert (=> b!869191 (=> (not res!590671) (not e!484068))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!869191 (= res!590671 (and (= (select (arr!24104 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!869192 () Bool)

(declare-fun res!590664 () Bool)

(assert (=> b!869192 (=> (not res!590664) (not e!484068))))

(assert (=> b!869192 (= res!590664 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24544 _keys!868))))))

(declare-fun res!590668 () Bool)

(assert (=> start!73948 (=> (not res!590668) (not e!484068))))

(assert (=> start!73948 (= res!590668 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24544 _keys!868))))))

(assert (=> start!73948 e!484068))

(assert (=> start!73948 tp_is_empty!16999))

(assert (=> start!73948 true))

(assert (=> start!73948 tp!52092))

(declare-fun array_inv!19040 (array!50146) Bool)

(assert (=> start!73948 (array_inv!19040 _keys!868)))

(declare-datatypes ((V!27713 0))(
  ( (V!27714 (val!8547 Int)) )
))
(declare-datatypes ((ValueCell!8060 0))(
  ( (ValueCellFull!8060 (v!10972 V!27713)) (EmptyCell!8060) )
))
(declare-datatypes ((array!50148 0))(
  ( (array!50149 (arr!24105 (Array (_ BitVec 32) ValueCell!8060)) (size!24545 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50148)

(declare-fun e!484066 () Bool)

(declare-fun array_inv!19041 (array!50148) Bool)

(assert (=> start!73948 (and (array_inv!19041 _values!688) e!484066)))

(declare-fun b!869193 () Bool)

(declare-fun res!590667 () Bool)

(assert (=> b!869193 (=> (not res!590667) (not e!484068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869193 (= res!590667 (validMask!0 mask!1196))))

(declare-fun b!869194 () Bool)

(declare-fun e!484065 () Bool)

(assert (=> b!869194 (= e!484068 e!484065)))

(declare-fun res!590669 () Bool)

(assert (=> b!869194 (=> (not res!590669) (not e!484065))))

(assert (=> b!869194 (= res!590669 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!394718 () array!50148)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11350 0))(
  ( (tuple2!11351 (_1!5686 (_ BitVec 64)) (_2!5686 V!27713)) )
))
(declare-datatypes ((List!17142 0))(
  ( (Nil!17139) (Cons!17138 (h!18269 tuple2!11350) (t!24179 List!17142)) )
))
(declare-datatypes ((ListLongMap!10119 0))(
  ( (ListLongMap!10120 (toList!5075 List!17142)) )
))
(declare-fun lt!394717 () ListLongMap!10119)

(declare-fun minValue!654 () V!27713)

(declare-fun zeroValue!654 () V!27713)

(declare-fun getCurrentListMapNoExtraKeys!3044 (array!50146 array!50148 (_ BitVec 32) (_ BitVec 32) V!27713 V!27713 (_ BitVec 32) Int) ListLongMap!10119)

(assert (=> b!869194 (= lt!394717 (getCurrentListMapNoExtraKeys!3044 _keys!868 lt!394718 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27713)

(assert (=> b!869194 (= lt!394718 (array!50149 (store (arr!24105 _values!688) i!612 (ValueCellFull!8060 v!557)) (size!24545 _values!688)))))

(declare-fun lt!394719 () ListLongMap!10119)

(assert (=> b!869194 (= lt!394719 (getCurrentListMapNoExtraKeys!3044 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869195 () Bool)

(assert (=> b!869195 (= e!484065 (not true))))

(declare-fun +!2416 (ListLongMap!10119 tuple2!11350) ListLongMap!10119)

(assert (=> b!869195 (= (getCurrentListMapNoExtraKeys!3044 _keys!868 lt!394718 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2416 (getCurrentListMapNoExtraKeys!3044 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11351 k!854 v!557)))))

(declare-datatypes ((Unit!29830 0))(
  ( (Unit!29831) )
))
(declare-fun lt!394720 () Unit!29830)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!610 (array!50146 array!50148 (_ BitVec 32) (_ BitVec 32) V!27713 V!27713 (_ BitVec 32) (_ BitVec 64) V!27713 (_ BitVec 32) Int) Unit!29830)

(assert (=> b!869195 (= lt!394720 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!610 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27098 () Bool)

(declare-fun tp!52093 () Bool)

(assert (=> mapNonEmpty!27098 (= mapRes!27098 (and tp!52093 e!484064))))

(declare-fun mapKey!27098 () (_ BitVec 32))

(declare-fun mapRest!27098 () (Array (_ BitVec 32) ValueCell!8060))

(declare-fun mapValue!27098 () ValueCell!8060)

(assert (=> mapNonEmpty!27098 (= (arr!24105 _values!688) (store mapRest!27098 mapKey!27098 mapValue!27098))))

(declare-fun b!869196 () Bool)

(declare-fun res!590670 () Bool)

(assert (=> b!869196 (=> (not res!590670) (not e!484068))))

(assert (=> b!869196 (= res!590670 (and (= (size!24545 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24544 _keys!868) (size!24545 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869197 () Bool)

(declare-fun res!590672 () Bool)

(assert (=> b!869197 (=> (not res!590672) (not e!484068))))

(declare-datatypes ((List!17143 0))(
  ( (Nil!17140) (Cons!17139 (h!18270 (_ BitVec 64)) (t!24180 List!17143)) )
))
(declare-fun arrayNoDuplicates!0 (array!50146 (_ BitVec 32) List!17143) Bool)

(assert (=> b!869197 (= res!590672 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17140))))

(declare-fun b!869198 () Bool)

(assert (=> b!869198 (= e!484066 (and e!484069 mapRes!27098))))

(declare-fun condMapEmpty!27098 () Bool)

(declare-fun mapDefault!27098 () ValueCell!8060)

