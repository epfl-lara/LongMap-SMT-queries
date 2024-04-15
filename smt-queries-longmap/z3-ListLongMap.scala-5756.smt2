; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74346 () Bool)

(assert start!74346)

(declare-fun b_free!15127 () Bool)

(declare-fun b_next!15127 () Bool)

(assert (=> start!74346 (= b_free!15127 (not b_next!15127))))

(declare-fun tp!53056 () Bool)

(declare-fun b_and!24877 () Bool)

(assert (=> start!74346 (= tp!53056 b_and!24877)))

(declare-fun b!875138 () Bool)

(declare-fun res!594797 () Bool)

(declare-fun e!487179 () Bool)

(assert (=> b!875138 (=> (not res!594797) (not e!487179))))

(declare-datatypes ((array!50845 0))(
  ( (array!50846 (arr!24451 (Array (_ BitVec 32) (_ BitVec 64))) (size!24893 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50845)

(declare-datatypes ((List!17356 0))(
  ( (Nil!17353) (Cons!17352 (h!18483 (_ BitVec 64)) (t!24388 List!17356)) )
))
(declare-fun arrayNoDuplicates!0 (array!50845 (_ BitVec 32) List!17356) Bool)

(assert (=> b!875138 (= res!594797 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17353))))

(declare-fun b!875139 () Bool)

(declare-fun res!594795 () Bool)

(assert (=> b!875139 (=> (not res!594795) (not e!487179))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!875139 (= res!594795 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24893 _keys!868))))))

(declare-fun b!875140 () Bool)

(declare-fun res!594794 () Bool)

