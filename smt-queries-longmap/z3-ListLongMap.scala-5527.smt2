; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73114 () Bool)

(assert start!73114)

(declare-fun b_free!13861 () Bool)

(declare-fun b_next!13861 () Bool)

(assert (=> start!73114 (= b_free!13861 (not b_next!13861))))

(declare-fun tp!49088 () Bool)

(declare-fun b_and!22957 () Bool)

(assert (=> start!73114 (= tp!49088 b_and!22957)))

(declare-fun b!847993 () Bool)

(declare-fun e!473298 () Bool)

(declare-fun e!473297 () Bool)

(declare-fun mapRes!25595 () Bool)

(assert (=> b!847993 (= e!473298 (and e!473297 mapRes!25595))))

(declare-fun condMapEmpty!25595 () Bool)

(declare-datatypes ((V!26377 0))(
  ( (V!26378 (val!8046 Int)) )
))
(declare-datatypes ((ValueCell!7559 0))(
  ( (ValueCellFull!7559 (v!10471 V!26377)) (EmptyCell!7559) )
))
(declare-datatypes ((array!48257 0))(
  ( (array!48258 (arr!23155 (Array (_ BitVec 32) ValueCell!7559)) (size!23596 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48257)

(declare-fun mapDefault!25595 () ValueCell!7559)

(assert (=> b!847993 (= condMapEmpty!25595 (= (arr!23155 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7559)) mapDefault!25595)))))

(declare-fun mapIsEmpty!25595 () Bool)

(assert (=> mapIsEmpty!25595 mapRes!25595))

(declare-fun mapNonEmpty!25595 () Bool)

(declare-fun tp!49087 () Bool)

(declare-fun e!473295 () Bool)

(assert (=> mapNonEmpty!25595 (= mapRes!25595 (and tp!49087 e!473295))))

(declare-fun mapRest!25595 () (Array (_ BitVec 32) ValueCell!7559))

(declare-fun mapKey!25595 () (_ BitVec 32))

(declare-fun mapValue!25595 () ValueCell!7559)

(assert (=> mapNonEmpty!25595 (= (arr!23155 _values!688) (store mapRest!25595 mapKey!25595 mapValue!25595))))

(declare-fun b!847994 () Bool)

(declare-fun res!575888 () Bool)

(declare-fun e!473299 () Bool)

(assert (=> b!847994 (=> (not res!575888) (not e!473299))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847994 (= res!575888 (validMask!0 mask!1196))))

(declare-fun res!575887 () Bool)

(assert (=> start!73114 (=> (not res!575887) (not e!473299))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48259 0))(
  ( (array!48260 (arr!23156 (Array (_ BitVec 32) (_ BitVec 64))) (size!23597 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48259)

(assert (=> start!73114 (= res!575887 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23597 _keys!868))))))

(assert (=> start!73114 e!473299))

(declare-fun tp_is_empty!15997 () Bool)

(assert (=> start!73114 tp_is_empty!15997))

(assert (=> start!73114 true))

(assert (=> start!73114 tp!49088))

(declare-fun array_inv!18442 (array!48259) Bool)

(assert (=> start!73114 (array_inv!18442 _keys!868)))

(declare-fun array_inv!18443 (array!48257) Bool)

(assert (=> start!73114 (and (array_inv!18443 _values!688) e!473298)))

(declare-fun b!847995 () Bool)

(declare-fun res!575891 () Bool)

(assert (=> b!847995 (=> (not res!575891) (not e!473299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48259 (_ BitVec 32)) Bool)

(assert (=> b!847995 (= res!575891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847996 () Bool)

(declare-fun res!575893 () Bool)

(assert (=> b!847996 (=> (not res!575893) (not e!473299))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847996 (= res!575893 (validKeyInArray!0 k0!854))))

(declare-fun b!847997 () Bool)

(assert (=> b!847997 (= e!473297 tp_is_empty!15997)))

(declare-fun b!847998 () Bool)

(assert (=> b!847998 (= e!473299 false)))

(declare-fun v!557 () V!26377)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10434 0))(
  ( (tuple2!10435 (_1!5228 (_ BitVec 64)) (_2!5228 V!26377)) )
))
(declare-datatypes ((List!16306 0))(
  ( (Nil!16303) (Cons!16302 (h!17439 tuple2!10434) (t!22669 List!16306)) )
))
(declare-datatypes ((ListLongMap!9205 0))(
  ( (ListLongMap!9206 (toList!4618 List!16306)) )
))
(declare-fun lt!382016 () ListLongMap!9205)

(declare-fun minValue!654 () V!26377)

(declare-fun zeroValue!654 () V!26377)

(declare-fun getCurrentListMapNoExtraKeys!2676 (array!48259 array!48257 (_ BitVec 32) (_ BitVec 32) V!26377 V!26377 (_ BitVec 32) Int) ListLongMap!9205)

(assert (=> b!847998 (= lt!382016 (getCurrentListMapNoExtraKeys!2676 _keys!868 (array!48258 (store (arr!23155 _values!688) i!612 (ValueCellFull!7559 v!557)) (size!23596 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!382015 () ListLongMap!9205)

(assert (=> b!847998 (= lt!382015 (getCurrentListMapNoExtraKeys!2676 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847999 () Bool)

(declare-fun res!575890 () Bool)

(assert (=> b!847999 (=> (not res!575890) (not e!473299))))

(assert (=> b!847999 (= res!575890 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23597 _keys!868))))))

(declare-fun b!848000 () Bool)

(assert (=> b!848000 (= e!473295 tp_is_empty!15997)))

(declare-fun b!848001 () Bool)

(declare-fun res!575889 () Bool)

(assert (=> b!848001 (=> (not res!575889) (not e!473299))))

(assert (=> b!848001 (= res!575889 (and (= (select (arr!23156 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!848002 () Bool)

(declare-fun res!575892 () Bool)

(assert (=> b!848002 (=> (not res!575892) (not e!473299))))

(declare-datatypes ((List!16307 0))(
  ( (Nil!16304) (Cons!16303 (h!17440 (_ BitVec 64)) (t!22670 List!16307)) )
))
(declare-fun arrayNoDuplicates!0 (array!48259 (_ BitVec 32) List!16307) Bool)

(assert (=> b!848002 (= res!575892 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16304))))

(declare-fun b!848003 () Bool)

(declare-fun res!575886 () Bool)

(assert (=> b!848003 (=> (not res!575886) (not e!473299))))

(assert (=> b!848003 (= res!575886 (and (= (size!23596 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23597 _keys!868) (size!23596 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73114 res!575887) b!847994))

(assert (= (and b!847994 res!575888) b!848003))

(assert (= (and b!848003 res!575886) b!847995))

(assert (= (and b!847995 res!575891) b!848002))

(assert (= (and b!848002 res!575892) b!847999))

(assert (= (and b!847999 res!575890) b!847996))

(assert (= (and b!847996 res!575893) b!848001))

(assert (= (and b!848001 res!575889) b!847998))

(assert (= (and b!847993 condMapEmpty!25595) mapIsEmpty!25595))

(assert (= (and b!847993 (not condMapEmpty!25595)) mapNonEmpty!25595))

(get-info :version)

(assert (= (and mapNonEmpty!25595 ((_ is ValueCellFull!7559) mapValue!25595)) b!848000))

(assert (= (and b!847993 ((_ is ValueCellFull!7559) mapDefault!25595)) b!847997))

(assert (= start!73114 b!847993))

(declare-fun m!789563 () Bool)

(assert (=> b!848001 m!789563))

(declare-fun m!789565 () Bool)

(assert (=> b!847994 m!789565))

(declare-fun m!789567 () Bool)

(assert (=> b!847996 m!789567))

(declare-fun m!789569 () Bool)

(assert (=> b!848002 m!789569))

(declare-fun m!789571 () Bool)

(assert (=> start!73114 m!789571))

(declare-fun m!789573 () Bool)

(assert (=> start!73114 m!789573))

(declare-fun m!789575 () Bool)

(assert (=> mapNonEmpty!25595 m!789575))

(declare-fun m!789577 () Bool)

(assert (=> b!847998 m!789577))

(declare-fun m!789579 () Bool)

(assert (=> b!847998 m!789579))

(declare-fun m!789581 () Bool)

(assert (=> b!847998 m!789581))

(declare-fun m!789583 () Bool)

(assert (=> b!847995 m!789583))

(check-sat (not mapNonEmpty!25595) (not b_next!13861) (not b!847996) (not b!847995) b_and!22957 (not b!847998) (not start!73114) (not b!847994) (not b!848002) tp_is_empty!15997)
(check-sat b_and!22957 (not b_next!13861))
