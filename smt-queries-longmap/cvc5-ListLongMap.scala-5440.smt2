; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72424 () Bool)

(assert start!72424)

(declare-fun b_free!13609 () Bool)

(declare-fun b_next!13609 () Bool)

(assert (=> start!72424 (= b_free!13609 (not b_next!13609))))

(declare-fun tp!47925 () Bool)

(declare-fun b_and!22695 () Bool)

(assert (=> start!72424 (= tp!47925 b_and!22695)))

(declare-fun b!839687 () Bool)

(declare-fun res!570904 () Bool)

(declare-fun e!468593 () Bool)

(assert (=> b!839687 (=> (not res!570904) (not e!468593))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!47232 0))(
  ( (array!47233 (arr!22647 (Array (_ BitVec 32) (_ BitVec 64))) (size!23087 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47232)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!839687 (= res!570904 (and (= (select (arr!22647 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23087 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839688 () Bool)

(declare-fun res!570900 () Bool)

(assert (=> b!839688 (=> (not res!570900) (not e!468593))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47232 (_ BitVec 32)) Bool)

(assert (=> b!839688 (= res!570900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!570901 () Bool)

(assert (=> start!72424 (=> (not res!570901) (not e!468593))))

(assert (=> start!72424 (= res!570901 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23087 _keys!868))))))

(assert (=> start!72424 e!468593))

(declare-fun tp_is_empty!15475 () Bool)

(assert (=> start!72424 tp_is_empty!15475))

(assert (=> start!72424 true))

(assert (=> start!72424 tp!47925))

(declare-fun array_inv!18040 (array!47232) Bool)

(assert (=> start!72424 (array_inv!18040 _keys!868)))

(declare-datatypes ((V!25681 0))(
  ( (V!25682 (val!7785 Int)) )
))
(declare-datatypes ((ValueCell!7298 0))(
  ( (ValueCellFull!7298 (v!10210 V!25681)) (EmptyCell!7298) )
))
(declare-datatypes ((array!47234 0))(
  ( (array!47235 (arr!22648 (Array (_ BitVec 32) ValueCell!7298)) (size!23088 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47234)

(declare-fun e!468596 () Bool)

(declare-fun array_inv!18041 (array!47234) Bool)

(assert (=> start!72424 (and (array_inv!18041 _values!688) e!468596)))

(declare-fun bm!37057 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10310 0))(
  ( (tuple2!10311 (_1!5166 (_ BitVec 64)) (_2!5166 V!25681)) )
))
(declare-datatypes ((List!16107 0))(
  ( (Nil!16104) (Cons!16103 (h!17234 tuple2!10310) (t!22478 List!16107)) )
))
(declare-datatypes ((ListLongMap!9079 0))(
  ( (ListLongMap!9080 (toList!4555 List!16107)) )
))
(declare-fun call!37061 () ListLongMap!9079)

(declare-fun minValue!654 () V!25681)

(declare-fun zeroValue!654 () V!25681)

(declare-fun getCurrentListMapNoExtraKeys!2545 (array!47232 array!47234 (_ BitVec 32) (_ BitVec 32) V!25681 V!25681 (_ BitVec 32) Int) ListLongMap!9079)

(assert (=> bm!37057 (= call!37061 (getCurrentListMapNoExtraKeys!2545 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839689 () Bool)

(declare-fun e!468598 () Bool)

(assert (=> b!839689 (= e!468598 tp_is_empty!15475)))

(declare-fun b!839690 () Bool)

(assert (=> b!839690 (= e!468593 (not true))))

(declare-fun e!468594 () Bool)

(assert (=> b!839690 e!468594))

(declare-fun c!91273 () Bool)

(assert (=> b!839690 (= c!91273 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25681)

(declare-datatypes ((Unit!28839 0))(
  ( (Unit!28840) )
))
(declare-fun lt!380779 () Unit!28839)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!265 (array!47232 array!47234 (_ BitVec 32) (_ BitVec 32) V!25681 V!25681 (_ BitVec 32) (_ BitVec 64) V!25681 (_ BitVec 32) Int) Unit!28839)

(assert (=> b!839690 (= lt!380779 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!265 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839691 () Bool)

(declare-fun e!468595 () Bool)

(assert (=> b!839691 (= e!468595 tp_is_empty!15475)))

(declare-fun b!839692 () Bool)

(declare-fun res!570902 () Bool)

(assert (=> b!839692 (=> (not res!570902) (not e!468593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839692 (= res!570902 (validKeyInArray!0 k!854))))

(declare-fun b!839693 () Bool)

(declare-fun res!570898 () Bool)

(assert (=> b!839693 (=> (not res!570898) (not e!468593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839693 (= res!570898 (validMask!0 mask!1196))))

(declare-fun b!839694 () Bool)

(declare-fun res!570899 () Bool)

(assert (=> b!839694 (=> (not res!570899) (not e!468593))))

(declare-datatypes ((List!16108 0))(
  ( (Nil!16105) (Cons!16104 (h!17235 (_ BitVec 64)) (t!22479 List!16108)) )
))
(declare-fun arrayNoDuplicates!0 (array!47232 (_ BitVec 32) List!16108) Bool)

(assert (=> b!839694 (= res!570899 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16105))))

(declare-fun mapNonEmpty!24812 () Bool)

(declare-fun mapRes!24812 () Bool)

(declare-fun tp!47926 () Bool)

(assert (=> mapNonEmpty!24812 (= mapRes!24812 (and tp!47926 e!468598))))

(declare-fun mapValue!24812 () ValueCell!7298)

(declare-fun mapRest!24812 () (Array (_ BitVec 32) ValueCell!7298))

(declare-fun mapKey!24812 () (_ BitVec 32))

(assert (=> mapNonEmpty!24812 (= (arr!22648 _values!688) (store mapRest!24812 mapKey!24812 mapValue!24812))))

(declare-fun b!839695 () Bool)

(declare-fun call!37060 () ListLongMap!9079)

(assert (=> b!839695 (= e!468594 (= call!37060 call!37061))))

(declare-fun b!839696 () Bool)

(declare-fun res!570905 () Bool)

(assert (=> b!839696 (=> (not res!570905) (not e!468593))))

(assert (=> b!839696 (= res!570905 (and (= (size!23088 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23087 _keys!868) (size!23088 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839697 () Bool)

(declare-fun +!2026 (ListLongMap!9079 tuple2!10310) ListLongMap!9079)

(assert (=> b!839697 (= e!468594 (= call!37060 (+!2026 call!37061 (tuple2!10311 k!854 v!557))))))

(declare-fun bm!37058 () Bool)

(assert (=> bm!37058 (= call!37060 (getCurrentListMapNoExtraKeys!2545 _keys!868 (array!47235 (store (arr!22648 _values!688) i!612 (ValueCellFull!7298 v!557)) (size!23088 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839698 () Bool)

(assert (=> b!839698 (= e!468596 (and e!468595 mapRes!24812))))

(declare-fun condMapEmpty!24812 () Bool)

(declare-fun mapDefault!24812 () ValueCell!7298)

