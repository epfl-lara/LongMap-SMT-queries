; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73546 () Bool)

(assert start!73546)

(declare-fun b_free!14293 () Bool)

(declare-fun b_next!14293 () Bool)

(assert (=> start!73546 (= b_free!14293 (not b_next!14293))))

(declare-fun tp!50383 () Bool)

(declare-fun b_and!23659 () Bool)

(assert (=> start!73546 (= tp!50383 b_and!23659)))

(declare-fun mapNonEmpty!26243 () Bool)

(declare-fun mapRes!26243 () Bool)

(declare-fun tp!50384 () Bool)

(declare-fun e!477960 () Bool)

(assert (=> mapNonEmpty!26243 (= mapRes!26243 (and tp!50384 e!477960))))

(declare-fun mapKey!26243 () (_ BitVec 32))

(declare-datatypes ((V!26953 0))(
  ( (V!26954 (val!8262 Int)) )
))
(declare-datatypes ((ValueCell!7775 0))(
  ( (ValueCellFull!7775 (v!10687 V!26953)) (EmptyCell!7775) )
))
(declare-fun mapRest!26243 () (Array (_ BitVec 32) ValueCell!7775))

(declare-fun mapValue!26243 () ValueCell!7775)

(declare-datatypes ((array!49099 0))(
  ( (array!49100 (arr!23576 (Array (_ BitVec 32) ValueCell!7775)) (size!24017 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49099)

(assert (=> mapNonEmpty!26243 (= (arr!23576 _values!688) (store mapRest!26243 mapKey!26243 mapValue!26243))))

(declare-fun b!857302 () Bool)

(declare-fun res!582010 () Bool)

(declare-fun e!477962 () Bool)

(assert (=> b!857302 (=> (not res!582010) (not e!477962))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49101 0))(
  ( (array!49102 (arr!23577 (Array (_ BitVec 32) (_ BitVec 64))) (size!24018 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49101)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!857302 (= res!582010 (and (= (size!24017 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24018 _keys!868) (size!24017 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857303 () Bool)

(declare-fun res!582015 () Bool)

(assert (=> b!857303 (=> (not res!582015) (not e!477962))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857303 (= res!582015 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24018 _keys!868))))))

(declare-fun mapIsEmpty!26243 () Bool)

(assert (=> mapIsEmpty!26243 mapRes!26243))

(declare-fun b!857304 () Bool)

(declare-fun res!582013 () Bool)

(assert (=> b!857304 (=> (not res!582013) (not e!477962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857304 (= res!582013 (validMask!0 mask!1196))))

(declare-fun b!857301 () Bool)

(declare-fun res!582011 () Bool)

(assert (=> b!857301 (=> (not res!582011) (not e!477962))))

(declare-datatypes ((List!16661 0))(
  ( (Nil!16658) (Cons!16657 (h!17794 (_ BitVec 64)) (t!23294 List!16661)) )
))
(declare-fun arrayNoDuplicates!0 (array!49101 (_ BitVec 32) List!16661) Bool)

(assert (=> b!857301 (= res!582011 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16658))))

(declare-fun res!582009 () Bool)

(assert (=> start!73546 (=> (not res!582009) (not e!477962))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73546 (= res!582009 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24018 _keys!868))))))

(assert (=> start!73546 e!477962))

(declare-fun tp_is_empty!16429 () Bool)

(assert (=> start!73546 tp_is_empty!16429))

(assert (=> start!73546 true))

(assert (=> start!73546 tp!50383))

(declare-fun array_inv!18732 (array!49101) Bool)

(assert (=> start!73546 (array_inv!18732 _keys!868)))

(declare-fun e!477961 () Bool)

(declare-fun array_inv!18733 (array!49099) Bool)

(assert (=> start!73546 (and (array_inv!18733 _values!688) e!477961)))

(declare-fun b!857305 () Bool)

(declare-fun res!582012 () Bool)

(assert (=> b!857305 (=> (not res!582012) (not e!477962))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!857305 (= res!582012 (and (= (select (arr!23577 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857306 () Bool)

(declare-fun e!477959 () Bool)

(assert (=> b!857306 (= e!477959 tp_is_empty!16429)))

(declare-fun b!857307 () Bool)

(declare-fun e!477964 () Bool)

(assert (=> b!857307 (= e!477962 e!477964)))

(declare-fun res!582016 () Bool)

(assert (=> b!857307 (=> (not res!582016) (not e!477964))))

(assert (=> b!857307 (= res!582016 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10816 0))(
  ( (tuple2!10817 (_1!5419 (_ BitVec 64)) (_2!5419 V!26953)) )
))
(declare-datatypes ((List!16662 0))(
  ( (Nil!16659) (Cons!16658 (h!17795 tuple2!10816) (t!23295 List!16662)) )
))
(declare-datatypes ((ListLongMap!9587 0))(
  ( (ListLongMap!9588 (toList!4809 List!16662)) )
))
(declare-fun lt!386304 () ListLongMap!9587)

(declare-fun lt!386303 () array!49099)

(declare-fun minValue!654 () V!26953)

(declare-fun zeroValue!654 () V!26953)

(declare-fun getCurrentListMapNoExtraKeys!2865 (array!49101 array!49099 (_ BitVec 32) (_ BitVec 32) V!26953 V!26953 (_ BitVec 32) Int) ListLongMap!9587)

(assert (=> b!857307 (= lt!386304 (getCurrentListMapNoExtraKeys!2865 _keys!868 lt!386303 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26953)

(assert (=> b!857307 (= lt!386303 (array!49100 (store (arr!23576 _values!688) i!612 (ValueCellFull!7775 v!557)) (size!24017 _values!688)))))

(declare-fun lt!386305 () ListLongMap!9587)

(assert (=> b!857307 (= lt!386305 (getCurrentListMapNoExtraKeys!2865 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857308 () Bool)

(assert (=> b!857308 (= e!477960 tp_is_empty!16429)))

(declare-fun b!857309 () Bool)

(assert (=> b!857309 (= e!477964 (not true))))

(declare-fun +!2222 (ListLongMap!9587 tuple2!10816) ListLongMap!9587)

(assert (=> b!857309 (= (getCurrentListMapNoExtraKeys!2865 _keys!868 lt!386303 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2222 (getCurrentListMapNoExtraKeys!2865 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10817 k0!854 v!557)))))

(declare-datatypes ((Unit!29200 0))(
  ( (Unit!29201) )
))
(declare-fun lt!386306 () Unit!29200)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!420 (array!49101 array!49099 (_ BitVec 32) (_ BitVec 32) V!26953 V!26953 (_ BitVec 32) (_ BitVec 64) V!26953 (_ BitVec 32) Int) Unit!29200)

(assert (=> b!857309 (= lt!386306 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!420 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857310 () Bool)

(declare-fun res!582014 () Bool)

(assert (=> b!857310 (=> (not res!582014) (not e!477962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49101 (_ BitVec 32)) Bool)

(assert (=> b!857310 (= res!582014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857311 () Bool)

(assert (=> b!857311 (= e!477961 (and e!477959 mapRes!26243))))

(declare-fun condMapEmpty!26243 () Bool)

(declare-fun mapDefault!26243 () ValueCell!7775)

(assert (=> b!857311 (= condMapEmpty!26243 (= (arr!23576 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7775)) mapDefault!26243)))))

(declare-fun b!857312 () Bool)

(declare-fun res!582008 () Bool)

(assert (=> b!857312 (=> (not res!582008) (not e!477962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857312 (= res!582008 (validKeyInArray!0 k0!854))))

(assert (= (and start!73546 res!582009) b!857304))

(assert (= (and b!857304 res!582013) b!857302))

(assert (= (and b!857302 res!582010) b!857310))

(assert (= (and b!857310 res!582014) b!857301))

(assert (= (and b!857301 res!582011) b!857303))

(assert (= (and b!857303 res!582015) b!857312))

(assert (= (and b!857312 res!582008) b!857305))

(assert (= (and b!857305 res!582012) b!857307))

(assert (= (and b!857307 res!582016) b!857309))

(assert (= (and b!857311 condMapEmpty!26243) mapIsEmpty!26243))

(assert (= (and b!857311 (not condMapEmpty!26243)) mapNonEmpty!26243))

(get-info :version)

(assert (= (and mapNonEmpty!26243 ((_ is ValueCellFull!7775) mapValue!26243)) b!857308))

(assert (= (and b!857311 ((_ is ValueCellFull!7775) mapDefault!26243)) b!857306))

(assert (= start!73546 b!857311))

(declare-fun m!798641 () Bool)

(assert (=> b!857304 m!798641))

(declare-fun m!798643 () Bool)

(assert (=> b!857310 m!798643))

(declare-fun m!798645 () Bool)

(assert (=> b!857301 m!798645))

(declare-fun m!798647 () Bool)

(assert (=> b!857309 m!798647))

(declare-fun m!798649 () Bool)

(assert (=> b!857309 m!798649))

(assert (=> b!857309 m!798649))

(declare-fun m!798651 () Bool)

(assert (=> b!857309 m!798651))

(declare-fun m!798653 () Bool)

(assert (=> b!857309 m!798653))

(declare-fun m!798655 () Bool)

(assert (=> b!857312 m!798655))

(declare-fun m!798657 () Bool)

(assert (=> mapNonEmpty!26243 m!798657))

(declare-fun m!798659 () Bool)

(assert (=> b!857307 m!798659))

(declare-fun m!798661 () Bool)

(assert (=> b!857307 m!798661))

(declare-fun m!798663 () Bool)

(assert (=> b!857307 m!798663))

(declare-fun m!798665 () Bool)

(assert (=> b!857305 m!798665))

(declare-fun m!798667 () Bool)

(assert (=> start!73546 m!798667))

(declare-fun m!798669 () Bool)

(assert (=> start!73546 m!798669))

(check-sat (not b!857301) (not b!857304) tp_is_empty!16429 (not b_next!14293) (not b!857312) (not mapNonEmpty!26243) (not b!857307) (not b!857310) (not b!857309) b_and!23659 (not start!73546))
(check-sat b_and!23659 (not b_next!14293))