(assert (=> b!875140 (=> (not res!594794) (not e!487179))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!875140 (= res!594794 (and (= (select (arr!24451 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!594790 () Bool)

(assert (=> start!74346 (=> (not res!594790) (not e!487179))))

(assert (=> start!74346 (= res!594790 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24893 _keys!868))))))

(assert (=> start!74346 e!487179))

(declare-fun tp_is_empty!17371 () Bool)

(assert (=> start!74346 tp_is_empty!17371))

(assert (=> start!74346 true))

(assert (=> start!74346 tp!53056))

(declare-fun array_inv!19328 (array!50845) Bool)

(assert (=> start!74346 (array_inv!19328 _keys!868)))

(declare-datatypes ((V!28209 0))(
  ( (V!28210 (val!8733 Int)) )
))
(declare-datatypes ((ValueCell!8246 0))(
  ( (ValueCellFull!8246 (v!11156 V!28209)) (EmptyCell!8246) )
))
(declare-datatypes ((array!50847 0))(
  ( (array!50848 (arr!24452 (Array (_ BitVec 32) ValueCell!8246)) (size!24894 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50847)

(declare-fun e!487177 () Bool)

(declare-fun array_inv!19329 (array!50847) Bool)

(assert (=> start!74346 (and (array_inv!19329 _values!688) e!487177)))

(declare-fun mapNonEmpty!27665 () Bool)

(declare-fun mapRes!27665 () Bool)

(declare-fun tp!53057 () Bool)

(declare-fun e!487176 () Bool)

(assert (=> mapNonEmpty!27665 (= mapRes!27665 (and tp!53057 e!487176))))

(declare-fun mapValue!27665 () ValueCell!8246)

(declare-fun mapKey!27665 () (_ BitVec 32))

(declare-fun mapRest!27665 () (Array (_ BitVec 32) ValueCell!8246))

(assert (=> mapNonEmpty!27665 (= (arr!24452 _values!688) (store mapRest!27665 mapKey!27665 mapValue!27665))))

(declare-fun b!875141 () Bool)

(declare-fun e!487182 () Bool)

(assert (=> b!875141 (= e!487179 e!487182)))

(declare-fun res!594791 () Bool)

(assert (=> b!875141 (=> (not res!594791) (not e!487182))))

(assert (=> b!875141 (= res!594791 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!395920 () array!50847)

(declare-fun minValue!654 () V!28209)

(declare-fun zeroValue!654 () V!28209)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11544 0))(
  ( (tuple2!11545 (_1!5783 (_ BitVec 64)) (_2!5783 V!28209)) )
))
(declare-datatypes ((List!17357 0))(
  ( (Nil!17354) (Cons!17353 (h!18484 tuple2!11544) (t!24389 List!17357)) )
))
(declare-datatypes ((ListLongMap!10303 0))(
  ( (ListLongMap!10304 (toList!5167 List!17357)) )
))
(declare-fun lt!395921 () ListLongMap!10303)

(declare-fun getCurrentListMapNoExtraKeys!3160 (array!50845 array!50847 (_ BitVec 32) (_ BitVec 32) V!28209 V!28209 (_ BitVec 32) Int) ListLongMap!10303)

(assert (=> b!875141 (= lt!395921 (getCurrentListMapNoExtraKeys!3160 _keys!868 lt!395920 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28209)

(assert (=> b!875141 (= lt!395920 (array!50848 (store (arr!24452 _values!688) i!612 (ValueCellFull!8246 v!557)) (size!24894 _values!688)))))

(declare-fun lt!395919 () ListLongMap!10303)

(assert (=> b!875141 (= lt!395919 (getCurrentListMapNoExtraKeys!3160 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875142 () Bool)

(declare-fun e!487181 () Bool)

(assert (=> b!875142 (= e!487177 (and e!487181 mapRes!27665))))

(declare-fun condMapEmpty!27665 () Bool)

(declare-fun mapDefault!27665 () ValueCell!8246)

(assert (=> b!875142 (= condMapEmpty!27665 (= (arr!24452 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8246)) mapDefault!27665)))))

(declare-fun b!875143 () Bool)

(assert (=> b!875143 (= e!487176 tp_is_empty!17371)))

(declare-fun b!875144 () Bool)

(declare-fun e!487178 () Bool)

(assert (=> b!875144 (= e!487182 (not e!487178))))

(declare-fun res!594798 () Bool)

(assert (=> b!875144 (=> res!594798 e!487178)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875144 (= res!594798 (not (validKeyInArray!0 (select (arr!24451 _keys!868) from!1053))))))

(declare-fun e!487183 () Bool)

(assert (=> b!875144 e!487183))

(declare-fun c!92439 () Bool)

(assert (=> b!875144 (= c!92439 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29889 0))(
  ( (Unit!29890) )
))
(declare-fun lt!395922 () Unit!29889)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!667 (array!50845 array!50847 (_ BitVec 32) (_ BitVec 32) V!28209 V!28209 (_ BitVec 32) (_ BitVec 64) V!28209 (_ BitVec 32) Int) Unit!29889)

(assert (=> b!875144 (= lt!395922 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!667 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875145 () Bool)

(assert (=> b!875145 (= e!487178 (bvslt from!1053 (size!24893 _keys!868)))))

(declare-fun lt!395918 () ListLongMap!10303)

(assert (=> b!875145 (= lt!395918 (getCurrentListMapNoExtraKeys!3160 _keys!868 lt!395920 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875146 () Bool)

(declare-fun res!594792 () Bool)

(assert (=> b!875146 (=> (not res!594792) (not e!487179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50845 (_ BitVec 32)) Bool)

(assert (=> b!875146 (= res!594792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!38577 () Bool)

(declare-fun call!38581 () ListLongMap!10303)

(assert (=> bm!38577 (= call!38581 (getCurrentListMapNoExtraKeys!3160 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875147 () Bool)

(declare-fun res!594796 () Bool)

(assert (=> b!875147 (=> (not res!594796) (not e!487179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875147 (= res!594796 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27665 () Bool)

(assert (=> mapIsEmpty!27665 mapRes!27665))

(declare-fun b!875148 () Bool)

(declare-fun res!594799 () Bool)

(assert (=> b!875148 (=> (not res!594799) (not e!487179))))

(assert (=> b!875148 (= res!594799 (and (= (size!24894 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24893 _keys!868) (size!24894 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875149 () Bool)

(declare-fun call!38580 () ListLongMap!10303)

(assert (=> b!875149 (= e!487183 (= call!38580 call!38581))))

(declare-fun b!875150 () Bool)

(declare-fun res!594793 () Bool)

(assert (=> b!875150 (=> (not res!594793) (not e!487179))))

(assert (=> b!875150 (= res!594793 (validKeyInArray!0 k0!854))))

(declare-fun bm!38578 () Bool)

(assert (=> bm!38578 (= call!38580 (getCurrentListMapNoExtraKeys!3160 _keys!868 lt!395920 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875151 () Bool)

(declare-fun +!2497 (ListLongMap!10303 tuple2!11544) ListLongMap!10303)

(assert (=> b!875151 (= e!487183 (= call!38580 (+!2497 call!38581 (tuple2!11545 k0!854 v!557))))))

(declare-fun b!875152 () Bool)

(assert (=> b!875152 (= e!487181 tp_is_empty!17371)))

(assert (= (and start!74346 res!594790) b!875147))

(assert (= (and b!875147 res!594796) b!875148))

(assert (= (and b!875148 res!594799) b!875146))

(assert (= (and b!875146 res!594792) b!875138))

(assert (= (and b!875138 res!594797) b!875139))

(assert (= (and b!875139 res!594795) b!875150))

(assert (= (and b!875150 res!594793) b!875140))

(assert (= (and b!875140 res!594794) b!875141))

(assert (= (and b!875141 res!594791) b!875144))

(assert (= (and b!875144 c!92439) b!875151))

(assert (= (and b!875144 (not c!92439)) b!875149))

(assert (= (or b!875151 b!875149) bm!38578))

(assert (= (or b!875151 b!875149) bm!38577))

(assert (= (and b!875144 (not res!594798)) b!875145))

(assert (= (and b!875142 condMapEmpty!27665) mapIsEmpty!27665))

(assert (= (and b!875142 (not condMapEmpty!27665)) mapNonEmpty!27665))

(get-info :version)

(assert (= (and mapNonEmpty!27665 ((_ is ValueCellFull!8246) mapValue!27665)) b!875143))

(assert (= (and b!875142 ((_ is ValueCellFull!8246) mapDefault!27665)) b!875152))

(assert (= start!74346 b!875142))

(declare-fun m!814499 () Bool)

(assert (=> b!875144 m!814499))

(assert (=> b!875144 m!814499))

(declare-fun m!814501 () Bool)

(assert (=> b!875144 m!814501))

(declare-fun m!814503 () Bool)

(assert (=> b!875144 m!814503))

(declare-fun m!814505 () Bool)

(assert (=> b!875147 m!814505))

(declare-fun m!814507 () Bool)

(assert (=> b!875146 m!814507))

(declare-fun m!814509 () Bool)

(assert (=> b!875138 m!814509))

(declare-fun m!814511 () Bool)

(assert (=> start!74346 m!814511))

(declare-fun m!814513 () Bool)

(assert (=> start!74346 m!814513))

(declare-fun m!814515 () Bool)

(assert (=> b!875151 m!814515))

(declare-fun m!814517 () Bool)

(assert (=> b!875140 m!814517))

(declare-fun m!814519 () Bool)

(assert (=> b!875145 m!814519))

(declare-fun m!814521 () Bool)

(assert (=> b!875141 m!814521))

(declare-fun m!814523 () Bool)

(assert (=> b!875141 m!814523))

(declare-fun m!814525 () Bool)

(assert (=> b!875141 m!814525))

(declare-fun m!814527 () Bool)

(assert (=> mapNonEmpty!27665 m!814527))

(assert (=> bm!38578 m!814519))

(declare-fun m!814529 () Bool)

(assert (=> bm!38577 m!814529))

(declare-fun m!814531 () Bool)

(assert (=> b!875150 m!814531))

(check-sat (not mapNonEmpty!27665) (not b!875138) b_and!24877 (not b!875151) (not bm!38577) (not b!875144) (not b_next!15127) (not bm!38578) (not b!875145) tp_is_empty!17371 (not b!875147) (not b!875141) (not b!875146) (not start!74346) (not b!875150))
(check-sat b_and!24877 (not b_next!15127))
