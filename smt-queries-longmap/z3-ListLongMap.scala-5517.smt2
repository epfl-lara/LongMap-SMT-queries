; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73054 () Bool)

(assert start!73054)

(declare-fun b_free!13801 () Bool)

(declare-fun b_next!13801 () Bool)

(assert (=> start!73054 (= b_free!13801 (not b_next!13801))))

(declare-fun tp!48907 () Bool)

(declare-fun b_and!22897 () Bool)

(assert (=> start!73054 (= tp!48907 b_and!22897)))

(declare-fun b!847003 () Bool)

(declare-fun e!472845 () Bool)

(declare-fun tp_is_empty!15937 () Bool)

(assert (=> b!847003 (= e!472845 tp_is_empty!15937)))

(declare-fun b!847004 () Bool)

(declare-fun res!575173 () Bool)

(declare-fun e!472847 () Bool)

(assert (=> b!847004 (=> (not res!575173) (not e!472847))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847004 (= res!575173 (validKeyInArray!0 k0!854))))

(declare-fun res!575171 () Bool)

(assert (=> start!73054 (=> (not res!575171) (not e!472847))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48137 0))(
  ( (array!48138 (arr!23095 (Array (_ BitVec 32) (_ BitVec 64))) (size!23536 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48137)

(assert (=> start!73054 (= res!575171 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23536 _keys!868))))))

(assert (=> start!73054 e!472847))

(assert (=> start!73054 tp_is_empty!15937))

(assert (=> start!73054 true))

(assert (=> start!73054 tp!48907))

(declare-fun array_inv!18400 (array!48137) Bool)

(assert (=> start!73054 (array_inv!18400 _keys!868)))

(declare-datatypes ((V!26297 0))(
  ( (V!26298 (val!8016 Int)) )
))
(declare-datatypes ((ValueCell!7529 0))(
  ( (ValueCellFull!7529 (v!10441 V!26297)) (EmptyCell!7529) )
))
(declare-datatypes ((array!48139 0))(
  ( (array!48140 (arr!23096 (Array (_ BitVec 32) ValueCell!7529)) (size!23537 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48139)

(declare-fun e!472846 () Bool)

(declare-fun array_inv!18401 (array!48139) Bool)

(assert (=> start!73054 (and (array_inv!18401 _values!688) e!472846)))

(declare-fun b!847005 () Bool)

(declare-fun mapRes!25505 () Bool)

(assert (=> b!847005 (= e!472846 (and e!472845 mapRes!25505))))

(declare-fun condMapEmpty!25505 () Bool)

(declare-fun mapDefault!25505 () ValueCell!7529)

(assert (=> b!847005 (= condMapEmpty!25505 (= (arr!23096 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7529)) mapDefault!25505)))))

(declare-fun b!847006 () Bool)

(declare-fun res!575170 () Bool)

(assert (=> b!847006 (=> (not res!575170) (not e!472847))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48137 (_ BitVec 32)) Bool)

(assert (=> b!847006 (= res!575170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847007 () Bool)

(declare-fun e!472849 () Bool)

(assert (=> b!847007 (= e!472849 tp_is_empty!15937)))

(declare-fun b!847008 () Bool)

(declare-fun res!575172 () Bool)

(assert (=> b!847008 (=> (not res!575172) (not e!472847))))

(declare-datatypes ((List!16262 0))(
  ( (Nil!16259) (Cons!16258 (h!17395 (_ BitVec 64)) (t!22625 List!16262)) )
))
(declare-fun arrayNoDuplicates!0 (array!48137 (_ BitVec 32) List!16262) Bool)

(assert (=> b!847008 (= res!575172 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16259))))

(declare-fun b!847009 () Bool)

(assert (=> b!847009 (= e!472847 false)))

(declare-fun v!557 () V!26297)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10394 0))(
  ( (tuple2!10395 (_1!5208 (_ BitVec 64)) (_2!5208 V!26297)) )
))
(declare-datatypes ((List!16263 0))(
  ( (Nil!16260) (Cons!16259 (h!17396 tuple2!10394) (t!22626 List!16263)) )
))
(declare-datatypes ((ListLongMap!9165 0))(
  ( (ListLongMap!9166 (toList!4598 List!16263)) )
))
(declare-fun lt!381836 () ListLongMap!9165)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26297)

(declare-fun zeroValue!654 () V!26297)

