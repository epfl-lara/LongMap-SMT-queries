; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73318 () Bool)

(assert start!73318)

(declare-fun b_free!14251 () Bool)

(declare-fun b_next!14251 () Bool)

(assert (=> start!73318 (= b_free!14251 (not b_next!14251))))

(declare-fun tp!50257 () Bool)

(declare-fun b_and!23581 () Bool)

(assert (=> start!73318 (= tp!50257 b_and!23581)))

(declare-fun b!855428 () Bool)

(declare-fun e!476878 () Bool)

(declare-fun tp_is_empty!16387 () Bool)

(assert (=> b!855428 (= e!476878 tp_is_empty!16387)))

(declare-fun mapIsEmpty!26180 () Bool)

(declare-fun mapRes!26180 () Bool)

(assert (=> mapIsEmpty!26180 mapRes!26180))

(declare-fun b!855429 () Bool)

(declare-fun res!581014 () Bool)

(declare-fun e!476877 () Bool)

(assert (=> b!855429 (=> (not res!581014) (not e!476877))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855429 (= res!581014 (validKeyInArray!0 k0!854))))

(declare-fun b!855430 () Bool)

(declare-fun res!581017 () Bool)

(assert (=> b!855430 (=> (not res!581017) (not e!476877))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855430 (= res!581017 (validMask!0 mask!1196))))

(declare-fun b!855431 () Bool)

(declare-fun res!581012 () Bool)

(assert (=> b!855431 (=> (not res!581012) (not e!476877))))

