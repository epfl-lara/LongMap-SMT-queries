; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74412 () Bool)

(assert start!74412)

(declare-fun b_free!15155 () Bool)

(declare-fun b_next!15155 () Bool)

(assert (=> start!74412 (= b_free!15155 (not b_next!15155))))

(declare-fun tp!53142 () Bool)

(declare-fun b_and!24963 () Bool)

(assert (=> start!74412 (= tp!53142 b_and!24963)))

(declare-fun b!876153 () Bool)

(declare-fun e!487747 () Bool)

(declare-fun tp_is_empty!17399 () Bool)

(assert (=> b!876153 (= e!487747 tp_is_empty!17399)))

(declare-fun b!876154 () Bool)

(declare-fun e!487745 () Bool)

(declare-datatypes ((V!28245 0))(
  ( (V!28246 (val!8747 Int)) )
))
(declare-datatypes ((tuple2!11562 0))(
  ( (tuple2!11563 (_1!5792 (_ BitVec 64)) (_2!5792 V!28245)) )
))
(declare-datatypes ((List!17381 0))(
  ( (Nil!17378) (Cons!17377 (h!18508 tuple2!11562) (t!24440 List!17381)) )
))
(declare-datatypes ((ListLongMap!10331 0))(
  ( (ListLongMap!10332 (toList!5181 List!17381)) )
))
(declare-fun call!38708 () ListLongMap!10331)

(declare-fun call!38709 () ListLongMap!10331)

(assert (=> b!876154 (= e!487745 (= call!38708 call!38709))))

(declare-fun b!876155 () Bool)

(declare-fun res!595374 () Bool)

(declare-fun e!487742 () Bool)

