; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73988 () Bool)

(assert start!73988)

(declare-fun b_free!14903 () Bool)

(declare-fun b_next!14903 () Bool)

(assert (=> start!73988 (= b_free!14903 (not b_next!14903))))

(declare-fun tp!52212 () Bool)

(declare-fun b_and!24655 () Bool)

(assert (=> start!73988 (= tp!52212 b_and!24655)))

(declare-fun b!869907 () Bool)

(declare-fun res!591212 () Bool)

(declare-fun e!484425 () Bool)

(assert (=> b!869907 (=> (not res!591212) (not e!484425))))

(declare-datatypes ((array!50224 0))(
  ( (array!50225 (arr!24143 (Array (_ BitVec 32) (_ BitVec 64))) (size!24583 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50224)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50224 (_ BitVec 32)) Bool)

(assert (=> b!869907 (= res!591212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!591206 () Bool)

(assert (=> start!73988 (=> (not res!591206) (not e!484425))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73988 (= res!591206 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24583 _keys!868))))))

(assert (=> start!73988 e!484425))

(declare-fun tp_is_empty!17039 () Bool)

(assert (=> start!73988 tp_is_empty!17039))

(assert (=> start!73988 true))

(assert (=> start!73988 tp!52212))

(declare-fun array_inv!19072 (array!50224) Bool)

(assert (=> start!73988 (array_inv!19072 _keys!868)))

(declare-datatypes ((V!27765 0))(
  ( (V!27766 (val!8567 Int)) )
))
(declare-datatypes ((ValueCell!8080 0))(
  ( (ValueCellFull!8080 (v!10992 V!27765)) (EmptyCell!8080) )
))
(declare-datatypes ((array!50226 0))(
  ( (array!50227 (arr!24144 (Array (_ BitVec 32) ValueCell!8080)) (size!24584 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50226)

(declare-fun e!484428 () Bool)

(declare-fun array_inv!19073 (array!50226) Bool)

(assert (=> start!73988 (and (array_inv!19073 _values!688) e!484428)))

(declare-fun b!869908 () Bool)

(declare-fun res!591208 () Bool)

(assert (=> b!869908 (=> (not res!591208) (not e!484425))))

(declare-datatypes ((List!17173 0))(
  ( (Nil!17170) (Cons!17169 (h!18300 (_ BitVec 64)) (t!24210 List!17173)) )
))
(declare-fun arrayNoDuplicates!0 (array!50224 (_ BitVec 32) List!17173) Bool)

(assert (=> b!869908 (= res!591208 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17170))))

(declare-fun b!869909 () Bool)

(declare-fun e!484426 () Bool)

(assert (=> b!869909 (= e!484426 tp_is_empty!17039)))

(declare-fun b!869910 () Bool)

(declare-fun e!484424 () Bool)

(assert (=> b!869910 (= e!484424 (not true))))

(declare-fun v!557 () V!27765)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!394958 () array!50226)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!27765)

(declare-fun zeroValue!654 () V!27765)

(declare-datatypes ((tuple2!11382 0))(
  ( (tuple2!11383 (_1!5702 (_ BitVec 64)) (_2!5702 V!27765)) )
))
(declare-datatypes ((List!17174 0))(
  ( (Nil!17171) (Cons!17170 (h!18301 tuple2!11382) (t!24211 List!17174)) )
))
(declare-datatypes ((ListLongMap!10151 0))(
  ( (ListLongMap!10152 (toList!5091 List!17174)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3060 (array!50224 array!50226 (_ BitVec 32) (_ BitVec 32) V!27765 V!27765 (_ BitVec 32) Int) ListLongMap!10151)

(declare-fun +!2431 (ListLongMap!10151 tuple2!11382) ListLongMap!10151)

(assert (=> b!869910 (= (getCurrentListMapNoExtraKeys!3060 _keys!868 lt!394958 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2431 (getCurrentListMapNoExtraKeys!3060 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11383 k!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29860 0))(
  ( (Unit!29861) )
))
(declare-fun lt!394960 () Unit!29860)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!625 (array!50224 array!50226 (_ BitVec 32) (_ BitVec 32) V!27765 V!27765 (_ BitVec 32) (_ BitVec 64) V!27765 (_ BitVec 32) Int) Unit!29860)

(assert (=> b!869910 (= lt!394960 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!625 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869911 () Bool)

(declare-fun res!591205 () Bool)

(assert (=> b!869911 (=> (not res!591205) (not e!484425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869911 (= res!591205 (validKeyInArray!0 k!854))))

(declare-fun b!869912 () Bool)

(declare-fun res!591204 () Bool)

(assert (=> b!869912 (=> (not res!591204) (not e!484425))))

(assert (=> b!869912 (= res!591204 (and (= (size!24584 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24583 _keys!868) (size!24584 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869913 () Bool)

(declare-fun res!591209 () Bool)

(assert (=> b!869913 (=> (not res!591209) (not e!484425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869913 (= res!591209 (validMask!0 mask!1196))))

(declare-fun b!869914 () Bool)

(declare-fun res!591210 () Bool)

(assert (=> b!869914 (=> (not res!591210) (not e!484425))))

(assert (=> b!869914 (= res!591210 (and (= (select (arr!24143 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27158 () Bool)

(declare-fun mapRes!27158 () Bool)

(declare-fun tp!52213 () Bool)

(declare-fun e!484427 () Bool)

(assert (=> mapNonEmpty!27158 (= mapRes!27158 (and tp!52213 e!484427))))

(declare-fun mapKey!27158 () (_ BitVec 32))

(declare-fun mapRest!27158 () (Array (_ BitVec 32) ValueCell!8080))

(declare-fun mapValue!27158 () ValueCell!8080)

(assert (=> mapNonEmpty!27158 (= (arr!24144 _values!688) (store mapRest!27158 mapKey!27158 mapValue!27158))))

(declare-fun b!869915 () Bool)

(assert (=> b!869915 (= e!484427 tp_is_empty!17039)))

(declare-fun b!869916 () Bool)

(assert (=> b!869916 (= e!484428 (and e!484426 mapRes!27158))))

(declare-fun condMapEmpty!27158 () Bool)

(declare-fun mapDefault!27158 () ValueCell!8080)

