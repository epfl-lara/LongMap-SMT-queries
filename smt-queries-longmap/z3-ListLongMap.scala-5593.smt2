; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73344 () Bool)

(assert start!73344)

(declare-fun b_free!14259 () Bool)

(declare-fun b_next!14259 () Bool)

(assert (=> start!73344 (= b_free!14259 (not b_next!14259))))

(declare-fun tp!50281 () Bool)

(declare-fun b_and!23615 () Bool)

(assert (=> start!73344 (= tp!50281 b_and!23615)))

(declare-fun b!855799 () Bool)

(declare-fun res!581223 () Bool)

(declare-fun e!477087 () Bool)

(assert (=> b!855799 (=> (not res!581223) (not e!477087))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48986 0))(
  ( (array!48987 (arr!23524 (Array (_ BitVec 32) (_ BitVec 64))) (size!23964 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48986)

(assert (=> b!855799 (= res!581223 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23964 _keys!868))))))

(declare-fun b!855800 () Bool)

(assert (=> b!855800 (= e!477087 false)))

(declare-datatypes ((V!26907 0))(
  ( (V!26908 (val!8245 Int)) )
))
(declare-fun v!557 () V!26907)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10868 0))(
  ( (tuple2!10869 (_1!5445 (_ BitVec 64)) (_2!5445 V!26907)) )
))
(declare-datatypes ((List!16681 0))(
  ( (Nil!16678) (Cons!16677 (h!17808 tuple2!10868) (t!23322 List!16681)) )
))
(declare-datatypes ((ListLongMap!9637 0))(
  ( (ListLongMap!9638 (toList!4834 List!16681)) )
))
(declare-fun lt!385764 () ListLongMap!9637)

