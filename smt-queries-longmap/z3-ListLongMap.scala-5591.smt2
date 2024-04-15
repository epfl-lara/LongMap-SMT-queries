; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73312 () Bool)

(assert start!73312)

(declare-fun b_free!14245 () Bool)

(declare-fun b_next!14245 () Bool)

(assert (=> start!73312 (= b_free!14245 (not b_next!14245))))

(declare-fun tp!50239 () Bool)

(declare-fun b_and!23575 () Bool)

(assert (=> start!73312 (= tp!50239 b_and!23575)))

(declare-fun res!580942 () Bool)

(declare-fun e!476832 () Bool)

(assert (=> start!73312 (=> (not res!580942) (not e!476832))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48945 0))(
  ( (array!48946 (arr!23504 (Array (_ BitVec 32) (_ BitVec 64))) (size!23946 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48945)

(assert (=> start!73312 (= res!580942 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23946 _keys!868))))))

(assert (=> start!73312 e!476832))

(declare-fun tp_is_empty!16381 () Bool)

(assert (=> start!73312 tp_is_empty!16381))

(assert (=> start!73312 true))

(assert (=> start!73312 tp!50239))

(declare-fun array_inv!18696 (array!48945) Bool)

(assert (=> start!73312 (array_inv!18696 _keys!868)))

(declare-datatypes ((V!26889 0))(
  ( (V!26890 (val!8238 Int)) )
))
(declare-datatypes ((ValueCell!7751 0))(
  ( (ValueCellFull!7751 (v!10657 V!26889)) (EmptyCell!7751) )
))
(declare-datatypes ((array!48947 0))(
  ( (array!48948 (arr!23505 (Array (_ BitVec 32) ValueCell!7751)) (size!23947 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48947)

(declare-fun e!476831 () Bool)

(declare-fun array_inv!18697 (array!48947) Bool)

(assert (=> start!73312 (and (array_inv!18697 _values!688) e!476831)))

(declare-fun b!855329 () Bool)

(declare-fun res!580941 () Bool)

(assert (=> b!855329 (=> (not res!580941) (not e!476832))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!855329 (= res!580941 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23946 _keys!868))))))

(declare-fun b!855330 () Bool)

(declare-fun e!476834 () Bool)

(assert (=> b!855330 (= e!476834 tp_is_empty!16381)))

(declare-fun b!855331 () Bool)

(declare-fun e!476833 () Bool)

(assert (=> b!855331 (= e!476833 tp_is_empty!16381)))

(declare-fun b!855332 () Bool)

(assert (=> b!855332 (= e!476832 false)))

(declare-fun v!557 () V!26889)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10864 0))(
  ( (tuple2!10865 (_1!5443 (_ BitVec 64)) (_2!5443 V!26889)) )
))
(declare-datatypes ((List!16675 0))(
  ( (Nil!16672) (Cons!16671 (h!17802 tuple2!10864) (t!23307 List!16675)) )
))
(declare-datatypes ((ListLongMap!9623 0))(
  ( (ListLongMap!9624 (toList!4827 List!16675)) )
))
(declare-fun lt!385486 () ListLongMap!9623)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26889)

(declare-fun zeroValue!654 () V!26889)

(declare-fun getCurrentListMapNoExtraKeys!2834 (array!48945 array!48947 (_ BitVec 32) (_ BitVec 32) V!26889 V!26889 (_ BitVec 32) Int) ListLongMap!9623)