(declare-fun getCurrentListMapNoExtraKeys!2656 (array!48137 array!48139 (_ BitVec 32) (_ BitVec 32) V!26297 V!26297 (_ BitVec 32) Int) ListLongMap!9165)

(assert (=> b!847009 (= lt!381836 (getCurrentListMapNoExtraKeys!2656 _keys!868 (array!48140 (store (arr!23096 _values!688) i!612 (ValueCellFull!7529 v!557)) (size!23537 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381835 () ListLongMap!9165)

(assert (=> b!847009 (= lt!381835 (getCurrentListMapNoExtraKeys!2656 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847010 () Bool)

(declare-fun res!575166 () Bool)

(assert (=> b!847010 (=> (not res!575166) (not e!472847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847010 (= res!575166 (validMask!0 mask!1196))))

(declare-fun b!847011 () Bool)

(declare-fun res!575167 () Bool)

(assert (=> b!847011 (=> (not res!575167) (not e!472847))))

(assert (=> b!847011 (= res!575167 (and (= (select (arr!23095 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!847012 () Bool)

(declare-fun res!575168 () Bool)

(assert (=> b!847012 (=> (not res!575168) (not e!472847))))

(assert (=> b!847012 (= res!575168 (and (= (size!23537 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23536 _keys!868) (size!23537 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25505 () Bool)

(declare-fun tp!48908 () Bool)

(assert (=> mapNonEmpty!25505 (= mapRes!25505 (and tp!48908 e!472849))))

(declare-fun mapRest!25505 () (Array (_ BitVec 32) ValueCell!7529))

(declare-fun mapValue!25505 () ValueCell!7529)

(declare-fun mapKey!25505 () (_ BitVec 32))

(assert (=> mapNonEmpty!25505 (= (arr!23096 _values!688) (store mapRest!25505 mapKey!25505 mapValue!25505))))

(declare-fun mapIsEmpty!25505 () Bool)

(assert (=> mapIsEmpty!25505 mapRes!25505))

(declare-fun b!847013 () Bool)

(declare-fun res!575169 () Bool)

(assert (=> b!847013 (=> (not res!575169) (not e!472847))))

(assert (=> b!847013 (= res!575169 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23536 _keys!868))))))

(assert (= (and start!73054 res!575171) b!847010))

(assert (= (and b!847010 res!575166) b!847012))

(assert (= (and b!847012 res!575168) b!847006))

(assert (= (and b!847006 res!575170) b!847008))

(assert (= (and b!847008 res!575172) b!847013))

(assert (= (and b!847013 res!575169) b!847004))

(assert (= (and b!847004 res!575173) b!847011))

(assert (= (and b!847011 res!575167) b!847009))

(assert (= (and b!847005 condMapEmpty!25505) mapIsEmpty!25505))

(assert (= (and b!847005 (not condMapEmpty!25505)) mapNonEmpty!25505))

(get-info :version)

(assert (= (and mapNonEmpty!25505 ((_ is ValueCellFull!7529) mapValue!25505)) b!847007))

(assert (= (and b!847005 ((_ is ValueCellFull!7529) mapDefault!25505)) b!847003))

(assert (= start!73054 b!847005))

(declare-fun m!788903 () Bool)

(assert (=> b!847004 m!788903))

(declare-fun m!788905 () Bool)

(assert (=> b!847010 m!788905))

(declare-fun m!788907 () Bool)

(assert (=> b!847006 m!788907))

(declare-fun m!788909 () Bool)

(assert (=> b!847009 m!788909))

(declare-fun m!788911 () Bool)

(assert (=> b!847009 m!788911))

(declare-fun m!788913 () Bool)

(assert (=> b!847009 m!788913))

(declare-fun m!788915 () Bool)

(assert (=> mapNonEmpty!25505 m!788915))

(declare-fun m!788917 () Bool)

(assert (=> b!847011 m!788917))

(declare-fun m!788919 () Bool)

(assert (=> start!73054 m!788919))

(declare-fun m!788921 () Bool)

(assert (=> start!73054 m!788921))

(declare-fun m!788923 () Bool)

(assert (=> b!847008 m!788923))

(check-sat (not mapNonEmpty!25505) (not b!847006) (not b_next!13801) tp_is_empty!15937 (not start!73054) (not b!847008) b_and!22897 (not b!847009) (not b!847010) (not b!847004))
(check-sat b_and!22897 (not b_next!13801))
