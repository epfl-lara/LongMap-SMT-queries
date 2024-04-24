; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74526 () Bool)

(assert start!74526)

(declare-fun b_free!15121 () Bool)

(declare-fun b_next!15121 () Bool)

(assert (=> start!74526 (= b_free!15121 (not b_next!15121))))

(declare-fun tp!53038 () Bool)

(declare-fun b_and!24907 () Bool)

(assert (=> start!74526 (= tp!53038 b_and!24907)))

(declare-fun b!876145 () Bool)

(declare-fun res!595159 () Bool)

(declare-fun e!487839 () Bool)

(assert (=> b!876145 (=> (not res!595159) (not e!487839))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876145 (= res!595159 (validMask!0 mask!1196))))

(declare-fun b!876146 () Bool)

(declare-fun res!595161 () Bool)

(assert (=> b!876146 (=> (not res!595161) (not e!487839))))

(declare-datatypes ((array!50907 0))(
  ( (array!50908 (arr!24477 (Array (_ BitVec 32) (_ BitVec 64))) (size!24918 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50907)

(declare-datatypes ((List!17311 0))(
  ( (Nil!17308) (Cons!17307 (h!18444 (_ BitVec 64)) (t!24344 List!17311)) )
))
(declare-fun arrayNoDuplicates!0 (array!50907 (_ BitVec 32) List!17311) Bool)

(assert (=> b!876146 (= res!595161 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17308))))

(declare-fun res!595163 () Bool)

(assert (=> start!74526 (=> (not res!595163) (not e!487839))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74526 (= res!595163 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24918 _keys!868))))))

(assert (=> start!74526 e!487839))

(declare-fun tp_is_empty!17365 () Bool)

(assert (=> start!74526 tp_is_empty!17365))

(assert (=> start!74526 true))

(assert (=> start!74526 tp!53038))

(declare-fun array_inv!19354 (array!50907) Bool)

(assert (=> start!74526 (array_inv!19354 _keys!868)))