(assert (=> b!855332 (= lt!385486 (getCurrentListMapNoExtraKeys!2834 _keys!868 (array!48948 (store (arr!23505 _values!688) i!612 (ValueCellFull!7751 v!557)) (size!23947 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385487 () ListLongMap!9623)

(assert (=> b!855332 (= lt!385487 (getCurrentListMapNoExtraKeys!2834 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855333 () Bool)

(declare-fun res!580945 () Bool)

(assert (=> b!855333 (=> (not res!580945) (not e!476832))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!855333 (= res!580945 (and (= (select (arr!23504 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855334 () Bool)

(declare-fun mapRes!26171 () Bool)

(assert (=> b!855334 (= e!476831 (and e!476834 mapRes!26171))))

(declare-fun condMapEmpty!26171 () Bool)

(declare-fun mapDefault!26171 () ValueCell!7751)

(assert (=> b!855334 (= condMapEmpty!26171 (= (arr!23505 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7751)) mapDefault!26171)))))

(declare-fun mapIsEmpty!26171 () Bool)

(assert (=> mapIsEmpty!26171 mapRes!26171))

(declare-fun b!855335 () Bool)

(declare-fun res!580946 () Bool)

(assert (=> b!855335 (=> (not res!580946) (not e!476832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855335 (= res!580946 (validMask!0 mask!1196))))

(declare-fun b!855336 () Bool)

(declare-fun res!580947 () Bool)

(assert (=> b!855336 (=> (not res!580947) (not e!476832))))

(declare-datatypes ((List!16676 0))(
  ( (Nil!16673) (Cons!16672 (h!17803 (_ BitVec 64)) (t!23308 List!16676)) )
))
(declare-fun arrayNoDuplicates!0 (array!48945 (_ BitVec 32) List!16676) Bool)

(assert (=> b!855336 (= res!580947 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16673))))

(declare-fun b!855337 () Bool)

(declare-fun res!580944 () Bool)

(assert (=> b!855337 (=> (not res!580944) (not e!476832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48945 (_ BitVec 32)) Bool)

(assert (=> b!855337 (= res!580944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!26171 () Bool)

(declare-fun tp!50240 () Bool)

(assert (=> mapNonEmpty!26171 (= mapRes!26171 (and tp!50240 e!476833))))

(declare-fun mapRest!26171 () (Array (_ BitVec 32) ValueCell!7751))

(declare-fun mapValue!26171 () ValueCell!7751)

(declare-fun mapKey!26171 () (_ BitVec 32))

(assert (=> mapNonEmpty!26171 (= (arr!23505 _values!688) (store mapRest!26171 mapKey!26171 mapValue!26171))))

(declare-fun b!855338 () Bool)

(declare-fun res!580943 () Bool)

(assert (=> b!855338 (=> (not res!580943) (not e!476832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855338 (= res!580943 (validKeyInArray!0 k0!854))))

(declare-fun b!855339 () Bool)

(declare-fun res!580940 () Bool)

(assert (=> b!855339 (=> (not res!580940) (not e!476832))))

(assert (=> b!855339 (= res!580940 (and (= (size!23947 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23946 _keys!868) (size!23947 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73312 res!580942) b!855335))

(assert (= (and b!855335 res!580946) b!855339))

(assert (= (and b!855339 res!580940) b!855337))

(assert (= (and b!855337 res!580944) b!855336))

(assert (= (and b!855336 res!580947) b!855329))

(assert (= (and b!855329 res!580941) b!855338))

(assert (= (and b!855338 res!580943) b!855333))

(assert (= (and b!855333 res!580945) b!855332))

(assert (= (and b!855334 condMapEmpty!26171) mapIsEmpty!26171))

(assert (= (and b!855334 (not condMapEmpty!26171)) mapNonEmpty!26171))

(get-info :version)

(assert (= (and mapNonEmpty!26171 ((_ is ValueCellFull!7751) mapValue!26171)) b!855331))

(assert (= (and b!855334 ((_ is ValueCellFull!7751) mapDefault!26171)) b!855330))

(assert (= start!73312 b!855334))

(declare-fun m!795969 () Bool)

(assert (=> b!855337 m!795969))

(declare-fun m!795971 () Bool)

(assert (=> b!855333 m!795971))

(declare-fun m!795973 () Bool)

(assert (=> b!855336 m!795973))

(declare-fun m!795975 () Bool)

(assert (=> b!855335 m!795975))

(declare-fun m!795977 () Bool)

(assert (=> b!855332 m!795977))

(declare-fun m!795979 () Bool)

(assert (=> b!855332 m!795979))

(declare-fun m!795981 () Bool)

(assert (=> b!855332 m!795981))

(declare-fun m!795983 () Bool)

(assert (=> mapNonEmpty!26171 m!795983))

(declare-fun m!795985 () Bool)

(assert (=> b!855338 m!795985))

(declare-fun m!795987 () Bool)

(assert (=> start!73312 m!795987))

(declare-fun m!795989 () Bool)

(assert (=> start!73312 m!795989))

(check-sat (not b_next!14245) (not b!855337) (not b!855332) b_and!23575 tp_is_empty!16381 (not start!73312) (not b!855338) (not b!855335) (not b!855336) (not mapNonEmpty!26171))
(check-sat b_and!23575 (not b_next!14245))