(declare-datatypes ((array!48957 0))(
  ( (array!48958 (arr!23510 (Array (_ BitVec 32) (_ BitVec 64))) (size!23952 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48957)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48957 (_ BitVec 32)) Bool)

(assert (=> b!855431 (= res!581012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855432 () Bool)

(declare-fun e!476879 () Bool)

(assert (=> b!855432 (= e!476879 (and e!476878 mapRes!26180))))

(declare-fun condMapEmpty!26180 () Bool)

(declare-datatypes ((V!26897 0))(
  ( (V!26898 (val!8241 Int)) )
))
(declare-datatypes ((ValueCell!7754 0))(
  ( (ValueCellFull!7754 (v!10660 V!26897)) (EmptyCell!7754) )
))
(declare-datatypes ((array!48959 0))(
  ( (array!48960 (arr!23511 (Array (_ BitVec 32) ValueCell!7754)) (size!23953 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48959)

(declare-fun mapDefault!26180 () ValueCell!7754)

(assert (=> b!855432 (= condMapEmpty!26180 (= (arr!23511 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7754)) mapDefault!26180)))))

(declare-fun b!855434 () Bool)

(declare-fun e!476876 () Bool)

(assert (=> b!855434 (= e!476876 tp_is_empty!16387)))

(declare-fun b!855435 () Bool)

(declare-fun res!581016 () Bool)

(assert (=> b!855435 (=> (not res!581016) (not e!476877))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!855435 (= res!581016 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23952 _keys!868))))))

(declare-fun b!855436 () Bool)

(declare-fun res!581018 () Bool)

(assert (=> b!855436 (=> (not res!581018) (not e!476877))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!855436 (= res!581018 (and (= (size!23953 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23952 _keys!868) (size!23953 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855437 () Bool)

(assert (=> b!855437 (= e!476877 false)))

(declare-fun v!557 () V!26897)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10870 0))(
  ( (tuple2!10871 (_1!5446 (_ BitVec 64)) (_2!5446 V!26897)) )
))
(declare-datatypes ((List!16680 0))(
  ( (Nil!16677) (Cons!16676 (h!17807 tuple2!10870) (t!23312 List!16680)) )
))
(declare-datatypes ((ListLongMap!9629 0))(
  ( (ListLongMap!9630 (toList!4830 List!16680)) )
))
(declare-fun lt!385505 () ListLongMap!9629)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26897)

(declare-fun zeroValue!654 () V!26897)

(declare-fun getCurrentListMapNoExtraKeys!2837 (array!48957 array!48959 (_ BitVec 32) (_ BitVec 32) V!26897 V!26897 (_ BitVec 32) Int) ListLongMap!9629)

(assert (=> b!855437 (= lt!385505 (getCurrentListMapNoExtraKeys!2837 _keys!868 (array!48960 (store (arr!23511 _values!688) i!612 (ValueCellFull!7754 v!557)) (size!23953 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385504 () ListLongMap!9629)

(assert (=> b!855437 (= lt!385504 (getCurrentListMapNoExtraKeys!2837 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855438 () Bool)

(declare-fun res!581019 () Bool)

(assert (=> b!855438 (=> (not res!581019) (not e!476877))))

(declare-datatypes ((List!16681 0))(
  ( (Nil!16678) (Cons!16677 (h!17808 (_ BitVec 64)) (t!23313 List!16681)) )
))
(declare-fun arrayNoDuplicates!0 (array!48957 (_ BitVec 32) List!16681) Bool)

(assert (=> b!855438 (= res!581019 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16678))))

(declare-fun mapNonEmpty!26180 () Bool)

(declare-fun tp!50258 () Bool)

(assert (=> mapNonEmpty!26180 (= mapRes!26180 (and tp!50258 e!476876))))

(declare-fun mapValue!26180 () ValueCell!7754)

(declare-fun mapKey!26180 () (_ BitVec 32))

(declare-fun mapRest!26180 () (Array (_ BitVec 32) ValueCell!7754))

(assert (=> mapNonEmpty!26180 (= (arr!23511 _values!688) (store mapRest!26180 mapKey!26180 mapValue!26180))))

(declare-fun b!855433 () Bool)

(declare-fun res!581013 () Bool)

(assert (=> b!855433 (=> (not res!581013) (not e!476877))))

(assert (=> b!855433 (= res!581013 (and (= (select (arr!23510 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!581015 () Bool)

(assert (=> start!73318 (=> (not res!581015) (not e!476877))))

(assert (=> start!73318 (= res!581015 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23952 _keys!868))))))

(assert (=> start!73318 e!476877))

(assert (=> start!73318 tp_is_empty!16387))

(assert (=> start!73318 true))

(assert (=> start!73318 tp!50257))

(declare-fun array_inv!18700 (array!48957) Bool)

(assert (=> start!73318 (array_inv!18700 _keys!868)))

(declare-fun array_inv!18701 (array!48959) Bool)

(assert (=> start!73318 (and (array_inv!18701 _values!688) e!476879)))

(assert (= (and start!73318 res!581015) b!855430))

(assert (= (and b!855430 res!581017) b!855436))

(assert (= (and b!855436 res!581018) b!855431))

(assert (= (and b!855431 res!581012) b!855438))

(assert (= (and b!855438 res!581019) b!855435))

(assert (= (and b!855435 res!581016) b!855429))

(assert (= (and b!855429 res!581014) b!855433))

(assert (= (and b!855433 res!581013) b!855437))

(assert (= (and b!855432 condMapEmpty!26180) mapIsEmpty!26180))

(assert (= (and b!855432 (not condMapEmpty!26180)) mapNonEmpty!26180))

(get-info :version)

(assert (= (and mapNonEmpty!26180 ((_ is ValueCellFull!7754) mapValue!26180)) b!855434))

(assert (= (and b!855432 ((_ is ValueCellFull!7754) mapDefault!26180)) b!855428))

(assert (= start!73318 b!855432))

(declare-fun m!796035 () Bool)

(assert (=> start!73318 m!796035))

(declare-fun m!796037 () Bool)

(assert (=> start!73318 m!796037))

(declare-fun m!796039 () Bool)

(assert (=> mapNonEmpty!26180 m!796039))

(declare-fun m!796041 () Bool)

(assert (=> b!855430 m!796041))

(declare-fun m!796043 () Bool)

(assert (=> b!855433 m!796043))

(declare-fun m!796045 () Bool)

(assert (=> b!855429 m!796045))

(declare-fun m!796047 () Bool)

(assert (=> b!855438 m!796047))

(declare-fun m!796049 () Bool)

(assert (=> b!855437 m!796049))

(declare-fun m!796051 () Bool)

(assert (=> b!855437 m!796051))

(declare-fun m!796053 () Bool)

(assert (=> b!855437 m!796053))

(declare-fun m!796055 () Bool)

(assert (=> b!855431 m!796055))

(check-sat (not b_next!14251) (not b!855437) (not b!855438) (not b!855431) tp_is_empty!16387 (not b!855429) (not start!73318) (not mapNonEmpty!26180) (not b!855430) b_and!23581)
(check-sat b_and!23581 (not b_next!14251))