(declare-datatypes ((V!28201 0))(
  ( (V!28202 (val!8730 Int)) )
))
(declare-datatypes ((ValueCell!8243 0))(
  ( (ValueCellFull!8243 (v!11159 V!28201)) (EmptyCell!8243) )
))
(declare-datatypes ((array!50909 0))(
  ( (array!50910 (arr!24478 (Array (_ BitVec 32) ValueCell!8243)) (size!24919 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50909)

(declare-fun e!487835 () Bool)

(declare-fun array_inv!19355 (array!50909) Bool)

(assert (=> start!74526 (and (array_inv!19355 _values!688) e!487835)))

(declare-fun b!876147 () Bool)

(declare-fun res!595157 () Bool)

(assert (=> b!876147 (=> (not res!595157) (not e!487839))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!876147 (= res!595157 (and (= (size!24919 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24918 _keys!868) (size!24919 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!876148 () Bool)

(declare-fun e!487837 () Bool)

(assert (=> b!876148 (= e!487837 tp_is_empty!17365)))

(declare-fun b!876149 () Bool)

(declare-fun e!487840 () Bool)

(declare-fun e!487841 () Bool)

(assert (=> b!876149 (= e!487840 (not e!487841))))

(declare-fun res!595154 () Bool)

(assert (=> b!876149 (=> res!595154 e!487841)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876149 (= res!595154 (not (validKeyInArray!0 (select (arr!24477 _keys!868) from!1053))))))

(declare-fun e!487834 () Bool)

(assert (=> b!876149 e!487834))

(declare-fun c!92777 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876149 (= c!92777 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!28201)

(declare-datatypes ((Unit!29916 0))(
  ( (Unit!29917) )
))
(declare-fun lt!396479 () Unit!29916)

(declare-fun defaultEntry!696 () Int)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!28201)

(declare-fun zeroValue!654 () V!28201)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!652 (array!50907 array!50909 (_ BitVec 32) (_ BitVec 32) V!28201 V!28201 (_ BitVec 32) (_ BitVec 64) V!28201 (_ BitVec 32) Int) Unit!29916)

(assert (=> b!876149 (= lt!396479 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!652 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27656 () Bool)

(declare-fun mapRes!27656 () Bool)

(declare-fun tp!53039 () Bool)

(declare-fun e!487838 () Bool)

(assert (=> mapNonEmpty!27656 (= mapRes!27656 (and tp!53039 e!487838))))

(declare-fun mapKey!27656 () (_ BitVec 32))

(declare-fun mapValue!27656 () ValueCell!8243)

(declare-fun mapRest!27656 () (Array (_ BitVec 32) ValueCell!8243))

(assert (=> mapNonEmpty!27656 (= (arr!24478 _values!688) (store mapRest!27656 mapKey!27656 mapValue!27656))))

(declare-datatypes ((tuple2!11468 0))(
  ( (tuple2!11469 (_1!5745 (_ BitVec 64)) (_2!5745 V!28201)) )
))
(declare-datatypes ((List!17312 0))(
  ( (Nil!17309) (Cons!17308 (h!18445 tuple2!11468) (t!24345 List!17312)) )
))
(declare-datatypes ((ListLongMap!10239 0))(
  ( (ListLongMap!10240 (toList!5135 List!17312)) )
))
(declare-fun call!38634 () ListLongMap!10239)

(declare-fun call!38633 () ListLongMap!10239)

(declare-fun b!876150 () Bool)

(declare-fun +!2483 (ListLongMap!10239 tuple2!11468) ListLongMap!10239)

(assert (=> b!876150 (= e!487834 (= call!38633 (+!2483 call!38634 (tuple2!11469 k0!854 v!557))))))

(declare-fun b!876151 () Bool)

(assert (=> b!876151 (= e!487841 (bvslt i!612 (size!24919 _values!688)))))

(declare-fun b!876152 () Bool)

(declare-fun res!595155 () Bool)

(assert (=> b!876152 (=> (not res!595155) (not e!487839))))

(assert (=> b!876152 (= res!595155 (and (= (select (arr!24477 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27656 () Bool)

(assert (=> mapIsEmpty!27656 mapRes!27656))

(declare-fun b!876153 () Bool)

(assert (=> b!876153 (= e!487834 (= call!38633 call!38634))))

(declare-fun lt!396477 () array!50909)

(declare-fun bm!38630 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3177 (array!50907 array!50909 (_ BitVec 32) (_ BitVec 32) V!28201 V!28201 (_ BitVec 32) Int) ListLongMap!10239)

(assert (=> bm!38630 (= call!38633 (getCurrentListMapNoExtraKeys!3177 _keys!868 lt!396477 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876154 () Bool)

(declare-fun res!595158 () Bool)

(assert (=> b!876154 (=> (not res!595158) (not e!487839))))

(assert (=> b!876154 (= res!595158 (validKeyInArray!0 k0!854))))

(declare-fun b!876155 () Bool)

(assert (=> b!876155 (= e!487835 (and e!487837 mapRes!27656))))

(declare-fun condMapEmpty!27656 () Bool)

(declare-fun mapDefault!27656 () ValueCell!8243)

(assert (=> b!876155 (= condMapEmpty!27656 (= (arr!24478 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8243)) mapDefault!27656)))))

(declare-fun b!876156 () Bool)

(declare-fun res!595156 () Bool)

(assert (=> b!876156 (=> (not res!595156) (not e!487839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50907 (_ BitVec 32)) Bool)

(assert (=> b!876156 (= res!595156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876157 () Bool)

(declare-fun res!595160 () Bool)

(assert (=> b!876157 (=> (not res!595160) (not e!487839))))

(assert (=> b!876157 (= res!595160 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24918 _keys!868))))))

(declare-fun b!876158 () Bool)

(assert (=> b!876158 (= e!487838 tp_is_empty!17365)))

(declare-fun bm!38631 () Bool)

(assert (=> bm!38631 (= call!38634 (getCurrentListMapNoExtraKeys!3177 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876159 () Bool)

(assert (=> b!876159 (= e!487839 e!487840)))

(declare-fun res!595162 () Bool)

(assert (=> b!876159 (=> (not res!595162) (not e!487840))))

(assert (=> b!876159 (= res!595162 (= from!1053 i!612))))

(declare-fun lt!396480 () ListLongMap!10239)

(assert (=> b!876159 (= lt!396480 (getCurrentListMapNoExtraKeys!3177 _keys!868 lt!396477 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!876159 (= lt!396477 (array!50910 (store (arr!24478 _values!688) i!612 (ValueCellFull!8243 v!557)) (size!24919 _values!688)))))

(declare-fun lt!396478 () ListLongMap!10239)

(assert (=> b!876159 (= lt!396478 (getCurrentListMapNoExtraKeys!3177 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74526 res!595163) b!876145))

(assert (= (and b!876145 res!595159) b!876147))

(assert (= (and b!876147 res!595157) b!876156))

(assert (= (and b!876156 res!595156) b!876146))

(assert (= (and b!876146 res!595161) b!876157))

(assert (= (and b!876157 res!595160) b!876154))

(assert (= (and b!876154 res!595158) b!876152))

(assert (= (and b!876152 res!595155) b!876159))

(assert (= (and b!876159 res!595162) b!876149))

(assert (= (and b!876149 c!92777) b!876150))

(assert (= (and b!876149 (not c!92777)) b!876153))

(assert (= (or b!876150 b!876153) bm!38630))

(assert (= (or b!876150 b!876153) bm!38631))

(assert (= (and b!876149 (not res!595154)) b!876151))

(assert (= (and b!876155 condMapEmpty!27656) mapIsEmpty!27656))

(assert (= (and b!876155 (not condMapEmpty!27656)) mapNonEmpty!27656))

(get-info :version)

(assert (= (and mapNonEmpty!27656 ((_ is ValueCellFull!8243) mapValue!27656)) b!876158))

(assert (= (and b!876155 ((_ is ValueCellFull!8243) mapDefault!27656)) b!876148))

(assert (= start!74526 b!876155))

(declare-fun m!816445 () Bool)

(assert (=> b!876145 m!816445))

(declare-fun m!816447 () Bool)

(assert (=> b!876159 m!816447))

(declare-fun m!816449 () Bool)

(assert (=> b!876159 m!816449))

(declare-fun m!816451 () Bool)

(assert (=> b!876159 m!816451))

(declare-fun m!816453 () Bool)

(assert (=> b!876146 m!816453))

(declare-fun m!816455 () Bool)

(assert (=> b!876149 m!816455))

(assert (=> b!876149 m!816455))

(declare-fun m!816457 () Bool)

(assert (=> b!876149 m!816457))

(declare-fun m!816459 () Bool)

(assert (=> b!876149 m!816459))

(declare-fun m!816461 () Bool)

(assert (=> start!74526 m!816461))

(declare-fun m!816463 () Bool)

(assert (=> start!74526 m!816463))

(declare-fun m!816465 () Bool)

(assert (=> bm!38631 m!816465))

(declare-fun m!816467 () Bool)

(assert (=> b!876154 m!816467))

(declare-fun m!816469 () Bool)

(assert (=> bm!38630 m!816469))

(declare-fun m!816471 () Bool)

(assert (=> b!876156 m!816471))

(declare-fun m!816473 () Bool)

(assert (=> mapNonEmpty!27656 m!816473))

(declare-fun m!816475 () Bool)

(assert (=> b!876152 m!816475))

(declare-fun m!816477 () Bool)

(assert (=> b!876150 m!816477))

(check-sat (not bm!38630) (not b!876145) (not mapNonEmpty!27656) b_and!24907 (not b!876150) (not b!876159) (not b!876156) (not b_next!15121) (not b!876146) (not b!876154) (not bm!38631) (not b!876149) tp_is_empty!17365 (not start!74526))
(check-sat b_and!24907 (not b_next!15121))
