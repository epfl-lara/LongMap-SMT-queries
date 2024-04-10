; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74554 () Bool)

(assert start!74554)

(declare-fun b_free!15243 () Bool)

(declare-fun b_next!15243 () Bool)

(assert (=> start!74554 (= b_free!15243 (not b_next!15243))))

(declare-fun tp!53411 () Bool)

(declare-fun b_and!25119 () Bool)

(assert (=> start!74554 (= tp!53411 b_and!25119)))

(declare-fun res!596713 () Bool)

(declare-fun e!488859 () Bool)

(assert (=> start!74554 (=> (not res!596713) (not e!488859))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51100 0))(
  ( (array!51101 (arr!24576 (Array (_ BitVec 32) (_ BitVec 64))) (size!25016 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51100)

(assert (=> start!74554 (= res!596713 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25016 _keys!868))))))

(assert (=> start!74554 e!488859))

(declare-fun tp_is_empty!17487 () Bool)

(assert (=> start!74554 tp_is_empty!17487))

(assert (=> start!74554 true))

(assert (=> start!74554 tp!53411))

(declare-fun array_inv!19372 (array!51100) Bool)

(assert (=> start!74554 (array_inv!19372 _keys!868)))

(declare-datatypes ((V!28363 0))(
  ( (V!28364 (val!8791 Int)) )
))
(declare-datatypes ((ValueCell!8304 0))(
  ( (ValueCellFull!8304 (v!11231 V!28363)) (EmptyCell!8304) )
))
(declare-datatypes ((array!51102 0))(
  ( (array!51103 (arr!24577 (Array (_ BitVec 32) ValueCell!8304)) (size!25017 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51102)

(declare-fun e!488856 () Bool)

(declare-fun array_inv!19373 (array!51102) Bool)

(assert (=> start!74554 (and (array_inv!19373 _values!688) e!488856)))

(declare-fun b!878345 () Bool)

(declare-fun res!596716 () Bool)

(assert (=> b!878345 (=> (not res!596716) (not e!488859))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51100 (_ BitVec 32)) Bool)

(assert (=> b!878345 (= res!596716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878346 () Bool)

(declare-fun res!596717 () Bool)

(assert (=> b!878346 (=> (not res!596717) (not e!488859))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!878346 (= res!596717 (and (= (select (arr!24576 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878347 () Bool)

(declare-fun res!596715 () Bool)

(assert (=> b!878347 (=> (not res!596715) (not e!488859))))

(assert (=> b!878347 (= res!596715 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25016 _keys!868))))))

(declare-fun b!878348 () Bool)

(declare-fun e!488857 () Bool)

(assert (=> b!878348 (= e!488857 tp_is_empty!17487)))

(declare-fun b!878349 () Bool)

(declare-fun res!596719 () Bool)

(assert (=> b!878349 (=> (not res!596719) (not e!488859))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!878349 (= res!596719 (and (= (size!25017 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25016 _keys!868) (size!25017 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878350 () Bool)

(declare-fun e!488858 () Bool)

(assert (=> b!878350 (= e!488858 tp_is_empty!17487)))

(declare-fun mapIsEmpty!27846 () Bool)

(declare-fun mapRes!27846 () Bool)

(assert (=> mapIsEmpty!27846 mapRes!27846))

(declare-fun b!878351 () Bool)

(declare-fun res!596720 () Bool)

(assert (=> b!878351 (=> (not res!596720) (not e!488859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878351 (= res!596720 (validMask!0 mask!1196))))

(declare-fun b!878352 () Bool)

(assert (=> b!878352 (= e!488859 false)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11626 0))(
  ( (tuple2!11627 (_1!5824 (_ BitVec 64)) (_2!5824 V!28363)) )
))
(declare-datatypes ((List!17441 0))(
  ( (Nil!17438) (Cons!17437 (h!18568 tuple2!11626) (t!24530 List!17441)) )
))
(declare-datatypes ((ListLongMap!10395 0))(
  ( (ListLongMap!10396 (toList!5213 List!17441)) )
))
(declare-fun lt!397238 () ListLongMap!10395)

(declare-fun minValue!654 () V!28363)

(declare-fun zeroValue!654 () V!28363)

(declare-fun v!557 () V!28363)

(declare-fun getCurrentListMapNoExtraKeys!3180 (array!51100 array!51102 (_ BitVec 32) (_ BitVec 32) V!28363 V!28363 (_ BitVec 32) Int) ListLongMap!10395)

(assert (=> b!878352 (= lt!397238 (getCurrentListMapNoExtraKeys!3180 _keys!868 (array!51103 (store (arr!24577 _values!688) i!612 (ValueCellFull!8304 v!557)) (size!25017 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397239 () ListLongMap!10395)

(assert (=> b!878352 (= lt!397239 (getCurrentListMapNoExtraKeys!3180 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878353 () Bool)

(declare-fun res!596718 () Bool)

(assert (=> b!878353 (=> (not res!596718) (not e!488859))))

(declare-datatypes ((List!17442 0))(
  ( (Nil!17439) (Cons!17438 (h!18569 (_ BitVec 64)) (t!24531 List!17442)) )
))
(declare-fun arrayNoDuplicates!0 (array!51100 (_ BitVec 32) List!17442) Bool)

(assert (=> b!878353 (= res!596718 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17439))))

(declare-fun b!878354 () Bool)

(assert (=> b!878354 (= e!488856 (and e!488858 mapRes!27846))))

(declare-fun condMapEmpty!27846 () Bool)

(declare-fun mapDefault!27846 () ValueCell!8304)

(assert (=> b!878354 (= condMapEmpty!27846 (= (arr!24577 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8304)) mapDefault!27846)))))

(declare-fun mapNonEmpty!27846 () Bool)

(declare-fun tp!53410 () Bool)

(assert (=> mapNonEmpty!27846 (= mapRes!27846 (and tp!53410 e!488857))))

(declare-fun mapValue!27846 () ValueCell!8304)

(declare-fun mapKey!27846 () (_ BitVec 32))

(declare-fun mapRest!27846 () (Array (_ BitVec 32) ValueCell!8304))

(assert (=> mapNonEmpty!27846 (= (arr!24577 _values!688) (store mapRest!27846 mapKey!27846 mapValue!27846))))

(declare-fun b!878355 () Bool)

(declare-fun res!596714 () Bool)

(assert (=> b!878355 (=> (not res!596714) (not e!488859))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878355 (= res!596714 (validKeyInArray!0 k0!854))))

(assert (= (and start!74554 res!596713) b!878351))

(assert (= (and b!878351 res!596720) b!878349))

(assert (= (and b!878349 res!596719) b!878345))

(assert (= (and b!878345 res!596716) b!878353))

(assert (= (and b!878353 res!596718) b!878347))

(assert (= (and b!878347 res!596715) b!878355))

(assert (= (and b!878355 res!596714) b!878346))

(assert (= (and b!878346 res!596717) b!878352))

(assert (= (and b!878354 condMapEmpty!27846) mapIsEmpty!27846))

(assert (= (and b!878354 (not condMapEmpty!27846)) mapNonEmpty!27846))

(get-info :version)

(assert (= (and mapNonEmpty!27846 ((_ is ValueCellFull!8304) mapValue!27846)) b!878348))

(assert (= (and b!878354 ((_ is ValueCellFull!8304) mapDefault!27846)) b!878350))

(assert (= start!74554 b!878354))

(declare-fun m!818247 () Bool)

(assert (=> b!878346 m!818247))

(declare-fun m!818249 () Bool)

(assert (=> b!878351 m!818249))

(declare-fun m!818251 () Bool)

(assert (=> mapNonEmpty!27846 m!818251))

(declare-fun m!818253 () Bool)

(assert (=> start!74554 m!818253))

(declare-fun m!818255 () Bool)

(assert (=> start!74554 m!818255))

(declare-fun m!818257 () Bool)

(assert (=> b!878352 m!818257))

(declare-fun m!818259 () Bool)

(assert (=> b!878352 m!818259))

(declare-fun m!818261 () Bool)

(assert (=> b!878352 m!818261))

(declare-fun m!818263 () Bool)

(assert (=> b!878353 m!818263))

(declare-fun m!818265 () Bool)

(assert (=> b!878345 m!818265))

(declare-fun m!818267 () Bool)

(assert (=> b!878355 m!818267))

(check-sat (not b!878353) (not b!878355) (not b_next!15243) tp_is_empty!17487 b_and!25119 (not start!74554) (not b!878345) (not b!878352) (not b!878351) (not mapNonEmpty!27846))
(check-sat b_and!25119 (not b_next!15243))