(assert (=> b!876155 (=> (not res!595374) (not e!487742))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876155 (= res!595374 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!27710 () Bool)

(declare-fun mapRes!27710 () Bool)

(declare-fun tp!53143 () Bool)

(declare-fun e!487748 () Bool)

(assert (=> mapNonEmpty!27710 (= mapRes!27710 (and tp!53143 e!487748))))

(declare-datatypes ((ValueCell!8260 0))(
  ( (ValueCellFull!8260 (v!11180 V!28245)) (EmptyCell!8260) )
))
(declare-fun mapRest!27710 () (Array (_ BitVec 32) ValueCell!8260))

(declare-fun mapKey!27710 () (_ BitVec 32))

(declare-fun mapValue!27710 () ValueCell!8260)

(declare-datatypes ((array!50924 0))(
  ( (array!50925 (arr!24489 (Array (_ BitVec 32) ValueCell!8260)) (size!24929 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50924)

(assert (=> mapNonEmpty!27710 (= (arr!24489 _values!688) (store mapRest!27710 mapKey!27710 mapValue!27710))))

(declare-fun lt!396408 () array!50924)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50926 0))(
  ( (array!50927 (arr!24490 (Array (_ BitVec 32) (_ BitVec 64))) (size!24930 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50926)

(declare-fun bm!38705 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28245)

(declare-fun zeroValue!654 () V!28245)

(declare-fun getCurrentListMapNoExtraKeys!3148 (array!50926 array!50924 (_ BitVec 32) (_ BitVec 32) V!28245 V!28245 (_ BitVec 32) Int) ListLongMap!10331)

(assert (=> bm!38705 (= call!38708 (getCurrentListMapNoExtraKeys!3148 _keys!868 lt!396408 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!595378 () Bool)

(assert (=> start!74412 (=> (not res!595378) (not e!487742))))

(assert (=> start!74412 (= res!595378 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24930 _keys!868))))))

(assert (=> start!74412 e!487742))

(assert (=> start!74412 tp_is_empty!17399))

(assert (=> start!74412 true))

(assert (=> start!74412 tp!53142))

(declare-fun array_inv!19306 (array!50926) Bool)

(assert (=> start!74412 (array_inv!19306 _keys!868)))

(declare-fun e!487749 () Bool)

(declare-fun array_inv!19307 (array!50924) Bool)

(assert (=> start!74412 (and (array_inv!19307 _values!688) e!487749)))

(declare-fun b!876156 () Bool)

(declare-fun e!487744 () Bool)

(assert (=> b!876156 (= e!487742 e!487744)))

(declare-fun res!595377 () Bool)

(assert (=> b!876156 (=> (not res!595377) (not e!487744))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876156 (= res!595377 (= from!1053 i!612))))

(declare-fun lt!396411 () ListLongMap!10331)

(assert (=> b!876156 (= lt!396411 (getCurrentListMapNoExtraKeys!3148 _keys!868 lt!396408 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28245)

(assert (=> b!876156 (= lt!396408 (array!50925 (store (arr!24489 _values!688) i!612 (ValueCellFull!8260 v!557)) (size!24929 _values!688)))))

(declare-fun lt!396409 () ListLongMap!10331)

(assert (=> b!876156 (= lt!396409 (getCurrentListMapNoExtraKeys!3148 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!876157 () Bool)

(declare-fun e!487746 () Bool)

(assert (=> b!876157 (= e!487744 (not e!487746))))

(declare-fun res!595372 () Bool)

(assert (=> b!876157 (=> res!595372 e!487746)))

(assert (=> b!876157 (= res!595372 (not (validKeyInArray!0 (select (arr!24490 _keys!868) from!1053))))))

(assert (=> b!876157 e!487745))

(declare-fun c!92582 () Bool)

(assert (=> b!876157 (= c!92582 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29962 0))(
  ( (Unit!29963) )
))
(declare-fun lt!396410 () Unit!29962)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!674 (array!50926 array!50924 (_ BitVec 32) (_ BitVec 32) V!28245 V!28245 (_ BitVec 32) (_ BitVec 64) V!28245 (_ BitVec 32) Int) Unit!29962)

(assert (=> b!876157 (= lt!396410 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!674 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876158 () Bool)

(assert (=> b!876158 (= e!487746 (bvslt i!612 (size!24929 _values!688)))))

(declare-fun +!2482 (ListLongMap!10331 tuple2!11562) ListLongMap!10331)

(declare-fun get!12876 (ValueCell!8260 V!28245) V!28245)

(declare-fun dynLambda!1210 (Int (_ BitVec 64)) V!28245)

(assert (=> b!876158 (= lt!396411 (+!2482 (getCurrentListMapNoExtraKeys!3148 _keys!868 lt!396408 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11563 (select (arr!24490 _keys!868) from!1053) (get!12876 (select (arr!24489 lt!396408) from!1053) (dynLambda!1210 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876159 () Bool)

(declare-fun res!595370 () Bool)

(assert (=> b!876159 (=> (not res!595370) (not e!487742))))

(declare-datatypes ((List!17382 0))(
  ( (Nil!17379) (Cons!17378 (h!18509 (_ BitVec 64)) (t!24441 List!17382)) )
))
(declare-fun arrayNoDuplicates!0 (array!50926 (_ BitVec 32) List!17382) Bool)

(assert (=> b!876159 (= res!595370 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17379))))

(declare-fun b!876160 () Bool)

(assert (=> b!876160 (= e!487745 (= call!38708 (+!2482 call!38709 (tuple2!11563 k!854 v!557))))))

(declare-fun b!876161 () Bool)

(declare-fun res!595373 () Bool)

(assert (=> b!876161 (=> (not res!595373) (not e!487742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876161 (= res!595373 (validMask!0 mask!1196))))

(declare-fun bm!38706 () Bool)

(assert (=> bm!38706 (= call!38709 (getCurrentListMapNoExtraKeys!3148 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876162 () Bool)

(declare-fun res!595375 () Bool)

(assert (=> b!876162 (=> (not res!595375) (not e!487742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50926 (_ BitVec 32)) Bool)

(assert (=> b!876162 (= res!595375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876163 () Bool)

(declare-fun res!595371 () Bool)

(assert (=> b!876163 (=> (not res!595371) (not e!487742))))

(assert (=> b!876163 (= res!595371 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24930 _keys!868))))))

(declare-fun b!876164 () Bool)

(assert (=> b!876164 (= e!487748 tp_is_empty!17399)))

(declare-fun b!876165 () Bool)

(declare-fun res!595376 () Bool)

(assert (=> b!876165 (=> (not res!595376) (not e!487742))))

(assert (=> b!876165 (= res!595376 (and (= (size!24929 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24930 _keys!868) (size!24929 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27710 () Bool)

(assert (=> mapIsEmpty!27710 mapRes!27710))

(declare-fun b!876166 () Bool)

(declare-fun res!595379 () Bool)

(assert (=> b!876166 (=> (not res!595379) (not e!487742))))

(assert (=> b!876166 (= res!595379 (and (= (select (arr!24490 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!876167 () Bool)

(assert (=> b!876167 (= e!487749 (and e!487747 mapRes!27710))))

(declare-fun condMapEmpty!27710 () Bool)

(declare-fun mapDefault!27710 () ValueCell!8260)