(declare-datatypes ((ValueCell!7758 0))(
  ( (ValueCellFull!7758 (v!10670 V!26907)) (EmptyCell!7758) )
))
(declare-datatypes ((array!48988 0))(
  ( (array!48989 (arr!23525 (Array (_ BitVec 32) ValueCell!7758)) (size!23965 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48988)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26907)

(declare-fun zeroValue!654 () V!26907)

(declare-fun getCurrentListMapNoExtraKeys!2815 (array!48986 array!48988 (_ BitVec 32) (_ BitVec 32) V!26907 V!26907 (_ BitVec 32) Int) ListLongMap!9637)

(assert (=> b!855800 (= lt!385764 (getCurrentListMapNoExtraKeys!2815 _keys!868 (array!48989 (store (arr!23525 _values!688) i!612 (ValueCellFull!7758 v!557)) (size!23965 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385765 () ListLongMap!9637)

(assert (=> b!855800 (= lt!385765 (getCurrentListMapNoExtraKeys!2815 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855801 () Bool)

(declare-fun e!477086 () Bool)

(declare-fun tp_is_empty!16395 () Bool)

(assert (=> b!855801 (= e!477086 tp_is_empty!16395)))

(declare-fun b!855803 () Bool)

(declare-fun e!477088 () Bool)

(assert (=> b!855803 (= e!477088 tp_is_empty!16395)))

(declare-fun b!855804 () Bool)

(declare-fun res!581219 () Bool)

(assert (=> b!855804 (=> (not res!581219) (not e!477087))))

(assert (=> b!855804 (= res!581219 (and (= (size!23965 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23964 _keys!868) (size!23965 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26192 () Bool)

(declare-fun mapRes!26192 () Bool)

(declare-fun tp!50280 () Bool)

(assert (=> mapNonEmpty!26192 (= mapRes!26192 (and tp!50280 e!477088))))

(declare-fun mapValue!26192 () ValueCell!7758)

(declare-fun mapRest!26192 () (Array (_ BitVec 32) ValueCell!7758))

(declare-fun mapKey!26192 () (_ BitVec 32))

(assert (=> mapNonEmpty!26192 (= (arr!23525 _values!688) (store mapRest!26192 mapKey!26192 mapValue!26192))))

(declare-fun b!855805 () Bool)

(declare-fun res!581221 () Bool)

(assert (=> b!855805 (=> (not res!581221) (not e!477087))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855805 (= res!581221 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26192 () Bool)

(assert (=> mapIsEmpty!26192 mapRes!26192))

(declare-fun b!855806 () Bool)

(declare-fun res!581225 () Bool)

(assert (=> b!855806 (=> (not res!581225) (not e!477087))))

(assert (=> b!855806 (= res!581225 (and (= (select (arr!23524 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855807 () Bool)

(declare-fun res!581224 () Bool)

(assert (=> b!855807 (=> (not res!581224) (not e!477087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48986 (_ BitVec 32)) Bool)

(assert (=> b!855807 (= res!581224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855802 () Bool)

(declare-fun e!477085 () Bool)

(assert (=> b!855802 (= e!477085 (and e!477086 mapRes!26192))))

(declare-fun condMapEmpty!26192 () Bool)

(declare-fun mapDefault!26192 () ValueCell!7758)

(assert (=> b!855802 (= condMapEmpty!26192 (= (arr!23525 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7758)) mapDefault!26192)))))

(declare-fun res!581222 () Bool)

(assert (=> start!73344 (=> (not res!581222) (not e!477087))))

(assert (=> start!73344 (= res!581222 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23964 _keys!868))))))

(assert (=> start!73344 e!477087))

(assert (=> start!73344 tp_is_empty!16395))

(assert (=> start!73344 true))

(assert (=> start!73344 tp!50281))

(declare-fun array_inv!18642 (array!48986) Bool)

(assert (=> start!73344 (array_inv!18642 _keys!868)))

(declare-fun array_inv!18643 (array!48988) Bool)

(assert (=> start!73344 (and (array_inv!18643 _values!688) e!477085)))

(declare-fun b!855808 () Bool)

(declare-fun res!581220 () Bool)

(assert (=> b!855808 (=> (not res!581220) (not e!477087))))

(declare-datatypes ((List!16682 0))(
  ( (Nil!16679) (Cons!16678 (h!17809 (_ BitVec 64)) (t!23323 List!16682)) )
))
(declare-fun arrayNoDuplicates!0 (array!48986 (_ BitVec 32) List!16682) Bool)

(assert (=> b!855808 (= res!581220 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16679))))

(declare-fun b!855809 () Bool)

(declare-fun res!581218 () Bool)

(assert (=> b!855809 (=> (not res!581218) (not e!477087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855809 (= res!581218 (validMask!0 mask!1196))))

(assert (= (and start!73344 res!581222) b!855809))

(assert (= (and b!855809 res!581218) b!855804))

(assert (= (and b!855804 res!581219) b!855807))

(assert (= (and b!855807 res!581224) b!855808))

(assert (= (and b!855808 res!581220) b!855799))

(assert (= (and b!855799 res!581223) b!855805))

(assert (= (and b!855805 res!581221) b!855806))

(assert (= (and b!855806 res!581225) b!855800))

(assert (= (and b!855802 condMapEmpty!26192) mapIsEmpty!26192))

(assert (= (and b!855802 (not condMapEmpty!26192)) mapNonEmpty!26192))

(get-info :version)

(assert (= (and mapNonEmpty!26192 ((_ is ValueCellFull!7758) mapValue!26192)) b!855803))

(assert (= (and b!855802 ((_ is ValueCellFull!7758) mapDefault!26192)) b!855801))

(assert (= start!73344 b!855802))

(declare-fun m!796881 () Bool)

(assert (=> b!855809 m!796881))

(declare-fun m!796883 () Bool)

(assert (=> b!855800 m!796883))

(declare-fun m!796885 () Bool)

(assert (=> b!855800 m!796885))

(declare-fun m!796887 () Bool)

(assert (=> b!855800 m!796887))

(declare-fun m!796889 () Bool)

(assert (=> b!855808 m!796889))

(declare-fun m!796891 () Bool)

(assert (=> mapNonEmpty!26192 m!796891))

(declare-fun m!796893 () Bool)

(assert (=> start!73344 m!796893))

(declare-fun m!796895 () Bool)

(assert (=> start!73344 m!796895))

(declare-fun m!796897 () Bool)

(assert (=> b!855807 m!796897))

(declare-fun m!796899 () Bool)

(assert (=> b!855805 m!796899))

(declare-fun m!796901 () Bool)

(assert (=> b!855806 m!796901))

(check-sat (not start!73344) b_and!23615 (not b!855807) (not b!855809) (not b_next!14259) (not mapNonEmpty!26192) tp_is_empty!16395 (not b!855800) (not b!855808) (not b!855805))
(check-sat b_and!23615 (not b_next!14259))
